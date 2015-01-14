--[[
Illarion Server

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, either version 3 of the License, or (at your option) any
later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU Affero General Public License for more
details.

You should have received a copy of the GNU Affero General Public License along
with this program.  If not, see <http://www.gnu.org/licenses/>.
]]
local character = require("base.character")
local common = require("base.common")

local function _isNumber(value)
    return type(value) == "number"
end

local function _isTable(value)
    return type(value) == "table"
end

return function(params)
    local self = {}
    local range = 5
    local probability = 0.03
    local gfxId = 41
    local sfxId = 0
    local usedMovepoints = 20

    if _isTable(params) then
        if params.probability ~= nil then
            if _isNumber(params.probability) then
                probability = tonumber(params.probability)
                if (probability <= 0) or (probability > 1) then
                    error("The probability for the spell is set to a illegal value.")
                end
            else
                error("The probability for the spell was set to something, but not to a number.")
            end
        end

        if params.range ~= nil then
            if _isNumber(params.range) then
                range = tonumber(params.range)
                if range <= 0 then
                    error("The range value for a warping spell was set to 0 or less.")
                end
            else
                error("The range value for the spell was set to something, but not to a number.")
            end
        end

        if params.gfxId ~= nil then
            if _isNumber(params.gfxId) then
                gfxId = tonumber(params.gfxId)
            else
                error("The gfx id for the spell was set to something, but not to a number.")
            end
        end

        if params.sfxId ~= nil then
            if _isNumber(params.sfxId) then
                sfxId = tonumber(params.sfxId)
            else
                error("The sound effect id for the spell was set to something, but not to a number.")
            end
        end

        if params.movepoints ~= nil then
            if _isNumber(params.movepoints) then
                usedMovepoints = tonumber(params.movepoints)
            else
                error("The required move points for the spell was set to something, but not to a number.")
            end
        end
    end

    function self.getAttackRange()
        return 0
    end

    local function isDistanceWeaponInSlot(char, slot)
        local item = char:getItemAt(slot)
        if item ~= nil then
            local weaponFound, weapon = world:getWeaponStruct(item.id)
            if weaponFound then
                return weapon.WeaponType == 7
            end
        end
        return false
    end

    -- Check if a character is a archer. Means that he has a distance weapon in either hand
    local function _isArcher(char)
        return isDistanceWeaponInSlot(char, Character.right_tool) or isDistanceWeaponInSlot(char, Character.left_tool)
    end

    local function _getAdjazentPlayers(pos)
        local result = {}
        for x = -1, 1 do
            for y = -1, 1 do
                if x ~= 0 or y ~= 0 then
                    local checkPos = position(pos.x + x, pos.y + y, pos.z)
                    if world:isCharacterOnField(checkPos) then
                        local char = world:getCharacterOnField(checkPos)
                        if character.IsPlayer(char) and not character.IsDead(char) then
                            table.insert(result, char)
                        end
                    end
                end
            end
        end
        return result
    end

    local function _isValidWarpPosition(monster, warpTarget)
        local blockList = world:LoS(monster.pos, warpTarget)
        local obstructionIndex, obstruction
        if blockList ~= nil then
            obstructionIndex, obstruction = next(blockList)
            while obstruction ~= nil and (obstruction.TYPE == "CHARACTER" or
                    (obstruction.TYPE == "ITEM" and not obstruction.OBJECT:isLarge())) do
                obstructionIndex, obstruction = next(blockList, obstructionIndex)
            end
        end
        return obstruction == nil
    end

    function self.cast(monster, enemy)
        if Random.uniform() <= probability then
            local nearPlayers = _getAdjazentPlayers(monster.pos)
            local foundArcher
            local foundOther = false
            for _, player in pairs(nearPlayers) do
                if _isArcher(player) then
                    foundArcher = player
                else
                    foundOther = true
                end
            end

            local warpTarget
            local lookAtTarget = position(monster.pos.x, monster.pos.y, monster.pos.z)

            if not foundOther and foundArcher ~= nil then
                -- We are close to a archer and there is nobody around to protect him.
                -- There are two good options here. The first one is warp to another place around him and attack him
                -- from another side or stay right where you are to keep attacking on close combat. Both sucks for the
                -- archer.

                -- checking the fields around the archer for a possible new location
                for freePosition in common.GetFreePositions(foundArcher.pos, 1, true, true) do
                    local playersAroundNewLocation = _getAdjazentPlayers(monster.pos)
                    local badPosition = false
                    for _, player in pairs(nearPlayers) do
                        if not _isArcher(player) then
                            badPosition = true
                            break
                        end
                    end

                    if not badPosition and _isValidWarpPosition(monster, freePosition) then
                        warpTarget = freePosition
                        lookAtTarget = foundArcher.pos
                        break
                    end
                end
            elseif foundOther then
                -- There is someone around who is not a archer. We should keep away from a person like this.
                local bestTargetFound
                local hostileCount = math.huge
                for freePosition in common.GetFreePositions(monster.pos, range, true, true) do
                    if _isValidWarpPosition(monster, freePosition) then
                        local playersAroundNewLocation = _getAdjazentPlayers(freePosition)
                        local badPeopleCounter = 0
                        for _, player in pairs(playersAroundNewLocation) do
                            if not _isArcher(player) then
                                badPeopleCounter = badPeopleCounter + 1
                            end
                        end

                        if badPeopleCounter < hostileCount then
                            hostileCount = badPeopleCounter
                            bestTargetFound = freePosition
                            if badPeopleCounter == 0 then
                                break
                            end
                        end
                    end
                end

                warpTarget = bestTargetFound
            end

            if warpTarget ~= nil and warpTarget ~= monster.pos then
                if gfxId > 0 then world:gfx(gfxId, monster.pos) end
                monster:warp(warpTarget)
                if gfxId > 0 then world:gfx(gfxId, monster.pos) end
                if sfxId > 0 then world:makeSound(sfxId, monster.pos) end

                -- Turn the monster to the location of origin so it still engages the enemies
                common.TurnTo(monster, lookAtTarget)

                monster.movepoints = monster.movepoints - usedMovepoints

                return true
            end
        end
        return false
    end

    return self
end
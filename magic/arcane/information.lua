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
local runes = require("magic.arcane.runes")
local dun = require("magic.arcane.dun")
local magicDamage = require("magic.arcane.magicDamage")

local M = {}

function M.getInputFrom(user)
--input dialog here to request telepathic message
end

function M.telepathy(user, targets, spell)
local messageToTarget = false
local messageFromTarget = false
    for _, target in pairs(targets) do
        if runes.checkSpellForRuneByName("Kel", spell) or runes.checkSpellForRuneByName("Tah", spell) then
            target.character:inform("","You feel a telepathic connection establish between you and someone else.")
        end
        if runes.checkSpellForRuneByName("Kel", spell) then
            messageToTarget = M.getInputFrom(user)
        end
        if runes.checkSpellForRuneByName("Tah", spell) then
            messageFromTarget = M.getInputFrom(target.character)
        end
        if messageToTarget then
            target.character:inform("","You hear the voice of your telepathic partner in your mind: "..messageToTarget)
        end
        if messageFromTarget then
            user:inform("","You hear the voice of your telepathic partner in your mind: "..messageFromTarget)
        end
    end
end

local monsterType = magicDamage.raceList

local function checkIfTypeOf(char, typeOf)
    for _, monster in pairs(monsterType) do
        if char.race == monster.race then
            if monster.typeOf == typeOf then
                return true
            end
        end
    end
return false
end

local function getLukDunPositionTable(targetPosition)
    local positionTable = {}
    table.insert(positionTable, {position = position(targetPosition.x+2,targetPosition.y,targetPosition.z)})
    table.insert(positionTable, {position = position(targetPosition.x,targetPosition.y+2,targetPosition.z)})
    table.insert(positionTable, {position = position(targetPosition.x-2,targetPosition.y,targetPosition.z)})
    table.insert(positionTable, {position = position(targetPosition.x,targetPosition.y-2,targetPosition.z)})
    table.insert(positionTable, {position = position(targetPosition.x+2,targetPosition.y-2,targetPosition.z)})
    table.insert(positionTable, {position = position(targetPosition.x-2,targetPosition.y+2,targetPosition.z)})
    table.insert(positionTable, {position = position(targetPosition.x+2,targetPosition.y+2,targetPosition.z)})
    table.insert(positionTable, {position = position(targetPosition.x-2,targetPosition.y-2,targetPosition.z)})
    return positionTable
end

function M.getInformationText(user, targeted, spell)
local target = targeted
local targets
local items = {}
local characters = {}
    if targeted.pos then
        target = targeted.pos
    end
    if runes.checkSpellForRuneByName("Dun", spell) then
        targets = dun.increaseArea(target)
    else
        targets = {}
        table.insert(targets, {position = target})
    end
    if runes.checkSpellForRuneByName("Anth", spell) then
        if targets then
            for _, tar in pairs(targets) do
                local field = world:getField(tar.position)
                local itemCount = field:countItems()
                if itemCount ~= 0 then
                    table.insert(items, {item = field:getStackItem(itemCount) })
                end
            end
        else
            local field = world:getField(target)
            local itemCount = field:countItems()
            if itemCount ~= 0 then
                table.insert(items, {item = field:getStackItem(itemCount)})
            end
        end
    end
    if targets then
        for _, tar in pairs(targets) do
            if world:isCharacterOnField(tar.position) then
                local char = world:getCharacterOnField(tar.position)
                if runes.checkSpellForRuneByName("Fhen", spell) and char:getType() == Character.player then
                    table.insert(characters, {character = char })
                end
                if runes.checkSpellForRuneByName("Taur", spell) and char:getType() == Character.monster and checkIfTypeOf(char, "sentient") then
                    table.insert(characters, {character = char})
                end
                if runes.checkSpellForRuneByName("Ura", spell) and char:getType() == Character.monster and checkIfTypeOf(char, "animal") then
                    table.insert(characters, {character = char})
                end
                if runes.checkSpellForRuneByName("Yeg", spell) and char:getType() == Character.monster and checkIfTypeOf(char, "undead") then
                    table.insert(characters, {character = char})
                end
            end
        end
    end

    if runes.checkSpellForRuneByName("Luk", spell) then
    local positions
        if runes.checkSpellForRuneByName("Dun", spell) then
            positions = getLukDunPositionTable(target)
        else
            positions = dun.increaseArea(target)
        end
    characters = {}
        for _, pos in pairs(positions) do
            if world:isCharacterOnField(pos.position) then
                local char = world:getCharacterOnField(pos.position)
                if runes.checkSpellForRuneByName("Fhen", spell) and char:getType() == Character.player then
                    table.insert(characters, {character = char })
                end
                if runes.checkSpellForRuneByName("Taur", spell) and char:getType() == Character.monster and checkIfTypeOf(char, "sentient") then
                    table.insert(characters, {character = char})
                end
                if runes.checkSpellForRuneByName("Ura", spell) and char:getType() == Character.monster and checkIfTypeOf(char, "animal") then
                    table.insert(characters, {character = char})
                end
                if runes.checkSpellForRuneByName("Yeg", spell) and char:getType() == Character.monster and checkIfTypeOf(char, "undead") then
                    table.insert(characters, {character = char})
                end
            end
        end
    end

local startText = "You sense:\n"
local manaText = ""
local foodText = ""
local hpText = ""
local movementText = ""
local positionText = ""
local type = characters
local typeName = "character"
    if runes.checkSpellForRuneByName("Ira", spell) then
        for i = 1, #type do
            local manaAmount = type[i][typeName]:setAttrib("mana", 0)
            manaText = manaText.."Target "..i.." has "..manaAmount.." mana.\n"
        end
    end
    if runes.checkSpellForRuneByName("Kah", spell) then
        for i = 1, #type do
            local foodAmount = type[i][typeName]:setAttrib("foodlevel", 0)
            foodText = foodText.."Target "..i.." has "..foodAmount.." stamina.\n"
        end
    end
    if runes.checkSpellForRuneByName("Sih", spell) then
        for i = 1, #type do
            local hp = type[i][typeName]:setAttrib("hitpoints", 0)
            hpText = hpText.."Target "..i.." has "..hp.." health.\n"
        end
    end
    if runes.checkSpellForRuneByName("Sul", spell) then
        for i = 1, #type do
            local ms = type[i][typeName].movepoints
            if ms == 21 then
                movementText = movementText.."Target "..i.." is idle.\n"
            elseif ms > 0 then
                movementText = movementText.."Target "..i.." is active.\n"
            else
                movementText = movementText.."Target "..i.." is unable to move.\n"
            end
        end
    end
    if runes.checkSpellForRuneByName("Mes", spell) then
        for i = 1, #type do
            local direction = "" -- replace with function that returns the direction the target is in
            local distance = "" -- replace with a function that returns whether the distance is close, nearby, etc, basically refer to treasure map distance
            positionText = positionText.."Target "..i.." is "..distance.." to the "..direction.."of you."
        end
    end

    if runes.checkSpellForRuneByName("Lhor", spell) then
        if manaText ~= "" then
            manaText = manaText -- replace with function with selectiondialog for what it should show
        end
        if foodText ~= "" then
            foodText = foodText -- replace with function with selectiondialog for what it should show
        end
        if hpText ~= "" then
            hpText = hpText -- replace with function with selectiondialog for what it should show
        end
        if movementText ~= "" then
            movementText = movementText -- replace with function with selectiondialog for what it should show
        end
        if positionText ~= "" then
            positionText = positionText -- replace with function with selectiondialog for what it should show
        end
    end

local messageText = startText..manaText..foodText..hpText..movementText..positionText
M.telepathy(user, characters, spell)
M.getInformationDialog(user, characters, spell, messageText)
end

function M.getInformationDialog(user, targets, spell, messageText)
-- MessageDialog function that shows user the information
    if runes.checkSpellForRuneByName("Fhan", spell) then
        for _, target in pairs(targets) do
            local char = target.character
            debug(char)
            --invoke messagedialog here with char instead of user
        end
    end
--Invoke messagedialog here
end

return M

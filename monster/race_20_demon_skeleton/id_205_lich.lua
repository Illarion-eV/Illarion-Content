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
--ID 205, Lich, Level: 8, Armourtype: heavy, Weapontype: puncture

local common = require("base.common")
local demonSkeletons = require("monster.race_20_demon_skeleton.base")
local mageBehaviour = require("monster.base.behaviour.mage")
local monstermagic = require("monster.base.monstermagic")
local scheduledFunction = require("scheduled.scheduledFunction")

local magic = monstermagic()
magic.addWarping{probability = 0.05, usage = magic.ONLY_NEAR_ENEMY}

magic.addSummon{probability = 0.05, monsters = {113, 111, 112}} -- summon simple skeltons
magic.addSummon{probability = 0.01, monsters = {741, 754, 751}} -- surprise spawn. Stronger skeletons
magic.addSummon{probability = 0.0001, monsters = {201, 202}} -- rare summon. Magic demon skeleton or a demon skeleton

local M = demonSkeletons.generateCallbacks()
M = magic.addCallbacks(M)
M = mageBehaviour.addCallbacks(magic, M)

local function spawnWeakLich(pos)
    if not common.DeleteItemFromStack(pos, {itemId = 498}) then
        debug("Failed to remove the pile of bones for the lich.")
    end
    local spawnPosition = common.GetFreePositions(pos, 1, true, true)() or pos
    local weakenedLich = world:createMonster(117, spawnPosition, -5)
    if weakenedLich ~= nil and isValidChar(weakenedLich) then
        weakenedLich:talk(Character.say, "#me erhebt sich aus dem Knochenhaufen.", "#me rises from the pile of bones.")
    end
end

local orgOnDeath = M.onDeath
function M.onDeath(monster)
    if orgOnDeath ~= nil then
        orgOnDeath(monster)
    end

    local pos = position(monster.pos.x, monster.pos.y, monster.pos.z)
    monster:talk(Character.say, "#me zerfällt zu einem Knochenhaufen.", "#me collapses into a pile of bones.")
    world:gfx(45, pos)
    local pileOfBones = world:createItemFromId(498, 1, pos, true, 333, nil)
    pileOfBones.wear = 3
    world:changeItem(pileOfBones)

    scheduledFunction.registerFunction(8, function() spawnWeakLich(pos) end)
end

return M
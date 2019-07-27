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

local monsterId = 1142

local akaltut = require("monster.race_114_akaltut.base")
local mageBehaviour = require("monster.base.behaviour.mage")
local monstermagic = require("monster.base.monstermagic")
local poisonfield = require("item.id_372_poisonfield")
local scheduledFunction = require("scheduled.scheduledFunction")
local common = require("base.common")
local hooks = require("monster.base.hooks")

local magic = monstermagic()
magic.addPoisonball{probability = 0.06, damage = {from = 1000, to = 1300}}
magic.addPoisonball{probability = 0.009, damage = {from = 1200, to = 1500}}
magic.addPoisonball{probability = 0.001, damage = {from = 1400, to = 1800}}
magic.addPoisonball{probability = 0.001, damage = {from = 700, to = 1250}, targetCount = 3}

    poisonfield.setPoisonImmunity(monsterId)

local M = akaltut.generateCallbacks()
M = magic.addCallbacks(M)
M = mageBehaviour.addCallbacks(magic, M)

M.eggExists = false
M.enragedAkaltutExists = false
M.akaltutMageFormExists = false
M.akaltutSpiderFormExists = false

local function spawnEnragedAkaltut(pos)
    if not common.DeleteItemFromStack(pos, {itemId = 1174}) then
        debug("Failed to remove the spider eggs for enraged Akaltut.")
    end
    M.eggExists = false
    local spawnPosition = common.GetFreePositions(pos, 1, true, true)() or pos
    local enragedAkaltut = world:createMonster(1141, spawnPosition, -5)
    if enragedAkaltut ~= nil and isValidChar(enragedAkaltut) then
        M.enragedAkaltutExists = true
        enragedAkaltut:talk(Character.say, "#me zerbricht aus dem Ei und faucht wütend.", "#me bursts from the egg and hisses angrily.")
    end
end

local orgOnDeath = M.onDeath
function M.onDeath(monster)
    if orgOnDeath ~= nil then
        orgOnDeath(monster)
    end

    local pos = position(monster.pos.x, monster.pos.y, monster.pos.z)
    monster:talk(Character.say, "#me verschwindet und ein Ei erscheint.", "#me vanishes and an egg appears.")
    world:gfx(45, pos)
    local spiderEgg = world:createItemFromId(1174, 1, pos, true, 333, nil)
    spiderEgg.wear = 3
    world:changeItem(spiderEgg)
    M.eggExists = true

    scheduledFunction.registerFunction(8, function() spawnEnragedAkaltut(pos) end)
end

local orgOnSpawn = M.onspawn
function M.onSpawn(monster)
    if orgOnSpawn ~= nil then
        orgOnSpawn(monster)
    end

    if M.eggExists or M.enragedAkaltutExists or M.akaltutMageFormExists or M.akaltutSpiderFormExists then
        hooks.setForcedDeath(monster)
        hooks.isNoDrop(monster)
        monster:increaseAttrib("hitpoints", -10000)
    end

end

return M

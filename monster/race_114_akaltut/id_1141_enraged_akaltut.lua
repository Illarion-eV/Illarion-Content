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

local monsterId = 1141

local akaltut = require("monster.race_114_akaltut.base")
local mageBehaviour = require("monster.base.behaviour.mage")
local monstermagic = require("monster.base.monstermagic")
local poisonfield = require("item.id_372_poisonfield")
local scheduledFunction = require("scheduled.scheduledFunction")
local common = require("base.common")
local id_1142_akaltut = require("monster.race_114_akaltut.id_1142_akaltut")
local hooks = require("monster.base.hooks")

local magic = monstermagic()
magic.addPoisonball{probability = 0.06, damage = {from = 1500, to = 1800}}
magic.addPoisonball{probability = 0.009, damage = {from = 1700, to = 2000}}
magic.addPoisonball{probability = 0.001, damage = {from = 1900, to = 2300}}
magic.addPoisonball{probability = 0.001, damage = {from = 1200, to = 1850}, targetCount = 3}
magic.addPoisonball{probability = 0.01, damage = {from = 750, to = 1200}, targetCount = 5}
magic.addPoisonring{probability = 0.009, damage = {from = 2200, to = 2700}, range  = 6,
    itemProbability = 0.15, quality = {from = 4, to = 5}}

    poisonfield.setPoisonImmunity(monsterId)

local M = akaltut.generateCallbacks()
M = magic.addCallbacks(M)
M = mageBehaviour.addCallbacks(magic, M)

local function spawnEnragedAkaltut(pos)
    if not common.DeleteItemFromStack(pos, {itemId = 1175}) then
        debug("Failed to remove the spider eggs for split Akaltut")
    end
    id_1142_akaltut.eggExists = false
    
    local spawnPosition = common.GetFreePositions(pos, 1, true, true)() or pos
    local spiderQueen = world:createMonster(195, spawnPosition, -5)
    if spiderQueen ~= nil and isValidChar(spiderQueen) then
        spiderQueen:talk(Character.say, "#me zerbricht das Ei und erscheint in ihrem normalen Aussehen.", "#me bursts forth from the egg in it's natural state.")
        id_1142_akaltut.akaltutSpiderFormExists = true
        hooks.registerOnDeath(spiderQueen, function() id_1142_akaltut.akaltutSpiderFormExists = false; end)
    end
    local humanMage = world:createMonster(3,spawnPosition, -5)
    if humanMage ~= nil and isValidChar(humanMage) then
        humanMage:setAttrib("sex", 1)
        humanMage:talk(Character.say, "#me zerbricht das Ei und erscheint in ihrem normalen Aussehen.", "#me bursts forth from the egg in it's natural state.")
        id_1142_akaltut.akaltutMageFormExists = true
        hooks.registerOnDeath(humanMage, function() id_1142_akaltut.akaltutMageFormExists = false; end)
    end
end

local orgOnDeath = M.onDeath
function M.onDeath(monster)
    if orgOnDeath ~= nil then
        orgOnDeath(monster)
    end

    local pos = position(monster.pos.x, monster.pos.y, monster.pos.z)
    monster:talk(Character.say, "Ein Schrei ist zu hören als das Monster fällt.", "A scream is heard as the monster falls.")
    world:gfx(45, pos)
    local spiderEgg = world:createItemFromId(1175, 1, pos, true, 333, nil)
    spiderEgg.wear = 3
    world:changeItem(spiderEgg)
    id_1142_akaltut.eggExists = true

    scheduledFunction.registerFunction(8, function() spawnEnragedAkaltut(pos) end)
end

return M
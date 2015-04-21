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
--ID 195, Spider Queen, Level: 7, Armourtype: heavy, Weapontype: slashing
local monsterId = 195

local common = require("base.common")
local lookat = require("base.lookat")
local monstermagic = require("monster.base.monstermagic")
local scheduledFunction = require("scheduled.scheduledFunction")
local spiders = require("monster.race_19_spider.base")
local poisonfield = require("item.id_372_poisonfield")

local magic = monstermagic()
magic.addPoisonball{probability = 0.06, damage = {from = 1500, to = 1800}}
magic.addPoisonball{probability = 0.009, damage = {from = 1700, to = 2000}}
magic.addPoisonball{probability = 0.001, damage = {from = 1900, to = 2300}}
magic.addPoisonball{probability = 0.001, damage = {from = 1200, to = 1850}, targetCount = 3}
magic.addPoisonball{probability = 0.01, damage = {from = 750, to = 1200}, targetCount = 5}
magic.addPoisonring{probability = 0.009, damage = {from = 2200, to = 2700}, range  = 6,
    itemProbability = 0.15, quality = {from = 4, to = 5}}

    poisonfield.setPoisonImmunity(monsterId)

local M = spiders.generateCallbacks()
M = magic.addCallbacks(M)

local function hatchEggs(pos)
    local itemProperties = {itemId = 738, deleteAmount = 1, quality = false, data = {{dataKey = "spawnSpiders", dataValue = "true"}}}
    if not common.DeleteItemFromStack(pos, itemProperties) then
        return
    end

    world:gfx(1, pos)
    local players = world:getPlayersInRangeOf(pos, 5)
    for _, player in pairs(players) do
        player:inform("Das Ei zerspringt und kleine Spinnen schlüpfen.","The egg breaks and small spiders hatch.")
    end

    local spawnCount = Random.uniform(3, 5)
    for freePos in common.GetFreePositions(pos, 2, true, true) do
        world:createMonster(196, freePos, -5)
        if spawnCount <= 1 then
            break
        end
        spawnCount = spawnCount - 1
    end
end

local orgOnDeath = M.onDeath
function M.onDeath(monster)
    if orgOnDeath ~= nil then
        orgOnDeath(monster)
    end

    if Random.uniform() < 0.3 then
        local pos = position(monster.pos.x, monster.pos.y, monster.pos.z)
        monster:talk(Character.say,
            "#me explodiert und hinterlässt ein schleimiges Spinnenei.",
            "#me explodes and a slimey spider egg is left behind.")

        world:gfx(8, monster.pos)
        local spiderEgg = world:createItemFromId(738, 1, monster.pos, true, 333, nil)
        spiderEgg.wear = 2
        lookat.SetSpecialName(spiderEgg, "Spinnenei", "Spider egg")
        spiderEgg:setData("spawnSpiders", "true")
        world:changeItem(spiderEgg)

        for i=-1, 1 do
            for j=-1, 1 do
                if i ~= 0 or j ~= 0 then
                    local slimePosition = position(monster.pos.x + i, monster.pos.y + j, monster.pos.z)
                    if not world:isItemOnField(slimePosition) then
                        local spiderSlime = world:createItemFromId(3102, 1, slimePosition, true, 333, nil)
                        spiderEgg.wear = 3
                        lookat.SetSpecialName(spiderSlime, "Spinnenschleim", "Spider slime")
                        world:changeItem(spiderSlime)
                        if world:isCharacterOnField(slimePosition) then
                            local hitChar = world:getCharacterOnField(slimePosition)
                            hitChar:inform("Du wirst von ekeligem klebrigem Spinnenschleim getroffen.",
                                "You are hit by disgusting and sticky spider slime.")
                        end
                    end
                end
            end
        end

        scheduledFunction.registerFunction(8, function() hatchEggs(pos) end)
    end
end

return M
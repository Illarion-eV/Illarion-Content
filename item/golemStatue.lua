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

local common = require("base.common")

local M = {}

local function activateGolem(user, sourceItem)

    local realGolem = sourceItem:getData("realGolem")

    user:inform("Du berührst die Statue. Ihre Augen beginnen zu glühen und sie beginnt sich mit quietschende Geräuschen zu bewegen.", "As you touch the statue, its eyes begin to glow soon followed by creaking noises.")

    local nearbyPlayers = world:getPlayersInRangeOf(sourceItem.pos, 10)

    for _, char in pairs(nearbyPlayers) do
        if char.id ~= user.id then
            char:inform("Eine Golemstatue mit glühenden Augen beginnt sich mit quietschenden Geräuschen zu bewegen.", "A nearby golem statue's eyes begin to glow, followed by creaking noises.")
        end
    end

    local emptyPedestal

    if sourceItem.id == 4096 then
        emptyPedestal = 4098
    elseif sourceItem.id == 4097 then
        emptyPedestal = 4099
    else
        debug("Someone attached the golem script to a non-golem statue")
        return
    end

    world:erase(sourceItem, 1)

    local pedestal = world:createItemFromId(emptyPedestal, 1, sourceItem.pos, true, sourceItem.quality, {["realGolem"] = realGolem})
    pedestal.wear = 60 -- 180 min respawn timer
    world:changeItem(pedestal)

    local golemOptions = {562, 563, 564}

    local golemToSpawn

    local spawnPos = sourceItem.pos

    if realGolem == "steel" then
        golemToSpawn = golemOptions[1]
    elseif realGolem == "gold" then
        golemToSpawn = golemOptions[3]
    elseif realGolem == "merinium" then
        golemToSpawn = golemOptions[2]
    else
        local rand = math.random(1,3)
        golemToSpawn = golemOptions[rand]
    end

    local theGolem = world:createMonster(golemToSpawn, spawnPos, 0)

    theGolem:talk(Character.say, "#me wirft seine äußere Hülle ab, die ihn wie eine Statue hat aussehen lassen.", "#me sheds its outer skin that made it look like a statue.")

end

function M.UseItem(user, sourceItem)

    local realGolem = not common.IsNilOrEmpty(sourceItem:getData("realGolem"))

    if realGolem then
        activateGolem(user, sourceItem)
        return
    end

end

return M

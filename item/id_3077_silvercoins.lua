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

-- UPDATE items SET itm_script='item.id_3077_silvercoins' WHERE itm_id IN (3077);

local common = require("base.common")
local lookat = require("base.lookat")

local M = {}

local TimeList = {}

function M.LookAtItem(User, Item)
    if Item.number == 1 then
        lookat.SetSpecialDescription(Item, "Eine einzelne Münze", "A single coin")
    else
        lookat.SetSpecialDescription(Item, "Eine Sammlung aus " .. Item.number .. " Münzen", "A collection of " .. Item.number .. " coins")
    end
    return lookat.GenerateLookAt(User, Item, lookat.NONE)
end

function M.UseItem(User, SourceItem)
    local frontItem = common.GetFrontItem(User)
    if frontItem then
        if frontItem.id == 2805 and frontItem.pos == position(386, 260, -6) then --if frontItem is quest pillar
            if User:getQuestProgress(170) == 0 then
                User:setQuestProgress (170, 1)
                User:inform('Die Münze fällt durch den Schlitz und mit einem metallischen Klicken öffnet sich eine versteckte Klappe in der Säule, aus der ein Schild fällt.', 'The coin falls into the slit and with a metallic click a hidden hatch opens and a shield drops out.')
                world:erase(SourceItem, 1)
                local data = {}
                data.descriptionDe = "Geweihter Schild Ronagans"
                data.descriptionEn = "Blessed Shield of Ronagan"
                User:createItem(17, 1, 799, data)
            else
                User:inform('Die Münze verschwindet im Schlitz, aber nichts passiert.', 'The coin disappears but nothing happens.')
                world:erase(SourceItem, 1)
            end
        return;
        end
    end

    if TimeList[User.id] ~= nil then
        if (math.abs(world:getTime("second") - TimeList[User.id])) <= 3 then  -- 1 Rl. second delay
            return
        end
    end

    if math.random(2) == 1 then
		User:talk(Character.say, "#me wirft eine Münze in die Luft und fängt sie wieder auf. Sie zeigt Kopf.", "#me throws a coin in the air and catches it again. It shows head.")
    else
        User:talk(Character.say, "#me wirft eine Münze in die Luft und fängt sie wieder auf. Sie zeigt Zahl.", "#me throws a coin in the air and catches it again. It shows tail.")
    end
	
    TimeList[User.id] = world:getTime("second")
end

return M

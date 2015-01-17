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

-- UPDATE items SET itm_script='item.id_61_goldcoins' WHERE itm_id IN (61);

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

    if TimeList[User.id] ~= nil then
        if (math.abs(world:getTime("second") - TimeList[User.id])) <= 3 then  -- 1 Rl. second delay
            return
        end
    end

    local face
    if math.random(2) == 1 then
        face = common.GetNLS(User, "Kopf", "head")
    else
        face = common.GetNLS(User, "Zahl","tail")
    end

    User:talk(Character.say, "#me wirft eine Münze in die Luft und fängt sie wieder auf. Sie zeigt "..face..".", "#me throws a coin in the air and catches it again. It shows "..face..".")
    TimeList[User.id] = world:getTime("second")
end

return M

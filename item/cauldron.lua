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

-- UPDATE items SET itm_script='item.cauldron' WHERE itm_id IN (1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018);

local common = require("base.common")

local M = {}

local cauldronContents

function M.UseItem(User, SourceItem)

    if (User:getQuestProgress(539) == 1) and SourceItem:getData("ratmanCauldron") ~= "" then--OK, the player does the quest 1
        cauldronContents(User, SourceItem)
    end
    
    if (User:getQuestProgress(539) == 3) and  SourceItem.pos == position(594, 172, -3) then --OK, the player does the quest 2
        User:inform(
            "I",
            "You manage somehow to steal a bottle of the yellow potion from Kaefity, You should take it to Pasinn.")
        User:setQuestProgress(542, 1)
        return
    end
    
    if (User:getQuestProgress(539) == 3) and  SourceItem.pos == position(596, 173, -3) then --OK, the player does the quest 2
        User:inform(
            "I",
            "You look on in amazement as the bottle dissolves in your hands. There will be no obtaining this potion you should try elsewhere.")
        world:gfx(52, User.pos) -- swirly
        return
    end
    
end

function cauldronContents(User, chestItem)

    -- skip if already tripped in the last 5 minutes
    local serverTime = world:getTime("unix")
    local trippingTime = cauldronItem:getData("tripping_time")

    if (trippingTime ~= "" and ((tonumber(trippingTime) + 300) > serverTime)) then
        User:inform("Du findest dieses mal keinerlei Münzen im Kessel. Vielleicht hat der verrückte Rattenalchemist vor, später mehr zu machen.",
                "You don't find any coins in the cauldron at this time. Maybe the crazy rat alchemist will make more later.")
        return
    end
    -- safe tripping time
    cauldronItem:setData("tripping_time", serverTime)
    world:changeItem(cauldronItem)

    User:inform("Du findest eine Gifttaler.","You discover a poison coin.")
        local notCreated = User:createItem(3078, 1, 333, nil) -- silver coin
        if ( notCreated > 0 ) then -- too many items -> character can't carry anymore
            world:createItemFromId(3078, notCreated, User.pos, true, 333, nil)
            common.HighInformNLS(User,
                "Du kannst nichts mehr halten.",
                "You can't carry any more.")
        end
end

return M

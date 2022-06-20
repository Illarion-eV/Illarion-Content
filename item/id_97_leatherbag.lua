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
-- UPDATE items SET itm_script='item.id_97_leatherbag' WHERE itm_id=97;
local lookat = require("base.lookat")
local common = require("base.common")

local M = {}

local BAG_LABEL_KEY = "bagLabel"
local BAG_LABEL_COMMAND = "!bag"
local MAX_LABEL_LENGTH = 100

function M.MoveItemBeforeMove(user, source, target)

    if not common.isInRect(source.pos, target.pos, 2) then
        user:inform(common.GetNLS(user, "Du kannst eine Tasche nicht werfen.", "You can't throw a bag."))
        return false --unlike other items, bags and baskets can be moved further than they should when moved from tile to tile. This hotfixes this until a server change is made sometime in the future to fix the relevant script.
    end

    return true
end

function M.LookAtItem(User,Item)
    local lookAt = lookat.GenerateLookAt(User, Item)

    local bagLabel = Item:getData(BAG_LABEL_KEY)
    if bagLabel ~= "" then
        lookAt.description = bagLabel
    end

    return lookAt
end

function M.UseItem(User, Item)
    local itemType = Item:getType()
    if (itemType == scriptItem.field)
    or (itemType == scriptItem.inventory)
    or (itemType == scriptItem.belt) then
        local lastText = User.lastSpokenText
        if lastText == "!bag" then
            Item:setData(BAG_LABEL_KEY, "")
            world:changeItem(Item)
            if User:getPlayerLanguage() == 0 then
                User:inform("Du entfernst die Beschriftung von der Ledertasche.")
            else
                User:inform("You tear off the leather bag's label.")
            end
        else
            local lastTextLength = string.len(lastText)
            local commandLength = string.len(BAG_LABEL_COMMAND) + 1
            if (string.sub(lastText, 1, commandLength) == BAG_LABEL_COMMAND .. " ")
            and (lastTextLength > commandLength) then
                local labelBeginIndex = commandLength + 1
                local maxInputLength = commandLength + MAX_LABEL_LENGTH
                local labelEndIndex = math.min(lastTextLength, maxInputLength)
                local label = string.sub(lastText, labelBeginIndex, labelEndIndex)
                Item:setData(BAG_LABEL_KEY, label)
                world:changeItem(Item);
                if User:getPlayerLanguage() == 0 then
                    User:inform("Du beschriftest die Ledertasche mit "..label..".")
                else
                    User:inform("You label the leather bag with "..label..".")
                end
            end
        end
    end
end

return M


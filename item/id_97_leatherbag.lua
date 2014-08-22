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

module("item.id_97_leatherbag", package.seeall)

BAG_LABEL_KEY = "bagLabel"
BAG_LABEL_COMMAND = "!bag"
MAX_LABEL_LENGTH = 100

function LookAtItem(User,Item)
    local lookAt = base.lookat.GenerateLookAt(User, Item)

    local bagLabel = Item:getData(BAG_LABEL_KEY)
    if bagLabel ~= "" then
        lookAt.description = bagLabel
    end

    return lookAt
end

function UseItem(User, Item)
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

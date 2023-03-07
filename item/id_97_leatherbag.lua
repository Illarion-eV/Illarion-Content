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
local depotScript = require("item.id_321_depot")

local M = {}

local BAG_LABEL_KEY = "bagLabel"
local BAG_LABEL_COMMAND = "!bag"
local MAX_LABEL_LENGTH = 100

function M.isInDepot(user, bagContainer)

    local depots = depotScript.depots

    for _, depot in pairs(depots) do
        local theDepot = user:getDepot(depot)
        if theDepot then
            if theDepot == bagContainer then
                return true
            end
        end
    end

    return false
end

function M.isInBackpack(user, bagContainer)

    local backpack = user:getBackPack()

    if backpack then
        if backpack == bagContainer then
            return true
        end
    end

    return false
end

function M.rectCheck(user, source, target, range, isBasket)

    local container = {english = "bag", german = "eine Tasche"}

    if isBasket then
        container.english = "basket"
        container.german = "einen Korb"
    end

    if not common.isInRect(source.pos, target.pos, range) then
        local english = "You can't throw a "..container.english.."."
        local german = "Du kannst "..container.german.." nicht werfen."
        local possiblePAttempt = target.pos == user.pos

        if possiblePAttempt then
            english = "To pick up a "..container.english.." using the 'P' hotkey, you must be standing on it. Alternatively, you can drag the "..container.english.." to your bag slot or an existing container by using your mouse."
            german = "Um "..container.german.." mit 'P' aufzuheben, musst du auf dem selben Feld stehen. Du kannst "..container.german.." auch mit der Maus in deinen Taschenslot oder einen anderen Beh�lter ziehen."
        end

        user:inform(common.GetNLS(user, german, english))
        return false --To prevent bags within bags that are too heavy to move and can't be accessed, you can't throw bags further than 1 tile so it will always be in the range of the depot it is removed from
    end
    return true
end

function M.isBackPackSlot(user, source, target)
    if target:getType() == 4 and target.itempos == 0 or source:getType() == 4 and source.itempos == 0 then --allow movement from and between bag slot
        return true
    end

    return false
end

function M.MoveItemBeforeMove(user, source, target, basket)

    if M.isInDepot(user, source.inside) or M.isInBackpack(user, source.inside) or M.isInDepot(user, target.inside) or M.isInBackpack(user, target.inside) or M.isBackPackSlot(user, source, target) then
        return M.rectCheck(user, source, target, 1, basket)
    end

    return M.rectCheck(user, source, target, 0, basket)

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


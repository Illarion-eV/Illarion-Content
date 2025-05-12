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
-- UPDATE items SET itm_script='item.id_227_cookingspoon' WHERE itm_id IN (227);

local common = require("base.common")
local cooking = require("craft.final.cooking")
local brewing = require("craft.final.brewing")
local wood = require("item.general.wood")
local tutorial = require("content.tutorial")

local M = {}

M.LookAtItem = wood.LookAtItem

local function getBarrel(User)

    local BARRELS = {339, 1410, 1411}
    local foundItem
    local frontItem = common.GetFrontItem(User)

    for i, barrel in pairs(BARRELS) do
        if (frontItem ~= nil and frontItem.id == barrel) then
            foundItem = frontItem
            break
        end
    end

    if not foundItem then
        for i, barrel in pairs(BARRELS) do
            foundItem = common.GetItemInArea(User.pos, barrel)
            if foundItem then
                break
            end
        end
    end

    return foundItem

end

local function getKettleOrOven(User)

    local KETTLE = 3581
    local OVEN = 1386
    local item = common.GetFrontItem(User)
    if (item ~= nil and (item.id == KETTLE or item.id == OVEN)) then
        return item
    end
    item = common.GetItemInArea(User.pos, KETTLE)

    if item.id == KETTLE then
        return item
    else
        item = common.GetItemInArea(User.pos, OVEN)
    end

    return item
end

function M.UseItem(User, SourceItem, ltstate)

    local target

    -- check for barrel
    target = getBarrel(User)
    if (target ~= nil) then
        --Tutorial
        if User:getQuestProgress(325) == 1 and User:getQuestProgress(340) == 0 then --Accepted tutorial messages, didn't get the message before
            User:setQuestProgress(340, 1) --remember that the message was received
            local callbackNewbie = function(informNewbie)
                User:inform(tutorial.getTutorialInformDE("barrel"),tutorial.getTutorialInformEN("barrel"))
                brewing.brewing:showDialog(User, SourceItem)
            end --end callback
            local dialogText = common.GetNLS(User,tutorial.getTutorialTextDE("barrel"),tutorial.getTutorialTextEN("barrel"))
            local dialogNewbie = MessageDialog("Tutorial", dialogText, callbackNewbie)
            User:requestMessageDialog(dialogNewbie)
        else

            brewing.brewing:showDialog(User, SourceItem)

        end
        return
    end

    -- check for kettle
    target = getKettleOrOven(User)
    if (target ~= nil) then
        cooking.cooking:showDialog(User, SourceItem)
        return
    end

    -- there is nothing to work with
    common.HighInformNLS( User,
    "Du stehst nicht neben dem ben�tigten Werkzeug: Weinfass, Ofen oder Kessel",
    "There is no wine barrel, oven or kettle close by to work with." )

 end

return M

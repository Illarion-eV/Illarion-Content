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

local function getKettle(User)

    local KETTLE = 3581
    local item = common.GetFrontItem(User)
    if (item ~= nil and item.id == KETTLE) then
        return item
    end
    item = common.GetItemInArea(User.pos, KETTLE)
    return item
end

function M.UseItem(User, SourceItem, ltstate)

    local target

    -- check for barrel
    target = getBarrel(User)
    if (target ~= nil) then
        --Tutorial
        if User:getQuestProgress(325) == 1 and User:getQuestProgress(340) == 0 then --Accepted tutorial messages, didn't get the message before
            User:setQuestProgress(339, 1) --remember that the message was received
            local callbackNewbie = function(informNewbie)
                User:inform("Während du die Zutaten in dem riesigen Fass umrührst, erfüllt ein Hauch gärender Äpfel deine Nase.","As you stir ingredients in the immense barrel a waft of fermenting apples fills your nostrils.")
                brewing.brewing:showDialog(User, SourceItem)
            end --end callback
            local dialogText = common.GetNLS(User,
                "Da du erst anfangen hast, wirst du wahrscheinlich nur leicht alkoholhaltige Getränke auf deiner Braukarte haben. Öffne die die Kategorie 'Leichter Alkohol', indem du auf den vorangestellten Pfeil klickst und auf 'Ciderflasche' klickst, um sie auszuwählen. In diesem Fall wird nur eine Flasche Apfelcider benötigt, aber du kannst die Anzahl der zu produzierenden Artikel mit den Schaltflächen '-' und '+' anpassen. Starte die Produktion, indem du auf die Schaltfläche 'Herstellen' klickst. Ein Fortschrittsbalken zeigt an, wie lange es bis zum Abschluss der Produktion dauert, und deine fertige Flasche Apfelcider erscheint nach Beendigung in deiner Tasche.",
                "As you are only starting out, you will likely only have soft liquors listed on your brewing menu. Open the 'Soft Liquors' category by clicking the prefixing arrow head and click 'Bottle of Cider' to select it. In this instance only one bottle of cider is required, but you can adjust the number of items to be produced using the '-' and '+' buttons. Start production by clicking the 'Produce' button. A progress bar will indicate how long until production is complete and your finished bottle of cider will appear in your bag once complete.")
            local dialogNewbie = MessageDialog("Tutorial", dialogText, callbackNewbie)
            User:requestMessageDialog(dialogNewbie)
        else

            brewing.brewing:showDialog(User, SourceItem)

        end
        return
    end

    -- check for kettle
    target = getKettle(User)
    if (target ~= nil) then
        cooking.cooking:showDialog(User, SourceItem)
        return
    end

    -- there is nothing to work with
    common.HighInformNLS( User,
    "Du stehst nicht neben dem benötigten Werkzeug: Weinfass oder Kessel",
    "There is no wine barrel or kettle close by to work with." )

 end

return M

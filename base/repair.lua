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
local money = require("base.money")
local glypheffects = require("magic.glypheffects")

local itemPos = {{en="Head", de="Kopf"},{en="Neck", de="Hals"},{en="Breast", de="Brust"},{en="Both Hands", de="Beide Hände"},{en="Left Hand", de="Linke Hand"}, {en="Right Hand", de="Rechte Hand"},
    {en="Left Finger", de="Linker Finger"},{en="Right Finger", de="Rechter Finger"} ,{en="Legs", de="Beine"}, {en="Feet", de="Füße"}, {en="Coat", de="Umhang"},{en="Belt 1", de="Gürtel 1"},
    {en="Belt 2", de="Gürtel 2"},{en="Belt 3", de="Gürtel 3"},{en="Belt 4", de="Gürtel 4"},{en="Belt 5", de="Gürtel 5"},{en="Belt 6", de="Gürtel 6"}}
itemPos[0] = {en="Backpack", de="Rucksack"}

local REPAIR_QUALITY_REDUCTION_FACTOR = 0.3 --probability a totally damaged item lost quality

local M = {}

--returns the price as string to repair the item according to playerlanguage or 0 if the price is 0
local function getRepairPrice(theItem, speaker)
    local price = 0
    local theItemStats=world:getItemStats(theItem)
    if theItemStats.MaxStack == 1 then
        local durability=common.getItemDurability(theItem) --calculate the durability
        local toRepair=99-durability --the amount of durability points that has to repaired
        price=math.ceil(0.5*theItemStats.Worth*toRepair/1000)*10 --Price rounded up in 10 cp steps
    end
    return price
end

local function getRepairPriceText(theItem, speaker)
    local gstring,estring
    local price = getRepairPrice(theItem, speaker)

    if price == 0 then
        return price
    else
        gstring,estring=money.MoneyToString(price)
    end

    return common.GetNLS(speaker, gstring, estring)
end

-- Repairs theItem. The NPC speaks if the repair was successful or the char has not enough money
local function repair(npcChar, speaker, theItem, theItemPos, language)
    local item = speaker:getItemAt(tonumber(theItemPos))
    if (item == nil or item.id ~= theItem.id or getRepairPrice(theItem, speaker) ~= getRepairPrice(item, speaker))then --check for valid item
        common.HighInformNLS(speaker, "[FEHLER] Verändere nicht dein Inventar während der Reparatur.",
                                      "[ERROR] Do not change your equipment during repair.")
        return
    end

    local theItemStats=world:getItemStats(item)
    local itemName = world:getItemName(item.id,language)

    local durability=common.getItemDurability(item) --calculate the durability
    local price=getRepairPrice(item, speaker)
    local priceMessage = getRepairPriceText(item, speaker)

    if theItemStats.Worth == 0 or price == 0 then --Cannot repair perfect, priceless or stackable items
        npcChar:talk(Character.say, common.GetNLS(speaker, "Entschuldigt, aber das kann ich nicht reparieren.", "I cannot repair this, sorry."))
    else -- I can repair it!
        if not money.CharHasMoney(speaker,price) then --player is broke
            npcChar:talk(Character.say, common.GetNLS(speaker, "Ihr habt anscheinend nicht genug Geld. Die Reparatur würde"..priceMessage.." kosten.",
                                                               "You don't have enough money I suppose. I demand"..priceMessage.." for repairing this item."))
        else --he has the money
            local quality = common.getItemQuality(item)
            local damage = (99 - common.getItemDurability(item)) / 99
            if common.IsNilOrEmpty(item:getData("qualityAtCreation")) then
                item:setData("qualityAtCreation",quality) -- save original quality
            end
            local targetQuality = quality
            if (math.random() < damage * REPAIR_QUALITY_REDUCTION_FACTOR) and (quality > 1) then
                local glyphEffect = glypheffects.effectOnNpcRepair(speaker)
                if math.random() < glyphEffect then
                    common.InformNLS(speaker,"Der Gegenstand wird für"..priceMessage.." in Stand gesetzt.",
                                             "The item is repaired at a cost of"..priceMessage..".")
                else
                    targetQuality = quality - 1
                    common.InformNLS(speaker,"Der Gegenstand wird für"..priceMessage.." in Stand gesetzt, verliert aber an Qualität.",
                                             "The item is repaired at a cost of"..priceMessage.." but lost quality.")
                end
            else
                common.InformNLS(speaker,"Der Gegenstand wird für"..priceMessage.." in Stand gesetzt.",
                                         "The item is repaired at a cost of"..priceMessage..".")
            end
            money.TakeMoneyFromChar(speaker,price) --pay!
            common.setItemQualityDurability(item, targetQuality, 99) --repair!
        end --price/repair
    end --there is an item
end

--opens a selection dialog for the player to choose an item to repair
function M.repairDialog(npcChar, speaker)
    local chosenItem
    local chosenPos
    local posOnChar

    local language = speaker:getPlayerLanguage()
    common.TurnTo(speaker,npcChar.pos)

    local dialogTitle = common.GetNLS(speaker, "Reparieren",  "Repair")
    local dialogInfoText = common.GetNLS(speaker, "Wähle den Gegenstand aus, den du reparieren möchtest:", "Please choose an item you wish to repair:")
    local repairPriceText = common.GetNLS(speaker, " Kosten: ", " Cost: ")

    --get all the items the char has on him, without the stuff in the backpack
    local itemsOnChar = {}
    for i = 17, 0, -1 do
        local item = speaker:getItemAt(i)
        if (item.id > 0) and (item.number == 1) and (getRepairPrice(item, speaker) ~= 0) then --only add items which are single items and repairable
            table.insert(itemsOnChar, {item,itemPos[i],i})
        end
    end
    if #itemsOnChar == 0 then --nothing to repair
        npcChar:talk(Character.say, common.GetNLS(speaker, "Ihr habt nichts mehr, was ich reparieren könnte.",
                                                           "You have nothing left to repair."))
        return
    end

    local cbChooseItem = function (dialog)
        if not dialog:getSuccess() then
            return
        end

        local index = dialog:getSelectedIndex() + 1
        chosenItem = itemsOnChar[index][1]
        posOnChar = itemsOnChar[index][3]

        if chosenItem ~= nil then
            repair(npcChar, speaker, chosenItem, posOnChar, language) -- let's repair
            M.repairDialog(npcChar, speaker) -- call dialog recursively, to allow further repairs
        else
            speaker:inform("[ERROR] Something went wrong, please inform a developer.")
        end
    end
    local sdItems = SelectionDialog(dialogTitle, dialogInfoText, cbChooseItem)
    sdItems:setCloseOnMove()
    local itemName
    local repairPrice
    local itemPosText
    for i=1,#itemsOnChar do
        chosenItem = itemsOnChar[i][1]
        chosenPos = itemsOnChar[i][2]
        itemName = world:getItemName(chosenItem.id,language)
        repairPrice = getRepairPriceText(chosenItem,speaker)
        itemPosText = common.GetNLS(speaker, chosenPos.de, chosenPos.en)
        sdItems:addOption(chosenItem.id,itemName .. " (" .. itemPosText .. ")\n"..repairPriceText..repairPrice)
    end
    speaker:requestSelectionDialog(sdItems)
end

return M

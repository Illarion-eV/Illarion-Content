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

itemPos = {{en="Head", de="Kopf"},{en="Neck", de="Hals"},{en="Breast", de="Brust"},{en="Both Hands", de="Beide H�nde"},{en="Left Hand", de="Linke Hand"}, {en="Right Hand", de="Rechte Hand"},
    {en="Left Finger", de="Linker Finger"},{en="Right Finger", de="Rechter Finger"} ,{en="Legs", de="Beine"}, {en="Feet", de="F��e"}, {en="Coat", de="Umhang"},{en="Belt 1", de="G�rtel 1"},
    {en="Belt 2", de="G�rtel 2"},{en="Belt 3", de="G�rtel 3"},{en="Belt 4", de="G�rtel 4"},{en="Belt 5", de="G�rtel 5"},{en="Belt 6", de="G�rtel 6"}}
itemPos[0] = {en="Backpack", de="Rucksack"}

local M = {}

--opens a selection dialog for the player to choose an item to repair
function M.repairDialog(npcChar, speaker)

    local dialogTitle, dialogInfoText, repairPriceText;
    local language = speaker:getPlayerLanguage();

    --Set dialogmessages
    if language == 0 then --german
        dialogTitle = "Reparieren";
        dialogInfoText = "W�hle den Gegenstand aus, den du reparieren m�chtest:";
        repairPriceText = " Kosten: ";
    else --english
        dialogTitle = "Repair";
        dialogInfoText = "Please choose an item you wish to repair:";
        repairPriceText = " Cost: ";
    end

    --get all the items the char has on him, without the stuff in the backpack
    local itemsOnChar = {};
    local itemPosOnChar = {};
    for i=17,0,-1 do
        local item = speaker:getItemAt(i);
        if (item.id > 0) and (item.number == 1) and (getRepairPrice(item,speaker) ~= 0) then --only add items which are single items and repairable
            table.insert(itemsOnChar, item);
            table.insert(itemPosOnChar, itemPos[i])
            item:setData("uniqueID", tostring(math.random())); --tag the item with a unique ID
            item:setData("repairPos", tostring(i)); --tag the item its position in the inventory
            world:changeItem(item);
        end
    end

    local cbChooseItem = function (dialog)
        if (not dialog:getSuccess()) then
            return;
        end
		
        local index = dialog:getSelectedIndex()+1;
        local chosenItem = itemsOnChar[index]
		
        if chosenItem ~= nil then
            chosenItemUID=chosenItem:getData("uniqueID")
            chosenPos=chosenItem:getData("repairPos")
            repair(npcChar, speaker, chosenItem, chosenItemUID, chosenPos, language); -- let's repair
            M.repairDialog(npcChar, speaker); -- call dialog recursively, to allow further repairs
        else
            speaker:inform("[ERROR] Something went wrong, please inform a developer.");
        end
    end
    local sdItems = SelectionDialog(dialogTitle, dialogInfoText, cbChooseItem);
    sdItems:setCloseOnMove();
    local itemName, repairPrice, itemPosText;
    for i,item in ipairs(itemsOnChar) do
        itemName = world:getItemName(item.id,language)
        repairPrice = getRepairPrice(item,speaker)
        itemPosText = common.GetNLS(speaker, itemPosOnChar[i].de, itemPosOnChar[i].en)
        sdItems:addOption(item.id,itemName .. " (" .. itemPosText .. ")\n"..repairPriceText..repairPrice);
    end
    speaker:requestSelectionDialog(sdItems);
end

--returns the price as string to repair the item according to playerlanguage or 0 if the price is 0
function getRepairPrice(theItem, speaker)
    local theItemStats=world:getItemStats(theItem);
    if theItemStats.MaxStack == 1 then
        local durability=theItem.quality-100*math.floor(theItem.quality/100); --calculate the durability
        local toRepair=99-durability; --the amount of durability points that has to repaired
        local price=math.ceil(0.5*theItemStats.Worth*toRepair/1000)*10; --Price rounded up in 10 cp steps
        local gstring,estring;

        if price == 0 then
            return price;
        else
            gstring,estring=money.MoneyToString(price)
        end

        return common.GetNLS(speaker, gstring, estring)
    end
    return 0;
end

-- Repairs theItem. The NPC speaks if the repair was successful or the char has not enough money
function repair(npcChar, speaker, theItem, theItemUID, theItemPos, language)

    local theItemStats=world:getItemStats(theItem);
    local found=false;
			
	for i=17,0,-1 do
        local item = speaker:getItemAt(i);
        if (item.id > 0) and (item.number == 1) and (getRepairPrice(item,speaker) ~= 0) and (item:getData("uniqueID") == theItemUID) and (tonumber(theItemPos) == i) then --check for valid item
            found=true;
        end
    end
	
    if theItem and found then
        local durability=theItem.quality-100*math.floor(theItem.quality/100); --calculate the durability
        local toRepair=99-durability; --the amount of durability points that has to repaired
        local price=math.ceil(0.5*theItemStats.Worth*toRepair/1000)*10;
        local priceMessage = getRepairPrice(theItem, speaker);

        if theItemStats.Worth == 0 or theItemStats.isStackable or durability==99 then --Cannot repair perfect, priceless or stackable items
            local notRepairable={"Entschuldigt, aber das kann ich nicht reparieren.", "I cannot repair this, sorry."}; --Priceless, perfect or stackable item
            npcChar:talk(Character.say, notRepairable[language+1]);
        else -- I can repair it!
            if not money.CharHasMoney(speaker,price) then --player is broke
                local notEnoughMoney={"Ihr habt anscheinend nicht genug Geld. Die Reparatur w�rde"..priceMessage.." kosten.","You don't have enough money I suppose. I demand"..priceMessage.." for repairing this item."}; --Player is broke
                npcChar:talk(Character.say, notEnoughMoney[language+1]);
            else --he has the money
                local successRepair={"Der Gegenstand wird f�r"..priceMessage.." in Stand gesetzt.", "The item is repaired at a cost of"..priceMessage.."."};
                speaker:inform(successRepair[language+1]);
                money.TakeMoneyFromChar(speaker,price); --pay!
                theItem.quality=theItem.quality+toRepair; --repair!
                world:changeItem(theItem);
            end --price/repair
        end --there is an item
    else
        speaker:inform("[FEHLER] Gegenstand nicht gefunden. Ver�ndere nicht dein Inventar w�hrend der Reparatur.","[ERROR] Item not found. Do not change your equipment during repair.", Character.highPriority);
    end --item exists
end;

return M
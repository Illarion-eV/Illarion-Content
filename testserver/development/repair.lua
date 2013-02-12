require("base.common")
require("base.money")

itemPos = {{en="Head", de="Kopf"},{en="Neck", de="Hals"},{en="Breast", de="Brust"},{en="Both Hands", de="Beide Hände"},{en="Left Hand", de="Linke Hand"}, {en="Right Tool", de="Rechte Hand"},
	{en="Left Finger", de="Linker Finger"},{en="Right Finger", de="Rechter Finger"} ,{en="Legs", de="Beine"}, {en="Feet", de="Füße"}, {en="Coat", de="Umhang"},{en="Belt 1", de="Gürtel 1"},
	{en="Belt 2", de="Gürtel 2"},{en="Belt 3", de="Gürtel 3"},{en="Belt 4", de="Gürtel 4"},{en="Belt 5", de="Gürtel 5"},{en="Belt 6", de="Gürtel 6"}}
itemPos[0] = {en="Backpack", de="Rucksacke"}


module("development.repair", package.seeall)

--opens a selection dialog for the player to choose an item to repair
function repairDialog(npcChar, speaker)

	local dialogTitle, dialogInfoText, repairPriceText, numberMessage;
	local language = speaker:getPlayerLanguage();
	
	--Set dialogmessages
	if language == 0 then --german
		dialogTitle = "Reparieren";
		dialogInfoText = "Wähle den Gegenstand aus, den du reparieren möchtest.";
		repairPriceText = " Kosten: ";
		numberMessage = "Du kannst nur ein Gegenstand gleichzeitig reparieren lassen."
	else --english
		dialogTitle = "Repair";
		dialogInfoText = "Please choose an item, you wish to repair.";
		repairPriceText = " Cost: ";
		numberMessage = "You can only repair one item at a time."
	end

	--get all the items the char has on him, without the stuff in the backpack
	local itemsOnChar = {};
	local itemPosOnChar = {};
	for i=17,0,-1 do 
		local item = speaker:getItemAt(i);
		if (item.id > 0) and (item.number == 1) and (getRepairPrice(item,speaker) ~= 0) then --only add items which are single items and repairable
			table.insert(itemsOnChar, item);
			table.insert(itemPosOnChar, itemPos[i])
		end
	end
					
	local cbChooseItem = function (dialog)
		if (not dialog:getSuccess()) then
			return;
		end
		local index = dialog:getSelectedIndex()+1;
		local chosenItem = itemsOnChar[index]
		if chosenItem ~= nil then
			repair(npcChar, speaker, chosenItem, language); -- let's repair
		else			
			speaker:inform("[ERROR] Something went wrong, please inform a developer.");
		end
	end
	local sdItems = SelectionDialog(dialogTitle, dialogInfoText, cbChooseItem);
	local itemName, repairPrice, itemPosText;
	for i,item in ipairs(itemsOnChar) do 
		itemName = world:getItemName(item.id,language)
		repairPrice = getRepairPrice(item,speaker)
		itemPosText = base.common.GetNLS(speaker, itemPosOnChar[i].de, itemPosOnChar[i].en)
		sdItems:addOption(item.id,itemName .. " (" .. itemPosText .. ")\n"..repairPriceText..repairPrice);
	end	
	speaker:requestSelectionDialog(sdItems);
end

--returns the price as string to repair the item according to playerlanguage
function getRepairPrice(theItem, speaker)
	local theItemStats=world:getItemStats(theItem);
	local durability=theItem.quality-100*math.floor(theItem.quality/100); --calculate the durability
	local toRepair=99-durability; --the amount of durability points that has to repaired
	local price=math.ceil(0.5*theItemStats.Worth*toRepair/1000)*10; --Price rounded up in 10 cp steps
	local gstring,estring;
	
	if price == 0 then
		return price;
	else
		gstring,estring=base.money.MoneyToString(price)
	end
			
	return base.common.GetNLS(speaker, gstring, estring)
end

function repair(npcChar, speaker, theItem, language)
    local theItemStats=world:getItemStats(theItem);
		
	if theItem then
		local durability=theItem.quality-100*math.floor(theItem.quality/100); --calculate the durability
	    local toRepair=99-durability; --the amount of durability points that has to repaired
	    local price=math.ceil(0.5*theItemStats.Worth*toRepair/1000)*10;
		local priceMessage = getRepairPrice(theItem, speaker);
	
	    if theItemStats.Worth == 0 or theItemStats.isStackable or durability==99 then --Cannot repair perfect, priceless or stackable items
	        local notRepairable={"I cannot repair this, sorry.","Entschuldigt, aber das kann ich nicht reparieren."}; --Priceless, perfect or stackable item
	        npcChar:talk(Character.say, notRepairable[language]);
	    else -- I can repair it!			
		    if not base.money.CharHasMoney(speaker,price) then --player is broke
				local notEnoughMoney={"You don't have enough money I suppose. I demand"..priceMessage.." for repairing this item.","Ihr habt anscheinend nicht genug Geld. Die Reparatur würde"..priceMessage.." kosten."}; --Player is broke
				npcChar:talk(Character.say, notEnoughMoney[language]);
		    else --he has the money
				local successRepair={"#me repairs the item at a cost of"..priceMessage..".","#me setzt den Gegenstand für"..priceMessage.." in Stand."};
				npcChar:talk(Character.say, successRepair[language]);
				base.money.TakeMoneyFromChar(speaker,price); --pay!
                theItem.quality=theItem.quality+toRepair; --repair!
                world:changeItem(theItem);
		    end --price/repair
	    end --there is an item
    end --item exists
end;
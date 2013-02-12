require("base.common")
require("base.money")

itemPosEN = {{en="Head", de="Kopf"},{en="Neck", de="Hals"},{en="Breast", de="Brust"},{en="Both Hands", de="Beide Hände"},{en="Left Hand", de="Linke Hand"}, {en="Right Tool", de="Rechte Hand"},
	{en="Left Finger", de="Linker Finger"},{en="Right Finger", de="Rechter Finger"} ,{en="Legs", de="Beine"}, {en="Feet", de="Füße"}, {en="Coat", de="Umhang"},{en="Belt 1", de="Gürtel 1"},
	{en="Belt 2", de="Gürtel 2"},{en="Belt 3", de="Gürtel 3"},{en="Belt 4", de="Gürtel 4"},{en="Belt 5", de="Gürtel 5"},{en="Belt 6", de="Gürtel 6"}}
itemPosEN[0] = {en="Backpack", de="Rucksacke"}


module("development.repair", package.seeall)

--opens a selection dialog for the player to choose an item to repair
function repairDialog(npcChar, speaker)

	local dialogTitle, dialogInfoText, repairPriceText;
	local language = speaker:getPlayerLanguage();
	
	--Set dialogmessages
	if language == 0 then --german
		dialogTitle = "Reparieren"
		dialogInfoText = "Wähle den Gegenstand aus, den du reparieren möchtest."
		repairPriceText = " Kosten: "
	else --english
		dialogTitle = "Repair"
		dialogInfoText = "Please choose an item, you wish to repair."
		repairPriceText = " Cost: "
	end

	--get all the items the char has on him, without the stuff in the backpack
	local itemsOnChar = {};
	for i=17,0,-1 do 
		local item = speaker:getItemAt(i);
		if (item.id > 0) then
			table.insert(itemsOnChar, item);
		end
	end
					
	local cbChooseItem = function (dialog)
		if (not dialog:getSuccess()) then
			return;
		end
		local index = dialog:getSelectedIndex();
		local chosenItem = itemsOnChar[index]
		if chosenItem ~= nil then
			repair(npcChar, speaker, chosenItem, language); -- let's repair
		else
			speaker:inform("[ERROR] Something went wrong, please inform a developer.");
		end
	end
	local sdItems = SelectionDialog(dialogTitle, dialogInfoText, cbChooseItem);
	local itemName, repairPrice;
	for _,item in ipairs(itemsOnChar) do 
		itemName = world:getItemName(item.id,language)
		repairPrice = getRepairPrice(item,language)
		sdItems:addOption(item.id,itemName .. " (" .. itemPos[item.itempos] .. ")"..repairPriceText..repairPrice);
	end	
	speaker:requestSelectionDialog(sdItems);
end

--returns the price as string to repair the item according to playerlanguage
function getRepairPrice(theItem, language)
	local durability=theItem.quality-100*math.floor(theItem.quality/100); --calculate the durability
	local toRepair=99-durability; --the amount of durability points that has to repaired
	local price=math.ceil(0.5*theItemStats.Worth*toRepair/1000)*10; --Price rounded up in 10 cp steps
	local gstring,estring=base.money.MoneyToString(price)

	if language == 0 then
		return gstring;
	else
		return estring;
	end	
end

function repair(npcChar, speaker, theItem, language)
	if theItem then
        theItemStats=world:getItemStats(theItem); --reading its stats
	end
		
	if theItem then
		local durability=theItem.quality-100*math.floor(theItem.quality/100); --calculate the durability
	    local toRepair=99-durability; --the amount of durability points that has to repaired
	    local price=getRepairPrice(theItem, language);
	
	    if theItemStats.Worth == 0 or theItemStats.isStackable or durability==99 then --Cannot repair perfect, priceless or stackable items
	        local notRepairable={"I cannot repair this, sorry.","Entschuldigt, aber das kann ich nicht reparieren."}; --Priceless, perfect or stackable item
	        npcChar:talk(Character.say, notRepairable[language]);
	    else -- I can repair it!			
		    if not base.money.CharHasMoney(speaker,price) then --player is broke
				local notEnoughMoney={"You don't have enough money I suppose. I demand"..price.." for repairing this item.","Ihr habt anscheinend nicht genug Geld. Die Reparatur würde"..price.." kosten."}; --Player is broke
				npcChar:talk(Character.say, notEnoughMoney[language]);
		    else --he has the money
				local successRepair={"#me repairs the item at a cost of"..price..".","#me setzt den Gegenstand für"..price.." in Stand."};
				npcChar:talk(Character.say, successRepair[language]);
				base.money.TakeMoneyFromChar(speaker,price); --pay!
                theItem.quality=theItem.quality+toRepair; --repair!
                world:changeItem(theItem);
		    end --price/repair
	    end --there is an item
    end --item exists
end;
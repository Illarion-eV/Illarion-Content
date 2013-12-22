-- UPDATE common SET com_script = 'item.wands' WHERE com_itemid IN (2782, 2783, 2784, 2785, 323);
require("base.common")
require("server.learn")

enchantingAction = {};
enchantingItem = {};
enchantingCosts = {};

module("item.wands", package.seeall)




function UseItem(User, SourceItem, ltstate)
	
	if (User:getQuestProgress(37) ~= 0) or ( User:getMagicFlags( 0 ) > 0 )  then
	
		local magicItems = {};
		magicItems.wands = {2782,2783,2784,2785,323}
		magicItems.fire ={2742,2656,2640,2627,206,2727}
		magicItems.water = {}
		magicItems.air = {2662,2671,1052,2654,2626,2693,2704}
	

		if (ltstate == Action.none) then
			enchantingAction[User.id] = "none"
			enchantingItem[User.id] = nil;
			if not checkInHands(User, SourceItem) then
				return;
			end
	
			menue(User,magicItems,ltstate);
		
		elseif (ltstate == Action.abort) then
			User:talk(Character.say, "#me unterbricht die Verzauberung.", "#me interrupts the enchantment.")
			return;	
			
		elseif enchantingAction[User.id] == "enchanting" then
			setNewMagicLevel(User,magicItems)
			local itemMagicLevel= tonumber(User:getItemAt(enchantingItem[User.id]):getData("magicLevel"))
			User:eraseItem(enchantingCosts[User.id][2],enchantingCosts[User.id][1],{})
			User:learn(Character.enchanting, 200, itemMagicLevel + 20)
			User:increaseAttrib("mana", -9999)
		
		else
			local itemMagicLevel= tonumber(User:getItemAt(enchantingItem[User.id]):getData("magicLevel"))
			User:learn(Character.enchanting, ltstate/2, itemMagicLevel + 20)
			loadItem(User)
		
		end
	end
	
end


--Selection Dialog

function menue(User,magicItems,ltstate)
	
	local options;
	local sd;
	
	
	if  User:getPlayerLanguage() == Player.german then
		options = {"Verzaubern", "Analysieren", "Aufladen"};
	else
		options = {"Enchant", "Analyse", "Charge"};
	end
	
	
	local callback = function(dialog)
		if (not dialog:getSuccess()) then
			return;
		end
		
		if dialog:getSelectedIndex() == 0 then
			choseItemDialog(User,1,magicItems,ltstate)
		elseif dialog:getSelectedIndex() == 1 then
		
			choseItemDialog(User,2,magicItems,ltstate)
		else
			choseItemDialog(User,3,magicItems,ltstate)
		end
		
		
	end
	
	
	
	if  User:getPlayerLanguage() == Player.german then
		sd = SelectionDialog("Arkanes Artefactmenü", "Was willst du mit dem Artefakt machen?", callback);
	else
		sd = SelectionDialog("Arcane Artefact menue", "What do you want to do with the artefact?", callback);
	end
	sd:setCloseOnMove();
	
    for _,m in ipairs(options) do 
      sd:addOption(0,m);
    end
    User:requestSelectionDialog(sd);
    return;
	
end


--Checks if Wand is in hands

function checkInHands(User, SourceItem)

	if base.common.IsItemInHands(SourceItem) == true then
		return true;		
	else
		User:inform("Nimm den Zauberstab in die Hand", "Take the wand in your hand")
		return false;		
	end

end



--Makes one able to chose an item

function choseItemDialog(User, action,magicItems, ltstate)
	
	local dialogTitle, dialogInfoText
	local language = User:getPlayerLanguage();
	
	--Set dialogmessages
	if language == 0 then --german
		dialogTitle = "Verzaubern";
		dialogInfoText = "Wähle den Gegenstand aus, den du verzaubern möchtest:";
		
	else --english
		dialogTitle = "Enchant";
		dialogInfoText = "Please choose an item you wish to enchant:";
		
	end

	--get all the items the char has on him, without the stuff in the backpack
	local itemsOnChar = {};
	local itemPosOnChar = {};
	
	for i=17,0,-1 do 
		local item = User:getItemAt(i);
		if (item.id > 0) and (item.number == 1) then 
		
			if isElementOfList(item.id, magicItems.wands) then
				table.insert(itemsOnChar, item);
				table.insert(itemPosOnChar, itemPos[i]);
			
			elseif isElementOfList(item.id, magicItems.fire) then
				table.insert(itemsOnChar, item);
				table.insert(itemPosOnChar, itemPos[i]);
			
			elseif isElementOfList(item.id, magicItems.water) then
				table.insert(itemsOnChar, item);
				table.insert(itemPosOnChar, itemPos[i]);
			
			elseif isElementOfList(item.id, magicItems.air) then
				table.insert(itemsOnChar, item);
				table.insert(itemPosOnChar, itemPos[i]);
			
			end
		end
	end
					
	local cbChooseItem = function (dialog)
		if (not dialog:getSuccess()) then
			return;
		end
		local index = dialog:getSelectedIndex()+1;
		local chosenItem = itemsOnChar[index]
		
		enchantingItem[User.id] = chosenItem.itempos;
		if chosenItem ~= nil then
			
			if action == 1 then 
				
				enchantItem(User, chosenItem, magicItems, ltstate)
				elseif action == 2 then 
				analyseItem(User, chosenItem)
				
			else
				chargeItem(User, chosenItem, ltstate)
				
			
			end
		else			
			User:inform("[ERROR] Something went wrong, please inform a developer.");
		end
	end
	local sdItems = SelectionDialog(dialogTitle, dialogInfoText, cbChooseItem);
	sdItems:setCloseOnMove();
	local itemName, itemPosText;
	for i,item in ipairs(itemsOnChar) do 
		itemName = world:getItemName(item.id,language)
		itemPosText = base.common.GetNLS(User, itemPosOnChar[i].de, itemPosOnChar[i].en)
		sdItems:addOption(item.id,itemName .. " (" .. itemPosText .. ")\n");
	end	
	User:requestSelectionDialog(sdItems);
end


--Makes on Able to Analyse an enchanted item

function analyseItem(User, chosenItem)
	
	local language = User:getPlayerLanguage()
	local loadsEn = {"burned out" , "nearly empty", "weak", "weakend", "loaded"};
	local loadsDe = {"ausgebrannten", "fast leeren", "schwachen", "geschächten", "geladenen"};
	
	local levelsEn = {"weak", "slightly", "simple", "moderate", "average", "superior", "good", "very good","excellent", "outstanding", "masterly"};
	local levelsDe = {"schwachen", "leichten", "einfachen", "mäßigen", "durchschnittlichen", "überdurchschnittlichen", "guten", "sehr guten", "exzellent", "außergewöhnlichen", "meisterhaften"};
	
	local itemLoad;
	local itemLevel;
	
	if chosenItem:getData("magicLevel") == "" then
			User:inform("Der Gegenstand wurde noch nicht verzaubert", "This item has not been enchanted yet.")
	else
	
		if chosenItem:getData("magicLoad") == "" then
			chosenItem:setData("magicLoad",0)
			world:changeItem(chosenItem);
		end
		
		if tonumber(chosenItem:getData("magicLevel"))/10 < #levelsEn-1 then
			itemLevel = math.floor(tonumber(chosenItem:getData("magicLevel"))/10) +1 
		else
			itemLevel = #levelsEn
		end
		
		
		if tonumber(chosenItem:getData("magicLoad"))/20 < #loadsEn-1 then
			itemLoad = math.floor(tonumber(chosenItem:getData("magicLoad"))/20) +1
		else
			itemLoad = #loadsEn
		end
		
		User:inform(firstToUpper(tostring(world:getItemName(chosenItem.id,language)).. " mit einer " .. tostring(levelsDe[itemLevel]) .. " Verzauberung und einer " .. tostring(loadsDe[itemLoad]) .. " Struktur"),firstToUpper( tostring(world:getItemName(chosenItem.id,language)).. " with a " .. tostring(levelsEn[itemLevel]) .. " enchantment and a " .. tostring(loadsEn[itemLoad]) .. " structure"))
		
	end

end


--Makes the first letter of a String a capital
function firstToUpper(str)
    return (str:gsub("^%l", string.upper))
end


--Checks if item is Element of a List

function isElementOfList(number, list)

	for i=1, #list do
		
		if list[i] == number then
		return true;
		end
		
	end
	
	return false;
end


--Enchantmode for the Item

function enchantItem(User, chosenItem, magicItems, ltstate)

	local itemLevel;
	local language = User:getPlayerLanguage()
	local skillName = Character.enchanting;
	local skillLevel = User:getSkill(Character.enchanting)
	local amount;
	local costs;
	
	
	
	if chosenItem:getData("magicLevel") == "" then 
		itemLevel=0;
	else
		if tonumber(chosenItem:getData("magicLevel"))/10 < 9 then
			itemLevel = math.floor(tonumber(chosenItem:getData("magicLevel"))/10) +1 
		else
			itemLevel = 10
		end
	end
	
	amount, costs = calculateCosts(User,itemLevel,chosenItem, magicItems)
	enchantingCosts[User.id] = {amount, costs}
	
	
	if itemLevel == 10 or costs == nil then
	
		User:inform("Du kannst diesen Gegenstand nicht stärker verzaubern.", "You cannot enchant this item anymore.")
		
	elseif itemLevel > skillLevel/10 then
		
		User:inform("Du bist nicht mächtig genug um diesen Gegenstand zu stärker zu verzaubern.", "You are not mighty enough to enchant this item at the moment.")
		
	elseif amount > User:countItemAt("all",costs,{}) then
			
			local itemName = world:getItemName(costs, language)
			
			User:inform("Du benötigst: " .. tostring(amount) .. " Mal " .. itemName .. " für die Verzauberung", "You need: ".. tostring(amount) .. " times " .. itemName .. " for the enchantment")
	else
		
		if (ltstate == Action.none) then
			enchantingAction[User.id] = "enchanting"
			User:startAction(200,52,40,13,50);
			User:talk(Character.say, "#me beginnt mit der Verzauberung", "#me starts with the enchantment.")
			
			return;
		end
		
		
	end
		
end

--Sets the new Magic Level

function setNewMagicLevel(User,magicItems)
	
	local item = User:getItemAt(enchantingItem[User.id])
		
	if isElementOfList(item.id,magicItems.wands) then
		if item:getData("magicLevel") == "" then
			item:setData("magicLevel", 1)
		else
			local level =  math.floor(tonumber(item:getData("magicLevel"))/10)
			item:setData("magicLevel", (level + 1)*10)
		end
		
	elseif isElementOfList(item.id,magicItems.fire) then
		item:setData("magic", 36)
		if item:getData("magicLevel") == "" then
			item:setData("magicLevel", 1)
		else
			local level =  math.floor(tonumber(item:getData("magicLevel"))/10)
			item:setData("magicLevel", (level + 1)*10)
		end
		
	elseif isElementOfList(item.id,magicItems.air) then
		item:setData("magic", 4)
		if item:getData("magicLevel") == "" then
			item:setData("magicLevel", 1)
		else
			local level =  math.floor(tonumber(item:getData("magicLevel"))/10)
			item:setData("magicLevel", (level + 1)*10)
		end	
		
	elseif isElementOfList(item.id,magicItems.water) then
		item:setData("magic", 9)
		if item:getData("magicLevel") == "" then
			item:setData("magicLevel", 1)
		else
			local level =  math.floor(tonumber(item:getData("magicLevel"))/10)
			item:setData("magicLevel", (level + 1)*10)
		end	
		
	end
	world:changeItem(item);
	User:inform("Verzaubert zu:", "Enchanted to:")
	analyseItem(User, item)
	
end

--calculates costs for enchantment

function calculateCosts(User,itemLevel,chosenItem,magicItems)
	
	
	local resource;
	local ammount;

	if isElementOfList(chosenItem.id, magicItems.wands) then
	
		if itemLevel < 5 then
			ammount = itemLevel*5 + 5;
			
			if chosenItem.id == 2782 then --wand of earth
				resource = 45;
			elseif chosenItem.id == 2783 then --wand of fire
				resource = 46;
			elseif chosenItem.id == 2784 then -- wand of water
				resource = 284;
			elseif chosenItem.id == 2785 then -- wand of wind
				resource = 283;
			elseif chosenItem.id == 323 then -- wand
				resource = 285;
			end
						
		else
			if itemLevel == 5 then 
				ammount = 1;
			elseif itemLevel < 9 then
				ammount = 2;
			else 
				ammount = 3;
			end
			
			if chosenItem.id == 2782 then --wand of earth
				resource = 2552;
			elseif chosenItem.id == 2783 then --wand of fire
				resource = 2553;
			elseif chosenItem.id == 2784 then -- wand of water
				resource = 2554;
			elseif chosenItem.id == 2785 then -- wand of wind
				resource = 2551;
			elseif chosenItem.id == 323 then -- wand
				resource = nil
			end
				
		end
					
	else
		ammount = itemLevel*5 + 5;
		
		if isElementOfList(chosenItem.id, magicItems.fire) then
			resource = 46;		
		elseif isElementOfList(chosenItem.id, magicItems.water) then
			resource = 284;
		elseif isElementOfList(chosenItem.id, magicItems.air) then
			resource = 283;
		end
	end

	return ammount, resource
	
end

function chargeItem(User, chosenItem, ltstate)
	local load;
	local willpower = User:increaseAttrib("willpower",0)
	local essence = User:increaseAttrib("essence",0)
	local intellligence = User:increaseAttrib("intelligence",0)
	local maxLoads = ((willpower-2) + (essence-2) + (intellligence-1))*4
	local level = tonumber(chosenItem:getData("magicLevel"))
	local skillLevel = User:getSkill(Character.enchanting)
	
	if chosenItem:getData("magicLevel") == "" then 
		User:inform("Dieser Gegenstand ist nicht Verzaubert", "This item is not enchanted");
		return;
	else
		if chosenItem:getData("magicLoad") == "" then 
			load = 0;
		else
			load = tonumber(chosenItem:getData("magicLoad"))
		end
	
		if level-1 > skillLevel then
		
			User:inform("Diese Struktur ist zu Komplex für dich um sie aufzuladen.", "This structure is to complex for you to charge it.")
		else
			if maxLoads > load then
				changeItemCharge(User, chosenItem, maxLoads-load, ltstate)
			else
				User:inform("Du kannst diese Struktur nicht aufladen.", "You cannot charge this structure.")
			end
		end
		
	end

end


function changeItemCharge(User, chosenItem, loads, ltstate)

	enchantingAction[User.id] = loads
	User:startAction(loads,52,40,13,50);
	User:talk(Character.say, "#me die magische Struktur aufzuladen.", "#me begins to charge the magic structure.")
	return;
end


function loadItem(User)

		local item = User:getItemAt(enchantingItem[User.id])
		local loss = -9999*(enchantingAction[User.id]/212)
		item:setData("magicLoad", enchantingAction[User.id])
		world:changeItem(item);
		User:inform("Verzaubert zu:", "Enchanted to:")
		analyseItem(User, item)
		
		User:increaseAttrib("mana", loss)
		
end

-- UPDATE common SET com_script='item.id_463_quill' WHERE com_itemid IN (463);
require("base.common")
require("alchemy.base.alchemy")
require("base.lookat")
require("alchemy.base.recipe_creation")

module("item.id_463_quill", package.seeall)

function UseItem(User, SourceItem, ltstate)
    
	if SourceItem.itempos ~= 5 and SourceItem.itempos ~= 6 then
	    User:inform("Du musst die Schreibfeder in der Hand halten.","You have to hold the quill in your hand.",Character.lowPriority)
		return
	end	
	
	local callback = function(dialog) 
		local success = dialog:getSuccess() 
		if success then
			local selected = dialog:getSelectedIndex()+1
			if selected == 1 then
			    if not CheckIfBottleInHand(User) then
				    User:inform("Du brauchst eine Flasche, um diese zu beschrfiten.","You need a bottle if you want to label one.",Character.lowPriority)
				    return
                else
                    WriteLabel(User,SourceItem)
			    end
			elseif selected == 2 then
			    local parchment = alchemy.base.recipe_creation.GetParchmentQuill(User)
				parchment = alchemy.base.recipe_creation.IsParchmentOK(User,parchment,ingredientsList)
				if not parchment then
					return
				else
				    alchemy.base.recipe_creation.FirstMenu(User, ingredientsList)
				end
			if selected == 3 then
			    if not CheckIfContainerPresent(User) then
				    User:inform("Du brauchst eine Tasche, um diese zu beschrfiten.","You need a bag if you want to label one.",Character.lowPriority)
				    return
                else
                    WriteContainerLabel(User,SourceItem)
			    end
            end    			
		end
	end

	local dialog = SelectionDialog(getText(User,"Schreibfeder","Quill") , getText(User,"Wähle aus, was du machen willst.","Select what you want to do.") , callback)
	dialog:addOption(0, getText(User,"Trankflasche beschriften","Label potion bottle"))
	dialog:addOption(0, getText(User,"Alchemierezept schreiben","Write an alchemy recipe"))
	dialog:addOption(0, getText(User,"Tasche beschriften","Label bag"))

	User:requestSelectionDialog(dialog)
	
	
end

containerList = {97,320, 321, 799, 1367, 2830};

function CheckIfCotainerPresent(User)
	local containerItem;

	for i=1,#containerList do
		containerItem = User:getItemAt(0);
		if (containerItem.id == containerList[i]) then
			return containerItem;
		end
	end
	return nil;		
end

function CheckIfBottleInHand(User)

	local bottleList = alchemy.base.alchemy.bottleList
	for i=1,((#bottleList)+1) do
		local ItemA = User:getItemAt(5)
		local ItemB = User:getItemAt(6)
		if (ItemA.id == bottleList[i]) or (ItemA.id == 164) then
			return ItemA
		elseif (ItemB.id == bottleList[i]) or (ItemB.id == 164) then
			return ItemB
		end
	end
	return nil		
end

function WriteContainerLabel(User,SourceItem)
    
	local title = getText(User, "Taschenbeschriftung", "Bag labelling");
	local infoText = getText(User, "Füge hier den Text ein, mit dem du die Tasche beschriften willst.", "Insert the text you want to write on the label." )
	
	-- input dialog
	local callback = function(dialog)
		if not dialog:getSuccess() then
			return;
		else
			local bag = CheckIfContainerPresent(User) -- check for the bag again
			if bag then
				local labelText = dialog:getInput()
				base.lookat.SetSpecialDescription(bag,"Beschriftung: ".."\""..labelText.."\"","Label: ".."\""..labelText.."\"")
				world:changeItem(bag)
			else
                User:inform("Du brauchst eine Tasche, um diese zu beschrfiten.","You need a bag if you want to label one.")
            end				
		end
	end
	local dialog = InputDialog(title, infoText, false, 100, callback)
	User:requestInputDialog(dialog)
	
end

function WriteLabel(User,SourceItem)
    
	local title
	local infoText
    if User:getPlayerLanguage() == 0 then
	    title = "Tranketikettierung" 
		infoText = "Füge hier den Text ein, mit dem du das Etikett beschriften willst."
	else
        title = "Potion labelling"
		infoText = "Insert the text you want to write on the label." 
    end	
	
	-- input dialog
	local callback = function(dialog)
		if not dialog:getSuccess() then
			-- player canceld the dialog; nothing
		else
			local bottle = CheckIfBottleInHand(User) -- check for the bottle again
			if bottle then
				if bottle.number > 1 then
					User:inform("Du kannst immer nur eine Flasche beschriften.","You can label only one bottle at once.")		
					return
				end
				local labelText = dialog:getInput()
				base.lookat.SetSpecialDescription(bottle,"Flaschenetikett: ".."\""..labelText.."\"","Bottle label: ".."\""..labelText.."\"")
				world:changeItem(bottle)
			else
                User:inform("Du brauchst eine Flasche, um diese zu beschrfiten.","You need a bottle if you want to label one.")
            end				
		end
	end
	local dialog = InputDialog(title, infoText, false, 100, callback)
	User:requestInputDialog(dialog)
	
end

function getText(User,deText,enText) 
    return base.common.base.common.GetNLS(User,deText,enText) 
end
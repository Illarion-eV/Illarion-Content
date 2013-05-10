-- UPDATE common SET com_script='item.id_463_quill' WHERE com_itemid IN (463);
require("base.common")
require("alchemy.base.alchemy")
require("base.lookat")
require("alchemy.base.recipe_creation")

module("item.id_463_quill", package.seeall)

function UseItem(User, SourceItem, ltstate)
    
	-- we check if the char holds a bottle to label it
	local bottle = CheckIfBottleInHand(User)
	if bottle then 
		WriteLabel(User,SourceItem)
	end
	return
    
	
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
            end    			
		end
	end

	local dialog = SelectionDialog(getText(User,"Schreibfeder","Quill") , getText(User,"Wähle aus, was du machen willst.","Select what you want to do.") , callback)
	dialog:addOption(0, getText(User,"Trankflasche beschriften","Label potion bottle"))
	dialog:addOption(0, getText(User,"Alchemierezept schreiben","Write an alchemy recipe"))

	User:requestSelectionDialog(dialog)
	
	
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
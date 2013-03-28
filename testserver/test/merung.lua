require("development.recipe_creation")
require("alchemy.base.brewing")

-- UPDATE common SET com_script = 'test.merung' WHERE com_itemid = 1266;

module("test.merung", package.seeall)

function UseItem(User, SourceItem,ltstate)
	--User:increaseAttrib("essence",30)
	local callback = function(dialog) 
		success = dialog:getSuccess() 
		if success then
			selected = dialog:getSelectedIndex() 
			User:inform("Success, you selected option "..selected+1) 
		else
			User:inform("Selection aborted!") 
		end
	end

	local dialog = SelectionDialog("Selection 0", "Select some stuff...", callback)
	dialog:setCloseOnMove()
	dialog:addOption(133, "Essence brew based on amethyst powder, containing: night angels blossom, night angels blossom, night angels blossom, night angels blossom, night angels blossom, night angels blossom, night angels blossom, night angels blossom")

	User:requestSelectionDialog(dialog)
	
	
	--[[
	if User.lastSpokenText == "rezept" then
		if SourceItem:getType()==4 then
			if SourceItem.itempos == 5 or SourceItem.itempos == 6 then
				development.recipe_creation.FirstMenu(User, ingredientsList)
			else
				User:inform("Du musst ihn in die Hand nehmen","You have to hold it in your hands")
			end
		else
			User:inform("Du musst ihn in die Hand nehmen","You have to hold it in your hands")
		end	
	end	
	
	if User.lastSpokenText == "brau" then
		theItem = User:getItemAt(5)
	    if theItem.id == 0 then
            return
        end
		if (ltstate == Action.none) then
		   User:startAction(50,21,5,15,25);
		   return
	    end
		if ( ltstate == Action.abort ) then
		    User:inform("Nevermind that shit. Here comes Mongo")
	        return
	    end
		alchemy.base.brewing.UseItem(User, theItem)
	end	
    ]]        		
	
	
end

function LookAtItem(player, item)
    
end	
require("development.recipe_creation")
require("alchemy.base.brewing")

-- UPDATE common SET com_script = 'test.merung' WHERE com_itemid = 1266;

module("test.merung", package.seeall)
--[[
function ltstateCheck(User, ltstate, counter)
 
	if (ltstate == Action.none) then
		User:startAction(50,21,5,15,25);
		return
	end
	if ( ltstate == Action.abort ) then
		User:inform("Nevermind that shit. Here comes Mongo")
     	return
	end
	User:inform("counter: "..counter)
   
	ltstateCheck(User, ltstate, counter+1)
	
end    --]]
 
function UseItem(User, SourceItem,ltstate,newVar)
--[[
	if User.lastSpokenText == "ltstate" then       
	    ltstateCheck(User, ltstate, 1)
		return
	end 
--]]
User:inform("called use item")
    if newVar == 5 then
	    User:inform("newVar is 5. end script")
	else
		User:inform("newVar not 5")
		UseItem(User, SourceItem,ltstate,5)
	end
--[[
	if (ltstate == Action.none) then
		if USER_POSITION_LIST == nil then
			USER_POSITION_LIST = {}
		end
		
		local callback = function(dialog) 
			success = dialog:getSuccess() 
			if success then
				selected = dialog:getSelectedIndex()+1
				User:inform("Success, you selected option "..selected)
				USER_POSITION_LIST[User.name] = selected
				UseItem(User, SourceItem,ltstate)
			else
				User:inform("Selection aborted!") 
			end
		end

		local dialog = SelectionDialog("Selection 0", "Select some stuff...", callback)
		dialog:setCloseOnMove()
		dialog:addOption(0, "1")
		dialog:addOption(0, "2")
		dialog:addOption(0, "3")
		dialog:addOption(0, "4")

		User:requestSelectionDialog(dialog)
		
		User:startAction(50,21,5,15,25);
		return
	end
	if ( ltstate == Action.abort ) then
		User:inform("Nevermind that shit. Here comes Mongo")
     	return
	end
]]

end




function LookAtItem(player, item)
    
end	
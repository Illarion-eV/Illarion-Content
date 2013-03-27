require("development.recipe_creation")
require("alchemy.base.brewing")

-- UPDATE common SET com_script = 'test.merung' WHERE com_itemid = 1266;

module("test.merung", package.seeall)

function UseItem(User, SourceItem,ltstate)
	--User:increaseAttrib("essence",30)
	counter = 0
	if (ltstate == Action.none) then
	   User:startAction(50,21,5,15,25);
	   return
	end
	if ( ltstate == Action.abort ) then
		User:inform("Nevermind that shit. Here comes Mongo")
		return
	end
	User:inform(""..counter)
	counter = counter + 1

	User:startAction(50,21,5,15,25);
	
	
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
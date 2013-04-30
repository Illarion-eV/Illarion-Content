require("development.recipe_creation")
require("alchemy.base.brewing")

-- UPDATE common SET com_script = 'test.merung' WHERE com_itemid = 1266;

module("test.merung", package.seeall)

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
	
end    
 
function UseItem(User, SourceItem,ltstate)

	if User.lastSpokenText == "ltstate" then       
	    ltstateCheck(User, ltstate, 1)
	end    
end


function LookAtItem(player, item)
    
end	
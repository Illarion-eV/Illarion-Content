require("development.recipe_creation")
require("alchemy.base.brewing")

-- UPDATE common SET com_script = 'test.merung' WHERE com_itemid = 1266;

module("test.merung", package.seeall)

 
function UseItem(User, SourceItem,ltstate)
    if User.lastSpokenText == "alchemist" then
	    User:setMagicType(3)
		User:increaseAttrib("essence",30)
	    User:inform("You are no an alchemist.")
		return
	end
	
	
	development.recipe_creation.FirstMenu(User, ingredientsList)
end




function LookAtItem(player, item)
    
end	
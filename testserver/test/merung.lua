require("development.recipe_creation")

-- UPDATE common SET com_script = 'test.merung' WHERE com_itemid = 1266;

module("test.merung", package.seeall)

function UseItem(User, SourceItem)
	
	User:increaseAttrib("essence",30)
    development.recipe_creation.FirstMenu(User, ingredientsList)
	
	
end

function LookAtItem(player, item)
    
end	
require("development.recipe_creation")

-- UPDATE common SET com_script = 'test.merung' WHERE com_itemid = 1266;

module("test.merung", package.seeall)

function UseItem(User, SourceItem)
	
	if SourceItem == User:getItemAt(5) or SourceItem == User:getItemAt(6) then
		User:increaseAttrib("essence",30)
		development.recipe_creation.FirstMenu(User, ingredientsList)
	else
        User:inform("Du musst ihn in die Hand nehmen","You have to hold it in your hands")
    end		
	
	
end

function LookAtItem(player, item)
    
end	
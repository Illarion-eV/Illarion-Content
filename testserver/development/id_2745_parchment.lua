require("base.common")
require("alchemy.base.alchemy")

module("development.id_2745_parchment", package.seeall)


function UseItem(User, SourceItem, ltstate)

    -- alchemy recipe?
    if SourceItem:getData("alchemyRecipe") == "true" then
	    AlchemyRecipe(User, SourceItem, ltstate)
		return
	end	
	
end

function AlchemyRecipe(User, SourceItem, ltstate)

    if alchemy.base.alchemy.GetCauldronInfront(User) then 
	    UseRecipe(User, SourceItem, ltstate)
	else
        ShowRecipe(User, SourceItem)
	end	

end

function UseRecipe(User, SourceItem, ltstate)
    User:inform("still to do")
end

function ShowRecipe(User, SourceItem)
    local ingredientsList = getIngredients(SourceItem)
	ShowRecipe(User, ingredientsList, true) 
end

function getIngredients(SourceItem)
debug("check")
    local ingredientsList = {}
	for i=1,60 do
		if SourceItem:getData("ingredient"..i) ~= "" then
			if tonumber(SourceItem:getData("ingredient"..i)) ~= nil then
				table.insert(ingredientsList,tonumber(SourceItem:getData("ingredient"..i)))
			else
				table.insert(ingredientsList,SourceItem:getData("ingredient"..i))
			end
		else
			break
		end
	end
    return ingredientsList

end
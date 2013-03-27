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
        ViewRecipe(User, SourceItem)
	end	

end

function UseRecipe(User, SourceItem, ltstate)
    -- herbs ok
	-- gemdust ok
	-- water ok
	-- empty bottle ok
	-- stock ok
	-- [red, pink, white, black, yellow, dark blue] ok
	-- blue ok
	
	-- is the char an alchemist?
	local anAlchemist = alchemy.base.alchemy.CheckIfAlchemist(User,"Nur jene, die in die Kunst der Alchemie eingeführt worden sind, können hier ihr Werk vollrichten.","Only those who have been introduced to the art of alchemy are able to work here.")
	if not anAlchemist then
		return
	end
	
	if ( User:increaseAttrib("perception",0) + User:increaseAttrib("essence",0) + User:increaseAttrib("intelligence",0) ) < 30 then 
		User:inform("Verstand, ein gutes Auge und ein Gespür für die feinstofflichen Dinge - dir fehlt es daran, als dass du hier arbeiten könntest.",
		            "Mind, good eyes and a feeling for the world of fine matter - with your lack of those, you are unable to work here."
	                )
		return
    end
	
	local ingredientsList = getIngredients(SourceItem) 
	
end

function ViewRecipe(User, SourceItem)
    local ingredientsList = getIngredients(SourceItem)
	development.recipe_creation.ShowRecipe(User, ingredientsList, true) 
end

function getIngredients(SourceItem)

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
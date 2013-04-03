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
	
	RemoveOldDatas(User, SourceItem)
	
	StartBrewing(User, SourceItem, ltstate)
end

function StartBrewing(User, SourceItem, ltstate)
    local ingredientsList = getIngredients(SourceItem)
	local cauldron = alchemy.base.alchemy.GetCauldronInfront(User)
	
	if (ltstate == Action.none) then
	    local actionList = alchemy.base.alchemy.GetStartAction(User, ingredientsList[2], cauldron)
		User:startAction(actionList[1],actionList[2],actionList[3],actionList[4],actionList[5])
		return
	end	
	
	
	
	
	
	
	
	local recipeStep 
	if tonumber(SourceItem:getData("recipeStep")) == nil then
	    recipeStep = 1 
	else	
		recipeStep = tonumber(SourceItem:getData("recipeStep"))+1
	end	
	
end

function RemoveOldDatas(User, SourceItem)
    if SourceItem:getData("recipeCounter")~="" then
	    SourceItem:setData("recipeCounter","")
		world:changeItem(SourceItem)
	end
    
    local cleanUpList = {59,164,165,166,167,327,329,330,331}
	for i=1,#cleanUpList do
	    local checkList = User:getItemList(cleanUpList[i])
		for j=1,#checkList do
		    if checkList[i]:getData("recipeBottled") ~= "" then
			    checkList[i]:setData("recipeBottled","")
			    world:changeItem(checkList[i])	
			end
        end
    end		
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
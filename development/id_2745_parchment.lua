require("base.common")
require("alchemy.base.alchemy")
require("alchemy.base.herbs")

module("development.id_2745_parchment", package.seeall)


function UseItem(User, SourceItem,ltstate,checkVar)

    -- alchemy recipe?
    if SourceItem:getData("alchemyRecipe") == "true" then
	    AlchemyRecipe(User, SourceItem,ltstate,checkVar)
		return
	end	
	
end

function AlchemyRecipe(User, SourceItem,ltstate,checkVar)

    if alchemy.base.alchemy.GetCauldronInfront(User) then 
	    UseRecipe(User, SourceItem,ltstate,checkVar)
	else
        ViewRecipe(User, SourceItem)
	end	

end

function UseRecipe(User, SourceItem,ltstate,checkVar)
    -- herbs ok
	-- gemdust ok
	-- water ok
	-- empty bottle ok
	-- stock ok
	-- [red, pink, white, black, yellow, dark blue] ok
	-- blue ok
	
	-- is the char an alchemist?
	local anAlchemist = alchemy.base.alchemy.CheckIfAlchemist(User)
	User:inform("Nur jene, die in die Kunst der Alchemie eingeführt worden sind, können hier ihr Werk vollrichten.","Only those who have been introduced to the art of alchemy are able to work here.")
	if not anAlchemist then
		return
	end
	
	if ( User:increaseAttrib("perception",0) + User:increaseAttrib("essence",0) + User:increaseAttrib("intelligence",0) ) < 30 then 
		User:inform("Verstand, ein gutes Auge und ein Gespür für die feinstofflichen Dinge - dir fehlt es daran, als dass du hier arbeiten könntest.",
		            "Mind, good eyes and a feeling for the world of fine matter - with your lack of those, you are unable to work here."
	                )
		return
    end
	
	StartBrewing(User, SourceItem,ltstate,checkVar)
end

function StartBrewing(User,SourceItem,ltstate,checkVar)
    local ingredientsList = getIngredients(SourceItem)
	local cauldron = alchemy.base.alchemy.GetCauldronInfront(User)
	
	if not cauldron then -- security check
		return
	end
	
	if ( ltstate == Action.abort ) then
		base.common.InformNLS(User, "Du brichst deine Arbeit ab.", "You abort your work.")
		return
	end
	
	if not checkVar and ltstate==Action.none then
	    
		if USER_POSITION_LIST == nil then -- note: it's global!
			USER_POSITION_LIST = {}
		end
	    
		local callback = function(dialog)
			local success = dialog:getSuccess() 
			if success then 
				selected = dialog:getSelectedIndex()+1
				USER_POSITION_LIST[User.id] = selected
				StartBrewing(User, SourceItem,ltstate,true)
			end
		end
		local dialog = SelectionDialog(getText("Rezept","Recipe"), getText("Wähle die Zutat aus, ab welcher das Rezept abgearbeitet werden soll.","Select the ingredient where you want to start to brew from."), callback)
		dialog:setCloseOnMove()
		if #ingredientsList > 0 then
			for i=1,#ingredientsList do
				if type(ingredientsList[i])=="string" then 
					--[[
					if string.find(ingredientsList[i],"bottle") then
						dialog:addOption(164, getText("Abfüllen","Bottling"))
					else	
						local liquid, liquidList = StockEssenceList(ingredientsList[i])
						if liquid == "stock" then
							dialog:addOption(331, getText("Sud","Stock"))
						elseif liquid == "essence brew" then
							dialog:addOption(liquidList[1], getText("Essenzgebräu","Essence brew"))
						end		
					end]]
				else
					dialog:addOption(ingredientsList[i], getText(world:getItemName(ingredientsList[i],Player.german),world:getItemName(ingredientsList[i],Player.english)))
				end
			end
			User:requestSelectionDialog(dialog)
		end
	end	
	
	if (ltstate == Action.none) then
		
		local duration,gfxId,gfxIntervall,sfxId,sfxIntervall = GetStartAction(User, "plant", cauldron)
		
		User:startAction(duration,gfxId,gfxIntervall,sfxId,sfxIntervall);
		return
	
	end
	
	if User:countItemAt("all",plantId,{}) then
		User:inform("missing: "..plantId)
		return
	end	
	alchemy.base.herbs.BeginnBrewing(User,plantId,cauldron)
	
	local duration,gfxId,gfxIntervall,sfxId,sfxIntervall = GetStartAction(User, "plant", cauldron)
		
	User:startAction(duration,gfxId,gfxIntervall,sfxId,sfxIntervall);
	
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

function getText(deText,enText) 
    return base.common.base.common.GetNLS(User,deText,enText) 
end
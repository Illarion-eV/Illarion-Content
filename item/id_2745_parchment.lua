require("base.common")
require("alchemy.base.alchemy")
require("alchemy.base.herbs")
require("item.id_52_filledbucket")
require("alchemy.item.id_331_green_bottle")
require("alchemy.base.gemdust")
require("item.id_164_emptybottle")

module("item.id_2745_parchment", package.seeall)

-- important: do not remove the fourth parameter "checkVar". 
-- it is important for alchemy
-- you can just ignore it
function UseItem(User, SourceItem,ltstate,checkVar)

    -- Check if it is an alchemy recipe. 
    if SourceItem:getData("alchemyRecipe") == "true" then
	    AlchemyRecipe(User, SourceItem,ltstate,checkVar)
		return
	end	
	
	
	
end



---------------- ALCHEMY -------------------------------
--------------------------------------------------------
function AlchemyRecipe(User, SourceItem,ltstate,checkVar)
    
	
    if alchemy.base.alchemy.GetCauldronInfront(User) then 
	    -- The char wants to use the recipe infront of a cauldron.
		UseRecipe(User, SourceItem,ltstate,checkVar)
	else
        -- Not infront of a cauldron. 
		ViewRecipe(User, SourceItem)
	end	

end

function UseRecipe(User, SourceItem,ltstate,checkVar)
    
	
	-- is the char an alchemist?
	local anAlchemist = alchemy.base.alchemy.CheckIfAlchemist(User)
	if not anAlchemist then
		User:inform("Nur jene, die in die Kunst der Alchemie eingeführt worden sind, können hier ihr Werk vollrichten.","Only those who have been introduced to the art of alchemy are able to work here.")
		return
	end
	
	-- proper attriutes?
	if ( User:increaseAttrib("perception",0) + User:increaseAttrib("essence",0) + User:increaseAttrib("intelligence",0) ) < 30 then 
		User:inform("Verstand, ein gutes Auge und ein Gespür für die feinstofflichen Dinge - dir fehlt es daran, als dass du hier arbeiten könntest.",
		            "Mind, good eyes and a feeling for the world of fine matter - with your lack of those, you are unable to work here."
	                )
		return
    end
	
	-- let's start!
	StartBrewing(User, SourceItem,ltstate,checkVar)
end

function StartBrewing(User,SourceItem,ltstate,checkVar)
    local ingredientsList = getIngredients(SourceItem)
	local cauldron = alchemy.base.alchemy.GetCauldronInfront(User)
	
	if not cauldron then -- security check
		return
	end
	
	if ( ltstate == Action.abort ) then
		User:inform("Du brichst deine Arbeit vor dem "..USER_POSITION_LIST[User.id]..". Arbeitsschritt ab.", "You abort your work before the "..USER_POSITION_LIST[User.id].." work step.")
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
		local dialog = SelectionDialog(getText(User,"Rezept","Recipe"), getText(User,"Wähle die Zutat aus, ab welcher das Rezept abgearbeitet werden soll.","Select the ingredient where you want to start to brew from."), callback)
		dialog:setCloseOnMove()
		if #ingredientsList > 0 then
			local counter = 0
			for i=1,#ingredientsList do
				counter = counter + 1
				if type(ingredientsList[i])=="string" then 
					if string.find(ingredientsList[i],"bottle") then
						dialog:addOption(164, getText(User,counter..". Abfüllen",counter..". Bottling"))
					else	
						local liquid, liquidList = alchemy.base.recipe_creation.StockEssenceList(ingredientsList[i])
						if liquid == "stock" then
							dialog:addOption(331, getText(User,counter..". Sud",counter..". Stock"))
						elseif liquid == "essence brew" then
							dialog:addOption(liquidList[1], getText(User,counter..". Essenzgebräu",counter..". Essence brew"))
						end		
					end
				else
					dialog:addOption(ingredientsList[i], getText(User,counter..". "..world:getItemName(ingredientsList[i],Player.german),counter..". "..world:getItemName(ingredientsList[i],Player.english)))
				end
			end
			User:requestSelectionDialog(dialog)
			return
		end
	end	
	
	local deleteItem, deleteId, missingDe, missingEn = GetItem(User, ingredientsList)
	
	if missingDe then
		User:inform("Du brichst deine Arbeit vor dem "..USER_POSITION_LIST[User.id]..". Arbeitsschritt ab. "..missingDe, "You abort your work before the "..USER_POSITION_LIST[User.id].." work step. "..missingEn)
		return
	end    
	
	if (ltstate == Action.none) then
		
		local duration,gfxId,gfxIntervall,sfxId,sfxIntervall = GetStartAction(User, ingredientsList, cauldron)
		User:startAction(duration,gfxId,gfxIntervall,sfxId,sfxIntervall);
		return
	
	end
	
	CallBrewFunctionAndDeleteItem(User,deleteItem, deleteId,cauldron)
	
	USER_POSITION_LIST[User.id] = USER_POSITION_LIST[User.id]+1
	
	if USER_POSITION_LIST[User.id] > #ingredientsList then
	    User:inform("end")
		return
    else
		local duration,gfxId,gfxIntervall,sfxId,sfxIntervall = GetStartAction(User, ingredientsList, cauldron)
		User:startAction(duration,gfxId,gfxIntervall,sfxId,sfxIntervall);
	end	
	
end

function CallBrewFunctionAndDeleteItem(User,deleteItem, deleteId,cauldron)

    if deleteId then
	    if deleteId == 52 then -- water
			local buckets = User:getItemList(deleteId) 
			-- here, we could need a check if the bucket has no datas
			item.id_52_filledbucket.FillIn(User, buckets[1], cauldron, true)
			
		elseif alchemy.base.alchemy.CheckIfGemDust(deleteId) then	--gemdust
			alchemy.base.gemdust.BrewingGemDust(User,deleteId,cauldron)
			local data = {}
			User:eraseItem(deleteId,1,data)
			
		elseif alchemy.base.alchemy.getPlantSubstance(deleteId) or deleteId == 157 then -- plant/rotten tree bark
            alchemy.base.herbs.BeginnBrewing(User,deleteId,cauldron)
			local data = {}
			User:eraseItem(deleteId,1,data)
        end
	
	else
	    if deleteItem.id == 164 then -- empty bottle
		    item.id_164_emptybottle.FillIntoBottle(User, deleteItem, cauldron)
			
		elseif deleteItem.id == 331 then -- stock
			alchemy.item.id_331_green_bottle.FillStockIn(User,deleteItem, cauldron)
			
		elseif alchemy.base.alchemy.CheckIfPotionBottle(deleteItem) then
		    alchemy.base.alchemy.FillIntoCauldron(User,deleteItem,cauldron)
		end
	end	
		
end

function GetStartAction(User, ingredientsList, cauldron)

    local ingredient = ingredientsList[USER_POSITION_LIST[User.id]]
	local theString
	
	if type(ingredient) == "number" then
		if ingredient == 52 then
			theString = "water"
		elseif alchemy.base.alchemy.CheckIfGemDust(ingredient) then
		    theString = "gemPowder"
		elseif alchemy.base.alchemy.getPlantSubstance(ingredient) or ingredient == 157 then
			theString = "plant"
		end
	else
	    if string.find(ingredient,"bottle") then
			theString = "bottle"
		elseif string.find(ingredient,"stock") then
			theString = "stock"
		elseif string.find(ingredient,"essence") then
			theString = "essenceBrew"
		end
	end

	local duration,gfxId,gfxIntervall,sfxId,sfxIntervall = alchemy.base.alchemy.GetStartAction(User, theString, cauldron)
	return duration,gfxId,gfxIntervall,sfxId,sfxIntervall
end

function GetItem(User, ingredientsList)
    local deleteItem, deleteId, missingDe, missingEn
    if type(ingredientsList[USER_POSITION_LIST[User.id]])=="string" then 
	    if string.find(ingredientsList[USER_POSITION_LIST[User.id]],"bottle") then
		    local bottleList = User:getItemList(164) 
				local bottleList = User:getItemList(164) 
				if #bottleList > 0 then	
					for i=1,#bottleList do
						if not string.find(bottleList[i]:getData("descriptionEn"),"Bottle label:") then -- first check for bottles without a label
							deleteItem = bottleList[i]
							break
						end
					end
					if not deleteItem then -- we havent found a bottle without a label; now we check for one with label
						for i=1,#bottleList do
							if not string.find(bottleList[i]:getData("descriptionEn"),"Bottle label:") then -- first check for bottles without a label
								deleteItem = bottleList[i]
								break
							end
						end
					end	
				end	
			if not (deleteItem or deleteId) then
				missingDe = "Dir fehlt: leere Flasche"
				missingEn = "You don't have: empty bottle"
			end	
		else
            local liquid, neededList = alchemy.base.recipe_creation.StockEssenceList(ingredientsList[USER_POSITION_LIST[User.id]])
			if liquid == "stock" then
				local stockList = User:getItemList(164) 
				for i=1,#stockList do
					local currentList = alchemy.base.alchemy.SubstanceDatasToList(stockList[i])
					if neededList == currentList then
					    deleteItem = stockList[i]
						break
					end
				end
				if not (deleteItem) then
					missingDe = "Dir fehlt der entsprechende Sud."
					missingEn = "Your don't have the proper stock."
				end
			elseif liquid == "essence brew" then
			    local neededId = table.remove(neededList,1)
				local bottleList = User:getItemList(neededId)
				local currentList = {}
				for i=1,#bottleList do
				    currentList = {}
					if bottleList[i]:getData("filledWith")=="essenceBrew" then
						for j=1,8 do
							if bottleList[i]:getData("essenceHerb"..j) ~= "" then
								table.insert(currentList,bottleList[i]:getData("essenceHerb"..j))
							end
						end
				    end
				    if currentList == neededList then
						deleteItem = bottleList[i]
						break
					end
				end
				if not (deleteItem) then
					missingDe = "Dir fehlt das entsprechende Essenzgebräu."
					missingEn = "Your don't have the proper essence brew."
				end
			end
	    end		
	else
		local data = {}
		if (User:countItemAt("all",ingredientsList[USER_POSITION_LIST[User.id]],data) > 0) then
			deleteId = ingredientsList[USER_POSITION_LIST[User.id]]
		end
        if not deleteId then
			missingDe = "Dir fehlt: "..world:getItemName(ingredientsList[USER_POSITION_LIST[User.id]],Player.german)
			missingEn = "You don't have: "..world:getItemName(ingredientsList[USER_POSITION_LIST[User.id]],Player.german)
		end
	end
	
	return deleteItem, deleteId, missingDe, missingEn
end

function ViewRecipe(User, SourceItem)
    local ingredientsList = getIngredients(SourceItem)
	alchemy.base.recipe_creation.ShowRecipe(User, ingredientsList, true) 
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

function getText(User,deText,enText) 
    return base.common.base.common.GetNLS(User,deText,enText) 
end

---------------- ALCHEMY END ---------------------------
--------------------------------------------------------



function LookAtItem(User, Item)

	world:itemInform( User, Item, base.lookat.GenerateLookAt(User, Item, base.lookat.NONE) );

end
--[[
Illarion Server

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, either version 3 of the License, or (at your option) any
later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU Affero General Public License for more
details.

You should have received a copy of the GNU Affero General Public License along
with this program.  If not, see <http://www.gnu.org/licenses/>. 
]]
local common = require("base.common")
local alchemy = require("alchemy.base.alchemy")
local herbs = require("alchemy.base.herbs")
local id_52_filledbucket = require("item.id_52_filledbucket")
local id_331_green_bottle = require("alchemy.item.id_331_green_bottle")
local gemdust = require("alchemy.base.gemdust")
local id_164_emptybottle = require("item.id_164_emptybottle")
local potionToTeacher = require("triggerfield.potionToTeacher")
local recipe_creation = require("alchemy.base.recipe_creation")
local lookat = require("base.lookat")
local M = {}

-- important: do not remove the fourth parameter "checkVar".
-- it is important for alchemy
-- you can just ignore it
function M.UseItem(User, SourceItem,ltstate,checkVar)

    -- Check if it is an alchemy recipe.
    if SourceItem:getData("alchemyRecipe") == "true" then
	    AlchemyRecipe(User, SourceItem,ltstate,checkVar)
		return
	end

	if SourceItem:getData("TeachLenniersDream")=="true" then
		LearnLenniersDream(User)
	end

end


---------------- ALCHEMY -------------------------------
--------------------------------------------------------
function LearnLenniersDream(User)

	local anAlchemist = alchemy.CheckIfAlchemist(User)
	if not anAlchemist then
		User:inform("Ihr scheint nur seltsames Gekritzel zu stehen.","Only strange scribbling can be seen here.")
		return
	end

	local foundEffect, myEffect = User.effects:find(59);
	if foundEffect then
		local findsight, sightpotion = myEffect:findValue("sightpotion")
		if findsight then
			if sightpotion == User:getQuestProgress(860) then
				TeachLenniersDream(User)
				return
			end
		end
	end

    TaskToLearn(User)
end

function TeachLenniersDream(User)


	local callback = function(dialog)
		potionToTeacher.TellRecipe(User, 318)
	end

	local stockDe, stockEn = GenerateStockDescription(User)

	textDE = "Als du deinen Blick auf die wirren Zeilen richtest, beginnen sie sich zu ordnen. Das unleserliche Chaos weicht langsam einer Ordnung."
	textEN = "As you look at the confusing lines, they start to arrange themselves. The unreadable chaos is replaced by order."


	if User:getPlayerLanguage() == 0 then
	    dialog = MessageDialog("Was steht da wohl?", textDE, callback)
	else
      	dialog = MessageDialog("What could be written here?", textEN, callback)
	end
    User:requestMessageDialog(dialog)

end

function GenerateStockConcentration()

	local stockList = {1,1,1,1,1,1,1,1}
	local add = 43
	if Random.uniform(1,2)==1 then
		add = 21
	end

    while add > 0 do
	    local check = false
		while check == false do
			local rnd = Random.uniform(1,8)
			if stockList[rnd] < 9 then
				stockList[rnd] = stockList[rnd]+1
				add = add - 1
				check = true
			end
		end
	end
	return stockList
end

function GetStockFromQueststatus(User)

	if User:getQuestProgress(860) == 0 then
		local stockList
		stockList = GenerateStockConcentration()
		User:setQuestProgress(860,alchemy.DataListToNumber(stockList))
	end
	return alchemy.SplitData(User,User:getQuestProgress(860))
end

function GenerateStockDescription(User)

	local stockList = GetStockFromQueststatus(User)
	local de = ""
	local en = ""
	for i=1,#stockList do
		de = de .. alchemy.wirkung_de[stockList[i]] .. " "..alchemy.wirkstoff[i]
		en = en .. alchemy.wirkung_en[stockList[i]] .. " "..alchemy.wirkstoff[i]
		if i ~= 8 then
			de = de .. ", "
			en = en .. ", "
		end
	end
	return de, en
end

function TaskToLearn(User)

	local callback = function(dialog) end

	local stockDe, stockEn = GenerateStockDescription(User)

	textDE = "Die Zeilen auf dem Pergament sind verschwommen und scheinen sich ständig zu bewegen. Nur ein paar Zeilen, lassen sich lesen:\n\n\nNeugierig, was hier steht? Nun, dann flößt Euch das folgende Gebräu ein und ich verrate Euch das Geheimnis:\nEin Trank, der zum einen aus einem Essenzgebräu auf Rubinstaubbasis (essenzierte Kräuter: Wutbeere, Wutbeere, Regenkraut, Tagtraum, Fliegenpilz) besteht und zum anderen aus einem Sud mit folgenden Konzentrationen: " .. stockDe
	textEN = "The writing on this parchment is blurry and the lines seem to be constantly moving. Only the following lines can be read:\n\n\nAre you curious what might be written here? Well, swallow the following potion and I will tell you the secret:\nA potion made from an essence brew based on ruby powder (containing: anger berry, anger berry, rain weed, daydream, toadstool) and from a stock having the following concentrations: " .. stockEn


	if User:getPlayerLanguage() == 0 then
	    dialog = MessageDialog("Was steht da wohl?", textDE, callback)
	else
      	dialog = MessageDialog("What could be written here?", textEN, callback)
	end
    User:requestMessageDialog(dialog)

end

function AlchemyRecipe(User, SourceItem,ltstate,checkVar)


    if alchemy.GetCauldronInfront(User) then
	    -- The char wants to use the recipe infront of a cauldron.
		UseRecipe(User, SourceItem,ltstate,checkVar)
	else
        -- Not infront of a cauldron.
		ViewRecipe(User, SourceItem)
	end

end

function UseRecipe(User, SourceItem,ltstate,checkVar)


	-- is the char an alchemist?
	local anAlchemist = alchemy.CheckIfAlchemist(User)
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
	local cauldron = alchemy.GetCauldronInfront(User)

	if not cauldron then -- security check
		return
	end

	if base.licence.licence(User) then --checks if user is citizen or has a licence
		return -- avoids crafting if user is neither citizen nor has a licence
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
		local dialog = SelectionDialog(getText(User,"Rezept","Recipe"), getText(User,"Wähle die Zutat aus, ab welcher das Rezept abgearbeitet werden soll.","Select the ingredient which you want to start to brew from."), callback)
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
		User:inform("Du brichst deine Arbeit vor dem "..USER_POSITION_LIST[User.id]..". Arbeitsschritt ab. "..missingDe, "You abort your work before the "..USER_POSITION_LIST[User.id]..". work step. "..missingEn)
		return
	end

	if (ltstate == Action.none) then

		local duration,gfxId,gfxIntervall,sfxId,sfxIntervall = GetStartAction(User, ingredientsList, cauldron)
		User:startAction(duration,gfxId,gfxIntervall,sfxId,sfxIntervall);
		return

	end

	CallBrewFunctionAndDeleteItem(User,deleteItem, deleteId,cauldron)

	USER_POSITION_LIST[User.id] = USER_POSITION_LIST[User.id]+1

	if alchemy.CheckExplosionAndCleanList(User) then
	    if USER_POSITION_LIST[User.id] < #ingredientsList then
			User:inform("Du brichst deine Arbeit vor dem "..USER_POSITION_LIST[User.id]..". Arbeitsschritt ab.", "You abort your work before the "..USER_POSITION_LIST[User.id]..". work step.")
		end
		return
	end

	if USER_POSITION_LIST[User.id] > #ingredientsList then
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
			id_52_filledbucket.FillIn(User, buckets[1], cauldron, true)

		elseif alchemy.CheckIfGemDust(deleteId) then	--gemdust
			gemdust.BrewingGemDust(User,deleteId,cauldron)
			local data = {}
			User:eraseItem(deleteId,1,data)

		elseif alchemy.getPlantSubstance(deleteId) or deleteId == 157 then -- plant/rotten tree bark
            herbs.BeginnBrewing(User,deleteId,cauldron)
			local data = {}
			User:eraseItem(deleteId,1,data)
        end

	else
	    if deleteItem.id == 164 then -- empty bottle
		    id_164_emptybottle.FillIntoBottle(User, deleteItem, cauldron)

		elseif deleteItem.id == 331 then -- stock
			id_331_green_bottle.FillStockIn(User,deleteItem, cauldron)
			alchemy.EmptyBottle(User,deleteItem)

		elseif alchemy.CheckIfPotionBottle(deleteItem) then
		    alchemy.FillIntoCauldron(User,deleteItem,cauldron)
		end
	end

end

function GetStartAction(User, ingredientsList, cauldron)

    local ingredient = ingredientsList[USER_POSITION_LIST[User.id]]
	local theString

	if type(ingredient) == "number" then
		if ingredient == 52 then
			theString = "water"
		elseif alchemy.CheckIfGemDust(ingredient) then
		    theString = "gemPowder"
		elseif alchemy.getPlantSubstance(ingredient) or ingredient == 157 then
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

	local duration,gfxId,gfxIntervall,sfxId,sfxIntervall = alchemy.GetStartAction(User, theString, cauldron)
	return duration,gfxId,gfxIntervall,sfxId,sfxIntervall
end

function GetItem(User, ingredientsList)
    local deleteItem, deleteId, missingDe, missingEn
    if type(ingredientsList[USER_POSITION_LIST[User.id]])=="string" then
	    if string.find(ingredientsList[USER_POSITION_LIST[User.id]],"bottle") then
		    local bottleList = User:getItemList(164)
				local bottleList = User:getItemList(164)
				if #bottleList > 0 then
					deleteItem = bottleList[1] -- here, we take the first bottle we get
					for i=1,#bottleList do
						if not string.find(bottleList[i]:getData("descriptionEn"),"Bottle label:") then -- now, we check if there is an empty bottle; we prefer those
							deleteItem = bottleList[i] -- in case there is a empty, unlabeled bottle
							break
						end
					end
				end
			if not (deleteItem) then
				missingDe = "Dir fehlt: leere Flasche"
				missingEn = "You don't have: empty bottle"
			end
		else
            local liquid, neededList = alchemy.base.recipe_creation.StockEssenceList(ingredientsList[USER_POSITION_LIST[User.id]])
			if liquid == "stock" then
				local stockList = User:getItemList(331)
				for i=1,#stockList do
					local currentList = alchemy.SubstanceDatasToList(stockList[i])
					if alchemy.CheckListsIfEqual(neededList,currentList) then
					    deleteItem = stockList[i]
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
								table.insert(currentList,tonumber(bottleList[i]:getData("essenceHerb"..j)))
							end
						end
					end
					if alchemy.CheckListsIfEqual(neededList,currentList) then
					    deleteItem = bottleList[i]
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
			missingEn = "You don't have: "..world:getItemName(ingredientsList[USER_POSITION_LIST[User.id]],Player.english)
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
    return common.common.GetNLS(User,deText,enText)
end

---------------- ALCHEMY END ---------------------------
--------------------------------------------------------



function M.LookAtItem(User, Item)

	return lookat.GenerateLookAt(User, Item, lookat.NONE)

end

return M


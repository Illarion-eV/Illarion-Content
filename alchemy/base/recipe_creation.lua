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


module("alchemy.base.recipe_creation", package.seeall)

-- called by item.id_463_quill
function FirstMenu(User, ingredientsList)
    local getText = function(deText,enText) return common.common.GetNLS(User,deText,enText) end
    
	if ingredientsList == nil then
	    ingredientsList = {}
	end

    local callback = function(dialog) 
		local success = dialog:getSuccess() 
		if success then
			local selected = dialog:getSelectedIndex()+1
			if selected == 1 then
			    SelectPlantCategory(User, ingredientsList)
			elseif selected == 2 then
                SelectGemDust(User, ingredientsList)
      		elseif selected == 3 then
                SelectFillIntoCauldron(User, ingredientsList)
			elseif selected == 4 then
                BottleFromCauldron(User, ingredientsList)
			elseif selected == 5 then
			    RemoveLastIngredient(User, ingredientsList)
			elseif selected == 6 then
                ShowRecipe(User, ingredientsList) 
			elseif selected == 7 then
                FinishRecipe(User, ingredientsList)
			end	
		else
			local menuFunction = function(User, ingredientsList) 
			    FirstMenu(User,ingredientsList)
			end	
		    WantToAbort(User, menuFunction, {ingredientsList})
		end
	end

    local dialog = SelectionDialog(getText("Rezepterstellung","Recipe creation"), getText("Wähle eine Kategorie aus, aus der du dem Rezept etwas hinzutun willst.","Select a category from which you want to add something to the recipe."), callback)
	dialog:addOption(0, getText("Pflanzen","Plants"))
	dialog:addOption(0, getText("Edelsteinstaub", "Gem powder"))
	dialog:addOption(0, getText("Kessel befüllen","Fill into the cauldron"))
	dialog:addOption(0, getText("Kesslinhalt abfüllen","Bottle cauldron content"))
	dialog:addOption(0, getText("Letzte Zutat entfernen","Remove last ingredient"))
	dialog:addOption(0, getText("Rezept betrachten","Show recipe"))
	dialog:addOption(0, getText("Rezept fertigstellen","Finish recipe"))
    
	User:requestSelectionDialog(dialog)	

end

PLANT_CATS = {}
PLANT_CATS["DE"] = {"Waldpflanzen"  ,"Wiesenpflanzen","Gebirgspflanzen","Wüstenpflanzen","Sumpfpflanzen","Wasserpflanzen","Schneepflanze","Multiterraten","Pilze"    ,"Agrarprodukte"}
PLANT_CATS["EN"] = {"Forest plants" ,"Grass plants" ,"Mountain plants" ,"Desert plants" ,"Swamp plants" ,"Water plants"  ,"Snow plants"  ,"Multiterras"  ,"Mushrooms","Agricultural products"}

function SelectPlantCategory(User, ingredientsList, currentEssenceList)
    local getText = function(deText,enText) return common.common.GetNLS(User,deText,enText) end
	
	local callback = function(dialog) 
		success = dialog:getSuccess() 
		if success then
			selected = dialog:getSelectedIndex()+1
			if selected == 1 then
			    if currentEssenceList then
				    SelectEssenceBrewOption(User, ingredientsList, currentEssenceList)
				else
					FirstMenu(User, ingredientsList)
				end	
			else	
			    SelectPlant(User, ingredientsList, PLANT_CATS["EN"][selected-1], currentEssenceList)
			end	
		else
			local menuFunction = function(User, ingredientsList, currentEssenceList) 
			    SelectPlantCategory(User,ingredientsList, currentEssenceList)
			end	
		    WantToAbort(User, menuFunction, {ingredientsList, currentEssenceList})
		end
	end

	local dialog
	if currentEssenceList == nil then 
		dialog = SelectionDialog(getText("Rezepterstellung","Recipe creation"), getText("Wähle die Pflanzenkategorie aus, aus der du etwas zu dem Rezept hinzutun willst.","Select the plant category from which you want to add something to your recipe."), callback)
	else
	    dialog = SelectionDialog(getText("Rezepterstellung","Recipe creation"), getText("Wähle die Pflanzenkategorie aus, aus der du etwas zum Essenzgebräu hinzutun willst.","Select the plant category from which you want to add something to the essence brew."), callback)
	end	
	dialog:addOption(0, getText("Zurück","Back"))
	for i=1,#PLANT_CATS["DE"] do
		dialog:addOption(0, getText(PLANT_CATS["DE"][i],PLANT_CATS["EN"][i]))
	end	
	
	User:requestSelectionDialog(dialog)
end

PLANTS = {}
PLANTS["Forest plants"]         = {81 ,140,147,148,151,152,757,764,765,766,768}
PLANTS["Grass plants"]          = {134,135,143,145,153,388,754,756,761}
PLANTS["Mountain plants"]       = {141,144,752,755,758,762}
PLANTS["Desert plants"]         = {137,142,146,156,199,769}
PLANTS["Swamp plants"]          = {136,138,763}
PLANTS["Water plants"]          = {155,767}
PLANTS["Snow plants"]           = {760}
PLANTS["Multiterras"]           = {15 ,80 ,133,149,157,302,753,759,1207}
PLANTS["Mushrooms"]             = {158,159,160,161,162,163}
PLANTS["Agricultural products"] = {154,200,201,259,290,772,778,2493}

function SelectPlant(User, ingredientsList, category, currentEssenceList)
    local getText = function(deText,enText) return common.common.GetNLS(User,deText,enText) end
	
	local callback = function(dialog) 
		success = dialog:getSuccess() 
		if success then
			selected = dialog:getSelectedIndex()+1
			if selected == 1 then
			    SelectPlantCategory(User, ingredientsList,currentEssenceList)
			else
				if currentEssenceList == nil then
					if not CheckAmount(ingredientsList, User) then
						return
					end	
					AddToRecipe(ingredientsList,PLANTS[category][selected-1])
					User:inform("Wurde dem Rezept hinzugefügt: "..world:getItemName(PLANTS[category][selected-1],Player.german),"Added to the recipe: "..world:getItemName(PLANTS[category][selected-1],Player.english),Character.lowPriority)
					SelectPlant(User, ingredientsList, category)
				else
					if #currentEssenceList == 9 then
					    User:inform("Du kannst nicht mehr als acht Pflanzen einem Essengebräu hinzutun.","You cannot add more than eight plants to an essence brew.",Character.lowPriority)
						SelectEssenceBrewOption(User, ingredientsList, currentEssenceList)
					else
						table.insert(currentEssenceList,PLANTS[category][selected-1])
						User:inform("Wurde dem Essenzgebräu hinzugefügt: "..world:getItemName(PLANTS[category][selected-1],Player.german),"Has beend added to the essence brew: "..world:getItemName(PLANTS[category][selected-1],Player.english),Character.lowPriority)
						SelectPlant(User, ingredientsList, category, currentEssenceList)
					end
				end
			end 
		else
			local menuFunction = function(User, ingredientsList, category, currentEssenceList) 
			    SelectPlant(User,ingredientsList, category, currentEssenceList)
			end	
		    WantToAbort(User, menuFunction, {ingredientsList, category, currentEssenceList})
		end
	end

	local dialog 
	if currentEssenceList == nil then
		dialog = SelectionDialog(getText("Rezepterstellung","Recipe creation"), getText("Wähle die Pflanze aus, die du dem Rezept hinzufügen willst.","Select the plant you want to add to the recipe."), callback)
	else
		dialog = SelectionDialog(getText("Rezepterstellung","Recipe creation"), getText("Wähle die Pflanze aus, die du dem Essenzgebräu hinzufügen willst.","Select the plant you want to add to the essence brew."), callback)
	end
	dialog:addOption(0, getText("Zurück","Back"))
	for i=1,#PLANTS[category] do
		dialog:addOption(PLANTS[category][i],getText(world:getItemName(PLANTS[category][i],Player.german),world:getItemName(PLANTS[category][i],Player.english)))
	end	
	
	User:requestSelectionDialog(dialog)

end

GEMPOWDERS = {446,447,448,449,450,451,452}	
	
function SelectGemDust(User, ingredientsList)
    local getText = function(deText,enText) return common.common.GetNLS(User,deText,enText) end
	
	local callback = function(dialog) 
		success = dialog:getSuccess() 
		if success then
			selected = dialog:getSelectedIndex()+1
			if selected == 1 then
			    FirstMenu(User, ingredientsList)
			else
				if not CheckAmount(ingredientsList, User) then
				    return
				end	
				AddToRecipe(ingredientsList,GEMPOWDERS[selected-1])
				User:inform("Wurde dem Rezept hinzugefügt: "..world:getItemName(GEMPOWDERS[selected-1],Player.german),"Added to the recipe: "..world:getItemName(GEMPOWDERS[selected-1],Player.english),Character.lowPriority)
			    SelectGemDust(User, ingredientsList)
			end 
		else
			local menuFunction = function(User, ingredientsList) 
			    SelectGemDust(User,ingredientsList)
			end	
		    WantToAbort(User, menuFunction, {ingredientsList})
		end
	end

	local dialog = SelectionDialog(getText("Rezepterstellung","Recipe creation"), getText("Wähle den Edelsteinstaub aus, den du dem Rezept hinzufügen willst.","Select the gem powder you want to add to the recipe."), callback)
	dialog:addOption(0, getText("Zurück","Back"))
	for i=1,#GEMPOWDERS do
		dialog:addOption(GEMPOWDERS[i],getText(world:getItemName(GEMPOWDERS[i],Player.german),world:getItemName(GEMPOWDERS[i],Player.english)))
	end	
	
	User:requestSelectionDialog(dialog)
end

function BottleFromCauldron(User, ingredientsList)
	
	if not CheckAmount(ingredientsList) then
		return
	end	
	AddToRecipe(ingredientsList,"bottle")
	User:inform("Wurde dem Rezept hinzugefügt: Abfüllen","Added to the recipe: Bottling",Character.lowPriority)
	FirstMenu(User, ingredientsList)
end

ESSENCE_BREWS_IDS = {59,165,166,167,327,329,330}
ESSENCE_BREWS = {}
ESSENCE_BREWS[59] = {}
ESSENCE_BREWS[59]["de"] = "Essenzgebräu auf Rubinstaubbasis"
ESSENCE_BREWS[59]["en"] = "Essence brew based on ruby powder"

ESSENCE_BREWS[165] = {}
ESSENCE_BREWS[165]["de"] = "Essenzgebräu auf Smaragdstaubbasis"
ESSENCE_BREWS[165]["en"] = "Essence brew based on emerald powder"

ESSENCE_BREWS[166] = {}
ESSENCE_BREWS[166]["de"] = "Essenzgebräu auf Amethyststaubbasis"
ESSENCE_BREWS[166]["en"] = "Essence brew based on ameythst powder"

ESSENCE_BREWS[167] = {}
ESSENCE_BREWS[167]["de"] = "Essenzgebräu auf Topasstaubbasis"
ESSENCE_BREWS[167]["en"] = "Essence brew based on topaz powder"

ESSENCE_BREWS[327] = {}
ESSENCE_BREWS[327]["de"] = "Essenzgebräu auf Saphirstaubbasis"
ESSENCE_BREWS[327]["en"] = "Essence brew based on sapphire powder"

ESSENCE_BREWS[329] = {}
ESSENCE_BREWS[329]["de"] = "Essenzgebräu auf Obsidianstaubbasis"
ESSENCE_BREWS[329]["en"] = "Essence brew based on obsidian powder"

ESSENCE_BREWS[330] = {}
ESSENCE_BREWS[330]["de"] = "Essenzgebräu auf Diamantstaubbasis"
ESSENCE_BREWS[330]["en"] = "Essence brew based on diamond powder"


function SelectFillIntoCauldron(User, ingredientsList)
    local getText = function(deText,enText) return common.common.GetNLS(User,deText,enText) end
	
	local addList = {}
    local callback = function(dialog) 
		local success = dialog:getSuccess() 
		if success then
			selected = dialog:getSelectedIndex()+1
			if selected == 1 then
			    FirstMenu(User, ingredientsList)
			elseif selected == 2 then 
			    if not CheckAmount(ingredientsList, User) then
				    return
				end	
				AddToRecipe(ingredientsList,52)
				User:inform("Wurde dem Rezept hinzugefügt: "..world:getItemName(52,Player.german),"Added to the recipe: "..world:getItemName(52,Player.english),Character.lowPriority)
				SelectFillIntoCauldron(User, ingredientsList)
			elseif selected == 3 then
			    SelectActiveSubstance(User, ingredientsList, {5,5,5,5,5,5,5,5})
			else
     			if not CheckAmount(ingredientsList, User) then
				    return
				end
				SelectEssenceBrewOption(User, ingredientsList, {ESSENCE_BREWS_IDS[selected-3]})
		    end
		else
			local menuFunction = function(User, ingredientsList) 
			    SelectFillIntoCauldron(User,ingredientsList)
			end	
		    WantToAbort(User, menuFunction, {ingredientsList})
		end
	end
    
	local dialog = SelectionDialog(getText("Rezepterstellung","Recipe creation"), getText("Wähle aus, was du in den Kessel füllen willst.","Select what you want to fill into the cauldron."), callback)
	dialog:addOption(0, getText("Zurück","Back"))
	dialog:addOption(52, getText(world:getItemName(52,Player.german),world:getItemName(52,Player.english)))
	dialog:addOption(331, getText("Sud","Stock"))
	for i=1,#ESSENCE_BREWS_IDS do
		local id = ESSENCE_BREWS_IDS[i]
		dialog:addOption(id,getText(ESSENCE_BREWS[id]["de"],ESSENCE_BREWS[id]["en"]))
	end	
	
	User:requestSelectionDialog(dialog)
end

function SelectEssenceBrewOption(User, ingredientsList, currentEssenceList)
	local getText = function(deText,enText) return common.common.GetNLS(User,deText,enText) end
	
    local callback = function(dialog) 
		local success = dialog:getSuccess() 
		if success then
			local selected = dialog:getSelectedIndex() + 1
			if selected == 1 then
				SelectFillIntoCauldron(User, ingredientsList)
			elseif selected == 2 then
                SelectPlantCategory(User, ingredientsList, currentEssenceList)
            elseif selected == 3 then
				if #currentEssenceList < 2 then
				    User:inform("Es befinden sich keine Pflanzen zum Entfernen im Essenzgebräu.","There are no plants to be removed in the essence brew.")
				else
					local removed = table.remove(currentEssenceList)
					User:inform("Wurde vom Essenzgebräu entfernt: "..world:getItemName(removed,Player.german),"Has been remove from the essence brew: "..world:getItemName(removed,Player.english),Character.lowPriority) 
				end
				SelectEssenceBrewOption(User, ingredientsList, currentEssenceList)
			else
				AddToRecipe(ingredientsList,"essence "..table.concat(currentEssenceList,";"))
				User:inform("Wurde dem Rezept hinzugefügt: Essenzgebräu","Added to the recipe: Essence brew",Character.lowPriority)
				FirstMenu(User, ingredientsList)
			end	
		else
			local menuFunction = function(User, ingredientsList, currentEssenceList) 
			    SelectEssenceBrewOption(User, ingredientsList, currentEssenceList)
			end	
		    WantToAbort(User, menuFunction, {ingredientsList, currentEssenceList})
		end
	end
	
	local essenceStringDe = ESSENCE_BREWS[currentEssenceList[1]]["de"]..", beinhaltend:"
	local essenceStringEn = ESSENCE_BREWS[currentEssenceList[1]]["en"]..", containing:"
	if #currentEssenceList > 1 then
		for i=2,#currentEssenceList do
			if i ~= 2 then
				essenceStringDe = essenceStringDe..","
				essenceStringEn = essenceStringEn..","
			end
			essenceStringDe = essenceStringDe.." "..world:getItemName(currentEssenceList[i],Player.german)
			essenceStringEn = essenceStringEn.." "..world:getItemName(currentEssenceList[i],Player.english)
		end
    else
		essenceStringDe = essenceStringDe.." keine Pflanzen"
		essenceStringEn = essenceStringEn.." no plants"
	end
	
	local dialog = SelectionDialog(getText("Rezepterstellung","Recipe creation"), getText("Wähle aus, was du machen möchtest. Derzeitiges Essenzgebräu: "..essenceStringDe,"Select what you would like to do. Current essence brew: "..essenceStringEn), callback)
	
	dialog:addOption(0, getText("Zurück","Back"))
	dialog:addOption(0, getText("Pflanze hinzufügen","Add plant"))
	dialog:addOption(0, getText("Letzte Pflanze entfernen","Remove last plant"))
	dialog:addOption(0, getText("Essenzgebräu dem Rezept hinzufügen","Add essence brew to the recipe"))

	User:requestSelectionDialog(dialog)

end

function SelectActiveSubstance(User, ingredientsList, currentConcentrations)
	local getText = function(deText,enText) return common.common.GetNLS(User,deText,enText) end
	if currentConcentrations == nil then
	    currentConcentrations = {5,5,5,5,5,5,5,5}
	end	
	
	local callback = function(dialog) 
		local success = dialog:getSuccess() 
		if success then
			local selected = dialog:getSelectedIndex() + 1
			if selected == 1 then
				SelectFillIntoCauldron(User, ingredientsList)
			elseif selected >= 2 and selected <= 9 then
			    SelectConcentration(User,ingredientsList,currentConcentrations, selected-1)
			else
			    AddToRecipe(ingredientsList,"stock "..table.concat(currentConcentrations,";"))
				User:inform("Wurde dem Rezept hinzugefügt: Sud","Added to the recipe: Stock",Character.lowPriority)
				FirstMenu(User, ingredientsList)
			end
		else
			local menuFunction = function(User, ingredientsList, currentConcentrations) 
			    SelectActiveSubstance(User, ingredientsList, currentConcentrations)
			end	
		    WantToAbort(User, menuFunction, {ingredientsList, currentConcentrations})
		end
	end

	local dialog = SelectionDialog(getText("Rezepterstellung","Recipe creation"), getText("Wähle einen Wirkstoff aus, um dessen Konzentartion festzusetzen. Wähle 'Sud dem Rezept hinzufügen', wenn du damit fertig bist.","Select an active substance to determine its concentration. If you are done, choose 'Add stock to the recipe'"), callback)
	
	dialog:addOption(0, getText("Zurück","Back"))
    local activeSubstances = alchemy.base.alchemy.wirkstoff
	local concentrationsDe = alchemy.base.alchemy.wirkung_de
	local concentrationsEn = alchemy.base.alchemy.wirkung_en
	for i=1,#activeSubstances do 
	    dialog:addOption(0,getText(activeSubstances[i]..": "..concentrationsDe[currentConcentrations[i]],activeSubstances[i]..": "..concentrationsEn[currentConcentrations[i]]))
	end
	dialog:addOption(0,getText("Sud dem Rezept hinzufügen","Add stock to the recipe"))
	
	User:requestSelectionDialog(dialog)
	
end

function SelectConcentration(User,ingredientsList,currentConcentrations, activeSubstancePos)
    local getText = function(deText,enText) return common.common.GetNLS(User,deText,enText) end
	
	local activeSubstances = alchemy.base.alchemy.wirkstoff
	local concentrationsDe = alchemy.base.alchemy.wirkung_de
	local concentrationsEn = alchemy.base.alchemy.wirkung_en
	
	local callback = function(dialog) 
		local success = dialog:getSuccess() 
		if success then
			local selected = dialog:getSelectedIndex()+1
			if selected == 1 then
				SelectActiveSubstance(User, ingredientsList, currentConcentrations)
			else
				currentConcentrations[activeSubstancePos] = selected-1
				SelectActiveSubstance(User, ingredientsList, currentConcentrations)
			end	
		else
			local menuFunction = function(User, ingredientsList,currentConcentrations, activeSubstancePos) 
			    SelectConcentration(User,ingredientsList,currentConcentrations, activeSubstancePos)
			end	
		    WantToAbort(User, menuFunction, {ingredientsList,currentConcentrations, activeSubstancePos})
		end
	end

	local dialog = SelectionDialog(getText("Rezepterstellung","Recipe creation"), getText("Wähle eine Konzentration für "..activeSubstances[activeSubstancePos].." aus.","Select a concentration for "..activeSubstances[activeSubstancePos].."."), callback)
	
	dialog:addOption(0, getText("Zurück","Back"))
	for i=1,#concentrationsDe do
	    dialog:addOption(0,getText(""..concentrationsDe[i],""..concentrationsEn[i]))
	end	

	User:requestSelectionDialog(dialog)
end

function RemoveLastIngredient(User, ingredientsList)
    
	if #ingredientsList==0 then
	    User:inform("Das Rezept ist leer. Es kann nichts entfernt werden.","The recipe is empty. There is nothing to be removed.",Character.lowPriority)
	    FirstMenu(User, ingredientsList)
		return
	end	
    local removed = table.remove(ingredientsList)
	if type(removed)=="number" then
	    User:inform("Die letzte Zutat wurde vom Rezept entfernt: "..world:getItemName(removed,Player.german),"The last ingredient has been removed: "..world:getItemName(removed,Player.english),Character.lowPriority)
    elseif type(removed)=="string" then
	    local de, en
		if string.find(removed,"stock") then
		    de = "Sud"
			en = "Stock"
		elseif string.find(removed,"stock") then
            de = "Essenzgebräu"
			en = "Essence brew"
		else
			de = "Abfüllen"
			en = "Bottle"
		end	
		User:inform("Die letzte Zutat wurde vom Rezept entfernt: "..de,"The last ingredient has been removed: "..en,Character.lowPriority)
	end
	FirstMenu(User, ingredientsList)
end

function ShowRecipe(User, ingredientsList, notMenu) 
    local getText = function(deText,enText) return common.common.GetNLS(User,deText,enText) end
	
	local callback = function(dialog) 
		local success = dialog:getSuccess() 
		if success then
			local selected = dialog:getSelectedIndex() + 1
			local minus
			if notMenu then
			    minus = 0 
			else
			    minus = 1
			end	
			if selected == 1 and not notMenu then
			    FirstMenu(User, ingredientsList)
            elseif type(ingredientsList[selected-minus])=="string" and not string.find(ingredientsList[selected-minus],"bottle") then
				ShowStockEssence(User, ingredientsList[selected-minus], ingredientsList, notMenu)
			else
				ShowRecipe(User, ingredientsList, notMenu) 
			end	
		else
			if not notMenu then
				FirstMenu(User, ingredientsList)
			end	
		end
	end

	local dialog
	if not notMenu then
		dialog = SelectionDialog(getText("Rezeptvorschau","Recipe preview"), getText("Hier wird deine bisherige Auswahl angezeigt. Wähle ein Essenzgebräu oder einen Sud aus, um Nähres über dessen Inhalt zu erfahren.","Here are your current choices. Select an essence brew or stock to get to know more about its content."), callback)
	else
	    dialog = SelectionDialog(getText("Rezept","Recipe"),getText("Wähle ein Essenzgebräu oder Sud aus, um Nähres über dessen Inhalt zu erfahren. Wenn du aber vor einem Kessel stehst, wähle eine Zutat aus, von welcher du das Brauen beginnen willst.","Select an essence brew or a stock to get to learn more about its content. But if there is an cauldron infront of you, select the ingredient where you want to start to brew from."),callback)
	end
	
	if not notMenu then
		dialog:addOption(0, getText("Zurück","Back"))
	end	
	if #ingredientsList > 0 then
	    local counter = 0
		for i=1,#ingredientsList do
		    counter = counter + 1
			if type(ingredientsList[i])=="string" then 
				if string.find(ingredientsList[i],"bottle") then
					dialog:addOption(164, getText(counter..". Abfüllen",counter..". Bottling"))
				else	
				    local liquid, liquidList = StockEssenceList(ingredientsList[i])
					if liquid == "stock" then
					    dialog:addOption(331, getText(counter..". Sud",counter..". Stock"))
					elseif liquid == "essence brew" then
						dialog:addOption(liquidList[1], getText(counter..". Essenzgebräu",counter..". Essence brew"))
					end		
			    end
			else
				dialog:addOption(ingredientsList[i], getText(counter..". "..world:getItemName(ingredientsList[i],Player.german),counter..". "..world:getItemName(ingredientsList[i],Player.english)))
			end
		end
	end
	User:requestSelectionDialog(dialog)
end

function ShowStockEssence(User, theLiquid, ingredientsList, notMenu)
	local getText = function(deText,enText) return common.common.GetNLS(User,deText,enText) end
	
	local liquid, liquidList = StockEssenceList(theLiquid)
	local de, en, titleDe, titleEn
	if liquid == "essence brew" then
		titelDe = "Essenzgebräu"
		titleEn = "Essece brew"
		de = ESSENCE_BREWS[liquidList[1]]["de"]..":"
		en = ESSENCE_BREWS[liquidList[1]]["en"]..":"
	    if not (#liquidList > 1) then
		    de = de.."\nKeine Pflanzen essenziert"
			en = en.."\nNo essenced herbs"
		else
			for i=2,#liquidList do
			    de = de.."\n"..world:getItemName(liquidList[i],Player.german)
				en = en.."\n"..world:getItemName(liquidList[i],Player.english)
			end
		end
	elseif liquid == "stock" then
	    titelDe = "Sud"
		titleEn = "Essence brew"
		de = "Sud:"
		en = "Stock:"
		local activeSubstances = alchemy.base.alchemy.wirkstoff
		local concentrationsDe = alchemy.base.alchemy.wirkung_de
		local concentrationsEn = alchemy.base.alchemy.wirkung_en
		for i=1,#liquidList do
		    de = de.."\n"..concentrationsDe[liquidList[i]].." "..alchemy.base.alchemy.wirkstoff[i]
			en = en.."\n"..concentrationsEn[liquidList[i]].." "..alchemy.base.alchemy.wirkstoff[i]
		end
	end

	local callback = function(dialog)
        ShowRecipe(User, ingredientsList, notMenu) 
    end

	local dialog = MessageDialog(getText(titleDe,titleEn), getText(de,en), callback)
    User:requestMessageDialog(dialog)
end

function StockEssenceList(theString)

	local liquid
    if string.find(theString,"stock ") then
	    liquid = "stock"
	elseif 	string.find(theString,"essence ") then
	    liquid = "essence brew"
	end
	local fromHere = string.find(theString,"(%d+)")
	local theList = common.split(string.sub(theString,fromHere), ";")
	local returnList = {}
	for i=1,#theList do
		if tonumber(theList[i]) ~= nil then
			table.insert(returnList,tonumber(theList[i]))
		end
	end
	return liquid, returnList
end

function FinishRecipe(User, ingredientsList)
    local getText = function(deText,enText) return common.common.GetNLS(User,deText,enText) end
	
	local parchment = GetParchmentQuill(User)
	parchment = IsParchmentOK(User,parchment,ingredientsList)
	if not parchment then
		FirstMenu(User, ingredientsList)
		return
	end
	
	if #ingredientsList == 0 then
	    User:inform("Es wurde noch nichts zum Notieren ausgewählt.","Nothing has been selected to be written down so far.", Character.highPriority)
		FirstMenu(User, ingredientsList)
		return
    end
	
	local callback = function(dialog)
		if dialog:getSuccess() then
			local parchment = GetParchmentQuill(User)
			parchment = IsParchmentOK(User,parchment,ingredientsList)
			if not parchment then
				FirstMenu(User, ingredientsList)
				return
			end
			if parchment.number > 1 then
				local data = {}
				data["descriptionDe"] = "Alchemistisches Rezept: "..dialog:getInput()
				data["descriptionEn"] = "Alchemical recipe: "..dialog:getInput()
				data["alchemyRecipe"] = "true"
				for i=1,#ingredientsList do
					data["ingredient"..i] = ingredientsList[i]
				end
				world:erase(parchment,1)
				local notCreated = User:createItem(2745,1,333,data)
				if notCreated > 0 then
					world:createItemFromId(2745,notCreated,User.pos,true,333,data)
				end
			else
			    parchment:setData("descriptionDe","Alchemistisches Rezept: "..dialog:getInput())
				parchment:setData("descriptionEn","Alchemical recipe: "..dialog:getInput())
				parchment:setData("alchemyRecipe","true")
				for i=1,#ingredientsList do
					parchment:setData("ingredient"..i,ingredientsList[i])
				end
				world:changeItem(parchment)
			end	
		else
			User:inform("Du hast die Rezeptbenennung abgebrochen.","You abroted the naming of the recipe.",Character.lowPriority)
			FirstMenu(User, ingredientsList)
		end
	end
	local dialog = InputDialog(getText("Rezeptbenennung","Recipe naming"), getText("Gebe einen Namen für das Rezept ein.","Enter a name for the recipe."), false, 100, callback)
	User:requestInputDialog(dialog)
	return
end

function IsParchmentOK(User,parchment,ingredientsList)
    if not parchment then
		User:inform("Du musst eine Feder und ein leeres Pergament in den Händen halten, um das Rezept zu notieren.", "You have to hold a quill and a parchment in your hands to write the recipe.") 
		return nil
	end

	if parchment:getData("descriptionDe") ~= "" and parchment:getData("descriptionEn") ~= "" then
	    User:inform("Du braucht ein leeres Pergament.","You need an empty parchment.")
		return nil
	end
	return parchment
end

function GetParchmentQuill(User)
    local itemA = User:getItemAt(5)
	local itemB = User:getItemAt(6)
	
	local theItem
	if itemA.id == 2745 and itemB.id == 463 then
	    theItem = itemA
	elseif itemA.id == 463 and itemB.id == 2745 then
	    theItem = itemB
	end
	if theItem then
	    local data = {}
		if User:countItemAt("body",2745,{}) > 0 then
		    return theItem
		end
	end
	return nil
end

function CheckAmount(ingredientsList, User)

	if #ingredientsList > 59 then
		User:inform("Das Pergament ist voll. Du kannst dies nicht mehr dem Rezept hinzufügen.","The parchment is full. You cannot add to the recipe anymore.",Character.highPriority)
        return false
	end
    return true	
end

function AddToRecipe(ingredientsList,addThis)
    
	table.insert(ingredientsList,addThis)
	
end

function WantToAbort(User, menuFunction, parameterList)
    local getText = function(deText,enText) return common.common.GetNLS(User,deText,enText) end
	
    local callback = function(dialog)
	    local success = dialog:getSuccess() 
		if success then 
		    local selected = dialog:getSelectedIndex()+1
			if selected == 1 then 
				menuFunction(User,parameterList[1],parameterList[2],parameterList[3],parameterList[4])
			else
			    User:inform("Du hast die Rezeptherstellung abgebrochen.","You aborted the recipe creation.",Character.lowPriority)
			end	
		else
			menuFunction(User,parameterList[1],parameterList[2],parameterList[3],parameterList[4])
		end
    end	
    local dialog = SelectionDialog(getText("Rezepterstellung","Recipe creation"), getText("Willst du die Rezepterstellung wirklich abbrechen?","Do you really want to abort the recipe creation?"), callback)
	dialog:addOption(0, getText("Nein","No"))
	dialog:addOption(0, getText("Ja", "Yes"))
	
	User:requestSelectionDialog(dialog)	
	
end

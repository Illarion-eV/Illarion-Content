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


local M = {}

local SelectPlantCategory
local SelectPlant
local SelectGemDust
local BottleFromCauldron
local jarCauldronContent
local SelectFillIntoCauldron
local SelectEssenceBrewOption
local SelectActiveSubstance
local SelectConcentration
local RemoveLastIngredient
local ShowStockEssence
local FinishRecipe
local CheckAmount
local AddToRecipe
local WantToAbort

-- called by item.id_463_quill
function M.FirstMenu(User, ListOfIngredients)
    local getText = function(deText,enText) return common.GetNLS(User,deText,enText) end

    if ListOfIngredients == nil then
        ListOfIngredients = {}
    end

    local callback = function(dialog)
        local success = dialog:getSuccess()
        if success then
            local selected = dialog:getSelectedIndex()+1
            if selected == 1 then
                SelectPlantCategory(User, ListOfIngredients)
            elseif selected == 2 then
                SelectGemDust(User, ListOfIngredients)
            elseif selected == 3 then
                SelectFillIntoCauldron(User, ListOfIngredients)
            elseif selected == 4 then
                BottleFromCauldron(User, ListOfIngredients)
            elseif selected == 5 then
                jarCauldronContent(User, ListOfIngredients)
            elseif selected == 6 then
                RemoveLastIngredient(User, ListOfIngredients)
            elseif selected == 7 then
                M.ShowRecipe(User, ListOfIngredients)
            elseif selected == 8 then
                FinishRecipe(User, ListOfIngredients)
            end
        else
            local menuFunction = function(user, listOfIngredients)
                M.FirstMenu(user, listOfIngredients)
            end
            WantToAbort(User, menuFunction, {ListOfIngredients})
        end
    end

    local dialog = SelectionDialog(getText("Rezepterstellung","Recipe creation"), getText("W�hle eine Kategorie aus, aus der du dem Rezept etwas hinzutun willst.","Select a category from which you want to add something to the recipe."), callback)
    dialog:addOption(0, getText("Pflanzen","Plants"))
    dialog:addOption(0, getText("Edelsteinstaub", "Gem powder"))
    dialog:addOption(0, getText("Kessel bef�llen","Fill into the cauldron"))
    dialog:addOption(0, getText("Kesselinhalt abf�llen","Bottle cauldron content"))
    dialog:addOption(0, getText("In eine Dose f�llen","Fill into a jar"))
    dialog:addOption(0, getText("Letzte Zutat entfernen","Remove last ingredient"))
    dialog:addOption(0, getText("Rezept betrachten","Show recipe"))
    dialog:addOption(0, getText("Rezept fertigstellen","Finish recipe"))

    User:requestSelectionDialog(dialog)

end

local PLANT_CATS = {}
PLANT_CATS["DE"] = {"Waldpflanzen"  ,"Wiesenpflanzen","Gebirgspflanzen","W�stenpflanzen","Sumpfpflanzen","Wasserpflanzen","Schneepflanze","Multiterraten","Pilze"    ,"Agrarprodukte"}
PLANT_CATS["EN"] = {"Forest plants" ,"Grass plants" ,"Mountain plants" ,"Desert plants" ,"Swamp plants" ,"Water plants"  ,"Snow plants"  ,"Multiterras"  ,"Mushrooms","Agricultural products"}

function SelectPlantCategory(User, ListOfIngredients, currentEssenceList)
    local getText = function(deText,enText) return common.GetNLS(User,deText,enText) end

    local callback = function(dialog)
        local success = dialog:getSuccess()
        if success then
            local selected = dialog:getSelectedIndex()+1
            if selected == 1 then
                if currentEssenceList then
                    SelectEssenceBrewOption(User, ListOfIngredients, currentEssenceList)
                else
                    M.FirstMenu(User, ListOfIngredients)
                end
            else
                SelectPlant(User, ListOfIngredients, PLANT_CATS["EN"][selected-1], currentEssenceList)
            end
        else
            local menuFunction = function(user, listOfIngredients, essenceList)
                SelectPlantCategory(user, listOfIngredients, essenceList)
            end
            WantToAbort(User, menuFunction, {ListOfIngredients, currentEssenceList})
        end
    end

    local dialog
    if currentEssenceList == nil then
        dialog = SelectionDialog(getText("Rezepterstellung","Recipe creation"), getText("W�hle die Pflanzenkategorie aus, aus der du etwas zu dem Rezept hinzutun willst.","Select the plant category from which you want to add something to your recipe."), callback)
    else
        dialog = SelectionDialog(getText("Rezepterstellung","Recipe creation"), getText("W�hle die Pflanzenkategorie aus, aus der du etwas zum Essenzgebr�u hinzutun willst.","Select the plant category from which you want to add something to the essence brew."), callback)
    end
    dialog:addOption(0, getText("Zur�ck","Back"))
    for i=1,#PLANT_CATS["DE"] do
        dialog:addOption(0, getText(PLANT_CATS["DE"][i],PLANT_CATS["EN"][i]))
    end

    User:requestSelectionDialog(dialog)
end

local PLANTS = {}
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

function SelectPlant(User, ListOfIngredients, category, currentEssenceList)
    local getText = function(deText,enText) return common.GetNLS(User,deText,enText) end

    local callback = function(dialog)
        local success = dialog:getSuccess()
        if success then
            local selected = dialog:getSelectedIndex()+1
            if selected == 1 then
                SelectPlantCategory(User, ListOfIngredients,currentEssenceList)
            else
                if currentEssenceList == nil then
                    if not CheckAmount(ListOfIngredients, User) then
                        return
                    end
                    AddToRecipe(ListOfIngredients,PLANTS[category][selected-1])
                    User:inform("Wurde dem Rezept hinzugef�gt: "..world:getItemName(PLANTS[category][selected-1],Player.german),"Added to the recipe: "..world:getItemName(PLANTS[category][selected-1],Player.english),Character.lowPriority)
                    SelectPlant(User, ListOfIngredients, category)
                else
                    if #currentEssenceList == 9 then
                        User:inform("Du kannst nicht mehr als acht Pflanzen zu einem Essengebr�u hinzutun.","You cannot add more than eight plants to an essence brew.",Character.lowPriority)
                        SelectEssenceBrewOption(User, ListOfIngredients, currentEssenceList)
                    else
                        table.insert(currentEssenceList,PLANTS[category][selected-1])
                        User:inform("Wurde dem Essenzgebr�u hinzugef�gt: "..world:getItemName(PLANTS[category][selected-1],Player.german),"Has been added to the essence brew: "..world:getItemName(PLANTS[category][selected-1],Player.english),Character.lowPriority)
                        SelectPlant(User, ListOfIngredients, category, currentEssenceList)
                    end
                end
            end
        else
            local menuFunction = function(user, listOfIngredients, someCategory, essenceList)
                SelectPlant(user, listOfIngredients, someCategory, essenceList)
            end
            WantToAbort(User, menuFunction, {ListOfIngredients, category, currentEssenceList})
        end
    end

    local dialog
    if currentEssenceList == nil then
        dialog = SelectionDialog(getText("Rezepterstellung","Recipe creation"), getText("W�hle die Pflanze aus, die du dem Rezept hinzuf�gen willst.","Select the plant you want to add to the recipe."), callback)
    else
        dialog = SelectionDialog(getText("Rezepterstellung","Recipe creation"), getText("W�hle die Pflanze aus, die du dem Essenzgebr�u hinzuf�gen willst.","Select the plant you want to add to the essence brew."), callback)
    end
    dialog:addOption(0, getText("Zur�ck","Back"))
    for i=1,#PLANTS[category] do
        dialog:addOption(PLANTS[category][i],getText(world:getItemName(PLANTS[category][i],Player.german),world:getItemName(PLANTS[category][i],Player.english)))
    end

    User:requestSelectionDialog(dialog)

end

local GEMPOWDERS = {446,447,448,449,450,451,452}

function SelectGemDust(User, ListOfIngredients)
    local getText = function(deText,enText) return common.GetNLS(User,deText,enText) end

    local callback = function(dialog)
        local success = dialog:getSuccess()
        if success then
            local selected = dialog:getSelectedIndex()+1
            if selected == 1 then
                M.FirstMenu(User, ListOfIngredients)
            else
                if not CheckAmount(ListOfIngredients, User) then
                    return
                end
                AddToRecipe(ListOfIngredients,GEMPOWDERS[selected-1])
                User:inform("Wurde dem Rezept hinzugef�gt: "..world:getItemName(GEMPOWDERS[selected-1],Player.german),"Added to the recipe: "..world:getItemName(GEMPOWDERS[selected-1],Player.english),Character.lowPriority)
                SelectGemDust(User, ListOfIngredients)
            end
        else
            local menuFunction = function(user, listOfIngredients)
                SelectGemDust(user, listOfIngredients)
            end
            WantToAbort(User, menuFunction, {ListOfIngredients})
        end
    end

    local dialog = SelectionDialog(getText("Rezepterstellung","Recipe creation"), getText("W�hle den Edelsteinstaub aus, den du dem Rezept hinzuf�gen willst.","Select the gem powder you want to add to the recipe."), callback)
    dialog:addOption(0, getText("Zur�ck","Back"))
    for i=1,#GEMPOWDERS do
        dialog:addOption(GEMPOWDERS[i],getText(world:getItemName(GEMPOWDERS[i],Player.german),world:getItemName(GEMPOWDERS[i],Player.english)))
    end

    User:requestSelectionDialog(dialog)
end

function BottleFromCauldron(User, ListOfIngredients)

    if not CheckAmount(ListOfIngredients) then
        return
    end
    AddToRecipe(ListOfIngredients,"bottle")
    User:inform("Wurde dem Rezept hinzugef�gt: Abf�llen","Added to the recipe: Bottling",Character.lowPriority)
    M.FirstMenu(User, ListOfIngredients)
end

function jarCauldronContent(user, ingredients)

    if not CheckAmount(ingredients) then
        return
    end
    AddToRecipe(ingredients, "jar")
    user:inform("Wurde dem Rezept hinzugef�gt: In eine Dose f�llen", "Added to the recipe: Fill into jar",Character.lowPriority)
    M.FirstMenu(user, ingredients)
end

local ESSENCE_BREWS_IDS = {59,165,166,167,327,329,330}
local ESSENCE_BREWS = {}
ESSENCE_BREWS[59] = {}
ESSENCE_BREWS[59]["de"] = "Essenzgebr�u auf Rubinstaubbasis"
ESSENCE_BREWS[59]["en"] = "Essence brew based on ruby powder"

ESSENCE_BREWS[165] = {}
ESSENCE_BREWS[165]["de"] = "Essenzgebr�u auf Smaragdstaubbasis"
ESSENCE_BREWS[165]["en"] = "Essence brew based on emerald powder"

ESSENCE_BREWS[166] = {}
ESSENCE_BREWS[166]["de"] = "Essenzgebr�u auf Amethyststaubbasis"
ESSENCE_BREWS[166]["en"] = "Essence brew based on ameythst powder"

ESSENCE_BREWS[167] = {}
ESSENCE_BREWS[167]["de"] = "Essenzgebr�u auf Topasstaubbasis"
ESSENCE_BREWS[167]["en"] = "Essence brew based on topaz powder"

ESSENCE_BREWS[327] = {}
ESSENCE_BREWS[327]["de"] = "Essenzgebr�u auf Saphirstaubbasis"
ESSENCE_BREWS[327]["en"] = "Essence brew based on sapphire powder"

ESSENCE_BREWS[329] = {}
ESSENCE_BREWS[329]["de"] = "Essenzgebr�u auf Obsidianstaubbasis"
ESSENCE_BREWS[329]["en"] = "Essence brew based on obsidian powder"

ESSENCE_BREWS[330] = {}
ESSENCE_BREWS[330]["de"] = "Essenzgebr�u auf Diamantstaubbasis"
ESSENCE_BREWS[330]["en"] = "Essence brew based on diamond powder"


function SelectFillIntoCauldron(User, ListOfIngredients)
    local getText = function(deText,enText) return common.GetNLS(User,deText,enText) end

    local callback = function(dialog)
        local success = dialog:getSuccess()
        if success then
            local selected = dialog:getSelectedIndex()+1
            if selected == 1 then
                M.FirstMenu(User, ListOfIngredients)
            elseif selected == 2 then
                if not CheckAmount(ListOfIngredients, User) then
                    return
                end
                AddToRecipe(ListOfIngredients,52)
                User:inform("Wurde dem Rezept hinzugef�gt: "..world:getItemName(52,Player.german),"Added to the recipe: "..world:getItemName(52,Player.english),Character.lowPriority)
                SelectFillIntoCauldron(User, ListOfIngredients)
            elseif selected == 3 then
                SelectActiveSubstance(User, ListOfIngredients, {5,5,5,5,5,5,5,5})
            else
                if not CheckAmount(ListOfIngredients, User) then
                    return
                end
                SelectEssenceBrewOption(User, ListOfIngredients, {ESSENCE_BREWS_IDS[selected-3]})
            end
        else
            local menuFunction = function(user, listOfIngredients)
                SelectFillIntoCauldron(user, listOfIngredients)
            end
            WantToAbort(User, menuFunction, {ListOfIngredients})
        end
    end

    local dialog = SelectionDialog(getText("Rezepterstellung","Recipe creation"), getText("W�hle aus, was du in den Kessel f�llen willst.","Select what you want to fill into the cauldron."), callback)
    dialog:addOption(0, getText("Zur�ck","Back"))
    dialog:addOption(52, getText(world:getItemName(52,Player.german),world:getItemName(52,Player.english)))
    dialog:addOption(331, getText("Sud","Stock"))
    for i=1,#ESSENCE_BREWS_IDS do
        local id = ESSENCE_BREWS_IDS[i]
        dialog:addOption(id,getText(ESSENCE_BREWS[id]["de"],ESSENCE_BREWS[id]["en"]))
    end

    User:requestSelectionDialog(dialog)
end

function SelectEssenceBrewOption(User, ListOfIngredients, currentEssenceList)
    local getText = function(deText,enText) return common.GetNLS(User,deText,enText) end

    local callback = function(dialog)
        local success = dialog:getSuccess()
        if success then
            local selected = dialog:getSelectedIndex() + 1
            if selected == 1 then
                SelectFillIntoCauldron(User, ListOfIngredients)
            elseif selected == 2 then
                SelectPlantCategory(User, ListOfIngredients, currentEssenceList)
            elseif selected == 3 then
                if #currentEssenceList < 2 then
                    User:inform("Es befinden sich keine Pflanzen zum Entfernen im Essenzgebr�u.","There are no plants to be removed in the essence brew.")
                else
                    local removed = table.remove(currentEssenceList)
                    User:inform("Wurde vom Essenzgebr�u entfernt: "..world:getItemName(removed,Player.german),"Has been removed from the essence brew: "..world:getItemName(removed,Player.english),Character.lowPriority)
                end
                SelectEssenceBrewOption(User, ListOfIngredients, currentEssenceList)
            else
                AddToRecipe(ListOfIngredients,"essence "..table.concat(currentEssenceList,";"))
                User:inform("Wurde dem Rezept hinzugef�gt: Essenzgebr�u","Added to the recipe: Essence brew",Character.lowPriority)
                M.FirstMenu(User, ListOfIngredients)
            end
        else
            local menuFunction = function(user, listOfIngredients, essenceList)
                SelectEssenceBrewOption(user, listOfIngredients, essenceList)
            end
            WantToAbort(User, menuFunction, {ListOfIngredients, currentEssenceList})
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

    local dialog = SelectionDialog(getText("Rezepterstellung","Recipe creation"), getText("W�hle aus, was du machen m�chtest. Derzeitiges Essenzgebr�u: "..essenceStringDe,"Select what you would like to do. Current essence brew: "..essenceStringEn), callback)

    dialog:addOption(0, getText("Zur�ck","Back"))
    dialog:addOption(0, getText("Pflanze hinzuf�gen","Add plant"))
    dialog:addOption(0, getText("Letzte Pflanze entfernen","Remove last plant"))
    dialog:addOption(0, getText("Essenzgebr�u dem Rezept hinzuf�gen","Add essence brew to the recipe"))

    User:requestSelectionDialog(dialog)

end

function SelectActiveSubstance(User, ListOfIngredients, currentConcentrations)
    local getText = function(deText,enText) return common.GetNLS(User,deText,enText) end
    if currentConcentrations == nil then
        currentConcentrations = {5,5,5,5,5,5,5,5}
    end

    local callback = function(dialog)
        local success = dialog:getSuccess()
        if success then
            local selected = dialog:getSelectedIndex() + 1
            if selected == 1 then
                SelectFillIntoCauldron(User, ListOfIngredients)
            elseif selected >= 2 and selected <= 9 then
                SelectConcentration(User,ListOfIngredients,currentConcentrations, selected-1)
            else
                AddToRecipe(ListOfIngredients,"stock "..table.concat(currentConcentrations,";"))
                User:inform("Wurde dem Rezept hinzugef�gt: Sud","Added to the recipe: Stock",Character.lowPriority)
                M.FirstMenu(User, ListOfIngredients)
            end
        else
            local menuFunction = function(user, listOfIngredients, concentrations)
                SelectActiveSubstance(user, listOfIngredients, concentrations)
            end
            WantToAbort(User, menuFunction, {ListOfIngredients, currentConcentrations})
        end
    end

    local dialog = SelectionDialog(getText("Rezepterstellung","Recipe creation"), getText("W�hle einen Wirkstoff aus, um dessen Konzentration festzusetzen. W�hle 'Sud dem Rezept hinzuf�gen', wenn du damit fertig bist.","Select an active substance to determine its concentration. If you are done, choose 'Add stock to the recipe'"), callback)

    dialog:addOption(0, getText("Zur�ck","Back"))
    local activeSubstances = alchemy.wirkstoff
    local concentrationsDe = alchemy.wirkung_de
    local concentrationsEn = alchemy.wirkung_en
    for i=1,#activeSubstances do
        dialog:addOption(0,getText(activeSubstances[i]..": "..concentrationsDe[currentConcentrations[i]],activeSubstances[i]..": "..concentrationsEn[currentConcentrations[i]]))
    end
    dialog:addOption(0,getText("Sud dem Rezept hinzuf�gen","Add stock to the recipe"))

    User:requestSelectionDialog(dialog)

end

function SelectConcentration(User,ListOfIngredients,currentConcentrations, activeSubstancePos)
    local getText = function(deText,enText) return common.GetNLS(User,deText,enText) end

    local activeSubstances = alchemy.wirkstoff
    local concentrationsDe = alchemy.wirkung_de
    local concentrationsEn = alchemy.wirkung_en

    local callback = function(dialog)
        local success = dialog:getSuccess()
        if success then
            local selected = dialog:getSelectedIndex()+1
            if selected == 1 then
                SelectActiveSubstance(User, ListOfIngredients, currentConcentrations)
            else
                currentConcentrations[activeSubstancePos] = selected-1
                SelectActiveSubstance(User, ListOfIngredients, currentConcentrations)
            end
        else
            local menuFunction = function(user, listOfIngredients, concentrations, substancePos)
                SelectConcentration(user, listOfIngredients, concentrations, substancePos)
            end
            WantToAbort(User, menuFunction, {ListOfIngredients,currentConcentrations, activeSubstancePos})
        end
    end

    local dialog = SelectionDialog(getText("Rezepterstellung","Recipe creation"), getText("W�hle eine Konzentration f�r "..activeSubstances[activeSubstancePos].." aus.","Select a concentration for "..activeSubstances[activeSubstancePos].."."), callback)

    dialog:addOption(0, getText("Zur�ck","Back"))
    for i=1,#concentrationsDe do
        dialog:addOption(0,getText(""..concentrationsDe[i],""..concentrationsEn[i]))
    end

    User:requestSelectionDialog(dialog)
end

function RemoveLastIngredient(User, ListOfIngredients)

    if #ListOfIngredients==0 then
        User:inform("Das Rezept ist leer. Es kann nichts entfernt werden.","The recipe is empty. There is nothing to be removed.",Character.lowPriority)
        M.FirstMenu(User, ListOfIngredients)
        return
    end
    local removed = table.remove(ListOfIngredients)
    if type(removed)=="number" then
        User:inform("Die letzte Zutat wurde vom Rezept entfernt: "..world:getItemName(removed,Player.german),"The last ingredient has been removed: "..world:getItemName(removed,Player.english),Character.lowPriority)
    elseif type(removed)=="string" then
        local de, en
        if string.find(removed,"stock") then
            de = "Sud"
            en = "Stock"
        elseif string.find(removed,"stock") then
            de = "Essenzgebr�u"
            en = "Essence brew"
        else
            de = "Abf�llen"
            en = "Bottle"
        end
        User:inform("Die letzte Zutat wurde vom Rezept entfernt: "..de,"The last ingredient has been removed: "..en,Character.lowPriority)
    end
    M.FirstMenu(User, ListOfIngredients)
end

function M.ShowRecipe(User, ListOfIngredients, notMenu)
    local getText = function(deText,enText) return common.GetNLS(User,deText,enText) end

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
                M.FirstMenu(User, ListOfIngredients)
            elseif type(ListOfIngredients[selected-minus])=="string" and not string.find(ListOfIngredients[selected-minus],"bottle") and not string.find(ListOfIngredients[selected-minus],"jar") then
                ShowStockEssence(User, ListOfIngredients[selected-minus], ListOfIngredients, notMenu)
            else
                M.ShowRecipe(User, ListOfIngredients, notMenu)
            end
        else
            if not notMenu then
                M.FirstMenu(User, ListOfIngredients)
            end
        end
    end

    local dialog
    if not notMenu then
        dialog = SelectionDialog(getText("Rezeptvorschau","Recipe preview"), getText("Hier wird deine bisherige Auswahl angezeigt. W�hle ein Essenzgebr�u oder einen Sud aus, um N�hres �ber dessen Inhalt zu erfahren.","Here are your current choices. Select an essence brew or stock to get to know more about its content."), callback)
    else
        dialog = SelectionDialog(getText("Rezept","Recipe"),getText("W�hle ein Essenzgebr�u oder Sud aus, um N�hres �ber dessen Inhalt zu erfahren. Wenn du aber vor einem Kessel stehst, w�hle eine Zutat aus, von welcher du das Brauen beginnen willst.","Select an essence brew or a stock to get to learn more about its content. But if there is an cauldron infront of you, select the ingredient where you want to start to brew from."),callback)
    end

    if not notMenu then
        dialog:addOption(0, getText("Zur�ck","Back"))
    end
    if #ListOfIngredients > 0 then
        local counter = 0
        for i=1,#ListOfIngredients do
            counter = counter + 1
            if type(ListOfIngredients[i])=="string" then
                if string.find(ListOfIngredients[i],"bottle") then
                    dialog:addOption(164, getText(counter..". Abf�llen",counter..". Bottling"))
                elseif string.find(ListOfIngredients[i], "jar") then
                    dialog:addOption(3643, getText(counter..". In eine Dose f�llen",counter..". Fill into jar"))
                else
                    local liquid, liquidList = M.StockEssenceList(ListOfIngredients[i])
                    if liquid == "stock" then
                        dialog:addOption(331, getText(counter..". Sud",counter..". Stock"))
                    elseif liquid == "essence brew" then
                        dialog:addOption(liquidList[1], getText(counter..". Essenzgebr�u",counter..". Essence brew"))
                    end
                end
            else
                dialog:addOption(ListOfIngredients[i], getText(counter..". "..world:getItemName(ListOfIngredients[i],Player.german),counter..". "..world:getItemName(ListOfIngredients[i],Player.english)))
            end
        end
    end
    User:requestSelectionDialog(dialog)
end

function ShowStockEssence(User, theLiquid, ListOfIngredients, notMenu)
    local getText = function(deText,enText) return common.GetNLS(User,deText,enText) end

    local liquid, liquidList = M.StockEssenceList(theLiquid)
    local de, en, titleDe, titleEn
    if liquid == "essence brew" then
        titleDe = "Essenzgebr�u"
        titleEn = "Essence brew"
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
        titleDe = "Sud"
        titleEn = "Stock"
        de = "Sud:"
        en = "Stock:"
        local concentrationsDe = alchemy.wirkung_de
        local concentrationsEn = alchemy.wirkung_en
        for i=1,#liquidList do
            de = de.."\n"..concentrationsDe[liquidList[i]].." "..alchemy.wirkstoff[i]
            en = en.."\n"..concentrationsEn[liquidList[i]].." "..alchemy.wirkstoff[i]
        end
    end

    local callback = function(dialog)
        M.ShowRecipe(User, ListOfIngredients, notMenu)
    end

    local dialog = MessageDialog(getText(titleDe,titleEn), getText(de,en), callback)
    User:requestMessageDialog(dialog)
end

function M.StockEssenceList(theString)

    local liquid
    if string.find(theString,"stock ") then
        liquid = "stock"
    elseif string.find(theString,"essence ") then
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

function FinishRecipe(User, ListOfIngredients)
    local getText = function(deText,enText) return common.GetNLS(User,deText,enText) end

    local someParchment = M.GetParchmentQuill(User)
    someParchment = M.IsParchmentOK(User,someParchment,ListOfIngredients)
    if not someParchment then
        M.FirstMenu(User, ListOfIngredients)
        return
    end

    if #ListOfIngredients == 0 then
        User:inform("Es wurde noch nichts zum Notieren ausgew�hlt.","Nothing has been selected to be written down so far.", Character.highPriority)
        M.FirstMenu(User, ListOfIngredients)
        return
    end

    local callback = function(dialog)
        if dialog:getSuccess() then
            local parchment = M.GetParchmentQuill(User)
            parchment = M.IsParchmentOK(User,parchment,ListOfIngredients)
            if not parchment then
                M.FirstMenu(User, ListOfIngredients)
                return
            end
            if parchment.number > 1 then
                local data = {}
                data["descriptionDe"] = "Alchemistisches Rezept: "..dialog:getInput()
                data["descriptionEn"] = "Alchemical recipe: "..dialog:getInput()
                data["alchemyRecipe"] = "true"
                for i=1,#ListOfIngredients do
                    data["ingredient"..i] = ListOfIngredients[i]
                end
                world:erase(parchment, 1)
                common.CreateItem(User, 2745, 1, 333, data)
            else
                parchment:setData("descriptionDe","Alchemistisches Rezept: "..dialog:getInput())
                parchment:setData("descriptionEn","Alchemical recipe: "..dialog:getInput())
                parchment:setData("alchemyRecipe","true")
                for i=1,#ListOfIngredients do
                    parchment:setData("ingredient"..i,ListOfIngredients[i])
                end
                world:changeItem(parchment)
            end
        else
            User:inform("Du hast die Rezeptbenennung abgebrochen.","You aborted the naming of the recipe.",Character.lowPriority)
            M.FirstMenu(User, ListOfIngredients)
        end
    end
    local dialog = InputDialog(getText("Rezeptbenennung","Recipe naming"), getText("Gebe einen Namen f�r das Rezept ein.","Enter a name for the recipe."), false, 100, callback)
    User:requestInputDialog(dialog)
    return
end

function M.IsParchmentOK(User,parchment,ListOfIngredients)
    if not parchment then
        User:inform("Du musst eine Feder und ein leeres Pergament in den H�nden halten, um das Rezept zu notieren.", "You have to hold a quill and a parchment in your hands to write the recipe.")
        return nil
    end

    if parchment:getData("descriptionDe") ~= "" and parchment:getData("descriptionEn") ~= "" then
        User:inform("Du braucht ein leeres Pergament.","You need an empty parchment.")
        return nil
    end
    return parchment
end

function M.GetParchmentQuill(User)
    local itemA = User:getItemAt(Character.left_tool)
    local itemB = User:getItemAt(Character.right_tool)

    local theItem
    if itemA.id == 2745 and itemB.id == 463 then
        theItem = itemA
    elseif itemA.id == 463 and itemB.id == 2745 then
        theItem = itemB
    end
    if theItem then
        if User:countItemAt("body",2745,{}) > 0 then
            return theItem
        end
    end
    return nil
end

function CheckAmount(ListOfIngredients, User)

    if #ListOfIngredients > 59 then
        User:inform("Das Pergament ist voll. Du kannst dies nicht mehr dem Rezept hinzuf�gen.","The parchment is full. You cannot add to the recipe anymore.",Character.highPriority)
        return false
    end
    return true
end

function AddToRecipe(ListOfIngredients,addThis)

    table.insert(ListOfIngredients,addThis)

end

function WantToAbort(User, menuFunction, parameterList)
    local getText = function(deText,enText) return common.GetNLS(User,deText,enText) end

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

return M

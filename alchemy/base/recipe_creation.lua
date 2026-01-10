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
local shared = require("craft.base.shared")
local herbs = require("alchemy.base.herbs")
local id_52_filledbucket = require("item.id_52_filledbucket")
local gemdust = require("alchemy.base.gemdust")
local bottling = require("alchemy.bottling")
local licence = require("base.licence")

local M = {}

local USER_POSITION_LIST = {}

local SelectPlantCategory
local selectPlant
local SelectGemDust
local BottleFromCauldron
local SelectFillIntoCauldron
local SelectEssenceBrewOption
local SelectActiveSubstance
local SelectConcentration
local RemoveLastIngredient
local ShowStockEssence
local FinishRecipe
local checkAmount
local addToRecipe
local WantToAbort

-- called by item.id_463_quill
function M.FirstMenu(user, ingredientList)

    if ingredientList == nil then
        ingredientList = {}
    end

    local callback = function(dialog)
        local success = dialog:getSuccess()
        if success then
            local selected = dialog:getSelectedIndex()+1
            if selected == 1 then
                SelectPlantCategory(user, ingredientList)
            elseif selected == 2 then
                SelectGemDust(user, ingredientList)
            elseif selected == 3 then
                SelectFillIntoCauldron(user, ingredientList)
            elseif selected == 4 then
                BottleFromCauldron(user, ingredientList)
            elseif selected == 5 then
                BottleFromCauldron(user, ingredientList, true)
            elseif selected == 6 then
                RemoveLastIngredient(user, ingredientList)
            elseif selected == 7 then
                M.ShowRecipe(user, ingredientList, true)
            elseif selected == 8 then
                FinishRecipe(user, ingredientList)
            end
        else
            WantToAbort(user, M.FirstMenu, {ingredientList})
        end
    end

    local dialog = SelectionDialog(common.GetNLS(user,"Rezepterstellung","Recipe creation"), common.GetNLS(user,"Wähle eine Kategorie aus, aus der du dem Rezept etwas hinzutun willst.","Select a category from which you want to add something to the recipe."), callback)
    dialog:addOption(0, common.GetNLS(user,"Pflanzen","Plants"))
    dialog:addOption(0, common.GetNLS(user,"Edelsteinstaub", "Gem powder"))
    dialog:addOption(0, common.GetNLS(user,"Kessel befüllen","Fill into the cauldron"))
    dialog:addOption(0, common.GetNLS(user,"Kesselinhalt abfüllen","Bottle cauldron content"))
    dialog:addOption(0, common.GetNLS(user,"Bombe/Salve abfüllen","Bottle bomb/salve"))
    dialog:addOption(0, common.GetNLS(user,"Letzte Zutat entfernen","Remove last ingredient"))
    dialog:addOption(0, common.GetNLS(user,"Rezept betrachten","Show recipe"))
    dialog:addOption(0, common.GetNLS(user,"Rezept fertigstellen","Finish recipe"))

    user:requestSelectionDialog(dialog)

end

local PLANT_CATS = {}
PLANT_CATS["DE"] = {"Waldpflanzen"  ,"Wiesenpflanzen","Gebirgspflanzen","Wüstenpflanzen","Sumpfpflanzen","Wasser/Schnee-pflanzen","Multiterraten","Pilze"}
PLANT_CATS["EN"] = {"Forest plants" ,"Grass plants" ,"Mountain plants" ,"Desert plants" ,"Swamp plants" ,"Water/Snow plants" ,"Multiterras"  ,"Mushrooms"}

function SelectPlantCategory(user, ingredientList, currentEssenceList)

    local callback = function(dialog)
        local success = dialog:getSuccess()
        if success then
            local selected = dialog:getSelectedIndex()+1
            if selected == 1 then
                if currentEssenceList then
                    SelectEssenceBrewOption(user, ingredientList, currentEssenceList)
                else
                    M.FirstMenu(user, ingredientList)
                end
            else
                selectPlant(user, ingredientList, PLANT_CATS["EN"][selected-1], currentEssenceList)
            end
        else
            WantToAbort(user, SelectPlantCategory, {ingredientList, currentEssenceList})
        end
    end

    local dialog
    if currentEssenceList == nil then
        dialog = SelectionDialog(common.GetNLS(user,"Rezepterstellung","Recipe creation"), common.GetNLS(user,"Wähle die Pflanzenkategorie aus, aus der du etwas zu dem Rezept hinzutun willst.","Select the plant category from which you want to add something to your recipe."), callback)
    else
        dialog = SelectionDialog(common.GetNLS(user,"Rezepterstellung","Recipe creation"), common.GetNLS(user,"Wähle die Pflanzenkategorie aus, aus der du etwas zum Essenzgebräu hinzutun willst.","Select the plant category from which you want to add something to the essence brew."), callback)
    end
    dialog:addOption(0, common.GetNLS(user,"Zurück","Back"))
    for i=1,#PLANT_CATS["DE"] do
        dialog:addOption(0, common.GetNLS(user,PLANT_CATS["DE"][i],PLANT_CATS["EN"][i]))
    end

    user:requestSelectionDialog(dialog)
end

local PLANTS = {
    ["Forest plants"] = {Item.berries, Item.donfBlade, Item.blackberry, Item.firnisBlossom, Item.strawberry, Item.lifeRoot, Item.tybaltStar, Item.darkMoss, Item.daydream, Item.conBlossom, Item.wolverineFern},
    ["Grass plants"] = {Item.fourleafedOneberry,Item.yellowWeed,Item.redElder,Item.heathFlower,Item.footLeaf,Item.oneleavedFourberry,Item.piousBerry,Item.rainWeed},
    ["Mountain plants"] = {Item.blackThistle, Item.virginsWeed, Item.mandrake, Item.fireRoot, Item.heartBlood, Item.goldCrackHerb},
    ["Desert plants"] = {Item.flamegobletBlossom, Item.sandberry, Item.steppeFern, Item.desertSkyCapsule, Item.desertBerry},
    ["Swamp plants"] = {Item.angerBerry, Item.marshFlower, Item.nightAngelsBlossom},
    ["Water/Snow plants"] = {Item.sibanacLeaf,Item.waterBlossom, Item.iceLeaf},
    ["Multiterras"] = {Item.sunHerb,Item.firTreeSprout,Item.rottenTreeBark,Item.blueBirdsberry},
    ["Mushrooms"] = {Item.bulbspongeMushroom, Item.toadstool, Item.redHead, Item.herdersMushroom, Item.birthMushroom, Item.champignon, Item.stinkhorn, Item.fairyRingMushroom, Item.elfCaps}
}

function selectPlant(user, ingredientList, category, currentEssenceList)

    local callback = function(dialog)
        local success = dialog:getSuccess()
        if success then
            local selected = dialog:getSelectedIndex()+1
            if selected == 1 then
                SelectPlantCategory(user, ingredientList, currentEssenceList)
            else
                if currentEssenceList == nil then
                    if not checkAmount(user, ingredientList) then
                        return
                    end
                    addToRecipe(ingredientList, "ingredient", PLANTS[category][selected-1])
                    user:inform("Wurde dem Rezept hinzugefügt: "..world:getItemName(PLANTS[category][selected-1],Player.german),"Added to the recipe: "..world:getItemName(PLANTS[category][selected-1],Player.english),Character.lowPriority)
                    selectPlant(user, ingredientList, category)
                else
                    if #currentEssenceList == 9 then
                        user:inform("Du kannst nicht mehr als acht Pflanzen zu einem Essengebräu hinzutun.","You cannot add more than eight plants to an essence brew.",Character.lowPriority)
                        SelectEssenceBrewOption(user, ingredientList, currentEssenceList)
                    else
                        table.insert(currentEssenceList,PLANTS[category][selected-1])
                        user:inform("Wurde dem Essenzgebräu hinzugefügt: "..world:getItemName(PLANTS[category][selected-1],Player.german),"Has been added to the essence brew: "..world:getItemName(PLANTS[category][selected-1],Player.english),Character.lowPriority)
                        selectPlant(user, ingredientList, category, currentEssenceList)
                    end
                end
            end
        else
            WantToAbort(user, selectPlant, {ingredientList, category, currentEssenceList})
        end
    end

    local dialog
    if currentEssenceList == nil then
        dialog = SelectionDialog(common.GetNLS(user,"Rezepterstellung","Recipe creation"), common.GetNLS(user,"Wähle die Pflanze aus, die du dem Rezept hinzufügen willst.","Select the plant you want to add to the recipe."), callback)
    else
        dialog = SelectionDialog(common.GetNLS(user,"Rezepterstellung","Recipe creation"), common.GetNLS(user,"Wähle die Pflanze aus, die du dem Essenzgebräu hinzufügen willst.","Select the plant you want to add to the essence brew."), callback)
    end
    dialog:addOption(0, common.GetNLS(user,"Zurück","Back"))
    for i=1,#PLANTS[category] do
        dialog:addOption(PLANTS[category][i],common.GetNLS(user,world:getItemName(PLANTS[category][i],Player.german),world:getItemName(PLANTS[category][i],Player.english)))
    end

    user:requestSelectionDialog(dialog)

end

local GEMPOWDERS = {Item.sapphirePowder,Item.rubyPowder,Item.emeraldPowder,Item.obsidianPowder,Item.amethystPowder,Item.topazPowder,Item.diamondPowder}

function SelectGemDust(user, ingredientList)

    local callback = function(dialog)
        local success = dialog:getSuccess()
        if success then
            local selected = dialog:getSelectedIndex()+1
            if selected == 1 then
                M.FirstMenu(user, ingredientList)
            else
                if not checkAmount(user, ingredientList) then
                    return
                end
                addToRecipe(ingredientList, "ingredient", GEMPOWDERS[selected-1])
                user:inform("Wurde dem Rezept hinzugefügt: "..world:getItemName(GEMPOWDERS[selected-1],Player.german),"Added to the recipe: "..world:getItemName(GEMPOWDERS[selected-1],Player.english),Character.lowPriority)
                SelectGemDust(user, ingredientList)
            end
        else
            WantToAbort(user, SelectGemDust, {ingredientList})
        end
    end

    local dialog = SelectionDialog(common.GetNLS(user,"Rezepterstellung","Recipe creation"), common.GetNLS(user,"Wähle den Edelsteinstaub aus, den du dem Rezept hinzufügen willst.","Select the gem powder you want to add to the recipe."), callback)
    dialog:addOption(0, common.GetNLS(user,"Zurück","Back"))
    for i=1,#GEMPOWDERS do
        dialog:addOption(GEMPOWDERS[i],common.GetNLS(user,world:getItemName(GEMPOWDERS[i],Player.german),world:getItemName(GEMPOWDERS[i],Player.english)))
    end

    user:requestSelectionDialog(dialog)
end

function BottleFromCauldron(user, ingredientList, bombSalve)

    if not checkAmount(user, ingredientList) then
        return
    end
    local emptyBottle, _, essenceBottles = alchemy.getPotionBottleIds(ingredientList)
    if essenceBottles and bombSalve then
        emptyBottle = essenceBottles.empty
    end
    addToRecipe(ingredientList ,"bottling", emptyBottle)
    user:inform("Wurde dem Rezept hinzugefügt: Abfüllen","Added to the recipe: Bottling",Character.lowPriority)
    M.FirstMenu(user, ingredientList)
end

local ESSENCE_BREWS_IDS = {59,165,166,167,327,329,330}
local ESSENCE_BREWS = {}
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


function SelectFillIntoCauldron(user, ingredientList)

    local callback = function(dialog)
        local success = dialog:getSuccess()
        if success then
            local selected = dialog:getSelectedIndex()+1
            if selected == 1 then
                M.FirstMenu(user, ingredientList)
            elseif selected == 2 then
                if not checkAmount(user, ingredientList) then
                    return
                end
                addToRecipe(ingredientList, "ingredient", 52)
                user:inform("Wurde dem Rezept hinzugefügt: "..world:getItemName(52,Player.german),"Added to the recipe: "..world:getItemName(52,Player.english),Character.lowPriority)
                SelectFillIntoCauldron(user, ingredientList)
            elseif selected == 3 then
                SelectActiveSubstance(user, ingredientList, {5,5,5,5,5,5,5,5})
            else
                if not checkAmount(user, ingredientList) then
                    return
                end
                SelectEssenceBrewOption(user, ingredientList, {ESSENCE_BREWS_IDS[selected-3]})
            end
        else
            WantToAbort(user, SelectFillIntoCauldron, {ingredientList})
        end
    end

    local dialog = SelectionDialog(common.GetNLS(user,"Rezepterstellung","Recipe creation"), common.GetNLS(user,"Wähle aus, was du in den Kessel füllen willst.","Select what you want to fill into the cauldron."), callback)
    dialog:addOption(0, common.GetNLS(user,"Zurück","Back"))
    dialog:addOption(52, common.GetNLS(user,world:getItemName(52,Player.german),world:getItemName(52,Player.english)))
    dialog:addOption(331, common.GetNLS(user,"Sud","Stock"))
    for i=1,#ESSENCE_BREWS_IDS do
        local id = ESSENCE_BREWS_IDS[i]
        dialog:addOption(id,common.GetNLS(user,ESSENCE_BREWS[id]["de"],ESSENCE_BREWS[id]["en"]))
    end

    user:requestSelectionDialog(dialog)
end

function SelectEssenceBrewOption(user, ingredientList, currentEssenceList)

    local callback = function(dialog)
        local success = dialog:getSuccess()
        if success then
            local selected = dialog:getSelectedIndex() + 1
            if selected == 1 then
                SelectFillIntoCauldron(user, ingredientList)
            elseif selected == 2 then
                SelectPlantCategory(user, ingredientList, currentEssenceList)
            elseif selected == 3 then
                if #currentEssenceList < 2 then
                    user:inform("Es befinden sich keine Pflanzen zum Entfernen im Essenzgebräu.","There are no plants to be removed in the essence brew.")
                else
                    local removed = table.remove(currentEssenceList)
                    user:inform("Wurde vom Essenzgebräu entfernt: "..world:getItemName(removed,Player.german),"Has been removed from the essence brew: "..world:getItemName(removed,Player.english),Character.lowPriority)
                end
                SelectEssenceBrewOption(user, ingredientList, currentEssenceList)
            else
                addToRecipe(ingredientList, "essence", table.concat(currentEssenceList,";"))
                user:inform("Wurde dem Rezept hinzugefügt: Essenzgebräu","Added to the recipe: Essence brew",Character.lowPriority)
                M.FirstMenu(user, ingredientList)
            end
        else
            WantToAbort(user, SelectEssenceBrewOption, {ingredientList, currentEssenceList})
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

    local dialog = SelectionDialog(common.GetNLS(user,"Rezepterstellung","Recipe creation"), common.GetNLS(user,"Wähle aus, was du machen möchtest. Derzeitiges Essenzgebräu: "..essenceStringDe,"Select what you would like to do. Current essence brew: "..essenceStringEn), callback)

    dialog:addOption(0, common.GetNLS(user,"Zurück","Back"))
    dialog:addOption(0, common.GetNLS(user,"Pflanze hinzufügen","Add plant"))
    dialog:addOption(0, common.GetNLS(user,"Letzte Pflanze entfernen","Remove last plant"))
    dialog:addOption(0, common.GetNLS(user,"Essenzgebräu dem Rezept hinzufügen","Add essence brew to the recipe"))

    user:requestSelectionDialog(dialog)

end

function SelectActiveSubstance(user, ingredientList, currentConcentrations)

    if currentConcentrations == nil then
        currentConcentrations = {5,5,5,5,5,5,5,5}
    end

    local callback = function(dialog)
        local success = dialog:getSuccess()
        if success then
            local selected = dialog:getSelectedIndex() + 1
            if selected == 1 then
                SelectFillIntoCauldron(user, ingredientList)
            elseif selected >= 2 and selected <= 9 then
                SelectConcentration(user,ingredientList,currentConcentrations, selected-1)
            else
                addToRecipe(ingredientList, "stock", table.concat(currentConcentrations,";"))
                user:inform("Wurde dem Rezept hinzugefügt: Sud","Added to the recipe: Stock",Character.lowPriority)
                M.FirstMenu(user, ingredientList)
            end
        else
            WantToAbort(user, SelectActiveSubstance, {ingredientList, currentConcentrations})
        end
    end

    local dialog = SelectionDialog(common.GetNLS(user,"Rezepterstellung","Recipe creation"), common.GetNLS(user,"Wähle einen Wirkstoff aus, um dessen Konzentration festzusetzen. Wähle 'Sud dem Rezept hinzufügen', wenn du damit fertig bist.","Select an active substance to determine its concentration. If you are done, choose 'Add stock to the recipe'"), callback)

    dialog:addOption(0, common.GetNLS(user,"Zurück","Back"))

    for i=1,#alchemy.substances do
        dialog:addOption(0,common.GetNLS(user,alchemy.substances[i]..": "..alchemy.concentrations[Player.german][currentConcentrations[i]],alchemy.substances[i]..": "..alchemy.concentrations[Player.english][currentConcentrations[i]]))
    end
    dialog:addOption(0,common.GetNLS(user,"Sud dem Rezept hinzufügen","Add stock to the recipe"))

    user:requestSelectionDialog(dialog)

end

function SelectConcentration(user,ingredientList,currentConcentrations, activeSubstancePos)

    local callback = function(dialog)
        local success = dialog:getSuccess()
        if success then
            local selected = dialog:getSelectedIndex()+1
            if selected == 1 then
                SelectActiveSubstance(user, ingredientList, currentConcentrations)
            else
                currentConcentrations[activeSubstancePos] = selected-1
                SelectActiveSubstance(user, ingredientList, currentConcentrations)
            end
        else
            WantToAbort(user, SelectConcentration, {ingredientList,currentConcentrations, activeSubstancePos})
        end
    end

    local dialog = SelectionDialog(common.GetNLS(user,"Rezepterstellung","Recipe creation"), common.GetNLS(user,"Wähle eine Konzentration für "..alchemy.substances[activeSubstancePos].." aus.","Select a concentration for "..alchemy.substances[activeSubstancePos].."."), callback)

    dialog:addOption(0, common.GetNLS(user,"Zurück","Back"))
    for i=1,#alchemy.concentrations[Player.german] do
        dialog:addOption(0,common.GetNLS(user,""..alchemy.concentrations[Player.german][i],""..alchemy.concentrations[Player.english][i]))
    end

    user:requestSelectionDialog(dialog)
end

function RemoveLastIngredient(user, ingredientList)

    if #ingredientList==0 then
        user:inform("Das Rezept ist leer. Es kann nichts entfernt werden.","The recipe is empty. There is nothing to be removed.",Character.lowPriority)
        M.FirstMenu(user, ingredientList)
        return
    end
    local removed = table.remove(ingredientList)
    if type(removed)=="number" then
        user:inform("Die letzte Zutat wurde vom Rezept entfernt: "..world:getItemName(removed,Player.german),"The last ingredient has been removed: "..world:getItemName(removed,Player.english),Character.lowPriority)
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
        user:inform("Die letzte Zutat wurde vom Rezept entfernt: "..de,"The last ingredient has been removed: "..en,Character.lowPriority)
    end
    M.FirstMenu(user, ingredientList)
end

function M.ShowRecipe(user, ingredientList, writingRecipe)

    local callback = function(dialog)

        local success = dialog:getSuccess()

        if not success then

            if writingRecipe then
                M.FirstMenu(user, ingredientList)
            end

            return

        end

            local selected = dialog:getSelectedIndex() + 1
            local minus
            if writingRecipe then
                minus = 1
            else
                minus = 0
            end
            if selected == 1 and writingRecipe then
                M.FirstMenu(user, ingredientList)
            elseif ingredientList[selected-minus].key == "stock" or ingredientList[selected-minus].key == "essence" then
                ShowStockEssence(user, ingredientList[selected-minus], ingredientList, writingRecipe)
            else
                M.ShowRecipe(user, ingredientList, writingRecipe)
            end
    end

    local dialog
    if writingRecipe then
        dialog = SelectionDialog(common.GetNLS(user,"Rezeptvorschau","Recipe preview"), common.GetNLS(user,"Hier wird deine bisherige Auswahl angezeigt. Wähle ein Essenzgebräu oder einen Sud aus, um Nähres über dessen Inhalt zu erfahren.","Here are your current choices. Select an essence brew or stock to get to know more about its content."), callback)
    else
        dialog = SelectionDialog(common.GetNLS(user,"Rezept","Recipe"),common.GetNLS(user,"Wähle ein Essenzgebräu oder Sud aus, um Nähres über dessen Inhalt zu erfahren. Wenn du aber vor einem Kessel stehst, wähle eine Zutat aus, von welcher du das Brauen beginnen willst.","Select an essence brew or a stock to get to learn more about its content. But if there is an cauldron infront of you, select the ingredient where you want to start to brew from."),callback)
    end

    if writingRecipe then
        dialog:addOption(0, common.GetNLS(user,"Zurück","Back"))
    end

    local counter = 0

    for _, ingredient in ipairs(ingredientList) do
        counter = counter + 1

        if ingredient.key == "bottling" then
            local emptyBottle = alchemy.getPotionBottleIds(ingredientList)
            dialog:addOption(emptyBottle, common.GetNLS(user,counter..". Abfüllen", counter..". Bottling"))
        elseif ingredient.key == "stock" then
            dialog:addOption(331, common.GetNLS(user,counter..". Sud", counter..". Stock"))
        elseif ingredient.key == "essence" then
            local _, essenceBrewGraphic = alchemy.getEssenceBrewGraphics(ingredient.value)

            dialog:addOption(essenceBrewGraphic, common.GetNLS(user,counter..". Essenzgebräu",counter..". Essence brew"))
        else
            dialog:addOption(ingredient.value, common.GetNLS(user,counter..". "..world:getItemName(ingredient.value, Player.german),counter..". "..world:getItemName(ingredient.value,Player.english)))
        end
    end

    user:requestSelectionDialog(dialog)
end

function ShowStockEssence(user, stockOrEssence, ingredientList, writingRecipe)

    local liquidList = M.StockEssenceSplit(stockOrEssence.value)

    local de, en, titleDe, titleEn
    if stockOrEssence.key == "essence" then
        titleDe = "Essenzgebräu"
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
    elseif stockOrEssence.key == "stock" then
        titleDe = "Sud"
        titleEn = "Stock"
        de = "Sud:"
        en = "Stock:"

        for i=1,#liquidList do
            de = de.."\n"..alchemy.concentrations[Player.german][liquidList[i]].." "..alchemy.substances[i]
            en = en.."\n"..alchemy.concentrations[Player.english][liquidList[i]].." "..alchemy.substances[i]
        end
    end

    local callback = function(dialog)
        M.ShowRecipe(user, ingredientList, writingRecipe)
    end

    local dialog = MessageDialog(common.GetNLS(user,titleDe,titleEn), common.GetNLS(user,de,en), callback)
    user:requestMessageDialog(dialog)
end

function M.StockEssenceSplit(stockEssence)
    return alchemy.StockEssenceSplit(stockEssence)
end

function FinishRecipe(user, ingredientList)

    local someParchment = M.GetParchmentQuill(user)
    someParchment = M.IsParchmentOK(user,someParchment,ingredientList)
    if not someParchment then
        M.FirstMenu(user, ingredientList)
        return
    end

    if #ingredientList == 0 then
        user:inform("Es wurde noch nichts zum Notieren ausgewählt.","Nothing has been selected to be written down so far.", Character.highPriority)
        M.FirstMenu(user, ingredientList)
        return
    end

    local callback = function(dialog)
        if dialog:getSuccess() then
            local parchment = M.GetParchmentQuill(user)
            parchment = M.IsParchmentOK(user,parchment,ingredientList)
            if not parchment then
                M.FirstMenu(user, ingredientList)
                return
            end

            parchment:setData("descriptionDe","Alchemistisches Rezept: "..dialog:getInput())
            parchment:setData("descriptionEn","Alchemical recipe: "..dialog:getInput())
            parchment:setData("alchemyRecipe","true")

            common.convertTableToItemData(user, parchment, ingredientList, "alchemyIngredients", alchemy.maxEntriesPerRecipe)
        else
            user:inform("Du hast die Rezeptbenennung abgebrochen.","You aborted the naming of the recipe.",Character.lowPriority)
            M.FirstMenu(user, ingredientList)
        end
    end
    local dialog = InputDialog(common.GetNLS(user,"Rezeptbenennung","Recipe naming"), common.GetNLS(user,"Gebe einen Namen für das Rezept ein.","Enter a name for the recipe."), false, 100, callback)
    user:requestInputDialog(dialog)
    return
end

function M.IsParchmentOK(user,parchment,ingredientList)
    if not parchment then
        user:inform("Du musst eine Feder und ein leeres Pergament in den Händen halten, um das Rezept zu notieren.", "You have to hold a quill and a parchment in your hands to write the recipe.")
        return nil
    end

    if parchment:getData("descriptionDe") ~= "" and parchment:getData("descriptionEn") ~= "" then
        user:inform("Du braucht ein leeres Pergament.","You need an empty parchment.")
        return nil
    end

    if parchment.number > 1 then
        user:inform("Du kannst immer nur auf einem Pergament gleichzeitig schreiben.", "You can only write on one parchment at a time.")
    end

    return parchment
end

function M.GetParchmentQuill(user)
    local itemA = user:getItemAt(Character.left_tool)
    local itemB = user:getItemAt(Character.right_tool)

    local theItem
    if itemA.id == Item.parchment and itemB.id == Item.quill then
        theItem = itemA
    elseif itemA.id == Item.quill and itemB.id == Item.parchment then
        theItem = itemB
    end
    if theItem then
        if user:countItemAt("body",Item.parchment,{}) > 0 then
            return theItem
        end
    end
    return nil
end

function checkAmount(user, ingredientList)

    local theString = common.tableToString(user, ingredientList)

    local maxLength = alchemy.maxEntriesPerRecipe*250

    if string.len(theString) > maxLength - 10 then
        user:inform("Das Pergament ist voll. Du kannst dies nicht mehr dem Rezept hinzufügen.","The parchment is full. You cannot add to the recipe anymore.",Character.highPriority)
        return false
    end
    return true
end

function addToRecipe(ingredientList, key, value)

    table.insert(ingredientList, {key = key, value = value})

end

function WantToAbort(user, menuFunction, parameterList)

    local callback = function(dialog)
        local success = dialog:getSuccess()
        if success then
            local selected = dialog:getSelectedIndex()+1
            if selected == 1 then
                menuFunction(user,parameterList[1],parameterList[2],parameterList[3],parameterList[4])
            else
                user:inform("Du hast die Rezeptherstellung abgebrochen.","You aborted the recipe creation.",Character.lowPriority)
            end
        else
            menuFunction(user,parameterList[1],parameterList[2],parameterList[3],parameterList[4])
        end
    end
    local dialog = SelectionDialog(common.GetNLS(user,"Rezepterstellung","Recipe creation"), common.GetNLS(user,"Willst du die Rezepterstellung wirklich abbrechen?","Do you really want to abort the recipe creation?"), callback)
    dialog:addOption(0, common.GetNLS(user,"Nein","No"))
    dialog:addOption(0, common.GetNLS(user,"Ja", "Yes"))

    user:requestSelectionDialog(dialog)

end

local parchmentSelectionStatus = {}

function M.getParchmentSelectionStatus(user)

    return parchmentSelectionStatus[user.id]

end

function M.addRecipeToBook(user, parchment)

    parchmentSelectionStatus[user.id] = false

    local book = common.checkIfBookInHand(user, true)

    if not book then
        return
    end

    if common.IsNilOrEmpty(book:getData("alchemyBook")) then
        book:setData("alchemyBook", "true")
    end

    local indexToUse = 1

    for i = 1, 40 do --check for the first available index
        if common.IsNilOrEmpty(book:getData("alchemyRecipe"..i)) then
            indexToUse = i
            break
        elseif i == 40 then
            indexToUse = false
        end
    end

    if not indexToUse then
        user:inform("Dieses Buch hat keinen Platz mehr für Rezepte.","This book has no more space for recipes.")
    end

    book:setData("alchemyRecipe"..indexToUse, parchment:getData("descriptionEn"))

    for i = 1, 5 do
        local ingredients = parchment:getData("alchemyIngredients"..i)
        if not common.IsNilOrEmpty(ingredients) then
            book:setData("alchemyRecipe"..indexToUse.."page"..i, ingredients)
        end
    end

    world:changeItem(book)
    world:erase(parchment, 1)

end

function M.placeInBook(user)

    parchmentSelectionStatus[user.id] = true
    user:inform("Halte ein leeres Buch oder ein Alchemie-Rezeptbuch mit weniger als 40 Rezepten in der Hand und doppelklicke dann auf ein Alchemie-Rezept, um es in das Buch zu legen.", "Hold an empty book or an alchemy recipe book with less than 40 recipes in your hand, then double click an alchemy recipe to place it into the book.")

end

local function removeARecipePage(user, book)

    local index

    for i = 1, 100 do
        if not common.IsNilOrEmpty(book:getData("alchemyRecipe"..i)) then
            index = i
        end
    end

    if not index then
        return
    end

    local data = { descriptionEn = book:getData("alchemyRecipe"..index), descriptionDe = book:getData("alchemyRecipe"..index)}

    data.alchemyRecipe = "true"

    for i = 1, 5 do
        data["alchemyIngredients"..i] = book:getData("alchemyRecipe"..index.."page"..i)
    end

    user:createItem(Item.parchment, 1, 333, data)

    if index == 1 then
        book:setData("alchemyBook", "")
    end

    book:setData("alchemyRecipe"..index, "")

    for i = 1, 5 do
        book:setData("alchemyRecipe"..index.."page"..i, "")
    end

    world:changeItem(book)

    user:inform("Letztes Rezept aus dem Buch abrufen.", "You retrieve the last recipe from the book.")

end

local function GetItem(user, listOfTheIngredients)

    local deleteItem, deleteId, missingDe, missingEn

    local key = listOfTheIngredients[USER_POSITION_LIST[user.id]].key
    local value = listOfTheIngredients[USER_POSITION_LIST[user.id]].value

    if key == "bottling" then
        local bottleId = listOfTheIngredients[USER_POSITION_LIST[user.id]].value
        local bottleList = user:getItemList(bottleId)
        if #bottleList > 0 then
            deleteItem = bottleList[1] -- here, we take the first bottle we get
            for i=1, #bottleList do
                if not string.find(bottleList[i]:getData("descriptionEn"),"Bottle label:") then -- now, we check if there is an empty bottle; we prefer those
                    deleteItem = bottleList[i] -- in case there is a empty, unlabeled bottle
                    break
                end
            end
        end

        if not (deleteItem) then
            missingDe = "Dir fehlt: "..common.getItemName(bottleId, user:getPlayerLanguage() )
            missingEn = "You don't have: "..common.getItemName(bottleId, user:getPlayerLanguage() )
        end
    elseif key == "stock" or key == "essence" then
        local neededList = M.StockEssenceSplit(value)

        if key == "stock" then
            local stockList = user:getItemList(331)
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
        elseif key == "essence brew" then
            local neededId = table.remove(neededList,1)
            local bottleList = user:getItemList(neededId)
            local currentList
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
        elseif key == "ingredient" then

        local ingredientId = listOfTheIngredients[USER_POSITION_LIST[user.id]].value

        if user:countItemAt("all",ingredientId) > 0 then
            deleteId = ingredientId
        end
        if not deleteId then
            missingDe = "Dir fehlt: "..world:getItemName(ingredientId,Player.german)
            missingEn = "You don't have: "..world:getItemName(ingredientId,Player.english)
        end
    end

    return deleteItem, deleteId, missingDe, missingEn
end

local function GetStartAction(user, listOfTheIngredients, cauldron)

    local ingredient = listOfTheIngredients[USER_POSITION_LIST[user.id]]
    local canUseHerb = true

    if ingredient.key == "ingredient" and alchemy.getPlantSubstance(ingredient) or ingredient == 157 then
        canUseHerb = alchemy.canUseHerb(user, ingredient)
    end

    local duration,gfxId,gfxIntervall,sfxId,sfxIntervall = alchemy.GetStartAction(user, ingredient, cauldron)
    return duration,gfxId,gfxIntervall,sfxId,sfxIntervall, canUseHerb
end

local function CallBrewFunctionAndDeleteItem(user,deleteItem, deleteId,cauldron)

    local result = {}
    result.repeatStep = false
    if deleteId then
        if deleteId == 52 then -- water
            local buckets = user:getItemList(deleteId)
            -- here, we could need a check if the bucket has no datas
            id_52_filledbucket.FillIn(user, buckets[1], cauldron, true)

        elseif alchemy.CheckIfGemDust(deleteId) then    --gemdust
            gemdust.BrewingGemDust(user, deleteId, false, cauldron)

        elseif alchemy.getPlantSubstance(deleteId) or deleteId == 157 then -- plant/rotten tree bark
            herbs.BeginnBrewing(user, deleteId, false, cauldron)
        end

    else
        if deleteItem.id == Item.emptyPotion or deleteItem.id == Item.emptyAlchemyBomb or deleteItem.id == Item.emptySalveJar then
            local fillBottleResult = bottling.FillIntoBottle(user, deleteItem, cauldron)
            if fillBottleResult.ilynApplied then
                result.repeatStep = true
            end

            if fillBottleResult.wrongBottle then
                result.wrongBottle = fillBottleResult.wrongBottle
            end
        elseif alchemy.CheckIfPotionBottle(deleteItem) then
            alchemy.FillIntoCauldron(user,deleteItem,cauldron)
        end
    end

    return result
end

local function StartBrewing(user,recipeTable,ltstate,checkVar)

    local cauldron = alchemy.GetCauldronInfront(user)
    local tool = alchemy.getAlchemyTool(user)

    if not tool then
        alchemy.informAlchemyToolNeeded(user)
        return
    end

    if not cauldron then -- security check
        return
    end

    if licence.licence(user) then --checks if user is citizen or has a licence
        return -- avoids crafting if user is neither citizen nor has a licence
    end

    if ( ltstate == Action.abort ) then
        user:inform("Du brichst deine Arbeit vor dem "..USER_POSITION_LIST[user.id]..". Arbeitsschritt ab.", "You abort your work before the "..USER_POSITION_LIST[user.id].." work step.")
        return
    end

    if not checkVar and ltstate==Action.none then
        local callback = function(dialog)
            local success = dialog:getSuccess()
            if success then
                local selected = dialog:getSelectedIndex()+1
                USER_POSITION_LIST[user.id] = selected
                StartBrewing(user, recipeTable,ltstate,true)
            end
        end

        local dialog = SelectionDialog(common.GetNLS(user,"Rezept","Recipe"), common.GetNLS(user,"Wähle die Zutat aus, ab welcher das Rezept abgearbeitet werden soll.","Select the ingredient which you want to start to brew from."), callback)

        dialog:setCloseOnMove()

        local counter = 0

        for _, ingredient in ipairs(recipeTable) do
            counter = counter + 1

            if ingredient.key == "bottling" then
                local emptyBottle = alchemy.getPotionBottleIds(recipeTable)
                dialog:addOption(emptyBottle, common.GetNLS(user,counter..". Abfüllen", counter..". Bottling"))
            elseif ingredient.key == "stock" then
                dialog:addOption(331, common.GetNLS(user,counter..". Sud", counter..". Stock"))
            elseif ingredient.key == "essence" then
                local _, essenceBrewGraphic = alchemy.getEssenceBrewGraphics(ingredient.value)
                dialog:addOption(essenceBrewGraphic, common.GetNLS(user,counter..". Essenzgebräu",counter..". Essence brew"))
            else
                dialog:addOption(ingredient.value, common.GetNLS(user,counter..". "..world:getItemName(ingredient.value,Player.german),counter..". "..world:getItemName(ingredient.value,Player.english)))
            end
        end
        user:requestSelectionDialog(dialog)
        return
    end

    local deleteItem, deleteId, missingDe, missingEn = GetItem(user, recipeTable)

    if missingDe then
        user:inform("Du brichst deine Arbeit vor dem "..USER_POSITION_LIST[user.id]..". Arbeitsschritt ab. "..missingDe, "You abort your work before the "..USER_POSITION_LIST[user.id]..". work step. "..missingEn)
        return
    end

    local duration,gfxId,gfxIntervall,sfxId,sfxIntervall, canUseHerb = GetStartAction(user, recipeTable, cauldron)

    if (ltstate == Action.none) then
        if canUseHerb then
            user:startAction(duration,gfxId,gfxIntervall,sfxId,sfxIntervall);
        end
        return

    end

    local brewResult = CallBrewFunctionAndDeleteItem(user,deleteItem, deleteId,cauldron)
    local toolbroken = shared.toolBreaks(user, tool, duration)

    -- repeat step if ilyn applied when bottling the cauldron content
    if not brewResult.repeatStep then
        USER_POSITION_LIST[user.id] = USER_POSITION_LIST[user.id]+1
    end

    if brewResult.wrongBottle then
        user:inform("Das ist die falsche Art von Flasche für diese Art von Flüssigkeit. Du brauchst eine Flasche vom Typ "..brewResult.wrongBottle.german..". Du brichst deine Arbeit vor dem "..USER_POSITION_LIST[user.id]..". Arbeitsschritt ab.", "That's the wrong type of bottle for this kind of liquid. You need a "..brewResult.wrongBottle.english..". You abort your work before the "..USER_POSITION_LIST[user.id]..". work step.")
        return
    end

    if toolbroken and USER_POSITION_LIST[user.id] < #recipeTable then
        user:inform("Du brichst deine Arbeit vor dem "..USER_POSITION_LIST[user.id]..". Arbeitsschritt ab.", "You abort your work before the "..USER_POSITION_LIST[user.id]..". work step.")
        return
    end

    if alchemy.CheckExplosionAndCleanList(user) then
        if USER_POSITION_LIST[user.id] < #recipeTable then
            user:inform("Du brichst deine Arbeit vor dem "..USER_POSITION_LIST[user.id]..". Arbeitsschritt ab.", "You abort your work before the "..USER_POSITION_LIST[user.id]..". work step.")
        end
        return
    end

    if USER_POSITION_LIST[user.id] > #recipeTable then
        return
    else
        duration,gfxId,gfxIntervall,sfxId,sfxIntervall, canUseHerb = GetStartAction(user, recipeTable, cauldron)
        if canUseHerb then
            user:startAction(duration,gfxId,gfxIntervall,sfxId,sfxIntervall);
        else
            user:inform("Du brichst deine Arbeit vor dem "..USER_POSITION_LIST[user.id]..". Arbeitsschritt ab.", "You abort your work before the "..USER_POSITION_LIST[user.id]..". work step.")
        end
    end

end

function M.useRecipe(user, recipeTable,ltstate,checkVar)


    -- is the char an alchemist?
    local anAlchemist = alchemy.CheckIfAlchemist(user)
    if not anAlchemist then
        user:inform("Nur jene, die in die Kunst der Alchemie eingeführt worden sind, können hier ihr Werk vollrichten.","Only those who have been introduced to the art of alchemy are able to work here.")
        return
    end

    -- proper attriutes?
    if ( user:increaseAttrib("perception",0) + user:increaseAttrib("essence",0) + user:increaseAttrib("intelligence",0) ) < 30 then
        user:inform("Verstand, ein gutes Auge und ein Gespür für die feinstofflichen Dinge - dir fehlt es daran, als dass du hier arbeiten könntest.",
                    "Mind, good eyes and a feeling for the world of fine matter - with your lack of those, you are unable to work here."
                    )
        return
    end

    -- let's start!
    StartBrewing(user, recipeTable,ltstate,checkVar)
end

local function showBookRecipe(user, book, index, actionState)

    local data = {}

    for i = 1, alchemy.maxEntriesPerRecipe do
        data["alchemyIngredients"..i] = book:getData("alchemyRecipe"..index.."page"..i)
    end

    local ingredientList = common.convertItemDataToTable(user, false, "alchemyIngredients", alchemy.maxEntriesPerRecipe, data)

    if alchemy.GetCauldronInfront(user) then
        -- The char wants to use the recipe infront of a cauldron.
        M.useRecipe(user, ingredientList, actionState)
    else
        -- Not infront of a cauldron.
        M.ShowRecipe(user, ingredientList)
    end
end

local currentPage = {}

function M.viewRecipeBook(user, book, page, actionState)

    if actionState == Action.success then
        showBookRecipe(user, book, currentPage[user.id], actionState)
        return
    elseif actionState ~= Action.none then
        return
    end

    if not page then
        page = 0
    end

    local timeStamp = world:getTime("unix")

    book:setData("timeStamp", tostring(timeStamp)) --to prevent dupes we timestamp the book to find it again later

    world:changeItem(book)

    local firstRecipeOfNextPage = (page+1)*10+1

    local nextPageExists = not common.IsNilOrEmpty(book:getData("alchemyRecipe"..firstRecipeOfNextPage))

    local callback = function(dialog)

        local success = dialog:getSuccess()

        if not success then
            return
        end

        local selected = dialog:getSelectedIndex()+1

        book = common.GetItemInInventory(user, book.id, {{"timeStamp", tostring(timeStamp)}})

        if not book then return end

        local previousOptions = 1

        if nextPageExists then
            previousOptions = 2
        end

        if page and page > 0 then
            previousOptions = 3
        end

        if selected == 1 then
            removeARecipePage(user, book)
        elseif ((selected == 2 and previousOptions == 2) or (selected == 3 and previousOptions == 3)) and nextPageExists then
            M.viewRecipeBook(user, book, page+1)
        elseif (selected == 2 and previousOptions == 3 and nextPageExists) or (selected == 2 and previousOptions == 2) then
            M.viewRecipeBook(user, book, page-1)
        else

            for i = 1, 10 do
                if selected == i+previousOptions then
                    currentPage[user.id] = page*10+i
                    showBookRecipe(user, book, page*10+i, actionState)
                end
            end
        end
    end

    local dialog = SelectionDialog(common.GetNLS(user,"Rezeptübersicht","Recipe overview") , common.GetNLS(user, "Verwende diese Rezepte zusammen mit einem Mörser an einem Kessel, um Tränke zu brauen.", "Use these recipes at a cauldron along with a mortar to brew potions.") , callback)

    dialog:addOption(228, common.GetNLS(user, "Letztes Rezept entfernen","Remove last recipe"))

    if page and page > 0 then
        dialog:addOption(Item.parchment, common.GetNLS(user, "Vorherige Seite", "Previous Page"))
    end

    if nextPageExists then
        dialog:addOption(Item.parchment, common.GetNLS(user, "Nächste Seite","Next Page"))
    end

    for i = page*10+1, page*10+10 do --Up to 10 recipes shown per page
        if not common.IsNilOrEmpty(book:getData("alchemyRecipe"..i)) then
            dialog:addOption(Item.parchment, book:getData("alchemyRecipe"..i))
        end
    end

    user:requestSelectionDialog(dialog)
end

return M

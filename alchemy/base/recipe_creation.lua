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

return M

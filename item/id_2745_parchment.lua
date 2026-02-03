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
local potionToTeacher = require("triggerfield.potionToTeacher")
local recipe_creation = require("alchemy.base.recipe_creation")
local lookat = require("base.lookat")
local shipmasterParchments = require("content.shipmasterParchments")
local messenger = require("content.messenger")
local bookWriting = require("item.base.bookWriting")
local music = require("item.base.music")
local cookingRecipeCreation = require("craft.cookingRecipeCreation")

local M = {}

local LearnLenniersDream
local TeachLenniersDream
local GenerateStockDescription
local TaskToLearn
local AlchemyRecipe

local function bookListLookAt(user,Item)
    local itemLookat = lookat.GenerateLookAt(user, Item, lookat.NONE)
    itemLookat.name = common.GetNLS(user, "Liste der magischen Bücher", "Magic Book List")
    itemLookat.description = common.GetNLS(user,
        "Diese Bücher können gelesen werden um arkane Magie zu erlernen:Der alte Pfad der Magie, Magisches Wasser, Echsen und Magie, Von den Ebenen, Grundlagen arkaner Theorie, Manaströme, Grundwerk der Artefaktmagie, Die Sippen, Die Beschwörung von Pran Xixuan, Taschenbuch der Thaumatologie und Von der Herkunft dr Magie",
        "These books can be read to learn arcane magic: The Old Path of Magic, The Magic Water, Lizards and Magic, About the Planes, Basics of Arcane Theory, Mana Streams, Basics of Artifact Magic, The Clansmen, Summoning of Pran Xixuan, Handbook of Thaumathology and About the Origins of Magic")
    return itemLookat
end

-- important: do not remove the fourth parameter "checkVar".
-- it is important for alchemy
-- you can just ignore it

function M.getWrittenTextFromParchment(theParchment)
    if not common.IsNilOrEmpty(theParchment:getData("writtenText")) then
        local writtenText = theParchment:getData("writtenText")
        for i = 2, 4 do
            local addText = theParchment:getData("writtenText"..i)
            writtenText = writtenText..addText
        end
        if not common.IsNilOrEmpty(theParchment:getData("signatureText")) then
            writtenText = writtenText .. "\n~" .. theParchment:getData("signatureText") .. "~"
        end

        return writtenText
    end

    return false
end

function M.UseItem(user, SourceItem,ltstate,checkVar)

    if recipe_creation.getParchmentSelectionStatus(user) then
        recipe_creation.addRecipeToBook(user, SourceItem)
        return
    end

    if cookingRecipeCreation.selectParchment(user, SourceItem) then
        return
    end

    if cookingRecipeCreation.isRecipe(SourceItem) then
        cookingRecipeCreation.showRecipe(user, SourceItem)
        return
    end

    -- Check if the messenger has requested a parchment
    if messenger.getParchmentSelectionStatus(user, SourceItem) then
        return
    end

    -- Check if it is an alchemy recipe.
    if SourceItem:getData("alchemyRecipe") == "true" then
        AlchemyRecipe(user, SourceItem,ltstate,checkVar)
        return
    end

    if SourceItem:getData("TeachLenniersDream")=="true" then
        LearnLenniersDream(user)
        return
    end

    if bookWriting.getParchmentSelectionStatus(user) then
        bookWriting.addNewPageToBook(user, SourceItem)
        return
    end

    if music.getParchmentSelectionStatus(user) then
        music.addNewSheetToBook(user, SourceItem)
        return
    end

    local notes = SourceItem:getData("notes")

    if not _G.playtogether then
        _G.playtogether = {}
    end

    if not common.IsNilOrEmpty(notes) then

        local sheetTable = {notes = notes, name = SourceItem:getData("sheetName"), instrument = SourceItem:getData("instrument")}

        for i = 2, 20 do
            sheetTable["notes"..i] = SourceItem:getData("notes"..i)
        end

        if ltstate == Action.none then
            music.noteListView(user, ltstate, sheetTable)
        else
            if _G.playtogether[user.id] and not _G.playtogether[user.id].signalGiven and _G.playtogether[user.id].waiting then

                if not _G.playtogether[user.id].count then
                    _G.playtogether[user.id].count = 0
                end

                _G.playtogether[user.id].count = _G.playtogether[user.id].count + 1
                if _G.playtogether[user.id].count < 3000 then --If it's been more than 5 minutes without anyone starting to play we break the loop
                    user:startAction( 1, 0, 0, 0, 0)
                end
                return
            end

            music.playTheInstrument(user, ltstate, sheetTable)

        end
        return
    end




    local writtenText = M.getWrittenTextFromParchment(SourceItem)

    if writtenText then
        local dialog = MessageDialog(
            common.GetNLS(user, "Pergament", "Parchment"),
            writtenText,
            --[[callback=]]function(d) end
            )
        user:requestMessageDialog(dialog)
    else
        user:inform("Auf diesem Pergament steht noch nichts. Benutze einen Federkiel um auf ihm zu schreiben.","Nothing is written on this parchment. Use a quill to write on it.")
    end

end

function LearnLenniersDream(user)

    local anAlchemist = alchemy.CheckIfAlchemist(user)
    if not anAlchemist then
        user:inform("Du erkennst hier nur seltsames Gekritzel.","Only strange scribbling can be seen here.")
        return
    end

    local foundEffect, myEffect = user.effects:find(59);
    if foundEffect then
        local findsight, sightpotion = myEffect:findValue("sightpotion")
        if findsight then
            if sightpotion == user:getQuestProgress(860) then
                TeachLenniersDream(user)
                return
            end
        end
    end

    TaskToLearn(user)
end

function TeachLenniersDream(user)


    local callback = function(dialog)
        potionToTeacher.TellRecipe(user, 318)
    end

    local textDE = "Als du deinen Blick auf die wirren Zeilen richtest, beginnen sie sich zu ordnen. Das unleserliche Chaos weicht langsam einer Ordnung."
    local textEN = "As you look at the confusing lines, they start to arrange themselves. The unreadable chaos is replaced by order."

    local dialog
    if user:getPlayerLanguage() == 0 then
        dialog = MessageDialog("Was steht da wohl?", textDE, callback)
    else
        dialog = MessageDialog("What could be written here?", textEN, callback)
    end
    user:requestMessageDialog(dialog)

end

function M.GenerateStockConcentration()

    local stockList = {1,1,1,1,1,1,1,1}
    local add = 43
    if math.random(1,2)==1 then
        add = 21
    end

    while add > 0 do
        local check = false
        while check == false do
            local rnd = math.random(1,8)
            if stockList[rnd] < 9 then
                stockList[rnd] = stockList[rnd]+1
                add = add - 1
                check = true
            end
        end
    end
    return stockList
end

function M.GetStockFromQueststatus(user)

    if user:getQuestProgress(860) == 0 then
        local stockList
        stockList = M.GenerateStockConcentration()
        user:setQuestProgress(860,alchemy.DataListToNumber(stockList))
    end
    return alchemy.splitStock(user:getQuestProgress(860))
end

function GenerateStockDescription(user)

    local stockList = M.GetStockFromQueststatus(user)
    local de = ""
    local en = ""
    for i=1,#stockList do
        de = de .. alchemy.concentrations[Player.german][stockList[i]] .. " "..alchemy.substances[i]
        en = en .. alchemy.concentrations[Player.english][stockList[i]] .. " "..alchemy.substances[i]
        if i ~= 8 then
            de = de .. ", "
            en = en .. ", "
        end
    end
    return de, en
end

function TaskToLearn(user)

    local callback = function(dialog) end

    local stockDe, stockEn = GenerateStockDescription(user)

    local textDE = "Die Zeilen auf dem Pergament sind verschwommen und scheinen sich ständig zu bewegen. Nur ein paar Zeilen, lassen sich lesen:\n\n\nNeugierig, was hier steht? Nun, dann flößt euch das folgende Gebräu ein und ich verrate euch das Geheimnis:\nEin Trank, der zum einen aus einem Essenzgebräu auf Rubinstaubbasis (essenzierte Kräuter: Wutbeere, Wutbeere, Regenkraut, Tagtraum, Fliegenpilz) besteht und zum anderen aus einem Sud mit folgenden Konzentrationen: " .. stockDe
    local textEN = "The writing on this parchment is blurry and the lines seem to be constantly moving. Only the following lines can be read:\n\n\nAre you curious what might be written here? Well, swallow the following potion and I will tell you the secret:\nA potion made from an essence brew based on ruby powder (containing: anger berry, anger berry, rain weed, daydream, toadstool) and from a stock having the following concentrations: " .. stockEn

    local dialog
    if user:getPlayerLanguage() == 0 then
        dialog = MessageDialog("Was steht da wohl?", textDE, callback)
    else
        dialog = MessageDialog("What could be written here?", textEN, callback)
    end
    user:requestMessageDialog(dialog)

end

function AlchemyRecipe(user, SourceItem,ltstate,checkVar)

    local recipeTable = common.convertItemDataToTable(user, SourceItem, "alchemyIngredients", alchemy.maxEntriesPerRecipe)

    if alchemy.GetCauldronInfront(user) then
        -- The char wants to use the recipe infront of a cauldron.
        recipe_creation.useRecipe(user, recipeTable,ltstate,checkVar)
    else
        -- Not infront of a cauldron.
        recipe_creation.ShowRecipe(user, recipeTable)
    end

end

local function convertOldSheet(oldSheet)



    local amount = oldSheet:getData("noteAmount")

    local newNotes = ""

    for i = 1, tonumber(amount) do
        local duration = oldSheet:getData("noteDuration"..i)
        local note = oldSheet:getData("note"..i)

        oldSheet:setData("note"..i, "")
        oldSheet:setData("noteDuration"..i, "")

        if newNotes ~= "" then
            newNotes = newNotes..","
        end

        newNotes = newNotes..note..","..duration

    end

    oldSheet:setData("noteAmount", "")
    oldSheet:setData("notes", string.sub(newNotes, 1, 250))

    for i = 2, 20 do
        oldSheet:setData("notes"..i, string.sub(newNotes, 1+(250*i-1), 250*i))
    end

    if oldSheet:getData("instrument") ~= "drum" then
        oldSheet:setData("instrument", "notes")
    end

    world:changeItem(oldSheet)
end


function M.LookAtItem(user, parchment)

    if not common.IsNilOrEmpty(parchment:getData("alchemyRecipe")) and common.IsNilOrEmpty(parchment:getData("alchemyIngredients1")) then
        alchemy.convertOldRecipeToNew(user, parchment)
    end

    local lookAt = lookat.GenerateLookAt(user, parchment)

    if cookingRecipeCreation.isRecipe(parchment) then
        local ingredients = cookingRecipeCreation.getDishIngredients(parchment)
        local _, level = cookingRecipeCreation.getDishWorthLevel(ingredients)
        local skillName = user:getSkillName(Character["cookingAndBaking"])
        lookAt = lookat.GenerateLookAt(user, parchment, lookat.NONE, level, "cookingAndBaking", {english = skillName, german = skillName})
        lookAt.name = common.GetNLS(user, "Kulinarisches Rezept: "..parchment:getData("name"), "Culinary recipe: "..parchment:getData("name"))
        lookAt.description = common.GetNLS(user, "Ein kulinarisches Rezept mit Anweisungen für Köche und Bäcker, wie man ein bestimmtes Gericht zubereitet.", "A culinary recipe with instructions for cooks and bakers on how to make a specific dish. ")
        return lookAt
    end

    if not common.IsNilOrEmpty(parchment:getData("note1")) then
        convertOldSheet(parchment)
    end

    if parchment:getData("bookList") == "true" then
        return bookListLookAt(user, parchment)
    end

    if not common.IsNilOrEmpty(parchment:getData("instrument")) then
        lookAt.name = common.GetNLS(user, "Notenblatt", "Music Sheet")
        lookAt.description = common.GetNLS(user, "Das Pergament enthält Noten.","The parchment contains musical notes.")
    end

    local sheetName = parchment:getData("sheetName")

    if not common.IsNilOrEmpty(sheetName) then
        lookAt.description = common.GetNLS(user, "Namen: "..sheetName, "Name: "..sheetName)
    end

    return lookAt
end

function M.MoveItemAfterMove(user, sourceItem, targetItem)
    shipmasterParchments.parchmentWasMoved(sourceItem)
end

return M


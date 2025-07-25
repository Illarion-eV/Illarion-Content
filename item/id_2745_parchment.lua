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
local id_3642_empty_salve_jar = require("alchemy.item.id_3642_empty_salve_jar")
local potionToTeacher = require("triggerfield.potionToTeacher")
local recipe_creation = require("alchemy.base.recipe_creation")
local lookat = require("base.lookat")
local licence = require("base.licence")
local shipmasterParchments = require("content.shipmasterParchments")
local shared = require("craft.base.shared")
local messenger = require("content.messenger")
local bookWriting = require("item.base.bookWriting")
local music = require("item.base.music")
local drum = require("item.id_533_drum")

local M = {}

local USER_POSITION_LIST = {}

local LearnLenniersDream
local TeachLenniersDream
local GenerateStockDescription
local TaskToLearn
local AlchemyRecipe
local UseRecipe
local StartBrewing
local CallBrewFunctionAndDeleteItem
local GetStartAction
local GetItem
local ViewRecipe
local getIngredients

local function bookListLookAt(user,Item)
    local itemLookat = lookat.GenerateLookAt(user, Item, lookat.NONE)
    itemLookat.name = common.GetNLS(user, "Liste der magischen B�cher", "Magic Book List")
    itemLookat.description = common.GetNLS(user,
        "Diese B�cher k�nnen gelesen werden um arkane Magie zu erlernen:Der alte Pfad der Magie, Magisches Wasser, Echsen und Magie, Von den Ebenen, Grundlagen arkaner Theorie, Manastr�me, Grundwerk der Artefaktmagie, Die Sippen, Die Beschw�rung von Pran Xixuan, Taschenbuch der Thaumatologie und Von der Herkunft dr Magie",
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

local function viewListOfNotes(user, SourceItem)

    local amount = SourceItem:getData("noteAmount")

    if common.IsNilOrEmpty(amount) then
        return
    end

    local list = ""

    for i = 1, tonumber(amount) do
        local note = SourceItem:getData("note"..i)
        local duration = SourceItem:getData("noteDuration"..i)

        if SourceItem:getData("instrument") == "drum" then
            for _, sound in pairs(music.drumSounds) do
                if sound.id == tonumber(note) then
                    note = common.GetNLS(user, sound.name.german, sound.name.english)
                    break
                end
            end
        end

        list = list.."\n"..note..", "..duration..common.GetNLS(user, " Dezisekunden.", " deciseconds.")
    end

    local title = common.GetNLS(user, "Unbenanntes Notenblatt", "Unnamed sheet")
    local name = SourceItem:getData("sheetName")

    if not common.IsNilOrEmpty(name) then
        title = name
    end

    local callback = function(dialog) end

    local dialog = MessageDialog( title, list, callback)
    user:requestMessageDialog(dialog)
end

local function noteListView(user, ltstate, SourceItem, instrument)

    local callback = function(dialog)

        if not dialog:getSuccess() then
            return
        end

        local selected = dialog:getSelectedIndex() + 1

        if selected == 1 then
            if instrument == "drum" then
                drum.playTheDrum(user, ltstate, false, SourceItem)
            else
                music.playTheInstrument(user, ltstate, false, SourceItem, instrument)
            end
        elseif selected == 2 then
            viewListOfNotes(user, SourceItem)
        elseif selected == 3 then
            music.playMusicTogether(user, ltstate)
        end
    end

    local instruments = {"drum", "harp", "lute", "panpipe", "flute"}
    local instrumentsGerman = {"Trommel", "Harfe", "Laute", "Panfl�te", "Fl�te"}

    local germanName = instrument

    for index, inst in pairs(instruments) do
        if instrument == inst then
            germanName = instrumentsGerman[index]
        end
    end

    local text = common.GetNLS(user, "Das Notenblatt enth�lt Noten f�r das "..germanName..".", "The sheet contains notes for the "..instrument..".")

    local dialog = SelectionDialog(common.GetNLS(user, "Notenblatt", "Music sheet"), text, callback)

    dialog:addOption(0, common.GetNLS(user, "Lied abspielen", "Play song"))
    dialog:addOption(0, common.GetNLS(user, "Noten anzeigen", "View notes"))
    dialog:addOption(0, common.GetNLS(user, "Mit anderen Musik machen", "Play Music With Others"))

    dialog:setCloseOnMove()

    user:requestSelectionDialog(dialog)

end

function M.UseItem(user, SourceItem,ltstate,checkVar)

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

    local instrument = SourceItem:getData("instrument")

    if not _G.playtogether then
        _G.playtogether = {}
    end

    if not common.IsNilOrEmpty(instrument) then
        if ltstate == Action.none then
            noteListView(user, ltstate, SourceItem, instrument)
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

            if instrument == "drum" then
                drum.playTheDrum(user, ltstate, false, SourceItem)
            else
                music.playTheInstrument(user, ltstate, false, SourceItem, instrument)
            end
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


---------------- ALCHEMY -------------------------------
--------------------------------------------------------

local function getText(user,deText,enText)
    return common.GetNLS(user,deText,enText)
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
    return alchemy.SplitData(user,user:getQuestProgress(860))
end

function GenerateStockDescription(user)

    local stockList = M.GetStockFromQueststatus(user)
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

function TaskToLearn(user)

    local callback = function(dialog) end

    local stockDe, stockEn = GenerateStockDescription(user)

    local textDE = "Die Zeilen auf dem Pergament sind verschwommen und scheinen sich st�ndig zu bewegen. Nur ein paar Zeilen, lassen sich lesen:\n\n\nNeugierig, was hier steht? Nun, dann fl��t euch das folgende Gebr�u ein und ich verrate euch das Geheimnis:\nEin Trank, der zum einen aus einem Essenzgebr�u auf Rubinstaubbasis (essenzierte Kr�uter: Wutbeere, Wutbeere, Regenkraut, Tagtraum, Fliegenpilz) besteht und zum anderen aus einem Sud mit folgenden Konzentrationen: " .. stockDe
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


    if alchemy.GetCauldronInfront(user) then
        -- The char wants to use the recipe infront of a cauldron.
        UseRecipe(user, SourceItem,ltstate,checkVar)
    else
        -- Not infront of a cauldron.
        ViewRecipe(user, SourceItem)
    end

end

function UseRecipe(user, SourceItem,ltstate,checkVar)


    -- is the char an alchemist?
    local anAlchemist = alchemy.CheckIfAlchemist(user)
    if not anAlchemist then
        user:inform("Nur jene, die in die Kunst der Alchemie eingef�hrt worden sind, k�nnen hier ihr Werk vollrichten.","Only those who have been introduced to the art of alchemy are able to work here.")
        return
    end

    -- proper attriutes?
    if ( user:increaseAttrib("perception",0) + user:increaseAttrib("essence",0) + user:increaseAttrib("intelligence",0) ) < 30 then
        user:inform("Verstand, ein gutes Auge und ein Gesp�r f�r die feinstofflichen Dinge - dir fehlt es daran, als dass du hier arbeiten k�nntest.",
                    "Mind, good eyes and a feeling for the world of fine matter - with your lack of those, you are unable to work here."
                    )
        return
    end

    -- let's start!
    StartBrewing(user, SourceItem,ltstate,checkVar)
end

function StartBrewing(user,SourceItem,ltstate,checkVar)
    local listOfTheIngredients = getIngredients(SourceItem)
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
                StartBrewing(user, SourceItem,ltstate,true)
            end
        end
        local dialog = SelectionDialog(getText(user,"Rezept","Recipe"), getText(user,"W�hle die Zutat aus, ab welcher das Rezept abgearbeitet werden soll.","Select the ingredient which you want to start to brew from."), callback)
        dialog:setCloseOnMove()
        if #listOfTheIngredients > 0 then
            local counter = 0
            for i=1,#listOfTheIngredients do
                counter = counter + 1
                if type(listOfTheIngredients[i])=="string" then
                    if string.find(listOfTheIngredients[i],"bottle") then
                        dialog:addOption(164, getText(user,counter..". Abf�llen",counter..". Bottling"))
                    elseif string.find(listOfTheIngredients[i],"jar") then
                        dialog:addOption(3642, getText(user, counter..". In einen Tiegel f�llen",counter..". Fill into jar"))
                    else
                        local liquid, liquidList = recipe_creation.StockEssenceList(listOfTheIngredients[i])
                        if liquid == "stock" then
                            dialog:addOption(331, getText(user,counter..". Sud",counter..". Stock"))
                        elseif liquid == "essence brew" then
                            dialog:addOption(liquidList[1], getText(user,counter..". Essenzgebr�u",counter..". Essence brew"))
                        end
                    end
                else
                    dialog:addOption(listOfTheIngredients[i], getText(user,counter..". "..world:getItemName(listOfTheIngredients[i],Player.german),counter..". "..world:getItemName(listOfTheIngredients[i],Player.english)))
                end
            end
            user:requestSelectionDialog(dialog)
            return
        end
    end

    local deleteItem, deleteId, missingDe, missingEn = GetItem(user, listOfTheIngredients)

    if missingDe then
        user:inform("Du brichst deine Arbeit vor dem "..USER_POSITION_LIST[user.id]..". Arbeitsschritt ab. "..missingDe, "You abort your work before the "..USER_POSITION_LIST[user.id]..". work step. "..missingEn)
        return
    end

    local duration,gfxId,gfxIntervall,sfxId,sfxIntervall = GetStartAction(user, listOfTheIngredients, cauldron)

    if (ltstate == Action.none) then

        user:startAction(duration,gfxId,gfxIntervall,sfxId,sfxIntervall);
        return

    end

    local brewResult = CallBrewFunctionAndDeleteItem(user,deleteItem, deleteId,cauldron)
    local toolbroken = shared.toolBreaks(user, tool, duration)

    -- repeat step if ilyn applied when bottling the cauldron content
    if not brewResult.repeatStep then
        USER_POSITION_LIST[user.id] = USER_POSITION_LIST[user.id]+1
    end

    if toolbroken and USER_POSITION_LIST[user.id] < #listOfTheIngredients then
        user:inform("Du brichst deine Arbeit vor dem "..USER_POSITION_LIST[user.id]..". Arbeitsschritt ab.", "You abort your work before the "..USER_POSITION_LIST[user.id]..". work step.")
        return
    end

    if alchemy.CheckExplosionAndCleanList(user) then
        if USER_POSITION_LIST[user.id] < #listOfTheIngredients then
            user:inform("Du brichst deine Arbeit vor dem "..USER_POSITION_LIST[user.id]..". Arbeitsschritt ab.", "You abort your work before the "..USER_POSITION_LIST[user.id]..". work step.")
        end
        return
    end

    if USER_POSITION_LIST[user.id] > #listOfTheIngredients then
        return
    else
        duration,gfxId,gfxIntervall,sfxId,sfxIntervall = GetStartAction(user, listOfTheIngredients, cauldron)
        user:startAction(duration,gfxId,gfxIntervall,sfxId,sfxIntervall);
    end

end

function CallBrewFunctionAndDeleteItem(user,deleteItem, deleteId,cauldron)

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
        if deleteItem.id == 164 then -- empty bottle
            local fillBottleResult = id_164_emptybottle.FillIntoBottle(user, deleteItem, cauldron)
            if fillBottleResult.ilynApplied then
                result.repeatStep = true
            end

        elseif deleteItem.id == 3642 then
            id_3642_empty_salve_jar.FillIntoJar(user, deleteItem, cauldron)

        elseif deleteItem.id == 331 then -- stock
            id_331_green_bottle.FillStockIn(user,deleteItem, cauldron)
            alchemy.EmptyBottle(user,deleteItem)

        elseif alchemy.CheckIfPotionBottle(deleteItem) then
            alchemy.FillIntoCauldron(user,deleteItem,cauldron)
        end
    end

    return result
end

function GetStartAction(user, listOfTheIngredients, cauldron)

    local ingredient = listOfTheIngredients[USER_POSITION_LIST[user.id]]
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

    local duration,gfxId,gfxIntervall,sfxId,sfxIntervall = alchemy.GetStartAction(user, theString, cauldron)
    return duration,gfxId,gfxIntervall,sfxId,sfxIntervall
end

function GetItem(user, listOfTheIngredients)
    local deleteItem, deleteId, missingDe, missingEn
    if type(listOfTheIngredients[USER_POSITION_LIST[user.id]])=="string" then
        if string.find(listOfTheIngredients[USER_POSITION_LIST[user.id]],"bottle") then
            local bottleList = user:getItemList(164)
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
        elseif string.find(listOfTheIngredients[USER_POSITION_LIST[user.id]],"jar") then
            local jarList = user:getItemList(3642)
            if #jarList > 0 then
                deleteItem = jarList[1]
                for i = 1, #jarList do
                    if not string.find(jarList[i]:getData("descriptionEn"), "Bottle label:") then
                        deleteItem = jarList[i]
                        break
                    end
                end
            end
            if not (deleteItem) then
                missingDe = "Dir fehlt: leerer Salbentiegel"
                missingEn = "You don't have: empty salve jar"
            end
        else
            local liquid, neededList = recipe_creation.StockEssenceList(listOfTheIngredients[USER_POSITION_LIST[user.id]])
            if liquid == "stock" then
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
            elseif liquid == "essence brew" then
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
                    missingDe = "Dir fehlt das entsprechende Essenzgebr�u."
                    missingEn = "Your don't have the proper essence brew."
                end
            end
        end
    else
        local data = {}
        if (user:countItemAt("all",listOfTheIngredients[USER_POSITION_LIST[user.id]],data) > 0) then
            deleteId = listOfTheIngredients[USER_POSITION_LIST[user.id]]
        end
        if not deleteId then
            missingDe = "Dir fehlt: "..world:getItemName(listOfTheIngredients[USER_POSITION_LIST[user.id]],Player.german)
            missingEn = "You don't have: "..world:getItemName(listOfTheIngredients[USER_POSITION_LIST[user.id]],Player.english)
        end
    end

    return deleteItem, deleteId, missingDe, missingEn
end

function ViewRecipe(user, SourceItem)
    local listOfTheIngredients = getIngredients(SourceItem)
    recipe_creation.ShowRecipe(user, listOfTheIngredients, true)
end

function getIngredients(SourceItem)

    local listOfTheIngredients = {}
    for i=1,60 do
        if SourceItem:getData("ingredient"..i) ~= "" then
            if tonumber(SourceItem:getData("ingredient"..i)) ~= nil then
                table.insert(listOfTheIngredients,tonumber(SourceItem:getData("ingredient"..i)))
            else
                table.insert(listOfTheIngredients,SourceItem:getData("ingredient"..i))
            end
        else
            break
        end
    end
    return listOfTheIngredients
end

---------------- ALCHEMY END ---------------------------
--------------------------------------------------------



function M.LookAtItem(user, parchment)

    if parchment:getData("bookList") == "true" then
        return bookListLookAt(user, parchment)
    end

    local lookAt = lookat.GenerateLookAt(user, parchment)

    if not common.IsNilOrEmpty(parchment:getData("instrument")) then
        lookAt.name = common.GetNLS(user, "Notenblatt", "Music Sheet")
        lookAt.description = common.GetNLS(user, "Das Pergament enth�lt Noten.","The parchment contains musical notes.")
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


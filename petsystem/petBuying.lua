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

local M = {}

local petScript = require("petsystem.pet")
local common = require("base.common")
local base = require("petsystem.base")
local money = require("base.money")

local buyAblePets = {

    {nameDe = "Gynkesischer Wachhund", 
    nameEn = "Gynkese Guard Dog",
    petId = petScript.gynkeseGuardDogMale,
    descriptionDe = "Ein treuer, gehorsamer Gefährte. Wenn sein Herrchen es befiehlt, greift er auch an.",
    descriptionEn = "A loyal, obedient companion. It will attack if it owners orders it to.",
    colour = colour(255, 255, 255),
    priceInGold = 75
    },
    
    {nameDe = "Firnismillhühnchen", 
    nameEn = "Firnismill Chicken",
    petId = petScript.firnisMillChicken,
    descriptionDe = "Ein Huhn mit großer Zuneigung zu seinem Besitzer. Es legt von Zeit zu Zeit auch ein Ei.",
    descriptionEn = "A chicken with a great affection for its owner. From time to time, it lays an egg.",
    colour = colour(255, 255, 255),
    priceInGold = 15
    }
}

local STAGE_1 = 1
local STAGE_2 = 2
local STAGE_3 = 3
local STAGE_4 = 4

function M.buyPet(user, selectionTracker)

    if base.isPetOwner(user) then
        user:inform("Du hast schon einen tierischen Begleiter.", "You already have an animal companion.")
        return
    end

    if not selectionTracker then
        selectionTracker = {stage = STAGE_1}
    end
    
    if selectionTracker.stage == STAGE_1 then -- Select an species
        
        local callback = function(dialog)
            local success = dialog:getSuccess()
            if success then
                M.buyPet(user, {stage = STAGE_2, selectedPet = dialog:getSelectedIndex()+1})
            end
        end
        
        local dialog = SelectionDialog(common.GetNLS(user, "Ein tierischer Begleiter", "An animal companion"), common.GetNLS(user, "Du siehst eine Liste mit verschiedenen Tieren. Blättere zu der angegeben Seite, um mehr über eines zu erfahren.", "You see a list with various animals. Turn to the specified page to learn more about them."), callback)
        
        for i, petTable in ipairs(buyAblePets) do
            dialog:addOption(0, common.GetNLS(user, petTable.nameDe, petTable.nameEn))
        end
        
        user:requestSelectionDialog(dialog)
    
    elseif selectionTracker.stage == STAGE_2 then -- Display information about selected species
    
        local callback = function(dialog)
            local success = dialog:getSuccess()
            if success then
                local selected = dialog:getSelectedIndex()+1
                if selected == 1 then
                    selectionTracker.stage = STAGE_3
                    M.buyPet(user, selectionTracker)
                elseif selected == 2 then
                    selectionTracker.stage = STAGE_1
                    selectionTracker.selectedPet = nil
                    M.buyPet(user, selectionTracker)
                end
            end
        end
        
        local petTable = buyAblePets[selectionTracker.selectedPet]
        
        local dialog = SelectionDialog(common.GetNLS(user, petTable.nameDe, petTable.nameEn), common.GetNLS(user, petTable.descriptionDe .. "\nPreis: " .. tostring(petTable.priceInGold) .. " Goldmünzen", petTable.descriptionEn .. "\nPrice: " .. tostring(petTable.priceInGold) .. " gold coins"), callback)
        
        dialog:addOption(0, common.GetNLS(user, "Das möchte ich haben.", "I want this one."))
        dialog:addOption(0, common.GetNLS(user, "Zurück zur Übersicht blättern", "Turn back to the overview."))
    
        user:requestSelectionDialog(dialog)
    
    elseif selectionTracker.stage == STAGE_3 then --Ask the player to input a name
    
        local callback = function(dialog)
            if dialog:getSuccess() then
                selectionTracker.petName = dialog:getInput()
                selectionTracker.stage = STAGE_4
                M.buyPet(user, selectionTracker)
            end
        end
        
        local dialog = InputDialog(common.GetNLS(user, "Gebe deinem tierischen Begleiter einen Namen", "Name your animal companion"), common.GetNLS(user, "Schreibe in das Buch den Namen, den du deinem neuen Freund geben möchtest.", "Write in the book the name you want to give to your new friend."), false, 12, callback)
    
        user:requestInputDialog(dialog)
    
    elseif selectionTracker.stage == STAGE_4 then --Let the player review his options; add pet if player is happy
    
        local callback = function(dialog)
            if dialog:getSuccess() then
                local selected = dialog:getSelectedIndex()+1
                if selected == 1 then
                    if money.CharHasMoney(user, buyAblePets[selectionTracker.selectedPet].priceInGold*10000) then
                        base.addNewPetToCharacter(user, {name = selectionTracker.petName, race = buyAblePets[selectionTracker.selectedPet].petId, colour = buyAblePets[selectionTracker.selectedPet].colour})
                        user:inform("Du hast ein Tier erhalten! Dazu erhälst du ein Pergament mit Hinweisen.", "You have an animal now! You also got a parchment with some information.")
                        common.CreateItem(user, 2745, 1, 999, {nameDe = "Hinweise", nameEn = "Information", petInformation = "true"})
                    else
                        user:inform("Dir fehlt das nötige Geld!", "You don't have enough money!")
                    end
                elseif selected == 2 then
                    M.buyPet(user, nil)
                end
            end
        end
        
        local dialog = SelectionDialog(common.GetNLS(user, "Ein tierischer Begleiter", "An animal companion"), common.GetNLS(user, "Folgendes ist deine Auswahl:\nArt: " .. buyAblePets[selectionTracker.selectedPet].nameDe .. "\nPreis: " .. buyAblePets[selectionTracker.selectedPet].priceInGold .."\nAusgewählter Name: " .. selectionTracker.petName, "This is your selection:\nType: " .. buyAblePets[selectionTracker.selectedPet].nameEn .. "\nPrice: " .. buyAblePets[selectionTracker.selectedPet].priceInGold .."\nChoosen name: " .. selectionTracker.petName), callback)
        
        dialog:addOption(0, common.GetNLS(user, "Ja, diesen tierischen Begleiter möchte ich.", "Yes, I want this animal companion.  "))
        dialog:addOption(0, common.GetNLS(user, "Nein, ich möchte doch was anderes.", "No, I want something else."))
        
        user:requestSelectionDialog(dialog)
    
    end

end


return M
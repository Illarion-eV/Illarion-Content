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

local base = require("petsystem.base")
local common = require("base.common")
local fightingutil = require("base.fightingutil")
local gems = require("base.gems")

local M = {}

local commandKeyWords = {
    [base.follow] = {"follow", "folg"},
    [base.heel] = {"heel", "bei fuß"},
    [base.down] = {"down", "sit", "sitz", "platz"},
    [base.nearBy] = {{"bleib", "n[äa]h"}, {"stay", "near"}},
    [base.stray] = {"stray", "streun", {"[lauf|geh]", "frei", "herum"}},
    [base.attack] = {"attack", "angriff", "fass", {"greif", "an"}}
}

local function extractCommand(text, monster)
    
    for i = 1, #commandKeyWords do
        for j = 1, #commandKeyWords[i] do
            local checkCommand = commandKeyWords[i][j]
            if type(checkCommand) == "string" then
                if string.find(text, checkCommand) then
                    return i
                end
            elseif type(checkCommand) == "table" then
                local foundCommand = true
                for k = 1, #checkCommand do
                    if not string.find(text, checkCommand[k]) then
                        foundCommand = false
                        break
                    end
                end
                if foundCommand and commandsForPets[monster:getMonsterType()][i] then
                    return i
                end
            end
        end
    end
    
    return false
end


function petMove(pet, owner)
    pet:move(owner:getFaceTo(), true)
end

local targetEnemy = {}

local function receiveText(pet, textType, text, speaker, downEmotes)

    if base.isPetOf(pet, speaker) then
        
        local text = string.lower(text)
        local petName = base.getPetName(speaker)

        if petName and string.find(text, string.lower(petName)) then
            local newCommand = extractCommand(text, pet)
            if newCommand then
                
                if newCommand == base.attack then
                    local selectedEnemyId = fightingutil.getSelectedEnemyId(speaker.id)
                    if selectedEnemyId then
                        targetEnemy[pet.id] = selectedEnemyId
                    end
                else
                    targetEnemy[pet.id] = nil --Every command but "attack" ends the attack mode
                    if newCommand == base.stray then
                        if pet:getOnRoute() then
                            pet:setOnRoute(false)
                            pet.waypoints:clear()
                        end
                    elseif newCommand == base.down then
                        local oldCommand = base.getCommand(speaker)
                        if oldCommand ~= newCommand then
                            pet:talk(Character.say, downEmotes.german, downEmotes.english)
                        end
                    end
                end
                
                base.saveCommand(speaker, newCommand)
            elseif string.find(text, "move") or string.find(text, "beweg") then
                petMove(pet, speaker)
            end
        end
    end
    
end

local function onDeath(pet)

    targetEnemy[pet.id] = nil
    
    local owner = base.getOwner(pet)
    if owner then
        base.savePetHitpoints(owner, 0)
        base.removeIsPetOf(pet)
        base.removePetByOwner(owner)
    
        if base.isPetProtectedFromDeath(owner) then
            owner:inform("Dein tierischer Begleiter hat seine Lebenskraft verloren. Doch eine warme, sanfte Stimme, die aus dir selbst zu kommen scheint, erinnert dich, Oldras Gnade für deinen Gefährten zu suchen.", "Your animal companion's life energy runs out, but a soft and warm voice, seemingly coming from somwhere within yourself, reminds you to search for Oldra's grace for your companion.", Player.highPriority)
        else
            owner:inform("Dein tierischer Begeleiter hat diese Welt für immer verlassen.", "Your animal companion left this world forever.", Player.highPriority)
            base.removeIsPetOwner(owner)
        end
    end
end

local function useMonster(pet, user)
    
    if base.isPetOf(pet, user) then
    
        local callback = function(dialog)
            local success = dialog:getSuccess()
            if success then
                local selected = dialog:getSelectedIndex()+1
                if selected == 1 then
                    
                    if base.isPetProtectedFromDeath(user) then
                        user:inform("Das Halsband deines tierischen Freundes beinhaltet schon drei latent magische Edelsteine", "The collar of you animal friend already contains three latent magical gems.", Player.highPriority)
                    else
                        local gemCounter = 0
                        local gemItems = {}
                        for i = Character.belt_pos_1, Character.belt_pos_6 do
                            local beltItem = user:getItemAt(i)
                            if gems.itemIsMagicGem(beltItem) and tonumber(beltItem:getData(gems.levelDataKey)) == 1 then
                                gemCounter = gemCounter + beltItem.number
                                table.insert(gemItems, beltItem)
                            end
                        end
                        gemCounter = math.min(gemCounter, 3)
                        
                        if gemCounter < 3 then
                            user:inform("Drei latent magische Edelsteine benötigst du, um deinen Begleiter vor dem Tod zu bewahren.", "Three latent magical gems does it take to save your companion from death.", Player.highPriority)
                        else
                            for _, theGem in pairs(gemItems) do
                                
                                local deleteAmount = math.min(gemCounter, theGem.number)
                                world:erase(theGem, deleteAmount)
                                gemCounter = gemCounter - deleteAmount
                                
                                if gemCounter <= 0 then
                                    break
                                end
                            end
                            base.setPetIsProtectedFromDeath(user)
                            user:inform("Dein Begleiter ist nun geschützt!","Your companion is now protected!")
                        end
                    end
                end
            end
        
        end
    
        local dialog = SelectionDialog(base.getPetName(user), common.GetNLS(user, "Du benötigst drei magische latente Steine in deinem Gürtel.", "You need to have three latent magic gems in your belt."), callback)
    
        dialog:addOption(0, common.GetNLS(user, "Halsband mit drei magischen Edelsteinen versehen", "Put three magical gems into the collar"))
        
        user:requestSelectionDialog(dialog)
    end

end

local function setTarget(pet, candidateList)

    local owner = base.getOwner(pet)
    
    local currentTargetOfPet -- The pet currently attacks this target
    local orderedTarget -- The pet was explicitly given the order to attack this target
    local currentTargetOfOwner -- The owner is currently attack thins target
    -- Target hierarchy: orderedTarget > currentTargetOfPet > currentTargetOfOwner
    
    if owner and base.getCommand(owner) == base.attack then
        for index, candidate in pairs(candidateList) do
            
            if candidate.id == targetEnemy[pet.id] then
                orderedTarget = index
                return orderedTarget
            
            elseif candidate.id == fightingutil.getSelectedEnemyId(pet.id) then
                currentTargetOfPet = index
                
            elseif candidate.id == fightingutil.getSelectedEnemyId(owner.id) then
                currentTargetOfOwner = index
                
            end
        end
    end
    
    if currentTargetOfPet then
        return currentTargetOfPet
    elseif currentTargetOfOwner then
        return currentTargetOfOwner
    end
    
    return 0
end

function M.generatePetEntryPoints(originalM)
    
    function originalM.onDeath(pet)
        onDeath(pet)
    end
    
    function originalM.setTarget(pet, candidateList)
        return setTarget(pet, candidateList)
    end
    
    function originalM.useMonster(pet, user)
        useMonster(pet, user)
    end
    
    function originalM.receiveText(pet, textType, text, speaker)
        receiveText(pet, textType, text, speaker, originalM.petProperties.downEmotes)
    end
    
    return originalM
end

return M
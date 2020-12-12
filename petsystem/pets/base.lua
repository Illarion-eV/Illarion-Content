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

local validCommandsForPets = {}

function M.registerPetCommands(petId, validCommands)
    validCommandsForPets[petId] = validCommands
end

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
                if foundCommand and validCommandsForPets[monster:getMonsterType()][i] then
                    return i
                end
            end
        end
    end
    
    return false
end


local function petMove(pet, owner)
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
    
        local petIsProtected, amountOfGemsInCollar = base.isPetProtectedFromDeath(user)
        amountOfGemsInCollar = amountOfGemsInCollar or 0
    
        local callback = function(dialog)
            local success = dialog:getSuccess()
            if success then
                local selected = dialog:getSelectedIndex()+1
                if selected == 1 then
                    
                    if petIsProtected and amountOfGemsInCollar == 3 then
                        user:inform("Das Halsband deines tierischen Freundes beinhaltet schon drei latent magische Edelsteine. Mehr kannst du nicht hinzufügen.", "The collar of you animal friend already contains three latent magical gems. You cannot add more.", Player.lowPriority)
                    else
                        
                        local levelOneGem
                        local leftHandItem = user:getItemAt(Character.left_tool)
                        if gems.itemIsMagicGem(leftHandItem) and gems.getGemLevel(leftHandItem) then
                            levelOneGem = leftHandItem
                        else
                            local rightHandItem = user:getItemAt(Character.right_tool)
                            if gems.itemIsMagicGem(rightHandItem) and gems.getGemLevel(rightHandItem) then
                                levelOneGem = rightHandItem
                            end
                        end
                        
                        if not levelOneGem then
                            user:inform("Du musst einen latent magischen Stein in der Hand haben, um ihn in das Halsband zu setzen.", "You need to hold a latent magic gem in your hand to put it into the collar.", Player.lowPriority)
                        else
                            user:inform("Du fügst dem Halsband ein Edelstein hinzu.", "You add a gem to the collar.", Player.lowPriority)
                            base.setPetIsProtectedFromDeath(user, amountOfGemsInCollar+1)
                            world:erase(levelOneGem, 1)
                        end
                    end
                end
            end
        
        end
    
        local dialog = SelectionDialog(base.getPetName(user), common.GetNLS(user, "Du kannst bis zu drei latent magische Steine am dem Halsband befestigen. Bisherherige Anzahl: " .. tostring(amountOfGemsInCollar), "You can put up to three latent magical gems into the collar. Current amount: " .. tostring(amountOfGemsInCollar)), callback)
    
        dialog:addOption(0, common.GetNLS(user, "Halsband mit einem magischen Edelsteinen versehen", "Put a magical gem into the collar"))
        
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
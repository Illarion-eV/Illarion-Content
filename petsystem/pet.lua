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

local M = {}

local commandKeyWords = {
    [base.follow] = {"follow", "folg"},
    [base.heel] = {"heel", "bei fuﬂ"},
    [base.down] = {"down", "sit", "sitz", "platz"},
    [base.nearBy] = {{"bleib", "n[‰a]h"}, {"stay", "near"}},
    [base.stray] = {"stray", "streun", {"[lauf|geh]", "frei", "herum"}},
    [base.attack] = {"attack", "angriff", "fass", {"greif", "an"}}
}

local downEmotes = {}
local alreadyDownEmotes = {}
M.tooFarAwayCry = {}

local function registerNewPet(settings)
    downEmotes[settings.monsterId] = settings.downEmotes
    alreadyDownEmotes[settings.monsterId] = settings.alreadyDownEmotes
    M.tooFarAwayCry[settings.monsterId] = settings.tooFarAwayCry
end

local dogMale = 581
local dogFemale = 1234

registerNewPet{
    monsterId = dogMale,
    downEmotes = {english = "#me sits on the ground and stretches out his fore-paws.", german =  "#me setzt sich auf den Boden und streck die Vorderpfoten aus."},
    alreadyDownEmotes = {english = "#me looks confused.", german = "#me schaut verwirrt."},
    tooFarAwayCry = {english = "Arrooooooo!", german =  "Arrooooooo!"}
}

local function extractCommand(text)
    
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
                if foundCommand then
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

function M.receiveText(monster, textType, text, speaker)

    if base.isPetOf(monster, speaker) then
        
        local text = string.lower(text)
        local petName = base.getPetName(speaker)

        if petName and string.find(text, string.lower(petName)) then
            local newCommand = extractCommand(text, speaker)
            if newCommand then
                
                if newCommand == base.stray then
                    if pet:getOnRoute() then
                        pet:setOnRoute(false)
                        pet.waypoints:clear()
                    end
                elseif newCommand == base.down then
                    local oldCommand = base.getCommand(speaker)
                    local monsterType = monster:getMonsterType()
                    if oldCommand == newCommand then
                        monster:talk(Character.say, alreadyDownEmotes[monsterType].german, alreadyDownEmotes[monsterType].english)
                    else
                        monster:talk(Character.say, downEmotes[monsterType].german, downEmotes[monsterType].english)
                    end
                end
                
                base.saveCommand(speaker, newCommand)
            elseif string.find(text, "move") or string.find(text, "beweg") then
                petMove(monster, speaker)
            end
        end
    end
    
end

function M.onDeath(pet)
    
    local owner = base.getOwner(pet)
    if owner then
        base.savePetHitpoints(owner, 0)
        base.removeIsPetOf(pet)
        base.removePetByOwner(owner)
    end
end

return M
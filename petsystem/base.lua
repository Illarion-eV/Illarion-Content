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

local M = {}

M.follow = 1
M.heel = 2
M.down = 3
M.nearBy = 4
M.stray = 5
M.attack = 6
M.move = 7

function M.getOwner(pet)
    
    for _, player in pairs(world:getPlayersOnline()) do
    
        if M.isPetOf(pet, player) then
            return player
        end
    
    end
    return false
end


local function savePetName(owner, name)
    
    for queststatus = 364, 366 do
        local progress = 0
        for i = 1, 4 do
            local numerical = string.byte(string.sub(name, i+4*(queststatus-364), i+4*(queststatus-364)))
            if numerical then
                progress = bit32.replace(progress, numerical, i*8-8, 8)
            else
                return
            end
        end
        owner:setQuestProgress(queststatus, progress)
    end
    
end

function M.getPetName(owner)
    
    local name = ""
    for queststatus = 364, 366 do
        for i = 1, 4 do
            local extracted = bit32.extract(owner:getQuestProgress(queststatus), i*8-8, 8)
            if extracted ~= 0 then
                name = name .. string.char(extracted)
            end
        end
    end
    return name
    
end

function M.saveCommand(owner, command)
    owner:setQuestProgress(373, command)
end

function M.getCommand(owner)
    return owner:getQuestProgress(373)
end


local function savePetRace(owner, race)
    owner:setQuestProgress(360, race)
end

local function getPetRace(owner)
    return owner:getQuestProgress(360)
end


local function savePetColour(owner, colourStruct)
    owner:setQuestProgress(367, colourStruct.red)
    owner:setQuestProgress(368, colourStruct.green)
    owner:setQuestProgress(369, colourStruct.blue)
    owner:setQuestProgress(370, colourStruct.alpha)
end

local function getPetColour(owner)

    local r = owner:getQuestProgress(367)
    local g = owner:getQuestProgress(368)
    local b = owner:getQuestProgress(369)
    local alpha = owner:getQuestProgress(370)
    
    return colour(r, g, b, alpha)
end

local function savePetSex(owner, sex) -- Not used! Different sexes are handled as difference races.
    owner:setQuestProgress(371, sex)
end

local function getPetSex(owner) -- Not used! Different sexes are handled as difference races.
    return owner:getQuestProgress(371)
end

function M.savePetPosition(owner, thePosition)
    local x = thePosition.x
    local y = thePosition.y
    local z = thePosition.z
    
    local setMinusSign = function(coordinate)
        if coordinate < 0 then
            return coordinate*-10+1
        else
            return coordinate*10
        end
    end
    
    local x = setMinusSign(x)
    local y = setMinusSign(y)
    local z = setMinusSign(z)
    
    owner:setQuestProgress(361, x)
    owner:setQuestProgress(362, y)
    owner:setQuestProgress(363, z)
end

local function getPetPosition(owner)


    local checkMinusSign = function(coordinate)
        if coordinate%10 == 1 then
            return coordinate/10*-1
        else
            return coordinate/10
        end
    end
    
    return position(checkMinusSign(owner:getQuestProgress(361)), checkMinusSign(owner:getQuestProgress(362)), checkMinusSign(owner:getQuestProgress(363)))

end

function M.savePetHitpoints(owner, hitpoints)
    owner:setQuestProgress(372, hitpoints)
end

local function getPetHitpoints(owner)
    return owner:getQuestProgress(372)
end

local ownerIDsByPetIDs = {}

local function setIsPetOf(pet, owner)
    if not ownerIDsByPetIDs[pet.id] then
        ownerIDsByPetIDs[pet.id] = {}
    end
    
    ownerIDsByPetIDs[pet.id].ownerId = owner.id

end

function M.removeIsPetOf(pet)
    ownerIDsByPetIDs[pet.id] = nil
end

function M.isPetOf(monster, character)
    if ownerIDsByPetIDs[monster.id] then
        return ownerIDsByPetIDs[monster.id].ownerId == character.id
    end
    
    return false
end

local petsByOwnerId = {}

local function getPetByOwner(owner)
    for ownerId, pet in pairs(petsByOwnerId) do
        if ownerId == owner.id then
            return pet
        end
    end
    return false
end

local function setPetByOwner(pet, owner)
    petsByOwnerId[owner.id] = pet
end

function M.removePetByOwner(owner)
    petsByOwnerId[owner.id] = nil
end

function M.loadPet(owner)
    
    local petHP = getPetHitpoints(owner)
    if petHP > 0 then

        local pet = world:createMonster(getPetRace(owner), getPetPosition(owner), 0)
        pet:setSkinColour(getPetColour(owner))
        setIsPetOf(pet, owner)
        pet:setAttrib("hitpoints", petHP)
        setPetByOwner(pet, owner)
        pet.effects:addEffect(LongTimeEffect(3, 1))
        
    end
end

function M.logOutPet(owner)
    local pet = getPetByOwner(owner)
    if pet then
        local petHP = pet:increaseAttrib("hitpoints", 0)
        if petHP > 0 then
            pet:increaseAttrib("hitpoints", -10000)
        end
    end
end

function M.addNewPetToCharacter(character, petValues)

    savePetName(character, petValues.name)
    savePetRace(character, petValues.race)
    savePetColour(character, petValues.colour)
    M.savePetPosition(character, common.getFreePos(character.pos, 1))
    M.savePetHitpoints(character, 10000)
    M.saveCommand(character, M.follow)
    
    M.loadPet(character)
end

function M.testFunction(character)

    character:setQuestProgress(364, 0)
    character:setQuestProgress(365, 0)
    character:setQuestProgress(366, 0)
    
    local petValues = {}
    petValues.name = "wauw"
    petValues.colour = colour(34, 111, 222, 255)
    petValues.race = 581
    M.addNewPetToCharacter(character, petValues)
    

end

return M
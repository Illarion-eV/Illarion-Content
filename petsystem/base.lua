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

function M.setIsPetOwner(character)
	character:setQuestProgress(375, 1)
end

function M.isPetOwner(character)
	if character:setQuestProgress(375) > 0 then
		return true
	end
	return false
end

function M.removeIsPetOwner(character)
	character:setQuestProgress(375, 0)
end

function M.getOwner(pet)
    
    for _, player in pairs(world:getPlayersOnline()) do
    
        if M.isPetOf(pet, player) then
            return player
        end
    
    end
    return false
end


function M.savePetName(owner, name)
    
    for queststatus = 371, 374 do
        local progress = 0
        for i = 1, 4 do
            local numerical = string.byte(string.sub(name, i+4*(queststatus-371), i+4*(queststatus-371)))
            if numerical then
                progress = bit32.replace(progress, numerical, i*8-8, 8)
            else
                break
            end
        end
        owner:setQuestProgress(queststatus, progress)
    end
    
end

function M.getPetName(owner)
    
    local name = ""
    for queststatus = 371, 374 do
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
    owner:setQuestProgress(366, command)
end

function M.getCommand(owner)
    return owner:getQuestProgress(366)
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
    owner:setQuestProgress(364, sex)
end

local function getPetSex(owner) -- Not used! Different sexes are handled as difference races.
    return owner:getQuestProgress(364)
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
    owner:setQuestProgress(365, hitpoints)
end

function M.getPetHitpoints(owner)
    return owner:getQuestProgress(365)
end

function M.setPetIsProtectedFromDeath(owner)
	owner:setQuestProgress(376, 1)
end

function M.isPetProtectedFromDeath(user)
	if user:getQuestProgress(376) > 0 then
		return true
	else
		return false
	end
end

function M.removeIsPetProtectedFromDeath(user)
	owner:setQuestProgress(376, 0)
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
    local petHP = M.getPetHitpoints(owner)
    if petHP > 0 then
		local createPosition = getPetPosition(owner)
		world:gfx(31,createPosition)
		local pet = world:createMonster(getPetRace(owner), createPosition, 0)
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
		world:gfx(31,pet.pos)
		
		M.removeIsPetOf(pet)
        M.removePetByOwner(owner)
		
		local petHP = pet:increaseAttrib("hitpoints", 0)
        if petHP > 0 then
            pet:increaseAttrib("hitpoints", -10000)
        end
    end
end

function M.addNewPetToCharacter(character, petValues)

    M.savePetName(character, petValues.name)
    savePetRace(character, petValues.race)
    savePetColour(character, petValues.colour)
    M.savePetPosition(character, common.getFreePos(character.pos, 1))
    M.savePetHitpoints(character, 10000)
    M.saveCommand(character, M.follow)
	M.setIsPetOwner(character)
    
    M.loadPet(character)
end

return M
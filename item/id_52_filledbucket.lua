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
-- fill cauldron
-- large empty bottle (2498) --> blue potion (2496) aka bottle with water
-- extinguish forge (2835) --> (2836)
-- extinguish fire
-- pour on character
-- UPDATE items SET itm_script='item.id_52_filledbucket' WHERE itm_id IN (52);

local common = require("base.common")
local alchemy = require("alchemy.base.alchemy")
local licence = require("base.licence")
local areas = require("content.areas")
local triggerfield = require("triggerfield.base.triggerfield")
local woodchopping = require("craft.gathering.woodchopping")

local M = {}

local GetCauldron
local WaterIntoCauldron
local CreateEmptyBucket
local PourOnCharacter
local getDragoncaveBush
local plantTree

function M.UseItem(User, SourceItem, ltstate)

    -- item should not be static
    if SourceItem.wear == 255 then
        common.HighInformNLS(User,
            "Das kannst du nicht benutzen.",
            "You can't use that.")
        return
    end

    if plantTree(User, SourceItem, ltstate) then
        return
    end

  -- look for cauldron
  local TargetItem = GetCauldron(User)
  if (TargetItem ~= nil) then
    common.TurnTo( User, TargetItem.pos ) -- turn if necessary
    WaterIntoCauldron(User,SourceItem,TargetItem,ltstate)
    return
  end

    -- look for Dragoncave bush
    TargetItem = getDragoncaveBush(User)
    if TargetItem ~= nil then
        if SourceItem:getData("dragoncaveBucket") == "true" then
            local serverTime = world:getTime("unix")
            local trippingTime = TargetItem:getData("tripping_time")

            if (trippingTime ~= "" and ((tonumber(trippingTime) + 5 * 60 * 60) > serverTime)) then -- 5 hours cooldown
                common.InformNLS(User,
                    "Der Baum saugt das Wasser auf, allerdings scheint er schon vollständig genährt.",
                    "The tree soaks up the water, but seems to be already fully nourished.")
            else
                TargetItem:setData("tripping_time", serverTime)
                world:changeItem(TargetItem)
                for _ = 1, 11 do
                    local dropPos = common.getFreePos(TargetItem.pos, 10)
                    world:createItemFromId(80, math.random(5,10), dropPos, true, 333, nil)
                    world:gfx(46, dropPos) -- light
                end

                common.InformNLS(User,
                    "Der Baum wächst und gedeiht, als ob er von den Nährstoffe des vulcanischen Quellwassers genährt wird. Vor deinen Augen wachsen Bananen.",
                    "The tree flourishes as it is nourished with the nutrients from the vulcanic spring water and seems to grow and sprout bananas before your eyes.")
            end
            common.TurnTo(User, TargetItem.pos) -- turn if necessary
            world:gfx(11, TargetItem.pos)
            CreateEmptyBucket(User, SourceItem, true)
            return
        end
    end

  -- look for forge
  TargetItem = common.GetItemInArea(User.pos, 2835, 1, true)
  if (TargetItem ~= nil) then
    world:makeSound(9, TargetItem.pos)
    world:swap(TargetItem, 2836, 333)
    common.InformNLS(User,
    "Du löschst das Feuer in der Esse.",
    "You extinguish the fire in the forge.")
    world:gfx(11,TargetItem.pos)
    CreateEmptyBucket(User, SourceItem)
    return
  end

  -- look for fire
  local FireItem, bool = common.GetItemInArea(User.pos, 12, 1, true)
  if FireItem == nil then
        FireItem, bool = common.GetItemInArea(User.pos, 359, 1, true)
  end

  if (FireItem ~= nil) then
    common.TurnTo( User, FireItem.pos ) -- turn if necessary
    -- TODO is a noobia check needed?
    -- Don't extinguish static fires.
    world:makeSound(9, FireItem.pos)
    if (FireItem.wear == 255) then
      common.InformNLS(User,
      "Das Wasser verdampft in dem Feuer ohne es zu löschen.",
      "The water vaporises in the fire but it does not extinguish it.")
    else
      local frontitem = common.GetFrontItem(User)
      if frontitem~=nil then
        world:erase(frontitem,frontitem.number)
        common.InformNLS(User,
            "Du löschst das Feuer.",
            "You extinguish the fire.")
      end
    end
    world:gfx(11,FireItem.pos)
    CreateEmptyBucket(User, SourceItem)
    return
  end

  -- pour water on character. Either on the one in front or on the User himself.
  local TargetChar = common.GetFrontCharacter(User)
  if (TargetChar ~= nil) then
    -- is this really a player?
    local players = world:getPlayersInRangeOf(TargetChar.pos, 0)
    for _,p in pairs(players) do
      if (p.id == TargetChar.id) then
        common.InformNLS(User,
        "Du schüttest das Wasser über die Person vor dir.",
        "You pour the water on the person in front of you.")
        PourOnCharacter(TargetChar, SourceItem)
        world:gfx(11,TargetChar.pos)
        CreateEmptyBucket(User, SourceItem, true)
        return
      end
    end
  end
  -- nothing; we empty all buckets
  CreateEmptyBucket(User, SourceItem)
end

function PourOnCharacter(TargetCharacter, SourceItem)
  world:makeSound( 9, TargetCharacter.pos )
  common.InformNLS(TargetCharacter,
  "Du fühlst dich gleich viel sauberer.",
  "You feel much cleaner.")
end

function WaterIntoCauldron(User,SourceItem,TargetItem,ltstate)
    local cauldron = TargetItem

    -- is the char an alchemist?
    local anAlchemist = alchemy.CheckIfAlchemist(User)
    if not anAlchemist then
        User:inform("Nur jene, die in die Kunst der Alchemie eingeführt worden sind, können hier ihr Werk vollrichten.","Only those who have been introduced to the art of alchemy are able to work here.")
        return
    end

    if licence.licence(User) then --checks if user is citizen or has a licence
        return -- avoids crafting if user is neither citizen nor has a licence
    end

    if ( ltstate == Action.abort ) then
       common.InformNLS(User, "Du brichst deine Arbeit ab.", "You abort your work.")
       return
    end

    if ( ltstate == Action.none ) then
        local duration,gfxId,gfxIntervall,sfxId,sfxIntervall = alchemy.GetStartAction(User, "water", cauldron)
        User:startAction( duration,gfxId,gfxIntervall,sfxId,sfxIntervall)
        return
    end

    -- the actual filling needs to be in an seperate function, since this function is also called by other script, where we do not need ltstate!
    M.FillIn(User, SourceItem, cauldron)
end


function M.FillIn(User, SourceItem, cauldron, noRepeat) -- do not remove noRepeat

   -- water, essence brew, potion or stock is in the cauldron; leads to a failure
    if cauldron:getData("filledWith") == "water" then
        common.InformNLS( User,
                "Der Kessel läuft über. Offensichtlich war schon Wasser in ihm.",
                "The water runs over. Obviously, there was already water in it.")
        world:makeSound(9,cauldron.pos)
        world:gfx(11,cauldron.pos)
        noRepeat = true -- let cauldron only run over once

    elseif cauldron:getData("filledWith") == "essenceBrew" then
        world:gfx(1,cauldron.pos)
        common.InformNLS(User, "Der Inhalt des Kessels verpufft, als du das Wasser hinzu tust.",
                                    "The substance in the cauldron blows out, as you fill the water in.")
        alchemy.RemoveAll(cauldron)

    elseif cauldron:getData("filledWith") == "potion" then
        alchemy.RemoveAll(cauldron)
        if cauldron.id == 1013 then
            world:makeSound(10,cauldron.pos)
            cauldron:setData("filledWith","water")
        else
            common.InformNLS(User, "Der Inhalt des Kessels verpufft, als du das Wasser hinzu tust.",
                                        "The substance in the cauldron blows out, as you fill the water in.")
        end
        world:gfx(1,cauldron.pos)

    elseif cauldron:getData("filledWith") == "stock" then
        world:gfx(1,cauldron.pos)
        common.InformNLS(User, "Der Inhalt des Kessels verpufft, als du das Wasser hinzu tust.",
                                    "The substance in the cauldron blows out, as you fill the water in.")
        alchemy.RemoveAll(cauldron)

    else -- nothing in the cauldron, we just fill in the water
        world:makeSound(10,cauldron.pos)
        cauldron:setData("filledWith","water")
        cauldron.id = 1010
        noRepeat = true -- only once, dont let cauldron run over
    end
    CreateEmptyBucket(User, SourceItem, noRepeat)
    world:changeItem(cauldron)

end

function CreateEmptyBucket(User, SourceItem, noRepeat) -- do not remove noRepeat
    local created = common.CreateItem(User, 51, 1, 333, nil)
    if not created then -- too many items -> character can't carry anymore
        world:erase(SourceItem,1)
        return
    else -- character can still carry something
        if SourceItem.number == 1 then
            world:erase(SourceItem,1)
            return
        else
            world:erase(SourceItem,1)
            if noRepeat == nil then
                SourceItem.number = SourceItem.number-1
                world:changeItem(SourceItem)
                User:changeSource(SourceItem)
                User:startAction( 20, 21, 5, 10, 25)
            end
        end
    end
end

function GetCauldron(User)
  -- first check in front
  local frontPos = common.GetFrontPosition(User)
  if (world:isItemOnField(frontPos)) then
    local item = world:getItemOnField(frontPos)
    if (item.id > 1007 and item.id < 1019) then
      return item
    end
  end
  local Radius = 1
  for x=-Radius,Radius do
    for y=-Radius,Radius do
      local targetPos = position(User.pos.x + x, User.pos.y + y, User.pos.z)
      if (world:isItemOnField(targetPos)) then
        local item = world:getItemOnField(targetPos)
        if (item.id > 1007 and item.id < 1019) then
          return item
        end
      end
    end
  end
  return nil
end

function getDragoncaveBush(User)
    local Radius = 1
    for  x= -Radius, Radius do
        for y = -Radius, Radius do
            local targetPos = position(User.pos.x + x, User.pos.y + y, User.pos.z)
            if (world:isItemOnField(targetPos)) then
                local item = world:getItemOnField(targetPos)
                if (item.id == 3866 and item:getData("dragoncaveBush") == "true") then
                    return item
                end
            end
        end
    end
    return nil
end

local grass = common.GroundType.grass
local forest = common.GroundType.forest

local seedList = {
[15] = {seedlingId = 139, allowedTiles = {[grass] = true}, shadowTiles = {{x = 0, y = -2}, {x = 1, y = -1}, {x = 1, y = -2}, {x = 1, y = -3}, {x = 2, y = -1}, {x = 2, y = -2}, {x = 2, y = -3}, {x = 2, y = -4}, {x = 3, y = -1}, {x = 3, y = -2}, {x = 3, y = -3}, {x = 3, y = -4}, {x = 3, y = -5}, {x = 4, y = -3}, {x = 4, y = -4}, {x = 4, y = -5}, {x = 5, y = -4}, {x = 5, y = 5}}},
[302] = {seedlingId = 132, allowedTiles = {[grass] = true}, shadowTiles = {{x = 0, y = -2}, {x = 1, y = -1}, {x = 1, y = -2}, {x = 1, y = -3}, {x = 2, y = -1}, {x = 2, y = -2}, {x = 2, y = -3}, {x = 2, y = -4}, {x = 3, y = -1}, {x = 3, y = -2}, {x = 3, y = -3}, {x = 3, y = -4}, {x = 3, y = -5}, {x = 4, y = -3}, {x = 4, y = -4}, {x = 4, y = -5}, {x = 5, y = -4}, {x = 5, y = -5}}},
[1207] = {seedlingId = 1187, allowedTiles = {[grass] = true}, shadowTiles = {{x = 0, y = -2}, {x = 1, y = -1}, {x = 1, y = -2}, {x = 1, y = -3}, {x = 2, y = -1}, {x = 2, y = -2}, {x = 2, y = -3}, {x = 2, y = -4}, {x = 3, y = -1}, {x = 3, y = -2}, {x = 3, y = -3}, {x = 3, y = -4}, {x = 3, y = -5}, {x = 4, y = -3}, {x = 4, y = -4}, {x = 4, y = -5}, {x = 5, y = -4}, {x = 5, y = -5}}},
[149] = {seedlingId = 150, allowedTiles = {[forest] = true}, shadowTiles = {{x = 0, y = -1}, {x = 1, y = 0}, {x = 1, y = -1}, {x = 1, y = -2}, {x = 2, y = -1}, {x = 2, y = -2}, {x = 2, y = -3}, {x = 3, y = -4}}}
}

local noTreePlantingAreas = {
"Galmair", "Runewick", "Pauldron", "CadomyrAndDesert"
}

local playersWithValidPosition = {}

local function isTreePlantableHere(seed)

    if seed.pos.z ~= 0 then
        return false, "In diesem Gebiet ist der Boden nicht geeignet, um Bäume zu pflanzen.", "In this area, the ground is not suitable for planting trees."
    end

    -- Exclude triggerfields
    if triggerfield.isTriggerfield(seed.pos) then
        return false, "Hier ist der Boden nicht geeignet, um Bäume zu pflanzen.", "The ground is not suitable for planting trees here."
    end

    local theField = world:getField(seed.pos)

    -- No stack
    if theField:countItems() > 1 then
        return false, "Hier ist der Boden nicht geeignet, um Bäume zu pflanzen.", "The ground is not suitable for planting trees here."
    end

    -- Proper tile?
    if not seedList[seed.id].allowedTiles[common.GetGroundType(theField:tile())] then
        return false, "Hier ist der Boden nicht geeignet, um Bäume zu pflanzen.", "The ground is not suitable for planting trees here."
    end

    -- Some areas don't allow planting
    for _, areaName in pairs(noTreePlantingAreas) do
        if areas.PointInArea(seed.pos, areaName) then
            return false, "In diesem Gebiet ist der Boden nicht geeignet, um Bäume zu pflanzen.", "In this area, the ground is not suitable for planting trees."
        end
    end

    local unblockableItemsAllowed = 3
    local unblockableItemsFound = 0
    for i = -2, 2 do
        for j = -2, 2 do
            local currentPosition = position(seed.pos.x+i, seed.pos.y+j, seed.pos.z)
            if world:isItemOnField(currentPosition) or world:isCharacterOnField(currentPosition) then

                local checkItem = world:getItemOnField(currentPosition)

                -- Normal map tree in a distance of 2 fields?
                if woodchopping.isTree(checkItem.id) then
                    return false, "Hier ist zu viel Schatten. Pflanze nicht so nah zu anderen Bäumen.", "There is too much shadow on this spot. Don't plant so close to other trees."
                end

                -- Check for items right next to the planintg spot
                -- 3 unblocking items are allowed
                -- No blocking item is allowed (= item on an unpassable field, includes e.g. flowers on water)
                if math.abs(i) < 2 and math.abs(j) < 2 and (math.abs(i) > 0 or math.abs(j) > 0) then
                    if not (world:getField(currentPosition)):isPassable() then
                        return false, "Die Wurzeln des Baumes könnten sich hier nicht richtig ausbreiten. Eines der Dinge um diesen Fleck herum, nimmt zu viel Raum ein.", "The roots of a tree couldn't spread properly in this spot. Some of the things around this spot take too much room."
                    else
                        unblockableItemsFound = unblockableItemsFound + 1
                        if unblockableItemsFound > unblockableItemsAllowed then
                            return false, "Die Wurzeln des Baumes könnten sich hier nicht richtig ausbreiten. Es sind zu viele Dinge um diesen Fleck herum.", "The roots of a tree couldn't spread properly in this spot. There are too many things next to this spot."
                        end
                    end
                end

                -- Tree shadow must not block markerstones or NPCs
                local checkCharacter
                if world:isCharacterOnField(currentPosition) then
                    checkCharacter = world:getCharacterOnField(currentPosition)
                end

                if checkItem.id == 66 or (checkCharacter and checkCharacter:getType() == Character.npc) then
                    local inShadow = false
                    for _, shadowTiles in pairs(seedList[seed.id].shadowTiles) do
                        if currentPosition == position(seed.pos.x + shadowTiles.x, seed.pos.y + shadowTiles.y, seed.pos.z) then
                            return false, "Der Boden hier ist zu sehr beansprucht, um etwas zu pflanzen.", "The ground here is too worn out to support the grow of a new tree."
                        end
                    end
                end
            end
        end
    end

    return true
end

function plantTree(user, sourceItem, ltstate)

    if ltstate == Action.abort then
        playersWithValidPosition[user.id] = nil
        return true
    end

    -- No fruit there
    local frontItem = common.GetFrontItem(user)
    if not frontItem or not seedList[frontItem.id] then
        return false
    end

    if frontItem.number > 1 then
        user:inform("Du kannst nur einen Baum aufeinmal anpflanzen.","You can just plant one tree at a time.")
        return true
    end

    local isValidPosition, failMessageDe, failMessageEn
    -- Check if we already checked the position, otherwise perform necessary checks
    if playersWithValidPosition[user.id] then
        isValidPosition = true
    else
        isValidPosition, failMessageDe, failMessageEn = isTreePlantableHere(frontItem)
    end

    if not isValidPosition then
        user:inform(failMessageDe, failMessageEn)
    else
        if ltstate == Action.success then
            world:makeSound(9, frontItem.pos)
            world:gfx(11, frontItem.pos)
            user:eraseItem(52, 1)
            if Random.uniform(1, 25) == 1 then
                user:inform("Der Eimer geht zu Bruch.", "The bucket breaks.", Character.highPriority)
            else
                common.CreateItem(user, 51, 1, 333, nil)
            end

            local skillLevel = user:getSkill(Character.husbandry)
            if Random.uniform(1, 100) <= common.Scale(20, 85, skillLevel) then
                world:erase(frontItem, frontItem.number)
                local seedling = world:createItemFromId(seedList[frontItem.id].seedlingId, 1, frontItem.pos, true, 333, nil)
                seedling.wear = Random.uniform(10, 30)
                seedling:setData("playerPlanted", user.name)
                world:changeItem(seedling)
                playersWithValidPosition[user.id] = nil
            else
                if user:countItem(52) < 1 then
                    user:inform("Du hast keine Wassereimer mehr.", "You don't have any buckets filled with water left", Character.highPriority)
                else
                    user:changeSource(sourceItem)
                    user:startAction(40, 21, 5, 0, 0)
                end
            end
        elseif ltstate == Action.none then
            user:startAction(40, 21, 5, 0, 0)
            playersWithValidPosition[user.id] = true
        end
        user:learn(Character.husbandry, 40, 100)
    end

    return true
end

return M

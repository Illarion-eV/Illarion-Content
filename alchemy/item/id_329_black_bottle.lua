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
-- UPDATE common SET com_script='alchemy.item.id_329_black_bottle' WHERE com_itemid = 329;

-- Black Potions
-- Shapeshift into other races, or monsters ("Transformation potions")

local common = require("base.common")
local alchemy = require("alchemy.base.alchemy")
local lookat = require("base.lookat")
local customPotion = require("alchemy.base.customPotion")
local scheduledFunction = require("scheduled.scheduledFunction")

local M = {}


--lists for HUMANS, DWARVES, HALFLINGS, ELVES, ORCS and LIZARDS
-- apperance lists with the different values for the six races
-- 0 = human; 1 = dwarf; 2 = halfling; 3 = elf; 4 = orc; 5 = lizard
-- the colour sets are seperated by ; while the three values of each set are seperated by ,
local ListSkinColor = {}
ListSkinColor[0] = {246, 218, 181;243, 185, 111; 210, 146, 110;172, 116, 59;69, 42, 21;250, 199, 168}
ListSkinColor[1] = {246, 218, 181;243, 185, 111; 210, 146, 110;172, 116, 59;69, 42, 21;250, 199, 168}
ListSkinColor[2] = {246, 218, 181;243, 185, 111; 210, 146, 110;172, 116, 59;69, 42, 21;250, 199, 168}
ListSkinColor[3] = {227, 217, 213;239, 188, 137;215, 172, 134;188, 124, 95;196, 197, 157;221, 181, 145}
ListSkinColor[4] = {139, 123, 63;84, 134, 37;99, 132, 53;169, 144, 51;125, 92, 49;84, 101, 56}
ListSkinColor[5] = {104, 128, 52;235, 173, 0;159, 59, 59;82, 181, 138;21, 53, 91;184, 135, 214}

local ListHairColor = {}
ListHairColor[0] = {255, 249, 7;162, 77, 0;95, 23, 0;216, 216, 216;39, 39, 39;119, 56, 3}
ListHairColor[1] = {255, 249, 7;162, 77, 0;95, 23, 0;216, 216, 216;39, 39, 39;119, 56, 3}
ListHairColor[2] = {255, 249, 7;162, 77, 0;95, 23, 0;216, 216, 216;39, 39, 39;119, 56, 3}
ListHairColor[3] = {255, 249, 7;104, 128, 52;108, 64, 35;108, 62, 46;216, 216, 216;21, 53, 91}
ListHairColor[4] = {162, 76, 0;116, 1, 4;139, 123, 61;39, 39, 39;166, 166, 166;58, 28, 4}
ListHairColor[5] = {239, 231, 0;154, 0, 0;72, 36, 0;28, 26, 48;44, 115, 133;96, 153, 46}

local ListBeard = {}
ListBeard[0] = {0,1,3,4,5,6}
ListBeard[1] = {1,2,4}
ListBeard[2] = {0}
ListBeard[3] = {0}
ListBeard[4] = {0}
ListBeard[5] = {0}

local ListHairMale = {}
ListHairMale[0] = {0,1,2,3}
ListHairMale[1] = {0,1,2,3}
ListHairMale[2] = {0,1,2}
ListHairMale[3] = {1,2}
ListHairMale[4] = {0,1,2,3,4,5}
ListHairMale[5] = {1,2,3,4,5,6}

local ListHairFemale = {}
ListHairFemale[0] = {1,7,8}
ListHairFemale[1] = {1,7,9}
ListHairFemale[2] = {1,2,9}
ListHairFemale[3] = {1,7,8}
ListHairFemale[4] = {1,7,8}
ListHairFemale[5] = {1,2,3,4,5,6}

local monsterTransformation
local druidsEscape

local function DrinkPotion(user,SourceItem)

    local potionEffectId = tonumber(SourceItem:getData("potionEffectId"))

    if potionEffectId == 0 or potionEffectId == nil or potionEffectId == 562  then -- no effect
        common.InformNLS(user, "Du hast nicht das Gefühl, dass etwas passiert.",
        "You don't have the feeling that something happens.")
        return true

    elseif (potionEffectId >= 500) and (potionEffectId < 599) then -- transformation potion

        local dog = 560
        local spider = 561
        local deer = 563

        if potionEffectId == dog then
            monsterTransformation(user,SourceItem, 58, 102, 51, 0, false)
            return true
        end

        if potionEffectId == spider then
            monsterTransformation(user, SourceItem, 19, 102, 51, 0, false)
            return true
        end

        if potionEffectId == deer then
            local deerID = 116
            local duration = math.floor(SourceItem.quality/100) -- 1-9 seconds of protection, 1-9 min of transformation
            if druidsEscape(user, duration) then
                monsterTransformation(user, SourceItem, deerID, 255, 255, 255, duration)
                return true
            else
                return false
            end
        end

        local duration = math.floor(SourceItem.quality/100)*10 -- effect is called every minute. quality 1 = 10 minutes; quality 9 = 90
        -- new apperance
        local newSex = potionEffectId - ((math.floor(potionEffectId/10))*10) -- example 551: race id 5 (lizard), sex 1 (female)
        local newRace = math.floor(((potionEffectId - newSex - 500)/10))
        local isMonster = 0
        -- our old value to change the char later back
        local oldRace = user:getRace()
        local oldSkinColour = user:getSkinColour()
        local oldHairColour = user:getHairColour()
        local oldSex = user:increaseAttrib("sex",0)
        local oldHair = user:getHair()
        local oldBeard = user:getBeard()
        local oldHeight = user:increaseAttrib("body_height",0)
        -- check if there is already a an effect
        local  find, myEffect = user.effects:find(329)

        if find then
            local findNewRace, LteNewRace = myEffect:findValue("newRace")
            local _, counterBlack = myEffect:findValue("counterBlack")
            if findNewRace then
                if LteNewRace == newRace then
                    user:inform("LteNewRace == newRace")
                    if duration > counterBlack then -- same transformation, but the new potion will last longer
                        myEffect:addValue("counterBlack",duration)
                        return true
                    end
                else -- not the same transformation; we need to get the old apperance values from the LTE
                   local _, foundMonster = myEffect:findValue("isMonster")
                    if foundMonster ~= 1 then
                        local findOldSkincolor1, oldSkincolor1 = myEffect:findValue("oldSkincolor1")
                        local findOldSkincolor2, oldSkincolor2 = myEffect:findValue("oldSkincolor2")
                        local findOldSkincolor3, oldSkincolor3 = myEffect:findValue("oldSkincolor3")
                        local findOldHaircolor1, oldHaircolor1 = myEffect:findValue("oldHaircolor1")
                        local findOldHaircolor2, oldHaircolor2 = myEffect:findValue("oldHaircolor2")
                        local findOldHaircolor3, oldHaircolor3 = myEffect:findValue("oldHaircolor3")

                        if findOldSkincolor1 and findOldSkincolor2 and findOldSkincolor3 then
                            oldSkinColour.red = oldSkincolor1
                            oldSkinColour.green = oldSkincolor2
                            oldSkinColour.blue = oldSkincolor3
                        end

                        if findOldHaircolor1 and findOldHaircolor2 and findOldHaircolor3 then
                            oldHairColour.red = oldHaircolor1
                            oldHairColour.green = oldHaircolor2
                            oldHairColour.blue = oldHaircolor3
                        end

                        _, oldHair = myEffect:findValue("oldHair")
                        _, oldBeard = myEffect:findValue("oldBeard")
                        _, oldSex = myEffect:findValue("oldSex")
                    end
                    _, oldRace = myEffect:findValue("oldRace")
                    _, oldHeight = myEffect:findValue("oldHeight")
                    -- and remove the old effect
                    local effectRemoved = user.effects:removeEffect(329)
                    if not effectRemoved then
                        common.InformNLS( user,"Fehler: informiere einen dev. lte nicht entfernt. black bottle script", "Error: inform dev. Lte not removed. black bottle script.")
                        return true
                    end
                end
            end
        end
        local newBeard, newHair
        if (newRace <= 1) and (newSex == 0) then -- only male humans or dwarves get a beard
            newBeard = ListBeard[newRace][math.random(1,#ListBeard)]
        else
             newBeard = 0
        end
        if (newSex) == 0 then
            newHair = ListHairMale[newRace][math.random(1,#ListHairMale[newRace])]
        else
            newHair = ListHairFemale[newRace][math.random(1,#ListHairFemale[newRace])]
        end
        local HairColorRandomPosition = ((math.random(1,(#ListHairColor[newRace]/3)))*3)
        local newHaircolor1 = ListHairColor[newRace][HairColorRandomPosition-2]
        local newHaircolor2 = ListHairColor[newRace][HairColorRandomPosition-1]
        local newHaircolor3 = ListHairColor[newRace][HairColorRandomPosition]

        local SkinColorRandomPosition = ((math.random(1,(#ListSkinColor[newRace]/3)))*3)
        local newSkincolor1 = ListSkinColor[newRace][SkinColorRandomPosition-2]
        local newSkincolor2 = ListSkinColor[newRace][SkinColorRandomPosition-1]
        local newSkincolor3 = ListSkinColor[newRace][SkinColorRandomPosition]

        local newHeight = math.random(80,120)

        -- LTE and transformation
        find = user.effects:find(329)
        if not find then

        myEffect = LongTimeEffect(329,1)

            -- saving of the old values
              if isMonster ~= 1 then -- we transform him into an other memeber of on of the six races, so we need to save those old values
                    myEffect:addValue("oldSex",oldSex)
                    myEffect:addValue("oldHair",oldHair)
                    myEffect:addValue("oldBeard",oldBeard)
                    myEffect:addValue("oldSkincolor1",oldSkinColour.red)
                    myEffect:addValue("oldSkincolor2",oldSkinColour.green)
                    myEffect:addValue("oldSkincolor3",oldSkinColour.blue)
                    myEffect:addValue("oldHaircolor1",oldHairColour.red)
                    myEffect:addValue("oldHaircolor2",oldHairColour.green)
                    myEffect:addValue("oldHaircolor3",oldHairColour.blue)

                    myEffect:addValue("newSex",newSex)
                    myEffect:addValue("newHair",newHair)
                    myEffect:addValue("newBeard",newBeard)
                    myEffect:addValue("newSkincolor1",newSkincolor1)
                    myEffect:addValue("newSkincolor2",newSkincolor2)
                    myEffect:addValue("newSkincolor3",newSkincolor3)
                    myEffect:addValue("newHaircolor1",newHaircolor1)
                    myEffect:addValue("newHaircolor2",newHaircolor2)
                    myEffect:addValue("newHaircolor3",newHaircolor3)

              end
                myEffect:addValue("oldRace",oldRace)
                myEffect:addValue("oldHeight",oldHeight)
                myEffect:addValue("newRace",newRace)
                myEffect:addValue("newHeight",newHeight)
                myEffect:addValue("isMonster",isMonster)

          -- transformation
          if isMonster ~= 1 then
             user:setAttrib("sex",newSex)
             user:setHair(newHair)
             user:setBeard(newBeard)
             user:setSkinColour(colour(newSkincolor1,newSkincolor2,newSkincolor3))
             user:setHairColour(colour(newHaircolor1,newHaircolor2,newHaircolor3))
          end
          user:setRace(newRace)
          user:setAttrib("body_height",newHeight)

          -- to make the changes visible
          user:increaseAttrib("hitpoints",-10)
          user:increaseAttrib("hitpoints",10)

          -- duration depends on the potion's quality
         myEffect:addValue("counterBlack",duration)
          user.effects:addEffect(myEffect)
        end
    end
    return true
end

function monsterTransformation(user,SourceItem, race, newSkincolor1, newSkincolor2, newSkincolor3, customDuration)

    local oldRace = user:getRace()
    local oldSkinColour = user:getSkinColour()
    local oldHairColour = user:getHairColour()
    local oldSex = user:increaseAttrib("sex",0)
    local oldHair = user:getHair()
    local oldBeard = user:getBeard()
    local oldHeight = user:increaseAttrib("body_height",0)

    local duration = math.floor(SourceItem.quality/100)*10 -- effect is called every minute. quality 1 = 10 minutes; quality 9 = 90

    if customDuration then
        duration = customDuration
    end

    -- check if there is already a an effect
    local find, myEffect = user.effects:find(329)
    if find then
        local  findNewRace, LteNewRace = myEffect:findValue("newRace")
        local _, counterBlack = myEffect:findValue("counterBlack")
        if findNewRace then
            if LteNewRace == findNewRace then
                if duration > counterBlack then -- same transformation, but the new potion will last longer
                    myEffect:addValue("counterBlack",duration)
                    return
                end
            else -- not the same transformation; we need to get the old apperance values from the LTE
                local findOldSkincolor1, oldSkincolor1 = myEffect:findValue("oldSkincolor1")
                local findOldSkincolor2, oldSkincolor2 = myEffect:findValue("oldSkincolor2")
                local findOldSkincolor3, oldSkincolor3 = myEffect:findValue("oldSkincolor3")
                local findOldHaircolor1, oldHaircolor1 = myEffect:findValue("oldHaircolor1")
                local findOldHaircolor2, oldHaircolor2 = myEffect:findValue("oldHaircolor2")
                local findOldHaircolor3, oldHaircolor3 = myEffect:findValue("oldHaircolor3")

                if findOldSkincolor1 and findOldSkincolor2 and findOldSkincolor3 then
                    oldSkinColour.red = oldSkincolor1
                    oldSkinColour.green = oldSkincolor2
                    oldSkinColour.blue = oldSkincolor3
                end

                if findOldHaircolor1 and findOldHaircolor2 and findOldHaircolor3 then
                    oldHairColour.red = oldHaircolor1
                    oldHairColour.green = oldHaircolor2
                    oldHairColour.blue = oldHaircolor3
                end

                _, oldHair = myEffect:findValue("oldHair")
                _, oldBeard = myEffect:findValue("oldBeard")
                _, oldSex = myEffect:findValue("oldSex")

                _, oldRace = myEffect:findValue("oldRace")
                _, oldHeight = myEffect:findValue("oldHeight")
                -- and remove the old effect
                local effectRemoved = user.effects:removeEffect(329)
                if not effectRemoved then
                    common.InformNLS( user,"Fehler: informiere einen dev. lte nicht entfernt. black bottle script", "Error: inform dev. Lte not removed. black bottle script.")
                    return
                end
            end
        end
    end

    local newRace = race

    local newHeight = math.random(80,120)

    -- LTE and transformation
    find = user.effects:find(329)
    if not find then
        myEffect = LongTimeEffect(329,1)
        myEffect:addValue("oldSex",oldSex)
        myEffect:addValue("oldHair",oldHair)
        myEffect:addValue("oldBeard",oldBeard)
        myEffect:addValue("oldSkincolor1",oldSkinColour.red)
        myEffect:addValue("oldSkincolor2",oldSkinColour.green)
        myEffect:addValue("oldSkincolor3",oldSkinColour.blue)
        myEffect:addValue("oldHaircolor1",oldHairColour.red)
        myEffect:addValue("oldHaircolor2",oldHairColour.green)
        myEffect:addValue("oldHaircolor3",oldHairColour.blue)
        myEffect:addValue("oldRace",oldRace)
        myEffect:addValue("oldHeight",oldHeight)
        myEffect:addValue("newRace",newRace)
        myEffect:addValue("newHeight",newHeight)
        myEffect:addValue("newSkincolor1",newSkincolor1)
        myEffect:addValue("newSkincolor2",newSkincolor2)
        myEffect:addValue("newSkincolor3",newSkincolor3)

        user:setSkinColour(colour(newSkincolor1,newSkincolor2,newSkincolor3))
        user:setRace(newRace)
        user:setAttrib("body_height",newHeight)

        -- duration depends on the potion's quality
        myEffect:addValue("counterBlack",duration)
        user.effects:addEffect(myEffect)
    end


end

function M.UseItem(user, SourceItem, ltstate)
    if SourceItem:getData("customPotion") ~= "" then
        customPotion.drinkInform(user, SourceItem)
    end
    -- repair potion in case it's broken
    alchemy.repairPotion(SourceItem)
    -- repair end

    if not ((SourceItem:getData("filledWith")=="potion") or (SourceItem:getData("filledWith") =="essenceBrew")) then
        return -- no potion, no essencebrew, something else
    end

    local cauldron = alchemy.GetCauldronInfront(user)
    if cauldron then -- infront of a cauldron?
        alchemy.FillIntoCauldron(user,SourceItem,cauldron,ltstate)
    else -- not infront of a cauldron, therefore drink!
        if DrinkPotion(user,SourceItem) then
            alchemy.logConsumption(user, SourceItem)
            alchemy.EmptyBottle(user,SourceItem)
            user:talk(Character.say, "#me trinkt eine schwarze Flüssigkeit.", "#me drinks a black liquid.")
            user.movepoints=user.movepoints - 20
        end
    end
end

function M.LookAtItem(user,Item)
    return lookat.GenerateLookAt(user, Item, 0)
end

local function isGMTool(itemID)

    local GMtoolIds = {93, 99, 100, 382}

    for _, id in pairs(GMtoolIds) do
        if itemID == id then
            return true
        end
    end

    return false
end

local function checkForArmour(user)

    local equipmentSlotsToCheck = {Character.head, Character.breast, Character.hands, Character.legs, Character.feet}

    local equipmentItems = {}

    for _, slot in pairs(equipmentSlotsToCheck) do
        table.insert(equipmentItems, user:getItemAt(slot))
    end

    for _, equipment in pairs(equipmentItems) do
        local isArmour, armour = world:getArmorStruct(equipment.id)

        if isArmour and (armour.Type == ArmorStruct.light or armour.Type == ArmorStruct.medium or armour.Type == ArmorStruct.heavy) then
            return true
        end
    end

    return false

end

local function checkForWeapons(user)

    local equipmentSlotsToCheck = {}

    for i = 1, 6 do
        table.insert(equipmentSlotsToCheck, user:getItemAt(Character["belt_pos_"..i]))
    end

    table.insert(equipmentSlotsToCheck, user:getItemAt(Character.left_tool))
    table.insert(equipmentSlotsToCheck, user:getItemAt(Character.right_tool))

    for _, equipment in pairs(equipmentSlotsToCheck) do
        local isWeapon = world:getWeaponStruct(equipment.id)

        if isWeapon and not isGMTool(equipment.id) then
            return true
        end
    end

    local backpack = user:getBackPack()

    if not backpack then
        return false
    end

    for i = 0, 99 do
        local success, equipment = backpack:viewItemNr(i)

        if success then
            local isWeapon = world:getWeaponStruct(equipment.id)

            if isWeapon and not isGMTool(equipment.id) then
                return true
            end
        end
    end

    return false

end

local function applyProtection(user, duration)

    local myEffect = LongTimeEffect(32,1)
    myEffect:addValue("duration", duration)
    user.effects:addEffect(myEffect)

end

function druidsEscape(user, duration)

    local foundEffect = user.effects:find(32)

    if foundEffect then
        user:inform("Du hast kürzlich den Trank Druidenflucht getrunken. Ein Weiterer wird deinem Magen nicht gut bekommen.", "You already drank a Druid's Escape recently. Any more and you will only feel sick.")
        return false
    end

    if checkForArmour(user) or checkForWeapons(user) then
        user:inform("Als Reh mit Waffen und Rüstung wirst du deine Feinde nicht täuschen können. Ushara ist nicht mit denen, die anderen Schaden zufügen wollen.", "As you are equipped with tools of war, your attackers are still able to recognise you even as a deer. Perhaps it is Ushara refusing to protect those armed to harm others?")
        return true
    end

    user:inform("Durch deine Verwandlung stiftest du Verwirrung unter deinen Feinden. Doch Usharas Segen wird dich nicht ewig beschützen, also nimm die Beine in die Hand!", "Your sudden transformation seems to confuse most enemies, whether by Ushara's blessing or something else entirely. It won't last forever, though, so you better hurry to get away!")
    applyProtection(user, duration)

    return true
end

local function potionChangeID(stackPosition, timeStamp, effectID)

    if not world:isItemOnField(stackPosition) then
        return false
    end

    local newID = {
        [562] = 563
    }

    local theField = world:getField(stackPosition)
    local counter = 1
    while counter <= theField:countItems() do
        local checkItem = theField:getStackItem(theField:countItems()- counter )
        if 329 == checkItem.id and checkItem:getData("identifierTimeStamp") == tostring(timeStamp) and tonumber(checkItem:getData("potionEffectId")) == effectID then
            checkItem:setData("potionEffectId", newID[effectID])
            world:changeItem(checkItem)
            return true
        end
        counter = counter + 1
    end

    return false

end

local function nearUsharaAltar(thePosition)

    local altars = {1162, 1163}

    local positions = {
        thePosition,
        position(thePosition.x +1, thePosition.y, thePosition.z),
        position(thePosition.x +1, thePosition.y +1, thePosition.z),
        position(thePosition.x -1, thePosition.y, thePosition.z),
        position(thePosition.x -1, thePosition.y - 1, thePosition.z),
        position(thePosition.x, thePosition.y +1, thePosition.z),
        position(thePosition.x, thePosition.y -1, thePosition.z)}

    for _, currentPosition in pairs(positions) do
        local theField = world:getField(currentPosition)

        for i = 0, theField:countItems() do
            local checkItem = theField:getStackItem(i)
            for _, altar in pairs(altars) do
                if checkItem.id == altar then
                    return true
                end
            end
        end
    end

    return false
end

local function druidsEscapePrototype(user, targetItem)
    local itemPos = position(targetItem.pos.x, targetItem.pos.y, targetItem.pos.z)

    if targetItem:getType() == 3 and nearUsharaAltar(itemPos) then
        local timeStamp = world:getTime("unix")
        targetItem:setData("identifierTimeStamp", timeStamp)
        world:changeItem(targetItem)

        scheduledFunction.registerFunction(360, function()
            if potionChangeID(itemPos, timeStamp, 562) then
                world:gfx(16, itemPos)
            end
        end)
    else
        if targetItem:getData("identifierTimeStamp") ~= "" then
            targetItem:setData("identifierTimeStamp", "")
            world:changeItem(targetItem)
        end
    end
end

function M.MoveItemAfterMove(user, sourceItem, targetItem)

    local potionEffectId = tonumber(sourceItem:getData("potionEffectId"))

    if potionEffectId == nil then
        potionEffectId = 0
    end

    if potionEffectId == 562 then
        druidsEscapePrototype(user, targetItem)
    end
end

return M

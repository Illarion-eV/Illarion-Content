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

local dogTransformation

local function DrinkPotion(user,SourceItem)

    local potionEffectId = tonumber(SourceItem:getData("potionEffectId"))

    if potionEffectId == 0 or potionEffectId == nil  then -- no effect
        common.InformNLS(user, "Du hast nicht das Gef�hl, dass etwas passiert.",
        "You don't have the feeling that something happens.")
        return

    elseif (potionEffectId >= 500) and (potionEffectId < 599) then -- transformation potion

        if potionEffectId == 560 then
            dogTransformation(user,SourceItem)
            return
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
                        return
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
                        return
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
end

function dogTransformation(user,SourceItem)

    local oldRace = user:getRace()
    local oldSkinColour = user:getSkinColour()
    local oldHairColour = user:getHairColour()
    local oldSex = user:increaseAttrib("sex",0)
    local oldHair = user:getHair()
    local oldBeard = user:getBeard()
    local oldHeight = user:increaseAttrib("body_height",0)

    local duration = math.floor(SourceItem.quality/100)*10 -- effect is called every minute. quality 1 = 10 minutes; quality 9 = 90

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

    local newRace = 58
    local newHeight = math.random(80,120)
    local newSkincolor1 = 102
    local newSkincolor2 = 51
    local newSkincolor3 = 0

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
        user:talk(Character.say, "#me trinkt eine schwarze Fl�ssigkeit.", "#me drinks a black liquid.")
        user.movepoints=user.movepoints - 20
        DrinkPotion(user,SourceItem) -- call effect
        alchemy.EmptyBottle(user,SourceItem)
    end
end

function M.LookAtItem(user,Item)
    return lookat.GenerateLookAt(user, Item, 0)
end

return M

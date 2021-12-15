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
local runes = require("magic.arcane.runes")
local magicDamage = require("magic.arcane.magicDamage")
local magicResistance = require("magic.arcane.magicResistance")
local common = require("base.common")
local lookAt = require("base.lookat")

local M = {}

local function turnMRintoText(MR)
local returnText
    if MR < 0.33 then
        returnText = "The target has low magic resistance.\n"
    elseif MR < 0.66 then
        returnText = "The target has average magic resistance.\n"
    elseif MR > 0.66 then
        returnText = "The target has high magic resistance.\n"
    end
return returnText
end

local function turnHealthIntoText(health)
local returnText
    if health == 10000 then
        returnText = "Target is perfectly healthy.\n"
    elseif health > 8000 then
        returnText = "Target is slightly wounded.\n"
    elseif health > 5000 then
        returnText = "Target is wounded.\n"
    elseif health > 2000 then
        returnText = "Target is heavily wounded.\n"
    elseif health > 0 then
        returnText = "Target is near death.\n"
    elseif health == 0 then
        returnText = "Target is dead.\n"
    end
return returnText
end

local function turnManaIntoText(mana)
local returnText
    if mana == 10000 then
        returnText = "Target is brimming with mana.\n"
    elseif mana > 8000 then
        returnText = "Target is nearly satiated with mana.\n"
    elseif mana > 5000 then
        returnText = "Target has moderate amount of mana.\n"
    elseif mana > 2000 then
        returnText = "Target is running low on mana.\n"
    elseif mana > 0 then
        returnText = "Target is almost out of mana.\n"
    elseif mana == 0 then
        returnText = "Target only has enough mana to survive.\n"
    end
return returnText
end

local function turnStaminaIntoText(stamina)
local returnText
    if stamina == 10000 then
        returnText = "Target is brimming with energy.\n"
    elseif stamina > 8000 then
        returnText = "Target is almost full on energy.\n"
    elseif stamina > 5000 then
        returnText = "Target is starting to get hungry.\n"
    elseif stamina > 2000 then
        returnText = "Target is hungry.\n"
    elseif stamina > 0 then
        returnText = "Target is nearly starving.\n"
    elseif stamina == 0 then
        returnText = "Target is starving.\n"
    end
return returnText
end

local function getTotalSkillValue(target)
--check every skill that isnt a language skill and combine them
return 0
end

local function skillValueIntoText(skillValue)
local returnText
    if skillValue >= 3000 then
        returnText = "Target is highly experienced in many professions.\n"
    elseif skillValue >= 2000 then
        returnText = "Target is very experienced in many professions\n"
    elseif skillValue >= 1000 then
        returnText = "Target is experienced in many professions.\n"
    elseif skillValue >= 500 then
        returnText = "Target is experienced in some professions.\n"
    elseif skillValue >= 250 then
        returnText = "Target has some experience in multiple professions.\n"
    elseif skillValue >= 100 then
        returnText = "Target has at least some experience in a profession.\n"
    elseif skillValue >= 0 then
        returnText = "Target has little to no experience in a profession.\n"
    end
return returnText
end

local statText = {
{stat = "intelligence", adjective = "intelligent"},
{stat = "strength", adjective = "strong"},
{stat = "constitution", adjective = "sturdy"},
{stat = "dexterity", adjective = "dexterous"},
{stat = "agility", adjective = "nimble"},
{stat = "willpower", adjective = "strong-minded"},
{stat = "perception", adjective = "perceptive"},
{stat = "essence", adjective = "spiritual"}
}

local function statsIntoText(target)
local returnText = ""
    for _, attribute in pairs(statText) do
        local stat = target:increaseAttrib(attribute.stat,0)
        if stat > 14 then
            returnText = returnText.."The target is very "..attribute.adjective..".\n"
        elseif stat > 8 then
            returnText = returnText.."The target is somewhat "..attribute.adjective..".\n"
        else
            returnText = returnText.."The target is not very "..attribute.adjective..".\n"
        end
    end
return returnText
end

function M.getInputFromAndSendTo(user, target)
    local callback = function(dialog)
        if not dialog:getSuccess() then
            user:inform("You decided against responding to the telepathic connection.")
        else
            local input = dialog:getInput()
            target:inform("","You hear the voice of your telepathic partner in your mind: "..input)
        end
    end

    local dialog = InputDialog("What do you want to tell your telepathic partner?","", false, 255, callback)
    user:requestInputDialog(dialog)
end

local function telepathy(user, targets, spell)
    for _, target in pairs(targets.targets) do
        if target:getType() ~= Character.player then
            return
        end
        if runes.checkSpellForRuneByName("Kel", spell) or runes.checkSpellForRuneByName("Tah", spell) then
            target:inform("","You feel a telepathic connection establish between you and someone else.")
        end
        if runes.checkSpellForRuneByName("Kel", spell) then
            M.getInputFromAndSendTo(user, target)
        end
        if runes.checkSpellForRuneByName("Tah", spell) then
            M.getInputFromAndSendTo(target, user)
        end
    end
end

local monsterType = magicDamage.raceList

local function checkIfTypeOf(target, typeOf)
    for _, monster in pairs(monsterType) do
        if target:getRace() == monster.race then
            if monster.typeOf == typeOf then
                return true
            end
        end
    end
return false
end

local function getDirectionRelativeToUser(user, target)
    return "East" --temporary
end

local function getDistanceBetweenUserAndTarget(user, target)
    return 5 --temporary
end

local function getPositionOfTarget(user, target, spell)
local Mes = runes.checkSpellForRuneByName("Mes", spell)
local returnText = ""
    if Mes then
        local direction = getDirectionRelativeToUser(user, target)
        local distance = getDistanceBetweenUserAndTarget(user, target)
        returnText = "Target's position is "..distance.." tiles to the "..direction.." of you."
    end
return returnText
end

local function speedIntoText(speed)
local returnText
    if speed == 1 then
        returnText = "Target is not under the effect of any hastening or slowing spells.\n"
    elseif speed > 1 then
        returnText = "Target is under the effect of a hastening spell.\n"
    elseif speed < 1 then
        returnText = "Target is under the effect of a slowing spell.\n"
    end
return returnText
end

local function getItemProperties(user, target)
local lookAtInfo = lookAt.GenerateLookAt(user, target.target)
local itemName = lookAtInfo.name
local itemWeight = lookAtInfo.weight
local returnText = itemName
    if itemWeight > 0 then
        if itemWeight == 2 then
            returnText = returnText..":\nWeight - "..(itemWeight/2).." blackberry.\n"
        else
            returnText = returnText..":\nWeight - "..(itemWeight/2).." blackberries.\n"
        end
    end
return returnText
end

local function getGenderText(target)
local genderNumber = target:getBaseAttribute("sex")
local gender
    if genderNumber == 0 then
        gender = "male"
    elseif genderNumber == 1 then
        gender = "female"
    end
return gender
end

local raceList = {
    {name = "human", id = 0},
    {name = "dwarf", id = 1},
    {name = "halfling", id = 2},
    {name = "elf", id = 3},
    {name = "orc", id = 4},
    {name = "lizardman", id = 5},
    {name = "forest troll", id = 9},
    {name = "mummy", id = 10},
    {name = "skeleton", id = 11},
    {name = "beholder", id = 12},
    {name = "sheep", id = 18},
    {name = "spider", id = 19},
    {name = "pig", id = 24},
    {name = "wasp", id = 27},
    {name = "stone golem", id = 30},
    {name = "cow", id = 37},
    {name = "wolf", id =39},
    {name = "bear", id = 51},
    {name = "raptor", id = 52},
    {name = "zombie", id = 53},
    {name = "hellhound", id = 54},
    {name = "imp", id = 55},
    {name = "iron golem", id = 56},
    {name = "ratman", id = 57},
    {name = "dog", id = 58},
    {name = "beetle", id = 59},
    {name = "fox", id = 60},
    {name = "slime", id = 61},
    {name = "chicken", id = 62},
    {name = "bone dragon", id = 63},
    {name = "rat", id = 111},
    {name = "dragon", id = 112},
    {name = "rabbit", id = 113},
    {name = "demon", id = 114},
    {name = "fairy", id = 115},
    {name = "deer", id = 116},
    {name = "ettin", id = 117}
}

local function getRaceText(target)
local raceNumber = target:getRace()
local raceText = "Race not found. Please contact a developer."
    for _, race in pairs(raceList) do
        if race.id == raceNumber then
            raceText = race.name
        end
    end
return raceText
end


local function getPlayerProperties(target, spell)
local Ira = runes.checkSpellForRuneByName("Ira", spell)
local Kah = runes.checkSpellForRuneByName("Kah", spell)
local Orl = runes.checkSpellForRuneByName("Orl", spell)
local Pherc = runes.checkSpellForRuneByName("Pherc", spell)
local Qwan = runes.checkSpellForRuneByName("Qwan", spell)
local Sih = runes.checkSpellForRuneByName("Sih", spell)
local Sul = runes.checkSpellForRuneByName("Sul", spell)
local returnText = "Race: "..getRaceText(target).." "..getGenderText(target).."\n"
    if Ira then
        returnText = returnText..turnManaIntoText(target:increaseAttrib("mana", 0))
    end
    if Kah then
        returnText = returnText..turnStaminaIntoText(target:increaseAttrib("foodlevel", 0))
    end
    if Orl then
        returnText = returnText..skillValueIntoText(getTotalSkillValue(target))
    end
    if Pherc then
        returnText = returnText..turnMRintoText(magicResistance.getMagicResistance(target, spell))
    end
    if Sih then
        returnText = returnText..turnHealthIntoText(target:increaseAttrib("hitpoints", 0))
    end
    if Sul then
        returnText = returnText..speedIntoText(target.speed)
    end
    if Qwan then
        returnText = returnText..statsIntoText(target)
    end
return returnText
end

local function getMonsterProperties(target, spell)
local Yeg = runes.checkSpellForRuneByName("Yeg", spell)
local Ura = runes.checkSpellForRuneByName("Ura", spell)
local Taur = runes.checkSpellForRuneByName("Taur", spell)
local undead = checkIfTypeOf(target, "undead")
local sentient = checkIfTypeOf(target, "sentient")
local animal = checkIfTypeOf(target, "animal")
local Pherc = runes.checkSpellForRuneByName("Pherc", spell)
local Sih = runes.checkSpellForRuneByName("Sih", spell)
local Qwan = runes.checkSpellForRuneByName("Qwan", spell)
local Sul = runes.checkSpellForRuneByName("Sul", spell)
local returnText = false
    if (Yeg and undead) or (Taur and sentient) or (Ura and animal) then
        returnText = "Target race: "..getRaceText(target).."\n"
        if Pherc then
            returnText = returnText..turnMRintoText(magicResistance.getMagicResistance(target, spell))
        end
        if Sih then
            returnText = returnText..turnHealthIntoText(target:increaseAttrib("hitpoints", 0))
        end
        if Sul then
            returnText = returnText..speedIntoText(target.speed)
        end
        if Qwan then
            returnText = returnText..statsIntoText(target)
        end
    end
return returnText
end

local tileDescriptions = {
{id = 0, english = "Air", german = ""},
{id = 1, english = "Rocky terrain", german = ""},
{id = 2, english = "Rocky terrain", german = ""},
{id = 3, english = "Sandy terrain", german = ""},
{id = 4, english = "Muddy terrain", german = ""},
{id = 5, english = "Lava", german = ""},
{id = 6, english = "Water", german = ""},
{id = 7, english = "Rocky terrain", german = ""},
{id = 8, english = "Muddy terrain", german = ""},
{id = 9, english = "Muddy terrain", german = ""},
{id = 10, english = "Snowy terrain", german = ""},
{id = 11, english = "Grassy terrain", german = ""},
{id = 12, english = "Sandy terrain", german = ""},
{id = 13, english = "Rocky terrain", german = ""},
{id = 14, english = "Grassy terrain", german = ""},
{id = 15, english = "Rocky terrain", german = ""},
{id = 16, english = "Muddy terrain", german = ""},
{id = 17, english = "Rocky terrain", german = ""},
{id = 18, english = "Rocky terrain", german = ""},
{id = 19, english = "Icy terrain", german = ""},
{id = 20, english = "Icy terrain", german = ""},
{id = 34, english = "Air", german = ""},
{id = 40, english = "Wooden ground", german = ""},
{id = 41, english = "Rocky terrain", german = ""},
{id = 42, english = "Rocky terrain", german = ""},
{id = 43, english = "Wooden ground", german = ""},
{id = 45, english = "Carpet", german = ""},
{id = 46, english = "Carpet", german = ""},
{id = 47, english = "Carpet", german = ""},
{id = 48, english = "Carpet", german = ""},
{id = 49, english = "Carpet", german = ""},
{id = 50, english = "Carpet", german = ""},
{id = 51, english = "Carpet", german = ""},
{id = 52, english = "Carpet", german = ""},
{id = 53, english = "Carpet", german = ""},
{id = 55, english = "Rocky terrain", german = ""},
{id = 56, english = "Rocky terrain", german = ""},
{id = 57, english = "Rocky terrain", german = ""},
{id = 58, english = "Rocky terrain", german = ""},
{id = 59, english = "Wooden ground", german = ""},
{id = 60, english = "Layered bricks", german = ""},
{id = 61, english = "Layered bricks", german = ""},
{id = 62, english = "Wooden ground", german = ""},
{id = 63, english = "Wooden ground", german = ""},
{id = 64, english = "Wooden ground", german = ""},
{id = 65, english = "Wooden ground", german = ""},
{id = 66, english = "Rocky terrain", german = ""},
{id = 67, english = "Carpet", german = ""},
{id = 68, english = "Carpet", german = ""},
{id = 69, english = "Carpet", german = ""},
{id = 70, english = "Carpet", german = ""},
{id = 71, english = "Carpet", german = ""},
{id = 72, english = "Carpet", german = ""},
{id = 73, english = "Carpet", german = ""},
{id = 74, english = "Muddy terrain", german = ""},
{id = 75, english = "Muddy terrain", german = ""}
}

local function getTileProperties(target)
local field
    if target.target.pos then
        field = world:getField(target.target.pos)
    elseif target.category == "item" then
        field = world:getField(target.position)
    else
        field = world:getField(target.target)
    end
local tileID = field:tile()
local returnText = "Tile information:\n"
    for _, tile in pairs(tileDescriptions) do
        if tile.id == tileID then
            returnText = returnText..tile.english.."\n"
        end
    end
return returnText
end

function M.getText(user, target, spell, item, character)
local returnText
local Anth = runes.checkSpellForRuneByName("Anth", spell)
local Fhen = runes.checkSpellForRuneByName("Fhen", spell)
    if Anth and item then
        returnText = getItemProperties(user, target)
    elseif character then
        if Fhen and target.target:getType() == Character.player then
            returnText = getPlayerProperties(target.target, spell)
        elseif target.target:getType() == Character.monster then
            returnText = getMonsterProperties(target.target, spell)
        end
    end
    if not returnText then
        returnText = getTileProperties(target)
    end
    returnText = returnText..getPositionOfTarget(user, target, spell).."\n"
return returnText
end

local function sendText(textSent, target)
    local callback = function(dialog)
    end
    local dialog = MessageDialog("Magically obtained information", textSent, callback)
    target:inform("You feel a flow of information stream into your mind through magical forces.")
    target:requestMessageDialog(dialog)
end

local function selectNearbyPlayer(user, textSent)
local range = 7
local nearbyPlayers = world:getCharactersInRangeOf(user.pos, range)
local callback = function(dialog)
    if not dialog:getSuccess() then
        return
    end
    local index = dialog:getSelectedIndex() +1
    for i = 1, #nearbyPlayers do
        if index == i then
            sendText(textSent, nearbyPlayers[i])
            return
        end
    end
end
local dialog = SelectionDialog(common.GetNLS(user,"","Target Selection"), common.GetNLS(user,"","Select who you want to send the information to."), callback)
    for i = 1, #nearbyPlayers do
        dialog:addOption(0,nearbyPlayers[i].name)
    end
user:requestSelectionDialog(dialog)
end

local directionsList = {
{direction = "east"},
{direction = "west"},
{direction = "north"},
{direction = "south"},
{direction = "southeast"},
{direction = "northeast"},
{direction = "southwest"},
{direction = "northwest"}
}

local function moreTargetsOrSend(user, text, targetnumber, spell)
local Fhan = runes.checkSpellForRuneByName("Fhan", spell)
    local callback = function(dialog)
        if (not dialog:getSuccess()) then
            return
        end
        local index = dialog:getSelectedIndex()+1
        if index == 1 then
            if Fhan then
                selectNearbyPlayer(user, text)
            else
                sendText(text, user)
            end
        else
            targetnumber = targetnumber+1
            M.fakeDialogue(user, text, targetnumber, spell)
        end
    end
    local dialog = SelectionDialog(common.GetNLS(user,"","Fake information selection"), common.GetNLS(user,"","Select what to do next"), callback)
    if Fhan then
        dialog:addOption(0, "Send faked information")
    else
        dialog:addOption(0, "View faked information")
    end
    dialog:addOption(0, "Add another fake target")
user:requestSelectionDialog(dialog)
end

local function fakeTargetDirection(user, text, targetnumber, spell)
local direction
local distance
local _

    local inputCallback = function (inputDialog)
        if (not inputDialog:getSuccess()) then
            return
        end
        local input = inputDialog:getInput()
        if (string.find(input,"(%d+)")~=nil) then
            _, _, distance = string.find(input,"(%d+)")
            local textSent = text.."Target's position is "..distance.." tiles to the "..direction.." of you."
            moreTargetsOrSend(user, textSent, targetnumber, spell)
        else
            user:inform("Input must be a number.")
        end
    end

    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        end
        local index = dialog:getSelectedIndex() +1
        for i = 1, #directionsList do
            if index == i then
                direction = directionsList[i].direction
                user:requestInputDialog(InputDialog("Distance in number of tiles", "How many tiles away is the fake target meant to be?" ,false, 255, inputCallback))
            end
        end
    end

    local dialog = SelectionDialog(common.GetNLS(user,"","Fake information selection"), common.GetNLS(user,"","Select what information you want to fake."), callback)

    for i = 1, #directionsList do
        dialog:addOption(0, directionsList[i].direction)
    end
user:requestSelectionDialog(dialog)
end

local function fakeTileInfo(user, text, targetnumber, spell)
    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        end
        local index = dialog:getSelectedIndex() +1
        for i = 1, #tileDescriptions do
            if index == i then
                text = text..tileDescriptions[i].english.."\n"
                fakeTargetDirection(user, text, targetnumber, spell)
            end
        end
    end
local dialog = SelectionDialog(common.GetNLS(user,"","Fake information selection"), common.GetNLS(user,"","Select what type of tile you want to fake."), callback)
    for i = 1, #tileDescriptions do
        dialog:addOption(0, tileDescriptions[i].english)
    end
user:requestSelectionDialog(dialog)
end

local function fakeItemInfo(user, text, targetnumber, spell)
local item
local weight
local textSent
local _
    local inputCallback = function (inputDialog)
        if (not inputDialog:getSuccess()) then
            return
        end
        local input = inputDialog:getInput()
        if (string.find(input,"(%d+)")~=nil) then
            _, _, weight = string.find(input,"(%d+)")
            textSent = textSent..":\nWeight - "..weight.." blackberries.\n"
            fakeTargetDirection(user, textSent, targetnumber, spell)
        else
            user:inform("Input must be a number.")
        end
    end
    local inputCallback2 = function (inputDialog2)
        if (not inputDialog2:getSuccess()) then
            return
        end
            item = inputDialog2:getInput()
            textSent = text..item
            user:requestInputDialog(InputDialog("Weight input", "How much do you want the weight of the item to equate to in number of blackberries?" ,false, 255, inputCallback))
    end
    user:requestInputDialog(InputDialog("Name input", "What is the name of the item you want to fake?" ,false, 255, inputCallback2))
end

local attribValues = {
    {value = 10000},
    {value = 8001},
    {value = 5001},
    {value = 2001},
    {value = 1},
    {value = 0}
}

local speedValues = {
    {value = 1.1},
    {value = 1},
    {value = 0.9}
}

local magicResistanceValues = {
    {value = 1},
    {value = 0.65},
    {value = 0.32}
}

local skillValues = {
{value = 3000},
{value = 2000},
{value = 500},
{value = 250},
{value = 100},
{value = 0}
}

local function fakeStats(user, text, targetNumber, spell)
    fakeTargetDirection(user, text, targetNumber, spell)
end

local function fakeSpeed(user, text, targetNumber, spell)
local speed
    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        end
        local index = dialog:getSelectedIndex() +1
        for i = 1, #speedValues do
            if index == i then
                speed = speedValues[i].value
                text = text..speedIntoText(speed)
                fakeStats(user, text, targetNumber, spell)
            end
        end
    end
    local dialog = SelectionDialog(common.GetNLS(user,"","Fake information selection"), common.GetNLS(user,"","Select whether the fake target should be portrayed as being under speed influencing magic."), callback)

    for i = 1, #speedValues do
        dialog:addOption(0, speedIntoText(speedValues[i].value))
    end
user:requestSelectionDialog(dialog)
end

local function fakeHealth(user, text, targetNumber, spell)
local health
    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        end
        local index = dialog:getSelectedIndex() +1
        for i = 1, #attribValues do
            if index == i then
                health = attribValues[i].value
                text = text..turnHealthIntoText(health)
                fakeSpeed(user, text, targetNumber, spell)
            end
        end
    end
    local dialog = SelectionDialog(common.GetNLS(user,"","Fake information selection"), common.GetNLS(user,"","Select how much health the fake target should be portrayed as having."), callback)

    for i = 1, #attribValues do
        dialog:addOption(0, turnHealthIntoText(attribValues[i].value))
    end
user:requestSelectionDialog(dialog)
end

local function fakeMagicResistance(user, text, targetNumber, spell)
    local MR
    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        end
        local index = dialog:getSelectedIndex() +1
        for i = 1, #magicResistanceValues do
            if index == i then
                MR = magicResistanceValues[i].value
                text = text..turnMRintoText(MR)
                fakeHealth(user, text, targetNumber, spell)
            end
        end
    end
    local dialog = SelectionDialog(common.GetNLS(user,"","Fake information selection"), common.GetNLS(user,"","Select how much magic resistance the fake target should be portrayed as having."), callback)

    for i = 1, #magicResistanceValues do
        dialog:addOption(0, turnMRintoText(magicResistanceValues[i].value))
    end
user:requestSelectionDialog(dialog)
end

local function fakePlayerSkill(user, text, targetNumber, spell)
local skill
    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        end
        local index = dialog:getSelectedIndex() +1
        for i = 1, #skillValues do
            if index == i then
                skill = skillValues[i].value
                text = text..skillValueIntoText(skill)
                fakeMagicResistance(user, text, targetNumber, spell)
            end
        end
    end
    local dialog = SelectionDialog(common.GetNLS(user,"","Fake information selection"), common.GetNLS(user,"","Select how much skilled the fake target should be portrayed as being."), callback)

    for i = 1, #skillValues do
        dialog:addOption(0, skillValueIntoText(skillValues[i].value))
    end
user:requestSelectionDialog(dialog)
end

local function fakePlayerFood(user, text, targetNumber, spell)
local stamina
    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        end
        local index = dialog:getSelectedIndex() +1
        for i = 1, #attribValues do
            if index == i then
                stamina = attribValues[i].value
                text = text..turnStaminaIntoText(stamina)
                fakePlayerSkill(user, text, targetNumber, spell)
            end
        end
    end
    local dialog = SelectionDialog(common.GetNLS(user,"","Fake information selection"), common.GetNLS(user,"","Select how much stamina the fake target should be portrayed as having."), callback)

    for i = 1, #attribValues do
        dialog:addOption(0, turnStaminaIntoText(attribValues[i].value))
    end
user:requestSelectionDialog(dialog)
end

local function fakePlayerMana(user, text, targetNumber, spell)
local mana
    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        end
        local index = dialog:getSelectedIndex() +1
        for i = 1, #attribValues do
            if index == i then
                mana = attribValues[i].value
                text = text..turnManaIntoText(mana)
                fakePlayerFood(user, text, targetNumber, spell)
            end
        end
    end
    local dialog = SelectionDialog(common.GetNLS(user,"","Fake information selection"), common.GetNLS(user,"","Select how much mana the fake target should be portrayed as having."), callback)

    for i = 1, #attribValues do
        dialog:addOption(0, turnManaIntoText(attribValues[i].value))
    end
user:requestSelectionDialog(dialog)
end

local function fakePlayerInfo(user, text, targetNumber, spell)
local race
local gender
    local callback2 = function(dialog2)
        if not dialog2:getSuccess() then
            return
        end
        local index = dialog2:getSelectedIndex() +1
        if index == 1 then
            gender = "male"
            text = text..gender.."\n"
            fakePlayerMana(user, text, targetNumber, spell)
        else
            gender = "female"
            text = text..gender.."\n"
            fakePlayerMana(user, text, targetNumber, spell)
        end
    end
    local dialog2 = SelectionDialog(common.GetNLS(user,"","Fake information selection"), common.GetNLS(user,"","Select what gender the fake target should be portrayed as."), callback2)
    dialog2:addOption(0, "male")
    dialog2:addOption(0, "female")
    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        end
        local index = dialog:getSelectedIndex() +1
        for i = 1, 6 do
            if index == i then
                race = raceList[i].name
                text = text.."Target race: "..race
                user:requestSelectionDialog(dialog2)
            end
        end
    end
    local dialog = SelectionDialog(common.GetNLS(user,"","Fake information selection"), common.GetNLS(user,"","Select what race the fake target should be portrayed as."), callback)

    for i = 1, 6 do
        dialog:addOption(0, raceList[i].name)
    end
user:requestSelectionDialog(dialog)
end

local function fakeMonsterInfo(user, text, targetNumber, spell)
local race
    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        end
        local index = dialog:getSelectedIndex() +1
        for i = 1, #raceList do
            if index == i then
                race = raceList[i].name
                text = text.."Target race: "..race
                fakeMagicResistance(user, text, targetNumber, spell)
            end
        end
    end
    local dialog = SelectionDialog(common.GetNLS(user,"","Fake information selection"), common.GetNLS(user,"","Select what race the fake target should be portrayed as."), callback)

    for i = 1, #raceList do
        dialog:addOption(0, raceList[i].name)
    end
user:requestSelectionDialog(dialog)
end

function M.fakeDialogue(user, text, targetNumber, spell)
    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        end
        local index = dialog:getSelectedIndex() +1
        if index == 1 then
            text = text.."\nTarget "..targetNumber..":\nTile information:\n"
            fakeTileInfo(user, text, targetNumber, spell)
        elseif index == 2 then
            text = text.."\nTarget "..targetNumber..":\n"
            fakeItemInfo(user, text, targetNumber, spell)
        elseif index == 3 then
            fakePlayerInfo(user, text, targetNumber, spell)
        elseif index == 4 then
            fakeMonsterInfo(user, text, targetNumber, spell)
        end
    end
local dialog = SelectionDialog(common.GetNLS(user,"","Fake information selection"), common.GetNLS(user,"","Select what type of information you want to fake."), callback)
dialog:addOption(0,"Tile")
dialog:addOption(0,"Item")
dialog:addOption(0,"Player")
dialog:addOption(0,"Monster")
user:requestSelectionDialog(dialog)
end

local function gatherTextsIntoDialogue(user, targets, spell)
local returnText = ""
local targetNumber = 1
    for _, target in pairs(targets.targets) do
        returnText = returnText.."Target "..targetNumber..":\n"..M.getText(user, target, spell, false, true)
        targetNumber = targetNumber + 1
    end
    for _, item in pairs(targets.items) do
        returnText = returnText.."Target "..targetNumber..":\n"..M.getText(user, item, spell, true, false)
        targetNumber = targetNumber + 1
    end
    for _, position in pairs(targets.positions) do
        returnText = returnText.."Target "..targetNumber..":\n"..M.getText(user, position, spell, false, false)
        targetNumber = targetNumber + 1
    end
return returnText
end

local function getInformation(user, targets, spell)
local text = gatherTextsIntoDialogue(user, targets, spell)
    local callback = function(dialog)
    end
    local dialog = MessageDialog("Magically obtained information", text, callback)
user:requestMessageDialog(dialog)
end

local function sendInfoToOtherPlayer(user, targets, spell)
local Fhan = runes.checkSpellForRuneByName("Fhan", spell)
    if not Fhan then
        return
    end
local textSent = gatherTextsIntoDialogue(user, targets, spell)
selectNearbyPlayer(user, textSent)
end

function M.invokeSpiritSpells(user, targets, spell)
local Lhor = runes.checkSpellForRuneByName("Lhor", spell)
local PEN = runes.checkSpellForRuneByName("PEN", spell)
    if not PEN then
        return
    end
telepathy(user, targets, spell)
getInformation(user, targets, spell)
    if Lhor then
        M.fakeDialogue(user,"", 1, spell)
    else
        sendInfoToOtherPlayer(user, targets, spell)
    end
end

return M

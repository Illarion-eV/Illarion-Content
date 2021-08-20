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

local M = {}

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
    for _, target in pairs(targets) do
        if target.category ~= "character" then
            return
        end
        if target.target:getType() ~= Character.player then
            return
        end
        if runes.checkSpellForRuneByName("Kel", spell) or runes.checkSpellForRuneByName("Tah", spell) then
            target.target:inform("","You feel a telepathic connection establish between you and someone else.")
        end
        if runes.checkSpellForRuneByName("Kel", spell) then
            M.getInputFromAndSendTo(user, target.target)
        end
        if runes.checkSpellForRuneByName("Tah", spell) then
            M.getInputFromAndSendTo(target.target, user)
        end
    end
end

local monsterType = magicDamage.raceList

local function checkIfTypeOf(char, typeOf)
    for _, monster in pairs(monsterType) do
        if char.race == monster.race then
            if monster.typeOf == typeOf then
                return true
            end
        end
    end
return false
end

--[[local function getPositionOfTarget(user, target, spell)
local Mes = runes.checkSpellForRuneByName("Mes", spell)
local returnText = false
    if Mes then
        local direction = "" -- Function that returns direction target is in relative to user
        local distance = "" -- Distance between user and target converted into text similar to treasure map distance
        returnText = "\nPosition - "..distance.."to the "..direction.." of you."
    end
return returnText
end]]

local function getItemProperties(target)
local itemID = target.target.id
local itemStats = world:getItemStatsFromId(itemID)
local itemName = itemStats.English
local itemWeight = itemStats.Weight
local itemQuality = target.target.quality
local itemWear = target.target.wear
local returnText = itemName..":\nWeight - "..itemWeight..".\nQuality - "..itemQuality..".\nDurability - "..itemWear.."."
return returnText
end

local function getPlayerProperties(target, spell)
-- if Ira, get mana info
-- if Kah, get stamina info
--If Orl, give a textValue of how learned a character is based on total skill value minus language skills
--If Pherc, give a textValue of how much magic resistance someone has based on the value returned by the magic resistance  script
--If Qwan, return vague text values for what stats a player has for each attribute
--If Sih, get health status
--If Sul, check for the Character.speed value and give a textValue based off of that
--get info about player targets for base spell that isnt any  of the above info (THings like race and gender?)
end

local function getMonsterProperties(target, spell)
local Yeg = runes.checkSpellForRuneByName("Yeg", spell)
local Ura = runes.checkSpellForRuneByName("Ura", spell)
local Taur = runes.checkSpellForRuneByName("Taur", spell)
local returnText = false
    if (Yeg and checkIfTypeOf(target.target, "undead")) or (Taur and checkIfTypeOf(target.target, "sentient")) or (Ura and checkIfTypeOf(target.target, "animal")) then
        returnText = "infoAboutMonsterHere"
        --If Pherc, give a textValue of how much magic resistance someone has based on the value returned by the magic resistance  script
        --If Sih, get health status
        --If Qwan Do monsters have attributes? If so apply attribute checking script that returns text values for each attribute if Qwan
        --If Sul, check for the Character.speed value and give a textValue based off of that
        --Basic monster info that isnt a part of the above
    end
return returnText
end

local function getTileProperties(user, target, spell)
--get info about empty tiles
end

function M.getText(user, target, spell)
local returnText
local Anth = runes.checkSpellForRuneByName("Anth", spell)
local Fhen = runes.checkSpellForRuneByName("Fhen", spell)
    if Anth and target.category == "item" then
        returnText = getItemProperties(target)
    elseif target.category == "character" then
        if Fhen and target.target:getType() == Character.player then
            getPlayerProperties(target, spell)
        elseif target.target:getType() == Character.monster then
            getMonsterProperties(target, spell)
        end
    end
    if not returnText then
        returnText = getTileProperties(user, target, spell)
    end
return returnText
end

--local function fakeDialogue()
--set up a fake dialogue that looks like the real one, but the results are chosen by caster in a selectiondialogue
--end

--[[local function gatherTextsIntoDialogue(user, targets, spell)
--run M.getText for each target in targets, putting them into one big text variable
--check if Lhor for fakeDialogue instead of real one
--Invoke a messagedialogue that shows the info gathered
end]]

--[[local function sendInfoToOtherPlayer(user, targets, spell)
--Check if Fhan
--Give selection dialogue of nearby players that will get send the messageDialogue of info if selected
end]]

function M.invokeSpiritSpells(user, targets, spell)
telepathy(user, targets, spell)
--gatherTextsIntoDialogue(user, targets, spell)
--sendInfoToOtherPlayer(user, targets, spell)
end

return M

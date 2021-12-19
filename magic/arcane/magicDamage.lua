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
local MR = require("magic.arcane.magicResistance")
local MP = require("magic.arcane.magicPenetration")
local runes = require("magic.arcane.runes")
local M = {}
local damageList = {
{rune = "RA", damage = 1000, element = "Fire"},
{rune = "Pherc", damage = 500, element = "Water"},
{rune = "Pherc", damage = 500, element = "Air"},
{rune = "Pherc", damage = 500, element = "Earth"},
{rune = "Qwan", damage = 2000, element = "Fire"},
{rune = "Luk", damage = 1000, element = "Fire"},
{rune = "Taur", damage = 500, element = "Fire"},
{rune = "Ura", damage = 500, element = "Fire"},
{rune = "Yeg", damage = 500, element = "Fire"},
{rune = "Sul", damage = 2000, element = "Fire"}

}
local damageOverTimeList = {
{rune = "Pherc", damage = 2500, element = "Fire"},
{rune = "CUN", damage = 500, element = "Water"},
{rune = "Qwan", damage = 1500, element = "Water"},
{rune = "Taur", damage = 250, element = "Water"},
{rune = "Ura", damage = 250, element = "Water"},
{rune = "Yeg", damage = 250, element = "Water"}
}
M.raceList = {
    {race = Character.human, typeOf = "sentient"},
    {race = Character.dwarf, typeOf = "sentient"},
    {race = Character.halfling, typeOf = "sentient"},
    {race = Character.elf, typeOf = "sentient"},
    {race = Character.orc, typeOf = "sentient"},
    {race = Character.lizardman, typeOf = "sentient"},
    {race = Character.forestTroll, typeOf = "sentient"},
    {race = Character.mummy, typeOf = "undead"},
    {race = Character.skeleton, typeOf = "undead"},
    {race = Character.floatingEye, typeOf = "sentient"},
    {race = Character.sheep, typeOf = "animal"},
    {race = Character.spider, typeOf = "animal"},
    {race = Character.pig, typeOf = "animal"},
    {race = Character.wasp, typeOf = "animal"},
    {race = Character.golem, typeOf = "sentient"},
    {race = Character.cow, typeOf = "animal"},
    {race = Character.wolf, typeOf = "animal"},
    {race = Character.bear, typeOf = "animal"},
    {race = Character.raptor, typeOf = "animal"},
    {race = Character.zombie, typeOf = "undead"},
    {race = Character.hellhound, typeOf = "animal"},
    {race = Character.imp, typeOf = "sentient"},
    {race = Character.ironGolem, typeOf = "sentient"},
    {race = Character.ratman, typeOf = "sentient"},
    {race = Character.dog, typeOf = "animal"},
    {race = Character.beetle, typeOf = "animal"},
    {race = Character.fox, typeOf = "animal"},
    {race = Character.slime, typeOf = "animal"},
    {race = Character.chicken, typeOf = "animal"},
    {race = Character.boneDragon, typeOf = "undead"},
    {race = Character.rat, typeOf = "animal"},
    {race = Character.fleshDragon, typeOf = "animal"},
    {race = Character.rabbit, typeOf = "animal"},
    {race = Character.akaltut, typeOf = "sentient"},
    {race = Character.fairy, typeOf = "sentient"},
    {race = Character.deer, typeOf = "animal"},
    {race = Character.ettin, typeOf = "sentient"}
}


local function CheckIftargetPriest(target)
    if target:getMagicType() == 1 then
        return true
    end
return false
end

local function CheckIftargetType(target, targetType)
local targetRace = target:getRace()
    for _, race in pairs(M.raceList) do
        if race.race == targetRace then
            if race.typeOf == targetType then
                return true
            end
        end
    end
return false
end

function M.checkIfRaceBonus(target, rune)
local targetType
    if rune == "Taur" then
        targetType = "sentient"
    elseif rune == "Ura" then
        targetType = "animal"
    elseif rune == "Yeg" then
        targetType = "undead"
    end
return CheckIftargetType(target, targetType)
end


local function checkForDamageRunes(target, spell, element, DoT, earthTrap)
local RA = runes.checkSpellForRuneByName("RA", spell)
local damage = 0
local list
    if DoT then
        list = damageOverTimeList
    else
        list = damageList
    end
    for _, rune in pairs(list) do
        if rune.element == element and runes.checkSpellForRuneByName(rune.rune, spell) then
            if rune.rune == "Luk" and RA then
                if CheckIftargetPriest(target) then
                    damage = damage + rune.damage
                end
            elseif rune.rune == "Taur" then
                if CheckIftargetType(target, "sentient") then
                    damage = damage + rune.damage
                end
            elseif rune.rune == "Ura" then
                if CheckIftargetType(target, "animal") then
                    damage = damage + rune.damage
                end
            elseif rune.rune == "Yeg" then
                if CheckIftargetType(target, "undead") then
                    damage = damage + rune.damage
                end
            else
                damage = damage + rune.damage
            end
        end
    end
return damage
end

function M.getMagicDamage(user, spell, element, target, DoT, Orl, earthTrap)
local damage = checkForDamageRunes(target, spell, element, DoT)
local magicResist
local magicPen
    if not earthTrap then
        magicPen = MP.getMagicPenetration(user, element, spell)
        damage = checkForDamageRunes(target, spell, element, DoT)
    else
        magicPen = earthTrap:getData("magicPenetration")
    end
local finalDamage = 0
local illusion = runes.checkSpellForRuneByName("Lhor", spell)
local playerOrMonster = target:getType()

    if illusion then
        finalDamage = 0
    elseif playerOrMonster == Character.player then
        magicResist = MR.getMagicResistance(target, spell)
        finalDamage = damage*(1+magicPen-magicResist)
    elseif playerOrMonster == Character.monster then
        finalDamage = damage*(1+(magicPen/2))
    end
    if runes.checkSpellForRuneByName("Sul",spell) then
        finalDamage = finalDamage*1.1 --10% damage increase
    end
local Taur = runes.checkSpellForRuneByName("Taur", spell)
local Ura = runes.checkSpellForRuneByName("Ura", spell)
local Yeg = runes.checkSpellForRuneByName("Yeg", spell)
local JUS = runes.checkSpellForRuneByName("JUS", spell)
local rune
    if Taur then
        rune = "Taur"
    elseif Ura then
        rune = "Ura"
    elseif Yeg then
        rune = "Yeg"
    end
local raceBonus
    if rune then
        raceBonus = M.checkIfRaceBonus(target, rune)
    end
    if raceBonus and JUS then
        finalDamage = finalDamage*2
    end
    if Orl and JUS then
        finalDamage = finalDamage/2
    end
    if finalDamage > 4444 then
        finalDamage = 4444 -- Should take at least three shots to kill someone
    end
    finalDamage = math.floor(finalDamage)
return finalDamage
end

return M

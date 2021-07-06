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
{rune = "JUS", damage = 500, element = "Air"},
{rune = "RA", damage = 1000, element = "Fire"},
{rune = "SOLH", damage = 500, element = "Earth"},
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
    {race = 0, name = "human", typeOf = "sentient"},
    {race = 1, name = "dwarf", typeOf = "sentient"},
    {race = 2, name = "halfling", typeOf = "sentient"},
    {race = 3, name = "elf", typeOf = "sentient"},
    {race = 4, name = "orc", typeOf = "sentient"},
    {race = 5, name = "lizardman", typeOf = "sentient"},
    {race = 9, name = "forestTroll", typeOf = "sentient"},
    {race = 10, name = "mummy", typeOf = "undead"},
    {race = 11, name = "skeleton", typeOf = "undead"},
    {race = 12, name = "floatingEye", typeOf = "sentient"},
    {race = 18, name = "sheep", typeOf = "animal"},
    {race = 19, name = "spider", typeOf = "animal"},
    {race = 24, name = "pig", typeOf = "animal"},
    {race = 27, name = "wasp", typeOf = "animal"},
    {race = 30, name = "golem", typeOf = "sentient"},
    {race = 37, name = "cow", typeOf = "animal"},
    {race = 39, name = "wolf", typeOf = "animal"},
    {race = 51, name = "bear", typeOf = "animal"},
    {race = 52, name = "raptor", typeOf = "animal"},
    {race = 53, name = "zombie", typeOf = "undead"},
    {race = 54, name = "hellhound", typeOf = "animal"},
    {race = 55, name = "imp", typeOf = "sentient"},
    {race = 56, name = "ironGolem", typeOf = "sentient"},
    {race = 57, name = "ratman", typeOf = "sentient"},
    {race = 58, name = "dog", typeOf = "animal"},
    {race = 59, name = "beetle", typeOf = "animal"},
    {race = 60, name = "fox", typeOf = "animal"},
    {race = 61, name = "slime", typeOf = "animal"},
    {race = 62, name = "chicken", typeOf = "animal"},
    {race = 63, name = "boneDragon", typeOf = "undead"},
    {race = 111, name = "rat", typeOf = "animal"},
    {race = 112, name = "fleshDragon", typeOf = "animal"},
    {race = 113, name = "rabbit", typeOf = "animal"},
    {race = 114, name = "akaltut", typeOf = "sentient"},
    {race = 115, name = "fairy", typeOf = "sentient"},
    {race = 116, name = "deer", typeOf = "animal"},
    {race = 117, name = "ettin", typeOf = "sentient"}
}
local function CheckIftargetPriest(target)
    if target.getMagicType() == 1 then
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
local function checkForDamageRunes(user, target, spell, element, DoT)
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

function M.getMagicDamage(user, spell, element, target, DoT, playerOrMonster)
local damage
local magicResist
local magicPen
local finalDamage
local illusion = runes.checkSpellForRuneByName("Lhor", spell)
local teaching = runes.checkSpellForRuneByName("Bhona", spell)
    if illusion or teaching then
        finalDamage = 0
    elseif playerOrMonster == Character.player then
        damage = checkForDamageRunes(user, target, spell, element, DoT)
        magicResist = MR.getMagicResistance(target, spell)
        magicPen = MP.getMagicPenetration(user, element, spell)
        finalDamage = damage*(1+magicPen-magicResist)
    elseif playerOrMonster == Character.monster then
        damage = checkForDamageRunes(user, target, spell, element, DoT)
        magicPen = MP.getMagicPenetration(user, element, spell)
        finalDamage = damage*(1+(magicPen/2))
    end
    if runes.checkSpellForRuneByName("Sul",spell) then
        finalDamage = finalDamage*1.1 --10% damage increase
    end
    if finalDamage > 4444 then
        finalDamage = 4444 -- Should take at least three shots to kill someone
    end
return finalDamage
end

return M

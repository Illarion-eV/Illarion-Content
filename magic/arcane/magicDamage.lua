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
{rune = "Pherc", damage = 500, element = "Air"},
{rune = "Pherc", damage = 500, element = "Earth"},
{rune = "Qwan", damage = 2000, element = "Fire"},
{rune = "Luk", damage = 1000, element = "Fire"},
{rune = "Taur", damage = 500, element = "Fire"},
{rune = "Ura", damage = 500, element = "Fire"},
{rune = "Yeg", damage = 500, element = "Fire"}

}
local damageOverTimeList = {
{rune = "Pherc", damage = 500, element = "Fire"},
{rune = "CUN", damage = 500, element = "Water"},
{rune = "Pherc", damage = 500, element = "Water"},
{rune = "Qwan", damage = 1500, element = "Water"},
{rune = "Taur", damage = 250, element = "Water"},
{rune = "Ura", damage = 250, element = "Water"},
{rune = "Yeg", damage = 250, element = "Water"}
}
local raceList = {
{race = "human", typeOf = "sentient"},
{race = "dwarf", typeOf = "sentient"},
{race = "halfling", typeOf = "sentient"},
{race = "elf", typeOf = "sentient"},
{race = "orc", typeOf = "sentient"},
{race = "lizardman", typeOf = "sentient"},
{race = "gnome", typeOf = "sentient"},
{race = "troll", typeOf = "sentient"},
{race = "mumie", typeOf = "undead"},
{race = "skeleton", typeOf = "undead"},
{race = "beholder", typeOf = "sentient"},
{race = "blackbeholder", typeOf = "sentient"},
{race = "transparentbeholder", typeOf = "sentient"},
{race = "brownmummy", typeOf = "undead"},
{race = "bluemummy", typeOf = "undead"},
{race = "sheep", typeOf = "animal"},
{race = "spider", typeOf = "animal"},
{race = "demonskeleton", typeOf = "undead"},
{race = "redspider", typeOf = "animal"},
{race = "greenspider", typeOf = "animal"},
{race = "bluespider", typeOf = "animal"},
{race = "pig", typeOf = "animal"},
{race = "boar", typeOf = "animal"},
{race = "transparentspider", typeOf = "animal"},
{race = "wasp", typeOf = "animal"},
{race = "redwasp", typeOf = "animal"},
{race = "stonegolem", typeOf = "sentient"},
{race = "brownstonegolem", typeOf = "sentient"},
{race = "redstonegolem", typeOf = "sentient"},
{race = "silverstonegolem", typeOf = "sentient"},
{race = "transparentstonegolem", typeOf = "sentient"},
{race = "cow", typeOf = "animal"},
{race = "bull", typeOf = "animal"},
{race = "wolf", typeOf = "animal"},
{race = "transparentwolf", typeOf = "animal"},
{race = "blackwolf", typeOf = "animal"},
{race = "greywolf", typeOf = "animal"},
{race = "redwolf", typeOf = "animal"},
{race = "redraptor", typeOf = "animal"},
{race = "silverbear", typeOf = "animal"},
{race = "blackbear", typeOf = "animal"},
{race = "bear", typeOf = "animal"},
{race = "raptor", typeOf = "animal"},
{race = "zombie", typeOf = "undead"},
{race = "hellhound", typeOf = "animal"},
{race = "imp", typeOf = "sentient"},
{race = "irongolem", typeOf = "sentient"},
{race = "ratman", typeOf = "sentient"},
{race = "dog", typeOf = "animal"},
{race = "beetle", typeOf = "animal"},
{race = "fox", typeOf = "animal"},
{race = "slime", typeOf = "animal"},
{race = "chicken", typeOf = "animal"},
{race = "bonedragon", typeOf = "undead"},
{race = "blackbonedragon", typeOf = "undead"},
{race = "redbonedragon", typeOf = "undead"},
{race = "transparentbonedragon", typeOf = "undead"},
{race = "greenbonedragon", typeOf = "undead"},
{race = "bluebonedragon", typeOf = "undead"},
{race = "goldbonedragon", typeOf = "undead"},
{race = "redmummy", typeOf = "undead"},
{race = "greymummy", typeOf = "undead"},
{race = "blackmummy", typeOf = "undead"},
{race = "goldmummy", typeOf = "undead"},
{race = "transparentskeleton", typeOf = "undead"},
{race = "blueskeleton", typeOf = "undead"},
{race = "greenskeleton", typeOf = "undead"},
{race = "goldgolem", typeOf = "sentient"},
{race = "goldskeleton", typeOf = "undead"},
{race = "bluetroll", typeOf = "sentient"},
{race = "blacktroll", typeOf = "sentient"},
{race = "redtroll", typeOf = "sentient"},
{race = "blackzombie", typeOf = "undead"},
{race = "transparentzombie", typeOf = "undead"},
{race = "redzombie", typeOf = "undead"},
{race = "blackhellhound", typeOf = "animal"},
{race = "transparenthellhound", typeOf = "animal"},
{race = "greenhellhound", typeOf = "animal"},
{race = "redhellhound", typeOf = "animal"},
{race = "redimp", typeOf = "sentient"},
{race = "blackimp", typeOf = "sentient"},
{race = "blueirongolem", typeOf = "sentient"},
{race = "redratman", typeOf = "sentient"},
{race = "greenratman", typeOf = "sentient"},
{race = "blueratman", typeOf = "sentient"},
{race = "reddog", typeOf = "animal"},
{race = "greydog", typeOf = "animal"},
{race = "blackdog", typeOf = "animal"},
{race = "greenbeetle", typeOf = "animal"},
{race = "copperbeetle", typeOf = "animal"},
{race = "redbeetle", typeOf = "animal"},
{race = "goldbeetle", typeOf = "animal"},
{race = "greyfox", typeOf = "animal"},
{race = "redslime", typeOf = "animal"},
{race = "blackslime", typeOf = "animal"},
{race = "transparentslime", typeOf = "animal"},
{race = "brownchicken", typeOf = "animal"},
{race = "redchicken", typeOf = "animal"},
{race = "blackchicken", typeOf = "animal"}
}
local function CheckIfTargetPriest(Target)
    if Target.getMagicType() == 1 then
        return true
    end
return false
end
local function CheckIfTargetType(Target, targetType)
targetRace = Target:getRace()
    for _, race in pairs(raceList) do
        if race.race == targetRace then
            if race.typeOf == targetType then
                return true
            end
        end
    end
return false
end
local function checkForDamageRunes(User, Target, spell, element, DoT)
local damage = 0
local list
    if DoT then
        list = damageOverTimeList
    else
        list = damageList
    end
    for _, rune in pairs(damageList) do
        if rune.element == element and runes.checkSpellForRuneByName(User, rune.rune, spell) then
            if rune.rune == "Luk" then
                if CheckIfTargetPriest(Target) then
                    damage = damage + rune.damage
                end
            elseif rune.rune == "Taur" then
                if CheckIfTargetType(Target, "sentient") then
                    damage = damage + rune.damage
                end
            elseif rune.rune == "Ura" then
                if CheckIfTargetType(Target, "animal") then
                    damage = damage + rune.damage
                end
            elseif rune.rune == "Yeg" then
                if CheckIfTargetType(Target, "undead") then
                    damage = damage + rune.damage
                end
            else
                damage = damage + rune.damage
            end
        end
    end
return damage
end
           

local function CheckForIllusion(User, spell)
    if runes.checkSpellForRuneByName(User, "Lhor", spell) then
        return true
    end
return false
end
function M.getMagicDamage(User, spell, element, Target, DoT)
local damage
local magicResist
local magicPen
local finalDamage
    if CheckForIllusion(User, spell) then
        finalDamage = 0
    else
        damage = checkForDamageRunes(User, Target, spell, element, DoT)
        magicResist = MR.getMagicResistance(Target)
        magicPen = MP.getMagicPenetration(User, element, spell)
        finalDamage = damage*(1+magicPen-magicResist)
    end
return finalDamage
end

return M
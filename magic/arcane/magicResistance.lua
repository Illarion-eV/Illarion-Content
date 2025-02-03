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
local M = {}
local runes = require("magic.arcane.runes")
local common = require("base.common")
local magic = require("base.magic")

local function getSkillValue(target)
    local skill = Character["magicResistance"]
    local skillValue = target:getSkill(skill)
    return skillValue
end

local function getBonus(target)

    local willpower = target:increaseAttrib("willpower", 0)

    local baseBonus = 0.3 -- A level 100 magic resistance will have at least 30% resistance, up to 50% due to clothes and then the remaining 50% is obtainable from the willpower stat

    local statBonus =  common.GetAttributeBonusHigh(willpower)/2 -- 22 willpower(potion) would give about 0.3, 25 willpower(potion and unique food) 0.38,  while 15 willpower about 0.12, 30 willpower gives 0.5

    local equipmentBonus = magic.getMagicBonus(target) -- caps out at 0.2. Best possible jewellery and clothing caps out at 0.2596, so this gives some leeway in terms of fashion by capping it at 0.2

    local totalBonus = statBonus + equipmentBonus + baseBonus

    return math.min(totalBonus, 1)

    --Realistically the cap with unique food (very rare to get) and +4 potion buff to willpower, you can get up to 88% resistance, which can be cancelled out by a mage with similar buffs and a level 100 monster will deal 12% extra damage regardless as their penetration would be 100%

end






function M.getMagicResistance(target, spell) --Returns a percentage of how much magic damage to reduce

    local magicResistance

    local playerOrMonster = target:getType()

    local skill = getSkillValue(target)

    if playerOrMonster == Character.player then

        local bonus = getBonus(target)

        magicResistance = skill*bonus -- This will almost always reduce the skill, and never increase it as the max is 1 (so a value of 100 is max)

    elseif playerOrMonster == Character.monster then

        magicResistance = skill*2

    end

    --[[
        A max value of 100 magic resistance for players, that gets put against the max value of 100 magic penetration a mage can have.
        A mage can additionally get an advantage, at a cost, by using Sav to reduce magic resistance by 10% before the match up.
        This means if both have a value of 100 (very unlikely, but in theory possible) but the mage uses SAV, the opponent takes more damage.
        A max value of 200 magic resistance for mobs. Above 100 makes them delete static flames.
        This needs to be taken into consideration when changing the monsters magic resistance in the database, as 1 level equals 2 for monsters.
        This in practice allows us to have mobs that are immune to magic of certain levels.
        EG:
        Level 110 magic resistance mob versus a 22 willpower mage with level 100 fire magic will take 30% reduced damage.
        The same mob versus a 22 willpower mage with level 50 fire magic will take 70% reduced damage.
        The same mob versus a 22 willpower mage with level 12 fire magic will take no damage!
        The same mob versus a 15 willpower mage with level 100 fire magic will take 66% reduced damage.
        The same mob versus a 15 willpower mage with level 50 fire magic will take 88% reduced damage.
        The same mob versus a 15 willpower mage with level 22 fire magic will take no damage.
        Add Sav to that and suddenly the level 110 mob versus a 22 willpower level 100 mage takes 19% reduced damage instead,
        with Sav getting stronger the higher the magic resistance of the target.
        A level 200 magic resistance mob veruss a 22 willpower mage? 120% reduced damage!
        With Sav? 100% reduced damage!
        This means a level 200 magic resistance mob can only be damaged by mages above 22 willpower, and even then it will be very low damage,
        which is basically just a magic immune mob at that point.
    ]]

    if spell and runes.checkSpellForRuneByName("Sav", spell) and not runes.checkSpellForRuneByName("JUS", spell) and not runes.checkSpellForRuneByName("PEN", spell) then --magic penetration
        magicResistance = math.floor(magicResistance*0.9) --up to 10% magic penetration when Sav is applied to fire, water or earth spells
    end

    return magicResistance

end

return M

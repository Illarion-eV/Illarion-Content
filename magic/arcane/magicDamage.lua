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
local magic = require("base.magic")
local MR = require("magic.arcane.magicResistance")
local MP = require("magic.arcane.magicPenetration")
local runes = require("magic.arcane.runes")

local M = {}

local damageList = {
    --The listed damage is what a perfect mage will deal before magic penetration/ magic resistance takes effect
    -- This means that against a target with no magic resistance, if you have max magic penetration, you will deal double.
    -- Against a target with full magic resistance when you have full magic penetration, you deal the stated damage
    -- Against a target with full magic resistance when you have no magic penetration(level 0 of the relevant magic skill) you deal no damage

    {rune = "RA", damage = 1500, element = "Fire"},
    {rune = "Pherc", damage = 2250, element = "Water"},
    {rune = "Pherc", damage = 2250, element = "Air"},
    {rune = "Pherc", damage = 2250, element = "Earth"},
    {rune = "Qwan", damage = 3000, element = "Fire"},
    {rune = "Luk", damage = 2250, element = "Fire"},
    {rune = "Taur", damage = 2250, element = "Fire"},
    {rune = "Ura", damage = 2250, element = "Fire"},
    {rune = "Yeg", damage = 2250, element = "Fire"},
    {rune = "Sul", damage = 2250, element = "Fire"}
}

local damageOverTimeList = { --This damage is balanced around DoTs having 5 ticks that it is spread out over.
    {rune = "Pherc", damage = 2250, element = "Fire"},
    {rune = "CUN", damage = 1500, element = "Water"},
    {rune = "Qwan", damage = 3000, element = "Water"},
    {rune = "Taur", damage = 2250, element = "Water"},
    {rune = "Ura", damage = 2250, element = "Water"},
    {rune = "Yeg", damage = 2250, element = "Water"}
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

    if string.find(target.name, "priest") then
        --it is a priest mob
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

local function hasDamageRuneOfSize(spell, cost, element, DoT)

    local list = damageList

    if DoT then
        list = damageOverTimeList
    end

    for _, rune in pairs(list) do
        if rune.element == element then
            for _, rune2 in pairs(runes.runes) do
                if rune2.name == rune.name then
                    if rune.cost == cost then
                        return true
                    end
                end
            end
        end
    end

    return false

end

function M.getBonus(user, elementBonus)

    local intelligence = user:increaseAttrib("intelligence", 0) -- Intelligence scales damage directly, while essence scales how often you can cast and willpower how much magic defense you can ignore

    local statBonus =  common.GetAttributeBonusHigh(intelligence)

    local wandQualityBonus = magic.getQualityBonusWand(user) -- A perfect wand equals a bonus of 0.1

    local totalBonus = statBonus + wandQualityBonus + elementBonus -- Best element bonus is 0.1

    --There is no gem bonus for wands here or equipment bonus because that is handled by magic penetration, allowing magic gems in cloaks to cancel out magic gems in wands similar to how fighting works.

    return math.min(totalBonus, 1) -- With 22 int, a perfect and correct element wand, you'd reach 0.8 leaving 0.2 for stat potions and food to achieve

end

function M.crit(user, value)

    local perception = user:increaseAttrib("perception", 0)

    local statBonus =  common.GetAttributeBonusHigh(perception)

    local rand = math.random()

    if statBonus >= rand then
        return value*1.5 --If you crit, 50% bonus
    end

    return value

end

local function constitutionImpact(target, damage)

    local constitution = target:increaseAttrib("constitution", 0)

    local statBonus =  common.GetAttributeBonusHigh(constitution)

    --Fighting uses Globals.Damage * 14 / Defender.constitution, for reference

    local maximumDamage = 4 -- Up to 400% increase to the damage

    local MaxDecrease = 4.5 -- Up to 50% decrease to the damage

    local increase = 1 + (maximumDamage - statBonus*MaxDecrease) -- at max values this would be 1 + (4 - 1*4.5) aka 1 + -0.5 aka 0.5

    return damage*increase
end




function M.getMagicDamage(user, spell, element, target, DoT, Orl, earthTrap)

    local damage = checkForDamageRunes(target, spell, element, DoT)
    local magicResist
    local magicPen
    local elementBonus
    local wandGemBonus
    local cloakGemBonus = magic.getGemBonusCloak(target)/100 -- tier 5 set is 30%, tier 10 60%

    if not earthTrap then
        magicPen = MP.getMagicPenetration(user, element, spell)
        elementBonus = magic.checkElementBonus(user, element)
        wandGemBonus = magic.getGemBonusWand(user)/100 -- tier 5 set is 30%, tier 10 60%
    else
        magicPen = earthTrap:getData("magicPenetration")
        elementBonus = earthTrap:getData("elementBonus")
        wandGemBonus = earthTrap:getData("gemBonus")
    end

    local bonus = M.getBonus(user, elementBonus) --Max bonus is 1

    damage = damage*bonus

    damage = M.crit(user, damage) -- Critical strike chance based on perception stat and rng, 50% increase in damage if crit

    local finalDamage = 0
    local illusion = runes.checkSpellForRuneByName("Lhor", spell)
    local playerOrMonster = target:getType()

    if playerOrMonster ~= Character.npc and not illusion then
        magicResist = MR.getMagicResistance(target, spell)
        local diff = math.max(-1, magicPen/100-magicResist/100) -- We don't want magic spells to heal the opponent if the magic resist is too high.

        if diff == -1 and user then
            user:inform("Der magische Widerstand deines Ziels ist so hoch, dass dein Zauber einfach verschwand, als er damit in Berührung kam!", "Your target's magic resistance is so high that your spell simply disappeared upon coming into contact with it!")
        end

        finalDamage = damage*(1+diff)
    end

    if runes.checkSpellForRuneByName("Sul",spell) then
        finalDamage = finalDamage*1.5 -- 50% damage increase
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

    finalDamage = constitutionImpact(target, finalDamage) -- From -50% to +400% damage based on target constitution

    -- Lastly we check magic gems that, just like in fighting, increase/decrease the final damage by a % after cancelling each other out

    finalDamage = finalDamage * (1 + wandGemBonus-cloakGemBonus)


    local maxDamage = 1999

    local hasMediumDamageRune = hasDamageRuneOfSize(spell, "Medium", element, DoT)

    local hasLargeDamageRune = hasDamageRuneOfSize(spell, "Large", element, DoT)

    if hasMediumDamageRune and hasLargeDamageRune then
        maxDamage = 4999
    elseif hasMediumDamageRune then
        maxDamage = 2999
    elseif hasLargeDamageRune then
        maxDamage = 3999
    end

    if DoT then
        maxDamage = 999 -- Damage if the spell has both medium and large damage runes

        if not hasLargeDamageRune then
            maxDamage = 599 -- Damage for only medium
        end

        if hasLargeDamageRune and not hasMediumDamageRune then
            maxDamage = 799 -- Damage for only large
        end

        if not hasLargeDamageRune and not hasMediumDamageRune then
            maxDamage = 399 -- Base damage
        end

    end

    if finalDamage > maxDamage then
        finalDamage = maxDamage
    end

    finalDamage = math.floor(finalDamage)

    return finalDamage
end

return M

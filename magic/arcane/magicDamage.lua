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

    {rune = "RA", damage = 500, element = "Fire"},
    {rune = "IRA", damage = 200, element = "Fire"}, --With IRA the damage is converted to mana damage instead of health
    {rune = "KAH", damage = 200, element = "Fire"}, --With IRA the damage is converted to mana damage instead of health
    {rune = "PHERC", damage = 400, element = "Water"},
    {rune = "PHERC", damage = 800, element = "Air"}, -- As the only damaging rune for wind spells, 800 puts the damage right below RA in terms of DPS as fire spells are still meant to be the primary source of direct damage
    {rune = "PHERC", damage = 800, element = "Earth"}, -- As the only damaging rune for earth spells, 800 puts the damage right below RA in terms of DPS as fire spells are still meant to be the primary source of direct damage
    {rune = "QWAN", damage = 600, element = "Fire"},
    {rune = "LUK", damage = 400, element = "Fire"},
    {rune = "TAUR", damage = 400, element = "Fire"},
    {rune = "URA", damage = 400, element = "Fire"},
    {rune = "YEG", damage = 400, element = "Fire"}
}

local damageOverTimeList = { --This damage is balanced around DoTs having 15 ticks that it is spread out over. So you would want to start with a DoT before moving onto direct damage spells when fighting high level opponents
    {rune = "PHERC", damage = 500, element = "Fire"},
    {rune = "IRA", damage = 375, element = "Water"}, --Damage gets converted to mana damage
    {rune = "KAH", damage = 375, element = "Water"}, --Damage gets converted to stamina damage
    {rune = "CUN", damage = 600, element = "Water"},
    {rune = "QWAN", damage = 900, element = "Water"},
    {rune = "TAUR", damage = 600, element = "Water"},
    {rune = "URA", damage = 600, element = "Water"},
    {rune = "YEG", damage = 600, element = "Water"}
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

    if rune == "TAUR" then
        targetType = "sentient"
    elseif rune == "URA" then
        targetType = "animal"
    elseif rune == "YEG" then
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
            if rune.rune == "LUK" and RA then
                if CheckIftargetPriest(target) then
                    damage = damage + rune.damage
                end
            elseif rune.rune == "TAUR" then
                if CheckIftargetType(target, "sentient") then
                    damage = damage + rune.damage
                end
            elseif rune.rune == "URA" then
                if CheckIftargetType(target, "animal") then
                    damage = damage + rune.damage
                end
            elseif rune.rune == "YEG" then
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

function M.getEquipmentImpact(user, elementBonus)

    return magic.getQualityBonusWand(user) + elementBonus
end

function M.intImpact(user)

    local intelligence = user:increaseAttrib("intelligence", 0)

    local statBonus =  common.GetAttributeBonusHigh(intelligence)

    return statBonus

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

function M.resistanceAndPenetrationImpact(resist, penetration, damage)

    if damage < 0 then
        return 0
    end

    return math.max(0, damage*(1- resist + penetration)) -- never return negative values
end

function M.getMagicDamage(user, spell, element, target, DoT, ORL, earthTrap, castDuration)

    if not isValidChar(target) then
        return false
    end

    local baseDamage = checkForDamageRunes(target, spell, element, DoT)
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

    local damage = baseDamage*(1+M.intImpact(user)+M.getEquipmentImpact(user, elementBonus))

    damage = M.crit(user, damage) -- Critical strike chance based on perception stat and rng, 50% increase in damage if crit

    local finalDamage = 0
    local illusion = runes.checkSpellForRuneByName("LHOR", spell)
    local playerOrMonster = target:getType()

    if playerOrMonster ~= Character.npc and not illusion then
        magicResist = MR.getMagicResistance(target, spell)
        finalDamage = M.resistanceAndPenetrationImpact(magicResist, magicPen, damage)
    end

    if runes.checkSpellForRuneByName("SUL",spell) then
        finalDamage = finalDamage*1.5 -- 50% damage increase
    end

    local TAUR = runes.checkSpellForRuneByName("TAUR", spell)
    local URA = runes.checkSpellForRuneByName("URA", spell)
    local YEG = runes.checkSpellForRuneByName("YEG", spell)
    local JUS = runes.checkSpellForRuneByName("JUS", spell)
    local rune

    if TAUR then
        rune = "TAUR"
    elseif URA then
        rune = "URA"
    elseif YEG then
        rune = "YEG"
    end

    local raceBonus

    if rune then
        raceBonus = M.checkIfRaceBonus(target, rune)
    end

    if raceBonus and JUS then
        finalDamage = finalDamage*2
    end

    if ORL and JUS then
        finalDamage = finalDamage/2
    end

    -- Lastly we check magic gems that, just like in fighting, increase/decrease the final damage by a % after cancelling each other out

    finalDamage = finalDamage * (1 + wandGemBonus-cloakGemBonus)


    local maxDamage = 10000 -- A full health bar, no damage cap in PvE



    local castTime = castDuration

    if user and user:getType() == Character.player and target and target:getType() == Character.player then

        local hasMediumDamageRune = hasDamageRuneOfSize(spell, "Medium", element, DoT)

        local hasLargeDamageRune = hasDamageRuneOfSize(spell, "Large", element, DoT)

        maxDamage  = 3000

        if hasMediumDamageRune and hasLargeDamageRune then -- The below ensures that higher level damage runes will still always have an advantage while also no chance of oneshotting players with a 7-second duration spell cast
            maxDamage = 4999
        elseif hasMediumDamageRune then
            maxDamage = 3888
        elseif hasLargeDamageRune then
            maxDamage = 4444
        end

        -- both user and target exist and both are players, this is a pvp battle
        local secondsToKillInPvP = 7 -- in testing: 5 attacks with RA(7.5 seconds cast time), 4 to make them fall down then a last to finish them off
        local maxHealth = 10000
        local maxDamagePerSecond = maxHealth/secondsToKillInPvP
        maxDamage = math.min(maxDamage, (castTime/10*maxDamagePerSecond)) --This only impacts cases where there is an extreme power difference in pvp
    end

    if finalDamage > maxDamage then
        finalDamage = maxDamage
    end

    finalDamage = math.floor(finalDamage)

    finalDamage = math.max(0, finalDamage) -- just in case it ends up healing someone because the damage went into the negatives

    return finalDamage
end

return M

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

--[[
UPDATE weapon SET wp_attack = 44, wp_accuracy = 74, wp_range = 5 WHERE wp_itemid = 2785;
UPDATE weapon SET wp_attack = 44, wp_accuracy = 74, wp_range = 5 WHERE wp_itemid = 2784;
UPDATE weapon SET wp_attack = 44, wp_accuracy = 74, wp_range = 5 WHERE wp_itemid = 2783;
UPDATE weapon SET wp_attack = 44, wp_accuracy = 74, wp_range = 5 WHERE wp_itemid = 2782;
UPDATE weapon SET wp_attack = 44, wp_accuracy = 74, wp_range = 5 WHERE wp_itemid = 3608;
UPDATE weapon SET wp_attack = 29, wp_accuracy = 70, wp_range = 5 WHERE wp_itemid = 323;
]]

local M = {}
local MAGIC_LOAD_LIST = {}
local ELEMENTS = {["NONE"] = 0, ["AIR"] = 1, ["EARTH"] = 2, ["WATER"] = 3, ["SPIRIT"] = 4, ["FIRE"] = 5}
local STAFF_ELEMENTS = {[2785] = ELEMENTS.AIR, [2783] = ELEMENTS.FIRE,
                        [2784] = ELEMENTS.WATER, [3608] = ELEMENTS.SPIRIT,
                        [2782] = ELEMENTS.EARTH, [323] = ELEMENTS.NONE}

local common = require("base.common")
local character = require("base.character")
local fightingutil = require("base.fightingutil")
local globalvar = require("base.globalvar")
local magic = require("base.magic")
local chr_reg = require("lte.chr_reg")
local hydor = require("magic.arcane.enchanting.effects.hydor")
local tan = require("magic.arcane.enchanting.effects.tan")
local chous = require("magic.arcane.enchanting.effects.chous")
local coeden = require("magic.arcane.enchanting.effects.coeden")
local hieros = require("magic.arcane.enchanting.effects.hieros")
local dendron = require("magic.arcane.enchanting.effects.dendron")
local ysbryd = require("magic.arcane.enchanting.effects.ysbryd")
local dwyfol = require("magic.arcane.enchanting.effects.dwyfol")

local function getNeededMana(castTime)
    return math.ceil(80 + (castTime-7)*20)
end

local function calculateCastTime(attackerStruct)
    local weaponPoints = attackerStruct.Weapon.ActionPoints
    local skill = attackerStruct.skill
    local globalSpeedMod = 100

    return math.ceil(math.max(7, weaponPoints * (100 - (attackerStruct.willpower-6)*2.5 - skill/5)/globalSpeedMod))
end

local function checkBlockedAttack(attackerStruct, defenderStruct)
    local attackerWillpower = attackerStruct.willpower
    local defenderWillpower = defenderStruct.willpower

    local magicBlockChance = 1.5
    local chance = magicBlockChance * (1 + (defenderWillpower - attackerWillpower)/40)
    return common.Chance(chance, 100)
end

local function checkMissedAttack(attackerStruct)
    local accuracy = common.Limit(attackerStruct.Weapon.Accuracy * 1.25, 5, 95)
    local healthInPercent = attackerStruct.Char:increaseAttrib("hitpoints", 0) / 10000 --10k is maxhealth

    -- Low willpower will lower the hitchance with staffs, while high willpower will enhance item
    -- Damage in health will lower the concentration and therefore the attack is likely to miss
    local chance = accuracy*healthInPercent + (attackerStruct.willpower-5)*2
    chance = 100 - common.Limit(chance, 5, 95)

    return common.Chance(chance, 100)
end

local function initiateList(attacker)
    MAGIC_LOAD_LIST[attacker.id] = {}
end

local function update(attacker, defender, attackerStruct)
    MAGIC_LOAD_LIST[attacker.id]["started"] = world:getTime("unix")
    MAGIC_LOAD_LIST[attacker.id]["weapon"] = attackerStruct.WeaponItem.id
    MAGIC_LOAD_LIST[attacker.id]["target"] = defender.id
    MAGIC_LOAD_LIST[attacker.id]["position"] = attacker.pos.x.." "..attacker.pos.y.." "..attacker.pos.z
end

local function isMagicAttackLoaded(attackerStruct, defender, neededCastTime)
    local attacker = attackerStruct["Char"]
    local mageLoad = MAGIC_LOAD_LIST[attacker.id]

    -- Check if the player has changed his target/weapon/position or if he attacks for the first time
    local firstTime = mageLoad == nil

    if firstTime then -- no list exists
        initiateList(attacker)
        update(attacker, defender, attackerStruct)
        return false
    end

    local weaponChanged = attackerStruct.WeaponItem.id ~= mageLoad["weapon"]
    local targetChanged = defender.id ~= mageLoad["target"]
    local positionChanged = attacker.pos.x.." "..attacker.pos.y.." "..attacker.pos.z ~= mageLoad["position"]

    if weaponChanged or targetChanged or positionChanged then --This way we update the timer, target, weapon and position but we keep Tan info
        update(attacker, defender, attackerStruct)
        return false
    end

    if not mageLoad["tanCheckedThisCycle"] then -- We only check once per cast
        if tan.reduceCastTime(attackerStruct.Char) then
            mageLoad["tan"] = true --The next cast gets reduced cast time, even if it happens far into the future as long as the table data is kept, this because otherwise the glyph will just get drained without ever casting if you dont finish the cast it procced for
        end
        mageLoad["tanCheckedThisCycle"] = true
    end

    if mageLoad["tan"] then
        neededCastTime = neededCastTime/2
    end

    -- Same reasonsing as in aiming time applies:
    -- We cannot check for the end of a fight but need to stop the start aiming, stop aiming, wait, attack immediately mechanic
    if (world:getTime("unix") - mageLoad["started"])*10 > neededCastTime + 20 then
        MAGIC_LOAD_LIST[attacker.id]["started"] = world:getTime("unix")
        return false
    end

    -- Check if we can shoot
    if (world:getTime("unix") - mageLoad["started"])*10 < neededCastTime then
        return false
    end

    -- Reset magicLoadTime if defender has run away or is blocked(!)
    if not fightingutil.checkRangeAndView(attackerStruct, defender) then
        MAGIC_LOAD_LIST[attacker.id]["started"] = world:getTime("unix")
        return false
    end

    return true
end

local function sfxGfxOutput(attackerStruct, defenderStruct, element)
    common.CreateLine(attackerStruct.Char.pos, defenderStruct.Char.pos, function(currentPos)
        local gfxId = 0
        if (currentPos == defenderStruct.Char.pos) then
            if (element == ELEMENTS.FIRE) then
                gfxId = 44
            elseif (element == ELEMENTS.AIR) then
                gfxId = 7
            elseif (element == ELEMENTS.WATER) then
                gfxId = 4
            elseif (element == ELEMENTS.EARTH) then
                gfxId = 5
            elseif (element == ELEMENTS.SPIRIT) then
                gfxId = 31
            end
        else
            gfxId = 1
        end
        world:gfx(gfxId, currentPos)
    end)

    world:makeSound(13, attackerStruct.Char.pos)
end

local function magicItemsDegrade(char, magicItemsList)

    for _, bonusItem in pairs(magicItemsList) do
        if (common.Chance(1, 180)) then
            local durability = math.fmod(bonusItem.quality, 100)
            local quality = (bonusItem.quality - durability) / 100
            local nameText = world:getItemName(bonusItem.id, char:getPlayerLanguage())

            if durability > 0 then
                durability = durability - 1
                if (durability == 0) then
                    common.InformNLS(char,
                        "Deine Ausrüstungsgegenstand '"..nameText.."' zerbricht.",
                        "Your piece of equipment '"..nameText.."' shatters.")
                end
                bonusItem.quality = quality * 100 + durability
                world:changeItem(bonusItem)
            end
        end
    end

end

local function applyDamage(attackerStruct, defenderStruct)

    -- damage boni
    local intBonus = 3.5 * (attackerStruct.intelligence - 6)
    local essenceBonus = 1.1 * (attackerStruct.essence - 6)
    local skillBonus = 1.75 * (attackerStruct.skill - 10)
    local qualityBonus = 0.91 + 0.02 * math.floor(attackerStruct.WeaponItem.quality/100) --ranges: 0.93 - 1.09
    local magicBonusAttacker, magicItemsAttacker = magic.getMagicBonus(attackerStruct.Char)
    magicBonusAttacker = magicBonusAttacker*1.5
    local globalDamageFactor = 1/180 -- mirrored from standardfighting

    -- base damage
    local damage = attackerStruct.Weapon.Attack * 35

    -- raw damage without defence
    damage = damage * globalDamageFactor * qualityBonus * (100 + intBonus + essenceBonus + skillBonus + magicBonusAttacker)
    local magicBonusDefender, magicItemsDefender = magic.getMagicBonus(defenderStruct.Char)
    local generalScalingFactor = 2.8
    magicBonusDefender = magicBonusDefender/generalScalingFactor

    damage = damage - (damage * magicBonusDefender/350)

    local resistance = math.max(1, math.floor(
        (2*(defenderStruct.willpower - 6)
        + 0.5*(defenderStruct.intelligence - 6)
        + 0.5*(defenderStruct.essence - 6))))
    resistance = common.Limit(Random.uniform(resistance, resistance*2) / 160.0, 0, 1)
    damage = damage* (1 - resistance)

   -- take consitution of enemy in account
    damage  = (damage * 7) / (defenderStruct.Char:increaseAttrib("constitution", 0))
    -- scale damage based on the level of the armour parts the mage wears
    --damage = damage*(1 - common.Scale(0, 0.5, averageArmourLevel(attackerStruct.Char))) -- deactived to remove malus

    -- limits for damage
    damage = math.max(0, damage)
    damage = damage * ((9+math.random())/10)
    damage = math.min(damage, 4999)
    damage = math.floor(damage)

    -- apply glyph effects

    dendron.lifesteal(attackerStruct.Char, damage) -- chance to heal for a portion of the damage you deal

    ysbryd.liferegen(defenderStruct.Char, damage) -- chance to heal for a portion of damage you are about to receive

    local hierosApplied, newDamage = hieros.increaseDamage(attackerStruct.Char, defenderStruct.Char, damage)

    if hierosApplied then   -- chance to apply extra damage on hit in the form of fire
        damage = newDamage
    end

    if dwyfol.deflectAttackAsLightning(defenderStruct.Char, attackerStruct.Char) then -- This glyph if activated deflects the attack, dealing the same amount they would have taken as magic damage to the attacker instead in the form of a lightning strike
        local storedDefender = defenderStruct.char
        defenderStruct.char = attackerStruct.char
        attackerStruct.char = storedDefender
    end

    -- inflict damage and check if character would die
    if character.IsPlayer(defenderStruct.Char) and character.WouldDie(defenderStruct.Char, damage + 1) then
        if character.AtBrinkOfDeath(defenderStruct.Char) then
            if defenderStruct.Char:isAdmin() then
                chr_reg.stallRegeneration(defenderStruct.Char, 0)
            end
            character.Kill(defenderStruct.Char)
        else
            -- Character would die.
            character.ToBrinkOfDeath(defenderStruct.Char)
            common.TalkNLS(defenderStruct.Char, Character.say, "#me geht zu Boden.", "#me falls to the ground.")

            if not defenderStruct.Char:isAdmin() then --Admins don't want to get paralysed!
                common.ParalyseCharacter(defenderStruct.Char, 2, false, true)
            end
            local timeFactor = 1 -- See lte.chr_reg
            chr_reg.stallRegeneration(defenderStruct.Char, 60 / timeFactor)
        end
    else
        -- Add check here for whether Dwyfol has activated to reduce the damage based on magic resistance when magic resistance is applied
        character.ChangeHP(defenderStruct.Char, -damage)
        chous.apply(attackerStruct.Char, defenderStruct.Char) --After being hit, this glyph has a chance to activate to teleport the attacker away from the defender
        coeden.apply(defenderStruct.Char, attackerStruct.Char) --After being hit, this glyph has a chance to activate to teleport the defender away from the attacker
    end

    magicItemsDegrade(defenderStruct.Char, magicItemsDefender)
    magicItemsDegrade(attackerStruct.Char, magicItemsAttacker)
end

function M.onMagicAttack(attackerStruct, defenderStruct)

    common.TurnTo(attackerStruct.Char,defenderStruct.Char.pos)

    attackerStruct["intelligence"] = attackerStruct.Char:increaseAttrib("intelligence", 0)
    attackerStruct["essence"] = attackerStruct.Char:increaseAttrib("essence", 0)
    attackerStruct["willpower"] = attackerStruct.Char:increaseAttrib("willpower", 0)

    local attributeSum = attackerStruct["intelligence"] + attackerStruct["essence"] + attackerStruct["willpower"]

    if attributeSum < 30 then
        return
    end

    local neededCastTime = calculateCastTime(attackerStruct)

    local manaNeeded = getNeededMana(neededCastTime)

    -- Any attack must preload a given time before he can be executed
    if not isMagicAttackLoaded(attackerStruct, defenderStruct.Char, neededCastTime) then
        return
    end

    -- An attack is executed, reset the waittime till the next attack
    if character.IsPlayer(attackerStruct.Char) then
        MAGIC_LOAD_LIST[attackerStruct.Char.id]["started"] = world:getTime("unix")
    end

    -- Handle mana usage
    attackerStruct["mana"] = attackerStruct.Char:increaseAttrib("mana", 0)
    local neededMana = magic.getValueWithGemBonus(attackerStruct.Char, manaNeeded)
    if (attackerStruct.mana < neededMana) then
        attackerStruct.Char:inform("Dein Mana reicht nicht aus", "Your mana is depleted")
        return
    end

    if hydor.reduceManaCost(attackerStruct.Char) then
        neededMana = neededMana/2
    end

    attackerStruct.Char:increaseAttrib("mana", -neededMana)

    attackerStruct.Char:performAnimation(globalvar.charAnimationSPELL)

    if checkMissedAttack(attackerStruct) then
        attackerStruct.Char:inform("Der Angriff gelingt nicht. Du hast kurz die Konzentration verloren.", "The attack fails. You briefly lost your concentration.", Player.lowPriority)
        return
    end

    common.CreateLine(attackerStruct.Char.pos, defenderStruct.Char.pos,
        function(currentPos)
            world:gfx(1, currentPos)
        end
    )

    defenderStruct = fightingutil.loadWeapons(defenderStruct)
    defenderStruct["intelligence"] = defenderStruct.Char:increaseAttrib("intelligence", 0)
    defenderStruct["willpower"] = defenderStruct.Char:increaseAttrib("willpower", 0)
    defenderStruct["essence"] = defenderStruct.Char:increaseAttrib("essence", 0)

    if checkBlockedAttack(attackerStruct, defenderStruct) then
        defenderStruct.Char:inform("Deiner Willenskraft gelingt es, die magische Attacke abzublocken.", "Your willpower was able to block this magic attack.", Player.lowPriority)
        attackerStruct.Char:inform("Dein Gegner blockt mit seinem Willen den Angriff ab.", "Your enemy is able to block your attack with his willpower.", Player.lowPriority)
        return
    end

    local element = STAFF_ELEMENTS[attackerStruct.WeaponItem.id]
    --[[
    -- Will be added once we have citical attacks for all elements.
    if checkCriticalAttack(attackerStruct) then
        applyCriticalEffect(attackerStruct, defenderStruct, element)
    end
    --]]
    sfxGfxOutput(attackerStruct, defenderStruct, element)

    applyDamage(attackerStruct, defenderStruct)
    attackerStruct.Char:learn(Character.wandMagic, neededCastTime/3, 100)

    magic.wandDegrade(attackerStruct.Char, attackerStruct.WeaponItem)

    MAGIC_LOAD_LIST[attackerStruct.Char.id]["tanCheckedThisCycle"] = false -- We finished a cast, so tan can now be checked again next time you cast
    MAGIC_LOAD_LIST[attackerStruct.Char.id]["tan"] = false

    return true
end

return M

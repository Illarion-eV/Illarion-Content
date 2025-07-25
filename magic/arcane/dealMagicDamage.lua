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
local character = require("base.character")
local chr_reg = require("lte.chr_reg")
local magicDamage = require("magic.arcane.magicDamage")
local chous = require("magic.arcane.enchanting.effects.chous")
local coeden = require("magic.arcane.enchanting.effects.coeden")
local hieros = require("magic.arcane.enchanting.effects.hieros")
local dendron = require("magic.arcane.enchanting.effects.dendron")
local ysbryd = require("magic.arcane.enchanting.effects.ysbryd")
local dwyfol = require("magic.arcane.enchanting.effects.dwyfol")
local testing = require("base.testing")
local magic = require("base.magic")

function M.learnMagicResistance(target, castTime, level)

    if not level then
        level = 0 --just defaults to max 20 learning if no level is specified
    end

    target:learn(Character.magicResistance, castTime, math.min(100, level + 20))

end

local function hitItemDegrade(target, degradedItem, damage)

    if not character.IsPlayer(target) then
        return
    end

    local degradeChance = 12000

    if target:isNewPlayer() then
        degradeChance = degradeChance * 2
    end

    if common.Chance(damage, degradeChance) and degradedItem.id ~= 0 then -- do not damage non existing items
        local durability = math.fmod(degradedItem.quality, 100)
        local quality = (degradedItem.quality - durability) / 100
        local nameText = world:getItemName(degradedItem.id, target:getPlayerLanguage())

        if durability > 0 then
            durability = durability - 1

            if (durability == 0) then
                common.HighInformNLS(target,
                    "Der magische Zauber zerfetzt dein "..nameText..". Vielleicht kann ein geschickter Handwerker es noch reparieren, wenn du die �berreste einsammelst?",
                    "The magic spell blasts your "..nameText.." apart. Maybe a skilled enough crafter can still repair it if you gather what remains of it, though?")
            end
            degradedItem.quality = quality * 100 + durability
            world:changeItem(degradedItem)
        end
    end
end

local function damageTargetsEquipment(target, damage)

    -- Using the same calculations as in standard fighting and picking a randomly equipped item for the spell to hit, we reduce the durability of it based on damage taken

    local bodyPositions = {Character.head, Character.neck, Character.breast, Character.hands, Character.finger_left_hand, Character.finger_right_hand, Character.legs, Character.feet, Character.coat}

    local equipment = {}

    for _, posit in pairs(bodyPositions) do

        local theItem = target:getItemAt(posit)

        if theItem and theItem.id ~= 0 then
            table.insert(equipment, theItem)
        end
    end

    if #equipment > 0 then --Ensure that the character is not naked

        local rand = math.random(1, #equipment)

        hitItemDegrade(target, equipment[rand], damage)
    end


end

function M.dealMagicDamage(user, target, spell, damage, level, DoT, castTime)

    damageTargetsEquipment(target, damage)

    local RA = runes.checkSpellForRuneByName("RA", spell)
    local CUN = runes.checkSpellForRuneByName("CUN", spell)
    local SIH = runes.checkSpellForRuneByName("SIH", spell)
    local IRA = runes.checkSpellForRuneByName("IRA", spell)
    local KAH = runes.checkSpellForRuneByName("KAH", spell)

    if DoT then castTime = castTime/15 end -- DoTs have 15 ticks, so this prevents them from giving 15 times the MR

    local dwyfolTriggered = false

    if user and damage ~= 0 then --It still gets here on DoTs that have 0 damage to deal
        local hierosApplied, newDamage = hieros.increaseDamage(user, target, damage)

        if hierosApplied then   -- chance to apply extra damage on hit in the form of fire
            damage = newDamage
        end

        if dwyfol.deflectAttackAsLightning(target, user) then -- This glyph if activated deflects the attack, dealing the same amount they would have taken as magic damage to the attacker instead in the form of a lightning strike
            local storedDefender = target
            target = user
            user = storedDefender
            dwyfolTriggered = true
            damage = math.min(damage, 1000) -- It shouldn't be possible to luck into killing off a max skill chara with a no skill character!
        end
    end

    if not dwyfolTriggered and character.IsPlayer(target) then
        M.learnMagicResistance(target, castTime, level)
    end

    if KAH and IRA then
        damage = damage/2
    end

    if not IRA and not KAH and character.IsPlayer(target) and character.WouldDie(target, damage + 1) and not character.IsDead(target) then
        if character.AtBrinkOfDeath(target) then
            if target:isAdmin() then
                chr_reg.stallRegeneration(target, 0)
            end

            character.Kill(target)

            local killerName = "N/A(Indirect magic)"

            if user then
                killerName = user.name.."("..tostring(user.id)..")"
            end

            logPlayer("Player "..killerName.." killed Player "..target.name.."("..tostring(target.id)..")")
        else
            -- Character would die.
            character.ToBrinkOfDeath(target)
            common.TalkNLS(target, Character.say, "#me geht zu Boden.", "#me falls to the ground.")

            if not target:isAdmin() then --Admins don't want to get paralysed!
                common.ParalyseCharacter(target, 20, false, true)
            end
            local timeFactor = 1 -- See lte.chr_reg
            chr_reg.stallRegeneration(target, 60 / timeFactor)

            if user then
                local wand = magic.getWand(user)

                if wand and wand.id == Item.noviceWand and target:getType() == Character.player then
                    --We cancel the users autocasting
                    if not _G.stopAutoCast then _G.stopAutoCast = {} end

                    _G.stopAutoCast[user.id] = true
                end
            end
        end
    elseif (RA or CUN) and (IRA or KAH) then
        if IRA then --Ira converts the damage of the spell to mana instead, allowing for high values of mana drain to compensate for the lost damage

            local manareduction = damage

            target:increaseAttrib("mana", -manareduction)
            if testing.active then
                target:talk(Character.say, "#me loses "..manareduction.." mana.")
            end
        end
        if KAH then

            local foodReduction = damage

            foodReduction = foodReduction*6 --There's 10k mana/health but 60k food
            target:increaseAttrib("foodlevel", -foodReduction)
            if testing.active then
                target:talk(Character.say, "#me loses "..foodReduction.." stamina.")
            end
        end
    else
        character.ChangeHP(target, -damage)
        if testing.active then
            target:talk(Character.say,"#me takes "..damage.." damage.", "#me takes "..damage.." damage.") --temp logging of damage for testers
        end
    end


    if not dwyfolTriggered and user then
        if SIH and (RA or CUN) then
            character.ChangeHP(user, math.floor(damage/20)) -- 5% lifesteal
            log("Magic testing: Leech tracking. Caster healed by "..tostring(damage/20))
        end

        dendron.lifesteal(user, damage) -- chance to heal for a portion of the damage you deal
    end

    ysbryd.liferegen(target, damage) -- chance to heal for a portion of damage you are about to receive

end

function M.applyMagicDamage(user, targets, spell, element, ORL, earthTrap, level, castDuration)
    for _, target in pairs(targets.targets) do

        if isValidChar(target) and (user and target.pos ~= user.pos) or not user then

            local damage = magicDamage.getMagicDamage(user, spell, element, target, false, ORL, earthTrap, castDuration)
            M.dealMagicDamage(user, target, spell, damage, level, false, castDuration) --This is also used by the DoT effect, and we dont want every DoT tick to trigger teleportation so that is done below
            chous.apply(user, target) --After being hit, this glyph has a chance to activate to teleport the attacker away from the defender
            coeden.apply(target, user) --After being hit, this glyph has a chance to activate to teleport the defender away from the attacker

        end
    end
end

return M

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

-- Fighting System
-- All fights are handled with this script

-- SUPER IMPORTANT TIP:
-- There are several variables in this script that can be easily tweaked to change things in the game.
-- Only a few of them should ever be considered for changing. These are the ones:
-- The Armour Scaling Factor (ASF). This scales how much better the top armour is than the bottom one.
-- The Shield Scaling Factor (SSF). This scales how much better the top shield is than the bottom one.
-- The Global Damage Factor (GDF). This scales how much damage all weapons do.
-- The Global Speed Mod (GSM). This scales how fast everyone hits.
-- The Distance Reduction Modifier (DRM). Modifies how inaccurate archers get from further away.

-- Weapon scaling is actually done in the stats, because it needs to scaled the Weapon Factor (WF).
-- This is equal to Attack*Accuracy/Actionpoints. This is harder to scale.
-- This is because armour is obvious. 100 armour = The top stat. With weapons it is much different.
-- Because some weapons are slow but strong and some accurate but weak etc. etc.
-- Ideally weapon fightpoints should be >=10, accuray <=98 and attack can be anything.
-- The WF itself scales up to 7.5.

--[[ Weapontypes:
1:  1 hd slashing
2:  1 hd concussion
3:  1 hd puncture
4:  2 hd slashing
5:  2 hd concussion
6:  2 hd puncture
7:  (cross-) Bow, sling, spear, throwing star
10: Arrows
11: Crossbow bolts
12: Sling ammo
13: Wands
14: shields
]]

local common = require("base.common")
local character = require("base.character")
local learn = require("server.learn")
local fighting = require("content.fighting")
local chr_reg = require("lte.chr_reg")
local gems = require("base.gems")
local monsterHooks = require("monster.base.hooks")
local fightingutil = require("base.fightingutil")

local M = {}

local NewbieIsland
local GetAttackType
local LoadAttribsSkills
local CheckAttackOK
local HandleAmmunition
local CheckCriticals
local Specials
local CalculateMovepoints
local HandleMovepoints
local ShowAttackGFX
local CoupDeGrace
local HitChance
local DropAmmo
local CalculateDamage
local ArmourAbsorption
local ConstitutionEffect
local CauseDamage
local ArmourDegrade
local ShowEffects
local LearnSuccess
local GetArmourType
local PlayParrySound
local WeaponDegrade
local Counter
local setArcherMonsterOnRoute
local DropBlood
local DropMuchBlood

local function NotNil(val)
    if val==nil then
        return 0
    end
    return val
end

local function NoNils(val)
    if val==nil then
        return false
    end
    return true
end

local firstTimeList = {}

local function getRangeOfDistanceWeaponInSlot(char, slot)
    local item = char:getItemAt(slot)
    local weaponFound, weapon = world:getWeaponStruct(item.id)
    if weaponFound and weapon.WeaponType == 7 then
        return weapon.Range
    end
    return 0
end

local function getArcherRange(archer)
    local leftRange = getRangeOfDistanceWeaponInSlot(archer, Character.left_tool)
    local rightRange = getRangeOfDistanceWeaponInSlot(archer, Character.right_tool)
    return math.max(leftRange, rightRange)
end

local function isPossibleTarget(monster, candidate)
    if not character.IsPlayer(candidate) then
        return false
    end

    if character.IsDead(candidate) then
        return false
    end

    if (candidate:getQuestProgress(36) ~= 0) then
        return false
    end

    local distance
    local monsterId = monster.id
    if firstTimeList[monsterId] ~= nil and firstTimeList[monsterId] == candidate.id then
        distance = 10
    else
        distance = 8
    end

    local range = getArcherRange(monster)
    if range > 0 then
        if candidate:isInRange(monster, range) then
            local blockList = world:LoS( monster.pos, candidate.pos )
            local next = next -- make next-iterator local
            if (next(blockList)~=nil) then -- see if there is a "next" (first) object in blockList!
                return false -- something blocks
            end
        else
            return false
        end
    elseif not candidate:isInRange(monster, distance) then
        return false
    end

    return true
end

local function isBetterTarget(currentTarget, candidate)
    return character.GetHP(candidate) < character.GetHP(currentTarget)
end

-- selects a target for monster from candidates, 0 means no target found
-- this default can be overridden by a monster's setTarget entrypoint
function M.setTarget(monster, candidates)
    local target = 0

    for key,candidate in pairs(candidates) do
        if isPossibleTarget(monster, candidate) and (target == 0
                or isBetterTarget(candidates[target], candidate)) then
            target = key
        end
    end

    if target ~= 0 then
        local monsterId = monster.id
        local candidate = candidates[target]
        firstTimeList[monsterId] = candidate.id
    end
    return target
end

-- List to store all information for aiming time
local AIMING_TIME_LIST = {}

--- Store all necessary information in the global list for aiming time
-- @param Attacker The character attacking
-- @param Defender The character defender
-- @param WeaponId Id of the weapon used
local function FillAimingTimeList(Attacker,Defender,weaponId)
    AIMING_TIME_LIST[Attacker.id] = {}
    AIMING_TIME_LIST[Attacker.id]["counter"] = 1 -- increased on every call; normally every 1/10 seconds
    AIMING_TIME_LIST[Attacker.id]["started"] = world:getTime("unix") -- we use that as a security measure. In case onAttack is not called every 1/10 (e.g. lack of ap), the action is excecuted then ext full sec(e.g. if 1.7 seconds are necessary but onAttack hasnt been called properly, the action is xeceuted after 2 sec)
    AIMING_TIME_LIST[Attacker.id]["weapon"] = weaponId
    AIMING_TIME_LIST[Attacker.id]["target"] = Defender.id
    AIMING_TIME_LIST[Attacker.id]["position"] = Attacker.pos.x.." "..Attacker.pos.y.." "..Attacker.pos.z
end

--- Calculate time necessary to aim, depedning on attribute and weapon.
-- @param Attacker The character attacking
-- @param Weapon The weapon used
-- @return The time needed for an attack in 1/10 seconds
local function GetNecessaryAimingTime(Attacker)
    -- we use a default value for every character and weapon; the differences in attributes and weapons come in play when the movepoints are lowered/regenerated
    return math.floor(CalculateMovepoints(Attacker)+0.5)
end

--- Check if enough aiming time has passed for the archer in order to shoot
-- @param AttackerList List containing Attacker and weapon
-- @param Defender The defending character
-- @param inRange Boolean if the defender is in range to aim/shoot at him
local function CheckAimingTime(AttackerList,Defender,inRange)
    local Attacker = AttackerList["Char"]
    --[[
    if not inRange then
        AIMING_TIME_LIST[Attacker.id] = nil
        return false
    end
    ]]
    if AIMING_TIME_LIST[Attacker.id] == nil then
        FillAimingTimeList(Attacker,Defender,AttackerList.WeaponItem.id)
        return false
    else
        -- Check if weapon and target are the same and if the attacker hasn't moved
        if AttackerList.WeaponItem.id ~= AIMING_TIME_LIST[Attacker.id]["weapon"] or Defender.id ~= AIMING_TIME_LIST[Attacker.id]["target"] or Attacker.pos.x.." "..Attacker.pos.y.." "..Attacker.pos.z ~= AIMING_TIME_LIST[Attacker.id]["position"] then
            FillAimingTimeList(Attacker,Defender,AttackerList.WeaponItem.id)
            return false
        elseif (world:getTime("unix") - AIMING_TIME_LIST[Attacker.id]["started"])*10 > GetNecessaryAimingTime(AttackerList) + 20 then
            -- that is needed to prevent that someone aims, stops aiming, waits a long time and as soon as he targets the same character again, shoots immediately.
            -- this has to be done since there is no way to clear the list when someone stops targeting the target
            AIMING_TIME_LIST[Attacker.id]["counter"] = 1
            AIMING_TIME_LIST[Attacker.id]["started"] = world:getTime("unix")
            return false
        elseif AIMING_TIME_LIST[Attacker.id]["counter"] <= GetNecessaryAimingTime(AttackerList) and (world:getTime("unix") - AIMING_TIME_LIST[Attacker.id]["started"])*10 < GetNecessaryAimingTime(AttackerList) then
            AIMING_TIME_LIST[Attacker.id]["counter"] = AIMING_TIME_LIST[Attacker.id]["counter"] + 1
        else
            return true
        end
    end
end

--- Main Attack function. This function is called by the server to start an
-- attack.
-- @param Attacker The character who attacks
-- @param Defender The character who is attacked
-- @return true in case a attack was performed, else false
function M.onAttack(Attacker, Defender)
    if Attacker.fightpoints < 0 then
        -- This happens only if the player cheats.
        -- Let's don't attack now.
        return
    end

    -- Prepare the lists that store the required values for the calculation
    local Attacker = { ["Char"]=Attacker }
    local Defender = { ["Char"]=Defender }
    local Globals = {}

    -- Newbie Island Check
    if not NewbieIsland(Attacker.Char, Defender.Char) then
        return false
    end

    -- Load the weapons of the attacker
    Attacker = fightingutil.loadWeapons(Attacker)
 
    -- Find out the attack type and the required combat skill
    GetAttackType(Attacker)

    -- Load Skills and Attributes of the attacking character
    LoadAttribsSkills(Attacker, true)
    
    -- Get range between players and check if the view is blocked for the attacker
    local isInRange, range = fightingutil.checkRangeAndView(Attacker, Defender.Char) 
    
    -- Handle ranged, physical combat
    if Attacker.AttackKind == 4 then
        -- Check aiming time for player archers
        if character.IsPlayer(Attacker.Char) and not CheckAimingTime(Attacker, Defender.Char, isInRange) then
            return false
        end
        
        -- Let npcs maintain a meaningful distance to their enemy
        if not character.IsPlayer(Attacker.Char) then
            if range <= 2 then
                setArcherMonsterOnRoute(Attacker, Defender.Char, range)
            else
                Attacker.Char:setOnRoute(false)
            end
        end
    end
    
    -- Check the range between the both fighting characters
    if not isInRange then
        return false
    end

    -- Check if the attack is good to go (possible weapon configuration)
    if not CheckAttackOK(Attacker) then
        return false
    end

    -- Check if a magic attack is invoked
    if Attacker.AttackKind == 5 then
        local distance = Attacker.Char:distanceMetric(Defender.Char)
        if fightingutil.isMagicUser(Attacker.Char) then -- Only mages can invoke a magic attack
            -- Magic attacks are calculated in a different manner, outsourced for tidiness
            local magicAttack = require("magic.magicfighting")
            magicAttack.onMagicAttack(Attacker, Defender)
        end
        return false
    end 
    
    
    -- Check if ammunition is needed and use it
    if not HandleAmmunition(Attacker) then
        return false
    end

    -- Load weapon data, skills and attributes of the attacked character
    Defender = fightingutil.loadWeapons(Defender)
    LoadAttribsSkills(Defender, false)
    
    --Calculate crit chance
    if CheckCriticals(Attacker, Defender, Globals) then
        --Do special crit effects
        Specials(Attacker, Defender, Globals)
    end

    -- Calculate and reduce the required movepoints
    local APreduction = HandleMovepoints(Attacker, Globals)

    -- Turning the attacker to his victim
    common.TurnTo(Attacker.Char,Defender.Char.pos)

    -- Show the attacking animation
    ShowAttackGFX(Attacker)

    -- Check if a coup de gráce is performed
    if CoupDeGrace(Attacker, Defender) then
        return true
    end

    -- Calculate the chance to hit
    if not HitChance(Attacker, Defender, Globals) then
        -- Place some ammo on the ground in case ammo was used
        DropAmmo(Attacker, Defender.Char, true)
        return
    end

    -- Calculate the damage caused by the attack
    CalculateDamage(Attacker, Globals)

    -- Reduce the damage due the absorbtion of the armour
    ArmourAbsorption(Attacker, Defender, Globals)

    -- The effect of the constitution. After this the final damage is avaiable.
    ConstitutionEffect(Defender, Globals)

    -- Cause the finally calculated damage to the player
    CauseDamage(Attacker, Defender, Globals)

    --Cause degradation
    ArmourDegrade(Defender,Globals)

    -- Show the final effects of the attack.
    ShowEffects(Attacker, Defender, Globals)

    -- Teach skills to attacker and defender
    LearnSuccess(Attacker, Defender, APreduction, Globals)
end

--------------------------------------------------------------------------------
-- The following functions are support functions that are used to make the    --
-- fighting system work in the way expected. They contain all the needed      --
-- calculations to perform a proper fight.                                    --
--------------------------------------------------------------------------------

--- Calculate the damage that is absorbed by the armour and reduce the stored
-- armour value by this amount.
-- @param Attacker The table that stores the data of the attacker
-- @param Defender The table that stores the data of the defender
-- @param Globals The table that stores the global values
function ArmourAbsorption(Attacker, Defender, Globals)

    GetArmourType(Defender, Globals)

    local armourfound, armour = world:getArmorStruct(Globals.HittedItem.id)
    local itemLevel = world:getItemStatsFromId(Globals.HittedItem.id).Level
    local armourValue
    local skillmod = 1
    local qualitymod = 0.82+0.02*math.floor(Globals.HittedItem.quality/100)

    --Essentially what this does is choose how much the values are divided. So stroke is half as effective as punc is half as effective as thrust for one type etc.
    local ArmourDefenseScalingFactor = 4 / 3
    local GeneralScalingFactor = 2.8

    if character.IsPlayer(Defender.Char) then
        if armourfound then
            skillmod = 1-Defender.DefenseSkill/250
            if (Attacker.AttackKind == 0 or Attacker.AttackKind == 2) then --wrestling/conc
                if (armour.Type==2) then -- Light armour
                    armourValue = itemLevel
                elseif(armour.Type==3) then -- Medium armour
                    armourValue = itemLevel/(ArmourDefenseScalingFactor)
                elseif(armour.Type==4) then -- Heavy armour
                    armourValue = itemLevel/(ArmourDefenseScalingFactor*ArmourDefenseScalingFactor)
                elseif(armour.Type==1) then -- General armour
                    armourValue = itemLevel/GeneralScalingFactor
                else
                    armourValue = 1 -- Default value
                end
            elseif (Attacker.AttackKind == 1) then -- Slash
                if (armour.Type==2) then -- Light armour
                    armourValue = itemLevel/(ArmourDefenseScalingFactor*ArmourDefenseScalingFactor)
                elseif(armour.Type==3) then -- Medium armour
                    armourValue = itemLevel
                elseif(armour.Type==4) then -- Heavy armour
                    armourValue = itemLevel/(ArmourDefenseScalingFactor)
                elseif(armour.Type==1) then -- General armour
                    armourValue = itemLevel/GeneralScalingFactor
                else
                    armourValue = 1 -- Default value
                end
            elseif (Attacker.AttackKind == 3 or Attacker.AttackKind == 4) then -- Puncture
                if (armour.Type==2) then -- Light armour
                    armourValue = itemLevel/(ArmourDefenseScalingFactor)
                elseif(armour.Type==3) then -- Medium armour
                    armourValue = itemLevel/(ArmourDefenseScalingFactor*ArmourDefenseScalingFactor)
                elseif(armour.Type==4) then -- Heavy armour
                    armourValue = itemLevel
                elseif(armour.Type==1) then -- General armour
                    armourValue = itemLevel/GeneralScalingFactor
                else
                    armourValue = 1 -- Default value
                end
            end
        end
    else
        local thingvalue=NotNil(Defender.Char:getSkill(Character.wrestling))
        skillmod = 1-thingvalue/250
        armourValue = thingvalue
    end

    local messupmalus = 5 -- Amount that armour value is divided by if your skill isn't high enough to use this armour.

    if character.IsPlayer(Defender.Char) and itemLevel > Defender.DefenseSkill then
        armourValue = armourValue/messupmalus
    end

    if(Globals.criticalHit==6) then
        --Armour pierce
        armourValue = nil
    end

    -- This Armour Scaling Factor (ASF) is important. You can think of it like this:
    -- If ASF = 5, the top armour in the game is 5x as good as the worst armour in the game
    local ArmourScalingFactor = 5

    -- Naked means value 0, whereas armour level 0 scales higher
    if armourValue ~= nil then
        armourValue = (100/ArmourScalingFactor) + armourValue*(1-1/ArmourScalingFactor)
    else
        armourValue = 0
    end

    local GemBonus = gems.getGemBonus(Globals.HittedItem)
    armourValue = armourValue + armourValue * GemBonus / 100

    --Race armour for monsters
    armourfound, armour = world:getNaturalArmor(Defender.Race)
    if armourfound then
        if (Attacker.AttackKind == 0) then --wrestling
        armourValue = armourValue + armour.thrustArmor
        elseif (Attacker.AttackKind == 1) then --slashing
        armourValue = armourValue + armour.strokeArmor
        elseif (Attacker.AttackKind == 2) then --concussion
        armourValue = armourValue + armour.thrustArmor
        elseif (Attacker.AttackKind == 3) then --puncture
        armourValue = armourValue + armour.punctureArmor
        elseif (Attacker.AttackKind == 4) then --distance
        armourValue = armourValue + armour.punctureArmor
        end
    end

    Globals.Damage = Globals.Damage - (Globals.Damage * armourValue * qualitymod / 140)
    Globals.Damage = skillmod*Globals.Damage
    Globals.Damage = math.max(0, Globals.Damage)
end

function ArmourDegrade(Defender, Globals)
    if not character.IsPlayer(Defender.Char) then
        return
    end

    if (common.Chance(Globals.Damage, 12000)) and (Globals.HittedItem.id ~= 0) then -- do not damage non existing items
        local durability = math.fmod(Globals.HittedItem.quality, 100)
        local quality = (Globals.HittedItem.quality - durability) / 100
        local nameText = world:getItemName(Globals.HittedItem.id, Defender.Char:getPlayerLanguage())

        durability = durability - 1
        if (durability == 0) then
            common.InformNLS(Defender.Char,
                "Dein Rüstungsteil '"..nameText.."' zerbricht. Glücklicherweise tritt kein Splitter in deinen Körper ein.",
                "Your armour piece '"..nameText.."' shatters. Fortunately, no fragments end up in your body.")
          world:erase(Globals.HittedItem, 1)
          return true
        end

        Globals.HittedItem.quality = quality * 100 + durability
        world:changeItem(Globals.HittedItem)

        if (durability < 10) then
            common.InformNLS(Defender.Char,
                "Dein Rüstungsteil '"..nameText.."' hat schon bessere Zeiten gesehen. Vielleicht solltest du es reparieren lassen.",
                "Your armour piece '"..nameText.."' has seen better days. You may want to get it repaired.")
        end
    end
end

-- @param Attacker The table that stores the data of the attacker
-- @param Defender The table that stores the data of the defender
-- @param ParryWeapon The item which was used to parry
function WeaponDegrade(Attacker, Defender, ParryWeapon)

    commonAttackerWeapon=world:getItemStats(Attacker.WeaponItem);
    commonParryWeapon=world:getItemStats(ParryWeapon);

    if (common.Chance(1, 20)) and (Attacker.WeaponItem.id ~= 0) and character.IsPlayer(Attacker.Char) and commonAttackerWeapon.MaxStack == 1 then
        local durability = math.fmod(Attacker.WeaponItem.quality, 100)
        local quality = (Attacker.WeaponItem.quality - durability) / 100
        local nameText = world:getItemName(Attacker.WeaponItem.id, Attacker.Char:getPlayerLanguage())

        durability = durability - 1
        if (durability == 0) then
            common.InformNLS(Attacker.Char,
                "Deine Waffe '"..nameText.."' zerbricht. Du vergießt eine bitter Träne und sagst lebe wohl, als sie in das nächste Leben übergeht.",
                "Your weapon '"..nameText.."' shatters. You shed a single tear and bid it farewell as it moves on to its next life.")
            world:erase(Attacker.WeaponItem, 1)
            return true
        end

        Attacker.WeaponItem.quality = quality * 100 + durability
        world:changeItem(Attacker.WeaponItem)

        if (durability < 10) then
            common.InformNLS(Attacker.Char,
                "Deine Waffe '"..nameText.."' hat schon bessere Zeiten gesehen. Vielleicht solltest du sie reparieren lassen.",
                "Your weapon '"..nameText.."' has seen better days. You may want to get it repaired.")
        end
    end

    if (common.Chance(1, 60)) and (ParryWeapon.id ~= 0) and character.IsPlayer(Defender.Char) and commonParryWeapon.MaxStack == 1 then
        local durability = math.fmod(ParryWeapon.quality, 100)
        local quality = (ParryWeapon.quality - durability) / 100
        local nameText = world:getItemName(ParryWeapon.id, Defender.Char:getPlayerLanguage())

        durability = durability - 1

        if (durability == 0) then
            common.InformNLS(Defender.Char,
                "Dein Gegenstand '"..nameText.."' zerbricht, dies erschwert es dir, dich zu verteidigen.",
                "Your item '"..nameText.."' shatters, making it more difficult for you to defend yourself.")
            world:erase(ParryWeapon, 1)
            return true
        end

        ParryWeapon.quality = quality * 100 + durability
        world:changeItem(ParryWeapon)

        if (durability < 10) then
            common.InformNLS(Defender.Char,
                "Dein Gegenstand '"..nameText.."' hat schon bessere Zeiten gesehen. Vielleicht solltest du ihn reparieren.",
                "Your item '"..nameText.."' has seen better days. You may want to repair it.")
        end
    end
end

--- Calculate the damage that is caused by the attack. This function calculates
-- the raw damage and stores it in the globals table. The damage calculated here
-- has to be lowered by the armour and the constitution of the attacked
-- character.
-- @param Attacker The table of the character who is attacking
-- @param Globals The global data table
function CalculateDamage(Attacker, Globals)
    local BaseDamage
    local StrengthBonus
    local PerceptionBonus
    local DexterityBonus
    local SkillBonus
    local CritBonus=1
    local QualityBonus

    if Attacker.IsWeapon then
        BaseDamage = Attacker.Weapon.Attack * 40
    else
        BaseDamage = fighting.GetWrestlingAttack( Attacker.Race ) * 10
    end

    local messupmalus = 5 -- Amount that damage value is divided by if your skill isn't high enough to use this weapon.

    if character.IsPlayer(Attacker.Char) and world:getItemStatsFromId(Attacker.WeaponItem.id).Level>Attacker.skill then
        BaseDamage = BaseDamage/messupmalus
    end

    StrengthBonus = (Attacker.strength - 6) * 3
    PerceptionBonus = (Attacker.perception - 6) * 1
    DexterityBonus = (Attacker.dexterity - 6) * 1
    SkillBonus = (Attacker.skill - 20) * 1.5

    local GemBonus = gems.getGemBonus(Attacker.WeaponItem)

    --Quality Bonus: Multiplies final value by 0.93-1.09
    QualityBonus = 0.91+0.02*math.floor(Attacker.WeaponItem.quality/100)

    --Crit bonus
    if Globals.criticalHit>0 then
        CritBonus=1.5
    end

    --The Global Damage Factor (GDF). Adjust this to change how much damage is done per hit on all attacks.
    local GlobalDamageFactor = 1/180
    Globals["Damage"] = GlobalDamageFactor*BaseDamage * CritBonus * QualityBonus * (100 + StrengthBonus + PerceptionBonus + DexterityBonus + SkillBonus + GemBonus)
end

--- Deform some final checks on the damage that would be caused and send it to
-- the character. Also here the Coup de Gráce is done.
-- @param Attacker The table of the attacking Character
-- @param Defender The table of the attacked Character
-- @param Globals The table of the global values
function CauseDamage(Attacker, Defender, Globals)
    if(Attacker.AttackKind == 4) and character.IsPlayer(Attacker.Char) then -- reset counter for archers
        AIMING_TIME_LIST[Attacker.Char.id]["counter"] = 1
        AIMING_TIME_LIST[Attacker.Char.id]["started"] = world:getTime("unix")
    end

    Globals.Damage=Globals.Damage*(Random.uniform(9,10)/10) --Damage is randomised: 90-100%
    Globals.Damage=math.min(Globals.Damage,4999) --Damage is capped at 4999 Hitpoints to prevent "one hit kills"
    Globals.Damage=math.floor(Globals.Damage) --Hitpoints are an integer

    if character.IsPlayer(Defender.Char) and not Defender.Char:isAdmin() and character.WouldDie(Defender.Char, Globals.Damage + 1) and not character.AtBrinkOfDeath(Defender.Char) then
        -- Character would die. Nearly killing him and moving him back in case it's possible
        character.ToBrinkOfDeath(Defender.Char)

        local CharOffsetX = Attacker.Char.pos.x - Defender.Char.pos.x
        local CharOffsetY = Attacker.Char.pos.y - Defender.Char.pos.y

        local range = Attacker.Weapon.Range
        if(Attacker.AttackKind == 4) then
            range = 1
        end

        if (CharOffsetY > 0) then
            CharOffsetY = (range - math.abs(CharOffsetX) + 1) * (-1)
        elseif (CharOffsetY < 0) then
            CharOffsetY = (range - math.abs( CharOffsetX ) + 1)
        end

        if (CharOffsetX > 0) then
            CharOffsetX = (range - math.abs(CharOffsetY) + 1) * (-1)
        elseif (CharOffsetX < 0) then
            CharOffsetX = (range - math.abs(CharOffsetY) + 1)
        end

        local newPos = position(Defender.Char.pos.x + CharOffsetX,
            Defender.Char.pos.y + CharOffsetY, Defender.Char.pos.z)

        local targetPos=Defender.Char.pos

        local isNotBlocked = function(pos)
            if world:getField(pos):isPassable() then
                targetPos = pos
                return true
            else
                return false
            end
        end

        common.CreateLine(Defender.Char.pos, newPos, isNotBlocked)
        if targetPos ~= nil then
            Defender.Char:warp(targetPos)
        end

        common.TalkNLS(Defender.Char, Character.say,
            "#me taumelt zurück.",
            "#me stumbles back.")

        if not Defender.Char:isAdmin() then --Admins don't want to get paralysed!
            common.ParalyseCharacter(Defender.Char, 2, false, true)
            local TimeFactor=1 -- See lte.chr_reg
            chr_reg.stallRegeneration(Defender.Char, 60/TimeFactor) -- Stall regeneration for one minute. Attention! If you change TimeFactor in lte.chr_reg to another value but 1, you have to divide this "60" by that factor
        end

        return true
    else
        character.ChangeHP(Defender.Char,-Globals.Damage) -- Finally dealing the damage.

        if (Attacker.AttackKind == 4) then -- Ranged attack
            if not character.IsPlayer(Defender.Char) and character.IsPlayer(Attacker.Char) then
                Defender.Char.movepoints = Defender.Char.movepoints - 5
            end
            DropAmmo(Attacker, Defender.Char, false)
        end
    end
end

--- Check that the attack hits
-- @param Defender The character who attacks
-- @param Defender The character who is attacked
-- @return true if the attack is successful
function HitChance(Attacker, Defender, Globals)
    local DirectionDifference = math.abs(Defender.Char:getFaceTo()-Attacker.Char:getFaceTo())
    local parryWeapon
    local canParry=true
    local parryItem -- For degradation

    --Miss chance. 2% bonus to hit chance for 18 perc, 1.75% malus for 3 perc. Added onto weapon accuracy.
    local chancetohit
    if Attacker.IsWeapon then
        chancetohit = Attacker.Weapon.Accuracy*(1+(Attacker.perception-10)/500)
    else --unarmed
        chancetohit = 90*(1+(Attacker.perception-10)/500)
    end
    -- Min and max hit chance are 5% and 95% respectively
    chancetohit = common.Limit(chancetohit, 5, 95)

    if (Attacker.AttackKind==4) then
        --The Distance Reduction Modifier (DRM). This value scales the chance of hitting in archery
        --After the pointblank range. In other words, 3 squares away (just out of PB range) has
        --1x the normal accuracy. One square further away is DRM x normal accuracy.
        --One square even further away is DRM^2 x normal accuracy.
        local DistanceReductionModifier = 0.93
        local distance = Attacker.Char:distanceMetric(Defender.Char)
        local archerymod = math.min(1,(1-DistanceReductionModifier)+math.pow(DistanceReductionModifier,distance-2))
        --The value of 2 is used because that's the number of squares away it starts.
        chancetohit = chancetohit*archerymod
    end

    --Surefire Special
    if(Globals.criticalHit==7) then
        chancetohit = 100
    end

    -- Attack misses
    if not common.Chance(chancetohit, 100) then
        return false
    end

    --Unblockable Special
    if(Globals.criticalHit==2) then
        return true
    end

    --Cannot parry without a weapon
    if not Defender.IsWeapon and not Defender.SecIsWeapon then
        canParry = false
    end

    --Cannot parry people who aren't in the front quadrant
    if (DirectionDifference<=2) or (DirectionDifference>=6) then
       canParry = false
    end

    -- If they can't parry, it succeeds
    if not canParry then
        return true
    end

    --Choose which weapon has the largest defence
    if Defender.IsWeapon then
        parryItem = Defender.WeaponItem
        parryWeapon = Defender.Weapon
    end

    if Defender.SecIsWeapon then
        if not parryWeapon then
            parryItem = Defender.SecWeaponItem
            parryWeapon = Defender.SecWeapon
        elseif (parryWeapon.Defence < Defender.SecWeapon.Defence) then
            parryItem = Defender.SecWeaponItem
            parryWeapon = Defender.SecWeapon
        end
    end

    --The Shield Scaling Factor (SSF). Changes how much the top shield is better than the worse one.
    local ShieldScalingFactor =5

    local parryweapondefense = parryWeapon.Defence
    local defenderdefense = (100/ShieldScalingFactor) + parryweapondefense*(1-1/ShieldScalingFactor)

    if(parryWeapon.WeaponType~=14) then
        defenderdefense = defenderdefense/2
    end
    
    local parryChance
    --Quality Bonus: Multiplies final value by 0.93-1.09
    local qualitymod = 0.91+0.02*math.floor(parryItem.quality/100)
    parryChance = (Defender.parry / 5) --0-20% by the skill
    parryChance = parryChance * (0.5 + (Defender.agility) / 20) --Skill value gets multiplied by 0.5-1.5 (+/-50% of a normal player) scaled by agility
    parryChance = parryChance + (defenderdefense) / 5 --0-20% bonus by the weapon/shield
    parryChance = parryChance * qualitymod

    local messupmalus = 5 -- Amount that parry chance is divided by if your skill isn't high enough to use this weapon.

    if character.IsPlayer(Defender.Char) and world:getItemStatsFromId(parryItem.id).Level>Defender.parry then
        parryChance = parryChance/messupmalus
    end

     -- Min and max parry are 5% and 95% respectively
    parryChance = common.Limit(parryChance, 5, 95)

    -- Attack was parried sucessfully
    if common.Chance(parryChance, 100) then
        PlayParrySound(Attacker, Defender)
        Defender.Char:performAnimation(9)
        WeaponDegrade(Attacker, Defender, parryItem)
        Counter(Attacker,Defender)
        return false
    end

    -- Attack suceeded
    return true
end


--- Check if the setting of items the character is using is good for a attack
-- @param CharStruct The table of the attacker that holds all values load
-- @return true in case the attack is fine
function CheckAttackOK(CharStruct)
    if CharStruct["AttackKind"] == nil or CharStruct["Skillname"] == nil then -- finding the attack type or skill failed
        return false
    end
    if (CharStruct.Char.effects:find(24)) then -- Attacker is tied up
        return false
    end

    if (CharStruct.SecIsWeapon) then
        -- there is something in the second hand
        if (CharStruct.AttackKind == 0) then
            -- but nothing in the first
            return false
        elseif (CharStruct.SecWeapon.WeaponType == 7) then
            -- but a distance weapon in the first
            return false
        elseif (CharStruct.Weapon.WeaponType == 13) then
            -- but a wand in the first
            return false
        end
    end
    return true
end

-- Makes the monster move away from its target
-- @param AttackerStruct The table that stores the data of the attacker
-- @param Defender The character who is attacked
function setArcherMonsterOnRoute(AttackerStruct,Defender,distance)
    AttackerStruct.Char.waypoints:clear()

    local workingpoint = 5-distance
    local workingpointb = workingpoint-1
    local workingpointc = workingpoint+2
    local workingpointd = workingpointc-1

    local possiblePositions = {}
    possiblePositions.prefered = {} -- walkable and not in close combat range of the other char
    possiblePositions.acceptable = {} -- walkable but in close combat range
    local foundDefender
    for i=-1,1 do
        for j=-1,1 do
            local checkPosition = position(AttackerStruct.Char.pos.x+i, AttackerStruct.Char.pos.y+j, AttackerStruct.Char.pos.z)
            if world:isCharacterOnField(checkPosition) then
                local foundCharacter = world:getCharacterOnField(checkPosition)
                if foundCharacter.id == Defender.id then
                    foundDefender = true
                end
            elseif NoNils(world:getField(checkPosition)) and world:getField(checkPosition):isPassable() then
                if (math.abs(Defender.pos.x-AttackerStruct.Char.pos.x)>1) or (math.abs(Defender.pos.y-AttackerStruct.Char.pos.y)>1) then
                    table.insert(possiblePositions.prefered,checkPosition)
                else
                    table.insert(possiblePositions.acceptable,checkPosition)
                end
            end
        end
    end

    local newposition = false
    if foundDefender then
        if #possiblePositions.prefered > 0 then
            newposition = possiblePositions.prefered[Random.uniform(1,#possiblePositions.prefered)]
        elseif #possiblePositions.acceptable > 0 then
            newposition = possiblePositions.acceptable[Random.uniform(1,#possiblePositions.acceptable)]
        end
    end

    if not newposition then
        --Look behind
        newposition = position(workingpoint*AttackerStruct.Char.pos.x-workingpointb*Defender.pos.x,workingpoint*AttackerStruct.Char.pos.y-workingpointb*Defender.pos.y,AttackerStruct.Char.pos.z)
    end

    local isdiagonal = ((math.abs(Defender.pos.x-AttackerStruct.Char.pos.x)>0) and (math.abs(Defender.pos.y-AttackerStruct.Char.pos.y)>0))
    if not(isdiagonal) then
        if NoNils(world:getField(newposition)) and NoNils(world:getField(newposition):isPassable()) then
            if not (world:getField(newposition):isPassable()) then
                newposition = position(Defender.pos.x+1,Defender.pos.y-1,AttackerStruct.Char.pos.z)
            end
        else
            newposition = position(Defender.pos.x+1,Defender.pos.y-1,AttackerStruct.Char.pos.z)
        end

        if NoNils(world:getField(newposition)) and NoNils(world:getField(newposition):isPassable()) then
            if not (world:getField(newposition):isPassable()) then
                newposition = position(Defender.pos.x-1,Defender.pos.y+1,AttackerStruct.Char.pos.z)
            end
        else
            newposition = position(Defender.pos.x-1,Defender.pos.y+1,AttackerStruct.Char.pos.z)
        end

        if NoNils(world:getField(newposition)) and NoNils(world:getField(newposition):isPassable()) then
            if not (world:getField(newposition):isPassable()) then
                newposition = position(Defender.pos.x+1,Defender.pos.y+1,AttackerStruct.Char.pos.z)
            end
        else
            newposition = position(Defender.pos.x+1,Defender.pos.y+1,AttackerStruct.Char.pos.z)
        end

        if NoNils(world:getField(newposition)) and NoNils(world:getField(newposition):isPassable()) then
            if not (world:getField(newposition):isPassable()) then
                newposition = position(Defender.pos.x-1,Defender.pos.y-1,AttackerStruct.Char.pos.z)
            end
        else
            newposition = position(Defender.pos.x-1,Defender.pos.y-1,AttackerStruct.Char.pos.z)
        end
    else
        if NoNils(world:getField(newposition)) and NoNils(world:getField(newposition):isPassable()) then
            if not (world:getField(newposition):isPassable()) then
                newposition = position(Defender.pos.x,Defender.pos.y+1,AttackerStruct.Char.pos.z)
            end
        else
            newposition = position(Defender.pos.x,Defender.pos.y+1,AttackerStruct.Char.pos.z)
        end

        if NoNils(world:getField(newposition)) and NoNils(world:getField(newposition):isPassable()) then
            if not (world:getField(newposition):isPassable()) then
                newposition = position(Defender.pos.x-1,Defender.pos.y,AttackerStruct.Char.pos.z)
            end
        else
            newposition = position(Defender.pos.x-1,Defender.pos.y,AttackerStruct.Char.pos.z)
        end

        if NoNils(world:getField(newposition)) and NoNils(world:getField(newposition):isPassable()) then
            if not (world:getField(newposition):isPassable()) then
                newposition = position(Defender.pos.x,Defender.pos.y-1,AttackerStruct.Char.pos.z)
            end
        else
            newposition = position(Defender.pos.x,Defender.pos.y-1,AttackerStruct.Char.pos.z)
        end

        if NoNils(world:getField(newposition)) and NoNils(world:getField(newposition):isPassable()) then
            if not (world:getField(newposition):isPassable()) then
                newposition = position(Defender.pos.x+1,Defender.pos.y,AttackerStruct.Char.pos.z)
            end
        else
            newposition = position(Defender.pos.x+1,Defender.pos.y,AttackerStruct.Char.pos.z)
        end
    end

    if NoNils(world:getField(newposition)) and NoNils(world:getField(newposition):isPassable()) then
        if not (world:getField(newposition):isPassable()) then
            newposition = position(workingpointd*AttackerStruct.Char.pos.x-workingpointc*Defender.pos.x+2,workingpointd*AttackerStruct.Char.pos.y-workingpointc*Defender.pos.y+2,AttackerStruct.Char.pos.z)
        end
    else
        newposition = position(workingpointd*AttackerStruct.Char.pos.x-workingpointc*Defender.pos.x+2,workingpointd*AttackerStruct.Char.pos.y-workingpointc*Defender.pos.y+2,AttackerStruct.Char.pos.z)
    end

    if NoNils(world:getField(newposition)) and NoNils(world:getField(newposition):isPassable()) then
        if not (world:getField(newposition):isPassable()) then
            newposition = position(workingpointd*AttackerStruct.Char.pos.x-workingpointc*Defender.pos.x-2,workingpointd*AttackerStruct.Char.pos.y-workingpointc*Defender.pos.y-2,AttackerStruct.Char.pos.z)
        end
    else
        newposition = position(workingpointd*AttackerStruct.Char.pos.x-workingpointc*Defender.pos.x-2,workingpointd*AttackerStruct.Char.pos.y-workingpointc*Defender.pos.y-2,AttackerStruct.Char.pos.z)
    end

    if NoNils(world:getField(newposition)) and NoNils(world:getField(newposition):isPassable()) then
        if not (world:getField(newposition):isPassable()) then
            newposition = position(workingpoint*AttackerStruct.Char.pos.x-workingpointb*Defender.pos.x-2,workingpoint*AttackerStruct.Char.pos.y-workingpointb*Defender.pos.y-2,AttackerStruct.Char.pos.z)
        end
    else
        newposition = position(workingpoint*AttackerStruct.Char.pos.x-workingpointb*Defender.pos.x-2,workingpoint*AttackerStruct.Char.pos.y-workingpointb*Defender.pos.y-2,AttackerStruct.Char.pos.z)
    end

    if NoNils(world:getField(newposition)) and NoNils(world:getField(newposition):isPassable()) then
        if not (world:getField(newposition):isPassable()) then
            newposition = position(workingpoint*AttackerStruct.Char.pos.x-workingpointb*Defender.pos.x+2,workingpoint*AttackerStruct.Char.pos.y-workingpointb*Defender.pos.y+2,AttackerStruct.Char.pos.z)
        end
    else
        newposition = position(workingpoint*AttackerStruct.Char.pos.x-workingpointb*Defender.pos.x+2,workingpoint*AttackerStruct.Char.pos.y-workingpointb*Defender.pos.y+2,AttackerStruct.Char.pos.z)
    end

    --Look forward
    if NoNils(world:getField(newposition)) and NoNils(world:getField(newposition):isPassable()) then
        if not (world:getField(newposition):isPassable()) then
            newposition = position(workingpointd*AttackerStruct.Char.pos.x-workingpointc*Defender.pos.x,workingpointd*AttackerStruct.Char.pos.y-workingpointc*Defender.pos.y,AttackerStruct.Char.pos.z)
        end
    else
        newposition = position(workingpointd*AttackerStruct.Char.pos.x-workingpointc*Defender.pos.x,workingpointd*AttackerStruct.Char.pos.y-workingpointc*Defender.pos.y,AttackerStruct.Char.pos.z)
    end

    if NoNils(world:getField(newposition)) and NoNils(world:getField(newposition):isPassable()) then
        if (world:getField(newposition):isPassable()) then
            --Defender:inform(newposition.x .. " " .. newposition.y .." ".. newposition.z);
            AttackerStruct.Char.waypoints:addWaypoint(newposition)
            AttackerStruct.Char:setOnRoute(true)
        else
            AttackerStruct.Char:setOnRoute(false)
        end
    else
        AttackerStruct.Char:setOnRoute(false)
    end
end

--- Calculate the effect of the constitution on the damage. Depending on the
-- constitution this can raise or lower the damage.
-- @param Defender The table that stores the data of the defender
-- @param Globals The table that stores the global values
function ConstitutionEffect(Defender, Globals)
    if (Globals.Damage == 0) then
        return
    end

    Globals.Damage = Globals.Damage * 14 / Defender.constitution
end

--- Checks if a coup de gráce is performed on the attacked character and kills
-- the char if needed
-- @param Attacker The table of the attacking character
-- @param Defender The table of the attacked character
-- @return true if a coup de gráce was done
function CoupDeGrace(Attacker, Defender)
    if not character.IsPlayer(Defender.Char) then -- Only for player characters
        return false
    end

    if fighting.IsTrainingWeapon(Attacker.WeaponItem.id) then
        -- not done for training weapons
        return false
    end

    if (character.AtBrinkOfDeath(Defender.Char)) then
        -- character nearly down
        --[[local gText = common.GetGenderText(Attacker.Char, "seinem", "ihrem")
        local eText = common.GetGenderText(Attacker.Char, "his", "her")
        Attacker.Char:talk(Character.say,
                string.format("#me gibt %s Gegner den Gnadenstoß.", gText),
                string.format("#me gives %s enemy the coup de gráce.", eText))
        --]]
        -- Kill character and notify other scripts about the death
        if not character.Kill(Defender.Char) then
            -- something interrupted the kill
            return true
        end

        -- Drop much blood around the player
        DropMuchBlood(Defender.Char.pos)
    end

    return false
end

local monsterArrowDrop = {}

--- Drops the used ammo in case there is any ammo. This functions placed the
-- used ammunition under the character in case the target character is a player,
-- else the ammunition is dropped into the inventory of the target.
-- @param Attacker The table of the attacking char
-- @param Defender The character of the character that is supposed to receive
--                  the attack
-- @param GroundOnly true in case the item is supposed to be dropped only on the
--                  ground
function DropAmmo(Attacker, Defender, GroundOnly)
    if ( Attacker.AttackKind ~= 4 ) then -- no distance attack --> no ammo
        return
    end

    if common.Chance(0.33) then
        local AmmoItem
        if (Attacker.Weapon.AmmunitionType == Attacker.SecWeapon.WeaponType) then
            AmmoItem = Attacker.SecWeaponItem
        elseif (Attacker.Weapon.AmmunitionType == 255) then
            AmmoItem = Attacker.WeaponItem
        else
            return false
        end

        if not GroundOnly and not character.IsPlayer(Defender) then -- monsters get the ammo into the inventory
            local monsterId = Defender.id
            if not monsterArrowDrop[monsterId] then
                monsterArrowDrop[monsterId] = {}
            end
            if monsterArrowDrop[monsterId][AmmoItem.id] then
                monsterArrowDrop[monsterId][AmmoItem.id] = monsterArrowDrop[monsterId][AmmoItem.id] + 1
            else
                monsterArrowDrop[monsterId][AmmoItem.id] = 1
                local function dropAmmo(monster)
                    for ammoId, ammoAmount in pairs(monsterArrowDrop[monster.id]) do
                        world:createItemFromId(ammoId, ammoAmount, monster.pos, true, 333, nil)
                    end
                end
                monsterHooks.registerOnDeath(Defender, dropAmmo)
            end
        else
            if world:isItemOnField(Defender.pos) then
                local oldItem = world:getItemOnField(Defender.pos)
                if oldItem.wear < 255 and oldItem.id == AmmoItem.id then
                    oldItem.number = oldItem.number + 1
                    oldItem.wear = 5
                    world:changeItem( oldItem )
                    return
                end
            end

            world:createItemFromId(AmmoItem.id, 1, Defender.pos, true, AmmoItem.quality, nil)
        end
    end
end

--- Drop a blood spot on the ground at a specified location.
-- @param Posi The location where the blood spot is placed
function DropBlood(Posi)
    if world:isItemOnField(Posi) then
        return --no blood on tiles with items on them!
    end

    local Blood = world:createItemFromId(3101, 1, Posi, true, 333, nil)
    Blood.wear = 2
    world:changeItem(Blood)
end

--- Drop alot of blood. This function drops blood on every tile around the
-- position set as center.
-- @param Posi The center of the bloody area
function DropMuchBlood(Posi)
    local workingPos = common.CopyPosition(Posi)

    workingPos.x = workingPos.x - 1
    workingPos.y = workingPos.y - 1
    for i = 1, 3 do
        for j = 1, 3 do
            DropBlood(workingPos)
            workingPos.x = workingPos.x + 1
        end
        workingPos.x = workingPos.x - 3
        workingPos.y = workingPos.y + 1
    end
end

--@CharStruct The table of the defender
--@return Returns the armour type
-- 0 - Unarmoured
-- 1 - Puncture
-- 2 - Stroke
-- 3 - Thrust
function GetArmourType(Defender, Globals)
    Globals["HittedArea"] = fighting.GetHitArea(Defender.Race)
    Globals["HittedItem"] = Defender.Char:getItemAt(Globals.HittedArea)

    local armour, armourfound
    if (Globals.HittedItem ~= nil and Globals.HittedItem.id > 0) then
        armourfound, armour = world:getArmorStruct(Globals.HittedItem.id)
    else
        -- No armour worn
        Defender["DefenseSkill"] = 0
        return false
    end

    local armourtype = armour.Type
    if armourtype == 4 then
        -- Heavy is good against punc
        Defender["DefenseSkillName"] = Character.heavyArmour
    elseif armourtype == 3 then
        -- Medium is good against slash/stroke
        Defender["DefenseSkillName"] = Character.mediumArmour
    elseif armourtype == 2 then
        -- Light is good against conc/thrust
        Defender["DefenseSkillName"] = Character.lightArmour
    else
        Defender["DefenseSkillName"] = false
        Defender["DefenseSkill"] = 0
        return false
    end

    Defender["DefenseSkill"] = NotNil(Defender.Char:getSkill(Defender.DefenseSkillName))

    return true
end

---Calculate if there was a critical
-- @param Attacker The table of the attacking Character
-- @param Defender The table of the attacked Character
-- @param Globals The table of the global values
function CheckCriticals(Attacker, Defender, Globals)
    local chance=1
    local weapontype = 8

    if Attacker.IsWeapon then
        weapontype = Attacker.Weapon.WeaponType
    end

    if not common.Chance(chance, 100) then
        Globals["criticalHit"] = 0
        return false
    else
        Globals["criticalHit"] = weapontype
        return true
    end
end

---Handles special effects
-- @param Attacker The table of the attacking Character
-- @param Defender The table of the attacked Character
-- @param Globals The table of the global values
function Specials(Attacker, Defender, Globals)
    local hisher =  common.GetGenderText(Attacker.Char,"his","her")
    local seinihr = common.GetGenderText(Attacker.Char,"sein","ihr")
    if not character.IsPlayer(Attacker.Char) then
        if(Globals.criticalHit==1) then -- 1HS
            common.TalkNLS(Attacker.Char, Character.say,
                    "#me schlägt schnell zu und teilt rasch zwei Hiebe aus.",
                    "#me quickly strikes, dealing two blows in rapid succession.")
        elseif(Globals.criticalHit==2) then -- 1HC
            common.TalkNLS(Attacker.Char, Character.say,
                    "#me greift mit solcher Kraft an, dass der Angriff nicht pariert werden kann.",
                    "#me attacks with such force that it cannot be blocked.")
        elseif(Globals.criticalHit==3) then -- 1HP
            common.TalkNLS(Attacker.Char, Character.say,
                    "#me führt eine schmerzhafte Attacke aus.",
                    "#me delivers a painful attack.")
        elseif(Globals.criticalHit==4) then -- 2HS
            common.TalkNLS(Attacker.Char, Character.say,
                    "#me führt einen gewaltigen Hieb aus und schlägt "..seinihr.."en Gegner zurück.",
                    "#me delivers a broad attack, knocking back "..hisher.." opponent.")
        elseif(Globals.criticalHit==5) then -- 2HC
            common.TalkNLS(Attacker.Char, Character.say,
                    "#me greift mit großer Kraft an und setzt "..seinihr.."en Gegner außer Gefecht.",
                    "#me attacks with great force, stunning "..hisher.." foe.")
        elseif(Globals.criticalHit==6) then -- 2HP
            common.TalkNLS(Attacker.Char, Character.say,
                    "#me stößt vor und landet einen durchbohrenden Treffer.",
                    "#me thrusts out, delivering a powerful, piercing attack.")
        elseif(Globals.criticalHit==7) then -- Dist
            common.TalkNLS(Attacker.Char, Character.say,
                    "#me zielt etwas länger und er trifft dadurch "..seinihr.." Ziel an einer ungeschützten Stelle.",
                    "#me takes careful aim, hitting "..hisher.." target with precision and power.")
        elseif(Globals.criticalHit==8) then -- Wrest
            common.TalkNLS(Attacker.Char, Character.say,
                    "#me führt einen extrem schnellen Hieb gegen "..seinihr.."en Gegner.",
                    "#me strikes out extremely quickly, dealing a powerful blow to "..hisher.." opponent.")
        end
    else
        if(Globals.criticalHit==1) then -- 1HS
            common.TalkNLS(Attacker.Char, Character.say,
                "#me schwingt "..seinihr.."e Klinge und teilt rasch zwei Hiebe aus.",
                "#me sweeps "..hisher.." blade, dealing two blows in rapid succession.")
        elseif(Globals.criticalHit==2) then -- 1HC
            common.TalkNLS(Attacker.Char, Character.say,
                "#me schwingt "..seinihr.."e Waffe mit solcher Kraft, dass diese nicht pariert werden kann.",
                "#me swings "..hisher.." weapon with such force that it cannot be blocked.")
        elseif(Globals.criticalHit==3) then -- 1HP
            common.TalkNLS(Attacker.Char, Character.say,
                "#me rammt "..seinihr.."e Klinge schnell in den Rücken "..seinihr.."es Gegners.",
                "#me slams "..hisher.." blade quickly into "..hisher.." opponent's back.")
        elseif(Globals.criticalHit==4) then -- 2HS
            common.TalkNLS(Attacker.Char, Character.say,
                "#me führ einen gewaltigen Hieb aus und schlägt "..seinihr.."en Gegner zurück.",
                "#me delivers a mighty swing, knocking back "..hisher.." opponent.")
        elseif(Globals.criticalHit==5) then -- 2HC
            common.TalkNLS(Attacker.Char, Character.say,
                "#me lässt "..seinihr.."e Waffe mit gewaltiger Kraft nach unten fahren so dass "..seinihr.." Gegner benommen ist.",
                "#me brings down "..hisher.." weapon with great force, stunning "..hisher.." foe.")
        elseif(Globals.criticalHit==6) then -- 2HP
            common.TalkNLS(Attacker.Char, Character.say,
                "#me stößt "..seinihr.."e Waffe mit einem kraftvollen Stich nach vorne.",
                "#me thrusts "..hisher.." weapon with a powerful, piercing attack.")
        elseif(Globals.criticalHit==7) then -- Dist
            common.TalkNLS(Attacker.Char, Character.say,
                "#me zielt etwas länger und trifft dadurch "..seinihr.." Ziel an einer ungeschützten Stelle.",
                "#me takes careful aim, hitting "..hisher.." target with precision and power.")
        elseif(Globals.criticalHit==8) then -- Wrest
            common.TalkNLS(Attacker.Char, Character.say,
                "#me führt einen extrem schnellen Hieb gegen "..seinihr.."en Gegner.",
                "#me strikes out extremely quickly, dealing a powerful blow to "..hisher.." opponent.")
        end
    end

    if(Globals.criticalHit==4) then
        --Knockback
        local CharOffsetX = Attacker.Char.pos.x - Defender.Char.pos.x
        local CharOffsetY = Attacker.Char.pos.y - Defender.Char.pos.y

        if (CharOffsetY > 0) then
            CharOffsetY = (Attacker.Weapon.Range - math.abs(CharOffsetX) + 1)
                * (-1)
        elseif (CharOffsetY < 0) then
            CharOffsetY = (Attacker.Weapon.Range - math.abs( CharOffsetX ) + 1)
        end

        if (CharOffsetX > 0) then
            CharOffsetX = (Attacker.Weapon.Range - math.abs(CharOffsetY) + 1)
                * (-1)
        elseif (CharOffsetX < 0) then
            CharOffsetX = (Attacker.Weapon.Range - math.abs(CharOffsetY) + 1)
        end

        local newPos = position(Defender.Char.pos.x + CharOffsetX,
            Defender.Char.pos.y + CharOffsetY, Defender.Char.pos.z)

        local targetPos=Defender.Char.pos

        local isNotBlocked = function(pos)
            if world:getField(pos):isPassable() then
                targetPos = pos
                return true
            else
                return false
            end
        end

        common.CreateLine(Defender.Char.pos, newPos, isNotBlocked)

        if targetPos ~= nil then
            Defender.Char:warp(targetPos)
            common.ParalyseCharacter(Defender.Char, 2, false, true)
        end
    elseif(Globals.criticalHit==5) then
        --Stun
        common.ParalyseCharacter(Defender.Char, 2, false, true)
    end
end

---Handles special effects
-- @param Defender The table of the attacked Character
function Counter(Attacker, Defender)
    if Defender.Char.attackmode then
        if common.Chance(1,50) then
            common.TalkNLS(Defender.Char, Character.say,
            "#me blockt geschickt den Hieb und macht sich schnell für einen Konter bereit.",
            "#me deftly blocks the hit and quickly readies stance for a counter attack.")
            character.ChangeFightingpoints(Defender.Char,-Defender.Char.fightpoints)
            Defender.Char.fightpoints = 21
        end
    end
end

--- Identify the used attack kind and set up identifier values and the skill
-- name. This also finds out if a singlehanded or a two-handed weapon is used.
-- Possible Values for AttackKind
-- 0 - wrestling
-- 1 - slashing
-- 2 - concussion
-- 3 - puncture
-- 4 - distance
-- @param CharStruct The table of the character the values should be generated
function GetAttackType(CharStruct)
    -- No weapon present:
    if not CharStruct.IsWeapon then
        CharStruct["AttackKind"] = 0
        CharStruct["UsedHands"] = 1
        CharStruct["Skillname"] = Character.wrestling
        return
    end

    local weaponType = CharStruct.Weapon.WeaponType
    if (weaponType == 1) or (weaponType == 4) then
        CharStruct["AttackKind"] = 1
        CharStruct["Skillname"] = Character.slashingWeapons
        if (weaponType == 1) then
            CharStruct["UsedHands"] = 1
        else
            CharStruct["UsedHands"] = 2
        end
    elseif (weaponType == 2) or (weaponType == 5) then
        CharStruct["AttackKind"] = 2
        CharStruct["Skillname"] = Character.concussionWeapons
        if (weaponType == 2) then
            CharStruct["UsedHands"] = 1
        else
            CharStruct["UsedHands"] = 2
        end
    elseif (weaponType == 3) or (weaponType == 6) then
        CharStruct["AttackKind"] = 3
        CharStruct["Skillname"] = Character.punctureWeapons
        if (weaponType == 3) then
            CharStruct["UsedHands"] = 1
        else
            CharStruct["UsedHands"] = 2
        end
    elseif (weaponType == 7) or (weaponType == 255) then
        CharStruct["AttackKind"] = 4
        CharStruct["Skillname"] = Character.distanceWeapons
        if (weaponType == 255) then
            CharStruct["UsedHands"] = 1
        else
            CharStruct["UsedHands"] = 2
        end
    elseif (weaponType == 13) then
        CharStruct["AttackKind"] = 5
        CharStruct["Skillname"] = Character.wandMagic
        CharStruct["UsedHands"] = 2
    end
end

--- Checks if the attacker is using a distance weapon and check and remove the
-- ammunition in case its needed
-- @param Attacker The table that stores the data of the attacking char
-- @return true in case the attack is good to go
function HandleAmmunition(Attacker)

    if not character.IsPlayer(Attacker.Char) then -- Monsters do not use ammo
        return true
    end

    if (Attacker.AttackKind ~= 4) then -- Ammo only needed for distance attacks
        return true
    end

    if (Attacker.Weapon.AmmunitionType == Attacker.SecWeapon.WeaponType) then

        Attacker.Char:increaseAtPos(Attacker.SecWeaponItem.itempos, -1)

        if Attacker.Char:getItemAt(Attacker.SecWeaponItem.itempos).number == 0 then
            Attacker.Char:inform("Du hast keine Munition mehr.", "You are out of ammunition.");
        end

    elseif (Attacker.Weapon.AmmunitionType == 255) then -- throwing axes, spears and throwing stars, thus they ARE the ammunition!

        Attacker.Char:increaseAtPos(Attacker.WeaponItem.itempos, -1)

        if Attacker.Char:getItemAt(Attacker.WeaponItem.itempos).number == 0 then
            Attacker.Char:inform("Du hast kein Wurfgeschoss mehr.", "You are out of throwing weapons.");
        end

    else
        return false
    end
    return true
end

--[[ Calculate the required movepoints
---- @param Attacker The table that stores the values of the attacker
---- @return the movepoints needed for the attack]]
function CalculateMovepoints(Attacker)
    local weaponFightpoints
    if Attacker.IsWeapon then
        weaponFightpoints = Attacker.Weapon.ActionPoints
    else
        weaponFightpoints = fighting.GetWrestlingMovepoints(Attacker.Race)
    end

    if Attacker.Weapon.AmmunitionType==10 then
        if(Attacker.SecWeaponItem.id==322) then
            weaponFightpoints = weaponFightpoints-1
        end
    end

    -- The Global Speed Mod (GSM). Increase this to make fights faster.
    local GlobalSpeedMod = 100
    return math.max(7, weaponFightpoints * (100 - (Attacker.agility-6) * 2.5) / GlobalSpeedMod)
end

--- Reduce the attacker movepoints by the fitting value.
-- @param Attacker The table that stores the values of the attacker
function HandleMovepoints(Attacker, Globals)
    local reduceFightpoints = CalculateMovepoints(Attacker)
    local fightPointsBeforeCritical = reduceFightpoints
    if(Globals.criticalHit==1) then -- special attack slashing: very fast strikes, reduced reduction
        reduceFightpoints = 2
    elseif(Globals.criticalHit>0) then
        reduceFightpoints = reduceFightpoints*1.5
    end

    -- For player archers, we remove the normal reduction and leave only the reduction because of criticals.
    -- They have a count BEFORE the shoot.
    -- The same technique is applied for ranged staff attacks
    local rangedAdjustment = 0
    if Attacker.AttackKind==4 and character.IsPlayer(Attacker.Char) then
        rangedAdjustment = fightPointsBeforeCritical
    end

    character.ChangeFightingpoints(Attacker.Char,-math.floor(reduceFightpoints-rangedAdjustment))

    if not character.IsPlayer(Attacker.Char) then
    --This is merely a hack. Without this, monsters just "fly" over tiles while attacking because they do not invest movepoints. Strangely, if we do the same for players, they get stalled. A profound solution is needed, most probably, this is a server issue. The line below does the job for now, but it's not a clean solution. ~Estralis
        character.ChangeMovepoints(Attacker.Char,-math.floor(reduceFightpoints-rangedAdjustment))
    end

    Globals["AP"] = reduceFightpoints

    return reduceFightpoints
end

--- Learning function.  Called after every attack.
-- @param Attacker The table containing the attacker data
-- @param Defender The table containing the defender data
function LearnSuccess(Attacker, Defender, AP, Globals)
    -- Attacker learns weapon skill
    if Attacker.Skillname then
        Attacker.Char:learn(Attacker.Skillname, AP/3, math.max(Defender.DefenseSkill, Defender.parry) + 20)
    end

    local rangedBonus = 0
    if Attacker.AttackKind==4 then
        rangedBonus = GetNecessaryAimingTime(Attacker)*10
    end

    -- Defender learns armour skill
    if Defender.DefenseSkillName then
        local armourfound, armour = world:getArmorStruct(Globals.HittedItem.id)
        if armourfound then
            Defender.Char:learn(Defender.DefenseSkillName,(AP+rangedBonus)/3,Attacker.skill + 20)
        end
    end

    -- Defender learns parry skill
    local parryWeapon

    --Choose which weapon has the largest defence
    if Defender.IsWeapon then
        parryWeapon = Defender.Weapon
    end

    if Defender.SecIsWeapon then
        if not parryWeapon then
            parryWeapon = Defender.SecWeapon
        elseif (parryWeapon.Defence < Defender.SecWeapon.Defence) then
            parryWeapon = Defender.SecWeapon
        end
    end

    if parryWeapon then
        Defender.Char:learn(Character.parry, AP/3, Attacker.skill + 20)
    end
end

--- Load the attributes and skills of a character. Depending on the offensive
-- parameter the skills for attacking or for defending are load.
-- @param CharStruct The character table of the char the values are load for
-- @param Offensive true in case attributes and skills for the attacker shall be
--                      load
function LoadAttribsSkills(CharStruct, Offensive)
    if Offensive then
        CharStruct["strength"] = NotNil(CharStruct.Char:increaseAttrib("strength", 0))
        CharStruct["agility"] = NotNil(CharStruct.Char:increaseAttrib("agility", 0))
        CharStruct["perception"] = NotNil(CharStruct.Char:increaseAttrib("perception", 0))
        if CharStruct.Skillname == nil then
            CharStruct["skill"] = 0
        else
            CharStruct["skill"] = NotNil(CharStruct.Char:getSkill(CharStruct.Skillname))
        end
        CharStruct["natpoison"] = 0
        CharStruct["dexterity"] = NotNil(CharStruct.Char:increaseAttrib("dexterity", 0))
    else
        CharStruct["dexterity"] = NotNil(CharStruct.Char:increaseAttrib("dexterity", 0))
        CharStruct["constitution"] = NotNil(CharStruct.Char:increaseAttrib("constitution", 0))
        CharStruct["parry"] = NotNil(CharStruct.Char:getSkill(Character.parry))
        CharStruct["agility"] = NotNil(CharStruct.Char:increaseAttrib("agility", 0))
    end
    CharStruct["Race"] = CharStruct.Char:getRace()
end

--- Check if the character is on newbie island and reject the attack in that.
-- This is required to allow newbie island to work correctly.
-- @param Attacker The character who is attacking
-- @param Defender The character who is attacked
-- @return true in case the attack can go on, else it has to be stopped
function NewbieIsland(Attacker, Defender)
    -- not in the newbie island and the Attack is okay.
    if not common.isOnNoobia(Attacker.pos) then
        return true
    end

    -- in case the character it not a other player character, the Attack is okay anyway.
    if not character.IsPlayer(Defender) then
        return true
    end

    -- the Attacker did not start the newbie island quest. Attack is fine.
    if (Attacker:getQuestProgress(2) == 0) then
        return true
    end

    -- The Attacker is a GM. Attacking is fine
    if Attacker:isAdmin() then
        return true
    end

    -- So now the character is on newbie island and not allowed to Attack.
    -- Protection to ensure the player is not spammed to death with messages.
    if not common.spamProtect(Attacker, 5) then
        common.InformNLS(Attacker,
            "[Tutorial] Du darfst während des Tutorials noch keine anderen Spieler angreifen. Klicke nochmals rechts auf deinen Gegner um den Kampf abzubrechen.",
            "[Tutorial] You are not allowed to attack other players during the tutorial. Right click again on your enemy to cancel the attack.")
    end
    return false
end

--- Play the sound of a successful parry.
-- @param Attacker The table of the character who is attacking
-- @param Defender The table of the character who is attacked
function PlayParrySound(Attacker, Defender)
    if not Attacker.IsWeapon then
        world:makeSound(32,Attacker.Char.pos)
        return true
    end

    if not Defender.IsWeapon and not Defender.SecIsWeapon then
        world:makeSound(32,Attacker.Char.pos)
        return true
    end

    local DefenderWeapon = 0
    if Defender.IsWeapon then
        DefenderWeapon = Defender.Weapon.WeaponType
    end

    if Defender.SecIsWeapon then
        DefenderWeapon = math.max(DefenderWeapon,
            Defender.SecWeapon.WeaponType)
    end

    -- Parry sounds
    -- Line and column the item Types the attacker and the defender are
    -- using
    -- id of the sounds that shall be played at a parry
    local Sounds = {}
    Sounds[1]={32,32,32,32,32,32}
    Sounds[2]={32,42,43,42,42,44}
    Sounds[3]={32,43,41,42,40,41}
    Sounds[4]={32,42,42,42,42,44}
    Sounds[5]={32,42,40,42,42,44}
    Sounds[6]={32,44,41,44,44,41}
    Sounds[14]={32,43,41,42,40,41 }

    if (Sounds[DefenderWeapon] ~= nil) then
        if (Sounds[DefenderWeapon][Attacker.Weapon.WeaponType] ~= nil) then
            world:makeSound(Sounds[DefenderWeapon][Attacker.Weapon.WeaponType],
                Attacker.Char.pos)
            return true
        end
    end
    world:makeSound(32, Attacker.Char.pos)
    return true
end

--- Show the attacking animation for the attacking character.
-- @param Attacker The table that stores the attacker data
function ShowAttackGFX(Attacker)
    local race = Attacker.Char:getRace()
    if race >= 0 and race <= 6 then -- Player races + drows have proper animations
        if (Attacker.AttackKind == 0) then -- wrestling
            Attacker.Char:performAnimation(5)
        elseif (Attacker.AttackKind == 4) then -- distance
            Attacker.Char:performAnimation(7)
        elseif (Attacker.UsedHands == 2) then -- 2 hands attack
            Attacker.Char:performAnimation(6)
        else -- 1 hand attack
            Attacker.Char:performAnimation(5)
        end
    else -- The rest will use the old gfx
        local gfxId = 22
        if (Attacker.AttackKind == 0) then --wrestling
            gfxId = 22
        elseif (Attacker.AttackKind == 1) then --slashing
            gfxId = 17
        elseif (Attacker.AttackKind == 2) then --concussion
            gfxId = 19
        elseif (Attacker.AttackKind == 3) then --puncture
            gfxId = 20
        elseif (Attacker.AttackKind == 4) then --distance
            gfxId = 15
        end
        world:gfx(gfxId,Attacker.Char.pos)
    end
end

--- Show the effects of a successful attack. This Drops some blood in case
-- the attack is very strong or a critical hit and it raises the sound effects
-- that fit this attack.
-- @param Attacker The table of the attacking Character
-- @param Defender The table of the attacked Character
-- @param Globals The table of the global values
function ShowEffects(Attacker, Defender, Globals)
    if (Globals.Damage > 0) then
        world:gfx(13, Defender.Char.pos) -- Blood effect, remove maybe?
        Defender.Char:performAnimation(10) -- Hit animation
        if Globals.criticalHit>0 then
            DropMuchBlood(Defender.Char.pos)
        elseif (Globals.Damage > 2000) then
            DropBlood(Defender.Char.pos)
        end
    end

    if (Attacker.AttackKind == 0) then --wresting
        world:makeSound(3,Defender.Char.pos)
    elseif (Attacker.AttackKind==1) then --slashing
        world:makeSound(33,Defender.Char.pos)
    elseif (Attacker.AttackKind==2) then --concussion
        world:makeSound(32,Defender.Char.pos)
    elseif (Attacker.AttackKind==3) then --puncture
        world:makeSound(33,Defender.Char.pos)
    elseif (Attacker.AttackKind==4) then --distance
        world:makeSound(31,Defender.Char.pos)
    end
end

return M

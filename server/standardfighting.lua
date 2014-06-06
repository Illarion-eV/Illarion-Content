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
-- Written by Flux


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

-- Hang in base.common - Some functions of the collection are needed
require("base.common")

-- Include base.character to use the methods changing some attributes of the character properly there
require("base.character")

-- For learning skills...
require("server.learn")

-- Lists with static values of the fighting system
require("content.fighting")

-- Include the regeneration LTE to access the control functions of this LTE
require("lte.chr_reg");

-- for gem bonus
require("base.gems")

module("server.standardfighting", package.seeall)

firstTimeList = {}

-- selects a target for monster from candidates, 0 means no target found
-- this default can be overridden by a monster's setTarget entrypoint
function setTarget(monster, candidates)
    local target = 0

    for key,candidate in pairs(candidates) do
        if isPossibleTarget(monster, candidate) and (target == 0
                or isBetterTarget(candidates[target], candidate)) then
            target = key
        end

    end

	if target ~= 0 then
		local monsterId = monster.id;
		local candidate = candidates[target];
		firstTimeList[monsterId] = candidate.id;
	end
    return target
end

function isArcher(archer, target)

	local lItem = archer:getItemAt(Character.left_tool)
	local rItem = archer:getItemAt(Character.right_tool)
	local rAttFound, rAttWeapon = world:getWeaponStruct(rItem.id)
    local lAttFound, lAttWeapon = world:getWeaponStruct(lItem.id)

	local range = nil;
	if lAttFound and lAttWeapon.WeaponType == 7 then
		range = lAttWeapon.Range
	elseif rAttFound and rAttWeapon.WeaponType == 7 then
		range = rAttWeapon.Range
	end
	
	return range;
end



function isPossibleTarget(monster, candidate)
    if candidate:getType() ~= Character.player and candidate.pos.z ~= -40 then
        return false
    end
    
    if (candidate:getQuestProgress(36) ~= 0) then
		return false;
	end

	local distance
	local monsterId = monster.id
	if firstTimeList[monsterId] ~= nil and firstTimeList[monsterId] == candidate.id then
		distance = 10
	else
		distance = 8
	end


	local range = isArcher(monster, candidate)
	if  range ~= nil and candidate:distanceMetric(monster) > range then
		return false;
	elseif range then
		local blockList = world:LoS( monster.pos, candidate.pos )
		local next = next	-- make next-iterator local
		if (next(blockList)~=nil) then	-- see if there is a "next" (first) object in blockList!
				return false;				-- something blocks
		end
	elseif candidate:distanceMetric(monster) > distance then
		return false;
	end
	
	return true
end

function isBetterTarget(currentTarget, candidate)
    return candidate:increaseAttrib("hitpoints", 0)
            < currentTarget:increaseAttrib("hitpoints", 0)
end

--- Main Attack function. This function is called by the server to start an
-- attack.
-- @param Attacker The character who attacks
-- @param Defender The character who is attacked
-- @return true in case a attack was performed, else false
function onAttack(Attacker, Defender)

	-- Prepare the lists that store the required values for the calculation
    local Attacker = { ["Char"]=Attacker };
    local Defender = { ["Char"]=Defender };
    local Globals = {};


    -- Newbie Island Check
    if not NewbieIsland(Attacker.Char, Defender.Char) then return false; end;

    -- Load the weapons of the attacker
    LoadWeapons(Attacker);
	if Attacker.Weapon.WeaponType==13 then
		return false
	end

	-- Find out the attack type and the required combat skill
	GetAttackType(Attacker);

	-- Load Skills and Attributes of the attacking character
    LoadAttribsSkills(Attacker, true);

	-- Check aiming time for player archers
	if Attacker.AttackKind==4 and Attacker.Char:getType() == Character.player and not CheckAimingTime(Attacker,Defender.Char,CheckRange(Attacker, Defender.Char)) then
		return false
	end

	-- Check the range between the both fighting characters
    if not CheckRange(Attacker, Defender.Char) then return false; end;


    -- Check if the attack is good to go (possible weapon configuration)
    if not CheckAttackOK(Attacker) then
        return false;
    end;

    -- Check if ammunition is needed and use it
    if not HandleAmmunition(Attacker) then return false; end;

    -- Load weapon data, skills and attributes of the attacked character
    LoadWeapons(Defender);
    LoadAttribsSkills(Defender, false);

	--Calculate crit chance
	if CheckCriticals(Attacker, Defender, Globals) then
		--Do special crit effects
		Specials(Attacker, Defender, Globals);
	end;

    -- Calculate and reduce the required movepoints
    local APreduction = HandleMovepoints(Attacker, Globals);

	-- Turning the attacker to his victim
    base.common.TurnTo(Attacker.Char,Defender.Char.pos);

    -- Show the attacking animation
    ShowAttackGFX(Attacker);

    -- Check if a coup de gráce is performed
    if CoupDeGrace(Attacker, Defender) then return true; end;

    -- Calculate the chance to hit
    if not HitChance(Attacker, Defender, Globals) then
        -- Place some ammo on the ground in case ammo was used
        DropAmmo(Attacker, Defender.Char, true);
        return;
    end;

    -- Calculate the damage caused by the attack
    CalculateDamage(Attacker, Globals);

    -- Reduce the damage due the absorbtion of the armor
    ArmourAbsorption(Attacker, Defender, Globals);

    -- The effect of the constitution. After this the final damage is avaiable.
    ConstitutionEffect(Defender, Globals);

    -- Cause the finally calculated damage to the player
    CauseDamage(Attacker, Defender, Globals);

	--Cause degradation
	ArmourDegrade(Defender,Globals);

    -- Show the final effects of the attack.
    ShowEffects(Attacker, Defender, Globals);

    -- Teach skills to attacker and defender
    LearnSuccess(Attacker, Defender, APreduction, Globals)
end;

--------------------------------------------------------------------------------
-- The following functions are support functions that are used to make the    --
-- fighting system work in the way expected. They contain all the needed      --
-- calculations to perform a proper fight.                                    --
--------------------------------------------------------------------------------

-- List to store all information for aiming time
AIMING_TIME_LIST = {}

-- Check if enough aiming time has passed for the archer in order to shoot
-- @param AttackerList List containing Attacker and weapon
-- @param Defender The defending character
-- @param inRange Boolean if the defender is in range to aim/shoot at him
function CheckAimingTime(AttackerList,Defender,inRange)
	local Attacker = AttackerList["Char"]
	--[[
	if not inRange then
		AIMING_TIME_LIST[Attacker.id] = nil
		return false
	end
	]]
	if AIMING_TIME_LIST[Attacker.id] == nil then
		FillAimingTimeList(Attacker,Defender,AttackerList.Weapon.id)
		return false
	else
		-- Check if weapon and target are the same and if the attacker hasn't moved
		if AttackerList.Weapon.id ~= AIMING_TIME_LIST[Attacker.id]["weapon"] or Defender.id ~= AIMING_TIME_LIST[Attacker.id]["target"] or Attacker.pos.x.." "..Attacker.pos.y.." "..Attacker.pos.z ~= AIMING_TIME_LIST[Attacker.id]["position"] then
			FillAimingTimeList(Attacker,Defender,AttackerList.Weapon.id)
			return false

		elseif (world:getTime("unix") - AIMING_TIME_LIST[Attacker.id]["started"])*10 > GetNecessaryAimingTime(AttackerList) + 20 then
			-- that is needed to prevent that someone aims, stops aiming, waits a long time and as soon as he targets the same character again, shoots immediately.
			-- this has to be done since there is no way to clear the list when someone stops targeting the target
			AIMING_TIME_LIST[Attacker.id]["counter"] = 1
			AIMING_TIME_LIST[Attacker.id]["started"] = world:getTime("unix")
			--ShowAimingGfx(AttackerList)
			return false

		elseif AIMING_TIME_LIST[Attacker.id]["counter"] <= GetNecessaryAimingTime(AttackerList) and (world:getTime("unix") - AIMING_TIME_LIST[Attacker.id]["started"])*10 < math.ceil(GetNecessaryAimingTime(AttackerList)) then
			-- not enough time has passed; display a nice gfx to show that the character is aiming and increase counter
		    --ShowAimingGfx(AttackerList)
			AIMING_TIME_LIST[Attacker.id]["counter"] = AIMING_TIME_LIST[Attacker.id]["counter"] + 1

		else
			return true
		end
	end


end

-- Show aiming gfx. The char has to have been standing still for some calls of onAttack before the gfx starts
-- @param Attacker The character attacking
function ShowAimingGfx(AttackerList)
	local Attacker = AttackerList["Char"]
	if AIMING_TIME_LIST[Attacker.id]["counter"] % 7 == 0 then
		world:gfx(21,Attacker.pos)
	end

end

-- Store all necessary information in the global list for aiming time
-- @param Attacker The character attacking
-- @param Defender The character defender
-- @param WeaponId Id of the weapon used
function FillAimingTimeList(Attacker,Defender,weaponId)

	AIMING_TIME_LIST[Attacker.id] = {}
	AIMING_TIME_LIST[Attacker.id]["counter"] = 1 -- increased on every call; normally every 1/10 seconds
	AIMING_TIME_LIST[Attacker.id]["started"] = world:getTime("unix") -- we use that as a security measure. In case onAttack is not called every 1/10 (e.g. lack of ap), the action is excecuted then ext full sec(e.g. if 1.7 seconds are necessary but onAttack hasnt been called properly, the action is xeceuted after 2 sec)
	AIMING_TIME_LIST[Attacker.id]["weapon"] = weaponId
	AIMING_TIME_LIST[Attacker.id]["target"] = Defender.id
	AIMING_TIME_LIST[Attacker.id]["position"] = Attacker.pos.x.." "..Attacker.pos.y.." "..Attacker.pos.z

end

-- Calculate time necessary to aim, depedning on attribute and weapon.
-- @param Attacker The character attacking
-- @param Weapon The weapon used
-- @return The time needed for an attack in 1/10 seconds
function GetNecessaryAimingTime(Attacker)
	-- we use a default value for every character and weapon; the differences in attributes and weapons come in play when the movepoints are lowered/regenerated
	return math.floor(CalculateMovepoints(Attacker)+0.5)
end

--- Calculate the damage that is absorbed by the armor and reduce the stored
-- armor value by this amount.
-- @param Attacker The table that stores the data of the attacker
-- @param Defender The table that stores the data of the defender
-- @param Globals The table that stores the global values
function ArmourAbsorption(Attacker, Defender, Globals)

	GetArmourType(Defender, Globals);
	local armourfound, armour;
	armourfound, armour = world:getArmorStruct(Globals.HittedItem.id);

	local armourValue = 0;

	local skillmod = 1;
	local qualitymod = 0.82+0.02*math.floor(Globals.HittedItem.quality/100);

    --[[if armourfound then
		skillmod = 1-Defender.DefenseSkill/250;
        if (Attacker.AttackKind == 0) then --wrestling
            armourValue = armour.ThrustArmor;
        elseif (Attacker.AttackKind == 1) then --slashing
            armourValue = armour.StrokeArmor;
        elseif (Attacker.AttackKind == 2) then --concussion
            armourValue = armour.ThrustArmor;
        elseif (Attacker.AttackKind == 3) then --puncture
            armourValue = armour.PunctureArmor;
        elseif (Attacker.AttackKind == 4) then --distance
            armourValue = armour.PunctureArmor;
        end;
    end;]]

	--Essentially what this does is choose how much the values are divided. So stroke is half as effective as punc is half as effective as thrust for one type etc.

	
	-- B I G mistake below: Level 0 armours have a armourValue of exactly 0. A dude in plate armour has the same armorValue as a naked moron- FIX!!! ~Estralis
	local ArmourDefenseScalingFactor = 2;
	local GeneralScalingFactor = 2.8;

	if not (Defender.Char:getType() == 1) then --if not monster

		if armourfound then
			skillmod = 1-Defender.DefenseSkill/250;
			if (Attacker.AttackKind == 0 or Attacker.AttackKind == 2) then --wrestling/conc
				if (armour.Type==2) then -- Light armour
					armourValue = armour.Level;
				elseif(armour.Type==3) then -- Medium armour
					armourValue = armour.Level/(ArmourDefenseScalingFactor);
				elseif(armour.Type==4) then -- Heavy armour
					armourValue = armour.Level/(ArmourDefenseScalingFactor*ArmourDefenseScalingFactor);
				elseif(armour.Type==1) then -- General armour
					armourValue = armour.Level/GeneralScalingFactor;
				end;
			elseif (Attacker.AttackKind == 1) then -- Slash
				if (armour.Type==2) then -- Light armour
					armourValue = armour.Level/(ArmourDefenseScalingFactor*ArmourDefenseScalingFactor);
				elseif(armour.Type==3) then -- Medium armour
					armourValue = armour.Level;
				elseif(armour.Type==4) then -- Heavy armour
					armourValue = armour.Level/(ArmourDefenseScalingFactor);
				elseif(armour.Type==1) then -- General armour
					armourValue = armour.Level/GeneralScalingFactor;
				end;
			elseif (Attacker.AttackKind == 3 or Attacker.AttackKind == 4) then -- Puncture
				if (armour.Type==2) then -- Light armour
					armourValue = armour.Level/(ArmourDefenseScalingFactor);
				elseif(armour.Type==3) then -- Medium armour
					armourValue = armour.Level/(ArmourDefenseScalingFactor*ArmourDefenseScalingFactor);
				elseif(armour.Type==4) then -- Heavy armour
					armourValue = armour.Level;
				elseif(armour.Type==1) then -- General armour
					armourValue = armour.Level/GeneralScalingFactor;
				end;
			end;
		end;
	else
		local thingvalue=NotNil(Defender.Char:getSkill(Character.wrestling));
		skillmod = 1-thingvalue/250;
		armourValue = thingvalue;
	end;

	local Noobmessupmalus = 5; -- Amount that armour value is divided by if your skill isn't high enough to use this armour.
	--No level implemented yet, for now derive it from the armour value.
	--[[local ArmourLevel=0;

	local skilltype= Defender.DefenseSkillName;
	if(skilltype==Character.lightArmour) then
		ArmourLevel = armour.ThrustArmor;
	elseif (skilltype==Character.mediumArmour) then
		ArmourLevel = armour.StrokeArmor;
	elseif (skilltype==Character.heavyArmour) then
		ArmourLevel = armour.PunctureArmor;
	end;]]

	if(armour.Level>Defender.DefenseSkill and not Defender.Char:getType() == 1 ) then
		armourValue = armourValue/Noobmessupmalus;
	end

	local Rarity = NotNil(tonumber(Globals.HittedItem:getData("RareArmour")));

	if(Rarity<0) then -- Armour is broken
		armourValue = armourValue/2;
	elseif(Rarity>0) then -- Armour is a rare artifact
		--Each bonus is equivalent to 20 skill levels of equipment.
		local RarityBonus = 20*Rarity;
		armourValue = armourValue+RarityBonus;
	end

	if(Globals.criticalHit==6) then
		--Armour pierce
		armourValue=0;
	end;

	-- This Armour Scaling Factor (ASF) is important. You can think of it like this:
	-- If ASF = 5, the top armour in the game is 5x as good as the worst armour in the game
	local ArmourScalingFactor = 5;

	if(armourValue>0) then
		armourValue = (100/ArmourScalingFactor) + armourValue*(1-1/ArmourScalingFactor);
	end

	--Race armour for monsters
    armourfound, armour = world:getNaturalArmor(Defender.Race);

		if armourfound then
			if (Attacker.AttackKind == 0) then --wrestling
				armourValue = armourValue + armour.thrustArmor;
			elseif (Attacker.AttackKind == 1) then --slashing
				armourValue = armourValue + armour.strokeArmor;
			elseif (Attacker.AttackKind == 2) then --concussion
				armourValue = armourValue + armour.thrustArmor;
			elseif (Attacker.AttackKind == 3) then --puncture
				armourValue = armourValue + armour.punctureArmor;
			elseif (Attacker.AttackKind == 4) then --distance
				armourValue = armourValue + armour.punctureArmor;
			end;
		end;
		  
    Globals.Damage = Globals.Damage - (Globals.Damage * armourValue * qualitymod / 140);

	Globals.Damage = skillmod*Globals.Damage;

    Globals.Damage = math.max(0, Globals.Damage);
end;


function ArmourDegrade(Defender, Globals)

	--WHAT IS THIS? Pleae use comments. ~Estralis
	local Rarity = NotNil(tonumber(Globals.HittedItem:getData("RareArmour")));

	if(Rarity<0) then

		local durability = math.mod(Globals.HittedItem.quality, 100);
		local quality = (Globals.HittedItem.quality - durability) / 100;
		local nameText=world:getItemName(Globals.HittedItem.id,Defender.Char:getPlayerLanguage());
		
		durability = durability - 20;

		if (durability <= 0) then
			base.common.InformNLS(Defender.Char,
		  "Dein Artefakt '"..nameText.."' zerbricht. Das nächste Mal solltest du dich besser darum kümmern.",
		  "Your artifact '"..nameText.."' shatters. You should take better care of it next time.");
		  world:erase(Globals.HittedItem, 1);
		  return true;
		end;

		Globals.HittedItem.quality = quality * 100 + durability;
		--world:changeItem(Globals.HittedItem.WeaponItem);
		world:changeItem(Globals.HittedItem);


		base.common.InformNLS(Defender.Char,
		"Du solltest dein kaputtes Artefakt '"..nameText.."' ablegen bevor es zerbricht!",
		"You should take off your broken artifact '"..nameText.."' before it shatters!");

		
	elseif (base.common.Chance(Globals.Damage, 12000)) and (Globals.HittedItem.id ~= 0) then -- do not damage non existing items

		local durability = math.mod(Globals.HittedItem.quality, 100);
		local quality = (Globals.HittedItem.quality - durability) / 100;
		local nameText=world:getItemName(Globals.HittedItem.id,Defender.Char:getPlayerLanguage());
		
		durability = durability - 1;
		
		if (durability == 0) then
			base.common.InformNLS(Defender.Char,
		  "Dein Rüstungsteil '"..nameText.."' zerbricht. Glücklicherweise tritt kein Splitter in deinen Körper ein.",
		  "Your armour piece '"..nameText.."' shatters. Thankfully, no fragments end up in your body.");
		  world:erase(Globals.HittedItem, 1);
		  return true;
		end;
		
		Globals.HittedItem.quality = quality * 100 + durability;
		--world:changeItem(Globals.HittedItem.WeaponItem);
		world:changeItem(Globals.HittedItem);

		if (durability < 10) then
		  base.common.InformNLS(Defender.Char,
		  "Dein Rüstungsteil '"..nameText.."' hat schon bessere Zeiten gesehen. Vielleicht solltest du es reparieren.",
		  "Your armour piece '"..nameText.."' has seen better days. You may want to repair it.");
		end;
	end;

end;

-- @param Attacker The table that stores the data of the attacker
-- @param Defender The table that stores the data of the defender
-- @param ParryWeapon The item which was used to parry
function WeaponDegrade(Attacker, Defender, ParryWeapon)

	local Rarity = NotNil(tonumber(Attacker.WeaponItem:getData("RareWeapon")));
    local nameText=world:getItemName(Attacker.WeaponItem.id,Attacker.Char:getPlayerLanguage());

	if(Rarity<0) then

		local durability = math.mod(Attacker.WeaponItem.quality, 100);
		local quality = (Attacker.WeaponItem.quality - durability) / 100;

		durability = durability - 20;

		if (durability <= 0) then
			base.common.InformNLS(Attacker.Char,
		  "Dein Artefakt '"..nameText.."' zerbricht. Das nächste Mal solltest du dich besser darum kümmern.",
		  "Your artifact '"..nameText.."' shatters. You should take better care of it next time.");
		  world:erase(Attacker.WeaponItem, 1);
		  return true;
		end;

		Attacker.WeaponItem.quality = quality * 100 + durability;
		--world:changeItem(Globals.HittedItem.WeaponItem);
		world:changeItem(Attacker.WeaponItem);

		base.common.InformNLS(Defender.Char,
		"Du solltest aufhören, dein kaputtes Artefakt '"..nameText.."' zu verwenden, bevor es zerbricht!",
		"You should stop wielding your broken artifact '"..nameText.."' before it shatters!");

	elseif (base.common.Chance(1, 20)) and (Attacker.WeaponItem.id ~= 0) then

		local durability = math.mod(Attacker.WeaponItem.quality, 100);
		local quality = (Attacker.WeaponItem.quality - durability) / 100;

		durability = durability - 1;
				
		if (durability == 0) then
			base.common.InformNLS(Attacker.Char,
		  "Deine Waffe '"..nameText.."' zerbricht. Du vergießt eine bitter Träne und sagst lebe wohl, als sie in das nächste Leben übergeht.",
		  "Your weapon '"..nameText.."' shatters. You shed a single tear and bid it farewell as it moves onto its next life.");
		  world:erase(Attacker.WeaponItem, 1);
		  return true;
		end

		Attacker.WeaponItem.quality = quality * 100 + durability;
		world:changeItem(Attacker.WeaponItem);

		if (durability < 10) then
		  base.common.InformNLS(Attacker.Char,
		  "Deine Waffe '"..nameText.."' hat schon bessere Zeiten gesehen. Vielleicht solltest du sie reparieren.",
		  "Your weapon '"..nameText.."' has seen better days. You may want to repair it.");
		end;
	end;

	Rarity = NotNil(tonumber(ParryWeapon:getData("RareWeapon")));
    local nameText=world:getItemName(ParryWeapon.id,Defender.Char:getPlayerLanguage());
	
	if(Rarity<0) then

		local durability = math.mod(ParryWeapon.quality, 100);
		local quality = (ParryWeapon.quality - durability) / 100;

		durability = durability - 20;

		if (durability <= 0) then
			base.common.InformNLS(Defender.Char,
		  "Dein Artefakt '"..nameText.."' zerbricht. Das nächste Mal solltest du dich besser darum kümmern.",
		  "Your artifact '"..nameText.."' shatters. You should take better care of it next time.");
		  world:erase(ParryWeapon, 1);
		  return true;
		end;


		ParryWeapon.quality = quality * 100 + durability;
		--world:changeItem(Globals.HittedItem.WeaponItem);
		world:changeItem(ParryWeapon);


		base.common.InformNLS(Defender.Char,
		"Du solltest aufhören, dein kaputtes Artefakt '"..nameText.."' zu verwenden, bevor es zerbricht!",
		"You should stop wielding your broken artifact '"..nameText.."' before it shatters!");

	elseif (base.common.Chance(1, 60)) and (ParryWeapon.id ~= 0) then
		local durability = math.mod(ParryWeapon.quality, 100);
		local quality = (ParryWeapon.quality - durability) / 100;

		durability = durability - 1;
				
		if (durability == 0) then
			base.common.InformNLS(Defender.Char,
		  "Dein Gegenstand '"..nameText.."' zerbricht, dies erschwert es dir, dich zu verteidigen.",
		  "Your item '"..nameText.."' shatters, making it more difficult for you to defend yourself.");
		  world:erase(ParryWeapon, 1);
		  return true;
		end

		ParryWeapon.quality = quality * 100 + durability;
		world:changeItem(ParryWeapon);

		if (durability < 10) then
		  base.common.InformNLS(Defender.Char,
		  "Dein Gegenstand '"..nameText.."' hat schon bessere Zeiten gesehen. Vielleicht solltest du ihn reparieren.",
		  "Your item '"..nameText.."' has seen better days. You may want to repair it.");
		end;
	end;

end;

--- Calculate the damage that is caused by the attack. This function calculates
-- the raw damage and stores it in the globals table. The damage calculated here
-- has to be lowered by the armor and the constitution of the attacked
-- character.
-- @param Attacker The table of the character who is attacking
-- @param Globals The global data table
function CalculateDamage(Attacker, Globals)
    local BaseDamage;
    local StrengthBonus;
    local PerceptionBonus;
    local DexterityBonus;
    local SkillBonus;
	local CritBonus=1;
	local QualityBonus;
    --local TacticsBonus;

    if Attacker.IsWeapon then
        BaseDamage = Attacker.Weapon.Attack * 10;

		-- If it has RareWeapon data 1, 2 or 3 it's a special version. Has more attack.
		local Rarity = NotNil(tonumber(Attacker.WeaponItem:getData("RareWeapon")));
		if (Rarity>0) then
			--This "20" corresponds to how many skill levels it should boost by. 20 is the value for now. Might be OP. If so, lower.
			local RarityBonus = 20*Rarity;
			--This "6" value isn't a frickelfactor. It comes from the fact that attack for eachh weapon is derived by:
			--AP/Accuracy*(150+ASL*6), where ASL is Associated Skill Level. This means a level 100 weapon is 5x as good as a base one.
			--This formula is used because the base WF values are based on 1.5+ASL*6/100
			BaseDamage = BaseDamage + Attacker.Weapon.ActionPoints/Attacker.Weapon.Accuracy*6*RarityBonus;
		end

    else
        BaseDamage = content.fighting.GetWrestlingAttack( Attacker.Race ) * 10;
    end;

	-- Noob messup malus
	local Noobmessupmalus = 5; -- Amount that armour value is divided by if your skill isn't high enough to use this armour.

	if(Attacker.Weapon.Level>Attacker.skill and not Attacker.Char:getType() == 1 ) then
		BaseDamage = BaseDamage/Noobmessupmalus;
	end

    StrengthBonus = (Attacker.strength - 6) * 3;
    PerceptionBonus = (Attacker.perception - 6) * 1;
    DexterityBonus = (Attacker.dexterity - 6) * 1;
    SkillBonus = (Attacker.skill - 20) * 1.5;
    --TacticsBonus = (Attacker.tactics - 20) * 0.5;
    GemBonus = base.gems.getGemBonus(Attacker.WeaponItem);

	--Quality Bonus: Multiplies final value by 0.91-1.09
	QualityBonus = 0.91+0.02*math.floor(Attacker.WeaponItem.quality/100);

	--Crit bonus
	if Globals.criticalHit>0 then
		CritBonus=1.5;
	end;

	--The Global Damage Factor (GDF). Adjust this to change how much damage is done per hit on all attacks.
	local GlobalDamageFactor = 1/180;

    Globals["Damage"] = GlobalDamageFactor*BaseDamage * CritBonus * QualityBonus * (100 + StrengthBonus + PerceptionBonus + DexterityBonus + SkillBonus + GemBonus);

end;

--- Deform some final checks on the damage that would be caused and send it to
-- the character. Also here the Coup de Gráce is done.
-- @param Attacker The table of the attacking Character
-- @param Defender The table of the attacked Character
-- @param Globals The table of the global values

function CauseDamage(Attacker, Defender, Globals)

	if(Attacker.AttackKind == 4) and Attacker.Char:getType() == Character.player then -- reste counter for archers
		AIMING_TIME_LIST[Attacker.Char.id]["counter"] = 1
		AIMING_TIME_LIST[Attacker.Char.id]["started"] = world:getTime("unix")
	end

	Globals.Damage=Globals.Damage*(math.random(9,10)/10); --Damage is randomised: 80-120%

	Globals.Damage=math.min(Globals.Damage,4999); --Damage is capped at 4999 Hitpoints to prevent "one hit kills"

	Globals.Damage=math.floor(Globals.Damage); --Hitpoints are an integer

    --Attacker.Char:inform("Dealt damage: ".. Globals.Damage .. " HP."); --Debugging
	--Defender.Char:inform("Received damage: ".. Globals.Damage .. " HP."); --Debugging

    if base.character.IsPlayer(Defender.Char) and not Defender.Char:isAdmin() and base.character.WouldDie(Defender.Char, Globals.Damage + 1) and not base.character.AtBrinkOfDeath(Defender.Char) then
        -- Character would die. Nearly killing him and moving him back in case it's possible
        base.character.ToBrinkOfDeath(Defender.Char);

        local CharOffsetX = Attacker.Char.pos.x - Defender.Char.pos.x;
        local CharOffsetY = Attacker.Char.pos.y - Defender.Char.pos.y;

		local range = Attacker.Weapon.Range;
		if(Attacker.AttackKind == 4) then
			range = 1;
		end;

        if (CharOffsetY > 0) then
            CharOffsetY = (range - math.abs(CharOffsetX) + 1)
                * (-1);
        elseif (CharOffsetY < 0) then
            CharOffsetY = (range - math.abs( CharOffsetX ) + 1);
        end;

        if (CharOffsetX > 0) then
            CharOffsetX = (range - math.abs(CharOffsetY) + 1)
                * (-1);
        elseif (CharOffsetX < 0) then
            CharOffsetX = (range - math.abs(CharOffsetY) + 1);
        end;

        local newPos = position(Defender.Char.pos.x + CharOffsetX,
            Defender.Char.pos.y + CharOffsetY, Defender.Char.pos.z);

        local targetPos=Defender.Char.pos;

        isNotBlocked = function(pos)
            if world:getField(pos):isPassable() then
                targetPos = pos;
                return true;
            else
                return false;
            end
        end

        base.common.CreateLine(Defender.Char.pos, newPos, isNotBlocked);

        if targetPos ~= startPos then
            Defender.Char:warp(targetPos)
        end

        base.common.TalkNLS(Defender.Char, Character.say,
            "#me stolpert zurück und geht zu Boden.",
            "#me stumbles back and falls to the ground.");

		if not Defender.Char:isAdmin() then --Admins don't want to get paralysed!

            base.common.ParalyseCharacter(Defender.Char, 7, false, true);
			TimeFactor=1; -- See lte.chr_reg
			lte.chr_reg.stallRegeneration(Defender.Char, 60/TimeFactor); -- Stall regeneration for one minute. Attention! If you change TimeFactor in lte.chr_reg to another value but 1, you have to divide this "60" by that factor
			
		end
		
        return true;
		
    else
	
		base.character.ChangeHP(Defender.Char,-Globals.Damage); -- Finally dealing the damage.
	
        if (Attacker.AttackKind == 4) then -- Ranged attack
            if Defender.Char:getType() == Character.monster and Attacker.Char:getType() == Character.player then
				Defender.Char.movepoints = Defender.Char.movepoints - 5;
			end
            DropAmmo(Attacker, Defender.Char, false);
        end;
    end;
end;


--- Check that the attack hits
-- @param Defender The character who attacks
-- @param Defender The character who is attacked
-- @return true if the attack is successful
function HitChance(Attacker, Defender, Globals)

	local DirectionDifference = math.abs(Defender.Char:getFaceTo()-Attacker.Char:getFaceTo());
    local parryWeapon;
	local canParry=true;
	local parryItem; -- For degradation

	--Miss chance. 2% bonus to hit chance for 18 perc, 1.75% malus for 3 perc. Added onto weapon accuracy.
	local chancetohit;

	if Attacker.IsWeapon then
		chancetohit = Attacker.Weapon.Accuracy*(1+(Attacker.perception-10)/500);

		--if Attacker.Weapon.Level>Attacker.skill) then
			--chancetohit=chancetohit/5;
		--end

	else --unarmed
		chancetohit = 90*(1+(Attacker.perception-10)/500);
	end;

	-- Min and max hit chance are 5% and 95% respectively
	chancetohit = base.common.Limit(chancetohit, 5, 95);

	if (Attacker.AttackKind==4) then

		--The Distance Reduction Modifier (DRM). This value scales the chance of hitting in archery
		--After the pointblank range. In other words, 3 squares away (just out of PB range) has
		--1x the normal accuracy. One square further away is DRM x normal accuracy.
		--One square even further away is DRM^2 x normal accuracy.
		local DistanceReductionModifier = 0.93

		local distance = Attacker.Char:distanceMetric(Defender.Char);
		local archerymod = math.min(1,(1-DistanceReductionModifier)+math.pow(DistanceReductionModifier,distance-2))
		--The value of 2 is used because that's the number of squares away it starts.
		chancetohit = chancetohit*archerymod;

	end;

	--Surefire Special
	if(Globals.criticalHit==7) then
		chancetohit = 100;
	end;

	-- Attack misses
	if not base.common.Chance(chancetohit, 100) then
		return false;
	end;

	--Unblockable Special
	if(Globals.criticalHit==2) then
		return true;
	end;

	--Cannot parry without a weapon
	if not Defender.IsWeapon and not Defender.SecIsWeapon then
        canParry = false;
    end;

	--Cannot parry people who aren't in the front quadrant
    if (DirectionDifference<=2) or (DirectionDifference>=6) then
       canParry = false;
	end;

	-- If they can't parry, it succeeds
	if not canParry then
		return true;
	end;

	--Choose which weapon has the largest defense
	if Defender.IsWeapon then
		parryItem = Defender.WeaponItem;
		parryWeapon = Defender.Weapon;
	end

	if Defender.SecIsWeapon then
		if not parryWeapon then
			parryItem = Defender.SecWeaponItem
			parryWeapon = Defender.SecWeapon;
		elseif (parryWeapon.Defence < Defender.SecWeapon.Defence) then
			parryItem = Defender.SecWeaponItem
			parryWeapon = Defender.SecWeapon;
		end
	end

	--The Shield Scaling Factor (SSF). Changes how much the top shield is better than the worse one.
	local ShieldScalingFactor =5; --For what do we have database numbers!? ~Estralis

	local Rarity = NotNil(tonumber(parryItem:getData("RareWeapon")));

	if (parryWeapon.WeaponType~=14) then
		Rarity = 0;
	end

	local parryweapondefense = parryWeapon.Defence+Rarity*20;
	local defenderdefense = (100/ShieldScalingFactor) + parryweapondefense*(1-1/ShieldScalingFactor);

	--THIS IS SHIT!!! EITHER YOU TAKE THE DB VALUES OR NOT! ~Estralis
	if(parryWeapon.WeaponType~=14) then
		defenderdefense = defenderdefense/2;
	end

	local parryChance;
	local qualitymod = 0.91+0.02*math.floor(parryItem.quality/100);
	parryChance = (Defender.parry / 5); --0-20% by the skill
	parryChance = parryChance * (0.5 + (Defender.agility) / 20); --Skill value gets multiplied by 0.5-1.5 (+/-50% of a normal player) scaled by agility
	parryChance = parryChance + (defenderdefense) / 5; --0-20% bonus by the weapon/shield
	parryChance = parryChance * qualitymod;

	if(parryWeapon.Level>Defender.parry and not Attacker.Char:getType() == 1 ) then
		parryChance = parryChance/5;
	end

	 -- Min and max parry are 5% and 95% respectively
	parryChance = base.common.Limit(parryChance, 5, 95);

	-- Attack was parried sucessfully
	if base.common.Chance(parryChance, 100) then
		PlayParrySound(Attacker, Defender)
		Defender.Char:performAnimation(9);
		WeaponDegrade(Attacker, Defender, parryItem);
		Counter(Attacker,Defender);
		return false;
	end

	-- Attack suceeded
	return true;
end


--- Check if the setting of items the character is using is good for a attack
-- @param CharStruct The table of the attacker that holds all values load
-- @return true in case the attack is fine
function CheckAttackOK(CharStruct)
--CharStruct.Char:talk(Character.say,"check 1 ok");
    if (CharStruct["AttackKind"] == nil) then -- finding the attack type failed ******************************
        return false;
    end;
--    CharStruct.Char:talk(Character.say,"check 2 ok");
    if (CharStruct.Char.effects:find(24)) then -- Attacker is tied up
        return false;
    end;

	--Uncomment this line if rares should be unuseable
	--[[if (NotNil(tonumber(CharStruct.WeaponItem:getData("RareWeapon")))<0) then -- Item is a broken artifact
        return false;
    end;]]

--    CharStruct.Char:talk(Character.say,"check 3 ok");
    if (CharStruct.SecIsWeapon) then
        -- there is something in the second hand
        if (CharStruct.AttackKind == 0) then
            -- but nothing in the first
--           CharStruct.Char:talk(Character.say,"check 4 ok");--  ******************************
            return false;
        elseif (CharStruct.SecWeapon.WeaponType == 7) then
            -- but a distance weapon in the first
--            CharStruct.Char:talk(Character.say,"check 5 ok");
            return false;
        elseif (CharStruct.Weapon.WeaponType == 13) then
            -- but a wand in the first
--            CharStruct.Char:talk(Character.say,"check 6 ok");
            return false;
        end;
    end;
--   CharStruct.Char:talk(Character.say,"check 7 ok");
    return true;
end;

--- Check the range from the attacker to the defender and ensure that it is
-- within weapon distance.
-- @param AttackerStruct The table that stores the data of the attacker
-- @param Defender The character who is attacked
-- @return true in case the range is fine, else false
function CheckRange(AttackerStruct, Defender)
	local distance = AttackerStruct.Char:distanceMetric(Defender);

	if(AttackerStruct.AttackKind == 4 and  AttackerStruct.Char:getType() == 1) then -- if a monster with a bow and large distance

		if(distance<=2) then
			setArcherMonsterOnRoute(AttackerStruct,Defender,distance)
		else
			AttackerStruct.Char:setOnRoute(false);
		end;
	end

    if distance > 1 then
        blockList = world:LoS( AttackerStruct.Char.pos, Defender.pos )
		local next = next	-- make next-iterator local
        if (next(blockList)~=nil) then	-- see if there is a "next" (first) object in blockList!
				return false;				-- something blocks
		end
    end

    if (distance <= 2 and AttackerStruct.AttackKind == 4) then
		--AttackerStruct.Char:inform("I acknowledge that bows shouldn't fire."); --Debugging
        return false;
    end
    if AttackerStruct.IsWeapon then
        return (distance <= AttackerStruct.Weapon.Range);
    end;
    return (distance <= 1 );
end;

-- Makes the monster move away from its target
-- @param AttackerStruct The table that stores the data of the attacker
-- @param Defender The character who is attacked

function setArcherMonsterOnRoute(AttackerStruct,Defender,distance)

	AttackerStruct.Char.waypoints:clear();

	local workingpoint = 5-distance;
	local workingpointb = workingpoint-1;

	local workingpointc = workingpoint+2;
	local workingpointd = workingpointc-1;

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
		newposition = position(workingpoint*AttackerStruct.Char.pos.x-workingpointb*Defender.pos.x,workingpoint*AttackerStruct.Char.pos.y-workingpointb*Defender.pos.y,AttackerStruct.Char.pos.z);
	end

	local isdiagonal = ((math.abs(Defender.pos.x-AttackerStruct.Char.pos.x)>0) and (math.abs(Defender.pos.y-AttackerStruct.Char.pos.y)>0))

	if not(isdiagonal) then

		if NoNils(world:getField(newposition)) and NoNils(world:getField(newposition):isPassable()) then
			if not (world:getField(newposition):isPassable()) then
				newposition = position(Defender.pos.x+1,Defender.pos.y-1,AttackerStruct.Char.pos.z)
			end;
		else
			newposition = position(Defender.pos.x+1,Defender.pos.y-1,AttackerStruct.Char.pos.z)
		end;

		if NoNils(world:getField(newposition)) and NoNils(world:getField(newposition):isPassable()) then
			if not (world:getField(newposition):isPassable()) then
				newposition = position(Defender.pos.x-1,Defender.pos.y+1,AttackerStruct.Char.pos.z)
			end;
		else
			newposition = position(Defender.pos.x-1,Defender.pos.y+1,AttackerStruct.Char.pos.z)
		end;

		if NoNils(world:getField(newposition)) and NoNils(world:getField(newposition):isPassable()) then
			if not (world:getField(newposition):isPassable()) then
				newposition = position(Defender.pos.x+1,Defender.pos.y+1,AttackerStruct.Char.pos.z)
			end;
		else
			newposition = position(Defender.pos.x+1,Defender.pos.y+1,AttackerStruct.Char.pos.z)
		end;

		if NoNils(world:getField(newposition)) and NoNils(world:getField(newposition):isPassable()) then
			if not (world:getField(newposition):isPassable()) then
				newposition = position(Defender.pos.x-1,Defender.pos.y-1,AttackerStruct.Char.pos.z)
			end;
		else
			newposition = position(Defender.pos.x-1,Defender.pos.y-1,AttackerStruct.Char.pos.z)
		end;

	else

		if NoNils(world:getField(newposition)) and NoNils(world:getField(newposition):isPassable()) then
			if not (world:getField(newposition):isPassable()) then
				newposition = position(Defender.pos.x,Defender.pos.y+1,AttackerStruct.Char.pos.z)
			end;
		else
			newposition = position(Defender.pos.x,Defender.pos.y+1,AttackerStruct.Char.pos.z)
		end;

		if NoNils(world:getField(newposition)) and NoNils(world:getField(newposition):isPassable()) then
			if not (world:getField(newposition):isPassable()) then
				newposition = position(Defender.pos.x-1,Defender.pos.y,AttackerStruct.Char.pos.z)
			end;
		else
			newposition = position(Defender.pos.x-1,Defender.pos.y,AttackerStruct.Char.pos.z)
		end;

		if NoNils(world:getField(newposition)) and NoNils(world:getField(newposition):isPassable()) then
			if not (world:getField(newposition):isPassable()) then
				newposition = position(Defender.pos.x,Defender.pos.y-1,AttackerStruct.Char.pos.z)
			end;
		else
			newposition = position(Defender.pos.x,Defender.pos.y-1,AttackerStruct.Char.pos.z)
		end;

		if NoNils(world:getField(newposition)) and NoNils(world:getField(newposition):isPassable()) then
			if not (world:getField(newposition):isPassable()) then
				newposition = position(Defender.pos.x+1,Defender.pos.y,AttackerStruct.Char.pos.z)
			end;
		else
			newposition = position(Defender.pos.x+1,Defender.pos.y,AttackerStruct.Char.pos.z)
		end;

	end;

	if NoNils(world:getField(newposition)) and NoNils(world:getField(newposition):isPassable()) then
		if not (world:getField(newposition):isPassable()) then
			newposition = position(workingpointd*AttackerStruct.Char.pos.x-workingpointc*Defender.pos.x+2,workingpointd*AttackerStruct.Char.pos.y-workingpointc*Defender.pos.y+2,AttackerStruct.Char.pos.z)
		end;
	else
		newposition = position(workingpointd*AttackerStruct.Char.pos.x-workingpointc*Defender.pos.x+2,workingpointd*AttackerStruct.Char.pos.y-workingpointc*Defender.pos.y+2,AttackerStruct.Char.pos.z)
	end;

	if NoNils(world:getField(newposition)) and NoNils(world:getField(newposition):isPassable()) then
		if not (world:getField(newposition):isPassable()) then
			newposition = position(workingpointd*AttackerStruct.Char.pos.x-workingpointc*Defender.pos.x-2,workingpointd*AttackerStruct.Char.pos.y-workingpointc*Defender.pos.y-2,AttackerStruct.Char.pos.z)
		end;
	else
		newposition = position(workingpointd*AttackerStruct.Char.pos.x-workingpointc*Defender.pos.x-2,workingpointd*AttackerStruct.Char.pos.y-workingpointc*Defender.pos.y-2,AttackerStruct.Char.pos.z)
	end;

	if NoNils(world:getField(newposition)) and NoNils(world:getField(newposition):isPassable()) then
		if not (world:getField(newposition):isPassable()) then
			newposition = position(workingpoint*AttackerStruct.Char.pos.x-workingpointb*Defender.pos.x-2,workingpoint*AttackerStruct.Char.pos.y-workingpointb*Defender.pos.y-2,AttackerStruct.Char.pos.z)
		end;
	else
		newposition = position(workingpoint*AttackerStruct.Char.pos.x-workingpointb*Defender.pos.x-2,workingpoint*AttackerStruct.Char.pos.y-workingpointb*Defender.pos.y-2,AttackerStruct.Char.pos.z)
	end;

	if NoNils(world:getField(newposition)) and NoNils(world:getField(newposition):isPassable()) then
		if not (world:getField(newposition):isPassable()) then
			newposition = position(workingpoint*AttackerStruct.Char.pos.x-workingpointb*Defender.pos.x+2,workingpoint*AttackerStruct.Char.pos.y-workingpointb*Defender.pos.y+2,AttackerStruct.Char.pos.z)
		end;
	else
		newposition = position(workingpoint*AttackerStruct.Char.pos.x-workingpointb*Defender.pos.x+2,workingpoint*AttackerStruct.Char.pos.y-workingpointb*Defender.pos.y+2,AttackerStruct.Char.pos.z)
	end;

	--Look forward
	if NoNils(world:getField(newposition)) and NoNils(world:getField(newposition):isPassable()) then
		if not (world:getField(newposition):isPassable()) then
			newposition = position(workingpointd*AttackerStruct.Char.pos.x-workingpointc*Defender.pos.x,workingpointd*AttackerStruct.Char.pos.y-workingpointc*Defender.pos.y,AttackerStruct.Char.pos.z)
		end;
	else
		newposition = position(workingpointd*AttackerStruct.Char.pos.x-workingpointc*Defender.pos.x,workingpointd*AttackerStruct.Char.pos.y-workingpointc*Defender.pos.y,AttackerStruct.Char.pos.z)
	end;


	if NoNils(world:getField(newposition)) and NoNils(world:getField(newposition):isPassable()) then
		if (world:getField(newposition):isPassable()) then
			--Defender:inform(newposition.x .. " " .. newposition.y .." ".. newposition.z);
			AttackerStruct.Char.waypoints:addWaypoint(newposition);
			AttackerStruct.Char:setOnRoute(true);
		else
			AttackerStruct.Char:setOnRoute(false);
		end;
	else
		AttackerStruct.Char:setOnRoute(false);
	end;

end

--- Calculate the effect of the constitution on the damage. Depending on the
-- constitution this can raise or lower the damage.
-- @param Defender The table that stores the data of the defender
-- @param Globals The table that stores the global values
function ConstitutionEffect(Defender, Globals)
    if (Globals.Damage == 0) then
        return;
    end;

    Globals.Damage = Globals.Damage * 14 / Defender.constitution;
end;

--- Checks if a coup de gráce is performed on the attacked character and kills
-- the char if needed
-- @param Attacker The table of the attacking character
-- @param Defender The table of the attacked character
-- @return true if a coup de gráce was done
function CoupDeGrace(Attacker, Defender)
    if (Attacker.Char:getType() ~= 0) then -- Only for player characters
        return false;
    end;

    if (Attacker.AttackKind == 4) then -- Not done for distance weapons
        return false;
    end;

    if content.fighting.IsTrainingWeapon(Attacker.WeaponItem.id) then
        -- not done for training weapons
        return false;
    end;

    if (base.character.AtBrinkOfDeath(Defender.Char)) then
        -- character nearly down
        local gText = base.common.GetGenderText(Attacker.Char, "seinem",
            "ihrem");
        local eText = base.common.GetGenderText(Attacker.Char, "his",
            "her");
        Attacker.Char:talk(Character.say,
                string.format("#me gibt %s Gegner den Gnadenstoß.", gText),
                string.format("#me gives %s enemy the coup de gráce.", eText))

        -- Kill character and notify other scripts about the death
        if not base.character.Kill(Defender.Char) then
            -- something interrupted the kill
            return true;
        end;

        -- Drop much blood around the player
        DropMuchBlood(Defender.Char.pos);

    end;

    return false;
end;

--- Drops the used ammo in case there is any ammo. This functions placed the
-- used ammunition under the character in case the target character is a player,
-- else the ammunition is dropped into the inventory of the target.
-- @param Attacker The table of the attacking char
-- @param Defender The character of the character that is supposed to receive
--                  the attack
-- @param GroundOnly true in case the item is supposed to be dropped only on the
--                  ground
function DropAmmo(Attacker, Defender, GroundOnly)
    if ( Attacker.AttackKind ~= 4 ) then -- no distanz Attack --> no ammo
        return;
    end;

    if base.common.Chance(0.33) then
        local AmmoItem;
        if (Attacker.Weapon.AmmunitionType
            == Attacker.SecWeapon.WeaponType) then
            AmmoItem = Attacker.SecWeaponItem;
        elseif (Attacker.Weapon.AmmunitionType == 255) then
            AmmoItem = Attacker.WeaponItem;
        else
            return false;
        end;

        if not GroundOnly and (Defender:getType() == 1) then -- monsters get the ammo into the inventory
            Defender:createItem(AmmoItem.id, 1, AmmoItem.quality, nil);
        else
            if world:isItemOnField(Defender.pos) then
                local oldItem = world:getItemOnField(Defender.pos);
                if (oldItem.wear < 255 and oldItem.id == AmmoItem.id
                    and oldItem.quality == AmmoItem.quality
                    and oldItem:getData("ammoData") == AmmoItem:getData("ammoData")) then

                    oldItem.number = oldItem.number + 1;
                    oldItem.wear = 5;
                    world:changeItem( oldItem );
                    return;
                elseif (oldItem.wear == 255) then
                    return;
                end;
            end;

            tmpItem = world:createItemFromId(AmmoItem.id, 1, Defender.pos, true, AmmoItem.quality, nil);
			if AmmoItem:getData("ammoData") ~= "" then
				tmpItem:setData("ammoData",AmmoItem:getData("ammoData"));
			end;
        end;
    end;
end;

--- Drop a blood spot on the ground at a specified location.
-- @param Posi The location where the blood spot is placed
function DropBlood(Posi)

    if world:isItemOnField(Posi) then
        return; --no blood on tiles with items on them!
    end;

    Blood = world:createItemFromId(3101, 1, Posi, true, 333, nil);
    Blood.wear = 2;
    world:changeItem(Blood);

end;

--- Drop alot of blood. This function drops blood on every tile around the
-- position set as center.
-- @param Posi The center of the bloody area
function DropMuchBlood(Posi)
    local workingPos = base.common.CopyPosition(Posi);

    workingPos.x = workingPos.x - 1;
    workingPos.y = workingPos.y - 1;
    for i = 1, 3 do
        for j = 1, 3 do
            DropBlood(workingPos);
            workingPos.x = workingPos.x + 1;
        end;
        workingPos.x = workingPos.x - 3;
        workingPos.y = workingPos.y + 1;
    end;
end;

--@CharStruct The table of the defender
--@return Returns the armour type
-- 0 - Unarmoured
-- 1 - Puncture
-- 2 - Stroke
-- 3 - Thrust
function GetArmourType(Defender, Globals)

    Globals["HittedArea"] = content.fighting.GetHitArea(Defender.Race);
    Globals["HittedItem"] = Defender.Char:getItemAt(Globals.HittedArea);

    local armour, armourfound;
    if (Globals.HittedItem ~= nil and Globals.HittedItem.id > 0) then
        armourfound, armour = world:getArmorStruct(Globals.HittedItem.id);
    else
        -- No armour worn
		Defender["DefenseSkill"] = 0;
		return false;
    end;


	local armourtype = armour.Type;

	--Previous method for discerning armour type

	--[[local highestvalue=armour.PunctureArmor;
	local armourtype=1;

	if(armour.StrokeArmor>highestvalue) then
		highestvalue = armour.StrokeArmor;
		armourtype = 2;
	elseif(armour.StrokeArmor==highestvalue) then
		armourtype = 12;
	end;

	if(armour.ThrustArmor>highestvalue) then
		highestvalue = armour.ThrustArmor;
		armourtype = 3;
	elseif(armour.ThrustArmor==highestvalue) then
		if(armourtype==1) then
			armourtype = 13;
		elseif(armourtype==2) then
			armourtype = 23;
		elseif(armourtype==12) then
			armourtype = 123;
		end;
	end;

	--A check in case the defense stats of the armour are equal, will return a random value of the tied ranks.
	if(armourtype>3) then
		if(armourtype==12) then
			if(base.common.Chance(1,2)) then
				armourtype = 1;
			else
				armourtype = 2;
			end;
		elseif(armourtype==23) then
			if(base.common.Chance(1,2)) then
				armourtype = 2;
			else
				armourtype = 3;
			end;
		elseif(armourtype==13) then
			if(base.common.Chance(1,2)) then
				armourtype = 1;
			else
				armourtype = 3;
			end;
		elseif(armourtype==123) then
			local tempchance = base.common.Chance(1,3)
			if(tempchance==1) then
				armourtype = 1;
			elseif(tempchance==2) then
				armourtype = 2;
			else
				armourtype = 3;
			end;
		end;
	end;]]


	if armourtype == 4 then
		-- Heavy is good against punc
		Defender["DefenseSkillName"] = Character.heavyArmour;
	elseif armourtype == 3 then
		-- Medium is good against slash/stroke
		Defender["DefenseSkillName"] = Character.mediumArmour;
	elseif armourtype == 2 then
		-- Light is good against conc/thrust
		Defender["DefenseSkillName"] = Character.lightArmour;
	else
		Defender["DefenseSkillName"] = false;
		Defender["DefenseSkill"] = 0;
		return false;
	end;

	Defender["DefenseSkill"] = NotNil(Defender.Char:getSkill(Defender.DefenseSkillName));

	return true;

end;


---Calculate if there was a critical
-- @param Attacker The table of the attacking Character
-- @param Defender The table of the attacked Character
-- @param Globals The table of the global values
function CheckCriticals(Attacker, Defender, Globals)

	local chance=1;
	local weapontype = 8;
	if Attacker.IsWeapon then
		weapontype = Attacker.Weapon.WeaponType;
		--Special: Backstab
		if weapontype == 3 then
			if (Defender.Char:getFaceTo() == Attacker.Char:getFaceTo()) then
				chance=10;
			else
				chance=0;
			end;
		end;
	end;

	if not base.common.Chance(chance, 100) then
		Globals["criticalHit"] = 0;
		return false;
	else
		Globals["criticalHit"] = weapontype;
		return true;
	end;

end;

---Handles special effects
-- @param Attacker The table of the attacking Character
-- @param Defender The table of the attacked Character
-- @param Globals The table of the global values
function Specials(Attacker, Defender, Globals)

	local hisher =  base.common.GetGenderText(Attacker.Char,"his","her");
	local seinihr = base.common.GetGenderText(Attacker.Char,"sein","ihr");
	if(Attacker.Char:getType() == Character.monster) then
		if(Globals.criticalHit==1) then -- 1HS
            base.common.TalkNLS(Attacker.Char, Character.say,
                    "#me schlägt schnell zu und teilt rasch zwei Hiebe aus.",
                    "#me quickly strikes, dealing two blows in rapid succession.");
        elseif(Globals.criticalHit==2) then -- 1HC
            base.common.TalkNLS(Attacker.Char, Character.say,
                    "#me greift mit solcher Kraft an, dass der Angriff nicht pariert werden kann.",
                    "#me attacks with such force that it cannot be blocked.");
        elseif(Globals.criticalHit==3) then -- 1HP
            base.common.TalkNLS(Attacker.Char, Character.say,
                    "#me führt eine schmerzhafte Attacke gegen den Rücken aus.",
                    "#me delivers a painful back attack.");
        elseif(Globals.criticalHit==4) then -- 2HS
            base.common.TalkNLS(Attacker.Char, Character.say,
                    "#me führ einen gewaltigen Hieb aus und schlägt "..seinihr.."en Gegner zurück.",
                    "#me delivers a broad attack, knocking back "..hisher.." opponent.");
        elseif(Globals.criticalHit==5) then -- 2HC
            base.common.TalkNLS(Attacker.Char, Character.say,
                    "#me greift mit großer Kraft an und setzt "..seinihr.."en Gegner außer Gefecht.",
                    "#me attacks with great force, stunning "..hisher.." foe.");
        elseif(Globals.criticalHit==6) then -- 2HP
            base.common.TalkNLS(Attacker.Char, Character.say,
                    "#me stößt vor und landert einen durchbohrenden Treffer.",
                    "#me thrusts out, delivering a powerful, piercing attack.");
        elseif(Globals.criticalHit==7) then -- Dist
            base.common.TalkNLS(Attacker.Char, Character.say,
                    "#me zielt etwas länger und er trifft dadurch "..seinihr.." Ziel an einer ungeschützten Stelle.",
                    "#me takes careful aim, hitting "..hisher.." target with precision and power.");
        elseif(Globals.criticalHit==8) then -- Wrest
            base.common.TalkNLS(Attacker.Char, Character.say,
                    "#me führt einen extrem schnellen Hieb gegen "..seinihr.."en Gegner.",
                    "#me strikes out extremely quickly, dealing a powerful blow to "..hisher.." opponent.");
		end;
	else
		if(Globals.criticalHit==1) then -- 1HS
			base.common.TalkNLS(Attacker.Char, Character.say,
				"#me schwingt "..seinihr.."e Klinge und teilt rasch zwei Hiebe aus.",
				"#me sweeps "..hisher.." blade, dealing two blows in rapid succession.");
		elseif(Globals.criticalHit==2) then -- 1HC
			base.common.TalkNLS(Attacker.Char, Character.say,
				"#me schwingt "..seinihr.."e Waffe mit solcher Kraft, dass diese nicht pariert werden kann.",
				"#me swings "..hisher.." weapon with such force that it cannot be blocked.");
		elseif(Globals.criticalHit==3) then -- 1HP
			base.common.TalkNLS(Attacker.Char, Character.say,
				"#me rammt "..seinihr.."e Klinge schnell in den Rücken "..seinihr.."es Gegners.",
				"#me slams "..hisher.." blade quickly into "..hisher.." opponent's back.");
		elseif(Globals.criticalHit==4) then -- 2HS
			base.common.TalkNLS(Attacker.Char, Character.say,
				"#me führ einen gewaltigen Hieb aus und schlägt "..seinihr.."en Gegner zurück.",
				"#me delivers a mighty swing, knocking back "..hisher.." opponent.");
		elseif(Globals.criticalHit==5) then -- 2HC
			base.common.TalkNLS(Attacker.Char, Character.say,
				"#me lässt "..seinihr.."e Waffe mit gewaltiger Kraft nach unten fahren so dass "..seinihr.." Gegner benommen ist.",
				"#me brings down "..hisher.." weapon with great force, stunning "..hisher.." foe.");
		elseif(Globals.criticalHit==6) then -- 2HP
			base.common.TalkNLS(Attacker.Char, Character.say,
				"#me stößt "..seinihr.."e Waffe mit einem kraftvollen Stich nach vorne.",
				"#me thrusts "..hisher.." weapon with a powerful, piercing attack.");
		elseif(Globals.criticalHit==7) then -- Dist
			base.common.TalkNLS(Attacker.Char, Character.say,
				"#me zielt etwas länger und trifft dadurch "..seinihr.." Ziel an einer ungeschützten Stelle.",
				"#me takes careful aim, hitting "..hisher.." target with precision and power.");
		elseif(Globals.criticalHit==8) then -- Wrest
			base.common.TalkNLS(Attacker.Char, Character.say,
				"#me führt einen extrem schnellen Hieb gegen "..seinihr.."en Gegner.",
				"#me strikes out extremely quickly, dealing a powerful blow to "..hisher.." opponent.");
		end;
	end;

	if(Globals.criticalHit==4) then
		--Knockback
		local CharOffsetX = Attacker.Char.pos.x - Defender.Char.pos.x;
        local CharOffsetY = Attacker.Char.pos.y - Defender.Char.pos.y;

        if (CharOffsetY > 0) then
            CharOffsetY = (Attacker.Weapon.Range - math.abs(CharOffsetX) + 1)
                * (-1);
        elseif (CharOffsetY < 0) then
            CharOffsetY = (Attacker.Weapon.Range - math.abs( CharOffsetX ) + 1);
        end;

        if (CharOffsetX > 0) then
            CharOffsetX = (Attacker.Weapon.Range - math.abs(CharOffsetY) + 1)
                * (-1);
        elseif (CharOffsetX < 0) then
            CharOffsetX = (Attacker.Weapon.Range - math.abs(CharOffsetY) + 1);
        end;

        local newPos = position(Defender.Char.pos.x + CharOffsetX,
            Defender.Char.pos.y + CharOffsetY, Defender.Char.pos.z);

        local targetPos=Defender.Char.pos;

        isNotBlocked = function(pos)
            if world:getField(pos):isPassable() then
                targetPos = pos;
                return true;
            else
                return false;
            end
        end;

        base.common.CreateLine(Defender.Char.pos, newPos, isNotBlocked);

        if targetPos ~= startPos then
            Defender.Char:warp(targetPos)
        end;
	elseif(Globals.criticalHit==5) then
		--Stun
		local stuntime = 2;
		base.common.ParalyseCharacter(Defender.Char, stuntime, false, true);
	end;

end;


---Handles special effects
-- @param Defender The table of the attacked Character
function Counter(Attacker, Defender)

	if Defender.Char.attackmode then
		if base.common.Chance(1,50) then
			base.common.TalkNLS(Defender.Char, Character.say,
            "#me blockt geschickt den Hieb und macht sich schnell für einen Konter bereit.",
            "#me deftly blocks the hit and quickly readies stance for a counter attack.");
			base.character.ChangeFightingpoints(Defender.Char,-Defender.Char.fightpoints);
			Defender.Char.fightpoints = 21
		end;
	end;

end;


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
--CharStruct.Char:talk(Character.say,"GETATTTYPE 1"); --- schild richtig
        CharStruct["AttackKind"] = 0;
        CharStruct["UsedHands"] = 1;
        CharStruct["Skillname"] = Character.wrestling;
        return;
    end;

	-- weapon present:
    local weaponType = CharStruct.Weapon.WeaponType;
--CharStruct.Char:talk(Character.say,"WPTYPE="..weaponType);	-- 14 wenn schild falsch
    if (weaponType == 1) or (weaponType == 4) then
--CharStruct.Char:talk(Character.say,"GETATTTYPE 2");
        CharStruct["AttackKind"] = 1;
        CharStruct["Skillname"] = Character.slashingWeapons;
        if (weaponType == 1) then
            CharStruct["UsedHands"] = 1;
        else
            CharStruct["UsedHands"] = 2;
        end;
    elseif (weaponType == 2) or (weaponType == 5) then
--CharStruct.Char:talk(Character.say,"GETATTTYPE 3");
        CharStruct["AttackKind"] = 2;
        CharStruct["Skillname"] = Character.concussionWeapons;
        if (weaponType == 2) then
            CharStruct["UsedHands"] = 1;
        else
            CharStruct["UsedHands"] = 2;
        end;
    elseif (weaponType == 3) or (weaponType == 6) then
--CharStruct.Char:talk(Character.say,"GETATTTYPE 4");
        CharStruct["AttackKind"] = 3;
        CharStruct["Skillname"] = Character.punctureWeapons;
        if (weaponType == 3) then
            CharStruct["UsedHands"] = 1;
        else
            CharStruct["UsedHands"] = 2;
        end;
    elseif (weaponType == 7) or (weaponType == 255) then
--CharStruct.Char:talk(Character.say,"GETATTTYPE 5");
        CharStruct["AttackKind"] = 4;
        CharStruct["Skillname"] = Character.distanceWeapons;
        if (weaponType == 255) then
            CharStruct["UsedHands"] = 1;
        else
            CharStruct["UsedHands"] = 2;
        end;
    end;
end;

--- Checks if the attacker is using a distance weapon and check and remove the
-- ammunition in case its needed
-- @param Attacker The table that stores the data of the attacking char
-- @return true in case the attack is good to go
function HandleAmmunition(Attacker)
    if (Attacker.Char:getType() == Character.monster) then -- Monsters do not use ammo
        return true;
    end;

    if (Attacker.AttackKind ~= 4) then -- Ammo only needed for distance attacks
        return true;
    end;

    if (Attacker.Weapon.AmmunitionType == Attacker.SecWeapon.WeaponType) then
        Attacker.Char:increaseAtPos(Attacker.SecWeaponItem.itempos, -1);
    elseif (Attacker.Weapon.AmmunitionType == 255) then		-- throwing axes, spears and throwing stars, thus they ARE the ammunition!
        Attacker.Char:increaseAtPos(Attacker.WeaponItem.itempos, -1);
    else
        return false;
    end;
    return true;
end;

-- Calculate the required movepoints
-- @param Attacker The table that stores the values of the attacker
function CalculateMovepoints(Attacker)

	local weaponFightpoints;
    if Attacker.IsWeapon then
        weaponFightpoints = Attacker.Weapon.ActionPoints;
	else
        weaponFightpoints = content.fighting.GetWrestlingMovepoints(Attacker.Race);
    end;

	if Attacker.Weapon.AmmunitionType==10 then
		if(Attacker.SecWeaponItem.id==322) then
			weaponFightpoints = weaponFightpoints-1;
		end
	end

    -- The Global Speed Mod (GSM). Increase this to make fights faster.
	local GlobalSpeedMod = 100;

    return math.max( 7 , weaponFightpoints*(100 - (Attacker.agility-6)*2.5) / GlobalSpeedMod );


end

--- Reduce the attacker movepoints by the fitting value.
-- @param Attacker The table that stores the values of the attacker
function HandleMovepoints(Attacker, Globals)

    local reduceFightpoints = CalculateMovepoints(Attacker)

	local fightPointsBeforeCritical = reduceFightpoints
	if(Globals.criticalHit==1) then -- special attack slashing: very fast strikes, reduced reduction
		reduceFightpoints = 2;
	elseif(Globals.criticalHit>0) then
		reduceFightpoints = reduceFightpoints*1.5;
	end;

	-- For player archers, we remove the normal reduction and leave only the reduction because of criticals.
	-- They have a count BEFORE the shoot.
	local archerAdjustment = 0
	if Attacker.AttackKind==4 and Attacker.Char:getType() == Character.player then
		archerAdjustment = fightPointsBeforeCritical
	end

	base.character.ChangeFightingpoints(Attacker.Char,-math.floor(reduceFightpoints-archerAdjustment));
    
	Globals["AP"] = reduceFightpoints;

    return reduceFightpoints;
end;

--- Learning function.  Called after every attack.
-- @param Attacker The table containing the attacker data
-- @param Defender The table containing the defender data
function LearnSuccess(Attacker, Defender, AP, Globals)

	-- Attacker learns weapon skill
	if Attacker.Skillname then
	
		Attacker.Char:learn(Attacker.Skillname, AP/3, math.max(Defender.DefenseSkill + 20, Defender.parry + 20));
			
	end

	local archerAdditional = 0
	if Attacker.AttackKind==4 then
		archerAdditional = GetNecessaryAimingTime(Attacker)*10
	end

	-- Defender learns armour skill
	if Defender.DefenseSkillName then
		local armourfound, armour = world:getArmorStruct(Globals.HittedItem.id);

		if armourfound then
		
			Defender.Char:learn(Defender.DefenseSkillName,(AP+archerAdditional)/3,Attacker.skill + 20);
			
		end
		
	end

	-- Defender learns parry skill
	local parryWeapon;
	
	--Choose which weapon has the largest defense
	if Defender.IsWeapon then
		parryWeapon = Defender.Weapon;
	end
	
	if Defender.SecIsWeapon then
	
		if not parryWeapon then
			parryWeapon = Defender.SecWeapon;
		elseif (parryWeapon.Defence < Defender.SecWeapon.Defence) then
			parryWeapon = Defender.SecWeapon;
		end
		
	end
	
	if parryWeapon then
	
		Defender.Char:learn(Character.parry, AP/3, Attacker.skill + 20)
		
	end
end;

function NotNil(val)
    if val==nil then
        return 0;
    end
    return val;
end

function NoNils(val)
    if val==nil then
        return false;
    end
    return true;
end


--- Load the attributes and skills of a character. Depending on the offensive
-- parameter the skills for attacking or for defending are load.
-- @param CharStruct The character table of the char the values are load for
-- @param Offensive true in case attributes and skills for the attacker shall be
--                      load
function LoadAttribsSkills(CharStruct, Offensive)
    if Offensive then
        CharStruct["strength"] = NotNil(CharStruct.Char:increaseAttrib("strength", 0));
        CharStruct["agility"] = NotNil(CharStruct.Char:increaseAttrib("agility", 0));
        CharStruct["perception"]
            = NotNil(CharStruct.Char:increaseAttrib("perception", 0));
        CharStruct["skill"] = NotNil(CharStruct.Char:getSkill(CharStruct.Skillname));
        CharStruct["natpoison"] = 0;
        --CharStruct["tactics"] = NotNil(CharStruct.Char:getSkill(Character.tactics));
        CharStruct["dexterity"]
            = NotNil(CharStruct.Char:increaseAttrib("dexterity", 0));
    else
        CharStruct["dexterity"]
            = NotNil(CharStruct.Char:increaseAttrib("dexterity", 0));
        CharStruct["constitution"]
            = NotNil(CharStruct.Char:increaseAttrib("constitution", 0));
        CharStruct["parry"] = NotNil(CharStruct.Char:getSkill(Character.parry));
		CharStruct["agility"] = NotNil(CharStruct.Char:increaseAttrib("agility", 0));
    end;
    CharStruct["Race"] = CharStruct.Char:getRace();
end;

--- Load all weapon data for a character. The data is stored in the table that
-- is used as the parameter.
-- @param CharStruct The table of the character the weapons are supposed to be
--                      load for
function LoadWeapons(CharStruct)
    local rItem = CharStruct.Char:getItemAt(Character.right_tool);
    local lItem = CharStruct.Char:getItemAt(Character.left_tool);
    local rAttFound, rAttWeapon = world:getWeaponStruct(rItem.id);
    local lAttFound, lAttWeapon = world:getWeaponStruct(lItem.id);

    --CharStruct.Char:inform("R: "..rItem.id .. " L: "..lItem.id);

    -- the right item is ALWAYS used as the weapon now!
    isRWp=1;
	isLWp=1;

	if rAttFound then
		rWType=rAttWeapon.WeaponType;
		if rWType==10 or rWType==11 or rWType==12 or rWType==14 then -- Ammo or shield in right hand: switch r and l hand!
			isRWp=0;
		end

	else
		isRWp=0;
	end

	if lAttFound then
		lWType=lAttWeapon.WeaponType;
		if lWType==10 or lWType==11 or lWType==12 or lWType==14 then -- Ammo or shield in right hand: switch r and l hand!
			isLWp=0;
		end

	else
		isLWp=0;
	end

	if isRWp==0 and isLWp==1 then 	-- switch weapons

		rItem,lItem = lItem,rItem;
		rAttFound,lAttFound = lAttFound,rAttFound;
		rAttWeapon,lAttWeapon = lAttWeapon,rAttWeapon;
	end

    CharStruct["WeaponItem"] = rItem;
    CharStruct["IsWeapon"] = rAttFound;
    CharStruct["Weapon"] = rAttWeapon;

    CharStruct["SecWeaponItem"] = lItem;
    CharStruct["SecIsWeapon"] = lAttFound;
    CharStruct["SecWeapon"] = lAttWeapon;

end;

--- Check if the character is on newbie island and reject the attack in that.
-- This is required to allow newbie island to work correctly.
-- @param Attacker The character who is attacking
-- @param Defender The character who is attacked
-- @return true in case the attack can go on, else it has to be stopped
function NewbieIsland(Attacker, Defender)
    -- Newbie Island is on z-level 100 and aboth. if that does not fit we are
    -- not in the newbie island and the Attack is okay.
    if (Attacker.pos.z < 100 or Attacker.pos.z > 105) then
        return true;
    end;

    --if (Attacker.pos.z) ~= -40 then     -- same for the prisons
    --    return true;
    --end;

    -- in case the character it not a other player character, the Attack is
    -- okay anyway.
    if (Defender:getType() ~= 0) then
        return true;
    end;

    -- the Attacker did not start the newbie island quest. Attack is fine.
    if (Attacker:getQuestProgress(2) == 0) then
        return true;
    end;

    -- The Attacker is a GM. Attacking is fine
    if Attacker:isAdmin() then
        return true;
    end;

    -- So now the character is on newbie island and not allowed to Attack.
    -- Some lines to ensure the player is not spammed to death if messages
    if (_AntiSpamVar==nil) then
        _AntiSpamVar = {};
    end;
    if (_AntiSpamVar[Attacker.id] == nil) then
        _AntiSpamVar[Attacker.id] = 0;
    elseif (_AntiSpamVar[Attacker.id] < 280) then
        _AntiSpamVar[Attacker.id] =_AntiSpamVar[Attacker.id] + 1;
    else
        base.common.InformNLS(Attacker,
        "[Tutorial] Du darfst während des Tutorials noch keine anderen Spieler angreifen. Klicke nochmals rechts auf deinen Gegner um den Kampf abzubrechen.",
        "[Tutorial] You are not allowed to attack other players during the tutorial. Right click again on your enemy to cancel the attack.");
        _AntiSpamVar[Attacker.id] = 0;
    end;
    return false;
end;

--- Play the sound of a successful parry.
-- @param Attacker The table of the character who is attacking
-- @param Defender The table of the character who is attacked
function PlayParrySound(Attacker, Defender)
    if not Attacker.IsWeapon then
        world:makeSound(32,Attacker.Char.pos);
        return true;
    end;

    if not Defender.IsWeapon and not Defender.SecIsWeapon then
        world:makeSound(32,Attacker.Char.pos);
        return true;
    end;

    local DefenderWeapon = 0;
    if Defender.IsWeapon then
        DefenderWeapon = Defender.Weapon.WeaponType;
    end;

    if Defender.SecIsWeapon then
        DefenderWeapon = math.max(DefenderWeapon,
            Defender.SecWeapon.WeaponType);
    end;
    if (Sounds[DefenderWeapon] ~= nil) then
        if (Sounds[DefenderWeapon][Attacker.Weapon.WeaponType] ~= nil) then
            world:makeSound(Sounds[DefenderWeapon][Attacker.Weapon.WeaponType],
                Attacker.Char.pos);
            return true;
        end;
    end;
    world:makeSound(32, Attacker.Char.pos);
    return true;
end

--- Show the attacking animation for the attacking character.
-- @param Attacker The table that stores the attacker data
function ShowAttackGFX(Attacker)
    if (Attacker.AttackKind == 0) then -- wrestling
        Attacker.Char:performAnimation(5);
    elseif (Attacker.AttackKind == 4) then -- distance
        Attacker.Char:performAnimation(7);
    elseif (Attacker.UsedHands == 2) then -- 2 hands attack
        Attacker.Char:performAnimation(6);
    else -- 1 hand attack
        Attacker.Char:performAnimation(5);
    end;
end;

--- Show the effects of a successful attack. This Drops some blood in case
-- the attack is very strong or a critical hit and it raises the sound effects
-- that fit this attack.
-- @param Attacker The table of the attacking Character
-- @param Defender The table of the attacked Character
-- @param Globals The table of the global values
function ShowEffects(Attacker, Defender, Globals)
    if (Globals.Damage > 0) then
        world:gfx(13, Defender.Char.pos); -- Blood effect, remove maybe?
        Defender.Char:performAnimation(10); -- Hit animation
        if Globals.criticalHit>0 then
            --InformAboutCritical(Attacker.Char, Defender.Char, Globals.HittedArea);
            --[[ Wounds Script - Disabled for now
            if base.character.IsPlayer(Defender.Char) and (math.random(8) == 1) then
                Defender.Char.effects:addEffect(LongTimeEffect(21, 10));
            end;
            --]]

            DropMuchBlood(Defender.Char.pos);
        elseif (Globals.Damage > 2000) then
            DropBlood(Defender.Char.pos);
        end;
    end;

    if (Attacker.AttackKind == 0) then --wresting
        world:makeSound(3,Defender.Char.pos);
    elseif (Attacker.AttackKind==1) then --slashing
        world:makeSound(33,Defender.Char.pos);
    elseif (Attacker.AttackKind==2) then --concussion
        world:makeSound(32,Defender.Char.pos);
    elseif (Attacker.AttackKind==3) then --puncture
        world:makeSound(33,Defender.Char.pos);
    elseif (Attacker.AttackKind==4) then --distance
        world:makeSound(31,Defender.Char.pos);
    end;
end;


-- Parry sounds
-- Line and column the item Types the attacker and the defender are
-- using
-- id of the sounds that shall be played at a parry
Sounds={};
Sounds[1]={32,32,32,32,32,32};
Sounds[2]={32,42,43,42,42,44};
Sounds[3]={32,43,41,42,40,41};
Sounds[4]={32,42,42,42,42,44};
Sounds[5]={32,42,40,42,42,44};
Sounds[6]={32,44,41,44,44,41};
Sounds[14]={32,43,41,42,40,41};



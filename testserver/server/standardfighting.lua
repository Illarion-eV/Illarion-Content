-- Fighting System
-- All fights are handled with this script
-- Written by martin, Nitram and Xandrina
-- Rebalanced by Estralis and Flux


--[[ Weapontypes:
1:  1 hd slashing
2:  1 hd concussion
3:  1 hd puncture
4:  2 hd slashing
5:  2 hd concussion
6:  2 hd puncture
7:  (cross-) Bow, sling, spear, throwing star
10: Arrows
11: crossbow bolts
12: stone
13: staves
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

if isTestserver() then
	require("development.testscript");
end;

module("server.standardfighting", package.seeall)

--- Main Attack function. This function is called by the server to start an
-- attack. It is called once for each hand of the attacker. Only the hand holding a
-- weapon will attack. In case there are weapons in both hands, only the
-- right hand will be used to perform the attack.
-- @param Attacker The character who attacks
-- @param Defender The character who is attacked
-- @return true in case a attack was performed, else false
function onAttack(Attacker, Defender)

	if isTestserver() then
		development.testscript.onAttack(Attacker,Defender);
		return;
	end;
	
    -- Prepare the lists that store the required values for the calculation
    local Attacker = { ["Char"]=Attacker };
    local Defender = { ["Char"]=Defender };
    local Globals = {};

    -- Newbie Island Check
    if not NewbieIsland(Attacker.Char, Defender.Char) then return false; end;
    -- Load the weapons of the attacker
    LoadWeapons(Attacker);
    -- Check the range between the both fighting characters

    if not CheckRange(Attacker, Defender.Char) then return false; end;

    -- Find out the attack type and the required combat skill
    GetAttackType(Attacker);
    -- Check if the attack is good to go (possible weapon configuration)
    if not CheckAttackOK(Attacker) then 
        return false; 
    end;
    -- Check if ammunition is needed and use it
    if not HandleAmmunition(Attacker) then return false; end;
    
    -- Load Skills and Attributes of the attacking character
    LoadAttribsSkills(Attacker, true);
    -- Load weapon data, skills and attributes of the attacked character
    LoadWeapons(Defender);
    LoadAttribsSkills(Defender, false);
    -- Calculate and reduce the required movepoints
    APreduction=HandleMovepoints(Attacker);

	-- Turning the attacker to his victim
    base.common.TurnTo(Attacker.Char,Defender.Char.pos);
    -- Show the attacking animation
    ShowAttackGFX(Attacker);
    -- Check if a coup de gráce is performed
    if CoupDeGrace(Attacker, Defender) then return true; end;
    -- learn anyway
	LearnDodge(Attacker, Defender, APreduction);
    -- Calculate the chance to hit
    if not ChanceToHit(Attacker, Defender) then
        -- Target character was not hit
        
        
        -- Place some ammo on the ground in case ammo was used
        DropAmmo(Attacker, Defender.Char, true);
        
        if isTestserver() then
            -- Still learn even if you miss
            LearnSuccess(Attacker, Defender, APreduction)
            LearnParry(Attacker, Defender, APreduction);
        end;
        
        return true;
    end;
    
    
    
    LearnParry(Attacker, Defender, APreduction);
    -- Calculate the chance to parry
    if ChanceToParry(Attacker, Defender) then
        -- Hit was parried
        
        
        -- Play the parry sound
        PlayParrySound(Attacker, Defender);
        
        -- Play Parry Animation
        Defender.Char:performAnimation(9);
        
        -- Place some ammo on the ground in case ammo was used
        DropAmmo(Attacker, Defender.Char, true);
        return;
    end;
    
    -- Calculate the damage caused by the attack
    CalculateDamage(Attacker, Globals);

    -- Reduce the damage due the absorbtion of the armor
    ArmorAbsorbtion(Attacker, Defender, Globals);

    -- The effect of the constitution. After this the final damage is avaiable.
    ConstitutionEffect(Defender, Globals);

    -- Cause the finally calculated damage to the player
    CauseDamage(Attacker, Defender, Globals);
    
    -- Show the final effects of the attack.
    ShowEffects(Attacker, Defender, Globals);
    
    -- Teach the attacker the skill he earned for his success
    LearnSuccess(Attacker, Defender, APreduction)
end;

--------------------------------------------------------------------------------
-- The following functions are support functions that are used to make the    --
-- fighting system work in the way expected. They contain all the needed      --
-- calculations to perform a proper fight.                                    --
--------------------------------------------------------------------------------

--- Calculate the damage that is absorbed by the armor and reduce the stored
-- armor value by this amount.
-- @param Attacker The table that stores the data of the attacker
-- @param Defender The table that stores the data of the defender
-- @param Globals The table that stores the global values
function ArmorAbsorbtion(Attacker, Defender, Globals)
    Globals["HittedArea"] = content.fighting.GetHitArea(Defender.Race);
    Globals["HittedItem"] = Defender.Char:getItemAt(Globals.HittedArea);
    
    local armourfound, armour;
    if (Globals.HittedItem ~= nil and Globals.HittedItem.id > 0) then
        armourfound, armour = world:getArmorStruct(Globals.HittedItem.id);
    else
        armourfound = false;
    end;

    local armourValue = 0;
    
    if armourfound then
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
    end;

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

    Globals.Damage = Globals.Damage - (Globals.Damage * armourValue / 250);
    Globals.Damage = math.max(0, Globals.Damage);
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
    --local TacticsBonus;
    
    if Attacker.IsWeapon then
        BaseDamage = Attacker.Weapon.Attack * 10;
    else
        BaseDamage = content.fighting.GetWrestlingAttack( Attacker.Race ) * 10;
    end;
 
    StrengthBonus = (Attacker.strength - 6) * 3;
    PerceptionBonus = (Attacker.perception - 6) * 1;
    DexterityBonus = (Attacker.dexterity - 6) * 1;
    SkillBonus = (Attacker.skill - 20) * 1.5;
    --TacticsBonus = (Attacker.tactics - 20) * 0.5;
    GemBonus = base.gems.getGemBonus(Attacker.WeaponItem);

    -- Base damage was far too high for the new combat speed, you could get murked too fast.
    Globals["Damage"] = 0.6 * BaseDamage * (100 + StrengthBonus + PerceptionBonus + DexterityBonus + SkillBonus + GemBonus)/100;
    
end;

--- Deform some final checks on the damage that would be caused and send it to
-- the character. Also here the Coup de Gráce is done.
-- @param Attacker The table of the attacking Character
-- @param Defender The table of the attacked Character
-- @param Globals The table of the global values

function CauseDamage(Attacker, Defender, Globals)

	Globals.Damage=Globals.Damage*(math.random(8,12)/10); --Damage is randomised: 80-120%
	
	Globals.Damage=math.min(Globals.Damage,4999); --Damage is capped at 4999 Hitpoints to prevent "one hit kills"
	
	Globals.Damage=math.floor(Globals.Damage); --Hitpoints are an integer
	
    --Attacker.Char:inform("Dealt damage: ".. Globals.Damage .. " HP."); --Debugging
	--Defender.Char:inform("Received damage: ".. Globals.Damage .. " HP."); --Debugging
	
    if base.character.IsPlayer(Defender.Char) 
        and base.character.WouldDie(Defender.Char, Globals.Damage + 1)
        and (Attacker.AttackKind ~= 4)
        and not base.character.AtBrinkOfDeath(Defender.Char) then
        -- Character would die. Nearly killing him and moving him back in case it's possible
        base.character.ToBrinkOfDeath(Defender.Char);

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
            lte.chr_reg.stallRegeneration(Defender.Char, 20);
			
		end

        return true;
    else
        if not base.character.ChangeHP(Defender.Char, -Globals.Damage) then

		--removed: Call of base.playerdeath
		
        end;
        
        if (Attacker.AttackKind == 4) then -- Distanzangriff.
            Defender.Char.movepoints = Defender.Char.movepoints - 5;
            DropAmmo(Attacker, Defender.Char, false);
        end;
    end;
end;

--- Check if the attacking character is hitting the target or not.
-- @param Attacker The table that stores the values of the attacker
-- @param Defender The table that stores the values of the defender
-- @return true in case the target receives the hit
function ChanceToHit(Attacker, Defender)
    
	--OLD
	--local chance = (20 + Attacker.skill)/((20 + Defender.dodge)* 2);
	
	--PROPOSAL BY ESTRALIS & FLUX
	local chance = (40 + Attacker.skill)/((45 + Defender.dodge)* 1.4);
		
	--Reason: Higher base chance, higher overall chance, reduced impact of low skill levels
	-- (one could even hit an unarmed pig as noob!)
	-- There is a graph in the documentation that shows exactly why this graph was chosen.
	-- I plotted >20 graphs to arrive at this one.
	-- We tried adding constants, changing both the top and bottom value etc.
	-- Eventually we arrived at this being the best to fit all purposes - Flux
	
	--PROPOSAL END
	
    if (Attacker.isWeapon) then
        chance = chance * (40 + Attacker.Weapon.Accuracy) / 100;
    else
        chance = chance * (40 + content.fighting.GetWrestlingAccuracy( Attacker.Race )) / 100;
    end;
    -- penalty for distance weapons:
    if (Attacker.AttackKind == 4) then -- Distance weapon
        local distance = Attacker.Char:distanceMetric(Defender.Char);
        local range = Attacker.Weapon.Range;
        chanceMod = 100 + 50*(distance - 1)/(1 - range);    -- reduce chance in %: at distance 1 chance is unmodified, 
                                                            -- at distance=range it is 50%
        chance = chance * chanceMod / 100;
        --Attacker.Char:inform("Chance to hit: "..chance);
    end;
	
	
	--Stiffness wasn't taken into account? Rewrote base.common.Getstiffness
	--And added a stiffness mod - Flux

	local Stiffmod = base.common.GetStiffness( Defender.Char );
	
	--Now for the modifier
	
	chance = chance+Stiffmod/500;
	--[[
	Just a side note here.
	
	500 may seem like a "magic number" because it is so round. It is not a magic number.
	It has been calculated.
	
	This value was arrived at by examination of the graph and thinking about what warrants
	midplate and fullplate etc.
	
	The graph I refer to is in the documentation, and is a 3 dimensional contour graph.
	
	So, say you're fighting a monster who is equally skilled or up to 10 skillpoints more
	skilled than you, you'd expect around the 58% hit range before stiffness.
	
	Someone with a leather set of armour will have around 50 stiffness.
	Someone with a mid set of armour will have around.. 150 stiffness.
	Someone with a heavy set of armour will have like 220 stiffness or more.
	
	The heavy person has to live with the consequences of their actions. They will pretty much
	never be able to dodge. They'll dodge with the 5% chance cap though.
	
	So if we say that the mid setter should feel a slight benefit from going mid.
	Therefore the stiffness should only push up the hit chance to 90% for them at things
	around their level.
	
	So 150 should translate into a 30% increase.
	That's why I propose division by 500 and addition to the hit chance.
	
	This would mean that it adds >50% to the chance of hitting against a defender in heavy
	armour, 10% onto someone in leather armour, 0% onto someone who is wearing plain clothes.
	And to a mid armour user it would add around 30% as we modelled it.
	
	So let's look at what these numbers mean in real world terms:
	
  FOR HEAVY USERS:
  People with fighting skill 60 levels lower than you will hit you 75-85% of the time.
	
	People with skill at your level will push you above the upper bound, where you will
	dodge the standard 5% of the time. No more.
	
	FOR MIDHEAVY USERS:
	People with fighting skill 60 levels lower than you will only hit you 55-70% of the time.
	
	People with skill around yours will hit you around 90% of the time.
	
	People with skill above you by 10 levels will always push you above the upper bound.
	
	FOR LIGHT USERS:
	Someone 60 skill levels below you would hit 50% of the time.
	
	Someone at your skill level would hit you ~70% of the time.
	
	Someone 10 skill levels higher than you would hit you 80% of the time.
	
	Someone 20 skill levels higher than you would push you above the upper bound.
	
	This seems very reasonable and balances the different types of class, while pushing dodge
	chance into the same region as parry chance, which is good because they'll skill up at the
	same time.
	
	tl;dr - stiffness is properly balanced to fit with parry chance
	
	- Flux
	]]
	
  
    
	
	--PROPOSAL BY ESTRALIS & FLUX
	chance = math.max(chance,0.1); --raising to 10% no matter what (should not occur with normal values)
	
	
	local maximumhitchance = 0.95;

    chance = math.min(chance,maximumhitchance); --capping at 95%, no one hits all the time
    --PROPOSAL END


   --local dodgechance = 100*(1-chance);
  --Defender.Char:inform("Dodge percent chance: " .. dodgechance);

    return base.common.Chance(chance);
end;

--- Calculate the chance to parry. This considers both weapons the defender
-- carries and seaches for the fest item to parry with.
-- @param Defender The table that stores all data of the defender
-- @return true in case the hit was parried
function ChanceToParry(Attacker, Defender)

--[[This function now ASSUMES that each weapon's "Defence" is the important factor.
    it does not descriminate between what is a shield and what is a sword.
    That is to be done in the weapon's WeaponDefence for simplicity's sake.
    So a shield has a high defence and a sword has a lower one.
    So a human can actually understand it. - Flux]]

    if not Defender.LeftIsWeapon and not Defender.RightIsWeapon then
        return false;
    end;
    
     -- Check which weapon has the best defense. The one with the highest is used for parrying
    
    local parryWeapon;
    
    --OLD - This differentiated between shields and swords. Needlessly complicated.
    --[[
    local parryType = -1;
    if Defender.LeftIsWeapon then
        local weaponType = Defender.LeftWeapon.WeaponType;
        if (weaponType == 14) then -- shield
            parryType = 3;
            parryWeapon = Defender.LeftWeapon;
        elseif (weaponType == 1) or (weaponType == 2) or (weaponType == 3) then
            -- one hand weapon
            parryType = 2;
            parryWeapon = Defender.LeftWeapon;
        elseif (weaponType == 4) or (weaponType == 5) or (weaponType == 6) then
            -- two hand weapon
            parryType = 1;
            parryWeapon = Defender.LeftWeapon;
        end;
    end;
    
    if Defender.RightIsWeapon then
        local weaponType = Defender.RightWeapon.WeaponType;
        if (weaponType == 14) then -- shield
            if (parryType == 3) then
                if (parryWeapon.Defence < Defender.RightWeapon.Defence) then
                    parryWeapon = Defender.RightWeapon;
                end;
            else
                parryType = 3;
                parryWeapon = Defender.RightWeapon;
            end;
        elseif ((weaponType == 1) or (weaponType == 2) or (weaponType == 3))
            and (parryType <= 2) then -- one hand weapon
            if (parryType == 2) then
                if (parryWeapon.Defence < Defender.RightWeapon.Defence) then
                    parryWeapon = Defender.RightWeapon;
                end;
            else
                parryType = 2;
                parryWeapon = Defender.RightWeapon;
            end;
        elseif ((weaponType == 4) or (weaponType == 5) or (weaponType == 6))
            and (parryType <= 1) then
            if (parryType == 1) then -- two hand weapon
                if (parryWeapon.Defence < Defender.RightWeapon.Defence) then
                    parryWeapon = Defender.RightWeapon;
                end;
            else
                parryType = 1;
                parryWeapon = Defender.RightWeapon;
            end;
        end;
    end;
    
    ]]
    
    -- New, by Flux. Checks which weapon is better for parrying.
    
    if Defender.LeftIsWeapon then
        parryWeapon = Defender.LeftWeapon;
    end;
    
    if Defender.RightIsWeapon then
        if not parryWeapon then
            parryWeapon = Defender.RightWeapon;
        elseif (parryWeapon.Defence < Defender.RightWeapon.Defence) then
            parryWeapon = Defender.RightWeapon;
        end;
    end;
    
    
    
	--OLD
	--[[
    	
    local chance;
    if (parryType == 3) then -- shield parry
        chance = (Defender.parry / 4);
        chance = chance * (1 - math.max((16 - Defender.dexterity) / 20, 0));
        chance = chance + (parryWeapon.Defence - 70) / 8;
    elseif (parryType == 2) then -- one handed parry
        chance = (Defender.parry / 8);
        chance = chance * (1 - math.max((16 - Defender.dexterity) / 20, 0));
        chance = chance + (30 - parryWeapon.Defence) / 2;
    elseif (parryType == 1) then -- two handed parry
        chance = (Defender.parry / 8);
        chance = chance * (1 - math.max((16 - Defender.dexterity) / 20, 0));
        chance = chance + (66 - parryWeapon.Defence) / 1.5;
    else
        return false;
    end;]]
	
	--PROPOSAL BY ESTRALIS: Sorry, this calculation makes no sense to me. Either, I am stupid or in the latter two cases, a higher parryWeapon.Defence DECREASES the chance to parry. This makes absolutely no sense. Also, why are all cases treated differently? The values were designed to make weapons comparable! Shields rule at parry, one handed weapons suck and two handed weapons suck a little. Now you basically ignore the database value's ratios and calculate around... Please note that normal players get negative chances to parry and will NEVER EVER parry. How shall they increase that skill!?
	--Also: Agility is the lead attribute of parry
	
	local chance;
    if parryWeapon then
        chance = (Defender.parry / 5); --0-20% by the skill
        chance = chance * (0.5 + (Defender.agility) / 20); --Skill value gets multiplied by 0.5-1.5 (+/-50% of a normal player) scaled by agility
        chance = chance + (parryWeapon.Defence) / 10; --0-20% bonus by the weapon/shield
    else
        return false;
    end;
	
	--PROPOSAL BY FLUX: You cannot parry someone who stands outside of your front quadrant
	-- As in.. people behind you, people sideways of you
	-- That would be silly.
	-- Since they must be facing  if they're attacking you, if they face in the same
	-- direction then they must be hitting your back.
	
	local DirectionDifference = math.abs(Defender.Char:getFaceTo()-Attacker.Char:getFaceTo());
	
	-- If you wish to change it to only people from behind get a free hit, change line to:
	-- if (DirectionDifference<=1) or (DirectionDifference==7) then
	-- Right now it also covers people attacking from sideways on
	
	
	if (DirectionDifference<=2) or (DirectionDifference>=6) then
      return false;
	end;
	
	-- PROPOSAL END
	
	
	--PROPOSAL BY ESTRALIS & FLUX
	chance = math.max(chance,5); --raising to 5% no matter what (should not occur with normal values)
    chance = math.min(chance,95); --capping at 95%, no one hits all the time
    --PROPOSAL END
    
	
	--Defender.Char:inform("Parry percent chance: " .. chance);
	
    return base.common.Chance(chance, 100);
end;

--- Check if the setting of items the character is using is good for a attack
-- @param CharStruct The table of the attacker that holds all values load
-- @return true in case the attack is fine
function CheckAttackOK(CharStruct)
--CharStruct.Char:talk(Character.say,"check 1 ok");
    if (CharStruct["AttackKind"] == nil) then -- finding the attack type failed ******************************
        return false;
    end;
--    CharStruct.Char:talk(Character.say,"check 2 ok");
    if (CharStruct.WeaponItem.id == 228) then -- Item is occupied
        return false;
    end;

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

    if distance > 1 then
        blockList = world:LoS( AttackerStruct.Char.pos, Defender.pos )
		local next = next	-- make next-iterator local		
        if (next(blockList)~=nil) then	-- see if there is a "next" (first) object in blockList!
			return false;				-- something blocks
		end
    end

    if (distance == 1 and AttackerStruct.AttackKind == 4) then
        return false;
    end
    if AttackerStruct.IsWeapon then
        return (distance <= AttackerStruct.Weapon.Range);
    end;
    return (distance <= 1 );
end;

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
        Attacker.Char:talkLanguage(Character.say, Player.german,
            string.format("#me gibt %s Gegner den Gnadenstoß.", gText));
        Attacker.Char:talkLanguage(Character.say, Player.english,
            string.format("#me gives %s enemy the coup de gráce.", eText));
        
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
    if (Attacker.Char:getType() == 1) then -- Monsters do not use ammo
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

--- Calculate the required movepoints for this attack and reduce the attacker
-- movepoints by the fitting value.
-- @param Attacker The table that stores the values of the attacker
function HandleMovepoints(Attacker)

    local weaponFightpoints;
    if Attacker.IsWeapon then
        weaponFightpoints = Attacker.Weapon.ActionPoints;
    else
        weaponFightpoints = content.fighting.GetWrestlingMovepoints(Attacker.Race);
    end;
    
    --Proposal by Flux: Make stiffness affect attack speed.
    
    --[[  
    Proposal is that 1+stiffness/1000 will be multiplied by the final AP gain.
    This means that those in extremely heavy armour will be 25% slower.
    Those in medium armour will be 15% slower.
    Those in leather armour will be 5% slower.
    And those in cloth will not be affected.
    ]]
    
    local Stiffmod = 1+base.common.GetStiffness( Attacker.Char )/800;
    
    
        -- Subproposal by Flux: Make having a shield affect attack speed too.
        -- As a price for the huge advantage of being able to parry 25% of the time
        -- 7% increase in time between hits
        
            local Shieldmod = 1;
            
            if Attacker.LeftIsWeapon then
              if(Attacker.LeftWeapon.WeaponType == 14) then
                  shieldmalus= 1.07;
              end;
            end;
            
            if Attacker.RightIsWeapon then
              if(Attacker.RightWeapon.WeaponType == 14) then
                  shieldmalus= 1.07;
              end;
            end;
            
          local reduceFightpoints = Stiffmod*Shieldmod*math.max( 7 , weaponFightpoints*(100 - (Attacker.agility-6)*2.5) / 100 );
          
          
        -- End of subproposal
        
    -- End of proposal
    
    -- Old
    --local reduceFightpoints = math.max( 7 , weaponFightpoints*(100 - (Attacker.agility-6)*2.5) / 100 );
	
	base.character.ChangeFightingpoints(Attacker.Char,-math.floor(reduceFightpoints));
    Attacker.Char.movepoints=Attacker.Char.movepoints-math.floor(reduceFightpoints); 
	
    return reduceFightpoints;
end;

--- Learning function called when ever the attacked character dodges the attack.
-- The defender learns dodge skill in this case
-- @param Attacker The table containing the attacker data
-- @param Defender The table containing the defender data
function LearnDodge(Attacker, Defender, AP)
--debug("          NOW LEARNING dodge: "..Character.dodge..", "..(AP/3)..", "..(Attacker.skill + 20));
    -- Divide AP by three, since you can learn three skills with one AP reduction while fighting
    Defender.Char:learn(Character.dodge, AP/3, Attacker.skill + 20)
--debug("          DONE LEARNING");   
	--OLD. Tactics is redundant. No more attackers learning when attacking
	--[[	
	Attacker.Char:learn(Attacker.Skillname, AP/3, Defender.dodge + 20)
    if base.common.Chance(0.25) then
        Attacker.Char:learn(Character.tactics, AP/4, 100);
    end;]]
	
end;

--- Learning function called when ever the attacked character fails to avoid the
-- attack. The defender learns nothing in this case, the attacker learns his
-- attack skill as well as the tactics skill.
-- @param Attacker The table containing the attacker data
-- @param Defender The table containing the defender data
function LearnSuccess(Attacker, Defender, AP)
--debug("          NOW LEARNING att: "..Attacker.Skillname..", "..(AP/3)..", "..(math.max(Defender.dodge, Defender.parry) + 20));
    Attacker.Char:learn(Attacker.Skillname, AP/3, math.max(Defender.dodge, Defender.parry) + 20)
--debug("          DONE LEARNING");    
	--OLD
	--[[
    if base.common.Chance(0.33) then
        Attacker.Char:learn(Character.tactics, AP/4, 100)
    end;]]
	
	-- Tactics is redundant
	
	--Attacker.Char:learn(Character.tactics, AP/3, math.max(Defender.dodge, Defender.parry) + 20);
	
	--PROPOSAL END
end;

--- Learning function called when ever the attacked character parries the
-- attack. The defender learns parry skill in this case, the attacker learns his
-- attack skill as well as the tactics skill.
-- @param Attacker The table containing the attacker data
-- @param Defender The table containing the defender data
function LearnParry(Attacker, Defender, AP)
--debug("          NOW LEARNING parry: "..Character.parry..", "..(AP/3)..", "..(Attacker.skill + 20));
    --Defender.Char:inform("Learn limit is 10 above" .. Attacker.skill);
    Defender.Char:learn(Character.parry, AP/3, Attacker.skill + 20)
--debug("          DONE LEARNING");   	
	--OLD - No more tactics, no more learning attacking
	--[[
	
	Attacker.Char:learn(Attacker.Skillname, AP/3, Defender.parry + 20)
    if base.common.Chance(0.25) then
        Attacker.Char:learn(Character.tactics, AP/4, 100);
    end;]]
	
end;

function NotNil(val)
    if val==nil then
        return 0;
    end
    return val;
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
        CharStruct["dodge"] = NotNil(CharStruct.Char:getSkill(Character.dodge));
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
		if rWType==10 or rWType==11 or rWType==14 then -- Ammo or shield in right hand: switch r and l hand!
			isRWp=0;
		end
--		debug("*** FOUND WP IN R!");
	else
		isRWp=0;
	end
	
	if lAttFound then
		lWType=lAttWeapon.WeaponType;
		if lWType==10 or lWType==11 or lWType==14 then -- Ammo or shield in right hand: switch r and l hand!
			isLWp=0;
		end
--		debug("*** FOUND WP IN L!");
	else
		isLWp=0;
	end
	
	if isRWp==0 and isLWp==1 then 	-- switch weapons
--	debug("*** SWITCHING WEAPONS NOW!"); 
		local dItem=rItem;
		local dAttFound=rAttFound;
		local dAttWeapon=rAttWeapon;
		rItem=lItem;
		rAttFound=lAttFound;
		rAttWeapon=lAttWeapon;
		lItem=dItem;
		lAttFound=dAttFound;
		lAttWeapon=dAttWeapon;
	end
	
	-- 1: slash, 2: 
	
    CharStruct["WeaponItem"] = rItem;
    CharStruct["IsWeapon"] = rAttFound;
    CharStruct["Weapon"] = rAttWeapon;

    CharStruct["SecWeaponItem"] = lItem;
    CharStruct["SecIsWeapon"] = lAttFound;
    CharStruct["SecWeapon"] = lAttWeapon;
--    CharStruct.Char:talk(Character.say,"**** WPTYPE R: "..CharStruct.Weapon.WeaponType);
--	CharStruct.Char:talk(Character.say,"**** WPTYPE L: "..CharStruct.SecWeapon.WeaponType);
	-- still  needed? :
    CharStruct["LeftWeaponItem"] = lItem;
    CharStruct["LeftIsWeapon"] = lAttFound;
    CharStruct["LeftWeapon"] = lAttWeapon;
    
    CharStruct["RightWeaponItem"] = rItem;
    CharStruct["RightIsWeapon"] = rAttFound;
    CharStruct["RightWeapon"] = rAttWeapon;

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
        "[Tutorial] Du darfst während des Tutorials noch keine anderen Spieler angreifen. Klicke nochmals auf deinen Gegner in der Angriffsliste um den Kampf abzubrechen.",
        "[Tutorial] You are not allowed to attack other players during the tutorial. Click again on your enemy in the attack list to cancel the attack.");
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
    
    if not Defender.RightIsWeapon and not Defender.LeftIsWeapon then
        world:makeSound(32,Attacker.Char.pos);
        return true;
    end;
    
    local DefenderWeapon = 0;
    if Defender.RightIsWeapon then
        DefenderWeapon = Defender.RightWeapon.WeaponType;
    end;
    
    if Defender.LeftIsWeapon then
        DefenderWeapon = math.max(DefenderWeapon,
            Defender.LeftWeapon.WeaponType);
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

--- Show the effects of a successfull attack. This Drops some blood in case
-- the attack is very strong or a critical hit and it raises the sound effects
-- that fit this attack.
-- @param Attacker The table of the attacking Character
-- @param Defender The table of the attacked Character
-- @param Globals The table of the global values
function ShowEffects(Attacker, Defender, Globals)
    if (Globals.Damage > 0) then
        world:gfx(13, Defender.Char.pos); -- Blood effect, remove maybe?
        Defender.Char:performAnimation(10); -- Hit animation
        if Globals.criticalHit then
            InformAboutCritical(Attacker.Char, Defender.Char, Globals.HittedArea);
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



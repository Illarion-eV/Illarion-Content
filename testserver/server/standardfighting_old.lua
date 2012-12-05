-- Fighting System
-- All fights are handled with this script
-- Written by Nitram and Xandrina

-- Hang in base.common - Some functions of the collection are needed
require("base.common")

-- Include base.character to use the methods changing some attributes of the
-- character properly there
require("base.character")

-- Lists with static values of the fighting system
require("content.fighting")

module("server.standardfighting", package.seeall)

--[[
    Main Attacking function

    @param  CharacterStruct Attacking character
    @param  CharacterStruct Attacked character
    @param  int hand the attack is done with
    @return boolean true if the Attacker tried hitting the defender
]]
function onAttack( Attacker, Defender, AttackPos )
---[[DEBUG
    local retVal = onAttack_debug( Attacker, Defender, AttackPos );
    SayDebug( Attacker );
    return retVal;
end;

function onAttack_debug( Attacker, Defender, AttackPos )
--]]
---[[DEBUG
    AddDebugText( "=== START OF SCRIPT ===", 3, Attacker );
--]]

    -- Check if the Attacker wants and is allowed to start the Debugging of the Fighting system
---[[DEBUG
    InitDebug( Attacker );
    AddDebugText( "Debug checked for Attacker", 3, Attacker );
--]]

    -- Check if the Defender wants and is allowed to start the Debugging of the Fighting system
---[[DEBUG
    InitDebug( Defender );
    AddDebugText( "Debug checked for Defender", 3, Defender );
--]]

    -- Set up the attacker table that will contain all informations related to the attacker
    local Attacker = { ["Char"]=Attacker };
---[[DEBUG (Debug part, comment is out for productive version)
    AddDebugText( "Attacker Table loaded", 3, Attacker.Char );
--]]

    -- Set up the defender table that will contain all informations related to the defender
    local Defender = { ["Char"]=Defender };
---[[DEBUG
    AddDebugText( "Defender Table loaded", 3, Attacker.Char );
--]]

    -- Set up the globals table that will contain informations importaint for attacker and defender
    local Globals  = { ["AttackPos"] = AttackPos };
---[[DEBUG
    AddDebugText( "Global Table loaded", 3, Attacker.Char );
--]]

    -- Check if the character is on the newbie island and reject attacking in that case
    if not NewbieIsland( Attacker.Char, Defender.Char ) then
        return false;
    end
---[[DEBUG
    AddDebugText( "Check for NewbieIsland done", 3, Attacker.Char );
--]]

    -- Check if there are any special conditions that could stop the Attack here from going on
    if not PreAttack_Special( Attacker.Char, Defender.Char, Globals.AttackPos ) then
        return false;
    end
---[[DEBUG
    AddDebugText( "PreAttack Specials done", 3, Attacker.Char );
    AddDebugText( Attacker.Char.name.." attacks "..Defender.Char.name, 2, Attacker.Char );
--]]

    -- Load the weapons of the attacking character
    Attacker = LoadWeapons( Attacker, Globals.AttackPos );
---[[DEBUG
    AddDebugText( "Attacker Weapondata loaded", 3, Attacker.Char );
--]]

    -- Check if the character is in weaponrange to the defender
    if not CheckRange( Attacker, Defender.Char ) then
---[[DEBUG
        AddDebugText( "Target out of range", 3, Attacker.Char );
--]]
        return false;
    end
---[[DEBUG
    AddDebugText( "Range checked", 3, Attacker.Char );
--]]

    -- Identify the Attack type
    Attacker = GetAttackType( Attacker );
    if not Attacker then
---[[DEBUG
        AddDebugText( "Unable to identify the attack kind", 3, Defender.Char );
--]]
        return false;
    end
---[[DEBUG
    AddDebugText( "Kind of attack identified: "..Attacker.AttackKind, 3, Attacker.Char );
--]]

    -- Check if the items and the Attack type fit a valid Attack, else cancel the script
    if not CheckAttackOK( Attacker ) then
---[[DEBUG
        AddDebugText( "Checked if attack is okay or not. Attack is not okay", 3, Attacker.Char );
--]]
        return false;
    end
---[[DEBUG
    AddDebugText( "Checked if attack is okay or not. Attack is fine", 3, Attacker.Char );
--]]

    -- Load attributes and skills of the Attacker
    Attacker = LoadAttribsSkills( Attacker, true );
---[[DEBUG
    AddDebugText( "Skills and attributes loaded", 3, Attacker.Char );
--]]

    -- Check if the weapon needs ammo, and take it away if needed
    if not HandleAmmunition( Attacker, Defender.Char ) then
---[[DEBUG
        AddDebugText( "Need ammo not found. Cancel attack.", 3, Attacker.Char );
--]]
        return false;
    end
---[[DEBUG
    AddDebugText( "Need ammo found.", 3, Attacker.Char );
--]]

    -- Check if the Attack misses the target
    Defender = MissingTarget( Attacker, Defender );
    if not Defender then
---[[DEBUG
        AddDebugText( "Attack canceled due missing target", 3, Attacker.Char );
--]]
        return true;
    end
---[[DEBUG
    AddDebugText( "Not missing target - Target is: "..Defender.Char.name, 3, Attacker.Char );
--]]

    -- load weapons of the attacked character
    Defender = LoadWeapons( Defender, false );
---[[DEBUG
    AddDebugText( "Loaded Weapons of Defender", 3, Attacker.Char );
--]]

    -- load skills of the attacked character
    Defender = LoadAttribsSkills( Defender, false );
---[[DEBUG
    AddDebugText( "Loaded Attributes and Skills of Defender", 3, Attacker.Char );
--]]

    -- Check if there is anything that causes any special effects before going on
    Attacker, Defender, Globals = SpecialPassiveItemEffects( Attacker, Defender, Globals );
---[[DEBUG
    AddDebugText( "Checked special effects of the weapons", 3, Attacker.Char );
--]]
    if not Attacker or not Defender then
---[[DEBUG
        AddDebugText( "Canceled attack due special effect", 3, Attacker.Char );
--]]
        return false;
    end

    -- Check if the Attack is possible or of a gm disallows it
    if not SpecialGM( Attacker, Defender ) then
---[[DEBUG
        AddDebugText( "Attack Cancled to avoid attack against GM", 3, Attacker.Char );
--]]
        return false;
    end
---[[DEBUG
    AddDebugText( "Checked special GM Functions", 3, Attacker.Char );
--]]

    -- Show the animation of the Attack
    if not ShowAttackGFX( Attacker, Defender ) then
---[[DEBUG
        AddDebugText( "Cancled Attack while viewing GFX", 3, Attacker.Char );
--]]
        return false;
    end
---[[DEBUG
    AddDebugText( "Showed GFX", 3, Attacker.Char );
--]]

    -- Check if the Attacked character has to be killed by a coup de grace
    if CoupDeGrace( Attacker, Defender ) then
---[[DEBUG
        AddDebugText( "Attack ended due Coup de gráce", 3, Attacker.Char );
--]]
        return true;
    end
---[[DEBUG
    AddDebugText( "No Coup de gráce was done", 3, Attacker.Char );
--]]

    -- generate modificators for the Attacker
    Attacker = GenAttackerMods( Attacker );
---[[DEBUG
    AddDebugText( "AttackMod="..base.common.Round( Attacker.AttackMod, 2 ), 2, Attacker.Char );
    AddDebugText( "APMod="..base.common.Round( Attacker.APMod, 2 ), 2, Attacker.Char );
--]]

    -- Generate Stiffness Mod of the armour for the Attacker
    Attacker = GenStiffnessMod( Attacker );
---[[DEBUG
    AddDebugText( "StiffnessMod="..math.floor(Attacker.StiffnessMod*100)/100, 3, Attacker.Char );
    AddDebugText( Attacker.noDodge and "dodge impossible" or "dodge possible", 3, Attacker.Char );
--]]

    -- Generate Hitpoint modificator
    Attacker = HPMod( Attacker );
---[[DEBUG
    AddDebugText( "HPMod="..base.common.Round( Attacker.HPMod, 2 ), 3, Attacker.Char );
--]]

    -- Calculate and remove movepoints from the attacker
    HandleMovepoints( Attacker );
---[[DEBUG
    AddDebugText( "Movepoints handled", 3, Attacker.Char );
--]]

    -- Generate the mod related to the position and the lookat of the characters
    Globals = GenPositionMod( Attacker.Char, Defender.Char, Globals );
---[[DEBUG
    AddDebugText( "PositionMod="..base.common.Round( Globals.PositionMod, 2 ), 3, Attacker.Char );
--]]

    -- Generate Stiffness Mod of the armour for the Defender
    Defender = GenStiffnessMod( Defender );
---[[DEBUG
    AddDebugText( "StiffnessMod="..base.common.Round( Defender.StiffnessMod, 2 ), 3, Attacker.Char );
    AddDebugText( Defender.noDodge and "dodge impossible" or "dodge possible", 3, Attacker.Char );
--]]

    -- Generate Hitpoint modificator Defender
    Defender = HPMod( Defender );
---[[DEBUG
    AddDebugText( "HPMod="..base.common.Round( Defender.HPMod, 2 ), 3, Attacker.Char );
--]]

    -- generate a distance modifier for the attacker
    Attacker = GenDistanzMod( Attacker, Defender.Char );
---[[DEBUG
    AddDebugText( "DistanceMod="..base.common.Round( Attacker.DistanceMod, 2 ), 3, Attacker.Char );
--]]

    -- check if the character dodges the Attack
    if Dodge( Attacker, Defender, Globals ) then
---[[DEBUG
        AddDebugText( "Dodged!!", 2, Attacker.Char );
--]]
        -- Attack missed, drop the ammo in case of a Range Attack
        DropAmmo( Attacker, Defender.Char.pos );
---[[DEBUG
        AddDebugText( "Ammo Drop done", 3, Attacker.Char );
--]]
        return true;
    end

	-- check if the character is tied up and should be paralysed
	CheckTying( Attacker.Char, Defender.Char );
---[[DEBUG
	AddDebugText( "Checked for tying", 3, Attacker.Char );
--]]

    -- calculate the attribute modificator
    Attacker, Defender = GenAttribMod( Attacker, Defender );
---[[DEBUG
    AddDebugText( "Attacker AttribMod="..base.common.Round( Attacker.AttribMod, 2 ), 3, Attacker.Char );
    AddDebugText( "Defender AttribMod="..base.common.Round( Defender.AttribMod, 2 ), 3, Attacker.Char );
--]]

    -- break the Attack weapon of the attacker
    BreakWeapon( Attacker, "", "Sec" );
---[[DEBUG
    AddDebugText( "Broke weapon of Attacker", 3, Attacker.Char );
--]]

    -- check if the character parries the Attack
    if Parry( Attacker, Defender, Globals ) then
        -- Parry gfx
        world:gfx(18,Defender.Char.pos);
---[[DEBUG
        AddDebugText( "Parried!!", 2, Attacker.Char );
--]]
        if ( math.random( 1, 2 ) == 1 ) then
            -- break the right weapon of the defender
            BreakWeapon( Defender, "Right", "Left" );
---[[DEBUG
            AddDebugText( "Broke right weapon of Defender", 3, Attacker.Char );
--]]
        else
            -- break the left item of the defender
            BreakWeapon( Defender, "Left", "Right" );
---[[DEBUG
            AddDebugText( "Broke left weapon of Defender", 3, Attacker.Char );
--]]
        end

        -- play the sound of a parry
        PlayParrySound( Attacker, Defender );
---[[DEBUG
        AddDebugText( "Output parry sound done", 3, Attacker.Char );
--]]
        return true;
    end

    -- generate hitted area
    Globals = GetHitArea( Defender, Globals );
---[[DEBUG
    AddDebugText( "Attacker hits at "..Globals.HittedArea, 3, Attacker.Char );
--]]

    -- Check for critical hit
    Globals = GenCriticalHit( Attacker, Globals );
---[[DEBUG
    AddDebugText( "Critical Hit? "..( Globals.criticalHit and "Yes" or "No" ), 3, Attacker.Char );
--]]

    -- calculate the damage dealed by the Attack
    Globals = Damage( Attacker, Defender, Globals );
---[[DEBUG
    AddDebugText( "Damage calculated: "..Globals.Damage, 3, Attacker.Char );
--]]

    -- deal some damage to the armour of the defender
    Breakarmour( Defender, Globals );
---[[DEBUG
    AddDebugText( "armour damaged", 3, Attacker.Char );
--]]

    -- Perform passive item effects
    Globals = SpecialActiveItemEffects( Attacker, Defender, Globals );
---[[DEBUG
    AddDebugText( "Special active effects done", 3, Attacker.Char );
    AddDebugText( "Damage: "..math.floor( Globals.Damage ), 2, Attacker.Char );
--]]

    -- teach the characters some skills
    Learning( Attacker, Defender, Globals );
---[[DEBUG
    AddDebugText( "Teaching done", 3, Attacker.Char );
--]]

    -- cause the damage to the defender
    CauseDamage( Attacker, Defender, Globals );
---[[DEBUG
    AddDebugText( "Damage done", 3, Attacker.Char );
    AddDebugText( ""..Defender.Char:increaseAttrib("hitpoints",0), 1, Defender.Char );
--]]

    -- show the final effects
    ShowEffects( Attacker, Defender, Globals );
---[[DEBUG
    AddDebugText( "Output of effects done", 3, Attacker.Char );
--]]

    return true;
end

--[[
    Check if the character wants to enable the debug mode

    @param  CharacterStruct The character who is checked
    @return bool    true all time
]]
---[[DEBUG
function AddDebugText( Text, Level, Char )
    if ( DebugLevel == 0 ) then
        return true;
    end

    if( Level == 1 ) and ( DebugLevel == 1 ) then
        Char:talk( Character.say, Text );
    elseif( Level == 2 ) and ( DebugLevel == 2 ) then
        if ( storedText ~= "" ) then
            storedText = storedText.." - ";
        end
        storedText = storedText..Text;
    elseif ( DebugLevel == 3 ) then
        Char:talk( Character.say, Text );
    end
end
--]]

--[[
    Printout the debug messages in case there are any

    @param  CharacterStruct the character who shall speak
]]
---[[DEBUG
function SayDebug( Char )
    if ( DebugLevel ~= 2 ) then
        return true;
    end
    if storedText and storedText ~= "" then
        Char:talk( Character.say, storedText );
        storedText = "";
    end
end
--]]

--[[
    Check if the character wants to enable the debug mode

    @param  CharacterStruct The character who is checked
    @return bool    true all time
]]
---[[DEBUG
function InitDebug( Char )
    if DebugLevel > 0 then
        Char:increaseSkill(Character.commonLanguage,100-Char:getSkill(Character.commonLanguage));
    end

    storedText = "";

    if not Char:isAdmin() then
        return true;
    end
    if string.find(Char.lastSpokenText,"showhp") then
        if string.find(Char.lastSpokenText,"on") then
            if DebugLevel ~= 1 then
                Char:inform("Show Hitpoints on");
                DebugLevel = 1;
            end
        elseif string.find(Char.lastSpokenText,"off") then
            if DebugLevel == 1 then
                Char:inform("Show Hitpoints off");
                DebugLevel = 0;
            end
        end
    elseif string.find(Char.lastSpokenText,"debugging") then
        if string.find(Char.lastSpokenText,"heavy") then
            if string.find(Char.lastSpokenText,"on") then
                if DebugLevel ~= 3 then
                    Char:inform("Heavy Debug Mode on");
                    DebugLevel = 3;
                end
            elseif string.find(Char.lastSpokenText,"off") then
                if DebugLevel == 3 then
                    Char:inform("Heavy Debug Mode off");
                    DebugLevel = 0;
                end
            end
        else
            if string.find(Char.lastSpokenText,"on") then
                if DebugLevel ~= 2 then
                    Char:inform("Debug Mode on");
                    DebugLevel = 2;
                end
            elseif string.find(Char.lastSpokenText,"off") then
                if DebugLevel == 2 then
                    Char:inform("Debug Mode off");
                    DebugLevel = 0;
                end
            end
        end
    end
    return true;
end
--]]

--[[
    Check if the character is on newbie island and reject the attack in that case

    @param  CharacterStruct Attacking Charakter
    @param  CharacterStruct Defending Charakter
    @return boolean true if the character can go on, false if not
]]
function NewbieIsland( Attacker, Defender )
    -- Newbie Island is on z-level 100 and aboth. if that does not fit we are not in the newbie island and the Attack is okay.
    if (Attacker.pos.z < 100) then
        return true;
    end

    -- in case the character it not a other player character, the Attack is okay anyway.
    if (Defender:getType() ~= 0) then
        return true;
    end

    -- the Attacker did not start the newbie island quest. Attack is fine.
    if (Attacker:getQuestProgress(2) == 0) then
        return true;
    end

    -- The Attacker is a GM. Attacking is fine
    if (Attacker:isAdmin()) then
        return true;
    end

    -- So now the character is on newbie island and not allowed to Attack.
    -- Some lines to ensure the player is not spammed to death if messages
    if (_AntiSpamVar==nil) then
        _AntiSpamVar=0;
    elseif (_AntiSpamVar~=280) then
        _AntiSpamVar=_AntiSpamVar+1;
    else
        base.common.InformNLS(Attacker,
        "Du darfst jetzt noch keine anderen Spieler angreifen, erst auf Gobaith. Halte STRG gedrÃƒÂ¼ckt und klicke nochmals auf deinen Gegner, um den Kampf abzubrechen.",
        "You are not allowed to attack other players yet, only as soon as you enter Gobaith. Hold CTRL and click again on your enemy in order to cancel the attack.");
        _AntiSpamVar=0;
    end
    return false;
end

--[[
    Any special events and quest stuff that could cancel the fighting system before the hit should be placed here

    @param  CharacterStruct The attacking character
    @param  CharacterStruct the attacked character
    @param  int The inventory position the attack is performed on
    @return bool    true if the attack can go on, false if not
]]
function PreAttack_Special( Attacker, Defender, AttackPos )
    if (Defender.id == 1502327199) and base.common.GetInArea( Defender, position(-35,-135,0), position( -20, -110, 1 ) ) then
        if ( AttackPos == Character.right_tool ) then
            Attacker:increaseAttrib("hitpoints", -2000);
            base.common.InformNLS( Attacker,
            "Ein Armbrustbolzen trifft dich und du stolperst zurÃƒÂ¼ck",
            "A crossbow bolt hits you and you stumble back." );
            Attacker.movepoints = Attacker.movepoints - 30;
        end
        return false;
    end
    return true;
end

--[[
    Load all weapon informations into a character struct

    @param  CharacterTable  The character table the weapondata should be added to
    [@param int the attack position]
    @return CharacterTable  The character table with the weapon data
]]
function LoadWeapons( CharStruct, AttackPos )
    local Item = CharStruct.Char:getItemAt( Character.right_tool );
    local AttFound,AttWeapon = world:getWeaponStruct( Item.id );
    if (AttackPos==Character.right_tool) then
        CharStruct["WeaponItem"] = Item;
        CharStruct["isWeapon"] = AttFound;
        CharStruct["Weapon"] = AttWeapon;
        CharStruct["WeaponQualMod"] = GetQualityEffect( Item.quality );
    elseif (AttackPos==Character.left_tool) then
        CharStruct["SecWeaponItem"] = Item;
        CharStruct["SecisWeapon"] = AttFound;
        CharStruct["SecWeapon"] = AttWeapon;
        CharStruct["SecWeaponQualMod"] = GetQualityEffect( Item.quality );
    else
        CharStruct["RightWeaponItem"] = Item;
        CharStruct["RightisWeapon"] = AttFound;
        CharStruct["RightWeapon"] = AttWeapon;
        CharStruct["RightWeaponQualMod"] = GetQualityEffect( Item.quality );
    end

    Item = CharStruct.Char:getItemAt( Character.left_tool );
    AttFound,AttWeapon = world:getWeaponStruct( Item.id );
    if (AttackPos==Character.left_tool) then
        CharStruct["WeaponItem"] = Item;
        CharStruct["isWeapon"] = AttFound;
        CharStruct["Weapon"] = AttWeapon;
        CharStruct["WeaponQualMod"] = GetQualityEffect( Item.quality );
    elseif (AttackPos==Character.right_tool) then
        CharStruct["SecWeaponItem"] = Item;
        CharStruct["SecisWeapon"] = AttFound;
        CharStruct["SecWeapon"] = AttWeapon;
        CharStruct["SecWeaponQualMod"] = GetQualityEffect( Item.quality );
    else
        CharStruct["LeftWeaponItem"] = Item;
        CharStruct["LeftisWeapon"] = AttFound;
        CharStruct["LeftWeapon"] = AttWeapon;
        CharStruct["LeftWeaponQualMod"] = GetQualityEffect( Item.quality );
    end
    return CharStruct;
end

--[[
    Create a modificator for the quality of a item between 0.5 and 1.5

    @param  int Quality of the item
    @return int modificator
]]
function GetQualityEffect( Qual )
    local Quali = math.floor( Qual / 100 );
    local Durab = math.mod( Qual, 100 );
    return base.common.Limit( base.common.Scale( 0.55, 1.36, Quali * 100 / 9 ) * base.common.Scale( 0.9, 1.1, Durab * 100 / 99 ), 0.5, 1.5 );
end


--[[
    Check if the attack target is in range of the weapon

    @param  CharacterTable  The table of the attacker
    @param  CharacterStruct The character struct of the attacked character
    @return bool    true if the attacker is in weapon range to the defender
]]
function CheckRange( AttackerStruct, Defender )
    if ( AttackerStruct.isWeapon ) then
        if ( AttackerStruct.Char:distanceMetric( Defender )<=AttackerStruct.Weapon.Range ) then
            return true;
        else
            return false;
        end
    elseif ( AttackerStruct.Char:distanceMetric( Defender ) <= 1 ) then
        return true;
    end
    return false;
end

--[[
    Identify the used attack kind and set up identifier values and the skill name

    Possible Values for AttackKind
        0 - wrestling
        1 - slashing
        2 - concussion
        3 - puncture
        4 - distance

    @param  CharacterTable  The table of the character the values should be generated for
    @return mixed   The character able with the added values or false if the attack should be canceled
]]
function GetAttackType( CharStruct )
    if not CharStruct.isWeapon then
        CharStruct["AttackKind"] = 0;
        CharStruct["UsedHands"] = 1;
        CharStruct["Skillname"] = "wrestling";
    else
        if (CharStruct.Weapon.WeaponType == 1) or (CharStruct.Weapon.WeaponType == 4) then
            CharStruct["AttackKind"] = 1;
            CharStruct["Skillname"] = "slashing weapons";
            if (CharStruct.Weapon.WeaponType == 1) then
                CharStruct["UsedHands"] = 1;
            else
                CharStruct["UsedHands"] = 2;
            end
        elseif (CharStruct.Weapon.WeaponType == 2) or (CharStruct.Weapon.WeaponType == 5) then
            CharStruct["AttackKind"] = 2;
            CharStruct["Skillname"] = "concussion weapons";
            if (CharStruct.Weapon.WeaponType == 2) then
                CharStruct["UsedHands"] = 1;
            else
                CharStruct["UsedHands"] = 2;
            end
        elseif (CharStruct.Weapon.WeaponType == 3) or (CharStruct.Weapon.WeaponType == 6) then
            CharStruct["AttackKind"] = 3;
            CharStruct["Skillname"] = "puncture weapons";
            if (CharStruct.Weapon.WeaponType == 3) then
                CharStruct["UsedHands"] = 1;
            else
                CharStruct["UsedHands"] = 2;
            end
        elseif (CharStruct.Weapon.WeaponType == 7) then
            CharStruct["AttackKind"] = 4;
            CharStruct["Skillname"] = "distance weapons";
            if (CharStruct.Weapon.AmmunitionType == 255) then
                CharStruct["UsedHands"] = 1;
            else
                CharStruct["UsedHands"] = 2;
            end
        else
            return false;
        end
    end
    return CharStruct;
end

--[[
    Load Attributes and Skills

    @param  CharacterTable  The CharacterTable the attribute and skill informations should be added to
    @param  boolean true in case the spells and attribs for the Attacker are needed, false for the Defender
    @return CharacterTable  The table with the new values
]]
function LoadAttribsSkills( CharStruct, offsive )
    CharStruct["strength"]     = ReadAndAlterAttribute( CharStruct.Char, "strength" );
    CharStruct["dexterity"]    = ReadAndAlterAttribute( CharStruct.Char, "dexterity" );
    CharStruct["agility"]      = ReadAndAlterAttribute( CharStruct.Char, "agility" );
    CharStruct["perception"]   = ReadAndAlterAttribute( CharStruct.Char, "perception" );
    CharStruct["intelligence"] = ReadAndAlterAttribute( CharStruct.Char, "intelligence" );
    CharStruct["willpower"]    = ReadAndAlterAttribute( CharStruct.Char, "willpower" );
    CharStruct["tactics"]      = CharStruct.Char:getSkill("tactics");
    CharStruct.tactics         = CharStruct.tactics * base.common.Scale( 0.5, 1.1, ( CharStruct.intelligence*2 + CharStruct.willpower ) * 10 / 3 );
    if offsive then
        CharStruct["skill"]        = CharStruct.Char:getSkill( CharStruct.Skillname );
        CharStruct["poison"]       = CharStruct.Char:getSkill("poisoning");
        CharStruct["natpoison"]    = CharStruct.Char:getSkill("poisonstrength");
    else
        CharStruct["parry"]        = CharStruct.Char:getSkill( "parry" );
        CharStruct["dodge"]        = CharStruct.Char:getSkill( "dodge" );
        CharStruct["constitution"] = ReadAndAlterAttribute( CharStruct.Char, "constitution" );
    end
    CharStruct["Race"]         = CharStruct.Char:getRace();
    return CharStruct;
end

--[[
    Load one attribute from a character and alter the value in case it is needed

    @param  CharacterStruct  The character the value should be read from
    @param  string  the attribute name that shall be read
    @return int the value of the attribute
]]
function ReadAndAlterAttribute( Char, Attribute )
    local value = Char:increaseAttrib( Attribute, 0 );
    if ( value < 6 ) then
        value = 6 - ( 6 - value ) * 2;
    end
    return value;
end

--[[
    Check if the attack is okay, so if a good combination of items is in place

    @param  CharacterTable  The character table that shall be checked if it is valid to attack
    @return boolean  true if the attack can go on, false if not
]]
function CheckAttackOK( CharStruct )
    if (CharStruct.WeaponItem.id == 228) then -- Item is occupied
        return false;
    end
    if (CharStruct.SecisWeapon) then -- there is something in the second hand
        if (CharStruct.AttackKind == 0) then -- but nothing in the first
            return false;
        elseif (CharStruct.SecWeapon.WeaponType == 7) then -- but a distance weapon in the first
            return false;
        elseif (CharStruct.Weapon.WeaponType == 13) then -- but a wand in the first
            return false;
        end
    end
    return true;
end

--[[
    Checks if the attacker uses a distance weapon that needs ammo and checks if the ammo
    is avaiable

    @param  CharacterTable  The table of the attacking character
    @param  CharacterStruct The struct of the attacked character
    @return boolean  true if the attack can go on, false if not
]]
function HandleAmmunition( Attacker, DefenderChar )
    if (Attacker.Char:getType()==1) then
        return true;
    end

    if (Attacker.AttackKind ~= 4) then
        return true;
    end

    if (Attacker.Weapon.AmmunitionType==Attacker.SecWeapon.WeaponType) then
        Attacker.Char:increaseAtPos(Attacker.SecWeaponItem.itempos,-1);
        return true;
    elseif (Attacker.Weapon.AmmunitionType==255) then
        Attacker.Char:increaseAtPos(Attacker.WeaponItem.itempos,-1);
        return true;
    else
        return false;
    end
    return true;
end

--[[
    Does any modifications before the real fighting starts, in case Attacker or Defender is returned as false the attack is cancled

    @param  CharacterTable  The table of the attacking character
    @param  CharacterTable  The table of the attacked character
    @param  GlobalsTable    The table of global stored values
    @return CharacterTable  The table of the attacking character
    @return CharacterTable  The table of the attacked character
    @return GlobalsTable    The table of global stored values
]]
function SpecialPassiveItemEffects( Attacker, Defender, Globals )
    return Attacker, Defender, Globals;
end

--[[
    Checks if the the attacked character is a gm and if the attack is valid

    @param  CharacterTable  The table of the attacking character
    @param  CharacterTable  The table of the attacked character
    @return boolean  true if the attack can go on, false if not
]]
function SpecialGM( Attacker, Defender )
    if not Defender.Char:isAdmin() then
        return true;
    end

    if ( Attacker.Char:getType() ~= 1 ) then
        return true;
    end

    if ( Defender.RightWeaponItem.id == 99 ) and ( Defender.RightWeaponItem.data == 1 ) then
        Attacker.Char.movepoints = Attacker.Char.movepoints - 10;
        return false;
    end
    if ( Defender.LeftWeaponItem.id == 99 ) and ( Defender.LeftWeaponItem.data == 1 ) then
        Attacker.Char.movepoints = Attacker.Char.movepoints - 10;
        return false;
    end
    return true;
end

--[[
    Checks if a coup de gráce is performed on the attacked character and kills the char if needed

    @param  CharacterTable  The table of the attacking character
    @param  CharacterTable  The table of the attacked character
    @return boolean  true if a coup de gráce was done
]]
function CoupDeGrace( Attacker, Defender )
    if ( Attacker.Char:getType() ~= 0 ) then
        return false;
    end
    local Hitpoints = Defender.Char:increaseAttrib("hitpoints",0);
    if (( Attacker.AttackKind ~= 4 ) and ( Hitpoints == 1 ) and not content.fighting.IsTrainingWeapon( Attacker.WeaponItem.id )) then
        local gText = "seinem";
        local eText = "his";
        if (Attacker.Char:increaseAttrib("sex",0) == 1) then
            gText = "ihrem";
            eText = "her";
        end
        Attacker.Char:talkLanguage( Character.say, Player.german,  "#me gibt "..gText.." Gegner den Gnadenstoß." );
        Attacker.Char:talkLanguage( Character.say, Player.english, "#me gives "..eText.." enemy the coup de gráce." );

        Defender.Char:increaseAttrib("hitpoints",-1);
        for x=-1,1 do
            for y=-1,1 do
                DropBlood(position(Defender.Char.pos.x+x,Defender.Char.pos.y+y,Defender.Char.pos.z),3101);
            end
        end
		
        return true;
    end
    return false;
end

--[[
    Show the GFX related to the kind of attack that as performed

    @param  CharacterTable  The table of the attacking character
    @param  CharacterTable  The table of the attacked character
    @return boolean  true if the attack can go on, false if not
]]
function ShowAttackGFX( Attacker, Defender )
    local PlayGfx = 0;
    if (Attacker.AttackKind == 0) then -- wrestling
        world:gfx(content.fighting.GetWrestlingGFX( Attacker ),Attacker.Char.pos);
    elseif (Attacker.AttackKind == 1) then -- slashing
        world:gfx(17,Attacker.Char.pos);
    elseif (Attacker.AttackKind == 2) then -- concussion
        world:gfx(19,Attacker.Char.pos);
    elseif (Attacker.AttackKind == 3) then -- puncture
        world:gfx(20,Attacker.Char.pos);
    elseif (Attacker.AttackKind == 4) then -- distance
        world:gfx(15,Attacker.Char.pos);
    end
    --Attacker.Char:performAnimation(5);
    return true;
end

--[[
    Generate the default modificators of the attacking character
    The mods are related to the figthing style and the tactics skill
    AttackMod is in a range of 0.25 up to 1.2
    APMod is in a range of 1.5 down to 0.4

    @param  CharacterTable  The table of the attacking character
    @return CharacterTable  The table of the attacking character with the new Modificators
]]
function GenAttackerMods( Attacker )
    if (Attacker.AttackKind == 0) then
        -- wrestling( 0.8 --> 1 )
        Attacker["APMod"] = 0.5;
        --Attacker["AttackMod"] = base.common.Scale( 0.4, 0.5, Attacker.tactics );
        Attacker["AttackMod"] = base.common.Scale( 0.8, 1, Attacker.tactics );
    elseif (Attacker.AttackKind == 4) then
        -- distance weapons ( 0.82 --> 1.22 )
        Attacker["APMod"] = base.common.Scale( 1.1, 0.9, Attacker.tactics );
        --Attacker["AttackMod"] = base.common.Scale( 0.9, 1.1, Attacker.tactics );
        Attacker["AttackMod"] = base.common.Scale( 0.82, 1.22, Attacker.tactics );
    elseif (Attacker.UsedHands == 2) then
        -- two handed weapons ( 0.4 --> 1.33 )
        Attacker["APMod"] = base.common.Scale( 1.5, 0.9, Attacker.tactics );
        --Attacker["AttackMod"] = base.common.Scale( 0.6, 1.2, Attacker.tactics );
        Attacker["AttackMod"] = base.common.Scale( 0.4, 1.33, Attacker.tactics );
    elseif (Attacker.secIsWeapon) and (Attacker.SecWeapon.WeaponType==14) then
        -- weapon + shield ( 0.54 --> 1.33 )
        Attacker["APMod"] = base.common.Scale( 1.3, 0.9, Attacker.tactics );
        --Attacker["AttackMod"] = base.common.Scale( 0.9, 1.1, Attacker.tactics );
        Attacker["AttackMod"] = base.common.Scale( 0.54, 1.33, Attacker.tactics );
    elseif (Attacker.secIsWeapon) then
        -- two weapons ( 0.31 --> 1.5 )
        Attacker["APMod"] = base.common.Scale( 0.8, 0.4, Attacker.tactics );
        --Attacker["AttackMod"] = base.common.Scale( 0.25, 0.6, Attacker.tactics );
        Attacker["AttackMod"] = base.common.Scale( 0.31, 1.5, Attacker.tactics );
    else
        -- one weapon ( 0.82 --> 1.22 )
        Attacker["APMod"] = base.common.Scale( 1.1, 0.9, Attacker.tactics );
        --Attacker["AttackMod"] = base.common.Scale( 0.9, 1.1, Attacker.tactics );
        Attacker["AttackMod"] = base.common.Scale( 0.82, 1.22, Attacker.tactics );
    end
    return Attacker;
end

--[[
    Generate the Stiffness Modificator for the Character
    Related to the stiffness of the armour this modificator has values between 1.2 and 0.9
    The noDodge value is set in case the stiffness is in sum greater then 100

    @param  CharacterTable  The table of the character the mod shall be calculated for
    @return CharacterTable  The table of the character with the modificator
]]
function GenStiffnessMod( CharStruct )
    local Stiff = base.common.GetStiffness( CharStruct.Char );
    CharStruct["StiffnessMod"] = base.common.Scale( 1.2, 0.9, Stiff / 5);
    CharStruct["noDodge"] = ( Stiff > 100 );
    return CharStruct;
end

--[[
    Generate a modifier related to the hitpoints of the character
    The HPMod is splited up into 3 area.
    10000HP - 4000HP --> HPMod = 1           (constant)
    4000HP - 1000HP --> HPMod = 1 --> 0.5    (lowers with lowering HP)
    1000HP - 0HP    --> HPMod = 0.5 --> 0.7  (raises with lowering HP)

    @param  CharacterTable  The table of the character the mod shall be calculated for
    @return CharacterTable  The table of the character with the modificator
]]
function HPMod( Charstruct )
    local Hitpoints = Charstruct.Char:increaseAttrib( "hitpoints", 0 );
    if ( Hitpoints > 4000 ) then
        Charstruct["HPMod"] = 1;
    elseif ( Hitpoints > 1000 ) then
        Charstruct["HPMod"] = base.common.Scale( 0.5, 1, ( Hitpoints - 1000 ) / 30 );
    else
        Charstruct["HPMod"] = base.common.Scale( 0.7, 0.5, Hitpoints / 10 );
    end
    return Charstruct;
end

--[[
    Calculate the actionspoints that need to be removed from the attacking character and remove them.

    @param  CharacterTable  The table of the character that attacks
]]
function HandleMovepoints( Attacker )
    local weaponMovepoints;
    if( Attacker.isWeapon )then
        weaponMovepoints = Attacker.Weapon.ActionPoints;
    else
        weaponMovepoints = content.fighting.GetWrestlingMovepoints( Attacker.Race );
    end
    local reduceMovepoints = weaponMovepoints * Attacker.APMod / Attacker.StiffnessMod / Attacker.HPMod * 0.7;
    Attacker.Char.movepoints=Attacker.Char.movepoints-math.floor( reduceMovepoints );
---[[DEBUG
    AddDebugText( "AP-"..math.floor( reduceMovepoints ).."="..Attacker.Char.movepoints, 2, Attacker.Char );
--]]
end

--[[
    Generate the position modificator of the attacking character
    The modificator depends on the relative position of both character and on the looking direction of both characters
    The modificators holds a value between 0.6 (attacker tuned the back to the defenders front)
        and 1.4 (attacker hits into the back of the defendre)

    @param  CharacterStruct  The struct of the attacking character
    @param  CharacterStruct  The struct of the attacked character
    @param  GlobalTable The table containing the global values
    @return GlobalTable The global table with the new modificator
]]
function GenPositionMod( AttackerChar, DefenderChar, Globals )
    local AttLookDir=AttackerChar:getFaceTo();
    local DefLookDir=DefenderChar:getFaceTo();
    local NewAttShape = 0;
    local NewDefShape = 0;
    if (AttLookDir==2) then
        NewAttShape=RotateShape( AttShape, -1 );
    elseif (AttLookDir==4) then
        NewAttShape=RotateShape( AttShape, 0 );
    elseif (AttLookDir==6) then
        NewAttShape=RotateShape( AttShape, 1 );
    else
        NewAttShape=RotateShape( AttShape, 2 );
    end
    if (DefLookDir==2) then
        NewDefShape=RotateShape( DefShape, -1 );
    elseif (DefLookDir==4) then
        NewDefShape=RotateShape( DefShape, 0 );
    elseif (DefLookDir==6) then
        NewDefShape=RotateShape( DefShape, 1 );
    else
        NewDefShape=RotateShape( DefShape, 2 );
    end
    local Chars={AttackerChar,DefenderChar};
    local ShapePosX={};
    local ShapePosY={};
    for i=1,2 do
        if (Chars[i].pos.x>Chars[3-i].pos.x) then
            ShapePosX[i]=1;
        elseif (Chars[i].pos.x<Chars[3-i].pos.x) then
            ShapePosX[i]=3;
        else
            ShapePosX[i]=2;
        end
        if (Chars[i].pos.y>Chars[3-i].pos.y) then
            ShapePosY[i]=1;
        elseif (Chars[i].pos.y<Chars[3-i].pos.y) then
            ShapePosY[i]=3;
        else
            ShapePosY[i]=2;
        end
    end
    local AttMod=NewAttShape[ ShapePosY[1] ][ ShapePosX[1] ];
    local DefMod=NewDefShape[ ShapePosY[2] ][ ShapePosX[2] ];
    if (AttMod==nil) then AttMod=100; end
    if (DefMod==nil) then DefMod=100; end
    Globals["PositionMod"] = (AttMod+DefMod)/200;
    return Globals;
end
--[[
    Rotate a position shape

    @param  table   the input shape
    @param  integer the rotate direction (-1=right, 0=mirror, 1=left)
    @return table   the rotated shape
]]
function RotateShape(Shape, Dir)
    local retShape = {};
    if ( Dir == -1 ) then -- right
        for i=1,3 do
            retShape[i]={Shape[3][i],Shape[2][i],Shape[1][i]};
        end
    elseif ( Dir == 1 ) then -- left
        for i=1,3 do
            retShape[i]={Shape[1][4-i],Shape[2][4-i],Shape[3][4-i]};
        end
    elseif ( Dir == 0 ) then -- mirror
        for i=1,3 do
            retShape[i]={Shape[4-i][3],Shape[4-i][2],Shape[4-i][1]};
        end
    else
        for i=1,3 do
            retShape[i]={Shape[i][1],Shape[i][2],Shape[i][3]};
        end
    end
    return retShape;
end

--[[
    Check if the Defender dodges the attack
    Also teach the defender the dodging skill, in case the dodge was successfully.

    @param  CharacterTable  Table of the attacker
    @param  CharacterTable  Table of the defender
    @param  GlobalsTable    Table of the global values
    @return boolean true of the attack was dodged, false if not
]]
function Dodge( Attacker, Defender, Globals )
    if (Globals.PositionMod>=1.4) then
        if (math.random(1,20)>1) then
---[[DEBUG
            AddDebugText( "no dodge, attack from behind", 3, Attacker.Char );
--]]
            return false;
        end
    end

    if Defender.noDodge then
---[[DEBUG
        AddDebugText( "no dodge, heavy armour", 3, Attacker.Char );
--]]
        return false;
    end

    local AttackerTry = ( Attacker.skill*2 + Attacker.tactics ) / 3 * base.common.ScaleUnlimited( 0.3, 1.2, ( Attacker.perception + Attacker.dexterity*2 + Attacker.agility ) * 1.25 );
    AttackerTry = AttackerTry * Attacker.HPMod * Globals.PositionMod * Attacker.AttackMod * Attacker.StiffnessMod * Attacker.DistanceMod;
    if ( Attacker.isWeapon ) then
        AttackerTry = AttackerTry * base.common.Scale( 0.5, 1.5, Attacker.Weapon.Accuracy * Attacker.WeaponQualMod );
    else
        AttackerTry = AttackerTry * base.common.Scale( 0.5, 1.5, content.fighting.GetWrestlingAccuracy( Attacker.Race ) );
    end

    local DefenderTry = ( Defender.dodge*2 + Defender.tactics ) / 3 * base.common.ScaleUnlimited( 0.3, 1.2, ( Defender.perception + Defender.dexterity + Defender.agility*2 ) * 1.25 );
    DefenderTry = DefenderTry * Defender.HPMod * Defender.StiffnessMod;

    local ChanceToDodge = base.common.Scale( 5, 45, ( DefenderTry - AttackerTry + 100 ) / 2 );
    ChanceToDodge = ChanceToDodge + ( ( 100 - ChanceToDodge ) * ( 1 - math.sqrt( Attacker.APMod ) ) );

---[[DEBUG
    AddDebugText( "Dodge(Attacker-Defender) "..math.floor(AttackerTry).." - "..math.floor(DefenderTry).." = "..math.floor(ChanceToDodge).."%", 2, Attacker.Char );
--]]

    if( math.random(0, 100) <= ChanceToDodge ) then
        --Defender.Char:learn(5,"dodge",2,base.common.Limit(AttackerTry+10, 0, 100 ));
		--Replace with new learn function, see learn.lua 
        return true;
    end

    return false;
end

--[[
    Calculate the attribute modificator for the Attacker and the Defender
    The modificator depends on the attributes of the character. How importaint a attribute for that modificator is, depends on the fighting style.
    The used attributes are strength, dexterity, agility and perception
    At the end player character have a range for this modificator from 0.5 ( in case all 4 attribs are 0 ) and 1.1 ( in case all 4 attributes are 20 )
    Monsters could have a bigger modificator due higher attributes

    @param  CharacterTable  Table of the attacker
    @param  CharacterTable  Table of the defender
    @return CharacterTable  Table of the attacker with the attribute modificator
    @return CharacterTable  Table of the defender with the attribute modificator
]]
function GenAttribMod( Attacker, Defender )
    local Attributs = 0;
    if (Attacker.AttackKind==0) then -- wrestling
        Attributs = ( Attacker.strength*3 + Attacker.dexterity   + Attacker.agility*2 + Attacker.perception   ) / 1.4;
    elseif (Attacker.AttackKind==1) and (Attacker.UsedHands==1) then -- slashing - one hand
        Attributs = ( Attacker.strength   + Attacker.dexterity   + Attacker.agility   + Attacker.perception   ) / 0.8;
    elseif (Attacker.AttackKind==1) and (Attacker.UsedHands==2) then -- slashing - two hands
        Attributs = ( Attacker.strength*2 + Attacker.dexterity*2 + Attacker.agility   + Attacker.perception   ) / 1.2;
    elseif (Attacker.AttackKind==2) and (Attacker.UsedHands==1) then -- concussion - one hand
        Attributs = ( Attacker.strength*3 + Attacker.dexterity   + Attacker.agility*2 + Attacker.perception*2 ) / 1.6;
    elseif (Attacker.AttackKind==2) and (Attacker.UsedHands==2) then -- concussion - two hand
        Attributs = ( Attacker.strength*4 + Attacker.dexterity   + Attacker.agility*2 + Attacker.perception*2 ) / 1.8;
    elseif (Attacker.AttackKind==3) and (Attacker.UsedHands==1) then -- puncture - one hand
        Attributs = ( Attacker.strength   + Attacker.dexterity*4 + Attacker.agility*4 + Attacker.perception*3 ) / 2.4;
    elseif (Attacker.AttackKind==3) and (Attacker.UsedHands==2) then -- puncture - two hand
        Attributs = ( Attacker.strength   + Attacker.dexterity*3 + Attacker.agility*3 + Attacker.perception*2 ) / 1.8;
    elseif (Attacker.AttackKind==4) then -- distance
        Attributs = ( Attacker.strength   + Attacker.dexterity*4 + Attacker.agility*3 + Attacker.perception*4 ) / 2.4;
    end
    Attacker["AttribMod"]  = base.common.ScaleUnlimited( 0.5, 1.1, Attributs );

    if ( ( Defender.LeftisWeapon and Defender.LeftWeapon.WeaponType == 14 ) or ( Defender.RightisWeapon and Defender.RightWeapon.WeaponType == 14 ) ) then -- width shield
        Attributs = ( Defender.strength*2 + Defender.dexterity   + Defender.agility   + Defender.perception   );
    else -- without shield
        Attributs = ( Defender.strength   + Defender.dexterity*2 + Defender.agility*2 + Defender.perception   ) / 1.2;
    end
    Defender["AttribMod"]  = base.common.ScaleUnlimited( 0.5, 1.1, Attributs );

    return Attacker, Defender;
end

--[[
    Checks if the Defender parries a incomming attack
    Also teaches the parry skill on success

    @param  CharacterTable  Table of the attacker
    @param  CharacterTable  Table of the defender
    @param  GlobalsTable    Table of the global values
    @return boolean true of the attack was parried, false if not
]]
function Parry( Attacker, Defender, Globals )
    -- Attack with weapons again unweaponed enemy
    if (Attacker.AttackKind ~= 0) and not Defender.LeftisWeapon and not Defender.RightisWeapon then
---[[DEBUG
        AddDebugText( "no parry due attack with weapons against unweaponed enemy", 3, Attacker.Char );
--]]
        return false;
    end

    -- Hit into the back
    if (Globals.PositionMod>=1.4) then
        if (math.random(1,100)<= base.common.Scale( 95, 50, Defender.tactics) ) then
---[[DEBUG
            AddDebugText( "no parry due attack into the back", 3, Attacker.Char );
--]]
            return false;
        end
    end

    local AttackerTry = ( Attacker.skill*2 + Attacker.tactics ) / 3 * Attacker.AttribMod * Attacker.HPMod * Globals.PositionMod * Attacker.AttackMod * Attacker.StiffnessMod * Attacker.DistanceMod;
    if ( Attacker.isWeapon ) then
        AttackerTry = AttackerTry * base.common.Scale( 0.5, 1.5, Attacker.Weapon.Attack * Attacker.WeaponQualMod / 2 );
    else
        AttackerTry = AttackerTry * base.common.Scale( 0.5, 1.5, content.fighting.GetWrestlingAttack( Attacker.Race ) / 2 );
    end

    local DefenderTry = ( Defender.parry*2 + Defender.tactics ) / 3 * Defender.AttribMod * Defender.HPMod * Defender.StiffnessMod;

    local LeftWeaponParry = 0;
    local RightWeaponParry = 0;
    local Shield_used = false;
    if Defender.LeftisWeapon then
        LeftWeaponParry  = Defender.LeftWeapon.Defence * Defender.LeftWeaponQualMod;
        if (Defender.LeftWeapon.WeaponType==14) then
            Shield_used = true;
        end
    end
    if Defender.RightisWeapon then
        RightWeaponParry = Defender.RightWeapon.Defence * Defender.RightWeaponQualMod;
        if (Defender.RightWeapon.WeaponType==14) then
            Shield_used = true;
        end
    end
    if ( Attacker.AttackKind ~= 4 ) and not Shield_used then
        DefenderTry = DefenderTry * 0.2;
    end

    local WeaponParry = 0;
    if (Attacker.AttackKind == 0) then
        WeaponParry = content.fighting.GetWrestlingParry( Defender.Race );
    else
        WeaponParry = ( math.max( LeftWeaponParry, RightWeaponParry )*2 + math.min( LeftWeaponParry, RightWeaponParry ) ) / 3;
    end
    DefenderTry = DefenderTry * base.common.Scale( 0.5, 1.5, WeaponParry / 2 );

    local ChanceToParry = base.common.Scale( 5, 45, ( DefenderTry - AttackerTry + 100 ) / 2 );
    ChanceToParry = ChanceToParry + ( ( 100 - ChanceToParry ) * ( 1 - math.sqrt( Attacker.APMod ) ) );

---[[DEBUG
    AddDebugText( "Parry(Attacker-Defender) "..math.floor(AttackerTry).." - "..math.floor(DefenderTry).." = "..math.floor(ChanceToParry).."%", 2, Attacker.Char );
--]]

    if( math.random(0, 100) <= ChanceToParry ) then
        --Defender.Char:learn(5,"parry",2,base.common.Limit(AttackerTry+20, 0, 100 ));
		--Replace with new learn function, see learn.lua 
        return true;
    end

    return false;
end

--[[
    Generate a modificator related to the distance of the characters to each other

    @param  CharacterTable  Table of the attacking character
    @param  CharacterStruct Struct of the attacked character
    @return CharacterTable  Table of the attacking character with the new modificator
]]
function GenDistanzMod( Attacker, DefenderChar )
    if (Attacker.AttackKind~=4) then
        Attacker["DistanceMod"] = 1;
        return Attacker;
    end

    local Distance = math.sqrt( ( Attacker.Char.pos.x - DefenderChar.pos.x )^2 + ( Attacker.Char.pos.y - DefenderChar.pos.y )^2 );

    if( Distance < 4 ) then
        Attacker["DistanceMod"] = base.common.Scale( 0.2, 1, ( Distance - 1 ) * 100 / 3 );
    else
        Attacker["DistanceMod"] = base.common.Scale( 1, 0.7, ( Distance - 4 ) * 100 / 6 );
    end
    return Attacker;
end

--[[
    Destroys a weapon of a character

    @param  CharacterTable  Table of the character whos weapon should be damaged
    @param  string  prefix of the name of the weapon that is broken up
    @param  string  prefix of the second weapon in order to perform some checks
    @return boolean true at all times
]]
function BreakWeapon( CharStruct, NameFirst, NameSec )
    if (CharStruct.Char:getType()==1) then
        return true;
    end

    local FirstWeaponItem = NameFirst.."WeaponItem";
    local FirstWeapon = NameFirst.."Weapon";

    if ( CharStruct[FirstWeaponItem] ) then
        if not CharStruct[NameFirst.."isWeapon"] then
            return true;
        end

        if (CharStruct[FirstWeapon].WeaponType == 10 or
            CharStruct[FirstWeapon].WeaponType == 11 or
            CharStruct[FirstWeapon].AmmunitionType == 255) then
            return true;
        end

        local ItemQual=math.floor( CharStruct[FirstWeaponItem].quality / 100 );
        local ItemDura=CharStruct[FirstWeaponItem].quality - ( ItemQual * 100 );

        if (math.random(base.common.Scale(30,300,ItemQual*11))==1) then
            if IsPlatedWeapon( CharStruct[FirstWeaponItem].id ) then
                ItemDura = ItemDura - 10;
            else
                ItemDura = ItemDura - 1;
            end
            if (ItemDura<1) then
                if IsPlatedWeapon( CharStruct[FirstWeaponItem].id ) and ( ItemQual > 1 ) then
                    local CharWeakness = 0;
                    if IsMeriniumPlatedWeapon( CharStruct[FirstWeaponItem].id ) then
                        CharWeakness = GetWeaknessMerinium( CharStruct.Race );
                    elseif IsGoldPlatedWeapon( CharStruct[FirstWeaponItem].id ) then
                        CharWeakness = GetWeaknessGold( CharStruct.Race );
                    elseif IsSilverPlatedWeapon( CharStruct[FirstWeaponItem].id ) then
                        CharWeakness = GetWeaknessSilver( CharStruct.Race );
                    elseif IsCopperPlatedWeapon( CharStruct[FirstWeaponItem].id ) then
                        CharWeakness = GetWeaknessCopper( CharStruct.Race );
                    end
                    CharStruct[FirstWeaponItem].quality = ( ( ItemQual - 1 ) * 100 ) + 30;
                    CharStruct[FirstWeaponItem].id = GetPlatedBaseWeapon( CharStruct[FirstWeaponItem].id );
                    world:changeItem( CharStruct[FirstWeaponItem] );
                    local SecWeaponItem = NameSec.."WeaponItem"
                    if ( CharStruct[SecWeaponItem].id == 228 ) then
                        CharStruct.Char:createAtPos( CharStruct[SecWeaponItem].itempos, 228, 1 );
                    end
                    base.common.InformNLS(CharStruct.Char,
                    "Das Metall mit dem deine Waffe verbessert wurde, bricht von der Waffe herunter und verletzt dich selbst.",
                    "The metal your weapon was plated with breaks from the weapon and hurts yourself.");

                    CharStruct.Char:increaseAttrib( "hitpoints", -1000 + CharWeakness * -300 );
                else
                    CharStruct.Char:increaseAtPos(CharStruct[FirstWeaponItem].itempos,-1);
                    if ( CharStruct[FirstWeapon].WeaponType == 14 ) then
                        base.common.InformNLS(CharStruct.Char,"Deine Schild ist zerbrochen","Your shield just broke.");
                    else
                        base.common.InformNLS(CharStruct.Char,"Deine Waffe ist zerbrochen","Your weapon just broke.");
                    end
                    local SecWeaponItem = NameSec.."WeaponItem"
                    if ( CharStruct[SecWeaponItem].id == 228 ) then
                        CharStruct.Char:increaseAtPos( CharStruct[SecWeaponItem].itempos, -1 );
                    end
                end
            else
                CharStruct[FirstWeaponItem].quality = ( ItemQual*100 ) + ItemDura;
                world:changeItem( CharStruct[FirstWeaponItem] );
                local SecWeaponItem = NameSec.."WeaponItem"
                if ( CharStruct[SecWeaponItem].id == 228 ) then
                    CharStruct.Char:createAtPos( CharStruct[SecWeaponItem].itempos, 228, 1 );
                end
            end
        end
    end
    return true;
end

--[[
    Check for the hitted area of a successfull strike

    @param  CharacterTable  Table of the hitted character
    @param  GlobalsTable    Table of the global values
    @return GlobalsTable    Table of the global values with the new information
]]
function GetHitArea( Defender, Globals )
    if ( Defender.Race == 12 ) then -- beholder
        if( math.random( 10 ) <= 2 ) then
            Globals["HittedArea"] = Character.head;
        else
            Globals["HittedArea"] = Character.breast;
        end
    elseif (Race == 17) then -- insekten
        Globals["HittedArea"] = Character.breast;
    elseif (Race == 21) then -- rotwurm
        if( math.random( 7 ) <= 3 ) then
            Globals["HittedArea"] = Character.head;
        else
            Globals["HittedArea"] = Character.breast;
        end
    elseif (Race == 26) then -- fliegender Totenkopf
        Globals["HittedArea"] = Character.head;
    elseif (Race == 27) then -- wasp
        if( math.random( 6 ) <= 1 ) then
            Globals["HittedArea"] = Character.head;
        else
            Globals["HittedArea"] = Character.breast;
        end
    elseif (Race == 29) then -- shadow skeleton
        local randomValue = math.random( 68 );
        if ( randomValue < 15 ) then
            Globals["HittedArea"] = Character.head;
        elseif ( randomValue < 55 ) then
            Globals["HittedArea"] = Character.breast;
        else
            Globals["HittedArea"] = Character.hands;
        end
    else
        local randomValue = math.random( 100 );
        if ( randomValue < 15 ) then
            Globals["HittedArea"] = Character.head;
        elseif ( randomValue < 55 ) then
            Globals["HittedArea"] = Character.breast;
        elseif ( randomValue < 68 ) then
            Globals["HittedArea"] = Character.hands;
        elseif ( randomValue < 88 ) then
            Globals["HittedArea"] = Character.legs;
        else
            Globals["HittedArea"] = Character.feet;
        end
    end

---[[DEBUG
    if Globals.HittedArea == Character.head then
        AddDebugText( "head", 2, Defender.Char );
    elseif Globals.HittedArea == Character.breast then
        AddDebugText( "breast", 2, Defender.Char );
    elseif Globals.HittedArea == Character.hands then
        AddDebugText( "hands", 2, Defender.Char );
    elseif Globals.HittedArea == Character.legs then
        AddDebugText( "legs", 2, Defender.Char );
    elseif Globals.HittedArea == Character.feet then
        AddDebugText( "feet", 2, Defender.Char );
    end
--]]
    return Globals;
end

--[[
    Generate if the strike is a critical hit or not

    @param  CharacterTable  Table of the attacking character
    @param  GlobalsTable    Table of the global values
    @return GlobalsTable    Table of the global values with the new information
]]
function GenCriticalHit( Attacker, Globals )
    if (math.random(0,5000)<(Attacker.perception+Attacker.dexterity)) then
        Globals["criticalHit"] = true;
    else
        Globals["criticalHit"] = false;
    end
    return Globals;
end

--[[
    Calculate the Damage caused by the attack

    @param  CharacterTable  Table of the attacker
    @param  CharacterTable  Table of the defender
    @param  GlobalsTable    Table of the global values
    @return GlobalsTable    Table of the global values with the damage added
]]
function Damage( Attacker, Defender, Globals )

    local AttackerTry = ( Attacker.skill*2 + Attacker.tactics ) / 3 * Attacker.AttribMod * Attacker.HPMod * Globals.PositionMod * Attacker.AttackMod * Attacker.StiffnessMod * Attacker.DistanceMod;
    if ( Attacker.isWeapon ) then
        AttackerTry = AttackerTry * base.common.Scale( 0.3, 1.8, Attacker.Weapon.Attack * Attacker.WeaponQualMod / 2 );
    else
        AttackerTry = AttackerTry * base.common.Scale( 0.3, 1.8, content.fighting.GetWrestlingAttack( Attacker.Race ) / 2 );
    end

    local armourValue = 0;
    local armourAbsorb = 0;

    local HittedItem=Defender.Char:getItemAt(Globals.HittedArea);
    local armourfound,armour=world:getArmorStruct(HittedItem.id);

    if armourfound then
        if (Attacker.AttackKind==0) then --wrestling
            if armour.ThrustArmor~= nil then
                armourValue=armour.ThrustArmor;
            end
        elseif (Attacker.AttackKind==1) then --slashing
            armourValue=armour.StrokeArmor;
        elseif (Attacker.AttackKind==2) then --concussion
            armourValue=armour.ThrustArmor;
        elseif (Attacker.AttackKind==3) then --puncture
            armourValue=armour.PunctureArmor;
        elseif (Attacker.AttackKind==4) then --distance
            armourValue=armour.PunctureArmor;
        end
        armourAbsorb = armour.Absorb;
        if (Defender.Char:getType()~=1) then
            local qualMod = GetQualityEffect(HittedItem.quality);
            armourValue  = armourValue  * qualMod;
            armourAbsorb = armourAbsorb * qualMod;
        end
    end

    if (Globals.HittedArea == Character.breast) then
        HittedItem=Defender.Char:getItemAt(Character.coat);
        armourfound,armour=world:getArmorStruct(HittedItem.id);
        local addarmourValue = 0;
        local addarmourAbsorb = 0;
        if armourfound then
            if (Attacker.AttackKind==0) then --wrestling
                if armour.ThrustArmor ~= nil then
                    addarmourValue = armour.ThrustArmor;
                end
            elseif (Attacker.AttackKind==1) then --slashing
                addarmourValue= armour.StrokeArmor;
            elseif (Attacker.AttackKind==2) then --concussion
                addarmourValue= armour.ThrustArmor;
            elseif (Attacker.AttackKind==3) then --puncture
                addarmourValue= armour.PunctureArmor;
            elseif (Attacker.AttackKind==4) then --distance
                addarmourValue= armour.PunctureArmor;
            end
            addarmourAbsorb = armour.Absorb;
            if (Defender.Char:getType()~=1) then
                local qualMod = GetQualityEffect(HittedItem.quality);
                addarmourValue  = addarmourValue  * qualMod;
                addarmourAbsorb = addarmourAbsorb * qualMod;
            end
            armourValue = armourValue + addarmourValue;
            armourAbsorb = armourAbsorb + addarmourAbsorb;
        end
    end

    armourfound,armour=world:getNaturalArmor( Defender.Race );
    if armourfound then
        if (Attacker.AttackKind==0) then --wrestling
            armourValue=armourValue+armour.thrustArmor;
        elseif (Attacker.AttackKind==1) then --slashing
            armourValue=armourValue+armour.strokeArmor;
        elseif (Attacker.AttackKind==2) then --concussion
            armourValue=armourValue+armour.thrustArmor;
        elseif (Attacker.AttackKind==3) then --puncture
            armourValue=armourValue+armour.punctureArmor;
        elseif (Attacker.AttackKind==4) then --distance
            armourValue=armourValue+armour.punctureArmor;
        end
    end

    local DefenderTry = armourValue / 2;
    Globals["Damage"] = base.common.Limit( base.common.Scale( 300, 4000, AttackerTry ) * base.common.Scale( 1, 0.3, DefenderTry ), 100, 4000 );
    --Globals.Damage = Globals.Damage * Attacker.APMod;
    if Globals.criticalHit then
        Globals.Damage = Globals.Damage * 3;
    end

---[[DEBUG
    AddDebugText( "Damage(Attacker-Defender) "..math.floor(AttackerTry).." - "..math.floor(DefenderTry).." = "..math.floor(Globals.Damage).."HP", 2, Attacker.Char );
--]]

    Globals.Damage = Globals.Damage - armourAbsorb;
    Globals.Damage = Globals.Damage / base.common.ScaleUnlimited( 0.5, 1.5, Defender.constitution * 5 );

    return Globals;
end

--[[
    Destroy the armour of a character

    @param  CharacterTable  Table of the character whos armour should be damaged
    @param  GlobalsTable    Table of the global values
    @return boolean true at all times
]]
function Breakarmour( CharStruct, Globals )
    if (CharStruct.Char:getType()==1) then
        return true;
    end

    local HittedItem=CharStruct.Char:getItemAt( Globals.HittedArea );

    if ( HittedItem.id ~= 0 ) then

        local ItemQual=math.floor(HittedItem.quality/100);
        local ItemDura=HittedItem.quality-(ItemQual*100);

        if (math.random(base.common.Scale(30,300,ItemQual*11))==1) then
            ItemDura = ItemDura - 1;
            if (ItemDura<1) then
                CharStruct.Char:increaseAtPos(HittedItem.itempos,-1);
                base.common.InformNLS(CharStruct.Char,"Ein Rüstungsteil ist zerbrochen.","A part of your armour just broke.");
            else
                HittedItem.quality = ( ItemQual*100 ) + ItemDura;
                world:changeItem( HittedItem );
            end
        end
    end

    if (Globals.HittedArea == Character.breast) then
        HittedItem=CharStruct.Char:getItemAt( Character.coat );

        if ( HittedItem.id ~= 0 ) then

            local ItemQual=math.floor(HittedItem.quality/100);
            local ItemDura=HittedItem.quality-(ItemQual*100);

            if (math.random(base.common.Scale(30,300,ItemQual*11))==1) then
                ItemDura = ItemDura - 1;
                if (ItemDura<1) then
                    CharStruct.Char:increaseAtPos(HittedItem.itempos,-1);
                    base.common.InformNLS(CharStruct.Char,"Ein Rüstungsteil ist zerbrochen.","A part of your armour just broke.");
                else
                    HittedItem.quality = ( ItemQual*100 ) + ItemDura;
                    world:changeItem( HittedItem );
                end
            end
        end
    end

    return true;
end

--[[
    Special passive Item Effects

    @param  CharacterTable  Table of the Attacking Character
    @param  CharacterTable  Table of the Attacked Character
    @param  GlobalsTable    Table of the global values
    @return GlobalsTable    Table of the global values with modified values
]]
function SpecialActiveItemEffects( Attacker, Defender, Globals )
    local PoisonStr = 0;
    if Attacker.isWeapon then
        if (Attacker.WeaponItem.id == 91) then -- Malachin Dolch
            if GetUnholyRace(Defender.Race) then
                if (math.random(0,5) == 1) then
                    world:gfx(46,Defender.Char.pos);
                    Globals.Damage = Globals.Damage + ( Globals.Damage * 3 * Attacker.WeaponQualMod );
                end
            end
        elseif (Attacker.WeaponItem.id == 206) then -- Feuerlangschwert
            if ((Defender.Race~=22) and (Defender.Race~=33)) then
                if (math.random(0,10) == 1) then
                    world:gfx(9,Defender.Char.pos);
                    Globals.Damage = Globals.Damage + 800 * Attacker.WeaponQualMod;
                end
            end
        elseif (Attacker.WeaponItem.id == 2626) then -- magische Kriegsaxt
            if (math.random(0,10) == 1) then
                world:gfx(4,Defender.Char.pos);
                Globals.Damage = Globals.Damage + 500 * Attacker.WeaponQualMod;
            end
        elseif (Attacker.WeaponItem.id == 2627) then -- Feuer-Kriegsaxt
            if ((Defender.Race~=22) and (Defender.Race~=33)) then
                if (math.random(0,13) == 1) then
                    world:gfx(36,Defender.Char.pos);
                    Globals.Damage = Globals.Damage + 1300 * Attacker.WeaponQualMod;
                end
            end
        elseif (Attacker.WeaponItem.id == 2640) then -- riesige Feuer-Kriegsaxt
            if ((Defender.Race~=22) and (Defender.Race~=33)) then
                if (math.random(0,15) == 1) then
                    world:gfx(44,Defender.Char.pos);
                    Globals.Damage = Globals.Damage + 2200 * Attacker.WeaponQualMod;
                end
            end
        elseif (Attacker.WeaponItem.id == 2654) then -- magisches Breitschwert
            if (math.random(0,12) == 1) then
                world:gfx(2,Defender.Char.pos);
                Globals.Damage = Globals.Damage + 700 * Attacker.WeaponQualMod;
                Defender.Char.movepoints = Defender.Char.movepoints - 15;
            end
        elseif (Attacker.WeaponItem.id == 2656) then -- Feuer-Breitschwert
            if ((Defender.Race~=22) and (Defender.Race~=33)) then
                if (math.random(0,10) == 1) then
                    world:gfx(36,Defender.Char.pos);
                    Globals.Damage = Globals.Damage + 500 * Attacker.WeaponQualMod;
                    Defender.Char.movepoints = Defender.Char.movepoints - 15;
                end
            end
        elseif (Attacker.WeaponItem.id == 2662) then -- Magische Zwergenaxt
            if (Attacker.Race == 1) then -- Zwerg
                if (math.random(0,2) == 1) then
                    Attacker.Char.movepoints = Attacker.Char.movepoints + 20;
                end
            end
        elseif (Attacker.WeaponItem.id == 2671) then -- magischer Dolch
            if (math.random(0,14) == 1) then
                world:gfx(6,Defender.Char.pos);
                Globals.Damage = Globals.Damage + 1000 * Attacker.WeaponQualMod;
                Defender.Char.movepoints = Defender.Char.movepoints - 15;
            end
        elseif (Attacker.WeaponItem.id == 2672) then -- giftiger Dolch
            if (math.random(0,10) == 1) then
                world:gfx(8,Defender.Char.pos);
                PoisonStr = PoisonStr + ( 100 * Attacker.WeaponQualMod );
            end
        elseif (Attacker.WeaponItem.id == 2693) then -- magisches Serinjah-schwert
            if (math.random(0,6) == 1) then
                world:gfx(2,Defender.Char.pos);
                Globals.Damage = Globals.Damage + 200 * Attacker.WeaponQualMod;
                Defender.Char.movepoints = Defender.Char.movepoints - 15 * Attacker.WeaponQualMod;
            end
        elseif (Attacker.WeaponItem.id == 2704) then -- magisches Langschwert
            if (math.random(0,12) == 1) then
                world:gfx(32,Defender.Char.pos);
                world:gfx(5,Attacker.Char.pos);
                Globals.Damage = Globals.Damage + 500 * Attacker.WeaponQualMod;
                Attacker.Char:increaseAttrib("hitpoints",500 * Attacker.WeaponQualMod);
            end
        elseif (Attacker.WeaponItem.id == 2742) then -- roter Feuerdolch
            if ((Defender.Race~=22) and (Defender.Race~=33)) then
                if (math.random(0,8) == 1) then
                    world:gfx(9,Defender.Char.pos);
                    Globals.Damage = Globals.Damage + 200 * Attacker.WeaponQualMod;
                end
            end
        elseif content.fighting.IsMeriniumPlatedWeapon( Attacker.WeaponItem.id ) then
            Globals.Damage = Globals.Damage + 100 * Attacker.WeaponQualMod * content.fighting.GetWeaknessMerinium(Defender.Race);
        elseif content.fighting.IsCopperPlatedWeapon( Attacker.WeaponItem.id ) then
            Globals.Damage = Globals.Damage + 100 * Attacker.WeaponQualMod * content.fighting.GetWeaknessCopper(Defender.Race);
        elseif content.fighting.IsSilverPlatedWeapon( Attacker.WeaponItem.id ) then
            Globals.Damage = Globals.Damage + 100 * Attacker.WeaponQualMod * content.fighting.GetWeaknessSilver(Defender.Race);
        elseif content.fighting.IsGoldPlatedWeapon( Attacker.WeaponItem.id ) then
            Globals.Damage = Globals.Damage + 100 * Attacker.WeaponQualMod * content.fighting.GetWeaknessGold(Defender.Race);
        end
    end

    if not Attacker.noDodge then
        local PoisonTry = Attacker.poison * Attacker.HPMod * Globals.PositionMod * Attacker.AttackMod * Attacker.StiffnessMod;
        PoisonTry = PoisonTry * base.common.Scale( 0.6, 1.0, Attacker.skill );
        PoisonTry = PoisonTry * base.common.Scale( 0.3, 1.1, Attacker.tactics );
        PoisonTry = PoisonTry * base.common.Scale( 0.3, 1.1, ( Attacker.perception + Attacker.dexterity + Attacker.agility ) * 1.6 );
        PoisonTry = PoisonTry * Defender.StiffnessMod;

        local ChanceToPoison = base.common.Scale( 15, 65, PoisonTry );

        if( math.random( 100 ) < ChanceToPoison ) then
            if Attacker.isWeapon then
                PoisonStr = PoisonStr + Attacker.Weapon.PoisonStrength * Attacker.WeaponQualMod;
            end
            if (Attacker.AttackKind == 4 and Attacker.UsedHands == 2) then
                PoisonStr = PoisonStr + Attacker.SecWeapon.PoisonStrength * Attacker.SecWeaponQualMod;
            end
            PoisonStr = PoisonStr / 2;

            PoisonStr = base.common.Scale( 0, 1500, PoisonStr );

            if ( Attacker.natpoison > 0 ) then
                PoisonStr = PoisonStr + Attacker.natpoison * 50;
            end

            if ( PoisonStr > 0 ) then
                if (Defender.Char:getPoisonValue()<PoisonStr) then
                    Defender.Char:setPoisonValue(PoisonStr);
                end
                --Attacker.Char:learn(5,"poisoning",1,100);
				--Replace with new learn function, see learn.lua 
            end
        end
    end

    return Globals;
end

--[[
    Teach the attacker and the defender some skills

    @param  CharacterTable  Table of the Attacking Character
    @param  CharacterTable  Table of the Attacked Character
    @param  GlobalsTable    Table of the global values
]]
function Learning( Attacker, Defender, Globals )
    local big = 10;
    local small = 5;
    if ((Attacker.isWeapon and Attacker.Weapon.id == 445) and ((Defender.LeftisWeapon and Defender.LeftWeapon.id == 445) or (Defender.RightisWeapon and Defender.RightWeapon.id == 445))) then
        big = 20;
        small = 10;
    end
    --Attacker.Char:learn(5,Attacker.Skillname,2,math.min(100,Defender.parry+big));
	--Replace with new learn function, see learn.lua 
    --Defender.Char:learn(5,"parry",1,math.min(100,Attacker.skill+big));
	--Replace with new learn function, see learn.lua 

    if not Defender.noDodge then
        --Defender.Char:learn(5,"dodge",1,math.min(100,Attacker.skill+small));
		--Replace with new learn function, see learn.lua 
    end

    if (math.random(1,base.common.Scale(6,1,Globals.PositionMod/19)) == 1) then
        --Attacker.Char:learn(5,"tactics",2,math.min(100,Defender.parry+small));
		--Replace with new learn function, see learn.lua 
    end
    if (math.random(1,base.common.Scale(6,1,Globals.PositionMod/19)) == 1) then
        --Defender.Char:learn(5,"tactics",2,math.min(100,Attacker.skill+small));
		--Replace with new learn function, see learn.lua 
    end
end

--[[
    Deform some final checks on the damage that would be caused and send it to the character
    Also here the Coup de GrÃƒÂ¢ce is done

    @param  CharacterTable  Table of the Attacking Character
    @param  CharacterTable  Table of the Attacked Character
    @param  GlobalsTable    Table of the global values
]]
function CauseDamage( Attacker, Defender, Globals )
    local Hitpoints = Defender.Char:increaseAttrib("hitpoints",0);
    Globals.Damage = base.common.Limit( Globals.Damage, 80, 4999 );
    if (( Defender.Char:getType() == 0 ) and ( Hitpoints-1 <= Globals.Damage ) and ( Attacker.AttackKind ~= 4 ) and ( Hitpoints > 1 )) then
        -- Character would die. Nearly killing him and moving him back in case its possible
        Defender.Char:increaseAttrib("hitpoints",-Hitpoints+1);

        local CharOffsetX = Attacker.Char.pos.x - Defender.Char.pos.x;
        local CharOffsetY = Attacker.Char.pos.y - Defender.Char.pos.y;

        if ( CharOffsetY > 0 ) then
            CharOffsetY = ( Attacker.Weapon.Range - math.abs( CharOffsetX ) + 1 ) * ( -1 );
        elseif ( CharOffsetY < 0 ) then
            CharOffsetY = ( Attacker.Weapon.Range - math.abs( CharOffsetX ) + 1 );
        end

        if ( CharOffsetX > 0 ) then
            CharOffsetX = ( Attacker.Weapon.Range - math.abs( CharOffsetY ) + 1 ) * ( -1 );
        elseif ( CharOffsetX < 0 ) then
            CharOffsetX = ( Attacker.Weapon.Range - math.abs( CharOffsetY ) + 1 );
        end

        local newPos = position( Defender.Char.pos.x + CharOffsetX, Defender.Char.pos.y + CharOffsetY, Defender.Char.pos.z );
        Defender.Char:warp( newPos );

        Defender.Char:talkLanguage( Character.say, Player.german,  "#me stolpert zurück und geht zu Boden." );
        Defender.Char:talkLanguage( Character.say, Player.english, "#me stumbles back and falls to the ground." );

        base.common.ParalyseCharacter(Defender.Char, 7, false, true);

        local reg_found, reg_effect = Defender.Char.effects:find(2);
        if not reg_found then
            return true;
        end

        reg_effect:addValue( "no_reg", 20 );

        return true;
    else
	
        Defender.Char:increaseAttrib("hitpoints",-Globals.Damage);
		
        if ( Attacker.AttackKind == 4 ) then -- distanz angriff.
            Defender.Char.movepoints = Defender.Char.movepoints - 5;
            DropAmmo( Attacker, false, Defender.Char );
        end
    end
end

--[[
    Show final effects of the Attack, such as blood and the hitting sounds

    @param  CharacterTable  Table of the Attacking Character
    @param  CharacterTable  Table of the Attacked Character
    @param  GlobalsTable    Table of the global values
]]
function ShowEffects( Attacker, Defender, Globals )
    if (Globals.Damage>0) then
        world:gfx(13,Defender.Char.pos);
        if (Globals.criticalHit) then
            InformAboutCritical(Attacker.Char,Defender.Char,Globals.HittedArea);
            --[[ Wounds Script - Disabled for now
            if (Defender.Char:getType()~=1) and (math.random(8) == 1) then
                Defender.Char.effects:addEffect( LongTimeEffect( 21, 10 ) );
            end
            --]]
            DropBlood(position(Defender.Char.pos.x-1,Defender.Char.pos.y-1,Defender.Char.pos.z),3101);
            DropBlood(position(Defender.Char.pos.x,Defender.Char.pos.y-1,Defender.Char.pos.z),3101);
            DropBlood(position(Defender.Char.pos.x-1,Defender.Char.pos.y,Defender.Char.pos.z),3101);
            DropBlood(position(Defender.Char.pos.x,Defender.Char.pos.y,Defender.Char.pos.z),3101);
            DropBlood(position(Defender.Char.pos.x+1,Defender.Char.pos.y+1,Defender.Char.pos.z),3101);
            DropBlood(position(Defender.Char.pos.x,Defender.Char.pos.y+1,Defender.Char.pos.z),3101);
            DropBlood(position(Defender.Char.pos.x+1,Defender.Char.pos.y,Defender.Char.pos.z),3101);
            DropBlood(position(Defender.Char.pos.x+1,Defender.Char.pos.y-1,Defender.Char.pos.z),3101);
            DropBlood(position(Defender.Char.pos.x-1,Defender.Char.pos.y+1,Defender.Char.pos.z),3101);
            DropBlood(Defender.Char.pos,3101);
        elseif (Globals.Damage>2000) then
            DropBlood(Defender.Char.pos,3101);
        end
    end
    if (Attacker.AttackKind==0) then --wresting
        world:gfx(13,Defender.Char.pos);
        world:makeSound(3,Defender.Char.pos);
    elseif (Attacker.AttackKind==1) then --slashing
        world:gfx(13,Defender.Char.pos);
        world:makeSound(33,Defender.Char.pos);
    elseif (Attacker.AttackKind==2) then --concussion
        world:gfx(13,Defender.Char.pos);
        world:makeSound(32,Defender.Char.pos);
    elseif (Attacker.AttackKind==3) then --puncture
        world:gfx(13,Defender.Char.pos);
        world:makeSound(33,Defender.Char.pos);
    elseif (Attacker.AttackKind==4) then --distance
        world:gfx(13,Defender.Char.pos);
        world:makeSound(31,Defender.Char.pos);
    end
end

--[[
    Drop a Item on the ground, in case there is any item that is not unrotable

    @param  position    the position the item should be placed at
    @param  int the id of the item
]]
function DropBlood(Posi,ItemID)
    if world:isItemOnField(Posi) then
        if (world:getItemOnField(Posi).wear ~= 255) then
            return;
        end
    end
    Blood=world:createItemFromId(ItemID,1,Posi,true,333,0);
    Blood.wear=2;
    world:changeItem(Blood);
end

--[[
    Play the sound of a successful parry

    @param  CharacterTable  Table of the Attacking Character
    @param  CharacterTable  Table of the Attacked Character
]]
function PlayParrySound( Attacker, Defender )
    if not Attacker.isWeapon then
        world:makeSound(32,Attacker.Char.pos);
        return true;
    end

    if not Defender.RightisWeapon and not Defender.LeftisWeapon then
        world:makeSound(32,Attacker.Char.pos);
        return true;
    end

    local DefenderWeapon = 0;
    if Defender.RightisWeapon then
        DefenderWeapon = Defender.RightWeapon.WeaponType;
    else
        DefenderWeapon = Defender.LeftWeapon.WeaponType;
    end
    if (Sounds[DefenderWeapon] ~= nil) then
        if (Sounds[DefenderWeapon][Attacker.Weapon.WeaponType] ~= nil) then
            world:makeSound(Sounds[DefenderWeapon][Attacker.Weapon.WeaponType],Attacker.Char.pos);
            return true;
        end
    end
    world:makeSound(32,Attacker.Char.pos);
    return true;
end

--[[
    Output a information message were a critical hit hitted the character

    @param  CharacterTable  Table of the Attacking Character
    @param  CharacterTable  Table of the Attacked Character
    @param  int hitted area
]]
function InformAboutCritical(AttChar,DefChar,Area)
    if (Area == Character.head) then
        base.common.InformNLS(AttChar,"Du triffst deinen Gegner hart am Kopf.","You land a heavy strike against your enemies head.");
        base.common.InformNLS(DefChar,"Du wirst von deinem Gegner hart am Kopf getroffen.","You are struck by a heavy blow against your head.");
    elseif (Area == Character.breast) then
        base.common.InformNLS(AttChar,"Du triffst deinen Gegner hart gegen die Brust.","You land a heavy strike against your enemies chest.");
        base.common.InformNLS(DefChar,"Du wirst von deinem Gegner hart gegen die Brust getroffen.","You are struck heavily against your chest.");
    elseif (Area == Character.hands) then
        base.common.InformNLS(AttChar,"Du triffst deinen Gegner hart gegen die Brust.","You land a heavy strike against your enemies hands.");
        base.common.InformNLS(DefChar,"Du wirst von deinem Gegner hart gegen die Brust getroffen.","You are hit by a heavy blow upon your hands.");
    elseif (Area == Character.legs) then
        base.common.InformNLS(AttChar,"Du triffst deinen Gegner hart gegen die Beine.","You land a heavy strike against your enemies legs.");
        base.common.InformNLS(DefChar,"Du wirst von deinem Gegner hart gegen die Beine getroffen.","You are hit by a heavy blow upon your legs.");
    elseif (Area == Character.feet) then
        base.common.InformNLS(AttChar,"Du triffst deinen Gegner hart auf die Füße.","You strike the feet of your enemy with a heavy blow.");
        base.common.InformNLS(DefChar,"Du wirst von deinem Gegner hart gegen die Füße getroffen.","You are struck upon your feet with a heavy blow.");
    end
    return
end

--[[
    Checks of the attacker misses the target and if something else is hitted

    @param  CharacterTable  Table of the Attacking Character
    @param  CharacterTable  Table of the Attacked Character
    @return mixed CharacterTable of the updated Target or false if the attack should be canceled.
]]
function MissingTarget( Attacker, Defender )
    if ( Attacker.AttackKind ~= 4 ) then -- no distanz Attack --> do nothing
        return Defender;
    end

    local MissingTry = Attacker.skill * base.common.Scale( 1.5, 0.5, Attacker.Char:distanceMetric( Defender.Char ) * 12.5 );
    MissingTry = MissingTry * base.common.ScaleUnlimited( 0.7, 1.3, ( Attacker.dexterity + Attacker.perception ) * 2.5 );
    MissingTry = MissingTry * base.common.Scale( 0.5, 1.5, Attacker.Weapon.Accuracy * Attacker.WeaponQualMod );

    if ( math.random(100) < base.common.Scale( 50, 90, MissingTry ) ) then
        return Defender; -- no missing Attack, hit the target
    end

    local maxOffset = math.min( math.ceil( base.common.Scale( 3, 1, MissingTry ) ), Attacker.Char:distanceMetric( Defender.Char ) );

    local dropPos;
    local loop_protection = 20;
    repeat
        dropPos = position( Defender.Char.pos.x + math.random( -maxOffset, maxOffset ), Defender.Char.pos.y + math.random( -maxOffset, maxOffset ), Defender.Char.pos.z );
        loop_protection = loop_protection - 1;
    until( not ( Defender.Char.pos == dropPos ) and not ( Attacker.Char.pos == dropPos ) and base.common.IsLookingAt( Defender.Char, dropPos ) or loop_protection == 0 );

    if ( loop_protection == 0 ) then
        return false;
    end

    if world:isCharacterOnField( dropPos ) then
        Defender.Char = world:getCharacterOnField( dropPos );
        if ( Defender.Char:getType() == 2 ) then
            return false;
        end
        return Defender;
    end

    -- target missed and nothing else hit, just drop the arrow on the ground
    DropAmmo( Attacker, dropPos );

    return false
end

--[[
    Drops the used ammo in case there is any ammo

    @param  CharacterTable  Table of the Attacking Character
    [@param  PositionStruct  the position the ammo should be droped at]
    [@param  CharacterStruct the character the ammo should be droped at]
]]
function DropAmmo( Attacker, dropPos, dropChar )
    if not dropPos and not dropChar then
        return;
    end

    if ( Attacker.AttackKind ~= 4 ) then -- no distanz Attack --> do ammo
        return;
    end

    if (math.random(1,3) > 1 ) then
        local AmmoItem = false;
        if (Attacker.Weapon.AmmunitionType==Attacker.SecWeapon.WeaponType) then
            AmmoItem = Attacker.SecWeaponItem;
        elseif (Attacker.Weapon.AmmunitionType==255) then
            AmmoItem = Attacker.WeaponItem;
        end
        if not AmmoItem then
            return false;
        end

        if dropPos then
            if world:isItemOnField( dropPos ) then
                local oldItem = world:getItemOnField( dropPos );
                if ( oldItem.wear < 255 ) then
                    if ( oldItem.id == AmmoItem.id and oldItem.quality == AmmoItem.quality and oldItem.data == AmmoItem.data ) then
                        oldItem.number = oldItem.number + 1;
                        oldItem.wear = 5;
                        world:changeItem( oldItem );
                        return;
                    end
                else
                    return;
                end
            end
            world:createItemFromId( AmmoItem.id, 1, dropPos, true, AmmoItem.quality, AmmoItem.data );
        elseif ( dropChar:getType() == 1 ) then -- dropping ammo only into monsters
            dropChar:createItem( AmmoItem.id, 1, AmmoItem.quality, AmmoItem.data );
        end
    end
end

--[[
	if defender is tied up, he will be paralysed

	@param  CharacterStruct  the attacker
	@param  CharacterStruct  the defender
]]
function CheckTying( Attacker, Defender )

	if Attacker:getType() ~= 0 then
		return;
	end
	if Defender.effects:find(24) and not base.common.IsCharacterParalysed(Defender) then
		if math.random(10) > 1 then
			Defender:talkLanguage(Character.say, Player.german, "#me wird hart getroffen und verliert kurz das Bewusstsein.");
			Defender:talkLanguage(Character.say, Player.english, "#me is hit hard and loses consciousness shortly.");
			base.common.ParalyseCharacter(Defender, math.random(10,15), false, true);
		end
	elseif Defender.effects:find(26) then
		if Defender:increaseAttrib("hitpoints",0) < 2500 then
			Defender:talkLanguage(Character.say, Player.german, "#me kann das Seil nicht mehr halten und lässt los.");
			Defender:talkLanguage(Character.say, Player.english, "#me can't hold the rope any longer and looses it.");
			Defender.effects:removeEffect(26);
		end
	end
end


-- This variables are set as soon as the script is loaded
---[[DEBUG
storedText = ""; -- Stored Debug text
DebugLevel = 0;  -- Debug level (0 = no debug, 1 = show HP, 2 = normal debug, 3 = extensive debug )
--]]

-- Defence Shape, position around the nil stand for a possible attacker and the bonus on Attack that character gets due his position
-- Looking direction upwards
DefShape={};
DefShape[1]={110,100,110};
DefShape[2]={120,nil,120};
DefShape[3]={140,180,140};

-- Attack Shape, position around the nil stand for a possible attacked character and the malus the attacker gets due his looking direction
-- Looking direction upwards
AttShape={};
AttShape[1]={ 90,100, 90};
AttShape[2]={ 80,nil, 80};
AttShape[3]={ 60, 20, 60};

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

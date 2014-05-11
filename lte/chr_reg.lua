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
-- Long Time Effect Script - Character Regeneration
-- by Nitram

require("base.common")
require("base.factions")
module("lte.chr_reg", package.seeall)

crossPosition={};

--Where are the cross NPCS?

crossPosition[0]= position(690,324,0);       -- Wilderland
crossPosition[1]= position(102,562,0);       -- Cadomyr
crossPosition[2]= position(854,804,0);       -- Runewick
crossPosition[3]= position(345,266,0);       -- Galmair

TimeFactor = 1; -- Time between two effect calls in seconds. All effects scale with this number. Attention: If you change this number, also change it in server.standardfighting
EffectID = 2;

function addEffect( Effect, Character)

    -- It is needed to add at least value to make sure the effect does not get deleted right after the first call
    Effect:addValue("10",0);
	
end;

function callEffect( Effect, Char ) -- Effect called

if Char:idleTime() < 300 then -- Absolutely no regeneration effect if the player is afk for more than five minutes

    -----------------------READ VALUES------------------------------------
    local Hitpoints   = Char:increaseAttrib("hitpoints",0);   -- Hitpoints einlesen    ( 0 - 10000 )
    local Manapoints  = Char:increaseAttrib("mana",0);        -- Manapoints einlesen   ( 0 - 10000 )
    local Foodvalue   = Char:increaseAttrib("foodlevel",0);   -- Foodvalue einlesen    ( 0 - 60000 )
    local Poisonvalue = Char:getPoisonValue();                -- Poisonvalue einlesen  ( 0 - 10000 )

    local Const        = Char:increaseAttrib("constitution",0) -- Konstitution einlesen ( 0 - 20 )
    local Essence      = Char:increaseAttrib("essence",0)      -- Essenze einlesen      ( 0 - 20 )
	local Willpower    = Char:increaseAttrib("willpower",0)    -- Willenskraft einlesen ( 0 - 20 )
	local Intelligence = Char:increaseAttrib("intelligence",0) -- Itelligenz einlesen ( 0 - 20 )
    local Race         = Char:getRace()                       -- Rasse einlesen
    -----------------------VALUES DONE------------------------------------

    -----------------------PREPARE LIMITS-----------------------------
    local maxHitpoints = getLimit( Effect, "maxHP", 10000 );
    local maxManapoints = getLimit( Effect, "maxMP", 10000 );
    local maxFoodvalue = getLimit( Effect, "maxFP", 60000 );
    --------------------------LIMITS DONE-----------------------------

	--------------------------RESPAWN BEGIN-----------------------------
    if ( Hitpoints == 0 ) and not (Char:getType()==Character.monster) then -- Character is dead
	
        leadToCross( Char , Effect ); -- Warp char to cross

      return leaveSavely( Effect );
	  
    else
    
        local foundValue, cycleCounter = Effect:findValue( "cycleCounter" ); -- Is the cycleCounter still there? Can happen when somebody is revived by another method than the cross or runs to the cross himself
    
        if foundValue then
            Effect:removeValue("cycleCounter"); -- Getting rid of the old counter
        end

    end

	--------------------------RESPAWN DONE-----------------------------
		
    if no_regeneration( Effect ) then -- Regeneration prevented by LTE variable
        return leaveSavely( Effect );
    end
				
    -----------------------HITPOINTS BEGIN-----------------------------------
    if ( Hitpoints < maxHitpoints and Poisonvalue == 0 ) then -- HP not at maximum and not poisoned -> Regeneration
	
        if ( Foodvalue >= maxFoodvalue/12 ) and Char:getType()==Character.player then -- Quick regeneration, using foodpoints
		
			Hitpoints = math.min( maxHitpoints, Hitpoints + 10*TimeFactor + ( 70*TimeFactor * ( Const / 20 ) ) );  -- Full regeneration from 0-10000 in around four minutes at CON 10
            Foodvalue = Foodvalue - math.min(40*TimeFactor,(10000-Hitpoints) * ( 2*TimeFactor / Const ) );         -- A filled foodbar lasts 25 minutes of regeneration
			
        elseif (Foodvalue ~= 0) and Char:getType()==Character.player then  -- Slow regeneration for hungry characters
		
            Hitpoints = math.min( maxHitpoints, Hitpoints + 10 * TimeFactor );  -- Full regeneration from 0-10000 in around 17 minutes
			
		end
    end
	
    if ((Race ~= 10) and (Race ~= 11) and (Race ~= 20) and (Race ~= 26) and (Race ~= 29) and not Char:isAdmin()) and Char:getType()==Character.player then -- Admins and undeads don't get hungry
        
		if ( Foodvalue == 0 ) then -- Out of food - starvation!
		
            Hitpoints = math.max(0,Hitpoints - 20 * TimeFactor); -- Death by starvation in around eight minutes
			
            if ( Hitpoints > 0 ) then -- Losing HP, but still alive
			
                if ( math.random(1,20/TimeFactor) == 2 ) then -- Send the message once each 20 seconds
				
                    Char:talk(Character.say, "#me scheint Hunger zu haben, ein lautes Magenknurren ist zu vernehmen.", "#me 's stomach grumbles loudly.")
                    base.common.InformNLS(Char,
                        "Dein Magen schmerzt. Du bist am verhungern.",
                        "Your stomach hurts. You are going to die of hunger.");
					
                end
				
            else -- Deathy by starvation

                Char:talk(Character.say, "#me krampft zusammen und geht zu Boden.", "#me convulses and falls to the ground.")
                base.common.InformNLS(Char,
                    "Dein Magen verkrampft sich und du merkst nur noch wie dein Körper auf dem Boden aufschlägt, bevor alles um dich dunkel wird.",
                    "Your stomach cramps and the last thing you feel is  your body hitting the ground before everything goes dark.");
				
            end
			
        end
		
    end
	
    if ( Poisonvalue > 0 ) then -- Poisoned

        Poisonvalue = math.max( 0,Poisonvalue - 15 * TimeFactor ); -- 10000 poison takes around 11 minutes to vanish
		
        if ( Poisonvalue == 0 ) then -- Poison is gone
		
            base.common.InformNLS(Char,
                "Du fühlst wie das Gift in deinem Körper seine Wirkung verliert",
                "You feel the poison in your body losing its effect.");
			
        else
		
            Hitpoints = math.max( 0,Hitpoints - ( ( Poisonvalue * 0.07 ) * ( ( 30 - Const ) / 20 ) * TimeFactor ) ); --How much I love magic numbers... might need a rework ~Estralis
			
            if ( Hitpoints > 0 ) then -- Poisoned, but still alive
			
                if ( math.random(1,40/TimeFactor) == 2 or not Effect:findValue("poison") ) then -- Send the message once each 40 seconds
				
                    base.common.InformNLS(Char,
                        "Du fühlst wie dein Körper von innen heraus geschwächt wird.",
                        "You feel your body becoming weaker.");

                    Effect:addValue("poison",1);
					
                end
				
            else -- Death by poison
            
                Poisonvalue = 0; -- Remove the poison, mission accomplished
				
                Char:talk(Character.say, "#me tropft etwas Speichel aus dem Mund und bricht zusammen.", "#me starts to drool and falls to the ground.")
                base.common.InformNLS(Char,
                    "Du fühlst ein Brennen in deinem Körper und wie sich der Speicheln in deinem Mund zusammen zieht, ehe die Welt um dich herum dunkel wird.",
                    "You feel a burning sensation in your body and your mouth watering before everything goes dark.");
					
            end
			
        end
		
    elseif Effect:findValue("poison") then
	
        Effect:removeValue("poison");
		
    end
    -----------------------HITPOINTS DONE-----------------------------------

    -----------------------MANA BEGIN----------------------------------
	if ( ( ( Char:getMagicType( ) == 0 ) and ( Char:getMagicFlags( 0 ) > 0 ) ) or ( ( Char:getMagicType( ) == 0 ) and ( Char:getQuestProgress(37) ~= 0) ) ) and Char:getType()==Character.player then -- Character is a mage. Please rework this condition once we have a working magic system ~Estralis

		if ( Manapoints < maxManapoints ) then -- Mana not at maximum -> Regeneration

            if ( Foodvalue >= maxFoodvalue/12 ) then -- Schnelles HP regenerieren mit FP
			
                Manapoints = math.min( maxManapoints, Manapoints + ( ( 2*TimeFactor + 14*TimeFactor * ( Essence / 20 ) ) ) ); -- Full regeneration from 0-10000 in around 19 minutes at ESS 10. That is 1/5 of HP regeneration
                Foodvalue = Foodvalue - math.min(40*TimeFactor,(10000-Manapoints) * ( 2*TimeFactor / Essence ) ); -- A filled foodbar lasts 25 minutes of regeneration
				
            else -- Langsame Regeneration ohne FP
			
                Manapoints = math.min( maxManapoints, Manapoints + ( 2 * TimeFactor ) );  -- Full regeneration from 0-10000 in around 83 minutes
				
            end
			
        end
		
   else
   
      Manapoints = 0;
	  
   end

    -----------------------MANA DONE----------------------------------

    -----------------------FOODPOINTS ANFANG----------------------------------
    if ((Race ~= 10) and (Race ~= 11) and (Race ~= 20) and (Race ~= 26) and (Race ~= 29)) and Char:getType()==Character.player then -- Undeads won't get hungry
	
        if (Char:isAdmin() == false) then
		
            if ( Foodvalue > 0 ) then -- Consume food
			
                Foodvalue = math.max( 0, Foodvalue - 1 * TimeFactor ); -- -- A filled foodbar lasts 2.8 hours of idle time
				
                --------------- Warnings ---------------------------------
                if ( ( Foodvalue < 15000 ) and ( Foodvalue > 6000 ) ) then 
				
                    if ( math.random(1,1800/TimeFactor) == 2 ) then 
					
                        base.common.InformNLS(Char,
                        "Du fühlst ein leichtes Grummeln in deinem Magen.",
                        "You feel a slight grumble in your stomach.");
						
                    end
					
                elseif ( ( Foodvalue < 6000 ) and ( Foodvalue > 3000 ) ) then 
				
                    if ( math.random(1,900/TimeFactor) == 2 ) then
					
                        base.common.InformNLS(Char,
                        "Dein Magen knurrt leicht.",
                        "You hear your stomach grumbling.");
						
                    end
					
                elseif ( ( Foodvalue < 3000 ) and ( Foodvalue > 1000 ) ) then 
				
                    if ( math.random(1,600/TimeFactor) == 2 ) then 
                        Char:talk(Character.say, "#me scheint Hunger zu haben, ein leises Magenknurren ist zu vernehmen.", "#me 's stomach grumbles slightly.")
                    end
					
                elseif ( ( Foodvalue < 1000 ) and ( Foodvalue > 100 ) ) then 
				
                    if ( math.random(1,180/TimeFactor) == 2 ) then 
					
                        Char:talk(Character.say, "#me scheint Hunger zu haben, ein gut hörbares Magenknurren ist zu vernehmen.", "#me 's stomach grumbles quite audibly.")
						
                    end
					
                elseif ( Foodvalue < 100 ) then 
				
                    if ( math.random(1,10/TimeFactor) == 2 ) then 
					
                        Char:talk(Character.say, "#me scheint Hunger zu haben, ein lautes Magenknurren ist zu vernehmen.", "#me 's stomach grumbles loudly.")
						
                    end
					
                end
                --------------- Warnings done ---------------------------------
            end
			
        end
		
    end
	
    if ( Hitpoints == 0 ) then
	
        Foodvalue = math.max(Foodvalue,5000); -- Raising foodpoints to avoid reskill
		
    end
    -----------------------FOODPOINTS DONE----------------------------------

    -----------------------OVERLOAD BEGIN-----------------------------
    Hitpoints   = base.common.Limit( Hitpoints,   0, maxHitpoints  ); -- Lebenspunkte
    Manapoints  = base.common.Limit( Manapoints,  0, maxManapoints ); -- Manapunkte
    Poisonvalue = base.common.Limit( Poisonvalue, 0, 10000         ); -- Giftpunkte
    Foodvalue   = base.common.Limit( Foodvalue,   0, maxFoodvalue  ); -- Nahrungspunkte
    -----------------------OVERLOAD DONE-----------------------------

    --------------ÄNDERUNGEN PRÜFEN UND DURCHFÜHREN ANFANG--------------------
    if ( getWounds( Char, Effect ) == 0 ) then
	
        ChangeAttrib( Char, "hitpoints", Hitpoints );
		
    end
	
    ChangeAttrib( Char, "mana", Manapoints );
	
    if ( Char:getPoisonValue() ~= Poisonvalue ) then
	
        Char:setPoisonValue( Poisonvalue );
		
    end
	
    ChangeAttrib( Char, "foodlevel", Foodvalue );

    --------------ÄNDERUNGEN PRÜFEN UND DURCHFÜHREN FERTIG--------------------
	
end -- All above is only conducted for players that aren't afk for more than five minutes

    return leaveSavely( Effect );
	
end

function removeEffect( Effect, Character )

    local newEffect = LongTimeEffect(2,10*TimeFactor);
    local found = false;
    local value = 0;
    found, value = Effect:findValue( "no_reg" );
	
    if found then
	
        newEffect:addValue( "no_reg", value );
		
    end
	
    found, value = Effect:findValue( "maxHP" );
    if found then
        newEffect:addValue( "maxHP", value );
    end
	
    found, value = Effect:findValue( "maxFP" );
    if found then
        newEffect:addValue( "maxFP", value );
    end
	
    found, value = Effect:findValue( "maxMP" );
    if found then
        newEffect:addValue( "maxMP", value );
    end
	
    found, value = Effect:findValue( "poison" );
    if found then
        newEffect:addValue( "poison", value );
    end
	
    Character.effects:addEffect( newEffect );
end

function loadEffect(Effect, Character)

end

function getLimit( Effect, name, default )

    local foundValue, Value = Effect:findValue( name );
	
    if foundValue and Value > 0 and Value < default then
        return Value;
    else
        return default;
    end
	
end

function leadToCross( Char , Effect )

    local foundValue, cycleCounter = Effect:findValue( "cycleCounter" ); --Read the cycleCounter
    
    if not foundValue then
        Effect:addValue("cycleCounter",1); --Start counting
    end

    if cycleCounter>=(60/TimeFactor) then --One minute is over!
	
		world:gfx(31,Char.pos); --GFX, alternatively 16
        world:makeSound(13,Char.pos); --Healing sound
        factionValues=base.factions.getFaction(Char); --reading the faction values
        Char:warp(crossPosition[factionValues.tid]); --warp to home cross
        Effect:removeValue("cycleCounter"); --stop counting
		showRespawnDialog(Char)
		
    elseif cycleCounter<(60/TimeFactor) then

        Effect:addValue("cycleCounter",cycleCounter+1); --Counting
	
    end

end

function showRespawnDialog(rebornPlayer)

	local callback = function(nothing) end; --empty callback
		
	if rebornPlayer:getPlayerLanguage() == 0 then	
	
		dialog = MessageDialog("Wiederbelebung", "Der Eintritt in Chergas Reich der Toten wird dir verwehrt. Deine Taten auf Illarion sind noch nicht vorüber. Die Götter gewähren dir eine weitere Chance auf die Ebene der Lebenden zurückzukehren.", callback);
	
	else		
	
		dialog = MessageDialog("Respawn", "You are denied access to Cherga's Realm of the Dead. Your deeds on Illarion are not over. The gods grant you another chance to return to the Mortal Plane.", callback);
	end	
	
	rebornPlayer:requestMessageDialog(dialog); --showing the text
		
end


function leaveSavely( Effect )

   if ( Effect.numberCalled <= 254 ) then
   
        Effect.nextCalled = 10*TimeFactor;
		
        return true
		
    else
	
        return false
		
    end
	
end

function no_regeneration( Effect )

    local foundValue, Value = Effect:findValue( "no_reg" );
	
    if not foundValue then
        return false;
    end
    if ( Value == 0 ) then
        Effect:removeValue( "no_reg" );
    else
        Effect:addValue( "no_reg", Value - 1 );
    end
    return true;
end

function stallRegeneration(Char, Loops)
    local foundEffect, effect = Char.effects:find(EffectID);
    
    if not foundEffect then
        return;
    end;
    
    local foundValue, value = effect:findValue("no_reg");
    
    if foundValue and value >= Loops then
        return;
    end;

    effect:addValue("no_reg", Loops);
end;

function ChangeAttrib( Char, name, newVal )

    if ( Char:increaseAttrib(name,0) ~= newVal ) then
        Char:increaseAttrib(name,-(Char:increaseAttrib(name,0)-newVal));
    end
	
end

function getWounds( Char, Effect )

    local foundEffect, bleedingEffect = Char.effects:find( 21 );
	
    if not foundEffect then
        return 0;
    end

    foundWounds, Wounds = bleedingEffect:findValue( "wounds" );
	
    if not foundWounds then
        return 0;
    end
	
    return Wounds;
	
end

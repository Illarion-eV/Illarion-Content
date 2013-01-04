-- Long Time Effect Script - Character Regeneration
-- by Nitram

require("base.common")
require("base.factions")
module("lte.chr_reg", package.seeall)

crossPosition={};

--Where are the cross NPCS?

crossPosition[0]= position(685,335,0);       -- Wilderland
crossPosition[1]= position(102,562,0);       -- Cadomyr
crossPosition[2]= position(854,804,0);       -- Runewick
crossPosition[3]= position(345,266,0);       -- Galmair

EffectID = 2;

function addEffect( Effect, Character)
    -- it is needed to add at least value to make sure the effect does not get deleted right after
    -- the first call
    Effect:addValue("10",0);
end;

function callEffect( Effect, Char ) -- Effect wird ausgeführt

if Char:idleTime() < 300 then --absolutely no regeneration effect if the player is afk for more than five minutes

    -----------------------EINLESEN ANFANG------------------------------------
    local Hitpoints   = Char:increaseAttrib("hitpoints",0);   -- Hitpoints einlesen    ( 0 - 10000 )
    local Manapoints  = Char:increaseAttrib("mana",0);        -- Manapoints einlesen   ( 0 - 10000 )
    local Foodvalue   = Char:increaseAttrib("foodlevel",0);   -- Foodvalue einlesen    ( 0 - 60000 )
    local Poisonvalue = Char:getPoisonValue();                -- Poisonvalue einlesen  ( 0 - 10000 )

    local Const       = Char:increaseAttrib("constitution",0) -- Konstitution einlesen ( 0 - 20 )
    local Essence     = Char:increaseAttrib("essence",0)      -- Essenze einlesen      ( 0 - 20 )
    local Race        = Char:getRace()                       -- Rasse einlesen
    -----------------------EINLESEN FERTIG------------------------------------

    -----------------------GRENZWERTE VORBEREITEN-----------------------------
    local maxHitpoints = getLimit( Effect, "maxHP", 10000 );
    local maxManapoints = getLimit( Effect, "maxMP", 10000 );
    local maxFoodvalue = getLimit( Effect, "maxFP", 60000 );
    --------------------------GRENZWERTE FERTIG-------------------------------


    -----------------------POSITION DES CHARS ANZEIGEN------------------------
    if not ( math.mod( Effect.numberCalled, 10 ) == 0 ) and string.find( Char.lastSpokenText, "show position" ) then
        base.common.InformNLS( Char,
            "Deine aktuelle Position ist: "..Char.pos.x..", "..Char.pos.y..", "..Char.pos.z.."",
            "Your current position is: "..Char.pos.x..", "..Char.pos.y..", "..Char.pos.z.."" );
    end
    ------------------------POSITION ANZEIGEN FERTIG--------------------------

    if ( Hitpoints == 0 ) then -- Charakter ist tot
        leadToCross( Char , Effect ); -- Warp char to cross

      return leaveSavely( Effect );
    else
    
        local foundValue, cycleCounter = Effect:findValue( "cycleCounter" ); --Is the cycleCounter still there? Can happen when somebody is revived by another method than the cross or runs to the cross himself
    
        if foundValue then
            Effect:removeValue("cycleCounter"); --getting rid of the old counter
        end

    end

    if no_regeneration( Effect ) then -- Regeneration via LTE Variable unterbunden
        return leaveSavely( Effect );
    end

    -----------------------HITPOINTS ANFANG-----------------------------------
    if ( Hitpoints < maxHitpoints and Poisonvalue == 0 ) then -- HP nicht voll und nicht vergiftet - Regeneration
        if ( Foodvalue >= maxFoodvalue/12 ) then -- Schnelles HP regenerieren mit FP
            Hitpoints = math.min( maxHitpoints, Hitpoints + 50 + ( 350 * ( Const / 20 ) ) );  -- Lebenspunkte steigen bei Konst 10 in 3 Minuten und 42 Sekunden von 0 auf 10000
            Foodvalue = Foodvalue - math.min(200,(10000-Hitpoints) * ( 10 / Const ) );                     -- Nahrungspunkte fallen in 12 Minute und 30 Sekunden von 60000 auf 30000
        elseif (Foodvalue ~= 0) then  -- Langsame Regeneration ohne FP
            Hitpoints = math.min( maxHitpoints, Hitpoints + 10 * 5 );  -- Lebenspunkte steigen in 16 Minuten und 40 Sekunden von 0 auf 10000
        end
    end
    if ((Race ~= 10) and (Race ~= 11) and (Race ~= 20) and (Race ~= 26) and (Race ~= 29) and not Char:isAdmin()) then -- Wenn der Charakter nicht Untot und nicht GM - Hunger
        if ( Foodvalue == 0 ) then -- Keine Nahrung mehr - Verhungern
            Hitpoints = math.max(0,Hitpoints - 30 * 5); -- Lebenspunkte sinken in 5 Minuten und 33 Sekunden von 10000 auf 0
            if ( Hitpoints > 0 ) then -- HP Verlust aber kein Tod
                if ( math.random(1,20) == 2 ) then -- Meldung nicht immer ausgeben (Spamschutz) ( Meldung theoretisch alle 20 Sekunden )
                    -------------- Meldungen ausgeben ------------------
                    Char:talkLanguage( Character.say, Player.german,  "#me scheint Hunger zu haben, ein lautes Magenknurren ist zu vernehmen.");
                    Char:talkLanguage( Character.say, Player.english, "#me 's stomach grumbles loudly.");
                    base.common.InformNLS(Char,
                        "Dein Magen schmerzt. Du bist am verhungern",
                        "Your stomach hurts. You are going to die of hunger");
                    -------------- Meldungen fertig --------------------
                end
            else -- Tod durch Hunger

                -------------- Meldungen ausgeben ------------------
                Char:talkLanguage( Character.say, Player.german,  "#me krampft zusammen und geht zu Boden.");
                Char:talkLanguage( Character.say, Player.english, "#me convulses and falls to the ground.");
                base.common.InformNLS(Char,
                    "Dein Magen verkrampft sich und du merkst nur noch wie dein Körper auf dem Boden aufschlägt, bevor alles um dich dunkel wird.",
                    "Your stomach cramps and the last thing you feel is  your body hitting the ground before everything goes dark.");
                -------------- Meldungen fertig --------------------
            end
        end
    end
    if ( Poisonvalue > 0 ) then -- Vergiftet
        --Char:inform("poison: "..Poisonvalue);
        Poisonvalue = math.max( 0,Poisonvalue - 15 * 5 ); -- Giftwert fällt in 2 Stunden, 46 Minuten von 10000 auf 0
        if ( Poisonvalue == 0 ) then -- Gift besiegt
            -------------- Meldungen ausgeben ------------------
            base.common.InformNLS(Char,
                "Du fühlst wie das Gift in deinem Körper seine Wirkung verliert",
                "You feel the poison in your body losing its effect.");
            -------------- Meldungen fertig --------------------
        else
            Hitpoints = math.max( 0,Hitpoints - ( ( Poisonvalue * 0.07 ) * ( ( 30 - Const ) / 20 ) * 5 ) );
            if ( Hitpoints > 0 ) then -- Geschwächt durch Gift aber kein Tod
                if ( math.random(1,40) == 2 or not Effect:findValue("poison") ) then -- Meldung nicht immer ausgeben (Spamschutz) ( Meldung theoretisch alle 40 Sekunden )
                    -------------- Meldungen ausgeben ------------------
                    base.common.InformNLS(Char,
                        "Du fühlst wie dein Körper von innen heraus geschwächt wird.",
                        "You feel your body becoming weaker.");
                    -------------- Meldungen fertig --------------------
                    Effect:addValue("poison",1);
                end
            else -- Tod durch Gift
            
                Poisonvalue = 0; -- Char Tod, Gift verfliegt
                Char:talkLanguage( Character.say, Player.german,  "#me tropft etwas Speichel aus dem Mund und bricht zusammen.");
                Char:talkLanguage( Character.say, Player.english,  "#me starts to drool and falls to the ground.");
                base.common.InformNLS(Char,
                    "Du fühlst ein Brennen in deinem Körper und wie sich der Speicheln in deinem Mund zusammen zieht, ehe die Welt um dich herum dunkel wird.",
                    "You feel a burning sensation in your body and your mouth watering before everything goes dark.");
            end
        end
    elseif Effect:findValue("poison") then
        Effect:removeValue("poison");
    end
    -----------------------HITPOINTS FERTIG-----------------------------------

    -----------------------MANAPOINTS ANFANG----------------------------------
    if ( ( Char:getMagicType( ) == 0 ) and ( Char:getMagicFlags( 0 ) > 0 ) ) then -- Charakter ist Magier
        if ( Manapoints < maxManapoints ) then -- MP nicht voll - Regeneration

            local RegBoni = 100;
            local stoneLvl=0;
            local ItemL = Char:getItemAt( 5 );
            local ItemR = Char:getItemAt( 6 );
           local FoundItemL, WeaponL = world:getWeaponStruct( ItemL.id );
           local FoundItemR, WeaponR = world:getWeaponStruct( ItemR.id );
           local StoneItem = false;
           if FoundItemL and (WeaponL.WeaponType == 13) then
               StoneItem = ItemL;
           elseif FoundItemR and (WeaponR.WeaponType == 13) then
               StoneItem = ItemR;
           end
           if StoneItem then
               local stone1, str1, stone2, str2 = base.common.GetBonusFromTool( StoneItem );
            if stone1 == 7 then
               stoneLvl = stoneLvl + str1;
            end
            if stone2 == 7 then
               stoneLvl = stoneLvl + str2;
            end
            RegBoni = 100+stoneLvl * 20; -- 20% per level.
         end

            if ( Foodvalue >= maxFoodvalue/12 ) then -- Schnelles HP regenerieren mit FP
                Manapoints = math.min( maxManapoints, Manapoints + ( ( 50 + 350 * ( Essence / 20 ) ) * RegBoni)/100 ); -- Manapunkte regenerieren bei Ess 10 in 3 Minuten und 42 Sekunden von 0 auf 10000
                Foodvalue = Foodvalue - math.min(200,(10000-Manapoints) * ( 10 / Essence ) );                                           -- Nahrungspunkte fallen in 6 Minute und 15 Sekunden von 60000 auf 30000
            else -- Langsame Regeneration ohne FP
                Manapoints = math.min( maxManapoints, Manapoints + ( Essence * 5 ) + RegBoni );  -- Manapunkte steigen bei Ess 10 in 16 Minuten und 40 Sekunden von 0 auf 10000
            end
        end
   else
      Manapoints = 0;
   end

    found1, _ = Effect:findValue( "rapidMana" );
    found2, startingTime = Effect:findValue( "rapidManaTime" );

    if( ( found1 and not found2 ) or ( found2 and not found1 ) ) then
        if found1 then
            Effect:removeValue( "rapidMana" );
        else
            Effect:removeValue( "rapidManaTime" );
        end
    elseif( found1 and found2 ) then
        if( startingTime + 60 < base.common.GetCurrentTimestamp( ) ) then
            Effect:removeValue( "rapidMana" );
            Effect:removeValue( "rapidManaTime" );
        end
    end
    -----------------------MANAPOINTS FERTIG----------------------------------

    -----------------------FOODPOINTS ANFANG----------------------------------
    if ((Race ~= 10) and (Race ~= 11) and (Race ~= 20) and (Race ~= 26) and (Race ~= 29)) then -- Wenn der Charakter nicht Untot - Hunger
        if (Char:isAdmin() == false) then
            if ( Foodvalue > 0 ) then -- Nahrung vorhanden - Hunger verbrauch
                Foodvalue = math.max( 0, Foodvalue - 1 * 5 ); -- Nahrungspunkte fallen in 16 Stunden und 40 Minuten von 60000 auf 0;
                --------------- Warnmeldungen Anfang ---------------------------------
                if ( ( Foodvalue < 15000 ) and ( Foodvalue > 6000 ) ) then -- Noch 4 Stunden und 10 Minuten bis zum verhungern
                    if ( math.random(1,360) == 2 ) then -- Meldung nicht immer ausgeben (Spamschutz) ( Meldung theoretisch alle 30 Minuten )
                        base.common.InformNLS(Char,
                        "Du fühlst ein leichtes Grummeln in deinem Magen.",
                        "You feel a slight grumble in your stomach.");
                    end
                elseif ( ( Foodvalue < 6000 ) and ( Foodvalue > 3000 ) ) then -- Noch 1 Stunde und 40 Minuten bis zum verhungern
                    if ( math.random(1,180) == 2 ) then -- Meldung nicht immer ausgeben (Spamschutz) ( Meldung theoretisch alle 15 Minuten )
                        base.common.InformNLS(Char,
                        "Dein Magen knurrt leicht.",
                        "You hear your stomach grumbling.");
                    end
                elseif ( ( Foodvalue < 3000 ) and ( Foodvalue > 1000 ) ) then -- Noch 50 Minuten bis zum verhungern
                    if ( math.random(1,120) == 2 ) then -- Meldung nicht immer ausgeben (Spamschutz) ( Meldung theoretisch alle 10 Minuten )
                        Char:talkLanguage( Character.say, Player.german,  "#me scheint Hunger zu haben, ein leises Magenknurren ist zu vernehmen.");
                        Char:talkLanguage( Character.say, Player.english,  "#me 's stomach grumbles slightly.");
                    end
                elseif ( ( Foodvalue < 1000 ) and ( Foodvalue > 100 ) ) then -- Noch 16 Minuten bis zum verhungern
                    if ( math.random(1,36) == 2 ) then -- Meldung nicht immer ausgeben (Spamschutz) ( Meldung theoretisch alle 3 Minuten )
                        Char:talkLanguage( Character.say, Player.german,  "#me scheint Hunger zu haben, ein gut hörbares Magenknurren ist zu vernehmen.");
                        Char:talkLanguage( Character.say, Player.english,  "#me 's stomach grumbles quite audibly.");
                    end
                elseif ( Foodvalue < 100 ) then -- Noch 1 Minute 16 Sekunden bis zum verhungern
                    if ( math.random(1,2) == 2 ) then -- Meldung nicht immer ausgeben (Spamschutz) ( Meldung theoretisch alle 10 Sekunden )
                        Char:talkLanguage( Character.say, Player.german,  "#me scheint Hunger zu haben, ein lautes Magenknurren ist zu vernehmen.");
                        Char:talkLanguage( Character.say, Player.english,  "#me 's stomach grumbles loudly.");
                    end
                end
                --------------- Warnmeldungen Fertig ---------------------------------
            end
        end
    end
    if ( Hitpoints == 0 ) then
        Foodvalue = math.max(Foodvalue,5000); -- Foodpoints wieder hochsetzen um Reskill durch Hunger zu verhindern
    end
    -----------------------FOODPOINTS FERTIG----------------------------------

    -----------------------OVERLOAD SCHUTZ ANFANG-----------------------------
    Hitpoints   = base.common.Limit( Hitpoints,   0, maxHitpoints  ); -- Lebenspunkte
    Manapoints  = base.common.Limit( Manapoints,  0, maxManapoints ); -- Manapunkte
    Poisonvalue = base.common.Limit( Poisonvalue, 0, 10000         ); -- Giftpunkte
    Foodvalue   = base.common.Limit( Foodvalue,   0, maxFoodvalue  ); -- Nahrungspunkte
    -----------------------OVERLOAD SCHUTZ FERTIG-----------------------------

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
end --all above is only conducted for players that aren't afk for more than five minutes
    return leaveSavely( Effect );
end

function removeEffect( Effect, Character )
    local newEffect = LongTimeEffect(2,50);
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
    found, value = Effect:findValue( "rapidMana" );
    if found then
        newEffect:addValue( "rapidMana", value );
    end
    found, value = Effect:findValue( "rapidManaTime" );
    if found then
        newEffect:addValue( "rapidManaTime", value );
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

    if cycleCounter>=12 then --Time is over!

        base.common.InformNLS( Char,"[Wiederbelebung] Der Eintritt in Chergas Reich der Toten wird dir verwehrt. Deine Taten auf Illarion sind noch nicht vorüber. Die Götter gewähren dir eine weitere Chance auf die Ebene der Lebenden zurückzukehren.","[Respawn] You are denied access to Cherga's Realm of the Death. Your deeds on Illarion are not over. The gods grant you another chance to return to the Mortal Plane.");
        world:gfx(31,Char.pos); --GFX, alternatively 16
        world:makeSound(13,Char.pos); --Healing sound
        factionValues=base.factions.getFaction(Char); --reading the faction values
        Char:warp(crossPosition[factionValues.tid]); --warp to home cross
        Effect:removeValue("cycleCounter"); --stop counting

    elseif cycleCounter<12 then

        Effect:addValue("cycleCounter",cycleCounter+1); --Counting

    end

end


function leaveSavely( Effect )
   if ( Effect.numberCalled <= 254 ) then
        Effect.nextCalled = 50;
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

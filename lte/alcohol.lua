module("lte.alcohol", package.seeall)
-- Long Time Effect Script - Alcohol

-- Abhandlung aller Effekte auf den Character durch Alkohol

function addEffect( Effect, Character) -- Initiallisierungs Funktion
    -- nichts
    Character:inform("AddEffect ausgeführt");
end

function callEffect( Effect, Character) -- Initiallisierungs Script
    Character:inform("call Effect!");
    found,value = Effect:findValue("alcohol");
    Character:inform("alcohol gelesen!");
    found2,value2 = Effect:findValue("hangover");
    Character:inform("hangover gelesen!");
    found3,value3 = Effect:findValue("AlcEffect");
    Character:inform("Werte eingelesen");
    if not found and not found2 then -- Fehler aufgetreten. Script wird abgebrochen
        Character:inform("Fehler aufgetreten. Script abbruch");
        return false
    elseif found2 and not found then -- Keine Direkten Alkohol Effekte mehr. Warten auf nächsten Login
        Character:inform("Keine direkten Alkohol folgen mehr");
        if (value2 == 2) then
            User:inform(Informing(Character,"Deine Kopfschmerzen lassen langsam nach.","Your headache slowly eases."));
            return false
        else
            Effect.nextCalled = 1000000;
            return true
        end
    end
    if ( Character:getRace()==1 ) then -- Zwerg mit Boni aufs betrinken
        RaceBon = 60;
        Character:inform("Zwergenboni");
    end
    if (value == 0) then -- keine Alkohol Wirkung mehr - Auf nächsten Login für Kater Effekt warten
        Character:inform("Alkwirkungen zurück setzen");
        Effect:addValue("hangover",1);
        Effect.nextCalled = 1000000;
        Character:increaseAttrib("dexterity",5);
        Character:increaseAttrib("stregth",-5);
        Character:increaseAttrib("intelligence",5);
        Character:increaseAttrib("perception",5);
        if found3 then
            Effect:removeValue("AlcEffect");
        end
        if found then
            Effect:removeValue("alcohol");
        end
        User:inform(Informing(Character,"Du merkst das der Alkohol aufhört zu wirken.","You don't feel the affects of the alcohol anymore."));
        Character:inform("Zurück gesetzt");
        return true
    end
    if (found3 and (value >= Character:increaseAttrib("constitution",0)*24 + RaceBon)) then -- Alkohol Effekt tritt ein
        Character:inform("Alkohol wirkung tritt ein");
        Character:increaseAttrib("dexterity",-5);
        Character:increaseAttrib("stregth",5);
        Character:increaseAttrib("intelligence",-5);
        Character:increaseAttrib("perception",-5);
        Effect:addValue("AlcEffect",1);
        Effect:addValue("time",(world:getTime("day")*24)+world:getTime("hour"));
        Character:inform("auswirkungen ausgeführt");
        User:inform(Informing(Character,"Du merkst wie der Alkohol seine Wirkung entfaltet.","You feel how the alcohol starts to affect you."));
        Character:talkLanguage( Character.say, Player.german, "#me 's Nase bekommt eine leicht rötliche Färbung.");
        Character:talkLanguage( Character.say, Player.english, "#me 's cheeks start to turn flush.");
    end
    if found3 then
        EffectValue = value - ( Character:increaseAttrib("constitution",0)*24 ) - RaceBon;
        if ( EffectValue > 400 ) then -- voll besoffen
            oldpos = Character.pos;
            Character:move(math.random(0,3)*2, true);
            if oldpos == Character.pos then -- Step wurde nicht ausgeführt
                Effect:addValue("alcohol",math.max(0,value - Character:increaseAttrib("constitution",0))); -- Alkohol langsam abbauen
                Effect.nextCalled = 40; -- Gleich nochmal versuchen
            else -- Schritt wurde gemacht
                Character:talkLanguage( Character.say, Player.german, "#me stolpert.");
                Character:talkLanguage( Character.say, Player.english, "#me teeters slightly.");
                Effect:addValue("alcohol",math.max(0,value - Character:increaseAttrib("constitution",0)*10)); -- Alkohol abbauen
                Effect.nextCalled = 400; -- Warten wir erstmal wieder etwas
            end
        elseif ( EffectValue > 150 ) then
            Character:talkLanguage( Character.say, Player.german, "#me hickst.");
            Character:talkLanguage( Character.say, Player.english, "#me hiccups.");
            Effect:addValue("alcohol",math.max(0,value - Character:increaseAttrib("constitution",0)*10)); -- Alkohol abbauen
            Effect.nextCalled = 400; -- Warten wir erstmal wieder etwas
        end
    else
        Effect:addValue("alcohol",math.max(0,value - Character:increaseAttrib("constitution",0)*8)); -- Alkohol abbauen
        Effect.nextCalled = 400;
    end
end

function loadEffect(Effect, Character)
    found4,value4 = Effect:findValue("time");
    if found4 then
        if ((value4) < (((world:getTime("day")*24)+world:getTime("hour"))-16)) then
            if ((value4) < (((world:getTime("day")*24)+world:getTime("hour"))-80)) then
                Character.effects:removeEffect(1); -- Alkohol verflogen
            else
                Effect:addValue("hangover",1);
                Effect:removeValue("AlcEffect");
                Effect:removeValue("alcohol");
            end
        end
    end
    found2,value2 = Effect:findValue("hangover");
    found,value = Effect:findValue("alcohol");    
    found3,value3 = Effect:findValue("AlcEffect");
    if found2 then
        Character:inform(Informing(Character,"Dein Kopf dröhnt, er fühlt sich doppelt so schwer an wie üblich.","Your head hurts and feels like it weighs twice as much."));
        Effect.nextCalled = 1200;
        Effect:addValue("hangover",2);
        return true
    end
    if found3 then -- Alkohol wirkt, wiederher stellen
        Character:increaseAttrib("dexterity",-5);
        Character:increaseAttrib("stregth",5);
        Character:increaseAttrib("intelligence",-5);
        Character:increaseAttrib("perception",-5);
        Effect:addValue("alcohol",math.max(0,value - Character:increaseAttrib("constitution",0)*8)); -- Alkohol abbauen
        Character:inform(Informing(Character,"Der Alkohol scheint dich noch immer zu beeinflussen.","The alcohol still seems to affect you."));
    end
end

function Informing(User,gText,eText)
    if (User:getPlayerLanguage()==0) then
        return gText
    else
        return eText
    end
end
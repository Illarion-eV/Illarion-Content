require("base.common")
module("lte.perc_boost", package.seeall)


-- Character bekommt einen Perception-boost, der erst ansteigt und dann sinkt --

function addEffect(addPerc, User)           -- Wird nur beim Start des Effektes aufgerufen (-> Perc+1)
    base.common.InformNLS(User, "Deine Sinne werden merkbar sensibler.", "Your senses grow noticably.");
    User:increaseAttrib("perception",1);    -- Perception+1 (erste Steigerung)
end


-- Wird regelmaessig aufgerufen (das erste mal nach einer Minute)

function callEffect(percBoost, User)                    -- Effect wird ausgeführt
    percBoost.nextCalled = 60;                         -- Erneut in einer Minute aufrufen
    found,addPerc = percBoost:findValue("addPerc");    -- Wieviel wurde bisher "geboostet"?
    if found then                                       -- sicherheitshalber: wenn ueberhaupt geboostet wurde
        if percBoost.numberCalled<6 then                -- wenn bisher weniger als 6 mal aufgerufen wurde
            User:increaseAttrib("perception",1);        -- Perception um 1 steigern
            percBoost:addValue("addPerc",addPerc+1);   -- Buchhaltung: Um eins hinaufzaehlen
            return true;                                -- "true" zurueckliefern (=noch einmal aufrufen)
        else                                            -- wenn schon oefter als 5 mal aufgerufen wurde
            User:increaseAttrib("perception",-1);       -- Perception um 1 verringern
            percBoost:addValue("addPerc",addPerc-1);   -- Buchhaltung: um 1 runter zaehlen
            if addPerc==1 then                          -- wir sind am Ende angekommen: Effekt aufheben.
                return false;                           -- "false" zurueckgeben: Effekt wird aufgehoben.
            end
            return true;                                -- "true" -> wird wieder aufgerufen
        end
    else
        return false;                                   -- Nicht mehr aufrufen
    end
end

function removeEffect( Effect, Character )
    -- do nothing
end

function loadEffect(Effect, Character)                  -- wenn der Charakter einloggt...
    found,addPerc = coldEffect:findValue("addPerc");
    if found then
        User:increaseAttrib("perception",addPerc);      -- Buchhaltung: Auslesen der aktuellen "steigerung" und steigern
        percBoost.nextCalled = 600;                     -- in einer Minute wieder aufrufen
    end
end

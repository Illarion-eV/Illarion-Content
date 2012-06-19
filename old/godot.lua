module("lte.godot", package.seeall)
-- LTE Warten auf Godot
-- by Falk

-- ein LTE, der lediglich die Zeit vergehen lässt


function addEffect(eineZaehlVar, User) -- Wird nur beim Start des Effektes aufgerufen (-> Perc+1)
   User:inform("Aufwärmphase") 
end

function callEffect(wartezeit,User)                            -- Effect wird ausgeführt
   intervall = 60   -- Wiederholung alle intervall/10 sec.
      runden = 9    -- Anzahl Wiederholungen
                    -- => intervall x runden = Dauer
    wartezeit.nextCalled = intervall                           -- Erneut in einer Minute aufrufen
    found,eineZaehlVar = wartezeit:findValue("eineZaehlVar");  -- Wieviel wurde bisher "geboostet"?
    if found then                                              -- sicherheitshalber: wenn ueberhaupt geboostet wurde
        if wartezeit.numberCalled < runden then                -- wenn bisher weniger als 6 mal aufgerufen wurde
            wartezeit:addValue("eineZaehlVar",eineZaehlVar+1); -- Buchhaltung: Um eins hinaufzaehlen
            User:inform("Runde "..eineZaehlVar)
            return true;                                       -- "true" zurueckliefern (=noch einmal aufrufen)
        else                                                   -- wenn schon oefter als 5 mal aufgerufen wurde
            User:inform("Die Zeit ist um")                     -- wir sind am Ende angekommen: Effekt aufheben.
            return false;                                      -- "false" zurueckgeben: Effekt wird aufgehoben.
        end
    else
        User:inform("Vorzeitiges Ende") 
        return false;                                          -- Nicht mehr aufrufen
    end
end

function removeEffect(wartezeit,User)
   User:inform("Alles aufgeräumt")
   -- do nothing
end

function loadEffect(wartezeit,User)                  -- wenn der Charakter einloggt...
    User:inform("Welcome back to the show")
    found,eineZaehlVar = coldEffect:findValue("eineZaehlVar");
    if found then
        eineZaehlVar = eineZaehlVar +1            -- Zähler um 1 steigern
        wartezeit:addValue("eineZaehlVar",eineZaehlVar+1);        
        wartezeit.nextCalled = intervall          -- in einer Minute wieder aufrufen
    end
end

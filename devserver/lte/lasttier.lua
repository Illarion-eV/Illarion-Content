module("lte.lasttier", package.seeall)
-- Langzeit Effekt für Lasttier

-- Aufgabe: Speichern und Übergeben des Lasttierbesitzers

function addEffect(Effect, Carrier)
    return true;
end

function callEffect(Effect, Carrier)
    Effect.nextCalled = 360000;
    return true;
end

function removeEffect(Effect, Carrier)
    return true;
end

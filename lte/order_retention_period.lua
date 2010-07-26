require("base.orders")

module("lte.order_retention_period", package.seeall)

--[[
    Sperrfristeffekt: Falls ein Char zu viele offene Auftrï¿½ge hat ohne diese zu erfï¿½llen
    wird eine Sperrfrist angelegt. Innerhalb dieser Zeit kann der Char
    keine neuen Auftrï¿½ge annehmen
    ]]--



function callEffect(eff, User)
   --nach dem ersten Aufruf entfernen
   return false;
end

function addEffect (eff, User)
    --eff.nextCalled = OrderRetentationPeriod * 600;
end

function removeEffect (eff,User)
    --beim entfernen die Vertrauenswï¿½rdigkeit erhï¿½hen aber wert für gute Auftrï¿½ge senken
    base.orders.setThrustWorthyness(User,
        base.orders.ThrustworthynessChangeAfterRetentionPeriod,
        base.orders.GoodOrderChangeAfterRetentionPeriod);
end

function loadEffect (eff, User)
end


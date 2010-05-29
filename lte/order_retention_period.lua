require("base.orders")

module("lte.order_retention_period", package.seeall)

--[[
    Sperrfristeffekt: Falls ein Char zu viele offene Auftr�ge hat ohne diese zu erf�llen
    wird eine Sperrfrist angelegt. Innerhalb dieser Zeit kann der Char
    keine neuen Auftr�ge annehmen
    ]]--



function callEffect(eff, User)
   --nach dem ersten Aufruf entfernen
   return false;
end

function addEffect (eff, User)
    --eff.nextCalled = OrderRetentationPeriod * 600;
end

function removeEffect (eff,User)
    --beim entfernen die Vertrauensw�rdigkeit erh�hen aber wert f�r gute Auftr�ge senken
    base.orders.setThrustWorthyness(User,
        base.orders.ThrustworthynessChangeAfterRetentionPeriod,
        base.orders.GoodOrderChangeAfterRetentionPeriod);
end

function loadEffect (eff, User)
end


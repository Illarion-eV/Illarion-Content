module("lte.base_raid", package.seeall)
--[[ 
    Basis RAID effekt der die Konsequenzen durch den tod 
    ausschlaltet/einschaltet und dem spieler nach beendigung wieder
    zum ausgangsort teleportiert
    ]]--
    
function callEffect(eff, User)
    --erst wenn der Start Wert auf true gesetzt wurde die Todes consequenzen auf false setzen
   if (eff:findValue("start")) then
        User.death_consequences = false;
        --lange Wartezeit bis zum nächsen Aufrufen
        eff.nextCalled = 2000000000;
    else
        --in 1 Sekunde erneut nachschauen ob der Raid gestartet ist.
        eff.nextCalled = 10;
    end
    return true;
end

function addEffect (eff, User)
    --beim hinzufügen die alte Position speichern
    eff:addValue("old-pos-x",User.pos.x);
    eff:addValue("old-pos-y",User.pos.y);
    eff:addValue("old-pos-z",User.pos.z);
    --zur Raid positions warpen
    local found1,nposx = eff:findValue("new-pos-x");
    local found2,nposy = eff:findValue("new-pos-y");
    local found3,nposz = eff:findValue("new-pos-z");
    if (found1 and found2 and found3) then
        User:warp(nposx,nposy,nposz);
    end
end

function removeEffect (eff,User)
    --beim entfernen den User zurück warpen
    local found1,oposx = eff:findValue("old-pos-x");
    local found2,oposy = eff:findValue("old-pos-y");
    local found3,oposz = eff:findValue("old-pos-z");
    if (found1 and found2 and found3) then
        User:warp(oposx,oposy,oposz);
    end
    --Todes Konsequenzen wieder anschalten
    User.death_consequences = true;
end

function loadEffect (eff, User)
    --beim neuladen den Effekt löschen.
    User.effects:removeEffect(eff);
end

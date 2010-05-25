function checkPre(itn) -- checkt, ob die Voraussetzungen erfuellt werden
    checkVal=true;

    for i=1,table.getn(needTool[itn]) do                                                    -- Alle gebrauchten Werkzeuge durchgehen
        if (User:countItemAt(needToolAt[itn][i],needTool[itn][i])<1) then checkVal=false end
    end                                                                                     -- Wenn Werkzeug an gewuenster Stelle nicht da
    if (checkVal==true) then                                                                -- Wenn alle Werkzeuge da waren
        for i=1,table.getn(needResource[itn]) do                                            -- Alle Resourcen durchgehen
            if (User:countItemAt(needResourceAt[itn][i],needResource[itn][i])<needResourceAmt[itn][i]) then
                checkVal=false;                                                             -- Wenn Resource an gefragter Stelle nicht in gefragter Menge da ist
            end
        end
        if (checkVal==false) then User:inform("You do not have the resources ready!") end      -- User darueber informieren.
    else
        User:inform("You do not have the needed tools ready!");
    end
    return checkVal;
end

function checkSuccess()     -- Erfolgscheck
    if (2*math.random(needSkill[itn])<math.random(UserSkill+2*UserAttrib)) then              -- Sollte noch etwas veraendert werden
        return true
    else
        User:inform("You failed making that item.");
        return false
    end
end

function UseItem(User,SourceItem,TargetItem,Counter,Param)
    if (Param==0) then

        success=false;

        LeadAttrib="";                                                              -- Hauptattribut
        LeadSkill="";                                                               -- Hauptskill

        UserSkill=User:getSkill(LeadSkill);
        UserAttrib=User:increaseAttrib(LeadAttrib,0);
        -- Initialisieren der Listen
        itemToProduce={};
        needTool={};
        needToolAt={};
        needItemAmt={};
        needResource={};
        needResourceAt={};
        needResourceAmt={};
        gfxEffect={};
        sndEffect={};
        needSkill={};                                                               -- Ende der Listeninitialisierung

        itemToProduce[1]=17;                                                        -- Dieses Item wird produziert
        needTool[1]  ={23    , 57    , 78};                                         -- Diese Werkzeuge braucht man
        needToolAt[1]={"body", "body", "belt"};                                     -- Hier muessen sie sein
        needResource[1]    ={14        , 90        , 110};                          -- Diese Rohstoffe braucht man
        needResourceAt[1]  ={"backpack", "backpack", "backpack"};                   -- Hier muessen sie sein
        needResourceAmt[1] ={2         , 2         , 2};                            -- In dieser Menge
        gfxEffect[1]=1;                                                             -- Graphik- und Soundeffekte
        sndEffect[1]=1;
        needSkill[1]=40;                                                            -- Hoehe des benoetigten Skills

        ItemMenu=MenuStruct();                                                      -- Initialisieren des Menus

        for itn=1,table.getn(itemToProduce) do                                      -- Alle items durchlaufen
            if (needSkill[itn]<=UserSkill) then                                     -- Wenn der User den Skill fuer das Item hat
                ItemMenu:addItem(itemToProduce[itn]);                               -- Item in das Menu aufnehmen
            end
        end
    else            -- es wurdes aus dem Menu gewaehlt
        for itn=1,table.getn(itemToProduce) do                                      -- Nachschauen, welches Item das denn war
            if (Param==itemToProduce[itn]) then                                     -- Das hier wars!
                if (checkPre(itn)==true) then                                       -- Wenn er alle Voraussetzungen erfuellt
                    if (checkSuccess()==true) then                                  -- Wenn erfolgreich
                        User:createItem(Param,1,333,0);                                   -- Item herstellen
                        for j=1,table.getn(needResource[itn]) do                    -- Verbrauchte Resourcen loeschen
                            User:eraseItem(needResource[itn][j],needResourceAmt[itn][j]);
                        end
                    end
                    -- tools abnuetzen!
                end  -- Voraussetzungen?
            end  -- Ist das das Item?
        end  -- Loop der Items
    end  -- Param
end  -- 


--1. Hat User alles was er braucht in der richtigen Anordnung
--2. Stimmt seine Position
--
--3. Aufruf des Angebots (was kann ich machen) in Abhängigkeit vom Skill
--
--4. Erfolgsprüfung in Abhängigkeit Leitattribut / Skill
--
--5. Qualitäts feststellung anhand Skill
--
--6. Verbrauch und Verschleiß
--
--7. Lerneffekte
--
--8. Sonstige Effekte
--
--8. Visualisierung
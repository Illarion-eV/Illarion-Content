-- Wegweiser Template
function fillTools()        -- DIESE TOOLS WERDEN FUER ALLE ITEMS GEBRAUCHT!
        needTool  ={1     , 9    };                         -- Diese Werkzeuge braucht man (EDITABLE)
        needToolAt={"body", "body"};                        -- Hier muessen sie sein ("all", "belt", "body", "backpack")
end

function Initialize()
    LeadAttrib="constitution";          -- Hauptattribut
    LeadSkill="common language";         -- Hauptskill
    LeadSkillGroup=1;                   -- Skillgruppe
end

                            -- DIE LISTE DER ERZEUGBAREN ITEMS!
function fillLists()
    itemToProduce[1]=18;                                -- Dieses Item wird produziert
    needResource[1]    ={3076        , 15        };       -- Diese Rohstoffe braucht man
    needResourceAt[1]  ={"backpack", "backpack"};       -- Hier muessen sie sein
    needResourceAmt[1] ={4         , 1         };       -- In dieser Menge
    needTargetIt[1]=172;                                -- Target Item vor einem (0 fuer egal)
    gfxEffect[1]=1;                                     -- Graphik- und Soundeffekte
    sndEffect[1]=1;
    needSkill[1]=10;                                    -- Hoehe des benoetigten Skills
    bannList[1]  ={2    ,5};                            -- Diese Items darf man nicht bei sich haben
    bannListAt[1]={"body","body"};                      -- Und zwar an diesen Stellen
    raceMalus[1]={0,0,0,0,0,0};                         -- Rassen-Mali auf die Schwierigkeiten
                -- human dwarf halfling elf orc liz

    itemToProduce[2]=19;                                -- Dieses Item wird produziert
    needResource[2]    ={3076        , 15        };       -- Diese Rohstoffe braucht man
    needResourceAt[2]  ={"backpack", "backpack"};       -- Hier muessen sie sein
    needResourceAmt[2] ={4         , 1         };       -- In dieser Menge
    needTargetIt[2]=0;                                  -- Target Item vor einem (0 fuer egal)
    gfxEffect[2]=1;                                     -- Graphik- und Soundeffekte
    sndEffect[2]=1;
    needSkill[2]=5;                                     -- Hoehe des benoetigten Skills
    bannList[2]  ={2    ,5};                            -- Diese Items darf man nicht bei sich haben
    bannListAt[2]={"body","body"};                      -- Und zwar an diesen Stellen
    raceMalus[2]={0,0,0,0,0,0};                         -- Rassen-Mali auf die Schwierigkeiten

end

function checkTools(Char,nTool,nToolAt)   -- checkt, ob die Werkzeuge da sind (working)
    checkVal=true;
    for i,nTl in pairs(nTool) do
    --for i=1,table.getn(nTool) do                            -- Alle gebrauchten Werkzeuge durchgehen
        if (Char:countItemAt(nToolAt[i],nTool[i])<1) then   -- Wenn ein benoetigtes Werkzeug nicht da ist
            checkVal=false;
        end     -- Wenn eins nicht da ist -> false
    end
    return checkVal;
end


function checkPre(Char,itn,nResource,nResourceAt,nResourceAmt) -- checkt, ob die Resourcen da sind
    checkVal=true;
    for i,nRes in pairs(nResource[itn]) do
    --for i=1,table.getn(nResource[itn]) do                   -- Alle Resourcen durchgehen
        if (Char:countItemAt(nResourceAt[itn][i],nResource[itn][i])<nResourceAmt[itn][i]) then
            checkVal=false;                                 -- Wenn Resource an gefragter Stelle nicht in gefragter Menge da ist
        end
    end
    if (checkVal==false) then Char:inform("You do not have the resources ready!") end   -- User darueber informieren.
    return checkVal;
end


function checkSuccess(Char,itn,nSkill,USkill,UAttrib,rMalus)     -- Erfolgscheck (Charakter, listenNummer,schwierigkeit,Skill,Attribut
    --Char:inform(" int checkSuu");
    malNumber=Char:get_race();
    if malNumber>5 then malNumber=0 end
    malus=rMalus[itn][malNumber+1]
    if (2*math.random(nSkill[itn])<math.random(USkill+2*UAttrib)) then              -- Sollte noch etwas veraendert werden
        --Char:inform("Passt!");
        return true;
    else
        Char:inform("You failed making that item.");
        return false
    end
end

function base.common.NormalRnd(min,max)
    base=0;
    for t=1,10 do
        base=base+math.random(max-min+1)-1;     -- creates ~normal distri from 0 to (max-min)*10 with mu=(max-min)*10/2
    end
    base=math.ceil(base/10);                -- scale to 0-(max-min)
    base=base+min;                          -- shift to min -> min to max
    return base;
end


function detQuality(Char,USkill,UAttrib,difficulty)
    --Char:inform("Drin!");
    USkill=USkill-math.floor(difficulty/2);
    qual=base.common.NormalRnd(math.floor(USkill/10)-10,math.floor(USkill/10)+10);
    if qual<1 then qual=1 end
    if qual>10 then qual=10 end
    qual=qual-1;
    qual=qual*100;
    --Char:inform("quality ".. qual);

    dura=base.common.NormalRnd(UAttrib*5-100,UAttrib*5+100);    -- fuer att=0: [-100,+100], fuer att=20: [0,200]
    if dura<0 then dura=0 end
    if dura>100 then dura=100 end
    dura=dura-1;
    retVal=qual+dura;
    return retVal;
end

function checkBann(Char,it,bList,bListAt)
    checkBan=true;
    --Char:inform("in checkban");
    for i,bLst in pairs(bList[it]) do
    --for i=1,table.getn(bList[it]) do                            -- Alle gebannten Items durchgehen
        --Char:inform("i="..i.."list="..bList[it][i].." at "..bListAt[it][i]);
        if (Char:countItemAt(bListAt[it][i],bList[it][i])>0) then
            checkBan=false;                                     -- Wenn item an gefragter Stelle da ist
        end
        --Char:inform("ii="..i);
    end
    --Char:inform("ende checkban");
    if (checkBan==false) then Char:inform("You are not able to create that!") end   -- User darueber informieren.
    return checkBan;
end

function checkTargetDir(Char,TItem) -- checkt, ob target, wenn vorhanden, vor dem char steht
    retVal=true;
    if TItem.id~=0 then
        direct=Char:get_face_to();
        posX=Char.pos.x;
        posY=Char.pos.y;
        posZ=Char.pos.z;
        if direct==0 then posY=posY-1 end --N
        if direct==4 then posY=posY+1 end --S
        if direct==2 then posX=posX+1 end --O
        if direct==6 then posX=posX-1 end --W
        if (equapos(position(posX,posY,posZ),TItem.pos)==true) then
            retVal=true;
        else
            Char:inform("You cannot work behind your back!");
            retVal=false;
        end
    end
    return retVal;
end



--function skillBonus(rac)
--    if rac==0 then return 0         -- human
--    elseif rac==1 then  return 10   -- dwarf
--    elseif rac==2 then  return 5    -- halfling
--    elseif rac==3 then  return 0    -- elf
--    elseif rac==4 then  return 0    -- orc
--    elseif rac==5 then  return 5    -- lizard
--    else return 0 end
--end
--



function listIni()  -- erstellt leere Listen,
    itemToProduce={};
    needTool={};
    needToolAt={};
    needItemAmt={};
    needResource={};
    needResourceAt={};
    needResourceAmt={};
    raceMalus={};
    needTargetIt={};
    gfxEffect={};
    sndEffect={};
    needSkill={};
    bannList={};
    bannListAt={};
end

------------------------------------------- EDIT THE FOLLOWING LINES! ------------------------------------------
--


function UseItem(User,SourceItem,TargetItem,Counter,Param)  -- DONT EDIT THIS LINE!

    --User:inform("es ist "..TargetItem.id);

    if (firstTime==nil) then
        fillTools();
        listIni();
        Initialize();                                       -- Leere Listen erstellen, Attribut Skill.
        fillLists();
        firstTime=1;
    end

    if (checkTools(User,needTool,needToolAt)==true) then
        --        UserSkill=User:getSkill(LeadSkill);
        --        UserAttrib=User:increaseAttrib(LeadAttrib,0);

        if (Param==0) then

            UserSkill=User:getSkill(LeadSkill); --+skillBonus(User:get_race());
            --if (UserSkill<1) then UserSkill=1 end           -- Damit Rassenmalus das nicht unter 0 drueckt
            UserAttrib=User:increaseAttrib(LeadAttrib,0);

            ItemMenu=MenuStruct();                          -- Initialisieren des Menus
            for itn,iTProd in pairs(itemToProduce) do
            --for itn=1,table.getn(itemToProduce) do          -- Alle items durchlaufen
                if ((TargetItem.id==needTargetIt[itn]) or needTargetIt[itn]==0) then
                    if (checkTargetDir(User,TargetItem)==true) then -- Schaut er in die richtige Richtung?
                        if (needSkill[itn]<=UserSkill) then         -- Wenn der User den Skill fuer das Item hat
                            ItemMenu:addItem(itemToProduce[itn]);   -- Item in das Menu aufnehmen
                        end
                    end
                end
            end
            User:sendMenu(ItemMenu);
        else    -- Param                                    -- es wurdes aus dem Menu gewaehlt
            for itn=1,table.getn(itemToProduce) do          -- Nachschauen, welches Item das denn war
                if (Param==itemToProduce[itn]) then         -- Das hier wars!
                    --User:inform("Param=" .. Param);
                    if (checkPre(User,itn,needResource,needResourceAt,needResourceAmt)==true) then          -- sind die Resourcen da?
                        --User:inform("Praecheck");
                        if (checkBann(User,itn,bannList,bannListAt)==true) then                             -- ist das item auf der bannliste?
                            --User:inform("aus chbn");
                            if (checkSuccess(User,itn,needSkill,UserSkill,UserAttrib,raceMalus)==true) then
                                --User:inform("checkSuu");                      -- Wenn erfolgreich
                                maliNr=User:get_race();
                                if maliNr>5 then malNumber=0 end
                                --User:inform("itn "..itn.." mailNr "..maliNr);
                                mali=raceMalus[itn][maliNr+1]
                                --User:inform("Vor create");
                                --if Param==nil then User:inform("NIL") end
                                --User:inform("CI "..Param);
                                --User:inform("CI "..Param .." "..mali); --.." "..UserAttrib); --.." "..needSkill[itn]);
                                User:createItem(Param,1,detQuality(User,UserSkill-mali,UserAttrib,needSkill[itn]),0);       -- Item herstellen
                                --User:inform("Nach create");
                                for j,ndRes in pairs(needResource[itn]) do
                                --for j=1,table.getn(needResource[itn]) do        -- Verbrauchte Resourcen loeschen
                                    User:eraseItem(needResource[itn][j],needResourceAmt[itn][j]);
                                end
                                if (sndEffect[itn]~=0) then world:makeSound(sndEffect[itn],User.pos) end
                                if (gfxEffect[itn]~=0) then world:gfx(gfxEffect[itn],User.pos) end
                            end -- succ
                        end --bann
                        User:learn(LeadSkillGroup,LeadSkill,2,needSkill[itn]);      -- Von der Erzeugung leichter Items lernt man nicht so viel.
                        -- tools abnuetzen!
                    end  -- pre Voraussetzungen?
                end  -- Ist das das Item?
            end  -- Loop der Items
        end  -- Param?
    else  -- check tools
        User:inform("You do not have the required tools at hand!");
    end --check tools
end --function

-- mining mit Spitzhacke

-- UPDATE common SET com_script='item.id_2763_pickaxe' WHERE com_itemid=2763;

-- UPDATE common SET com_agingspeed = 255, com_objectafterrot = 1246 WHERE com_itemid = 1246;
-- UPDATE common SET com_agingspeed =  10, com_objectafterrot = 1246 WHERE com_itemid = 915;

-- UPDATE common SET com_agingspeed = 255, com_objectafterrot = 1245 WHERE com_itemid = 1245;
-- UPDATE common SET com_agingspeed =  10, com_objectafterrot = 1245 WHERE com_itemid = 1254;

-- UPDATE common SET com_agingspeed = 255, com_objectafterrot = 232  WHERE com_itemid = 232;
-- UPDATE common SET com_agingspeed =  10, com_objectafterrot = 232  WHERE com_itemid = 233;

-- UPDATE common SET com_agingspeed = 255, com_objectafterrot = 914  WHERE com_itemid = 914;
-- UPDATE common SET com_agingspeed =  10, com_objectafterrot = 914  WHERE com_itemid = 1265;

-- UPDATE common SET com_agingspeed = 255, com_objectafterrot = 1273 WHERE com_itemid = 1273;
-- UPDATE common SET com_agingspeed =  10, com_objectafterrot = 1273 WHERE com_itemid = 1257;

-- UPDATE common SET com_agingspeed = 255, com_objectafterrot = 1276 WHERE com_itemid = 1276;
-- UPDATE common SET com_agingspeed =  10, com_objectafterrot = 1276 WHERE com_itemid = 1278;

-- UPDATE common SET com_agingspeed = 255, com_objectafterrot = 1250 WHERE com_itemid = 1250;
-- UPDATE common SET com_agingspeed =  10, com_objectafterrot = 1250 WHERE com_itemid = 1251;

require("item.general.metal")
require("base.common")
require("base.treasure")

module("item.id_2763_pickaxe", package.seeall, package.seeall(item.general.metal))

function Init()
    if InitDone then
        return
    end

    Rocks={};       -- Steine

    Rocks[1246]  = 915;
    Rocks[1245]  = 1254;
    Rocks[232]   = 233;
    Rocks[914]   = 1265;
    Rocks[1273]  = 1257;
    Rocks[1276]  = 1278;
    Rocks[1250]  = 1251;

    ---------------- MINEN IN SILBERBRAND -----
    ------SILBERBRAND 1 -----
    AddArea( 1, position(106,-150,-3), 20 );
    AddStone( 1, 1245 );
    SetRessource( 1, 1245,  21, 40,  0); -- coal
    SetRessource( 1, 1245, 251, 5, 20); -- amethysts
    AddStone( 1, 1246 );
    SetRessource( 1, 1246, 21,  40, 0); -- coal
    SetRessource( 1, 1246, 251,  5, 0); -- amethysts
    SetRessource( 1, 1246, 255,  1, 0); -- rubys
    AddStone( 1, 914 );
    SetRessource( 1, 914, 22,  40, 0); -- iron ore
    SetRessource( 1, 914, 234,  1, 0); -- gold nuggets
    ------SILBERBRAND 2 -----
    AddArea( 2, position(105,-163,-9), 15 );
    AddStone( 2, 1245 );
    SetRessource( 2, 1245,  21, 50,  0); -- coal
    SetRessource( 2, 1245,  254, 1,  0); -- diamonds
    AddStone( 2, 1246 );
    SetRessource( 2, 1246, 21,  50, 0); -- coal
    SetRessource( 2, 1246, 253,  2, 0); -- bluestone
    AddStone( 2, 1273 );
    SetRessource( 2, 1273, 22,  50, 0); -- iron ore
    ------SILBERBRAND 3-----
    AddArea( 3, position(134,-144,-9), 10 );
    AddStone( 3, 232 );
    SetRessource( 3, 232, 2536, 10,  0); -- copper
    SetRessource( 3, 232, 22,   50,  0); -- iron ore
    SetRessource( 3, 232, 234,   1,  0); -- gold nuggets
    ------SILBERBRAND 4 -----
    AddArea( 4, position(103,-152,-6), 20 );
    AddStone( 4, 914 );
    SetRessource( 4, 914,  22, 80,  0); -- iron ore
    SetRessource( 4, 914, 234, 1, 0); -- gold nuggets
    ----------- MINEN in SILBERBRAND - FERTIG -----------

    ------MINE in Tol Vanima-----------------
    AddArea( 5, position(388,157,-10), 10 );
    AddStone( 5, 1245 );
    SetRessource( 5, 1245,  21, 50,  0); -- coal
    SetRessource( 5, 1245, 253,  5, 10); -- bluestone
    AddStone( 5, 1246 );
    SetRessource( 5, 1246,  21, 40,  0); -- coal
    SetRessource( 5, 1246, 253,  5, 30); -- bluestone
    AddStone( 5, 1273 );
    SetRessource( 5, 1273,  22, 50,  0); -- iron ore
    SetRessource( 5, 1273,  234, 3,  5); -- gold nuggets
    ----------- MINE in Tol Vanima - FERTIG -----------

    ---------------- MINE in Varshikar ---------------
    AddArea( 6, position(282,-377,0), 20 );
    AddStone( 6, 232 );
    SetRessource( 6, 232,  2536, 10,  0); -- copper
    SetRessource( 6, 232,  22, 50,  0); -- iron ore
    AddStone( 6, 1245 );
    SetRessource( 6, 1245,  21, 60,  0); -- coal
    SetRessource( 6, 1245,  251, 2,  10); -- amethysts
    SetRessource( 6, 1245,  255, 3,  10); -- rubys
    AddStone( 6, 1246 );
    SetRessource( 6, 1246,  21, 50,  0); -- coal
    SetRessource( 6, 1246,  255, 5, 10); -- rubys
    AddStone( 6, 914 );
    SetRessource( 6, 914,  22, 60,   0); -- iron ore
    SetRessource( 6, 914,  234, 2,  30); -- gold nuggets
    ----------- MINE in Varshikar - FERTIG -----------


    ---------------- Mine Kupferberge 1 ---------------
    AddArea( 7, position(-10,-141,-3), 20 );
    AddStone( 7, 232 );
    SetRessource( 7, 232,  2536, 30, 0); -- copper
    SetRessource( 7, 232,  22, 30,   0); -- iron ore
    SetRessource( 7, 232,  256, 5,  10); -- emerald
    SetRessource( 7, 232,  234, 1,   0); -- gold nuggets
    AddStone( 7, 914 );
    SetRessource( 7, 914,  2536, 20, 0); -- copper
    SetRessource( 7, 914,  22, 50,   0); -- iron ore
    SetRessource( 7, 914,  234, 2,   0); -- gold nuggets
    ----------- Mine Kupferberge 1 - FERTIG -----------
    ---------------- Mine Kupferberge 2 ---------------
    AddArea( 8, position(49,-124,0), 20 );
    AddStone( 8, 232 );
    SetRessource( 8, 232,  2536, 70, 0); -- copper
    SetRessource( 8, 232,  22, 20,   0); -- iron ore
    SetRessource( 8, 232,  256, 5,   0); -- emerald
    AddStone( 8, 914 );
    SetRessource( 8, 914,  22, 40,   0); -- iron ore
    SetRessource( 8, 914,  256, 5,  10); -- emerald
    ----------- Mine Kupferberge 2 - FERTIG -----------

    ---------------- Mine Kupferberge 3  ---------------
    AddArea( 9, position(84,-141,0), 5 );
    AddStone( 9, 232 );
    SetRessource( 9, 232,  2536, 60,0); -- copper
    SetRessource( 9, 232,  22, 20,  0); -- iron ore
    SetRessource( 9, 232,  234, 1,  0); -- gold nuggets
    AddStone( 9, 914 );
    SetRessource( 9, 914,  22, 40,  0); -- iron ore
    SetRessource( 9, 914,  2536, 20,0); -- copper
    SetRessource( 9, 914,  256, 5,  0); -- emerald
    SetRessource( 9, 914,  234, 1,  0); -- gold nuggets
    AddStone( 6, 1246 );
    SetRessource( 6, 1246,  21, 20,  0); -- coal
    -----------Mine  Kupferberge 3 - FERTIG -----------

    ---------------- Mine W�ste ---------------
    AddArea( 10, position(122,-270,-0), 10 );
    AddStone( 10, 1273);
    SetRessource( 10, 1273,  22, 80,  0); -- iron ore
    SetRessource( 10, 1273,  254, 4,  0); -- diamonds
    SetRessource( 10, 1273,  257, 2, 10); -- topas
    AddStone( 10, 914);
    SetRessource( 10, 914,   22,  70,  0); -- iron ore
    SetRessource( 10, 914,  234,   1,  0); -- gold nuggets
    SetRessource( 10, 914, 254,  2,  0); -- diamonds
    SetRessource( 10, 914, 257,  4, 10); -- topas
    ----------- Mine W�ste - FERTIG -----------


    ---------------- Nordmine ---------------
    AddArea( 11, position(-73,-332,0), 10 );
    AddStone( 11, 914 );
    SetRessource( 11, 914,  22, 40,  0); -- iron ore
    SetRessource( 11, 914,  234, 1,  0); -- gold nuggets
    AddStone( 11, 1245 );
    SetRessource( 11, 1245,  21, 80,  0); -- coal
    SetRessource( 11, 1245,  253, 5,  0); -- bluestone
    AddStone( 11, 1246 );
    SetRessource( 11, 1246,  21, 40,  0); -- coal
    SetRessource( 11, 1246,  253, 5, 20); -- bluestone
    SetRessource( 11, 1246,  252, 6, 0); -- blackstone
    ----------- Nordmine - FERTIG -----------

    ---------------- Merinium Mine in Tol Vanima ----
	AddArea( 12, position(401,134,-13), 10 );
	AddStone( 12, 1273 );
	SetRessource( 12, 1273, 2534, 10, 0); -- Merinium Ore
	SetRessource( 12, 1273, 22, 90, 0); -- Iron Ore
	AddStone( 12, 232 );
	SetRessource( 12, 232, 2534,5, 0); -- Merinium Ore
	SetRessource( 12, 232, 234, 10, 0); -- Gold nuggets
	SetRessource( 12, 232, 22, 80, 0); -- Iron Ore
	----------- Merinium Mine - FERTIG -----------
	
	----------- Noobia Mine -----------
	AddArea( 13, position(122,25,100), 10 );
	AddStone( 13, 1245 );
	SetRessource( 13, 1245, 21, 90, 0 ); -- coal
	AddStone( 13, 1246 );
	SetRessource( 13, 1246, 21, 90, 0 ); -- coal
	AddStone( 13, 914 );
	SetRessource( 13, 914, 22, 90, 0 ); -- iron ore
	AddStone( 13, 1273 );
	SetRessource( 13, 1273, 22, 90, 0 ); -- iron ore
	------- Noobia Mine - FERTIG ------



    InitDone = true;
end

function AddArea(AreaID,Center,Rad)
    if (Area == nil) then
        Area = { };
    end
    Area[AreaID] = { };
    Area[AreaID]["Center"] = Center;
    Area[AreaID]["Radius"] = Rad;
end

function AddStone(AreaID,StoneID)
    if ( Area[AreaID]["Stones"] == nil ) then
        Area[AreaID]["Stones"] = { };
    end
    Area[AreaID]["Stones"][StoneID] = { };
end

function SetRessource(AreaID,StoneID,RessID,Chance,minSkill)
    Area[AreaID]["Stones"][StoneID][RessID] = { };
    Area[AreaID]["Stones"][StoneID][RessID][1] = Chance;
    Area[AreaID]["Stones"][StoneID][RessID][2] = minSkill;
end

function GetRessource(AreaID, StoneID, Skill)
    RessourceList = Area[AreaID]["Stones"][StoneID];
    AvaiableRess = { };
    MaxTry = 100;
    RessCnt = 0;
    for i,Ressource in RessourceList do
        if (Skill >= Ressource[2]) then
            AvaiableRess[i] = Ressource[1];
            RessCnt = RessCnt + 1;
        else
            MaxTry = MaxTry - Ressource[1];
        end
    end
    if (RessCnt == 0) then
        return -1;
    end
    RessourceTry = math.random(0,MaxTry);
    TriggerTry = 0;
    for i,Ressource in AvaiableRess do
        if ((RessourceTry >= TriggerTry) and (RessourceTry < (TriggerTry+Ressource))) then
            return i;
        else
            TriggerTry = TriggerTry + Ressource;
        end
    end
    return 0;
end

function GetModifiedSkill(Char)
    local USkill=Char:getSkill("mining");
    local UStr=Char:increaseAttrib("strength",0);
    local UPerc=Char:increaseAttrib("perception",0);
    return math.max(0,math.min(100,(USkill * Scale(0.5,1.2,UStr*4 + UPerc))));
end

function checkSucc(Skill)
    local prob=Scale(40,90,Skill);
    if (math.random(100)<prob) then
        return true;
    else
        return false;
    end
end

function CheckRock(AreaID,StoneID)
    if (Area[AreaID]["Stones"][StoneID] ~= nil) then
        return true;
    else
        return false;
    end
end

function Areas(TargetPos)
    local XDiff = 0;
    local YDiff = 0;
    for i, AreaData in pairs(Area) do
        XDiff = AreaData["Center"].x - TargetPos.x;
        YDiff = AreaData["Center"].y - TargetPos.y;
        if (math.sqrt((XDiff * XDiff) + (YDiff * YDiff)) <= AreaData["Radius"]) then
            if (TargetPos.z == AreaData["Center"].z) then
                return i;
            end
        end
    end
    return false;
end

function breakRock(Rock)
    local RockPos=Rock.pos;
    local RockQual=Rock.quality;
    local HitDMG=math.random(6,8);
    if (RockQual<HitDMG) then
        world:swap(Rock,Rocks[Rock.id],333);
        return true;
    else
        if ((RockQual-HitDMG)==(math.floor(RockQual/100))*100) then HitDMG=HitDMG-1 end
        world:changeQuality(Rock,-HitDMG)
    end
    return false;
end

function Scale(ScBegin, ScEnd, value)
    if (ScBegin < ScEnd) then
        return math.min(ScEnd,math.max(ScBegin,((ScEnd-ScBegin)/100)*value+ScBegin));
    else
        return math.max(ScEnd,math.min(ScBegin,((ScEnd-ScBegin)/100)*value+ScBegin));
    end
end

function UseItem(User, SourceItem, TargetItem, Counter, Param, ltstate)
	InitGathering();
    Init();
    base.common.ResetInterruption( User, ltstate );
    if ( ltstate == Action.abort ) then
        if (User:increaseAttrib("sex",0) == 0) then
            gText = "seine";
            eText = "his";
        else
            gText = "ihre";
            eText = "her";
        end
        User:talkLanguage(CCharacter.say, CPlayer.german, "#me unterbricht "..gText.." Arbeit.");
        User:talkLanguage(CCharacter.say, CPlayer.english,"#me interrupts "..eText.." work.");
        return
    end

    if not base.common.CheckItem( User, SourceItem ) then
        return
    end
    if ((TargetItem == nil) or (TargetItem.id == 0)) then
        TargetItem = base.common.GetFrontItem( User );
    else
        TargetItem = world:getItemOnField(TargetItem.pos);
    end
    
    if ((TargetItem == nil) or (TargetItem.id == 0)) then
        UseItemWithField(User,SourceItem,base.common.GetFrontPosition(User),Counter,Param);
        return;
    end

    if base.common.Encumbrence(User) then
        base.common.InformNLS( User,
        "Deine R�stung behindert Dich Rohstoffe abzubauen.",
        "Your armor disturbes you when mining ores" );
        return
    end

    if (SourceItem:getType() ~= 4) then
        base.common.InformNLS( User,
        "Du musst eine Spitzhacke in der Hand haben!",
        "You need to hold the pick-axe in your hand!" );
        return
    end

    if not base.common.IsLookingAt( User, TargetItem.pos ) then
        base.common.TurnTo( User, TargetItem.pos );
    end

    AreaID = Areas(TargetItem.pos);

    if ( AreaID == false ) then
        base.common.InformNLS(User,
        "Die Gegend sieht nicht so aus, als k�nnte man hier etwas finden.",
        "The area doesn't look like a area to mine.");
        return
    end

    if not CheckRock(AreaID,TargetItem.id) then
        if (ltstate ~= Action.success) then
            base.common.InformNLS(User,
            "Da ist nichts zum Draufschlagen.",
            "There is nothing to hit.");
        end
        return
    end

    if (ltstate == Action.none) then
        User:talkLanguage( CCharacter.say, CPlayer.german, "#me beginnt mit der Spitzhacke auf den Stein zu schlagen.");
        User:talkLanguage( CCharacter.say, CPlayer.english, "#me starts to hit the stone with a pick axe.");
        User:startAction( GenWorkTime(User), 0, 0, 8, 15);
        return
    end

    if base.common.ToolBreaks( User, SourceItem, true ) then
        base.common.InformNLS(User,
        "Die alte und abgenutzte Spitzhacke in deinen H�nden zerbricht.",
        "The old and used pick-axe in your hands breaks.");
        return
    end

    if breakRock(TargetItem) then
        User:talkLanguage( CCharacter.say, CPlayer.german, "#me zertr�mmert den Stein.");
        User:talkLanguage( CCharacter.say, CPlayer.english, "#me destroys the rock.");
        return
    end

    Skill = GetModifiedSkill(User);

	if not mining:FindRandomItem(User) then
		return
	end
	
    if not checkSucc(Skill) then
        User:startAction( GenWorkTime(User), 0, 0, 8, 15);
        User:learn(2,"mining",1,100);
        return
    end

    Ressource=GetRessource(AreaID, TargetItem.id, Skill);

    -- Edit by abcfantasy

    --    if (Ressource < 1 ) then
    --        User:startAction( GenWorkTime(User), 0, 0, 8, 15);
    --        base.common.GetHungry( User, 300 );
    --        if (Ressource == 0 ) then
    --            User:learn(2,"mining",1,100);
    --        end
    --        return
    --    end

    if Ressource == 0 then     -- set resource to raw stone and continue script
        Ressource = 735
    elseif Ressource < 0 then  -- find nothing
        User:startAction( GenWorkTime(User), 0, 0, 8, 15);
        base.common.GetHungry( User, 300 );
        return
    end

    User:learn(2,"mining",1,100);

    -- End edit

    local notcreated=User:createItem(Ressource,1,333,0);

    if (notcreated~=0) then
        world:createItemFromId(Ressource,1,User.pos,true,333,0);
        base.common.InformNLS(User,
        "Du kannst nicht noch mehr halten.",
        "You can't carry any more.");
    else
        User:startAction( GenWorkTime(User), 0, 0, 8, 15);
    end
end

function UseItemWithField(User,SourceItem,TargetPos,counter,param)
    local groundTile = world:getField( TargetPos ):tile();
    local GroundType = base.common.GetGroundType( groundTile );
    
    if (GroundType ~= 5) and base.treasure.DigForTreasure( User, TargetPos, (User:getSkill("mining")/10)+1,
                                                base.common.GetNLS( User,
                                                    "Du schwingst deine Spitzhacke gegen den steinigen Boden und st��t auf etwas das noch h�rter ist als der Boden. Das muss er sein! Der Schatz. Noch einmal graben und der grenzenlose Reichtum ist dein!",
                                                    "You swing your pick-axe against the stony ground and hit something that is even harder then the ground. That must it be! The teasure! Digging another time and it yours!" ), false ) then
        return;
    end
    
    
    if (( groundTile ~= 3 ) and ( groundTile ~= 8 )) then
        if ( GroundType == 1 ) then
            base.common.InformNLS( User,
            "Du schwingst deine Spitzhacke schwungvoll gegen den Boden und sie gr�bt sich tief in den Ackerboden.",
            "You swing your pick-axe towards the ground and it digs deeply into the farm land.");
        elseif ( GroundType == 2 ) then
            base.common.InformNLS( User,
            "Du schwingst deine Spitzhacke schwungvoll gegen den Boden und sie gr�bt sich tief in den Waldboden.",
            "You swing your pick-axe towards the ground and it digs deeply into the forest ground.");
        elseif ( GroundType == 4 ) then
            base.common.InformNLS( User,
            "Du schwingst deine Spitzhacke schwungvoll gegen den Boden und sie gr�bt sich tief in die Wiese.",
            "You swing your pick-axe towards the ground and it digs deeply into the gras.");
        elseif ( GroundType == 5 ) then
            base.common.InformNLS( User,
            "Du schwingst deine Spitzhacke schwungvoll gegen den Boden und lockerst du den festen Boden etwas",
            "You swing your pick-axe towards the ground and ease the stony ground slightly.");
        elseif ( GroundType == 6 ) then
            base.common.InformNLS( User,
            "Du schwingst deine Spitzhacke schwungvoll gegen den Boden und sie versinkt mit einem Platschen im Wasser.",
            "You swing your pick-axe towards the ground and it runs with a splash into the water.");
        else
            base.common.InformNLS(User,
            "Du versuchst an dieser Stelle zu graben",
            "This isn't a good place to dig.");
        end
        return
    end
end

function UseItemWithCharacter(User,SourceItem,TargetChar,counter,param)
    base.common.InformNLS(User,
    "Eine Spitzhacke ist nicht so sehr als Waffe geeignet.",
    "You shouldn't use a pick-axe as a weapon.");
end

-- Arbeitszeit generieren
-- 2s - 5.5s
function GenWorkTime(User)
    local Attrib = User:increaseAttrib("dexterity",0); -- Geschicklichkeit: 0 - 20
    local Skill  = math.min(100,User:getSkill("mining")*10);    -- Schmieden: 0 - 100

    return math.floor(-0.3 * (Attrib + Skill) + 60);
end
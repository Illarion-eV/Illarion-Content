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
require("content.gathering")
require("base.gatheringcraft")

module("item.id_2763_pickaxe", package.seeall, package.seeall(item.general.metal))

--Noobia addition by Estralis: Equipping a pick-axe is a task of NPC Aldania
function MoveItemAfterMove(User,SourceItem,TargetItem)

    if User:getQuestProgress(310)==2 and TargetItem.id==2763 and User:isInRangeToPosition((position (51,30,100)),20) and TargetItem:getType() == 4 then --only invoked if the user has the quest, moves a pick-axe to a hand slot and is in range of the NPC
        User:inform("OK!!!");
		--User:setQuestProgress(310)=3; --Connection to easyNPC
		NPCList=world:getNPCSInRangeOf((position(51,30,100)),2); --Let's be tolerant, the NPC might move a tile.
		Aldania=NPCList;
		Aldania:TalkNLS(Aldania, Character.say, "DEUTSCH", "EngliSh");
	    base.common.InformNLS( User,"[Tutorial] ÜBERSETZEN.","[Tutorial] Close your chatbox and press 'I' to open your inventory and WHATEVER to open your backpack. Do WHATEVER to examine the pick-axe." );
	end
	
return true; --leave savely

end

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
	
--[[
1245: 60% Coal + 7% Blackstone + 3% Ruby
1246: 40% Coal + 7% Amethyst + 3% Emerald
232: 40% Copper + 10% Gold + 7% Diamond 3% Amethyst
914: 60% Iron + 7% Ruby + 3% Topaz
1273: 40% Iron + 7% Bluestone + 3% Blackstone
1276: 60% Copper + 7% Emerald + 3% Bluestone
1250: 10% Gold + 5% Merinium + 7% Topaz + 3% Diamond

Coalmine: Galmair "Dark Hole Mine"
Coordinates: 406,159,-3
Radius 20

Iron/gold/coppermine: Galmair "Malachite Mine"
Coordinates: 420,371,0
Radius 30

Coalmine: Cadomyr "Cornerstone of Candour"
Coordinates: 142,686,0
Radius 15

Iron/gold/coppermine: Cadomyr "Liberty Quarry"
Coordinates: 165,603,0
Radius 15

Merinium/gold/coalmine: Wilderness "Glittering Cave"
Coordinates: 548,371,0
Radius 15

Coal/Iron/Gold/coppermine: Wilderness "Skewer Drift"
Coordinates: 942,444,0
Radius 15
]]--
	
    --Galmair "Dark Hole Mine" 
    AddArea( 1, position(406,159,-3), 20 );
    AddStone( 1, 1245 );
    SetRessource( 1, 1245,  21, 60,  0); -- coal
	SetRessource( 1, 1245,  252, 7, 0); -- blackstone
    SetRessource( 1, 1245,  255, 3,  0); -- rubys
    AddStone( 1, 1246 );
    SetRessource( 1, 1246, 21,  40, 0); -- coal
    SetRessource( 1, 1246, 251,  7, 0); -- amethysts
    SetRessource( 1, 1246,  256,  3,  0); -- emerald

	--Galmair "Malachite Mine"
    AddArea( 2, position(420,371,0), 30 );
    AddStone( 2, 232 );
    SetRessource( 2, 232, 2536, 40,  0); -- copper
    SetRessource( 2, 232, 234,  10,  0); -- gold nuggets
	SetRessource( 2, 232, 254,  7,  0); -- diamonds
	SetRessource( 2, 232, 251,  3, 0); -- amethysts
    AddStone( 2, 914 );
    SetRessource( 2, 914,  22, 60,  0); -- iron ore
	SetRessource( 2, 914,  255, 7, 0); -- rubys
	SetRessource( 2, 914,  257, 3, 0); -- topas
    AddStone( 2, 1273 );
    SetRessource( 2, 1273,  22, 40,  0); -- iron ore
	SetRessource( 2, 1273,  253, 7, 0); -- bluestone
	SetRessource( 2, 1273,  252, 3, 0); -- blackstone
	
	--Cadomyr "Cornerstone of Candour"
	AddArea( 3, position(142,686,0), 15 );
    AddStone( 3, 1245 );
    SetRessource( 3, 1245,  21, 60,  0); -- coal
	SetRessource( 3, 1245,  252, 7, 0); -- blackstone
    SetRessource( 3, 1245,  255, 3,  0); -- rubys
    AddStone( 3, 1246 );
    SetRessource( 3, 1246, 21,  40, 0); -- coal
    SetRessource( 3, 1246, 251,  7, 0); -- amethysts
    SetRessource( 3, 1246,  256,  3,  0); -- emerald
	
	--Cadomyr "Liberty Quarry"
	AddArea( 4, position(165,603,0), 15 );
    AddStone( 4, 232 );
    SetRessource( 4, 232, 2536, 40,  0); -- copper
    SetRessource( 4, 232, 234,  10,  0); -- gold nuggets
	SetRessource( 4, 232, 254,  7,  0); -- diamonds
	SetRessource( 4, 232, 251,  3, 0); -- amethysts
    AddStone( 4, 914 );
    SetRessource( 4, 914,  22, 60,  0); -- iron ore
	SetRessource( 4, 914,  255, 7, 0); -- rubys
	SetRessource( 4, 914,  257, 3, 0); -- topas
    AddStone( 4, 1273 );
    SetRessource( 4, 1273,  22, 40,  0); -- iron ore
	SetRessource( 4, 1273,  253, 7, 0); -- bluestone
	SetRessource( 4, 1273,  252, 3, 0); -- blackstone
	
	--Wilderness "Glittering Cave"
	AddArea( 5, position(548,371,0), 15 );
    AddStone( 5, 1245 );
    SetRessource( 5, 1245,  21, 60,  0); -- coal
	SetRessource( 5, 1245,  252, 7, 0); -- blackstone
    SetRessource( 5, 1245,  255, 3,  0); -- rubys
    AddStone( 5, 1246 );
    SetRessource( 5, 1246, 21,  40, 0); -- coal
    SetRessource( 5, 1246, 251,  7, 0); -- amethysts
    SetRessource( 5, 1246, 256,  3,  0); -- emerald
    AddStone( 5, 1250 );
    SetRessource( 5, 1250, 234,  10, 0); -- gold nuggets
    SetRessource( 5, 1250, 2534,  5, 0); -- merinium ore
    SetRessource( 5, 1250,  254,  7,  0); -- diamonds
	SetRessource( 5, 1250,  257,  3, 0); -- topas
		
	--Wilderness "Skewer Drift"
	AddArea( 6, position(942,444,0), 15 );
    AddStone( 6, 232 );
    SetRessource( 6, 232, 2536, 40,  0); -- copper
    SetRessource( 6, 232, 234,  10,  0); -- gold nuggets
	SetRessource( 6, 232, 254,  7,  0); -- diamonds
	SetRessource( 6, 232, 251,  3, 0); -- amethysts
    AddStone( 6, 914 );
    SetRessource( 6, 914,  22, 60,  0); -- iron ore
	SetRessource( 6, 914,  255, 7, 0); -- rubys
	SetRessource( 6, 914,  257, 3, 0); -- topas
    AddStone( 6, 1273 );
    SetRessource( 6, 1273,  22, 40,  0); -- iron ore
	SetRessource( 6, 1273,  253, 7, 0); -- bluestone
	SetRessource( 6, 1273,  252, 3, 0); -- blackstone
	AddStone( 6, 1245 );
    SetRessource( 6, 1245,  21, 60,  0); -- coal
	SetRessource( 6, 1245,  252, 7, 0); -- blackstone
    SetRessource( 6, 1245,  255, 3,  0); -- rubys
    AddStone( 6, 1246 );
    SetRessource( 6, 1246, 21,  40, 0); -- coal
    SetRessource( 6, 1246, 251,  7, 0); -- amethysts
    SetRessource( 6, 1246,  256,  3,  0); -- emerald
	    	
	----------- Noobia Mine -----------
	AddArea( 7, position(122,25,100), 10 );
	AddStone( 7, 1245 );
	SetRessource( 7, 1245, 21, 90, 0 ); -- coal
	AddStone( 7, 1246 );
	SetRessource( 7, 1246, 21, 90, 0 ); -- coal
	AddStone( 7, 914 );
	SetRessource( 7, 914, 22, 90, 0 ); -- iron ore
	AddStone( 7, 1273 );
	SetRessource( 7, 1273, 22, 90, 0 ); -- iron ore
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
	content.gathering.InitGathering();
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
        User:talkLanguage(Character.say, Player.german, "#me unterbricht "..gText.." Arbeit.");
        User:talkLanguage(Character.say, Player.english,"#me interrupts "..eText.." work.");
        return
    end

    if not base.common.CheckItem( User, SourceItem ) then
        return
    end
	
    local TargetItem = base.common.GetFrontItem( User );
    
    if ((TargetItem == nil) or (TargetItem.id == 0)) then
        DigForTresure(User, base.common.GetFrontPosition(User));
        return;
    end

    if base.common.Encumbrence(User) then
        base.common.InformNLS( User,
        "Deine Rüstung behindert Dich Rohstoffe abzubauen.",
        "Your armour disturbes you when mining ores" );
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
        "Die Gegend sieht nicht so aus, als könnte man hier etwas finden.",
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
        User:talkLanguage( Character.say, Player.german, "#me beginnt mit der Spitzhacke auf den Stein zu schlagen.");
        User:talkLanguage( Character.say, Player.english, "#me starts to hit the stone with a pick axe.");
		User:startAction( base.gatheringcraft.GenWorkTime(User), 0, 0, 8, 15);
        return
    end

    if base.common.ToolBreaks( User, SourceItem, true ) then
        base.common.InformNLS(User,
        "Die alte und abgenutzte Spitzhacke in deinen Händen zerbricht.",
        "The old and used pick-axe in your hands breaks.");
        return
    end

    if breakRock(TargetItem) then
        User:talkLanguage( Character.say, Player.german, "#me zertrümmert den Stein.");
        User:talkLanguage( Character.say, Player.english, "#me destroys the rock.");
        return
    end

    Skill = GetModifiedSkill(User);
	

	if not base.gatheringcraft.mining:FindRandomItem(User) then
		return
	end
	
    if not checkSucc(Skill) then
        User:startAction( base.gatheringcraft.GenWorkTime(User), 0, 0, 8, 15);
        --User:learn(2,"mining",1,100);
		--Replace with new learn function, see learn.lua 
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
        User:startAction( base.gatheringcraft.GenWorkTime(User), 0, 0, 8, 15);
		base.common.GetHungry( User, 300 );
        return
    end

    --User:learn(2,"mining",1,100);
	--Replace with new learn function, see learn.lua 

    -- End edit

    local notcreated=User:createItem(Ressource,1,333,0);

    if (notcreated~=0) then
        world:createItemFromId(Ressource,1,User.pos,true,333,0);
        base.common.InformNLS(User,
        "Du kannst nicht noch mehr halten.",
        "You can't carry any more.");
    else
        User:startAction( base.gatheringcraft.GenWorkTime(User), 0, 0, 8, 15);
    end
end

function DigForTresure(User,TargetPos)
    local groundTile = world:getField( TargetPos ):tile();
    local GroundType = base.common.GetGroundType( groundTile );
    
    if (GroundType ~= 5) and base.treasure.DigForTreasure( User, TargetPos, (User:getSkill("mining")/10)+1,
                                                base.common.GetNLS( User,
                                                    "Du schwingst deine Spitzhacke gegen den steinigen Boden und stößt auf etwas das noch härter ist als der Boden. Das muss er sein! Der Schatz. Noch einmal graben und der grenzenlose Reichtum ist dein!",
                                                    "You swing your pick-axe against the stony ground and hit something that is even harder then the ground. That must it be! The teasure! Digging another time and it yours!" ), false ) then
        return;
    end
    
    
    if (( groundTile ~= 3 ) and ( groundTile ~= 8 )) then
        if ( GroundType == 1 ) then
            base.common.InformNLS( User,
            "Du schwingst deine Spitzhacke schwungvoll gegen den Boden und sie gräbt sich tief in den Ackerboden.",
            "You swing your pick-axe towards the ground and it digs deeply into the farm land.");
        elseif ( GroundType == 2 ) then
            base.common.InformNLS( User,
            "Du schwingst deine Spitzhacke schwungvoll gegen den Boden und sie gräbt sich tief in den Waldboden.",
            "You swing your pick-axe towards the ground and it digs deeply into the forest ground.");
        elseif ( GroundType == 4 ) then
            base.common.InformNLS( User,
            "Du schwingst deine Spitzhacke schwungvoll gegen den Boden und sie gräbt sich tief in die Wiese.",
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
            "Dein Versuch, an dieser Stelle zu graben, dürfte nicht von Erfolge gekrönt werden.",
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

--[[ Arbeitszeit generieren
-- 2s - 5.5s
function GenWorkTime(User)
    local Attrib = User:increaseAttrib("constitution",0); -- Konstitution: 0 - 20
    local Skill  = math.min(100,User:getSkill("mining")*10);    -- Mining: 0 - 100

    return math.floor(-0.3 * (Attrib + Skill) + 60);
end]]--

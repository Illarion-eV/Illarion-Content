module("content.paintings", package.seeall)
--UNDER CONSTRUCTION by envi--
function InitPaintings()
    signTextDe={};
    signTextEn={};
    signCoo={};
    signItemId={};
    signPerception={};

	--UPDATE common SET com_script="item/signpost.lua" WHERE com_itemid=245;

   
    ---------------- BILDER ----------------

    --AddPicture({X,Y,Z},german text,english text, type, needed value of perception);
    --typs:
    -- 1 = east wall yellow picture
    -- 2 = east wall violett picture
    -- 3 = north wall blue picture
    -- 4 = east wall blue picture
    -- 5 = north wall sea picture
    -- 6 = east wall sea picture
    -- 7 = north wall wood picture
    -- 8 = east wall wood picture

    --[[--Cadomyr
    AddPicture({147,622,1},"","", 2,5); --flats
    AddPicture({147,616,1},"","", 4,5); --flats
    AddPicture({141,612,1},"","", 3,5); --flats
    AddPicture({145,608,1},"","", 1,5); --flats
    AddPicture({142,606,1},"","", 3,5); --flats
    AddPicture({144,604,0},"","", 4,5); --flats
    AddPicture({141,607,0},"","", 7,5); --flats
    AddPicture({139,613,0},"","", 3,5); --flats
    AddPicture({143,613,0},"","", 3,5); --flats]]--
    AddPicture({129,524,0},"","A man is lying in his bed. He seems very sick. A young woman is sitting next to him and is holding one of his hands. He hands her a crown while she is shimmering in an almost divine sun light. At the bottom right is a date: 22 AS.", 7,5); --palace
    --AddPicture({130,518,0},"","", 5,5); --queens room
    --AddPicture({135,516,0},"","", 3,5); --queens room
    --AddPicture({138,516,0},"","", 3,5); --queens room
    AddPicture({117,579,0},"","The picture shows proud knights watching ordinary folk building a palace at the periphery of a desert close at a mountain. One of the knights has a long beard and wears a crown. He holds also a red-white banner. At the bottom right is a date: 137 BS.", 4,5); --taverne
    AddPicture({91,572,0},"","An outnumbered red-white dressed knight raises his sword to counter an attack of hundred black-yellow dressed soldiers. Other thousand of these soldiers lying around. They are probably dead. At the bottom right is a date: 118 BS.", 4,5); --inn
    AddPicture({91,574,0},"","The pictures shows how red-white dressed knights are slaughtering an orc-tribe leaded by an obviously powerful shaman. The action takes place close at a high mountain where glowing water comes out. At the bottom right is a date: 66 BS.", 4,5); --inn
    AddPicture({91,576,0},"","You see two knights fighting each other with joy. You can also see other people who watching and cheering them. Big red-white banners on the roof of the building are shimmering in the sun. At the bottom right is a date: since 56 BS.", 4,5); --inn
    AddPicture({86,574,0},"","You see proud and fearless knights walking on red-white adorned ships. Women stay at the shore and waving white towels. There is also a priest on the picture who obviously prays. At the bottom right is a date: 16 BS.", 4,5); --inn
    AddPicture({88,578,1},"","A red-white dressed knight kneels in front of dark-dressed man with a wizard hat. The knights holds his sword triumphing at the throat of the man. Folk of different races are watching and celebrating the knight. At the bottom right is a date: 0 AS.", 5,5); --inn
    AddPicture({85,578,1},"","Knights with swords and red-white banners are slaughtering a dragon who tries to cover them with flames while in the background a group of blue-grey dressed mages running away with a treasure chest. At the bottom right is a date: 105 BS.", 5,5); --inn
    AddPicture({96,600,1},"","You can see a small group of red-white dressed knights chasing fearless hundreds of bandits over a big river in a desert. At the bottom right is a date: 109 BS.", 4,5); --building
    AddPicture({96,599,1},"","A knight with a raised blade and a red-white shield watches workers building a harbor while blue-grey ships disappearing at the horizon. At the bottom right is a date: 78 BS. ", 4,5); --building
    AddPicture({96,602,0},"","The picture shows proud knights watching ordinary folk building a palace at the periphery of a desert close at a mountain. One of the knights has a long beard and wears a crown. He holds also a red-white banner. At the bottom right is a date: 137 BS.", 4,5); --building
    AddPicture({100,611,1},"","The picture shows a man fighting numberless soldiers dressed as pirates in front of a burning building. His sword cuts through them and the fear in the eyes of his opponents cannot be ignored. At the bottom right is a date: 22 BS.", 3,5); --building
    --[[--Eastland
    AddPicture({894,540,0},"","", 2,5); --Paddock Farm
    --Galmair
    AddPicture({309,270,0},"","", 4,5); --Villa 'Goldvein'
    AddPicture({309,277,0},"","", 4,5); --Villa 'Goldvein'
    AddPicture({372,214,0},"","", 7,5); --Council Chamber
    AddPicture({370,214,0},"","", 7,5); --Council Chamber
    AddPicture({375,217,0},"","", 6,5); --Council Chamber
    AddPicture({363,217,0},"","", 5,5); --Council Chamber
    AddPicture({365,224,0},"","", 2,5); --Council Chamber
    AddPicture({419,210,-6},"","",1,5); --Cameo Pit
    AddPicture({419,215,-6},"","",2,5); --Cameo Pit
    AddPicture({434,220,-6},"","",3,5); --Cameo Pit
    AddPicture({429,227,-6},"","",5,5); --Cameo Pit
    AddPicture({433,232,-6},"","",2,5); --Cameo Pit
    AddPicture({435,237,-6},"","",1,5); --Cameo Pit
    AddPicture({428,236,-5},"","",5,5); --Cameo Pit
    AddPicture({433,236,-5},"","",5,5); --Cameo Pit
    AddPicture({436,238,-5},"","",4,5); --Cameo Pit
    AddPicture({436,239,-5},"","",4,5); --Cameo Pit
    AddPicture({433,227,-5},"","",3,5); --Cameo Pit
    AddPicture({433,228,-5},"","",8,5); --Cameo Pit
    AddPicture({428,227,-5},"","",7,5); --Cameo Pit
    AddPicture({437,222,-5},"","",4,5); --Cameo Pit
    AddPicture({437,221,-5},"","",4,5); --Cameo Pit
    AddPicture({422,210,-5},"","",4,5); --Cameo Pit
    AddPicture({411,227,-6},"","",5,5); --Cameo Pit
    AddPicture({416,227,-6},"","",7,5); --Cameo Pit
    AddPicture({417,235,-5},"","",4,5); --Cameo Pit
    AddPicture({417,229,-5},"","",4,5); --Cameo Pit
    AddPicture({394,337,-5},"","",1,5); --The Winged Sow Tavern
    AddPicture({394,333,-5},"","",6,5); --The Winged Sow Tavern
    --Galmair Hinterlands
    AddPicture({419,346,0},"","", 2,5); --Miners club
    AddPicture({416,296,0},"","", 7,5); --Sleepy Bujhaar Inn
    AddPicture({419,296,0},"","", 3,5); --Sleepy Bujhaar Inn
	AddPicture({421,293,1},"","", 4,5); --Sleepy Bujhaar Inn
	AddPicture({426,293,1},"","", 4,5); --Sleepy Bujhaar Inn
	AddPicture({426,291,1},"","", 4,5); --Sleepy Bujhaar Inn
	AddPicture({423,289,1},"","", 3,5); --Sleepy Bujhaar Inn
	--Galmair Plateau
    AddPicture({318,357,1},"","", 1,5);
    AddPicture({318,359,1},"","", 2,5);
    --Runewick Harbour/Farm
	AddPicture({756,797,0},"","", 4,5); --Taverne "Quadruped Red Bird"
    --Runewick - Tower of Air
    AddPicture({910,833,4},"","", 2,5)
    AddPicture({910,835,4},"","", 1,5)
    AddPicture({898,834,4},"","", 2,5)
    AddPicture({898,836,4},"","", 1,5)
    AddPicture({897,830,4},"","", 4,5)
    AddPicture({906,837,3},"","", 2,5) --house of gods
    AddPicture({906,828,3},"","", 1,5) --house of gods
    AddPicture({910,832,3},"","", 4,5)
    AddPicture({897,830,2},"","", 4,5) --student dorm
    AddPicture({892,828,2},"","", 7,5) --student dorm
    AddPicture({903,833,2},"","", 5,5)
    AddPicture({907,830,2},"","", 5,5)
    AddPicture({904,818,1},"","", 4,5)
    AddPicture({904,822,1},"","", 4,5)
    AddPicture({912,831,1},"","", 3,5)
    AddPicture({917,831,1},"","", 3,5)
    AddPicture({897,831,1},"","", 4,5)
    --Runewick - Tower of Earth
    AddPicture({956,832,0},"","", 4,5) --Adron's barrel
    AddPicture({956,837,0},"","", 4,5) --Adron's barrel
    AddPicture({949,819,1},"","", 3,5)
    AddPicture({950,829,2},"","", 4,5)
    AddPicture({947,824,2},"","", 3,5)
    AddPicture({943,824,2},"","", 3,5)
    AddPicture({950,830,3},"","", 5,5)
    AddPicture({954,830,3},"","", 5,5)
    AddPicture({956,834,3},"","", 4,5)
    AddPicture({956,838,3},"","", 4,5)
    AddPicture({956,831,4},"","", 2,5)
    AddPicture({956,833,4},"","", 2,5)
    AddPicture({956,836,4},"","", 1,5)
    AddPicture({954,835,4},"","", 3,5)
    --Runewick - Tower of Fire
    AddPicture({904,778,1},"","", 4,5) --library
    AddPicture({909,761,1},"","", 3,5)
    AddPicture({911,761,1},"","", 3,5)
    AddPicture({915,761,1},"","", 3,5)
    AddPicture({917,761,1},"","", 3,5)
    AddPicture({921,761,1},"","", 3,5)
    AddPicture({923,761,1},"","", 3,5)
    AddPicture({896,756,2},"","", 3,5) --archmage's room
    AddPicture({901,762,2},"","", 4,5) --archmage's room
    AddPicture({910,770,2},"","", 4,5) --hall of elara
    AddPicture({910,774,2},"","", 1,5) --hall of elara
    AddPicture({911,782,2},"","", 1,5) --hall of elara
    AddPicture({898,766,4},"","", 3,5)
    AddPicture({901,766,4},"","", 3,5)
    AddPicture({900,777,4},"","", 3,5)
    AddPicture({899,777,4},"","", 3,5)
    --Runewick - Tower of Water
    AddPicture({949,754,4},"","", 4,5)
    AddPicture({949,755,4},"","", 4,5)
    AddPicture({953,765,4},"","", 1,5)
    AddPicture({953,766,4},"","", 2,5)
    AddPicture({944,763,4},"","", 3,5)
    AddPicture({948,753,3},"","", 1,5)
    AddPicture({948,755,3},"","", 8,5)
    AddPicture({948,757,3},"","", 2,5)
    AddPicture({952,764,3},"","", 5,5)
    --Spider's Mouth
    AddPicture({711,314,1},"","", 1,5); --The Hemp Necktie Inn
    AddPicture({708,316,1},"","", 7,5); --The Hemp Necktie Inn
    AddPicture({702,316,1},"","", 5,5); --The Hemp Necktie Inn
    AddPicture({700,307,1},"","", 5,5); --The Hemp Necktie Inn
    AddPicture({711,320,1},"","", 4,5); --The Hemp Necktie Inn
    AddPicture({705,326,1},"","", 5,5); --The Hemp Necktie Inn
    AddPicture({700,318,1},"","", 3,5); --The Hemp Necktie Inn
	AddPicture({698,307,0},"","", 5,5); --The Hemp Necktie Inn
	AddPicture({711,324,0},"","", 4,5); --The Hemp Necktie Inn]]--

    
end

function AddWeg(Posi,dText,eText,Dir,Percept)
    local tablePos = Posi[1]..Posi[2]..Posi[3];
    PrepareTables(tablePos);
    table.insert(signCoo[tablePos],position(Posi[1],Posi[2],Posi[3]));
    table.insert(signTextDe[tablePos],dText);
    table.insert(signTextEn[tablePos],eText);
    table.insert(signPerception[tablePos],Percept);
    CheckAndPlaceItem(position(Posi[1],Posi[2],Posi[3]),DirToItemID(Dir));
end

function AddGrave(Posi,dText,eText,Type,Percept)
    local tablePos = Posi[1]..Posi[2]..Posi[3];
    PrepareTables(tablePos);
    table.insert(signCoo[tablePos],position(Posi[1],Posi[2],Posi[3]));
    table.insert(signTextDe[tablePos],dText);
    table.insert(signTextEn[tablePos],eText);
    table.insert(signPerception[tablePos],Percept);
    CheckAndPlaceItem(position(Posi[1],Posi[2],Posi[3]),DirToItemID(Type+10));
end

function AddPicture(Posi,dText,eText,Type,Percept)
    local tablePos = Posi[1]..Posi[2]..Posi[3];
    PrepareTables(tablePos);
    table.insert(signCoo[tablePos],position(Posi[1],Posi[2],Posi[3]));
    table.insert(signTextDe[tablePos],dText);
    table.insert(signTextEn[tablePos],eText);
    table.insert(signPerception[tablePos],Percept);
    CheckAndPlaceItem(position(Posi[1],Posi[2],Posi[3]),DirToItemID(Type+20));
end

function AddPennant(Posi,dText,eText,Type,Percept)
    local tablePos = Posi[1]..Posi[2]..Posi[3];
    PrepareTables(tablePos);
    table.insert(signCoo[tablePos],position(Posi[1],Posi[2],Posi[3]));
    table.insert(signTextDe[tablePos],dText);
    table.insert(signTextEn[tablePos],eText);
    table.insert(signPerception[tablePos],Percept);
    CheckAndPlaceItem(position(Posi[1],Posi[2],Posi[3]),DirToItemID(Type+30));
end

function AddTree(Posi,dText,eText,Type,Percept)
    local tablePos = Posi[1]..Posi[2]..Posi[3];
    PrepareTables(tablePos);
    table.insert(signCoo[tablePos],position(Posi[1],Posi[2],Posi[3]));
    table.insert(signTextDe[tablePos],dText);
    table.insert(signTextEn[tablePos],eText);
    table.insert(signPerception[tablePos],Percept);
    CheckAndPlaceItem(position(Posi[1],Posi[2],Posi[3]),DirToItemID(Type+40));
end

function AddPillar(Posi,dText,eText,Type,Percept)
    local tablePos = Posi[1]..Posi[2]..Posi[3];
    PrepareTables(tablePos);
    table.insert(signCoo[tablePos],position(Posi[1],Posi[2],Posi[3]));
    table.insert(signTextDe[tablePos],dText);
    table.insert(signTextEn[tablePos],eText);
    table.insert(signPerception[tablePos],Percept);
    CheckAndPlaceItem(position(Posi[1],Posi[2],Posi[3]),DirToItemID(Type+50));
end

function AddChimney(Posi,dText,eText,Type,Percept)
    local tablePos = Posi[1]..Posi[2]..Posi[3];
    PrepareTables(tablePos);
    table.insert(signCoo[tablePos],position(Posi[1],Posi[2],Posi[3]));
    table.insert(signTextDe[tablePos],dText);
    table.insert(signTextEn[tablePos],eText);
    table.insert(signPerception[tablePos],Percept);
    CheckAndPlaceItem(position(Posi[1],Posi[2],Posi[3]),DirToItemID(Type+60));
end

function AddMirror(Posi,dText,eText,Type,Percept)
    local tablePos = Posi[1]..Posi[2]..Posi[3];
    PrepareTables(tablePos);
    table.insert(signCoo[tablePos],position(Posi[1],Posi[2],Posi[3]));
    table.insert(signTextDe[tablePos],dText);
    table.insert(signTextEn[tablePos],eText);
    table.insert(signPerception[tablePos],Percept);
    CheckAndPlaceItem(position(Posi[1],Posi[2],Posi[3]),DirToItemID(Type+70));
end


function CheckAndPlaceItem(Posi,ItemID)
    if world:isItemOnField(Posi) then
        if ( world:getItemOnField(Posi).id ~= ItemID ) then
            world:createItemFromId(ItemID,1,Posi,true,333,0);
        end
    else
        world:createItemFromId(ItemID,1,Posi,true,333,0);
    end
end

function PrepareTables(TablePos)
    if (signCoo[TablePos] == nil) then
        signCoo[TablePos] = {};
        signTextDe[TablePos] = {};
        signTextEn[TablePos] = {};
        signPerception[TablePos] = {};
    end
end

-- DirToItemID converts item IDs into local type values for the Add functions to work with

function DirToItemID(Value)
    if (Value==0) then
        return 3081
    elseif (Value==2) then
        return 3084
    elseif (Value==4) then
        return 3082
    elseif (Value==6) then
        return 3083
    elseif (Value==11) then
        return 519
    elseif (Value==12) then
        return 521
    elseif (Value==13) then
        return 520
    elseif (Value==14) then
	    return 337
    elseif (Value==21) then
        return 1914
    elseif (Value==22) then
        return 1915
    elseif (Value==23) then
        return 264
    elseif (Value==24) then
        return 265
    elseif (Value==25) then
        return 748
    elseif (Value==26) then
        return 749
    elseif (Value==27) then
        return 750
    elseif (Value==28) then
        return 751
    elseif (Value==31) then
        return 2046
    elseif (Value==32) then
        return 2069
    elseif (Value==33) then
        return 512
    elseif (Value==34) then
        return 2924
    elseif (Value==35) then
        return 2925
    elseif (Value==36) then
        return 2926
    elseif (Value==37) then
        return 2927
    elseif (Value==41) then
        return 308
    elseif (Value==42) then
        return 586
    elseif (Value==43) then
        return 1804
    elseif (Value==44) then
        return 1807
    elseif (Value==45) then
        return 1808
    elseif (Value==46) then
        return 1809
    elseif (Value==47) then
        return 1817
    elseif (Value==51) then
        return 2805
    elseif (Value==52) then
        return 272
    elseif (Value==53) then
        return 692
    elseif (Value==54) then
        return 693
    elseif (Value==55) then
        return 694
    elseif (Value==56) then
        return 695
    elseif (Value==57) then
        return 440
    elseif (Value==58) then
        return 441
    elseif (Value==59) then
        return 442
    elseif (Value==60) then
        return 443
    elseif (Value==61) then
		return 268
	elseif (Value==62) then
		return 269
	elseif (Value==71) then
		return 2873
	elseif (Value==72) then
		return 2874
	end
end

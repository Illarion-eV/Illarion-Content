module("content.chimney", package.seeall)
--UNDER CONSTRUCTION by envi--
function InitChimey()
    signTextDe={};
    signTextEn={};
    signCoo={};
    signItemId={};
    signPerception={};

	--UPDATE common SET com_script="item/signpost.lua" WHERE com_itemid=245;

   	---------------- Chimneys ~ Kamine -------------
	-- AddChimney({X,Y,Z}, german text, english text, type, needed value of perception);
	-- types:
	-- 1 = facing south
	-- 2 = facing west
	
    --[[--Cadomyr
    AddChimney({142,601,1},"","", 1, 5); --flats
	AddChimney({146,623,0},"","", 2, 5); --flats
    AddChimney({140,554,0},"","", 2, 5); --library
    AddChimney({136,516,0},"","", 1, 5); --queens room
    AddChimney({94,552,0},"","", 1, 5); --room
    AddChimney({93,597,0},"","", 1, 5); --building
    AddChimney({104,615,0},"","", 2, 5); --building
    --Death Marsh
    AddChimney({795,347,0},"","", 1, 5);
	--Galmair
	AddChimney({309,227,1},"","", 1,5); --Irmoroms Temple
    AddChimney({301,269,0},"","", 1,5); --Villa 'Goldvein'
    AddChimney({359,233,0},"","", 1, 5); --Don's Council Chamber
    AddChimney({392,326,-6},"","", 2, 5); --The Winged Sow Tavern
	--Galmair Hinterlands
    AddChimney({419,348,0},"","", 2,5); --Miners club
    AddChimney({420,298,0},"","", 2,5); --Sleepy Bujhaar Inn
    AddChimney({427,292,-3},"","", 1,5); --Sleepy Bujhaar Inn
    AddChimney({419,289,1},"","", 1,5); --Sleepy Bujhaar Inn
    AddChimney({410,289,1},"","", 1,5); --Sleepy Bujhaar Inn
    AddChimney({416,296,1},"","", 1,5); --Sleepy Bujhaar Inn
    --Galmair Plateau
    AddChimney({326,366,1},"","", 2, 5);
    AddChimney({311,351,1},"","", 1, 5);
	--Runewick Harbour/Farm
	AddChimney({789,789,0},"","", 1, 5);
    --Runewick - Tower of Air
    AddChimney({894,828,4},"","", 1, 5);
    --Runewick - Tower of Earth
    AddChimney({956,835,0},"","", 2, 5) --Adron's barrel
    --Runewick - Tower of Fire
    AddChimney({902,764,1},"","", 2, 5);
    AddChimney({899,766,4},"","", 1, 5);
 	--Spider's Mouth
    AddChimney({705,311,1},"","", 2, 5); --The Hemp Necktie Inn
    AddChimney({705,323,1},"","", 2, 5); --The Hemp Necktie Inn
    AddChimney({711,320,0},"","", 2, 5); --The Hemp Necktie Inn]]--
    

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

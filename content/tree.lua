module("content.tree", package.seeall)
--UNDER CONSTRUCTION by envi--
function InitTree()
    signTextDe={};
    signTextEn={};
    signCoo={};
    signItemId={};
    signPerception={};

	--UPDATE common SET com_script="item/signpost.lua" WHERE com_itemid=245;

   
    ---------------- Bï¿½UME ----------------

    --AddTree({X,Y,Z},german text,english text, type, needed value of perception);
    --typs:
    -- 1 = fri tree
    -- 2 = cachdern tree
    -- 3 = naldor tree
    -- 4 = blooming ceridern
    -- 5 = ceridern tree
    -- 6 = eldan oak
    -- 7 = scandrel pine

    --Adron's Covert
    AddTree({734,764,0},"Zur Mitte, zum Saft, zack, zack!","To the middle, to the juice, zack, zack!", 6,5);
	AddTree({734,770,0},"Zur Mitte, zum Saft, zack, zack!","To the middle, to the juice, zack, zack!", 6,5);
	AddTree({754,764,0},"Zur Mitte, zum Saft, zack, zack!","To the middle, to the juice, zack, zack!", 6,5);
	AddTree({754,770,0},"Zur Mitte, zum Saft, zack, zack!","To the middle, to the juice, zack, zack!", 6,5);
	--[[--Bramus REst
	AddTree({752,378,0},"","", 1,5);
	--Gnuremground
	AddTree({578,708,0},"","", 1,5);
	AddTree({576,712,0},"","", 1,5);
	AddTree({568,714,0},"","", 1,5);
	AddTree({565,712,0},"","", 1,5);
	AddTree({564,710,0},"","", 3,5);
	--Irundar
	AddTree({286,546,0},"","", 6,5); --tree check!!!  ]]--
	--Oldra's Corner
	AddTree({653,681,0},"Ein sehr alt wirkender Baum, welcher alle Art von Früchten trägt, und dessen Zweige bis zur Sonne reichen.","A very old looking tree which carries all kind of fruits and leaves and reaches almost the sun with its branches.", 6,0);
	--Runewick Hinterland
	--AddTree({853,778,0},"","", 6,5); --Holy Oak
    AddTree({842,850,0},"Ein sehr alt wirkender Baum, welcher alle Art von Früchten trägt, und dessen Zweige bis zur Sonne reichen.","A very old looking tree which carries all kind of fruits and leaves and reaches almost the sun with its branches.", 6,0); --Oldra's Column
    AddTree({840,842,0},"Der Baum trägt eine Eingravierung welche eine stärkere, ältere Frau durch einen Garten gehend zeigt, gefolgt von mehreren Tieren, verschiedenster Art.","The tree bears an engraving which shows a stout and elder woman walking through a garden and followed by several animals of different kind.", 6,5); --Oldra's Column
	AddTree({834,843,0},"Der Baum enthält eine Gravur ~Wenn wir sterben, werden wir zu einem prachtvollen Gartentor gebracht, und wenn wir gut waren dürfen wir an diesem wunderbaren Ort leben und treffen dort all unsere Freunde wieder.~","The tree bears an engraving ~When we die, we will be brought to a big garden gate. Oldra stands at this gate, welcomes us, and if we have been good, we can enjoy the wonders of the never ending garden, and meet old and new friends in it.~", 2,5); --Oldra's Column
	AddTree({839,850,0},"Der Baum enthält eine Gravur ~Wenn wir sterben, werden wir zu einem prachtvollen Gartentor gebracht, und wenn wir gefehlt haben, wird uns eine Rast gestattet, dann werden wir unter neuem Namen wiedergeboren, um es besser zu machen.~","The tree bears an engraving ~When we die, we will be brought to a big garden gate. Oldra stands at this gate, welcomes us, and if we have failed, we are allowed a rest, and send back to be reborn with a new name to make a good sense of our life.~", 7,5); --Oldra's Column
	--Snakehead Coast
	AddTree({653,465,0},"Zwischen uns führt der Weg zur Finsternis.","The way to the Darkness starts between us.", 6,5);
	AddTree({647,465,0},"Zwischen uns führt der Weg zur Finsternis.","The way to the Darkness starts between us.", 6,5);
	AddTree({653,479,0},"Zwischen uns führt der Weg zum Licht.","The way to the Light starts between us.", 6,5);
	AddTree({647,479,0},"Zwischen uns führt der Weg zum Licht.","The way to the Light starts between us.", 6,5);
	--The Swamp
	--[[AddTree({501,107,0},"","", 6,5);]]--


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

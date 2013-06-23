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

    --AddTree({X,Y,Z},german name, english name, german text,english text, type, needed value of perception);
    --typs:
    -- 1 = fri tree
    -- 2 = cachdern tree
    -- 3 = naldor tree
    -- 4 = blooming ceridern
    -- 5 = ceridern tree
    -- 6 = eldan oak
    -- 7 = scandrel pine
    -- 8 = winter tree
    -- 9 = autum tree
    --10 = spring tree
    --11 = summer tree
    --12 = eldan seedling
 
    --Adron's Covert
	AddTree({734,764,0},nil,nil,"Zur Mitte, zum Saft, zack, zack!","To the middle, to the juice, chop, chop!", 6,5);
	AddTree({734,770,0},nil,nil,"Zur Mitte, zum Saft, zack, zack!","To the middle, to the juice, chop, chop!", 6,5);
	AddTree({754,764,0},nil,nil,"Zur Mitte, zum Saft, zack, zack!","To the middle, to the juice, chop, chop!", 6,5);
	AddTree({754,770,0},nil,nil,"Zur Mitte, zum Saft, zack, zack!","To the middle, to the juice, chop, chop!", 6,5);
	--[[--Bramus REst
	AddTree({752,378,0},nil,nil,"","", 1,5); ]]--
	--Galmair
	AddTree({376,288,0},"Der Schleimige Setzling","The Glutinous Seedling","Dieser Säumling verbreitet nicht nur einen üblen Geruch, sondern ist auch mit Schleim überzogen, welcher von ihm heruntertropft.","This seedling does not only bruits a bad smell but is also covered by slime, which drops down.", 12,0);
	--Gnuremground
--[[	AddTree({578,708,0},nil,nil,"","", 1,5);
	AddTree({576,712,0},nil,nil,"","", 1,5);
	AddTree({568,714,0},nil,nil,"","", 1,5);
	AddTree({565,712,0},nil,nil,"","", 1,5);
	AddTree({564,710,0},nil,nil,"","", 3,5);
	--Irundar
	AddTree({286,546,0},nil,nil,"","", 6,5); --tree check!!!  ]]--
	--Oldra's Corner
	AddTree({653,681,0},nil,nil,"Ein sehr alt wirkender Baum, welcher alle Art von Früchten trägt, und dessen Zweige bis zur Sonne reichen.","A very old looking tree carries all kinds of fruit and leaves and almost reaches the sun with it's branches.", 6,0);
	--Runewick Hinterland
	--AddTree({853,778,0},nil,nil,"","", 9,5); --Holy Oak
    AddTree({842,850,0},nil,nil,"Ein sehr alt wirkender Baum, welcher alle Art von Früchten trägt, und dessen Zweige bis zur Sonne reichen.","A very old looking tree carries all kinds of fruit and leaves and almost reaches the sun with it's branches.", 8,0); --Oldra's Column
    AddTree({840,842,0},nil,nil,"Der Baum trägt eine Eingravierung welche eine stärkere, ältere Frau durch einen Garten gehend zeigt, gefolgt von mehreren Tieren, verschiedenster Art.","The tree bears an engraving which shows a stout, elderly woman walking through a garden, followed by several animals of different kinds.", 11,5); --Oldra's Column
	AddTree({834,843,0},nil,nil,"Der Baum enthält eine Gravur ~Wenn wir sterben, werden wir zu einem prachtvollen Gartentor gebracht, und wenn wir gut waren dürfen wir an diesem wunderbaren Ort leben und treffen dort all unsere Freunde wieder.~","The tree bears an engraving ~When we die, we will be brought to a big garden gate. Oldra stands at this gate, welcomes us, and if we have been good, we can enjoy the wonders of the never ending garden, meeting old and new friends in it.~", 2,5); --Oldra's Column
	AddTree({839,850,0},nil,nil,"Der Baum enthält eine Gravur ~Wenn wir sterben, werden wir zu einem prachtvollen Gartentor gebracht, und wenn wir gefehlt haben, wird uns eine Rast gestattet, dann werden wir unter neuem Namen wiedergeboren, um es besser zu machen.~","The tree bears an engraving ~When we die, we will be brought to a big garden gate. Oldra stands at this gate, welcomes us, and if we have failed, we are allowed a rest before we are sent back to be reborn with a new name to make good use of our life.~", 7,5); --Oldra's Column
	--Snakehead Coast
	AddTree({653,465,0},nil,nil,"Zwischen uns führt der Weg zur Finsternis.","The way to the Darkness starts between us.", 6,5);
	AddTree({647,465,0},nil,nil,"Zwischen uns führt der Weg zur Finsternis.","The way to the Darkness starts between us.", 6,5);
	AddTree({653,479,0},nil,nil,"Zwischen uns führt der Weg zum Licht.","The way to the Light starts between us.", 6,5);
	AddTree({647,479,0},nil,nil,"Zwischen uns führt der Weg zum Licht.","The way to the Light starts between us.", 6,5);
	--The Swamp
	--[[AddTree({501,107,0},nil,nil,"","", 6,5);]]--


end

function AddTree(Posi,dName,eName,dText,eText,Type,Percept)
    local tablePos = tostring(Posi[1]).." "..tostring(Posi[2]).." "..tostring(Posi[3]);
    PrepareTables(tablePos);
    table.insert(signCoo[tablePos],position(Posi[1],Posi[2],Posi[3]));
    table.insert(signNameDe[tablePos],dName)
	table.insert(signNameEn[tablePos],eName)
	table.insert(signTextDe[tablePos],dText);
    table.insert(signTextEn[tablePos],eText);
    table.insert(signPerception[tablePos],Percept);
    CheckAndPlaceItem(position(Posi[1],Posi[2],Posi[3]),DirToItemID((Type+30)));
end


function CheckAndPlaceItem(Posi,ItemID)
    local tree
	if world:isItemOnField(Posi) then
        if ( world:getItemOnField(Posi).id ~= ItemID ) then
            tree = world:createItemFromId(ItemID,1,Posi,true,333,nil);
        end
    else
        tree = world:createItemFromId(ItemID,1,Posi,true,333,nil);
    end
	if tree then
		tree.wear = 255
		world:changeItem(tree)
	end
end

function PrepareTables(TablePos)
    if (signCoo[TablePos] == nil) then
        signCoo[TablePos] = {};
        signNameDe[TablePos] = {};
		signNameEn[TablePos] = {};
		signTextDe[TablePos] = {};
        signTextEn[TablePos] = {};
        signPerception[TablePos] = {};
    end
end

-- DirToItemID converts item IDs into local type values for the Add functions to work with

function DirToItemID(Value)
    if (Value==31) then
        return 308
    elseif (Value==32) then
        return 586
    elseif (Value==33) then
        return 1804
    elseif (Value==34) then
        return 1807
    elseif (Value==35) then
        return 1808
    elseif (Value==36) then
        return 1809
    elseif (Value==37) then
        return 1817
    elseif (Value==38) then
	return 960
    elseif (Value==39) then
	return 961
    elseif (Value==40) then
	return 962
    elseif (Value==41) then
	return 963
    elseif (Value==42) then
	return 589
	end
end

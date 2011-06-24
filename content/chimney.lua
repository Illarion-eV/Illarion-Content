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


function AddChimney(Posi,dText,eText,Type,Percept)
    local tablePos = Posi[1]..Posi[2]..Posi[3];
    PrepareTables(tablePos);
    table.insert(signCoo[tablePos],position(Posi[1],Posi[2],Posi[3]));
    table.insert(signTextDe[tablePos],dText);
    table.insert(signTextEn[tablePos],eText);
    table.insert(signPerception[tablePos],Percept);
    CheckAndPlaceItem(position(Posi[1],Posi[2],Posi[3]),DirToItemID(Type+60));
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
    if (Value==61) then
		return 268
	elseif (Value==62) then
		return 269
	end
end

--Flames on the Runewick bridges
--Flux

require("base.common")

module("triggerfield.runewick_bridges", package.seeall)

function MoveToField( User )
	
	local displacement,xpos,ypos;
	for displacement = 1, 28, 3 do
		for xpos = 909, 911, 1 do
			for ypos = 760, 765, 1 do
				if Char.pos == position(xpos+displacement,ypos,1) then

							local testthing = 910+displacement;

							local pillar1 = world:getField(position(testthing, 760,1));
							local flame1 = pillar1:getStackItem(pillar1:countItems()-1);
							local pillar2 = world:getField(position(testthing, 765,1));
							local flame2 = pillar2:getStackItem(pillar2:countItems()-1);

							if flame1.id == 2805 then
								local newflame = world:createItemFromId(359,1,position(testthing,760,1),true,333,nil);
								newflame.wear = 2;
								world:changeItem(newflame);
							end;

							if flame2.id == 2805 then
								local newflame = world:createItemFromId(359,1,position(testthing,765,1),true,333,nil);
								newflame.wear = 1;
								world:changeItem(newflame);
							end;


				end;

			end;
		end;
	end;
 
end

-- INSERT INTO triggerfields VALUES (909,760,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (909,761,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (909,762,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (909,763,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (909,764,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (909,765,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (910,760,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (910,761,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (910,762,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (910,763,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (910,764,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (910,765,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (911,760,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (911,761,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (911,762,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (911,763,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (911,764,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (911,765,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (912,760,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (912,761,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (912,762,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (912,763,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (912,764,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (912,765,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (913,760,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (913,761,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (913,762,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (913,763,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (913,764,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (913,765,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (914,760,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (914,761,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (914,762,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (914,763,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (914,764,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (914,765,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (915,760,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (915,761,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (915,762,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (915,763,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (915,764,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (915,765,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (916,760,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (916,761,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (916,762,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (916,763,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (916,764,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (916,765,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (917,760,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (917,761,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (917,762,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (917,763,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (917,764,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (917,765,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (918,760,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (918,761,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (918,762,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (918,763,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (918,764,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (918,765,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (919,760,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (919,761,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (919,762,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (919,763,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (919,764,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (919,765,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (920,760,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (920,761,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (920,762,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (920,763,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (920,764,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (920,765,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (921,760,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (921,761,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (921,762,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (921,763,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (921,764,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (921,765,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (922,760,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (922,761,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (922,762,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (922,763,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (922,764,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (922,765,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (923,760,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (923,761,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (923,762,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (923,763,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (923,764,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (923,765,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (924,760,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (924,761,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (924,762,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (924,763,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (924,764,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (924,765,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (925,760,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (925,761,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (925,762,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (925,763,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (925,764,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (925,765,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (926,760,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (926,761,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (926,762,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (926,763,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (926,764,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (926,765,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (927,760,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (927,761,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (927,762,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (927,763,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (927,764,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (927,765,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (928,760,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (928,761,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (928,762,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (928,763,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (928,764,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (928,765,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (929,760,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (929,761,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (929,762,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (929,763,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (929,764,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (929,765,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (930,760,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (930,761,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (930,762,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (930,763,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (930,764,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (930,765,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (931,760,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (931,761,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (931,762,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (931,763,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (931,764,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (931,765,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (932,760,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (932,761,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (932,762,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (932,763,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (932,764,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (932,765,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (933,760,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (933,761,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (933,762,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (933,763,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (933,764,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (933,765,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (934,760,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (934,761,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (934,762,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (934,763,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (934,764,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (934,765,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (935,760,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (935,761,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (935,762,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (935,763,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (935,764,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (935,765,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (936,760,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (936,761,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (936,762,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (936,763,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (936,764,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (936,765,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (937,760,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (937,761,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (937,762,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (937,763,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (937,764,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (937,765,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (938,760,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (938,761,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (938,762,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (938,763,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (938,764,1,'triggerfield.runewick_bridges');
-- INSERT INTO triggerfields VALUES (938,765,1,'triggerfield.runewick_bridges');
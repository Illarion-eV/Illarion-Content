--Flames on the Runewick bridges
--Flux

require("base.common")

module("triggerfield.runewick_bridges", package.seeall)

function MoveToField( User )
	

	for displacement = 0, 27, 3 do
		for xpos = 909, 911, 1 do
			for ypos = 760, 765, 1 do
				if User.pos == position(xpos+displacement,ypos,1) then

					User.Char:inform("Test");
					local pillar1 = world:getField(position(910+displacement, 760,1));
					local flame1 = pillar1:getStackItem(pillar1:countItems());
					local pillar2 = world:getField(position(910+displacement, 765,1));
					local flame2 = pillar2:getStackItem(pillar2:countItems());

					if pillar1.id == 2805 then
						local newflame = world:createItemFromId(259,1,position(910+displacement,760,1),true,333);
						newflame.wear = 1;
					end;

					if pillar2.id == 2805 then
						local newflame = world:createItemFromId(259,1,position(910+displacement,765,1),true,333);
						newflame.wear = 1;
					end;

				end;

			end;
		end;
	end;
 
end

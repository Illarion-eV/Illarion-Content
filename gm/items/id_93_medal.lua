
-- UPDATE common SET com_script='gm.items.id_93_medal' WHERE com_itemid=93;

require("base.common")
module("gm.items.id_93_medal", package.seeall)

function UseItemWithField(User,SourceItem, TargetPos, Counter, Param)

	--Additions to circumvent the absence of the counter

	local a, _, number = string.find(User.lastSpokenText, "(%d+)");
    if number then
	    Counter = 1 * number;
	else
	counter=1;
	end
	
	--Additions end

    if (SourceItem.data==0) then --monster
	    User:inform("#w Creating monster with ID "..Counter);
        world:createMonster(Counter,TargetPos,20);
    elseif (SourceItem.data==1) then --monster
	    User:inform("#w Creating monster with ID "..Counter+250);
	    world:createMonster(Counter+250,TargetPos,20);
    elseif (SourceItem.data==2) then --monster
		User:inform("#w Creating monster with ID "..Counter+500);
        world:createMonster(Counter+500,TargetPos,20);
    elseif (SourceItem.data==3) then --GFX
		world:gfx(Counter,TargetPos);
    elseif (SourceItem.data==4) then --SFX
        world:makeSound(Counter,TargetPos);
    elseif (SourceItem.data==5) then --Avatar change
		User:setAttrib("racetyp",Counter);
    elseif (SourceItem.data==6) then
	    User:setHair(Counter);
	elseif (SourceItem.data==7) then
        User:setBeard(Counter);	
	
	--Additions for the destruction of Gobaith

	elseif (SourceItem.data==8) then --flood

		world:makeSound(27,TargetPos); --SFX 27 (wind)

		location={}; --Affected positions
		location[1]=position(TargetPos.x-1,TargetPos.y-1,TargetPos.z);
		location[2]=position(TargetPos.x-1,TargetPos.y,TargetPos.z);
		location[3]=position(TargetPos.x-1,TargetPos.y+1,TargetPos.z);
		location[4]=position(TargetPos.x,TargetPos.y-1,TargetPos.z);
		location[5]=position(TargetPos.x,TargetPos.y,TargetPos.z);
		location[6]=position(TargetPos.x,TargetPos.y+1,TargetPos.z);
		location[7]=position(TargetPos.x+1,TargetPos.y-1,TargetPos.z);
		location[8]=position(TargetPos.x+1,TargetPos.y,TargetPos.z);
		location[9]=position(TargetPos.x+1,TargetPos.y+1,TargetPos.z);

		rocks={1246, 915, 1245, 1254, 232, 233, 914, 1265, 1273, 1257, 1276, 1278, 1250, 1251};

		for i=1,table.getn(location) do

			if world:isCharacterOnField(location[i]) then --Is there a char on the field?
				theChar=world:getCharacterOnField(location[i]);
				if not theChar:isAdmin() then --GMs remain where they are
					theChar:increaseAttrib("hitpoints",-10000); -- PWNED
				    theChar:warp(position(0,0,0)); -- Warp him to the origin
				end
			end

			while world:isItemOnField(location[i]) do --delete all items
				theItem=world:getItemOnField(location[i]);
				world:erase(theItem,1);
			end

			world:changeTile(6,location[i]); --change to water
			
			if math.random(1,20)==1 then --5% chance for a rock
				zufall=math.random(1,table.getn(rocks));
				world:createItemFromId(rocks[zufall],1,location[i],true,333,0);
			end

		end --all tiles affected
		world:sendMapUpdate(TargetPos,30);
		
	elseif (SourceItem.data==8) then --earthquake

		world:makeSound(5,TargetPos); --SFX 5 (BOOOM)

		location={}; --Affected positions
		location[1]=position(TargetPos.x-1,TargetPos.y-1,TargetPos.z);
		location[2]=position(TargetPos.x-1,TargetPos.y,TargetPos.z);
		location[3]=position(TargetPos.x-1,TargetPos.y+1,TargetPos.z);
		location[4]=position(TargetPos.x,TargetPos.y-1,TargetPos.z);
		location[5]=position(TargetPos.x,TargetPos.y,TargetPos.z);
		location[6]=position(TargetPos.x,TargetPos.y+1,TargetPos.z);
		location[7]=position(TargetPos.x+1,TargetPos.y-1,TargetPos.z);
		location[8]=position(TargetPos.x+1,TargetPos.y,TargetPos.z);
		location[9]=position(TargetPos.x+1,TargetPos.y+1,TargetPos.z);

		rocks={1246, 915, 1245, 1254, 232, 233, 914, 1265, 1273, 1257, 1276, 1278, 1250, 1251};

		for i=1,table.getn(location) do

			if world:isCharacterOnField(location[i]) then --Is there a char on the field?
				theChar=world:getCharacterOnField(location[i]);
				if not theChar:isAdmin() then --GMs remain where they are
					theChar:increaseAttrib("hitpoints",-10000); -- PWNED
				    theChar:warp(position(0,0,0)); -- Warp him to the origin
				end
			end

			if not world:isItemOnField(location[i]) then --empty tile?
				zufall=math.random(1,table.getn(rocks));
				world:createItemFromId(rocks[zufall],1,location[i],true,333,0); --spawn a rock
			end

		end --all tiles affected

	elseif (SourceItem.data==10) then --thunderstorm

		world:makeSound(4,TargetPos); --SFX 4 (Thunder)

		location={}; --Affected positions
		location[1]=position(TargetPos.x-9,TargetPos.y-1,TargetPos.z);
		location[2]=position(TargetPos.x-7,TargetPos.y+7,TargetPos.z);
		location[3]=position(TargetPos.x-5,TargetPos.y+3,TargetPos.z);
		location[4]=position(TargetPos.x-3,TargetPos.y-5,TargetPos.z);
		location[5]=position(TargetPos.x-1,TargetPos.y-1,TargetPos.z);
		location[6]=position(TargetPos.x+2,TargetPos.y+4,TargetPos.z);
		location[7]=position(TargetPos.x+4,TargetPos.y-3,TargetPos.z);
		location[8]=position(TargetPos.x+6,TargetPos.y-8,TargetPos.z);
		location[9]=position(TargetPos.x+8,TargetPos.y+5,TargetPos.z);
		location[10]=position(TargetPos.x+10,TargetPos.y+7,TargetPos.z);

		for i=1,table.getn(location) do

			if not world:isItemOnField(location[i]) then --only empty "outside" tiles!

				world:gfx(2,location[i]); --FLASH, ahaaaa...

				if world:isCharacterOnField(location[i]) then --Is there a char on the field?
					theChar=world:getCharacterOnField(location[i]);
					if not theChar:isAdmin() then --GMs are unaffected
						theChar:increaseAttrib("hitpoints",-4999); -- 4999 damage OMG LOL
					end
				end
			end
		end --all tiles affected

	elseif (SourceItem.data==11) then --meteor shower

		world:makeSound(5,TargetPos); --SFX 5 (BOOOM)
		world:gfx(9,TargetPos);
				
		location={}; --Affected positions
		location[1]=position(TargetPos.x-1,TargetPos.y-1,TargetPos.z);
		location[2]=position(TargetPos.x-1,TargetPos.y,TargetPos.z);
		location[3]=position(TargetPos.x-1,TargetPos.y+1,TargetPos.z);
		location[4]=position(TargetPos.x,TargetPos.y-1,TargetPos.z);
		location[5]=position(TargetPos.x,TargetPos.y,TargetPos.z);
		location[6]=position(TargetPos.x,TargetPos.y+1,TargetPos.z);
		location[7]=position(TargetPos.x+1,TargetPos.y-1,TargetPos.z);
		location[8]=position(TargetPos.x+1,TargetPos.y,TargetPos.z);
		location[9]=position(TargetPos.x+1,TargetPos.y+1,TargetPos.z);

		rocks={1246, 915, 1245, 1254, 232, 233, 914, 1265, 1273, 1257, 1276, 1278, 1250, 1251};

		for i=1,table.getn(location) do

			if world:isCharacterOnField(location[i]) then --Is there a char on the field?
				theChar=world:getCharacterOnField(location[i]);
				if not theChar:isAdmin() then --GMs remain where they are
					theChar:increaseAttrib("hitpoints",-10000); -- PWNED
				    theChar:warp(position(0,0,0)); -- Warp him to the origin
				end
			end

			while world:isItemOnField(location[i]) do --delete all items
				theItem=world:getItemOnField(location[i]);
				world:erase(theItem,1);
			end

			world:changeTile(5,location[i]); --change to lava

		end --all tiles affected

		world:changeTile(2,TargetPos); --change to rock
		zufall=math.random(1,table.getn(rocks));
		world:createItemFromId(rocks[zufall],1,TargetPos,true,333,0); --spawn a rock
		world:sendMapUpdate(TargetPos,30);
		
		flames={}; --Affected positions
		flames[1]=position(TargetPos.x-10,TargetPos.y-2,TargetPos.z);
		flames[2]=position(TargetPos.x-8,TargetPos.y+6,TargetPos.z);
		flames[3]=position(TargetPos.x-6,TargetPos.y+4,TargetPos.z);
		flames[4]=position(TargetPos.x-4,TargetPos.y-7,TargetPos.z);
		flames[5]=position(TargetPos.x-2,TargetPos.y-3,TargetPos.z);
		flames[6]=position(TargetPos.x+1,TargetPos.y+4,TargetPos.z);
		flames[7]=position(TargetPos.x+3,TargetPos.y-5,TargetPos.z);
		flames[8]=position(TargetPos.x+5,TargetPos.y-9,TargetPos.z);
		flames[9]=position(TargetPos.x+7,TargetPos.y+6,TargetPos.z);
		flames[10]=position(TargetPos.x+9,TargetPos.y+8,TargetPos.z);

		for i=1,table.getn(flames) do

			if not world:isItemOnField(flames[i]) then --only empty "outside" tiles!

				world:createItemFromId(359,1,flames[i],true,999,0); --spawn a flame
				theItem=world:getItemOnField(flames[i]);

				if theItem.id==359 then --only flames!

					theItem.wear = 254; --last, like, forever
					world:changeItem(theItem); --changing!

				end
			end
		end --all tiles affected

	--Additions end

	else
        User:inform("Data 0;1;2 : Monsters - Data 3 : GFX - Data 4: SFX - Data 5: Race change - Data 6: hair change - Data 7: beard change - Data 8-11: Disasters");
    end
end 

function UseItem(User,SourceItem,TargetItem,Counter,Param)
    frontItem = base.common.GetFrontItem( User );
	myString = User.lastSpokenText
	lengthString = string.len(myString)
	cutString= string.sub (myString, 1, 7)
	if (cutString == "getwear") then
	    User:inform("wear of front item is "..frontItem.wear)
	elseif (cutString == "setwear") then
            newWear = tonumber(string.sub(mystring,9,lengthString))
			frontItem.wear = newWear
			world:changeItem(frontItem)
	        User:inform("set wear of front item to "..newWear)
	end		
	UseItemWithField(User,SourceItem,base.common.GetFrontPosition(User),Counter,Param);
end
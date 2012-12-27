
-- UPDATE common SET com_script='gm.items.id_93_medal' WHERE com_itemid=93;

require("base.common")
module("gm.items.id_93_medal", package.seeall)

function UseItemWithField(User,SourceItem, TargetPos, Counter, Param)

	-- First check for mode change
	if (string.find(User.lastSpokenText, "setmode")~=nil) then
		local modes = {"Monster", "GFX", "SFX", "Avatar changes", "Disasters"}
		local cbSetMode = function (dialog)
			if (not dialog:getSuccess()) then
				return;
			end
			SourceItem:setData("mode", modes[dialog:getSelectedIndex()+1]);
			world:changeItem(SourceItem);
		end
		local sd = SelectionDialog("Set the mode of this medal.", "To which mode do you want to change it?", cbSetMode);
		for _,m in ipairs(modes) do 
			sd:addOption(0,m);
		end
		User:requestSelectionDialog(sd);
		return;
	end

	if (string.find(User.lastSpokenText, "help")) then
		User:inform("To change the mode of this medal, say \"setmode\" and use it.");
	end
	
	--Additions to circumvent the absence of the counter

	local a, _, number = string.find(User.lastSpokenText, "(%d+)");
    if number then
	    Counter = 1 * number;
	else
		counter=1;
	end
	
	--Additions end
	
	if (SourceItem:getData("mode")=="Monster") then
	    User:inform("Creating monster with ID "..Counter);
        world:createMonster(Counter+500,TargetPos,20);
		
	elseif (SourceItem:getData("mode")=="GFX") then
		world:gfx(Counter,TargetPos);
		
	elseif (SourceItem:getData("mode")=="SFX") then		
        world:makeSound(Counter,TargetPos);
		
	elseif (SourceItem:getData("mode")=="Avatar changes") then			
		local playersTmp = world:getPlayersInRangeOf(User.pos, 4);
		local players = {User};
		for _,player in pairs(playersTmp) do 
			if (player.id ~= User.id) then 
				table.insert(players, player);
			end
		end
			
		local cbChoosePlayer = function (dialog)
			if (not dialog:getSuccess()) then
				return;
			end
			local chosenPlayer = players[dialog:getSelectedIndex()+1];
			local cbInputDialog = function (dialog)
				local inputString = dialog:getInput();
				if (string.find(inputString,"(%a+) (%d+)") ~= nil) then
					a, b, modifier, id = string.find(inputString,"(%a+) (%d+)");
					id = tonumber(id);
					if modifier == "race" then
						chosenPlayer:setAttrib("racetyp",id);
					elseif modifier == "beard" then
						chosenPlayer:setBeard(id);
					elseif modifier == "hair" then
						chosenPlayer:setHair(id);
					end
				else
					User:inform("Sorry, I didn't understand you.");
					User:requestInputDialog(InputDialog("Change the appearance for the selected character.", "Usage: race <id>, beard <id>, hair <id>" ,false, 255, cbInputDialog))
				end
			end
			User:requestInputDialog(InputDialog("Change the appearance for the selected character.", "Usage: race <id>, beard <id>, hair <id>" ,false, 255, cbInputDialog))
		end
		--Dialog to choose the player
		local sdPlayer = SelectionDialog("Change the avatar of ...", "First choose a victim:", cbChoosePlayer);
		local raceNames = {"Human", "Dwarf", "Halfling", "Elf", "Orc", "Lizardman", "Other"}
        for _,player in ipairs(players) do 
			local race = math.min(player:getRace()+1, table.getn(raceNames));
			sdPlayer:addOption(0,player.name .. " (" .. raceNames[race] .. ") " .. player.id);
        end		
		User:requestSelectionDialog(sdPlayer);
		
	elseif (SourceItem:getData("mode")=="Disasters") then	
	--Additions for the destruction of Gobaith
		local cbDisasters = function (dialog)
			if (not dialog:getSuccess()) then
				return;
            end
            local index = dialog:getSelectedIndex();
			if (index == 1) then --flood

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
				
			elseif (index == 2) then --earthquake

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

			elseif (index == 3) then --thunderstorm

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

			elseif (index == 4) then --meteor shower

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
			elseif(index == 5) then
				User:inform("index 5 called successfully!")
			end
		end
		infoText = "Used for destroying Gobiath, so use with caution!"		
		local sd = SelectionDialog("Select Disaster:", infoText, cbDisasters);
		sd:addOption(0, "Flood");
		sd:addOption(0, "Earthquake");
		sd:addOption(0, "Thunderstorm");
		sd:addOption(0, "Meteor Shower");
		sd:addOption(0, "Test");
		User:requestSelectionDialog(sd);		
	else
        User:inform("To set a mode type 'setmode' and use the medal.");
    end
end 

function UseItem(User,SourceItem,TargetItem,Counter,Param)
    UseItemWithField(User,SourceItem,base.common.GetFrontPosition(User),Counter,Param);
end

function LookAtItem(User,Item)
    if (Item:getData("mode")=="Monster") then
		base.lookat.SetSpecialName(Item, "Medallie (Monster)","Medal (Monster)")
		base.lookat.SetSpecialDescription(Item, "Sag die Monster ID und lass den Spaß beginnen.", "Say the monster ID and let the fun begin.");
    elseif (Item:getData("mode")=="GFX") then
        base.lookat.SetSpecialName(Item, "Medallie (GFX)","Medal (GFX)");
		base.lookat.SetSpecialDescription(Item, "Sag die GFX ID und lass den Spaß beginnen.", "Say the GFX ID and let the fun begin.");
	elseif (Item:getData("mode")=="SFX") then
        base.lookat.SetSpecialName(Item, "Medallie (SFX)","Medal (SFX)");
		base.lookat.SetSpecialDescription(Item, "Sag die SFX ID und lass den Spaß beginnen.", "Say the SFX ID and let the fun begin.");
	elseif (Item:getData("mode")=="Avatar changes") then
        base.lookat.SetSpecialName(Item, "Medallie (Avatar Änderungen)","Medal (Avatar changes)");
		base.lookat.SetSpecialDescription(Item, "Ändert das Aussehen eines Charakters. Benutze die Medaille.", "Changes appearance of a character. Use the medal.");	
	elseif (Item:getData("mode")=="Disasters") then
        base.lookat.SetSpecialName(Item, "Medallie (Disaster)","Medal (Disasters)");
		base.lookat.SetSpecialDescription(Item, "Disaster!! Benutze die Medaille.", "Disasters!! Use the medal.");	
	else
		base.lookat.SetSpecialDescription(Item, "Um einen Modus zu setzen sage 'setmode' und benutzt die Medaille.", "To set a mode type 'setmode' and use the medal.");
        base.lookat.SetSpecialName(Item, "Medaille", "Medal");
    end
	world:itemInform(User,Item,base.lookat.GenerateLookAt(User, Item, base.lookat.METAL));
	
    for intx=User.pos.x-5,User.pos.x+5 do
        for inty=User.pos.y-5,User.pos.y+5 do
            if (world:isCharacterOnField(position(intx,inty,User.pos.z))==true) then
                TargetChar=world:getCharacterOnField(position(intx,inty,User.pos.z));
                User:introduce(TargetChar);
            end
        end
    end
end
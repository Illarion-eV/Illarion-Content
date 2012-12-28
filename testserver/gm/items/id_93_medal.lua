
-- UPDATE common SET com_script='gm.items.id_93_medal' WHERE com_itemid=93;

require("base.common")
module("gm.items.id_93_medal", package.seeall)

function UseItemWithField(User,SourceItem, TargetPos, Counter, Param)

	-- First check for mode change
	if (string.find(User.lastSpokenText, "setmode")~=nil) then
		local modes = {"Monster", "GFX", "SFX", "Avatar changes"}
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
        world:createMonster(Counter,TargetPos,20);
		
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
				if (string.find(inputString,"(%a+) (%d+) (%d+) (%d+)") ~= nil) then
					a, b, modifier, red, green, blue = string.find(inputString,"(%a+) (%d+) (%d+) (%d+)");
					red = tonumber(red);
					green = tonumber(green);
					blue = tonumber(blue);
					if modifier == "haircolor" then
						chosenPlayer:setHairColor(red, green, blue);
					elseif modifier == "skincolor" then
						chosenPlayer:setSkinColor(red, green, blue);
					end
				elseif (string.find(inputString,"(%a+) (%d+)") ~= nil) then
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
					User:requestInputDialog(InputDialog("Change the appearance for the selected character.", "Usage: race <id>, beard <id>, hair <id>, haircolor <red> <green> <blue>, skincolor <red> <green> <blue>" ,false, 255, cbInputDialog))
				end
			end
			User:requestInputDialog(InputDialog("Change the appearance for the selected character.", "Usage: race <id>, beard <id>, hair <id>, haircolor <red> <green> <blue>, skincolor <red> <green> <blue>" ,false, 255, cbInputDialog))
		end
		--Dialog to choose the player
		local sdPlayer = SelectionDialog("Change the avatar of ...", "First choose a victim:", cbChoosePlayer);
		local raceNames = {"Human", "Dwarf", "Halfling", "Elf", "Orc", "Lizardman", "Other"}
        for _,player in ipairs(players) do 
			local race = math.min(player:getRace()+1, table.getn(raceNames));
			sdPlayer:addOption(0,player.name .. " (" .. raceNames[race] .. ") " .. player.id);
        end		
		User:requestSelectionDialog(sdPlayer);		
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
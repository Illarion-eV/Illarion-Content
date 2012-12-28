--  I_99 Dietrich - Items loeschen, teleportation fuer GMs, tueren initialisieren

-- UPDATE common SET com_script='gm.items.id_99_lockpicks' WHERE com_itemid=99;

require("gm.base.log")
require("base.common")
require("item.id_x_tinderbox")

module("gm.items.id_99_lockpicks", package.seeall)

itemPos = {"Head","Neck","Breast","Hands","Left Tool","Right Tool",
	"Left Finger","Right Finger","Legs","Feet","Coat","Belt 1",
	"Belt 2","Belt 3","Belt 4","Belt 5","Belt 6"}
itemPos[0] = "Backpack"

Location={};
Coordina={};
Location[1]="Cadomyr Market";
Coordina[1]={130,600,0};
Location[2]="Galmair Castle";
Coordina[2]={360,230,0};
Location[3]="Galmair Town";
Coordina[3]={400,250,0};
Location[4]="Galmair South";
Coordina[4]={400,355,0};
Location[5]="Runewick Bridge";
Coordina[5]={844,822,0};
Location[6] = "Cadomyr Throne";
Coordina[6] = {120,545,0};
Location[7] = "Cadomyr Mine";
Coordina[7] = {130,700,0};
Location[8] = "Arena";
Coordina[8] = {600,400,0};
Location[9]="Runewick Market";
Coordina[9]={900,800,1};

function UseItem(User,SourceItem,TargetItem,Counter,Param,ltstate)
	
	-- First check for mode change
	if (string.find(User.lastSpokenText, "setmode")~=nil) then
		local modes = {"Eraser", "Teleport", "Char Info"}
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
		User:inform("To change the mode of these lockpicks, say \"setmode\" and use it.");
	end

	local frontChar = base.common.GetFrontCharacter(User);
	if frontChar then
		ShowCharInfo(User,frontChar);
	end
	
	if (SourceItem:getData("mode")=="Eraser") then	
	
		--get all the items the char has on him, with the stuff in the backpack
		local itemsOnChar = {};
		for i=17,0,-1 do 
			table.insert(itemsOnChar, User:getItemAt(i));
		end
					
		local cbChooseItem = function (dialog)
			if (not dialog:getSuccess()) then
				return;
            end
            local index = dialog:getSelectedIndex();
			if (index == 0) then 
				local frontitem = base.common.GetFrontItem(User);
				if frontitem~=nil then
					world:erase(frontitem,frontitem.number);
				end
			else
				local chosenItem = itemsOnChar[dialog:getSelectedIndex()]
				world:erase(chosenItem,chosenItem.number);
			end
		end			
		local sdItems = SelectionDialog("Erase items.", "Choose the item you wish to erase:", cbChooseItem);
		sdItems:addOption(0,"Front of char");
        for _,item in ipairs(itemsOnChar) do 
			local itemName = world:getItemName(item.id,1) -- only english names folks
			sdItems:addOption(0,itemName .. " (" .. itemPos[item.itempos] .. ") Count: ".. item.number);
        end	
		User:requestSelectionDialog(sdItems);
		
	elseif (SourceItem:getData("mode")=="Teleport") then 	
		local cbChooseLocation = function (dialog)
			if (not dialog:getSuccess()) then
				return;
            end
            local index = dialog:getSelectedIndex()+1;
			User:warp(position(Coordina[index][1],Coordina[index][2],Coordina[index][3]))
		end
		local sdTeleport = SelectionDialog("Erase items.", "Choose the item you wish to erase:", cbChooseLocation);
        for i=1, #(Location) do 
			sdTeleport:addOption(0,Location[i] .. " (" .. Coordina[i][1]..", "..Coordina[i][2]..", "..Coordina[i][3] .. ")");
        end	
		User:requestSelectionDialog(sdTeleport);
		
	elseif (SourceItem:getData("mode")=="Char Info") then
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
			local mDialog = MessageDialog("Character Info for "..chosenPlayer.name, "HP: "..chosenPlayer:increaseAttrib("hitpoints", 0).." MP: "..chosenPlayer:increaseAttrib("mana", 0)..
							"\nSTR: "..chosenPlayer:increaseAttrib("strength", 0).." CONST: "..chosenPlayer:increaseAttrib("constitution", 0).." DEX: "..chosenPlayer:increaseAttrib("dexterity", 0)..
							"\nAGI: "..chosenPlayer:increaseAttrib("agility", 0).." WIL: "..chosenPlayer:increaseAttrib("willpower", 0).." PERC: "..chosenPlayer:increaseAttrib("perception", 0).." ESS: "..User:increaseAttrib("essence", 0)..
							"\nMental Capacity: "..tostring(chosenPlayer:getMentalCapacity())..
							"\nIdle for [s]: "..tostring(chosenPlayer:idleTime()), cbChoosePlayer)
			User:requestMessageDialog(mDialog)
		end
			--Dialog to choose the player
		local sdPlayer = SelectionDialog("Change the avatar of ...", "First choose a victim:", cbChoosePlayer);
		local raceNames = {"Human", "Dwarf", "Halfling", "Elf", "Orc", "Lizardman", "Other"}
        for _,player in ipairs(players) do 
			local race = math.min(player:getRace()+1, table.getn(raceNames));
			sdPlayer:addOption(0,player.name .. " (" .. raceNames[race] .. ") " .. player.id);
        end		
		User:requestSelectionDialog(sdPlayer);
	end	-- end of modes
		
	--[[if (string.find(User.lastSpokenText,"show position")~=nil) then
		ShowPosition(User);
	elseif (string.find(User.lastSpokenText,"show locations")~=nil) then
		local out = "";
		for _,s in pairs(Location) do
			out = out .. s .. " -- ";
		end
		User:inform(out);
	elseif (string.find(User.lastSpokenText,"tinderbox")~=nil) then
		item.id_x_tinderbox.UseItem(User,SourceItem,TargetItem,Counter,Param,ltstate);
	elseif (string.find(User.lastSpokenText,"waypoint")~=nil) then
		local fileName = "default";
		local s,n = string.gsub(User.lastSpokenText,"waypoint ","");
		if s~="" and n>0 then
			fileName = s;
		end
		local file,errmsg = io.open("/home/pharse/waypoints/"..fileName,"a");
		if file then
			if wMenu==nil then
				wMenu = MenuStruct();
				wMenu:addItem(505);
				wMenu:addItem(228);
				wMenu:addItem(43);
				wMenu:addItem(390);
				wMenu:addItem(391);
				wpLight = nil;
				wpWait = false;
			end
			if Param==505 then
				file:write("Waypoint:new(position("..User.pos.x ..","..User.pos.y ..","..User.pos.z .."),PLACE");
				if wpWait then
					file:write(","..User:getFaceTo());
				end
				if wpLight then
					file:write(",Light:new(position("..wpLight.pos.x ..","..wpLight.pos.y .. ","..wpLight.pos.z .."),"..wpLight.id ..")");
				end
				file:write(");\n");
				file:close();
				wpWait = nil;
				wpLight = nil;
				User:inform("waypoint added");
			elseif Param==228 then
				wpWait = not wpWait;
				User:inform("waiting point: ".. (wpWait and "true" or "false"));
			elseif Param~= 0 then
				if wpLight and wpLight.id==Param then
					wpLight = nil;
					User:inform("light: false");
				else
					wpLight = {["id"]=Param, ["pos"]=base.common.CopyPosition(User.pos)};
					User:inform("light: true");
				end
			end
			User:sendMenu(wMenu);
		else
			User:inform("file not found");
		end
	elseif (string.find(User.lastSpokenText,"book")~=nil) then
		User:sendBook(1); -- testbook
		User:inform("testbook");
	elseif (string.find(User.lastSpokenText,"animation")~=nil) then
		if (string.find(User.lastSpokenText,"attack2")~=nil) then
			User:performAnimation(6); -- 6, 7(bow), 
		elseif (string.find(User.lastSpokenText,"attack")~=nil) then
			User:performAnimation(5); -- 6, 7(bow), 
		elseif (string.find(User.lastSpokenText,"bow")~=nil) then
			User:performAnimation(7); -- 6, 7(bow), 
		elseif (string.find(User.lastSpokenText,"cast")~=nil) then
			User:performAnimation(11); -- 6, 7(bow), 
		elseif (string.find(User.lastSpokenText,"smith")~=nil) then
			User:performAnimation(14);
		end
	elseif (string.find(User.lastSpokenText,"attributes")~=nil) then
		User:inform("STR: "..User:increaseAttrib("strength", 0).." CONST: "..User:increaseAttrib("constitution", 0).." DEX: "..User:increaseAttrib("dexterity", 0).." AGI: "..User:increaseAttrib("agility", 0).." WIL: "..User:increaseAttrib("willpower", 0).." PERC: "..User:increaseAttrib("perception", 0).." ESS: "..User:increaseAttrib("essence", 0));
 	elseif (string.find(User.lastSpokenText,"npc")~=nil) then
	    -- equip NPC
	    
        bodyM={4, 101, 180, 181, 182, 2402, 2360, 457, 458, 807, 808, 809, 810, 811, 812, 813, 814,815,816,817,818,819,820};
        bodyF={385,800,801,802,803,804,805,806,833,834,835,836,837,838,845,846,847,848,849,850,851,852};
        feet={52, 369, 326, 699};
        legs={183, 459, 460, 461, 825, 2111,366};
        head={7,16, 94, 187, 357, 358};
        hand1={1, 65, 74, 76, 122, 74, 124, 192, 296, 2626, 24,39};
        hand2={17, 96,15,21};
        coat={55, 193, 194, 195, 196, 368, 2377, 2416,2419, 2421, 547, 548, 558, };

        posList={position(790,5,0),position(44,63,97),position(780,5,0),position(720,10,0),position(730,10,0),
                 position(725,10,0),position(720,15,0),position(700,10,0),position(700,5,0),position(710,15,0),
                 position(700,15,0),position(800,10,0),position(760,10,0),position(765,10,0),position(780,10,0),
                 position(795,10,0),position(750,10,0),position(790,10,0),position(785,10,0),position(770,10,0),
                 position(775,10,0),position(720,5,0),position(715,10,0),position(755,10,0),position(705,5,0),
                 position(710,5,0),position(710,10,0),position(795,5,0),position(800,5,0),position(735,10,0),
                 position(43,34,50),position(785,5,0),position(10,6,30),position(-371,74,0),position(38,21,100),
                 position(37,81,100),position(48,96,100),position(66,36,101),position(42,49,100),
                 position(120,103,100),position(168,19,100),position(169,108,100),position(68,62,100),
                 position(49,49,100),position(112,63,100),position(110,103,100),position(120,160,100),
                 position(112,171,100),position(715,5,0),position(775,5,0),position(745,10,0),position(725,15,0),
                 position(75,80,100),position(44,67,50),position(-489,-488,-40),position(119,601,0),position(124,581,0),
                 position(123,549,0),position(404,263,1),position(705,10,0),position(133,581,0),position(119,594,0),
                 position(110,574,0),position(134,590,0),position(113,599,0),position(112,596,0),position(439,359,0),
                 position(392,160,-3),position(920,659,0),position(791,798,0),position(832,107,0),position(359,692,0),
                 position(783,462,0),position(46,686,0),position(108,585,0),position(131,585,0),position(740,400,0),
                 position(403,282,0),position(500,505,0),position(720,175,0),position(892,761,0),position(401,242,1),
                 position(900,768,0),position(787,795,0),position(374,216,0),position(126,575,0),position(119,590,0),
                 position(387,261,0),position(388,336,0),position(375,251,0),position(707,484,0),position(642,456,0),
                 position(130,624,0),position(912,813,1),position(907,804,0),position(907,794,1),position(358,235,0),
                 position(898,775,2),position(883,634,0),position(893,799,1),position(897,794,1),position(896,816,1),
                 position(911,798,1),position(377,266,0),position(784,772,0),position(136,625,0)};

	    
	    for i, npcPos in pairs(posList) do
    	    if world:isCharacterOnField(npcPos) then
                theNPC=world:getCharacterOnField(npcPos);
                
                if string.find(theNPC.name,"a ")~=nil then
                    bodyIt=bodyF[math.random(# bodyF)]
                else
                    bodyIt=bodyM[math.random(# bodyM)]
                end
                
    	       -- User:inform("now assigning stuff");
    	        --bodyIt=body[math.random(# body)]
    	        feetIt=feet[math.random(# feet)]
    	        legIt=legs[math.random(# legs)]
                
                if theNPC.pos.x==126 then
                    User:inform("FRAU "..theNPC:increaseAttrib("sex",0));
                end                
                
                theNPC:increaseAtPos(1,-1);
                theNPC:increaseAtPos(5,-1);
                theNPC:increaseAtPos(6,-1);
                theNPC:increaseAtPos(11,-1);
                theNPC:increaseAtPos(3,-1);
                theNPC:increaseAtPos(10,-1);
                theNPC:increaseAtPos(9,-1);
         
                if math.random(10)<4 then
    	            headIt=head[math.random(# head)];
    	            theNPC:createAtPos(1,headIt,1);
    	        end
    	        if math.random(10)<4 then
    	            hand1It=hand1[math.random(# hand1)];
    	            theNPC:createAtPos(5,hand1It,1);
    	        end
    	        if math.random(10)<4 then
    	            hand2It=hand2[math.random(# hand2)];
    	            theNPC:createAtPos(6,hand2It,1);
    	        end
    	        if math.random(10)<4 then
    	            coatIt=coat[math.random(# coat)];
    	            theNPC:createAtPos(11,coatIt,1);
    	        end
         
                
                
                theNPC:createAtPos(3,bodyIt,1);
                theNPC:createAtPos(10,feetIt,1);
                theNPC:createAtPos(9,legIt,1);
                
                theNPC:updateAppearance();
                
                --world:changeItem(theNPC:getItemAt(11));
                --world:changeItem(theNPC:getItemAt(6));
                --world:changeItem(theNPC:getItemAt(5));
                --world:changeItem(theNPC:getItemAt(1));
                --world:changeItem(theNPC:getItemAt(3));
                --world:changeItem(theNPC:getItemAt(10));
                --world:changeItem(theNPC:getItemAt(9));
    
    	    end
    	end
	else
        for i,value in pairs(Location) do
            if (string.find(User.lastSpokenText,value))~=nil then
                User:inform(User.lastSpokenText);
                User:warp(position(Coordina[i][1],Coordina[i][2],Coordina[i][3]))
                -- LogGMAction(User,User.name.."("..User.id..") jumped to pos("..Coordina[i][1]..","..Coordina[i][2]..","..Coordina[i][3]")"); 
            end
        end
        if (string.find(User.lastSpokenText,"magictype"))~=nil then
            User:setMagicType(Counter-1);
            User:inform("magic type set to "..Counter-1);
            -- LogGMAction(User,User.name.."("..User.id..") changed own magic type to "..Counter-1);
        elseif (string.find(User.lastSpokenText,"crafting"))~=nil then
            User:increaseSkill(Character.carpentry,Counter-User:getSkill(Character.carpentry));
            User:increaseSkill(Character.smithing,Counter-User:getSkill(Character.smithing));
            User:increaseSkill(Character.cooking,Counter-User:getSkill(Character.cooking));
            User:increaseSkill(Character.fishing,Counter-User:getSkill(Character.fishing));
            User:increaseSkill(Character.alchemy,Counter-User:getSkill(Character.alchemy));
            User:increaseSkill(Character.gemcutting,Counter-User:getSkill(Character.gemcutting));
            User:increaseSkill(Character.glassBlowing,Counter-User:getSkill(Character.glassBlowing));
            User:increaseSkill(Character.goldsmithing,Counter-User:getSkill(Character.goldsmithing));
            User:increaseSkill(Character.woodcutting,Counter-User:getSkill(Character.woodcutting));
            User:increaseSkill(Character.mining,Counter-User:getSkill(Character.mining));
            User:increaseSkill(Character.herblore,Counter-User:getSkill(Character.herblore));
            User:increaseSkill(Character.tailoring,Counter-User:getSkill(Character.tailoring));
            User:inform("Crafting skills set to counter value");
            -- LogGMAction(User,User.name.."("..User.id..") setted crafting skills to "..Counter);
        elseif (string.find(User.lastSpokenText,"fighting"))~=nil then
            User:increaseSkill(Character.concussionWeapons,Counter-User:getSkill(Character.concussionWeapons));
            User:increaseSkill(Character.distanceWeapons,Counter-User:getSkill(Character.distanceWeapons));
            User:increaseSkill(Character.dodge,Counter-User:getSkill(Character.dodge));
            User:increaseSkill(Character.parry,Counter-User:getSkill(Character.parry));
            User:increaseSkill(Character.poisoning,Counter-User:getSkill(Character.poisoning));
            User:increaseSkill(Character.punctureWeapons,Counter-User:getSkill(Character.punctureWeapons));
            User:increaseSkill(Character.slashingWeapons,Counter-User:getSkill(Character.slashingWeapons));
            User:increaseSkill(Character.tactics,Counter-User:getSkill(Character.tactics));
            User:increaseSkill(Character.wrestling,Counter-User:getSkill(Character.wrestling));
            User:inform("Fighting skills set to counter value");
            -- LogGMAction(User,User.name.."("..User.id..") setted fighting skills to "..Counter);
        elseif (string.find(User.lastSpokenText,"current weather"))~=nil then
            m_Weather = world.weather;
            User:inform("cld: "..m_Weather.cloud_density.." fg: "..m_Weather.fog_density.." w_dir: "..m_Weather.wind_dir.." gust: "..m_Weather.gust_strength.." perstr: "..m_Weather.percipitation_strength.." perTyp: "..m_Weather.percipitation_type.." new thund: "..m_Weather.thunderstorm.." temp: "..m_Weather.temperature);
        elseif (string.find(User.lastSpokenText,"heal"))~=nil then
            acHP=User:increaseAttrib("hitpoints",0);
            User:increaseAttrib("hitpoints",10000-acHP);
        end
    end]]
end

function ShowCharInfo(User,TargetCharakter)
    TargetHP=TargetCharakter:increaseAttrib("hitpoints",0);
    User:inform("Target Charakter HP: "..TargetHP.." - Race: "..TargetCharakter:getRace().." - Sex: "..TargetCharakter:increaseAttrib("sex",0));
end

function ShowPosition(User) 
    InfoText="x="..User.pos.x..", y="..User.pos.y.. ", z="..User.pos.z;
    User:inform(InfoText);
end

function LookAtItem(User,Item)
    if (Item:getData("mode")=="Eraser") then
		base.lookat.SetSpecialName(Item, "Dietriche (Eraser)","Lockpicks (Eraser)")
		base.lookat.SetSpecialDescription(Item, "Aufräumzeit!! Benutze die Dietriche.", "Clean up time!! Use the lockpicks.");
    elseif (Item:getData("mode")=="Teleport") then
        base.lookat.SetSpecialName(Item, "Dietriche (Teleport)","Lockpicks (Teleport)");
		base.lookat.SetSpecialDescription(Item, "Ich  bin hier weg. Benutze die Dietriche. ", "I'm out of here. Use the lockpicks.");
	elseif (Item:getData("mode")=="Char Info") then
        base.lookat.SetSpecialName(Item, "Dietriche(Char Info)","Lockpicks (Char Info)");
		base.lookat.SetSpecialDescription(Item, "Char Info. Benutze die Dietriche.", "Char Info. Use the lockpicks.");
	else
		base.lookat.SetSpecialDescription(Item, "Um einen Modus zu setzen sage 'setmode' und benutzt die Dietriche.", "To set a mode type 'setmode' and use the lockpicks.");
        base.lookat.SetSpecialName(Item, "Dietriche", "Lockpicks");
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
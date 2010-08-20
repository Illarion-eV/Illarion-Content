--  I_99 Dietrich - Items loeschen, teleportation fuer GMs, tueren initialisieren

-- UPDATE common SET com_script='gm.items.id_99_lockpicks' WHERE com_itemid=99;

require("gm.base.log")
require("base.common")

module("gm.items.id_99_lockpicks", package.seeall)


function UseItem(User,SourceItem,TargetItem,Counter,Param,ltstate)
	-- Hello World
    if (firsttime==nil) then
        firsttime=1;
        
        Location={};
        Coordina={};
        Location[1]="[cC]adomyr [mM]arket";
        Coordina[1]={130,598,0};
        Location[2]="[gG]almair [cC]astle";
        Coordina[2]={367,229,0};
        Location[3]="[gG]almair [tT]own";
        Coordina[3]={398,250,0};
        Location[4]="[Gg]almair [mM]ine";
        Coordina[4]={412,354,0};
        Location[5]="[rR]unewick";
        Coordina[5]={836,810,0};
        Location[6] = "[cC]adomyr [tT]hrone";
        Coordina[6] = {121,543,0};
		Location[6] = "[cC]adomyr [mM]ine";
        Coordina[6] = {133,696,0};
		Location[6] = "[aA]rena";
        Coordina[6] = {602,396,0};
    end
    if (string.find(User.lastSpokenText,"remove id 0")~=nil) then
        world:erase(TargetItem,Counter);
    elseif ((TargetItem ~= nil) and (TargetItem.id ~= 0)) then
        world:erase(TargetItem,Counter);
        -- LogGMAction(User,User.name.."("..User.id..") deleted "..Counter.." "..world:getItemName(TargetItem.id,1).."("..TargetItem.id..")");
    elseif (string.find(User.lastSpokenText,"show locations")~=nil) then
		local out = "";
		for _,s in pairs(Location) do
			out = out .. s .. " -- ";
		end
		User:inform(out);
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
					file:write(","..User:get_face_to());
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
	elseif (string.find(User.lastSpokenText,"attack2")~=nil) then
	    User:performAnimation(6); -- 6, 7(bow), 
	elseif (string.find(User.lastSpokenText,"attack")~=nil) then
	    User:performAnimation(5); -- 6, 7(bow), 
	elseif (string.find(User.lastSpokenText,"bow")~=nil) then
	    User:performAnimation(7); -- 6, 7(bow), 
	elseif (string.find(User.lastSpokenText,"cast")~=nil) then
	    User:performAnimation(11); -- 6, 7(bow), 
	elseif (string.find(User.lastSpokenText,"smith")~=nil) then
	    User:performAnimation(14);
	elseif (string.find(User.lastSpokenText,"npc")~=nil) then
	    -- equip NPC
	        body={4, 101, 180, 181, 182, 2402, 2360};
            feet={52, 369, 326};
            legs={183, 459, 460, 461, 825, 2111};
            head={7,16, 94, 187, 357, 358};
            hand1={1, 65, 74, 76, 122, 74, 124, 192, 296, 2626};
            hand2={17, 96};
            coat={55, 193, 194, 195, 196, 368, 2377, 2416, 2421};

  posList={};
	    
	    if world:isCharacterOnField(position(134,590,0)) then

	        User:inform("now assigning stuff");
	        bodyIt=body[math.random(# body)]
	        feetIt=feet[math.random(# feet)]
	        legIt=legs[math.random(# legs)]
	        if math.random(10)<4 then
	            headIt=head[math.random(# head)];
	        end
	        if math.random(10)<4 then
	            hand1It=hand1[math.random(# hand1)];
	        end
	        if math.random(10)<4 then
	            hand2It=hand2[math.random(# hand2)];
	        end
	        if math.random(10)<4 then
	            coatIt=coat[math.random(# coat)];
	        end

            theNPC=world:getCharacterOnField(position(134,590,0));
            
            theNPC:increaseAtPos(1,-1);
            theNPC:increaseAtPos(5,-1);
            theNPC:increaseAtPos(6,-1);
            theNPC:increaseAtPos(11,-1);
            theNPC:increaseAtPos(3,-1);
            theNPC:increaseAtPos(10,-1);
            theNPC:increaseAtPos(9,-1);
     
            if headIt~=nil then
                theNPC:createAtPos(1,headIt,1);
                world:changeItem(theNPC:getItemAt(1));
            end
                
            if hand1It~=nil then
                theNPC:createAtPos(5,hand1It,1);
                world:changeItem(theNPC:getItemAt(5));
            end
            if hand2It~=nil then
                theNPC:createAtPos(6,hand2It,1);
                world:changeItem(theNPC:getItemAt(6));
            end
            if coatIt~=nil then
                theNPC:createAtPos(11,coatIt,1);
                world:changeItem(theNPC:getItemAt(11));
            end
            
            theNPC:createAtPos(3,bodyIt,1);
            theNPC:createAtPos(10,feetIt,1);
            theNPC:createAtPos(9,legIt,1);
            
            world:changeItem(theNPC:getItemAt(11));
            world:changeItem(theNPC:getItemAt(6));
            world:changeItem(theNPC:getItemAt(5));
            world:changeItem(theNPC:getItemAt(1));
            world:changeItem(theNPC:getItemAt(3));
            world:changeItem(theNPC:getItemAt(10));
            world:changeItem(theNPC:getItemAt(9));

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
        elseif (string.find(User.lastSpokenText,"magic"))~=nil then
            User:inform("Go for it!");
            User:increaseSkill(3,"commotio",Counter-User:getSkill("commotio"));
            User:increaseSkill(3,"desicio",Counter-User:getSkill("desicio"));
            User:increaseSkill(3,"pervestigatio",Counter-User:getSkill("pervestigatio"));
            User:increaseSkill(3,"transfreto",Counter-User:getSkill("transfreto"));
            User:increaseSkill(3,"transformo",Counter-User:getSkill("transformo"));
            User:increaseSkill(3,"magic resistance",Counter-User:getSkill("magic resistance"));
            User:inform("Magic skills set to counter value");
            -- LogGMAction(User,User.name.."("..User.id..") setted magic skills to "..Counter);
        elseif (string.find(User.lastSpokenText,"crafting"))~=nil then
            User:increaseSkill(2,"carpentry",Counter-User:getSkill("carpentry"));
            User:increaseSkill(2,"smithing",Counter-User:getSkill("smithing"));
            User:increaseSkill(2,"baking",Counter-User:getSkill("baking"));
            User:increaseSkill(2,"fishing",Counter-User:getSkill("fishing"));
            User:increaseSkill(2,"alchemy",Counter-User:getSkill("alchemy"));
            User:increaseSkill(2,"gemcutting",Counter-User:getSkill("gemcutting"));
            User:increaseSkill(2,"glass blowing",Counter-User:getSkill("glass blowing"));
            User:increaseSkill(2,"goldsmithing",Counter-User:getSkill("goldsmithing"));
            User:increaseSkill(2,"lumberjacking",Counter-User:getSkill("lumberjacking"));
            User:increaseSkill(2,"mining",Counter-User:getSkill("mining"));
            User:increaseSkill(2,"herb lore",Counter-User:getSkill("herb lore"));
            User:increaseSkill(2,"tailoring",Counter-User:getSkill("tailoring"));
            User:inform("Crafting skills set to counter value");
            -- LogGMAction(User,User.name.."("..User.id..") setted crafting skills to "..Counter);
        elseif (string.find(User.lastSpokenText,"fighting"))~=nil then
            User:increaseSkill(5,"concussion weapons",Counter-User:getSkill("concussion weapons"));
            User:increaseSkill(5,"distance weapons",Counter-User:getSkill("distance weapons"));
            User:increaseSkill(5,"dodge",Counter-User:getSkill("dodge"));
            User:increaseSkill(5,"parry",Counter-User:getSkill("parry"));
            User:increaseSkill(5,"poisoning",Counter-User:getSkill("poisoning"));
            User:increaseSkill(5,"puncture weapons",Counter-User:getSkill("puncture weapons"));
            User:increaseSkill(5,"slashing weapons",Counter-User:getSkill("slashing weapons"));
            User:increaseSkill(5,"tactics",Counter-User:getSkill("tactics"));
            User:increaseSkill(5,"wrestling",Counter-User:getSkill("wrestling"));
            User:inform("Fighting skills set to counter value");
            -- LogGMAction(User,User.name.."("..User.id..") setted fighting skills to "..Counter);
        elseif (string.find(User.lastSpokenText,"current weather"))~=nil then
            m_Weather = world.weather;
            User:inform("cld: "..m_Weather.cloud_density.." fg: "..m_Weather.fog_density.." w_dir: "..m_Weather.wind_dir.." gust: "..m_Weather.gust_strength.." perstr: "..m_Weather.percipitation_strength.." perTyp: "..m_Weather.percipitation_type.." new thund: "..m_Weather.thunderstorm.." temp: "..m_Weather.temperature);
        end
    end
end

function UseItemWithCharacter(User,SourceItem,TargetCharakter,Counter,Param)
    TargetHP=TargetCharakter:increaseAttrib("hitpoints",0);
    User:inform("Target Charakter HP: "..TargetHP.." - Race: "..TargetCharakter:get_race().." - Sex: "..TargetCharakter:increaseAttrib("sex",0));
end

function LookAtItem(User, Item) 
    InfoText="x="..User.pos.x..", y="..User.pos.y.. ", z="..User.pos.z;
    User:inform(InfoText);
end

function UseItemWithField(User,SourceItem,TargetPos,Counter,Param)
    User:startMusic(Counter);
end

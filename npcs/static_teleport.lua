--Name:        TeleporterNPC
--Race:        invisble
--Town:        Troll's Bane, Silverbrand, Tol Vanima, Greenbriar, Varshikar
--Function:    Teleporter
--Position:    -37 -108 0   ,79 -185 0   ,341 221 0  ,-433 40 0  ,262 -264 0
--Facing:      North
--Last Update: 02/04/2007
--Update by:   Nitram

-- INSERT INTO npc VALUES (63,25, -73, -79,0,0,'f','TB Teleporter','npc_static_teleport.lua',0);
-- INSERT INTO npc VALUES (64,25,  79,-185,0,0,'f','SB Teleporter','npc_static_teleport.lua',0);
-- INSERT INTO npc VALUES (65,25, 341, 221,0,0,'f','TV Teleporter','npc_static_teleport.lua',0);
-- INSERT INTO npc VALUES (66,25,-433,  40,0,0,'f','GB Teleporter','npc_static_teleport.lua',0);
-- INSERT INTO npc VALUES (67,25, 262,-264,0,0,'f','V Teleporter' ,'npc_static_teleport.lua',0);

module("npcs.static_teleport")

function initializeNpc()
		Teleportation=TeleportationFunction(thisNPC); --initialize the teleportation
		Teleportation.initializeNpc(thisNPC);
		thisNPC:talk(CCharacter.say, "debugmsg");
end

function nextCycle()  -- ~10 times per second
    if not initDone then
        initDone = { };
    end
    if not initDone[thisNPC.id] then
        initializeNpc();
        initDone[thisNPC.id] = true;
    end
	
	Teleportation.nextCycle();

end

function receiveText(texttype, message, originator)
	Teleportation.receiveText(texttype,message,originator);
end --function

function ShowAnimationFrame( frame, posi )
    if ( frame <= 6) then
        world:gfx(41,position(posi.x+1,posi.y+1,posi.z));
        world:gfx(41,position(posi.x-1,posi.y-1,posi.z));
        world:gfx(41,position(posi.x+1,posi.y-1,posi.z));
        world:gfx(41,position(posi.x-1,posi.y+1,posi.z));
    elseif (frame == 7) then
        world:createItemFromId(360,1,position(posi.x+1,posi.y+1,posi.z),true,333,0);
        world:createItemFromId(360,1,position(posi.x-1,posi.y-1,posi.z),true,333,0);
        world:createItemFromId(360,1,position(posi.x+1,posi.y-1,posi.z),true,333,0);
        world:createItemFromId(360,1,position(posi.x-1,posi.y+1,posi.z),true,333,0);
    elseif (frame == 8) then
        world:gfx(31,posi);
        world:gfx(53,position(posi.x+1,posi.y+2,posi.z));
        world:gfx(53,position(posi.x+2,posi.y-1,posi.z));
        world:gfx(53,position(posi.x-1,posi.y-2,posi.z));
        world:gfx(53,position(posi.x-2,posi.y+1,posi.z));
    elseif (frame == 9) then
        world:gfx(31,posi);
        world:gfx(53,position(posi.x+2,posi.y+2,posi.z));
        world:gfx(53,position(posi.x+2,posi.y-2,posi.z));
        world:gfx(53,position(posi.x-2,posi.y-2,posi.z));
        world:gfx(53,position(posi.x-2,posi.y+2,posi.z));
    elseif (frame == 10) then
        world:gfx(31,posi);
        world:gfx(53,position(posi.x+2,posi.y+1,posi.z));
        world:gfx(53,position(posi.x+1,posi.y-2,posi.z));
        world:gfx(53,position(posi.x-2,posi.y-1,posi.z));
        world:gfx(53,position(posi.x-1,posi.y+2,posi.z));
    elseif (frame == 11) then
        CreateCircle(1,posi,3);
    elseif (frame == 12) then
        CreateCircle(1,posi,2);
        CheckAndRemoveItem( position(posi.x+1,posi.y+1,posi.z), 360 );
        CheckAndRemoveItem( position(posi.x-1,posi.y-1,posi.z), 360 );
        CheckAndRemoveItem( position(posi.x-1,posi.y+1,posi.z), 360 );
        CheckAndRemoveItem( position(posi.x+1,posi.y-1,posi.z), 360 );
    elseif (frame == 13) then
        world:gfx(31,posi);
        CreateCircle(1,posi,1);
    end
end

function CheckAndRemoveItem( posi, itemid )
    if world:isItemOnField(posi) then
        local checkItem = world:getItemOnField( posi );
        if ( checkItem.id == itemid ) then
            world:erase( checkItem, checkItem.number );
        end
    end
end

function CreateCircle(gfxid,CenterPos,Radius)
	local irad = math.ceil(Radius);
	local dim = 2*(irad+1);
	local x;
	local y;
	local map = {} ;

	for x = -irad-1, irad do
		map[x] = {};
		for y = -irad-1, irad do
			map[x][y] = (x+0.5)*(x+0.5)+(y+0.5)*(y+0.5)-irad*irad > 0
		end;
	end;

	for x = -irad, irad do
		for y = -irad, irad do
			if not( map[x][y] and  map[x-1][y] and map[x][y-1] and map[x-1][y-1] )
			and( map[x][y] or   map[x-1][y] or  map[x][y-1] or  map[x-1][y-1] ) then
				ItemPosi=position( CenterPos.x + x, CenterPos.y + y, CenterPos.z );
				world:gfx(gfxid,ItemPosi);
			end;
		end;
	end;
end

function InformNLS( User, textInDe, textInEn )
	if User:getPlayerLanguage()==0 then
		User:inform(textInDe);
	else
		User:inform(textInEn);
	end
end


function TeleportationFunction(thisNPC)

    local self = {
        targetPosition 	   = { },
        townName 		   = { },
        trigger 		   = { },
        filename 		   = { },
        HomePosition 	   = { },
        
        
        TeleportInProgress = { },
	    desiredDestination = { },
	    TeleportCharacter  = { },
	    
	    block  			   = { },
		count 			   = { },
        travelFee		   =  30;        --price for all journeys   
		
    };


	local initializeNpc = function(thisNPC)

	        self.targetPosition[1] = position(-37,-108,0);
	        self.townName[1] = "Troll's Bane";
	        self.trigger[1] = "[Tt]roll.+[Bb]ane";
	        self.filename[1] = "trollsbane.dat";

	        self.targetPosition[2] = position(79,-185,0);
	        self.townName[2] = "Silverbrand";
	        self.trigger[2] = "[Ss]il[bv]erbrand";
	        self.filename[2] = "silverbrand.dat";

	        self.targetPosition[3] = position(341,221,0);
	        self.townName[3] = "Tol Vanima";
	        self.trigger[3] = "[Vv]anima";
	        self.filename[3] = "vanima.dat";

	        self.targetPosition[4] = position(-433,41,0);
	        self.townName[4] = "Greenbriar";
	        self.trigger[4] = "[Gg]reenbriar";
	        self.filename[4] = "greenbriar.dat";

	        self.targetPosition[5] = position(262,-264,0);
	        self.townName[5] = "Varshikar";
	        self.trigger[5] = "[Vv]arshikar";
	        self.filename[5] = "varshikar.dat";

	    for i, possHomes in pairs(self.targetPosition) do
	        if thisNPC:isInRangeToPosition(possHomes,5) then
	            self.HomePosition[thisNPC.id] = i;
	            thisNPC:forceWarp(position(possHomes.x+1,possHomes.y+1,possHomes.z));
	        end
	    end
	    thisNPC:increaseSkill(1,"common language",100);
	    thisNPC:increaseSkill(1,"human language",100);
	    thisNPC:increaseSkill(1,"dwarf language",100);
	    thisNPC:increaseSkill(1,"elf language",100);
	    thisNPC:increaseSkill(1,"lizard language",100);
	    thisNPC:increaseSkill(1,"orc language",100);
	    thisNPC:increaseSkill(1,"halfling language",100);
	    thisNPC:increaseSkill(1,"fairy language",100);
	    thisNPC:increaseSkill(1,"gnome language",100);
	    thisNPC:increaseSkill(1,"goblin language",100);
	    thisNPC:increaseSkill(1,"ancient language",100);
	end
		
	local receiveText = function (texttype, message, originator)
		if self.TeleportInProgress[thisNPC.id] then
	        return
	    end
	    if (originator.id == thisNPC.id) then
	        return
	    end
	    if not originator:isInRangeToPosition(self.targetPosition[self.HomePosition[thisNPC.id]],4) then
	        return
	    end
	    self.desiredDestination[thisNPC.id] = 0;
	    for i, currentTrigger in pairs(self.trigger) do
	        if (string.find(message,currentTrigger)~=nil) then
	            self.desiredDestination[thisNPC.id] = i;
	        end
	    end
	    if (self.desiredDestination[thisNPC.id]==self.HomePosition[thisNPC.id]) then --already there
	        InformNLS(originator,
	        "Ihr seid bereits in "..self.townName[self.desiredDestination[thisNPC.id]]..".",
	        "You are already in "..self.townName[self.desiredDestination[thisNPC.id]]..".");
	        return
	    end
	    if ((self.desiredDestination[thisNPC.id]==0) or (self.desiredDestination[thisNPC.id]==nil)) then
	        InformNLS(originator,
	        "Sagt den Namen der Stadt, in die ihr reisen möchtet.",
	        "Say the name of the town you want to travel to.");
	        --Char stands on teleporter but says no valid trigger. Names of towns not told intentionally to motivate n00bz to ask around
	        return
	    end
	    if (originator:countItem(3076)<self.travelFee) and (originator:countItem(3077)==0) and (originator:countItem(61)==0) then --Char has not enough money
	        InformNLS(originator,
	        "Ihr habt nicht genug Geld für diese Reise. Die Reise kostet "..self.travelFee.." Kupferstücke.",
	        "You don't have enough money for this journey. The journey costs "..self.travelFee.." copper coins.");
	        return
	    end

	    if (originator:countItem(3076)>=self.travelFee) then
	        originator:eraseItem(3076,self.travelFee);
	    elseif (originator:countItem(3077)>0) then
	        originator:eraseItem(3077,1);
	        originator:createItem(3076,100-self.travelFee,333,0);
		else
			originator:eraseItem(61,1);
			originator:createItem(3077,99,333,0);
			originator:createItem(3076,100-self.travelFee,333,0);
	    end
	    coins = self.travelFee;
	    filepoint,errmsg=io.open("/home/nitram/money/"..self.filename[self.HomePosition[thisNPC.id]],"r+");
	    if (filepoint~=nil) then
	        filepoint:seek("set");
	        coins = coins + filepoint:read("*n");
	        filepoint:seek("set");
	        filepoint:write(""..coins);
	        filepoint:close();
	    end
	    InformNLS(originator,
	    "Ihr lasst den Teleporter ein Tor nach "..self.townName[self.desiredDestination[thisNPC.id]].." öffnen, zu einem Preis von "..self.travelFee.." Kupferstücken.",
	    "You make the teleporter open a portal to "..self.townName[self.desiredDestination[thisNPC.id]].." at a cost of "..self.travelFee.." copper coins.");
	    self.TeleportInProgress[thisNPC.id] = true;
	    self.TeleportCharacter[thisNPC.id] = originator;
	end


	local nextCycle = function()
	
	    if not self.count[thisNPC.id] then
	        self.count[thisNPC.id] = 0;
	    end
	
	    if not self.TeleportInProgress[thisNPC.id] then
	        return
	    end
	    
	    if (self.count[thisNPC.id] < 11) then
	    
			playerStillOnline=false;
			local players=world:getPlayersInRangeOf(thisNPC.pos, 7);
			if players[1]~=nil then
				for i, player in pairs(players) do
					if (players[i].id==self.TeleportCharacter[thisNPC.id].id) then
						playerStillOnline=true;
					end
				end						
			end
			if not playerStillOnline then --player logged out
			self.count[thisNPC.id] = 11;	
			else

				if (self.TeleportCharacter[thisNPC.id] == nil) then
		            self.count[thisNPC.id] = 11;
		        end
	
		        if ((self.TeleportCharacter[thisNPC.id].id == nil) or (self.TeleportCharacter[thisNPC.id].id == 0)) then
		            self.count[thisNPC.id] = 11;
		        end
	
		        if not self.TeleportCharacter[thisNPC.id]:isInRangeToPosition(self.targetPosition[self.HomePosition[thisNPC.id]],7) then --kritisch, beim Ausloggen des Chars=> Client Crash!!!!!
		            self.count[thisNPC.id] = 11;
		        end
	
		        if (self.TeleportCharacter[thisNPC.id]:increaseAttrib("hitpoints",0) == 0) then
		            self.count[thisNPC.id] = 11;
		        end
		        
		    playerStillOnline=false;
		    end
	    end
	    
	    if ((self.block[thisNPC.id] == nil) or (self.block[thisNPC.id] == 9)) then
	        self.block[thisNPC.id] = 0;
	        ShowAnimationFrame( self.count[thisNPC.id], self.targetPosition[self.HomePosition[thisNPC.id]] );
	    else
	        self.block[thisNPC.id] = self.block[thisNPC.id] + 1;
	        return
	    end
	    
	    if ((self.count[thisNPC.id] > 7) and (self.count[thisNPC.id] <= 10)) then
	        if equapos(self.TeleportCharacter[thisNPC.id].pos,self.targetPosition[self.HomePosition[thisNPC.id]]) then
	            self.TeleportCharacter[thisNPC.id]:warp(self.targetPosition[self.desiredDestination[thisNPC.id]]);
	            world:gfx(41,self.targetPosition[self.desiredDestination[thisNPC.id]]);
	            self.count[thisNPC.id] = 11;
	        elseif ( self.count[thisNPC.id] == 10 ) then
	            self.count[thisNPC.id] = 7;
	        end
	    end

	    self.count[thisNPC.id] = self.count[thisNPC.id] + 1;
	    if (self.count[thisNPC.id] == 14) then
	        self.TeleportInProgress[thisNPC.id] = false;
	        self.desiredDestination[thisNPC.id] = nil;
	        self.TeleportCharacter[thisNPC.id]  = nil;
	        self.count[thisNPC.id] = 0;
	    end
	end

	return {
        nextCycle    = nextCycle,
        receiveText  = receiveText,
		initializeNpc= initializeNpc,
    };
end

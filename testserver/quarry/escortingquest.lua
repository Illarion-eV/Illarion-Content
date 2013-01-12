require("npc.base.autonpcfunctions")
require("npc.base.escortingquests");
module("npc.escortingquest", package.seeall)

--[[
function init()
	InitDone[thisNPC.id] = true;
    thisNPC:increaseSkill(1,"common language",100);
    initializeNpc(); --initialize talk list
end  ]]--

function InitNPC()
    if not InitDone then
        InitDone = true;
        singleNPCInit = {};
        move		  = {};
        initEscorting();
        initializeNpc(); --blabla initializing
    end

    if not singleNPCInit[thisNPC.id] then
        thisNPC:increaseSkill(1,"common language",100);
        singleNPCInit[thisNPC.id] = true;
        --moving[thisNPC.id] = true;
        --lost[thisNPC.id] = false;
        --cnt[thisNPC.id] = 0;
        --lostcnt[thisNPC.id] = 0;
        --blocked[thisNPC.id] = false;
        lastdir[thisNPC.id]= 1337;
    	itemlist = {320};
    	local playerNearby = world:getCharactersInRangeOf(thisNPC.pos, 2); --looks up the escorting player(needs to be changed later to look also for a typical queststatus)
    	
		player[thisNPC.id] = getCharForId(playerNearby[1].id);--create a save copy of the char struct 
		move[thisNPC.id]=moveFunction(itemlist,player[thisNPC.id]); --initialize npc.base.autonpcfunctions.walking
        waypoints[thisNPC.id] = {};
        SpawnAtWP[thisNPC.id] = {};
        --put here the initializiation of the route by random
        AddWaypoint(thisNPC,position(37,13,0), 1);
        AddWaypoint(thisNPC,position(37, 0,0), 1);
        --SpawnAtRoutePercentage(thisNPC,percent,SpawnID);
           
    end
end
function initializeNpc()
    if TraderFirst then
        return true;
    end

    npc.base.autonpcfunctions.InitTalkLists();

    -- ********* START DYNAMIC PART ********
    npc.base.autonpcfunctions.AddTraderTrigger("[Gg]reetings","Be greeted!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Hh]ello");
    
    npc.base.autonpcfunctions.AddAdditionalText("A good day to you my friend! You look fine today.");
    npc.base.autonpcfunctions.AddTraderTrigger("[Yy]ou.+[Tt]rader","I am "..thisNPC.name..", one of Cadomyrs order traders!");
    npc.base.autonpcfunctions.AddTraderTrigger("[Ww]hat.+sell","I don't sell anything, but I have delivery orders at which you could help me.");

    npc.base.autonpcfunctions.AddTraderTrigger("[Gg]oodbye","You are going my friend? Take care of yourself.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Bb]ye");
    npc.base.autonpcfunctions.AddAdditionalText("Farewell");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Ff]arewell");
    npc.base.autonpcfunctions.AddAdditionalText("Farewell. I hope you will come back soon my friend.");
    npc.base.autonpcfunctions.AddTraderTrigger("[Ww]hat.+buy","I don't buy anything, but I have delivery orders at which you could help me.");
    npc.base.autonpcfunctions.AddTraderTrigger("[Ww]ho.+you?","My name is "..thisNPC.name..".");
    npc.base.autonpcfunctions.AddTraderTrigger("I'm .+","That is the name of a good friend. Nice to meet you!");

    npc.base.autonpcfunctions.AddTraderTrigger("[Gg]r[üu][ßs]+","Hallo mein Freund, du siehst heute wieder gut aus.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Hh]allo");
    npc.base.autonpcfunctions.AddAdditionalText("Guten Tag mein Freund! Wie geht es dir mein Freund?");
    npc.base.autonpcfunctions.AddTraderTrigger("[Dd]u.+[Hh]ändler","Ich bin "..thisNPC.name..", einer der Großauftragshändler Cadomyrs!");
    npc.base.autonpcfunctions.AddTraderTrigger("[Ww]as.+verkauf","Ich verkaufe nichts, aber ich habe Lieferaufträge bei denen du mir helfen könntest.");
    npc.base.autonpcfunctions.AddTraderTrigger("[Aa]uf.+[Bb]ald","Du bist schon auf dem Weg mein Freund? Pass auf dich auf und komm bald wieder!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Bb]is.+[Bb]ald");
    npc.base.autonpcfunctions.AddAdditionalText("Auf bald");
    npc.base.autonpcfunctions.AddTraderTrigger("[Ww]as.+[Kk]auf","Ich kaufe nichts, aber ich habe Lieferaufträge bei denen du mir helfen könntest.");
    npc.base.autonpcfunctions.AddTraderTrigger("[Ww]er.+[DdIi][uh]r*?","Ich werde "..thisNPC.name.." genannt mein Freund.");
    npc.base.autonpcfunctions.AddTraderTrigger("[Ii]ch.+bin","Das ist der Name eines guten Freundes. Schön dich kennen zu lernen!");
    -- ********* END DYNAMIC PART ********
    TradSpeakLang={0,1,2,3,4,5,6,7,8,9,10};
    TradStdLang=0;

    npc.base.autonpcfunctions.increaseLangSkill(TradSpeakLang);
    thisNPC.activeLanguage=TradStdLang;


end


function nextCycle()
    InitNPC();
    BE_nextCycle(thisNPC);
end


function receiveText(texttype, message, originator)
    if npc.base.autonpcfunctions.BasicNPCChecks(originator,5) then
		if (string.find(message, "[Rr]emove")~=nil) then  --DEBUG
			originator:inform("Escort NPC gets deleted");
            world:deleteNPC( thisNPC.id );	
		elseif (string.find(message, "[Dd]irection")~=nil) then
			local fnd,dir = thisNPC:getNextStepDir(position(0,0,0),10);
			if fnd == false then originator:inform("fnd false"); end
			if dir ~= false then
				originator:inform("dir = "..dir);
			end
			thisNPC.waypoints:addWaypoint(waypoints[thisNPC.id][1]); 		
   			thisNPC:setOnRoute(true);
   			
		elseif (string.find(message, "[Ww]aypoint")~=nil) then
			local dirger,direng,dir = GetDirToNextWP(thisNPC);
			originator:inform("waypoint...");
			if dirger == false then originator:inform("dirger=false"); end
			if dirger == nil then originator:inform("dirger=nil"); end
			if dirger~=nil and dirger~=false then originator:inform("dirger = "..dirger);end
			originator:inform("x = "..waypoints[thisNPC.id][1].x);
			if dirger~=false and dirger~=nil then
			  base.common.TalkNLS(thisNPC, Character.say, "Nun müssen wir Richtung "..dirger, "Now we need to go "..direng);
			else
			  if dir == false then base.common.TalkNLS(thisNPC, Character.say, "dir = false", "dir = false");
			  else base.common.TalkNLS(thisNPC, Character.say, "dir = "..dir, "dir = "..dir); end
			end

			lastdir[thisNPC.id]=dir;
			tstVar = thisNPC:getOnRoute();
			if tstVar == true then originator:inform("...npc is looking for route..."); end
			thisNPC:setOnRoute(false);
		end
        npc.base.autonpcfunctions.TellSmallTalk(message,originator);
	end
end

function useNPC(user)
	if not IsEscortingPlayerOnline(thisNPC) or (user.id == player[thisNPC.id].id and not move[thisNPC.id].status()) then --look if the Escorting Player is still online and npc not moving
		player[thisNPC.id] = getCharForId(user.id);--create a save copy of the char struct
		  move[thisNPC.id] = moveFunction(itemlist,player[thisNPC.id]); --initialize npc.base.autonpcfunctions.walking function
		
		base.common.TalkNLS(thisNPC, Character.say, player[thisNPC.id].name.." ist meine neue Eskorte.", player[thisNPC.id].name.." is my new escort.");
	end
end



function moveFunction(itemlist,player)

    local self = {
        moving             = true,      -- false: npc not moving, true: npc is moving
        player         	   = player,   	-- Struct of the Player the npc shall follow
		faceto			   = 4,         -- The looking direction of the Npc when he reaches the target(0=north,6=west,4=south,2=east)
		target			   = nil,		-- the destination the npc has to go
		TimeBetweenSteps   = 0,         -- Time between a step of the npc in seconds
		timerID            = 0,         -- timerID 0 for npc.base.autonpcfunctions.walking
		itemlist		   = itemlist,  -- a list with the non-passable items
		blocked			   = false;     -- true if the npc is blocked by a char or item else false

    };

	local reset = function ()
		self.target=nil;
		self.moving=false;
		self.player=nil;
		self.blocked=false;
	end

	function isPassable( id , lower, upper )  --returns true if Item with Id "id" non-passable!
	    if lower > upper then
	        return false;
	    end;
	    margin = math.floor((lower+upper)/2);
	    if self.itemlist[margin] == id then
	        return true;
	    elseif self.itemlist[margin] < id then
	        return isPassable( id, margin+1, upper );
	    else
	        return isPassable( id, lower, margin-1 );
	    end;
	end

	local CheckItem = function ( posi ) --returns false if one of the items non-passable!
    	local fld = world:getField(posi);
    	local cnt = fld:countItems();
    	local i;
    	for i=0,cnt-1 do
        	if isPassable( (fld:getStackItem(i)).id, 1, table.getn( self.itemlist ) ) then
            	return false;
        	end;
    	end;
    	return true;
	end

	local searchTarget = function ()
		--if self.target==nil then
			if self.player~=nil and IsEscortingPlayerOnline(thisNPC) then --player still logged in?
				self.target=self.player.pos; --set player position as target
				--if (thisNPC:distanceMetric(self.player) <2) then
				--	self.target=waypoints[thisNPC.id][1];
				--else 
				--	self.target = thisNPC.pos;
				--end		
			else
			    self.target = thisNPC.pos;--prevents further tracking
				self.moving = false;
				base.common.TalkNLS(thisNPC, Character.say, "Ich brauche eine neue Eskorte, wer will mich eskortieren?", "I need a new escort, who wants to escort me?");
			end
		--end
	end

	local sameposition = function (pos1,pos2)
		if( (pos1.x==pos2.x) and (pos1.y==pos2.y) ) then
			return true;
		else
			return false;
		end
	end
	local MoveX = function (XOff)
	  	if (XOff == 0) then
	        return false;
	 	else
			if (XOff > 0) then
		        checkPos = position( thisNPC.pos.x - 1, thisNPC.pos.y, thisNPC.pos.z );
		    else
		        checkPos = position( thisNPC.pos.x + 1, thisNPC.pos.y, thisNPC.pos.z );
		    end

		    if not CheckItem( checkPos ) then
		        return false;
		    end
		    old_pos = thisNPC.pos;
		    if (XOff > 0) then
		        thisNPC:move(6,true);
		    elseif (XOff<0) then
		        thisNPC:move(2,true);
		    end
		    if sameposition(old_pos,thisNPC.pos) then
		        return false;
		    else
		        return true;
		    end
	 	end
	end


	local MoveY = function (YOff)
		if (YOff == 0) then
			return false;
		else
		    if (YOff >= 0) then
		        checkPos = position( thisNPC.pos.x, thisNPC.pos.y - 1, thisNPC.pos.z );
		    else
		        checkPos = position( thisNPC.pos.x, thisNPC.pos.y + 1, thisNPC.pos.z );
		    end

		    if not CheckItem( checkPos ) then
		        return false;
		    end
		    old_pos = thisNPC.pos;
		    if (YOff > 0) then
		        thisNPC:move(0,true);
		    elseif (YOff < 0) then
		        thisNPC:move(4,true);
		    end
		    if sameposition(old_pos,thisNPC.pos) then
		        return false;
		    else
		        return true;
		    end
 		end
	end

	local moveTo = function ()

        XOff = thisNPC.pos.x - self.target.x;  --offset between the npc and the target
        YOff = thisNPC.pos.y - self.target.y;
        if (math.sqrt(XOff*XOff + YOff*YOff) >= 1) then --if the target is atleast 1 step away npc.base.autonpcfunctions.walk.
            if ((math.abs(XOff) < math.abs(YOff)) and not self.blocked) or ((math.abs(XOff) > math.abs(YOff)) and self.blocked) then
                if not MoveX(XOff) then
                    if not MoveY(YOff) then
                        self.blocked = true;
                    else
                        self.blocked = false;
                    end
                else
                    self.blocked = false;
                end
            else
                if not MoveY(YOff) then
                    if not MoveX(XOff) then
                        self.blocked = true;
                    else
                        self.blocked = false;
                    end
                else
                    self.blocked = false;
                end
            end
        end
	end

	local nextCycle = function ()
		if self.moving then
			searchTarget();
			if not (self.target == thisNPC.pos) then

				if _waitVar==nil then _waitVar=0 end
				if wait(self.timerID,self.TimeBetweenSteps) then
					moveTo();--moves to the target;
					--local dirger,direng,dir = GetDirToPosition(thisNPC,self.target);
					--thisNPC:move(dir,true);
				end
				if self.blocked then
					  --HIER ETWAS DAGEGEN TUN((?))
				end
			end
		end
	end
    local receiveText = function (originator)
		self.player=originator;
    end

    local moveWithoutCommand = function (movestate)
		self.moving=true;
    end

	local status = function ()
		if (self.moving==nil) then
			self.moving=false;
		end
		return self.moving;
	end

	return {
        nextCycle    = nextCycle,
        receiveText  = receiveText,
		reset 		 = reset,
		status		 = status,
		moveWithoutCommand = moveWithoutCommand,
    };

end


--[[
    wait
    Lets the NPC make a break for a time
    @param timeInSeconds - float - The time how long the NPC shall take a break(in Seconds)
    
    @return true in case the NPC finished the break else false
]]
function wait(timerID,timeInSeconds)  --Works ONLY in the nextCycle-function!!!
	if not CounterInit then
		cycleCounter = {};
		CounterInit=true;
	end
    if (cycleCounter[timerID]==nil) then
        cycleCounter[timerID]=0;
		return false;
    elseif(cycleCounter[timerID]~=nil and cycleCounter[timerID]~=(timeInSeconds*10)) then
        cycleCounter[timerID]=cycleCounter[timerID]+1;
		return false;
    elseif (cycleCounter[timerID]==(timeInSeconds*10)) then
		cycleCounter[timerID]=nil;
		return true;
	end
end

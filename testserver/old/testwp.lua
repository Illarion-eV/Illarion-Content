module("npc.testwp", package.seeall)

function initializeNpc()
    TraderFirst = false;
	thisNPC:increaseSkill(1,"common language",100);
	thisNPC.activeLanguage=0;
    thisNPC.waypoints:addWaypoint(position(-110,-117,0));
	thisNPC.waypoints:addWaypoint(position(-113,-111,0));
	thisNPC:setOnRoute(true);
end
    
function nextCycle()  -- ~10 times per second
    if (TraderFirst == nil) then
        initializeNpc();
    end
end	

function characterOnSight(npc,Enemy)
    waypoints = thisNPC.waypoints:getWaypoints();
	wp = waypoints[1];
	if ( wp == nil ) then
		Enemy:inform("no current waypoint");
	else
        Enemy:inform("npc on Waypoint x:" .. wp.x .. " y:" .. wp.y .. " z:" .. wp.z);
    end
end

function abortRoute(npc)
	thisNPC:talk(Character.say,"Route abgebrochen");
	thisNPC.waypoints:clear();
	waypoints = {position(-110,-117,0),position(-113,-111,0)};
	thisNPC.waypoints:addFromList(waypoints);
	thisNPC:setOnRoute(true);
end

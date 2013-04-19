-- Attackable guards (who can fight back!)
-- monsterID 2000

module("monster.guards", package.seeall)

function initGuard(Guard)
    Guard:setAttrib("agility",10);

    Guard:increaseSkill(1,"human language",100);
    Guard:increaseSkill(1,"common language",100);
    Guard:talk(Character.say, "This is my script!");
    
    -- no more bad hair day!
    Guard:setHair(2);
    Guard:setBeard(1);
    Guard:setHairColor(30,30,30);
    
    -- put on some clothes:
    Guard:createAtPos(Character.head,16,1);
    Guard:createAtPos(Character.coat,368,1); ---193 blue
    Guard:createAtPos(Character.breast,2393,1);
    Guard:createAtPos(Character.feet,771,1);
    Guard:createAtPos(Character.legs,461,1);
    Guard:createAtPos(Character.right_tool,2723,1);
   
	-- Cloud of points in the patroling area (Cadomyr, inside town):
	cloud={position(107,559,0),
		position(93,561,0),
		position(99,576,0),
		position(104,568,0),
		position(112,569,0),
		position(89,586,0),
		position(84,586,0),
		position(96,588,0),
		position(83,597,0),
		position(90,606,0),
		position(93,613,0),
		position(78,621,0),
		position(113,609,0),
		position(119,618,0),
		position(128,624,0),
		position(135,615,0),
		position(137,604,0),
		position(125,591,0),
		position(127,581,0),
		position(113,587,0),
		position(111,596,0),
		position(121,548,0),
		position(105,600,0),
		position(68,580,0),
		position(122,570,0),};

	-- isEnemy[enemyID]~=nil means: This is an enemy to attack
    isEnemy={};
    
end

-- Returns the distance squared between 2 points; neglects the z-coordinate
function squaredDistance(posA,posB)
	return (posA.x-posB.x)*(posA.x-posB.x)+(posA.y-posB.y)*(posA.y-posB.y)
end

-- Returns either a random waypoint that lies within the required radius
-- or, if there is none, the closest waypoint.
function getNextPoint(Pos,PCloud,Radius)
	dummyList={};
	minDistSq=10000;
	minDistPos=Pos;
	for key,targPos in pairs(PCloud) do
		distSq=squaredDistance(Pos,targPos);
		if distSq<=Radius*Radius then	-- find all points within radius
			table.insert(dummyList,targPos)
		end
		if distSq<minDistSq then		-- find closest point
			minDistPos=targPos;
		end
	end
	dummyLen = # dummyList;
	if dummyLen>0 then
		return dummyList[math.random(dummyLen)]
	else
		return minDistPos;
	end
end

-- Set clothes, weapons, hair/beard, colors, waypoints + set on this route, talking-skills
function onSpawn(Guard)
    initGuard(Guard);
	newPt=getNextPoint(Guard.pos,cloud,20)
	Guard.waypoints:addWaypoint(newPt);
	Guard.waypoints:addWaypoint(getNextPoint(newPt,cloud,20));
    Guard:setOnRoute(true);
end

-- Check if the enemy should be attacked, return true (did something) or false (nothing),
-- not called if enemy is in attack range
function enemyNear(Guard,Enemy)
    return false;
end

-- Who should be attacked, return index of char in candList; return 0 to ignore everyone completely.
-- ATM: 1) check if there's someone already on the enemylist, 2) then check for "sign"
function setTarget(Guard, candList)
    for key,target in pairs(candList) do            -- search list for someone
        --target:inform("now checking...");
        if isEnemy[target.id] ~= nil then			-- attack this guy
            return key;
        end
        myTar=target;
        if string.find(target.lastSpokenText,"me")~=nil then    -- who said ".*me.*" -> THIS SHOULD GENERALLY BE SOME MARK WHO TO ATTACK
            target:inform("gotcha");
            return key;
        end
    end    
    -- no targets any longer: go back on route:
    if Guard:getOnRoute()==false then
        Guard:setOnRoute(true);
    end
    return 0;       -- don't attack anyone.
end


function enemyOnSight(Guard,Enemy)
    return false;
end

-- attack back, whoever it is (set on isEnemy-List!)
function onAttacked(Guard,Enemy)
    isEnemy[Enemy.id]=1;		-- this one is put on our list of enemys
    Guard:talk(Character.yell, "I am under attack, help!");
    monster.base.kills.setLastAttacker(Guard,Enemy)
end


-- attack back, whoever it is
function onCasted(Guard,Enemy)
    monster.base.kills.setLastAttacker(Guard,Enemy)
end


-- if someone is talking to you, stand still and talk back (a little)
-- also check if the character should be attacked!
function receiveText(Guard, type, text, originator)
    -- check distance
    if originator.id ~= Guard.id then
        if originator:getType()==0 then		-- A player!
            if (Guard:distanceMetric(originator)<5) then	-- stands close
                if Guard:getOnRoute() then
                    Guard:setOnRoute(false);		-- get off the route
                end
            end
        elseif originator:getType()==1 and type==Character.yell then   	-- Guard yells for help!
            text=string.lower(text);
            if (string.find(text,"help") ~= nil) then          			-- run to the corresponding guard!
                if Guard:getOnRoute() then
                    Guard:setOnRoute(false);
                end
                -- use getStepList
                Guard:talk(Character.yell, "I am coming!");
            end
        end
    end
end


-- is called once a guard is set off his route or when his route is simply finished
function abortRoute(Guard)
    Guard:talk(Character.say,"ABORTING ROUTE NOW!");
    restList=Guard.waypoints:getWaypoints();
    if (# restList==0) then
        Guard:talk(Character.say,"no more WP!");
        Guard.waypoints:addWaypoint(getNextPoint(Guard.pos,cloud,20));
        Guard:setOnRoute(true);
    elseif (# restList > 0) then  -- aborted route we because can't reach WP
        Guard:talk(Character.say,"Ignoring this WP now.");
        table.remove(restList,1);   -- remove this waypoint from list
        Guard.waypoints:clear();
        Guard.waypoints:addWaypoint(getNextPoint(Guard.pos,cloud,20));
        Guard:setOnRoute(true);
    end
    --Guard:talk(Character.say,"my list has now this number of entries: "..# Guard.waypoints:getWaypoints());
end

-- spawn loot
function onDeath(Guard)

end
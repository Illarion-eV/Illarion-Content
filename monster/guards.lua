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
   
    -- manage the route to walk:
    WPList={position(6,9,0), 
            position(16,14,0),
            position(27,3,0),
            position(30,13,0),
            position(20,15,0)};
    Guard.waypoints:addFromList(WPList);
    Guard:setOnRoute(true);

    isEnemy={};
    
end

-- Set clothes, weapons, hair/beard, colors
function onSpawn(Guard)
    initGuard(Guard);
end

-- Check if the enemy should be attacked, return true (did something) or false (nothing),
-- not called if enemy is in attack range
function enemyNear(Guard,Enemy)
    return false;
end

-- 6,9  16,14  27,3  30,13  20,15

-- Who should be attacked, return index of char in candList; return 0 to ignore everyone completely.
-- ATM: 1) check if there's someone already on the enemylist, 2) then check for "sign"
function setTarget(Guard, candList)
    for key,target in pairs(candList) do                      -- search list for someone
        target:inform("now checking...");
        if isEnemy[target.id] ~= nil then
            return key;
        end
        myTar=target;
        if string.find(target.lastSpokenText,"me")~=nil then    -- who said ".*me.*"
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
    isEnemy[Enemy.id]=1;
    Guard:talk(Character.yell, "I am under attack, help!");
end


-- attack back, whoever it is
function onCasted(Guard,Enemy)

end


-- if someone is talking to you, stand still and talk back (a little)
-- also check if the character should be attacked!
function receiveText(Guard, type, text, originator)
    -- check distance
    if originator.id ~= Guard.id then
        if originator:getType()==0 then
            if (Guard:distanceMetric(originator)<5) then
                if Guard:getOnRoute() then
                    Guard:setOnRoute(false);
                end
            end
        elseif originator:getType()==1 and type==Character.yell then        -- Monster yells for help!
            text=string.lower(text);
            if (string.find(text,"help") ~= nil) then          -- run to the corresponding guard!
                if Guard:getOnRoute() then
                    Guard:setOnRoute(false);
                end
                -- use getStepList
                Guard:talk(Character.yell, "I am coming!");
            end
        end
    end
end


function abortRoute(Guard)
Guard:talk(Character.say,"ABORTING ROUTE NOW!");
    restList=Guard.waypoints:getWaypoints();
    if restList==nil then
        Guard:talk(Character.say,"no more WP!");
        WPList={position(6,9,0), 
            position(16,14,0),
            position(27,3,0),
            position(30,13,0),
            position(20,15,0)};
        Guard.waypoints:addFromList(WPList);
        Guard:setOnRoute(true);
    end
    Guard:talk(Character.say,"my list has now this number of entries: "..# Guard.waypoints:getWaypoints());
end


-- spawn loot
function onDeath(Guard)

end
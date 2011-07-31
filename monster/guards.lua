module("monster.guards", package.seeall)


function initGuard(Guard)
    Guard:increaseSkill(1,"human language",100);
    Guard:increaseSkill(1,"common language",100);
    Guard:talk(Character.say, "This is my script!");
    
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
    
--[[
    myTar:inform("check done");
    if (firstWP==nil) then                          -- if there was noone found
        monsterPos=Monster.pos;                                 -- let the monster have WP
        targetPos=position(monsterPos.x+10,monsterPos.y+10,monsterPos.z);
        WPList={targetPos,monsterPos,targetPos,monsterPos};
        Monster.waypoints:addFromList(WPList);
        Monster:setOnRoute(true);
        firstWP=1;
        myTar:inform("habe firstWP in setTarget gesetzt!");
    end
--]]
    
    return 0;
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
                
                Guard:talk(Character.yell, "I am coming!");
            end
        end
    end
end


function abortRoute(Guard)

end


-- spawn loot
function onDeath(Guard)

end
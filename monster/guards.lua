module("monster.guards", package.seeall)

-- Set clothes, weapons, hair/beard, colors
function onSpawn(Guard)
    Guard:increaseSkill(1,"common language",100);
    Guard:talk(Character.say, "This is my script!");
end

-- Check if the enemy should be attacked, return true (did something) or false (nothing),
-- not called if enemy is in attack range
function enemyNear(Guard,Enemy)

    return false;
end


-- Who should be attacked, return index of char in candList; return 0 to ignore completely.
function setTarget(Guard, candList)
    for key,target in pairs(candList) do                      -- search list for someone
        target:inform("now checking...");
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

end


-- attack back, whoever it is
function onAttacked(Guard,Enemy)

end


-- attack back, whoever it is
function onCasted(Guard,Enemy)

end


-- if someone is talking to you, stand still and talk back (a little)
function receiveText(Guard, type, text, originator)

end


function abortRoute(Guard)

end


-- spawn loot
function onDeath(Guard)

end
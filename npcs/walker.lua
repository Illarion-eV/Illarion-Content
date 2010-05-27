require( "npcs.base.walking" );
module("npcs.walker")

function nextCycle()
    if not slowdown then
        slowdown = 0;
        thisNPC:increaseSkill(1,"common language",100-thisNPC:getSkill("common language"));
    end
    
    slowdown = slowdown + 1;
    if slowdown == 9 then
        slowdown = 0;
        npcs.base.walking.BW_StepAlongRoad( thisNPC );
    end        
end
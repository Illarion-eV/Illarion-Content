require( "npc.base.walking" );
module("npc.walker", package.seeall)

function nextCycle()
    if not slowdown then
        slowdown = 0;
        thisNPC:increaseSkill(1,"common language",100-thisNPC:getSkill("common language"));
    end
    
    slowdown = slowdown + 1;
    if slowdown == 9 then
        slowdown = 0;
        npc.base.walking.BW_StepAlongRoad( thisNPC );
    end        
end

--Name:        ?
--Race:        ?
--Town:        ?
--Function:    ?
--Position:    x=4 y=12 z=0
--Facing:      ?
--Last Update: 09/14/2010
--Update by:   Vilarion

require("npc._logmodule")
module("npc._logtest", package.seeall)
    
function nextCycle()
    if not logtestinit then
        thisNPC:increaseSkill(1,"common language",100);
        logtestinit = true;
    end;
end		

function receiveText(texttype, message, originator)
    if message=="top" then
        thisNPC:talk(CCharacter.say,"Producing top level error...");
        local a=4/0;
    elseif message=="mod" then
        thisNPC:talk(CCharacter.say,"Producing module level error...");
        npc._logmodule.modError();
    end;
    thisNPC:talk(CCharacter.say,"works"); 
end
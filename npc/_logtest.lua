--Name:        ?
--Race:        ?
--Town:        ?
--Function:    ?
--Position:    x=4 y=12 z=0
--Facing:      ?
--Last Update: 09/14/2010
--Update by:   Vilarion

module("npc._logtest", package.seeall)
    
function nextCycle()

end		

function receiveText(texttype, message, originator)
   if message=="top" then
       a=4;
   end;
   thisNPC:talk(CCharacter.say,"works"); 
end
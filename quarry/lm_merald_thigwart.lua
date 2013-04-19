require("npc.lightmaster");
module("npc.lm_merald_thigwart", package.seeall)

WaypointList[1] = {}; -- Troll's Bane
WaitingList[1] = {}; -- Troll's Bane
LightList[1] = {}; -- Troll's Bane

Waypoint:new(position(-57,-118,0),1,Light:new(position(-56,-118,0),OILLAMP_H));
Waypoint:new(position(-62,-118,0),1);
Waypoint:new(position(-62,-121,0),1,Light:new(position(-63,-121,0),CANDLES_W));
Waypoint:new(position(-59,-121,0),1);
Waypoint:new(position(-59,-118,0),1);
Waypoint:new(position(-62,-116,0),1);
Waypoint:new(position(-57,-116,0),1);
Waypoint:new(position(-67,-116,0),1);
Waypoint:new(position(-67,-117,0),1,Light:new(position(-67,-119,0),TORCH_W));
Waypoint:new(position(-70,-117,0),1);
Waypoint:new(position(-70,-121,0),1,Light:new(position(-67,-121,0),TORCH_W));
Waypoint:new(position(-72,-116,0),1);
Waypoint:new(position(-72,-121,0),1);
Waypoint:new(position(-72,-129,0),1);
Waypoint:new(position(-62,-129,0),1);
Waypoint:new(position(-62,-131,0),1,Light:new(position(-62,-132,0),CANDLES_S));
Waypoint:new(position(-58,-131,0),1,Light:new(position(-57,-131,0),CANDLES_W));
Waypoint:new(position(-58,-136,0),1,Light:new(position(-58,-137,0),CANDLES_W),4);
Waypoint:new(position(-58,-135,0),1,Light:new(position(-57,-135,0),TORCH_W));
Waypoint:new(position(-66,-129,0),1);
Waypoint:new(position(-66,-127,0),1,nil,6);
Waypoint:new(position(-59,-124,0),1,nil,4);
Waypoint:new(position(-72,-127,0),1);

GLOOKAT = "Ein schon etwas gealterter Mann. Er trägt einen langen, schwarzen Mantel und hält eine Laterne in der Hand.";
ELOOKAT = "An aged man. He wears a long, black coat and has a lantern in his hand.";
GENDER = 0;
WAITING = -1;
DUSK = 20;
DAWN = 6;

function useNPC(user)
	npc.lightmaster.LM_useNPC(user);
end

function nextCycle()
	npc.lightmaster.LM_nextCycle();
end

function receiveText(texttype, message, originator)
	npc.lightmaster.LM_receiveText(texttype, message, originator);
end

function lookAtNpc(Char, mode)
	npc.lightmaster.LM_lookAtNpc(Char, mode);
end

-- This is the test LUA NPC. This located at 15, 15, 33 and does nothing by
-- default. The script is fetched from /home/nitram/testnpc/npc_test.lua
-- This NPC is required to work correctly with the realtime NPC Update System

--dofile("/home/nitram/testnpc/npc_test.lua");

module("npc.test", package.seeall)

function receiveText(texttype, message, speaker)
speaker:warp(position(18, 18, 33));
speaker:inform("TEST"); 
end;
function nextCycle() end;
function lookAtNpc(char, mode) end;
function useNPC(char, counter, param) end;
-- END
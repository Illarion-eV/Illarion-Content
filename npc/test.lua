-- This is the test LUA NPC. This located at 15, 15, 33 and does nothing by
-- default. The script is fetched from /home/nitram/testnpc/npc_test.lua
-- This NPC is required to work correctly with the realtime NPC Update System

--dofile("/home/nitram/testnpc/npc_test.lua");

module("npc.test", package.seeall)

function receiveText(texttype, message, speaker)
speaker:warp(position(18, 18, 33));
speaker:inform("TEST"); 
end;

function nextCycle()
    if (justOnce == nil) then
        justOnce = true;
        local globalLua = to_string(_G);
        
        file = io.open("/home/nitram/testnpc/output.txt","w");
        file:write(globalLua);
        file:close();
    end;
end;
function lookAtNpc(char, mode) end;
function useNPC(char, counter, param) end;
-- END

function table_print (tt, indent, done)
done = done or {}
indent = indent or 0
if type(tt) == "table" then
local sb = {}
for key, value in pairs (tt) do
table.insert(sb, string.rep (" ", indent)) -- indent it
if type (value) == "table" and not done [value] then
done [value] = true
table.insert(sb, "{\n");
table.insert(sb, npc.test.table_print (value, indent + 2, done))
table.insert(sb, string.rep (" ", indent)) -- indent it
table.insert(sb, "}\n");
elseif "number" == type(key) then
table.insert(sb, string.format("\"%s\"\n", value .. ""))
else
table.insert(sb, string.format(
    "%s = \"%s\"\n", key .. "", value .. ""))
    end
    end
    return table.concat(sb)
else
return tt .. "\n"
end
end

function to_string( tbl )
if  "nil"       == type( tbl ) then
return "nil";
elseif  "table" == type( tbl ) then
return table_print(tbl)
elseif  "string" == type( tbl ) then
return tbl
else
return tostring(tbl)
end
end
 
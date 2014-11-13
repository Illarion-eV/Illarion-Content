--[[
Illarion Server

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, either version 3 of the License, or (at your option) any
later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU Affero General Public License for more
details.

You should have received a copy of the GNU Affero General Public License along
with this program.  If not, see <http://www.gnu.org/licenses/>. 
]]
-- Quest: A Question of Honour (111)/(115)
local common = require("base.common")

local M = {}


local waypoint={}; --a list with positions
waypoint[1]=position(121,547,0); --1: Palace
waypoint[2]=position(107,558,0); --2: Notary
waypoint[3]=position(114,634,0); --3: Gate
local messageG={};
messageG[1]="[Queststatus] Im Palast scheint alles in Ordnung zu sein.";
messageG[2]="[Queststatus] Reret Odohir scheint es gut zu gehen.";
messageG[3]="[Queststatus] Horatio Milenus bewacht das Tor wie eh und je.";
local messageE={};
messageE[1]="[Quest status] All is quiet in the palace.";
messageE[2]="[Quest status] Reret Odohir seems to be doing well.";
messageE[3]="[Quest status] Horatio Milenus guards the gate just like he should be doing.";


function M.MoveToField(User)
    
   if (User:getQuestProgress(111) == 4) then --OK, the player does the quest
   
       queststatus=User:getQuestProgress(115); --here, we save which fields were visited
      
       queststatuslist={};
       queststatuslist=common.Split_number(queststatus, 3); --reading the digits of the queststatus as table
      
      for i=1,3 do
          if User:isInRangeToPosition(waypoint[i],2) and queststatuslist[i] == 0 then
              queststatuslist[i]=1; --found it!
              common.InformNLS(User,messageG[i],messageE[i]); --sending a message
              User:setQuestProgress(115,queststatuslist[1]*100+queststatuslist[2]*10+ queststatuslist[3]*1); --saving the new queststatus
              queststatus=User:getQuestProgress(115); --and reading it again
            if queststatus==111 then --found all waypoints
               User:setQuestProgress(111, 5); --Quest solved!
               common.InformNLS(User,"[Queststatus] Du hast deine Patroullie erfolgreich abgeschlossen.","[Quest status] You completed your patrol successfully."); --sending a message
               return; --more than solving isn't possible, bailing out
            end
         end
      end   
   end
end
return M


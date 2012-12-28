-- Quest: A Question of Honour (111)/(115)
require("base.common")

module("triggerfield.aquestionofhonour_1", package.seeall)

function Init()

    if InitDone then
        return
    end
   
      waypoint={}; --a list with positions
      waypoint[1]=position(121,547,0); --1: Palace
      waypoint[2]=position(107,558,0); --2: Notary
      waypoint[3]=position(114,634,0); --3: Gate
      messageG={};
      messageG[1]="[Queststatus] Im Palast scheint alles in Ordnung zu sein.";
      messageG[2]="[Queststatus] Torina Scibrim scheint es gut zu gehen.";
      messageG[3]="[Queststatus] Horatio Milenus bewacht das Tor wie eh und je.";
      messageE={};
      messageE[1]="[Quest status] All is quiet in the palace.";
      messageE[2]="[Quest status] Torina Scibrim seems to be doing well.";
      messageE[3]="[Quest status] Horatio Milenus guards the gate just like he should be doing.";
      InitDone = true;
    
end

function MoveToField(User)
    Init();
   if (User:getQuestProgress(111) == 4) then --OK, the player does the quest
   
       queststatus=User:getQuestProgress(115); --here, we save which fields were visited
      
       queststatuslist={};
       queststatuslist=base.common.Split_number(queststatus, 3); --reading the digits of the queststatus as table
      
      for i=1,3 do
          if User:isInRangeToPosition(waypoint[i],2) and queststatuslist[i] == 0 then
              queststatuslist[i]=1; --found it!
              base.common.InformNLS(User,messageG[i],messageE[i]); --sending a message
              User:setQuestProgress(115,queststatuslist[1]*100+queststatuslist[2]*10+ queststatuslist[3]*1); --saving the new queststatus
              queststatus=User:getQuestProgress(115); --and reading it again
            if queststatus==111 then --found all waypoints
               User:setQuestProgress(111, 5); --Quest solved!
               base.common.InformNLS(User,"[Queststatus] Du hast deine Patroullie erfolgreich abgeschlossen.","[Quest status] You completed your patrol successfully."); --sending a message
               return; --more than solving isn't possible, bailing out
            end
         end
      end   
   end
end
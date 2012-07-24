-- Quest: A Question of Honour (111)/(117)
require("base.common")

module("triggerfield.aquestionofhonour_3", package.seeall)

function Init()

    if InitDone then
        return
    end
   
      waypoint={}; --a list with positions
      waypoint[1]=position(697,313,0); --1: Hemp Necktie Inn
      waypoint[2]=position(348,229,0); --2: Galmair
      waypoint[3]=position(903,768,2); --3: Runewick
      messageG={};
      messageG[1]="[Queststatus] Du betrittst den Gasthof zur Hanfschlinge. Was für ein dreckiger, unehrenhafter Ort!";
      messageG[2]="[Queststatus] Der 'Palast' des Dons - Du solltest die Ohren aufsperren, aber nicht deine Geldbörse.";
      messageG[3]="[Queststatus] Unerträgliches Gewäsch kommt aus dem Mund des Erzmagiers. Diesen Unsinn willst du gar nicht erst daheim vermelden.";
      messageE={};
      messageE[1]="[Quest status] You enter the Hemp Necktie Inn. What a filthy and dishonourable place, it doesn't take too long to figure out there is nothing of worth in this place!";
      messageE[2]="[Quest status] The Don's 'palace' - you should drop an ear here but not your purse.";
      messageE[3]="[Quest status] Unbearable babbling comes out of the mouth of the Archmage. You don't want to report this nonsense at home...";
      InitDone = true;
    
end

function MoveToField(User)
    Init();
   if (User:getQuestProgress(111) == 12) then --OK, the player does the quest
   
       queststatus=User:getQuestProgress(117); --here, we save which fields were visited

       queststatuslist={};
       queststatuslist=base.common.Split_number(queststatus, 3); --reading the digits of the queststatus as table
      
      for i=1,3 do
          if User:isInRangeToPosition(waypoint[i],2) and queststatuslist[i] == 0 then
              queststatuslist[i]=1; --found it!
              base.common.InformNLS(User,messageG[i],messageE[i]); --sending a message
              User:setQuestProgress(117,queststatuslist[1]*100+queststatuslist[2]*10+ queststatuslist[3]*1); --saving the new queststatus
              queststatus=User:getQuestProgress(117); --and reading it again
            if queststatus == 111 then --found all waypoints
               User:setQuestProgress(111, 13); --Quest solved!
               base.common.InformNLS(User,"[Queststatus] Du hast deine Patroullie erfolgreich abgeschlossen.","[Quest status] You completed your patrol successfully."); --sending a message
               return; --more than solving isn't possible, bailing out
            end
          end
      end   
   end
end
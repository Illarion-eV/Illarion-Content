-- Quest: A Question of Honour (111)/(116)
require("base.common")

module("triggerfield.aquestionofhonour_2", package.seeall)

function Init()

    if InitDone then
        return
    end
   
      waypoint={}; --a list with positions
      waypoint[1]=position(470,795,0); --1: Eastern border
      waypoint[2]=position(261,679,0); --2: Arena Circle of Blood
      waypoint[3]=position(135,696,0); --3: Mine Cornerstone of Candour
      waypoint[4]=position(236,440,0); --4: Bridge over the Kantabi River (ambush!)
      messageG={};
      messageG[1]="[Queststatus] Du erblickst einen betenden komischen Kauz, als du dich der Ostgrenze näherst.";
      messageG[2]="[Queststatus] den Blutkreis, der Arena des Landes, scheint es nach frischem Blut zu dürsten.";
      messageG[3]="[Queststatus] Der Grundstein der Aufrichtigkeit steht wie ein Fels in der Brandung der Dünen.";
      messageG[4]="[Queststatus] Du überquerst den Kantabifluss. Banditen haben dir wohl aufgelauert, ein Hinterhalt!";
      messageE={};
      messageE[1]="[Quest status] You spot a strange fellow chanting prayers as you approach the eastern border.";
      messageE[2]="[Quest status] The Circle of Blood thirsts for fresh blood but all looks clear.";
      messageE[3]="[Quest status] The Cornerstone of Candour vigilantly resists against the encroaching sand dunes.";
      messageE[4]="[Quest status] As you cross the Kantabi River you hear an uproar of voices, and a band of cloaked men charge you. Ambush!";
      InitDone = true;
    
end

function MoveToField(User)
    Init();
   if (User:getQuestProgress(111) == 9) then --OK, the player does the quest
   
      queststatus=User:getQuestProgress(116); --here, we save which fields were visited
      
      queststatuslist={};
      queststatuslist=base.common.Split_number(queststatus, 4); --reading the digits of the queststatus as table
      
      for i=1,4 do
          if User:isInRangeToPosition(waypoint[i],1) and queststatuslist[i] == 0 then
            queststatuslist[i]=1; --found it!
            base.common.InformNLS(User,messageG[i],messageE[i]); --sending a message
            User:setQuestProgress(116,queststatuslist[1]*1000+queststatuslist[2]*100+ queststatuslist[3]*10+ queststatuslist[4]*1); --saving the new queststatus
            queststatus=User:getQuestProgress(116); --and reading it again
            
            if i==4 then --ambush!
                world:gfx(41,position(239,435,0));
                world:createMonster(5,position(239,435,0),40); --bandit
                world:gfx(41,position(234,430,0));
                world:createMonster(5,position(234,430,0),40); --bandit
                world:gfx(41,position(239,446,0));
                world:createMonster(1,position(239,446,0),40); --human
                world:gfx(41,position(230,441,0));               
                world:createMonster(3,position(230,441,0),40); --mage            
            end
            
            if queststatus==1111 then --found all waypoints
                User:setQuestProgress(111, 10); --Quest solved!
               base.common.InformNLS(User,"[Queststatus] Du hast deine Patroullie erfolgreich abgeschlossen.","[Quest status] You completed your patrol successfully."); --sending a message
               return; --more than solving isn't possible, bailing out
            end
            end
      end   
   end
end
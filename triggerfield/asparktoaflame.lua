-- Quest: A spark to a flame (113)/(114)
require("base.common")

module("triggerfield.asparktoaflame", package.seeall)

function Init()

    if InitDone then
        return
    end
   
      altar={}; --a list with positions
      altar[1]=position(551,133,0); --1: Ushara Goddess of earth
      altar[2]=position(551,143,0); --2: Brágon God of fire
      altar[3]=position(556,141,0); --3: Eldan God of spirit
      altar[4]=position(549,138,0); --4: Tanora/Zelphia Goddess of water
      altar[5]=position(556,135,0); --5: Findari Goddess of air
      messageG={};
      messageG[1]="[Queststatus] Du näherst dich dem Altar Usharas. Eine beruhigende Stille umgibt dich.";
      messageG[2]="[Queststatus] Du näherst dich dem Altar Brágons. Hitze schlägt dir ins Gesicht.";
      messageG[3]="[Queststatus] Du näherst dich dem Altar Eldans. Nachdenklich betrachtest du den Schrein.";
      messageG[4]="[Queststatus] Du näherst dich dem Altar Tanoras. Täuscht du dich oder liegt hier Nebel in der Luft?";
      messageG[5]="[Queststatus] Du näherst dich dem Altar Findaris. Eine Winböe streift durch deine Kleidung.";
      messageE={};
      messageE[1]="[Quest status] You approach the altar of Ushara — the silence is comforting.";
      messageE[2]="[Quest status] You approach the altar of Brágon as a wave of heat engulfs you.";
      messageE[3]="[Quest status] You approach the altar of Eldan, and you are overwhelmed by thoughtful contemplation.";
      messageE[4]="[Quest status] You approach the altar of Tanora shrouded in a dense fog.";      
      messageE[5]="[Quest status] You approach the altar of Findari and swirling gusts of wind billow around you.";
      InitDone = true;
    
end

function MoveToField(User)
    Init();
   if (User:getQuestProgress(113) == 1) then --OK, the player does the quest
   
       queststatus=User:getQuestProgress(114); --here, we save which fields were visited
      
       queststatuslist={};
       queststatuslist=base.common.Split_number(queststatus, 5); --reading the digits of the queststatus as table
      
      for i=1,5 do
          if User:isInRangeToPosition(altar[i],1) and queststatuslist[i] == 0 then
              queststatuslist[i]=1; --found it!
              base.common.TempInformNLS(User,messageG[i],messageE[i]); --sending a message
              User:setQuestProgress(114,queststatuslist[1]*10000+queststatuslist[2]*1000+ queststatuslist[3]*100+queststatuslist[4]*10+queststatuslist[5]*1); --saving the new queststatus
              queststatus=User:getQuestProgress(114); --and reading it again
            if queststatus==11111 then --found all altars
               User:setQuestProgress(113, 2); --Quest solved!
               base.common.TempInformNLS(User,"[Queststatus] Du hast nun alle Altare der Fünf besucht.","[Quest status] You have visited all the altars of the Five."); --sending a message
               return; --more than solving isn't possible, bailing out
            end
            end
      end   
   end
end

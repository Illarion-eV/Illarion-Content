-- Quest: A Question of Honour (111)/(115)
require("base.common")

module("triggerfield.aquestionofhonour_1", package.seeall)

function Init()

    if InitDone then
        return
    end
	
	    waypoint={}; --a list with positions
	    waypoint[1]=position(551,133,0); --1: Palace
	    waypoint[2]=position(551,143,0); --2: Tavern
	    waypoint[3]=position(556,141,0); --3: Gate
		messageG={};
		messageG[1]="[Queststatus] Du näherst dich dem Altar Usharas. Eine beruhigende Stille umgibt dich.";
		messageG[2]="[Queststatus] Du näherst dich dem Altar Brágons. Hitze schlägt dir ins Gesicht.";
		messageG[3]="[Queststatus] Du näherst dich dem Altar Eldans. Nachdenklich betrachtest du den Schrein.";
		messageE={};
		messageE[1]="[Quest status] You approach the altar of Ushara. It is comfortably silent here.";
		messageE[2]="[Quest status] You approach the altar of Brágon. Heat engulfs you.";
		messageE[3]="[Quest status] You approach the altar of Eldan. Thoughtfully, you behold the shrine.";
	    InitDone = true;
    
end

function MoveToField(User)
    Init();
	if (User:getQuestProgress(111) == 4) then --OK, the player does the quest
	
	    queststatus=User:getQuestProgress(115); --here, we save which fields were visited
		
	    queststatuslist={};
		queststatuslist=base.common.Split_number(queststatus, 3); --reading the digits of the queststatus as table
		
		for i=1,3 do
		    if User:isInRangeToPosition(waypoint[i],1) and queststatuslist[i] == 0 then
		        queststatuslist[i]=1; --found it!
		        base.common.InformNLS(User,messageG[i],messageE[i]); --sending a message
				User:setQuestProgress(115,queststatuslist[1]*100+queststatuslist[2]*10+ queststatuslist[3]*1); --saving the new queststatus
				queststatus=User:getQuestProgress(115); --and reading it again
				if queststatus==111 then --found all waypoints
				    User:setQuestProgress(111, 5); --Quest solved!
					base.common.InformNLS(User,"[Queststatus] Du hast nun alle Altare der Fünf besucht.","[Quest status] You visited all altars of the Five"); --sending a message
					return; --more than solving isn't possible, bailing out
				end
            end
		end	
	end
end

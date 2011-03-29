-- Quest: A Question of Honour (111)/(117)
require("base.common")

module("triggerfield.aquestionofhonour_1", package.seeall)

function Init()

    if InitDone then
        return
    end
	
	    waypoint={}; --a list with positions
	    waypoint[1]=position(551,133,0); --1: Hemp Necktie Inn
	    waypoint[2]=position(551,143,0); --2: Galmair
	    waypoint[3]=position(556,141,0); --3: Runewick
		messageG={};
		messageG[1]="[Queststatus] XXX.";
		messageG[2]="[Queststatus] XXX.";
		messageG[3]="[Queststatus] XXX.";
		messageE={};
		messageE[1]="[Quest status] XXX.";
		messageE[2]="[Quest status] XXX.";
		messageE[3]="[Quest status] XXX.";
	    InitDone = true;
    
end

function MoveToField(User)
    Init();
	if (User:getQuestProgress(111) == 12) then --OK, the player does the quest
	
	    queststatus=User:getQuestProgress(117); --here, we save which fields were visited
		
	    queststatuslist={};
		queststatuslist=base.common.Split_number(queststatus, 3); --reading the digits of the queststatus as table
		
		for i=1,3 do
		    if User:isInRangeToPosition(waypoint[i],1) and queststatuslist[i] == 0 then
		        queststatuslist[i]=1; --found it!
		        base.common.InformNLS(User,messageG[i],messageE[i]); --sending a message
				User:setQuestProgress(115,queststatuslist[1]*100+queststatuslist[2]*10+ queststatuslist[3]*1); --saving the new queststatus
				queststatus=User:getQuestProgress(117); --and reading it again
				if queststatus==111 then --found all waypoints
				    User:setQuestProgress(111, 13); --Quest solved!
					base.common.InformNLS(User,"[Queststatus] Du hast deine Patroullie erfolgreich abgeschlossen.","[Quest status] You completed your patrol successfully."); --sending a message
					return; --more than solving isn't possible, bailing out
				end
            end
		end	
	end
end

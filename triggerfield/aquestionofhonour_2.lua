-- Quest: A Question of Honour (111)/(116)
require("base.common")

module("triggerfield.aquestionofhonour_2", package.seeall)

function Init()

    if InitDone then
        return
    end
	
	    waypoint={}; --a list with positions
	    waypoint[1]=position(551,133,0); --1: Eastern border
	    waypoint[2]=position(551,143,0); --2: ???
	    waypoint[3]=position(556,141,0); --3: ???
	    waypoint[4]=position(556,141,0); --3: ???
		messageG={};
		messageG[1]="[Queststatus] TEXT.";
		messageG[2]="[Queststatus] TEXT.";
		messageG[3]="[Queststatus] TEXT.";
		messageG[4]="[Queststatus] TEXT.";
		messageE={};
		messageE[1]="[Quest status] TEXT.";
		messageE[2]="[Quest status] TEXT.";
		messageE[3]="[Quest status] TEXT.";
		messageE[4]="[Quest status] TEXT.";
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
				if queststatus==1111 then --found all waypoints
				    User:setQuestProgress(111, 10); --Quest solved!
					base.common.InformNLS(User,"[Queststatus] Du hast deine Patroullie erfolgreich abgeschlossen.","[Quest status] You completed your patrol successfully."); --sending a message
					return; --more than solving isn't possible, bailing out
				end
            end
		end	
	end
end

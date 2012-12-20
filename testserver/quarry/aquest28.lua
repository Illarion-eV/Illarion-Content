require("base.common");
require("base.factions");

module("quest.aquest28", package.seeall)
function split_questdata(originator)
	local qpg = {};
	local questid = originator:getQuestProgress(29);
	qpg[1]=math.floor(questid/10^3); -- the cow of user
	qpg[2] = math.floor ( (questid-qpg[1]*10^3)/10^2 ); -- counter needed to know how many tasks to do till char gets milk
	qpg[3] = math.floor ( (questid - (qpg[1]*10^3 + qpg[2]*10^2))/10^1 );-- task id part 1
	qpg[4] = math.floor ( (questid - (qpg[1]*10^3 + qpg[2]*10^2 + qpg[3]*10^1))/1 ); -- task id part 2

	local taskid = qpg[3]*10+qpg[4];
	return qpg[1], taskid, qpg[2];
end

function glue_questdata(originator,cow,task,counter)
	local taskpart1 = math.floor(task/10);
	local taskpart2 = math.floor( (task - taskpart1*10));
	local qpg = cow * 1000 + counter * 100+ taskpart1*10+taskpart2;
	originator:setQuestProgress(29, qpg);
end

function wait(timeInSeconds)  --Works ONLY in the nextCycle-function!!!
        if (cycleCounter==nil) then
            cycleCounter=0;
			return false;
        elseif(cycleCounter~=nil and cycleCounter~=(timeInSeconds*10)) then
            cycleCounter=cycleCounter+1;
			return false;
        elseif (cycleCounter==(timeInSeconds*10)) then
			cycleCounter=nil;
			return true;
		end
end

function getTaskItems()
                    --comb, water bucket, lute ,   nothing,bundle of grain, big empty bottle
	local itemlist = {2719 ,52,           335,     0,      249            , 164         };  --EDIT HERE
	return itemlist;
end

function getNumberOfTasks()
	local NumberOfTasks = 6; --EDIT HERE THE NUMBER OF TASKS
	return NumberOfTasks;
end

function PrintTaskText(User, task) --EDIT HERE THE TEXT FOR THE MESSAGES
	if task == 1 then --task 1: Brush the cow with a comb 2719
		base.common.TalkNLS(User, Character.say, "#me beginnt damit die Kuh mit dem Kamm zu bürsten.", "#me starts brushing the cow with a comb.");
	elseif task == 2 then -- task 2: Wash the cow with a water bucket 52
		base.common.TalkNLS(User, Character.say, "#me beginnt damit die Kuh zu waschen.", "#me starts washing the cow.");
	elseif task == 3 then -- play some tunes on a lute for the cow
		base.common.TalkNLS(User, Character.say, "#me spielt der Kuh eine Melodie vor.", "#me plays a melody for the cow.");
	elseif task == 4 then  -- clear the water in the well
		return; --  NOT IN COW SCRIPT, needs to kill monsters in the well
	elseif task == 5 then  -- feed the cow
		base.common.TalkNLS(User, Character.say, "#me gibt der Kuh etwas Getreide zu fressen.", "#me gives the cow some grain to eat.");
	elseif task == 6 then  -- milk the cow
		base.common.TalkNLS(User, Character.say, "#me beginnt die Kuh zu melken.", "#me starts milking the cow.");
	else
		return;
	end
end

function chooseTask(originator)
	local tasklist = {6,5,4,3,2,1};
	local cow, task, counter = split_questdata(originator);
	if counter == 0 then
	    task = 6; --milk cow
	    counter = 3; --3 tasks to do till next milk
	end

	if (originator:getQuestProgress(28) == 1) then
	    task = tasklist[counter];
	else
		task = math.random(getNumberOfTasks());
	end

    glue_questdata(originator,cow,task,counter);
end


function Cow_useNPC(User, CowID, u_act_task,thisNPC)
--base.common.TalkNLS(User, Character.say, "#me muht.", "#me muht.");
	local cow, task, counter = split_questdata(User);
	local itemlist = getTaskItems();
	-- DID PLAYER WAIT 1 DAY till next task?
	aquest28Effect = User.effects:find(32); -- does effect #32 already exist?
	if (aquest28Effect) then
	    return u_act_task;
	end

 	-- TASK OKAY?
	if task==0 then
		return u_act_task;
	end
	-- COW OKAY?
	if cow~=CowID then
		base.common.InformNLS(User, "Dies ist nicht die Kuh um du dich kümmern musst.", "This is not the cow you need to take care of.");
		return u_act_task;
	end
	--ITEM OKAY?
	--local ItemOK = base.common.GetItemInInventory(User, itemlist[task], DataValue); --does he have the right Item for this task in Inventory?
	local ItemOK = User:countItem(itemlist[task]);
	if ItemOK== 0 then
		local gName = world:getItemName(itemlist[task],0); --german
		local eName = world:getItemName(itemlist[task],1); --english
		base.common.InformNLS(User, "Du benötigst den Gegenstand "..gName.." für diese Aufgabe.", "You need the item "..eName.." for this task.")
		return u_act_task;
	end
	--NO ACTIVE TASK CURRENTLY?
	if u_act_task>0 then
		return u_act_task;
	end

	if task == 2 then -- task 2: Wash the cow with a water bucket 52
		User:eraseItem( itemlist[task],1); --delete full bucket
		User:createItem( 51, 1,333,0); --create an empty bucket
	elseif task == 4 then  -- clear the water in the well
		return u_act_task; --  NOT IN COW SCRIPT, needs to kill monsters in the well
	end

	if task < getNumberOfTasks() then
		PrintTaskText(User, task);
		u_act_task = task; --activates task 1 in nextCycle
	end
	
	return u_act_task;
end

function Cow_receiveText(User,message, CowID,thisNPC)
    ----[[ Disabled by Nitram - Spams the error log. BasicNPCChecks is nil
	if base.common. BasicNPCChecks(User,3, thisNPC) then
		if string.find(message,"lute")~=nil or string.find(message,"Laute")~=nil then --a char near the cow is playing lute

			local cow, task, counter = split_questdata(User);
			if (cow == CowID and task ==3) then
				Cow_useNPC(User, CowID, task,thisNPC);
			end
		end
	end
	--]]
end

function Cow_NextCycle(User,n_active_task,thisNPC)
	if n_active_task > 0 then --a task is active
    	if wait(5) then --wait 5 seconds
        	n_active_task = 0;
			if User == nil then   --is user still online?
        		return n_active_task;
        	end
        	local cow, task, counter = split_questdata(User);
            local itemlist = getTaskItems();
            if (math.random( 5 ) == 1) then  -- "Tool Break" by random
               	if task == 1 then
	            	User:eraseItem( itemlist[task],1);
				    base.common.InformNLS( User,
	                "Durch zu starkes Bürsten zerbricht plötzlich der Kamm.",
	                "The comb breaks due to your heavy brushing.");
	            elseif task == 2 then
	            	User:eraseItem( itemlist[task],1);
				    base.common.InformNLS( User,
	                "Der Eimer fällt dir versehentlich zu Boden und zerbricht.",
	                "The bucket falls on the ground and breakes.");
	            end
            end
            if task == 6 then --milk the cow
               counter = 3; --reset the counter
			   if User:getQuestProgress(28) == 1 then --first time doing the task
			   		User:setQuestProgress(28, 2); --first quest done
			   end
			    NumberBottles = User:countItem(itemlist[task]); --number of empty bottles

			    if NumberBottles>3 then
					world:createItem(330,3,333,1); --create Orun-Milk
					world:eraseItem(itemlist[task], 3);
					if NumberBottles <= 10 then
						local NewNumber = NumberBottles -3;--e.g. for 7 bottles NewNumber would be 4
						for i=1,NewNumber,1 do
							if math.random(3) == 2 then
								world:createItem(330,1,333,1); --create Orun-Milk
								world:eraseItem(itemlist[task], 1);
							end
						end
					end
				else
					world:createItem(330,NumberBottles,333,1); --create Orun-Milk
					world:eraseItem(itemlist[task], NumberBottles);
				end
				if (NumberBottles == 1) then
			    	base.common.InformNLS(User, "Du erhältst eine Flasche Orun-Milch aber die Kuh scheint noch genug Milch zu haben, nächstes Mal nimmst du lieber einige Flaschen mehr mit.", "You get a bottle with Orun-Milk but the cow seems still to have enough milk, you better bring some more bottles with you next time.");
				else
			    	base.common.InformNLS(User, "Du erhältst einige Flaschen Orun-Milch.", "You get some bottles with Orun-Milk.");
				end

				----------------give some rankpoints-----------------------
				local PointsToGive = 10; --the amount of rankpoints the user earns for finishing this quest in Runewick
				local fv = base.factions.get(User);
				
				fv[base.factions.rp_index(2)] = fv[base.factions.rp_index(2)] + PointsToGive;
				fv = base.factions.put(User,fv);
				-----------------------------------------------------------
			else
				base.common.TalkNLS(thisNPC, Character.say, "#me scheint sich über die Pflege zu freuen und muht zufrieden.", "#me seems to enjoy the care and gives a content and haunting 'Mooooo!'");
				counter = counter - 1 ;
			end
			task = 0; --reset task
			glue_questdata(User, cow,task,counter); --put the quest data with changes together

			aquest28Effect = LongTimeEffect(32,100); -- create new effect and initialize with nextcalled = 1s
			User.effects:addEffect(aquest28Effect); -- add effect #3         2
		end
	end 
	return n_active_task;
end

function increaseLangSkill(LangList,thisNPC)
    for i=1,table.getn(LangList) do
        setLang=true;
        if (LangList[i]==0) then LangSkill="common language";
        elseif (LangList[i]==1) then LangSkill="human language";
        elseif (LangList[i]==2) then LangSkill="dwarf language";
        elseif (LangList[i]==3) then LangSkill="elf language";
        elseif (LangList[i]==4) then LangSkill="lizard language";
        elseif (LangList[i]==5) then LangSkill="orc language";
        elseif (LangList[i]==6) then LangSkill="halfling language";
        elseif (LangList[i]==7) then LangSkill="fairy language";
        elseif (LangList[i]==8) then LangSkill="gnome language";
        elseif (LangList[i]==9) then LangSkill="goblin language";
        elseif (LangList[i]==10) then LangSkill="ancient language";
        else setLang=false;
        end
        if (setLang==true) then
            thisNPC:increaseSkill(1,LangSkill,100);
        end
    end
end

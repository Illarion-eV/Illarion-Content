--37 cow id, faceto= 6 (west)
--775,793,0
--Mjilka
require("npc.base.autonpcfunctions")
require("quest_aquest28");    --the quest file
module("npc.cow2_aquest28", package.seeall)

function InitNPC()
    if not InitDone then
        InitDone = true;
        CowID = 2; --id of this cow NEEDS TO BE CHANGED AT EACH COW
        
		ActiveTask = 0;
		thisNPC:increaseSkill(1,"common language",100);
		TradSpeakLang={0,1};
		npc.base.autonpcfunctions.increaseLangSkill(TradSpeakLang);
    	thisNPC.activeLanguage=0;
    	
                  --comb, water bucket, lute ,   nothing,bundle of grain, big empty bottle         
        itemlist = quest_aquest28.getTaskItems();
       -- npc_names = { "Betsy", "Mjilka", "Cheeseball"};
    end
end 

function useNPC(originator,Counter,Param)
  	User = getCharForId(originator.id);  --create a save copy of the char struct
	quest_aquest28.Cow_useNPC(User, Counter, Param);
end


function receiveText(texttype, message, originator)
	quest_aquest28.Cow_receiveText(texttype,message,originator);
end

function nextCycle()
    InitNPC();

    quest_aquest28.Cow_NextCycle(User);
end

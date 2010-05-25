--37 cow id, faceto= 6 (west)
--775,791,0
require("npcs.base.autonpcfunctions")
dofile("quest_aquest28.lua");    --the quest file

function InitNPC()
    if not InitDone then
        InitDone = true;
        CowID = 1; --id of this cow NEEDS TO BE CHANGED AT EACH COW
        
		ActiveTask = 0;
		thisNPC:increaseSkill(1,"common language",100);
		TradSpeakLang={0,1};
		increaseLangSkill(TradSpeakLang);
    	thisNPC.activeLanguage=0;
    	
                  --comb, water bucket, lute ,   nothing,bundle of grain, big empty bottle         
        itemlist = getTaskItems();
       -- npc_names = { "Betsy", "Mjilka", "Cheeseball"};
    end
end 

function useNPC(originator,Counter,Param)
  	User = getCharForId(originator.id);  --create a save copy of the char struct
	Cow_useNPC(User, Counter, Param);
end
 

function receiveText(texttype, message, originator)
	Cow_receiveText(texttype,message,originator);
end                

function nextCycle()
    InitNPC();
    
    Cow_NextCycle(User);
end




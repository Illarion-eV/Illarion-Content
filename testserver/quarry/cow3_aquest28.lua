--37 cow id, faceto= 6 (west)
--775,796,0
--Cheeseball

require("base.common")
require("quest.aquest28");    --the quest file
module("npc.cow3_aquest28", package.seeall)
			   

function InitNPC(thisNPC)
    if not InitDone then
        InitDone = true;
        CowID = 3; --id of this cow NEEDS TO BE CHANGED AT EACH COW
        
		acttask3 = 0;
		
		TradSpeakLang={0,1,2,3,4,5,6,7,8,9,10};
		quest.aquest28.increaseLangSkill(TradSpeakLang,thisNPC);
    	thisNPC.activeLanguage=0;
    	
                  --comb, water bucket, lute ,   nothing,bundle of grain, big empty bottle         
        --itemlist = quest.aquest28.getTaskItems();
       -- npc_names = { "Betsy", "Mjilka", "Cheeseball"};
    end
end 

function useNPC(thisNPC,originator)
  	User = getCharForId(originator.id);  --create a save copy of the char struct
  	
	acttask3 = quest.aquest28.Cow_useNPC(User, CowID, acttask3,thisNPC);
end
 

function receiveText(thisNPC,texttype, message, originator)
	quest.aquest28.Cow_receiveText(originator,message, CowID,thisNPC);
end                

function nextCycle(thisNPC)
-- disabled, does not work

    InitNPC(thisNPC);
    
    acttask3 = quest.aquest28.Cow_NextCycle(User,acttask3,thisNPC);
end

-- INSERT INTO npc VALUES (nextval('npc_seq'),3,-102, -71, 0 ,0,false,'Athan Denam','npc_athan_denam.lua',0);
require("npc.base.autonpcfunctions")
module("npc.athan_denam", package.seeall)

function useNPC(user,counter,param)
    thisNPC:increaseSkill(1,"common language",100);
    thisNPC:talkLanguage(Character.say, Player.german, "Finger weg!");
    thisNPC:talkLanguage(Character.say, Player.english, "Don't you touch me!");
end
function initializeNpc()
    if TraderFirst then
        return true;
    end
    
    npc.base.autonpcfunctions.InitTalkLists();
    
    QuestID=556;
    -- ********* START DYNAMIC PART ********
    npc.base.autonpcfunctions.AddCycleText("Die armen Schweinchen","Those poor piggies");
    npc.base.autonpcfunctions.AddCycleText("#me seufzt","#me sighs");
    npc.base.autonpcfunctions.AddTraderTrigger("Hallo","Hallo, mein Freund. Bist du dir sicher, dass du die kleinen Schweinchen töten willst?");
    npc.base.autonpcfunctions.AddConsequence("state",1);
    npc.base.autonpcfunctions.AddCondition("qpg","=",0);
    npc.base.autonpcfunctions.AddTraderTrigger("Grüsse","Grüsse, mein Freund. Bist du dir sicher, dass du die kleinen Schweinchen töten willst?");
    npc.base.autonpcfunctions.AddConsequence("state",1);
    npc.base.autonpcfunctions.AddCondition("qpg","=",0);
    npc.base.autonpcfunctions.AddTraderTrigger("Grüße","Grüße, mein Freund. Bist du dir sicher, dass du die kleinen Schweinchen töten willst?");
    npc.base.autonpcfunctions.AddConsequence("state",1);
    npc.base.autonpcfunctions.AddCondition("qpg","=",0);
    npc.base.autonpcfunctions.AddTraderTrigger("Guten Tag","Guten Tag, mein Freund. Bist du dir sicher, dass du die kleinen Schweinchen töten willst?");
    npc.base.autonpcfunctions.AddConsequence("state",1);
    npc.base.autonpcfunctions.AddCondition("qpg","=",0);
    npc.base.autonpcfunctions.AddTraderTrigger("Hello","Hello, my friend. Are you really sure that you will kill those lovely piggies?");
    npc.base.autonpcfunctions.AddConsequence("state",1);
    npc.base.autonpcfunctions.AddCondition("qpg","=",0);
    npc.base.autonpcfunctions.AddTraderTrigger("Greetings","Greetings, my friend. Are you really sure that you will kill those lovely piggies?");
    npc.base.autonpcfunctions.AddConsequence("state",1);
    npc.base.autonpcfunctions.AddCondition("qpg","=",0);
    npc.base.autonpcfunctions.AddTraderTrigger("Greets","Greets, my friend. Are you really sure that you will kill those lovely piggies?");
    npc.base.autonpcfunctions.AddConsequence("state",1);
    npc.base.autonpcfunctions.AddCondition("qpg","=",0);
    npc.base.autonpcfunctions.AddTraderTrigger("Be greeted","Be greeted, my friend. Are you really sure that you will kill those lovely piggies?");
    npc.base.autonpcfunctions.AddConsequence("state",1);
    npc.base.autonpcfunctions.AddCondition("qpg","=",0);
    npc.base.autonpcfunctions.AddTraderTrigger("Nein","Du bist ein wahrer Tierfreund. Ich gebe dir etwas gegen deinen Hunger.");
    npc.base.autonpcfunctions.AddCondition("state","=",1);
    npc.base.autonpcfunctions.AddConsequence("state",3);
    npc.base.autonpcfunctions.AddConsequence("item",49,1,333,0);
    npc.base.autonpcfunctions.AddConsequence("qpg",1);
    npc.base.autonpcfunctions.AddTraderTrigger("No","You are a real animals friend. I'll give you something against your hunger.");
    npc.base.autonpcfunctions.AddCondition("state","=",1);
    npc.base.autonpcfunctions.AddConsequence("state",3);
    npc.base.autonpcfunctions.AddConsequence("item",49,1,333,0);
    npc.base.autonpcfunctions.AddConsequence("qpg",1);
    npc.base.autonpcfunctions.AddTraderTrigger("Ja","Kann ich dich nicht umstimmen? Ich gebe dir fünf Kupfer. Dann kannst du dir ein Brot kaufen. Bist du einverstanden?");
    npc.base.autonpcfunctions.AddCondition("state","=",1);
    npc.base.autonpcfunctions.AddConsequence("state",2);
    npc.base.autonpcfunctions.AddTraderTrigger("Yes","Can I change your mind somehow? I will give you five copper. You can buy yourself a bread with the money. Do you consider?");
    npc.base.autonpcfunctions.AddCondition("state","=",1);
    npc.base.autonpcfunctions.AddConsequence("state",2);
    npc.base.autonpcfunctions.AddTraderTrigger("Ja","Du bist klug mein Freund. Hier ist dein Kupfer.");
    npc.base.autonpcfunctions.AddCondition("state","=",2);
    npc.base.autonpcfunctions.AddConsequence("state",3);
    npc.base.autonpcfunctions.AddConsequence("money","+",5);
    npc.base.autonpcfunctions.AddConsequence("qpg",1);
    npc.base.autonpcfunctions.AddTraderTrigger("Yes","You are bright my friend. Here's your copper");
    npc.base.autonpcfunctions.AddCondition("state","=",2);
    npc.base.autonpcfunctions.AddConsequence("state",3);
    npc.base.autonpcfunctions.AddConsequence("money","+",5);
    npc.base.autonpcfunctions.AddConsequence("qpg",1);
    npc.base.autonpcfunctions.AddTraderTrigger("Nein","Dann kann ich dir leider nicht helfen. Mögen dich die Schweine beissen!");
    npc.base.autonpcfunctions.AddCondition("state","=",2);
    npc.base.autonpcfunctions.AddConsequence("state",3);
    npc.base.autonpcfunctions.AddConsequence("qpg",2);
    npc.base.autonpcfunctions.AddTraderTrigger("No","In that case I can't help you. May the pigs bite you!");
    npc.base.autonpcfunctions.AddCondition("state","=",2);
    npc.base.autonpcfunctions.AddConsequence("state",3);
    npc.base.autonpcfunctions.AddConsequence("qpg",2);
    npc.base.autonpcfunctions.AddTraderTrigger("Hallo","Hallo, mein Freund.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddTraderTrigger("Grüsse","Grüsse, mein Freund.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddTraderTrigger("Grüße","Grüße, mein Freund.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddTraderTrigger("Guten Tag","Guten Tag, mein Freund.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddTraderTrigger("Hello","Hello, my friend.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddTraderTrigger("Greetings","Greetings, my friend.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddTraderTrigger("Greets","Greets, my friend.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddTraderTrigger("Be greeted","Be greeted, my friend.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddTraderTrigger("Hallo","Verschwinde, elender Mörder! ");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger("Grüsse","Verschwinde, elender Mörder! ");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger("Grüße","Verschwinde, elender Mörder! ");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger("Guten Tag","Verschwinde, elender Mörder! ");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger("Hello","Get along with you, wretched murderer! ");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger("Greetings","Get along with you, wretched murderer! ");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger("Be greeted","Get along with you, wretched murderer! ");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger("Greets","Get along with you, wretched murderer! ");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    -- ********* END DYNAMIC PART ********
    TradSpeakLang={0,1};
    TradStdLang=0;
    
    npc.base.autonpcfunctions.increaseLangSkill(TradSpeakLang)
    thisNPC.activeLanguage=TradStdLang;
    
end
function nextCycle()  -- ~10 times per second
    initializeNpc();
    npc.base.autonpcfunctions.SpeakerCycle();
end
function receiveText(texttype, message, originator)
    if npc.base.autonpcfunctions.BasicNPCChecks(originator,2) then
        if npc.base.autonpcfunctions.LangOK(originator,TradSpeakLang) then
            npc.base.autonpcfunctions.TellSmallTalk(message,originator);
        else
            npc.base.autonpcfunctions.Confused(
               "#me sieht dich leicht verwirrt an",
               "#me looks at you a little confused"
            );
        end
    end
end

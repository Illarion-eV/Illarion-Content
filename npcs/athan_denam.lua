-- INSERT INTO npc VALUES (nextval('npc_seq'),3,-102, -71, 0 ,0,false,'Athan Denam','npc_athan_denam.lua',0);
dofile("npc_autonpcfunctions.lua")
function useNPC(user,counter,param)
    thisNPC:increaseSkill(1,"common language",100);
    thisNPC:talkLanguage(CCharacter.say, CPlayer.german, "Finger weg!");
    thisNPC:talkLanguage(CCharacter.say, CPlayer.english, "Don't you touch me!");
end
function initializeNpc()
    if TraderFirst then
        return true;
    end
    
    InitTalkLists();
    
    QuestID=556;
    -- ********* START DYNAMIC PART ********
    AddCycleText("Die armen Schweinchen","Those poor piggies");
    AddCycleText("#me seufzt","#me sighs");
    AddTraderTrigger("Hallo","Hallo, mein Freund. Bist du dir sicher, dass du die kleinen Schweinchen töten willst?");
    AddConsequence("state",1);
    AddCondition("qpg","=",0);
    AddTraderTrigger("Grüsse","Grüsse, mein Freund. Bist du dir sicher, dass du die kleinen Schweinchen töten willst?");
    AddConsequence("state",1);
    AddCondition("qpg","=",0);
    AddTraderTrigger("Grüße","Grüße, mein Freund. Bist du dir sicher, dass du die kleinen Schweinchen töten willst?");
    AddConsequence("state",1);
    AddCondition("qpg","=",0);
    AddTraderTrigger("Guten Tag","Guten Tag, mein Freund. Bist du dir sicher, dass du die kleinen Schweinchen töten willst?");
    AddConsequence("state",1);
    AddCondition("qpg","=",0);
    AddTraderTrigger("Hello","Hello, my friend. Are you really sure that you will kill those lovely piggies?");
    AddConsequence("state",1);
    AddCondition("qpg","=",0);
    AddTraderTrigger("Greetings","Greetings, my friend. Are you really sure that you will kill those lovely piggies?");
    AddConsequence("state",1);
    AddCondition("qpg","=",0);
    AddTraderTrigger("Greets","Greets, my friend. Are you really sure that you will kill those lovely piggies?");
    AddConsequence("state",1);
    AddCondition("qpg","=",0);
    AddTraderTrigger("Be greeted","Be greeted, my friend. Are you really sure that you will kill those lovely piggies?");
    AddConsequence("state",1);
    AddCondition("qpg","=",0);
    AddTraderTrigger("Nein","Du bist ein wahrer Tierfreund. Ich gebe dir etwas gegen deinen Hunger.");
    AddCondition("state","=",1);
    AddConsequence("state",3);
    AddConsequence("item",49,1,333,0);
    AddConsequence("qpg",1);
    AddTraderTrigger("No","You are a real animals friend. I'll give you something against your hunger.");
    AddCondition("state","=",1);
    AddConsequence("state",3);
    AddConsequence("item",49,1,333,0);
    AddConsequence("qpg",1);
    AddTraderTrigger("Ja","Kann ich dich nicht umstimmen? Ich gebe dir fünf Kupfer. Dann kannst du dir ein Brot kaufen. Bist du einverstanden?");
    AddCondition("state","=",1);
    AddConsequence("state",2);
    AddTraderTrigger("Yes","Can I change your mind somehow? I will give you five copper. You can buy yourself a bread with the money. Do you consider?");
    AddCondition("state","=",1);
    AddConsequence("state",2);
    AddTraderTrigger("Ja","Du bist klug mein Freund. Hier ist dein Kupfer.");
    AddCondition("state","=",2);
    AddConsequence("state",3);
    AddConsequence("money","+",5);
    AddConsequence("qpg",1);
    AddTraderTrigger("Yes","You are bright my friend. Here's your copper");
    AddCondition("state","=",2);
    AddConsequence("state",3);
    AddConsequence("money","+",5);
    AddConsequence("qpg",1);
    AddTraderTrigger("Nein","Dann kann ich dir leider nicht helfen. Mögen dich die Schweine beissen!");
    AddCondition("state","=",2);
    AddConsequence("state",3);
    AddConsequence("qpg",2);
    AddTraderTrigger("No","In that case I can't help you. May the pigs bite you!");
    AddCondition("state","=",2);
    AddConsequence("state",3);
    AddConsequence("qpg",2);
    AddTraderTrigger("Hallo","Hallo, mein Freund.");
    AddCondition("qpg","=",1);
    AddTraderTrigger("Grüsse","Grüsse, mein Freund.");
    AddCondition("qpg","=",1);
    AddTraderTrigger("Grüße","Grüße, mein Freund.");
    AddCondition("qpg","=",1);
    AddTraderTrigger("Guten Tag","Guten Tag, mein Freund.");
    AddCondition("qpg","=",1);
    AddTraderTrigger("Hello","Hello, my friend.");
    AddCondition("qpg","=",1);
    AddTraderTrigger("Greetings","Greetings, my friend.");
    AddCondition("qpg","=",1);
    AddTraderTrigger("Greets","Greets, my friend.");
    AddCondition("qpg","=",1);
    AddTraderTrigger("Be greeted","Be greeted, my friend.");
    AddCondition("qpg","=",1);
    AddTraderTrigger("Hallo","Verschwinde, elender Mörder! ");
    AddCondition("qpg","=",2);
    AddTraderTrigger("Grüsse","Verschwinde, elender Mörder! ");
    AddCondition("qpg","=",2);
    AddTraderTrigger("Grüße","Verschwinde, elender Mörder! ");
    AddCondition("qpg","=",2);
    AddTraderTrigger("Guten Tag","Verschwinde, elender Mörder! ");
    AddCondition("qpg","=",2);
    AddTraderTrigger("Hello","Get along with you, wretched murderer! ");
    AddCondition("qpg","=",2);
    AddTraderTrigger("Greetings","Get along with you, wretched murderer! ");
    AddCondition("qpg","=",2);
    AddTraderTrigger("Be greeted","Get along with you, wretched murderer! ");
    AddCondition("qpg","=",2);
    AddTraderTrigger("Greets","Get along with you, wretched murderer! ");
    AddCondition("qpg","=",2);
    -- ********* END DYNAMIC PART ********
    TradSpeakLang={0,1};
    TradStdLang=0;
    
    increaseLangSkill(TradSpeakLang)
    thisNPC.activeLanguage=TradStdLang;
    
end
function nextCycle()  -- ~10 times per second
    initializeNpc();
    SpeakerCycle();
end
function receiveText(texttype, message, originator)
    if BasicNPCChecks(originator,2) then
        if LangOK(originator,TradSpeakLang) then
            TellSmallTalk(message,originator);
        else
            Confused(
               "#me sieht dich leicht verwirrt an",
               "#me looks at you a little confused"
            );
        end
    end
end
-- NPC by Sirius- (Forum: Das Auge)
-- INSERT INTO npc VALUES (nextval('npc_seq'),0,-40,-95,0,0,false,'Aeron Ranthir','npc_aeron_ranthir.lua',0);

require("npcs.base.autonpcfunctions")

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

    -- ********* START DYNAMIC PART ********

    -- Botenquest - Sender
    SetRadius(10);
    AddTraderTrigger("hallo","Ich grüße doch herzlich.");
    AddTraderTrigger("grüße","Ich grüße doch herzlich.");
    AddTraderTrigger("tach","Ich grüße doch herzlich.");
    AddTraderTrigger("hiho","Ich grüße doch herzlich.");
    AddCondition("lang","german");
    AddTraderTrigger("hello","Greetings, my friend.");
    AddCondition("lang","english");
    AddTraderTrigger("greetings","Greetings, my friend.");
    AddTraderTrigger("hiho","Greetings, my friend.");
    AddCondition("lang","english");
    AddTraderTrigger("greets","Greetings, my friend.");
    AddTraderTrigger("wer bist","Mich nennt man %NPCNAME, aber nun lenkt mich nicht ab, ich suche jemanden der mir helfen kann.");
    AddTraderTrigger("wer seid","Mich nennt man %NPCNAME, aber nun lenkt mich nicht ab, ich suche jemanden der mir helfen kann.");
    AddTraderTrigger("who are you","My name is %NPCNAME. Are you by any chance looking for work?");
    AddTraderTrigger("ich bin","Freut mich, Euch kennen zu lernen. Sucht Ihr nach Arbeit?");
    AddTraderTrigger("man nennt mich","Freut mich, Euch kennen zu lernen. Suchst Ihr nach Arbeit?");
    AddTraderTrigger("i am","Nice to meet you. Are you looking for work?");
    AddTraderTrigger("auf bald","Wir werden uns sehen. Mögest du von Eldan begleitet werden.");
    AddTraderTrigger("bis dann","Wir werden uns sehen. Mögest du von Eldan begleitet werden.");
    AddTraderTrigger("bis bald","Wir werden uns sehen. Mögest du von Eldan begleitet werden.");
    AddTraderTrigger("gehabt euch wohl","Wir werden uns sehen. Mögest du von Eldan begleitet werden.");
    AddTraderTrigger("gehabet euch wohl","Wir werden uns sehen. Mögest du von Eldan begleitet werden.");
    AddTraderTrigger("bye","We will see. Eldan with you!");
    AddCondition("lang","english");
    AddTraderTrigger("farewell","We will see. May Eldan be with you!");
    AddTraderTrigger("how are you","Well, I'm looking for someone who can help me.");
    AddTraderTrigger("wie geht","Mir? Nunja, ich suche jemanden der mir helfen kann, aber sonst ganz gut, danke.");
    AddTraderTrigger("was verkaufst","Ich verkaufe nichts");
    AddTraderTrigger("was verkauft","Ich verkaufe nichts");
    AddTraderTrigger("list wares"," I sell nothing.");
    AddTraderTrigger("sell"," I sell nothing.");
    AddTraderTrigger("was kaufst","Ich kaufe nichts.");
    AddTraderTrigger("was kauft","Ich kaufe nichts.");
    AddTraderTrigger("buy","I'm not a merchant.");
    AddTraderTrigger("helfen","Natürlich, ich brauche immer Hilfe! Könnt ihr dieses Pergament zu Silya Terelorn nach Varshikar bringen?");
    AddCondition("state","=",0);
    AddConsequence("state","=",1);
    AddTraderTrigger("hilfe","Natürlich, ich brauche immer Hilfe! Könnt ihr dieses Pergament zu Silya Terelorn nach Varshikar bringen?");
    AddCondition("state","=",0);
    AddConsequence("state","=",1);
    AddTraderTrigger("arbeit","Natürlich, ich brauche immer Hilfe! Könnt ihr dieses Pergament zu Silya Terelorn nach Varshikar bringen?");
    AddCondition("state","=",0);
    AddConsequence("state","=",1);
    AddTraderTrigger("help","Sure, can you take this parchment to Silya Terelorn in Varshikar?");
    AddCondition("state","=",0);
    AddConsequence("state","=",1);
    AddTraderTrigger("work","Sure, can you take this parchment to Silya Terelorn in Varshikar?");
    AddCondition("state","=",0);
    AddConsequence("state","=",1);
    AddTraderTrigger("ja","Vielen Dank. Ich würde ja selbst nach Varshikar gehen, jedoch bin ich zurzeit viel zu sehr beschäftigt.");
    AddCondition("state","=",1);
    AddConsequence("item",3109,1,333,2);
    AddConsequence("qpg","=",1);
    AddTraderTrigger("yes","Thank you. I would go there by myself, but I am too busy currently.");
    AddCondition("state","=",1);
    AddConsequence("item",3109,1,333,2);
    AddConsequence("qpg","=",1);
    AddTraderTrigger("arbeit","Ah, du hast den Brief überliefert? Vielen Dank. Hier, deine Belohnung.");
    AddCondition("qpg","=",2);
    AddConsequence("item",399,2,333,0);
    AddConsequence("item",2851,20,333,0);
    AddTraderTrigger("job","Ah, you've given her the message? Thank you. Here is your payment.");
    AddCondition("qpg","=",2);
    AddConsequence("item",399,2,333,0);
    AddConsequence("item",2851,20,333,0);
    AddTraderTrigger("work","Ah, you've given her the message? Thank you. Here is your payment.");
    AddCondition("qpg","=",2);
    AddConsequence("item",399,2,333,0);
    AddConsequence("item",2851,20,333,0);
    AddCycleText("#me blickt sich um, er scheint nach jemandem zu suchen.","#me looks around, he seems to be looking for someone.");
    AddCycleText("#me holt einige Pergamente heraus, notiert etwas und legt sie wieder in seine Tasche.","#me takes out a couple of parchments, scribbles down some notes and puts the parchments back into his bag.");
    AddCycleText("#me streicht sich mit einer Feder am Kopf, als würde er ?berlegen.","#me strokes his forehead with a quill, lost in thought.");
    AddCycleText("#me streicht wild etwas auf einem Pergament durch.","#me furiously crosses out something he has written.");
    -- ********* END DYNAMIC PART ********
    TradSpeakLang={0,1};
    TradStdLang=0;

    increaseLangSkill(TradSpeakLang);
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

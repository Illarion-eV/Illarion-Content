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

    npcs.base.autonpcfunctions.InitTalkLists();

    -- ********* START DYNAMIC PART ********

    -- Botenquest - Sender
    npcs.base.autonpcfunctions.SetRadius(10);
    npcs.base.autonpcfunctions.AddTraderTrigger("hallo","Ich grüße doch herzlich.");
    npcs.base.autonpcfunctions.AddTraderTrigger("grüße","Ich grüße doch herzlich.");
    npcs.base.autonpcfunctions.AddTraderTrigger("tach","Ich grüße doch herzlich.");
    npcs.base.autonpcfunctions.AddTraderTrigger("hiho","Ich grüße doch herzlich.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("hello","Greetings, my friend.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("greetings","Greetings, my friend.");
    npcs.base.autonpcfunctions.AddTraderTrigger("hiho","Greetings, my friend.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("greets","Greetings, my friend.");
    npcs.base.autonpcfunctions.AddTraderTrigger("wer bist","Mich nennt man %NPCNAME, aber nun lenkt mich nicht ab, ich suche jemanden der mir helfen kann.");
    npcs.base.autonpcfunctions.AddTraderTrigger("wer seid","Mich nennt man %NPCNAME, aber nun lenkt mich nicht ab, ich suche jemanden der mir helfen kann.");
    npcs.base.autonpcfunctions.AddTraderTrigger("who are you","My name is %NPCNAME. Are you by any chance looking for work?");
    npcs.base.autonpcfunctions.AddTraderTrigger("ich bin","Freut mich, Euch kennen zu lernen. Sucht Ihr nach Arbeit?");
    npcs.base.autonpcfunctions.AddTraderTrigger("man nennt mich","Freut mich, Euch kennen zu lernen. Suchst Ihr nach Arbeit?");
    npcs.base.autonpcfunctions.AddTraderTrigger("i am","Nice to meet you. Are you looking for work?");
    npcs.base.autonpcfunctions.AddTraderTrigger("auf bald","Wir werden uns sehen. Mögest du von Eldan begleitet werden.");
    npcs.base.autonpcfunctions.AddTraderTrigger("bis dann","Wir werden uns sehen. Mögest du von Eldan begleitet werden.");
    npcs.base.autonpcfunctions.AddTraderTrigger("bis bald","Wir werden uns sehen. Mögest du von Eldan begleitet werden.");
    npcs.base.autonpcfunctions.AddTraderTrigger("gehabt euch wohl","Wir werden uns sehen. Mögest du von Eldan begleitet werden.");
    npcs.base.autonpcfunctions.AddTraderTrigger("gehabet euch wohl","Wir werden uns sehen. Mögest du von Eldan begleitet werden.");
    npcs.base.autonpcfunctions.AddTraderTrigger("bye","We will see. Eldan with you!");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("farewell","We will see. May Eldan be with you!");
    npcs.base.autonpcfunctions.AddTraderTrigger("how are you","Well, I'm looking for someone who can help me.");
    npcs.base.autonpcfunctions.AddTraderTrigger("wie geht","Mir? Nunja, ich suche jemanden der mir helfen kann, aber sonst ganz gut, danke.");
    npcs.base.autonpcfunctions.AddTraderTrigger("was verkaufst","Ich verkaufe nichts");
    npcs.base.autonpcfunctions.AddTraderTrigger("was verkauft","Ich verkaufe nichts");
    npcs.base.autonpcfunctions.AddTraderTrigger("list wares"," I sell nothing.");
    npcs.base.autonpcfunctions.AddTraderTrigger("sell"," I sell nothing.");
    npcs.base.autonpcfunctions.AddTraderTrigger("was kaufst","Ich kaufe nichts.");
    npcs.base.autonpcfunctions.AddTraderTrigger("was kauft","Ich kaufe nichts.");
    npcs.base.autonpcfunctions.AddTraderTrigger("buy","I'm not a merchant.");
    npcs.base.autonpcfunctions.AddTraderTrigger("helfen","Natürlich, ich brauche immer Hilfe! Könnt ihr dieses Pergament zu Silya Terelorn nach Varshikar bringen?");
    npcs.base.autonpcfunctions.AddCondition("state","=",0);
    npcs.base.autonpcfunctions.AddConsequence("state","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("hilfe","Natürlich, ich brauche immer Hilfe! Könnt ihr dieses Pergament zu Silya Terelorn nach Varshikar bringen?");
    npcs.base.autonpcfunctions.AddCondition("state","=",0);
    npcs.base.autonpcfunctions.AddConsequence("state","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("arbeit","Natürlich, ich brauche immer Hilfe! Könnt ihr dieses Pergament zu Silya Terelorn nach Varshikar bringen?");
    npcs.base.autonpcfunctions.AddCondition("state","=",0);
    npcs.base.autonpcfunctions.AddConsequence("state","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("help","Sure, can you take this parchment to Silya Terelorn in Varshikar?");
    npcs.base.autonpcfunctions.AddCondition("state","=",0);
    npcs.base.autonpcfunctions.AddConsequence("state","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("work","Sure, can you take this parchment to Silya Terelorn in Varshikar?");
    npcs.base.autonpcfunctions.AddCondition("state","=",0);
    npcs.base.autonpcfunctions.AddConsequence("state","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("ja","Vielen Dank. Ich würde ja selbst nach Varshikar gehen, jedoch bin ich zurzeit viel zu sehr beschäftigt.");
    npcs.base.autonpcfunctions.AddCondition("state","=",1);
    npcs.base.autonpcfunctions.AddConsequence("item",3109,1,333,2);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("yes","Thank you. I would go there by myself, but I am too busy currently.");
    npcs.base.autonpcfunctions.AddCondition("state","=",1);
    npcs.base.autonpcfunctions.AddConsequence("item",3109,1,333,2);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("arbeit","Ah, du hast den Brief überliefert? Vielen Dank. Hier, deine Belohnung.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddConsequence("item",399,2,333,0);
    npcs.base.autonpcfunctions.AddConsequence("item",2851,20,333,0);
    npcs.base.autonpcfunctions.AddTraderTrigger("job","Ah, you've given her the message? Thank you. Here is your payment.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddConsequence("item",399,2,333,0);
    npcs.base.autonpcfunctions.AddConsequence("item",2851,20,333,0);
    npcs.base.autonpcfunctions.AddTraderTrigger("work","Ah, you've given her the message? Thank you. Here is your payment.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddConsequence("item",399,2,333,0);
    npcs.base.autonpcfunctions.AddConsequence("item",2851,20,333,0);
    npcs.base.autonpcfunctions.AddCycleText("#me blickt sich um, er scheint nach jemandem zu suchen.","#me looks around, he seems to be looking for someone.");
    npcs.base.autonpcfunctions.AddCycleText("#me holt einige Pergamente heraus, notiert etwas und legt sie wieder in seine Tasche.","#me takes out a couple of parchments, scribbles down some notes and puts the parchments back into his bag.");
    npcs.base.autonpcfunctions.AddCycleText("#me streicht sich mit einer Feder am Kopf, als würde er ?berlegen.","#me strokes his forehead with a quill, lost in thought.");
    npcs.base.autonpcfunctions.AddCycleText("#me streicht wild etwas auf einem Pergament durch.","#me furiously crosses out something he has written.");
    -- ********* END DYNAMIC PART ********
    TradSpeakLang={0,1};
    TradStdLang=0;

    npcs.base.autonpcfunctions.increaseLangSkill(TradSpeakLang);
    thisNPC.activeLanguage=TradStdLang;

end

function nextCycle()  -- ~10 times per second
    initializeNpc();
    npcs.base.autonpcfunctions.SpeakerCycle();
end

function receiveText(texttype, message, originator)
    if npcs.base.autonpcfunctions.BasicNPCChecks(originator,2) then
        if npcs.base.autonpcfunctions.LangOK(originator,TradSpeakLang) then
            npcs.base.autonpcfunctions.TellSmallTalk(message,originator);
        else
            npcs.base.autonpcfunctions.Confused(
               "#me sieht dich leicht verwirrt an",
               "#me looks at you a little confused"
            );
        end
    end
end

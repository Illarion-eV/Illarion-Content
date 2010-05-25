-- INSERT INTO npc VALUES (nextval('npc_seq'),0,-281, 40, 0,6,false,'Nicolas','npc_nicolas.lua',0);

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
    
    npcs.base.autonpcfunctions.InitTalkLists();
    
    
    -- ********* START DYNAMIC PART ********
-- QS=1: comes to npc
-- QS=2: got to find thief
QuestID=557;
    npcs.base.autonpcfunctions.AddTraderTrigger("schinken","Die Lieferung mit Schinken habe ich doch schon dem einarmigen Boten gegeben. Ist sie angekommen?");
    npcs.base.autonpcfunctions.AddCondition("state","=",0);
    npcs.base.autonpcfunctions.AddConsequence("state","=",1);
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("schinken","Den Schinken für Marcus habe ich dem eigenartigen Boten gegeben.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("liefer","Die Lieferung mit Schinken habe ich doch schon dem einarmigen Boten gegeben. Ist sie angekommen?");
    npcs.base.autonpcfunctions.AddCondition("state","=",0);
    npcs.base.autonpcfunctions.AddConsequence("state","=",1);
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("liefer","Den Schinken für Marcus habe ich dem eigenartigen Boten gegeben.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("ja","Sehr gut. Wie kann ich euch helfen?");
    npcs.base.autonpcfunctions.AddCondition("state","=",1);
    npcs.base.autonpcfunctions.AddConsequence("state","=",0);
    npcs.base.autonpcfunctions.AddTraderTrigger("nein","Nicht? Wie kann das sein, dieser Bote wurde doch von Marcus geschickt, oder? Jedenfalls sagte er das. Er ist Richtung Westen gegangen.");
    npcs.base.autonpcfunctions.AddCondition("state","=",1);
    npcs.base.autonpcfunctions.AddConsequence("state","=",2);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("bote","Hm. Irgendwie kam er mir eigenartig vor, er kannte Marcus' Namen nicht. Und er wußte glaube ich auch nicht so recht, in welche Richtung er eigentlich sollte.");
    npcs.base.autonpcfunctions.AddCondition("state","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("dieb","Meint ihr, der Bote war ein Dieb? Irgendwie würde das wohl passen, stimmt.");
    npcs.base.autonpcfunctions.AddCondition("state",">",0);
    npcs.base.autonpcfunctions.AddTraderTrigger("marcus","Marcus ist ein Händler in Troll's Bane, ich sollte ihm zehn Stück Schinken liefern.");
    npcs.base.autonpcfunctions.AddCondition("qpg",">",0);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("westen","Ja. Dieser Bote ging nach Westen. Obwohl es doch nach Osten nach Trollsbane geht. Ich hoffe nur das war kein Dieb.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("ham","I gave the delivery with ham to a one-armed carrier already. Did it arrive?");
    npcs.base.autonpcfunctions.AddCondition("state","=",0);
    npcs.base.autonpcfunctions.AddConsequence("state","=",1);
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("ham","I gave that ham for Marcus to that strange carrier he sent.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("deliver","I gave the delivery with ham to a one-armed carrier already. Did it arrive?");
    npcs.base.autonpcfunctions.AddCondition("state","=",0);
    npcs.base.autonpcfunctions.AddConsequence("state","=",1);
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("deliver","I gave that ham for Marcus to that strange carrier he sent.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("yes","Very good. How can I help you?");
    npcs.base.autonpcfunctions.AddCondition("state","=",1);
    npcs.base.autonpcfunctions.AddConsequence("state","=",0);
    npcs.base.autonpcfunctions.AddTraderTrigger("no","It didn't? How could that happen, Marcus sent that carrier, didn't he?At least that's what he said. He left heading west.");
    npcs.base.autonpcfunctions.AddCondition("state","=",1);
    npcs.base.autonpcfunctions.AddConsequence("state","=",2);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("carrier","Hm. Somehow he appeared a little bit strange to me, he didn't know Marcus' name. And it seemed as if he didn't know in which direction to go.");
    npcs.base.autonpcfunctions.AddCondition("state","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("thief","You believe that this carrier was a thief in reality? That would fit somehow, right.");
    npcs.base.autonpcfunctions.AddCondition("state",">",0);
    npcs.base.autonpcfunctions.AddTraderTrigger("marcus","Marcus is a trader in Troll's Bane. I should deliver ten pieces of ham to him.");
    npcs.base.autonpcfunctions.AddCondition("qpg",">",0);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("west","Yes. The carrier headed west. While Trollsbane is in the east. I hope this was no thief.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("Hafen","Genau, das hier ist der Hafen. Ein netter Platz, wenn man den Ozean zu schätzen weiß!");
    npcs.base.autonpcfunctions.AddTraderTrigger("Harbo[u]*r","Exactly, this is the harbor. A nice spot if you like the ocean!");
    npcs.base.autonpcfunctions.AddTraderTrigger("I am","Greetings, %CHARNAME, nice to meet you.");
    npcs.base.autonpcfunctions.AddTraderTrigger("I'm","Greetings, %CHARNAME, nice to meet you.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Ich bin","Seid gegrüßt, %CHARNAME, schön euch zu treffen.");
    npcs.base.autonpcfunctions.AddTraderTrigger("auf bald","Gehabt euch wohl!");
    npcs.base.autonpcfunctions.AddTraderTrigger("beruf","Ich bin Kapitän eines Handelsschiffes. Ich treibe Handel mit Troll's Bane und anderen Städten hier.");
    npcs.base.autonpcfunctions.AddTraderTrigger("buy","I don't buy anything.");
    npcs.base.autonpcfunctions.AddTraderTrigger("bye","Farewell!");
    npcs.base.autonpcfunctions.AddTraderTrigger("dein name","Ich heiße %NPCNAME.");
    npcs.base.autonpcfunctions.AddTraderTrigger("deine aufgabe","Ich bin Kapitän eines Handelsschiffes. Ich treibe Handel mit Troll's Bane und anderen Städten hier.");
    npcs.base.autonpcfunctions.AddTraderTrigger("eure aufgabe","Ich bin Kapitän eines Handelsschiffes. Ich treibe Handel mit Troll's Bane und anderen Städten hier.");
    npcs.base.autonpcfunctions.AddTraderTrigger("farewell","Farewell, thanks for visiting me!");
    npcs.base.autonpcfunctions.AddTraderTrigger("good day","Hello.");
    npcs.base.autonpcfunctions.AddTraderTrigger("gr[üue]+[sß]+e","Seid gegrüßt!");
    npcs.base.autonpcfunctions.AddTraderTrigger("greetings","Be greeted.");
    npcs.base.autonpcfunctions.AddTraderTrigger("greets","Be greeted.");
    npcs.base.autonpcfunctions.AddTraderTrigger("guten tag","Seid gegrüßt!");
    npcs.base.autonpcfunctions.AddTraderTrigger("hail","Be greeted.");
    npcs.base.autonpcfunctions.AddTraderTrigger("hallo","Seid gegrüßt!");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("hallo","Be greeted.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("helfen","Wenn du Hilfe brauchst, geh nach Troll's Bane.");
    npcs.base.autonpcfunctions.AddTraderTrigger("hello","Be greeted.");
    npcs.base.autonpcfunctions.AddTraderTrigger("help","If you need help, visit Troll's Bane.");
    npcs.base.autonpcfunctions.AddTraderTrigger("hilfe","Wenn du Hilfe brauchst, geh nach Troll's Bane.");
    npcs.base.autonpcfunctions.AddTraderTrigger("how are you","I am fine, thanks. How are you?");
    npcs.base.autonpcfunctions.AddTraderTrigger("job","I am just a simple farmer.");
    npcs.base.autonpcfunctions.AddTraderTrigger("kaufen","Ich kaufe nichts.");
    npcs.base.autonpcfunctions.AddTraderTrigger("mein name","Sehr angenehm.");
    npcs.base.autonpcfunctions.AddTraderTrigger("my name","Nice to meet you.");
    npcs.base.autonpcfunctions.AddTraderTrigger("sell","I don't sell anything");
    npcs.base.autonpcfunctions.AddTraderTrigger("verkaufen","Ich handle nicht.");
    npcs.base.autonpcfunctions.AddTraderTrigger("was kaufst","Ich handle nicht.");
    npcs.base.autonpcfunctions.AddTraderTrigger("was tust du","Ich warte auf Händler, die ihre Ware hier abholen.");
    npcs.base.autonpcfunctions.AddTraderTrigger("was tut ihr","Ich warte auf Händler, die ihre Ware hier abholen.");
    npcs.base.autonpcfunctions.AddTraderTrigger("was verkaufst","Ich handle nicht mit euch.");
    npcs.base.autonpcfunctions.AddTraderTrigger("wer seid","Ich bin %NPCNAME.");
    npcs.base.autonpcfunctions.AddTraderTrigger("what buy","I don't trade with you.");
    npcs.base.autonpcfunctions.AddTraderTrigger("what sell","I don't trade with you.");
    npcs.base.autonpcfunctions.AddTraderTrigger("what you do","I wait for traders who pick up their wares here.");
    npcs.base.autonpcfunctions.AddTraderTrigger("who","I am %NPCNAME.");
    npcs.base.autonpcfunctions.AddTraderTrigger("wie geht es","Danke, mir geht es gut.");
    npcs.base.autonpcfunctions.AddTraderTrigger("wie hei[sß]+t du","Ich heiße %NPCNAME.");
    npcs.base.autonpcfunctions.AddTraderTrigger("you name","My name is %NPCNAME.");
    npcs.base.autonpcfunctions.AddTraderTrigger("you Nicolas","Indeed. I'm Nicolas. What can i do for you?");
    npcs.base.autonpcfunctions.AddTraderTrigger("du Nicolas","In der Tat. Ich bin Nicolas. Was kann ich für euch tun?");
    npcs.base.autonpcfunctions.AddTraderTrigger("ihr Nicolas","In der Tat. Ich bin Nicolas. Was kann ich für euch tun?");
    -- ********* END DYNAMIC PART ********
    TradSpeakLang={0,1};
    TradStdLang=0;
    
    npcs.base.autonpcfunctions.increaseLangSkill(TradSpeakLang)
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
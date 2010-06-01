-- INSERT INTO npc VALUES (nextval('npc_seq'),0,-281, 40, 0,6,false,'Nicolas','npc_nicolas.lua',0);

require("npc.base.autonpcfunctions")
module("npc.nicolas", package.seeall)

function useNPC(user,counter,param)
    thisNPC:increaseSkill(1,"common language",100);
    thisNPC:talkLanguage(CCharacter.say, CPlayer.german, "Finger weg!");
    thisNPC:talkLanguage(CCharacter.say, CPlayer.english, "Don't you touch me!");
end

function initializeNpc()
    if TraderFirst then
        return true;
    end
    
    npc.base.autonpcfunctions.InitTalkLists();
    
    
    -- ********* START DYNAMIC PART ********
-- QS=1: comes to npc
-- QS=2: got to find thief
QuestID=557;
    npc.base.autonpcfunctions.AddTraderTrigger("schinken","Die Lieferung mit Schinken habe ich doch schon dem einarmigen Boten gegeben. Ist sie angekommen?");
    npc.base.autonpcfunctions.AddCondition("state","=",0);
    npc.base.autonpcfunctions.AddConsequence("state","=",1);
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddTraderTrigger("schinken","Den Schinken für Marcus habe ich dem eigenartigen Boten gegeben.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddTraderTrigger("liefer","Die Lieferung mit Schinken habe ich doch schon dem einarmigen Boten gegeben. Ist sie angekommen?");
    npc.base.autonpcfunctions.AddCondition("state","=",0);
    npc.base.autonpcfunctions.AddConsequence("state","=",1);
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddTraderTrigger("liefer","Den Schinken für Marcus habe ich dem eigenartigen Boten gegeben.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddTraderTrigger("ja","Sehr gut. Wie kann ich euch helfen?");
    npc.base.autonpcfunctions.AddCondition("state","=",1);
    npc.base.autonpcfunctions.AddConsequence("state","=",0);
    npc.base.autonpcfunctions.AddTraderTrigger("nein","Nicht? Wie kann das sein, dieser Bote wurde doch von Marcus geschickt, oder? Jedenfalls sagte er das. Er ist Richtung Westen gegangen.");
    npc.base.autonpcfunctions.AddCondition("state","=",1);
    npc.base.autonpcfunctions.AddConsequence("state","=",2);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger("bote","Hm. Irgendwie kam er mir eigenartig vor, er kannte Marcus' Namen nicht. Und er wußte glaube ich auch nicht so recht, in welche Richtung er eigentlich sollte.");
    npc.base.autonpcfunctions.AddCondition("state","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger("dieb","Meint ihr, der Bote war ein Dieb? Irgendwie würde das wohl passen, stimmt.");
    npc.base.autonpcfunctions.AddCondition("state",">",0);
    npc.base.autonpcfunctions.AddTraderTrigger("marcus","Marcus ist ein Händler in Troll's Bane, ich sollte ihm zehn Stück Schinken liefern.");
    npc.base.autonpcfunctions.AddCondition("qpg",">",0);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("westen","Ja. Dieser Bote ging nach Westen. Obwohl es doch nach Osten nach Trollsbane geht. Ich hoffe nur das war kein Dieb.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger("ham","I gave the delivery with ham to a one-armed carrier already. Did it arrive?");
    npc.base.autonpcfunctions.AddCondition("state","=",0);
    npc.base.autonpcfunctions.AddConsequence("state","=",1);
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddTraderTrigger("ham","I gave that ham for Marcus to that strange carrier he sent.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddTraderTrigger("deliver","I gave the delivery with ham to a one-armed carrier already. Did it arrive?");
    npc.base.autonpcfunctions.AddCondition("state","=",0);
    npc.base.autonpcfunctions.AddConsequence("state","=",1);
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddTraderTrigger("deliver","I gave that ham for Marcus to that strange carrier he sent.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddTraderTrigger("yes","Very good. How can I help you?");
    npc.base.autonpcfunctions.AddCondition("state","=",1);
    npc.base.autonpcfunctions.AddConsequence("state","=",0);
    npc.base.autonpcfunctions.AddTraderTrigger("no","It didn't? How could that happen, Marcus sent that carrier, didn't he?At least that's what he said. He left heading west.");
    npc.base.autonpcfunctions.AddCondition("state","=",1);
    npc.base.autonpcfunctions.AddConsequence("state","=",2);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger("carrier","Hm. Somehow he appeared a little bit strange to me, he didn't know Marcus' name. And it seemed as if he didn't know in which direction to go.");
    npc.base.autonpcfunctions.AddCondition("state","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger("thief","You believe that this carrier was a thief in reality? That would fit somehow, right.");
    npc.base.autonpcfunctions.AddCondition("state",">",0);
    npc.base.autonpcfunctions.AddTraderTrigger("marcus","Marcus is a trader in Troll's Bane. I should deliver ten pieces of ham to him.");
    npc.base.autonpcfunctions.AddCondition("qpg",">",0);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("west","Yes. The carrier headed west. While Trollsbane is in the east. I hope this was no thief.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger("Hafen","Genau, das hier ist der Hafen. Ein netter Platz, wenn man den Ozean zu schätzen weiß!");
    npc.base.autonpcfunctions.AddTraderTrigger("Harbo[u]*r","Exactly, this is the harbor. A nice spot if you like the ocean!");
    npc.base.autonpcfunctions.AddTraderTrigger("I am","Greetings, %CHARNAME, nice to meet you.");
    npc.base.autonpcfunctions.AddTraderTrigger("I'm","Greetings, %CHARNAME, nice to meet you.");
    npc.base.autonpcfunctions.AddTraderTrigger("Ich bin","Seid gegrüßt, %CHARNAME, schön euch zu treffen.");
    npc.base.autonpcfunctions.AddTraderTrigger("auf bald","Gehabt euch wohl!");
    npc.base.autonpcfunctions.AddTraderTrigger("beruf","Ich bin Kapitän eines Handelsschiffes. Ich treibe Handel mit Troll's Bane und anderen Städten hier.");
    npc.base.autonpcfunctions.AddTraderTrigger("buy","I don't buy anything.");
    npc.base.autonpcfunctions.AddTraderTrigger("bye","Farewell!");
    npc.base.autonpcfunctions.AddTraderTrigger("dein name","Ich heiße %NPCNAME.");
    npc.base.autonpcfunctions.AddTraderTrigger("deine aufgabe","Ich bin Kapitän eines Handelsschiffes. Ich treibe Handel mit Troll's Bane und anderen Städten hier.");
    npc.base.autonpcfunctions.AddTraderTrigger("eure aufgabe","Ich bin Kapitän eines Handelsschiffes. Ich treibe Handel mit Troll's Bane und anderen Städten hier.");
    npc.base.autonpcfunctions.AddTraderTrigger("farewell","Farewell, thanks for visiting me!");
    npc.base.autonpcfunctions.AddTraderTrigger("good day","Hello.");
    npc.base.autonpcfunctions.AddTraderTrigger("gr[üue]+[sß]+e","Seid gegrüßt!");
    npc.base.autonpcfunctions.AddTraderTrigger("greetings","Be greeted.");
    npc.base.autonpcfunctions.AddTraderTrigger("greets","Be greeted.");
    npc.base.autonpcfunctions.AddTraderTrigger("guten tag","Seid gegrüßt!");
    npc.base.autonpcfunctions.AddTraderTrigger("hail","Be greeted.");
    npc.base.autonpcfunctions.AddTraderTrigger("hallo","Seid gegrüßt!");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("hallo","Be greeted.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("helfen","Wenn du Hilfe brauchst, geh nach Troll's Bane.");
    npc.base.autonpcfunctions.AddTraderTrigger("hello","Be greeted.");
    npc.base.autonpcfunctions.AddTraderTrigger("help","If you need help, visit Troll's Bane.");
    npc.base.autonpcfunctions.AddTraderTrigger("hilfe","Wenn du Hilfe brauchst, geh nach Troll's Bane.");
    npc.base.autonpcfunctions.AddTraderTrigger("how are you","I am fine, thanks. How are you?");
    npc.base.autonpcfunctions.AddTraderTrigger("job","I am just a simple farmer.");
    npc.base.autonpcfunctions.AddTraderTrigger("kaufen","Ich kaufe nichts.");
    npc.base.autonpcfunctions.AddTraderTrigger("mein name","Sehr angenehm.");
    npc.base.autonpcfunctions.AddTraderTrigger("my name","Nice to meet you.");
    npc.base.autonpcfunctions.AddTraderTrigger("sell","I don't sell anything");
    npc.base.autonpcfunctions.AddTraderTrigger("verkaufen","Ich handle nicht.");
    npc.base.autonpcfunctions.AddTraderTrigger("was kaufst","Ich handle nicht.");
    npc.base.autonpcfunctions.AddTraderTrigger("was tust du","Ich warte auf Händler, die ihre Ware hier abholen.");
    npc.base.autonpcfunctions.AddTraderTrigger("was tut ihr","Ich warte auf Händler, die ihre Ware hier abholen.");
    npc.base.autonpcfunctions.AddTraderTrigger("was verkaufst","Ich handle nicht mit euch.");
    npc.base.autonpcfunctions.AddTraderTrigger("wer seid","Ich bin %NPCNAME.");
    npc.base.autonpcfunctions.AddTraderTrigger("what buy","I don't trade with you.");
    npc.base.autonpcfunctions.AddTraderTrigger("what sell","I don't trade with you.");
    npc.base.autonpcfunctions.AddTraderTrigger("what you do","I wait for traders who pick up their wares here.");
    npc.base.autonpcfunctions.AddTraderTrigger("who","I am %NPCNAME.");
    npc.base.autonpcfunctions.AddTraderTrigger("wie geht es","Danke, mir geht es gut.");
    npc.base.autonpcfunctions.AddTraderTrigger("wie hei[sß]+t du","Ich heiße %NPCNAME.");
    npc.base.autonpcfunctions.AddTraderTrigger("you name","My name is %NPCNAME.");
    npc.base.autonpcfunctions.AddTraderTrigger("you Nicolas","Indeed. I'm Nicolas. What can i do for you?");
    npc.base.autonpcfunctions.AddTraderTrigger("du Nicolas","In der Tat. Ich bin Nicolas. Was kann ich für euch tun?");
    npc.base.autonpcfunctions.AddTraderTrigger("ihr Nicolas","In der Tat. Ich bin Nicolas. Was kann ich für euch tun?");
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
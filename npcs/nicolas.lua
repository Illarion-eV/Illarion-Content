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
    
    InitTalkLists();
    
    
    -- ********* START DYNAMIC PART ********
-- QS=1: comes to npc
-- QS=2: got to find thief
QuestID=557;
    AddTraderTrigger("schinken","Die Lieferung mit Schinken habe ich doch schon dem einarmigen Boten gegeben. Ist sie angekommen?");
    AddCondition("state","=",0);
    AddConsequence("state","=",1);
    AddCondition("qpg","=",1);
    AddTraderTrigger("schinken","Den Schinken für Marcus habe ich dem eigenartigen Boten gegeben.");
    AddCondition("qpg","=",1);
    AddTraderTrigger("liefer","Die Lieferung mit Schinken habe ich doch schon dem einarmigen Boten gegeben. Ist sie angekommen?");
    AddCondition("state","=",0);
    AddConsequence("state","=",1);
    AddCondition("qpg","=",1);
    AddTraderTrigger("liefer","Den Schinken für Marcus habe ich dem eigenartigen Boten gegeben.");
    AddCondition("qpg","=",1);
    AddTraderTrigger("ja","Sehr gut. Wie kann ich euch helfen?");
    AddCondition("state","=",1);
    AddConsequence("state","=",0);
    AddTraderTrigger("nein","Nicht? Wie kann das sein, dieser Bote wurde doch von Marcus geschickt, oder? Jedenfalls sagte er das. Er ist Richtung Westen gegangen.");
    AddCondition("state","=",1);
    AddConsequence("state","=",2);
    AddConsequence("qpg","=",2);
    AddTraderTrigger("bote","Hm. Irgendwie kam er mir eigenartig vor, er kannte Marcus' Namen nicht. Und er wußte glaube ich auch nicht so recht, in welche Richtung er eigentlich sollte.");
    AddCondition("state","=",2);
    AddTraderTrigger("dieb","Meint ihr, der Bote war ein Dieb? Irgendwie würde das wohl passen, stimmt.");
    AddCondition("state",">",0);
    AddTraderTrigger("marcus","Marcus ist ein Händler in Troll's Bane, ich sollte ihm zehn Stück Schinken liefern.");
    AddCondition("qpg",">",0);
    AddCondition("lang","german");
    AddTraderTrigger("westen","Ja. Dieser Bote ging nach Westen. Obwohl es doch nach Osten nach Trollsbane geht. Ich hoffe nur das war kein Dieb.");
    AddCondition("qpg","=",2);
    AddTraderTrigger("ham","I gave the delivery with ham to a one-armed carrier already. Did it arrive?");
    AddCondition("state","=",0);
    AddConsequence("state","=",1);
    AddCondition("qpg","=",1);
    AddTraderTrigger("ham","I gave that ham for Marcus to that strange carrier he sent.");
    AddCondition("qpg","=",1);
    AddTraderTrigger("deliver","I gave the delivery with ham to a one-armed carrier already. Did it arrive?");
    AddCondition("state","=",0);
    AddConsequence("state","=",1);
    AddCondition("qpg","=",1);
    AddTraderTrigger("deliver","I gave that ham for Marcus to that strange carrier he sent.");
    AddCondition("qpg","=",1);
    AddTraderTrigger("yes","Very good. How can I help you?");
    AddCondition("state","=",1);
    AddConsequence("state","=",0);
    AddTraderTrigger("no","It didn't? How could that happen, Marcus sent that carrier, didn't he?At least that's what he said. He left heading west.");
    AddCondition("state","=",1);
    AddConsequence("state","=",2);
    AddConsequence("qpg","=",2);
    AddTraderTrigger("carrier","Hm. Somehow he appeared a little bit strange to me, he didn't know Marcus' name. And it seemed as if he didn't know in which direction to go.");
    AddCondition("state","=",2);
    AddTraderTrigger("thief","You believe that this carrier was a thief in reality? That would fit somehow, right.");
    AddCondition("state",">",0);
    AddTraderTrigger("marcus","Marcus is a trader in Troll's Bane. I should deliver ten pieces of ham to him.");
    AddCondition("qpg",">",0);
    AddCondition("lang","english");
    AddTraderTrigger("west","Yes. The carrier headed west. While Trollsbane is in the east. I hope this was no thief.");
    AddCondition("qpg","=",2);
    AddTraderTrigger("Hafen","Genau, das hier ist der Hafen. Ein netter Platz, wenn man den Ozean zu schätzen weiß!");
    AddTraderTrigger("Harbo[u]*r","Exactly, this is the harbor. A nice spot if you like the ocean!");
    AddTraderTrigger("I am","Greetings, %CHARNAME, nice to meet you.");
    AddTraderTrigger("I'm","Greetings, %CHARNAME, nice to meet you.");
    AddTraderTrigger("Ich bin","Seid gegrüßt, %CHARNAME, schön euch zu treffen.");
    AddTraderTrigger("auf bald","Gehabt euch wohl!");
    AddTraderTrigger("beruf","Ich bin Kapitän eines Handelsschiffes. Ich treibe Handel mit Troll's Bane und anderen Städten hier.");
    AddTraderTrigger("buy","I don't buy anything.");
    AddTraderTrigger("bye","Farewell!");
    AddTraderTrigger("dein name","Ich heiße %NPCNAME.");
    AddTraderTrigger("deine aufgabe","Ich bin Kapitän eines Handelsschiffes. Ich treibe Handel mit Troll's Bane und anderen Städten hier.");
    AddTraderTrigger("eure aufgabe","Ich bin Kapitän eines Handelsschiffes. Ich treibe Handel mit Troll's Bane und anderen Städten hier.");
    AddTraderTrigger("farewell","Farewell, thanks for visiting me!");
    AddTraderTrigger("good day","Hello.");
    AddTraderTrigger("gr[üue]+[sß]+e","Seid gegrüßt!");
    AddTraderTrigger("greetings","Be greeted.");
    AddTraderTrigger("greets","Be greeted.");
    AddTraderTrigger("guten tag","Seid gegrüßt!");
    AddTraderTrigger("hail","Be greeted.");
    AddTraderTrigger("hallo","Seid gegrüßt!");
    AddCondition("lang","german");
    AddTraderTrigger("hallo","Be greeted.");
    AddCondition("lang","english");
    AddTraderTrigger("helfen","Wenn du Hilfe brauchst, geh nach Troll's Bane.");
    AddTraderTrigger("hello","Be greeted.");
    AddTraderTrigger("help","If you need help, visit Troll's Bane.");
    AddTraderTrigger("hilfe","Wenn du Hilfe brauchst, geh nach Troll's Bane.");
    AddTraderTrigger("how are you","I am fine, thanks. How are you?");
    AddTraderTrigger("job","I am just a simple farmer.");
    AddTraderTrigger("kaufen","Ich kaufe nichts.");
    AddTraderTrigger("mein name","Sehr angenehm.");
    AddTraderTrigger("my name","Nice to meet you.");
    AddTraderTrigger("sell","I don't sell anything");
    AddTraderTrigger("verkaufen","Ich handle nicht.");
    AddTraderTrigger("was kaufst","Ich handle nicht.");
    AddTraderTrigger("was tust du","Ich warte auf Händler, die ihre Ware hier abholen.");
    AddTraderTrigger("was tut ihr","Ich warte auf Händler, die ihre Ware hier abholen.");
    AddTraderTrigger("was verkaufst","Ich handle nicht mit euch.");
    AddTraderTrigger("wer seid","Ich bin %NPCNAME.");
    AddTraderTrigger("what buy","I don't trade with you.");
    AddTraderTrigger("what sell","I don't trade with you.");
    AddTraderTrigger("what you do","I wait for traders who pick up their wares here.");
    AddTraderTrigger("who","I am %NPCNAME.");
    AddTraderTrigger("wie geht es","Danke, mir geht es gut.");
    AddTraderTrigger("wie hei[sß]+t du","Ich heiße %NPCNAME.");
    AddTraderTrigger("you name","My name is %NPCNAME.");
    AddTraderTrigger("you Nicolas","Indeed. I'm Nicolas. What can i do for you?");
    AddTraderTrigger("du Nicolas","In der Tat. Ich bin Nicolas. Was kann ich für euch tun?");
    AddTraderTrigger("ihr Nicolas","In der Tat. Ich bin Nicolas. Was kann ich für euch tun?");
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
-- INSERT INTO npc VALUES (nextval('npc_seq'),0,169,108,100,2,false,'Vandor Serias','npc_vandor_serias.lua',0);

require("npcs.base.autonpcfunctions")
-- dofile("/usr/share/servers/illarionserver/scripts/npc_autonpcfunctions.lua");

function useNPC(user,counter,param)
    thisNPC:increaseSkill(1,"common language",100);
    thisNPC:talkLanguage(CCharacter.say, CPlayer.german, "Finger weg!");
    thisNPC:talkLanguage(CCharacter.say, CPlayer.english, "Dont you touch me!");
end

function initializeNpc()
    if TraderFirst then
        return true;
    end

    InitTalkLists();

    -- ********* START DYNAMIC PART ********

    -- general
    -- small talk
    AddTraderTrigger("Hallo","Grüße, mein Freund. Wenn du etwas übers Glasblasen lernen willst, bist du bei mir genau richtig.");
    AddAdditionalTrigger("gr[üu][sß]");
    AddAdditionalTrigger("Hey");
    AddAdditionalTrigger("grue[sß]");
    AddCondition("lang","german");
    AddCondition("state","=",0);
    AddAdditionalText("Seid gegrüßt. Wenn du etwas übers Glasblasen lernen willst, bist du bei mir genau richtig.");
    AddTraderTrigger("hello","Greetings, my friend. If you want to learn something about glass blowing, then I am the right man.");
    AddAdditionalTrigger("greet");
    AddAdditionalTrigger("hey");
    AddCondition("lang","english");
    AddCondition("state","=",0);
    AddAdditionalText("Be greeted. If you want to learn something about glass blowing, then I am the right man.");
    AddTraderTrigger("Hallo","Grüße, mein Freund. Wo waren wir gerade...?");
    AddAdditionalTrigger("gr[üu][sß]");
    AddAdditionalTrigger("Hey");
    AddAdditionalTrigger("grue[sß]");
    AddCondition("lang","german");
    AddCondition("state",">",0);
    AddAdditionalText("Sei gegrüßt. Wo waren wir gerade...?");
    AddTraderTrigger("hello","Greetings, my friend. Where were we...?");
    AddAdditionalTrigger("greet");
    AddAdditionalTrigger("hey");
    AddCondition("lang","english");
    AddCondition("state",">",0);
    AddAdditionalText("Be greeted. Where were we...?");
    AddTraderTrigger("mein name ist","Freut mich euch kennen zulernen. Ich bin "..thisNPC.name..".");
    AddAdditionalTrigger("ich bin");
    AddTraderTrigger("my name is","Nice to meet you. I am "..thisNPC.name..".");
    AddAdditionalTrigger("i am");
    AddAdditionalTrigger("i'm");
    AddTraderTrigger("wie ist dein name","Ich bin der Glasbläser "..thisNPC.name..".");
    AddAdditionalTrigger("wie ist euer name");
    AddAdditionalTrigger("wie hei[sß]t");
    AddAdditionalText("Ich heiße "..thisNPC.name..".");
    AddTraderTrigger("what is your name","I am the glassblower "..thisNPC.name..".");
    AddAdditionalTrigger("what's your name");
    AddAdditionalTrigger("who are you");
    AddAdditionalText("I am "..thisNPC.name..".");
    AddTraderTrigger("dein beruf","Ich bin Glasbläser.");
    AddAdditionalTrigger("deine aufgabe");
    AddAdditionalTrigger("euer beruf");
    AddAdditionalTrigger("eure aufgabe");
    AddAdditionalTrigger("was machst du");
    AddAdditionalTrigger("was tust du");
    AddAdditionalText("Ich fertige Flaschen an.");
    AddTraderTrigger("your job","I am a glassblower.");
    AddAdditionalTrigger("what do you do");
    AddAdditionalTrigger("your profession");
    AddAdditionalTrigger("what are you doing");
    AddAdditionalText("I make bottels.");
    AddTraderTrigger("was verkauf","Ich verkaufe nichts. Aber ich kann dir das Glasblasen beibringen.");
    AddTraderTrigger("was kauf","Ich kaufe nichts. Aber ich kann dir das Glasblasen beibringen.");
    AddTraderTrigger("what sell","I sell nothing. But I can teach you how to make glass.");
    AddTraderTrigger("What buy","I buy nothing. But I can teach you how to make glass.");
    AddTraderTrigger("bye","Be well.");
    AddAdditionalTrigger("farewell");
    AddAdditionalTrigger("be well");
    AddAdditionalText("Farewell.");
    AddAdditionalText("Good bye.");
    AddTraderTrigger("auf bald","Auf bald.");
    AddAdditionalTrigger("bis bald");
    AddAdditionalTrigger("leb wohl");
    AddAdditionalTrigger("tsch[üu][ßs]");
    AddAdditionalTrigger("mach gut");
    AddAdditionalText("Bis bald.");
    AddAdditionalText("Lebt wohl.");
    -- start teaching
    AddTraderTrigger("glasbläserei","Oh ja, damit kenn' ich mich aus. Soll ich dich in die Kunst des Glasblasens einweihen?");
    AddAdditionalTrigger("glas blasen");
    AddAdditionalTrigger("glasblasen");
    AddAdditionalText("Ich kann dir das Glasblasen beibringen. Möchtest du das?");
    AddConsequence("state","=",1);
    AddTraderTrigger("bei bringen","Ich kann dir das Glasblasen beibringen. Möchtest du das?");
    AddAdditionalTrigger("beibringen");
    AddAdditionalTrigger("zeigen");
    AddAdditionalTrigger("lern");
    AddAdditionalTrigger("hilfe");
    AddCondition("lang","german");
    AddConsequence("state","=",1);
    AddTraderTrigger("aufgabe","Eine Aufgabe für dich habe ich nicht, doch kann ich dir das Glasblasen zeigen. Willst du das?");
    AddAdditionalTrigger("quest");
    AddCondition("lang","german");
    AddConsequence("state","=",1);
    AddTraderTrigger("glass blow","Oh yes, glassblowing is my business. Shall I show you how to do it?");
    AddAdditionalTrigger("glassblow");
    AddConsequence("state","=",1);
    AddTraderTrigger("teach","Do you want me to teach you how to blow glass?");
    AddAdditionalTrigger("show");
    AddAdditionalTrigger("learn");
    AddAdditionalTrigger("help");
    AddConsequence("state","=",1);
    AddTraderTrigger("mission","I have no task for you, but I can show you how to blow glass. Do you want it?");
    AddAdditionalTrigger("task");
    AddAdditionalTrigger("quest");
    AddCondition("lang","english");
    AddConsequence("state","=",1);
    -- STATE 1
    AddTraderTrigger("nein","Nagut, dann komm einfach wieder, wenn du es willst.");
    AddAdditionalTrigger("nicht");
    AddCondition("state","=",1);
    AddConsequence("state","=",0);
    AddTraderTrigger("no","Well, then come back when you want to learn it.");
    AddCondition("state","=",1);
    AddConsequence("state","=",0);
    AddTraderTrigger("ja","Dann gebe ich dir erstmal alles was du brauchst. Packe den Sand und die Pottasche in deinen Gürtel und halte das Glasblasrohr in der Hand. Nun gehe zum Glasschmelzofen und 'benutze' ihn, um Glasblöcke herzustellen. Komm wieder, wenn du mindestens einen Glasblock hast.");
    AddCondition("state","=",1);
    AddConsequence("item",316,10,333,0);
    AddConsequence("item",314,10,333,0);
    AddConsequence("item",311,1,999,0);
    AddConsequence("state","=",2);
    AddTraderTrigger("yes","Then I will give you everything you need. Put the sand and the pott ash in the belt and hold the glass blow pipe in your hand. Then go to the glass melting oven and 'use' it in order to make glass ingots. Come again, when you have at least one ingot.");
    AddCondition("state","=",1);
    AddConsequence("item",316,10,333,0);
    AddConsequence("item",314,10,333,0);
    AddConsequence("item",311,1,999,0);
    AddConsequence("state","=",2);
    -- STATE 2
    AddTraderTrigger("asche","Du hast ja gar keine Pottasche mehr! Na dann, hier hast du noch welche.");
    AddCondition("state",">",1);
    AddCondition("item",314,"all","=",0);
    AddConsequence("item",314,5,333,0);
    AddTraderTrigger("ash","You don't have any ash any more! Well then, here is some more.");
    AddCondition("state",">",1);
    AddCondition("item",314,"all","=",0);
    AddConsequence("item",314,5,333,0);
    AddTraderTrigger("sand","Du hast ja gar keinen Sand mehr! Na dann, hier hast du noch welchen.");
    AddCondition("state",">",1);
    AddCondition("lang","german");
    AddCondition("item",316,"all","=",0);
    AddConsequence("item",316,5,333,0);
    AddTraderTrigger("sand","You don't have any sand any more! Well then, here is some more.");
    AddCondition("state",">",1);
    AddCondition("item",314,"all","=",0);
    AddConsequence("item",316,5,333,0);
    AddTraderTrigger("rohr","Du hast ja gar kein Glasblasrohr mehr! Na dann, hier hast du noch eines.");
    AddCondition("state",">",1);
    AddCondition("item",311,"all","=",0);
    AddConsequence("item",311,1,999,0);
    AddTraderTrigger("pipe","You don't have a glass blowing pipe any more! Well then, here is one more.");
    AddCondition("state",">",1);
    AddCondition("item",311,"all","=",0);
    AddConsequence("item",311,1,999,0);
    -- STATE 3
    AddTraderTrigger("bl[öo]ck","Du hast ja gar keinen Glasblock mehr! Na dann, hier hast du noch welche.");
    AddAdditionalTrigger("bloeck");
    AddCondition("state",">",2);
    AddCondition("item",41,"all","=",0);
    AddConsequence("item",41,5,333,0);
    AddTraderTrigger("ingot","You don't have any glass ingots any more! Well then, here are some more.");
    AddCondition("state",">",2);
    AddCondition("item",41,"all","=",0);
    AddConsequence("item",41,5,333,0);
    AddCondition("state",">",2);
    AddTraderTrigger("ingot","Glass ingots are a necessity for glass blowing. You just need pott ash, sand and a glass melting oven to produce them. If you have no ingots any more and you want to continue, I can give you a couple.");
    AddCondition("state",">",2);
    -- last catch
    -- STATE 1
    AddTraderTrigger(".+","Ich habe gefragt, ob ich dir das Glasblasen beibringen soll. Ja oder nein?");
    AddCondition("lang","german");
    AddCondition("state","=",1);
    AddTraderTrigger(".+","I've asked if I shall teach you how to make glass. Yes or no?");
    AddCondition("lang","english");
    AddCondition("state","=",1);
    -- STATE 2
    AddTraderTrigger(".+","Du hast es hinbekommen, sehr gut. Dann gehen wir einen Schritt weiter. Lass das Glasblasrohr in der Hand, die Glasblöcke bleiben am Gürtel. Gehe wieder zum Glasschmelzofen und 'benutze' diesmal das Glasblasrohr und wähle dann die kleine leere Flasche, um diese herzustellen. Komm wieder, wenn du mindestens eine kleine leere Flasche hast.");
    AddCondition("state","=",2);
    AddCondition("lang","german");
    AddCondition("item",41,"all",">",0);
    AddConsequence("state","=",3);
    AddTraderTrigger(".+","You did it, very good. Now we come to the next step. Keep the glass blowing pipe in your hand and the glass ingots at your belt. Now go back to the glass melting oven and 'use' the glass blow pipe and then choose the small empty bottle in order to produce it. Come again when you have at least one small empty bottle.");
    AddCondition("state","=",2);
    AddCondition("lang","english");
    AddCondition("item",41,"all",">",0);
    AddConsequence("state","=",3);
    AddTraderTrigger(".+","Packe den Sand und die Pottasche in deinen Gürtel und halte das Glasblasrohr in deiner Hand. Nun gehe zum Glasschmelzofen und 'benutze' ihn, um Glasblöcke herzustellen. Komm wieder, wenn du mindestens einen Glasblock hast.");
    AddCondition("state","=",2);
    AddCondition("lang","german");
    AddTraderTrigger(".+","Put the sand and the pott ash in the belt and hold the glass blow pipe in your hand. Then go to the glass melting oven and 'use' it in order to make glass ingots. Come again, when you have at least one ingot.");
    AddCondition("state","=",2);
    AddCondition("lang","english");
    -- STATE 3
    AddTraderTrigger(".+","Du hast es hinbekommen, wunderbar! Mehr brauchst du auch nicht zu wissen, der Rest kommt mit der Übung. Viel Glück und auf bald!");
    AddCondition("state","=",3);
    AddCondition("lang","german");
    AddCondition("item",1317,"all",">",0);
    AddConsequence("state","=",0);
    AddTraderTrigger(".+","You did it, great! I can't teach you anything anymore, you will learn the rest by practising. Good luck and farewell!");
    AddCondition("state","=",3);
    AddCondition("lang","english");
    AddCondition("item",1317,"all",">",0);
    AddConsequence("state","=",0);
    AddTraderTrigger(".+","Lass das Glasblasrohr in der Hand, die Glasblöcke bleiben am Gürtel. Gehe wieder zum Glasschmelzofen und 'benutze' diesmal das Glasblasrohr und wähle dann die kleine leere Flasche, um diese herzustellen. Komm wieder, wenn du mindestens eine kleine leere Flasche hast.");
    AddCondition("state","=",3);
    AddCondition("lang","german");
    AddTraderTrigger(".+","Keep the glass blowing pipe in your hand and the glass ingots at your belt. Now go back to the glass melting oven and 'use' the glass blow pipe and then choose the small empty bottle in order to produce it. Come again when you have at least one small empty bottle.");
    AddCondition("state","=",3);
    AddCondition("lang","english");

    -- standard explanations
    AddTraderTrigger("asche","Pottasche bleibt nach einem Feuer übrig, wenn es ausgebrannt ist. Aber lösch es nicht mit Wasser, denn dann gibt's auch keine Pottasche!");
    AddTraderTrigger("ash","When a fire has burnt out, you can find pott ash as leftover. But don't extinguish it with water, because you won't get any pott ash this way!");
    AddTraderTrigger("sand","Ich denke, man muss in der Wüste nach groben Sand graben und diesen dann sieben, um den Sand zu erhalten, den wir zum Glasblasen brauchen.");
    AddCondition("lang","german");
    AddTraderTrigger("sand","I think one has to dig in the desert for coarse sand and then sieve it in order to get the sand we need for glass blowing.");
    AddCondition("lang","english");
    AddTraderTrigger("bl[öo]ck","Glasblöcke sind die Grundlage für das Glasblasen. Du brauchst nur Pottasche, Sand, ein Glasblasrohr und einen Glasschmelzofen, um welche herzustellen.");
    AddAdditionalTrigger("bloeck");
    AddTraderTrigger("ingot","Glass ingots are a necessity for glass blowing. You just need pott ash, sand, a glass blowing pipe and a glass melting oven to produce them.");
    AddTraderTrigger("rohr","Man braucht ein Glasblasrohr, um Glasblöcke und schließlich alle Glaswaren herzustellen. Ein guter Schmied kann wohl ein Glasblasrohr anfertigen.");
    AddTraderTrigger("pipe","One needs a glass blowing pipe in order to produce glass ingots and finally glass goods. A good smith an surely make a glass blowing pipe.");
    AddTraderTrigger("ofen","Für jeden Schritt braucht man einen Glasschmelzofen. Das ist das große Teil aus Ziegeln da drüben. Jede größere Stadt hat einen. Aber ich hab gleich zwei auf einmal!");
    AddTraderTrigger("oven","For each step one needs a glass melting oven. It is this huge thing over there made of bricks. Every major town has one. But I have two at once!");
    
    -- cycle texts
    AddCycleText("#me dreht ein Glasblasrohr in seiner rechten Hand.","#me turns a glass blow pipe in his right hand.");
    AddCycleText("#me betrachtet eine Flasche in seinen Händen: 'Schönes und klares Glas. So soll es sein!'","#me examines a bottle in his hands: 'Nice and clear glass. This is how it should be!'");
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

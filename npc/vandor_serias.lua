-- INSERT INTO npc VALUES (nextval('npc_seq'),0,169,108,100,2,false,'Vandor Serias','npc_vandor_serias.lua',0);

require("npc.base.autonpcfunctions")
-- dofile("/usr/share/servers/illarionserver/scripts/npc_autonpcfunctions.lua");
module("npc.wandor_serias")

function useNPC(user,counter,param)
    thisNPC:increaseSkill(1,"common language",100);
    thisNPC:talkLanguage(CCharacter.say, CPlayer.german, "Finger weg!");
    thisNPC:talkLanguage(CCharacter.say, CPlayer.english, "Dont you touch me!");
end

function initializeNpc()
    if TraderFirst then
        return true;
    end

    npc.base.autonpcfunctions.InitTalkLists();

    -- ********* START DYNAMIC PART ********

    -- general
    -- small talk
    npc.base.autonpcfunctions.AddTraderTrigger("Hallo","Grüße, mein Freund. Wenn du etwas übers Glasblasen lernen willst, bist du bei mir genau richtig.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("gr[üu][sß]");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npc.base.autonpcfunctions.AddAdditionalTrigger("grue[sß]");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddCondition("state","=",0);
    npc.base.autonpcfunctions.AddAdditionalText("Seid gegrüßt. Wenn du etwas übers Glasblasen lernen willst, bist du bei mir genau richtig.");
    npc.base.autonpcfunctions.AddTraderTrigger("hello","Greetings, my friend. If you want to learn something about glass blowing, then I am the right man.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("greet");
    npc.base.autonpcfunctions.AddAdditionalTrigger("hey");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddCondition("state","=",0);
    npc.base.autonpcfunctions.AddAdditionalText("Be greeted. If you want to learn something about glass blowing, then I am the right man.");
    npc.base.autonpcfunctions.AddTraderTrigger("Hallo","Grüße, mein Freund. Wo waren wir gerade...?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("gr[üu][sß]");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npc.base.autonpcfunctions.AddAdditionalTrigger("grue[sß]");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddCondition("state",">",0);
    npc.base.autonpcfunctions.AddAdditionalText("Sei gegrüßt. Wo waren wir gerade...?");
    npc.base.autonpcfunctions.AddTraderTrigger("hello","Greetings, my friend. Where were we...?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("greet");
    npc.base.autonpcfunctions.AddAdditionalTrigger("hey");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddCondition("state",">",0);
    npc.base.autonpcfunctions.AddAdditionalText("Be greeted. Where were we...?");
    npc.base.autonpcfunctions.AddTraderTrigger("mein name ist","Freut mich euch kennen zulernen. Ich bin "..thisNPC.name..".");
    npc.base.autonpcfunctions.AddAdditionalTrigger("ich bin");
    npc.base.autonpcfunctions.AddTraderTrigger("my name is","Nice to meet you. I am "..thisNPC.name..".");
    npc.base.autonpcfunctions.AddAdditionalTrigger("i am");
    npc.base.autonpcfunctions.AddAdditionalTrigger("i'm");
    npc.base.autonpcfunctions.AddTraderTrigger("wie ist dein name","Ich bin der Glasbläser "..thisNPC.name..".");
    npc.base.autonpcfunctions.AddAdditionalTrigger("wie ist euer name");
    npc.base.autonpcfunctions.AddAdditionalTrigger("wie hei[sß]t");
    npc.base.autonpcfunctions.AddAdditionalText("Ich heiße "..thisNPC.name..".");
    npc.base.autonpcfunctions.AddTraderTrigger("what is your name","I am the glassblower "..thisNPC.name..".");
    npc.base.autonpcfunctions.AddAdditionalTrigger("what's your name");
    npc.base.autonpcfunctions.AddAdditionalTrigger("who are you");
    npc.base.autonpcfunctions.AddAdditionalText("I am "..thisNPC.name..".");
    npc.base.autonpcfunctions.AddTraderTrigger("dein beruf","Ich bin Glasbläser.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("deine aufgabe");
    npc.base.autonpcfunctions.AddAdditionalTrigger("euer beruf");
    npc.base.autonpcfunctions.AddAdditionalTrigger("eure aufgabe");
    npc.base.autonpcfunctions.AddAdditionalTrigger("was machst du");
    npc.base.autonpcfunctions.AddAdditionalTrigger("was tust du");
    npc.base.autonpcfunctions.AddAdditionalText("Ich fertige Flaschen an.");
    npc.base.autonpcfunctions.AddTraderTrigger("your job","I am a glassblower.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("what do you do");
    npc.base.autonpcfunctions.AddAdditionalTrigger("your profession");
    npc.base.autonpcfunctions.AddAdditionalTrigger("what are you doing");
    npc.base.autonpcfunctions.AddAdditionalText("I make bottels.");
    npc.base.autonpcfunctions.AddTraderTrigger("was verkauf","Ich verkaufe nichts. Aber ich kann dir das Glasblasen beibringen.");
    npc.base.autonpcfunctions.AddTraderTrigger("was kauf","Ich kaufe nichts. Aber ich kann dir das Glasblasen beibringen.");
    npc.base.autonpcfunctions.AddTraderTrigger("what sell","I sell nothing. But I can teach you how to make glass.");
    npc.base.autonpcfunctions.AddTraderTrigger("What buy","I buy nothing. But I can teach you how to make glass.");
    npc.base.autonpcfunctions.AddTraderTrigger("bye","Be well.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("farewell");
    npc.base.autonpcfunctions.AddAdditionalTrigger("be well");
    npc.base.autonpcfunctions.AddAdditionalText("Farewell.");
    npc.base.autonpcfunctions.AddAdditionalText("Good bye.");
    npc.base.autonpcfunctions.AddTraderTrigger("auf bald","Auf bald.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("bis bald");
    npc.base.autonpcfunctions.AddAdditionalTrigger("leb wohl");
    npc.base.autonpcfunctions.AddAdditionalTrigger("tsch[üu][ßs]");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mach gut");
    npc.base.autonpcfunctions.AddAdditionalText("Bis bald.");
    npc.base.autonpcfunctions.AddAdditionalText("Lebt wohl.");
    -- start teaching
    npc.base.autonpcfunctions.AddTraderTrigger("glasbläserei","Oh ja, damit kenn' ich mich aus. Soll ich dich in die Kunst des Glasblasens einweihen?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("glas blasen");
    npc.base.autonpcfunctions.AddAdditionalTrigger("glasblasen");
    npc.base.autonpcfunctions.AddAdditionalText("Ich kann dir das Glasblasen beibringen. Möchtest du das?");
    npc.base.autonpcfunctions.AddConsequence("state","=",1);
    npc.base.autonpcfunctions.AddTraderTrigger("bei bringen","Ich kann dir das Glasblasen beibringen. Möchtest du das?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("beibringen");
    npc.base.autonpcfunctions.AddAdditionalTrigger("zeigen");
    npc.base.autonpcfunctions.AddAdditionalTrigger("lern");
    npc.base.autonpcfunctions.AddAdditionalTrigger("hilfe");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddConsequence("state","=",1);
    npc.base.autonpcfunctions.AddTraderTrigger("aufgabe","Eine Aufgabe für dich habe ich nicht, doch kann ich dir das Glasblasen zeigen. Willst du das?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("quest");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddConsequence("state","=",1);
    npc.base.autonpcfunctions.AddTraderTrigger("glass blow","Oh yes, glassblowing is my business. Shall I show you how to do it?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("glassblow");
    npc.base.autonpcfunctions.AddConsequence("state","=",1);
    npc.base.autonpcfunctions.AddTraderTrigger("teach","Do you want me to teach you how to blow glass?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("show");
    npc.base.autonpcfunctions.AddAdditionalTrigger("learn");
    npc.base.autonpcfunctions.AddAdditionalTrigger("help");
    npc.base.autonpcfunctions.AddConsequence("state","=",1);
    npc.base.autonpcfunctions.AddTraderTrigger("mission","I have no task for you, but I can show you how to blow glass. Do you want it?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("task");
    npc.base.autonpcfunctions.AddAdditionalTrigger("quest");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("state","=",1);
    -- STATE 1
    npc.base.autonpcfunctions.AddTraderTrigger("nein","Nagut, dann komm einfach wieder, wenn du es willst.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("nicht");
    npc.base.autonpcfunctions.AddCondition("state","=",1);
    npc.base.autonpcfunctions.AddConsequence("state","=",0);
    npc.base.autonpcfunctions.AddTraderTrigger("no","Well, then come back when you want to learn it.");
    npc.base.autonpcfunctions.AddCondition("state","=",1);
    npc.base.autonpcfunctions.AddConsequence("state","=",0);
    npc.base.autonpcfunctions.AddTraderTrigger("ja","Dann gebe ich dir erstmal alles was du brauchst. Packe den Sand und die Pottasche in deinen Gürtel und halte das Glasblasrohr in der Hand. Nun gehe zum Glasschmelzofen und 'benutze' ihn, um Glasblöcke herzustellen. Komm wieder, wenn du mindestens einen Glasblock hast.");
    npc.base.autonpcfunctions.AddCondition("state","=",1);
    npc.base.autonpcfunctions.AddConsequence("item",316,10,333,0);
    npc.base.autonpcfunctions.AddConsequence("item",314,10,333,0);
    npc.base.autonpcfunctions.AddConsequence("item",311,1,999,0);
    npc.base.autonpcfunctions.AddConsequence("state","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger("yes","Then I will give you everything you need. Put the sand and the pott ash in the belt and hold the glass blow pipe in your hand. Then go to the glass melting oven and 'use' it in order to make glass ingots. Come again, when you have at least one ingot.");
    npc.base.autonpcfunctions.AddCondition("state","=",1);
    npc.base.autonpcfunctions.AddConsequence("item",316,10,333,0);
    npc.base.autonpcfunctions.AddConsequence("item",314,10,333,0);
    npc.base.autonpcfunctions.AddConsequence("item",311,1,999,0);
    npc.base.autonpcfunctions.AddConsequence("state","=",2);
    -- STATE 2
    npc.base.autonpcfunctions.AddTraderTrigger("asche","Du hast ja gar keine Pottasche mehr! Na dann, hier hast du noch welche.");
    npc.base.autonpcfunctions.AddCondition("state",">",1);
    npc.base.autonpcfunctions.AddCondition("item",314,"all","=",0);
    npc.base.autonpcfunctions.AddConsequence("item",314,5,333,0);
    npc.base.autonpcfunctions.AddTraderTrigger("ash","You don't have any ash any more! Well then, here is some more.");
    npc.base.autonpcfunctions.AddCondition("state",">",1);
    npc.base.autonpcfunctions.AddCondition("item",314,"all","=",0);
    npc.base.autonpcfunctions.AddConsequence("item",314,5,333,0);
    npc.base.autonpcfunctions.AddTraderTrigger("sand","Du hast ja gar keinen Sand mehr! Na dann, hier hast du noch welchen.");
    npc.base.autonpcfunctions.AddCondition("state",">",1);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddCondition("item",316,"all","=",0);
    npc.base.autonpcfunctions.AddConsequence("item",316,5,333,0);
    npc.base.autonpcfunctions.AddTraderTrigger("sand","You don't have any sand any more! Well then, here is some more.");
    npc.base.autonpcfunctions.AddCondition("state",">",1);
    npc.base.autonpcfunctions.AddCondition("item",314,"all","=",0);
    npc.base.autonpcfunctions.AddConsequence("item",316,5,333,0);
    npc.base.autonpcfunctions.AddTraderTrigger("rohr","Du hast ja gar kein Glasblasrohr mehr! Na dann, hier hast du noch eines.");
    npc.base.autonpcfunctions.AddCondition("state",">",1);
    npc.base.autonpcfunctions.AddCondition("item",311,"all","=",0);
    npc.base.autonpcfunctions.AddConsequence("item",311,1,999,0);
    npc.base.autonpcfunctions.AddTraderTrigger("pipe","You don't have a glass blowing pipe any more! Well then, here is one more.");
    npc.base.autonpcfunctions.AddCondition("state",">",1);
    npc.base.autonpcfunctions.AddCondition("item",311,"all","=",0);
    npc.base.autonpcfunctions.AddConsequence("item",311,1,999,0);
    -- STATE 3
    npc.base.autonpcfunctions.AddTraderTrigger("bl[öo]ck","Du hast ja gar keinen Glasblock mehr! Na dann, hier hast du noch welche.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("bloeck");
    npc.base.autonpcfunctions.AddCondition("state",">",2);
    npc.base.autonpcfunctions.AddCondition("item",41,"all","=",0);
    npc.base.autonpcfunctions.AddConsequence("item",41,5,333,0);
    npc.base.autonpcfunctions.AddTraderTrigger("ingot","You don't have any glass ingots any more! Well then, here are some more.");
    npc.base.autonpcfunctions.AddCondition("state",">",2);
    npc.base.autonpcfunctions.AddCondition("item",41,"all","=",0);
    npc.base.autonpcfunctions.AddConsequence("item",41,5,333,0);
    npc.base.autonpcfunctions.AddCondition("state",">",2);
    npc.base.autonpcfunctions.AddTraderTrigger("ingot","Glass ingots are a necessity for glass blowing. You just need pott ash, sand and a glass melting oven to produce them. If you have no ingots any more and you want to continue, I can give you a couple.");
    npc.base.autonpcfunctions.AddCondition("state",">",2);
    -- last catch
    -- STATE 1
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Ich habe gefragt, ob ich dir das Glasblasen beibringen soll. Ja oder nein?");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddCondition("state","=",1);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","I've asked if I shall teach you how to make glass. Yes or no?");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddCondition("state","=",1);
    -- STATE 2
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Du hast es hinbekommen, sehr gut. Dann gehen wir einen Schritt weiter. Lass das Glasblasrohr in der Hand, die Glasblöcke bleiben am Gürtel. Gehe wieder zum Glasschmelzofen und 'benutze' diesmal das Glasblasrohr und wähle dann die kleine leere Flasche, um diese herzustellen. Komm wieder, wenn du mindestens eine kleine leere Flasche hast.");
    npc.base.autonpcfunctions.AddCondition("state","=",2);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddCondition("item",41,"all",">",0);
    npc.base.autonpcfunctions.AddConsequence("state","=",3);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","You did it, very good. Now we come to the next step. Keep the glass blowing pipe in your hand and the glass ingots at your belt. Now go back to the glass melting oven and 'use' the glass blow pipe and then choose the small empty bottle in order to produce it. Come again when you have at least one small empty bottle.");
    npc.base.autonpcfunctions.AddCondition("state","=",2);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddCondition("item",41,"all",">",0);
    npc.base.autonpcfunctions.AddConsequence("state","=",3);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Packe den Sand und die Pottasche in deinen Gürtel und halte das Glasblasrohr in deiner Hand. Nun gehe zum Glasschmelzofen und 'benutze' ihn, um Glasblöcke herzustellen. Komm wieder, wenn du mindestens einen Glasblock hast.");
    npc.base.autonpcfunctions.AddCondition("state","=",2);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Put the sand and the pott ash in the belt and hold the glass blow pipe in your hand. Then go to the glass melting oven and 'use' it in order to make glass ingots. Come again, when you have at least one ingot.");
    npc.base.autonpcfunctions.AddCondition("state","=",2);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    -- STATE 3
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Du hast es hinbekommen, wunderbar! Mehr brauchst du auch nicht zu wissen, der Rest kommt mit der Übung. Viel Glück und auf bald!");
    npc.base.autonpcfunctions.AddCondition("state","=",3);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddCondition("item",1317,"all",">",0);
    npc.base.autonpcfunctions.AddConsequence("state","=",0);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","You did it, great! I can't teach you anything anymore, you will learn the rest by practising. Good luck and farewell!");
    npc.base.autonpcfunctions.AddCondition("state","=",3);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddCondition("item",1317,"all",">",0);
    npc.base.autonpcfunctions.AddConsequence("state","=",0);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Lass das Glasblasrohr in der Hand, die Glasblöcke bleiben am Gürtel. Gehe wieder zum Glasschmelzofen und 'benutze' diesmal das Glasblasrohr und wähle dann die kleine leere Flasche, um diese herzustellen. Komm wieder, wenn du mindestens eine kleine leere Flasche hast.");
    npc.base.autonpcfunctions.AddCondition("state","=",3);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Keep the glass blowing pipe in your hand and the glass ingots at your belt. Now go back to the glass melting oven and 'use' the glass blow pipe and then choose the small empty bottle in order to produce it. Come again when you have at least one small empty bottle.");
    npc.base.autonpcfunctions.AddCondition("state","=",3);
    npc.base.autonpcfunctions.AddCondition("lang","english");

    -- standard explanations
    npc.base.autonpcfunctions.AddTraderTrigger("asche","Pottasche bleibt nach einem Feuer übrig, wenn es ausgebrannt ist. Aber lösch es nicht mit Wasser, denn dann gibt's auch keine Pottasche!");
    npc.base.autonpcfunctions.AddTraderTrigger("ash","When a fire has burnt out, you can find pott ash as leftover. But don't extinguish it with water, because you won't get any pott ash this way!");
    npc.base.autonpcfunctions.AddTraderTrigger("sand","Ich denke, man muss in der Wüste nach groben Sand graben und diesen dann sieben, um den Sand zu erhalten, den wir zum Glasblasen brauchen.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("sand","I think one has to dig in the desert for coarse sand and then sieve it in order to get the sand we need for glass blowing.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("bl[öo]ck","Glasblöcke sind die Grundlage für das Glasblasen. Du brauchst nur Pottasche, Sand, ein Glasblasrohr und einen Glasschmelzofen, um welche herzustellen.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("bloeck");
    npc.base.autonpcfunctions.AddTraderTrigger("ingot","Glass ingots are a necessity for glass blowing. You just need pott ash, sand, a glass blowing pipe and a glass melting oven to produce them.");
    npc.base.autonpcfunctions.AddTraderTrigger("rohr","Man braucht ein Glasblasrohr, um Glasblöcke und schließlich alle Glaswaren herzustellen. Ein guter Schmied kann wohl ein Glasblasrohr anfertigen.");
    npc.base.autonpcfunctions.AddTraderTrigger("pipe","One needs a glass blowing pipe in order to produce glass ingots and finally glass goods. A good smith an surely make a glass blowing pipe.");
    npc.base.autonpcfunctions.AddTraderTrigger("ofen","Für jeden Schritt braucht man einen Glasschmelzofen. Das ist das große Teil aus Ziegeln da drüben. Jede größere Stadt hat einen. Aber ich hab gleich zwei auf einmal!");
    npc.base.autonpcfunctions.AddTraderTrigger("oven","For each step one needs a glass melting oven. It is this huge thing over there made of bricks. Every major town has one. But I have two at once!");
    
    -- cycle texts
    npc.base.autonpcfunctions.AddCycleText("#me dreht ein Glasblasrohr in seiner rechten Hand.","#me turns a glass blow pipe in his right hand.");
    npc.base.autonpcfunctions.AddCycleText("#me betrachtet eine Flasche in seinen Händen: 'Schönes und klares Glas. So soll es sein!'","#me examines a bottle in his hands: 'Nice and clear glass. This is how it should be!'");
    -- ********* END DYNAMIC PART ********


    TradSpeakLang={0,1};
    TradStdLang=0;

    npc.base.autonpcfunctions.increaseLangSkill(TradSpeakLang);
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

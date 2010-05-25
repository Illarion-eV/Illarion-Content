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

    npcs.base.autonpcfunctions.InitTalkLists();

    -- ********* START DYNAMIC PART ********

    -- general
    -- small talk
    npcs.base.autonpcfunctions.AddTraderTrigger("Hallo","Grüße, mein Freund. Wenn du etwas übers Glasblasen lernen willst, bist du bei mir genau richtig.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("gr[üu][sß]");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("grue[sß]");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddCondition("state","=",0);
    npcs.base.autonpcfunctions.AddAdditionalText("Seid gegrüßt. Wenn du etwas übers Glasblasen lernen willst, bist du bei mir genau richtig.");
    npcs.base.autonpcfunctions.AddTraderTrigger("hello","Greetings, my friend. If you want to learn something about glass blowing, then I am the right man.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("greet");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("hey");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddCondition("state","=",0);
    npcs.base.autonpcfunctions.AddAdditionalText("Be greeted. If you want to learn something about glass blowing, then I am the right man.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Hallo","Grüße, mein Freund. Wo waren wir gerade...?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("gr[üu][sß]");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("grue[sß]");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddCondition("state",">",0);
    npcs.base.autonpcfunctions.AddAdditionalText("Sei gegrüßt. Wo waren wir gerade...?");
    npcs.base.autonpcfunctions.AddTraderTrigger("hello","Greetings, my friend. Where were we...?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("greet");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("hey");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddCondition("state",">",0);
    npcs.base.autonpcfunctions.AddAdditionalText("Be greeted. Where were we...?");
    npcs.base.autonpcfunctions.AddTraderTrigger("mein name ist","Freut mich euch kennen zulernen. Ich bin "..thisNPC.name..".");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("ich bin");
    npcs.base.autonpcfunctions.AddTraderTrigger("my name is","Nice to meet you. I am "..thisNPC.name..".");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("i am");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("i'm");
    npcs.base.autonpcfunctions.AddTraderTrigger("wie ist dein name","Ich bin der Glasbläser "..thisNPC.name..".");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wie ist euer name");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wie hei[sß]t");
    npcs.base.autonpcfunctions.AddAdditionalText("Ich heiße "..thisNPC.name..".");
    npcs.base.autonpcfunctions.AddTraderTrigger("what is your name","I am the glassblower "..thisNPC.name..".");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("what's your name");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("who are you");
    npcs.base.autonpcfunctions.AddAdditionalText("I am "..thisNPC.name..".");
    npcs.base.autonpcfunctions.AddTraderTrigger("dein beruf","Ich bin Glasbläser.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("deine aufgabe");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("euer beruf");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("eure aufgabe");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("was machst du");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("was tust du");
    npcs.base.autonpcfunctions.AddAdditionalText("Ich fertige Flaschen an.");
    npcs.base.autonpcfunctions.AddTraderTrigger("your job","I am a glassblower.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("what do you do");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("your profession");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("what are you doing");
    npcs.base.autonpcfunctions.AddAdditionalText("I make bottels.");
    npcs.base.autonpcfunctions.AddTraderTrigger("was verkauf","Ich verkaufe nichts. Aber ich kann dir das Glasblasen beibringen.");
    npcs.base.autonpcfunctions.AddTraderTrigger("was kauf","Ich kaufe nichts. Aber ich kann dir das Glasblasen beibringen.");
    npcs.base.autonpcfunctions.AddTraderTrigger("what sell","I sell nothing. But I can teach you how to make glass.");
    npcs.base.autonpcfunctions.AddTraderTrigger("What buy","I buy nothing. But I can teach you how to make glass.");
    npcs.base.autonpcfunctions.AddTraderTrigger("bye","Be well.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("farewell");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("be well");
    npcs.base.autonpcfunctions.AddAdditionalText("Farewell.");
    npcs.base.autonpcfunctions.AddAdditionalText("Good bye.");
    npcs.base.autonpcfunctions.AddTraderTrigger("auf bald","Auf bald.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("bis bald");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("leb wohl");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("tsch[üu][ßs]");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mach gut");
    npcs.base.autonpcfunctions.AddAdditionalText("Bis bald.");
    npcs.base.autonpcfunctions.AddAdditionalText("Lebt wohl.");
    -- start teaching
    npcs.base.autonpcfunctions.AddTraderTrigger("glasbläserei","Oh ja, damit kenn' ich mich aus. Soll ich dich in die Kunst des Glasblasens einweihen?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("glas blasen");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("glasblasen");
    npcs.base.autonpcfunctions.AddAdditionalText("Ich kann dir das Glasblasen beibringen. Möchtest du das?");
    npcs.base.autonpcfunctions.AddConsequence("state","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("bei bringen","Ich kann dir das Glasblasen beibringen. Möchtest du das?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("beibringen");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("zeigen");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("lern");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("hilfe");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddConsequence("state","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("aufgabe","Eine Aufgabe für dich habe ich nicht, doch kann ich dir das Glasblasen zeigen. Willst du das?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("quest");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddConsequence("state","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("glass blow","Oh yes, glassblowing is my business. Shall I show you how to do it?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("glassblow");
    npcs.base.autonpcfunctions.AddConsequence("state","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("teach","Do you want me to teach you how to blow glass?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("show");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("learn");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("help");
    npcs.base.autonpcfunctions.AddConsequence("state","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("mission","I have no task for you, but I can show you how to blow glass. Do you want it?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("task");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("quest");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("state","=",1);
    -- STATE 1
    npcs.base.autonpcfunctions.AddTraderTrigger("nein","Nagut, dann komm einfach wieder, wenn du es willst.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("nicht");
    npcs.base.autonpcfunctions.AddCondition("state","=",1);
    npcs.base.autonpcfunctions.AddConsequence("state","=",0);
    npcs.base.autonpcfunctions.AddTraderTrigger("no","Well, then come back when you want to learn it.");
    npcs.base.autonpcfunctions.AddCondition("state","=",1);
    npcs.base.autonpcfunctions.AddConsequence("state","=",0);
    npcs.base.autonpcfunctions.AddTraderTrigger("ja","Dann gebe ich dir erstmal alles was du brauchst. Packe den Sand und die Pottasche in deinen Gürtel und halte das Glasblasrohr in der Hand. Nun gehe zum Glasschmelzofen und 'benutze' ihn, um Glasblöcke herzustellen. Komm wieder, wenn du mindestens einen Glasblock hast.");
    npcs.base.autonpcfunctions.AddCondition("state","=",1);
    npcs.base.autonpcfunctions.AddConsequence("item",316,10,333,0);
    npcs.base.autonpcfunctions.AddConsequence("item",314,10,333,0);
    npcs.base.autonpcfunctions.AddConsequence("item",311,1,999,0);
    npcs.base.autonpcfunctions.AddConsequence("state","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("yes","Then I will give you everything you need. Put the sand and the pott ash in the belt and hold the glass blow pipe in your hand. Then go to the glass melting oven and 'use' it in order to make glass ingots. Come again, when you have at least one ingot.");
    npcs.base.autonpcfunctions.AddCondition("state","=",1);
    npcs.base.autonpcfunctions.AddConsequence("item",316,10,333,0);
    npcs.base.autonpcfunctions.AddConsequence("item",314,10,333,0);
    npcs.base.autonpcfunctions.AddConsequence("item",311,1,999,0);
    npcs.base.autonpcfunctions.AddConsequence("state","=",2);
    -- STATE 2
    npcs.base.autonpcfunctions.AddTraderTrigger("asche","Du hast ja gar keine Pottasche mehr! Na dann, hier hast du noch welche.");
    npcs.base.autonpcfunctions.AddCondition("state",">",1);
    npcs.base.autonpcfunctions.AddCondition("item",314,"all","=",0);
    npcs.base.autonpcfunctions.AddConsequence("item",314,5,333,0);
    npcs.base.autonpcfunctions.AddTraderTrigger("ash","You don't have any ash any more! Well then, here is some more.");
    npcs.base.autonpcfunctions.AddCondition("state",">",1);
    npcs.base.autonpcfunctions.AddCondition("item",314,"all","=",0);
    npcs.base.autonpcfunctions.AddConsequence("item",314,5,333,0);
    npcs.base.autonpcfunctions.AddTraderTrigger("sand","Du hast ja gar keinen Sand mehr! Na dann, hier hast du noch welchen.");
    npcs.base.autonpcfunctions.AddCondition("state",">",1);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddCondition("item",316,"all","=",0);
    npcs.base.autonpcfunctions.AddConsequence("item",316,5,333,0);
    npcs.base.autonpcfunctions.AddTraderTrigger("sand","You don't have any sand any more! Well then, here is some more.");
    npcs.base.autonpcfunctions.AddCondition("state",">",1);
    npcs.base.autonpcfunctions.AddCondition("item",314,"all","=",0);
    npcs.base.autonpcfunctions.AddConsequence("item",316,5,333,0);
    npcs.base.autonpcfunctions.AddTraderTrigger("rohr","Du hast ja gar kein Glasblasrohr mehr! Na dann, hier hast du noch eines.");
    npcs.base.autonpcfunctions.AddCondition("state",">",1);
    npcs.base.autonpcfunctions.AddCondition("item",311,"all","=",0);
    npcs.base.autonpcfunctions.AddConsequence("item",311,1,999,0);
    npcs.base.autonpcfunctions.AddTraderTrigger("pipe","You don't have a glass blowing pipe any more! Well then, here is one more.");
    npcs.base.autonpcfunctions.AddCondition("state",">",1);
    npcs.base.autonpcfunctions.AddCondition("item",311,"all","=",0);
    npcs.base.autonpcfunctions.AddConsequence("item",311,1,999,0);
    -- STATE 3
    npcs.base.autonpcfunctions.AddTraderTrigger("bl[öo]ck","Du hast ja gar keinen Glasblock mehr! Na dann, hier hast du noch welche.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("bloeck");
    npcs.base.autonpcfunctions.AddCondition("state",">",2);
    npcs.base.autonpcfunctions.AddCondition("item",41,"all","=",0);
    npcs.base.autonpcfunctions.AddConsequence("item",41,5,333,0);
    npcs.base.autonpcfunctions.AddTraderTrigger("ingot","You don't have any glass ingots any more! Well then, here are some more.");
    npcs.base.autonpcfunctions.AddCondition("state",">",2);
    npcs.base.autonpcfunctions.AddCondition("item",41,"all","=",0);
    npcs.base.autonpcfunctions.AddConsequence("item",41,5,333,0);
    npcs.base.autonpcfunctions.AddCondition("state",">",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("ingot","Glass ingots are a necessity for glass blowing. You just need pott ash, sand and a glass melting oven to produce them. If you have no ingots any more and you want to continue, I can give you a couple.");
    npcs.base.autonpcfunctions.AddCondition("state",">",2);
    -- last catch
    -- STATE 1
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Ich habe gefragt, ob ich dir das Glasblasen beibringen soll. Ja oder nein?");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddCondition("state","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","I've asked if I shall teach you how to make glass. Yes or no?");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddCondition("state","=",1);
    -- STATE 2
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Du hast es hinbekommen, sehr gut. Dann gehen wir einen Schritt weiter. Lass das Glasblasrohr in der Hand, die Glasblöcke bleiben am Gürtel. Gehe wieder zum Glasschmelzofen und 'benutze' diesmal das Glasblasrohr und wähle dann die kleine leere Flasche, um diese herzustellen. Komm wieder, wenn du mindestens eine kleine leere Flasche hast.");
    npcs.base.autonpcfunctions.AddCondition("state","=",2);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddCondition("item",41,"all",">",0);
    npcs.base.autonpcfunctions.AddConsequence("state","=",3);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","You did it, very good. Now we come to the next step. Keep the glass blowing pipe in your hand and the glass ingots at your belt. Now go back to the glass melting oven and 'use' the glass blow pipe and then choose the small empty bottle in order to produce it. Come again when you have at least one small empty bottle.");
    npcs.base.autonpcfunctions.AddCondition("state","=",2);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddCondition("item",41,"all",">",0);
    npcs.base.autonpcfunctions.AddConsequence("state","=",3);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Packe den Sand und die Pottasche in deinen Gürtel und halte das Glasblasrohr in deiner Hand. Nun gehe zum Glasschmelzofen und 'benutze' ihn, um Glasblöcke herzustellen. Komm wieder, wenn du mindestens einen Glasblock hast.");
    npcs.base.autonpcfunctions.AddCondition("state","=",2);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Put the sand and the pott ash in the belt and hold the glass blow pipe in your hand. Then go to the glass melting oven and 'use' it in order to make glass ingots. Come again, when you have at least one ingot.");
    npcs.base.autonpcfunctions.AddCondition("state","=",2);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    -- STATE 3
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Du hast es hinbekommen, wunderbar! Mehr brauchst du auch nicht zu wissen, der Rest kommt mit der Übung. Viel Glück und auf bald!");
    npcs.base.autonpcfunctions.AddCondition("state","=",3);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddCondition("item",1317,"all",">",0);
    npcs.base.autonpcfunctions.AddConsequence("state","=",0);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","You did it, great! I can't teach you anything anymore, you will learn the rest by practising. Good luck and farewell!");
    npcs.base.autonpcfunctions.AddCondition("state","=",3);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddCondition("item",1317,"all",">",0);
    npcs.base.autonpcfunctions.AddConsequence("state","=",0);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Lass das Glasblasrohr in der Hand, die Glasblöcke bleiben am Gürtel. Gehe wieder zum Glasschmelzofen und 'benutze' diesmal das Glasblasrohr und wähle dann die kleine leere Flasche, um diese herzustellen. Komm wieder, wenn du mindestens eine kleine leere Flasche hast.");
    npcs.base.autonpcfunctions.AddCondition("state","=",3);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Keep the glass blowing pipe in your hand and the glass ingots at your belt. Now go back to the glass melting oven and 'use' the glass blow pipe and then choose the small empty bottle in order to produce it. Come again when you have at least one small empty bottle.");
    npcs.base.autonpcfunctions.AddCondition("state","=",3);
    npcs.base.autonpcfunctions.AddCondition("lang","english");

    -- standard explanations
    npcs.base.autonpcfunctions.AddTraderTrigger("asche","Pottasche bleibt nach einem Feuer übrig, wenn es ausgebrannt ist. Aber lösch es nicht mit Wasser, denn dann gibt's auch keine Pottasche!");
    npcs.base.autonpcfunctions.AddTraderTrigger("ash","When a fire has burnt out, you can find pott ash as leftover. But don't extinguish it with water, because you won't get any pott ash this way!");
    npcs.base.autonpcfunctions.AddTraderTrigger("sand","Ich denke, man muss in der Wüste nach groben Sand graben und diesen dann sieben, um den Sand zu erhalten, den wir zum Glasblasen brauchen.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("sand","I think one has to dig in the desert for coarse sand and then sieve it in order to get the sand we need for glass blowing.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("bl[öo]ck","Glasblöcke sind die Grundlage für das Glasblasen. Du brauchst nur Pottasche, Sand, ein Glasblasrohr und einen Glasschmelzofen, um welche herzustellen.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("bloeck");
    npcs.base.autonpcfunctions.AddTraderTrigger("ingot","Glass ingots are a necessity for glass blowing. You just need pott ash, sand, a glass blowing pipe and a glass melting oven to produce them.");
    npcs.base.autonpcfunctions.AddTraderTrigger("rohr","Man braucht ein Glasblasrohr, um Glasblöcke und schließlich alle Glaswaren herzustellen. Ein guter Schmied kann wohl ein Glasblasrohr anfertigen.");
    npcs.base.autonpcfunctions.AddTraderTrigger("pipe","One needs a glass blowing pipe in order to produce glass ingots and finally glass goods. A good smith an surely make a glass blowing pipe.");
    npcs.base.autonpcfunctions.AddTraderTrigger("ofen","Für jeden Schritt braucht man einen Glasschmelzofen. Das ist das große Teil aus Ziegeln da drüben. Jede größere Stadt hat einen. Aber ich hab gleich zwei auf einmal!");
    npcs.base.autonpcfunctions.AddTraderTrigger("oven","For each step one needs a glass melting oven. It is this huge thing over there made of bricks. Every major town has one. But I have two at once!");
    
    -- cycle texts
    npcs.base.autonpcfunctions.AddCycleText("#me dreht ein Glasblasrohr in seiner rechten Hand.","#me turns a glass blow pipe in his right hand.");
    npcs.base.autonpcfunctions.AddCycleText("#me betrachtet eine Flasche in seinen Händen: 'Schönes und klares Glas. So soll es sein!'","#me examines a bottle in his hands: 'Nice and clear glass. This is how it should be!'");
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

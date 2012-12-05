-- INSERT INTO npc VALUES (nextval('npc_seq'),4,183,-447,1,4,false,'Kurg','npc_kurg.lua',0);

require("npc.base.autonpcfunctions")
module("npc.kurg", package.seeall)

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

    -- ********* START DYNAMIC PART ********

    -- Kurg the butcher
    npc.base.autonpcfunctions.AddTraderTrigger(" ","Tut mir leid, ich bin beschäftigt. Warte bitte einen Moment bis ich mein Gespräch beendet habe.");
    npc.base.autonpcfunctions.AddCondition("idlestate","busy");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger(" ","Meh sorry, but meh busy at da moment. Wait till meh finished meh speech?");
    npc.base.autonpcfunctions.AddCondition("idlestate","busy");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("gr[üue]+[sß]+e","Schön dich zu sehen! Wie gehts dir?  Ich bin Kurg der Metzger. Wie kann ich Ihnen helfen?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Guten Tag");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("greetings","Greebas! How are joo?  Meh is Kurg da Butcher.  How may meh help joo?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("hello");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("was verkaufe","Ich verkaufe alle Arten von Fleisch: Kaninchen, Lamm, Rehe und Schweinefleisch für nur 2 Kupfer jeder. Schinken, Steak und Würste kosten 3 jeder.");
    npc.base.autonpcfunctions.AddTraderTrigger("what sell","Meh sells all kinds ob meats: Rabbit, Lamb, Deer and Pork for only 2 coppers each.  Ham, Steak and sausages cost 3 each.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("was kaufe","Ich kaufe alle Arten von Fleisch: Kaninchen, Lamm, Rehe und Schweinefleisch für nur 1 Kupfer jeder. Schinken, Steak und Würste sind 2 jeder wert.");
    npc.base.autonpcfunctions.AddTraderTrigger("what buy","Meh buys all kinds ob meats: Rabbit, Lamb, Deer and Pork for only 1 copper each.  Ham, Steak and Sausages are worth 2 each.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    -- selling section
    npc.base.autonpcfunctions.AddTraderTrigger("verkaufe kaninchen"," Ausgezeichnet, ist hier eine Münze für Ihre Schwierigkeiten.");
    npc.base.autonpcfunctions.AddCondition("item",553,"belt",">=",1);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddConsequence("deleteitem",553,1);
    npc.base.autonpcfunctions.AddConsequence("money","+",1);
    npc.base.autonpcfunctions.AddConsequence("talk","end");
    npc.base.autonpcfunctions.AddTraderTrigger("sell rabbit","Wunderful, here beh a coin for joor trubble.");
    npc.base.autonpcfunctions.AddCondition("item",553,"belt",">=",1);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("deleteitem",553,1);
    npc.base.autonpcfunctions.AddConsequence("money","+",1);
    npc.base.autonpcfunctions.AddConsequence("talk","end");
    npc.base.autonpcfunctions.AddTraderTrigger("verkaufe lamm"," Ausgezeichnet, ist hier eine Münze für Ihre Schwierigkeiten.");
    npc.base.autonpcfunctions.AddCondition("item",2934,"belt",">=",1);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddConsequence("deleteitem",2934,1);
    npc.base.autonpcfunctions.AddConsequence("money","+",1);
    npc.base.autonpcfunctions.AddConsequence("talk","end");
    npc.base.autonpcfunctions.AddTraderTrigger("sell Lamb","Wunderful, here beh a coin for joor trubble.");
    npc.base.autonpcfunctions.AddCondition("item",2934,"belt",">=",1);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("deleteitem",2934,1);
    npc.base.autonpcfunctions.AddConsequence("money","+",1);
    npc.base.autonpcfunctions.AddConsequence("talk","end");
    npc.base.autonpcfunctions.AddTraderTrigger("verkaufe rehe"," Ausgezeichnet, ist hier eine Münze für Ihre Schwierigkeiten.");
    npc.base.autonpcfunctions.AddCondition("item",552,"belt",">=",1);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddConsequence("deleteitem",552,1);
    npc.base.autonpcfunctions.AddConsequence("money","+",1);
    npc.base.autonpcfunctions.AddConsequence("talk","end");
    npc.base.autonpcfunctions.AddTraderTrigger("sell deer","Wunderful, here beh a coin for joor trubble.");
    npc.base.autonpcfunctions.AddCondition("item",552,"belt",">=",1);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("deleteitem",552,1);
    npc.base.autonpcfunctions.AddConsequence("money","+",1);
    npc.base.autonpcfunctions.AddConsequence("talk","end");
    npc.base.autonpcfunctions.AddTraderTrigger("verkaufe schweinefleisch"," Ausgezeichnet, ist hier eine Münze für Ihre Schwierigkeiten.");
    npc.base.autonpcfunctions.AddCondition("item",307,"belt",">=",1);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddConsequence("deleteitem",307,1);
    npc.base.autonpcfunctions.AddConsequence("money","+",1);
    npc.base.autonpcfunctions.AddConsequence("talk","end");
    npc.base.autonpcfunctions.AddTraderTrigger("sell pork","Wunderful, here beh a coin for joor trubble.");
    npc.base.autonpcfunctions.AddCondition("item",307,"belt",">=",1);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("deleteitem",307,1);
    npc.base.autonpcfunctions.AddConsequence("money","+",1);
    npc.base.autonpcfunctions.AddConsequence("talk","end");
    npc.base.autonpcfunctions.AddTraderTrigger("verkaufe schinken"," Ausgezeichnet, ist hier 2 Münzen für Ihre Schwierigkeiten.");
    npc.base.autonpcfunctions.AddCondition("item",306,"belt",">=",1);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddConsequence("deleteitem",306,1);
    npc.base.autonpcfunctions.AddConsequence("money","+",2);
    npc.base.autonpcfunctions.AddConsequence("talk","end");
    npc.base.autonpcfunctions.AddTraderTrigger("sell ham","Wunderful, here beh 2 coins for joor trubble.");
    npc.base.autonpcfunctions.AddCondition("item",306,"belt",">=",1);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("deleteitem",306,1);
    npc.base.autonpcfunctions.AddConsequence("money","+",2);
    npc.base.autonpcfunctions.AddConsequence("talk","end");
    npc.base.autonpcfunctions.AddTraderTrigger("verkaufe steak"," Ausgezeichnet, ist hier 2 Münzen für Ihre Schwierigkeiten.");
    npc.base.autonpcfunctions.AddCondition("item",2940,"belt",">=",1);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddConsequence("deleteitem",2940,1);
    npc.base.autonpcfunctions.AddConsequence("money","+",2);
    npc.base.autonpcfunctions.AddConsequence("talk","end");
    npc.base.autonpcfunctions.AddTraderTrigger("sell steak"," Wunderful, here beh 2 coins for joor trubble.");
    npc.base.autonpcfunctions.AddCondition("item",2940,"belt",">=",1);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("deleteitem",2940,1);
    npc.base.autonpcfunctions.AddConsequence("money","+",2);
    npc.base.autonpcfunctions.AddConsequence("talk","end");
    npc.base.autonpcfunctions.AddTraderTrigger("verkaufe würste"," Ausgezeichnet, ist hier 2 Münzen für Ihre Schwierigkeiten.");
    npc.base.autonpcfunctions.AddCondition("item",3051,"belt",">=",1);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddConsequence("deleteitem",3051,1);
    npc.base.autonpcfunctions.AddConsequence("money","+",2);
    npc.base.autonpcfunctions.AddConsequence("talk","end");
    npc.base.autonpcfunctions.AddTraderTrigger("sell sausage"," Wunderful, here beh 2 coins for joor trubble.");
    npc.base.autonpcfunctions.AddCondition("item",3051,"belt",">=",1);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("deleteitem",3051,1);
    npc.base.autonpcfunctions.AddConsequence("money","+",2);
    npc.base.autonpcfunctions.AddConsequence("talk","end");
    -- buying section
    npc.base.autonpcfunctions.AddTraderTrigger("kaufe"," Kommen Sie zurück, wenn Sie etwas gewähren können!");
    npc.base.autonpcfunctions.AddCondition("money","=",0);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddConsequence("talk","end");
    npc.base.autonpcfunctions.AddTraderTrigger("buy","Cum Back when joo can afford sumding!");
    npc.base.autonpcfunctions.AddCondition("money","=",0);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("talk","end");
    npc.base.autonpcfunctions.AddTraderTrigger("kaufe kaninchen","Ausgezeichnet, ist hier ein auserlesenes Stück von Fleisch.");
    npc.base.autonpcfunctions.AddCondition("money",">=",2);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddConsequence("item",553,1,333,0);
    npc.base.autonpcfunctions.AddConsequence("money","-",2);
    npc.base.autonpcfunctions.AddConsequence("talk","end");
    npc.base.autonpcfunctions.AddTraderTrigger("buy rabbit","Wunderful, here beh a gud piece ob meat.");
    npc.base.autonpcfunctions.AddCondition("money",">=",2);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("item",553,1,333,0);
    npc.base.autonpcfunctions.AddConsequence("money","-",2);
    npc.base.autonpcfunctions.AddConsequence("talk","end");
    npc.base.autonpcfunctions.AddTraderTrigger("kaufe lamm","Ausgezeichnet, ist hier ein auserlesenes Stück von Fleisch.");
    npc.base.autonpcfunctions.AddCondition("money",">=",2);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddConsequence("item",2934,1,333,0);
    npc.base.autonpcfunctions.AddConsequence("money","-",2);
    npc.base.autonpcfunctions.AddConsequence("talk","end");
    npc.base.autonpcfunctions.AddTraderTrigger("buy lamb"," Wunderful, here beh a gud piece ob meat.");
    npc.base.autonpcfunctions.AddCondition("money",">=",2);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("item",2934,1,333,0);
    npc.base.autonpcfunctions.AddConsequence("money","-",2);
    npc.base.autonpcfunctions.AddConsequence("talk","end");
    npc.base.autonpcfunctions.AddTraderTrigger("kaufe rehe","Ausgezeichnet, ist hier ein auserlesenes Stück von Fleisch.");
    npc.base.autonpcfunctions.AddCondition("money",">=",2);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddConsequence("item",552,1,333,0);
    npc.base.autonpcfunctions.AddConsequence("money","-",2);
    npc.base.autonpcfunctions.AddConsequence("talk","end");
    npc.base.autonpcfunctions.AddTraderTrigger("buy deer"," Wunderful, here beh a gud piece ob meat.");
    npc.base.autonpcfunctions.AddCondition("money",">=",2);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("item",552,1,333,0);
    npc.base.autonpcfunctions.AddConsequence("money","-",2);
    npc.base.autonpcfunctions.AddConsequence("talk","end");
    npc.base.autonpcfunctions.AddTraderTrigger("kaufe schweinefleisch","Ausgezeichnet, ist hier ein auserlesenes Stück von Fleisch.");
    npc.base.autonpcfunctions.AddCondition("money",">=",2);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddConsequence("item",307,1,333,0);
    npc.base.autonpcfunctions.AddConsequence("money","-",2);
    npc.base.autonpcfunctions.AddConsequence("talk","end");
    npc.base.autonpcfunctions.AddTraderTrigger("buy pork"," Wunderful, here beh a gud piece ob meat.");
    npc.base.autonpcfunctions.AddCondition("money",">=",2);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("item",307,1,333,0);
    npc.base.autonpcfunctions.AddConsequence("money","-",2);
    npc.base.autonpcfunctions.AddConsequence("talk","end");
    npc.base.autonpcfunctions.AddTraderTrigger("kaufe schinken","Ausgezeichnet, ist hier ein auserlesenes Stück von Fleisch.");
    npc.base.autonpcfunctions.AddCondition("money",">=",3);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddConsequence("item",306,1,333,0);
    npc.base.autonpcfunctions.AddConsequence("money","-",3);
    npc.base.autonpcfunctions.AddConsequence("talk","end");
    npc.base.autonpcfunctions.AddTraderTrigger("buy ham"," Wunderful, here beh a gud piece ob meat.");
    npc.base.autonpcfunctions.AddCondition("money",">=",3);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("item",306,1,333,0);
    npc.base.autonpcfunctions.AddConsequence("money","-",3);
    npc.base.autonpcfunctions.AddConsequence("talk","end");
    npc.base.autonpcfunctions.AddTraderTrigger("kaufe steak","Ausgezeichnet, ist hier ein auserlesenes Stück von Fleisch.");
    npc.base.autonpcfunctions.AddCondition("money",">=",3);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddConsequence("item",2940,1,333,0);
    npc.base.autonpcfunctions.AddConsequence("money","-",3);
    npc.base.autonpcfunctions.AddConsequence("talk","end");
    npc.base.autonpcfunctions.AddTraderTrigger("buy steak"," Wunderful, here beh a gud piece ob meat.");
    npc.base.autonpcfunctions.AddCondition("money",">=",3);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("item",2940,1,333,0);
    npc.base.autonpcfunctions.AddConsequence("money","-",3);
    npc.base.autonpcfunctions.AddConsequence("talk","end");
    npc.base.autonpcfunctions.AddTraderTrigger("kaufe würste","Ausgezeichnet, ist hier ein auserlesenes Stück von Fleisch.");
    npc.base.autonpcfunctions.AddCondition("money",">=",3);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddConsequence("item",3051,1,333,0);
    npc.base.autonpcfunctions.AddConsequence("money","-",3);
    npc.base.autonpcfunctions.AddConsequence("talk","end");
    npc.base.autonpcfunctions.AddTraderTrigger("buy sausage"," Wunderful, here beh a gud piece ob meat.");
    npc.base.autonpcfunctions.AddCondition("money",">=",3);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("item",3051,1,333,0);
    npc.base.autonpcfunctions.AddConsequence("money","-",3);
    npc.base.autonpcfunctions.AddConsequence("talk","end");
    npc.base.autonpcfunctions.AddTraderTrigger("auf bald","Bis bald!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("bis bald");
    npc.base.autonpcfunctions.AddAdditionalTrigger("tschüss");
    npc.base.autonpcfunctions.AddTraderTrigger("farewell","Farrebas!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("bye");
    npc.base.autonpcfunctions.AddAdditionalTrigger("good day");
    npc.base.autonpcfunctions.AddCycleText("#me sieht sich für Kunden um","#me looks around for customers");
    npc.base.autonpcfunctions.AddCycleText("#me haut etwas Fleisch ab und hängt es ","#me chops up some meat and hangs it");
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

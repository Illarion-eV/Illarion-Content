-- INSERT INTO npc VALUES (nextval('npc_seq'),4,183,-447,1,4,false,'Kurg','npc_kurg.lua',0);

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

    -- Kurg the butcher
    npcs.base.autonpcfunctions.AddTraderTrigger(" ","Tut mir leid, ich bin beschäftigt. Warte bitte einen Moment bis ich mein Gespräch beendet habe.");
    npcs.base.autonpcfunctions.AddCondition("idlestate","busy");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger(" ","Meh sorry, but meh busy at da moment. Wait till meh finished meh speech?");
    npcs.base.autonpcfunctions.AddCondition("idlestate","busy");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("gr[üue]+[sß]+e","Schön dich zu sehen! Wie gehts dir?  Ich bin Kurg der Metzger. Wie kann ich Ihnen helfen?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Guten Tag");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("greetings","Greebas! How are joo?  Meh is Kurg da Butcher.  How may meh help joo?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("hello");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("was verkaufe","Ich verkaufe alle Arten von Fleisch: Kaninchen, Lamm, Rehe und Schweinefleisch für nur 2 Kupfer jeder. Schinken, Steak und Würste kosten 3 jeder.");
    npcs.base.autonpcfunctions.AddTraderTrigger("what sell","Meh sells all kinds ob meats: Rabbit, Lamb, Deer and Pork for only 2 coppers each.  Ham, Steak and sausages cost 3 each.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("was kaufe","Ich kaufe alle Arten von Fleisch: Kaninchen, Lamm, Rehe und Schweinefleisch für nur 1 Kupfer jeder. Schinken, Steak und Würste sind 2 jeder wert.");
    npcs.base.autonpcfunctions.AddTraderTrigger("what buy","Meh buys all kinds ob meats: Rabbit, Lamb, Deer and Pork for only 1 copper each.  Ham, Steak and Sausages are worth 2 each.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    -- selling section
    npcs.base.autonpcfunctions.AddTraderTrigger("verkaufe kaninchen"," Ausgezeichnet, ist hier eine Münze für Ihre Schwierigkeiten.");
    npcs.base.autonpcfunctions.AddCondition("item",553,"belt",">=",1);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddConsequence("deleteitem",553,1);
    npcs.base.autonpcfunctions.AddConsequence("money","+",1);
    npcs.base.autonpcfunctions.AddConsequence("talk","end");
    npcs.base.autonpcfunctions.AddTraderTrigger("sell rabbit","Wunderful, here beh a coin for joor trubble.");
    npcs.base.autonpcfunctions.AddCondition("item",553,"belt",">=",1);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("deleteitem",553,1);
    npcs.base.autonpcfunctions.AddConsequence("money","+",1);
    npcs.base.autonpcfunctions.AddConsequence("talk","end");
    npcs.base.autonpcfunctions.AddTraderTrigger("verkaufe lamm"," Ausgezeichnet, ist hier eine Münze für Ihre Schwierigkeiten.");
    npcs.base.autonpcfunctions.AddCondition("item",2934,"belt",">=",1);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddConsequence("deleteitem",2934,1);
    npcs.base.autonpcfunctions.AddConsequence("money","+",1);
    npcs.base.autonpcfunctions.AddConsequence("talk","end");
    npcs.base.autonpcfunctions.AddTraderTrigger("sell Lamb","Wunderful, here beh a coin for joor trubble.");
    npcs.base.autonpcfunctions.AddCondition("item",2934,"belt",">=",1);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("deleteitem",2934,1);
    npcs.base.autonpcfunctions.AddConsequence("money","+",1);
    npcs.base.autonpcfunctions.AddConsequence("talk","end");
    npcs.base.autonpcfunctions.AddTraderTrigger("verkaufe rehe"," Ausgezeichnet, ist hier eine Münze für Ihre Schwierigkeiten.");
    npcs.base.autonpcfunctions.AddCondition("item",552,"belt",">=",1);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddConsequence("deleteitem",552,1);
    npcs.base.autonpcfunctions.AddConsequence("money","+",1);
    npcs.base.autonpcfunctions.AddConsequence("talk","end");
    npcs.base.autonpcfunctions.AddTraderTrigger("sell deer","Wunderful, here beh a coin for joor trubble.");
    npcs.base.autonpcfunctions.AddCondition("item",552,"belt",">=",1);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("deleteitem",552,1);
    npcs.base.autonpcfunctions.AddConsequence("money","+",1);
    npcs.base.autonpcfunctions.AddConsequence("talk","end");
    npcs.base.autonpcfunctions.AddTraderTrigger("verkaufe schweinefleisch"," Ausgezeichnet, ist hier eine Münze für Ihre Schwierigkeiten.");
    npcs.base.autonpcfunctions.AddCondition("item",307,"belt",">=",1);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddConsequence("deleteitem",307,1);
    npcs.base.autonpcfunctions.AddConsequence("money","+",1);
    npcs.base.autonpcfunctions.AddConsequence("talk","end");
    npcs.base.autonpcfunctions.AddTraderTrigger("sell pork","Wunderful, here beh a coin for joor trubble.");
    npcs.base.autonpcfunctions.AddCondition("item",307,"belt",">=",1);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("deleteitem",307,1);
    npcs.base.autonpcfunctions.AddConsequence("money","+",1);
    npcs.base.autonpcfunctions.AddConsequence("talk","end");
    npcs.base.autonpcfunctions.AddTraderTrigger("verkaufe schinken"," Ausgezeichnet, ist hier 2 Münzen für Ihre Schwierigkeiten.");
    npcs.base.autonpcfunctions.AddCondition("item",306,"belt",">=",1);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddConsequence("deleteitem",306,1);
    npcs.base.autonpcfunctions.AddConsequence("money","+",2);
    npcs.base.autonpcfunctions.AddConsequence("talk","end");
    npcs.base.autonpcfunctions.AddTraderTrigger("sell ham","Wunderful, here beh 2 coins for joor trubble.");
    npcs.base.autonpcfunctions.AddCondition("item",306,"belt",">=",1);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("deleteitem",306,1);
    npcs.base.autonpcfunctions.AddConsequence("money","+",2);
    npcs.base.autonpcfunctions.AddConsequence("talk","end");
    npcs.base.autonpcfunctions.AddTraderTrigger("verkaufe steak"," Ausgezeichnet, ist hier 2 Münzen für Ihre Schwierigkeiten.");
    npcs.base.autonpcfunctions.AddCondition("item",2940,"belt",">=",1);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddConsequence("deleteitem",2940,1);
    npcs.base.autonpcfunctions.AddConsequence("money","+",2);
    npcs.base.autonpcfunctions.AddConsequence("talk","end");
    npcs.base.autonpcfunctions.AddTraderTrigger("sell steak"," Wunderful, here beh 2 coins for joor trubble.");
    npcs.base.autonpcfunctions.AddCondition("item",2940,"belt",">=",1);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("deleteitem",2940,1);
    npcs.base.autonpcfunctions.AddConsequence("money","+",2);
    npcs.base.autonpcfunctions.AddConsequence("talk","end");
    npcs.base.autonpcfunctions.AddTraderTrigger("verkaufe würste"," Ausgezeichnet, ist hier 2 Münzen für Ihre Schwierigkeiten.");
    npcs.base.autonpcfunctions.AddCondition("item",3051,"belt",">=",1);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddConsequence("deleteitem",3051,1);
    npcs.base.autonpcfunctions.AddConsequence("money","+",2);
    npcs.base.autonpcfunctions.AddConsequence("talk","end");
    npcs.base.autonpcfunctions.AddTraderTrigger("sell sausage"," Wunderful, here beh 2 coins for joor trubble.");
    npcs.base.autonpcfunctions.AddCondition("item",3051,"belt",">=",1);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("deleteitem",3051,1);
    npcs.base.autonpcfunctions.AddConsequence("money","+",2);
    npcs.base.autonpcfunctions.AddConsequence("talk","end");
    -- buying section
    npcs.base.autonpcfunctions.AddTraderTrigger("kaufe"," Kommen Sie zurück, wenn Sie etwas gewähren können!");
    npcs.base.autonpcfunctions.AddCondition("money","=",0);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddConsequence("talk","end");
    npcs.base.autonpcfunctions.AddTraderTrigger("buy","Cum Back when joo can afford sumding!");
    npcs.base.autonpcfunctions.AddCondition("money","=",0);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("talk","end");
    npcs.base.autonpcfunctions.AddTraderTrigger("kaufe kaninchen","Ausgezeichnet, ist hier ein auserlesenes Stück von Fleisch.");
    npcs.base.autonpcfunctions.AddCondition("money",">=",2);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddConsequence("item",553,1,333,0);
    npcs.base.autonpcfunctions.AddConsequence("money","-",2);
    npcs.base.autonpcfunctions.AddConsequence("talk","end");
    npcs.base.autonpcfunctions.AddTraderTrigger("buy rabbit","Wunderful, here beh a gud piece ob meat.");
    npcs.base.autonpcfunctions.AddCondition("money",">=",2);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("item",553,1,333,0);
    npcs.base.autonpcfunctions.AddConsequence("money","-",2);
    npcs.base.autonpcfunctions.AddConsequence("talk","end");
    npcs.base.autonpcfunctions.AddTraderTrigger("kaufe lamm","Ausgezeichnet, ist hier ein auserlesenes Stück von Fleisch.");
    npcs.base.autonpcfunctions.AddCondition("money",">=",2);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddConsequence("item",2934,1,333,0);
    npcs.base.autonpcfunctions.AddConsequence("money","-",2);
    npcs.base.autonpcfunctions.AddConsequence("talk","end");
    npcs.base.autonpcfunctions.AddTraderTrigger("buy lamb"," Wunderful, here beh a gud piece ob meat.");
    npcs.base.autonpcfunctions.AddCondition("money",">=",2);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("item",2934,1,333,0);
    npcs.base.autonpcfunctions.AddConsequence("money","-",2);
    npcs.base.autonpcfunctions.AddConsequence("talk","end");
    npcs.base.autonpcfunctions.AddTraderTrigger("kaufe rehe","Ausgezeichnet, ist hier ein auserlesenes Stück von Fleisch.");
    npcs.base.autonpcfunctions.AddCondition("money",">=",2);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddConsequence("item",552,1,333,0);
    npcs.base.autonpcfunctions.AddConsequence("money","-",2);
    npcs.base.autonpcfunctions.AddConsequence("talk","end");
    npcs.base.autonpcfunctions.AddTraderTrigger("buy deer"," Wunderful, here beh a gud piece ob meat.");
    npcs.base.autonpcfunctions.AddCondition("money",">=",2);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("item",552,1,333,0);
    npcs.base.autonpcfunctions.AddConsequence("money","-",2);
    npcs.base.autonpcfunctions.AddConsequence("talk","end");
    npcs.base.autonpcfunctions.AddTraderTrigger("kaufe schweinefleisch","Ausgezeichnet, ist hier ein auserlesenes Stück von Fleisch.");
    npcs.base.autonpcfunctions.AddCondition("money",">=",2);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddConsequence("item",307,1,333,0);
    npcs.base.autonpcfunctions.AddConsequence("money","-",2);
    npcs.base.autonpcfunctions.AddConsequence("talk","end");
    npcs.base.autonpcfunctions.AddTraderTrigger("buy pork"," Wunderful, here beh a gud piece ob meat.");
    npcs.base.autonpcfunctions.AddCondition("money",">=",2);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("item",307,1,333,0);
    npcs.base.autonpcfunctions.AddConsequence("money","-",2);
    npcs.base.autonpcfunctions.AddConsequence("talk","end");
    npcs.base.autonpcfunctions.AddTraderTrigger("kaufe schinken","Ausgezeichnet, ist hier ein auserlesenes Stück von Fleisch.");
    npcs.base.autonpcfunctions.AddCondition("money",">=",3);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddConsequence("item",306,1,333,0);
    npcs.base.autonpcfunctions.AddConsequence("money","-",3);
    npcs.base.autonpcfunctions.AddConsequence("talk","end");
    npcs.base.autonpcfunctions.AddTraderTrigger("buy ham"," Wunderful, here beh a gud piece ob meat.");
    npcs.base.autonpcfunctions.AddCondition("money",">=",3);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("item",306,1,333,0);
    npcs.base.autonpcfunctions.AddConsequence("money","-",3);
    npcs.base.autonpcfunctions.AddConsequence("talk","end");
    npcs.base.autonpcfunctions.AddTraderTrigger("kaufe steak","Ausgezeichnet, ist hier ein auserlesenes Stück von Fleisch.");
    npcs.base.autonpcfunctions.AddCondition("money",">=",3);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddConsequence("item",2940,1,333,0);
    npcs.base.autonpcfunctions.AddConsequence("money","-",3);
    npcs.base.autonpcfunctions.AddConsequence("talk","end");
    npcs.base.autonpcfunctions.AddTraderTrigger("buy steak"," Wunderful, here beh a gud piece ob meat.");
    npcs.base.autonpcfunctions.AddCondition("money",">=",3);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("item",2940,1,333,0);
    npcs.base.autonpcfunctions.AddConsequence("money","-",3);
    npcs.base.autonpcfunctions.AddConsequence("talk","end");
    npcs.base.autonpcfunctions.AddTraderTrigger("kaufe würste","Ausgezeichnet, ist hier ein auserlesenes Stück von Fleisch.");
    npcs.base.autonpcfunctions.AddCondition("money",">=",3);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddConsequence("item",3051,1,333,0);
    npcs.base.autonpcfunctions.AddConsequence("money","-",3);
    npcs.base.autonpcfunctions.AddConsequence("talk","end");
    npcs.base.autonpcfunctions.AddTraderTrigger("buy sausage"," Wunderful, here beh a gud piece ob meat.");
    npcs.base.autonpcfunctions.AddCondition("money",">=",3);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("item",3051,1,333,0);
    npcs.base.autonpcfunctions.AddConsequence("money","-",3);
    npcs.base.autonpcfunctions.AddConsequence("talk","end");
    npcs.base.autonpcfunctions.AddTraderTrigger("auf bald","Bis bald!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("bis bald");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("tschüss");
    npcs.base.autonpcfunctions.AddTraderTrigger("farewell","Farrebas!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("bye");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("good day");
    npcs.base.autonpcfunctions.AddCycleText("#me sieht sich für Kunden um","#me looks around for customers");
    npcs.base.autonpcfunctions.AddCycleText("#me haut etwas Fleisch ab und hängt es ","#me chops up some meat and hangs it");
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

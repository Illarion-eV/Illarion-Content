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

    InitTalkLists();

    -- ********* START DYNAMIC PART ********

    -- Kurg the butcher
    AddTraderTrigger(" ","Tut mir leid, ich bin beschäftigt. Warte bitte einen Moment bis ich mein Gespräch beendet habe.");
    AddCondition("idlestate","busy");
    AddCondition("lang","german");
    AddTraderTrigger(" ","Meh sorry, but meh busy at da moment. Wait till meh finished meh speech?");
    AddCondition("idlestate","busy");
    AddCondition("lang","english");
    AddTraderTrigger("gr[üue]+[sß]+e","Schön dich zu sehen! Wie gehts dir?  Ich bin Kurg der Metzger. Wie kann ich Ihnen helfen?");
    AddAdditionalTrigger("Hallo");
    AddAdditionalTrigger("Guten Tag");
    AddCondition("lang","german");
    AddTraderTrigger("greetings","Greebas! How are joo?  Meh is Kurg da Butcher.  How may meh help joo?");
    AddAdditionalTrigger("hello");
    AddCondition("lang","english");
    AddTraderTrigger("was verkaufe","Ich verkaufe alle Arten von Fleisch: Kaninchen, Lamm, Rehe und Schweinefleisch für nur 2 Kupfer jeder. Schinken, Steak und Würste kosten 3 jeder.");
    AddTraderTrigger("what sell","Meh sells all kinds ob meats: Rabbit, Lamb, Deer and Pork for only 2 coppers each.  Ham, Steak and sausages cost 3 each.");
    AddCondition("lang","english");
    AddTraderTrigger("was kaufe","Ich kaufe alle Arten von Fleisch: Kaninchen, Lamm, Rehe und Schweinefleisch für nur 1 Kupfer jeder. Schinken, Steak und Würste sind 2 jeder wert.");
    AddTraderTrigger("what buy","Meh buys all kinds ob meats: Rabbit, Lamb, Deer and Pork for only 1 copper each.  Ham, Steak and Sausages are worth 2 each.");
    AddCondition("lang","english");
    -- selling section
    AddTraderTrigger("verkaufe kaninchen"," Ausgezeichnet, ist hier eine Münze für Ihre Schwierigkeiten.");
    AddCondition("item",553,"belt",">=",1);
    AddCondition("lang","german");
    AddConsequence("deleteitem",553,1);
    AddConsequence("money","+",1);
    AddConsequence("talk","end");
    AddTraderTrigger("sell rabbit","Wunderful, here beh a coin for joor trubble.");
    AddCondition("item",553,"belt",">=",1);
    AddCondition("lang","english");
    AddConsequence("deleteitem",553,1);
    AddConsequence("money","+",1);
    AddConsequence("talk","end");
    AddTraderTrigger("verkaufe lamm"," Ausgezeichnet, ist hier eine Münze für Ihre Schwierigkeiten.");
    AddCondition("item",2934,"belt",">=",1);
    AddCondition("lang","german");
    AddConsequence("deleteitem",2934,1);
    AddConsequence("money","+",1);
    AddConsequence("talk","end");
    AddTraderTrigger("sell Lamb","Wunderful, here beh a coin for joor trubble.");
    AddCondition("item",2934,"belt",">=",1);
    AddCondition("lang","english");
    AddConsequence("deleteitem",2934,1);
    AddConsequence("money","+",1);
    AddConsequence("talk","end");
    AddTraderTrigger("verkaufe rehe"," Ausgezeichnet, ist hier eine Münze für Ihre Schwierigkeiten.");
    AddCondition("item",552,"belt",">=",1);
    AddCondition("lang","german");
    AddConsequence("deleteitem",552,1);
    AddConsequence("money","+",1);
    AddConsequence("talk","end");
    AddTraderTrigger("sell deer","Wunderful, here beh a coin for joor trubble.");
    AddCondition("item",552,"belt",">=",1);
    AddCondition("lang","english");
    AddConsequence("deleteitem",552,1);
    AddConsequence("money","+",1);
    AddConsequence("talk","end");
    AddTraderTrigger("verkaufe schweinefleisch"," Ausgezeichnet, ist hier eine Münze für Ihre Schwierigkeiten.");
    AddCondition("item",307,"belt",">=",1);
    AddCondition("lang","german");
    AddConsequence("deleteitem",307,1);
    AddConsequence("money","+",1);
    AddConsequence("talk","end");
    AddTraderTrigger("sell pork","Wunderful, here beh a coin for joor trubble.");
    AddCondition("item",307,"belt",">=",1);
    AddCondition("lang","english");
    AddConsequence("deleteitem",307,1);
    AddConsequence("money","+",1);
    AddConsequence("talk","end");
    AddTraderTrigger("verkaufe schinken"," Ausgezeichnet, ist hier 2 Münzen für Ihre Schwierigkeiten.");
    AddCondition("item",306,"belt",">=",1);
    AddCondition("lang","german");
    AddConsequence("deleteitem",306,1);
    AddConsequence("money","+",2);
    AddConsequence("talk","end");
    AddTraderTrigger("sell ham","Wunderful, here beh 2 coins for joor trubble.");
    AddCondition("item",306,"belt",">=",1);
    AddCondition("lang","english");
    AddConsequence("deleteitem",306,1);
    AddConsequence("money","+",2);
    AddConsequence("talk","end");
    AddTraderTrigger("verkaufe steak"," Ausgezeichnet, ist hier 2 Münzen für Ihre Schwierigkeiten.");
    AddCondition("item",2940,"belt",">=",1);
    AddCondition("lang","german");
    AddConsequence("deleteitem",2940,1);
    AddConsequence("money","+",2);
    AddConsequence("talk","end");
    AddTraderTrigger("sell steak"," Wunderful, here beh 2 coins for joor trubble.");
    AddCondition("item",2940,"belt",">=",1);
    AddCondition("lang","english");
    AddConsequence("deleteitem",2940,1);
    AddConsequence("money","+",2);
    AddConsequence("talk","end");
    AddTraderTrigger("verkaufe würste"," Ausgezeichnet, ist hier 2 Münzen für Ihre Schwierigkeiten.");
    AddCondition("item",3051,"belt",">=",1);
    AddCondition("lang","german");
    AddConsequence("deleteitem",3051,1);
    AddConsequence("money","+",2);
    AddConsequence("talk","end");
    AddTraderTrigger("sell sausage"," Wunderful, here beh 2 coins for joor trubble.");
    AddCondition("item",3051,"belt",">=",1);
    AddCondition("lang","english");
    AddConsequence("deleteitem",3051,1);
    AddConsequence("money","+",2);
    AddConsequence("talk","end");
    -- buying section
    AddTraderTrigger("kaufe"," Kommen Sie zurück, wenn Sie etwas gewähren können!");
    AddCondition("money","=",0);
    AddCondition("lang","german");
    AddConsequence("talk","end");
    AddTraderTrigger("buy","Cum Back when joo can afford sumding!");
    AddCondition("money","=",0);
    AddCondition("lang","english");
    AddConsequence("talk","end");
    AddTraderTrigger("kaufe kaninchen","Ausgezeichnet, ist hier ein auserlesenes Stück von Fleisch.");
    AddCondition("money",">=",2);
    AddCondition("lang","german");
    AddConsequence("item",553,1,333,0);
    AddConsequence("money","-",2);
    AddConsequence("talk","end");
    AddTraderTrigger("buy rabbit","Wunderful, here beh a gud piece ob meat.");
    AddCondition("money",">=",2);
    AddCondition("lang","english");
    AddConsequence("item",553,1,333,0);
    AddConsequence("money","-",2);
    AddConsequence("talk","end");
    AddTraderTrigger("kaufe lamm","Ausgezeichnet, ist hier ein auserlesenes Stück von Fleisch.");
    AddCondition("money",">=",2);
    AddCondition("lang","german");
    AddConsequence("item",2934,1,333,0);
    AddConsequence("money","-",2);
    AddConsequence("talk","end");
    AddTraderTrigger("buy lamb"," Wunderful, here beh a gud piece ob meat.");
    AddCondition("money",">=",2);
    AddCondition("lang","english");
    AddConsequence("item",2934,1,333,0);
    AddConsequence("money","-",2);
    AddConsequence("talk","end");
    AddTraderTrigger("kaufe rehe","Ausgezeichnet, ist hier ein auserlesenes Stück von Fleisch.");
    AddCondition("money",">=",2);
    AddCondition("lang","german");
    AddConsequence("item",552,1,333,0);
    AddConsequence("money","-",2);
    AddConsequence("talk","end");
    AddTraderTrigger("buy deer"," Wunderful, here beh a gud piece ob meat.");
    AddCondition("money",">=",2);
    AddCondition("lang","english");
    AddConsequence("item",552,1,333,0);
    AddConsequence("money","-",2);
    AddConsequence("talk","end");
    AddTraderTrigger("kaufe schweinefleisch","Ausgezeichnet, ist hier ein auserlesenes Stück von Fleisch.");
    AddCondition("money",">=",2);
    AddCondition("lang","german");
    AddConsequence("item",307,1,333,0);
    AddConsequence("money","-",2);
    AddConsequence("talk","end");
    AddTraderTrigger("buy pork"," Wunderful, here beh a gud piece ob meat.");
    AddCondition("money",">=",2);
    AddCondition("lang","english");
    AddConsequence("item",307,1,333,0);
    AddConsequence("money","-",2);
    AddConsequence("talk","end");
    AddTraderTrigger("kaufe schinken","Ausgezeichnet, ist hier ein auserlesenes Stück von Fleisch.");
    AddCondition("money",">=",3);
    AddCondition("lang","german");
    AddConsequence("item",306,1,333,0);
    AddConsequence("money","-",3);
    AddConsequence("talk","end");
    AddTraderTrigger("buy ham"," Wunderful, here beh a gud piece ob meat.");
    AddCondition("money",">=",3);
    AddCondition("lang","english");
    AddConsequence("item",306,1,333,0);
    AddConsequence("money","-",3);
    AddConsequence("talk","end");
    AddTraderTrigger("kaufe steak","Ausgezeichnet, ist hier ein auserlesenes Stück von Fleisch.");
    AddCondition("money",">=",3);
    AddCondition("lang","german");
    AddConsequence("item",2940,1,333,0);
    AddConsequence("money","-",3);
    AddConsequence("talk","end");
    AddTraderTrigger("buy steak"," Wunderful, here beh a gud piece ob meat.");
    AddCondition("money",">=",3);
    AddCondition("lang","english");
    AddConsequence("item",2940,1,333,0);
    AddConsequence("money","-",3);
    AddConsequence("talk","end");
    AddTraderTrigger("kaufe würste","Ausgezeichnet, ist hier ein auserlesenes Stück von Fleisch.");
    AddCondition("money",">=",3);
    AddCondition("lang","german");
    AddConsequence("item",3051,1,333,0);
    AddConsequence("money","-",3);
    AddConsequence("talk","end");
    AddTraderTrigger("buy sausage"," Wunderful, here beh a gud piece ob meat.");
    AddCondition("money",">=",3);
    AddCondition("lang","english");
    AddConsequence("item",3051,1,333,0);
    AddConsequence("money","-",3);
    AddConsequence("talk","end");
    AddTraderTrigger("auf bald","Bis bald!");
    AddAdditionalTrigger("bis bald");
    AddAdditionalTrigger("tschüss");
    AddTraderTrigger("farewell","Farrebas!");
    AddAdditionalTrigger("bye");
    AddAdditionalTrigger("good day");
    AddCycleText("#me sieht sich für Kunden um","#me looks around for customers");
    AddCycleText("#me haut etwas Fleisch ab und hängt es ","#me chops up some meat and hangs it");
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

-- INSERT INTO npc VALUES (nextval('npc_seq'),4,194,-334,0,4,false,'Grugash','npc_grugash.lua',0);

require("npc.base.autonpcfunctions")
module("npc.grugash", package.seeall)

function useNPC(user)
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

    -- Orc guard
    npc.base.autonpcfunctions.AddTraderTrigger("Gobaith","Gobaith?  Dis liddle Island?  I hate it!");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Gobaith","Gobaith?  Diese kleine Insel? Ich hasse es!");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("Greenbriar","Are joo hungry? Halflings make gud snacks, yubba!");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Greenbriar","Haben Sie Hunger? Halblenge machen gute Imbisse!");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("Orc","Yubba!  Meh mighty Orc!");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Orc","Ich bin ein mächtiger Ork!");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("Ork","Ich bin ein mächtiger Ork!");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("Orc Cave","Just go North and see Tihgorac.  Go through Cave and up ladder.  Keep North and see Higdish.");
    npc.base.autonpcfunctions.AddTraderTrigger("Orc Cave"," Gehen Sie gerade Norden und sieh Tihgorac. Gehen Sie Höhle und Leiter durch. Behalten Sie Norden und sieh Higdish.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("Varshikar","Oomie desert town.  Just go East, joo can't miss it.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Varshikar"," Menschliche Wüste-Stadt. Gehen Sie gerade Osten, Sie können nicht es verpassen!");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("I am","Nice to meet joo.");
    npc.base.autonpcfunctions.AddTraderTrigger("I'm","Nice to meet joo.");
    npc.base.autonpcfunctions.AddTraderTrigger("Ich bin","Nett dich kennen su lernen.");
    npc.base.autonpcfunctions.AddTraderTrigger("Silberbrand","#me spuckt auf dem Grund und bleibt still.");
    npc.base.autonpcfunctions.AddTraderTrigger("Silverbrand","#me spits on the ground and remains silent.");
    npc.base.autonpcfunctions.AddTraderTrigger("Troll Bane","It beh in middle ob Island.  Big Oomie town it beh.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Troll Bane","Es ist in der Mitte der Insel. Es ist eine große menschliche Stadt.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("gr[üue]+[sß]+e","Hallo! Was wollen Sie?");
    npc.base.autonpcfunctions.AddTraderTrigger("greetings","Greebas! Whub joo want?");
    npc.base.autonpcfunctions.AddTraderTrigger("greets","Greebas! Whub joo want?");
    npc.base.autonpcfunctions.AddTraderTrigger("greeb+[a]+s","Greebas friend!  How can meh help joo?");
    npc.base.autonpcfunctions.AddTraderTrigger("hail","Greebas!  Whub joo want?");
    npc.base.autonpcfunctions.AddTraderTrigger("hallo","Hallo! Was wollen Sie?");
    npc.base.autonpcfunctions.AddTraderTrigger("hello","Greebas! Whub joo want?");
    npc.base.autonpcfunctions.AddTraderTrigger("auf bald","Tchuss!");
    npc.base.autonpcfunctions.AddTraderTrigger("farewell","Farrebas!");
    npc.base.autonpcfunctions.AddTraderTrigger("bye","Farrebas!");
    npc.base.autonpcfunctions.AddTraderTrigger("mission","Meh mission is to guard dis Border.");
    npc.base.autonpcfunctions.AddTraderTrigger("beruf","Meine Mission ist, diese Grenze zu schützen.");
    npc.base.autonpcfunctions.AddTraderTrigger("deine aufgabe","Meine Mission ist, diese Grenze zu schützen.");
    npc.base.autonpcfunctions.AddTraderTrigger("eure aufgabe","Meine Mission ist, diese Grenze zu schützen.");
    npc.base.autonpcfunctions.AddTraderTrigger("job","Meh job is to guard dis border!");
    npc.base.autonpcfunctions.AddTraderTrigger("t[äae]+tigkeit","Meine Mission ist, diese Grenze zu schützen.");
    npc.base.autonpcfunctions.AddTraderTrigger("was tust du","Meine Mission ist, diese Grenze zu schützen.");
    npc.base.autonpcfunctions.AddTraderTrigger("was tut ihr","Meine Mission ist, diese Grenze zu schützen.");
    npc.base.autonpcfunctions.AddTraderTrigger("what you do","Meh job is to guard dis border!");
    npc.base.autonpcfunctions.AddTraderTrigger("dein name","Mein name? Ich heiße %npcname");
    npc.base.autonpcfunctions.AddTraderTrigger("you name","My name?  I beh %npcname");
    npc.base.autonpcfunctions.AddTraderTrigger("mein name","Sehr angenem. Ich heiße %NPCNAME.");
    npc.base.autonpcfunctions.AddTraderTrigger("my name","Keh, gud to meet joo.  Meh beh %NPCNAME.");
    npc.base.autonpcfunctions.AddTraderTrigger("wie hei[sß]+t du","Ich heißße %NPCNAME.");
    npc.base.autonpcfunctions.AddTraderTrigger("helfen","Ihr wolld mir helfen? Gud, bringt mir eine Flasche Bier!");
    npc.base.autonpcfunctions.AddTraderTrigger("help","Joo wanna help me?  Gud, bring meh a bottle ob Beer!");
    npc.base.autonpcfunctions.AddTraderTrigger("hilfe","Ihr wolld mir helfen? Gud, bringt mir eine Flasche Bier!");
    npc.base.autonpcfunctions.AddTraderTrigger("how are you","Gud.");
    npc.base.autonpcfunctions.AddTraderTrigger("wie geht es","Gut.");
    npc.base.autonpcfunctions.AddTraderTrigger("buy","Meh nub buy anyding!");
    npc.base.autonpcfunctions.AddTraderTrigger("kaufen","Ich kaufe gar nix!");
    npc.base.autonpcfunctions.AddTraderTrigger("sell","Meh nub sell anyding.");
    npc.base.autonpcfunctions.AddTraderTrigger("verkaufen","Ich verkaufe gar nix!");
    npc.base.autonpcfunctions.AddTraderTrigger("neu","Du bist neu hier? Geh am besten in die Stadt Osten, Varshikar, und suche nach Leuten, die dir helfen können.");
    npc.base.autonpcfunctions.AddTraderTrigger("I[ a']+m new","You are new to Illarion? You should visit the town to the East, Varshikar. Search for people who can help you.");
    npc.base.autonpcfunctions.AddTraderTrigger("newbie","You are new to Illarion? You should visit the town to the East, Varshikar. Search for people who can help you.");
    npc.base.autonpcfunctions.AddTraderTrigger("where am I","Joo are on da Border to da Orcs lands!");
    npc.base.autonpcfunctions.AddTraderTrigger("wo bin ich"," Sie sind auf der Grenze zu den Orks lande!");
    npc.base.autonpcfunctions.AddTraderTrigger("who","Meh job is to guard dis Border");
    npc.base.autonpcfunctions.AddTraderTrigger("wer seid","Mein Job soll diese Grenze schützen.");
    npc.base.autonpcfunctions.AddTraderTrigger("wer","Mein Job soll diese Grenze schützen.");
    npc.base.autonpcfunctions.AddTraderTrigger("quest","Nubba Quest here.  Ask anudder Guard.");
    npc.base.autonpcfunctions.AddTraderTrigger("wache","Die Wache? Wir sind besten!");
    npc.base.autonpcfunctions.AddTraderTrigger("guard","The Guards?  Weh are da best!");
    npc.base.autonpcfunctions.AddCycleText("#me rülpst","#me burps");
    npc.base.autonpcfunctions.AddCycleText("#me zieht eine kleine Flasche aus der Tasche und trinkt einen Schluck","#me pulls a bottle out of his pocket and takes a sip");
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

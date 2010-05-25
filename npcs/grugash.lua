-- INSERT INTO npc VALUES (nextval('npc_seq'),4,194,-334,0,4,false,'Grugash','npc_grugash.lua',0);

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

    -- Orc guard
    npcs.base.autonpcfunctions.AddTraderTrigger("Gobaith","Gobaith?  Dis liddle Island?  I hate it!");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Gobaith","Gobaith?  Diese kleine Insel? Ich hasse es!");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("Greenbriar","Are joo hungry? Halflings make gud snacks, yubba!");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Greenbriar","Haben Sie Hunger? Halblenge machen gute Imbisse!");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("Orc","Yubba!  Meh mighty Orc!");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Orc","Ich bin ein mächtiger Ork!");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("Ork","Ich bin ein mächtiger Ork!");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("Orc Cave","Just go North and see Tihgorac.  Go through Cave and up ladder.  Keep North and see Higdish.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Orc Cave"," Gehen Sie gerade Norden und sieh Tihgorac. Gehen Sie Höhle und Leiter durch. Behalten Sie Norden und sieh Higdish.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("Varshikar","Oomie desert town.  Just go East, joo can’t miss it.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Varshikar"," Menschliche Wüste-Stadt. Gehen Sie gerade Osten, Sie können nicht es verpassen!");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("I am","Nice to meet joo.");
    npcs.base.autonpcfunctions.AddTraderTrigger("I'm","Nice to meet joo.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Ich bin","Nett dich kennen su lernen.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Silberbrand","#me spuckt auf dem Grund und bleibt still.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Silverbrand","#me spits on the ground and remains silent.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Troll Bane","It beh in middle ob Island.  Big Oomie town it beh.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Troll Bane","Es ist in der Mitte der Insel. Es ist eine große menschliche Stadt.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("gr[üue]+[sß]+e","Hallo! Was wollen Sie?");
    npcs.base.autonpcfunctions.AddTraderTrigger("greetings","Greebas! Whub joo want?");
    npcs.base.autonpcfunctions.AddTraderTrigger("greets","Greebas! Whub joo want?");
    npcs.base.autonpcfunctions.AddTraderTrigger("greeb+[a]+s","Greebas friend!  How can meh help joo?");
    npcs.base.autonpcfunctions.AddTraderTrigger("hail","Greebas!  Whub joo want?");
    npcs.base.autonpcfunctions.AddTraderTrigger("hallo","Hallo! Was wollen Sie?");
    npcs.base.autonpcfunctions.AddTraderTrigger("hello","Greebas! Whub joo want?");
    npcs.base.autonpcfunctions.AddTraderTrigger("auf bald","Tchuss!");
    npcs.base.autonpcfunctions.AddTraderTrigger("farewell","Farrebas!");
    npcs.base.autonpcfunctions.AddTraderTrigger("bye","Farrebas!");
    npcs.base.autonpcfunctions.AddTraderTrigger("mission","Meh mission is to guard dis Border.");
    npcs.base.autonpcfunctions.AddTraderTrigger("beruf","Meine Mission ist, diese Grenze zu schützen.");
    npcs.base.autonpcfunctions.AddTraderTrigger("deine aufgabe","Meine Mission ist, diese Grenze zu schützen.");
    npcs.base.autonpcfunctions.AddTraderTrigger("eure aufgabe","Meine Mission ist, diese Grenze zu schützen.");
    npcs.base.autonpcfunctions.AddTraderTrigger("job","Meh job is to guard dis border!");
    npcs.base.autonpcfunctions.AddTraderTrigger("t[äae]+tigkeit","Meine Mission ist, diese Grenze zu schützen.");
    npcs.base.autonpcfunctions.AddTraderTrigger("was tust du","Meine Mission ist, diese Grenze zu schützen.");
    npcs.base.autonpcfunctions.AddTraderTrigger("was tut ihr","Meine Mission ist, diese Grenze zu schützen.");
    npcs.base.autonpcfunctions.AddTraderTrigger("what you do","Meh job is to guard dis border!");
    npcs.base.autonpcfunctions.AddTraderTrigger("dein name","Mein name? Ich heiße %npcname");
    npcs.base.autonpcfunctions.AddTraderTrigger("you name","My name?  I beh %npcname");
    npcs.base.autonpcfunctions.AddTraderTrigger("mein name","Sehr angenem. Ich heiße %NPCNAME.");
    npcs.base.autonpcfunctions.AddTraderTrigger("my name","Keh, gud to meet joo.  Meh beh %NPCNAME.");
    npcs.base.autonpcfunctions.AddTraderTrigger("wie hei[sß]+t du","Ich heißße %NPCNAME.");
    npcs.base.autonpcfunctions.AddTraderTrigger("helfen","Ihr wolld mir helfen? Gud, bringt mir eine Flasche Bier!");
    npcs.base.autonpcfunctions.AddTraderTrigger("help","Joo wanna help me?  Gud, bring meh a bottle ob Beer!");
    npcs.base.autonpcfunctions.AddTraderTrigger("hilfe","Ihr wolld mir helfen? Gud, bringt mir eine Flasche Bier!");
    npcs.base.autonpcfunctions.AddTraderTrigger("how are you","Gud.");
    npcs.base.autonpcfunctions.AddTraderTrigger("wie geht es","Gut.");
    npcs.base.autonpcfunctions.AddTraderTrigger("buy","Meh nub buy anyding!");
    npcs.base.autonpcfunctions.AddTraderTrigger("kaufen","Ich kaufe gar nix!");
    npcs.base.autonpcfunctions.AddTraderTrigger("sell","Meh nub sell anyding.");
    npcs.base.autonpcfunctions.AddTraderTrigger("verkaufen","Ich verkaufe gar nix!");
    npcs.base.autonpcfunctions.AddTraderTrigger("neu","Du bist neu hier? Geh am besten in die Stadt Osten, Varshikar, und suche nach Leuten, die dir helfen können.");
    npcs.base.autonpcfunctions.AddTraderTrigger("I[ a']+m new","You are new to Illarion? You should visit the town to the East, Varshikar. Search for people who can help you.");
    npcs.base.autonpcfunctions.AddTraderTrigger("newbie","You are new to Illarion? You should visit the town to the East, Varshikar. Search for people who can help you.");
    npcs.base.autonpcfunctions.AddTraderTrigger("where am I","Joo are on da Border to da Orcs lands!");
    npcs.base.autonpcfunctions.AddTraderTrigger("wo bin ich"," Sie sind auf der Grenze zu den Orks lande!");
    npcs.base.autonpcfunctions.AddTraderTrigger("who","Meh job is to guard dis Border");
    npcs.base.autonpcfunctions.AddTraderTrigger("wer seid","Mein Job soll diese Grenze schützen.");
    npcs.base.autonpcfunctions.AddTraderTrigger("wer","Mein Job soll diese Grenze schützen.");
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Nubba Quest here.  Ask anudder Guard.");
    npcs.base.autonpcfunctions.AddTraderTrigger("wache","Die Wache? Wir sind besten!");
    npcs.base.autonpcfunctions.AddTraderTrigger("guard","The Guards?  Weh are da best!");
    npcs.base.autonpcfunctions.AddCycleText("#me rülpst","#me burps");
    npcs.base.autonpcfunctions.AddCycleText("#me zieht eine kleine Flasche aus der Tasche und trinkt einen Schluck","#me pulls a bottle out of his pocket and takes a sip");
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

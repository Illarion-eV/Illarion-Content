-- INSERT INTO npc VALUES (nextval('npc_seq'),0,133,581,0,4,false,'Fredericus','npc_fredericus.lua',0);

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

    QuestID = 0;
    -- NPC by Estralis Seborian
    -- This NPC is supposed to trade (all goods are sold and bought, percentage indicates ratio of price bough/sold):
    -- 10% Tools (Fisher): 72
    -- 5% Tools (Herb gatherer): 126
    -- 5% Herbs II: 752, 753, 754, 755, 756, 757, 758, 759, 760, 761, 762, 763, 764, 765, 766, 767, 768, 769
    -- 5% Herbs: 133, 134, 135, 136, 137, 138, 140, 141, 142, 143, 144, 145, 146, 148, 152, 153, 154, 155, 156, 157
    -- 5% Mushrooms: 158, 159, 160, 161, 162, 163
    -- 10% Fish: 73, 355, 455
    -- Help
    AddTraderTrigger("Help","");
    AddConsequence("inform","[Game Help] This NPC is the fisherman Fredericus. Keyphrases: Hello, fisherman.");
    AddTraderTrigger("Hilfe","");
    AddConsequence("inform","[Spielhilfe] Dieser NPC ist der Fischer Fredericus. Schlüsselwörter: Hallo, Fischer.");
    -- General speech
    AddTraderTrigger("Hello","Ahoy! Fresh fish!");
    AddAdditionalTrigger("Greetings");
    AddAdditionalTrigger("Be greeted");
    AddAdditionalTrigger("Hail");
    AddAdditionalTrigger("Good day");
    AddAdditionalTrigger("Good morning");
    AddAdditionalTrigger("Good evening");
    AddAdditionalText("G'day. I just came ashore.");
    AddAdditionalText("Only the best fish, only today, only for you!");
    AddTraderTrigger("Grüße","Ahoi! Frischer Fisch!");
    AddAdditionalTrigger("Gruß");
    AddAdditionalTrigger("Seid gegrüßt");
    AddAdditionalTrigger("Guten Tag");
    AddAdditionalTrigger("Guten Abend");
    AddAdditionalTrigger("Mahlzeit");
    AddAdditionalTrigger("Tach");
    AddAdditionalTrigger("Moin");
    AddAdditionalText("Tag. Bin gerade von großer Fahrt zurück.");
    AddAdditionalText("Nur der beste Fisch, nur heute, nur für euch!");
    AddTraderTrigger("Hiho","Ahoy! Fresh fish!");
    AddAdditionalTrigger("Hallo");
    AddAdditionalTrigger("Hey");
    AddAdditionalTrigger("Greebas");
    AddAdditionalTrigger("Greebs");
    AddCondition("lang","english");
    AddAdditionalText("G'day. I just came ashore.");
    AddAdditionalText("Only the best fish, only today, only for you!");
    AddTraderTrigger("Hiho","Ahoi! Frischer Fisch!");
    AddAdditionalTrigger("Hallo");
    AddAdditionalTrigger("Hey");
    AddAdditionalTrigger("Greebas");
    AddAdditionalTrigger("Greebs");
    AddCondition("lang","german");
    AddAdditionalText("Tag. Bin gerade von großer Fahrt zurück.");
    AddAdditionalText("Nur der beste Fisch, nur heute, nur für euch!");
    AddTraderTrigger("Farewell","Good trip.");
    AddAdditionalTrigger("Good bye");
    AddAdditionalTrigger("Bye");
    AddAdditionalTrigger("Fare thy well");
    AddAdditionalText("Until next time, remember, a fish a day keeps the medico away.");
    AddAdditionalText("Farewell.");
    AddTraderTrigger("Tschüß","Gute Fahrt.");
    AddAdditionalTrigger("Tschüss");
    AddAdditionalTrigger("Wiedersehen");
    AddAdditionalTrigger("Gehabt euch wohl");
    AddAdditionalText("Bis zum nächesten Mal, denkt daran, ein Fisch am Tag hält den Medizinmann fern.");
    AddAdditionalText("Auf wiedersehen.");
    AddTraderTrigger("Ciao","Good trip.");
    AddAdditionalTrigger("Adieu");
    AddAdditionalTrigger("Au revoir");
    AddCondition("lang","english");
    AddAdditionalText("Until next time, remember, a fish a day keeps the medico away.");
    AddAdditionalText("Farewell.");
    AddTraderTrigger("Ciao","Gute Fahrt.");
    AddAdditionalTrigger("Adieu");
    AddAdditionalTrigger("Au revoir");
    AddCondition("lang","german");
    AddAdditionalText("Bis zum nächesten Mal, denkt daran, ein Fisch am Tag hält den Medizinmann fern.");
    AddAdditionalText("Auf wiedersehen.");
    AddTraderTrigger("How are you","I feel good, not a wonder, I had fish today.");
    AddAdditionalTrigger("How feel");
    AddAdditionalTrigger("How do you do");
    AddAdditionalText("I'd feel much better if you buy some fish.");
    AddAdditionalText("Fine, thank you.");
    AddTraderTrigger("Wie geht","Mir geht es gut, ist auch kein Wunder, ich habe heute Fisch gegessen.");
    AddAdditionalTrigger("Wie fühlst");
    AddAdditionalTrigger("Wie ist es ergangen");
    AddAdditionalText("Mir würde es weit besser gehen, wenn ihr Fisch kaufen würdet.");
    AddAdditionalText("Gut, danke der Nachfrage.");
    AddTraderTrigger("your name","Fredericus. That's me.");
    AddAdditionalTrigger("who are you");
    AddAdditionalTrigger("who art thou");
    AddAdditionalText("I am the fisherman Fredericus.");
    AddAdditionalText("Fredericus is my name, I trade fish.");
    AddTraderTrigger("dein name","Fredericus. Das bin ich.");
    AddAdditionalTrigger("wer bist du");
    AddAdditionalTrigger("wer seid ihr");
    AddAdditionalTrigger("wie heißt");
    AddAdditionalText("Ich bin der Fischer Fredericus.");
    AddAdditionalText("Fredericus ist mein Name, ich handel mit Fischen.");
    -- Catching typical NPC phrases
    AddTraderTrigger("what sell","Fish, fish, fish. I trade fish. And also herbs, if you need any to spice up your dishes.");
    AddAdditionalTrigger("what buy");
    AddAdditionalTrigger("list wares");
    AddAdditionalTrigger("price of");
    AddAdditionalText("I trade fish, do you need any?");
    AddAdditionalText("I trade what you need to catch fish and I even buy the fish you caught.");
    AddTraderTrigger("was verkauf","Fisch, Fisch und nochmal Fisch. Ich handele mit Fischen und auch Kräutern, wenn ihr eure Gerichte würzen wollt.");
    AddAdditionalTrigger("was kauf");
    AddAdditionalTrigger("warenliste");
    AddAdditionalTrigger("preis von");
    AddAdditionalText("Ich handel Fische, braucht ihr welche?");
    AddAdditionalText("Ich verkaufe alles, was man zum Fischen braucht und kaufe sogar euren Fang.");
    AddTraderTrigger("tell something","I swear I saw a sea serpent!");
    AddAdditionalText("If an evil spirit haunts a ship, all is lost.");
    AddTraderTrigger("erzähl was","Ich schwöre, ich habe ein Seeungeheuer gesehen!");
    AddAdditionalTrigger("erzähl etwas");
    AddAdditionalText("Wenn ein böser Geist auf einem Schiff sein Unwesen treibt, dann ist es meist bald verloren.");
    -- Small talk: The talk here should focus on possible questions. Feel free to add more!
    AddTraderTrigger("profession","I'm a fisherman. A hard job, but a honest and honourable job.");
    AddTraderTrigger("beruf","Ich bin ein Fischer. Das ist ein hartes Geschäft, aber es ist ehrlich und ehrbar.");
    AddTraderTrigger("job","Ich bin ein Fischer. Das ist ein hartes Geschäft, aber es ist ehrlich und ehrbar.");
    AddCondition("lang","german");
    AddTraderTrigger("job","I'm a fisherman. A hard job, but a honest and honourable job.");
    AddCondition("lang","english");
    AddTraderTrigger("Fischer","Ich bin ein Fischer. Das ist ein hartes Geschäft, aber es ist ehrlich und ehrbar.");
    AddTraderTrigger("fisherman","I'm a fisherman. A hard job, but a honest and honourable job.");
    AddTraderTrigger("trader","Here, at the marketplace, there are many traders. You can buy many goods here in Cadomyr.");
    AddAdditionalTrigger("merchant");
    AddAdditionalTrigger("collegue");
    AddAdditionalTrigger("vendor");
    AddAdditionalTrigger("market");
    AddTraderTrigger("händler","Hier auf dem Marktplatz gibt es einige Händler. Man kann viele Waren hier in Cadomyr kaufen.");
    AddAdditionalTrigger("kollege");
    AddAdditionalTrigger("höker");
    AddAdditionalTrigger("markt");
    AddTraderTrigger("Gobaith","I once sailed to Gobaith, the natives tossed onions at each other!");
    AddCondition("lang","english");
    AddTraderTrigger("Gobaith","Ich bin einmal nach Gobaith gesegelt, die Eingeborenen dort haben mit Zwiebeln aufeinander geworfen!");
    AddCondition("lang","german");
    -- More small talk; add at least five triggers
    AddTraderTrigger("Zerarisa","Ich meine, Zerarisa ist eine der Echsen, die am Kap des Abschiedes wohnen.");
    AddCondition("lang","german");
    AddTraderTrigger("Zerarisa","I think Zerarisa is one of the lizards, living at Cape Farewell.");
    AddCondition("lang","english");
    AddTraderTrigger("Cape","Cape Farewell is to the south and west, land's end, one could say.");
    AddAdditionalTrigger("Farewell");
    AddTraderTrigger("Kap","Das Kap des Abschiedes ist im Südwesten, am Ende der Welt könnte man sagen.");
    AddAdditionalTrigger("Abschied");
    AddTraderTrigger("boat","No, I will not lend you my boat. Take a fishing rod and go to the shore.");
    AddAdditionalTrigger("ship");
    AddAdditionalTrigger("vessle");
    AddTraderTrigger("Boot","Ich kann euch mein Boot nicht leihen. Nehmt eine Angelrute und geht zur Küste.");
    AddAdditionalTrigger("Schiff");
    -- Faction stuff
    AddTraderTrigger("Elvaine","#me snorts angrily.");
    AddAdditionalTrigger("Morgan");
    AddAdditionalTrigger("archmage");
    AddAdditionalTrigger("Erzmagier");
    AddCondition("lang","english");
    AddAdditionalText("Better avoid Runewick's leader. Whatever you say, it is wrong. Whatever you do, it is wrong.");
    AddTraderTrigger("Elvaine","#me schnaubt wütend.");
    AddAdditionalTrigger("Morgan");
    AddAdditionalTrigger("archmage");
    AddAdditionalTrigger("Erzmagier");
    AddCondition("lang","german");
    AddAdditionalText("Vermeidet den Herren von Runewick. Was immer ihr sagt, es ist falsch. Was immer ihr tut, es ist falsch.");
    AddTraderTrigger("Runewick","If I were you, I'd never go to Runewick. They might be nice, but also, false and not honest.");
    AddCondition("lang","english");
    AddTraderTrigger("Runewick","Wenn ich an eurer Stelle wäre, würde ich nie nach Runewick gehen. Sie mögen nett dort sein, aber auch unehrlich und falsch. ");
    AddCondition("lang","german");
    AddTraderTrigger("Valerio","I'd like to toss some smelly fish at the Don. I will never understand how such a... villain can become leader of a community.");
    AddAdditionalTrigger("Guilianni");
    AddAdditionalTrigger("Don");
    AddCondition("lang","english");
    AddTraderTrigger("Valerio","Ich würd' gerne mal ein paar stinkige Fische auf den Don werfen. Ich werde nie verstehen, wie so ein... Rabauke der Anführer einer Gemeinschaft werden konnte.");
    AddAdditionalTrigger("Guilianni");
    AddAdditionalTrigger("Don");
    AddCondition("lang","german");
    AddTraderTrigger("Galmair","Galmair is not a safe place. The Don does not want it to be, so he can demand money for protection.");
    AddCondition("lang","english");
    AddTraderTrigger("Galmair","Galmair ist kein sicherer Ort. Aber der Don will es nicht anders, denn nur so kann er Schutzgeld erpressen.");
    AddCondition("lang","german");
    AddTraderTrigger("rosaline","Queen Rosaline, well, she is the best thing that could happen to Cadomyr. I say that and I mean it, the best woman is better than the worst man.");
    AddAdditionalTrigger("königin");
    AddAdditionalTrigger("queen");
    AddAdditionalTrigger("edwards");
    AddCondition("lang","english");
    AddTraderTrigger("rosaline","Königin Rosaline ist das beste, was Cadomyr geschehen konnte. Ich sage es, weil ich es meine; die beste Frau ist immernoch besser als der schlechteste Mann.");
    AddAdditionalTrigger("königin");
    AddAdditionalTrigger("queen");
    AddAdditionalTrigger("edwards");
    AddCondition("lang","german");
    AddTraderTrigger("Cadomyr","Cadomyr is my home, where I return to after setting sails.");
    AddCondition("lang","english");
    AddAdditionalText("I love Cadomyr as I love the sea.");
    AddAdditionalText("Cadomyr's best, forget the rest!");
    AddTraderTrigger("Cadomyr","Cadomyr ist meine Heimat, in die ich mit vollen Segeln zurückkehre.");
    AddCondition("lang","german");
    AddAdditionalText("Ich liebe Cadomyr wie das weite, offene Meer.");
    AddAdditionalText("Cadomyr kriegt das beste, für die anderen bleiben nur Reste.");
    -- Main land factions
    AddTraderTrigger("albar","Oh, Albar, how much I desire to sail there. A land of justice and honour");
    AddCondition("lang","english");
    AddTraderTrigger("albar","Oh, Albar, wie sehr wünschte ich, ich könnte dorthin segeln. Ein Land der Gerechtigkeit und der Ehre.");
    AddCondition("lang","german");
    AddTraderTrigger("gynk","What did you say?");
    AddAdditionalTrigger("gync");
    AddCondition("lang","english");
    AddAdditionalText("I did not understand you.");
    AddAdditionalText("Pardon me?");
    AddAdditionalText("Shh, do not talk about this too loud.");
    AddTraderTrigger("gync","Was habt ihr gesagt?");
    AddAdditionalTrigger("gynk");
    AddCondition("lang","german");
    AddAdditionalText("Ich habe euch nicht verstanden.");
    AddAdditionalText("Entschuldigung?");
    AddAdditionalText("Psst, sprecht darüber nicht so laut.");
    AddTraderTrigger("salkama","Arrogant wisenheimers they are. And a hard working fisherman does not matter to the oh-so-noble people there.");
    AddCondition("lang","english");
    AddTraderTrigger("salkama","Arrogante Besserwisser sind das. Und ein hart arbeitender Fischer zählt nichts für die ach-so-noblen Leute dort.");
    AddCondition("lang","german");
    -- Gods; each NPC should at react on at least one god, being a follower of said god
    AddTraderTrigger("Tanora","Tanora guides my boat, Tanora protects my boat, Tanora causes the waves that crash my boat.");
    AddAdditionalTrigger("Zelphia");
    AddCondition("lang","english");
    AddAdditionalText("Hail the goddess!");
    AddAdditionalText("I obey Tanora, but if you want to meet perons who adore her, go to Cape Farewell.");
    AddTraderTrigger("Tanora","Tanora lenkt mein Boot, Tanora schützt mein Boot, Tanora schickt die Wellen, die mein Boot zermalmen.");
    AddAdditionalTrigger("Zelphia");
    AddCondition("lang","german");
    AddAdditionalText("Huldigt Tanora!");
    AddAdditionalText("Ich gehorche Tanora, aber wenn ihr Leute treffen wollt, die sie verehren, geht zum Kap des Abschiedes.");
    -- Catching quest triggers
    AddTraderTrigger("quest","I do not issue any quests. But you can bring me fish and I'll pay you for your work.");
    AddAdditionalTrigger("mission");
    AddCondition("lang","english");
    AddTraderTrigger("quest","Ich verteile keine Aufgaben. Aber ihr könnt mir Fisch bringen und ich bezahle eure Arbeit.");
    AddAdditionalTrigger("mission");
    AddCondition("lang","german");
    AddTraderTrigger("task","I do not issue any quests. But you can bring me fish and I'll pay you for your work.");
    AddAdditionalTrigger("adventure");
    AddTraderTrigger("Auftrag","Ich verteile keine Aufgaben. Aber ihr könnt mir Fisch bringen und ich bezahle eure Arbeit.");
    AddAdditionalTrigger("Aufgabe");
    AddAdditionalTrigger("Abenteuer");
    -- Easter Egg
    AddTraderTrigger("fischers fritze","Fischt frische Fische!");
    -- Last catch: Think about keyphrases the player might say and that are not caught until here
    AddTraderTrigger("Yes","Aye, aye, and a flounder in addition.");
    AddAdditionalText("Well, maybe a herring?");
    AddAdditionalText("That's good.");
    AddTraderTrigger("Ja","Aye, aye, und eine Flunder dazu.");
    AddAdditionalText("Vielleicht einen Hering?");
    AddAdditionalText("Das ist gut auch so.");
    AddTraderTrigger("No","Do you prefer salmon perhaps?");
    AddAdditionalText("Will bloaters make you content?");
    AddTraderTrigger("Nein","Mögt ihr lieber Lachs?");
    AddAdditionalText("Würde euch ein Bückling zufriedenstellen?");
    AddTraderTrigger("stinkt","Das stimmt nicht.");
    AddAdditionalText("Mein Fisch ist lecker!");
    AddTraderTrigger("stinks","It does not!");
    AddAdditionalText("My fish is tasty!");
    -- Cycletext: Please add at least(!) five cycletext messages. The more, the better. You can use emotes (#me is green), too.
    AddCycleText("Mein Fisch stinkt nicht!","My fish does not stink!");
    AddCycleText("Frischer Fisch!","Fresh Fish!");
    AddCycleText("Fisch, Kräuter, alles, was ihr braucht für das Festmahl!","Fish, herbs, all you need for dinner!");
    AddCycleText("#me riecht an den Fischen in seiner Auslage und verzieht das Gesicht.","#me sniffes on the fish on his cart and wrinkles his nose.");
    AddCycleText("Fangfrischer Lachs!","Fresh salmon!");
    AddCycleText("Komm, kauf jetzt und pack dir noch einen Aal drauf!","C'mon, buy now and you get an eel for free!");
    AddCycleText("Kauft noch einen Bückling, der schmeckt zwar nicht, hält aber die Ratten fern.","Buy this bloater, it is not tasty, but it keeps the rats at bay.");
    AddCycleText("Beste Forellen!","Best trouts!");
    AddCycleText("Leckere Heringe!","Tasty herrings!");
    AddCycleText("Ein Pfund Makrelen, nur jetzt, nur für euch!","A pound mackerels, only now, only for you!");
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
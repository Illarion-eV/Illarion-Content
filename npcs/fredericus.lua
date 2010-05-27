-- INSERT INTO npc VALUES (nextval('npc_seq'),0,133,581,0,4,false,'Fredericus','npc_fredericus.lua',0);

require("npcs.base.autonpcfunctions")
module("npcs.fredericus")

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
    npcs.base.autonpcfunctions.AddTraderTrigger("Help","");
    npcs.base.autonpcfunctions.AddConsequence("inform","[Game Help] This NPC is the fisherman Fredericus. Keyphrases: Hello, fisherman.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Hilfe","");
    npcs.base.autonpcfunctions.AddConsequence("inform","[Spielhilfe] Dieser NPC ist der Fischer Fredericus. Schlüsselwörter: Hallo, Fischer.");
    -- General speech
    npcs.base.autonpcfunctions.AddTraderTrigger("Hello","Ahoy! Fresh fish!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greetings");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Be greeted");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hail");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good day");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good morning");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good evening");
    npcs.base.autonpcfunctions.AddAdditionalText("G'day. I just came ashore.");
    npcs.base.autonpcfunctions.AddAdditionalText("Only the best fish, only today, only for you!");
    npcs.base.autonpcfunctions.AddTraderTrigger("Grüße","Ahoi! Frischer Fisch!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Gruß");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Seid gegrüßt");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Guten Tag");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Guten Abend");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Mahlzeit");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Tach");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Moin");
    npcs.base.autonpcfunctions.AddAdditionalText("Tag. Bin gerade von großer Fahrt zurück.");
    npcs.base.autonpcfunctions.AddAdditionalText("Nur der beste Fisch, nur heute, nur für euch!");
    npcs.base.autonpcfunctions.AddTraderTrigger("Hiho","Ahoy! Fresh fish!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddAdditionalText("G'day. I just came ashore.");
    npcs.base.autonpcfunctions.AddAdditionalText("Only the best fish, only today, only for you!");
    npcs.base.autonpcfunctions.AddTraderTrigger("Hiho","Ahoi! Frischer Fisch!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddAdditionalText("Tag. Bin gerade von großer Fahrt zurück.");
    npcs.base.autonpcfunctions.AddAdditionalText("Nur der beste Fisch, nur heute, nur für euch!");
    npcs.base.autonpcfunctions.AddTraderTrigger("Farewell","Good trip.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good bye");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Bye");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Fare thy well");
    npcs.base.autonpcfunctions.AddAdditionalText("Until next time, remember, a fish a day keeps the medico away.");
    npcs.base.autonpcfunctions.AddAdditionalText("Farewell.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Tschüß","Gute Fahrt.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Tschüss");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Wiedersehen");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Gehabt euch wohl");
    npcs.base.autonpcfunctions.AddAdditionalText("Bis zum nächesten Mal, denkt daran, ein Fisch am Tag hält den Medizinmann fern.");
    npcs.base.autonpcfunctions.AddAdditionalText("Auf wiedersehen.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Ciao","Good trip.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddAdditionalText("Until next time, remember, a fish a day keeps the medico away.");
    npcs.base.autonpcfunctions.AddAdditionalText("Farewell.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Ciao","Gute Fahrt.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddAdditionalText("Bis zum nächesten Mal, denkt daran, ein Fisch am Tag hält den Medizinmann fern.");
    npcs.base.autonpcfunctions.AddAdditionalText("Auf wiedersehen.");
    npcs.base.autonpcfunctions.AddTraderTrigger("How are you","I feel good, not a wonder, I had fish today.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("How feel");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("How do you do");
    npcs.base.autonpcfunctions.AddAdditionalText("I'd feel much better if you buy some fish.");
    npcs.base.autonpcfunctions.AddAdditionalText("Fine, thank you.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Wie geht","Mir geht es gut, ist auch kein Wunder, ich habe heute Fisch gegessen.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Wie fühlst");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Wie ist es ergangen");
    npcs.base.autonpcfunctions.AddAdditionalText("Mir würde es weit besser gehen, wenn ihr Fisch kaufen würdet.");
    npcs.base.autonpcfunctions.AddAdditionalText("Gut, danke der Nachfrage.");
    npcs.base.autonpcfunctions.AddTraderTrigger("your name","Fredericus. That's me.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("who are you");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("who art thou");
    npcs.base.autonpcfunctions.AddAdditionalText("I am the fisherman Fredericus.");
    npcs.base.autonpcfunctions.AddAdditionalText("Fredericus is my name, I trade fish.");
    npcs.base.autonpcfunctions.AddTraderTrigger("dein name","Fredericus. Das bin ich.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wer bist du");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wer seid ihr");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wie heißt");
    npcs.base.autonpcfunctions.AddAdditionalText("Ich bin der Fischer Fredericus.");
    npcs.base.autonpcfunctions.AddAdditionalText("Fredericus ist mein Name, ich handel mit Fischen.");
    -- Catching typical NPC phrases
    npcs.base.autonpcfunctions.AddTraderTrigger("what sell","Fish, fish, fish. I trade fish. And also herbs, if you need any to spice up your dishes.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("what buy");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("list wares");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("price of");
    npcs.base.autonpcfunctions.AddAdditionalText("I trade fish, do you need any?");
    npcs.base.autonpcfunctions.AddAdditionalText("I trade what you need to catch fish and I even buy the fish you caught.");
    npcs.base.autonpcfunctions.AddTraderTrigger("was verkauf","Fisch, Fisch und nochmal Fisch. Ich handele mit Fischen und auch Kräutern, wenn ihr eure Gerichte würzen wollt.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("was kauf");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("warenliste");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("preis von");
    npcs.base.autonpcfunctions.AddAdditionalText("Ich handel Fische, braucht ihr welche?");
    npcs.base.autonpcfunctions.AddAdditionalText("Ich verkaufe alles, was man zum Fischen braucht und kaufe sogar euren Fang.");
    npcs.base.autonpcfunctions.AddTraderTrigger("tell something","I swear I saw a sea serpent!");
    npcs.base.autonpcfunctions.AddAdditionalText("If an evil spirit haunts a ship, all is lost.");
    npcs.base.autonpcfunctions.AddTraderTrigger("erzähl was","Ich schwöre, ich habe ein Seeungeheuer gesehen!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("erzähl etwas");
    npcs.base.autonpcfunctions.AddAdditionalText("Wenn ein böser Geist auf einem Schiff sein Unwesen treibt, dann ist es meist bald verloren.");
    -- Small talk: The talk here should focus on possible questions. Feel free to add more!
    npcs.base.autonpcfunctions.AddTraderTrigger("profession","I'm a fisherman. A hard job, but a honest and honourable job.");
    npcs.base.autonpcfunctions.AddTraderTrigger("beruf","Ich bin ein Fischer. Das ist ein hartes Geschäft, aber es ist ehrlich und ehrbar.");
    npcs.base.autonpcfunctions.AddTraderTrigger("job","Ich bin ein Fischer. Das ist ein hartes Geschäft, aber es ist ehrlich und ehrbar.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("job","I'm a fisherman. A hard job, but a honest and honourable job.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Fischer","Ich bin ein Fischer. Das ist ein hartes Geschäft, aber es ist ehrlich und ehrbar.");
    npcs.base.autonpcfunctions.AddTraderTrigger("fisherman","I'm a fisherman. A hard job, but a honest and honourable job.");
    npcs.base.autonpcfunctions.AddTraderTrigger("trader","Here, at the marketplace, there are many traders. You can buy many goods here in Cadomyr.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("merchant");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("collegue");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("vendor");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("market");
    npcs.base.autonpcfunctions.AddTraderTrigger("händler","Hier auf dem Marktplatz gibt es einige Händler. Man kann viele Waren hier in Cadomyr kaufen.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("kollege");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("höker");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("markt");
    npcs.base.autonpcfunctions.AddTraderTrigger("Gobaith","I once sailed to Gobaith, the natives tossed onions at each other!");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Gobaith","Ich bin einmal nach Gobaith gesegelt, die Eingeborenen dort haben mit Zwiebeln aufeinander geworfen!");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    -- More small talk; add at least five triggers
    npcs.base.autonpcfunctions.AddTraderTrigger("Zerarisa","Ich meine, Zerarisa ist eine der Echsen, die am Kap des Abschiedes wohnen.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("Zerarisa","I think Zerarisa is one of the lizards, living at Cape Farewell.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Cape","Cape Farewell is to the south and west, land's end, one could say.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Farewell");
    npcs.base.autonpcfunctions.AddTraderTrigger("Kap","Das Kap des Abschiedes ist im Südwesten, am Ende der Welt könnte man sagen.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Abschied");
    npcs.base.autonpcfunctions.AddTraderTrigger("boat","No, I will not lend you my boat. Take a fishing rod and go to the shore.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("ship");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("vessle");
    npcs.base.autonpcfunctions.AddTraderTrigger("Boot","Ich kann euch mein Boot nicht leihen. Nehmt eine Angelrute und geht zur Küste.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Schiff");
    -- Faction stuff
    npcs.base.autonpcfunctions.AddTraderTrigger("Elvaine","#me snorts angrily.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Morgan");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("archmage");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Erzmagier");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddAdditionalText("Better avoid Runewick's leader. Whatever you say, it is wrong. Whatever you do, it is wrong.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Elvaine","#me schnaubt wütend.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Morgan");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("archmage");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Erzmagier");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddAdditionalText("Vermeidet den Herren von Runewick. Was immer ihr sagt, es ist falsch. Was immer ihr tut, es ist falsch.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Runewick","If I were you, I'd never go to Runewick. They might be nice, but also, false and not honest.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Runewick","Wenn ich an eurer Stelle wäre, würde ich nie nach Runewick gehen. Sie mögen nett dort sein, aber auch unehrlich und falsch. ");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("Valerio","I'd like to toss some smelly fish at the Don. I will never understand how such a... villain can become leader of a community.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Guilianni");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Don");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Valerio","Ich würd' gerne mal ein paar stinkige Fische auf den Don werfen. Ich werde nie verstehen, wie so ein... Rabauke der Anführer einer Gemeinschaft werden konnte.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Guilianni");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Don");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("Galmair","Galmair is not a safe place. The Don does not want it to be, so he can demand money for protection.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Galmair","Galmair ist kein sicherer Ort. Aber der Don will es nicht anders, denn nur so kann er Schutzgeld erpressen.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("rosaline","Queen Rosaline, well, she is the best thing that could happen to Cadomyr. I say that and I mean it, the best woman is better than the worst man.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("königin");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("queen");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("edwards");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("rosaline","Königin Rosaline ist das beste, was Cadomyr geschehen konnte. Ich sage es, weil ich es meine; die beste Frau ist immernoch besser als der schlechteste Mann.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("königin");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("queen");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("edwards");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("Cadomyr","Cadomyr is my home, where I return to after setting sails.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddAdditionalText("I love Cadomyr as I love the sea.");
    npcs.base.autonpcfunctions.AddAdditionalText("Cadomyr's best, forget the rest!");
    npcs.base.autonpcfunctions.AddTraderTrigger("Cadomyr","Cadomyr ist meine Heimat, in die ich mit vollen Segeln zurückkehre.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddAdditionalText("Ich liebe Cadomyr wie das weite, offene Meer.");
    npcs.base.autonpcfunctions.AddAdditionalText("Cadomyr kriegt das beste, für die anderen bleiben nur Reste.");
    -- Main land factions
    npcs.base.autonpcfunctions.AddTraderTrigger("albar","Oh, Albar, how much I desire to sail there. A land of justice and honour");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("albar","Oh, Albar, wie sehr wünschte ich, ich könnte dorthin segeln. Ein Land der Gerechtigkeit und der Ehre.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("gynk","What did you say?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("gync");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddAdditionalText("I did not understand you.");
    npcs.base.autonpcfunctions.AddAdditionalText("Pardon me?");
    npcs.base.autonpcfunctions.AddAdditionalText("Shh, do not talk about this too loud.");
    npcs.base.autonpcfunctions.AddTraderTrigger("gync","Was habt ihr gesagt?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("gynk");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddAdditionalText("Ich habe euch nicht verstanden.");
    npcs.base.autonpcfunctions.AddAdditionalText("Entschuldigung?");
    npcs.base.autonpcfunctions.AddAdditionalText("Psst, sprecht darüber nicht so laut.");
    npcs.base.autonpcfunctions.AddTraderTrigger("salkama","Arrogant wisenheimers they are. And a hard working fisherman does not matter to the oh-so-noble people there.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("salkama","Arrogante Besserwisser sind das. Und ein hart arbeitender Fischer zählt nichts für die ach-so-noblen Leute dort.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    -- Gods; each NPC should at react on at least one god, being a follower of said god
    npcs.base.autonpcfunctions.AddTraderTrigger("Tanora","Tanora guides my boat, Tanora protects my boat, Tanora causes the waves that crash my boat.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Zelphia");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddAdditionalText("Hail the goddess!");
    npcs.base.autonpcfunctions.AddAdditionalText("I obey Tanora, but if you want to meet perons who adore her, go to Cape Farewell.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Tanora","Tanora lenkt mein Boot, Tanora schützt mein Boot, Tanora schickt die Wellen, die mein Boot zermalmen.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Zelphia");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddAdditionalText("Huldigt Tanora!");
    npcs.base.autonpcfunctions.AddAdditionalText("Ich gehorche Tanora, aber wenn ihr Leute treffen wollt, die sie verehren, geht zum Kap des Abschiedes.");
    -- Catching quest triggers
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","I do not issue any quests. But you can bring me fish and I'll pay you for your work.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Ich verteile keine Aufgaben. Aber ihr könnt mir Fisch bringen und ich bezahle eure Arbeit.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("task","I do not issue any quests. But you can bring me fish and I'll pay you for your work.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npcs.base.autonpcfunctions.AddTraderTrigger("Auftrag","Ich verteile keine Aufgaben. Aber ihr könnt mir Fisch bringen und ich bezahle eure Arbeit.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Aufgabe");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    -- Easter Egg
    npcs.base.autonpcfunctions.AddTraderTrigger("fischers fritze","Fischt frische Fische!");
    -- Last catch: Think about keyphrases the player might say and that are not caught until here
    npcs.base.autonpcfunctions.AddTraderTrigger("Yes","Aye, aye, and a flounder in addition.");
    npcs.base.autonpcfunctions.AddAdditionalText("Well, maybe a herring?");
    npcs.base.autonpcfunctions.AddAdditionalText("That's good.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Ja","Aye, aye, und eine Flunder dazu.");
    npcs.base.autonpcfunctions.AddAdditionalText("Vielleicht einen Hering?");
    npcs.base.autonpcfunctions.AddAdditionalText("Das ist gut auch so.");
    npcs.base.autonpcfunctions.AddTraderTrigger("No","Do you prefer salmon perhaps?");
    npcs.base.autonpcfunctions.AddAdditionalText("Will bloaters make you content?");
    npcs.base.autonpcfunctions.AddTraderTrigger("Nein","Mögt ihr lieber Lachs?");
    npcs.base.autonpcfunctions.AddAdditionalText("Würde euch ein Bückling zufriedenstellen?");
    npcs.base.autonpcfunctions.AddTraderTrigger("stinkt","Das stimmt nicht.");
    npcs.base.autonpcfunctions.AddAdditionalText("Mein Fisch ist lecker!");
    npcs.base.autonpcfunctions.AddTraderTrigger("stinks","It does not!");
    npcs.base.autonpcfunctions.AddAdditionalText("My fish is tasty!");
    -- Cycletext: Please add at least(!) five cycletext messages. The more, the better. You can use emotes (#me is green), too.
    npcs.base.autonpcfunctions.AddCycleText("Mein Fisch stinkt nicht!","My fish does not stink!");
    npcs.base.autonpcfunctions.AddCycleText("Frischer Fisch!","Fresh Fish!");
    npcs.base.autonpcfunctions.AddCycleText("Fisch, Kräuter, alles, was ihr braucht für das Festmahl!","Fish, herbs, all you need for dinner!");
    npcs.base.autonpcfunctions.AddCycleText("#me riecht an den Fischen in seiner Auslage und verzieht das Gesicht.","#me sniffes on the fish on his cart and wrinkles his nose.");
    npcs.base.autonpcfunctions.AddCycleText("Fangfrischer Lachs!","Fresh salmon!");
    npcs.base.autonpcfunctions.AddCycleText("Komm, kauf jetzt und pack dir noch einen Aal drauf!","C'mon, buy now and you get an eel for free!");
    npcs.base.autonpcfunctions.AddCycleText("Kauft noch einen Bückling, der schmeckt zwar nicht, hält aber die Ratten fern.","Buy this bloater, it is not tasty, but it keeps the rats at bay.");
    npcs.base.autonpcfunctions.AddCycleText("Beste Forellen!","Best trouts!");
    npcs.base.autonpcfunctions.AddCycleText("Leckere Heringe!","Tasty herrings!");
    npcs.base.autonpcfunctions.AddCycleText("Ein Pfund Makrelen, nur jetzt, nur für euch!","A pound mackerels, only now, only for you!");
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
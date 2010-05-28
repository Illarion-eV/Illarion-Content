-- INSERT INTO npc VALUES (nextval('npc_seq'),0,133,581,0,4,false,'Fredericus','npc_fredericus.lua',0);

require("npc.base.autonpcfunctions")
module("npc.fredericus")

function useNPC(user,counter,param)
    thisNPC:increaseSkill(1,"common language",100);
    thisNPC:talkLanguage(CCharacter.say, CPlayer.german, "Finger weg!");
    thisNPC:talkLanguage(CCharacter.say, CPlayer.english, "Don't you touch me!");
end

function initializeNpc()
    if TraderFirst then
        return true;
    end

    npc.base.autonpcfunctions.InitTalkLists();

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
    npc.base.autonpcfunctions.AddTraderTrigger("Help","");
    npc.base.autonpcfunctions.AddConsequence("inform","[Game Help] This NPC is the fisherman Fredericus. Keyphrases: Hello, fisherman.");
    npc.base.autonpcfunctions.AddTraderTrigger("Hilfe","");
    npc.base.autonpcfunctions.AddConsequence("inform","[Spielhilfe] Dieser NPC ist der Fischer Fredericus. Schlüsselwörter: Hallo, Fischer.");
    -- General speech
    npc.base.autonpcfunctions.AddTraderTrigger("Hello","Ahoy! Fresh fish!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greetings");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Be greeted");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hail");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good day");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good morning");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good evening");
    npc.base.autonpcfunctions.AddAdditionalText("G'day. I just came ashore.");
    npc.base.autonpcfunctions.AddAdditionalText("Only the best fish, only today, only for you!");
    npc.base.autonpcfunctions.AddTraderTrigger("Grüße","Ahoi! Frischer Fisch!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Gruß");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Seid gegrüßt");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Guten Tag");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Guten Abend");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Mahlzeit");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Tach");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Moin");
    npc.base.autonpcfunctions.AddAdditionalText("Tag. Bin gerade von großer Fahrt zurück.");
    npc.base.autonpcfunctions.AddAdditionalText("Nur der beste Fisch, nur heute, nur für euch!");
    npc.base.autonpcfunctions.AddTraderTrigger("Hiho","Ahoy! Fresh fish!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("G'day. I just came ashore.");
    npc.base.autonpcfunctions.AddAdditionalText("Only the best fish, only today, only for you!");
    npc.base.autonpcfunctions.AddTraderTrigger("Hiho","Ahoi! Frischer Fisch!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddAdditionalText("Tag. Bin gerade von großer Fahrt zurück.");
    npc.base.autonpcfunctions.AddAdditionalText("Nur der beste Fisch, nur heute, nur für euch!");
    npc.base.autonpcfunctions.AddTraderTrigger("Farewell","Good trip.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good bye");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Bye");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Fare thy well");
    npc.base.autonpcfunctions.AddAdditionalText("Until next time, remember, a fish a day keeps the medico away.");
    npc.base.autonpcfunctions.AddAdditionalText("Farewell.");
    npc.base.autonpcfunctions.AddTraderTrigger("Tschüß","Gute Fahrt.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Tschüss");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Wiedersehen");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Gehabt euch wohl");
    npc.base.autonpcfunctions.AddAdditionalText("Bis zum nächesten Mal, denkt daran, ein Fisch am Tag hält den Medizinmann fern.");
    npc.base.autonpcfunctions.AddAdditionalText("Auf wiedersehen.");
    npc.base.autonpcfunctions.AddTraderTrigger("Ciao","Good trip.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("Until next time, remember, a fish a day keeps the medico away.");
    npc.base.autonpcfunctions.AddAdditionalText("Farewell.");
    npc.base.autonpcfunctions.AddTraderTrigger("Ciao","Gute Fahrt.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddAdditionalText("Bis zum nächesten Mal, denkt daran, ein Fisch am Tag hält den Medizinmann fern.");
    npc.base.autonpcfunctions.AddAdditionalText("Auf wiedersehen.");
    npc.base.autonpcfunctions.AddTraderTrigger("How are you","I feel good, not a wonder, I had fish today.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("How feel");
    npc.base.autonpcfunctions.AddAdditionalTrigger("How do you do");
    npc.base.autonpcfunctions.AddAdditionalText("I'd feel much better if you buy some fish.");
    npc.base.autonpcfunctions.AddAdditionalText("Fine, thank you.");
    npc.base.autonpcfunctions.AddTraderTrigger("Wie geht","Mir geht es gut, ist auch kein Wunder, ich habe heute Fisch gegessen.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Wie fühlst");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Wie ist es ergangen");
    npc.base.autonpcfunctions.AddAdditionalText("Mir würde es weit besser gehen, wenn ihr Fisch kaufen würdet.");
    npc.base.autonpcfunctions.AddAdditionalText("Gut, danke der Nachfrage.");
    npc.base.autonpcfunctions.AddTraderTrigger("your name","Fredericus. That's me.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("who are you");
    npc.base.autonpcfunctions.AddAdditionalTrigger("who art thou");
    npc.base.autonpcfunctions.AddAdditionalText("I am the fisherman Fredericus.");
    npc.base.autonpcfunctions.AddAdditionalText("Fredericus is my name, I trade fish.");
    npc.base.autonpcfunctions.AddTraderTrigger("dein name","Fredericus. Das bin ich.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("wer bist du");
    npc.base.autonpcfunctions.AddAdditionalTrigger("wer seid ihr");
    npc.base.autonpcfunctions.AddAdditionalTrigger("wie heißt");
    npc.base.autonpcfunctions.AddAdditionalText("Ich bin der Fischer Fredericus.");
    npc.base.autonpcfunctions.AddAdditionalText("Fredericus ist mein Name, ich handel mit Fischen.");
    -- Catching typical NPC phrases
    npc.base.autonpcfunctions.AddTraderTrigger("what sell","Fish, fish, fish. I trade fish. And also herbs, if you need any to spice up your dishes.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("what buy");
    npc.base.autonpcfunctions.AddAdditionalTrigger("list wares");
    npc.base.autonpcfunctions.AddAdditionalTrigger("price of");
    npc.base.autonpcfunctions.AddAdditionalText("I trade fish, do you need any?");
    npc.base.autonpcfunctions.AddAdditionalText("I trade what you need to catch fish and I even buy the fish you caught.");
    npc.base.autonpcfunctions.AddTraderTrigger("was verkauf","Fisch, Fisch und nochmal Fisch. Ich handele mit Fischen und auch Kräutern, wenn ihr eure Gerichte würzen wollt.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("was kauf");
    npc.base.autonpcfunctions.AddAdditionalTrigger("warenliste");
    npc.base.autonpcfunctions.AddAdditionalTrigger("preis von");
    npc.base.autonpcfunctions.AddAdditionalText("Ich handel Fische, braucht ihr welche?");
    npc.base.autonpcfunctions.AddAdditionalText("Ich verkaufe alles, was man zum Fischen braucht und kaufe sogar euren Fang.");
    npc.base.autonpcfunctions.AddTraderTrigger("tell something","I swear I saw a sea serpent!");
    npc.base.autonpcfunctions.AddAdditionalText("If an evil spirit haunts a ship, all is lost.");
    npc.base.autonpcfunctions.AddTraderTrigger("erzähl was","Ich schwöre, ich habe ein Seeungeheuer gesehen!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("erzähl etwas");
    npc.base.autonpcfunctions.AddAdditionalText("Wenn ein böser Geist auf einem Schiff sein Unwesen treibt, dann ist es meist bald verloren.");
    -- Small talk: The talk here should focus on possible questions. Feel free to add more!
    npc.base.autonpcfunctions.AddTraderTrigger("profession","I'm a fisherman. A hard job, but a honest and honourable job.");
    npc.base.autonpcfunctions.AddTraderTrigger("beruf","Ich bin ein Fischer. Das ist ein hartes Geschäft, aber es ist ehrlich und ehrbar.");
    npc.base.autonpcfunctions.AddTraderTrigger("job","Ich bin ein Fischer. Das ist ein hartes Geschäft, aber es ist ehrlich und ehrbar.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("job","I'm a fisherman. A hard job, but a honest and honourable job.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Fischer","Ich bin ein Fischer. Das ist ein hartes Geschäft, aber es ist ehrlich und ehrbar.");
    npc.base.autonpcfunctions.AddTraderTrigger("fisherman","I'm a fisherman. A hard job, but a honest and honourable job.");
    npc.base.autonpcfunctions.AddTraderTrigger("trader","Here, at the marketplace, there are many traders. You can buy many goods here in Cadomyr.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("merchant");
    npc.base.autonpcfunctions.AddAdditionalTrigger("collegue");
    npc.base.autonpcfunctions.AddAdditionalTrigger("vendor");
    npc.base.autonpcfunctions.AddAdditionalTrigger("market");
    npc.base.autonpcfunctions.AddTraderTrigger("händler","Hier auf dem Marktplatz gibt es einige Händler. Man kann viele Waren hier in Cadomyr kaufen.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("kollege");
    npc.base.autonpcfunctions.AddAdditionalTrigger("höker");
    npc.base.autonpcfunctions.AddAdditionalTrigger("markt");
    npc.base.autonpcfunctions.AddTraderTrigger("Gobaith","I once sailed to Gobaith, the natives tossed onions at each other!");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Gobaith","Ich bin einmal nach Gobaith gesegelt, die Eingeborenen dort haben mit Zwiebeln aufeinander geworfen!");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    -- More small talk; add at least five triggers
    npc.base.autonpcfunctions.AddTraderTrigger("Zerarisa","Ich meine, Zerarisa ist eine der Echsen, die am Kap des Abschiedes wohnen.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("Zerarisa","I think Zerarisa is one of the lizards, living at Cape Farewell.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Cape","Cape Farewell is to the south and west, land's end, one could say.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Farewell");
    npc.base.autonpcfunctions.AddTraderTrigger("Kap","Das Kap des Abschiedes ist im Südwesten, am Ende der Welt könnte man sagen.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Abschied");
    npc.base.autonpcfunctions.AddTraderTrigger("boat","No, I will not lend you my boat. Take a fishing rod and go to the shore.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("ship");
    npc.base.autonpcfunctions.AddAdditionalTrigger("vessle");
    npc.base.autonpcfunctions.AddTraderTrigger("Boot","Ich kann euch mein Boot nicht leihen. Nehmt eine Angelrute und geht zur Küste.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Schiff");
    -- Faction stuff
    npc.base.autonpcfunctions.AddTraderTrigger("Elvaine","#me snorts angrily.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Morgan");
    npc.base.autonpcfunctions.AddAdditionalTrigger("archmage");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Erzmagier");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("Better avoid Runewick's leader. Whatever you say, it is wrong. Whatever you do, it is wrong.");
    npc.base.autonpcfunctions.AddTraderTrigger("Elvaine","#me schnaubt wütend.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Morgan");
    npc.base.autonpcfunctions.AddAdditionalTrigger("archmage");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Erzmagier");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddAdditionalText("Vermeidet den Herren von Runewick. Was immer ihr sagt, es ist falsch. Was immer ihr tut, es ist falsch.");
    npc.base.autonpcfunctions.AddTraderTrigger("Runewick","If I were you, I'd never go to Runewick. They might be nice, but also, false and not honest.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Runewick","Wenn ich an eurer Stelle wäre, würde ich nie nach Runewick gehen. Sie mögen nett dort sein, aber auch unehrlich und falsch. ");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("Valerio","I'd like to toss some smelly fish at the Don. I will never understand how such a... villain can become leader of a community.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Guilianni");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Don");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Valerio","Ich würd' gerne mal ein paar stinkige Fische auf den Don werfen. Ich werde nie verstehen, wie so ein... Rabauke der Anführer einer Gemeinschaft werden konnte.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Guilianni");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Don");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("Galmair","Galmair is not a safe place. The Don does not want it to be, so he can demand money for protection.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Galmair","Galmair ist kein sicherer Ort. Aber der Don will es nicht anders, denn nur so kann er Schutzgeld erpressen.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("rosaline","Queen Rosaline, well, she is the best thing that could happen to Cadomyr. I say that and I mean it, the best woman is better than the worst man.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("königin");
    npc.base.autonpcfunctions.AddAdditionalTrigger("queen");
    npc.base.autonpcfunctions.AddAdditionalTrigger("edwards");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("rosaline","Königin Rosaline ist das beste, was Cadomyr geschehen konnte. Ich sage es, weil ich es meine; die beste Frau ist immernoch besser als der schlechteste Mann.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("königin");
    npc.base.autonpcfunctions.AddAdditionalTrigger("queen");
    npc.base.autonpcfunctions.AddAdditionalTrigger("edwards");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("Cadomyr","Cadomyr is my home, where I return to after setting sails.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("I love Cadomyr as I love the sea.");
    npc.base.autonpcfunctions.AddAdditionalText("Cadomyr's best, forget the rest!");
    npc.base.autonpcfunctions.AddTraderTrigger("Cadomyr","Cadomyr ist meine Heimat, in die ich mit vollen Segeln zurückkehre.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddAdditionalText("Ich liebe Cadomyr wie das weite, offene Meer.");
    npc.base.autonpcfunctions.AddAdditionalText("Cadomyr kriegt das beste, für die anderen bleiben nur Reste.");
    -- Main land factions
    npc.base.autonpcfunctions.AddTraderTrigger("albar","Oh, Albar, how much I desire to sail there. A land of justice and honour");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("albar","Oh, Albar, wie sehr wünschte ich, ich könnte dorthin segeln. Ein Land der Gerechtigkeit und der Ehre.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("gynk","What did you say?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("gync");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("I did not understand you.");
    npc.base.autonpcfunctions.AddAdditionalText("Pardon me?");
    npc.base.autonpcfunctions.AddAdditionalText("Shh, do not talk about this too loud.");
    npc.base.autonpcfunctions.AddTraderTrigger("gync","Was habt ihr gesagt?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("gynk");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddAdditionalText("Ich habe euch nicht verstanden.");
    npc.base.autonpcfunctions.AddAdditionalText("Entschuldigung?");
    npc.base.autonpcfunctions.AddAdditionalText("Psst, sprecht darüber nicht so laut.");
    npc.base.autonpcfunctions.AddTraderTrigger("salkama","Arrogant wisenheimers they are. And a hard working fisherman does not matter to the oh-so-noble people there.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("salkama","Arrogante Besserwisser sind das. Und ein hart arbeitender Fischer zählt nichts für die ach-so-noblen Leute dort.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    -- Gods; each NPC should at react on at least one god, being a follower of said god
    npc.base.autonpcfunctions.AddTraderTrigger("Tanora","Tanora guides my boat, Tanora protects my boat, Tanora causes the waves that crash my boat.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Zelphia");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("Hail the goddess!");
    npc.base.autonpcfunctions.AddAdditionalText("I obey Tanora, but if you want to meet perons who adore her, go to Cape Farewell.");
    npc.base.autonpcfunctions.AddTraderTrigger("Tanora","Tanora lenkt mein Boot, Tanora schützt mein Boot, Tanora schickt die Wellen, die mein Boot zermalmen.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Zelphia");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddAdditionalText("Huldigt Tanora!");
    npc.base.autonpcfunctions.AddAdditionalText("Ich gehorche Tanora, aber wenn ihr Leute treffen wollt, die sie verehren, geht zum Kap des Abschiedes.");
    -- Catching quest triggers
    npc.base.autonpcfunctions.AddTraderTrigger("quest","I do not issue any quests. But you can bring me fish and I'll pay you for your work.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("quest","Ich verteile keine Aufgaben. Aber ihr könnt mir Fisch bringen und ich bezahle eure Arbeit.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("task","I do not issue any quests. But you can bring me fish and I'll pay you for your work.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npc.base.autonpcfunctions.AddTraderTrigger("Auftrag","Ich verteile keine Aufgaben. Aber ihr könnt mir Fisch bringen und ich bezahle eure Arbeit.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Aufgabe");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    -- Easter Egg
    npc.base.autonpcfunctions.AddTraderTrigger("fischers fritze","Fischt frische Fische!");
    -- Last catch: Think about keyphrases the player might say and that are not caught until here
    npc.base.autonpcfunctions.AddTraderTrigger("Yes","Aye, aye, and a flounder in addition.");
    npc.base.autonpcfunctions.AddAdditionalText("Well, maybe a herring?");
    npc.base.autonpcfunctions.AddAdditionalText("That's good.");
    npc.base.autonpcfunctions.AddTraderTrigger("Ja","Aye, aye, und eine Flunder dazu.");
    npc.base.autonpcfunctions.AddAdditionalText("Vielleicht einen Hering?");
    npc.base.autonpcfunctions.AddAdditionalText("Das ist gut auch so.");
    npc.base.autonpcfunctions.AddTraderTrigger("No","Do you prefer salmon perhaps?");
    npc.base.autonpcfunctions.AddAdditionalText("Will bloaters make you content?");
    npc.base.autonpcfunctions.AddTraderTrigger("Nein","Mögt ihr lieber Lachs?");
    npc.base.autonpcfunctions.AddAdditionalText("Würde euch ein Bückling zufriedenstellen?");
    npc.base.autonpcfunctions.AddTraderTrigger("stinkt","Das stimmt nicht.");
    npc.base.autonpcfunctions.AddAdditionalText("Mein Fisch ist lecker!");
    npc.base.autonpcfunctions.AddTraderTrigger("stinks","It does not!");
    npc.base.autonpcfunctions.AddAdditionalText("My fish is tasty!");
    -- Cycletext: Please add at least(!) five cycletext messages. The more, the better. You can use emotes (#me is green), too.
    npc.base.autonpcfunctions.AddCycleText("Mein Fisch stinkt nicht!","My fish does not stink!");
    npc.base.autonpcfunctions.AddCycleText("Frischer Fisch!","Fresh Fish!");
    npc.base.autonpcfunctions.AddCycleText("Fisch, Kräuter, alles, was ihr braucht für das Festmahl!","Fish, herbs, all you need for dinner!");
    npc.base.autonpcfunctions.AddCycleText("#me riecht an den Fischen in seiner Auslage und verzieht das Gesicht.","#me sniffes on the fish on his cart and wrinkles his nose.");
    npc.base.autonpcfunctions.AddCycleText("Fangfrischer Lachs!","Fresh salmon!");
    npc.base.autonpcfunctions.AddCycleText("Komm, kauf jetzt und pack dir noch einen Aal drauf!","C'mon, buy now and you get an eel for free!");
    npc.base.autonpcfunctions.AddCycleText("Kauft noch einen Bückling, der schmeckt zwar nicht, hält aber die Ratten fern.","Buy this bloater, it is not tasty, but it keeps the rats at bay.");
    npc.base.autonpcfunctions.AddCycleText("Beste Forellen!","Best trouts!");
    npc.base.autonpcfunctions.AddCycleText("Leckere Heringe!","Tasty herrings!");
    npc.base.autonpcfunctions.AddCycleText("Ein Pfund Makrelen, nur jetzt, nur für euch!","A pound mackerels, only now, only for you!");
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
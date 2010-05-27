-- INSERT INTO npc VALUES (nextval('npc_seq'),0,112,596,0,0,false,'Thomas Dalenus','npc_thomas_dalenus.lua',0);

require("npcs.base.autonpcfunctions")
module("npcs.thomas_dalenus")

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
    -- 5% Tools (Tailor/Tanner/Dyer): 6, 47, 51, 58, 2659, 2746, 2781
    -- 5% Trousers: 34, 183, 459, 460, 461, 821, 822, 823, 824, 825, 826, 827
    -- 5% Tunics: 814, 815, 816, 817, 818, 819, 820
    -- 5% Cloth gloves: 384, 2295
    -- 5% Clothes: 54, 174, 175, 176, 177, 178, 179
    -- 5% Doublets: 807, 808, 809, 810, 811, 812, 813
    -- 5% Dresses: 385, 800, 801, 802, 803, 804, 805, 806, 833, 834, 835, 836, 837, 838, 845, 846, 847, 848, 849, 850, 851, 852
    -- 5% Dye: 2678, 2679, 2680, 2681, 2682, 2683
    -- 5% Robes: 55, 193, 194, 195, 196, 368, 547, 548, 558, 2377, 2378, 2380, 2384, 2416, 2418, 2419, 2420, 2421
    -- 5% Skirts: 839, 840, 841, 842, 843
    -- 5% Shirts: 180, 181, 182, 457, 458
    -- 5% Tailor's resources: 50, 63, 168, 170,
    -- 5% Leather goods: 48, 53, 89, 97, 356, 362, 363, 364, 365, 366, 367, 369, 526, 527, 697, 698, 2113, 2114
    -- 5% Hats: 357, 358, 370, 371, 828, 829, 830, 831, 832
    -- Help 
    npcs.base.autonpcfunctions.AddTraderTrigger("Help","");
    npcs.base.autonpcfunctions.AddConsequence("inform","[Game Help] This NPC is the tailor Thomas Dalenus. Keyphrases: Hello, tailor.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Hilfe","");
    npcs.base.autonpcfunctions.AddConsequence("inform","[Spielhilfe] Dieser NPC ist der Schneider Thomas Dalenus. Schlüsselwörter: Hallo, Schneider.");
    -- General speech
    npcs.base.autonpcfunctions.AddTraderTrigger("Hello","Good day.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greetings");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Be greeted");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hail");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good day");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good morning");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good evening");
    npcs.base.autonpcfunctions.AddAdditionalText("Greetings.");
    npcs.base.autonpcfunctions.AddAdditionalText("Hello");
    npcs.base.autonpcfunctions.AddTraderTrigger("Grüße","Guten Tag.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Gruß");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Seid gegrüßt");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Guten Tag");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Guten Abend");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Mahlzeit");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Tach");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Moin");
    npcs.base.autonpcfunctions.AddAdditionalText("Seid gegrüßt.");
    npcs.base.autonpcfunctions.AddAdditionalText("Hallo.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Hiho","Good day.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddAdditionalText("Greetings.");
    npcs.base.autonpcfunctions.AddAdditionalText("Hello");
    npcs.base.autonpcfunctions.AddTraderTrigger("Hiho","Guten Tag.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddAdditionalText("Seid gegrüßt.");
    npcs.base.autonpcfunctions.AddAdditionalText("Hallo.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Farewell","Farewell, go with the gods.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good bye");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Bye");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Fare thy well");
    npcs.base.autonpcfunctions.AddAdditionalText("Good bye, my customer.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Tschüß","Gehabt euch wohl, geht mit den Göttern.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Tschüss");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Wiedersehen");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Gehabt euch wohl");
    npcs.base.autonpcfunctions.AddAdditionalText("Auf wiedersehen, mein Kunde.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Ciao","Farewell, go with the gods.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddAdditionalText("Good bye, my customer.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Ciao","Gehabt euch wohl, geht mit den Göttern.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddAdditionalText("Auf wiedersehen, mein Kunde.");
    npcs.base.autonpcfunctions.AddTraderTrigger("How are you","I just finished this robe. Maybe you want to take a look at it?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("How feel");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("How do you do");
    npcs.base.autonpcfunctions.AddTraderTrigger("Wie geht","Ich habe gerade diese Robe fertiggestellt. Wollt ihr sie euch ansehen?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Wie fühlst");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Wie ist es ergangen");
    npcs.base.autonpcfunctions.AddTraderTrigger("your name","My name is Thomas, Thomas Dalenus. I'm a tailor.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("who are you");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("who art thou");
    npcs.base.autonpcfunctions.AddAdditionalText("Dalenus' tailored goods - that is my business.");
    npcs.base.autonpcfunctions.AddAdditionalText("Thomas Dalenus. And do not call me Tom or I'll sting my needle into your eye.");
    npcs.base.autonpcfunctions.AddTraderTrigger("dein name","Mein Name ist Thomas, Thomas Dalenus. Ich bin ein Schneider.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wer bist du");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wer seid ihr");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wie heißt");
    npcs.base.autonpcfunctions.AddAdditionalText("Dalenus Schneiderwaren - das ist mein Geschäft.");
    npcs.base.autonpcfunctions.AddAdditionalText("Thomas Dalenus. Und nennt mich nicht Tom, sonst stech ich euch die Augen mit meiner Nadel aus.");
    -- Catching typical NPC phrases 
    npcs.base.autonpcfunctions.AddTraderTrigger("what sell","Robes, dresses, capes, shirts, trousers... what do you need, I have everything.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("what buy");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("list wares");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("price of");
    npcs.base.autonpcfunctions.AddTraderTrigger("was verkauf","Roben, Kleider, Umhänge, Hemden, Hosen,... was braucht ihr, ich habe alles.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("was kauf");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("warenliste");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("preis von");
    npcs.base.autonpcfunctions.AddTraderTrigger("tell something","Never trade with Galmair. Just saying.");
    npcs.base.autonpcfunctions.AddTraderTrigger("erzähl was","Handelt niemals mit Galmair, sage ich.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("erzähl etwas");
    -- Small talk: The talk here should focus on possible questions. Feel free to add more!
    npcs.base.autonpcfunctions.AddTraderTrigger("profession","I'm a tailor, I even made a dress for the queen once.");
    npcs.base.autonpcfunctions.AddTraderTrigger("beruf","Ich bin Schneider, einst habe ich sogar ein Kleid für die Königin geschneidert.");
    npcs.base.autonpcfunctions.AddTraderTrigger("job","Ich bin Schneider, einst habe ich sogar ein Kleid für die Königin geschneidert.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("job","I'm a tailor, I even made a dress for the queen once.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("tailor","When I made the dress of queen Rosaline, I worked all day and night. It was such a honour! Is there anything I can tailor for you?");
    npcs.base.autonpcfunctions.AddTraderTrigger("Schneider","Als ich das Kleid der Königin Rosaline gefertigt habe, hab ich den ganzen Tag und die ganze Nacht gearbeitet. Es war so eine Ehre! Gibt es etwas, was ich für dich schneidern kann?");
    npcs.base.autonpcfunctions.AddTraderTrigger("trader","The amount of goods, traded on this marketplace, is magnificient. We're not a people of traders, but everyone needs something sometimes.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("merchant");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("collegue");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("vendor");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("market");
    npcs.base.autonpcfunctions.AddTraderTrigger("händler","Die Menge an Waren, die auf diesem Markt gehandelt werden, sind schon beeindruckend. Wir sind zwar kein Volk von Händlern, aber jeder braucht mal etwas.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("kollege");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("höker");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("markt");
    -- More small talk; add at least five triggers
    npcs.base.autonpcfunctions.AddTraderTrigger("dye","To dye clothes is tricky. You need various ingredients like herbs. Better buy dyed clothes from me instead of wasting your time.");
    npcs.base.autonpcfunctions.AddTraderTrigger("färbe","Stoffe zu Färben ist aufwändig. Man braucht eine Reihe von Wirkstoffen, so wie Kräuter. Kauft besser gefärbte Stoffe direkt bei mir.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("farbe");
    npcs.base.autonpcfunctions.AddTraderTrigger("needle","I can sell you a needle, but be careful, they are pointed.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Nadel","Ich kann euch eine Nadel verkaufen, aber vorsichtig, sie ist spitz.");
    -- Faction stuff
    npcs.base.autonpcfunctions.AddTraderTrigger("Elvaine","You are talking about Elvaine Morgan, the archmage of Runewick? I keep forgetting his name.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Morgan");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("archmage");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Erzmagier");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddAdditionalText("Who is that again?");
    npcs.base.autonpcfunctions.AddTraderTrigger("Elvaine","Ihr redet von Elvaine Morgan, dem Erzmagier von Runewick? Ich vergesse immer wieder seinen Namen.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Morgan");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("archmage");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Erzmagier");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddAdditionalText("Wer war das nochmal?");
    npcs.base.autonpcfunctions.AddTraderTrigger("Runewick","I was told they prefer silk in Runewick.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddAdditionalText("Runewick, well, trading with Runewick takes too long, all this talking.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Runewick","Mir wurde erzählt, dass man in Runewick Seide bevorzugt.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddAdditionalText("Runewick, nun, ein Handel mit Runewick dauert immer so lange, immer dieses Gelaber.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Valerio","The Don once ordered trousers for his ruffians from me. I refused, of course.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Guilianni");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Don");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Valerio","Der Don hat einst Hosen für seine Schlägertrupps bei mir bestellt. Ich hab abgelehnt, wie sich von selbst versteht.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Guilianni");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Don");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("Galmair","I am honest; I do not like Galmair. I prefer to trade with honourable men.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Galmair","Ich bin ganz ehrlich; ich mag Galmair nicht. Ich ziehe es vor, mit ehrbahren Leuten zu handeln.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("rosaline","Did you notice the red dress the queen wears from time to mine? My work!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Königin");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("queen");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("edwards");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("rosaline","Habt ihr das rote Kleid bemerkt, welches die Königin manchmal trägt? Mein Meisterwerk!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("königin");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("queen");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("edwards");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("Cadomyr","I tailor for the queen, I tailor for every noble man of Cadomyr. And for every woman, of course.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Cadomyr","Ich schneidere für die Königin, ich schneider für jeden Edelmann von Cadomyr. Und für jede Dame, wie sich von selbst versteht.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    -- Main land factions
    npcs.base.autonpcfunctions.AddTraderTrigger("albar","Once, the lords of Albar ordered a shipment of clothes. But somehow, they never payed me. I suspect Galmairian thugs are behind this!");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("albar","Einst bestellten die Herren von Albar eine Ladung Stoffe. Aber irgendwie wurde ich nie entlohnt. Ich vermute, dass Halunken aus Galmair dahinterstecken.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("gynk","I will never trade with anyone from Gynk. They never fulfill a contract.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("gync");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("gync","Ich werde niemals mit jemanden aus Gynk handeln. Die halten sich nicht an geschlossene Verträge.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("gynk");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("salkama","The women of Salkamar are too thin, I was told. Who can tailor a dress for a dash?");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("salkama","Die Damen aus Salkamar sind alle zu dünn, sagt man. Wie soll man für einen Strich in der Landschaft ein Kleid schneidern?");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    -- Gods; each NPC should at react on at least one god, being a follower of said god
    npcs.base.autonpcfunctions.AddTraderTrigger("Irmorom","Irmorom guides my hands while stitching. I wonder why I sting myself that often with the needle!");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Irmorom","Irmorom führt meine Hand, wenn ich sticke. Ich frag mich, warum ich mich trotzdem so oft mit der Nadel steche.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("Malachin","Malachin is the god of battles and hunting. I'd like to fight and hunt, too, but I'm better at tailoring.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Malachin","Malachin ist der Gott der Schlachten und der Jagd. Ich würde auch gerne Kämpfen und Jagen, aber ich bin besser in der Schneiderei.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    -- Catching quest triggers
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","If you are searching for a quest, go to Cape Farewell or the Oasis of Stars. There are persons who need your help.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Wenn ihr nach einem Abenteuer sucht, geht zum Kap des Abschiedes oder der Sternenoase. Dort wird eure Hilfe gebraucht.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("task","If you are searching for a quest, go to Cape Farewell or the Oasis of Stars. There are persons who need your help.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npcs.base.autonpcfunctions.AddTraderTrigger("Auftrag","Wenn ihr nach einem Abenteuer sucht, geht zum Kap des Abschiedes oder der Sternenoase. Dort wird eure Hilfe gebraucht.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Aufgabe");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    -- Last catch: Think about keyphrases the player might say and that are not caught until here
    npcs.base.autonpcfunctions.AddTraderTrigger("Yes","Pardon?");
    npcs.base.autonpcfunctions.AddAdditionalText("I don't understand you.");
    npcs.base.autonpcfunctions.AddAdditionalText("Sorry?");
    npcs.base.autonpcfunctions.AddTraderTrigger("Ja","Pardon?");
    npcs.base.autonpcfunctions.AddAdditionalText("Ich hab das nicht verstanden.");
    npcs.base.autonpcfunctions.AddAdditionalText("Entschuldigt?");
    npcs.base.autonpcfunctions.AddTraderTrigger("No","What?");
    npcs.base.autonpcfunctions.AddAdditionalText("How...");
    npcs.base.autonpcfunctions.AddAdditionalText("Could you rephrase that?");
    npcs.base.autonpcfunctions.AddTraderTrigger("Nein","Was?");
    npcs.base.autonpcfunctions.AddAdditionalText("Wie jetzt...");
    npcs.base.autonpcfunctions.AddAdditionalText("Könntet ihr das anders beschreiben?");
    -- Cycletext: Please add at least(!) five cycletext messages. The more, the better. You can use emotes (#me is green), too. 
    npcs.base.autonpcfunctions.AddCycleText("Autsch!","Ouch!");
    npcs.base.autonpcfunctions.AddCycleText("#me zerschneidet einige Stoffbahnen.","#me cuts some clothes.");
    npcs.base.autonpcfunctions.AddCycleText("#me stickt ein Muster in ein Stoffstück.","#me stitches a pattern into a piece of cloth.");
    npcs.base.autonpcfunctions.AddCycleText("Maßgeschneiderte Kleider für die Frau, Hüte für euch und Röcke für die Töchter!","Tailored dresses for you wife, hats for you and a skirt for your daughter!");
    npcs.base.autonpcfunctions.AddCycleText("Kommt herein und findet heraus... was ich anzubieten habe!","Come in and find out... what I have!");
    npcs.base.autonpcfunctions.AddCycleText("Kundschaft!","Customers!");
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
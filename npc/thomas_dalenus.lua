-- INSERT INTO npc VALUES (nextval('npc_seq'),0,112,596,0,0,false,'Thomas Dalenus','npc_thomas_dalenus.lua',0);

require("npc.base.autonpcfunctions")
module("npc.thomas_dalenus", package.seeall)

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
    npc.base.autonpcfunctions.AddTraderTrigger("Help","");
    npc.base.autonpcfunctions.AddConsequence("inform","[Game Help] This NPC is the tailor Thomas Dalenus. Keyphrases: Hello, tailor.");
    npc.base.autonpcfunctions.AddTraderTrigger("Hilfe","");
    npc.base.autonpcfunctions.AddConsequence("inform","[Spielhilfe] Dieser NPC ist der Schneider Thomas Dalenus. Schlüsselwörter: Hallo, Schneider.");
    -- General speech
    npc.base.autonpcfunctions.AddTraderTrigger("Hello","Good day.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greetings");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Be greeted");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hail");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good day");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good morning");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good evening");
    npc.base.autonpcfunctions.AddAdditionalText("Greetings.");
    npc.base.autonpcfunctions.AddAdditionalText("Hello");
    npc.base.autonpcfunctions.AddTraderTrigger("Grüße","Guten Tag.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Gruß");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Seid gegrüßt");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Guten Tag");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Guten Abend");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Mahlzeit");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Tach");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Moin");
    npc.base.autonpcfunctions.AddAdditionalText("Seid gegrüßt.");
    npc.base.autonpcfunctions.AddAdditionalText("Hallo.");
    npc.base.autonpcfunctions.AddTraderTrigger("Hiho","Good day.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("Greetings.");
    npc.base.autonpcfunctions.AddAdditionalText("Hello");
    npc.base.autonpcfunctions.AddTraderTrigger("Hiho","Guten Tag.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddAdditionalText("Seid gegrüßt.");
    npc.base.autonpcfunctions.AddAdditionalText("Hallo.");
    npc.base.autonpcfunctions.AddTraderTrigger("Farewell","Farewell, go with the gods.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good bye");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Bye");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Fare thy well");
    npc.base.autonpcfunctions.AddAdditionalText("Good bye, my customer.");
    npc.base.autonpcfunctions.AddTraderTrigger("Tschüß","Gehabt euch wohl, geht mit den Göttern.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Tschüss");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Wiedersehen");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Gehabt euch wohl");
    npc.base.autonpcfunctions.AddAdditionalText("Auf wiedersehen, mein Kunde.");
    npc.base.autonpcfunctions.AddTraderTrigger("Ciao","Farewell, go with the gods.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("Good bye, my customer.");
    npc.base.autonpcfunctions.AddTraderTrigger("Ciao","Gehabt euch wohl, geht mit den Göttern.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddAdditionalText("Auf wiedersehen, mein Kunde.");
    npc.base.autonpcfunctions.AddTraderTrigger("How are you","I just finished this robe. Maybe you want to take a look at it?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("How feel");
    npc.base.autonpcfunctions.AddAdditionalTrigger("How do you do");
    npc.base.autonpcfunctions.AddTraderTrigger("Wie geht","Ich habe gerade diese Robe fertiggestellt. Wollt ihr sie euch ansehen?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Wie fühlst");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Wie ist es ergangen");
    npc.base.autonpcfunctions.AddTraderTrigger("your name","My name is Thomas, Thomas Dalenus. I'm a tailor.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("who are you");
    npc.base.autonpcfunctions.AddAdditionalTrigger("who art thou");
    npc.base.autonpcfunctions.AddAdditionalText("Dalenus' tailored goods - that is my business.");
    npc.base.autonpcfunctions.AddAdditionalText("Thomas Dalenus. And do not call me Tom or I'll sting my needle into your eye.");
    npc.base.autonpcfunctions.AddTraderTrigger("dein name","Mein Name ist Thomas, Thomas Dalenus. Ich bin ein Schneider.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("wer bist du");
    npc.base.autonpcfunctions.AddAdditionalTrigger("wer seid ihr");
    npc.base.autonpcfunctions.AddAdditionalTrigger("wie heißt");
    npc.base.autonpcfunctions.AddAdditionalText("Dalenus Schneiderwaren - das ist mein Geschäft.");
    npc.base.autonpcfunctions.AddAdditionalText("Thomas Dalenus. Und nennt mich nicht Tom, sonst stech ich euch die Augen mit meiner Nadel aus.");
    -- Catching typical NPC phrases 
    npc.base.autonpcfunctions.AddTraderTrigger("what sell","Robes, dresses, capes, shirts, trousers... what do you need, I have everything.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("what buy");
    npc.base.autonpcfunctions.AddAdditionalTrigger("list wares");
    npc.base.autonpcfunctions.AddAdditionalTrigger("price of");
    npc.base.autonpcfunctions.AddTraderTrigger("was verkauf","Roben, Kleider, Umhänge, Hemden, Hosen,... was braucht ihr, ich habe alles.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("was kauf");
    npc.base.autonpcfunctions.AddAdditionalTrigger("warenliste");
    npc.base.autonpcfunctions.AddAdditionalTrigger("preis von");
    npc.base.autonpcfunctions.AddTraderTrigger("tell something","Never trade with Galmair. Just saying.");
    npc.base.autonpcfunctions.AddTraderTrigger("erzähl was","Handelt niemals mit Galmair, sage ich.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("erzähl etwas");
    -- Small talk: The talk here should focus on possible questions. Feel free to add more!
    npc.base.autonpcfunctions.AddTraderTrigger("profession","I'm a tailor, I even made a dress for the queen once.");
    npc.base.autonpcfunctions.AddTraderTrigger("beruf","Ich bin Schneider, einst habe ich sogar ein Kleid für die Königin geschneidert.");
    npc.base.autonpcfunctions.AddTraderTrigger("job","Ich bin Schneider, einst habe ich sogar ein Kleid für die Königin geschneidert.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("job","I'm a tailor, I even made a dress for the queen once.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("tailor","When I made the dress of queen Rosaline, I worked all day and night. It was such a honour! Is there anything I can tailor for you?");
    npc.base.autonpcfunctions.AddTraderTrigger("Schneider","Als ich das Kleid der Königin Rosaline gefertigt habe, hab ich den ganzen Tag und die ganze Nacht gearbeitet. Es war so eine Ehre! Gibt es etwas, was ich für dich schneidern kann?");
    npc.base.autonpcfunctions.AddTraderTrigger("trader","The amount of goods, traded on this marketplace, is magnificient. We're not a people of traders, but everyone needs something sometimes.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("merchant");
    npc.base.autonpcfunctions.AddAdditionalTrigger("collegue");
    npc.base.autonpcfunctions.AddAdditionalTrigger("vendor");
    npc.base.autonpcfunctions.AddAdditionalTrigger("market");
    npc.base.autonpcfunctions.AddTraderTrigger("händler","Die Menge an Waren, die auf diesem Markt gehandelt werden, sind schon beeindruckend. Wir sind zwar kein Volk von Händlern, aber jeder braucht mal etwas.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("kollege");
    npc.base.autonpcfunctions.AddAdditionalTrigger("höker");
    npc.base.autonpcfunctions.AddAdditionalTrigger("markt");
    -- More small talk; add at least five triggers
    npc.base.autonpcfunctions.AddTraderTrigger("dye","To dye clothes is tricky. You need various ingredients like herbs. Better buy dyed clothes from me instead of wasting your time.");
    npc.base.autonpcfunctions.AddTraderTrigger("färbe","Stoffe zu Färben ist aufwändig. Man braucht eine Reihe von Wirkstoffen, so wie Kräuter. Kauft besser gefärbte Stoffe direkt bei mir.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("farbe");
    npc.base.autonpcfunctions.AddTraderTrigger("needle","I can sell you a needle, but be careful, they are pointed.");
    npc.base.autonpcfunctions.AddTraderTrigger("Nadel","Ich kann euch eine Nadel verkaufen, aber vorsichtig, sie ist spitz.");
    -- Faction stuff
    npc.base.autonpcfunctions.AddTraderTrigger("Elvaine","You are talking about Elvaine Morgan, the archmage of Runewick? I keep forgetting his name.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Morgan");
    npc.base.autonpcfunctions.AddAdditionalTrigger("archmage");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Erzmagier");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("Who is that again?");
    npc.base.autonpcfunctions.AddTraderTrigger("Elvaine","Ihr redet von Elvaine Morgan, dem Erzmagier von Runewick? Ich vergesse immer wieder seinen Namen.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Morgan");
    npc.base.autonpcfunctions.AddAdditionalTrigger("archmage");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Erzmagier");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddAdditionalText("Wer war das nochmal?");
    npc.base.autonpcfunctions.AddTraderTrigger("Runewick","I was told they prefer silk in Runewick.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("Runewick, well, trading with Runewick takes too long, all this talking.");
    npc.base.autonpcfunctions.AddTraderTrigger("Runewick","Mir wurde erzählt, dass man in Runewick Seide bevorzugt.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddAdditionalText("Runewick, nun, ein Handel mit Runewick dauert immer so lange, immer dieses Gelaber.");
    npc.base.autonpcfunctions.AddTraderTrigger("Valerio","The Don once ordered trousers for his ruffians from me. I refused, of course.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Guilianni");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Don");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Valerio","Der Don hat einst Hosen für seine Schlägertrupps bei mir bestellt. Ich hab abgelehnt, wie sich von selbst versteht.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Guilianni");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Don");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("Galmair","I am honest; I do not like Galmair. I prefer to trade with honourable men.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Galmair","Ich bin ganz ehrlich; ich mag Galmair nicht. Ich ziehe es vor, mit ehrbahren Leuten zu handeln.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("rosaline","Did you notice the red dress the queen wears from time to mine? My work!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Königin");
    npc.base.autonpcfunctions.AddAdditionalTrigger("queen");
    npc.base.autonpcfunctions.AddAdditionalTrigger("edwards");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("rosaline","Habt ihr das rote Kleid bemerkt, welches die Königin manchmal trägt? Mein Meisterwerk!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("königin");
    npc.base.autonpcfunctions.AddAdditionalTrigger("queen");
    npc.base.autonpcfunctions.AddAdditionalTrigger("edwards");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("Cadomyr","I tailor for the queen, I tailor for every noble man of Cadomyr. And for every woman, of course.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Cadomyr","Ich schneidere für die Königin, ich schneider für jeden Edelmann von Cadomyr. Und für jede Dame, wie sich von selbst versteht.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    -- Main land factions
    npc.base.autonpcfunctions.AddTraderTrigger("albar","Once, the lords of Albar ordered a shipment of clothes. But somehow, they never payed me. I suspect Galmairian thugs are behind this!");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("albar","Einst bestellten die Herren von Albar eine Ladung Stoffe. Aber irgendwie wurde ich nie entlohnt. Ich vermute, dass Halunken aus Galmair dahinterstecken.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("gynk","I will never trade with anyone from Gynk. They never fulfill a contract.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("gync");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("gync","Ich werde niemals mit jemanden aus Gynk handeln. Die halten sich nicht an geschlossene Verträge.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("gynk");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("salkama","The women of Salkamar are too thin, I was told. Who can tailor a dress for a dash?");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("salkama","Die Damen aus Salkamar sind alle zu dünn, sagt man. Wie soll man für einen Strich in der Landschaft ein Kleid schneidern?");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    -- Gods; each NPC should at react on at least one god, being a follower of said god
    npc.base.autonpcfunctions.AddTraderTrigger("Irmorom","Irmorom guides my hands while stitching. I wonder why I sting myself that often with the needle!");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Irmorom","Irmorom führt meine Hand, wenn ich sticke. Ich frag mich, warum ich mich trotzdem so oft mit der Nadel steche.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("Malachin","Malachin is the god of battles and hunting. I'd like to fight and hunt, too, but I'm better at tailoring.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Malachin","Malachin ist der Gott der Schlachten und der Jagd. Ich würde auch gerne Kämpfen und Jagen, aber ich bin besser in der Schneiderei.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    -- Catching quest triggers
    npc.base.autonpcfunctions.AddTraderTrigger("quest","If you are searching for a quest, go to Cape Farewell or the Oasis of Stars. There are persons who need your help.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("quest","Wenn ihr nach einem Abenteuer sucht, geht zum Kap des Abschiedes oder der Sternenoase. Dort wird eure Hilfe gebraucht.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("task","If you are searching for a quest, go to Cape Farewell or the Oasis of Stars. There are persons who need your help.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npc.base.autonpcfunctions.AddTraderTrigger("Auftrag","Wenn ihr nach einem Abenteuer sucht, geht zum Kap des Abschiedes oder der Sternenoase. Dort wird eure Hilfe gebraucht.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Aufgabe");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    -- Last catch: Think about keyphrases the player might say and that are not caught until here
    npc.base.autonpcfunctions.AddTraderTrigger("Yes","Pardon?");
    npc.base.autonpcfunctions.AddAdditionalText("I don't understand you.");
    npc.base.autonpcfunctions.AddAdditionalText("Sorry?");
    npc.base.autonpcfunctions.AddTraderTrigger("Ja","Pardon?");
    npc.base.autonpcfunctions.AddAdditionalText("Ich hab das nicht verstanden.");
    npc.base.autonpcfunctions.AddAdditionalText("Entschuldigt?");
    npc.base.autonpcfunctions.AddTraderTrigger("No","What?");
    npc.base.autonpcfunctions.AddAdditionalText("How...");
    npc.base.autonpcfunctions.AddAdditionalText("Could you rephrase that?");
    npc.base.autonpcfunctions.AddTraderTrigger("Nein","Was?");
    npc.base.autonpcfunctions.AddAdditionalText("Wie jetzt...");
    npc.base.autonpcfunctions.AddAdditionalText("Könntet ihr das anders beschreiben?");
    -- Cycletext: Please add at least(!) five cycletext messages. The more, the better. You can use emotes (#me is green), too. 
    npc.base.autonpcfunctions.AddCycleText("Autsch!","Ouch!");
    npc.base.autonpcfunctions.AddCycleText("#me zerschneidet einige Stoffbahnen.","#me cuts some clothes.");
    npc.base.autonpcfunctions.AddCycleText("#me stickt ein Muster in ein Stoffstück.","#me stitches a pattern into a piece of cloth.");
    npc.base.autonpcfunctions.AddCycleText("Maßgeschneiderte Kleider für die Frau, Hüte für euch und Röcke für die Töchter!","Tailored dresses for you wife, hats for you and a skirt for your daughter!");
    npc.base.autonpcfunctions.AddCycleText("Kommt herein und findet heraus... was ich anzubieten habe!","Come in and find out... what I have!");
    npc.base.autonpcfunctions.AddCycleText("Kundschaft!","Customers!");
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
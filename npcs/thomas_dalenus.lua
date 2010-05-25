-- INSERT INTO npc VALUES (nextval('npc_seq'),0,112,596,0,0,false,'Thomas Dalenus','npc_thomas_dalenus.lua',0);

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
    AddTraderTrigger("Help","");
    AddConsequence("inform","[Game Help] This NPC is the tailor Thomas Dalenus. Keyphrases: Hello, tailor.");
    AddTraderTrigger("Hilfe","");
    AddConsequence("inform","[Spielhilfe] Dieser NPC ist der Schneider Thomas Dalenus. Schlüsselwörter: Hallo, Schneider.");
    -- General speech
    AddTraderTrigger("Hello","Good day.");
    AddAdditionalTrigger("Greetings");
    AddAdditionalTrigger("Be greeted");
    AddAdditionalTrigger("Hail");
    AddAdditionalTrigger("Good day");
    AddAdditionalTrigger("Good morning");
    AddAdditionalTrigger("Good evening");
    AddAdditionalText("Greetings.");
    AddAdditionalText("Hello");
    AddTraderTrigger("Grüße","Guten Tag.");
    AddAdditionalTrigger("Gruß");
    AddAdditionalTrigger("Seid gegrüßt");
    AddAdditionalTrigger("Guten Tag");
    AddAdditionalTrigger("Guten Abend");
    AddAdditionalTrigger("Mahlzeit");
    AddAdditionalTrigger("Tach");
    AddAdditionalTrigger("Moin");
    AddAdditionalText("Seid gegrüßt.");
    AddAdditionalText("Hallo.");
    AddTraderTrigger("Hiho","Good day.");
    AddAdditionalTrigger("Hallo");
    AddAdditionalTrigger("Hey");
    AddAdditionalTrigger("Greebas");
    AddAdditionalTrigger("Greebs");
    AddCondition("lang","english");
    AddAdditionalText("Greetings.");
    AddAdditionalText("Hello");
    AddTraderTrigger("Hiho","Guten Tag.");
    AddAdditionalTrigger("Hallo");
    AddAdditionalTrigger("Hey");
    AddAdditionalTrigger("Greebas");
    AddAdditionalTrigger("Greebs");
    AddCondition("lang","german");
    AddAdditionalText("Seid gegrüßt.");
    AddAdditionalText("Hallo.");
    AddTraderTrigger("Farewell","Farewell, go with the gods.");
    AddAdditionalTrigger("Good bye");
    AddAdditionalTrigger("Bye");
    AddAdditionalTrigger("Fare thy well");
    AddAdditionalText("Good bye, my customer.");
    AddTraderTrigger("Tschüß","Gehabt euch wohl, geht mit den Göttern.");
    AddAdditionalTrigger("Tschüss");
    AddAdditionalTrigger("Wiedersehen");
    AddAdditionalTrigger("Gehabt euch wohl");
    AddAdditionalText("Auf wiedersehen, mein Kunde.");
    AddTraderTrigger("Ciao","Farewell, go with the gods.");
    AddAdditionalTrigger("Adieu");
    AddAdditionalTrigger("Au revoir");
    AddCondition("lang","english");
    AddAdditionalText("Good bye, my customer.");
    AddTraderTrigger("Ciao","Gehabt euch wohl, geht mit den Göttern.");
    AddAdditionalTrigger("Adieu");
    AddAdditionalTrigger("Au revoir");
    AddCondition("lang","german");
    AddAdditionalText("Auf wiedersehen, mein Kunde.");
    AddTraderTrigger("How are you","I just finished this robe. Maybe you want to take a look at it?");
    AddAdditionalTrigger("How feel");
    AddAdditionalTrigger("How do you do");
    AddTraderTrigger("Wie geht","Ich habe gerade diese Robe fertiggestellt. Wollt ihr sie euch ansehen?");
    AddAdditionalTrigger("Wie fühlst");
    AddAdditionalTrigger("Wie ist es ergangen");
    AddTraderTrigger("your name","My name is Thomas, Thomas Dalenus. I'm a tailor.");
    AddAdditionalTrigger("who are you");
    AddAdditionalTrigger("who art thou");
    AddAdditionalText("Dalenus' tailored goods - that is my business.");
    AddAdditionalText("Thomas Dalenus. And do not call me Tom or I'll sting my needle into your eye.");
    AddTraderTrigger("dein name","Mein Name ist Thomas, Thomas Dalenus. Ich bin ein Schneider.");
    AddAdditionalTrigger("wer bist du");
    AddAdditionalTrigger("wer seid ihr");
    AddAdditionalTrigger("wie heißt");
    AddAdditionalText("Dalenus Schneiderwaren - das ist mein Geschäft.");
    AddAdditionalText("Thomas Dalenus. Und nennt mich nicht Tom, sonst stech ich euch die Augen mit meiner Nadel aus.");
    -- Catching typical NPC phrases 
    AddTraderTrigger("what sell","Robes, dresses, capes, shirts, trousers... what do you need, I have everything.");
    AddAdditionalTrigger("what buy");
    AddAdditionalTrigger("list wares");
    AddAdditionalTrigger("price of");
    AddTraderTrigger("was verkauf","Roben, Kleider, Umhänge, Hemden, Hosen,... was braucht ihr, ich habe alles.");
    AddAdditionalTrigger("was kauf");
    AddAdditionalTrigger("warenliste");
    AddAdditionalTrigger("preis von");
    AddTraderTrigger("tell something","Never trade with Galmair. Just saying.");
    AddTraderTrigger("erzähl was","Handelt niemals mit Galmair, sage ich.");
    AddAdditionalTrigger("erzähl etwas");
    -- Small talk: The talk here should focus on possible questions. Feel free to add more!
    AddTraderTrigger("profession","I'm a tailor, I even made a dress for the queen once.");
    AddTraderTrigger("beruf","Ich bin Schneider, einst habe ich sogar ein Kleid für die Königin geschneidert.");
    AddTraderTrigger("job","Ich bin Schneider, einst habe ich sogar ein Kleid für die Königin geschneidert.");
    AddCondition("lang","german");
    AddTraderTrigger("job","I'm a tailor, I even made a dress for the queen once.");
    AddCondition("lang","english");
    AddTraderTrigger("tailor","When I made the dress of queen Rosaline, I worked all day and night. It was such a honour! Is there anything I can tailor for you?");
    AddTraderTrigger("Schneider","Als ich das Kleid der Königin Rosaline gefertigt habe, hab ich den ganzen Tag und die ganze Nacht gearbeitet. Es war so eine Ehre! Gibt es etwas, was ich für dich schneidern kann?");
    AddTraderTrigger("trader","The amount of goods, traded on this marketplace, is magnificient. We're not a people of traders, but everyone needs something sometimes.");
    AddAdditionalTrigger("merchant");
    AddAdditionalTrigger("collegue");
    AddAdditionalTrigger("vendor");
    AddAdditionalTrigger("market");
    AddTraderTrigger("händler","Die Menge an Waren, die auf diesem Markt gehandelt werden, sind schon beeindruckend. Wir sind zwar kein Volk von Händlern, aber jeder braucht mal etwas.");
    AddAdditionalTrigger("kollege");
    AddAdditionalTrigger("höker");
    AddAdditionalTrigger("markt");
    -- More small talk; add at least five triggers
    AddTraderTrigger("dye","To dye clothes is tricky. You need various ingredients like herbs. Better buy dyed clothes from me instead of wasting your time.");
    AddTraderTrigger("färbe","Stoffe zu Färben ist aufwändig. Man braucht eine Reihe von Wirkstoffen, so wie Kräuter. Kauft besser gefärbte Stoffe direkt bei mir.");
    AddAdditionalTrigger("farbe");
    AddTraderTrigger("needle","I can sell you a needle, but be careful, they are pointed.");
    AddTraderTrigger("Nadel","Ich kann euch eine Nadel verkaufen, aber vorsichtig, sie ist spitz.");
    -- Faction stuff
    AddTraderTrigger("Elvaine","You are talking about Elvaine Morgan, the archmage of Runewick? I keep forgetting his name.");
    AddAdditionalTrigger("Morgan");
    AddAdditionalTrigger("archmage");
    AddAdditionalTrigger("Erzmagier");
    AddCondition("lang","english");
    AddAdditionalText("Who is that again?");
    AddTraderTrigger("Elvaine","Ihr redet von Elvaine Morgan, dem Erzmagier von Runewick? Ich vergesse immer wieder seinen Namen.");
    AddAdditionalTrigger("Morgan");
    AddAdditionalTrigger("archmage");
    AddAdditionalTrigger("Erzmagier");
    AddCondition("lang","german");
    AddAdditionalText("Wer war das nochmal?");
    AddTraderTrigger("Runewick","I was told they prefer silk in Runewick.");
    AddCondition("lang","english");
    AddAdditionalText("Runewick, well, trading with Runewick takes too long, all this talking.");
    AddTraderTrigger("Runewick","Mir wurde erzählt, dass man in Runewick Seide bevorzugt.");
    AddCondition("lang","german");
    AddAdditionalText("Runewick, nun, ein Handel mit Runewick dauert immer so lange, immer dieses Gelaber.");
    AddTraderTrigger("Valerio","The Don once ordered trousers for his ruffians from me. I refused, of course.");
    AddAdditionalTrigger("Guilianni");
    AddAdditionalTrigger("Don");
    AddCondition("lang","english");
    AddTraderTrigger("Valerio","Der Don hat einst Hosen für seine Schlägertrupps bei mir bestellt. Ich hab abgelehnt, wie sich von selbst versteht.");
    AddAdditionalTrigger("Guilianni");
    AddAdditionalTrigger("Don");
    AddCondition("lang","german");
    AddTraderTrigger("Galmair","I am honest; I do not like Galmair. I prefer to trade with honourable men.");
    AddCondition("lang","english");
    AddTraderTrigger("Galmair","Ich bin ganz ehrlich; ich mag Galmair nicht. Ich ziehe es vor, mit ehrbahren Leuten zu handeln.");
    AddCondition("lang","german");
    AddTraderTrigger("rosaline","Did you notice the red dress the queen wears from time to mine? My work!");
    AddAdditionalTrigger("Königin");
    AddAdditionalTrigger("queen");
    AddAdditionalTrigger("edwards");
    AddCondition("lang","english");
    AddTraderTrigger("rosaline","Habt ihr das rote Kleid bemerkt, welches die Königin manchmal trägt? Mein Meisterwerk!");
    AddAdditionalTrigger("königin");
    AddAdditionalTrigger("queen");
    AddAdditionalTrigger("edwards");
    AddCondition("lang","german");
    AddTraderTrigger("Cadomyr","I tailor for the queen, I tailor for every noble man of Cadomyr. And for every woman, of course.");
    AddCondition("lang","english");
    AddTraderTrigger("Cadomyr","Ich schneidere für die Königin, ich schneider für jeden Edelmann von Cadomyr. Und für jede Dame, wie sich von selbst versteht.");
    AddCondition("lang","german");
    -- Main land factions
    AddTraderTrigger("albar","Once, the lords of Albar ordered a shipment of clothes. But somehow, they never payed me. I suspect Galmairian thugs are behind this!");
    AddCondition("lang","english");
    AddTraderTrigger("albar","Einst bestellten die Herren von Albar eine Ladung Stoffe. Aber irgendwie wurde ich nie entlohnt. Ich vermute, dass Halunken aus Galmair dahinterstecken.");
    AddCondition("lang","german");
    AddTraderTrigger("gynk","I will never trade with anyone from Gynk. They never fulfill a contract.");
    AddAdditionalTrigger("gync");
    AddCondition("lang","english");
    AddTraderTrigger("gync","Ich werde niemals mit jemanden aus Gynk handeln. Die halten sich nicht an geschlossene Verträge.");
    AddAdditionalTrigger("gynk");
    AddCondition("lang","german");
    AddTraderTrigger("salkama","The women of Salkamar are too thin, I was told. Who can tailor a dress for a dash?");
    AddCondition("lang","english");
    AddTraderTrigger("salkama","Die Damen aus Salkamar sind alle zu dünn, sagt man. Wie soll man für einen Strich in der Landschaft ein Kleid schneidern?");
    AddCondition("lang","german");
    -- Gods; each NPC should at react on at least one god, being a follower of said god
    AddTraderTrigger("Irmorom","Irmorom guides my hands while stitching. I wonder why I sting myself that often with the needle!");
    AddCondition("lang","english");
    AddTraderTrigger("Irmorom","Irmorom führt meine Hand, wenn ich sticke. Ich frag mich, warum ich mich trotzdem so oft mit der Nadel steche.");
    AddCondition("lang","german");
    AddTraderTrigger("Malachin","Malachin is the god of battles and hunting. I'd like to fight and hunt, too, but I'm better at tailoring.");
    AddCondition("lang","english");
    AddTraderTrigger("Malachin","Malachin ist der Gott der Schlachten und der Jagd. Ich würde auch gerne Kämpfen und Jagen, aber ich bin besser in der Schneiderei.");
    AddCondition("lang","german");
    -- Catching quest triggers
    AddTraderTrigger("quest","If you are searching for a quest, go to Cape Farewell or the Oasis of Stars. There are persons who need your help.");
    AddAdditionalTrigger("mission");
    AddCondition("lang","english");
    AddTraderTrigger("quest","Wenn ihr nach einem Abenteuer sucht, geht zum Kap des Abschiedes oder der Sternenoase. Dort wird eure Hilfe gebraucht.");
    AddAdditionalTrigger("mission");
    AddCondition("lang","german");
    AddTraderTrigger("task","If you are searching for a quest, go to Cape Farewell or the Oasis of Stars. There are persons who need your help.");
    AddAdditionalTrigger("adventure");
    AddTraderTrigger("Auftrag","Wenn ihr nach einem Abenteuer sucht, geht zum Kap des Abschiedes oder der Sternenoase. Dort wird eure Hilfe gebraucht.");
    AddAdditionalTrigger("Aufgabe");
    AddAdditionalTrigger("Abenteuer");
    -- Last catch: Think about keyphrases the player might say and that are not caught until here
    AddTraderTrigger("Yes","Pardon?");
    AddAdditionalText("I don't understand you.");
    AddAdditionalText("Sorry?");
    AddTraderTrigger("Ja","Pardon?");
    AddAdditionalText("Ich hab das nicht verstanden.");
    AddAdditionalText("Entschuldigt?");
    AddTraderTrigger("No","What?");
    AddAdditionalText("How...");
    AddAdditionalText("Could you rephrase that?");
    AddTraderTrigger("Nein","Was?");
    AddAdditionalText("Wie jetzt...");
    AddAdditionalText("Könntet ihr das anders beschreiben?");
    -- Cycletext: Please add at least(!) five cycletext messages. The more, the better. You can use emotes (#me is green), too. 
    AddCycleText("Autsch!","Ouch!");
    AddCycleText("#me zerschneidet einige Stoffbahnen.","#me cuts some clothes.");
    AddCycleText("#me stickt ein Muster in ein Stoffstück.","#me stitches a pattern into a piece of cloth.");
    AddCycleText("Maßgeschneiderte Kleider für die Frau, Hüte für euch und Röcke für die Töchter!","Tailored dresses for you wife, hats for you and a skirt for your daughter!");
    AddCycleText("Kommt herein und findet heraus... was ich anzubieten habe!","Come in and find out... what I have!");
    AddCycleText("Kundschaft!","Customers!");
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
-- INSERT INTO npc VALUES (nextval('npc_seq'),2,912,813,1,4,false,'Timotheus','npc_timotheus.lua',0);

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

    -- NPC by Mesha
    -- Revised & translated by Estralis Seborian
    -- This NPC is supposed to trade (all goods are sold and bought, percentage indicates ratio of price bough/sold):
    -- 10% Tools (Tailor/Tanner/Dyer): 6, 47, 51, 58, 2659, 2746, 2781
    -- 10% Cloth gloves: 384, 2295
    -- 10% Clothes: 54, 174, 175, 176, 177, 178, 179
    -- 10% Doublets: 807, 808, 809, 810, 811, 812, 813
    -- 10% Dresses: 385, 800, 801, 802, 803, 804, 805, 806, 833, 834, 835, 836, 837, 838, 845, 846, 847, 848, 849, 850, 851, 852
    -- 10% Dye: 2678, 2679, 2680, 2681, 2682, 2683
    -- 10% Shirts: 180, 181, 182, 457, 458
    -- 10% Skirts: 839, 840, 841, 842, 843
    -- 10% Tailor's resources: 50, 63, 168, 170,
    -- 10% Trousers: 34, 183, 459, 460, 461, 821, 822, 823, 824, 825, 826, 827
    -- 10% Tunics: 814, 815, 816, 817, 818, 819, 820
    -- 10% Robes: 55, 193, 194, 195, 196, 368, 547, 548, 558, 2377, 2378, 2380, 2384, 2416, 2418, 2419, 2420, 2421
    -- 10% Hats: 357, 358, 370, 371, 828, 829, 830, 831, 832
    -- 10% Leather goods: 48, 53, 89, 97, 356, 362, 363, 364, 365, 366, 367, 369, 526, 527, 697, 698, 2113, 2114
    -- Help
    AddTraderTrigger("Help","");
    AddConsequence("inform","[Game Help] This NPC is the tailor Timotheus. Keyphrases: Hello, tailor.");
    AddTraderTrigger("Hilfe","");
    AddConsequence("inform","[Spielhilfe] Dieser NPC ist der Schneider Timotheus. Schlüsselwörter: Hallo, Schneider.");
    -- General speech
    AddTraderTrigger("Hello","Welcome wise one.");
    AddAdditionalTrigger("Greetings");
    AddAdditionalTrigger("Be greeted");
    AddAdditionalTrigger("Hail");
    AddAdditionalTrigger("Good day");
    AddAdditionalTrigger("Good morning");
    AddAdditionalTrigger("Good evening");
    AddAdditionalText("Why greetings to you!");
    AddAdditionalText("Greetings elevated one.");
    AddTraderTrigger("Grüße","Willkommen, mein weiser Freund.");
    AddAdditionalTrigger("Gruß");
    AddAdditionalTrigger("Seid gegrüßt");
    AddAdditionalTrigger("Guten Tag");
    AddAdditionalTrigger("Guten Abend");
    AddAdditionalTrigger("Mahlzeit");
    AddAdditionalTrigger("Tach");
    AddAdditionalTrigger("Moin");
    AddAdditionalText("Wie jetzt, seid gegrüßt!");
    AddAdditionalText("Grüße, mein Großer.");
    AddTraderTrigger("Hiho","Not so informal!");
    AddAdditionalTrigger("Hallo");
    AddAdditionalTrigger("Hey");
    AddAdditionalTrigger("Greebas");
    AddAdditionalTrigger(",english");
    AddAdditionalText("Well... Greetings.");
    AddAdditionalText("Is that the way they talk on the street nowadays?");
    AddTraderTrigger("Hiho","Na, nicht so schnodderig.");
    AddAdditionalTrigger("Hallo");
    AddAdditionalTrigger("Hey");
    AddAdditionalTrigger("Greebas");
    AddAdditionalTrigger(",german");
    AddAdditionalText("Nun... seid gegrüßt.");
    AddAdditionalText("Redet man heutzutage so auf der Straße?");
    AddTraderTrigger("Farewell","May Elara protect your knowledge!");
    AddAdditionalTrigger("Good bye");
    AddAdditionalTrigger("Bye");
    AddAdditionalTrigger("Fare thy well");
    AddAdditionalText("Insightful journey to you!");
    AddAdditionalText("Farewell now!");
    AddTraderTrigger("Tschüß","Möge Elara eure Weisheit bewahren.");
    AddAdditionalTrigger("Tschüss");
    AddAdditionalTrigger("Wiedersehen");
    AddAdditionalTrigger("Gehabt euch wohl");
    AddAdditionalText("Eine aufschlussreiche Reise wünsche ich.");
    AddAdditionalText("Gehabt euch wohl.");
    AddTraderTrigger("Ciao","Charming me huh? Farewell then!");
    AddAdditionalTrigger("Adieu");
    AddAdditionalTrigger("Au revoir");
    AddCondition("lang","english");
    AddAdditionalText("The courtesies certainly haven't left you.");
    AddTraderTrigger("Ciao","Ihr wollt mir wohl schmeicheln. Gute Reise!");
    AddAdditionalTrigger("Adieu");
    AddAdditionalTrigger("Au revoir");
    AddCondition("lang","german");
    AddAdditionalText("Eure Anstandsformen haben euch offensichtlich noch nicht verlassen.");
    AddTraderTrigger("How are you","I'm feeling wonderful, thank you.");
    AddAdditionalTrigger("How feel");
    AddAdditionalTrigger("How do you do");
    AddAdditionalText("Great! Did you know the library has books about famous tailors? Amazing literature.");
    AddTraderTrigger("Wie geht","Mir geht es wunderbar, danke.");
    AddAdditionalTrigger("Wie fühlst");
    AddAdditionalTrigger("Wie ist es ergangen");
    AddAdditionalText("Großartig! Wußtet ihr, dass es in der Bibliothek Bücher über berühmte Schneider gibt? Spannende Lektüre, muss ich sagen.");
    AddTraderTrigger("your name","I am Timotheus.");
    AddAdditionalTrigger("who are you");
    AddAdditionalTrigger("who art thou");
    AddAdditionalText("Why, Timotheus of course!");
    AddTraderTrigger("dein name","Ich bin Timotheus.");
    AddAdditionalTrigger("wer bist du");
    AddAdditionalTrigger("wer seid ihr");
    AddAdditionalTrigger("wie heißt");
    AddAdditionalText("Wie jetzt, Timotheus natürlich!");
    -- Catching typical NPC phrases
    AddTraderTrigger("what sell","I sell all kinds of tailored goods.");
    AddAdditionalTrigger("what buy");
    AddAdditionalTrigger("list wares");
    AddAdditionalTrigger("price of");
    AddTraderTrigger("was verkauf","Ich verkaufe allerlei Schneiderwaren.");
    AddAdditionalTrigger("was kauf");
    AddAdditionalTrigger("warenliste");
    AddAdditionalTrigger("preis von");
    AddTraderTrigger("tell something","Did you know only we from Runewick have such marvelous clothing? I wonder what rags the people of Galmair wear.");
    AddAdditionalText("My robes are the finest in the land!");
    AddTraderTrigger("erzähl was","Wußtet ihr, dass nur wir in Runewick hier so feine Kleidung haben? Ich frage mich, in was für Lumpen die Leute in Galmair rumrennen.");
    AddAdditionalTrigger("erzähl etwas");
    AddAdditionalText("Meine Roben sind die besten im ganzen Land.");
    -- Small talk: The talk here should focus on possible questions. Feel free to add more!
    AddTraderTrigger("profession","I am a tailor. I sell tailor goods, and even make some myself!");
    AddAdditionalText("Profession, my life, whatever you prefer, it's tailoring!");
    AddTraderTrigger("beruf","Ich bin ein Schneider. Ich verkaufe Schneiderwaren und mache auch welche für mich selbst.");
    AddAdditionalText("Mein Beruf, ja, mein Leben, das ist die Schneiderei.");
    AddTraderTrigger("job","Ich bin ein Schneider. Ich verkaufe Schneiderwaren und mache auch welche für mich selbst.");
    AddCondition("lang","german");
    AddAdditionalText("Mein Beruf, ja, mein Leben, das ist die Schneiderei.");
    AddTraderTrigger("job","I am a tailor. I sell tailor goods, and even make some myself!");
    AddCondition("lang","english");
    AddAdditionalText("Profession, my life, whatever you prefer, it's tailoring!");
    AddTraderTrigger("tailor","Tailoring is an underestimated craft. A robe can tell a tale, of great adventures and wisdom.");
    AddTraderTrigger("Schneider","Die Schneiderei ist ein unterschätztes Handwerk. Eine Robe kann eine ganze Geschichte von Abenteuern und Weisheit erzählen.");
    AddTraderTrigger("location","Why, you are in Runewick of course, where else.");
    AddAdditionalText("The place to be in Runewick, at the tailor!");
    AddTraderTrigger("Ort","Wie jetzt, ihr seid natürlich in Runewick.");
    AddAdditionalText("Der Platz schlechthin, Runewick beim Schneider.");
    AddTraderTrigger("trader","Well of course there is NAME. He sells the goods all the farmers have been working for on the fields.");
    AddAdditionalTrigger("merchant");
    AddAdditionalTrigger("collegue");
    AddAdditionalTrigger("vendor");
    AddAdditionalTrigger("market");
    AddAdditionalText("Wise old NAME, he sells all the goods for your studies late at night.");
    AddAdditionalText("NAME over there is the finest cook there has been in a long time.");
    AddTraderTrigger("händler","Nun, da gibt es Fred. Er handelt mit all dem, was Bauern auf den Feldern bestellt haben.");
    AddAdditionalTrigger("kollege");
    AddAdditionalTrigger("höker");
    AddAdditionalTrigger("markt");
    AddAdditionalText("Der alte, weise Wilbert wird euch alles verkaufen, was ihr bei nächtlichen Studien benötigt.");
    AddAdditionalText("Carlton dort drüben ist der beste Koch weit und breit.");
    AddTraderTrigger("Gobaith","Gobaith? No one goes there anymore man! It's a shadow of it's former glory.");
    AddCondition("lang","english");
    AddAdditionalText("Ah that's right! All these Gobaithian refugees...");
    AddAdditionalText("That good old island isn't much anymore is it?");
    AddTraderTrigger("Gobaith","Gobaith? Da wagt sich niemand mehr hin. Es ist nur noch ein Schatten längst vergangenen Ruhmes.");
    AddCondition("lang","german");
    AddAdditionalText("Ja, genau! All diese Flüchtlinge aus Gobaith...");
    AddAdditionalText("Die gute alte Insel gibt es nicht mehr, richtig?");
    AddTraderTrigger("Timmy","I am not living a lie!");
    AddCondition("lang","english");
    AddTraderTrigger("Timmy","Ich lebe keine Lüge!");
    -- Faction stuff
    AddTraderTrigger("Elvaine","He is a brilliant, BRILLIANT man.");
    AddAdditionalTrigger("Morgan");
    AddAdditionalTrigger("Archmage");
    AddAdditionalTrigger("Erzmagier");
    AddCondition("lang","english");
    AddAdditionalText("If he wasn't here... I just wouldn't know what would happen with Runewick. Runewick wouldn't flourish like it does today.");
    AddAdditionalText("Rather restrained, isn't he?");
    AddTraderTrigger("Elvaine","Er ist ein brillianter, ich sage, brillianter Mann.");
    AddAdditionalTrigger("Morgan");
    AddAdditionalTrigger("Archmage");
    AddAdditionalTrigger("Erzmagier");
    AddCondition("lang","german");
    AddAdditionalText("Wenn es ihn nicht gäbe... Ich kann mir gar nicht ausmalen, was dann aus Runewick werden würde. Es würde nicht so florieren wie heute, so viel ist sicher.");
    AddAdditionalText("Er wirkt ziemlich reserviert, nicht wahr?");
    AddTraderTrigger("Runewick","The finest city in the land, that's for sure.");
    AddCondition("lang","english");
    AddAdditionalText("Power through knowledge, that's the motto!");
    AddAdditionalText("The south-eastern jewel, that's what it is.");
    AddTraderTrigger("Runewick","Die beste Stadt weit und weit, so viel steht fest.");
    AddCondition("lang","german");
    AddAdditionalText("Wissen ist Macht, das ist das Motto!");
    AddAdditionalText("Das Juwel des Südwesten, das ist es.");
    AddTraderTrigger("Don","I'm not sure what to think of him. His morals are certainly on the wrong side of a pig.");
    AddAdditionalTrigger("Valerio");
    AddAdditionalTrigger("Guilianni");
    AddCondition("lang","english");
    AddAdditionalText("Money money money, that's all I hear in my head when I hear that name.");
    AddAdditionalText("Valerio Pighead is his name if you ask me.");
    AddTraderTrigger("Don","Ich weiß nicht recht, was ich von ihm halten soll. Seine Moralvorstellungen ähneln dem Hinterteil eines Schweines.");
    AddAdditionalTrigger("Valerio");
    AddAdditionalTrigger("Guilianni");
    AddCondition("lang","german");
    AddAdditionalText("Geld, Geld, Geld, das ist alles, was mir bei dem Namen in den Kopf kommt.");
    AddAdditionalText("Valerio Schweinskopf ist sein Name, wenn ihr mich fragt.");
    AddTraderTrigger("Galmair","About as bad as it's rules I guess.");
    AddCondition("lang","english");
    AddAdditionalText("Built upon the corpses of those with fewer financial reserves.");
    AddAdditionalText("I heard Galmair is ruled by merchants. I say: Ruled by pigs!");
    AddTraderTrigger("Galmair","Es ist genauso schlecht dort wie die dortigen Regeln.");
    AddCondition("lang","german");
    AddAdditionalText("Gebaut auf den Leichen derer, die über kein ausreichendes Finanzpolster verfügen.");
    AddAdditionalText("Ich habe gehört, Galmair wird von Händlern dominiert. Ich sage: Es wird von Schweinen beherrscht.");
    AddTraderTrigger("Rosaline","Queen Rosaline, queen Rosaline. Honourable woman, but not the smartest in her class.");
    AddAdditionalTrigger("queen");
    AddAdditionalTrigger("Edwards");
    AddAdditionalTrigger("königin");
    AddCondition("lang","english");
    AddAdditionalText("She should spend more time reading books instead of boasting.");
    AddAdditionalText("The archmage is right to distrust her.");
    AddTraderTrigger("Rosaline","Königin Rosaline, Königin Rosaline. Eine ehrbare Frau, aber nicht gerade die schlauste ihrer Art.");
    AddAdditionalTrigger("queen");
    AddAdditionalTrigger("Edwards");
    AddAdditionalTrigger("Königin");
    AddCondition("lang","german");
    AddAdditionalText("Sie sollte mal mehr Zeit mit Büchern als mit ihren Prahlereien verbringen.");
    AddAdditionalText("Ich denke, der Erzmagier tut gut daran, ihr nicht zu trauen.");
    AddTraderTrigger("Cadomyr","Beautiful city I guess, too bad the inhabitants are airheads.");
    AddCondition("lang","english");
    AddAdditionalText("I bet they have awfully empty libraries.");
    AddTraderTrigger("Cadomyr","Eine schöne Stadt, so denke ich, aber ihre Einwohner sind hirnverbrannt.");
    AddCondition("lang","german");
    AddAdditionalText("Ich schätze, sie haben dort eine schrecklich leere Bibliothek.");
    -- Main land factions
    AddTraderTrigger("albar","Sir Reginald of Cadomyr owned land in Albar I believe.");
    AddCondition("lang","english");
    AddAdditionalText("Strange customs, those albarians.");
    AddAdditionalText("Isn't that somewhere at the end of the Aramon mountains?");
    AddTraderTrigger("albar","Ich glaube zu wissen, dass Sir Reginald von Cadomyr Land in Albar besessen hat.");
    AddCondition("lang","german");
    AddAdditionalText("Merkwürdige Sitten haben sie, die Albarier.");
    AddAdditionalText("Ist das nicht irgendwo am Ende der Aramonberge?");
    AddTraderTrigger("gynk","Lawless pigs, that's what they are.");
    AddAdditionalTrigger("gync");
    AddCondition("lang","english");
    AddAdditionalText("Surrounded by pirate islands. Doesn't surprise me!");
    AddTraderTrigger("gync","Ruchlose Schweine, das sind sie.");
    AddAdditionalTrigger("gynk");
    AddCondition("lang","german");
    AddAdditionalText("Umgeben von Pirateninseln, mich überrascht gar nichts mehr.");
    AddTraderTrigger("salkama","Above the Middle Mountains. Beautiful city, truely it is!");
    AddCondition("lang","english");
    AddAdditionalText("Archmage Morgan came from Salkamar, did you know that?");
    AddAdditionalText("Oh how I long for it's streets.");
    AddTraderTrigger("salkama","Oberhalb der Mittelberge - eine schöne Stadt, das ist es wahrhaftig.");
    AddCondition("lang","german");
    AddAdditionalText("Erzmagier Morgan stammt aus Salkamar, wußtet ihr das?");
    AddAdditionalText("Oh, wie ich mich nach den Gassen von Salkamar sehne.");
    -- Gods; each NPC should at react on at least one god, being a follower of said god
    AddTraderTrigger("Elara","Elara brings us all knowledge. At least, that is what I believe.");
    AddCondition("lang","english");
    AddAdditionalText("Elara's blessings elevated one.");
    AddTraderTrigger("Elara","Elara gewährt uns all unser Wissen - daran glaube ich fest.");
    AddAdditionalText("Elaras Segen, mein Großer.");
    AddTraderTrigger("Irmorom","Only dwarves pray to Irmorom. Everyone else takes what he grants for granted, as it seems.");
    AddCondition("lang","english");
    AddTraderTrigger("Irmorom","Nur Zwerge beten zu Irmorom. Anscheinend nimmt Jedermann seine Gaben als selbstverständlich hin.");
    -- Catching quest triggers
    AddTraderTrigger("quest","I only sell goods, my apologies. Quests are for the courageous and the air-heads.");
    AddCondition("lang","english");
    AddTraderTrigger("quest","Ich bin nur ein Händler, entschuldigt. Abenteuer sind für die mutigen und törichten.");
    AddCondition("lang","german");
    AddTraderTrigger("task","Adventures? I'm pretty happy with my robes thank you.");
    AddAdditionalTrigger("adventure");
    AddTraderTrigger("Auftrag","Abenteuer? Ich bin ziemlich glücklich mit meinen Roben, danke.");
    AddAdditionalTrigger("Aufgabe");
    AddAdditionalTrigger("Abenteuer");
    -- Last catch: Think about keyphrases the player might say and that are not caught until here
    AddTraderTrigger("Yes","Yes? Yes to what?");
    AddAdditionalText("Yes? I'm happy you agree...");
    AddTraderTrigger("Ja","Ja? Wozu ja?");
    AddAdditionalText("Ja? Freut mich, dass ihr zustimmt.");
    AddTraderTrigger("No","No to what?");
    AddAdditionalText("No? You don't like my robes?");
    AddTraderTrigger("Nein","Nein zu was?");
    AddAdditionalText("Nein? Ihr mögt meine Roben nicht?");
    -- Cycletext: Please add at least(!) five cycletext messages. The more, the better. You can use emotes (#me is green), too.
    AddCycleText("GERMAN","The finest robes, vests, shirts! Do not ever walk around like a bum again.");
    AddCycleText("GERMAN","#me straightens his blue satin robes. They are adorned with orange filigree on the sleeves.");
    AddCycleText("GERMAN","#me looks around for a moment before returning to his book.");
    AddCycleText("GERMAN","#me turns the page of his book.");
    AddCycleText("GERMAN","#me suddenly giggles: 'Oh, my apologies. The man who wrote this is simply brilliant.'");
    AddCycleText("GERMAN","#me begins to mumble: '...and so Mesha Gobblesworth left the council after an outburst of aggression. He wouldn't se...'. He turns silent again.");
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
-- INSERT INTO npc VALUES (nextval('npc_seq'),2,912,813,1,4,false,'Timotheus','npc_timotheus.lua',0);

require("npc.base.autonpcfunctions")
module("npc.timotheus")

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
    npc.base.autonpcfunctions.AddTraderTrigger("Help","");
    npc.base.autonpcfunctions.AddConsequence("inform","[Game Help] This NPC is the tailor Timotheus. Keyphrases: Hello, tailor.");
    npc.base.autonpcfunctions.AddTraderTrigger("Hilfe","");
    npc.base.autonpcfunctions.AddConsequence("inform","[Spielhilfe] Dieser NPC ist der Schneider Timotheus. Schlüsselwörter: Hallo, Schneider.");
    -- General speech
    npc.base.autonpcfunctions.AddTraderTrigger("Hello","Welcome wise one.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greetings");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Be greeted");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hail");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good day");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good morning");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good evening");
    npc.base.autonpcfunctions.AddAdditionalText("Why greetings to you!");
    npc.base.autonpcfunctions.AddAdditionalText("Greetings elevated one.");
    npc.base.autonpcfunctions.AddTraderTrigger("Grüße","Willkommen, mein weiser Freund.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Gruß");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Seid gegrüßt");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Guten Tag");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Guten Abend");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Mahlzeit");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Tach");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Moin");
    npc.base.autonpcfunctions.AddAdditionalText("Wie jetzt, seid gegrüßt!");
    npc.base.autonpcfunctions.AddAdditionalText("Grüße, mein Großer.");
    npc.base.autonpcfunctions.AddTraderTrigger("Hiho","Not so informal!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npc.base.autonpcfunctions.AddAdditionalTrigger(",english");
    npc.base.autonpcfunctions.AddAdditionalText("Well... Greetings.");
    npc.base.autonpcfunctions.AddAdditionalText("Is that the way they talk on the street nowadays?");
    npc.base.autonpcfunctions.AddTraderTrigger("Hiho","Na, nicht so schnodderig.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npc.base.autonpcfunctions.AddAdditionalTrigger(",german");
    npc.base.autonpcfunctions.AddAdditionalText("Nun... seid gegrüßt.");
    npc.base.autonpcfunctions.AddAdditionalText("Redet man heutzutage so auf der Straße?");
    npc.base.autonpcfunctions.AddTraderTrigger("Farewell","May Elara protect your knowledge!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good bye");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Bye");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Fare thy well");
    npc.base.autonpcfunctions.AddAdditionalText("Insightful journey to you!");
    npc.base.autonpcfunctions.AddAdditionalText("Farewell now!");
    npc.base.autonpcfunctions.AddTraderTrigger("Tschüß","Möge Elara eure Weisheit bewahren.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Tschüss");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Wiedersehen");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Gehabt euch wohl");
    npc.base.autonpcfunctions.AddAdditionalText("Eine aufschlussreiche Reise wünsche ich.");
    npc.base.autonpcfunctions.AddAdditionalText("Gehabt euch wohl.");
    npc.base.autonpcfunctions.AddTraderTrigger("Ciao","Charming me huh? Farewell then!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("The courtesies certainly haven't left you.");
    npc.base.autonpcfunctions.AddTraderTrigger("Ciao","Ihr wollt mir wohl schmeicheln. Gute Reise!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddAdditionalText("Eure Anstandsformen haben euch offensichtlich noch nicht verlassen.");
    npc.base.autonpcfunctions.AddTraderTrigger("How are you","I'm feeling wonderful, thank you.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("How feel");
    npc.base.autonpcfunctions.AddAdditionalTrigger("How do you do");
    npc.base.autonpcfunctions.AddAdditionalText("Great! Did you know the library has books about famous tailors? Amazing literature.");
    npc.base.autonpcfunctions.AddTraderTrigger("Wie geht","Mir geht es wunderbar, danke.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Wie fühlst");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Wie ist es ergangen");
    npc.base.autonpcfunctions.AddAdditionalText("Großartig! Wußtet ihr, dass es in der Bibliothek Bücher über berühmte Schneider gibt? Spannende Lektüre, muss ich sagen.");
    npc.base.autonpcfunctions.AddTraderTrigger("your name","I am Timotheus.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("who are you");
    npc.base.autonpcfunctions.AddAdditionalTrigger("who art thou");
    npc.base.autonpcfunctions.AddAdditionalText("Why, Timotheus of course!");
    npc.base.autonpcfunctions.AddTraderTrigger("dein name","Ich bin Timotheus.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("wer bist du");
    npc.base.autonpcfunctions.AddAdditionalTrigger("wer seid ihr");
    npc.base.autonpcfunctions.AddAdditionalTrigger("wie heißt");
    npc.base.autonpcfunctions.AddAdditionalText("Wie jetzt, Timotheus natürlich!");
    -- Catching typical NPC phrases
    npc.base.autonpcfunctions.AddTraderTrigger("what sell","I sell all kinds of tailored goods.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("what buy");
    npc.base.autonpcfunctions.AddAdditionalTrigger("list wares");
    npc.base.autonpcfunctions.AddAdditionalTrigger("price of");
    npc.base.autonpcfunctions.AddTraderTrigger("was verkauf","Ich verkaufe allerlei Schneiderwaren.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("was kauf");
    npc.base.autonpcfunctions.AddAdditionalTrigger("warenliste");
    npc.base.autonpcfunctions.AddAdditionalTrigger("preis von");
    npc.base.autonpcfunctions.AddTraderTrigger("tell something","Did you know only we from Runewick have such marvelous clothing? I wonder what rags the people of Galmair wear.");
    npc.base.autonpcfunctions.AddAdditionalText("My robes are the finest in the land!");
    npc.base.autonpcfunctions.AddTraderTrigger("erzähl was","Wußtet ihr, dass nur wir in Runewick hier so feine Kleidung haben? Ich frage mich, in was für Lumpen die Leute in Galmair rumrennen.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("erzähl etwas");
    npc.base.autonpcfunctions.AddAdditionalText("Meine Roben sind die besten im ganzen Land.");
    -- Small talk: The talk here should focus on possible questions. Feel free to add more!
    npc.base.autonpcfunctions.AddTraderTrigger("profession","I am a tailor. I sell tailor goods, and even make some myself!");
    npc.base.autonpcfunctions.AddAdditionalText("Profession, my life, whatever you prefer, it's tailoring!");
    npc.base.autonpcfunctions.AddTraderTrigger("beruf","Ich bin ein Schneider. Ich verkaufe Schneiderwaren und mache auch welche für mich selbst.");
    npc.base.autonpcfunctions.AddAdditionalText("Mein Beruf, ja, mein Leben, das ist die Schneiderei.");
    npc.base.autonpcfunctions.AddTraderTrigger("job","Ich bin ein Schneider. Ich verkaufe Schneiderwaren und mache auch welche für mich selbst.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddAdditionalText("Mein Beruf, ja, mein Leben, das ist die Schneiderei.");
    npc.base.autonpcfunctions.AddTraderTrigger("job","I am a tailor. I sell tailor goods, and even make some myself!");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("Profession, my life, whatever you prefer, it's tailoring!");
    npc.base.autonpcfunctions.AddTraderTrigger("tailor","Tailoring is an underestimated craft. A robe can tell a tale, of great adventures and wisdom.");
    npc.base.autonpcfunctions.AddTraderTrigger("Schneider","Die Schneiderei ist ein unterschätztes Handwerk. Eine Robe kann eine ganze Geschichte von Abenteuern und Weisheit erzählen.");
    npc.base.autonpcfunctions.AddTraderTrigger("location","Why, you are in Runewick of course, where else.");
    npc.base.autonpcfunctions.AddAdditionalText("The place to be in Runewick, at the tailor!");
    npc.base.autonpcfunctions.AddTraderTrigger("Ort","Wie jetzt, ihr seid natürlich in Runewick.");
    npc.base.autonpcfunctions.AddAdditionalText("Der Platz schlechthin, Runewick beim Schneider.");
    npc.base.autonpcfunctions.AddTraderTrigger("trader","Well of course there is NAME. He sells the goods all the farmers have been working for on the fields.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("merchant");
    npc.base.autonpcfunctions.AddAdditionalTrigger("collegue");
    npc.base.autonpcfunctions.AddAdditionalTrigger("vendor");
    npc.base.autonpcfunctions.AddAdditionalTrigger("market");
    npc.base.autonpcfunctions.AddAdditionalText("Wise old NAME, he sells all the goods for your studies late at night.");
    npc.base.autonpcfunctions.AddAdditionalText("NAME over there is the finest cook there has been in a long time.");
    npc.base.autonpcfunctions.AddTraderTrigger("händler","Nun, da gibt es Fred. Er handelt mit all dem, was Bauern auf den Feldern bestellt haben.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("kollege");
    npc.base.autonpcfunctions.AddAdditionalTrigger("höker");
    npc.base.autonpcfunctions.AddAdditionalTrigger("markt");
    npc.base.autonpcfunctions.AddAdditionalText("Der alte, weise Wilbert wird euch alles verkaufen, was ihr bei nächtlichen Studien benötigt.");
    npc.base.autonpcfunctions.AddAdditionalText("Carlton dort drüben ist der beste Koch weit und breit.");
    npc.base.autonpcfunctions.AddTraderTrigger("Gobaith","Gobaith? No one goes there anymore man! It's a shadow of it's former glory.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("Ah that's right! All these Gobaithian refugees...");
    npc.base.autonpcfunctions.AddAdditionalText("That good old island isn't much anymore is it?");
    npc.base.autonpcfunctions.AddTraderTrigger("Gobaith","Gobaith? Da wagt sich niemand mehr hin. Es ist nur noch ein Schatten längst vergangenen Ruhmes.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddAdditionalText("Ja, genau! All diese Flüchtlinge aus Gobaith...");
    npc.base.autonpcfunctions.AddAdditionalText("Die gute alte Insel gibt es nicht mehr, richtig?");
    npc.base.autonpcfunctions.AddTraderTrigger("Timmy","I am not living a lie!");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Timmy","Ich lebe keine Lüge!");
    -- Faction stuff
    npc.base.autonpcfunctions.AddTraderTrigger("Elvaine","He is a brilliant, BRILLIANT man.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Morgan");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Archmage");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Erzmagier");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("If he wasn't here... I just wouldn't know what would happen with Runewick. Runewick wouldn't flourish like it does today.");
    npc.base.autonpcfunctions.AddAdditionalText("Rather restrained, isn't he?");
    npc.base.autonpcfunctions.AddTraderTrigger("Elvaine","Er ist ein brillianter, ich sage, brillianter Mann.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Morgan");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Archmage");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Erzmagier");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddAdditionalText("Wenn es ihn nicht gäbe... Ich kann mir gar nicht ausmalen, was dann aus Runewick werden würde. Es würde nicht so florieren wie heute, so viel ist sicher.");
    npc.base.autonpcfunctions.AddAdditionalText("Er wirkt ziemlich reserviert, nicht wahr?");
    npc.base.autonpcfunctions.AddTraderTrigger("Runewick","The finest city in the land, that's for sure.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("Power through knowledge, that's the motto!");
    npc.base.autonpcfunctions.AddAdditionalText("The south-eastern jewel, that's what it is.");
    npc.base.autonpcfunctions.AddTraderTrigger("Runewick","Die beste Stadt weit und weit, so viel steht fest.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddAdditionalText("Wissen ist Macht, das ist das Motto!");
    npc.base.autonpcfunctions.AddAdditionalText("Das Juwel des Südwesten, das ist es.");
    npc.base.autonpcfunctions.AddTraderTrigger("Don","I'm not sure what to think of him. His morals are certainly on the wrong side of a pig.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Valerio");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Guilianni");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("Money money money, that's all I hear in my head when I hear that name.");
    npc.base.autonpcfunctions.AddAdditionalText("Valerio Pighead is his name if you ask me.");
    npc.base.autonpcfunctions.AddTraderTrigger("Don","Ich weiß nicht recht, was ich von ihm halten soll. Seine Moralvorstellungen ähneln dem Hinterteil eines Schweines.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Valerio");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Guilianni");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddAdditionalText("Geld, Geld, Geld, das ist alles, was mir bei dem Namen in den Kopf kommt.");
    npc.base.autonpcfunctions.AddAdditionalText("Valerio Schweinskopf ist sein Name, wenn ihr mich fragt.");
    npc.base.autonpcfunctions.AddTraderTrigger("Galmair","About as bad as it's rules I guess.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("Built upon the corpses of those with fewer financial reserves.");
    npc.base.autonpcfunctions.AddAdditionalText("I heard Galmair is ruled by merchants. I say: Ruled by pigs!");
    npc.base.autonpcfunctions.AddTraderTrigger("Galmair","Es ist genauso schlecht dort wie die dortigen Regeln.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddAdditionalText("Gebaut auf den Leichen derer, die über kein ausreichendes Finanzpolster verfügen.");
    npc.base.autonpcfunctions.AddAdditionalText("Ich habe gehört, Galmair wird von Händlern dominiert. Ich sage: Es wird von Schweinen beherrscht.");
    npc.base.autonpcfunctions.AddTraderTrigger("Rosaline","Queen Rosaline, queen Rosaline. Honourable woman, but not the smartest in her class.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("queen");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Edwards");
    npc.base.autonpcfunctions.AddAdditionalTrigger("königin");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("She should spend more time reading books instead of boasting.");
    npc.base.autonpcfunctions.AddAdditionalText("The archmage is right to distrust her.");
    npc.base.autonpcfunctions.AddTraderTrigger("Rosaline","Königin Rosaline, Königin Rosaline. Eine ehrbare Frau, aber nicht gerade die schlauste ihrer Art.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("queen");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Edwards");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Königin");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddAdditionalText("Sie sollte mal mehr Zeit mit Büchern als mit ihren Prahlereien verbringen.");
    npc.base.autonpcfunctions.AddAdditionalText("Ich denke, der Erzmagier tut gut daran, ihr nicht zu trauen.");
    npc.base.autonpcfunctions.AddTraderTrigger("Cadomyr","Beautiful city I guess, too bad the inhabitants are airheads.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("I bet they have awfully empty libraries.");
    npc.base.autonpcfunctions.AddTraderTrigger("Cadomyr","Eine schöne Stadt, so denke ich, aber ihre Einwohner sind hirnverbrannt.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddAdditionalText("Ich schätze, sie haben dort eine schrecklich leere Bibliothek.");
    -- Main land factions
    npc.base.autonpcfunctions.AddTraderTrigger("albar","Sir Reginald of Cadomyr owned land in Albar I believe.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("Strange customs, those albarians.");
    npc.base.autonpcfunctions.AddAdditionalText("Isn't that somewhere at the end of the Aramon mountains?");
    npc.base.autonpcfunctions.AddTraderTrigger("albar","Ich glaube zu wissen, dass Sir Reginald von Cadomyr Land in Albar besessen hat.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddAdditionalText("Merkwürdige Sitten haben sie, die Albarier.");
    npc.base.autonpcfunctions.AddAdditionalText("Ist das nicht irgendwo am Ende der Aramonberge?");
    npc.base.autonpcfunctions.AddTraderTrigger("gynk","Lawless pigs, that's what they are.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("gync");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("Surrounded by pirate islands. Doesn't surprise me!");
    npc.base.autonpcfunctions.AddTraderTrigger("gync","Ruchlose Schweine, das sind sie.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("gynk");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddAdditionalText("Umgeben von Pirateninseln, mich überrascht gar nichts mehr.");
    npc.base.autonpcfunctions.AddTraderTrigger("salkama","Above the Middle Mountains. Beautiful city, truely it is!");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("Archmage Morgan came from Salkamar, did you know that?");
    npc.base.autonpcfunctions.AddAdditionalText("Oh how I long for it's streets.");
    npc.base.autonpcfunctions.AddTraderTrigger("salkama","Oberhalb der Mittelberge - eine schöne Stadt, das ist es wahrhaftig.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddAdditionalText("Erzmagier Morgan stammt aus Salkamar, wußtet ihr das?");
    npc.base.autonpcfunctions.AddAdditionalText("Oh, wie ich mich nach den Gassen von Salkamar sehne.");
    -- Gods; each NPC should at react on at least one god, being a follower of said god
    npc.base.autonpcfunctions.AddTraderTrigger("Elara","Elara brings us all knowledge. At least, that is what I believe.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("Elara's blessings elevated one.");
    npc.base.autonpcfunctions.AddTraderTrigger("Elara","Elara gewährt uns all unser Wissen - daran glaube ich fest.");
    npc.base.autonpcfunctions.AddAdditionalText("Elaras Segen, mein Großer.");
    npc.base.autonpcfunctions.AddTraderTrigger("Irmorom","Only dwarves pray to Irmorom. Everyone else takes what he grants for granted, as it seems.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Irmorom","Nur Zwerge beten zu Irmorom. Anscheinend nimmt Jedermann seine Gaben als selbstverständlich hin.");
    -- Catching quest triggers
    npc.base.autonpcfunctions.AddTraderTrigger("quest","I only sell goods, my apologies. Quests are for the courageous and the air-heads.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("quest","Ich bin nur ein Händler, entschuldigt. Abenteuer sind für die mutigen und törichten.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("task","Adventures? I'm pretty happy with my robes thank you.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npc.base.autonpcfunctions.AddTraderTrigger("Auftrag","Abenteuer? Ich bin ziemlich glücklich mit meinen Roben, danke.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Aufgabe");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    -- Last catch: Think about keyphrases the player might say and that are not caught until here
    npc.base.autonpcfunctions.AddTraderTrigger("Yes","Yes? Yes to what?");
    npc.base.autonpcfunctions.AddAdditionalText("Yes? I'm happy you agree...");
    npc.base.autonpcfunctions.AddTraderTrigger("Ja","Ja? Wozu ja?");
    npc.base.autonpcfunctions.AddAdditionalText("Ja? Freut mich, dass ihr zustimmt.");
    npc.base.autonpcfunctions.AddTraderTrigger("No","No to what?");
    npc.base.autonpcfunctions.AddAdditionalText("No? You don't like my robes?");
    npc.base.autonpcfunctions.AddTraderTrigger("Nein","Nein zu was?");
    npc.base.autonpcfunctions.AddAdditionalText("Nein? Ihr mögt meine Roben nicht?");
    -- Cycletext: Please add at least(!) five cycletext messages. The more, the better. You can use emotes (#me is green), too.
    npc.base.autonpcfunctions.AddCycleText("GERMAN","The finest robes, vests, shirts! Do not ever npc.base.autonpcfunctions.walk around like a bum again.");
    npc.base.autonpcfunctions.AddCycleText("GERMAN","#me straightens his blue satin robes. They are adorned with orange filigree on the sleeves.");
    npc.base.autonpcfunctions.AddCycleText("GERMAN","#me looks around for a moment before returning to his book.");
    npc.base.autonpcfunctions.AddCycleText("GERMAN","#me turns the page of his book.");
    npc.base.autonpcfunctions.AddCycleText("GERMAN","#me suddenly giggles: 'Oh, my apologies. The man who wrote this is simply brilliant.'");
    npc.base.autonpcfunctions.AddCycleText("GERMAN","#me begins to mumble: '...and so Mesha Gobblesworth left the council after an outburst of aggression. He wouldn't se...'. He turns silent again.");
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
-- INSERT INTO npc VALUES (nextval('npc_seq'),2,912,813,1,4,false,'Timotheus','npc_timotheus.lua',0);

require("npcs.base.autonpcfunctions")
module("npcs.timotheus")

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
    npcs.base.autonpcfunctions.AddTraderTrigger("Help","");
    npcs.base.autonpcfunctions.AddConsequence("inform","[Game Help] This NPC is the tailor Timotheus. Keyphrases: Hello, tailor.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Hilfe","");
    npcs.base.autonpcfunctions.AddConsequence("inform","[Spielhilfe] Dieser NPC ist der Schneider Timotheus. Schlüsselwörter: Hallo, Schneider.");
    -- General speech
    npcs.base.autonpcfunctions.AddTraderTrigger("Hello","Welcome wise one.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greetings");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Be greeted");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hail");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good day");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good morning");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good evening");
    npcs.base.autonpcfunctions.AddAdditionalText("Why greetings to you!");
    npcs.base.autonpcfunctions.AddAdditionalText("Greetings elevated one.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Grüße","Willkommen, mein weiser Freund.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Gruß");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Seid gegrüßt");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Guten Tag");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Guten Abend");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Mahlzeit");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Tach");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Moin");
    npcs.base.autonpcfunctions.AddAdditionalText("Wie jetzt, seid gegrüßt!");
    npcs.base.autonpcfunctions.AddAdditionalText("Grüße, mein Großer.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Hiho","Not so informal!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npcs.base.autonpcfunctions.AddAdditionalTrigger(",english");
    npcs.base.autonpcfunctions.AddAdditionalText("Well... Greetings.");
    npcs.base.autonpcfunctions.AddAdditionalText("Is that the way they talk on the street nowadays?");
    npcs.base.autonpcfunctions.AddTraderTrigger("Hiho","Na, nicht so schnodderig.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npcs.base.autonpcfunctions.AddAdditionalTrigger(",german");
    npcs.base.autonpcfunctions.AddAdditionalText("Nun... seid gegrüßt.");
    npcs.base.autonpcfunctions.AddAdditionalText("Redet man heutzutage so auf der Straße?");
    npcs.base.autonpcfunctions.AddTraderTrigger("Farewell","May Elara protect your knowledge!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good bye");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Bye");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Fare thy well");
    npcs.base.autonpcfunctions.AddAdditionalText("Insightful journey to you!");
    npcs.base.autonpcfunctions.AddAdditionalText("Farewell now!");
    npcs.base.autonpcfunctions.AddTraderTrigger("Tschüß","Möge Elara eure Weisheit bewahren.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Tschüss");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Wiedersehen");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Gehabt euch wohl");
    npcs.base.autonpcfunctions.AddAdditionalText("Eine aufschlussreiche Reise wünsche ich.");
    npcs.base.autonpcfunctions.AddAdditionalText("Gehabt euch wohl.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Ciao","Charming me huh? Farewell then!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddAdditionalText("The courtesies certainly haven't left you.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Ciao","Ihr wollt mir wohl schmeicheln. Gute Reise!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddAdditionalText("Eure Anstandsformen haben euch offensichtlich noch nicht verlassen.");
    npcs.base.autonpcfunctions.AddTraderTrigger("How are you","I'm feeling wonderful, thank you.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("How feel");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("How do you do");
    npcs.base.autonpcfunctions.AddAdditionalText("Great! Did you know the library has books about famous tailors? Amazing literature.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Wie geht","Mir geht es wunderbar, danke.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Wie fühlst");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Wie ist es ergangen");
    npcs.base.autonpcfunctions.AddAdditionalText("Großartig! Wußtet ihr, dass es in der Bibliothek Bücher über berühmte Schneider gibt? Spannende Lektüre, muss ich sagen.");
    npcs.base.autonpcfunctions.AddTraderTrigger("your name","I am Timotheus.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("who are you");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("who art thou");
    npcs.base.autonpcfunctions.AddAdditionalText("Why, Timotheus of course!");
    npcs.base.autonpcfunctions.AddTraderTrigger("dein name","Ich bin Timotheus.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wer bist du");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wer seid ihr");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wie heißt");
    npcs.base.autonpcfunctions.AddAdditionalText("Wie jetzt, Timotheus natürlich!");
    -- Catching typical NPC phrases
    npcs.base.autonpcfunctions.AddTraderTrigger("what sell","I sell all kinds of tailored goods.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("what buy");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("list wares");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("price of");
    npcs.base.autonpcfunctions.AddTraderTrigger("was verkauf","Ich verkaufe allerlei Schneiderwaren.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("was kauf");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("warenliste");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("preis von");
    npcs.base.autonpcfunctions.AddTraderTrigger("tell something","Did you know only we from Runewick have such marvelous clothing? I wonder what rags the people of Galmair wear.");
    npcs.base.autonpcfunctions.AddAdditionalText("My robes are the finest in the land!");
    npcs.base.autonpcfunctions.AddTraderTrigger("erzähl was","Wußtet ihr, dass nur wir in Runewick hier so feine Kleidung haben? Ich frage mich, in was für Lumpen die Leute in Galmair rumrennen.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("erzähl etwas");
    npcs.base.autonpcfunctions.AddAdditionalText("Meine Roben sind die besten im ganzen Land.");
    -- Small talk: The talk here should focus on possible questions. Feel free to add more!
    npcs.base.autonpcfunctions.AddTraderTrigger("profession","I am a tailor. I sell tailor goods, and even make some myself!");
    npcs.base.autonpcfunctions.AddAdditionalText("Profession, my life, whatever you prefer, it's tailoring!");
    npcs.base.autonpcfunctions.AddTraderTrigger("beruf","Ich bin ein Schneider. Ich verkaufe Schneiderwaren und mache auch welche für mich selbst.");
    npcs.base.autonpcfunctions.AddAdditionalText("Mein Beruf, ja, mein Leben, das ist die Schneiderei.");
    npcs.base.autonpcfunctions.AddTraderTrigger("job","Ich bin ein Schneider. Ich verkaufe Schneiderwaren und mache auch welche für mich selbst.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddAdditionalText("Mein Beruf, ja, mein Leben, das ist die Schneiderei.");
    npcs.base.autonpcfunctions.AddTraderTrigger("job","I am a tailor. I sell tailor goods, and even make some myself!");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddAdditionalText("Profession, my life, whatever you prefer, it's tailoring!");
    npcs.base.autonpcfunctions.AddTraderTrigger("tailor","Tailoring is an underestimated craft. A robe can tell a tale, of great adventures and wisdom.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Schneider","Die Schneiderei ist ein unterschätztes Handwerk. Eine Robe kann eine ganze Geschichte von Abenteuern und Weisheit erzählen.");
    npcs.base.autonpcfunctions.AddTraderTrigger("location","Why, you are in Runewick of course, where else.");
    npcs.base.autonpcfunctions.AddAdditionalText("The place to be in Runewick, at the tailor!");
    npcs.base.autonpcfunctions.AddTraderTrigger("Ort","Wie jetzt, ihr seid natürlich in Runewick.");
    npcs.base.autonpcfunctions.AddAdditionalText("Der Platz schlechthin, Runewick beim Schneider.");
    npcs.base.autonpcfunctions.AddTraderTrigger("trader","Well of course there is NAME. He sells the goods all the farmers have been working for on the fields.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("merchant");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("collegue");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("vendor");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("market");
    npcs.base.autonpcfunctions.AddAdditionalText("Wise old NAME, he sells all the goods for your studies late at night.");
    npcs.base.autonpcfunctions.AddAdditionalText("NAME over there is the finest cook there has been in a long time.");
    npcs.base.autonpcfunctions.AddTraderTrigger("händler","Nun, da gibt es Fred. Er handelt mit all dem, was Bauern auf den Feldern bestellt haben.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("kollege");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("höker");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("markt");
    npcs.base.autonpcfunctions.AddAdditionalText("Der alte, weise Wilbert wird euch alles verkaufen, was ihr bei nächtlichen Studien benötigt.");
    npcs.base.autonpcfunctions.AddAdditionalText("Carlton dort drüben ist der beste Koch weit und breit.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Gobaith","Gobaith? No one goes there anymore man! It's a shadow of it's former glory.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddAdditionalText("Ah that's right! All these Gobaithian refugees...");
    npcs.base.autonpcfunctions.AddAdditionalText("That good old island isn't much anymore is it?");
    npcs.base.autonpcfunctions.AddTraderTrigger("Gobaith","Gobaith? Da wagt sich niemand mehr hin. Es ist nur noch ein Schatten längst vergangenen Ruhmes.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddAdditionalText("Ja, genau! All diese Flüchtlinge aus Gobaith...");
    npcs.base.autonpcfunctions.AddAdditionalText("Die gute alte Insel gibt es nicht mehr, richtig?");
    npcs.base.autonpcfunctions.AddTraderTrigger("Timmy","I am not living a lie!");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Timmy","Ich lebe keine Lüge!");
    -- Faction stuff
    npcs.base.autonpcfunctions.AddTraderTrigger("Elvaine","He is a brilliant, BRILLIANT man.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Morgan");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Archmage");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Erzmagier");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddAdditionalText("If he wasn't here... I just wouldn't know what would happen with Runewick. Runewick wouldn't flourish like it does today.");
    npcs.base.autonpcfunctions.AddAdditionalText("Rather restrained, isn't he?");
    npcs.base.autonpcfunctions.AddTraderTrigger("Elvaine","Er ist ein brillianter, ich sage, brillianter Mann.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Morgan");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Archmage");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Erzmagier");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddAdditionalText("Wenn es ihn nicht gäbe... Ich kann mir gar nicht ausmalen, was dann aus Runewick werden würde. Es würde nicht so florieren wie heute, so viel ist sicher.");
    npcs.base.autonpcfunctions.AddAdditionalText("Er wirkt ziemlich reserviert, nicht wahr?");
    npcs.base.autonpcfunctions.AddTraderTrigger("Runewick","The finest city in the land, that's for sure.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddAdditionalText("Power through knowledge, that's the motto!");
    npcs.base.autonpcfunctions.AddAdditionalText("The south-eastern jewel, that's what it is.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Runewick","Die beste Stadt weit und weit, so viel steht fest.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddAdditionalText("Wissen ist Macht, das ist das Motto!");
    npcs.base.autonpcfunctions.AddAdditionalText("Das Juwel des Südwesten, das ist es.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Don","I'm not sure what to think of him. His morals are certainly on the wrong side of a pig.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Valerio");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Guilianni");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddAdditionalText("Money money money, that's all I hear in my head when I hear that name.");
    npcs.base.autonpcfunctions.AddAdditionalText("Valerio Pighead is his name if you ask me.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Don","Ich weiß nicht recht, was ich von ihm halten soll. Seine Moralvorstellungen ähneln dem Hinterteil eines Schweines.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Valerio");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Guilianni");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddAdditionalText("Geld, Geld, Geld, das ist alles, was mir bei dem Namen in den Kopf kommt.");
    npcs.base.autonpcfunctions.AddAdditionalText("Valerio Schweinskopf ist sein Name, wenn ihr mich fragt.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Galmair","About as bad as it's rules I guess.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddAdditionalText("Built upon the corpses of those with fewer financial reserves.");
    npcs.base.autonpcfunctions.AddAdditionalText("I heard Galmair is ruled by merchants. I say: Ruled by pigs!");
    npcs.base.autonpcfunctions.AddTraderTrigger("Galmair","Es ist genauso schlecht dort wie die dortigen Regeln.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddAdditionalText("Gebaut auf den Leichen derer, die über kein ausreichendes Finanzpolster verfügen.");
    npcs.base.autonpcfunctions.AddAdditionalText("Ich habe gehört, Galmair wird von Händlern dominiert. Ich sage: Es wird von Schweinen beherrscht.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Rosaline","Queen Rosaline, queen Rosaline. Honourable woman, but not the smartest in her class.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("queen");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Edwards");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("königin");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddAdditionalText("She should spend more time reading books instead of boasting.");
    npcs.base.autonpcfunctions.AddAdditionalText("The archmage is right to distrust her.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Rosaline","Königin Rosaline, Königin Rosaline. Eine ehrbare Frau, aber nicht gerade die schlauste ihrer Art.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("queen");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Edwards");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Königin");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddAdditionalText("Sie sollte mal mehr Zeit mit Büchern als mit ihren Prahlereien verbringen.");
    npcs.base.autonpcfunctions.AddAdditionalText("Ich denke, der Erzmagier tut gut daran, ihr nicht zu trauen.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Cadomyr","Beautiful city I guess, too bad the inhabitants are airheads.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddAdditionalText("I bet they have awfully empty libraries.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Cadomyr","Eine schöne Stadt, so denke ich, aber ihre Einwohner sind hirnverbrannt.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddAdditionalText("Ich schätze, sie haben dort eine schrecklich leere Bibliothek.");
    -- Main land factions
    npcs.base.autonpcfunctions.AddTraderTrigger("albar","Sir Reginald of Cadomyr owned land in Albar I believe.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddAdditionalText("Strange customs, those albarians.");
    npcs.base.autonpcfunctions.AddAdditionalText("Isn't that somewhere at the end of the Aramon mountains?");
    npcs.base.autonpcfunctions.AddTraderTrigger("albar","Ich glaube zu wissen, dass Sir Reginald von Cadomyr Land in Albar besessen hat.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddAdditionalText("Merkwürdige Sitten haben sie, die Albarier.");
    npcs.base.autonpcfunctions.AddAdditionalText("Ist das nicht irgendwo am Ende der Aramonberge?");
    npcs.base.autonpcfunctions.AddTraderTrigger("gynk","Lawless pigs, that's what they are.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("gync");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddAdditionalText("Surrounded by pirate islands. Doesn't surprise me!");
    npcs.base.autonpcfunctions.AddTraderTrigger("gync","Ruchlose Schweine, das sind sie.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("gynk");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddAdditionalText("Umgeben von Pirateninseln, mich überrascht gar nichts mehr.");
    npcs.base.autonpcfunctions.AddTraderTrigger("salkama","Above the Middle Mountains. Beautiful city, truely it is!");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddAdditionalText("Archmage Morgan came from Salkamar, did you know that?");
    npcs.base.autonpcfunctions.AddAdditionalText("Oh how I long for it's streets.");
    npcs.base.autonpcfunctions.AddTraderTrigger("salkama","Oberhalb der Mittelberge - eine schöne Stadt, das ist es wahrhaftig.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddAdditionalText("Erzmagier Morgan stammt aus Salkamar, wußtet ihr das?");
    npcs.base.autonpcfunctions.AddAdditionalText("Oh, wie ich mich nach den Gassen von Salkamar sehne.");
    -- Gods; each NPC should at react on at least one god, being a follower of said god
    npcs.base.autonpcfunctions.AddTraderTrigger("Elara","Elara brings us all knowledge. At least, that is what I believe.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddAdditionalText("Elara's blessings elevated one.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Elara","Elara gewährt uns all unser Wissen - daran glaube ich fest.");
    npcs.base.autonpcfunctions.AddAdditionalText("Elaras Segen, mein Großer.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Irmorom","Only dwarves pray to Irmorom. Everyone else takes what he grants for granted, as it seems.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Irmorom","Nur Zwerge beten zu Irmorom. Anscheinend nimmt Jedermann seine Gaben als selbstverständlich hin.");
    -- Catching quest triggers
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","I only sell goods, my apologies. Quests are for the courageous and the air-heads.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Ich bin nur ein Händler, entschuldigt. Abenteuer sind für die mutigen und törichten.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("task","Adventures? I'm pretty happy with my robes thank you.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npcs.base.autonpcfunctions.AddTraderTrigger("Auftrag","Abenteuer? Ich bin ziemlich glücklich mit meinen Roben, danke.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Aufgabe");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    -- Last catch: Think about keyphrases the player might say and that are not caught until here
    npcs.base.autonpcfunctions.AddTraderTrigger("Yes","Yes? Yes to what?");
    npcs.base.autonpcfunctions.AddAdditionalText("Yes? I'm happy you agree...");
    npcs.base.autonpcfunctions.AddTraderTrigger("Ja","Ja? Wozu ja?");
    npcs.base.autonpcfunctions.AddAdditionalText("Ja? Freut mich, dass ihr zustimmt.");
    npcs.base.autonpcfunctions.AddTraderTrigger("No","No to what?");
    npcs.base.autonpcfunctions.AddAdditionalText("No? You don't like my robes?");
    npcs.base.autonpcfunctions.AddTraderTrigger("Nein","Nein zu was?");
    npcs.base.autonpcfunctions.AddAdditionalText("Nein? Ihr mögt meine Roben nicht?");
    -- Cycletext: Please add at least(!) five cycletext messages. The more, the better. You can use emotes (#me is green), too.
    npcs.base.autonpcfunctions.AddCycleText("GERMAN","The finest robes, vests, shirts! Do not ever npcs.base.autonpcfunctions.walk around like a bum again.");
    npcs.base.autonpcfunctions.AddCycleText("GERMAN","#me straightens his blue satin robes. They are adorned with orange filigree on the sleeves.");
    npcs.base.autonpcfunctions.AddCycleText("GERMAN","#me looks around for a moment before returning to his book.");
    npcs.base.autonpcfunctions.AddCycleText("GERMAN","#me turns the page of his book.");
    npcs.base.autonpcfunctions.AddCycleText("GERMAN","#me suddenly giggles: 'Oh, my apologies. The man who wrote this is simply brilliant.'");
    npcs.base.autonpcfunctions.AddCycleText("GERMAN","#me begins to mumble: '...and so Mesha Gobblesworth left the council after an outburst of aggression. He wouldn't se...'. He turns silent again.");
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
-- INSERT INTO npc VALUES (nextval('npc_seq'),4,10,5,0,4,false,'Graznok','npc_graznok.lua',0);

require("npcs.base.autonpcfunctions")
module("npcs.graznok")

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

    QuestID = 3;
    -- NPC by Estralis Seborian
    -- German translation by Rincewind
    -- Queststatus Overview
    -- 0: No Quest taken
    -- 1: Quest 1 taken - bring the orc a torch
    -- 2: Quest 2 solved, reward: Pork
    -- 3: Quest 2 taken - kill 5 mummies
    -- 4-8: Killing 5 mummies
    -- 9: Quest 2 solved, reward: steak, leather, horn
    -- 10: Quest 3 taken - kill 10 skeletons
    -- 11-20: Killing 10 skeletons
    -- 21: Quest 3 solved, reward: warhammer, orc helmet, full leather armour
    -- Debugging
    npcs.base.autonpcfunctions.AddTraderTrigger("set 0","");
    npcs.base.autonpcfunctions.AddConsequence("inform","[Debugging] Quest status set to 0");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",0);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","");
    npcs.base.autonpcfunctions.AddCondition("qpg",">",21);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Error] Something went wrong, please inform a developer.");
    -- Help
    npcs.base.autonpcfunctions.AddTraderTrigger("Help","");
    npcs.base.autonpcfunctions.AddConsequence("inform","[Game Help] This NPC is the orcish explorer Graznok. Keyphrases: Hello, quest, profession, explorer, clan, darkness, cave.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Hilfe","");
    npcs.base.autonpcfunctions.AddConsequence("inform","[Spielhilfe] Dieser NPC ist der orkische Kundschafter Graznok. Schlüsselwörter: Hallo, Quest, Beruf, Kundschafter, Clan, Dunkelheit, Höhle.");
    -- General speech
    npcs.base.autonpcfunctions.AddTraderTrigger("Hello","Greebas! Yoos be lookin' like yoos could help mes in mes mission.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greetings");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Be greeted");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hail");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good day");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good morning");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good evening");
    npcs.base.autonpcfunctions.AddTraderTrigger("Grüße","Greebas! Du sehen aus. Wie helfen mirr, bei Aufgabs meine.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Gruß");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Seid gegrüßt");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Guten Tag");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Guten Abend");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Mahlzeit");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Tach");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Moin");
    npcs.base.autonpcfunctions.AddTraderTrigger("Hiho","Greebas! Yoos be lookin' like yoos could help mes in mes mission.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Hiho","Greebas! Du sehen aus. Wie helfen mirr, bei Aufgabs meine.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("Farewell","Go wid dat Moshi. And when come back, den bring lotsa shinies fer mes, hurr, hurr.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good bye");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Bye");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Fare thy well");
    npcs.base.autonpcfunctions.AddTraderTrigger("Tschüß","Gehn mit Moschi. Und wenn komme zurück, du bringt viele Glitzazeug. Hurr, hurr.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Tschüss");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Wiedersehen");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Gehabt euch wohl");
    npcs.base.autonpcfunctions.AddTraderTrigger("Ciao","Go wid dat Moshi. And when come back, den bring lotsa shinies fer mes, hurr, hurr.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Ciao","Gehn mit Moschi. Und wenn komme zurück, du bringt viele Glitzazeug. Hurr, hurr.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("How are you","Mes be feelin' gud, mes be on important mission fer clan. Mes be radur sure yoos can do task fer mes.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("How feel");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("How do you do");
    npcs.base.autonpcfunctions.AddTraderTrigger("Wie geht","Mir gutt! Mir Gutt. Mirr auf wichtige Mission. Yubba. Für mein Klan! Fallleicht du machst Aufgabe, mirr?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Wie fühlst");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Wie ist es ergangen");
    npcs.base.autonpcfunctions.AddTraderTrigger("your name","Mes be mighty Graznok, explorer op dem Clan op dem Bonegnawers. Dat mes.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("who are you");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("who art thou");
    npcs.base.autonpcfunctions.AddTraderTrigger("dein name","Mirr mächtig Graznok sein! Kundschafter von Klan d' Knochenbeißer. Mirr ist.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wer bist du");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wer seid ihr");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wie heißt");
    -- Catching typical NPC phrases
    npcs.base.autonpcfunctions.AddTraderTrigger("what sell","Lemme dink... Nub want yoos stuff, nub hab stuff fer yoos. So get lost.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("what buy");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("list wares");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("price of");
    npcs.base.autonpcfunctions.AddTraderTrigger("was verkauf","Uh?!... Nix wolle dein Zeug, nix hab Zeug für dirr. Zieh Leinen!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("was kauf");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("warenliste");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("preis von");
    npcs.base.autonpcfunctions.AddTraderTrigger("tell something","Dere once was orci. And dere was dragon. Dat orci hab smash dat dragon! Gud story, eh?");
    npcs.base.autonpcfunctions.AddTraderTrigger("erzähl was","Es gewesen Ork. Und gewesen Drache. Ork zermatscht Drache! Gutt Geschicht, eh?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("erzähl etwas");
    -- Small talk: The talk here should focus on possible questions. Feel free to add more!
    npcs.base.autonpcfunctions.AddTraderTrigger("orc","Dem orcis be chief op all dings. Bedda predator den wolf, smarter den leafeater and more mighty den red stomper.");
    npcs.base.autonpcfunctions.AddTraderTrigger("ork","Orks große Häuptling von Alles. Besser Jäger als Wolf. Mehr klugg als Blattfressa und mächtiga als rote Stampfer!");
    npcs.base.autonpcfunctions.AddTraderTrigger("profession","Mes be explorer op clan op dem bonegnawers. Dem bonegnawers be searchin' fer new cave fer dwellin'. Dere be cave, but mes need help in mes mission.");
    npcs.base.autonpcfunctions.AddTraderTrigger("beruf","Mirr ist Kundschafter. Von Klan d' Knochenbeißer. Knochenbeißer suchen, neu Höhle für beißn Knochen! Höhle dort ist eine, aber mir Hilfe braucht... für Mission.");
    npcs.base.autonpcfunctions.AddTraderTrigger("job","Mes be explorer op clan op dem bonegnawers. Dem bonegnawers be searchin' fer new cave fer dwellin'. Dere be cave, but mes need help in mes mission.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("job","Mirr ist Kundschafter. Von Klan d' Knochenbeißer. Knochenbeißer suchen, neu Höhle für beißn Knochen! Höhle dort ist eine, aber mir Hilfe braucht... für Mission.");
    npcs.base.autonpcfunctions.AddTraderTrigger("explorer","Mes be explorer op clan op dem bonegnawers. Dem bonegnawers be searchin' fer new cave fer dwellin'. Dere be cave, but mes need help in mes mission.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Kundschaft","Mirr ist Kundschafter. Von Klan d' Knochenbeißer. Knochenbeißer suchen, neu Höhle für beißn Knochen! Höhle dort ist eine, aber mir Hilfe braucht... für Mission.");
    -- More small talk; add at least five triggers
    npcs.base.autonpcfunctions.AddTraderTrigger("tribe","Nub hab tribe, hab clan. Bonegnawers, dey mes clan. Clan mighty, but widout cave.");
    npcs.base.autonpcfunctions.AddTraderTrigger("clan","Mes clan be dat clan op dem bonegnawers. Gnawin' bone all day, hurr, hurr. Clan be searchin' fer new cave fer dwellin'.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("bonegnaw","Dem bones, dey tasty. Gnaw dem, den yoos be knowin', yubba.");
    npcs.base.autonpcfunctions.AddTraderTrigger("cave","Mes be on important mission, yubba. Mes be searchin' new cave fer clan. Dere be cave; help mes wid dat mission!");
    npcs.base.autonpcfunctions.AddTraderTrigger("ragmen","Mes nub like dem ragmen. Dey all go like 'Brrraaaaiiiins!'. Nub know whub dem want from mes.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("ragman");
    npcs.base.autonpcfunctions.AddTraderTrigger("bonemen","Dem bonemen! Hurr! Dey like dead and still npcs.base.autonpcfunctions.walkin'. Dat simply nub rite, dat be scary!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("boneman");
    npcs.base.autonpcfunctions.AddTraderTrigger("fear","Mes nub afraid op anyding! Mes just... cautious. Patient. Hurr!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("afraid");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("scared");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("frightened");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("craven");
    npcs.base.autonpcfunctions.AddTraderTrigger("dark","Stoopid sun, why nub shine all dat day? And why nub shine in cave?! Mes nub like dat dark, dat be dark and nub gud.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("shadow");
    npcs.base.autonpcfunctions.AddTraderTrigger("ghost","Spook! Evil oomies and leafeaters make dat spook. Mes nub like spook, spook so... spooky!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("spectre");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("spook");
    npcs.base.autonpcfunctions.AddTraderTrigger("dialect","Nub hab dialect, groar! Mes be speakin' perfect common, yubba!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("accent");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("language");
    npcs.base.autonpcfunctions.AddTraderTrigger("Stamm","Mirr nix Stamm hat. Hat Klan. Knochenbeißer, das mein Klan ist. Mächtig Klan aber nix Höhle haben.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Klan","Mirr Klan ist Klan 'd Knochenbeißer. Beißn Knochn ganze Tag, hurr, hurr. Klan suchn neu Höhle. Zum beißn Knochn!");
    npcs.base.autonpcfunctions.AddTraderTrigger("Clan","Mirr Klan ist Klan 'd Knochenbeißer. Beißn Knochn ganze Tag, hurr, hurr. Klan suchn neu Höhle. Zum beißn Knochn!");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("Knochenbei","Knochen gutt! Schmeckt gutt. Du beißt, nagen! Du siehst schmeckt gutt! Yubba.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Höhle","Mirr on Mission, wichtig yubba. Mirr suchn neu Höhle, für Klan. Höhle dort ist, du hilfst mit Mission!");
    npcs.base.autonpcfunctions.AddTraderTrigger("Lump","Mirr nix mag Lumpenmann. Alle machen wie 'Geehiieerne!'... Kein Ahnung was wolle von mir.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Knochen","Dort Knochenmanns! Hurr! Sie tot. Aber laufen rum trotzdem. Nix richtig is. Unheimelig ist. Uh!");
    npcs.base.autonpcfunctions.AddTraderTrigger("Furcht","Mir nix Angst nix und nixmand. Mirr Geduld. Vorsichtig. Hurr!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Angst");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("ängstlich");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("erschreck");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("feig");
    npcs.base.autonpcfunctions.AddTraderTrigger("dunkel","Dummig Sonne. Warum nix scheint imma? Warum nix scheint in Höhle?! Mirr nix mag Dunkelheit. Dann es dunkel ist. Dunkel nix gutt.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Schatten");
    npcs.base.autonpcfunctions.AddTraderTrigger("geist","Spuk und Geist. Hurr. Böß Menschz und Blattfressa machen Spukh. Mirr nix mögen Spukh, Spukh ist uh... spukhig!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Gespenst");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Spuk");
    npcs.base.autonpcfunctions.AddTraderTrigger("Dialekt","Mirr nix Akzent, groar! Mirr spricht gemeinsam Sprach perfekt, yubba!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Akzent");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Sprache");
    npcs.base.autonpcfunctions.AddTraderTrigger("salavesh","Whub?!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("cult");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("kult");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("silver dragon");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("silberdrache");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("crusade");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("ritter");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("dragon");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("drache");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("blutmagie");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("blood magic");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("blood mage");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("necro");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("totenbeschwör");
    -- Faction stuff
    npcs.base.autonpcfunctions.AddTraderTrigger("Elvaine","Stoopid majik oomie! Dat be makin' spook, mes be sure. Bedda smash, dat mes say.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Morgan");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("archmage");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Erzmagier");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Elvaine","Dummig Zauberleuts! Machen Spukh, mirr sein sicher. Zermatsch besser, die!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Morgan");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("archmage");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Erzmagier");
    npcs.base.autonpcfunctions.AddTraderTrigger("Runewick","Bedda stay away from dat tree town wid lotsa tower. Nub gud dere, nub gud fer orcis fer dwellin'.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Runewick","Bleibs weg von Baumdorf mit lauters Turms. Nix gutt da, nix gutt für Orks.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Valerio","Dat Don be mighty, rich and fat. Mes want become like dat Don, yubba!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Guilianni");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Don");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Valerio","Das Don mächtig, reich und fett. Mirr wollen werden wie das Don, yubba!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Guilianni");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Don");
    npcs.base.autonpcfunctions.AddTraderTrigger("Galmair","Sum orcis hab say, dat dat be old tent op stumpies. Urgs! Neva gonna dwell in tent op stumpies.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Galmair","Manchens Orks sagen, da alt Zelt von Stumpfies. Urgs! Nix wollen leben in Stumpfiezelt!");
    npcs.base.autonpcfunctions.AddTraderTrigger("rosaline","Dere be girl in dat dry land, dat be rulin' dere. Stoopid oomies, nub hab chief, hab chieftess, hurr, hurr!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("königin");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("queen");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("edwards");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("rosaline","Da sein Weib in trocken Land, das da mächtig. Dummig Leudz, nix Häuptling, hab Häuptlingline, hurr, hurr!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("königin");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("queen");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("edwards");
    npcs.base.autonpcfunctions.AddTraderTrigger("Cadomyr","Dey nub like orcis dere in Cado-dingy. Hurr, dem like dem, but fer work and stuff.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Cadomyr","Nix mögen Orks in Cadom-dings. Hurr, die mögen, aber für machen Arbeit und Zeugs!");
    -- Main land factions
    npcs.base.autonpcfunctions.AddTraderTrigger("albar","#me screams: 'Next time yoos be sayin' dat, mes nub listen! Dey treat orcis like orcis treat piggies!'");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("albar","#me brüllt: 'Wenn du wieder sagst so, mir nix hört zu! Die behandlen Ork wie Ork behandelt Schweins!'");
    npcs.base.autonpcfunctions.AddTraderTrigger("gynk","Dey hab gud heads dere in Gynk. Hab invent boom bottle. Toss at stumpies and dey burn!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("gync");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("gync","Klug Köpfe dort in Gynk. Gebaut hat, erste Bumm-Flasch. Du werfen auf Stumpfie, dann sie brenn'n!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("gynk");
    npcs.base.autonpcfunctions.AddTraderTrigger("salkama","Blah, bleh, blubb. Dem oomies in dat Salka-dingy, dey nub can do anyding but talk. And dat nub even gud.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("salkama","Blah, bleh, blubb. Diese Menschz in Salk-zeug. Sie nix mache als sprechen. Nix mal gutt sprechen.");
    -- Gods; each NPC should react on AT LEAST one god, being a follower of said god
    npcs.base.autonpcfunctions.AddTraderTrigger("Moshran","Big Moshi, dat be mighty god. Moshi nub evil, Moshi power. Moshi gib mes power!");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Moshran","Große Moschi, er mächtig Gott. Nix böß, er Kraft! Moschi geben mirr Kraft!");
    npcs.base.autonpcfunctions.AddTraderTrigger("Malachin","Mala-dingy guide mes smasher. When hunt, den Mala-dingy bring gud game. Praise dat Mala-dingy!");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Malachin","Mala-dings helfen mir matschn! Wenn jagen, Mala-dings machen gutt! Ehre fürr Mala-dings!");
    -- 1st quest: Provide a torch.
    -- Give out quest 1
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Yoos gottur help mes. Mes want explore dat cave over dere, but nub hab torch fer light. Gimme torch so mes can find place fer clan fer dwellin'.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",0);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("inform","[New quest] The Craven Orc I");
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Du mirr hilfst. Mirr wolle erkunden Höhle drüben dort. Aber nix hab Fackl für Licht. Gibst mirr Fackl. Mir findet Platz fürr Klan. Beißn Knochn.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",0);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Der feige Ork I");
    npcs.base.autonpcfunctions.AddTraderTrigger("task","Yoos gottur help mes. Mes want explore dat cave over dere, but nub hab torch fer light. Gimme torch so mes can find place fer clan fer dwellin'.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",0);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("inform","[New quest] The Craven Orc I");
    npcs.base.autonpcfunctions.AddTraderTrigger("Auftrag","Du mirr hilfst. Mirr wolle erkunden Höhle drüben dort. Aber nix hab Fackl für Licht. Gibst mirr Fackl. Mir findet Platz fürr Klan. Beißn Knochn.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Aufgabe");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",0);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Der feige Ork I");
    -- Quest 1 taken but not solved, repeat the instructions
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Shuddup and bring mes torch! Hurr!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Maul halt und gibst mir Fackl! Hurr!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("task","Shuddup and bring mes torch! Hurr!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("Auftrag","Maul halt und gibst mir Fackl! Hurr!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Aufgabe");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    -- Quest 1 solved, reward: pork
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Hurr! Danks fer dat torch. Now mes can go explorin' again. Hab dat pork, dat be tasty.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddCondition("item",391,"all",">",0);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",2);
    npcs.base.autonpcfunctions.AddConsequence("deleteitem",391,1);
    npcs.base.autonpcfunctions.AddConsequence("item",307,1,333,0);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Quest solved] You are awarded a piece of pork. Tasty...");
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Hurr! Dancke für d' Fackl. Jetz mirr kann gehn, Erkundung. Du nimmst Fleisch, das lecker!");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddCondition("item",391,"all",">",0);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",2);
    npcs.base.autonpcfunctions.AddConsequence("deleteitem",391,1);
    npcs.base.autonpcfunctions.AddConsequence("item",307,1,333,0);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Quest gelöst] Du erhältst ein Stück Schweinefleich. Lecker...");
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Hurr! Danks fer dat burnin' torch. Now mes can go explorin' again. Hab dat pork, dat be tasty.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddCondition("item",392,"all",">",0);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",2);
    npcs.base.autonpcfunctions.AddConsequence("deleteitem",392,1);
    npcs.base.autonpcfunctions.AddConsequence("item",307,1,333,0);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Quest solved] You are awarded a piece of pork. Tasty...");
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Hurr! Dancke für d' Fackl. Jetz mirr kann gehn, Erkundung. Du nimmst Fleisch, das lecker!");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddCondition("item",392,"all",">",0);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",2);
    npcs.base.autonpcfunctions.AddConsequence("deleteitem",392,1);
    npcs.base.autonpcfunctions.AddConsequence("item",307,1,333,0);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Quest gelöst] Du erhältst ein Stück Schweinefleich. Lecker...");
    -- 2nd quest: Kill 5 mummies
    -- Give out quest 2
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Hurr! Last time mes hab been explorin' cave, dere be lotsa ragmen. Mes nub like dem ragmen, dey like be spook. Smash dem!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",3);
    npcs.base.autonpcfunctions.AddConsequence("inform","[New quest] The Craven Orc II");
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Hurr. Letzte mal mir erkundet Höhle dort gewesen Lumpenmanns. Mirr nix mag, sie wie Spuk. Du zermatschn! Verjagn Lumpenmanns!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",3);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Der feige Ork II");
    npcs.base.autonpcfunctions.AddTraderTrigger("task","Hurr! Last time mes hab been explorin' cave, dere be lotsa ragmen. Mes nub like dem ragmen, dey like be spook. Smash dem!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",3);
    npcs.base.autonpcfunctions.AddConsequence("inform","[New quest] The Craven Orc II");
    npcs.base.autonpcfunctions.AddTraderTrigger("Auftrag","Hurr. Letzte mal mir erkundet Höhle dort gewesen Lumpenmanns. Mirr nix mag, sie wie Spuk. Du zermatschn! Verjagn Lumpenmanns!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Aufgabe");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",3);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Der feige Ork II");
    -- Quest 2 taken but not solved, repeat the instructions
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Smash more op dem ragmen. Smash one fer each op mes finger on mes rite hand, den cave be save mes be dinkin'.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg",">",2);
    npcs.base.autonpcfunctions.AddCondition("qpg","<",8);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Du zerhaust mehr Lumpenmanns! Zerhaust einen für jede Finger auf mein rechte hand. Dann Höhle sicher ist mirr denkens.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg",">",2);
    npcs.base.autonpcfunctions.AddCondition("qpg","<",8);
    npcs.base.autonpcfunctions.AddTraderTrigger("task","Smash more op dem ragmen. Smash one fer each op mes finger on mes rite hand, den cave be save mes be dinkin'.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npcs.base.autonpcfunctions.AddCondition("qpg",">",2);
    npcs.base.autonpcfunctions.AddCondition("qpg","<",8);
    npcs.base.autonpcfunctions.AddTraderTrigger("Auftrag","Du zerhaust mehr Lumpenmanns! Zerhaust einen für jede Finger auf mein rechte hand. Dann Höhle sicher ist mirr denkens.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Aufgabe");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npcs.base.autonpcfunctions.AddCondition("qpg",">",2);
    npcs.base.autonpcfunctions.AddCondition("qpg","<",8);
    -- Quest 2 solved, reward: steak, leather, horn
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Yoos hab smash dem ragmen? Gud! Mes gib yoos stuff mes hab hunt in dat meantime, tasty and gud stuff.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",8);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",9);
    npcs.base.autonpcfunctions.AddConsequence("item",2547,1,333,0);
    npcs.base.autonpcfunctions.AddConsequence("item",2940,1,333,0);
    npcs.base.autonpcfunctions.AddConsequence("item",333,1,533,0);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Quest solved] You are awarded a steak, a piece of leather and a horn. How useful...");
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Du zermatscht hast die Lumpenmanns? Gutt! Mir gibt dir Zeug, mir erbeutet hat. Lecker und gutt Zeug.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",8);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",9);
    npcs.base.autonpcfunctions.AddConsequence("item",2547,1,333,0);
    npcs.base.autonpcfunctions.AddConsequence("item",2940,1,333,0);
    npcs.base.autonpcfunctions.AddConsequence("item",333,1,533,0);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Quest gelöst] Du erhältst ein Steak, ein Stück Leder und ein Horn. Wie praktisch...");
    -- 3rd quest: Kill 10 skeletons
    -- Give out quest 3
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Cave be much more cozy widout ragmen. But dere sum bonemen, deep in cave. Nub want dwell in same cave as bonemen. Smash as many as yoos can count wid yoos hands!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",9);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",10);
    npcs.base.autonpcfunctions.AddConsequence("inform","[New quest] The Craven Orc III");
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Höhle viel mehr gemütlich, ohne Lumpenmanns. Aber dort Knochenmanns sind. Tief in Höhle. Mir nix nagn Knochen in selbe Höhle wie Knochnman. Du zerhaust Knochenmans, so viel zu abzählst auf dein Hände.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",9);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",10);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Der feige Ork III");
    npcs.base.autonpcfunctions.AddTraderTrigger("task","Cave be much more cozy widout ragmen. But dere sum bonemen, deep in cave. Nub want dwell in same cave as bonemen. Smash as many as yoos can count wid yoos hands!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",9);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",10);
    npcs.base.autonpcfunctions.AddConsequence("inform","[New quest] The Craven Orc III");
    npcs.base.autonpcfunctions.AddTraderTrigger("Auftrag","Höhle viel mehr gemütlich, ohne Lumpenmanns. Aber dort Knochenmanns sind. Tief in Höhle. Mir nix nagn Knochen in selbe Höhle wie Knochnman. Du zerhaust Knochenmans, so viel zu abzählst auf dein Hände.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Aufgabe");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",9);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",10);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Der feige Ork III");
    -- Quest 3 taken but not solved, repeat the instructions
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Smash dem bones, split dem skulls. One fer each finga op yoos hands. Den clan can move to dat cave, yubba!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg",">",9);
    npcs.base.autonpcfunctions.AddCondition("qpg","<",20);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Zerschlagn da Knochns! Brechn sein Schädls. Eina für jeda Finger auf dein beide Hände. Dann Klan zieht in d' Höhle, yubba!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg",">",9);
    npcs.base.autonpcfunctions.AddCondition("qpg","<",20);
    npcs.base.autonpcfunctions.AddTraderTrigger("task","Smash dem bones, split dem skulls. One fer each finga op yoos hands. Den clan can move to dat cave, yubba!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npcs.base.autonpcfunctions.AddCondition("qpg",">",9);
    npcs.base.autonpcfunctions.AddCondition("qpg","<",20);
    npcs.base.autonpcfunctions.AddTraderTrigger("Auftrag","Zerschlagn da Knochns! Brechn sein Schädls. Eina für jeda Finger auf dein beide Hände. Dann Klan zieht in d' Höhle, yubba!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Aufgabe");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npcs.base.autonpcfunctions.AddCondition("qpg",">",9);
    npcs.base.autonpcfunctions.AddCondition("qpg","<",20);
    -- Quest 3 solved, reward:
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Hurr! Victor-dingy! Clan be save now, yoos hab smash dem bonemen. In dat name op dat chief op dem bonegnawers, mes be makin' yoos friend op clan. Hab dat weapon and armour op clan, yoos deserve dat.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",20);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",21);
    npcs.base.autonpcfunctions.AddConsequence("item",226,1,644,0);
    npcs.base.autonpcfunctions.AddConsequence("item",16,1,644,0);
    npcs.base.autonpcfunctions.AddConsequence("item",362,1,644,0);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Quest solved] You are awarded a warhammer, an orc helmet and a full leather armour. Nice...");
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Hurr! Sieg-ding! Klan sicher jetzt ist, du zerschlagn d' Knochenmanns. In Name von Häuptling von Knochenbeißer, mirr machen dich zu Freund. Von ganze Klan. Nimmst Waffe und Rüsta von Klan, du verdienen es.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",20);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",21);
    npcs.base.autonpcfunctions.AddConsequence("item",226,1,644,0);
    npcs.base.autonpcfunctions.AddConsequence("item",16,1,644,0);
    npcs.base.autonpcfunctions.AddConsequence("item",362,1,644,0);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Quest gelöst] Du erhältst einen Kriegshammer, einen Orkhelm und eine volle Lederrüstung. Nett...");
    -- No more quests, just nice words of gratitude
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Nub can help mes, yoos. Hab done enuff. Mes gonna bring clan to cave, danks.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",21);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Nix mehr helfn kannst. Getan genug, hast du! Jetz mirr zeigen Klan Weg zu Höhle. Dancke.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",21);
    npcs.base.autonpcfunctions.AddTraderTrigger("task","Nub can help mes, yoos. Hab done enuff. Mes gonna bring clan to cave, danks.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",21);
    npcs.base.autonpcfunctions.AddTraderTrigger("Auftrag","Nix mehr helfn kannst. Getan genug, hast du! Jetz mirr zeigen Klan Weg zu Höhle. Dancke.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Aufgabe");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",21);
    -- Last catch: Think about keyphrases the player might say and that are not caught until here.
    npcs.base.autonpcfunctions.AddTraderTrigger("Yes","Whub want, yoos?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("yub");
    npcs.base.autonpcfunctions.AddAdditionalText("Whubeva.");
    npcs.base.autonpcfunctions.AddAdditionalText("Mes nub understand whub yoos be meanin'.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Ja","Wat woll, yoos?");
    npcs.base.autonpcfunctions.AddAdditionalText("Watauchimma.");
    npcs.base.autonpcfunctions.AddAdditionalText("Mir nix versteh wat yoos meinen.");
    npcs.base.autonpcfunctions.AddTraderTrigger("No","Nub?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("nub");
    npcs.base.autonpcfunctions.AddAdditionalText("Why nub?");
    npcs.base.autonpcfunctions.AddAdditionalText("Whubeva.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Nein","Nub?");
    npcs.base.autonpcfunctions.AddAdditionalText("Wieso nub?");
    npcs.base.autonpcfunctions.AddAdditionalText("Watauchimma.");
    -- Cycletext: Add as many random messages as possible
    npcs.base.autonpcfunctions.AddCycleText("Hurr!","Hurr!");
    npcs.base.autonpcfunctions.AddCycleText("Maul halt! Mir nix Angst nix und nixmand!","Shuddup! Mes nub fear anyding!");
    npcs.base.autonpcfunctions.AddCycleText("Gibst, gibst, gibst ne fackel bis nach Mitternacht.","Gimme, gimme, gimme a torch aftur midnight!");
    npcs.base.autonpcfunctions.AddCycleText("Mirr nix früchtet nix Geist!","Mes nub afraid op no ghost!");
    npcs.base.autonpcfunctions.AddCycleText("Mir nix Hilfe braucht. Verjagen Schatten allein!","Want nubbody help mes chase dem shadows away!");
    npcs.base.autonpcfunctions.AddCycleText("Bringen mirr durch Dunkelheit, bis Tag kommt.","Take mes thru dat darkness to dat break op dat day.");
    npcs.base.autonpcfunctions.AddCycleText("Dat Jagdgrund fürr ne Fackl!","A huntin' ground fer a torch!");
    npcs.base.autonpcfunctions.AddCycleText("#me schnüffelt und rotzt auf den Boden.","#me sniffes and spits on the ground.");
    npcs.base.autonpcfunctions.AddCycleText("#me knurrt und bleckt die Zähne.","#me growls and snarls.");
    npcs.base.autonpcfunctions.AddCycleText("#me schlägt zwei Steine gegeneinander und flucht: 'Dat werd Licht!'","#me strikes two stones together and curses: 'Let dere be light!'");
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

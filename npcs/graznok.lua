-- INSERT INTO npc VALUES (nextval('npc_seq'),4,10,5,0,4,false,'Graznok','npc_graznok.lua',0);

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
    AddTraderTrigger("set 0","");
    AddConsequence("inform","[Debugging] Quest status set to 0");
    AddConsequence("qpg","=",0);
    AddTraderTrigger(".+","");
    AddCondition("qpg",">",21);
    AddConsequence("inform","[Error] Something went wrong, please inform a developer.");
    -- Help
    AddTraderTrigger("Help","");
    AddConsequence("inform","[Game Help] This NPC is the orcish explorer Graznok. Keyphrases: Hello, quest, profession, explorer, clan, darkness, cave.");
    AddTraderTrigger("Hilfe","");
    AddConsequence("inform","[Spielhilfe] Dieser NPC ist der orkische Kundschafter Graznok. Schlüsselwörter: Hallo, Quest, Beruf, Kundschafter, Clan, Dunkelheit, Höhle.");
    -- General speech
    AddTraderTrigger("Hello","Greebas! Yoos be lookin' like yoos could help mes in mes mission.");
    AddAdditionalTrigger("Greetings");
    AddAdditionalTrigger("Be greeted");
    AddAdditionalTrigger("Hail");
    AddAdditionalTrigger("Good day");
    AddAdditionalTrigger("Good morning");
    AddAdditionalTrigger("Good evening");
    AddTraderTrigger("Grüße","Greebas! Du sehen aus. Wie helfen mirr, bei Aufgabs meine.");
    AddAdditionalTrigger("Gruß");
    AddAdditionalTrigger("Seid gegrüßt");
    AddAdditionalTrigger("Guten Tag");
    AddAdditionalTrigger("Guten Abend");
    AddAdditionalTrigger("Mahlzeit");
    AddAdditionalTrigger("Tach");
    AddAdditionalTrigger("Moin");
    AddTraderTrigger("Hiho","Greebas! Yoos be lookin' like yoos could help mes in mes mission.");
    AddAdditionalTrigger("Hallo");
    AddAdditionalTrigger("Hey");
    AddAdditionalTrigger("Greebas");
    AddAdditionalTrigger("Greebs");
    AddCondition("lang","english");
    AddTraderTrigger("Hiho","Greebas! Du sehen aus. Wie helfen mirr, bei Aufgabs meine.");
    AddAdditionalTrigger("Hallo");
    AddAdditionalTrigger("Hey");
    AddAdditionalTrigger("Greebas");
    AddAdditionalTrigger("Greebs");
    AddCondition("lang","german");
    AddTraderTrigger("Farewell","Go wid dat Moshi. And when come back, den bring lotsa shinies fer mes, hurr, hurr.");
    AddAdditionalTrigger("Good bye");
    AddAdditionalTrigger("Bye");
    AddAdditionalTrigger("Fare thy well");
    AddTraderTrigger("Tschüß","Gehn mit Moschi. Und wenn komme zurück, du bringt viele Glitzazeug. Hurr, hurr.");
    AddAdditionalTrigger("Tschüss");
    AddAdditionalTrigger("Wiedersehen");
    AddAdditionalTrigger("Gehabt euch wohl");
    AddTraderTrigger("Ciao","Go wid dat Moshi. And when come back, den bring lotsa shinies fer mes, hurr, hurr.");
    AddAdditionalTrigger("Adieu");
    AddAdditionalTrigger("Au revoir");
    AddCondition("lang","english");
    AddTraderTrigger("Ciao","Gehn mit Moschi. Und wenn komme zurück, du bringt viele Glitzazeug. Hurr, hurr.");
    AddAdditionalTrigger("Adieu");
    AddAdditionalTrigger("Au revoir");
    AddCondition("lang","german");
    AddTraderTrigger("How are you","Mes be feelin' gud, mes be on important mission fer clan. Mes be radur sure yoos can do task fer mes.");
    AddAdditionalTrigger("How feel");
    AddAdditionalTrigger("How do you do");
    AddTraderTrigger("Wie geht","Mir gutt! Mir Gutt. Mirr auf wichtige Mission. Yubba. Für mein Klan! Fallleicht du machst Aufgabe, mirr?");
    AddAdditionalTrigger("Wie fühlst");
    AddAdditionalTrigger("Wie ist es ergangen");
    AddTraderTrigger("your name","Mes be mighty Graznok, explorer op dem Clan op dem Bonegnawers. Dat mes.");
    AddAdditionalTrigger("who are you");
    AddAdditionalTrigger("who art thou");
    AddTraderTrigger("dein name","Mirr mächtig Graznok sein! Kundschafter von Klan d' Knochenbeißer. Mirr ist.");
    AddAdditionalTrigger("wer bist du");
    AddAdditionalTrigger("wer seid ihr");
    AddAdditionalTrigger("wie heißt");
    -- Catching typical NPC phrases
    AddTraderTrigger("what sell","Lemme dink... Nub want yoos stuff, nub hab stuff fer yoos. So get lost.");
    AddAdditionalTrigger("what buy");
    AddAdditionalTrigger("list wares");
    AddAdditionalTrigger("price of");
    AddTraderTrigger("was verkauf","Uh?!... Nix wolle dein Zeug, nix hab Zeug für dirr. Zieh Leinen!");
    AddAdditionalTrigger("was kauf");
    AddAdditionalTrigger("warenliste");
    AddAdditionalTrigger("preis von");
    AddTraderTrigger("tell something","Dere once was orci. And dere was dragon. Dat orci hab smash dat dragon! Gud story, eh?");
    AddTraderTrigger("erzähl was","Es gewesen Ork. Und gewesen Drache. Ork zermatscht Drache! Gutt Geschicht, eh?");
    AddAdditionalTrigger("erzähl etwas");
    -- Small talk: The talk here should focus on possible questions. Feel free to add more!
    AddTraderTrigger("orc","Dem orcis be chief op all dings. Bedda predator den wolf, smarter den leafeater and more mighty den red stomper.");
    AddTraderTrigger("ork","Orks große Häuptling von Alles. Besser Jäger als Wolf. Mehr klugg als Blattfressa und mächtiga als rote Stampfer!");
    AddTraderTrigger("profession","Mes be explorer op clan op dem bonegnawers. Dem bonegnawers be searchin' fer new cave fer dwellin'. Dere be cave, but mes need help in mes mission.");
    AddTraderTrigger("beruf","Mirr ist Kundschafter. Von Klan d' Knochenbeißer. Knochenbeißer suchen, neu Höhle für beißn Knochen! Höhle dort ist eine, aber mir Hilfe braucht... für Mission.");
    AddTraderTrigger("job","Mes be explorer op clan op dem bonegnawers. Dem bonegnawers be searchin' fer new cave fer dwellin'. Dere be cave, but mes need help in mes mission.");
    AddCondition("lang","english");
    AddTraderTrigger("job","Mirr ist Kundschafter. Von Klan d' Knochenbeißer. Knochenbeißer suchen, neu Höhle für beißn Knochen! Höhle dort ist eine, aber mir Hilfe braucht... für Mission.");
    AddTraderTrigger("explorer","Mes be explorer op clan op dem bonegnawers. Dem bonegnawers be searchin' fer new cave fer dwellin'. Dere be cave, but mes need help in mes mission.");
    AddTraderTrigger("Kundschaft","Mirr ist Kundschafter. Von Klan d' Knochenbeißer. Knochenbeißer suchen, neu Höhle für beißn Knochen! Höhle dort ist eine, aber mir Hilfe braucht... für Mission.");
    -- More small talk; add at least five triggers
    AddTraderTrigger("tribe","Nub hab tribe, hab clan. Bonegnawers, dey mes clan. Clan mighty, but widout cave.");
    AddTraderTrigger("clan","Mes clan be dat clan op dem bonegnawers. Gnawin' bone all day, hurr, hurr. Clan be searchin' fer new cave fer dwellin'.");
    AddCondition("lang","english");
    AddTraderTrigger("bonegnaw","Dem bones, dey tasty. Gnaw dem, den yoos be knowin', yubba.");
    AddTraderTrigger("cave","Mes be on important mission, yubba. Mes be searchin' new cave fer clan. Dere be cave; help mes wid dat mission!");
    AddTraderTrigger("ragmen","Mes nub like dem ragmen. Dey all go like 'Brrraaaaiiiins!'. Nub know whub dem want from mes.");
    AddAdditionalTrigger("ragman");
    AddTraderTrigger("bonemen","Dem bonemen! Hurr! Dey like dead and still walkin'. Dat simply nub rite, dat be scary!");
    AddAdditionalTrigger("boneman");
    AddTraderTrigger("fear","Mes nub afraid op anyding! Mes just... cautious. Patient. Hurr!");
    AddAdditionalTrigger("afraid");
    AddAdditionalTrigger("scared");
    AddAdditionalTrigger("frightened");
    AddAdditionalTrigger("craven");
    AddTraderTrigger("dark","Stoopid sun, why nub shine all dat day? And why nub shine in cave?! Mes nub like dat dark, dat be dark and nub gud.");
    AddAdditionalTrigger("shadow");
    AddTraderTrigger("ghost","Spook! Evil oomies and leafeaters make dat spook. Mes nub like spook, spook so... spooky!");
    AddAdditionalTrigger("spectre");
    AddAdditionalTrigger("spook");
    AddTraderTrigger("dialect","Nub hab dialect, groar! Mes be speakin' perfect common, yubba!");
    AddAdditionalTrigger("accent");
    AddAdditionalTrigger("language");
    AddTraderTrigger("Stamm","Mirr nix Stamm hat. Hat Klan. Knochenbeißer, das mein Klan ist. Mächtig Klan aber nix Höhle haben.");
    AddTraderTrigger("Klan","Mirr Klan ist Klan 'd Knochenbeißer. Beißn Knochn ganze Tag, hurr, hurr. Klan suchn neu Höhle. Zum beißn Knochn!");
    AddTraderTrigger("Clan","Mirr Klan ist Klan 'd Knochenbeißer. Beißn Knochn ganze Tag, hurr, hurr. Klan suchn neu Höhle. Zum beißn Knochn!");
    AddCondition("lang","german");
    AddTraderTrigger("Knochenbei","Knochen gutt! Schmeckt gutt. Du beißt, nagen! Du siehst schmeckt gutt! Yubba.");
    AddTraderTrigger("Höhle","Mirr on Mission, wichtig yubba. Mirr suchn neu Höhle, für Klan. Höhle dort ist, du hilfst mit Mission!");
    AddTraderTrigger("Lump","Mirr nix mag Lumpenmann. Alle machen wie 'Geehiieerne!'... Kein Ahnung was wolle von mir.");
    AddTraderTrigger("Knochen","Dort Knochenmanns! Hurr! Sie tot. Aber laufen rum trotzdem. Nix richtig is. Unheimelig ist. Uh!");
    AddTraderTrigger("Furcht","Mir nix Angst nix und nixmand. Mirr Geduld. Vorsichtig. Hurr!");
    AddAdditionalTrigger("Angst");
    AddAdditionalTrigger("ängstlich");
    AddAdditionalTrigger("erschreck");
    AddAdditionalTrigger("feig");
    AddTraderTrigger("dunkel","Dummig Sonne. Warum nix scheint imma? Warum nix scheint in Höhle?! Mirr nix mag Dunkelheit. Dann es dunkel ist. Dunkel nix gutt.");
    AddAdditionalTrigger("Schatten");
    AddTraderTrigger("geist","Spuk und Geist. Hurr. Böß Menschz und Blattfressa machen Spukh. Mirr nix mögen Spukh, Spukh ist uh... spukhig!");
    AddAdditionalTrigger("Gespenst");
    AddAdditionalTrigger("Spuk");
    AddTraderTrigger("Dialekt","Mirr nix Akzent, groar! Mirr spricht gemeinsam Sprach perfekt, yubba!");
    AddAdditionalTrigger("Akzent");
    AddAdditionalTrigger("Sprache");
    AddTraderTrigger("salavesh","Whub?!");
    AddAdditionalTrigger("cult");
    AddAdditionalTrigger("kult");
    AddAdditionalTrigger("silver dragon");
    AddAdditionalTrigger("silberdrache");
    AddAdditionalTrigger("crusade");
    AddAdditionalTrigger("ritter");
    AddAdditionalTrigger("dragon");
    AddAdditionalTrigger("drache");
    AddAdditionalTrigger("blutmagie");
    AddAdditionalTrigger("blood magic");
    AddAdditionalTrigger("blood mage");
    AddAdditionalTrigger("necro");
    AddAdditionalTrigger("totenbeschwör");
    -- Faction stuff
    AddTraderTrigger("Elvaine","Stoopid majik oomie! Dat be makin' spook, mes be sure. Bedda smash, dat mes say.");
    AddAdditionalTrigger("Morgan");
    AddAdditionalTrigger("archmage");
    AddAdditionalTrigger("Erzmagier");
    AddCondition("lang","english");
    AddTraderTrigger("Elvaine","Dummig Zauberleuts! Machen Spukh, mirr sein sicher. Zermatsch besser, die!");
    AddAdditionalTrigger("Morgan");
    AddAdditionalTrigger("archmage");
    AddAdditionalTrigger("Erzmagier");
    AddTraderTrigger("Runewick","Bedda stay away from dat tree town wid lotsa tower. Nub gud dere, nub gud fer orcis fer dwellin'.");
    AddCondition("lang","english");
    AddTraderTrigger("Runewick","Bleibs weg von Baumdorf mit lauters Turms. Nix gutt da, nix gutt für Orks.");
    AddTraderTrigger("Valerio","Dat Don be mighty, rich and fat. Mes want become like dat Don, yubba!");
    AddAdditionalTrigger("Guilianni");
    AddAdditionalTrigger("Don");
    AddCondition("lang","english");
    AddTraderTrigger("Valerio","Das Don mächtig, reich und fett. Mirr wollen werden wie das Don, yubba!");
    AddAdditionalTrigger("Guilianni");
    AddAdditionalTrigger("Don");
    AddTraderTrigger("Galmair","Sum orcis hab say, dat dat be old tent op stumpies. Urgs! Neva gonna dwell in tent op stumpies.");
    AddCondition("lang","english");
    AddTraderTrigger("Galmair","Manchens Orks sagen, da alt Zelt von Stumpfies. Urgs! Nix wollen leben in Stumpfiezelt!");
    AddTraderTrigger("rosaline","Dere be girl in dat dry land, dat be rulin' dere. Stoopid oomies, nub hab chief, hab chieftess, hurr, hurr!");
    AddAdditionalTrigger("königin");
    AddAdditionalTrigger("queen");
    AddAdditionalTrigger("edwards");
    AddCondition("lang","english");
    AddTraderTrigger("rosaline","Da sein Weib in trocken Land, das da mächtig. Dummig Leudz, nix Häuptling, hab Häuptlingline, hurr, hurr!");
    AddAdditionalTrigger("königin");
    AddAdditionalTrigger("queen");
    AddAdditionalTrigger("edwards");
    AddTraderTrigger("Cadomyr","Dey nub like orcis dere in Cado-dingy. Hurr, dem like dem, but fer work and stuff.");
    AddCondition("lang","english");
    AddTraderTrigger("Cadomyr","Nix mögen Orks in Cadom-dings. Hurr, die mögen, aber für machen Arbeit und Zeugs!");
    -- Main land factions
    AddTraderTrigger("albar","#me screams: 'Next time yoos be sayin' dat, mes nub listen! Dey treat orcis like orcis treat piggies!'");
    AddCondition("lang","english");
    AddTraderTrigger("albar","#me brüllt: 'Wenn du wieder sagst so, mir nix hört zu! Die behandlen Ork wie Ork behandelt Schweins!'");
    AddTraderTrigger("gynk","Dey hab gud heads dere in Gynk. Hab invent boom bottle. Toss at stumpies and dey burn!");
    AddAdditionalTrigger("gync");
    AddCondition("lang","english");
    AddTraderTrigger("gync","Klug Köpfe dort in Gynk. Gebaut hat, erste Bumm-Flasch. Du werfen auf Stumpfie, dann sie brenn'n!");
    AddAdditionalTrigger("gynk");
    AddTraderTrigger("salkama","Blah, bleh, blubb. Dem oomies in dat Salka-dingy, dey nub can do anyding but talk. And dat nub even gud.");
    AddCondition("lang","english");
    AddTraderTrigger("salkama","Blah, bleh, blubb. Diese Menschz in Salk-zeug. Sie nix mache als sprechen. Nix mal gutt sprechen.");
    -- Gods; each NPC should react on AT LEAST one god, being a follower of said god
    AddTraderTrigger("Moshran","Big Moshi, dat be mighty god. Moshi nub evil, Moshi power. Moshi gib mes power!");
    AddCondition("lang","english");
    AddTraderTrigger("Moshran","Große Moschi, er mächtig Gott. Nix böß, er Kraft! Moschi geben mirr Kraft!");
    AddTraderTrigger("Malachin","Mala-dingy guide mes smasher. When hunt, den Mala-dingy bring gud game. Praise dat Mala-dingy!");
    AddCondition("lang","english");
    AddTraderTrigger("Malachin","Mala-dings helfen mir matschn! Wenn jagen, Mala-dings machen gutt! Ehre fürr Mala-dings!");
    -- 1st quest: Provide a torch.
    -- Give out quest 1
    AddTraderTrigger("quest","Yoos gottur help mes. Mes want explore dat cave over dere, but nub hab torch fer light. Gimme torch so mes can find place fer clan fer dwellin'.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",0);
    AddCondition("lang","english");
    AddConsequence("qpg","=",1);
    AddConsequence("inform","[New quest] The Craven Orc I");
    AddTraderTrigger("quest","Du mirr hilfst. Mirr wolle erkunden Höhle drüben dort. Aber nix hab Fackl für Licht. Gibst mirr Fackl. Mir findet Platz fürr Klan. Beißn Knochn.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",0);
    AddConsequence("qpg","=",1);
    AddConsequence("inform","[Neues Quest] Der feige Ork I");
    AddTraderTrigger("task","Yoos gottur help mes. Mes want explore dat cave over dere, but nub hab torch fer light. Gimme torch so mes can find place fer clan fer dwellin'.");
    AddAdditionalTrigger("adventure");
    AddCondition("qpg","=",0);
    AddConsequence("qpg","=",1);
    AddConsequence("inform","[New quest] The Craven Orc I");
    AddTraderTrigger("Auftrag","Du mirr hilfst. Mirr wolle erkunden Höhle drüben dort. Aber nix hab Fackl für Licht. Gibst mirr Fackl. Mir findet Platz fürr Klan. Beißn Knochn.");
    AddAdditionalTrigger("Aufgabe");
    AddAdditionalTrigger("Abenteuer");
    AddCondition("qpg","=",0);
    AddConsequence("qpg","=",1);
    AddConsequence("inform","[Neues Quest] Der feige Ork I");
    -- Quest 1 taken but not solved, repeat the instructions
    AddTraderTrigger("quest","Shuddup and bring mes torch! Hurr!");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",1);
    AddCondition("lang","english");
    AddTraderTrigger("quest","Maul halt und gibst mir Fackl! Hurr!");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",1);
    AddTraderTrigger("task","Shuddup and bring mes torch! Hurr!");
    AddAdditionalTrigger("adventure");
    AddCondition("qpg","=",1);
    AddTraderTrigger("Auftrag","Maul halt und gibst mir Fackl! Hurr!");
    AddAdditionalTrigger("Aufgabe");
    AddAdditionalTrigger("Abenteuer");
    AddCondition("qpg","=",1);
    -- Quest 1 solved, reward: pork
    AddTraderTrigger(".+","Hurr! Danks fer dat torch. Now mes can go explorin' again. Hab dat pork, dat be tasty.");
    AddCondition("qpg","=",1);
    AddCondition("item",391,"all",">",0);
    AddCondition("lang","english");
    AddConsequence("qpg","=",2);
    AddConsequence("deleteitem",391,1);
    AddConsequence("item",307,1,333,0);
    AddConsequence("inform","[Quest solved] You are awarded a piece of pork. Tasty...");
    AddTraderTrigger(".+","Hurr! Dancke für d' Fackl. Jetz mirr kann gehn, Erkundung. Du nimmst Fleisch, das lecker!");
    AddCondition("qpg","=",1);
    AddCondition("item",391,"all",">",0);
    AddConsequence("qpg","=",2);
    AddConsequence("deleteitem",391,1);
    AddConsequence("item",307,1,333,0);
    AddConsequence("inform","[Quest gelöst] Du erhältst ein Stück Schweinefleich. Lecker...");
    AddTraderTrigger(".+","Hurr! Danks fer dat burnin' torch. Now mes can go explorin' again. Hab dat pork, dat be tasty.");
    AddCondition("qpg","=",1);
    AddCondition("item",392,"all",">",0);
    AddCondition("lang","english");
    AddConsequence("qpg","=",2);
    AddConsequence("deleteitem",392,1);
    AddConsequence("item",307,1,333,0);
    AddConsequence("inform","[Quest solved] You are awarded a piece of pork. Tasty...");
    AddTraderTrigger(".+","Hurr! Dancke für d' Fackl. Jetz mirr kann gehn, Erkundung. Du nimmst Fleisch, das lecker!");
    AddCondition("qpg","=",1);
    AddCondition("item",392,"all",">",0);
    AddConsequence("qpg","=",2);
    AddConsequence("deleteitem",392,1);
    AddConsequence("item",307,1,333,0);
    AddConsequence("inform","[Quest gelöst] Du erhältst ein Stück Schweinefleich. Lecker...");
    -- 2nd quest: Kill 5 mummies
    -- Give out quest 2
    AddTraderTrigger("quest","Hurr! Last time mes hab been explorin' cave, dere be lotsa ragmen. Mes nub like dem ragmen, dey like be spook. Smash dem!");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",2);
    AddCondition("lang","english");
    AddConsequence("qpg","=",3);
    AddConsequence("inform","[New quest] The Craven Orc II");
    AddTraderTrigger("quest","Hurr. Letzte mal mir erkundet Höhle dort gewesen Lumpenmanns. Mirr nix mag, sie wie Spuk. Du zermatschn! Verjagn Lumpenmanns!");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",2);
    AddConsequence("qpg","=",3);
    AddConsequence("inform","[Neues Quest] Der feige Ork II");
    AddTraderTrigger("task","Hurr! Last time mes hab been explorin' cave, dere be lotsa ragmen. Mes nub like dem ragmen, dey like be spook. Smash dem!");
    AddAdditionalTrigger("adventure");
    AddCondition("qpg","=",2);
    AddConsequence("qpg","=",3);
    AddConsequence("inform","[New quest] The Craven Orc II");
    AddTraderTrigger("Auftrag","Hurr. Letzte mal mir erkundet Höhle dort gewesen Lumpenmanns. Mirr nix mag, sie wie Spuk. Du zermatschn! Verjagn Lumpenmanns!");
    AddAdditionalTrigger("Aufgabe");
    AddAdditionalTrigger("Abenteuer");
    AddCondition("qpg","=",2);
    AddConsequence("qpg","=",3);
    AddConsequence("inform","[Neues Quest] Der feige Ork II");
    -- Quest 2 taken but not solved, repeat the instructions
    AddTraderTrigger("quest","Smash more op dem ragmen. Smash one fer each op mes finger on mes rite hand, den cave be save mes be dinkin'.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg",">",2);
    AddCondition("qpg","<",8);
    AddCondition("lang","english");
    AddTraderTrigger("quest","Du zerhaust mehr Lumpenmanns! Zerhaust einen für jede Finger auf mein rechte hand. Dann Höhle sicher ist mirr denkens.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg",">",2);
    AddCondition("qpg","<",8);
    AddTraderTrigger("task","Smash more op dem ragmen. Smash one fer each op mes finger on mes rite hand, den cave be save mes be dinkin'.");
    AddAdditionalTrigger("adventure");
    AddCondition("qpg",">",2);
    AddCondition("qpg","<",8);
    AddTraderTrigger("Auftrag","Du zerhaust mehr Lumpenmanns! Zerhaust einen für jede Finger auf mein rechte hand. Dann Höhle sicher ist mirr denkens.");
    AddAdditionalTrigger("Aufgabe");
    AddAdditionalTrigger("Abenteuer");
    AddCondition("qpg",">",2);
    AddCondition("qpg","<",8);
    -- Quest 2 solved, reward: steak, leather, horn
    AddTraderTrigger(".+","Yoos hab smash dem ragmen? Gud! Mes gib yoos stuff mes hab hunt in dat meantime, tasty and gud stuff.");
    AddCondition("qpg","=",8);
    AddCondition("lang","english");
    AddConsequence("qpg","=",9);
    AddConsequence("item",2547,1,333,0);
    AddConsequence("item",2940,1,333,0);
    AddConsequence("item",333,1,533,0);
    AddConsequence("inform","[Quest solved] You are awarded a steak, a piece of leather and a horn. How useful...");
    AddTraderTrigger(".+","Du zermatscht hast die Lumpenmanns? Gutt! Mir gibt dir Zeug, mir erbeutet hat. Lecker und gutt Zeug.");
    AddCondition("qpg","=",8);
    AddConsequence("qpg","=",9);
    AddConsequence("item",2547,1,333,0);
    AddConsequence("item",2940,1,333,0);
    AddConsequence("item",333,1,533,0);
    AddConsequence("inform","[Quest gelöst] Du erhältst ein Steak, ein Stück Leder und ein Horn. Wie praktisch...");
    -- 3rd quest: Kill 10 skeletons
    -- Give out quest 3
    AddTraderTrigger("quest","Cave be much more cozy widout ragmen. But dere sum bonemen, deep in cave. Nub want dwell in same cave as bonemen. Smash as many as yoos can count wid yoos hands!");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",9);
    AddCondition("lang","english");
    AddConsequence("qpg","=",10);
    AddConsequence("inform","[New quest] The Craven Orc III");
    AddTraderTrigger("quest","Höhle viel mehr gemütlich, ohne Lumpenmanns. Aber dort Knochenmanns sind. Tief in Höhle. Mir nix nagn Knochen in selbe Höhle wie Knochnman. Du zerhaust Knochenmans, so viel zu abzählst auf dein Hände.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",9);
    AddConsequence("qpg","=",10);
    AddConsequence("inform","[Neues Quest] Der feige Ork III");
    AddTraderTrigger("task","Cave be much more cozy widout ragmen. But dere sum bonemen, deep in cave. Nub want dwell in same cave as bonemen. Smash as many as yoos can count wid yoos hands!");
    AddAdditionalTrigger("adventure");
    AddCondition("qpg","=",9);
    AddConsequence("qpg","=",10);
    AddConsequence("inform","[New quest] The Craven Orc III");
    AddTraderTrigger("Auftrag","Höhle viel mehr gemütlich, ohne Lumpenmanns. Aber dort Knochenmanns sind. Tief in Höhle. Mir nix nagn Knochen in selbe Höhle wie Knochnman. Du zerhaust Knochenmans, so viel zu abzählst auf dein Hände.");
    AddAdditionalTrigger("Aufgabe");
    AddAdditionalTrigger("Abenteuer");
    AddCondition("qpg","=",9);
    AddConsequence("qpg","=",10);
    AddConsequence("inform","[Neues Quest] Der feige Ork III");
    -- Quest 3 taken but not solved, repeat the instructions
    AddTraderTrigger("quest","Smash dem bones, split dem skulls. One fer each finga op yoos hands. Den clan can move to dat cave, yubba!");
    AddAdditionalTrigger("mission");
    AddCondition("qpg",">",9);
    AddCondition("qpg","<",20);
    AddCondition("lang","english");
    AddTraderTrigger("quest","Zerschlagn da Knochns! Brechn sein Schädls. Eina für jeda Finger auf dein beide Hände. Dann Klan zieht in d' Höhle, yubba!");
    AddAdditionalTrigger("mission");
    AddCondition("qpg",">",9);
    AddCondition("qpg","<",20);
    AddTraderTrigger("task","Smash dem bones, split dem skulls. One fer each finga op yoos hands. Den clan can move to dat cave, yubba!");
    AddAdditionalTrigger("adventure");
    AddCondition("qpg",">",9);
    AddCondition("qpg","<",20);
    AddTraderTrigger("Auftrag","Zerschlagn da Knochns! Brechn sein Schädls. Eina für jeda Finger auf dein beide Hände. Dann Klan zieht in d' Höhle, yubba!");
    AddAdditionalTrigger("Aufgabe");
    AddAdditionalTrigger("Abenteuer");
    AddCondition("qpg",">",9);
    AddCondition("qpg","<",20);
    -- Quest 3 solved, reward:
    AddTraderTrigger(".+","Hurr! Victor-dingy! Clan be save now, yoos hab smash dem bonemen. In dat name op dat chief op dem bonegnawers, mes be makin' yoos friend op clan. Hab dat weapon and armour op clan, yoos deserve dat.");
    AddCondition("qpg","=",20);
    AddCondition("lang","english");
    AddConsequence("qpg","=",21);
    AddConsequence("item",226,1,644,0);
    AddConsequence("item",16,1,644,0);
    AddConsequence("item",362,1,644,0);
    AddConsequence("inform","[Quest solved] You are awarded a warhammer, an orc helmet and a full leather armour. Nice...");
    AddTraderTrigger(".+","Hurr! Sieg-ding! Klan sicher jetzt ist, du zerschlagn d' Knochenmanns. In Name von Häuptling von Knochenbeißer, mirr machen dich zu Freund. Von ganze Klan. Nimmst Waffe und Rüsta von Klan, du verdienen es.");
    AddCondition("qpg","=",20);
    AddConsequence("qpg","=",21);
    AddConsequence("item",226,1,644,0);
    AddConsequence("item",16,1,644,0);
    AddConsequence("item",362,1,644,0);
    AddConsequence("inform","[Quest gelöst] Du erhältst einen Kriegshammer, einen Orkhelm und eine volle Lederrüstung. Nett...");
    -- No more quests, just nice words of gratitude
    AddTraderTrigger("quest","Nub can help mes, yoos. Hab done enuff. Mes gonna bring clan to cave, danks.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",21);
    AddCondition("lang","english");
    AddTraderTrigger("quest","Nix mehr helfn kannst. Getan genug, hast du! Jetz mirr zeigen Klan Weg zu Höhle. Dancke.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",21);
    AddTraderTrigger("task","Nub can help mes, yoos. Hab done enuff. Mes gonna bring clan to cave, danks.");
    AddAdditionalTrigger("adventure");
    AddCondition("qpg","=",21);
    AddTraderTrigger("Auftrag","Nix mehr helfn kannst. Getan genug, hast du! Jetz mirr zeigen Klan Weg zu Höhle. Dancke.");
    AddAdditionalTrigger("Aufgabe");
    AddAdditionalTrigger("Abenteuer");
    AddCondition("qpg","=",21);
    -- Last catch: Think about keyphrases the player might say and that are not caught until here.
    AddTraderTrigger("Yes","Whub want, yoos?");
    AddAdditionalTrigger("yub");
    AddAdditionalText("Whubeva.");
    AddAdditionalText("Mes nub understand whub yoos be meanin'.");
    AddTraderTrigger("Ja","Wat woll, yoos?");
    AddAdditionalText("Watauchimma.");
    AddAdditionalText("Mir nix versteh wat yoos meinen.");
    AddTraderTrigger("No","Nub?");
    AddAdditionalTrigger("nub");
    AddAdditionalText("Why nub?");
    AddAdditionalText("Whubeva.");
    AddTraderTrigger("Nein","Nub?");
    AddAdditionalText("Wieso nub?");
    AddAdditionalText("Watauchimma.");
    -- Cycletext: Add as many random messages as possible
    AddCycleText("Hurr!","Hurr!");
    AddCycleText("Maul halt! Mir nix Angst nix und nixmand!","Shuddup! Mes nub fear anyding!");
    AddCycleText("Gibst, gibst, gibst ne fackel bis nach Mitternacht.","Gimme, gimme, gimme a torch aftur midnight!");
    AddCycleText("Mirr nix früchtet nix Geist!","Mes nub afraid op no ghost!");
    AddCycleText("Mir nix Hilfe braucht. Verjagen Schatten allein!","Want nubbody help mes chase dem shadows away!");
    AddCycleText("Bringen mirr durch Dunkelheit, bis Tag kommt.","Take mes thru dat darkness to dat break op dat day.");
    AddCycleText("Dat Jagdgrund fürr ne Fackl!","A huntin' ground fer a torch!");
    AddCycleText("#me schnüffelt und rotzt auf den Boden.","#me sniffes and spits on the ground.");
    AddCycleText("#me knurrt und bleckt die Zähne.","#me growls and snarls.");
    AddCycleText("#me schlägt zwei Steine gegeneinander und flucht: 'Dat werd Licht!'","#me strikes two stones together and curses: 'Let dere be light!'");
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

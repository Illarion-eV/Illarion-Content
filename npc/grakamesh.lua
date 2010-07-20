-- INSERT INTO npc VALUES (nextval('npc_seq'),4,136,625,0,4,false,'Grakamesh','npc_grakamesh.lua',0);

dofile("npc_autonpcfunctions.lua");

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

    -- Cadomyr, near Sir Reginald's tomb
    SetRadius(0);
    QuestID = 78;
    -- NPC by Estralis Seborian
    -- Grakamesh, the shaman of Cadomyr's orcs
    -- Quest: Sir Reginald's Tomb (bash monsters, Cadomyr noob quest)
    -- Queststatus Overview
    -- 0: No Quest taken
    -- 1: Quest 1 taken - kill 10 mummies, player receives torch
    -- 2-11: Killing 10 mummies
    -- 12: Quest 1 solved, reward: 100cp, +5 rankpoints
    -- 13: Quest 2 taken - kill 5 skulls
    -- 14-18: Killing 5 skull
    -- 19: Quest 2 solved, reward: 100cp, skull staff, +10 rankpoints
    -- 20: Quest 3 taken - kill 1 wraith
    -- 21: Killing 1 wraith
    -- 22: Quest 3 solved, reward: brown priest robe, +20 rankpoints
    -- Debugging
    AddTraderTrigger("set 0","");
    AddConsequence("inform","[Debugging] Quest status set to 0");
    AddConsequence("qpg","=",0);
    AddTraderTrigger(".+","");
    AddCondition("qpg",">",22);
    AddConsequence("inform","[Error] Something went wrong, please inform a developer.");
    -- Help
    AddTraderTrigger("Help","");
    AddConsequence("inform","[Game Help] This NPC is Grakamesh the shaman. Keyphrases: Greebas, quest, tomb, spook, Sir Reginald.");
    AddTraderTrigger("Hilfe","");
    AddConsequence("inform","[Spielhilfe] Dieser NPC ist der Schamane Grakamesh. Schlüsselwörter: Greebas, Quest, Gruft, Spuk, Sir Reginald.");
    -- General speech
    AddTraderTrigger("Hello","Greebas. Honour dem dead!");
    AddAdditionalTrigger("Greetings");
    AddAdditionalTrigger("Be greeted");
    AddAdditionalTrigger("Greet");
    AddAdditionalTrigger("Hail");
    AddAdditionalTrigger("Good day");
    AddAdditionalTrigger("Good morning");
    AddAdditionalTrigger("Good evening");
    AddAdditionalText("Hurr! Yoos look like yoos can help mes - mes dance fer salvation.");
    AddAdditionalText("Greebs. Nub hab much time fer yoos, need to dance and sing more to scare away evil spook.");
    AddTraderTrigger("Grüße","GERMAN1.");
    AddAdditionalTrigger("Gruß");
    AddAdditionalTrigger("Seid gegrüßt");
    AddAdditionalTrigger("Guten Tag");
    AddAdditionalTrigger("Guten Abend");
    AddAdditionalTrigger("Mahlzeit");
    AddAdditionalTrigger("Tach");
    AddAdditionalTrigger("Moin");
    AddAdditionalTrigger("mit dir");
    AddAdditionalText("GERMAN2.");
    AddAdditionalText("GERMAN3.");
    AddTraderTrigger("Hiho","Greebas. Honour dem dead!");
    AddAdditionalTrigger("Hallo");
    AddAdditionalTrigger("Hey");
    AddAdditionalTrigger("Greebas");
    AddAdditionalTrigger("Greebs");
    AddCondition("lang","english");
    AddAdditionalText("Hurr! Yoos look like yoos can help mes - mes dance fer salvation.");
    AddAdditionalText("Greebs. Nub hab much time fer yoos, need to dance and sing more to scare away evil spook.");
    AddTraderTrigger("Hiho","GERMAN1.");
    AddAdditionalTrigger("Hallo");
    AddAdditionalTrigger("Hey");
    AddAdditionalTrigger("Greebas");
    AddAdditionalTrigger("Greebs");
    AddCondition("lang","german");
    AddAdditionalText("GERMAN2.");
    AddAdditionalText("GERMAN3.");
    AddTraderTrigger("Farewell","Farebbas! Pray fer old oomie chief, Reginald, will yoos?");
    AddAdditionalTrigger("Good bye");
    AddAdditionalTrigger("Bye");
    AddAdditionalTrigger("Fare thee well");
    AddAdditionalText("Gud hunt!");
    AddAdditionalText("Can yoos bring me sum banana when come back? Danks in advance.");
    AddTraderTrigger("Tschüß","GERMAN1.");
    AddAdditionalTrigger("Tschüss");
    AddAdditionalTrigger("Wiedersehen");
    AddAdditionalTrigger("Gehabt euch wohl");
    AddAdditionalText("GERMAN2.");
    AddAdditionalText("GERMAN3.");
    AddTraderTrigger("Ciao","Farebbas! Pray fer old oomie chief, Reginald, will yoos?");
    AddAdditionalTrigger("Adieu");
    AddAdditionalTrigger("Au revoir");
    AddAdditionalTrigger("Farebba");
    AddAdditionalTrigger("See you");
    AddCondition("lang","english");
    AddAdditionalText("Gud hunt!");
    AddAdditionalText("Can yoos bring me sum banana when come back? Danks in advance.");
    AddTraderTrigger("Ciao","GERMAN1.");
    AddAdditionalTrigger("Adieu");
    AddAdditionalTrigger("Au revoir");
    AddAdditionalTrigger("Farebba");
    AddAdditionalTrigger("See you");
    AddAdditionalText("GERMAN2.");
    AddAdditionalText("GERMAN3.");
    AddTraderTrigger("How are you","Dem gods, dey will hear mes singin'. Mes gottur dance and sing to scare away spook from old oomie chief tomb.");
    AddAdditionalTrigger("How feel");
    AddAdditionalTrigger("How do you do");
    AddAdditionalText("Mes feel like dancin'.");
    AddAdditionalText("Danks, but mes feel much better if all spook be smashed and Reginald oomie can rest in dat peace.");
    AddTraderTrigger("Wie geht","GERMAN1.");
    AddAdditionalTrigger("Wie fühlst");
    AddAdditionalTrigger("Wie ist es ergangen");
    AddAdditionalTrigger("Wie Befinden");
    AddAdditionalText("GERMAN2.");
    AddAdditionalText("GERMAN3.");
    AddTraderTrigger("your name","Me dat shaman Grakamesh. Mes now lotsa about stuff and spook.");
    AddAdditionalTrigger("who are you");
    AddAdditionalTrigger("who art thou");
    AddAdditionalText("Grakamesh, dat shaman, at yoos service... after mes hab dance.");
    AddAdditionalText("Hurr, Grakamesh mes be!");
    AddTraderTrigger("dein name","GERMAN1.");
    AddAdditionalTrigger("wer bist du");
    AddAdditionalTrigger("wer seid ihr");
    AddAdditionalTrigger("wie heißt");
    AddAdditionalText("GERMAN2.");
    AddAdditionalText("GERMAN3.");
    -- Catching typical NPC phrases
    AddTraderTrigger("what sell","Whub! Mes nub trade, mes dance and pray. Mes be shaman, nub hawker.");
    AddAdditionalTrigger("what buy");
    AddAdditionalTrigger("list wares");
    AddAdditionalTrigger("price of");
    AddTraderTrigger("was verkauf","GERMAN1.");
    AddAdditionalTrigger("was kauf");
    AddAdditionalTrigger("warenliste");
    AddAdditionalTrigger("preis von");
    AddAdditionalText("GERMAN2.");
    AddAdditionalText("GERMAN3.");
    AddTraderTrigger("tell something","Hab hear dat legend op Reginald oomie? Dat be old chief op Cadomyr. Honourable oomie. Died and now daughter be queen - uncommen, eh?");
    AddTraderTrigger("erzähl was","GERMAN1.");
    AddAdditionalTrigger("erzähl etwas");
    AddAdditionalText("GERMAN2.");
    AddAdditionalText("GERMAN3.");
    -- Small talk: The talk here should focus on possible questions. Feel free to add more!
    AddTraderTrigger("profession","Me be Grakamesh, dat shaman op Cadomyr. Mes dance fer fallen ones.");
    AddTraderTrigger("beruf","GERMAN1.");
    AddAdditionalText("GERMAN2.");
    AddAdditionalText("GERMAN3.");
    AddTraderTrigger("job","Me be Grakamesh, dat shaman op Cadomyr. Mes dance fer fallen ones.");
    AddCondition("lang","english");
    AddTraderTrigger("job","GERMAN1.");
    AddAdditionalText("GERMAN2.");
    AddAdditionalText("GERMAN3.");
    AddTraderTrigger("Gobaith","Neva hab hear op dat place, sorries.");
    AddAdditionalTrigger("Gobiath");
    AddCondition("lang","english");
    AddTraderTrigger("Gobaith","GERMAN1.");
    AddAdditionalTrigger("Gobiath");
    AddAdditionalText("GERMAN2.");
    AddAdditionalText("GERMAN3.");
    AddTraderTrigger("I am","And me be Grakamesh. Mes shaman op tribe op Cadomyr orcis. Dancin' fer fallen, dat mes be doin'.");
    AddAdditionalTrigger("my name");
    AddTraderTrigger("Ich bin","GERMAN1.");
    AddAdditionalTrigger("mein Name");
    AddAdditionalText("GERMAN2.");
    AddAdditionalText("GERMAN3.");
    -- More small talk; add at least five triggers
    AddTraderTrigger("shaman","Yubba, mes be shaman. Mes be prayin' fer fallen oomies. So dem can rest in peace.");
    AddAdditionalText("Shaman be important member op orc society. Shaman be religious leader! Me be shaman!");
    AddAdditionalText("Whub want know about shamans? Mes be shaman. Can answer, mes dink.");
    AddTraderTrigger("tomb","Dat da behind mes, dat be tomb of Reginald Edwards. Mes dance so that spook goes away, but nub avail.");
    AddTraderTrigger("Reginald,english","Old oomie chief dat be. He be buried here, in dat tomb over dere. But dat haunts dere!");
    AddAdditionalText("Mes was present when dat old oomie chief was buried. Mes gib blessings! But blessings... nub hab work. Dat haunts!");
    AddTraderTrigger("haunt","Tomb op old oomie chief, Reginald, dere dat haunts. Will yoos do task fer mes?");
    AddAdditionalTrigger("spook");
    AddAdditionalTrigger("ghost");
    AddAdditionalTrigger("wraith");
    AddTraderTrigger("orc","Orc society complicated. Mes nub dink dat everyone understand. Shaman dance important fer society and afterlife.");
    AddTraderTrigger("dance","Dat dance mes be dancin', dat be dance op death. When fallen ones nub can rest in peace, dancin' is all dat helps.");
    AddAdditionalTrigger("salvation");
    AddTraderTrigger("Hastings","Hurr! Hastings oomie must be responsible fer spook. Dat be illoyal, honourless oomie! Plans evil dings all day long.");
    AddAdditionalTrigger("Baron");
    AddCondition("lang","english");
    AddTraderTrigger("Schamane","GERMAN1.");
    AddAdditionalText("GERMAN2.");
    AddAdditionalText("GERMAN3.");
    AddTraderTrigger("Gruft","GERMAN1.");
    AddAdditionalText("GERMAN2.");
    AddAdditionalText("GERMAN3.");
    AddTraderTrigger("Reginald","GERMAN1.");
    AddAdditionalText("GERMAN2.");
    AddAdditionalText("GERMAN3.");
    AddTraderTrigger("Spuk","GERMAN1.");
    AddAdditionalTrigger("Geist");
    AddAdditionalTrigger("Gespenst");
    AddAdditionalText("GERMAN2.");
    AddAdditionalText("GERMAN3.");
    AddTraderTrigger("Ork","GERMAN1.");
    AddAdditionalText("GERMAN2.");
    AddAdditionalText("GERMAN3.");
    AddTraderTrigger("Tanz","GERMAN");
    AddAdditionalTrigger("Erlösung");
    AddTraderTrigger("Hasting","");
    AddAdditionalTrigger("Baron");
    -- Faction stuff
    AddTraderTrigger("Elvaine","Yag!");
    AddAdditionalTrigger("Morgan");
    AddAdditionalTrigger("archmage");
    AddAdditionalTrigger("Erzmagier");
    AddCondition("lang","english");
    AddAdditionalText("Dat majik treehugger op Runewick nub be gud. Nub honour orcis, nub honour dem gods!");
    AddTraderTrigger("Elvaine","Yag!");
    AddAdditionalTrigger("Morgan");
    AddAdditionalTrigger("archmage");
    AddAdditionalTrigger("Erzmagier");
    AddAdditionalText("GERMAN2.");
    AddAdditionalText("GERMAN3.");
    AddTraderTrigger("Runewick","Nub hab faith in dat town op Runewick. But impressive big tents dey hab. When nub dance enuff, gods will smash tents, mes dink.");
    AddCondition("lang","english");
    AddTraderTrigger("Runewick","GERMAN1.");
    AddAdditionalText("GERMAN2.");
    AddAdditionalText("GERMAN3.");
    AddTraderTrigger("Valerio","Groar!");
    AddAdditionalTrigger("Guilianni");
    AddAdditionalTrigger("Don");
    AddCondition("lang","english");
    AddAdditionalText("Grrr!");
    AddTraderTrigger("Valerio","Groar!");
    AddAdditionalTrigger("Guilianni");
    AddAdditionalTrigger("Don");
    AddAdditionalText("Grrr!");
    AddTraderTrigger("Galmair","Dem radur stoopid in Galmair. Dey nub understand how important faith be. Dey just pray to gold, like dem stumpies.");
    AddCondition("lang","english");
    AddTraderTrigger("Galmair","GERMAN1.");
    AddAdditionalText("GERMAN2.");
    AddAdditionalText("GERMAN3.");
    AddTraderTrigger("rosaline","Dat female hab respect fer orcis. Orcis proud and hab honour. Dem orcis loyal to queen!");
    AddAdditionalTrigger("königin");
    AddAdditionalTrigger("queen");
    AddAdditionalTrigger("edwards");
    AddCondition("lang","english");
    AddTraderTrigger("rosaline","GERMAN1.");
    AddAdditionalTrigger("königin");
    AddAdditionalTrigger("queen");
    AddAdditionalTrigger("edwards");
    AddAdditionalText("GERMAN2.");
    AddAdditionalText("GERMAN3.");
    AddTraderTrigger("Cadomyr","Cadomyr be gud place fer orc warriors. All hab faith in dem gods and all hab honour. Like dat should be!");
    AddCondition("lang","english");
    AddTraderTrigger("Cadomyr","GERMAN1.");
    AddAdditionalText("GERMAN2.");
    AddAdditionalText("GERMAN3.");
    -- Main land factions
    AddTraderTrigger("albar","Many oomies op Cadomyr be from Albar. Nub know whub dat fer place, but if dat like Cadomyr, den dat gud place fer orc warriors. Even though oomies hab tell me dat nub true....");
    AddCondition("lang","english");
    AddTraderTrigger("albar","GERMAN1.");
    AddCondition("lang","german");
    AddAdditionalText("GERMAN2.");
    AddAdditionalText("GERMAN3.");
    AddTraderTrigger("gynk","Gynk place widout honour! Nub go dere, neva. When sumbody challenge yoos fer duell, den neva can be sure dat udder oomie nub backstab yoos.");
    AddAdditionalTrigger("gync");
    AddCondition("lang","english");
    AddTraderTrigger("gync","GERMAN1.");
    AddAdditionalTrigger("gynk");
    AddCondition("lang","german");
    AddAdditionalText("GERMAN2.");
    AddAdditionalText("GERMAN3.");
    AddTraderTrigger("salkama","Ah, mes hab hear lotsa about dat Salkamar. Proud realm, dat be. Mes dink also gud hunting dere.");
    AddCondition("lang","english");
    AddTraderTrigger("salkama","GERMAN1.");
    AddCondition("lang","german");
    AddAdditionalText("GERMAN2.");
    AddAdditionalText("GERMAN3.");
    -- Gods - use the triggers of the god the NPC worships or fights
    AddTraderTrigger("god","Dere be lotsa gods, more den Grakamesh hab fingers. Mes honour dem all, but mes heart beats fer Brágon, god op fire, alone.");
    AddTraderTrigger("Gott","GERMAN1.");
    AddAdditionalTrigger("Götter");
    AddAdditionalText("GERMAN2.");
    AddAdditionalText("GERMAN3.");
    AddTraderTrigger("Bragon","Brágon is dat lord and dat everyding. Brágon is creator! Look around, creator of whub yoos see, dat be Brágon.");
    AddAdditionalTrigger("Brágon");
    AddCondition("lang","english");
    AddTraderTrigger("Bragon","GERMAN1.");
    AddAdditionalTrigger("Brágon");
    AddAdditionalText("GERMAN2.");
    AddAdditionalText("GERMAN3.");
    AddTraderTrigger("Cherga","Mes dance fer pleasin' Cherga, dat mes be doin'. Cherga be lady of afterlife. And yoos and mes, both will go afterlife one day, nub? Nub mess wid Cherga!");
    AddCondition("lang","english");
    AddTraderTrigger("Cherga","GERMAN1.");
    AddAdditionalText("GERMAN2.");
    AddAdditionalText("GERMAN3.");
    AddTraderTrigger("Malachin","So, yoos dink dat all orcis dat nub pray to dat Moshran pray to dat Malachín? Yoos hab lotsa learn, yoos hab.");
    AddAdditionalTrigger("Malachín");
    AddCondition("lang","english");
    AddTraderTrigger("Malachin","GERMAN1.");
    AddAdditionalTrigger("Malachín");
    AddAdditionalText("GERMAN2.");
    AddAdditionalText("GERMAN3.");
    AddTraderTrigger("Moshran","Yoos dink dem orcis all pray to dat Moshran? Yoos hab lotsa learn, yoos hab.");
    AddCondition("lang","english");
    AddTraderTrigger("Moshran","GERMAN1.");
    AddAdditionalText("GERMAN2.");
    AddAdditionalText("GERMAN3.");
    -- 1st quest: Kill 10 mummies, player receives torch.
    -- Give out quest 1 and a torch
    AddTraderTrigger("quest","So, nub can dance but want help mes? Reginald oomie nub can rest in peace. Scary mummies haunt tomb, dey moan all day long. Hab dis torch and smash as many as mes hab fingers!");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",0);
    AddCondition("lang","english");
    AddConsequence("qpg","=",1);
    AddConsequence("item",391,1,399,0);
    AddConsequence("inform","[New quest] Sir Reginald's Tomb I");
    AddTraderTrigger("quest","GERMAN.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",0);
    AddConsequence("qpg","=",1);
    AddConsequence("item",391,1,399,0);
    AddConsequence("inform","[Neues Quest] Sir Reginalds Gruft I");
    AddTraderTrigger("task","So, nub can dance but want help mes? Reginald oomie nub can rest in peace. Scary mummies haunt tomb, dey moan all day long. Hab dis torch and smash as many as mes hab fingers!");
    AddAdditionalTrigger("adventure");
    AddCondition("qpg","=",0);
    AddConsequence("qpg","=",1);
    AddConsequence("item",391,1,399,0);
    AddConsequence("inform","[New quest] Sir Reginald's Tomb I");
    AddTraderTrigger("Auftrag","GERMAN.");
    AddAdditionalTrigger("Aufgabe");
    AddAdditionalTrigger("Abenteuer");
    AddCondition("qpg","=",0);
    AddConsequence("qpg","=",1);
    AddConsequence("item",391,1,399,0);
    AddConsequence("inform","[Neues Quest] Sir Reginalds Gruft I");
    -- Quest 1 taken but not solved, repeat the instructions
    AddTraderTrigger("quest","Dere be lotsa mummies dat haunt tomb op Reginald oomie. Dat be so respectless! Beat dem up so Reginald oomie can rest in peace.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg",">",0);
    AddCondition("qpg","<",11);
    AddCondition("lang","english");
    AddTraderTrigger("quest","GERMAN.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg",">",0);
    AddCondition("qpg","<",11);
    AddTraderTrigger("task","Dere be lotsa mummies dat haunt tomb op Reginald oomie. Dat be so respectless! Beat dem up so Reginald oomie can rest in peace.");
    AddAdditionalTrigger("adventure");
    AddCondition("qpg",">",0);
    AddCondition("qpg","<",11);
    AddTraderTrigger("Auftrag","GERMAN.");
    AddAdditionalTrigger("Aufgabe");
    AddAdditionalTrigger("Abenteuer");
    AddCondition("qpg",">",0);
    AddCondition("qpg","<",11);
    -- Quest 1 solved, reward: 100cp, +5 rankpoints
    AddTraderTrigger(".+","Gud! Yoos hab smash hauntin' mummies. Here, hab sum shinies - but mission to let Reginald oomie rest in peace nub completed...");
    AddCondition("qpg","=",11);
    AddCondition("lang","english");
    AddCondition("town","=","cadomyr");
    AddConsequence("qpg","=",12);
    AddConsequence("rankpoints","cadomyr","+",5);
    AddConsequence("money","+",100);
    AddConsequence("inform","[Quest solved] You are awarded 100 copper coins. You advance in Queen Rosaline Edwards' favour.");
    AddTraderTrigger(".+","Gud! Yoos hab smash hauntin' mummies. Here, hab sum shinies - but mission to let Reginald oomie rest in peace nub completed...");
    AddCondition("qpg","=",11);
    AddCondition("lang","english");
    AddConsequence("qpg","=",12);
    AddConsequence("money","+",100);
    AddConsequence("inform","[Quest solved] You are awarded 100 copper coins.");
    AddTraderTrigger(".+","GERMAN.");
    AddCondition("qpg","=",11);
    AddCondition("town","=","cadomyr");
    AddConsequence("qpg","=",12);
    AddConsequence("rankpoints","cadomyr","+",5);
    AddConsequence("money","+",100);
    AddConsequence("inform","[Quest gelöst] Du erhältst 100 Kupferstücke. Dein Ansehen bei Königin Rosaline Edwards steigt.");
    AddTraderTrigger(".+","GERMAN.");
    AddCondition("qpg","=",11);
    AddConsequence("qpg","=",12);
    AddConsequence("money","+",100);
    AddConsequence("inform","[Quest gelöst] Du erhältst 100 Kupferstücke.");
    -- 2nd quest: Kill 5 skulls
    -- Give out quest 2
    AddTraderTrigger("quest","Hab seen dem floating skulls in dat tomb? Dey be evil ghosts dat desecrate grave op honourable old oomie chief. Crush one hand op finger op dem!");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",12);
    AddCondition("lang","english");
    AddConsequence("qpg","=",13);
    AddConsequence("inform","[New quest] Sir Reginald's Tomb II");
    AddTraderTrigger("quest","GERMAN.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",12);
    AddConsequence("qpg","=",13);
    AddConsequence("inform","[Neues Quest] Sir Reginalds Gruft II");
    AddTraderTrigger("task","Hab seen dem floating skulls in dat tomb? Dey be evil ghosts dat desecrate grave op honourable old oomie chief. Crush one hand op finger op dem!");
    AddAdditionalTrigger("adventure");
    AddCondition("qpg","=",12);
    AddConsequence("qpg","=",13);
    AddConsequence("inform","[New quest] Sir Reginald's Tomb II");
    AddTraderTrigger("Auftrag","GERMAN.");
    AddAdditionalTrigger("Aufgabe");
    AddAdditionalTrigger("Abenteuer");
    AddCondition("qpg","=",12);
    AddConsequence("qpg","=",13);
    AddConsequence("inform","[Neues Quest] Sir Reginalds Gruft II");
    -- Quest 2 taken but not solved, repeat the instructions
    AddTraderTrigger("quest","Dem evil skulls still haunt dat tomb op old oomie chief. Dat be... blasphemy! Bring peace to tomb, smash 'em.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg",">",12);
    AddCondition("qpg","<",18);
    AddCondition("lang","english");
    AddTraderTrigger("quest","GERMAN.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg",">",12);
    AddCondition("qpg","<",18);
    AddTraderTrigger("task","Dem evil skulls still haunt dat tomb op old oomie chief. Dat be... blasphemy! Bring peace to tomb, smash 'em.");
    AddAdditionalTrigger("adventure");
    AddCondition("qpg",">",12);
    AddCondition("qpg","<",18);
    AddTraderTrigger("Auftrag","GERMAN.");
    AddAdditionalTrigger("Aufgabe");
    AddAdditionalTrigger("Abenteuer");
    AddCondition("qpg",">",12);
    AddCondition("qpg","<",18);
    -- Quest 2 solved, reward: 100cp, ITEM, +10 rankpoints
    AddTraderTrigger(".+","Great! Yoos hab split evil skulls, dem nub gonna haunt anymore. Here, hab dis staff fer more skull smashin'!");
    AddCondition("qpg","=",18);
    AddCondition("lang","english");
    AddCondition("town","=","cadomyr");
    AddConsequence("qpg","=",19);
    AddConsequence("rankpoints","cadomyr","+",10);
    AddConsequence("money","+",100);
    AddConsequence("item",39,1,599,0);
    AddConsequence("inform","[Quest solved] You are awarded 100 copper coins and a skull staff. You advance in Queen Rosaline Edwards' favour.");
    AddTraderTrigger(".+","Great! Yoos hab split evil skulls, dem nub gonna haunt anymore. Here, hab dis staff fer more skull smashin'!");
    AddCondition("qpg","=",18);
    AddCondition("lang","english");
    AddConsequence("qpg","=",19);
    AddConsequence("money","+",100);
    AddConsequence("item",39,1,599,0);
    AddConsequence("inform","[Quest solved] You are awarded 100 copper coins and a skull staff.");
    AddTraderTrigger(".+","GERMAN.");
    AddCondition("qpg","=",18);
    AddCondition("town","=","cadomyr");
    AddConsequence("qpg","=",19);
    AddConsequence("rankpoints","cadomyr","+",10);
    AddConsequence("money","+",100);
    AddConsequence("item",39,1,599,0);
    AddConsequence("inform","[Quest gelöst] Du erhältst 100 Kupferstücke und einen Schädelstab. Dein Ansehen bei Königin Rosaline Edwards steigt.");
    AddTraderTrigger(".+","GERMAN.");
    AddCondition("qpg","=",18);
    AddConsequence("qpg","=",19);
    AddConsequence("money","+",100);
    AddConsequence("item",39,1,599,0);
    AddConsequence("inform","[Quest gelöst] Du erhältst 100 Kupferstücke und einen Schädelstab.");
    -- 3rd quest: Kill 1 wraith
    -- Give out quest 3
    AddTraderTrigger("quest","Cherga hab shown mes origin of all spook while dancin'. Dere be restless ghost op foe op Reginald oomie, hauntin' in tomb, want take revenge or sumding. Banish dat and Reginald hab peace.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",19);
    AddCondition("lang","english");
    AddConsequence("qpg","=",20);
    AddConsequence("inform","[New quest] Sir Reginald's Tomb III");
    AddTraderTrigger("quest","GERMAN.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",19);
    AddConsequence("qpg","=",20);
    AddConsequence("inform","[Neues Quest] Sir Reginalds Gruft III");
    AddTraderTrigger("task","Cherga hab shown mes origin of all spook while dancin'. Dere be restless ghost op foe op Reginald oomie, hauntin' in tomb, want take revenge or sumding. Banish dat and Reginald hab peace.");
    AddAdditionalTrigger("adventure");
    AddCondition("qpg","=",19);
    AddConsequence("qpg","=",20);
    AddConsequence("inform","[New quest] Sir Reginald's Tomb III");
    AddTraderTrigger("Auftrag","GERMAN.");
    AddAdditionalTrigger("Aufgabe");
    AddAdditionalTrigger("Abenteuer");
    AddCondition("qpg","=",19);
    AddConsequence("qpg","=",20);
    AddConsequence("inform","[Neues Quest] Sir Reginalds Gruft III");
    -- Quest 3 taken but not solved, repeat the instructions
    AddTraderTrigger("quest","Mes still feel evil presence op ghost op foe op old chief op Cadomyr. Expel dat from plane op mortals!");
    AddAdditionalTrigger("mission");
    AddCondition("qpg",">",19);
    AddCondition("qpg","<",21);
    AddCondition("lang","english");
    AddTraderTrigger("quest","GERMAN.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg",">",19);
    AddCondition("qpg","<",21);
    AddTraderTrigger("task","Mes still feel evil presence op ghost op foe op old chief op Cadomyr. Expel dat from plane op mortals!");
    AddAdditionalTrigger("adventure");
    AddCondition("qpg",">",19);
    AddCondition("qpg","<",21);
    AddTraderTrigger("Auftrag","GERMAN.");
    AddAdditionalTrigger("Aufgabe");
    AddAdditionalTrigger("Abenteuer");
    AddCondition("qpg",">",19);
    AddCondition("qpg","<",21);
    -- Quest 3 solved, reward: VERY NICE ITEM, +20 rankpoints
    AddTraderTrigger(".+","Awesome, yoos hab do dat! Now old oomie chief Reginald can rest in peace... fer a time. Mes hab reward fer yoos, robe op ghost buster.");
    AddCondition("qpg","=",21);
    AddCondition("lang","english");
    AddCondition("town","=","cadomyr");
    AddConsequence("qpg","=",22);
    AddConsequence("rankpoints","cadomyr","+",20);
    AddConsequence("item",2416,1,799,0);
    AddConsequence("inform","[Quest solved] You are awarded a brown priest robe. You advance in Queen Rosaline Edwards' favour.");
    AddTraderTrigger(".+","Awesome, yoos hab do dat! Now old oomie chief Reginald can rest in peace... fer a time. Mes hab reward fer yoos, robe op ghost buster.");
    AddCondition("qpg","=",21);
    AddCondition("lang","english");
    AddConsequence("qpg","=",22);
    AddConsequence("item",2416,1,799,0);
    AddConsequence("inform","[Quest solved] You are awarded a brown priest robe.");
    AddTraderTrigger(".+","GERMAN.");
    AddCondition("qpg","=",21);
    AddCondition("town","=","cadomyr");
    AddConsequence("qpg","=",22);
    AddConsequence("item",2416,1,799,0);
    AddConsequence("rankpoints","cadomyr","+",20);
    AddConsequence("inform","[Quest gelöst] Du erhältst eine braune Priesterrobe. Dein Ansehen bei Königin Rosaline Edwards steigt.");
    AddTraderTrigger(".+","GERMAN.");
    AddCondition("qpg","=",21);
    AddConsequence("qpg","=",22);
    AddConsequence("item",2416,1,799,0);
    AddConsequence("inform","[Quest gelöst] Du erhältst eine braune Priesterrobe.");
    -- No more quests, just nice words of gratitude
    AddTraderTrigger("quest","Danks fer everyding yoos hab do. Reginald oomie can now rest in peace. Until Hastings oomie does next mischief!.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",22);
    AddCondition("lang","english");
    AddTraderTrigger("quest","GERMAN.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",22);
    AddTraderTrigger("task","Danks fer everyding yoos hab do. Reginald oomie can now rest in peace. Until Hastings oomie does next mischief!.");
    AddAdditionalTrigger("adventure");
    AddCondition("qpg","=",22);
    AddTraderTrigger("Auftrag","GERMAN.");
    AddAdditionalTrigger("Aufgabe");
    AddAdditionalTrigger("Abenteuer");
    AddCondition("qpg","=",22);
    -- Easteregg (optional): Think about a funny, unrelated trigger with a surprising answer
    AddTraderTrigger("nvidia","Dem nub like Ati, mes dink!");
    AddCondition("lang","english");
    AddTraderTrigger("nvidia","GERMAN1.");
    AddAdditionalText("GERMAN2.");
    AddAdditionalText("GERMAN3.");
    AddTraderTrigger("Mulder","Dat be pretty spooky, too.");
    AddCondition("lang","english");
    AddTraderTrigger("Mulder","GERMAN");
    -- Last catch: Think about keyphrases the player might say and that are not caught until here.
    AddTraderTrigger("Yes","#me starts to dance wildly.");
    AddAdditionalText("#me grunts: 'Whub?'");
    AddAdditionalText("Whub?.");
    AddTraderTrigger("Ja","GERMAN1.");
    AddAdditionalText("GERMAN2.");
    AddAdditionalText("GERMAN3.");
    AddTraderTrigger("No","Whub now?");
    AddAdditionalText("#me stomps on the ground rhythmically.");
    AddAdditionalText("Mes gottur dance more fer old oomie chief hab peace again.");
    AddTraderTrigger("Nein","GERMAN1.");
    AddAdditionalText("GERMAN2.");
    AddAdditionalText("GERMAN3.");
    -- Cycletext: Add as many random messages as possible
    AddCycleText("#me schüttelt eine Rassel und beginnt zu singen.","#me starts to rattle and sings.");
    AddCycleText("#me beginnt unrhythmisch zu tanzen.","#me starts to dance unrhythmically.");
    AddCycleText("GERMAN1.","#me slams his hands on a drum, singing: 'Heya, heya! Heya, heya!'");
    AddCycleText("Hurrda, hurrda! Hurrda, hurrda!","Hurrda, hurrda! Hurrda, hurrda!");
    AddCycleText("Waka, waka, eh, eh!","Waka, waka, eh, eh!");
    AddCycleText("GERMAN1.","Mes feel like dancin', dancin', even if mes find sumding better to do.");
    AddCycleText("GERMAN1.","Mes be your faithful dancer, a dancer fer gods, do whub yoos want me to do.");
    AddCycleText("GERMAN1.","Dere be spook in tomb! Come, dance wid mes to banish dat!");
    AddCycleText("GERMAN1.","#me exhales loudly.");
    AddCycleText("GERMAN1.","#me dances a wild, uncoordinated dance, singing unintelligible.");
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
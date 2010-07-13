-- INSERT INTO npc VALUES (nextval('npc_seq'),2,784,772,0,4,false,'Myrthe Mildthorn','npc_myrthe_mildthorn.lua',1);

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

    -- Runewick homeland
    QuestID = 79;
    -- NPC by Estralis Seborian
    -- Myrthe Mildthorn, a washer-woman
    -- Quest: A cave in the Woods (79)
    -- Queststatus Overview
    -- 0: No Quest taken
    -- 1: Quest 1 taken - kill 10 wolves, player receives torch
    -- 2-11: Killing 10 wolves
    -- 12: Quest 1 solved, reward: 100cp, +5 rankpoints
    -- 13: Quest 2 taken - kill 5 panthers
    -- 14-18: Killing 5 panthers
    -- 19: Quest 2 solved, reward: 100cp, yellow robe, +10 rankpoints
    -- 20: Quest 3 taken - kill 1 spider
    -- 21: Killing 1 spider
    -- 22: Quest 3 solved, reward: ITEM2, +20 rankpoints
    -- Help
    AddTraderTrigger("Help","");
    AddConsequence("inform","[Game Help] This NPC is the washer-woman Myrthe Mildthorn. Keyphrases: Hello, laundry, cave, quest.");
    AddTraderTrigger("Hilfe","");
    AddConsequence("inform","[Spielhilfe] Dieser NPC ist das Waschweib Myrthe Mildthorn. Schlüsselwörter: Hallo, Wäsche, Höhle, Quest.");
    -- General speech
    AddTraderTrigger("Hello","Oh, hello, got laundry? Excuse me, I thought you're one of my customers.");
    AddAdditionalTrigger("Greetings");
    AddAdditionalTrigger("Be greeted");
    AddAdditionalTrigger("Hail");
    AddAdditionalTrigger("Good day");
    AddAdditionalTrigger("Good morning");
    AddAdditionalTrigger("Good evening");
    AddAdditionalText("#me looks up from her washing board and replies: 'Hiho! Didn't I see you yesterday at the Anthil brook?");
    AddAdditionalText("Hiho! How can I help you?");
    AddTraderTrigger("Grüße","Oh, hallo, habt ihr Schmutzwäsche? Entschuldigt, ich dachte, ihr seid einer meiner Kunden.");
    AddAdditionalTrigger("Gruß");
    AddAdditionalTrigger("Seid gegrüßt");
    AddAdditionalTrigger("Guten Tag");
    AddAdditionalTrigger("Guten Abend");
    AddAdditionalTrigger("Mahlzeit");
    AddAdditionalTrigger("Tach");
    AddAdditionalTrigger("Moin");
    AddAdditionalText("#me schaut von ihrem Waschbrett auf und erwidert: 'Hiho! Hab ich euch nicht gestern erst am Bach Anthil gesehen?");
    AddAdditionalText("Hiho! Wie kann ich euch helfen?");
    AddTraderTrigger("Hiho","Oh, hello, got laundry? Excuse me, I thought you're one of my customers.");
    AddAdditionalTrigger("Hallo");
    AddAdditionalTrigger("Hey");
    AddAdditionalTrigger("Greebas");
    AddAdditionalTrigger("Greebs");
    AddCondition("lang","english");
    AddAdditionalText("#me looks up from her washing board and replies: 'Hiho! Didn't I see you yesterday at the Anthil brook?");
    AddAdditionalText("Hiho! How can I help you?");
    AddTraderTrigger("Hiho","Oh, hallo, habt ihr Schmutzwäsche? Entschuldigt, ich dachte, ihr seid einer meiner Kunden.");
    AddAdditionalTrigger("Hallo");
    AddAdditionalTrigger("Hey");
    AddAdditionalTrigger("Greebas");
    AddAdditionalTrigger("Greebs");
    AddCondition("lang","german");
    AddAdditionalText("#me schaut von ihrem Waschbrett auf und erwidert: 'Hiho! Hab ich euch nicht gestern erst am Bach Anthil gesehen?");
    AddAdditionalText("Hiho! Wie kann ich euch helfen?");
    AddTraderTrigger("Farewell","Farewell! If your clothes get dirty, just come back to me, will you?");
    AddAdditionalTrigger("Good bye");
    AddAdditionalTrigger("Bye");
    AddAdditionalTrigger("Fare thee well");
    AddAdditionalText("Oh, you have to leave? I do not feel comfortable here, all alone.");
    AddAdditionalText("Ah, I look forward to meet you again.");
    AddTraderTrigger("Tschüß","Gehabt euch wohl! Wenn eure Kleidung dreckig wird, kommt einfach zu mir zurück, ja?");
    AddAdditionalTrigger("Tschüss");
    AddAdditionalTrigger("Wiedersehen");
    AddAdditionalTrigger("Gehabt euch wohl");
    AddAdditionalText("Oh, ihr müßt gehen? Ich fühl mich gar nicht wohl, so ganz alleine.");
    AddAdditionalText("Ah, ich freu mich schon darauf, euch wiederzusehen.");
    AddTraderTrigger("Ciao","Farewell! If your clothes get dirty, just come back to me, will you?");
    AddAdditionalTrigger("Adieu");
    AddAdditionalTrigger("Au revoir");
    AddCondition("lang","english");
    AddAdditionalText("Oh, you have to leave? I do not feel comfortable here, all alone.");
    AddAdditionalText("Ah, I look forward to meet you again.");
    AddTraderTrigger("Ciao","Gehabt euch wohl! Wenn eure Kleidung dreckig wird, kommt einfach zu mir zurück, ja?");
    AddAdditionalTrigger("Adieu");
    AddAdditionalTrigger("Au revoir");
    AddCondition("lang","german");
    AddAdditionalText("Oh, ihr müßt gehen? Ich fühl mich gar nicht wohl, so ganz alleine.");
    AddAdditionalText("Ah, ich freu mich schon darauf, euch wiederzusehen.");
    AddTraderTrigger("How are you","I feel... clean!");
    AddAdditionalTrigger("How feel");
    AddAdditionalTrigger("How do you do");
    AddAdditionalText("Oh, I am so worried, maybe you can help me.");
    AddAdditionalText("Afraid!");
    AddTraderTrigger("Wie geht","Mir geht es... sauber!");
    AddAdditionalTrigger("Wie fühlst");
    AddAdditionalTrigger("Wie ist es ergangen");
    AddAdditionalText("Oh, ich bin so besorgt, vielleicht könnt ihr mir ja helfen.");
    AddAdditionalText("Ich hab Angst!");
    AddTraderTrigger("your name","I am Myrthe. Hello!");
    AddAdditionalTrigger("who are you");
    AddAdditionalTrigger("who art thou");
    AddAdditionalText("Myrthe Mildthorn, at your service.");
    AddAdditionalText("Wasch-woman Myrthe Mildthorn reports for duty!");
    AddTraderTrigger("dein name","Ich bin die Myrthe. Hallo!");
    AddAdditionalTrigger("wer bist du");
    AddAdditionalTrigger("wer seid ihr");
    AddAdditionalTrigger("wie heißt");
    AddAdditionalText("Myrthe Mildthorn, stets zu Diensten.");
    AddAdditionalText("Waschweib Myrthe Mildthorn meldet sich zur Stelle!");
    -- Catching typical NPC phrases
    AddTraderTrigger("what sell","I can wash your laundry, but I do not trade with goods.");
    AddAdditionalTrigger("what buy");
    AddAdditionalTrigger("list wares");
    AddAdditionalTrigger("price of");
    AddTraderTrigger("was verkauf","Ich kann eure Schmutzwäsche waschen, aber ich handele nicht mit Waren.");
    AddAdditionalTrigger("was kauf");
    AddAdditionalTrigger("warenliste");
    AddAdditionalTrigger("preis von");
    AddTraderTrigger("tell something","First, you have to soak the laundry. Wait an hour, but not more. Then, wash it! And do not forget to rinse it twice.");
    AddTraderTrigger("erzähl was","Zunächst müßt ihr die Wäsche einweichen. Wartet eine Stunde, aber nicht mehr. Dann wascht sie! Vergesst nicht, sie hinterher zweimal zu spülen.");
    AddAdditionalTrigger("erzähl etwas");
    -- Small talk: The talk here should focus on possible questions. Feel free to add more!
    AddTraderTrigger("wash","Doing the laundry is very important. Otherwise, all the mages and nobles wouldn't have clean robes. How would that look like!");
    AddAdditionalTrigger("laundry");
    AddAdditionalText("As a washer-woman, I am an important member of the society. I make people look noble!");
    AddAdditionalText("Oh, you have some laundry I should wash? Wait a bit, please, I am not done with today's batch.");
    AddTraderTrigger("Wasch","Wäsche waschen ist sehr wichtig. Denn ansonsten hätten all die Magier und Edelleute keine sauberen Roben. Wir würde das denn aussehen!");
    AddAdditionalTrigger("Wäsche");
    AddAdditionalText("Als Waschweib bin ich ein wichtiges Mitglied der Gesellschaft. Ich sorge erst dafür, dass Leute so herrschaftlich aussehen können!");
    AddAdditionalText("Oh, ihr habt etwas Wäsche, die ich waschen soll? Wartet noch ein wenig, ich bin noch nicht mit dem Stapel für heute fertig.");
    AddTraderTrigger("profession","I'm a washer-woman. I earn my money with honest labour and I feel proud of it.");
    AddTraderTrigger("beruf","Ich bin ein Waschweib. Ich verdiene mein Geld mit ehrlicher Arbeit, worauf ich stolz bin.");
    AddTraderTrigger("job","I'm a washer-woman. I earn my money with honest labour and I feel proud of it.");
    AddCondition("lang","english");
    AddTraderTrigger("job","Ich bin ein Waschweib. Ich verdiene mein Geld mit ehrlicher Arbeit, worauf ich stolz bin.");
    -- More small talk; add at least five triggers
    AddTraderTrigger("Yewdale","Oh, Yewdale is not far away. Just follow the road, you cannot miss it.");
    AddTraderTrigger("Nana","Nana... she lives in Yewdale, am I not right? She cooks the finest soups, indeed.");
    AddAdditionalTrigger("Winterbutter");
    AddCondition("lang","english");
    AddTraderTrigger("wolf","In the night, I hear them howling! They even attacked Yewdale once!");
    AddCondition("lang","english");
    AddTraderTrigger("wolves","In the night, I hear them howling! They even attacked Yewdale once!");
    AddTraderTrigger("panther","Panthers are mean... predators! I don't want them to hunt me, I just want to wash my laundry in peace!");
    AddCondition("lang","english");
    AddTraderTrigger("Spider","Eeek! I once saw the web of a giant spider between two trees in the north. That was so scary!");
    AddTraderTrigger("cave","To the north, there is an abandoned bear cave. Now wolves, panthers and even terrible spiders dwell there.");
    AddTraderTrigger("bear","A bear used to protect us from all the beast; he guarded his cave and no wolf nor panther dared to come close to the Anthil brook.");
    AddTraderTrigger("Anthil","Anthil's water is perfect for doing laundry. It could be a bit warmer, though.");
    AddCondition("lang","english");
    AddTraderTrigger("brook","This brook here is the called the Anthil, didn't you know? The water is pure and clean, just as my laundry.");
    AddAdditionalTrigger("river");
    AddTraderTrigger("Eibenthal","Oh, Eibenthal ist nicht weit von hier. Geht einfach die Straße entlang, ihr könnte es nicht verfehlen.");
    AddTraderTrigger("Nana","Nana... Sie lebt in Eibenthal, nicht wahr? Sie kocht die besten Suppen, ohja.");
    AddAdditionalTrigger("Winterbutter");
    AddTraderTrigger("Wolf","In der Nacht höre ich ihr Gejaule. Und sie haben sogar schon Yewdale heimgesucht!");
    AddAdditionalTrigger("Wölfe");
    AddTraderTrigger("Panther","Panthers sind ganz gemeine Raubtiere. Ich will nicht, dass sie nach mir jagen, ich will doch nur meine Wäsche in Frieden waschen.");
    AddTraderTrigger("Spinne","Eeek! Ich habe letztens ein riesiges Spinnennetz zwischen zwei Bäumen im Norden gesehen. Das war so schrecklich!");
    AddTraderTrigger("Höhle","Im Norden gibt es eine alte Bärenhöhle. Jetzt hausen dort Wölfe, Panther und schreckliche Spinnen!");
    AddTraderTrigger("Bär","Ein Bär hat uns früher vor den wilden Tieren beschützt; er bewachte seine Höhle und kein Wolf oder Panther wagte es, hier zum Anthil zu kommen.");
    AddTraderTrigger("Anthil","Das Wasser des Anthils ist perfekt, um Wäsche darin zu waschen. Es könnte nur ein wenig wärmer sein.");
    AddTraderTrigger("Bach","Dieser Bach hier ist der Anthil, wußtet ihr das nicht? Das Wasser ist sauber und klar, genauso wie meine Wäsche.");
    AddAdditionalTrigger("Fluss");
    AddAdditionalTrigger("Fluß");
    -- Faction stuff
    AddTraderTrigger("Elvaine","The archmage trusts me - and only me! to wash his robes. I feel so honoured!");
    AddAdditionalTrigger("Morgan");
    AddAdditionalTrigger("archmage");
    AddAdditionalTrigger("Erzmagier");
    AddCondition("lang","english");
    AddTraderTrigger("Elvaine","Der Erzmagier traut nur mir die Wäsche seiner Roben an. Ich fühle mich so geehrt!");
    AddAdditionalTrigger("Morgan");
    AddAdditionalTrigger("archmage");
    AddAdditionalTrigger("Erzmagier");
    AddTraderTrigger("Runewick","Runewick is that magnificient town to the east. I wash the laundry of the citizens! Isn't that great?");
    AddCondition("lang","english");
    AddTraderTrigger("Runewick","Runewick ist diese großartige Stadt im Osten. Ich wasche die Wäsche der Bürger! Ist das nicht toll?");
    AddTraderTrigger("Valerio","Oh, isn't that a cook from the north who cooks noodles of semolina?");
    AddAdditionalTrigger("Guilianni");
    AddAdditionalTrigger("Don");
    AddCondition("lang","english");
    AddTraderTrigger("Valerio","Oh, ist das nicht ein Koch aus dem Norden, der Nudeln aus Hartweizengrieß kocht?");
    AddAdditionalTrigger("Guilianni");
    AddAdditionalTrigger("Don");
    AddTraderTrigger("Galmair","Once, a dwarf from Galmair called Miggs came to me. He demanded money from me, but then my old friend, the bear came and the dwarf ran!");
    AddCondition("lang","english");
    AddTraderTrigger("Galmair","Einst kam ein Zwerg namens Miggs aus Galmair zu mir. Er verlangte Geld, doch dann kam mein alter Freund der Bär und der Zwerg rannte davon!");
    AddTraderTrigger("rosaline","Ui, the queen of Cadomyr? I wish I'd be a queen, too.");
    AddAdditionalTrigger("königin");
    AddAdditionalTrigger("queen");
    AddAdditionalTrigger("edwards");
    AddCondition("lang","english");
    AddTraderTrigger("rosaline","Ui, die Königin von Cadomyr? Ich wünschte, ich wäre auch eine Königin.");
    AddAdditionalTrigger("königin");
    AddAdditionalTrigger("queen");
    AddAdditionalTrigger("edwards");
    AddTraderTrigger("Cadomyr","#me points to the west: 'There is Cadomyr! I've never been there, but I heard it is a barren place.");
    AddCondition("lang","english");
    AddTraderTrigger("Cadomyr","#me deutet nach Westen: 'Dort liegt Cadomyr. Ich war noch nie dort, aber ich habe gehört, es ist ein staubtrockener Ort.");
    -- Main land factions
    AddTraderTrigger("albar","Albar... I am a simple washer-woman. How should I know about such things?");
    AddCondition("lang","english");
    AddTraderTrigger("albar","Albar... ich bin nur ein einfaches Waschweib. Warum sollte ich mich mit solchen Dingen auskennen?");
    AddTraderTrigger("gynk","Gynk, that sounds funny, what is that?");
    AddAdditionalTrigger("gync");
    AddCondition("lang","english");
    AddTraderTrigger("gync","Gynk, das klingt witzig, was ist denn das?");
    AddAdditionalTrigger("gynk");
    AddTraderTrigger("salkama","I think the archmage of Runewick is from... Salamander?");
    AddCondition("lang","english");
    AddTraderTrigger("salkama","Ich glaube, der Erzmagier von Runewick kommt aus... Salamander?");
    -- Gods; each NPC should react on AT LEAST one god, being a follower of said god
    AddTraderTrigger("Tanora","I pray to Tanora every morning for leaving the water of the Anthil brook as clear as it is now.");
    AddAdditionalTrigger("Zelphia");
    AddCondition("lang","english");
    AddTraderTrigger("Tanora","Ich bete jeden Morgen zu Tanora, auf dass das Wasser der Anthils immer so klar bleibt wie jetzt.");
    AddAdditionalTrigger("Zelphia");
    -- 1st quest: Kill 10 wolves, player receives torch.
    -- Give out quest 1 and a torch
    AddTraderTrigger("quest","Since my old friend the bear is no more, wolves scare me every night. Could you go north to their cave and... tame them... for good?");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",0);
    AddCondition("lang","english");
    AddConsequence("qpg","=",1);
    AddConsequence("item",391,1,399,0);
    AddConsequence("inform","[New quest] A Cave in the Woods I");
    AddTraderTrigger("quest","Seitdem mein alter Freund der Bär nicht mehr ist, fürchte ich mich jede Nacht vor den Wölfen. Könntet ihr bitte nach Norden ziehen und sie... für immer... zähmen?");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",0);
    AddConsequence("qpg","=",1);
    AddConsequence("item",391,1,399,0);
    AddConsequence("inform","[Neues Quest] Eine Höhle im Wald I");
    AddTraderTrigger("task","Since my old friend the bear is no more, wolves scare me every night. Could you go north to their cave and... tame them... for good?");
    AddAdditionalTrigger("adventure");
    AddCondition("qpg","=",0);
    AddConsequence("qpg","=",1);
    AddConsequence("item",391,1,399,0);
    AddConsequence("inform","[New quest] A Cave in the Woods I");
    AddTraderTrigger("Auftrag","Seitdem mein alter Freund der Bär nicht mehr ist, fürchte ich mich jede Nacht vor den Wölfen. Könntet ihr bitte nach Norden ziehen und sie... für immer... zähmen?");
    AddAdditionalTrigger("Aufgabe");
    AddAdditionalTrigger("Abenteuer");
    AddCondition("qpg","=",0);
    AddConsequence("qpg","=",1);
    AddConsequence("item",391,1,399,0);
    AddConsequence("inform","[Neues Quest] Eine Höhle im Wald I");
    -- Quest 1 taken but not solved, repeat the instructions
    AddTraderTrigger("quest","There is still a pack of wolves in the north. Can't you hear them howling?");
    AddAdditionalTrigger("mission");
    AddCondition("qpg",">",0);
    AddCondition("qpg","<",11);
    AddCondition("lang","english");
    AddTraderTrigger("quest","Immernoch treibt ein Rudel Wölfe sein Unwesen im Norden. Hört ihr nicht ihr Gejaule?");
    AddAdditionalTrigger("mission");
    AddCondition("qpg",">",0);
    AddCondition("qpg","<",11);
    AddTraderTrigger("task","There is still a pack of wolves in the north. Can't you hear them howling?");
    AddAdditionalTrigger("adventure");
    AddCondition("qpg",">",0);
    AddCondition("qpg","<",11);
    AddTraderTrigger("Auftrag","Immernoch treibt ein Rudel Wölfe sein Unwesen im Norden. Hört ihr nicht ihr Gejaule?");
    AddAdditionalTrigger("Aufgabe");
    AddAdditionalTrigger("Abenteuer");
    AddCondition("qpg",">",0);
    AddCondition("qpg","<",11);
    -- Quest 1 solved, reward: 100cp, +5 rankpoints
    AddTraderTrigger(".+","Oh, how great! Now I can sleep without the wolves scaring me. Take mm loan of this week, do not refuse it, please. Another adventure awaits you.");
    AddCondition("qpg","=",11);
    AddCondition("lang","english");
    AddCondition("town","=","runewick");
    AddConsequence("qpg","=",12);
    AddConsequence("rankpoints","runewick","+",5);
    AddConsequence("money","+",100);
    AddConsequence("inform","[Quest solved] You are awarded 100 copper coins. You advance in Archmage Elvaine Morgan's favour.");
    AddTraderTrigger(".+","Oh, how great! Now I can sleep without the wolves scaring me. Take my loan of this week, do not refuse it, please. Another adventure awaits you.");
    AddCondition("qpg","=",11);
    AddCondition("lang","english");
    AddConsequence("qpg","=",12);
    AddConsequence("money","+",100);
    AddConsequence("inform","[Quest solved] You are awarded 100 copper coins.");
    AddTraderTrigger(".+","Oh, wie fein! Jetzt kann ich die Nacht ohne Angst vor den Wölfen durchschlafen. Hier, nehmt meinen Wochenlohn, lehnt ihn bitte nicht ab. Ein weiteres Abenteuer wartet auf euch.");
    AddCondition("qpg","=",11);
    AddCondition("town","=","runewick");
    AddConsequence("qpg","=",12);
    AddConsequence("rankpoints","runewick","+",5);
    AddConsequence("money","+",100);
    AddConsequence("inform","[Quest gelöst] Du erhältst 100 Kupferstücke. Dein Ansehen bei Erzmagier Elvaine Morgan steigt.");
    AddTraderTrigger(".+","Oh, wie fein! Jetzt kann ich die Nacht ohne Angst vor den Wölfen durchschlafen. Hier, nehmt meinen Wochenlohn, lehnt ihn bitte nicht ab. Ein weiteres Abenteuer wartet auf euch.");
    AddCondition("qpg","=",11);
    AddConsequence("qpg","=",12);
    AddConsequence("money","+",100);
    AddConsequence("inform","[Quest gelöst] Du erhältst 100 Kupferstücke.");
    -- 2nd quest: Kill 5 panthers
    -- Give out quest 2
    AddTraderTrigger("quest","You are a true hero. The panthers are hunting everything, even halflings. Please, will you... tame them, too?");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",12);
    AddCondition("lang","english");
    AddConsequence("qpg","=",13);
    AddConsequence("inform","[New quest] A Cave in the Woods II");
    AddTraderTrigger("quest","Ihr seid wahrhaftig ein Held. Die Panther jagen alles und jeden, sogar Halblinge. Bitte, könntet ihr sie auch... ruhigstellen?");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",12);
    AddConsequence("qpg","=",13);
    AddConsequence("inform","[Neues Quest] Eine Höhle im Wald II");
    AddTraderTrigger("task","You are a true hero. The panthers are hunting everything, even halflings. Please, will you... tame them, too?");
    AddAdditionalTrigger("adventure");
    AddCondition("qpg","=",12);
    AddConsequence("qpg","=",13);
    AddConsequence("inform","[New quest] A Cave in the Woods II");
    AddTraderTrigger("Auftrag","Ihr seid wahrhaftig ein Held. Die Panther jagen alles und jeden, sogar Halblinge. Bitte, könntet ihr sie auch... ruhigstellen?");
    AddAdditionalTrigger("Aufgabe");
    AddAdditionalTrigger("Abenteuer");
    AddCondition("qpg","=",12);
    AddConsequence("qpg","=",13);
    AddConsequence("inform","[Neues Quest] Eine Höhle im Wald II");
    -- Quest 2 taken but not solved, repeat the instructions
    AddTraderTrigger("quest","I saw a black shadow again! Are there still mean panthers around?");
    AddAdditionalTrigger("mission");
    AddCondition("qpg",">",12);
    AddCondition("qpg","<",18);
    AddCondition("lang","english");
    AddTraderTrigger("quest","Ich habe erneut einen schwarzen Schatten gesehen! Sind etwa noch Panther in der Gegend?");
    AddAdditionalTrigger("mission");
    AddCondition("qpg",">",12);
    AddCondition("qpg","<",18);
    AddTraderTrigger("task","I saw a black shadow again! Are there still mean panthers around?");
    AddAdditionalTrigger("adventure");
    AddCondition("qpg",">",12);
    AddCondition("qpg","<",18);
    AddTraderTrigger("Auftrag","Ich habe erneut einen schwarzen Schatten gesehen! Sind etwa noch Panther in der Gegend?");
    AddAdditionalTrigger("Aufgabe");
    AddAdditionalTrigger("Abenteuer");
    AddCondition("qpg",">",12);
    AddCondition("qpg","<",18);
    -- Quest 2 solved, reward: 100cp, yellow robe (195), +10 rankpoints
    AddTraderTrigger(".+","Wonder, wonderful! The panthers were so mean. Here, a customer forgot to pick up a robe, it is yours now.");
    AddCondition("qpg","=",18);
    AddCondition("lang","english");
    AddCondition("town","=","runewick");
    AddConsequence("qpg","=",19);
    AddConsequence("rankpoints","runewick","+",10);
    AddConsequence("money","+",100);
    AddConsequence("item",195,1,599,0);
    AddConsequence("inform","[Quest solved] You are awarded 100 copper coins and a yellow robe. You advance in Archmage Elvaine Morgan's favour.");
    AddTraderTrigger(".+","Wonder, wonderful! The panthers were so mean. Here, a customer forgot to pick up a robe, it is yours now.");
    AddCondition("qpg","=",18);
    AddCondition("lang","english");
    AddConsequence("qpg","=",19);
    AddConsequence("money","+",100);
    AddConsequence("item",195,1,599,0);
    AddConsequence("inform","[Quest solved] You are awarded 100 copper coins and a yellow robe.");
    AddTraderTrigger(".+","Wunder, wunderbar! Die Panther waren so böse! Hier, ein Kunde vergaß eine Robe bei mir abzuholen, sie sei nun eure.");
    AddCondition("qpg","=",18);
    AddCondition("town","=","runewick");
    AddConsequence("qpg","=",19);
    AddConsequence("rankpoints","runewick","+",10);
    AddConsequence("money","+",100);
    AddConsequence("item",195,1,599,0);
    AddConsequence("inform","[Quest gelöst] Du erhältst 100 Kupferstücke und eine gelbe Robe. Dein Ansehen bei Erzmagier Elvaine Morgan steigt.");
    AddTraderTrigger(".+","Wunder, wunderbar! Die Panther waren so böse! Hier, ein Kunde vergaß eine Robe bei mir abzuholen, sie sei nun eure.");
    AddCondition("qpg","=",18);
    AddConsequence("qpg","=",19);
    AddConsequence("money","+",100);
    AddConsequence("item",195,1,599,0);
    AddConsequence("inform","[Quest gelöst] Du erhältst 100 Kupferstücke und eine gelbe Robe.");
    -- 3rd quest: Kill 1 spider
    -- Give out quest 3
    AddTraderTrigger("quest","Did you see that web? That giant web in the woods? It has to belong to a giant spider! Just imagine such a beast would come here. Can you... prevent this?");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",19);
    AddCondition("lang","english");
    AddConsequence("qpg","=",20);
    AddConsequence("inform","[New quest] A Cave in the Woods III");
    AddTraderTrigger("quest","Habt ihr dieses Netz gesehen? Dieses riesen Netz im Wald? Es muss einer riesigen Spinne gehören. Stellt euch nur vor, so ein Biest würde hierher kommen! Könnt ihr das... verhindern?");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",19);
    AddConsequence("qpg","=",20);
    AddConsequence("inform","[Neues Quest] Eine Höhle im Wald III");
    AddTraderTrigger("task","Did you see that web? That giant web in the woods? It has to belong to a giant spider! Just imagine such a beast would come here. Can you... prevent this?");
    AddAdditionalTrigger("adventure");
    AddCondition("qpg","=",19);
    AddConsequence("qpg","=",20);
    AddConsequence("inform","[New quest] A Cave in the Woods III");
    AddTraderTrigger("Auftrag","Habt ihr dieses Netz gesehen? Dieses riesen Netz im Wald? Es muss einer riesigen Spinne gehören. Stellt euch nur vor, so ein Biest würde hierher kommen! Könnt ihr das... verhindern?");
    AddAdditionalTrigger("Aufgabe");
    AddAdditionalTrigger("Abenteuer");
    AddCondition("qpg","=",19);
    AddConsequence("qpg","=",20);
    AddConsequence("inform","[Neues Quest] Eine Höhle im Wald III");
    -- Quest 3 taken but not solved, repeat the instructions
    AddTraderTrigger("quest","A giant spider built a giant web in the woods! I fear for my life!");
    AddAdditionalTrigger("mission");
    AddCondition("qpg",">",19);
    AddCondition("qpg","<",21);
    AddCondition("lang","english");
    AddTraderTrigger("quest","Eine riesige Spinne hat ein riesiges Netz im Wald gebaut! Ich fürchte um mein Leben!.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg",">",19);
    AddCondition("qpg","<",21);
    AddTraderTrigger("task","A giant spider built a giant web in the woods! I fear for my life!");
    AddAdditionalTrigger("adventure");
    AddCondition("qpg",">",19);
    AddCondition("qpg","<",21);
    AddTraderTrigger("Auftrag","Eine riesige Spinne hat ein riesiges Netz im Wald gebaut! Ich fürchte um mein Leben!");
    AddAdditionalTrigger("Aufgabe");
    AddAdditionalTrigger("Abenteuer");
    AddCondition("qpg",">",19);
    AddCondition("qpg","<",21);
    -- Quest 3 solved, reward: novice robe, +20 rankpoints
    AddTraderTrigger(".+","Hooray! Now the woods are peaceful again and I can continue washing the laundry in peace. An apprentice of Runewick left her robe with me; I think her name was Zaida. Have it!");
    AddCondition("qpg","=",21);
    AddCondition("lang","english");
    AddCondition("town","=","runewick");
    AddConsequence("qpg","=",22);
    AddConsequence("rankpoints","runewick","+",20);
    AddConsequence("item",547,1,799,0);
    AddConsequence("inform","[Quest solved] You are awarded a novice robe. You advance in Archmage Elvaine Morgan's favour.");
    AddTraderTrigger(".+","Hooray! Now the woods are peaceful again and I can continue washing the laundry in peace. An apprentice of Runewick left her robe with me; I think her name was Zaida. Have it!");
    AddCondition("qpg","=",21);
    AddCondition("lang","english");
    AddConsequence("qpg","=",22);
    AddConsequence("item",547,1,799,0);
    AddConsequence("inform","[Quest solved] You are awarded a novice robe.");
    AddTraderTrigger(".+","Hurra! Nun, da der Wald wieder friedlich ist, kann ich ungestört meine Wäsche waschen. Eine Novizin aus Runewick hat ihre Robe hier bei mir vergessen; ich glaube, ihr Name war Zaida. Hier!");
    AddCondition("qpg","=",21);
    AddCondition("town","=","runewick");
    AddConsequence("qpg","=",22);
    AddConsequence("item",547,1,799,0);
    AddConsequence("rankpoints","runewick","+",20);
    AddConsequence("inform","[Quest gelöst] Du erhältst eine Novizenrobe. Dein Ansehen bei Erzmagier Elvaine Morgan steigt.");
    AddTraderTrigger(".+","Hurra! Nun, da der Wald wieder friedlich ist, kann ich ungestört meine Wäsche waschen. Eine Novizin aus Runewick hat ihre Robe hier bei mir vergessen; ich glaube, ihr Name war Zaida. Hier!");
    AddCondition("qpg","=",21);
    AddConsequence("qpg","=",22);
    AddConsequence("item",547,1,799,0);
    AddConsequence("inform","[Quest gelöst] Du erhältst eine Novizenrobe.");
    -- No more quests, just nice words of gratitude
    AddTraderTrigger("quest","Oh, you did so much for me, the woods and the laundry. You can bring me your laundry whenever you want - I'll wash it for free!");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",22);
    AddCondition("lang","english");
    AddTraderTrigger("quest","Oh, ihr habt schon so viel für mich, den Wald und die Wäsche getan. Ihr könnt mir eure Schmutzwäsche jederzeit bringen, ich wasche sie kostenlos.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",22);
    AddTraderTrigger("task","Oh, you did so much for me, the woods and the laundry. You can bring me your laundry whenever you want - I'll wash it for free!");
    AddAdditionalTrigger("adventure");
    AddCondition("qpg","=",22);
    AddTraderTrigger("Auftrag","Oh, ihr habt schon so viel für mich, den Wald und die Wäsche getan. Ihr könnt mir eure Schmutzwäsche jederzeit bringen, ich wasche sie kostenlos.");
    AddAdditionalTrigger("Aufgabe");
    AddAdditionalTrigger("Abenteuer");
    AddCondition("qpg","=",22);
    -- Easteregg (optional): Think about a funny, unrelated trigger with a surprising answer
    AddTraderTrigger("moan","I do not moan! I just... notice things.");
    AddTraderTrigger("maulen","Ich maule nicht... Ich mache nur Anmerkungen.");
    AddTraderTrigger("Ariel","I prefer soap.");
    AddAdditionalTrigger("Sunil");
    AddAdditionalTrigger(",Tandil");
    AddCondition("lang","english");
    AddTraderTrigger("Ariel","Ich nehme lieber Seife.");
    AddAdditionalTrigger("Sunil");
    AddAdditionalTrigger(",Tandil");
    -- Last catch: Think about keyphrases the player might say and that are not caught until here.
    AddTraderTrigger("Yes","Yes, no.");
    AddAdditionalText("Sure, clear.");
    AddAdditionalText("Everything is wonderful!");
    AddTraderTrigger("Ja","Ja, ne.");
    AddAdditionalText("Sicherlich, klar.");
    AddAdditionalText("Alles wunderbar!");
    AddTraderTrigger("No","Nothing is clear.");
    AddAdditionalText("Who is Regor?");
    AddAdditionalText("Who the heck?");
    AddTraderTrigger("Nein","Nichts ist klar.");
    AddAdditionalText("Wer ist Regor?");
    AddAdditionalText("Wer verdammt nochmal?");
    -- Cycletext: Add as many random messages as possible
    AddCycleText("Ohje, ohje.","Ohje, ohje.");
    AddCycleText("#me schrubbt emsig ihre Wäsche sauber.","#me scrubs her laundry clean.");
    AddCycleText("#me beobachtet mit verträumten Gesichtsausdruck eine Forelle im Wasser.","#me stares at a trout, passing by.");
    AddCycleText("#me summt vor sich hin.","#me hums to herself.");
    AddCycleText("#me wäscht Wäsche.","#me washes laundry clean.");
    AddCycleText("#me faltet ein Laken zusammen.","#me folds a blanket.");
    AddCycleText("#me inspiziert ein Loch in einem Umhang und steckt kichernd ihren Finger hindurch.","#me inspects a hole in a coat and sticks her finger through it, giggling.");
    AddCycleText("Ah, nicht nur sauber, sondern rein muss es sein.","Ah, not just clean but pure it should be.");
    AddCycleText("Willst du viel, spül' im Anthil.","Want a lot, rinse in a pot.");
    AddCycleText("#me reinigt ihr Waschbrett.","#me cleans her wash board.");
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
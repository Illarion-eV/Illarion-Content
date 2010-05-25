-- INSERT INTO npc VALUES (nextval('npc_seq'),0,20,1,0,4,false,'Eugene Burton','npc_eugene_burton.lua',0);

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

    SetRadius(1);
    QuestID = 4;
    -- NPC by Estralis Seborian
    -- Queststatus Overview
    -- 0: No Quest taken
    -- 1: Quest 1 taken - kill 6 bunnies, provide 6 rabbit meat
    -- 2-7: Killing 6 bunnies
    -- 8: Quest 1 solved, reward: 250 arrows
    -- 9: Quest 2 taken - kill 12 deers, provide 12 deer meat
    -- 10-21: Killing 12 deers
    -- 22: Quest 2 solved, reward: Golden ring, copper goblet, emerald amulet, 200cp
    -- 23: Quest 3 taken - kill 6 wolves
    -- 24-29: Killing 6 wolves
    -- 30: Quest 3 solved, reward: Long bow, 100 poisoned arrows
    -- 31: Quest 4 taken - kill 1 elven hunter
    -- 32: Killing 1 elven hunter
    -- 33: Quest 4 solved, reward: Magical ruby ring
    -- Debugging
    AddTraderTrigger("set 0","");
    AddConsequence("inform","[Debugging] Quest status set to 0");
    AddConsequence("qpg","=",0);
    AddTraderTrigger(".+","");
    AddCondition("qpg",">",33);
    AddConsequence("inform","[Error] Something went wrong, please inform a developer.");
    -- Help
    AddTraderTrigger("Help","");
    AddConsequence("inform","[Game Help] This is NPC is the poacher Eugene Burton. Keyphrases: Hello, quest, poacher, animals.");
    AddTraderTrigger("Hilfe","");
    AddConsequence("inform","[Spielhilfe] Dieser NPC ist der Wilderer Eugene Burton. Schlüsselwörter: Hallo, Quest, Wilderer, Tiere.");
    -- General speech
    AddTraderTrigger("Hello","Shh! Not so loud! You'll scare away my game!");
    AddAdditionalTrigger("Greetings");
    AddAdditionalTrigger("Be greeted");
    AddAdditionalTrigger("Hail");
    AddAdditionalTrigger("Good day");
    AddAdditionalTrigger("Good morning");
    AddAdditionalTrigger("Good evening");
    AddTraderTrigger("Grüße","Psst, nicht so laut, ihr verscheucht ja das ganze Wild.");
    AddAdditionalTrigger("Gruß");
    AddAdditionalTrigger("Seid gegrüßt");
    AddAdditionalTrigger("Guten Tag");
    AddAdditionalTrigger("Guten Abend");
    AddAdditionalTrigger("Mahlzeit");
    AddAdditionalTrigger("Tach");
    AddAdditionalTrigger("Moin");
    AddTraderTrigger("Hiho","Shh! Not so loud! You'll scare away my game!");
    AddAdditionalTrigger("Hallo");
    AddAdditionalTrigger("Hey");
    AddAdditionalTrigger("Greebas");
    AddAdditionalTrigger("Greebs");
    AddCondition("lang","english");
    AddTraderTrigger("Hiho","Psst, nicht so laut, ihr verscheucht ja das ganze Wild.");
    AddAdditionalTrigger("Hallo");
    AddAdditionalTrigger("Hey");
    AddAdditionalTrigger("Greebas");
    AddAdditionalTrigger("Greebs");
    AddCondition("lang","german");
    AddTraderTrigger("Farewell","Go forth with Malachin's blessing. May you never starve.");
    AddAdditionalTrigger("Good bye");
    AddAdditionalTrigger("Bye");
    AddAdditionalTrigger("Fare thy well");
    AddTraderTrigger("Tschüß","Geht mit Malachins Segen. Auf dass ihr nie Hunger leiden müßt.");
    AddAdditionalTrigger("Tschüss");
    AddAdditionalTrigger("Wiedersehen");
    AddAdditionalTrigger("Gehabt euch wohl");
    AddTraderTrigger("Ciao","Go forth with Malachin's blessing. May you never starve");
    AddAdditionalTrigger("Adieu");
    AddAdditionalTrigger("Au revoir");
    AddCondition("lang","english");
    AddTraderTrigger("Ciao","Geht mit Malachins Segen. Auf dass ihr nie Hunger leiden müßt.");
    AddAdditionalTrigger("Adieu");
    AddAdditionalTrigger("Au revoir");
    AddCondition("lang","german");
    AddTraderTrigger("How are you","I'd feel much better if you could help me a bit, hunting.");
    AddAdditionalTrigger("How feel");
    AddAdditionalTrigger("How do you do");
    AddTraderTrigger("Wie geht","Ich würde mich weit besser fühlen, wenn ihr mir bei der Jagd helfen könntet.");
    AddAdditionalTrigger("Wie fühlst");
    AddAdditionalTrigger("Wie ist es ergangen");
    AddTraderTrigger("your name","I am Eugene Burton; father to four hungry mouths. Feeding those mouths has become so difficult these days...");
    AddAdditionalTrigger("who are you");
    AddAdditionalTrigger("who art thou");
    AddTraderTrigger("dein name","Ich bin Eugene Burton, Vater von vier hungrigen Mäulern. Diese zu stopfen ist dieser Tage wirklich schwierig geworden.");
    AddAdditionalTrigger("wer bist du");
    AddAdditionalTrigger("wer seid ihr");
    AddAdditionalTrigger("wie heißt");
    -- Catching typical NPC phrases
    AddTraderTrigger("what sell","If I had something for trading, I'd sell everything to feed my family, I swear.");
    AddAdditionalTrigger("what buy");
    AddAdditionalTrigger("list wares");
    AddAdditionalTrigger("price of");
    AddTraderTrigger("was verkauf","Hätte ich etwas zum handeln, so würde ich alles veräußern, um meine Familie zu ernähren. Das schwöre ich.");
    AddAdditionalTrigger("was kauf");
    AddAdditionalTrigger("warenliste");
    AddAdditionalTrigger("preis von");
    AddTraderTrigger("tell something","I don't have the time to chat with you; my family is starving. Perhaps you can help me with a task?");
    AddTraderTrigger("erzähl was","Ich habe nicht die Zeit, mit euch zu plaudern; meine Familie ist am Verhungern. Vielleicht könnt ihr mir bei einer Aufgabe helfen?");
    AddAdditionalTrigger("erzähl etwas");
    -- Small talk: The talk here should focus on possible questions. Feel free to add more!
    AddTraderTrigger("poacher","People call me a poacher, because they don't like what I do. But what do I do? I take only what my family needs!");
    AddAdditionalTrigger("hunter");
    AddTraderTrigger("wilderer","Manche nennen mich einen Wilderer, denn ihnen misfällt, was ich tue. Aber was mache ich schon - ich nehme nur so viel, wie meine Familie benötigt.");
    AddAdditionalTrigger("jäger");
    AddTraderTrigger("profession","People call me a poacher, because they don't like what I do. But what do I do? I take only what my family needs!");
    AddTraderTrigger("beruf","Manche nennen mich einen Wilderer, denn ihnen misfällt, was ich tue. Aber was mache ich schon - ich nehme nur so viel, wie meine Familie benötigt.");
    AddTraderTrigger("job","People call me a poacher, because they don't like what I do. But what do I do? I take only what my family needs!");
    AddCondition("lang","english");
    AddTraderTrigger("job","Manche nennen mich einen Wilderer, denn ihnen misfällt, was ich tue. Aber was mache ich schon - ich nehme nur so viel, wie meine Familie benötigt.");
    -- More small talk; add at least five triggers
    AddTraderTrigger("valandil","Wicked elves! They think that the life of an animal is worth much more than the life of my four children. Valandil Elensar, the self proclaimed guardian of the Elstree forest, is the worst!");
    AddAdditionalTrigger("elensar");
    AddAdditionalTrigger("elf");
    AddAdditionalTrigger("elfen");
    AddAdditionalTrigger("elves");
    AddCondition("lang","english");
    AddTraderTrigger("valandil","Vermaledeite Elfen! Sie schätzen das Leben eines Tieres mehr als das Leben meiner vier Kinder. Valandial Elensar, der selbsternannte Hüter des Elsbaumwaldes, ist der schlimmste von allen.");
    AddAdditionalTrigger("elensar");
    AddAdditionalTrigger("elf");
    AddAdditionalTrigger("elfen");
    AddAdditionalTrigger("elves");
    AddTraderTrigger("law","Legal, illegal... I give a damn!");
    AddTraderTrigger("Gesetz","Legal, illegal... Scheißegal!");
    AddTraderTrigger("animal","There are countless animals in the Elstree forest, waiting for me and my bow: rabbits, deers and, sadly, even wolves.");
    AddAdditionalTrigger("game");
    AddTraderTrigger("Tier","Es gibt im Elsbaumwald unzählige Tiere, die nur auf mich und meinen Bogen warten: Hasen, Rehe und leider auch Wölfe.");
    AddAdditionalTrigger("Beute");
    AddTraderTrigger("forest","The Elstree forest is a good place to hunt; unfortunately wolves know that too. I still wonder what an Elstree is, actually.");
    AddAdditionalTrigger("woods");
    AddAdditionalTrigger("Elstree");
    AddTraderTrigger("Wald","Der Elsbaumwald ist ein gutes Jagdgebiet. Leider haben das auch schon die Wölfe begriffen. Ich frag mich allerdings schon länger, was eigentlich genau ein Elsbaum sein soll.");
    AddAdditionalTrigger("Elsbaum");
    AddTraderTrigger("rabbit","Catching those rabbits is more difficult than you might think. They are damn fast!");
    AddAdditionalTrigger("bunny");
    AddTraderTrigger("Hase","Hasen zu fangen ist schwerer, als man denkt; sie sind verdammt schnell!");
    AddAdditionalTrigger("Häßchen");
    AddAdditionalTrigger("Kaninchen");
    AddTraderTrigger("Reh","Es gibt immer weniger Dammhirsche im Elsbaumwald. Ich frage mich nur, warum...");
    AddAdditionalTrigger("Hirsch");
    AddAdditionalTrigger("Wild");
    AddTraderTrigger("Stag","Fewer and fewer deer can be found in the Elstree forest. I wonder why...");
    AddAdditionalTrigger("Deer");
    AddTraderTrigger("Wolf","Wolves! They prey on what feeds my children. Just to feed their blasted cubs!");
    AddCondition("lang","english");
    AddTraderTrigger("Wolf","Wölfe! Sie machen Jagd auf das, was meine Kinder am Leben erhält. Und das nur, um ihre eigene Brut zu füttern!");
    AddTraderTrigger("Wolves","Wolves! They prey on what feeds my children. Just to feed their blasted cubs!");
    AddTraderTrigger("Wölfe","Wölfe! Sie machen Jagd auf das, was meine Kinder am Leben erhält. Und das nur, um ihre eigene Brut zu füttern!");
    AddAdditionalTrigger("Woelfe");
    AddTraderTrigger("Father","My family starves, and all I can do is to hunt. However, these insane elves prefer to see humans die, rather than animals.");
    AddAdditionalTrigger("children");
    AddAdditionalTrigger("family");
    AddTraderTrigger("Vater","Meine Familie ist am verhungern und alles, was ich tun kann, ist zu Jagen. Aber diese vermaledeiten Elfen haben es lieber wenn Menschen statt Tiere sterben.");
    AddAdditionalTrigger("Kinder");
    AddAdditionalTrigger("Familie");
    AddTraderTrigger("fur","Hush! I do not hunt to get fur... but if I end the life of an animal to feed my family, do you expect me to leave behind what yields good coin?");
    AddTraderTrigger("fell","Pah! Ich jage nicht der Felle wegen... nunja, wenn ich schon das Leben eines Tieres beenden muss, um meine Famlilie zu ernähren, sollte ich das zurücklassen, womit man ordentlich abkassieren kann?");
    -- Faction stuff
    AddTraderTrigger("Elvaine","The mages always dictated what's going on in Runewick. I fear this is never going to change. They don't give a damn about the needs of the common people.");
    AddAdditionalTrigger("Morgan");
    AddAdditionalTrigger("archmage");
    AddAdditionalTrigger("Erzmagier");
    AddCondition("lang","english");
    AddTraderTrigger("Elvaine","Immer schon haben die Magier in Runewick den Ton angegeben. Ich fürchte, dies wird sich nie ändern; die Bedürfnisse der einfachen Leute sind denen egal.");
    AddAdditionalTrigger("Morgan");
    AddAdditionalTrigger("archmage");
    AddAdditionalTrigger("Erzmagier");
    AddTraderTrigger("Runewick","Runewick, ha! The self proclaimed protectors of everything. They'd better protect themselves from my arrows!");
    AddCondition("lang","english");
    AddTraderTrigger("Runewick","Runewick, ha! Die selbsternannten Hüter von allem möglichen. Die sollten sich besser vor meinen Pfeilen hüten!");
    AddTraderTrigger("Valerio","The Don of Galmair scares me. I prefer to stay out of his sight.");
    AddAdditionalTrigger("Guilianni");
    AddAdditionalTrigger("Don");
    AddCondition("lang","english");
    AddTraderTrigger("Valerio","Der Don von Galmair macht mir Angst. Ich gehe im lieber aus dem Weg.");
    AddAdditionalTrigger("Guilianni");
    AddAdditionalTrigger("Don");
    AddTraderTrigger("Galmair","Oh, Galmair, a good place to sell fur for a good coin. Uhm, to buy food... of course.");
    AddCondition("lang","english");
    AddTraderTrigger("Galmair","Oh, Galmair, das ist ein guter Ort, um ordentlich für Felle abzukassieren. Äh, um Essen zu kaufen... meine ich.");
    AddTraderTrigger("rosaline","She is... hot. I swear, I love my wife, but I can't fight my dreams.");
    AddAdditionalTrigger("königin");
    AddAdditionalTrigger("queen");
    AddAdditionalTrigger("edwards");
    AddCondition("lang","english");
    AddTraderTrigger("rosaline","Sie ist... heiß. Ich schwöre, dass ich meine Frau liebe, aber für seine Träume kann man nichts.");
    AddAdditionalTrigger("königin");
    AddAdditionalTrigger("queen");
    AddAdditionalTrigger("edwards");
    AddTraderTrigger("Cadomyr","Cadomyr is a bad place for hunters. Not much to hunt there, except sand and scorpions.");
    AddCondition("lang","english");
    AddTraderTrigger("Cadomyr","Cadomyr ist kein guter Ort für die Jagd. Man kann dort nicht viel jagen, außer nach Sand und Skorpionen.");
    -- Main land factions
    AddTraderTrigger("albar","I heard a lot about Albar and I wait eagerly for the day I can travel there. But I doubt this day will ever come; too poor I am.");
    AddCondition("lang","english");
    AddTraderTrigger("albar","Ich habe schon eine Menge über Albar gehört und ich warte sehnsüchtig auf den Tag, an dem ich dort hinreisen kann. Aber ich glaube nicht, dass dieser Tage jemals kommt, so arm bin ich.");
    AddTraderTrigger("gynk","Gynk is a pool of sins. But aren't we all sinnners one day?");
    AddAdditionalTrigger("gync");
    AddCondition("lang","english");
    AddTraderTrigger("gync","Gynk ist ein Sündenpfuhl. Aber sündigen wir nicht alle einmal?");
    AddAdditionalTrigger("gynk");
    AddTraderTrigger("salkama","Noble folk are living there; but also poor people. And nobody really cares about them!");
    AddCondition("lang","english");
    AddTraderTrigger("salkama","Hochwohlgeborenes Volk lebt dort; aber auch arme Leute wie ich. Und niemanden schert es, wie es denen ergeht!");
    -- Gods; each NPC should react on AT LEAST one god, being a follower of said god
    AddTraderTrigger("Malachin","Praise Malachin, the god of all hunters. May he guide my bow.");
    AddCondition("lang","english");
    AddTraderTrigger("Malachin","Lobet Malachin, den Gott der Jagd. Möge er meinen Bogen führen.");
    -- 1st quest: Kill 6 bunnies, provide 6 rabbit meat
    -- Give out quest 1
    AddTraderTrigger("quest","My family is starving and without food, we won't survive the next winter. Please, will you head for Elstree forest, hunt half a dozen rabbits and bring me their meat?");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",0);
    AddCondition("lang","english");
    AddConsequence("qpg","=",1);
    AddConsequence("inform","[New quest] The Poacher I");
    AddTraderTrigger("quest","Meine Familie ist am verhungern und ohne etwas zu essen überleben wir den Winter nicht. Bitte, könntet ihr bitte in den Elsbaumwald gehen, ein halbes Dutzend Hasen jagen und mir ihr Fleische bringen?");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",0);
    AddConsequence("qpg","=",1);
    AddConsequence("inform","[Neues Quest] Der Wilderer I");
    AddTraderTrigger("task","My family is starving and without food, we won't survive the next winter. Please, will you head for Elstree forest, hunt half a dozen rabbits and bring me their meat?");
    AddAdditionalTrigger("adventure");
    AddCondition("qpg","=",0);
    AddConsequence("qpg","=",1);
    AddConsequence("inform","[New quest] The Poacher I");
    AddTraderTrigger("Auftrag","Meine Familie ist am verhungern und ohne etwas zu essen überleben wir den Winter nicht. Bitte, könntet ihr bitte in den Elsbaumwald gehen, ein halbes Dutzend Hasen jagen und mir ihr Fleisch bringen?");
    AddAdditionalTrigger("Aufgabe");
    AddAdditionalTrigger("Abenteuer");
    AddCondition("qpg","=",0);
    AddConsequence("qpg","=",1);
    AddConsequence("inform","[Neues Quest] Der Wilderer I");
    -- Quest 1 taken but not solved, repeat the instructions
    -- Too few monsters slain
    AddTraderTrigger("quest","Oh, please, will you hunt half a dozen rabbits in the Elstree forest? My children beg for food, every day, and I have to disappoint them over and over again.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg",">",0);
    AddCondition("qpg","<",7);
    AddCondition("lang","english");
    AddTraderTrigger("quest","Oh, würdet ihr bitte ein halbes Dutzend Hasen im Elsbaumwald jagen gehen? Meine Kinder flehen um etwas zu essen und jeden Tag muss ich sie aufs Neue enttäuschen.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg",">",0);
    AddCondition("qpg","<",7);
    AddTraderTrigger("task","Oh, please, will you hunt half a dozen rabbits in the Elstree forest? My children beg for food, every day, and I have to disappoint them over and over again.");
    AddAdditionalTrigger("adventure");
    AddCondition("qpg",">",0);
    AddCondition("qpg","<",7);
    AddTraderTrigger("Auftrag","Oh, würdet ihr bitte ein halbes Dutzend Hasen im Elsbaumwald jagen gehen? Meine Kinder flehen um etwas zu essen und jeden Tag muss ich sie aufs Neue enttäuschen.");
    AddAdditionalTrigger("Aufgabe");
    AddAdditionalTrigger("Abenteuer");
    AddCondition("qpg",">",0);
    AddCondition("qpg","<",7);
    -- Too few items
    AddTraderTrigger("quest","Did you perhaps forget the rabbit meat in the forest? Please, quick, fetch it. My children will thank you.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",7);
    AddCondition("item",553,"all","<",6);
    AddCondition("lang","english");
    AddTraderTrigger("quest","Habt ihr etwa das Fleisch der Hasen im Wald vergessen? Bitte, lauft, und holt es! Meine Kinder werden es euch danken.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",7);
    AddCondition("item",553,"all","<",6);
    AddTraderTrigger("task","Did you perhaps forget the rabbit meat in the forest? Please, quick, fetch it. My children will thank you.");
    AddAdditionalTrigger("adventure");
    AddCondition("qpg","=",7);
    AddCondition("item",553,"all","<",6);
    AddTraderTrigger("Auftrag","Habt ihr etwa das Fleisch der Hasen im Wald vergessen? Bitte, lauft, und holt es! Meine Kinder werden es euch danken.");
    AddAdditionalTrigger("Aufgabe");
    AddAdditionalTrigger("Abenteuer");
    AddCondition("qpg","=",7);
    AddCondition("item",553,"all","<",6);
    -- Quest 1 solved, reward: 250 arrows
    AddTraderTrigger(".+","Thank you very, very much for the food. Rabbit meat will silence the bellies of my children, at least for some days. Take this quiver of arrows, it will help you hunting.");
    AddCondition("qpg","=",7);
    AddCondition("item",553,"all",">",5);
    AddCondition("lang","english");
    AddConsequence("qpg","=",8);
    AddConsequence("deleteitem",553,6);
    AddConsequence("item",64,250,333,0);
    AddConsequence("inform","[Quest solved] You are awarded 250 arrows.");
    AddTraderTrigger(".+","Vielen, vielen Dank. Dieses Hasenfleisch wird das Magenknurren meiner Kinder wenigstens für ein paar Tage besänftigen. Hier, nehmt diesen Köcher voll Pfeile, sie werden euch auf der Jagd gute Dienste erweisen.");
    AddCondition("qpg","=",7);
    AddCondition("item",553,"all",">",5);
    AddConsequence("qpg","=",8);
    AddConsequence("deleteitem",553,6);
    AddConsequence("item",64,250,333,0);
    AddConsequence("inform","[Quest gelöst] Du erhältst 250 Pfeile.");
    -- 2nd quest: Kill 12 deers, provide 12 deer meat
    -- Give out quest 2
    AddTraderTrigger("quest","Well, to survive the winter, it takes more than a slice of meat. I assume the meat of a dozen fallow deer from Elstree forest will make my children survive. Will you save their lives?");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",8);
    AddCondition("lang","english");
    AddConsequence("qpg","=",9);
    AddConsequence("inform","[New quest] The Poacher II");
    AddTraderTrigger("quest","Um den Winter zu überleben braucht man mehr als ein Stück Fleisch. Ich schätze, dass das Fleisch von einem Dutzend Dammhirschen aus dem Elsbaumwald wenigstens meine Kinder am Leben halten wird. Werdet ihr ihre Leben retten?");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",8);
    AddConsequence("qpg","=",9);
    AddConsequence("inform","[Neues Quest] Der Wilderer II");
    AddTraderTrigger("task","Well, to survive the winter, it takes more than a slice of meat. I assume the meat of a dozen fallow deer from Elstree forest will make my children survive. Will you save their lives?");
    AddAdditionalTrigger("adventure");
    AddCondition("qpg","=",8);
    AddConsequence("qpg","=",9);
    AddConsequence("inform","[New quest] The Poacher II");
    AddTraderTrigger("Auftrag","Um den Winter zu überleben braucht man mehr als ein Stück Fleisch. Ich schätze, dass das Fleisch von einem Dutzend Dammhirschen aus dem Elsbaumwald wenigstens meine Kinder am Leben halten wird. Werdet ihr ihre Leben retten?");
    AddAdditionalTrigger("Aufgabe");
    AddAdditionalTrigger("Abenteuer");
    AddCondition("qpg","=",8);
    AddConsequence("qpg","=",9);
    AddConsequence("inform","[Neues Quest] Der Wilderer II");
    -- Quest 2 taken but not solved, repeat the instructions
    -- Too few monsters slain
    AddTraderTrigger("quest","You can find fallow deer in Elstree forest. Please, save my family from starvation.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg",">",8);
    AddCondition("qpg","<",21);
    AddCondition("lang","english");
    AddTraderTrigger("quest","Ihr könnt Dammhirsche im Elsbaumwald finden. Bitte, rettet meine Familie vor dem Verhungern.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg",">",8);
    AddCondition("qpg","<",21);
    AddTraderTrigger("task","You can find fallow deer in Elstree forest. Please, save my family from starvation.");
    AddAdditionalTrigger("adventure");
    AddCondition("qpg",">",8);
    AddCondition("qpg","<",21);
    AddTraderTrigger("Auftrag","Ihr könnt Dammhirsche im Elsbaumwald finden. Bitte, rettet meine Familie vor dem Verhungern.");
    AddAdditionalTrigger("Aufgabe");
    AddAdditionalTrigger("Abenteuer");
    AddCondition("qpg",">",8);
    AddCondition("qpg","<",21);
    -- Too few items
    AddTraderTrigger("quest","Slaying animals and leaving the meat for the carrion crows? How you dare! I beg you, on behalf of my children, every piece of meat can save a human's life.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",21);
    AddCondition("item",552,"all","<",12);
    AddCondition("lang","english");
    AddTraderTrigger("quest","Viele Tiere getötet, aber das Fleisch den Krähen überlassen? Ist dem so! Ich flehe euch an, im Namen meiner Kinder, jeder Bissen Fleisch kann ein Menschenleben retten.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",21);
    AddCondition("item",552,"all","<",12);
    AddTraderTrigger("task","Slaying animals and leaving the meat for the carrion crows? How you dare! I beg you, on behalf of my children, every piece of meat can save a human's life.");
    AddAdditionalTrigger("adventure");
    AddCondition("qpg","=",21);
    AddCondition("item",552,"all","<",12);
    AddTraderTrigger("Auftrag","Viele Tiere getötet, aber das Fleisch den Krähen überlassen? Ist dem so! Ich flehe euch an, im Namen meiner Kinder, jeder Bissen Fleisch kann ein Menschenleben retten.");
    AddAdditionalTrigger("Aufgabe");
    AddAdditionalTrigger("Abenteuer");
    AddCondition("qpg","=",21);
    AddCondition("item",552,"all","<",12);
    -- Quest 2 solved, reward: Golden ring, copper goblet, emerald amulet, 200cp
    AddTraderTrigger(".+","How great! You brought enough meat for my whole family. Here, I... found a bag with precious things. You can have it as reward.");
    AddCondition("qpg","=",21);
    AddCondition("item",552,"all",">",11);
    AddCondition("lang","english");
    AddConsequence("qpg","=",22);
    AddConsequence("money","+",200);
    AddConsequence("deleteitem",552,12);
    AddConsequence("item",235,1,666,0);
    AddConsequence("item",1840,1,666,0);
    AddConsequence("item",62,1,666,0);
    AddConsequence("inform","[Quest solved] You are awarded a golden ring, a copper goblet, an emerald amulet and 200 copper coins.");
    AddTraderTrigger(".+","Großartig! Ihr habt genug Fleisch für meine ganze Familie mitgebracht. Hier, ich habe diesen Beutel mit kostbaren Dingen... gefunden. Nehmt ihn als Belohnung.");
    AddCondition("qpg","=",21);
    AddCondition("item",552,"all",">",11);
    AddConsequence("qpg","=",22);
    AddConsequence("money","+",200);
    AddConsequence("deleteitem",552,12);
    AddConsequence("item",235,1,666,0);
    AddConsequence("item",1840,1,666,0);
    AddConsequence("item",62,1,666,0);
    AddConsequence("inform","[Quest gelöst] Du erhältst einen goldenen Ring, einen Kupferkelch, ein Smaragdamulet und 200 Kupferstücke.");
    -- 3rd quest: Kill 6 wolves
    -- Give out quest 3
    AddTraderTrigger("quest","Recently, a pack of wolves entered Elstree forest. They hunt all the fallow deer I need to feed my children. Will you stop the pack? There are at least half a dozen of them.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",22);
    AddCondition("lang","english");
    AddConsequence("qpg","=",23);
    AddConsequence("inform","[New quest] The Poacher III");
    AddTraderTrigger("quest","Seit kurzem treibt ein Wolfsudel sein Unwesen im Elsbaumwald. Die Wölfe reißen all die Dammhirsche, die ich brauche, um meine Kinder zu ernähren. Werdet ihr das Rudel niederstrecken? Ich habe mindestens ein halbes Dutzend von ihnen gesehen.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",22);
    AddConsequence("qpg","=",23);
    AddConsequence("inform","[Neues Quest] Der Wilderer III");
    AddTraderTrigger("task","Recently, a pack of wolves entered Elstree forest. They hunt all the fallow deer I need to feed my children. Will you stop the pack? There are at least half a dozen of them.");
    AddAdditionalTrigger("adventure");
    AddCondition("qpg","=",22);
    AddConsequence("qpg","=",23);
    AddConsequence("inform","[New quest] The Poacher III");
    AddTraderTrigger("Auftrag","Seit kurzem treibt ein Wolfsudel sein Unwesen im Elsbaumwald. Die Wölfe reißen all die Dammhirsche, die ich brauche, um meine Kinder zu ernähren. Werdet ihr das Rudel niederstrecken? Ich habe mindestens ein halbes Dutzend von ihnen gesehen.");
    AddAdditionalTrigger("Aufgabe");
    AddAdditionalTrigger("Abenteuer");
    AddCondition("qpg","=",22);
    AddConsequence("qpg","=",23);
    AddConsequence("inform","[Neues Quest] Der Wilderer III");
    -- Quest 3 taken but not solved, repeat the instructions
    AddTraderTrigger("quest","The wolf pack still roams the Elstree forest. Please, slay them all to save my childrens' futures.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg",">",22);
    AddCondition("qpg","<",29);
    AddCondition("lang","english");
    AddTraderTrigger("quest","Das Wolfsrudel treibt noch immer sein Unwesen im Elsbaumwald. Bitte streckt sie alle nieder um die Zukunft meiner Kinder zu sichern.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg",">",22);
    AddCondition("qpg","<",29);
    AddTraderTrigger("task","The wolf pack still roams the Elstree forest. Please, slay them all to save my children's futures.");
    AddAdditionalTrigger("adventure");
    AddCondition("qpg",">",22);
    AddCondition("qpg","<",29);
    AddTraderTrigger("Auftrag","Das Wolfsrudel treibt noch immer sein Unwesen im Elsbaumwald. Bitte streckt sie alle nieder um die Zukunft meiner Kinder zu sichern.");
    AddAdditionalTrigger("Aufgabe");
    AddAdditionalTrigger("Abenteuer");
    AddCondition("qpg",">",22);
    AddCondition("qpg","<",29);
    -- Quest 3 solved, reward: Longbow, 100 poisoned arrows
    AddTraderTrigger(".+","Words cannot express how grateful I am. Take my very own bow, now that the wolves are gone, I can rely on my spear again.");
    AddCondition("qpg","=",29);
    AddCondition("lang","english");
    AddConsequence("qpg","=",30);
    AddConsequence("item",2708,1,777,0);
    AddConsequence("item",549,100,333,0);
    AddConsequence("inform","[Quest solved] You are awarded a long bow and 100 poisoned arrows.");
    AddTraderTrigger(".+","Worte können nicht beschreiben, wie dankbar ich bin. Nehmt meine Bogen, nun, da die Wölfe fort sind, kann ich mich wieder auf meinen Speer verlassen.");
    AddCondition("qpg","=",29);
    AddConsequence("qpg","=",30);
    AddConsequence("item",2708,1,777,0);
    AddConsequence("item",549,100,333,0);
    AddConsequence("inform","[Quest gelöst] Du erhältst einen Langbogen und 100 vergiftete Pfeile.");
    -- 4th quest: Kill 1 elven hunter
    -- Give out quest 4
    AddTraderTrigger("quest","You may wonder why I didn't set out to hunt on my own. The self proclaimed guardians of the forest do not appreciate my deeds. I'd welcome if you'd make the elven guardian... disappear.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",30);
    AddCondition("lang","english");
    AddConsequence("qpg","=",31);
    AddConsequence("inform","[New quest] The Poacher IV");
    AddTraderTrigger("quest","Ihr mögt euch fragen, warum ich noch nicht selbst zur Jagd ausgezogen bin. Die selbsternannten Wächter des Waldes heißen nicht gut, was ich tue. Ich würde es begrüßen, wenn ihr die Elfenwache... verschwinden lassen würdet.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",30);
    AddConsequence("qpg","=",31);
    AddConsequence("inform","[Neues Quest] Der Wilderer IV");
    AddTraderTrigger("task","You may wonder why I didn't set out to hunt on my own. The self proclaimed guardians of the forest do not appreciate my deeds. I'd welcome if you'd make the elven guardian... disappear.");
    AddAdditionalTrigger("adventure");
    AddCondition("qpg","=",30);
    AddConsequence("qpg","=",31);
    AddConsequence("inform","[New quest] The Poacher IV");
    AddTraderTrigger("Auftrag","Ihr mögt euch fragen, warum ich noch nicht selbst zur Jagd ausgezogen bin. Die selbsternannten Wächter des Waldes heißen nicht gut, was ich tue. Ich würde es begrüßen, wenn ihr die Elfenwache... verschwinden lassen würdet.");
    AddAdditionalTrigger("Aufgabe");
    AddAdditionalTrigger("Abenteuer");
    AddCondition("qpg","=",30);
    AddConsequence("qpg","=",31);
    AddConsequence("inform","[Neues Quest] Der Wilderer IV");
    -- Quest 3 taken but not solved, repeat the instructions
    AddTraderTrigger("quest","There are still a pair of keen eyes in the Elstree forest that won't let me hunt what I need. Please, could you... shut those eyes?");
    AddAdditionalTrigger("mission");
    AddCondition("qpg",">",30);
    AddCondition("qpg","<",32);
    AddCondition("lang","english");
    AddTraderTrigger("quest","Es gibt immernoch ein Paar aufmerksamer Augen im Elsbaumwald, welches mich nicht das jagen lässt, was ich brauche. Könntet ihr bitte diese Augen... für immer schließen?");
    AddAdditionalTrigger("mission");
    AddCondition("qpg",">",30);
    AddCondition("qpg","<",32);
    AddTraderTrigger("task","There are still a pair of keen eyes in the Elstree forest that won't let me hunt what I need. Please, could you... shut those eyes?");
    AddAdditionalTrigger("adventure");
    AddCondition("qpg",">",30);
    AddCondition("qpg","<",32);
    AddTraderTrigger("Auftrag","Es gibt immernoch ein Paar aufmerksamer Augen im Elsbaumwald, welches mich nicht das jagen lässt, was ich brauche. Könntet ihr bitte diese Augen... für immer schließen?");
    AddAdditionalTrigger("Aufgabe");
    AddAdditionalTrigger("Abenteuer");
    AddCondition("qpg",">",30);
    AddCondition("qpg","<",32);
    -- Quest 4 solved, reward:
    AddTraderTrigger(".+","Hooray! No elven rapscallion will keep me from hunting anymore! Of course, just to feed my children... However, take this ring, it helped me evading those wicked elves long enough.");
    AddCondition("qpg","=",32);
    AddCondition("lang","english");
    AddConsequence("qpg","=",33);
    AddConsequence("item",68,1,888,21);
    AddConsequence("inform","[Quest solved] You are awarded magical ruby ring.");
    AddTraderTrigger(".+","Hurra! Kein elfischer Halunke wird sich mir nun noch in den Weg stellen, wenn ich jagen gehen... natürlich, um meine Kinder zu ernähren, versteht sich. Hier, nehmt diesen Ring, er hat mir lange genug geholfen, mich diesen verdammten Elfen zu entziehen.");
    AddCondition("qpg","=",32);
    AddConsequence("qpg","=",33);
    AddConsequence("item",68,1,888,21);
    AddConsequence("inform","[Quest gelöst] Du erhältst einen magischen Rubinring.");
    -- No more quests, just nice words of gratitude
    AddTraderTrigger("quest","My friend, you helped me and my family more than enough. Thank you and may Malachin bless you.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",33);
    AddCondition("lang","english");
    AddTraderTrigger("quest","Mein Freund, ihr habt mir und meiner Familie mehr als genug geholfen. Habt dank und möge Malachin euch segnen.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",33);
    AddTraderTrigger("task","My friend, you helped me and my family more than enough. Thank you and may Malachin bless you.");
    AddAdditionalTrigger("adventure");
    AddCondition("qpg","=",33);
    AddTraderTrigger("Auftrag","Mein Freund, ihr habt mir und meiner Familie mehr als genug geholfen. Habt dank und möge Malachin euch segnen.");
    AddAdditionalTrigger("Aufgabe");
    AddAdditionalTrigger("Abenteuer");
    AddCondition("qpg","=",33);
    -- Easteregg (optional): Think about a funny, unrelated trigger with a surprising answer
    AddTraderTrigger("easter","I once found a strange egg in the Elstree forest. It was huge! But I left it where it was, who knows what hatches from such eggs.");
    AddAdditionalTrigger("egg");
    AddTraderTrigger("osterei","Einst habe ich ein merkwürdiges Ei im Elsbaumwald gefunden. Es war riesig! Aber ich habe es zurückgelassen, wo es war, wer weiß, was aus solchen Eiern alles schlüpfen kann.");
    -- Last catch: Think about keyphrases the player might say and that are not caught until here.
    AddTraderTrigger("Yes","Indeed?");
    AddAdditionalText("So, what?");
    AddAdditionalText("#me shakes his head slightly: 'Sorry, can you rephrase that?'");
    AddTraderTrigger("Ja","Ist dem so?");
    AddAdditionalText("Gut, und nun?");
    AddAdditionalText("#me schüttelt seinen Kopf: 'Entschuldigt, könnt ihr das anders ausdrücken?'");
    AddTraderTrigger("No","I don't quite understand, sorry.");
    AddAdditionalText("Pardon me?");
    AddAdditionalText("What?!");
    AddTraderTrigger("Nein","Ich verstehe nicht recht...");
    AddAdditionalText("Entschuldigt?");
    AddAdditionalText("Was?!");
    -- Cycletext: Add as many random messages as possible
    AddCycleText("#me schärft sein Messer.","#me sharpens his knife.");
    AddCycleText("#me murmelt: 'Verdammte Wölfe!'","#me mumbles: 'Damned wolves!'");
    AddCycleText("#me hustet.","#me coughs.");
    AddCycleText("#me nießt.","#me sneezes.");
    AddCycleText("#me sortiert einige Felle, offensichtlich bedacht, dies nicht allzu auffällig zu tun.","#me sorts some fur, obviously trying to hide them.");
    AddCycleText("#me zählt die Pfeile in einem fein bestickten Köcher.","#me counts arrows in a decorated quiver.");
    AddCycleText("#me spitzt einen langen Stock mit einem Messer an.","#me carves a long stick with a knife.");
    AddCycleText("Psst, wollt ihr bestes Fell... oh! Ich habe nichts gesagt.","Shh, want to have best fur... uh, nevermind!");
    AddCycleText("#me steckt grinsend einen Stock in eine sofort zuschnappende Falle.","#me sticks a stick into a snapping trap, grinning.");
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
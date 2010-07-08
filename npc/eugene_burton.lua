-- INSERT INTO npc VALUES (nextval('npc_seq'),0,707,484,0,4,false,'Eugene Burton','npc_eugene_burton.lua',0);

require("npc.base.autonpcfunctions")
module("npc.eugene_burton", package.seeall)

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

    npc.base.autonpcfunctions.SetRadius(10);
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
    npc.base.autonpcfunctions.AddTraderTrigger("set 0","");
    npc.base.autonpcfunctions.AddConsequence("inform","[Debugging] Quest status set to 0");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",0);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","");
    npc.base.autonpcfunctions.AddCondition("qpg",">",33);
    npc.base.autonpcfunctions.AddConsequence("inform","[Error] Something went wrong, please inform a developer.");
    -- Help
    npc.base.autonpcfunctions.AddTraderTrigger("Help","");
    npc.base.autonpcfunctions.AddConsequence("inform","[Game Help] This is NPC is the poacher Eugene Burton. Keyphrases: Hello, quest, poacher, animals.");
    npc.base.autonpcfunctions.AddTraderTrigger("Hilfe","");
    npc.base.autonpcfunctions.AddConsequence("inform","[Spielhilfe] Dieser NPC ist der Wilderer Eugene Burton. Schlüsselwörter: Hallo, Quest, Wilderer, Tiere.");
    -- General speech
    npc.base.autonpcfunctions.AddTraderTrigger("Hello","Shh! Not so loud! You'll scare away my game!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greetings");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Be greeted");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hail");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good day");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good morning");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good evening");
    npc.base.autonpcfunctions.AddTraderTrigger("Grüße","Psst, nicht so laut, ihr verscheucht ja das ganze Wild.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Gruß");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Seid gegrüßt");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Guten Tag");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Guten Abend");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Mahlzeit");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Tach");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Moin");
    npc.base.autonpcfunctions.AddTraderTrigger("Hiho","Shh! Not so loud! You'll scare away my game!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Hiho","Psst, nicht so laut, ihr verscheucht ja das ganze Wild.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("Farewell","Go forth with Malachin's blessing. May you never starve.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good bye");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Bye");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Fare thy well");
    npc.base.autonpcfunctions.AddTraderTrigger("Tschüß","Geht mit Malachins Segen. Auf dass ihr nie Hunger leiden müßt.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Tschüss");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Wiedersehen");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Gehabt euch wohl");
    npc.base.autonpcfunctions.AddTraderTrigger("Ciao","Go forth with Malachin's blessing. May you never starve");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Ciao","Geht mit Malachins Segen. Auf dass ihr nie Hunger leiden müßt.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("How are you","I'd feel much better if you could help me a bit, hunting.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("How feel");
    npc.base.autonpcfunctions.AddAdditionalTrigger("How do you do");
    npc.base.autonpcfunctions.AddTraderTrigger("Wie geht","Ich würde mich weit besser fühlen, wenn ihr mir bei der Jagd helfen könntet.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Wie fühlst");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Wie ist es ergangen");
    npc.base.autonpcfunctions.AddTraderTrigger("your name","I am Eugene Burton; father to four hungry mouths. Feeding those mouths has become so difficult these days...");
    npc.base.autonpcfunctions.AddAdditionalTrigger("who are you");
    npc.base.autonpcfunctions.AddAdditionalTrigger("who art thou");
    npc.base.autonpcfunctions.AddTraderTrigger("dein name","Ich bin Eugene Burton, Vater von vier hungrigen Mäulern. Diese zu stopfen ist dieser Tage wirklich schwierig geworden.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("wer bist du");
    npc.base.autonpcfunctions.AddAdditionalTrigger("wer seid ihr");
    npc.base.autonpcfunctions.AddAdditionalTrigger("wie heißt");
    -- Catching typical NPC phrases
    npc.base.autonpcfunctions.AddTraderTrigger("what sell","If I had something for trading, I'd sell everything to feed my family, I swear.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("what buy");
    npc.base.autonpcfunctions.AddAdditionalTrigger("list wares");
    npc.base.autonpcfunctions.AddAdditionalTrigger("price of");
    npc.base.autonpcfunctions.AddTraderTrigger("was verkauf","Hätte ich etwas zum handeln, so würde ich alles veräußern, um meine Familie zu ernähren. Das schwöre ich.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("was kauf");
    npc.base.autonpcfunctions.AddAdditionalTrigger("warenliste");
    npc.base.autonpcfunctions.AddAdditionalTrigger("preis von");
    npc.base.autonpcfunctions.AddTraderTrigger("tell something","I don't have the time to chat with you; my family is starving. Perhaps you can help me with a task?");
    npc.base.autonpcfunctions.AddTraderTrigger("erzähl was","Ich habe nicht die Zeit, mit euch zu plaudern; meine Familie ist am Verhungern. Vielleicht könnt ihr mir bei einer Aufgabe helfen?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("erzähl etwas");
    -- Small talk: The talk here should focus on possible questions. Feel free to add more!
    npc.base.autonpcfunctions.AddTraderTrigger("poacher","People call me a poacher, because they don't like what I do. But what do I do? I take only what my family needs!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("hunter");
    npc.base.autonpcfunctions.AddTraderTrigger("wilderer","Manche nennen mich einen Wilderer, denn ihnen misfällt, was ich tue. Aber was mache ich schon - ich nehme nur so viel, wie meine Familie benötigt.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("jäger");
    npc.base.autonpcfunctions.AddTraderTrigger("profession","People call me a poacher, because they don't like what I do. But what do I do? I take only what my family needs!");
    npc.base.autonpcfunctions.AddTraderTrigger("beruf","Manche nennen mich einen Wilderer, denn ihnen misfällt, was ich tue. Aber was mache ich schon - ich nehme nur so viel, wie meine Familie benötigt.");
    npc.base.autonpcfunctions.AddTraderTrigger("job","People call me a poacher, because they don't like what I do. But what do I do? I take only what my family needs!");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("job","Manche nennen mich einen Wilderer, denn ihnen misfällt, was ich tue. Aber was mache ich schon - ich nehme nur so viel, wie meine Familie benötigt.");
    -- More small talk; add at least five triggers
    npc.base.autonpcfunctions.AddTraderTrigger("valandil","Wicked elves! They think that the life of an animal is worth much more than the life of my four children. Valandil Elensar, the self proclaimed guardian of the Elstree forest, is the worst!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("elensar");
    npc.base.autonpcfunctions.AddAdditionalTrigger("elf");
    npc.base.autonpcfunctions.AddAdditionalTrigger("elfen");
    npc.base.autonpcfunctions.AddAdditionalTrigger("elves");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("valandil","Vermaledeite Elfen! Sie schätzen das Leben eines Tieres mehr als das Leben meiner vier Kinder. Valandial Elensar, der selbsternannte Hüter des Elsbaumwaldes, ist der schlimmste von allen.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("elensar");
    npc.base.autonpcfunctions.AddAdditionalTrigger("elf");
    npc.base.autonpcfunctions.AddAdditionalTrigger("elfen");
    npc.base.autonpcfunctions.AddAdditionalTrigger("elves");
    npc.base.autonpcfunctions.AddTraderTrigger("law","Legal, illegal... I give a damn!");
    npc.base.autonpcfunctions.AddTraderTrigger("Gesetz","Legal, illegal... Scheißegal!");
    npc.base.autonpcfunctions.AddTraderTrigger("animal","There are countless animals in the Elstree forest, waiting for me and my bow: rabbits, deers and, sadly, even wolves.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("game");
    npc.base.autonpcfunctions.AddTraderTrigger("Tier","Es gibt im Elsbaumwald unzählige Tiere, die nur auf mich und meinen Bogen warten: Hasen, Rehe und leider auch Wölfe.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Beute");
    npc.base.autonpcfunctions.AddTraderTrigger("forest","The Elstree forest is a good place to hunt; unfortunately wolves know that too. I still wonder what an Elstree is, actually.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("woods");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Elstree");
    npc.base.autonpcfunctions.AddTraderTrigger("Wald","Der Elsbaumwald ist ein gutes Jagdgebiet. Leider haben das auch schon die Wölfe begriffen. Ich frag mich allerdings schon länger, was eigentlich genau ein Elsbaum sein soll.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Elsbaum");
    npc.base.autonpcfunctions.AddTraderTrigger("rabbit","Catching those rabbits is more difficult than you might think. They are damn fast!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("bunny");
    npc.base.autonpcfunctions.AddTraderTrigger("Hase","Hasen zu fangen ist schwerer, als man denkt; sie sind verdammt schnell!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Häßchen");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Kaninchen");
    npc.base.autonpcfunctions.AddTraderTrigger("Reh","Es gibt immer weniger Dammhirsche im Elsbaumwald. Ich frage mich nur, warum...");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hirsch");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Wild");
    npc.base.autonpcfunctions.AddTraderTrigger("Stag","Fewer and fewer deer can be found in the Elstree forest. I wonder why...");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Deer");
    npc.base.autonpcfunctions.AddTraderTrigger("Wolf","Wolves! They prey on what feeds my children. Just to feed their blasted cubs!");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Wolf","Wölfe! Sie machen Jagd auf das, was meine Kinder am Leben erhält. Und das nur, um ihre eigene Brut zu füttern!");
    npc.base.autonpcfunctions.AddTraderTrigger("Wolves","Wolves! They prey on what feeds my children. Just to feed their blasted cubs!");
    npc.base.autonpcfunctions.AddTraderTrigger("Wölfe","Wölfe! Sie machen Jagd auf das, was meine Kinder am Leben erhält. Und das nur, um ihre eigene Brut zu füttern!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Woelfe");
    npc.base.autonpcfunctions.AddTraderTrigger("Father","My family starves, and all I can do is to hunt. However, these insane elves prefer to see humans die, rather than animals.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("children");
    npc.base.autonpcfunctions.AddAdditionalTrigger("family");
    npc.base.autonpcfunctions.AddTraderTrigger("Vater","Meine Familie ist am verhungern und alles, was ich tun kann, ist zu Jagen. Aber diese vermaledeiten Elfen haben es lieber wenn Menschen statt Tiere sterben.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Kinder");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Familie");
    npc.base.autonpcfunctions.AddTraderTrigger("fur","Hush! I do not hunt to get fur... but if I end the life of an animal to feed my family, do you expect me to leave behind what yields good coin?");
    npc.base.autonpcfunctions.AddTraderTrigger("fell","Pah! Ich jage nicht der Felle wegen... nunja, wenn ich schon das Leben eines Tieres beenden muss, um meine Famlilie zu ernähren, sollte ich das zurücklassen, womit man ordentlich abkassieren kann?");
    -- Faction stuff
    npc.base.autonpcfunctions.AddTraderTrigger("Elvaine","The mages always dictated what's going on in Runewick. I fear this is never going to change. They don't give a damn about the needs of the common people.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Morgan");
    npc.base.autonpcfunctions.AddAdditionalTrigger("archmage");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Erzmagier");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Elvaine","Immer schon haben die Magier in Runewick den Ton angegeben. Ich fürchte, dies wird sich nie ändern; die Bedürfnisse der einfachen Leute sind denen egal.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Morgan");
    npc.base.autonpcfunctions.AddAdditionalTrigger("archmage");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Erzmagier");
    npc.base.autonpcfunctions.AddTraderTrigger("Runewick","Runewick, ha! The self proclaimed protectors of everything. They'd better protect themselves from my arrows!");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Runewick","Runewick, ha! Die selbsternannten Hüter von allem möglichen. Die sollten sich besser vor meinen Pfeilen hüten!");
    npc.base.autonpcfunctions.AddTraderTrigger("Valerio","The Don of Galmair scares me. I prefer to stay out of his sight.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Guilianni");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Don");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Valerio","Der Don von Galmair macht mir Angst. Ich gehe im lieber aus dem Weg.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Guilianni");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Don");
    npc.base.autonpcfunctions.AddTraderTrigger("Galmair","Oh, Galmair, a good place to sell fur for a good coin. Uhm, to buy food... of course.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Galmair","Oh, Galmair, das ist ein guter Ort, um ordentlich für Felle abzukassieren. Äh, um Essen zu kaufen... meine ich.");
    npc.base.autonpcfunctions.AddTraderTrigger("rosaline","She is... hot. I swear, I love my wife, but I can't fight my dreams.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("königin");
    npc.base.autonpcfunctions.AddAdditionalTrigger("queen");
    npc.base.autonpcfunctions.AddAdditionalTrigger("edwards");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("rosaline","Sie ist... heiß. Ich schwöre, dass ich meine Frau liebe, aber für seine Träume kann man nichts.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("königin");
    npc.base.autonpcfunctions.AddAdditionalTrigger("queen");
    npc.base.autonpcfunctions.AddAdditionalTrigger("edwards");
    npc.base.autonpcfunctions.AddTraderTrigger("Cadomyr","Cadomyr is a bad place for hunters. Not much to hunt there, except sand and scorpions.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Cadomyr","Cadomyr ist kein guter Ort für die Jagd. Man kann dort nicht viel jagen, außer nach Sand und Skorpionen.");
    -- Main land factions
    npc.base.autonpcfunctions.AddTraderTrigger("albar","I heard a lot about Albar and I wait eagerly for the day I can travel there. But I doubt this day will ever come; too poor I am.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("albar","Ich habe schon eine Menge über Albar gehört und ich warte sehnsüchtig auf den Tag, an dem ich dort hinreisen kann. Aber ich glaube nicht, dass dieser Tage jemals kommt, so arm bin ich.");
    npc.base.autonpcfunctions.AddTraderTrigger("gynk","Gynk is a pool of sins. But aren't we all sinnners one day?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("gync");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("gync","Gynk ist ein Sündenpfuhl. Aber sündigen wir nicht alle einmal?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("gynk");
    npc.base.autonpcfunctions.AddTraderTrigger("salkama","Noble folk are living there; but also poor people. And nobody really cares about them!");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("salkama","Hochwohlgeborenes Volk lebt dort; aber auch arme Leute wie ich. Und niemanden schert es, wie es denen ergeht!");
    -- Gods; each NPC should react on AT LEAST one god, being a follower of said god
    npc.base.autonpcfunctions.AddTraderTrigger("Malachin","Praise Malachin, the god of all hunters. May he guide my bow.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Malachin","Lobet Malachin, den Gott der Jagd. Möge er meinen Bogen führen.");
    -- 1st quest: Kill 6 bunnies, provide 6 rabbit meat
    -- Give out quest 1
    npc.base.autonpcfunctions.AddTraderTrigger("quest","My family is starving and without food, we won't survive the next winter. Please, will you head for Elstree forest, hunt half a dozen rabbits and bring me their meat?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",0);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddConsequence("inform","[New quest] The Poacher I");
    npc.base.autonpcfunctions.AddTraderTrigger("quest","Meine Familie ist am verhungern und ohne etwas zu essen überleben wir den Winter nicht. Bitte, könntet ihr bitte in den Elsbaumwald gehen, ein halbes Dutzend Hasen jagen und mir ihr Fleische bringen?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",0);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Der Wilderer I");
    npc.base.autonpcfunctions.AddTraderTrigger("task","My family is starving and without food, we won't survive the next winter. Please, will you head for Elstree forest, hunt half a dozen rabbits and bring me their meat?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npc.base.autonpcfunctions.AddCondition("qpg","=",0);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddConsequence("inform","[New quest] The Poacher I");
    npc.base.autonpcfunctions.AddTraderTrigger("Auftrag","Meine Familie ist am verhungern und ohne etwas zu essen überleben wir den Winter nicht. Bitte, könntet ihr bitte in den Elsbaumwald gehen, ein halbes Dutzend Hasen jagen und mir ihr Fleisch bringen?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Aufgabe");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npc.base.autonpcfunctions.AddCondition("qpg","=",0);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Der Wilderer I");
    -- Quest 1 taken but not solved, repeat the instructions
    -- Too few monsters slain
    npc.base.autonpcfunctions.AddTraderTrigger("quest","Oh, please, will you hunt half a dozen rabbits in the Elstree forest? My children beg for food, every day, and I have to disappoint them over and over again.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg",">",0);
    npc.base.autonpcfunctions.AddCondition("qpg","<",7);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("quest","Oh, würdet ihr bitte ein halbes Dutzend Hasen im Elsbaumwald jagen gehen? Meine Kinder flehen um etwas zu essen und jeden Tag muss ich sie aufs Neue enttäuschen.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg",">",0);
    npc.base.autonpcfunctions.AddCondition("qpg","<",7);
    npc.base.autonpcfunctions.AddTraderTrigger("task","Oh, please, will you hunt half a dozen rabbits in the Elstree forest? My children beg for food, every day, and I have to disappoint them over and over again.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npc.base.autonpcfunctions.AddCondition("qpg",">",0);
    npc.base.autonpcfunctions.AddCondition("qpg","<",7);
    npc.base.autonpcfunctions.AddTraderTrigger("Auftrag","Oh, würdet ihr bitte ein halbes Dutzend Hasen im Elsbaumwald jagen gehen? Meine Kinder flehen um etwas zu essen und jeden Tag muss ich sie aufs Neue enttäuschen.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Aufgabe");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npc.base.autonpcfunctions.AddCondition("qpg",">",0);
    npc.base.autonpcfunctions.AddCondition("qpg","<",7);
    -- Too few items
    npc.base.autonpcfunctions.AddTraderTrigger("quest","Did you perhaps forget the rabbit meat in the forest? Please, quick, fetch it. My children will thank you.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",7);
    npc.base.autonpcfunctions.AddCondition("item",553,"all","<",6);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("quest","Habt ihr etwa das Fleisch der Hasen im Wald vergessen? Bitte, lauft, und holt es! Meine Kinder werden es euch danken.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",7);
    npc.base.autonpcfunctions.AddCondition("item",553,"all","<",6);
    npc.base.autonpcfunctions.AddTraderTrigger("task","Did you perhaps forget the rabbit meat in the forest? Please, quick, fetch it. My children will thank you.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npc.base.autonpcfunctions.AddCondition("qpg","=",7);
    npc.base.autonpcfunctions.AddCondition("item",553,"all","<",6);
    npc.base.autonpcfunctions.AddTraderTrigger("Auftrag","Habt ihr etwa das Fleisch der Hasen im Wald vergessen? Bitte, lauft, und holt es! Meine Kinder werden es euch danken.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Aufgabe");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npc.base.autonpcfunctions.AddCondition("qpg","=",7);
    npc.base.autonpcfunctions.AddCondition("item",553,"all","<",6);
    -- Quest 1 solved, reward: 250 arrows
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Thank you very, very much for the food. Rabbit meat will silence the bellies of my children, at least for some days. Take this quiver of arrows, it will help you hunting.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",7);
    npc.base.autonpcfunctions.AddCondition("item",553,"all",">",5);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",8);
    npc.base.autonpcfunctions.AddConsequence("deleteitem",553,6);
    npc.base.autonpcfunctions.AddConsequence("item",64,250,333,0);
    npc.base.autonpcfunctions.AddConsequence("inform","[Quest solved] You are awarded 250 arrows.");
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Vielen, vielen Dank. Dieses Hasenfleisch wird das Magenknurren meiner Kinder wenigstens für ein paar Tage besänftigen. Hier, nehmt diesen Köcher voll Pfeile, sie werden euch auf der Jagd gute Dienste erweisen.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",7);
    npc.base.autonpcfunctions.AddCondition("item",553,"all",">",5);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",8);
    npc.base.autonpcfunctions.AddConsequence("deleteitem",553,6);
    npc.base.autonpcfunctions.AddConsequence("item",64,250,333,0);
    npc.base.autonpcfunctions.AddConsequence("inform","[Quest gelöst] Du erhältst 250 Pfeile.");
    -- 2nd quest: Kill 12 deers, provide 12 deer meat
    -- Give out quest 2
    npc.base.autonpcfunctions.AddTraderTrigger("quest","Well, to survive the winter, it takes more than a slice of meat. I assume the meat of a dozen fallow deer from Elstree forest will make my children survive. Will you save their lives?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",8);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",9);
    npc.base.autonpcfunctions.AddConsequence("inform","[New quest] The Poacher II");
    npc.base.autonpcfunctions.AddTraderTrigger("quest","Um den Winter zu überleben braucht man mehr als ein Stück Fleisch. Ich schätze, dass das Fleisch von einem Dutzend Dammhirschen aus dem Elsbaumwald wenigstens meine Kinder am Leben halten wird. Werdet ihr ihre Leben retten?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",8);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",9);
    npc.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Der Wilderer II");
    npc.base.autonpcfunctions.AddTraderTrigger("task","Well, to survive the winter, it takes more than a slice of meat. I assume the meat of a dozen fallow deer from Elstree forest will make my children survive. Will you save their lives?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npc.base.autonpcfunctions.AddCondition("qpg","=",8);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",9);
    npc.base.autonpcfunctions.AddConsequence("inform","[New quest] The Poacher II");
    npc.base.autonpcfunctions.AddTraderTrigger("Auftrag","Um den Winter zu überleben braucht man mehr als ein Stück Fleisch. Ich schätze, dass das Fleisch von einem Dutzend Dammhirschen aus dem Elsbaumwald wenigstens meine Kinder am Leben halten wird. Werdet ihr ihre Leben retten?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Aufgabe");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npc.base.autonpcfunctions.AddCondition("qpg","=",8);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",9);
    npc.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Der Wilderer II");
    -- Quest 2 taken but not solved, repeat the instructions
    -- Too few monsters slain
    npc.base.autonpcfunctions.AddTraderTrigger("quest","You can find fallow deer in Elstree forest. Please, save my family from starvation.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg",">",8);
    npc.base.autonpcfunctions.AddCondition("qpg","<",21);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("quest","Ihr könnt Dammhirsche im Elsbaumwald finden. Bitte, rettet meine Familie vor dem Verhungern.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg",">",8);
    npc.base.autonpcfunctions.AddCondition("qpg","<",21);
    npc.base.autonpcfunctions.AddTraderTrigger("task","You can find fallow deer in Elstree forest. Please, save my family from starvation.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npc.base.autonpcfunctions.AddCondition("qpg",">",8);
    npc.base.autonpcfunctions.AddCondition("qpg","<",21);
    npc.base.autonpcfunctions.AddTraderTrigger("Auftrag","Ihr könnt Dammhirsche im Elsbaumwald finden. Bitte, rettet meine Familie vor dem Verhungern.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Aufgabe");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npc.base.autonpcfunctions.AddCondition("qpg",">",8);
    npc.base.autonpcfunctions.AddCondition("qpg","<",21);
    -- Too few items
    npc.base.autonpcfunctions.AddTraderTrigger("quest","Slaying animals and leaving the meat for the carrion crows? How you dare! I beg you, on behalf of my children, every piece of meat can save a human's life.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",21);
    npc.base.autonpcfunctions.AddCondition("item",552,"all","<",12);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("quest","Viele Tiere getötet, aber das Fleisch den Krähen überlassen? Ist dem so! Ich flehe euch an, im Namen meiner Kinder, jeder Bissen Fleisch kann ein Menschenleben retten.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",21);
    npc.base.autonpcfunctions.AddCondition("item",552,"all","<",12);
    npc.base.autonpcfunctions.AddTraderTrigger("task","Slaying animals and leaving the meat for the carrion crows? How you dare! I beg you, on behalf of my children, every piece of meat can save a human's life.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npc.base.autonpcfunctions.AddCondition("qpg","=",21);
    npc.base.autonpcfunctions.AddCondition("item",552,"all","<",12);
    npc.base.autonpcfunctions.AddTraderTrigger("Auftrag","Viele Tiere getötet, aber das Fleisch den Krähen überlassen? Ist dem so! Ich flehe euch an, im Namen meiner Kinder, jeder Bissen Fleisch kann ein Menschenleben retten.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Aufgabe");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npc.base.autonpcfunctions.AddCondition("qpg","=",21);
    npc.base.autonpcfunctions.AddCondition("item",552,"all","<",12);
    -- Quest 2 solved, reward: Golden ring, copper goblet, emerald amulet, 200cp
    npc.base.autonpcfunctions.AddTraderTrigger(".+","How great! You brought enough meat for my whole family. Here, I... found a bag with precious things. You can have it as reward.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",21);
    npc.base.autonpcfunctions.AddCondition("item",552,"all",">",11);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",22);
    npc.base.autonpcfunctions.AddConsequence("money","+",200);
    npc.base.autonpcfunctions.AddConsequence("deleteitem",552,12);
    npc.base.autonpcfunctions.AddConsequence("item",235,1,666,0);
    npc.base.autonpcfunctions.AddConsequence("item",1840,1,666,0);
    npc.base.autonpcfunctions.AddConsequence("item",62,1,666,0);
    npc.base.autonpcfunctions.AddConsequence("inform","[Quest solved] You are awarded a golden ring, a copper goblet, an emerald amulet and 200 copper coins.");
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Großartig! Ihr habt genug Fleisch für meine ganze Familie mitgebracht. Hier, ich habe diesen Beutel mit kostbaren Dingen... gefunden. Nehmt ihn als Belohnung.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",21);
    npc.base.autonpcfunctions.AddCondition("item",552,"all",">",11);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",22);
    npc.base.autonpcfunctions.AddConsequence("money","+",200);
    npc.base.autonpcfunctions.AddConsequence("deleteitem",552,12);
    npc.base.autonpcfunctions.AddConsequence("item",235,1,666,0);
    npc.base.autonpcfunctions.AddConsequence("item",1840,1,666,0);
    npc.base.autonpcfunctions.AddConsequence("item",62,1,666,0);
    npc.base.autonpcfunctions.AddConsequence("inform","[Quest gelöst] Du erhältst einen goldenen Ring, einen Kupferkelch, ein Smaragdamulet und 200 Kupferstücke.");
    -- 3rd quest: Kill 6 wolves
    -- Give out quest 3
    npc.base.autonpcfunctions.AddTraderTrigger("quest","Recently, a pack of wolves entered Elstree forest. They hunt all the fallow deer I need to feed my children. Will you stop the pack? There are at least half a dozen of them.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",22);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",23);
    npc.base.autonpcfunctions.AddConsequence("inform","[New quest] The Poacher III");
    npc.base.autonpcfunctions.AddTraderTrigger("quest","Seit kurzem treibt ein Wolfsudel sein Unwesen im Elsbaumwald. Die Wölfe reißen all die Dammhirsche, die ich brauche, um meine Kinder zu ernähren. Werdet ihr das Rudel niederstrecken? Ich habe mindestens ein halbes Dutzend von ihnen gesehen.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",22);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",23);
    npc.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Der Wilderer III");
    npc.base.autonpcfunctions.AddTraderTrigger("task","Recently, a pack of wolves entered Elstree forest. They hunt all the fallow deer I need to feed my children. Will you stop the pack? There are at least half a dozen of them.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npc.base.autonpcfunctions.AddCondition("qpg","=",22);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",23);
    npc.base.autonpcfunctions.AddConsequence("inform","[New quest] The Poacher III");
    npc.base.autonpcfunctions.AddTraderTrigger("Auftrag","Seit kurzem treibt ein Wolfsudel sein Unwesen im Elsbaumwald. Die Wölfe reißen all die Dammhirsche, die ich brauche, um meine Kinder zu ernähren. Werdet ihr das Rudel niederstrecken? Ich habe mindestens ein halbes Dutzend von ihnen gesehen.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Aufgabe");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npc.base.autonpcfunctions.AddCondition("qpg","=",22);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",23);
    npc.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Der Wilderer III");
    -- Quest 3 taken but not solved, repeat the instructions
    npc.base.autonpcfunctions.AddTraderTrigger("quest","The wolf pack still roams the Elstree forest. Please, slay them all to save my childrens' futures.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg",">",22);
    npc.base.autonpcfunctions.AddCondition("qpg","<",29);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("quest","Das Wolfsrudel treibt noch immer sein Unwesen im Elsbaumwald. Bitte streckt sie alle nieder um die Zukunft meiner Kinder zu sichern.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg",">",22);
    npc.base.autonpcfunctions.AddCondition("qpg","<",29);
    npc.base.autonpcfunctions.AddTraderTrigger("task","The wolf pack still roams the Elstree forest. Please, slay them all to save my children's futures.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npc.base.autonpcfunctions.AddCondition("qpg",">",22);
    npc.base.autonpcfunctions.AddCondition("qpg","<",29);
    npc.base.autonpcfunctions.AddTraderTrigger("Auftrag","Das Wolfsrudel treibt noch immer sein Unwesen im Elsbaumwald. Bitte streckt sie alle nieder um die Zukunft meiner Kinder zu sichern.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Aufgabe");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npc.base.autonpcfunctions.AddCondition("qpg",">",22);
    npc.base.autonpcfunctions.AddCondition("qpg","<",29);
    -- Quest 3 solved, reward: Longbow, 100 poisoned arrows
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Words cannot express how grateful I am. Take my very own bow, now that the wolves are gone, I can rely on my spear again.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",29);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",30);
    npc.base.autonpcfunctions.AddConsequence("item",2708,1,777,0);
    npc.base.autonpcfunctions.AddConsequence("item",549,100,333,0);
    npc.base.autonpcfunctions.AddConsequence("inform","[Quest solved] You are awarded a long bow and 100 poisoned arrows.");
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Worte können nicht beschreiben, wie dankbar ich bin. Nehmt meine Bogen, nun, da die Wölfe fort sind, kann ich mich wieder auf meinen Speer verlassen.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",29);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",30);
    npc.base.autonpcfunctions.AddConsequence("item",2708,1,777,0);
    npc.base.autonpcfunctions.AddConsequence("item",549,100,333,0);
    npc.base.autonpcfunctions.AddConsequence("inform","[Quest gelöst] Du erhältst einen Langbogen und 100 vergiftete Pfeile.");
    -- 4th quest: Kill 1 elven hunter
    -- Give out quest 4
    npc.base.autonpcfunctions.AddTraderTrigger("quest","You may wonder why I didn't set out to hunt on my own. The self proclaimed guardians of the forest do not appreciate my deeds. I'd welcome if you'd make the elven guardian... disappear.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",30);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",31);
    npc.base.autonpcfunctions.AddConsequence("inform","[New quest] The Poacher IV");
    npc.base.autonpcfunctions.AddTraderTrigger("quest","Ihr mögt euch fragen, warum ich noch nicht selbst zur Jagd ausgezogen bin. Die selbsternannten Wächter des Waldes heißen nicht gut, was ich tue. Ich würde es begrüßen, wenn ihr die Elfenwache... verschwinden lassen würdet.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",30);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",31);
    npc.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Der Wilderer IV");
    npc.base.autonpcfunctions.AddTraderTrigger("task","You may wonder why I didn't set out to hunt on my own. The self proclaimed guardians of the forest do not appreciate my deeds. I'd welcome if you'd make the elven guardian... disappear.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npc.base.autonpcfunctions.AddCondition("qpg","=",30);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",31);
    npc.base.autonpcfunctions.AddConsequence("inform","[New quest] The Poacher IV");
    npc.base.autonpcfunctions.AddTraderTrigger("Auftrag","Ihr mögt euch fragen, warum ich noch nicht selbst zur Jagd ausgezogen bin. Die selbsternannten Wächter des Waldes heißen nicht gut, was ich tue. Ich würde es begrüßen, wenn ihr die Elfenwache... verschwinden lassen würdet.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Aufgabe");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npc.base.autonpcfunctions.AddCondition("qpg","=",30);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",31);
    npc.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Der Wilderer IV");
    -- Quest 3 taken but not solved, repeat the instructions
    npc.base.autonpcfunctions.AddTraderTrigger("quest","There are still a pair of keen eyes in the Elstree forest that won't let me hunt what I need. Please, could you... shut those eyes?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg",">",30);
    npc.base.autonpcfunctions.AddCondition("qpg","<",32);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("quest","Es gibt immernoch ein Paar aufmerksamer Augen im Elsbaumwald, welches mich nicht das jagen lässt, was ich brauche. Könntet ihr bitte diese Augen... für immer schließen?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg",">",30);
    npc.base.autonpcfunctions.AddCondition("qpg","<",32);
    npc.base.autonpcfunctions.AddTraderTrigger("task","There are still a pair of keen eyes in the Elstree forest that won't let me hunt what I need. Please, could you... shut those eyes?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npc.base.autonpcfunctions.AddCondition("qpg",">",30);
    npc.base.autonpcfunctions.AddCondition("qpg","<",32);
    npc.base.autonpcfunctions.AddTraderTrigger("Auftrag","Es gibt immernoch ein Paar aufmerksamer Augen im Elsbaumwald, welches mich nicht das jagen lässt, was ich brauche. Könntet ihr bitte diese Augen... für immer schließen?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Aufgabe");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npc.base.autonpcfunctions.AddCondition("qpg",">",30);
    npc.base.autonpcfunctions.AddCondition("qpg","<",32);
    -- Quest 4 solved, reward:
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Hooray! No elven rapscallion will keep me from hunting anymore! Of course, just to feed my children... However, take this ring, it helped me evading those wicked elves long enough.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",32);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",33);
    npc.base.autonpcfunctions.AddConsequence("item",68,1,888,21);
    npc.base.autonpcfunctions.AddConsequence("inform","[Quest solved] You are awarded magical ruby ring.");
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Hurra! Kein elfischer Halunke wird sich mir nun noch in den Weg stellen, wenn ich jagen gehen... natürlich, um meine Kinder zu ernähren, versteht sich. Hier, nehmt diesen Ring, er hat mir lange genug geholfen, mich diesen verdammten Elfen zu entziehen.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",32);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",33);
    npc.base.autonpcfunctions.AddConsequence("item",68,1,888,21);
    npc.base.autonpcfunctions.AddConsequence("inform","[Quest gelöst] Du erhältst einen magischen Rubinring.");
    -- No more quests, just nice words of gratitude
    npc.base.autonpcfunctions.AddTraderTrigger("quest","My friend, you helped me and my family more than enough. Thank you and may Malachin bless you.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",33);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("quest","Mein Freund, ihr habt mir und meiner Familie mehr als genug geholfen. Habt dank und möge Malachin euch segnen.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",33);
    npc.base.autonpcfunctions.AddTraderTrigger("task","My friend, you helped me and my family more than enough. Thank you and may Malachin bless you.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npc.base.autonpcfunctions.AddCondition("qpg","=",33);
    npc.base.autonpcfunctions.AddTraderTrigger("Auftrag","Mein Freund, ihr habt mir und meiner Familie mehr als genug geholfen. Habt dank und möge Malachin euch segnen.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Aufgabe");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npc.base.autonpcfunctions.AddCondition("qpg","=",33);
    -- Easteregg (optional): Think about a funny, unrelated trigger with a surprising answer
    npc.base.autonpcfunctions.AddTraderTrigger("easter","I once found a strange egg in the Elstree forest. It was huge! But I left it where it was, who knows what hatches from such eggs.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("egg");
    npc.base.autonpcfunctions.AddTraderTrigger("osterei","Einst habe ich ein merkwürdiges Ei im Elsbaumwald gefunden. Es war riesig! Aber ich habe es zurückgelassen, wo es war, wer weiß, was aus solchen Eiern alles schlüpfen kann.");
    -- Last catch: Think about keyphrases the player might say and that are not caught until here.
    npc.base.autonpcfunctions.AddTraderTrigger("Yes","Indeed?");
    npc.base.autonpcfunctions.AddAdditionalText("So, what?");
    npc.base.autonpcfunctions.AddAdditionalText("#me shakes his head slightly: 'Sorry, can you rephrase that?'");
    npc.base.autonpcfunctions.AddTraderTrigger("Ja","Ist dem so?");
    npc.base.autonpcfunctions.AddAdditionalText("Gut, und nun?");
    npc.base.autonpcfunctions.AddAdditionalText("#me schüttelt seinen Kopf: 'Entschuldigt, könnt ihr das anders ausdrücken?'");
    npc.base.autonpcfunctions.AddTraderTrigger("No","I don't quite understand, sorry.");
    npc.base.autonpcfunctions.AddAdditionalText("Pardon me?");
    npc.base.autonpcfunctions.AddAdditionalText("What?!");
    npc.base.autonpcfunctions.AddTraderTrigger("Nein","Ich verstehe nicht recht...");
    npc.base.autonpcfunctions.AddAdditionalText("Entschuldigt?");
    npc.base.autonpcfunctions.AddAdditionalText("Was?!");
    -- Cycletext: Add as many random messages as possible
    npc.base.autonpcfunctions.AddCycleText("#me schärft sein Messer.","#me sharpens his knife.");
    npc.base.autonpcfunctions.AddCycleText("#me murmelt: 'Verdammte Wölfe!'","#me mumbles: 'Damned wolves!'");
    npc.base.autonpcfunctions.AddCycleText("#me hustet.","#me coughs.");
    npc.base.autonpcfunctions.AddCycleText("#me nießt.","#me sneezes.");
    npc.base.autonpcfunctions.AddCycleText("#me sortiert einige Felle, offensichtlich bedacht, dies nicht allzu auffällig zu tun.","#me sorts some fur, obviously trying to hide them.");
    npc.base.autonpcfunctions.AddCycleText("#me zählt die Pfeile in einem fein bestickten Köcher.","#me counts arrows in a decorated quiver.");
    npc.base.autonpcfunctions.AddCycleText("#me spitzt einen langen Stock mit einem Messer an.","#me carves a long stick with a knife.");
    npc.base.autonpcfunctions.AddCycleText("Psst, wollt ihr bestes Fell... oh! Ich habe nichts gesagt.","Shh, want to have best fur... uh, nevermind!");
    npc.base.autonpcfunctions.AddCycleText("#me steckt grinsend einen Stock in eine sofort zuschnappende Falle.","#me sticks a stick into a snapping trap, grinning.");
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
-- INSERT INTO npc VALUES (nextval('npc_seq'),1,401,242,1,6,false,'Cormac the Smuggler','npc_cormac_the_smuggler.lua',0);

require("npcs.base.autonpcfunctions")
module("npcs.cormac_the_smuggler")

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

    QuestID = 74;
    -- NPC by PO Edward Cromwell, translated by Estralis Seborian
    -- Queststatus Overview
    -- 0: No Quest taken / Quest reset
    -- 1: NPC tells player to bring him some beer
    -- 2: NPC is willing to answer PC questions about the ruler, faction and the treacherous neighbours!
    -- Debugging
    npcs.base.autonpcfunctions.AddTraderTrigger("set 0","Quest status set to 0");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",0);
    npcs.base.autonpcfunctions.AddTraderTrigger("set 1","Quest status set to 1");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("set 2","Quest status set to 2");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",2);
    -- Cycletext:
    npcs.base.autonpcfunctions.AddCycleText("Ich war schon überall und woanders, aber verdammt nochmal, nichts ist schöner als das gute, alte Galmair.","I've been all over the place and more, but damn... there's no place like good ol' Galmair!");
    npcs.base.autonpcfunctions.AddCycleText("#me schnattert: 'Wie viele Cadomyrer braucht man, um eine Kerze anzuzünden? Einen, um die Kerze anzuzünden und eine Brigade, um das brennende Haus zu löschen!'","#me cackles: 'How many Cadomyrians do you need to light a candle? One to light tha candle and a brigade to extinguish tha burning house!'");
    npcs.base.autonpcfunctions.AddCycleText("Verdammt! Wirt, meine Kehle ist so leer und trocken wie der Schädel eines Runewickers!","Damn! Oy, bartender! My throat is as empty and dry as a Runewickian skull!");
    npcs.base.autonpcfunctions.AddCycleText("#me ist ein Zwerg mit einem schwarzen, buschigem Bart, gekleidet in grober, zerschlissener Kleidung.","#me is a dwarf with a black bushy beard, dressed in ragged and coarse clothes.");
    npcs.base.autonpcfunctions.AddCycleText("#me scheint bester Laune zu sein, auch wenn sein Bierkrug leer erscheint.","#me seems to be in jubilant mood, though his beer-mug is empty.");
    npcs.base.autonpcfunctions.AddCycleText("Hey! Füll meinen Krug und wir können reden.","Oy, fill my mug with beer n' we can talk.");
    npcs.base.autonpcfunctions.AddCycleText("#me summt: Fässer voll Schnaps, fließen den Fluss entlang. Der Zollmann weiß von nichts, die Nacht beschützt meine Fracht. Mein Profit ist recht und Steuern gibts von mir nicht.'","#me hums: 'Barrels o' booze, downstream they go! That tha bailiff don't know! The night protects my cargo n' coins, n' tha taxman can kiss my loins! Haha!'");
    -- First part, the gossiper is thirsty--
    npcs.base.autonpcfunctions.AddTraderTrigger("Hello","#me flashes you a sparse-toothed grin. 'Eh! If ye want to sit down with me, ye better bring me a mug of beer. Then I'll answer yer questions.'");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greetings");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Be greeted");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hail");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good day");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good morning");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good evening");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",0);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("inform","[New quest] Galmair's Gossiper");
    npcs.base.autonpcfunctions.AddTraderTrigger("Hello","If that isn't mah good ol' buddy! Come, sit down and drink with meh!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greetings");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Be greeted");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hail");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good day");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good morning");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good evening");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("Hiho","#me strokes his beard and grins: 'Arr, Greetings! If ye want to talk, then ye better quench my thirst first!'");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",0);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("inform","[New quest] Galmair's Gossiper");
    npcs.base.autonpcfunctions.AddTraderTrigger("Hiho","What! Haven't seen ya since last time.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("How are you","Arr! My throat is dry as tha desert! When ye want tha talk, ye need to bring me a beer first.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("How feel");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("How do you do");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",0);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("inform","[New quest] Galmair's Gossiper");
    npcs.base.autonpcfunctions.AddTraderTrigger("How are you","A beer in the morning drives away the sorrows. And I have none anymore.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("How feel");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("How do you do");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","A task? Bring mah meh beer, ye bum!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",0);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("inform","[New quest] Galmair's Gossiper");
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","What is it ya want to know? I know the latest gossip.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Is there wax in yer ears or what? If ye want tha talk with me, ye need to bring me a beer! I'm bloody thirsty.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("task","A task? Bring mah meh beer, ye bum!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("question");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",0);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("inform","[New quest] Galmair's Gossiper");
    npcs.base.autonpcfunctions.AddTraderTrigger("task","What is it ya want to know? I know the latest gossip.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("question");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("task","Is there wax in yer ears or what? If ye want tha talk with me, ye need to bring me a beer! I'm bloody thirsty.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("question");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("Farewell","Until next time, traveller!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good bye");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Bye");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Fare thy well");
    npcs.base.autonpcfunctions.AddTraderTrigger("Ciao","See ye around, traveller! Stay safe.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Grüße","#me zeigt ein zahnloses Grinsen. 'Eh! Wenn du dich hier hinsetzen willst, bring mir besser ein Bier. Dann beantworte ich deine Fragen.'");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Gruß");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Seid gegrüßt");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Guten Tag");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Guten Abend");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Mahlzeit");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Tach");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Moin");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",0);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Der Schwätzer von Galmair");
    npcs.base.autonpcfunctions.AddTraderTrigger("Grüße","Wenn das nicht mein guter Kumpel ist! Komm, setz dich und trink mit mir!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Gruß");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Seid gegrüßt");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Guten Tag");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Guten Abend");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Mahlzeit");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Tach");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Moin");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("Hiho","#me streicht seinen Bart zurecht: 'Arr, grüß dich. Wenn du mit mir reden willst, dann lösch erstmal meinen Durst mit einem Bier.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",0);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Der Schwätzer von Galmair");
    npcs.base.autonpcfunctions.AddTraderTrigger("Hiho","Was! Dich hab ich ja seid dem letzten mal nicht mehr gesehen!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("Wie geht","Arr! Meine Kehle ist so trocken wie die Wüste. Wenn du reden willst, bring mir erstmal ein Bier.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Wie fühlst");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Wie ist es ergangen");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",0);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Der Schwätzer von Galmair");
    npcs.base.autonpcfunctions.AddTraderTrigger("Wie geht","Ein Bier am Morgen vertreibt Kummer und Sorgen. Und ich hab keine mehr.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Wie fühlst");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Wie ist es ergangen");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Hol' mir mal 'ne Flasche Bier sonst streik ich hier!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",0);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Der Schwätzer von Galmair");
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Was willst du wissen? Ich kenne alle Gerüchte.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Hast du Wachs in den Ohren oder was? Wenn du mit mir reden willst, musst du mir ein Bier bringen. Ich bin verdammt nochmal durstig.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("Aufgabe","Hol' mir mal 'ne Flasche Bier sonst streik ich hier!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Frage");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",0);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Der Schwätzer von Galmair");
    npcs.base.autonpcfunctions.AddTraderTrigger("Aufgabe","Was willst du wissen? Ich kenne alle Gerüchte.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Frage");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("Aufgabe","Hast du Wachs in den Ohren oder was? Wenn du mit mir reden willst, musst du mir ein Bier bringen. Ich bin verdammt nochmal durstig.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Frage");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("Tschüß","Bis zum nächsten mal, Reisender.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Tschüss");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Wiedersehen");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Gehabt euch wohl");
    npcs.base.autonpcfunctions.AddTraderTrigger("Ciao","Man sieht sich, Fremder. Gib auf dich acht.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("dein name","Cormac, der... Flussschiffahrtstransportunternehmer.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wer bist du");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wer seid ihr");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wie heißt");
    npcs.base.autonpcfunctions.AddTraderTrigger("your name","Cormac, the... river transportation entrepreneur.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("who are you");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("who art thou");
    -- bringing the beer--
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","#me takes the mug and grins: 'Arr! Ye aint so bad after all! I've been all over tha place, so I can tell ye about tha town, tha Don, Galmair or even the neighbours if ye really want.'");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddCondition("item",1909,"all",">",0);
    npcs.base.autonpcfunctions.AddCondition("town","=","galmair");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("deleteitem",1909,1);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Quest solved] Cormac will now answer your questions. You advance in Don Valerio Guilianni's favour.");
    npcs.base.autonpcfunctions.AddConsequence("rankpoints","galmair","+",20);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","#me takes the mug and grins: 'Arr! Ye aint so bad after all! I've been all over tha place, so I can tell ye about tha town, tha Don, Galmair or even the neighbours if ye really want.'");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddCondition("item",1909,"all",">",0);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("deleteitem",1909,1);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Quest solved] Cormac will now answer your questions.");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","#me nimmt den Krug und grinst: 'Arr! Du bist gar nicht so schlecht, wie du aussiehst. Ich bin schon überall gewesen, du kannst mich alles über die Stadt, den Don, Galmair oder sogar unsere dummen Nachbarn fragen.'");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddCondition("item",1909,"all",">",0);
    npcs.base.autonpcfunctions.AddCondition("town","=","galmair");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddConsequence("deleteitem",1909,1);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Quest gelöst] Cormac wird nun deine Fragen beantworten. Dein Ansehen bei Don Valerio Guilianni steigt.");
    npcs.base.autonpcfunctions.AddConsequence("rankpoints","galmair","+",20);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","#me nimmt den Krug und grinst: 'Arr! Du bist gar nicht so schlecht, wie du aussiehst. Ich bin schon überall gewesen, du kannst mich alles über die Stadt, den Don, Galmair oder sogar unsere dummen Nachbarn fragen.'");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddCondition("item",1909,"all",">",0);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddConsequence("deleteitem",1909,1);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Quest gelöst] Cormac wird nun deine Fragen beantworten.");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Bier her! So einen richtigen Schluck.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddCondition("item",1909,"all","<",1);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Beer here, now! A real sip.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddCondition("item",1909,"all","<",1);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    -- Questions (english)
    npcs.base.autonpcfunctions.AddTraderTrigger("town","#me chuckles: 'This town is a bloody fine place fer a man or woman with coin. Ye can live free and mind yer business, as long as ye let others mind theirs.'");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("Don","Arr! Don Valerio Guilianni is in charge around here! He's tha richest n' most powerful man in tha land, or so they say! A fine leader!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Lord");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Valerio","Ye've been keeping yer ears open, good! Aye, he's the man in charge. He keeps us free from tha oppressing neighbours and that bastard Urbano.'");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Guilianni");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Urbano","#me frowns: 'Dorian Urbano, he called himself. A former bigshot in these parts... a no-good thief and scoundrel whom Don Guillianni booted out. Haha!'");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Dorian");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("money","Ha! Money is a fine way o' measuring everything. When ye got more money, yer o' course more powerful too.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("god","#me nods and strokes his beard: 'We're all pious folks down here, though we mind our own business with this like with other stuff.'");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("like[s]","Tha Don likes expensive and and rare weapons or armours. He's a bit o' a collector, I hear. Hah... n' o' course money.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("gift","Gifts? Arr! I heard tha Don likes expensive weapons n' armour... very prudent, don't ye think? Money is good too...");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("beer","#me flashes you a sparse-toothed grin: 'Thank ye fer tha beer, traveller! What ye want to know now?'");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("neighbo","#me scowls: 'May tha plague visit those bastards, Runewick and Cadomyr! This is 'our' bloody land n' they're just enroaching.'");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("Galmair","#me grins: 'Welcome to tha land o' tha free, traveller! When ye got enough coins and show loyalty tha Don, yer free to mind yer own business as ye please.'");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddAdditionalText("Galmair, home o' tha free, land o' those who can take care o' themselves. Ha!");
    npcs.base.autonpcfunctions.AddTraderTrigger("smuggle","By Ron... moron... I am a... Arr... 'river transportation entrepreneur', aye.. that's what I do fer living.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("smuggling");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddAdditionalText("#me scowls: 'ARR! I know nothing 'bout such things! I'm a decent n' hardworking... arr... river transportation entrepreneur.'");
    npcs.base.autonpcfunctions.AddTraderTrigger("Runewick","Runewick! Hah! They're a nation o' folks who sat on a bloody broomstick in tha morning, ruled by a bloody lass who waves a magic wand around.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Cadomyr","They make a big fuss 'bout honour, bending over backwards to kiss arse and look down on people who like coins. Hehe... Ye know what they say, a man fights fer what he lacks tha most.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    -- Questions (german)
    npcs.base.autonpcfunctions.AddTraderTrigger("Stadt","Diese Stadt ist ein guter Ort für einen Mann oder ein Frau mit dem nötigen Kleingeld. Man kann hier frei schalten und walten und niemand funkt dir dazwischen.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("Don","Arr! Don Valerio Guilianni ist hier der Boss! Er ist der mächtigste und reichste Mann weit und breit, so sagt man. Ein guter Anführer!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Lord");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("Valerio","Ich sehe, du hast dich schlau gemacht. Ja, das ist hier der Boss. Er hält uns den Rücken von unseren kontrollwütigen Nachbarn und diesem Bastard Urbano frei.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Guilianni");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("Urbano","#me grummelt: 'Dorian Urbano, so schimpft er sich. Früher mal ein mächtiges Tier hier, jetzt eher ein gemeiner Schurk, den Don Guillianni aus dem Geschäft gedrängt hat. Haha!'");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Dorian");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("geld","Ha! Geld ist gut, um Dingen einen Wert zu geben. Aber Geld bedeutet auch Macht, lass dir das gesagt sein.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("gott","#me nickt und streicht durch seinen Bart: 'Wir sind alle fromme Leute hier, auch wenn wir das niemanden auf die Nase binden, wie wir uns auch sonst aus anderer Leute Angelegenheiten raushalten.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("götter");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("Vorliebe","Der Don liebt Teures und Seltenes, wie Waffen und Rüstungen. Er ist ein Sammler, so sagt man. Ein Geldeinsammler, ha!");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("geschenk","Geschenke? Arr! Ich hab gehört, der Don mag seltene Waffen und Rüstungen. Ziemlich prahlerisch, nicht? Geld ist aber auch eine gute Wahl.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("präsent");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("Bier","#me grinst: 'Danke für das Bier, Fremder. Was willst du jetzt wirklich wissen?'");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("Nachbar","#me bellt: 'Möge die Pest über diese Bastarde kommen, Runewick und Cadomyr! Dies ist unser Land, die lungern hier nur rum.'");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("Galmair","Willkommen im Land der Freien, Reisender. Wenn du genug Gold hast und dem Don nicht in die Quere kommst, kannst du machen, was du willst.'");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddAdditionalText("Galmair, Heimat der Freien, Land derer, die für sich selbst sorgen können.");
    npcs.base.autonpcfunctions.AddTraderTrigger("schmugg","Bei Ron... moron... Ich bin ein... Arr... 'Flussschiffahrtstransportunternehmer', ja, das ist, was ich mache.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddAdditionalText("#me faucht: 'ARR! Ich weiß nichts über solche Machenschaften. Ich bin ein ehrlicher, hart arbeitender... Flussschiffahrtstransportunternehmer!'");
    npcs.base.autonpcfunctions.AddTraderTrigger("Runewick","Runewick! Hah! Ein Land von Knilchen, die morgens erstmal auf einem Besen reiten, regiert von einem Kerl, der mit seinem Zauberstab rumfuchtelt.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("Cadomyr","Die machen einen riesen Aufstand über ihre Ehre, kriechen einander in den Allerwertesten und spucken auf geschäftstüchtige Leute. Aber wie sagt man, man kämpft am stärksten für etwas, was man gar nicht hat.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    -- Gods
    npcs.base.autonpcfunctions.AddTraderTrigger("Irmorom","Blah.");
    npcs.base.autonpcfunctions.AddAdditionalText("Bleh.");
    npcs.base.autonpcfunctions.AddAdditionalText("Blubb.");
    npcs.base.autonpcfunctions.AddAdditionalText("Moep.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Ronagan","Eh?");
    npcs.base.autonpcfunctions.AddAdditionalText("Hmm?");
    npcs.base.autonpcfunctions.AddAdditionalText("Shh!");
    -- Small talk--
    npcs.base.autonpcfunctions.AddTraderTrigger("profession","My profession? Well, I am in tha... transportation business, sorta.");
    npcs.base.autonpcfunctions.AddTraderTrigger("tavern","Did you ever wonder where all this booze comes from? No? Good!");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("beruf","Mein Beruf? Ich bin im... Fuhrgewerbe.");
    npcs.base.autonpcfunctions.AddTraderTrigger("tavern","Hast du dich nie gefragt, wo all das Gesöff hier herkommt? Nein? Gut so!");
    -- Help
    npcs.base.autonpcfunctions.AddTraderTrigger("help","");
    npcs.base.autonpcfunctions.AddConsequence("inform","[Game help] This NPC is the smuggler Cormac. To learn more about him, your should greet the NPC first.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Hilfe","");
    npcs.base.autonpcfunctions.AddConsequence("inform","[Spielhilfe] Dieser NPC ist der Schmuggler Cormac. Um mehr über ihn zu erfahren, grüße ihn zunächst.");
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
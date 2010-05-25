-- INSERT INTO npc VALUES (nextval('npc_seq'),1,401,242,1,6,false,'Cormac the Smuggler','npc_cormac_the_smuggler.lua',0);

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

    QuestID = 74;
    -- NPC by PO Edward Cromwell, translated by Estralis Seborian
    -- Queststatus Overview
    -- 0: No Quest taken / Quest reset
    -- 1: NPC tells player to bring him some beer
    -- 2: NPC is willing to answer PC questions about the ruler, faction and the treacherous neighbours!
    -- Debugging
    AddTraderTrigger("set 0","Quest status set to 0");
    AddConsequence("qpg","=",0);
    AddTraderTrigger("set 1","Quest status set to 1");
    AddConsequence("qpg","=",1);
    AddTraderTrigger("set 2","Quest status set to 2");
    AddConsequence("qpg","=",2);
    -- Cycletext:
    AddCycleText("Ich war schon überall und woanders, aber verdammt nochmal, nichts ist schöner als das gute, alte Galmair.","I've been all over the place and more, but damn... there's no place like good ol' Galmair!");
    AddCycleText("#me schnattert: 'Wie viele Cadomyrer braucht man, um eine Kerze anzuzünden? Einen, um die Kerze anzuzünden und eine Brigade, um das brennende Haus zu löschen!'","#me cackles: 'How many Cadomyrians do you need to light a candle? One to light tha candle and a brigade to extinguish tha burning house!'");
    AddCycleText("Verdammt! Wirt, meine Kehle ist so leer und trocken wie der Schädel eines Runewickers!","Damn! Oy, bartender! My throat is as empty and dry as a Runewickian skull!");
    AddCycleText("#me ist ein Zwerg mit einem schwarzen, buschigem Bart, gekleidet in grober, zerschlissener Kleidung.","#me is a dwarf with a black bushy beard, dressed in ragged and coarse clothes.");
    AddCycleText("#me scheint bester Laune zu sein, auch wenn sein Bierkrug leer erscheint.","#me seems to be in jubilant mood, though his beer-mug is empty.");
    AddCycleText("Hey! Füll meinen Krug und wir können reden.","Oy, fill my mug with beer n' we can talk.");
    AddCycleText("#me summt: Fässer voll Schnaps, fließen den Fluss entlang. Der Zollmann weiß von nichts, die Nacht beschützt meine Fracht. Mein Profit ist recht und Steuern gibts von mir nicht.'","#me hums: 'Barrels o' booze, downstream they go! That tha bailiff don't know! The night protects my cargo n' coins, n' tha taxman can kiss my loins! Haha!'");
    -- First part, the gossiper is thirsty--
    AddTraderTrigger("Hello","#me flashes you a sparse-toothed grin. 'Eh! If ye want to sit down with me, ye better bring me a mug of beer. Then I'll answer yer questions.'");
    AddAdditionalTrigger("Greetings");
    AddAdditionalTrigger("Be greeted");
    AddAdditionalTrigger("Hail");
    AddAdditionalTrigger("Good day");
    AddAdditionalTrigger("Good morning");
    AddAdditionalTrigger("Good evening");
    AddCondition("qpg","=",0);
    AddConsequence("qpg","=",1);
    AddConsequence("inform","[New quest] Galmair's Gossiper");
    AddTraderTrigger("Hello","If that isn't mah good ol' buddy! Come, sit down and drink with meh!");
    AddAdditionalTrigger("Greetings");
    AddAdditionalTrigger("Be greeted");
    AddAdditionalTrigger("Hail");
    AddAdditionalTrigger("Good day");
    AddAdditionalTrigger("Good morning");
    AddAdditionalTrigger("Good evening");
    AddCondition("qpg","=",2);
    AddTraderTrigger("Hiho","#me strokes his beard and grins: 'Arr, Greetings! If ye want to talk, then ye better quench my thirst first!'");
    AddAdditionalTrigger("Hallo");
    AddAdditionalTrigger("Hey");
    AddAdditionalTrigger("Greebas");
    AddAdditionalTrigger("Greebs");
    AddCondition("lang","english");
    AddCondition("qpg","=",0);
    AddConsequence("qpg","=",1);
    AddConsequence("inform","[New quest] Galmair's Gossiper");
    AddTraderTrigger("Hiho","What! Haven't seen ya since last time.");
    AddAdditionalTrigger("Hallo");
    AddAdditionalTrigger("Hey");
    AddAdditionalTrigger("Greebas");
    AddAdditionalTrigger("Greebs");
    AddCondition("lang","english");
    AddCondition("qpg","=",2);
    AddTraderTrigger("How are you","Arr! My throat is dry as tha desert! When ye want tha talk, ye need to bring me a beer first.");
    AddAdditionalTrigger("How feel");
    AddAdditionalTrigger("How do you do");
    AddCondition("qpg","=",0);
    AddConsequence("qpg","=",1);
    AddConsequence("inform","[New quest] Galmair's Gossiper");
    AddTraderTrigger("How are you","A beer in the morning drives away the sorrows. And I have none anymore.");
    AddAdditionalTrigger("How feel");
    AddAdditionalTrigger("How do you do");
    AddCondition("qpg","=",2);
    AddTraderTrigger("quest","A task? Bring mah meh beer, ye bum!");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",0);
    AddCondition("lang","english");
    AddConsequence("qpg","=",1);
    AddConsequence("inform","[New quest] Galmair's Gossiper");
    AddTraderTrigger("quest","What is it ya want to know? I know the latest gossip.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",2);
    AddCondition("lang","english");
    AddTraderTrigger("quest","Is there wax in yer ears or what? If ye want tha talk with me, ye need to bring me a beer! I'm bloody thirsty.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",1);
    AddCondition("lang","english");
    AddTraderTrigger("task","A task? Bring mah meh beer, ye bum!");
    AddAdditionalTrigger("adventure");
    AddAdditionalTrigger("question");
    AddCondition("qpg","=",0);
    AddConsequence("qpg","=",1);
    AddConsequence("inform","[New quest] Galmair's Gossiper");
    AddTraderTrigger("task","What is it ya want to know? I know the latest gossip.");
    AddAdditionalTrigger("adventure");
    AddAdditionalTrigger("question");
    AddCondition("qpg","=",2);
    AddTraderTrigger("task","Is there wax in yer ears or what? If ye want tha talk with me, ye need to bring me a beer! I'm bloody thirsty.");
    AddAdditionalTrigger("adventure");
    AddAdditionalTrigger("question");
    AddCondition("qpg","=",1);
    AddTraderTrigger("Farewell","Until next time, traveller!");
    AddAdditionalTrigger("Good bye");
    AddAdditionalTrigger("Bye");
    AddAdditionalTrigger("Fare thy well");
    AddTraderTrigger("Ciao","See ye around, traveller! Stay safe.");
    AddAdditionalTrigger("Adieu");
    AddAdditionalTrigger("Au revoir");
    AddCondition("lang","english");
    AddTraderTrigger("Grüße","#me zeigt ein zahnloses Grinsen. 'Eh! Wenn du dich hier hinsetzen willst, bring mir besser ein Bier. Dann beantworte ich deine Fragen.'");
    AddAdditionalTrigger("Gruß");
    AddAdditionalTrigger("Seid gegrüßt");
    AddAdditionalTrigger("Guten Tag");
    AddAdditionalTrigger("Guten Abend");
    AddAdditionalTrigger("Mahlzeit");
    AddAdditionalTrigger("Tach");
    AddAdditionalTrigger("Moin");
    AddCondition("qpg","=",0);
    AddConsequence("qpg","=",1);
    AddConsequence("inform","[Neues Quest] Der Schwätzer von Galmair");
    AddTraderTrigger("Grüße","Wenn das nicht mein guter Kumpel ist! Komm, setz dich und trink mit mir!");
    AddAdditionalTrigger("Gruß");
    AddAdditionalTrigger("Seid gegrüßt");
    AddAdditionalTrigger("Guten Tag");
    AddAdditionalTrigger("Guten Abend");
    AddAdditionalTrigger("Mahlzeit");
    AddAdditionalTrigger("Tach");
    AddAdditionalTrigger("Moin");
    AddCondition("qpg","=",2);
    AddTraderTrigger("Hiho","#me streicht seinen Bart zurecht: 'Arr, grüß dich. Wenn du mit mir reden willst, dann lösch erstmal meinen Durst mit einem Bier.");
    AddAdditionalTrigger("Hallo");
    AddAdditionalTrigger("Hey");
    AddAdditionalTrigger("Greebas");
    AddAdditionalTrigger("Greebs");
    AddCondition("lang","german");
    AddCondition("qpg","=",0);
    AddConsequence("qpg","=",1);
    AddConsequence("inform","[Neues Quest] Der Schwätzer von Galmair");
    AddTraderTrigger("Hiho","Was! Dich hab ich ja seid dem letzten mal nicht mehr gesehen!");
    AddAdditionalTrigger("Hallo");
    AddAdditionalTrigger("Hey");
    AddAdditionalTrigger("Greebas");
    AddAdditionalTrigger("Greebs");
    AddCondition("lang","german");
    AddCondition("qpg","=",2);
    AddTraderTrigger("Wie geht","Arr! Meine Kehle ist so trocken wie die Wüste. Wenn du reden willst, bring mir erstmal ein Bier.");
    AddAdditionalTrigger("Wie fühlst");
    AddAdditionalTrigger("Wie ist es ergangen");
    AddCondition("qpg","=",0);
    AddConsequence("qpg","=",1);
    AddConsequence("inform","[Neues Quest] Der Schwätzer von Galmair");
    AddTraderTrigger("Wie geht","Ein Bier am Morgen vertreibt Kummer und Sorgen. Und ich hab keine mehr.");
    AddAdditionalTrigger("Wie fühlst");
    AddAdditionalTrigger("Wie ist es ergangen");
    AddCondition("qpg","=",2);
    AddTraderTrigger("quest","Hol' mir mal 'ne Flasche Bier sonst streik ich hier!");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",0);
    AddCondition("lang","german");
    AddConsequence("qpg","=",1);
    AddConsequence("inform","[Neues Quest] Der Schwätzer von Galmair");
    AddTraderTrigger("quest","Was willst du wissen? Ich kenne alle Gerüchte.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",2);
    AddCondition("lang","german");
    AddTraderTrigger("quest","Hast du Wachs in den Ohren oder was? Wenn du mit mir reden willst, musst du mir ein Bier bringen. Ich bin verdammt nochmal durstig.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",1);
    AddCondition("lang","german");
    AddTraderTrigger("Aufgabe","Hol' mir mal 'ne Flasche Bier sonst streik ich hier!");
    AddAdditionalTrigger("Abenteuer");
    AddAdditionalTrigger("Frage");
    AddCondition("qpg","=",0);
    AddConsequence("qpg","=",1);
    AddConsequence("inform","[Neues Quest] Der Schwätzer von Galmair");
    AddTraderTrigger("Aufgabe","Was willst du wissen? Ich kenne alle Gerüchte.");
    AddAdditionalTrigger("Abenteuer");
    AddAdditionalTrigger("Frage");
    AddCondition("qpg","=",2);
    AddTraderTrigger("Aufgabe","Hast du Wachs in den Ohren oder was? Wenn du mit mir reden willst, musst du mir ein Bier bringen. Ich bin verdammt nochmal durstig.");
    AddAdditionalTrigger("Abenteuer");
    AddAdditionalTrigger("Frage");
    AddCondition("qpg","=",1);
    AddTraderTrigger("Tschüß","Bis zum nächsten mal, Reisender.");
    AddAdditionalTrigger("Tschüss");
    AddAdditionalTrigger("Wiedersehen");
    AddAdditionalTrigger("Gehabt euch wohl");
    AddTraderTrigger("Ciao","Man sieht sich, Fremder. Gib auf dich acht.");
    AddAdditionalTrigger("Adieu");
    AddAdditionalTrigger("Au revoir");
    AddCondition("lang","german");
    AddTraderTrigger("dein name","Cormac, der... Flussschiffahrtstransportunternehmer.");
    AddAdditionalTrigger("wer bist du");
    AddAdditionalTrigger("wer seid ihr");
    AddAdditionalTrigger("wie heißt");
    AddTraderTrigger("your name","Cormac, the... river transportation entrepreneur.");
    AddAdditionalTrigger("who are you");
    AddAdditionalTrigger("who art thou");
    -- bringing the beer--
    AddTraderTrigger(".+","#me takes the mug and grins: 'Arr! Ye aint so bad after all! I've been all over tha place, so I can tell ye about tha town, tha Don, Galmair or even the neighbours if ye really want.'");
    AddCondition("qpg","=",1);
    AddCondition("item",1909,"all",">",0);
    AddCondition("town","=","galmair");
    AddCondition("lang","english");
    AddConsequence("deleteitem",1909,1);
    AddConsequence("inform","[Quest solved] Cormac will now answer your questions. You advance in Don Valerio Guilianni's favour.");
    AddConsequence("rankpoints","galmair","+",20);
    AddConsequence("qpg","=",2);
    AddTraderTrigger(".+","#me takes the mug and grins: 'Arr! Ye aint so bad after all! I've been all over tha place, so I can tell ye about tha town, tha Don, Galmair or even the neighbours if ye really want.'");
    AddCondition("qpg","=",1);
    AddCondition("item",1909,"all",">",0);
    AddCondition("lang","english");
    AddConsequence("deleteitem",1909,1);
    AddConsequence("inform","[Quest solved] Cormac will now answer your questions.");
    AddConsequence("qpg","=",2);
    AddTraderTrigger(".+","#me nimmt den Krug und grinst: 'Arr! Du bist gar nicht so schlecht, wie du aussiehst. Ich bin schon überall gewesen, du kannst mich alles über die Stadt, den Don, Galmair oder sogar unsere dummen Nachbarn fragen.'");
    AddCondition("qpg","=",1);
    AddCondition("item",1909,"all",">",0);
    AddCondition("town","=","galmair");
    AddCondition("lang","german");
    AddConsequence("deleteitem",1909,1);
    AddConsequence("inform","[Quest gelöst] Cormac wird nun deine Fragen beantworten. Dein Ansehen bei Don Valerio Guilianni steigt.");
    AddConsequence("rankpoints","galmair","+",20);
    AddConsequence("qpg","=",2);
    AddTraderTrigger(".+","#me nimmt den Krug und grinst: 'Arr! Du bist gar nicht so schlecht, wie du aussiehst. Ich bin schon überall gewesen, du kannst mich alles über die Stadt, den Don, Galmair oder sogar unsere dummen Nachbarn fragen.'");
    AddCondition("qpg","=",1);
    AddCondition("item",1909,"all",">",0);
    AddCondition("lang","german");
    AddConsequence("deleteitem",1909,1);
    AddConsequence("inform","[Quest gelöst] Cormac wird nun deine Fragen beantworten.");
    AddConsequence("qpg","=",2);
    AddTraderTrigger(".+","Bier her! So einen richtigen Schluck.");
    AddCondition("qpg","=",1);
    AddCondition("item",1909,"all","<",1);
    AddCondition("lang","english");
    AddTraderTrigger(".+","Beer here, now! A real sip.");
    AddCondition("qpg","=",1);
    AddCondition("item",1909,"all","<",1);
    AddCondition("lang","german");
    -- Questions (english)
    AddTraderTrigger("town","#me chuckles: 'This town is a bloody fine place fer a man or woman with coin. Ye can live free and mind yer business, as long as ye let others mind theirs.'");
    AddCondition("qpg","=",2);
    AddTraderTrigger("Don","Arr! Don Valerio Guilianni is in charge around here! He's tha richest n' most powerful man in tha land, or so they say! A fine leader!");
    AddAdditionalTrigger("Lord");
    AddCondition("qpg","=",2);
    AddCondition("lang","english");
    AddTraderTrigger("Valerio","Ye've been keeping yer ears open, good! Aye, he's the man in charge. He keeps us free from tha oppressing neighbours and that bastard Urbano.'");
    AddAdditionalTrigger("Guilianni");
    AddCondition("qpg","=",2);
    AddCondition("lang","english");
    AddTraderTrigger("Urbano","#me frowns: 'Dorian Urbano, he called himself. A former bigshot in these parts... a no-good thief and scoundrel whom Don Guillianni booted out. Haha!'");
    AddAdditionalTrigger("Dorian");
    AddCondition("qpg","=",2);
    AddCondition("lang","english");
    AddTraderTrigger("money","Ha! Money is a fine way o' measuring everything. When ye got more money, yer o' course more powerful too.");
    AddCondition("qpg","=",2);
    AddTraderTrigger("god","#me nods and strokes his beard: 'We're all pious folks down here, though we mind our own business with this like with other stuff.'");
    AddCondition("qpg","=",2);
    AddTraderTrigger("like[s]","Tha Don likes expensive and and rare weapons or armours. He's a bit o' a collector, I hear. Hah... n' o' course money.");
    AddCondition("qpg","=",2);
    AddTraderTrigger("gift","Gifts? Arr! I heard tha Don likes expensive weapons n' armour... very prudent, don't ye think? Money is good too...");
    AddCondition("qpg","=",2);
    AddTraderTrigger("beer","#me flashes you a sparse-toothed grin: 'Thank ye fer tha beer, traveller! What ye want to know now?'");
    AddCondition("qpg","=",2);
    AddTraderTrigger("neighbo","#me scowls: 'May tha plague visit those bastards, Runewick and Cadomyr! This is 'our' bloody land n' they're just enroaching.'");
    AddCondition("qpg","=",2);
    AddTraderTrigger("Galmair","#me grins: 'Welcome to tha land o' tha free, traveller! When ye got enough coins and show loyalty tha Don, yer free to mind yer own business as ye please.'");
    AddCondition("qpg","=",2);
    AddCondition("lang","english");
    AddAdditionalText("Galmair, home o' tha free, land o' those who can take care o' themselves. Ha!");
    AddTraderTrigger("smuggle","By Ron... moron... I am a... Arr... 'river transportation entrepreneur', aye.. that's what I do fer living.");
    AddAdditionalTrigger("smuggling");
    AddCondition("qpg","=",2);
    AddAdditionalText("#me scowls: 'ARR! I know nothing 'bout such things! I'm a decent n' hardworking... arr... river transportation entrepreneur.'");
    AddTraderTrigger("Runewick","Runewick! Hah! They're a nation o' folks who sat on a bloody broomstick in tha morning, ruled by a bloody lass who waves a magic wand around.");
    AddCondition("qpg","=",2);
    AddCondition("lang","english");
    AddTraderTrigger("Cadomyr","They make a big fuss 'bout honour, bending over backwards to kiss arse and look down on people who like coins. Hehe... Ye know what they say, a man fights fer what he lacks tha most.");
    AddCondition("qpg","=",2);
    AddCondition("lang","english");
    -- Questions (german)
    AddTraderTrigger("Stadt","Diese Stadt ist ein guter Ort für einen Mann oder ein Frau mit dem nötigen Kleingeld. Man kann hier frei schalten und walten und niemand funkt dir dazwischen.");
    AddCondition("qpg","=",2);
    AddTraderTrigger("Don","Arr! Don Valerio Guilianni ist hier der Boss! Er ist der mächtigste und reichste Mann weit und breit, so sagt man. Ein guter Anführer!");
    AddAdditionalTrigger("Lord");
    AddCondition("qpg","=",2);
    AddCondition("lang","german");
    AddTraderTrigger("Valerio","Ich sehe, du hast dich schlau gemacht. Ja, das ist hier der Boss. Er hält uns den Rücken von unseren kontrollwütigen Nachbarn und diesem Bastard Urbano frei.");
    AddAdditionalTrigger("Guilianni");
    AddCondition("qpg","=",2);
    AddCondition("lang","german");
    AddTraderTrigger("Urbano","#me grummelt: 'Dorian Urbano, so schimpft er sich. Früher mal ein mächtiges Tier hier, jetzt eher ein gemeiner Schurk, den Don Guillianni aus dem Geschäft gedrängt hat. Haha!'");
    AddAdditionalTrigger("Dorian");
    AddCondition("qpg","=",2);
    AddCondition("lang","german");
    AddTraderTrigger("geld","Ha! Geld ist gut, um Dingen einen Wert zu geben. Aber Geld bedeutet auch Macht, lass dir das gesagt sein.");
    AddCondition("qpg","=",2);
    AddTraderTrigger("gott","#me nickt und streicht durch seinen Bart: 'Wir sind alle fromme Leute hier, auch wenn wir das niemanden auf die Nase binden, wie wir uns auch sonst aus anderer Leute Angelegenheiten raushalten.");
    AddAdditionalTrigger("götter");
    AddCondition("qpg","=",2);
    AddTraderTrigger("Vorliebe","Der Don liebt Teures und Seltenes, wie Waffen und Rüstungen. Er ist ein Sammler, so sagt man. Ein Geldeinsammler, ha!");
    AddCondition("qpg","=",2);
    AddTraderTrigger("geschenk","Geschenke? Arr! Ich hab gehört, der Don mag seltene Waffen und Rüstungen. Ziemlich prahlerisch, nicht? Geld ist aber auch eine gute Wahl.");
    AddAdditionalTrigger("präsent");
    AddCondition("qpg","=",2);
    AddTraderTrigger("Bier","#me grinst: 'Danke für das Bier, Fremder. Was willst du jetzt wirklich wissen?'");
    AddCondition("qpg","=",2);
    AddTraderTrigger("Nachbar","#me bellt: 'Möge die Pest über diese Bastarde kommen, Runewick und Cadomyr! Dies ist unser Land, die lungern hier nur rum.'");
    AddCondition("qpg","=",2);
    AddTraderTrigger("Galmair","Willkommen im Land der Freien, Reisender. Wenn du genug Gold hast und dem Don nicht in die Quere kommst, kannst du machen, was du willst.'");
    AddCondition("qpg","=",2);
    AddCondition("lang","german");
    AddAdditionalText("Galmair, Heimat der Freien, Land derer, die für sich selbst sorgen können.");
    AddTraderTrigger("schmugg","Bei Ron... moron... Ich bin ein... Arr... 'Flussschiffahrtstransportunternehmer', ja, das ist, was ich mache.");
    AddCondition("qpg","=",2);
    AddAdditionalText("#me faucht: 'ARR! Ich weiß nichts über solche Machenschaften. Ich bin ein ehrlicher, hart arbeitender... Flussschiffahrtstransportunternehmer!'");
    AddTraderTrigger("Runewick","Runewick! Hah! Ein Land von Knilchen, die morgens erstmal auf einem Besen reiten, regiert von einem Kerl, der mit seinem Zauberstab rumfuchtelt.");
    AddCondition("qpg","=",2);
    AddCondition("lang","german");
    AddTraderTrigger("Cadomyr","Die machen einen riesen Aufstand über ihre Ehre, kriechen einander in den Allerwertesten und spucken auf geschäftstüchtige Leute. Aber wie sagt man, man kämpft am stärksten für etwas, was man gar nicht hat.");
    AddCondition("qpg","=",2);
    AddCondition("lang","german");
    -- Gods
    AddTraderTrigger("Irmorom","Blah.");
    AddAdditionalText("Bleh.");
    AddAdditionalText("Blubb.");
    AddAdditionalText("Moep.");
    AddTraderTrigger("Ronagan","Eh?");
    AddAdditionalText("Hmm?");
    AddAdditionalText("Shh!");
    -- Small talk--
    AddTraderTrigger("profession","My profession? Well, I am in tha... transportation business, sorta.");
    AddTraderTrigger("tavern","Did you ever wonder where all this booze comes from? No? Good!");
    AddCondition("lang","english");
    AddTraderTrigger("beruf","Mein Beruf? Ich bin im... Fuhrgewerbe.");
    AddTraderTrigger("tavern","Hast du dich nie gefragt, wo all das Gesöff hier herkommt? Nein? Gut so!");
    -- Help
    AddTraderTrigger("help","");
    AddConsequence("inform","[Game help] This NPC is the smuggler Cormac. To learn more about him, your should greet the NPC first.");
    AddTraderTrigger("Hilfe","");
    AddConsequence("inform","[Spielhilfe] Dieser NPC ist der Schmuggler Cormac. Um mehr über ihn zu erfahren, grüße ihn zunächst.");
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
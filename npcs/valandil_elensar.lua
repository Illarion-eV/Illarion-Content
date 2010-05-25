-- INSERT INTO npc VALUES (nextval('npc_seq'),3,-125,-400,0,4,false,'Valandil Elensar','npc_valandil_elensar.lua',0);

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
    QuestID = 69;
    -- NPC by Zak and Estralis Seborian
    -- Queststatus Overview
    -- 0: No Quest taken
    -- 1: Quest 1 taken - gather 10 raw materials for 50cp
    -- 2: Quest 1 solved
    -- 3: Quest 2 taken - gather 20 raw materials for 100cp
    -- 4: Quest 2 solved
    -- 5: Quest 3 taken - gather 5 rare raw materials for 100cp
    -- 6: Quest 3 solved
    -- 7: Quest 4 taken - gather 10 distant raw materials for 200cp
    -- 8: Quest 4 solved
    -- Debugging
    AddTraderTrigger("set 0","Quest status set to 0");
    AddConsequence("qpg","=",0);
    AddTraderTrigger("set 1","Quest status set to 1");
    AddConsequence("qpg","=",1);
    AddTraderTrigger("set 2","Quest status set to 2");
    AddConsequence("qpg","=",2);
    AddTraderTrigger("set 3","Quest status set to 3");
    AddConsequence("qpg","=",3);
    AddTraderTrigger("set 4","Quest status set to 4");
    AddConsequence("qpg","=",4);
    AddTraderTrigger("set 5","Quest status set to 5");
    AddConsequence("qpg","=",5);
    AddTraderTrigger("set 6","Quest status set to 6");
    AddConsequence("qpg","=",6);
    AddTraderTrigger("set 7","Quest status set to 7");
    AddConsequence("qpg","=",7);
    AddTraderTrigger("set 8","Quest status set to 8");
    AddConsequence("qpg","=",8);
    -- Help
    AddTraderTrigger("Help","");
    AddConsequence("inform","[Game Help] This NPC is the forester Valandil Elensar. Keyphrases: Hello, quest, hatchet, forester, wood.");
    AddTraderTrigger("Hilfe","");
    AddConsequence("inform","[Spielhilfe] Dieser NPC ist der Förster Valandil Elensar. Schlüsselwörter: Hallo, Quest, Beil, Förster, Holz.");
    -- General speech
    AddTraderTrigger("Hello","Greetings, friend, sorry that I won't stand up but I planted trees all day long, now I feel a little tired.");
    AddAdditionalTrigger("Greetings");
    AddAdditionalTrigger("Be greeted");
    AddAdditionalTrigger("Hail");
    AddAdditionalTrigger("Good day");
    AddAdditionalTrigger("Good morning");
    AddAdditionalTrigger("Good evening");
    AddAdditionalText("Welcome in Elstree forest, watch out for the deers, they are easily frightened today.");
    AddAdditionalText("Hello, I hope you weren't send to me in order to buy wood like my last visitor.");
    AddTraderTrigger("Grüße","Grüße, verzeiht, dass ich mich nicht erhebe aber ich habe den ganzen Tag Bäume gepflanzt und bin nun ein wenig ermüdet.");
    AddAdditionalTrigger("Gruß");
    AddAdditionalTrigger("Seid gegrüßt");
    AddAdditionalTrigger("Guten Tag");
    AddAdditionalTrigger("Guten Abend");
    AddAdditionalTrigger("Mahlzeit");
    AddAdditionalTrigger("Tach");
    AddAdditionalTrigger("Moin");
    AddAdditionalText("Willkommen im Elsbaumwald, achtet auf die Rehe, sie sind heute sehr schreckhaft.");
    AddAdditionalText("Hallo, ich hoffe, ihr wurdet nicht zu mir geschickt, um Holz zu kaufen wie mein letzter Besucher.");
    AddTraderTrigger("Hiho","Greetings, friend, sorry that I won't stand up but I planted trees all day long, now I feel a little tired.");
    AddAdditionalTrigger("Hallo");
    AddAdditionalTrigger("Hey");
    AddAdditionalTrigger("Greebas");
    AddAdditionalTrigger("Greebs");
    AddCondition("lang","english");
    AddAdditionalText("Welcome in the Elstree forest, watch out for the deers, they are easily frightened today.");
    AddAdditionalText("Hello, I hope you weren't send to me in order to buy wood like my last visitor.");
    AddTraderTrigger("Hiho","Grüße, verzeiht, dass ich mich nicht erhebe aber ich habe den ganzen Tag Bäume gepflanzt und bin nun ein wenig ermüdet.");
    AddAdditionalTrigger("Hallo");
    AddAdditionalTrigger("Hey");
    AddAdditionalTrigger("Greebas");
    AddAdditionalTrigger("Greebs");
    AddCondition("lang","german");
    AddAdditionalText("Willkommen im Elsbaumwald, achtet auf die Rehe, sie sind heute sehr schreckhaft.");
    AddAdditionalText("Hallo, ich hoffe, ihr wurdet nicht zu mir geschickt, um Holz zu kaufen wie mein letzter Besucher.");
    AddTraderTrigger("Farewell","Farewell, may the gods watch your paths.");
    AddAdditionalTrigger("Good bye");
    AddAdditionalTrigger("Bye");
    AddAdditionalTrigger("Fare thy well");
    AddAdditionalText("Take care of yourself and never forget that the trees here are not to be touched by anyone but me without permission.");
    AddTraderTrigger("Tschüß","Auf bald, mögen die Götter über eure Pfade wachen.");
    AddAdditionalTrigger("Tschüss");
    AddAdditionalTrigger("Wiedersehen");
    AddAdditionalTrigger("Gehabt euch wohl");
    AddAdditionalText("Passt auf euch auf und denkt daran, dass die Bäume hier von niemanden außer mir ohne Erlaubnis berührt werden dürfen.");
    AddTraderTrigger("Ciao","Good bye, enjoy your time in Elstree forest.");
    AddAdditionalTrigger("Adieu");
    AddAdditionalTrigger("Au revoir");
    AddCondition("lang","english");
    AddAdditionalText("Oh, when you happen to pass sheep watch your back or else they might stick their curious noses into your pocket.");
    AddTraderTrigger("Ciao","Auf Wiedersehen, genießt eure Zeit hier im Elsbaumwald.");
    AddAdditionalTrigger("Adieu");
    AddAdditionalTrigger("Au revoir");
    AddCondition("lang","german");
    AddAdditionalText("Oh, wenn ihr an Schafen vorbei kommen solltet, habt acht oder sie stecken ihre neugierigen Mäuler in eure Taschen.");
    AddTraderTrigger("How are you","Oh, I am fine, thank you.");
    AddAdditionalTrigger("How feel");
    AddAdditionalTrigger("How do you do");
    AddAdditionalText("I got a splinter in my thumb but I will handle it.");
    AddAdditionalText("My head aches a little but it will pass after some rest.");
    AddTraderTrigger("Wie geht","Mir geht es gut, danke euch.");
    AddAdditionalTrigger("Wie fühlst");
    AddAdditionalTrigger("Wie ist es ergangen");
    AddAdditionalText("Ich habe einen Splitter im Daumen aber das wird schon.");
    AddAdditionalText("Mein Kopf schmerzt ein wenig aber das geht vorbei nach ein bischen Rast.");
    AddTraderTrigger("your name","I am Valandil Elensar.");
    AddAdditionalTrigger("who are you");
    AddAdditionalTrigger("who art thou");
    AddAdditionalText("Valandil Elensar is my name, I am the forester.");
    AddAdditionalText("I am Valandil Elensar, the forester.");
    AddTraderTrigger("dein name","Ich bin Valandil Elensar.");
    AddAdditionalTrigger("wer bist du");
    AddAdditionalTrigger("wer seid ihr");
    AddAdditionalTrigger("wie heißt");
    AddAdditionalText("Valandil Elensar ist mein Name, ich bin der Förster hier.");
    AddAdditionalText("Ich bin Valandil Elensar, der Förster.");
    -- Catching typical NPC phrases
    AddTraderTrigger("what sell","Sorry, I do not trade. All I know is how to prune trees without harming them more than necessary.");
    AddAdditionalTrigger("what buy");
    AddAdditionalTrigger("list wares");
    AddAdditionalTrigger("price of");
    AddAdditionalText("The narrow-minded act of trading does not suit me, thus you cannot purchase anything from me.");
    AddAdditionalText("I do not sell anything, in special no wood of slaughtered trees.");
    AddTraderTrigger("was verkauf","Verzeiht, ich handel nicht. Ich weiß nur, wie man Bäume möglichst schonend zurückschneidet.");
    AddAdditionalTrigger("was kauf");
    AddAdditionalTrigger("warenliste");
    AddAdditionalTrigger("preis von");
    AddAdditionalText("Der engstirnige Akt des Handelns ist nichts für mich, deshalb könnt ihr auch nichts von mir kaufen.");
    AddAdditionalText("Ich verkaufe nichts, insbesonder kein Holz von geschlachteten Bäumen.");
    AddTraderTrigger("tell something","Well, there is not much I could tell, Elstree forest is a rather peaceful place.");
    AddAdditionalText("I am no story-teller, if you want to gain information about the world you better ask one of the old elves or study the chronicles, that is more exciting than I could present it.");
    AddAdditionalText("Well. I am afraid I do not have anything to tell you.");
    AddTraderTrigger("erzähl was","Nun, es gibt nicht viel, das ich erzählen könnte, der Elsbaumwald ist ein eher ruhiger Ort.");
    AddAdditionalTrigger("erzähl etwas");
    AddAdditionalText("Ich bin kein Geschichtenerzähler, wenn ihr mehr über die Welt erfahren wollt, schlagt in den Chroniken nach, das ist aufregender, als ich es darstellen könnte.");
    AddAdditionalText("Nun, ich fürchte, ich habe nichts zu erzählen.");
    -- Small talk: The talk here should focus on possible questions. Feel free to add more!
    AddTraderTrigger("forester","I am a forester, if you want you can assist me and fulfill a task.");
    AddAdditionalText("As a forester, I care for the forest, yes.");
    AddAdditionalText("Being a forester is exhausting but also you get to be in touch with the trees a lot.");
    AddTraderTrigger("Förster","Ich bin ein Förster und wenn ihr helfen wollt, gebe ich euch einen Auftrag.");
    AddAdditionalText("Als Förster kümmere ich mich um die Bäume, richtig.");
    AddAdditionalText("Förster zu sein strengt an aber man ist auch viel an der frischen Luft.");
    AddTraderTrigger("Nana","Nana ist eine liebliche und nette Person. Sie lebt im Eibenthal, wohin ich früher oft gereist bin - bevor die Borkenkäfer kamen.");
    AddAdditionalTrigger("Winterbutter");
    AddCondition("lang","german");
    AddTraderTrigger("Nana","Nana is a cute and kind person, living in Yewdale. I used to travel there once in a while - before the bark beetles came.");
    AddAdditionalTrigger("Winterbutter");
    AddCondition("lang","english");
    AddTraderTrigger("bark beetle","Bark beetles are the trees' foes. And I am the trees' friend. So they are my foes!");
    AddTraderTrigger("Borkenkäfer","Der Borkenkäfer ist der Feind der Bäume und ich bin ein Freund der Bäume. Also ist er mein Feind!");
    AddTraderTrigger("lice","Scale lice want to exterminate the forest. But what if they succeed - won't they exterminate themselves?");
    AddAdditionalTrigger("louse");
    AddAdditionalTrigger("scale bug");
    AddAdditionalTrigger("scale insect");
    AddTraderTrigger("Schildlaus","Die Schildläuse wollen den Wald vernichten. Doch, was wenn sie Erfolg haben? Rotten sie sich nicht so selbst aus?");
    AddAdditionalTrigger("Schildläuse");
    AddAdditionalTrigger("Läuse");
    AddTraderTrigger("Elstree","Yes, the Elstree forest is like a child and a mother to me. I care for it like for a child and it grants me a sense of well-being like a mother.");
    AddTraderTrigger("Elsbaum","Ja, der Elsbaumwald ist wie ein Kind und eine Mutter für mich. Ich kümmere mich um ihn wie um ein Kind und er gibt mir die Geborgenheit wie eine Mutter.");
    AddTraderTrigger("Raban","Raban, ja, von diesem Namen habe ich gehört. Er ist ein Einsiedler, der tief im Wald lebt. Fragt mich aber nicht, wo.");
    AddCondition("lang","german");
    AddTraderTrigger("Raban","Raban, yes, I heard that name. He's a hermit, living somewhere deep in the forest, but do not ask me where.");
    AddCondition("lang","english");
    AddTraderTrigger("Eugene","Burton. Eugene Burton. If I ever catch this dreaded poacher, I will treat him just like he uses to treat the peaceful animals of Elstree forest.");
    AddAdditionalTrigger("Burton");
    AddCondition("lang","english");
    AddTraderTrigger("Eugene","Burton. Eugene Burton. Wenn ich diesen verdammten Wilderer je erwische, werde ich genau das mit ihm machen, was er mit den friedlichen Tieren des Elsbaumwaldes zu tun pflegt.");
    AddAdditionalTrigger("Burton");
    -- Factions
    AddTraderTrigger("Runewick","Nur die Leute aus Runewick ehren den Wald wie ein Kleinod. Sei es wegen ihrer Weisheit oder von ganzem Herzen, wer weiß das schon.");
    AddCondition("lang","german");
    AddTraderTrigger("Runewick","Only the people of Runewick honour the forest like a treasure. Due to wisdom or their hearts, I do not know.");
    AddCondition("lang","english");
    AddTraderTrigger("Galmair","Die Leute aus Galmair scheren sich nur um ihren Profit. Daher frage ich mich, warum sie sich keine langfristigen Gedanken machen.");
    AddCondition("lang","german");
    AddTraderTrigger("Galmair","The people of Galmair care for their profit, only. So, I wonder why they don't think about tomorrow's profit, too.");
    AddCondition("lang","english");
    AddTraderTrigger("Cadomyr","Sand und Stein, Cadomyr ist ein unwirtlicher Ort. Nur die Palmen halten es dort aus.");
    AddCondition("lang","german");
    AddTraderTrigger("Cadomyr","Sand and stone, Cadomyr is an inhospitable place. Only palmtrees can stand this region.");
    AddCondition("lang","english");
    -- Tool hints
    AddTraderTrigger("Hatchet","If you want a hatchet I could give one to you. But you would have to do a certain task for me in return.");
    AddCondition("qpg","=",0);
    AddTraderTrigger("Beil","Wenn ihr ein Beil wollt, könnte ich euch eines geben, allerdings wäre dies mit einem gewissen Auftrag verbunden.");
    AddCondition("qpg","=",0);
    AddTraderTrigger("Hatchet","If you want to buy a hatchet, you should ask a merchant in Runewick.");
    AddTraderTrigger("Beil","Wenn ihr ein Beil kaufen wollt, solltet ihr einen Händler in Runewick aufsuchen.");
    -- 1st quest: Take a tool and gather 10 raw materials for 50cp.
    AddTraderTrigger("quest","Ah, fine, so you want to help me, caring for the trees. Bark beetles are a real plague these days. Take this hatchet and search for ill naldor trees. Bring me ten logs, will you?");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",0);
    AddCondition("lang","english");
    AddConsequence("item",74,1,399,0);
    AddConsequence("qpg","=",1);
    AddConsequence("inform","[New quest] Elstree Forest I");
    AddTraderTrigger("quest","Ah, fein, ihr möchtet mir dabei helfen, die Bäume zu pflegen. Borkenkäfer sind zu einer echten Plage geworden. Nehmt dieses Beil und sucht nach kranken Naldorbäumen. Bringt mir zehn Scheite, ja?");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",0);
    AddCondition("lang","german");
    AddConsequence("item",74,1,399,0);
    AddConsequence("qpg","=",1);
    AddConsequence("inform","[Neues Quest] Elsbaumwald I");
    AddTraderTrigger("task","Ah, fine, so you want to help me, caring for the trees. Bark beetles are a real plague these days. Take this hatchet and search for ill naldor trees. Bring me ten logs, will you?");
    AddAdditionalTrigger("adventure");
    AddCondition("qpg","=",0);
    AddConsequence("item",74,1,399,0);
    AddConsequence("qpg","=",1);
    AddConsequence("inform","[New quest] Elstree Forest I");
    AddTraderTrigger("Aufgabe","Ah, fein, ihr möchtet mir dabei helfen, die Bäume zu pflegen. Borkenkäfer sind zu einer echten Plage geworden. Nehmt dieses Beil und sucht nach kranken Naldorbäumen. Bringt mir zehn Scheite, ja?");
    AddAdditionalTrigger("Abenteuer");
    AddCondition("qpg","=",0);
    AddConsequence("item",74,1,399,0);
    AddConsequence("qpg","=",1);
    AddConsequence("inform","[Neues Quest] Elsbaumwald I");
    AddTraderTrigger("quest","Please take care of ill naldor trees, else bark beetles might make other trees suffer, too.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",1);
    AddCondition("lang","english");
    AddTraderTrigger("quest","Bitte kümmert euch um die kranken Naldorbäume, andernfalls könnte der Borkenkäfer auch andere Bäume befallen.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",1);
    AddCondition("lang","german");
    AddTraderTrigger("task","Please take care of ill naldor trees, else bark beetles might make other trees suffer, too.");
    AddAdditionalTrigger("adventure");
    AddCondition("qpg","=",1);
    AddTraderTrigger("Aufgabe","Bitte kümmert euch um die kranken Naldorbäume, andernfalls könnte der Borkenkäfer auch andere Bäume befallen.");
    AddAdditionalTrigger("Abenteuer");
    AddCondition("qpg","=",1);
    AddTraderTrigger(".+","Oh, vielen Dank. Hier, eine kleine Entschädigung für eure Mühen.");
    AddCondition("qpg","=",1);
    AddCondition("item",544,"all",">",9);
    AddCondition("lang","german");
    AddConsequence("deleteitem",2560,10);
    AddConsequence("inform","[Quest gelöst] Du erhältst 50 Kupferstücke und deine Holzfällerfertigkeit steigt.");
    AddConsequence("money","+",50);
    AddConsequence("skill","crafting","lumberjacking","+",1);
    AddConsequence("qpg","=",2);
    AddTraderTrigger(".+","Oh, thank you. Here, take this reward for your efforts.");
    AddCondition("qpg","=",1);
    AddCondition("item",544,"all",">",9);
    AddCondition("lang","english");
    AddConsequence("deleteitem",2560,10);
    AddConsequence("inform","[Quest solved] You are awarded 50 copper coins and your lumberjacking skill increases.");
    AddConsequence("money","+",50);
    AddConsequence("skill","crafting","lumberjacking","+",1);
    AddConsequence("qpg","=",2);
    AddTraderTrigger(".+","Nun, ihr findet sicher noch weitere kranke Naldorbäume.");
    AddCondition("qpg","=",1);
    AddCondition("item",544,"all","<",10);
    AddCondition("lang","german");
    AddTraderTrigger(".+","Well, I am sure you'll find more ill naldor trees.");
    AddCondition("qpg","=",1);
    AddCondition("item",544,"all","<",10);
    AddCondition("lang","english");
    -- 2nd quest: Gather 20 different raw materials for 100cp. Hint on where to get new tools.
    AddTraderTrigger("quest","Oje, Schildläuse haben einige der Kirschbäume befallen. Wir haben kein Wahl, schlagt die kranken Bäume und bring mir zwanzig Scheite.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",2);
    AddCondition("lang","english");
    AddConsequence("qpg","=",3);
    AddConsequence("inform","[New quest] Elstree Forest II");
    AddTraderTrigger("quest","Oh dear, scale lice infested some of the cherry trees. We have no other choice, cut the ill trees and bring me twenty logs, please.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",2);
    AddCondition("lang","german");
    AddConsequence("qpg","=",3);
    AddConsequence("inform","[Neues Quest] Elsbaumwald II");
    AddTraderTrigger("task","Oh dear, scale lice infested some of the cherry trees. We have no other choice, cut the ill trees and bring me twenty logs, please.");
    AddAdditionalTrigger("adventure");
    AddCondition("qpg","=",2);
    AddConsequence("qpg","=",3);
    AddConsequence("inform","[New quest] Elstree Forest II");
    AddTraderTrigger("Aufgabe","Oje, Schildläuse haben einige der Kirschbäume befallen. Wir haben kein Wahl, schlagt die kranken Bäume und bring mir zwanzig Scheite.");
    AddAdditionalTrigger("Abenteuer");
    AddCondition("qpg","=",2);
    AddConsequence("qpg","=",3);
    AddConsequence("inform","[Neues Quest] Elsbaumwald II");
    AddTraderTrigger("quest","Oje, Schildläuse haben einige der Kirschbäume befallen. Wir haben kein Wahl, schlagt die kranken Bäume und bring mir zwanzig Scheite.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",3);
    AddCondition("lang","english");
    AddTraderTrigger("quest","Oh dear, scale lice infested some of the cherry trees. We have no other choice, cut the ill trees and bring me twenty logs, please.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",3);
    AddCondition("lang","german");
    AddTraderTrigger("task","Oh dear, scale lice infested some of the cherry trees. We have no other choice, cut the ill trees and bring me twenty logs, please.");
    AddAdditionalTrigger("adventure");
    AddCondition("qpg","=",3);
    AddTraderTrigger("Aufgabe","Oje, Schildläuse haben einige der Kirschbäume befallen. Wir haben kein Wahl, schlagt die kranken Bäume und bring mir zwanzig Scheite.");
    AddAdditionalTrigger("Abenteuer");
    AddCondition("qpg","=",3);
    AddTraderTrigger(".+","Ha, ihr habt es den Schildläusen gezeigt, danke euch. Nehmt dies als Belohnung.");
    AddCondition("qpg","=",3);
    AddCondition("item",543,"all",">",19);
    AddCondition("lang","german");
    AddConsequence("deleteitem",543,20);
    AddConsequence("inform","[Quest gelöst] Du erhältst 100 Kupferstücke und deine Holzfällerfertigkeit steigt.");
    AddConsequence("money","+",100);
    AddConsequence("skill","crafting","lumberjacking","+",1);
    AddConsequence("qpg","=",4);
    AddTraderTrigger(".+","Ha, now the archers can train again for any possible emergency, thank you. Take this as a reward.");
    AddCondition("qpg","=",3);
    AddCondition("item",543,"all",">",19);
    AddCondition("lang","english");
    AddConsequence("deleteitem",543,20);
    AddConsequence("inform","[Quest solved] You are awarded 100 copper coins and your lumberjacking skill increases.");
    AddConsequence("money","+",100);
    AddConsequence("skill","crafting","lumberjacking","+",1);
    AddConsequence("qpg","=",4);
    AddTraderTrigger(".+","Das ist noch nicht genügend Holz, schaut doch bitte zu, dass ihr noch mehr besorgt.");
    AddCondition("qpg","=",3);
    AddCondition("item",543,"all","<",20);
    AddCondition("lang","german");
    AddTraderTrigger(".+","Those are not enough logs yet, try to get some more.");
    AddCondition("qpg","=",3);
    AddCondition("item",543,"all","<",20);
    AddCondition("lang","english");
    -- 3rd quest: Gather 5 rare raw materials for 100cp. Hint on where to get new tools.
    AddTraderTrigger("quest","We always used to pin some twigs to the ceiling because of the delicious scent they spread. But now the branches we have have lost their scent. Do you think you can get us five new ones? The most intensive scented twigs can be found in the northern woods");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",4);
    AddCondition("lang","english");
    AddConsequence("qpg","=",5);
    AddConsequence("inform","[New quest] Elstree Forest III");
    AddTraderTrigger("quest","Wir brachten immer einige Zweige an der Decke an, des köstlichen Duftes wegen, den sie verbreiten. Doch nun haben die jetzigen Zweige ihren Duft verloren. Meint ihr, ihr könntet uns fünf neue besorgen? Die aus dem Nordwald riechen am intensivsten.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",4);
    AddCondition("lang","german");
    AddConsequence("qpg","=",5);
    AddConsequence("inform","[Neues Quest] Elsbaumwald III");
    AddTraderTrigger("task","We always used to pin some twigs to the ceiling because of the delicious scent they spread. But now the branches we have have lost their scent. Do you think you can get us five new ones? The most intensive scented twigs can be found in the northern woods.");
    AddAdditionalTrigger("adventure");
    AddCondition("qpg","=",4);
    AddConsequence("qpg","=",5);
    AddConsequence("inform","[New quest] Elstree Forest III");
    AddTraderTrigger("Aufgabe","Wir brachten immer einige Zweige an der Decke an, des köstlichen Duftes wegen, den sie verbreiten. Doch nun haben die jetzigen Zweige ihren Duft verloren. Meint ihr, ihr könntet uns fünf neue besorgen? Die aus dem Nordwald riechen am intensivsten.");
    AddAdditionalTrigger("Abenteuer");
    AddCondition("qpg","=",4);
    AddConsequence("qpg","=",5);
    AddConsequence("inform","[Neues Quest] Elsbaumwald III");
    AddTraderTrigger("quest","We always used to pin some twigs to the ceiling because of the delicious scent they spread. But now the branches we have have lost their scent. Do you think you can get us five new ones?");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",5);
    AddCondition("lang","english");
    AddTraderTrigger("quest","Wir brachten immer einige Zweige an der Decke an, des köstlichen Duftes wegen, den sie verbreiten. Doch nun haben die jetzigen Zweige ihren Duft verloren. Meint ihr, ihr könntet uns fünf neue besorgen?");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",5);
    AddCondition("lang","german");
    AddTraderTrigger("task","We always used to pin some twigs to the ceiling because of the delicious scent they spread. But now the branches we have have lost their scent. Do you think you can get us five new ones?");
    AddAdditionalTrigger("adventure");
    AddCondition("qpg","=",5);
    AddTraderTrigger("Aufgabe","Wir brachten immer einige Zweige an der Decke an, des köstlichen Duftes wegen, den sie verbreiten. Doch nun haben die jetzigen Zweige ihren Duft verloren. Meint ihr, ihr könntet uns fünf neue besorgen?");
    AddAdditionalTrigger("Abenteuer");
    AddCondition("qpg","=",5);
    AddTraderTrigger(".+","Mmh... riecht ihr das? Der beruhigende Duft des Waldes, vielen vielen Dank. Meine Frau und ich können nun endlich wieder entspannt einschlafen.");
    AddCondition("qpg","=",5);
    AddCondition("item",2786,"all",">",4);
    AddCondition("lang","german");
    AddConsequence("deleteitem",2786,5);
    AddConsequence("inform","[Quest gelöst] Du erhältst 100 Kupferstücke und deine Holzfällerfertigkeit steigt.");
    AddConsequence("money","+",100);
    AddConsequence("skill","crafting","lumberjacking","+",1);
    AddConsequence("qpg","=",6);
    AddTraderTrigger(".+","Mmh... do you smell that? The calming scent of the woods, thank you very much. Finally my wife and I can go to sleep completely relaxed again.");
    AddCondition("qpg","=",5);
    AddCondition("item",2786,"all",">",4);
    AddCondition("lang","english");
    AddConsequence("deleteitem",2786,5);
    AddConsequence("inform","[Quest solved] You are awarded 100 copper coins and your lumberjacking skill increases.");
    AddConsequence("money","+",100);
    AddConsequence("skill","crafting","lumberjacking","+",1);
    AddConsequence("qpg","=",6);
    AddTraderTrigger(".+","Nun, wir wollten uns eigentlich einen Vorrat anlegen, damit wir euch nicht so schnell wieder belästigen müssen. Bringt doch bitte gleich ein paar mehr Zweige.");
    AddCondition("qpg","=",5);
    AddCondition("item",2786,"all","<",5);
    AddCondition("lang","german");
    AddTraderTrigger(".+","Well, actually we wanted to have a bigger storage so that we do not have to bother you again. Please, gather some more twigs.");
    AddCondition("qpg","=",5);
    AddCondition("item",2786,"all","<",5);
    AddCondition("lang","english");
    -- 4th quest: Gather 10 raw materials from a totally different location for 200cp. Link to other quest. Hint how to get there.
    AddTraderTrigger("quest","In addition to my tasks as forester, I care for the cows. Can you bring me ten bundles of grain to feed them? Nana Winterbutter in Yewdale might help you.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",6);
    AddCondition("lang","english");
    AddConsequence("qpg","=",7);
    AddConsequence("inform","[New quest] Elstree Forest IV");
    AddTraderTrigger("quest","Zusätzlich zu meinen Aufgaben als Förster kümmere ich mich um die Kühe. Könnt ihr mir zehn Bündel Getreide bringen, um sie zu füttern? Nana Winterbutter in Eibenthal könnte dir dabei helfen.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",6);
    AddCondition("lang","german");
    AddConsequence("qpg","=",7);
    AddConsequence("inform","[Neues Quest] Elsbaumwald IV");
    AddTraderTrigger("task","In addition to my tasks as forester, I care for the cows. Can you bring me ten bundles of grain to feed them? Nana Winterbutter in Yewdale might help you.");
    AddAdditionalTrigger("adventure");
    AddCondition("qpg","=",6);
    AddConsequence("qpg","=",7);
    AddConsequence("inform","[New quest] Elstree Forest IV");
    AddTraderTrigger("Aufgabe","Zusätzlich zu meinen Aufgaben als Förster kümmere ich mich um die Kühe. Könnt ihr mir zehn Bündel Getreide bringen, um sie zu füttern? Nana Winterbutter im Eibenthal könnte dir dabei helfen.");
    AddAdditionalTrigger("Abenteuer");
    AddCondition("qpg","=",6);
    AddConsequence("qpg","=",7);
    AddConsequence("inform","[Neues Quest] Elsbaumwald IV");
    AddTraderTrigger("quest","Please, the cows have a hard time, finding fresh grass. Will you bring me some straw?");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",7);
    AddCondition("lang","english");
    AddTraderTrigger("quest","Bitte, die Kühe haben es schwer, saftiges Gras zu finden. Werdet ihr mir Stroh bringen?");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",7);
    AddCondition("lang","german");
    AddTraderTrigger("task","Please, the cows have a hard time, finding fresh grass. Will you bring me some straw?");
    AddAdditionalTrigger("adventure");
    AddCondition("qpg","=",7);
    AddTraderTrigger("Aufgabe","Bitte, die Kühe haben es schwer, saftiges Gras zu finden. Werdet ihr mir Stroh bringen?");
    AddAdditionalTrigger("Abenteuer");
    AddCondition("qpg","=",7);
    AddTraderTrigger(".+","Thank you so much. Now I can feed the cows and enjoy their gratefullness.");
    AddCondition("qpg","=",7);
    AddCondition("item",249,"all",">",9);
    AddCondition("lang","german");
    AddConsequence("deleteitem",249,10);
    AddConsequence("inform","[Quest solved] You are awarded 200 copper coins and your lumberjacking skill increases.");
    AddConsequence("money","+",200);
    AddConsequence("skill","crafting","lumberjacking","+",1);
    AddConsequence("qpg","=",8);
    AddTraderTrigger(".+","Vielen, vielen Dank. Nun kann ich die Kühe füttern und mich ihrer Dankbarkeit erfreuen.");
    AddCondition("qpg","=",7);
    AddCondition("item",249,"all",">",9);
    AddCondition("lang","english");
    AddConsequence("deleteitem",249,10);
    AddConsequence("inform","[Quest gelöst] Du erhältst 200 Kupferstücke und deine Holzfällerfertigkeit steigt.");
    AddConsequence("money","+",200);
    AddConsequence("skill","crafting","lumberjacking","+",1);
    AddConsequence("qpg","=",8);
    AddTraderTrigger(".+","Could you please bring me more straw? Some of the cows are already pretty thin, aren't they?");
    AddCondition("qpg","=",7);
    AddCondition("item",249,"all","<",10);
    AddCondition("lang","german");
    AddTraderTrigger(".+","Könntet ihr mir bitte mehr Stroh bringen? Einige der Kühe sehen schon ganz schön abgemagert aus, nicht?");
    AddCondition("qpg","=",7);
    AddCondition("item",249,"all","<",10);
    AddCondition("lang","english");
    -- Final dialogue: No more quests, just nice hints
    AddTraderTrigger("quest","I am grateful for all your help. If you visit Nana Winterbutter in Yewdale, can you greet her from me?");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",8);
    AddCondition("lang","english");
    AddTraderTrigger("quest","Ich bin dankbar für all eure Hilfe. Wenn ihr Nana Winterbutter in Eibenthal besucht, mögt ihr sie von mir grüßen?");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",8);
    AddCondition("lang","german");
    AddTraderTrigger("task","I am grateful for all your help. If you visit Nana Winterbutter in Yewdale, can you greet her from me?");
    AddAdditionalTrigger("adventure");
    AddCondition("qpg","=",8);
    AddTraderTrigger("Aufgabe","Ich bin dankbar für all eure Hilfe. Wenn ihr Nana Winterbutter in Eibenthal besucht, mögt ihr sie von mir grüßen?");
    AddAdditionalTrigger("Abenteuer");
    AddCondition("qpg","=",8);
    -- Last catch: Think about keyphrases the player might say and that are not caught until here
    AddTraderTrigger("Yes","Really?");
    AddAdditionalText("#me looks confused");
    AddAdditionalText("Can your repeat that?");
    AddTraderTrigger("Ja","Wirklich?");
    AddAdditionalText("#me schaut etwas verwirrt");
    AddAdditionalText("Könnt ihr das wiederholen?");
    AddTraderTrigger("No","No?");
    AddAdditionalText("Why not?");
    AddAdditionalText("#me shakes his head slowly");
    AddAdditionalText("I don't understand...");
    AddTraderTrigger("Nein","Nein?");
    AddAdditionalText("Weshalb nicht?");
    AddAdditionalText("#me schüttelt seinen Kopf bedächtig");
    AddAdditionalText("Ich verstehe nicht ganz...");
    -- Cycletext: Please add at least(!) five cycletext messages. The more, the better. You can use emotes (#me is green), too.
    AddCycleText("Blöde Borkenkäfer!","Damn bark beetles!");
    AddCycleText("Läuse! Überall Läuse!","Lice! Everywhere lice!");
    AddCycleText("#me harkt einen Haufen Laub zusammen.","#me rakes a pile of leaves.");
    AddCycleText("#me fährt die Klinge eines Beils mit einem Wetzstein entlang.","#me sharpens the blade of a hatchet with a whetstone");
    AddCycleText("#me sieht sich um und murmelt vor sich hin: 'Meine Freunde...'","#me looks around and murmurs: 'My friends...'");
    AddCycleText("Wenn ich jemanden dabei erwische, wie er ohne meine Billigung Holz schlägt, dann wird er was erleben!","When I catch somebody cutting wood without my permission, he's got something coming!");
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
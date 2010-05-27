-- INSERT INTO npc VALUES (nextval('npc_seq'),3,-125,-400,0,4,false,'Valandil Elensar','npc_valandil_elensar.lua',0);

require("npcs.base.autonpcfunctions")
module("npcs.valandil_elensar")

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

    npcs.base.autonpcfunctions.SetRadius(1);
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
    npcs.base.autonpcfunctions.AddTraderTrigger("set 0","Quest status set to 0");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",0);
    npcs.base.autonpcfunctions.AddTraderTrigger("set 1","Quest status set to 1");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("set 2","Quest status set to 2");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("set 3","Quest status set to 3");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",3);
    npcs.base.autonpcfunctions.AddTraderTrigger("set 4","Quest status set to 4");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",4);
    npcs.base.autonpcfunctions.AddTraderTrigger("set 5","Quest status set to 5");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",5);
    npcs.base.autonpcfunctions.AddTraderTrigger("set 6","Quest status set to 6");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",6);
    npcs.base.autonpcfunctions.AddTraderTrigger("set 7","Quest status set to 7");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",7);
    npcs.base.autonpcfunctions.AddTraderTrigger("set 8","Quest status set to 8");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",8);
    -- Help
    npcs.base.autonpcfunctions.AddTraderTrigger("Help","");
    npcs.base.autonpcfunctions.AddConsequence("inform","[Game Help] This NPC is the forester Valandil Elensar. Keyphrases: Hello, quest, hatchet, forester, wood.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Hilfe","");
    npcs.base.autonpcfunctions.AddConsequence("inform","[Spielhilfe] Dieser NPC ist der Förster Valandil Elensar. Schlüsselwörter: Hallo, Quest, Beil, Förster, Holz.");
    -- General speech
    npcs.base.autonpcfunctions.AddTraderTrigger("Hello","Greetings, friend, sorry that I won't stand up but I planted trees all day long, now I feel a little tired.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greetings");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Be greeted");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hail");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good day");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good morning");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good evening");
    npcs.base.autonpcfunctions.AddAdditionalText("Welcome in Elstree forest, watch out for the deers, they are easily frightened today.");
    npcs.base.autonpcfunctions.AddAdditionalText("Hello, I hope you weren't send to me in order to buy wood like my last visitor.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Grüße","Grüße, verzeiht, dass ich mich nicht erhebe aber ich habe den ganzen Tag Bäume gepflanzt und bin nun ein wenig ermüdet.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Gruß");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Seid gegrüßt");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Guten Tag");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Guten Abend");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Mahlzeit");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Tach");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Moin");
    npcs.base.autonpcfunctions.AddAdditionalText("Willkommen im Elsbaumwald, achtet auf die Rehe, sie sind heute sehr schreckhaft.");
    npcs.base.autonpcfunctions.AddAdditionalText("Hallo, ich hoffe, ihr wurdet nicht zu mir geschickt, um Holz zu kaufen wie mein letzter Besucher.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Hiho","Greetings, friend, sorry that I won't stand up but I planted trees all day long, now I feel a little tired.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddAdditionalText("Welcome in the Elstree forest, watch out for the deers, they are easily frightened today.");
    npcs.base.autonpcfunctions.AddAdditionalText("Hello, I hope you weren't send to me in order to buy wood like my last visitor.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Hiho","Grüße, verzeiht, dass ich mich nicht erhebe aber ich habe den ganzen Tag Bäume gepflanzt und bin nun ein wenig ermüdet.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddAdditionalText("Willkommen im Elsbaumwald, achtet auf die Rehe, sie sind heute sehr schreckhaft.");
    npcs.base.autonpcfunctions.AddAdditionalText("Hallo, ich hoffe, ihr wurdet nicht zu mir geschickt, um Holz zu kaufen wie mein letzter Besucher.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Farewell","Farewell, may the gods watch your paths.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good bye");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Bye");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Fare thy well");
    npcs.base.autonpcfunctions.AddAdditionalText("Take care of yourself and never forget that the trees here are not to be touched by anyone but me without permission.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Tschüß","Auf bald, mögen die Götter über eure Pfade wachen.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Tschüss");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Wiedersehen");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Gehabt euch wohl");
    npcs.base.autonpcfunctions.AddAdditionalText("Passt auf euch auf und denkt daran, dass die Bäume hier von niemanden außer mir ohne Erlaubnis berührt werden dürfen.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Ciao","Good bye, enjoy your time in Elstree forest.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddAdditionalText("Oh, when you happen to pass sheep watch your back or else they might stick their curious noses into your pocket.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Ciao","Auf Wiedersehen, genießt eure Zeit hier im Elsbaumwald.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddAdditionalText("Oh, wenn ihr an Schafen vorbei kommen solltet, habt acht oder sie stecken ihre neugierigen Mäuler in eure Taschen.");
    npcs.base.autonpcfunctions.AddTraderTrigger("How are you","Oh, I am fine, thank you.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("How feel");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("How do you do");
    npcs.base.autonpcfunctions.AddAdditionalText("I got a splinter in my thumb but I will handle it.");
    npcs.base.autonpcfunctions.AddAdditionalText("My head aches a little but it will pass after some rest.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Wie geht","Mir geht es gut, danke euch.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Wie fühlst");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Wie ist es ergangen");
    npcs.base.autonpcfunctions.AddAdditionalText("Ich habe einen Splitter im Daumen aber das wird schon.");
    npcs.base.autonpcfunctions.AddAdditionalText("Mein Kopf schmerzt ein wenig aber das geht vorbei nach ein bischen Rast.");
    npcs.base.autonpcfunctions.AddTraderTrigger("your name","I am Valandil Elensar.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("who are you");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("who art thou");
    npcs.base.autonpcfunctions.AddAdditionalText("Valandil Elensar is my name, I am the forester.");
    npcs.base.autonpcfunctions.AddAdditionalText("I am Valandil Elensar, the forester.");
    npcs.base.autonpcfunctions.AddTraderTrigger("dein name","Ich bin Valandil Elensar.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wer bist du");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wer seid ihr");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wie heißt");
    npcs.base.autonpcfunctions.AddAdditionalText("Valandil Elensar ist mein Name, ich bin der Förster hier.");
    npcs.base.autonpcfunctions.AddAdditionalText("Ich bin Valandil Elensar, der Förster.");
    -- Catching typical NPC phrases
    npcs.base.autonpcfunctions.AddTraderTrigger("what sell","Sorry, I do not trade. All I know is how to prune trees without harming them more than necessary.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("what buy");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("list wares");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("price of");
    npcs.base.autonpcfunctions.AddAdditionalText("The narrow-minded act of trading does not suit me, thus you cannot purchase anything from me.");
    npcs.base.autonpcfunctions.AddAdditionalText("I do not sell anything, in special no wood of slaughtered trees.");
    npcs.base.autonpcfunctions.AddTraderTrigger("was verkauf","Verzeiht, ich handel nicht. Ich weiß nur, wie man Bäume möglichst schonend zurückschneidet.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("was kauf");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("warenliste");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("preis von");
    npcs.base.autonpcfunctions.AddAdditionalText("Der engstirnige Akt des Handelns ist nichts für mich, deshalb könnt ihr auch nichts von mir kaufen.");
    npcs.base.autonpcfunctions.AddAdditionalText("Ich verkaufe nichts, insbesonder kein Holz von geschlachteten Bäumen.");
    npcs.base.autonpcfunctions.AddTraderTrigger("tell something","Well, there is not much I could tell, Elstree forest is a rather peaceful place.");
    npcs.base.autonpcfunctions.AddAdditionalText("I am no story-teller, if you want to gain information about the world you better ask one of the old elves or study the chronicles, that is more exciting than I could present it.");
    npcs.base.autonpcfunctions.AddAdditionalText("Well. I am afraid I do not have anything to tell you.");
    npcs.base.autonpcfunctions.AddTraderTrigger("erzähl was","Nun, es gibt nicht viel, das ich erzählen könnte, der Elsbaumwald ist ein eher ruhiger Ort.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("erzähl etwas");
    npcs.base.autonpcfunctions.AddAdditionalText("Ich bin kein Geschichtenerzähler, wenn ihr mehr über die Welt erfahren wollt, schlagt in den Chroniken nach, das ist aufregender, als ich es darstellen könnte.");
    npcs.base.autonpcfunctions.AddAdditionalText("Nun, ich fürchte, ich habe nichts zu erzählen.");
    -- Small talk: The talk here should focus on possible questions. Feel free to add more!
    npcs.base.autonpcfunctions.AddTraderTrigger("forester","I am a forester, if you want you can assist me and fulfill a task.");
    npcs.base.autonpcfunctions.AddAdditionalText("As a forester, I care for the forest, yes.");
    npcs.base.autonpcfunctions.AddAdditionalText("Being a forester is exhausting but also you get to be in touch with the trees a lot.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Förster","Ich bin ein Förster und wenn ihr helfen wollt, gebe ich euch einen Auftrag.");
    npcs.base.autonpcfunctions.AddAdditionalText("Als Förster kümmere ich mich um die Bäume, richtig.");
    npcs.base.autonpcfunctions.AddAdditionalText("Förster zu sein strengt an aber man ist auch viel an der frischen Luft.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Nana","Nana ist eine liebliche und nette Person. Sie lebt im Eibenthal, wohin ich früher oft gereist bin - bevor die Borkenkäfer kamen.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Winterbutter");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("Nana","Nana is a cute and kind person, living in Yewdale. I used to travel there once in a while - before the bark beetles came.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Winterbutter");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("bark beetle","Bark beetles are the trees' foes. And I am the trees' friend. So they are my foes!");
    npcs.base.autonpcfunctions.AddTraderTrigger("Borkenkäfer","Der Borkenkäfer ist der Feind der Bäume und ich bin ein Freund der Bäume. Also ist er mein Feind!");
    npcs.base.autonpcfunctions.AddTraderTrigger("lice","npcs.base.autonpcfunctions.Scale lice want to exterminate the forest. But what if they succeed - won't they exterminate themselves?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("louse");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("scale bug");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("scale insect");
    npcs.base.autonpcfunctions.AddTraderTrigger("Schildlaus","Die Schildläuse wollen den Wald vernichten. Doch, was wenn sie Erfolg haben? Rotten sie sich nicht so selbst aus?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Schildläuse");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Läuse");
    npcs.base.autonpcfunctions.AddTraderTrigger("Elstree","Yes, the Elstree forest is like a child and a mother to me. I care for it like for a child and it grants me a sense of well-being like a mother.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Elsbaum","Ja, der Elsbaumwald ist wie ein Kind und eine Mutter für mich. Ich kümmere mich um ihn wie um ein Kind und er gibt mir die Geborgenheit wie eine Mutter.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Raban","Raban, ja, von diesem Namen habe ich gehört. Er ist ein Einsiedler, der tief im Wald lebt. Fragt mich aber nicht, wo.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("Raban","Raban, yes, I heard that name. He's a hermit, living somewhere deep in the forest, but do not ask me where.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Eugene","Burton. Eugene Burton. If I ever catch this dreaded poacher, I will treat him just like he uses to treat the peaceful animals of Elstree forest.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Burton");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Eugene","Burton. Eugene Burton. Wenn ich diesen verdammten Wilderer je erwische, werde ich genau das mit ihm machen, was er mit den friedlichen Tieren des Elsbaumwaldes zu tun pflegt.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Burton");
    -- Factions
    npcs.base.autonpcfunctions.AddTraderTrigger("Runewick","Nur die Leute aus Runewick ehren den Wald wie ein Kleinod. Sei es wegen ihrer Weisheit oder von ganzem Herzen, wer weiß das schon.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("Runewick","Only the people of Runewick honour the forest like a treasure. Due to wisdom or their hearts, I do not know.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Galmair","Die Leute aus Galmair scheren sich nur um ihren Profit. Daher frage ich mich, warum sie sich keine langfristigen Gedanken machen.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("Galmair","The people of Galmair care for their profit, only. So, I wonder why they don't think about tomorrow's profit, too.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Cadomyr","Sand und Stein, Cadomyr ist ein unwirtlicher Ort. Nur die Palmen halten es dort aus.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("Cadomyr","Sand and stone, Cadomyr is an inhospitable place. Only palmtrees can stand this region.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    -- Tool hints
    npcs.base.autonpcfunctions.AddTraderTrigger("Hatchet","If you want a hatchet I could give one to you. But you would have to do a certain task for me in return.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",0);
    npcs.base.autonpcfunctions.AddTraderTrigger("Beil","Wenn ihr ein Beil wollt, könnte ich euch eines geben, allerdings wäre dies mit einem gewissen Auftrag verbunden.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",0);
    npcs.base.autonpcfunctions.AddTraderTrigger("Hatchet","If you want to buy a hatchet, you should ask a merchant in Runewick.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Beil","Wenn ihr ein Beil kaufen wollt, solltet ihr einen Händler in Runewick aufsuchen.");
    -- 1st quest: Take a tool and gather 10 raw materials for 50cp.
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Ah, fine, so you want to help me, caring for the trees. Bark beetles are a real plague these days. Take this hatchet and search for ill naldor trees. Bring me ten logs, will you?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",0);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("item",74,1,399,0);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("inform","[New quest] Elstree Forest I");
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Ah, fein, ihr möchtet mir dabei helfen, die Bäume zu pflegen. Borkenkäfer sind zu einer echten Plage geworden. Nehmt dieses Beil und sucht nach kranken Naldorbäumen. Bringt mir zehn Scheite, ja?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",0);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddConsequence("item",74,1,399,0);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Elsbaumwald I");
    npcs.base.autonpcfunctions.AddTraderTrigger("task","Ah, fine, so you want to help me, caring for the trees. Bark beetles are a real plague these days. Take this hatchet and search for ill naldor trees. Bring me ten logs, will you?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",0);
    npcs.base.autonpcfunctions.AddConsequence("item",74,1,399,0);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("inform","[New quest] Elstree Forest I");
    npcs.base.autonpcfunctions.AddTraderTrigger("Aufgabe","Ah, fein, ihr möchtet mir dabei helfen, die Bäume zu pflegen. Borkenkäfer sind zu einer echten Plage geworden. Nehmt dieses Beil und sucht nach kranken Naldorbäumen. Bringt mir zehn Scheite, ja?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",0);
    npcs.base.autonpcfunctions.AddConsequence("item",74,1,399,0);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Elsbaumwald I");
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Please take care of ill naldor trees, else bark beetles might make other trees suffer, too.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Bitte kümmert euch um die kranken Naldorbäume, andernfalls könnte der Borkenkäfer auch andere Bäume befallen.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("task","Please take care of ill naldor trees, else bark beetles might make other trees suffer, too.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("Aufgabe","Bitte kümmert euch um die kranken Naldorbäume, andernfalls könnte der Borkenkäfer auch andere Bäume befallen.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Oh, vielen Dank. Hier, eine kleine Entschädigung für eure Mühen.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddCondition("item",544,"all",">",9);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddConsequence("deleteitem",2560,10);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Quest gelöst] Du erhältst 50 Kupferstücke und deine Holzfällerfertigkeit steigt.");
    npcs.base.autonpcfunctions.AddConsequence("money","+",50);
    npcs.base.autonpcfunctions.AddConsequence("skill","crafting","lumberjacking","+",1);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Oh, thank you. Here, take this reward for your efforts.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddCondition("item",544,"all",">",9);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("deleteitem",2560,10);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Quest solved] You are awarded 50 copper coins and your lumberjacking skill increases.");
    npcs.base.autonpcfunctions.AddConsequence("money","+",50);
    npcs.base.autonpcfunctions.AddConsequence("skill","crafting","lumberjacking","+",1);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Nun, ihr findet sicher noch weitere kranke Naldorbäume.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddCondition("item",544,"all","<",10);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Well, I am sure you'll find more ill naldor trees.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddCondition("item",544,"all","<",10);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    -- 2nd quest: Gather 20 different raw materials for 100cp. Hint on where to get new tools.
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Oje, Schildläuse haben einige der Kirschbäume befallen. Wir haben kein Wahl, schlagt die kranken Bäume und bring mir zwanzig Scheite.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",3);
    npcs.base.autonpcfunctions.AddConsequence("inform","[New quest] Elstree Forest II");
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Oh dear, scale lice infested some of the cherry trees. We have no other choice, cut the ill trees and bring me twenty logs, please.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",3);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Elsbaumwald II");
    npcs.base.autonpcfunctions.AddTraderTrigger("task","Oh dear, scale lice infested some of the cherry trees. We have no other choice, cut the ill trees and bring me twenty logs, please.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",3);
    npcs.base.autonpcfunctions.AddConsequence("inform","[New quest] Elstree Forest II");
    npcs.base.autonpcfunctions.AddTraderTrigger("Aufgabe","Oje, Schildläuse haben einige der Kirschbäume befallen. Wir haben kein Wahl, schlagt die kranken Bäume und bring mir zwanzig Scheite.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",3);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Elsbaumwald II");
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Oje, Schildläuse haben einige der Kirschbäume befallen. Wir haben kein Wahl, schlagt die kranken Bäume und bring mir zwanzig Scheite.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",3);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Oh dear, scale lice infested some of the cherry trees. We have no other choice, cut the ill trees and bring me twenty logs, please.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",3);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("task","Oh dear, scale lice infested some of the cherry trees. We have no other choice, cut the ill trees and bring me twenty logs, please.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",3);
    npcs.base.autonpcfunctions.AddTraderTrigger("Aufgabe","Oje, Schildläuse haben einige der Kirschbäume befallen. Wir haben kein Wahl, schlagt die kranken Bäume und bring mir zwanzig Scheite.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",3);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Ha, ihr habt es den Schildläusen gezeigt, danke euch. Nehmt dies als Belohnung.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",3);
    npcs.base.autonpcfunctions.AddCondition("item",543,"all",">",19);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddConsequence("deleteitem",543,20);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Quest gelöst] Du erhältst 100 Kupferstücke und deine Holzfällerfertigkeit steigt.");
    npcs.base.autonpcfunctions.AddConsequence("money","+",100);
    npcs.base.autonpcfunctions.AddConsequence("skill","crafting","lumberjacking","+",1);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",4);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Ha, now the archers can train again for any possible emergency, thank you. Take this as a reward.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",3);
    npcs.base.autonpcfunctions.AddCondition("item",543,"all",">",19);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("deleteitem",543,20);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Quest solved] You are awarded 100 copper coins and your lumberjacking skill increases.");
    npcs.base.autonpcfunctions.AddConsequence("money","+",100);
    npcs.base.autonpcfunctions.AddConsequence("skill","crafting","lumberjacking","+",1);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",4);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Das ist noch nicht genügend Holz, schaut doch bitte zu, dass ihr noch mehr besorgt.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",3);
    npcs.base.autonpcfunctions.AddCondition("item",543,"all","<",20);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Those are not enough logs yet, try to get some more.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",3);
    npcs.base.autonpcfunctions.AddCondition("item",543,"all","<",20);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    -- 3rd quest: Gather 5 rare raw materials for 100cp. Hint on where to get new tools.
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","We always used to pin some twigs to the ceiling because of the delicious scent they spread. But now the branches we have have lost their scent. Do you think you can get us five new ones? The most intensive scented twigs can be found in the northern woods");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",4);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",5);
    npcs.base.autonpcfunctions.AddConsequence("inform","[New quest] Elstree Forest III");
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Wir brachten immer einige Zweige an der Decke an, des köstlichen Duftes wegen, den sie verbreiten. Doch nun haben die jetzigen Zweige ihren Duft verloren. Meint ihr, ihr könntet uns fünf neue besorgen? Die aus dem Nordwald riechen am intensivsten.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",4);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",5);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Elsbaumwald III");
    npcs.base.autonpcfunctions.AddTraderTrigger("task","We always used to pin some twigs to the ceiling because of the delicious scent they spread. But now the branches we have have lost their scent. Do you think you can get us five new ones? The most intensive scented twigs can be found in the northern woods.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",4);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",5);
    npcs.base.autonpcfunctions.AddConsequence("inform","[New quest] Elstree Forest III");
    npcs.base.autonpcfunctions.AddTraderTrigger("Aufgabe","Wir brachten immer einige Zweige an der Decke an, des köstlichen Duftes wegen, den sie verbreiten. Doch nun haben die jetzigen Zweige ihren Duft verloren. Meint ihr, ihr könntet uns fünf neue besorgen? Die aus dem Nordwald riechen am intensivsten.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",4);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",5);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Elsbaumwald III");
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","We always used to pin some twigs to the ceiling because of the delicious scent they spread. But now the branches we have have lost their scent. Do you think you can get us five new ones?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",5);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Wir brachten immer einige Zweige an der Decke an, des köstlichen Duftes wegen, den sie verbreiten. Doch nun haben die jetzigen Zweige ihren Duft verloren. Meint ihr, ihr könntet uns fünf neue besorgen?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",5);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("task","We always used to pin some twigs to the ceiling because of the delicious scent they spread. But now the branches we have have lost their scent. Do you think you can get us five new ones?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",5);
    npcs.base.autonpcfunctions.AddTraderTrigger("Aufgabe","Wir brachten immer einige Zweige an der Decke an, des köstlichen Duftes wegen, den sie verbreiten. Doch nun haben die jetzigen Zweige ihren Duft verloren. Meint ihr, ihr könntet uns fünf neue besorgen?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",5);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Mmh... riecht ihr das? Der beruhigende Duft des Waldes, vielen vielen Dank. Meine Frau und ich können nun endlich wieder entspannt einschlafen.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",5);
    npcs.base.autonpcfunctions.AddCondition("item",2786,"all",">",4);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddConsequence("deleteitem",2786,5);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Quest gelöst] Du erhältst 100 Kupferstücke und deine Holzfällerfertigkeit steigt.");
    npcs.base.autonpcfunctions.AddConsequence("money","+",100);
    npcs.base.autonpcfunctions.AddConsequence("skill","crafting","lumberjacking","+",1);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",6);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Mmh... do you smell that? The calming scent of the woods, thank you very much. Finally my wife and I can go to sleep completely relaxed again.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",5);
    npcs.base.autonpcfunctions.AddCondition("item",2786,"all",">",4);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("deleteitem",2786,5);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Quest solved] You are awarded 100 copper coins and your lumberjacking skill increases.");
    npcs.base.autonpcfunctions.AddConsequence("money","+",100);
    npcs.base.autonpcfunctions.AddConsequence("skill","crafting","lumberjacking","+",1);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",6);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Nun, wir wollten uns eigentlich einen Vorrat anlegen, damit wir euch nicht so schnell wieder belästigen müssen. Bringt doch bitte gleich ein paar mehr Zweige.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",5);
    npcs.base.autonpcfunctions.AddCondition("item",2786,"all","<",5);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Well, actually we wanted to have a bigger storage so that we do not have to bother you again. Please, gather some more twigs.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",5);
    npcs.base.autonpcfunctions.AddCondition("item",2786,"all","<",5);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    -- 4th quest: Gather 10 raw materials from a totally different location for 200cp. Link to other quest. Hint how to get there.
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","In addition to my tasks as forester, I care for the cows. Can you bring me ten bundles of grain to feed them? Nana Winterbutter in Yewdale might help you.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",6);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",7);
    npcs.base.autonpcfunctions.AddConsequence("inform","[New quest] Elstree Forest IV");
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Zusätzlich zu meinen Aufgaben als Förster kümmere ich mich um die Kühe. Könnt ihr mir zehn Bündel Getreide bringen, um sie zu füttern? Nana Winterbutter in Eibenthal könnte dir dabei helfen.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",6);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",7);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Elsbaumwald IV");
    npcs.base.autonpcfunctions.AddTraderTrigger("task","In addition to my tasks as forester, I care for the cows. Can you bring me ten bundles of grain to feed them? Nana Winterbutter in Yewdale might help you.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",6);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",7);
    npcs.base.autonpcfunctions.AddConsequence("inform","[New quest] Elstree Forest IV");
    npcs.base.autonpcfunctions.AddTraderTrigger("Aufgabe","Zusätzlich zu meinen Aufgaben als Förster kümmere ich mich um die Kühe. Könnt ihr mir zehn Bündel Getreide bringen, um sie zu füttern? Nana Winterbutter im Eibenthal könnte dir dabei helfen.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",6);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",7);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Elsbaumwald IV");
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Please, the cows have a hard time, finding fresh grass. Will you bring me some straw?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",7);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Bitte, die Kühe haben es schwer, saftiges Gras zu finden. Werdet ihr mir Stroh bringen?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",7);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("task","Please, the cows have a hard time, finding fresh grass. Will you bring me some straw?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",7);
    npcs.base.autonpcfunctions.AddTraderTrigger("Aufgabe","Bitte, die Kühe haben es schwer, saftiges Gras zu finden. Werdet ihr mir Stroh bringen?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",7);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Thank you so much. Now I can feed the cows and enjoy their gratefullness.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",7);
    npcs.base.autonpcfunctions.AddCondition("item",249,"all",">",9);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddConsequence("deleteitem",249,10);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Quest solved] You are awarded 200 copper coins and your lumberjacking skill increases.");
    npcs.base.autonpcfunctions.AddConsequence("money","+",200);
    npcs.base.autonpcfunctions.AddConsequence("skill","crafting","lumberjacking","+",1);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",8);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Vielen, vielen Dank. Nun kann ich die Kühe füttern und mich ihrer Dankbarkeit erfreuen.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",7);
    npcs.base.autonpcfunctions.AddCondition("item",249,"all",">",9);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("deleteitem",249,10);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Quest gelöst] Du erhältst 200 Kupferstücke und deine Holzfällerfertigkeit steigt.");
    npcs.base.autonpcfunctions.AddConsequence("money","+",200);
    npcs.base.autonpcfunctions.AddConsequence("skill","crafting","lumberjacking","+",1);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",8);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Could you please bring me more straw? Some of the cows are already pretty thin, aren't they?");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",7);
    npcs.base.autonpcfunctions.AddCondition("item",249,"all","<",10);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Könntet ihr mir bitte mehr Stroh bringen? Einige der Kühe sehen schon ganz schön abgemagert aus, nicht?");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",7);
    npcs.base.autonpcfunctions.AddCondition("item",249,"all","<",10);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    -- Final dialogue: No more quests, just nice hints
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","I am grateful for all your help. If you visit Nana Winterbutter in Yewdale, can you greet her from me?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",8);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Ich bin dankbar für all eure Hilfe. Wenn ihr Nana Winterbutter in Eibenthal besucht, mögt ihr sie von mir grüßen?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",8);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("task","I am grateful for all your help. If you visit Nana Winterbutter in Yewdale, can you greet her from me?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",8);
    npcs.base.autonpcfunctions.AddTraderTrigger("Aufgabe","Ich bin dankbar für all eure Hilfe. Wenn ihr Nana Winterbutter in Eibenthal besucht, mögt ihr sie von mir grüßen?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",8);
    -- Last catch: Think about keyphrases the player might say and that are not caught until here
    npcs.base.autonpcfunctions.AddTraderTrigger("Yes","Really?");
    npcs.base.autonpcfunctions.AddAdditionalText("#me looks confused");
    npcs.base.autonpcfunctions.AddAdditionalText("Can your repeat that?");
    npcs.base.autonpcfunctions.AddTraderTrigger("Ja","Wirklich?");
    npcs.base.autonpcfunctions.AddAdditionalText("#me schaut etwas verwirrt");
    npcs.base.autonpcfunctions.AddAdditionalText("Könnt ihr das wiederholen?");
    npcs.base.autonpcfunctions.AddTraderTrigger("No","No?");
    npcs.base.autonpcfunctions.AddAdditionalText("Why not?");
    npcs.base.autonpcfunctions.AddAdditionalText("#me shakes his head slowly");
    npcs.base.autonpcfunctions.AddAdditionalText("I don't understand...");
    npcs.base.autonpcfunctions.AddTraderTrigger("Nein","Nein?");
    npcs.base.autonpcfunctions.AddAdditionalText("Weshalb nicht?");
    npcs.base.autonpcfunctions.AddAdditionalText("#me schüttelt seinen Kopf bedächtig");
    npcs.base.autonpcfunctions.AddAdditionalText("Ich verstehe nicht ganz...");
    -- Cycletext: Please add at least(!) five cycletext messages. The more, the better. You can use emotes (#me is green), too.
    npcs.base.autonpcfunctions.AddCycleText("Blöde Borkenkäfer!","Damn bark beetles!");
    npcs.base.autonpcfunctions.AddCycleText("Läuse! Überall Läuse!","Lice! Everywhere lice!");
    npcs.base.autonpcfunctions.AddCycleText("#me harkt einen Haufen Laub zusammen.","#me rakes a pile of leaves.");
    npcs.base.autonpcfunctions.AddCycleText("#me fährt die Klinge eines Beils mit einem Wetzstein entlang.","#me sharpens the blade of a hatchet with a whetstone");
    npcs.base.autonpcfunctions.AddCycleText("#me sieht sich um und murmelt vor sich hin: 'Meine Freunde...'","#me looks around and murmurs: 'My friends...'");
    npcs.base.autonpcfunctions.AddCycleText("Wenn ich jemanden dabei erwische, wie er ohne meine Billigung Holz schlägt, dann wird er was erleben!","When I catch somebody cutting wood without my permission, he's got something coming!");
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
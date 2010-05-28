-- INSERT INTO npc VALUES (nextval('npc_seq'),3,-125,-400,0,4,false,'Valandil Elensar','npc_valandil_elensar.lua',0);

require("npc.base.autonpcfunctions")
module("npc.valandil_elensar")

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

    npc.base.autonpcfunctions.SetRadius(1);
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
    npc.base.autonpcfunctions.AddTraderTrigger("set 0","Quest status set to 0");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",0);
    npc.base.autonpcfunctions.AddTraderTrigger("set 1","Quest status set to 1");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddTraderTrigger("set 2","Quest status set to 2");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger("set 3","Quest status set to 3");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",3);
    npc.base.autonpcfunctions.AddTraderTrigger("set 4","Quest status set to 4");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",4);
    npc.base.autonpcfunctions.AddTraderTrigger("set 5","Quest status set to 5");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",5);
    npc.base.autonpcfunctions.AddTraderTrigger("set 6","Quest status set to 6");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",6);
    npc.base.autonpcfunctions.AddTraderTrigger("set 7","Quest status set to 7");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",7);
    npc.base.autonpcfunctions.AddTraderTrigger("set 8","Quest status set to 8");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",8);
    -- Help
    npc.base.autonpcfunctions.AddTraderTrigger("Help","");
    npc.base.autonpcfunctions.AddConsequence("inform","[Game Help] This NPC is the forester Valandil Elensar. Keyphrases: Hello, quest, hatchet, forester, wood.");
    npc.base.autonpcfunctions.AddTraderTrigger("Hilfe","");
    npc.base.autonpcfunctions.AddConsequence("inform","[Spielhilfe] Dieser NPC ist der Förster Valandil Elensar. Schlüsselwörter: Hallo, Quest, Beil, Förster, Holz.");
    -- General speech
    npc.base.autonpcfunctions.AddTraderTrigger("Hello","Greetings, friend, sorry that I won't stand up but I planted trees all day long, now I feel a little tired.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greetings");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Be greeted");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hail");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good day");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good morning");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good evening");
    npc.base.autonpcfunctions.AddAdditionalText("Welcome in Elstree forest, watch out for the deers, they are easily frightened today.");
    npc.base.autonpcfunctions.AddAdditionalText("Hello, I hope you weren't send to me in order to buy wood like my last visitor.");
    npc.base.autonpcfunctions.AddTraderTrigger("Grüße","Grüße, verzeiht, dass ich mich nicht erhebe aber ich habe den ganzen Tag Bäume gepflanzt und bin nun ein wenig ermüdet.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Gruß");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Seid gegrüßt");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Guten Tag");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Guten Abend");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Mahlzeit");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Tach");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Moin");
    npc.base.autonpcfunctions.AddAdditionalText("Willkommen im Elsbaumwald, achtet auf die Rehe, sie sind heute sehr schreckhaft.");
    npc.base.autonpcfunctions.AddAdditionalText("Hallo, ich hoffe, ihr wurdet nicht zu mir geschickt, um Holz zu kaufen wie mein letzter Besucher.");
    npc.base.autonpcfunctions.AddTraderTrigger("Hiho","Greetings, friend, sorry that I won't stand up but I planted trees all day long, now I feel a little tired.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("Welcome in the Elstree forest, watch out for the deers, they are easily frightened today.");
    npc.base.autonpcfunctions.AddAdditionalText("Hello, I hope you weren't send to me in order to buy wood like my last visitor.");
    npc.base.autonpcfunctions.AddTraderTrigger("Hiho","Grüße, verzeiht, dass ich mich nicht erhebe aber ich habe den ganzen Tag Bäume gepflanzt und bin nun ein wenig ermüdet.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddAdditionalText("Willkommen im Elsbaumwald, achtet auf die Rehe, sie sind heute sehr schreckhaft.");
    npc.base.autonpcfunctions.AddAdditionalText("Hallo, ich hoffe, ihr wurdet nicht zu mir geschickt, um Holz zu kaufen wie mein letzter Besucher.");
    npc.base.autonpcfunctions.AddTraderTrigger("Farewell","Farewell, may the gods watch your paths.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good bye");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Bye");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Fare thy well");
    npc.base.autonpcfunctions.AddAdditionalText("Take care of yourself and never forget that the trees here are not to be touched by anyone but me without permission.");
    npc.base.autonpcfunctions.AddTraderTrigger("Tschüß","Auf bald, mögen die Götter über eure Pfade wachen.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Tschüss");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Wiedersehen");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Gehabt euch wohl");
    npc.base.autonpcfunctions.AddAdditionalText("Passt auf euch auf und denkt daran, dass die Bäume hier von niemanden außer mir ohne Erlaubnis berührt werden dürfen.");
    npc.base.autonpcfunctions.AddTraderTrigger("Ciao","Good bye, enjoy your time in Elstree forest.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("Oh, when you happen to pass sheep watch your back or else they might stick their curious noses into your pocket.");
    npc.base.autonpcfunctions.AddTraderTrigger("Ciao","Auf Wiedersehen, genießt eure Zeit hier im Elsbaumwald.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddAdditionalText("Oh, wenn ihr an Schafen vorbei kommen solltet, habt acht oder sie stecken ihre neugierigen Mäuler in eure Taschen.");
    npc.base.autonpcfunctions.AddTraderTrigger("How are you","Oh, I am fine, thank you.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("How feel");
    npc.base.autonpcfunctions.AddAdditionalTrigger("How do you do");
    npc.base.autonpcfunctions.AddAdditionalText("I got a splinter in my thumb but I will handle it.");
    npc.base.autonpcfunctions.AddAdditionalText("My head aches a little but it will pass after some rest.");
    npc.base.autonpcfunctions.AddTraderTrigger("Wie geht","Mir geht es gut, danke euch.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Wie fühlst");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Wie ist es ergangen");
    npc.base.autonpcfunctions.AddAdditionalText("Ich habe einen Splitter im Daumen aber das wird schon.");
    npc.base.autonpcfunctions.AddAdditionalText("Mein Kopf schmerzt ein wenig aber das geht vorbei nach ein bischen Rast.");
    npc.base.autonpcfunctions.AddTraderTrigger("your name","I am Valandil Elensar.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("who are you");
    npc.base.autonpcfunctions.AddAdditionalTrigger("who art thou");
    npc.base.autonpcfunctions.AddAdditionalText("Valandil Elensar is my name, I am the forester.");
    npc.base.autonpcfunctions.AddAdditionalText("I am Valandil Elensar, the forester.");
    npc.base.autonpcfunctions.AddTraderTrigger("dein name","Ich bin Valandil Elensar.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("wer bist du");
    npc.base.autonpcfunctions.AddAdditionalTrigger("wer seid ihr");
    npc.base.autonpcfunctions.AddAdditionalTrigger("wie heißt");
    npc.base.autonpcfunctions.AddAdditionalText("Valandil Elensar ist mein Name, ich bin der Förster hier.");
    npc.base.autonpcfunctions.AddAdditionalText("Ich bin Valandil Elensar, der Förster.");
    -- Catching typical NPC phrases
    npc.base.autonpcfunctions.AddTraderTrigger("what sell","Sorry, I do not trade. All I know is how to prune trees without harming them more than necessary.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("what buy");
    npc.base.autonpcfunctions.AddAdditionalTrigger("list wares");
    npc.base.autonpcfunctions.AddAdditionalTrigger("price of");
    npc.base.autonpcfunctions.AddAdditionalText("The narrow-minded act of trading does not suit me, thus you cannot purchase anything from me.");
    npc.base.autonpcfunctions.AddAdditionalText("I do not sell anything, in special no wood of slaughtered trees.");
    npc.base.autonpcfunctions.AddTraderTrigger("was verkauf","Verzeiht, ich handel nicht. Ich weiß nur, wie man Bäume möglichst schonend zurückschneidet.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("was kauf");
    npc.base.autonpcfunctions.AddAdditionalTrigger("warenliste");
    npc.base.autonpcfunctions.AddAdditionalTrigger("preis von");
    npc.base.autonpcfunctions.AddAdditionalText("Der engstirnige Akt des Handelns ist nichts für mich, deshalb könnt ihr auch nichts von mir kaufen.");
    npc.base.autonpcfunctions.AddAdditionalText("Ich verkaufe nichts, insbesonder kein Holz von geschlachteten Bäumen.");
    npc.base.autonpcfunctions.AddTraderTrigger("tell something","Well, there is not much I could tell, Elstree forest is a rather peaceful place.");
    npc.base.autonpcfunctions.AddAdditionalText("I am no story-teller, if you want to gain information about the world you better ask one of the old elves or study the chronicles, that is more exciting than I could present it.");
    npc.base.autonpcfunctions.AddAdditionalText("Well. I am afraid I do not have anything to tell you.");
    npc.base.autonpcfunctions.AddTraderTrigger("erzähl was","Nun, es gibt nicht viel, das ich erzählen könnte, der Elsbaumwald ist ein eher ruhiger Ort.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("erzähl etwas");
    npc.base.autonpcfunctions.AddAdditionalText("Ich bin kein Geschichtenerzähler, wenn ihr mehr über die Welt erfahren wollt, schlagt in den Chroniken nach, das ist aufregender, als ich es darstellen könnte.");
    npc.base.autonpcfunctions.AddAdditionalText("Nun, ich fürchte, ich habe nichts zu erzählen.");
    -- Small talk: The talk here should focus on possible questions. Feel free to add more!
    npc.base.autonpcfunctions.AddTraderTrigger("forester","I am a forester, if you want you can assist me and fulfill a task.");
    npc.base.autonpcfunctions.AddAdditionalText("As a forester, I care for the forest, yes.");
    npc.base.autonpcfunctions.AddAdditionalText("Being a forester is exhausting but also you get to be in touch with the trees a lot.");
    npc.base.autonpcfunctions.AddTraderTrigger("Förster","Ich bin ein Förster und wenn ihr helfen wollt, gebe ich euch einen Auftrag.");
    npc.base.autonpcfunctions.AddAdditionalText("Als Förster kümmere ich mich um die Bäume, richtig.");
    npc.base.autonpcfunctions.AddAdditionalText("Förster zu sein strengt an aber man ist auch viel an der frischen Luft.");
    npc.base.autonpcfunctions.AddTraderTrigger("Nana","Nana ist eine liebliche und nette Person. Sie lebt im Eibenthal, wohin ich früher oft gereist bin - bevor die Borkenkäfer kamen.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Winterbutter");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("Nana","Nana is a cute and kind person, living in Yewdale. I used to travel there once in a while - before the bark beetles came.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Winterbutter");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("bark beetle","Bark beetles are the trees' foes. And I am the trees' friend. So they are my foes!");
    npc.base.autonpcfunctions.AddTraderTrigger("Borkenkäfer","Der Borkenkäfer ist der Feind der Bäume und ich bin ein Freund der Bäume. Also ist er mein Feind!");
    npc.base.autonpcfunctions.AddTraderTrigger("lice","npc.base.autonpcfunctions.Scale lice want to exterminate the forest. But what if they succeed - won't they exterminate themselves?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("louse");
    npc.base.autonpcfunctions.AddAdditionalTrigger("scale bug");
    npc.base.autonpcfunctions.AddAdditionalTrigger("scale insect");
    npc.base.autonpcfunctions.AddTraderTrigger("Schildlaus","Die Schildläuse wollen den Wald vernichten. Doch, was wenn sie Erfolg haben? Rotten sie sich nicht so selbst aus?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Schildläuse");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Läuse");
    npc.base.autonpcfunctions.AddTraderTrigger("Elstree","Yes, the Elstree forest is like a child and a mother to me. I care for it like for a child and it grants me a sense of well-being like a mother.");
    npc.base.autonpcfunctions.AddTraderTrigger("Elsbaum","Ja, der Elsbaumwald ist wie ein Kind und eine Mutter für mich. Ich kümmere mich um ihn wie um ein Kind und er gibt mir die Geborgenheit wie eine Mutter.");
    npc.base.autonpcfunctions.AddTraderTrigger("Raban","Raban, ja, von diesem Namen habe ich gehört. Er ist ein Einsiedler, der tief im Wald lebt. Fragt mich aber nicht, wo.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("Raban","Raban, yes, I heard that name. He's a hermit, living somewhere deep in the forest, but do not ask me where.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Eugene","Burton. Eugene Burton. If I ever catch this dreaded poacher, I will treat him just like he uses to treat the peaceful animals of Elstree forest.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Burton");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Eugene","Burton. Eugene Burton. Wenn ich diesen verdammten Wilderer je erwische, werde ich genau das mit ihm machen, was er mit den friedlichen Tieren des Elsbaumwaldes zu tun pflegt.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Burton");
    -- Factions
    npc.base.autonpcfunctions.AddTraderTrigger("Runewick","Nur die Leute aus Runewick ehren den Wald wie ein Kleinod. Sei es wegen ihrer Weisheit oder von ganzem Herzen, wer weiß das schon.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("Runewick","Only the people of Runewick honour the forest like a treasure. Due to wisdom or their hearts, I do not know.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Galmair","Die Leute aus Galmair scheren sich nur um ihren Profit. Daher frage ich mich, warum sie sich keine langfristigen Gedanken machen.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("Galmair","The people of Galmair care for their profit, only. So, I wonder why they don't think about tomorrow's profit, too.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Cadomyr","Sand und Stein, Cadomyr ist ein unwirtlicher Ort. Nur die Palmen halten es dort aus.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("Cadomyr","Sand and stone, Cadomyr is an inhospitable place. Only palmtrees can stand this region.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    -- Tool hints
    npc.base.autonpcfunctions.AddTraderTrigger("Hatchet","If you want a hatchet I could give one to you. But you would have to do a certain task for me in return.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",0);
    npc.base.autonpcfunctions.AddTraderTrigger("Beil","Wenn ihr ein Beil wollt, könnte ich euch eines geben, allerdings wäre dies mit einem gewissen Auftrag verbunden.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",0);
    npc.base.autonpcfunctions.AddTraderTrigger("Hatchet","If you want to buy a hatchet, you should ask a merchant in Runewick.");
    npc.base.autonpcfunctions.AddTraderTrigger("Beil","Wenn ihr ein Beil kaufen wollt, solltet ihr einen Händler in Runewick aufsuchen.");
    -- 1st quest: Take a tool and gather 10 raw materials for 50cp.
    npc.base.autonpcfunctions.AddTraderTrigger("quest","Ah, fine, so you want to help me, caring for the trees. Bark beetles are a real plague these days. Take this hatchet and search for ill naldor trees. Bring me ten logs, will you?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",0);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("item",74,1,399,0);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddConsequence("inform","[New quest] Elstree Forest I");
    npc.base.autonpcfunctions.AddTraderTrigger("quest","Ah, fein, ihr möchtet mir dabei helfen, die Bäume zu pflegen. Borkenkäfer sind zu einer echten Plage geworden. Nehmt dieses Beil und sucht nach kranken Naldorbäumen. Bringt mir zehn Scheite, ja?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",0);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddConsequence("item",74,1,399,0);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Elsbaumwald I");
    npc.base.autonpcfunctions.AddTraderTrigger("task","Ah, fine, so you want to help me, caring for the trees. Bark beetles are a real plague these days. Take this hatchet and search for ill naldor trees. Bring me ten logs, will you?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npc.base.autonpcfunctions.AddCondition("qpg","=",0);
    npc.base.autonpcfunctions.AddConsequence("item",74,1,399,0);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddConsequence("inform","[New quest] Elstree Forest I");
    npc.base.autonpcfunctions.AddTraderTrigger("Aufgabe","Ah, fein, ihr möchtet mir dabei helfen, die Bäume zu pflegen. Borkenkäfer sind zu einer echten Plage geworden. Nehmt dieses Beil und sucht nach kranken Naldorbäumen. Bringt mir zehn Scheite, ja?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npc.base.autonpcfunctions.AddCondition("qpg","=",0);
    npc.base.autonpcfunctions.AddConsequence("item",74,1,399,0);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Elsbaumwald I");
    npc.base.autonpcfunctions.AddTraderTrigger("quest","Please take care of ill naldor trees, else bark beetles might make other trees suffer, too.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("quest","Bitte kümmert euch um die kranken Naldorbäume, andernfalls könnte der Borkenkäfer auch andere Bäume befallen.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("task","Please take care of ill naldor trees, else bark beetles might make other trees suffer, too.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddTraderTrigger("Aufgabe","Bitte kümmert euch um die kranken Naldorbäume, andernfalls könnte der Borkenkäfer auch andere Bäume befallen.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Oh, vielen Dank. Hier, eine kleine Entschädigung für eure Mühen.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddCondition("item",544,"all",">",9);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddConsequence("deleteitem",2560,10);
    npc.base.autonpcfunctions.AddConsequence("inform","[Quest gelöst] Du erhältst 50 Kupferstücke und deine Holzfällerfertigkeit steigt.");
    npc.base.autonpcfunctions.AddConsequence("money","+",50);
    npc.base.autonpcfunctions.AddConsequence("skill","crafting","lumberjacking","+",1);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Oh, thank you. Here, take this reward for your efforts.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddCondition("item",544,"all",">",9);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("deleteitem",2560,10);
    npc.base.autonpcfunctions.AddConsequence("inform","[Quest solved] You are awarded 50 copper coins and your lumberjacking skill increases.");
    npc.base.autonpcfunctions.AddConsequence("money","+",50);
    npc.base.autonpcfunctions.AddConsequence("skill","crafting","lumberjacking","+",1);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Nun, ihr findet sicher noch weitere kranke Naldorbäume.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddCondition("item",544,"all","<",10);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Well, I am sure you'll find more ill naldor trees.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddCondition("item",544,"all","<",10);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    -- 2nd quest: Gather 20 different raw materials for 100cp. Hint on where to get new tools.
    npc.base.autonpcfunctions.AddTraderTrigger("quest","Oje, Schildläuse haben einige der Kirschbäume befallen. Wir haben kein Wahl, schlagt die kranken Bäume und bring mir zwanzig Scheite.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",3);
    npc.base.autonpcfunctions.AddConsequence("inform","[New quest] Elstree Forest II");
    npc.base.autonpcfunctions.AddTraderTrigger("quest","Oh dear, scale lice infested some of the cherry trees. We have no other choice, cut the ill trees and bring me twenty logs, please.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",3);
    npc.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Elsbaumwald II");
    npc.base.autonpcfunctions.AddTraderTrigger("task","Oh dear, scale lice infested some of the cherry trees. We have no other choice, cut the ill trees and bring me twenty logs, please.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",3);
    npc.base.autonpcfunctions.AddConsequence("inform","[New quest] Elstree Forest II");
    npc.base.autonpcfunctions.AddTraderTrigger("Aufgabe","Oje, Schildläuse haben einige der Kirschbäume befallen. Wir haben kein Wahl, schlagt die kranken Bäume und bring mir zwanzig Scheite.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",3);
    npc.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Elsbaumwald II");
    npc.base.autonpcfunctions.AddTraderTrigger("quest","Oje, Schildläuse haben einige der Kirschbäume befallen. Wir haben kein Wahl, schlagt die kranken Bäume und bring mir zwanzig Scheite.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",3);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("quest","Oh dear, scale lice infested some of the cherry trees. We have no other choice, cut the ill trees and bring me twenty logs, please.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",3);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("task","Oh dear, scale lice infested some of the cherry trees. We have no other choice, cut the ill trees and bring me twenty logs, please.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npc.base.autonpcfunctions.AddCondition("qpg","=",3);
    npc.base.autonpcfunctions.AddTraderTrigger("Aufgabe","Oje, Schildläuse haben einige der Kirschbäume befallen. Wir haben kein Wahl, schlagt die kranken Bäume und bring mir zwanzig Scheite.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npc.base.autonpcfunctions.AddCondition("qpg","=",3);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Ha, ihr habt es den Schildläusen gezeigt, danke euch. Nehmt dies als Belohnung.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",3);
    npc.base.autonpcfunctions.AddCondition("item",543,"all",">",19);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddConsequence("deleteitem",543,20);
    npc.base.autonpcfunctions.AddConsequence("inform","[Quest gelöst] Du erhältst 100 Kupferstücke und deine Holzfällerfertigkeit steigt.");
    npc.base.autonpcfunctions.AddConsequence("money","+",100);
    npc.base.autonpcfunctions.AddConsequence("skill","crafting","lumberjacking","+",1);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",4);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Ha, now the archers can train again for any possible emergency, thank you. Take this as a reward.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",3);
    npc.base.autonpcfunctions.AddCondition("item",543,"all",">",19);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("deleteitem",543,20);
    npc.base.autonpcfunctions.AddConsequence("inform","[Quest solved] You are awarded 100 copper coins and your lumberjacking skill increases.");
    npc.base.autonpcfunctions.AddConsequence("money","+",100);
    npc.base.autonpcfunctions.AddConsequence("skill","crafting","lumberjacking","+",1);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",4);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Das ist noch nicht genügend Holz, schaut doch bitte zu, dass ihr noch mehr besorgt.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",3);
    npc.base.autonpcfunctions.AddCondition("item",543,"all","<",20);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Those are not enough logs yet, try to get some more.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",3);
    npc.base.autonpcfunctions.AddCondition("item",543,"all","<",20);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    -- 3rd quest: Gather 5 rare raw materials for 100cp. Hint on where to get new tools.
    npc.base.autonpcfunctions.AddTraderTrigger("quest","We always used to pin some twigs to the ceiling because of the delicious scent they spread. But now the branches we have have lost their scent. Do you think you can get us five new ones? The most intensive scented twigs can be found in the northern woods");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",4);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",5);
    npc.base.autonpcfunctions.AddConsequence("inform","[New quest] Elstree Forest III");
    npc.base.autonpcfunctions.AddTraderTrigger("quest","Wir brachten immer einige Zweige an der Decke an, des köstlichen Duftes wegen, den sie verbreiten. Doch nun haben die jetzigen Zweige ihren Duft verloren. Meint ihr, ihr könntet uns fünf neue besorgen? Die aus dem Nordwald riechen am intensivsten.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",4);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",5);
    npc.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Elsbaumwald III");
    npc.base.autonpcfunctions.AddTraderTrigger("task","We always used to pin some twigs to the ceiling because of the delicious scent they spread. But now the branches we have have lost their scent. Do you think you can get us five new ones? The most intensive scented twigs can be found in the northern woods.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npc.base.autonpcfunctions.AddCondition("qpg","=",4);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",5);
    npc.base.autonpcfunctions.AddConsequence("inform","[New quest] Elstree Forest III");
    npc.base.autonpcfunctions.AddTraderTrigger("Aufgabe","Wir brachten immer einige Zweige an der Decke an, des köstlichen Duftes wegen, den sie verbreiten. Doch nun haben die jetzigen Zweige ihren Duft verloren. Meint ihr, ihr könntet uns fünf neue besorgen? Die aus dem Nordwald riechen am intensivsten.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npc.base.autonpcfunctions.AddCondition("qpg","=",4);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",5);
    npc.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Elsbaumwald III");
    npc.base.autonpcfunctions.AddTraderTrigger("quest","We always used to pin some twigs to the ceiling because of the delicious scent they spread. But now the branches we have have lost their scent. Do you think you can get us five new ones?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",5);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("quest","Wir brachten immer einige Zweige an der Decke an, des köstlichen Duftes wegen, den sie verbreiten. Doch nun haben die jetzigen Zweige ihren Duft verloren. Meint ihr, ihr könntet uns fünf neue besorgen?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",5);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("task","We always used to pin some twigs to the ceiling because of the delicious scent they spread. But now the branches we have have lost their scent. Do you think you can get us five new ones?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npc.base.autonpcfunctions.AddCondition("qpg","=",5);
    npc.base.autonpcfunctions.AddTraderTrigger("Aufgabe","Wir brachten immer einige Zweige an der Decke an, des köstlichen Duftes wegen, den sie verbreiten. Doch nun haben die jetzigen Zweige ihren Duft verloren. Meint ihr, ihr könntet uns fünf neue besorgen?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npc.base.autonpcfunctions.AddCondition("qpg","=",5);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Mmh... riecht ihr das? Der beruhigende Duft des Waldes, vielen vielen Dank. Meine Frau und ich können nun endlich wieder entspannt einschlafen.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",5);
    npc.base.autonpcfunctions.AddCondition("item",2786,"all",">",4);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddConsequence("deleteitem",2786,5);
    npc.base.autonpcfunctions.AddConsequence("inform","[Quest gelöst] Du erhältst 100 Kupferstücke und deine Holzfällerfertigkeit steigt.");
    npc.base.autonpcfunctions.AddConsequence("money","+",100);
    npc.base.autonpcfunctions.AddConsequence("skill","crafting","lumberjacking","+",1);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",6);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Mmh... do you smell that? The calming scent of the woods, thank you very much. Finally my wife and I can go to sleep completely relaxed again.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",5);
    npc.base.autonpcfunctions.AddCondition("item",2786,"all",">",4);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("deleteitem",2786,5);
    npc.base.autonpcfunctions.AddConsequence("inform","[Quest solved] You are awarded 100 copper coins and your lumberjacking skill increases.");
    npc.base.autonpcfunctions.AddConsequence("money","+",100);
    npc.base.autonpcfunctions.AddConsequence("skill","crafting","lumberjacking","+",1);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",6);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Nun, wir wollten uns eigentlich einen Vorrat anlegen, damit wir euch nicht so schnell wieder belästigen müssen. Bringt doch bitte gleich ein paar mehr Zweige.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",5);
    npc.base.autonpcfunctions.AddCondition("item",2786,"all","<",5);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Well, actually we wanted to have a bigger storage so that we do not have to bother you again. Please, gather some more twigs.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",5);
    npc.base.autonpcfunctions.AddCondition("item",2786,"all","<",5);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    -- 4th quest: Gather 10 raw materials from a totally different location for 200cp. Link to other quest. Hint how to get there.
    npc.base.autonpcfunctions.AddTraderTrigger("quest","In addition to my tasks as forester, I care for the cows. Can you bring me ten bundles of grain to feed them? Nana Winterbutter in Yewdale might help you.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",6);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",7);
    npc.base.autonpcfunctions.AddConsequence("inform","[New quest] Elstree Forest IV");
    npc.base.autonpcfunctions.AddTraderTrigger("quest","Zusätzlich zu meinen Aufgaben als Förster kümmere ich mich um die Kühe. Könnt ihr mir zehn Bündel Getreide bringen, um sie zu füttern? Nana Winterbutter in Eibenthal könnte dir dabei helfen.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",6);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",7);
    npc.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Elsbaumwald IV");
    npc.base.autonpcfunctions.AddTraderTrigger("task","In addition to my tasks as forester, I care for the cows. Can you bring me ten bundles of grain to feed them? Nana Winterbutter in Yewdale might help you.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npc.base.autonpcfunctions.AddCondition("qpg","=",6);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",7);
    npc.base.autonpcfunctions.AddConsequence("inform","[New quest] Elstree Forest IV");
    npc.base.autonpcfunctions.AddTraderTrigger("Aufgabe","Zusätzlich zu meinen Aufgaben als Förster kümmere ich mich um die Kühe. Könnt ihr mir zehn Bündel Getreide bringen, um sie zu füttern? Nana Winterbutter im Eibenthal könnte dir dabei helfen.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npc.base.autonpcfunctions.AddCondition("qpg","=",6);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",7);
    npc.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Elsbaumwald IV");
    npc.base.autonpcfunctions.AddTraderTrigger("quest","Please, the cows have a hard time, finding fresh grass. Will you bring me some straw?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",7);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("quest","Bitte, die Kühe haben es schwer, saftiges Gras zu finden. Werdet ihr mir Stroh bringen?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",7);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("task","Please, the cows have a hard time, finding fresh grass. Will you bring me some straw?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npc.base.autonpcfunctions.AddCondition("qpg","=",7);
    npc.base.autonpcfunctions.AddTraderTrigger("Aufgabe","Bitte, die Kühe haben es schwer, saftiges Gras zu finden. Werdet ihr mir Stroh bringen?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npc.base.autonpcfunctions.AddCondition("qpg","=",7);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Thank you so much. Now I can feed the cows and enjoy their gratefullness.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",7);
    npc.base.autonpcfunctions.AddCondition("item",249,"all",">",9);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddConsequence("deleteitem",249,10);
    npc.base.autonpcfunctions.AddConsequence("inform","[Quest solved] You are awarded 200 copper coins and your lumberjacking skill increases.");
    npc.base.autonpcfunctions.AddConsequence("money","+",200);
    npc.base.autonpcfunctions.AddConsequence("skill","crafting","lumberjacking","+",1);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",8);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Vielen, vielen Dank. Nun kann ich die Kühe füttern und mich ihrer Dankbarkeit erfreuen.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",7);
    npc.base.autonpcfunctions.AddCondition("item",249,"all",">",9);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("deleteitem",249,10);
    npc.base.autonpcfunctions.AddConsequence("inform","[Quest gelöst] Du erhältst 200 Kupferstücke und deine Holzfällerfertigkeit steigt.");
    npc.base.autonpcfunctions.AddConsequence("money","+",200);
    npc.base.autonpcfunctions.AddConsequence("skill","crafting","lumberjacking","+",1);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",8);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Could you please bring me more straw? Some of the cows are already pretty thin, aren't they?");
    npc.base.autonpcfunctions.AddCondition("qpg","=",7);
    npc.base.autonpcfunctions.AddCondition("item",249,"all","<",10);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Könntet ihr mir bitte mehr Stroh bringen? Einige der Kühe sehen schon ganz schön abgemagert aus, nicht?");
    npc.base.autonpcfunctions.AddCondition("qpg","=",7);
    npc.base.autonpcfunctions.AddCondition("item",249,"all","<",10);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    -- Final dialogue: No more quests, just nice hints
    npc.base.autonpcfunctions.AddTraderTrigger("quest","I am grateful for all your help. If you visit Nana Winterbutter in Yewdale, can you greet her from me?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",8);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("quest","Ich bin dankbar für all eure Hilfe. Wenn ihr Nana Winterbutter in Eibenthal besucht, mögt ihr sie von mir grüßen?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",8);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("task","I am grateful for all your help. If you visit Nana Winterbutter in Yewdale, can you greet her from me?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npc.base.autonpcfunctions.AddCondition("qpg","=",8);
    npc.base.autonpcfunctions.AddTraderTrigger("Aufgabe","Ich bin dankbar für all eure Hilfe. Wenn ihr Nana Winterbutter in Eibenthal besucht, mögt ihr sie von mir grüßen?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npc.base.autonpcfunctions.AddCondition("qpg","=",8);
    -- Last catch: Think about keyphrases the player might say and that are not caught until here
    npc.base.autonpcfunctions.AddTraderTrigger("Yes","Really?");
    npc.base.autonpcfunctions.AddAdditionalText("#me looks confused");
    npc.base.autonpcfunctions.AddAdditionalText("Can your repeat that?");
    npc.base.autonpcfunctions.AddTraderTrigger("Ja","Wirklich?");
    npc.base.autonpcfunctions.AddAdditionalText("#me schaut etwas verwirrt");
    npc.base.autonpcfunctions.AddAdditionalText("Könnt ihr das wiederholen?");
    npc.base.autonpcfunctions.AddTraderTrigger("No","No?");
    npc.base.autonpcfunctions.AddAdditionalText("Why not?");
    npc.base.autonpcfunctions.AddAdditionalText("#me shakes his head slowly");
    npc.base.autonpcfunctions.AddAdditionalText("I don't understand...");
    npc.base.autonpcfunctions.AddTraderTrigger("Nein","Nein?");
    npc.base.autonpcfunctions.AddAdditionalText("Weshalb nicht?");
    npc.base.autonpcfunctions.AddAdditionalText("#me schüttelt seinen Kopf bedächtig");
    npc.base.autonpcfunctions.AddAdditionalText("Ich verstehe nicht ganz...");
    -- Cycletext: Please add at least(!) five cycletext messages. The more, the better. You can use emotes (#me is green), too.
    npc.base.autonpcfunctions.AddCycleText("Blöde Borkenkäfer!","Damn bark beetles!");
    npc.base.autonpcfunctions.AddCycleText("Läuse! Überall Läuse!","Lice! Everywhere lice!");
    npc.base.autonpcfunctions.AddCycleText("#me harkt einen Haufen Laub zusammen.","#me rakes a pile of leaves.");
    npc.base.autonpcfunctions.AddCycleText("#me fährt die Klinge eines Beils mit einem Wetzstein entlang.","#me sharpens the blade of a hatchet with a whetstone");
    npc.base.autonpcfunctions.AddCycleText("#me sieht sich um und murmelt vor sich hin: 'Meine Freunde...'","#me looks around and murmurs: 'My friends...'");
    npc.base.autonpcfunctions.AddCycleText("Wenn ich jemanden dabei erwische, wie er ohne meine Billigung Holz schlägt, dann wird er was erleben!","When I catch somebody cutting wood without my permission, he's got something coming!");
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
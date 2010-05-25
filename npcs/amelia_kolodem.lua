-- INSERT INTO npc VALUES (nextval('npc_seq'),0,-102,-110,0,4,false,'Amelia Kolodem','npc_amelia_kolodem.lua',1);
-- newbie island NPC
-- teaching how to cut down a tree and start a campfire
-- telling about tree fall directions, wildfires and recovering from cold

require("npcs.base.autonpcfunctions")
-- require("npcs.base.autonpcfunctions")

require("base.common")

function useNPC(user,counter,param)
    thisNPC:increaseSkill(1,"common language",100);
    thisNPC:talkLanguage(CCharacter.say, CPlayer.german, "Finger weg!");
    thisNPC:talkLanguage(CCharacter.say, CPlayer.english, "Dont you touch me!");
end

function initializeNpc()
    if TraderFirst then
        return true;
    end

    InitTalkLists();
    QuestID=2;

     -- ********* START DYNAMIC PART ********

    -- small talk
    AddTraderTrigger(".+","Come again when Nargon Hammerfaust sends you to me. He is one of the dwarves at the house across the river, the road back leads to them.");
    AddCondition("lang","english");
    AddCondition("qpg","<",40);
    AddTraderTrigger(".+","Kommt wieder, wenn Nargon Hammerfaust Euch zu mich schickt. Er ist einer der Zwerge bei dem Haus weiter zurück an dieser Straße, über den Fluss.");
    AddCondition("lang","german");
    AddCondition("qpg","<",40);
    AddTraderTrigger("Hello","Hello, my name is "..thisNPC.name..". I am a lumberjack and I will gladly help you if you wish.");
    AddAdditionalTrigger("Greetings");
    AddCondition("state","=",0);
    AddCondition("qpg","=",40);
    AddTraderTrigger("Hallo","Hallo, mein Name ist "..thisNPC.name..". Ich bin eine Holzfällerin und werde Euch gerne helfen, wenn Ihr es wünscht.");
    AddAdditionalTrigger("Gr[üu][ßs]");
    AddAdditionalTrigger("grue[sß]");
    AddCondition("state","=",0);
    AddCondition("qpg","=",40);
    AddTraderTrigger("Hello","Hello %Charname! If you want to continue, just ask for 'help'.");
    AddAdditionalTrigger("Greetings");
    AddCondition("state","=",0);
    AddCondition("qpg","=",41);
    AddTraderTrigger("Hallo","Hallo %Charname! Wenn Ihr weitermachen wollt, fragt einfach nach 'Hilfe'.");
    AddAdditionalTrigger("Gr[üu][ßs]");
    AddAdditionalTrigger("grue[sß]");
    AddCondition("state","=",0);
    AddCondition("qpg","=",41);
    AddTraderTrigger("Hello","Hello %Charname!. I can explain lumberjacking again or I can repeat the lesson on how to have a closer look at items, if you want. Or you can just go along this road through the desert, into the cave, up the ladder and right into Findecano Melwasul's castle. He can tell you more.");
    AddAdditionalTrigger("Greetings");
    AddCondition("state","=",0);
    AddCondition("qpg",">",41);
    AddTraderTrigger("Hallo","Hallo %CHARNAME! Ich kann Euch gerne nochmal beim Holzfällen helfen oder ich erkläre nochmal, wie man Dinge genauer anschaut, wenn Ihr es wünscht. Oder geht diese Straße weiter durch die Wüste, in die Höhle, die Leiter hinauf und direkt ins Schloss von Findecano Melwasul. Er kann Euch mehr sagen.");
    AddAdditionalTrigger("Gr[üu][ßs]");
    AddAdditionalTrigger("grue[sß]");
    AddCondition("state","=",0);
    AddCondition("qpg",">",41);
    AddTraderTrigger("Hello","Hello again. We can continue if you want.");
    AddAdditionalTrigger("Greetings");
    AddTraderTrigger("Hallo","Nochmals hallo. Wir können fortfahren, wenn Ihr es möchtet.");
    AddAdditionalTrigger("Gr[üu][ßs]");
    AddAdditionalTrigger("grue[sß]");
    AddTraderTrigger("Who you","I am "..thisNPC.name..", a lumberjack. I help all the people who are willing to learn.");
    AddAdditionalTrigger("What you");
    AddTraderTrigger("Wer du","Ich bin "..thisNPC.name..", eine Holzfällerin. Ich helfe allen Leuten, die bereit sind zu lernen.");
    AddAdditionalTrigger("Wer Ihr");
    AddAdditionalTrigger("Was du");
    AddAdditionalTrigger("Was Ihr");
    AddTraderTrigger("how are you","Oh, I am fine. I hope you too.");
    AddTraderTrigger("wie geht dir","Oh, mir geht es gut. Ich hoffe Euch auch.");
    AddAdditionalTrigger("wie geht euch");
    AddAdditionalTrigger("wohlbefinden");
    AddTraderTrigger("bye","Be well.");
    AddAdditionalTrigger("farewell");
    AddAdditionalTrigger("be well");
    AddAdditionalText("Farewell.");
    AddAdditionalText("Good bye.");
    AddTraderTrigger("auf bald","Auf bald.");
    AddAdditionalTrigger("bis bald");
    AddAdditionalTrigger("leb.+wohl");
    AddAdditionalTrigger("tsch[üu][ßs]");
    AddAdditionalTrigger("mach.+gut");
    AddAdditionalText("Bis bald.");
    AddAdditionalText("Lebt wohl.");
    -- start lesson the first time
    AddTraderTrigger("lumberjack","I can teach you some things, if you want. First you need to take a hatchet into your hands. Here you can have this one. Are you ready?");
    AddAdditionalTrigger("cut.+down");
    AddAdditionalTrigger("help");
    AddAdditionalTrigger("learn");
    AddAdditionalTrigger("teach");
    AddAdditionalTrigger("hatchet");
    AddCondition("state","=",0);
    AddCondition("item",74,"all","=",0);
    AddCondition("qpg","=",40);
    AddConsequence("state","=",1);
    AddConsequence("item",74,1,333,0);
    AddTraderTrigger("holzf[äa]ll","Ich kann Euch ein paar Dinge lehren. Als erstes müsst Ihr ein Beil in die Hand nehmen. Hier, ich gebe Euch eines. Seid Ihr bereit?");
    AddAdditionalTrigger("f[äa]llen");
    AddAdditionalTrigger("hilf");
    AddAdditionalTrigger("helf");
    AddAdditionalTrigger("lern");
    AddAdditionalTrigger("lehr");
    AddAdditionalTrigger("beil");
    AddCondition("state","=",0);
    AddCondition("item",74,"all","=",0);
    AddCondition("qpg","=",40);
    AddConsequence("state","=",1);
    AddConsequence("item",74,1,333,0);
    AddTraderTrigger("lumberjack","I can teach you some things, if you want. First you need to take a hatchet into your hands. As I see you already have one with you. Are you ready?");
    AddAdditionalTrigger("cut.+down");
    AddAdditionalTrigger("help");
    AddAdditionalTrigger("learn");
    AddAdditionalTrigger("teach");
    AddCondition("item",74,"all",">",0);
    AddCondition("state","=",0);
    AddCondition("qpg","=",40);
    AddConsequence("state","=",1);
    AddTraderTrigger("holzf[äa]ll","Ich kann Euch ein paar Dinge lehren. Als erstes müsst Ihr ein Beil in die Hand nehmen. Wie ich sehe habt Ihr eines dabei. Seid Ihr bereit?");
    AddAdditionalTrigger("holzfaell");
    AddAdditionalTrigger("f[äa]llen");
    AddAdditionalTrigger("faell");
    AddAdditionalTrigger("hilf");
    AddAdditionalTrigger("helf");
    AddAdditionalTrigger("lern");
    AddAdditionalTrigger("lehr");
    AddCondition("item",74,"all",">",0);
    AddCondition("state","=",0);
    AddCondition("qpg","=",40);
    AddConsequence("state","=",1);
    AddTraderTrigger("item","Well then, you can look at an item simply by clicking on the particular field with your left mouse button. But make sure you click on the field upon which the item lies, not on the item itself. Now look at the signpost over there and tell me what it reads.");
    AddAdditionalTrigger("look");
    AddAdditionalTrigger("close");
    AddAdditionalTrigger("help");
    AddAdditionalTrigger("learn");
    AddAdditionalTrigger("teach");
    AddCondition("state","=",0);
    AddCondition("qpg","=",41);
    AddConsequence("state","=",5);
    AddTraderTrigger("ding","Nun denn, Ihr könnt Dinge anschauen, indem Ihr einfach mit der linken Maustaste auf das betreffende Feld klickt. Aber achtet darauf, dass Ihr auf das Feld klickt, wo das Ding liegt, nicht auf das Ding an sich. Jetzt schaut den Wegweiser dort drüben an und sagt mir, was darauf steht.");
    AddAdditionalTrigger("schau");
    AddAdditionalTrigger("genau");
    AddAdditionalTrigger("hilf");
    AddAdditionalTrigger("helf");
    AddAdditionalTrigger("lern");
    AddAdditionalTrigger("lehr");
    AddCondition("state","=",0);
    AddCondition("qpg","=",41);
    AddConsequence("state","=",5);
    -- repeat lessons
    AddTraderTrigger("lumberjack","I can teach you some things. First you need to take a hatchet into your hands. Here you can have one. Are you ready?");
    AddAdditionalTrigger("cut.+down");
    AddAdditionalTrigger("hatchet");
    AddCondition("state","=",0);
    AddCondition("item",74,"all","=",0);
    AddCondition("qpg",">",41);
    AddConsequence("state","=",1);
    AddConsequence("item",74,1,333,0);
    AddTraderTrigger("holzf[äa]ll","Ich kann Euch ein paar Dinge lehren. Als erstes müsst Ihr ein Beil in die Hand nehmen. Hier, ich gebe Euch eines. Seid Ihr bereit?");
    AddAdditionalTrigger("f[äa]llen");
    AddAdditionalTrigger("hilf");
    AddAdditionalTrigger("helf");
    AddAdditionalTrigger("lern");
    AddAdditionalTrigger("lehr");
    AddAdditionalTrigger("beil");
    AddCondition("state","=",0);
    AddCondition("item",74,"all","=",0);
    AddCondition("qpg",">",41);
    AddConsequence("state","=",1);
    AddConsequence("item",74,1,333,0);
    AddTraderTrigger("lumberjack","I can teach you some things. First you need to take a hatchet into your hands.I see you already have one with you. Are you ready?");
    AddAdditionalTrigger("cut.+down");
    AddCondition("item",74,"all",">",0);
    AddCondition("state","=",0);
    AddCondition("qpg",">",41);
    AddConsequence("state","=",1);
    AddTraderTrigger("holzf[äa]ll","Ich kann Euch ein paar Dinge lehren. Als erstes müsst Ihr ein Beil in die Hand nehmen. Wie ich sehe habt Ihr eines dabei. Seid Ihr bereit?");
    AddAdditionalTrigger("holzfaell");
    AddAdditionalTrigger("f[äa]llen");
    AddAdditionalTrigger("faell");
    AddCondition("item",74,"all",">",0);
    AddCondition("state","=",0);
    AddCondition("qpg",">",41);
    AddConsequence("state","=",1);
    AddTraderTrigger("item","Well then, you can look at an item simply by clicking on the particular field with your left mouse button. But make sure you click on the field upon which the item lies, not on the item itself. Now look at the signpost over there and tell me what it reads.");
    AddAdditionalTrigger("look");
    AddAdditionalTrigger("close");
    AddCondition("state","=",0);
    AddCondition("qpg",">",41);
    AddConsequence("state","=",5);
    AddTraderTrigger("ding","Nun denn, Ihr könnt Dinge anschauen, indem Ihr einfach mit der linken Maustaste auf das betreffende Feld klickt. Aber achtet darauf, dass Ihr auf das Feld klickt, wo das Ding liegt, nicht auf das Ding an sich. Jetzt schaut den Wegweiser dort drüben an und sagt mir, was darauf steht.");
    AddAdditionalTrigger("schau");
    AddAdditionalTrigger("genau");
    AddCondition("state","=",0);
    AddCondition("qpg",">",41);
    AddConsequence("state","=",5);
    AddTraderTrigger("help","You can repeat the lessons about 'lumberjacking' and 'looking at items'. Just tell me which you want. But if you don't know what to do next, then ask 'Where to go now?'.");
    AddAdditionalTrigger("learn");
    AddAdditionalTrigger("teach");
    AddAdditionalTrigger("lessons");
    AddAdditionalTrigger("repeat");
    AddCondition("state","=",0);
    AddCondition("qpg",">",41);
    AddTraderTrigger("hilf","Ihr könnt die Lektionen über 'holzfällen' und 'Dinge anschauen' wieder holen. Sagt mir einfach, welche Ihr wollt. Aber wenn Ihr nicht wisst, was als nächstes zu tun ist, fragt 'Wohin soll ich jetzt gehen?'.");
    AddAdditionalTrigger("helf");
    AddAdditionalTrigger("lern");
    AddAdditionalTrigger("lehr");
    AddAdditionalTrigger("lektion");
    AddAdditionalTrigger("wiederholen");
    AddCondition("state","=",0);
    AddCondition("qpg",">",41);
    -- STATE 1
    AddTraderTrigger("hatchet","What? Where is the hatchet I gave you? Well, doesn't matter. Here you can have another one.");
    AddAdditionalTrigger("help");
    AddAdditionalTrigger("tool");
    AddAdditionalTrigger("axe");
    AddCondition("item",74,"all","=",0);
    AddCondition("state",">",0);
    AddConsequence("item",74,1,333,0);
    AddTraderTrigger("beil","Was? Wo ist das Beil, das ich Euch gegeben habe? Naja, macht nichts. Hier, ich gebe Euch noch eines.");
    AddAdditionalTrigger("hilf");
    AddAdditionalTrigger("helf");
    AddAdditionalTrigger("werkzeug");
    AddAdditionalTrigger("axt");
    AddCondition("item",74,"all","=",0);
    AddCondition("state",">",0);
    AddConsequence("item",74,1,333,0);
    AddTraderTrigger("yes","Good. Now stand in front of an apple tree and 'use' the hatchet once. Cut down trees only when you are facing them, otherwise they could fall on you! When you have cut it down, redo this procedure on the whole length of the log until you get some deciduous wood. Talk to me again, if you have the wood.");
    AddCondition("state","=",1);
    AddCondition("item",74,"body",">",0);
    AddConsequence("state","=",2);
    AddTraderTrigger("ja","Gut. Jetzt stellt Euch vor einen Apfelbaum und 'benutzt' das Beil einmal. Fällt nur Bäume, wenn Ihr ihnen zugewandt seid, ansonsten könnten sie auf Euch fallen! Wenn Ihr ihn gefällt habt, wiederholt diesen Vorgang an der gesamten Länge des Baumstammes, bis ihr etwas Laubholz erhaltet. Sprecht mich wieder an, wenn Ihr das Holz habt.");
    AddCondition("state","=",1);
    AddCondition("item",74,"body",">",0);
    AddConsequence("state","=",2);
    AddTraderTrigger("no","Well, come back if you really want to learn the basics of lumberjacking. But you have to do it anyway if you want to go on.");
    AddCondition("state","=",1);
    AddConsequence("state","=",0);
    AddTraderTrigger("nein","Naja, kommt wieder, wenn Ihr die Grundlagen des Holzfällens wirklich lernen wollt. Aber Ihr müsst es sowieso machen, falls Ihr weitermachen wollt.");
    AddCondition("state","=",1);
    AddConsequence("state","=",0);
    -- STATE 5
    AddTraderTrigger("double palm","Exactly! It is the sand scape 'Double Palm'. You can look at everything and everyone in the same way. That was all I can teach you. Now go along this road through the desert, into the cave, up the ladder and right into Findecano Melwasul's castle. He can tell you more.");
    AddCondition("state","=",5);
    AddConsequence("state","=",0);
    AddConsequence("qpg","=",48);
    AddTraderTrigger("doppelpalme","Genau! Es ist die Sandlandschaft 'Doppelpalme'. Ihr könnt auf die gleiche Weise alles und jeden anschauen. Das war alles, was ich Euch beibringen kann. Nun geht diese Straße weiter durch die Wüste, in die Höhle, die Leiter hinauf und direkt ins Schloss von Findecano Melwasul. Er kann Euch mehr sagen.");
    AddCondition("state","=",5);
    AddConsequence("state","=",0);
    AddConsequence("qpg","=",48);
    -- STATE 6
    AddTraderTrigger("yes","Well then, you can look at an item simply by clicking on the particular field with your left mouse button. But make sure you click on the field upon which the item lies, not on the item itself. Now look at the signpost over there and tell me what it reads.");
    AddCondition("state","=",6);
    AddConsequence("state","=",5);
    AddTraderTrigger("ja","Nun denn, Ihr könnt Dinge anschauen, indem Ihr einfach mit der linken Maustaste auf das betreffende Feld klickt. Aber achtet darauf, dass Ihr auf das Feld klickt, wo das Teil liegt, nicht auf das Ding an sich. Jetzt schaut den Wegweiser dort drüben an und sagt mir, was darauf steht.");
    AddCondition("state","=",6);
    AddConsequence("state","=",5);
    AddTraderTrigger("no","No? Then come back when you are ready. Just ask me for 'help'.");
    AddCondition("state","=",6);
    AddConsequence("state","=",0);
    AddTraderTrigger("nein","Nein? Dann kommt wieder, wenn Ihr bereit seid. Fragt mich einfach nach 'Hilfe'.");
    AddCondition("state","=",6);
    AddConsequence("state","=",0);
    -- standard explanations
    AddTraderTrigger("wildfire","A campfire can become a wildfire. Then you need a bucket of water to extinguish it.");
    AddAdditionalTrigger("wild fire");
    AddTraderTrigger("lauffeuer","Ein Lagerfeuer kann zu einem Lauffeuer werden. Dann braucht Ihr einen Eimer mit Wasser um es zu löschen.");
    AddAdditionalTrigger("lauf feuer");
    AddTraderTrigger("bucket","Here you have an empty bucket. Go to the water, hold the bucket in your hands and use it with the water to fill it, so hold [shift], first click on the bucket then on the water field and finally release [shift]. Do the same with a full bucket and a fire to extinguish it.");
    AddCondition("item",51,"all","=",0);
    AddCondition("item",52,"all","=",0);
    AddConsequence("item",51,1,333,0);
    AddTraderTrigger("eimer","Hier habt Ihr einen leeren Eimer. Geht zum Wasser, haltet den Eimer in der Hand und benutzt ihn mit dem Wasser, um ihn zu füllen, also haltet [shift], erst auf den Eimer und dann auf das Wasserfeld klicken und schließlich [shift] loslassen. Macht dasselbe mit einem vollen Eimer und Feuer um es zu löschen.");
    AddCondition("item",51,"all","=",0);
    AddCondition("item",52,"all","=",0);
    AddConsequence("item",51,1,333,0);
    AddTraderTrigger("bucket","Go to the water, hold the bucket in your hands and use it with the water to fill it, so hold [shift], first click on the bucket then on the water field and finally release [shift]. Do the same with a full bucket and a fire to extinguish it.");
    AddAdditionalTrigger("extinguish fire");
    AddTraderTrigger("eimer","Geht zum Wasser, haltet den Eimer in der Hand und benutzt ihn mit dem Wasser, um ihn zu füllen, also haltet [shift], erst auf den Eimer und dann auf das Wasserfeld klicken und schließlich [shift] loslassen. Macht dasselbe mit einem vollen Eimer und Feuer um es zu löschen.");
    AddAdditionalTrigger("feuer l[öo]schen");
    AddTraderTrigger("cold","Well if you catch a cold, you will sneeze and cough all the time. Then just sit by a campfire until you feel better.");
    AddAdditionalTrigger("disease");
    AddAdditionalTrigger("illness");
    AddTraderTrigger("erk[äa]ltung","Nun, wenn Ihr Euch eine Erkältung eingefangen habt, werdet Ihr die ganze Zeit Niesen und husten müssen. Dann setzt Euch einfach an ein Lagerfeuer, bis es Euch besser geht.");
    AddAdditionalTrigger("krank");
    AddTraderTrigger("hatchet","For cutting down trees, getting the wood out of the log and making a campfire you need a hatchet. You can buy one from a smith.");
    AddTraderTrigger("beil","Zum Bäumefällen, das Holz aus dem Stamm schlagen und um ein Lagerfeuer zu entfachen, braucht Ihr ein Beil. Ihr könnt eines von einem Schmied kaufen.");
    AddTraderTrigger("where","Go along this road through the desert, into the cave, up the ladder and right into Findecano Melwasul's castle. He can tell you more.");
    AddCondition("qpg",">=",48);
    AddTraderTrigger("wohin","Geht diese Straße weiter durch die Wüste, in die Höhle, die Leiter hinauf und direkt ins Schloss von Findecano Melwasul. Er kann Euch mehr sagen.");
    AddAdditionalTrigger("wo geh");
    AddCondition("qpg",">=",48);
    -- last catch
    -- STATE 1
    AddTraderTrigger(".+","For me to teach you some things, you need to take a hatchet into your hands. Here you have one. Are you ready?");
    AddCondition("state","=",1);
    AddCondition("lang","english");
    AddCondition("item",74,"all","=",0);
    AddConsequence("item",74,1,333,0);
    AddTraderTrigger(".+","Wenn ich Euch ein paar Dinge lehren soll, dann müsst Ihr ein Beil in die Hand nehmen. Hier, ich gebe Euch eine. Seid Ihr bereit?");
    AddCondition("state","=",1);
    AddCondition("lang","german");
    AddCondition("item",74,"all","=",0);
    AddConsequence("item",74,1,333,0);
    AddTraderTrigger(".+","For me to teach you some things, you need to take a hatchet into your hands. As I see you have one with you. Are you ready?");
    AddCondition("state","=",1);
    AddCondition("lang","english");
    AddCondition("item",74,"all",">",0);
    AddTraderTrigger(".+","Wenn ich Euch ein paar Dinge lehren soll, dann müsst Ihr ein Beil in die Hand nehmen. Wie ich sehe habt Ihr eines dabei. Seid Ihr bereit?");
    AddCondition("state","=",1);
    AddCondition("lang","german");
    AddCondition("item",74,"all",">",0);
    -- STATE 2
    AddTraderTrigger(".+","Well done. Now place the wood on the ground in front of you and 'use' it twice, still holding the hatchet in your hands, to get kindling and to start a campfire. Always keep an eye on your campfire, it could become a wildfire and burn down towns and forests. Now try it.");
    AddCondition("lang","english");
    AddCondition("item",2560,"all",">",0);
    AddCondition("state","=",2);
    AddConsequence("state","=",3);
    AddTraderTrigger(".+","Gut gemacht. Nun legt das Holz vor Euch auf den Boden und 'benutzt' es zweimal, während Ihr immernoch das Beil in Händen haltet. So macht Ihr erst Brennholz und dann ein Lagerfeuer. Habt immer ein Auge auf Euer Lagerfeuer, es könnte zu einem Lauffeuer werden und Städte und Wälder niederbrennen. Jetzt versucht es.");
    AddCondition("lang","german");
    AddCondition("item",2560,"all",">",0);
    AddCondition("state","=",2);
    AddConsequence("state","=",3);
    AddTraderTrigger(".+","Didn't you want to get wood? Stand in front of an apple tree and 'use' the hatchet once. Cut down trees only when you are facing them, otherwise they could fall on you! When you have cut it down, redo this procedure on the whole length of the log until you get some deciduous wood. Talk to me again when you have the wood.");
    AddCondition("state","=",2);
    AddCondition("lang","english");
    AddCondition("item",2560,"all","=",0);
    AddTraderTrigger(".+","Wolltet Ihr nicht Holz bringen? Stellt Euch vor einen Apfelbaum und 'benutzt' das Beil einmal. Fällt nur Bäume, wenn Ihr ihnen zugewandt seid, ansonsten könnten sie auf Euch fallen! Wenn Ihr ihn gefällt habt, wiederholt diesen Vorgang an der gesamten Länge des Baumstammes, bis ihr etwas Laubholz erhaltet. Sprecht mich wieder an, wenn Ihr das Holz habt.");
    AddCondition("state","=",2);
    AddCondition("lang","german");
    AddCondition("item",2560,"all","=",0);
    -- STATE 3; no campfire started (checkFire)
    AddTraderTrigger(".+","Please start a campfire next to me. Place the wood on the ground in front of you and 'use' it twice, still holding the hatchet in your hands, to get kindling and to start a campfire. Always keep an eye on your campfire, it could become a wildfire and burn down towns and forests. Now try it. Talk to me again when you're done.");
    AddCondition("state","=",3);
    AddCondition("lang","english");
    AddTraderTrigger(".+","Bitte entzündet ein Lagerfeuer in meiner Nähe. Legt das Holz vor Euch auf den Boden und 'benutzt' es zweimal, während Ihr immernoch das Beil in Händen haltet. So macht Ihr erst Brennholz und dann ein Lagerfeuer. Habt immer ein Auge auf Euer Lagerfeuer, es könnte zu einem Lauffeuer werden und Städte und Wälder niederbrennen. Jetzt versucht es. Sprecht mich wieder an, wenn Ihr fertig seid.");
    AddCondition("state","=",3);
    AddCondition("lang","german");
    -- STATE 4; campfire started (checkFire)
    AddTraderTrigger(".+","Good. If you have a cold you should sit by a campfire to warm yourself and recover. That's the end of the lesson about lumberjacking.");
    AddCondition("state","=",4);
    AddCondition("lang","english");
    AddCondition("qpg",">",41);
    AddTraderTrigger(".+","Gut. Wenn Ihr eine Erkältung habt, solltet Ihr an einem Lagerfeuer sitzen, um Euch zu wärmen und zu erholen. Das war die Lektion übers Holzfällen.");
    AddCondition("state","=",4);
    AddCondition("lang","german");
    AddCondition("qpg",">",41);
    AddTraderTrigger(".+","Good. If you have a cold you should sit by a campfire to warm yourself and recover. That's all you need to know about using a hatchet. But before you can go, you should know where the 'belt' is. That's the six slots in your inventory, at the bottom right. Talk to me again, when you have put the hatchet in your belt.");
    AddCondition("state","=",4);
    AddCondition("lang","english");
    AddConsequence("state","=",7);
    AddTraderTrigger(".+","Gut. Wenn Ihr eine Erkältung habt, solltet Ihr an einem Lagerfeuer sitzen, um Euch zu wärmen und zu erholen. Tja, das ist alles, was Ihr wissen sollt, was man mit einem Beil machen kann. Aber bevor Ihr gehen könnt, solltet Ihr wissen, wo der 'Gürtel' ist. Das sind die sechs Felder in Eurem Inventar, rechts unten. Sprecht mich wieder an, wenn Ihr das Beil in den Gürtel geschoben habt.");
    AddCondition("state","=",4);
    AddCondition("lang","german");
    AddConsequence("state","=",7);
    -- STATE 5
    AddTraderTrigger(".+","Just click with the left mouse button on the FIELD where the signposts stands not on the signpost itself. Then tell me, what's written on it.");
    AddCondition("state","=",5);
    AddCondition("lang","english");
    AddTraderTrigger(".+","Klickt einfach mit der linken Maustaste auf das FELD, wo der Wegweiser steht, nicht auf den Wegweiser selbst. Dann sagt mir, was darauf geschrieben steht.");
    AddCondition("state","=",5);
    AddCondition("lang","german");
    -- STATE 6
    AddTraderTrigger(".+","I asked if I should explain you how to have a closer look at items. Yes or no?");
    AddCondition("state","=",6);
    AddCondition("lang","english");
    AddTraderTrigger(".+","Ich fragte, ob ich Euch erklären soll, wie man Dinge genauer anschaut. Ja oder nein?");
    AddCondition("state","=",6);
    AddCondition("lang","german");
    -- STATE 7
    AddTraderTrigger(".+","Great. Usually for crafting you have to put the needed materials or ingredients at the belt. Now I shall teach you how to have a closer look at items. Are you ready?");
    AddCondition("state","=",7);
    AddCondition("lang","english");
    AddCondition("item",74,"belt",">",0);
    AddConsequence("state","=",6);
    AddConsequence("qpg","=",41);
    AddTraderTrigger(".+","Großartig. Normalerweise müsst Ihr, wenn Ihr ein Handwerk ausübt, die benötigten Materialien oder Zutaten am Gürtel tragen. Jetzt aber muss ich Euch noch erklären, wie man Dinge genauer anschaut. Seid Ihr bereit?");
    AddCondition("state","=",7);
    AddCondition("lang","german");
    AddCondition("item",74,"belt",">",0);
    AddConsequence("state","=",6);
    AddConsequence("qpg","=",41);
    AddTraderTrigger(".+","You have to put the hatchet at the belt, that's the six slots at the bottom right in your inventory. If you need another hatchet, just ask for it. Then talk to me again, when you are ready.");
    AddCondition("state","=",7);
    AddCondition("lang","english");
    AddTraderTrigger(".+","Ihr müsst das Beil an den Gürtel schieben, das sind die sechs Felder unten rechts in Eurem Inventar. Falls Ihr ein weiteres Beil braucht, fragt einfach danach. Dann sprecht mich wieder an, wenn Ihr bereit seid.");
    AddCondition("state","=",7);
    AddCondition("lang","german");
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
            if NPCStatus[originator.id]==3 then
				newbieID = originator.id;
				for i=1,5 do
					base.common.CreateCircle( thisNPC.pos, i, checkCampfire );
				end
			end
			TellSmallTalk(message,originator);
		else
			Confused(
				"#me sieht dich leicht verwirrt an",
				"#me looks at you a little confused"
			);
        end
    end
end

function checkCampfire(Position)
	
	local itemList = base.common.GetItemsOnField(Position);
	if itemList[1]==nil then
		return
	end;
	for x,item in itemList do
		if item.id == 12 then
			NPCStatus[newbieID]=4;
			return;
		end
	end
end

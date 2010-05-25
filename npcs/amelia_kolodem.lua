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

    npcs.base.autonpcfunctions.InitTalkLists();
    QuestID=2;

     -- ********* START DYNAMIC PART ********

    -- small talk
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Come again when Nargon Hammerfaust sends you to me. He is one of the dwarves at the house across the river, the road back leads to them.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddCondition("qpg","<",40);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Kommt wieder, wenn Nargon Hammerfaust Euch zu mich schickt. Er ist einer der Zwerge bei dem Haus weiter zurück an dieser Straße, über den Fluss.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddCondition("qpg","<",40);
    npcs.base.autonpcfunctions.AddTraderTrigger("Hello","Hello, my name is "..thisNPC.name..". I am a lumberjack and I will gladly help you if you wish.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greetings");
    npcs.base.autonpcfunctions.AddCondition("state","=",0);
    npcs.base.autonpcfunctions.AddCondition("qpg","=",40);
    npcs.base.autonpcfunctions.AddTraderTrigger("Hallo","Hallo, mein Name ist "..thisNPC.name..". Ich bin eine Holzfällerin und werde Euch gerne helfen, wenn Ihr es wünscht.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Gr[üu][ßs]");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("grue[sß]");
    npcs.base.autonpcfunctions.AddCondition("state","=",0);
    npcs.base.autonpcfunctions.AddCondition("qpg","=",40);
    npcs.base.autonpcfunctions.AddTraderTrigger("Hello","Hello %Charname! If you want to continue, just ask for 'help'.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greetings");
    npcs.base.autonpcfunctions.AddCondition("state","=",0);
    npcs.base.autonpcfunctions.AddCondition("qpg","=",41);
    npcs.base.autonpcfunctions.AddTraderTrigger("Hallo","Hallo %Charname! Wenn Ihr weitermachen wollt, fragt einfach nach 'Hilfe'.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Gr[üu][ßs]");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("grue[sß]");
    npcs.base.autonpcfunctions.AddCondition("state","=",0);
    npcs.base.autonpcfunctions.AddCondition("qpg","=",41);
    npcs.base.autonpcfunctions.AddTraderTrigger("Hello","Hello %Charname!. I can explain lumberjacking again or I can repeat the lesson on how to have a closer look at items, if you want. Or you can just go along this road through the desert, into the cave, up the ladder and right into Findecano Melwasul's castle. He can tell you more.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greetings");
    npcs.base.autonpcfunctions.AddCondition("state","=",0);
    npcs.base.autonpcfunctions.AddCondition("qpg",">",41);
    npcs.base.autonpcfunctions.AddTraderTrigger("Hallo","Hallo %CHARNAME! Ich kann Euch gerne nochmal beim Holzfällen helfen oder ich erkläre nochmal, wie man Dinge genauer anschaut, wenn Ihr es wünscht. Oder geht diese Straße weiter durch die Wüste, in die Höhle, die Leiter hinauf und direkt ins Schloss von Findecano Melwasul. Er kann Euch mehr sagen.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Gr[üu][ßs]");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("grue[sß]");
    npcs.base.autonpcfunctions.AddCondition("state","=",0);
    npcs.base.autonpcfunctions.AddCondition("qpg",">",41);
    npcs.base.autonpcfunctions.AddTraderTrigger("Hello","Hello again. We can continue if you want.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greetings");
    npcs.base.autonpcfunctions.AddTraderTrigger("Hallo","Nochmals hallo. Wir können fortfahren, wenn Ihr es möchtet.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Gr[üu][ßs]");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("grue[sß]");
    npcs.base.autonpcfunctions.AddTraderTrigger("Who you","I am "..thisNPC.name..", a lumberjack. I help all the people who are willing to learn.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("What you");
    npcs.base.autonpcfunctions.AddTraderTrigger("Wer du","Ich bin "..thisNPC.name..", eine Holzfällerin. Ich helfe allen Leuten, die bereit sind zu lernen.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Wer Ihr");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Was du");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Was Ihr");
    npcs.base.autonpcfunctions.AddTraderTrigger("how are you","Oh, I am fine. I hope you too.");
    npcs.base.autonpcfunctions.AddTraderTrigger("wie geht dir","Oh, mir geht es gut. Ich hoffe Euch auch.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wie geht euch");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wohlbefinden");
    npcs.base.autonpcfunctions.AddTraderTrigger("bye","Be well.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("farewell");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("be well");
    npcs.base.autonpcfunctions.AddAdditionalText("Farewell.");
    npcs.base.autonpcfunctions.AddAdditionalText("Good bye.");
    npcs.base.autonpcfunctions.AddTraderTrigger("auf bald","Auf bald.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("bis bald");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("leb.+wohl");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("tsch[üu][ßs]");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mach.+gut");
    npcs.base.autonpcfunctions.AddAdditionalText("Bis bald.");
    npcs.base.autonpcfunctions.AddAdditionalText("Lebt wohl.");
    -- start lesson the first time
    npcs.base.autonpcfunctions.AddTraderTrigger("lumberjack","I can teach you some things, if you want. First you need to take a hatchet into your hands. Here you can have this one. Are you ready?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("cut.+down");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("help");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("learn");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("teach");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("hatchet");
    npcs.base.autonpcfunctions.AddCondition("state","=",0);
    npcs.base.autonpcfunctions.AddCondition("item",74,"all","=",0);
    npcs.base.autonpcfunctions.AddCondition("qpg","=",40);
    npcs.base.autonpcfunctions.AddConsequence("state","=",1);
    npcs.base.autonpcfunctions.AddConsequence("item",74,1,333,0);
    npcs.base.autonpcfunctions.AddTraderTrigger("holzf[äa]ll","Ich kann Euch ein paar Dinge lehren. Als erstes müsst Ihr ein Beil in die Hand nehmen. Hier, ich gebe Euch eines. Seid Ihr bereit?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("f[äa]llen");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("hilf");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("helf");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("lern");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("lehr");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("beil");
    npcs.base.autonpcfunctions.AddCondition("state","=",0);
    npcs.base.autonpcfunctions.AddCondition("item",74,"all","=",0);
    npcs.base.autonpcfunctions.AddCondition("qpg","=",40);
    npcs.base.autonpcfunctions.AddConsequence("state","=",1);
    npcs.base.autonpcfunctions.AddConsequence("item",74,1,333,0);
    npcs.base.autonpcfunctions.AddTraderTrigger("lumberjack","I can teach you some things, if you want. First you need to take a hatchet into your hands. As I see you already have one with you. Are you ready?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("cut.+down");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("help");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("learn");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("teach");
    npcs.base.autonpcfunctions.AddCondition("item",74,"all",">",0);
    npcs.base.autonpcfunctions.AddCondition("state","=",0);
    npcs.base.autonpcfunctions.AddCondition("qpg","=",40);
    npcs.base.autonpcfunctions.AddConsequence("state","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("holzf[äa]ll","Ich kann Euch ein paar Dinge lehren. Als erstes müsst Ihr ein Beil in die Hand nehmen. Wie ich sehe habt Ihr eines dabei. Seid Ihr bereit?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("holzfaell");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("f[äa]llen");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("faell");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("hilf");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("helf");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("lern");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("lehr");
    npcs.base.autonpcfunctions.AddCondition("item",74,"all",">",0);
    npcs.base.autonpcfunctions.AddCondition("state","=",0);
    npcs.base.autonpcfunctions.AddCondition("qpg","=",40);
    npcs.base.autonpcfunctions.AddConsequence("state","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("item","Well then, you can look at an item simply by clicking on the particular field with your left mouse button. But make sure you click on the field upon which the item lies, not on the item itself. Now look at the signpost over there and tell me what it reads.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("look");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("close");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("help");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("learn");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("teach");
    npcs.base.autonpcfunctions.AddCondition("state","=",0);
    npcs.base.autonpcfunctions.AddCondition("qpg","=",41);
    npcs.base.autonpcfunctions.AddConsequence("state","=",5);
    npcs.base.autonpcfunctions.AddTraderTrigger("ding","Nun denn, Ihr könnt Dinge anschauen, indem Ihr einfach mit der linken Maustaste auf das betreffende Feld klickt. Aber achtet darauf, dass Ihr auf das Feld klickt, wo das Ding liegt, nicht auf das Ding an sich. Jetzt schaut den Wegweiser dort drüben an und sagt mir, was darauf steht.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("schau");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("genau");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("hilf");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("helf");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("lern");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("lehr");
    npcs.base.autonpcfunctions.AddCondition("state","=",0);
    npcs.base.autonpcfunctions.AddCondition("qpg","=",41);
    npcs.base.autonpcfunctions.AddConsequence("state","=",5);
    -- repeat lessons
    npcs.base.autonpcfunctions.AddTraderTrigger("lumberjack","I can teach you some things. First you need to take a hatchet into your hands. Here you can have one. Are you ready?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("cut.+down");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("hatchet");
    npcs.base.autonpcfunctions.AddCondition("state","=",0);
    npcs.base.autonpcfunctions.AddCondition("item",74,"all","=",0);
    npcs.base.autonpcfunctions.AddCondition("qpg",">",41);
    npcs.base.autonpcfunctions.AddConsequence("state","=",1);
    npcs.base.autonpcfunctions.AddConsequence("item",74,1,333,0);
    npcs.base.autonpcfunctions.AddTraderTrigger("holzf[äa]ll","Ich kann Euch ein paar Dinge lehren. Als erstes müsst Ihr ein Beil in die Hand nehmen. Hier, ich gebe Euch eines. Seid Ihr bereit?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("f[äa]llen");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("hilf");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("helf");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("lern");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("lehr");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("beil");
    npcs.base.autonpcfunctions.AddCondition("state","=",0);
    npcs.base.autonpcfunctions.AddCondition("item",74,"all","=",0);
    npcs.base.autonpcfunctions.AddCondition("qpg",">",41);
    npcs.base.autonpcfunctions.AddConsequence("state","=",1);
    npcs.base.autonpcfunctions.AddConsequence("item",74,1,333,0);
    npcs.base.autonpcfunctions.AddTraderTrigger("lumberjack","I can teach you some things. First you need to take a hatchet into your hands.I see you already have one with you. Are you ready?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("cut.+down");
    npcs.base.autonpcfunctions.AddCondition("item",74,"all",">",0);
    npcs.base.autonpcfunctions.AddCondition("state","=",0);
    npcs.base.autonpcfunctions.AddCondition("qpg",">",41);
    npcs.base.autonpcfunctions.AddConsequence("state","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("holzf[äa]ll","Ich kann Euch ein paar Dinge lehren. Als erstes müsst Ihr ein Beil in die Hand nehmen. Wie ich sehe habt Ihr eines dabei. Seid Ihr bereit?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("holzfaell");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("f[äa]llen");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("faell");
    npcs.base.autonpcfunctions.AddCondition("item",74,"all",">",0);
    npcs.base.autonpcfunctions.AddCondition("state","=",0);
    npcs.base.autonpcfunctions.AddCondition("qpg",">",41);
    npcs.base.autonpcfunctions.AddConsequence("state","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("item","Well then, you can look at an item simply by clicking on the particular field with your left mouse button. But make sure you click on the field upon which the item lies, not on the item itself. Now look at the signpost over there and tell me what it reads.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("look");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("close");
    npcs.base.autonpcfunctions.AddCondition("state","=",0);
    npcs.base.autonpcfunctions.AddCondition("qpg",">",41);
    npcs.base.autonpcfunctions.AddConsequence("state","=",5);
    npcs.base.autonpcfunctions.AddTraderTrigger("ding","Nun denn, Ihr könnt Dinge anschauen, indem Ihr einfach mit der linken Maustaste auf das betreffende Feld klickt. Aber achtet darauf, dass Ihr auf das Feld klickt, wo das Ding liegt, nicht auf das Ding an sich. Jetzt schaut den Wegweiser dort drüben an und sagt mir, was darauf steht.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("schau");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("genau");
    npcs.base.autonpcfunctions.AddCondition("state","=",0);
    npcs.base.autonpcfunctions.AddCondition("qpg",">",41);
    npcs.base.autonpcfunctions.AddConsequence("state","=",5);
    npcs.base.autonpcfunctions.AddTraderTrigger("help","You can repeat the lessons about 'lumberjacking' and 'looking at items'. Just tell me which you want. But if you don't know what to do next, then ask 'Where to go now?'.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("learn");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("teach");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("lessons");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("repeat");
    npcs.base.autonpcfunctions.AddCondition("state","=",0);
    npcs.base.autonpcfunctions.AddCondition("qpg",">",41);
    npcs.base.autonpcfunctions.AddTraderTrigger("hilf","Ihr könnt die Lektionen über 'holzfällen' und 'Dinge anschauen' wieder holen. Sagt mir einfach, welche Ihr wollt. Aber wenn Ihr nicht wisst, was als nächstes zu tun ist, fragt 'Wohin soll ich jetzt gehen?'.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("helf");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("lern");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("lehr");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("lektion");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wiederholen");
    npcs.base.autonpcfunctions.AddCondition("state","=",0);
    npcs.base.autonpcfunctions.AddCondition("qpg",">",41);
    -- STATE 1
    npcs.base.autonpcfunctions.AddTraderTrigger("hatchet","What? Where is the hatchet I gave you? Well, doesn't matter. Here you can have another one.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("help");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("tool");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("axe");
    npcs.base.autonpcfunctions.AddCondition("item",74,"all","=",0);
    npcs.base.autonpcfunctions.AddCondition("state",">",0);
    npcs.base.autonpcfunctions.AddConsequence("item",74,1,333,0);
    npcs.base.autonpcfunctions.AddTraderTrigger("beil","Was? Wo ist das Beil, das ich Euch gegeben habe? Naja, macht nichts. Hier, ich gebe Euch noch eines.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("hilf");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("helf");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("werkzeug");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("axt");
    npcs.base.autonpcfunctions.AddCondition("item",74,"all","=",0);
    npcs.base.autonpcfunctions.AddCondition("state",">",0);
    npcs.base.autonpcfunctions.AddConsequence("item",74,1,333,0);
    npcs.base.autonpcfunctions.AddTraderTrigger("yes","Good. Now stand in front of an apple tree and 'use' the hatchet once. Cut down trees only when you are facing them, otherwise they could fall on you! When you have cut it down, redo this procedure on the whole length of the log until you get some deciduous wood. Talk to me again, if you have the wood.");
    npcs.base.autonpcfunctions.AddCondition("state","=",1);
    npcs.base.autonpcfunctions.AddCondition("item",74,"body",">",0);
    npcs.base.autonpcfunctions.AddConsequence("state","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("ja","Gut. Jetzt stellt Euch vor einen Apfelbaum und 'benutzt' das Beil einmal. Fällt nur Bäume, wenn Ihr ihnen zugewandt seid, ansonsten könnten sie auf Euch fallen! Wenn Ihr ihn gefällt habt, wiederholt diesen Vorgang an der gesamten Länge des Baumstammes, bis ihr etwas Laubholz erhaltet. Sprecht mich wieder an, wenn Ihr das Holz habt.");
    npcs.base.autonpcfunctions.AddCondition("state","=",1);
    npcs.base.autonpcfunctions.AddCondition("item",74,"body",">",0);
    npcs.base.autonpcfunctions.AddConsequence("state","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("no","Well, come back if you really want to learn the basics of lumberjacking. But you have to do it anyway if you want to go on.");
    npcs.base.autonpcfunctions.AddCondition("state","=",1);
    npcs.base.autonpcfunctions.AddConsequence("state","=",0);
    npcs.base.autonpcfunctions.AddTraderTrigger("nein","Naja, kommt wieder, wenn Ihr die Grundlagen des Holzfällens wirklich lernen wollt. Aber Ihr müsst es sowieso machen, falls Ihr weitermachen wollt.");
    npcs.base.autonpcfunctions.AddCondition("state","=",1);
    npcs.base.autonpcfunctions.AddConsequence("state","=",0);
    -- STATE 5
    npcs.base.autonpcfunctions.AddTraderTrigger("double palm","Exactly! It is the sand scape 'Double Palm'. You can look at everything and everyone in the same way. That was all I can teach you. Now go along this road through the desert, into the cave, up the ladder and right into Findecano Melwasul's castle. He can tell you more.");
    npcs.base.autonpcfunctions.AddCondition("state","=",5);
    npcs.base.autonpcfunctions.AddConsequence("state","=",0);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",48);
    npcs.base.autonpcfunctions.AddTraderTrigger("doppelpalme","Genau! Es ist die Sandlandschaft 'Doppelpalme'. Ihr könnt auf die gleiche Weise alles und jeden anschauen. Das war alles, was ich Euch beibringen kann. Nun geht diese Straße weiter durch die Wüste, in die Höhle, die Leiter hinauf und direkt ins Schloss von Findecano Melwasul. Er kann Euch mehr sagen.");
    npcs.base.autonpcfunctions.AddCondition("state","=",5);
    npcs.base.autonpcfunctions.AddConsequence("state","=",0);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",48);
    -- STATE 6
    npcs.base.autonpcfunctions.AddTraderTrigger("yes","Well then, you can look at an item simply by clicking on the particular field with your left mouse button. But make sure you click on the field upon which the item lies, not on the item itself. Now look at the signpost over there and tell me what it reads.");
    npcs.base.autonpcfunctions.AddCondition("state","=",6);
    npcs.base.autonpcfunctions.AddConsequence("state","=",5);
    npcs.base.autonpcfunctions.AddTraderTrigger("ja","Nun denn, Ihr könnt Dinge anschauen, indem Ihr einfach mit der linken Maustaste auf das betreffende Feld klickt. Aber achtet darauf, dass Ihr auf das Feld klickt, wo das Teil liegt, nicht auf das Ding an sich. Jetzt schaut den Wegweiser dort drüben an und sagt mir, was darauf steht.");
    npcs.base.autonpcfunctions.AddCondition("state","=",6);
    npcs.base.autonpcfunctions.AddConsequence("state","=",5);
    npcs.base.autonpcfunctions.AddTraderTrigger("no","No? Then come back when you are ready. Just ask me for 'help'.");
    npcs.base.autonpcfunctions.AddCondition("state","=",6);
    npcs.base.autonpcfunctions.AddConsequence("state","=",0);
    npcs.base.autonpcfunctions.AddTraderTrigger("nein","Nein? Dann kommt wieder, wenn Ihr bereit seid. Fragt mich einfach nach 'Hilfe'.");
    npcs.base.autonpcfunctions.AddCondition("state","=",6);
    npcs.base.autonpcfunctions.AddConsequence("state","=",0);
    -- standard explanations
    npcs.base.autonpcfunctions.AddTraderTrigger("wildfire","A campfire can become a wildfire. Then you need a bucket of water to extinguish it.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wild fire");
    npcs.base.autonpcfunctions.AddTraderTrigger("lauffeuer","Ein Lagerfeuer kann zu einem Lauffeuer werden. Dann braucht Ihr einen Eimer mit Wasser um es zu löschen.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("lauf feuer");
    npcs.base.autonpcfunctions.AddTraderTrigger("bucket","Here you have an empty bucket. Go to the water, hold the bucket in your hands and use it with the water to fill it, so hold [shift], first click on the bucket then on the water field and finally release [shift]. Do the same with a full bucket and a fire to extinguish it.");
    npcs.base.autonpcfunctions.AddCondition("item",51,"all","=",0);
    npcs.base.autonpcfunctions.AddCondition("item",52,"all","=",0);
    npcs.base.autonpcfunctions.AddConsequence("item",51,1,333,0);
    npcs.base.autonpcfunctions.AddTraderTrigger("eimer","Hier habt Ihr einen leeren Eimer. Geht zum Wasser, haltet den Eimer in der Hand und benutzt ihn mit dem Wasser, um ihn zu füllen, also haltet [shift], erst auf den Eimer und dann auf das Wasserfeld klicken und schließlich [shift] loslassen. Macht dasselbe mit einem vollen Eimer und Feuer um es zu löschen.");
    npcs.base.autonpcfunctions.AddCondition("item",51,"all","=",0);
    npcs.base.autonpcfunctions.AddCondition("item",52,"all","=",0);
    npcs.base.autonpcfunctions.AddConsequence("item",51,1,333,0);
    npcs.base.autonpcfunctions.AddTraderTrigger("bucket","Go to the water, hold the bucket in your hands and use it with the water to fill it, so hold [shift], first click on the bucket then on the water field and finally release [shift]. Do the same with a full bucket and a fire to extinguish it.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("extinguish fire");
    npcs.base.autonpcfunctions.AddTraderTrigger("eimer","Geht zum Wasser, haltet den Eimer in der Hand und benutzt ihn mit dem Wasser, um ihn zu füllen, also haltet [shift], erst auf den Eimer und dann auf das Wasserfeld klicken und schließlich [shift] loslassen. Macht dasselbe mit einem vollen Eimer und Feuer um es zu löschen.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("feuer l[öo]schen");
    npcs.base.autonpcfunctions.AddTraderTrigger("cold","Well if you catch a cold, you will sneeze and cough all the time. Then just sit by a campfire until you feel better.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("disease");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("illness");
    npcs.base.autonpcfunctions.AddTraderTrigger("erk[äa]ltung","Nun, wenn Ihr Euch eine Erkältung eingefangen habt, werdet Ihr die ganze Zeit Niesen und husten müssen. Dann setzt Euch einfach an ein Lagerfeuer, bis es Euch besser geht.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("krank");
    npcs.base.autonpcfunctions.AddTraderTrigger("hatchet","For cutting down trees, getting the wood out of the log and making a campfire you need a hatchet. You can buy one from a smith.");
    npcs.base.autonpcfunctions.AddTraderTrigger("beil","Zum Bäumefällen, das Holz aus dem Stamm schlagen und um ein Lagerfeuer zu entfachen, braucht Ihr ein Beil. Ihr könnt eines von einem Schmied kaufen.");
    npcs.base.autonpcfunctions.AddTraderTrigger("where","Go along this road through the desert, into the cave, up the ladder and right into Findecano Melwasul's castle. He can tell you more.");
    npcs.base.autonpcfunctions.AddCondition("qpg",">=",48);
    npcs.base.autonpcfunctions.AddTraderTrigger("wohin","Geht diese Straße weiter durch die Wüste, in die Höhle, die Leiter hinauf und direkt ins Schloss von Findecano Melwasul. Er kann Euch mehr sagen.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wo geh");
    npcs.base.autonpcfunctions.AddCondition("qpg",">=",48);
    -- last catch
    -- STATE 1
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","For me to teach you some things, you need to take a hatchet into your hands. Here you have one. Are you ready?");
    npcs.base.autonpcfunctions.AddCondition("state","=",1);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddCondition("item",74,"all","=",0);
    npcs.base.autonpcfunctions.AddConsequence("item",74,1,333,0);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Wenn ich Euch ein paar Dinge lehren soll, dann müsst Ihr ein Beil in die Hand nehmen. Hier, ich gebe Euch eine. Seid Ihr bereit?");
    npcs.base.autonpcfunctions.AddCondition("state","=",1);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddCondition("item",74,"all","=",0);
    npcs.base.autonpcfunctions.AddConsequence("item",74,1,333,0);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","For me to teach you some things, you need to take a hatchet into your hands. As I see you have one with you. Are you ready?");
    npcs.base.autonpcfunctions.AddCondition("state","=",1);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddCondition("item",74,"all",">",0);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Wenn ich Euch ein paar Dinge lehren soll, dann müsst Ihr ein Beil in die Hand nehmen. Wie ich sehe habt Ihr eines dabei. Seid Ihr bereit?");
    npcs.base.autonpcfunctions.AddCondition("state","=",1);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddCondition("item",74,"all",">",0);
    -- STATE 2
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Well done. Now place the wood on the ground in front of you and 'use' it twice, still holding the hatchet in your hands, to get kindling and to start a campfire. Always keep an eye on your campfire, it could become a wildfire and burn down towns and forests. Now try it.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddCondition("item",2560,"all",">",0);
    npcs.base.autonpcfunctions.AddCondition("state","=",2);
    npcs.base.autonpcfunctions.AddConsequence("state","=",3);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Gut gemacht. Nun legt das Holz vor Euch auf den Boden und 'benutzt' es zweimal, während Ihr immernoch das Beil in Händen haltet. So macht Ihr erst Brennholz und dann ein Lagerfeuer. Habt immer ein Auge auf Euer Lagerfeuer, es könnte zu einem Lauffeuer werden und Städte und Wälder niederbrennen. Jetzt versucht es.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddCondition("item",2560,"all",">",0);
    npcs.base.autonpcfunctions.AddCondition("state","=",2);
    npcs.base.autonpcfunctions.AddConsequence("state","=",3);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Didn't you want to get wood? Stand in front of an apple tree and 'use' the hatchet once. Cut down trees only when you are facing them, otherwise they could fall on you! When you have cut it down, redo this procedure on the whole length of the log until you get some deciduous wood. Talk to me again when you have the wood.");
    npcs.base.autonpcfunctions.AddCondition("state","=",2);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddCondition("item",2560,"all","=",0);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Wolltet Ihr nicht Holz bringen? Stellt Euch vor einen Apfelbaum und 'benutzt' das Beil einmal. Fällt nur Bäume, wenn Ihr ihnen zugewandt seid, ansonsten könnten sie auf Euch fallen! Wenn Ihr ihn gefällt habt, wiederholt diesen Vorgang an der gesamten Länge des Baumstammes, bis ihr etwas Laubholz erhaltet. Sprecht mich wieder an, wenn Ihr das Holz habt.");
    npcs.base.autonpcfunctions.AddCondition("state","=",2);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddCondition("item",2560,"all","=",0);
    -- STATE 3; no campfire started (checkFire)
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Please start a campfire next to me. Place the wood on the ground in front of you and 'use' it twice, still holding the hatchet in your hands, to get kindling and to start a campfire. Always keep an eye on your campfire, it could become a wildfire and burn down towns and forests. Now try it. Talk to me again when you're done.");
    npcs.base.autonpcfunctions.AddCondition("state","=",3);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Bitte entzündet ein Lagerfeuer in meiner Nähe. Legt das Holz vor Euch auf den Boden und 'benutzt' es zweimal, während Ihr immernoch das Beil in Händen haltet. So macht Ihr erst Brennholz und dann ein Lagerfeuer. Habt immer ein Auge auf Euer Lagerfeuer, es könnte zu einem Lauffeuer werden und Städte und Wälder niederbrennen. Jetzt versucht es. Sprecht mich wieder an, wenn Ihr fertig seid.");
    npcs.base.autonpcfunctions.AddCondition("state","=",3);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    -- STATE 4; campfire started (checkFire)
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Good. If you have a cold you should sit by a campfire to warm yourself and recover. That's the end of the lesson about lumberjacking.");
    npcs.base.autonpcfunctions.AddCondition("state","=",4);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddCondition("qpg",">",41);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Gut. Wenn Ihr eine Erkältung habt, solltet Ihr an einem Lagerfeuer sitzen, um Euch zu wärmen und zu erholen. Das war die Lektion übers Holzfällen.");
    npcs.base.autonpcfunctions.AddCondition("state","=",4);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddCondition("qpg",">",41);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Good. If you have a cold you should sit by a campfire to warm yourself and recover. That's all you need to know about using a hatchet. But before you can go, you should know where the 'belt' is. That's the six slots in your inventory, at the bottom right. Talk to me again, when you have put the hatchet in your belt.");
    npcs.base.autonpcfunctions.AddCondition("state","=",4);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("state","=",7);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Gut. Wenn Ihr eine Erkältung habt, solltet Ihr an einem Lagerfeuer sitzen, um Euch zu wärmen und zu erholen. Tja, das ist alles, was Ihr wissen sollt, was man mit einem Beil machen kann. Aber bevor Ihr gehen könnt, solltet Ihr wissen, wo der 'Gürtel' ist. Das sind die sechs Felder in Eurem Inventar, rechts unten. Sprecht mich wieder an, wenn Ihr das Beil in den Gürtel geschoben habt.");
    npcs.base.autonpcfunctions.AddCondition("state","=",4);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddConsequence("state","=",7);
    -- STATE 5
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Just click with the left mouse button on the FIELD where the signposts stands not on the signpost itself. Then tell me, what's written on it.");
    npcs.base.autonpcfunctions.AddCondition("state","=",5);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Klickt einfach mit der linken Maustaste auf das FELD, wo der Wegweiser steht, nicht auf den Wegweiser selbst. Dann sagt mir, was darauf geschrieben steht.");
    npcs.base.autonpcfunctions.AddCondition("state","=",5);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    -- STATE 6
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","I asked if I should explain you how to have a closer look at items. Yes or no?");
    npcs.base.autonpcfunctions.AddCondition("state","=",6);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Ich fragte, ob ich Euch erklären soll, wie man Dinge genauer anschaut. Ja oder nein?");
    npcs.base.autonpcfunctions.AddCondition("state","=",6);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    -- STATE 7
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Great. Usually for crafting you have to put the needed materials or ingredients at the belt. Now I shall teach you how to have a closer look at items. Are you ready?");
    npcs.base.autonpcfunctions.AddCondition("state","=",7);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddCondition("item",74,"belt",">",0);
    npcs.base.autonpcfunctions.AddConsequence("state","=",6);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",41);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Großartig. Normalerweise müsst Ihr, wenn Ihr ein Handwerk ausübt, die benötigten Materialien oder Zutaten am Gürtel tragen. Jetzt aber muss ich Euch noch erklären, wie man Dinge genauer anschaut. Seid Ihr bereit?");
    npcs.base.autonpcfunctions.AddCondition("state","=",7);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddCondition("item",74,"belt",">",0);
    npcs.base.autonpcfunctions.AddConsequence("state","=",6);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",41);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","You have to put the hatchet at the belt, that's the six slots at the bottom right in your inventory. If you need another hatchet, just ask for it. Then talk to me again, when you are ready.");
    npcs.base.autonpcfunctions.AddCondition("state","=",7);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Ihr müsst das Beil an den Gürtel schieben, das sind die sechs Felder unten rechts in Eurem Inventar. Falls Ihr ein weiteres Beil braucht, fragt einfach danach. Dann sprecht mich wieder an, wenn Ihr bereit seid.");
    npcs.base.autonpcfunctions.AddCondition("state","=",7);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
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
            if NPCStatus[originator.id]==3 then
				newbieID = originator.id;
				for i=1,5 do
					base.common.CreateCircle( thisNPC.pos, i, checkCampfire );
				end
			end
			npcs.base.autonpcfunctions.TellSmallTalk(message,originator);
		else
			npcs.base.autonpcfunctions.Confused(
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

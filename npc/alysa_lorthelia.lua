--------------------------------------------------------------------------------
-- NPC Name: Alysa Lorthelia                                         Runewick --
-- NPC Job:  Baker                                                            --
--                                                                            --
-- NPC Race: human                      NPC Position:  907, 794, 1            --
-- NPC Sex:  female                     NPC Direction: south                  --
--                                                                            --
-- Author:   Regallo                                                          --
--                                                    Illarion easyNPC Editor --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (0, 907, 794, 1, 4, 'Alysa Lorthelia', 'npc.alysa_lorthelia', 1, 2, 5, 123, 62, 9, 245, 180, 137);
---]]

require("npc.base.basic")
require("npc.base.condition.chance")
require("npc.base.condition.language")
require("npc.base.consequence.inform")
require("npc.base.consequence.trade")
require("npc.base.talk")
require("npc.base.trade")
module("npc.alysa_lorthelia", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
local tradingNPC = npc.base.trade.tradeNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("kauf");
talkEntry:addTrigger("waren");
talkEntry:addTrigger("preis");
talkEntry:addTrigger("handel");
talkEntry:addTrigger("ver�u�er");
talkEntry:addTrigger("erwerb");
talkEntry:addResponse("Lass uns handeln!");
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("sell");
talkEntry:addTrigger("buy");
talkEntry:addTrigger("wares");
talkEntry:addTrigger("price");
talkEntry:addTrigger("trade");
talkEntry:addTrigger("purchase");
talkEntry:addResponse("Let's trade!");
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Alysa Lorthelia the baker. Keywords: buy, sell, trade."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Alysa Lorthelia die B�ckerin. Schl�sselw�rter: Handel, kaufe, verkaufe."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hello");
talkEntry:addTrigger("Greet");
talkEntry:addTrigger("Hail");
talkEntry:addTrigger("Good day");
talkEntry:addTrigger("Good morning");
talkEntry:addTrigger("Good Evening");
talkEntry:addResponse("Hello, would you like something to eat? My wares are pretty tasty!");
talkEntry:addResponse(" Nice to meet you, I'm Alysa Lorthelia.");
talkEntry:addResponse("Ah, you startled me! Hello, my apologies.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gr��");
talkEntry:addTrigger("Gru�");
talkEntry:addTrigger("Guten Morgen");
talkEntry:addTrigger("Guten Tag");
talkEntry:addTrigger("Guten Abend");
talkEntry:addTrigger("Gute Nacht");
talkEntry:addTrigger("Mahlzeit");
talkEntry:addTrigger("Tach");
talkEntry:addTrigger("Moin");
talkEntry:addTrigger("Mohltied");
talkEntry:addResponse("Hallo, m�gt Ihr etwas essen?Ich finde das Essen welches ich hergestellt habe schmeckt.");
talkEntry:addResponse("Freut mich euch zu treffen. Ich bin Alysa Lorthelia.");
talkEntry:addResponse("Ah! Ihr habt mich erschreckt, Hallo, tut mir leid.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Hello, would you like something to eat? My wares are pretty tasty!");
talkEntry:addResponse(" Nice to meet you, I'm Alysa Lorthelia.");
talkEntry:addResponse("Ah, you startled me! Hello, my apologies.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Hallo, m�gt Ihr etwas essen?Ich finde das Essen welches ich hergestellt habe schmeckt.");
talkEntry:addResponse("Freut mich euch zu treffen. Ich bin Alysa Lorthelia.");
talkEntry:addResponse("Ah! Ihr habt mich erschreckt, Hallo, tut mir leid.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Will I ever see you again? ");
talkEntry:addResponse("Thank you so, so much for talking to me.");
talkEntry:addResponse("Please have a good day. Can you visit again please?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tsch��");
talkEntry:addTrigger("Tsch�ss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Werde ich Euch wiedersehen?");
talkEntry:addResponse("Vielen, vielen, vielen Dank, dass Ihr mit mir gesprochen habt.");
talkEntry:addResponse("Ich w�nsche Euch einen sch�nen Tag. Bitte kommt mal wieder vorbei.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Will I ever see you again? ");
talkEntry:addResponse("Thank you so, so much for talking to me.");
talkEntry:addResponse("Please have a good day. Can you visit again please?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Will I ever see you again? ");
talkEntry:addResponse("Thank you so, so much for talking to me.");
talkEntry:addResponse("Please have a good day. Can you visit again please?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Werde ich Euch wiedersehen?");
talkEntry:addResponse("Vielen, vielen, vielen Dank, dass Ihr mit mir gesprochen habt.");
talkEntry:addResponse("Ich w�nsche Euch einen sch�nen Tag. Bitte kommt mal wieder vorbei.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("I don't feel great today. My stomach hurts but it's not because of my food! Please don't think my food is bad!");
talkEntry:addResponse("My head is all dizzy.");
talkEntry:addResponse("I think I ate too much. I shouldn't eat for another few days.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie f�hlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befind");
talkEntry:addResponse("Ich f�hle mich heute nicht gut. Ich habe Magenschmerzen. Aber das liegt nicht an meinem Essen. Bitte denkt nicht, es l�ge an meinem Essen!");
talkEntry:addResponse("Mir ist schwindelig.");
talkEntry:addResponse("Ich habe zuviel gegessen. Ich sollte die n�chsten zwei Tage nichts Essen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("I'm the daughter of the sword crafter Asha Lorthelia.");
talkEntry:addResponse("I'm the oldest Lorthelia daughter, but no: I can't craft ornate weapons like my mother. Instead I bake.");
talkEntry:addResponse("I am Alysa Lorthelia, the baker... at least for now.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ihr name");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie hei�t");
talkEntry:addResponse("Ich bin die Tochter der Waffenschmiedin Asha Lorthelai.");
talkEntry:addResponse("Ich bin die �lteste Tochter der Lotheila, aber ich kann keine verzierten Waffen herstellen. Daher backe ich.");
talkEntry:addResponse("Ich bin Alysa Lothelia, die B�ckerin, zumondest zur Zeit noch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("I bake all kinds of fresh goods.");
talkEntry:addResponse("I sell people the food that myself and old John Sights bake.");
talkEntry:addResponse("I started working as a baker many moons ago.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Ich backe die verschiedensten Waren.");
talkEntry:addResponse("Ich verkaufe das Essen, dass ich und  John Sighs backen.");
talkEntry:addResponse("Ich arbeite seit ein paar Monaten als B�ckerin.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("I bake all kinds of fresh goods.");
talkEntry:addResponse("I sell people the food that myself and old John Sights bake.");
talkEntry:addResponse("I started working as a baker many moons ago.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Ich backe die verschiedensten Waren.");
talkEntry:addResponse("Ich verkaufe das Essen, dass ich und  John Sighs backen.");
talkEntry:addResponse("Ich arbeite seit ein paar Monaten als B�ckerin.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("There were fairies somewhere in that world.");
talkEntry:addResponse("I would love to meet a fairy. I know they lived there.");
talkEntry:addResponse("Maybe a fairy can cast a spell on me, so I could join them in their world.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Da waren Feen irgendwo in dieser Welt.");
talkEntry:addResponse("Ich w�rde soo gern mal eine Fee sehen. Ich wei� sie leben dort.");
talkEntry:addResponse("Vielleicht kann eine Fee einen Zauberspruch sprechen, der mich in eine Fee verwandelt?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("Alysa Lorthelia, a regular baker I guess?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Alysa Lorthelia, eine gew�hnliche B�ckerin, oder?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cook");
talkEntry:addTrigger("Food");
talkEntry:addTrigger("Bake");
talkEntry:addResponse("I didn't think I'd love cooking so much. I was born to become fat. That's why now I never eat anything I make.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Kochen");
talkEntry:addTrigger("Essen");
talkEntry:addTrigger("backen");
talkEntry:addResponse("Ich denke nicht, dass Kochen Spa� macht. Ich kam schon fett auf die Welt. Daher esse ich nichts was ich koche.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Boob");
talkEntry:addTrigger("Breast");
talkEntry:addTrigger("Tit");
talkEntry:addResponse("Last person who tried that on with me died of syphilis. Not that I had anything to do with it!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Busen");
talkEntry:addTrigger("Brust");
talkEntry:addTrigger("Titten");
talkEntry:addResponse("Ich sehe, dass Ihr meinen Busen anstarrt, aber das st�rt mich nicht. Ich f�hle mich h�bsch, wenn Ihr starrt. Aber wagt es nicht meinen Bauch anzustarren.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Fat");
talkEntry:addTrigger("Weight");
talkEntry:addTrigger("Heavy");
talkEntry:addResponse("I met Ce, the cook there. She's so talented. We're going to have a bake off soon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Fett");
talkEntry:addTrigger("Gewicht");
talkEntry:addTrigger("Schwer");
talkEntry:addResponse("Ich traft Ce, die K�chin hier. sie ist so h�bsch und talentiert. Wir machen bald einen Kochwettbewerb.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("glass mirror");
talkEntry:addTrigger("Ce");
talkEntry:addResponse("I met Ce, the cook there. She's so talented. We're going to have a bake off soon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Glas Spiegel");
talkEntry:addTrigger("Ce");
talkEntry:addResponse("Ich traf Ce, die K�chin hier. sie ist so h�bsch und talentiert. Wir machen bald einen Kochwettbewerb.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("John Sights");
talkEntry:addResponse("He's an old man. He's nice and he gave me this job. Though he does look at me a funny way sometimes.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("John Sights");
talkEntry:addResponse("Er ist ein alter Mann. Er ist nett und gab mir den Job hier. Manchmal starrt er auf meinen Busen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Mother");
talkEntry:addTrigger("Mom");
talkEntry:addTrigger("Aysha");
talkEntry:addResponse("Mum constantly works. I don't think I've ever seen her sleep.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Mutter");
talkEntry:addTrigger("Mama");
talkEntry:addTrigger("Aysha");
talkEntry:addResponse("Mutti arbeiter immer. Immer. Ich glaube ich habe sie noch nie schlafend gesehen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Father");
talkEntry:addTrigger("Dad");
talkEntry:addResponse("Dad only works a few hours a week, but he's always out of the house, and the house is always messy.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Vater");
talkEntry:addTrigger("Papa");
talkEntry:addResponse("Vater arbeitet nur ein paar Stunden in der Woche, aber er ist st�ndig unterwegs und zu Hause herrscht Unordnung.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sister");
talkEntry:addResponse("I'm glad I don't have to watch her. She's annoying.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Schwester");
talkEntry:addResponse("Ich bin froh, dass ich nicht auf sie aufpassen muss. Diese Nervens�ge.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addResponse("The Archmage only uses enchanted weapons made by Asha Lorthelia, my mother.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Der Erzmagier nutzt nichts au�er den verzauberten Waffen, welche meine Mutter, Asha Lorthelia, hergestellt hat.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Who? Oh.. right, that guy.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Wer? Ach.. richtig, der.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("I live here. I don't really dwell on it.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Ich lebe hier. Ich denke nichts anderes �ber diesen Ort.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("My mother doesn't care for him, no idea why.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Meine Mutter sagt, er sei ihr egal. Ich verstehe das nicht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("I've been there a few times with my mother and father. It's a dirty place, you wouldn't find my wares anywhere near that.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Ich war da mehrere Male mit meiner Mutter und meinem Vater. Es ist ein dreckiger Ort, Waren wie die meinen w�rde man dort nie finden!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Queen");
talkEntry:addResponse("She's too pretty. The gods were a lot fairer to her than to me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("K�nigin");
talkEntry:addResponse("Sie ist einfach zu h�bsch. Die G�tter waren ihr besser gesonnen als mir.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("She's too pretty. The gods were a lot fairer to her than to me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Sie ist einfach zu h�bsch. Die G�tter waren ihr besser gesonnen als mir.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Too much sun for my liking, but I enjoyed visiting the tavern.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Da ist es mir zu sonnig. Aber ich mochte den Besuch in der Taverne.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("albar");
talkEntry:addResponse("My father says that they only care about faction related drivel.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("Mein Vater sagt nur dumme Leute k�mmern sich um den Streit zwischen den Fraktionen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addResponse("My father says that they only care about faction related drivel.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("Mein Vater sagt nur dumme Leute k�mmern sich um den Streit zwischen den Fraktionen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("salkama");
talkEntry:addResponse("My father says that they only care about faction related drivel.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Mein Vater sagt nur dumme Leute k�mmern sich um den Streit zwischen den Fraktionen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("The gods cursed me with this body. The only god I will serve is one who will make me pretty.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("G�tter");
talkEntry:addResponse(" die G�tter straften mich mit diesem K�rper. Der einzige Gott zu dem ich beten werde, ist der, der mir Sch�nheit gibt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("I wish I was a fairy.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erz�hl was");
talkEntry:addTrigger("erz�hl etwas");
talkEntry:addResponse("Ich w�re so gerne eine Fee.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Alysa ");
talkEntry:addTrigger("Lorthelia");
talkEntry:addResponse("That's me, Alysa Lorthelia.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Alysa");
talkEntry:addTrigger("Lorthelia");
talkEntry:addResponse("Das bin ich, Alysa Lorthelia.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("Okay.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("In Ordnung.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("Oh no!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("Oh..nein!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("That has nothing to do with me. I'm sorry.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Das hat nichts mit mir zu tun, entschuldigt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("Dieses M�dchen ist so d�nn.", "That girl is so skinny.");
talkingNPC:addCycleText("Ich habe Hunger. Ich meine, ich habe keinen Hunger.", "Ugh.. I'm hungry. No I'm not! Mind over matter!");
talkingNPC:addCycleText("Kommt, esst mein Brot, schmeckt besser als cadomyrische Sandratte!", "Come and eat my bread! It's better than a Cadomyrian sand rat. At least.. I hope so.");
talkingNPC:addCycleText("Der alte John Sights sagte mir, ich solle Euch sagen, dass ich Alysa Lorthelia bin, die Tochter der Waffenschmiedin Asha Lorthelia.", "Old John Sights asked me to tell everyone that I'm Alysa Lorthelia, daughter of Aysha the armourer!");
talkingNPC:addCycleText("Ich backe Brot so gut, wie meine Mutter Waffen herstellt.", "I bake bread just as well as my mother crafts weapons!");
talkingNPC:addCycleText("Mein Magen schmerzt. Dieses Brot um mich herum. Das ist Folter!", "My stomach hurts. All this bread around me. It's torture!");
talkingNPC:addCycleText("Calthors kurze Abhandlung �ber die Geschichte der Feen ist das beste Buch, das ich jemals gelesen habe.", "The Calthor Digest on the history of fairies is the best book I've ever read!");
talkingNPC:addCycleText("Wohin ist Papa schon wieder verschwunden? Er ist st�ndig weg!", "Dad wandered off again.. but where to? He's always gone!");
talkingNPC:addCycleText("Ich werde Ce-Ce im Kochwettbewerb schlagen.", "I will destroy Ce-Ce in the next cook-off.");
talkingNPC:addCycleText("Ich frage mich, ob Mutter sich jemals einen freien Tag g�nnt.", "I wonder if mum ever takes a day off.");
tradingNPC:addItem(npc.base.trade.tradeNPCItem(51,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(121,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(227,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1153,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(354,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(303,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(353,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(453,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(454,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(49,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(191,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2529,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1155,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(554,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(559,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(555,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(557,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2922,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1154,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2277,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(556,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2459,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1152,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2276,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2278,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2456,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2923,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(306,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2940,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(3051,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1909,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(51,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(121,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(227,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(118,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2495,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1153,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(354,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(303,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(353,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(453,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(454,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(49,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(191,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(5,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2529,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1155,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(554,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(559,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(555,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(557,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2922,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1154,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2277,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(556,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2459,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1152,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2276,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2278,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2456,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2923,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(306,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2940,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(3051,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1909,"buySecondary"));
tradingNPC:addNotEnoughMoneyMsg("Du hast nicht genug Geld!", "You don't have enough money!");
tradingNPC:addDialogClosedMsg("Danke, komm doch bald wieder.", "Thanks, come back soon.");
tradingNPC:addDialogClosedNoTradeMsg("Nichts gefunden was dir gef�llt?", "Don't you like my wares?");
tradingNPC:addWrongItemMsg("Das kaufe ich nicht.", "I'm not buying this.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(1);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Eine gro�e, edle Frau steht hinter der Theke und bereitet emsig Essen zu.", "A tall, proud woman stands behind the counter, preparing food quickly.");
mainNPC:setUseMessage("Fass mich nicht an!", "Hands off!");
mainNPC:setConfusedMessage("#me schaut dich verwirrt an.", "#me looks at you confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 847);
mainNPC:setEquipment(11, 0);
mainNPC:setEquipment(5, 0);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 48);
mainNPC:setEquipment(9, 34);
mainNPC:setEquipment(10, 53);
mainNPC:setAutoIntroduceMode(true);

mainNPC:initDone();
end;

function receiveText(npcChar, texttype, message, speaker) mainNPC:receiveText(npcChar, texttype, speaker, message); end;
function nextCycle(npcChar) mainNPC:nextCycle(npcChar); end;
function lookAtNpc(npcChar, char, mode) mainNPC:lookAt(npcChar, char, mode); end;
function useNPC(npcChar, char, counter, param) mainNPC:use(npcChar, char); end;
initNpc();
initNpc = nil;
-- END
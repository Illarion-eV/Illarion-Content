--------------------------------------------------------------------------------
-- NPC Name: Nana Winterbutter                                           None --
-- NPC Job:  none                                                             --
--                                                                            --
-- NPC Race: halfling                   NPC Position:  791, 798, 0            --
-- NPC Sex:  female                     NPC Direction: south                  --
--                                                                            --
-- Author:   Estralis Seborian                                                --
--                                                                            --
-- Last parsing: May 12, 2011                            easyNPC Parser v1.02 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (2, 791, 798, 0, 4, 'Nana Winterbutter', 'npc.nana_winterbutter', 1, 2, 5, 123, 62, 9, 245, 180, 137);
---]]

require("npc.base.basic")
require("npc.base.condition.item")
require("npc.base.condition.language")
require("npc.base.condition.quest")
require("npc.base.condition.town")
require("npc.base.consequence.deleteitem")
require("npc.base.consequence.inform")
require("npc.base.consequence.item")
require("npc.base.consequence.money")
require("npc.base.consequence.quest")
require("npc.base.consequence.rankpoints")
require("npc.base.consequence.skill")
require("npc.base.talk")
module("npc.nana_winterbutter", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 0");
talkEntry:addResponse("Quest status set to 0");
talkEntry:addConsequence(npc.base.consequence.quest.quest(70, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 1");
talkEntry:addResponse("Quest status set to 1");
talkEntry:addConsequence(npc.base.consequence.quest.quest(70, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 2");
talkEntry:addResponse("Quest status set to 2");
talkEntry:addConsequence(npc.base.consequence.quest.quest(70, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 3");
talkEntry:addResponse("Quest status set to 3");
talkEntry:addConsequence(npc.base.consequence.quest.quest(70, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 4");
talkEntry:addResponse("Quest status set to 4");
talkEntry:addConsequence(npc.base.consequence.quest.quest(70, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 5");
talkEntry:addResponse("Quest status set to 5");
talkEntry:addConsequence(npc.base.consequence.quest.quest(70, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 6");
talkEntry:addResponse("Quest status set to 6");
talkEntry:addConsequence(npc.base.consequence.quest.quest(70, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 7");
talkEntry:addResponse("Quest status set to 7");
talkEntry:addConsequence(npc.base.consequence.quest.quest(70, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 8");
talkEntry:addResponse("Quest status set to 8");
talkEntry:addConsequence(npc.base.consequence.quest.quest(70, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is the cook Nana Winterbutter. Keyphrases: Hello, quest, bowl, cook, cooking."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist die Köchin Nana Winterbutter. Schlüsselwörter: Hallo, Quest, Schüssel, Koch, Kochen."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hello");
talkEntry:addTrigger("Greetings");
talkEntry:addTrigger("Be greeted");
talkEntry:addTrigger("Hail");
talkEntry:addTrigger("Good day");
talkEntry:addTrigger("Good morning");
talkEntry:addTrigger("Good evening");
talkEntry:addResponse("Greetings! Maybe you could help me with a recipe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Grüße");
talkEntry:addTrigger("Gruß");
talkEntry:addTrigger("Seid gegrüßt");
talkEntry:addTrigger("Guten Tag");
talkEntry:addTrigger("Guten Abend");
talkEntry:addTrigger("Mahlzeit");
talkEntry:addTrigger("Tach");
talkEntry:addTrigger("Moin");
talkEntry:addResponse("Seid gegrüßt! Vielleicht könntet Ihr mir bei einem Rezept helfen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greebas");
talkEntry:addTrigger("Greebs");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Greetings! Maybe you could help me with a recipe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greebas");
talkEntry:addTrigger("Greebs");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Seid gegrüßt! Vielleicht könntet Ihr mir bei einem Rezept helfen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Good bye");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare thee well");
talkEntry:addResponse("Farewell!");
talkEntry:addResponse("Oldra's blessing!");
talkEntry:addResponse("Come back soon!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehabt euch wohl");
talkEntry:addResponse("Auf Wiedersehen!");
talkEntry:addResponse("Oldras Segen!");
talkEntry:addResponse("Kommt bald wieder!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Farewell!");
talkEntry:addResponse("Oldra's blessing!");
talkEntry:addResponse("Come back soon!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Auf Wiedersehen!");
talkEntry:addResponse("Oldras Segen!");
talkEntry:addResponse("Kommt bald wieder!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("I'm fine.");
talkEntry:addResponse("Thank you very much!");
talkEntry:addResponse("Well, I have this recipe in mind, which I would like to try.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addResponse("Mir geht es gut.");
talkEntry:addResponse("Vielen Dank!");
talkEntry:addResponse("Nun, ich habe dieses Rezept im Kopf, welches ich gerne ausprobieren würde.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("I am Nana Winterbutter.");
talkEntry:addResponse("I'm a cook as you might have noticed. And a good one I might add");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Ich bin Nana Winterbutter.");
talkEntry:addResponse("Ich bin eine Köchin, wie Ihr vielleicht bereits bemerkt habt. Und eine gute, wenn ich das hinzufügen darf.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("Sorry, I don't sell anything. But there are other people in Runewick. Some may even sell things to you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Tut mir leid, ich verkaufe nichts. Aber es gibt andere Leute in Runewick. Einige verkaufen Euch vielleicht auch etwas.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("I'm not much of a storyteller.");
talkEntry:addResponse("I'm just a cook. I would rather try out my new recipe instead of telling stories.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Ich bin nicht gerade eine gute Geschichtenerzählerin.");
talkEntry:addResponse("Ich bin nur eine Köchin. Ich würde viel lieber mein Rezept ausprobieren, als Geschichten zu erzählen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("cook");
talkEntry:addResponse("Yes, I'm a good cook. I just use the best materials for cooking. Right now I would like to try out this new recipe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Koch");
talkEntry:addTrigger("Köchin");
talkEntry:addResponse("Ich bin eine gute Köchin. Ich verwende nur die besten Zutaten zum Kochen. Im Moment würde ich gerne dieses neue Rezept ausprobieren.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yewdale");
talkEntry:addResponse("Yewdale is a peaceful place.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eibenthal");
talkEntry:addTrigger("Eibental");
talkEntry:addResponse("Eibenthal ist ein friedlicher Ort.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Runewick ist wundervoll. Und ich bin eine der besten Köchinnen hier.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Runewick is wonderful. And I'm one of the best cooks around here.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Ohje! Galmair ist so stinkig und dreckig!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Oh! Galmair is so smelly and dirty!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Ich war noch nie in Cadomyr. Aber ich hab gehört, es liegt im Süden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I have never visited Cadomyr myself so far. But I have heard that it is to the south.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("recipe");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 0));
talkEntry:addResponse("I have this special recipe in mind. I don't want to reveal too much about it but I would be grateful if you could help me with a quest.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Rezept");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 0));
talkEntry:addResponse("Ich habe dieses besondere Rezept im Kopf. Ich möchte nicht zu viel darüber verraten, aber ich wäre dankbar, wenn Ihr mir bei einer Aufgabe helfen würdet.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("bowl");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 0));
talkEntry:addResponse("I'm preparing some dough but it won't last. Maybe you can help me with this quest.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Schüssel");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 0));
talkEntry:addResponse("Ich rühre etwas Teig an aber der wird nicht reichen. Vielleicht könnt Ihr mir ja bei dieser Aufgabe helfen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("scythe");
talkEntry:addResponse("You can use the scythe to reap wheat once it has this nice golden colour.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sense");
talkEntry:addResponse("Ihr könnt eine Sense dafür verwenden, um Getreide zu mähen sobald es diese goldene Farbe hat.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("sickle");
talkEntry:addResponse("You can use a sickle to collect vegetables once they are ripe. Or you can use it to collect herbs and mushrooms");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sichel");
talkEntry:addResponse("Ihr könnt eine Sichel verwenden um Gemüse einzusammeln sobald es reif ist. Oder Ihr verwendet sie um Kräuter und Pilze zu sammeln.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Yewdale I"));
talkEntry:addResponse("For my recipe, I need wheat. Please take this this scythe and get me ten bundles of grain. I will then handpick the grain from the spikes myself.");
talkEntry:addConsequence(npc.base.consequence.item.item(271, 1, 399, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(70, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Eibenthal I"));
talkEntry:addResponse("Für mein Rezept brauche ich Weizen. Bitte nehmt diese Sense und bringt mir zehn Getreidebündel. Ich werde dann selbst die Samen von Hand aus den Ähren lesen.");
talkEntry:addConsequence(npc.base.consequence.item.item(271, 1, 399, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(70, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Yewdale I"));
talkEntry:addResponse("For my recipe, I need wheat. Please take this this scythe and get me ten bundles of grain. I will then handpick the grain from the spikes myself.");
talkEntry:addConsequence(npc.base.consequence.item.item(271, 1, 399, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(70, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Eibenthal I"));
talkEntry:addResponse("Für mein Rezept brauche ich Weizen. Bitte nehmt diese Sense und bringt mir zehn Getreidebündel. Ich werde dann selbst die Samen von Hand aus den Ähren lesen.");
talkEntry:addConsequence(npc.base.consequence.item.item(271, 1, 399, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(70, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("recipe");
talkEntry:addTrigger("bowl");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 1));
talkEntry:addResponse("It is very kind of you to get me ten bundles of grain. Please return to me and tell me when you are finished.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Rezept");
talkEntry:addTrigger("Schüssel");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 1));
talkEntry:addResponse("Es ist sehr nett von Euch mir zehn Getreidebündel zu besorgen. Kehrt bitte zu mir zurück und sagt mir, wenn Ihr fertig seid.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("It is very kind of you to get me ten bundles of grain. Please return to me and tell me when you are finished.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 1));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Es ist sehr nett von Euch mir zehn Getreidebündel zu besorgen. Kehrt bitte zu mir zurück und sagt mir, wenn Ihr fertig seid.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 1));
talkEntry:addResponse("It is very kind of you to get me ten bundles of grain. Please return to me and tell me when you are finished.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 1));
talkEntry:addResponse("Es ist sehr nett von Euch mir zehn Getreidebündel zu besorgen. Kehrt bitte zu mir zurück und sagt mir, wenn Ihr fertig seid.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(249, "all", ">", 9));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 50 Kupferstücke und deine Landwirtschaftsfertigkeit steigt. Dein Ansehen bei Erzmagier Elvaine Morgan steigt."));
talkEntry:addResponse("Ja, das sollte ausreichend feines Getreide sein. Vielen herzlichen Dank! Bitte nehmt diese Kupfermünzen als Zeichen meiner Dankbarkeit.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "peasantry", "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 50));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(249, 10));
talkEntry:addConsequence(npc.base.consequence.quest.quest(70, "=", 2));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Runewick", "+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(249, "all", ">", 9));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 50 copper coins and your peasantry skill increases. You advance in Archmage Elvaine Morgan's favour."));
talkEntry:addResponse("Yes, this should give plenty of fine grain. Thank you very much! Please take these copper coins as a sign of my gratitude.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "peasantry", "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 50));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(249, 10));
talkEntry:addConsequence(npc.base.consequence.quest.quest(70, "=", 2));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Runewick", "+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(249, "all", ">", 9));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 50 Kupferstücke und deine Landwirtschaftsfertigkeit steigt."));
talkEntry:addResponse("Ja, das sollte ausreichend feines Getreide sein. Vielen herzlichen Dank! Bitte nehmt diese Kupfermünzen als Zeichen meiner Dankbarkeit.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "peasantry", "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 50));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(249, 10));
talkEntry:addConsequence(npc.base.consequence.quest.quest(70, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(249, "all", ">", 9));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 50 copper coins and your peasantry skill increases."));
talkEntry:addResponse("Yes, this should give plenty of fine grain. Thank you very much! Please take these copper coins as a sign of my gratitude.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "peasantry", "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 50));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(249, 10));
talkEntry:addConsequence(npc.base.consequence.quest.quest(70, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(249, "all", "<", 10));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Es ist sehr nett von Euch mir zehn Getreidebündel zu besorgen. Kehrt bitte zu mir zurück und sagt mir, wenn Ihr fertig seid.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(249, "all", "<", 10));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("It is very kind of you to get me ten bundles of grain. Please return to me and tell me when you are finished.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("recipe");
talkEntry:addTrigger("bowl");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 2));
talkEntry:addResponse("Well, since you helped me before I might even tell you about the recipe. I think about fish in a crust with tomato sauce. But I don't have enough tomatoes and might need your help with this task again.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Rezept");
talkEntry:addTrigger("Schüssel");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 2));
talkEntry:addResponse("Nun, da Ihr mir schon zuvor geholfen habt, kann ich Euch auch etwas über das Rezept sagen. Ich denke da an Fisch im Teigmantel mit Tomatensoße. Aber ich habe nicht genug Tomaten und könnte erneut Eure Hilfe bei dieser Aufgabe gebrauchen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Yewdale II"));
talkEntry:addResponse("I'd like to cook fish in a crust with tomato sauce. I need twenty tomatoes for the sauce to the fish. Care to help me?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(70, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Eibenthal II"));
talkEntry:addResponse("I möchte Fisch im Teigmantel mit Tomatensoße kochen. Ich brauchen zwanzig Tomaten für die Soße. Könnt ihr mir helfen?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(70, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Yewdale II"));
talkEntry:addResponse("I'd like to cook fish in a crust with tomato sauce. I need twenty tomatoes for the sauce to the fish. Care to help me?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(70, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Eibenthal II"));
talkEntry:addResponse("I möchte Fisch im Teigmantel mit Tomatensoße kochen. Ich brauchen zwanzig Tomaten für die Soße. Könnt ihr mir helfen?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(70, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 3));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Please bring me twenty tomatoes for my sauce.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 3));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Bitte bringt mir zwanzig Tomaten für meine Soße.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 3));
talkEntry:addResponse("Please bring me twenty tomatoes for my sauce.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 3));
talkEntry:addResponse("Bitte bringt mir zwanzig Tomaten für meine Soße.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(200, "all", ">", 19));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 100 Kupferstücke und deine Landwirtschaftsfertigkeit steigt. Dein Ansehen bei Erzmagier Elvaine Morgan steigt."));
talkEntry:addResponse("Großartig! Zwanzig reife Tomaten. Das wird in der Tat eine feine Soße ergeben. Bitte nehmt diese Kupfermünzen. Aber mein Gericht ist noch nicht fertig.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "peasantry", "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(200, 20));
talkEntry:addConsequence(npc.base.consequence.quest.quest(70, "=", 4));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Runewick", "+", 10));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(200, "all", ">", 19));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 100 copper coins and your peasantry skill increases. You advance in Archmage Elvaine Morgan's favour."));
talkEntry:addResponse("Great! Twenty ripe tomatoes. That will give a very fine sauce indeed. Please take these copper coins. But my recipe is still not finished.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "peasantry", "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(200, 20));
talkEntry:addConsequence(npc.base.consequence.quest.quest(70, "=", 4));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Runewick", "+", 10));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(200, "all", ">", 19));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 100 Kupferstücke und deine Landwirtschaftsfertigkeit steigt."));
talkEntry:addResponse("Großartig! Zwanzig reife Tomaten. Das wird in der Tat eine feine Soße ergeben. Bitte nehmt diese Kupfermünzen. Aber mein Gericht ist noch nicht fertig.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "peasantry", "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(200, 20));
talkEntry:addConsequence(npc.base.consequence.quest.quest(70, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(200, "all", ">", 19));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 100 copper coins and your peasantry skill increases."));
talkEntry:addResponse("Great! Twenty ripe tomatoes. That will give a very fine sauce indeed. Please take these copper coins. But my recipe is still not finished.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "peasantry", "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(200, 20));
talkEntry:addConsequence(npc.base.consequence.quest.quest(70, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(200, "all", "<", 20));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Würdet Ihr mir bitte zwanzig Tomaten bringen? Ich danke Euch vielmals!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(200, "all", "<", 20));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Would you please bring me twenty tomatoes? I thank you very much!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("recipe");
talkEntry:addTrigger("bowl");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 4));
talkEntry:addResponse("You've helped with my recipe quite a lot so far. Please, don't think that I'm ungrateful, but I might have another task for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Rezept");
talkEntry:addTrigger("Schüssel");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 4));
talkEntry:addResponse("Ihr habt mir schon sehr bei meinem Rezept geholfen. Bitte, denkt nicht, dass ich undankbar bin, aber ich hätte da noch eine Aufgabe für Euch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Yewdale III"));
talkEntry:addResponse("I think some onions would spice up the sauce. See if you can find at least five onions, please.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(70, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 4));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Eibenthal III"));
talkEntry:addResponse("Ich denke, ein paar Zwiebeln würden die Soße etwas aufpeppen. Versucht bitte, mindestens fünf Zwiebeln zu finden.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(70, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 4));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Yewdale III"));
talkEntry:addResponse("I think some onions would spice up the sauce. See if you can find at least five onions, please.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(70, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 4));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Eibenthal III"));
talkEntry:addResponse("Ich denke, ein paar Zwiebeln würden die Soße etwas aufpeppen. Versucht bitte, mindestens fünf Zwiebeln zu finden.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(70, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 5));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I hope you are able to find at least five onions so that I can spice up my sauce.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 5));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Ich hoffe Ihr könnt mindestens fünf Zwiebeln finden, so dass ich meine Soße etwas aufpeppen kann.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 5));
talkEntry:addResponse("I hope you are able to find at least five onions so that I can spice up my sauce.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 5));
talkEntry:addResponse("Ich hoffe Ihr könnt mindestens fünf Zwiebeln finden, so dass ich meine Soße etwas aufpeppen kann.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(201, "all", ">", 4));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 100 Kupferstücke und deine Landwirtschaftsfertigkeit steigt. Dein Ansehen bei Erzmagier Elvaine Morgan steigt."));
talkEntry:addResponse("Fantastisch! Ihr habt wirklich fünf Zwiebeln auftreiben können. Hier, nehmt ein paar Kupferstücke im Austausch. Aber wie peinlich, ich habe nun ein Problem mit dem Rezept.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "peasantry", "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(201, 5));
talkEntry:addConsequence(npc.base.consequence.quest.quest(70, "=", 6));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Runewick", "+", 15));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(201, "all", ">", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 100 copper coins and your peasantry skill increases. You advance in Archmage Elvaine Morgan's favour."));
talkEntry:addResponse("Fantastic! You've really managed to come up with five onions. Here, have some copper coins. But how embarrassing, I have a probem with the recipe now.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "peasantry", "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(201, 5));
talkEntry:addConsequence(npc.base.consequence.quest.quest(70, "=", 6));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Runewick", "+", 15));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(201, "all", ">", 4));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 100 Kupferstücke und deine Landwirtschaftsfertigkeit steigt."));
talkEntry:addResponse("Fantastisch! Ihr habt wirklich fünf Zwiebeln auftreiben können. Hier, nehmt ein paar Kupferstücke im Austausch. Aber wie peinlich, ich habe nun ein Problem mit dem Rezept.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "peasantry", "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(201, 5));
talkEntry:addConsequence(npc.base.consequence.quest.quest(70, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(201, "all", ">", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 100 copper coins and your peasantry skill increases."));
talkEntry:addResponse("Fantastic! You've really managed to come up with five onions. Here, have some copper coins. But how embarrassing, I have a probem with the recipe now.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "peasantry", "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(201, 5));
talkEntry:addConsequence(npc.base.consequence.quest.quest(70, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(201, "all", "<", 5));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Ich weiß, dass sie schwer zu finden sind, aber ich bräuchte mindestens fünf Zwiebeln.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(201, "all", "<", 5));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I know that they are hard to find but I would need at least five onions.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("problem");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 6));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("How embarrassing! I was not careful enough with storing the fish for my recipe and now it is rotten. I hope that you can help me one last time with the task to get new fish.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Problem");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 6));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Wie peinlich! Ich war bei der Lagerung des Fisch, den ich verwenden will, nicht sorgfältig genug und nun ist er verdorben. Ich hoffe, Ihr helft mir ein letztes Mal bei der Besorgung von neuem Fisch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("recipe");
talkEntry:addTrigger("bowl");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 6));
talkEntry:addResponse("How embarrassing! I was not careful enough with storing the fish for my recipe and now it is rotten. I hope that you can help me one last time with the task to get new fish.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Rezept");
talkEntry:addTrigger("Schüssel");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 6));
talkEntry:addResponse("Wie peinlich! Ich war bei der Lagerung des Fisch, den ich verwenden will, nicht sorgfältig genug und nun ist er verdorben. Ich hoffe, Ihr helft mir ein letztes Mal bei der Besorgung von neuem Fisch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 6));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Yewdale IV"));
talkEntry:addResponse("I usually buy fish from Zerarisa. I am really sorry, but I always forget what this fish is called. But I need ten of these fish again.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(70, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 6));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Eibenthal IV"));
talkEntry:addResponse("Normalerweise kaufe ich Fisch von Zerarisa. Tut mir wirklich leid, aber ich vergesse immer, wie dieser Fisch heißt. Aber ich bräuchte wieder zehn von diesen Fischen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(70, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 6));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Yewdale IV"));
talkEntry:addResponse("I usually buy fish from Zerarisa. I am really sorry, but I always forget what this fish is called. But I need ten of these fish again.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(70, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 6));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Eibenthal IV"));
talkEntry:addResponse("Normalerweise kaufe ich Fisch von Zerarisa. Tut mir wirklich leid, aber ich vergesse immer, wie dieser Fisch heißt. Aber ich bräuchte wieder zehn von diesen Fischen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(70, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zerarisa");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 7));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Oh, Zerarisa, she is one of the lizard people who live in Cadomyr at Cape Farewell. She comes to Runewick once a month to sell fish.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zerarisa");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 7));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Oh, Zerarisa, sie ist eine von den Echsenleuten, die in Cadomyr am Kap des Abschiedes leben. Sie kommt einmal im Monat nach Runewick um Fisch zu verkaufen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 7));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Habt Ihr schon mit Zerarisa über die Fische gesprochen, die ich normalerweise bei ihr kaufe? Ich brauche wirklich zehn von diesen Fischen, um mein Rezept auszuprobieren.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 7));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Did you already speak to Zerarisa about the fish I usually buy from her? I really need ten of these fish to try out my recipe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 7));
talkEntry:addResponse("Did you already speak to Zerarisa about the fish I usually buy from her? I really need ten of these fish to try out my recipe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 7));
talkEntry:addResponse("Habt Ihr schon mit Zerarisa über die Fische gesprochen, die ich normalerwiese bei ihr kaufe? Ich brauche wirklich zehn von diesen Fischen, um mein Rezept auszuprobieren.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salmon");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(355, "all", "<", 10));
talkEntry:addResponse("Salmon? Yes, that could be the name of the fish. Now that you mention it. I think Zerarisa mentioned that name. But I need ten salmons for my recipe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Lachs");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(355, "all", "<", 10));
talkEntry:addResponse("Lachs? Ja, das könnte der Name des Fisches sein. Jetzt wo Ihr es erwähnt. Ich denke Zerarisa hat mal diesen Namen erwähnt. Aber ich brauche zehn Lachse für mein Rezept.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(355, "all", ">", 9));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 200 Kupferstücke und deine Landwirtschaftsfertigkeit steigt. Dein Ansehen bei Erzmagier Elvaine Morgan steigt."));
talkEntry:addResponse("Wunderbar! Ja, dies ist genau der Fisch, den ich brauche. Hier, sie sind jedes Kupferstück wert. Ich bin so glücklich, dass ich jetzt alles für meine Rezpet habe. Möge Oldra Euch segnen!");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "peasantry", "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 200));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(355, 10));
talkEntry:addConsequence(npc.base.consequence.quest.quest(70, "=", 8));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Runewick", "+", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(355, "all", ">", 9));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 200 copper coins and your peasantry skill increases. You advance in Archmage Elvaine Morgan's favour."));
talkEntry:addResponse("Wonderful! Yes, this is exactly the fish I need. Here, this is more than worth the copper. I'm so happy that I have everything for my recipe now. May Oldra bless you!");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "peasantry", "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 200));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(355, 10));
talkEntry:addConsequence(npc.base.consequence.quest.quest(70, "=", 8));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Runewick", "+", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(355, "all", ">", 9));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 200 Kupferstücke und deine Landwirtschaftsfertigkeit steigt."));
talkEntry:addResponse("Wunderbar! Ja, dies ist genau der Fisch, den ich brauche. Hier, sie sind jedes Kupferstück wert. Ich bin so glücklich, dass ich jetzt alles für meine Rezpet habe. Möge Oldra Euch segnen!");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "peasantry", "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 200));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(355, 10));
talkEntry:addConsequence(npc.base.consequence.quest.quest(70, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(355, "all", ">", 9));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 200 copper coins and your peasantry skill increases."));
talkEntry:addResponse("Wonderful! Yes, this is exactly the fish I need. Here, this is more than worth the copper. I'm so happy that I have everything for my recipe now. May Oldra bless you!");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "peasantry", "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 200));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(355, 10));
talkEntry:addConsequence(npc.base.consequence.quest.quest(70, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(355, "all", "<", 10));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Ich brauche wirklich zehn von diesen Fischen, die mir Zerarisa normalerweise verkauft. Könntet Ihr die bitte für mich besorgen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(355, "all", "<", 10));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I really need ten of the fish that Zerarisa usually sells me. Would you please get them for me?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("recipe");
talkEntry:addTrigger("bowl");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 8));
talkEntry:addResponse("Thanks to you I finally have all the ingredients I need to try out my new recipe. I thank you with all my heart!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Rezept");
talkEntry:addTrigger("Schüssel");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 8));
talkEntry:addResponse("Dank Euch habe ich endlich alle Zutaten zusammen, um mein neues Rezept auszuprobieren. Ich danke Euch von ganzem Herzen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 8));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("You have already done way too much for me. I will always keep you in good memory. You are truly a hero to me! May Oldra bless you!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 8));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Ihr habt bereits viel zu viel für mich getan. Ich werde Euch immer in guter Erinnerung behalten. Ihr seid wahrlich ein Held für mich! Möge Oldra Euch segnen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 8));
talkEntry:addResponse("You have already done way too much for me. I will always keep you in good memory. You are truly a hero to me! May Oldra bless you!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(70, "=", 8));
talkEntry:addResponse("Ihr habt bereits viel zu viel für mich getan. Ich werde Euch immer in guter Erinnerung behalten. Ihr seid wahrlich ein Held für mich! Möge Oldra Euch segnen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("Pardon, I don't understand what you are referring to.");
talkEntry:addResponse("What do you mean with 'Yes'?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("Verzeiht, aber ich verstehe nicht, worauf Ihr Euch bezieht.");
talkEntry:addResponse("Was meint Ihr mit 'Ja'?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("Pardon, I don't understand what you are referring to.");
talkEntry:addResponse("What do you mean with 'No'?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("Verzeiht, aber ich verstehe nicht, worauf Ihr Euch bezieht.");
talkEntry:addResponse("Was meint Ihr mit 'Nein'?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("grain");
talkEntry:addResponse("Grain can be used as seed or you can grind it to flour. Put the grain on fertile land and the crop will grow.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Getreide");
talkEntry:addTrigger("Korn");
talkEntry:addTrigger("Körner");
talkEntry:addResponse("Getreidekörner können als Saatgut verwendet werden oder man zermahlt sie zu Mehl. Gib die Saat auf fruchtbares Land und das Getreide wird wachsen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tomato");
talkEntry:addResponse("You can put tomato seeds into fertile soil. Be sure to fasten the growing plants to poles so that it grows straight up.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tomate");
talkEntry:addResponse("Ihr könnt Tomatensamen in fruchtbaren Boden geben. Geht sicher die heranwachsenden Pflanzen an Stangen zu befestigen, damit sie senkrecht nach oben wachsen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mushroom");
talkEntry:addResponse("Mushrooms love shadowy places and can be found in forests. You will need a sharp sickle to gather them.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Pilze");
talkEntry:addTrigger("Champignon");
talkEntry:addResponse("Pilze lieben schattige Plätze und können in Wäldern gefunden werden. Ihr werdet eine scharfe Sichel brauchen, um sie zu sammeln.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("fish");
talkEntry:addResponse("I know how to prepare fish but it seems that I always forget how the fish are called. You better ask someone else if you want to know more about fish.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Fisch");
talkEntry:addResponse("Ich weiß wie man Fisch zubereitet, aber es scheint, als würde ich immer vergessen, wie die Fischen heißen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("onion");
talkEntry:addResponse("Onions are tasty, aren't they? But your breath turns... bah!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("zwiebeln");
talkEntry:addResponse("Zwiebeln sind lecker, nicht wahr? Aber dein Atem... igitt!");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me rührt etwas Teig in einer Schüssel in ihrem linken Arm um.", "#me stirs some dough in a bowl in her left arm.");
talkingNPC:addCycleText("#me starrt besorgt in die Schüssel in ihrem linken Arm.", "#me stares worryingly into the bowl in her left arm.");
talkingNPC:addCycleText("Das wird nie und nimmer reichen.", "This won't never ever last.");
talkingNPC:addCycleText("#me gießt vorsichtig etwas Wasser in Schüssel in ihrem linken Arm.", "#me pours carefully some water into the bowl in her left arm.");
talkingNPC:addCycleText("Vielleicht sollte ich doch etwas anderes kochen.", "Maybe I should cook something else.");
talkingNPC:addCycleText("Willkommen im Eibenthal!", "Welcome to Yewdale!");
talkingNPC:addCycleText("#me nascht von einem Teig, den sie gerade anrührt.", "#me tastes a dough she's stirring.");
talkingNPC:addCycleText("Und noch etwas Knoblauch... oder besser nicht?", "And a little bit of garlic... or not?");
talkingNPC:addCycleText("Ohje, ohje.", "O my dear.");
talkingNPC:addCycleText("Das wird lecker!", "That's going to be tasty!");
mainNPC:addLanguage(0);
mainNPC:addLanguage(5);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Das ist ein NPC dessen Entwickler zu faul war eine Beschreibung einzutragen.", "This is a NPC who's developer was too lazy to type in a description.");
mainNPC:setUseMessage("Fass mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut dich verwirrt an.", "#me looks at you confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 181);
mainNPC:setEquipment(11, 0);
mainNPC:setEquipment(5, 0);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 48);
mainNPC:setEquipment(9, 34);
mainNPC:setEquipment(10, 53);
mainNPC:setAutoIntroduceMode(true);

mainNPC:initDone();
end;

function receiveText(texttype, message, speaker) mainNPC:receiveText(speaker, message); end;
function nextCycle() mainNPC:nextCycle(); end;
function lookAtNpc(char, mode) mainNPC:lookAt(char, mode); end;
function useNPC(char, counter, param) mainNPC:use(char); end;
initNpc();
initNpc = nil;
-- END
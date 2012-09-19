--------------------------------------------------------------------------------
-- NPC Name: Otto Sauerteig                                              None --
-- NPC Job:  none                                                             --
--                                                                            --
-- NPC Race: halfling                   NPC Position:  -19, 0, 0              --
-- NPC Sex:  male                       NPC Direction: south                  --
--                                                                            --
-- Author:   not set                                                          --
--                                                                            --
-- Last parsing: April 11, 2011                          easyNPC Parser v1.02 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (2, -19, 0, 0, 4, 'Otto Sauerteig', 'npc.otto_sauerteig', 0, 2, 5, 123, 62, 9, 245, 180, 137);
---]]

require("npc.base.basic")
require("npc.base.condition.item")
require("npc.base.condition.language")
require("npc.base.condition.quest")
require("npc.base.condition.race")
require("npc.base.condition.state")
require("npc.base.consequence.deleteitem")
require("npc.base.consequence.inform")
require("npc.base.consequence.item")
require("npc.base.consequence.quest")
require("npc.base.consequence.state")
require("npc.base.talk")
module("npc.otto_sauerteig", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("geschichte");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Otto hat ein Problem! Vielleicht solltest du ihn danach fragen."));
talkEntry:addResponse("Ich bin Otto Sauerteig. Ich und mein Bruder Martin haben diesen kleinen Hof hier. Es ist so wunderbar! Bis auf dieses kleine Problem.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("story");
talkEntry:addTrigger("tale");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Otto seems to have a problem! Maybe you should ask him about that."));
talkEntry:addResponse("I am Otto Sauerteig. Me and my brother Martin own this small farmyard. It's marvellous, except for one small problem.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("verkauf");
talkEntry:addTrigger("was kauft");
talkEntry:addTrigger("was kaufst");
talkEntry:addCondition(npc.base.condition.state.state("<", 2));
talkEntry:addCondition(npc.base.condition.quest.quest(27, "=<", 1));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Otto hat ein Problem! Vielleicht solltest du ihn dannach fragen."));
talkEntry:addResponse("Ich verkaufe leider nichts, allerdings hätte ich da ein Problem, bei dem du mir helfen könntest.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("sell");
talkEntry:addTrigger("what buy");
talkEntry:addCondition(npc.base.condition.state.state("<", 2));
talkEntry:addCondition(npc.base.condition.quest.quest(27, "=<", 1));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Otto seems to have a problem! Maybe you should ask him about that."));
talkEntry:addResponse("I unfortunately don't sell anything, but I have a problem you could help me with.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("verdienen");
talkEntry:addTrigger("aufgabe");
talkEntry:addTrigger("abenteuer");
talkEntry:addCondition(npc.base.condition.state.state("<", 2));
talkEntry:addCondition(npc.base.condition.quest.quest(27, "=<", 1));
talkEntry:addResponse("Ja natürlich, dieser Fuchs, der macht mich wahnsinnig. Immerzu streift er hinterm Haus rum! Dann verjage ich ihn mit Steinen. Du könntest aber mit einem anderen Problem helfen. Bist du tapfer?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 6));
talkEntry:addConsequence(npc.base.consequence.quest.quest(27, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addCondition(npc.base.condition.state.state("<", 2));
talkEntry:addCondition(npc.base.condition.quest.quest(27, "=<", 1));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Ja natürlich, dieser Fuchs, der macht mich wahnsinnig. Immerzu streift er hinterm Haus rum! Dann verjage ich ihn mit Steinen. Du könntest aber mit einem anderen Problem helfen. Bist du tapfer?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 6));
talkEntry:addConsequence(npc.base.consequence.quest.quest(27, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addCondition(npc.base.condition.state.state("<", 2));
talkEntry:addCondition(npc.base.condition.quest.quest(27, "=<", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Yes of course, there is this fox which drives me crazy. All the time, it gazes around my house. Then I usually chase it away with stones. But you could help me with another problem. Are you brave?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 6));
talkEntry:addConsequence(npc.base.consequence.quest.quest(27, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("money");
talkEntry:addTrigger("earn");
talkEntry:addCondition(npc.base.condition.state.state("<", 2));
talkEntry:addCondition(npc.base.condition.quest.quest(27, "=<", 1));
talkEntry:addResponse("Yes of course, there is this fox which drives me crazy. All the time, it gazes around my house. Then I usually chase it away with stones. But you could help me with another problem. Are you brave?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 6));
talkEntry:addConsequence(npc.base.consequence.quest.quest(27, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ja");
talkEntry:addCondition(npc.base.condition.state.state("=", 6));
talkEntry:addCondition(npc.base.condition.quest.quest(27, "=", 1));
talkEntry:addResponse("Fantastisch. Ich hab's dir angesehen sonst hätte ich nicht gefragt. In unserem Keller, wo unsere Vorräte gelagert sind. Da ist so eine lästige Sache. Das Ding frisst alles auf. Kannst du es verjagen?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("yes");
talkEntry:addCondition(npc.base.condition.state.state("=", 6));
talkEntry:addCondition(npc.base.condition.quest.quest(27, "=", 1));
talkEntry:addResponse("Fantastic. I wouldn't have asked if i wouldn't have noticed when looking at you. There is a nasty thing in our cellar where we store our supplies. It's eating everything. Maybe you can chase it away?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("nein");
talkEntry:addCondition(npc.base.condition.state.state("=", 6));
talkEntry:addCondition(npc.base.condition.quest.quest(27, "=", 1));
talkEntry:addResponse("Oh! Keine Sache. Ich bin ja auch nicht so mutig. Ich frage jemand anderes.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("no");
talkEntry:addCondition(npc.base.condition.state.state("=", 6));
talkEntry:addCondition(npc.base.condition.quest.quest(27, "=", 1));
talkEntry:addResponse("Oh! No problem. I'm not that brave either. I'll ask someone else.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("yes");
talkEntry:addCondition(npc.base.condition.state.state("=", 7));
talkEntry:addCondition(npc.base.condition.quest.quest(27, "=", 1));
talkEntry:addConsequence(npc.base.consequence.inform.inform("The halfling slides the key of the cellar between your fingers. You better put on some good shoes before you go downstairs. Who knows what is waiting down there for you?"));
talkEntry:addResponse("I'm so glad that you wanna give it a try. Take the key for the cellar and chase the nasty thing away. Ask me for 'Informations' when i shall repeat the details.");
talkEntry:addConsequence(npc.base.consequence.item.item(2161, 1, 333, 20));
talkEntry:addConsequence(npc.base.consequence.quest.quest(27, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ja");
talkEntry:addCondition(npc.base.condition.state.state("=", 7));
talkEntry:addCondition(npc.base.condition.quest.quest(27, "=", 1));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Der Halbling steckt dir den Schlüssel zum Keller des Hauses zwischen die Finger. Am besten ziehst du gute Schuhe an, bevor du nach unten gehst, wer weiß was auf dich wartet?"));
talkEntry:addResponse("Ich bin so froh, das du das machen willst. Nimm diesen Kellerschlüssel und verjag das Ding. Frage mich nach 'Informationen' wenn ich die Details wiederholen soll.");
talkEntry:addConsequence(npc.base.consequence.item.item(2161, 1, 333, 20));
talkEntry:addConsequence(npc.base.consequence.quest.quest(27, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("no");
talkEntry:addCondition(npc.base.condition.state.state("=", 7));
talkEntry:addCondition(npc.base.condition.quest.quest(27, "=", 1));
talkEntry:addResponse("Oh! No problem. I'm not that brave either. I'll ask someone else.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("nein");
talkEntry:addCondition(npc.base.condition.state.state("=", 7));
talkEntry:addCondition(npc.base.condition.quest.quest(27, "=", 1));
talkEntry:addResponse("Oh! Keine Sache. Ich bin ja auch nicht so mutig. Ich frage jemand anderes.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("info");
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("detail");
talkEntry:addCondition(npc.base.condition.quest.quest(27, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(2161, "all", "=>", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("You better put on some good shoes before you go downstairs. Who knows what is waiting down there for you?"));
talkEntry:addResponse("Open the door of the cellar with the key which i have given you. Try to chase the thing inside away. It's eating all the supplies!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("key");
talkEntry:addCondition(npc.base.condition.quest.quest(27, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(2161, "all", "=>", 1));
talkEntry:addConsequence(npc.base.consequence.inform.inform("You better put on some good shoes before you go downstairs. Who knows what is waiting down there for you?"));
talkEntry:addResponse("Open the door of the cellar with the key which i have given you. Try to chase the thing inside away. It's eating all the supplies!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("aufgabe");
talkEntry:addTrigger("abenteuer");
talkEntry:addTrigger("schl[uü]ssel");
talkEntry:addCondition(npc.base.condition.quest.quest(27, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(2161, "all", "=>", 1));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Am besten ziehst du gute Schuhe an, bevor du nach unten gehst, wer weiß was auf dich wartet?"));
talkEntry:addResponse("Öffne mit dem Schlüssel den ich dir gegeben habe die Kellertür. Versuch das Ding, darin zu verjagen. Es frisst unsere Vorräte auf!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("info");
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("detail");
talkEntry:addCondition(npc.base.condition.quest.quest(27, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(2161, "all", "=>", 1));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Am besten ziehst du gute Schuhe an, bevor du nach unten gehst, wer weiß was auf dich wartet?"));
talkEntry:addResponse("Öffne mit dem Schlüssel den ich dir gegeben habe die Kellertür. Versuch das Ding, darin zu verjagen. Es frisst unsere Vorräte auf!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("info");
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("detail");
talkEntry:addCondition(npc.base.condition.quest.quest(27, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("The halfling slides the key of the cellar of the house between your fingers. You better put on some good shoes before you go downstairs. Who knows what is waiting down there for you?"));
talkEntry:addResponse("Hm? You have the lost the key? Take my replacement key then. And do not lose it again! Open the door to the cellar with this key. Try to chase the thing inside away. It's eating all our supplies!");
talkEntry:addConsequence(npc.base.consequence.item.item(2161, 1, 333, 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("key");
talkEntry:addCondition(npc.base.condition.quest.quest(27, "=", 2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("The halfling slides the key of the cellar of the house between your fingers. You better put on some good shoes before you go downstairs. Who knows what is waiting down there for you?"));
talkEntry:addResponse("Hm? You have the lost the key? Take my replacement key then. And do not lose it again! Open the door to the cellar with this key. Try to chase the thing inside away. It's eating all our supplies!");
talkEntry:addConsequence(npc.base.consequence.item.item(2161, 1, 333, 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("aufgabe");
talkEntry:addTrigger("abenteuer");
talkEntry:addTrigger("schl[uü]ssel");
talkEntry:addCondition(npc.base.condition.quest.quest(27, "=", 2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Der Halbling steckt die den Schlüssel zum Keller des Hauses zwischen die Finger. Am besten ziehst du gute Schuhe an, bevor du nach unten gehst, wer weiß was auf dich wartet?"));
talkEntry:addResponse("Hm? Hast du den Schlüssel verloren? Dann nimm eben meinen Ersatzschlüssel. Und verlier ihn nicht wieder! Öffne mit diesem Schlüssel die Kellertür. Versuch das Ding, darin zu verjagen. Es frisst unsere Vorräte auf!");
talkEntry:addConsequence(npc.base.consequence.item.item(2161, 1, 333, 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("info");
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("detail");
talkEntry:addCondition(npc.base.condition.quest.quest(27, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Der Halbling steckt die den Schlüssel zum Keller des Hauses zwischen die Finger. Am besten ziehst du gute Schuhe an, bevor du nach unten gehst, wer weiß was auf dich wartet?"));
talkEntry:addResponse("Hm? Hast du den Schlüssel verloren? Dann nimm eben meinen Ersatzschlüssel. Und verlier ihn nicht wieder! Öffne mit diesem Schlüssel die Kellertür. Versuch das Ding, darin zu verjagen. Es frisst unsere Vorräte auf!");
talkEntry:addConsequence(npc.base.consequence.item.item(2161, 1, 333, 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addTrigger("quest");
talkEntry:addCondition(npc.base.condition.quest.quest(27, "=", 3));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("XXXInfo welche belohnungXXX"));
talkEntry:addResponse("Ha! You did it! How awesome! A real heroic deed! Martin and Otto Sauerteig are in your debt forever! I'm so thankful, i'll give you something!");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2161, 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(27, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addTrigger("quest");
talkEntry:addCondition(npc.base.condition.quest.quest(27, "=", 3));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("XXXInfo welche belohnungXXX"));
talkEntry:addResponse("Ha! Du hast es Gschafft! Wie großartig! Eine wahre Heldentat! Martin und Otto Sauerteig stehen für immer in deiner Schuld! Komm lass dir etwas geben, ich bin dir so Dankbar!");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2161, 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(27, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("celler");
talkEntry:addTrigger("stock");
talkEntry:addTrigger("thing");
talkEntry:addCondition(npc.base.condition.quest.quest(27, "=", 3));
talkEntry:addConsequence(npc.base.consequence.inform.inform("XXXInfo welche belohnungXXX"));
talkEntry:addResponse("Ha! You did it! How awesome! A real heroic deed! Martin and Otto Sauerteig are in your debt forever! I'm so thankful, i'll give you something!");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2161, 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(27, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("aufgabe");
talkEntry:addTrigger("abenteuer");
talkEntry:addTrigger("ding");
talkEntry:addTrigger("sache");
talkEntry:addTrigger("keller");
talkEntry:addTrigger("vorr[aeä]te");
talkEntry:addCondition(npc.base.condition.quest.quest(27, "=", 3));
talkEntry:addConsequence(npc.base.consequence.inform.inform("XXXInfo welche belohnungXXX"));
talkEntry:addResponse("Ha! Du hast es Gschafft! Wie großartig! Eine wahre Heldentat! Martin und Otto Sauerteig stehen für immer in deiner Schuld! Komm lass dir etwas geben, ich bin dir so Dankbar!");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2161, 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(27, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addTrigger("quest");
talkEntry:addCondition(npc.base.condition.quest.quest(27, "=", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Thank you so much, once more. When there are 'things' in the cellar again then i'll tell you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addTrigger("quest");
talkEntry:addCondition(npc.base.condition.quest.quest(27, "=", 4));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Nocheinmal Danke für deine Hilfe. Wenn wieder 'Dinge' im Keller sind sag ich's dir.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("celler");
talkEntry:addTrigger("stock");
talkEntry:addTrigger("thing");
talkEntry:addCondition(npc.base.condition.quest.quest(27, "=", 4));
talkEntry:addResponse("Thank you so much, once more. When there are 'things' in the cellar again then i'll tell you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("aufgabe");
talkEntry:addTrigger("abenteuer");
talkEntry:addTrigger("ding");
talkEntry:addTrigger("sache");
talkEntry:addTrigger("keller");
talkEntry:addTrigger("vorr[aeä]te");
talkEntry:addCondition(npc.base.condition.quest.quest(27, "=", 4));
talkEntry:addResponse("Nocheinmal Danke für deine Hilfe. Wenn wieder 'Dinge' im Keller sind sag ich's dir.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("geschichte");
talkEntry:addCondition(npc.base.condition.quest.quest(27, "=", 4));
talkEntry:addResponse("Wir hatten einmal die Türe offen gelassen und dan war plötzlich das 'Ding' im Keller. Hihi. Gut das du uns geholfen hast. Jetzt passen Martin und ich aber besser auf. Ehrlich!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("story");
talkEntry:addTrigger("tale");
talkEntry:addCondition(npc.base.condition.quest.quest(27, "=", 4));
talkEntry:addResponse("Once, we left the door open and then we suddenly had that 'thing' in our cellar. Hihi. What a luck that you helped. Martin and I will pay better attention from now on. Promised!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("geschichte");
talkEntry:addTrigger("ding");
talkEntry:addTrigger("sache");
talkEntry:addTrigger("keller");
talkEntry:addTrigger("vorr[aeä]te");
talkEntry:addCondition(npc.base.condition.quest.quest(27, "=>", 1));
talkEntry:addResponse("Es ist haarig und schwarz. Ich habe viel zu viel Angst um  selbst in den Keller zu gehen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("story");
talkEntry:addTrigger("tale");
talkEntry:addTrigger("stock");
talkEntry:addTrigger("celler");
talkEntry:addTrigger("thing");
talkEntry:addCondition(npc.base.condition.quest.quest(27, "=>", 1));
talkEntry:addResponse("It is hairy and black. I'm too afraid to go down into the cellar.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sauerteig");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Das ist mein Sippenname. Der von mir und Martin.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Martin Sauerteig");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Martin ist mein Bruder. Wir haben gemeinsam diesem kleinen Hof erbaut. Ist er nicht heimelig?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Buch");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Martin und ich haben ein Buch geschrieben! Kennst du's? Ich glaube es war irgendwo in Greenbriar.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Otto Sauerteig");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Hiho. So heiß ich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sauerteig");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("That's a tribe name. The tribe name of me and Martin.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Martin Sauerteig");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Martin is my brother. We built this small farmyard here together. Isn't it haimish?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Buch");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Martin and me wrote a book together! Do you know it? It was somewhere in Greenbriar.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Otto Sauerteig");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hiho. That's me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hallo");
talkEntry:addTrigger("gr[üue]+[sß]+e");
talkEntry:addTrigger("guten tag");
talkEntry:addTrigger("Gruß");
talkEntry:addTrigger("Seid gegrüßt");
talkEntry:addTrigger("Guten Abend");
talkEntry:addTrigger("Tach");
talkEntry:addTrigger("Moin");
talkEntry:addResponse("Hallo.");
talkEntry:addResponse("Huhu!");
talkEntry:addResponse("Hiho!");
talkEntry:addResponse("Hallöchen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("good day");
talkEntry:addTrigger("greetings");
talkEntry:addTrigger("greets");
talkEntry:addTrigger("hail");
talkEntry:addTrigger("hello");
talkEntry:addTrigger("Be greeted");
talkEntry:addTrigger("Good morning");
talkEntry:addResponse("Huhu!");
talkEntry:addResponse("Hello!");
talkEntry:addResponse("Hiho!");
talkEntry:addResponse("Hi ya!");
talkEntry:addResponse("Howdy-Ho!");
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
talkEntry:addResponse("Huhu!");
talkEntry:addResponse("Hello!");
talkEntry:addResponse("Hiho!");
talkEntry:addResponse("Hi ya!");
talkEntry:addResponse("Howdy-Ho!");
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
talkEntry:addResponse("Hallo.");
talkEntry:addResponse("Huhu!");
talkEntry:addResponse("Hiho!");
talkEntry:addResponse("Hallöchen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("wie hei[sß]+t du");
talkEntry:addTrigger("wie hei[sß]+t ihr");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer seid");
talkEntry:addTrigger("wer bist");
talkEntry:addResponse("Ich bin %NPCNAME.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Good bye");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare thee well");
talkEntry:addResponse("Farewell.");
talkEntry:addResponse("Good bye.");
talkEntry:addResponse("Bye.");
talkEntry:addResponse("Ciao");
talkEntry:addResponse("Adieu!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehabt euch wohl");
talkEntry:addResponse("Tschüß.");
talkEntry:addResponse("Wiedersehen.");
talkEntry:addResponse("Adieu!");
talkEntry:addResponse("Baba!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Farewell.");
talkEntry:addResponse("Good bye.");
talkEntry:addResponse("Bye.");
talkEntry:addResponse("Ciao");
talkEntry:addResponse("Adieu!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Tschüß.");
talkEntry:addResponse("Tschüss.");
talkEntry:addResponse("Wiedersehen.");
talkEntry:addResponse("Auf bald!");
talkEntry:addResponse("Adieu!");
talkEntry:addResponse("Au revoir!");
talkEntry:addResponse("Baba!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("Well! Just great! Hihi.");
talkEntry:addResponse("Great! Glorious!, And you?");
talkEntry:addResponse("Hui! Hihi!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addResponse("Gut Gut! Wirklich fein! Hihi.");
talkEntry:addResponse("Fantastisch, und du?");
talkEntry:addResponse("Hui! Hihi!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who are thou");
talkEntry:addResponse("I'm %NPCNAME.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("I am");
talkEntry:addTrigger("I'm");
talkEntry:addResponse("Nice to meet you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ich bin");
talkEntry:addResponse("Schön dich kennen zu lernen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hilfe");
talkEntry:addCondition(npc.base.condition.quest.quest(27, "=", 4));
talkEntry:addResponse("Hihi! Wenn du Hilfe brauchst solltest du in einer Siedlung dannach suchen! Ich bin nur ein Bauer.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("helfen");
talkEntry:addCondition(npc.base.condition.quest.quest(27, "=", 4));
talkEntry:addResponse("Hihi! Wenn du Hilfe brauchst solltest du in einer Siedlung dannach suchen! Ich bin nur ein Bauer.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("help");
talkEntry:addCondition(npc.base.condition.quest.quest(27, "=", 4));
talkEntry:addResponse("Hihi! If you need help you should search at a sttlement for it! I'm just a framer.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hilfe");
talkEntry:addResponse("Frage mich nach 'Abenteuern' oder 'Problemen'. Wenn du andere Dinge brauchst gehts du besser zu einer Siedlung, deswegen.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("helfen");
talkEntry:addResponse("Frage mich nach 'Abenteuern' oder 'Problemen'. Wenn du andere Dinge brauchst gehts du besser zu einer Siedlung, deswegen.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("help");
talkEntry:addResponse("Ask me for a 'quest' or 'problems'. If you need other things, its better to search a settlement and ask there.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("murgo");
talkEntry:addCondition(npc.base.condition.race.race(4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Otto Sauerteig narrwos his eyes, looking angry. He winks with the flail and fizzles at you."));
talkEntry:addResponse("Ihh! Go away with you milkspillerfriends! Gschu!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("murgo");
talkEntry:addCondition(npc.base.condition.race.race(4));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Otto Sauerteig kneift die Augen zusammen und guckt böse. Er winkt mit seinem Dreschflegel und zischt dir zu."));
talkEntry:addResponse("Ihh! Verschwinde du Milchversauererfreund! Gschu!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("murgo");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Otto Sauerteig starts to yell out orders in panic, he takes his flail in both hands and shivers."));
talkEntry:addResponse("Where, where? Is he comming again? I will talk to Martin! You infrom the others! BEWARE! They're comming again! Ahhh!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("murgo");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Otto Sauerteig beginnt panisch Anordnugnen zu rufen. Er nimmt seinen Dreschflegel in beide Hände und beginnt zu zittern."));
talkEntry:addResponse("Wo, wo? Kommt er schon wieder? Ich sag's Martin. Du infromierst die Anderen! ACHTUNG! Sie, kommen wieder! Ahhh!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rose");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Otto Sauerteig's gesicht wird rot wie eine Tomate. Er grinst über beide Ohren."));
talkEntry:addResponse("Rose, nein ich kenn sie nicht! Hihi. Wirklich nicht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rose");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Otto Sauerteig's face tunrs red like a tomato. He grinses broadly."));
talkEntry:addResponse("Rose, no I never met. Hihi! Trust me!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gibb");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Gibb Gibberson. Hihi! Er geht immer ein bisschen buckelig, damit er sich den Kopf nicht an den Wolken stößt. Für einen echten Salkamarer ist er viel zu lang, wenn du mich fragst. Ich denke er lebt in diesem Troll's Bane.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gibberson");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Gibb Gibberson. Hihi! Er geht immer ein bisschen buckelig, damit er sich den Kopf nicht an den Wolken stößt. Für einen echten Salkamarer ist er viel zu lang, wenn du mich fragst. Ich denke er lebt in diesem Troll's Bane.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gibb");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Gibb Gibberson. Hihi! He walks humpy! So he don't bang his head into the clouds. For a salkamarish he is much too long, if you ask me. He lives somweher in this Troll's Bane.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gibberson");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Gibb Gibberson. Hihi! He walks humpy! So he don't bang his head into the clouds. For a salkamarish he is much too long, if you ask me. He lives somweher in this Troll's Bane.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me bohrt in der Nase", "#me drills with a finger into his nose.");
talkingNPC:addCycleText("#me schultert seinen Dreschflegel und atmet tief durch.", "#me shoulders his flail and takes a deep breath.");
talkingNPC:addCycleText("#me wischt seine Nase am Hemdärmel ab.", "#me sneezes into his shirtsleeve.");
talkingNPC:addCycleText("#me kratzt sich kurz zwischen den Beinen.", "#me has a quick scratch between his legs.");
talkingNPC:addCycleText("#me pfeift eine lustige Melodie", "#me whistles a amusing melody");
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

--------------------------------------------------------------------------------
-- NPC Name: Tony Spirotelli                                          Galmair --
-- NPC Job:  Carpenter                                                        --
--                                                                            --
-- NPC Race: human                      NPC Position:  383, 269, 0            --
-- NPC Sex:  male                       NPC Direction: south                  --
--                                                                            --
-- Author:   Zot                                                              --
--                                                       easyNPC Parser v1.23 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (0, 383, 269, 0, 4, 'Tony Spirotelli', 'npc.tony_spirotelli', 0, 3, 2, 173, 54, 33, 255, 206, 183);
---]]

require("npc.base.basic")
require("npc.base.condition.item")
require("npc.base.condition.language")
require("npc.base.condition.quest")
require("npc.base.condition.town")
require("npc.base.consequence.deleteitem")
require("npc.base.consequence.inform")
require("npc.base.consequence.item")
require("npc.base.consequence.quest")
require("npc.base.talk")
module("development.tony_spirotelli", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Tony Spirotelli the carpenter. Keywords: quest"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Tony Spirotelli der Schreiner. Schlüsselwörter: Quest"));
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
talkEntry:addResponse("Hello, what do you need?");
talkEntry:addResponse("Good day, what do you need?");
talkEntry:addResponse("I'm Tony Spirotelli, what can I do for you?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Grüß");
talkEntry:addTrigger("Gruß");
talkEntry:addTrigger("Guten Morgen");
talkEntry:addTrigger("Guten Tag");
talkEntry:addTrigger("Guten Abend");
talkEntry:addTrigger("Gute Nacht");
talkEntry:addTrigger("Mahlzeit");
talkEntry:addTrigger("Tach");
talkEntry:addTrigger("Moin");
talkEntry:addTrigger("Mohltied");
talkEntry:addResponse("Hallo, was brauchst du?");
talkEntry:addResponse("Guten Tag, was willst du?");
talkEntry:addResponse("Ich bin Tony Spirotelli, was kann ich für dich tun?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Hello, what do you need?");
talkEntry:addResponse("Good day, what do you need?");
talkEntry:addResponse("I'm Tony Spirotelli, what can I do for you?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Hallo, was brauchst du?");
talkEntry:addResponse("Guten Tag, was willst du?");
talkEntry:addResponse("Ich bin Tony Spirotelli, was kann ich für dich tun?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("#me chuckles, 'I'll be seeing you again I hope.'");
talkEntry:addResponse("Aye... another time.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addResponse("#me lacht: 'Wir werden uns wiedersehen, da bin ich mir sicher.");
talkEntry:addResponse("Ja, bis zum nächsten mal.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("#me chuckles, 'I'll be seeing you again I hope.'");
talkEntry:addResponse("Aye... another time.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("#me lacht: 'Wir werden uns wiedersehen, da bin ich mir sicher.");
talkEntry:addResponse("Ja, bis zum nächsten mal.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("I feel fine, thank you for asking.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befind");
talkEntry:addResponse("Mir geht es gut, danke der Nachfrage.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("I'm Tony Spirotelli, who are you?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ihr name");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Ich bin Tony Spirotelli, wer bist du?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("I'm a carpenter, if you want to know more about it, ask me for a task. I'm sure I have something for you to do.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Ich bin Schreiner, falls du mehr darüber erfahren möchtest, frag mich nach einer Aufgabe. Ich hab sicher etwas für dich zu tun.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("I'm a carpenter, if you want to know more about it, ask me for a task. I'm sure I have something for you to do.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Ich bin Schreiner, falls du mehr darüber erfahren möchtest, frag mich nach einer Aufgabe. Ich hab sicher etwas für dich zu tun.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(710, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.item.item(9, 1, 777, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(74, 1, 777, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(710, "=", 1));
talkEntry:addResponse("A task..ah yes, yes, of course. Take this old hatchet of mine and collect ten pieces of deciduous wood from the apple trees outside the city. Then return to the workshop and saw the pieces of deciduous wood into boards at the workbench with the saw I'll give you, and show them to me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(710, "=", 0));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.item.item(9, 1, 777, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(74, 1, 777, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(710, "=", 1));
talkEntry:addResponse("Eine Aufgabe..ah ja, ja, sicher. Nimm dieses alte Beil von mir und sammel zehn Laubholzscheite bei einem der Apfelbäume außerhalb der Stadt. Dann kommst du hierher zurück und sägst die Scheite bei der Werkbank mit dieser Säge die ich dir gebe zu Brettern und zeigst sie mir dann.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(710, "=", 0));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.item.item(9, 1, 777, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(74, 1, 777, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(710, "=", 1));
talkEntry:addResponse("A task..ah yes, yes, of course. Take this old hatchet of mine and collect ten pieces of deciduous wood from the apple trees outside the city. Then return to the workshop and saw the pieces of deciduous wood into boards at the workbench with the saw I'll give you, and show them to me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(710, "=", 0));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.item.item(9, 1, 777, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(74, 1, 777, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(710, "=", 1));
talkEntry:addResponse("Eine Aufgabe..ah ja, ja, sicher. Nimm dieses alte Beil von mir und sammel zehn Laubholzscheite bei einem der Apfelbäume außerhalb der Stadt. Dann kommst du hierher zurück und sägst die Scheite bei der Werkbank mit dieser Säge die ich dir gebe zu Brettern und zeigst sie mir dann.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(710, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2716, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("board");
talkEntry:addTrigger("wood");
talkEntry:addTrigger("deciduous");
talkEntry:addConsequence(npc.base.consequence.quest.quest(710, "=", 2));
talkEntry:addResponse("Well done, the boards look great. Please keep them for your next task.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(710, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2716, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("brett");
talkEntry:addTrigger("holz");
talkEntry:addTrigger("laub");
talkEntry:addConsequence(npc.base.consequence.quest.quest(710, "=", 2));
talkEntry:addResponse("Gut gemacht, die Bretter sehen gut aus. Bitte behalte sie für deine nächste Aufgabe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(710, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2716, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.quest.quest(710, "=", 2));
talkEntry:addResponse("Well done, the boards look great. Please keep them for your next task.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(710, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2716, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.quest.quest(710, "=", 2));
talkEntry:addResponse("Gut gemacht, die Bretter sehen gut aus. Bitte behalte sie für deine nächste Aufgabe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(710, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2716, "all", "<", 10, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addResponse("I wanted ten deciduous wood boards, come back once you have fulfilled this task.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(710, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2716, "all", "<", 10, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Ich wollte zehn Laubholzbretter haben, komm wieder wenn du die Aufgabe erfüllt hast.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(710, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.item.item(2715, 1, 777, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(710, "=", 3));
talkEntry:addResponse("Let's make some plates from the deciduous boards now. You will need a plane for that, which I'll give you. Then you go to the workbench next to me and produce ten plates, which you can show me once you are done.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(710, "=", 2));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.item.item(2715, 1, 777, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(710, "=", 3));
talkEntry:addResponse("Nun stellen wir aus den Laubholzbrettern Teller her. Dafür brauchst du einen Hobel den ich dir gebe, dann setzt du dich auf den Stuhl da gleich neben mich bei der Werkbank und machst zehn Teller, diese zeigst du mir wenn du fertig bist.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(710, "=", 2));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.item.item(2715, 1, 777, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(710, "=", 3));
talkEntry:addResponse("Let's make some plates from the deciduous boards now. You will need a plane for that, which I'll give you. Then you go to the workbench next to me and produce ten plates, which you can show me once you are done.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(710, "=", 2));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.item.item(2715, 1, 777, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(710, "=", 3));
talkEntry:addResponse("Nun stellen wir aus den Laubholzbrettern Teller her. Dafür brauchst du einen Hobel den ich dir gebe, dann setzt du dich auf den Stuhl da gleich neben mich bei der Werkbank und machst zehn Teller, diese zeigst du mir wenn du fertig bist.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(710, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2952, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("plate");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2952, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(710, "=", 4));
talkEntry:addResponse("Well done, the plates look pretty good. Do you want another task?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(710, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2952, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("teller");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2952, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(710, "=", 4));
talkEntry:addResponse("Gut gemacht, die Teller sehen gut aus. Wollt Ihr eine weitere Aufgabe?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(710, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2952, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2952, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(710, "=", 4));
talkEntry:addResponse("Well done, the plates look pretty good. Do you want another task?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(710, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2952, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2952, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(710, "=", 4));
talkEntry:addResponse("Gut gemacht, die Teller sehen gut aus. Wollt Ihr eine weitere Aufgabe?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(710, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2952, "all", "<", 10, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addResponse("I wanted ten plates, come back once you have fulfilled this task.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(710, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2952, "all", "<", 10, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Ich wollte zehn Teller, komm wieder wenn du die Aufgabe erfüllt hast.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(710, "=", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.item.item(2752, 1, 777, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(2738, 1, 777, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(710, "=", 5));
talkEntry:addResponse("Alright, now go out and collect five boughs. Once you have five boughs, come back here and produce twenty five pins and cotters for me using these carving tools and these twenty five pins I'll give you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(710, "=", 4));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.item.item(2752, 1, 777, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(2738, 1, 777, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(710, "=", 5));
talkEntry:addResponse("Gut, nun geh hinaus und sammel bei den Apfelbäumen fünf Äste. Sobald du sie zusammen hast, komm hierher zurück und stell aus den Ästen 25 Nägel und Keile her, dazu brauchst du ein Schnitzmesser, dass ich dir gebe und diese 25 Nägel.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(710, "=", 4));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.item.item(2752, 1, 777, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(2738, 1, 777, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(710, "=", 5));
talkEntry:addResponse("Alright, now go out and collect five boughs. Once you have five boughs, come back here and produce twenty five pins and cotters for me using these carving tools this twenty five pins I'll give you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(710, "=", 4));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.item.item(2752, 1, 777, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(2738, 1, 777, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(710, "=", 5));
talkEntry:addResponse("Gut, nun geh hinaus und sammel bei den Apfelbäumen fünf Äste. Sobald du sie zusammen hast, komm hierher zurück und stell aus den Ästen 25 Nägel und Keile her, dazu brauchst du ein Schnitzmesser, dass ich dir gebe und diese 25 Nägel.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(710, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2717, "all", ">", 24, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("pin");
talkEntry:addTrigger("cotter");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2717, 25, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(710, "=", 6));
talkEntry:addResponse("Well done, the pins and cotters look perfect. It will take a while for you to become a master in carpentry, but I hope I have taught you some of the basics at least.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(710, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2717, "all", ">", 24, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("nägel");
talkEntry:addTrigger("keil");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2717, 25, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(710, "=", 6));
talkEntry:addResponse("Gut gemacht, die Nägel und Keile sehen sehr gut aus. Bis du ein Meister in dem Fach wirst dauert es sicher noch etwas, aber ich hoffe du beherscht nun zumindest die Grundlagen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(710, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2717, "all", ">", 24, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2717, 25, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(710, "=", 6));
talkEntry:addResponse("Well done, the pins and cotters look perfect. It will take a while for you to become a master in carpentry, but I hope I have taught you some of the basics at least.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(710, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2717, "all", ">", 24, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2717, 25, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(710, "=", 6));
talkEntry:addResponse("Gut gemacht, die Nägel und Keile sehen sehr gut aus. Bis du ein Meister in dem Fach wirst dauert es sicher noch etwas, aber ich hoffe du beherscht nun zumindest die Grundlagen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(710, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2717, "all", "<", 25, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addResponse("I wanted twenty five pins and cotters, come back once you have fulfilled this task.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(710, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2717, "all", "<", 25, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Ich wollte 25 Nägel und Keile, komm wieder wenn du die Aufgabe erfüllt hast.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(710, "=", 6));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".*");
talkEntry:addResponse("I don't have anything more for you to do. Thank you for the help though!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(710, "=", 6));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Ich habe nichts weiter für dich zu tun. Aber danke nochmals für deine Hilfe!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(710, "<", 6));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".*");
talkEntry:addResponse("I could use some help, just ask me for a task.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(710, "<", 6));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Ich könnte etwas Hilfe gebrauchen, frag mich ruhig nach einer Aufgabe. Ich habe sicher etwas für dich zu tun.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".*");
talkEntry:addResponse("You are not a citizen of Galmair. I don't have anything for you to do.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Du scheinst kein Bürger Galmair zu sein. Ich habe nichts für dich zu tun.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me schaut sich gelangweilt um.", "#me looks around bored.");
talkingNPC:addCycleText("#me kratzt sich am Kopf.", "#me scratches his head.");
talkingNPC:addCycleText("Wenn du Hilfe beim Schreinern braucht dann frag nur mich!", "If you need any help in carpentry, just ask me!");
talkingNPC:addCycleText("#me gähnt verhalten.", "#me yawns restrained.");
talkingNPC:addCycleText("#me schaut sich kurz um und kratzt sich anschließend an seinem Hintern.", "#me looks around briefly and scratches his bum.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(1);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("", "");
mainNPC:setUseMessage("Fass mich nicht an!", "Hands off!");
mainNPC:setConfusedMessage("#me schaut dich verwirrt an.", "#me looks at you confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 364);
mainNPC:setEquipment(11, 2384);
mainNPC:setEquipment(5, 0);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 0);
mainNPC:setEquipment(9, 826);
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
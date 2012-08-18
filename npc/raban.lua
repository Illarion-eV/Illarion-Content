--------------------------------------------------------------------------------
-- NPC Name: Raban                                                       None --
-- NPC Job:  Hermit                                                           --
--                                                                            --
-- NPC Race: human                      NPC Position:  819, 104, 0            --
-- NPC Sex:  male                       NPC Direction: west                   --
--                                                                            --
-- Author:   Estralis Seborian                                                --
--                                                                            --
-- Last parsing: August 18, 2012                          easyNPC Parser v1.2 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (0, 819, 104, 0, 6, 'Raban', 'npc.raban', 0, 2, 3, 204, 144, 2, 186, 133, 91);
---]]

require("npc.base.basic")
require("npc.base.condition.item")
require("npc.base.condition.language")
require("npc.base.condition.quest")
require("npc.base.condition.skill")
require("npc.base.consequence.deleteitem")
require("npc.base.consequence.inform")
require("npc.base.consequence.item")
require("npc.base.consequence.money")
require("npc.base.consequence.quest")
require("npc.base.consequence.skill")
require("npc.base.talk")
module("npc.raban", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is the hermit Raban. Keyphrases: Hello, quest, sickle, herbs."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist der Einsiedler Raban. Schlüsselwörter: Hallo, Quest, Sichel, Kräuter."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hello");
talkEntry:addTrigger("Greet");
talkEntry:addTrigger("Hail");
talkEntry:addTrigger("Good day");
talkEntry:addTrigger("Good morning");
talkEntry:addTrigger("Good evening");
talkEntry:addResponse("Ah, yes, an unsettled soul. Welcome to my grove.");
talkEntry:addResponse("Who is there! Pardon me, I am not used to visitors.");
talkEntry:addResponse("So, after all those summers, somebody comes here. I hope your intentions are good.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Grüß");
talkEntry:addTrigger("Gruß");
talkEntry:addTrigger("Guten Tag");
talkEntry:addTrigger("Guten Abend");
talkEntry:addTrigger("Mahlzeit");
talkEntry:addTrigger("Tach");
talkEntry:addTrigger("Moin");
talkEntry:addResponse("Ach ja, wieder eine rastlose Seele. Willkommen in meinem Hain.");
talkEntry:addResponse("Wer ist da! Entschuldigt, ich bin es nicht gewohnt, Besucher zu empfangen.");
talkEntry:addResponse("Nun, nach all diesen Sommern sucht wieder jemand diesen Ort auf. Ich hoffe, eure Absichten sind ehrbar.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Ah, yes, an unsettled soul. Welcome to my grove.");
talkEntry:addResponse("Who is there! Pardon me, I am not used to visitors.");
talkEntry:addResponse("So, after all those summers, somebody comes here. I hope your intentions are good.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Ach ja, wieder eine rastlose Seele. Willkommen in meinem Hain.");
talkEntry:addResponse("Wer ist da! Entschuldigt, ich bin es nicht gewohnt, Besucher zu empfangen.");
talkEntry:addResponse("Nun, nach all diesen Sommern sucht wieder jemand diesen Ort auf. Ich hoffe, eure Absichten sind ehrbar.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Ushara may guide your way.");
talkEntry:addResponse("Farewell.");
talkEntry:addResponse("While leaving, do not stomp on any seedling, will you?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Möge Ushara deinen Weg begleiten.");
talkEntry:addResponse("Gehabt euch wohl.");
talkEntry:addResponse("Wenn ihr geht, mögt ihr Acht geben, nicht auf Setzlinge zu treten?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Ushara may guide your way.");
talkEntry:addResponse("Farewell.");
talkEntry:addResponse("While leaving, do not stomp on any seedling, will you?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addResponse("Möge Ushara deinen Weg begleiten.");
talkEntry:addResponse("Gehabt euch wohl.");
talkEntry:addResponse("Wenn ihr geht, mögt ihr Acht geben, nicht auf Setzlinge zu treten?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("I always feel pacified when surrounded by plants and trees.");
talkEntry:addResponse("I'd feel much better if everyone honors the woods. Aren't those trees lovely?");
talkEntry:addResponse("I cannot complain. My trees grow and this little fellow over there just turned ten years. I remember planting him like it was yesterday.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addResponse("Umgeben von Pflanzen und Bäumen fühle ich mich immer beruhigt.");
talkEntry:addResponse("Es würde mir weit besser gehen, wenn ein Jeder die Wälder achten würde. Sind diese Bäume nicht wunderbar?");
talkEntry:addResponse("Ich kann mich nicht beklagen. Meine Bäume wachsen wunderbar und der kleine dort ist gerade zehn geworden. Ich erinnere mich, wie ich ihn gepflanzt habe, als wenn es gestern wäre.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("They used to call me Raban when people still came here.");
talkEntry:addResponse("Raban.");
talkEntry:addResponse("I am an old man without an use for a name. The trees and plants have their own word for me. You may call me Raban.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Sie haben mich Raban genannt, damals, als noch von Zeit zu Zeit Leute hierher kamen.");
talkEntry:addResponse("Raban.");
talkEntry:addResponse("Ich bin ein alter Mann, ohne Bedarf für einen Namen. Die Bäume und Pflanzen haben ihre eigene Bezeichnung für mich. Du kannst mich hingegen Raban nennen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(66, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Raban's Grove I"));
talkEntry:addResponse("So, you want to help me and the forest? Here, take this sickle and bring me ten fir tree seedling from the trees around.");
talkEntry:addConsequence(npc.base.consequence.item.item(126, 1, 399, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(66, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(66, "=", 0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Rabans Hain I"));
talkEntry:addResponse("So, so, du willst mir und dem Wald also helfen? Nimm doch diese Sichel und bringe mir zehnSetzlinge von den Fichten des Hains.");
talkEntry:addConsequence(npc.base.consequence.item.item(126, 1, 399, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(66, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addCondition(npc.base.condition.quest.quest(66, "=", 0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Raban's Grove I"));
talkEntry:addResponse("So, you want to help me and the forest? Here, take this sickle and bring me ten fir tree seedling from the trees around.");
talkEntry:addConsequence(npc.base.consequence.item.item(126, 1, 399, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(66, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addCondition(npc.base.condition.quest.quest(66, "=", 0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Rabans Hain I"));
talkEntry:addResponse("So, so, du willst mir und dem Wald also helfen? Nimm doch diese Sichel und bringe mir zehn Setzlinge von den Fichten des Hains.");
talkEntry:addConsequence(npc.base.consequence.item.item(126, 1, 399, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(66, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "herb lore", "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(66, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(149, "all", ">", "9));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 50 copper coins and your herb lore skill increases."));
talkEntry:addResponse("Thank you very much for the fir tree seedlings. Here, have those shiny disks, I have no use for them.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "herb lore", "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 50));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(149, 10));
talkEntry:addConsequence(npc.base.consequence.quest.quest(66, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(66, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(149, "all", ">", "9));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 50 copper coins."));
talkEntry:addResponse("Thank you very much for the fir tree seedlings. Here, have those shiny disks, I have no use for them.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 50));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(149, 10));
talkEntry:addConsequence(npc.base.consequence.quest.quest(66, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "herb lore", "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(66, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(149, "all", ">", "9));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 50 Kupferstücke und deine Kräuterkundefertigkeit steigt."));
talkEntry:addResponse("Habt besten Dank für die Fichtensetzlinge. Nehmt diese glänzenden Scheiben, ich habe keinen Bedarf an ihnen.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "herb lore", "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 50));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(149, 10));
talkEntry:addConsequence(npc.base.consequence.quest.quest(66, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(66, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(149, "all", ">", "9));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 50 Kupferstücke."));
talkEntry:addResponse("Habt besten Dank für die Fichtensetzlinge. Nehmt diese glänzenden Scheiben, ich habe keinen Bedarf an ihnen.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 50));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(149, 10));
talkEntry:addConsequence(npc.base.consequence.quest.quest(66, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(66, "=", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("So, how is progress in finding ten fir tree seedlings?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(66, "=", 1));
talkEntry:addResponse("Und, wie kommt ihr voran mit dem Finden von zehn Fichtensetzlingen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addCondition(npc.base.condition.quest.quest(66, "=", 1));
talkEntry:addResponse("So, how is progress in finding ten fir tree seedlings?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addCondition(npc.base.condition.quest.quest(66, "=", 1));
talkEntry:addResponse("Und, wie kommt ihr voran mit dem Finden von zehn Fichtensetzlingen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(66, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Raban's Grove II"));
talkEntry:addResponse("How kind of you that you want to assist me one more time. Could you gather twenty black berries, sweet gifts of Oldra?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(66, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(66, "=", 2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Rabans Hain II"));
talkEntry:addResponse("Wie aufmerksam, dass ihr mir ein weiteres mal helfen wollt. Könntet ihr so nett sein und zwanzig Brombeeren sammeln, süße Geschenke der Oldra?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(66, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addCondition(npc.base.condition.quest.quest(66, "=", 2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Raban's Grove II"));
talkEntry:addResponse("How kind of you that you want to assist me one more time. Could you gather twenty black berries, sweet gifts of Oldra?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(66, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addCondition(npc.base.condition.quest.quest(66, "=", 2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Rabans Hain II"));
talkEntry:addResponse("Wie aufmerksam, dass ihr mir ein weiteres mal helfen wollt. Könntet ihr so nett sein und zwanzig Brombeeren sammeln, süße Geschenke der Oldra?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(66, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "herb lore", "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(66, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(147, "all", ">", "19));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 100 copper coins and your herb lore skill increases."));
talkEntry:addResponse("I am grateful for the twenty black berries you brought me. Have this small reward.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "herb lore", "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(147, 20));
talkEntry:addConsequence(npc.base.consequence.quest.quest(66, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(66, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(147, "all", ">", "19));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 100 copper coins."));
talkEntry:addResponse("I am grateful for the twenty black berries you brought me. Have this small reward.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(147, 20));
talkEntry:addConsequence(npc.base.consequence.quest.quest(66, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "herb lore", "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(66, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(147, "all", ">", "19));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 100 Kupferstücke und deine Kräuterkundefertigkeit steigt."));
talkEntry:addResponse("Ich bin dankbar für die zwanzig Brombeeren, die ihr dargebracht habt. Nehmt diese kleine Belohnung.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "herb lore", "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(147, 20));
talkEntry:addConsequence(npc.base.consequence.quest.quest(66, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(66, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(147, "all", ">", "19));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 100 Kupferstücke."));
talkEntry:addResponse("Ich bin dankbar für die zwanzig Brombeeren, die ihr dargebracht habt. Nehmt diese kleine Belohnung.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(147, 20));
talkEntry:addConsequence(npc.base.consequence.quest.quest(66, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(66, "=", 3));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("You can find the twenty black berries I ask for in the hedge over there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(66, "=", 3));
talkEntry:addResponse("Ihr könnt die zwanzig Brombeeren, die ich erbat, an der Hecke dort drüben finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addCondition(npc.base.condition.quest.quest(66, "=", 3));
talkEntry:addResponse("You can find the twenty black berries I ask for in the hedge over there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addCondition(npc.base.condition.quest.quest(66, "=", 3));
talkEntry:addResponse("Ihr könnt die zwanzig Brombeeren, die ich erbat, an der Hecke dort drüben finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(66, "=", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Raban's Grove III"));
talkEntry:addResponse("It is honourable that you help me and the godess. For now, I desire five birth mushrooms to spread life on the soil.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(66, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(66, "=", 4));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Rabans Hain III"));
talkEntry:addResponse("Es ehrt euch, dass ihr mir und der Göttin erneut helfen wollt. Nun benötige ich fünf Geburtspilze, um Leben auf dem Erdboden zu sähen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(66, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addCondition(npc.base.condition.quest.quest(66, "=", 4));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Raban's Grove III"));
talkEntry:addResponse("It is honourable that you help me and the godess. For now, I desire five birth mushrooms to spread life on the soil.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(66, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addCondition(npc.base.condition.quest.quest(66, "=", 4));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Rabans Hain III"));
talkEntry:addResponse("Es ehrt euch, dass ihr mir und der Göttin erneut helfen wollt. Nun benötige ich fünf Geburtspilze, um Leben auf dem Erdboden zu sähen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(66, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "herb lore", "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(66, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(162, "all", ">", "4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 100 copper coins and your herb lore skill increases."));
talkEntry:addResponse("Ah, you brought the five birth mushrooms. Long did I store this reward, now it is yours.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "herb lore", "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(162, 5));
talkEntry:addConsequence(npc.base.consequence.quest.quest(66, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(66, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(162, "all", ">", "4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 100 copper coins."));
talkEntry:addResponse("Ah, you brought the five birth mushrooms. Long did I store this reward, now it is yours.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(162, 5));
talkEntry:addConsequence(npc.base.consequence.quest.quest(66, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "herb lore", "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(66, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(162, "all", ">", "4));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 100 Kupferstücke und deine Kräuterkundefertigkeit steigt."));
talkEntry:addResponse("Ah, ihr habt die fünf Geburtspilze mitgebracht. Lange habe ich diese Belohnung aufbewahrt, nun ist sie euer.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "herb lore", "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(162, 5));
talkEntry:addConsequence(npc.base.consequence.quest.quest(66, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(66, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(162, "all", ">", "4));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 100 Kupferstücke."));
talkEntry:addResponse("Ah, ihr habt die fünf Geburtspilze mitgebracht. Lange habe ich diese Belohnung aufbewahrt, nun ist sie euer.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(162, 5));
talkEntry:addConsequence(npc.base.consequence.quest.quest(66, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(66, "=", 5));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Search for the five birth mushrooms at the mushroom circles you may find close to the trees.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(66, "=", 5));
talkEntry:addResponse("Sucht nach den fünf Geburtspilzen in den Pilskreisen, die ihr nahe der Bäume findet.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addCondition(npc.base.condition.quest.quest(66, "=", 5));
talkEntry:addResponse("Search for the five birth mushrooms at the mushroom circles you may find close to the trees.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addCondition(npc.base.condition.quest.quest(66, "=", 5));
talkEntry:addResponse("Sucht nach den fünf Geburtspilzen in den Pilskreisen, die ihr nahe der Bäume findet.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(66, "=", 6));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Raban's Grove IV"));
talkEntry:addResponse("Now I need something special. The soil here is too wet for some plants to grow. I need ten shovel of coarse sand. Please go to my old friend Rutrus at the Oasis of Stars and fetch some, will you?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(66, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(66, "=", 6));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Rabans Hain IV"));
talkEntry:addResponse("Nun benötige ich etwas besonderes. Der Mutterboden hier ist ein wenig zu feucht, damit gewisse Pflanzen hier wachsen können. Ich benötige zehn Schaufeln voll groben Sand. Bitte geht zu meinem alten Freund Rutrus zur Sternenoase und holt mir welchen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(66, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addCondition(npc.base.condition.quest.quest(66, "=", 6));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Raban's Grove IV"));
talkEntry:addResponse("Now I need something special. The soil here is too wet for some plants to grow. I need ten shovel of coarse sand. Please go to my old friend Rutrus at the Oasis of Stars and fetch some, will you?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(66, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addCondition(npc.base.condition.quest.quest(66, "=", 6));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Rabans Hain IV"));
talkEntry:addResponse("Nun benötige ich etwas besonderes. Der Mutterboden hier ist ein wenig zu feucht, damit gewisse Pflanzen hier wachsen können. Ich benötige zehn Schaufeln voll groben Sand. Bitte geht zu meinem alten Freund Rutrus zur Sternenoase und holt mir welchen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(66, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "herb lore", "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(66, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(726, "all", ">", "9));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 200 copper coins and your herb lore skill increases."));
talkEntry:addResponse("I thank you so much for venturing to the Oasis. I hope my friend Rutrus is well? Here, have this reward in exchange for the coarse sand.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "herb lore", "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 200));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(726, 10));
talkEntry:addConsequence(npc.base.consequence.quest.quest(66, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(66, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(726, "all", ">", "9));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 200 copper coins."));
talkEntry:addResponse("I thank you so much for venturing to the Oasis. I hope my friend Rutrus is well? Here, have this reward in exchange for the coarse sand.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 200));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(726, 10));
talkEntry:addConsequence(npc.base.consequence.quest.quest(66, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "herb lore", "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(66, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(726, "all", ">", "9));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 200 Kupferstücke und deine Kräuterkundefertigkeit steigt."));
talkEntry:addResponse("Ich danke euch vielmals für die Reise zur Oase. Ich hoffe, meinem Freund Rutrus geht es gut? Hier, nehmt diese Belohnung für den groben Sand.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "herb lore", "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 200));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(726, 10));
talkEntry:addConsequence(npc.base.consequence.quest.quest(66, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(66, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(726, "all", ">", "9));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 200 Kupferstücke."));
talkEntry:addResponse("Ich danke euch vielmals für die Reise zur Oase. Ich hoffe, meinem Freund Rutrus geht es gut? Hier, nehmt diese Belohnung für den groben Sand.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 200));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(726, 10));
talkEntry:addConsequence(npc.base.consequence.quest.quest(66, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(66, "=", 7));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Head for the Oasis of Stars in order to find ten shovels of coarse sand. You get there when you head south and turn west when you reach the ocean.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(66, "=", 7));
talkEntry:addResponse("Geht zur Sternenoase um zehn Schaufeln voll grobem Sand zu finden. Ihr gelangt dorthin, indem ihr euch in südlicher Richtung auf den Weg macht und euch dann westlich haltet, wenn ihr zum Meer kommt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addCondition(npc.base.condition.quest.quest(66, "=", 7));
talkEntry:addResponse("Head for the Oasis of Hope in order to find ten shovels of coarse sand. You get there when you head south and turn west when you reach the ocean.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addCondition(npc.base.condition.quest.quest(66, "=", 7));
talkEntry:addResponse("Geht zur Oase der Offnung um zehn Schaufeln voll grobem Sand zu finden. Ihr gelangt dorthin, indem ihr euch in südlicher Richtung auf den Weg macht und euch dann westlich haltet, wenn ihr zum Meer kommt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(66, "=", 8));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("There is nothing you can do for me. Just leave me alone, maybe you visit my old friend Rutrus at the oasis again?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(66, "=", 8));
talkEntry:addResponse("Es gibt nichts, was ihr noch für mich tun könntet. Lasst mich einfach alleine, vielleicht wollt ihr meinen Freund Rutrus bei der Oase erneut aufsuchen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addCondition(npc.base.condition.quest.quest(66, "=", 8));
talkEntry:addResponse("There is nothing you can do for me. Just leave me alone, maybe you visit my old friend Rutrus at the oasis again?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addCondition(npc.base.condition.quest.quest(66, "=", 8));
talkEntry:addResponse("Es gibt nichts, was ihr noch für mich tun könntet. Lasst mich einfach alleine, vielleicht wollt ihr meinen Freund Rutrus bei der Oase erneut aufsuchen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("One could call me a hermit. Or a forester. Or a ranger. I do not care anymore.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Man könnte sagen, ich bin ein Einsiedler. Oder ein Waldhüter. Oder ein Förster. Es ist mir einerlei.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("One could call me a hermit. Or a forester. Or a ranger. I do not care anymore.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Man könnte sagen, ich bin ein Einsiedler. Oder ein Waldhüter. Oder ein Förster. Es ist mir einerlei.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I've been to Gobaith, but that is long ago.");
talkEntry:addResponse("I do not want to talk about this with you, I hope you respect that.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addResponse("Ich war einst auf Gobaith, aber das ist schon lange her.");
talkEntry:addResponse("Darüber möchte ich mit euch nicht sprechen. Ich hoffe, ihr respektiert das.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("Names have lost their meaning to me. Behold the trees and ask for their names...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Namen haben ihre Bedeutung für mich verloren. Sehet euch die Bäume an und fragt sie nach ihrem Namen...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hermit");
talkEntry:addTrigger("forester");
talkEntry:addTrigger("ranger");
talkEntry:addTrigger("gardener");
talkEntry:addResponse("Nature can offer much more joy to me than any place, made of cold stone.");
talkEntry:addResponse("I plant trees and watch them grow. Can you imagine anything more... relaxing?");
talkEntry:addResponse("I enjoy the silence here. A branch in the wind can sing wonderful songs.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Einsiedler");
talkEntry:addTrigger("Förster");
talkEntry:addTrigger("Waldhüter");
talkEntry:addTrigger("Wildhüter");
talkEntry:addTrigger("Gärtner");
talkEntry:addResponse("Die Natur bietet mir mehr Freuden als irgendein Ort aus kaltem Stein.");
talkEntry:addResponse("Ich pflanze Bäume und bewundere, wie sie wachsen. Kann sich irgendetwas... entspannenderes vorstellen?");
talkEntry:addResponse("Ich genieße die Stille hier. Ein Ast im Winde kann ein wunderbares Lied singen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("shrine");
talkEntry:addTrigger("grove");
talkEntry:addResponse("Isn't this a lovely place? Most trees, I planted myself.");
talkEntry:addResponse("Honor Ushara for this site is her gift.");
talkEntry:addResponse("Welcome to the place where nature embraces you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Schrein");
talkEntry:addTrigger("Hain");
talkEntry:addResponse("Ist dies nicht ein bewundernswerter Ort? Die meisten Bäume habe ich selbst gepflanzt.");
talkEntry:addResponse("Ehret Ushara, denn all dies ist ihr Geschenk.");
talkEntry:addResponse("Willkommen an dem Ort, wo die Natur dich umarmt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Dürre");
talkEntry:addResponse("Einst, zu einer Zeit, als die es die Erde dürstete, kamen die Völker an diesem Ort zusammen und beteten um Erlösung.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("drought");
talkEntry:addResponse("Once upon a time, when the soil suffered from thirst, the people came to this place and prayed for revelation.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("oasis");
talkEntry:addResponse("At the Oasis of Hope, my good friend Rutrus has found his peace. Maybe you want to visit him?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("oase");
talkEntry:addResponse("Bei der Sternenoase hat mein guter Freund Rutrus seinen Frieden gefunden. Vielleicht wollt ihr ihn ja mal besuchen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Rutrus");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("At the Oasis of Stars, my good friend Rutrus has found his peace. Maybe you want to visit him?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Rutrus");
talkEntry:addResponse("Bei der Sternenoase hat mein guter Freund Rutrus seinen Frieden gefunden. Vielleicht wollt ihr ihn ja mal besuchen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bruno");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("That name sounds familiar, but living in solitude, I forgot about names with time.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bruno");
talkEntry:addResponse("Der Name klingt vertraut, aber hier in der Einsamkeit vergißt man Namen mit der Zeit.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("herbs");
talkEntry:addResponse("You can gather herbs with a sickle. But do not cut too many - Ushara won't be pleased when you plunder her treasury.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Kräuter");
talkEntry:addResponse("Ihr könnt Kräuter mit einer Sichel sammeln. Aber schneidet nicht zu viele ab - Ushara wird nicht erfreut sein, wenn ihr ihren Garten plündert.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("sickle");
talkEntry:addCondition(npc.base.condition.quest.quest(66, "=", 0));
talkEntry:addResponse("With sickles, you can cut fir tree seedlings to plant new trees. If you want to help me, ask me for a task.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sichel");
talkEntry:addCondition(npc.base.condition.quest.quest(66, "=", 0));
talkEntry:addResponse("Mit einer Sichel könnt ihr Fichtensetzlinge schneiden um neue Bäume zu pflanzen. Wenn ihr mir dabei helfen wollt, fragt mich nach einem Auftrag.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("sickle");
talkEntry:addResponse("In case you need a new sickle, ask for William in Runewick. If he is still alive after all those years we didn't meet.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sichel");
talkEntry:addResponse("Wenn du einen neue Sichel benötigst, fragt nach William in Runewick. Ich hoffe, er ist nach all diesen Jahren, die wir uns nicht sahen, noch am Leben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addResponse("Once, I called the archmage of Runewick a friend of mine. But we disagreed in too many things, so I left Runewick for good.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Einst nannte ich den Erzmagier Runewicks einen Freund. Aber wir stritten über zu viele Dinge, so dass ich Runewick für immer verließ.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Once, I called the archmage of Runewick a friend of mine. But we disagreed in too many things, so I left Runewick for good.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Einst nannte ich den Erzmagier Runewicks einen Freund. Aber wir stritten über zu viele Dinge, so dass ich Runewick für immer verließ.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("The only place where you can find peace is Runewick. But I still prefer the forest.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Der einzige Ort, wo es Frieden gibt ist Runewick. Dennoch ziehe ich den Wald vor.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I thank for every minute of life, not having to deal with any greedy dwarf.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Ich bin für jede Minute meines Lebens dankbar, in der ich mich nicht mit gierigen Zwergen herumplagen muss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Galmair? A pool of sins, it is!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Galmair? Ein Sündenpfuhl ist das!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Queen");
talkEntry:addResponse("Isn't Cadomyr's souvereign king Reginald Edwards?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königin");
talkEntry:addResponse("Heißt der Herrscher Cadomyrs nicht König Reginald Edwards?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Isn't Cadomyr's souvereign king Reginald Edwards?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Heißt der Herrscher Cadomyrs nicht König Reginald Edwards?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Cadomyr is a rough place to the south. I wonder how Rutrus can stand this place.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Cadomyr ist ein wüster Ort im Süden. Ich frage mich, wie Rutrus es dort aushält.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I stopped caring about things that happen abroad. Be it Albar, Gynk or Salkamar.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("Ich habe aufgehört mich um Dinge zu sorgen, die weit entfernt geschehen, egal of Albar, Gynk oder Salkamar.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I stopped caring about things that happen abroad. Be it Albar, Gynk or Salkamar.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("Ich habe aufgehört mich um Dinge zu sorgen, die weit entfernt geschehen, egal of Albar, Gynk oder Salkamar.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I stopped caring about things that happen abroad. Be it Albar, Gynk or Salkamar.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Ich habe aufgehört mich um Dinge zu sorgen, die weit entfernt geschehen, egal of Albar, Gynk oder Salkamar.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("In the solitude of the forest, one starts to think a lot about the gods - without conclusion so far.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("In der Einsamkeit des Waldes denkt man viel über sich und die Götter nach - doch bin ich noch zu keinem Schluss gekommen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ushara");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Honour the goddess!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("Ehret die Göttin!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oldra");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Oldra... I am sure I saw her one day, dancing during dawn on the grass.");
talkEntry:addResponse("Oldra now takes care of all the wonders Ushara has left on the land.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("Oldra... Ich bin mir sicher, ich habe sie einst auf dem taufeuchtem Grass im Morgenlicht tanzen sehen.");
talkEntry:addResponse("Oldra pflegt nun all die Wunder, die uns Ushara auf dem Land hinterlassen hat.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Darlok");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Could you please not mention that name in front of me?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Darlok");
talkEntry:addResponse("Mögt ihr diesen Namen bitte nicht in meiner Gegenwart erwähnen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Falkner");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("What did you say?");
talkEntry:addResponse("That's not my name... anymore.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Falkner");
talkEntry:addResponse("Wie bitte?");
talkEntry:addResponse("So heiße ich nicht... mehr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("Is money all that matters for you? I abstain from it since decades and never missed it a single day.");
talkEntry:addResponse("I have no use for money. So I do not trade.");
talkEntry:addResponse("I am not a trader. Maybe you want to help me in a quest?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Ist denn Gold alles, was für euch zählt? Ich entsagte ihm schon vor langer Zeit und habe es nicht an einem einzelnen Tag vermißt.");
talkEntry:addResponse("Ich brauche kein Gold, also handele ich auch nicht.");
talkEntry:addResponse("Ich bin kein Händler. Aber vielleicht kannst du mir bei einem Auftrag helfen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("Once upon a time, when the soil suffered from thirst, the people came to this place and prayed for revelation.");
talkEntry:addResponse("I did not make this place, nature did. But few honor the wonders of Ushara and Oldra.");
talkEntry:addResponse("Tales of old I never witnessed. Seldom, travellers come here to tell me about foreign lands.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Einst, zu einer Zeit, als die es die Erde dürstete, kamen die Völker an diesem Ort zusammen und beteten um Erlösung.");
talkEntry:addResponse("Ich habe diesen Ort nicht geschaffen. Die Natur tat es. Aber nur wenige ehren die Wunder von Ushara und Oldra.");
talkEntry:addResponse("Die Legenden alter Zeiten habe ich nie erlebt. Und nur selten kommen Wanderer hierher, um aus anderen Ländern zu berichten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Raban");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Raban... yes, that's how they uses to call me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Raban");
talkEntry:addResponse("Raban... ja, so hat man mich mal genannt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("Yes?");
talkEntry:addResponse("Probably.");
talkEntry:addResponse("I thought so.");
talkEntry:addResponse("Are you sure?");
talkEntry:addResponse("Maybe.");
talkEntry:addResponse("What makes you so sure about this?");
talkEntry:addResponse("Definitely.");
talkEntry:addResponse("Whatever...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("Ja?");
talkEntry:addResponse("Wahrscheinlich.");
talkEntry:addResponse("Hab ich mir gedacht.");
talkEntry:addResponse("Seid ihr sicher?");
talkEntry:addResponse("Vielleicht.");
talkEntry:addResponse("Was macht euch so sicher?");
talkEntry:addResponse("Sicherlich.");
talkEntry:addResponse("Wie auch immer...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("No?");
talkEntry:addResponse("But on the other hand...");
talkEntry:addResponse("Well...");
talkEntry:addResponse("Maybe you reconsider about this?");
talkEntry:addResponse("Is that all you have to say about this?");
talkEntry:addResponse("I disagree.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("Nein?");
talkEntry:addResponse("Aber andererseits...");
talkEntry:addResponse("Nun...");
talkEntry:addResponse("Vielleicht ändert ihr eure Meinung noch einmal?");
talkEntry:addResponse("Ist das alles, was ihr dazu sagen wollt?");
talkEntry:addResponse("Ich muss widersprechen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me klopft die Erde um einen frisch gepflanzten Setzling glatt.", "#me smoothes the soil around a newly planted seedling.");
talkingNPC:addCycleText("Wachst und gedeiht, meine Kinder.", "Grow and prosper, my children.");
talkingNPC:addCycleText("#me streicht sachte über die Blätter eines Strauches und seufzt.", "#me strokes gently the leaves of a bush and sighs.");
talkingNPC:addCycleText("#me flüstert kaum hörbar zu einer Fichte. Man kann sich einbilden, die Äste des Baumes würden antwortend im Wind rauschen.", "#me whispers to a fir tree, barely audible. One could imagine the branches of the tree sough in response.");
talkingNPC:addCycleText("Waren wir noch längst nicht geboren, saht ihr auf alles herab. Sind wir längst gegangen, gehört euch das Land erneut.", "When we weren't even born, you already beheld all. When we are long gone, the land will be yours again.");
talkingNPC:addCycleText("Ich habe etwas gehört.", "I heard something.");
talkingNPC:addCycleText("Shh! Wenn ihr ganz still seid, könnt ihr dem Klang der Stille lauschen.", "Shh! If you're quiet, you can listen to the sound of silence.");
talkingNPC:addCycleText("#me schaut sich um und nickt zufrieden.", "#me looks around contentedly.");
talkingNPC:addCycleText("Wer wagt es, meine Ruhe zu stören?", "Who dares to disturb me?");
talkingNPC:addCycleText("Willkommen in meinem Hain.", "Welcome to my grove.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(1);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Dieser NPC ist der Einsiedler Raban.", "This NPC is the hermit Raban.");
mainNPC:setUseMessage("Fass mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut dich verwirrt an.", "#me looks at you confused.");
mainNPC:setEquipment(1, 829);
mainNPC:setEquipment(3, 365);
mainNPC:setEquipment(11, 2419);
mainNPC:setEquipment(5, 207);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 48);
mainNPC:setEquipment(9, 34);
mainNPC:setEquipment(10, 369);
mainNPC:setAutoIntroduceMode(true);

mainNPC:initDone();
end;

function receiveText(npcChar, texttype, message, speaker) mainNPC:receiveText(npcChar, speaker, message); end;
function nextCycle(npcChar) mainNPC:nextCycle(npcChar); end;
function lookAtNpc(npcChar, char, mode) mainNPC:lookAt(npcChar, char, mode); end;
function useNPC(npcChar, char, counter, param) mainNPC:use(npcChar, char); end;
initNpc();
initNpc = nil;
-- END
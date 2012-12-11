--------------------------------------------------------------------------------
-- NPC Name: Aldania Elthewan                                            None --
-- NPC Job:  Tutor                                                            --
--                                                                            --
-- NPC Race: elf                        NPC Position:  52, 24, 100            --
-- NPC Sex:  female                     NPC Direction: west                   --
--                                                                            --
-- Author:   Estralis Seborian                                                --
--                                                       easyNPC Parser v1.21 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (3, 52, 24, 100, 6, 'Aldania Elthewan', 'npc.aldania_elthewan', 1, 8, 0, 255, 215, 0, 245, 200, 145);
---]]

require("npc.base.basic")
require("npc.base.condition.item")
require("npc.base.condition.language")
require("npc.base.condition.quest")
require("npc.base.consequence.inform")
require("npc.base.consequence.item")
require("npc.base.consequence.quest")
require("npc.base.consequence.warp")
require("npc.base.talk")
module("npc.aldania_elthewan", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("reset");
talkEntry:addResponse("Noobia reset!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(309, "=", 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(310, "=", 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(311, "=", 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(312, "=", 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(313, "=", 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(314, "=", 0));
talkEntry:addConsequence(npc.base.consequence.warp.warp(31, 22, 100));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] This NPC is the tutor Aldania Elthewan. Keywords: Hello, Help, Skip tutorial."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] Dieser NPC ist die Tutorin Aldania Elthewan. Schlüsselwörter: Hallo, Hilfe, Tutorial überspringen."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("skip");
talkEntry:addTrigger("cancel");
talkEntry:addTrigger("abort");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] You have decided to skip the tutorial. Please choose a realm to be the home for your character by stepping through the corresponding portal on one of the three islands to the south."));
talkEntry:addConsequence(npc.base.consequence.warp.warp(36, 94, 100));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("überspring");
talkEntry:addTrigger("abbrech");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] Du hast entschieden das Tutorial zu überspringen. Bitte wähle ein Reich als Heimat deines Charakters aus, indem du durch das entsprechende Portal auf einer der drei Inseln im Süden trittst."));
talkEntry:addConsequence(npc.base.consequence.warp.warp(36, 94, 100));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(310, "<", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] Please make sure that your chatbox is deactivated and then press 'I' to open your inventory. Eventually, double click on your backpack to open it. Drag the pick-axe to an empty hand slot in your inventory by holding the left mouse button."));
talkEntry:addResponse("Be greeted, %CHARNAME. My name is Aldania Elthewan and I am here to teach you how to equip, examine and use items. Let us start with the basics, equipping. I have just given you a pick-axe, hold it in your hands, please.");
talkEntry:addConsequence(npc.base.consequence.item.item(2763, 1, 333, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(310, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(310, "<", 2));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] Bitte überprüfe, ob deine Chatbox deaktiviert ist und drücke anschließend 'I', um dein Inventar zu öffnen. Öffne gegebenenfalls deinen Rucksack mit einem Doppelklick. Ziehe die Spitzhacke mit gedrückter linker Maustaste in ein leeres Handfeld in deinem Inventar."));
talkEntry:addResponse("Seid gegrüßt, %CHARNAME. Mein Name ist Aldania Elthewan und ich bin hier, um Euch beizubringen, wie man sich mit Gegenständen ausrüstet, sie untersucht und benutzt. Lasst uns mit dem wichtigsten anfangen: dem Ausrüsten. Ich habe Euch soeben eine Spitzhacke gegeben, bitte nehmt sie in die Hand.");
talkEntry:addConsequence(npc.base.consequence.item.item(2763, 1, 333, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(310, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(310, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(2763, "all", "=", 0, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Alas, it looks like you lost the pick-axe I gave you. Do not be so careless with your belongings! Here, have another. Take it into your hands, please.");
talkEntry:addConsequence(npc.base.consequence.item.item(2763, 1, 333, nil));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(310, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(2763, "all", "=", 0, nil));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Ach herrje, es schaut aus, als hättet Ihr die Spitzhacke verloren, die ich Euch gab. Ihr solltet besser auf Euer Hab und Gut aufpassen! Hier habt ihr eine Neue. Nehmt sie bitte in die Hand.");
talkEntry:addConsequence(npc.base.consequence.item.item(2763, 1, 333, nil));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(310, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] Make sure that your chatbox is deactivated and then press 'I' to open your inventory. Eventually, double click on your backpack to open it. Drag the pick-axe to an empty hand slot in your inventory by holding the left mouse button."));
talkEntry:addResponse("Please place the pick-axe into your hands. Learning how to equip items is important, just imagine if you should face a dragon and could not even draw your sword!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(310, "=", 2));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] Bitte überprüfe, ob deine Chatbox deaktiviert ist und drücke anschließend 'I', um dein Inventar zu öffnen. Öffne gegebenenfalls deinen Rucksack mit einem Doppelklick. Ziehe die Spitzhacke mit gedrückter linker Maustaste in ein leeres Handfeld in deinem Inventar."));
talkEntry:addResponse("Bitte nehmt die Spitzhacke in die Hand. Zu lernen wie man Gegenstände ausrüstet ist wichtig. Stellt Euch nur vor, Ihr würdet auf einen Drachen stoßen und könntet nichtmal Euer Schwert ziehen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(310, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2763, "all", "=", 0, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Alas, it looks like you lost the pick-axe I gave you. Don't be so careless with your belongings! Here, have another one. Examine it, please.");
talkEntry:addConsequence(npc.base.consequence.item.item(2763, 1, 333, nil));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(310, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2763, "all", "=", 0, nil));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Ach herrje, es schaut aus als hättet Ihr die Spitzhacke verloren die ich Euch gab. Ihr solltet besser auf Euer Hab und Gut aufpassen! Hier habt ihr eine Neue. Untersucht sie einmal.");
talkEntry:addConsequence(npc.base.consequence.item.item(2763, 1, 333, nil));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(310, "=", 3));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] Make sure that your chatbox is deactivated and then press 'I' to open your inventory. Double click on your backpack to open it. Move the mouse cursor over the pick-axe in order to examine it."));
talkEntry:addResponse("In order to examine an item, you simply have to move your mouse cursor over it. Learning about your belongings is as vital as acquiring them.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(310, "=", 3));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] Bitte überprüfe, ob deine Chatbox deaktiviert ist und drücke anschließend 'I', um dein Inventar zu öffnen. Öffne deinen Rucksack mit einem Doppelklick. Bewege den Mauszeiger über die Spitzhacke um sie zu untersuchen."));
talkEntry:addResponse("Um einen Gegenstand zu untersuchen, müsst Ihr einfach nur den Mauszeiger über ihn platzieren. Etwas über sein Hab und Gut zu lernen, ist mindestens so wichtig, wie es zu erlangen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(310, "=", 4));
talkEntry:addCondition(npc.base.condition.item.item(391, "all", "=", 0, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Without a light source, the darkness will engulf you sooner or later. I have given you another torch, be more careful with this one.");
talkEntry:addConsequence(npc.base.consequence.item.item(391, 1, 333, nil));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(310, "=", 4));
talkEntry:addCondition(npc.base.condition.item.item(391, "all", "=", 0, nil));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Ohne eine Lichtquelle wird Euch die Dunkelheit früher oder später einhüllen. Ich habe Euch eine neue Fackel gegeben, bitte seid vorsichtiger mit dieser.");
talkEntry:addConsequence(npc.base.consequence.item.item(391, 1, 333, nil));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(310, "=", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] Make sure that your chatbox is deactivated and then press 'I' to open your inventory. Double click on your backpack to open it. You can perform a double click on an item to use it. Double click the torch to ignite it."));
talkEntry:addResponse("What is the purpose of owning an item if you cannot use it properly? Ignite the torch I gave you with a double click. Light sources are quite important when travelling by night.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(310, "=", 4));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] Bitte überprüfe, ob deine Chatbox deaktiviert ist und drücke anschließend 'I', um dein Inventar zu öffnen. Öffne deinen Rucksack mit einem Doppelklick. Du kannst einen Gegenstand mit einerm Doppelklick benutzen. Doppelklick die Fackel, um sie zu entzünden."));
talkEntry:addResponse("Was ist der Nutzen von einem Gegenstand, wenn man ihn nicht richtig benutzen kann? Entzündet die Fackel, welche ich Euch gab, mit einem Doppelklick. Wenn man Nachts unterwegs ist, sind Lichtquellen sehr wichtig.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(310, "=", 5));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".*");
talkEntry:addResponse("This is where we part company, %CHARNAME. You have done well enough. Run along to that savage, Groknar, further down the road. He will train you in the art of fighting.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(310, "=", 5));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Dies ist der Zeitpunkt, um getrennte Wege zu gehen, %CHARNAME. Ihr habt euch wacker geschlagen. Geht nur weiter die Straße entlang zu diesem Wilden: Groknar. Er wird Euch in der Kunst des Kampfes unterrichten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("Aldania Elthewan zu Euren Diensten. Ich unterrichte das Ausstatten, Untersuchen und Benutzen von Gegenständen.", "Aldania Elthelwan, at your service. Equipping, examining and using items is what I teach.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(3);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Das ist deine Tutorin Aldania Elthewan.", "This is your tutorial guide Aldania Elthewan.");
mainNPC:setUseMessage("Finger weg!", "Do not touch me!");
mainNPC:setConfusedMessage("Bitte wechsle die Sprache deines Charakters zur Gemeinsprache mit dem Befehl '!l common'.", "Please switch the language of your character to the common tongue with the command '!l common'.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 800);
mainNPC:setEquipment(11, 0);
mainNPC:setEquipment(5, 0);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 2295);
mainNPC:setEquipment(9, 0);
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
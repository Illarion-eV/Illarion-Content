--------------------------------------------------------------------------------
-- NPC Name: Nimbur Goldhand                                             None --
-- NPC Job:  Blacksmith                                                       --
--                                                                            --
-- NPC Race: dwarf                      NPC Position:  42, 83, 100            --
-- NPC Sex:  male                       NPC Direction: west                   --
--                                                                            --
-- Author:   Estralis Seborian                                                --
--                                                                            --
-- Last parsing: August 18, 2012                          easyNPC Parser v1.2 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (1, 42, 83, 100, 6, 'Nimbur Goldhand', 'npc.nimbur_goldhand', 0, 3, 1, 105, 105, 105, 205, 130, 70);
---]]

require("npc.base.basic")
require("npc.base.condition.item")
require("npc.base.condition.language")
require("npc.base.condition.quest")
require("npc.base.consequence.deleteitem")
require("npc.base.consequence.inform")
require("npc.base.consequence.item")
require("npc.base.consequence.quest")
require("npc.base.consequence.warp")
require("npc.base.talk")
module("npc.nimbur_goldhand", package.seeall)

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
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] This NPC is the tutor Nimbur Goldhand. Keywords: Hello, Help, Skip tutorial."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] Dieser NPC ist der Tutor Nimbur Goldhand. Schlüsselwörter: Hallo, Hilfe, Tutorial überspringen."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("skip");
talkEntry:addTrigger("cancel");
talkEntry:addTrigger("abort");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] You have decided to skip the tutorial. Please choose a realm to be the home for your character by stepping through the corresponding portal on one of the three islands."));
talkEntry:addConsequence(npc.base.consequence.warp.warp(35, 95, 100));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("überspring");
talkEntry:addTrigger("abbrech");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] Du hast entschieden, das Tutorial zu überspringen. Bitte wähle ein Reich als Heimat deines Charakters aus, indem du durch das entsprechende Portal auf einer der drei Inseln trittst."));
talkEntry:addConsequence(npc.base.consequence.warp.warp(35, 95, 100));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(313, "<", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] Blacksmithing requires you to stand in front of an anvil and use a hammer, which must be held in your hands. Then, choose the desired product from the menu to start working on it."));
talkEntry:addResponse("Arr... right. Listen up! I tell ye everything about blacksmithing ye need to know. Here, take this hammer and these ingots. Step inside and don't dare come out without three sets of pins in yer bag!");
talkEntry:addConsequence(npc.base.consequence.item.item(23, 1, 599, 0));
talkEntry:addConsequence(npc.base.consequence.item.item(2535, 10, 599, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(313, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(313, "<", 2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] Um zu schmieden, stell dich vor einen Amboss und benutze den in der Hand gehaltenen Hammer. Wähle dann ein Produkt aus dem Menü aus, um anzufangen es zu fertigen."));
talkEntry:addResponse("Arr, richtig. Hör zu! Ich werd' dir alles, was ich weiß, über's schmieden beibringen. Hier, nimm diesen Hammer und diesen Barren und geh rein und komm nicht eher raus, bis du drei Sätze Nägel in deiner Tasche hast! ");
talkEntry:addConsequence(npc.base.consequence.item.item(23, 1, 599, 0));
talkEntry:addConsequence(npc.base.consequence.item.item(2535, 10, 599, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(313, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(313, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(2738, "all", ">", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] You are awarded an iron goblet."));
talkEntry:addResponse("Aye! Ye did it! I'll give ye this cup as example of my work, and of what ye might be able to achieve one day. Don't hesitate to show it off to everyone on the main land... ye might land me some more customers. Harr! Viola Baywillow, down the road, will help ye to choose a proper home and send ye on yer way.");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2738, 3));
talkEntry:addConsequence(npc.base.consequence.item.item(223, 1, 599, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(313, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(313, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(2738, "all", ">", 2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] Du erhältst einen Eisenkelch."));
talkEntry:addResponse("Aye! Du hast es geschafft! Nimm diesen Kelch als Beispiel für meine Arbeit und als Zeichen, was du vielleicht mal erreichen kannst. Zögere nicht, ihn auch auf dem Festland rumzuzeigen, vielleicht verschaffste mir ja ein paar Kunden. Harr! Viola Bayillow, die die Straße runter wohnt, wird dir helfen, 'ne vernünftige Heimat auszusuchen und dich auf deinen Weg schicken.");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2738, 3));
talkEntry:addConsequence(npc.base.consequence.item.item(223, 1, 599, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(313, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(313, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(23, "all", "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Bah! Without a hammer, ye are not able to forge. Losing your hammer is the first step towards ending up on the rocks. Luckily for ye, I have another one.");
talkEntry:addConsequence(npc.base.consequence.item.item(23, 1, 599, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(313, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(23, "all", "=", 0));
talkEntry:addResponse("Bah! Ohne 'nen Hammer kannste nicht schmieden. Deinen Hammer zu verlieren, ist der erste Schritt im Staub zu landen. Zum Glück hab' ich noch einen für dich.");
talkEntry:addConsequence(npc.base.consequence.item.item(23, 1, 599, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(313, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(2535, "all", "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I see ye used up all the iron ingots I gave ye - quite a bad haul then, aye? I give ye one more ingot but ye have to promise me that ye will forge those three sets of pins right now. Get on with it!");
talkEntry:addConsequence(npc.base.consequence.item.item(2535, 1, 599, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(313, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(2535, "all", "=", 0));
talkEntry:addResponse("Ich sehe, du hast die ganzen Barren aufgebraucht, die ich dir gegeben habe - keine gute Quote, aye? Hier haste noch einen Barren, aber du musst mir versprechen, dass du jetzt drei Sätze Nägel schmiedest. Geh und fang an!");
talkEntry:addConsequence(npc.base.consequence.item.item(2535, 1, 599, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(313, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", "<", 3));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] Blacksmithing requires you to stand in front of an anvil and use a hammer, which must be held in your hands. Then, choose the desired product from the menu to start working on it."));
talkEntry:addResponse("Any problems with forging? Just slam the hammer on the hot metal until it gets the desired shape. Simple. Harr! I need three sets of pins, I'm sure even ye can manage that!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(313, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", "<", 3));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] Um zu schmieden, stell dich vor einen Amboss und benutze den in der Hand gehaltenen Hammer. Wähle dann ein Produkt aus dem Menü aus, um anzufangen es zu fertigen."));
talkEntry:addResponse("Probleme mit dem Schmieden? Einfach mit dem Hammer auf das heiße Metall schlagen, bis es die gewünschte Form annimmt. Ganz einfach. Harr! Ich brauche drei Sätze Nägel und ich bin mir sicher, dass auch du das schaffen kannst!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(313, "=", 3));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Harr! Now I've only gone and trained another competitor for my business - yet again. But true dwarven craft knows no competition! I can proudly say ye learned all that ye need to get started now. Viola Baywillow will help ye to choose a proper home and send ye on yer way.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(313, "=", 3));
talkEntry:addResponse("Harr! Jetzt hab' ich schon wieder einen Konkurrenten für mein Geschäft trainiert. Aber wahre Zwergenkunst hat keine Konkurrenz! Ich kann mit Stolz sagen, dass du alles gelernt hast für den Anfang. Viola Bayillow wird dir helfen 'ne vernünftige Heimat auszusuchen und dich auf deinen Weg schicken.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("Hier drüben! Ich bin Nimbur, der beste Schmied von allen! Wenn du willst, kann ich dir ein paar Tricks beibringen. ", "Over here! I am Nimbur, the finest blacksmith of them all. I can teach ye some tricks if ye please.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(2);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Das ist dein Tutor Nimbur Goldhand der Schmied.", "This is your tutorial guide Nimbur Goldhand the blacksmith.");
mainNPC:setUseMessage("Finger weg!", "Do not touch me!");
mainNPC:setConfusedMessage("Bitte wechsle die Sprache deines Charakters zur Gemeinsprache, indem du DAS UND DAS TUST.", "Please switch the language of your character to the common tongue by DOING THIS AND THAT.");
mainNPC:setEquipment(1, 356);
mainNPC:setEquipment(3, 365);
mainNPC:setEquipment(11, 196);
mainNPC:setEquipment(5, 0);
mainNPC:setEquipment(6, 23);
mainNPC:setEquipment(4, 48);
mainNPC:setEquipment(9, 34);
mainNPC:setEquipment(10, 53);
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
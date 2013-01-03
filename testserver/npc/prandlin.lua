--------------------------------------------------------------------------------
-- NPC Name: Prandlin                                                Runewick --
-- NPC Job:  Snorring                                                         --
--                                                                            --
-- NPC Race: halfling                   NPC Position:  789, 790, 0            --
-- NPC Sex:  male                       NPC Direction: northeast              --
--                                                                            --
-- Author:   Rincewind                                                        --
--                                                       easyNPC Parser v1.21 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (2, 789, 790, 0, 1, 'Prandlin', 'npc.prandlin', 0, 2, 0, 226, 224, 222, 245, 180, 137);
---]]

require("npc.base.basic")
require("npc.base.condition.item")
require("npc.base.condition.language")
require("npc.base.condition.quest")
require("npc.base.consequence.deleteitem")
require("npc.base.consequence.inform")
require("npc.base.consequence.item")
require("npc.base.consequence.quest")
require("npc.base.talk")
module("npc.prandlin", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(304, "=", 1));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.inform.inform("'Dort! Prandlins Gehstock... er sieht aus als wäre er früher ein Holzbein gewesen! Das muss das Holzbein von Holzbein-Jack sein! Aber wie kann ich es nehmen ohne, dass der alte Halbling aufwacht?'"));
talkEntry:addResponse("#me umklammert seinen Gehstock und zieht die Wolldecke hoch, ohne zu erwachen. Es ist ein kurzer schön verzierter Stab wie ihn Magier verwenden.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(304, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(304, "=", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.inform.inform("'Look! Prandlins walking stick... it looks like it was once a peg leg. This must be the peg leg of Peg-Leg-Jack! How to steel it, without wake the old halflin up?'"));
talkEntry:addResponse("#me's grabs the walking stick tight and pulls the blanket to his chin, still asleep. It's a short beautiful ornated staff, like a mage would use.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(304, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(304, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.inform.inform("'Wenn es mir gelingt, einen verzierten Magierstab zu besorgen könnte ich versuchen diesen mit dem Stab des Alten auszutauschen, ohne das er aufwacht.'"));
talkEntry:addResponse("#me brabbelt zufrieden lächelnd und sabbert schmatzend auf seine Wolldecke. ");
talkEntry:addConsequence(npc.base.consequence.quest.quest(304, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(304, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.inform.inform("'If I provide a ornate mage's staff, it may be possible to replace it with old Prandlins walking stick, without wake him up."));
talkEntry:addResponse("#me smiles happy and babbles and drools on his woollen blanket.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(304, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(304, "=", 3));
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Es wird ein Emote benötigt um das Holzbein mit dem verzierten Magierstab auszutauschen, welcher ebenso mitgebracht werden muss."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(304, "=", 3));
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] A emote is needed to replace the peg leg with the ornate mage's staff, which need to be brought as well."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(304, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(208, "all", "=>", 1, nil));
talkEntry:addTrigger("#me (.+) stab");
talkEntry:addTrigger("#me (.+) bein");
talkEntry:addTrigger("#me (.+) Holzbein");
talkEntry:addTrigger("#me (.+) Magierstab");
talkEntry:addTrigger("#me (.+) stäbe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Großartig! Es hat geklappt. Nun besitze ich den Gehstock von Prandlin, der eigentlich Jack's Holzbein ist. Ich sollte es schnell zu ihm bringen."));
talkEntry:addResponse("#me bemerkt nicht wie der verzierte Stab gegen seinen Gehstock ausgetauscht wird und schläft selig weiter.");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(208, 1, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(208, 1, 944, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(304, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(304, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(208, "all", "=>", 1, nil));
talkEntry:addTrigger("#me (.+) staff");
talkEntry:addTrigger("#me (.+) leg");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Awesome! It's done. Now I hold Prandlin's walking stick, which is in fact Jack's Peg Leg. Let's bring the Peg leg into the Pirate Bay."));
talkEntry:addResponse("#me took no notice when his walking stick got replaced and sleeps along.");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(208, 1, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(208, 1, 944, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(304, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(304, "=", 3));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.inform.inform("'Wenn es mir gelingt, einen verzierten Magierstab zu besorgen könnte ich versuchen diesen mit dem Stab des Alten auszutauschen, ohne das er aufwacht.'"));
talkEntry:addResponse("#me brabbelt zufrieden lächelnd und sabbert schmatzend auf seine Wolldecke.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(304, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(304, "=", 3));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.inform.inform("'If I provide a ornate mage's staff, it may be possible to replace it with old Prandlins walking stick, without wake him up."));
talkEntry:addResponse("#me smiles happy and babbles and drools on his woollen blanket.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Prandlin der Piratenjäger in Ruhestand. Schlüsselwörter: keine spezifischen."));
talkEntry:addResponse("#me ist ein alter runzeliger Halbling der im Sessel eingeschlafen ist. Dabei kuschelt er sich, so gut wie möglich an einen verzierten Magierstab.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Prandlin the retired pirate hunter. Keywords: nothing specific."));
talkEntry:addResponse("#me is as old as the hills, he slumbers peacfully in front of the chimney, snuggling a ornate mage's staff.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger(".*");
talkEntry:addResponse("#me murmelt im Schlaf: 'Eh-n. Gnh.'");
talkEntry:addResponse("#me murmelt im Schlaf: 'Piraten werd... gehängt.'");
talkEntry:addResponse("#me murmelt im Schlaf: 'Wie sie mein-n...'");
talkEntry:addResponse("#me murmelt im Schlaf: 'Jetzt hab ich nur noch Einen übrig...'");
talkEntry:addResponse("#me murmelt im Schlaf: 'Hm-hhm? Ich nehm Kuchn...'");
talkEntry:addResponse("#me murmelt im Schlaf: 'Lasst den alten Prandlin in frieden...'");
talkEntry:addResponse("#me murmelt im Schlaf: 'Ja-ja.. ich kümmere mich darum. Gleich morgen...'");
talkEntry:addResponse("#me murmelt im Schlaf: 'Uh, schon Mittag...?'");
talkEntry:addResponse("#me murmelt im Schlaf: 'Diese Piraten... verflucht sein...'");
talkEntry:addResponse("#me murmelt im Schlaf: 'Elara... vertraun wir dem Wissen...'");
talkEntry:addResponse("#me murmelt im Schlaf: 'Galmair soll sich bloß nicht für voll nehmn...'");
talkEntry:addResponse("#me murmelt im Schlaf: '..und dann wird Cadomyr verhandeln müssen..'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".*");
talkEntry:addResponse("#me mumbles while sleeping: 'Eh-n. Gnh.'");
talkEntry:addResponse("#me mumbles while sleeping: 'Pirates'll... dangle.'");
talkEntry:addResponse("#me mumbles while sleeping: 'Indee' agreed...'");
talkEntry:addResponse("#me mumbles while sleeping: 'There... my last one.'");
talkEntry:addResponse("#me mumbles while sleeping: 'Hm-hhm? I take cake...'");
talkEntry:addResponse("#me mumbles while sleeping: 'Leave old Prandlin in peace...'");
talkEntry:addResponse("#me mumbles while sleeping: 'Will do - it. Tomorrow...'");
talkEntry:addResponse("#me mumbles while sleeping: 'Uh, lunchtime?'");
talkEntry:addResponse("#me mumbles while sleeping: 'Those pirates... damn...'");
talkEntry:addResponse("#me mumbles while sleeping: 'Elara... trust - wisdom...'");
talkEntry:addResponse("#me mumbles while sleeping: 'Galmair... beggars. Gnhg.'");
talkEntry:addResponse("#me mumbles while sleeping: 'Then Cadomyr... negotiate.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me brabbelt leise in Schlaf.", "#me babbles quietly while asleep.");
talkingNPC:addCycleText("#me dreht sich im Schlaf herum.", "#me turns around.");
talkingNPC:addCycleText("#me zieht die Wolldecke um seine Beine, etwas höher.", "#me pulls the woolen blanket right up to his chin.");
talkingNPC:addCycleText("#me schmatzt ein wenig.", "#me smacks several times, then gives a short snort.");
talkingNPC:addCycleText("#me schnarcht laut und melodiös.", "#me snorts loud and melodious.");
talkingNPC:addCycleText("#me gibt einen grunzenden Laut von sich.", "#me produces a grunting noise.");
talkingNPC:addCycleText("#me sabbert in seine Wolldecke.", "#me drools on to his blanket.");
talkingNPC:addCycleText("#me kuschelt sich an den verzierten Magierstab, in seinen Händen.", "#me cuddles his ornate mage's staff.");
talkingNPC:addCycleText("#me atmet beinahe unmerklich, kaum eine Bewegung ist auszumachen.", "#me moves are almost not seeable and his breath barly able to notice.");
talkingNPC:addCycleText("#me sitzt regungslos vor dem knisternden Kamin, der wohlige Wärme im Raum verbreitet.", "#me sits motionless in front of the chimney, which spreeds hearty heat into the room.");
talkingNPC:addCycleText("#me schläft seelig ruhig im besten Sessel des Raumes. Da wundert es nicht, dass er ein Glückliches Gesicht macht.", "#me show's a happy smile while sleeping in the best chair of the room.");
talkingNPC:addCycleText("#me kratzt sich im Schlaf die haarige krumme Nase.", "#me gives his hairy short nose a scratch while still asleep.");
talkingNPC:addCycleText("#me beginnt leise und gackernd zu lachen, trotzdem scheint er weiter zu schlafen.", "#me start to giggle quietly, altough don't weak up.");
talkingNPC:addCycleText("#me murmelt im Schlaf: 'Ich muss den Erzmagier sprech...'", "#me mumbles while still sleeping: 'Have... speak.... archmage....'");
mainNPC:addLanguage(0);
mainNPC:addLanguage(5);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Ein steinalter Halbling, der friedlich in seine Decke gekuschelt vor sich hin schlummert.", "A halfling old as the hills, he slumbers peacfully in front of the chimney.");
mainNPC:setUseMessage("#me dreht sich auf die andere Seite und schläft weiter.", "#me truns to the other side and continues his nap.");
mainNPC:setConfusedMessage("#me schnarcht laut.", "#me snorts loudly.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 811);
mainNPC:setEquipment(11, 0);
mainNPC:setEquipment(5, 0);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 0);
mainNPC:setEquipment(9, 460);
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
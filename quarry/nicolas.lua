--------------------------------------------------------------------------------
-- NPC Name: Nicolas                                                     None --
-- NPC Job:  none                                                             --
--                                                                            --
-- NPC Race: human                      NPC Position:  -281, 40, 0            --
-- NPC Sex:  male                       NPC Direction: west                   --
--                                                                            --
-- Author:   not set                                                          --
--                                                                            --
-- Last parsing: May 24, 2011                            easyNPC Parser v1.02 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (0, -281, 40, 0, 6, 'Nicolas', 'npc.nicolas', 0, 0, 0, 255, 255, 255, 255, 255, 255);
---]]

require("npc.base.basic")
require("npc.base.condition.language")
require("npc.base.condition.quest")
require("npc.base.condition.state")
require("npc.base.consequence.quest")
require("npc.base.consequence.state")
require("npc.base.talk")
module("npc.nicolas", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("schinken");
talkEntry:addCondition(npc.base.condition.state.state("=", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=", 1));
talkEntry:addResponse("Die Lieferung mit Schinken habe ich doch schon dem einarmigen Boten gegeben. Ist sie angekommen?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("schinken");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=", 1));
talkEntry:addResponse("Den Schinken für Marcus habe ich dem eigenartigen Boten gegeben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("liefer");
talkEntry:addCondition(npc.base.condition.state.state("=", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=", 1));
talkEntry:addResponse("Die Lieferung mit Schinken habe ich doch schon dem einarmigen Boten gegeben. Ist sie angekommen?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("liefer");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=", 1));
talkEntry:addResponse("Den Schinken für Marcus habe ich dem eigenartigen Boten gegeben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ja");
talkEntry:addCondition(npc.base.condition.state.state("=", 1));
talkEntry:addResponse("Sehr gut. Wie kann ich euch helfen?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("nein");
talkEntry:addCondition(npc.base.condition.state.state("=", 1));
talkEntry:addResponse("Nicht? Wie kann das sein, dieser Bote wurde doch von Marcus geschickt, oder? Jedenfalls sagte er das. Er ist Richtung Westen gegangen.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 2));
talkEntry:addConsequence(npc.base.consequence.quest.quest(557, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("bote");
talkEntry:addCondition(npc.base.condition.state.state("=", 2));
talkEntry:addResponse("Hm. Irgendwie kam er mir eigenartig vor, er kannte Marcus' Namen nicht. Und er wußte glaube ich auch nicht so recht, in welche Richtung er eigentlich sollte.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dieb");
talkEntry:addCondition(npc.base.condition.state.state(">", 0));
talkEntry:addResponse("Meint ihr, der Bote war ein Dieb? Irgendwie würde das wohl passen, stimmt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("marcus");
talkEntry:addCondition(npc.base.condition.quest.quest(557, ">", 0));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Marcus ist ein Händler in Troll's Bane, ich sollte ihm zehn Stück Schinken liefern.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("westen");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=", 2));
talkEntry:addResponse("Ja. Dieser Bote ging nach Westen. Obwohl es doch nach Osten nach Trollsbane geht. Ich hoffe nur das war kein Dieb.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ham");
talkEntry:addCondition(npc.base.condition.state.state("=", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=", 1));
talkEntry:addResponse("I gave the delivery with ham to a one-armed carrier already. Did it arrive?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ham");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=", 1));
talkEntry:addResponse("I gave that ham for Marcus to that strange carrier he sent.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("deliver");
talkEntry:addCondition(npc.base.condition.state.state("=", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=", 1));
talkEntry:addResponse("I gave the delivery with ham to a one-armed carrier already. Did it arrive?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("deliver");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=", 1));
talkEntry:addResponse("I gave that ham for Marcus to that strange carrier he sent.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("yes");
talkEntry:addCondition(npc.base.condition.state.state("=", 1));
talkEntry:addResponse("Very good. How can I help you?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("no");
talkEntry:addCondition(npc.base.condition.state.state("=", 1));
talkEntry:addResponse("It didn't? How could that happen, Marcus sent that carrier, didn't he?At least that's what he said. He left heading west.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 2));
talkEntry:addConsequence(npc.base.consequence.quest.quest(557, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("carrier");
talkEntry:addCondition(npc.base.condition.state.state("=", 2));
talkEntry:addResponse("Hm. Somehow he appeared a little bit strange to me, he didn't know Marcus' name. And it seemed as if he didn't know in which direction to go.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("thief");
talkEntry:addCondition(npc.base.condition.state.state(">", 0));
talkEntry:addResponse("You believe that this carrier was a thief in reality? That would fit somehow, right.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("marcus");
talkEntry:addCondition(npc.base.condition.quest.quest(557, ">", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Marcus is a trader in Troll's Bane. I should deliver ten pieces of ham to him.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("west");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=", 2));
talkEntry:addResponse("Yes. The carrier headed west. While Trollsbane is in the east. I hope this was no thief.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hafen");
talkEntry:addResponse("Genau, das hier ist der Hafen. Ein netter Platz, wenn man den Ozean zu schätzen weiß!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Harbo[u]*r");
talkEntry:addResponse("Exactly, this is the harbor. A nice spot if you like the ocean!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("I am");
talkEntry:addResponse("Greetings, %CHARNAME, nice to meet you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("I'm");
talkEntry:addResponse("Greetings, %CHARNAME, nice to meet you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ich bin");
talkEntry:addResponse("Seid gegrüßt, %CHARNAME, schön euch zu treffen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("auf bald");
talkEntry:addResponse("Gehabt euch wohl!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Ich bin Kapitän eines Handelsschiffes. Ich treibe Handel mit Troll's Bane und anderen Städten hier.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("buy");
talkEntry:addResponse("I don't buy anything.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("bye");
talkEntry:addResponse("Farewell!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dein name");
talkEntry:addResponse("Ich heiße %NPCNAME.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("deine aufgabe");
talkEntry:addResponse("Ich bin Kapitän eines Handelsschiffes. Ich treibe Handel mit Troll's Bane und anderen Städten hier.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("eure aufgabe");
talkEntry:addResponse("Ich bin Kapitän eines Handelsschiffes. Ich treibe Handel mit Troll's Bane und anderen Städten hier.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("farewell");
talkEntry:addResponse("Farewell, thanks for visiting me!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("good day");
talkEntry:addResponse("Hello.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gr[üue]+[sß]+e");
talkEntry:addResponse("Seid gegrüßt!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("greetings");
talkEntry:addResponse("Be greeted.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("greets");
talkEntry:addResponse("Be greeted.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("guten tag");
talkEntry:addResponse("Seid gegrüßt!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hail");
talkEntry:addResponse("Be greeted.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hallo");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Seid gegrüßt!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hallo");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Be greeted.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("helfen");
talkEntry:addResponse("Wenn du Hilfe brauchst, geh nach Troll's Bane.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hello");
talkEntry:addResponse("Be greeted.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("help");
talkEntry:addResponse("If you need help, visit Troll's Bane.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hilfe");
talkEntry:addResponse("Wenn du Hilfe brauchst, geh nach Troll's Bane.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("how are you");
talkEntry:addResponse("I am fine, thanks. How are you?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("I am just a simple farmer.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("kaufen");
talkEntry:addResponse("Ich kaufe nichts.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein name");
talkEntry:addResponse("Sehr angenehm.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("Nice to meet you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("sell");
talkEntry:addResponse("I don't sell anything");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("verkaufen");
talkEntry:addResponse("Ich handle nicht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was kaufst");
talkEntry:addResponse("Ich handle nicht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was tust du");
talkEntry:addResponse("Ich warte auf Händler, die ihre Ware hier abholen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was tut ihr");
talkEntry:addResponse("Ich warte auf Händler, die ihre Ware hier abholen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkaufst");
talkEntry:addResponse("Ich handle nicht mit euch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("wer seid");
talkEntry:addResponse("Ich bin %NPCNAME.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("wer bist");
talkEntry:addResponse("Ich bin %NPCNAME.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what buy");
talkEntry:addResponse("I don't trade with you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addResponse("I don't trade with you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what you do");
talkEntry:addResponse("I wait for traders who pick up their wares here.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("who");
talkEntry:addResponse("I am %NPCNAME.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("wie geht es");
talkEntry:addResponse("Danke, mir geht es gut.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("wie hei[sß]+t du");
talkEntry:addResponse("Ich heiße %NPCNAME.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("you name");
talkEntry:addResponse("My name is %NPCNAME.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("you Nicolas");
talkEntry:addResponse("Indeed. I'm Nicolas. What can i do for you?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("du Nicolas");
talkEntry:addResponse("In der Tat. Ich bin Nicolas. Was kann ich für euch tun?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ihr Nicolas");
talkEntry:addResponse("In der Tat. Ich bin Nicolas. Was kann ich für euch tun?");
talkingNPC:addTalkingEntry(talkEntry);
end;
mainNPC:addLanguage(0);
mainNPC:addLanguage(1);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Das ist ein NPC dessen Entwickler zu faul war eine Beschreibung einzutragen.", "This is a NPC who's developer was too lazy to type in a description.");
mainNPC:setUseMessage("Fass mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut dich verwirrt an.", "#me looks at you confused.");
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
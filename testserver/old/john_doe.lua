--------------------------------------------------------------------------------
-- NPC Name: John Doe                                                    None --
-- NPC Job:  none                                                             --
--                                                                            --
-- NPC Race: human                      NPC Position:  0, 0, 0                --
-- NPC Sex:  male                       NPC Direction: north                  --
--                                                                            --
-- Author:   not set                                                          --
--                                                                            --
-- Last parsing: May 23, 2011                            easyNPC Parser v1.02 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (0, 0, 0, 0, 0, 'John Doe', 'npc.john_doe', 0, 0, 0, 255, 255, 255, 255, 255, 255);
---]]

require("npc.base.basic")
require("npc.base.condition.language")
require("npc.base.consequence.state")
require("npc.base.talk")
module("npc.john_doe", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("give oil");
talkEntry:addTrigger("geb lampenöl");
talkEntry:addTrigger("lampenöl geb");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("give torch");
talkEntry:addTrigger("geb fackel");
talkEntry:addTrigger("fackel geb");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("give candle");
talkEntry:addTrigger("geb kerze");
talkEntry:addTrigger("kerze geb");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("oil");
talkEntry:addTrigger("torch");
talkEntry:addTrigger("candle");
talkEntry:addResponse("You can give me bottles of lamp oil, torches and candles. Just say that you want to give it to me, what you want to give and how many.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("lampenöl");
talkEntry:addTrigger("fackel");
talkEntry:addTrigger("kerze");
talkEntry:addResponse("Ihr könnt mir Flaschen mit Lampenöl, Fackeln und Kerzen geben. Sagt einfach, dass Ihr mir etwas geben wollt, was Ihr mir geben wollt und wieviel.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("help");
talkEntry:addResponse("[GAME HELP] Just say 'I want to give you <amount> <bottles of lamp oil, torches or candles>' in order to give me the items.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hilfe");
talkEntry:addResponse("[GAME HELP] Sag einfach 'Ich möchte dir <Anzahl> <Flaschen mit Lampenöl, Fackeln oder Kerzen> geben' um mir die Gegenstände zu geben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hello");
talkEntry:addTrigger("greet");
talkEntry:addTrigger("hey");
talkEntry:addTrigger("hiho");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Be greeted. My name is %NPCNAME, I am the night watchman of this area.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hallo");
talkEntry:addTrigger("gr[üu][ßs]");
talkEntry:addTrigger("grue[sß]");
talkEntry:addTrigger("hey");
talkEntry:addTrigger("hiho");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Seid gegrüßt. Mein Name ist %NPCNAME, ich bin der Nachtwächter hier.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("how are you");
talkEntry:addResponse("I'm fine, thanks. And you?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("wie geht dir");
talkEntry:addTrigger("wie geht euch");
talkEntry:addResponse("Mir geht es gut, danke. Und Euch?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("who");
talkEntry:addTrigger("your job");
talkEntry:addTrigger("profession");
talkEntry:addTrigger("what you do");
talkEntry:addResponse("I am %NPCNAME, the nightwatchman. I take care of all the lights around here. But I need bottles of lamp oil, torches and candles to do my job.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("wer");
talkEntry:addTrigger("beruf");
talkEntry:addTrigger("was machst du");
talkEntry:addTrigger("was macht ihr");
talkEntry:addResponse("Ich bin %NPCNAME, der Nachtwächter. Ich kümmere mich um alle Lichter hier. Aber ich brauche Lampenöl, Fackeln und Kerzen, um meine Aufgabe zu erledigen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addResponse("I am not a trader. But you can give me bottles of lamp oil, torches and candles, so I can put on all lights when the night falls.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was kauf");
talkEntry:addResponse("Ich bin kein Händler. Aber Ihr könnt mir Lampenöl, Fackeln und Kerzen geben, damit ich alle Lichter anmachen kann, wenn die Nacht hereinbricht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("bye");
talkEntry:addTrigger("farewell");
talkEntry:addTrigger("be well");
talkEntry:addResponse("Farewell.");
talkEntry:addResponse("Be well.");
talkEntry:addResponse("Good bye.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("auf bald");
talkEntry:addTrigger("bis bald");
talkEntry:addTrigger("leb wohl");
talkEntry:addTrigger("tschue[sß]");
talkEntry:addTrigger("tsch[uü][sß]");
talkEntry:addResponse("Auf bald.");
talkEntry:addResponse("Bis bald.");
talkEntry:addResponse("Macht's gut.");
talkEntry:addResponse("Lebt wohl.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("night");
talkEntry:addTrigger("watchman");
talkEntry:addResponse("As a night watchman I'm responsible for the lights being on during the night. But I need torches, candles and bottles of lamp oil to do my job.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("nacht");
talkEntry:addTrigger("wächter");
talkEntry:addResponse("Als ein Nachtwächter bin ich dafür verantwortlich, dass die Lichter während der Nacht brennen. Aber um dies zu erledigen, benötige ich Fackeln, Kerzen und FLaschen mit Lampenöl.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addTrigger("I am");
talkEntry:addTrigger("I'm");
talkEntry:addResponse("Nice to meet you. My name is %NPCNAME.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein name");
talkEntry:addTrigger("ich bin");
talkEntry:addResponse("Schön Euch zu treffen. Mein Name ist %NPCNAME.");
talkingNPC:addTalkingEntry(talkEntry);
end;
mainNPC:addLanguage(0);
mainNPC:addLanguage(1);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Das ist ein NPC dessen Entwickler zu faul war eine Beschreibung einzutragen.", "This is an NPC who's developer was too lazy to type in a description.");
mainNPC:setUseMessage("Fass mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut dich verwirrt an.", "#me looks at you confused.");
mainNPC:setAutoIntroduceMode(true);

mainNPC:initDone();
end;

function receiveText(texttype, message, speaker) mainNPC:receiveText(speaker, message); end;
function nextCycle() mainNPC:nextCycle(); end;
function lookAtNpc(char, mode) mainNPC:lookAt(char, mode); end;
function useNPC(char) mainNPC:use(char); end;
initNpc();
initNpc = nil;
-- END

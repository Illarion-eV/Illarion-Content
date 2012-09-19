--------------------------------------------------------------------------------
-- NPC Name: Mineth                                                      None --
-- NPC Job:  none                                                             --
--                                                                            --
-- NPC Race: elf                        NPC Position:  740, 400, 200          --
-- NPC Sex:  female                     NPC Direction: north                  --
--                                                                            --
-- Author:   not set                                                          --
--                                                                            --
-- Last parsing: May 23, 2011                            easyNPC Parser v1.02 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (3, 740, 400, 200, 0, 'Mineth', 'npc.mineth', 1, 2, 5, 123, 62, 9, 245, 180, 137);
---]]

require("npc.base.basic")
require("npc.base.condition.language")
require("npc.base.condition.quest")
require("npc.base.consequence.inform")
require("npc.base.consequence.state")
require("npc.base.talk")
module("npc.mineth", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilf");
talkEntry:addTrigger("helf");
talkEntry:addCondition(npc.base.condition.quest.quest(62, ">", 0));
talkEntry:addResponse("Weißt du schon was alle drei draufhaben wollen, falls ja sag es mir. Oder soll ich dir nochmal über die Mitglieder der Gilde etwas erzählen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("help");
talkEntry:addCondition(npc.base.condition.quest.quest(62, ">", 0));
talkEntry:addResponse("Do you know now what the want to have as emblem, tell me please if you know. Or shall I tell you again something about the members of the guild?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("help");
talkEntry:addTrigger("task");
talkEntry:addTrigger("quest");
talkEntry:addCondition(npc.base.condition.quest.quest(62, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Keywords on which the woman could react: 'members', 'yes'"));
talkEntry:addResponse("I have the order to embroider a emblem for the trading house 'Trade Company', could you please talk to the members of the company, which are located in all 3 towns and ask them what they would like to see on it?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hilf");
talkEntry:addTrigger("aufgabe");
talkEntry:addTrigger("quest");
talkEntry:addTrigger("helf");
talkEntry:addCondition(npc.base.condition.quest.quest(62, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Stichwörter auf die die Frau reagieren könnte: 'Mitglieder', 'Ja'"));
talkEntry:addResponse("Ich habe den Auftrag bekommen für das Handelshaus 'Trade Company' ein Wappen zu sticken, könntest du bitte für mich Ihre Mitglieder die in allen 3 großen Städten ansäßig sind fragen was sie so mögen?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Mitglied");
talkEntry:addCondition(npc.base.condition.quest.quest(62, ">", 0));
talkEntry:addResponse("Naja, eigentlich kenne ich nur einen von denen gut, er heißt 'Carl the Carpenter' und arbeitet als Händler in Galmair. Vielleicht kann er dir ja den Namen der anderen beiden Gildenmitglieder nennen. Ich muss wissen wie das Wappen aussehen soll...die Form, Farbe, das Symbol und die Anzahl an Symbolen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Member");
talkEntry:addCondition(npc.base.condition.quest.quest(62, ">", 0));
talkEntry:addResponse("Well, in fact I know only one of them, his name is 'Carl the Carpenter' and he works as trader in Galmair. Maybe he can tell you the names of the other two guild members. I need to know how the emblem shall look like...the shape, color, the symbol and the number of symbols that shall be embroidered.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Mitglied");
talkEntry:addCondition(npc.base.condition.quest.quest(62, "=", 0));
talkEntry:addResponse("Du musst erstmal den Auftrag annehmen, erst dann sag ich dir die Namen der Leute die du suchen musst. Also, willst du den Auftrag annehmen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Member");
talkEntry:addCondition(npc.base.condition.quest.quest(62, "=", 0));
talkEntry:addResponse("I'll tell you the names of the people you have to look for after you have accepted this order. So, do you accept the order?");
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
talkEntry:addCondition(npc.base.condition.quest.quest(62, "=", 0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Maybe you should ask her if she has a 'task' or 'quest' for you"));
talkEntry:addResponse("Hello stranger, could you please help me?");
talkEntry:addResponse("Be greeted, the gods sent you, I need your help.");
talkEntry:addResponse("Greetings, I could need your help.");
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
talkEntry:addCondition(npc.base.condition.quest.quest(62, "=", 0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Vielleicht solltest du Sie fragen ob sie eine 'Aufgabe' oder 'Queste' für dich hat"));
talkEntry:addResponse("Grüße Fremder, könntet Ihr mir bitte helfen?");
talkEntry:addResponse("Seid gegrüßt, die Götter schicken euch, ich benötige eure Hilfe");
talkEntry:addResponse("Grüße, ich könnte eure Hilfe gebrauchen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greebas");
talkEntry:addTrigger("Greebs");
talkEntry:addCondition(npc.base.condition.quest.quest(62, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Maybe you should ask her if she has a 'task' or 'quest' for you"));
talkEntry:addResponse("Hello stranger, could you please help me?");
talkEntry:addResponse("Be greeted, the gods sent you, I need your help.");
talkEntry:addResponse("Greetings, I could need your help.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greebas");
talkEntry:addTrigger("Greebs");
talkEntry:addCondition(npc.base.condition.quest.quest(62, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Vielleicht solltest du Sie fragen ob sie eine 'Aufgabe' oder 'Queste' für dich hat"));
talkEntry:addResponse("Grüße Fremder, könntet Ihr mir bitte helfen?");
talkEntry:addResponse("Seid gegrüßt, die Götter schicken euch, ich benötige eure Hilfe");
talkEntry:addResponse("Grüße, ich könnte eure Hilfe gebrauchen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Good bye");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare thee well");
talkEntry:addResponse("Bye");
talkEntry:addResponse("Goodbye");
talkEntry:addResponse("Farewell");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehabt euch wohl");
talkEntry:addResponse("Bis bald.");
talkEntry:addResponse("Auf bald.");
talkEntry:addResponse("Die Götter mit euch!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Bye");
talkEntry:addResponse("Goodbye");
talkEntry:addResponse("Farewell");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Bis bald.");
talkEntry:addResponse("Auf bald.");
talkEntry:addResponse("Die Götter mit euch!");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me wirkt gestresst.", "#me appears to be stressed out.");
talkingNPC:addCycleText("#me schaut dich hilfesuchend an.", "#me looks at you for help.");
talkingNPC:addCycleText("#me murmelt: 'Oh je, oh je, was könnten Sie bloß wollen'.", "#me mumbles: 'Oh dear, what could they want'.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(3);
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

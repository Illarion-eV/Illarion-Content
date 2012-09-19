--------------------------------------------------------------------------------
-- NPC Name: Walter Ferendor                                             None --
-- NPC Job:  none                                                             --
--                                                                            --
-- NPC Race: human                      NPC Position:  -120, -93, 0           --
-- NPC Sex:  male                       NPC Direction: east                   --
--                                                                            --
-- Author:   not set                                                          --
--                                                                            --
-- Last parsing: April 14, 2011                          easyNPC Parser v1.02 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (0, -120, -93, 0, 2, 'Walter Ferendor', 'npc.walter_ferendor', 0, 0, 0, 255, 255, 255, 255, 255, 255);
---]]

require("npc.base.basic")
require("npc.base.condition.language")
require("npc.base.condition.money")
require("npc.base.condition.state")
require("npc.base.consequence.money")
require("npc.base.consequence.state")
require("npc.base.talk")
module("npc.walter_ferendor", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hello");
talkEntry:addTrigger("greet");
talkEntry:addTrigger("good day");
talkEntry:addResponse("Be greeted. Nice weather, isn't it?");
talkEntry:addResponse("Hm ... delicious cake ... Oh, greetings to you.");
talkEntry:addResponse("Hello there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hallo");
talkEntry:addTrigger("gr[üu][sß]");
talkEntry:addTrigger("guten tag");
talkEntry:addTrigger("tach");
talkEntry:addTrigger("grue[sß]");
talkEntry:addResponse("Seid gegrüßt. Ganz nettes Wetter, nicht?");
talkEntry:addResponse("Hm ... leckerer Kuchen ... Oh, grüß' Euch.");
talkEntry:addResponse("Hallöchen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("bye");
talkEntry:addTrigger("be well");
talkEntry:addTrigger("farewell");
talkEntry:addResponse("Good bye.");
talkEntry:addResponse("The Five with you.");
talkEntry:addResponse("Farewell.");
talkEntry:addResponse("Have a nice day.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("auf bald");
talkEntry:addTrigger("bis bald");
talkEntry:addTrigger("auf wiederseh");
talkEntry:addTrigger("leb wohl");
talkEntry:addResponse("Auf Wiedersehen.");
talkEntry:addResponse("Schönen Tag noch!");
talkEntry:addResponse("Auf bald.");
talkEntry:addResponse("Bis bald.");
talkEntry:addResponse("Lebt wohl.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("weather");
talkEntry:addResponse("Well, any weather is nice as it is needed aswell.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("wetter");
talkEntry:addResponse("Naja, jedes Wetter ist schön, da es ja auch gebraucht wird.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("cake");
talkEntry:addResponse("Oh, this delicious cake ...  a halfling near the fields outside the walls gave it to me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("kuchen");
talkEntry:addResponse("Oh, dieser leckere Kuchen ... ein Halbling bei den Äckern außerhalb der Mauern gab ihn mir.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("sell");
talkEntry:addTrigger("buy");
talkEntry:addResponse("I am not a trader. I am a healer and a diet expert. I offer therefore some services.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("kauf");
talkEntry:addResponse("Ich bin kein Händler. Ich bin ein Heiler und Experte in Sachen Ernährung. Ich biete daher auch einige Dienste an.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("service");
talkEntry:addResponse("I offer the following services: cure light or serious wounds, full heal, cure poisoning or information about your current dietary condition. What do you want?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dienst");
talkEntry:addResponse("Ich biete die folgenden Dienste an: Heilung von leichten oder schweren Wunden, vollständige Heilung, Heilung einer Vergiftung oder Auskunft über Euren derzeitigen Ernährungszustand. Was wollt Ihr?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("help");
talkEntry:addResponse("Say 'service' to get a list of my services. To make use of a service, just tell me which service. Say 'price' to get a list of my prices.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("helf");
talkEntry:addTrigger("hilf");
talkEntry:addResponse("Sagt 'Dienst' um eine Liste meiner Dienste zu bekommen. Um davon Gebrauch zu machen, nennt mir einfach den Dienst. Sagt 'Preis' um eine Liste meiner Preise zu bekommen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("price");
talkEntry:addResponse("Healing of light and serious wounds costs T1 and T2, a full healing T3 copper coins. The price of an antidote is T4 copper coins and for diet information I charge T5 copper coins.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("preis");
talkEntry:addResponse("Eine Heilung leichter und schwerer Wunden kostet T1 und T2, eine volle Heilung T3 Kupfermünzen. Der Preis für ein Gegengift ist T4 Kupfermünzen und für Ernährungsinformationen verlange ich T5 Kupfermünzen.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("who you");
talkEntry:addTrigger("what you");
talkEntry:addResponse("I am %NPCNAME, a healer and a diet expert. I offer therefore some services.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("wer du");
talkEntry:addTrigger("wer ihr");
talkEntry:addTrigger("was du");
talkEntry:addTrigger("wer du");
talkEntry:addResponse("Ich bin %NPCNAME, ein Heiler und Experte in Sachen Ernährung. Ich biete daher auch einige Dienste an.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.state.state("=", 10));
talkEntry:addCondition(npc.base.condition.money.money("<", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I won't cure your light wounds unless you have T1 copper coins for me.");
talkEntry:addResponse("Come back when you have T1 copper coins! Then I'll cure your light wounds.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.state.state("=", 10));
talkEntry:addCondition(npc.base.condition.money.money("<", 1));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Ich werde nicht Eure leichten Wunden heilen, es sei denn Ihr bringt mir T1 Kupfermünzen.");
talkEntry:addResponse("Kommt wieder, wenn Ihr T1 Kupfermünzen habt! Dann heile ich Eure leichten Wunden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.state.state("=", 10));
talkEntry:addCondition(npc.base.condition.money.money("=>", 1));
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("-", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.state.state("=", 20));
talkEntry:addCondition(npc.base.condition.money.money("<", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I won't cure your serious wounds unless you have T2 copper coins for me.");
talkEntry:addResponse("Come back when you have T2 copper coins! Then I'll cure your serious wounds.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.state.state("=", 20));
talkEntry:addCondition(npc.base.condition.money.money("<", 2));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Ich werde nicht Eure schweren Wunden heilen, es sei denn Ihr bringt mir T2 Kupfermünzen.");
talkEntry:addResponse("Kommt wieder, wenn Ihr T2 Kupfermünzen habt! Dann heile ich Eure schweren Wunden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.state.state("=", 20));
talkEntry:addCondition(npc.base.condition.money.money("=>", 2));
talkEntry:addConsequence(npc.base.consequence.state.state("=", 2));
talkEntry:addConsequence(npc.base.consequence.money.money("-", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.state.state("=", 30));
talkEntry:addCondition(npc.base.condition.money.money("<", 3));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I won't heal you fully unless you have T3 copper coins for me.");
talkEntry:addResponse("Come back when you have T3 copper coins! Then I'll heal you fully.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.state.state("=", 30));
talkEntry:addCondition(npc.base.condition.money.money("<", 3));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Ich werde Eure nicht vollständig heilen, es sei denn Ihr bringt mir T3 Kupfermünzen.");
talkEntry:addResponse("Kommt wieder, wenn Ihr T3 Kupfermünzen habt! Dann werde ich Euch vollständig heilen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.state.state("=", 30));
talkEntry:addCondition(npc.base.condition.money.money("=>", 3));
talkEntry:addConsequence(npc.base.consequence.state.state("=", 3));
talkEntry:addConsequence(npc.base.consequence.money.money("-", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.state.state("=", 40));
talkEntry:addCondition(npc.base.condition.money.money("<", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I won't cure your poisoning unless you have T4 copper coins for me.");
talkEntry:addResponse("Come back when you have T4 copper coins! Then I'll cure your poisoning.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.state.state("=", 40));
talkEntry:addCondition(npc.base.condition.money.money("<", 4));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Ich werde Eure Vergiftung nicht heilen, es sei denn Ihr bringt mir T4 Kupfermünzen.");
talkEntry:addResponse("Kommt wieder, wenn Ihr T4 Kupfermünzen habt! Dann werde ich Eure Vergiftung heilen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.state.state("=", 40));
talkEntry:addCondition(npc.base.condition.money.money("=>", 4));
talkEntry:addConsequence(npc.base.consequence.state.state("=", 4));
talkEntry:addConsequence(npc.base.consequence.money.money("-", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.state.state("=", 50));
talkEntry:addCondition(npc.base.condition.money.money("<", 5));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I won't tell you anything about your dietary condition unless you have T5 copper coins for me.");
talkEntry:addResponse("Come back when you have T5 copper coins! Then I'll tell you something about your dietary condition.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.state.state("=", 50));
talkEntry:addCondition(npc.base.condition.money.money("<", 5));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Ich werde Euch gar nichts über Euren Ernährungszustand sagen, es sei denn Ihr habt T5 Kupfermünzen für mich.");
talkEntry:addResponse("Kommt wieder, wenn Ihr T5 Kupfermünzen habt! Dann werde ich Euch etwas über Euren Ernährungszustand sagen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.state.state("=", 50));
talkEntry:addCondition(npc.base.condition.money.money("=>", 5));
talkEntry:addConsequence(npc.base.consequence.state.state("=", 5));
talkEntry:addConsequence(npc.base.consequence.money.money("-", 5));
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

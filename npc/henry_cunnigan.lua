--------------------------------------------------------------------------------
-- NPC Name: Henry Cunnigan                                              None --
-- NPC Job:  Tutor                                                            --
--                                                                            --
-- NPC Race: human                      NPC Position:  37, 21, 100            --
-- NPC Sex:  male                       NPC Direction: west                   --
--                                                                            --
-- Authors:  Rincewind                                                        --
--           Estralis Seborian                                                --
--                                                                            --
-- Last parsing: August 28, 2012                          easyNPC Parser v1.2 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (0, 37, 21, 100, 6, 'Henry Cunnigan', 'npc.henry_cunnigan', 0, 2, 5, 123, 62, 9, 245, 180, 137);
---]]

require("npc.base.basic")
require("npc.base.condition.language")
require("npc.base.condition.quest")
require("npc.base.consequence.inform")
require("npc.base.consequence.quest")
require("npc.base.consequence.warp")
require("npc.base.talk")
module("npc.henry_cunnigan", package.seeall)

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
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] This NPC is the tutor Henry Cunnigan. Keywords: Hello, Help, Skip tutorial."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] Dieser NPC ist der Tutor Henry Cunnigan. Schlüsselwörter: Hallo, Hilfe, Tutorial überspringen."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("skip");
talkEntry:addTrigger("cancel");
talkEntry:addTrigger("abort");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] You have decided to skip the tutorial. Please choose a realm to be the home for your character by stepping through the corresponding portal on one of the three islands to the south."));
talkEntry:addConsequence(npc.base.consequence.warp.warp(35, 95, 100));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("überspring");
talkEntry:addTrigger("abbrech");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] Du hast entschieden, das Tutorial zu überspringen. Bitte wähle ein Reich als Heimat deines Charakters aus, indem du durch das entsprechende Portal auf einer der drei Inseln im Süden trittst."));
talkEntry:addConsequence(npc.base.consequence.warp.warp(35, 95, 100));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(309, "<", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] To shout, please hit the return key to activate the chatbox. Do THIS AND THAT, type the words you wish to say and then hit return again to make your character shout them."));
talkEntry:addResponse("Welcome to the tutorial, %CHARNAME. Henry Cunnigan, harbourmaster, at your service. I will teach you how to communicate with other characters. Since you clearly already know how to talk, I will show you how to shout. Please shout out something for me to hear. Perhaps your name, for example!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(309, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(309, "<", 2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] Um zu schreien, aktiviere bitte durch das Drücken der Enter Taste die Chatbox. Mache DIES UND DAS, schreibe die Worte, die du sagen möchstest und drücke erneut die Enter Taste, um deinen Charakter schreien zu lassen."));
talkEntry:addResponse("Willkommen zu diesem Tutorial, %CHARNAME. Henry Cunnigan, Hafenmeister, zu Diensten. Ich werde Dir beibringen, mit anderen Charakteren zu kommunizieren. Da du offensichtlich schon herausgefunden hast, wie man spricht, werde ich dir nun zeigen, wie man schreit. Bitte schreie etwas für mich. Vielleicht deinen Namen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(309, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("#s");
talkEntry:addCondition(npc.base.condition.quest.quest(309, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] Whispering works a lot like shouting. Activate your chatbox again and DO THIS AND THAT."));
talkEntry:addResponse("My, but you have a powerful voice! Shouting can be heard over quite some distance and is useful for communicating with large crowds or people that are far away. Sometimes, however, you don't want people eavesdropping into your private conversations. Please whisper some secret words for my ears only.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(309, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("#s");
talkEntry:addCondition(npc.base.condition.quest.quest(309, "=", 2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] Flüstern funktioniert fast wie Schreien. Aktiviere erneut deine Chatbox and MACH DIES UND DAS."));
talkEntry:addResponse("Ui, Du hast aber eine kraftvolle Stimme! Schreien kann auch in einiger Entfernung noch hören und es ist nützlich zur Kommunikation mit großen Gruppen oder Personen, die weit weg sind. Manchmal will man allerdings nicht von anderen bei einer privaten Unterhaltung belauscht werden. Bitte flüster mir ein paar geheime Worte zu, die nur für meine Ohren bestimmt sind.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(309, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(309, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] To shout, please hit the return key to activate the chatbox. Do THIS AND THAT, type the words you wish to say and then hit return again to make your character shout them."));
talkEntry:addResponse("You already know how to talk, but shouting can help you to find your lost friends in lonely woods or dark dungeons. Please shout some words at will. Let your voice be heard! I shan't take offence, honest!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(309, "=", 2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] Um zu schreien, aktiviere bitte durch das Drücken der Enter Taste die Chatbox. Mache DIES UND DAS, schreibe die Worte, die du sagen möchstest und drücke erneut die Enter Taste, um deinen Charakter schreien zu lassen."));
talkEntry:addResponse("Du weißt bereits wie man spricht, aber Schreien kann Dir helfen deine Freunde in einsamen Wäldern oder dunklen Verliesen wiederzufinden. Bitte schrei irgendetwas. Lass uns deine Stimme hören! Ich werd auch beleidigt sein, versprochen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("#w");
talkEntry:addCondition(npc.base.condition.quest.quest(309, "=", 3));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] Emoting is done by doing THIS AND THAT."));
talkEntry:addResponse("Sometimes, silence is golden. Use whispers to communicate with those immediately around you. But there will be times when you do not wish to speak at all. To perform actions as your character you can use emotes. Emotes cannot affect the game world or other characters but are a good way to add some flavour to your roleplaying. Please emote an action!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(309, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("#w");
talkEntry:addCondition(npc.base.condition.quest.quest(309, "=", 3));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] Zum Emoten muss man einfach DIES UND DAS machen."));
talkEntry:addResponse("Manchmal ist Schweigen Gold. Flüstere, um mit denen, die dich direkt umgeben zu kommunizieren. Aber es wird Zeiten geben, wenn du nicht reden willst. Mit Hilfe von Emotes kannst Du Handlungen als dein Charakter auszuführen. Emotes haben keinen Einfluss auf die Spielwelt oder andere Charaktere, aber sie sind ein guter Weg um etwas Spannung in dein Rollenspiel zu bringen. Bitte emote eine Handlung!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(309, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(309, "=", 3));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] Whispering works a lot like shouting. Activate your chatbox again and DO THIS AND THAT."));
talkEntry:addResponse("Not every member of the town guard should hear about your twisted plans. Nor should the local thugs hear you talking about your bank balance. Please try to whisper once more.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(309, "=", 3));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] Flüstern funktioniert fast wie Schreien. Aktiviere erneut deine Chatbox and MACH DIES UND DAS."));
talkEntry:addResponse("Nicht jedes Mitglied der Stadtwache sollte deine krummen Pläne hören. Auch sollte der ortansässige Strolch dich nicht über deinen Kontostand reden hören. Bitte versuch nochmals zu flüstern.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("#me");
talkEntry:addCondition(npc.base.condition.quest.quest(309, "=", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Very good! I had my doubts, but you are no fool! You have learned all of the things that I can teach you. Have fun with the rest of the tutorial, %CHARNAME. Now, follow the road to the next lesson on items.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(309, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("#me");
talkEntry:addCondition(npc.base.condition.quest.quest(309, "=", 4));
talkEntry:addResponse("Sehr gut! Ich hatte Zweifel, aber du bist doch kein Dummkopf! Du hast nun alles gelernt, was ich Dir beibringen kann. Viel Spaß bei dem Rest des Tutorials, %CHARNAME. Nun folge der Straße zur nächsten Lektion über Gegenstände.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(309, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(309, "=", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] Emoting is done by doing THIS AND THAT."));
talkEntry:addResponse("Emoting is very important - it is the only way to show other players your character's actions that cannot be represented graphically. Please try to emote once more.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(309, "=", 4));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] Zum Emoten muss man einfach DIES UND DAS machen."));
talkEntry:addResponse("Emoten ist sehr wichtig - es ist die einzige Möglichkeit, um anderen Spielern zu zeigen, was dein Charakter gerade tut, wenn es nicht grafisch unterstützt wird. Bitte versuch erneut zu emoten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(309, "=", 5));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("You have learned everything that I can teach you. Have fun with the rest of the tutorial, %CHARNAME. Now, follow the road to the next lesson on items.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(309, "=", 5));
talkEntry:addResponse("Du hast alles gelernt, was ich Dir beibringen kann. Viel Spaß bei dem Rest des Tutorials, %CHARNAME. Nun folge der Straße zur nächsten Lektion über Gegenstände.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("Kommt näher und sagt doch 'Hallo'.", "Come a little closer and say 'hello'.");
talkingNPC:addCycleText("Hast Du vergessen, wie man sich bewegt? Benutz die rechte Maustaste, die Pfeiltasten, den Ziffernblock oder WASD.", "Forgot how to move? Use the right mouse button, the arrow keys, the num pad or WASD.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(1);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Das ist dein Tutor Henry Cunnigan.", "This is your tutorial guide Henry Cunnigan.");
mainNPC:setUseMessage("Finger weg!", "Do not touch me!");
mainNPC:setConfusedMessage("Bitte wechsle die Sprache deines Charakters zur Gemeinsprache, indem du DAS UND DAS TUST.", "Please switch the language of your character to the common tongue by DOING THIS AND THAT.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 101);
mainNPC:setEquipment(11, 2419);
mainNPC:setEquipment(5, 0);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 48);
mainNPC:setEquipment(9, 366);
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
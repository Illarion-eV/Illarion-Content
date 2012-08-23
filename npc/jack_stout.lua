--------------------------------------------------------------------------------
-- NPC Name: Jack Stout                                                  None --
-- NPC Job:  none                                                             --
--                                                                            --
-- NPC Race: human                      NPC Position:  543, 214, 0            --
-- NPC Sex:  male                       NPC Direction: northwest              --
--                                                                            --
-- Author:   not set                                                          --
--                                                                            --
-- Last parsing: August 18, 2012                          easyNPC Parser v1.2 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (0, 543, 214, 0, 7, 'Jack Stout', 'npc.jack_stout', 0, 2, 5, 123, 62, 9, 245, 180, 137);
---]]

require("npc.base.basic")
require("npc.base.condition.item")
require("npc.base.condition.language")
require("npc.base.condition.quest")
require("npc.base.condition.skill")
require("npc.base.consequence.deleteitem")
require("npc.base.consequence.item")
require("npc.base.consequence.quest")
require("npc.base.consequence.skill")
require("npc.base.consequence.state")
require("npc.base.talk")
module("npc.jack_stout", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("verdienen");
talkEntry:addTrigger("aufgabe");
talkEntry:addTrigger("abenteuer");
talkEntry:addTrigger("armbrust");
talkEntry:addTrigger("sehne");
talkEntry:addCondition(npc.base.condition.quest.quest(302, "=<", 1));
talkEntry:addResponse("Ja, ja. Ich könnte wirklich deine Hilfe brauchen. Die Sehne meiner Armbrust muss neu gemacht werden. Aber Mo'rurt ist ein bisschen stur. Wenn du ihn überredest mir eine neue zu machen, kann ich dir ja auch aushelfen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(302, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addCondition(npc.base.condition.quest.quest(302, "=<", 1));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Ja, ja. Ich könnte wirklich deine Hilfe brauchen. Die Sehne meiner Armbrust muss neu gemacht werden. Aber Mo'rurt ist ein bisschen stur. Wenn du ihn überredest mir eine neue zu machen, kann ich dir ja auch aushelfen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(302, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addCondition(npc.base.condition.quest.quest(302, "=<", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Yea.. I could need a helping hand. The string of my crossbow have to be changed. But Mo'rurt is kind of bullsih. If you make him to change my bowstring, I will help you too with something.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(302, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("money");
talkEntry:addTrigger("earn");
talkEntry:addTrigger("bow");
talkEntry:addCondition(npc.base.condition.quest.quest(302, "=<", 1));
talkEntry:addResponse("Yea.. I could need a helping hand. The string of my crossbow have to be changed. But Mo'rurt is kind of bullsih. If you make him to change my bowstring, I will help you too with something.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(302, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("verdienen");
talkEntry:addTrigger("aufgabe");
talkEntry:addTrigger("abenteuer");
talkEntry:addTrigger("armbrust");
talkEntry:addTrigger("sehne");
talkEntry:addCondition(npc.base.condition.quest.quest(302, "=", 3));
talkEntry:addResponse("Hm? Mo' hat gesagt er macht mir die Sehne neu? Fantastisch.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(302, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addCondition(npc.base.condition.quest.quest(302, "=", 3));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Hm? Mo' hat gesagt er macht mir die Sehne neu? Fantastisch.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(302, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addCondition(npc.base.condition.quest.quest(302, "=", 3));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hm? Mo' said he makes a new Bowstrong for me? Awesome.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(302, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("money");
talkEntry:addTrigger("earn");
talkEntry:addTrigger("bow");
talkEntry:addCondition(npc.base.condition.quest.quest(302, "=", 3));
talkEntry:addResponse("Hm? Mo' said he makes a new Bowstrong for me? Awesome.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(302, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("verdienen");
talkEntry:addTrigger("aufgabe");
talkEntry:addTrigger("abenteuer");
talkEntry:addTrigger("armbrust");
talkEntry:addTrigger("sehne");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "carpentry", "<", 5));
talkEntry:addCondition(npc.base.condition.quest.quest(302, "=", 4));
talkEntry:addResponse("Oh... richtig. Ich bin dir etwas schuldig nicht wahr? Lass mir dir Zeigen wie man Pfeile am besten Macht.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "carpentry", "+", 10));
talkEntry:addConsequence(npc.base.consequence.quest.quest(302, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "carpentry", "<", 5));
talkEntry:addCondition(npc.base.condition.quest.quest(302, "=", 4));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Oh... richtig. Ich bin dir etwas schuldig nicht wahr? Lass mir dir Zeigen wie man Pfeile am besten Macht.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "carpentry", "+", 10));
talkEntry:addConsequence(npc.base.consequence.quest.quest(302, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "carpentry", "<", 5));
talkEntry:addCondition(npc.base.condition.quest.quest(302, "=", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Oh... well. I owe you one. Let me show you how to make good arrows.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "carpentry", "+", 10));
talkEntry:addConsequence(npc.base.consequence.quest.quest(302, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("money");
talkEntry:addTrigger("earn");
talkEntry:addTrigger("bow");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "carpentry", "<", 5));
talkEntry:addCondition(npc.base.condition.quest.quest(302, "=", 4));
talkEntry:addResponse("Oh... well. I owe you one. Let me show you how to make good arrows.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "carpentry", "+", 10));
talkEntry:addConsequence(npc.base.consequence.quest.quest(302, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("verdienen");
talkEntry:addTrigger("aufgabe");
talkEntry:addTrigger("abenteuer");
talkEntry:addTrigger("armbrust");
talkEntry:addTrigger("sehne");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "carpentry", "<", 15));
talkEntry:addCondition(npc.base.condition.quest.quest(302, "=", 4));
talkEntry:addResponse("Oh... richtig. Ich bin dir etwas schuldig nicht wahr? Lass mir dir Zeigen wie man Pfeile am besten Macht.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "carpentry", "+", 5));
talkEntry:addConsequence(npc.base.consequence.quest.quest(302, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "carpentry", "<", 15));
talkEntry:addCondition(npc.base.condition.quest.quest(302, "=", 4));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Oh... richtig. Ich bin dir etwas schuldig nicht wahr? Lass mir dir Zeigen wie man Pfeile am besten Macht.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "carpentry", "+", 5));
talkEntry:addConsequence(npc.base.consequence.quest.quest(302, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "carpentry", "<", 15));
talkEntry:addCondition(npc.base.condition.quest.quest(302, "=", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Oh... well. I owe you one. Let me show you how to make good arrows.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "carpentry", "+", 5));
talkEntry:addConsequence(npc.base.consequence.quest.quest(302, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("money");
talkEntry:addTrigger("earn");
talkEntry:addTrigger("bow");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "carpentry", "<", 15));
talkEntry:addCondition(npc.base.condition.quest.quest(302, "=", 4));
talkEntry:addResponse("Oh... well. I owe you one. Let me show you how to make good arrows.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "carpentry", "+", 5));
talkEntry:addConsequence(npc.base.consequence.quest.quest(302, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("verdienen");
talkEntry:addTrigger("aufgabe");
talkEntry:addTrigger("abenteuer");
talkEntry:addTrigger("armbrust");
talkEntry:addTrigger("sehne");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "carpentry", "<", 60));
talkEntry:addCondition(npc.base.condition.quest.quest(302, "=", 4));
talkEntry:addResponse("Oh... richtig. Ich bin dir etwas schuldig nicht wahr? Wenn du beim Schnitzen das Messer in etwa so hältst... ja genau. So ist es viel besser. Du wirst schon sehen.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "carpentry", "+", 2));
talkEntry:addConsequence(npc.base.consequence.quest.quest(302, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "carpentry", "<", 60));
talkEntry:addCondition(npc.base.condition.quest.quest(302, "=", 4));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Oh... richtig. Ich bin dir etwas schuldig nicht wahr? Wenn du beim Schnitzen das Messer in etwa so hältst... ja genau. So ist es viel besser. Du wirst schon sehen.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "carpentry", "+", 2));
talkEntry:addConsequence(npc.base.consequence.quest.quest(302, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "carpentry", "<", 60));
talkEntry:addCondition(npc.base.condition.quest.quest(302, "=", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Oh... well. I owe you one. If you take the curvingkife like this... yes you got it! You will see it will work better.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "carpentry", "+", 2));
talkEntry:addConsequence(npc.base.consequence.quest.quest(302, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("money");
talkEntry:addTrigger("earn");
talkEntry:addTrigger("bow");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "carpentry", "<", 60));
talkEntry:addCondition(npc.base.condition.quest.quest(302, "=", 4));
talkEntry:addResponse("Oh... well. I owe you one. If you take the curvingkife like this... yes you got it! You will see it will work better.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "carpentry", "+", 2));
talkEntry:addConsequence(npc.base.consequence.quest.quest(302, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("verdienen");
talkEntry:addTrigger("aufgabe");
talkEntry:addTrigger("abenteuer");
talkEntry:addTrigger("armbrust");
talkEntry:addTrigger("sehne");
talkEntry:addCondition(npc.base.condition.quest.quest(302, "=", 4));
talkEntry:addResponse("Oh... richtig. Ich bin dir etwas schuldig nicht wahr? Ich kann dir leider nichts beibringen... Aber nimm doch diese Pfeile hier!");
talkEntry:addConsequence(npc.base.consequence.item.item(322, 25, 333, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(302, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addCondition(npc.base.condition.quest.quest(302, "=", 4));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Oh... richtig. Ich bin dir etwas schuldig nicht wahr? Ich kann dir leider nichts beibringen... Aber nimm doch diese Pfeile hier!");
talkEntry:addConsequence(npc.base.consequence.item.item(322, 25, 333, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(302, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addCondition(npc.base.condition.quest.quest(302, "=", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Oh... well. I owe you one. I can't teach you something. Whats about this bundle of arrows? Do you like?");
talkEntry:addConsequence(npc.base.consequence.item.item(322, 25, 333, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(302, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("money");
talkEntry:addTrigger("earn");
talkEntry:addTrigger("bow");
talkEntry:addCondition(npc.base.condition.quest.quest(302, "=", 4));
talkEntry:addResponse("Oh... well. I owe you one. I can't teach you something. Whats about this bundle of arrows? Do you like?");
talkEntry:addConsequence(npc.base.consequence.item.item(322, 25, 333, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(302, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("verdienen");
talkEntry:addTrigger("aufgabe");
talkEntry:addTrigger("abenteuer");
talkEntry:addTrigger("armbrust");
talkEntry:addTrigger("sehne");
talkEntry:addCondition(npc.base.condition.quest.quest(302, "=", 5));
talkEntry:addResponse("Danke für deine Hilfe, mit der Sehne.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addCondition(npc.base.condition.quest.quest(302, "=", 5));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Danke für deine Hilfe, mit der Sehne.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addCondition(npc.base.condition.quest.quest(302, "=", 5));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Thanks for your help with the Bowstring.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("money");
talkEntry:addTrigger("earn");
talkEntry:addTrigger("bow");
talkEntry:addCondition(npc.base.condition.quest.quest(302, "=", 5));
talkEntry:addResponse("Thanks for your help with the Bowstring.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("saw (%d+) apple");
talkEntry:addCondition(npc.base.condition.item.item(2560, "all", "=>", function(number) return (number*1); end));
talkEntry:addResponse("#me starts to saw the wood, after a few moments he finishes the work.");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2560, "%NUMBER"));
talkEntry:addConsequence(npc.base.consequence.item.item(2716, "%NUMBER", 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("saw (%d+) apple");
talkEntry:addResponse("I wowuld be glad to do so, but you havn't enough applewood.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("säge (%d+) apfel");
talkEntry:addTrigger("saege (%d+) apfel");
talkEntry:addCondition(npc.base.condition.item.item(2560, "all", "=>", function(number) return (number*1); end));
talkEntry:addResponse("#me beginnt das Holz zu sägen. Nach einigen Augenblicken beendet er die Arbeit.");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2560, "%NUMBER"));
talkEntry:addConsequence(npc.base.consequence.item.item(2716, "%NUMBER", 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("säge (%d+) apfel");
talkEntry:addTrigger("saege (%d+) apfel");
talkEntry:addResponse("Würd ich sofort machen. Aber du hast nicht genügend Apfelholz.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("saw (%d+) conifer");
talkEntry:addCondition(npc.base.condition.item.item(3, "all", "=>", function(number) return (number*1); end));
talkEntry:addResponse("#me starts to saw the wood, after a few moments he finishes the work.");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(3, "%NUMBER"));
talkEntry:addConsequence(npc.base.consequence.item.item(2543, "%NUMBER", 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("saw (%d+) conifer");
talkEntry:addResponse("I wowuld be glad to do so, but you havn't enough coniferwood.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("säge (%d+) nadel");
talkEntry:addTrigger("saege (%d+) nadel");
talkEntry:addCondition(npc.base.condition.item.item(3, "all", "=>", function(number) return (number*1); end));
talkEntry:addResponse("#me beginnt das Holz zu sägen. Nach einigen Augenblicken beendet er die Arbeit.");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(3, "%NUMBER"));
talkEntry:addConsequence(npc.base.consequence.item.item(2543, "%NUMBER", 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("säge (%d+) nadel");
talkEntry:addTrigger("saege (%d+) nadel");
talkEntry:addResponse("Würd ich sofort machen. Aber du hast nicht genügend Nadelholz.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("saw (%d+) cherry");
talkEntry:addCondition(npc.base.condition.item.item(543, "all", "=>", function(number) return (number*1); end));
talkEntry:addResponse("#me starts to saw the wood, after a few moments he finishes the work.");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(543, "%NUMBER"));
talkEntry:addConsequence(npc.base.consequence.item.item(545, "%NUMBER", 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("saw (%d+) cherry");
talkEntry:addResponse("I wowuld be glad to do so, but you havn't enough cherrywood.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("säge (%d+) kirsch");
talkEntry:addTrigger("saege (%d+) kirsch");
talkEntry:addCondition(npc.base.condition.item.item(543, "all", "=>", function(number) return (number*1); end));
talkEntry:addResponse("#me beginnt das Holz zu sägen. Nach einigen Augenblicken beendet er die Arbeit.");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(543, "%NUMBER"));
talkEntry:addConsequence(npc.base.consequence.item.item(545, "%NUMBER", 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("säge (%d+) kirsch");
talkEntry:addTrigger("saege (%d+) kirsch");
talkEntry:addResponse("Würd ich sofort machen. Aber du hast nicht genügend Kirschenholz.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("saw (%d+) naldor");
talkEntry:addCondition(npc.base.condition.item.item(544, "all", "=>", function(number) return (number*1); end));
talkEntry:addResponse("#me starts to saw the wood, after a few moments he finishes the work.");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(544, "%NUMBER"));
talkEntry:addConsequence(npc.base.consequence.item.item(546, "%NUMBER", 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("saw (%d+) naldor");
talkEntry:addResponse("I wowuld be glad to do so, but you havn't enough Naldorwood.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("säge (%d+) naldor");
talkEntry:addTrigger("saege (%d+) naldor");
talkEntry:addCondition(npc.base.condition.item.item(544, "all", "=>", function(number) return (number*1); end));
talkEntry:addResponse("#me beginnt das Holz zu sägen. Nach einigen Augenblicken beendet er die Arbeit.");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(544, "%NUMBER"));
talkEntry:addConsequence(npc.base.consequence.item.item(546, "%NUMBER", 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("säge (%d+) naldor");
talkEntry:addTrigger("saege (%d+) naldor");
talkEntry:addResponse("Würd ich sofort machen. Aber du hast nicht genügend Naldorholz.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("saw");
talkEntry:addTrigger("log");
talkEntry:addTrigger("wood");
talkEntry:addTrigger("board");
talkEntry:addResponse("I 'saw applewood', 'saw cherrywood', 'saw coniferwood' and 'saw naldorwood. At least two logs.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("säge");
talkEntry:addTrigger("saege");
talkEntry:addTrigger("holz");
talkEntry:addTrigger("brett");
talkEntry:addResponse("Ich 'säge Apfelholz', 'säge Kirschholz', 'säge Nadelholz' und 'säge Naldorholz'. Mindestens 2 Stück.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hallo");
talkEntry:addTrigger("gr[üue]+[sß]+e");
talkEntry:addTrigger("guten tag");
talkEntry:addTrigger("Gruß");
talkEntry:addTrigger("Seid gegrüßt");
talkEntry:addTrigger("Guten Abend");
talkEntry:addTrigger("Tach");
talkEntry:addTrigger("Moin");
talkEntry:addTrigger("Greb");
talkEntry:addResponse("Hallo.");
talkEntry:addResponse("#me ahmt lächelnd ein orkisches 'Greebas!' nach.");
talkEntry:addResponse("Gruß.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("good day");
talkEntry:addTrigger("greetings");
talkEntry:addTrigger("greets");
talkEntry:addTrigger("hail");
talkEntry:addTrigger("hello");
talkEntry:addTrigger("Be greeted");
talkEntry:addTrigger("Good morning");
talkEntry:addResponse("Hello.");
talkEntry:addResponse("#me smiles and imitates an orcish 'Greebas!'.");
talkEntry:addResponse("Greet.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greebas");
talkEntry:addTrigger("Greebs");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hello.");
talkEntry:addResponse("#me smiles and imitates an orcish 'Greebas!'.");
talkEntry:addResponse("Greet.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greebas");
talkEntry:addTrigger("Greebs");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Hallo.");
talkEntry:addResponse("#me ahmt lächelnd ein orkisches 'Greebas' nach.");
talkEntry:addResponse("Gruß.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("wie hei[sß]+t du");
talkEntry:addTrigger("wie hei[sß]+t ihr");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer seid");
talkEntry:addTrigger("wer bist");
talkEntry:addResponse("Eigentlich heiße ich %NPCNAME aber Orks sagen meißt einfach nur 'Stout' *er schmunzelt* Mir soll's recht sein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Good bye");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare thee well");
talkEntry:addResponse("Farewell.");
talkEntry:addResponse("#me smiles and imitates an orcish 'Farebas!'.");
talkEntry:addResponse("Good bye.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehabt euch wohl");
talkEntry:addResponse("Tschüß.");
talkEntry:addResponse("Wiedersehen.");
talkEntry:addResponse("#me ahmt lächelnd ein orkisches 'Farebas!' nach.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Fareba");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Farewell.");
talkEntry:addResponse("#me smiles and imitates an orcish 'Farebas!'.");
talkEntry:addResponse("Good bye.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Fareba");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Tschüß.");
talkEntry:addResponse("Wiedersehen.");
talkEntry:addResponse("#me ahmt lächelnd ein orkisches 'Farebas!' nach.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("Fein,fein. Ja wirklich! Ist ein gutes Leben hier.");
talkEntry:addResponse("Wenn ich Glück habe bekomme ich eine Ork zur Frau! Das wäre fantastisch.");
talkEntry:addResponse("Mo' behandelt mich ordentlich. Ich hab sogar eine Armbrust bekommen und gehe jetzt oft Jagen.");
talkEntry:addResponse("Um nichts auf der Welt würde ich das hier eintauschen.");
talkEntry:addResponse("Besser als Beryard, dem Trauerkloß. *lacht*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addResponse("Well,well. Promised! It's a good live here.");
talkEntry:addResponse("If I shall be lucky, the give me an orcess as wife! Would be awesome.");
talkEntry:addResponse("Mo' traets me well. I got an crossbow and hunt a lot.");
talkEntry:addResponse("I wouldn't change my live against the greatest offers.");
talkEntry:addResponse("Better then Beryard, this mope. *laughs*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("Actually my name is %NPCNAME. But each orc calls me just 'Stout'. *smirks* I'm glad with.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("I am");
talkEntry:addTrigger("I'm");
talkEntry:addResponse("We havn't met allready, did we?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ich bin");
talkEntry:addResponse("Hab ich dich nich schon mal geshen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hilfe");
talkEntry:addResponse("Ich 'säge' verschiedenes Holz und 'verkaufe' auch ein bisschen was.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("helfen");
talkEntry:addResponse("Ich 'säge' verschiedenes Holz und 'verkaufe' auch ein bisschen was.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("help");
talkEntry:addResponse("I 'saw' different wood and 'sell' a little bit.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("murgo");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Murgo? Nice guy!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("murgo");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Murgo? Netter Kerl!");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me zupft and der Befiederung einer seiner Bolzen herum.", "#me picks the fletching about one of his bolts.");
talkingNPC:addCycleText("#me reibt mit dem Hemdärmel am Griff seiner schäbigen Armrbust.", "#me rubs with his shirtsleeve the handle of his crossbow.");
talkingNPC:addCycleText("#me fährt, kritisch blickend, mit den Fingern auf der Bogensehne entlang.", "#me's fingers strokes slowly over the bowstring. His face seems afraid for a second.");
talkingNPC:addCycleText("#me lächelt zufrieden.", "#me smiles in a happy way.");
talkingNPC:addCycleText("#me kaut auf einem Stück Speck herum.", "#me chomps on a pice of bacon.");
talkingNPC:addCycleText("Wenn der Halbe nicht so immer so jammern würde!", "If the half one wouldn't weep the whole time!");
talkingNPC:addCycleText("Hm... die Sehne meiner Armbrust sollte mal neu gemacht werden.", "Hm... the bowstring of my crossbow must be changed.");
talkingNPC:addCycleText("#me pustet einige Sägespähne vom Tisch.", "#me puffs some sawdust away from the table.");
talkingNPC:addCycleText("#me nimmt einen Schluck aus einer kleinen schmuddeligen Flasche. Scharfer alkoholischer Dunst steigt in die Luft.", "#me takes a gulp from a grubby little bottle. A strong stench of alcohol fills the air.");
talkingNPC:addCycleText("#me's Augen fallen zu, er schwankt eine Sekunde beunruhigend, dann schnarcht er laut auf, erwacht daraufhin erschrocken. Er blickt sich beunruhigt um.", "#me eyes closes. He swings a second ominously, then gives a loud snore and wake up again. He gives the surrounding area a puzzled glance.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(1);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Das ist Jack der Schreiner.", "This is Jack the carpenter.");
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

function receiveText(npcChar, texttype, message, speaker) mainNPC:receiveText(npcChar, speaker, message); end;
function nextCycle(npcChar) mainNPC:nextCycle(npcChar); end;
function lookAtNpc(npcChar, char, mode) mainNPC:lookAt(npcChar, char, mode); end;
function useNPC(npcChar, char, counter, param) mainNPC:use(npcChar, char); end;
initNpc();
initNpc = nil;
-- END
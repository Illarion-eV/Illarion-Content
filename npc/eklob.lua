--------------------------------------------------------------------------------
-- NPC Name: Eklob                                                    Galmair --
-- NPC Job:  stuff for skill                                                  --
--                                                                            --
-- NPC Race: human                      NPC Position:  275, 260, 0            --
-- NPC Sex:  male                       NPC Direction: south                  --
--                                                                            --
-- Author:   Baylamon                                                         --
--                                                Illarion easyNPC Editor 1.02 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (0, 275, 260, 0, 4, 'Eklob', 'npc.eklob', 0, 3, 4, 255, 113, 3, 245, 180, 137);
---]]

require("npc.base.basic")
require("npc.base.condition.chance")
require("npc.base.condition.item")
require("npc.base.condition.language")
require("npc.base.condition.quest")
require("npc.base.condition.skill")
require("npc.base.condition.town")
require("npc.base.consequence.deleteitem")
require("npc.base.consequence.inform")
require("npc.base.consequence.quest")
require("npc.base.consequence.rankpoints")
require("npc.base.consequence.skill")
require("npc.base.talk")
module("npc.eklob", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addResponse("[Game Help] This NPC is the bear of galmair. Keywords: quest, food, dinner, breakfast, lunch, Grijas Kokotte.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addResponse("[Spielhilfe] Dieser NPC ist der Bär von Galmair. Schlüsselwörter: Quest, Futter, Essen, Frühstück, Abendbrot, Grijas Kokotte.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.cookingAndBaking, "=>", 20));
talkEntry:addCondition(npc.base.condition.quest.quest(671, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(15, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Bear Quest finished!]"));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(15, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(671, "=", 3));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("#me eats the apples and buzz satisfied.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.cookingAndBaking, "=>", 20));
talkEntry:addCondition(npc.base.condition.quest.quest(671, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(15, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Bär Quest erfüllt!]"));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(15, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(671, "=", 3));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("#me verputzt die Äpfel und brummt zufrieden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.cookingAndBaking, "<", 20));
talkEntry:addCondition(npc.base.condition.quest.quest(671, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(15, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Bear Quest finished!] You feel like you really learnt something."));
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.cookingAndBaking, "+", 2));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(15, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(671, "=", 3));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("#me eats the apples and buzz satisfied.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.cookingAndBaking, "<", 20));
talkEntry:addCondition(npc.base.condition.quest.quest(671, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(15, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Bär Quest erfüllt!] Du hast das Gefühl als hättest du etwas dazu gelernt."));
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.cookingAndBaking, "+", 2));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(15, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(671, "=", 3));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("#me verputzt die Äpfel und brummt zufrieden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(671, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(15, "all", "<", 5, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Bear Quest] You have to feed the bear with 5 apples."));
talkEntry:addResponse("#me looks hungry.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(671, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(15, "all", "<", 5, nil));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Bär Quest] Du sollst den Bären mit fünf Äpfel füttern."));
talkEntry:addResponse("#me schaut hungrig");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.cookingAndBaking, "=>", 40));
talkEntry:addCondition(npc.base.condition.quest.quest(671, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2940, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Bear Quest finished!]"));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2940, 1, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(671, "=", 6));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("#me sniffs at the steak and gulp it at once.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.cookingAndBaking, "=>", 40));
talkEntry:addCondition(npc.base.condition.quest.quest(671, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2940, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Bär Quest erfüllt!]"));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2940, 1, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(671, "=", 6));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("#me schnüffelt am Steak und verschlingt es mit einem Biss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.cookingAndBaking, "<", 40));
talkEntry:addCondition(npc.base.condition.quest.quest(671, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2940, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Bear Quest finished!] You feel like you really learnt something."));
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.cookingAndBaking, "+", 2));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2940, 1, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(671, "=", 6));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("#me sniffs the steak and gulp it at once.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.cookingAndBaking, "<", 40));
talkEntry:addCondition(npc.base.condition.quest.quest(671, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2940, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Bär Quest erfüllt!] Du hast das Gefühl als hättest du etwas dazu gelernt."));
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.cookingAndBaking, "+", 2));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2940, 1, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(671, "=", 6));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("#me schnüffelt am Steak und verschlingt es mit einem Biss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(671, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2940, "all", "<", 1, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Bear Quest] You have to feed the bear with a steak."));
talkEntry:addResponse("#me looks hungry.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(671, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2940, "all", "<", 1, nil));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Bär Quest] Du sollst den Bären mit einem Steak füttern."));
talkEntry:addResponse("#me schaut hungrig");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.cookingAndBaking, "=>", 60));
talkEntry:addCondition(npc.base.condition.quest.quest(671, "=", 8));
talkEntry:addCondition(npc.base.condition.item.item(49, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.item.item(3051, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Bear Quest finished!]"));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(49, 1, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(3051, 1, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(671, "=", 9));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("Me grabs the food with his claws and starts eating immediately.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.cookingAndBaking, "=>", 60));
talkEntry:addCondition(npc.base.condition.quest.quest(671, "=", 8));
talkEntry:addCondition(npc.base.condition.item.item(49, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.item.item(3051, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Bär Quest erfüllt!]"));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(49, 1, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(3051, 1, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(671, "=", 9));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("#me reißt dir das Essen aus der Hand und verspeist es genüsslich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.cookingAndBaking, "<", 60));
talkEntry:addCondition(npc.base.condition.quest.quest(671, "=", 8));
talkEntry:addCondition(npc.base.condition.item.item(49, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.item.item(3051, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Bear Quest finished!] You feel like you really learnt something."));
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.cookingAndBaking, "+", 2));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(49, 1, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(3051, 1, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(671, "=", 9));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("Me grabs the food with his claws and starts eating immediately.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.cookingAndBaking, "<", 60));
talkEntry:addCondition(npc.base.condition.quest.quest(671, "=", 8));
talkEntry:addCondition(npc.base.condition.item.item(49, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.item.item(3051, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Bär Quest erfüllt!] Du hast das Gefühl als hättest du etwas dazu gelernt."));
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.cookingAndBaking, "+", 2));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(49, 1, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(3051, 1, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(671, "=", 9));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("#me reißt dir das Essen aus der Hand und verspeist es genüsslich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(671, "=", 8));
talkEntry:addCondition(npc.base.condition.item.item(49, "all", "<", 1, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Bear Quest] You have to feed the bear with a bread and a saussage."));
talkEntry:addResponse("#me sniffs hungry at a stone.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(671, "=", 8));
talkEntry:addCondition(npc.base.condition.item.item(49, "all", "<", 1, nil));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Bär Quest] Du sollst den Bären mit einem Brot und einer Wurst füttern."));
talkEntry:addResponse("#me schnüffelt hungrig an einem Stein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(671, "=", 8));
talkEntry:addCondition(npc.base.condition.item.item(3051, "all", "<", 1, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Bear Quest] You have to feed the bear a bread and a saussage."));
talkEntry:addResponse("#me sniffs hungry at a stone.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(671, "=", 8));
talkEntry:addCondition(npc.base.condition.item.item(3051, "all", "<", 1, nil));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Bär Quest] Du sollst den Bären mit einem Brot und einer Wurst füttern."));
talkEntry:addResponse("#me schnüffelt hungrig an einem Stein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.cookingAndBaking, "=>", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(671, "=", 11));
talkEntry:addCondition(npc.base.condition.item.item(353, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Bear Quest finished!]"));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(353, 1, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(671, "=", 12));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("#me takes the cake carefully with his mouth and buzzes happy.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.cookingAndBaking, "=>", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(671, "=", 11));
talkEntry:addCondition(npc.base.condition.item.item(353, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Bär Quest erfüllt!]"));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(353, 1, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(671, "=", 12));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("#me nimmt den Kuchen vorsichtig in sein Maul und reibt zufrieden brummend seinen Kopf an der Wand.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.cookingAndBaking, "<", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(671, "=", 11));
talkEntry:addCondition(npc.base.condition.item.item(353, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Bear Quest finished!] You feel like you really learnt something."));
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.cookingAndBaking, "+", 2));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(353, 1, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(671, "=", 12));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("#me takes the cake carefully with his mouth and buzzes happy.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.cookingAndBaking, "<", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(671, "=", 11));
talkEntry:addCondition(npc.base.condition.item.item(353, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Bär Quest erfüllt!] Du hast das Gefühl als hättest du etwas dazu gelernt."));
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.cookingAndBaking, "+", 2));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(353, 1, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(671, "=", 12));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("#me nimmt den Kuchen vorsichtig in sein Maul und reibt zufrieden brummend seinen Kopf an der Wand.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(671, "=", 11));
talkEntry:addCondition(npc.base.condition.item.item(353, "all", "<", 1, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Bear Quest] You have to feed the bear with an apple cake."));
talkEntry:addResponse("#me sadly looks to an old apple in the mud.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(671, "=", 11));
talkEntry:addCondition(npc.base.condition.item.item(353, "all", "<", 1, nil));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Bär Quest] Du sollst den Bären mit einem Apfelkuchen füttern."));
talkEntry:addResponse("#me schaut traurig einen alten Apfel im Schlamm an.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(673, ">", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(671, "=", 12));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addResponse("#me plays with some residuals of your food.");
talkEntry:addResponse("#me sleeps. He seems satisfied and feed.");
talkEntry:addResponse("#me guards some residuals of food.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(673, ">", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(671, "=", 12));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addResponse("#me ist mit den Resten deines Futters beschäftigt.");
talkEntry:addResponse("#me schläft satt und zufrieden.");
talkEntry:addResponse("#me bewacht einige Futterreste.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(673, "=", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(671, ">", 12));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addResponse("#me begs for other food.");
talkEntry:addResponse("#me sniffs at your hand. He doesn't care about the food, you have with you.");
talkEntry:addResponse("#me tries to find out what you have in your pocket.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(673, "=", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(671, ">", 12));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addResponse("#me bettelt nach anderem Futter.");
talkEntry:addResponse("#me schnüffelt an deiner Hand. Das Futter, das du mithast, verschmäht er.");
talkEntry:addResponse("#me interessiert sich für den Inhalt deiner Tasche.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(673, "<", 9));
talkEntry:addCondition(npc.base.condition.quest.quest(671, ">", 12));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Bear Quest] You are too late! Grijas Kokotte can explain you the reason."));
talkEntry:addResponse("#me plays with some residuals of food. Maybe somebody else fed the bear.");
talkEntry:addResponse("#me sleeps. He seems satisfied and fed.");
talkEntry:addResponse("#me is not interested in your food.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(673, "<", 9));
talkEntry:addCondition(npc.base.condition.quest.quest(671, ">", 12));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Bär Quest] Du bist zu spät! Grijas Kokotte kann dir erklären warum."));
talkEntry:addResponse("#me ist mit Futterresten beschäftigt. Irgendjemand anderes hat ihn bereits was gegeben.");
talkEntry:addResponse("#me schläft satt und zufrieden.");
talkEntry:addResponse("#me interessiert sich nicht für deine Gaben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(673, ">", 8));
talkEntry:addCondition(npc.base.condition.quest.quest(671, "=", 13));
talkEntry:addCondition(npc.base.condition.item.item(355, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Bear Quest] Feeded!"));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(355, 1, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(671, "=", 12));
talkEntry:addResponse("#me takes the fish, throw it into the air and gulp it at once.");
talkEntry:addResponse("#me brings the fish to a silent place and eats it.");
talkEntry:addResponse("#me eats the fisch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(673, ">", 8));
talkEntry:addCondition(npc.base.condition.quest.quest(671, "=", 13));
talkEntry:addCondition(npc.base.condition.item.item(355, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Bär Quest] Gefüttert!"));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(355, 1, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(671, "=", 12));
talkEntry:addResponse("#me nimmt den Fisch, wirft ihn in die Luft und verschlingt ihn.");
talkEntry:addResponse("#me trägt den Fisch in eine stille Ecke und verspeist ihn.");
talkEntry:addResponse("#me isst den Fisch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(673, ">", 8));
talkEntry:addCondition(npc.base.condition.quest.quest(671, "=", 14));
talkEntry:addCondition(npc.base.condition.item.item(453, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Bear Quest] Feeded!"));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(453, 1, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(671, "=", 12));
talkEntry:addResponse("#me rolls the cookie like a ball with his paws until he eats it.");
talkEntry:addResponse("#me bites the pastry. Some parts fall down.");
talkEntry:addResponse("#me crumbles the cookie onto his nose and licks the crumbs with pleasure.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(673, ">", 8));
talkEntry:addCondition(npc.base.condition.quest.quest(671, "=", 14));
talkEntry:addCondition(npc.base.condition.item.item(453, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Bär Quest] Gefüttert!"));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(453, 1, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(671, "=", 12));
talkEntry:addResponse("#me rollt den Keks wie einen Ball mit den Pfoten, bevor er ihn futtert.");
talkEntry:addResponse("#me zerbeißt das Gebäck. Etwas fällt in den Schmutz.");
talkEntry:addResponse("#me zerkrümelt den Keks auf seiner Schnauze und leckt genüsslich die Krümel auf.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(673, ">", 8));
talkEntry:addCondition(npc.base.condition.quest.quest(671, "=", 15));
talkEntry:addCondition(npc.base.condition.item.item(2529, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Bear Quest] Feeded!"));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2529, 1, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(671, "=", 12));
talkEntry:addResponse("#me press the honey comb in between his paws an licks the honey from his paws and fur with pleasure. Pleased he looks to you.");
talkEntry:addResponse("#me pats after a wasp and the sweet food disapears in the water. He looks sad and licks the residual honey drops from his claws.");
talkEntry:addResponse("#me licks the honey and buzz silently. Could it be the bear song?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(673, ">", 8));
talkEntry:addCondition(npc.base.condition.quest.quest(671, "=", 15));
talkEntry:addCondition(npc.base.condition.item.item(2529, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Bär Quest] Gefüttert!"));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2529, 1, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(671, "=", 12));
talkEntry:addResponse("#me zerquetscht die Wabe zwischen seinen Pranken und leckt diese genüsslich ab. Dabei schaut er dich immer wieder dankbar an.");
talkEntry:addResponse("#me haut nach einer Wespe, die sich gleichfalls für den Honig interessierte. Der verschwindet im Wasser. Traurig leckt er die Reste von seinen Krallen.");
talkEntry:addResponse("#me leckt den Honig leise vor sich hin brummend. Es hört sich an wie das Bärenlied.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(673, ">", 8));
talkEntry:addCondition(npc.base.condition.quest.quest(671, "=", 16));
talkEntry:addCondition(npc.base.condition.item.item(306, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Bear Quest] Feeded!"));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(306, 1, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(671, "=", 12));
talkEntry:addResponse("#me takes the ham in his mouth like a cigarette. Slowly it disappears into the happy bear.");
talkEntry:addResponse("#me hits the meat with a prank. It falls behind a large stone. He can't get it back.");
talkEntry:addResponse("#me takes two bites to eat the ham.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(673, ">", 8));
talkEntry:addCondition(npc.base.condition.quest.quest(671, "=", 16));
talkEntry:addCondition(npc.base.condition.item.item(306, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Bär Quest] Gefüttert!"));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(306, 1, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(671, "=", 12));
talkEntry:addResponse("#me nimmt den Schinken wie eine Zigarre ins Maul. Ganz langsam verschwindet er in einem sichtlich zufriedenen Bären.");
talkEntry:addResponse("#me schlägt mit der Pranke nach dem Fleisch, das hinter einem großen Stein verschwindet. Erfolglos versucht er an den Leckerbissen zu kommen.");
talkEntry:addResponse("#me vertilgt das Leckerli in zwei Bissen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(673, ">", 8));
talkEntry:addCondition(npc.base.condition.quest.quest(671, "=", 17));
talkEntry:addCondition(npc.base.condition.item.item(2493, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Bear Quest] Feeded!"));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2493, 1, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(671, "=", 12));
talkEntry:addResponse("#me throw the carrot into the air. It land staight in his mouth.");
talkEntry:addResponse("#me looks angry after a raven that disapears with his food.");
talkEntry:addResponse("#me eats loud.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(673, ">", 8));
talkEntry:addCondition(npc.base.condition.quest.quest(671, "=", 17));
talkEntry:addCondition(npc.base.condition.item.item(2493, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Bär Quest] Gefüttert!"));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2493, 1, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(671, "=", 12));
talkEntry:addResponse("#me schlägt nach der Möhre. Die fliegt durch die Luft und landet direkt im Maul des Bären.");
talkEntry:addResponse("#me schaut ärgerlich einem Raben hinterher, der mit dem Futter verschwindet.");
talkEntry:addResponse("#me futtert mit lauten Bissen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(673, ">", 8));
talkEntry:addCondition(npc.base.condition.quest.quest(671, "=", 18));
talkEntry:addCondition(npc.base.condition.item.item(52, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Bear Quest] Feeded!"));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(52, 1, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(671, "=", 12));
talkEntry:addResponse("#me drinks someting before he wet his fur with the overmost water. Once he shakes himself drops fly in every direction.");
talkEntry:addResponse("#me bowls down the bucket. The water drains away.");
talkEntry:addResponse("#me drinks the water.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(673, ">", 8));
talkEntry:addCondition(npc.base.condition.quest.quest(671, "=", 18));
talkEntry:addCondition(npc.base.condition.item.item(52, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Bär Quest] Gefüttert!"));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(52, 1, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(671, "=", 12));
talkEntry:addResponse("#me säuft etwas. Dann stülpt er sich den Eimer über den Kopf. Als er sich schüttelt, fliegen die Tropfen in alle Richtungen.");
talkEntry:addResponse("#me schmeißt den Eimer um, das Wasser versickert.");
talkEntry:addResponse("#me säuft den Eimer leer.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(673, ">", 8));
talkEntry:addCondition(npc.base.condition.quest.quest(671, "=", 19));
talkEntry:addCondition(npc.base.condition.item.item(303, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Bear Quest] Feeded!"));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(303, 1, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(671, "=", 12));
talkEntry:addResponse("#me stands to his hind legs and takes the cake into his paws. He lumbers around like a bear dance. It could be the beat of the Galmairian Victory March.");
talkEntry:addResponse("#me let the cake fall down. But he eats it including the mud.");
talkEntry:addResponse("#me eats the cherries only. He reserves the tray for later.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(673, ">", 8));
talkEntry:addCondition(npc.base.condition.quest.quest(671, "=", 19));
talkEntry:addCondition(npc.base.condition.item.item(303, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Bär Quest] Gefüttert!"));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(303, 1, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(671, "=", 12));
talkEntry:addResponse("#me stellt sich auf die Hinterbeine und schnappt sich den Kuchen mit beiden Pfoten. Dann tapst er herum. Du meinst den Takt des Galmairer Triumphmarsches zu erkennen.");
talkEntry:addResponse("#me lässt den Kuchen fallen und verspeist ihn einschließlich des Schlamms.");
talkEntry:addResponse("#me frisst die Kirschen vom Kuchen runter. Den Boden hebt er sich für später auf.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(673, ">", 8));
talkEntry:addCondition(npc.base.condition.quest.quest(671, "=", 20));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Bear Quest] Visited!"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(671, "=", 12));
talkEntry:addResponse("#me rolls himself in the water. Once he shakes himself, you got hit by some water drops.");
talkEntry:addResponse("#me waves with one paw and rolls himself on the floor.");
talkEntry:addResponse("#me lay his head on a warm stone and buzz satisfied.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(673, ">", 8));
talkEntry:addCondition(npc.base.condition.quest.quest(671, "=", 20));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Bär Quest] Besucht!"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(671, "=", 12));
talkEntry:addResponse("#me legt sich auf den Rücken und wälzt sich zufrieden im Wasser. Als er sich schüttelt, bekommst du einige Tropfen ab.");
talkEntry:addResponse("#me hebt die Pfote als ob er winkt und trollt sich mit einem Purzelbaum.");
talkEntry:addResponse("#me legt den Kopf auf einen warmen Stein, blinzelt und brummt zufrieden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addResponse("#me's compound shows a sign 'Please ask Grijas Kokotte for feeding the bear'.");
talkEntry:addResponse("#me's compound is signed 'Bear of Galmair'.");
talkEntry:addResponse("#me looks arround with a begging gaze. Then he looks into the direction of Grijas Kokotte.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addResponse("#me's compound shows a sign 'Don't feed!'");
talkEntry:addResponse("#me's compound is signed 'Bear of Galmair'.");
talkEntry:addResponse("#me turns away.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addResponse("#me's Gehege hat ein Schild 'Fütterung nur in Abstimmung mit Grijas Kokotte'.");
talkEntry:addResponse("#me's Gehege hat ein Schild 'Bär von Galmair'");
talkEntry:addResponse("#me schaut sich bettelnd an. Dann schweift sein Blick zu Grijas Kokotte.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addResponse("#me's Gehege hat ein Schild 'Bitte nicht Füttern'.");
talkEntry:addResponse("#me's Gehege hat ein Schild 'Bär von Galmair'");
talkEntry:addResponse("#me dreht sich weg.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("food");
talkEntry:addTrigger("dinner");
talkEntry:addTrigger("breakfast");
talkEntry:addTrigger("lunch");
talkEntry:addResponse("#me sniffs at a muddy apple.");
talkEntry:addResponse("#me begs for food.");
talkEntry:addResponse("#me licks his chops.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Futter");
talkEntry:addTrigger("essen");
talkEntry:addTrigger("Frühstück");
talkEntry:addTrigger("brot");
talkEntry:addResponse("#me schnüffelt an einem matschigen Apfel.");
talkEntry:addResponse("#me bettelt um Essen.");
talkEntry:addResponse("#me leckt sich die Lippen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Grijas");
talkEntry:addTrigger("Kokotte");
talkEntry:addResponse("#me looks to the east and licks his chops");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Grijas");
talkEntry:addTrigger("Kokotte");
talkEntry:addResponse("#me blickt in den Osten und leckt sich die Lippen");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("archmage");
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("#me doesn't interrupt.");
talkEntry:addResponse("#me buzz.");
talkEntry:addResponse("#me shakes himself.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("#me macht ungerührt weiter.");
talkEntry:addResponse("#me brummt.");
talkEntry:addResponse("#me schüttelt sich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("#me looks up.");
talkEntry:addResponse("#me winks.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("#me schaut auf.");
talkEntry:addResponse("#me zwinkert.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addTrigger("Queen");
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("#me doesn't interrupt.");
talkEntry:addResponse("#me buzz");
talkEntry:addResponse("#me licks his nose.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königin");
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("#me macht ungerührt weiter.");
talkEntry:addResponse("#me brummt");
talkEntry:addResponse("#me leckt sich die Nase.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.chance.chance(10.0));
talkEntry:addTrigger("god");
talkEntry:addResponse("#me sniffs in the air");
talkEntry:addResponse("#me cock his ears.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.chance.chance(10.0));
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("#me schnüffelt in der Luft");
talkEntry:addResponse("#me stellt die Ohren auf.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(10.0));
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addResponse("#me looks around alerted.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.chance.chance(10.0));
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addResponse("#me schaut beunruhigt umher.");
talkEntry:addResponse("#me faucht laut.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(10.0));
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("#me looks around.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.chance.chance(10.0));
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("#me schaut sich um.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("#me turns his head away.");
talkEntry:addResponse("#me scratches on the ground.");
talkEntry:addResponse("#me fletches his teeth.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger(".*");
talkEntry:addResponse("#me angrily growls.");
talkEntry:addResponse("#sGrrr!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".*");
talkEntry:addResponse("#me angrily growls.");
talkEntry:addResponse("#sGrrr!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("#me schaut weg.");
talkEntry:addResponse("#me kratzt im Boden.");
talkEntry:addResponse("#me zeigt seine Zähne.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger(".*");
talkEntry:addResponse("#me knurrt verärgert.");
talkEntry:addResponse("#sGrrr!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".*");
talkEntry:addResponse("#me knurrt verärgert.");
talkEntry:addResponse("#sGrrr!");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me untersucht einen Stein.", "#me examines a stone.");
talkingNPC:addCycleText("#me kratzt sich am Hintern.", "#me scratches his buttocks.");
talkingNPC:addCycleText("#me trinkt aus einer Pfütze", "#me takes a sip out of a puddle.");
talkingNPC:addCycleText("#me brummt.", "#me buzz.");
talkingNPC:addCycleText("#me faucht leise.", "#me silently grumbles.");
talkingNPC:addCycleText("#me' Augen folgt mit zusammengekniffenen Augen einem Vogel.", "#me's eyes follow the path of a bird.");
talkingNPC:addCycleText("#me gähnt, mächtige Reißzähne blitzen hervor.", "#me yawns, some mighty fangs are shown for a second.");
talkingNPC:addCycleText("#me rollt einen Stein mit seiner Pfote.", "#me rolls a stone with his pats.");
talkingNPC:addCycleText("#me schüttelt sich.", "#me shakes himself.");
talkingNPC:addCycleText("#me blickt mit zusammengekniffenen Augen in den Himmel und legt sich hin.", "#me glances to the sky with narrowed eyes ansd lays down himself.");
mainNPC:addLanguage(0);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Ein sichtlich gut genährter Bär mit dichtem braunen Fell.", "A well feed bear with dense brown hair.");
mainNPC:setUseMessage("#me knurrt", "#me growls");
mainNPC:setConfusedMessage("#me schaut bettelnd.", "#me looks as he is begging.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 0);
mainNPC:setEquipment(11, 0);
mainNPC:setEquipment(5, 0);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 0);
mainNPC:setEquipment(9, 0);
mainNPC:setEquipment(10, 0);
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
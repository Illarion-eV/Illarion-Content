--------------------------------------------------------------------------------
-- NPC Name: Siloli                                                      None --
-- NPC Job:  none                                                             --
--                                                                            --
-- NPC Race: human                      NPC Position:  -413, -145, 0          --
-- NPC Sex:  male                       NPC Direction: west                   --
--                                                                            --
-- Author:   not set                                                          --
--                                                                            --
-- Last parsing: April 11, 2011                          easyNPC Parser v1.02 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (0, -413, -145, 0, 6, 'Siloli', 'npc.siloli', 0, 2, 5, 123, 62, 9, 245, 180, 137);
---]]

require("npc.base.basic")
require("npc.base.condition.chance")
require("npc.base.condition.language")
require("npc.base.condition.quest")
require("npc.base.condition.sex")
require("npc.base.condition.state")
require("npc.base.consequence.item")
require("npc.base.consequence.quest")
require("npc.base.consequence.state")
require("npc.base.talk")
module("npc.siloli", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=", 12));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(20));
talkEntry:addResponse("Geh mir aus den Augen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=", 12));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(25));
talkEntry:addResponse("Verschwinde, ich will dich nicht mehr sehn!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=", 12));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(33));
talkEntry:addResponse("Mörder meiner Kinder, weg mit dir!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=", 12));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(50));
talkEntry:addResponse("Geh weg!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=", 12));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Was machst du noch hier?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=", 12));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(20));
talkEntry:addResponse("Get out of my sight!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=", 12));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(25));
talkEntry:addResponse("Get lost, I don't want to see you anymore!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=", 12));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(33));
talkEntry:addResponse("murderer of my children, go away!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=", 12));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(50));
talkEntry:addResponse("Go away!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=", 12));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Why are you still here?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("one[ ]*arm");
talkEntry:addResponse("I have two arms, of course!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ein[ ]*arm");
talkEntry:addResponse("Ich habe natürlich zwei Arme!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("steal");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=", 2));
talkEntry:addResponse("What should I have stolen?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("stehlen");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=", 2));
talkEntry:addResponse("Was soll ich gestohlen haben?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("thief");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=", 2));
talkEntry:addResponse("What should I have stolen?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dieb");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=", 2));
talkEntry:addResponse("What should I have stolen?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ham");
talkEntry:addCondition(npc.base.condition.state.state("=", 3));
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=", 2));
talkEntry:addResponse("You accuse me of stealing ham? That's a bad accusation, can you prove that?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(557, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("schinken");
talkEntry:addCondition(npc.base.condition.state.state("=", 3));
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=", 2));
talkEntry:addResponse("Ich soll Schinken gestohlen haben? Das ist eine harte Beschuldigung, kannst du das beweisen?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(557, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ham");
talkEntry:addCondition(npc.base.condition.state.state("=", 2));
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=", 2));
talkEntry:addResponse("I should have delivered ham? That would mean that I stole it? That's a bad accusation, can you prove that?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(557, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("schinken");
talkEntry:addCondition(npc.base.condition.state.state("=", 2));
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=", 2));
talkEntry:addResponse("Ich sollte Schinken liefern? Das würde ja heißen, dass ich ihn gestohlen habe! Das ist eine harte Beschuldigung, kannst du das beweisen?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(557, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("wo schinken");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=", 2));
talkEntry:addResponse("Welcher Schinken denn? Wo soll der denn sein?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gib schinken");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=", 2));
talkEntry:addResponse("Ich soll dir meinen Schinken geben? Wieso?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("give ham");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=", 2));
talkEntry:addResponse("I should give you my ham? Why?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("where ham");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=", 2));
talkEntry:addResponse("Which ham? Where should that ham be?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("schinken gestohlen");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=", 2));
talkEntry:addResponse("Ich soll Schinken gestohlen haben? Das ist eine harte Beschuldigung, kannst du das beweisen?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(557, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("schinken genommen");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=", 2));
talkEntry:addResponse("Ich soll Schinken gestohlen haben? Das ist eine harte Beschuldigung, kannst du das beweisen?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(557, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gestohlen");
talkEntry:addCondition(npc.base.condition.state.state("=", 1));
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=", 2));
talkEntry:addResponse("Ich soll Schinken gestohlen haben? Das ist eine harte Beschuldigung, kannst du das beweisen?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(557, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("schinken geklaut");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=", 2));
talkEntry:addResponse("Ich soll Schinken gestohlen haben? Das ist eine harte Beschuldigung, kannst du das beweisen?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(557, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("geklaut");
talkEntry:addCondition(npc.base.condition.state.state("=", 1));
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=", 2));
talkEntry:addResponse("Ich soll Schinken gestohlen haben? Das ist eine harte Beschuldigung, kannst du das beweisen?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(557, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("stole ham");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=", 2));
talkEntry:addResponse("You accuse me of stealing ham? That's a bad accusation, can you prove that?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(557, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("took ham");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=", 2));
talkEntry:addResponse("You accuse me of stealing ham? That's a bad accusation, can you prove that?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(557, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("take ham");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=", 2));
talkEntry:addResponse("You accuse me of stealing ham? That's a bad accusation, can you prove that?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(557, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ham stole");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=", 2));
talkEntry:addResponse("You accuse me of stealing ham? That's a bad accusation, can you prove that?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(557, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("wo schinken");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=", 11));
talkEntry:addResponse("Ich habe keinen Schinken, wie oft denn noch?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("where ham");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=", 11));
talkEntry:addResponse("I don't have any ham, how often should I repeat that?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("stole ham");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=", 11));
talkEntry:addResponse("I didn't steal any ham!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ham stole");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=", 11));
talkEntry:addResponse("I didn't steal any ham!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("du schinken gestohlen");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=", 11));
talkEntry:addResponse("Ich habe keinen Schinken gestohlen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ja");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=", 3));
talkEntry:addResponse("Oh... nun, ich habe den Schinken, der mir angeboten wurde, genommen, aber kann man das 'Stehlen' nennen? Ich brauche ihn doch für meine Familie! Willst du wirklich, dass meine Kinder hungern?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(557, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("nein");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=", 3));
talkEntry:addResponse("Na eben. Wenn du's nicht beweisen kannst, dann äußere solche Anschuldigungen besser nicht.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(557, "=", 11));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ja");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=", 4));
talkEntry:addResponse("Hast du keine Kinder? Du bist herzlos! Also gut, ich schlage dir ein Geschäft vor: Ich gebe dir die Hälfte des Schinkens, einverstanden?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(557, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("nein");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=", 4));
talkEntry:addResponse("Na eben, du bist ja doch nicht so herzlos wie ich dachte. Aber ich denke, ich kann dir zwei Stück Schinken abgeben.");
talkEntry:addConsequence(npc.base.consequence.item.item(306, 2, 333, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(557, "=", 10));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ja");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=", 5));
talkEntry:addResponse("Gut, ich glaube, das ist fair, immerhin hast du ja Beweise. Und bis Übermorgen habe ich sicher im Wald einige Pilze für meine Kinder gesammelt. Hier, der Schinken.");
talkEntry:addConsequence(npc.base.consequence.item.item(306, 2, 333, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(557, "=", 10));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("nein");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=", 5));
talkEntry:addCondition(npc.base.condition.sex.sex(0));
talkEntry:addResponse("Du willst wirklich meine Kinder sterben sehen! Hast du denn gar keine Vaterinstinkte?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(557, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("nein");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=", 5));
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addResponse("Du willst wirklich meine Kinder sterben sehen! Hast du denn gar keine Mutterinstinkte?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(557, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("doch");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=", 6));
talkEntry:addResponse("Na eben. Ich gebe dir sechs Stück Schinken, dann bekommt jedes meiner Kinder noch ein halbes Stück.");
talkEntry:addConsequence(npc.base.consequence.item.item(306, 6, 333, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(557, "=", 10));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ja");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=", 6));
talkEntry:addResponse("Na eben. Ich gebe dir sechs Stück Schinken, dann bekommt jedes meiner Kinder noch ein halbes Stück.");
talkEntry:addConsequence(npc.base.consequence.item.item(306, 6, 333, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(557, "=", 10));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("nein");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=", 6));
talkEntry:addResponse("Nun gut, du erbarmungsloses Etwas. Ich werde dir eine Einladung zur Beerdigung meiner Kinder schicken... Hier, dein verdammter Schinken! Und jetzt geh mir aus den Augen!");
talkEntry:addConsequence(npc.base.consequence.item.item(306, 10, 333, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(557, "=", 12));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("yes");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=", 3));
talkEntry:addResponse("Oh... well, I took that ham that someone wanted to give to me, but can you consider that 'stealing'? I need it for my family! Or do you want to see my children starving?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(557, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("no");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=", 3));
talkEntry:addResponse("See? If you can't prove it, you shouldn't speak our such bad accusations.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(557, "=", 11));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("yes");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=", 4));
talkEntry:addResponse("Don't you have children? You are so heartless! Well, I propose a deal: I'll give you half of my ham, can you accept that?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(557, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("no");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=", 4));
talkEntry:addResponse("Ah, you're not so heartless than I thought. I think I can give you two pieces of my ham.");
talkEntry:addConsequence(npc.base.consequence.item.item(306, 2, 333, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(557, "=", 10));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("yes");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=", 5));
talkEntry:addResponse("Good, I think that's fair enough, I mean, you have a proof. I will surely find some mushrooms within the next days to feed my children. Here you are.");
talkEntry:addConsequence(npc.base.consequence.item.item(306, 2, 333, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(557, "=", 10));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("no");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=", 5));
talkEntry:addCondition(npc.base.condition.sex.sex(0));
talkEntry:addResponse("You really want to see my children starve! Don't you have paternal instinkts?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(557, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("no");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=", 5));
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addResponse("You really want to see my children starve! Don't you have maternal instinkts?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(557, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("yes");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=", 6));
talkEntry:addResponse("Very good. I will give you six pieces of my ham, that way my children get half a piece each.");
talkEntry:addConsequence(npc.base.consequence.item.item(306, 6, 333, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(557, "=", 10));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("no");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=", 6));
talkEntry:addResponse("Well, you merciless something! I'll send you invitations for the burial of my children... Here, your damn ham! And now, get lost!");
talkEntry:addConsequence(npc.base.consequence.item.item(306, 10, 333, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(557, "=", 12));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("schinken");
talkEntry:addResponse("Ein wundervoller Genuß, so ein paar Stücke Schinken können eine ganze Familie einige Tage lang ernähren!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ham");
talkEntry:addResponse("Mmmh, ham, I love it! A few pieces of ham can feed a whole family for some days!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hafen");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=", 11));
talkEntry:addResponse("Der Hafen? Da war ich als Kind einmal, ich weiß gar nicht genau, wo der ist.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hafen");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=", 10));
talkEntry:addResponse("Am Hafen war ich erst unlängst, schöne Gegend!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hafen");
talkEntry:addResponse("Jaja, der Hafen. Da gibt es Schiffe und Wasser, nicht?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Harbo[u]+r");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=", 11));
talkEntry:addResponse("The harbor? I once was there, as a child. I can't even remember where it was.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Harbo[u]+r");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=", 10));
talkEntry:addResponse("I visited the harbor recently, nice spot there!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Harbo[u]+r");
talkEntry:addResponse("Yes, the harbor. There are ships and water, isn't it?");
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
talkEntry:addResponse("Ich bin ein einfacher Bauer, nur ein Bauer.");
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
talkEntry:addResponse("Ich bin nur ein Bauer.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("eure aufgabe");
talkEntry:addResponse("Ich bin nur ein Bauer.");
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
talkEntry:addResponse("Was ein Bauer eben so tut.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was tut ihr");
talkEntry:addResponse("Was ein Bauer eben so tut.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf[s]*t");
talkEntry:addResponse("Ich handle nicht.");
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
talkEntry:addTrigger("what buy");
talkEntry:addResponse("I don't trade");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addResponse("I don't trade");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what you do");
talkEntry:addResponse("I just do what a farmer does.");
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
talkEntry:addTrigger("carrier");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=", 2));
talkEntry:addResponse("What carrier? What should I have delivered?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("bote");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=", 2));
talkEntry:addResponse("Was für ein Bote? Was soll ich denn überbracht haben?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
mainNPC:addLanguage(0);
mainNPC:addLanguage(1);
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

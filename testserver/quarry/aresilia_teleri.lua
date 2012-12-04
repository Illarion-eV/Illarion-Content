--------------------------------------------------------------------------------
-- NPC Name: Aresilia Teleri                                             None --
-- NPC Job:  quest                                                            --
--                                                                            --
-- NPC Race: human                      NPC Position:  896, 803, 1            --
-- NPC Sex:  female                     NPC Direction: south                  --
--                                                                            --
-- Author:   Zot & RIncewind                                                  --
--                                                                            --
-- Last parsing: April 11, 2011                          easyNPC Parser v1.02 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (0, 896, 803, 1, 4, 'Aresilia Teleri', 'npc.aresilia_teleri', 1, 2, 5, 123, 62, 9, 245, 180, 137);
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
require("npc.base.talk")
module("npc.aresilia_teleri", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addResponse("[Game Help] This NPC is the tailor Aresilia Teleri. Keywords: Hello, quest, needle, adventure, stirring rod, cloth");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addResponse("[Spielhilfe] Dieser NPC ist die Schneiderin Aresilia Teleri. Schlüsselwörter: Hallo, Quest, Aufgaben, Rührstab, Nadel, Stoff");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hello");
talkEntry:addTrigger("Greet");
talkEntry:addTrigger("Hail");
talkEntry:addTrigger("Good day");
talkEntry:addTrigger("Good morning");
talkEntry:addTrigger("Good evening");
talkEntry:addResponse("Good day as well.");
talkEntry:addResponse("Be welcome.");
talkEntry:addResponse("Greets, how are you today?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Grüß");
talkEntry:addTrigger("Gruß");
talkEntry:addTrigger("Guten Tag");
talkEntry:addTrigger("Guten Abend");
talkEntry:addTrigger("Mahlzeit");
talkEntry:addTrigger("Tach");
talkEntry:addTrigger("Moin");
talkEntry:addResponse("Einen wunderschönen Tag wünsch ich!");
talkEntry:addResponse("Tagchen");
talkEntry:addResponse("Grüße euch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Good day as well.");
talkEntry:addResponse("Be welcome.");
talkEntry:addResponse("Greets, how are you today?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Wie? Ich höre nicht so gut, wie war das?");
talkEntry:addResponse("Was..nein, sowas sagt man doch nicht!");
talkEntry:addResponse("Gefällt mir nicht, sag was anderes!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Bye.");
talkEntry:addResponse("Have a good day.");
talkEntry:addResponse("Farewell.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Auf wiedersehen.");
talkEntry:addResponse("Einen schönen Tag wünsch ich noch.");
talkEntry:addResponse("Ja, tschüss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Excuse me?");
talkEntry:addResponse("Yes. I think so.");
talkEntry:addResponse("I hear that randomly. But what's the meaning about?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Das höre ich oft, aber was heißt denn das?");
talkEntry:addResponse("Ja, ich glaub es dir!");
talkEntry:addResponse("Wie bitte?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("Oh, I'm mainly good. How are you?");
talkEntry:addResponse("I'm allright, thanks for askening. What's about you?");
talkEntry:addResponse("Uff, I got a little stomachache, seem I ate something wrong.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addResponse("Ach gerade fühl ich mich ganz gut und du?");
talkEntry:addResponse("Mir geht es gut, danke der Nachfrage. Wie geht es dir?");
talkEntry:addResponse("Uff, etwas Bauchschmerzen, könnte sein dass ich wieder etwas schlechtes gegessen hab.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("I am %NPCNAME and who are you?");
talkEntry:addResponse("I am %NPCNAME a excellent tailoress.");
talkEntry:addResponse("%NPCNAME is my name and I never saw you before I guess. Who are you?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Ich bin die Aresilia und wer bist du?");
talkEntry:addResponse("Ich bin Aresilia Teleri, eine sehr gute Schnederin.");
talkEntry:addResponse("Aresilia Teleri ist mein Name, dich habe ich hier aber noch nie gesehen, wer bist du denn?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("needle");
talkEntry:addCondition(npc.base.condition.quest.quest(83, "=", 0));
talkEntry:addResponse("A needle is getable by each blacksmith, ask at a forge. They are able to make one.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nadel");
talkEntry:addCondition(npc.base.condition.quest.quest(83, "=", 0));
talkEntry:addResponse("Eine Nadel kriegst du von jedem Schmied, frag einen bei der Werkstatt. Der kann dir bestimmt eine schmieden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dy rod");
talkEntry:addResponse("Are you looking for a dying rod? A carpenter shoul dable to help you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Rührstab");
talkEntry:addResponse("Wenn du einen Rührstab suchst, wäre mein Tipp für dich an einen Schreiner zu wenden, der kann dir da sicher weiter helfen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("cloth");
talkEntry:addCondition(npc.base.condition.quest.quest(83, "=", 0));
talkEntry:addResponse("Take a scissor for sheep-shearing, next take the wool and work them to cloth. To make them white, place them into the sun.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Stoff");
talkEntry:addCondition(npc.base.condition.quest.quest(83, "=", 0));
talkEntry:addResponse("Du solltest mittels einer Schere ein Schaf scheren, anschließend aus der Wolle die Wollknäuele herstellen und zu guter letzt Stoffe daraus machen. Wenn du weiße Stoffe willst, solltest du vielleicht die Stoffe in der Sonne liegen lassen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "tailoring", "=<", 20));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Finally someone asks me for that. I was working on some shirts but I'm out of resurces. Gather ten threads an ten white cloth and hand them to me. Furthermore I will need a needle as well. Here... I will give you a scissor for sheep-shearing.");
talkEntry:addConsequence(npc.base.consequence.item.item(74, 1, 399, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(83, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "tailoring", "=<", 20));
talkEntry:addResponse("Endlich bittet mich jemand danach. Ich wollte ein paar Hemden herstellen, aber mir fehlen zehn Rollen Garn sowie zehn weiße Stoffe. Falls ihr mir dabei zuschauen wollt, bringt mir auch eine Nadel mit bitte. Hier habt ihr eine Schere um die Schafe zu scheren.");
talkEntry:addConsequence(npc.base.consequence.item.item(6, 1, 399, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(83, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "tailoring", "=<", 20));
talkEntry:addResponse("Finally someone asks me for that. I was working on some shirts but I'm out of resurces. Gather ten threads an ten white cloth and hand them to me. Furthermore I will need a needle as well. Here... I will give you a scissor for sheep-shearing.");
talkEntry:addConsequence(npc.base.consequence.item.item(74, 1, 399, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(83, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "tailoring", "=<", 20));
talkEntry:addResponse("Endlich bittet mich jemand danach. Ich wollte ein paar Hemden herstellen, aber mir fehlen zehn Rollen Garn sowie zehn weiße Stoffe. Falls ihr mir dabei zuschauen wollt, bringt mir auch eine Nadel mit bitte. Hier habt ihr eine Schere um die Schafe zu scheren.");
talkEntry:addConsequence(npc.base.consequence.item.item(6, 1, 399, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(83, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(83, "=", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Gather ten threads and ten white cloth and a needle. After hand them to me I will teach you something.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(83, "=", 1));
talkEntry:addResponse("Der Auftrag lautet mir zehn Garnrollen, zehn weiße Stoffe und desweiteren noch eine Nadel zu bringen, falls ihr was von mir lernen wollt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(83, "=", 1));
talkEntry:addResponse("Gather ten threads and ten white cloth and a needle. After hand them to me I will teach you something.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(83, "=", 1));
talkEntry:addResponse("Der Auftrag lautet mir zehn Garnrollen, zehn weiße Stoffe und desweiteren noch eine Nadel zu bringen, falls ihr was von mir lernen wollt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(83, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(178, "all", ">", 9));
talkEntry:addCondition(npc.base.condition.item.item(50, "all", ">", 9));
talkEntry:addCondition(npc.base.condition.item.item(47, "all", ">", 0));
talkEntry:addResponse("Großartig,ihr seid aber schnell zurück. So..jetzt werden die Hemden hergestellt, Augen auf!");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "tailoring", "+", 5));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(178, 10));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(50, 10));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(47, 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(83, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(83, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(178, "all", ">", 9));
talkEntry:addCondition(npc.base.condition.item.item(50, "all", ">", 9));
talkEntry:addCondition(npc.base.condition.item.item(47, "all", ">", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Awesome, you are really fast. So... now I will sew the shirts. Look and learn!");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "tailoring", "+", 5));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(178, 10));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(50, 10));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(47, 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(83, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(83, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(178, "all", "<", 10));
talkEntry:addCondition(npc.base.condition.item.item(50, "all", "<", 10));
talkEntry:addCondition(npc.base.condition.item.item(47, "all", "<", 1));
talkEntry:addResponse("Euch scheint noch etwas zu fehlen, bringt mir das noch sonst kann ich die Hemden nicht fertigen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(83, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(178, "all", "<", 10));
talkEntry:addCondition(npc.base.condition.item.item(50, "all", "<", 10));
talkEntry:addCondition(npc.base.condition.item.item(47, "all", "<", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hm. You don't got all materials I asked for. Gather ten threads and ten white cloth and a needle.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "tailoring", ">", 20));
talkEntry:addCondition(npc.base.condition.skill.skill(2, "tailoring", "=<", 40));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Do you want to learn again something? Allright, you have to gather 15 leather a dying rod and a scrissor for me. And five blue shirts you createt by your own.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(83, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "tailoring", ">", 20));
talkEntry:addCondition(npc.base.condition.skill.skill(2, "tailoring", "=<", 40));
talkEntry:addResponse("Du willst schon wieder etwas lernen? Gut, aber du musst mir mal wieder einige Dinge bringen. Und zwar 15 Lederlagen, einen Rührstab und eine Schere, das wichtigste für einen Schneider und natürlich fünf von dir hergestellte blaue Hemden.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(83, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "tailoring", ">", 20));
talkEntry:addCondition(npc.base.condition.skill.skill(2, "tailoring", "=<", 40));
talkEntry:addResponse("Do you want to learn again something? Allright, you have to gather 15 leather a dying rod and a scrissor for me. And five blue shirts you createt by your own.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(83, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "tailoring", ">", 20));
talkEntry:addCondition(npc.base.condition.skill.skill(2, "tailoring", "=<", 40));
talkEntry:addResponse("Du willst schon wieder etwas lernen? Gut, aber du musst mir mal wieder einige Dinge bringen. Und zwar 15 Lederlagen, einen Rührstab und eine Schere, das wichtigste für einen Schneider und natürlich fünf von dir hergestellte blaue Hemden.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(83, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "tailoring", "=<", 20));
talkEntry:addCondition(npc.base.condition.quest.quest(83, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Thanks, but I have no idea, where you could with. maybee later.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "tailoring", "=<", 20));
talkEntry:addCondition(npc.base.condition.quest.quest(83, "=", 2));
talkEntry:addResponse("Danke, aber ich weiß gerade nichts, wobei du mir helfen könntet.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "tailoring", "=<", 20));
talkEntry:addCondition(npc.base.condition.quest.quest(83, "=", 2));
talkEntry:addResponse("Thanks, but I have no idea, where you could with. maybee later.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "tailoring", "=<", 20));
talkEntry:addCondition(npc.base.condition.quest.quest(83, "=", 2));
talkEntry:addResponse("Danke, aber ich weiß gerade nichts, wobei du mir helfen könntet.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(83, "=", 3));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Let' me check my list... yes. You have to gather 15 leather a dying rod and a scrissor for me. And five blue shirts you createt by your own.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(83, "=", 3));
talkEntry:addResponse("Lasst mich eben auf die Liste schauen...ja, richtig. Es waren 15 Lederlagen, eine Schere und ein Rührstab das du mir bringen solltest und wie du dich noch erinnern kannst fünf von dir hergestellte blaue Hemden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(83, "=", 3));
talkEntry:addResponse("Let' me check my list... yes. You have to gather 15 leather a dying rod and a scrissor for me. And five blue shirts you createt by your own.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(83, "=", 3));
talkEntry:addResponse("Lasst mich eben auf die Liste schauen...ja, richtig. Es waren 15 Lederlagen, eine Schere und ein Rührstab das du mir bringen solltest und wie du dich noch erinnern kannst fünf von dir hergestellte blaue Hemden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(83, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2547, "all", ">", 14));
talkEntry:addCondition(npc.base.condition.item.item(181, "all", ">", 4));
talkEntry:addCondition(npc.base.condition.item.item(6, "all", ">", 1));
talkEntry:addCondition(npc.base.condition.item.item(2781, "all", ">", 1));
talkEntry:addResponse("Sehr gut, du hast alles dabei und ein großes Lob an dich, die Hemden sehen wirklich gut aus. Aber nun schau mal zu wie ich folgenden Mantel herstelle, es wird dir sicher weiterhelfen um beim Schneidern voranzkommen.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "tailoring", "+", 5));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2547, 15));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(181, 5));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(6, 1));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2781, 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(83, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(83, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2547, "all", ">", 14));
talkEntry:addCondition(npc.base.condition.item.item(181, "all", ">", 4));
talkEntry:addCondition(npc.base.condition.item.item(6, "all", ">", 1));
talkEntry:addCondition(npc.base.condition.item.item(2781, "all", ">", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Very good! You got all things I asked for. The shirts are well done. And now... watch me making this coats, I'm sure you are able to learn something about.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "tailoring", "+", 5));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2547, 15));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(181, 5));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(6, 1));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2781, 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(83, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(83, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2547, "all", "<", 15));
talkEntry:addCondition(npc.base.condition.item.item(181, "all", "<", 5));
talkEntry:addCondition(npc.base.condition.item.item(6, "all", "=", 0));
talkEntry:addCondition(npc.base.condition.item.item(2781, "all", "=", 0));
talkEntry:addResponse("Du hast nicht alles mit was ich wollte, komm später wieder.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(83, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2543, "all", "<", 15));
talkEntry:addCondition(npc.base.condition.item.item(2719, "all", "<", 5));
talkEntry:addCondition(npc.base.condition.item.item(9, "all", "=", 0));
talkEntry:addCondition(npc.base.condition.item.item(2752, "all", "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hm. You don't got all materials I asked for.You have to gather 15 leather a dying rod and a scrissor and five blue shirts for me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "tailoring", ">", 40));
talkEntry:addCondition(npc.base.condition.skill.skill(2, "tailoring", "=<", 60));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Good you are asking for. Actually there's a task for you. Gather four buckets with blue colour and ten green cloth, ten grey cloth, five fur.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(83, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "tailoring", ">", 40));
talkEntry:addCondition(npc.base.condition.skill.skill(2, "tailoring", "=<", 60));
talkEntry:addResponse("Gute Frage, ich hätte wirklich was für dich zu tun. Bring mir doch bitte vier Eimer mit blauer Farbe, zehn grüne sowie zehn graue Stoffe, als auch fünf Felllagen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(83, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "tailoring", ">", 40));
talkEntry:addCondition(npc.base.condition.skill.skill(2, "tailoring", "=<", 60));
talkEntry:addResponse("Good you are asking for. Actually there's a task for you. Gather four buckets with blue colour and ten green cloth, ten grey cloth, five fur.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(83, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "tailoring", ">", 40));
talkEntry:addCondition(npc.base.condition.skill.skill(2, "tailoring", "=<", 60));
talkEntry:addResponse("Gute Frage, ich hätte wirklich was für dich zu tun. Bring mir doch bitte vier Eimer mit blaue Farbe, zehn grüner sowie zehn graue Stoffe, als auch fünf Felllagen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(83, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "tailoring", "=<", 40));
talkEntry:addCondition(npc.base.condition.quest.quest(83, "=", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Ah... I'm quite busy right now. Ask me later again.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "tailoring", "=<", 40));
talkEntry:addCondition(npc.base.condition.quest.quest(83, "=", 4));
talkEntry:addResponse("Ich habe grad einiges um die Ohren, besuch mich doch bitte ein ander mal.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "tailoring", "=<", 40));
talkEntry:addCondition(npc.base.condition.quest.quest(83, "=", 4));
talkEntry:addResponse("Ah... I'm quite busy right now. Ask me later again.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "tailoring", "=<", 40));
talkEntry:addCondition(npc.base.condition.quest.quest(83, "=", 4));
talkEntry:addResponse("Ich habe grad einiges um die Ohren, besuch mich doch bitte ein ander mal.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(83, "=", 5));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Your task is to gather four buckets with blue colour and ten green cloth, ten grey cloth, five fur.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(83, "=", 5));
talkEntry:addResponse("Der Auftrag hieß, du sollst mir vier Eimer mit blauer Farbe bringen, zehn grüne Stoffe, zehn graue Stoffe und natürlich fünf Fellagen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(83, "=", 5));
talkEntry:addResponse("Your task is to gather four buckets with blue colour and ten green cloth, ten grey cloth, five fur.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(83, "=", 5));
talkEntry:addResponse("Der Auftrag hieß, du sollst mir vier Eimer mit blauer Farbe bringen, zehn grüne Stoffe, zehn graue Stoffe und natürlich fünf Fellagen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(83, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2680, "all", ">", 3));
talkEntry:addCondition(npc.base.condition.item.item(54, "all", ">", 9));
talkEntry:addCondition(npc.base.condition.item.item(176, "all", ">", 9));
talkEntry:addCondition(npc.base.condition.item.item(2586, "all", ">", 4));
talkEntry:addResponse("Wunderbar, das ging schneller als gedacht, nun schau mir aber genau auf die Finger, denn das zeig ich dir nur einmal.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "tailoring", "+", 5));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2680, 4));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(54, 10));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(176, 10));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2586, 5));
talkEntry:addConsequence(npc.base.consequence.quest.quest(83, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(83, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2680, "all", ">", 3));
talkEntry:addCondition(npc.base.condition.item.item(54, "all", ">", 9));
talkEntry:addCondition(npc.base.condition.item.item(176, "all", ">", 9));
talkEntry:addCondition(npc.base.condition.item.item(2586, "all", ">", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Wonderfull, you got everything. Now, watch my figners I will show it only once.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "tailoring", "+", 5));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2680, 4));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(54, 10));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(176, 10));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2586, 5));
talkEntry:addConsequence(npc.base.consequence.quest.quest(83, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(83, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2680, "all", "<", 4));
talkEntry:addCondition(npc.base.condition.item.item(54, "all", "<", 10));
talkEntry:addCondition(npc.base.condition.item.item(176, "all", "<", 10));
talkEntry:addCondition(npc.base.condition.item.item(2586, "all", "<", 5));
talkEntry:addResponse("Bring mir noch die restlichen Dinge die fehlen, dann bring ich dir was neues bei.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(83, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2680, "all", "<", 4));
talkEntry:addCondition(npc.base.condition.item.item(54, "all", "<", 10));
talkEntry:addCondition(npc.base.condition.item.item(176, "all", "<", 10));
talkEntry:addCondition(npc.base.condition.item.item(2586, "all", "<", 5));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("There is something missing. Gather all things, and I will teach you something.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "tailoring", ">", 60));
talkEntry:addCondition(npc.base.condition.skill.skill(2, "tailoring", "=<", 80));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("There is a last task for you. So we will see if you are gifted in this craft. Create following goods and bring them here. 15 ropes, ten leather gloves, ten leaher boots and five light hunting armors.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(83, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "tailoring", ">", 60));
talkEntry:addCondition(npc.base.condition.skill.skill(2, "tailoring", "=<", 80));
talkEntry:addResponse("Eine letzte Aufgabe habe ich noch für dich, um zu sehen ob du wirklich Talent hast. Bring mir folgende von dir hergestellen Dinge, dies wären 15 Seile, zehn paar Lederhandschuhe und Lederstiefel und zu guter letzt fünf leichte Jagdrüstungen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(83, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "tailoring", ">", 60));
talkEntry:addCondition(npc.base.condition.skill.skill(2, "tailoring", "=<", 80));
talkEntry:addResponse("There is a last task for you. So we will see if you are gifted in this craft. Create following goods and bring them here. 15 ropes, ten leather gloves, ten leaher boots and five light hunting armors.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(83, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "tailoring", ">", 60));
talkEntry:addCondition(npc.base.condition.skill.skill(2, "tailoring", "=<", 80));
talkEntry:addResponse("Eine letzte Aufgabe habe ich noch für dich, um zu sehen ob du wirklich Talent hast. Bring mir folgende von dir hergestellen Dinge, dies wären 15 Seile, zehn paar Lederhandschuhe und Lederstiefel und zu guter letzt fünf leichte Jagdrüstungen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(83, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "tailoring", "=<", 60));
talkEntry:addCondition(npc.base.condition.quest.quest(83, "=", 6));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("You should practice more, after that I will have a special task for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "tailoring", "=<", 60));
talkEntry:addCondition(npc.base.condition.quest.quest(83, "=", 6));
talkEntry:addResponse("Du solltest weiter üben, dann hab ich später sicher noch etwas für dich zu erledigen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "tailoring", "=<", 60));
talkEntry:addCondition(npc.base.condition.quest.quest(83, "=", 6));
talkEntry:addResponse("You should practice more, after that I will have a special task for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "tailoring", "=<", 60));
talkEntry:addCondition(npc.base.condition.quest.quest(83, "=", 6));
talkEntry:addResponse("Du solltest weiter üben, dann hab ich später sicher noch etwas für dich zu erledigen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(83, "=", 7));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("The last task contains to create following goods and bring them here. 15 ropes, ten leather gloves, ten leaher boots and five light hunting armors.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(83, "=", 7));
talkEntry:addResponse("Der letzte Auftrag lautete mir einige selbst hergestelle Dinge zu bringen. Es waren 15 Seile, zehn paar Lederhandschuhe, zehn paar Lederstiefel und natürlich fünf der besten leichten Jagdrüstungen die du herstellen kannst.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(83, "=", 7));
talkEntry:addResponse("The last task contains to create following goods and bring them here. 15 ropes, ten leather gloves, ten leaher boots and five light hunting armors.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(83, "=", 7));
talkEntry:addResponse("Der letzte Auftrag lautete mir einige selbst hergestelle Dinge zu bringen. Es waren 15 Seile, zehn paar Lederhandschuhe, zehn paar Lederstiefel und natürlich fünf der besten leichten Jagdrüstungen die du herstellen kannst.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(83, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(2760, "all", ">", 14));
talkEntry:addCondition(npc.base.condition.item.item(48, "all", ">", 9));
talkEntry:addCondition(npc.base.condition.item.item(53, "all", ">", 9));
talkEntry:addCondition(npc.base.condition.item.item(364, "all", ">", 4));
talkEntry:addResponse("Ausgezeichnet, sieht alles wirklich klasse aus. Gute Arbeit, nun zeig ich dir zum Abschluss noch etwas, also schau genau zu.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "tailoring", "+", 5));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2760, 15));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(48, 10));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(53, 10));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(364, 5));
talkEntry:addConsequence(npc.base.consequence.quest.quest(83, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(83, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(2760, "all", ">", 14));
talkEntry:addCondition(npc.base.condition.item.item(48, "all", ">", 9));
talkEntry:addCondition(npc.base.condition.item.item(53, "all", ">", 9));
talkEntry:addCondition(npc.base.condition.item.item(364, "all", ">", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Awesome. it looks great! Very well done. Let me show you a final trick.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "tailoring", "+", 5));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2760, 15));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(48, 10));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(53, 10));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(364, 5));
talkEntry:addConsequence(npc.base.consequence.quest.quest(83, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(83, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(2760, "all", "<", 15));
talkEntry:addCondition(npc.base.condition.item.item(48, "all", "<", 10));
talkEntry:addCondition(npc.base.condition.item.item(53, "all", "<", 10));
talkEntry:addCondition(npc.base.condition.item.item(364, "all", "<", 5));
talkEntry:addResponse("Bring mir noch den Rest der Sachen die ich wollte, wenn du nichtmal die simpelsten Sachen erledigen kannst, wie willst du dann jemals so gut wie ich werden?!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(83, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(2760, "all", "<", 15));
talkEntry:addCondition(npc.base.condition.item.item(48, "all", "<", 10));
talkEntry:addCondition(npc.base.condition.item.item(53, "all", "<", 10));
talkEntry:addCondition(npc.base.condition.item.item(364, "all", "<", 5));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Gather the rest of the things I asked for. How to become a tailor without solving the simplest tasks?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(83, "=", 8));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Now it's your turn. I teached you enough. Trie to work on your own from now on and become a great tailor.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(83, "=", 8));
talkEntry:addResponse("Jetzt liegt alles an dir, ich hab dir genug gezeigt. Wenn wirklich was aus dir werden soll, versuch von nun an alleine auszukommen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(83, "=", 8));
talkEntry:addResponse("Now it's your turn. I teached you enough. Trie to work on your own from now on and become a great tailor.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(83, "=", 8));
talkEntry:addResponse("Jetzt liegt alles an dir, ich hab dir genug gezeigt. Wenn wirklich was aus dir werden soll, versuch von nun an alleine auszukommen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("I'm tailoress, thats what I am good in.");
talkEntry:addResponse("I work with cloth. Several colours and also leather, so I'm a tailoress.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Beruf");
talkEntry:addResponse("Ich bin Schneiderin, das kann ich am besten.");
talkEntry:addResponse("Ich arbeite gerne mit Stoffen in den verschiedensten Farben und auch mit Leder, daher bin ich eine Schneiderin.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I'm tailoress, thats what I am good in.");
talkEntry:addResponse("I work with cloth. Several colours and also leather, so I'm a tailoress.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Ich bin Schneiderin, das kann ich am besten.");
talkEntry:addResponse("Ich arbeite gerne mit Stoffen in den verschiedensten Farben und auch mit Leder, daher bin ich eine Schneiderin.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("where am");
talkEntry:addResponse("You are in Runewick. This is the marketplace.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("where are we");
talkEntry:addResponse("You are In Runewick. This is the marketplace.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("wo bin");
talkEntry:addResponse("Ihr sei din Runewick, am Marktplatz.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("wo sind");
talkEntry:addResponse("Ihr sei din Runewick, am Marktplatz.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("YOURTRIGGER1");
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("YOURTRIGGER2");
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("YOURTRIGGER3");
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("YOURTRIGGER4");
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("YOURTRIGGER5");
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("DEINTRIGGER1");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("DEINTRIGGER2");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("DEINTRIGGER3");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("DEINTRIGGER4");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("DEINTRIGGER5");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Queen");
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königin");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkamar");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("That's far, far in the southwest.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkamar");
talkEntry:addResponse("Das ist weit, weit im Südwesten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("That is far to the west.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("Das ist weit im Westen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gynk");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Far in the south. A dirty harbor with djungle, swamp, mosquitos and crocodiles!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gynk");
talkEntry:addResponse("Weit im Süden. Ein dreckiger Hafen mit viel Dschungel, Sumpf, Mücken und Krokodilen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("There are several gods people believe in. Different races have different beliefs.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ushara");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("That's one of the elven gods, the god of earth i believe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Br[áàa]gon");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("A fire-god. Ask an elf about these.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eldan");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("An ancient elven god of the mind.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tanora");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I know that one. it's the Lizard goddess, they call her 'Zelphia' ! She's the goddess of the sea. Sailors pray to her too.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zelphia");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("That's the Lizard name for Tanora, goddess of water.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Findari");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("An ancient wind goddess.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Narg[úùu]n");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("The gambler, the jester, the two-faced god of insanity and sanity? Hmh.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elara");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("That's the goddess of Wisdom!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Adron");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("He is the god of wine and festivities.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oldra");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Goddess of fertility and harvesting!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("The Grey Lady brings the spirits of the dead to where they belong, and takes care that their rotting bodies rest in peace. And stay in their coffins!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachin");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("The green hunter, god of forests, hunt, bravery, battle and strength. Many noble Knights and Paladins pray to Malachin.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("The Lord of trade and craftsmenship! He is the main god of the dwarves.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sirani");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Goddess of Love and trust.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zhambra");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("The god of friendship, bravery and loyality. Usually the Patron of Paladins. He's one of the main gods in Salkamar.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ronagan");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("The God of Shadows, stealth and trickery. Patron of every thieve's guild, or even assassins, if there is any.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Moshran");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("PSSSHHH! Are you insane ? Don't say that name aloud ! You might attract his wrath ! We call him the bone lord.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("bone lord");
talkEntry:addResponse("The god of slaughter, rage, bloody revenge and war.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("blood god");
talkEntry:addResponse("The god of slaughter, rage, bloody revenge and war.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("bjolmur");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("The whispering darkness... One of the three evil demigods created by the bone lord. A mere curse to the world, it is said that her mouth never lost a single true word.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("cherass");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("The undead king - the worst lich ever. He's one of the three evil demigods created by the bone lord.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("drargorog");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("The third evil demigod. He's the reaver of meat. Demons, twisted black dragons... Insane, evil warriors are said to... no, let us change the theme.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Es gibt verschiedene Götter, an die die Leute glauben. Verschiedene Völker verehren verschiedene Götter.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("Eine der Elfischen Götter, Erde glaub'ich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Br[áàa]gon");
talkEntry:addResponse("Ein Feuergott. Fraget einen Elben danach!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eldan");
talkEntry:addResponse("Ein uralter elbischer Gott des Geistes.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tanora");
talkEntry:addResponse("Den Namen kenne ich. Das ist die Echsen-Göttin, sie nennen sie Zelphia! Sie ist die Göttin des Meeres. Seeleute verehren sie ebenfalls.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("Das ist der Echsen-Name für Tanora, die Göttin des Wassers.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Findari");
talkEntry:addResponse("Eine uralte Wind-Göttin.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Narg[úùu]n");
talkEntry:addResponse("Der Spieler, der Narr, der zweigesichtige Gott des Sinns und des Wahnsinns ? Hmh.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elara");
talkEntry:addResponse("Das ist die Göttin der Weisheit!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Adron");
talkEntry:addResponse("Er ist der Gott des Weines und des Feierns.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("Göttin der Fruchtbarkeit und der Ernte!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addResponse("Die graue Dame bringt die Geister der Toten dahin, wo sie hingehören und sorgt dafür, daß ihre verfaulenden gebeine in Frieden Ruhen - und in ihren Särgen bleiben !");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachin");
talkEntry:addResponse("Der grüne Jäger, Gott der Wälder, der Jagd, des Kampfes, des Mutes und der Stärke. Viele noble Ritter und Paladine beten zu Malachin.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("Der Herr des Handels und des Handwerks! Er ist der Hauptgott des Zwergenvolkes.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("Die Göttin der Liebe und des Vertrauens.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zhambra");
talkEntry:addResponse("Der Gott der Freundschaft, der Tapferkeit und der Loyalität. Üblicherweise der Patron von Paladinen. Er ist einer der Hauptgötter in Salkamar.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("Der Gott der Schatten, der Heimlichkeit und der Tricks. Schutzherr jeder Diebesgilde, falls es sowas gibt. Oder von Assassinen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Moshran");
talkEntry:addResponse("PSSSSST ! Seid ihr des Wahnsinns! Sprecht diesen Namen nicht laut. Ihr werdet seinen Zorn heraufbeschwören! Wir nennen ihn den Knochenlord.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("knochenlord");
talkEntry:addResponse("Der Gott des Schlachtens, der Raserei, der blutigen Rache und des Krieges.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("blutgott");
talkEntry:addResponse("Der Gott des Schlachtens, der Raserei, der blutigen Rache und des Krieges.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("bjolmur");
talkEntry:addResponse("Die flüsternde Finsternis... Eine der drei bösen Halbgötter, die der Blutgott schuf.Ein Fluch für die Welt, es heißt daß noch nie auch nur ein einziges wahres Wort über ihre Lippen gekommen sei!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("cherass");
talkEntry:addResponse("Der untote König - der schlimmste Lich, den es je gab. Er ist einer der drei bösartigen Halbgötter, die der Knochenlord erschuf.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("drargorog");
talkEntry:addResponse("Der dritte böse Halbgott. Er ist der Reißer des Fleisches. Dämonen, rasende schwarze Drachen... Es heißt daß irre, böse Krieger... nein, lasst uns das Thema wechseln.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("I do not trade, all at all. Ask some other one.");
talkEntry:addResponse("No, I cant help you. Actually I doesn't look like a merchant.");
talkEntry:addResponse("By trading I got a headache. So I don't buy and sell anything.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Ich handle mit nichts, frag jemand anderen.");
talkEntry:addResponse("Nein, da kann ich dir nicht weiterhelfen. Ich sehe doch auch garnicht wie eine Händlerin aus!");
talkEntry:addResponse("Vom handeln krieg ich nur Kopfschmerzen, also kauf- und verkaufe ich auch nichts.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("I could tell a lot about sewing. But right now, I don't feel like doing that.");
talkEntry:addResponse("If you are willing to help me with some tasks, I woul dbe glad to tell you about sewing. Just ask me for!");
talkEntry:addResponse("No, no, no! I dilike telling you something. All the time people arive and ask for telling me something.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Über das Schneidern, darüber könnte ich dir einiges erzählen, aber gerade habe ich keine Lust.");
talkEntry:addResponse("Wenn du mir bei einigen Aufgaben hilfst, erzähl ich dir gerne dies und das über das Schneidern, musst mich nur nach einem Auftrag fragen.");
talkEntry:addResponse("Nein, ich will jetzt nichts erzählen. Ständig kommen Leute her und wollen das ich ihnen etwas erzähle, will ich aber nicht!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Aresilia");
talkEntry:addTrigger("Teleri");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Aresilia");
talkEntry:addTrigger("Teleri");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("How great. Hush hush!");
talkEntry:addResponse("Great. you are a big help.");
talkEntry:addResponse("Awesome!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("Toll, dann auf auf!");
talkEntry:addResponse("Wunderbar, du bist mir eine große Hile");
talkEntry:addResponse("Ausgezeichnet!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("How sad.");
talkEntry:addResponse("Why not? What could be such important?");
talkEntry:addResponse("No? waht shoul dthat mean? First you ask for a task... an then you are not willing to help, tzk, tzk, tzk.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("Zu schade, aber da kann man nichts machen.");
talkEntry:addResponse("Wieso denn nicht, hast du etwas besseres zu tun?!");
talkEntry:addResponse("Wie nein, erstmal nach Arbeit fragen und dann nicht wollen, tzk, tzk, tzk.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me nimmt ein Tuch zur Hand und wischt sich etwas Blut von der Fingerspitze weg.", "#me takes a rag and catches a drop of blood from her finger.");
talkingNPC:addCycleText("#me streicht ihre Robe glatt.", "#me brunishes her robe.");
talkingNPC:addCycleText("#me pustet einige Haarsträhnen aus ihrem Gesicht.", "#me puffs some strand of hair out of her face.");
talkingNPC:addCycleText("#me schaut sich gelangweilt um.", "#me haves a bored look to the surrounding area.");
talkingNPC:addCycleText("#me kichert leise, als sie die Wolken am Himmel beobachtet.", "#me giggles quietly during glancing the fluffy clouds in to the sky.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(1);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Das ist ein NPC dessen Entwickler zu faul war eine Beschreibung einzutragen.", "This is an NPC who's developer was too lazy to type in a description.");
mainNPC:setUseMessage("Fass mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut dich verwirrt an.", "#me looks at you confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 847);
mainNPC:setEquipment(11, 0);
mainNPC:setEquipment(5, 0);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 0);
mainNPC:setEquipment(9, 827);
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

--------------------------------------------------------------------------------
-- NPC Name: Lilith Needlehand                                       Runewick --
-- NPC Job:  Tailor                                                           --
--                                                                            --
-- NPC Race: halfling                   NPC Position:  893, 756, 0            --
-- NPC Sex:  female                     NPC Direction: south                  --
--                                                                            --
-- Author:   Estralis Seborian                                                --
--                                                       easyNPC Parser v1.21 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (2, 893, 756, 0, 4, 'Lilith Needlehand', 'npc.lilith_needlehand', 1, 2, 0, 171, 73, 5, 237, 193, 151);
---]]

require("npc.base.basic")
require("npc.base.condition.item")
require("npc.base.condition.language")
require("npc.base.condition.quest")
require("npc.base.condition.skill")
require("npc.base.condition.town")
require("npc.base.consequence.deleteitem")
require("npc.base.consequence.inform")
require("npc.base.consequence.item")
require("npc.base.consequence.quest")
require("npc.base.consequence.rankpoints")
require("npc.base.consequence.skill")
require("npc.base.talk")
module("npc.lilith_needlehand", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is the tailor Lilith and may need help in a task. Keywords: Hello, Quest, Needle, Tailor."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist die Schneiderin Lilith. Sie könnte Hilfe bei einer Aufgabe gebrauchen. Schlüsselwörter: Hallo, Quest, Nadel, Schneider."));
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
talkEntry:addTrigger("Good night");
talkEntry:addResponse("Hiho! You must have come to help me!");
talkEntry:addResponse("Oh my, hello there! You are here to assist me, I assume?");
talkEntry:addResponse("#me gives a charming smile: 'Are you here to help me?'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Grüß");
talkEntry:addTrigger("Gruß");
talkEntry:addTrigger("Guten Morgen");
talkEntry:addTrigger("Guten Tag");
talkEntry:addTrigger("Guten Abend");
talkEntry:addTrigger("Gute Nacht");
talkEntry:addTrigger("Mahlzeit");
talkEntry:addTrigger("Tach");
talkEntry:addTrigger("Moin");
talkEntry:addTrigger("Mohltied");
talkEntry:addResponse("Hiho! Du bist sicher hier, um mir zu helfen!");
talkEntry:addResponse("Oh, hallo!");
talkEntry:addResponse("#me lächelt freundlich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Hiho! You must have come to help me!");
talkEntry:addResponse("Oh my, hello there! You are here to assist me, I assume?");
talkEntry:addResponse("#me gives a charming smile: 'Are you here to help me?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Hiho! Du bist sicher hier, um mir zu helfen!");
talkEntry:addResponse("Oh, hallo! Du kannst mir bestimmt helfen.");
talkEntry:addResponse("#me lächelt freundlich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("#me waves excitedly.");
talkEntry:addResponse("Good Bye!");
talkEntry:addResponse("Come back soon and maybe we can have some cake!");
talkEntry:addResponse("#me turns back to the sheep, saying over her shoulder 'Farewell' as she pets one.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("#me winkt freudig zum Abschied.");
talkEntry:addResponse("Auf wiedersehen!");
talkEntry:addResponse("Komm bald zurück und dann essen wir Kuchen!");
talkEntry:addResponse("#me wendet sich wieder den Schafen zu.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("#me waves excitedly.");
talkEntry:addResponse("Good Bye!");
talkEntry:addResponse("Come back soon and maybe we can have some cake!");
talkEntry:addResponse("#me turns back to the sheep, saying over her shoulder 'Farewell' as she pets one.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("#me winkt freudig zum Abschied.");
talkEntry:addResponse("Auf wiedersehen!");
talkEntry:addResponse("Komm bald zurück und dann essen wir Kuchen!");
talkEntry:addResponse("#me wendet sich wieder den Schafen zu.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("I'm in a hurry! The archmage ordered a robe and I didn't finish it yet.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addResponse("Ich bin in Eile. Der Erzmagier hat eine Robe bestellt und ich habe sie noch nicht fertig.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("My name is Lilith Needlehand, and I am a tailor, and it is a pleasure to meet you!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ihr name");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Mein Name ist Lilith Needlehand und ich bin eine Schneiderin. Es ist schön, deine Bekanntschaft zu machen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(73, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] The Lazy Tailoress I"));
talkEntry:addResponse("I could use some help tailoring a robe for the Archmage! Could you help? If so please get me twenty pieces of wool, I am short on that.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(73, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(73, "=", 0));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Das faule Schneiderlein I"));
talkEntry:addResponse("Ich könnte etwas Hilfe gebrauchen, um eine Robe für den Erzmagier zu schneidern. Bring mir doch bitte zwanzig Wollballen, ich habe keine mehr.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(73, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(73, "=", 0));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] The Lazy Tailoress I"));
talkEntry:addResponse("I could use some help tailoring a robe for the Archmage! Could you help? If so please get me twenty pieces of wool, I am short on that.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(73, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(73, "=", 0));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Das faule Schneiderlein I"));
talkEntry:addResponse("Ich könnte etwas Hilfe gebrauchen, um eine Robe für den Erzmagier zu schneidern. Bring mir doch bitte zwanzig Wollballen, ich habe keine mehr.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(73, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.tailoring, "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(73, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(170, "all", ">", 19, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded a needle and your tailoring skill increases. You advance in Archmage Elvaine Morgan's favour."));
talkEntry:addResponse("Why thank you! I don't have a real reward for you, but you can have my spare needle.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.tailoring, "+", 1));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(170, 20, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(47, 1, 999, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(73, "=", 2));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(73, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(170, "all", ">", 19, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded a needle. You advance in Archmage Elvaine Morgan's favour."));
talkEntry:addResponse("Why thank you! I don't have a real reward for you, but you can have my spare needle.");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(170, 20, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(47, 1, 999, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(73, "=", 2));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.tailoring, "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(73, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(170, "all", ">", 19, nil));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst eine Nadel und deine Schneidereifähigkeit steigt. Dein Ansehen bei Erzmagier Elvaine Morgan steigt."));
talkEntry:addResponse("Oh, danke! Ich habe keine Belohnung für dich, aber du kannst meine Ersatznadel haben.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.tailoring, "+", 1));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(170, 20, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(47, 1, 999, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(73, "=", 2));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(73, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(170, "all", ">", 19, nil));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst eine Nadel. Dein Ansehen bei Erzmagier Elvaine Morgan steigt."));
talkEntry:addResponse("Oh, danke! Ich habe keine Belohnung für dich, aber du kannst meine Ersatznadel haben.");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(170, 20, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(47, 1, 999, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(73, "=", 2));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.tailoring, "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(73, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(170, "all", ">", 19, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded a needle and your tailoring skill increases."));
talkEntry:addResponse("Why thank you! I don't have a real reward for you, but you can have my spare needle.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.tailoring, "+", 1));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(170, 20, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(47, 1, 999, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(73, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(73, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(170, "all", ">", 19, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded a needle."));
talkEntry:addResponse("Why thank you! I don't have a real reward for you, but you can have my spare needle.");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(170, 20, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(47, 1, 999, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(73, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.tailoring, "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(73, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(170, "all", ">", 19, nil));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst eine Nadel und deine Schneidereifähigkeit steigt."));
talkEntry:addResponse("Oh, danke! Ich habe keine Belohnung für dich, aber du kannst meine Ersatznadel haben.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.tailoring, "+", 1));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(170, 20, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(47, 1, 999, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(73, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(73, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(170, "all", ">", 19, nil));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst eine Nadel."));
talkEntry:addResponse("Oh, danke! Ich habe keine Belohnung für dich, aber du kannst meine Ersatznadel haben.");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(170, 20, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(47, 1, 999, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(73, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(73, "=", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Did you forget? I need twenty bundles of wool! Oh please, I need to finish this robe for the Archmage in time.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(73, "=", 1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Hast du es schon vergessen? Ich brauche zwanzig Wollballen. Bitte, ich muss die Robe für den Erzmagier rechtzeitig fertig kriegen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(73, "=", 1));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("Did you forget? I need twenty bundles of wool! Oh please, I need to finish this robe for the Archmage in time.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(73, "=", 1));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Hast du es schon vergessen? Ich brauche zwanzig Wollballen. Bitte, ich muss die Robe für den Erzmagier rechtzeitig fertig kriegen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(73, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] The Lazy Tailoress II"));
talkEntry:addResponse("Oh, you want to help me some more? Well, I certainly need some thread for the robe. Bring me fifteen bobbins of thread, please.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(73, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(73, "=", 2));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Das faule Schneiderlein II"));
talkEntry:addResponse("Oh, du willst mir noch mehr helfen? Nun, ich werde sicherlich einiges an Garn für die Robe brauchen. Bring mir doch bitte fünfzehn Spulen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(73, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(73, "=", 2));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] The Lazy Tailoress II"));
talkEntry:addResponse("Oh, you want to help me some more? Well, I certainly need some thread for the robe. Bring me fifteen bobbins of thread, please.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(73, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(73, "=", 2));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Das faule Schneiderlein II"));
talkEntry:addResponse("Oh, du willst mir noch mehr helfen? Nun, ich werde sicherlich einiges an Garn für die Robe brauchen. Bring mir doch bitte fünfzehn Spulen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(73, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.tailoring, "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(73, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(50, "all", ">", 14, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded a blue dress and your tailoring skill increases. You advance in Archmage Elvaine Morgan's favour."));
talkEntry:addResponse("Ah, thank you so much! I appreciate this greatly, I hope you accept this dress as compensation.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.tailoring, "+", 1));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(50, 15, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(385, 1, 999, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(73, "=", 4));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 10));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(73, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(50, "all", ">", 14, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded a blue dress. You advance in Archmage Elvaine Morgan's favour."));
talkEntry:addResponse("Ah, thank you so much! I appreciate this greatly, I hope you accept this dress as compensation.");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(50, 15, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(385, 1, 999, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(73, "=", 4));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 10));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.tailoring, "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(73, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(50, "all", ">", 14, nil));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst ein blaues Kleid und deine Schneidereifähigkeit steigt. Dein Ansehen bei Erzmagier Elvaine Morgan steigt."));
talkEntry:addResponse("Ah, vielen lieben Dank. Ich weiß das zu schätzen und hoffe, du aktzeptierst dieses Kleid als Zeichen meines Anerkennung.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.tailoring, "+", 1));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(50, 15, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(385, 1, 999, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(73, "=", 4));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 10));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(73, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(50, "all", ">", 14, nil));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst ein blaues Kleid. Dein Ansehen bei Erzmagier Elvaine Morgan steigt."));
talkEntry:addResponse("Ah, vielen lieben Dank. Ich weiß das zu schätzen und hoffe, du aktzeptierst dieses Kleid als Zeichen meines Anerkennung.");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(50, 15, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(385, 1, 999, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(73, "=", 4));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 10));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.tailoring, "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(73, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(50, "all", ">", 14, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded a blue dress and your tailoring skill increases."));
talkEntry:addResponse("Ah, thank you so much! I appreciate this greatly, I hope you accept this dress as compensation.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.tailoring, "+", 1));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(50, 15, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(385, 1, 999, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(73, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(73, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(50, "all", ">", 14, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded a blue dress."));
talkEntry:addResponse("Ah, thank you so much! I appreciate this greatly, I hope you accept this dress as compensation.");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(50, 15, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(385, 1, 999, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(73, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.tailoring, "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(73, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(50, "all", ">", 14, nil));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst ein blaues Kleid und deine Schneidereifähigkeit steigt."));
talkEntry:addResponse("Ah, vielen lieben Dank. Ich weiß das zu schätzen und hoffe, du aktzeptierst dieses Kleid als Zeichen meines Anerkennung.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.tailoring, "+", 1));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(50, 15, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(385, 1, 999, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(73, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(73, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(50, "all", ">", 14, nil));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst ein blaues Kleid."));
talkEntry:addResponse("Ah, vielen lieben Dank. Ich weiß das zu schätzen und hoffe, du aktzeptierst dieses Kleid als Zeichen meines Anerkennung.");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(50, 15, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(385, 1, 999, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(73, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(73, "=", 3));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Thread, thread, my dear, I lack thread and you don't have enough!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(73, "=", 3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Garn, Garn, ohje, mir ist das Garn ausgegangen und du hast auch nicht genug!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(73, "=", 3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("Thread, thread, my dear, I lack thread and you don't have enough!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(73, "=", 3));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Garn, Garn, ohje, mir ist das Garn ausgegangen und du hast auch nicht genug!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(73, "=", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] The Lazy Tailoress III"));
talkEntry:addResponse("I'm short on red cloth, but I need some for the robe I'm making for Archmage Elvaine Morgan. Can you please get me five panels?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(73, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(73, "=", 4));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Das faule Schneiderlein III"));
talkEntry:addResponse("Mir ist der rote Stoff ausgegangen! Den brauch ich aber für die Robe für Elvaine Morgan. Bringst du mir fünf Bahnen, bitte?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(73, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(73, "=", 4));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] The Lazy Tailoress III"));
talkEntry:addResponse("I'm short on red cloth, but I need some for the robe I'm making for Archmage Elvaine Morgan. Can you please get me five panels?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(73, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(73, "=", 4));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Das faule Schneiderlein III"));
talkEntry:addResponse("Mir ist der rote Stoff ausgegangen! Den brauch ich aber für die Robe für Elvaine Morgan. Bringst du mir fünf Bahnen, bitte");
talkEntry:addConsequence(npc.base.consequence.quest.quest(73, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.tailoring, "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(73, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(174, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded a master mage robe and your tailoring skill increases. You advance in Archmage Elvaine Morgan's favour."));
talkEntry:addResponse("Thank you, that is exactly what I needed! Now I can finish the robe for Archmage Morgan. Here, take my last attempt he sent it back it was too tight for him.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.tailoring, "+", 1));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(174, 5, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(558, 1, 999, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(73, "=", 6));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(73, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(174, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded a master mage robe. You advance in Archmage Elvaine Morgan's favour."));
talkEntry:addResponse("Thank you, that is exactly what I needed! Now I can finish the robe for Archmage Morgan. Here, take my last attempt he sent it back it was too tight for him.");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(174, 5, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(558, 1, 999, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(73, "=", 6));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.tailoring, "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(73, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(174, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst eine Meistermagierrobe und deine Schneidereifähigkeit steigt. Dein Ansehen bei Erzmagier Elvaine Morgan steigt."));
talkEntry:addResponse("Danke, genau, was ich gebraucht habe! Nun kann ich die Robe für den Erzmagier Morgan fertigstellen. Hier, dies war mein letzter Versuch, er hat sie zurückgeschickt, sie war ihm zu eng.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.tailoring, "+", 1));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(174, 5, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(558, 1, 999, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(73, "=", 6));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(73, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(174, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst eine Meistermagierrobe. Dein Ansehen bei Erzmagier Elvaine Morgan steigt."));
talkEntry:addResponse("Danke, genau, was ich gebraucht habe! Nun kann ich die Robe für den Erzmagier Morgan fertigstellen. Hier, dies war mein letzter Versuch, er hat sie zurückgeschickt, sie war ihm zu eng.");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(174, 5, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(558, 1, 999, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(73, "=", 6));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.tailoring, "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(73, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(174, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded a master mage robe and your tailoring skill increases."));
talkEntry:addResponse("Thank you, that is exactly what I needed! Now I can finish the robe for Archmage Morgan. Here, take my last attempt he sent it back it was too tight for him.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.tailoring, "+", 1));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(174, 5, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(558, 1, 999, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(73, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(73, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(174, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded a master mage robe."));
talkEntry:addResponse("Thank you, that is exactly what I needed! Now I can finish the robe for Archmage Morgan. Here, take my last attempt he sent it back it was too tight for him.");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(174, 5, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(558, 1, 999, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(73, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.tailoring, "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(73, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(174, "all", ">", 4, nil));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst eine Meistermagierrobe und deine Schneidereifähigkeit steigt."));
talkEntry:addResponse("Danke, genau, was ich gebraucht habe! Nun kann ich die Robe für den Erzmagier Morgan fertigstellen. Hier, dies war mein letzter Versuch, er hat sie zurückgeschickt, sie war ihm zu eng.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.tailoring, "+", 1));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(174, 5, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(558, 1, 999, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(73, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(73, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(174, "all", ">", 4, nil));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst eine Meistermagierrobe."));
talkEntry:addResponse("Danke, genau, was ich gebraucht habe! Nun kann ich die Robe für den Erzmagier Morgan fertigstellen. Hier, dies war mein letzter Versuch, er hat sie zurückgeschickt, sie war ihm zu eng.");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(174, 5, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(558, 1, 999, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(73, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(73, "=", 5));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Hrm... I need a little more red cloth. Otherwise, I cannot finish the robe for Archmage Morgan.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(73, "=", 5));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Uhm... ich brauche mehr roten Stoff. Anderenfalls kann ich die Robe für den Erzmagier Morgan nicht fertigstellen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(73, "=", 5));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("Hrm... I need a little more red cloth. Otherwise, I cannot finish the robe for Archmage Morgan.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(73, "=", 5));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Uhm... ich brauche mehr roten Stoff. Anderenfalls kann ich die Robe für den Erzmagier Morgan nicht fertigstellen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(73, "=", 6));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("I don't need anything else, but thank you! You saved the day!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(73, "=", 6));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Ich brauche nichts weiter, aber danke nochmal! Du hast mir ganz schön aus der Patsche geholfen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(73, "=", 6));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("I don't need anything else, but thank you! You saved the day!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(73, "=", 6));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Ich brauche nichts weiter, aber danke nochmal! Du hast mir ganz schön aus der Patsche geholfen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("As a tailor, I use wool, thread, and dye to create clothes. Some people only wear armor, but for a fancy evening nothing beats a fancy robe or dress.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Als Schneiderin mache ich Kleidung aus Wolle, Garn und Färbemittel. Einige Leute tragen den ganzen Tag ihre Rüstung, aber für einen schönen Abend gibt es nichts feineres als ein tolles Kleid.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("As a tailor, I use wool, thread, and dye to create clothes. Some people only wear armor, but for a fancy evening nothing beats a fancy robe or dress.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Als Schneiderin mache ich Kleidung aus Wolle, Garn und Färbemittel. Einige Leute tragen den ganzen Tag ihre Rüstung, aber für einen schönen Abend gibt es nichts feineres als ein tolles Kleid.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Oh, what was that for a funny word? Grobi-at?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Oh, was war das denn für ein lustiges Wort? Grobi-at?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("Hui! How exciting to meet you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Hui! Wie toll, dich kennenzulernen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tailor");
talkEntry:addResponse("As a tailor, I use wool, thread, and dye to create clothes. Some people only wear armor, but for a fancy evening nothing beats a fancy robe or dress.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Schneider");
talkEntry:addResponse("Als Schneiderin mache ich Kleidung aus Wolle, Garn und Färbemittel. Einige Leute tragen den ganzen Tag ihre Rüstung, aber für einen schönen Abend gibt es nichts feineres als ein tolles Kleid.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("order");
talkEntry:addResponse("Oh dear, the Archmage ordered a new robe. I totally forgot working on it! Maybe you can help me with this task.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bestellung");
talkEntry:addResponse("Ohje, der Erzmagier hat eine neue Robe bestellt. Ich hab vollkommen vergessen, daran zu arbeiten. Vielleicht kannst du mir mit dieser Aufgabe helfen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("robe");
talkEntry:addResponse("Oh dear, the Archmage ordered a new robe. I totally forgot working on it! Maybe you can help me with this task.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Robe");
talkEntry:addResponse("Ohje, der Erzmagier hat eine neue Robe bestellt. Ich hab vollkommen vergessen, daran zu arbeiten. Vielleicht kannst du mir mit dieser Aufgabe helfen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("needle");
talkEntry:addResponse("I use my needle to make clothes.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nadel");
talkEntry:addResponse("Mit meiner Nadel nähe ich Kleidung.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("scissors");
talkEntry:addResponse("To get scissors, I strongly suggest you talk to a smith, or you may purchase them from the nearby shop, I believe!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Schere");
talkEntry:addResponse("Wenn du eine Schere brauchst, geh doch zu einem Schmied oder frag im Laden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addResponse("Archmage Morgan, yes, I think he ordered a new robe. I should work on it!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Erzmagier Morgan, ja, der hat eine neue Robe bei mir bestellt. Ich sollte besser mal an ihr arbeiten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Archmage Morgan, yes, I think he ordered a new robe. I should work on it!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Erzmagier Morgan, ja, der hat eine neue Robe bei mir bestellt. Ich sollte besser mal an ihr arbeiten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("This is Runewick! I personally enjoy it here.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Dies hier ist Runewick. Mir gefällt es hier.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Ui, they have no law in Galmair, but everyone knows the Don is the boss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Ui, es gibt kein Gesetz in Galmair, aber jeder weiß, dass der Don der Boss ist.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Galmair is funny. I used to live there, but here, it is more pleasant.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Galmair ist echt komisch. Ich hab da früher mal gelebt, aber hier ist es schöner.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Queen");
talkEntry:addResponse("A woman rules Cadomyr. That is so funny!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königin");
talkEntry:addResponse("Eine Frau regiert Cadomyr. Das ist so lustig!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("A woman rules Cadomyr. That is so funny!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Eine Frau regiert Cadomyr. Das ist so lustig!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Cadomyr is far away, somewhere in the west I think. They don't like women there, but are ruled by a queen. Strange, eh?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Cadomyr ist weit weg, irgendwo im Westen meine ich. Die mögen keine Frauen da, aber trotzdem regiert da eine Königin. Komisch, oder?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("albar");
talkEntry:addResponse("They are mad, those albarians.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("Die spinnen, die Albarier.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addResponse("My aunt lives near Gynk. I always write her a letter, each month.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("Meine Tante lebt bei Gynk. Ich schreibe ihr jeden Monat einen Brief.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("salkama");
talkEntry:addResponse("The Archmage talks a lot about Salkamar, I know nothing about that.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Der Erzmagier redet viel über Salkamar, ich weiß da nichts drüber.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("Irmorom is the best god to worship for a tailor, believe me!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Irmorom ist der beste Gott für einen Schneiderin. Glaube mir!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("Irmorom guides my needle. Sometimes, he's angry and I sting myself.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("Irmorom führt meine Nadel. Manchmal ist er böse auf mich und dann picks ich mich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addTrigger("Moshran");
talkEntry:addResponse("Eeek!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Lilith");
talkEntry:addTrigger("Needlehand");
talkEntry:addResponse("That's me! Lilith! Do you like my name?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Lilith");
talkEntry:addTrigger("Needlehand");
talkEntry:addResponse("Lilith, das bin ich! Magst du meinen Namen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("I am not currently selling or buying anything. I need to finish an order first.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Ich kaufe oder verkaufe derzeit nichts. Ich muss erstmal eine Bestellung fertig bekommen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("Hrm? I don't know what you are talking about. Do you expect me to gossip like an old halfling woman?!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Hrm? Worüber sprichst du? Soll ich dir dummes Zeug erzählen wie ein Waschweib?");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me summt ein Liedchen.", "#me hums a sweet song.");
talkingNPC:addCycleText("#me schaut zum Himmel und murmelt: 'Fast schon Zeit für ein Stück Kuchen.'", "#me looks at the sky, and mumbles: 'Nearly time for pie...'");
talkingNPC:addCycleText("#me streichelt ein Schaf.", "#me pats a sheep.");
talkingNPC:addCycleText("Oh, ist schon wieder Essenszeit?", "Oh, is it nearly time to eat again?");
talkingNPC:addCycleText("Hallo da drüben!", "Hello over there!");
talkingNPC:addCycleText("#me kichert freudig.", "#me giggles.");
talkingNPC:addCycleText("Ohje, ich muss fertig werden.", "Oh, I have to get things done.");
talkingNPC:addCycleText("#me gähnt: 'So viel zu tun und so wenig Süßes zu essen!'.", "#me yawns: 'So much work and so little sweets!'");
talkingNPC:addCycleText("Ich bin hungrig!", "I feel hungry!");
talkingNPC:addCycleText("Bestellungen, Bestellungen, Bestellungen. Warum kauft nicht einfach immer jemand das, was ich gerade fertig habe?", "Order, orders, orders. Why won't they buy what I complete instead?");
mainNPC:addLanguage(0);
mainNPC:addLanguage(5);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Dieser NPC ist die Schneiderin Lilith.", "This NPC is the tailor Lilith.");
mainNPC:setUseMessage("Fass mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut dich verwirrt an.", "#me looks at you clearly confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 801);
mainNPC:setEquipment(11, 0);
mainNPC:setEquipment(5, 0);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 2295);
mainNPC:setEquipment(9, 0);
mainNPC:setEquipment(10, 369);
mainNPC:setAutoIntroduceMode(true);

mainNPC:initDone();
end;

function receiveText(npcChar, texttype, message, speaker) mainNPC:receiveText(npcChar, texttype, speaker, message); end;
function nextCycle(npcChar) mainNPC:nextCycle(npcChar); end;
function lookAtNpc(npcChar, char, mode) mainNPC:lookAt(npcChar, char, mode); end;
function useNPC(npcChar, char) mainNPC:use(npcChar, char); end;
initNpc();
initNpc = nil;
-- END
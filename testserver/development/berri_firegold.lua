--------------------------------------------------------------------------------
-- NPC Name: Berri Firegold                                           Cadomyr --
-- NPC Job:  Smith and Miner                                                  --
--                                                                            --
-- NPC Race: dwarf                      NPC Position:  141, 582, 0            --
-- NPC Sex:  male                       NPC Direction: south                  --
--                                                                            --
-- Author:   Zot                                                              --
--                                                     easyNPC Parser v1.23.1 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (1, 141, 582, 0, 4, 'Berri Firegold', 'npc.berri_firegold', 0, 2, 3, 129, 66, 10, 238, 216, 174);
---]]

require("npc.base.basic")
require("npc.base.condition.item")
require("npc.base.condition.language")
require("npc.base.condition.quest")
require("npc.base.condition.town")
require("npc.base.consequence.deleteitem")
require("npc.base.consequence.inform")
require("npc.base.consequence.item")
require("npc.base.consequence.quest")
require("npc.base.talk")
module("development.berri_firegold", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Berri Firegold the smith. Keywords: quest, mine, smithing, craft"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Berri Firegold der Schmied. Schlüsselwörter: Quest, Mine, schmieden, Handwerk"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hello");
talkEntry:addTrigger("Greet");
talkEntry:addTrigger("Hail");
talkEntry:addTrigger("Good day");
talkEntry:addTrigger("Good morning");
talkEntry:addTrigger("Good Evening");
talkEntry:addResponse("Hello, can I help you?");
talkEntry:addResponse("Nice to meet you, I'm Berri Firegold.");
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
talkEntry:addResponse("Hallo, kann ich Euch helfen?");
talkEntry:addResponse("Freut mich, Euch zu treffen. Ich bin Berri Firegold.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Hello, can I help you?");
talkEntry:addResponse("Nice to meet you, I'm Berri Firegold.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Hallo, kann ich Euch helfen?");
talkEntry:addResponse("Freut mich, Euch zu treffen. Ich bin Berri Firegold");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("I wish you a nice day.");
talkEntry:addResponse("I hope we meet again, goodbye.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addResponse("Ich wünsche Euch noch einen schönen Tag.");
talkEntry:addResponse("Ich hoffe, wir sehen uns wieder. Auf bald!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("I wish you a nice day.");
talkEntry:addResponse("I hope we meet again, goodbye.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Ich wünsche Euch noch einen schönen Tag.");
talkEntry:addResponse("Ich hoffe, wir sehen uns wieder. Auf bald!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("I feel fine, thank you for asking.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befind");
talkEntry:addResponse("Mir geht es gut, danke für die Nachfrage.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("I'm Berri Firegold, who are you?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ihr name");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Ich bin Berri Firegold. Wer bist du?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("I'm a smith of course, maybe I'll have a little task for you later.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Ich bin natürlich ein Schmied. Vielleicht habe ich später eine kleine Aufgabe für Euch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("I'm a smith of course, maybe I'll have a little task for you later.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Ich bin natürlich ein Schmied. Vielleicht habe ich später eine kleine Aufgabe für Euch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("mine");
talkEntry:addResponse("If you leave the town and follow the street to the south you will reach the 'Cornerstone of Candour', you can find coal there. If you leave the town and go northeast you will reach the 'Liberty Quarry', you can find iron and copper ore there, and sometimes even gold nuggets.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger("mine");
talkEntry:addResponse("Wenn Ihr die Stadt verlasst und nach Süden der Straße folgt, erreicht Ihr den 'Grundstein der Aufrichtigkeit'. Dort könnt Ihr Kohle finden. Wenn Ihr die Stadt verlasst und nach Nordosten geht, erreicht Ihr den 'Freiheitsbruch'. Dort findet Ihr Eisen- und Kupfererz und manchmal sogar Goldnuggets.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("smith");
talkEntry:addResponse("If you want to smith you need ingots and a hammer of course. Blacksmiths need a normal hammer, finesmith's need a finesmithing hammer though.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("schmied");
talkEntry:addResponse("Wenn Ihr schmieden wollt, dann braucht Ihr Barren und natürlich einen Hammer. Schmiede benutzen einen gewöhnlichen Hammer. Goldschmiede dagegen brauchen einen Feinschmiedehammer.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("craft");
talkEntry:addResponse("If you need help with smithing, ask me for a task. If you prefer glass blowing or brick making talk with Zlatxhol at the oven over thre. You can ask Lilli Gallfing behind me in the other room if you want to know more about tailoring. If you don't like any of this crafts you can talk with Gerry Deloid, he can teach you the basics about candle making.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger("hand");
talkEntry:addResponse("Wenn Ihr Hilfe beim Schmieden braucht, fragt mich nach einer Aufgabe. Wollt Ihr lieber etwas über das Glasblasen oder Ziegelmachen lernen, dann fragt Zlatxhol da vorne. Liegt Euch das Schneiderhandwerk eher, dann fragt Lilli Gallfing hinter mir im anderen Raum. Falls Ihr jedoch am Kerzenmachen interessiert seid, dann geht durch die Schneiderei hinaus und sprecht Gerry Deloid an.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(703, "=", 1));
talkEntry:addCondition(npc.base.condition.quest.quest(704, ">", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("jakob");
talkEntry:addTrigger("lindorn");
talkEntry:addConsequence(npc.base.consequence.quest.quest(703, "=", 2));
talkEntry:addResponse("Ah Jakob send you but you already asked me for something to do. If you want to learn more about glass blowing or brick making talk with Zlatxhol at the oven over there. You can ask Lilli Gallfing behind me in the other room if you want to know more about tailoring. If you don't like any of these crafts you can talk to Gerry Deloid, he can teach you the basics of candle making.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(704, ">", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(703, "=", 1));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("jakob");
talkEntry:addTrigger("lindorn");
talkEntry:addConsequence(npc.base.consequence.quest.quest(703, "=", 2));
talkEntry:addResponse("Ah Jakob hat Euch geschickt aber Ihr habt mich bereits nach einer Aufgabe gefragt. Wollt Ihr mehr über das Glasblasen oder Ziegelmachen lernen, dann fragt Zlatxhol da vorne. Liegt euch das Schneiderhandwerk eher, dann fragt Lilli Gallfing hinter mir im anderen Raum. Falls Ihr jedoch am Kerzenmachen interessiert seid, dann geht durch die Schneiderei hinaus und sprecht Gerry Deloid an.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(704, ">", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(703, "=", 1));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.quest.quest(703, "=", 2));
talkEntry:addResponse("Ah Jakob send you but you already asked me for something to do. If you want to learn more about glass blowing or brick making talk with Zlatxhol at the oven over there. You can ask Lilli Gallfing behind me in the other room if you want to know more about tailoring. If you don't like any of these crafts you can talk to Gerry Deloid, he can teach you the basics of candle making.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(704, ">", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(703, "=", 1));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.quest.quest(703, "=", 2));
talkEntry:addResponse("Ah Jakob hat Euch geschickt aber Ihr habt mich bereits nach einer Aufgabe gefragt. Wollt Ihr mehr über das Glasblasen oder Ziegelmachen lernen, dann fragt Zlatxhol da vorne. Liegt euch das Schneiderhandwerk eher, dann fragt Lilli Gallfing hinter mir im anderen Raum. Falls Ihr jedoch am Kerzenmachen interessiert seid, dann geht durch die Schneiderei hinaus und sprecht Gerry Deloid an.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(704, "=", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(703, "=", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("jakob");
talkEntry:addTrigger("lindorn");
talkEntry:addConsequence(npc.base.consequence.item.item(2763, 1, 777, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(703, "=", 2));
talkEntry:addConsequence(npc.base.consequence.quest.quest(704, "=", 1));
talkEntry:addResponse("Could you bring me twenty pieces of iron ore from the 'Liberty Quarry' and also twenty lumps of coal from the 'Cornerstone of Candour'? The 'Liberty Quarry' is northeast and the 'Cornerstone of Candour' south as you leave the city. Here's a pick-axe to mine the ore.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(704, "=", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(703, "=", 1));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("jakob");
talkEntry:addTrigger("lindorn");
talkEntry:addConsequence(npc.base.consequence.item.item(2763, 1, 777, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(703, "=", 2));
talkEntry:addConsequence(npc.base.consequence.quest.quest(704, "=", 1));
talkEntry:addResponse("Könntet Ihr mir 20 Eisenerze vom 'Freiheitsbruch' bringen, außerdem noch 20 Klumpen Kohle von der Mine 'Grundstein der Aufrichtigkeit'? Den 'Freiheitsbruch' findet Ihr im Nordosten und den 'Grundstein der Aufrichtigkeit' im Süden, wenn Ihr die Stadt verlasst. Hier habt Ihr eine Spitzhacke, um das Erz zu sammeln.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(704, "=", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(703, "=", 1));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.item.item(2763, 1, 777, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(703, "=", 2));
talkEntry:addConsequence(npc.base.consequence.quest.quest(704, "=", 1));
talkEntry:addResponse("Could you bring me twenty pieces of iron ore from the 'Liberty Quarry' and also twenty lumps of coal from the 'Cornerstone of Candour'? The 'Liberty Quarry' is northeast and the 'Cornerstone of Candour' south as you leave the city. Here's a pick-axe to mine the ore.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(704, "=", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(703, "=", 1));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.item.item(2763, 1, 777, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(703, "=", 2));
talkEntry:addConsequence(npc.base.consequence.quest.quest(704, "=", 1));
talkEntry:addResponse("Könntet Ihr mir 20 Eisenerze vom 'Freiheitsbruch' bringen, außerdem noch 20 Klumpen Kohle von der Mine 'Grundstein der Aufrichtigkeit'? Den 'Freiheitsbruch' findet Ihr im Nordosten und den 'Grundstein der Aufrichtigkeit' im Süden, wenn Ihr die Stadt verlasst. Hier habt Ihr eine Spitzhacke, um das Erz zu sammeln.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(704, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.item.item(2763, 1, 555, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(704, "=", 1));
talkEntry:addResponse("Could you bring me twenty pieces of iron ore from the 'Liberty Quarry' and also twenty lumps of coal from the 'Cornerstone of Candour'? The 'Liberty Quarry' is northeast and the 'Cornerstone of Candour' south as you leave the city. Here's a pick-axe to mine the ore.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(704, "=", 0));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.item.item(2763, 1, 555, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(704, "=", 1));
talkEntry:addResponse("Könntet Ihr mir 20 Eisenerze vom 'Freiheitsbruch' bringen, außerdem noch 20 Klumpen Kohle von der Mine 'Grundstein der Aufrichtigkeit'? Den 'Freiheitsbruch' findet Ihr im Nordosten und den 'Grundstein der Aufrichtigkeit' im Süden, wenn Ihr die Stadt verlasst. Hier habt Ihr eine Spitzhacke, um das Erz zu sammeln.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(704, "=", 0));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.item.item(2763, 1, 555, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(704, "=", 1));
talkEntry:addResponse("Could you bring me twenty pieces of iron ore from the 'Liberty Quarry' and also twenty lumps of coal from the 'Cornerstone of Candour'? The 'Liberty Quarry' is northeast and the 'Cornerstone of Candour' south as you leave the city. Here's a pick-axe to mine the ore.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(704, "=", 0));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.item.item(2763, 1, 555, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(704, "=", 1));
talkEntry:addResponse("Könntet Ihr mir 20 Eisenerze vom 'Freiheitsbruch' bringen, außerdem noch 20 Klumpen Kohle von der Mine 'Grundstein der Aufrichtigkeit'? Den 'Freiheitsbruch' findet Ihr im Nordosten und den 'Grundstein der Aufrichtigkeit' im Süden, wenn Ihr die Stadt verlasst. Hier habt Ihr eine Spitzhacke, um das Erz zu sammeln.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(704, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", ">", 19, nil));
talkEntry:addCondition(npc.base.condition.item.item(22, "all", ">", 19, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("coal");
talkEntry:addTrigger("iron");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(21, 10, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(22, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(704, "=", 2));
talkEntry:addResponse("Well done, thank you. I take ten pieces of ore and ten lumps of coal. You can keep the other ten for your next task.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(704, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", ">", 19, nil));
talkEntry:addCondition(npc.base.condition.item.item(22, "all", ">", 19, nil));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("kohle");
talkEntry:addTrigger("eisen");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(21, 10, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(22, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(704, "=", 2));
talkEntry:addResponse("Gut gemacht, danke. Ich nehme zehn Stück vom Erz und zehn von der Kohle. Den Rest behaltet Ihr für die nächste Aufgabe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(704, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", ">", 19, nil));
talkEntry:addCondition(npc.base.condition.item.item(22, "all", ">", 19, nil));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(21, 10, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(22, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(704, "=", 2));
talkEntry:addResponse("Well done, thank you. I take ten pieces of ore and ten lumps of coal. You can keep the other ten for your next task.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(704, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", ">", 19, nil));
talkEntry:addCondition(npc.base.condition.item.item(22, "all", ">", 19, nil));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(21, 10, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(22, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(704, "=", 2));
talkEntry:addResponse("Gut gemacht, danke. Ich nehme zehn Stück vom Erz und zehn von der Kohle. Den Rest behaltet Ihr für die nächste Aufgabe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(704, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", "<", 20, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".+");
talkEntry:addResponse("That's not everything I was looking for. Did you forget that I told you to bring me twenty pieces of iron ore and twenty lumps of coal?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(704, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", "<", 20, nil));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Da fehlt aber noch etwas. Ich wollte 20 Eisenerze sowie 20 Kohleklumpen von Euch. Habt Ihr das vergessen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(704, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(22, "all", "<", 20, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".+");
talkEntry:addResponse("That's not everything I was looking for. Did you forget that I told you to bring me twenty pieces of iron ore and twenty lumps of coal?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(704, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(22, "all", "<", 20, nil));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Da fehlt aber noch etwas. Ich wollte 20 Eisenerze sowie 20 Kohleklumpen von Euch Habt Ihr das vergessen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(704, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.item.item(2751, 1, 333, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(704, "=", 3));
talkEntry:addResponse("I have another task for you, indeed. Could you smelt me ten iron ingots at the furnace over there? Here I'll even give you the crucible-pincers for smelting the ore.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(704, "=", 2));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.item.item(2751, 1, 333, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(704, "=", 3));
talkEntry:addResponse("Ich hätte einen weitere Aufgabe für Euch, in der Tat. Könntet Ihr mir 10 Eisenbarren bei der Esse dort drüben schmelzen? Hier, ich gebe Euch sogar eine Tiegelzange zum schmelzen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(704, "=", 2));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.item.item(2751, 1, 333, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(704, "=", 3));
talkEntry:addResponse("I have another task for you, indeed. Could you smelt me ten iron ingots at the furnace over there? Here I'll even give you the crucible-pincers for smelting the ore.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(704, "=", 2));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.item.item(2751, 1, 333, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(704, "=", 3));
talkEntry:addResponse("Ich hätte einen weitere Aufgabe für Euch, in der Tat. Könntet Ihr mir 10 Eisenbarren bei der Esse dort drüben schmelzen? Hier, ich gebe Euch sogar eine Tiegelzange zum schmelzen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(704, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2535, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("iron");
talkEntry:addTrigger("ingots");
talkEntry:addConsequence(npc.base.consequence.quest.quest(704, "=", 4));
talkEntry:addResponse("Well done. Please keep the iron ingots for your next task?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(704, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2535, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("eisen");
talkEntry:addTrigger("barren");
talkEntry:addConsequence(npc.base.consequence.quest.quest(704, "=", 4));
talkEntry:addResponse("Gut gemacht. Bitte behaltet die Eisenbarren für Eure nächste Aufgabe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(704, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2535, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.quest.quest(704, "=", 4));
talkEntry:addResponse("Well done. Please keep the iron ingots for your next task?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(704, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2535, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.quest.quest(704, "=", 4));
talkEntry:addResponse("Gut gemacht. Bitte behaltet die Eisenbarren für Eure nächste Aufgabe");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(704, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2535, "all", "<", 10, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".+");
talkEntry:addResponse("That are not ten iron ingots yet. Please come again later when you've finished the task.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(704, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2535, "all", "<", 10, nil));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Das sind noch keine 10 Eisenbarren, die ich von Euch wollte. Kommt wieder, wenn Ihr die Aufgabe erledigt habt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(704, "=", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.item.item(23, 1, 555, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(122, 1, 555, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(704, "=", 5));
talkEntry:addResponse("You want another task? Well alright. Could you smith me five pins and five goblets please? The hammer with the yellow handle is for blacksmithing and the hammer with the red handle is for finesmithing. Here I'll give you one of each kind so you can practise a little bit.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(704, "=", 4));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.item.item(23, 1, 555, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(122, 1, 555, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(704, "=", 5));
talkEntry:addResponse("Ihr wollt noch eine weitere Aufgabe? Nun gut, meinetwegen. Bitte stellt mir 5 Nägel sowie 5 Kelche her. Der Hammer mit dem gelben Griff ist für das Schmieden gedacht. Der mit dem roten Griff für das Feinschmieden. Hier ich gebe Euch jeweils einen zum üben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(704, "=", 4));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.item.item(23, 1, 555, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(122, 1, 555, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(704, "=", 5));
talkEntry:addResponse("You want another task? Well alright. Could you smith me five pins and five goblets please? The hammer with the yellow handle is for blacksmithing and the hammer with the red handle is for finesmithing. Here I'll give you one of each kind so you can practise a little bit.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(704, "=", 4));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.item.item(23, 1, 555, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(122, 1, 555, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(704, "=", 5));
talkEntry:addResponse("Ihr wollt noch eine weitere Aufgabe? Nun gut, meinetwegen. Bitte stellt mir 5 Nägel sowie 5 Kelche her. Der Hammer mit dem gelben Griff ist für das Schmieden gedacht. Der mit dem roten Griff für das Feinschmieden. Hier ich gebe Euch jeweils einen zum üben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(704, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2738, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.item.item(1858, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("pin");
talkEntry:addTrigger("goblet");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2738, 5, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(1858, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(704, "=", 6));
talkEntry:addResponse("Well done, thank you very much. I don't think you need my help any longer, good luck!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(704, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2738, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.item.item(1858, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("nägel");
talkEntry:addTrigger("kelch");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2738, 5, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(1858, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(704, "=", 6));
talkEntry:addResponse("Gut gemacht, vielen Dank. Ich denke, Ihr kommt nun auch ohne meine Hilfe zurecht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(704, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2738, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.item.item(1858, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2738, 5, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(1858, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(704, "=", 6));
talkEntry:addResponse("Well done, thank you very much. I don't think you need my help any longer, good luck!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(704, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2738, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.item.item(1858, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2738, 5, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(1858, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(704, "=", 6));
talkEntry:addResponse("Gut gemacht, vielen Dank. Ich denke, Ihr kommt nun auch ohne meine Hilfe zurecht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(704, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2738, "all", "<", 5, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".+");
talkEntry:addResponse("You haven't solved the task yet. Please come back again if you have five pins and five goblets for me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(704, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2738, "all", "<", 5, nil));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Ihr habt die Aufgabe noch nicht erfüllt, wie ich sehe. Bitte bringt mir 5 Nägel und 5 Kelche.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(704, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(1858, "all", "<", 5, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".+");
talkEntry:addResponse("You haven't solved the task yet. Please come back again if you have five pins and five goblets for me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(704, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(1858, "all", "<", 5, nil));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Ihr habt die Aufgabe noch nicht erfüllt, wie ich sehe. Bitte bringt mir 5 Nägel und 5 Kelche.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(704, "=", 6));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".*");
talkEntry:addResponse("I don't have anything more for you to do. Thank you for the help though!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(704, "=", 6));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Ich habe nichts weiter für Euch zu tun. Aber danke nochmals für Eure Hilfe!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(704, "<", 6));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".*");
talkEntry:addResponse("I could need some help, just ask me for a task.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(704, "<", 6));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Ich könnte etwas Hilfe gebrauchen, fragt mich ruhig nach einer Aufgabe. Ich habe sicher etwas für Euch zu tun.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".*");
talkEntry:addResponse("You are not a citizen of Cadomyr. I don't have anything to do for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Ihr scheint kein Bürger Cadomyr zu sein. Ich habe nichts für Euch zu tun.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me schaut sich gelangweilt um.", "#me looks around bored.");
talkingNPC:addCycleText("#me streicht sich über seinen Bart.", "#me runs a hand over his beard.");
talkingNPC:addCycleText("Wenn Ihr Hilfe beim schmieden braucht, dann fragt nur mich!", "If you need any help smithing, just ask me!");
talkingNPC:addCycleText("#me gähnt verhalten.", "#me yawns restrained.");
talkingNPC:addCycleText("Ein Bier! Bringt mir ein Bier!", "A beer, bring me a beer!");
talkingNPC:addCycleText("#me grummelt.", "#me grumbles.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(2);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("", "");
mainNPC:setUseMessage("Fass mich nicht an!", "Hands off!");
mainNPC:setConfusedMessage("#me schaut dich verwirrt an.", "#me looks at you confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 2390);
mainNPC:setEquipment(11, 2384);
mainNPC:setEquipment(5, 23);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 0);
mainNPC:setEquipment(9, 826);
mainNPC:setEquipment(10, 679);
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
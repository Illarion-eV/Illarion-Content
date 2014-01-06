--[[
Illarion Server

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, either version 3 of the License, or (at your option) any
later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU Affero General Public License for more
details.

You should have received a copy of the GNU Affero General Public License along
with this program.  If not, see <http://www.gnu.org/licenses/>. 
]]
--------------------------------------------------------------------------------
-- NPC Name: Joseph Quatrilla                                         Cadomyr --
-- NPC Job:  Alchemist                                                        --
--                                                                            --
-- NPC Race: human                      NPC Position:  138, 543, 0            --
-- NPC Sex:  male                       NPC Direction: west                   --
--                                                                            --
-- Author:   merung                                                           --
--                                                     easyNPC Parser v1.23.1 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (0, 138, 543, 0, 6, 'Joseph Quatrilla', 'npc.joseph_quatrilla', 0, 2, 0, 221, 199, 140, 255, 210, 204);
---]]

require("npc.base.basic")
require("npc.base.condition.language")
require("npc.base.consequence.inform")
require("npc.base.consequence.trade")
require("npc.base.talk")
require("npc.base.trade")
module("npc.joseph_quatrilla", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
local tradingNPC = npc.base.trade.tradeNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Joseph Quatrilla the master of alchemy. Keywords: recipes, alchemy, book"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Joseph Quatrilla der Lehrmeister der Alchemie. Schlüsselwörter: Rezepte, Alchemie, Buch"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("handel");
talkEntry:addTrigger("kauf");
talkEntry:addTrigger("Buch");
talkEntry:addResponse("Bei mir könnt Ihr das Standardwerk der Alchemie erwerben.");
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("buy");
talkEntry:addTrigger("sell,");
talkEntry:addTrigger("trade");
talkEntry:addTrigger("book");
talkEntry:addResponse("You can buy the standard work of alchemy from me.");
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Joseph Quatrilla the master of alchemy. Keywords: recipes, alchemy, book"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Joseph Quatrilla der Lehrmeister der Alchemie. Schlüsselwörter: Rezepte, Alchemie, Buch"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("handel");
talkEntry:addTrigger("kauf");
talkEntry:addTrigger("Buch");
talkEntry:addResponse("Bei mir könnt Ihr das Standardwerk der Alchemie erwerben.");
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("buy");
talkEntry:addTrigger("sell,");
talkEntry:addTrigger("trade");
talkEntry:addTrigger("book");
talkEntry:addResponse("You can buy the standard work of alchemy from me.");
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
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
talkEntry:addResponse("Greetings!");
talkEntry:addResponse("Hello.");
talkEntry:addResponse("Be greeted!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Grüß");
talkEntry:addTrigger("Gruß");
talkEntry:addTrigger("Gruss");
talkEntry:addTrigger("Grüss");
talkEntry:addTrigger("Guten Morgen");
talkEntry:addTrigger("Guten Tag");
talkEntry:addTrigger("Guten Abend");
talkEntry:addTrigger("Gute Nacht");
talkEntry:addTrigger("Mahlzeit");
talkEntry:addTrigger("Tach");
talkEntry:addTrigger("Moin");
talkEntry:addTrigger("Mohltied");
talkEntry:addResponse("Grüße.");
talkEntry:addResponse("Hallo.");
talkEntry:addResponse("Seid gegrüßt!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Greetings!");
talkEntry:addResponse("Hello.");
talkEntry:addResponse("Be greeted!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Grüße.");
talkEntry:addResponse("Hallo.");
talkEntry:addResponse("Seid gegrüßt!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Farewell");
talkEntry:addResponse("Goodbye.");
talkEntry:addResponse("Have a nice day.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Auf bald.");
talkEntry:addResponse("Wiedersehen.");
talkEntry:addResponse("Schönen Tag noch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Farewell");
talkEntry:addResponse("Goodbye.");
talkEntry:addResponse("Have a nice day.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Auf bald.");
talkEntry:addResponse("Wiedersehen.");
talkEntry:addResponse("Schönen Tag noch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("I have done better, I have done worse.");
talkEntry:addResponse("I am fine.");
talkEntry:addResponse("Thanks for asking, I am doing well.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befind");
talkEntry:addResponse("Mir geht es gut.");
talkEntry:addResponse("Danke der Nachfrage. Ich kann nicht klagen.");
talkEntry:addResponse("Es ging mir schon besser.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("I am Joseph Quatrilla.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ihr name");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Ich bin Joseph Quatrilla.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("If you want to learn the proper creation of a certain potion, have a look at my list here.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Wenn Ihr ein die richtige Herstellung eines Trankes lernen wollt, schaut hier auf die Liste auf meinem Tisch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addTrigger("recipe");
talkEntry:addTrigger("learn");
talkEntry:addTrigger("teach");
talkEntry:addTrigger("lesson");
talkEntry:addResponse("If you want to learn the proper creation of a certain potion, have a look at my list here.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addTrigger("Rezept");
talkEntry:addTrigger("lernen");
talkEntry:addTrigger("lehren");
talkEntry:addTrigger("Unterricht");
talkEntry:addResponse("Wenn Ihr ein die richtige Herstellung eines Trankes lernen wollt, schaut hier auf die Liste auf meinem Tisch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("I am an alchemist and if you are an alchemist as well, I am able to teach you something.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Ich bin Alchemist und kann Euch Dinge in der Alchemie lehren, solltet Ihr schon einer sein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("I am an alchemist and if you are an alchemist as well, I am able to teach you something.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Ich bin Alchemist und kann Euch Dinge in der Alchemie lehren, solltet Ihr schon einer sein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("How about you tell me something?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Erzhält Ihr mir doch was.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("druid");
talkEntry:addResponse("Druids are actually rather strange people. Most of them are excellent alchemists, true, but well, they indeed have some crazy ideas: spirits of nature, will of nature and all those things.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("druid");
talkEntry:addResponse("Druiden sind schon ein sonderbarer Schlag. Die meisten von ihnen sind zwar exellente Alchemisten, aber nun ja. Sie haben doch schon recht wirre Ideen: Naturgeister, Wille der Natur und all sowas.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("alchemy");
talkEntry:addTrigger("alchemist");
talkEntry:addResponse("Alchemists are masters of potions, have profound knowledge about the herbs, and are keen observers of the world.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("alchemie");
talkEntry:addTrigger("alchimi");
talkEntry:addTrigger("alchemist");
talkEntry:addResponse("Alchemisten sind Meister der Tränke, Kenner der Kräuter und gute Beobachter der Welt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("heal");
talkEntry:addTrigger("medicine");
talkEntry:addTrigger("medical");
talkEntry:addResponse("Medicine... If you know the art of creating medicine very well, you can fight against all diseases.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("heil");
talkEntry:addTrigger("medizin");
talkEntry:addResponse("Medizin. Wer die Kunst der Medizinherstellung wirklich beherrscht mag alle Krankheiten zu bekämpfen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("potion");
talkEntry:addResponse("Potions are true wonders, they may cause great benefits or catastrophic disasters.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("trank");
talkEntry:addTrigger("tränk");
talkEntry:addResponse("Tränke sind wahre Wunderwerke. Sie gehen große Wohltaten oder großes Unheil bewirken.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("herb");
talkEntry:addResponse("Herbs are the foundation of alchemy, more powerful than any sword or spell.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("kraut");
talkEntry:addTrigger("kräuter");
talkEntry:addResponse("Kräuter sind die Grundlage der Alchemie. Mächtiger als jedes Schwert und jeder Zauber.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dust");
talkEntry:addResponse("Oh, what would be a potion without gem dust? A stock! Right!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("staub");
talkEntry:addResponse("O, was wäre ein Trank doch ohne den Edelsteinstaub - ein Sud! Genau!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("adrazin");
talkEntry:addTrigger("echolon");
talkEntry:addTrigger("hyperborelium");
talkEntry:addTrigger("dracolin");
talkEntry:addTrigger("orcanol");
talkEntry:addTrigger("fenolin");
talkEntry:addTrigger("caprazin");
talkEntry:addTrigger("illidrium");
talkEntry:addResponse("Active ingredients! Magnificent. Fantastic.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("adrazin");
talkEntry:addTrigger("echolon");
talkEntry:addTrigger("hyperborelium");
talkEntry:addTrigger("dracolin");
talkEntry:addTrigger("orcanol");
talkEntry:addTrigger("fenolin");
talkEntry:addTrigger("caprazin");
talkEntry:addTrigger("illidrium");
talkEntry:addResponse("Wirkstoffe! Herrlich. Fantastisch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("active ingredient");
talkEntry:addTrigger("active agent");
talkEntry:addTrigger("active substance");
talkEntry:addResponse("Active ingredients! Magnificent. Fantastic.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("wirkstoff");
talkEntry:addResponse("Wirkstoffe! Herrlich. Fantastisch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("sickle");
talkEntry:addResponse("The way you treat it, is the way will the sickle will treat you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("sichel");
talkEntry:addResponse("So wie du sie behandelst, wird die Sichel dich behandeln.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("magic");
talkEntry:addTrigger("mage");
talkEntry:addResponse("Mages! Always up to no good.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("magie");
talkEntry:addResponse("Magier! Nichts als Schindluder im Kopf.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("Glad to meet you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Freut mich, Eure Bekanntschaft zu machen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Joseph");
talkEntry:addTrigger("Quatrilla");
talkEntry:addResponse("That's me. Correct.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Joseph");
talkEntry:addTrigger("Quatrilla");
talkEntry:addResponse("Das bin ich. Richtig erkannt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me betrachtet eine Flasche.", "#me looks closely at a bottle.");
talkingNPC:addCycleText("Wo bleibt er nur mit meinem Trank?", "What takes him so long to bring me my potion?");
talkingNPC:addCycleText("#me hackt Kräuter klein.", "#me chops some herbs.");
talkingNPC:addCycleText("#me sortiert einige Kräuter.", "#me sorts some herbs.");
talkingNPC:addCycleText("#me beschriftet eine Flasche.", "#me labels a bottle.");
talkingNPC:addCycleText("#me füllt einen Trank ab.", "#me pours a potion into a bottle.");
talkingNPC:addCycleText("#me lässt einen Rubin fallen und hebt ihn seufzend wieder auf.", "#me drops a ruby, picking it up again with a sigh.");
talkingNPC:addCycleText("Adrazin...Adrazin...immwer wieder Adrazin!", "Adrazin...Adrazin...and again, Adrazin!");
talkingNPC:addCycleText("Das nächste mal sollte ich darauf achten, was ich in den Kessel tue.", "Next time, I should take care what I pour into the cauldron.");
talkingNPC:addCycleText("Jemand, der noch nie was zum explodieren gebracht hat, ist kein richtiger Alchemist.", "Someone who never have caused and explosion can hardly be called an alchemist.");
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2622,"sell","Buch der Alchemie","Book Of Alchemy",1000,1,333,nil));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2622,"sell","Buch der Alchemie","Book Of Alchemy",1000,1,333,nil));
mainNPC:addLanguage(0);
mainNPC:addLanguage(1);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Dieser NPC ist Joseph Quatrilla  der Lehrmeister der Alchemie.", "This NPC is Joseph Quatrilla the master of alchemy.");
mainNPC:setUseMessage("Fasst mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut verwirrt.", "#me looks around confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 180);
mainNPC:setEquipment(11, 196);
mainNPC:setEquipment(5, 0);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 0);
mainNPC:setEquipment(9, 823);
mainNPC:setEquipment(10, 53);
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
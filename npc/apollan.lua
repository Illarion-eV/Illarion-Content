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
-- NPC Name: Apollan                                                 Runewick --
-- NPC Job:  magic teacher                                                    --
--                                                                            --
-- NPC Race: elf                        NPC Position:  767, 819, 0            --
-- NPC Sex:  male                       NPC Direction: south                  --
--                                                                            --
-- Author:   Rincewind                                                        --
--                                                Illarion easyNPC Editor 1.02 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (3, 767, 819, 0, 4, 'Apollan', 'npc.apollan', 0, 2, 0, 64, 64, 64, 215, 172, 134);
---]]

require("npc.base.basic")
require("npc.base.condition.attribute")
require("npc.base.condition.chance")
require("npc.base.condition.item")
require("npc.base.condition.language")
require("npc.base.condition.quest")
require("npc.base.condition.magictype")
require("npc.base.consequence.deleteitem")
require("npc.base.consequence.inform")
require("npc.base.consequence.item")
require("npc.base.consequence.quest")
require("npc.base.consequence.talkstate")
require("npc.base.consequence.trade")
require("npc.base.talk")
module("npc.apollan", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Apollan the magus of Runewick. Keywords: Runewick, quest, magic."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Apollan, ein Maiger von Runewick. Schlüsselwörter: Runewick, Quest, Magie."));
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
talkEntry:addResponse("Elara may be with you.");
talkEntry:addResponse("Be greeted.");
talkEntry:addResponse("Greeted be. Why do you wish to see me?");
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
talkEntry:addResponse("Elara sei mit Euch.");
talkEntry:addResponse("Seid gegrüßt.");
talkEntry:addResponse("Guten Tag. Wozu, wollt Ihr mit mir sprechen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Elara may be with you.");
talkEntry:addResponse("Be greeted.");
talkEntry:addResponse("Greeted be.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Elara sei mit Euch.");
talkEntry:addResponse("Seid gegrüßt.");
talkEntry:addResponse("Guten Tag.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Farewell.");
talkEntry:addResponse("Elara shall guard your path.");
talkEntry:addResponse("");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Gehabt Euch wohl.");
talkEntry:addResponse("Elara geleite Euch auf Euren Weg.");
talkEntry:addResponse("Sichere Pfade und vergesst nie zu lachen. Jedes Lächeln macht die Welt ein wenig schöner.");
talkEntry:addResponse("Sichere Pfade und vergesst nie zu lachen. Jedes Lächeln macht das Leben ein wenig lebenswerter.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Farewell.");
talkEntry:addResponse("Elara shall guard your path.");
talkEntry:addResponse("Save paths and never forget to laugh. Each and every smile makes the world a better place to be.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Gehabt Euch wohl.");
talkEntry:addResponse("Elara geleite Euch auf Euren Weg.");
talkEntry:addResponse("Sichere Pfade und vergesst nie zu lachen. Jedes Lächeln macht die Welt ein wenig schöner.");
talkEntry:addResponse("Sichere Pfade und vergesst nie zu lachen. Jedes Lächeln macht das Leben ein wenig lebenswerter.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("A friend of mine would tell you that this question is very polite but not very important.");
talkEntry:addResponse("#me laughs 'As long as beauty is surrounding me, I will be fine.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befind");
talkEntry:addResponse("Ein Freund von mir würde sagen, dass eure Frage sehr höflich aber nicht besonders wichtig sei.");
talkEntry:addResponse("#me lacht 'Solang die Schönheit mich umgibt, wird es mir immer gut gehen.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("Now and here you can call me Apollan.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ihr name");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Hier und jezt nennt man mich Apollan.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.apollan.attribute("mage", ">", 30));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("You are not able to learn the arcane arts.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.apollan.attribute("mage", ">", 30));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("aufgabe");
talkEntry:addResponse("Du bist nicht in der Lage die arkanen Künste zu erlernen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.magictype.magictype("druid"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("aufgabe");
talkEntry:addResponse("Gehe und misch doch lieber ein paar schöne farbige Tränke. Die Kunst der Magie ist nicht die Deine.");
talkingNPC:addTalkingEntry(talkEntry);
end;

if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.magictype.magictype("druid"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Go and make some pretty, colourful potions. The art of magic is not your kind of art.");
talkingNPC:addTalkingEntry(talkEntry);
end;


if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.attribute.attribute("mana", "=", 0));
talkEntry:addCondition(npc.base.condition.magictype.magictype("nomagic"));
talkEntry:addCondition(npc.base.condition.quest.quest(370, "=", 0));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("aufgabe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neuer Quest] Der arkane Künstler"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(370, "=", 1));
talkEntry:addResponse("So junger Schüler, du möchtest die arkanen Künste lernen? Beginnen wir mit den Grundlagen. Bring mir eine dieser zauberhaften Blumen nach denen die Halblingsstadt Firnismill benannt wurde.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.attribute.attribute("mana", "<", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(370, "=", 0));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("aufgabe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neuer Quest] Der arkane Künstler"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(370, "=", 3));
talkEntry:addResponse("Lass uns etwas wundervolles erschaffen, ein Artefakt. Wie wäre es mit einem verzauberten Zauberstab? Geh und hole solch eine wunderschöne Schreinerarbeit.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(370, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(148, "all", "=>", 1, nil));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("aufgabe");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(148, 1, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(370, "=", 2));
talkEntry:addConsequence(npc.base.consequence.quest.quest(37, "=", 1));
talkEntry:addResponse("Schau dich um und genieße die Schönheit der wundervollen Landschaft. Nun konzentriere dich auf deine innere Schönheit, schließe deine Augen, atme die frische Luft ein und spühre das Mana.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(370, "=", 2));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("aufgabe");
talkEntry:addConsequence(npc.base.consequence.quest.quest(370, "=", 3));
talkEntry:addResponse("Lass uns etwas wundervolles erschaffen, ein Artefakt. Wie wäre es mit einem verzauberten Zauberstab? Geh und hole solch eine wunderschöne Schreinerarbeit.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(370, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(323, "all", "=>", 1, nil));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("aufgabe");
talkEntry:addConsequence(npc.base.consequence.item.item(285, 5, 777, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(370, "=", 4));
talkEntry:addResponse("Oh was für eine zauberhafte Arbeit. Hier hast du die besten Freunde der schönen Damen. Geh zum Ritualkreis und verwende die Diamanten um den Zauberstab zu verzaubern. Vergiss nicht seine Struktur zu laden sonst könnte es dir wie einem Maler ergehen der einen Pinsel hat aber keine Farben.");
talkingNPC:addTalkingEntry(talkEntry);
end;



if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.attribute.attribute("mana", "=", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(370, "=", 0));
talkEntry:addCondition(npc.base.condition.magictype.magictype("nomagic"));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] The arcane artist"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(370, "=", 1));
talkEntry:addResponse("So young scholar you want to learn the arcane arts? First we start with the very basics. Bring me one of the beautyful flowers the Halfingtown Firnismill is named after.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.attribute.attribute("mana", "<", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(370, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] The arcane artist"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(370, "=", 3));
talkEntry:addResponse("Lets shape something wonderful, an artefact. How about an enchanted wand? Go and get such a beautiful piece of carpentry.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(370, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(148, "all", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(148, 1, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(370, "=", 2));
talkEntry:addConsequence(npc.base.consequence.quest.quest(37, "=", 1));
talkEntry:addResponse("Take a look around and enjoy the beauty of this landscape. Now concentrate on your inner beauty, close your eyes, inhale the fresh air, feel the mana.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(370, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.quest.quest(370, "=", 3));
talkEntry:addResponse("Lets shape something wonderful, an artefact. How about an enchanted wand? Go and get such a beautiful piece of carpentry.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(370, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(323, "all", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.item.item(285, 5, 777, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(370, "=", 4));
talkEntry:addResponse("Oh what a beautyful piece of carpentry. Here you have the best friend of the beautiful girls diamonds. Go to the magic circle and use them to enchant this wand. Remember to charge it's structure too or might end up like an artist with a brush but no paint.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("Me? I am an artist, virtuoso and admirer of the world. But I think you prefer 'a Mage' as an answer.");
talkEntry:addResponse("Some would say a Mage focused on Enchanting.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Ich? Ich bin Künstler, Virtuose und Bewunderer der Welt. Aber ich glaub ihr wollt lieber hören, dass ich Magier bin.");
talkEntry:addResponse("Machne würden sagen ich sei Magier, Spezialgebiet Verzauberungen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("Me? I am an artist, virtuoso and admirer of the world. But I think you prefer 'a Mage' as an answer.");
talkEntry:addResponse("Some would say a Mage focused on Enchanting.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Ich? Ich bin Künstler, Virtuose und Bewunderer der Welt. Aber ich glaub ihr wollt lieber hören, dass ich Magier bin.");
talkEntry:addResponse("Machne würden sagen ich sei Magier, Spezialgebiet Verzauberungen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("A small group of islands in the open sea. I've heard it was full of beauty.");
talkEntry:addResponse("The gods take what they've given to us. We should enjoy the things we have.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Eine kleine Inselgruppe weit im Meer. Sie soll voller Schönheiten gewesen sein.");
talkEntry:addResponse("Die Götter nehmen wie sie geben. Wir sollten uns an dem erfreuen, was wir haben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("A name tells only little about the one bearing it or even nothing.");
talkEntry:addResponse("#me laughs");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Ein Name kann viel über die Person dahinter verraten, oder garnichts");
talkEntry:addResponse("#me lacht");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mage");
talkEntry:addTrigger("magic");
talkEntry:addTrigger("wizard");
talkEntry:addTrigger("theurgy");
talkEntry:addResponse("Magic is an art. It doesn't matter if you are enchanting an item or shaping a ritual.");
talkEntry:addResponse("Magic is complex. One could say the same about crafts.");
talkEntry:addResponse("#me hands you a flower. 'Magic'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Magie");
talkEntry:addTrigger("zauber");
talkEntry:addResponse("Magie ist Kunst. Egal ob man sie in einen Gegenstand webt oder in einen Ritual formt.");
talkEntry:addResponse("Magie ist vielschichtig. Man könnte ganauso etwas über das Handwerk erzählen.");
talkEntry:addResponse("#me reicht dir eine Blume. 'Magie'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Lor Angur");
talkEntry:addResponse("A really wise place full of wise people having wise discussion.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Lor Angur");
talkEntry:addResponse("Ein wahlich gelehrter Ort voller gelehrter Leute die gelehrte Diskussionsthemen haben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("#me points at the town.");
talkEntry:addResponse("Elvaine is teaching there. There is much to learn and to forget again.");
talkEntry:addResponse("A really beautiful place for a beautiful town.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("#me zeigt mit einen Finger auf die Stadt.");
talkEntry:addResponse("Elvaine bildet dort aus. Viel kann man lernen und wieder vergessen.");
talkEntry:addResponse("Ein wahrhaft schöner Ort für eine schöne Stadt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("#me laughs 'For Dwarfs even gold is aesthetic'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("#me lacht 'Für Zwerge ist Gold auch kunstvoll.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("When you've reached my age you'll see some beauty at every place.");
talkEntry:addResponse("Mountains can be fascinating. Shapes of creation, hard, impressive, indomitable. But full of secrets and living.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Wenn ihr mal so alt seid wie ich, werdet ihr in jedem Ort Schönheit entdecken.");
talkEntry:addResponse("Berge können fazinierend sein. Gebilde der Schöpfung, hart, gewaltig, unbezwingbar. Und doch voller Geheimnisse und lebendig.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Queen");
talkEntry:addResponse("How fading beatuy can be. Today everyone might admire her but in a while her beauty will be fading away. But doesn't this fading teach us to admier?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königin");
talkEntry:addResponse("Wie vergänglich Schönheit doch ist. Heute mag sie noch von allen bewundert werden, doch morgen ist sie verdorrt. Aber lehrt uns Vergänglichkeit nicht erst Bewunderung?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("How fading beatuy can be. Today everyone might admire her but in a while her beauty will be fading away. But doesn't this fading teach us to admier?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Wie vergänglich Schönheit doch ist. Heute mag sie noch von allen bewundert werden, doch morgen ist sie verdorrt. Aber lehrt uns Vergänglichkeit nicht erst Bewunderung?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("You think a desert town is dry and barren? Pay a visit to the oasis or watch the dawn from the top of the walls.");
talkEntry:addResponse("#mes gaze goes west. 'A desertflower'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Ihr denkt eine Wüstenstadt wäre trocken und öd? Besucht doch mal die Oasen oder betrachtet einen Sonnenaufgang von den Zinnen aus.");
talkEntry:addResponse("#mes Augen wandern in den Westen 'Eine Wüstenblume'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("albar");
talkEntry:addResponse("Humans are short-lived but sometimes admireable.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("Menschenreiche sind so vergänglich, aber manchmal auch bewundernswert.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addResponse("#me laughs 'Start looking for wisdome at the bottom of an empty mug'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("#me lacht 'Suche Weisheit am Boden eines leeren Kruges'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Humans are short-lived but sometimes admireable.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Menschenreiche sind so vergänglich, aber manchmal auch bewundernswert.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("Ask a priest, pray or meditate, or do all this at the same moment. But no mortal ever will understand the will of the gods.");
talkEntry:addResponse("#me laughs 'Talking about the gods would exceed your and even my span of life.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Fragt einen Priester, betet oder meditiert, oder tut alles auf einmal. Doch den Willen der Götter wird nie Jemand ganz verstehen.");
talkEntry:addResponse("#me lacht 'über die Götter zu reden würde euer und sogar mein Lebensalter übersteigen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Adron");
talkEntry:addResponse("Wisdome at the bottom of an empty mug. That's my path too.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Adron");
talkEntry:addResponse("Weisheit am Boden eines leeren Kruges. Auch das ist ein Weg.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elara");
talkEntry:addResponse("Elara is the godness of knowledge and wisdome.");
talkEntry:addResponse("What would knowledge be without a heart?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elara");
talkEntry:addResponse("Elara ist die Göttin des Wissens und der Weisheit.");
talkEntry:addResponse("Was wäre Wissen ohne Herz?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Eldan");
talkEntry:addResponse("Eladen. What shall I tell you about him? I know as much about him as a thirsting person about water.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eldan");
talkEntry:addResponse("Eldan. Was soll ich euch über ihn erzählen? Ich weiß so viel von ihm, wie ein Dürstender über Wasser.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Findari");
talkEntry:addResponse("Findari is wind, soon like a storm, soon calm, creative, airy, alive.");
talkEntry:addResponse("Wind blowing across the fields of weath.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Findari");
talkEntry:addResponse("Findari ist Wind, bald stürmisch, bald ruhig, kreativ, unstet, lebhaft.");
talkEntry:addResponse("Wind über einen Weizenfeld.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Moshran");
talkEntry:addResponse("#me's gaze darkens 'Why are you calling his name? Like a dark cloud covering the mind.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Moshran");
talkEntry:addResponse("#mes Blick verdüstert sich 'Warum nennt ihr seinen Namen? Wie eine dunkle Wolke die das Gemüt überdeckt.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("An elf talking about the young gods?");
talkEntry:addResponse("Beauty is something personal.");
talkEntry:addResponse("Beauty is everywhere.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("Ein Elf der über eine junge Gottheit redet?");
talkEntry:addResponse("Schönheit ist etwas persönliches.");
talkEntry:addResponse("Überall ist Schönheit.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("Tanora is water, wavy, patient.");
talkEntry:addResponse("Waves breaking at the coast, plashing springs and deep oceans.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addConsequence(npc.base.consequence.talkstate.talkstate("end"));
talkEntry:addResponse("Tanora ist Wasser, woggeduldig.");
talkEntry:addResponse("Wellen die gleichmäßig an ein Ufer schlagen, plätscherde Quellen und tiefe Ozeane.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("Ushara is earth, rooted in the soil, well tempered, loving and helpful.");
talkEntry:addResponse("A wildflower meadow.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ushara");
talkEntry:addConsequence(npc.base.consequence.talkstate.talkstate("end"));
talkEntry:addResponse("Ushara ist Erde, bodenständig, zurückhaltliebevoll und hilfsbereit.");
talkEntry:addResponse("Eine Blumenwiese.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("I am selling knowledge and wisdome, but that's something you cannot afford.");
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Ich verkaufe Wissen und Weisheit, aber die könnt ihr euch nicht leisten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("The stories of an old Elf would bore you.");
talkEntry:addResponse("See the beauty of the creation. How? You will have to find out on your own.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Die Geschichten eines alten Elfen würden euch sicher ermüden.");
talkEntry:addResponse("Erkenne die Kunst der Schöpfung. Wie? Diesen Weg müsst ihr selbst finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Apollan");
talkEntry:addResponse("Only a name, but it is mine.");
talkEntry:addResponse("Have a seat, then we can talk.");
talkEntry:addResponse("Stay awhile and let us talk.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Apollan");
talkEntry:addResponse("Nur ein Name, aber so heiß ich nun");
talkEntry:addResponse("Setz dich doch, dann können wir reden.");
talkEntry:addResponse("Bleibt ein Weilchen und lasst uns reden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("#me nods laughing");
talkEntry:addResponse("A Yes is good.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("#me nickt lachend");
talkEntry:addResponse("Ein Ja ist gut.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("#me nods laughing");
talkEntry:addResponse("Another path.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("#me nickt lachend");
talkEntry:addResponse("Auch ein Weg.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Why? For which reason?");
talkEntry:addResponse("#me laughs");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Weshalb? Warum? Wofür?");
talkEntry:addResponse("#me lacht");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me betrachtet eine Blume.", "#me looks at a flower.");
talkingNPC:addCycleText("#me atmet langsam und leise aus, für einen Moment scheint er einem Gedanken nachzuhängen.", "#me breathes slowly and quietly as he appears to reflect upon a theory, concerning a difficult topic.");
talkingNPC:addCycleText("#me fährt mit den Händen über dem Zauberstab und leuchtende Fäden sind zu erkennen", "#me moves his hand over a wand and shining filaments can be seen.");
talkingNPC:addCycleText("#me wirft einen kleinen Stein ins Wasser", "#me tosses a small stone in the water.");
talkingNPC:addCycleText("#me lacht.", "#me laughs.");
talkingNPC:addCycleText("#me schaut verträumt in die Luft.", "#me looks dreamy at the sky.");
talkingNPC:addCycleText("Webt eine Zauber wie ein Weber einen Teppich und man wird ein Kunstwerk erhalten.", "Weave a spell like a weave a carpet and you will do arts.");
talkingNPC:addCycleText("Wie schön die Welt doch ist.", "How beautyful things are.");
talkingNPC:addCycleText("Mimose!", "Mimose");
talkingNPC:addCycleText("Bleibt ein Weilchen und hört zu.", "Stay awhile and listen.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(3);
mainNPC:addLanguage(10);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Ein galanter Elf, mit offenen, wildem Haar und leuchtenden grauen Augen. Ihn umgibt eine Aura von Weisheit und Zufreidenheit, die jedem in seiner Nähe ein lächeln zu geben scheint. Sein Gesicht wirkt verträumt.", "A proud elf . .");
mainNPC:setUseMessage("Wenn ihr etwas von mir wollt, dann fragt doch einfach.", ".");
mainNPC:setConfusedMessage("#me schaut dich lächelnd an. 'Wie bitte?'", "#me glances smilingly. 'Excuse me?'");
mainNPC:setEquipment(1, 371);
mainNPC:setEquipment(3, 810);
mainNPC:setEquipment(11, 548);
mainNPC:setEquipment(5, 2782);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 2295);
mainNPC:setEquipment(9, 824);
mainNPC:setEquipment(10, 369);
mainNPC:setAutoIntroduceMode(true);

mainNPC:initDone();
end;


--Check for Mage attributes. Seperate script including the mage attributes.

attribute = base.class.class(npc.base.condition.condition.condition,
function(self, name, comp, value)
    npc.base.condition.condition.condition:init(self);
    self["value"], self["valuetype"] = npc.base.talk._set_value(value);
    self["attrib"] = name;
    if (comp == "=") then
        self["check"] = _attrib_helper_equal;
    elseif (comp == "<>" or comp == "!=" or comp == "~=") then
        self["check"] = _attrib_helper_notequal;
    elseif (comp == "<=" or comp == "=<") then
        self["check"] = _attrib_helper_lesserequal;
    elseif (comp == ">=" or comp == "=>") then
        self["check"] = _attrib_helper_greaterequal;
    elseif (comp == ">") then
        self["check"] = _attrib_helper_greater;
    elseif (comp == "<") then
        self["check"] = _attrib_helper_lesser;
    else
        -- unkonwn comparator
    end;
end);

function _attrib_helper_equal(self, npcChar, texttype, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
	
	--Check for mage attributs in sum
	if self["attrib"] == "mage" then
		return (value == (player:increaseAttrib("willpower", 0) + player:increaseAttrib("essence", 0) + player:increaseAttrib("intelligence", 0)))
	end
	
    return (value == player:increaseAttrib(self.attrib, 0))
end;

function _attrib_helper_notequal(self, npcChar, texttype, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
	
	--Check for mage attributs in sum
	if self["attrib"] == "mage" then
		return (value ~= (player:increaseAttrib("willpower", 0) + player:increaseAttrib("essence", 0) + player:increaseAttrib("intelligence", 0)))
	end
	
    return (value ~= player:increaseAttrib(self.attrib, 0))
end;

function _attrib_helper_lesserequal(self, npcChar, texttype, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
	
	--Check for mage attributs in sum
	if self["attrib"] == "mage" then
		return (value <= (player:increaseAttrib("willpower", 0) + player:increaseAttrib("essence", 0) + player:increaseAttrib("intelligence", 0)))
	end
	
    return (value <= player:increaseAttrib(self.attrib, 0))
end;

function _attrib_helper_greaterequal(self, npcChar, texttype, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
	
	--Check for mage attributs in sum
	if self["attrib"] == "mage" then
		return (value >= (player:increaseAttrib("willpower", 0) + player:increaseAttrib("essence", 0) + player:increaseAttrib("intelligence", 0)))
	end
		
    return (value >= player:increaseAttrib(self.attrib, 0))
end;

function _attrib_helper_lesser(self, npcChar, texttype, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
	
	--Check for mage attributs in sum
	if self["attrib"] == "mage" then
		return (value < (player:increaseAttrib("willpower", 0) + player:increaseAttrib("essence", 0) + player:increaseAttrib("intelligence", 0)))
	end
		
    return (value < player:increaseAttrib(self.attrib, 0))
end;

function _attrib_helper_greater(self, npcChar, texttype, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
	
	--Check for mage attributs in sum
	if self["attrib"] == "mage" then
		return (value > (player:increaseAttrib("willpower", 0) + player:increaseAttrib("essence", 0) + player:increaseAttrib("intelligence", 0)))
	end
	
    return (value > player:increaseAttrib(self.attrib, 0))
end;

--End check for Mage attributes. Seperate script including the mage attributes.

function receiveText(npcChar, texttype, message, speaker) mainNPC:receiveText(npcChar, texttype, speaker, message); end;
function nextCycle(npcChar) mainNPC:nextCycle(npcChar); end;
function lookAtNpc(npcChar, char, mode) mainNPC:lookAt(npcChar, char, mode); end;
function useNPC(npcChar, char, counter, param) mainNPC:use(npcChar, char); end;
initNpc();
initNpc = nil;
-- END
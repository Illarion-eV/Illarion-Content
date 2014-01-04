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
-- NPC Name: Paula Bronzeblatt                                        Galmair --
-- NPC Job:  Map trader                                                       --
--                                                                            --
-- NPC Race: dwarf                      NPC Position:  256, 304, -6           --
-- NPC Sex:  female                     NPC Direction: west                   --
--                                                                            --
-- Author:   envi                                                             --
--                                                Illarion easyNPC Editor 1.02 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (1, 256, 304, -6, 6, 'Paula Bronzeblatt', 'npc.paula_bronzeblatt', 1, 4, 0, 123, 62, 9, 245, 180, 137);
---]]

require("npc.base.basic")
require("npc.base.condition.chance")
require("npc.base.condition.language")
require("npc.base.condition.money")
require("npc.base.condition.quest")
require("npc.base.consequence.inform")
require("npc.base.consequence.item")
require("npc.base.consequence.money")
require("npc.base.consequence.quest")
require("npc.base.consequence.treasure")
require("npc.base.talk")
module("npc.paula_bronzeblatt", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Paula Bronzeblatt the Map trader. Keywords: treasure, map."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Paula Bronzeblatt die Kartenverkäuferin. Schlüsselwörter: Schatz, Karte."));
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
talkEntry:addResponse("Hello, hello. Would you like to buy a treasure map? I sell them for just ten gold coins. Say 'deal' and it belongs to you.");
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
talkEntry:addResponse("Hallo, hallo. Willst du eine Schatzkarte kaufen? Ich verkaufe die für zehn Goldmünzen. Sage 'Deal' und eine gehört dir.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Hello, hello. Would you like to buy a treasure map? I sell them for just ten gold coins. Say 'deal' and it belongs to you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Hallo, hallo. Willst du eine Schatzkarte kaufen? Ich verkaufe die für zehn Goldmünzen. Sage 'Deal' und eine gehört dir.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("See you soon!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Bis bald!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("See you soon!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Bis bald!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("Fine, and you? Interested in buying a treasure map? I sell them for just ten gold coins. Say 'deal' and it belongs to you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befind");
talkEntry:addResponse("Gut, und dir? Interessiert in den Erwerb einer Schatzkarte? Ich verkaufe die für zehn Goldmünzen. Sage 'Deal' und eine gehört dir.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("My name is Paula and I sell treasure maps. I sell them for just ten gold coins. Say 'deal' and it belongs to you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ihr name");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Ich bin Paula und verkaufe Schatzkarten. Ich verkaufe die für zehn Goldmünzen. Sage 'Deal' und eine gehört dir.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(613, "~=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("deal");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Treasure map-trader] Currently, there is no map for available. You will be informed as soon as there is one available for you."));
talkEntry:addResponse("Arrr, I do not have any for you today. Please come back another day. I will send you a dove when I have one for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(613, "~=", 0));
talkEntry:addTrigger("deal");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Schatzkarten-Händler] Es gibt für dich vorerst keine weitere Karte zu erwerben. Du wirst über eine Nachricht informiert, wenn es für dich wieder möglich ist."));
talkEntry:addResponse("Arrr, ich habe heute keine für dich. Bitte komm an einen anderen Tag wieder. Ich werde dir eine Taube zukommen lassen, wenn ich wieder welche für dich habe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("<", 100000));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("deal");
talkEntry:addResponse("Get enough coins first. You need ten gold.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("<", 10000));
talkEntry:addTrigger("deal");
talkEntry:addResponse("Du benötigst ausreichend Münzen. Zehn Goldstücke, um genau zu sein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(11.0));
talkEntry:addTrigger("deal");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Treasure map-trader] Bad luck, you received a fake map. Maybe you will have more luck next time."));
talkEntry:addConsequence(npc.base.consequence.money.money("-", 100000));
talkEntry:addConsequence(npc.base.consequence.item.item(505, 1, 333, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(613, "=", 200));
talkEntry:addResponse("#me hands over a treasure map and gloats. 'Welcome to the black market.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(11.0));
talkEntry:addTrigger("deal");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Schatzkarten-Händler] Pech, du hast eine Fälschung erhalten. Viellecht hast du mehr Glück beim nächsten Mal."));
talkEntry:addConsequence(npc.base.consequence.money.money("-", 100000));
talkEntry:addConsequence(npc.base.consequence.item.item(505, 1, 333, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(613, "=", 200));
talkEntry:addResponse("#me überreicht eine Schatzkarte und freut sich hämisch. 'Willkommen am Schwarzmarkt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("deal");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Treasure map-trader] You received a treasure map. You will have to go to the surface in order to read it."));
talkEntry:addConsequence(npc.base.consequence.money.money("-", 100000));
talkEntry:addConsequence(npc.base.consequence.quest.quest(613, "=", 300));
talkEntry:addConsequence(npc.base.consequence.treasure.treasure(8));
talkEntry:addResponse("#me hands over a treasure map and smiles. 'Good luck!'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("deal");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Schatzkarten-Händler] Du hast eine Schatzkarte erhalten. Um sie lesen zu können, wirst du nach oben gehen müssen."));
talkEntry:addConsequence(npc.base.consequence.money.money("-", 100000));
talkEntry:addConsequence(npc.base.consequence.quest.quest(613, "=", 300));
talkEntry:addConsequence(npc.base.consequence.treasure.treasure(8));
talkEntry:addResponse("#me überreicht eine Schatzkarte und lächelt. 'Viel Glück!'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("sell");
talkEntry:addTrigger("wares");
talkEntry:addTrigger("price");
talkEntry:addTrigger("trade");
talkEntry:addResponse("I sell treasure maps for ten gold coins. Interested? Say 'deal' and a treasure map is yours.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("verkauf");
talkEntry:addTrigger("waren");
talkEntry:addTrigger("preis");
talkEntry:addTrigger("Handel");
talkEntry:addResponse("Ich verkaufe Schatzkarten für zehn Goldmünzen. Interessiert? Sage 'Deal' und eine Schatzkarte ist dein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("buy");
talkEntry:addTrigger("purchase");
talkEntry:addResponse("I do not buy anything but just sell treasure maps for ten gold coins. Interested? Say 'deal' and a treasure map is yours.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("kauf");
talkEntry:addTrigger("erwerb");
talkEntry:addResponse("Ich kaufe gar nichts, sondern lediglich verkaufe Schatzkarten für zehn Goldmünzen. Interessiert? Sage 'Deal' und eine Schatzkarte ist dein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("I am a treasure map seller. Don't ask me where I get them from. It is my secret and I would not tell you anyway.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Ich bin Schatzkarten-Verkäufer. Frage mich nicht, woher ich die bekomme. Es ist mein Geheimnis und ich würde es dir ohnehin nicht sagen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("I am a treasure map seller. Don't ask me where I get them from. It is my secret and I would not tell you anyway.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Ich bin Schatzkarten-Verkäufer. Frage mich nicht, woher ich die bekomme. Es ist mein Geheimnis und ich würde es dir ohnehin nicht sagen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("I sell treasure maps for ten gold coins. Interested? Say 'deal' and a treasure map is yours.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Ich verkaufe Schatzkarten für zehn Goldmünzen. Interessiert? Sage 'Deal' und eine Schatzkarte ist dein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("map");
talkEntry:addTrigger("treasure");
talkEntry:addResponse("I sell my maps for ten gold coins. Say 'deal' and a treasure map is yours.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Schatz");
talkEntry:addTrigger("Karte");
talkEntry:addResponse("Ich verkaufe Schatzkarten für zehn Goldmünzen. Sage 'Deal' und eine Schatzkarte ist dein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("For some of my treasure maps, you will need the help of our gods. If you want to know more about gods then you should ask others, in particular priests.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Für manche meiner Schatzkarten wirst du die Hilfe unserer Götter benötigen. Falls du mehr über Götter wissen möchtest, dann frage andere. Insbesondere Priester.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addResponse("According to rumours I have heard, he only insists that he can read.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Mir wurde gesagt, er kann gar nicht lesen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("According to rumours I have heard, he only insists that he can read.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Mir wurde gesagt, er kann gar nicht lesen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("I do not think you will find any treasure there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Ich glaube nicht, dass du dort irgend einen Schatz finden wirst.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("#w Just between us, he might have killed his own father. So be careful!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("#w Unter uns, er soll seinen eigenen Vater getötet haben. Also sei vorsichtig!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("A treasure itself!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Ein wahrer Schatz!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Queen");
talkEntry:addResponse("I was told, she wears a mask because she is not as beautiful as she pretends.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königin");
talkEntry:addResponse("Mir wurde gesagt, sie trägt ständig eine Maske und das sie gar nicht so schön ist, wie sie alle glauben lässt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("I was told, she wears a mask because she is not as beautiful as she pretends.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Mir wurde gesagt, sie trägt ständig eine Maske und das sie gar nicht so schön ist, wie sie alle glauben lässt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("I do not think you will find any treasure there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Ich glaube nicht, dass du dort irgend einen Schatz finden wirst.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("Do you want to buy one of my treasure maps for just ten gold coins. Say 'deal' and it is yours!");
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
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Paula");
talkEntry:addTrigger("Bronzeblatt");
talkEntry:addResponse("Yes, this is my name, but do you want to buy my treasure map for just ten gold coins? Say 'deal' and it is yours!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Paula");
talkEntry:addTrigger("Bronzeblatt");
talkEntry:addResponse("Ja, das ist mein Name. Aber willst du meine Schatzkarte für nur zehn Goldstücke kaufen. Sage 'Deal' und sie gehört dir.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("Yes, you want to buy my treasure map for just ten gold coins? Say 'deal' and it belongs to you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("Ja, du willst meine Schatzkarte für nur zehn Goldstücke kaufen? Sage 'Deal' und sie gehört dir.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("No, you do not want to buy my treasure map for only ten gold coins? You should change your mind.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("Nein, du willst nicht meine Schatzkarte für nur zehn Goldstücke kaufen? Überlege es dir nochmals.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("I sell treasure maps for ten gold coins. Interested? Say 'deal' and a treasure map is yours.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Ich verkaufe Schatzkarten für zehn Goldmünzen. Interessiert? Sage 'Deal' und eine Schatzkarte ist dein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me kratzt sich am Kopf.", "#me scratches her head.");
talkingNPC:addCycleText("#me zählt ihre Schatzkarten.", "#me counts her treasure maps.");
talkingNPC:addCycleText("Wo der Schatz nur liegen wird? Irgendwo im Südwesten.", "Where might this treasue be hidden?. Somewhere in the southwest.");
talkingNPC:addCycleText("Schatzkarten zu verkaufen! Schatzkarten zu verkaufen!", "Treasure maps for sale! Treasure maps for sale!");
talkingNPC:addCycleText("Nur zehn Goldstücke für eine Schatzkarte!", "Only ten gold coins for one treasure map!");
talkingNPC:addCycleText("#me untersucht ihre Schatzkarten", "#me examines her treasure maps.");
talkingNPC:addCycleText("Wer hat noch nicht? Wer will noch einmal? Schatzkarten zu verkaufen!", "Who has not yet? Who wants again? Treasure maps for sale!");
talkingNPC:addCycleText("#me nickt leicht ein.", "#me falls asleep.");
talkingNPC:addCycleText("#me spielt gelangweilt mit einer Münze.", "#me plays with a coin, bored.");
talkingNPC:addCycleText("#me lässt ihre Finge knacken.", "#me cracks her fingers.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(2);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Dieser NPC ist Paula Bronzeblatt die Kartenverkäuferin.", "This NPC is Paula Bronzeblatt the Map trader.");
mainNPC:setUseMessage("Fasst mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut verwirrt.", "#me looks around confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 365);
mainNPC:setEquipment(11, 0);
mainNPC:setEquipment(5, 0);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 526);
mainNPC:setEquipment(9, 839);
mainNPC:setEquipment(10, 326);
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
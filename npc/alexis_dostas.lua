--------------------------------------------------------------------------------
-- NPC Name: Alexis Dostas                                            Cadomyr --
-- NPC Job:  stablemaster                                                     --
--                                                                            --
-- NPC Race: human                      NPC Position:  141, 637, 0            --
-- NPC Sex:  male                       NPC Direction: west                   --
--                                                                            --
-- Author:   Estralis Seborian                                                --
--                                                                            --
-- Last parsing: October 28, 2012                        easyNPC Parser v1.21 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (0, 141, 637, 0, 6, 'Alexis Dostas', 'npc.alexis_dostas', 0, 3, 4, 123, 62, 9, 205, 133, 73);
---]]

require("npc.base.basic")
require("npc.base.condition.item")
require("npc.base.condition.language")
require("npc.base.condition.quest")
require("npc.base.condition.town")
require("npc.base.consequence.deleteitem")
require("npc.base.consequence.inform")
require("npc.base.consequence.item")
require("npc.base.consequence.money")
require("npc.base.consequence.quest")
require("npc.base.consequence.rankpoints")
require("npc.base.talk")
module("npc.alexis_dostas", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Alexis Dostas the stablemaster. Keywords: Hello, quest, Cadomyr, profession, stables."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Alexis Dostas der Stallmeister. Schlüsselwörter: Hallo, Quest, Cadomyr, Beruf, Stallungen."));
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
talkEntry:addResponse("Be greeted. You came here for a mount I suppose.");
talkEntry:addResponse("Welcome to the stables.");
talkEntry:addResponse("If you need a mount, you came to the right place.");
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
talkEntry:addResponse("Seid gegrüßt. Ihr seid hier eines Reittiers wegen, nehme ich an.");
talkEntry:addResponse("Willkommen in den Stallungen.");
talkEntry:addResponse("Falls ihr ein Lasttier benötigt seid ihr hier richtig.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Be greeted. You came here for a mount I suppose.");
talkEntry:addResponse("Welcome to the stables.");
talkEntry:addResponse("If you need a beast of burden, you came to the right place.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Seid gegrüßt. Ihr seid hier eines Reittiers wegen, nehme ich an.");
talkEntry:addResponse("Willkommen in den Stallungen.");
talkEntry:addResponse("Falls ihr ein Reittier benötigt seid ihr hier richtig.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Farewell. And come back alive.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Gehabt euch wohl und kommt gesund zurück.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Farewell. And come back alive.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Gehabt euch wohl und kommt gesund zurück.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("This is none of your business, sorry.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befind");
talkEntry:addResponse("Entschuldigt, aber das tut jetzt nichts zur Sache.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("My name is Alexis Dostas, I am the royal stablemaster.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ihr name");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Mein Name ist Alexis Dostas, ich bin hier der königliche Stallmeister.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(125, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] The Royal Stables I"));
talkEntry:addResponse("As you might know, Cadomyr is not blessed with much fertile farmland. Hence, the stables always lack hay. Could you please bring ten bundles of grain? My gratitude is guaranteed.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(125, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(125, "=", 0));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Die königlichen Stallungen I"));
talkEntry:addResponse("Wie euch bekannt sein dürfte, ist Cadomyr nicht gerade mit fruchtbarem Ackerland gesegnet. Somit fehlt es in den Stallungen immer an Heu. Bringt ihr mir bitte zehn Bündel Getreide? Mein Dank ist euch gewiss.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(125, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(125, "=", 0));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] The Royal Stables I"));
talkEntry:addResponse("As you might know, Cadomyr is not blessed with much fertile farmland. Hence, the stables always lack hay. Could you please bring ten bundles of grain? My gratitude is guaranteed.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(125, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(125, "=", 0));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Die königlichen Stallungen I"));
talkEntry:addResponse("Wie euch bekannt sein dürfte, ist Cadomyr nicht gerade mit fruchtbarem Ackerland gesegnet. Somit fehlt es in den Stallungen immer an Heu. Bringt ihr mir bitte zehn Bündel Getreide? Mein Dank ist euch gewiss.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(125, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(125, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(249, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded a gold nugget. You advance in Queen Rosaline Edwards' favour."));
talkEntry:addResponse("Ah, the hay, thank you very much. Bette and the other mounts will be amused! I have not much I can give you, but long ago, a weird dwarf forgot a gold nugget in the stables. I cannot shake the feeling that he is somehow responsible for our lack of hay...");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(249, 10, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(234, 1, 699, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(125, "=", 2));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Cadomyr", "+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(125, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(249, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst ein Goldnugget. Dein Ansehen bei Königin Rosaline Edwards steigt."));
talkEntry:addResponse("Ah, das Heu, vielen lieben Dank. Bette und die anderen Reittiere wird es freuen. Ich kann euch nicht viel geben, aber ein verrückter Zwerg hat vor langer Zeit ein Goldnugget im Stall vergessen. Irgendwie werde ich das Gefühl nicht los, dass er etwas mit unserem Heumangel zu tun hat...");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(249, 10, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(234, 1, 699, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(125, "=", 2));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Cadomyr", "+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(125, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(249, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded a gold nugget."));
talkEntry:addResponse("Ah, the hay, thank you very much. Bette and the other mounts will be amused! I have not much I can give you, but long ago, a weird dwarf forgot a gold nugget in the stables. I cannot shake the feeling that he is somehow responsible for our lack of hay...");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(249, 10, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(234, 1, 699, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(125, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(125, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(249, "all", ">", 9, nil));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst ein Goldnugget."));
talkEntry:addResponse("Ah, das Heu, vielen lieben Dank. Bette und die anderen Reittiere wird es freuen. Ich kann euch nicht viel geben, aber ein verrückter Zwerg hat vor langer Zeit ein Goldnugget im Stall vergessen. Irgendwie werde ich das Gefühl nicht los, dass er etwas mit unserem Heumangel zu tun hat...");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(249, 10, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(234, 1, 699, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(125, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(125, "=", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("The mounts urgently need hay. All I am asking for is that you get ten bundles of grain for them.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(125, "=", 1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Die Reittiere brauchen dringend neues Heu. Alles, was ich also von euch für sie erbitte, sind zehn Bündel Getreide.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(125, "=", 1));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("The mounts urgently need hay. All I am asking for is that you get ten bundles of grain for them.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(125, "=", 1));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Die Reittiere brauchen dringend neues Heu. Alles, was ich also von euch für sie erbitte, sind zehn Bündel Getreide.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(125, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] The Royal Stables II"));
talkEntry:addResponse("Did you know what our mounts love the most? Carrots! And only a content mount can stride prouldy over the plains. Would you gather ten carrots for them, please?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(125, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(125, "=", 2));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Die königlichen Stallungen II"));
talkEntry:addResponse("Wußtet ihr, was unsere Reittiere am liebsten haben? Karotten! Und nur zufriedene Reittiere galoppieren stolz über die Ebenen. Würdet ihr bitte zehn Karotten für sie besorgen?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(125, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(125, "=", 2));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] The Royal Stables II"));
talkEntry:addResponse("Did you know what our mounts love the most? Carrots! And only a content mount can stride prouldy over the plains. Would you gather ten carrots for them, please?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(125, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(125, "=", 2));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Die königlichen Stallungen II"));
talkEntry:addResponse("Wußtet ihr, was unsere Reittiere am liebsten haben? Karotten! Und nur zufriedene Reittiere galoppieren stolz über die Ebenen. Würdet ihr bitte zehn Karotten für sie besorgen?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(125, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(125, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2493, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded fourty coppercoins. You advance in Queen Rosaline Edwards' favour."));
talkEntry:addResponse("You really brought some carrots for Bette and the other mounts. I thank you very, very much. Here, have my salary, you made the mounts happy, so you deserve it much more than I do.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 40));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2493, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(125, "=", 4));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Cadomyr", "+", 10));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(125, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2493, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst vierzig Kupferstücke. Dein Ansehen bei Königin Rosaline Edwards steigt."));
talkEntry:addResponse("Ihr habt wirklich Karotten für Bette und die anderen Reittiere gebracht. Ich danke euch vielmals dafür. Hier, nehmt meinen Lohn, ihr habt die Reittiere glücklich gemacht und verdient ihn mehr als ich.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 40));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2493, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(125, "=", 4));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Cadomyr", "+", 10));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(125, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2493, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded fourty coppercoins."));
talkEntry:addResponse("You really brought some carrots for Bette and the other mounts. I thank you very, very much. Here, have my salary, you made the mounts happy, so you deserve it much more than I do.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 40));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2493, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(125, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(125, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2493, "all", ">", 9, nil));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst vierzig Kupferstücke."));
talkEntry:addResponse("Ihr habt wirklich Karotten für Bette und die anderen Reittiere gebracht. Ich danke euch vielmals dafür. Hier, nehmt meinen Lohn, ihr habt die Reittiere glücklich gemacht und verdient ihn mehr als ich.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 40));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2493, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(125, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(125, "=", 3));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("The horses become nervous whenever I just mention the word 'carrot'. Perhaps you have the time to get ten carrots for them?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(125, "=", 3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Die Pferde wiehern aufgeregt wenn ich nur das Wort 'Karotte' erwähne. Vielleicht findet ihr ja die Zeit, zehn Karotten für sie besorgen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(125, "=", 3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("The horses become nervous whenever I just mention the word 'carrot'. Perhaps you have the time to get ten carrots for them?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(125, "=", 3));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Die Pferde wiehern aufgeregt wenn ich nur das Wort 'Karotte' erwähne. Vielleicht findet ihr ja die Zeit, zehn Karotten für sie besorgen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(125, "=", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Well, there nothing I need at this moment. Perhaps you ask Anthar Vilicon, the chancellor for services you could do to Cadomyr?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(125, "=", 4));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Nun, es gibt nichts, was ich derzeit bräuchte. Vielleicht fragt ihr den Kanzler Anthar Vilicon nach Diensten, die ihr Cadomyr leisten könntet?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(125, "=", 4));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("Well, there nothing I need at this moment. Perhaps you ask Anthar Vilicon, the chancellor for services you could do to Cadomyr?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(125, "=", 4));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Nun, es gibt nichts, was ich derzeit bräuchte. Vielleicht fragt ihr den Kanzler Anthar Vilicon nach Diensten, die ihr Cadomyr leisten könntet?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Rumpelstilzchen");
talkEntry:addResponse("Den Namen habe ich noch nie gehört. Wer soll das sein, ein Bäcker oder ein Brauer etwa?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Rumpelstiltskin");
talkEntry:addResponse("Never heard that name. Who is that supposed to be, a baker or a brewer?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("I feed the mounts. I care for them, I lend them to anyone who promises to treat them well.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Ich füttere die Reittiere hier. Ich kümmere mich um sie und leihe sie jedem, der verspricht, sie gut zu behandeln.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("I feed the mounts. I care for them, I lend them to anyone who promises to treat them well.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Ich füttere die Reittiere hier. Ich kümmere mich um sie und leihe sie jedem, der verspricht, sie gut zu behandeln.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mule");
talkEntry:addTrigger("donkey");
talkEntry:addTrigger("burden");
talkEntry:addResponse("Mules are rather frugal animals. They just need a little oat from time to time.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("feed");
talkEntry:addTrigger("food");
talkEntry:addTrigger("oat");
talkEntry:addResponse("Mules love oat! No wonder, they're related to horses.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Stable");
talkEntry:addResponse("Sometimes, I may care for proud destriers of noble knights, the other day for Bette and the other mules. I treat all of them well, all of them work hard for Cadomyr's honour.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("horse");
talkEntry:addTrigger("destrier");
talkEntry:addResponse("There are two differences between horses and mules: Longer legs and even more hunger for oat!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Maultier");
talkEntry:addTrigger("Muli");
talkEntry:addTrigger("Esel");
talkEntry:addTrigger("Lasttier");
talkEntry:addResponse("Maultiere sind recht genügsame Tiere. Sie brauchen nur hin und wieder etwas Hafer.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Futter");
talkEntry:addTrigger("Fütter");
talkEntry:addTrigger("Hafer");
talkEntry:addResponse("Maultiere lieben Hafer! Kein Wunder, sind sie doch mit Pferden verwandt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Stall");
talkEntry:addResponse("Manchmal darf ich mich um stolze Schlachrösser edler Ritter kümmern, an anderen Tagen um Bette und die anderen Maultiere. Ich behandle alle gleich gut, denn alle tragen ihren Teil zu Cadomyrs Ehre bei.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("pferd");
talkEntry:addTrigger("ross");
talkEntry:addResponse("Es gibt genau zwei Unterschiede zwischen Pferden und Maultieren: Längere Beine und noch mehr Hunger auf Hafer!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Queen");
talkEntry:addResponse("Queen Rosaline is a good sovereign. She rules just and fair, just like her father.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königin");
talkEntry:addResponse("Königin Rosaline ist eine gute Herrscherin. Sie regiert gerecht und weise, genau wie ihr Vater.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Queen Rosaline is a good sovereign. She rules just and fair, just like her father.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Königin Rosaline ist eine gute Herrscherin. Sie regiert gerecht und weise, genau wie ihr Vater.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("I have to admit: When Sir Reginald... passed away, I was a little afraid about the future. But Queen Rosaline drove away all my sorrows.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Ich gebe zu: Als Sir Reginald... nicht mehr war, da war ich etwas unsicher über die Zukunft. Aber Königin Rosaline hat alle meine Sorgen von mir genommen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("Willkommen in den Stallungen.", "Welcome to the stables.");
talkingNPC:addCycleText("Die Götter mögen die Königin schützen.", "Gods, save the queen.");
talkingNPC:addCycleText("#me hakt etwas Heu zusammen.", "#me rakes hay.");
talkingNPC:addCycleText("#me schüttet etwas Wasser in eine Tränke.", "#me pours some water into a water trough.");
talkingNPC:addCycleText("Meine kleine Schwester ist ein hübsches Mädchen.", "My little sister is a pretty pretty girl.");
talkingNPC:addCycleText("Seid ihr weit gereist und tun euch eure Füße weh?", "Have you walked for miles, are your feet hurting?");
talkingNPC:addCycleText("#me pfeift vor sich hin.", "#me whistles a song.");
talkingNPC:addCycleText("Cadomyr, oh Cadomyr, wie lieb ich dir!", "Cadomyr, O Cadomyr, how much I love you!");
talkingNPC:addCycleText("Bette? Wo ist denn Bette?", "Bette? Where is Bette?");
talkingNPC:addCycleText("#me öffnet einen Hafersack.", "#me opens a bag of oat.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(1);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Dieser NPC ist Alexis Dostas der Stallmeister.", "This NPC is Alexis Dostas the stablemaster.");
mainNPC:setUseMessage("Fasst mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut verwirrt.", "#me looks around confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 365);
mainNPC:setEquipment(11, 193);
mainNPC:setEquipment(5, 0);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 48);
mainNPC:setEquipment(9, 2114);
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
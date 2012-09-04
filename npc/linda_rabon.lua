--------------------------------------------------------------------------------
-- NPC Name: Linda Rabon                                              Cadomyr --
-- NPC Job:  Cook                                                             --
--                                                                            --
-- NPC Race: human                      NPC Position:  116, 577, 0            --
-- NPC Sex:  female                     NPC Direction: west                   --
--                                                                            --
-- Authors:  Regallo                                                          --
--           Estralis Seborian                                                --
--                                                                            --
-- Last parsing: September 04, 2012                       easyNPC Parser v1.2 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (0, 116, 577, 0, 6, 'Linda Rabon', 'npc.linda_rabon', 1, 1, 0, 238, 118, 33, 139, 90, 43);
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
module("npc.linda_rabon", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Linda Rabon the Cook. Keywords: Good day, quest, cook, Unicorn Lion, Hassan."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Linda Rabon die Köchin. Schlüsselwörter: Guten Tag, Quest, Koch, Einhörniger Löwe, Hassan."));
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
talkEntry:addResponse("If you want to order please talk to my father.");
talkEntry:addResponse("Oh hello. I'm very busy. I will have to talk to you later.");
talkEntry:addResponse("Oh hello. I'm so tired. I feel like I'm going to pass out.");
talkEntry:addResponse("Good day potential customers. How may I assist you today?");
talkEntry:addResponse("Welcome to the Unicorn Lion.");
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
talkEntry:addResponse("Falls ihr etwas bestellen wollt, sprecht mit meinem Vater.");
talkEntry:addResponse("Oh, hallo, ich bin gerade beschäftigt. Wir können nachher noch miteinander reden.");
talkEntry:addResponse("Oh hallo. Ich bin so müde. Ich kipp bald aus den Latschen.");
talkEntry:addResponse("Guten Tag, zukünftiger Kunde. Was kann ich für euch tun?");
talkEntry:addResponse("Willkommen im Einhörnigen Löwen.");
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
talkEntry:addResponse("If you want to order please talk to my father.");
talkEntry:addResponse("Oh hello. I'm very busy. I will have to talk to you later.");
talkEntry:addResponse("Oh hello. I'm so tired. I feel like I'm going to pass out.");
talkEntry:addResponse("Good day potential customers. How may I assist you today?");
talkEntry:addResponse("Welcome to the Unicorn Lion.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Falls ihr etwas bestellen wollt, sprecht mit meinem Vater.");
talkEntry:addResponse("Oh, hallo, ich bin gerade beschäftigt. Wir können nachher noch miteinander reden.");
talkEntry:addResponse("Oh hallo. Ich bin so müde. Ich kipp bald aus den Latschen.");
talkEntry:addResponse("Guten Tag, zukünftiger Kunde. Was kann ich für euch tun?");
talkEntry:addResponse("Willkommen im Einhörnigen Löwen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Oh, won't you please visit us again.");
talkEntry:addResponse("Anytime you think of dining please do not forget the Glass Spiegel");
talkEntry:addResponse("Goodbye beautiful person.");
talkEntry:addResponse("Please come again. I will cook better next time, I promise.");
talkEntry:addResponse("Oh, you're leaving already? Was the food bad?");
talkEntry:addResponse("Thank you, come again.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Oh, won't you please visit us again.");
talkEntry:addResponse("Anytime you think of dining please do not forget the Glass Spiegel");
talkEntry:addResponse("Goodbye beautiful person.");
talkEntry:addResponse("Please come again. I will cook better next time, I promise.");
talkEntry:addResponse("Oh, you're leaving already? Was the food bad?");
talkEntry:addResponse("Thank you, come again.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addResponse("Hahaha, I think I forgot what a real bad day looks like.");
talkEntry:addResponse("I am enjoying my day and you?");
talkEntry:addResponse("I think I'm a little bit sleepy, but how are you?");
talkEntry:addResponse("I feel like a thousand suns shineing upon a cloudless sky. Hehe, that's what father always says.");
talkEntry:addResponse("I'm very busy. No time to chit chat.");
talkEntry:addResponse("AHH! The chicken is on fire! Why would you try to talk to me while I'm cooking.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befind");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("I am Rose Rabon, the hostess for this restaurant.");
talkEntry:addResponse("I am Rose Rabon, mother and wife.");
talkEntry:addResponse("I am Rose the happy.");
talkEntry:addResponse("I'm Linda Rabon I may not look it, but I am the best cook in Cadomyr.");
talkEntry:addResponse("I am Linda. Haha, I'm sorry, you made a funny face.");
talkEntry:addResponse("I'm Linda, I'll cook you something special if you ask.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] A Noble Celebration I"));
talkEntry:addResponse("As you might know, Cadomyr is not blessed with much fertile farmland. Hence, the stables always lack hay. Could you please bring ten bundles of grain? My gratitude is guaranteed.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(126, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Eine edle Feier I"));
talkEntry:addResponse("Wie euch bekannt sein dürfte, ist Cadomyr nicht gerade mit fruchtbarem Ackerland gesegnet. Somit fehlt es in den Stallungen immer an Heu. Bringt ihr mir bitte zehn Bündel Getreide? Mein Dank ist euch gewiss.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(126, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] A Noble Celebration I"));
talkEntry:addResponse("As you might know, Cadomyr is not blessed with much fertile farmland. Hence, the stables always lack hay. Could you please bring ten bundles of grain? My gratitude is guaranteed.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(126, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Eine edle Feier I"));
talkEntry:addResponse("Wie euch bekannt sein dürfte, ist Cadomyr nicht gerade mit fruchtbarem Ackerland gesegnet. Somit fehlt es in den Stallungen immer an Heu. Bringt ihr mir bitte zehn Bündel Getreide? Mein Dank ist euch gewiss.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(126, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(249, "all", ">", 9));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded a gold nugget. You advance in Queen Rosaline Edwards' favour."));
talkEntry:addResponse("Ah, the hay, thank you very much. Bette and the other mounts will be amused! I have not much I can give you, but a weird dwarf forgot a gold nugget in the stables. I cannot shake the feeling that he is somehow responsible for our lack of hay...");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(249, 10));
talkEntry:addConsequence(npc.base.consequence.item.item(234, 1, 699, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(126, "=", 2));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Cadomyr", "+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(249, "all", ">", 9));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst ein Goldnugget. Dein Ansehen bei Königin Rosaline Edwards steigt."));
talkEntry:addResponse("Ah, das Heu, vielen lieben Dank. Bette und die anderen Reittiere wird es freuen. Ich kann euch nicht viel geben, aber ein verrückter Zwerg hat ein Goldnugget im Stall vergessen. Irgendwie werde ich das Gefühl nicht los, dass er etwas mit unserem Heumangel zu tun hat...");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(249, 10));
talkEntry:addConsequence(npc.base.consequence.item.item(234, 1, 699, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(126, "=", 2));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Cadomyr", "+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(249, "all", ">", 9));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded a gold nugget."));
talkEntry:addResponse("Ah, the hay, thank you very much. Bette and the other mounts will be amused! I have not much I can give you, but a weird dwarf forgot a gold nugget in the stables. I cannot shake the feeling that he is somehow responsible for our lack of hay...");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(249, 10));
talkEntry:addConsequence(npc.base.consequence.item.item(234, 1, 699, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(126, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(249, "all", ">", 9));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst ein Goldnugget."));
talkEntry:addResponse("Ah, das Heu, vielen lieben Dank. Bette und die anderen Reittiere wird es freuen. Ich kann euch nicht viel geben, aber ein verrückter Zwerg hat ein Goldnugget im Stall vergessen. Irgendwie werde ich das Gefühl nicht los, dass er etwas mit unserem Heumangel zu tun hat...");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(249, 10));
talkEntry:addConsequence(npc.base.consequence.item.item(234, 1, 699, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(126, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("The mounts urgently need hay. All I am asking for is that you get ten bundles of grain for them.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 1));
talkEntry:addResponse("Die Reittiere brauchen dringend neues Heu. Alles, was ich also von euch für sie erbitte, sind zehn Bündel Getreide.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 1));
talkEntry:addResponse("The mounts urgently need hay. All I am asking for is that you get ten bundles of grain for them.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addTrigger("Befehl");
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 1));
talkEntry:addResponse("Die Reittiere brauchen dringend neues Heu. Alles, was ich also von euch für sie erbitte, sind zehn Bündel Getreide.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] A Noble Celebration II"));
talkEntry:addResponse("Did you know what our mounts love the most? Carrots! And only a content mount can stride prouldy over the plains. Would you gather ten carrots for them, please?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(126, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Eine edle Feier II"));
talkEntry:addResponse("Wußtet ihr, was unsere Reittiere am liebsten haben? Karotten! Und nur zufriedene Reittiere galoppieren stolz über die Ebenen. Würdet ihr bitte zehn Karotten für sie besorgen?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(126, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] A Noble Celebration II"));
talkEntry:addResponse("Did you know what our mounts love the most? Carrots! And only a content mount can stride prouldy over the plains. Would you gather ten carrots for them, please?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(126, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Eine edle Feier II"));
talkEntry:addResponse("Wußtet ihr, was unsere Reittiere am liebsten haben? Karotten! Und nur zufriedene Reittiere galoppieren stolz über die Ebenen. Würdet ihr bitte zehn Karotten für sie besorgen?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(126, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2493, "all", ">", 9));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded fourty coppercoins. You advance in Queen Rosaline Edwards' favour."));
talkEntry:addResponse("You really brought some carrots for Bette and the other mounts. I thank you very, very much. Here, have my salary, you made the mounts happy, so you deserve it much more than I do.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 40));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2493, 10));
talkEntry:addConsequence(npc.base.consequence.quest.quest(126, "=", 4));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Cadomyr", "+", 10));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2493, "all", ">", 9));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst vierzig Kupferstücke. Dein Ansehen bei Königin Rosaline Edwards steigt."));
talkEntry:addResponse("Ihr habt wirklich Karotten für Bette und die anderen Reittiere gebracht. Ich danke euch vielmals dafür. Hier, nehmt meinen Lohn, ihr habt die Reittiere glücklich gemacht und verdient ihn mehr als ich.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 40));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2493, 10));
talkEntry:addConsequence(npc.base.consequence.quest.quest(126, "=", 4));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Cadomyr", "+", 10));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2493, "all", ">", 9));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded fourty coppercoins."));
talkEntry:addResponse("You really brought some carrots for Bette and the other mounts. I thank you very, very much. Here, have my salary, you made the mounts happy, so you deserve it much more than I do.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 40));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2493, 10));
talkEntry:addConsequence(npc.base.consequence.quest.quest(126, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2493, "all", ">", 9));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst vierzig Kupferstücke."));
talkEntry:addResponse("Ihr habt wirklich Karotten für Bette und die anderen Reittiere gebracht. Ich danke euch vielmals dafür. Hier, nehmt meinen Lohn, ihr habt die Reittiere glücklich gemacht und verdient ihn mehr als ich.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 40));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2493, 10));
talkEntry:addConsequence(npc.base.consequence.quest.quest(126, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 3));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("The horses become nervous whenever I just mention the word 'carrot'. Perhaps you have the time to get ten carrots for them?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 3));
talkEntry:addResponse("Die Pferde wiehern aufgeregt wenn ich nur das Wort 'Karotte' erwähne. Vielleicht findet ihr ja die Zeit, zehn Karotten für sie besorgen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 3));
talkEntry:addResponse("The horses become nervous whenever I just mention the word 'carrot'. Perhaps you have the time to get ten carrots for them?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 3));
talkEntry:addResponse("Die Pferde wiehern aufgeregt wenn ich nur das Wort 'Karotte' erwähne. Vielleicht findet ihr ja die Zeit, zehn Karotten für sie besorgen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] A Noble Celebration II"));
talkEntry:addResponse("Did you know what our mounts love the most? Carrots! And only a content mount can stride prouldy over the plains. Would you gather ten carrots for them, please?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(126, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 4));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Eine edle Feier II"));
talkEntry:addResponse("Wußtet ihr, was unsere Reittiere am liebsten haben? Karotten! Und nur zufriedene Reittiere galoppieren stolz über die Ebenen. Würdet ihr bitte zehn Karotten für sie besorgen?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(126, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 4));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] A Noble Celebration II"));
talkEntry:addResponse("Did you know what our mounts love the most? Carrots! And only a content mount can stride prouldy over the plains. Would you gather ten carrots for them, please?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(126, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 4));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Eine edle Feier II"));
talkEntry:addResponse("Wußtet ihr, was unsere Reittiere am liebsten haben? Karotten! Und nur zufriedene Reittiere galoppieren stolz über die Ebenen. Würdet ihr bitte zehn Karotten für sie besorgen?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(126, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2493, "all", ">", 9));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded fourty coppercoins. You advance in Queen Rosaline Edwards' favour."));
talkEntry:addResponse("You really brought some carrots for Bette and the other mounts. I thank you very, very much. Here, have my salary, you made the mounts happy, so you deserve it much more than I do.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 40));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2493, 10));
talkEntry:addConsequence(npc.base.consequence.quest.quest(126, "=", 6));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Cadomyr", "+", 15));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2493, "all", ">", 9));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst vierzig Kupferstücke. Dein Ansehen bei Königin Rosaline Edwards steigt."));
talkEntry:addResponse("Ihr habt wirklich Karotten für Bette und die anderen Reittiere gebracht. Ich danke euch vielmals dafür. Hier, nehmt meinen Lohn, ihr habt die Reittiere glücklich gemacht und verdient ihn mehr als ich.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 40));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2493, 10));
talkEntry:addConsequence(npc.base.consequence.quest.quest(126, "=", 6));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Cadomyr", "+", 15));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2493, "all", ">", 9));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded fourty coppercoins."));
talkEntry:addResponse("You really brought some carrots for Bette and the other mounts. I thank you very, very much. Here, have my salary, you made the mounts happy, so you deserve it much more than I do.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 40));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2493, 10));
talkEntry:addConsequence(npc.base.consequence.quest.quest(126, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2493, "all", ">", 9));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst vierzig Kupferstücke."));
talkEntry:addResponse("Ihr habt wirklich Karotten für Bette und die anderen Reittiere gebracht. Ich danke euch vielmals dafür. Hier, nehmt meinen Lohn, ihr habt die Reittiere glücklich gemacht und verdient ihn mehr als ich.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 40));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2493, 10));
talkEntry:addConsequence(npc.base.consequence.quest.quest(126, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 5));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("The horses become nervous whenever I just mention the word 'carrot'. Perhaps you have the time to get ten carrots for them?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 5));
talkEntry:addResponse("Die Pferde wiehern aufgeregt wenn ich nur das Wort 'Karotte' erwähne. Vielleicht findet ihr ja die Zeit, zehn Karotten für sie besorgen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 5));
talkEntry:addResponse("The horses become nervous whenever I just mention the word 'carrot'. Perhaps you have the time to get ten carrots for them?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 5));
talkEntry:addResponse("Die Pferde wiehern aufgeregt wenn ich nur das Wort 'Karotte' erwähne. Vielleicht findet ihr ja die Zeit, zehn Karotten für sie besorgen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 6));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Well, there nothing I need at this moment. Perhaps you ask Anthar Vilicon, the chancellor for services you could do to Cadomyr?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 6));
talkEntry:addResponse("Nun, es gibt nichts, was ich derzeit bräuchte. Vielleicht fragt ihr den Kanzler Anthar Vilicon nach Diensten, die ihr Cadomyr leisten könntet?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 6));
talkEntry:addResponse("Well, there nothing I need at this moment. Perhaps you ask Anthar Vilicon, the chancellor for services you could do to Cadomyr?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 6));
talkEntry:addResponse("Nun, es gibt nichts, was ich derzeit bräuchte. Vielleicht fragt ihr den Kanzler Anthar Vilicon nach Diensten, die ihr Cadomyr leisten könntet?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("You want to know what I do? I am the cook. I cook for the costumers when they visit our restaurant.");
talkEntry:addResponse("I am the cook here. My father is the waiter, and I get to talk to customers all day without taking orders.");
talkEntry:addResponse("I'm a cook. Well I'm the cook. I can make soups, boiled noodle leaf, breaded red sweet and my specialty is stew.");
talkEntry:addResponse("I make the food that you all eat.");
talkEntry:addResponse("Father says that I am part owner of this tavern.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("You want to know what I do? I am the cook. I cook for the costumers when they visit our restaurant.");
talkEntry:addResponse("I am the cook here. My father is the waiter, and I get to talk to customers all day without taking orders.");
talkEntry:addResponse("I'm a cook. Well I'm the cook. I can make soups, boiled noodle leaf, breaded red sweet and my specialty is stew.");
talkEntry:addResponse("I make the food that you all eat.");
talkEntry:addResponse("Father says that I am part owner of this tavern.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Unicorn");
talkEntry:addTrigger("Lion");
talkEntry:addResponse("You're at the Unicorn Lion. I know this may sound boastful, but I think we have the best tavern in Cadomyr.");
talkEntry:addResponse("Father and mother built this place.");
talkEntry:addResponse("I want to get married here.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Einhörnig");
talkEntry:addTrigger("Löwe");
talkEntry:addResponse("");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Daddy");
talkEntry:addTrigger("Severus");
talkEntry:addResponse("I love him. He's my life. This Restaurant is his dream and we built it together.");
talkEntry:addResponse("He says he is the best dad in Cadomyr. I agree with him. His is the best dad. And if anyone says he's not. Well, they get no dinner from me.");
talkEntry:addResponse("I wonder what daddy's going to get me for my birthday?");
talkEntry:addResponse("Daddy wishes he could be as good of a cook as me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Mommy");
talkEntry:addTrigger("Rose");
talkEntry:addResponse("Daddy used to be the cook and mommy the waitress, but since I am the best cook in Cadomyr. I am the cook, Daddy is the waitress, and Mommy greets people at the door.");
talkEntry:addResponse("Mommy says when I grow Up I'm going to be beautiful.");
talkEntry:addResponse("Mommy is too nice. She is even nice to mean people.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Pal");
talkEntry:addTrigger("Por");
talkEntry:addResponse("He's cute, don't you think?");
talkEntry:addResponse("I love when Pal plays. Even his songs are beautiful.");
talkEntry:addResponse("I wish he would tell stories too, but Pal never talks.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hassan");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("He rarely speaks. It's kind of weird. Don't you think?");
talkEntry:addResponse("He's so big. He picked me up once. I felt like I was touching the stars.");
talkEntry:addResponse("Did you know that Mr. Yang can play the Oboe. He plays it sometimes. You should ask him to play.");
talkEntry:addResponse("Mr Yang is very nice. Him and my mother never get mad.");
talkEntry:addResponse("He's so big. He used to have to duck to enter this place. My husband is so nice though. He made the entrance taller.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hassan");
talkEntry:addResponse("GERMAN");
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
talkEntry:addResponse("She should come try our food. I promise she will declare it the most delicious food in all of Cadomyr.");
talkEntry:addResponse("She is beautiful isn't she.");
talkEntry:addResponse("My mom says that Rosaline is very smart.");
talkEntry:addResponse("I want to be queen Rosaline when I grow up.");
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
talkEntry:addTrigger("albar");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("What is Albar?");
talkEntry:addResponse("Which way do I have to walk to go to Albar?");
talkEntry:addResponse("I'm too busy, stop telling me stuff I don't know.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I don't know where that is.");
talkEntry:addResponse("I'm trying to cook here, Yesh!");
talkEntry:addResponse("What is a Gynk?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("That place has a nice name, where is it?");
talkEntry:addResponse("Nope, I've never been to Saikamar.");
talkEntry:addResponse("I've never left Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("Gods? There is Oldra, Sirani and Adron.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Adron");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("The God of festivities and wine? Did I get it right?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Adron");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("He's a giant with a beard of fire. He is a good god.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I don't like Cherga. She's scary.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elara");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("The goddess of wisdom. That's all I know about her.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elara");
talkEntry:addResponse("");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eldan");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Mommy told me he has many forms, but he always carries a wooden pole.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eldan");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Findari");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("The goddess of air. She is very beautiful.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Findari");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("There is a picture of him over there *points to the wall*.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("He's the wolf god. I want a wolf. I'm going to ask daddy tonight if I can have a wolf.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Moshran");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I'm not afraid of old bone head. If he ever walks through these doors. I will punch him in the nose. Pow! Pow!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Moshran");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addTrigger("Nargùn");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("He is another bad one. People should make money honestly, like my mommya and daddy.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addTrigger("Nargùn");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oldra");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Oldra has to be the favorite god of any woman.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ronagan");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I'm sorry I have not made it to that god yet.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sirani");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I do not deserve it, I do not deserve it, I do not deserve it, but Sirani blessed me. I don't know why. Somethimes at night when I think about how in love I am I start crying.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I'm sorry I have not made it to that god yet.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ushara");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I'm sorry I have not made it to that god yet.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zhambra");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I'm sorry I have not made it to that god yet.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zhambra");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Linda");
talkEntry:addTrigger("Rabon");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Good day, how are you?");
talkEntry:addResponse("Today is a great day for cooking.");
talkEntry:addResponse("That is me. Do you want something.");
talkEntry:addResponse("Oh, did you need something?");
talkEntry:addResponse("That is me.");
talkEntry:addResponse("Hello. I am Linda Rabon. I would be glad to help you with anything that you need.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Linda");
talkEntry:addTrigger("Rabon");
talkEntry:addResponse("Einen guten Tag, wie geht es euch?");
talkEntry:addResponse("Heute ist ein guter Tag zum Kochen.");
talkEntry:addResponse("Das bin ich. Was benötigt ihr?");
talkEntry:addResponse("Oh, braucht ihr etwas?");
talkEntry:addResponse("Das bin ich.");
talkEntry:addResponse("Hallo, ich bin Linda Rabon. Ich helfe euch gerne weiter.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("I did not say anything.");
talkEntry:addResponse("I don't believe I asked a yes or no question.");
talkEntry:addResponse("Wait what?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("Hab ich was gesagt?");
talkEntry:addResponse("Hab ich irgendwas gefragt?");
talkEntry:addResponse("Wie jetzt?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("I did not say anything.");
talkEntry:addResponse("I don't believe I asked a yes or no question.");
talkEntry:addResponse("Wait what?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("Hab ich was gesagt?");
talkEntry:addResponse("Hab ich irgendwas gefragt?");
talkEntry:addResponse("Wie jetzt?");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("Feuer und Glut, das wird gut, Bier und Wein, das wird fein.", "Salt, spice, everything nice, beer, wine everthing fine.");
talkingNPC:addCycleText("Heute koche ich was Besonderes. Dafür brauche ich flambierte Schnecken, Pfeffer aus dem Elsbaumwald, Saft der Sauerampfer und noch drei weitere Dinge, die ich euch aber nicht verrate. Das wird klasse!", "Today I am cooking a unique dish. It requires snails lightly touched in flame, pepper from the Elstree forest, juice from a sour fruit, and like three other things I can't tell you. This is going to be good.");
talkingNPC:addCycleText("Irgendwann versuche ich nochmal, Lesen zu lernen. Ich koche einfach zu viel.", "One of these days I'm going to try and learn to read a book. It's just that all my time goes to cooking.");
talkingNPC:addCycleText("Hassan! Trink nicht wieder so viel!", "Hassan! Don't drink too much!");
talkingNPC:addCycleText("Diese Leute essen einfach viel zu schnell.", "These people eat to fast.");
talkingNPC:addCycleText("Ich frage mich, ob es sowas wie Kochschulen gibt. Ich wäre eine klasse Lehrerin.", "I wonder if there are schools for cooking. I would be the best teacher ever.");
talkingNPC:addCycleText("Wenn ihr fragen habt, kommt einfach zu mir. Es ist meine Aufgabe, sie zu beantworten.", "If you have any questions please come to me. It is my job to answer them if that's alright with you.");
talkingNPC:addCycleText("Willkommen im Einhörnigen Löwen.", "Welcome to the Unicorn Lion.");
talkingNPC:addCycleText("Kommt doch gerne mal wieder in den Einhörnigen Löwen. Wir würden euch sonst sehr vermissen.", "Please come visit us again at the Unicorn Lion. We miss your presence.");
talkingNPC:addCycleText("Hier im Einhörnigen Löwen gibt es den besten Eintopf von ganz Cadomyr.", "Here at the Unicorn Lion we have the best stew in all of Cadomyr.");
talkingNPC:addCycleText("Hier sieht es mal wieder aus... Vater sollte mal wieder wischen.", "This place is starting to be a mess. I should make father mop this place up.");
talkingNPC:addCycleText("Jedes mal, wenn der Geruch meines Eintopfs mir in die Nase steigt, lacht mein Herz.", "Every time I smell a stew I have cooked my heart smiles.");
talkingNPC:addCycleText("Oh, entschuldigt, ich wollte euch nicht in die Quere kommen.", "Oh sorry, excuse me. I did not mean to get in your way.");
talkingNPC:addCycleText("Was soll ich nur Vater zum Geburtstag schenken?", "I wonder what I should get father for his birthday.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(1);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Dieser NPC ist Linda Rabon die Köchin.", "This NPC is Linda Rabon the Cook.");
mainNPC:setUseMessage("Fass mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut dich verwirrt an.", "#me looks at you confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 803);
mainNPC:setEquipment(11, 0);
mainNPC:setEquipment(5, 227);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 0);
mainNPC:setEquipment(9, 0);
mainNPC:setEquipment(10, 369);
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
--------------------------------------------------------------------------------
-- NPC Name: Linda Rabon                                              Cadomyr --
-- NPC Job:  Cook                                                             --
--                                                                            --
-- NPC Race: human                      NPC Position:  116, 576, 0            --
-- NPC Sex:  female                     NPC Direction: west                   --
--                                                                            --
-- Authors:  Regallo                                                          --
--           Estralis Seborian                                                --
--                                                       easyNPC Parser v1.21 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (0, 116, 576, 0, 6, 'Linda Rabon', 'npc.linda_rabon', 1, 1, 0, 238, 118, 33, 139, 90, 43);
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
talkEntry:addTrigger("Good night");
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
talkEntry:addTrigger("Guten Morgen");
talkEntry:addTrigger("Guten Tag");
talkEntry:addTrigger("Guten Abend");
talkEntry:addTrigger("Gute Nacht");
talkEntry:addTrigger("Mahlzeit");
talkEntry:addTrigger("Tach");
talkEntry:addTrigger("Moin");
talkEntry:addTrigger("Mohltied");
talkEntry:addResponse("Falls ihr etwas bestellen wollt, sprecht mit meinem Vater.");
talkEntry:addResponse("Oh, hallo, ich bin gerade beschäftigt. Wir können nachher noch miteinander reden.");
talkEntry:addResponse("Oh hallo. Ich bin so müde. Ich kipp bald aus den Latschen.");
talkEntry:addResponse("Guten Tag, zukünftiger Kunde. Was kann ich für euch tun?");
talkEntry:addResponse("Willkommen im Einhörnigen Löwen.");
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
talkEntry:addResponse("Anytime you think of dining please do not forget the Unicorn Lion.");
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
talkEntry:addResponse("Oh, kommt doch bitte bald wieder.");
talkEntry:addResponse("Immer, wenn ihr Hunger verspürt, denkt doch an den Einhörnigen Löwen.");
talkEntry:addResponse("Kommt doch bitte wieder, ich koche dann auch besser, versprochen.");
talkEntry:addResponse("Ihr geht schon? War das Essen nicht gut?");
talkEntry:addResponse("Danke, schaut doch wieder rein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Oh, won't you please visit us again.");
talkEntry:addResponse("Anytime you think of dining please do not forget the Glass Spiegel");
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
talkEntry:addResponse("Oh, kommt doch bitte bald wieder.");
talkEntry:addResponse("Immer, wenn ihr Hunger verspürt, denkt doch an den Einhörnigen Löwen.");
talkEntry:addResponse("Kommt doch bitte wieder, ich koche dann auch besser, versprochen.");
talkEntry:addResponse("Ihr geht schon? War das Essen nicht gut?");
talkEntry:addResponse("Danke, schaut doch wieder rein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addResponse("Haha, I think I forgot what a real bad day looks like.");
talkEntry:addResponse("I am enjoying my day and you?");
talkEntry:addResponse("I think I'm a little bit sleepy, but how are you?");
talkEntry:addResponse("I feel like a thousand suns shineing upon a cloudless sky.");
talkEntry:addResponse("I'm very busy. No time to chat.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befind");
talkEntry:addResponse("Hach, ich weiß schon gar nicht mehr, wie sich ein schlechter Tag anfühlt.");
talkEntry:addResponse("Heute ist ein toller Tag.");
talkEntry:addResponse("Ich bin ein bisschen müde, wie geht es euch?");
talkEntry:addResponse("Ich hab die Sonne im Herzen.");
talkEntry:addResponse("Ich bin etwas beschäftigt und kann jetzt nicht plaudern.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("I am Linda Rabon, the cook for this tavern.");
talkEntry:addResponse("I am Linda Rabon, Severus' daughter.");
talkEntry:addResponse("I'm Linda Rabon. I may not look it, but I am the best cook in Cadomyr.");
talkEntry:addResponse("I am Linda. Haha, I'm sorry, you made a funny face.");
talkEntry:addResponse("I'm Linda, I'll cook you something special if you ask.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ihr name");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Ich bin Linda Rabon, die Köchin dieser Taverne.");
talkEntry:addResponse("Ich bin Linda Rabon, die Tochter des Severus.");
talkEntry:addResponse("Ich bin Linda Rabon. Es mag nicht so aussehen, aber ich bin Cadomyrs beste Köchin.");
talkEntry:addResponse("Ich bin Linda. Haha, entschuldigt, aber ihr seht lustig aus.");
talkEntry:addResponse("Ich bin Linda und ich koche euch was besonders gutes, wenn ihr darum bittet.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] A Noble Celebration I"));
talkEntry:addResponse("Oh, you want to help me? A celebration of noble men is scheduled in the Unicorn Lion and nothing is prepared, my dear! We lack five sets of cutlery, please get them.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(126, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 0));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Eine edle Feier I"));
talkEntry:addResponse("Oh, ihr wollt mirhelfen? Edelleute wollen eine Feier im Einhörnigen Löwen abhalten und es ist nichts vorbereitet! Uns fehlen fünf Gedecke Besteck, könntet ihr die bitte besorgen?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(126, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 0));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] A Noble Celebration I"));
talkEntry:addResponse("Oh, you want to help me? A celebration of noble men is scheduled in the Unicorn Lion and nothing is prepared, my dear! We lack five sets of cutlery, please get them.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(126, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 0));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Eine edle Feier I"));
talkEntry:addResponse("Oj, ihr wollt mirhelfen? Edelleute wollen eine Feier im Einhörnigen Löwen abhalten und es ist nichts vorbereitet! Uns fehlen fünf Gedecke Besteck, könntet ihr die bitte besorgen?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(126, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2647, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 20 silver coins. You advance in Queen Rosaline Edwards' favour."));
talkEntry:addResponse("Cutlery, great! I mean, shall noble men dine with their hands? Thank you! We don't have much, but take these coins as compensation.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 2000));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2647, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(126, "=", 2));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2647, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 20 Silberstücke. Dein Ansehen bei Königin Rosaline Edwards steigt."));
talkEntry:addResponse("Bestecke, wunderbar! Ich meine, sollen Edelleute etwa mit der Hand essen? Danke! Wir haben nicht viel, aber nehmt diese Münzen als Bezahlung.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 2000));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2647, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(126, "=", 2));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2647, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 20 silver coins."));
talkEntry:addResponse("Cutlery, great! I mean, shall noble men dine with their hands? Thank you! We don't have much, but take these coins as compensation.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 2000));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2647, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(126, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2647, "all", ">", 4, nil));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 20 Silberstücke."));
talkEntry:addResponse("Bestecke, wunderbar! Ich meine, sollen Edelleute etwa mit der Hand essen? Danke! Wir haben nicht viel, aber nehmt diese Münzen als Bezahlung.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 2000));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2647, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(126, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("The celebration of the noble men is anytime soon - please, we need the five sets of cutlery.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Die Feier der Edelleute ist schon bald - bitte, holt doch die fünf Gedecke Besteck.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 1));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("The celebration of the noble men is anytime soon - please, we need the five sets of cutlery.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 1));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Die Feier der Edelleute ist schon bald - bitte, holt doch die fünf Gedecke Besteck.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] A Noble Celebration II"));
talkEntry:addResponse("We still don't have all the things we need for the noblemen's celebration. We want to serve best wine from Albar, but we lack suitable wine glasses? Will you bring me five of them?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(126, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 2));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Eine edle Feier II"));
talkEntry:addResponse("Wir haben noch immer nicht alles für die Feier der Edelleute beisammen. Wir wollen besten Wein aus Albar ausschenken, aber wir haben keine Weingläser. Bringt doch bitte fünf davon.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(126, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 2));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] A Noble Celebration II"));
talkEntry:addResponse("We still don't have all the things we need for the noblemen's celebration. We want to serve best wine from Albar, but we lack suitable wine glasses? Will you bring me five of them?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(126, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 2));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Eine edle Feier II"));
talkEntry:addResponse("Wir haben noch immer nicht alles für die Feier der Edelleute beisammen. Wir wollen besten Wein aus Albar ausschenken, aber wir haben keine Weingläser. Bringt doch bitte fünf davon.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(126, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2457, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 20 silver coins. You advance in Queen Rosaline Edwards' favour."));
talkEntry:addResponse("Noblemen don't drink from buckets! You are my hero. Just one thing is missing for the celebration, perhaps you can help me with that order as well.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 2000));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2457, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(126, "=", 4));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 10));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2457, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 20 Silberstücke. Dein Ansehen bei Königin Rosaline Edwards steigt."));
talkEntry:addResponse("Edelleute trinken nunmal nicht aus Kübeln! Ihr seid mein Held. Jetzt fehlt nur noch eine Sache für die Feier. Vielleicht könnt ihr mir bei diesem Auftrag auch helfen.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 2000));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2457, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(126, "=", 4));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 10));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2457, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 20 silver coins."));
talkEntry:addResponse("Noblemen don't drink from buckets! You are my hero. Just one thing is missing for the celebration, perhaps you can help me with that order as well.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 2000));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2457, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(126, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2457, "all", ">", 4, nil));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 20 Silberstücke."));
talkEntry:addResponse("Edelleute trinken nunmal nicht aus Kübeln! Ihr seid mein Held. Jetzt fehlt nur noch eine Sache für die Feier. Vielleicht könnt ihr mir bei diesem Auftrag auch helfen.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 2000));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2457, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(126, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 3));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("We need five wine glasses as soon as possible. Hurry! The noblemen cannot drink from buckets.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Wir brauchen fünf Weingläser so schnell es geht. Los! Die Edelleute können doch nicht aus Kübeln saufen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("We need five wine glasses as soon as possible. Hurry! The noblemen cannot drink from buckets.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 3));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Wir brauchen fünf Weingläser so schnell es geht. Los! Die Edelleute können doch nicht aus Kübeln saufen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] A Noble Celebration III"));
talkEntry:addResponse("The last thing that is missing is the most important one for dining: wooden plates. We need, again, five wooden plates and something tells me you will bring them to us.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(126, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 4));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Eine edle Feier III"));
talkEntry:addResponse("Das Letzte, was uns noch fehlt, ist das Wichtigste für ein Gelage: Holzteller. Wir brauchen erneut fünf davon und irgendwas sagt mir, dass ihr sie uns bringen werdet.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(126, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 4));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] A Noble Celebration III"));
talkEntry:addResponse("The last thing that is missing is the most important one for dining: wooden plates. We need, again, five wooden plates and something tells me you will bring them to us.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(126, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 4));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Eine edle Feier III"));
talkEntry:addResponse("Das Letzte, was uns noch fehlt, ist das Wichtigste für ein Gelage: Holzteller. Wir brauchen erneut fünf davon und irgendwas sagt mir, dass ihr sie uns bringen werdet.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(126, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2952, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded a ruby amulet. You advance in Queen Rosaline Edwards' favour."));
talkEntry:addResponse("I am so relieved, now we have plates for the noblemen. Let's get the celebration started! I give you one of the few items my mother gave to me before... a trinket. Keep it safe, will you?");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2952, 5, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(67, 1, 677, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(126, "=", 6));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 15));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2952, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst ein Rubinamulet. Dein Ansehen bei Königin Rosaline Edwards steigt."));
talkEntry:addResponse("Ich bin ja so erleichtert, jetzt haben wir endlich Teller für die Edelleute. Die Feier kann beginnen! Ich gebe euch eines der wenigen Dingen, die mir meine Mutter hinterließ als sie... Ein Schmuckstück. Passt darauf auf, bitte.");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2952, 5, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(67, 1, 677, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(126, "=", 6));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 15));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2952, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded a ruby amulet."));
talkEntry:addResponse("I am so relieved, now we have plates for the noblemen. Let's get the celebration started! I give you one of the few items my mother gave to me before... a trinket. Keep it safe, will you?");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2952, 5, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(67, 1, 677, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(126, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2952, "all", ">", 4, nil));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst ein Rubinamulet."));
talkEntry:addResponse("Ich bin ja so erleichtert, jetzt haben wir endlich Teller für die Edelleute. Die Feier kann beginnen! Ich gebe euch eines der wenigen Dingen, die mir meine Mutter hinterließ als sie... Ein Schmuckstück. Passt darauf auf, bitte.");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2952, 5, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(67, 1, 677, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(126, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 5));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Oh dear, we really need those five plates. Please get them from a carpenter.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 5));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Ohje, wir brauchen diese fünf Teller wirklich schnell. Besorgt sie doch bitte von einem Schreiner.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 5));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("Oh dear, we really need those five plates. Please get them from a carpenter.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 5));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Ohje, wir brauchen diese fünf Teller wirklich schnell. Holt sie doch bitte von einem Schreiner.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 6));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Oh, well, you cannot help me. But I can help you: ask father for a stew, it will taste good to you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 6));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Oh, nun, ihr könnt mir nicht helfen. Aber ich kann euch helfen: Fragt Vater nach einem Eintopf, er wird euch schmecken.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 6));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("Oh, well, you cannot help me. But I can help you: ask father for a stew, it will taste good to you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(126, "=", 6));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Oh, nun, ihr könnt mir nicht helfen. Aber ich kann euch helfen: Fragt Vater nach einem Eintopf, er wird euch schmecken.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addTrigger("cook");
talkEntry:addResponse("You want to know what I do? I am the cook. I cook for the costumers when they visit our tavern.");
talkEntry:addResponse("I am the cook here. My father is the waiter, and I get to talk to customers all day without taking orders.");
talkEntry:addResponse("I'm a cook. Well, I'm the cook. I can make soups, boiled noodle leaf, breaded red sweet and my specialty is stew.");
talkEntry:addResponse("I make the food that you all eat.");
talkEntry:addResponse("Father says that I am part owner of this tavern.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addTrigger("Koch");
talkEntry:addTrigger("Köchin");
talkEntry:addResponse("Was ich mache? Ich bin die Köchin. Ich koche für die Gäste der Taverne.");
talkEntry:addResponse("Ich bin hier die Köchin. Mein Vater bedient und ich kann den ganzen Tag mit der Kundschaft reden ohne Bestellungen aufnehmen zu müssen.");
talkEntry:addResponse("Ich bin eine Köchin. Naja, ich bin die Köchin. Ich kann Suppen und Nudeln kochen, Panieren und meine Spezialität ist der Eintopf.");
talkEntry:addResponse("Ich mach hier das Essen.");
talkEntry:addResponse("Vater sagt, dass ich nun Teilhaber der Taverne bin.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("You want to know what I do? I am the cook. I cook for the costumers when they visit our tavern.");
talkEntry:addResponse("I am the cook here. My father is the waiter, and I get to talk to customers all day without taking orders.");
talkEntry:addResponse("I'm a cook. Well I'm the cook. I can make soups, boiled noodle leaf, breaded red sweet and my specialty is stew.");
talkEntry:addResponse("I make the food that you all eat.");
talkEntry:addResponse("Father says that I am part owner of this tavern.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Was ich mache? Ich bin die Köchin. Ich koche für die Gäste der Taverne.");
talkEntry:addResponse("Ich bin hier die Köchin. Mein Vater bedient und ich kann den ganzen Tag mit der Kundschaft reden ohne Bestellungen aufnehmen zu müssen.");
talkEntry:addResponse("Ich bin eine Köchin. Naja, ich bin die Köchin. Ich kann Suppen und Nudeln kochen, Panieren und meine Spezialität ist der Eintopf.");
talkEntry:addResponse("Ich mach hier das Essen.");
talkEntry:addResponse("Vater sagt, dass ich nun Teilhaber der Taverne bin.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Unicorn");
talkEntry:addTrigger("Lion");
talkEntry:addResponse("You're at the Unicorn Lion. I know this may sound boastful, but I think we have the best tavern in Cadomyr.");
talkEntry:addResponse("Father and mother built this place.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Einhörnig");
talkEntry:addTrigger("Löwe");
talkEntry:addResponse("Ihr befindet euch im Einhörnigen Löwen. Es mag vermessen klingen, aber dies ist die beste Taverne in Cadomyr.");
talkEntry:addResponse("Vater und Mutter haben dieses Haus gebaut.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Father");
talkEntry:addTrigger("Daddy");
talkEntry:addResponse("This tavern is his dream and we run it together.");
talkEntry:addResponse("He says he is the best father in Cadomyr. And if anyone says he's not, well, they get no dinner from me.");
talkEntry:addResponse("I wonder what father is going to get me for my birthday?");
talkEntry:addResponse("Father wishes he could be as good of a cook as me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Vater");
talkEntry:addTrigger("Papa");
talkEntry:addResponse("Diese Taverne ist sein Traum und wir betreiben sie zusammen.");
talkEntry:addResponse("Er sagt, er sei der beste Vater in Cadomyr. Und wenn jemand das Gegenteil behauptet, dann kriegt er von mir nichts zu essen.");
talkEntry:addResponse("Ich frage mich, was ich von Vater zum Geburtstag kriege.");
talkEntry:addResponse("Vater wünschte, er könne so gut kochen wie ich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Severus");
talkEntry:addResponse("This tavern is his dream and we run it together.");
talkEntry:addResponse("He says he is the best father in Cadomyr. And if anyone says he's not, well, they get no dinner from me.");
talkEntry:addResponse("I wonder what father is going to get me for my birthday?");
talkEntry:addResponse("Father wishes he could be as good of a cook as me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Severus");
talkEntry:addResponse("Diese Taverne ist sein Traum und wir betreiben sie zusammen.");
talkEntry:addResponse("Er sagt, er sei der beste Vater in Cadomyr. Und wenn jemand das Gegenteil behauptet, dann kriegt er von mir nichts zu essen.");
talkEntry:addResponse("Ich frage mich, was ich von Vater zum Geburtstag kriege.");
talkEntry:addResponse("Vater wünschte, er könne so gut kochen wie ich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Mommy");
talkEntry:addTrigger("Mother");
talkEntry:addResponse("Father used to be the cook and mother the waitress, but since mother is no more...");
talkEntry:addResponse("Mother used to say when I grow up I'm going to be beautiful.");
talkEntry:addResponse("Mother was too nice. She was even nice to mean people.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Mama");
talkEntry:addTrigger("Mutter");
talkEntry:addResponse("Vater war der Koch und Mutter hat bedient, aber da Mutter nun von uns gegangen ist...");
talkEntry:addResponse("Mutter hat immer gesagt, wenn ich mal groß bin, werde ich hübsch sein.");
talkEntry:addResponse("Mutter war immer so nett, sie war sogar zu bösen Leuten nett.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Rose");
talkEntry:addResponse("Father used to be the cook and mother the waitress, but since mother is no more...");
talkEntry:addResponse("Mother used to say when I grow up I'm going to be beautiful.");
talkEntry:addResponse("Mother was too nice. She was even nice to mean people.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Rose");
talkEntry:addResponse("Vater war der Koch und Mutter hat bedient, aber da Mutter nun von uns gegangen ist...");
talkEntry:addResponse("Mutter hat immer gesagt, wenn ich mal groß bin, werde ich hübsch sein.");
talkEntry:addResponse("Mutter war immer so nett, sie war sogar zu bösen Leuten nett.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hassan");
talkEntry:addResponse("He's cute, don't you think?");
talkEntry:addResponse("I wish he would tell stories, but Hassan never talks.");
talkEntry:addResponse("He rarely speaks. It's kind of weird. Don't you think?");
talkEntry:addResponse("He's so big. He picked me up once. I felt like I was touching the stars.");
talkEntry:addResponse("He's so big. He used to have to duck to enter this place. My father is so nice though. He made the entrance taller.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hassan");
talkEntry:addResponse("Er ist süß, nicht wahr?");
talkEntry:addResponse("Ich wünschte, er würde manchmal Geschichten erzählen, aber Hassan redet nicht gerne.");
talkEntry:addResponse("Er spricht nur selten. Merkwürdig, oder?");
talkEntry:addResponse("Er ist so groß! Er hat mich einmal hochgehoben. Es fühlte sich an, als könnte ich die Sterne berühren.");
talkEntry:addResponse("Er ist so groß! Er mußte sich früher immer bücken, um durch die Tür zu kommen. Mein Vater hat dann netterweise den Türrahmen höher gemacht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Queen");
talkEntry:addResponse("She should come try our food. I promise she will declare it the most delicious food in all of Cadomyr.");
talkEntry:addResponse("She is beautiful isn't she.");
talkEntry:addResponse("My mother used to say that Rosaline is very smart.");
talkEntry:addResponse("I want to be like queen Rosaline when I grow up.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königin");
talkEntry:addResponse("Sie sollte mal herkommen und bei uns essen. Ich bin mir sicher, sie wird uns zu Hoflieferanten ernennen.");
talkEntry:addResponse("Sie ist ziemlich hübsch, nicht wahr?");
talkEntry:addResponse("Meine Mutter hat immer gesagt, Rosaline ist ziemlich schlau.");
talkEntry:addResponse("Ich will wie Königin Rosaline sein, wenn ich groß bin.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("She should come try our food. I promise she will declare it the most delicious food in all of Cadomyr.");
talkEntry:addResponse("She is beautiful isn't she.");
talkEntry:addResponse("My mother used to say that Rosaline is very smart.");
talkEntry:addResponse("I want to be like queen Rosaline when I grow up.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Sie sollte mal herkommen und bei uns essen. Ich bin mir sicher, sie wird uns zu Hoflieferanten ernennen.");
talkEntry:addResponse("Sie ist ziemlich hübsch, nicht wahr?");
talkEntry:addResponse("Meine Mutter hat immer gesagt, Rosaline ist ziemlich schlau.");
talkEntry:addResponse("Ich will wie Königin Rosaline sein, wenn ich groß bin.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("albar");
talkEntry:addResponse("What is Albar?");
talkEntry:addResponse("Which way do I have to walk to go to Albar?");
talkEntry:addResponse("I'm too busy, stop telling me stuff I don't know.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("Was ist ein Albar?");
talkEntry:addResponse("Wolang geht es denn nach Albar?");
talkEntry:addResponse("Ich bin beschäftigt, erzählt mir nichts, was ich nicht weiß.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addResponse("I don't know where that is.");
talkEntry:addResponse("I'm trying to cook here, yesh!");
talkEntry:addResponse("What is a Gynk?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("Ich weiß nicht, wo das ist.");
talkEntry:addResponse("Ich versuche, zu kochen, verdammt.");
talkEntry:addResponse("Was ist ein Gynk?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("salkama");
talkEntry:addResponse("That place has a nice name, where is it?");
talkEntry:addResponse("Nope, I've never been to Salkamar.");
talkEntry:addResponse("I've never left Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Das klingt nett, wo ist das?");
talkEntry:addResponse("Ne, ich war noch nie in Salkamar.");
talkEntry:addResponse("Ich habe Cadomyr noch nie verlassen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Adron");
talkEntry:addResponse("The God of festivities and wine? Did I get it right?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Adron");
talkEntry:addResponse("Der Gott der Feste und des Weines? Habe ich das richtig verstanden?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addResponse("He's a giant with a beard of fire. He is a good god.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addResponse("Er ist ein Riese mit einem Feuerbart. Er ist ein guter Gott.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cherga");
talkEntry:addResponse("I don't like Cherga. She's scary.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addResponse("Ich mag Cherga nicht. Sie macht mir Angst.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elara");
talkEntry:addResponse("The goddess of wisdom. That's all I know about her.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elara");
talkEntry:addResponse("Die Göttin der Weisheit, mehr weiß ich nicht über sie.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Eldan");
talkEntry:addResponse("Mother told me he has many forms, but he always carries a wooden pole.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eldan");
talkEntry:addResponse("Mutter hat mir einst gesagt, dass er in vielen Gestalten auftritt, aber immer einen Holzstab bei sich trägt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Findari");
talkEntry:addResponse("The goddess of air. She is very beautiful.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Findari");
talkEntry:addResponse("Die Luftgöttin ist sehr schön.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("There is a picture of him over there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("Da drüben hängt ein Bild von ihm.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addResponse("He's the wolf god. I want a wolf. I'm going to ask father tonight if I can have a wolf.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addResponse("Man nennt ihn auch den Wolfgott. Ich will auch einen Wolf. Ich frag Vater nachher, ob ich einen Wolf haben kann.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Moshran");
talkEntry:addResponse("I'm not afraid of old bone head. If he ever walks through these doors, I will punch him in the nose.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Moshran");
talkEntry:addResponse("Ich fürchte mich nicht vor dem ollen Knochenkopp. Wenn er jemals durch diese Tür kommt, kriegt er was auf die Nase.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addTrigger("Nargùn");
talkEntry:addResponse("He is another bad one.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addTrigger("Nargùn");
talkEntry:addResponse("Noch so ein Fiesling.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("Oldra has to be the favourite god of any woman.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("Oldra ist die Lieblingsgötting aller Frauen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("I'm sorry I have not made it to that god yet.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("Entschuldigt, über diesen Gott weiß ich nichts.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("I do not deserve it, but Sirani blessed me. I don't know why. Sometimes at night when I think about how in love I am I start crying.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("Ich habe es nicht verdient, aber Sirani hat mich gesegnet. Ich weiß auch nicht, warum. Manchmal wache ich nachts auf und weine, weil ich so verliebt bin.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("I'm sorry I have not made it to that god yet.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("Entschuldigt, über diesen Gott weiß ich nichts.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("I'm sorry I have not made it to that god yet.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("Entschuldigt, über diesen Gott weiß ich nichts.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Zhambra");
talkEntry:addResponse("I'm sorry I have not made it to that god yet.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zhambra");
talkEntry:addResponse("Entschuldigt, über diesen Gott weiß ich nichts.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Linda");
talkEntry:addTrigger("Rabon");
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

function receiveText(npcChar, texttype, message, speaker) mainNPC:receiveText(npcChar, texttype, speaker, message); end;
function nextCycle(npcChar) mainNPC:nextCycle(npcChar); end;
function lookAtNpc(npcChar, char, mode) mainNPC:lookAt(npcChar, char, mode); end;
function useNPC(npcChar, char) mainNPC:use(npcChar, char); end;
initNpc();
initNpc = nil;
-- END
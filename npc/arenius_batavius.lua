--------------------------------------------------------------------------------
-- NPC Name: Arenius Batavius                                         Cadomyr --
-- NPC Job:  Crusader                                                         --
--                                                                            --
-- NPC Race: human                      NPC Position:  86, 586, 0             --
-- NPC Sex:  male                       NPC Direction: south                  --
--                                                                            --
-- Author:   Estralis Seborian                                                --
--                                                                            --
-- Last parsing: August 18, 2012                          easyNPC Parser v1.2 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (0, 86, 586, 0, 4, 'Arenius Batavius', 'npc.arenius_batavius', 0, 2, 3, 192, 107, 5, 191, 139, 97);
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
module("npc.arenius_batavius", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(104, ">", 35));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Error] Something went wrong, please inform a developer."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is the crusader Arenius Batavius. Keyphrases: Hello, quest, profession, crusader, order, orcs, cult, Cherga."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist der Kreuzritter Arenius Batavius. Schlüsselwörter: Hallo, Quest, Beruf, Kreuzritter, Orden, Orks, Kult, Cherga."));
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
talkEntry:addResponse("Hail! A noble knight I was, defeated I am. Listen to my tale of the evil cult of blood mages.");
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
talkEntry:addResponse("Seid gegrüßt! Einst war ich ein edler Ritter, nun liege ich im Staub. Horcht meiner Geschichte über einen bösen Kult von Blutmagiern.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hail! A noble knight I was, defeated I am. Listen to my tale of the evil cult of blood mages.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Seid gegrüßt! Einst war ich ein edler Ritter, nun liege ich im Staub. Horcht meiner Geschichte über einen bösen Kult von Blutmagiern.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Go with godspeed. And spread the old customs where you can.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Gehet mit dem Segen der Götter. Und verbreitet die alten Sitten überall, wo ihr könnt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Go with godspeed. And spread the old customs where you can.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Gehet mit dem Segen der Götter. Und verbreitet die alten Sitten überall, wo ihr könnt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("I underestimated my enemy and I have paid for it, barely made it out alive. Will you continue with my glorious endeavours?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addResponse("Ich habe meinen Feind unterschätzt und dafür bezahlt - ich bin froh, mit dem Leben davongekommen zu sein. Werdet ihr meine ehrbaren Taten vollenden?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("My name is Arenius Batavius. I came to this land not too long ago, but only misfortune I have received. Please stranger, will you help me in my crusade?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Mein Name ist Arenius Batavius. Ich weile erst seit kurzem in diesen Landen, aber nur Unglück ist mir widerfahren. Bitte, werdet ihr mir auf meinem Kreuzzug beiseite stehen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("message");
talkEntry:addTrigger("news");
talkEntry:addTrigger("letter");
talkEntry:addTrigger("scroll");
talkEntry:addTrigger("parchment");
talkEntry:addCondition(npc.base.condition.quest.quest(108, "=", 6));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest status] Delayed Mail III: You deliver the message from Hector Valerion to Arenius Batavius."));
talkEntry:addResponse("#me reads the scroll: 'This is even worse than I thought. The Cult of Salavesh has committed more sins than I thought. Thank you for the information.'");
talkEntry:addConsequence(npc.base.consequence.quest.quest(108, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("nachricht");
talkEntry:addTrigger("brief");
talkEntry:addTrigger("Botschaft");
talkEntry:addTrigger("Schriftrolle");
talkEntry:addTrigger("Pergament");
talkEntry:addCondition(npc.base.condition.quest.quest(108, "=", 6));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Queststatus] Späte Post III: Du überbringst Arenius Batavius die Nachricht von Hector Valerion."));
talkEntry:addResponse("#me ließt die Schriftrolle: 'Es ist schlimmer, als ich dachte. Der Kult der Salavesh hat noch mehr gesündigt, als ich dachte. Danke für die Informationen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(108, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hector");
talkEntry:addTrigger("Valerion");
talkEntry:addCondition(npc.base.condition.quest.quest(108, "=", 6));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest status] Delayed Mail III: You deliver the message from Hector Valerion to Arenius Batavius."));
talkEntry:addResponse("#me reads the scroll: 'This is even worse than I thought. The Cult of Salavesh has committed more sins than I thought. Thank you for the information.'");
talkEntry:addConsequence(npc.base.consequence.quest.quest(108, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hector");
talkEntry:addTrigger("Valerion");
talkEntry:addCondition(npc.base.condition.quest.quest(108, "=", 6));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Queststatus] Späte Post III: Du überbringst Arenius Batavius die Nachricht von Hector Valerion."));
talkEntry:addResponse("#me ließt die Schriftrolle: 'Es ist schlimmer, als ich dachte. Der Kult der Salavesh hat noch mehr gesündigt, als ich dachte. Danke für die Informationen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(108, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(104, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] The Errant Crusade I"));
talkEntry:addResponse("Stranger, before I can tell you about the evil Cult of Salavesh, please bring me half a dozen panels of white cloth so I can tend the wounds I received from my recent battle with the cultists.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(104, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(104, "=", 0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Der fehlgeleitete Kreuzzug I"));
talkEntry:addResponse("Fremder, bevor ich euch über den bösen Kult der Salavesh berichten kann, bringt mir bitte ein halbes Dutzend weiße Stoffbahnen, damit ich meine Wunden vom letzten Kampf mit den Kultisten versorgen kann.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(104, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(104, "=", 0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] The Errant Crusade I"));
talkEntry:addResponse("Stranger, before I can tell you about the evil Cult of Salavesh, please bring me half a dozen panels of white cloth so I can tend the wounds I received from my recent battle with the cultists.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(104, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(104, "=", 0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Der fehlgeleitete Kreuzzug I"));
talkEntry:addResponse("Fremder, bevor ich euch über den bösen Kult der Salavesh berichten kann, bringt mir bitte ein halbes Dutzend weiße Stoffbahnen, damit ich meine Wunden vom letzten Kampf mit den Kultisten versorgen kann.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(104, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(104, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(178, "all", ">", 5));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 60 copper coins. You advance in Queen Rosaline Edwards's favour."));
talkEntry:addResponse("Thank you for the bandages. Here, this should cover your expenses. Now I can tell you about the mission that I failed in.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 60));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(178, 6));
talkEntry:addConsequence(npc.base.consequence.quest.quest(104, "=", 2));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Cadomyr", "+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(104, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(178, "all", ">", 5));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 60 Kupferstücke. Dein Ansehen bei Königin Rosaline Edwards steigt."));
talkEntry:addResponse("Danke für die Bandagen. Hier, nehmt dies als Aufwandsentschädigung. Nun kann ich euch über die Mission berichten, auf der ich so kläglich versagte.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 60));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(178, 6));
talkEntry:addConsequence(npc.base.consequence.quest.quest(104, "=", 2));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Cadomyr", "+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(104, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(178, "all", ">", 5));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 60 copper coins."));
talkEntry:addResponse("Thank you for the bandages. Here, this should cover your expenses. Now I can tell you about the mission that I failed in.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 60));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(178, 6));
talkEntry:addConsequence(npc.base.consequence.quest.quest(104, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(104, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(178, "all", ">", 5));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 60 Kupferstücke."));
talkEntry:addResponse("Danke für die Bandagen. Hier, nehmt dies als Aufwandsentschädigung. Nun kann ich euch über die Mission berichten, auf der ich so kläglich versagte.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 60));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(178, 6));
talkEntry:addConsequence(npc.base.consequence.quest.quest(104, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(104, "=", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("My wounds continue to bleed, please bring me half a dozen panels of white cloth to tend them.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(104, "=", 1));
talkEntry:addResponse("Meine Wunden haben erneut zu bluten begonnen. Bringt mir mir bitte ein halbes Dutzend weiße Stoffbahnen, um sie zu versorgen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(104, "=", 1));
talkEntry:addResponse("My wounds continue to bleed, please bring me half a dozen panels of white cloth to tend them.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(104, "=", 1));
talkEntry:addResponse("Meine Wunden haben erneut zu bluten begonnen. Bringt mir mir bitte ein halbes Dutzend weiße Stoffbahnen, um sie zu versorgen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(104, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] The Errant Crusade II"));
talkEntry:addResponse("In order to stop the foul deeds of the Cult of Salavesh, intelligence is needed. Set out and find the stronghold! If you find it, slay half a dozen of its undead minions and bring back exemplary remains for investigation.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(104, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(104, "=", 2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Der fehlgeleitete Kreuzzug II"));
talkEntry:addResponse("Um dem Kult der Salavesh das Handwerk zu legen ist zunächst Aufklärung erforderlich. Gehet hin und findet den Unterschlupf! Streckt dort wenigstens ein halbes Dutzend der untoten Diener nieder und bringt mir ihre Überreste, damit ich sie untersuchen kann.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(104, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(104, "=", 2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] The Errant Crusade II"));
talkEntry:addResponse("In order to stop the foul deeds of the Cult of Salavesh, intelligence is needed. Set out and find the stronghold! If you find it, slay half a dozen of its undead minions and bring back exemplary remains for investigation.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(104, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(104, "=", 2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Der fehlgeleitete Kreuzzug II"));
talkEntry:addResponse("Um dem Kult der Salavesh das Handwerk zu legen ist zunächst Aufklärung erforderlich. Gehet hin und findet den Unterschlupf! Streckt dort wenigstens ein halbes Dutzend der untoten Diener nieder und bringt mir ihre Überreste, damit ich sie untersuchen kann.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(104, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(104, "=", 9));
talkEntry:addCondition(npc.base.condition.item.item(63, "all", ">", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 60 copper coins and a mace. You advance in Queen Rosaline Edwards's favour."));
talkEntry:addResponse("#me inspects the entrails: 'Just what I assumed - blood magic! Here, have this mace, it will help you on the next part of the mission.'");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 60));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(63, 1));
talkEntry:addConsequence(npc.base.consequence.item.item(230, 1, 588, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(104, "=", 10));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Cadomyr", "+", 10));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(104, "=", 9));
talkEntry:addCondition(npc.base.condition.item.item(63, "all", ">", 0));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 60 Kupferstücke und einen Streitkolben. Dein Ansehen bei Königin Rosaline Edwards steigt."));
talkEntry:addResponse("#me untersucht die Eingeweide: 'Hab ich es mir doch gedacht! Blutmagie! Hier, nehmt diesen Streitkolben, er wird euch auf der nächsten Mission gute Dienste erweisen.'");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 60));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(63, 1));
talkEntry:addConsequence(npc.base.consequence.item.item(230, 1, 588, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(104, "=", 10));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Cadomyr", "+", 10));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(104, "=", 9));
talkEntry:addCondition(npc.base.condition.item.item(63, "all", ">", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 60 copper coins and a mace."));
talkEntry:addResponse("#me inspects the entrails: 'Just what I assumed - blood magic! Here, have this mace, it will help you on the next part of the mission'.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 60));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(63, 1));
talkEntry:addConsequence(npc.base.consequence.item.item(230, 1, 588, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(104, "=", 10));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(104, "=", 9));
talkEntry:addCondition(npc.base.condition.item.item(63, "all", ">", 0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 60 Kupferstücke und einen Streitkolben."));
talkEntry:addResponse("#me untersucht die Eingeweide: 'Hab ich es mir doch gedacht! Blutmagie! Hier, nehmt diesen Streitkolben, er wird euch auf der nächsten Mission gute Dienste erweisen.'");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 60));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(63, 1));
talkEntry:addConsequence(npc.base.consequence.item.item(230, 1, 588, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(104, "=", 10));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(104, ">", 2));
talkEntry:addCondition(npc.base.condition.quest.quest(104, "<", 9));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Please, avenge my defeat. Head for the stronghold of the Cult of Salavesh and smite half a dozen of its minions. Come back with their remains.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(104, ">", 2));
talkEntry:addCondition(npc.base.condition.quest.quest(104, "<", 9));
talkEntry:addResponse("Bitte rächt meine Niederlage. Gehet zum Unterschlupf des Kultes der Salavesh und streckt ein halbes Dutzend ihrer Diener nieder. Kommt zu mit mir ihren Überresten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(104, ">", 2));
talkEntry:addCondition(npc.base.condition.quest.quest(104, "<", 9));
talkEntry:addResponse("Please, avenge my defeat. Head for the stronghold of the Cult of Salavesh and smite half a dozen of its minions. Come back with their remains.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(104, ">", 2));
talkEntry:addCondition(npc.base.condition.quest.quest(104, "<", 9));
talkEntry:addResponse("Bitte rächt meine Niederlage. Gehet zum Unterschlupf des Kultes der Salavesh und streckt ein halbes Dutzend ihrer Diener nieder. Kommt zu mit mir ihren Überresten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(104, "=", 9));
talkEntry:addCondition(npc.base.condition.item.item(63, "all", "<", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("You are back, alive! But I cannot see any remains of the undead minions; I can gather much information from their entrails.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(104, "=", 9));
talkEntry:addCondition(npc.base.condition.item.item(63, "all", "<", 1));
talkEntry:addResponse("Ihr seid zurück und am Leben! Aber ihr habt keine Überreste der untoten Diener dabei; die meisten Informationen kann ich aus ihren Eingeweiden ablesen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(104, "=", 9));
talkEntry:addCondition(npc.base.condition.item.item(63, "all", "<", 1));
talkEntry:addResponse("You are back, alive! But I cannot see any remains of the undead minions; I can gather much information from their entrails.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(104, "=", 9));
talkEntry:addCondition(npc.base.condition.item.item(63, "all", "<", 1));
talkEntry:addResponse("Ihr seid zurück und am Leben! Aber ihr habt keine Überreste der untoten Diener dabei; die meisten Informationen kann ich aus ihren Eingeweiden ablesen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(104, "=", 10));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] The Errant Crusade III"));
talkEntry:addResponse("It is about time to land a strike against the Cult of Salavesh. Head for its stronghold again and smite a dozen of the animated skeletons to teach them a lesson not to mess with the Order of the Silver Dragon!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(104, "=", 11));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(104, "=", 10));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Der fehlgeleitete Kreuzzug III"));
talkEntry:addResponse("Es wird Zeit, dem Kult der Salavesh klarzumachen, dass man sich nicht mit dem Orden der Silberdrachen anlegt. Zieht aus und zerschlagt ein Dutzend ihrer wiederbelebten Skelette.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(104, "=", 11));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(104, "=", 10));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] The Errant Crusade III"));
talkEntry:addResponse("It is about time to land a strike against the Cult of Salavesh. Head for its stronghold again and smite a dozen of the animated skeletons to teach them a lesson not to mess with the Order of the Silver Dragon!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(104, "=", 11));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(104, "=", 10));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Der fehlgeleitete Kreuzzug III"));
talkEntry:addResponse("Es wird Zeit, dem Kult der Salavesh klarzumachen, dass man sich nicht mit dem Orden der Silberdrachen anlegt. Zieht aus und zerschlagt ein Dutzend ihrer wiederbelebten Skelette.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(104, "=", 11));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(104, "=", 23));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 120 copper coins and a silvered longsword. You advance in Queen Rosaline Edwards's favour."));
talkEntry:addResponse("I hope you taught the cultists a lesson they won't forget any time soon. I am glad that I can trust you and give you my sword. Use it wisely during the next mission.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 120));
talkEntry:addConsequence(npc.base.consequence.item.item(98, 1, 688, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(104, "=", 25));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Cadomyr", "+", 10));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(104, "=", 23));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 120 Kupferstücke und ein versilbertes Langschwert. Dein Ansehen bei Königin Rosaline Edwards steigt."));
talkEntry:addResponse("Ich hoffe ihr habt diesen Kultisten eine Lektion erteilt, die sie so schnell nicht vergessen werden. Ich freue mich, dass ich euch vertrauen kann. Nehmt mein Schwert und nutzt es weise während der nächsten Mission.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 120));
talkEntry:addConsequence(npc.base.consequence.item.item(98, 1, 688, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(104, "=", 25));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Cadomyr", "+", 10));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(104, "=", 23));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 120 copper coins and silvered longsword."));
talkEntry:addResponse("I hope you taught the cultists a lesson they won't forget any time soon. I am glad that I can trust you and give you my sword. Use it wisely during the next mission.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 120));
talkEntry:addConsequence(npc.base.consequence.item.item(98, 1, 688, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(104, "=", 25));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(104, "=", 23));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 120 Kupferstücke und ein versilbertes Langschwert."));
talkEntry:addResponse("Ich hoffe ihr habt diesen Kultisten eine Lektion erteilt, die sie so schnell nicht vergessen werden. Ich freue mich, dass ich euch vertrauen kann. Nehmt mein Schwert und nutzt es weise während der nächsten Mission.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 120));
talkEntry:addConsequence(npc.base.consequence.item.item(98, 1, 688, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(104, "=", 25));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(104, ">", 10));
talkEntry:addCondition(npc.base.condition.quest.quest(104, "<", 23));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Lo! What are you waiting for? The Cult of Salavesh continues its foul deeds, head for its stronghold and smite a dozen of its animated skeletons.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(104, ">", 10));
talkEntry:addCondition(npc.base.condition.quest.quest(104, "<", 23));
talkEntry:addResponse("Auf was wartet ihr! Der Kult der Salavesh treibt noch immer sein Unwesen, zieht aus zum Unterschlupf und erledigt ein Dutzend ihrer wiederbelebten Skelette.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(104, ">", 10));
talkEntry:addCondition(npc.base.condition.quest.quest(104, "<", 23));
talkEntry:addResponse("Lo! What are you waiting for? The Cult of Salavesh continues its foul deeds, head for its stronghold and smite a dozen of its animated skeletons.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(104, ">", 10));
talkEntry:addCondition(npc.base.condition.quest.quest(104, "<", 23));
talkEntry:addResponse("Auf was wartet ihr! Der Kult der Salavesh treibt noch immer sein Unwesen, zieht aus zum Unterschlupf und erledigt ein Dutzend ihrer wiederbelebten Skelette.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(104, "=", 25));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] The Errant Crusade IV"));
talkEntry:addResponse("While you were slaying the undead minions, I got word from a traveller that the Cult of Salavesh is preparing a foul ritual. Stop the blood mages who prepare the ritual, commonly, these cultists work as couples.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(104, "=", 26));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(104, "=", 25));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Der fehlgeleitete Kreuzzug IV"));
talkEntry:addResponse("Während ihr den Untoten Dienern den Garaus machtet, verriet mir ein Reisender, dass der Kult der Salavesh wohl ein dunkles Ritual vorbereitet. Stoppt die Blutmagier, die dieses Ritual durchführen wollen - meist arbeiten sie zu zweit.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(104, "=", 26));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(104, "=", 25));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] The Errant Crusade IV"));
talkEntry:addResponse("While you were slaying the undead minions, I got word from a traveller that the Cult of Salavesh is preparing a foul ritual. Stop the blood mages who prepare the ritual, commonly, these cultists work as couples.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(104, "=", 26));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(104, "=", 25));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Der fehlgeleitete Kreuzzug IV"));
talkEntry:addResponse("Während ihr den Untoten Dienern den Garaus machtet, verriet mir ein Reisender, dass der Kult der Salavesh wohl ein dunkles Ritual vorbereitet. Stoppt die Blutmagier, die dieses Ritual durchführen wollen - meist arbeiten sie zu zweit.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(104, "=", 26));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(104, "=", 28));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 200 copper coins and an albarian soldier's helmet. You advance in Queen Rosaline Edwards's favour."));
talkEntry:addResponse("#me nods briefly while listening to the report of the events in the cave and replies: 'One good day for all of us. Here, have my helmet, you'll need it more than me during your next mission.'");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 200));
talkEntry:addConsequence(npc.base.consequence.item.item(2287, 1, 788, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(104, "=", 29));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Cadomyr", "+", 15));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(104, "=", 28));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 200 Kupferstücke und einen albarischen Soldatenhelm. Dein Ansehen bei Königin Rosaline Edwards steigt."));
talkEntry:addResponse("#me nickt knapp während er dem Bericht über die Ereignisse in der Höhle lauscht und antwortet: 'Ein guter Tag für uns alle. Hier, nehmt meinen Helm, er wird euch mehr nützen als mir während eurer nächsten Mission.'");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 200));
talkEntry:addConsequence(npc.base.consequence.item.item(2287, 1, 788, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(104, "=", 29));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Cadomyr", "+", 15));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(104, "=", 28));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 200 copper coins and an albarian soldier's helmet."));
talkEntry:addResponse("#me nods briefly while listening to the report of the events in the cave and replies: 'One good day for all of us. Here, have my helmet, you'll need it more than me during your next mission.'");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 200));
talkEntry:addConsequence(npc.base.consequence.item.item(2287, 1, 788, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(104, "=", 29));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(104, "=", 28));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 200 Kupferstücke und einen albarischen Soldatenhelm."));
talkEntry:addResponse("#me nickt knapp während er dem Bericht über die Ereignisse in der Höhle lauscht und antwortet: 'Ein guter Tag für uns alle. Hier, nehmt meinen Helm, er wird euch mehr nützen als mir während eurer nächsten Mission.'");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 200));
talkEntry:addConsequence(npc.base.consequence.item.item(2287, 1, 788, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(104, "=", 29));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(104, ">", 25));
talkEntry:addCondition(npc.base.condition.quest.quest(104, "<", 28));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Quick! With every minute passing, the blood mages can continue preparing their foul art. Slay both of them in the stronghold of the Cult of Salavesh!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(104, ">", 25));
talkEntry:addCondition(npc.base.condition.quest.quest(104, "<", 28));
talkEntry:addResponse("Rasch! Mit jeder Minute, die vergeht, können die Blutmagier ihre Untaten fortsetzen. Erschlagt sie beide im Unterschlupf des Kultes der Salavesh!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(104, ">", 25));
talkEntry:addCondition(npc.base.condition.quest.quest(104, "<", 28));
talkEntry:addResponse("Quick! With every minute passing, the blood mages can continue preparing their foul art. Slay both of them in the stronghold of the Cult of Salavesh!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(104, ">", 25));
talkEntry:addCondition(npc.base.condition.quest.quest(104, "<", 28));
talkEntry:addResponse("Rasch! Mit jeder Minute, die vergeht, können die Blutmagier ihre Untaten fortsetzen. Erschlagt sie beide im Unterschlupf des Kultes der Salavesh!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(104, "=", 29));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] The Errant Crusade V"));
talkEntry:addResponse("I sent a boy to the library; he found a shocking scroll. According to this, the Cult of Salavesh once awakened a demonic skeleton to serve them. Return to the cave and if you find this beast, end its existance.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(104, "=", 30));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(104, "=", 29));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Der fehlgeleitete Kreuzzug V"));
talkEntry:addResponse("Ich habe einen Jungen in die Bibliothek geschickt; er kam mit einer schockierenden Schriftrolle zurück. Darin steht geschrieben, dass der Kult der Salavesh einst ein dämonisches Skelett erwecket, um ihnen zu dienen. Kehrt in in die Höhle zurück und wenn ihr dieses Unwesen findet, beendet sein Dasein.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(104, "=", 30));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(104, "=", 29));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] The Errant Crusade V"));
talkEntry:addResponse("I sent a boy to the library; he found a shocking scroll. According to this, the Cult of Salavesh once awakened a demonic skeleton to serve them. Return to the cave and if you find this beast, end its existance.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(104, "=", 30));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(104, "=", 29));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Der fehlgeleitete Kreuzzug V"));
talkEntry:addResponse("");
talkEntry:addConsequence(npc.base.consequence.quest.quest(104, "=", 30));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(104, "=", 31));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 500 copper coins and a steel tower shield. You advance in Queen Rosaline Edwards's favour."));
talkEntry:addResponse("Great! How much I love it when evil falls! I give you my shield; bear it with honour. But I give it to you for a reason; to complete my mission.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 500));
talkEntry:addConsequence(npc.base.consequence.item.item(96, 1, 888, 51));
talkEntry:addConsequence(npc.base.consequence.quest.quest(104, "=", 32));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Cadomyr", "+", 15));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(104, "=", 31));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 500 Kupferstücke und einen Stahlturmschild. Dein Ansehen bei Königin Rosaline Edwards steigt."));
talkEntry:addResponse("Großartig! Ich liebe es, wenn das Böse daniederliegt. Ich gebe euch meinen Schild, tragt ihn mit Würde. Aber ich gebe ihn euch nicht grundlos, sondern um meine Mission zu vollenden.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 500));
talkEntry:addConsequence(npc.base.consequence.item.item(96, 1, 888, 51));
talkEntry:addConsequence(npc.base.consequence.quest.quest(104, "=", 32));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Cadomyr", "+", 15));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(104, "=", 31));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 500 copper coins and a steel tower shield."));
talkEntry:addResponse("Great! How much I love it when evil falls! I give you my shield; bear it with honour. But I give it to you for a reason; to complete my mission.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 500));
talkEntry:addConsequence(npc.base.consequence.item.item(96, 1, 888, 51));
talkEntry:addConsequence(npc.base.consequence.quest.quest(104, "=", 32));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(104, "=", 31));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 500 Kupferstücke und einen Stahlturmschild."));
talkEntry:addResponse("Großartig! Ich liebe es, wenn das Böse daniederliegt. Ich gebe euch meinen Schild, tragt ihn mit Würde. Aber ich gebe ihn euch nicht grundlos, sondern um meine Mission zu vollenden.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 500));
talkEntry:addConsequence(npc.base.consequence.item.item(96, 1, 888, 51));
talkEntry:addConsequence(npc.base.consequence.quest.quest(104, "=", 32));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(104, ">", 29));
talkEntry:addCondition(npc.base.condition.quest.quest(104, "<", 31));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Demon skeletons are powerful beings; I understand you hesitate to face it. But if the Cult of Salavesh hosts such a monster, it has to be slain!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(104, ">", 29));
talkEntry:addCondition(npc.base.condition.quest.quest(104, "<", 31));
talkEntry:addResponse("Dämonenskelette sind mächtige Feinde; ich verstehe, wenn ihr zögert, euch ihm zu stellen. Aber wenn der Kult der Salavesh wirklich so ein Wesen beherbergt, dann muss es abgeschlachtet werden!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(104, ">", 29));
talkEntry:addCondition(npc.base.condition.quest.quest(104, "<", 31));
talkEntry:addResponse("Demon skeletons are powerful beings; I understand you hesitate to face it. But if the Cult of Salavesh hosts such a monster, it has to be slain!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(104, ">", 29));
talkEntry:addCondition(npc.base.condition.quest.quest(104, "<", 31));
talkEntry:addResponse("Dämonenskelette sind mächtige Feinde; ich verstehe, wenn ihr zögert, euch ihm zu stellen. Aber wenn der Kult der Salavesh wirklich so ein Wesen beherbergt, dann muss es abgeschlachtet werden!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(104, "=", 32));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] The Errant Crusade VI"));
talkEntry:addResponse("I studied the scroll the boy found thoroughly; and I came to the conclusion that the demon skeleton must have been guarding something. May it be the source of all evil? Set out and eliminate it!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(104, "=", 33));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(104, "=", 32));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Der fehlgeleitete Kreuzzug VI"));
talkEntry:addResponse("Ich habe die Schriftrolle, die der Junge gefunden hat, gründlichst studiert und bin zu dem Schluss gekommen, dass das Dämonenskelett etwas bewacht haben muss. Etwas die Quelle allen Übels? Zieht aus und eleminiert sie!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(104, "=", 33));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(104, "=", 32));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] The Errant Crusade VI"));
talkEntry:addResponse("I studied the scroll the boy found thoroughly; and I came to the conclusion that the demon skeleton must have been guarding something. May it be the source of all evil? Set out and eliminate it!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(104, "=", 33));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(104, "=", 32));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Der fehlgeleitete Kreuzzug VI"));
talkEntry:addResponse("Ich habe die Schriftrolle, die der Junge gefunden hat, gründlichst studiert und bin zu dem Schluss gekommen, dass das Dämonenskelett etwas bewacht haben muss. Etwas die Quelle allen Übels? Zieht aus und eleminiert sie!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(104, "=", 33));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(104, "=", 34));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 2000 copper coins and an albarian noble's armour. You advance in Queen Rosaline Edwards's favour."));
talkEntry:addResponse("You did what! You ended the life of one of the most noble creatures of Illarion? How you dare! How... did I dare to send you on this mission. I have to resign as knight of the Order of the Silver Dragon - I surrender my armour and my belongings to you.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 2000));
talkEntry:addConsequence(npc.base.consequence.item.item(2367, 1, 988, 72));
talkEntry:addConsequence(npc.base.consequence.quest.quest(104, "=", 35));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Cadomyr", "+", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(104, "=", 34));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 2000 Kupferstücke und eine albarische Adeligenrüstung. Dein Ansehen bei Königin Rosaline Edwards steigt."));
talkEntry:addResponse("Ihr habt was getan? Ihr habt das Leben eines der edelsten Kreaturen von ganz Illarion beendet? Was fällt euch ein! Was... fiel mir ein, euch auf diese Mission zu schicken. Ich werde als Ritter des Ordens der Silberdrachen abdanken müssen. Ich überantworte euch meine Rüstung und meinen weltlichen Besitz.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 2000));
talkEntry:addConsequence(npc.base.consequence.item.item(2367, 1, 988, 72));
talkEntry:addConsequence(npc.base.consequence.quest.quest(104, "=", 35));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Cadomyr", "+", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(104, "=", 34));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 2000 copper coins and an albarian noble's armour."));
talkEntry:addResponse("You did what! You ended the life of one of the most noble creatures of Illarion? How you dare! How... did I dare to send you on this mission. I have to resign as knight of the Order of the Silver Dragon - I surrender my armour and my belongings to you.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 2000));
talkEntry:addConsequence(npc.base.consequence.item.item(2367, 1, 988, 72));
talkEntry:addConsequence(npc.base.consequence.quest.quest(104, "=", 35));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(104, "=", 34));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 2000 Kupferstücke und eine albarische Adeligenrüstung."));
talkEntry:addResponse("Ihr habt was getan? Ihr habt das Leben eines der edelsten Kreaturen von ganz Illarion beendet? Was fällt euch ein! Was... fiel mir ein, euch auf diese Mission zu schicken. Ich werde als Ritter des Ordens der Silberdrachen abdanken müssen. Ich überantworte euch meine Rüstung und meinen weltlichen Besitz.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 2000));
talkEntry:addConsequence(npc.base.consequence.item.item(2367, 1, 988, 72));
talkEntry:addConsequence(npc.base.consequence.quest.quest(104, "=", 35));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(104, ">", 32));
talkEntry:addCondition(npc.base.condition.quest.quest(104, "<", 34));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I am convinced that the demon skeleton guarded the source of all blood magic of the Cult of Salavesh. I command you to destroy it, whatever it is!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(104, ">", 32));
talkEntry:addCondition(npc.base.condition.quest.quest(104, "<", 34));
talkEntry:addResponse("Ich bin davon überzeugt, dass das Dämonenskelett die Quelle der Blutmagie des Kultes der Salavesh bewacht hat. Ich befehle euch, sie zu zerstören, was auch immer es ist!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(104, ">", 32));
talkEntry:addCondition(npc.base.condition.quest.quest(104, "<", 34));
talkEntry:addResponse("I am convinced that the demon skeleton guarded the source of all blood magic of the Cult of Salavesh. I command you to destroy it, whatever it is!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(104, ">", 32));
talkEntry:addCondition(npc.base.condition.quest.quest(104, "<", 34));
talkEntry:addResponse("Ich bin davon überzeugt, dass das Dämonenskelett die Quelle der Blutmagie des Kultes der Salavesh bewacht hat. Ich befehle euch, sie zu zerstören, was auch immer es ist!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(104, "=", 35));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Now that you stopped the foul deeds of the Cult of Salavesh, there is nothing you can do for me, for I am battered and lost in this world. So, set out to new adventures!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(104, "=", 35));
talkEntry:addResponse("Nun, da ihr dem niederträchtigen Kult der Salavesh das Handwerk gelegt habt, gibt es nichts, was ihr für mich tun könntet, denn ich bin geschlagen und fehl am Platz auf dieser Welt. Ihr, auf zu neuen Abenteuern!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(104, "=", 35));
talkEntry:addResponse("Now that you stopped the foul deeds of the Cult of Salavesh, there is nothing you can do for me, for I am battered and lost in this world. So, set out to new adventures!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(104, "=", 35));
talkEntry:addResponse("Nun, da ihr dem niederträchtigen Kult der Salavesh das Handwerk gelegt habt, gibt es nichts, was ihr für mich tun könntet, denn ich bin geschlagen und fehl am Platz auf dieser Welt. Ihr, auf zu neuen Abenteuern!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("I am a crusader of the Order of the Silver Dragon. I came to these lands to stop the foul deeds of an evil Cult - but I failed. Will you finish my mission?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Ich bin ein Kreuzritter des Ordens der Silberdrachen. Ich bin in dieses Land gekommen um einem bösen Kult das Handwerk zu legen - aber ich habe versagt. Werdet ihr meine Mission vollenden?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I am a crusader of the Order of the Silver Dragon. I came to these lands to stop the foul deeds of an evil Cult - but I failed. Will you finish my mission?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Ich bin ein Kreuzritter des Ordens der Silberdrachen. Ich bin in dieses Land gekommen um einem bösen Kult das Handwerk zu legen - aber ich habe versagt. Werdet ihr meine Mission vollenden?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("crusade");
talkEntry:addTrigger("knight");
talkEntry:addResponse("Us knights of the Order of the Silver Dragon fight what is not according to the old customs where we find it. And in these lands, there is plenty opportunity to do so.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ritter");
talkEntry:addTrigger("kreuzzug");
talkEntry:addResponse("Wir Ritter vom Orden der Silberdrachen bekämpfen das, was nicht mit den alten Sitten vereinbar ist, wo immer es möglich ist. Und in diesem Land bietet sich hierfür allerlei Möglichkeit.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I do not like to sail ashore, so I have never been to Gobaith.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Ich mag es nicht, fern der Küste zu segeln, also war ich noch nie auf Gobaith.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("And I am Arenius Batavius of the Order of the Silver Dragon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Und ich bin Arenius Batavius, Kreuzritter des Ordens der Silberdrachen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Orden");
talkEntry:addTrigger("Silberdrache");
talkEntry:addResponse("Der Orden der Silberdrachen mag in diesem Land unbekannt sein; aber im Reiche Albar fürchtet man unseren Namen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ork");
talkEntry:addResponse("Ich habe einige Orks in der Nähe der Höhle, welche ich für den Unterschlupf eines bösen Kultes von Blutmagiern halte, umherstreifen gesehen. Ich frage mich, welche Verbindung sie miteinander haben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Kult");
talkEntry:addResponse("Ich bekämpfe den Kult der Salavesh, ein Haufen böser Blutmagier. Die Diener des Kultes haben mir aufgelauert, als ich mich auf dem Weg zu ihrem Unterschlupf befand. Gerüchten zufolge ist er in einer Höhle.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Salavesh");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("The cult I am fighting is the Cult of Salavesh. Evil blood mages, they are. Their minions ambushed me on my way to their stronghold. Rumours say it is within a cave.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Salavesh");
talkEntry:addResponse("Ich bekämpfe den Kult der Salavesh, ein Haufen böser Blutmagier. Die Diener des Kultes haben mir aufgelauert, als ich mich auf dem Weg zu ihrem Unterschlupf befand. Gerüchten zufolge ist er in einer Höhle.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Drache");
talkEntry:addResponse("Drachen sind majestätische Wesen und ich bin stolz darauf, einst einen gesehen zu haben. Gerüchten zufolge macht der Kult der Salavesh Jagd auf Drachen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Blutmagie");
talkEntry:addTrigger("totenbeschwör");
talkEntry:addResponse("Blutmagie ist das Böse in Reinform. Die alten Sitten verbieten es, solche Praktiken auch nur in Erwägung zu ziehen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Höhle");
talkEntry:addTrigger("Unterschlupf");
talkEntry:addResponse("Ich bin mir sicher, dass der Unterschlupf des Kults der Salavesh sich in einer Höhle, nordöstlich von hier, befindet.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wund");
talkEntry:addResponse("Diener des Kultes der Salavesh fügten mir diese Wunden zu. Doch ich werde nicht klein bei geben; helft mir in meiner Mission für das die alten Sitten!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("sitte");
talkEntry:addResponse("Die alten Sitten zu bewahren und zu schützen, das ist die Mission des Ordens der Silberdrachen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Order");
talkEntry:addTrigger("silver dragon");
talkEntry:addResponse("The Order of the Silver Dragon might be unknown in these lands; but in the realm of Albar, our name is feared.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Orc");
talkEntry:addResponse("I saw some orcs prowling the vicinity of the cave which I believe must be the stronghold of an evil cult of blood mages. I wonder what business they have with orcs.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cult");
talkEntry:addResponse("The cult I am fighting is the Cult of Salavesh. Evil blood mages, they are. Their minions ambushed me on my way to their stronghold. Rumours say it is within a cave.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Dragon");
talkEntry:addResponse("Dragons are majestic beings and I am proud of once seeing one. Rumours say that the Cult of Salavesh hunts dragons.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("blood magic");
talkEntry:addTrigger("blood mage");
talkEntry:addTrigger("necro");
talkEntry:addResponse("Blood magic is pure sin. The old customs forbid even considering such foul deeds.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("cave");
talkEntry:addTrigger("stronghold");
talkEntry:addResponse("I am convinced that the stronghold of the Cult of Salavesh is a cave to the north east.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("wound");
talkEntry:addResponse("Minions of the Cult of Salavesh wounded me like this. But I won't surrender; help me in my deed for the old customs.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("custom");
talkEntry:addResponse("To protect and preserve the old customs, that is the mission of the Order of the Silver Dragon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addResponse("Who is that?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Wer soll das sein?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Who is that?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Wer soll das sein?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Where is that?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Wo soll das sein?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I had to pay a huge amount of money for the grant to pass the land of this Don Guilianni; is that normal in this land?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Ich musste einen sehr hohen Wegzoll zahlen, um das Land dieses Don Guiliannis durchqueren zu dürfen. Ist dies üblich hier?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Money seems to be one of the favourite words of the people of Galmair. At least it was the word they used most when spoken to.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Geld scheint das Lieblingswort der Leute von Galmair zu sein. Zumindestens war es das Wort, was sie am häufigsten zu mir gesagt haben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("queen");
talkEntry:addResponse("I do not question her authority. She is of noble birth, hence a suitable monarch. But I question the custom that brought her to power.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("königin");
talkEntry:addResponse("Ich zweifle nicht ihren Herrschaftsanspruch an. Sie ist von adeligem Blut, daher ist sie berufen zu herrschen. Aber ich zweifle den Brauch an, der ihr die Macht verlieh.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I do not question her authority. She is of noble birth, hence a suitable monarch. But I question the custom that brought her to power.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Ich zweifle nicht ihren Herrschaftsanspruch an. Sie ist von adeligem Blut, daher ist sie berufen zu herrschen. Aber ich zweifle den Brauch an, der ihr die Macht verlieh.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Cadomyr is a hospitable village. I am very glad that I found a place where the old customs are still honoured.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Cadomyr ist ein gastfreundliches Dorf. Ich bin sehr froh einen Ort gefunden zu haben, wo die alten Sitten noch gewahrt sind.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Well, what exactly don't you know about Albar? It is my home, so refrain from any words that might dishonour it.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("Nun, was genau wollt ihr über Albar wissen? Es ist meine Heimat, daher verkneift euch unehrenhafte Worte.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Travellers report evil things about Gynk. A pool of sin, it is. Time for some cleansing, I say!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("Reisende berichteten mir schlimme Dinge über Gynk. Ein Sündenpfuhl soll es sein. Zeit, dort aufzuräumen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Oh, please, can't we talk about the weather instead?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Oh nein, lasst uns doch lieber über das Wetter reden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("I am merely a loyal tool of the gods. My blade strikes just and fair.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Ich bin eigentlich nur ein Werkzeug der Götter. Ich führe meine Klinge für die gerechte Sache.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Moshran");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Moshran is commonly underestimated; the evil thug they say. That is far away from the truth, for Moshran is much more than 'evil' or 'good'.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Moshran");
talkEntry:addResponse("Moshran wird gemeinhin unterschätzt; der böse Bube soll er sein. Die entspricht nun wirklich nicht der Wahrheit, Moshran ist weit mehr als einfach nur 'gut' und 'böse'.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Many knights pray to Malachin prior to a battle; but do they really have faith in his guidance? Or are they just cowards?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addResponse("Vor einer Schlacht beten viele Ritter zu Malachin; aber wie fest ist ihr Glaube in seine Führung wirklich? Oder sind sie am Ende nur Feiglinge?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zhambra");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Being loyal is more important than being right; that is Zhambra's doctrine.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zhambra");
talkEntry:addResponse("Loyal zu sein ist wichtiger, als Recht zu haben; das ist Zhambras Doktrin.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Cherga! The goddess of death! What is dead is dead and rots; all beyond is just evil!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addResponse("Cherga! Die Totengöttin! Was tot ist, ist tot und verrottet; alles andere ist einfach nur böse!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Did you know that Brágon is the father of all dragons? No? I thought so.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addResponse("Wußtet ihr, dass Brágon der Vater aller Drachen ist? Nein? Dachte ich mir.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("The code of my order forbids me from pursuing mudane wealth; thus, I do not trade things with you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Der Codex meines Ordens verbietet es, weltlichem Reichtum nachzustreben. Daher werde ich nicht mit euch handeln.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tale");
talkEntry:addTrigger("story");
talkEntry:addTrigger("tell something");
talkEntry:addResponse("I have an interesting tale to tell. It is about an evil cult of blood mages. Seen my wounds? They tell the story.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("geschichte");
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Ich habe eine interessante Geschichte zu erzählen, sie handelt von einem bösen Kult von Blutmagiern. Seht ihr meine Wunden? Sie erzählen die Geschichte.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Arenius");
talkEntry:addTrigger("Batavius");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I am a crusader of the Order of the Silver Dragon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Arenius");
talkEntry:addTrigger("Batavius");
talkEntry:addResponse("Ich bin ein Kreuzritter des Ordens der Silberdrachen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addTrigger("yub");
talkEntry:addResponse("Pardon?");
talkEntry:addResponse("What do you mean?");
talkEntry:addResponse("I don't quite know...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("Pardon?");
talkEntry:addResponse("Wie meinen?");
talkEntry:addResponse("Ich weiß nicht recht...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addTrigger("nub");
talkEntry:addResponse("Sorry?");
talkEntry:addResponse("I cannot understand your words.");
talkEntry:addResponse("What was that again?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("Entschuldigt?");
talkEntry:addResponse("Ich kann euch nicht folgen.");
talkEntry:addResponse("Wie bitte?");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me stöhnt vor Schmerz.", "#me moans in pain.");
talkingNPC:addCycleText("Verdammte Blutmagie! Ich werde dem ein Ende setzen.", "Blasted blood magic! I will end this, once and for all.");
talkingNPC:addCycleText("#mes prunkvolle Rüstung zeigt das Wappen eines sich aufbäumenden Silberdrachen.", "#me's shining armour shows the coat of arms of a rearing silver dragon.");
talkingNPC:addCycleText("Nur durch einen gemeinen Hinterhalt konnte ich besiegt werden - denn auf den Schlachtfeldern der Ehre bin ich ungeschlagen.", "Only a sneaky ambush could defeat me - for I am unmatched on the battlefield of honour.");
talkingNPC:addCycleText("#me hebt vorsichtig einen Verband an seinem Arm mit schmerzverzerrtem Gesicht an.", "#me carefully lifts a bandage on his arm, grimacing with pain.");
talkingNPC:addCycleText("Nieder mit den Salavesh!", "Down with Salavesh!");
talkingNPC:addCycleText("#me streicht sich verzweifelt durch das blutverkrustete Haar.", "#me combs his blood stained hair desperately.");
talkingNPC:addCycleText("Für die Ehre des Ordens der Silberdragon und die alten Sitten streite ich.", "I fight for the honour of the Order of the Silver Dragon and the old customs.");
talkingNPC:addCycleText("Es ist nicht die Zeit der Worte, sondern die der Taten.", "It is not the time for speech, but for deeds.");
talkingNPC:addCycleText("#me streicht über sein verletztes Bein.", "#me strokes his bruised leg.");
talkingNPC:addCycleText("Fremder, hättet ihr einen Augenblick Zeit...", "Stranger, please, a moment of your time...");
talkingNPC:addCycleText("#me hält sein reich verziehrtes Schwert fest in der Hand und schwingt es durch die Luft.", "#me holds his ornate sword firmly with one hand, swinging it idly into the air.");
talkingNPC:addCycleText("#me schreibt einige Worte ein in Leder einbebundenes Buch und versteckt es hinterher sorgfältig unter seiner Robe.", "#me writes some words into a leather covered book, carefully tucking it under his robe afterwards.");
talkingNPC:addCycleText("Wir leben in merkwürdigen Zeiten...", "Strange times we live in...");
talkingNPC:addCycleText("Verdammte Kultisten! Wenn ich nur...", "Blasted cultists... if only I weren't...");
talkingNPC:addCycleText("Bei Brágons heiligem Blut!", "By the holy blood of Brágon!");
mainNPC:addLanguage(0);
mainNPC:addLanguage(1);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Dieser NPC ist der Kreuzritter Arenius Batavius.", "This NPC is the crusader Arenius Batavius.");
mainNPC:setUseMessage("Fass mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut dich verwirrt an.", "#me looks at you confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 101);
mainNPC:setEquipment(11, 2419);
mainNPC:setEquipment(5, 231);
mainNPC:setEquipment(6, 2284);
mainNPC:setEquipment(4, 48);
mainNPC:setEquipment(9, 34);
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
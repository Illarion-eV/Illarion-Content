--------------------------------------------------------------------------------
-- NPC Name: Miggs                                                    Galmair --
-- NPC Job:  Henchman                                                         --
--                                                                            --
-- NPC Race: dwarf                      NPC Position:  374, 216, 0            --
-- NPC Sex:  male                       NPC Direction: west                   --
--                                                                            --
-- Author:   Estralis Seborian                                                --
--                                                                            --
-- Last parsing: August 18, 2012                          easyNPC Parser v1.2 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (1, 374, 216, 0, 6, 'Miggs', 'npc.miggs', 0, 2, 2, 242, 182, 0, 208, 160, 118);
---]]

require("npc.base.basic")
require("npc.base.condition.language")
require("npc.base.condition.quest")
require("npc.base.condition.town")
require("npc.base.consequence.inform")
require("npc.base.consequence.item")
require("npc.base.consequence.money")
require("npc.base.consequence.quest")
require("npc.base.consequence.rankpoints")
require("npc.base.talk")
module("npc.miggs", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Miggs, the henchman of Don Valerio. Keywords: Hello, henchman, quest, Don Valerio, rules."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Miggs, der Handlanger von Don Valerio. Schlüsselwörter: Hallo, Handlanger, Quest, Don Valerio, Regeln."));
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
talkEntry:addResponse("G'day, did the Don send you?");
talkEntry:addResponse("So, you are the next bigshot of Galmair? Something makes me doubt that.");
talkEntry:addResponse("What?! Make it quick.");
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
talkEntry:addResponse("Tach, hat euch der Don geschickt?");
talkEntry:addResponse("So, ihr seid also der nächste Stern am Himmel Galmairs? Irgendwie kann ich das nicht recht glauben.");
talkEntry:addResponse("Was!? Sprecht schnell.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("G'day, did the Don send you?");
talkEntry:addResponse("So, you are the next bigshot of Galmair? Something makes me doubt that.");
talkEntry:addResponse("What?! Make it quick.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Tach, hat euch der Don geschickt?");
talkEntry:addResponse("So, ihr seid also der nächste Stern am Himmel Galmairs? Irgendwie kann ich das nicht recht glauben.");
talkEntry:addResponse("Was!? Sprecht schnell.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Go and come back. But not too soon.");
talkEntry:addResponse("Off!");
talkEntry:addResponse("Get lost.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Geht und beehrt mich mal wieder. Aber nicht zu bald.");
talkEntry:addResponse("Hinfort!");
talkEntry:addResponse("Haut ab.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Go and come back. But not too soon.");
talkEntry:addResponse("Off!");
talkEntry:addResponse("Get lost.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addResponse("Geht und beehrt mich mal wieder. Aber nicht zu bald.");
talkEntry:addResponse("Hinfort!");
talkEntry:addResponse("Haut ab.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("I feel like beating up somebody. Just give me a reason.");
talkEntry:addResponse("Four words: None of your business.");
talkEntry:addResponse("My fist itches.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addResponse("Mir ist danach, jemanden zu vermöbeln. Gebt mir nur einen Anlass.");
talkEntry:addResponse("Vier Worte: Geht euch nichts an.");
talkEntry:addResponse("Meine Faust juckt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("Miggs!");
talkEntry:addResponse("I am Miggs. And this is my fist. Me and her are looking forward to make your acquaintance.");
talkEntry:addResponse("I am Miggs, the right hand... no, the right fist of Don Valerio.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Miggs!");
talkEntry:addResponse("Ich bin Miggs. Und dies ist meine Faust. Ich und sie freuen uns darauf, deine Bekanntschaft zu machen.");
talkEntry:addResponse("Ich bin Miggs, die rechte Hand... nein, die rechte Faust Don Valerios.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("message");
talkEntry:addTrigger("news");
talkEntry:addTrigger("letter");
talkEntry:addTrigger("scroll");
talkEntry:addTrigger("parchment");
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 3));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest status] The Reminder II: You deliver the message from Groktan Flintsplit to Miggs."));
talkEntry:addResponse("Ah! Good! A list of debtors from Groktan. I'll rule out their names one after another... When I'm done with 'em.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(107, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("nachricht");
talkEntry:addTrigger("brief");
talkEntry:addTrigger("Botschaft");
talkEntry:addTrigger("Schriftrolle");
talkEntry:addTrigger("Pergament");
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 3));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Queststatus] Die Erinnerung II: Du überbringst Miggs die Nachricht von Groktan Flintsplit."));
talkEntry:addResponse("Ah! Gut! Eine Liste der Schuldner von Groktan. Ich werde einen Namen nach dem anderen durchstreichen... wenn ich mit ihnen fertig bin.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(107, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Groktan");
talkEntry:addTrigger("Flintsplit");
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 3));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest status] The Reminder II: You deliver the message from Groktan Flintsplit to Miggs."));
talkEntry:addResponse("Ah! Good! A list of debtors from Groktan. I'll rule out their names one after another... When I'm done with 'em.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(107, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Groktan");
talkEntry:addTrigger("Flintsplit");
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 3));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Queststatus] Die Erinnerung II: Du überbringst Miggs die Nachricht von Groktan Flintsplit."));
talkEntry:addResponse("Ah! Gut! Eine Liste der Schuldner von Groktan. Ich werde einen Namen nach dem anderen durchstreichen... wenn ich mit ihnen fertig bin.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(107, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(77, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Galmair Sewers I"));
talkEntry:addResponse("Blasted flies! The Don wants me to keep the streets clean, but dirty flies seem to emerge from the sewers over and over again. Climb down and slay at least ten of those annoyances! Here, have this torch.");
talkEntry:addConsequence(npc.base.consequence.item.item(391, 1, 399, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(77, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(77, "=", 0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Die Kanalisation von Galmair I"));
talkEntry:addResponse("Verdammte Fliegen! Der Don wünscht sich saubere Straßen, aber diese Schmeißfliegen steigen ein ums andere Mal aus der Kanalisation auf. Nehmt diese Fackel, steigt hinab und erschlagt wenigstens zehn dieser Plagegeister.");
talkEntry:addConsequence(npc.base.consequence.item.item(391, 1, 399, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(77, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(77, "=", 0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Galmair Sewers I"));
talkEntry:addResponse("Blasted flies! The Don wants me to keep the streets clean, but dirty flies seem to emerge from the sewers over and over again. Climb down and slay at least ten of those annoyances! Here, have this torch.");
talkEntry:addConsequence(npc.base.consequence.item.item(391, 1, 399, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(77, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(77, "=", 0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Die Kanalisation von Galmair I"));
talkEntry:addResponse("Verdammte Fliegen! Der Don wünscht sich saubere Straßen, aber diese Schmeißfliegen steigen ein ums andere Mal aus der Kanalisation auf. Nehmt diese Fackel, steigt hinab und erschlagt wenigstens zehn dieser Plagegeister.");
talkEntry:addConsequence(npc.base.consequence.item.item(391, 1, 399, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(77, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(77, "=", 11));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 100 copper coins. You advance in Don Valerio Guilianni's favour."));
talkEntry:addResponse("#me hands over a small purse: 'Good job. Now I owe you one. But those flies were only the beginning of tasks I have for you.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.quest.quest(77, "=", 12));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Galmair", "+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(77, "=", 11));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 100 copper coins."));
talkEntry:addResponse("#me hands over a small purse: 'Good job. Now I owe you one. But those flies were only the beginning of tasks I have for you.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.quest.quest(77, "=", 12));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(77, "=", 11));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 100 Kupferstücke. Dein Ansehen bei Don Valerio Guilianni steigt."));
talkEntry:addResponse("#me überreicht eine kleine Geldbörse: 'Gut gemacht, ihr habt einen gut bei mir. Aber diese Fliegen waren erst der Anfang der Aufträge, die ich für euch habe.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.quest.quest(77, "=", 12));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Galmair", "+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(77, "=", 11));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 100 Kupferstücke."));
talkEntry:addResponse("#me überreicht eine kleine Geldbörse: 'Gut gemacht, ihr habt einen gut bei mir. Aber diese Fliegen waren erst der Anfang der Aufträge, die ich für euch habe.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.quest.quest(77, "=", 12));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(77, ">", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(77, "<", 11));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I hear their buzzing everywhere. Go back to the sewers and smite as many flies as possible.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(77, ">", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(77, "<", 11));
talkEntry:addResponse("Ich hör sie überall summen! Geht zurück in die Kanalisation und erschlagt so viele Fliegen wie möglich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(77, ">", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(77, "<", 11));
talkEntry:addResponse("I hear their buzzing everywhere. Go back to the sewers and smite as many flies as possible.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(77, ">", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(77, "<", 11));
talkEntry:addResponse("Ich hör sie überall summen! Geht zurück in die Kanalisation und erschlagt so viele Fliegen wie möglich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(77, "=", 12));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Galmair Sewers II"));
talkEntry:addResponse("Did you ever notice this... moaning in the night? I don't know why, but smelly sewer mummies haunt the sewers. Smite at least five of them for a small reward.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(77, "=", 13));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(77, "=", 12));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Die Kanalisation von Galmair II"));
talkEntry:addResponse("Habt ihr jemals dieses Wehklagen in der Nacht vernommen? Ich weiß nicht warum, aber stinkende Gullimumien spuken in der Kanalisation. Erschlagt wenigstens fünf von ihnen für eine kleine Belohnung.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(77, "=", 13));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(77, "=", 12));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Galmair Sewers II"));
talkEntry:addResponse("Did you ever notice this... moaning in the night? I don't know why, but smelly sewer mummies haunt the sewers. Smite at least five of them for a small reward.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(77, "=", 13));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(77, "=", 12));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Die Kanalisation von Galmair II"));
talkEntry:addResponse("Habt ihr jemals dieses Wehklagen in der Nacht vernommen? Ich weiß nicht warum, aber stinkende Gullimumien spuken in der Kanalisation. Erschlagt wenigstens fünf von ihnen für eine kleine Belohnung.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(77, "=", 13));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(77, "=", 18));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 100 copper coins and a ornate dagger. You advance in Don Valerio Guilianni's favour."));
talkEntry:addResponse("Each bad day for the undead is a good for the living. Here, have this dagger as compensation for your favour.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.item.item(190, 1, 599, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(77, "=", 19));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Galmair", "+", 10));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(77, "=", 18));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 100 copper coins and a ornate dagger."));
talkEntry:addResponse("Each bad day for the undead is a good for the living. Here, have this dagger as compensation for your favour.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.item.item(190, 1, 599, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(77, "=", 19));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(77, "=", 18));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 100 Kupferstücke und einen verzierten Dolch. Dein Ansehen bei Don Valerio Guilianni steigt."));
talkEntry:addResponse("Jeder schlechte Tag für die Untoten ist ein guter für die Lebenden. Hier, nehmt diesen Dolch als Ausgleich für eure Gefälligkeit.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.item.item(190, 1, 599, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(77, "=", 19));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Galmair", "+", 10));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(77, "=", 18));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 100 Kupferstücke und einen verzierten Dolch."));
talkEntry:addResponse("Jeder schlechte Tag für die Untoten ist ein guter für die Lebenden. Hier, nehmt diesen Dolch als Ausgleich für eure Gefälligkeit.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.item.item(190, 1, 599, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(77, "=", 19));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(77, ">", 12));
talkEntry:addCondition(npc.base.condition.quest.quest(77, "<", 18));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Those undead bastards in the sewers scare away customers. Help Galmair and its traders, slay as many as possible.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(77, ">", 12));
talkEntry:addCondition(npc.base.condition.quest.quest(77, "<", 18));
talkEntry:addResponse("Diese untoten Bastarde in der Kanalisation verschrecken die Kundschaft. Helft Galmair und seinen Händlern, erschlagt so viele wie möglich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(77, ">", 12));
talkEntry:addCondition(npc.base.condition.quest.quest(77, "<", 18));
talkEntry:addResponse("Those undead bastards in the sewers scare away customers. Help Galmair and its traders, slay as many as possible.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(77, ">", 12));
talkEntry:addCondition(npc.base.condition.quest.quest(77, "<", 18));
talkEntry:addResponse("Diese untoten Bastarde in der Kanalisation verschrecken die Kundschaft. Helft Galmair und seinen Händlern, erschlagt so viele wie möglich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(77, "=", 19));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Galmair Sewers III"));
talkEntry:addResponse("The Don has a special assignment for you. The leader of a bunch of halfling thieves who dared to steal from the Don is suspected to hide in the sewers. End his life!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(77, "=", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(77, "=", 19));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Die Kanalisation von Galmair III"));
talkEntry:addResponse("Der Don hat einen Spezialauftrag für euch. Der Anführer eine Bande von Halblingdieben, die sich erdreisteten, den Don zu bestehlen, versteckt sich wohl in der Kanalisation. Beendet sein Leben!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(77, "=", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(77, "=", 19));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Galmair Sewers III"));
talkEntry:addResponse("The Don has a special assignment for you. The leader of a bunch of halfling thieves who dared to steal from the Don is suspected to hide in the sewers. End his life!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(77, "=", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(77, "=", 19));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Die Kanalisation von Galmair III"));
talkEntry:addResponse("Der Don hat einen Spezialauftrag für euch. Der Anführer eine Bande von Halblingdieben, die sich erdreisteten, den Don zu bestehlen, versteckt sich wohl in der Kanalisation. Beendet sein Leben!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(77, "=", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(77, ">", 19));
talkEntry:addCondition(npc.base.condition.quest.quest(77, "<", 21));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("The halfling thieves continue to steal from clients of the Don. Track down their leader and execute him.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(77, ">", 19));
talkEntry:addCondition(npc.base.condition.quest.quest(77, "<", 21));
talkEntry:addResponse("Die Halblingdiebe bestehlen weiterhin die Klientel des Dons. Spürt ihren Anführer auf und erledigt ihn!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(77, ">", 19));
talkEntry:addCondition(npc.base.condition.quest.quest(77, "<", 21));
talkEntry:addResponse("The halfling thieves continue to steal from clients of the Don. Track down their leader and execute him.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(77, ">", 19));
talkEntry:addCondition(npc.base.condition.quest.quest(77, "<", 21));
talkEntry:addResponse("Die Halblingdiebe bestehlen weiterhin die Klientel des Dons. Spürt ihren Anführer auf und erledigt ihn!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(77, "=", 22));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I thank you for what you did for Galmair. I owe you a favour. So, if you need help, come to Don Valerio, for he is your godfather.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(77, "=", 22));
talkEntry:addResponse("Ich danke euch für alles, was ihr für Galmair getan habt. Ihr habt einen gut bei mir. Wenn ihr je Hilfe braucht, geht zu Don Valerio, denn er ist euer Pate.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(77, "=", 22));
talkEntry:addResponse("I thank you for what you did for Galmair. I owe you a favour. So, if you need help, come to Don Valerio, for he is your godfather.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(77, "=", 22));
talkEntry:addResponse("Ich danke euch für alles, was ihr für Galmair getan habt. Ihr habt einen gut bei mir. Wenn ihr je Hilfe braucht, geht zu Don Valerio, denn er ist euer Pate.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("Some call me a henchman. I work for the Don; and I am good in what I do.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Manche nennen mich einen Handlanger. Ich arbeite für den Don; und ich bin gut darin, was ich mache.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Some call me a henchman. I work for the Don; and I am good in what I do.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Manche nennen mich einen Handlanger. Ich arbeite für den Don; und ich bin gut darin, was ich mache.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("castle");
talkEntry:addResponse("Some say, this castle was once built by dwarves. I don't care at all!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Burg");
talkEntry:addResponse("Manche behaupten, diese Burg wurde einst von Zwergen erbaut. Das ist mir sowas von egal!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("trader");
talkEntry:addTrigger("merchant");
talkEntry:addTrigger("collegue");
talkEntry:addTrigger("vendor");
talkEntry:addTrigger("market");
talkEntry:addResponse("In Galmair, you may trade whatever you want with whoever you want whenever you want.");
talkEntry:addResponse("The market place is a good place to trade. It is outside. So... get out!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("händler");
talkEntry:addTrigger("kollege");
talkEntry:addTrigger("höker");
talkEntry:addTrigger("markt");
talkEntry:addResponse("In Galmair könnt ihr Handel treiben, was immer ihr wollt, mit wem ihr wollt und wann ihr es wollt.");
talkEntry:addResponse("Der Marktplatz ist ein guter Ort, um Handeln zu treiben. Er ist draußen. Also... raus mit euch!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Ruffian? You call me a ruffian? You're so right!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Grobian? Ihr nennt mich einen Grobian? Recht habt ihr!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("Who cares!?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Na und!?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("henchman");
talkEntry:addTrigger("henchman");
talkEntry:addTrigger("thug");
talkEntry:addResponse("I'm not a simple henchman. I'm a convincer. With irresistible arguments.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("halfling");
talkEntry:addResponse("Blasted halfers! They pickpocket all day long. Nothing wrong with that, but they should know from whom they may take.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hobbit");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Blasted halfers! They pickpocket all day long. Nothing wrong with that, but they should know from whom they may take.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("fly");
talkEntry:addTrigger("flies");
talkEntry:addResponse("Blasted flies! They buzz all day long. Nothing wrong with that, but they should know who's head they may buzz around.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mummy");
talkEntry:addTrigger("mummies");
talkEntry:addResponse("Blasted mummies! They moan all day long. Nothing wrong with that, but they should know about they should not moan about.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dwarf");
talkEntry:addTrigger("dwarves");
talkEntry:addResponse("So, you think us dwarves kneel to a king, drink beer and dig for pebbles all day long? Bad guess!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("protection");
talkEntry:addTrigger("fee");
talkEntry:addResponse("Protection can be paid with money. The more money, the more protection. No money... bad idea.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("favour");
talkEntry:addTrigger("favor");
talkEntry:addResponse("Everyone in Galmair owes the Don a favour; some more than one. For the Don helps everyone, he is our godfather.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Handlanger");
talkEntry:addTrigger("Gauner");
talkEntry:addResponse("Ich bin kein einfacher Handlanger. Ich bin ein Überzeugungskünstler - mit schlagenden Argumenten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("halbling");
talkEntry:addResponse("Verdammte Halblinge! Sie stibitzen den ganzen Tag aus allen möglichen Taschen. Das wäre alleine nicht schlimm, doch sollten sie wissen, aus welchen Taschen sie ihre Finger raushalten sollten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hobbit");
talkEntry:addResponse("Verdammte Halblinge! Sie stibitzen den ganzen Tag aus allen möglichen Taschen. Das wäre alleine nicht schlimm, doch sollten sie wissen, aus welchen Taschen sie ihre Finger raushalten sollten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Fliege");
talkEntry:addResponse("Verdammte Fliegen! Sie summen den ganzen Tag. Das alleine wäre nicht schlimm, doch sollten sie wissen, um welchen Kopf sie besser nicht herumsummen sollten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Mumie");
talkEntry:addResponse("Verdammte Mumien! Sie stöhnen den ganzen Tag. Das alleine wäre nicht schlimm, doch sollten sie wissen, über was sie besser nicht stöhnen sollten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zwerg");
talkEntry:addResponse("So, ihr denkt also, wir Zwerge knien vor einem König, saufen Bier und buddeln den ganzen Tag nach Kieselsteinen? Falsch gedacht!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Schutzgeld");
talkEntry:addTrigger("Schutzgebühr");
talkEntry:addResponse("Sicherheit kann man erkaufen. Je mehr Geld, desto mehr Schutz. Kein Geld... Schlechte Idee.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gefallen");
talkEntry:addTrigger("Gefälligkeit");
talkEntry:addResponse("Jeder Galmair schuldet dem Don einen Gefallen, manche mehr als einen. Denn der Don hilft jedem, er ist unser Pate.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rules");
talkEntry:addResponse("1. The Don protects you if you pay the fee.");
talkEntry:addResponse("2. Pay the toll and the interest and no harm will be done.");
talkEntry:addResponse("3. Trade freely, stay and depart as you wish.");
talkEntry:addResponse("4. Come to the Don if you need help. He is your godfather.");
talkEntry:addResponse("5. A deal with the Don is a deal with your fate.");
talkEntry:addResponse("6. If you did harm, compensate generously twice the damage.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Regeln");
talkEntry:addResponse("1. Der Don beschützt euch, wenn ihr die Gebühr bezahlt.");
talkEntry:addResponse("2. Zahlt den Zoll und den Zins und kein Leid wird euch zugefügt.");
talkEntry:addResponse("3. Handelt frei, kommt und geht, wie es euch beliebt.");
talkEntry:addResponse("4. Kommt zum Don, wenn ihr Hilfe braucht. Er euer Pate.");
talkEntry:addResponse("5. Ein Handel mit dem Don ist ein Handel mit dem Schicksal.");
talkEntry:addResponse("6. Habt ihr Schaden verursacht, gleicht den Schaden zweifach aus.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addResponse("Hiding behind books, fighting with words; that is not the way of a man. The archmage of Runewick can't be a true man!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Sich hinter Büchern verstecken und mit Worten zu kämpfen; das ziemt sich nicht für einen Mann. Der Erzmagier von Runewick kann kein echter Mann sein!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hiding behind books, fighting with words; that is not the way of a man. The archmage of Runewick can't be a true man!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Sich hinter Büchern verstecken und mit Worten zu kämpfen; das ziemt sich nicht für einen Mann. Der Erzmagier von Runewick kann kein echter Mann sein!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Runewick is ruled by a man... by Elvaine Morgan. I'd never follow such a weak person. I have no explaination how he gathered so many followers.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Runewick wird von einem Mann... von Elvaine Morgan regiert. Ich würde nie so einer schwachen Persönlichkeit gehorchen. Ich habe keine Erklärung dafür, wie er so viele Anhänger gewinnen konnte.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("The Don made up some very clear rules. Obey them and you'll have a good time in Galmair.");
talkEntry:addResponse("The Don is a good man. If you owe him a favour, never forget about that in your life. He won't!");
talkEntry:addResponse("One bad word about the Don and a knife in the dark could make you stop spreading lies. Keep that in mind.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Der Don hat einige einfache Regeln aufgestellt. Befolgt sie und ihr werdet eine gute Zeit in Galmair haben.");
talkEntry:addResponse("Der Dong ist ein guter Mann. Wenn ihr ihm einen Gefallen schuldet, so vergesst dies niemals. Er wird es jedenfalls nicht.");
talkEntry:addResponse("Ein falsches Wort über den Don und ein Messer in der Dunkelheit könnte eure Lügen ein für alle mal beenden. Denkt immer daran.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Galmair is the only town in this region where the word 'freedom' still has meaning.");
talkEntry:addResponse("When I first came to Galmair, I was a poor dwarf with no hope. The Don gave me hope and I pay back all the favours he granted.");
talkEntry:addResponse("If you like good beer, a good tavern brawl and good business, Galmair is your place to be.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Galmair ist die einzige Stadt in dieser Region, wo das Wort 'Freiheit' noch eine Bedeutung hat.");
talkEntry:addResponse("Als ich nach Galmair kam, war ich ein armer Zwerg ohne Hoffnung. Der Don gab mir Hoffnung und ich zahle all seine Gefälligkeiten gerne zurück.");
talkEntry:addResponse("Wenn ihr ein gutes Bier, eine gute Tavernenschlägerei und ein gutes Geschäft schätzt, dann ist Galmair der Ort für euch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Queen");
talkEntry:addResponse("Rosaline Guilianni; sounds good, eh?");
talkEntry:addResponse("The Don once proposed marriage to the Queen of Cadomyr. She refused; she'd better begs that he does a second time!");
talkEntry:addResponse("I somehow adore queen Rosaline; she knows how to rule a kingdom. As queen. A queendom, har, har.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königin");
talkEntry:addResponse("Rosaline Guilianni; klingt gut, oder?");
talkEntry:addResponse("Der Don hat der Königin von Cadomyr einst einen Heiratsantrag gemacht. Sie hat ihn abgelehnt; sie sollte darum betteln, dass er es noch ein zweites mal macht.");
talkEntry:addResponse("Ich bewundere Königin Rosaline irgendwie. Sie weiß, wie man ein Königreich regiert. Als Königin. Ein Königinnenreich, har, har.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Rosaline Guilianni; sounds good, eh?");
talkEntry:addResponse("The Don once proposed marriage to the Queen of Cadomyr. She refused; she'd better begs that he does a second time!");
talkEntry:addResponse("I somehow adore queen Rosaline; she knows how to rule a kingdom. As queen. A queendom, har, har.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Rosaline Guilianni; klingt gut, oder?");
talkEntry:addResponse("Der Don hat der Königin von Cadomyr einst einen Heiratsantrag gemacht. Sie hat ihn abgelehnt; sie sollte darum betteln, dass er es noch ein zweites mal macht.");
talkEntry:addResponse("Ich bewundere Königin Rosaline irgendwie. Sie weiß, wie man ein Königreich regiert. Als Königin. Ein Königinnenreich, har, har.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I ask myself how they survive in that barren desert. Cadomyr is proud, but it has to rely on food deliveries. This might turn out... violent one day.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Ich frage mich, wie sie in dieser trockenen Wüste überleben. Cadomyr ist stolz, doch ist es von Nahrungslieferungen abhängig. Das könnte mal recht... blutig ausgehen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("In Albar, they don't obey women. I'd obey Rosaline Edwards of Cadomyr if she'd be the Don's wife; she is of Albarian origin, though. Strange, isn't it?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("In Albar gehorcht man keinem Weibe. Ich aber würde Rosaline Edwards von Cadomyr gehorchen wenn sie die Ehefrau des Dons wäre. Sie ist von albarischem Geblüt; merkwürdig, oder?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Honestly, I've never been to Gynk, but I was told it is like Galmair... just bigger.");
talkEntry:addResponse("Gynk is the home of Don Valerio. So, you should better not say it is filthy!");
talkEntry:addResponse("If I ever depart from Galmair, I'd move to Gynk.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("Ehrlich gesagt war ich noch nie in Gynk, aber man sagt, es sei wie Galmair... nur größer.");
talkEntry:addResponse("Gynk ist die Heimat von Don Valerio. Also sollte ihr besser nicht behaupten, es sei dreckig!");
talkEntry:addResponse("Wenn ich jemals Galmair verlasse, dann ziehe ich nach Gynk.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Oh, Salk... what was that? I never heard of that place.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Oh Salk... wie bitte? Ich hab noch nie von solch einem Ort gehört.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("Ha! Then tell me all the names of the gods! At once! Quick!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Ha! Na dann zählt mal alle Götter auf! Los, zack, zack!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ronagan");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Well, well, well. You think I am a criminal and hence, I pray to Ronagan, right? Right. Except for the 'criminal'.");
talkEntry:addResponse("Ronagan is the patron saint of Galmair. So... hail Ronagan!");
talkEntry:addResponse("Do you have the slightest clue what Ronagan did for Illarion? No? If you knew, you'd pray to him all day long.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("Ja, ja, ja. Ihr denkt also, ich bin ein Gauner und deshalb bete ich zu Ronagan, richtig? Richtig. Außer das mit dem 'Gauner'.");
talkEntry:addResponse("Ronagan ist der Schutzgott Galmairs. Also... lobet Ronagan!");
talkEntry:addResponse("Habt ihr die geringste Ahnung davon, was Ronagan für Illarion getan hat? Nein? Wenn ihr es wüßtet, würdet ihr ihn den ganzen Tag lang anbeten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("All dwarves worship Irmorom - that is as false as the statement that all dwarves are greedy bastards.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("Dass alle Zwerge Irmorom anhimmeln ist so falsch wie dass alle Zwerge geizige Bastarde sind.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sirani");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Sirani, Sirani... The Don mentioned something about Sirani. Better ask him about Sirani.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("Sirani, Sirani... der Don erwähnte irgendwas über Sirani. Fragt ihn besser selbst.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("I'm not a trader. You may give me your money, though.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Ich bin kein Händler. Ihr könnt mir aber trotzdem euer Gold geben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("Let me tell you something: Never mess with the Don. Messing with him is just as bad as messing with me.");
talkEntry:addResponse("Do you see any campfire here? No? So, no tales for you.");
talkEntry:addResponse("Leave me alone.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Lasst euch das gesagt sein: Legt euch nie mit dem Don an. Das würde bedeuten, ihr bekommt es mit mir zu tun.");
talkEntry:addResponse("Seht ihr hier irgendwo ein Lagerfeuer? Nein? Also, keine Märchen für euch!");
talkEntry:addResponse("Haut ab.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("privateer");
talkEntry:addResponse("Did Mr Lynch send you?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Freibeuter");
talkEntry:addResponse("Schickt euch Mr. Lynch?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Miggs");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Aye?");
talkEntry:addResponse("Shut it!");
talkEntry:addResponse("What!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Miggs");
talkEntry:addResponse("Ja?");
talkEntry:addResponse("Schnauze!");
talkEntry:addResponse("Was!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("Interesting. Now stop talking to me unless you want to work for the Don.");
talkEntry:addResponse("Ah. So, what?");
talkEntry:addResponse("You are a 'yes-man', aren't you? We need such people here in Galmair.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("Interessant. Nun haltet den Schnabel, es sei denn, ihr wollt für den Don arbeiten.");
talkEntry:addResponse("Ah. Und nun?");
talkEntry:addResponse("Ihr seid wohl ein Jasager. Gut, solche Leute können wir hier in Galmair gebrauchen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("Shall I... 'convince' you?");
talkEntry:addResponse("Whatever.");
talkEntry:addResponse("If you say 'no' to the Don, you say 'no' to your... security.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("Soll ich euch... 'überzeugen'?");
talkEntry:addResponse("Wie auch immer.");
talkEntry:addResponse("Sagt ihr 'nein' zum Don, sagt ich 'nein' zu eurer... Unversehrtheit.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("Knochen, Knochen, Knochen. Ich weiß schon gar nicht mehr, wie viele ich gebrochen habe.", "Bones, bones, bones. Can't count how many I broke.");
talkingNPC:addCycleText("Ihr wollt nicht mit mir reden, denn ich will nicht mit euch reden.", "You don't wanna talk to me, 'cause I don't wanna talk to you.");
talkingNPC:addCycleText("Wollt ihr, dass ich euch rausschleppe und euch beibringe, wie man ins Gras beißt?", "You want me to take you outside and teach you how to eat grass?");
talkingNPC:addCycleText("Schonmal eure Zähne gesehen? Naseweißen zeige ich sie gerne, von ganz nahem.", "Ever seen your teeth? Keep crackin' wise, I'll show them to ya... up-close, like.");
talkingNPC:addCycleText("Wenn euch der Don eine Gefälligkeit getan hat, seid besser dankbar, solange ihr noch laufen könnt.", "If the Don did you a favour, better get grateful quick-like... while you can still walk.");
talkingNPC:addCycleText("Der Don möchte, dass ich den Leuten einfache Dinge erkläre. Ich bringe sie dazu, zuzuhören und zu verstehen.", "The Don usually wants me to explain simple things to persons. I make them listen and understand.");
talkingNPC:addCycleText("#me spielt mit seinem Goldkettchen.", "#me plays with a golden chain around his neck.");
talkingNPC:addCycleText("Verdammt!", "Blast!");
talkingNPC:addCycleText("Ich halte die Straßen sauber... von den falschen Leuten.", "I keep the town clean... of the wrong people.");
talkingNPC:addCycleText("Was guckt ihr!?", "What are ye lookin' at!?");
talkingNPC:addCycleText("Macht den Mund zu, es zieht!", "Shut your mouth, there's a terrible draught!");
talkingNPC:addCycleText("Unsere Vorräte an Teppichen gehen zur Neige, ich sollte welche ordern.", "We're running low on carpets, I should order some.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(2);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Dieser NPC ist Miggs, der Handlanger von Don Valerio.", "This NPC is Miggs, the henchman of Don Valerio.");
mainNPC:setUseMessage("Fass mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut dich verwirrt an.", "#me looks at you confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 362);
mainNPC:setEquipment(11, 194);
mainNPC:setEquipment(5, 230);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 48);
mainNPC:setEquipment(9, 459);
mainNPC:setEquipment(10, 326);
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
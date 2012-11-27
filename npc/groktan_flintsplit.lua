--------------------------------------------------------------------------------
-- NPC Name: Groktan Flintsplit                                       Galmair --
-- NPC Job:  'Reminder'                                                       --
--                                                                            --
-- NPC Race: dwarf                      NPC Position:  388, 238, 0            --
-- NPC Sex:  male                       NPC Direction: south                  --
--                                                                            --
-- Author:   Estralis Seborian                                                --
--                                                       easyNPC Parser v1.21 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (1, 388, 238, 0, 4, 'Groktan Flintsplit', 'npc.groktan_flintsplit', 0, 4, 1, 139, 69, 19, 247, 183, 128);
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
module("npc.groktan_flintsplit", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(107, ">", 14));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Error] Something went wrong, please inform a developer."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Groktan Flintsplit the 'reminder'. Keywords: Reminder, Don Valerio Guilianni, quest, gods, debt, money."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Groktan Flintsplit der 'Erinnerer'. Schlüsselwörter: Erinnerer, Don Valerio Guilianni, Quest, Götter, Schulden, Geld."));
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
talkEntry:addResponse("You're not here to pay a bill. So, what is it you want?");
talkEntry:addResponse("Your account with the Don is balanced. Whatcha want?");
talkEntry:addResponse("A good day to you, a good day for Galmair.");
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
talkEntry:addResponse("Du bist nicht hier, um eine Rechnung zu begleichen. Also, was gibt es?");
talkEntry:addResponse("Du hast keine offenen Rechnungen mit dem Don. Was ist los?");
talkEntry:addResponse("Einen guten Tag wünsche ich, einen guten Tag für Galmair.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("You're not here to pay a bill. So, what is it you want?");
talkEntry:addResponse("Your account with the Don is balanced. Whatcha want?");
talkEntry:addResponse("A good day to you, a good day for Galmair.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Du bist nicht hier, um eine Rechnung zu begleichen. Also, was gibt es?");
talkEntry:addResponse("Du hast keine offenen Rechnungen mit dem Don. Was ist los?");
talkEntry:addResponse("Einen guten Tag wünsche ich, einen guten Tag für Galmair.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Come back with some money!");
talkEntry:addResponse("Good bye; and always think what the Don would do to you if you disbehave.");
talkEntry:addResponse("#me grunts: 'Aye, bye'.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Komm mit Geld zurück!");
talkEntry:addResponse("Auf wiedersehen; und denk immer daran, was der Don mit dir machen würde, wenn du dich daneben benimmst.");
talkEntry:addResponse("#me grunzt: 'Aye, servus'.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Come back with some money!");
talkEntry:addResponse("Good bye; and always think what the Don would do to you if you disbehave.");
talkEntry:addResponse("#me grunts: 'Aye, bye'.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Komm mit Geld zurück!");
talkEntry:addResponse("Auf wiedersehen; und denk immer daran, was der Don mit dir machen würde, wenn du dich daneben benimmst.");
talkEntry:addResponse("#me grunzt: 'Aye, servus'.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("The things I do make me feel alright. How about you?");
talkEntry:addResponse("Well, I know many folks who feel worse, usually, the owe the Don some money.");
talkEntry:addResponse("Business is good. The Don cares for me and I care for his debt claims.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befinden");
talkEntry:addResponse("Was mache mache, stellt mich zufrieden. Und wie sieht das bei dir aus?");
talkEntry:addResponse("Nun, ich kenne viele Leute, denen es weit schlechter geht. Meist schulden sie dem Don Geld.");
talkEntry:addResponse("Das Geschäft läuft bestens. Der Don sorgt für mich und ich kümmere mich um seine Schuldscheine.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("I am Badman!");
talkEntry:addResponse("They call me Groktan. As long as they didn't mess with me. Then, they call me Master Groktan!");
talkEntry:addResponse("Groktan Flintsplit. At the Don's service.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ihr name");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Ich bin Badman!");
talkEntry:addResponse("Die Leute nennen mich Groktan, solange sie sich mit mir noch nicht angelegt haben. Hinterher nennen sie mich dann Meister Groktan!");
talkEntry:addResponse("Groktan Flintsplit. Stets dem Don zu Diensten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] The Reminder I"));
talkEntry:addResponse("Aye, ye can help meh. We need five ropes. You know for what, do not ask. Bring 'em and all is fine. If you don't, I'll 'remind' you...");
talkEntry:addConsequence(npc.base.consequence.quest.quest(107, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 0));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Die Erinnerung I"));
talkEntry:addResponse("Japp, ich hätte einen Handlangerdienst. Bring' mir fünf Seile, du weist, wofür. Frag nicht! Bring sie ran und alles ist gut, bring sie nicht und ich werde dich an sie... 'erinnern'.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(107, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 0));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("message");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] The Reminder I"));
talkEntry:addResponse("Aye, ye can help meh. We need five ropes. You know for what, do not ask. Bring 'em and all is fine. If you don't, I'll 'remind' you...");
talkEntry:addConsequence(npc.base.consequence.quest.quest(107, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 0));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Botschaft");
talkEntry:addTrigger("Nachricht");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Die Erinnerung I"));
talkEntry:addResponse("Japp, ich hätte einen Handlangerdienst. Bring' mir fünf Seile, du weist, wofür. Frag nicht! Bring sie ran und alles ist gut, bring sie nicht und ich werde dich an sie... 'erinnern'.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(107, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2760, "all", "<", 5, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Five strong hemp ropes is what I need. Bring 'em or start attachin' them to the tree at the market place, whatever suits you best.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2760, "all", "<", 5, nil));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Fünf feste Hanfseile brauch ich. Bring sie her oder knüpf sie schonmal an den Baum auf dem Marktplatz, wie du meinst.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2760, "all", "<", 5, nil));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("message");
talkEntry:addResponse("Five strong hemp ropes is what I need. Bring 'em or start attachin' them to the tree at the market place, whatever suits you best.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2760, "all", "<", 5, nil));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Botschaft");
talkEntry:addTrigger("Nachricht");
talkEntry:addResponse("Fünf feste Hanfseile brauch ich. Bring sie her oder knüpf sie schonmal an den Baum auf dem Marktplatz, wie du meinst.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2760, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded twenty silver coins. You advance in Don Valerio Guilianni's favour."));
talkEntry:addResponse("Ah, yes, five strong ropes. They'll do the job. You know which job. If you are loyal to the Don, you can do another mission for me.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 2000));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2760, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(107, "=", 2));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2760, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded twenty silver coins."));
talkEntry:addResponse("Ah, yes, five strong ropes. They'll do the job. You know which job. If you are loyal, you can do another mission for me.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 2000));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2760, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(107, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2760, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 200 Kupferstücke. Dein Ansehen bei Don Valerio Guilianni steigt."));
talkEntry:addResponse("Ah, ja, fünf feste Seile. Sie werden's tun, du weißt schon, was. Wenn du dem Don loyal bist, kannst du eine weitere Mission für mich übernehmen.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 2000));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2760, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(107, "=", 2));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2760, "all", ">", 4, nil));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 200 Kupferstücke."));
talkEntry:addResponse("Ah, ja, fünf feste Seile. Sie werden's tun, du weißt schon, was. Wenn du dem Don loyal bist, kannst du eine weitere Mission für mich übernehmen.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 2000));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2760, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(107, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] The Reminder II: You received a message for Miggs."));
talkEntry:addResponse("Aye, another favour you could do, indeed. I have a message for Miggs, a list with names on it. Just names, don't ask! Bring the list to Miggs and you won't read your name on it.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(107, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 2));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Die Erinnerung II: Du hast eine Nachricht für Miggs erhalten."));
talkEntry:addResponse("Aye, du könntest mir noch einen Gefallen tun. Ich habe hier eine Nachricht für Miggs, eine Namensliste. Nur Namen, frag nicht! Bring sie zu Miggs und dein Name wird nicht drauf stehen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(107, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 2));
talkEntry:addTrigger("Task");
talkEntry:addTrigger("Adventure");
talkEntry:addTrigger("Message");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] The Reminder II: You received a message for Miggs."));
talkEntry:addResponse("Aye, another favour you could do, indeed. I have a message for Miggs, a list with names on it. Just names, don't ask! Bring the list to Miggs and you won't read your name on it.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(107, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 2));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Botschaft");
talkEntry:addTrigger("Nachricht");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Die Erinnerung II: Du hast eine Nachricht für Miggs erhalten."));
talkEntry:addResponse("Aye, du könntest mir noch einen Gefallen tun. Ich habe hier eine Nachricht für Miggs, eine Namensliste. Nur Namen, frag nicht! Bring sie zu Miggs und dein Name wird nicht drauf stehen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(107, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 3));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Bring my message to Miggs at once! He shouldn't hit the wrong faces, could be yours.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Bring sofort meine Nachricht zu Miggs! Er soll doch nicht in die falschen Fressen schlagen, es könnte deine sein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 3));
talkEntry:addTrigger("Task");
talkEntry:addTrigger("Adventure");
talkEntry:addTrigger("Message");
talkEntry:addResponse("Bring my message to Miggs at once! He shouldn't hit the wrong faces, could be yours.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 3));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Botschaft");
talkEntry:addTrigger("Nachricht");
talkEntry:addResponse("Bring sofort meine Nachricht zu Miggs! Er soll doch nicht in die falschen Fressen schlagen, es könnte deine sein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded five silver coins and a red wizard hat. You advance in Don Valerio Guilianni's favour."));
talkEntry:addResponse("Good, Miggs got the list who needs a special treatment. I have a little something for you; one of the witches you brought the ropes for won't need her hat anymore. Here, a free hat!");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 500));
talkEntry:addConsequence(npc.base.consequence.item.item(358, 1, 599, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(107, "=", 5));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 10));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded five silver coins and a red wizard hat."));
talkEntry:addResponse("Good, Miggs got the list who needs a special treatment. I have a little something for you; one of the witches you brought the ropes for won't need her hat anymore. Here, a free hat!");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 500));
talkEntry:addConsequence(npc.base.consequence.item.item(358, 1, 599, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(107, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 4));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 50 Kupferstücke und einen roten Zauberhut. Dein Ansehen bei Don Valerio Guilianni steigt."));
talkEntry:addResponse("Gut, Miggs weiß jetzt, wer eine Spezialbehandlung braucht. Ich hab da was für dich; eine der Hexen, für die du ein Seil gebracht hast, wird jetzt ihren Hut nicht mehr brauchen. Hier, ein freigewordener Hut!");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 500));
talkEntry:addConsequence(npc.base.consequence.item.item(358, 1, 599, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(107, "=", 5));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 10));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 4));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 50 Kupferstücke und einen roten Zauberhut."));
talkEntry:addResponse("Gut, Miggs weiß jetzt, wer eine Spezialbehandlung braucht. Ich hab da was für dich; eine der Hexen, für die du ein Seil gebracht hast, wird jetzt ihren Hut nicht mehr brauchen. Hier, ein freigewordener Hut!");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 500));
talkEntry:addConsequence(npc.base.consequence.item.item(358, 1, 599, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(107, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 5));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] The Reminder III: You received a message for Bruno Blackhole."));
talkEntry:addResponse("Arr! Bruno Blackhole, that filthy bastard, owes the Don quite a sum. You have to problem bringing him this special message from me? Good! Off!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(107, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 5));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Die Erinnerung III: Du hast eine Nachricht für Bruno Blackhole erhalten."));
talkEntry:addResponse("Arr! Bruno Blackhole, der dreckige Lump, schuldet dem Don eine ziemliche Summe. Du hast kein Problem damit, ihm diese spezielle Nachricht von mir zu überbringen? Gut! Los!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(107, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 5));
talkEntry:addTrigger("Task");
talkEntry:addTrigger("Adventure");
talkEntry:addTrigger("Message");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] The Reminder III: You received a message for Bruno Blackhole."));
talkEntry:addResponse("Arr! Bruno Blackhole, that filthy bastard, owes the Don quite a sum. You have to problem bringing him this special message from me? Good! Off!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(107, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 5));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Botschaft");
talkEntry:addTrigger("Nachricht");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Die Erinnerung III: Du hast eine Nachricht für Bruno Blackhole erhalten."));
talkEntry:addResponse("Arr! Bruno Blackhole, der dreckige Lump, schuldet dem Don eine ziemliche Summe. Du hast kein Problem damit, ihm diese spezielle Nachricht von mir zu überbringen? Gut! Los!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(107, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 6));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("What are still waiting for? Every day that passes without Bruno Blackhole paying results in higher interest. Off to the Malachite Mine!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 6));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Warauf wartest du? Mit jedem Tag, der vergeht, steigen die Zinsen, die Bruno Blackhole zu zahlen hat. Ab zur Malachitmine!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 6));
talkEntry:addTrigger("Task");
talkEntry:addTrigger("Adventure");
talkEntry:addTrigger("Message");
talkEntry:addResponse("What are still waiting for? Every day that passes without Bruno Blackhole paying results in higher interest. Off to the Malachite Mine!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 6));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Botschaft");
talkEntry:addTrigger("Nachricht");
talkEntry:addResponse("Warauf wartest du? Mit jedem Tag, der vergeht, steigen die Zinsen, die Bruno Blackhole zu zahlen hat. Ab zur Malachitmine!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 7));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded a warhammer. You advance in Don Valerio Guilianni's favour."));
talkEntry:addResponse("Now Bruno will pay, the one or the other way. Anyway, here, for your good services, have my friend. His name is skull splitter!");
talkEntry:addConsequence(npc.base.consequence.item.item(226, 1, 699, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(107, "=", 8));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 10));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 7));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded a warhammer."));
talkEntry:addResponse("Now Bruno will pay, the one or the other way. Anyway, here, for your good services, have my friend. His name is skull splitter!");
talkEntry:addConsequence(npc.base.consequence.item.item(226, 1, 699, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(107, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 7));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst einen Kriegshammer. Dein Ansehen bei Don Valerio Guilianni steigt."));
talkEntry:addResponse("Jetzt wird Bruno zahlen, auf die eine oder andere Weise. Nun, für deine guten Dienste gebe ich dir meinen Freund. Sein Name ist Schädelspalter.");
talkEntry:addConsequence(npc.base.consequence.item.item(226, 1, 699, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(107, "=", 8));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 10));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 7));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst einen Kriegshammer."));
talkEntry:addResponse("Jetzt wird Bruno zahlen, auf die eine oder andere Weise. Nun, für deine guten Dienste gebe ich dir meinen Freund. Sein Name ist Schädelspalter.");
talkEntry:addConsequence(npc.base.consequence.item.item(226, 1, 699, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(107, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 8));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] The Reminder IV: You received a message for Fronita Emery."));
talkEntry:addResponse("She thinks she's smart! Fronita Emery, an artisan of Runewick thinks she can hide in that wicked tower town and avoid paying back her dues. Bring her this payment reminder!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(107, "=", 9));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 8));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Die Erinnerung IV: Du hast eine Nachricht für Fronita Emery erhalten."));
talkEntry:addResponse("Sie denkt, sie ist schlau! Fronita Emery, eine Handwerkerin Runewicks, denkt sie kann sich in der Turmstadt verstecken und ihre Schulden nicht bezahlen. Bring ihr diese letzte Mahnung!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(107, "=", 9));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 8));
talkEntry:addTrigger("Task");
talkEntry:addTrigger("Adventure");
talkEntry:addTrigger("Message");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] The Reminder IV: You received a message for Fronita Emery."));
talkEntry:addResponse("She thinks she's smart! Fronita Emery, an artisan of Runewick thinks she can hide in that wicked tower town and avoid paying back her dues. Bring her this payment reminder!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(107, "=", 9));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 8));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Botschaft");
talkEntry:addTrigger("Nachricht");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Die Erinnerung IV: Du hast eine Nachricht für Fronita Emery erhalten."));
talkEntry:addResponse("Sie denkt, sie ist schlau! Fronita Emery, eine Handwerkerin Runewicks, denkt sie kann sich in der Turmstadt verstecken und ihre Schulden nicht bezahlen. Bring ihr diese letzte Mahnung!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(107, "=", 9));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 9));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Fronita Emery owes the Don a lot; her business isn't doing well. Glass goods don't pay off, keep that in mind when bringing her my message.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 9));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Fronita Emery schuldet dem Don eine Menge; ihr Geschäft läuft nicht so gut. Glaswaren zahlen sich nicht aus, denk daran, wenn du ihr meine Nachricht bringst.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 9));
talkEntry:addTrigger("Task");
talkEntry:addTrigger("Adventure");
talkEntry:addTrigger("Message");
talkEntry:addResponse("Fronita Emery owes the Don a lot; her business isn't doing well. Glass goods don't pay off, keep that in mind when bringing her my message.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 9));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Botschaft");
talkEntry:addTrigger("Nachricht");
talkEntry:addResponse("Fronita Emery schuldet dem Don eine Menge; ihr Geschäft läuft nicht so gut. Glaswaren zahlen sich nicht aus, denk daran, wenn du ihr meine Nachricht bringst.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 10));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded forty silver coins. You advance in Don Valerio Guilianni's favour."));
talkEntry:addResponse("Bad business for Fronita! I'll give you some of the interest she'll pay back now. The Don appreciates loyal minions.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 4000));
talkEntry:addConsequence(npc.base.consequence.quest.quest(107, "=", 11));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 15));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 10));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded forty silver coins."));
talkEntry:addResponse("Bad business for Fronita! I'll give you some of the interest she'll pay back now. The Don appreciates loyal minions.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 4000));
talkEntry:addConsequence(npc.base.consequence.quest.quest(107, "=", 11));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 10));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 400 Kupferstücke. Dein Ansehen bei Don Valerio Guilianni steigt."));
talkEntry:addResponse("Schlechtes Geschäft für Fronita! Ich gebe dir ein wenig von den Zinsen, die sie dem Don nun zurückzahlen wird. Der Don belohnt loyale Handlanger.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 4000));
talkEntry:addConsequence(npc.base.consequence.quest.quest(107, "=", 11));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 15));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 10));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 400 Kupferstücke."));
talkEntry:addResponse("Schlechtes Geschäft für Fronita! Ich gebe dir ein wenig von den Zinsen, die sie dem Don nun zurückzahlen wird. Der Don belohnt loyale Handlanger.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 4000));
talkEntry:addConsequence(npc.base.consequence.quest.quest(107, "=", 11));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 11));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] The Reminder V: You received a message for Queen Rosaline Edwards."));
talkEntry:addResponse("The Don trusts me and I trust you. This time, you have to deliver a very... special message. Bring this 'letter of appreciation' to the Queen of Cadomyr. No word to anyone! Off!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(107, "=", 12));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 11));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Die Erinnerung V: Du hast eine Nachricht für Königin Rosaline Edwards erhalten."));
talkEntry:addResponse("Der Don vertraut mir und ich traue dir. Diesmal musst du eine 'besondere' Nachricht überbringen. Bring diesen 'Brief der Wertschätzung' zur Königin von Cadomyr. Kein Wort zu niemanden! Los!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(107, "=", 12));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 11));
talkEntry:addTrigger("Task");
talkEntry:addTrigger("Adventure");
talkEntry:addTrigger("Message");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] The Reminder V: You received a message for Queen Rosaline Edwards."));
talkEntry:addResponse("I trust you. The Don trusts you. This time, you have to deliver a very... special message. Bring this 'letter of appreciation' to the Queen of Cadomyr. No word to anyone! Off!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(107, "=", 12));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 11));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Botschaft");
talkEntry:addTrigger("Nachricht");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Die Erinnerung V: Du hast eine Nachricht für Königin Rosaline Edwards erhalten."));
talkEntry:addResponse("Der Don vertraut mir und ich traue dir. Diesmal musst du eine 'besondere' Nachricht überbringen. Bring diesen 'Brief der Wertschätzung' zur Königin von Cadomyr. Kein Wort zu niemanden! Los!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(107, "=", 12));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 12));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Well, well, you didn't deliver the love letter of the Don to Rosaline Edwards? So, what are you waiting for!?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 12));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Soso, den Liebesbrief des Dons für Rosaline Edwards hast du noch nicht überbracht? Also, worauf wartest du!?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 12));
talkEntry:addTrigger("Task");
talkEntry:addTrigger("Adventure");
talkEntry:addTrigger("Message");
talkEntry:addResponse("Well, well, you didn't deliver the love letter of the Don to Rosaline Edwards? So, what are you waiting for!?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 12));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Botschaft");
talkEntry:addTrigger("Nachricht");
talkEntry:addResponse("Soso, den Liebesbrief des Dons für Rosaline Edwards hast du noch nicht überbracht? Also, worauf wartest du!?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 13));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded a charm of the icebird. You advance in Don Valerio Guilianni's favour."));
talkEntry:addResponse("I already heard the Queen of Cadomyr wasn't so fond of the message you brought her. The Don won't like to hear the news. My next mission would have been that you bring her this necklace; keep it and keep silent about all this!");
talkEntry:addConsequence(npc.base.consequence.item.item(334, 1, 999, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(107, "=", 14));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 13));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded a charm of the icebird."));
talkEntry:addResponse("I already heard the Queen of Cadomyr wasn't so fond of the 'message' you brought her. The Don won't like to hear the news. My next mission would have been that you bring her this necklace; keep it and keep silent about all this!");
talkEntry:addConsequence(npc.base.consequence.item.item(334, 1, 999, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(107, "=", 14));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 13));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst ein Eisvogelamulett. Dein Ansehen bei Don Valerio Guilianni steigt."));
talkEntry:addResponse("Ich habe schon davon gehört, dass die Königin von Cadomyr nicht so begeistert über die 'Nachricht' war, die du ihr gebracht hast. Den Don wird das nicht freuen. Meine nächste Mission wäre gewesen, dass du ihr diesen Halsschmuck bringst. Behalte ihn und die ganze Angelegenheit für dich!");
talkEntry:addConsequence(npc.base.consequence.item.item(334, 1, 999, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(107, "=", 14));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 13));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst ein Eisvogelamulett."));
talkEntry:addResponse("Ich habe schon davon gehört, dass die Königin von Cadomyr nicht so begeistert über die 'Nachricht' war, die du ihr gebracht hast. Den Don wird das nicht freuen. Meine nächste Mission wäre gewesen, dass du ihr diesen Halsschmuck bringst. Behalte ihn und die ganze Angelegenheit für dich!");
talkEntry:addConsequence(npc.base.consequence.item.item(334, 1, 999, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(107, "=", 14));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 14));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("You did so much for me and the Don; one could be suspicious why. So, I'll stick to other henchmen, no offense.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 14));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Du hast schon so viel für mich und den Don getan; man könnte misstrauisch werden, warum. Ich werde mich anderer Handlanger bedienen, wenns dir nichts ausmacht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 14));
talkEntry:addTrigger("Task");
talkEntry:addTrigger("Adventure");
talkEntry:addTrigger("Message");
talkEntry:addResponse("You did so much for me and the Don; one could be suspicious why. So, I'll stick to other henchmen, no offense.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 14));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Botschaft");
talkEntry:addTrigger("Nachricht");
talkEntry:addResponse("Du hast schon so viel für mich und den Don getan; man könnte misstrauisch werden, warum. Ich werde mich anderer Handlanger bedienen, wenns dir nichts ausmacht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("I remind people, that's what I do. First, I remind them to pay. Then I make something with them that reminds them that they didn't pay. For good!");
talkEntry:addResponse("Many people owe the Don a lot. I keep track of this. And I never forget!");
talkEntry:addResponse("The Don relies on me to 'remind' people on paying their debts. Makes me proud, aye!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Ich erinnere die Leute, das ist mein Ding. Zuerst erinnere ich sie daran, dass sie zu zahlen haben. Dann verpasse ich ihnen etwas, was sie immer daran erinnert, dass sie nicht gezahlt haben.");
talkEntry:addResponse("Viele Leute schulden dem Don eine Menge. Und ich vergesse nie etwas!");
talkEntry:addResponse("Der Don verlässt sich auf mich, seine Schuldner daran zu 'erinnern', was sie ihm schulden. Macht mich stolz, aye!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("I remind people, that's what I do. First, I remind them to pay. Then I make something with them that reminds them that they didn't pay. For good!");
talkEntry:addResponse("Many people owe the Don a lot. I keep track of this. And I never forget!");
talkEntry:addResponse("The Don relies on me to 'remind' people on paying their debts. Makes me proud, aye!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Ich erinnere die Leute, das ist mein Ding. Zuerst erinnere ich sie daran, dass sie zu zahlen haben. Dann verpasse ich ihnen etwas, was sie immer daran erinnert, dass sie nicht gezahlt haben.");
talkEntry:addResponse("Viele Leute schulden dem Don eine Menge. Und ich vergesse nie etwas!");
talkEntry:addResponse("Der Don verlässt sich auf mich, seine Schuldner daran zu 'erinnern', was sie ihm schulden. Macht mich stolz, aye!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("What that's supposed to be?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Was soll das sein?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("Let me check... no, you don't have debts.");
talkEntry:addResponse("Nice. And I am not nice.");
talkEntry:addResponse("I'm Groktan. Mess with the Don and you mess with me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Lass mich mal nachsehen... nein, du hast keine Schulden.");
talkEntry:addResponse("Nett. Und ich bin nicht nett.");
talkEntry:addResponse("Ich bin Groktan. Leg dich mit dem Don an und du kriegst es mit mir zu tun.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("reminder");
talkEntry:addResponse("I remind people, that's what I do. First, I remind them to pay. Then I make something with them that reminds them that they didn't pay. For good!");
talkEntry:addResponse("Many people owe the Don a lot. I keep track of this. And I never forget!");
talkEntry:addResponse("The Don relies on me to 'remind' people on paying their debts. Makes me proud, aye!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ruff");
talkEntry:addTrigger("bully");
talkEntry:addResponse("I'm not ruff. I'm direct and strict. And I am fair. Pay and you are alright. Don't pay and, well, the opposite.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("owe");
talkEntry:addTrigger("debt");
talkEntry:addResponse("Debts with Don Valerio are a special issue. Who is loyal to the Don gets credit and deferral. But who does not pay his protection fee loses his protection - from me!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("money");
talkEntry:addResponse("Copper, silver and gold. The first I toss at beggars, right in their face. The second I keep for me. The last is for the Don. Never forget this!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("interest");
talkEntry:addResponse("Interest? What's that? Either, you pay back in time what you borrowed or you pay with your bones. Does that go by the term 'interest'?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erinnerer");
talkEntry:addResponse("Ich erinnere die Leute, das ist mein Ding. Zuerst erinnere ich sie daran, dass sie zu zahlen haben. Dann verpasse ich ihnen etwas, was sie immer daran erinnert, dass sie nicht gezahlt haben.");
talkEntry:addResponse("Viele Leute schulden dem Don eine Menge. Und ich vergesse nie etwas!");
talkEntry:addResponse("Der Don verlässt sich auf mich, seine Schuldner daran zu 'erinnern', was sie ihm schulden. Macht mich stolz, aye!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Grobian");
talkEntry:addTrigger("Schläger");
talkEntry:addResponse("Ich bin kein Grobian. Ich bin streng und direkt. Aber ich bin fair. Zahle, und alles wird gut. Zahle nicht und es geschieht das Gegenteil.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Schuld");
talkEntry:addResponse("Schulden bei Don Valerio sind so eine Sache. Wer loyal zum Don steht, dem gewährt er gerne Kredit oder Stundung. Aber wer seine Protektionsgebühr nicht rechtzeitig zahlt, der verliert auch seinen Schutz... vor mir!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("geld");
talkEntry:addResponse("Kupfer, Silber und Gold. Mit dem ersten bewerfe ich Bettler, mitten in die Fresse. Das zweite behalte ich für mich. Das letzte gehört dem Don, vergiss das nie!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zins");
talkEntry:addResponse("Zinsen? Was soll das denn sein? Entweder, du zahlst deine Schulden rechtzeitig zurück oder zu zahlst mit deinen Knochen. Ist es das, was man unter 'Zinsen' versteht?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Dwarf");
talkEntry:addResponse("If you're here for the throwing competition, I have to dissapoint you. It was canceled due to a lack of healthy participants.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zwerg");
talkEntry:addResponse("Wenn du wegen dem Weitwurfwettbewerb hier bist, muss ich dich enttäuschen. Der wurde mangels gesunder Teilnehmer abgesagt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Miggs");
talkEntry:addResponse("Aye, Miggs. My best regards to him. You can find him in the headquarter of Don Valerio. He does the... serious cases for the Don.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Miggs");
talkEntry:addResponse("Aye, Miggs. Meine besten Grüße an ihn. Du findest ihn im Hauptquartier von Don Valerio. Er übernimmt die... schwierigen Fälle des Dons.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Bruno");
talkEntry:addTrigger("Blackhole");
talkEntry:addResponse("Bruno Blackhole is a lazy digger who pretends to work in the Malachite mine. Didn't really make him rich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bruno");
talkEntry:addTrigger("Blackhole");
talkEntry:addResponse("Bruno Blackhole ist eine fauler Wühler der so tut, als würde er in der Malachitmine arbeiten. Hat ihn jedenfalls nicht reich gemacht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Fronita");
talkEntry:addTrigger("Emery");
talkEntry:addResponse("In Runewick, you can find skilled artisans. Fronita Emery is one of them; instead of cost effective goods, she crafts silly vases nobody buys, anyway.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Fronita");
talkEntry:addTrigger("Emery");
talkEntry:addResponse("In Runewick kann man recht geschickte Handwerker finden. Fronita Emery gehört zu ihnen; anstatt allerdings preiswerte Waren anzubieten, verschwendet sie ihre Zeit mit Vasen, die eh niemand kauft.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("bottle");
talkEntry:addResponse("Payment reminder don't come in a bottle. Maybe by a bottle on your head!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("flasche");
talkEntry:addResponse("Mahnungen werden nicht als Flaschenpost verschickt. Vielleicht aber als Flasche auf deinen Kopf!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Snickers");
talkEntry:addResponse("Could take a while...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Snickers");
talkEntry:addResponse("Wenns mal wieder länger dauert...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addResponse("I don't really know Archmage Morgan. Word is that he's a bit... quirky. But if you care, why don't you visit him?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Ich kenne den Erzmagier Morgan nicht recht. Man sagt, er sei etwas... sonderbar. Wenns dich interessiert, besuch in doch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("I don't really know Archmage Morgan. Word is that he's a bit... quirky. But if you care, why don't you visit him?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Ich kenne den Erzmagier Morgan nicht recht. Man sagt, er sei etwas... sonderbar. Wenns dich interessiert, besuch in doch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Runewick is not a town but a joke. I mean, who would be so stupid to build towers in the ocean?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Runewick ist keine Stadt, sondern ein Witz. Ich meine, wer ist so dämlich und baut Türme im Ozean?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Don Valerio is like a father to me. One could say, like a godfather.");
talkEntry:addResponse("Say a bad word about the Don and risk a teeth. Say another and you risk your tongue.");
talkEntry:addResponse("Don Valerio built up what you see here. Not by brick by brick, but coin by coin. Wealth is what Galmair made strong.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Don Valerio ist wie ein Vater für mich. Wie ein Pate, könnte man auch sagen.");
talkEntry:addResponse("Sag ein böses Wort über den Don und die riskierst einen Zahn. Sage ein weiteres und du riskierst deine Zunge.");
talkEntry:addResponse("Don Valerio hat all dies hier aufgebaut. Nicht Stein für Stein, sondern Münze für Münze. Reichtum hat Galmair stark gemacht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Actually, Galmair is my home. And yes, in this valley, there was once a dwarven stronghold. I'm a dwarf, so I feel quite comfortable here.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Galmair ist genau genommen meine Heimat. Und ja, in diesem Tal war einst eine Zwergenfeste. Ich bin ein Zwerg, also fühl ich mich hier wohl.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Queen");
talkEntry:addResponse("Rosi. Arr, a pretty wife she would be. Not for me, of course. For who? Nevermind!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königin");
talkEntry:addResponse("Rosi. Arr, sie wäre eine schöne Ehefrau. Natürlich nicht für mich. Für wen dann? Vergiss es.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Rosi. Arr, a pretty wife she would be. Not for me, of course. For who? Nevermind!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Rosi. Arr, sie wäre eine schöne Ehefrau. Natürlich nicht für mich. Für wen dann? Vergiss es.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Personally, I don't like Cadomyr. I understand that it has many resources and, despite arid, it's a rich country. But I wouldn't want to live there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Wenn du mich fragst, ich mag Cadomyr nicht so recht. Ich weiß, dass es viele Bodenschätze hat und trotz der Trockenheit ist es ein reiches Land. Aber leben möchte ich dort nicht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("albar");
talkEntry:addResponse("I'm not so familiar with other lands. Albar you say? Sounds like a good sparkling wine.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("Ich kenne mich nicht mit anderen Ländern aus. Albar sagst du? Klingt nach einem guten Schaumwein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addResponse("Gynk; oh yes, the land of my dreams. Freedom for everyone, at least if you can afford it.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("Gynk; oh ja, das Land meiner Träume. Freiheit für alle, solange man sie sich leisten kann.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Don Valerio once stated that Salkamar isn't as bad as everyone thinks. I don't want to find out, Galmair is my land.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Don Valerio erwähnte einst, Salkamar. wäre gar nicht so schlimm, wie alle immer meinen. Ich will es eigentlich gar nicht rausfinden, Galmair ist mein Land.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("Gods are overrated. They won't pay your dues. They may inspire your life, though.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Die Götter werden überschätzt. Sie werden nicht deine Schulden bezahlen. Aber sie können dich zu einem besseren Leben inspirieren.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Adron");
talkEntry:addResponse("The god of booze, that's Adron. Anything interesting about him?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Adron");
talkEntry:addResponse("Der Suffgott, das ist Adron. Gibts sonst noch was über ihn zu sagen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addResponse("For Brágon gave us the flame... my tinderbox does, to. Do I pray to my tinderbox!?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addResponse("Und Brágon gab uns das Feuer... Zündhölzer können das auch. Bete ich deshalb Zündhölzer an!?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cherga");
talkEntry:addResponse("I'm not dead, so leave me alone with Cherga.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addResponse("Ich bin nicht tot, also lass mich mit Cherga in Frieden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elara");
talkEntry:addResponse("Who was that again? Eleven younger gods, how am I supposed to remember them all?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elara");
talkEntry:addResponse("Wer war die nochmal? Elf junge Götter, wie soll man sich die alle merken!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Eldan");
talkEntry:addResponse("You don't want to talk to a dwarf like me about Eldan. You do not want to. Better for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eldan");
talkEntry:addResponse("Du willst mit einem Zwerg wie mir nicht über Eldan reden. Das willst du nicht. Ist besser für dich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Findari");
talkEntry:addResponse("You don't want to talk to a dwarf like me about Findari. You do not want to. Better for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Findari");
talkEntry:addResponse("Du willst mit einem Zwerg wie mir nicht über Findari reden. Das willst du nicht. Ist besser für dich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("Irmorom is called 'father' by some of my bethren. I don't know my father. But I seriously doubt a god would mate with my mother.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("Manche meiner Zwergenbrüder nennen Irmorom 'Vater' Ich kenne meinen Vater nicht. Aber ich glaube kaum, dass sich ein Gott mit meiner Mutter eingelassen hat.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addResponse("Who was that again? Eleven younger gods, how am I supposed to remember them all?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addResponse("Wer war die nochmal? Elf junge Götter, wie soll man sich die alle merken!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Moshran");
talkEntry:addResponse("Who was that again? Eleven younger gods, how am I supposed to remember them all?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Moshran");
talkEntry:addResponse("Wer war die nochmal? Elf junge Götter, wie soll man sich die alle merken!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addTrigger("Nargùn");
talkEntry:addResponse("You don't want to talk to a dwarf like me about Nargún. You do not want to. Better for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addTrigger("Nargùn");
talkEntry:addResponse("Du willst mit einem Zwerg wie mir nicht über Nargún reden. Das willst du nicht. Ist besser für dich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("Oh. Oldra, the goddess of ferti... fert... something.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("Oh. Oldra, die Göttin der Fruchtbar... Furchtbarkeit!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("Oh, my god!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("Oh, mein Gott!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("You don't want to talk to a dwarf like me about Sirani. You do not want to. Better for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("Du willst mit einem Zwerg wie mir nicht über Sirani reden. Das willst du nicht. Ist besser für dich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("You don't want to talk to a dwarf like me about Tanora. You do not want to. Better for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("Du willst mit einem Zwerg wie mir nicht über Tanory reden. Das willst du nicht. Ist besser für dich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("Ushara is called 'mother' by some of my bethren. I knew my mother. Her name wasn't Ushara, not even Uschi.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("Manche meiner Zwergenbrüder nennen Ushara 'Mutter' Ich kannte meine Mutter. Ihr Name war nicht Ushara, nicht mal Uschi.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Zhambra");
talkEntry:addResponse("Zhambra is the most overrated god of them all. Friendship, eh? I show you friendship. My friend is my fist. And yours?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zhambra");
talkEntry:addResponse("Zhambra ist der am meisten überschätzte Gott von allen. Freundschaft, eh? Ich zeig dir gleich Freundschaft. Meine Freundin ist meine Faust. Deine auch?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("Come to me if you owe the Don money. Then, you give it to me. If you don't, I give something to you. Right in your face!");
talkEntry:addResponse("I'm not a trader. The difference is: I just take money and give nothing in return. You just get something from me if you don't pay. Pain!");
talkEntry:addResponse("Get lost if you want to barter.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Komm zu mir, wenn du dem Don Geld schuldest. Das gibst du dann mir. Wenn du das nicht tust, dann gebe ich dir was. Auf die Fresse!");
talkEntry:addResponse("Ich bin doch kein Händler. Der Unterschied: Ich nehme nur Geld und gebe nichts im Gegenzug. Du bekommst nur etwas von mir, wenn du nicht bezahlst. Schmerz!");
talkEntry:addResponse("Hau ab, wenn du feilschen willst.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("I'm not in the mood.");
talkEntry:addResponse("Do I look like an elven bard?");
talkEntry:addResponse("Do you know how much pain it is when you pull on somebody's tongue? Lizards don't like this, especially.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Mir ist nicht danach.");
talkEntry:addResponse("Sehe ich aus wie ein Elfenbarde?");
talkEntry:addResponse("Weißt du eigentlich, wie schmerzhaft es ist, jemanden an der Zunge zu ziehen? Echsenwesen hassen das ganz besonders.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Groktan");
talkEntry:addTrigger("Flintsplit");
talkEntry:addResponse("Who asks for me?");
talkEntry:addResponse("Arr!");
talkEntry:addResponse("What do you want? Bruises?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Groktan");
talkEntry:addTrigger("Flintsplit");
talkEntry:addResponse("Wer fragt nach mir?");
talkEntry:addResponse("Arr!");
talkEntry:addResponse("Was wollt ihr? Ne Abreibung?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("There is something I wanted to say, but I forgot...");
talkEntry:addResponse("Can you rephrase that?");
talkEntry:addResponse("Don't try to fool me or I fool you... in your face!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("Ich wollte gerade noch etwas sagen, aber ich hab es vergessen.");
talkEntry:addResponse("Kannst das anders ausdrücken?");
talkEntry:addResponse("Veräppel mich und ich veräppel... dein Gesicht!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("Whatever, I do what the Don wants.");
talkEntry:addResponse("That is pretty interesting, why don't you tell more about that?");
talkEntry:addResponse("What!?");
talkEntry:addResponse("Eh?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("Na und, ich mach was der Don mir sagt.");
talkEntry:addResponse("Das ist sehr interessant, warum erzählst du nicht mehr darüber?");
talkEntry:addResponse("Was!?");
talkEntry:addResponse("Eh?");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("Rarr!", "Rarr!");
talkingNPC:addCycleText("Eine gutgemeinte Mahnung: Vergesst nie, was ihr dem Don schuldet.", "Today's free reminder: Never forget what you owe the Don.");
talkingNPC:addCycleText("#me zückt ein Notizbuch und streicht etwas durch: 'Erinnert!'", "#me takes out a notebook and rules out a line: 'Reminded!'");
talkingNPC:addCycleText("Wenn der Don all das Geld hätte, was ihm die Leute schulden, wäre er ein reicher Mann!", "If the Don had all the money people owe him, he'd be rich!");
talkingNPC:addCycleText("Zahltag!", "Payday!");
talkingNPC:addCycleText("#me rümpft die Nase: 'Geld stinkt nicht. Muss also was anderes sein. Ich bin's nicht!'", "#me wrinkles his nose: 'Money doesn't stink. Has to be something else, but not me!'");
talkingNPC:addCycleText("Schweigen ist Gold, Zahlen hält gesund.", "Silence is golden, paying is healthy.");
talkingNPC:addCycleText("Ich bin der Herr von Ratschkling!", "I am the Lord of Kerching!");
talkingNPC:addCycleText("Die, die bezahlt haben, wurden daran erinnert. Die, die nicht zahlten, werden sich immer daran erinnern.", "Those who payed were reminded. Those who didn't will remember.");
talkingNPC:addCycleText("Bringt da jemand Geld für den Don?", "Got money for the Don?");
mainNPC:addLanguage(0);
mainNPC:addLanguage(2);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Dieser NPC ist der 'Erinnerer' Groktan.", "This NPC is the 'reminder' Groktan.");
mainNPC:setUseMessage("Ich werd' dir Manieren beibringen!", "I'll teach yer touchin' meh!");
mainNPC:setConfusedMessage("Schnauze!", "Shut it!");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 812);
mainNPC:setEquipment(11, 0);
mainNPC:setEquipment(5, 2664);
mainNPC:setEquipment(6, 0);
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
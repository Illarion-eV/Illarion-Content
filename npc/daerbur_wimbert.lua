--------------------------------------------------------------------------------
-- NPC Name: Daerbur Wimbert                                          Galmair --
-- NPC Job:  miner                                                            --
--                                                                            --
-- NPC Race: dwarf                      NPC Position:  392, 160, -3           --
-- NPC Sex:  male                       NPC Direction: west                   --
--                                                                            --
-- Author:   Estralis Seborian                                                --
--                                                       easyNPC Parser v1.21 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (1, 392, 160, -3, 6, 'Daerbur Wimbert', 'npc.daerbur_wimbert', 0, 2, 2, 192, 107, 5, 206, 157, 115);
---]]

require("npc.base.basic")
require("npc.base.condition.item")
require("npc.base.condition.language")
require("npc.base.condition.quest")
require("npc.base.condition.skill")
require("npc.base.condition.town")
require("npc.base.consequence.deleteitem")
require("npc.base.consequence.inform")
require("npc.base.consequence.item")
require("npc.base.consequence.money")
require("npc.base.consequence.quest")
require("npc.base.consequence.rankpoints")
require("npc.base.consequence.skill")
require("npc.base.consequence.trade")
require("npc.base.talk")
module("npc.daerbur_wimbert", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is the miner Daerbur Wimbert. Keywords: Hello, quest, pick-axe, miner."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist der Bergarbeiter Daerbur Wimbert. Schlüsselwörter: Hallo, Quest, Spitzhacke, Bergarbeiter."));
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
talkEntry:addResponse("Huh?");
talkEntry:addResponse("Hah?");
talkEntry:addResponse("Heh?");
talkEntry:addResponse("Hih?");
talkEntry:addResponse("Hoh?");
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
talkEntry:addResponse("Huh?");
talkEntry:addResponse("Hah?");
talkEntry:addResponse("Heh?");
talkEntry:addResponse("Hih?");
talkEntry:addResponse("Hoh?");
talkEntry:addResponse("Häh?");
talkEntry:addResponse("Höh?");
talkEntry:addResponse("Hüh?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Huh?");
talkEntry:addResponse("Hah?");
talkEntry:addResponse("Heh?");
talkEntry:addResponse("Hih?");
talkEntry:addResponse("Hoh?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Huh?");
talkEntry:addResponse("Hah?");
talkEntry:addResponse("Heh?");
talkEntry:addResponse("Hih?");
talkEntry:addResponse("Hoh?");
talkEntry:addResponse("Häh?");
talkEntry:addResponse("Höh?");
talkEntry:addResponse("Hüh?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("So, you are leaving. That is interesting, that means, you go somewhere else. Exciting!");
talkEntry:addResponse("Why did you come if you wanted to leave anyway? You like change to your life, I assume.");
talkEntry:addResponse("Bye");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("So, du gehst also. Das ist interessant, denn das bedeutet, dass du woanders hingehst. Wie spanned!");
talkEntry:addResponse("Wieso bist du überhaupt gekommen, wenn du eh wieder gehen wolltest? Du magst Veränderungen in deinem Leben, richtig?");
talkEntry:addResponse("Tschüß!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("So, you are leaving. That is interesting, that means, you go somewhere else. Exciting!");
talkEntry:addResponse("Why did you come if you wanted to leave anyway? You like change to your life, I assume.");
talkEntry:addResponse("Bye.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("So, du gehst also. Das ist interessant, denn das bedeutet, dass du woanders hingehst. Wie spanned!");
talkEntry:addResponse("Wieso bist du überhaupt gekommen, wenn du eh wieder gehen wolltest? Du magst Veränderungen in deinem Leben, richtig?");
talkEntry:addResponse("Tschüß!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("Good and bad at once I feel. Sometimes, I feel a bit more bad than good, sometimes vice versa.");
talkEntry:addResponse("I feel just like you, maybe a bit more sad or lucky, who knows.");
talkEntry:addResponse("Wie fühlst du dich denn so? Ach, warum haben Leute kein Gefühlssinn, dann würde das dusselige Fragen entfallen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addResponse("Gut und schlecht gleichzeitig, so fühl ich mich. Manchmal ein bisschen mehr schlecht als gut, manchmal genau anders herum.");
talkEntry:addResponse("Ich fühl mich genauso wie du, vielleicht ein wenig schlechter oder besser, wer weiß das schon.");
talkEntry:addResponse("How do you feel? Alas, why don't we all have a sense for feelings, then, all these stupid questions would be unnecessary.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("Daerbur Wimbert.");
talkEntry:addResponse("Daerbur.");
talkEntry:addResponse("Daerbur Wimbert, son of Dimbur Wimbert and Klemka Jebmil, brother of Turgen Wimbert and Nadla Wimbert. That's me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ihr name");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Daerbur Wimbert.");
talkEntry:addResponse("Daerbur.");
talkEntry:addResponse("Daerbur Wimbert, Sohn von Dimbur Wimbert und Klemka Jebmil, Bruder von Turgen Wimbert und Nadla Wimbert. Das bin ich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(108, "=", 9));
talkEntry:addTrigger("message");
talkEntry:addTrigger("news");
talkEntry:addTrigger("letter");
talkEntry:addTrigger("scroll");
talkEntry:addTrigger("parchment");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest status] Delayed Mail IV: You deliver the message from Hector Valerion to Daerbur Wimbert."));
talkEntry:addResponse("#me turns the scroll around twice: 'Gems, she wants, the queen. That makes them queengems for the gemqueen! That makes me the queengemdeliverer, jidah!'");
talkEntry:addConsequence(npc.base.consequence.quest.quest(108, "=", 10));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(108, "=", 9));
talkEntry:addTrigger("nachricht");
talkEntry:addTrigger("brief");
talkEntry:addTrigger("Botschaft");
talkEntry:addTrigger("Schriftrolle");
talkEntry:addTrigger("Pergament");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Queststatus] Späte Post IV: Du überbringst Daerbur Wimbert die Nachricht von Hector Valerion."));
talkEntry:addResponse("#me dreht die Schriftrolle zweimal rundherum: 'Edelsteine will sie, die Königin. Das sind also Königinnenedelsteine für die Edelsteinkönigin. Das macht mich zum Königinnenedelsetinlieferant, jidah!'");
talkEntry:addConsequence(npc.base.consequence.quest.quest(108, "=", 10));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(108, "=", 9));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hector");
talkEntry:addTrigger("Valerion");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest status] Delayed Mail IV: You deliver the message from Hector Valerion to Daerbur Wimbert."));
talkEntry:addResponse("#me turns the scroll around twice: 'Gems, she wants, the queen. That makes them queengems for the gemqueen! That makes me the queengemdeliverer, jida!'");
talkEntry:addConsequence(npc.base.consequence.quest.quest(108, "=", 10));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(108, "=", 9));
talkEntry:addTrigger("Hector");
talkEntry:addTrigger("Valerion");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Queststatus] Späte Post IV: Du überbringst Daerbur Wimbert die Nachricht von Hector Valerion."));
talkEntry:addResponse("#me dreht die Schriftrolle zweimal rundherum: 'Edelsteine will sie, die Königin. Das sind also Königinnenedelsteine für die Edelsteinkönigin. Das macht mich zum Königinnenedelsetinlieferant, jidah!'");
talkEntry:addConsequence(npc.base.consequence.quest.quest(108, "=", 10));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(68, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Dark Hole Mine I"));
talkEntry:addResponse("Somehow, all rocks have decided to lay down on the gems. Can you collect ten stone blocks with this pick so I can reach the gems underneath?");
talkEntry:addConsequence(npc.base.consequence.item.item(2763, 1, 399, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(68, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(68, "=", 0));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Dunkellochmine I"));
talkEntry:addResponse("Aus irgendeinem Grund haben die Felsen beschlossen, sich auf die Edelsteine zu legen. Kannst du zehn Steinblöcke mit dieser Spitzhacke sammeln, damit ich an die Edelsteine darunter komme?");
talkEntry:addConsequence(npc.base.consequence.item.item(2763, 1, 399, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(68, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(68, "=", 0));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Dark Hole Mine I"));
talkEntry:addResponse("Somehow, all rocks have decided to lay down on the gems. Can you collect ten stone blocks with this pick so I can reach the gems underneath?");
talkEntry:addConsequence(npc.base.consequence.item.item(2763, 1, 399, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(68, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(68, "=", 0));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Dunkellochmine I"));
talkEntry:addResponse("Aus irgendeinem Grund haben die Felsen beschlossen, sich auf die Edelsteine zu legen. Kannst du zehn Steinblöcke mit dieser Spitzhacke sammeln, damit ich an die Edelsteine darunter komme?");
talkEntry:addConsequence(npc.base.consequence.item.item(2763, 1, 399, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(68, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(68, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(733, "all", "<", 10, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Away with those rocks! Bring me ten stone blocks and I'll reward you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(68, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(733, "all", "<", 10, nil));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Weg mit den Steinen! Bring mir zehn Blöcke und ich belohne dich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(68, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(733, "all", "<", 10, nil));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("Away with those rocks! Bring me ten stone blocks and I'll reward you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(68, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(733, "all", "<", 10, nil));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Weg mit den Steinen! Bring mir zehn Blöcke und ich belohne dich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.mining, "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(68, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(733, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded five silver coins and your mining skill increases. You advance in Don Valerio Guilianni's favour."));
talkEntry:addResponse("Perfect. Why have rocks no legs so we could stop carrying them? Here is your reward.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.mining, "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 500));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(733, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(68, "=", 2));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(68, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(733, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded five silver coins. You advance in Don Valerio Guilianni's favour."));
talkEntry:addResponse("Perfect. Why have rocks no legs so we could stop carrying them? Here is your reward.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 500));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(733, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(68, "=", 2));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.mining, "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(68, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(733, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 50 Kupferstücke und deine Bergbaufertigkeit steigt. Dein Ansehen bei Don Valerio Guilianni steigt."));
talkEntry:addResponse("Perfekt. Warum wachsen den Steinen eigentlich keine Beine, dann könnten wir uns das Geschleppe sparen. Hier ist deine Belohnung.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.mining, "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 500));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(733, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(68, "=", 2));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(68, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(733, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 50 Kupferstücke. Dein Ansehen bei Don Valerio Guilianni steigt."));
talkEntry:addResponse("Perfekt. Warum wachsen den Steinen eigentlich keine Beine, dann könnten wir uns das Geschleppe sparen. Hier ist deine Belohnung.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 500));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(733, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(68, "=", 2));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.mining, "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(68, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(733, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded five silver coins and your mining skill increases."));
talkEntry:addResponse("Perfect. Why have rocks no legs so we could stop carrying them? Here is your reward.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.mining, "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 500));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(733, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(68, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(68, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(733, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded five silver coins."));
talkEntry:addResponse("Perfect. Why have rocks no legs so we could stop carrying them? Here is your reward.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 500));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(733, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(68, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.mining, "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(68, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(733, "all", ">", 9, nil));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 50 Kupferstücke und deine Bergbaufertigkeit steigt."));
talkEntry:addResponse("Perfekt. Warum wachsen den Steinen eigentlich keine Beine, dann könnten wir uns das Geschleppe sparen. Hier ist deine Belohnung.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.mining, "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 500));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(733, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(68, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(68, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(733, "all", ">", 9, nil));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 50 Kupferstücke."));
talkEntry:addResponse("Perfekt. Warum wachsen den Steinen eigentlich keine Beine, dann könnten wir uns das Geschleppe sparen. Hier ist deine Belohnung.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 500));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(733, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(68, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(68, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Dark Hole Mine II"));
talkEntry:addResponse("There is so much coal on top of the gems. Can you dig away twenty lumps of coal and bring them to me?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(68, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(68, "=", 2));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Dunkellochmine II"));
talkEntry:addResponse("Es liegt eindeutig zu viel Kohle über den Edelsteinen. Schippst du bitte zwanzig Klumpen weg und bringst sie mir?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(68, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(68, "=", 2));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Dark Hole Mine II"));
talkEntry:addResponse("There is so much coal on top of the gems. Can you dig away twenty lumps of coal and bring them to me?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(68, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(68, "=", 2));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Dunkellochmine II"));
talkEntry:addResponse("Es liegt eindeutig zu viel Kohle über den Edelsteinen. Schippst du bitte zwanzig Klumpen weg und bringst sie mir?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(68, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(68, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", "<", 20, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("There is so much coal on top of the gems. Can you dig away twenty lumps of coal and bring them to me?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(68, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", "<", 20, nil));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Es liegt eindeutig zu viel Kohle über den Edelsteinen. Schippst du bitte zwanzig Klumpen weg und bringst sie mir?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(68, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", "<", 20, nil));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("There is so much coal on top of the gems. Can you dig away twenty lumps of coal and bring them to me?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(68, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", "<", 20, nil));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Es liegt eindeutig zu viel Kohle über den Edelsteinen. Schippst du bitte zwanzig Klumpen weg und bringst sie mir?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.mining, "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(68, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", ">", 19, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded ten silver coins and your mining skill increases. You advance in Don Valerio Guilianni's favour."));
talkEntry:addResponse("How marvelous! Away is the coal, now we can get things done. Here, your reward, don't spend it all at once.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.mining, "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 1000));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(21, 20, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(68, "=", 4));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 10));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(68, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", ">", 19, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded ten silver coins. You advance in Don Valerio Guilianni's favour."));
talkEntry:addResponse("How marvelous! Away is the coal, now we can get things done. Here, your reward, don't spend it all at once.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 1000));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(21, 20, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(68, "=", 4));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 10));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.mining, "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(68, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", ">", 19, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 100 Kupferstücke und deine Bergbaufertigkeit steigt. Dein Ansehen bei Don Valerio Guilianni steigt."));
talkEntry:addResponse("Wie wundervoll! Weg ist die Kohle, nun geht's ans Eingemachte. Hier, dein Lohn, gib es nicht alles auf einmal aus.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.mining, "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 1000));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(21, 20, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(68, "=", 4));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 10));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(68, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", ">", 19, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 100 Kupferstücke. Dein Ansehen bei Don Valerio Guilianni steigt."));
talkEntry:addResponse("Wie wundervoll! Weg ist die Kohle, nun geht's ans Eingemachte. Hier, dein Lohn, gib es nicht alles auf einmal aus.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 1000));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(21, 20, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(68, "=", 4));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 10));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.mining, "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(68, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", ">", 19, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded ten silver coins and your mining skill increases."));
talkEntry:addResponse("How marvelous! Away is the coal, now we can get things done. Here, your reward, don't spend it all at once.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.mining, "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 1000));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(21, 20, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(68, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(68, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", ">", 19, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded ten silver coins."));
talkEntry:addResponse("How marvelous! Away is the coal, now we can get things done. Here, your reward, don't spend it all at once.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 1000));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(21, 20, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(68, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.mining, "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(68, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", ">", 19, nil));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 100 Kupferstücke und deine Bergbaufertigkeit steigt."));
talkEntry:addResponse("Wie wundervoll! Weg ist die Kohle, nun geht's ans Eingemachte. Hier, dein Lohn, gib es nicht alles auf einmal aus.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.mining, "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 1000));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(21, 20, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(68, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(68, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", ">", 19, nil));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 100 Kupferstücke."));
talkEntry:addResponse("Wie wundervoll! Weg ist die Kohle, nun geht's ans Eingemachte. Hier, dein Lohn, gib es nicht alles auf einmal aus.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 1000));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(21, 20, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(68, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(68, "=", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Dark Hole Mine III"));
talkEntry:addResponse("Hey-ho! Now we can dig for gems. Gather five raw obsidians for me and I will reward you generously.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(68, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(68, "=", 4));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Dunkellochmine III"));
talkEntry:addResponse("Hey-ho! Jetzt können wir nach Edelsteinen graben. Bring mir fünf ungeschliffene Schwarzsteine und ich belohne dich großzügig.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(68, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(68, "=", 4));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Dark Hole Mine III"));
talkEntry:addResponse("Heydiho! Now we can dig for gems. Gather five raw obsidians for me and I will reward you generously.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(68, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(68, "=", 4));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Dunkellochmine III"));
talkEntry:addResponse("Heydiho! Jetzt können wir nach Edelsteinen graben. Bring mir fünf ungeschliffene Schwarzsteine und ich belohne dich großzügig");
talkEntry:addConsequence(npc.base.consequence.quest.quest(68, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(68, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(252, "all", "<", 5, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Bring me five raw obsidians and you get money. I'm so excited!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(68, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(252, "all", "<", 5, nil));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Bring mir fünf ungeschliffene Schwarzsteine und du bekommst Geld. Ich bin so aufgeregt!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(68, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(252, "all", "<", 5, nil));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("Bring me five raw obsidians and you get money. I'm so excited!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(68, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(252, "all", "<", 5, nil));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Bring mir fünf ungeschliffene Schwarzsteine und du bekommst Geld. Ich bin so aufgeregt!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.mining, "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(68, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(252, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded ten silver coins and your mining skill increases. You advance in Don Valerio Guilianni's favour."));
talkEntry:addResponse("Thank you for the gems. You wonder what I want to do with them? I hide them in another cave!");
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.mining, "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 1000));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(252, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(68, "=", 6));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 15));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(68, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(252, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded ten silver coins. You advance in Don Valerio Guilianni's favour."));
talkEntry:addResponse("Thank you for the gems. You wonder what I want to do with them? I hide them in another cave!");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 1000));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(252, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(68, "=", 6));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 15));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.mining, "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(68, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(252, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 100 Kupferstücke und deine Bergbaufertigkeit steigt. Dein Ansehen bei Don Valerio Guilianni steigt."));
talkEntry:addResponse("Danke für die Edelsteine. Du fragst dich, was ich mit ihnen mache? Ich verstecke sie in einer anderen Höhle!");
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.mining, "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 1000));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(252, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(68, "=", 6));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 15));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(68, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(252, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 100 Kupferstücke. Dein Ansehen bei Don Valerio Guilianni steigt."));
talkEntry:addResponse("Danke für die Edelsteine. Du fragst dich, was ich mit ihnen mache? Ich verstecke sie in einer anderen Höhle!");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 1000));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(252, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(68, "=", 6));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 15));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.mining, "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(68, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(252, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded ten silver coins and your mining skill increases."));
talkEntry:addResponse("Thank you for the gems. You wonder what I want to do with them? I hide them in another cave!");
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.mining, "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 1000));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(252, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(68, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(68, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(252, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded ten silver coins."));
talkEntry:addResponse("Thank you for the gems. You wonder what I want to do with them? I hide them in another cave!");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 1000));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(252, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(68, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.mining, "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(68, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(252, "all", ">", 4, nil));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 100 Kupferstücke und deine Bergbaufertigkeit steigt."));
talkEntry:addResponse("Danke für die Edelsteine. Du fragst dich, was ich mit ihnen mache? Ich verstecke sie in einer anderen Höhle!");
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.mining, "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 1000));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(252, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(68, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(68, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(252, "all", ">", 4, nil));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 100 Kupferstücke."));
talkEntry:addResponse("Danke für die Edelsteine. Du fragst dich, was ich mit ihnen mache? Ich verstecke sie in einer anderen Höhle!");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 1000));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(252, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(68, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(68, "=", 6));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Dark Hole Mine IV"));
talkEntry:addResponse("Watch out! The ceiling is instable, run and bring me ten logs of conifer wood to support the ceiling. You get the best wood from Elstree forest.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(68, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(68, "=", 6));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Dunkellochmine IV"));
talkEntry:addResponse("Vorsicht! Die Höhlendecke ist einsturzgefährdet, lauf und bring mir zehn Nadelholzstämme um die Decke abzustützen. Das beste Holz bekommst du im Elsbaumwald.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(68, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(68, "=", 6));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Dark Hole Mine IV"));
talkEntry:addResponse("Watch out! The ceiling is instable, run and bring me ten logs of conifer wood to support the ceiling. You get the best wood from Elstree forest.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(68, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(68, "=", 6));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Dunkellochmine IV"));
talkEntry:addResponse("Vorsicht! Die Höhlendecke ist einsturzgefährdet, lauf und bring mir zehn Nadelholzstämme um die Decke abzustützen. Das beste Holz bekommst du im Elsbaumwald.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(68, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(68, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(3, "all", "<", 10, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Beware of the forester Valandil if you venture to Elstree forest to bring me logs of conifer wood.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(68, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(3, "all", "<", 10, nil));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Nimm dich vor dem Förster Valandil in acht, wenn du in den Elsbaumwald gehst, um mir Nadelholzstämme zu holen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(68, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(3, "all", "<", 10, nil));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("Beware of the forester Valandil if you venture to Elstree forest to bring me logs of conifer wood.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(68, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(3, "all", "<", 10, nil));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Nimm dich vor dem Förster Valandil in acht, wenn du in den Elsbaumwald gehst, um mir Nadelholzstämme zu holen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.mining, "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(68, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(3, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded twenty silver coins and your mining skill increases. You advance in Don Valerio Guilianni's favour."));
talkEntry:addResponse("Oh, fine, wood. Not only won't the sky fall on my head down here, but also the ceiling won't.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.mining, "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 2000));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(3, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(68, "=", 8));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(68, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(3, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded twenty silver coins. You advance in Don Valerio Guilianni's favour."));
talkEntry:addResponse("Oh, fine, wood. Not only won't the sky fall on my head down here, but also the ceiling won't.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 2000));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(3, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(68, "=", 8));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.mining, "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(68, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(3, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 200 Kupferstücke und deine Bergbaufertigkeit steigt. Dein Ansehen bei Don Valerio Guilianni steigt."));
talkEntry:addResponse("Oh, gut, Holz! Fällt mir hier unten nicht nur nicht der Himmel, sondern auch nicht die Decke auf den Kopf.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.mining, "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 2000));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(3, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(68, "=", 8));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(68, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(3, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 200 Kupferstücke. Dein Ansehen bei Don Valerio Guilianni steigt."));
talkEntry:addResponse("Oh, gut, Holz! Fällt mir hier unten nicht nur nicht der Himmel, sondern auch nicht die Decke auf den Kopf.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 2000));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(3, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(68, "=", 8));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.mining, "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(68, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(3, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded twenty silver coins and your mining skill increases."));
talkEntry:addResponse("Oh, fine, wood. Not only won't the sky fall on my head down here, but also the ceiling won't.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.mining, "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 2000));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(3, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(68, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(68, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(3, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded twenty coins."));
talkEntry:addResponse("Oh, fine, wood. Not only won't the sky fall on my head down here, but also the ceiling won't.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 2000));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(3, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(68, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.mining, "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(68, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(3, "all", ">", 9, nil));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 200 Kupferstücke und deine Bergbaufertigkeit steigt."));
talkEntry:addResponse("Oh, gut, Holz! Fällt mir hier unten nicht nur nicht der Himmel, sondern auch nicht die Decke auf den Kopf.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.mining, "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 2000));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(3, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(68, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(68, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(3, "all", ">", 9, nil));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 200 Kupferstücke."));
talkEntry:addResponse("Oh, gut, Holz! Fällt mir hier unten nicht nur nicht der Himmel, sondern auch nicht die Decke auf den Kopf.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 2000));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(3, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(68, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(68, "=", 8));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("I thank you for all you did, you made the world a better place. Or you changed nothing, but got money.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(68, "=", 8));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Ich danke dir, für alles, was du getan hast. Du hast die Welt zu einem besseren Ort gemacht. Oder du hast nichts bewirkt, aber ordentlich abkassiert.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(68, "=", 8));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("I thank you for all you did, you made the world a better place. Or you changed nothing, but got money.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(68, "=", 8));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Ich danke dir, für alles, was du getan hast. Du hast die Welt zu einem besseren Ort gemacht. Oder du hast nichts bewirkt, aber ordentlich abkassiert.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("I am a professional finder of things!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Ich bin ein professioneller Dingefinder!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("I am a professional finder of things!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Ich bin ein professioneller Dingefinder!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Islands are none of business.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Ich schere mich nicht um Inseln.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("Oh, how great!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Oh wie schön!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("miner");
talkEntry:addResponse("I dig for gems, metals, and holes.");
talkEntry:addResponse("Once, I dug a hole and some stinky, black fluid squirted out. Bah!");
talkEntry:addResponse("If you find any gems, well, do not pick them up or nobody else can find them anymore.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bergarbeiter");
talkEntry:addResponse("Ich grabe nach Edelsteinen, Metallen und Löchern.");
talkEntry:addResponse("Einmal hab ich ein Loch gegraben und da spritze so eine schwarze, stinkende Flüssigkeit raus. Bah!");
talkEntry:addResponse("Wenn du Edelsteine findest, lass sie doch liegen, sonst kann sie kein anderer mehr finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("dark hole");
talkEntry:addResponse("It is not dark down here, you just need a torch.");
talkEntry:addResponse("A nice mine, isn't it? All mine in this mine, hehe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Dunkelloch");
talkEntry:addResponse("Es ist doch nicht dunkel hier unten, du brauchst nur eine Fackel.");
talkEntry:addResponse("Eine schöne Mine, nicht wahr? Alles meins hier unten!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("mine");
talkEntry:addResponse("It is not dark down here, you just need a torch.");
talkEntry:addResponse("A nice mine, isn't it? All mine in this mine, hehe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Mine");
talkEntry:addResponse("Es ist doch nicht dunkel hier unten, du brauchst nur eine Fackel.");
talkEntry:addResponse("Eine schöne Mine, nicht wahr? Alles meins hier unten!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addResponse("He reminds me of a girl that I once knew.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Er erinnert mich an ein Mädchen, das ich einst kannte.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("He reminds me of a girl that I once knew.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Er erinnert mich an ein Mädchen, das ich einst kannte.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Runewick, that makes me sick!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("In Runewick, da sind sie dick!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("I think I owe the Don something. Was it the content of a hole?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Ich befürchte, ich schulde dem Don noch etwas. War es etwa der Inhalt eines Loches?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Yes, Galmair, that is here!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Ja, Galmair, das ist hier!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Queen");
talkEntry:addResponse("Do not tell me you were sent to fetch gems for the queen. Not again!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königin");
talkEntry:addResponse("Jetzt sag nicht, dass du geschickt wurdest, um Edelsteine für die Königin abzuholen. Nicht schon wieder!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Do not tell me you were sent to fetch gems for the queen. Not again!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Jetzt sag nicht, dass du geschickt wurdest, um Edelsteine für die Königin abzuholen. Nicht schon wieder!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Cadomyr, won't come here!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Cadomyr, das verbitt' ich mir!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("albar");
talkEntry:addResponse("I wish I could dig a hole to throw in the whole albarian kingdom.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("Ich wünschte, ich könnte ein Loch graben, das groß genug ist, um ganz Albar darein zu werfen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addResponse("Immigrants from Gynk you can easily recognize by the size of their purse before and after they go to a dark alley. It is bigger afterwards.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("Einwanderer aus Gynk erkennt man leicht an der Größe ihrer Geldbörse, bevor und nachdem sie durch eine dunkle Gasse gehen. Hinterher ist sie prall gefüllt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("salkama");
talkEntry:addResponse("They do not care about stones there!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Sie sorgen sich nicht um Steine in Salkamar.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("I want to become god one day, too. Just like Irmorom, Nargún or Ushara.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Ich möchte auch mal ein Gott werden, genauso wie Irmorom, Nargún und Ushara.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("I have a beard and a pick axe and I dig for gems. Guess what I think about Irmorom!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("Ich habe einen Bart und eine Spitzhacke und ich grabe nach Edelsteinen. Also, was halte ich wohl von Irmorom?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addTrigger("Nargùn");
talkEntry:addResponse("I hereby declare officially that I do not - I repeat - do not worship Nargún. Not today, at least.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addTrigger("Nargùn");
talkEntry:addResponse("Ich verkünde hiermit feierlich und an Eides statt, dass ich nicht - ich wiederhole - nicht ein Anhänger Nargúns bin. Zumindestens heute nicht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("Ushi is really a nice goddess, isn't she?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("Die Uschi ist echt 'ne klasse Göttin, nicht wahr?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(68, "=", 0));
talkEntry:addTrigger("pick");
talkEntry:addResponse("You look like somebody who can swing a pick. Everybody does, at least I think so. Perhaps you can do a task for me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(68, "=", 0));
talkEntry:addTrigger("hacke");
talkEntry:addResponse("Du siehst aus wie jemand, der eine Spitzhacke schwingen kann. Naja, jeder sieht so aus, denk ich. Vielleicht kannst du einen Auftrag für mich ausführen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("pick");
talkEntry:addResponse("Need a pick, it has a nick. In Galmair, you get a new one.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hacke");
talkEntry:addResponse("Brauchst 'ne Hacke, war die letzte kacke. In Galmair kriegst du eine neue.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("I sell nothing to you, you sell nothing to me. Everyone keeps his property, fine.");
talkEntry:addResponse("You have enough, I have enough, so why?");
talkEntry:addResponse("Bartering is so stupid, don't we all want to betray each other?");
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Ich verkaufe dir nichts, du verkaufst mir nichts. Jeder behält, was er hat, gut, nicht?");
talkEntry:addResponse("Du hast genug, ich hab genug, also warum handeln?");
talkEntry:addResponse("Feilschen ist ziemlich dusselig, will doch jeder nur den anderen hehupsen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("Once upon a time, in land far far away... I forgot the rest. But this line thrills me!");
talkEntry:addResponse("And they all died happily ever after... I'm not a good story teller.");
talkEntry:addResponse("What shall I tell you, fairytales? Better ask a fairy!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Es war einmal in einem fernen Land, hinter den sieben Bergen... Den Rest hab ich vergessen, aber diese Zeile ist der Hammer.");
talkEntry:addResponse("Und wenn sie nicht noch leben, sind sie wohl gestorben... Ich bin nicht gut darin, Geschichten zu erzählen.");
talkEntry:addResponse("Was soll ich dir erzählen, Märchen? Frage lieber eine Fee danach.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Daerbur");
talkEntry:addTrigger("Wimbert");
talkEntry:addResponse("Us Wimberts have a long tradition as miners and gravediggers. Digging holes is our business!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Daerbur");
talkEntry:addTrigger("Wimbert");
talkEntry:addResponse("Wir Wimberts haben eine lange Tradition als Bergarbeiter und Totengräber. Löchergraben ist genau unser Ding!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("What was first, yes or no? I mean, did people first think about how to agree or how to disagree?");
talkEntry:addResponse("Indeed.");
talkEntry:addResponse("Yes?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("Was war wohl zuerst da, ja oder nein? Ich meine, haben sich die Leute zuerst überlegt, zuzustimmen oder abzulehnen?");
talkEntry:addResponse("Jawohl.");
talkEntry:addResponse("Ja?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("I say yes, you say no, I say goodbye, you say hello!");
talkEntry:addResponse("No?");
talkEntry:addResponse("Why?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("Ich sage ja, du sagst nein, ich sage tschüß, du sagst hallo!");
talkEntry:addResponse("Nein?");
talkEntry:addResponse("Wieso?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("nuts");
talkEntry:addTrigger("nutty");
talkEntry:addTrigger("strange");
talkEntry:addTrigger("wierd");
talkEntry:addTrigger("loony");
talkEntry:addResponse("I am what I am. And what are you, something else?");
talkEntry:addResponse("That's all a matter of perspective.");
talkEntry:addResponse("Points of view!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("komisch");
talkEntry:addTrigger("bescheuert");
talkEntry:addTrigger("dussel");
talkEntry:addResponse("Ich bin, was ich bin. Und was bist du, was anderes?");
talkEntry:addResponse("Das ist alles Ansichtssache.");
talkEntry:addResponse("Meinungen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ROFL");
talkEntry:addTrigger("LOL");
talkEntry:addResponse("#me laughes out loud.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("Ich frag mich, was wir sagen würden, wenn der Boden dauernd auf uns rumtrampeln würde. Er ist ziemlich ruhig...", "I wonder what we would say if the ground would stomp on us. It is quite silent...");
talkingNPC:addCycleText("Ist Dunkelheit das Fehlen von Licht oder Licht das Fehlen von Dunkeltheit?", "Is darkness the lack of light or light the lack of darkness?");
talkingNPC:addCycleText("#me hält einen funkelnden Edelstein vor seine zugekniffenen Augen und nickt langsam.", "#me holds a gem in front of his eyes and nods slowly.");
talkingNPC:addCycleText("Vorsicht vor den Steinen.", "Beware of rocks.");
talkingNPC:addCycleText("Wer braucht schon den Himmel, wenn man eine gut abgestützte Höhlendecke hat.", "Who needs the sky when you have a well supported ceiling.");
talkingNPC:addCycleText("Hela, heba, helloa.", "Hela, heba, helloa.");
talkingNPC:addCycleText("Jidah!", "Jidah!");
talkingNPC:addCycleText("He, du! Runter von dem Kieselstein da!", "Hey you! Off that pebble, please!");
talkingNPC:addCycleText("Wer klebt eigentlich all die Steine wieder zusammen, die ihr da zerhackt?", "Who repairs all the stones you are breaking with your pick, anyway?");
talkingNPC:addCycleText("Lieber einen Fels im Genick als um den Hals einen Strick.", "With a boulder on my shoulder I'm feelin' kinda older!");
talkingNPC:addCycleText("Ich frage mich, wo ich hinkomme, wenn ich immer tiefer und tiefer grabe. Ins Lochland vielleicht?", "I wonder what I find when I dig deeper and deeper. The hole land perhaps?");
mainNPC:addLanguage(0);
mainNPC:addLanguage(2);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Dieser NPC ist der Bergarbeiter Daerbur Wimbert.", "This NPC is the miner Daerbur Wimbert.");
mainNPC:setUseMessage("Fass mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut dich verwirrt an.", "#me looks at you confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 182);
mainNPC:setEquipment(11, 0);
mainNPC:setEquipment(5, 2763);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 48);
mainNPC:setEquipment(9, 459);
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
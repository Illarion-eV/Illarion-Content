--------------------------------------------------------------------------------
-- NPC Name: Bruno Blackhole                                             None --
-- NPC Job:  Miner                                                            --
--                                                                            --
-- NPC Race: dwarf                      NPC Position:  439, 359, 0            --
-- NPC Sex:  male                       NPC Direction: south                  --
--                                                                            --
-- Author:   Estralis Seborian                                                --
--                                                                            --
-- Last parsing: November 03, 2010                       easyNPC Parser v1.02 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (1, 439, 359, 0, 4, 'Bruno Blackhole', 'npc.bruno_blackhole', 0, 0, 0, 255, 255, 255, 255, 255, 255);
---]]

require("npc.base.basic")
require("npc.base.condition.item")
require("npc.base.condition.language")
require("npc.base.condition.quest")
require("npc.base.condition.sex")
require("npc.base.condition.town")
require("npc.base.consequence.deleteitem")
require("npc.base.consequence.inform")
require("npc.base.consequence.item")
require("npc.base.consequence.money")
require("npc.base.consequence.quest")
require("npc.base.consequence.rankpoints")
require("npc.base.consequence.skill")
require("npc.base.talk")
module("npc.bruno_blackhole", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 0");
talkEntry:addResponse("Quest status set to 0");
talkEntry:addConsequence(npc.base.consequence.quest.quest(65, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 1");
talkEntry:addResponse("Quest status set to 1");
talkEntry:addConsequence(npc.base.consequence.quest.quest(65, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 2");
talkEntry:addResponse("Quest status set to 2");
talkEntry:addConsequence(npc.base.consequence.quest.quest(65, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 3");
talkEntry:addResponse("Quest status set to 3");
talkEntry:addConsequence(npc.base.consequence.quest.quest(65, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 4");
talkEntry:addResponse("Quest status set to 4");
talkEntry:addConsequence(npc.base.consequence.quest.quest(65, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 5");
talkEntry:addResponse("Quest status set to 5");
talkEntry:addConsequence(npc.base.consequence.quest.quest(65, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 6");
talkEntry:addResponse("Quest status set to 6");
talkEntry:addConsequence(npc.base.consequence.quest.quest(65, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 7");
talkEntry:addResponse("Quest status set to 7");
talkEntry:addConsequence(npc.base.consequence.quest.quest(65, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 8");
talkEntry:addResponse("Quest status set to 8");
talkEntry:addConsequence(npc.base.consequence.quest.quest(65, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is the miner Bruno Blackhole. Keyphrases: Hello, quest, pick-axe, miner."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist der Bergarbeiter Bruno Blackhole. Schlüsselwörter: Hallo, Quest, Spitzhacke, Bergarbeiter."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hello");
talkEntry:addTrigger("Greetings");
talkEntry:addTrigger("Be greeted");
talkEntry:addTrigger("Hail");
talkEntry:addTrigger("Good day");
talkEntry:addTrigger("Good morning");
talkEntry:addTrigger("Good evening");
talkEntry:addResponse("Be greeted ma friend!");
talkEntry:addResponse("Welcome in da Malachite mine.");
talkEntry:addResponse("Greetings I hope ya don't try to steal meh ma gold!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Grüße");
talkEntry:addTrigger("Gruß");
talkEntry:addTrigger("Seid gegrüßt");
talkEntry:addTrigger("Guten Tag");
talkEntry:addTrigger("Guten Abend");
talkEntry:addTrigger("Mahlzeit");
talkEntry:addTrigger("Tach");
talkEntry:addTrigger("Moin");
talkEntry:addResponse("Tach mein Freund!");
talkEntry:addResponse("Willkommen inner Malachitmine!");
talkEntry:addResponse("Grüße, ich hoff' du versuchst nicht mein Gold zu stehlen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greebas");
talkEntry:addTrigger("Greebs");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Be greeted ma friend!");
talkEntry:addResponse("Welcome in da Malachite mine.");
talkEntry:addResponse("Greetings I hope ya don't try to steal meh ma gold!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greebas");
talkEntry:addTrigger("Greebs");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Tach mein Freund!");
talkEntry:addResponse("Willkommen inner Malachitmine!");
talkEntry:addResponse("Grüße, ich hoff' du versuchst nicht mein Gold zu stehlen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Good bye");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare thee well");
talkEntry:addResponse("May Irmorom guide ya on yar ways!");
talkEntry:addResponse("Come back whenever ya miss the coolness of da mine.");
talkEntry:addResponse("Farewell.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehabt euch wohl");
talkEntry:addResponse("Möge Irmorom dich auf deinen Wegen beschützen!");
talkEntry:addResponse("Komm' ruhig zurück wenn du die Kühle der Mine vermisst.");
talkEntry:addResponse("Auf bald.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Farewell is what we say around here.");
talkEntry:addResponse("Fancy words don't bring you further around here. Farewell.");
talkEntry:addResponse("Irmorom with ya!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Auf bald sagen wa hier.");
talkEntry:addResponse("Schicke Worte helfen dir auch nicht weiter. Auf bald.");
talkEntry:addResponse("Irmorom mit dir!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("None of ya business.");
talkEntry:addResponse("I'm fine and ya?");
talkEntry:addResponse("I could use some beer.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addResponse("Geht dich nichts an.");
talkEntry:addResponse("Gut und dir?");
talkEntry:addResponse("Ich könnte 'n Bier vertragen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("I'm Bruno Blackhole.");
talkEntry:addResponse("I'm a dwarven miner named Bruno.");
talkEntry:addResponse("Just call meh Bruno for now.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Ich bin Bruno Blackhole.");
talkEntry:addResponse("Ich bin 'n zwergischer Bergarbeiter namens Bruno.");
talkEntry:addResponse("Nenn' mich einfach Bruno.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("I do not sell or buy anything, but I could need ya help.");
talkEntry:addResponse("Do I really look like a trader?");
talkEntry:addResponse("I'm no trader, I'm a miner!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Ich kaufe und verkaufe nichts, aber ich könnte Hilfe gebrauchen.");
talkEntry:addResponse("Seh' ich wirklich wie 'n Händler aus?");
talkEntry:addResponse("Ich bin kein Händler, sondern 'n Bergarbeiter.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("If you want to hear a story, ya in da wrong place.");
talkEntry:addResponse("I'm here to work, not to tell stories.");
talkEntry:addResponse("My gold nugget is my most precious posession.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Wenn du 'ne Geschichte hören wollt, biste am falschen Ort.");
talkEntry:addResponse("Ich bin nicht zum Geschichtenerzählen hier, sondern zum Arbeiten.");
talkEntry:addResponse("Mein Goldnugget ist mein wertvollster Besitz.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("miner");
talkEntry:addResponse("Aye, that's what I am. Da very best miner of Galmair.");
talkEntry:addResponse("A miner mines in da mines of Galmair for ore and coal.");
talkEntry:addResponse("Miners are important to smiths, because they sell ore and coal to them.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bergarbeiter");
talkEntry:addResponse("Aye, das bin ich. Der beste Bergarbeiter von Galmair.");
talkEntry:addResponse("Ein Bergarbeiter sucht in den Minen Galmairs nach Erz und Kohle.");
talkEntry:addResponse("Bergarbeiter sind wichtig für Schmiede, weil sie Erz und Kohle an sie verkaufen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachit");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("The Malachite mine belongs to Galmair and one can mine for copper and iron here.");
talkEntry:addResponse("Copper and iron are the most common ores here, but when ya get lucky ya might find goldnuggets as well.");
talkEntry:addResponse("The Malachite mine is mah favorite spot. Isn't it nice here?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachit");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Die Malachitmine gehört zu Galmair und man findet Kupfer- und Eisenerz hier.");
talkEntry:addResponse("Kupfer- und Eisenerz kommt hier am meisten vor, aber wenn du Glück hast, findest du auch Goldnuggets.");
talkEntry:addResponse("Die Malachitmine ist mein liebster Platz, ist es nicht toll hier?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Ein faules Pack wohnt dort in Runewick. Nett sind sie zwar, aber sowas von faul!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Lazy scum is living in Runewick. Gentle they are, but lazy!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Der Ort schlechthin: Galmair. Gemütlich, frei und Geld zählt man in großen Beträgen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("The place to be: Galmair. Cozy, free and money counts in large amounts.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Edel, pff, die Leute aus Cadomyr verhalten sich nur edel, wenn sie ihr Königin anstarren können.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Noble man, pah, the people of Cadomyr behave only noble as long as they stare at the queen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("pick");
talkEntry:addCondition(npc.base.condition.quest.quest(65, "=", 0));
talkEntry:addResponse("You'll need a pickaxe in order to mine for ore. Just hit the rocks with it. If you want to try it I could give you a little quest.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hacke");
talkEntry:addCondition(npc.base.condition.quest.quest(65, "=", 0));
talkEntry:addResponse("Du wirst 'ne Spitzhacke brauchen um nach Erzen zu suchen, einfach auf die Steine hauen damit. Wenn du es probieren willst, könnte ich dir 'nen kleinen Auftrag geben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("pick");
talkEntry:addResponse("If ya need another pickaxe, ask a smith or another miner. The best miners can be found in Galmair.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hacke");
talkEntry:addResponse("Wenn du 'ne weitere Spitzhacke brauchst, frag' 'nen Schmied oder 'nen anderen Bergarbeiter. Die besten Bergarbeiter kann man in Galmair finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("message");
talkEntry:addTrigger("news");
talkEntry:addTrigger("letter");
talkEntry:addTrigger("scroll");
talkEntry:addTrigger("parchment");
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 6));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest status] The Reminder III: You deliver the message from Groktan Flintsplit to Bruno Blackhole."));
talkEntry:addResponse("Oh my goodness! How shall I pay that amount of money to the Don? I just know what I get when I don't pay...");
talkEntry:addConsequence(npc.base.consequence.quest.quest(107, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("nachricht");
talkEntry:addTrigger("brief");
talkEntry:addTrigger("Botschaft");
talkEntry:addTrigger("Schriftrolle");
talkEntry:addTrigger("Pergament");
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 6));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Queststatus] Die Erinnerung III: Du überbringst Bruno Blackhole die Nachricht von Groktan Flintsplit."));
talkEntry:addResponse("Ach du meine Güte! Wie soll ich nur so viel Geld and den Don zahlen? Ich weiß nur, was mir blüht, wenn ich nicht zahle...");
talkEntry:addConsequence(npc.base.consequence.quest.quest(107, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Groktan");
talkEntry:addTrigger("Flintsplit");
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 6));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest status] The Reminder III: You deliver the message from Groktan Flintsplit to Bruno Blackhole."));
talkEntry:addResponse("Oh my goodness! How shall I pay that amount of money to the Don? I just know what I get when I don't pay...");
talkEntry:addConsequence(npc.base.consequence.quest.quest(107, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Groktan");
talkEntry:addTrigger("Flintsplit");
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 6));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Queststatus] Die Erinnerung III: Du überbringst Bruno Blackhole die Nachricht von Groktan Flintsplit."));
talkEntry:addResponse("Ach du meine Güte! Wie soll ich nur so viel Geld and den Don zahlen? Ich weiß nur, was mir blüht, wenn ich nicht zahle...");
talkEntry:addConsequence(npc.base.consequence.quest.quest(107, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(65, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Malachite Mine I"));
talkEntry:addResponse("Aye, I hope ya like hard work. Bring meh ten raw stones and I will give you a little something.");
talkEntry:addConsequence(npc.base.consequence.item.item(2763, 1, 399, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(65, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(65, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Malachitmine I"));
talkEntry:addResponse("Aye, ich hoffe du magst harte Arbeit. Bring mir zehn rohe Steine, dann gebe ich dir 'ne Kleinigkeit.");
talkEntry:addConsequence(npc.base.consequence.item.item(2763, 1, 399, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(65, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(65, "=", 0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Malachite Mine I"));
talkEntry:addResponse("Aye, I hope ya like hard work. Bring meh ten raw stones and I will give ya a little something.");
talkEntry:addConsequence(npc.base.consequence.item.item(2763, 1, 399, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(65, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(65, "=", 0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Malachitmine I"));
talkEntry:addResponse("Aye, ich hoffe du magst harte Arbeit. Bring mir zehn rohe Steine, dann gebe ich dir 'ne Kleinigkeit.");
talkEntry:addConsequence(npc.base.consequence.item.item(2763, 1, 399, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(65, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(65, "=", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Do ya have da ten raw stones yet? Just hit on da rocks over there with your pick-axe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(65, "=", 1));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Hast du die zehn rohen Steine schon? Haue einfach mit der Spitzhacke auf die Steine dort drüben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(65, "=", 1));
talkEntry:addResponse("Do ya have da ten raw stones yet? Just hit on da rocks over there with your pick-axe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(65, "=", 1));
talkEntry:addResponse("Hast du die zehn rohen Steine schon? Haue einfach mit der Spitzhacke auf die Steine dort drüben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(65, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(735, "all", ">", 9));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 50 Kupferstücke und deine Bergbaufertigkeit steigt. Dein Ansehen bei Don Valerio Guilianni steigt."));
talkEntry:addResponse("Gute Arbeit, dies zeigt das du kein Schwächling bist.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "mining", "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 50));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(735, 10));
talkEntry:addConsequence(npc.base.consequence.quest.quest(65, "=", 2));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Galmair", "+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(65, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(735, "all", ">", 9));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 50 copper coins and your mining skill increases. You advance in Don Valerio Guilianni's favour."));
talkEntry:addResponse("Good work, that shows meh that you're not a whimp.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "mining", "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 50));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(735, 10));
talkEntry:addConsequence(npc.base.consequence.quest.quest(65, "=", 2));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Galmair", "+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(65, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(735, "all", ">", 9));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 50 Kupferstücke und deine Bergbaufertigkeit steigt."));
talkEntry:addResponse("Gute Arbeit, dies zeigt das du kein Schwächling bist.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "mining", "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 50));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(735, 10));
talkEntry:addConsequence(npc.base.consequence.quest.quest(65, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(65, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(735, "all", ">", 9));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 50 copper coins and your mining skill increases."));
talkEntry:addResponse("Good work, that shows meh that you're not a whimp.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "mining", "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 50));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(735, 10));
talkEntry:addConsequence(npc.base.consequence.quest.quest(65, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(65, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(735, "all", "<", 10));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Du solltest mir zehn rohe Steine bringen und nicht weniger. Versuch es bei den Steinen dort drüben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(65, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(735, "all", "<", 10));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I asked you to bring meh ten raw stones and not less. Try it at the rocks over there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(65, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.sex.sex(0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Malachite Mine II"));
talkEntry:addResponse("Ya'll become a good miner someday lad! Bring meh twenty pieces of copper ore and I'll pay for it.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(65, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(65, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Malachite Mine II"));
talkEntry:addResponse("Ya'll become a good miner someday lass! Bring meh twenty pieces of copper ore and I'll pay for it.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(65, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(65, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.sex.sex(0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Malachitmine II"));
talkEntry:addResponse("Du wirst mal 'n guter Bergarbeiter Bursche! Bring mir zwanzig Brocken Kupfererz und ich bezahle dich dafür.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(65, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(65, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Malachitmine II"));
talkEntry:addResponse("Du wirst mal 'n guter Bergarbeiter Mädel! Bring mir zwanzig Brocken Kupfererz und ich bezahle dich dafür.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(65, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(65, "=", 2));
talkEntry:addCondition(npc.base.condition.sex.sex(0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Malachite Mine II"));
talkEntry:addResponse("Ya'll become a good miner someday lad! Bring meh twenty pieces of copper ore and I'll pay for it.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(65, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(65, "=", 2));
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Malachite Mine II"));
talkEntry:addResponse("Ya'll become a good miner someday lass! Bring meh twenty pieces of copper ore and I'll pay for it.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(65, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(65, "=", 2));
talkEntry:addCondition(npc.base.condition.sex.sex(0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Malachitmine II"));
talkEntry:addResponse("Du wirst mal 'n guter Bergarbeiter Bursche! Bring mir zwanzig Brocken Kupfererz und ich bezahle dich dafür.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(65, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(65, "=", 2));
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Malachitmine II"));
talkEntry:addResponse("Du wirst mal 'n guter Bergarbeiter Mädel! Bring mir zwanzig Brocken Kupfererz und ich bezahle dich dafür.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(65, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(65, "=", 3));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I need twenty pieces copper ore, do ya have it yet?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(65, "=", 3));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Ich brauche zwanzig Brocken Kupfererz, hast du die schon?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(65, "=", 3));
talkEntry:addResponse("I need twenty pieces of copper ore, do ya have it yet?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(65, "=", 3));
talkEntry:addResponse("Ich brauche zwanzig Brocken Kupfererz, hast du die schon?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(65, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2536, "all", ">", 19));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 100 copper coins and your mining skill increases. You advance in Don Valerio Guilianni's favour."));
talkEntry:addResponse("Thank ya pal! Here is ya money, don't spend it all at once.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "mining", "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2536, 20));
talkEntry:addConsequence(npc.base.consequence.quest.quest(65, "=", 4));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Galmair", "+", 10));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(65, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2536, "all", ">", 19));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 100 Kupferstücke und deine Bergbaufertigkeit steigt. Dein Ansehen bei Don Valerio Guilianni steigt."));
talkEntry:addResponse("Danke Kumpel! Hier is dein Geld, gib' nicht alles auf einmal aus.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "mining", "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2536, 20));
talkEntry:addConsequence(npc.base.consequence.quest.quest(65, "=", 4));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Galmair", "+", 10));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(65, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2536, "all", ">", 19));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 100 copper coins and your mining skill increases."));
talkEntry:addResponse("Thank ya pal! Here is ya money, don't spend it all at once.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "mining", "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2536, 20));
talkEntry:addConsequence(npc.base.consequence.quest.quest(65, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(65, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2536, "all", ">", 19));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 100 Kupferstücke und deine Bergbaufertigkeit steigt."));
talkEntry:addResponse("Danke Kumpel! Hier is dein Geld, gib' nicht alles auf einmal aus.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "mining", "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2536, 20));
talkEntry:addConsequence(npc.base.consequence.quest.quest(65, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(65, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2536, "all", "<", 20));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Ne Kumpel, zwanzig Brocken brauch ich. Soviel hast du noch nicht, also geh wieder an die Arbeit.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(65, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2536, "all", "<", 20));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Nah pal, I need twenty pieces and ya don't have that much yet, so go back to work.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(65, "=", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Malachite Mine III"));
talkEntry:addResponse("Another quest? Alright pal, I need five gold nuggets, ya think ya can find them?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(65, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(65, "=", 4));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Malachitmine III"));
talkEntry:addResponse("Noch 'n Auftrag? Na gut Kumpel. Ich brauche fünf Goldnuggets, denkst du, du kannst die finden?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(65, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(65, "=", 4));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Malachite Mine III"));
talkEntry:addResponse("Another task? Alright pal, I need five gold nuggets, ya think ya can find them?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(65, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(65, "=", 4));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Malachitmine III"));
talkEntry:addResponse("Noch 'n Auftrag? Na gut Kumpel. Ich brauche fünf Goldnuggets, denkst du, du findest welche?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(65, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(65, "=", 5));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Five gold nuggets is what I need. Ya can find them in the rocks.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(65, "=", 5));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Ich brauche fünf Goldnuggets. Du kannst sie in den Steinen finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(65, "=", 5));
talkEntry:addResponse("Five gold nuggets is what I need. Ya can find them in the rocks.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(65, "=", 5));
talkEntry:addResponse("Ich brauche fünf Goldnuggets. Du kannst sie in den Steinen finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(65, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(234, "all", ">", 4));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 100 Kupferstücke und deine Bergbaufertigkeit steigt. Dein Ansehen bei Don Valerio Guilianni steigt."));
talkEntry:addResponse("Jetzt bist du 'n richtiger Bergarbeiter. Hier hast du 'n Silberstück.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "mining", "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(234, 5));
talkEntry:addConsequence(npc.base.consequence.quest.quest(65, "=", 6));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Galmair", "+", 15));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(65, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(234, "all", ">", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 100 copper coins and your mining skill increases. You advance in Don Valerio Guilianni's favour."));
talkEntry:addResponse("Now ya are a real miner. Here is a silver coin for ya.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "mining", "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(234, 5));
talkEntry:addConsequence(npc.base.consequence.quest.quest(65, "=", 6));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Galmair", "+", 15));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(65, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(234, "all", ">", 4));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 100 Kupferstücke und deine Bergbaufertigkeit steigt."));
talkEntry:addResponse("Jetzt bist du 'n richtiger Bergarbeiter. Hier hast du 'n Silberstück.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "mining", "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(234, 5));
talkEntry:addConsequence(npc.base.consequence.quest.quest(65, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(65, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(234, "all", ">", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 100 copper coins and your mining skill increases."));
talkEntry:addResponse("Now ya are a real miner. Here is a silver coin for ya.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "mining", "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(234, 5));
talkEntry:addConsequence(npc.base.consequence.quest.quest(65, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(65, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(234, "all", "<", 5));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Schade das du die fünf Goldnuggets noch nicht gefunden hast.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(65, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(234, "all", "<", 5));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("A pity that ya haven't found those five gold nuggets yet.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(65, "=", 6));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Malachite Mine IV"));
talkEntry:addResponse("Ya know pal, it's mah sweet gold nuggets birthday soon. She likes virgins weed but I have too much work to get them mahself. Could ya bring meh ten virgins weed? Ya should ask Raban at his grove, he can help ya.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(65, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(65, "=", 6));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Malachitmine IV"));
talkEntry:addResponse("Weißt du Kumpel, mein süßes Goldnugget hat bald Geburtstag. Sie mag Jungfernkraut, aber ich habe zu viel zu tun um sie selbst zu suchen. Könntest du mir zehn Jungfernkraut bringen? Du solltest Raban in seinem Hain fragen, er kann dir helfen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(65, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(65, "=", 6));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Malachite Mine IV"));
talkEntry:addResponse("Ya know pal, it's mah sweet gold nuggets birthday soon. She likes virgins weed but I have too much work to get them mahself. Could ya bring meh ten virgins weed? Ya should ask Raban at his grove, he can help ya.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(65, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(65, "=", 6));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Malachitmine IV"));
talkEntry:addResponse("Weißt du Kumpel, mein süßes Goldnugget hat bald Geburtstag. Sie mag Jungfernkraut, aber ich habe zu viel zu tun um sie selbst zu suchen. Könntest du mir zehn Jungfernkraut bringen? Du solltest Raban in seinem Hain fragen, er kann dir helfen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(65, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(65, "=", 7));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Do ya have the ten virgins weed for mah wife yet? Ya should go to Raban's grove and ask Raban himself for help.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(65, "=", 7));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Hast du die zehn Jungerfernkraut für meine Frau schon? Du solltest zu Rabans Hain gehen und Raban um Hilfe bitten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(65, "=", 7));
talkEntry:addResponse("Do ya have the ten virgins weed for mah wife yet? Ya should go to Raban's grove and ask Raban himself for help.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(65, "=", 7));
talkEntry:addResponse("Hast du die zehn Jungfernkraut für meine Frau schon? Du solltest zu Rabans Hain gehen und Raban um Hilfe bitten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(65, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(144, "all", ">", 9));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 200 Kupferstücke und deine Bergbaufertigkeit steigt. Dein Ansehen bei Don Valerio Guilianni steigt."));
talkEntry:addResponse("Danke, meine Frau wird begeistert sein. Hier hast du 'ne kleine Entschädigung.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "mining", "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 200));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(144, 10));
talkEntry:addConsequence(npc.base.consequence.quest.quest(65, "=", 8));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Galmair", "+", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(65, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(144, "all", ">", 9));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 200 copper coins and your mining skill increases. You advance in Don Valerio Guilianni's favour."));
talkEntry:addResponse("Thank you, mah wife will be very pleased. Here ya have some compensation money.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "mining", "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 200));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(144, 10));
talkEntry:addConsequence(npc.base.consequence.quest.quest(65, "=", 8));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Galmair", "+", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(65, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(144, "all", ">", 9));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 200 Kupferstücke und deine Bergbaufertigkeit steigt."));
talkEntry:addResponse("Danke, meine Frau wird begeistert sein. Hier hast du 'ne kleine Entschädigung.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "mining", "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 200));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(144, 10));
talkEntry:addConsequence(npc.base.consequence.quest.quest(65, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(65, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(144, "all", ">", 9));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 200 copper coins and your mining skill increases."));
talkEntry:addResponse("Thank you, mah wife will be very pleased. Here ya have some compensation money.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "mining", "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 200));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(144, 10));
talkEntry:addConsequence(npc.base.consequence.quest.quest(65, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(65, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(144, "all", "<", 10));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Come back when ya have ten virgins weed for mah wife, than I will give you your money.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(65, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(144, "all", "<", 10));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Komm wieder wenn du zehn Jungfernkraut hast, dann werde ich dir dein Geld geben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(65, "=", 8));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("There is nothing ya can do for meh now. Why don't you help someone else, maybe even Raban?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(65, "=", 8));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Ich habe nun nichts mehr für dich zu tun. Wieso hilfst du nicht jemand anderes, vielleicht sogar Raban?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(65, "=", 8));
talkEntry:addResponse("There is nothing ya can do for meh now. Why don't you help someone else, maybe even Raban?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(65, "=", 8));
talkEntry:addResponse("Ich habe nun nichts mehr für dich zu tun. Wieso hilfst du nicht jemand anderes, vielleicht sogar Raban?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("Good for you.");
talkEntry:addResponse("Aye, I see.");
talkEntry:addResponse("Are you sure?");
talkEntry:addResponse("If you say so.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("Gut für dich.");
talkEntry:addResponse("Aye, in Ordnung.");
talkEntry:addResponse("Bist du dir sicher?");
talkEntry:addResponse("Wenn du das sagst.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("What a shame.");
talkEntry:addResponse("Maybe you'll change your mind.");
talkEntry:addResponse("Well...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("Schade.");
talkEntry:addResponse("Vielleicht änderst du deine Meinung noch.");
talkEntry:addResponse("Nun...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("nugget");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("You might find some down here. But you know my wife is my most precious gold nugget for meh. Are you married?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("nugget");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Vielleicht findest du welche hier unten. Doch für mich ist meine Frau mein wertwollstes Goldnugget. Bist du verheiratet?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Raban");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Raban is most likely at his grove in the south. He never leaves the places and talks to his plants all day long.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Raban");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Raban ist wahrscheinlich in seinem Hain im Süden. Er verlässt den Platz nie und spricht den ganzen Tag zu seinen Pflanzen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("grove");
talkEntry:addResponse("Raban's grove is in the forest in the south, I use to get lost between all those trees.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hain");
talkEntry:addResponse("Rabans Hain ist im Wald im Süden. Ich verlauf mich immer zwischen all diesen Bäumen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Mine");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("There are several mines close to Galmair. Just aks a fellow miner or a smith.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Mine");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Es gibt mehrere Minen hier bei Galmair. Frag' einfach einen anderen Bergarbeiter oder einen Schmied.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ore");
talkEntry:addResponse("A smith can make several things out of ore. Tools, swords, shields and more. Just ask one and maybe he'll even give ya work.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erz");
talkEntry:addResponse("Ein Schmied kann viele Dinge aus Erz machen. Werkzeuge, Schwerter, Schilder und noch mehr. Frag' doch einfach einen Schmied und vielleicht gibt er dir ja sogar Arbeit.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Stone");
talkEntry:addResponse("From raw stone ya can do stoneblocks which are needed to build houses. All ya need is a chisel and a place to work.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Stein");
talkEntry:addResponse("Von rohen Steinen kann man Steinquader machen, welche man braucht um Häuser zu bauen. Alles was du brauchst ist ein Meißel und ein Platz zum Arbeiten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hail Irmorom!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Lobet Irmorom!");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me poliert gedankenverloren ein Goldnugget.", "#me seems to be lost in thought while polishing a gold nugget.");
talkingNPC:addCycleText("#me tritt nach einem Stein der klimpernd wegspringt.", "#me kicks at a small stone which bounces away with a strumming noise.");
talkingNPC:addCycleText("#me nuschelt vor sich hin: 'Ich hätte mehr Bier mitnehmen sollen.'", "#me mumbles: 'I should have brought more beer.'");
talkingNPC:addCycleText("Irmorom is der Gott des Handwerks und Handels und zudem der Weltenschmied. Er hat die Zwerge nach seinem Ebenbild geschaffen damit sie der Welt und den anderen Rassen eine Stütze sind.", "Irmorom is the god of trade and craftmanship and also the worldsmith. He created us dwarves in his own likeness so that we can be a support for the world and the other races.");
talkingNPC:addCycleText("Wenn ich einmal sterbe, werde ich all die großen Zwerge in dem großen Berg wiedersehen und werde Irmorom zeigen können was ich gelernt habe.", "When I die I'll see all those great dwarves again in the big mountain and can show Irmorom what I learned.");
talkingNPC:addCycleText("Hey-ho!", "Hey-ho!");
talkingNPC:addCycleText("Glück auf!", "Good luck!");
mainNPC:addLanguage(0);
mainNPC:addLanguage(2);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Das ist ein NPC dessen Entwickler zu faul war eine Beschreibung einzutragen.", "This is a NPC who's developer was too lazy to type in a description.");
mainNPC:setUseMessage("Fass mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut dich verwirrt an.", "#me looks at you confused.");
mainNPC:setAutoIntroduceMode(true);

mainNPC:initDone();
end;

function receiveText(texttype, message, speaker) mainNPC:receiveText(speaker, message); end;
function nextCycle() mainNPC:nextCycle(); end;
function lookAtNpc(char, mode) mainNPC:lookAt(char, mode); end;
function useNPC(char, counter, param) mainNPC:use(char); end;
initNpc();
initNpc = nil;
-- END
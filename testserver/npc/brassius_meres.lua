--------------------------------------------------------------------------------
-- NPC Name: Brassius Meres                                          Runewick --
-- NPC Job:  Guard                                                            --
--                                                                            --
-- NPC Race: human                      NPC Position:  841, 819, 0            --
-- NPC Sex:  male                       NPC Direction: south                  --
--                                                                            --
-- Author:   Grokk & Estralis Seborian                                        --
--                                                       easyNPC Parser v1.21 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (0, 841, 819, 0, 4, 'Brassius Meres', 'npc.brassius_meres', 0, 3, 3, 204, 124, 25, 245, 180, 137);
---]]

require("npc.base.basic")
require("npc.base.condition.chance")
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
require("npc.base.guards_static")
module("npc.brassius_meres", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(109, ">", 6));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Error] Something went wrong, please inform a developer."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Brassius Meres the Guard. Keywords: hello, quest, profession, Runewick, law, bridge, gods."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Brassius Meres der Wächter. Schlüsselwörter: Hallo, Auftrag, Berufung, Runewick, Brücke, Gesetze, Götter."));
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
talkEntry:addResponse("#me bows his head politely: 'Be greeted.'");
talkEntry:addResponse("Greetings to you.");
talkEntry:addResponse("#me nods his head in greeting.");
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
talkEntry:addResponse("#me deutet eine Verbeugung an: 'Seid gegrüßt.'");
talkEntry:addResponse("Seid mir gegrüßt.");
talkEntry:addResponse("#me nickt grüßend mit dem Kopf.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("#me frowns lightly, 'Yes, yes. Hello.'");
talkEntry:addResponse("#me nods once.");
talkEntry:addResponse("May I help you?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("#me rümpft leicht die Nase: 'Ja, ja. Hallo.'");
talkEntry:addResponse("#me nickt knapp.");
talkEntry:addResponse("Kann ich euch helfen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Be well. And stay out of trouble.");
talkEntry:addResponse("May Zhambra keep you safe from harm.");
talkEntry:addResponse("#me raises his fist to his chest in salute.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Es möge euch gut ergehen und all Ärger fern von euch bleiben.");
talkEntry:addResponse("Zhambra möge euch von jedem Leid bewahren.");
talkEntry:addResponse("#me hebt seine Faust vor die Brust zum Gruß.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Aye. Be off with you.");
talkEntry:addResponse("Stay out of trouble, I have enough work already.");
talkEntry:addResponse("Be gone, then.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Ja, nun geht schon.");
talkEntry:addResponse("Haltet euch aus Keilereien raus, ich habe schon genug zu tun.");
talkEntry:addResponse("Dann mal los.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("I am well, thank you.");
talkEntry:addResponse("Zhambra keeps me safe and in good health.");
talkEntry:addResponse("I can not complain, the Gods care for me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befinden");
talkEntry:addResponse("Mir geht es gut, danke der Nachfrage.");
talkEntry:addResponse("Zhambra schützt mich und erhält mein Leben.");
talkEntry:addResponse("Ich kann mich nicht beklagen, die Götter sorgen für mich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("My name is Brassius Meres. It is an honour to meet you.");
talkEntry:addResponse("I am Brassius Meres, a guard of Runewick.");
talkEntry:addResponse("Brassius Meres, faithful servant of the Lords Malachín and Zhambra.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ihr name");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Mein Name ist Brassius Meres. Es ist mir eine Ehre, eure Bekanntschaft zu machen.");
talkEntry:addResponse("Ich bin Brassius Meres, Wächter Runewicks.");
talkEntry:addResponse("Brassius Meres, frommer Diener der Herren Malachín und Zhambra.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(109, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Eating on the Job"));
talkEntry:addResponse("Now that you mention it, I am feeling rather hungry. But I can't leave my post. Please bring me five apples and I will reimburse you for your troubles.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(109, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(109, "=", 0));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Speisen im Dienst"));
talkEntry:addResponse("Nun da ihr es sagt, ich bin ziemlich hungrig, aber ich kann meinen Posten nicht verlassen. Bringt mir bitte fünf Äpfel und ich werde euch für eure Mühen entlohnen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(109, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(109, "=", 0));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Eating on the Job"));
talkEntry:addResponse("Now that you mention it, I am feeling rather hungry. But I can't leave my post. Please bring me five apples and I will reimburse you for your troubles.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(109, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(109, "=", 0));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Speisen im Dienst"));
talkEntry:addResponse("Nun da ihr es sagt, ich bin ziemlich hungrig, aber ich kann meinen Posten nicht verlassen. Bringt mir bitte fünf Äpfel und ich werde euch für eure Mühen entlohnen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(109, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(109, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(15, "all", "<", 5, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("#me's stomach rumbles: 'I could really do with those five apples, if you've got a few moments to spare.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(109, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(15, "all", "<", 5, nil));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("#me' Magen knurrt: 'Mit fünf Äpfeln im Magen würde es mir weit besser gehen, wenn ihr einen Moment Zeit dafür habt.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(109, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(15, "all", "<", 5, nil));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addResponse("#me's stomach rumbles: 'I could really do with those five apples, if you've got a few moments to spare.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(109, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(15, "all", "<", 5, nil));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addResponse("#me' Magen knurrt: 'Mit fünf Äpfeln im Magen würde es mir weit besser gehen, wenn ihr einen Moment Zeit dafür habt.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(109, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(15, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded three silver coins."));
talkEntry:addResponse("#me quickly grabs the fruit, handing over a small purse of coins: 'Thank you kindly!'. He takes a large bite and stuffs the other apples into his bag as he chews.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 300));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(15, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(109, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(109, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(15, "all", ">", 4, nil));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst drei Silberstücke."));
talkEntry:addResponse("#me reißt die Äpfel an sich und übergibt beiläufig eine Geldbeutel: 'Vielen Dank!'. Er beißt genüßlich ab und verstaut die Äpfel kauend in einem Beutel.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 300));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(15, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(109, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(109, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Resupply"));
talkEntry:addResponse("Those apples were delicious. Thank you once again. I could use some more help. My supply of arrows is running low. If you bring me ten more, then I have something that might interest you.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(109, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(109, "=", 2));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Nachschub"));
talkEntry:addResponse("Die Äpfel waren köstlich, danke nochmal. Ich brauche aber weiterhin Hilfe. Mein Vorrat an Pfeilen nimmt ab, wenn ihr mir zehn Pfeile brächtet, wäre dies nicht zu eurem Nachteil.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(109, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(109, "=", 2));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Resupply"));
talkEntry:addResponse("Those apples were delicious. Thank you once again. I could use some more help. My supply of arrows is running low. if you bring me ten more, then I have something that might interest you.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(109, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(109, "=", 2));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Nachschub"));
talkEntry:addResponse("Die Äpfel waren köstlich, danke nochmal. Ich brauche aber weiterhin Hilfe. Mein Vorrat an Pfeilen nimmt ab, wenn ihr mir zehn Pfeile brächtet, wäre dies nicht zu eurem Nachteil.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(109, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(109, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(64, "all", "<", 10, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("#me glances at his empty quiver, frowning slightly: 'I am in urgent need of those ten arrows, if it is not too much trouble.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(109, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(64, "all", "<", 10, nil));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("#me starrt naserümpfend auf seinen leeren Köcher: 'Ich brauche dringend zehn Pfeile, wenn es euch nichts ausmacht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(109, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(64, "all", "<", 10, nil));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addResponse("#me glances at his empty quiver, frowning slightly: 'I am in urgent need of those ten arrows, if it is not too much trouble.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(109, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(64, "all", "<", 10, nil));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addResponse("#me starrt naserümpfend auf seinen leeren Köcher: 'Ich brauche dringend zehn Pfeile, wenn es euch nichts ausmacht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(109, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(64, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded five silver coins."));
talkEntry:addResponse("#me slides the arrows into his quiver, nodding in thanks, 'These shall do perfectly, thank you. I hope that this shall suffice as compensation.'");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 500));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(64, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(109, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(109, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(64, "all", ">", 9, nil));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst fünf Silberstücke."));
talkEntry:addResponse("#me steckt die Pfeile in seinen Köcher, dankbar nickend: 'Das sollte erstmal genug sein, habt dank. Ich hoffe, dies reicht euch als Entlohnung.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 500));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(64, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(109, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(109, "=", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Wild Animals"));
talkEntry:addResponse("I've received reports of wild animals attacking villagers of Yewdale. If you slay the animals, and bring me ten furs as evidence, Runewick shall be in your debt.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(109, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(109, "=", 4));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Wilde Tiere"));
talkEntry:addResponse("Mir wurde gemeldet, dass wilde Tiere die Dorfbewohner von Eibenthal angegriffen haben. Wenn ihr diese Biester erschlagt und mir zehn Felle als Beweiß bringt, wäre Runewick in eurer Schuld.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(109, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(109, "=", 4));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Wild Animals"));
talkEntry:addResponse("I've received reports of wild animals attacking villagers of Yewdale. If you slay the animals, and bring me ten furs as evidence, the town shall be in your debt.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(109, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(109, "=", 4));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Wilde Tiere"));
talkEntry:addResponse("Mir wurde gemeldet, dass wilde Tiere die Dorfbewohner von Eibenthal angegriffen haben. Wenn ihr diese Biester erschlagt und mir zehn Felle als Beweiß bringt, wäre Runewick in eurer Schuld.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(109, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(109, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2586, "all", "<", 10, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("I receive new attack reports daily. You must protect the citizens of Yewdale by killing the animals. If you bring me ten of their furs, then I shall ensure that your efforts are recognized.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(109, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2586, "all", "<", 10, nil));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Nahezu täglich hört man von Tierangriffen. Ihr müßt die Bürger von Eibenthal beschützen, indem ihr die Tiere erschlagt. Wenn ihr mir zehn Felle bringt, werde ich sicherstellen, dass man an höchster Stelle von euren Anstrengungen hört.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(109, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2586, "all", "<", 10, nil));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addResponse("I receive new attack reports daily. You must protect the citizens of Yewdale by killing the animals. If you bring me ten of their furs, then I shall ensure that your efforts are recognized.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(109, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2586, "all", "<", 10, nil));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addResponse("Nahezu täglich hört man von Tierangriffen. Ihr müßt die Bürger von Eibenthal beschützen, indem ihr die Tiere erschlagt. Wenn ihr mir zehn Felle bringt, werde ich sicherstellen, dass man an höchster Stelle von euren Anstrengungen hört.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(109, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2586, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded a legionaire's tower shield. You advance in Archmage Elvaine Morgan's favour."));
talkEntry:addResponse("#me bows his head respectfully: 'You have done very well, thank you. Yewdale and its citizens are safe once more. Please, take this shield as thanks for the risk you took.");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2586, 10, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(2448, 1, 799, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(109, "=", 6));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 10));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(109, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2586, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst einen Legionärsschild. Dein Ansehen bei Erzmagier Elvaine Morgan steigt."));
talkEntry:addResponse("#me verbeugt sich respektvoll: 'Das habt ihr gut gemacht. Eibenthal und seine Bürger sind jetzt wieder sicher. Bitte nehmt diesen Schild als Dank für das Risiko, welches ihr in Kauf nahmt.");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2586, 10, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(2448, 1, 799, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(109, "=", 6));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 10));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(109, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2586, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded a legionaire's tower shield."));
talkEntry:addResponse("#me bows his head respectfully: 'You have done very well, thank you. Yewdale and its citizens are safe once more. Please, take this shield as thanks for the risk you took.");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2586, 10, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(2448, 1, 799, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(109, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(109, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2586, "all", ">", 9, nil));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst einen Legionärsschild."));
talkEntry:addResponse("#me verbeugt sich respektvoll: 'Das habt ihr gut gemacht. Eibenthal und seine Bürger sind jetzt wieder sicher. Bitte nehmt diesen Schild als Dank für das Risiko, welches ihr in Kauf nahmt.");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2586, 10, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(2448, 1, 799, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(109, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(109, "=", 6));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("I shall not be needing your help at the moment, my friend. Go, rest. You have certainly earned it.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(109, "=", 6));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Derzeit benötige ich eure Hilfe nicht. Ihr könnt euch ausruhen, das habt ihr euch verdient.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(109, "=", 6));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addResponse("I shall not be needing your help at the moment, my friend. Go, rest. You have certainly earned it.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(109, "=", 6));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addResponse("Derzeit benötige ich eure Hilfe nicht. Ihr könnt euch ausruhen, das habt ihr euch verdient.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("I am a town guard. I take care of troublemakers.");
talkEntry:addResponse("I keep order 'round here, and make sure the citizens are safe.");
talkEntry:addResponse("I'm a soldier, serving here as a town guard.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Ich bin ein Wächter. Ich kümmere mich um Aufrührer.");
talkEntry:addResponse("Ich sorge für Ordnung hier und stelle sicher, dass die Bürger sicher schlafen können.");
talkEntry:addResponse("Ich bin ein Soldat, der hier Dienst als Wächter schiebt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("I am a town guard.");
talkEntry:addResponse("I protect Runewick and its citizens.");
talkEntry:addResponse("It's my job to keep the people safe and out of trouble.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Ich bin ein Wächter.");
talkEntry:addResponse("Ich beschütze Runewick und seine Bürger.");
talkEntry:addResponse("Es ist meine Aufgabe, die Leute zu beschützen und das Böse abzuwehren.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("The people of that island were a hardy folk. Not much seemed to faze them in the past.");
talkEntry:addResponse("I liked it there. It was peaceful when it needed to be, but excitement was always just around the corner.");
talkEntry:addResponse("That island was a breeding ground for crime and sins, unfortunately.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Das Volk dieser Insel war hart im Nehmen. Nichts hat sie früher aus der Fassung gebracht.");
talkEntry:addResponse("Es war schön dort. Friedlich, aber das Abenteuer lauerte hinter jeder Hausecke.");
talkEntry:addResponse("Diese Insel war leider ein Nährboden für Verbrechen und Sünden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("An honour to meet you.");
talkEntry:addResponse("A pleasure.");
talkEntry:addResponse("#me bows his head respectfully: 'Well met.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Es ist mir eine Ehre, eure Bekanntschaft zu machen.");
talkEntry:addResponse("Das Vergnügen ist auf meiner Seite.");
talkEntry:addResponse("#me neigt respektvoll den Kopf: 'Angenehm.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("law");
talkEntry:addResponse("The laws are tough, but fair.");
talkEntry:addResponse("Take a look in the library. It should not be difficult to find a copy of the town's laws.");
talkEntry:addResponse("The laws are easily found. Take a look around and you'll find them eventually.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("guard");
talkEntry:addResponse("Being a guard of Runewick is a rewarding job. The money is good, and it is a fine way to help the citizens.");
talkEntry:addResponse("There is no greater way for me to serve my Gods than by guarding the people.");
talkEntry:addResponse("Becoming a guard seemed like the only sensible step for me to take. Fighting is the only thing I ever learned to do well.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("criminal");
talkEntry:addTrigger("thief");
talkEntry:addTrigger("crime");
talkEntry:addTrigger("assault");
talkEntry:addTrigger("stole");
talkEntry:addResponse("It has been rather quiet today. Not too much trouble around.");
talkEntry:addResponse("If you are a victim or witness of a crime, please submit a formal report to the Archmage.");
talkEntry:addResponse("The Archmage decides who investigates specific crimes. You should speak to him when you have trouble.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quiet");
talkEntry:addTrigger("bored");
talkEntry:addTrigger("peace");
talkEntry:addResponse("Trouble is always just around the corner.");
talkEntry:addResponse("Don't go thinking that you have to be the one to make some noise.");
talkEntry:addResponse("They say that it's always quiet before the storm.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yewdale");
talkEntry:addResponse("Yewdale is a small community of peasants. Just cross the bridge and follow the road. You cannot miss it.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bridge");
talkEntry:addResponse("I guard this bridge and by doing so, I guard Runewick. The teleporter over there is the only way into town.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Teleport");
talkEntry:addResponse("Do you see that teleporter to the west? It takes you to Runewick, the most magnificient set of boulders in the ocean.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gesetz");
talkEntry:addResponse("Die Gesetze hier sind streng, aber gerecht.");
talkEntry:addResponse("Schaut mal in der Bibliothek vorbei, es sollte nicht schwierig sein, die Gesetze dort zu finden.");
talkEntry:addResponse("Die Gesetze sind leicht zu erhalten. Schaut euch nur in der Stadt um, sie umgeben euch!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wache");
talkEntry:addTrigger("Wächter");
talkEntry:addResponse("Ein Wächter Runewicks zu sein ist ein lohenswerter Beruf. Man hilft den Bürgern und die Bezahlung stimmt auch.");
talkEntry:addResponse("Es gibt keinen besseren Weg meinen Göttern zu dienen als Leute zu beschützen.");
talkEntry:addResponse("Ein Wächter zu werden erschien mir als das einzig richtige. Ich habe nichts außer zu Kämpfen in meinem Leben gelernt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Kriminell");
talkEntry:addTrigger("Dieb");
talkEntry:addTrigger("Verbrech");
talkEntry:addTrigger("Angriff");
talkEntry:addTrigger("Stehlen");
talkEntry:addResponse("Es ist verdächtig ruhig dieser Tage, kaum Aufruhr.");
talkEntry:addResponse("Wenn ihr Opfer oder Zeuge eines Verbrechens werdet, so stellt bitte eine formale Eingabe an den Erzmagier.");
talkEntry:addResponse("Der Erzmagier entscheidet darüber, wer einem Verbrechen nachgeht. Redet mit ihm, wenn ihr Probleme habt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ruhig");
talkEntry:addTrigger("langweilig");
talkEntry:addTrigger("Frieden");
talkEntry:addResponse("Ärger lauert hinter jeder Hausecke.");
talkEntry:addResponse("Nun meint aber nicht, dass es an euch ist, für Krach zu sorgen.");
talkEntry:addResponse("Die Ruhe kommt vor dem Sturm.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eibenthal");
talkEntry:addResponse("Eibenthal ist eine kleine Gemeinde von Bauern. Überquert die Brücke und folgt der Straße - ihr könnt es nicht verfehlen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Brücke");
talkEntry:addResponse("Ich bewache diese Brücke und mit ihr bewache ich Runewick. Der Teleporter dort drüben ist der einzige Weg in die Stadt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Teleport");
talkEntry:addResponse("Seht ihr den Teleporter im Westen? Er bringt euch nach Runewick, den großartigsten Felsen in der Brandung.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addResponse("The archmage does his best to keep Runewick safe. I do my little share by guarding this bridge.");
talkEntry:addResponse("Elvaine Morgan is a good leader. He has a vision and if you are interested, he will tell it to you. Takes a while, though.");
talkEntry:addResponse("I overheard some people make jokes about the first name of the Archmage, Elvaine. I would not make jokes about a magician as powerful as him, if I were you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Der Erzmagier tut alles, um Runewick zu einem sicheren Ort zu machen. Und auch ich trage meinen kleinen Teil dazu bei, indem ich diese Brücke bewache.");
talkEntry:addResponse("Elvaine Morgan ist ein guter Anführer. Er hat eine Vision und wenn es euch interessiert, wird er sie euch erzählen. Wird allerdings eine Weile in Anspruch nehmen.");
talkEntry:addResponse("Ich habe gehört, dass einige Leute Witze über den Vornamen des Erzmagiers, Elvaine, machen. Wenn ich ihr wäre, würde ich keine Witze über so einen mächtigen Magier machen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("The archmage does his best to keep Runewick safe. I do my little share by guarding this bridge.");
talkEntry:addResponse("Elvaine Morgan is a good leader. He has a vision and if you are interested, he will tell it to you. Takes a while, though.");
talkEntry:addResponse("I overheard some people make jokes about the first name of the Archmage, Elvaine. I would not make jokes about a magician, as powerful as him, if I were you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Der Erzmagier tut alles, um Runewick zu einem sicheren Ort zu machen. Und auch ich trage meinen kleinen Teil dazu bei, indem ich diese Brücke bewache.");
talkEntry:addResponse("Elvaine Morgan ist ein guter Anführer. Er hat eine Vision und wenn es euch interessiert, wird er sie euch erzählen. Wird allerdings eine Weile in Anspruch nehmen.");
talkEntry:addResponse("Ich habe gehört, dass einige Leute Witze über den Vornamen des Erzmagiers, Elvaine, machen. Wenn ich ihr wäre, würde ich keine Witze über so einen mächtigen Magier machen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Runewick is firm like a rock. Not surprising since it was made of rocks.");
talkEntry:addResponse("Runewick became my new home. I was born in Salkamar and spent my youth on an island called Gobaith. But that is no more...");
talkEntry:addResponse("Runewick? Well, look east and tell me what you see there. That is Runewick!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Runewick ist wie ein Fels in der Brandung. Kein Wunder, denn es wurde aus Steinen gebaut.");
talkEntry:addResponse("Runewick ist meine neue Heimat. Ich wurde in Salkamar geboren und habe meine Jugend auf einer Insel namens Gobaith verbracht. Aber das war einmal...");
talkEntry:addResponse("Runewick, nun, schaut doch mal nach Osten und sagt mir, was ihr da seht. Das ist Runewick!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("I overheard the real name of the Don's father is John. That makes the Don a John-son, har, har!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Ich habe gehört der echte Name des Vaters des Dons wäre John. Das macht aus dem Don einen Johnson, har, har!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Galmair is far away, and that's good.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Galmair ist fern von hier. Und das ist auch gut so.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Queen");
talkEntry:addResponse("The Queen of Cadomyr became queen because of her birthright. The Archmage became our leader because he is the best!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königin");
talkEntry:addResponse("Die Königin von Cadomyr wurde Königin, weil sie dazu geboren wurde. Der Erzmagier ist unser Anführer, weil er einfach der beste Mann ist!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Die Königin von Cadomyr wurde Königin, weil sie dazu geboren wurde. Der Erzmagier ist unser Anführer, weil er einfach der beste Mann ist!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Die Königin von Cadomyr wurde Königin, weil sie dazu geboren wurde. Der Erzmagier ist unser Anführer, weil er einfach der beste Mann ist!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Cadomyr's people are inequitable, despicable, dastardly, and blasphemous. But besides that, the town is nice.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Cadomyrs Volk ist ungerecht, unbarmherzig, niederträchtig und gotteslästernd. Aber ansonsten ist es eine schöne Stadt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("albar");
talkEntry:addResponse("I've been to Albar once before. I found it to be a rather... backward place.");
talkEntry:addResponse("Albar is a very corrupt land, from what I've heard.");
talkEntry:addResponse("Albarian commoners seem pleasant enough. Their women are rather reserved though.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("Ich war früher einmal in Albar. Es machte auf mich einen ziemlich... rückständigen Eindruck.");
talkEntry:addResponse("Albar ist ein sehr korruptes Land, so sagt man.");
talkEntry:addResponse("Albarisches Landvolk ist eigenlich recht genügsam. Ihre Frauen sind allerdings recht zugeknöpft.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addResponse("Ah, yes... Gynk, the 'Pool of Sin'.");
talkEntry:addResponse("I've never been to Gynk. They tell me that you will never see more criminals running 'round anywhere else though.");
talkEntry:addResponse("The Thieves' Guilds of Gynk have far too much influence for my liking. Power must be held by the authorities, not by criminals.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("Ah, ja, Gynk, der Sündenpfuhl.");
talkEntry:addResponse("Ich war noch nie in Gynk. Man sagte mir, dass man dort so viele Gauner herumstreunern sieht wie nirgens anders.");
talkEntry:addResponse("Die Diebesgilden von Gynk haben für meinen Geschmack viel zu viel Einfluß. Die Macht muss bei der Obrigkeit verbleiben, nicht bei Strolchdieben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Ahh... Salkamar. It is my homeland, did you know?");
talkEntry:addResponse("I was born and raised in the lands of Salkamar. You will struggle to find a more honourable and loyal people than us.");
talkEntry:addResponse("You will never find a greater army than that of Salkamar. Its leaders are cunning, it's men are loyal, and it's ranks are ordered.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Ah... Salkamar, meine Heimat. Wußtet ihr, dass ich von dort stamme?");
talkEntry:addResponse("Ich wurde in Salkamar geboren und erzogen. Ihr werdet niemals ehrenhaftere und loyalere Menschen als uns finden.");
talkEntry:addResponse("Ihr werdet niemals eine großartigere Armee finden als die Salkamars. Die Heerführer sind intelligent, die Männer loyal und es herrscht Ordnung.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("Zhambra and Malachín are my patron deities.");
talkEntry:addResponse("I am protected by the Lords Malachín and Zhambra in battle. They have kept me safe so far.");
talkEntry:addResponse("I worship Zhambra and Malachín.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Zhambra und Malachín sind meine Schutzgötter.");
talkEntry:addResponse("Die Herren Malachín und Zhambra wachen über mich in der Schlacht. Bis jetzt haben sie ihre Sache gut gemacht.");
talkEntry:addResponse("Ich diene Zhambra und Malachín.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Adron");
talkEntry:addResponse("I respect his followers, but I do not worship that God.");
talkEntry:addResponse("I confess to knowing little about Adron. I hear his followers frequent the tavern though.");
talkEntry:addResponse("You would be better off speaking to someone else about that God. I'm certain there are followers nearby.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Adron");
talkEntry:addResponse("Ich respektiere seine Anhänger, aber ich bin keiner von ihnen.");
talkEntry:addResponse("Ich muss zugeben, ich weiß nur wenig über Adron. Man sagt, seine Anhänger feiern heiligen Messen nur in Tavernen.");
talkEntry:addResponse("Ihr solltet lieber mit jemand anderem über diesen Gott reden, ich bin mir sicher, ihr werdet jemanden finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addResponse("I respect his followers, but I do not worship that God.");
talkEntry:addResponse("I confess to knowing little about the God of Fire.");
talkEntry:addResponse("You would be better off speaking to someone else about that God. I'm certain there are followers nearby.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addResponse("Ich respektiere seine Anhänger, aber ich bin keiner von ihnen.");
talkEntry:addResponse("Ich muss zugeben, ich weiß nur wenig über den Gott des Feuers.");
talkEntry:addResponse("Ihr solltet lieber mit jemand anderem über diesen Gott reden, ich bin mir sicher, ihr werdet jemanden finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cherga");
talkEntry:addResponse("I respect her followers, but I do not worship that Goddess.");
talkEntry:addResponse("I confess to knowing little about Cherga or those who worship her.");
talkEntry:addResponse("You would be better off speaking to someone else about that Goddess. I'm certain there are followers nearby.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addResponse("Ich respektiere ihre Anhänger, aber ich bin keiner von ihnen.");
talkEntry:addResponse("Ich muss zugeben, ich weiß nur wenig über Cherga oder ihre Anhänger.");
talkEntry:addResponse("Ihr solltet lieber mit jemand anderem über diese Göttin reden, ich bin mir sicher, ihr werdet jemanden finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elara");
talkEntry:addResponse("I respect her followers, but I do not worship that Goddess.");
talkEntry:addResponse("I confess to knowing little about Elara.");
talkEntry:addResponse("You would be better off speaking to someone else about that Goddess. I'm certain there are followers nearby.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elara");
talkEntry:addResponse("Ich respektiere ihre Anhänger, aber ich bin keiner von ihnen.");
talkEntry:addResponse("Ich muss zugeben, ich weiß nur wenig über Elara, außer, dass sie einen guten Kleidergeschmack haben soll.");
talkEntry:addResponse("Ihr solltet lieber mit jemand anderem über diese Göttin reden, ich bin mir sicher, ihr werdet jemanden finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Eldan");
talkEntry:addResponse("I respect his followers, but I do not worship that God.");
talkEntry:addResponse("I confess to knowing little about Eldan.");
talkEntry:addResponse("You would be better off speaking to someone else about that God. I'm certain there are followers nearby.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eldan");
talkEntry:addResponse("Ich respektiere seine Anhänger, aber ich bin keiner von ihnen.");
talkEntry:addResponse("Ich muss zugeben, ich weiß nur wenig über Eldan.");
talkEntry:addResponse("Ihr solltet lieber mit jemand anderem über diesen Gott reden, ich bin mir sicher, ihr werdet jemanden finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Findari");
talkEntry:addResponse("I respect her followers, but I do not worship that Goddess.");
talkEntry:addResponse("I confess to knowing little about Findari.");
talkEntry:addResponse("You would be better off speaking to someone else about that Goddess. I'm certain there are followers nearby.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Findari");
talkEntry:addResponse("Ich respektiere ihre Anhänger, aber ich bin keiner von ihnen.");
talkEntry:addResponse("Ich muss zugeben, ich weiß nur wenig über Findari.");
talkEntry:addResponse("Ihr solltet lieber mit jemand anderem über diese Göttin reden, ich bin mir sicher, ihr werdet jemanden finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("I respect his followers, but I do not worship that God.");
talkEntry:addResponse("I confess to knowing little about Irmorom. Speak to some Dwarves, that would be your best bet.");
talkEntry:addResponse("You would be better off speaking to someone else about that God. I'm certain there are followers nearby.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("Ich respektiere seine Anhänger, aber ich bin keiner von ihnen.");
talkEntry:addResponse("Ich muss zugeben, ich weiß nur wenig über Irmorom. Redet mit den Zwergen, das ist mein Ratschlag-");
talkEntry:addResponse("Ihr solltet lieber mit jemand anderem über diesen Gott reden, ich bin mir sicher, ihr werdet jemanden finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addResponse("Malachín is the God of Battle. He watches over all those who fight with honour.");
talkEntry:addResponse("#me closes his eyes and tilts his head upward, whispering a silent prayer.");
talkEntry:addResponse("The God of Battle is one of my patron Gods. It is he who ensures that my blade swings true.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addResponse("Malachín ist der Gott der Schlacht. Er wacht über die, die ehrenhaft kämpfen.");
talkEntry:addResponse("#me schließt die Augen und legt seinen Kopf in den Nacken um leise ein Gebet zu sprechen.");
talkEntry:addResponse("Der Gott der Schlachten ist einer meiner Schutzgötter. Er ist es, der mein Schwert führt um Gerechtigkeit walten zu lassen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Moshran");
talkEntry:addResponse("#me spits on the ground, expressing his distaste.");
talkEntry:addResponse("The followers of the Blood-God deserve whatever cruel, twisted fate awaits them.");
talkEntry:addResponse("I would not mention that name so freely if I were you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Moshran");
talkEntry:addResponse("#me spuckt voll Missachtung auf den Boden.");
talkEntry:addResponse("Die Gefolgschaft des Blutgottes möge ein grausames Schicksal haben.");
talkEntry:addResponse("Ihr solltet diesen Namen nicht so freimütig aussprechen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addTrigger("Nargùn");
talkEntry:addResponse("His followers are all fools and madmen.");
talkEntry:addResponse("I do not have time for the worshippers of Nargún.");
talkEntry:addResponse("Order is something that I greatly value, andnd something that the God of Chaos does not provide.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addTrigger("Nargùn");
talkEntry:addResponse("Seine Anhänger sind Idioten und Schwachsinnige.");
talkEntry:addResponse("Mir ist meine Zeit zu kostbar, um sie mit Anhängern Nargúns zu verschwenden.");
talkEntry:addResponse("Ich liebe Ordnung. Was habe ich also für den Gott des Chaos übrig?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("I respect her followers, but I do not worship that Goddess.");
talkEntry:addResponse("I confess to knowing little about Oldra. Perhaps a druid could inform you better.");
talkEntry:addResponse("You would be better off speaking to someone else about that Goddess. I'm certain there are followers nearby.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("Ich respektiere ihre Anhänger, aber ich bin keiner von ihnen.");
talkEntry:addResponse("Ich muss zugeben, ich weiß nur wenig über Oldra. Vielleicht kann euch ein Druide weiterhelfen.");
talkEntry:addResponse("Ihr solltet lieber mit jemand anderem über diese Göttin reden, ich bin mir sicher, ihr werdet jemanden finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("#me frowns lightly: 'His followers are thieves and petty criminals. Nothing but lowlife scum.'");
talkEntry:addResponse("Ah, the God of Thieves. Not a supporter of my work, as I understand it. He keeps me in a job though, I suppose.");
talkEntry:addResponse("I am paid to deal with Ronagan's followers. You'll find plenty of them behind bars. He causes far more harm than good, in my humble opinion.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("#me rümpft die Nase: 'Seine Anhänger sind Diebe und gemeine Gauner. Nichts als Abschaum!");
talkEntry:addResponse("Ah, der Gott der Diebe. Er ist nicht gerade ein Förderer meiner Arbeit, möchte man meinen. Aber gleichzeitig sichert er mir auch meinen Posten.");
talkEntry:addResponse("Ich werde dafür bezahlt, um mich mit Ronagans Anhängern rumzuplagen. Viele von ihnen landen hinter Gittern. Andere... nicht, falls ihr mich versteht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("I respect her followers, but I do not worship that Goddess.");
talkEntry:addResponse("I confess to knowing little about Sirani.");
talkEntry:addResponse("You would be better off speaking to someone else about that Goddess. I'm certain there are followers nearby.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("Ich respektiere ihre Anhänger, aber ich bin keiner von ihnen.");
talkEntry:addResponse("Ich muss zugeben, ich weiß nur wenig über Sirani.");
talkEntry:addResponse("Ihr solltet lieber mit jemand anderem über diese Göttin reden, ich bin mir sicher, ihr werdet jemanden finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("I respect her followers, but I do not worship that Goddess.");
talkEntry:addResponse("I confess to knowing little about that Goddess.");
talkEntry:addResponse("You would be better off speaking to someone else about that Goddess. I'm certain there are followers nearby.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("Ich respektiere ihre Anhänger, aber ich bin keiner von ihnen.");
talkEntry:addResponse("Ich muss zugeben, ich weiß nur wenig über diese Göttin.");
talkEntry:addResponse("Ihr solltet lieber mit jemand anderem über diese Göttin reden, ich bin mir sicher, ihr werdet jemanden finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("I respect her followers, but I do not worship that Goddess.");
talkEntry:addResponse("I confess to knowing little about Ushara. I recommend speaking with an Elf about such matters");
talkEntry:addResponse("You would be better off speaking to someone else about that Goddess. I'm certain there are followers nearby.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("Ich respektiere ihre Anhänger, aber ich bin keiner von ihnen.");
talkEntry:addResponse("Ich muss zugeben, ich weiß nur wenig über Ushara. Ich empfehle euch mit einem Elf über dieserlei Dinge zu reden.");
talkEntry:addResponse("Ihr solltet lieber mit jemand anderem über diese Göttin reden, ich bin mir sicher, ihr werdet jemanden finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Zhambra");
talkEntry:addResponse("The God of Friendship and Loyalty is one of my patron deities. He keeps me safe, provided I stay faithful.");
talkEntry:addResponse("I worship Zhambra and eagerly await the day He leads me to the paradise.");
talkEntry:addResponse("Loyalty is vital for a man in my position. Lord Zhambra keeps me honest.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zhambra");
talkEntry:addResponse("Der Gott der Freundschaft und Loyalität ist einer meiner Schutzgötter. Er hält seine schützende Hand über mich, solange ich fromm bleibe.");
talkEntry:addResponse("Ich verehre Zhambra und kann es kaum erwarten, dass er mich eines Tages in die Ewigkeit geleiten wird.");
talkEntry:addResponse("Loyalität ist unerläßlich für einen Mann in meiner Position. Und der Herr Zhambra leitet meine Hand.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("My apologies, but I am on duty. I cannot trade with you at the moment.");
talkEntry:addResponse("I do not wish to trade with you.");
talkEntry:addResponse("#me holds his hand up, shaking his head: 'Not while I'm on duty, thank you.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Entschuldigt, ich bin im Dienst, ich kann nicht mit euch handeln.");
talkEntry:addResponse("Ich möchte nicht mit euch handeln.");
talkEntry:addResponse("#me hebt die Hand und schüttelt mit dem Kopf: 'Nicht solange ich im Dienst bin.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("Hmm. You look like you could wield a weapon. Perhaps the Archmage would be interested in your services.");
talkEntry:addResponse("Have you read the town's laws? It shouldn't be too hard to find a copy.");
talkEntry:addResponse("I find the tower shield from Salkamar, my homeland, to be the most effective. Not too many weapons can find their way around or through one of them, I tell you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Hm. Ihr seht aus, als wenn ihr eine Waffe tragen könntet. Vielleicht hat der Erzmagier ja Interesse an euren Diensten.");
talkEntry:addResponse("Habt ihr schon die Gesetze der Stadt gelesen? Es sollte nicht sonderlich schwer sein, eine Ausgabe zu finden.");
talkEntry:addResponse("Ich finde das die Turmschilde aus Salkamar, meiner Heimat, sehr effektiv sind. Um sie kommt kaum eine Waffe herum, geschweige denn hindurch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Brassius");
talkEntry:addTrigger("Meres");
talkEntry:addResponse("My apologies, I am on duty. Perhaps someone else can help you.");
talkEntry:addResponse("I should be getting back to my work.");
talkEntry:addResponse("I am quite busy at the moment, sorry.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Brassius");
talkEntry:addTrigger("Meres");
talkEntry:addResponse("Entschuldigt, aber ich bin im Dienst. Vielleicht kann euch jemand anderes helfen.");
talkEntry:addResponse("Ich sollte wieder an meinen Dienst denken.");
talkEntry:addResponse("Ich bin derzeit recht beschäftigt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("My apologies, I am on duty. Perhaps someone else can help you.");
talkEntry:addResponse("I should be getting back to my work.");
talkEntry:addResponse("I am quite busy at the moment, sorry.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("Entschuldigt, aber ich bin im Dienst. Vielleicht kann euch jemand anderes helfen.");
talkEntry:addResponse("Ich sollte wieder an meinen Dienst denken.");
talkEntry:addResponse("Ich bin derzeit recht beschäftigt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("My apologies, I am on duty. Perhaps someone else can help you.");
talkEntry:addResponse("I should be getting back to my work.");
talkEntry:addResponse("I am quite busy at the moment, sorry.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("Entschuldigt, aber ich bin im Dienst. Vielleicht kann euch jemand anderes helfen.");
talkEntry:addResponse("Ich sollte wieder an meinen Dienst denken.");
talkEntry:addResponse("Ich bin derzeit recht beschäftigt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("I should really be returning to my work.");
talkEntry:addResponse("If the Archmage catches me chatting away, he will not be pleased.");
talkEntry:addResponse("Please, you shall get me into trouble if I am caught standing here chatting.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Ich sollte mich wieder um meinen Dienst kümmern.");
talkEntry:addResponse("Wenn der Erzmagier mich dabei erwischt, wie ich herumklöne, wird er nicht zufrieden sein.");
talkEntry:addResponse("Bitte, ich bekomme noch Ärger, wenn man mich hier tratschen sieht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me rückt den Kinnriemen seines Helmes zurecht.", "#me adjusts the chin strap on his helm.");
talkingNPC:addCycleText("#me hustet hinter vorgehaltener Hand.", "#me coughs into a closed fist.");
talkingNPC:addCycleText("#me schaut in seinen Köcher.", "#me glances into his quiver.");
talkingNPC:addCycleText("#me zieht die Sehne seines Bogens nach.", "#me tightens the string of his bow.");
talkingNPC:addCycleText("#me legt eine Hand auf den Griff seines ungezogenen Schwertes.", "#me places a hand upon the hilt of his sheathed blade.");
talkingNPC:addCycleText("#me schaut sich die Gegend um ihn herum an.", "#me's eyes wander over the scene before him.");
talkingNPC:addCycleText("#me schaut düster drein.", "#me looks around suspiciously.");
talkingNPC:addCycleText("Dann geht mal weiter.", "Move along, then.");
talkingNPC:addCycleText("Macht hier keinen Ärger.", "Don't go causing any trouble 'round here.");
talkingNPC:addCycleText("Wir sehen alles.", "We're watching.");
talkingNPC:addCycleText("Bleibt nicht länger auf der Brücke als nötig.", "Don't stay on the bridge longer than necessary.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(1);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Dieser NPC ist Brassius Meres der Wächter.", "This NPC is Brassius Meres the Guard.");
mainNPC:setUseMessage("Nehmt augenblicklich eure Hände von mir!", "Remove your hands from me this instant!");
mainNPC:setConfusedMessage("#me schaut verwirrt.", "#me looks around confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 362);
mainNPC:setEquipment(11, 55);
mainNPC:setEquipment(5, 2708);
mainNPC:setEquipment(6, 2708);
mainNPC:setEquipment(4, 528);
mainNPC:setEquipment(9, 2113);
mainNPC:setEquipment(10, 697);
mainNPC:setAutoIntroduceMode(true);

mainNPC:initDone();
end;

function receiveText(npcChar, texttype, message, speaker) mainNPC:receiveText(npcChar, texttype, speaker, message); end;
function nextCycle(npcChar)
  mainNPC:nextCycle(npcChar);
  npc.base.guards_static.NextCycle(npcChar);
end;
function lookAtNpc(npcChar, char, mode) mainNPC:lookAt(npcChar, char, mode); end;
function useNPC(npcChar, char, counter, param) mainNPC:use(npcChar, char); end;
initNpc();
initNpc = nil;
-- END
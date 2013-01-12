--------------------------------------------------------------------------------
-- NPC Name: Rowan Banius                                            Runewick --
-- NPC Job:  Farmer                                                           --
--                                                                            --
-- NPC Race: human                      NPC Position:  889, 538, 0            --
-- NPC Sex:  male                       NPC Direction: south                  --
--                                                                            --
-- Author:   Grokk                                                            --
--                                                       easyNPC Parser v1.21 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (0, 889, 538, 0, 4, 'Rowan Banius', 'npc.rowan_banius', 0, 4, 3, 23, 23, 23, 238, 207, 161);
---]]

require("npc.base.basic")
require("npc.base.condition.chance")
require("npc.base.condition.item")
require("npc.base.condition.language")
require("npc.base.condition.quest")
require("npc.base.consequence.deleteitem")
require("npc.base.consequence.inform")
require("npc.base.consequence.item")
require("npc.base.consequence.money")
require("npc.base.consequence.quest")
require("npc.base.consequence.rankpoints")
require("npc.base.consequence.treasure")
require("npc.base.talk")
module("npc.rowan_banius", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(322, ">", 11));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Error] Something went wrong, please inform a developer."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Rowan Banius the farmer. Keywords: quest, profession, farm, wife, what sell."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Banius der Bauer. Schlüsselwörter: Auftrag, Beruf, Hof, Frau, was verkauft."));
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
talkEntry:addResponse("#me runs a hand through his ruffled hair, nodding once.");
talkEntry:addResponse("#me glances at you with red eyes, 'Aye, greetings.'");
talkEntry:addResponse("#me opens his mouth to speak, his voice quiet and weary, 'Be greeted.'");
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
talkEntry:addResponse("#me fährt sich mit einer Hand durchs zerzauste Haar und nickt kurz.");
talkEntry:addResponse("#me blickt dich mit roten Augen an:'Ja, Grüße'.");
talkEntry:addResponse("#me öffnet seinen Mund um mit leiser, müder Stimme zu antworten, 'Seid gegrüßt'.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("#me runs a hand through his ruffled hair, nodding once.");
talkEntry:addResponse("#me glances at you with red eyes, 'Aye, greetings.'");
talkEntry:addResponse("#me opens his mouth to speak, his voice quiet and weary, 'Be greeted.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("#me fährt sich mit einer Hand durchs zerzauste Haar und nickt kurz.");
talkEntry:addResponse("#me blickt dich mit roten Augen an:'Ja, Grüße'.");
talkEntry:addResponse("#me öffnet seinen Mund um mit leiser, müder Stimme zu antworten, 'Seid gegrüßt'.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Take care.");
talkEntry:addResponse("Aye, so long. Please keep my wife in your prayers.");
talkEntry:addResponse("May the Gods watch over you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Gebt auf euch Acht!");
talkEntry:addResponse("Bis Dann! Bedenkt meine Frau in Euren Gebeten!");
talkEntry:addResponse("Mögen die Götter über Euch wachen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Take care.");
talkEntry:addResponse("Aye, so long. Please keep my dear wife in your prayers.");
talkEntry:addResponse("May the Gods watch over you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Gebt auf euch Acht!");
talkEntry:addResponse("Bis Dann! Bedenkt meine liebe Frau in Euren Gebeten!");
talkEntry:addResponse("Mögen die Götter über Euch wachen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("I am fine, but my poor, beloved wife has fallen ill. I truly need a helping hand.");
talkEntry:addResponse("I am torn. My wife is unwell and we run low on supplies. But I cannot afford to leave the farm, for this season's crops would certainly perish.");
talkEntry:addResponse("Show your concern for my wife, not I. I am in dire need of assistance.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befind");
talkEntry:addResponse("Mir geht es gut. Meine arme Freu jedoch ist krank. Ich bräuchte dringend Hilfe.");
talkEntry:addResponse("Ich bin unschlüssig. Meine Frau ist krank und uns gehen die Vorräte aus. Ich kann nicht riskieren das die Ernte verdirbt, wenn ich jetzt den Hof verlasse.");
talkEntry:addResponse("Sorgt euch um meine Frau, nicht um mich. Ich benötige schrecklich dringend Hilfe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("My name is Rowan Banius. I am but a humble farmer.");
talkEntry:addResponse("I am Rowan Banius. This is my beloved wife, Natiana. Please, you must not get too close.");
talkEntry:addResponse("Rowan Banius is my name. I only wish that we could have met during a less difficult time.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ihr name");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Ich heiße Rowan Banius. Ich bin nur ein ärmlicher Bauer.");
talkEntry:addResponse("Ich bin Rowan Banius. Dies ist meine geliebte Frau Natina. Bitte, kommt nicht näher heran.");
talkEntry:addResponse("Rowan Banius, so heiße ich. Ich wünschrte wir hatten uns in einer weniger schweren Stunde getroffen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] The Farmer's Wife: Part I"));
talkEntry:addResponse("You will help? Oh, you are most kind. I am truly grateful. We are running low on food, and this season's crops and due for a few weeks. If you can bring me ten cooked hams, then I will be able to prepare enough meals until then.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(322, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 0));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Die Geistereiche I"));
talkEntry:addResponse("Ihr werde uns helfen? Oh, Ihr seid zu gütig. Ich bin wirklich dankbar. Wir haben nur noch wenig Vorräte im Haus und bald ist Erntezeit. Wenn Ihr mir 10 gekochte Schinken bringen könhntet, so werde ich bis zur Ernte genug Essen auf den Tisch bringen können.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(322, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 0));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] The Farmer's Wife: Part I"));
talkEntry:addResponse("You will help? Oh, you are most kind. I am truly grateful. We are running low on food, and this season's crops and due for a few weeks. If you can bring me ten cooked hams, then I will be able to prepare enough meals until then.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(322, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 0));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Die Geistereiche I"));
talkEntry:addResponse("Ihr werde uns helfen? Oh, Ihr seid zu gütig. Ich bin wirklich dankbar. Wir haben nur noch wenig Vorräte im Haus und bald ist Erntezeit. Wenn Ihr mir 10 gekochte Schinken bringen könhntet, so werde ich bis zur Ernte genug Essen auf den Tisch bringen können.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(322, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(306, "all", "<", 10, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("I am in urgent need of those ten hams. My poor wife is looking awfully pale, and would do well with a proper meal.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(306, "all", "<", 10, nil));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Ich benötige dringesnst besagte 10 Schinken.Meine Frau ist schon ganz bleich, ein anständiges Mahl wird ihr gut tun!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(306, "all", "<", 10, nil));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addResponse("I am in urgent need of those ten hams. My poor wife is looking awfully pale, and would do well with a proper meal.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(306, "all", "<", 10, nil));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addResponse("Ich benötige dringesnst besagte 10 Schinken.Meine Frau ist schon ganz bleich, ein anständiges Mahl wird ihr gut tun!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(306, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded four silver coins and a meat dish."));
talkEntry:addResponse("Oh! Thank you, thank you. My wife shall be able to enjoy a decent meal thanks to you. This is sure to raise her spirits.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 400));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(306, 10, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(557, 1, 599, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(322, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(306, "all", ">", 9, nil));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst vier Silberstücke und eimn Fleischgericht."));
talkEntry:addResponse("Oh! Habt dank, habt Dank! Meine Frau wird dank euch eine anstängige Mahlzeit genießen können. Dies wird ihr sicher wieder auf die Beine helfen.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 400));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(306, 10, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(557, 1, 599, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(322, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] The Farmer's Wife: Part II"));
talkEntry:addResponse("Yes, I could certainly use your assistance again. My dear wife has quite the chill. If you could bring me a blue coat, I would be most grateful. Blue is her favourite colour, you see, so it will keep her warm and bring a smile to her dear face.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(322, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 2));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Die Geistereiche II"));
talkEntry:addResponse("Ja, ich könnte mit Sicherheit Eure Hilfe gebrauchen. Meine liebe Frau friert so sehr. Wenn Ihr mir einen blauen Mantel bringen könntet, wäre ich Euch ausgesprochen bankbar.Baul ist ihre Lieblingsfarbe, Ihr versteht, dass der Mantel sie nicht nur warm halten, sonder ihr auch ein Lächeln entlocken.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(322, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 2));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] The Farmer's Wife: Part II"));
talkEntry:addResponse("Yes, I could certainly use your assistance again. My dear wife has quite the chill. If you could bring me a blue coat, I would be most grateful. Blue is her favourite colour, you see, so it will keep her warm and bring a smile to her dear face.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(322, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 2));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Die Geistereiche II"));
talkEntry:addResponse("Ja, ich könnte mit Sicherheit Eure Hilfe gebrauchen. Meine liebe Frau friert so sehr. Wenn Ihr mir einen blauen Mantel bringen könntet, wäre ich Euch ausgesprochen bankbar.Baul ist ihre Lieblingsfarbe, Ihr versteht, dass der Mantel sie nicht nur warm halten, sonder ihr auch ein Lächeln entlocken..");
talkEntry:addConsequence(npc.base.consequence.quest.quest(322, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2380, "all", "=", 0, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("My poor wife has had a good meal, but she shivers night and day. The sooner you can get that blue coat to me, the better.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2380, "all", "=", 0, nil));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Meine arme Frau hatte etwas gutes Essen, aber sie zittert tag und nacht. Je eher Ihr den blauen Mantel besoregen könnt, um so besser.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2380, "all", "=", 0, nil));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addResponse("My poor wife has had a good meal, but she shivers night and day. The sooner you can get that blue coat to me, the better.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2380, "all", "=", 0, nil));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addResponse("Meine arme Frau hatte etwas gutes Essen, aber sie zittert tag und nacht. Je eher Ihr den blauen Mantel besoregen könnt, um so besser..");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2380, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded six silver coins and a scythe."));
talkEntry:addResponse("Ah, this is perfect. Thank you, my friend. I hope this money shall be sufficient compensation. Hmm...here, take my old scythe, also.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 600));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2380, 1, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(271, 1, 599, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(322, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2380, "all", ">", 0, nil));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst sechs Silberstücke und ein eine Sense."));
talkEntry:addResponse("Ah, das ist ausgezeichnet. Ich danke euch, mein Freund. Ich hoffe dies ist eine angemessene Entschädigung.Hmm...hier, nehmt auch meine alte Sense.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 600));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2380, 1, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(271, 1, 599, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(322, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] The Farmer's Wife: Part III"));
talkEntry:addResponse("Though my wife's condition continues to worsen, we finally have some good news. I wrote to a healer and she believes that she may have found a cure to my wife's illness. Please, go to Druidhouse and seek out the druid, Aurora Snow, for me.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(322, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 4));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Die Geistereiche III"));
talkEntry:addResponse("Obwohl es meiner Frau immer schlechter geht, haben wir dennoch gute Neuigkeiten. Ich schrieb einem Heiler und sie meinte, sie könne meiner Frau helfen. Bitte, geht zum Druidenhaus und sucht die Heilerin Aurora Snow für mich auf.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(322, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 4));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] The Farmer's Wife: Part III"));
talkEntry:addResponse("Though my wife's condition continues to worsen, we finally have some good news. I wrote to a healer and she believes that she may have found a cure to my wife's illness. Please, go to the Druidhouse and seek out the druid, Aurora Snow, for me.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(322, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 4));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Die Geistereiche III"));
talkEntry:addResponse("Obwohl es meiner Frau immer schlechter geht, haben wir dennoch gute Neuigkeiten. Ich schrieb einem Heiler und sie meinte, sie könne meiner Frau helfen. Bitte, geht zum Druidenhaus und sucht die Heilerin Aurora Snow für mich auf.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(322, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 5));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Have you spoken with the druid yet? Aurora Snow is awaiting your arrival at the Druidhouse. Please, hurry. My poor wife has not improved.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 5));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Habt Ihr mit der Druidin gesprochen? Aurora Snow erwartet euch am Druidenhaus.Bitte beeilt euch. Meiner armen Frau geht es noch immer nicht besser.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 5));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addResponse("Have you spoken with the druid yet? Aurora Snow is awaiting your arrival in Druidhouse. Please, hurry. My poor wife has not improved.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 5));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addResponse("Habt Ihr mit der Druidin gesprochen? Aurora Snow erwartet euch am Druidenhaus.Bitte beeilt euch. Meiner armen Frau geht es noch immer nicht besser.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 10));
talkEntry:addCondition(npc.base.condition.item.item(391, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded a treasure map and 10 rankpoints."));
talkEntry:addResponse("Oh! I am so glad to see you! The medicine! Thank you! I do not think my wife would have lasted another two nights. I shall forever be in your debt, my friend. Please, take this.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(322, "=", 11));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 10));
talkEntry:addConsequence(npc.base.consequence.treasure.treasure(6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 10));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst eine Schatzkarze und 10 Rangpunkte."));
talkEntry:addResponse("Oh! Ich bin so froh euch zu sehen! Die Medizin! Vielen Dank! Ich hatte schon Sorge meine Frau würde die nächsten zwei Nächte nicht überleben Ich stehe auf Ewig in euer Schuld, mein Freund. Bitte, nehmt dies.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(322, "=", 11));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 10));
talkEntry:addConsequence(npc.base.consequence.treasure.treasure(6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 11));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("My wife is doing well, thanks to you. It shall be a while before she is back out on the farm, but she is alive, and we can ask no more.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 11));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Meiner Frau geht dank euch es besser. Es wird noch eine Weile dauern bis sie wieder auf dem Hof arbeiten kann, aber sie ist am Leben und das ist mir das wichtigste.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(1337, "=", 11));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addResponse("My wife is doing well, thanks to you. It shall be a while before she is back out on the farm, but she is alive, and we can ask no more.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(1337, "=", 11));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addResponse("Meiner Frau geht dank euch es besser. Es wird noch eine Weile dauern bis sie wieder auf dem Hof arbeiten kann, aber sie ist am Leben und das ist mir das wichtigste.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("I am a farmer. Though that may not last too much longer, if my wife does not soon regain her health.");
talkEntry:addResponse("I run this farm with my wife, Natiana. At least, we did, before she fell ill.");
talkEntry:addResponse("I am a farmer, though much of my time is spent caring for my sickly wife these days.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Ich bin ein Bauer. Aber vielleicht nicht mehr lange, wenn meimne Frau nicht bald wieder zu Kräften kommt.");
talkEntry:addResponse("Ich betreibe diesen Hof gemeinsam mit meiner Frau. Zumindest war das so, bevor sie krank wurde.");
talkEntry:addResponse("Ich bin ein Bauer, jedoch kümmere ich mich zur Zeit nur noch um meine kranke Frau.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("I am a farmer. Though that may not last too much longer, if my wife does not soon regain her health.");
talkEntry:addResponse("I run this farm with my wife, Natiana. At least, we did, before she fell ill.");
talkEntry:addResponse("I am a farmer, though much of my time is spent caring for my sickly wife these days.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Ich bin ein Bauer. Aber vielleicht nicht mehr lange, wenn meimne Frau nicht bald wieder zu Kräften kommt.");
talkEntry:addResponse("Ich betreibe diesen Hof gemeinsam mit meiner Frau. Zumindest war das so, bevor sie krank wurde.");
talkEntry:addResponse("Ich bin ein Bauer, jedoch kümmere ich mich zur Zeit nur noch um meine kranke Frau.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("That land was always kind to us.");
talkEntry:addResponse("Gobaith was a wonderful island. There, my wife and I never had so much as a cold between us.");
talkEntry:addResponse("That island's soil was rich and moist, perfect for a man of my profession.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Dieses Land meinte es stets gut mit uns.");
talkEntry:addResponse("Gobaith war eine wunderbare Insel.Dort stand nichts zwischen mir und meiner Frau, außer vielleicht mal einer Erkältung.");
talkEntry:addResponse("Die Insel war reich und fruchtbar, wie gemacht für einen Mann mit meinem Beruf.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("It is a pleasure to meet you. I only wish I could have done so at a less troubling time.");
talkEntry:addResponse("I am pleased to meet you. Though, if you do not mind, I should be caring for my wife.");
talkEntry:addResponse("It is a pleasure to meet you. I am not one to ask for a favour, but perhaps you would be so kind as to help my wife?");
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
talkEntry:addTrigger("farm");
talkEntry:addResponse("This place does alright.");
talkEntry:addResponse("The two of us can run this place comfortably enough. It's a bit more demanding when it is me alone, though.");
talkEntry:addResponse("I love it here. The peace, the quiet, the fresh air. It is a wonderful life.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("animal");
talkEntry:addTrigger("livestock");
talkEntry:addResponse("We have cows here sometimes. Their steak is quite sought after.");
talkEntry:addResponse("There is always demand for meat. We sell to several cooks, who use them for their meat dishes. With a considerable markup, might I add.");
talkEntry:addResponse("We sometimes raise pigs here. Their meat is cheaper than that of a cow, but they require far less trouble to raise, also.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("crop");
talkEntry:addResponse("There is always demand for whatever we grow here. Most meals involve at least a vegetable or two.");
talkEntry:addResponse("We've grown just about everything here: carrots, grains, cabbage, onions.");
talkEntry:addResponse("I'd have to say that tomatoes are my favourite vegetable. As hard as I try, I can't seem to get them to grow, though.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("wife");
talkEntry:addTrigger("natiana");
talkEntry:addResponse("My beloved wife is not feeling too well, unfortunately.");
talkEntry:addResponse("Natiana is a true treasure. I feel terrible that I can't do much to improve her condition.");
talkEntry:addResponse("I'm taking care of the farm and running the house, too, while my wife recovers.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Aurora");
talkEntry:addResponse("Aurora Snow is an old friend of my wife.");
talkEntry:addResponse("Ah, yes, Aurora. She is quite a skilled druid.");
talkEntry:addResponse("Aurora is a well-respected healer.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hof");
talkEntry:addTrigger("Bauernhof");
talkEntry:addTrigger("Farm");
talkEntry:addResponse("Dieser Ort ist in Ordnung.");
talkEntry:addResponse("Wir beide können den Hof gut bestellen. Allein ist es allerdings etwas anspruchsvoller.");
talkEntry:addResponse("Mir gefälllt es hier. Der Frieden, die Stille, die frische Luft. Das Leben hier ist wunderbar.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Vieh");
talkEntry:addTrigger("Tier");
talkEntry:addResponse("Wir halten ab und an Kühe. Ihr Steak ist sehr gefragt.");
talkEntry:addResponse("Es herrscht ständige Nachfrage nach Fleisch. Wir verkaufen an verschiedene Köche, die daraus Fleischgerichte kochen.Ich muss hinzufügen, sie zahlen natürlich einen großzügigen Aufschlag.");
talkEntry:addResponse("Wir ziehen auch manchmal Schweine auf, ihr Fleisch ist billiger als Kuhfleisch, aber dafür ist die Haltung der Schweine weniger mühsam.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Früchte");
talkEntry:addTrigger("Ernte");
talkEntry:addResponse("Es herscht stetige Nachfrage nach allem was wir hier anbauen. In die meisten Gerichte gehören schließlich ein oder zwei Gemüsesorten.");
talkEntry:addResponse("Wir bauen hier alles mögliche an: Möhren, Getreide,Kohl, Zwiebeln.");
talkEntry:addResponse("Ich würdfe sagen, am liebsten mag ich Tomaten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Frau");
talkEntry:addTrigger("Natiana");
talkEntry:addResponse("Meiner geliebten Frau geht es schlecht, leider.");
talkEntry:addResponse("Natiana ist wirklich ein Schatz. Ich fühle mich schlecht, weil ich ihr nicht helfen kann.");
talkEntry:addResponse("Ich kümmere mich um den Haushalt und den Hof, während meine Frau sich erholt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Aurora");
talkEntry:addResponse("Aurora Snow ist eine alte Freundin meiner Frau.");
talkEntry:addResponse("Ah ja, Aurora Snow. Sie ist eine sehr fähige Druidin.");
talkEntry:addResponse("Auroa ist eine hochangesehene Heilerin.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addResponse("My apologies, but my mind is too heavy to engage in such a discussion now.");
talkEntry:addResponse("I am truly sorry, but my wife needs my help.");
talkEntry:addResponse("Perhaps we can continue this discussion at a later time, for I must be helping my wife at the moment.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("My apologies, but my mind is too heavy to engage in such a discussion now.");
talkEntry:addResponse("I am truly sorry, but my wife needs my help.");
talkEntry:addResponse("Perhaps we can continue this discussion at a later time, for I must be helping my wife at the moment.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("My apologies, but my mind is too heavy to engage in such a discussion now.");
talkEntry:addResponse("I am truly sorry, but my wife needs my help.");
talkEntry:addResponse("Perhaps we can continue this discussion at a later time, for I must be helping my wife at the moment.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("My apologies, but my mind is too heavy to engage in such a discussion now.");
talkEntry:addResponse("I am truly sorry, but my wife needs my help.");
talkEntry:addResponse("Perhaps we can continue this discussion at a later time, for I must be helping my wife at the moment.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("My apologies, but my mind is too heavy to engage in such a discussion now.");
talkEntry:addResponse("I am truly sorry, but my wife needs my help.");
talkEntry:addResponse("Perhaps we can continue this discussion at a later time, for I must be helping my wife at the moment.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Queen");
talkEntry:addResponse("My apologies, but my mind is too heavy to engage in such a discussion now.");
talkEntry:addResponse("I am truly sorry, but my wife needs my help.");
talkEntry:addResponse("Perhaps we can continue this discussion at a later time, for I must be helping my wife at the moment.");
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
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("My apologies, but my mind is too heavy to engage in such a discussion now.");
talkEntry:addResponse("I am truly sorry, but my wife needs my help.");
talkEntry:addResponse("Perhaps we can continue this discussion at a later time, for I must be helping my wife at the moment.");
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
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("My apologies, but my mind is too heavy to engage in such a discussion now.");
talkEntry:addResponse("I am truly sorry, but my wife needs my help.");
talkEntry:addResponse("Perhaps we can continue this discussion at a later time, for I must be helping my wife at the moment.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("albar");
talkEntry:addResponse("My apologies, but my mind is too heavy to engage in such a discussion now.");
talkEntry:addResponse("I am truly sorry, but my wife needs my help.");
talkEntry:addResponse("Perhaps we can continue this discussion at a later time, for I must be helping my wife at the moment.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("Entschuldigt, aber ich bin in Gedanken gerade ganz wo anders.");
talkEntry:addResponse("Es tut mir wirklich leid, aber meine Frau braucht meine Hilfe.");
talkEntry:addResponse("Vielleicht können wir dieses Gespräch ein andermal fortsetzten, ich muss mich jetzt um meine Frau kümmern.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addResponse("My apologies, but my mind is too heavy to engage in such a discussion now.");
talkEntry:addResponse("I am truly sorry, but my wife needs my help.");
talkEntry:addResponse("Perhaps we can continue this discussion at a later time, for I must be helping my wife at the moment.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("Entschuldigt, aber ich bin in Gedanken gerade ganz wo anders.");
talkEntry:addResponse("Es tut mir wirklich leid, aber meine Frau braucht meine Hilfe.");
talkEntry:addResponse("Vielleicht können wir dieses Gespräch ein andermal fortsetzten, ich muss mich jetzt um meine Frau kümmern.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("salkama");
talkEntry:addResponse("My apologies, but my mind is too heavy to engage in such a discussion now.");
talkEntry:addResponse("I am truly sorry, but my wife needs my help.");
talkEntry:addResponse("Perhaps we can continue this discussion at a later time, for I must be helping my wife at the moment.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Entschuldigt, aber ich bin in Gedanken gerade ganz wo anders.");
talkEntry:addResponse("Es tut mir wirklich leid, aber meine Frau braucht meine Hilfe.");
talkEntry:addResponse("Vielleicht können wir dieses Gespräch ein andermal fortsetzten, ich muss mich jetzt um meine Frau kümmern.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("I would welcome the aid of any of the Gods at this point.");
talkEntry:addResponse("Please, keep my wife in your prayers.");
talkEntry:addResponse("The Gods have kept my wife and I safe and in good health, I only hope that they do so once more.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addResponse("Zur Zeit würde ich die Hilfe jeglicher Gottheit begrüßen.");
talkEntry:addResponse("Bitte bedenke meine Frau in Euren Gebeten.");
talkEntry:addResponse("Die Götter haben bis jetzt immer über meine Gesundheit und die meiner Frau gewacht, ich hoffe das sie es auch nocheinmal tun.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Adron");
talkEntry:addResponse("I would welcome the aid of any of the Gods at this point.");
talkEntry:addResponse("Please, keep my wife in your prayers.");
talkEntry:addResponse("The Gods have kept my wife and I safe and in good health, I only hope that they do so once more.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Adron");
talkEntry:addResponse("Zur Zeit würde ich die Hilfe jeglicher Gottheit begrüßen.");
talkEntry:addResponse("Bitte bedenke meine Frau in Euren Gebeten.");
talkEntry:addResponse("Die Götter haben bis jetzt immer über meine Gesundheit und die meiner Frau gewacht, ich hoffe das sie es auch nocheinmal tun.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addResponse("I would welcome the aid of any of the Gods at this point.");
talkEntry:addResponse("Please, keep my wife in your prayers.");
talkEntry:addResponse("The Gods have kept my wife and I safe and in good health, I only hope that they do so once more.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addResponse("Zur Zeit würde ich die Hilfe jeglicher Gottheit begrüßen.");
talkEntry:addResponse("Bitte bedenke meine Frau in Euren Gebeten.");
talkEntry:addResponse("Die Götter haben bis jetzt immer über meine Gesundheit und die meiner Frau gewacht, ich hoffe das sie es auch nocheinmal tun.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cherga");
talkEntry:addResponse("I would welcome the aid of any of the Gods at this point.");
talkEntry:addResponse("Please, keep my wife in your prayers.");
talkEntry:addResponse("The Gods have kept my wife and I safe and in good health, I only hope that they do so once more.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addResponse("Zur Zeit würde ich die Hilfe jeglicher Gottheit begrüßen.");
talkEntry:addResponse("Bitte bedenke meine Frau in Euren Gebeten.");
talkEntry:addResponse("Die Götter haben bis jetzt immer über meine Gesundheit und die meiner Frau gewacht, ich hoffe das sie es auch nocheinmal tun.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elara");
talkEntry:addResponse("I would welcome the aid of any of the Gods at this point.");
talkEntry:addResponse("Please, keep my wife in your prayers.");
talkEntry:addResponse("The Gods have kept my wife and I safe and in good health, I only hope that they do so once more.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elara");
talkEntry:addResponse("Zur Zeit würde ich die Hilfe jeglicher Gottheit begrüßen.");
talkEntry:addResponse("Bitte bedenke meine Frau in Euren Gebeten.");
talkEntry:addResponse("Die Götter haben bis jetzt immer über meine Gesundheit und die meiner Frau gewacht, ich hoffe das sie es auch nocheinmal tun.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Eldan");
talkEntry:addResponse("I would welcome the aid of any of the Gods at this point.");
talkEntry:addResponse("Please, keep my wife in your prayers.");
talkEntry:addResponse("The Gods have kept my wife and I safe and in good health, I only hope that they do so once more.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eldan");
talkEntry:addResponse("Zur Zeit würde ich die Hilfe jeglicher Gottheit begrüßen.");
talkEntry:addResponse("Bitte bedenke meine Frau in Euren Gebeten.");
talkEntry:addResponse("Die Götter haben bis jetzt immer über meine Gesundheit und die meiner Frau gewacht, ich hoffe das sie es auch nocheinmal tun.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Findari");
talkEntry:addResponse("I would welcome the aid of any of the Gods at this point.");
talkEntry:addResponse("Please, keep my wife in your prayers.");
talkEntry:addResponse("The Gods have kept my wife and I safe and in good health, I only hope that they do so once more.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Findari");
talkEntry:addResponse("Zur Zeit würde ich die Hilfe jeglicher Gottheit begrüßen.");
talkEntry:addResponse("Bitte bedenke meine Frau in Euren Gebeten.");
talkEntry:addResponse("Die Götter haben bis jetzt immer über meine Gesundheit und die meiner Frau gewacht, ich hoffe das sie es auch nocheinmal tun.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("I would welcome the aid of any of the Gods at this point.");
talkEntry:addResponse("Please, keep my wife in your prayers.");
talkEntry:addResponse("The Gods have kept my wife and I safe and in good health, I only hope that they do so once more.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("Zur Zeit würde ich die Hilfe jeglicher Gottheit begrüßen.");
talkEntry:addResponse("Bitte bedenke meine Frau in Euren Gebeten.");
talkEntry:addResponse("Die Götter haben bis jetzt immer über meine Gesundheit und die meiner Frau gewacht, ich hoffe das sie es auch nocheinmal tun.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addResponse("I would welcome the aid of any of the Gods at this point.");
talkEntry:addResponse("Please, keep my wife in your prayers.");
talkEntry:addResponse("The Gods have kept my wife and I safe and in good health, I only hope that they do so once more.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachin");
talkEntry:addResponse("Zur Zeit würde ich die Hilfe jeglicher Gottheit begrüßen.");
talkEntry:addResponse("Bitte bedenke meine Frau in Euren Gebeten.");
talkEntry:addResponse("Die Götter haben bis jetzt immer über meine Gesundheit und die meiner Frau gewacht, ich hoffe das sie es auch nocheinmal tun.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Moshran");
talkEntry:addResponse("Please, show some respect to my poor wife.");
talkEntry:addResponse("My wife and I have enough troubles without you bringing such darkness into our home.");
talkEntry:addResponse("Come, now. This is no time to be mentioning such evil.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Moshran");
talkEntry:addResponse("Bitte, zeigt meiner Fau gegenüber etwas mehr Respekt.");
talkEntry:addResponse("Meine Frau und ich haben schon genug Sorgen, ohne das Ihr die Dunkelheit in unser Haus tragt.");
talkEntry:addResponse("Hört, das ist nicht die rechte Zeit um über solch Böses zu sprechen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addTrigger("Nargùn");
talkEntry:addResponse("I would welcome the aid of any of the Gods at this point.");
talkEntry:addResponse("Please, keep my wife in your prayers.");
talkEntry:addResponse("The Gods have kept my wife and I safe and in good health, I only hope that they do so once more.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nargun");
talkEntry:addResponse("Zur Zeit würde ich die Hilfe jeglicher Gottheit begrüßen.");
talkEntry:addResponse("Bitte bedenke meine Frau in Euren Gebeten.");
talkEntry:addResponse("Die Götter haben bis jetzt immer über meine Gesundheit und die meiner Frau gewacht, ich hoffe das sie es auch nocheinmal tun.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("I would welcome the aid of any of the Gods at this point.");
talkEntry:addResponse("Please, keep my wife in your prayers.");
talkEntry:addResponse("The Gods have kept my wife and I safe and in good health, I only hope that they do so once more.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("Zur Zeit würde ich die Hilfe jeglicher Gottheit begrüßen.");
talkEntry:addResponse("Bitte bedenke meine Frau in Euren Gebeten.");
talkEntry:addResponse("Die Götter haben bis jetzt immer über meine Gesundheit und die meiner Frau gewacht, ich hoffe das sie es auch nocheinmal tun.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("I would welcome the aid of any of the Gods at this point.");
talkEntry:addResponse("Please, keep my wife in your prayers.");
talkEntry:addResponse("The Gods have kept my wife and I safe and in good health, I only hope that they do so once more.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("Zur Zeit würde ich die Hilfe jeglicher Gottheit begrüßen.");
talkEntry:addResponse("Bitte bedenke meine Frau in Euren Gebeten.");
talkEntry:addResponse("Die Götter haben bis jetzt immer über meine Gesundheit und die meiner Frau gewacht, ich hoffe das sie es auch nocheinmal tun.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("I would welcome the aid of any of the Gods at this point.");
talkEntry:addResponse("Please, keep my wife in your prayers.");
talkEntry:addResponse("The Gods have kept my wife and I safe and in good health, I only hope that they do so once more.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("Zur Zeit würde ich die Hilfe jeglicher Gottheit begrüßen.");
talkEntry:addResponse("Bitte bedenke meine Frau in Euren Gebeten.");
talkEntry:addResponse("Die Götter haben bis jetzt immer über meine Gesundheit und die meiner Frau gewacht, ich hoffe das sie es auch nocheinmal tun.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("I would welcome the aid of any of the Gods at this point.");
talkEntry:addResponse("Please, keep my wife in your prayers.");
talkEntry:addResponse("The Gods have kept my wife and I safe and in good health, I only hope that they do so once more.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("Zur Zeit würde ich die Hilfe jeglicher Gottheit begrüßen.");
talkEntry:addResponse("Bitte bedenke meine Frau in Euren Gebeten.");
talkEntry:addResponse("Die Götter haben bis jetzt immer über meine Gesundheit und die meiner Frau gewacht, ich hoffe das sie es auch nocheinmal tun.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("I would welcome the aid of any of the Gods at this point.");
talkEntry:addResponse("Please, keep my wife in your prayers.");
talkEntry:addResponse("The Gods have kept my wife and I safe and in good health, I only hope that they do so once more.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("Zur Zeit würde ich die Hilfe jeglicher Gottheit begrüßen.");
talkEntry:addResponse("Bitte bedenke meine Frau in Euren Gebeten.");
talkEntry:addResponse("Die Götter haben bis jetzt immer über meine Gesundheit und die meiner Frau gewacht, ich hoffe das sie es auch nocheinmal tun.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Zhambra");
talkEntry:addResponse("I would welcome the aid of any of the Gods at this point.");
talkEntry:addResponse("Please, keep my wife in your prayers.");
talkEntry:addResponse("The Gods have kept my wife and I safe and in good health, I only hope that they do so once more.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zhambra");
talkEntry:addResponse("Zur Zeit würde ich die Hilfe jeglicher Gottheit begrüßen.");
talkEntry:addResponse("Bitte bedenke meine Frau in Euren Gebeten.");
talkEntry:addResponse("Die Götter haben bis jetzt immer über meine Gesundheit und die meiner Frau gewacht, ich hoffe das sie es auch nocheinmal tun.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(1337, "<", 11));
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("My apologies, but I am in no mood to trade right now.");
talkEntry:addResponse("I am sorry, but I cannot trade with you at the moment. I must be caring for my wife.");
talkEntry:addResponse("I fear that I am too busy dealing with my wife at the moment.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Entschuldigt, aber ich bin nicht in der Stimmung zu Handeln.");
talkEntry:addResponse("Es tut mir leid, aber ich kann gerade keinen Handel mit euch Abschließen, icg muss nicht um meine Frau kümmern.");
talkEntry:addResponse("Ich fürchte ich bin zu beschäftigt mich um meine Frau zu kümmern, als dass ich mit Euch handeln könnte.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("I am sorry, but I do not feel much like talking at the moment.");
talkEntry:addResponse("I apologise, but my wife requires my help.");
talkEntry:addResponse("I am sorry, but I am too upset to properly engage in conversation at the moment.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Es tut mir leid, aber ich bin nicht in der Stimmung etwas zu erzählen.");
talkEntry:addResponse("Bitte entschuldigt, aber meine Frau bracht meine Hilfe.");
talkEntry:addResponse("Es tut mir leid, ich bin zu besorgt, als dass ich jetzt ein gutes Gespräch führen könnte.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Rowan");
talkEntry:addTrigger("Banius");
talkEntry:addResponse("Hm? Please, I must take care of my wife.");
talkEntry:addResponse("Forgive me, but my wife needs my care.");
talkEntry:addResponse("I am sorry but I must be looking after my wife.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Rowan");
talkEntry:addTrigger("Banius");
talkEntry:addResponse("Hm? Bitte, ich muss mich um meine Frau kümmern.");
talkEntry:addResponse("Entschuldigt, aber meine Frau braucht meine Aufmerkamkeit.");
talkEntry:addResponse("Es tut mir leid, aber ich muss mich um meine Frau kümmern.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("Hm? Please, I must take care of my wife.");
talkEntry:addResponse("Forgive me, but my wife needs my care.");
talkEntry:addResponse("I am sorry but I must be looking after my wife.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("Hm? Bitte, ich muss mich um meine Frau kümmern.");
talkEntry:addResponse("Entschuldigt, aber meine Frau braucht meine Aufmerkamkeit.");
talkEntry:addResponse("Es tut mir leid, aber ich muss mich um meine Frau kümmern.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("Hm? Please, I must take care of my wife.");
talkEntry:addResponse("Forgive me, but my wife needs my care.");
talkEntry:addResponse("I am sorry but I must be looking after my wife.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("Hm? Bitte, ich muss mich um meine Frau kümmern.");
talkEntry:addResponse("Entschuldigt, aber meine Frau braucht meine Aufmerkamkeit.");
talkEntry:addResponse("Es tut mir Leid, aber ich muss mich um meine Frau kümmern.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Hm? Please, I must take care of my wife.");
talkEntry:addResponse("Forgive me, but my wife needs my care.");
talkEntry:addResponse("I am sorry but I must be looking after my wife.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Hm? Bitte, ich muss mich um meine Frau kümmern.");
talkEntry:addResponse("Entschuldigt, aber meine Frau braucht meine Aufmerkamkeit.");
talkEntry:addResponse("Es tut mir leid, aber ich muss mich um meine Frau kümmern.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me sieht seine Frau an und lächelt schwach.", "#me glances at his wife, smiling faintly.");
talkingNPC:addCycleText("#me nickt höflich.", "#me nods politely.");
talkingNPC:addCycleText("Bitte Liebling, überanstrenge dich nicht.", "Please dear, don't go overexerting yourself.");
talkingNPC:addCycleText("Hmm...was essen wir heute Abend?", "Hmm...what to have for dinner tonight...");
talkingNPC:addCycleText("#me blickt nach draußen auf den Hof.", "#me peers out at the farm.");
talkingNPC:addCycleText("#me hebt eine Faust und unterdrückt ein Husten.", "#me raises a fist, stifling a cough.");
talkingNPC:addCycleText("#me wischt mit einem nassen Lappen üder die Stirn seiner Frau.", "#me dabs at his wife's forehead with a damp cloth.");
talkingNPC:addCycleText("#me betrachtet seine Frau und seuftzt leise.", "watches his wife, releasing a quiet sigh.");
talkingNPC:addCycleText("Also, wo bewahren wir nochmal die guten Becher auf?", "Now where do we keep the good mugs?");
talkingNPC:addCycleText("#me schließt seine Augen, er flüstert leise ein Gebet.", "#me closes his eyes, whispering a silent prayer.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(1);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Dieser NPC ist Rowan Banius der Bauer.", "This NPC is Rowan Banius the farmer.");
mainNPC:setUseMessage("Fasst mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut verwirrt.", "#me looks around confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 457);
mainNPC:setEquipment(11, 0);
mainNPC:setEquipment(5, 271);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 0);
mainNPC:setEquipment(9, 2113);
mainNPC:setEquipment(10, 53);
mainNPC:setAutoIntroduceMode(true);

mainNPC:initDone();
end;

function receiveText(npcChar, texttype, message, speaker) mainNPC:receiveText(npcChar, speaker, message); end;
function nextCycle(npcChar) mainNPC:nextCycle(npcChar); end;
function lookAtNpc(npcChar, char, mode) mainNPC:lookAt(npcChar, char, mode); end;
function useNPC(npcChar, char) mainNPC:use(npcChar, char); end;
initNpc();
initNpc = nil;
-- END
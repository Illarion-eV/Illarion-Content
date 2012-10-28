--------------------------------------------------------------------------------
-- NPC Name: Fronita Emery                                           Runewick --
-- NPC Job:  Trader, glassblower                                              --
--                                                                            --
-- NPC Race: dwarf                      NPC Position:  893, 799, 1            --
-- NPC Sex:  female                     NPC Direction: east                   --
--                                                                            --
-- Authors:  Faladron                                                         --
--           Estralis                                                         --
--                                                                            --
-- Last parsing: October 28, 2012                        easyNPC Parser v1.21 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (1, 893, 799, 1, 2, 'Fronita Emery', 'npc.fronita_emery', 1, 9, 0, 204, 144, 2, 213, 165, 123);
---]]

require("npc.base.basic")
require("npc.base.condition.chance")
require("npc.base.condition.language")
require("npc.base.condition.quest")
require("npc.base.consequence.inform")
require("npc.base.consequence.quest")
require("npc.base.consequence.talkstate")
require("npc.base.consequence.trade")
require("npc.base.talk")
require("npc.base.trade")
module("npc.fronita_emery", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
local tradingNPC = npc.base.trade.tradeNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("sell");
talkEntry:addTrigger("buy");
talkEntry:addTrigger("wares");
talkEntry:addTrigger("price");
talkEntry:addTrigger("trade");
talkEntry:addTrigger("purchase");
talkEntry:addResponse("Ah, so you are interested in my wares.");
talkEntry:addResponse("Take your time to look around.");
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("kauf");
talkEntry:addTrigger("waren");
talkEntry:addTrigger("preis");
talkEntry:addTrigger("Handel");
talkEntry:addTrigger("veräußer");
talkEntry:addTrigger("erwerb");
talkEntry:addResponse("Ah, dann interessiert Ihr Euch also für meine Waren.");
talkEntry:addResponse("Schaut Euch ruhig in Ruhe um.");
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Fronita Emery the merchant. Keywords: buy, sell, trade, glas, wares, Runewick."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist die Händlerin Fronita Emery. Schlüsselwörter: Handel, kaufe, verkaufe, Glas, Waren, Runewick."));
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
talkEntry:addResponse("May Findari and Elara bless you! Do you want to have a look at my wares?");
talkEntry:addResponse("Welcome. If you're looking for goods made of glass I can definately help you out.");
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
talkEntry:addResponse("Findari und Elara mit euch! Kann ich euch für meine Waren begeistern?");
talkEntry:addResponse("Willkommen. Wenn ihr Glaswaren sucht seid ihr hier absolut richtig.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("May Findari and Elara bless you! Do you want to have a look at my wares?");
talkEntry:addResponse("Welcome. If you're looking for goods made of glass I can definately help you out.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Findari und Elara mit euch! Kann ich euch für meine Waren begeistern?");
talkEntry:addResponse("Willkommen. Wenn ihr Glaswaren sucht seid ihr hier absolut richtig.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Fair winds and clear sight to you!");
talkEntry:addResponse("May Elara enlighten your path.");
talkEntry:addResponse("Farewell. Don't forget about me, as glass is pretty frail!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Günstige Winde und klare Sicht!");
talkEntry:addResponse("Möge Elara euren Pfad erleuchten.");
talkEntry:addResponse("Auf bald. Und vergesst mich nicht, Glas ist zerbrechlich!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Fair winds and clear sight to you!");
talkEntry:addResponse("May Elara enlighten your path.");
talkEntry:addResponse("Farewell. Don't forget about me, as glass is pretty frail!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Günstige Winde und klare Sicht!");
talkEntry:addResponse("Möge Elara euren Pfad erleuchten.");
talkEntry:addResponse("Auf bald. Und vergesst mich nicht, Glas ist zerbrechlich!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("I am very well. Look at this bottle here. If you hold it against the light it sparkles in every color imaginable.");
talkEntry:addResponse("I am a little short of breath and there's blisters from all the glass I polished, but that's to expect from my work.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befinden");
talkEntry:addResponse("Mir geht es ausgezeichnet. Sehr euch diese Flasche hier an. Hält man sie gegen das Licht funkelt sie in allen Farben.");
talkEntry:addResponse("Ich bin etwas außer Atem und habe Schwielen vom Glas polieren, aber das ist Berufsrisiko.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("I'm Fronita. I am a glassblower and I sell my wares here.");
talkEntry:addResponse("My name? Fronita Emery, I deal in glass goods.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ihr name");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Ich bin die Fronita. Ich bin Glasbläserin und verkaufe meine Waren hier.");
talkEntry:addResponse("Mein Name? Fronita Emery, ich handle mit Glaswaren.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 9));
talkEntry:addTrigger("message");
talkEntry:addTrigger("news");
talkEntry:addTrigger("letter");
talkEntry:addTrigger("scroll");
talkEntry:addTrigger("parchment");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest status] The Reminder IV: You deliver the message from Groktan Flintsplit to Fronita Emery."));
talkEntry:addResponse("#me shrieks as she reads the scroll: 'I thought I'd be save here from the Don! I'm ruined if I have to pay what he demands.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(107, "=", 10));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 9));
talkEntry:addTrigger("nachricht");
talkEntry:addTrigger("brief");
talkEntry:addTrigger("Botschaft");
talkEntry:addTrigger("Schriftrolle");
talkEntry:addTrigger("Pergament");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Queststatus] Die Erinnerung IV: Du überbringst Fronita Emery die Nachricht von Groktan Flintsplit."));
talkEntry:addResponse("#me erschrickt als sie die Schriftrolle durchließt: 'Ich dachte, ich wäre hier sicher vor dem Don! Ich bin ruiniert, wenn ich ihm diese Summe zahle.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(107, "=", 10));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 9));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Groktan");
talkEntry:addTrigger("Flintsplit");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest status] The Reminder IV: You deliver the message from Groktan Flintsplit to Fronita Emery."));
talkEntry:addResponse("#me shrieks as she reads the scroll: 'I thought I'd be save here from the Don! I'm ruined if I have to pay what he demands.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(107, "=", 10));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 9));
talkEntry:addTrigger("Groktan");
talkEntry:addTrigger("Flintsplit");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Queststatus] Die Erinnerung IV: Du überbringst Fronita Emery die Nachricht von Groktan Flintsplit."));
talkEntry:addResponse("#me erschrickt als sie die Schriftrolle durchließt: 'Ich dachte, ich wäre hier sicher vor dem Don! Ich bin ruiniert, wenn ich ihm diese Summe zahle.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(107, "=", 10));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("I do not issue any quests, sorry.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Ich vergebe keine Questen, tut mir leid.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("I do not issue any quests, sorry.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Ich vergebe keine Questen, tut mir leid.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("Well, why should I stand around here between all this glass? I'm selling it!");
talkEntry:addResponse("I'm a glassblower and I sell my wares here");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Nun, warum sollte ich hier zwischen diesen ganzen Glaswaren stehen? Ich verkaufe sie!");
talkEntry:addResponse("Ich bin Glasbläserin und verkaufe hier meine Waren.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("Well, why should I stand around here between all this glass? I'm selling it!");
talkEntry:addResponse("I'm a glassblower and I sell my wares here");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Nun, warum sollte ich hier zwischen diesen ganzen Glaswaren stehen? Ich verkaufe sie!");
talkEntry:addResponse("Ich bin Glasbläserin und verkaufe hier meine Waren.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("I'm just a humble crafter. Ask a scholar about that.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Ich bin nur eine einfache Händlerin. Fragt doch einen Gelehrten über sowas.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("Nice to meet you! But don't expect a discount just because you told me your name.");
talkEntry:addResponse("What a funny name. Somehow it gives away that you're not from around here.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Schön dich kennenzulernen! Erwarte aber keinen Preisnachlass deswegen.");
talkEntry:addResponse("Was für ein lustiger Name. Man merkt irgendwie, dass du nicht von hier bist.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("glass");
talkEntry:addResponse("To work with glass is challenging. It becomes frail very fast");
talkEntry:addResponse("The slender hands of a lady like myself are just right for that kind of work, har har.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("sand");
talkEntry:addResponse("You may think there's enough sand in the desert, still Cadomyr troubles the supply.");
talkEntry:addResponse("Aye, lots of sand in the west. But Cadomyr guards it tightly. That's a problem.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rune magic");
talkEntry:addResponse("You have to ask another dwarf about that.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("magic");
talkEntry:addTrigger("mage");
talkEntry:addTrigger("sorcer");
talkEntry:addTrigger("spell");
talkEntry:addResponse("Ach, sometimes I twitch when spells fly about, but you get used to that.");
talkEntry:addResponse("There's dwarven rune magic. So why should magic bother me?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("problem");
talkEntry:addTrigger("trouble");
talkEntry:addTrigger("supply");
talkEntry:addResponse("Cadomyr checks tightly how much sieved sand leaves the desert. Not enough for me to work properly, I say!");
talkEntry:addResponse("Cadomyr is mocking us. If they allow sand to be exported it's usualy wet and hardly useable. ");
talkEntry:addResponse("'I reign over every grain of sand!' says the queen. You can be overzealous too, you know.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Glas");
talkEntry:addResponse("Mit Glas zu arbeiten ist eine Herausforderung. Es wird schnell sehr zerbrechlich.");
talkEntry:addResponse("Zarte Frauenhände wie meine sind genau richtig für diese Arbeit, har har.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sand");
talkEntry:addResponse("Man möchte meinen Sand gäbs in der Wüste genug, trotzdem macht Cadomyr immer Ärger.");
talkEntry:addResponse("Aye im Westen gibts viel davon. Aber da sitzt Cadomyr wachsam drauf. Das ist ein Problem.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runenmagie");
talkEntry:addResponse("Da musst du einen Zwerg fragen der sich genauer damit auskennt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Magie");
talkEntry:addTrigger("Zauber");
talkEntry:addResponse("Ach, ich zuck noch ein wenig wenn die Zaubersprüche fliegen, aber man gewöhnt sich dran.");
talkEntry:addResponse("Wir Zwerge kennen ja auch die Runenmagie. Also warum soll mich Magie stören?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Problem");
talkEntry:addTrigger("Ärger");
talkEntry:addResponse("Cadomyr passt genau auf, wieviel feiner Sand aus der Wüste entnommen wird. Nicht genug für anständige Arbeit sag ich!");
talkEntry:addResponse("Cadomyr ärgert uns. Wenn sie es mal erlauben und Sand nach Runewick kommt ist er feucht und fast unbrauchbar.");
talkEntry:addResponse("'Ich herrsche über jedes Sandkorn!' sagt die Königin. Man kann auch übereifrig sein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("LOCATION");
talkEntry:addResponse("You're in Runewick, enjoy the marvellous sight!");
talkEntry:addResponse("#me smirks and winks: 'I'm taking a wild guess here, but you might be on the market.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ORT");
talkEntry:addResponse("Du bist in Runewick, der Stadt mit der schönsten Aussicht!");
talkEntry:addResponse("#me schmunzelt und zwinkert: 'Wenn ichs nicht besser wüsste, würd ich sagen du stehst am Markt.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("trader");
talkEntry:addTrigger("merchant");
talkEntry:addTrigger("collegue");
talkEntry:addTrigger("vendor");
talkEntry:addTrigger("market");
talkEntry:addResponse("Speak right up. Just ask around and you'll find the wares you're looking for.");
talkEntry:addResponse("I am sure it won't be hard for you to find the other merchants of Runewick.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("händler");
talkEntry:addTrigger("kollege");
talkEntry:addTrigger("höker");
talkEntry:addTrigger("markt");
talkEntry:addResponse("Seid nur nicht auf den Mund gefallen. Fragt und ihr findet was ihr an Waren sucht.");
talkEntry:addResponse("Es wird euch sicher nicht schwer fallen, die anderen Händler in Runewick zu finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addResponse("It's a great comfort to have such a smart man rule over Runewick.");
talkEntry:addResponse("I have given him wine glasses as a present. Enough for many guests, eventhough he never has guests.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Ich finde es beruhigdass so ein schlauer Mann über Runewick bestimmt.");
talkEntry:addResponse("Ich habe ihm Gläser zum Geschenk gemacht. Genug für viele Gäste, auch wenn er nie jemanden zu sich einlädt.");
talkEntry:addConsequence(npc.base.consequence.talkstate.talkstate("end"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("It's a great comfort to have such a smart man rule over Runewick.");
talkEntry:addResponse("I have given him wine glasses as a present. Enough for many guests, eventhough he never has guests.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Ich finde es beruhigdass so ein schlauer Mann über Runewick bestimmt.");
talkEntry:addResponse("Ich habe ihm Gläser zum Geschenk gemacht. Genug für viele Gäste, auch wenn er nie jemanden zu sich einlädt.");
talkEntry:addConsequence(npc.base.consequence.talkstate.talkstate("end"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("What a wonderful town! You take some steps away from the furnace and the cool sea air refreshes you.");
talkEntry:addResponse("We have the greenest meadows, the tastiest food and the best beer here in Rnewick!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Eine wunderbare Stadt! Man tritt einige Schritte weg vom Schmelzofen und die kühle Seeluft erfrischt einen.");
talkEntry:addResponse("Wir haben die grünsten Wiesen, das leckerste Essen und das beste Bier hier in Runewick!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Imagine a little goblin with the beard of a dwarf. That's him.");
talkEntry:addResponse("Even if I admire archmage Morgan, I don't understand why he doesn't do anything against this fiend!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Stellt euch einen kleinen Goblin mit Zwergenbart vor. Das ist er.");
talkEntry:addResponse("Auch wenn ich Erzmagier Morgan sonst bewundere, warum er nichts gegen diesen Halunken unternimmt ist mir ein Rätsel.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Galmair, bah! They don't need glass, they swig straight from the water hole!");
talkEntry:addResponse("If you're robbed there and yell for help, only more people come to split the loot!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Galmair, pah! Die brauchen kein Glas, die saufen aus der Tränke!");
talkEntry:addResponse("Wird man dort ausgeraubt und ruft um Hilfe kommen nur mehr Leute um sich die Beute zu teilen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Queen");
talkEntry:addResponse("They say she can tell glass jewelry and real jewelry apart. By their smell!");
talkEntry:addResponse("Two big childhood dreams combined: Queen of her own enormous sandbox.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königin");
talkEntry:addResponse("Man sagt sie könne Glasschmuck von echtem Schmuck unterscheiden. Am Geruch!");
talkEntry:addResponse("Zwei große Kindheitsträume vereint: Königin spielen in einem riesen Sandkasten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("They say she can tell glass jewelry and real jewelry apart. By their smell!");
talkEntry:addResponse("Two big childhood dreams combined: Queen of her own enormous sandbox.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Man sagt sie könne Glasschmuck von echtem Schmuck unterscheiden. Am Geruch!");
talkEntry:addResponse("Zwei große Kindheitsträume vereint: Königin spielen in einem riesen Sandkasten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("I have to admit, there's better glassblowers than me there. But what else do you expect with all the sand there?");
talkEntry:addResponse("I don't like them. There's always troubles everytime I try to gather sand from the dessert.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Leider muss ich sagen, dort gibt es bessere Glasbläser als mich. Aber kein Wunder! Bei all dem Sand.");
talkEntry:addResponse("Ich mag sie nicht. Es gibt immer wieder Probleme wenn ich Sand aus der Wüste holen will.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("albar");
talkEntry:addResponse("I'm glad I don't have to live there. They certainly wouldn't have let me learn glassblowing, as I am a woman.");
talkEntry:addResponse("Brutal and agressive people, all of their culture is based on war and opression.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("Wie froh bin ich nicht dort zu leben. Als Frau hätte ich wohl nie Glasblasen lernen dürfen.");
talkEntry:addResponse("Ein grobes aggressives Volk. ihre ganze Kultur lebt von Krieg und Unterdrückung.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addResponse("Ugh! Let's talk about more pleasant things. My stock of wares for example.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("Pfui. Lass uns doch über etwas Schöneres reden. Mein Warenangebot zum Beispiel.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Once I've earned enough money I want to visit Salkamar.");
talkEntry:addResponse("I once heard that they have colourful windows there with pictures made of glas that tell stories.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Wenn der Handel genug Geld abgeworfen hat möchte ich Salkamar einmal besuchen.");
talkEntry:addResponse("Es heißt, dort gibt es bunte Fenster mit Bildern aus Glas die Geschichten erzählen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("Gods? Findari and Elara bless my life.");
talkEntry:addResponse("Elara clears my mind like crystal glass and Findari fans the fire in my heart.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Götter? Findari und Elara behüten mein Leben.");
talkEntry:addResponse("Elara klärt meinen Geist wie Kristallglas und Findari schürt das Feuer in meinem Herzen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Adron");
talkEntry:addResponse("Aye, that's true. But I prefer Elara and Findari.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Adron");
talkEntry:addResponse("Aye, richtig. Mir sagen Elara und Findari aber mehr zu.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addResponse("Aye, that's true. But I prefer Elara and Findari.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addResponse("Aye, richtig. Mir sagen Elara und Findari aber mehr zu.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cherga");
talkEntry:addResponse("Aye, that's true. But I prefer Elara and Findari.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addResponse("Aye, richtig. Mir sagen Elara und Findari aber mehr zu.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elara");
talkEntry:addResponse("You have a lot of time to think about the important things of life when you stare at the furnace..");
talkEntry:addResponse("My faith in Elara gives me peace of mind. Waiting for the glass to cool off is a form of meditation for me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elara");
talkEntry:addResponse("Bis das Glas schmilzt hat man viel Zeit im Schein der Esse über das wirklich wichtige nachzudenken.");
talkEntry:addResponse("Der Glaube an Elara gibt mir Frieden. Ich freue mich auf das stille Warten wenn das Glas kühlt, es klärt den Geist.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Eldan");
talkEntry:addResponse("Aye, that's true. But I prefer Elara and Findari.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eldan");
talkEntry:addResponse("Aye, richtig. Mir sagen Elara und Findari aber mehr zu.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Findari");
talkEntry:addResponse("If you literally need air to survive, like me, it is obvious who you should be grateful to.");
talkEntry:addResponse("Findari guides my hand on the bellows, so the fire never dies.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Findari");
talkEntry:addResponse("Wenn man so wie ich Luft buchstäblich zum Leben braucht, ist es klar wem man dafür danken sollte.");
talkEntry:addResponse("Findari lenkt meine Hand am Blasebalg damit das Feuer nicht stirbt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("Aye, that's true. But I prefer Elara and Findari.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("Aye, richtig. Mir sagen Elara und Findari aber mehr zu.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addResponse("Aye, that's true. But I prefer Elara and Findari.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addResponse("Aye, richtig. Mir sagen Elara und Findari aber mehr zu.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Moshran");
talkEntry:addResponse("Who knows what he would've become, had he entrusted himself to Elara.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Moshran");
talkEntry:addResponse("Wer weiß, hätte er sich Elara anvertraut wäre er vielleicht nicht so geworden wie er ist.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addTrigger("Nargùn");
talkEntry:addResponse("Aye, that's true. But I prefer Elara and Findari.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addTrigger("Nargùn");
talkEntry:addResponse("Aye, richtig. Mir sagen Elara und Findari aber mehr zu.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("Aye, that's true. But I prefer Elara and Findari.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("Aye, richtig. Mir sagen Elara und Findari aber mehr zu.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("Aye, that's true. But I prefer Elara and Findari.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("Aye, richtig. Mir sagen Elara und Findari aber mehr zu.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("Aye, that's true. But I prefer Elara and Findari.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("Aye, richtig. Mir sagen Elara und Findari aber mehr zu.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("Aye, that's true. But I prefer Elara and Findari.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("Aye, richtig. Mir sagen Elara und Findari aber mehr zu.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("Aye, that's true. But I prefer Elara and Findari.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("Aye, richtig. Mir sagen Elara und Findari aber mehr zu.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Zhambra");
talkEntry:addResponse("Aye, that's true. But I prefer Elara and Findari.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zhambra");
talkEntry:addResponse("Aye, richtig. Mir sagen Elara und Findari aber mehr zu.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("You will be amazed by my stock of glass related wares.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Mein Angebot an Glaswaren wird euch begeistern.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("I'd love to live in a house of glass but alas, the summer heat would be unbearable inside.");
talkEntry:addResponse("Metal corrodes away, but glass is here to stay.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Wäre die Hitze im Sommer nicht unerträglich, ich würde in einem Haus aus Glas wohnen.");
talkEntry:addResponse("Metall rostet, aber Glas ist zeitlos.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Fronita");
talkEntry:addTrigger("Emery");
talkEntry:addResponse("...and did I mention I sell glass goods?");
talkEntry:addResponse("Buy something or get...");
talkEntry:addResponse("Fronita Emery, at your service.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Fronita");
talkEntry:addTrigger("Emery");
talkEntry:addResponse("...und erwähnte ich, dass ich Glaswaren verkaufe?");
talkEntry:addResponse("Kauf etwas oder...");
talkEntry:addResponse("Fronita Emery, stets zu Diensten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("Yes. True. Absolutely. And now buy my stuff!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("Ja. Richtig. Aber wirklich. Und jetzt kauf was!");
talkEntry:addResponse("Sehr schön. Jetzt einigen wir uns noch was du kaufst.");
talkEntry:addResponse("Ich weiß, wunderbar nicht?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("No? My heart just shattered like a piece of glass.");
talkEntry:addResponse("Well whatever, bah!");
talkEntry:addResponse("You're stealing my time!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("Nein? Mein Herz ist grad wie ein Stück Glas zerbrochen.");
talkEntry:addResponse("Na dann halt nicht, pah!");
talkEntry:addResponse("Du stiehlst nur meine Zeit!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Listen, I don't want to be rude. Either you buy something or you leave, aye?");
talkEntry:addResponse("If you go on rambling about like that you'll spoil my buisiness.");
talkEntry:addResponse("Yes. Aye. Absolutely. And now buy my stuff!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Hör mal, ich will nicht unhöflich sein. Aber entweder kaufste was oder verschwindest, aye?");
talkEntry:addResponse("Wenn du hier weiter so rumbrabbelst vermiest du mir das Geschäft.");
talkEntry:addResponse("Ja. Aye. Absolut. Und jetzt kauf mir was ab!");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me poliert ein fein gearbeitetes Weinglas.", "#me polishes a well crafted wine glass.");
talkingNPC:addCycleText("Genießt die feinen Getränke Runewicks in Runewicks besten Gläsern.", "Enjoy the best of Runewicks beverages in Runewicks best glasses.");
talkingNPC:addCycleText("In meinen Glaswaren funkelt die Ewigkeit!", "Eternity sparkles in my glass wares!");
talkingNPC:addCycleText("#me spielt mit ein paar Glasmurmeln.", "#me plays with some glass pebbles.");
talkingNPC:addCycleText("Kauft euren Bierkrug bei mir, ich kenn mich damit aus.", "Buy your beer mugs here, trust my expertise about them.");
talkingNPC:addCycleText("Feinstes Glas aus kundiger Zwergenhand!", "Finest glass made by knowledgable dwarven hands!");
talkingNPC:addCycleText("Seht was ihr trinkt! Benutzt meine Gläser anstatt Holzbechern.", "See what you drink! Use my glasses instead of wooden mugs.");
talkingNPC:addCycleText("Beste Glaswaren!", "Best glas goods!");
talkingNPC:addCycleText("Ich verkaufe Träume aus Glas und Kristall!", "I sell dreams of glass and crystal!");
talkingNPC:addCycleText("Shh! Ich habe ein Sonderangebot!", "Shh! I have special offers!");
tradingNPC:addItem(npc.base.trade.tradeNPCItem(311,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(312,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(75,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(164,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(292,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(315,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1317,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1908,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2055,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2457,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2498,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(41,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(314,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(316,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(726,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(310,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(374,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(390,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(391,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1858,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2183,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2184,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2185,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2717,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2719,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2738,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2744,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2760,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(311,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(312,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(75,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(164,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(292,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(315,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1317,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1908,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2055,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2457,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2498,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(41,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(314,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(316,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(726,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(310,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(374,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(390,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(391,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1858,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2183,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2184,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2185,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2717,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2719,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2738,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2744,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2760,"buySecondary"));
tradingNPC:addNotEnoughMoneyMsg("Oh, ich fürchte Ihr könnt Euch das nicht leisten.", "Oh, I fear, you can not afford that.");
tradingNPC:addDialogClosedMsg("Vielen Dank, beehrt mich bald wieder!", "Thank you, please come again!");
tradingNPC:addDialogClosedNoTradeMsg("Auf Bald!", "Farewell!");
tradingNPC:addWrongItemMsg("Das kaufe ich nicht.", "I'm not buying this.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(2);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Dieser NPC ist die Händlerin Fronita Emery.", "This NPC is Fronita Emery the merchant.");
mainNPC:setUseMessage("Fass mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut dich verwirrt an.", "#me looks at you confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 806);
mainNPC:setEquipment(11, 0);
mainNPC:setEquipment(5, 0);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 48);
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
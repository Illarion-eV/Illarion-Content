--------------------------------------------------------------------------------
-- NPC Name: Jacobus                                                  Cadomyr --
-- NPC Job:  Jeweller                                                         --
--                                                                            --
-- NPC Race: human                      NPC Position:  134, 590, 0            --
-- NPC Sex:  male                       NPC Direction: west                   --
--                                                                            --
-- Author:   Estralis Seborian                                                --
--                                                       easyNPC Parser v1.21 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (0, 134, 590, 0, 6, 'Jacobus', 'npc.jacobus', 0, 1, 5, 158, 66, 6, 183, 129, 87);
---]]

require("npc.base.basic")
require("npc.base.condition.language")
require("npc.base.consequence.inform")
require("npc.base.consequence.trade")
require("npc.base.talk")
require("npc.base.trade")
module("npc.jacobus", package.seeall)

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
talkEntry:addResponse("I sell any kind of jewellery.");
talkEntry:addResponse("Things made of gold, of copper, of gems... What do you need?");
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
talkEntry:addResponse("Ich handele mit allerlei Juwelen.");
talkEntry:addResponse("Dinge aus Gold, aus Kupfer, aus Edelsteinen... was braucht ihr?");
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is the jeweller Jacobus. Keywords: buy, sell, trade, Hello, jewellery."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist der Juwellier Jacobus. Schlüsselwörter: kaufe, verkaufe, Handel, Hallo, Juwelen."));
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
talkEntry:addResponse("Welcome to Cadomyr.");
talkEntry:addResponse("Be greeted.");
talkEntry:addResponse("Hello, do you need a ruby necklace?");
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
talkEntry:addResponse("Willkommen in Cadomyr.");
talkEntry:addResponse("Seid gegrüßt.");
talkEntry:addResponse("Hallo, braucht ihr eine Rubinkette?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Welcome to Cadomyr.");
talkEntry:addResponse("Be greeted.");
talkEntry:addResponse("Hello, do you need a ruby necklace?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Willkommen in Cadomyr.");
talkEntry:addResponse("Seid gegrüßt.");
talkEntry:addResponse("Hallo, braucht ihr eine Rubinkette?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("I hope you'll recommend my goods.");
talkEntry:addResponse("Good bye.");
talkEntry:addResponse("Have a nice day.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Ich hoffe, ihr werdet meine Waren weiterempfehlen.");
talkEntry:addResponse("Auf wiedersehen.");
talkEntry:addResponse("Einen schönen Tag noch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("I hope you'll recommend my goods.");
talkEntry:addResponse("Good bye.");
talkEntry:addResponse("Have a nice day.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Ich hoffe, ihr werdet meine Waren weiterempfehlen.");
talkEntry:addResponse("Auf wiedersehen.");
talkEntry:addResponse("Einen schönen Tag noch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("I feel like selling gems.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addResponse("Mir ist danach, Edelsteine zu verkaufen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("I am Jacobus, the jeweller.");
talkEntry:addResponse("Jacobus.");
talkEntry:addResponse("Jacobus, so do not call me Jack.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ihr name");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Ich bin Jacobus der Juwelier.");
talkEntry:addResponse("Jacobus.");
talkEntry:addResponse("Jacobus. Und nennt mich nicht Jack.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("I don't have a quest for you, sorry.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Ich habe keinen Auftrag für dich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("I don't have a quest for you, sorry.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Ich habe keinen Auftrag für dich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("I am a jeweller. I also search for gems, but it is a hard job.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Ich bin ein Juwellier, manchmal suche ich auch nach Edelsteinen. Aber das ist ein Knochenjob.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("I am a jeweller. I also search for gems, but it is a hard job.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Ich bin ein Juwellier, manchmal suche ich auch nach Edelsteinen. Aber das ist ein Knochenjob.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Gobaith was said to be a gem in the ocean. Now it is... a gem in the water.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Man sagt, Gobaith war ein Edelstein im Ozean. Nun ist es ein... Edelstein im Wasser.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("Good to know, do you want a ring?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Gut zu wissen, benötigt ihr einen Ring?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Thief");
talkEntry:addResponse("Thieves are a horrible scourge of society.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Dieb");
talkEntry:addResponse("Diebe sind eine schreckliche Plage.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Gold");
talkEntry:addResponse("Gold is a fascinating material. Although it is soft, it still does not corrode in a thousand years.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gold");
talkEntry:addResponse("Gold ist ein faszinierendes Material. Es ist zwar recht weich, aber es verrottet in tausend Jahren nicht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("jewel");
talkEntry:addResponse("My jewels are the best you can get within a thousand miles and I have never travelled beyond that.");
talkEntry:addResponse("I can sell you any kind of jewels, and if you have any gems, I'll gladly purchase them.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Juwel");
talkEntry:addResponse("Meine Juwelen sind die besten, die man innerhalb von tausend Meilen bekommen kann. Und ich war noch nie weiter weg.");
talkEntry:addResponse("Ich kann euch allerlei Juwelen anbieten. Wenn ihr Edelsteine habt, so würde ich sie gerne erwerben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("trader");
talkEntry:addTrigger("merchant");
talkEntry:addTrigger("collegue");
talkEntry:addTrigger("vendor");
talkEntry:addTrigger("market");
talkEntry:addResponse("Fish, glass goods, swords - everything you desire you can find here on the marketplace.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("händler");
talkEntry:addTrigger("kollege");
talkEntry:addTrigger("höker");
talkEntry:addTrigger("markt");
talkEntry:addResponse("Fische, Glaswaren, Schwerter - alles was das Herz begehrt kann man hier auf dem Marktplatz finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addResponse("The Archmage hides behind his books instead of ruling Runewick. I am so glad we have our queen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Der Erzmagier versteckt sich lieber hinter seinen Büchern als Runewick zu führen. Ich bin so glücklich, dass wir unsere Königin haben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("The Archmage hides behind his books instead of ruling Runewick. I am so glad we have our queen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Der Erzmagier versteckt sich lieber hinter seinen Büchern als Runewick zu führen. Ich bin so glücklich, dass wir unsere Königin haben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Runewick is far to the east. You have to walk through a dense forest.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Runewick ist weit im Osten. Ihr müßt durch einen tiefen Wald gehen, um dorthin zu gelangen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("I once had to craft a ring for the Don. It was such a horrifying experience to give the ring to this filthy man.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Ich musste einst einen Ring für den Don fertigen. Es war ein schreckliches Erlebnis, den Ring diesem dreckigem Kerl zu überlassen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Galmair is far to the north, but better don't go there with too much money.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Galmair ist weit im Norden, aber nehmt besser nicht zuviel Geld mit, wenn ihr dorthin geht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Queen");
talkEntry:addResponse("All of us like queen Rosaline, she rules Cadomyr like nobody else could.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königin");
talkEntry:addResponse("Jederman liebt die Königin Rosaline, sie regiert Cadomyr wie es niemand sonst könnte.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("All of us like queen Rosaline, she rules Cadomyr like nobody else could.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Jederman liebt die Königin Rosaline, sie regiert Cadomyr wie es niemand sonst könnte.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("This is our home: Cadomyr. Do you smell the sea? Do you feel the honour?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Dies ist unsere Heimat: Cadomyr. Riecht ihr die See? Spürt ihr das Ehrgefühl?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("albar");
talkEntry:addResponse("I hear only the best about Albar, but I have never even been there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("Ich höre nur das Beste über Albar, aber ich war noch nie selbst dort.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addResponse("Something is wrong in Gynk. If they only steal from each other, how do you imagine they replace broken things?");
talkEntry:addResponse("Gynk is a filthy place.");
talkEntry:addResponse("If you go to Gynk, well, do not expect to return with any gold.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("Irgendwas ist doch falsch in Gynk. Wenn die nur voneinander stehlen, wie ersetzen sie dann Zerbrochenes?");
talkEntry:addResponse("Gynk ist ein dreckiger Ort.");
talkEntry:addResponse("Wenn ihr nach Gynk geht, nun, denkt nicht, ihr kommt mit Gold zurück.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("salkama");
talkEntry:addResponse("I hear only bad things about Salkamar, but I have never been there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Ich höre nur schlimme Dinge über Salkamar, aber ich war noch nie selbst dort.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("Why don't you ask me about Zhambra? Might result in a special offer for you!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Warum fragt ihr mich nicht nach Zhambra? Ich hätte da vielleicht ein Sonderangebot für euch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("Oh, Ronagan! Well, he may just like gems as much as I do and he guarantees that people will buy new ones... still, I cannot honour a god who promotes crimes.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("Oh, Ronagan! Nun, er mag Edelsteine genauso gerne wie ich und er sorgt dafür, dass die Leute auch immerwieder neue kaufen... dennoch kann ich keinem Gott huldigen, der Diebstahl fördert.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Zhambra");
talkEntry:addResponse("Zhambra is the god of friendship, and what token is more suitable to seal a friendship than a ring. I have a special offer for you...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zhambra");
talkEntry:addResponse("Zhambra ist der Gott der Freundschaft. Und was ist besser geeignet, um Freundschaft zu besiegeln, als ein Ring? Ich hätte da gerade einen im Angebot...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("I cannot tell you any interesting stories, sorry.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Ich habe keine interessanten Geschichten zu erzählen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Jacobus");
talkEntry:addResponse("Jacobus' jewellery is the best from here to Salkamar!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Jacobus");
talkEntry:addResponse("Die Geschmeide von Jakobus sind die besten von hier bis Salkamar!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("Yes?");
talkEntry:addResponse("Indeed.");
talkEntry:addResponse("Interesting.");
talkEntry:addResponse("Huh?");
talkEntry:addResponse("But why?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("Ja?");
talkEntry:addResponse("In der Tat.");
talkEntry:addResponse("Interessant.");
talkEntry:addResponse("Huh?");
talkEntry:addResponse("Aber wieso?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("Not?");
talkEntry:addResponse("How comes?");
talkEntry:addResponse("But why not?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("Nicht?");
talkEntry:addResponse("Warum das?");
talkEntry:addResponse("Aber warum nicht?");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("Feinste Juwelen!", "Finest jewellery!");
talkingNPC:addCycleText("Habt ihr eure Frau enttäuscht? Kauft ihr einen Diamantring!", "Have you upset your wife? Buy her a diamond ring!");
talkingNPC:addCycleText("Diamanten sind der beste Freund des Mannes.", "Diamonds are a man's best friend.");
talkingNPC:addCycleText("Funkelnde Edelsteine im Angebot!", "Sparkling gem stones on special offer!");
talkingNPC:addCycleText("Goldener Schmuck, genau das Richtige für einen Damenhals.", "Gold jewellery, just the right thing for a maiden's neck.");
talkingNPC:addCycleText("Braucht ihr ein besonderes Geschenk? Eine Kette soll es sein!", "Need a special gift? A necklace it should be!");
talkingNPC:addCycleText("Ein Ring sie zu finden, ein Ring sie ins Licht zu treiben...", "One Ring to bring them all and in the light bind them.");
talkingNPC:addCycleText("Ein Edelstein hält ein Leben lang.", "A gem stone lasts for a lifetime.");
talkingNPC:addCycleText("Goldringe mit Inschriften und magischen Kräften für wenige Silberstücke!", "Gold rings with inscriptions and magical powers for a few silver coins!");
talkingNPC:addCycleText("Habt ihr Edelsteine?", "Do you have gem stones?");
tradingNPC:addItem(npc.base.trade.tradeNPCItem(122,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(21,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(22,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(234,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2534,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2536,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(446,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(447,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(448,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(449,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(450,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(451,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(452,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(45,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(46,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(197,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(198,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(283,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(284,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(285,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(224,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(225,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(336,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(465,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(62,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(67,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(71,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(79,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(82,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(83,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(222,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(68,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(235,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(277,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(278,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(279,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(280,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(281,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(282,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(92,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(393,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(397,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(399,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1001,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1840,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2031,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(24,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2763,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2140,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(251,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(252,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(253,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(254,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(255,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(256,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(257,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(122,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(21,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(22,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(234,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2534,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2536,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(446,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(447,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(448,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(449,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(450,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(451,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(452,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(45,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(46,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(197,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(198,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(283,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(284,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(285,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(224,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(225,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(336,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(465,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(62,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(67,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(71,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(79,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(82,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(83,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(222,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(68,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(235,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(277,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(278,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(279,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(280,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(281,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(282,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(92,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(393,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(397,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(399,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1001,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1840,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2031,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(24,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2763,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2140,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(251,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(252,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(253,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(254,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(255,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(256,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(257,"buySecondary"));
tradingNPC:addNotEnoughMoneyMsg("Oh, ich fürchte Ihr könnt Euch das nicht leisten.", "Oh, I fear, you can not afford that.");
tradingNPC:addDialogClosedMsg("Vielen Dank, beehrt mich bald wieder!", "Thank you, please come again!");
tradingNPC:addDialogClosedNoTradeMsg("Auf Bald!", "Farewell!");
tradingNPC:addWrongItemMsg("Das kaufe ich nicht.", "I'm not buying this.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(1);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Dieser NPC ist der Juwellier Jacobus.", "This NPC is the jeweller Jacobus.");
mainNPC:setUseMessage("Fass mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut dich verwirrt an.", "#me looks at you confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 814);
mainNPC:setEquipment(11, 195);
mainNPC:setEquipment(5, 0);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 2295);
mainNPC:setEquipment(9, 821);
mainNPC:setEquipment(10, 771);
mainNPC:setAutoIntroduceMode(true);

mainNPC:initDone();
end;

function receiveText(npcChar, texttype, message, speaker) mainNPC:receiveText(npcChar, texttype, speaker, message); end;
function nextCycle(npcChar) mainNPC:nextCycle(npcChar); end;
function lookAtNpc(npcChar, char, mode) mainNPC:lookAt(npcChar, char, mode); end;
function useNPC(npcChar, char, counter, param) mainNPC:use(npcChar, char); end;
initNpc();
initNpc = nil;
-- END
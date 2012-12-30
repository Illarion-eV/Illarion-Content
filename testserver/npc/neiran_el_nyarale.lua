--------------------------------------------------------------------------------
-- NPC Name: Neiran el Nyarale                                       Runewick --
-- NPC Job:  guard                                                            --
--                                                                            --
-- NPC Race: elf                        NPC Position:  897, 781, 2            --
-- NPC Sex:  male                       NPC Direction: southeast              --
--                                                                            --
-- Author:   Miriam                                                           --
--                                                       easyNPC Parser v1.21 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (3, 897, 781, 2, 3, 'Neiran el Nyarale', 'npc.neiran_el_nyarale', 0, 2, 0, 128, 255, 255, 245, 230, 197);
---]]

require("npc.base.basic")
require("npc.base.condition.chance")
require("npc.base.condition.language")
require("npc.base.condition.quest")
require("npc.base.condition.town")
require("npc.base.consequence.inform")
require("npc.base.consequence.quest")
require("npc.base.consequence.rankpoints")
require("npc.base.talk")
require("npc.base.trade")
module("npc.neiran_el_nyarale", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
local tradingNPC = npc.base.trade.tradeNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Neiran el Nyarale the guard. Keywords: Quest, greetings, archmage, rubbish, recycling."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Neiran el Nyarale der Wachmann. Schlüsselwörter: Auftrag, Grüße, Erzmagier, Müll, recycling."));
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
talkEntry:addResponse("Greetings to you!");
talkEntry:addResponse("#me smiles: 'Greetings'");
talkEntry:addResponse("Hello! .");
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
talkEntry:addResponse("Seid gegrüßt!");
talkEntry:addResponse("#me lächlet: 'Grüße'");
talkEntry:addResponse("Hallo! ");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Hello hello!");
talkEntry:addResponse("Well...?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Hallo hallo!");
talkEntry:addResponse("Nun...?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Fare well!");
talkEntry:addResponse("See you soon again.");
talkEntry:addResponse("#me waves");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Lebt wohl.");
talkEntry:addResponse("Tschüss. Bis demnächst!");
talkEntry:addResponse("#me winkt");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Take care!");
talkEntry:addResponse("May the five be with you!");
talkEntry:addResponse("#me bows.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Bis bald!");
talkEntry:addResponse("Mögen die Fünf mit Euch sein!");
talkEntry:addResponse("#me verbeugt sich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("Me? Thank you, I am fine. How are you?");
talkEntry:addResponse("How do you do?");
talkEntry:addResponse("#me shrougs his shoulders.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befind");
talkEntry:addResponse("Ich? Mir geht es gut. Danke. Wie geht es Euch?");
talkEntry:addResponse("Wie geht es Euch?");
talkEntry:addResponse("#me zuckt mit den Schultern.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("Neiran el Nyarale, how can I help you?");
talkEntry:addResponse("Neiran el Nyarale, at your service.");
talkEntry:addResponse("Neiran el Nyarale from Runewick. And who are you?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ihr name");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Neiran el Nyarale, was kann ich für Euch tun?");
talkEntry:addResponse("Neiran el Nyarale , zu Diensten.");
talkEntry:addResponse("Neiran el Nyarale, aus Runewick. Und wer seid Ihr?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("sell");
talkEntry:addTrigger("buy");
talkEntry:addTrigger("wares");
talkEntry:addTrigger("price");
talkEntry:addTrigger("trade");
talkEntry:addTrigger("purchase");
talkEntry:addResponse("Me? I am not a trader. I am a treasurer. Or, rather the guard of the garbage bin.");
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
talkEntry:addResponse("Ich? Ich bin kein Händler, ich bin der Schatzmeister... Nun ja, wohl eher der Wächter der Müllkippe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Do you want a task? Please help to keep the town clean. Drop your garbage on the magical surface!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(205, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Ihr möchtet eine Aufgabe? Bitte helft mit die Stadt sauber zu halten. Werft Euren Müll auf die magische Oberfläche.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(205, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("Do you want a task? Please help to keep the town clean. Drop your garbage on the magical surface!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(205, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Ihr möchtet eine Aufgabe? Bitte helft mit die Stadt sauber zu halten. Werft Euren Müll auf die magische Oberfläche.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(205, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Just keep the streets clean.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Haltet einfach die Straßen sauber.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("Just keep the streets clean.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Haltet einfach die Straßen sauber.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(205, "=", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Just drop what ever you do not need or want to donate to the treasury here on the field. It is not difficult to make Runewick a better place!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(205, "=", 1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Werft das was Ihr nicht braucht oder was Ihr spenden wollt hier auf das Feld. Es ist  nicht schwere Runewick zu einem bessren Ort zu machen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(205, "=", 1));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("Just drop what ever you do not need or want to donate to the treasury here on the field. It is not difficult to keep the streets clean!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(205, "=", 1));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Werft das was Ihr nicht braucht oder was Ihr spenden wollt hier auf das Feld. Es ist  nicht schwere Runewick zu einem bessren Ort zu machen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(205, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Thank you for you help!");
talkEntry:addResponse("Thank you for your support!");
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("=", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(205, "=", 2));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Vielen Dank für Eure Hilfe!");
talkEntry:addResponse("Vielen Dank für Eure Unterstützung!");
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("=", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(205, "=", 2));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("Thank you for you help!");
talkEntry:addResponse("Thank you for your support!");
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("=", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(205, "=", 2));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Vielen Dank für Eure Hilfe!");
talkEntry:addResponse("Vielen Dank für Eure Unterstützung!");
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("=", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(205, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("#me smiles");
talkEntry:addResponse("Just keep the streets clean.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(205, "=", 2));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("#me lächelt");
talkEntry:addResponse("Haltet einfach die Straßen sauber.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(205, "=", 2));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("#me smiles");
talkEntry:addResponse("Just keep the streets clean.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(205, "=", 2));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("#me lächelt");
talkEntry:addResponse("Haltet einfach die Straßen sauber.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 7));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Zassaria");
talkEntry:addTrigger("lizzard");
talkEntry:addTrigger("lamp");
talkEntry:addTrigger("collection");
talkEntry:addTrigger("riverbank");
talkEntry:addResponse("Oil lamp collection? I threw away some oil lamps a few days ago... they did not belong to Lady Zassaria, did they?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(701, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 7));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Zassaria");
talkEntry:addTrigger("lizzard");
talkEntry:addTrigger("Lampe");
talkEntry:addTrigger("");
talkEntry:addTrigger("Sammlung");
talkEntry:addResponse("Öllampensammlung? Ich habe da eine ganze Mengen Öllampen entsorgt... aber, das war doch nicht Lady Zassarias Öllampensammlung, oder?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(701, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("I am the guard here. I guard the magical surface.");
talkEntry:addResponse("I tell newcomers how to use the how to use recycle mechanism.");
talkEntry:addResponse("I help to keep the steets clean. Do you want to help me with this task?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Ich bin Wächter hier. Ich hüte die magische Oberfälche.");
talkEntry:addResponse("Ich erkläre Neuankömmlingen wir man den Recyclemechanismus verwendet.");
talkEntry:addResponse("Ich helfe die Straßen sauber zu halten. Möchtet Ihr mir bei dieser Aufgabe behilflich sein?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("I am the guard here. I guard the magical surface.");
talkEntry:addResponse("I tell newcomers how to use the how to use recycle mechanism.");
talkEntry:addResponse("I help to keep the steets clean. Do you want to help me with this task?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Ich bin Wächter hier. Ich hüte die magische Oberfälche.");
talkEntry:addResponse("Ich erkläre Neuankömmlingen wir man den Recyclemechanismus verwendet.");
talkEntry:addResponse("Ich helfe die Straßen sauber zu halten. Möchtet Ihr mir bei dieser Aufgabe behilflich sein?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("I do not have much to tell, if you want to hear about adventures, then better go on adventure yourself.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Ich habe nicht viel zu erzählen, wenn Ihr über Abenteuer hören wollt, geht besser selst welche erleben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("garbage bin");
talkEntry:addTrigger("rubbish");
talkEntry:addTrigger("garbadge");
talkEntry:addTrigger("trash");
talkEntry:addResponse("There is no real rubbish, we reuse the most things.");
talkEntry:addResponse("This is no garbadge bin! It's a most magical recycle mechanism!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Müllkippe");
talkEntry:addTrigger("Müll");
talkEntry:addTrigger("Schrott");
talkEntry:addResponse("Es gibt eigentlich keinen Abfall. Wir verwerten das meiste weiter.");
talkEntry:addResponse("Das ist keine Müllkippe! Das ist ein höchst magischer Recylemechanismus!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("recycle mechanism");
talkEntry:addResponse("The Archmage invented the recycle mechanism. It is a wounderfull thing.");
talkEntry:addResponse("By using the recycle mechanism we keep this place clean. The arch mage is always happy when someone uses it.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("recyclemechanismus");
talkEntry:addTrigger("Recyclemechanismus");
talkEntry:addTrigger("recycle mechanismus");
talkEntry:addResponse("Der Erzmagier erfand den Recyclemechanismus.");
talkEntry:addResponse("Mit Hilfe des Recyclemechanismus halten wir Runewick sauer. Der Erzmagier freut sich immer, wenn jemand ihn benutzt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("magical");
talkEntry:addTrigger("surface");
talkEntry:addResponse("If you drop things on the magical surface they will disppear, and magically regain their value and then be teleportet to Runewicks treasury.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("magische");
talkEntry:addTrigger("Fläche");
talkEntry:addTrigger("Oberfläche");
talkEntry:addResponse("Wenn Ihr Gegenstände auf die magische Oberfläche legt, werden sie durch Magie ihren Wert zurück erhalten und in die Satzkammer von Runewick transferiert.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("recycling");
talkEntry:addResponse("The archmage invented the word 'recycling'.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("recycling");
talkEntry:addResponse("Der Erzmgier erfand das Wort 'recycling'.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("The gods created Illarion without rubbish. Most of us produce rubbish everyday.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Die Götter erschufen Illarion ohne Müll. Wir erschaffen jeden Tag Müll.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("religion");
talkEntry:addResponse("We elves pray to the five elder gods.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("religion");
talkEntry:addResponse("Wir Elfen beten zu den fünf alten Göttern.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("faith");
talkEntry:addResponse("We elves pray to the five elder gods.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Glaube");
talkEntry:addResponse("Wir Elfen beten zu den fünf alten Göttern.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addResponse("The arch mage is a wise man.");
talkEntry:addResponse("The arch mage helps to keep the streets clean!");
talkEntry:addResponse("The arch mages name ist Elvain Morgan.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Der Erzmagier ist ein weiser Mann.");
talkEntry:addResponse("Der Erzmagier hilft die Straßen sauber zu halten.");
talkEntry:addResponse("Der Erzmagier heißt Elvaine Morgan.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Elvaine Morgan is a wise man.");
talkEntry:addResponse("Elvaine Morgan helps to keep the streets clean!");
talkEntry:addResponse("Elvaine Morgan is the arch mage.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Elvaine Morgan ist ein weiser Mann.");
talkEntry:addResponse("Elvaine Morgan hilft die Staßeb sauber zu halten!");
talkEntry:addResponse("Elvaine Morgan ist der Erzmagier.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Yes, this is Runewick.");
talkEntry:addResponse("Let's keep the steets of Runewick clean!");
talkEntry:addResponse("Many people here study magic. Why did you come here?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Ja, dies ist Runewick.");
talkEntry:addResponse("Lasst uns die Straßen von Runewick sauber halten!");
talkEntry:addResponse("Viele Leute hier studieren Magie. Warum seid Ihr hier?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("No, that's not me.");
talkEntry:addResponse("He ist not here.");
talkEntry:addResponse("He has not here, as far as I know.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Nein, das bin ich nicht.");
talkEntry:addResponse("Der ist nicht hier.");
talkEntry:addResponse("So weit ich weiß, war er nicht hier.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("They do not keep the streets clean in Galmair.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("In Galmair halten sie die Straßen nicht sauber.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Queen");
talkEntry:addResponse("Queen is a title used by humans and dwarves for female leaders.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königin");
talkEntry:addResponse("Königin ist ein Titel den Menschen und Zwerge für weibliche Anführer benutzen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Mh? ? Who is that?");
talkEntry:addResponse("No, I haven't seen her. She has not used the recycle mechanism recently.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Mh? ...Wer?");
talkEntry:addResponse("Nein, ich habe sie nicht gesehen. Sie hat den Recyclemechanismus schon lange nicht benutzt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Ah... Cadomyr. That's a town full of sand.");
talkEntry:addResponse("Just a place not far from here. nothing more, nothing less.");
talkEntry:addResponse("#me nods slowly.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Ah... Cadomyr. Das ist eine Stadt voll von Sand.");
talkEntry:addResponse("Nur ein Ort nicht weit vob hier. Nichts mehr oder weniger als dies.");
talkEntry:addResponse("#me nickt langsam.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("albar");
talkEntry:addResponse("#me nods with a faint smile on his lips.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("#me nickt mit einem schmalen Lächeln auf den Lippen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addResponse("#me nods with a faint smile on his lips.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("#me nickt mit einem schmalen Lächeln auf den Lippen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("salkama");
talkEntry:addResponse("#me nods with a faint smile on his lips.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addResponse("#me nickt mit einem schmalen Lächeln auf den Lippen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse(" I've never been to this place.");
talkEntry:addResponse("It was ...a place.");
talkEntry:addResponse("#me nods with a faint smile on his lips.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Da war ich noch nie.");
talkEntry:addResponse("Es war ? ein Ort.");
talkEntry:addResponse("#me nickt mit einem schmalen Lächeln auf den Lippen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("Nice to meet you! ");
talkEntry:addResponse("Good to see you!");
talkEntry:addResponse("#me smiles friendly.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Feut mich!");
talkEntry:addResponse("Schön euch zu treffen!");
talkEntry:addResponse("#me lächelt freundlich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Neiran");
talkEntry:addTrigger("el Nyarale");
talkEntry:addTrigger("Nyarale");
talkEntry:addResponse("That's me. How can I help you?");
talkEntry:addResponse("#me raises a hand and waves.");
talkEntry:addResponse("#me lookes around: 'Who called for me?'");
talkEntry:addResponse("#me smiles friendly");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Neiran");
talkEntry:addTrigger("el Nyarale");
talkEntry:addTrigger("Nyarale");
talkEntry:addResponse("Das bin ich. Was kann ich für Euch tun?");
talkEntry:addResponse("#me hebt eine Hand und winkt.");
talkEntry:addResponse("#me bickt sich um: 'Wer rief nach mir?'");
talkEntry:addResponse("#me smiles friendly");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("#me nods slowly.");
talkEntry:addResponse("#me smiles.");
talkEntry:addResponse("I am happy to hear you say so!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("#me nickt langsam.");
talkEntry:addResponse("#me lächelt.");
talkEntry:addResponse("Es freut mich, dass Ihr das sagt..");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("I didn't expect that answer.");
talkEntry:addResponse("#me raises an eyebrow.");
talkEntry:addResponse("I shall give  you some more time to consider your answer. But at the moment you seem to be ? still inexperieced.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("Ich hätte eine andere Antwort erwartet.");
talkEntry:addResponse("#me hebt eine Augenbraue.");
talkEntry:addResponse("Ich werde dir mehr Zeit geben deine Antwort zu bedenken. Zur Zeit scheinst du noch ? unerfahren zu sein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Ah...pardon? What did you say?");
talkEntry:addResponse("#me raises an eyebrow.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Ah... verzeiht. Was sagtet Ihr?");
talkEntry:addResponse("#me hebt eine Augenbraue.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("Wir in Runewick wollen unsere Straßen sauer halten. Hilf auch du mit!", "Let's keep Runewicks streets clean!");
talkingNPC:addCycleText("#me schaut sich um.", "#me lookes around.");
talkingNPC:addCycleText("#me lächelt und  lässt einige Münzen auf die magische Oberfläche fallen.", "#me smiles and drops some coins into the magical surface.");
talkingNPC:addCycleText("Was ist wahrer Reichtum? Wissen oder Münzen?", "What is more of more value? Knowledge or coins?");
talkingNPC:addCycleText("Münzen, Waffen, Schmuck und Besteck, alles kann eingeschmolzen werden! Spendet unserer schönen Stadt.", "Coins, weapon, juwely, cutlery - everything can be melted down!");
talkingNPC:addCycleText("Getreide, Käuter, Küchenabfälle, alles kommt auf den Kompst!", "Grain, Herbs, kitchen waste, everything will be composted.");
talkingNPC:addCycleText("Spendet Roh- und Baustoffe, wir bessern die Straßen von Runewick aus!", "Donate building material and ressouces, we repair the streets of Runewick!");
talkingNPC:addCycleText("Spendet Papier und Tinte, die Bibliothek von Runewick wird es Euch danken!", "Donate ink and paper, for the library in Runewick!");
talkingNPC:addCycleText("Ich werde von eurem Einsatz für unsere schöne Stadt beim Erzmagier sprechen - zögert nicht!", "I'll tell the archmage about you supporting for you town! Do not heasitate to donate.");
talkingNPC:addCycleText("#me sieht glücklich aus.", "#me seems to be happy.");
talkingNPC:addCycleText("#me schreibt eine Liste.", "#me writes a list.");
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(3,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(3,"buySecondary"));
mainNPC:addLanguage(0);
mainNPC:addLanguage(3);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Dieser NPC ist Neiran el Nyarale der Wachmann.", "This NPC is Neiran el Nyarale the guard.");
mainNPC:setUseMessage("Fasst mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut verwirrt.", "#me looks around confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 181);
mainNPC:setEquipment(11, 0);
mainNPC:setEquipment(5, 0);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 0);
mainNPC:setEquipment(9, 825);
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
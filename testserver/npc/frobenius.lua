--------------------------------------------------------------------------------
-- NPC Name: Frobenius                                                Cadomyr --
-- NPC Job:  Blacksmith                                                       --
--                                                                            --
-- NPC Race: human                      NPC Position:  121, 599, 0            --
-- NPC Sex:  male                       NPC Direction: south                  --
--                                                                            --
-- Author:   Estralis Seborian                                                --
--                                                       easyNPC Parser v1.22 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (0, 121, 599, 0, 4, 'Frobenius', 'npc.frobenius', 0, 2, 3, 255, 255, 255, 181, 127, 85);
---]]

require("npc.base.basic")
require("npc.base.condition.language")
require("npc.base.consequence.inform")
require("npc.base.consequence.trade")
require("npc.base.talk")
require("npc.base.trade")
module("npc.frobenius", package.seeall)

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
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkEntry:addResponse("Ah, so you are interested in my wares.");
talkEntry:addResponse("Take your time to look around.");
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
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkEntry:addResponse("Ah, dann interessiert Ihr Euch also für meine Waren.");
talkEntry:addResponse("Schaut Euch ruhig in Ruhe um.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is the blacksmith Frobenius. Keywords: buy, sell, trade, Hello, blacksmith, iron."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist der Schmied Frobenius. Schlüsselwörter: kaufe, verkaufe, Handel, Hallo, Schmied, Eisen."));
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
talkEntry:addResponse("Let's get to business, alright?");
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
talkEntry:addResponse("Lasst uns zum Geschäft kommen, ja?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Let's get to business, alright?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Lasst uns zum Geschäft kommen, ja?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Kill some scum with my weapons, will you?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Tötet Abschaum mit meinen Waffen, ja?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Kill some scum with my weapons, will you?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Tötet Abschaum mit meinen Waffen, ja?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("Pardon me, but I do not want to talk about my feelings.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addResponse("Entschuldigt, aber ich möchte nicht über meine Gefühle reden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("Frobenius!");
talkEntry:addResponse("I am Frobenius, the blacksmith.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ihr name");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Frobenius!");
talkEntry:addResponse("Ich bin Frobenius, der Schmied.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Your quest today: Defend Cadomyr with my weapons. You have to buy one first...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Euer Auftrag heute: Verteidigt Cadomyr mit meinen Waffen. Ihr müßt aber erstmal eine kaufen...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("Your quest today: Defend Cadomyr with my weapons. You have to buy one first...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Euer Auftrag heute: Verteidigt Cadomyr mit meinen Waffen. Ihr müßt aber erstmal eine kaufen...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("I am a blacksmith, that means I craft weapons of death.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Ich bin ein Schmied. Das bedeutet, ich fertige Waffen des Todes.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("I am a blacksmith, that means I craft weapons of death.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Ich bin ein Schmied. Das bedeutet, ich fertige Waffen des Todes.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("That reminds me of a story I once heard... a very sad story.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Das erinnert mich an eine alte Geschichte, die ich einst hörte... eine traurige Geschichte.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("Ah.");
talkEntry:addResponse("Well?");
talkEntry:addResponse("Need weapons?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Aha.");
talkEntry:addResponse("Nun?");
talkEntry:addResponse("Braucht ihr eine Waffe?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("iron");
talkEntry:addResponse("Iron is tough, stiff and hard... The perfect material for weapons.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eisen");
talkEntry:addResponse("Eisen ist zäh, steif und hart. Das perfekte Material für Waffen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erz");
talkEntry:addResponse("Eisen gewinnt man aus Erzen. Cadomyr hat zwar keine reichen Minen, aber wir machen das beste daraus.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ore");
talkEntry:addResponse("Iron you can make from ore. Cadomyr does not have rich mines, but we're doing our best.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("steel");
talkEntry:addResponse("What is that supposed to be?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Stahl");
talkEntry:addResponse("Was soll das sein?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("smith");
talkEntry:addResponse("Use my forged items to smite the foes of Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Schmied");
talkEntry:addResponse("Benutze meine Schmiedewaren um die Feinde Cadomyrs zu zerschmettern.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("trader");
talkEntry:addTrigger("merchant");
talkEntry:addTrigger("collegue");
talkEntry:addTrigger("vendor");
talkEntry:addTrigger("market");
talkEntry:addResponse("Buy whatever you want on this marketplace, but in the end only weapons will make Cadomyr prosper.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("händler");
talkEntry:addTrigger("kollege");
talkEntry:addTrigger("höker");
talkEntry:addTrigger("markt");
talkEntry:addResponse("Kauft, was immer ihr wollt auf diesem Marktplatz, aber am Ende werden nur Waffen Cadomyr voran bringen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addResponse("The Archmage is the best that could happen to Runewick. He is such a bad leader that we do not have to bother about Runewick too much.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Der Erzmagier ist das beste, was Runewick passieren konnte. Er ist so ein schlechter Anführer, dass wir uns nicht um Runewick sorgen müssen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("The Archmage is the best that could happen to Runewick. He is such a bad leader that we do not have to bother about Runewick too much.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Der Erzmagier ist das beste, was Runewick passieren konnte. Er ist so ein schlechter Anführer, dass wir uns nicht um Runewick sorgen müssen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Runewick will fall to ruins one day, so do not bother. If you do, I have a good sword for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Runewick wird eines Tages eine Ruine sein, sorgt euch nicht. Wenn ihr euch dennoch sorgt, ich habe ein gutes Schwert für euch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("I assume the dagger that will slash the Don's throat has already been crafted... Hopefully, by me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Ich denke, dass der Dolch, der die Kehle des Dons aufschlitzen wird, bereits gefertigt wurde. Hoffentlich ist es einer von meinen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Galmair is rich, but they don't use their wealth properly, like for buying weapons.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Galmair ist reich, aber sie verstehen es nicht, ihren Reichtum richtig einzusetzen, zum Beispiel, um Waffen zu kaufen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Queen");
talkEntry:addResponse("Any weapon I craft is meant to protect the Queen. So, raise your hand against the Queen and hundreds of swords will chop it off.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königin");
talkEntry:addResponse("Jede Waffe, die ich schmiede, ist gemacht, um die Königin zu schützen. Erhebe deine Hand gegen sie und hunderte Schwerter werden sie abschlagen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Any weapon I craft is meant to protect the Queen. So, raise your hand against the Queen and hundreds of swords will chop it off.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Jede Waffe, die ich schmiede, ist gemacht, um die Königin zu schützen. Erhebe deine Hand gegen sie und hunderte Schwerter werden sie abschlagen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Cadomyr is our home and I hope my goods help to defend it against any enemies.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Cadomyr ist unsere Heimat und ich hoffe, meine Waren leisten ihren Beitrag, es gegen Feinde zu verteidigen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("albar");
talkEntry:addResponse("Spears and swords built the Albarian kingdom. Need any?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("Speere und Schwerter haben Albar aufgebaut. Braucht ihr welche?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addResponse("Gynk is far away and their weapons are lies and treason.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("Gynk ist weit entfernt und ihre Waffen sind Lügen und Verrat.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Salkamaerian armour might shine brightly, but it is ineffective.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Salkamaerische Rüstungen mögen funkeln und blitzen, aber sie sind nicht effektiv.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("I just have faith in Malachín and Irmorom. I mean, what use is Sirani, the Goddess of hugs?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Ich vertraue nur auf Malachín und Irmorom. Ich meine, was ist der Nutzen von Sirani, Göttin der Umarmungen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addResponse("Every sword I craft, I craft for Malachin himself.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addResponse("Jedes Schwert, welches ich schmiede, schmiede ich für Malachin!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("Irmorom would be proud if he saw my art. I'm his most hard working scholar.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("Irmorom wäre stolz, wenn er meine Schmiedekunst sehen würde. Ich bin sein fleißigster Schüler.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("Oh, come on, you don't want to talk to a person like me about Sirani, do you?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("Oh, ich denkt doch nicht etwa, dass ein Kerl wie ich gerne mit euch über Sirani reden will!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("I tell you, sharpen you blade and commit deeds for the glory of Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Ich sag euch: Schärft eure Klinge und vollbringt Taten für die Ehre von Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Frobenius");
talkEntry:addResponse("That's me.");
talkEntry:addResponse("Frobenius is my name and I am the local blacksmith.");
talkEntry:addResponse("My weapons bring doom over the foes of Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Frobenius");
talkEntry:addResponse("Das bin ich.");
talkEntry:addResponse("Frobenius ist meine Name und ich bin der Schmied hier.");
talkEntry:addResponse("Meine Waffen bringen Verderben über die Feinde Cadomyrs.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("What do you mean?");
talkEntry:addResponse("What do you need?");
talkEntry:addResponse("I have a good weapon for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("Was meint ihr?");
talkEntry:addResponse("Was braucht ihr?");
talkEntry:addResponse("Ich habe eine gute Waffe für euch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("As you like.");
talkEntry:addResponse("Per chance you want a helmet?");
talkEntry:addResponse("My swords never go blunt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("Wie ihr wollt.");
talkEntry:addResponse("Vielleicht wollt ihr einen Helm?");
talkEntry:addResponse("Meine Schwerter werden niemals stumpf.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me knallt einen Hammer auf ein glühendes Stück Metall.", "#me slams a hammer on a glowing piece of metal.");
talkingNPC:addCycleText("Was!", "What!");
talkingNPC:addCycleText("Hört auf zu glotzen, kauft, oder geht weiter!", "Stop looking, buy something or go away.");
talkingNPC:addCycleText("Scharfe Klingen, beste Helme für die Schlacht!", "Sharp blades, best helmets for battle!");
talkingNPC:addCycleText("Meine Klingen sind zum Töten da, nicht zum Holzschnitzen.", "My swords are made to kill, not to carve wood.");
talkingNPC:addCycleText("Hier gibt es die besten Waffen zum Töten von Orks, Goblins und Galmairern!", "Best weapons for killing orcs, goblins and Galmairians!");
talkingNPC:addCycleText("Ihr da! Eure Waffe ist der letzte Schrott. Ich hätte da was im Angebot für euch.", "Hey you! Your weapon is scrap. I'd have something for you.");
talkingNPC:addCycleText("#me poliert eine Schwertklinge.", "#me polishes the blade of a sword.");
talkingNPC:addCycleText("Jeden Tag eine gute Tat.", "An axe a day keeps the raptor away.");
talkingNPC:addCycleText("Heute ist ein guter Tag zum Sterben... für die Feinde der Königin!", "Today is a good day to die fighting the foes of the Queen.");
tradingNPC:addItem(npc.base.trade.tradeNPCItem(23,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2697,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2710,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2751,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(325,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(326,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(528,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(529,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(530,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(531,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(699,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(770,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(771,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2111,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2112,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2116,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2117,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2172,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(77,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(88,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(124,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(188,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(192,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(205,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(229,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(296,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(383,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2629,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2642,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2660,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2711,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2946,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(226,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(230,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(231,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2647,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2664,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2737,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(27,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(189,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(190,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(297,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(389,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(398,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(444,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2675,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2740,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2537,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2696,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(223,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(466,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(739,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(4,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(101,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(696,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2357,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2359,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2360,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2363,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2364,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2365,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2367,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2369,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2389,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2390,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2393,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2395,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2399,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2400,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2403,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2407,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(104,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(236,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2550,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2535,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2571,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(25,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(78,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(84,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(85,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(98,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(123,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(204,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(445,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2658,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2701,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2731,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2757,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2775,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2778,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(7,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(16,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(94,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(184,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(185,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(187,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(202,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(324,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2286,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2287,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2290,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2291,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2302,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2441,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2444,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(23,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2697,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2710,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2751,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(325,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(326,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(528,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(529,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(530,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(531,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(699,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(770,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(771,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2111,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2112,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2116,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2117,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2172,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(77,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(88,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(124,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(188,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(192,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(205,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(229,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(296,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(383,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2629,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2642,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2660,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2711,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2946,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(226,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(230,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(231,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2647,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2664,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2737,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(27,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(189,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(190,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(297,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(389,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(398,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(444,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2675,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2740,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2537,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2696,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(223,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(466,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(739,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(4,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(101,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(696,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2357,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2359,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2360,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2363,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2364,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2365,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2367,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2369,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2389,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2390,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2393,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2395,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2399,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2400,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2403,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2407,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(104,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(236,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2550,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2535,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2571,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(25,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(78,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(84,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(85,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(98,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(123,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(204,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(445,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2658,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2701,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2731,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2757,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2775,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2778,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(7,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(16,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(94,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(184,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(185,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(187,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(202,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(324,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2286,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2287,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2290,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2291,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2302,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2441,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2444,"buySecondary"));
tradingNPC:addNotEnoughMoneyMsg("Oh, ich fürchte Ihr könnt Euch das nicht leisten.", "Oh, I fear, you can not afford that.");
tradingNPC:addDialogClosedMsg("Vielen Dank, beehrt mich bald wieder!", "Thank you, please come again!");
tradingNPC:addDialogClosedNoTradeMsg("Auf Bald!", "Farewell!");
tradingNPC:addWrongItemMsg("Das kaufe ich nicht.", "I'm not buying this.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(1);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Dieser NPC ist der Schmied Frobenius.", "This NPC is the blacksmith Frobenius.");
mainNPC:setUseMessage("Fass mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut verwirrt.", "#me looks around confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 365);
mainNPC:setEquipment(11, 2419);
mainNPC:setEquipment(5, 23);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 48);
mainNPC:setEquipment(9, 34);
mainNPC:setEquipment(10, 53);
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
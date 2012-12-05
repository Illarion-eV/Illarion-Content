--------------------------------------------------------------------------------
-- NPC Name: Lothar Piero                                                None --
-- NPC Job:  trader                                                           --
--                                                                            --
-- NPC Race: halfling                   NPC Position:  896, 816, 1            --
-- NPC Sex:  male                       NPC Direction: east                   --
--                                                                            --
-- Authors:  Rincewind                                                        --
--           Estralis Seborian                                                --
--                                                       easyNPC Parser v1.21 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (2, 896, 816, 1, 2, 'Lothar Piero', 'npc.lothar_piero', 0, 1, 0, 192, 107, 5, 232, 188, 146);
---]]

require("npc.base.basic")
require("npc.base.condition.chance")
require("npc.base.condition.language")
require("npc.base.consequence.inform")
require("npc.base.consequence.trade")
require("npc.base.talk")
require("npc.base.trade")
module("npc.lothar_piero", package.seeall)

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
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Lothar Piero the timber merchant. Keywords: buy, sell, trade, Hello, profession, poetry, Pennymill, Archmage Morgan."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Lothar Piero der Holzhändler. Schlüsselwörter: kaufe, verkaufe, Handel, Hallo, Beruf, Poesie, Pfennigmühle, Erzmagier Morgan."));
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
talkEntry:addResponse("May Oldra bless you. Do you need wooden goods?");
talkEntry:addResponse("#me nods slowly: 'Wisdom and patience. How can I help you?'");
talkEntry:addResponse("Hiho! How can I help you?");
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
talkEntry:addResponse("Oldra mit Euch. Benötigt Ihr hölzernes Gut?");
talkEntry:addResponse("#me neigt seinen Kopf: 'Weisheit und Ausgeglichenheit. Wie darf ich Euch behilfich sein?'");
talkEntry:addResponse("Hiho! Womit kann ich dienlich sein?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("May Oldra bless you. Do you need... wood?");
talkEntry:addResponse("#me nods slowly: 'Wisdom and patience. How can I help you?'");
talkEntry:addResponse("Hiho! How can I help you?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Das ist durchwegs salopp gesagt, aber ich bin nicht kleinlich. Seid gegrüßt.");
talkEntry:addResponse("Ehre den Göttern, wollt ihr Bretter kaufen?");
talkEntry:addResponse("Guten Tag. Im Namen aller Händler will ich Euch willkommen heißen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Sounds sloppy, but I'm not picky. Be greeted.");
talkEntry:addResponse("Honour the gods, do you need boards?");
talkEntry:addResponse("Good day. I welcome you on behalf of all my collegues.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Auf Wiedersehen. Möge Oldra Eure Gärten und Felder hüten.");
talkEntry:addResponse("Gehabt Euch wohl. Bis Bald.");
talkEntry:addResponse("Adieu! Besucht mich wieder einmal.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Good bye. May Oldra bless your gardens and fields.");
talkEntry:addResponse("Farewell and see you soon.");
talkEntry:addResponse("Adieu! Come back anytime soon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Auf Wiedersehen. Möge Oldra Eure Gärten und Fälder hüten.");
talkEntry:addResponse("Gehabt Euch wohl. Bis Bald.");
talkEntry:addResponse("Adieu! Besucht mich wieder einmal.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("Wonderful! Indeed, Oldra smiles upon me.");
talkEntry:addResponse("Even if a cloud covers the sun, I know that it shines on my every day.");
talkEntry:addResponse("A dark night is defeated by the sunrise.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befinden");
talkEntry:addResponse("Ausgezeichnet. Ja, Oldra blickt wohlwollend auf mich herab.");
talkEntry:addResponse("Auch wenn hier und dort eine Wolke die Sonne verdecken mag, ich weiß, dass sie trotzdem jeden neuen Tag am Himmel stehen wird.");
talkEntry:addResponse("So finster Euch manche Nacht erscheinen kann, die Sonne wird erwachen und alles Finstere vertreiben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("My name is Lothar Piero. Welcome to the market of Runewick.");
talkEntry:addResponse("I am Lothar Piero and I... wood.");
talkEntry:addResponse("Boards, shields, bows, what do you desire? I am Lothar Piero and I got wood!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ihr name");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Ich heiße Lothar Piero. Seid mir willkommen am Markt von Runewick.");
talkEntry:addResponse("Ich bin Lothar Piero und handle mit allerlei hölzernen Gut.");
talkEntry:addResponse("Bretter, Schilde, Bögen, was wollt Ihr wohl mögen? Ich bin Lothar Piero und handle mit Holz.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Sorry, I have no job for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Es tut mir Leid, ich habe keine Arbeit für Euch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("Sorry, I have no job for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Es tut mir Leid, ich habe keine Arbeit für Euch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("Wood is good.");
talkEntry:addResponse("I am a merchant and thus, I trade wood. My wood makes me proud, hihi.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Ich bin Händler. Drum handle ich mit Holz, das macht mich sehr stolz. Hihi!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("Wood is good.");
talkEntry:addResponse("I am a merchant and thus, I trade wood. My wood makes me proud, hihi.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Ich bin Händler. Drum handle ich mit Holz, das macht mich sehr stolz. Hihi!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Gobaith, isn't that a tiny a island in the ocean?");
talkEntry:addResponse("Gobaith isn't important enough to attract Runewick's attention.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Gobaith, ist das nicht eine dieser winzigen Inseln im Splittermeer?");
talkEntry:addResponse("Gobaith ist viel zu unwichtig, um die Aufmerksamkeit Runewicks Wert zu sein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("I am delighted. A pleasure to meet you.");
talkEntry:addResponse("Well, I should remember that.");
talkEntry:addResponse("Be greeted and be told: I won't betray you with my wood.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Sehr erfreut - sehr erfreut. Schön Euch kennen zu lernen.");
talkEntry:addResponse("So, so? Das werde ich mir gut merken.");
talkEntry:addResponse("Seid gegrüßt, und lasst Euch sagen, Lothar hat noch keinen Kunden übers Ohr gehauen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Pennymill");
talkEntry:addResponse("The militia controls alls inns in Pennymill's harbour quarter. A halfling doesn't have to be afraid of ruffians and thugs there.");
talkEntry:addResponse("The streets of Pennymill are illuminated with thick candles. No shadow is cast where evil might lurk.");
talkEntry:addResponse("During the night, the gates of Pennymill are closed so you can only walk from quarter to quarter. That's much more save this way!");
talkEntry:addResponse("Pennymill's farmer's daughters have the most huge melons.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Pfennigmühle");
talkEntry:addResponse("In Pfennigmühle, ich will es Euch erzählen - kontrolliert die Miliz alle Tavernen und Gasthäuser des Hafenviertels. So braucht sich ein Halbling niemals vor Unruhestiftern und Grobianen fürchten.");
talkEntry:addResponse("Die Straßen in Pfennigmühle werden stehts mit dicken Ölkerzen beleuchtet. Wenn man abends nach Hause geht, gibt es kein schattiges Plätzchen, wo sich Unholde verkreichen könnten.");
talkEntry:addResponse("Nachts sind die Tore von Pfennigmühle geschlossen. Man kann sich so nur innerhalb der verschiedenen Viertel bewegen. So ist alles viel sicherer und kontrollierbar.");
talkEntry:addResponse("Ich möchte nicht prahlen, doch in Pfennigmühle gibt es die saftigsten und riesigsten Melonen, Kürbisse und Tomaten Illarions!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("poetry");
talkEntry:addResponse("Poetry, poetry. The carpenter's poetry's masterpiece is a harp. If you behold a true master carving the harp, you can almost hear the melody.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Poesie");
talkEntry:addResponse("Poesie, Poesie. Das Schönste was ein Schreiner zu schaffen vermag, ist zweifelsfrei eine Harfe. Sehe ich einem Meister beim Schnitzen zu, glaube ich oft eine Melodie zu hören.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("trader");
talkEntry:addTrigger("merchant");
talkEntry:addTrigger("collegue");
talkEntry:addTrigger("vendor");
talkEntry:addTrigger("market");
talkEntry:addResponse("We merchants of Runewick always try to offer as many goods and wares as possible.");
talkEntry:addResponse("The archmage himself asked us to import as few items as possible and rely on domestic goods.");
talkEntry:addResponse("Hiho! We merchants of Runewick stand united and the archmage backs us up.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("händler");
talkEntry:addTrigger("kollege");
talkEntry:addTrigger("höker");
talkEntry:addTrigger("markt");
talkEntry:addResponse("Wir Händler Runewicks geben uns Mühe, ein möglichst großes Angebot an Waren und Güter für die Stadt bereitzustellen.");
talkEntry:addResponse("Der Erzmagier persönlich hat uns Händlern aufgetragen, ausschließlich die nötigsten Güter zu importieren. Alles andere sind Güter aus Runewick.");
talkEntry:addResponse("Hiho! Die Händler Runewicks stehen zusammen. Und der Erzmagier hinter uns.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addResponse("I'd never disagree with the archmage. Everyone knows he has the master plan!");
talkEntry:addResponse("I trust Archmage Morgan, he is my guide. His able hands will forge Runewick's future.");
talkEntry:addResponse("The archmage is the most wise person of all of us. Who dares to know it better?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Niemals würde ich unserem Erzmagier widersprechen. Ist doch jedem hier bewusst, dass sein Plan niemals fehlt.");
talkEntry:addResponse("Erzmagier Morgan, ihm gebührt mein Vertrauen und all meine Hoffnungen. Die Zukunft Runewicks liegt in seinen fähigen Händen!");
talkEntry:addResponse("Der Erzmagier ist der Weiseste von uns. Wie könnte ich jemals an seinen Worten zweifeln?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("I'd never disagree with the archmage. Everyone knows he has the master plan!");
talkEntry:addResponse("I trust Archmage Morgan, he is my guide. His able hands will forge Runewick's future.");
talkEntry:addResponse("The archmage is the most wise person of all of us. Who dares to know it better?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Niemals würde ich unserem Erzmagier widersprechen. Ist doch jedem hier bewusst, das sein Plan niemals fehlt.");
talkEntry:addResponse("Erzmagier Morgan, ihm gebührt mein Vertrauen und all meine Hoffnungen. Die Zukunft Runewicks liegt in seinen fähigen Händen!");
talkEntry:addResponse("Der Erzmagier ist der Weiseste von uns. Wie könnte ich jemals an seinen Worten zweifeln?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("May Elara bless Runewick. The four towers are built to honour the gods and to demonstrate our might to our neighbours.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Elara möge Runewick bewahren. Die vier Türme sollen den Göttern schmeicheln und benachbarten Städten unsere Macht demonstrieren.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("He is stubborn I was told. All he cares for is gold. It is only a matter time until another thug overtakes Galmair.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Ein wahrer Dickkopf, habe ich mir sagen lassen. Ihm ist nur daran gelegen Gold zu häufen. Es ist nur eine Frage der Zeit bis einer seiner Konkurenten das Ruder Galmairs aus seinen Händen reißt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Us traders have a proverb: Do not trust Galmair, gold opens the door of the stupid. But if you want to walk into the house of wisdom, you have to open a book instead.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Wir Händler haben ein Sprichwort: Traue Galmair nicht, dort schätzt man nur das Gold, von Gewicht. Doch willst du Weisheit tragen, sollt Ihr die Bücher befragen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Queen");
talkEntry:addResponse("Queen Rosaline rules on behalf of the gods Malachín and Zhambra. They do not care about wisdom, but is it wise to rule a town by sword and battle?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königin");
talkEntry:addResponse("Königin Rosaline herrscht aufgrund der Götter Gnade. Malachín und Zhambra, doch sie schenken der Weisheit keinen Wert. Ist es weise eine Stadt mit Schwert und Schlachtenehre zu regieren?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Queen Rosaline rules on behalf of the gods Malachín and Zhambra. They do not care about wisdom, but is it wise to rule a town by sword and battle?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Königin Rosaline herrscht aufgrund der Götter Gnade. Malachín und Zhambra, doch sie schenken der Weisheit keinen Wert. Ist es weise eine Stadt mit Schwert und Schlachtenehre zu regieren?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Cadomyr is a sand pit, lots of barbarians that got too much sun on their heads. Who wins a duel takes it all, the loser standing small.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Cadomyr ist eine Sandgrube, voller Barbaren die zu viel Sonne bekommen haben. Wer im Zweikampf obliegt, erfährt Ehre und Recht. Der Verlierer lebt in Schande.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("albar");
talkEntry:addResponse("Albar is a horrible place. Lucky you, you found Runewick.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("Albar ist ein schrecklicher Ort. Seid froh, das ihr Euren Weg nach Runewick gefunden habt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addResponse("I overheard Valerio Guilianni came from Gynk to Galmair. He brought strange customs from that spoiled land. With the arrival of the Don, the pearl of the mountains went down the sewers.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("Ich hörte Valerio Guilianni sei einst aus Gynk nach Galmair gekommen. Mit sich brachte er alle vermeintlichen Tugenden aus seinem abschäulichen Land. Denn mit dem Don ist auch die Stadt in den Bergen verkommen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Salkamar, you flourishing garden of mankind! If only all humans could live like the paladins of Salkamar.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Salkamar, du blühender Garten des Menschenvolkes! Würden sich doch alle Menschen besinnen und leben wie die Paladine Salkamars.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("Hail Oldra and Elara. May they protect us from all evil from Galmair or Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Gepriesen sein Oldra und Elara. Mögen sie uns vor den Übeln aus Galmair und Cadomyr bewahren.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elara");
talkEntry:addResponse("O Elara, guide archmage Morgan, for he may take the wisest step next.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elara");
talkEntry:addResponse("Elara, leite Erzmagier Morgan, damit er die weisesten Entscheidungen treffen mag.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("Oldra, I thank thee for my wood, for the trees and for all what is made from them.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("Oldra, ich danke für das Holz deiner Bäume, die meine Schilder so stark und die Instrumente so wohlklingend machen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Lothar");
talkEntry:addTrigger("Piero");
talkEntry:addResponse("Hiho! What goods may I offer to you?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Lothar");
talkEntry:addTrigger("Piero");
talkEntry:addResponse("Hiho! Welche meiner Güter vermögen Euch zu begeistern?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("Yes, very well.");
talkEntry:addResponse("Indeed, just what I wanted to say.");
talkEntry:addResponse("How marvellous, we have the same opinion.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("Ja, das ist mir auch Recht.");
talkEntry:addResponse("Bestimmt, das denke ich auch.");
talkEntry:addResponse("Wie fantastisch, wir sind einer Meinung.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("If you think that's good...");
talkEntry:addResponse("I ment it the way I said it.");
talkEntry:addResponse("No? Maybe we should discuss that at Elara's shrine.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("So denn ihr das für weise haltet.");
talkEntry:addResponse("Das meine ich wie ich es sagte.");
talkEntry:addResponse("Nein? Vielleicht sollten wir uns an Elaras Altar beratschlagen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Oldra's blessing for your gardens.");
talkEntry:addResponse("Elara's wisdom may guide you.");
talkEntry:addResponse("Hiho, that's funny!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Oldras Segen über Eure Gärten.");
talkEntry:addResponse("Elaras Weisheit sei mit Euch.");
talkEntry:addResponse("Hiho, das gefällt mir.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me greift sich mit beiden Händen in die wuscheligen braunen Haare und lächelt.", "#me combs his tousled hairs with his hands, smiling.");
talkingNPC:addCycleText("#me poliert mit einem öligen Laken einen gefinkelt verzierten Gehstock.", "#me polishes a decorated walking cane with an oiled rag.");
talkingNPC:addCycleText("#me klimpert mit seinen Fingern auf einer zierlichen Laute.", "#me jingles with his fingers on a petite lute.");
talkingNPC:addCycleText("#me hohlt tief Luft und seufzt leise: 'H-hm! Tannenholz!'", "#me breathes deeply and sighs: 'Ahh, fir wood!'.");
talkingNPC:addCycleText("#me lächelt sanft und sein faltiges Gesicht wirkt dabei wie eine große Rosine.", "#me smiles softly while his wrinkled face appears like a big raisin.");
talkingNPC:addCycleText("#me streicht mit der Hand über verschiedene hölzerne Dinge welche ihn umgeben.", "#me runs with a hand over a few different wooden things which surround him.");
talkingNPC:addCycleText("Rosen sind Rot, Veilchen sind Blau, ich mag den Himmel, und meine Frau. - Hab mein Holz, was braucht ein Halbling mehr? Darauf bin ich stolz.", "Roses are red, violets are blue, I like the sky and my wife too. - I got my wood, what else does a halfling need? I'm proud of it.");
talkingNPC:addCycleText("#me verängt mit einem Lächeln die Augen und mustert seine Umgebung.", "#me blinks with one eye and inspects his surrounding.");
talkingNPC:addCycleText("#me lehnt sich zufrieden lächelnd zurück.", "#me leans back, smiling contently.");
talkingNPC:addCycleText("#me steckt seine Hand in die Tasche neben dem Stuhl und zieht ein Brötchen heraus. Dann beginnt er daran zu knabbern.", "#me puts his hand into the bag near the chair, pulling out a bread roll and starts nibbling on it.");
tradingNPC:addItem(npc.base.trade.tradeNPCItem(9,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(74,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2709,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2715,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2752,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(64,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(237,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(322,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1266,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(545,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(546,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2543,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2716,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(65,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(70,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(89,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2646,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2685,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2708,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2714,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2718,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2723,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2727,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2780,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2525,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2527,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2528,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2530,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2541,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2544,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2548,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2549,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2561,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2566,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2567,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2570,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2572,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2573,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2584,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2585,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2193,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2194,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2935,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2952,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(17,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(18,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(19,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(20,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(95,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(96,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(186,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(916,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(917,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2284,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2388,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2439,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2445,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2447,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2448,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(3,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(56,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(543,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(544,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2560,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2786,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(39,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(40,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(57,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(76,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(207,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(208,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(209,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(90,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(332,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(333,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(335,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(323,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2782,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2783,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2784,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2785,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(9,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(74,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2709,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2715,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2752,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(64,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(237,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(322,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1266,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(545,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(546,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2543,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2716,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(65,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(70,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(89,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2646,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2685,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2708,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2714,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2718,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2723,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2727,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2780,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2525,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2527,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2528,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2530,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2541,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2544,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2548,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2549,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2561,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2566,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2567,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2570,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2572,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2573,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2584,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2585,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2193,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2194,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2935,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2952,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(17,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(18,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(19,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(20,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(95,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(96,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(186,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(916,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(917,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2284,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2388,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2439,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2445,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2447,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2448,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(3,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(56,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(543,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(544,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2560,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2786,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(39,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(40,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(57,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(76,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(207,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(208,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(209,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(90,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(332,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(333,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(335,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(323,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2782,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2783,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2784,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2785,"buyPrimary"));
tradingNPC:addNotEnoughMoneyMsg("Oh, ich fürchte Ihr könnt Euch das nicht leisten.", "Oh, I fear, you can not afford that.");
tradingNPC:addDialogClosedMsg("Vielen Dank, beehrt mich bald wieder!", "Thank you, please come again!");
tradingNPC:addDialogClosedNoTradeMsg("Auf Bald!", "Farewell!");
tradingNPC:addWrongItemMsg("Das kaufe ich nicht.", "I'm not buying this.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(5);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Dieser NPC ist Lothar Piero der Holzhändler.", "This NPC is Lothar Piero the timber merchant.");
mainNPC:setUseMessage("Fass mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut dich verwirrt an.", "#me looks at you confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 365);
mainNPC:setEquipment(11, 195);
mainNPC:setEquipment(5, 0);
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
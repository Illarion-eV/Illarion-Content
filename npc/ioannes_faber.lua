--------------------------------------------------------------------------------
-- NPC Name: Ioannes Faber                                            Cadomyr --
-- NPC Job:  Royal treasurer                                                  --
--                                                                            --
-- NPC Race: human                      NPC Position:  129, 529, 0            --
-- NPC Sex:  male                       NPC Direction: west                   --
--                                                                            --
-- Author:   Estralis Seborian/Ardian                                         --
--                                                                            --
-- Last parsing: August 18, 2012                          easyNPC Parser v1.2 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (0, 129, 529, 0, 6, 'Ioannes Faber', 'npc.ioannes_faber', 0, 1, 1, 139, 71, 38, 205, 133, 63);
---]]

require("npc.base.basic")
require("npc.base.condition.language")
require("npc.base.consequence.inform")
require("npc.base.talk")
module("npc.ioannes_faber", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is the royal treasurere of Cadomyr, Ioannes Faber. Keywords: Be greeted, treasurer, Gold."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist der königliche Kämmerer von Cadomyr, Ioannes Faber. Schlüsselwörter: Seid gegrüßt, Kämmerer, Gold."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is the royal treasurere of Cadomyr, Ioannes Faber. Keywords: Be greeted, treasurer, 'Do you have any orders for me?', 'I want to see order <number>', 'I want to get order <number>'."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist der königliche Kämmerer von Cadomyr, Ioannes Faber. Schlüsselwörter: Seid gegrüßt, Kämmerer, 'Habt ihr Aufträge für mich?', 'Ich möchte Auftrag <Nummer> ansehen', 'Ich möchte Auftrag <Nummer> annehmen'."));
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
talkEntry:addResponse("Hail and may Malachín bless you. I assume you want to obey the orders of the queen.");
talkEntry:addResponse("Be greeted. We should get straight to the orders of her majesty.");
talkEntry:addResponse("You are just the person that needs an order, indeed.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Grüß");
talkEntry:addTrigger("Gruß");
talkEntry:addTrigger("Guten Tag");
talkEntry:addTrigger("Guten Abend");
talkEntry:addTrigger("Mahlzeit");
talkEntry:addTrigger("Tach");
talkEntry:addTrigger("Moin");
talkEntry:addResponse("Malachín zum Gruße. Ich nehme an, ihr wollt den Befehlen der Königin gehorchen.");
talkEntry:addResponse("Seid gegrüßt. Wir sollten sofort über die Aufträge der Königin reden.");
talkEntry:addResponse("Ihr seid genau die Person, die einen Befehl benötigt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hail and may Malachín bless you. I assume you want to obey the orders of the queen.");
talkEntry:addResponse("Be greeted. We should get straight to the orders of her majesty.");
talkEntry:addResponse("You are just the person that needs an order, indeed.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Malachín zum Gruße. Ich nehme an, ihr wollt den Befehlen der Königin gehorchen.");
talkEntry:addResponse("Seid gegrüßt. Wir sollten sofort über die Aufträge der Königin reden.");
talkEntry:addResponse("Ihr seid genau die Person, die einen Befehl benötigt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Go forth and do as the queen tells you.");
talkEntry:addResponse("Farewell and may your journey be a pleasant one.");
talkEntry:addResponse("Good bye and don't forget to come back.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Gehet hin und tut, wie die Königin euch geheißt.");
talkEntry:addResponse("Gehabt euch wohl und möge eure Reise eine angenehme sein.");
talkEntry:addResponse("Auf wiedersehen und vergesst nicht, zurückzukehren.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Go forth and do as the queen tells you.");
talkEntry:addResponse("Farewell and may your journey be a pleasant one.");
talkEntry:addResponse("Good bye and don't forget to come back.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Gehet hin und tut, wie die Königin euch geheißt.");
talkEntry:addResponse("Gehabt euch wohl und möge eure Reise eine angenehme sein.");
talkEntry:addResponse("Auf wiedersehen und vergesst nicht, zurückzukehren.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("The grin of the queen makes me spin, spinning within.");
talkEntry:addResponse("Every word of the queen is like caress.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addResponse("Das Lächeln der Königin macht mich ganz wuschig im Inneren.");
talkEntry:addResponse("Jedes Wort der Königin ist wie eine Liebkosung.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("Faber. Ioannes Faber. I am the royal treasurer, do not underestimate my importance at the palace.");
talkEntry:addResponse("My name is Ioannes Faber, the royal treasurer of Cadomyr. The queen relies on me, indeed.");
talkEntry:addResponse("You don't know my name? Better write it down then: Ioannes Faber.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Faber. Ioannes Faber. Ich bin der königliche Kämmerer, ihr solltet meine Bedeutung am Hofe nicht unterschätzen.");
talkEntry:addResponse("Mein Name ist Ioannes Faber, der königliche Kämmerer von Cadomyr. Die Königin hält große Stücke auf mich.");
talkEntry:addResponse("Ihr kennt meinen Namen nicht? Schreibt ihn euch besser auf: Ioannes Faber.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("order");
talkEntry:addResponse("I currently have no orders for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Befehl");
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufträge");
talkEntry:addResponse("Derzeit habe ich keine Befehle für euch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I do not issue quests. I issue orders of queen Rosaline. Obey them!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Ich biete keine Abenteuer an, ich verteile Befehle von Königin Rosaline. Gehorcht ihnen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addResponse("I do not issue quests. I issue orders of queen Rosaline. Obey them!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addResponse("Ich biete keine Abenteuer an, ich verteile Befehle von Königin Rosaline. Gehorcht ihnen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("I am the royal treasurer. The queen entrusted me the wealth of Cadomyr; and I am not the one who will disappoint her. Will you?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Ich bin der königliche Kämmerer. Die Königin hat mir den Reichtum Cadomyrs anvertraut; und ich bin keiner von denen, die sie enttäuschen wird. Ihr etwa?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I am the royal treasurer. The queen entrusted me the wealth of Cadomyr; and I am not the one who will disappoint her. Will you?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Ich bin der königliche Kämmerer. Die Königin hat mir den Reichtum Cadomyrs anvertraut; und ich bin keiner von denen, die sie enttäuschen wird. Ihr etwa?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Well, I heard many refugees came from Gobaith to Cadomyr. But I do not deal that much with refugees, I have to admit.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Nun, ich hörte, dass viele Flüchtlinge von Gobaith nach Cadomyr gekommen sind. Aber ich muss gestehen, ich schere mich nicht sonderlich um Flüchtlinge.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("Welcome to the palace. I hope you didn't come here to rob from the treasury.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Willkommen im Palast. Ich hoffe, ihr seid nicht hier, um die Schatzkammer zu plündern.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("treasurer");
talkEntry:addTrigger("treasury");
talkEntry:addResponse("The office of treasurere requires loyality, integrity and meekness. And you won't find anyone of Cadomyr who suits the office better than Ioannes Faber.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gold");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Gold is important for Cadomyr's wealth, but more important is our honour. For honour, you cannot buy but just sell.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("jewels");
talkEntry:addResponse("Jewels, gems, diamonds, only the brightest ones for the crown of Cadomyr. Got some?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("glas");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("The queen uses to have banquets with her nobley from time to time. Thus, finest tableware is needed frequently.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("wealth");
talkEntry:addResponse("I hold the keys to the treasury. And there is nothing even Baron Hastings could offer me to betray my queen. I'd rather die... like my wife.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("honor");
talkEntry:addTrigger("honour");
talkEntry:addResponse("Honour is what shapes a man and crafted Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("bribe");
talkEntry:addTrigger("corrupt");
talkEntry:addResponse("Hold your tongue!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("wife");
talkEntry:addResponse("It is not a secret anymore; my wife was slain by henchmen of Baron Hastings in an attempt to blackmail me. But I did not surrender the treasury to them... Instead...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Kämmerer");
talkEntry:addTrigger("Schatzkammer");
talkEntry:addResponse("Das Amt des Kämmerers erfordert Loyalität, Integrität und Demut. Es gibt niemanden in Cadomyr, der von all dem mehr aufweißt als Ioannes Faber.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gold");
talkEntry:addResponse("Gold ist wichtig für Cadomyrs Reichtum, aber weit wichtiger noch ist die Ehre. Denn Ehre kann man nicht kaufen, sehr wohl aber verkaufen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Juwelen");
talkEntry:addResponse("Juwelen, Edelsteine, Diamanten, nur die funkelnsten für die Krone Cadomyrs. Habt ihr welche?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Glas");
talkEntry:addResponse("Die Königin hält des öfteren Banketts mit ihren Oberen ab. Hierfür wird stets das beste Geschirr gebraucht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Reichtum");
talkEntry:addTrigger("Reichtümer");
talkEntry:addResponse("Ich verwahre die Schlüssel zur Schatzkammer und es gibt nichts, was mir nicht einmal Baron Hastings bieten könnte, um meine Königin zu verraten. Ich würde viel lieber sterben... wie meine Frau.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ehre");
talkEntry:addResponse("Ehre es, was einen Mann ausmacht und auf was Cadomyrs Fundament steht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bestech");
talkEntry:addTrigger("korrupt");
talkEntry:addResponse("Haltet den Schnabel!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Frau");
talkEntry:addResponse("Es ist kein Geheimnis mehr; meine Frau wurde von Handlangern von Baron Hastings umgebracht, als er mich erpressen wollte. Doch ich überließ ihm nicht die Schatzkammer. Stattdessen...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addResponse("The archmage seems to be quite a charismatic person. I can't explain elsewise how such a honourless person gathered so many followers.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Der Erzmagier scheint mir eine charismatische Persönlichkeit zu sein. Wie anders ist es zu erklären, dass so eine ehrlose Person so viele Anhänger um sich schart.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("The archmage seems to be quite a charismatic person. I can't explain elsewise how such a honourless person gathered so many followers.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Der Erzmagier scheint mir eine charismatische Persönlichkeit zu sein. Wie anders ist es zu erklären, dass so eine ehrlose Person so viele Anhänger um sich schart.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("What makes me wonder: Runewick is admittedly a magnificent town, but they don't really care about mudane wealth there. That... simply does not fit.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Worüber ich mich wundere: Runewick ist zugegebenermaßen eine prunkvolle Stadt, aber sie scheren sich nicht um weltlichen Reichtum dort. Das... passt irgendwie nicht zusammen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("There is a difference between me and the Don; he keeps all his wealth for himself, and I keep it for the queen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Was mich und den Don unterscheidet ist, dass der seinen ganzen Reichtum für sich selber hortet und ich den Reichtum Cadomyrs für die Königin verwahre.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I'd be king of Galmair if I claim all the treasury of Cadomyr for myself. But I am rather an honourable serf than a heinous lord.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Ich wäre König von Galmair, wenn ich den Inhalt der Schatzkammer Cadomyrs an mich reißen würde. Aber ich bin lieber ein ehrbarer Diener als ein ruchloser Herr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Queen");
talkEntry:addResponse("Since my wife died, queen Rosaline is the only woman in my life. I serve her with every fibre of my body.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königin");
talkEntry:addResponse("Seitdem meine Frau nicht mehr ist, ist Königin Rosaline die einzige Frau in meinem Leben. Ich diene ihr mit jeder Faser meines Körpers.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Since my wife died, queen Rosaline is the only woman in my life. I serve her with every fibre of my body.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Seitdem meine Frau nicht mehr ist, ist Königin Rosaline die einzige Frau in meinem Leben. Ich diene ihr mit jeder Faser meines Körpers.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Cadomyr is a glorious realm, founded by honourable men of albarian origin. Be proud to stand here!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Cadomyr ist ein glorreiches Reich, gegründet von ehrbaren Männern albarischen Geblüts. Seid stolz, hier sein zu dürfen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Albar, Albar, Albar. Cadomyr! I respect our ancestors, but Cadomyr is independent and even more honourable than Albar.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("Albar, Albar, Albar. Cadomyr! Ich ehre unsere Vorväter, aber Cadomyr ist eigenständig und noch ehrbarer als Albar.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("They are no people and no tribe. What are they, anyway - besides smugglers?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("Sie sind kein Volk und kein Stamm. Was sind sie eigentlich - außer Schmuggler?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Warmongers! Men cannot recall true peace between Salkamar and Albar. Why? Because of them!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Kriegstreiber! Die Menschheit kann sich an keinen dauerhaften Frieden zwischen Albar und Salkamar erinnern. Warum? Ihretwegen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("I pray to Malachín. And only to Malachín!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Ich bete zu Malachín - und nur zu Malachín!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Malachín is the patron of Cadomyr. Never displease him nor the queen and you will have a long life.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addResponse("Malachín ist der Schutzgott von Cadomyr. Enttäuscht weder ihn noch die Königin und ihr werdet euch eines langen Lebens erfreuen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("The dwarves pray to Irmorom to gain wealth; so far, so good. But I pray to Malachín to help me guard the wealth of Cadomyr with my sword.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("Die Zwerge beten zu Irmorom um Reichtümer anzuhäufen, soweit, so gut. Aber ich bete zu Malachín, damit er mir hilft, die Reichtümer Cadomyrs mit dem Schwert zu verteidigen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("I'm not a trader, I am the royal treasurere. If you obey the orders of the queen, you might get a reward.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Ich bin kein Händler, ich bin der königliche Kämmerer. Wenn ihr den Befehlen der Königin gehorcht, dann werdet ihr vielleicht entlohnt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("Let me tell you something: A whip can make people work. But a crown makes them obey.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Lasst euch das gesagt sein: Eine Peitsche bringt Leute zum arbeiten, aber eine Krohne bringt sie dazu, zu gehorchen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ioannes");
talkEntry:addTrigger("Faber");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I am the royal treasurer Ioannes Faber. I obey her majesty and only her majesty.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ioannes");
talkEntry:addTrigger("Faber");
talkEntry:addResponse("Ich bin der königliche Kämmerer Ioannes Faber. Ich gehorche ihrer Majestät und nur ihrere Majestät.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("Good to hear.");
talkEntry:addResponse("Pardon me?");
talkEntry:addResponse("Indeed.");
talkEntry:addResponse("I agree.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("Gut zu wissen.");
talkEntry:addResponse("Entschuldigt?");
talkEntry:addResponse("So, so.");
talkEntry:addResponse("Meine vollste Zustimmung.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("Maybe you reconsider.");
talkEntry:addResponse("An interesting point of view.");
talkEntry:addResponse("How comes?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("Vielleicht überlegt ihr es euch nochmal.");
talkEntry:addResponse("Eine interessante Sichtweise.");
talkEntry:addResponse("Wieso das?");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("Hoch lebe die Königin!", "Long live the queen!");
talkingNPC:addCycleText("Für die Ehre von Cadomyr!", "For the glory of Cadomyr!");
talkingNPC:addCycleText("Cadomyr, oh Cadomyr, wie lieb ich dir!", "Cadomyr, O Cadomyr, you are my dear!");
talkingNPC:addCycleText("Rosaline und Cadomyr - Liebe geben sie uns, unschätzbar und unerreicht.", "Rosaline and Cadomyr - Love she gives us, passing measure.");
talkingNPC:addCycleText("Nur ein toter Hastings ist ein guter Hastings.", "Only a dead Hastings is a good Hastings.");
talkingNPC:addCycleText("Ein Hobbitgewicht in Gold für den Kopf von Baron Hastings!", "The weight of a hobbit in gold for the head of Baron Hastings!");
talkingNPC:addCycleText("Vor jedem verborgenen Feind, vor den Anschlägen der Mörder, schütze Malachín die Königin!", "From every latent foe, from the assassins blow, Malachín save the queen!");
talkingNPC:addCycleText("Und wie ein reißender Strom losbrechen, um rebellische Hastings niederzuwerfen!", "And like a torrent rush, rebellious Hastings to crush.");
talkingNPC:addCycleText("Malachín schütze die Königin!", "Malachín save the queen!");
talkingNPC:addCycleText("Ihr da! Kommt her. Ich habe einen Auftrag der Königin.", "You! Come over here. I have orders of the queen.");
mainNPC:addLanguage(0);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Dieser NPC ist der königliche Kämmerer von Cadomyr, Ioannes Faber.", "This NPC is the royal treasurere of Cadomyr, Ioannes Faber.");
mainNPC:setUseMessage("Fasst mich nicht an!", "Don't you touch me!");
mainNPC:setConfusedMessage("#me schaut dich verwirrt an.", "#me looks at you confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 101);
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
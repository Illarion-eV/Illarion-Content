--------------------------------------------------------------------------------
-- NPC Name: Snorri                                                   Galmair --
-- NPC Job:  Trader                                                           --
--                                                                            --
-- NPC Race: dwarf                      NPC Position:  352, 256, 0            --
-- NPC Sex:  male                       NPC Direction: south                  --
--                                                                            --
-- Author:   Rincewind                                                        --
--                                                                            --
-- Last parsing: October 01, 2012                        easyNPC Parser v1.21 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (1, 352, 256, 0, 4, 'Snorri', 'npc.snorri', 0, 1, 1, 119, 56, 3, 217, 154, 123);
---]]

require("npc.base.basic")
require("npc.base.condition.chance")
require("npc.base.condition.language")
require("npc.base.consequence.inform")
require("npc.base.consequence.trade")
require("npc.base.talk")
require("npc.base.trade")
module("npc.snorri", package.seeall)

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
talkEntry:addResponse("I sell fish. Big fish, small fish, colourful fish or boring... they are all different. But they have one thing in common! They are fresh! So fresh, they might even jump out of your pan.");
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
talkEntry:addResponse("Ich verkaufe Fisch. Große Fische, kleine Fische, bunte Fische oder langweilige... alle sind sie anders. Aber eines haben sie Gemeinsam. Sie sind frisch! So frisch, sie würden Euch glatt aus der Pfanne hüpfen.");
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkingNPC:addTalkingEntry(talkEntry);
end;
tradingNPC:addNotEnoughMoneyMsg("Du kannst dir das nicht leisten!", "You can not afford that!");
tradingNPC:addDialogClosedMsg("Danke, komm bald wieder!", "Thanks, come again!");
tradingNPC:addDialogClosedNoTradeMsg("Auf Bald!", "Farewell!");
tradingNPC:addWrongItemMsg("Das kaufe ich nicht.", "I'm not buying this.");
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Snorri the fishmonger. Keywords: buy, sell, trade, fish, orc, morri, nose, dwarf."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Snorri der Fischhändler. Schlüsselwörter: kaufe, verkaufe, Handel, Fisch, Ork, Morri, Nase, Zwerg."));
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
talkEntry:addResponse("Hiho, how can I help you? - No, don't tell me, let me guess. You wanna buy some fish, right?");
talkEntry:addResponse("Hello, Hello. How are you today? I haven't seen you for years. New haircut? It really suits you!");
talkEntry:addResponse("Oh! Good day! It's nice to meet you!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Grüß?");
talkEntry:addTrigger("Gruß");
talkEntry:addTrigger("Guten Tag");
talkEntry:addTrigger("Guten Abend");
talkEntry:addTrigger("Mahlzeit");
talkEntry:addTrigger("Tach");
talkEntry:addTrigger("Moin");
talkEntry:addResponse("Hiho, wie kann ich Euch helfen? - Nein, sagt es nicht, ich weiß es schon, ihr wollt ein paar von meinen Fischen kaufen, nicht wahr?");
talkEntry:addResponse("Tach, tach. Wie geht's denn heute so? Ihr habt Euch ja ewig nich ansehen lassen. Neue Frisur? Steht euch gut zu Gesicht!");
talkEntry:addResponse("Oh! Guten Tach! Ist mir eine Freude Euch zu Begrüßen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Hiho, how can I help you? - No, don't tell me, let me guess. You wanna buy some fish, right?");
talkEntry:addResponse("Hello, Hello. How are you today? I haven't seen you for years. New haircut? It really suits you!");
talkEntry:addResponse("Oh! Good day! It's nice to meet you!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Hiho, wie kann ich Euch helfen? - Nein, sagt es nicht, ich weiß es schon, ihr wollt ein paar von meinen Fischen kaufen, nicht wahr?");
talkEntry:addResponse("Tach, tach. Wie geht's denn heute so? Ihr habt Euch ja ewig nich ansehen lassen. Neue Frisur? Steht euch gut zu Gesicht!");
talkEntry:addResponse("Oh! Guten Tach! Ist mir eine Freude Euch zu Begrüßen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("I hope we'll meet again soon.");
talkEntry:addResponse("Farewell and don't forget to tell your friends! 'Snorri sells the best fish in Galmair!'");
talkEntry:addResponse("Irmorom with you. May your beard grow until it reaches the ground.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschau");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Auf ein baldiges Wiedersehen.");
talkEntry:addResponse("Gehabt Euch wohl und berichtet es Euren Freunden! 'Snorri verkauft die besten Fische Galmairs!'");
talkEntry:addResponse("Irmorom sei mit dir. Möge dir der Bart bis zum Boden wachsen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("I hope we'll meet again soon.");
talkEntry:addResponse("Farewell and don't forget to tell your friends! 'Snorri sells the best fish in Galmair!'");
talkEntry:addResponse("Irmorom with you. May your beard grow until it reaches the ground.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Auf ein baldiges Wiedersehen.");
talkEntry:addResponse("Gehabt Euch wohl und berichtet es Euren Freunden! 'Snorri verkauft die besten Fische Galmairs!'");
talkEntry:addResponse("Irmorom sei mit dir. Möge dir der Bart bis zum Boden wachsen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("Oh, thanks for asking! And yes, I am perfectly fine.");
talkEntry:addResponse("I am fine. Thanks for asking.");
talkEntry:addResponse("Well, well, I can't complain.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befind");
talkEntry:addResponse("Oh, wie freundlich von Euch, das ihr mich danach fragt! Und ich will sagen, ja! Ja es geht mir ausgezeichnet.");
talkEntry:addResponse("Ausgezeichnet. Danke das ihr Euch danach erkundigt habt.");
talkEntry:addResponse("Gut, gut, ich will nun wirklich nichts beklagen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("I am Snorri. And the curmudgeon behind me is Morri. *laughs* He is my brother, you know?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ihr name");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Ich bin Snorri. Und der Griesgram, hinter mir heißt Morri. *lacht* Er ist mein Bruder, wusstet ihr das?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("I can't hire you, but if you want, I will buy every fish you bring to me. Just make sure it's all fresh. Be sure that I will smell it all very carefully!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Ich kann Euch nicht einstellen, aber sodar ihr wollt, kauf ich Euch allen Fisch ab den ihr mir bringt. Solange er frisch ist natürlich. Ich werd sorgfältig riechen, seid Euch gewiss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("I can't hire you, but if you want, I will buy every fish you bring to me. Just make sure it's all fresh. Be sure that I will smell it all very carefully!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Ich kann Euch nicht einstellen, aber sodar ihr wollt, kauf ich Euch allen Fisch ab den ihr mir bringt. Solange er frisch ist natürlich. Ich werd sorgfältig riechen, seid Euch gewiss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("I am a fishmonger. But sometimes I take my fishing rod and catch some fish on my own. What's your profession?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Ich bin Fischhändler. Aber manches Mal, kitzelt es mir in der Nase, dann nehm ich die Angel und fische selbst ein wenig. Was ist Euer Beruf?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("I am a fishmonger. But sometimes I take my fishing rod and catch some fish on my own. What's your profession?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Ich bin Fischhändler. Aber manches Mal, kitzelt es mir in der Nase, dann nehm ich die Angel und fische selbst ein wenig. Was ist Euer Beruf");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("I don't know any good news about Gobaith, do you?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Von Gobaith hört man nichts Gutes. Oder habt ihr etwas zu berichten?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("It's nice to meet you. Which fish you wanna buy?");
talkEntry:addResponse("Aye, do you wanna buy some fish?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Es ist mir eine Freude Euch kennen zu lernen. Welchen Fisch darf ich Euch denn verkaufen?");
talkEntry:addResponse("Aye, wollt ihr Fisch kaufen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("fish");
talkEntry:addTrigger("smell");
talkEntry:addTrigger("stink");
talkEntry:addResponse("#me sniffs pointedly. 'That's what a fresh fish should smell like!'");
talkEntry:addResponse("The freshest fish in all of Galmair. Even the cook of Don Valerio Guillianni buys his fish from Snorri!");
talkEntry:addResponse("By my beard, today's fish is fresh! Be careful or they might jump out of your bag!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("morri");
talkEntry:addTrigger("brother");
talkEntry:addResponse("Aye, Morri is my favourite brother.");
talkEntry:addResponse("I am very happy that Morri and I are able to have this market stall together.");
talkEntry:addResponse("Morri can be moody so it's my job to make him laugh again. *laughs* That's not easy as you think!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("orc");
talkEntry:addTrigger("krudash");
talkEntry:addTrigger("sogg");
talkEntry:addResponse("Aye, orcs, just two market stalls away. But whatever, we take what we can get.");
talkEntry:addResponse("In Galmair, money rules, and it seems these orcs are somehow able to get enough money to pay the taxes for their market stall.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dwarf");
talkEntry:addResponse("Aye, I am proud to be a dwarf! We are the smartest people and the most gifted craftsman");
talkEntry:addResponse("Gold, we dwarfs love it!");
talkEntry:addResponse("For a dwarf, his clan is the most important thing! May its wealth and size grow until eternity.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("nose");
talkEntry:addTrigger("stud");
talkEntry:addTrigger("spoud");
talkEntry:addResponse("#me rubs his nose. 'Aye, thats true. I broke it in a fight with an ogre. Now it's crooked, but I'll bet I can still smell an ogre 2 miles up wind!'");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("fisch");
talkEntry:addTrigger("riechen");
talkEntry:addTrigger("stinken");
talkEntry:addTrigger("gestank");
talkEntry:addTrigger("geruch");
talkEntry:addResponse("#me schnuppert demonstrativ: 'Hm-h. So muss Fisch riechen wenn er frisch ist. Riecht er anders, ist er verdorben.'");
talkEntry:addResponse("Der frischeste Fisch in ganz Galmair. Sogar der Koch von Don Valerio Guillianni kauft bei Snorri seine Fische ein.");
talkEntry:addResponse("Bei meinem Bart, heute ist mein Fisch wieder frisch! Aufgepaßt, heißt es nun! Sonst hüpfen sie direkt vor meiner Nase, auf die Straße und schnurstracks zurück ins Meer.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("morri");
talkEntry:addTrigger("bruder");
talkEntry:addTrigger("brüderchen");
talkEntry:addResponse("Aye, Morri ist mir von all meinen Brüdern der Liebste.");
talkEntry:addResponse("Es macht mich zutiefst glücklich, das Morri neben mir steht und wir den Marktstand gemeinsam betreiben.");
talkEntry:addResponse("Morri, hat manche Tage schlechte Laune. Und da ist es meine Aufgabe, als älterer Bruder, ihn auf zu heitern. *lacht* Das ist nicht immer so leicht, wie ihr Euch vielleicht denken könnt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ork");
talkEntry:addTrigger("krudash");
talkEntry:addTrigger("sogg");
talkEntry:addResponse("Aye, diese Orks, haben sich mit zwei Marktständen hier eingenistet. Was solls, sag ich, man muss das nehmen so wie's kommt.");
talkEntry:addResponse("Pfft. Über die Orks mache ich mir kaum Gedanken. So Irmorom will, geht ihnen Morgen das Geld aus, und der Don, setzt ihr grünes Hinterteil auf die Straße.");
talkEntry:addResponse("In Galmair bestimmt das Geld. Und diese Orks gaunern anscheinend genug zusammen um dem Don die beiden Marktschuppen zu bezahlen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("zwerg");
talkEntry:addResponse("Aye, ich bin sehr stolz ein Zwerg zu sein! Denn wir Zwerge sind das klügste Volk. Und in allen Künsten begabt.");
talkEntry:addResponse("Einem Zwerg ist sein Klan das wichtigste. Möge mein Klan Reichtum und Wohlstand bis in alle Jahre erfahren!");
talkEntry:addResponse("Gold, ja wir Zwerge lieben es. Und der gesamte Klan versucht es in tiefen Hallen zu häufen. Denn Einfluß und Macht gehen mit Wohlstand einher, das ist jedem bekannt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("nase");
talkEntry:addTrigger("zinken");
talkEntry:addTrigger("kolben");
talkEntry:addResponse("#me reibt sich an der Nase. 'Aye, das stimmt. Ich hab sie mir einst beim Kampf mit einem Oger gebrochen. Jetzt ist sie krumm aber ich wette, einen Oger rieche ich noch etliche Längen gegen den Wind!'");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addResponse("Aye, you talk about the wizard, right? Elvaine Morgan. He is the king in Runewick, at least I think so. Well anyway, as a fishmonger I don't have to worry about that.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Aye, ihr sprecht über diesen Zauberer nicht wahr? Elvaine Morgan. Ist der König in Runewick, hab ich mir sagen lassen. Oder wie war das? Naja, mit so etwas muss sich ein Fischhändler nicht abmühen");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Aye, you talk about the wizard, right? Elvaine Morgan. He is the king in Runewick, at least I think so. Well anyway, as a fishmonger I don't have to worry about that.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Aye, ihr sprecht über diesen Zauberer nicht wahr? Elvaine Morgan. Ist der König in Runewick, hab ich mir sagen lassen. Oder wie war das? Naja, mit so etwas muss sich ein Fischhändler nicht abmühen");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("You better not trust Runewick. Who knows what evil things they do in their towers. Any minute the sky might fall on our heads! But whatever, the longears will be the first to get hit.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Runewick, darf man nicht vertrauen. Wer kann schon sagen welches Unheil man dort in den Türmen zusammen braut. Und irgendwann fällt uns der Himmel auf den Kopf. Mir soll's recht sein, die Spitzohren sind dann die Ersten die's erwischt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Aye, don't tell anyone, but my brother Morri and I, we only pay half as much for our market stall as the otherrs. We played a trick on the Don, didn't we?");
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Aye, sagt's nicht weiter, aber mein Bruder Morri und ich, wir bezahlen nur Halb so viel für unseren Stand wie die anderen Händler. Da haben wir dem Don ein Schnippchen geschlagen, nicht wahr?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Those who have a problem in Galmair should talk with the Don. Valerio Guilianni! If you have a problem with the Don himself....Erm yes..better not get in the Don's way.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Wer in Galmair ein Problem hat, dem seis geraten sich an den Don zu wenden. Valerio Guilianni! Wenn man allerdings ein Problem mit dem Don selbst hat... *räuspert sich* nun seht zu, dass ihr dem Don nicht in die Quere kommt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Queen");
talkEntry:addResponse("Oh interesting. Did the princess finally become queen? I guess it won't be long before Cadomyr's treasury is gone.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königin");
talkEntry:addResponse("Sieh an, sieh an. Hat sich das Prinzeschen doch noch zur Königin gemaußert? Ich schätze mal, nun wird Cadomyrs Schatzkammer endgültig geleert.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Oh interesting. Did the princess finally become queen? I guess it won't be long before Cadomyr's treasury is gone.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Sieh an, sieh an. Hat sich das Prinzeschen doch noch zur Königin gemaußert? Ich schätze mal, nun wird Cadomyrs Schatzkammer endgültig geleert.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Cadomyr and its honour. *laughs* Their treasury is as empty as an ogre's head! Who can take them seriously? There is more trading skill in my pinky toe than in all of Cadomyr put together.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Cadomyr und seine Ehre. *lacht* Deren Schatzkammer ist seit Jahren leer! Wer kann die schon Ernst nehmen? In meinem kleinen Zeh, steckt mehr Handelsgeschick als ganz Cadomyr zusammen auf zu bringen vermag.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("albar");
talkEntry:addResponse("I don't know much about the human land. My brother and I come from Ironsiege. Do you know my home country?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("Ach, über die Länder der Menschen weiß ich nur wenig. Mein Bruder und ich entstammen dem weit entfernten Ironsiege. Kennt ihr meine Heimat?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addResponse("I don't know much about the human land. My brother and I come from Ironsiege. Do you know my home country?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("Ach, über die Länder der Menschen weiß ich nur wenig. Mein Bruder und ich entstammen dem weit entfernten Ironsiege. Kennt ihr meine Heimat?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("salkama");
talkEntry:addResponse("I don't know much about the human land. My brother and I come from Ironsiege. Do you know my home country?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Ach, über die Länder der Menschen weiß ich nur wenig. Mein Bruder und ich entstammen dem weit entfernten Ironsiege. Kennt ihr meine Heimat?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("ironsiege");
talkEntry:addResponse("Let me tell you, Ironsiege is an impregnable fortress. Describing the mountain's gates as 'impressive' isn't enough. They are THAAAAAT gigantic.");
talkEntry:addResponse("Well, in Ironsiege you will find three clans. The Goldaxeclan, the Ironheartclan and , last but not least, my clan. The Flinthammers! Arr!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ironsiege");
talkEntry:addResponse("Last Euch sagen, Ironsiege ist eine uneinnehmbare Festung. Allein die Tore im Berg als 'imposant' zu bezeichnen reicht nicht aus. So gigantisch, erscheinen sie.");
talkEntry:addResponse("Nun, in Ironsiege findet ihr hauptsächlich drei Klans. Den Goldaxtklan, den Eisenherzklan und zu guter letzt meinen Klan. Die Flinthämmer! Arr!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("Let me tell you, Irmorom made the dwarves out of rock. He got this rock from Ushara as a present. And thats all I want to know about the gods. Except...thank Adron for cheese and beer!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Last Euch sagen, Irmorom schuf einst die Zwerge aus einem Stück Felsen. Jenen hatte er von Ushara zum Geschenk bekommen. Und viel mehr möchte ich von den Göttern nicht wissen müssen. Außer...nun ja Adron sei's gedankt für Käse und Bier!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Adron");
talkEntry:addResponse("Drink! Let's drink a toast to Adron. Praise his beer and cheese.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Adron");
talkEntry:addResponse("Trinkt! Trinken wir auf Adron. Gepriesen sein Bier und Käse.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("Hail Irmorom. Protect my brother and my clan. Thanks be to you, because you created the dwarves.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("Heil Irmorom. Schütze meinen Bruder und unseren Klan. Gedankt sei dir, denn du bist der Zwergen Schöpfer.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("Honour to Ushara, mother of rock, stone and earth.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("Ehre dir, Mutter der Felsen, Steine und Erde.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("Aye, I get all these fish from the harbour.");
talkEntry:addResponse("Morri and I are brothers. We share this market stall. He may scowl but he is a nice guy.");
talkEntry:addResponse("Once I got fish from the harbour and I swear they were so fresh that I had to tie them up.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzÃ¤hl etwas");
talkEntry:addResponse("Aye, ich bekomm all die Fische jeden zweiten Tag, direkt vom Hafen.");
talkEntry:addResponse("Morri und ich sind Brüder. Und wir teilen uns den Marktschuppen. Auch wenn er so finster drein schaut, er ist ein netter Kerl.");
talkEntry:addResponse("Einmal, bekam ich einen Karren mit Fischen, vom Hafen, und ich schwöre bei meinem Bart, die Fische waren so frisch, ich musste sie mit Schnüren auf den Tisch fesseln, damit sie nicht weghüpfen konnten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Snorri");
talkEntry:addResponse("Aye. What fish do you wanna buy?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Snorri");
talkEntry:addResponse("Aye. Welchen Fisch wollt ihr kaufen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("Aye. thats good!");
talkEntry:addResponse("D'kraga...alright.");
talkEntry:addResponse("Fine, fine, fine, that's how it should be.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("Aye. Ist gut!");
talkEntry:addResponse("D'kraga... in Ordnung.");
talkEntry:addResponse("Fein-fein-fein, so soll alles sein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("If you change you mind, I'll be here.");
talkEntry:addResponse("Well, bad luck for me.");
talkEntry:addResponse("What a pity.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("Solltet Ihr es Euch anders überlegen... ich bin hier.");
talkEntry:addResponse("Damit muss ich mich wohl abfinden.");
talkEntry:addResponse("Ah! Das dachte ich mir bereits.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Aye. Everything's alright.");
talkEntry:addResponse("Hm-h. Do you wanna buy that big fish?");
talkEntry:addResponse("That's waht she said!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Aye. Alles klar.");
talkEntry:addResponse("Hm-h? Ihr wollt den großen Fisch da?");
talkEntry:addResponse("Wenn ihr das sagt, will ich zustimmen. *lacht*");
talkingNPC:addTalkingEntry(talkEntry);
end;
tradingNPC:addNotEnoughMoneyMsg("Du kannst dir das nicht leisten!", "You can not afford that!");
tradingNPC:addDialogClosedMsg("Danke, komm bald wieder!", "Thanks, come again!");
tradingNPC:addDialogClosedNoTradeMsg("Auf Bald!", "Farewell!");
tradingNPC:addWrongItemMsg("Das kaufe ich nicht.", "I'm not buying this.");
talkingNPC:addCycleText("#me fuchtelt mit einer Hand über den Tresen, dutzende Fliegen schwirren summend auf. Jedoch nach wenigen Augenblicken hocken sie sich wieder auf die Fische.", "#me shoos away the large quantities of flies that land on his fish.");
talkingNPC:addCycleText("#me dreht sich um und klatscht Morri eine Forelle an die Schulter. 'Hör auf den Leuten zu sagen, mein Fisch ist gammelig!'", "#me slaps Morri with a big large trout. 'Stop persuade people that my fish is rotten!'");
talkingNPC:addCycleText("Fisch! Frischer Fisch! Kommt ihr Leute und kauft frischen Fisch!", "Fish! Fresh Fish! Come and buy my fresh fish!");
talkingNPC:addCycleText("Frischester, schmackhafter Fisch! Ich hab die größten und feinsten Fische in ganz Galmair!", "The freshest, tastiest fish! I sell the best and biggest fish in Galmair!");
talkingNPC:addCycleText("#me wirft einen Blick über die Schulter, im nächsten Moment wirft einen zerfledderten Fisch in Morris Richtung. 'Der geht auf's Haus, Morri!", "#me throws an old, decayed fish at Morri. 'Thats for you!'");
talkingNPC:addCycleText("#me steckt einen Finger in den Bart und beginnt die Haare einzudrehen.", "#me combs his beard with his fingers.");
talkingNPC:addCycleText("#me beugt sich mit misstrauischem Gesichtsausdruck über einen Fisch und schnüffelt daran.", "#me bows over his fish and sniffs suspiciously.");
talkingNPC:addCycleText("#me wischt seine Hände an der Hose ab.", "#me wipes his hand on his trousers.");
talkingNPC:addCycleText("Der Fisch ist frisch! Aufgepasst, dass er nicht davon hüpft.", "The fish is fresh. Be careful or it might jump away!");
talkingNPC:addCycleText("#me nickt dem anderen Zwerg zu. 'Aye, Morri!'", "#me nods at the dwarf next to him. 'Aye, Morri!'");
tradingNPC:addItem(npc.base.trade.tradeNPCItem(51,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(72,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(73,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(92,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(50,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(355,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(556,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2459,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(51,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(72,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(73,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(92,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(50,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(355,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(556,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2459,"buySecondary"));
tradingNPC:addNotEnoughMoneyMsg("Du kannst dir das nicht leisten!", "You can not afford that!");
tradingNPC:addDialogClosedMsg("Danke, komm bald wieder!", "Thanks, come again!");
tradingNPC:addDialogClosedNoTradeMsg("Auf Bald!", "Farewell!");
tradingNPC:addWrongItemMsg("Das kaufe ich nicht.", "I'm not buying this.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(2);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Dieser NPC ist Snorri der Fischhändler.", "This NPC is Snorri the fishmonger.");
mainNPC:setUseMessage("Fasst mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut verwirrt.", "#me looks around confused.");
mainNPC:setEquipment(3, 2407);
mainNPC:setEquipment(9, 821);
mainNPC:setEquipment(10, 369);
tradingNPC:addNotEnoughMoneyMsg("Du kannst dir das nicht leisten!", "You can not afford that!");
tradingNPC:addDialogClosedMsg("Danke, komm bald wieder!", "Thanks, come again!");
tradingNPC:addDialogClosedNoTradeMsg("Auf Bald!", "Farewell!");
tradingNPC:addWrongItemMsg("Das kaufe ich nicht.", "I'm not buying this.");
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
--------------------------------------------------------------------------------
-- NPC Name: Advari Stonebog                                          Galmair --
-- NPC Job:  Trader                                                           --
--                                                                            --
-- NPC Race: dwarf                      NPC Position:  361, 266, 0            --
-- NPC Sex:  male                       NPC Direction: south                  --
--                                                                            --
-- Author:   Rincewind                                                        --
--                                                       easyNPC Parser v1.21 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (1, 361, 266, 0, 4, 'Advari Stonebog', 'npc.advari_stonebog', 0, 1, 1, 189, 182, 164, 217, 154, 123);
---]]

require("npc.base.basic")
require("npc.base.condition.chance")
require("npc.base.condition.language")
require("npc.base.consequence.inform")
require("npc.base.consequence.trade")
require("npc.base.talk")
require("npc.base.trade")
module("npc.advari_stonebog", package.seeall)

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
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Advari Stonebog the trader. Buy, sell, trade, Dwarf, Beer, Orcs, Name."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Advari Stonebog der Händler. kaufe, verkaufe, Handel, Zwerg, Bier, Orks, Name."));
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
talkEntry:addResponse("Greeted be.");
talkEntry:addResponse("Wealth and glory, friend.");
talkEntry:addResponse("Hail Irmorom.");
talkEntry:addResponse("Great day to be a dwarf!");
talkEntry:addResponse("This 'ere be me cottage. You want to buy some wares?");
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
talkEntry:addResponse("Hiho, Reisender.");
talkEntry:addResponse("Wohlstand und profitable Geschäfte, mein Freund.");
talkEntry:addResponse("Heil Irmorom.");
talkEntry:addResponse("Gr'duzk. - würde ich sagen und heißt so viel wie guten Tag.");
talkEntry:addResponse("H'druk g'har. Dies ist mein Schuppen. Wollt ihr was kaufen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Greeted be.");
talkEntry:addResponse("Wealth and glory, friend.");
talkEntry:addResponse("Hail Irmorom.");
talkEntry:addResponse("Great day to be a dwarf!");
talkEntry:addResponse("This 'ere be me cottage. You want to buy some wares?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Hiho, Reisender.");
talkEntry:addResponse("Wohlstand und profitable Geschäfte, mein Freund.");
talkEntry:addResponse("Heil Irmorom.");
talkEntry:addResponse("Gr'duzk. - würde ich sagen und heißt so viel wie guten Tag.");
talkEntry:addResponse("H'druk g'har. Dies ist mein Schuppen. Wollt ihr was kaufen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("G'hruk. Farewell.");
talkEntry:addResponse("Abundance and Wealth, my friend.");
talkEntry:addResponse("Arr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Gehabt Euch wohl.");
talkEntry:addResponse("Wohlstand und profitable Geschäfte, mein Freund.");
talkEntry:addResponse("Arr. N' schönen Tag noch.");
talkEntry:addResponse("G'hruk.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("G'hruk. Farewell.");
talkEntry:addResponse("Abundance and Wealth, my friend.");
talkEntry:addResponse("Arr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Gehabt Euch wohl.");
talkEntry:addResponse("Wohlstand und profitable Geschäfte, mein Freund.");
talkEntry:addResponse("Arr. N' schönen Tag noch.");
talkEntry:addResponse("G'hruk.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("Aye, the business is well. And the Greennoses behave properly.");
talkEntry:addResponse("Arr, as soon as I'm able to leave my shop, I am going to drink beer at Hagar's Inn. He is a Longleg, but the stuff is brewed by us dwarves!");
talkEntry:addResponse("Gold. Tha'ts what a dwarf aspire. And I got a huge amount of it.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befind");
talkEntry:addResponse("Aye, das Geschäft geht gut, und die Grünschnauzen benehmen sich einigermaßen.");
talkEntry:addResponse("Arr, wenn ich einmal hier wegkomm, geh ich sofort zu Hagar! Der ist zwar ein Langbein, aber das Bier, das haben wir Zwerge ihm gebraut!");
talkEntry:addResponse("Gold. Das ist was ein Zwerg will. Und ich hab eine Menge davon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("Arr, just mellow dwarves tell their real name. And someone like you would just yell it out to everyone. But in common language I'm called Advari Stonebog");
talkEntry:addResponse("Advari Stonebog. And that's all someone like you need to know.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ihr name");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Arr, nur Weichzwerge verraten ihren wahren Namen. Wer weiß wem, einer wie du, ihn erzählen würde! Aber in der allgemeinen Sprache heiße ich Advari Stonebog.");
talkEntry:addResponse("Advari Stonebog. Und mehr braucht einer wie du, nicht zu wissen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("I don't got no tasks for yer. Better ask the Don, aye?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Ich hab keine Arbeit für dich, frag lieber den Don. Aye?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("I don't got no tasks for yer. Better ask the Don, aye?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Ich hab keine Arbeit für dich, frag lieber den Don. Aye?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("Seeds're my business. If ye be a farmer, I'm your dwarf; I've got everythin' ye need! On top o' that, I keep an eye on these pignoses over there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Ich handle mit Saatgut. Wenn du ein Bauer bist, bist du bei mir richtig. Ich verkauf dir alles was du brauchst. Aye. Und außerdem pass ich auf, dass die Grünschnauzen dort drüben keinen Unsinn treiben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("I trade with seeds. If you're n'farmer, I'm the fitting man for you - I'll sell you everything you need!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Ich handle mit Saatgut. Wenn du ein Bauer bist, bist du bei mir richtig. Ich verkauf dir alles was du brauchst. Aye. Und außerdem pass ich auf, dass die Grünschnauzen dort drüben keinen Unsinn treiben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Gobaith? No idea what you're chattin'!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Gobaith? Drhg'hgin! So spricht niemand über meine Großmutter! Verzieh dich!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("Aye, ye pillownosed pillock.");
talkEntry:addResponse("A true dwarf never shares 'is name!");
talkEntry:addResponse("I'll remember that, we dwarves've got an great memories, as long as there's money involved.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Aye, du Weichnase.");
talkEntry:addResponse("Schön für Euch. Aber ein ordentlicher Zwerg würde nie seinen wahren Namen verraten.");
talkEntry:addResponse("Sehr genehm. Werd ich mir merken! Wie Zwerge haben ein ausgezeichnetes Gedächtnis. Und ich werd's nicht vergessen solltest du versuchen mich übers Ohr zu hauen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Dwar[vf]");
talkEntry:addResponse("Dwarves are the proudest people! Formidable fighters! Masterful masons! Seasoned Smiths! The most breathtaking of bards!");
talkEntry:addResponse("Hi dwarf, hey dwarf - hi dwarf ho! Hi dwarf, hey dwarf go-go-go!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("or[ck]");
talkEntry:addResponse("Arr the don gave two market stalls to the pignoses. Now I 'ave to keep an eye on 'em.");
talkEntry:addResponse("You see that orc over there? Tha's J'uk. He slacks off all day, guzzling up his own goods. The beer tastes like piss; can't think where he got it - not from any dwarf, that's for sure.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("name");
talkEntry:addResponse("A true dwarf like me... doesn't tell his name to everybody. This defends us dwarves against dark curses an' other nancy magic hexes.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("hagar");
talkEntry:addTrigger("wernson");
talkEntry:addResponse("Dwarves brew his beer. Lucky for him, otherwise noone'd go to the Winged Sow.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("gold");
talkEntry:addResponse("#me starts to sing with a deep throaty voice.'Gooold! Gold, Gold, Gold. Gold... Gold, Gold, Gold!'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beer");
talkEntry:addResponse("Aye, the best beer is sold at Hagar Wernson Inn - The Winged Sow . Go there before you try the piss that orc sells. I wouldn't touch his stuff if they were healing potions and I 'ad an axe in me shoulder!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("zwerg");
talkEntry:addResponse("Wir Zwergenvolk habens ganz dicke hinter den Ohren. Furchteinflößende Krieger! Meisterhafte Steinmätze! Die großartigsten Schmiede! Die berühmtesten Poeten und Barden!");
talkEntry:addResponse("Hey Zwerge, hey Zwerge - hey Zwerge ho! Hey Zwerge, hey Zwerge go-go-go!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("or[ck]");
talkEntry:addResponse("Arr, der Don hat ganze zwei Marktstände an die Schweineschnauzen verpachtet! Jetzt darf ich aufpassen, was sie treiben.");
talkEntry:addResponse("Siehste den Ork, gegenüber? J'uk, der lümmelt den ganzen Tag rum und säuft die eigene Wahre weg. Das Bier schmeckt wie Pisse, frag mich nicht wo er das her hat. Jedenfalls nicht von uns Zwergen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("name");
talkEntry:addResponse("N' ordentlicher Zwerg wie ich, isses nich so, der verrät seinen wahren Namen keinem. Das schützt uns Zwerge vor bösem Zauber-Firlefanz. Und so Schnik-Schnak, verstehste?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hagar");
talkEntry:addTrigger("wernson");
talkEntry:addResponse("Arr, Hager hat ne gute Taverne. Gut für ein Langbein, natürlich. Er wird von uns Zwergen mit Getränken beliefert. Glück für ihn, sonst würde wohl niemand beim ihm saufen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gold");
talkEntry:addResponse("#me fängt mit kehliger tiefer Stimme an zu singen. 'Gooold! Gold, Gold, Gold. Gold... Gold, Gold, Gold!'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bier");
talkEntry:addResponse("Aye, das beste Bier in Galmair verkauft Hagar Wernson in der Taverne zur geflügelten Sau. Die Pisse die der Ork gegenüber verkauft würd ich nicht mal trinken, wenns nen heilender Trunk wär und mir ne Axt in der Schulter steckt!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addResponse("Arr. As every dwarf knows, magic is nonsense and it's a danger t' public safety! This Elvaine Morgan should listen to us dwarves!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Arr. Jeder Zwerg weiß natürlich, daß Magie gemeingefährlicher Firlefanz ist! Und dieser Elvaine Morgan täte gut daran auf uns Zwerge zu hören!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Arr. As every dwarf knows, magic is nonsense and it's a danger t' public safety! This Elvaine Morgan should listen to us dwarves!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Arr. Jeder Zwerg weiß natürlich, daß Magie gemeingefährlicher Firlefanz ist! Und dieser Elvaine Morgan täte gut daran auf uns Zwerge zu hören!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("A cesspool of sin how I see it! They toy around with magic there. Can't take that lightly! Hopefully they blow themselves up, the fools.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Drhg'hgin! Ein Sündenpfuhl wenn ihr mich fragt. Dort spielen sie mit Magie herum. Da versteh ich keine Scherze! Sollen sie sich selbst in die Luft sprengen, D'rkza...Narren.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Aye the Don is Law. Don't try and mess with 'im, he's the richest dwarf 'ere... could be the last thing you ever do.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Aye, der Don ist das Gesetz hier. Leg dich besser nicht mit ihm an. Er ist der reichste Zwerg hier... könnte das letzte sein was ihr getan habt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Galmair, Galmair! That's the name. Here's we 'ave best stone and rich dwarves are respected properly. What a life! Praise Irmorom!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Galmair, Galmair! So ist der Nam. Hier gibst die größten Schätze im Boden. Und ein reicher Zwerg ist wohl angesehn. So läst's sich leben. Gedankt sei's Irmorom!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("queen");
talkEntry:addResponse("Dwarves don't care about 'blue' blood! Wealth is what brings you prestige. Big rich empires are the ones who truly rule!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("königin");
talkEntry:addResponse("Kra'gstuck! Wir Zwerge halten nichts vom 'blauen' Blut! Wohlstand ist's was Ansehen bringt. Große reiche Clans, die haben bei uns das Sagen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Rosaline");
talkEntry:addTrigger("Edwards");
talkEntry:addResponse("Dwarves don't care about 'blue' blood! Wealth is what brings you prestige. Big rich empires are the ones who truly rule!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Kra'gstuck! Wir Zwerge halten nichts vom 'blauen' Blut! Wohlstand ist's was Ansehen bringt. Große reiche Clans, die haben bei uns das Sagen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Cadomyr? They're ruled by that underbred brat, aren't they? She doesn't 'ave the foggiest idea about business. Aye, in dwarven society only the cleverest brains rule the land.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Cadomyr? Die werden doch von so einer verzogenen Göre regiert. Wenn ihr mich fragt, hat die keine Ahnung von Geschäften. Bei uns Zwergen, ja-ja, da haben nur die klügsten Köpfe was zu sagen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("albar");
talkEntry:addResponse("You want to chat about Albar? A well placed dwarf has no busniess over there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("Über Albar wollt ihr sprechen? Ich bitte Euch, ich bin ein angesehener Zwerg und hab dort tunlichst, nichts zu tun.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addResponse("Gynk, aye! There are mines there! Not ones comparable to the mines of the dwarves, mind and they're filled with swindlers, but what else would you expect from longlegs?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("Gynk, ja-ja! Dort gibt's Minen! Natürlich nicht mit unseren zu vergleichen und alles voll mit Betrügern, aber was soll man von den Menschen schon besseres erwarten?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Sunny, shiny Salkamar. Too many wizards there for my liking! Even thinkin' about it makes me eyes sore. That place ain't made for us dwarves.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Sonniges, leuchtendes Salkamar. Überfüllt mit Magier-Pöbel. Wenn ich nur daran denke, reibt's mir in den Augen. Für so ein Land hat uns Irmorom nicht geschaffen. Nein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("Irmorom, father of dwarves - and Ronagan protect my pocket against larcenous halblings and treacherous humans.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Irmorom, der Vater der Zwerge und ihr Ronagan, schützt mich vor langfingrigen Halblingen und betrügerischen Menschen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("Hail Irmorom! Respect my clan, deep down in our stone halls. They may be far away, but noone could ever seperate us.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("Heil Irmorom. Schütze meinen Clan, in seinen Hallen aus Stein. Weit sind sie weg, doch kann man uns niemals trennen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("Aye, I give a good chunk of what I earn to the Lord of shadows. Should keep me untroubled by thieving scum! Arr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("Aye, ich opfere einen guten Teil meiner Einkünfte dem Schattengott. So sorgt er dafür, dass ich vom diebischen Gesindel verschont bleibe! Arr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("I'm in charge of the seeds of Galmair. A very important task, reserved only for the best man!");
talkEntry:addResponse("Arr. I make sure those damned pigfaces don't mess the market. They ain't that clever are they?");
talkEntry:addResponse(" Praise Irmorom and thank Ronagan the past week went so will. Not a single thief around. Arr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Ich verwalte das Saatgut von Galmair. Eine äußerst wichtige Aufgabe. Die der Don, nur den fähigsten Männern anvertraut.");
talkEntry:addResponse("Arr. Ich pass auf das die Schweineschnauzen, hier am Markt, keinen Unsinn treiben! Sind ja so wie so nicht die klügsten, nicht wahr?");
talkEntry:addResponse("Gepriesen sei Irmorom, und gedankt sei's Ronagan. Die letzte Woche lief ausgezeichnet, und kein einziger Langfinger in der Nähe. Arr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("advari");
talkEntry:addTrigger("stonebog");
talkEntry:addResponse("Arr, pillownose! You think that's my real name? Whatever... you want to sell somethin'?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("advari");
talkEntry:addTrigger("stonebog");
talkEntry:addResponse("Arr, Weichzwerg! So denkt Ihr das ich heiß, nicht war? Wie auch immer. Was wollt Ihr handeln?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("Aye. I agree!");
talkEntry:addResponse("Arr, that's the way I like it!");
talkEntry:addResponse("Arrr! Tell me about it!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("Aye. Da stimm ich zu!");
talkEntry:addResponse("Arr, so gefällt mir das!");
talkEntry:addResponse("Aargk... - sprich was ist's?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("Well, well. An old dwarf like meself 'as to take one for the team.");
talkEntry:addResponse("If that's the way you want it...");
talkEntry:addResponse("I can bear it. Hopefully you can too.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("Fein-fein. Ein alter Zwerg wie ich findet sich einfach damit ab.");
talkEntry:addResponse("Wenn's ihr so wollt.");
talkEntry:addResponse("Damit kann ich leben. Ich hoffe, ihr auch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Aye, is that so? Never heard about it.");
talkEntry:addResponse("#me gives a throaty chuckle, running his fingers through his beard.");
talkEntry:addResponse("Well, well!");
talkEntry:addResponse("Arrr!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Aye, ist das so? Das ist mir neu.");
talkEntry:addResponse("#me lacht kehlig und streicht sich über den Bart. 'Na gut, ist ja gut.'");
talkEntry:addResponse("Arr!");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me singt mit kehliger Stimme. 'Hai-hie! Hai-hoh. Hai-hi! Hai-ho! Hai-ho-ho! Hai-hi! Hai-ho!'", "#me starts to sing with a throaty voice. 'Hi ho! Hi hah! Hi ho! Hi Hah!'");
talkingNPC:addCycleText("#me streicht sich zufrieden lächelnd über den langen buschigen Bart.", "#me runs his fingers through his long, fluffy beard, grinning quietly.");
talkingNPC:addCycleText("#me kaut auf seiner Pfeife herum. Gelegentlich stopft er etwas Kraut nach.", "#me chews the tip of his pipe. Once every so often he stuffs some more tobacco in.");
talkingNPC:addCycleText("#me bläst einen großen Rauchring in die Luft, und gluckst glücklich.", "#me releases a large smoke ring into the air and chuckles in high spirits.");
talkingNPC:addCycleText("Langfinger fressen die Galgenvögel! Last's Euch sagen! Aye.", "Let thieves be eaten by giant demonic birds! Aye!");
talkingNPC:addCycleText("#me knurrt etwas Unverständliches in seinen Bart, indessen funkelt er die Orkfrau beim Schuppen mit verärgertem Blick an.", "#me mumbles and snarls into his beard, sternly glancing towards the orcess at the next market stall.");
talkingNPC:addCycleText("Arr...", "Arr...");
talkingNPC:addCycleText("Ich verkauf die schönsten Fälle zu den besten Preisen!", "I sell the finest fur at the best prices!");
talkingNPC:addCycleText("Frische Schafsmilch! Leute, kommt her und kauft bei mir ein!", "Fresh milk from sheep, come closer have a look!");
talkingNPC:addCycleText("Dort, edle Dame! Kauft mir leckere Früchte ab! Die besten Früchte Galmairs verkaufe ich.", "Over there, good maiden! Buy tasty fruit! The best fruit in all of Galmair are sold at this stall!");
talkingNPC:addCycleText("#me verengt die Augen und betrachtet einen Moment lang misstrauisch den Ork gegenüber.", "#me narrows his eyes towards the orc at the opposite market stall.");
talkingNPC:addCycleText("Ha'ak! Ga strak ja'ada! Arr.", "Ha'ak! Ga strak ja'ada! Arr.");
tradingNPC:addItem(npc.base.trade.tradeNPCItem(51,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(126,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(258,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(271,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(69,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2547,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2586,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(154,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(200,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(201,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(290,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(249,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(259,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(772,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(778,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2493,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(15,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(80,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(81,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(147,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(151,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(199,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(302,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(388,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2502,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(259,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(291,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(534,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(728,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(773,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(779,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2494,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2917,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(307,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(552,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(553,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2934,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(51,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(126,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(258,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(271,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(69,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2547,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2586,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(154,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(200,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(201,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(290,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(249,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(259,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(772,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(778,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2493,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(15,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(80,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(81,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(147,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(151,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(199,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(302,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(388,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(330,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(259,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(291,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(534,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(728,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(773,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(779,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2494,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2917,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(307,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(552,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(553,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2934,"buySecondary"));
tradingNPC:addNotEnoughMoneyMsg("Oh, ich fürchte Ihr könnt Euch das nicht leisten.", "Oh, I fear, you can not afford that.");
tradingNPC:addDialogClosedMsg("Vielen Dank, beehrt mich bald wieder!", "Thank you, please come again!");
tradingNPC:addDialogClosedNoTradeMsg("Auf Bald!", "Farewell!");
tradingNPC:addWrongItemMsg("Das kaufe ich nicht.", "I'm not buying this.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(2);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Ein ergrauter Zwerg. In seinem Mundwinkel steckt eine verzierte Pfeife und kleine Rauchwölkchen umgeben ihn.", "A gnarled old dwarf. He puffs away at an ornate pipe, shrouding him in a small cloud of smoke.");
mainNPC:setUseMessage("Fass mich nicht an!", "Hands off!");
mainNPC:setConfusedMessage("#me schaut dich verwirrt an.", "#me glances around obliviously.");
mainNPC:setEquipment(3, 2390);
mainNPC:setEquipment(4, 48);
mainNPC:setEquipment(9, 2116);
mainNPC:setEquipment(10, 326);
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
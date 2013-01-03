--------------------------------------------------------------------------------
-- NPC Name: Morri                                                    Galmair --
-- NPC Job:  Trader                                                           --
--                                                                            --
-- NPC Race: dwarf                      NPC Position:  353, 266, 0            --
-- NPC Sex:  male                       NPC Direction: south                  --
--                                                                            --
-- Author:   Rincewind                                                        --
--                                                       easyNPC Parser v1.21 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (1, 353, 266, 0, 4, 'Morri', 'npc.morri', 0, 0, 2, 22, 12, 34, 217, 154, 123);
---]]

require("npc.base.basic")
require("npc.base.condition.chance")
require("npc.base.condition.language")
require("npc.base.consequence.inform")
require("npc.base.consequence.trade")
require("npc.base.talk")
require("npc.base.trade")
module("npc.morri", package.seeall)

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
talkEntry:addResponse("I am selling different meals, just have a look!");
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
talkEntry:addResponse("Ich verkaufe verschiedenstes Essen schau dich nur um!");
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Morri the cook. Keywords: buy, sell, trade, Profession."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Morri der Koch. Schlüsselwörter: kaufe, verkaufe, Handel, Beruf."));
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
talkEntry:addResponse("Hrm...Greetings. How can I help you?");
talkEntry:addResponse("#me grumbles moodily: 'Good day'.");
talkEntry:addResponse("Hail Irmorom. Do you want to buy something?");
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
talkEntry:addResponse("Hrm...Grüße. Wie kann ich Euch helfen?");
talkEntry:addResponse("#me brummt schlecht gelaunt: 'Guten Tag.'");
talkEntry:addResponse("Heil Irmorom. Wollt ihr was kaufen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Hrm...Greetings. How can I help you?");
talkEntry:addResponse("#me grumbles moodily: 'Good day'.");
talkEntry:addResponse("Hail Irmorom. Do you want to buy something?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Hrm...Grüße. Wie kann ich Euch helfen?");
talkEntry:addResponse("#me brummt schlecht gelaunt: 'Guten Tag.'");
talkEntry:addResponse("Heil Irmorom. Wollt ihr was kaufen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Bye and enjoy your meal.");
talkEntry:addResponse("Arr... See you soon.");
talkEntry:addResponse("Fare thee well and come again soon!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Tschüss und guten Appetit.");
talkEntry:addResponse("Arr... Bis bald.");
talkEntry:addResponse("Gehabt Euch wohl und kommt wieder mal bei mir vorbei!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Bye and enjoy your meal.");
talkEntry:addResponse("Arr... See you soon.");
talkEntry:addResponse("Fare thee well and come again soon!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Tschüss und guten Appetit.");
talkEntry:addResponse("Arr... Bis bald.");
talkEntry:addResponse("Gehabt Euch wohl und kommt wieder mal bei mir vorbei!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("Great and how are you?");
talkEntry:addResponse("I'm fine, thanks!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befind");
talkEntry:addResponse("Großartig und wie gehts dir?");
talkEntry:addResponse("Mir gehts gut, dankie!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("I am Morri the cook.");
talkEntry:addResponse("The best cook in Galmair, that's me Morri!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ihr name");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Ich bin Morri der Koch.");
talkEntry:addResponse("Der beste Koch in Galmair, das bin ich Morri!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("I don't employ anyone, ask someone else!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Ich stelle niemanden ein, fragt jemand anderen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("I don't employ anyone, ask someone else");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Ich stelle niemanden ein, fragt jemand anderen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("Actually, I am a cook. For a few years I have cooked at my cousin's tavern. But now I am dealing with all kinds of food here in Galmair. What is your daily task?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Eigentlich bin ich Koch. Hab einige Jahre groß und fein in meines Vettern Taverne gekocht. Nun handle ich mit allerlei Essbarem hier in Galmair. Was ist Euer Tagwerk?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("Actually, I am a cook. For a few years I have cooked at my cousin's tavern. But now I am dealing with all kinds of food here in Galmair. What is your daily task?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Eigentlich bin ich Koch. Hab einige Jahre groß und fein in meines Vettern Taverne gekocht. Nun handle ich mit allerlei Essbarem hier in Galmair. Was ist Euer Tagwerk?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("There is nothing but bad news about Gobaith. What do you say to that?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Über Gobaith gibts immer nur schlechte Nachricht. Was habt ihr darüber zu sagen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("Well, what can I sell you?");
talkEntry:addResponse("Arr. Do you want to buy some food?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Is' recht. Was darf ich Euch verkaufen?");
talkEntry:addResponse("Arr. Wollt ihr Essen einkaufen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("orc");
talkEntry:addResponse("Arr. Those greennoses are annyoing. - Every last one of them. Actually, we merchants have to stick together. It is all about business!");
talkEntry:addResponse("These orcs are smarter than you think. Particularly Krudash! But Sogg, I haven't ever seen him sober.");
talkEntry:addResponse("Arrr.... I don't know. I think it looks like the entire orc pack here in Galmair belongs to the same clan. But on the other hand,well... I don't know whether that's important.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dwarf");
talkEntry:addResponse("What is important to a dwarf? Gold, business and sin-...no. Relatives. Therefore, the clan.");
talkEntry:addResponse("What does a dwarf like? His craft, his wife and his beer.");
talkEntry:addResponse("We dwarves are a proud folk. I have to warn you, never insult a dwarf! He will remember even after his sons have grown up.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ork");
talkEntry:addResponse("Arr. Die Grünschnauzen sind ein Ärgernis. - Nicht's weiter. Im Grunde müssen wir Händler zusammen stehen. Es geht ums Geschäft, das ist was zählt!");
talkEntry:addResponse("Diese Orks sind klüger als Ihr denkt. Im besonderen diese Krudash! Aber dieser Sogg, den hab ich noch nie nüchtern gesehen...");
talkEntry:addResponse("Arrr... ich weiß nicht. Aber für mich sieht's so aus als wären die alle, die Ganze Orkmeute in Galmair von der selben Sippe. Andererseits muss das bei Orks ja auch nichts heißen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("zwerg");
talkEntry:addResponse("Was ist einem Zwerg von Wert? Gold, Geschäfte und Ge-...nein. Verwandte. Also sprich, der Klan.");
talkEntry:addResponse("Was darf ein Zwerg lieben? Sein Handwerk, seine Frau und Bier.");
talkEntry:addResponse("Wir Zwerge sind ein stolzes Folk. Ich will euch warnen, beleidigt ihr einen Zwerg wird er sich noch daran erinnern wenn Eure Söhne erwachsen sind.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addResponse("Ha-ha! I've heard that archmage wears women's clothes! Wool under the chain mail undies and so on! *laughs*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Ha-h! Man sagt sich bei uns Zwergen dieser Erzmagier trägt Weiber-Gewand! Wolle unterm Kettenhemd und so nen Kram! *lacht*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Ha-ha! I've heard that archmage wears women's clothes! Wool under the chain mail undies and so on! *laughs*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Ha-h! Man sagt sich bei uns Zwergen dieser Erzmagier trägt Weiber-Gewand! Wolle unterm Kettenhemd und so nen Kram! *lacht*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Runewick? Aren't those the farmers who bungle with magic? They should cultivate bigger tomatoes instead. That is more useful.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Runewick? Sind das nicht diese Bauern, die glauben mit Magie herum murksen zu müssen?. Die sollten lieber größere Tomaten züchten. Damit wäre allen geholfen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Don Guilianni is a nasty fellow. We merchants cut our deals with him carefully.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Don Guilianni ist ein abgebrühter Geschäftsmann. Und wir Händler versuchen uns so gut es geht mit ihm zu arrangieren.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("I want to say, my brother and I could not find a better place than this except for all the riff-raff. Well, and the buildings are falling down, but the business is great.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Ich möchte sagen, an einen besseren Ort hätte es mich und meinen Bruder nicht verschlagen können. Nun gut, hier treibt sich einiges Gesindel herum, und die Mauern sehen ziemlich zerbrechlich aus, aber das Geschäft geht ausgezeichnet!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Queen");
talkEntry:addResponse("Blue blood! Pah! - Bring the human royalty under my axe and I'll show you how blue it is. I tell you, they die just like anyone else! I have seen too many fools on the throne!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königin");
talkEntry:addResponse("Blaues Blut! Pha! - Bringt mir diese Könige der Menschen vor meine Axt und ich demonstriere Euch wie blau es ist. Ich sage Euch, beim sterben ist jeder der Erste! Zu viele Narren hab ich auf dem Thron gesehn!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Blue blood! Pah! - Bring the human royalty under my axe and I'll show you how blue it is. I tell you, they die just like anyone else! I have seen too many fools on the throne!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Blaues Blut! Pha! - Bringt mir diese Könige der Menschen vor meine Axt und ich demonstriere Euch wie blau es ist. Ich sage Euch, beim sterben ist jeder der Erste! Zu viele Narren hab ich auf dem Thron gesehn!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("They give their wealth and belongings to the dead in Cadomyr. Bury their gold in their crypts! Every dwarf knows that gold is an element for the living. How is it of any use to the dead?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Cadomyrs Reichtum geben sie den Toten. Vergraben das Gold in den Krypten! Jeder Zwerg weiß natürlich, das Gold das Element der Lebenden ist. Wie sollte es den verstorbenen schon von Nutzen sein?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("albar");
talkEntry:addResponse("Albar! A terrible county. Ruled by jesters. The people are weak and their kings treat them like livestock.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("Albar! Ein schreckliches Land. Regiert von Narren. Das Volk ist schwach, es ist den Königen kaum mehr wert als die Schweine die sie fressen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addResponse("Gynk! Everyone meets there. What a market! You can find anything there! If only dwarves would not waste their money on drinks and games... *sighs*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("Gynk! Hier trifft sich alles Volk, das der Sprache mächtig ist. Sicher, da kann viel passieren, aber einen Markt gibt es dort! Würden die Zwerge dort nicht alles Geld versaufen und verspielen... *seufzt*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Salkamar? In Salkamar 4 out of 5 people claim to be smarter than everyone else. Smart, isn't it? *laughs*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Salkamar? In Salkamar behaupten 4 von 5 Leuten, sie sind klüger als der durchschnittliche Bürger. Clever nicht war? *lacht*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ironsiege");
talkEntry:addResponse("Listen to me, Ironsiege is an impregnable fortress. Saying the gates in the mountain are 'impressive' is an understatement. They are gigantic!");
talkEntry:addResponse("Well, you can find mainly three clans in Ironsiege. The Goldaxeclan, the Ironaxeclan, and last but not least my clan. The Flinthammer! Arr!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ironsiege");
talkEntry:addResponse("Last Euch sagen, Ironsiege ist eine uneinnehmbare Festung. Allein die Tore im Berg als 'imposant' zu bezeichnen reicht nicht aus. So gigantisch, erscheinen sie.");
talkEntry:addResponse("Nun, in Ironsiege findet ihr hauptsächlich drei Klans. Den Goldaxtklan, den Eisenherzklan und zu guter letzt meinen Klan. Die Flinthämmer! Arr!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("Listen to me, Irmorom created the dwarves out of a rock. He got this rock as a gift from Ushara. I don't want to know more about gods. Except...well, Adron should be praised for cheese and beer!");
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
talkEntry:addResponse("Toast! Toast to Adron. Praised be his beer and cheese.");
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
talkEntry:addResponse("Hail Irmorom. Protect my brother and his clan. Be praised, the creator of the dwarfs.");
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
talkEntry:addResponse("Honor to you, mother of the rock, stone and soil.");
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
talkEntry:addResponse("I could tell you a lot about cooking, but sadly I'm really busy right now.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Ich könnte dir eine Menge über das Kochen erzählen, aber ich bin im Moment leider sehr beschäftigt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("morri");
talkEntry:addResponse("Arr. Bura'zak-ka! - Welches Essen wollt Ihr mir abkaufen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("morri");
talkEntry:addResponse("Arr. Bura'zak-ka! - What meal would you like to buy?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("Arr. It's good.");
talkEntry:addResponse("D'kraga...so, and not otherwise!");
talkEntry:addResponse("It should be fine by me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("Arr. Ist gut!");
talkEntry:addResponse("D'kraga... so, und nicht anders!");
talkEntry:addResponse("Mir soll's auch recht sein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("Hrm, is this your last word?");
talkEntry:addResponse("Arr. If that's what you want..");
talkEntry:addResponse("Of course.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("Hrm, ist das Euer letztes Wort?");
talkEntry:addResponse("Arr. Wenn Ihr's so wollt.");
talkEntry:addResponse("Natürlich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Arr.");
talkEntry:addResponse("#me wrinkles his nose and shows his tongue in disgust: 'Do you smell that too?'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Arr.");
talkEntry:addResponse("#me rümpft die Nase und streckt angewidert die Zunge heraus: 'Riecht ihr das auch?'");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me brummt schlecht gelaunt und wirft einen missmutigen Blick auf die Straße.", "#me grumbles moodily and looks at the street with a discontented glance.");
talkingNPC:addCycleText("#me knurrt kopfschüttelnd: 'Dieser Fisch ist niemals frisch...'", "#me grumbles and shakes his head: 'This fish is not fresh...'");
talkingNPC:addCycleText("#me rümpft die Nase.", "#me wrinkles his nose.");
talkingNPC:addCycleText("#me hält sich die Nase zu und streckt die Zunge heraus: 'Igittigitt!'", "#me covers his nose and shows his tongue: 'Igittigitt!'");
talkingNPC:addCycleText("#me fasst sich mit einer verzweifelt wirkenden Geste, beidhändig in den langen schwarzen Bart und zieht daran. Dabei gibt er ein lautes Grunzen von sich.", "#me pulls his long black beard with both hands despairingly and grunts loudly.");
talkingNPC:addCycleText("Essen! Feinste Gerichte aller Art! Tretet näher und deckt Euch ein!", "Food! Finest dishes of every kind! Come closer and buy ahead!");
talkingNPC:addCycleText("Frisches Brot! Schmackhafte Kuchen! Unverwüstliche Kekse!", "Fresh bread! Tasty cakes! Inedible cookies!");
talkingNPC:addCycleText("Wurst mit Zwiebeln, Kohlsuppe, Hasenbraten! Bei mir könnt ihr alles kaufen!", "Sausages with onion, cabbage soup, rabbit dishes! You find everything here!");
tradingNPC:addItem(npc.base.trade.tradeNPCItem(51,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(118,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(121,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(227,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2495,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(306,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(554,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(555,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(556,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(557,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(559,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2276,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2277,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2278,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2456,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2459,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2922,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2923,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2940,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(3051,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(5,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2529,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(49,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(191,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(303,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(353,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(354,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(453,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(454,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(51,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(118,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(121,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(227,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2495,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(306,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(554,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(555,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(556,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(557,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(559,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2276,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2277,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2278,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2456,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2459,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2922,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2923,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2940,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(3051,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(5,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2529,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(49,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(191,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(303,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(353,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(354,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(453,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(454,"buySecondary"));
tradingNPC:addNotEnoughMoneyMsg("Du kannst dir das nicht leisten!", "You can not afford that!");
tradingNPC:addDialogClosedMsg("Danke, komm bald wieder!", "Thanks, come again!");
tradingNPC:addDialogClosedNoTradeMsg("Auf Bald!", "Farewell!");
tradingNPC:addWrongItemMsg("Das kaufe ich nicht.", "I'm not buying this.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(2);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Ein grimmiger Zwerg mit einem prächtigen schwarzen Bart und einem kahlem Kopf.", "A serious looking dwarf with an impressive black beard and a bald head.");
mainNPC:setUseMessage("Fasst mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut verwirrt.", "#me looks around confused.");
mainNPC:setEquipment(3, 101);
mainNPC:setEquipment(9, 2111);
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
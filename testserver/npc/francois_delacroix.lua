--------------------------------------------------------------------------------
-- NPC Name: Francois Delacroix                                      Runewick --
-- NPC Job:  trader                                                           --
--                                                                            --
-- NPC Race: human                      NPC Position:  911, 798, 1            --
-- NPC Sex:  male                       NPC Direction: north                  --
--                                                                            --
-- Author:   Regallo                                                          --
--                                                       easyNPC Parser v1.22 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (0, 911, 798, 1, 0, 'Francois Delacroix', 'npc.francois_delacroix', 0, 0, 0, 255, 255, 255, 255, 255, 255);
---]]

require("npc.base.basic")
require("npc.base.condition.language")
require("npc.base.consequence.inform")
require("npc.base.consequence.trade")
require("npc.base.talk")
require("npc.base.trade")
module("npc.francois_delacroix", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
local tradingNPC = npc.base.trade.tradeNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("kauf");
talkEntry:addTrigger("handel");
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkEntry:addResponse("Lass uns handeln!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("buy");
talkEntry:addTrigger("sell");
talkEntry:addTrigger("trade");
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkEntry:addResponse("Let's!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Francois Delacroix the Trader. Keywords: Hello, Markets, Buy, Sell, Agriculture, Trade."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist der Händler Francois Delacroix. Schlüsselwörter: Hallo, Märkte, Handel, Ackerbau."));
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
talkEntry:addResponse("Good day.");
talkEntry:addResponse("Greeted be.");
talkEntry:addResponse("It's your lucky day! You've found the best farmer in town!");
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
talkEntry:addResponse("Guten Tag.");
talkEntry:addResponse("Wie geht es Euch?");
talkEntry:addResponse("Heute scheint Euer Glückstag zu sein, warum? Ihr habt beschlossen bei mir einzukaufen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Good day there.");
talkEntry:addResponse("How fare you?");
talkEntry:addResponse("It's your lucky day! You've found the best farmer in town!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Guten Tagder Herr, die Dame.");
talkEntry:addResponse("Wie geht es Euch?");
talkEntry:addResponse("Heute scheint Euer Glückstag zu sein, warum? Ihr habt beschlossen bei mir einzukaufen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Have a magnificent day today. Remember you are beautiful.");
talkEntry:addResponse("Great tidings, friend! See you later.");
talkEntry:addResponse("Remember to tell your friends to come and see Francois Delacroix for all their agricultural needs!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Einen schönen Tag wünsche ich Euch. Ihr seid wunderschön.");
talkEntry:addResponse("Lächelt, bis später.");
talkEntry:addResponse("Denkt dran euren Freunden zu sagen, sie sollen Francois Delacroix fragen, wenn sie Produkte aus der Landwirtschaft kaufen wollen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Have a great day today! You deserve it!");
talkEntry:addResponse("Great tidings! See you later.");
talkEntry:addResponse("Remember to tell your friends to come and see Francois Delacroix for all their agricultural needs!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Einen schönen Tag wünsche ich Euch. Ihr seid wunderschön.");
talkEntry:addResponse("Lächelt, bis später.");
talkEntry:addResponse("Denkt dran euren Freunden zu sagen, sie sollen Francois Delacroix fragen, wenn sie Produkte aus der Landwirtschaft kaufen wollen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("I'd feel better if you  brought something.");
talkEntry:addResponse(" I feel a lot better now that you've come!");
talkEntry:addResponse("It's just one of those days, you know?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befind");
talkEntry:addResponse("Ich würde mich besser fühlen, würdet ihr etwas einkaufen.");
talkEntry:addResponse("Ich fühle mich viel besser jetzt wo ihr vorbei gekommen seid.");
talkEntry:addResponse("Es ist einer dieser Tage, Ihr versteht?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("Francois Delacroix , agricultural goods.");
talkEntry:addResponse("My name is Francois. It's beyond a pleasure to be acquainted with you");
talkEntry:addResponse("Francois Delacroix, it still feels weird every time I say it.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ihr name");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Francois Delacroix, Produke aus der Landwirtschaft.");
talkEntry:addResponse("My Name ist Francois. Es ist mir eine Freude Eure Bekanntschaft zu machen");
talkEntry:addResponse("Francois Delacroix. Es klingt noch immer jedes Mal seltsam es zu sagen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkEntry:addResponse("I sell goods such as milk and farmer's tools");
talkEntry:addResponse("I sell that which you need.");
talkEntry:addResponse("I sell homemade agricultural goods.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Ich verkaufe Güter wie Milch und Werkzeug für Bauern.");
talkEntry:addResponse("Ich verkaufe was immer Ihr braucht.");
talkEntry:addResponse("Ich verkaufe selbstgemachte Landwirtschaftswaren.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkEntry:addResponse("I sell goods such as milk and farmer's tools.");
talkEntry:addResponse("I sell that which you need.");
talkEntry:addResponse("I sell homemade agricultural goods.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Ich verkaufe Güter wie Milch und Werkzeug für Bauern.");
talkEntry:addResponse("Ich verkaufe was immer Ihr braucht.");
talkEntry:addResponse("Ich verkaufe selbstgemachte Landwirtschaftswaren.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("That's like asking what the sky is, honestly, I don't think I could answer it.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Das ist als ob man fragt, was der Himmel sei. Ehrlich gesagt, ich habe keine Ahnung davon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkEntry:addResponse("Francois Delacroix, agricultural good seller.");
talkEntry:addResponse("My name is Francois. It's beyond a pleasure to be acquainted with you");
talkEntry:addResponse(" Francois Delacroix, it still feels weird every time I say it.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Francois Delacroix, Produke aus der Landwirtschaft.");
talkEntry:addResponse("My Name ist Francois. Es ist mir eine Freude Eure Bekanntschaft zu machen");
talkEntry:addResponse("Francois Delacroix. Es klingt noch immer jedes Mal seltsam es zu sagen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Business");
talkEntry:addTrigger("Markets");
talkEntry:addTrigger("Pepper");
talkEntry:addResponse("Pepper is currently trading at three times the normal price. I'm looking forward to seeing when the price falls and I can count my big profit.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Geschäft");
talkEntry:addTrigger("Märkte");
talkEntry:addTrigger("Pfeffer");
talkEntry:addResponse("Pfeffer wird derzeit zum dreifachen Preis gehandelt. Ich freu mich schon darauf, wenn der Preis wieder fällt und ich großen Profit abgreifen kann.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Agriculture");
talkEntry:addTrigger("Farming");
talkEntry:addTrigger("crops");
talkEntry:addResponse("Harvesting crops and tending cattle is something that has always been and always will be. It's the most stable of markets.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Landwirtschaft");
talkEntry:addTrigger("Getreide");
talkEntry:addTrigger("Ackerbau");
talkEntry:addResponse("Der Anbau von Feldfürchten und Viehhaltung ist etwas das es schon immer gegeben hat und das es immer geben wird. Das ist der beständigste Markt von allen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Family");
talkEntry:addResponse("I don't want to talk about them.");
talkEntry:addResponse("Family is not a word that everyone is fond of.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Familie");
talkEntry:addResponse("Ich möchte darüber nicht sprechen");
talkEntry:addResponse("Diese Wort erfreut nich jeden von uns.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wife");
talkEntry:addResponse("Hahaha, perhaps someday.");
talkEntry:addResponse("Settle down? Me? Ha, maybe after I'm done making money.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ehefrau");
talkEntry:addResponse("Hahaha, vielleicht eines Tages.");
talkEntry:addResponse("Ich? Mich niederlassen? Hahaha, vielleicht wenn ich genug Geld gemacht habe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addResponse("I don't know much of the man, though I can't help but appreciate him for keeping this city safe for all of us who live here.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Ich weiß nicht viel über ihn, aber ich komme nicht umhin diesen Mann zu bewundern, der dafür sorgt das unsere Stadt sicher ist.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("I don't know much of the man, though I can't help but appreciate him for keeping this city safe for all of us who live here.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Ich weiß nicht viel über ihn, aber ich komme nicht umhin diesen Mann zu bewundern, der dafür sorgt das unsere Stadt sicher ist.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("When I was a child I never thought I'd be a city person, but the women here sure are prettier.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("As ich kein Kind war, hätte ich nie gedacht einmal in der Stadt zu leben. Die Frauen hier sind wirklich schöner.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Of course I've heard the name, but I know nothing of Galmair or its people.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Den Namen habe ich natürlich schon gehört, aber ich weiß nichts über Galmair und die Leute dort.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("I've never been.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Da war ich noch nie.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Queen");
talkEntry:addResponse("I grew up wanting to be like her.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königin");
talkEntry:addResponse("Als ich jung war wollte ich so sein wie sie.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("I grew up wanting to be like her.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Als ich jung war wollte ich so sein wie sie.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("I've been. It's a little too dry and hot, I prefer the Runewick Breeze.");
talkEntry:addResponse("They have quite a few jewellery makers. I think most of my collection is from Cadomyrian smiths.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Da war ich schon. Es ist zu trocken da. Ich mag das Wetter in Runewick lieber.");
talkEntry:addResponse("Die haben da einige Schmuckhändler. Ich denke meine Sammlung wurde von Schmiedemeistern aus Cadomyr angefertigt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("albar");
talkEntry:addResponse("On the downside, it's dangerously hot in the Albarian deserts. The upshot, of course, is that the Albarian women are also dangerously hot.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("Einerseits ist es in Albarischen Wüste verdammt heiß, andereseits sind Albarische Frauen verdammt heiß.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addResponse("Never been... I have no idea. Everyone keeps asking me about it though, maybe I should go someday.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("Da war ich noch nie. Keine Ahnung, die Leute fragen immer. Vielleicht gehe ich eines Tages dorthin.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("salkama");
talkEntry:addResponse("I've lived in this land all my life. I don't love it, but being anywhere else is just uncomfortable.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Ich habe mein ganzes Leben dort verbracht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("I follow Irmorom, obviously. What kind of question is that?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Göttter");
talkEntry:addResponse("Natürlich folge ich Irmorom. Was ist denn das für eine Frage?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("He keeps me at the top of my craft, which makes me money, which gets all these girls to look my way. How could I be malcontent?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("Er verleiht mir Geschick, dadurch verdiene ich Geld und durch das Geld mögen mich die Mädchen. Wie könnte ich da unzufrieden sein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("What is there to tell? I'm Runewick's number one agricultural trading pretty boy.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Was hätte ich zu erzählen? Ich bin die Nummer Eins unter den Händlern in Runewick, wenn es um Landwirtschaftserzeugnisse geht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Francois");
talkEntry:addTrigger("Delacroix");
talkEntry:addResponse("Do you need something? Chances are I sell it.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Francois");
talkEntry:addTrigger("Delacroix");
talkEntry:addResponse("Bracht Ihr etwas? Die Chancen stehen gut, dass ich es verkaufe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("Please be more specific. ");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("Bitte seid etwas genauer in Eurer Wortwahl.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse(" Please be more specific.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("Bitte seid etwas genauer in Eurer Wortwahl.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("Braucht Ihr Werkzeuge? Ich, Francois Delacoix, verkaufe sowohl Werkzeuge für den Ackerbau als auch für die Fischerrei.", "Are you a farmer and need tools? I, Francois Delacroix, carry both farming and fishing tools.");
talkingNPC:addCycleText("Ihr sucht wunderschöne Felle um dem Winter zu trotzen oder Leder um einem Schwerthieb stand zu halten? Besucht mich, Francois Delacoix!", "Want beautiful furs to last the winter? Or perhaps leather to survive a sword strike! Francois Delacroix is your man!.");
talkingNPC:addCycleText("Habt Ihr Hunger? Leidet ihr an Skorbut? Ich, Francois Delacoix, habe ein gesundes Angebot an Früchten und Gemüse! Kommt vorbei!", "Are you hungry? Perhaps you're dying from scurvy? With fresh fruit and vegetables from Francois Delacroix , your gums will never be sore and your teeth never drop out!");
talkingNPC:addCycleText("Ich habe Fisch, Ihr wollt Fisch? Kauft bei mir,  Francois Delacoix.", "You want fish, I have fish. It's a no brainer! Come see Francois Delacroix!");
talkingNPC:addCycleText("Ich verkaufe Saatgut für alle Jahreszeiten. Plant Ihr einen neuen Hof zu gründen und eine Familie zu Gründen? Kauft zuerst hier ein, bei mir , Francois Delacoix.", "I have seeds from any season! Are you about to settle down and start a new farm and family?  First visit me - Francois Delacroix!");
talkingNPC:addCycleText("Ihr könnt Euch kein Fleisch leisten? Milch ist das perkte Mittel um Eure Familie ohne Fleisch durch zu bringen. Wenn Ihr das Glück habt Euch Fleisch leisten zu können, es schmeckt auch zu Milch! Kauft bei mirein, kauft bei Francois Delacoix!", "Can't afford meat? Milk is the perfect way to feed a family on no money! For your babies healthy bones, if you can't produce your own, come to Francois Delacroix.");
talkingNPC:addCycleText("Wie geht es Euch heute? Werft einen Blick auf die neuesen Waren von mir, Francois Delacroix.", "How are you doing today? Check out the latest wares of I, Francois Delacroix.");
talkingNPC:addCycleText("Euer liebster Händler für landwirtschaftliche Güter, ich, Francois Delacroix bin für eich da!", "Your favourite agricultural trader, Francois Delacroix is here to serve your needs!");
talkingNPC:addCycleText("Ihr seid wunderschöne Leute. Habt einen wunderscönen Tag.", "You're all beautiful people! Have a gorgeous day!");
talkingNPC:addCycleText("Seid Ihr hungrig großer Kerl? Oder wollt ihr einen Mann glücklich machen  hübsches Fräulein? Ich, Francois Delacroix verkaufe rohes Fleisch. Esst und seid glücklich!", "Are you hungry big man? Or do you have a man you want to make happy, pretty lady? I, Francois Delacroix, sells raw meat... For the untamed man!");
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
tradingNPC:addItem(npc.base.trade.tradeNPCItem(291,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(534,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(728,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(773,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(779,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2494,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2917,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2502,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(307,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(552,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(553,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2934,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(15,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(80,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(81,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(147,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(151,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(199,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(302,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(388,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(72,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(73,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(355,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(455,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(51,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(126,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(258,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(271,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(69,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2547,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2586,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(154,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(200,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(201,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(290,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(249,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(259,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(772,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(778,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2493,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(291,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(534,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(728,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(773,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(779,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2494,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2917,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2502,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(307,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(552,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(553,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2934,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(15,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(80,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(81,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(147,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(151,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(199,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(302,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(388,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(72,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(73,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(355,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(455,"buySecondary"));
tradingNPC:addNotEnoughMoneyMsg("Du hast nicht genug Geld!", "You don't have enough money!");
tradingNPC:addDialogClosedMsg("Danke, komm doch bald wieder.", "Thanks, come back soon.");
tradingNPC:addDialogClosedNoTradeMsg("Nichts gefunden was dir gefällt?", "Don't you like my wares?");
tradingNPC:addWrongItemMsg("Das kaufe ich nicht.", "I'm not buying this.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(1);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Dieser NPC ist der Bauer Francois Delacroix.", "This is NPC is the peasant Francois Delacroix.");
mainNPC:setUseMessage("Fass mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut dich verwirrt an.", "#me looks at you confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 813);
mainNPC:setEquipment(11, 55);
mainNPC:setEquipment(5, 258);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 2295);
mainNPC:setEquipment(9, 823);
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
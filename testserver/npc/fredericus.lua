--------------------------------------------------------------------------------
-- NPC Name: Fredericus                                               Cadomyr --
-- NPC Job:  Fisherman                                                        --
--                                                                            --
-- NPC Race: human                      NPC Position:  117, 618, 0            --
-- NPC Sex:  male                       NPC Direction: east                   --
--                                                                            --
-- Authors:  Estralis Seborian                                                --
--           Martin Karing                                                    --
--                                                       easyNPC Parser v1.22 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (0, 117, 618, 0, 2, 'Fredericus', 'npc.fredericus', 0, 1, 1, 192, 107, 5, 180, 126, 84);
---]]

require("npc.base.basic")
require("npc.base.condition.language")
require("npc.base.consequence.inform")
require("npc.base.consequence.trade")
require("npc.base.talk")
require("npc.base.trade")
module("npc.fredericus", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
local tradingNPC = npc.base.trade.tradeNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is the fisherman Fredericus. Keyphrases: Hello, fisherman, Tanora, trade."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist der Fischer Fredericus. Schlüsselwörter: Hallo, Fischer, Tanora, Handel."));
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
talkEntry:addResponse("Ahoy! Fresh fish!");
talkEntry:addResponse("G'day. I just came ashore.");
talkEntry:addResponse("Only the best fish, only today, only for you!");
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
talkEntry:addResponse("Ahoi! Frischer Fisch!");
talkEntry:addResponse("Tag. Bin gerade von großer Fahrt zurück.");
talkEntry:addResponse("Nur der beste Fisch, nur heute, nur für euch!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Ahoy! Fresh fish!");
talkEntry:addResponse("G'day. I just came ashore.");
talkEntry:addResponse("Only the best fish, only today, only for you!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Ahoi! Frischer Fisch!");
talkEntry:addResponse("Tag. Bin gerade von großer Fahrt zurück.");
talkEntry:addResponse("Nur der beste Fisch, nur heute, nur für euch!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Good trip.");
talkEntry:addResponse("Until next time, remember, a fish a day keeps the medico away.");
talkEntry:addResponse("Farewell.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Gute Fahrt.");
talkEntry:addResponse("Bis zum nächesten Mal, denkt daran, ein Fisch am Tag hält den Medizinmann fern.");
talkEntry:addResponse("Auf wiedersehen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Good trip.");
talkEntry:addResponse("Until next time, remember, a fish a day keeps the medico away.");
talkEntry:addResponse("Farewell.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Gute Fahrt.");
talkEntry:addResponse("Bis zum nächesten Mal, denkt daran, ein Fisch am Tag hält den Medizinmann fern.");
talkEntry:addResponse("Auf wiedersehen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("I feel good, not a wonder, I had fish today.");
talkEntry:addResponse("I'd feel much better if you buy some fish.");
talkEntry:addResponse("Fine, thank you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addResponse("Mir geht es gut, ist auch kein Wunder, ich habe heute Fisch gegessen.");
talkEntry:addResponse("Mir würde es weit besser gehen, wenn ihr Fisch kaufen würdet.");
talkEntry:addResponse("Gut, danke der Nachfrage.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkEntry:addResponse("Fredericus. That's me.");
talkEntry:addResponse("I am the fisherman Fredericus.");
talkEntry:addResponse("Fredericus is my name, Ifish.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ihr name");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Fredericus. Das bin ich.");
talkEntry:addResponse("Ich bin der Fischer Fredericus.");
talkEntry:addResponse("Fredericus ist mein Name, ich handel mit Fischen.");
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
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkEntry:addResponse("Fish, fish, fish. Ifish... And also herbs, if you need any to spice up your dishes.");
talkEntry:addResponse("Ifish, do you need any?");
talkEntry:addResponse("Iwhat you need to catch fish and I even buy the fish you caught.");
talkEntry:addResponse("Ya want to? Aye, have a look!");
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
talkEntry:addResponse("Fisch, Fisch und nochmal Fisch. Ich handele mit Fischen und auch Kräutern, wenn ihr eure Gerichte würzen wollt.");
talkEntry:addResponse("Ich handel Fische, braucht ihr welche?");
talkEntry:addResponse("Ich verkaufe alles, was man zum Fischen braucht und kaufe sogar euren Fang.");
talkEntry:addResponse("Du willst handeln? Da schau her was ich hab!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("I do not issue any quests. But you can bring me fish and I'll pay you for your work.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Ich verteile keine Aufgaben. Aber ihr könnt mir Fisch bringen und ich bezahle eure Arbeit.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("I do not issue any quests. But you can bring me fish and I'll pay you for your work.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Ich verteile keine Aufgaben. Aber ihr könnt mir Fisch bringen und ich bezahle eure Arbeit.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("fischers fritze");
talkEntry:addResponse("Fischt frische Fische!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("I'm a fisherman. A hard job, but an honest and honourable job.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Ich bin ein Fischer. Das ist ein hartes Geschäft, aber es ist ehrlich und ehrbar.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("I'm a fisherman. A hard job, but an honest and honourable job.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Ich bin ein Fischer. Das ist ein hartes Geschäft, aber es ist ehrlich und ehrbar.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("I once sailed to Gobaith, the natives tossed onions at each other!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Ich bin einmal nach Gobaith gesegelt, die Eingeborenen dort haben mit Zwiebeln aufeinander geworfen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("Oh, interesting, and do you want to become a fisherman like me?");
talkEntry:addResponse("A nice name, indeed.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Oh, interessant, wollt ihr auch ein Fischer wie ich werden?");
talkEntry:addResponse("Ein netter Name.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Zerarisa");
talkEntry:addResponse("I think Zerarisa is one of the lizards, living at Cape Farewell.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zerarisa");
talkEntry:addResponse("Ich meine, Zerarisa ist eine der Echsen, die am Kap des Abschiedes wohnen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cape");
talkEntry:addTrigger("Farewell");
talkEntry:addResponse("Cape Farewell is to the south and west, land's end one could say.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Kap");
talkEntry:addTrigger("Abschied");
talkEntry:addResponse("Das Kap des Abschiedes ist im Südwesten, am Ende der Welt könnte man sagen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("boat");
talkEntry:addTrigger("ship");
talkEntry:addTrigger("vessle");
talkEntry:addResponse("No, I will not lend you my boat. Take a fishing rod and go to the shore.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Boot");
talkEntry:addTrigger("Schiff");
talkEntry:addResponse("Ich kann euch mein Boot nicht leihen. Nehmt eine Angelrute und geht zur Küste.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Fischer");
talkEntry:addResponse("Ich bin ein Fischer. Das ist ein hartes Geschäft, aber es ist ehrlich und ehrbar.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("fisherman");
talkEntry:addResponse("I'm a fisherman. A hard job, but an honest and honourable job.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("trader");
talkEntry:addTrigger("merchant");
talkEntry:addTrigger("collegue");
talkEntry:addTrigger("vendor");
talkEntry:addTrigger("market");
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkEntry:addResponse("Here, at the marketplace, there are manyrs. You can buy many goods here in Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("händler");
talkEntry:addTrigger("kollege");
talkEntry:addTrigger("höker");
talkEntry:addTrigger("markt");
talkEntry:addResponse("Hier auf dem Marktplatz gibt es einige Händler. Man kann viele Waren hier in Cadomyr kaufen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addResponse("#me snorts angrily.");
talkEntry:addResponse("Better avoid Runewick's leader. Whatever you say, it is wrong. Whatever you do, it is wrong.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("#me schnaubt wütend.");
talkEntry:addResponse("Vermeidet den Herren von Runewick. Was immer ihr sagt, es ist falsch. Was immer ihr tut, es ist falsch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("#me snorts angrily.");
talkEntry:addResponse("Better avoid Runewick's leader. Whatever you say, it is wrong. Whatever you do, it is wrong.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("#me schnaubt wütend.");
talkEntry:addResponse("Vermeidet den Herren von Runewick. Was immer ihr sagt, es ist falsch. Was immer ihr tut, es ist falsch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("If I were you, I'd never go to Runewick. They might be nice, but also, false and not honest.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Wenn ich an eurer Stelle wäre, würde ich nie nach Runewick gehen. Sie mögen nett dort sein, aber auch unehrlich und falsch. ");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("I'd like to toss some smelly fish at the Don. I will never understand how such a... villain can become leader of a community.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Ich würd' gerne mal ein paar stinkige Fische auf den Don werfen. Ich werde nie verstehen, wie so ein... Rabauke der Anführer einer Gemeinschaft werden konnte.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Galmair is not a safe place. The Don does not want it to be, so he can demand money for protection.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Galmair ist kein sicherer Ort. Aber der Don will es nicht anders, denn nur so kann er Schutzgeld erpressen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Queen");
talkEntry:addResponse("Queen Rosaline, well, she is the best thing that could happen to Cadomyr. I say that and I mean it, the best woman is better than the worst man.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königin");
talkEntry:addResponse("Königin Rosaline ist das beste, was Cadomyr geschehen konnte. Ich sage es, weil ich es meine; die beste Frau ist immernoch besser als der schlechteste Mann.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Queen Rosaline, well, she is the best thing that could happen to Cadomyr. I say that and I mean it, the best woman is better than the worst man.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Königin Rosaline ist das beste, was Cadomyr geschehen konnte. Ich sage es, weil ich es meine; die beste Frau ist immernoch besser als der schlechteste Mann.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Cadomyr is my home, where I return to after setting sails.");
talkEntry:addResponse("I love Cadomyr as I love the sea.");
talkEntry:addResponse("Cadomyr's best, forget the rest!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Cadomyr ist meine Heimat, in die ich mit vollen Segeln zurückkehre.");
talkEntry:addResponse("Ich liebe Cadomyr wie das weite, offene Meer.");
talkEntry:addResponse("Cadomyr kriegt das beste, für die anderen bleiben nur Reste.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("albar");
talkEntry:addResponse("Oh, Albar, how much I desire to sail there... A land of justice and honour");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("Oh, Albar, wie sehr wünschte ich, ich könnte dorthin segeln. Ein Land der Gerechtigkeit und der Ehre.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addResponse("What did you say?");
talkEntry:addResponse("I did not understand you.");
talkEntry:addResponse("Pardon me?");
talkEntry:addResponse("Shh, do not talk about this too loud.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("Was habt ihr gesagt?");
talkEntry:addResponse("Ich habe euch nicht verstanden.");
talkEntry:addResponse("Entschuldigung?");
talkEntry:addResponse("Psst, sprecht darüber nicht so laut.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Arrogant wise guys they are, and a hard working fisherman does not matter to the oh-so-noble people there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Arrogante Besserwisser sind das. Und ein hart arbeitender Fischer zählt nichts für die ach-so-noblen Leute dort.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("Goddesses aren't prayed to in Cadomyr, they say, but when you are at sea, you'll pray to Tanora and Findari, that's for sure.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("In Cadomyr betet man keine Göttinnen an, so heißt es. Aber wenn ihr mal auf See seid, dann werdet ihr sicherlich Tanora und Findari anflehen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("Tanora guides my boat, Tanora protects my boat, Tanora causes the waves that sink my boat.");
talkEntry:addResponse("Hail Tanora!");
talkEntry:addResponse("I obey Tanora, but if you want to meet people who adore her, go to Cape Farewell.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("Tanora lenkt mein Boot, Tanora schützt mein Boot, Tanora schickt die Wellen, die mein Boot zermalmen.");
talkEntry:addResponse("Huldigt Tanora!");
talkEntry:addResponse("Ich gehorche Tanora, aber wenn ihr Leute treffen wollt, die sie verehren, geht zum Kap des Abschiedes.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Findari");
talkEntry:addResponse("Findari grants the devastating storm or the wind that blows the sail; depending on her mood.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Findari");
talkEntry:addResponse("Findari bringt den vernichtenden Sturm oder den Wind, der die Segel aufbläht, je nach ihrer Stimmungslage.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("Irmorom helps me to do good business, but my fate is in the hand of Tanora and Findari.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("Irmorom verhilft mir manches mal zu guten Geschäften, aber mein Leben liegt in Tanoras und Findaris Händen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("I swear I saw a sea serpent!");
talkEntry:addResponse("If an evil spirit haunts a ship, all is lost.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Ich schwöre, ich habe ein Seeungeheuer gesehen!");
talkEntry:addResponse("Wenn ein böser Geist auf einem Schiff sein Unwesen treibt, dann ist es meist bald verloren.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Fredericus");
talkEntry:addResponse("I am merely a humble fisherman. But I could tell you about the Gods, shall I?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Fredericus");
talkEntry:addResponse("Ich bin nur ein einfacher Fischer, aber ich könnte euch etwas über die Götter erzählen, wenn ihr Zeit habt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("Aye, aye, and a flounder in addition.");
talkEntry:addResponse("Well, maybe a herring?");
talkEntry:addResponse("That's good.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("Aye, aye, und eine Flunder dazu.");
talkEntry:addResponse("Vielleicht einen Hering?");
talkEntry:addResponse("Das ist gut auch so.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("Do you prefer salmon perhaps?");
talkEntry:addResponse("Will bloaters make you content?");
talkEntry:addResponse("Mackerels?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("Mögt ihr lieber Lachs?");
talkEntry:addResponse("Würde euch ein Bückling zufriedenstellen?");
talkEntry:addResponse("Makrelen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("stinkt");
talkEntry:addResponse("Das stimmt nicht.");
talkEntry:addResponse("Mein Fisch ist lecker!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("stinks");
talkEntry:addResponse("It does not!");
talkEntry:addResponse("My fish is tasty!");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("Mein Fisch stinkt nicht!", "My fish does not stink!");
talkingNPC:addCycleText("Frischer Fisch!", "Fresh fish!");
talkingNPC:addCycleText("Fisch, Kräuter, alles, was ihr braucht für das Festmahl!", "Fish, herbs, all you need for dinner!");
talkingNPC:addCycleText("#me riecht an den Fischen in seiner Auslage und verzieht das Gesicht.", "#me sniffs at the fish on his cart and wrinkles his nose.");
talkingNPC:addCycleText("Fangfrischer Lachs!", "Fresh salmon!");
talkingNPC:addCycleText("Komm, kauf jetzt und pack dir noch einen Aal drauf!", "C'mon, buy now and you get an eel for free!");
talkingNPC:addCycleText("Kauft noch einen Bückling, der schmeckt zwar nicht, hält aber die Ratten fern.", "Buy this bloater, it is not tasty, but it keeps the rats at bay.");
talkingNPC:addCycleText("Beste Forellen!", "Best trout!");
talkingNPC:addCycleText("Leckere Heringe!", "Tasty herrings!");
talkingNPC:addCycleText("Ein Pfund Makrelen, nur jetzt, nur für euch!", "A pound of mackerels, only now, only for you!");
tradingNPC:addItem(npc.base.trade.tradeNPCItem(72,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(126,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(752,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(753,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(759,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(763,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(767,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(133,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(134,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(135,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(136,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(137,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(140,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(141,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(142,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(143,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(144,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(145,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(148,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(153,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(154,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(155,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(156,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(157,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(158,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(159,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(160,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(161,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(162,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(163,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(73,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(355,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(455,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(72,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(73,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(355,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(455,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(126,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(752,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(753,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(754,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(755,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(756,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(757,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(758,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(759,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(760,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(761,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(762,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(763,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(764,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(765,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(766,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(767,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(768,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(769,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(133,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(134,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(135,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(136,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(137,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(138,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(140,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(141,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(142,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(143,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(144,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(145,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(146,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(148,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(152,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(153,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(154,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(155,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(156,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(157,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(158,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(159,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(160,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(161,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(162,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(163,"buySecondary"));
tradingNPC:addNotEnoughMoneyMsg("Oh, ich fürchte Ihr könnt Euch das nicht leisten.", "Oh, I fear, you can not afford that.");
tradingNPC:addDialogClosedMsg("Vielen Dank, beehrt mich bald wieder!", "Thank you, please come again!");
tradingNPC:addDialogClosedNoTradeMsg("Auf Bald!", "Farewell!");
tradingNPC:addWrongItemMsg("Das kaufe ich nicht.", "I'm not buying this.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(1);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Dieser NPC ist der Fischer Fredericus.", "This NPC is the fisherman Fredericus.");
mainNPC:setUseMessage("Fass mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut verwirrt umher.", "#me looks around confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 182);
mainNPC:setEquipment(11, 0);
mainNPC:setEquipment(5, 0);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 2295);
mainNPC:setEquipment(9, 183);
mainNPC:setEquipment(10, 369);
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
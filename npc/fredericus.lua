--------------------------------------------------------------------------------
-- NPC Name: Fredericus                                                  None --
-- NPC Job:  none                                                             --
--                                                                            --
-- NPC Race: human                      NPC Position:  133, 581, 0            --
-- NPC Sex:  male                       NPC Direction: south                  --
--                                                                            --
-- Author:   Estralis Seborian                                                --
--                                                                            --
-- Last parsing: November 24, 2010                       easyNPC Parser v1.02 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (0, 133, 581, 0, 4, 'Fredericus', 'npc.fredericus', 0, 0, 0, 255, 255, 255, 255, 255, 255);
---]]

require("npc.base.basic")
require("npc.base.condition.language")
require("npc.base.consequence.inform")
require("npc.base.talk")
module("npc.fredericus", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is the fisherman Fredericus. Keyphrases: Hello, fisherman."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist der Fischer Fredericus. Schlüsselwörter: Hallo, Fischer."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hello");
talkEntry:addTrigger("Greetings");
talkEntry:addTrigger("Be greeted");
talkEntry:addTrigger("Hail");
talkEntry:addTrigger("Good day");
talkEntry:addTrigger("Good morning");
talkEntry:addTrigger("Good evening");
talkEntry:addResponse("Ahoy! Fresh fish!");
talkEntry:addResponse("G'day. I just came ashore.");
talkEntry:addResponse("Only the best fish, only today, only for you!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Grüße");
talkEntry:addTrigger("Gruß");
talkEntry:addTrigger("Seid gegrüßt");
talkEntry:addTrigger("Guten Tag");
talkEntry:addTrigger("Guten Abend");
talkEntry:addTrigger("Mahlzeit");
talkEntry:addTrigger("Tach");
talkEntry:addTrigger("Moin");
talkEntry:addResponse("Ahoi! Frischer Fisch!");
talkEntry:addResponse("Tag. Bin gerade von großer Fahrt zurück.");
talkEntry:addResponse("Nur der beste Fisch, nur heute, nur für euch!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greebas");
talkEntry:addTrigger("Greebs");
talkEntry:addCondition(npc.base.condition.language.language("english"));
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
talkEntry:addTrigger("Greebas");
talkEntry:addTrigger("Greebs");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Ahoi! Frischer Fisch!");
talkEntry:addResponse("Tag. Bin gerade von großer Fahrt zurück.");
talkEntry:addResponse("Nur der beste Fisch, nur heute, nur für euch!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Good bye");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare thee well");
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
talkEntry:addTrigger("Gehabt euch wohl");
talkEntry:addResponse("Gute Fahrt.");
talkEntry:addResponse("Bis zum nächesten Mal, denkt daran, ein Fisch am Tag hält den Medizinmann fern.");
talkEntry:addResponse("Auf wiedersehen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addCondition(npc.base.condition.language.language("english"));
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
talkEntry:addCondition(npc.base.condition.language.language("german"));
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
talkEntry:addResponse("Fredericus. That's me.");
talkEntry:addResponse("I am the fisherman Fredericus.");
talkEntry:addResponse("Fredericus is my name, I trade fish.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
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
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("Fish, fish, fish. I trade fish. And also herbs, if you need any to spice up your dishes.");
talkEntry:addResponse("I trade fish, do you need any?");
talkEntry:addResponse("I trade what you need to catch fish and I even buy the fish you caught.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Fisch, Fisch und nochmal Fisch. Ich handele mit Fischen und auch Kräutern, wenn ihr eure Gerichte würzen wollt.");
talkEntry:addResponse("Ich handel Fische, braucht ihr welche?");
talkEntry:addResponse("Ich verkaufe alles, was man zum Fischen braucht und kaufe sogar euren Fang.");
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
talkEntry:addTrigger("profession");
talkEntry:addResponse("I'm a fisherman. A hard job, but a honest and honourable job.");
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
talkEntry:addTrigger("job");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Ich bin ein Fischer. Das ist ein hartes Geschäft, aber es ist ehrlich und ehrbar.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I'm a fisherman. A hard job, but a honest and honourable job.");
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
talkEntry:addResponse("I'm a fisherman. A hard job, but a honest and honourable job.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("trader");
talkEntry:addTrigger("merchant");
talkEntry:addTrigger("collegue");
talkEntry:addTrigger("vendor");
talkEntry:addTrigger("market");
talkEntry:addResponse("Here, at the marketplace, there are many traders. You can buy many goods here in Cadomyr.");
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
talkEntry:addTrigger("Gobaith");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I once sailed to Gobaith, the natives tossed onions at each other!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Ich bin einmal nach Gobaith gesegelt, die Eingeborenen dort haben mit Zwiebeln aufeinander geworfen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zerarisa");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Ich meine, Zerarisa ist eine der Echsen, die am Kap des Abschiedes wohnen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zerarisa");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I think Zerarisa is one of the lizards, living at Cape Farewell.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cape");
talkEntry:addTrigger("Farewell");
talkEntry:addResponse("Cape Farewell is to the south and west, land's end, one could say.");
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
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addTrigger("archmage");
talkEntry:addTrigger("Erzmagier");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("#me snorts angrily.");
talkEntry:addResponse("Better avoid Runewick's leader. Whatever you say, it is wrong. Whatever you do, it is wrong.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addTrigger("archmage");
talkEntry:addTrigger("Erzmagier");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("#me schnaubt wütend.");
talkEntry:addResponse("Vermeidet den Herren von Runewick. Was immer ihr sagt, es ist falsch. Was immer ihr tut, es ist falsch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("If I were you, I'd never go to Runewick. They might be nice, but also, false and not honest.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Wenn ich an eurer Stelle wäre, würde ich nie nach Runewick gehen. Sie mögen nett dort sein, aber auch unehrlich und falsch. ");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I'd like to toss some smelly fish at the Don. I will never understand how such a... villain can become leader of a community.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Ich würd' gerne mal ein paar stinkige Fische auf den Don werfen. Ich werde nie verstehen, wie so ein... Rabauke der Anführer einer Gemeinschaft werden konnte.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Galmair is not a safe place. The Don does not want it to be, so he can demand money for protection.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Galmair ist kein sicherer Ort. Aber der Don will es nicht anders, denn nur so kann er Schutzgeld erpressen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("königin");
talkEntry:addTrigger("queen");
talkEntry:addTrigger("edwards");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Queen Rosaline, well, she is the best thing that could happen to Cadomyr. I say that and I mean it, the best woman is better than the worst man.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("königin");
talkEntry:addTrigger("queen");
talkEntry:addTrigger("edwards");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Königin Rosaline ist das beste, was Cadomyr geschehen konnte. Ich sage es, weil ich es meine; die beste Frau ist immernoch besser als der schlechteste Mann.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Cadomyr is my home, where I return to after setting sails.");
talkEntry:addResponse("I love Cadomyr as I love the sea.");
talkEntry:addResponse("Cadomyr's best, forget the rest!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Cadomyr ist meine Heimat, in die ich mit vollen Segeln zurückkehre.");
talkEntry:addResponse("Ich liebe Cadomyr wie das weite, offene Meer.");
talkEntry:addResponse("Cadomyr kriegt das beste, für die anderen bleiben nur Reste.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Oh, Albar, how much I desire to sail there. A land of justice and honour");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Oh, Albar, wie sehr wünschte ich, ich könnte dorthin segeln. Ein Land der Gerechtigkeit und der Ehre.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addCondition(npc.base.condition.language.language("english"));
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
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Was habt ihr gesagt?");
talkEntry:addResponse("Ich habe euch nicht verstanden.");
talkEntry:addResponse("Entschuldigung?");
talkEntry:addResponse("Psst, sprecht darüber nicht so laut.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Arrogant wisenheimers they are. And a hard working fisherman does not matter to the oh-so-noble people there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Arrogante Besserwisser sind das. Und ein hart arbeitender Fischer zählt nichts für die ach-so-noblen Leute dort.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Tanora guides my boat, Tanora protects my boat, Tanora causes the waves that crash my boat.");
talkEntry:addResponse("Hail the goddess!");
talkEntry:addResponse("I obey Tanora, but if you want to meet perons who adore her, go to Cape Farewell.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Tanora lenkt mein Boot, Tanora schützt mein Boot, Tanora schickt die Wellen, die mein Boot zermalmen.");
talkEntry:addResponse("Huldigt Tanora!");
talkEntry:addResponse("Ich gehorche Tanora, aber wenn ihr Leute treffen wollt, die sie verehren, geht zum Kap des Abschiedes.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I do not issue any quests. But you can bring me fish and I'll pay you for your work.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Ich verteile keine Aufgaben. Aber ihr könnt mir Fisch bringen und ich bezahle eure Arbeit.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addResponse("I do not issue any quests. But you can bring me fish and I'll pay you for your work.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
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
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("Mögt ihr lieber Lachs?");
talkEntry:addResponse("Würde euch ein Bückling zufriedenstellen?");
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
talkingNPC:addCycleText("Frischer Fisch!", "Fresh Fish!");
talkingNPC:addCycleText("Fisch, Kräuter, alles, was ihr braucht für das Festmahl!", "Fish, herbs, all you need for dinner!");
talkingNPC:addCycleText("#me riecht an den Fischen in seiner Auslage und verzieht das Gesicht.", "#me sniffes on the fish on his cart and wrinkles his nose.");
talkingNPC:addCycleText("Fangfrischer Lachs!", "Fresh salmon!");
talkingNPC:addCycleText("Komm, kauf jetzt und pack dir noch einen Aal drauf!", "C'mon, buy now and you get an eel for free!");
talkingNPC:addCycleText("Kauft noch einen Bückling, der schmeckt zwar nicht, hält aber die Ratten fern.", "Buy this bloater, it is not tasty, but it keeps the rats at bay.");
talkingNPC:addCycleText("Beste Forellen!", "Best trouts!");
talkingNPC:addCycleText("Leckere Heringe!", "Tasty herrings!");
talkingNPC:addCycleText("Ein Pfund Makrelen, nur jetzt, nur für euch!", "A pound mackerels, only now, only for you!");
mainNPC:addLanguage(0);
mainNPC:addLanguage(1);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Dieser NPC ist der Fischer Fredericus.", "This NPC is the fisherman Fredericus.");
mainNPC:setUseMessage("Fass mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut dich verwirrt an.", "#me looks at you confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 181);
mainNPC:setEquipment(11, 0);
mainNPC:setEquipment(5, 0);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 2295);
mainNPC:setEquipment(9, 183);
mainNPC:setEquipment(10, 369);
mainNPC:setAutoIntroduceMode(true);

mainNPC:initDone();
end;

function receiveText(texttype, message, speaker) mainNPC:receiveText(speaker, message); end;
function nextCycle() mainNPC:nextCycle(); end;
function lookAtNpc(char, mode) mainNPC:lookAt(char, mode); end;
function useNPC(char, counter, param) mainNPC:use(char); end;
initNpc();
initNpc = nil;
-- END
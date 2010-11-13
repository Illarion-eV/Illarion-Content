--------------------------------------------------------------------------------
-- NPC Name: Nobarg                                                      None --
-- NPC Job:  Priest                                                           --
--                                                                            --
-- NPC Race: human                      NPC Position:  200, 140, 0            --
-- NPC Sex:  male                       NPC Direction: east                   --
--                                                                            --
-- Author:   envi                                                             --
--                                                                            --
-- Last parsing: November 13, 2010                       easyNPC Parser v1.02 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (0, 200, 140, 0, 2, 'Nobarg', 'npc.nobarg', 0, 1, 3, 255, 255, 255, 255, 255, 255);
---]]

require("npc.base.basic")
require("npc.base.condition.item")
require("npc.base.condition.language")
require("npc.base.condition.quest")
require("npc.base.consequence.deleteitem")
require("npc.base.consequence.inform")
require("npc.base.consequence.quest")
require("npc.base.talk")
module("npc.nobarg", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is the priest Nobarg. Keyphrases: Hello, quest, Bragon, gods."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist der Priester Nobarg. Schlüsselwörter: Hallo, Quest, Bragon, Götter."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hello");
talkEntry:addTrigger("Greetings");
talkEntry:addTrigger("Be greeted");
talkEntry:addTrigger("Greet");
talkEntry:addTrigger("Hail");
talkEntry:addTrigger("Good day");
talkEntry:addTrigger("Good morning");
talkEntry:addTrigger("Good evening");
talkEntry:addResponse("#me nods slighty and continous praying.");
talkEntry:addResponse("Hmm? Yes, yes.");
talkEntry:addResponse("Bragon with you.");
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
talkEntry:addTrigger("mit dir");
talkEntry:addResponse("#me nickt leicht und betet weiter.");
talkEntry:addResponse("Hmm? Ja, ja.");
talkEntry:addResponse("Bragon mit euch.");
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
talkEntry:addResponse("#me nods slighty and continous praying.");
talkEntry:addResponse("Hmm? Yes, yes.");
talkEntry:addResponse("Bragon with you.");
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
talkEntry:addResponse("#me nickt leicht und betet weiter.");
talkEntry:addResponse("Hmm? Ja, ja.");
talkEntry:addResponse("Bragon mit euch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Good bye");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare thee well");
talkEntry:addResponse("Farewell.");
talkEntry:addResponse("Good bye.");
talkEntry:addResponse("Bragon with you!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehabt euch wohl");
talkEntry:addResponse("Lebt wohl.");
talkEntry:addResponse("Aufwiedersehen.");
talkEntry:addResponse("Bragon sei mit euch!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addTrigger("See you");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Farewell.");
talkEntry:addResponse("Good bye.");
talkEntry:addResponse("Bragon with you!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Lebt wohl.");
talkEntry:addResponse("Aufwiedersehen.");
talkEntry:addResponse("Bragon sei mit euch!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("If Bragon listens to me today, better.");
talkEntry:addResponse("Do you want pray with me?");
talkEntry:addResponse("Fine, Bragen to honour!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befinden");
talkEntry:addResponse("Wenn Bragon mich heute erhört, besser.");
talkEntry:addResponse("Möchtet ihr mit mir beten?");
talkEntry:addResponse("Gut, Bragon zu Ehren!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("Nobarg.");
talkEntry:addResponse("Nobarg, priest of Bragon");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Nobarg");
talkEntry:addResponse("Nobarg, Priester von Bragon");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("Do I look as I sell something?");
talkEntry:addResponse("I don't sell something.");
talkEntry:addResponse("I'm not a merchant, but priest.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Sehe ich aus als würde ich etwas verkaufen?");
talkEntry:addResponse("Ich verkaufe nichts.");
talkEntry:addResponse("Ich bin kein Händler, sondern Priester.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("In Bragon I belive.");
talkEntry:addResponse("Another time maybe. Now I have to pray.");
talkEntry:addResponse("It is not the time for stories, yet.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("An Bragon glaube ich.");
talkEntry:addResponse("Vielleicht ein andermal. Jetzt muss ich beten.");
talkEntry:addResponse("Nun ist nicht die Zeit um Geschichten zu erzählen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("Priest of Bragon of course.");
talkEntry:addResponse("Priest, are you not seeing it?");
talkEntry:addResponse("Bragon is my passion.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Priest von Bragon natürlich.");
talkEntry:addResponse("Priester, seht ihr das nicht?");
talkEntry:addResponse("Bragon ist meine Leidenschaft.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Priest of Bragon of course.");
talkEntry:addResponse("Priest, are you not seeing it?");
talkEntry:addResponse("Bragon is my passion.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Priest von Bragon natürlich.");
talkEntry:addResponse("Priester, seht ihr das nicht?");
talkEntry:addResponse("Bragon ist meine Leidenschaft.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("A very misery place, wasn't it?");
talkEntry:addResponse("Many left this island, more returned, but in the end we had all to leave.");
talkEntry:addResponse("What a wonderful place it was, wasn't it? Bragon to honour.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Ein Leid überzogener Ort, oder?");
talkEntry:addResponse("Viele haben diese Insel verlassen, mehr sind zurück gekehrt, aber schlußendlich mussten wir alle gehen.");
talkEntry:addResponse("Welch wundervoller Ort es war. Bragon zu Ehre.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("I am");
talkEntry:addTrigger("my name");
talkEntry:addResponse("Do you pray to Bragon too?");
talkEntry:addResponse("Nice name, I like it.");
talkEntry:addResponse("Well, but let us pray to Bragon now.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ich bin");
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Betet ihr auch zu Bragon?");
talkEntry:addResponse("Schöner Name, gefällt mir.");
talkEntry:addResponse("Gut, aber nun kommt und lasst uns zu Bragon beten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bearer");
talkEntry:addResponse("They fight for the light and prodect the weak ones.");
talkEntry:addResponse("A very honourable community.");
talkEntry:addResponse("Fire be in them, that they carry the light as far as possible.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("doom");
talkEntry:addTrigger("extinction");
talkEntry:addTrigger("collapse");
talkEntry:addTrigger("fall");
talkEntry:addResponse("It was horrible!");
talkEntry:addResponse("Bragon be praised that he saved me!");
talkEntry:addResponse("Pray that it never happen again.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("horrible");
talkEntry:addResponse("The fall ob Gobaith");
talkEntry:addResponse("The last days of Gobaith.");
talkEntry:addResponse("Yes, it was so...I don't have words to describe it.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("died");
talkEntry:addTrigger("death");
talkEntry:addTrigger("what did happen");
talkEntry:addTrigger("what happened");
talkEntry:addResponse("Yes, many died in those days.");
talkEntry:addResponse("Yes, but some could fly. I think you can find them here somewhere.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Träger");
talkEntry:addResponse("Die kämpfen für das Licht und schützen die Schwachen.");
talkEntry:addResponse("Eine sehr ehrenhafte Gemeinschaft.");
talkEntry:addResponse("Das Feuer brenne in ihnen, dass sie das Lich weit tragen werden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Untergang");
talkEntry:addTrigger("Zerstörung");
talkEntry:addResponse("Es war furchtbar!");
talkEntry:addResponse("Bragon sei gepriesen, dass er mich rettete!");
talkEntry:addResponse("Bettet, dass es nie wieder passiert.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("furchtbar");
talkEntry:addResponse("Der Untergang von Gobaith.");
talkEntry:addResponse("Die letzten Tage von Gobaith.");
talkEntry:addResponse("Ja, es war so...Ich habe keine Wörter um es besser zu beschreiben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tot");
talkEntry:addTrigger("gestorben");
talkEntry:addTrigger("starben");
talkEntry:addTrigger("was ist passiert");
talkEntry:addTrigger("was ist geschehen");
talkEntry:addResponse("Ja, viele sind gestorben.");
talkEntry:addResponse("Ja, aber manche konnten fliehen. Ich denke ihr könnt sie hier irgendwo finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addTrigger("archmage");
talkEntry:addTrigger("Erzmagier");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Does he belive in Bragon? Otherwise I do not care about him.");
talkEntry:addResponse("He rules Runewick as far as I know.");
talkEntry:addResponse("I think he knows many things about arcane magic.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addTrigger("archmage");
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Glaubt er an Bragon? Ansonsten interessiert er mich nicht.");
talkEntry:addResponse("Er regiert Runewick soweit ich weiß.");
talkEntry:addResponse("Ich denke er weiß viele Dinge über arkane Magie.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("They are looking for wisdom.");
talkEntry:addResponse("They think, they are wise, but I don't know if I shall agree.");
talkEntry:addResponse("I can remember a blue and a red gate when you enter the town.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Die suchen nach Weisheit.");
talkEntry:addResponse("Die denken, dass sie weise sind, aber ich weiß nicht ob ich darin zustimmen soll.");
talkEntry:addResponse("Ich kann mich an ein blaues und ein rotes Tor erinnern wenn man die Stadt betritt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Does he belive in Bragon? Otherwise I do not care about him.");
talkEntry:addResponse("He is the richest man in Galmair.");
talkEntry:addResponse("He is quite good with his daggers. In particular if he is comming from the backside.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Glaubt er an Bragon? Ansonsten interessiert er mich nicht.");
talkEntry:addResponse("Er ist der reichste Mann in Galmair.");
talkEntry:addResponse("Er kann ganz gut mit Dolchen umgehen. Vorallem wenn er von hinten kommt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("They are looking for coins.");
talkEntry:addResponse("Take care of your belongings if you are there.");
talkEntry:addResponse("Do not trust anyone there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Die sind auf Geld aus.");
talkEntry:addResponse("Achtet auf euer Hab und Gut wenn ihr dort seid.");
talkEntry:addResponse("Vertraut niemanden dort.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("königin");
talkEntry:addTrigger("queen");
talkEntry:addTrigger("edwards");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Does she belive in Bragon? Otherwise I do not care about her.");
talkEntry:addResponse("She is on a quick road to ruin Cadomyr.");
talkEntry:addResponse("Lovely face, but not more.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("königin");
talkEntry:addTrigger("queen");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Glaubt sie an Bragon? Ansonsten interessiert sie mich nicht.");
talkEntry:addResponse("Sie stürzt Cadomyr in den Ruin.");
talkEntry:addResponse("Nettes Gesicht, aber nicht mehr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("They are looking for honor.");
talkEntry:addResponse("A very sandy town.");
talkEntry:addResponse("I have no idea how do you get there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Die suchen nach Ehre.");
talkEntry:addResponse("Eine sehr sandige Stadt.");
talkEntry:addResponse("Ich habe keine Ahnung wie ihr dort hinkommt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("On of the big empires.");
talkEntry:addResponse("Who cares about this town?");
talkEntry:addResponse("Hmm...I don't know if they pray to Bragon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Eines der großen Reiche.");
talkEntry:addResponse("Wer interessiert sich sohon für diese Stadt?");
talkEntry:addResponse("Ich weiß nicht, ob die zu Bragon beten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("On of the big empires.");
talkEntry:addResponse("Who cares about this town?");
talkEntry:addResponse("Hmm...I don't know if they pray to Bragon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Eines der großen Reiche.");
talkEntry:addResponse("Wer interessiert sich sohon für diese Stadt?");
talkEntry:addResponse("Ich weiß nicht, ob die zu Bragon beten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("On of the big empires.");
talkEntry:addResponse("Who cares about this town?");
talkEntry:addResponse("Hmm...I don't know if they pray to Bragon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Eines der großen Reiche.");
talkEntry:addResponse("Wer interessiert sich sohon für diese Stadt?");
talkEntry:addResponse("Ich weiß nicht, ob die zu Bragon beten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("Bragon, Bragon and again Bragon.");
talkEntry:addResponse("I pray to Bragon, join me.");
talkEntry:addResponse("I believe in Bragon and his fire.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Bragaon, Bragon und nochmals Bragon.");
talkEntry:addResponse("Ich bete zu Bragon, bete mit mir.");
talkEntry:addResponse("Ich glaube an Bragon und sein Feuer.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Adron");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Yes, this god exists.");
talkEntry:addResponse("I heard about priests of this god, but I cannot remeber the name of the priest.");
talkEntry:addResponse("I believe in Bragon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Adron");
talkEntry:addResponse("Ja, dieser Gotte exestiert.");
talkEntry:addResponse("I hörte von einem Priester dieser Gottheit, aber ich kann mich nicht an den Namen des Priesters erinnern.");
talkEntry:addResponse("Ich glaube an Bragon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Yes, this god exists.");
talkEntry:addResponse("I heard about priests of this god, but I cannot remeber the name of the priest.");
talkEntry:addResponse("I believe in Bragon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addResponse("Ja, dieser Gotte exestiert.");
talkEntry:addResponse("I hörte von einem Priester dieser Gottheit, aber ich kann mich nicht an den Namen des Priesters erinnern.");
talkEntry:addResponse("Ich glaube an Bragon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Yes, this god exists.");
talkEntry:addResponse("I heard about priests of this god, but I cannot remeber the name of the priest.");
talkEntry:addResponse("I believe in Bragon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addResponse("Ja, dieser Gotte exestiert.");
talkEntry:addResponse("I hörte von einem Priester dieser Gottheit, aber ich kann mich nicht an den Namen des Priesters erinnern.");
talkEntry:addResponse("Ich glaube an Bragon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elara");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Yes, this god exists.");
talkEntry:addResponse("I heard about priests of this god, but I cannot remeber the name of the priest.");
talkEntry:addResponse("I believe in Bragon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elara");
talkEntry:addResponse("Ja, dieser Gotte exestiert.");
talkEntry:addResponse("I hörte von einem Priester dieser Gottheit, aber ich kann mich nicht an den Namen des Priesters erinnern.");
talkEntry:addResponse("Ich glaube an Bragon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eldan");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Yes, this god exists.");
talkEntry:addResponse("I heard about priests of this god, but I cannot remeber the name of the priest.");
talkEntry:addResponse("I believe in Bragon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eldan");
talkEntry:addResponse("Ja, dieser Gotte exestiert.");
talkEntry:addResponse("I hörte von einem Priester dieser Gottheit, aber ich kann mich nicht an den Namen des Priesters erinnern.");
talkEntry:addResponse("Ich glaube an Bragon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Findari");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Yes, this god exists.");
talkEntry:addResponse("I heard about priests of this god, but I cannot remeber the name of the priest.");
talkEntry:addResponse("I believe in Bragon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Findari");
talkEntry:addResponse("Ja, dieser Gotte exestiert.");
talkEntry:addResponse("I hörte von einem Priester dieser Gottheit, aber ich kann mich nicht an den Namen des Priesters erinnern.");
talkEntry:addResponse("Ich glaube an Bragon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Yes, this god exists.");
talkEntry:addResponse("I heard about priests of this god, but I cannot remeber the name of the priest.");
talkEntry:addResponse("I believe in Bragon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("Ja, dieser Gotte exestiert.");
talkEntry:addResponse("I hörte von einem Priester dieser Gottheit, aber ich kann mich nicht an den Namen des Priesters erinnern.");
talkEntry:addResponse("Ich glaube an Bragon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Yes, this god exists.");
talkEntry:addResponse("I heard about priests of this god, but I cannot remeber the name of the priest.");
talkEntry:addResponse("I believe in Bragon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addResponse("Ja, dieser Gotte exestiert.");
talkEntry:addResponse("I hörte von einem Priester dieser Gottheit, aber ich kann mich nicht an den Namen des Priesters erinnern.");
talkEntry:addResponse("Ich glaube an Bragon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Moshran");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I don't talk about this god.");
talkEntry:addResponse("I heard about priests of this god, but I cannot remeber the name of the priest.");
talkEntry:addResponse("He stole mine god the dragons.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Moshran");
talkEntry:addResponse("Über diesen Gott spreche ich nicht.");
talkEntry:addResponse("Es gibt Gerüchte, dass der Tempel ihm folgt.");
talkEntry:addResponse("Er hat meinen Göttern die Drachen gestohlen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addTrigger("Nargùn");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Yes, this god exists.");
talkEntry:addResponse("I heard about priests of this god, but I cannot remeber the name of the priest.");
talkEntry:addResponse("I believe in Bragon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addTrigger("Nargùn");
talkEntry:addResponse("Ja, dieser Gotte exestiert.");
talkEntry:addResponse("I hörte von einem Priester dieser Gottheit, aber ich kann mich nicht an den Namen des Priesters erinnern.");
talkEntry:addResponse("Ich glaube an Bragon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oldra");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Yes, this god exists.");
talkEntry:addResponse("I heard about priests of this god, but I cannot remeber the name of the priest.");
talkEntry:addResponse("I believe in Bragon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("Ja, dieser Gotte exestiert.");
talkEntry:addResponse("I hörte von einem Priester dieser Gottheit, aber ich kann mich nicht an den Namen des Priesters erinnern.");
talkEntry:addResponse("Ich glaube an Bragon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ronagan");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Yes, this god exists.");
talkEntry:addResponse("I heard about priests of this god, but I cannot remeber the name of the priest.");
talkEntry:addResponse("I believe in Bragon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("Ja, dieser Gotte exestiert.");
talkEntry:addResponse("I hörte von einem Priester dieser Gottheit, aber ich kann mich nicht an den Namen des Priesters erinnern.");
talkEntry:addResponse("Ich glaube an Bragon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sirani");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Yes, this god exists.");
talkEntry:addResponse("I heard about priests of this god, but I cannot remeber the name of the priest.");
talkEntry:addResponse("I believe in Bragon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("Ja, dieser Gotte exestiert.");
talkEntry:addResponse("I hörte von einem Priester dieser Gottheit, aber ich kann mich nicht an den Namen des Priesters erinnern.");
talkEntry:addResponse("Ich glaube an Bragon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Yes, this god exists.");
talkEntry:addResponse("I heard about priests of this god, but I cannot remeber the name of the priest.");
talkEntry:addResponse("I believe in Bragon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("Ja, dieser Gotte exestiert.");
talkEntry:addResponse("I hörte von einem Priester dieser Gottheit, aber ich kann mich nicht an den Namen des Priesters erinnern.");
talkEntry:addResponse("Ich glaube an Bragon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ushara");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Yes, this god exists.");
talkEntry:addResponse("I heard about priests of this god, but I cannot remeber the name of the priest.");
talkEntry:addResponse("I believe in Bragon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("Ja, dieser Gotte exestiert.");
talkEntry:addResponse("I hörte von einem Priester dieser Gottheit, aber ich kann mich nicht an den Namen des Priesters erinnern.");
talkEntry:addResponse("Ich glaube an Bragon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zhambra");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Yes, this god exists.");
talkEntry:addResponse("I heard about priests of this god, but I cannot remeber the name of the priest.");
talkEntry:addResponse("I believe in Bragon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zhambra");
talkEntry:addResponse("Ja, dieser Gotte exestiert.");
talkEntry:addResponse("I hörte von einem Priester dieser Gottheit, aber ich kann mich nicht an den Namen des Priesters erinnern.");
talkEntry:addResponse("Ich glaube an Bragon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("know");
talkEntry:addTrigger("question");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 4));
talkEntry:addResponse("You want to know something from me... Well, why should I answer such a question? Probably you can do something for me too. I could need something. To be honest, three things. But bring me a pure fire for the beginning. Are you able to do so?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("wissen");
talkEntry:addTrigger("Frage");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 4));
talkEntry:addResponse("Du möchtest etwas von mir wissen... Warum sollte ich dir eine Antwort auf die Frage geben? Vielleicht kannst du auch etwas für mich tun. Ich könnte schon etwas brauchen. Drei Dinge eigentlich, aber bringe mir erstmal ein reines Feuer. Schafft ihr das?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("You want to know something from me... Well, why should I answer such a question? Probably you can do something for me too. I could need something. To be honest, three things. But bring me a pure fire for the beginning. Are you able to do so?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 4));
talkEntry:addResponse("Du möchtest etwas von mir wissen... Warum sollte ich dir eine Antwort auf die Frage geben? Vielleicht kannst du auch etwas für mich tun. Ich könnte schon etwas brauchen. Drei Dinge eigentlich, aber bringe mir erstmal ein reines Feuer. Schafft ihr das?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 5));
talkEntry:addResponse("In this case, I will wait for you here to give you further introduction as soon as you brought the pure fire.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 5));
talkEntry:addResponse("In diesem Falle werde ich auch euch hier warten um euch dann weitere Anweisungen zu geben wenn ihr das reine Feuer gebracht habt.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 5));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("In this case, I will wait for you here to give you further introduction as soon as you brought the pure fire.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 5));
talkEntry:addResponse("In diesem Falle werde ich auch euch hier warten um euch dann weitere Anweisungen zu geben wenn ihr das reine Feuer gebracht habt.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hello");
talkEntry:addTrigger("Greetings");
talkEntry:addTrigger("Be greeted");
talkEntry:addTrigger("Greet");
talkEntry:addTrigger("Hail");
talkEntry:addTrigger("Good day");
talkEntry:addTrigger("Good morning");
talkEntry:addTrigger("Good evening");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 6));
talkEntry:addResponse("Do you have the pure fire?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "+", 1));
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
talkEntry:addTrigger("mit dir");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 6));
talkEntry:addResponse("Habt ihr mir das reine Feuer mitgebracht?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greebas");
talkEntry:addTrigger("Greebs");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 6));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Do you have the pure fire?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greebas");
talkEntry:addTrigger("Greebs");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 6));
talkEntry:addResponse("Habt ihr mir das reine Feuer mitgebracht?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(2553, "all", ">", 0));
talkEntry:addResponse("Well done, you are ready for the next task. Do you want to know more about it?");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2553, 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(2553, "all", ">", 0));
talkEntry:addResponse("Gut gemacht, du bist bereit für die nächste Aufgabe. Wollt ihr mehr darüber wissen?");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2553, 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(2553, "all", ">", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Well done, you are ready for the next task. Do you want to know more about it?");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2553, 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(2553, "all", ">", 0));
talkEntry:addResponse("Gut gemacht, du bist bereit für die nächste Aufgabe. Wollt ihr mehr darüber wissen?");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2553, 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(2553, "all", "=", 0));
talkEntry:addResponse("Please, do not interupt me until you got the pure fire!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(2553, "all", "=", 0));
talkEntry:addResponse("Bitte stört mich nicht bis ihr das reine Feuer habt!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(2553, "all", "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Please, do not interupt me until you got the pure fire!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(2553, "all", "=", 0));
talkEntry:addResponse("Bitte stört mich nicht bis ihr das reine Feuer habt!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 8));
talkEntry:addResponse("Well, look at my robe... It looks old. Please bring me a new one. Are you fine with that?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 8));
talkEntry:addResponse("Nun, schaut auf meine Robe... Sie ist schon alt. Bitte bringt mir eine neue. Einverstanden?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 8));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Well, look at my robe... It looks old. Please bring me a new one. Are you fine with that?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 8));
talkEntry:addResponse("Nun, schaut auf meine Robe... Sie ist schon alt. Bitte bringt mir eine neue. Einverstanden?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 9));
talkEntry:addResponse("Very good. I am looking forward for the new red priest robe.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 9));
talkEntry:addResponse("Sehr gut. Ich freue mich schon auf die neue rote Priesterrobe");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 9));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Very good. I am looking forward for the new red priest robe.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 9));
talkEntry:addResponse("Sehr gut. Ich freue mich schon auf die neue rote Priesterrobe");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hello");
talkEntry:addTrigger("Greetings");
talkEntry:addTrigger("Be greeted");
talkEntry:addTrigger("Greet");
talkEntry:addTrigger("Hail");
talkEntry:addTrigger("Good day");
talkEntry:addTrigger("Good morning");
talkEntry:addTrigger("Good evening");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 10));
talkEntry:addResponse("Do you have the red priest robe?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "+", 1));
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
talkEntry:addTrigger("mit dir");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 10));
talkEntry:addResponse("Habt ihr mir die rote Priesterrobe mitgebracht?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greebas");
talkEntry:addTrigger("Greebs");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 10));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Do you have the red priest robe?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greebas");
talkEntry:addTrigger("Greebs");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 10));
talkEntry:addResponse("Habt ihr mir die rote Priesterrobe mitgebracht?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 11));
talkEntry:addCondition(npc.base.condition.item.item(2419, "all", ">", 0));
talkEntry:addResponse("Well done, you are ready for the next task. Do you want to know more about it?");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2419, 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 11));
talkEntry:addCondition(npc.base.condition.item.item(2419, "all", ">", 0));
talkEntry:addResponse("Gut gemacht, du bist bereit für die nächste Aufgabe. Wollt ihr mehr darüber wissen?");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2419, 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 11));
talkEntry:addCondition(npc.base.condition.item.item(2419, "all", ">", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Well done, you are ready for the next task. Do you want to know more about it?");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2419, 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 11));
talkEntry:addCondition(npc.base.condition.item.item(2419, "all", ">", 0));
talkEntry:addResponse("Gut gemacht, du bist bereit für die nächste Aufgabe. Wollt ihr mehr darüber wissen?");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2419, 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 11));
talkEntry:addCondition(npc.base.condition.item.item(2419, "all", "=", 0));
talkEntry:addResponse("Please, do not interupt me until you got the red priest robe!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 11));
talkEntry:addCondition(npc.base.condition.item.item(2419, "all", "=", 0));
talkEntry:addResponse("Bitte stört mich nicht bis ihr die rote Priesterrobe habt!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 11));
talkEntry:addCondition(npc.base.condition.item.item(2419, "all", "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Please, do not interupt me until you got the red priest robe!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 11));
talkEntry:addCondition(npc.base.condition.item.item(2419, "all", "=", 0));
talkEntry:addResponse("Bitte stört mich nicht bis ihr die rote Priesterrobe habt!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 12));
talkEntry:addResponse("I am also preparing a ritual for Bragon and I need a golden goblet. Could you bring me one?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 12));
talkEntry:addResponse("Ich bin am vorbereiten eines Rituals für Bragon and brauche einen Goldkelch hierfür. Könnt ihr mir einen bringen?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 12));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I am also preparing a ritual for Bragon and I need a golden goblet. Could you bring me one?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 12));
talkEntry:addResponse("Ich bin am vorbereiten eines Rituals für Bragon and brauche einen Goldkelch hierfür. Könnt ihr mir einen bringen?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 13));
talkEntry:addResponse("Perfect. But now run! Bragon is waiting");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 13));
talkEntry:addResponse("Perfekt. Aber lauft nun! Bragon wartet.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 13));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Perfect. But now run! Bragon is waiting");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 13));
talkEntry:addResponse("Perfekt. Aber lauft nun! Bragon wartet.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hello");
talkEntry:addTrigger("Greetings");
talkEntry:addTrigger("Be greeted");
talkEntry:addTrigger("Greet");
talkEntry:addTrigger("Hail");
talkEntry:addTrigger("Good day");
talkEntry:addTrigger("Good morning");
talkEntry:addTrigger("Good evening");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 14));
talkEntry:addResponse("Do you have the golden goblet?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "+", 1));
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
talkEntry:addTrigger("mit dir");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 14));
talkEntry:addResponse("Habt ihr mir den Goldkelch mitgebracht?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greebas");
talkEntry:addTrigger("Greebs");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 14));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Do you have the golden goblet?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greebas");
talkEntry:addTrigger("Greebs");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 14));
talkEntry:addResponse("Habt ihr mir den Goldkelch mitgebracht?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 15));
talkEntry:addCondition(npc.base.condition.item.item(2419, "all", ">", 0));
talkEntry:addResponse("You have done everything I asked you. What is your question now?");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2419, 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 15));
talkEntry:addCondition(npc.base.condition.item.item(2419, "all", ">", 0));
talkEntry:addResponse("Ihr habt alles getan, wss ich haben wollte. Was ist eure Frage nun?");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2419, 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 15));
talkEntry:addCondition(npc.base.condition.item.item(2419, "all", ">", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("You have done everything I asked you. What is your question now?");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2419, 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 15));
talkEntry:addCondition(npc.base.condition.item.item(2419, "all", ">", 0));
talkEntry:addResponse("Ihr habt alles getan, wss ich haben wollte. Was ist eure Frage nun?");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2419, 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 15));
talkEntry:addCondition(npc.base.condition.item.item(2419, "all", "=", 0));
talkEntry:addResponse("Please, do not interupt me until you got the golden goblet!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 15));
talkEntry:addCondition(npc.base.condition.item.item(2419, "all", "=", 0));
talkEntry:addResponse("Bitte stört mich nicht bis ihr den Goldkelch habt!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 15));
talkEntry:addCondition(npc.base.condition.item.item(2419, "all", "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Please, do not interupt me until you got the golden goblet!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 15));
talkEntry:addCondition(npc.base.condition.item.item(2419, "all", "=", 0));
talkEntry:addResponse("Bitte stört mich nicht bis ihr den Goldkelch habt!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("age");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 16));
talkEntry:addResponse("That is not difficult, of course. It was in the Age of Concord! *sings few lines to himselves* The world is perfect. You cannot improve her.La, la,....well, I hope you are satisfied with this answer! Farewell! *lowers his head and starts praying*");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zeitalter");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 16));
talkEntry:addResponse("Das ist nicht schwierig, gewiss. Es war im Zeitalter der Eintracht! *singt einige zeilen vor sich her* Die Welt ist perfekt. Man kann sie nicht verbessern. La, la,...nun gut, ich hoffe ihr seid zufrieden mit der Antwort! Lebt wohl! *senkt seinen Kopf und beginnt zu beten*");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("support");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 16));
talkEntry:addResponse("That is not difficult, of course. Bragon had hope to comfort the Blootgod in his loneliness through the creation of the orks! ...well, I hope you are satisfied with this answer! Farewell! *lowers his head and starts praying*");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Unterstützung");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 16));
talkEntry:addResponse("Das ist nicht schwierig, gewiss. Bragon hatte die Hoffnung den Blutgott in seiner Einsamkeit zu trösten durch die Erschaffung der Orks! ...nun gut, ich hoffe ihr seid zufrieden mit der Antwort! Lebt wohl! *senkt seinen Kopf und beginnt zu beten*");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Purge");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 16));
talkEntry:addResponse("That is not difficult, of course. Bragon is the lifegiver, and purge of all impurity and weakness! ...well, I hope you are satisfied with this answer! Farewell! *lowers his head and starts praying*");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Vernichter");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 16));
talkEntry:addResponse("Das ist nicht schwierig, gewiss. Bragon ist der Lebensspender und Vernichter alles Unreinen und Schwachen! ...nun gut, ich hoffe ihr seid zufrieden mit der Antwort! Lebt wohl! *senkt seinen Kopf und beginnt zu beten*");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("realized");
talkEntry:addTrigger("realised");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 16));
talkEntry:addResponse("That is not difficult, of course. It was in the Age of Discord! *sings few lines to himselves* Deep down, where loneliness and darkness reign. Deep down, where the soul consumes itself....well, I hope you are satisfied with this answer! Farewell! *lowers his head and starts praying*");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("bemerkt hat");
talkEntry:addTrigger("erkannt hat");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 16));
talkEntry:addResponse("Das ist nicht schwierig, gewiss. Es war im Zeitalter der Zwietracht! *singt einige zeilen vor sich her* Tief unten, wo Einsamkeit und Dunkelheit herrschen. Tief unten, wo die Seele sich selbst verzehrt....nun gut, ich hoffe ihr seid zufrieden mit der Antwort! Lebt wohl! *senkt seinen Kopf und beginnt zu beten*");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sun");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 16));
talkEntry:addResponse("That is not difficult, of course. 'Daily sunmaker'! ...well, I hope you are satisfied with this answer! Farewell! *lowers his head and starts praying*");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sonne");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 16));
talkEntry:addResponse("Das ist nicht schwierig, gewiss. 'Täglich Sonnenmacher'! ...nun gut, ich hoffe ihr seid zufrieden mit der Antwort! Lebt wohl! *senkt seinen Kopf und beginnt zu beten*");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("remedy");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 16));
talkEntry:addResponse("That is not difficult, of course. Dragons! He sent dragons into the battle...well, I hope you are satisfied with this answer! Farewell! *lowers his head and starts praying*");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wiedergutmachung");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 16));
talkEntry:addResponse("Das ist nicht schwierig, gewiss. Drachen! Er sendete Drachen in die Schlacht...nun gut, ich hoffe ihr seid zufrieden mit der Antwort! Lebt wohl! *senkt seinen Kopf und beginnt zu beten*");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("relationship");
talkEntry:addTrigger("relate");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 16));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("That is not difficult, of course. Fire! There is a fire in both you have never seen before I guess...well, I hope you are satisfied with this answer! Farewell! *lowers his head and starts praying*");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("verbindet");
talkEntry:addTrigger("verbindung");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 16));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Das ist nicht schwierig, gewiss. Feuer! Da brennt ein Feuer in beiden, dass du bestimmt noch nicht gesehen hast wie ich annehme...nun gut, ich hoffe ihr seid zufrieden mit der Antwort! Lebt wohl! *senkt seinen Kopf und beginnt zu beten*");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Summer");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 16));
talkEntry:addResponse("That is not difficult, of course.`'Strong in summer'! ...well, I hope you are satisfied with this answer! Farewell! *lowers his head and starts praying*");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sommer");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 16));
talkEntry:addResponse("Das ist nicht schwierig, gewiss. 'Stark im Sommer'! ...nun gut, ich hoffe ihr seid zufrieden mit der Antwort! Lebt wohl! *senkt seinen Kopf und beginnt zu beten*");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("pray");
talkEntry:addTrigger("praying");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 16));
talkEntry:addResponse("That is not difficult, of course. The orcs see Bragon as the one who gives live! ...well, I hope you are satisfied with this answer! Farewell! *lowers his head and starts praying*");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beten");
talkEntry:addTrigger("gebet");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 16));
talkEntry:addResponse("Das ist nicht schwierig, gewiss. Die Orks sehen Bragon als denjenigen der das Leben schenkt! ...nun gut, ich hoffe ihr seid zufrieden mit der Antwort! Lebt wohl! *senkt seinen Kopf und beginnt zu beten*");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tribunal of Eternity");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 16));
talkEntry:addResponse("That is not difficult, of course. Among other things Bragon will discern whether they lived for the purpose of the Holy Flame or not! ...well, I hope you are satisfied with this answer! Farewell! *lowers his head and starts praying*");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tribunal der Ewigkeit");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 16));
talkEntry:addResponse("Das ist nicht schwierig, gewiss. Untereanderem Brágon wird feststellen, ob sie gerecht und im Sinne der heiligen Flamme gelebt haben! ...nun gut, ich hoffe ihr seid zufrieden mit der Antwort! Lebt wohl! *senkt seinen Kopf und beginnt zu beten*");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me kniet vor dem Alter.", "#me kneels infront of the altar.");
talkingNPC:addCycleText("#me klopft gegen den Alter und ruft 'Heil dir Bragon!'", "#me knocks against the altar and calls 'Hail Bragon!'");
talkingNPC:addCycleText("#me poliert gedankenverloren seinen Goldring.", "#me seems to be lost in thought while polishing a gold ring.");
talkingNPC:addCycleText("#me murmelt vor sich hin: 'Bragon, möchte uns dein Feuer leuchten.'", "#me mumbles: 'Bragan, your fire shall be a light for us.'");
talkingNPC:addCycleText("Bragon, er ist weise, stark, nobel, einfach wunderbar.", "Bragon, he is wise, strong, noble and simple handsome.");
talkingNPC:addCycleText("Er belohnt manchmal Leute mit heilgen, wertvollen Dinge in diesem Temple.", "He sometimes blesses people who sacrifice valuable things in his temple.");
talkingNPC:addCycleText("Malachin, nicht gerade wie Bragon!", "Malachin, just not as Bragon!");
talkingNPC:addCycleText("Hmm... wo kriege ich nur mehr Gold her?", "Hmm... where do I get more gold?");
talkingNPC:addCycleText("#me hält seinen Priesterstab gehn Himmel und ruft nach Bragon", "#me holds his cleric's staff to heaven and calls for Bragon.");
talkingNPC:addCycleText("#me betrachtet seinen Rubin mit wohlwollen.", "#me looks at his rubin with a satisfied glance in his face.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(1);
mainNPC:addLanguage(10);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("#me kniet vor dem Altar und betet.", "#me kneels infront of the altar and prais.");
mainNPC:setUseMessage("Dein Feuer berühre und erleuchte mich!", "Your fire touches and enlightens me!");
mainNPC:setConfusedMessage("#me blickt verwirrt.", "#me looks confused.");
mainNPC:setEquipment(1, 358);
mainNPC:setEquipment(3, 182);
mainNPC:setEquipment(11, 2419);
mainNPC:setEquipment(5, 40);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 2295);
mainNPC:setEquipment(9, 34);
mainNPC:setEquipment(10, 53);
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
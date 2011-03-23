--------------------------------------------------------------------------------
-- NPC Name: Beror Oakaxe                                             Cadomyr --
-- NPC Job:  Quartermaster                                                    --
--                                                                            --
-- NPC Race: dwarf                      NPC Position:  135, 620, 0            --
-- NPC Sex:  male                       NPC Direction: south                  --
--                                                                            --
-- Author:   Estralis Seborian                                                --
--                                                                            --
-- Last parsing: March 23, 2011                          easyNPC Parser v1.02 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (1, 135, 620, 0, 4, 'Beror Oakaxe', 'npc.beror_oakaxe', 0, 3, 1, 17, 17, 17, 240, 175, 130);
---]]

require("npc.base.basic")
require("npc.base.condition.language")
require("npc.base.consequence.inform")
require("npc.base.talk")
module("npc.beror_oakaxe", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Beror Oakaxe the quartermaster. Keyphrases: Hello, Quest, Orders, TRIGGER4, TRIGGER5."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Beror Oakaxe der Quartiermeister. Schlüsselwörter: Hallo, Quest, Befehle, TRIGGER4, TRIGGER5."));
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
talkEntry:addResponse("Ha! A new recruit. You came here to get your orders for today, right?");
talkEntry:addResponse("Attention! The queen issued new orders. And her majesty does not like to see any delay.");
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
talkEntry:addResponse("Ha! Ein neuer Rekrut. Du bist hier, um deinen Tagesbefehl zu erhalten, richtig?");
talkEntry:addResponse("Hergehört! Die Königin hat neue Befehle ausgegeben. Und ihre Majestät mag keine Verzögerungen in ihrer Ausführung.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Ha! A new recruit. You came here to get your orders for today, right?");
talkEntry:addResponse("Attention! The queen issued new orders. And her majesty does not like to see any delay.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Ha! Ein neuer Rekrut. Du bist hier, um deinen Tagesbefehl zu erhalten, richtig?");
talkEntry:addResponse("Hergehört! Die Königin hat neue Befehle ausgegeben. Und ihre Majestät mag keine Verzögerungen in ihrer Ausführung.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Dismissed.");
talkEntry:addResponse("Best of luck.");
talkEntry:addResponse("Move out!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Wegetreten.");
talkEntry:addResponse("Viel Glück.");
talkEntry:addResponse("Los!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Dismissed.");
talkEntry:addResponse("Best of luck.");
talkEntry:addResponse("Move out!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Wegetreten.");
talkEntry:addResponse("Viel Glück.");
talkEntry:addResponse("Los!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("Casual conversation? Small talk? Do you think Cadomyr was built by words!?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befind");
talkEntry:addResponse("Eine entspannte Unterhaltung? Klatsch und Tratsch? Denkst du, Cadomyr wurde mit Worten gebaut!?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("I am the royal quartermaster Beror Oakaxe. And yes, I am a dwarf. An angry dwarf!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Ich bin der königliches Quartiermeister Beror Oakaxe. Und ja, ich bin ein Zwerg. Ein zorniger Zwerg!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("I am the royal quartermaster. Didn't I just mention that!?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Ich bin der königliche Quartiermeister. Hab ich das nicht eben schon gesagt!?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I am the royal quartermaster. Didn't I just mention that!?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Ich bin der königliche Quartiermeister. Hab ich das nicht eben schon gesagt!?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("When all those refugees came I was glad that the scum went to Galmair. Otherwise, it might have ended up in a bloodbath.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Als all die Flüchtlinge kamen war ich sehr froh darüber, dass der Abschaum nach Galmair gegangen ist. Anderenfalls hättes es hier wohlmöglich noch ein Blutbad gegeben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("I'll call you private Cotton Swab if you don't mind.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Ich werde dich Gefreiter Wattebausch nennen, wenns dich nicht stört.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quartermaster");
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("order");
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("knight");
talkEntry:addTrigger("page");
talkEntry:addResponse("So, you want to become a queen's knight like all the heroes your mother told you about before you went to bed? Ha! The first thing a knight has to learn is to obey orders. I got plenty!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("YOURTRIGGER4");
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("YOURTRIGGER5");
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Quartiermeister");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ritter");
talkEntry:addTrigger("Knappe");
talkEntry:addResponse("So, du willst also ein Ritter der Königin werden, genauso wie all die Helden, von denen dir deine Mutter erzählt hat, bevor sie dich ins Bett gebracht hat? Ha! Das erste, was ein Ritter lernen muss, ist Befehlen zu gehorchen. Und ich hab davon eine Menge!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("DEINTRIGGER4");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("DEINTRIGGER5");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Queen");
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königin");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("I obey queen Rosaline alone and if she orders me to worship a god, I'll worship it.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Ich gehorche nur Königin Rosaline und wenn sie mir befiehlt, einem Gott zu huldigen, dann tu ich das auch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Adron");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("You may worship whatever god you want as long as you do obey the orders of her majesty. Loyality counts more than faith here in Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Adron");
talkEntry:addResponse("Es ist mir egal, zu welchem Gott du betest, solange du den Befehlen ihrer Majestät gehorchst. Loyalität zählt hier in Cadomyr mehr als dein Glaube.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Well, Brágon's impact on Illarion is still a mystery to me. So, he gave us the fire? When I light a candle, it burns, not much of a miracle.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addResponse("Nun, Brágons Bedeutung für Illarion ist mir immernoch unklar. Er hat uns angeblich das Feuer gegeben? Wenn ich eine Kerze anzünde, dann brennt sie, soll das etwa ein Wunder sein?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Pray to Cherga if you want to meet her, I say!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addResponse("Betet zu Cherga, wenn ihr sie treffen wollt, ja das sage ich!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elara");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("You may worship whatever god you want as long as you do obey the orders of her majesty. Loyality counts more than faith here in Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elara");
talkEntry:addResponse("Es ist mir egal, zu welchem Gott du betest, solange du den Befehlen ihrer Majestät gehorchst. Loyalität zählt hier in Cadomyr mehr als dein Glaube.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eldan");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("You may worship whatever god you want as long as you do obey the orders of her majesty. Loyality counts more than faith here in Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eldan");
talkEntry:addResponse("Es ist mir egal, zu welchem Gott du betest, solange du den Befehlen ihrer Majestät gehorchst. Loyalität zählt hier in Cadomyr mehr als dein Glaube.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Findari");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("You may worship whatever god you want as long as you do obey the orders of her majesty. Loyality counts more than faith here in Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Findari");
talkEntry:addResponse("Es ist mir egal, zu welchem Gott du betest, solange du den Befehlen ihrer Majestät gehorchst. Loyalität zählt hier in Cadomyr mehr als dein Glaube.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("You may worship whatever god you want as long as you do obey the orders of her majesty. Loyality counts more than faith here in Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("Es ist mir egal, zu welchem Gott du betest, solange du den Befehlen ihrer Majestät gehorchst. Loyalität zählt hier in Cadomyr mehr als dein Glaube.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Ah, yes, all proud knights pray to Malachín and eat their vegetables - forget all that! Loyality is what makes a knight, not begging for divine assistance.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addResponse("Ja, ja, edle Ritter beten zu Malachín und essen brav ihr Gemüse - vergiss es! Loyalität ist das, was einen Ritter ausmacht, nicht das betteln nach göttlichem Beistand.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Moshran");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("You may even worship Moshran, I have no problem with that. But any jokes about the queen and you'd wish that you were never born.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Moshran");
talkEntry:addResponse("Du kannst von mir aus zu Moshran beten, ich hab da kein Problem mit. Aber erzähl irgendwelche Witze über die Königin und du wirst dir wünschen, nie geboren worden zu sein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addTrigger("Nargùn");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("You may worship whatever god you want as long as you do obey the orders of her majesty. Loyality counts more than faith here in Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addTrigger("Nargùn");
talkEntry:addResponse("Es ist mir egal, zu welchem Gott du betest, solange du den Befehlen ihrer Majestät gehorchst. Loyalität zählt hier in Cadomyr mehr als dein Glaube.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oldra");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("You may worship whatever god you want as long as you do obey the orders of her majesty. Loyality counts more than faith here in Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("Es ist mir egal, zu welchem Gott du betest, solange du den Befehlen ihrer Majestät gehorchst. Loyalität zählt hier in Cadomyr mehr als dein Glaube.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ronagan");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("You may worship whatever god you want as long as you do obey the orders of her majesty. Loyality counts more than faith here in Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("Es ist mir egal, zu welchem Gott du betest, solange du den Befehlen ihrer Majestät gehorchst. Loyalität zählt hier in Cadomyr mehr als dein Glaube.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sirani");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Girls wanna have fun, eh?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("Mädchen wollen auch mal Spaß, eh?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("You may worship whatever god you want as long as you do obey the orders of her majesty. Loyality counts more than faith here in Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("Es ist mir egal, zu welchem Gott du betest, solange du den Befehlen ihrer Majestät gehorchst. Loyalität zählt hier in Cadomyr mehr als dein Glaube.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ushara");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("You may worship whatever god you want as long as you do obey the orders of her majesty. Loyality counts more than faith here in Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("Es ist mir egal, zu welchem Gott du betest, solange du den Befehlen ihrer Majestät gehorchst. Loyalität zählt hier in Cadomyr mehr als dein Glaube.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zhambra");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("The doctrines of Zhambra's followers are also mine. Does that make me a follower of Zhambra? I do not know and I do not care.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zhambra");
talkEntry:addResponse("Die Doktrin der Anhänger Zhambra's sind auch meine. Bin ich also ein Anhänger Zhambras? Ich weiß es nicht und es ist mir eigentlich auch egal.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Beror");
talkEntry:addTrigger("Oakaxe");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Beror");
talkEntry:addTrigger("Oakaxe");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("Willkommen in Cadomyr.", "Welcome to Cadomyr.");
talkingNPC:addCycleText("Zwerge sind ungewöhnlich für Cadomyr? Sehe ich ungewöhnlich aus? Ich zeig dir gleich ungewöhnlich!", "Dwarves are uncommon in Cadomyr? Do I look uncommon? I'll show you something uncommon!");
talkingNPC:addCycleText("Ich bin es gewohnt, Befehle zu schreien. Hier im Inneren eines Hauses, brauche ich nicht zu schreien. Ihr werdet es aber, solltet ihr meine Befehle missachten.", "I am used to yell orders. But inside this house, I won't yell - but you'll scream if you disobey!");
talkingNPC:addCycleText("Achtung!", "Attention!");
talkingNPC:addCycleText("Du da! Komm mal her.", "You! Come here.");
talkingNPC:addCycleText("Wo ist Gefreiter Rasselschwinger schon wieder!?", "Where is private Rattleswinger again!?");
talkingNPC:addCycleText("GERMAN.", "ENGLISH.");
talkingNPC:addCycleText("GERMAN.", "ENGLISH.");
talkingNPC:addCycleText("GERMAN.", "ENGLISH.");
talkingNPC:addCycleText("GERMAN.", "ENGLISH.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(2);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Dieser NPC ist Beror Oakaxe der Quartiermeister.", "This NPC is Beror Oakaxe the quartermaster.");
mainNPC:setUseMessage("Fasst mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut verwirrt.", "#me looks around confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 101);
mainNPC:setEquipment(11, 195);
mainNPC:setEquipment(5, 226);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 325);
mainNPC:setEquipment(9, 2117);
mainNPC:setEquipment(10, 770);
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
--------------------------------------------------------------------------------
-- NPC Name: Morthis Nebulum                                         Runewick --
-- NPC Job:  Mage                                                             --
--                                                                            --
-- NPC Race: human                      NPC Position:  898, 799, 0            --
-- NPC Sex:  male                       NPC Direction: south                  --
--                                                                            --
-- Author:   Flux                                                             --
--                                                                            --
-- Last parsing: May 23, 2011                            easyNPC Parser v1.02 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (0, 898, 799, 0, 4, 'Morthis Nebulum', 'npc.morthis_nebulum', 0, 2, 5, 123, 62, 9, 245, 180, 137);
---]]

require("npc.base.basic")
require("npc.base.condition.basestate")
require("npc.base.condition.language")
require("npc.base.consequence.inform")
require("npc.base.consequence.talkstate")
require("npc.base.talk")
module("npc.morthis_nebulum", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Morthis Nebulum the Necromancer. Keywords: Magic, Lor Angur, Necromany, Archmage, Blood."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Morthis Nebulum der Nekromant. Schlüsselwörter: Magie, Lor Angur, Nekromantie, Archmage, Erzmagier, Blut."));
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
talkEntry:addCondition(npc.base.condition.basestate.basestate("idle"));
talkEntry:addResponse("Hello. And goodbye if you know what's good for you.");
talkEntry:addResponse("Ah, my new practice target, greetings.");
talkEntry:addResponse("Hurry up. Spit it out.");
talkEntry:addConsequence(npc.base.consequence.talkstate.talkstate("begin"));
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
talkEntry:addCondition(npc.base.condition.basestate.basestate("idle"));
talkEntry:addResponse("Hallo. Und auf bald, wenn Ihr wisst, was gut für Euch ist.");
talkEntry:addResponse("Ah, mein neues Versuchsobjekt, Grüße.");
talkEntry:addResponse("Beeilt Euch. Heraus mit der Sprache!");
talkEntry:addConsequence(npc.base.consequence.talkstate.talkstate("begin"));
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
talkEntry:addCondition(npc.base.condition.basestate.basestate("idle"));
talkEntry:addResponse("Hello. And goodbye if you know what's good for you.");
talkEntry:addResponse("Ah, my new practice target, greetings.");
talkEntry:addResponse("Hurry up. Spit it out.");
talkEntry:addConsequence(npc.base.consequence.talkstate.talkstate("begin"));
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
talkEntry:addCondition(npc.base.condition.basestate.basestate("idle"));
talkEntry:addResponse("Hallo. Und auf bald, wenn Ihr wisst, was gut für Euch ist.");
talkEntry:addResponse("Ah, mein neues Versuchsobjekt, Grüße.");
talkEntry:addResponse("Beeilt Euch. Heraus mit der Sprache!");
talkEntry:addConsequence(npc.base.consequence.talkstate.talkstate("begin"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.basestate.basestate("busy"));
talkEntry:addResponse("Can't you see I'm in the middle of a conversation here?");
talkEntry:addResponse("Didn't your parents teach you manners?");
talkEntry:addResponse("I have enough problems with this one without someone else bothering me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.basestate.basestate("busy"));
talkEntry:addResponse("Könnt Ihr nicht sehen, dass ich gerade in einer Unterhaltung bin? ");
talkEntry:addResponse("Haben Euch Eure Eltern keine Manieren beigebracht?");
talkEntry:addResponse("Ich habe genug Probleme auch ohne dass mich noch jemand belästigt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Good bye");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare thee well");
talkEntry:addResponse("About time.");
talkEntry:addResponse("Don't bother returning.");
talkEntry:addResponse("Yes, yes, whatever.");
talkEntry:addConsequence(npc.base.consequence.talkstate.talkstate("end"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehabt euch wohl");
talkEntry:addResponse("Wird ja auch Zeit.");
talkEntry:addResponse("Bemüht Euch nicht zurückzukommen.");
talkEntry:addResponse("Ja, ja, was auch immer.");
talkEntry:addConsequence(npc.base.consequence.talkstate.talkstate("end"));
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
talkEntry:addResponse("About time.");
talkEntry:addResponse("Don't bother returning.");
talkEntry:addResponse("Yes, yes, whatever.");
talkEntry:addConsequence(npc.base.consequence.talkstate.talkstate("end"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Wird ja auch Zeit.");
talkEntry:addResponse("Bemüht Euch nicht zurückzukommen.");
talkEntry:addResponse("Ja, ja, was auch immer.");
talkEntry:addConsequence(npc.base.consequence.talkstate.talkstate("end"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("I'd be better if you weren't here.");
talkEntry:addResponse("I'm busy here doing.. things you wouldn't understand. Scram!");
talkEntry:addResponse("I'd be better if you'd leave me alone.");
talkEntry:addConsequence(npc.base.consequence.talkstate.talkstate("end"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befinden");
talkEntry:addResponse("Mir würde es besser gehen, würdet Ihr nicht hier sein.");
talkEntry:addResponse("Ich hab hier Dinge zu tun...die du nicht verstehen würdest. Hau ab!");
talkEntry:addResponse("Mir ginge es besser, würdet Ihr mich alleine lassen.");
talkEntry:addConsequence(npc.base.consequence.talkstate.talkstate("end"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("My name is Morthis Nebulum. Mage extraodinaire.");
talkEntry:addResponse("I am Morthis Nebulum, finest mage in Runewick.");
talkEntry:addResponse("They call me Morthis Nebulum, and my time is much more important than yours.");
talkEntry:addConsequence(npc.base.consequence.talkstate.talkstate("end"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Mein Name ist Morthis Nebulum. Außergewöhnlicher Magier.");
talkEntry:addResponse("Ich bin Morthis Nebulum, der beste Magier in Runewick.");
talkEntry:addResponse("Sie nennen michMorthis Nebulum und meine zeit ist wichtiger als deine.");
talkEntry:addConsequence(npc.base.consequence.talkstate.talkstate("end"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("You think this is the right place to look for a Salesman?");
talkEntry:addResponse("Do I look like a trader to you? Here's a hint. No I don't.");
talkEntry:addResponse("The only thing I'm interested in buying with you around is poison.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Ihr denkt, dies sei der richtige Ort, um einen händler zu finden?");
talkEntry:addResponse("Sehe ich wie ein Händler aus? Hier ist ein Hinweis: Nein, tue ich nicht.");
talkEntry:addResponse("Das einzige, was ich mit dir um mir kaufen würde, ist Gift.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Something tells you you shouldn't trust that information too much"));
talkEntry:addResponse("I hear Elvaine Morgan is immune to sword wounds. Maybe you should check.");
talkEntry:addResponse("Elvaine Morgan always carries round 50 gold coins on his person. Not very good at defending himself either.");
talkEntry:addResponse("I hear Elvaine Morgan enjoys the taste of venom. He gives big rewards to people who make him a good tasting meal.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Etwas sagt dir, du solltest diesen Informationen nicht zu sehr trauen."));
talkEntry:addResponse("Ich hörte, Elvaine Morgan ist immun gegen Wunden verursacht durch Schwerter. Vielleicht solltet Ihr das überprüfen.");
talkEntry:addResponse("Elvaine Morgan trägt immer 50 Goldstücke mit sich herum und er ist auch nicht sehr gut darin, sich zu verteidigen.");
talkEntry:addResponse("Ich hörte, Elvain Morgan erfreut sich am Geschmack von Gift. Er gibt Leuten, die ihm ein gutes Mahl zubereiten eine große Belohnung.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("I am a protector of the pure schools of magic.");
talkEntry:addResponse("I am a mage in the.. darker fields, you might say.");
talkEntry:addResponse("I am a practitioner of the true forms of magic.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Ich bin ein Hüter der reinen Schulen der Magie.");
talkEntry:addResponse("Ich bin ein Magier der.. eher dunklen Bereiche, wenn Ihr es so sagen wollt.");
talkEntry:addResponse("Ich bin ein Ausübender der wahren Formen der Magie.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I am a protector of the pure schools of magic.");
talkEntry:addResponse("I am a mage in the.. darker fields, you might say.");
talkEntry:addResponse("I am a practitioner of the true forms of magic.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Ich bin ein Hüter der reinen Schulen der Magie.");
talkEntry:addResponse("Ich bin ein Magier der.. eher dunklen Bereiche, wenn Ihr es so sagen wollt.");
talkEntry:addResponse("Ich bin ein Ausübender der wahren Formen der Magie.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Ah.. Gobaith. The loss must be hard to cope with.");
talkEntry:addResponse("The loss of that island may have been sad for the citizens but.. the prince of Salkamar was murdered there. That place would always have trouble.");
talkEntry:addResponse("I wish I had time to visit Gobaith before it sank. Field researchers said it lay along a mana fault.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Ah.. Gobaith. Mit dem Verlust fertig zu werden muss schwer sein.");
talkEntry:addResponse("Für die bewohner mag der Verlust der Insel traurig gewesen sein aber.. der Prinz von Salkamar wurde dort ermordet. Dieser Ort hätte immer Ärger gehabt.");
talkEntry:addResponse("Ich wünscht, ich hätte Gobaith besuchen können bevor es sank. Feldstudien besagen, es hätte sich über einen ");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("I am");
talkEntry:addTrigger("my name");
talkEntry:addResponse("Don't think just because you tell me your name I'll be bothered to write you a grave.");
talkEntry:addResponse("As interesting as that is, I'm not interested.");
talkEntry:addResponse("Ah great, nice to meet you, I don't give a damn.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ich bin");
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Denkt bloß nicht, dass ich Euch einen Grabstein aufstelle, nur weil Ihr mir Euren Namen genannt habt.");
talkEntry:addResponse("So interessant wie das auch ist, es interessiert mich nicht.");
talkEntry:addResponse("Ah großartig, freut mich dich zu treffen, es interessiert mich einen feuchten Dreck");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Magic");
talkEntry:addResponse("Some of the arts, like blood magic and necromancy are frowned upon.");
talkEntry:addResponse("True mages are accepting of all branches of magic.");
talkEntry:addResponse("Magic is my life. I am certainly the most talented mage on this isle.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Angur");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Believe you me, as soon as I've done my research, I'm going straight there.");
talkEntry:addResponse("All the interesting new experimentation is done there.");
talkEntry:addResponse("From what I hear, it's the finest place in all the world.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Necromancy");
talkEntry:addResponse("The fine art of raising undead. It's very useful for research.");
talkEntry:addResponse("Don't worry, I'm not going to raise your parents or anything.");
talkEntry:addResponse("You shouldn't talk about things like that around here or they might make up reasons to arrest you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addTrigger("Erzmagier");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I am much more qualified to be the Archmage than that moron.");
talkEntry:addResponse("They would not appoint a necromancer as archmage.");
talkEntry:addResponse("The archmage is supposed to be infallible. I can give a list of problems about Elvaine.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Blood");
talkEntry:addResponse("Blood magic is a noble art, where one must sacrifice for reward");
talkEntry:addResponse("Blood mages aren't necessarily evil. It can be used for good too.");
talkEntry:addResponse("I wouldn't talk about that around here if I were you. They might chuck you out.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Magie");
talkEntry:addResponse("Manche der Künste, wie Blutmagie und Nekromantie, werden missbilligt.");
talkEntry:addResponse("Wahre Magier akzeptieren alle Zweige der Magie.");
talkEntry:addResponse("Die Magie ist mein Leben. Ich bin sicherlich der talentierteste Magier auf dieser Insel.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Angur");
talkEntry:addResponse("Glaubt mir, sobald ich mit meiner Nachforschung fertig bin, gehe ich ohne Umwege dorthin.");
talkEntry:addResponse("Alle interessanten, neuartigen Experimente werden dort gemacht.");
talkEntry:addResponse("Von dem was ich hörte, ist dies der beste Ort der Welt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nekromantie");
talkEntry:addResponse("Die hohe Kunst Untote auferstehen zulassen. Es ist sehr nützlich für Nachforschungen.");
talkEntry:addResponse("Keine Sorge, ich werde nicht Eure Eltern auferwecken oder sonst was.");
talkEntry:addResponse("Ihr solltet über solche Dinge hier nicht reden, sonst erfinden sie irgendeinen Grund Euch zu verhaften.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Ich bin viel mehr qualifiziert der Erzmagier zu sein als dieser Schwachsinnige.");
talkEntry:addResponse("Die würden keinen Nekromanten zum Erzmagier machen.");
talkEntry:addResponse("Der Erzmagier sollte unfehlbar sein. Ich kann da eine ganze Liste mit Problem bezüglich Elvaine geben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Blut");
talkEntry:addResponse("Blutmagie ist eine noble Kunst, bei welche man selbst opfern muss, um eine Belohnung zu erhalten.");
talkEntry:addResponse("Blutmagier sind nicht zwingender weise böse. Es kann auch für gute Dinge genutzt werden.");
talkEntry:addResponse("ich an Eurer Stelle würde nicht so laut hier darüber reden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I can't believe that incompetent fool became the Archmage.");
talkEntry:addResponse("I couldn't have any less respect for that man.");
talkEntry:addResponse("Even his name sounds effeminate.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Ich kann nicht glauben, dass dieser inkompetente Idiot Erzmagier wurde.");
talkEntry:addResponse("Ich könnte nicht weniger Respekt für diesen Mann haben.");
talkEntry:addResponse("Sogar sein Name klingt weibisch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("The city of so called mages.");
talkEntry:addResponse("You would have thought that they, of everyone, would appreciate all forms of magic.");
talkEntry:addResponse("When you're down here you see the true nature of Runewick.");
talkEntry:addResponse("Why do some mages like towers so much anyway?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Die Stadt der so genannten Magier.");
talkEntry:addResponse("Man hätte denken sollen, dass die hier allen voran jeder Form von Magie zu schätzen wissen.");
talkEntry:addResponse("Wenn du hier unten bist, siehst du die wahre Natur Runewicks.");
talkEntry:addResponse("Warum mögen manche Magier überhaupt Türme so sehr?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("He's an.. interesting man. Gets things done, I suppose.");
talkEntry:addResponse("I haven't had much time to think about him.");
talkEntry:addResponse("Better ruler than Elvaine at any rate.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Er ist ein.. interessanter Mann. Bekommt die Dinge erledigt, denke ich.");
talkEntry:addResponse("Hatte nicht so viel Zeit, um über ihn nachzudenken.");
talkEntry:addResponse("Auf jeden Fall ein besserer Führer als Elvaine.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("The 'G' stands for 'Greed'.");
talkEntry:addResponse("They like to think they stock everything there. They haven't got me!");
talkEntry:addResponse("You're better off in the slime pits of Runewick..");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Das 'G' steht für Gier.");
talkEntry:addResponse("Die denken, sie haben alles dort. Aber sie haben nicht mich!");
talkEntry:addResponse("Dir geht es besser in den Schlammlöchern von Runewick..");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("königin");
talkEntry:addTrigger("queen");
talkEntry:addTrigger("edwards");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I don't have time for women.");
talkEntry:addResponse("Monarchies are a stupid concept. Authority should be based on ability.");
talkEntry:addResponse("She got lucky, born into the right family.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("königin");
talkEntry:addTrigger("queen");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Ich hab keine Zeit für Frauen.");
talkEntry:addResponse("Monarchie ist ein dummes Konzept. Autorität sollte sich auf Fähigkeiten gründen.");
talkEntry:addResponse("Sie hatte glück in die richtige Familie geboren zu werden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("At least the name sounds good.");
talkEntry:addResponse("I think I might be banned from there. I lost track.");
talkEntry:addResponse("The people there don't like it when you practice necromancy in public.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Zumindest klingt der Name gut.");
talkEntry:addResponse("Ich glaube, ich könnt von dort verbannt sein. Ich habe den Überblick verloren.");
talkEntry:addResponse("Die Leute dort mögen es nicht, wenn man in der Öffentlichkeit Nekromantie betreibt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I stay away from such primitive cultures.");
talkEntry:addResponse("Don't ask me about such vile places.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Ich halte mich von solchen primitiven Kulturen fern");
talkEntry:addResponse("Fragt mich nicht über solch widerwärtige Orte.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("It's like they took everything bad about Galmair and threw it into one giant city.");
talkEntry:addResponse("The only good thing that came out of Gynk was Gynk fire.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Es ist so, als hätten sie alles Schlechte von Galmair genommen und es in ene große Stadt rein geworfen.");
talkEntry:addResponse("Das einzig gute, das aus Gynk stammte, ist das Gynk Feuer.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I never had any interest in nobility.");
talkEntry:addResponse("They're so arrogant in their way of life.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Ich hab mich nie für den Adel interessiert.");
talkEntry:addResponse("Sie sind so arrogant, wenn es um ihre Art des Lebens geht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("There are 16 gods in our pantheon. But of course you didn't know that.");
talkEntry:addResponse("Go seek a priest if you worry about your salvation.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Es gibt 16 Götter in unserem Pantheon. Aber ihr habt das natürlich nicht gewusst.");
talkEntry:addResponse("Geht doch zu einem Priester wenn euch euer Seelenheil sorgt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Adron");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("God of drunkards. I don't drink.");
talkEntry:addResponse("God of celebration. I don't have anything to celebrate.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Adron");
talkEntry:addResponse("Gott der Trunkenbolde. Ich trinke nicht.");
talkEntry:addResponse("Gott der Feste. Ich habe nichts zu feiern.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I sometimes envy Brágon for his passion. And his raging infernos, of course.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addResponse("Manchesmal beneide ich ihn für seine Leidenschaft. Und für seine tobenden Feuerstürme, natürlich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Cherga is so underappreciated. I bet she's spared you before and you haven't even given thanks.");
talkEntry:addResponse("It is with Cherga's grace that we can practice necromancy.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addResponse("Cherga wird vollkommen unterschätzt. Ich wette, sie hat schon mal Euer Leben verschont und Ihr habt es ihr nicht gedankt.");
talkEntry:addResponse("Dank Chergas Gunst können wir die Nekromantie betreiben");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elara");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I worshipped Elara until I discovered that too much arcane knowledge is a curse.");
talkEntry:addResponse("The pursuit of random general knowledge is rather unimportant.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elara");
talkEntry:addResponse("Ich verehrte Elara bis ich entdeckte, dass zu viel arkanes Wissen ein Fluch ist.");
talkEntry:addResponse("Das willkürliche Sammeln von allgemeinem Wissen ist ziemlich unwichtig.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eldan");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I think Eldan and I are quite alike. I never liked crowds.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eldan");
talkEntry:addResponse("Ich denke, Eldan und ich sind uns recht ähnlich. Ich mochte niemals große Menschenmengen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Findari");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("As far as women go, she's one of the better ones.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Findari");
talkEntry:addResponse("Soweit wie es für Frauen geht, ist sie eine der besseren.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Go to Galmair if you want to hear about Irmorom. I couldn't care less.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("Geh nach Galmair, wenn Du was über Irmorom hören willst. Ich könnte mich nicht noch weniger interessieren.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("The patron of warriors, the most pathetic of all people.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addResponse("Der Patron der Krieger, der erbärmlichsten Sorte von Menschen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Moshran");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Through his might we can practice Blood Magic.");
talkEntry:addResponse("Moshran followers are generally outcasts of society. Maybe I should worship him.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Moshran");
talkEntry:addResponse("Durch seine Macht können wir die Blutmagier praktizieren.");
talkEntry:addResponse("Die Anhänger Moshrans sind meist von der Gesellschaft Ausgestoßene. Vielleicht sollte ich ihn verehren.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I've had enough chaos for one lifetime.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addResponse("Ich hatte genug Chaos für ein ganzes Leben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oldra");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Oldra is like the useless sister of Cherga.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("Oldra ist sowas wie die nutzlose Schwester von Cherga.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ronagan");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Ronagon followers are usually mere petty thieves, not true masterminds.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("Ronagans Anhänger sind für gewöhnlich läppische, belanglose Diebe, keine wahren Genies.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sirani");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("What has she ever done for me?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("Was hast sie denn je für mich getan?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("It's thanks to her that we have mud and damp.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("Dank ihr haben wir Matsch und Dunst.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ushara");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Ushara brings the rot that spoils corpses. Necromancy would be easier without her.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("Ushara bringt die Fäule, die die Leichen zerstört. Nekromanten hätten es ohne sie leichter.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zhambra");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("God of friendship and loyalty. I don't need friends. Or loyalty.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zhambra");
talkEntry:addResponse("Der Gott der Freundschaft und Loyalität. Ich brauche keine Freunde. Oder Loyalität.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addCondition(npc.base.condition.language.language("german"));
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
talkingNPC:addCycleText("#me blätter durch einen dicken, schwarzen Wälzer.", "#me leafs through a thick black tome.");
talkingNPC:addCycleText("Wenn du nichts sinnvolles zu sagen hast, geh weg.", "If you don't have anything useful to say, go away.");
talkingNPC:addCycleText("'Oh wow, Elvaine ist ja so toll!', denen werde ich es zeigen", "'Oh wow, Elvaine is so great!', I'll show them..");
talkingNPC:addCycleText("Ich sollte das da oben sein..", "Should be me up there..");
talkingNPC:addCycleText("#me murmelt was unverständliches.", "#me mumbles something unintelligible.");
talkingNPC:addCycleText("Warum ist jeder hier so inkompetent?", "Why is everyone around here so incompetent?");
talkingNPC:addCycleText("#me verengt die Augen und mustert den Raum, bevor er sich wieder seinem Buch widmet.", "#me narrows his eyes, scanning quickly over the room before returning to his book.");
talkingNPC:addCycleText("GERMAN.", "Who'd want to live in a dump like this?");
talkingNPC:addCycleText("Ich würde bei solch schwachsinnigen Bürgern sowieso nicht Erzmagier sein wollen.", "I wouldn't want to be Archmage with citizens this moronic anyway.");
talkingNPC:addCycleText("Denkt er doch, er sei so toll, nur wegen seinem Titel.", "Thinks he's so great just because of his title.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(1);
mainNPC:addLanguage(10);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Das ist ein NPC dessen Entwickler zu faul war eine Beschreibung einzutragen.", "The cloaked figure stands, book in hand, watching you carefully from beneath his hood.");
mainNPC:setUseMessage("Fass mich nicht an!", "Lay a finger on me again and I'll have you killed.");
mainNPC:setConfusedMessage("#me schaut dich verwirrt an.", "How about you speak a real language?");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 181);
mainNPC:setEquipment(11, 0);
mainNPC:setEquipment(5, 0);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 48);
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

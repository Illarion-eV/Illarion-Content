--------------------------------------------------------------------------------
-- NPC Name: Baron Hastings                                              None --
-- NPC Job:  none                                                             --
--                                                                            --
-- NPC Race: human                      NPC Position:  0, 0, 0                --
-- NPC Sex:  male                       NPC Direction: south                  --
--                                                                            --
-- Author:   not set                                                          --
--                                                                            --
-- Last parsing: April 05, 2011                          easyNPC Parser v1.02 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (0, 0, 0, 0, 4, 'Baron Hastings', 'npc.baron_hastings', 0, 2, 5, 123, 62, 9, 245, 180, 137);
---]]

require("npc.base.basic")
require("npc.base.condition.basestate")
require("npc.base.condition.language")
require("npc.base.condition.quest")
require("npc.base.consequence.inform")
require("npc.base.consequence.quest")
require("npc.base.consequence.talkstate")
require("npc.base.talk")
module("npc.baron_hastings", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Baron Hastings the Usurper. Keywords: Greetings, Queen, Baron, Nobles, Cadomyr, Throne, Quest, King Edwards, Usurper, Succession, Bastard."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Baron Hastings der Usurpator. Schlüsselwörter: Grüße, Baron, Adlige, Cadomyr, Thron, Auftrag, König Edwards, Usurpator, Erbfolge, Bastard."));
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
talkEntry:addCondition(npc.base.condition.basestate.basestate("idle"));
talkEntry:addResponse("Be greeted. I will listen to you, but do not waste my time.");
talkEntry:addResponse("Greetings. I am a very important man, what do you want with me?");
talkEntry:addConsequence(npc.base.consequence.talkstate.talkstate("begin"));
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
talkEntry:addCondition(npc.base.condition.basestate.basestate("idle"));
talkEntry:addResponse("Seid mir gegrüßt. Ich werde Euch anhören, doch verschwendet nicht meine Zeit.");
talkEntry:addResponse("Grüße. Ich bin ein sehr wichtiger Mann. Was wollt Ihr von mir?");
talkEntry:addConsequence(npc.base.consequence.talkstate.talkstate("begin"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.basestate.basestate("idle"));
talkEntry:addResponse("Be greeted. I will listen to you, but do not waste my time.");
talkEntry:addResponse("Greetings. I am a very important man, what do you want with me?");
talkEntry:addConsequence(npc.base.consequence.talkstate.talkstate("begin"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addCondition(npc.base.condition.basestate.basestate("idle"));
talkEntry:addResponse("Seid mir gegrüßt. Ich werde Euch anhören, doch verschwendet nicht meine Zeit.");
talkEntry:addResponse("Grüße. Ich bin ein sehr wichtiger Mann. Was wollt Ihr von mir?");
talkEntry:addConsequence(npc.base.consequence.talkstate.talkstate("begin"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.basestate.basestate("busy"));
talkEntry:addResponse("Can't you see that I am busy? Your manners are lacking... Alas, yet another display of the decay that the Queen has brought upon us!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.basestate.basestate("busy"));
talkEntry:addResponse("Seht ihr nicht, dass ich beschäftigt bin? Es fehlt Euch an Manieren. Ach, dies scheint mir jedoch nur ein weiteres Abbild des Elends, in welches die Königin uns stürzte.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Farewell to you.");
talkEntry:addResponse("If you tell of my wherabouts to anyone, my men will get you.");
talkEntry:addResponse("Good bye, traveler.");
talkEntry:addConsequence(npc.base.consequence.talkstate.talkstate("end"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Lebet wohl.");
talkEntry:addResponse("Solltet Ihr irgendwem meinen Aufenthaltsort verraten, werden meine Männer Euch fassen.");
talkEntry:addResponse("Auf Wiedersehen, Reisender.");
talkEntry:addConsequence(npc.base.consequence.talkstate.talkstate("end"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Farewell to you.");
talkEntry:addResponse("If you tell of my wherabouts to anyone, my men will get you.");
talkEntry:addResponse("Good bye, traveler.");
talkEntry:addConsequence(npc.base.consequence.talkstate.talkstate("end"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Lebet wohl.");
talkEntry:addResponse("Solltet Ihr irgendwem meinen Aufenthaltsort verraten, werden meine Männer Euch fassen.");
talkEntry:addResponse("Auf Wiedersehen, Reisender.");
talkEntry:addConsequence(npc.base.consequence.talkstate.talkstate("end"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("#me furrows his brows. 'I am upset, for the travesty continues and the bitch still sits on 'my' throne.'");
talkEntry:addResponse("I weep for Cadomyr");
talkEntry:addConsequence(npc.base.consequence.talkstate.talkstate("end"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befind");
talkEntry:addResponse("#me runzelt die Stirn. 'Ich bin darüber erzürnt, dass diese lächerliche Burleske weitergeht und dieses Miststück noch immer auf 'meinem' Thron sitzt.");
talkEntry:addResponse("Ich beweine Cadomyr.");
talkEntry:addConsequence(npc.base.consequence.talkstate.talkstate("end"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("I am Baron Hastings, the Rightful Lord of Cadomyr");
talkEntry:addResponse("My name is Hastings. Baron Hastings.");
talkEntry:addConsequence(npc.base.consequence.talkstate.talkstate("end"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Ich bin Baron Hastings, der rechtmäßige Herrscher Cadomyrs.");
talkEntry:addResponse("Meine Name ist Hastings. Baron Hastings.");
talkEntry:addConsequence(npc.base.consequence.talkstate.talkstate("end"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(999, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest started] An usurper to the throne"));
talkEntry:addResponse("So, you want to help me eh? Seek out my servant Victor Tolenor in Cadomyr and inquire about his 'aunt Hastine'");
talkEntry:addConsequence(npc.base.consequence.quest.quest(999, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(999, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest started] An usurper to the throne"));
talkEntry:addResponse("So, Du willst mir also helfen, eh? Suche nach meinem Diener Victor Tolenor in Cadomyr und begrafe ihn nach seiner 'Tante Hastine'");
talkEntry:addConsequence(npc.base.consequence.quest.quest(999, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(999, "=", 0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest started] Ein Usurpator greift nach dem Thron"));
talkEntry:addResponse("So, you want to help me eh? Seek out my servant Victor Tolenor in Cadomyr and inquire about his 'aunt Hastine'");
talkEntry:addConsequence(npc.base.consequence.quest.quest(999, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(999, "=", 0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest started] Ein Usurpator greift nach dem Thron"));
talkEntry:addResponse("So, Du willst mir also helfen, eh? Suche nach meinem Diener Victor Tolenor in Cadomyr und begrafe ihn nach seiner 'Tante Hastine'");
talkEntry:addConsequence(npc.base.consequence.quest.quest(999, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("What? Do you take me for some peddler? An outrage!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Was? Haltet Ihr mich für einen Hausierer? Welch ein Frevel!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Job? I am the rightful king of Cadomyr, ruling it is my job!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Job? Ich bin der rechtmäßige König von Cadomyr. Zu herrschen ist mein Job.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("A tragedy, brought upon the isle by decadence and the lack of strong leadership.");
talkEntry:addResponse("I could foresee troubles, that's what happens when you bring Salkamaerians to meddle in your affairs!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Eine Tragödie, hervorgerufen durch Dekadenz und dem Mangel ein starken Herrschaft.");
talkEntry:addResponse("Den Ärger hätte ich voraussagen können. Das passiert, wenn man Salkamaerianer dazu bewegt, sich in seine Angelegenheiten einzumischen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("I am 'Baron' Hastings. You would do well to remember that name.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Ich bin 'Baron' Hastings. Ihr würdet gut daran tun, Euch dessen zu erinnern.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("King Edwards");
talkEntry:addResponse("#me grimaces. 'Do not mention that name! He was for a long time a good king. Then he grew weak and let that bitch-daughter of hers poison his mind against me, now I curse his memory!'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Throne");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("The Throne of Cadomyr belongs, by tradition, to the closest male relative of the the former king. It is a travesty that a honorless bitch like Rosaline has been allowed to claim it as hers!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nobles");
talkEntry:addResponse("#me hisses angrily: 'Spineless 'nobles' scurried behind her back like the dogs they are! All failed to support 'me', the rightful King of Cadomyr. Once I have them beheaded, I shall need new nobles. Interested?'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Interest");
talkEntry:addResponse("#me seems to study you for a moment. 'Maybe, maybe... But first you need to prove your worth by doing a task for me'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Usurper");
talkEntry:addResponse("#me stares at you disdainfully. 'Usurper is what the bitch-queen calls me, but -she- is the true usurper... and she will suffer the fate of one, mark my words.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tomb");
talkEntry:addResponse("That fool King Edwards has been buried in the middle of the town. Sadly, I cannot risk desecrating it myself.. but I would like someone to do it for me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Succession");
talkEntry:addResponse("#me smiles bitterly 'You see, friend... In Cadomyr we appreciate tradition. By tradition, the King should have named 'me' as his successor. A nation needs the strong will of a man, and not the fickleness of a.. bitch!'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bastard");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Oh yes, I can tell you... I have evidence that the little bitch is not a trueborn child of King Edwards at all! She was sired by a Gynk ambassador, and has no right to keep her dirt-blood posterior on the Cadomyr throne!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("König Edwards");
talkEntry:addResponse("#me verzieht das Gesicht. 'Erwähne nicht diesen Namen! Lange Zeit war er ein guter König gewesen. Doch dann wurde er schwach und hat dieses Miststück seinen Verstand mit Vorbehalten gegen mich vergiften lassen. Jetzt spucke ich auf sein Andenken!'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Thron");
talkEntry:addResponse("Der Tradition nach gehört der Thron von Cadomyr dem nähsten männlichen Verwandten des vorherigen Königs. Es ist eine Burleske, dass einem solch ehrlosen Miststück wie Rosaline es erlaubt wurde zu behaupten, es sei  der ihre!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Adlige");
talkEntry:addTrigger("Adelige");
talkEntry:addResponse("#me zischt wütend: 'Rückratlose 'Adlige', verstecken sich hinter ihrem Rücken wie die Hunde, die sie sind! Alle haben versagt 'mir', dem rechtmäßigen König von Cadomyr, beizustehen. Sobald ich sie enthauptet haben lasse, brauche ich neue Adlige. Interesse?'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("interess");
talkEntry:addResponse("#me scheint Dich einen Moment zu mustern. 'Vielleich, vielleich...Aber zu erst musst du dich beweisen, indem du eine Aufgabe für mich erfüllst.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Usurpator");
talkEntry:addResponse("#me starrt Dich für einen Moment verächtlich an. 'Usurpator ist es, was mich diese Miststück-Königin nennt, aber -sie- ist der wahre Usurpator...und sie wird das Schicksal eines solchen ertragen. Merk dir meine Worte!'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Grab");
talkEntry:addResponse("Der Narr König Edwards wurde in der Mitte der Stadt begraben. Leider kann ich es nicht riskieren es selbst zu schänden... Aber vielleicht würde es ja wer anders für mich tun.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erbfolge");
talkEntry:addResponse("#me lächelt bitter. 'Nun, mein Freund...In Cadomyr wertschätzen wir die Tradition. Der Tradition nach hätte der König 'mich' zu seinem Nachfolger ernennen müssen. Ein Volk braucht die Stärke eines Mannes und nicht den Wankelmut eines...Miststücks.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bastard");
talkEntry:addResponse("Oh ja, das kann ich dir sagen...Ich habe Beweise, dass dieses Miststück überhaupt kein echtes Kind König Edwards ist! Sie wurde von einem Botschafter Gynks gezeugt und hat kein Recht mit ihrem Hinterteil auf meinem Thron zu bleiben!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addResponse("Another bitch-witch-queen, dressed up in filthy robes instead of a Queenly gowns. I cannot fathom where they get the idea of putting a -woman- in charge, those idiots of Runewick.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Nur eine andere Miststück-Hexen-Königin, die sich in dreckigen Roben statt königlichen Gewändern kleidet. Ich kann nicht mal erahnen, wie diese Idioten von Runewick auf die Idee kamen, einer Frau die Macht zu geben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Another bitch-witch-queen, dressed up in filthy robes instead of a Queenly gowns. I cannot fathom where they get the idea of putting a -woman- in charge, those idiots of Runewick.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Nur eine andere Miststück-Hexen-Königin, die sich in dreckigen Roben statt königlichen Gewändern kleidet. Ich kann nicht mal erahnen, wie diese Idioten von Runewick auf die Idee kamen, einer Frau die Macht zu geben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("The people of Runewick are filthy pawns of the meddlesome Salkamaerians. Once I am the King, I drive them back to the sea where they belong!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Die Menschen in Runewick sind nicht mehr als schmutzige Schachfiguren der lästigen Salkamaerianer. Sobald ich Köni bin, treibe ich sie alle wieder ins Meer, wo sie hingehören!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("A mere thug in a gentleman's attire! The thug has no honor and he is unfit to be the leader of an outhouse, let alone a city. But then again, his servants are all honorless thugs and crooks as well.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Ein läppischer Verbrecher in der Kleidung eines Ehrenmannes! Dieser Verbrecher hat keine Ehre und ist ungeeignet der Führer eines Abort, geschweige denn einer Stadt zu sein. Auf der anderen Seite sind seine Diener jedoch auch nur ehrlose Verbrecher und Gauner.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Galmair is a den of decadence and dishonor. When I am the ruler of Cadomyr, I promise you that I will torch the vile den until nothing but cinders remain!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Galmair ist eine Hütte der Dekadenz und Ehrlosigkeit. Wenn ich den Herrscher von Cadomyr bin, so verspreche ich dir, brenne ich diese erbärmliche Hütte ab, bis nur noch Asche zurückbleibt!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Queen");
talkEntry:addResponse("That bitch! She used dark magics to sway her father into sidelining me! Me! The 'rightful' heir! I'll lock that wench into a monastery once I overthrow her... or just have her head. On a spike!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königin");
talkEntry:addResponse("Dieses Miststück! Sie wandte schwarze Magie an, um ihren Vater zu beeinflussen, damit er mich übergeht! Mich! Den 'rechtmäßigen' Erben! Ich werde diese Hüre in ein Kloster sperren, sobald ich sie gestürzt habe...oder einfach nur ihren Kopf. Auf einer Lanze!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("That bitch! She used dark magics to sway her father into sidelining me! Me! The 'rightful' heir! I'll lock that wench into a monastery once I overthrow her... or just have her head. On a spike!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Dieses Miststück! Sie wandte schwarze Magie an, um ihren Vater zu beeinflussen, damit er mich übergeht! Mich! Den 'rechtmäßigen' Erben! Ich werde diese Hüre in ein Kloster sperren, sobald ich sie gestürzt habe...oder einfach nur ihren Kopf. Auf einer Lanze!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("#me exclaims: 'Cadomyr is the pearl of the island, and it belongs to me by right of tradition and blood! I am the closest male relative of King Edwards!'");
talkEntry:addResponse("Cadomyr is the finest city of the Island. We believe in tradition, loyalty and honor. We are the true and rightful owners of the island; It all belongs to us... and Cadomyr belongs to me!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("#me ruft heraus: 'Cadomyr ist die Perle dieser Insel und es gehört mir – durch das recht der Tradition und des Blutes. Ich bin der nähste männliche Verwandte von König Edwards.");
talkEntry:addResponse("Cadomyr ist die feinste Stadt der Insel. Wir glauben an Tradition, Loyalität und Ehre. Wir sind die wahren und rechtmäßigen Besitzer dieser Insel; alles gehört uns...und Cadomyr gehört mir!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("We are all Albarianas here, except for that bastard bitch-queen of ours! Like all Albarians, we are full of courage and honor. More than can be said of any other race.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("Wir sind hier alle Albarianer, außer diese Miststück-Bastard-Königin! Wie alle Albarianer sind wir voll von Courage und Ehre. Mehr als man von irgendeiner anderen Rasse sagen kann.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Treacherous scum! Such a degenerate brood of cutthroats, thieves and charlatans will sooner or later implode in their own filth. We Albarians will remain forever.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("Betrügerischer Dreck! So eine degenerierte Brut von Mördern, Dieben und Scharlatanen wird früher oder später an ihrem eigenen Dreck zugrunde gehen. Wir Albarianer werden immer da sein!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("The salkamaerians are meddlesome, uncouth swine. They are sailing across the oceans to put their big noses in business they have no stake in. May the gods strike them down with the plague.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Die Salkamaerianer sind ungehobelte, lästige Schweine. Sie segeln übers Meer und stecken ihre großen Nasen in alles, was sie nichts angeht. Mögen die Götter sie mit einer Plage strafen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("I worship Zhambra and Malachin. If you worship Moshran, then you better get out of my sight with due haste!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Ich verehre Zhambra und Malachin. Solltet ihr Moshran verehren, solltet Ihr machen, dass ihr schnell davon kommt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Adron");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Adron is a true god and should be respected, but I cannot claim him as my own.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Adron");
talkEntry:addResponse("Adron ist ein wahrer Gott und sollte geachtet werden. Dennoch kann ich ihn nicht den meinigen nennen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Bragon is a true god and should be respected, but I cannot claim him as my own.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addResponse("Bragon ist ein wahrer Gott und sollte geachtet werden. Dennoch kann ich ihn nicht den meinigen nennen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Cherga is a true god and should be respected, but I cannot claim her as my own.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addResponse("Cherga ist eine wahre Göttin und sollte geachtet werden. Dennoch kann ich sie nicht die meinige nennen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elara");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Elara is a true god and should be respected, but I cannot claim her as my own.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elara");
talkEntry:addResponse("Elara ist eine wahre Göttin und sollte geachtet werden. Dennoch kann ich sie nicht die meinige nennen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eldan");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Eldan is a true god and should be respected, but I cannot claim him as my own.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eldan");
talkEntry:addResponse("Eldan ist ein wahrer Gott und sollte geachtet werden. Dennoch kann ich ihn nicht den meinigen nennen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Findari");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Findari is a true god and should be respected, but I cannot claim her as my own.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Findari");
talkEntry:addResponse("Findari ist eine wahre Göttin und sollte geachtet werden. Dennoch kann ich sie nicht die meinige nennen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Irmorom is a true god and should be respected, but I cannot claim him as my own.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("Irmorom ist ein wahrer Gott und sollte geachtet werden. Dennoch kann ich ihn nicht den meinigen nennen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I follow Malachin as every knightly man should. I count on his divine support when the time to take what is mine comes!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addResponse("Ich folge Malachin, so wie jeder ritterliche Mann es tun sollte. Ich verlasse mich auf seinen göttlichen Beistand, wenn die zeit gekommen ist, das, was mein ist, mir zu nehmen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Moshran");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Moshran! That false god of barbarians, orcs and other wretched scum! I am certain that the Bitch-Queen of Cadomyr is nothing but one of his courtesans, that bloody witch!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Moshran");
talkEntry:addResponse("Moshran! Dieser falsche Gott von Barbaren, Orks und anderem erbärmlichen Dreck! Ich bin sicher, dass diese Miststück-Königin von Cdomyr nicht mehr ist als eine von seinen Dirnen, diese verdammte Hexe!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Nargun is a true god and should be respected, but I cannot claim him as my own.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addResponse("Nargun ist ein wahrer Gott und sollte geachtet werden. Dennoch kann ich ihn nicht den meinigen nennen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oldra");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Oldra is a true god and should be respected, but I cannot claim her as my own.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("Oldra ist eine wahre Göttin und sollte geachtet werden. Dennoch kann ich sie nicht die meinige nennen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ronagan");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Ronagan is a true god and should be respected, but I cannot claim him as my own.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("Ronagan ist ein wahrer Gott und sollte geachtet werden. Dennoch kann ich ihn nicht den meinigen nennen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sirani");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Sirani is a true god and should be respected, but I cannot claim her as my own.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("Sirani ist eine wahre Göttin und sollte geachtet werden. Dennoch kann ich sie nicht die meinige nennen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Tanora is a true god and should be respected, but I cannot claim her as my own.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("Tanora ist eine wahre Göttin und sollte geachtet werden. Dennoch kann ich sie nicht die meinige nennen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ushara");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Ushrara is a true god and should be respected, but I cannot claim her as my own.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("Ushara ist eine wahre Göttin und sollte geachtet werden. Dennoch kann ich sie nicht die meinige nennen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zhambra");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I follow Zhambra for he is the Patron of Loyalty, something which the wretched peasants have forgotten! They all belong to me!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zhambra");
talkEntry:addResponse("Ich folge Zhambra, da er der Patron der Loyalität ist. Etwas, was diese erbärmlichen Bauern vergessen haben! Sie gehören alle mir!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("How dare you? Do I look like some petty merchant?!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Wie könnt Ihr es wagen? Sehe ich vielleicht wie ein läppischer Händler aus?!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("I will tell you something. They day shall come when Cadomyr belongs to me! You would do well to remember that!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Ich werde euch was erzählen. Es wird der Tagen kommen, an dem Cadomyr mein ist! Und Ihr würdet gut daran tun, Euch dessen zu erinnern.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("<NPC first name>");
talkEntry:addTrigger("<NPC last name>");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("<NPC-Vorname>");
talkEntry:addTrigger("<NPC-Nachname>");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("Excellent!");
talkEntry:addResponse("Very good.");
talkEntry:addResponse("I knew I could count on you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("Exzellent!");
talkEntry:addResponse("Sehr gut.");
talkEntry:addResponse("Ich wusste, dass ich mich auf Euch verlassen könnte.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("What do you mean, 'no'?");
talkEntry:addResponse("I do not take kindly to refusals.");
talkEntry:addResponse("Remember who you are talking to, traveler!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("Was meint Ihr mit 'nein'?");
talkEntry:addResponse("Abweisungen nehme ich nicht sehr wohlgesonnen auf.");
talkEntry:addResponse("Bedenke mit wem du hier sprichst, Reisende!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Harold");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Do you mean the man who got an arrow through his eye?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Harold");
talkEntry:addResponse("Meint Ihr den Mann, durch dessen Auge sich ein Pfeil bohrte?");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me richtet die Vorderseite seines teuren Mantels.", "#me straightens the front of his expensive coat.");
talkingNPC:addCycleText("#me schaut auf und ruft wie besessen: 'Der Thron wird mein sein'", "#me looks up and exclaims obsessively: 'The Throne will be mine!'");
talkingNPC:addCycleText("#me grummelt: 'Die falsche Königin sollte lieber aufpassen.'", "#me grumbles: 'The false queen better watch out'");
talkingNPC:addCycleText("Ich beweine Dich, Cadomyr, wegen der Ehrlosigkeit, die Dich befallen hat.", "I weep for the dishonor that has befallen you, Cadomyr.");
talkingNPC:addCycleText("Der Tag wird kommen, an welchem ich auf dem Thron meiner Ahnen sitze!", "The day shall come, when I sit on the throne of my ancestors!");
talkingNPC:addCycleText("Ich frage mich, wie die Bauern wohl reagieren, wenn sie erst einmal erfahren haben, dass die 'Königin' nicht mehr ist als ein Bastard!", "I wonder how the peasants react, once they learn that the 'queen' is nothing but a bastard!");
talkingNPC:addCycleText("Gift vielleicht? Hmm...", "Poison, maybe? Hmm...");
talkingNPC:addCycleText("#me läuft herum, laut dabei nachdenkend: 'Oder sollte ich mich doch auf die Schwerter verlassen?'", "#me walks around, pondering out loud 'Or still, should I rely on blades instead?'");
talkingNPC:addCycleText("Hah. 'Vergiftete' *Schwerter*, da ist ja die Antwort zu meinem Problem.", "Hah. 'Poisoned' *blades*, now there is the answer to my problem!");
talkingNPC:addCycleText("#me läuft mit einem fiebrigen Glanz in den Augen herum.", "#me walks around, with a feverish gleam in his eyes.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(1);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Das ist ein NPC dessen Entwickler zu faul war eine Beschreibung einzutragen.", "This is a NPC who's developer was too lazy to type in a description.");
mainNPC:setUseMessage("Fass mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut dich verwirrt an.", "#me looks at you confused.");
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

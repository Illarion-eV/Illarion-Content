--------------------------------------------------------------------------------
-- NPC Name: Brute Booze                                                 None --
-- NPC Job:  adventurer                                                       --
--                                                                            --
-- NPC Race: orc                        NPC Position:  674, 320, 0            --
-- NPC Sex:  male                       NPC Direction: southwest              --
--                                                                            --
-- Author:   Rincewind                                                        --
--                                                       easyNPC Parser v1.21 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (4, 674, 320, 0, 5, 'Brute Booze', 'npc.brute_booze', 0, 0, 2, 6, 18, 8, 137, 123, 60);
---]]

require("npc.base.basic")
require("npc.base.condition.chance")
require("npc.base.condition.language")
require("npc.base.consequence.inform")
require("npc.base.talk")
module("npc.brute_booze", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Brute Booze an fameous orcish adventurer. Keywords: Hello, towns, heroic deeds, tell something"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Brute Booze ein berühmter orkischer Glücksritter. Schlüsselwörter: Hallo, Städte, Heldentaten, erzähl etwas"));
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
talkEntry:addResponse("Greetings! Are you traveling too?");
talkEntry:addResponse("Good day to you. Are you on a great journey? ");
talkEntry:addResponse("I welcome you!");
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
talkEntry:addResponse("Seid mir gerüßet! Ihr seid wohl auch auf Reise?");
talkEntry:addResponse("Guten Tag, wünsche iche. Befindigt Ihr Euch auf grosser Fahrt?");
talkEntry:addResponse("Seid mir willkommen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Greetings! Are you traveling too?");
talkEntry:addResponse("Good day to you. Are you on a great journey?");
talkEntry:addResponse("I welcome you!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Seid mir gerüßet! Ihr seid wohl auch auf Reise?");
talkEntry:addResponse("Guten Tag, wünsche iche. Befindigt Ihr Euch auf grosser Fahrt?");
talkEntry:addResponse("Seid mir willkommen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Save Travel!");
talkEntry:addResponse("...or like the southern lizard folk say: May clear waters surround you.");
talkEntry:addResponse("May your feet walk in good shoes.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Sicheres Reisen!");
talkEntry:addResponse("... oder wie die südlichen Echsenmenschen sprechen: 'Mögt ihr von reinem Wasser umgebigt sein.'");
talkEntry:addResponse("Iche will Euch gute Stiefel an die Füße wünsch-higen...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Save Travel!");
talkEntry:addResponse("...or like the southern lizard folk say: May clear waters surround you.");
talkEntry:addResponse("May your feet walk in good shoes.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Sichere Reise!");
talkEntry:addResponse("... oder wie die südlichen Echsenmenschen sprechen: 'Mögt ihr von reinem Wasser umgebigt sein.'");
talkEntry:addResponse("Iche will Euch gute Stiefel an die Füße wünsch-higen...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("Yes! Old Brute is feeling great. Sometime I will leave for a new adventure.");
talkEntry:addResponse("Oh, it is not important how I'm feeling! Tell me, how are you?");
talkEntry:addResponse("I feel like I felt on great days, back then, when I was still a young orc.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befinden");
talkEntry:addResponse("Ja-h! Dem alten Brute geht's prächtigens. Irgendwann werde iche wohl zu einem neuen Abenteuer aufbrechen.");
talkEntry:addResponse("Ach, das iset doch nicht wichti-hig, wie's mir geht! Sagt mir, wie gehthigt's Euch?");
talkEntry:addResponse("Es geht mir wie an großen Tagen. Einst als iche noch Orkling war.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("I am the famous Brute Booze! A living legend and famous aswell! I'm sure you have heard of my deeds.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ihr name");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Iche binne der berühmte Brute Booze! Lebendihige Legende und Berühmtheit! Sicherheitlich habt ihr von meinen Taten gehöright.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Oh, yes! Keep asking people for work and tasks, and one day you will become great hero, just like myself. However I dont have any work for you at the moment.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Hach, ja-ja! Fraget immerhig alle Leute nach Arbeit und Aufgaben. Dann werdet auch Ihr eines Tagiges ein ebenso großer Held sein, wie iche es bin. Allerdings habe iche im Moment keine Arbeit fü-hür Euch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("Oh, yes! Keep asking people for work and tasks, and one day you will become great hero, just as I am. However I dont have any work for you at the moment.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Hach, ja-ja! Fraget immerhig alle Leute nach Arbeit und Aufgaben. Dann werdet auch Ihr eines Tagiges ein ebenso großer Held sein, wie iche es bin. Allerdings habe iche im Moment keine Arbeit fü-hür Euch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("Im not a king. Not a smith. Not a peasant. I live for adventures.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Binne kein König. Binne kein Schmied. Binne kein Bauer. Mein Leben iset das Abenteuer.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("Im not a king. Not a smith. Not a peasant. I live for adventures.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Binne kein König. Binne kein Schmied. Binne kein Bauer. Mein Leben iset das Abenteuer.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Of course, even on Gobaith I drank a flat beer. Many call it Gobiath, but the truth is: on the maps that have been copied many times, it's name got distorted over time. It's name is GobAIth.");
talkEntry:addResponse("Of course, even on Gobaith I drank a flat beer. It was a small, inconspicuous island, but there was always something exciting to experience.");
talkEntry:addResponse("Of course, even on Gobaith I drank a flat beer. An inconspicuous piece of land, but filled with great men of honour and bravery.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Sicherlin, selbst auf Gobaith drank iche ein schales Bier. Viele meinen es hieße Gobiath, doch tatsächlich wurde der Name in der oft abgezeichneten Karte falsch geschriebigt. Es heißt GobAIth.");
talkEntry:addResponse("Sicherlin, selbst auf Gobaith drank iche ein schales Bier. Es war eine kleine unscheinbare Insel, dennoche gab es immer viel Spannendes zu erlebigen.");
talkEntry:addResponse("Sicherlin, selbst auf Gobaith drank iche ein schales Bier. Ein unscheinbarer Flecken, doch befüllt mit großigen Männern voll Ehre und Mut.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("That sounds very well in my ears.");
talkEntry:addResponse("Great!");
talkEntry:addResponse("That's a very nice thing.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Das klinghigt sehr wohl in meinen Ohren.");
talkEntry:addResponse("Grossartig!");
talkEntry:addResponse("Eine sehr feine Sache iset das.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("town");
talkEntry:addTrigger("village");
talkEntry:addTrigger("city");
talkEntry:addTrigger("cities");
talkEntry:addResponse("Many lands I saw and even more tales I heard. Orcish towns like Kroch'Gurak, Fireshine, Judgement's Flame and Light of Khaari! Brute Booze drunk almost everywhere. In Firnismill, Pennymill but never in Oldwillows. The strongholds of the dwarvlings! Sevenhill, Storm's Keep and Arn-Gharrach. The stormy town Kjelt! The icy Karras, the old Ann-Korr and fameous Kang-Arr! Myr-Tobar the town made of jade. Oldford, Fennsworth, Falmarha, Nubris, Mitsobar and Koldamar - all towns of the human folk. And last Lor-Angur realm of magics.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Stadt");
talkEntry:addTrigger("Städte");
talkEntry:addTrigger("Dorf");
talkEntry:addTrigger("Dörfer");
talkEntry:addResponse("Schon viele Länder habe ich geseh-higt und von noch mehr kennige ich Geschichten! Orkstädte wie Kroch'Gurak, Fireshine, Judgement's Flame, Licht von Khaari! Überall habige ich schon gesoffen. Im grünigen Firnismühle und in Pfennigmühle war ich auch. Aber niemals in Altweiden. Und die Festungen der Zwerglinge! Siebenberg, Storm's Keep und Arn-Gharrach. Die stürmige Stadt Kjelt! Das frostigige Karras. Das alte Ann-Korr und das berühmte Kang-Arr! Myr-Tobar die Stadt aus Jade und Khenserra. Altfurten, Fennsworth, Falmarha, Nubris, Mitsobar und Koldamar. Alles Städte der Menschen. Und zuletzigt Lor-Angur, das Magierreich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("heroic");
talkEntry:addTrigger("deed");
talkEntry:addResponse("Three winters ago, Brute Nooze slayed the snake beast, Myr Tobars! It's body was as thick as an Oak's trunk and was as long as any number of men. As thanks for slaying the beast, the High Priest gave Brute Booze his daughter to marry!");
talkEntry:addResponse("Seven winters ago, I brought down the curse of Kang-Arr. A bear big enough for tree Norodaj warriors, with spikes covering its body, as long as an arms-lenght. On that day Aramar Ingelfsen, ruler of Kanthun, appointed me to be travelling knight at his court.");
talkEntry:addResponse(" Once, as I was travelling the frigid lands of Karras, a demonic Wyrm was threatening the land. Many warriors lost their lives to the beast, but eventually it was slayin with united froce. From this day on, the people of Karras' Nordanaj, greeted me with respect and honour.");
talkEntry:addResponse("Four winters ago, the court magician of Falmarha's triumvirate, managed to stake Lad'Nothratar the butcher, with my help. An ancient vampire, whose death granted me the title 'Honourable Mage of Falmarhas' ");
talkEntry:addResponse("Huzza! Since one year now, I, Brute Booze, count the coppery fur of the lion Azzor, to my possessions, who once devoured dozens of Nubris' brave warriors. They constructed a copperish monument of this very battle, infront of Malachins temple, in my honour.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Heldentat");
talkEntry:addTrigger("Taten");
talkEntry:addResponse("Vor drei Wintern, erschlug Brute Booze die Schlangenbestie, Myr Tobars! Ihr Leib wahr-higte so dick wie der einer Eiche und ungezähligte Mann lang. Zum dank gab der Hochpriester, Brute Booze seine Tochter zum Weib!");
talkEntry:addResponse("Sieben Winter iset es her, da erlegte iche den Fluch Kang-Arr's. Ein Bär groß für drei Norodaj-Krieger, übersähet mit armlangen Stacheln. An jenem Tag ernannte mich Fürst Aramar Ingelfsen von Kathun zum fahrigenden Ritter seines Hofes.");
talkEntry:addResponse("Einst, als ich im eisigen Karras war, bedrohhigte ein dämonischer Wyrm das Land. Viele Krieger mussten sterben, doch endlich spießte man das Untier mit geeinigter Kraft auf. Seit da an genoß iche Ansehen und Ehre unter Karras' Norodaj.");
talkEntry:addResponse("Vor vier Wintern, gelang es den Hofmagiern des Triumvirats in Falmarha, mit meiniger Hilfe Lad'Nothratar den Metzger zu pfählen. Ein altertühmlicher Vampir, dessen Tot, iche den Ehrentitel 'Ehrenhafter Magier Falmarhas' verdankige.");
talkEntry:addResponse("Hossa! Seit einem Jahr besitze iche, Brute Booze das kupferige Fell des Löwen Azzors, der einst dutzende mutige Krieger Nubris' verschlang. Mir zu Ehren steht ein kupferiges Abbild des Kampfes vor einem der Tempel Malachins.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Kroch");
talkEntry:addTrigger("Gurak");
talkEntry:addResponse("Kroch'Gurak! The winter camp of the wild clans. A colossal, cavernous construct, steeped in the rythmic sound of drums. Full of orcs, herding cattle and the smell of bean brandy!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Fireshine");
talkEntry:addResponse("Fireshine! The Dragoncastle of the Flameorcs. Carved  in black lava-stone, the orcs of Khor-Anthalatosh, bearers of the Inner Flame, are lead by the Dragon of the North. This fortress is literally, illuminating. ");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Judgement");
talkEntry:addTrigger("Flame");
talkEntry:addResponse("Judgement's Flame is a monastery castle, inhabited by the Flameorcs. Three times a day, the loud, resounding sound of horns, is heard through the temples, calling the paladins and monks for prayer. But the inner part of the city is off-limits for travelers. ");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Khaari");
talkEntry:addResponse("Let me tell you, the Light of Khaari is a Flameorc city. The Temple of Flames is enthroned above it and the shine of the temples Dragonfire lights up the whole city , so that it never gets dark. Not even at night.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Kroch");
talkEntry:addTrigger("Gurak");
talkEntry:addResponse("Kroch'Gurak! Das Winterlager, der wilden Klans. Ein kolossales Höhlengebilde, druchdrungen vom rythmischen Klang der Trommeln. Alles iset voll mit Orklingen die Vieh herumtreiben und es riecht nach Bohnenschnaps!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Fireshine");
talkEntry:addResponse("Fireshine! Die Drachenburg der Flammenorks. Aus schwarzem Lava-Stein herausgehauen, werden die Orks von Khor-Anthalatosh, Träger der Inneren Flamme, großer Drache des Nordens, geleitet. Diese Festung iset im wahren Sinn des Worts, erleuchtigt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Flamme");
talkEntry:addTrigger("Gerechtigkeit");
talkEntry:addResponse("Die Flamme der Gerechtigkeit iset eine Klosterburg der Flammenorks. Dreimal täglich rufen laute, tief schallende Hörner in den Tempeln, die Paladine und Mönche zum Gebet. Allerdings verschließt man den Reisenden den Inneren Teil der Stadt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Khaari");
talkEntry:addResponse("Iche will Euch sagen, das Licht von Khaari iset eine Stadt der Flammenorks. Und über der Stadt thront der Tempel der Flamme dessen Drachenfeuer so hell leuchtet, das die Stadt niemals im Dunkeln liegt. Selbst in der Nacht nicht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sevenhill");
talkEntry:addResponse("Well, not even humans are allowerd inside Sevenhill by the dwarves. So I can only tell you, what one may hear. It is said to be a mine, with vast treasures recovered from it. ");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Storm");
talkEntry:addTrigger("Keep");
talkEntry:addResponse("It was really hard to reach Storm's Keep. Away far north and with only frew strangers there. But the art of smithing there is legendary.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Arn-Gharrach");
talkEntry:addTrigger("Arn Gharrach");
talkEntry:addResponse("Arn-Gharrach, probably the oldest dwarven realm. It is the city of trading and even 'Overlander', as they say, are allowed inside. Before all, I'd like to praise the dwarven beer. '");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Siebenberg");
talkEntry:addResponse("Tja, nichtmal Menschen lass-hen die Zwerge nach Siebenberg hinein. Also kann iche Euch nur sagigen, was man hört. Es soll eine Miene sein, und die ausgegrabigten Schätze unermässlich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Storm");
talkEntry:addTrigger("Keep");
talkEntry:addResponse("Es war wirklich schwierig nach Storm's Keep zu gelangen. Sehr weit im Norden und nur wenig Fremde dort. Die Schmiedekunst dort, iset jedoch weithin legendär.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gharrach");
talkEntry:addTrigger("Gharrach");
talkEntry:addResponse("Arn-Gharrach, wohl das älteste Zwergenreich. Es iset die Stadt des Handels und auch 'Oberwelter' wie man dort sagt, haben Zutritt. Vor allem möchte iche das Bier der Zwerge lobend erwähnen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Firnismill");
talkEntry:addResponse("Firnismill is known for it's hospitality. As an orc however, one is frowned upon. Anyhow, it is very green and rich in gardens. ");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Pennymill");
talkEntry:addResponse("In Pennymill, the vegetables usually are twice as big as elswhere. It was a bit too quiet there, for my taste and I didn't tay long.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oldwillows");
talkEntry:addResponse("Hm, I never visited Oldwillows. I doubt that it is worth visiting. ");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Firnismühle");
talkEntry:addResponse("Firnismühle iset für seine Gastfreundschaft berühmt. Als Ork, iset man aber trotzdem nicht gern gesehen. Jedenfalls iset es dort sehr Grün und voll mit Gärten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Pfennigmühle");
talkEntry:addResponse("In Pfennigmühle iset das Gemüse für gewöhnlich doppelt so groß wie anders wo. Mir war's dort allerdings zu ruhig und iche blieb nicht besonders lange.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Altweiden");
talkEntry:addResponse("Ach, in Altweiden war iche nie. Aber iche glaub kaum, dass es die Reise wert iset.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Irulaith");
talkEntry:addTrigger("Quenn");
talkEntry:addTrigger("Shir");
talkEntry:addTrigger("Assiri");
talkEntry:addTrigger("Arah");
talkEntry:addResponse("This is some kind of gnome city, isn't it? I can't imagine them, brewing any good beer in the desert, so I've never been there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irulaith");
talkEntry:addTrigger("Quenn");
talkEntry:addTrigger("Shir");
talkEntry:addTrigger("Assiri");
talkEntry:addTrigger("Arah");
talkEntry:addResponse("Das iset so eine Gnom-Stadt nicht wahr? Iche kann mir nicht vorstellen das die in der Wüste gutes Bier brauen, also war iche dort auch nie.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Kjelt");
talkEntry:addResponse("The stormy city! Kjelt. After month of traveling through cold, bleak steppe, one will find a sightly fortress. The humans there similar to us orcs, but then again completely different.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Karras");
talkEntry:addResponse("Karras is a city made of ice. Even during summer it doesn't get warm enough, to smelt the city walls, they say. There, you get hot beer and spiced wine. The journey was worth every frozen off toe!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Kjelt");
talkEntry:addResponse("Die Sturmumtoste Stadt! Kjelt. Nachdem man Monate lang durch kalte trostlose Steppe reist, findet man eine anschauliche Festung. Die Menschen dort sind uns Orks teils ähnlich und dann doch wieder ganz anders.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Karras");
talkEntry:addResponse("Karras die Stadt aus Eis. Es iset selbst im Sommer nicht warm genug um die Mauern zu schmelzen, ließ iche mir sagen. Man bekommt heißes Bier zum saufen und würzigen Wein. Die Reise war mir jede abgefrorigte Zehe wert!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Korr");
talkEntry:addResponse("Ann-Korr is a remarkably old harbour city. It got split into different districts, and depending on how wealthy you are, the position of your house would differ.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Fennsworth");
talkEntry:addResponse("If you are an orc, you are only allowed into Fennsworth as a slave. So I've never been there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Kang");
talkEntry:addResponse("Kang-Arr is probably the most beneficial city for travelers, in the whole albarian realm. Alot humans from the norht are there. I guess, this has a profitable influence.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Oldford");
talkEntry:addResponse("Oldford is a village, one would say, having visited as many great cities as I have. But the inn 'The Gumbler's Head' is quite louche. ");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Korr");
talkEntry:addResponse("Ann'Korr iset eine besonders alte Hafenstadt. Man hat sie in verschiedene Viertel geteilt, und je wohlhabender man iset hat man sein Haus wo anders.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Fennsworth");
talkEntry:addResponse("Wenn man n' Ork iset, darf man Fennsworth nur als Sklave betrethigen. Also war iche dort nie.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Kang");
talkEntry:addResponse("Kang-Arr iset wohl die bekömmlichste Stadt für einen Reisenden im ganzen Albarischen Reich. Gi-hibt eine Menge Menschen aus dem Norden dort. Schätze das hat einen nützlichen Einfluss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Altfurten");
talkEntry:addResponse("Altfurten iset ein Dorf, wird man sagen, wenn man so viele große Städte beschaut hat wie iche. Aber der Gasthof 'The Grumbler's Head' iset berüchtigend.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Myr");
talkEntry:addTrigger("Tobar");
talkEntry:addResponse("Myr-Tobar, the jade city and green heart of the jungle. The seven great temple are worth visiting. The people living there seem to generally like the number seven very much.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Khenserra");
talkEntry:addResponse("Khenserra is a dusty mining city. I even saw an ogre there. A good city if an orc needs some money fast. It doesn't smeel very good, but is free from elves.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Myr");
talkEntry:addTrigger("Tobar");
talkEntry:addResponse("Myr-Tobar, die Jadestadt, das grüne Herz des Dschungels. Die sieben großen Tempel gehören angesehen. Und überhaupt möchten diese Menschen die Zahl Sieben sehr gern.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Khenserra");
talkEntry:addResponse("Khenserra iset eine staubige Mienenstadt. Sogar'n Oger hab iche dort gesehen. Eine gute Stadt wenn ein Ork schnell Geld braucht. Es riecht zwar nicht schön, iset aber Elfenfrei.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Falmarha");
talkEntry:addResponse("Falmarha is some kind of sea castle. The inns are cheap and the humans serve you like slaves. I tell you, that many ships I have never seen before.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Laris");
talkEntry:addResponse("Laris is a castle too, if you want to call it that. There, they even tamed a river and redirected. The most important thing is the wine though. THE WHINE!...You should try it.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Nubris");
talkEntry:addResponse("Let me tell you, the humans in Nurbis have as black skin, as mine is green. Their city is called the golden jewel of the south and there is a vast amount of herbs and other stuff you can buy there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Mitsobar");
talkEntry:addResponse("There is stong beer and pungent, brown liquor in Mitsobar. The humans there, drink a lot of it and eat fish as if they were lizards.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Koldamar");
talkEntry:addResponse("Koldamar is a boring, windy city. Everyone there is thinking a lot and not very talkative. If you dont like the jungle, you can go there to see lizards - as long as the gods are willing.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Falmarha");
talkEntry:addResponse("Falmarha iset eine Art Festung im Meer. Die Gasthöfe sind günstig und die Menschen bedienen einen wie Sklaven. Iche will sagen, so viele Schiffe sah iche dort zum Ersten Mal.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Laris");
talkEntry:addResponse("Laris iset auch eine Festung, wenn man das so sagen will. Man hat sogar einen Fluss gezähmhigt und umgegraben. Das wichtigste iset aber der Wein. DER WEIN!...sollte man getrunken haben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nubris");
talkEntry:addResponse("Lassigt Euch sagen, die Menschen in Nubris, haben schwarze Haut, wie meine Grün iset. Ihre Stadt nennen sie das goldene Juwel des Südens und es giehebt unzählige Gewürze und anderen Kram zu kaufigen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Mitsobar");
talkEntry:addResponse("In Mitsobar gibt es kräftiges Bier und starkigen , braunen Schnaps. Und davon saufen die Menschen beachtlicher Menge. Außerdem fressen die Menschen dorte Fische als wären sie Echsen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Koldamar");
talkEntry:addResponse("Koldamar iset eine langweilige windige Stadt. Alle denken viel nach und sprechen wene-hig. Wenn ihr den Dschungel nicht mögt, könnt ihr dort Echsenmenschen sehigen... - Sodar die Götter es wollen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Angur");
talkEntry:addResponse("Lor-Angur is filled with elves that think themselves very celver. And the humans there, aren't different. All of them indulge in sorcery and other dangerous things like it.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Angur");
talkEntry:addResponse("In Lor-Angur iset's voll mit Elfen die meinen sie sind besonderig klug. Und die Menschen sind nichtig besser. Allesamte frönen sie der Zauberei und solch gefährlichen Sachen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addResponse("I heard the Archmage of Runewick, Elvaine Morgan, is an elf from Lor-Angur.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Iche hab mir sagen lassen der Erzmagier Runewicks, Elvaine Morgan, iset ein Elf aus Lor-Angur.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("I heard the Archmage of Runewick, Elvaine Morgan, is an elf from Lor-Angur.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Iche hab mir sagen lassen der Erzmagier Runewicks, Elvaine Morgan, iset ein Elf aus Lor-Angur.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("There's nothing keeping me in Runewick. It makes my hair stend on end when sorcery is near.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("In Runewick hält mich nichts. Meine Nackenhaare sträubigen sich wenn Zauberei in der Nähe iset.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("A dwarf from Gynk. Don Valerio Guilianni. A ruthless merchant, in general.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Ein Zwerg aus Gynk. Don Valerio Guilianni. Ein Skrupeloser Händler, alles im alligen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("The beer in Galmair is good, but if you're not careful they steal your purse, before you can pay for it.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Das Bier in Galmair iset gut. Aber wenn man nicht aufpassigt klauen sie einem den Geldbeutel, noch bevor man die Zeche begleichen kann.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Queen");
talkEntry:addResponse("A human queen. Chosen by the gods, probably. I prefer lonely princesses in high towers.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königin");
talkEntry:addResponse("Eine Königin der Menschen. Wohl von den Göttern erwählt. Iche bevorzuge ja eher Prinzessinen in vereinsamten Türmsen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("A human queen. Chosen by the gods, probably. I prefer lonely princesses in high towers.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Eine Königin der Menschen. Wohl von den Göttern erwählt. Iche bevorzuge ja eher Prinzessinen in verinsamten Türmsen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("It's too dry in Casomyr, for my liking. And no beer there, is good enough to stay for long.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Es iset mir zu trocken in Cadomyr. Und kein Bier dort iset gut genug um lange dort zu bleibigen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Albar");
talkEntry:addResponse("I have to confess, I never set foot in Albar. They say, people without work are forced to work in the mines. I don't even want meantion what they do with orcs.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Albar");
talkEntry:addResponse("Iche muss Euch gestehen, um Albar hab iche einen weiten Bogen gemacht. 's heißt dort sperrt man Leute ohne Arbeit in die Mienen. Von Orks will iche gar nicht sprechen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addResponse("Let me tell you, if you plan to do something illegal, do it in Gynk. You can get swampweed and sibanac on practically every corner. And slaves are richer than workers.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addResponse("Lasst Euch sagen, wenn ihr was verbotenes machen wollt, macht es in Gynk. Stechkarut und Sibanac, wir einem überall feilgeboten. Und die Sklaven sind reicher als die Arbeiter.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("salkama");
talkEntry:addResponse("City of the sun. The biggest temple of the known world is located there, Temple of the wheel, where books are kept like treasures in great halls.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Salkamar - Die Stadt der Sonne. Dort steht der größte Tempel der bekannten Welt, der Tempel des Rades und Bücher hortet man wie Schätze in großen Hallen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("My ancestors always accompany me on my journey. And before battle, I pray for Zhambras and Malachíns blessings!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Meine Vorahnen si-hind auf meinen Reisen immer beihe mir. Und vorm Kampfe bittige ich um Zhambras und Malachíns Segen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Zhambra");
talkEntry:addResponse("Zhambra, the brother god. Who spills blood together, needs backing!");
talkEntry:addResponse("In battle, you will find yourself next to the shoulder of your companions. Zhambra unites my axe with those of my brothers.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zhambra");
talkEntry:addResponse("Zhambra, issigt der Brudergott. Wer gemeinsam Blut vergießt braucht Rückendeckigung!");
talkEntry:addResponse("Im Kampf stehigen wir oft rücklings an den Schultern unserer Waffenbrüder. Zhambra stärkt mich und meine Brüder und unsere Äxte werden Eine.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addResponse("Malachín, the aureate hunter! The impregnable warrior! In his name my axe shall taste the blood of many beasts!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addResponse("Malachín, der großartige Jäger! Der unbezwingbare Krieger! In seinem Namen sollige meine Axt das Blut von Bestien trinken.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("I'm afraid, I don't have anything for sale and I've got no interest in any of your things.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Iche bedauerige sehr, nichts habe iche zu verkaufen und keine Eurer Sachen sind mir von Wertlichkeit.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("When I was a young orc, someone asked me, what I wanted to have done, before I die. And I said, I want to have drank a beer in even city of Illarion. The next day, I had alreasy broken up.");
talkEntry:addResponse("Since I had left the Norbug Plateua back then, I have travelled many known countires. So if you are looking for knowledge, just ask me. I enjoy telling you about various, strange lands.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Als iche noch ein Orkling war, fragte mich Einer was iche getan haben wollte, sei iche erst tot. Und iche sagte, iche wollte in jeder Stadt Illarions ein Bier getrunken haben. Tags darauf war iche scho-hon aufgebrochen.");
talkEntry:addResponse("Seit iche damals das Norbug Plateau verließ, binne iche in viele der bekannten Länder gereist. Wenn Ihr also etwas zu Wissen versucht, fragt mich ruhig aus. Iche erzähle gernig von allersamt fremder Länder.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Brute");
talkEntry:addTrigger("Booze");
talkEntry:addResponse("Hurr hurr. That's beeing me!");
talkEntry:addResponse("#me scratches his chin. 'How are you?'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Brute");
talkEntry:addTrigger("Booze");
talkEntry:addResponse("Hurr hurr. Der binnige ich!");
talkEntry:addResponse("#me reckt sein Kinn in die Höhe. 'Wonnach verlangts Euch?'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("Truly of greatness!");
talkEntry:addResponse("I am honoured.");
talkEntry:addResponse("It is a pleasure.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("Wahrlich, von Größe!");
talkEntry:addResponse("Iche binne geehrt.");
talkEntry:addResponse("Es iset mir ein Vergnü-higen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse(" Is that so?");
talkEntry:addResponse("Really?");
talkEntry:addResponse("Mh-hm.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("Iset das so?");
talkEntry:addResponse("Tatsächlich?");
talkEntry:addResponse("Mh-hm.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(40.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("But tell me, what do you want to have done, before you die?");
talkEntry:addResponse("Yes. This is just like in those days, when I slayed the thorned bear of Kang-Arr.");
talkEntry:addResponse("Hurr- hearing this, I am reminded of my own heroic deeds.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(40.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Aber, sahegt mir, was wollt ihr alles getan haben, seid ihr erst einmalig tot?");
talkEntry:addResponse("Ja-ha. Das ist gleich wie damalsig. Als iche den Stachelbären Kang-Arr's zur strecke danieder brachte.");
talkEntry:addResponse("Hurr - wenn iche das hörige muss ich an meine Heldentaten denkigen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me grunzt vergnügt und nimmt einen Schluck aus seinem Tonkrug.", "#me grunts cheerfully and takes a swig from his jug.");
talkingNPC:addCycleText("#me nickt sich selbst zu und wirft einen Blick in seine Tasche. Dann holt er eine halbe Wurst hervor und beißt davon ab.", "#me nods to himself and takes a look inside his bag. Then he takes out half a sausage and takes a bite from it.");
talkingNPC:addCycleText("#me kratzt sich an der Nase.", "#me scratches his nose.");
talkingNPC:addCycleText("#me streckt seine Zunge heraus und grinst.", "#me stretches out his tounge and grins.");
talkingNPC:addCycleText("#me spannt seine muskulösen Arme an und streckt sich demonstrativ.", "#me flexes his muscular arms and stretches demonstratively. ");
talkingNPC:addCycleText("#me lächelt und lässt dabei abwechselnd seinene Brustmuskeln hüpfen.", "#me smiles and twitches his chest muscles alternately.");
talkingNPC:addCycleText("#me nimmt seinen Trinkschlauch vom Gürtel und nimmt einen Schluck daraus.", "#me takes a waterskin from his belt and takes a sip from it.");
talkingNPC:addCycleText("#me fährt sich mit der Hand über seinen kahlen Kopf und zeigt dabei, gewinnend lächelnd, seine blendend weißen Zähne.", "#me strokes a hand over his bald head, smiling engagingly and showing his dazzlingly white teeth.");
talkingNPC:addCycleText("#me zupft mit seinen gepflegten Händen am Spitzbart.", "#me plucks on his pointed beard with his sleek hands.");
talkingNPC:addCycleText("#me stemmt die Arme in die Seiten und streckt den Oberkörper durch.", "#me stands with his arms akimbo and stretches out his chest. ");
mainNPC:addLanguage(0);
mainNPC:addLanguage(5);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Ein stattlicher Ork, mit selbstbewusstem Lächeln. Er trägt nichts am Oberkörper und spricht mit seltsamem Akzent.", "A portly orc with a confident smile. He doesn't wear anything on his upper body and talks with a strange accent.");
mainNPC:setUseMessage("Fass mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut dich verwirrt an.", "#me looks at you confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 0);
mainNPC:setEquipment(11, 0);
mainNPC:setEquipment(5, 2642);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 0);
mainNPC:setEquipment(9, 2113);
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
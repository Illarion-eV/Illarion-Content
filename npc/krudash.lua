--------------------------------------------------------------------------------
-- NPC Name: Krudash                                                  Galmair --
-- NPC Job:  trader                                                           --
--                                                                            --
-- NPC Race: orc                        NPC Position:  368, 260, 0            --
-- NPC Sex:  female                     NPC Direction: north                  --
--                                                                            --
-- Author:   Rincewind                                                        --
--                                                                            --
-- Last parsing: August 18, 2012                          easyNPC Parser v1.2 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (4, 368, 260, 0, 0, 'Krudash', 'npc.krudash', 1, 0, 0, 6, 18, 8, 137, 123, 60);
---]]

require("npc.base.basic")
require("npc.base.condition.chance")
require("npc.base.condition.language")
require("npc.base.consequence.inform")
require("npc.base.consequence.state")
require("npc.base.talk")
module("npc.krudash", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Krudash the arms dealer. Keywords: Murgo, Er'hja, Kroch'Gurak, Alice, Tom"));
talkEntry:addResponse("Me, Krudash sell and buy lots of stuff! Taghta?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Krudash die Waffenhändlerin. Schlüsselwörter: Murgo, Er'hja, Kroch'Gurak, Alice, Tom"));
talkEntry:addResponse("Ich, Krudash verkaufe und kaufe viele Dinger! Taghta?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
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
talkEntry:addResponse("Greebas. Do you need sumthing?");
talkEntry:addResponse("Hurr! Be greeted.");
talkEntry:addResponse("Hurr. Me, Krudash sell all you need. For good hack'n sack trip! Hehe!");
talkEntry:addResponse("Latha math! Greetings-Greetings, mes mean.");
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
talkEntry:addResponse("Greebas. Brauchst du was, hä?");
talkEntry:addResponse("Hurr! Sei gegrüßt.");
talkEntry:addResponse("Hurr. Ich, Krudash verkaufe alles, was 'ner wie du braucht für's hacken und plündarn! Hehe!");
talkEntry:addResponse("Latha math! Grüße-Grüße, sag ich.");
talkEntry:addResponse("Sei willkommen, in 'Krudash's Hacken und Plündern'!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Greebas. Do you need sumthing?");
talkEntry:addResponse("Hurr! Be greeted.");
talkEntry:addResponse("Hurr. Me, Krudash sell all you need. For good hack'n sack trip! Hehe!");
talkEntry:addResponse("Latha math! Greetings-Greetings, mes mean.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Greebas. Brauchst du was, hä?");
talkEntry:addResponse("Hurr! Sei gegrüßt.");
talkEntry:addResponse("Hurr. Ich, Krudash verkaufe alles, was 'ner wie du braucht für's hacken und plündarn! Hehe!");
talkEntry:addResponse("Latha math! Grüße-Grüße, sag ich.");
talkEntry:addResponse("Sei willkommen, in 'Krudash's Hacken und Plündern'!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Farebas. Have a good sackin'!");
talkEntry:addResponse("Slàn leibhslàn! - Would say the orcs tounge. Tagtha?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Farebas. Ne Gute Plünderung wünsch ich noch!");
talkEntry:addResponse("Slàn leibhslàn! - So sagens wir Orks. Tagtha?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Farebas. Have a good sackin'!");
talkEntry:addResponse("Slàn leibhslàn! - Would say the orcs tounge. Tagtha?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Farebas. Ne Gute Plünderung wünsch ich noch!");
talkEntry:addResponse("Slàn leibhslàn! - So sagens wir Orks. Tagtha?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("Hurr. Mes allrighty! Good shop. Good husband. Good whelps.");
talkEntry:addResponse("Uh! I'm a rich and mighty orc! Lot's of snagas are mine!");
talkEntry:addResponse("Hrmpf!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befind");
talkEntry:addResponse("Hurr. Mirr gehts gut. Hab nen feinen Laden. N'guten Mann. Und gute welpen!");
talkEntry:addResponse("Hrmpf!");
talkEntry:addResponse("Uh! Ich bin ne reiche und mächtige Ork. Und alle Snagas tun, was ich befehle.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("I am Krudash. And this my Shop. 'Hack'n Sack', sellin all stuff you need for good hack'n sack trip.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Ich bin Krudash Und dars ist mein Laden. 'Hack'n Sack' - Hacken und Plündern! Verkaufe alles was du brauchst fürr guttes Hackn und plündarn.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I trade... and my snagas do all the work. So there is nothing for a maggot like you to do!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Ich handle... und meine Snagas machen alle Arbeit. Also gibt's nix zu tun für ne Made wie dich!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addResponse("I trade... and my snagas do all the work. So there is nothing for a maggot like you to do!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addResponse("Ich handle... und meine Snagas machen alle Arbeit. Also gibt's nix zu tun für ne Made wie dich!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("I'm the arms dealer in this town! And all those Snagas follow my command! Groch!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Ich bin der Waffenhändler in dieser Stadt! Und alle diese Snagas tun, was ich sag! Groch!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I'm the arms dealer in this town! And all those Snagas follow my command! Groch!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Ich bin der Waffenhändler in dieser Stadt! Und alle diese Snagas tun, was ich sag! Groch!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hrmpf! What else is there to say?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Hrmpf! Was gibts da zu sagn?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("Hurr, hurr. What do you buy?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Hurr, hurr. Was willst du kaufen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("murgo");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("#me grunts. 'Murgo is my husband. And he does what his wife command! Hrâch!'");
talkEntry:addResponse("Ch-h! Where's my husband, huh? For sure, he got another one of his nutty ideas! He's like a big rock, mes say. Jûk, difficult to move, but if it's rolling noone is able to stop it.");
talkEntry:addResponse("Hurr! Murgo is a good husband. He care much about the orclings and be strong warrior.");
talkEntry:addResponse("Eh-h... I was gate guard at Trolls Bane, long ago. I liked Murgo! He got a new armor with panther fur... and bones. *grunts* And he always knew what was important.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("murgo");
talkEntry:addResponse("#me grunzt langezogen. 'Murgo iss mein Mann. Und er tut was seine Frau ihm sagt! Hrâch!'");
talkEntry:addResponse("Ch-h! Wo treibt sich mein Mann wieder herum, hä? Bestimmt hatt er wieder eine seiner bekloppten Ideen gehabt! Er ist wie ein schwerer Stein, sag ich. Jûk, schwer zu bewegen, aber wenn's rollt kann's keiner aufhalten.");
talkEntry:addResponse("Hurr! Murgo is ein guter Mann. Er sorgt gutt, für die Jünglingens und ist ein starker Krieger.");
talkEntry:addResponse("Eh-h... Ich war Torwache in Trolls Fluch, lange her. Murgo hat mir gefallen! Er hat sich ne Rüstung machn lassen. Mit Pantherfell... und Knochen. *grunzt* Und er hat immer gewusst, was die Dinge sind die wichtig sind.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("er hja");
talkEntry:addTrigger("erhja");
talkEntry:addTrigger("er'hja");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Oh-h! Er'hja will be my little orcling forever. *grunts happily* Yes, she's fiendishly clever. I will be her proud mommy forever!");
talkEntry:addResponse("#me nods. 'Tagtha. Er'hja is my daughter. - She have a sister also, yes. Ol'hja, strangers get them mixed up.'");
talkEntry:addResponse("#me laughs hoarsely. 'Ha-hr. Orclings like Er'hja 'nd Ol'hja cause much trouble for their mommies and daddies...'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("er hja");
talkEntry:addTrigger("erhja");
talkEntry:addTrigger("er'hja");
talkEntry:addResponse("Oh-h! Er'hja wird immer meine kleine Orkling bleiben. *grunzt glücklich* Sie ist ist ja so sehr schlau und gewifft. Ich werd immer ihre stolze Mami sein!");
talkEntry:addResponse("#me nickt. 'Tagtha. Er'hja ist meine Tochter. - Sie hat auch ne' Schwester, ja. Ol'hja, Fremde verwechseln die Beiden oft.'");
talkEntry:addResponse("#me lacht heiser. 'Ha-hr. Orklinge wie Er'hja 'nd Ol'hja machen Mamis und Papis viele Sorgen...'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ali[czs]");
talkEntry:addTrigger("ali[czs]e");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Gâsh! Aliz' this weepy flimsy snaga! She complained again, huh? Listen! She's Krudash dirty Snaga, that for she has to follow Krudash's orders. And I'm Krudash!");
talkEntry:addResponse("Don't worry about the girl. She isn't worth it. She has to become strong and proud, do a good job. Ye-hs. But shes just going around crying like the puniest orclings...");
talkEntry:addResponse("I bought her for a few coins. Wasn't much money, no. But now she's sniveling and doesn't do a good job.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ali[czs]");
talkEntry:addTrigger("ali[czs]e");
talkEntry:addResponse("Gâsh! Aliz' diese jammernde schwache Snaga! Hat sie sich wieder bei jemanden mitleidig gemacht, hä? Hör zu! Sie's Krudashs dreckige Snaga, also tut sie was Krudash sagt. Und ich bin Krudash!");
talkEntry:addResponse("Kümmert Euch nich um das Mädchen. Das hat sie sich nämlich gar nicht verdient. Soll sie stark und stolz werden, ihre Arbeit gut tun! Ja-h. Aber sie flennt und häult nur! Wie die kleinsten Orkligne...");
talkEntry:addResponse("Ch-arr. Ich hab sie damals gekauft, war nicht viel Geld, nein. Aber jetzt ist sie weinerlich und tut ihre Arbeit nicht gut.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hack");
talkEntry:addTrigger("sack");
talkEntry:addResponse("Hurr Hurr. Ciamar a'seibh! How goin?");
talkEntry:addResponse("Hurr Hurr. Do you need an axe, huh?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hacken");
talkEntry:addTrigger("plündern");
talkEntry:addResponse("Hurr Hurr. Ciamar a'seibh! Wie geht's?");
talkEntry:addResponse("Hurr Hurr. Brauchst ne Axt, hä?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tom");
talkEntry:addTrigger("berry");
talkEntry:addTrigger("thomas");
talkEntry:addTrigger("berryard");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Ha-ha! I caught this puny loudmouth on my own. Now he has to work, although he's not happy about it. Thomas Berryard is my snaga now!");
talkEntry:addResponse("#me smashes her fist upon the table angrily. 'Scheschnak! This sneaky dirty swine Berryar'! Once he tried to mix broken glass into my food.'");
talkEntry:addResponse("Choar! This seedy halfer escaped one day and got lost in the mountains. Now 'e hab to batter stones.");
talkEntry:addResponse("Garh! The dastardly halfer! Thoma' Berryar'! Watch his tiny fists! He'll try to smash them between your legs, whether you're a man or a woman.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tom");
talkEntry:addTrigger("berry");
talkEntry:addTrigger("thomas");
talkEntry:addTrigger("berryard");
talkEntry:addResponse("Hä-hä! Ich hab das kleine Großmaul selbst gefangen. Jetz muss er schuften, auch wenn ihm das nicht gefällt. Thomas Berryard, er ist jetzt mein Snaga!");
talkEntry:addResponse("#me schlägt verärgert mit der Faust auf den Tisch. 'Scheschnak! Dieser hinterlistige Dreckskerl Berryar', hat mir einmal Glasscherben ins Fleisch gemischt.'");
talkEntry:addResponse("Choar! Der miese Halbling ist 'nes Tags ausgebuchst und hat sich auf der Flucht in d'n Bergen verirrt. Jetzt muss er zur Strafe Steine kloppen.");
talkEntry:addResponse("Hurr, behalt seine kleinen Fäustchen im Aug! Sonst haut er sie dir zwischen die Beine, da ist's ihm egal ob Mann oder Weib.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ol hja");
talkEntry:addTrigger("olhja");
talkEntry:addTrigger("ol'hja");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hurr, its difficult to get good job. But Ol'hja became a scout. For a band of mercenaries. Kj'at, thats a good job for an orc!");
talkEntry:addResponse("Tagtha, have you met Ol'hja recently? She's a good orc, isn't she? All men want to become her husband, but she's very stubborn. A pighead, like a donkey! But her mommy is very proud, yes I am. Yes.");
talkEntry:addResponse("Me Krudash isn't very skillful in the wild far away from town. Where would a gynkesh learn it, anyway? Ol'hja was taught by Mo'rurt, he 's a great hunter. I would bet the best. Taghta?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ol hja");
talkEntry:addTrigger("olhja");
talkEntry:addTrigger("ol'hja");
talkEntry:addResponse("Hurr, is schwer gute Arbeit zu finden. Aber Ol'hja is Späher geworden. Für ne Söldnertruppe. Kj'at, dass is ne gute Arbeit für ne Ork!");
talkEntry:addResponse("Taghta, hast du Ol'hja mal getroffen? Sie's eine gute Ork nich? Alle Männer wolln sie zur Frau, aber sie hat'n sturen Kopf. Einen Dickschädl, wie'n Esel! Aber ihre Mamy is sehr stolz, ja das bin ich. Ja.");
talkEntry:addResponse("Ich, Krudash kenn mich nicht aus draußen, wo die Stadt weit weg ist. Aber woher soll's eine Gynkesh auch lernen? Ol'hja hat alles was sie weiß von Mo'rurt gelernt, der is n' guter Jäger. Ich würd sagen der Beste. Taghta?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("kroch");
talkEntry:addTrigger("Gurak");
talkEntry:addTrigger("Kroch'Gurak");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Kroch'Gurak isn't a town, actually. No. But in winter, uncounted orc tribes wander there. Then the whole west Norbuk Plateau lives in the giant Caves there. And there's pig hunting and wrestling.");
talkEntry:addResponse("Mes dropped my daughters at isle Gobaith. And as soon as they were big enough, their father decided, they should live in Kroch'Gurak. So they were able to grow up among other orcs.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("kroch");
talkEntry:addTrigger("Gurak");
talkEntry:addTrigger("Kroch'Gurak");
talkEntry:addResponse("Kroch'Gurak is keine Stadt, würd ich sagen, nein. Aber im Winter lagern unzählige Orkstämme dort. Das westliche Norbuk Plateou zieht dann in die großen Höhlen dort. Und es gibt Schweinshats und Ringkämpfe.");
talkEntry:addResponse("Ich hab meine Töchter auf der Insel Gobaith geworfen. Und als sie groß genug waren entschied ihr Vater, das sie nach Kroch'Gurak ziehen sollten. Damit sie unter Orks großwachsen können.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("snaga");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Snagas! Those are monkeys... - basically. And weak puny orcs who need to be told what to do! A mighty orc like me, Krudash has many Snagas. Gâsh! Not for nothing, I'm the smartest here.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("snaga");
talkEntry:addResponse("Snagas! Das sind Affen... - eigentlich. Und schwächliche Orks, denen man sagt was sie tun müssen! Eine mächtige Ork wie ich, Krudash es bin hat viele Snagas. Gâsh! Bin ja auch die Schlauste hier.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("where com");
talkEntry:addTrigger("krochgurak");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hrach. I come frome Khenserra. But most orcs come frome Kroch'gurak where the Clans camp in winter.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("where com");
talkEntry:addTrigger("krochgurak");
talkEntry:addResponse("Hrach. Ich komme aus Khenserra. Aber viele Orks sind aus Kroch'gurak. Dort'ists wo die Clans im Winter lagern.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addResponse("Pfft! Astute wizard... Runewick rat!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Ch-h! Der listige Zauberer... Runewickratte!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Pfft! Astute wizard... Runewick rat!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Ch-h! Der listige Zauberer... Runewickratte!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Gnarh! Those are loathsome ...*grunt*... Scheschnaks! Maggots should eat their figgin!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Gnarh! Das sind widerliche ...*grunzt*... Scheschnaks! Maden sollen ihren Wabbel fressen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Glushdâsh! He is a damn dwarf! But he is good for business, yeah, yeah?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Glushdâsh! Er ist, 'n verdammter Zwerg! Aber mit denen ist gut handeln, nicht wahr, nicht wahr?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Why!? Gol-gol! There's a rich orcess that does whatever she wants! And all snagas do what I say. Hurr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Warrrum!? Gol-gol! Hier kann eine reiche Ork machen was sie will! Und alle Snagas tun was ich sage. Hurr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Queen");
talkEntry:addResponse("Hroar! I heard the queen's guards are nothing but monkeys wearing pants! Har!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königin");
talkEntry:addResponse("Hroar! Ich hab gehört, der Königin Leibgarde sind ein paar Affen denen man Hosen angezogen hat! Har!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hroar! I heard the queen's guards are nothing but monkeys wearing pants! Har!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Hroar! Ich hab gehört, der Königin Leibgarde sind ein paar Affen denen man Hosen angezogen hat! Har!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("If pigs walked on two legs... even the gods couldn't tell them apart from the Cadomyrs. Gosch!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Es heißt, würden Schweine aufrecht gehen... könnten nichtmal die Götter sie von den Cadomyrern unterscheiden. Gosch!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hurr. There are lots of Snagas. But only the humanz are allowed to order those Snails. Grot.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("Hurr. Dorts gibts ne Menge Snagas. Aber nur die dummen Menschenz dürfen sie zur Schneke machen. Grot.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Apart from Kroch'Gurak, Gynk is the best place for people. *grunts*... Although the sun is hot there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("Abgesehen von Kroch'Gurak, ist Gynk der beste Platz für die Leute. *grunzt*... Auch wenn die Sonne dort heiß ist.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Scheschnaks. Those are all dirty scheschnak-monkeys. Gosch!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Scheschnaks. Das sind alles dreckige Scheschnak-Affen. Gosch!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("The ancestors should praised, hail. Praise my fathers.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Die Vorfahren sein gepriesen, hâll. Ehre meinen Vätern.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("moshran");
talkEntry:addTrigger("god");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Gosh! Nub say tha name! Better talk to Shaman about tha fatha.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("moshran");
talkEntry:addTrigger("god");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Gosh! Du niemals sagst diesen Namen! Besser fragen Schamane über Vatha.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("cherga");
talkEntry:addTrigger("icy witch");
talkEntry:addTrigger("eis Hex");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hurr. Tha icy witch, be god ob ancestors. Just ask Grimlug!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("cherga");
talkEntry:addTrigger("icy witch");
talkEntry:addTrigger("eis Hex");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Hurr. Eisig Hexe, Gottin von Ahnen ist. Du fragst Grimlug!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addTrigger("weapon");
talkEntry:addResponse("Gâsh! I sell everything made in the forge. Sharpest Axes! Mightiest Armors! And best tools. Uh!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addTrigger("waffe");
talkEntry:addResponse("Gâsh! Ich verkaufe alles was sie in der Schmiede zusammen bauen. Schärfste Äxte! Mächtigste Rüstungen! Und bestes Werkzeug. Uh!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("Gâsh! I learned the dealing in Gynk! Yp-Yp.");
talkEntry:addResponse("Hrach! Do you know the blacksmith Frobenius? He sells swords, a horse farrier would be able to make them sharper.");
talkEntry:addResponse("Murgo is my husband! Er'hja and Ol'hja are us whelps. Taghta?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Gâsh! Ich hab das Handeln in Gynk gelernt! Yp-Yp.");
talkEntry:addResponse("Hrach! Kennst' du den Schmied Frobenius? Er verkauft Schwerter, ein Hufschmied könnt sie schärfer machen!");
talkEntry:addResponse("Murgo ist mein Mann! Er'hja und Ol'hja unsere Welpen. Taghta?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Krudash");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hurr Hurr. Ciamar a'seibh! How goin?");
talkEntry:addResponse("Hurr Hurr. Do you need an axe, huh?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Krudash");
talkEntry:addResponse("Hurr Hurr. Ciamar a'seibh! Wie geht's?");
talkEntry:addResponse("Hurr Hurr. Brauchst ne Axt, hä?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("Taghtha? Is good! Yes.");
talkEntry:addResponse("There we go. Allrighty-right.");
talkEntry:addResponse("Hurr, hurr. Wahtever you say.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("Taghta? Iss gut! Ja-h.");
talkEntry:addResponse("So machen wir's!");
talkEntry:addResponse("Hurr, hurr. Alles was du sagst.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("Grâth! Are you sure?");
talkEntry:addResponse("Then... no, isn't it?");
talkEntry:addResponse("#me chuckles. 'Is all right.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("Grâth! Bisst du sicher?");
talkEntry:addResponse("Dann nicht, nicht wahr?");
talkEntry:addResponse("#me kichert. 'Ist gut, is' gu-ht.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addResponse("Taghta!");
talkEntry:addResponse("Puny little Maggot.");
talkEntry:addResponse("Uh-h?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addResponse("Taghta!");
talkEntry:addResponse("Winzige kleine Made.");
talkEntry:addResponse("Uh-h?");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me leckt sich kurz über die Lippen. Dann streckt sie die Zunge heraus und berührt damit ihr hübsches Näschen.", "#me licks her lips. Then she sticks out her tongue and taps her cute nose.");
talkingNPC:addCycleText("Hack'n Sack! Hier Kannst du alles kaufen. Was 'ner wie du braucht für ne gutte Plünderei!", "Hack'n sack! here you buy all stuff for good plundering.");
talkingNPC:addCycleText("Uh, ich bin so stolz auf meine kleine Ol'hja und meine kleine Er'hja!", "Uh, mes be so proud ob mes littl Ol'hja and mes littl Er'hja!");
talkingNPC:addCycleText("Gnahrr! Wo ist mein fauler Sack von Mann?", "Gnahrr! Where is my lazy husband?");
talkingNPC:addCycleText("#me stochert mit ihrem Finger an einem der beiden Kieferzähnen herum. ", "#me digs with one of her fingers between her tusks.");
talkingNPC:addCycleText("#me schnaubt ein wenig.", "#me snorts quietly.");
talkingNPC:addCycleText("#me rubbelt mit den Fingernägeln an einem rostendem Eisenteil. Doch der Rost scheint sich hartnäckig darauf zu halten.", "#me scratches at a rusty pice of iron without making any change in the rust.");
talkingNPC:addCycleText("#me kichert und nuschelt: 'Snu-snu...'", "#me chuckles and mumbles: 'Snu-Snu...'");
talkingNPC:addCycleText("#me krazt sich knurrend am Kopf.", "#me scratches her head with a annoyed snarl.");
talkingNPC:addCycleText("#me nimmt einen Schluck aus einer kleinen schmuddeligen Flasche. Scharfer alkoholischer Dunst steigt in die Luft.", "#me takes a gulp from a grubby little bottle. A strong stench of alcohol fills the air.");
talkingNPC:addCycleText("#me klappert in einem einfachen ansteckenden Rythmus auf dem Holztisch.", "#me taps out a simple, catchy rhythm on the wooden table.");
talkingNPC:addCycleText("Hurr, kauft die dicksten Rüstungen von Krudash! Ich mach euch den besten Preis...", "Hurr, buy the thickest armor at Krudash! I make you the best price...");
talkingNPC:addCycleText("Schwerta! Äxte! Hämmer! Hossa, kauft ihr alles bei mir! Krudash!", "Swords! Axes! Hammers! Hossa, buy everything at Krudash's shop!");
talkingNPC:addCycleText("Ich hab das reinste Erz! Und die besten Preise in ganz Galmair! Gosh!", "I hold the purest ore! And the best price in whole Galmair! Gosh!");
talkingNPC:addCycleText("Schmiede, Eisenbieger... mit Krudash's Werkzeug macht ihr die besten Stücke!", "Smiths, Iron worker... Krudash's tools make the best goods!");
talkingNPC:addCycleText("#me hebt den Kopf und brüllt zur Werkstätte hinüber. 'Alize du dreckige kleine Snaga! Du sollst die Esse schürn! Taghta?'", "#me turns her head and yells at the forge. 'Alize, 'uh dirty little Snaga! Fan the fires! Taghta?'");
mainNPC:addLanguage(0);
mainNPC:addLanguage(5);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Eine sinnliche Orkfrau mit druchdringenden rotbraunen Augen. Sie hat ein süßes Näschen und kleine spitze Hauer. Achtsam überblickt sie den Marktplatz.", "A voluptous orcess with rebbrown eyes. She has a cute nose and small pointy tusks. She watches the marketplace observantly.");
mainNPC:setUseMessage("Fass mich nicht an! Oder ich mach disch Kebab! Alda!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut dich verwirrt an.", "#me looks at you confused.");
mainNPC:setEquipment(3, 362);
mainNPC:setEquipment(5, 23);
mainNPC:setEquipment(9, 366);
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
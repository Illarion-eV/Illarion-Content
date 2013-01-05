--------------------------------------------------------------------------------
-- NPC Name: Krudash                                                  Galmair --
-- NPC Job:  trader                                                           --
--                                                                            --
-- NPC Race: orc                        NPC Position:  366, 272, 0            --
-- NPC Sex:  female                     NPC Direction: west                   --
--                                                                            --
-- Author:   Rincewind                                                        --
--                                                       easyNPC Parser v1.21 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (4, 366, 272, 0, 6, 'Krudash', 'npc.krudash', 1, 0, 0, 6, 18, 8, 137, 123, 60);
---]]

require("npc.base.basic")
require("npc.base.condition.chance")
require("npc.base.condition.language")
require("npc.base.consequence.inform")
require("npc.base.consequence.state")
require("npc.base.consequence.trade")
require("npc.base.talk")
require("npc.base.trade")
module("npc.krudash", package.seeall)

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
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkEntry:addResponse("Gâsh! I sell everything made in the forge. Sharpest Axes! Mightiest Armours! Best tools. Uh!");
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
talkEntry:addResponse("Gâsh! Ich verkaufe alles was sie in der Schmiede zusammen bauen. Schärfste Äxte! Mächtigste Rüstungen! Und bestes Werkzeug. Uh!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Krudash the arms dealer. Keywords: buy, sell, trade, Er'hja, Kroch'Gurak, Snaga, Alice, Tom"));
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addResponse("Me, Krudash sell and buy lots of stuff! Taghta?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Krudash die Waffenhändlerin. Schlüsselwörter: kaufe, verkaufe, Handel, Er'hja, Kroch'Gurak, Snaga, Alice, Tom"));
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addResponse("Ich, Krudash verkaufe und kaufe viele Dinger! Taghta?");
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
talkEntry:addTrigger("Guten Morgen");
talkEntry:addTrigger("Guten Tag");
talkEntry:addTrigger("Guten Abend");
talkEntry:addTrigger("Gute Nacht");
talkEntry:addTrigger("Mahlzeit");
talkEntry:addTrigger("Tach");
talkEntry:addTrigger("Moin");
talkEntry:addTrigger("Mohltied");
talkEntry:addResponse("Greebas. Brauchst du was, hä?");
talkEntry:addResponse("Hurr! Sei gegrüßt.");
talkEntry:addResponse("Hurr. Ich, Krudash verkaufe alles, was 'ner wie du braucht für's hacken und plündarn! Hehe!");
talkEntry:addResponse("Latha math! Grüße-Grüße, sag ich.");
talkEntry:addResponse("Sei willkommen, in 'Krudash's Hacken und Plündern'!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
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
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
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
talkEntry:addTrigger("ihr name");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Ich bin Krudash Und dars ist mein Laden. 'Hack'n Sack' - Hacken und Plündern! Verkaufe alles was du brauchst fürr guttes Hackn und plündarn.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("I... and my snagas do all the work. So there is nothing for a maggot like you to do!");
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
talkEntry:addTrigger("order");
talkEntry:addResponse("I... and my snagas do all the work. So there is nothing for a maggot like you to do!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
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
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
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
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
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
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("er hja");
talkEntry:addTrigger("erhja");
talkEntry:addTrigger("er'hja");
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
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("ali[czs]");
talkEntry:addTrigger("ali[czs]e");
talkEntry:addResponse("Gâsh! Aliz' this weepy flimsy snaga! She complained again, huh? Listen! She's Krudash dirty Snaga, that for she has to follow Krudash's orders... and I'm Krudash!");
talkEntry:addResponse("Don't worry about the girl. She isn't worth it. She has to become strong and proud, do a good job. Ye-hs, but shes just going around crying like the puniest orclings...");
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
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("tom");
talkEntry:addTrigger("berry");
talkEntry:addTrigger("thomas");
talkEntry:addTrigger("berryard");
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
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("ol hja");
talkEntry:addTrigger("olhja");
talkEntry:addTrigger("ol'hja");
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
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("kroch");
talkEntry:addTrigger("Gurak");
talkEntry:addTrigger("Kroch'Gurak");
talkEntry:addResponse("Kroch'Gurak isn't a town, actually, no. But in winter, uncounted orc tribes wander there. Then the whole west Norbuk Plateau lives in the giant Caves there. And there's pig hunting and wrestling.");
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
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("snaga");
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
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("where com");
talkEntry:addTrigger("krochgurak");
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
talkEntry:addTrigger("dwarf");
talkEntry:addTrigger("dwarv");
talkEntry:addResponse("Hurr Hurr. Do you need an axe, huh?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("zwerg");
talkEntry:addResponse("Hurr Hurr. Brauchst ne Axt, hä?");
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
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
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
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Runewick");
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
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
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
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Galmair");
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
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
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
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cadomyr");
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
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("albar");
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
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
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
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("salkama");
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
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("moshran");
talkEntry:addTrigger("god");
talkEntry:addResponse("Gosh! Nub say tha name! Better talk to Shaman about tha fatha.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger("moshran");
talkEntry:addTrigger("god");
talkEntry:addResponse("Gosh! Du niemals sagst diesen Namen! Besser fragen Schamane über Vatha.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("cherga");
talkEntry:addTrigger("icy witch");
talkEntry:addTrigger("eis Hex");
talkEntry:addResponse("Hurr. Tha icy witch, be god ob ancestors. Just ask Grimlug!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger("cherga");
talkEntry:addTrigger("icy witch");
talkEntry:addTrigger("eis Hex");
talkEntry:addResponse("Hurr. Eisig Hexe, Gottin von Ahnen ist. Du fragst Grimlug!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("Gâsh! I learned the dealing in Gynk! Yp-Yp.");
talkEntry:addResponse("Hrach! Do you know the blacksmith Frobenius? He sells swords, a horse farrier would be able to make them sharper.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Gâsh! Ich hab das Handeln in Gynk gelernt! Yp-Yp.");
talkEntry:addResponse("Hrach! Kennst' du den Schmied Frobenius? Er verkauft Schwerter, ein Hufschmied könnt sie schärfer machen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Krudash");
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
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Taghta!");
talkEntry:addResponse("Puny little Maggot! What do you want?.");
talkEntry:addResponse("Uh-h?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Taghta!");
talkEntry:addResponse("Winzig kleine Made, was willst du?.");
talkEntry:addResponse("Uh-h?");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me leckt sich kurz über die Lippen. Dann streckt sie die Zunge heraus und berührt damit ihr hübsches Näschen.", "#me licks her lips. Then she sticks out her tongue and taps her cute nose.");
talkingNPC:addCycleText("Hack'n Sack! Hier Kannst du alles kaufen. Was 'ner wie du braucht für ne gutte Plünderei!", "Hack'n sack! here you buy all stuff for good plundering.");
talkingNPC:addCycleText("Uh, ich bin so stolz auf meine kleine Ol'hja und meine kleine Er'hja!", "Uh, mes be so proud ob mes littl Ol'hja and mes littl Er'hja!");
talkingNPC:addCycleText("Gnahrr! Wo ist mein fauler Sack von Mann?", "Gnahrr! Where is my lazy husband?");
talkingNPC:addCycleText("#me stochert mit ihrem Finger an einem der beiden Kieferzähnen herum. ", "#me digs with one of her fingers between her tusks.");
talkingNPC:addCycleText("#me schnaubt ein wenig.", "#me snorts quietly.");
talkingNPC:addCycleText("#me rubbelt mit den Fingernägeln an einem rostendem Eisenteil. Doch der Rost scheint sich hartnäckig darauf zu halten.", "#me scratches at a rusty piece of iron without making any change in the rust.");
talkingNPC:addCycleText("#me kichert und nuschelt: 'Snu-snu...'", "#me chuckles and mumbles: 'Snu-Snu...'");
talkingNPC:addCycleText("#me krazt sich knurrend am Kopf.", "#me scratches her head with an annoyed snarl.");
talkingNPC:addCycleText("#me nimmt einen Schluck aus einer kleinen schmuddeligen Flasche. Scharfer alkoholischer Dunst steigt in die Luft.", "#me takes a gulp from a grubby little bottle. A strong stench of alcohol fills the air.");
talkingNPC:addCycleText("#me klappert in einem einfachen ansteckenden Rythmus auf dem Holztisch.", "#me taps out a simple, catchy rhythm on the wooden table.");
talkingNPC:addCycleText("Hurr, kauft die dicksten Rüstungen von Krudash! Ich mach euch den besten Preis...", "Hurr, buy the thickest armor at Krudash! I make you the best price...");
talkingNPC:addCycleText("Schwerta! Äxte! Hämmer! Hossa, kauft ihr alles bei mir! Krudash!", "Swords! Axes! Hammers! Hossa, buy everything at Krudash's shop!");
talkingNPC:addCycleText("Ich hab das reinste Erz! Und die besten Preise in ganz Galmair! Gosh!", "I hold the purest ore! And the best price in whole Galmair! Gosh!");
talkingNPC:addCycleText("Schmiede, Eisenbieger... mit Krudash's Werkzeug macht ihr die besten Stücke!", "Smiths, Iron workers... Krudash's tools make the best goods!");
talkingNPC:addCycleText("#me hebt den Kopf und brüllt zur Werkstätte hinüber. 'Alize du dreckige kleine Snaga! Du sollst die Esse schürn! Taghta?'", "#me turns her head and yells at the forge. 'Alize, 'uh dirty little Snaga! Fan the fires! Taghta?'");
tradingNPC:addItem(npc.base.trade.tradeNPCItem(23,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2697,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2710,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2751,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(325,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(326,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(529,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(530,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(531,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(699,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(770,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(771,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2111,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2112,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2116,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2117,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2172,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(77,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(88,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(124,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(188,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(192,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(205,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(229,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(296,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(383,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2629,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2642,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2660,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2711,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2723,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2946,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(226,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(230,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(231,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2647,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2664,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2737,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(27,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(189,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(190,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(297,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(389,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(398,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(444,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2675,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2740,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(7,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(16,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(94,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(184,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(185,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(187,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(202,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(324,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2286,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2287,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2290,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2291,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2302,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2441,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2444,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2537,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2696,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(223,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(466,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(739,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(4,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(101,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(696,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2357,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2359,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2360,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2363,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2364,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2365,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2367,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2369,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2389,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2390,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2393,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2395,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2399,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2400,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2403,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2407,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(104,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(236,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2550,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2535,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2571,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(25,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(78,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(84,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(85,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(98,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(123,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(204,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(445,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2658,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2701,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2731,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2757,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2775,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2778,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(23,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2697,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2710,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2751,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(325,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(326,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(529,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(530,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(531,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(699,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(770,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(771,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2111,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2112,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2116,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2117,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2172,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(77,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(88,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(124,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(188,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(192,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(205,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(229,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(296,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(383,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2629,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2642,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2660,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2711,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2723,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2946,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(226,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(230,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(231,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2647,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2664,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2737,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(27,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(189,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(190,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(297,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(389,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(398,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(444,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2675,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2740,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(7,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(16,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(94,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(184,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(185,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(187,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(202,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(324,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2286,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2287,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2290,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2291,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2302,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2441,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2444,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2537,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2696,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(223,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(466,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(739,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(4,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(101,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(696,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2357,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2359,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2360,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2363,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2364,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2365,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2367,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2369,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2389,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2390,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2393,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2395,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2399,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2400,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2403,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2407,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(104,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(236,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2550,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2535,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2571,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(25,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(78,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(84,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(85,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(98,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(123,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(204,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(445,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2658,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2701,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2731,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2757,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2775,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2778,"buyPrimary"));
tradingNPC:addNotEnoughMoneyMsg("Du kannst dir das nicht leisten!", "You can not afford that!");
tradingNPC:addDialogClosedMsg("Danke, komm bald wieder!", "Thanks, come again!");
tradingNPC:addDialogClosedNoTradeMsg("Auf Bald!", "Farewell!");
tradingNPC:addWrongItemMsg("Das kaufe ich nicht.", "I'm not buying this.");
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

function receiveText(npcChar, texttype, message, speaker) mainNPC:receiveText(npcChar, texttype, speaker, message); end;
function nextCycle(npcChar) mainNPC:nextCycle(npcChar); end;
function lookAtNpc(npcChar, char, mode) mainNPC:lookAt(npcChar, char, mode); end;
function useNPC(npcChar, char, counter, param) mainNPC:use(npcChar, char); end;
initNpc();
initNpc = nil;
-- END
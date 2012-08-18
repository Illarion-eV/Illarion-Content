--------------------------------------------------------------------------------
-- NPC Name: Sam                                                         None --
-- NPC Job:  alcoholic                                                        --
--                                                                            --
-- NPC Race: human                      NPC Position:  674, 326, 0            --
-- NPC Sex:  male                       NPC Direction: southwest              --
--                                                                            --
-- Author:   Rincewind                                                        --
--                                                                            --
-- Last parsing: August 18, 2012                          easyNPC Parser v1.2 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (0, 674, 326, 0, 5, 'Sam', 'npc.sam', 0, 1, 0, 40, 23, 15, 217, 154, 123);
---]]

require("npc.base.basic")
require("npc.base.condition.chance")
require("npc.base.condition.language")
require("npc.base.consequence.inform")
require("npc.base.talk")
module("npc.sam", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Sam, a guest of The Hemp Necktie Inn . Keyphrases: tell something, who are you, Gobaith"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Sam, ein Gast im Gasthof zur Hanfschlinge. Schlüsselwörter: erzähl etwas, wer seid ihr, Gobaith"));
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
talkEntry:addResponse("#me raises his head slowly and looks around. 'Ew-h?'");
talkEntry:addResponse("#me raises his hand with great effort and waves. 'Greetings...'");
talkEntry:addResponse("#me exhales thickly. 'Greets.'");
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
talkEntry:addResponse("#me hebt langsam den Kopf und blickt sich um. 'Ew-h?'");
talkEntry:addResponse("#me hebt seine Hand schwerfällig und winkt. 'Grüße disch...'");
talkEntry:addResponse("#me atmet erschöpft aus. 'H-h...Tag.'");
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
talkEntry:addResponse("#me raises his head slowly and looks around. 'Ew-h?'");
talkEntry:addResponse("#me raises his hand with great effort and waves. 'Greetings...'");
talkEntry:addResponse("#me exhales thickly. 'Greets.'");
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
talkEntry:addResponse("#me hebt langsam den Kopf und blickt sich um. 'Ew-h?'");
talkEntry:addResponse("#me hebt seine Hand schwerfällig und winkt. 'Grüße disch...'");
talkEntry:addResponse("#me atmet erschöpft aus. 'H-h...Tag.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Good bye");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare thee well");
talkEntry:addResponse("#me nods a bit. 'Gn-ha.'");
talkEntry:addResponse("Bye...");
talkEntry:addResponse("#me looks questioningly. 'Eh?'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehabt euch wohl");
talkEntry:addResponse("#me nickt ein wenig. 'Gn-ha.'");
talkEntry:addResponse("Tschüss...");
talkEntry:addResponse("#me blickt fragend. 'Hä-h?'");
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
talkEntry:addResponse("'#me nods a bit. 'Gn-ha.'");
talkEntry:addResponse("Bye...");
talkEntry:addResponse("#me looks questioningly. 'Eh?'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addTrigger("See you");
talkEntry:addResponse("#me nickt ein wenig. 'Gn-ha.'");
talkEntry:addResponse("Tschüss...");
talkEntry:addResponse("#me blickt fragend. 'Hä-h?'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("#me raises his arms angrily and shouts drunkenly. 'I'm FINE!");
talkEntry:addResponse("Nothing...it's nothing. Everything's alright.");
talkEntry:addResponse("Ah-wh! My life is complete hellbriar! - You don't know what it's like!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befinden");
talkEntry:addResponse("#me hebt zornig die Arme und ruft. 'Es geht mir GUT!'");
talkEntry:addResponse("Nichts... es ist nichts. Allesch in beschter Ordnuch.");
talkEntry:addResponse("Ah-wh! Mein Lebn ischt die reinste Qual! - Wischt Ihr wie daasch ischt?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("Sam...I'm Sam. Just Sam.");
talkEntry:addResponse("Sam. Yes - THAT Sam, from the Grey Refuge. But... nobody knows that anymore.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Sam... isch bin Sam. Einfach nur Sam.");
talkEntry:addResponse("Sam. Ja DER Sam, von d' Grauhen Zuflucht. Aba... dasch kennt heute natürlisch keiner mehr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("#me sighs. 'Nothing....simple, just, plain nothing. Everything is gone! They took everything...ewh. Some time ago...yes...Sam sold everything. But now, there is nothing left.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("#me seufzt. 'Nischts... einfach gar nischts. Allesch isch weg! Sie habn mir allesch genommn... ewh. Damalsch - ja da hätt Euch Sam allesch verkauft. Aber jetsch ischt mein Laden wech.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("Where? Where? Is the old time gone? I'd like to follow her. But now - I drown my sorrows in Borgate's beer... good old Borgate.");
talkEntry:addResponse("Yes. In former times I had my shop in the castle of the Grey Orders. But...like everything that's gone now! Gone! Gone...");
talkEntry:addResponse("#me makes an angry gesture. 'Ewh-h! Let me drink in peace! Go away!! Grnrh?'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Wo? WO? Ischt die alte Zeit hin? Gern würd isch ihr folgn. Aber jetz - ertrink isch mein Leid mit Borgates Bier... guter alter Borgate.");
talkEntry:addResponse("Ja. Damlas hatt isch men Laden in der Burg der graun Orden. Aber wie allesch ischt dasch jetzsch vorbei...");
talkEntry:addResponse("#me macht eine verärgerte Handbewgung. 'Ewh-h! Lascht misch einfach in Friedn trinkn! Verschwind hier! Gnrh?'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("I a-am..eh...was a trader.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Isch b-bin... eh war n' Händler.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I a-am..eh...was a trader.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Isch b-bin... eh war n' Händler.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Yeah! Everything was pretty nice in Gobaith. Not so complicated like here!");
talkEntry:addResponse("Argh! Go away! Don't bother me! I don't talk with strangers...");
talkEntry:addResponse("I'll tell you, the Grey Orders decided about Gobaith. That didn't happen... and, good old Sam was in the middle of it!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Jah! In Gobaith war allesch noch schön Ordnlisch. Nich so verworrn wie hie-r!");
talkEntry:addResponse("Ärgh! Geh weg! Lasch misch in ruh! Ich sprech nisch mit Fremdn...");
talkEntry:addResponse("Sag isch dir, die Grauen Orden, haben über Gobaith entschiedn. Da hatsch sonscht nicht gegeben und, der gute Sam war mittn drin!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("I am");
talkEntry:addTrigger("my name");
talkEntry:addResponse("Yesh..!");
talkEntry:addResponse("Leave me alone!");
talkEntry:addResponse("Uargh. Never mind!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ich bin");
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Jah...!");
talkEntry:addResponse("Hau ab! Verschwind, Gsindel...");
talkEntry:addResponse("Uargh. Wasch sollt misch dasch kümmern?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Borgate");
talkEntry:addTrigger("barkeeper");
talkEntry:addTrigger("innkeeper");
talkEntry:addTrigger("Northoff");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Borgate is an old chum. He always knows what he has to do. Eh-h. Borgate, me and Eliza are left. I heard she lives in the swamp now.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("refuge");
talkEntry:addTrigger("grey");
talkEntry:addResponse("The Order of the Grey Light and Grey Rose. Yessh! Once the most powerful knights and landowners. If I would have stayed at my store I would be dead now. Dead...but happy.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("sam");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Huh? Did someone call me?");
talkEntry:addResponse("#me raises his head. 'I am Sam!'");
talkEntry:addResponse(" Ah-Leave me alone.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("market");
talkEntry:addTrigger("shop");
talkEntry:addTrigger("market");
talkEntry:addTrigger("store");
talkEntry:addResponse("Yes, my old store is gone. Far away..and I am here and ... drunk. Who can tell what's happening there?!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("eliza");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Awh-h. Eliza lives in the s-shh-swamp. Alone, you know? - We both lost our stores. But you can't do anything about it..it's too late...all too late. Isn't it?.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Borgate");
talkEntry:addTrigger("wirt");
talkEntry:addTrigger("Northoff");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Borgate kenn isch von damalsch, alsch wir auf Gobaith warn. Wie immer hat er schein Ding gemacht, alsch wir alle weg muschten von dort. Eh-h. Wir zwe' und Eliza sin übrich gebliebn. Die soll jetz im Sumpf lebn.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zuflucht");
talkEntry:addTrigger("grau");
talkEntry:addResponse("Der Orden desch graun Lischts und die Graue Rosche. Jeh-nau. Einst beschtimmten die mächtigsten Ritter und Meischter über deren Lande. Wer isch bei meinem Laden gebliebn, wär isch jetzt genau scho tot. Aber glücklisch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("laden");
talkEntry:addTrigger("schop");
talkEntry:addTrigger("Gesch[aeä]ft");
talkEntry:addTrigger("Markt");
talkEntry:addResponse("Ja-h men alter Laden isch weg. Weit weg und isch bin hier und sauf. Wer kann schon sagen was jetz dort paschiert?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("sam");
talkEntry:addResponse("Häh? Hat misch wer gerufn?");
talkEntry:addResponse("#me hebt zackig seinen Kopf. 'Isch bin Sam!'");
talkEntry:addResponse("Äh - Lascht misch in Friedn.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("eliza");
talkEntry:addResponse("Awh-h. Eliza soll irgendwo im Sumpf lebn. Gansch allein. Wischt du? - Wir habn beide unschern Laden verloren. Aber da kann man jetz nischt dagegen machen... Jetzsch nicht mehr. Oder?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addTrigger("archmage");
talkEntry:addTrigger("Erzmagier");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Ewh-h! Morgan is a self-important snob. That toad can eat my pants!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addTrigger("archmage");
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Ewh-h! Morgan ist n' aufgebalschener wischtigtuer. Dische Kröte kann mene Hoschn fressen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("A buncha s-shh-stuck up nobodies who would clean their butts with magic if they could! They can blow themselves up ... for all I care.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Diescher arrogante Haufn, würd sich mit Zauber-hei n' Hintern abwischn, wenn siehs könntn! Von mir ausch solln sie sich selbst exschplodiern!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Thissh ...uh...guy thinkssh he is some kind of half god. He's hyssh-terrrical!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Discher fene Pinkl von Zwerg tut alsch wär er n' halber Gott oder scho! Hysterisch issa, dasch allesch!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("#me shuts his eyes tightly closed. 'Are you from Galmair?! Are you one of those cutthroats? I tell you - honest people like S-Sh-Sam don't want to deal with you Galmairians!'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("#me kneift die Augen zusammen. 'Komscht du aus Galmair?! Bischt du eina von den Halschabschnedern? Oder n' habgieriches Filzmaul? Isch sag dir einsch - aufrichtiche leute wie Sam wolln nichtsch mit euch Galmairern zu tu-hn habn!'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("königin");
talkEntry:addTrigger("queen");
talkEntry:addTrigger("edwards");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("This queen is so p-p-posh. She drags all of Cadomyr down with her! But what ever, they are all idiots. All of them!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("königin");
talkEntry:addTrigger("queen");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Dische Könischin isch die Dekadenzsch in Person! Und gansch Cadomyr geht mit ihr schu Grunde! Aber wasch schollsch, sind sowiescho nur Dummköpfe. Allesamt!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("...scumbags, pigs, horse's arses, slimeballs! Thats what I call the people of Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("...Dummköpfe, Sturschädl, Blauau'en, Ziechenbärte, Pferdeorhn! Scho will ich dasch Volk Cadomirsch nenn'.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Albarian scrumbags! Speared my father on the battlefield!.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Albarische Drecksäcke! Habn mein' Papa aufn Schlachtfeld aufgeschpischt! Flusch! Jawohl - FLUSCH über 'n Könich Albarsch!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Too hot there right now. - Actually , it's always too hot in Gynk. I heard it doesn't snow during winter there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Isch Viel schu heisch dort, um die Jahreschzeit. - Eigntlisch um jede Jahreschzeit. Im Winter soll nischtmal Schnee falln.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I am from Salkamar. But why should I have stayed there? And why should I go back there? Do you know?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Isch komm ausch Salkamar. Aber wasch sollt misch dort gehaltn habn? Und warum scholt isch zurückehrn? Wischt ihr's?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("Eh-h? Do you think you're some kind of friend of mine or what? I don't know you! I only talk about gods with friends.");
talkEntry:addResponse("Leave me alone! I don't wanna think about gods with you around.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Eh-h? Bischt du 'n freund von mir? Isch kenn disch nich, nur mit mein'n Freunden sprech isch über Götter.");
talkEntry:addResponse("Hau ab! Isch will allein über die Götter grübeln.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Do I look like someone who has work for you? Leave, you stupid farmer!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Sche ich scho auch als hätt isch arbeit für disch? Verschwinde du dummer Bauer.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addResponse("Do I look like someone who has work for you? Leave, you stupid farmer!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addResponse("Sche ich scho auch als hhätt isch Arbeit für disch? Verschwinde du dummer Bauer.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("Eh-h?!");
talkEntry:addResponse("Fiiiiiine.");
talkEntry:addResponse("Yes-s!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("Eh-h?!");
talkEntry:addResponse("Isch jut.");
talkEntry:addResponse("Ja-h!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("Gn-hr...Just go away. Leave me alone!");
talkEntry:addResponse("I don't care, and now leave me alone!");
talkEntry:addResponse("So WHAT?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("Gn-hr... Geht einfach weg. Und lascht misch allein sein.");
talkEntry:addResponse("Isch mir Egal. Und jetz lascht mich in Ruh.");
talkEntry:addResponse("Na UND?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addResponse("Why do you talk with me? I don't even know you!");
talkEntry:addResponse("You talk like some smart ass elven girl.");
talkEntry:addResponse("Shut up and bring me another beer!.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addResponse("Warum quatscht Ihr misch su? Wir kenn'n unsch nich. Verschwindet!");
talkEntry:addResponse("Du quaschelscht wie so'n neunmal kluges Elfnweib.");
talkEntry:addResponse("Halt's Maul und bring mir noch 'n Bier!");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me rülpst herzhaft.", "#me belches loudly..");
talkingNPC:addCycleText("#me gähnt mit müdem Blick.", "#me yawns.");
talkingNPC:addCycleText("#me seufzt langezogen.", "#me lets out a long sigh.");
talkingNPC:addCycleText("#me grummelt wütend in seinen ungepflegten Bart hinein.", "#me mumbles something into his grubby beard.");
talkingNPC:addCycleText("#me schnieft ein wenig und wischt seine Nase am Hemdärmel ab.", "#me sniffles and wipes his nose on his sleeve.");
talkingNPC:addCycleText("#me schlägt wütend mit der Faust auf den Tisch.", "#me hits the table in anger.");
talkingNPC:addCycleText("#me wankt im sitzen hin und her.", "#me staggers to the left...and back to the right.");
talkingNPC:addCycleText("#me riecht nach Alkohol und Erbrochenem.", "#me reeks of alcohol and vomit.");
talkingNPC:addCycleText("#me's Augen fallen für einen Moment zu, er schnarcht einmal laut auf, dann blinzelt er und blickt sich ratlos um.", "#me can hardly keep his eyes open.");
talkingNPC:addCycleText("#me mustert den Boden seines leeren Glases.", "#me stares into his empty glass.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(1);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Ein lümmelnder Trunkenbold, mit Schnapsfahne und unterlaufenen Augen. Seine Bewegungen sind unkoordiniert und er lallt fürchterlich.", "A stumbling drunkard with creepy eyes and breath stinking of booze. His movements are uncoordinated and his speech is tremendously slurred.");
mainNPC:setUseMessage("Aw.. las dasch, eh?!", "Ew...sshtop thhaat, eh?!");
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

function receiveText(npcChar, texttype, message, speaker) mainNPC:receiveText(npcChar, speaker, message); end;
function nextCycle(npcChar) mainNPC:nextCycle(npcChar); end;
function lookAtNpc(npcChar, char, mode) mainNPC:lookAt(npcChar, char, mode); end;
function useNPC(npcChar, char, counter, param) mainNPC:use(npcChar, char); end;
initNpc();
initNpc = nil;
-- END
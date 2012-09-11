--------------------------------------------------------------------------------
-- NPC Name: Tronruk                                                  Cadomyr --
-- NPC Job:  priest                                                           --
--                                                                            --
-- NPC Race: orc                        NPC Position:  164, 621, 0            --
-- NPC Sex:  male                       NPC Direction: south                  --
--                                                                            --
-- Author:   envi                                                             --
--                                                                            --
-- Last parsing: September 11, 2012                      easyNPC Parser v1.21 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (4, 164, 621, 0, 4, 'Tronruk', 'npc.tronruk', 0, 2, 5, 108, 86, 72, 57, 138, 55);
---]]

require("npc.base.basic")
require("npc.base.condition.chance")
require("npc.base.condition.language")
require("npc.base.condition.quest")
require("npc.base.consequence.inform")
require("npc.base.consequence.quest")
require("npc.base.talk")
module("npc.tronruk", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is an old orc Tronruk. Keywords: Hello, story, orc, gods."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist der alte Ork Tronruk. Schlüsselwörter: Hallo, Geschichte, ork, Götter."));
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
talkEntry:addResponse("#me nods slightly and closes his eyes again.");
talkEntry:addResponse("Hurr? Yubbah, Yubbah.");
talkEntry:addResponse("Greebas.");
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
talkEntry:addResponse("#me nickt leicht und schließt seine Augen wieder.");
talkEntry:addResponse("Hurr? Yubbah, Yubbah");
talkEntry:addResponse("Grebbha.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("#me nods slightly and closes his eyes again.");
talkEntry:addResponse("Hurr? Yubbah, Yubbah.");
talkEntry:addResponse("Greebas.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("#me nickt leicht und schließt seine Augen wieder.");
talkEntry:addResponse("Hurr? Yubbah, Yubbah");
talkEntry:addResponse("Grebbha.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Fareebas.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Farebrass.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Fareebas.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Farebrass.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("Hurr, meh beh fine.");
talkEntry:addResponse("Tired as usual");
talkEntry:addResponse("#me scratches his bum.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befinden");
talkEntry:addResponse("Hurr, mich fein sein.");
talkEntry:addResponse("Mude wia imma");
talkEntry:addResponse("#me kratzt sich am Hintern.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("Tronruk.");
talkEntry:addResponse("Tronruk, an old orc. Hurr");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Tronruk");
talkEntry:addResponse("Tronruk, alter Ork mich bin. Hurr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Tronruk");
talkEntry:addResponse("Yubba, dat meh name! *hits his chest and grunts*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tronruk");
talkEntry:addResponse("Yubba, das mein Name! *schlägt sich auf die Brust*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Nubba quest, but storeh meh tell.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Nix Mission, aber Geschicht mich erzähl.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("Nubba task, but storeh meh tell.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Nix Aufgab, aber Geschicht mich erzähl.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("Meh nub work annehmore.");
talkEntry:addResponse("Sitting and telling old storehs");
talkEntry:addResponse("#me burps.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Ich nix mehr arbeiten.");
talkEntry:addResponse("Sitzen und alte Geschichtn erzähla");
talkEntry:addResponse("#me pfurzt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("Meh nub work annehmore.");
talkEntry:addResponse("Sitting and telling old storehs");
talkEntry:addResponse("#me burps.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Ich nix mehr arbeiten.");
talkEntry:addResponse("Sitzen und alte Geschichtn erzähla");
talkEntry:addResponse("#me pfurzt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Hurr, hurr, Meh remember, yubba. *closes his eyes again*");
talkEntry:addResponse("A clan beh dere. Berreh mighteh it beh!");
talkEntry:addResponse("Dat place beh ruled by bruddahs and sistahs.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Hurr, hurr, mich erinnern, yubba.*schließt seien Augen wieder*");
talkEntry:addResponse("Da war Klan. Sehr mächtig war der!");
talkEntry:addResponse("Das Platz war beherrscht von Brudda and Schwesta.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("Hurr, hurr!");
talkEntry:addResponse("Good to know.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Hurr, hurr!");
talkEntry:addResponse("Gut zu wissen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("why are you sitting");
talkEntry:addResponse("Dere beh nubbing to do.");
talkEntry:addResponse("Whub nub?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("stumpie");
talkEntry:addResponse("Berreh stoopid dem beh");
talkEntry:addResponse("Shave dem before yoo cook dem.");
talkEntry:addResponse("Hurr, meh remember 'Da Day of da Hammer'!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dwarf");
talkEntry:addTrigger("dwarves");
talkEntry:addResponse("Berreh stoopid dem beh");
talkEntry:addResponse("Shave dem before yoo cook dem.");
talkEntry:addResponse("Hurr, meh remember 'Da Day of da Hammer'!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("elf");
talkEntry:addTrigger("elb");
talkEntry:addResponse("Longears hub berreh long ears. Dere beh a bruddah whub collecting dem, but meh nub remember more about him. He beh onleh bruddah habs rank ob 'Red Skull'.");
talkEntry:addResponse("Chop down dere trees, ib yoo want fun whib dem!*smirks*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("longear");
talkEntry:addResponse("Longears hub berreh long ears. Dere beh a bruddah whub collecting dem, but meh nub remember more about him. He beh onleh bruddah habs rank ob 'Red Skull'.");
talkEntry:addResponse("Chop down dere trees, ib yoo want fun whib dem!*smirks*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("hubling");
talkEntry:addTrigger("halfer");
talkEntry:addResponse("Meh likee 'stuffed hubling'.");
talkEntry:addResponse("Use dem as slave!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("halfing");
talkEntry:addResponse("Meh likey 'stuffed hubling'.");
talkEntry:addResponse("Use dem as slave!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("slave");
talkEntry:addResponse("Hublings beh berreh good slaves.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("oomie");
talkEntry:addTrigger("ommie");
talkEntry:addResponse("Better nub trust dem!");
talkEntry:addResponse("Meh nub know maneh ob dem.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("human");
talkEntry:addResponse("Better nub trust dem!");
talkEntry:addResponse("Meh nub know maneh ob dem.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oomie town");
talkEntry:addTrigger("Ommie town");
talkEntry:addResponse("Dere beh maneh ob dem. Too maneh ib yoo ask meh!");
talkEntry:addResponse("Hurr, Albar, Gynk or Salkama for exampla.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hurr?");
talkEntry:addResponse("Hurr!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("story");
talkEntry:addTrigger("stories");
talkEntry:addResponse("Whub old story from old Gobaith yoo want hear? 'Da Day of da Hammer' or 'Day of Green Growl'?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Geschichte");
talkEntry:addResponse("Welche alt Geschichte von alt Gobaith du wollen hören? 'Der Tag des Hammer' oder 'Tag des Grünen Knurren'?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Father");
talkEntry:addResponse("Da Faddah make us strong and mighteh!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Faddha");
talkEntry:addResponse("Da Faddah make us strong and mighteh!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("sitzen");
talkEntry:addResponse("Nix tun zu.");
talkEntry:addResponse("Warum nicht?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("stumpie");
talkEntry:addResponse("Sehr dumm sie sind.");
talkEntry:addResponse("Rassiera die bevor du kochen die.");
talkEntry:addResponse("Hurr, mich erinnern an 'Der Tag des Hammer'!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zwerg");
talkEntry:addResponse("Sehr dumm sie sind.");
talkEntry:addResponse("Rassiera die bevor du kochen die.");
talkEntry:addResponse("Hurr, mich erinnern an 'Der Tag des Hammer'!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("elf");
talkEntry:addTrigger("elb");
talkEntry:addResponse("Longears haba lange Ohra. Mich erinnern Bruddha der sammla diese. Aber mich nix wissen mehr. Aussa Brudda haba Rang von 'Red Skull'.");
talkEntry:addResponse("Holz ab ihra Baum, wenn du wollen Spaß mit ihna.*grinst böse*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Langohr");
talkEntry:addResponse("Longears haba lange Ohra. Mich erinnern Bruddha der sammla diese. Aber mich nix wissen mehr. Aussa Brudda haba Rang von 'Red Skull'.");
talkEntry:addResponse("Holz ab ihra Baum, wenn du wollen Spaß mit ihna.*grinst böse*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hubling");
talkEntry:addTrigger("halfer");
talkEntry:addResponse("Mich empfehla 'gefühlt Hubling'.");
talkEntry:addResponse("Verwend die als Sklave!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Halbling");
talkEntry:addResponse("Mich empfehla 'gefühlt Hubling'.");
talkEntry:addResponse("Verwend die als Sklave!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sklave");
talkEntry:addResponse("Hublinge sein gute Sklave.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("oomies");
talkEntry:addTrigger("ommies");
talkEntry:addResponse("Besser nix trauen denen!");
talkEntry:addResponse("Mich nix kenna viele.");
talkEntry:addResponse("Dah bruddah Jag won a big tournament in dah big Oomie-town in Gobaith.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Mensch");
talkEntry:addResponse("Besser nix trauen denen!");
talkEntry:addResponse("Mich nix kenna viele.");
talkEntry:addResponse("Bruddha Jag hat gewonnen großa Tournier in der großa Ommie-Stadt in Gobaith.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oomie Stadt");
talkEntry:addTrigger("Ommie town");
talkEntry:addResponse("Viela von dena gibts. Zu viela wenn du fragen mich!");
talkEntry:addResponse("Hurr, Albar, Gynk oda Salkama zum Beispiel.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hurr?");
talkEntry:addResponse("Hurr!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Vater");
talkEntry:addResponse("Der Vater macht uns stark und mächtig!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Faddha");
talkEntry:addResponse("Der Vater macht uns stark und mächtig!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("orc");
talkEntry:addResponse("Hurr! Greenskin beh strong and proud! Praise beh to dah Faddah!");
talkEntry:addResponse("Dat beh dah superior race, yubba!");
talkEntry:addResponse("Meh beh orc! *smirks*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ork");
talkEntry:addResponse("Hurr! Grünhaut sein stark und stolz! Bete zu Vater!");
talkEntry:addResponse("Das sein die überlegene Rasse, yubba!");
talkEntry:addResponse("Mich sein Ork! *lacht frecht*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addTrigger("archmage");
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Pahh! Wizzard!.");
talkEntry:addResponse("Meh smash it ib meh see it.");
talkEntry:addResponse("Betta nub meet dat mage.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addTrigger("archmage");
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Pahh! Zaubara!.");
talkEntry:addResponse("Mich verhauen es, wenn mich sehen es.");
talkEntry:addResponse("Besser nicht treffen diesen Zauberer.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Meh heard it smells dere.");
talkEntry:addResponse("Habs big towers dere because dem hub short...yoo know whub meh mean *blinks*.");
talkEntry:addResponse("Burn it!.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Ich hörte es stinken dort.");
talkEntry:addResponse("Die haben große Turm weil die haben kurz...du wissen was ich meine *zwinkert*.");
talkEntry:addResponse("Brenn es ab!.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Bad Oomie, bad.");
talkEntry:addResponse("Dat oomie habs many coins, meh likee dat. Mahbeh yoo bring meh dem?");
talkEntry:addResponse("Tricky as all oddha oomie.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Schlecht Ommie, schlecht.");
talkEntry:addResponse("Mich möchen dass das Ommie habn so viel Münza. Vielleicht du bringne mich diese Münza?");
talkEntry:addResponse("Trickreich wie andere Ommie.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Meh nub like dat dere beh so maneh stumpies here.");
talkEntry:addResponse("Yoo like games, go dere.");
talkEntry:addResponse("#me spits.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Mich nicht mögen dass viele Stumpies seien dort.");
talkEntry:addResponse("Du mögen Spiele, du gehen dort.");
talkEntry:addResponse("#me spuckt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("königin");
talkEntry:addTrigger("queen");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Dat oomie habs honor!.");
talkEntry:addResponse("It beh nice, yubba?.");
talkEntry:addResponse("Best oomie meh habs ebba met.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("königin");
talkEntry:addTrigger("queen");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Ehre das Ommie haben!.");
talkEntry:addResponse("Es sind nett, yubba?.");
talkEntry:addResponse("Bestes Ommie mich jemals getroffen haben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Nub like a cave, but it beh keh.");
talkEntry:addResponse("Mahbeh weh should start digging bigger hole in mountain.");
talkEntry:addResponse("Smash dah enemeh ob dat town.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Nicht wie Höhle, aber es sein gut.");
talkEntry:addResponse("Vieleicht wir sollen starten graben großer Loch in Berg.");
talkEntry:addResponse("Verhau Feinde dieser Stadt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("albar");
talkEntry:addResponse("Betta ask a oomie about dat oomie-town.");
talkEntry:addResponse("Meh nub interested in dah oomie-towns.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("Besser fragen Ommie über Ommie-Stadt.");
talkEntry:addResponse("Mich nich interssiert sein in Ommie-Stadt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addResponse("One ob da big empires.");
talkEntry:addResponse("Who cares about dat place?");
talkEntry:addResponse("Hmm...meh nub know ib dey pray to Bragon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("Eines der großen Reiche.");
talkEntry:addResponse("Wer interessiert sich sohon für diese Stadt?");
talkEntry:addResponse("Ich weiß nicht, ob die zu Bragon beten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("salkama");
talkEntry:addResponse("One ob da big empires.");
talkEntry:addResponse("Who cares about dat place?");
talkEntry:addResponse("Hmm...meh nub know ib dey pray to Bragon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Eines der großen Reiche.");
talkEntry:addResponse("Wer interessiert sich sohon für diese Stadt?");
talkEntry:addResponse("Ich weiß nicht, ob die zu Bragon beten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("Bragon, Malachin, Zambra and Cherga. But all beh ruled by da Faddah!");
talkEntry:addResponse("Oldra for da spring, Bragon for da summer, Malachin for da autumn, and Cherga for da winter.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Bragon, Malachin, Zambra und Cherga. Aba üba alla steht der Vater!");
talkEntry:addResponse("Oldra für Frühling, Bragon für Sommer, Malachin für Herbst, and Cherga für Winter.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Adron");
talkEntry:addResponse("Dat god beh weak compared to da Faddah.");
talkEntry:addResponse("#me scratches his bum and shakes his head.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Adron");
talkEntry:addResponse("Das Gott sein schwach im Vergleich mit der Vater.");
talkEntry:addResponse("#me kratzt sich am Hintern und schüttelt den Kopf.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addResponse("Meh pray to dat god in summer.");
talkEntry:addResponse("Bragon beh god against fear and weakness!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addResponse("Mich beten zu den Got in Sommer");
talkEntry:addResponse("Bragon sind Gott gegen Angst und Schwäche!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cherga");
talkEntry:addResponse("Meh pray to dat god in winter.");
talkEntry:addResponse("Cherga beh dah 'icy witch'.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addResponse("Mich beten zu den Got in Winter");
talkEntry:addResponse("Cherga sind 'eisige Hexe'.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elara");
talkEntry:addResponse("Dat god beh weak compared to da Faddah.");
talkEntry:addResponse("#me scratches his bum and shakes his head.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elara");
talkEntry:addResponse("Das Gott sein schwach im Vergleich mit der Vater.");
talkEntry:addResponse("#me kratzt sich am Hintern und schüttelt den Kopf.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Eldan");
talkEntry:addResponse("Dat god beh weak compared to da Faddah.");
talkEntry:addResponse("#me scratches his bum and shakes his head.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eldan");
talkEntry:addResponse("Das Gott sein schwach im Vergleich mit der Vater.");
talkEntry:addResponse("#me kratzt sich am Hintern und schüttelt den Kopf.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Findari");
talkEntry:addResponse("Dat god beh weak compared to da Faddah.");
talkEntry:addResponse("#me scratches his bum and shakes his head.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Findari");
talkEntry:addResponse("Das Gott sein schwach im Vergleich mit der Vater.");
talkEntry:addResponse("#me kratzt sich am Hintern und schüttelt den Kopf.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("Dat god beh weak compared to da Faddah.");
talkEntry:addResponse("#me scratches his ass and shakes his head.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("Das Gott sein schwach im Vergleich mit der Vater.");
talkEntry:addResponse("#me kratzt sich am Hintern und schüttelt den Kopf.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addResponse("Meh pray to dat god in autumn.");
talkEntry:addResponse("Malachin beh god of hunting.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addResponse("Mich beten zu den Got in Herbst");
talkEntry:addResponse("Malachin sein Gott der Jagd.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Moshran");
talkEntry:addResponse("Beh our Faddah whub make us strong.");
talkEntry:addResponse("Better call him Faddah!");
talkEntry:addResponse("Da Faddah rules da World!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Moshran");
talkEntry:addResponse("Sein unser Vater und macht uns stark.");
talkEntry:addResponse("Besser verwende Vater für ihn!");
talkEntry:addResponse("Der Vater beherrscht die Welt!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addTrigger("Nargùn");
talkEntry:addResponse("Dat god beh weak compared to da Faddah.");
talkEntry:addResponse("#me scratches his bum and shakes his head.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addTrigger("Nargùn");
talkEntry:addResponse("Das Gott sein schwach im Vergleich mit der Vater.");
talkEntry:addResponse("#me kratzt sich am Hintern und schüttelt den Kopf.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("Meh pray to dat god in spring.");
talkEntry:addResponse("Oldra beh dah life bringer");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("Mich beten zu den Got in Frühling");
talkEntry:addResponse("Oldra sein der Lebensbringer");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("Dat god beh weak compared to da Faddah.");
talkEntry:addResponse("#me scratches his bum and shakes his head.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("Das Gott sein schwach im Vergleich mit der Vater.");
talkEntry:addResponse("#me kratzt sich am Hintern und schüttelt den Kopf.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("Dat god beh weak compared to da Faddah.");
talkEntry:addResponse("#me scratches his bum and shakes his head.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("Das Gott sein schwach im Vergleich mit der Vater.");
talkEntry:addResponse("#me kratzt sich am Hintern und schüttelt den Kopf.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("Dat god beh weak compared to da Faddah.");
talkEntry:addResponse("#me scratches his bum and shakes his head.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("Das Gott sein schwach im Vergleich mit der Vater.");
talkEntry:addResponse("#me kratzt sich am Hintern und schüttelt den Kopf.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("Dat god beh weak compared to da Faddah.");
talkEntry:addResponse("#me scratches his bum and shakes his head.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("Das Gott sein schwach im Vergleich mit der Vater.");
talkEntry:addResponse("#me kratzt sich am Hintern und schüttelt den Kopf.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Zhambra");
talkEntry:addResponse("Zhambra beh da god ob bruddah-hood.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zhambra");
talkEntry:addResponse("Zhambra sind 'Brüder-Göttin'.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("Meh habs nubbin.");
talkEntry:addResponse("Meh nub sell nubbin.");
talkEntry:addResponse("Yoo habs to ask bruddahs and sistahs ib yoo wanna buy stuff.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Mich hub nix");
talkEntry:addResponse("Mich nix verkaufen.");
talkEntry:addResponse("Du müssa fragen Bruder und Schwesta wenn du wollen kaufen Sachen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("Hurr, hurr!");
talkEntry:addResponse("Meh habs maneh stories!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Hurr, hurr!.");
talkEntry:addResponse("Mich kennen viele Geschichten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hammer");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Hurrkeh, meh tell yoo da storeh about dat day. Say 'yubba' or 'more' ib yoo want meh tell more and 'stop' ib yoo habs heard enub!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hammer");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Hurrkeh, mich erzählen Geschichte über das Tag. Sag 'Yubba' oder 'Weiter' wenn hören wollen mehr, und 'Stop' wenn nix mehr hören wollen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 1));
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addTrigger("more");
talkEntry:addTrigger("continue");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Meh tell da story as da Warlord once did. *His voice deepens and becomes hoarse* Bruddahs and sistahs, be proud! Today, da might ob da clan be known!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 1));
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addTrigger("Weiter");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Mich erzählen Geschichte wie Kriegsherr eins tat. *Seine Stimme wird tiefer und heiser* Büder und Schwester, jubelt! Heute, Geschichte wurde geschrieben!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Meh tell da story as da Warlord once did. *his voice deepens and becomes hoarse* Bruddahs and sistahs, rejoice! Today, da might ob da clan be known!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 1));
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Mich erzählen Geschichte wie Kriegsherr eins tat. *Seine Stimme wird tiefer und heiser* Büder und Schwester, jubelt! Heute, Geschichte wurde geschrieben!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 1));
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 2));
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addTrigger("more");
talkEntry:addTrigger("continue");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("When da Warlord wubs going into da human city ob Trolls Bane after a meeting wib da chief, he met da army ob da dwarves led by da stumpie queen herself!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 2));
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addTrigger("Weiter");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Als der Kriegsherr die Menschenstadt Trolls Bane betretten wollte nach einem Treffen mit dem Häuptling, er lief in eine Zwergenarmee, angeführt von der Königin ihrerselbst!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("When da Warlord wubs going into da human city ob Trolls Bane after a meeting wib da chief, he met da army ob da dwarves led by da stumpie queen herself!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 2));
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Als der Kriegsherr die Menschenstadt betretten wollte nach einem Treffen mit dem Häuptling, er lief in eine Zwergenarmee, angeführt von der Königin ihrerselbst!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 2));
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 3));
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addTrigger("more");
talkEntry:addTrigger("continue");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Dem stumpies wubs tinking dat da Warlord, wubs easy for dem ta beat!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 3));
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addTrigger("Weiter");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Die dachten, dass ich, der Kriegsherr sei ein einfaches Ziel für sie!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 3));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Dem stumpies wubs tinking dat da Warlord, wubs easy for dem ta beat!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 3));
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Die dachten, dass ich, der Kriegsherr sei ein einfaches Ziel für sie!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 3));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 3));
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 4));
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addTrigger("more");
talkEntry:addTrigger("continue");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Dem stumpies wubs hurling insults at him but da Warlord stood his ground and when dey wubs ready to attack, da lizard Taliss, friend ob da Warlord and ally ob da clan, came from dah back and stood by da side ob da Warlord!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 4));
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addTrigger("Weiter");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Ich stand wie ein Fels in der Brandung gegen ihre Beleidigungne und als sie mich angriffen, Taliss, unser verbündete Echsenfreund erschien von hinten und stand an meiner Seite!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Dem stumpies wubs hurling insults at him but da Warlord stood his ground and when dey wubs ready to attack, da lizard Taliss, friend ob da Warlord and ally ob da clan, came from dah back and stood by da side ob da Warlord!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 4));
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Ich stand wie ein Fels in der Brandung gegen ihre Beleidigungne und als sie mich angriffen, Taliss, unser verbündete Echsenfreund erschien von hinten und stand an meiner Seite!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 4));
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 5));
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addTrigger("more");
talkEntry:addTrigger("continue");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Togeddah dey fought like bruddahs, cutting down stumpies on one side and da oddha!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 5));
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addTrigger("Weiter");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Zusammen kämpften wir wie Brüder, schnitten durch die Zwerge wie ein heißes Messer durch Butter!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 5));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Togeddah dey fought like bruddahs, cutting down stumpies on one side and da oddha!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 5));
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Zusammen kämpften wir wie Brüder, schnitten durch die Zwerge wie ein heißes Messer durch Butter!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 5));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 5));
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 6));
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addTrigger("more");
talkEntry:addTrigger("continue");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Da stumpie queen herself wubs filled wib fear ob da Faddah and ob da Warlord..");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 6));
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addTrigger("Weiter");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Die Königin sleber began herum zu laufen wie ein erschrockenes Scwein welches zur Schlachtbank geführt wird.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 6));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Da stumpie queen herself wubs filled wib fear ob da Faddah and ob da Warlord.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 6));
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Die Königin sleber began herum zu laufen wie ein erschrockenes Scwein welches zur Schlachtbank geführt wird.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 6));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 6));
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 7));
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addTrigger("more");
talkEntry:addTrigger("continue");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Da stumpies had fiery magic weapons dat nearly sent da Warlord to da grave but dey still fell under his might and drowned in puddles ob dey own blood!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 7));
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addTrigger("Weiter");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Und obwohl die Zwerge feurige, magische Waffen benützten, welche mich beinahe ins Grab beförderten, schon bald fielen sie in ihr eigenes Becken von Blut!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 7));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Da stumpies had fiery magic weapons dat nearly sent da Warlord to da grave but dey still fell under his might and drowned in puddles ob dey own blood!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 7));
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Und obwohl die Zwerge feurige, magische Waffen benützten, welche mich beinahe ins Grab beförderten, schon bald fielen sie in ihr eigenes Becken von Blut!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 7));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 7));
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 8));
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addTrigger("more");
talkEntry:addTrigger("continue");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Da stumpie queen was sent to da cross dat day and da Warlord, Taliss and da human Tirrend captured da queen, bound her and dragged her all da way back to da cave where dey shoved her into da jail! *He grins mischievously.*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 8));
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addTrigger("Weiter");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Die Königin schleppte sich zum Kreuz, wo ich, Taliss und der Mensch Tirrend sie fesselten und den ganzen Weg zur Höhle schleppten und sie ins Gefängnis worfen! *Er grinst boshaft.*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 8));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse(" Da stumpie queen was sent to da cross dat day and da Warlord, Taliss and da human Tirrend captured da queen, bound her and dragged her all da way back to da cave where dey shoved her into da jail! *He grins mischievously.[/ .*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 8));
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Die Königin schleppte sich zum Kreuz, wo ich, Taliss und der Mensch Tirrend sie fesselten und den ganzen Weg zur Höhle schleppten und sie ins Gefängnis worfen! *Er grinst boshaft.*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 8));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 8));
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 9));
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addTrigger("more");
talkEntry:addTrigger("continue");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Da Warlord spoke to da clan, ?Bruddahs and sistahs, rejoice! We habs captured da stumpie queen! Now she will face da trial ob da orcs, she will face our anger!'...Yubba, dat how it happened. Da Faddah appeared dat day and ordered dem to throw her from da holy mountain!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 9));
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addTrigger("Weiter");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Brüder, jubelt! Wir haben die Königin gefangen genommen! Nun wird sie dem Gericht der Orks entgegentreten, Sie wird all unserer Wut entgegentreten!...Yubba, es geschah. Sie wurfen sie von heiligen Berg!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 9));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Da Warlord spoke to da clan, ?Bruddahs and sistahs, rejoice! We habs captured da stumpie queen! Now she will face da trial ob da orcs, she will face our anger!'...Yubba, dat how it happened. Da Faddah appeared dat day and ordered dem to throw her from dah holy mountain!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 9));
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Brüder, jubelt! Wir haben die Königin gefangen genommen! Nun wird sie dem Gericht der Orks entgegentreten, Sie wird all unserer Wut entgegentreten!...Yubba, es geschah. Sie wurfen sie von heiligen Berg!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 9));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 9));
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 10));
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addTrigger("more");
talkEntry:addTrigger("continue");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Let dis be known as da Day ob da Hammer! Da day when da stumpie army got crushed under da feet ob dem dat fought for honor! *He closes his eyes as he finishes.*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 10));
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addTrigger("Weiter");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Lasst diesen Tag als Tag des Hammer in Erinnerung halten! Der Tag an dem die Zwergenarme wurde zerschmettert und den Füssen von jenen die für Ehre kämpfen! *Er schließt die Augen nachdem er fertig ist.*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 10));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Let dis be known as da Day ob da Hammer! , da day when da stumpie army got crushed under da feet ob dem dat fought for honor! *He closes his eyes as he finishes.*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 10));
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Lasst diesen Tag als Tag des Hammer in Erinnerung halten! Der Tag an dem die Zwergenarme wurde zerschmettert und den Füssen von jenen die für Ehre kämpfen! *Er schließt die Augen nachdem er fertig ist.*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 10));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 10));
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Growl");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 11));
talkEntry:addResponse("Me tell da story as da Chief once did. Say 'yubba' or 'more' ib yoo want me tell more and 'stop' ib yoo habs heard enub! *His voice deepens and becomes hoarse* Bruddahs and sistahs!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Knurren");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 11));
talkEntry:addResponse("Mich erzählen Geschichte wie Häuptling eins tat. Sag 'Yubba' oder 'Weiter' wenn hören wollen mehr, und 'Stop' wenn nix mehr hören wollen! *Seine Stimme wird tiefer und heiser* Büder und Schwester!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 11));
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addTrigger("more");
talkEntry:addTrigger("continue");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Once again da Orcs hab shown dey superior strength! Da 24. Elos ob da year 30 shall beh know as da Day ob Green Growl!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 11));
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addTrigger("Weiter");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Einmal mehr haben die Orks ihre übermächtige Stärke gezeigt! Der 24. Elos im Jahre 30 soll für immer als der Tag des Grünen Knurren in Erinnerung bleiben!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 11));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Once again da Orcs hab shown dey superior strength! Da 24. Elos ob da year 30 shall beh know as da Day ob Green Growl!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 11));
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Einmal mehr haben die Orks ihre übermächtige Stärke gezeigt! Der 24. Elos im Jahre 30 soll für immer als der Tag des Grünen Knurren in Erinnerung bleiben!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 11));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 11));
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 12));
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addTrigger("more");
talkEntry:addTrigger("continue");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Dese Orcs ob da Horde wus dere: Silver Skull Murgo, Red Skull Jag, Sistah Kry`Rack, Bruddah Slug, Chief Rugh'toh.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 12));
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addTrigger("Weiter");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Diese Orks der Horde waren dort: Silver Skull Murgo, Red Skull Jag, Sistah Kry`Rack, Bruddah Slug, Chief Rugh'toh.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 12));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Dese Orcs ob da Horde wus dere: Silver Skull Murgo,Red Skull Jag, Sistah Kry`Rack, Bruddah Slug, Chief Rugh'toh.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 12));
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Diese Orks der Horde waren dort: Silver Skull Murgo, Red Skull Jag, Sistah Kry`Rack, Bruddah Slug, Chief Rugh'toh.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 12));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 12));
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 13));
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addTrigger("more");
talkEntry:addTrigger("continue");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Due to our deep faith in da Faddah we mastered da fighting tournament organised by da Prince ob oomie town Trolls Bane AND we smashed da oomies ob da Temple!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 13));
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addTrigger("Weiter");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Danke unserem tiefen Glauben an den Vater wir meisterten es das von Prinzen der Menschen in Menschenstadt Trolls Bane organisierte Turnier zu gewinnen UND die Menschen des Tempel nieder zu schlagen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 13));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Due to our deep faith in da Faddah we mastered da fighting tournament organised by da Prince ob oomie town AND we smashed da oomies ob da Temple!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 13));
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Danke unserem tiefen Glauben an den Vater wir meisterten es das von Prinzen der Menschen organisierte Turnier zu gewinnen UND die Menschen des Tempel nieder zu schlagen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 13));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 13));
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 14));
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addTrigger("more");
talkEntry:addTrigger("continue");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Hurr, meh remember dat storeh habs two parts. Da 'Tournament' and da 'Aftermath'. Whub one yoo want hear?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 14));
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addTrigger("Weiter");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Hurr, mich erinnern dies Geschichte haben zwei Teile. 'Turnier' und 'Nachspiel'. Welche du wollen hören?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 14));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Hurr, meh remember dat storeh habs two parts. Da 'Tournament' and da 'Aftermath'. Whub ona yoo want hear?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 14));
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Hurr, mich erinnern dies Geschichte haben zwei Teile. 'Turnier' und 'Nachspiel'. Welche du wollen hören?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 14));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 14));
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tournament");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 21));
talkEntry:addResponse("Hurrkeh, meh tell yoo da storeh about dat day. Say 'yubba' or 'more' ib yoo wants me tell more and 'stop' ib yoo habs heard enub!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Turnier");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 21));
talkEntry:addResponse("Hurrkeh, mich erzählen Geschichte über das Tag. Sag 'Yubba' oder 'Weiter' wenn hören wollen mehr, und 'Stop' wenn nix mehr hören wollen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 15));
talkEntry:addTrigger("Tournament");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 21));
talkEntry:addResponse("Hurrkeh, meh tell yoo da storeh about dat day. Say 'yubba' or 'more' ib yoo want me tell more and 'stop' ib yoo habs heard enub!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 15));
talkEntry:addTrigger("Turnier");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 21));
talkEntry:addResponse("Hurrkeh, mich erzählen Geschichte über das Tag. Sag 'Yubba' oder 'Weiter' wenn hören wollen mehr, und 'Stop' wenn nix mehr hören wollen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Aftermath");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 31));
talkEntry:addResponse("Hurrkeh, meh tell yoo da storeh about dat day. Say 'yubba' or 'more' ib yoo want me tell more and 'stop' ib yoo habs heard enub!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nachspiel");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 31));
talkEntry:addResponse("Hurrkeh, mich erzählen Geschichte über das Tag. Sag 'Yubba' oder 'Weiter' wenn hören wollen mehr, und 'Stop' wenn nix mehr hören wollen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 15));
talkEntry:addTrigger("Aftermath");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 31));
talkEntry:addResponse("Hurrkeh, meh tell yoo da storeh about dat day. Say 'yubba' or 'more' ib yoo want me tell more and 'stop' ib yoo habs heard enub!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 15));
talkEntry:addTrigger("Nachspiel");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 31));
talkEntry:addResponse("Hurrkeh, mich erzählen Geschichte über das Tag. Sag 'Yubba' oder 'Weiter' wenn hören wollen mehr, und 'Stop' wenn nix mehr hören wollen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 21));
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addTrigger("more");
talkEntry:addTrigger("continue");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("First rounds ob three. Da smelly oomies tried to betray us! In da very first fight dey let fight Murgo gainst Jag! By doing so dey could get rid ob one ob da orcs!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 21));
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addTrigger("Weiter");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Erste Runde von Drei. Stinkende Ommies versuchen uns betrügen! In aller ersten Kampf die lassen kämpfen Murgo gegen Jag! Bei tuen so die konnten los werden einen von sehr schnell!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 21));
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("First rounds ob three. Da smelly oomies tried to betray us! In da very first fight dey let fight Murgo gainst Jag! By doing so dey could get rid ob one ob da orcs!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 21));
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Erste Runde von Drei. Stinkende Ommies versuchen uns betrügen! In aller ersten Kampf die lassen kämpfen Murgo gegen Jag! Bei tuen so die konnten los werden einen von sehr schnell!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 21));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 21));
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 22));
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addTrigger("more");
talkEntry:addTrigger("continue");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("In a great struggle Jag succeeded ober Murgo. But dis smelly decision to let Orcs fight gainst each other in first round made da Horde angry!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 22));
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addTrigger("Weiter");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("In großen Schlacht Jag bestand gegen Murgo. Aber stinkende Entscheidung zu lassne Orks kämpfen gegeneinander in erster Runde machte Horde böse!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 22));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("In a great struggle Jag succeeded ober Murgo. But dis smelly decision to let Orcs fight gainst each other in first round made da Horde angry!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 22));
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("In großen Schlacht Jag bestand gegen Murgo. Aber stinkende Entscheidung zu lassne Orks kämpfen gegeneinander in erster Runde machte Horde böse!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 22));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 22));
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 23));
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addTrigger("more");
talkEntry:addTrigger("continue");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("In da first round da Chief got a weak halfer to smash. Da hardest ting wus nub to kill da halfer wit heavy blow since it wus against da rules.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 23));
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addTrigger("Weiter");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("In erster Runde Chief bekam schwachen Halbing zu schlagen. Meist schwerste Ding war nicht zu töten Halbing mit schweren Schlag weil gegen Regeln.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 23));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("In da first round da Chief got a weak halfer to smash. Da hardest ting wus nub to kill da halfer wit heavy blow since it wus against da rules.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 23));
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("In erster Runde Chief bekam schwachen Halbing zu schlagen. Meist schwerste Ding war nicht zu töten Halbing mit schweren Schlag weil gegen Regeln.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 23));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 23));
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 24));
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addTrigger("more");
talkEntry:addTrigger("continue");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("In second round bruddah Jag fought against a brave oomie and won in good fight! Da Chief had to fight da oomie Don Andrews. Dis usually easy but on dis day da Faddah decided to test da faith ob Orcs.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 24));
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addTrigger("Weiter");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Zweit Runde. In zweit Runde Bruder Jag kämpft gegen tapfer Ommie und gewann in guter Kampf! Chief haben kämpfen müssen gegen Ommie Don Andrews. Normalerweise leichte Aufgabe, aber diesen Tag Vater entschied zu testen Glauben von Orks.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 24));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("In second round bruddah Jag fought against a brave oomie and won in good fight! Da Chief had to fight da oomie Don Andrews. Dis usually easy but on dis day da Father decided to test da faith ob Orcs.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 24));
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Zweit Runde. In zweit Runde Bruder Jag kämpfte gegen taper Ommie und gewann in guter Kampf! Chief haben kämpfen müssen gegen Ommie Don Andrews. Normalerweise leichte Aufgabe, aber diesen Tag Vater entschied zu testen Glauben von Orks.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 24));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 24));
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 25));
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addTrigger("more");
talkEntry:addTrigger("continue");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("In da middle ob da fight smelly Don made a lucky slash and broke da armor ob da Chief on da legs. The Chief stumbled and almost fell into da water.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 25));
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addTrigger("Weiter");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("In Mitte von Kampf stinkender Don machte glücklichen Schlag und zerbrach Rüstung von Chief auf Bein. Chief schwankte ein wenig und stürzte fast in Wasser.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 25));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("In da middle ob da fight smelly Don made a lucky slash and broke da armor ob da Chief on da legs. The Chief stumbled and almost fell into da water.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 25));
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("In Mitte von Kampf stinkender Don machte glücklichen Schlag und zerbrach Rüstung von Chief auf Bein. Chief schwankte ein wenig und stürzte fast in Wasser.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 25));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 25));
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 26));
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addTrigger("more");
talkEntry:addTrigger("continue");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Aftah he lost his stance da Chief got more hard blows and finally lost da fight against Don. Orcs wus shocked and dey wanted bloody revenge.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 26));
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addTrigger("Weiter");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Durch verlorenes Gleichgeweicht Chief steckte ein mehr harte Schläge und verlor schlußendlich Kampf gegen Don. Orks waren geschockt und suchten nach blutiger Rache.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 26));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Aftah he lost his stance da Chief got more hard blows and finally lost da fight against Don. Orcs wus shocked and dey wanted bloody revenge.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 26));
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Durch verlorenes Gleichgeweicht Chief steckte ein mehr harte Schläge und verlor schlußendlich Kampf gegen Don. Orks waren geschockt und suchten nach blutiger Rache.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 26));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 26));
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 27));
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addTrigger("more");
talkEntry:addTrigger("continue");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("In da final round da Chief had to fight against a oomie warrior. Due to his anger it was a quick and bloody fight. Da Chief made da third rank. In very final round, bruddah Jag fought against Don. Da oomie used his swords, Jag his powerful maces.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 27));
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addTrigger("Weiter");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Endrund. Chief musste kämpfen gegen Ommie Krieger. Aufgrund den Ärger es war kurz und blutig Kampf. Chief machte dritten Rang. In finaler Runde, Bruder Jag kampfte gegen Don. Ommie verwendete sein Schwerter, Jag seine mächtig Streitkolben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 27));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("In da final round da Chief had to fight against a oomie warrior. Due to his anger it was a quick and bloody fight. Da Chief made da third rank. In very final round, bruddah Jag fought against Don. Da oomie used his swords, Jag his powerful maces.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 27));
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Endrund. Chief musste kämpfen gegen Ommie Krieger. Aufgrund den Ärger es war kurz und blutig Kampf. Chief machte dritten Rang. In finaler Runde, Bruder Jag kampfte gegen Don. Ommie verwendete sein Schwerter, Jag seine mächtig Streitkolben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 27));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 27));
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 28));
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addTrigger("more");
talkEntry:addTrigger("continue");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("In a long fight dey hacked at each oddha wib such strength and speed dat yoo could barely see dey weapons. Ib one ob dey blows would habs missed and hit da wooden arena ground, dey would habs fallen into da water.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 28));
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addTrigger("Weiter");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("In langer Kampf die schlugen sich mit solch Stärke und Schnelligkeit, dass kaum zu sehen war Waffen. Wenn einer Schlag daneben gesetzt und Holzbühne getroffen hätte, die würden gefallen in Wasser.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 28));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("In a long fight dey hacked at each oddha wib such strength and speed dat yoo could barely see dey weapons. Ib one ob dey blows would habs missed and hit da wooden arena ground, dey would habs fallen into da water.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 28));
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("In langer Kampf die schlugen sich mit solch Stärke und Schnelligkeit, dass kaum zu sehen war Waffen. Wenn einer Schlag daneben gesetzt und Holzbühne getroffen hätte, die würden gefallen in Wasser.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 28));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 28));
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 29));
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addTrigger("more");
talkEntry:addTrigger("continue");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("When it seemed dat Jag would lose, da Orcs at da tribune shouted louder, growled and grunted from da side of da Arena. Jag heard dat, felt da spirit ob da Faddah and did two sudden blows wib his maces - Don was done!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 29));
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addTrigger("Weiter");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Wenn scheinen dass Jag verlieren, Orks neben Bühne brüllten lauter, knurrten und grunzten von Seite von Arena. Jag hörte das, spürte Geist von Vater und machte zwei schnell Schlag mit Streitkolben - Don war fertig!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 29));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("When it seemed dat Jag would lose, da Orcs at da tribune shouted louder, growled and grunted from da side of da Arena. Jag heard dat, felt da spirit ob da Faddah and did two sudden blows wib his maces - Don was done!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 29));
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Wenn scheinen dass Jag verlieren, Orks neben Bühne brüllten lauter, knurrten und grunzten von Seite von Arena. Jag hörte das, spürte Geist von Vater und machte zwei schnell Schlag mit Streitkolben - Don war fertig!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 29));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 29));
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 30));
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addTrigger("more");
talkEntry:addTrigger("continue");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Da Orcs became da glory winners ob da tournament!...yoo want hear da rest ob da glory day now?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 30));
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addTrigger("Weiter");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Orks wurden glorreich Sieger von Turnier!...du wollen hören Rest von glorreich Tag nun?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 30));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Da Orcs became da glory winners ob da tournament!...yoo want hear da rest ob da glory day now?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 30));
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Orks wurden glorreich Sieger von Turnier!...du wollen hören Rest von glorreich Tag nun?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 30));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 30));
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 31));
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addTrigger("more");
talkEntry:addTrigger("continue");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Naturally, after da tournament maneh othurr warriors wanted to test their weakness against da mighty Orcs. Jag and da Chief smashed dem all, one after da other.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 31));
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addTrigger("Weiter");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Natürlich nach Turnier viel andere Krieger wollten testen ihre Schwäche gegen mächtig Orks. Jag und Chief schlugen alle, einen nach anderen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 31));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Naturally, after da tournament maneh othurr warriors wanted to test their weakness against da mighty Orcs. Jag and da Chief smashed dem all, one after da other.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 31));
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Natürlich nach Turnier viel andere Krieger wollten testen ihre Schwäche gegen mächtig Orks. Jag und Chief schlugen alle, einen nach anderen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 31));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 31));
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 32));
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addTrigger("more");
talkEntry:addTrigger("continue");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("One ob da opponents wus da oomie Gerron Lavence. Da Chief recognized him immediately: It wus one ob da Temple memburs who once broke da law and entered da holy lands ob da Father without permission.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 32));
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addTrigger("Weiter");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Ein Gegner war Ommie Gerron Lavence. Chief erkannte sofort: Es waren einer von Tempel Mitglieder wo einmal brachen Gesetz und betraten heilig Land von Vater ohne Erlaubnis.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 32));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("One ob da opponents wus da oomie Gerron Lavence. Da Chief recognized him immediately: It wus one ob da Temple memburs who once broke da law and entered da holy lands ob da Father without permission.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 32));
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Ein Gegner war Ommie Gerron Lavence. Chief erkannte sofort: Es waren einer von Tempel Mitglieder wo einmal brachen Gesetz und betraten heilig Land von Vater ohne Erlaubnis.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 32));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 32));
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 33));
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addTrigger("more");
talkEntry:addTrigger("continue");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Eben worse, he dared to attack da Orcs who wanted tomake him go and also smashed da Chief wit da help ob a mage.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 33));
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addTrigger("Weiter");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Viel schlimmer, er traute angreifen Orks die wollten vertreiben ihn und auch schlagen Chief mit Hilfe von Zauberer.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 33));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Eben worse, he dared to attack da Orcs who wanted to make him go and also smashed da Chief wit da help ob a mage.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 33));
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Viel schlimmer, er traute angreifen Orks die wollten vertreiben ihn und auch schlagen Chief mit Hilfe von Zauberer.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 33));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 33));
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 34));
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addTrigger("more");
talkEntry:addTrigger("continue");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Wif dat in da mind ob da smart Chief, he called for all his bruddahs and sistahs. Da horde surrounded da oomie Gerron and blocked da gate.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 34));
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addTrigger("Weiter");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Haben das in Erinnerung von schlauer Chief, er ruffen alle Brüder und Schwester erreichbar. Horde umkesselte Ommie Gerron und blockiert Tor.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 34));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Wif dat in da mind ob da smart Chief, he called for all his bruddahs and sistahs. Da horde surrounded da oomie Gerron and blocked da gate.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 34));
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Haben das in Erinnerung von schlauer Chief, er ruffen alle Brüder und Schwester erreichbar. Horde umkesselte Ommie Gerron und blockiert Tor.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 34));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 34));
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 35));
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addTrigger("more");
talkEntry:addTrigger("continue");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Orcs wus angry. Orcs hab fought all day. Orcs wus hungry for revenge. Den da slaughtering began.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 35));
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addTrigger("Weiter");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Orks war wütend. Orks haben gekämpft ganz Tag. Orks war hungrig nach Rache. Dann Gemetzel begonnen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 35));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Orcs wus angry. Orcs hab fought all day. Orcs wus hungry for revenge. Den da slaughtering began.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 35));
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Orks war wütend. Orks haben gekämpft ganz Tag. Orks war hungrig nach Rache. Dann Gemetzel begonnen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 35));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 35));
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 36));
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addTrigger("more");
talkEntry:addTrigger("continue");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Da coward Gerron began to flee after few slashes, but da horde chased him and blocked the way many times. Then a lizard helped da oomie Gerron to reach the gates.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 36));
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addTrigger("Weiter");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Feigling Gerron beginnen fliehen nach wenig Schläge, aber Horde jagd ihn, blockiert Weg viel mal. Dann Echse griff ein und helfen Ommie Gerron zu erreichen Tor.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 36));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Da coward Gerron began to flee after few slashes, but da horde chased him and blocked the way many times. Then a lizard helped da oomie Gerron to reach the gates.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 36));
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Feigling Gerron beginnen fliehen nach wenig Schläge, aber Horde jagd ihn, blockiert Weg viel mal. Dann Echse griff ein und helfen Ommie Gerron zu erreichen Tor.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 36));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 36));
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 37));
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addTrigger("more");
talkEntry:addTrigger("continue");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Smart and mighty bruddah Jag saw da oomie might be able to flee and threw a Gynk fire for da oomie. Da explosion wus loud, da fire bright and hot. When oomie Gerron fell to his knees, being nuttin but a flaming oomie, his end wus sealed.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 37));
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addTrigger("Weiter");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Schlau und mächtig Bruder Jag sah Ommie können fähig sein fliehen und warf Gynk Feuer nach Ommie. Explosion war laut, Feuer hell und heiß. Wenn Ommie stürzen zu Knie, nix sein außer flammiger Ommie, sein Ende besiegelt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 37));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Smart and mighty bruddah Jag saw da oomie might be able to flee and threw a Gynk fire for da oomie. Da explosion wus loud, da fire bright and hot. When oomie Gerron fell to his knees, being nuttin but a flaming oomie, his end wus sealed.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 37));
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Schlau und mächtig Bruder Jag sah Ommie können fähig sein fliehen und warf Gynk Feuer nach Ommie. Explosion war laut, Feuer hell und heiß. Wenn Ommie stürzen zu Knie, nix sein außer flammiger Ommie, sein Ende besiegelt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 37));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 37));
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 38));
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addTrigger("more");
talkEntry:addTrigger("continue");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("His gods might hab welcomed his fouled soul on da othurr side. Though, da fight wus nub ober yet.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 38));
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addTrigger("Weiter");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Sein Gott mögen willkommen nehmen sein faule Seele auf anderer Seite. Denoch Kampf nicht vorbei nun.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 38));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("His gods might hab welcomed his fouled soul on da othurr side. Though, da fight wus nub ober yet.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 38));
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Sein Gott mögen willkommen nehmen sein faule Seele auf anderer Seite. Denoch Kampf nicht vorbei nun.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 38));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 38));
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 39));
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addTrigger("more");
talkEntry:addTrigger("continue");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Da lizard still attacked da Orcs as well as an oomie called Jefferson. Da Orcs formed up again and slashed dem one after da other!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 39));
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addTrigger("Weiter");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Echse weiter angreifen wie auch Ommie mit namen Jefferson. Orks formen noch einmal und schlugen einen nach anderen bis fallen nach anderen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 39));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Da lizard still attacked da Orcs as well as an oomie called Jefferson. Da Orcs formed up again and slashed dem one after da other!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 39));
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Echse weiter angreifen wie auch Ommie mit namen Jefferson. Orks formen noch einmal und schlugen einen nach anderen bis fallen nach anderen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 39));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 39));
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 40));
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addTrigger("more");
talkEntry:addTrigger("continue");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("In da end ob battle da victorious Orcs stood alone on da Arena in da blood ob da oomies. Though, oomies nub whud beh oomies and da Temple nub whud beh da Temple if dey nub beh very stoopid!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 40));
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addTrigger("Weiter");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("In Ende von Schlacht siegreich Orks stehen alleine in Arena in Blut von Ommies. Doch Ommies nix sein Ommies und Tempel nix sein Tempel wenn die nix sein sehr dumm!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 40));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("In da end ob battle da victorious Orcs stood alone on da Arena in da blood ob da oomies. Though, oomies nub whud beh oomies and da Temple nub whud beh da Temple if dey nub beh very stoopid!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 40));
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("In Ende von Schlacht siegreich Orks stehen alleine in Arena in Blut von Ommies. Doch Ommies nix sein Ommies und Tempel nix sein Tempel wenn die nix sein sehr dumm!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 40));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 40));
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 41));
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addTrigger("more");
talkEntry:addTrigger("continue");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("So dey came back and wunted to fight da Orcs. But Orcs beh smart! We had our victory on dat day and left da oomie town. We returned to holy lands into our cave.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 41));
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addTrigger("Weiter");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("So die kommen zurück und wollen kämpfen gegen Orks. Aber Orks schlau! Wir haben unser Sieg am Tag und verlassen Ommie Stadt. Wir zurück zu heilig Land in unser Höhle.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 41));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("So dey came back and wunted to fight da Orcs. But Orcs beh smart! We had our victory on dat day and left da oomie town. We returned to holy lands into our cave.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 41));
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("So die kommen zurück und wollen kämpfen gegen Orks. Aber Orks schlau! Wir haben unser Sieg am Tag und verlassen Ommie Stadt. Wir zurück zu heilig Land in unser Höhle.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 41));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 41));
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 42));
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addTrigger("more");
talkEntry:addTrigger("continue");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Nub much later da oomies ob da Temple came to Orc gates and wunted us to get out. We knew dat wus a trap. We knew dat Father whud judge dem fer entering Orc lands once again.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 42));
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addTrigger("Weiter");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Nix viel später Ommies von Tempel kommen zu Ork Tor und wollen uns raus kommen. Wir wissen das sein Falle. Wir wissen das Vater werden richten die für betreten Ork Land wieder.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 42));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Nub much later da oomies ob da Temple came to Orc gates and wunted us to get out. We knew dat wus a trap. We knew dat Father whud judge dem fer entering Orc lands once again.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 42));
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("Nix viel später Ommies von Tempel kommen zu Ork Tor und wollen uns raus kommen. Wir wissen das sein Falle. Wir wissen das Vater werden richten die für betreten Ork Land wieder.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 42));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 42));
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 43));
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addTrigger("more");
talkEntry:addTrigger("continue");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("So we made jokes ob dem and let dem rot in front ob our gates under da eyes ob our brave gate guard.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 43));
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addTrigger("Weiter");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("So wir machen Witze über die und lassen die verrotten vor unser Tor unter Auge unser tapfer Torwache.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 43));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("So we made jokes ob dem and let dem rot in front ob our gates under da eyes ob our brave gate guard.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 43));
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkEntry:addResponse("So wir machen Witze über die und lassen die verrotten vor unser Tor unter Auge unser tapfer Torwache.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 43));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 43));
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 44));
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addTrigger("more");
talkEntry:addTrigger("continue");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Dat wus da Day ob Green Growl! Meh proud to beh an Orc! Remembur ob dat glory day. And beh prepared fer next Orc meeting! Chief Rugh'toh ...*He grunts, closes his eyes and falls silent.*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 44));
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addTrigger("Weiter");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Das war Tag von Grün Knurren! Mich stolz zu sein Ork! Erinnert glorreichen Tag. Und seit bereit für nächstes Ork Treffen! Chief Rugh'toh...*Er grunzt, schließt seine Augen und wir leise.*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 44));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Dat wus da Day ob Green Growl! Meh proud to beh an Orc! Remembur ob dat glory day. And beh prepared fer next Orc meeting! Chief Rugh'toh ...*He grunts, closes his eyes and falls silent.*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 44));
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Das war Tag von Grün Knurren! Mich stolz zu sein Ork! Erinnert glorreichen Tag. Und seit bereit für nächstes Ork Treffen! Chief Rugh'toh...*Er grunzt, schließt seine Augen und wir leise.*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 44));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 44));
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Chief");
talkEntry:addResponse("Meh remember dat beh dah best leader ebba! But meh nub know whub happened to him!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Häuptling");
talkEntry:addTrigger("Hauptling");
talkEntry:addResponse("Mich erinnern das sein bester Anfuhrer jemals! Aber mich nix wissen was ihm passierte.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Rugh");
talkEntry:addResponse("Hurr, daht beh smart and proud Chief from Clan ob Northern Mountains. Meh nub know if he beh around now.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Rugh");
talkEntry:addResponse("Hurr, das sein schlau und stolz Chief von Klan von Nordgebierge. Mich nix wissen ob er nun umeinander sein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Warlord");
talkEntry:addResponse("Meh remember dat beh dah strongest orc ebba! Betta run if him beh on other side!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Kriegsherr");
talkEntry:addResponse("Mich erinnern das sein stärkster Ork! Besser lauf wenn du sehen ihn auf anderer Seite stehen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Rogruk");
talkEntry:addTrigger("Bregoguk");
talkEntry:addResponse("Hurr, dat beh strong Warlord from Clan ob Northern Mountains. Meh nub know if he beh around now.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Rogruk");
talkEntry:addTrigger("Bregoguk");
talkEntry:addResponse("Hurr, das sein stark Kriegsherr von Klan von Nordgebierge. Mich nix wissen ob er nun umeinander sein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Murgo");
talkEntry:addTrigger("Lokh");
talkEntry:addResponse("He, he... Bruddah Murgo be also known as dah Flying Lokh'um, but dah broddah will explain dat to yoo if yoo meet him. *smirks and covers his head*");
talkEntry:addResponse("Hurr, dat be strong Orc from Clan ob Northern Mountains. Meh nub know if he be around now.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Murgo");
talkEntry:addTrigger("lokh");
talkEntry:addResponse("He, he... Bruder Murgo sein bekannt auch als Fliegend Lokh'um, aber das sollen Brudder selber erklären wenn du treffen ihn. *kichert und hält sich seinen Kopf*");
talkEntry:addResponse("Hurr, das sein stark Ork von Klan von Nordgebierge. Mich nix wissen ob er nun umeinander sein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Jag");
talkEntry:addResponse("Hurr! Dun get hit by Red Skull Jag's maces...*howls*");
talkEntry:addResponse("Hurr, dat be strong Orc from Clan ob Northern Mountains. Meh nub know if he be around now.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Jag");
talkEntry:addResponse("Hurr! Vermeid treffen werden von Red Skull Jag' Streitkolben...*heult*");
talkEntry:addResponse("Hurr, das sein stark Ork von Klan von Nordgebierge. Mich nix wissen ob er nun umeinander sein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Gerron");
talkEntry:addTrigger("Lavence");
talkEntry:addTrigger("Murdok");
talkEntry:addResponse("Dat be berreh strong oomie wif wood stick. Be careful if ebba see dat oomie.");
talkEntry:addResponse("Meh know dat oomie also wif dah name Murdok.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gerron");
talkEntry:addTrigger("Lavence");
talkEntry:addTrigger("Murdok");
talkEntry:addResponse("Das sein sehr stark Ommie mit Holzstab sein. Sei vorsichtig wenn du sehen das Ommie.");
talkEntry:addResponse("Mich kennen das Ommie auch mit Name Murdok");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Murdok");
talkEntry:addResponse("Dat be berreh strong oomie wif wood stick. Be careful if ebba see dat oomie.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Murdok");
talkEntry:addResponse("Das sein sehr stark Ommie mit Holzstab sein. Sei vorsichtig wenn du sehen das Ommie.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Jefferson");
talkEntry:addResponse("Dat be berreh chaotic oomie. He be berreh good and fast wif daggers. Beh careful if ebba see dat oomie.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Jefferson");
talkEntry:addResponse("Das sein sehr chaotisch Ommie, dass beherschen gut und schnell Dolche. Sei vorsichtig wenn du sehen das Ommie.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Kry");
talkEntry:addTrigger("Rack");
talkEntry:addResponse("Dat be sistah ob Orcs ob dah Northern Mountains. Meh nub know whub she doing now!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Kry");
talkEntry:addTrigger("Rack");
talkEntry:addResponse("Das Schwester von Orks von Nordgebierge war. Mich nix wissen was sie nun machen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Slug");
talkEntry:addResponse("Dat bruddah be good warrior and smith for Orcs ob dah Northern Mountains. Meh nub know whub he doing now!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Slug");
talkEntry:addResponse("Das Bruder sein gut Kreiger und Schmied für Orks von Nordgebierge war. Mich nix wissen was er nun machen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("silver skull");
talkEntry:addResponse("Dat be high rank ob dah Orcs ob dah Northern Mountains.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("silver skull");
talkEntry:addResponse("Das sein hoher Rang bei den Orks des Nordgebierge war.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("red skull");
talkEntry:addResponse("Dat be berreh high rank ob dah Orcs ob dah Northern Mountains.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("red skull");
talkEntry:addResponse("Das sein sehr hoher Rang bei den Orks des Nordgebierge war.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gynk fire");
talkEntry:addResponse("Yoo nub know dat fire in bottle? Yoo hab to open and throw it! BOOM! *smirks*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gynk Feuer");
talkEntry:addResponse("Du nix wissen das Feuer in Flasche? Du müssen offnen und werfen es! BAMM! *kichert*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("temple");
talkEntry:addResponse("Dat be collection ob lower races dat whub worship dah Faddah also, but be heresy. Smash dem!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tempel");
talkEntry:addResponse("Das sein Sammlung niedriger Rassen welche preisen Vater auch, aber sein Häresie. Verhau die!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("holy land");
talkEntry:addResponse("Hurr, dah holy land in north in Gobaith. Land be ob orcs ob Northern Mountains");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("heilig land");
talkEntry:addResponse("Hurr, das heilig Land von Norden in Gobaith. Land der Ork von Nordgebierge.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Orc North");
talkEntry:addTrigger("Clan North");
talkEntry:addResponse("Hurr! Orc of the Northern Mountains be mighty Clan in Gobaith wif strong Chief, Warlord, Red Skulls, Silver Skulls an other bruddahs and sistahs.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ork Nord");
talkEntry:addTrigger("Klan Nord");
talkEntry:addTrigger("Clan Nord");
talkEntry:addResponse("Hurr! Ork von Nordgebierge war mächtig Klan in Gobaith mit stark Hauptling, Kriegsherr, Red Skulls, Silver Skulls und ander Bruddha und Sistha!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dwarven army");
talkEntry:addTrigger("dwarf army");
talkEntry:addTrigger("army dwarf");
talkEntry:addTrigger("stumpie army");
talkEntry:addResponse("Dhat be stumpie army from Silverbrand, me remember right.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zwergenarmee");
talkEntry:addResponse("Das Zwergenarme waren von Silberbrand, mich richtig erinnern.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Troll");
talkEntry:addTrigger("Bane");
talkEntry:addResponse("Dat be old oomie town in Gobaith. Long time ago.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Troll");
talkEntry:addTrigger("Bane");
talkEntry:addResponse("Das sein alte Ommie Stadt in Gobaith. Lang Zeit vorbei.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("queen dwarf");
talkEntry:addTrigger("dwarven queen");
talkEntry:addTrigger("stumpie queen");
talkEntry:addResponse("Stumpie queen Friedwulfa become famous as Flying stumpie. Ask dat Stumpie if yoo meet her! *smirks*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("königin zwerg");
talkEntry:addTrigger("zwerg königin");
talkEntry:addTrigger("zwergenkönigin");
talkEntry:addTrigger("stumpiekönigin");
talkEntry:addResponse("Stumpiekönigin Friedwulfa berühmt sein als Fliegende Stumpie. Frag das Stumpie wenn du treffen es! *grinst frech*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("friedl");
talkEntry:addTrigger("Friedwulfa");
talkEntry:addTrigger("Silberklinge");
talkEntry:addResponse("Stumpie queen Friedwulfa become famous as Flying stumpie. Ask dat Stumpie if yoo meet her! *smirks*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("friedl");
talkEntry:addTrigger("Friedwulfa");
talkEntry:addTrigger("Silberklinge");
talkEntry:addResponse("Stumpiekönigin Friedwulfa berühmt sein als Fliegende Stumpie. Frag das Stumpie wenn du treffen es! *grinst frech*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("silverbrand");
talkEntry:addResponse("Dat be Stumpie town in Gobaith wif Stumpie queen whub tink she be able smashing Warlord. *smirks*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("silberbrand");
talkEntry:addResponse("Das sein Stumpiestadt in Gobaih mit Zwergenkönigin die glaubte Warlord besiegen können. *grinst frech*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Tronruk");
talkEntry:addResponse("Yubba, dat mah name! *hits his chest and grunts*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tronruk");
talkEntry:addResponse("Yubba, das mein Name! *schlägt sich auf die Brust*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("Hurr! Hurr!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("Hurr! Hurr!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("#me looks confused 'how yoo can say no?'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("#me schaut verwirrt 'wie du sagen können nein?'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Meh tink it be betta now dat yoo go and annoy someone else.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Mich denken du besser gehen nun und anderen ärgern.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me rülpst.", "#me burps.");
talkingNPC:addCycleText("#me murmelt vor sich her.", "#me mumbles to himself.");
talkingNPC:addCycleText("#me kratzt sich am Hintern.", "#me scratches his ass.");
talkingNPC:addCycleText("Ehre Tag des Hammers!", "Honor Day of Hammer!");
talkingNPC:addCycleText("Ehre Tag des Grünen Knurren!", "Honor Day of Green Growl!");
talkingNPC:addCycleText("Ehre dem Vater!", "Honor dah Faddah!");
talkingNPC:addCycleText("Wer wolla hören Geschicht?", "Who want hear storeh?");
talkingNPC:addCycleText("Mich wissen viele Geschichten von Ehre.", "Me know maneh storeh about honor.");
talkingNPC:addCycleText("#me öffnet seine Augen und schließt sie wieder nach einer Weile.", "#me opens his eyes and closes them again after while.");
talkingNPC:addCycleText("Bringt Ehre der Stadt.", "Bring honor to our town.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(5);
mainNPC:setDefaultLanguage(5);
mainNPC:setLookat("#me sitzt auf einem Stamm und hat den Kopf gesenkt.", "#me is sitting on a log with his head bowed.");
mainNPC:setUseMessage("Alt und zach aber genug fur Welpen!", "Old and tough but strong enub for whelps!");
mainNPC:setConfusedMessage("#me schaut dich verwirrt an.", "#me looks at you confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 363);
mainNPC:setEquipment(11, 196);
mainNPC:setEquipment(5, 0);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 48);
mainNPC:setEquipment(9, 2113);
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
--------------------------------------------------------------------------------
-- NPC Name: Tronruk                                                  Cadomyr --
-- NPC Job:  priest                                                           --
--                                                                            --
-- NPC Race: orc                        NPC Position:  164, 621, 0            --
-- NPC Sex:  male                       NPC Direction: south                  --
--                                                                            --
-- Author:   envi                                                             --
--                                                                            --
-- Last parsing: November 24, 2010                       easyNPC Parser v1.02 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (4, 164, 621, 0, 4, 'Tronruk', 'npc.tronruk', 0, 2, 5, 108, 86, 72, 57, 138, 55);
---]]

require("npc.base.basic")
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
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is an old orc Tronruk. Keyphrases: Hello, story, orc, gods."));
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
talkEntry:addTrigger("Greetings");
talkEntry:addTrigger("Be greeted");
talkEntry:addTrigger("Greet");
talkEntry:addTrigger("Hail");
talkEntry:addTrigger("Good day");
talkEntry:addTrigger("Good morning");
talkEntry:addTrigger("Good evening");
talkEntry:addResponse("#me nods slighty and closes his eyes again.");
talkEntry:addResponse("Hurr? Yubbah, Yubbah.");
talkEntry:addResponse("Grebbha.");
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
talkEntry:addResponse("#me nickt leicht und schließt seine Augen wieder.");
talkEntry:addResponse("Hurr? Yubbah, Yubbah");
talkEntry:addResponse("Grebbha.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greebas");
talkEntry:addTrigger("Greebhas");
talkEntry:addTrigger("Greebs");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("#me nods slighty and closes his eyes again.");
talkEntry:addResponse("Hurr? Yubbah, Yubbah.");
talkEntry:addResponse("Grebbha.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greebas");
talkEntry:addTrigger("Greebhas");
talkEntry:addTrigger("Greebs");
talkEntry:addResponse("#me nickt leicht und schließt seine Augen wieder.");
talkEntry:addResponse("Hurr? Yubbah, Yubbah");
talkEntry:addResponse("Grebbha.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Good bye");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare thee well");
talkEntry:addResponse("Farebrass.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehabt euch wohl");
talkEntry:addResponse("Farebrass.");
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
talkEntry:addResponse("Farebrass.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Farebrass.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("Hurr, meh beh fine.");
talkEntry:addResponse("Tired as usuall");
talkEntry:addResponse("#me scratches his ass.");
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
talkEntry:addTrigger("Tronruk");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Yubba, dhat mina nam! *hits his chest and grunts*");
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
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("Meh hub nubbing.");
talkEntry:addResponse("Meh nub selling sombhing.");
talkEntry:addResponse("Yoo hub to ask broddhas and sisthas ib yoo want buh stuff.");
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
talkEntry:addResponse("Meh nub maneh stories!");
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
talkEntry:addTrigger("story");
talkEntry:addTrigger("stories");
talkEntry:addResponse("Whub old story from old Gobaith yoo want hear? 'The Day of the Hammer' oder 'Day of Green Growl'?");
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
talkEntry:addTrigger("job");
talkEntry:addCondition(npc.base.condition.language.language("english"));
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
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hurr, hurr, Meh remember, yubba. *closes his eyes again*");
talkEntry:addResponse("Dhea beh a clan beh. Berreh mighthe it beh!");
talkEntry:addResponse("Dhat place beh ruled beh by broddhas and sisthas.");
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
talkEntry:addTrigger("I am");
talkEntry:addTrigger("my name");
talkEntry:addResponse("Hurr, hurr!");
talkEntry:addResponse("Guud to know.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ich bin");
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Hurr, hurr!");
talkEntry:addResponse("Gut zu wissen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("why are you sitting");
talkEntry:addResponse("Dhea beh nubbing to do.");
talkEntry:addResponse("Whub nub?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("stumpie");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Berreh stupid dham beh");
talkEntry:addResponse("Shave dham before yoo cook dham.");
talkEntry:addResponse("Hurr, meh remember 'The Day of the Hammer'!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dwarf");
talkEntry:addTrigger("dwarves");
talkEntry:addResponse("Berreh stupid dham beh");
talkEntry:addResponse("Shave dham before yoo cook dham.");
talkEntry:addResponse("Hurr, meh remember 'The Day of the Hammer'!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("elf");
talkEntry:addTrigger("elb");
talkEntry:addTrigger("longear");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Longears hub berreh long ears. Meh nub ona broddha whub collecting dham, but meh nub remember more about him. Onleh broddha hub rank ob 'Red Skull'.");
talkEntry:addResponse("Cut off dhea trees, ib yoo want fun whib dham!*smirks*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hubling");
talkEntry:addTrigger("halfer");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Meh recommend 'stuffed hubling'.");
talkEntry:addResponse("Use dham as slave!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("halfing");
talkEntry:addResponse("Meh recommend 'stuffed hubling'.");
talkEntry:addResponse("Use dham as slave!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("slave");
talkEntry:addResponse("Hublings beh berreh guud slaves.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ommies");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Better nub trust dham!");
talkEntry:addResponse("Meh nub know maneh ob dham.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("human");
talkEntry:addResponse("Better nub trust dham!");
talkEntry:addResponse("Meh nub know maneh ob dham.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ommie town");
talkEntry:addResponse("Maneh ob dham exist. Too maneh ib yoo ask meh!");
talkEntry:addResponse("Hurr, Albar, Gynk or Salkama for exampla.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hurr?");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hurr!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Father");
talkEntry:addResponse("Dha Faddha makes us strong and powerful!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Faddha");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Dha Faddha makes us strong and powerful!");
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
talkEntry:addTrigger("longear");
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
talkEntry:addTrigger("ommies");
talkEntry:addResponse("Besser nix trauen denen!");
talkEntry:addResponse("Mich nix kenna viele.");
talkEntry:addResponse("Dah broddha Jag won ona big tournament in dah big Ommie-town in Gobaith.");
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
talkEntry:addTrigger("Ommie Stadt");
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
talkEntry:addResponse("Hurr! Greenskin beh strong and proud! Praeh to dah Faddha!");
talkEntry:addResponse("Dhat beh dah superior race, yubba!");
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
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addTrigger("archmage");
talkEntry:addTrigger("Erzmagier");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Pahh! Wizzard!.");
talkEntry:addResponse("Meh smash it ib meh see it.");
talkEntry:addResponse("Betta nub meat dhat mage.");
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
talkEntry:addTrigger("Runewick");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Meh heard it smells dhea.");
talkEntry:addResponse("Dheh hub big towers, because dham hum short...yoo know whub meh mean *blinks*.");
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
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Bad Ommie, bad.");
talkEntry:addResponse("Meh like dhat dhat Ommmie hub so many coins. Mahbeh yoo bring meh dhose?");
talkEntry:addResponse("Tricky as all oddha Ommie.");
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
talkEntry:addTrigger("Galmair");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Meh nub like dhat dhea beh so maneh Stumpies here.");
talkEntry:addResponse("Yoo like games, go dhea.");
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
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("königin");
talkEntry:addTrigger("queen");
talkEntry:addTrigger("edwards");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Honoer dhat Ommie hub!.");
talkEntry:addResponse("It beh nice, yubba?.");
talkEntry:addResponse("Best Ommie meh hub ebba met.");
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
talkEntry:addTrigger("Cadomyr");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Nub like a cave, but it beh keh.");
talkEntry:addResponse("Mahbeh weh should start digging bigger hole in mountain.");
talkEntry:addResponse("Smash dah enemeh ob dhat town.");
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
talkEntry:addTrigger("albar");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Betta ask Ommie about dhat Ommie-town.");
talkEntry:addResponse("Meh nub interested in dah Ommie-towns.");
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
talkEntry:addResponse("Eines der großen Reiche.");
talkEntry:addResponse("Wer interessiert sich sohon für diese Stadt?");
talkEntry:addResponse("Ich weiß nicht, ob die zu Bragon beten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("Bragon, Malachin, Zambra and Cherga. But all beh ruled beh dha Faddha!");
talkEntry:addResponse("Oldra for dha spring, Bragon for dha summer, Malachin for dha autumn, and Cherga for dha winter.");
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
talkEntry:addTrigger("Adron");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Daht god beh weak compared to dha Faddha.");
talkEntry:addResponse("#me scratches his ass and shakes his head.");
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
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Meh praeh to dhat god in summer.");
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
talkEntry:addTrigger("Cherga");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Meh praeh to dhat god in winter.");
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
talkEntry:addTrigger("Elara");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Daht god beh weak compared to dha Faddha.");
talkEntry:addResponse("#me scratches his ass and shakes his head.");
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
talkEntry:addTrigger("Eldan");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Daht god beh weak compared to dha Faddha.");
talkEntry:addResponse("#me scratches his ass and shakes his head.");
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
talkEntry:addTrigger("Findari");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Daht god beh weak compared to dha Faddha.");
talkEntry:addResponse("#me scratches his ass and shakes his head.");
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
talkEntry:addTrigger("Irmorom");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Daht god beh weak compared to dha Faddha.");
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
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Meh praeh to dhat god in autumn.");
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
talkEntry:addTrigger("Moshran");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Beh our Faddha who makes us strong.");
talkEntry:addResponse("Better use Faddha for him!");
talkEntry:addResponse("Dha Faddha rules dha World!");
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
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addTrigger("Nargùn");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Daht god beh weak compared to dha Faddha.");
talkEntry:addResponse("#me scratches his ass and shakes his head.");
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
talkEntry:addTrigger("Oldra");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Meh praeh to dhat god in spring.");
talkEntry:addResponse("Oldra beh dah live bringer");
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
talkEntry:addTrigger("Ronagan");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Daht god beh weak compared to dha Faddha.");
talkEntry:addResponse("#me scratches his ass and shakes his head.");
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
talkEntry:addTrigger("Sirani");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Daht god beh weak compared to dha Faddha.");
talkEntry:addResponse("#me scratches his ass and shakes his head.");
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
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Daht god beh weak compared to dha Faddha.");
talkEntry:addResponse("#me scratches his ass and shakes his head.");
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
talkEntry:addTrigger("Ushara");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Daht god beh weak compared to dha Faddha.");
talkEntry:addResponse("#me scratches his ass and shakes his head.");
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
talkEntry:addTrigger("Zhambra");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Zhambra beh dha 'broddha-godness'.");
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
talkEntry:addTrigger("Hammer");
talkEntry:addResponse("Hurrkeh, meh tell yoo dha storeh about dhat day. Say 'yubba' or 'more' ib meh shall tell more and 'stop' ib yoo hub heard enub!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hammer");
talkEntry:addResponse("Hurrkeh, mich erzählen Geschichte über das Tag. Sag 'Yubba' oder 'Weiter' wenn hören wollen mehr, und 'Stop' wenn nix mehr hören wollen!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addTrigger("more");
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 1));
talkEntry:addResponse("Meh tell dha story as dha Warlord once did. *His voice becomes deeper and horasely* Brothers and sisters, rejoice! Today, history was written!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addTrigger("Weiter");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 1));
talkEntry:addResponse("Mich erzählen Geschichte wie Kriegsherr eins tat. *Seine Stimme wird tiefer und heiser* Büder und Schwester, jubelt! Heute, Geschichte wurde geschrieben!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Meh tell dha story as dha Warlord once did. *his voice becomes deeper and horasely* Brothers and sisters, rejoice! Today, history was written!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 1));
talkEntry:addResponse("Mich erzählen Geschichte wie Kriegsherr eins tat. *Seine Stimme wird tiefer und heiser* Büder und Schwester, jubelt! Heute, Geschichte wurde geschrieben!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addCondition(npc.base.condition.quest.quest(1, "=", 1));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addTrigger("Nix");
talkEntry:addTrigger("Aufhören");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 1));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 1));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addTrigger("more");
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 2));
talkEntry:addResponse("When the Warlord was about to enter the human city Trolls Bane after the meeting with the chief, he ran into the dwarven army, led by the queen herself!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addTrigger("Weiter");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 2));
talkEntry:addResponse("Als der Kriegsherr die Menschenstadt Trolls Bane betretten wollte nach einem Treffen mit dem Häuptling, er lief in eine Zwergenarmee, angeführt von der Königin ihrerselbst!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("When the Warlord was about to enter the human city after the meeting with the chief, he ran into the dwarven army, led by the queen herself!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 2));
talkEntry:addResponse("Als der Kriegsherr die Menschenstadt betretten wollte nach einem Treffen mit dem Häuptling, er lief in eine Zwergenarmee, angeführt von der Königin ihrerselbst!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 2));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addTrigger("Nix");
talkEntry:addTrigger("Aufhören");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 2));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 2));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addTrigger("more");
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 3));
talkEntry:addResponse("They thought that I, the Warlord, is an easy target for them!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addTrigger("Weiter");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 3));
talkEntry:addResponse("Die dachten, dass ich, der Kriegsherr sei ein einfaches Ziel für sie!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 3));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("They thought that I, the Warlord, is an easy target for them!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 3));
talkEntry:addResponse("Die dachten, dass ich, der Kriegsherr sei ein einfaches Ziel für sie!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 3));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addTrigger("Nix");
talkEntry:addTrigger("Aufhören");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 3));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 3));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 3));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addTrigger("more");
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 4));
talkEntry:addResponse("I stood my ground to their insults and when they were just about to attack, Taliss, our allied lizard friend, appeared from the back and stood by my side!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addTrigger("Weiter");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 4));
talkEntry:addResponse("Ich stand wie ein Fels in der Brandung gegen ihre Beleidigungne und als sie mich angriffen, Taliss, unser verbündete Echsenfreund erschien von hinten und stand an meiner Seite!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I stood my ground to their insults and when they were just about to attack, Taliss, our allied lizard friend, appeared from the back and stood by my side!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 4));
talkEntry:addResponse("Ich stand wie ein Fels in der Brandung gegen ihre Beleidigungne und als sie mich angriffen, Taliss, unser verbündete Echsenfreund erschien von hinten und stand an meiner Seite!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 4));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addTrigger("Nix");
talkEntry:addTrigger("Aufhören");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 4));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 4));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addTrigger("more");
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 5));
talkEntry:addResponse("Toghether we fought like bothers, slashing trough dwarves like a hot knife trough butter!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addTrigger("Weiter");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 5));
talkEntry:addResponse("Zusammen kämpften wir wie Brüder, schnitten durch die Zwerge wie ein heißes Messer durch Butter!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 5));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Toghether we fought like bothers, slashing trough dwarves like a hot knife trough butter!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 5));
talkEntry:addResponse("Zusammen kämpften wir wie Brüder, schnitten durch die Zwerge wie ein heißes Messer durch Butter!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 5));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addTrigger("Nix");
talkEntry:addTrigger("Aufhören");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 5));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 5));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 5));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addTrigger("more");
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 6));
talkEntry:addResponse("The queen herself started running arround like a scared pig sent to slaughter.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addTrigger("Weiter");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 6));
talkEntry:addResponse("Die Königin sleber began herum zu laufen wie ein erschrockenes Scwein welches zur Schlachtbank geführt wird.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 6));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("The queen herself started running arround like a scared pig sent to slaughter and even though the dwarves used fierly, magic weapons that nearly sent me to the grave, they soon fell and drowned into their own pool of blood!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 6));
talkEntry:addResponse("Die Königin sleber began herum zu laufen wie ein erschrockenes Scwein welches zur Schlachtbank geführt wird.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 6));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addTrigger("Nix");
talkEntry:addTrigger("Aufhören");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 6));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 6));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 6));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addTrigger("more");
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 7));
talkEntry:addResponse("And even though the dwarves used fierily, magic weapons that nearly sent me to the grave, they soon fell and drowned into their own pool of blood!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addTrigger("Weiter");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 7));
talkEntry:addResponse("Und obwohl die Zwerge feurige, magische Waffen benützten, welche mich beinahe ins Grab beförderten, schon bald fielen sie in ihr eigenes Becken von Blut!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 7));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("And even though the dwarves used fierly, magic weapons that nearly sent me to the grave, they soon fell and drowned into their own pool of blood!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 7));
talkEntry:addResponse("Und obwohl die Zwerge feurige, magische Waffen benützten, welche mich beinahe ins Grab beförderten, schon bald fielen sie in ihr eigenes Becken von Blut!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 7));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addTrigger("Nix");
talkEntry:addTrigger("Aufhören");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 7));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 7));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 7));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addTrigger("more");
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 8));
talkEntry:addResponse("The queen dragged herself to the cross, where, me, Taliss and the human Tirrend, tied the queen up and dragged her all the way to the cave, shoving her into the jail! *He grins mischievous.*");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addTrigger("Weiter");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 8));
talkEntry:addResponse("Die Königin schleppte sich zum Kreuz, wo ich, Taliss und der Mensch Tirrend sie fesselten und den ganzen Weg zur Höhle schleppten und sie ins Gefängnis worfen! *Er grinst boshaft.*");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 8));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("The queen dragged herself to the cross, where, me, Taliss and the human Tirrend, tied the queen up and dragged her all the way to the cave, shoving her into the jail! *He grins mischievous.*");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 8));
talkEntry:addResponse("Die Königin schleppte sich zum Kreuz, wo ich, Taliss und der Mensch Tirrend sie fesselten und den ganzen Weg zur Höhle schleppten und sie ins Gefängnis worfen! *Er grinst boshaft.*");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 8));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addTrigger("Nix");
talkEntry:addTrigger("Aufhören");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 8));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 8));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 8));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addTrigger("more");
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 9));
talkEntry:addResponse("Brothers, rejoice! We have captured the queen! Now she will face the trial of the orcs, she will face our anger!...Yubba, it happened. Dham throw her from dah holy mountain!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addTrigger("Weiter");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 9));
talkEntry:addResponse("Brüder, jubelt! Wir haben die Königin gefangen genommen! Nun wird sie dem Gericht der Orks entgegentreten, Sie wird all unserer Wut entgegentreten!...Yubba, es geschah. Sie wurfen sie von heiligen Berg!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 9));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Brothers, rejoice! We have captured the queen! Now she will face the trial of the orcs, she will face our anger!...Yubba, it happened. Dham throw her from dah holy mountain!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 9));
talkEntry:addResponse("Brüder, jubelt! Wir haben die Königin gefangen genommen! Nun wird sie dem Gericht der Orks entgegentreten, Sie wird all unserer Wut entgegentreten!...Yubba, es geschah. Sie wurfen sie von heiligen Berg!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 9));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addTrigger("Nix");
talkEntry:addTrigger("Aufhören");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 9));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 9));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 9));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addTrigger("more");
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 10));
talkEntry:addResponse("Let this be known as the Day of the Hammer! The day when the dwarf army got crushed under the feet of those that fought for honor! *He closes the eyes after he has finished.*");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addTrigger("Weiter");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 10));
talkEntry:addResponse("Lasst diesen Tag als Tag des Hammer in Erinnerung halten! Der Tag an dem die Zwergenarme wurde zerschmettert und den Füssen von jenen die für Ehre kämpfen! *Er schließt die Augen nachdem er fertig ist.*");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 10));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Let this be known as the Day of the Hammer! , the day when the dwarf army got crushed under the feet of those that fought for honor! *He closes the eyes after he has finished.*");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 10));
talkEntry:addResponse("Lasst diesen Tag als Tag des Hammer in Erinnerung halten! Der Tag an dem die Zwergenarme wurde zerschmettert und den Füssen von jenen die für Ehre kämpfen! *Er schließt die Augen nachdem er fertig ist.*");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 10));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addTrigger("Nix");
talkEntry:addTrigger("Aufhören");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 10));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 10));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 10));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Growl");
talkEntry:addResponse("Meh tell dha story as dha Chief once did. Say 'yubba' or 'more' ib meh shall tell more and 'stop' ib yoo hub heard enub! *His voice becomes deeper and horasely* Bruddahs and sistahs!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 11));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Knurren");
talkEntry:addResponse("Mich erzählen Geschichte wie Häuptling eins tat. Sag 'Yubba' oder 'Weiter' wenn hören wollen mehr, und 'Stop' wenn nix mehr hören wollen! *Seine Stimme wird tiefer und heiser* Büder und Schwester!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 11));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addTrigger("more");
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 11));
talkEntry:addResponse("Once again da Orcs hab shown deir superior strength! Da 24. Elos ob da year 30 shall beh know as da Day ob Green Growl!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addTrigger("Weiter");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 11));
talkEntry:addResponse("Einmal mehr haben die Orks ihre übermächtige Stärke gezeigt! Der 24. Elos im Jahre 30 soll für immer als der Tag des Grünen Knurren in Erinnerung bleiben!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 11));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Once again da Orcs hab shown deir superior strength! Da 24. Elos ob da year 30 shall beh know as da Day ob Green Growl!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 11));
talkEntry:addResponse("Einmal mehr haben die Orks ihre übermächtige Stärke gezeigt! Der 24. Elos im Jahre 30 soll für immer als der Tag des Grünen Knurren in Erinnerung bleiben!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 11));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addTrigger("Nix");
talkEntry:addTrigger("Aufhören");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 11));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 11));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 11));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addTrigger("more");
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 12));
talkEntry:addResponse("Dese Orcs ob da Horde wus dere: Silver Skull Murgo, Red Skull Jag, Sistah Kry`Rack, Bruddah Slug, Chief Rugh'toh.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addTrigger("Weiter");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 12));
talkEntry:addResponse("Diese Orks der Horde waren dort: Silver Skull Murgo, Red Skull Jag, Sistah Kry`Rack, Bruddah Slug, Chief Rugh'toh.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 12));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Dese Orcs ob da Horde wus dere: Silver Skull Murgo,Red Skull Jag, Sistah Kry`Rack, Bruddah Slug, Chief Rugh'toh.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 12));
talkEntry:addResponse("Diese Orks der Horde waren dort: Silver Skull Murgo, Red Skull Jag, Sistah Kry`Rack, Bruddah Slug, Chief Rugh'toh.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 2));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addTrigger("Nix");
talkEntry:addTrigger("Aufhören");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 12));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 12));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 12));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addTrigger("more");
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 13));
talkEntry:addResponse("Due to our deep faith in da Father we mastered da fighting tournament organised by da Prince ob oomie town Trolls Bane AND we smashed da oomies ob da Temple!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addTrigger("Weiter");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 13));
talkEntry:addResponse("Danke unserem tiefen Glauben an den Vater wir meisterten es das von Prinzen der Menschen in Menschenstadt Trolls Bane organisierte Turnier zu gewinnen UND die Menschen des Tempel nieder zu schlagen!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 13));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Due to our deep faith in da Father we mastered da fighting tournament organised by da Prince ob oomie town AND we smashed da oomies ob da Temple!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 13));
talkEntry:addResponse("Danke unserem tiefen Glauben an den Vater wir meisterten es das von Prinzen der Menschen organisierte Turnier zu gewinnen UND die Menschen des Tempel nieder zu schlagen!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 13));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addTrigger("Nix");
talkEntry:addTrigger("Aufhören");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 13));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 13));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 13));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addTrigger("more");
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 14));
talkEntry:addResponse("Hurr, meh remember dhat storeh hub two parts. Dha 'Tournament' and dha 'Aftermath'. Whub ona yoo want hear?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addTrigger("Weiter");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 14));
talkEntry:addResponse("Hurr, mich erinnern dies Geschichte haben zwei Teile. 'Turnier' und 'Nachspiel'. Welche du wollen hören?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 14));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hurr, meh remember dhat storeh hub two parts. Dha 'Tournament' and dha 'Aftermath'. Whub ona yoo want hear?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 14));
talkEntry:addResponse("Hurr, mich erinnern dies Geschichte haben zwei Teile. 'Turnier' und 'Nachspiel'. Welche du wollen hören?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 14));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addTrigger("Nix");
talkEntry:addTrigger("Aufhören");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 14));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 14));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 14));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tournament");
talkEntry:addResponse("Hurrkeh, meh tell yoo dha storeh about dhat day. Say 'yubba' or 'more' ib meh shall tell more and 'stop' ib yoo hub heard enub!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 21));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Turnier");
talkEntry:addResponse("Hurrkeh, mich erzählen Geschichte über das Tag. Sag 'Yubba' oder 'Weiter' wenn hören wollen mehr, und 'Stop' wenn nix mehr hören wollen!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 21));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tournament");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 15));
talkEntry:addResponse("Hurrkeh, meh tell yoo dha storeh about dhat day. Say 'yubba' or 'more' ib meh shall tell more and 'stop' ib yoo hub heard enub!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 21));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Turnier");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 15));
talkEntry:addResponse("Hurrkeh, mich erzählen Geschichte über das Tag. Sag 'Yubba' oder 'Weiter' wenn hören wollen mehr, und 'Stop' wenn nix mehr hören wollen!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 21));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Aftermath");
talkEntry:addResponse("Hurrkeh, meh tell yoo dha storeh about dhat day. Say 'yubba' or 'more' ib meh shall tell more and 'stop' ib yoo hub heard enub!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 31));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nachspiel");
talkEntry:addResponse("Hurrkeh, mich erzählen Geschichte über das Tag. Sag 'Yubba' oder 'Weiter' wenn hören wollen mehr, und 'Stop' wenn nix mehr hören wollen!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 31));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Aftermath");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 15));
talkEntry:addResponse("Hurrkeh, meh tell yoo dha storeh about dhat day. Say 'yubba' or 'more' ib meh shall tell more and 'stop' ib yoo hub heard enub!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 31));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nachspiel");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 15));
talkEntry:addResponse("Hurrkeh, mich erzählen Geschichte über das Tag. Sag 'Yubba' oder 'Weiter' wenn hören wollen mehr, und 'Stop' wenn nix mehr hören wollen!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 31));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addTrigger("more");
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 21));
talkEntry:addResponse("First rounds ob three. Da smelly oomies tried to betray us! In da very first fight dey let fight Murgo gainst Jag! By doing so dey could get rid ob one orcs quite soon!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addTrigger("Weiter");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 21));
talkEntry:addResponse("Erste Runde von Drei. Stinkende Ommies versuchen uns betrügen! In aller ersten Kampf die lassen kämpfen Murgo gegen Jag! Bei tuen so die konnten los werden einen von sehr schnell!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 21));
talkEntry:addResponse("First rounds ob three. Da smelly oomies tried to betray us! In da very first fight dey let fight Murgo gainst Jag! By doing so dey could get rid ob one orcs quite soon!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 21));
talkEntry:addResponse("Erste Runde von Drei. Stinkende Ommies versuchen uns betrügen! In aller ersten Kampf die lassen kämpfen Murgo gegen Jag! Bei tuen so die konnten los werden einen von sehr schnell!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 21));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addTrigger("Nix");
talkEntry:addTrigger("Aufhören");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 21));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 21));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 21));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addTrigger("more");
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 22));
talkEntry:addResponse("In a great battle Jag succeeded ober Murgo. But dis smelly decision to let Orcs fight gainst each other in first round made da Horde angry!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addTrigger("Weiter");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 22));
talkEntry:addResponse("In großen Schlacht Jag bestand gegen Murgo. Aber stinkende Entscheidung zu lassne Orks kämpfen gegeneinander in erster Runde  machte Horde böse!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 22));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("In a great battle Jag succeeded ober Murgo. But dis smelly decision to let Orcs fight gainst each other in first round made da Horde angry!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 22));
talkEntry:addResponse("In großen Schlacht Jag bestand gegen Murgo. Aber stinkende Entscheidung zu lassne Orks kämpfen gegeneinander in erster Runde  machte Horde böse!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 22));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addTrigger("Nix");
talkEntry:addTrigger("Aufhören");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 22));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 22));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 22));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addTrigger("more");
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 23));
talkEntry:addResponse("In da first round da Chief got a weak halfer to smash. Da most difficult ting wus nub to kill da halfer wit heavy blow since it wus gauinst da rules.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addTrigger("Weiter");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 23));
talkEntry:addResponse("In erster Runde Chief bekam schwachen Halbing zu schlagen. Meist schwerste Ding war nicht zu töten Halbing mit schweren Schlag weil gegen Regeln.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 23));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("In da first round da Chief got a weak halfer to smash. Da most difficult ting wus nub to kill da halfer wit heavy blow since it wus gauinst da rules.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 23));
talkEntry:addResponse("In erster Runde Chief bekam schwachen Halbing zu schlagen. Meist schwerste Ding war nicht zu töten Halbing mit schweren Schlag weil gegen Regeln.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 23));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addTrigger("Nix");
talkEntry:addTrigger("Aufhören");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 23));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 23));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 23));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addTrigger("more");
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 24));
talkEntry:addResponse("Second rounds. In second round bruddah Jag fought gainst a brave oomie and won in gud fight! Da Chief had to fight da oomie Don Andrews. Usually an easy task, though, on dis day da Father decided to test da faith ob Orcs.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addTrigger("Weiter");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 24));
talkEntry:addResponse("Zweit Runde. In zweit Runde Bruder Jag kämpft gegen tapfer Ommie und gewann in guter Kampf! Chief haben kämpfen müssen gegen Ommie Don Andrews. Normalerweise leichte Aufgabe, aber diesen Tag Vater entschied zu testen Glauben von Orks.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 24));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Second rounds. In second round bruddah Jag fought gainst a brave oomie and won in gud fight! Da Chief had to fight da oomie Don Andrews. Usually an easy task, though, on dis day da Father decided to test da faith ob Orcs.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 24));
talkEntry:addResponse("Zweit Runde. In zweit Runde Bruder Jag kämpfte gegen taper Ommie und gewann in guter Kampf! Chief haben kämpfen müssen gegen Ommie Don Andrews. Normalerweise leichte Aufgabe, aber diesen Tag Vater entschied zu testen Glauben von Orks.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 24));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addTrigger("Nix");
talkEntry:addTrigger("Aufhören");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 24));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 24));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 24));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addTrigger("more");
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 25));
talkEntry:addResponse("In da middle ob da fight smelly Don made a lucky slash and broke da armor ob da Chief on da legs. The Chief stumbled a bit and almost fell into the water.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addTrigger("Weiter");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 25));
talkEntry:addResponse("In Mitte von Kampf stinkender Don machte glücklichen Schlag und zerbrach Rüstung von Chief auf Bein. Chief schwankte ein wenig und stürzte fast in Wasser.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 25));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("In da middle ob da fight smelly Don made a lucky slash and broke da armor ob da Chief on da legs. The Chief stumbled a bit and almost fell into the water.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 25));
talkEntry:addResponse("In Mitte von Kampf stinkender Don machte glücklichen Schlag und zerbrach Rüstung von Chief auf Bein. Chief schwankte ein wenig und stürzte fast in Wasser.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 25));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addTrigger("Nix");
talkEntry:addTrigger("Aufhören");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 25));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 25));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 25));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addTrigger("more");
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 26));
talkEntry:addResponse("By having lost his stance the Chief got more hard blows and finally lost the fight against Don. Orcs wus shocked and seeked for bloody revenge.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addTrigger("Weiter");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 26));
talkEntry:addResponse("Durch verlorenes Gleichgeweicht Chief steckte ein mehr harte Schläge und verlor schlußendlich Kampf gegen Don. Orks waren geschockt und suchten nach blutiger Rache.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 26));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("By having lost his stance the Chief got more hard blows and finally lost the fight against Don. Orcs wus shocked and seeked for bloody revenge.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 26));
talkEntry:addResponse("Durch verlorenes Gleichgeweicht Chief steckte ein mehr harte Schläge und verlor schlußendlich Kampf gegen Don. Orks waren geschockt und suchten nach blutiger Rache.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 26));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addTrigger("Nix");
talkEntry:addTrigger("Aufhören");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 26));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 26));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 26));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addTrigger("more");
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 27));
talkEntry:addResponse("Final rounds. The Chief had to fight against a oomie warrior. Due to his anger it wus quick and blood fight. The Chief made the third rank. In very final round, bruddah Jag fought against Don. Da oomie used his swords, Jag his powerful maces.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addTrigger("Weiter");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 27));
talkEntry:addResponse("Endrund. Chief musste kämpfen gegen Ommie Krieger. Aufgrund den Ärger es war kurz und blutig Kampf. Chief machte dritten Rang. In finaler Runde, Bruder Jag kampfte gegen Don. Ommie verwendete sein Schwerter, Jag seine mächtig Streitkolben.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 27));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Final rounds. The Chief had to fight against a oomie warrior. Due to his anger it wus quick and blood fight. The Chief made the third rank. In very final round, bruddah Jag fought against Don. Da oomie used his swords, Jag his powerful maces.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 27));
talkEntry:addResponse("Endrund. Chief musste kämpfen gegen Ommie Krieger. Aufgrund den Ärger es war kurz und blutig Kampf. Chief machte dritten Rang. In finaler Runde, Bruder Jag kampfte gegen Don. Ommie verwendete sein Schwerter, Jag seine mächtig Streitkolben.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 27));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addTrigger("Nix");
talkEntry:addTrigger("Aufhören");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 27));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 27));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 27));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addTrigger("more");
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 28));
talkEntry:addResponse("In a long fight they slashed for each other with such strength and speed dat one hardly could see deir weapons. Ib one ob deir blows whub hab missed and hit da wooden arena ground, dey certainly whub hab fell into water.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addTrigger("Weiter");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 28));
talkEntry:addResponse("In langer Kampf die schlugen sich mit solch Stärke und Schnelligkeit, dass kaum zu sehen war Waffen. Wenn einer Schlag daneben gesetzt und Holzbühne getroffen hätte, die würden gefallen in Wasser.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 28));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("In a long fight they slashed for each other with such strength and speed dat one hardly could see deir weapons. Ib one ob deir blows whub hab missed and hit da wooden arena ground, dey certainly whub hab fell into water.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 28));
talkEntry:addResponse("In langer Kampf die schlugen sich mit solch Stärke und Schnelligkeit, dass kaum zu sehen war Waffen. Wenn einer Schlag daneben gesetzt und Holzbühne getroffen hätte, die würden gefallen in Wasser.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 28));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addTrigger("Nix");
talkEntry:addTrigger("Aufhören");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 28));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 28));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 28));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addTrigger("more");
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 29));
talkEntry:addResponse("When it seemed dat Jag whub loose, da Orcs at da tribune shouted louder, growled and grunted from the side of the Arena. Jag heard that, felt the spirit ob da Father and did two sudden blows with his maces - Don was done!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addTrigger("Weiter");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 29));
talkEntry:addResponse("Wenn scheinen dass Jag verlieren, Orks neben Bühne brüllten lauter, knurrten und grunzten von Seite von Arena. Jag hörte das, spürte Geist von Vater und machte zwei schnell Schlag mit Streitkolben - Don war fertig!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 29));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("When it seemed dat Jag whub loose, da Orcs at da tribune shouted louder, growled and grunted from the side of the Arena. Jag heard that, felt the spirit ob da Father and did two sudden blows with his maces - Don was done!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 29));
talkEntry:addResponse("Wenn scheinen dass Jag verlieren, Orks neben Bühne brüllten lauter, knurrten und grunzten von Seite von Arena. Jag hörte das, spürte Geist von Vater und machte zwei schnell Schlag mit Streitkolben - Don war fertig!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 29));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addTrigger("Nix");
talkEntry:addTrigger("Aufhören");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 29));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 29));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 29));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addTrigger("more");
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 30));
talkEntry:addResponse("Da Orcs became da glory winners ob da tournament!...yoo want hear dah rest ob dha gloreh day nuw?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addTrigger("Weiter");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 30));
talkEntry:addResponse("Orks wurden glorreich Sieger von Turnier!...du wollen hören Rest von glorreich Tag nun?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 30));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Da Orcs became da glory winners ob da tournament!...yoo want hear dah rest ob dha gloreh day nuw?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 30));
talkEntry:addResponse("Orks wurden glorreich Sieger von Turnier!...du wollen hören Rest von glorreich Tag nun?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 30));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addTrigger("Nix");
talkEntry:addTrigger("Aufhören");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 30));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 30));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 30));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addTrigger("more");
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 31));
talkEntry:addResponse("Naturally, after da tournament maneh othurr warriors wunted to test their weakness against da mighty Orcs. Jag and da Chief smashed dem all, one after da other.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addTrigger("Weiter");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 31));
talkEntry:addResponse("Natürlich nach Turnier viel andere Krieger wollten testen ihre Schwäche gegen mächtig Orks. Jag und Chief schlugen alle, einen nach anderen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 31));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Naturally, after da tournament maneh othurr warriors wunted to test their weakness against da mighty Orcs. Jag and da Chief smashed dem all, one after da other.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 31));
talkEntry:addResponse("Natürlich nach Turnier viel andere Krieger wollten testen ihre Schwäche gegen mächtig Orks. Jag und Chief schlugen alle, einen nach anderen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 31));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addTrigger("Nix");
talkEntry:addTrigger("Aufhören");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 31));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 31));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 31));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addTrigger("more");
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 32));
talkEntry:addResponse("One ob da opponents wus da oomie Gerron Lavence. Da Chief recognized him immediately: It wus one ob da Temple memburs who once broke da law and entered da holy lands ob da Father without permission.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addTrigger("Weiter");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 32));
talkEntry:addResponse("Ein Gegner war Ommie Gerron Lavence. Chief erkannte sofort: Es waren einer von Tempel Mitglieder wo einmal brachen Gesetz und betraten heilig Land von Vater ohne Erlaubnis.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 32));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("One ob da opponents wus da oomie Gerron Lavence. Da Chief recognized him immediately: It wus one ob da Temple memburs who once broke da law and entered da holy lands ob da Father without permission.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 32));
talkEntry:addResponse("Ein Gegner war Ommie Gerron Lavence. Chief erkannte sofort: Es waren einer von Tempel Mitglieder wo einmal brachen Gesetz und betraten heilig Land von Vater ohne Erlaubnis.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 32));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addTrigger("Nix");
talkEntry:addTrigger("Aufhören");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 32));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 32));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 32));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addTrigger("more");
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 33));
talkEntry:addResponse("Eben worse, he dared to attack da Orcs who wunted make him go and also smashed da Chief wit help ob a mage.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addTrigger("Weiter");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 33));
talkEntry:addResponse("Viel schlimmer, er traute angreifen Orks die wollten vertreiben ihn und auch schlagen Chief mit Hilfe von Zauberer.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 33));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Eben worse, he dared to attack da Orcs who wunted make him go and also smashed da Chief wit help ob a mage.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 33));
talkEntry:addResponse("Viel schlimmer, er traute angreifen Orks die wollten vertreiben ihn und auch schlagen Chief mit Hilfe von Zauberer.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 33));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addTrigger("Nix");
talkEntry:addTrigger("Aufhören");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 33));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 33));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 33));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addTrigger("more");
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 34));
talkEntry:addResponse("Habing dat in da mind ob da smart Chief, he called for all his brother and sisters available. Da Horde surrounded da oomie Gerron and blocked da gate.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addTrigger("Weiter");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 34));
talkEntry:addResponse("Haben das in Erinnerung von schlauer Chief, er ruffen alle Brüder und Schwester erreichbar. Horde umkesselte Ommie Gerron und blockiert Tor.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 34));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Habing dat in da mind ob da smart Chief, he called for all his brother and sisters available. Da Horde surrounded da oomie Gerrun and blocked da gate.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 34));
talkEntry:addResponse("Haben das in Erinnerung von schlauer Chief, er ruffen alle Brüder und Schwester erreichbar. Horde umkesselte Ommie Gerron und blockiert Tor.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 34));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addTrigger("Nix");
talkEntry:addTrigger("Aufhören");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 34));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 34));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 34));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addTrigger("more");
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 35));
talkEntry:addResponse("Orcs wus angry. Orcs hab fought all day. Orcs wus hungry for revenge. Den da slaughtering began.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addTrigger("Weiter");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 35));
talkEntry:addResponse("Orks war wütend. Orks haben gekämpft ganz Tag. Orks war hungrig nach Rache. Dann Gemetzel begonnen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 35));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Orcs wus angry. Orcs hab fought all day. Orcs wus hungry for revenge. Den da slaughtering began.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 35));
talkEntry:addResponse("Orks war wütend. Orks haben gekämpft ganz Tag. Orks war hungrig nach Rache. Dann Gemetzel begonnen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 35));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addTrigger("Nix");
talkEntry:addTrigger("Aufhören");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 35));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 35));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 35));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addTrigger("more");
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 36));
talkEntry:addResponse("Coward Gerron began to flee after few slashes, but da Horde chased him, blocked the way many times. Then a lizurd intervened and helped da oomie Gerron to reach the gates.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addTrigger("Weiter");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 36));
talkEntry:addResponse("Feigling Gerron beginnen fliehen nach wenig Schläge, aber Horde jagd ihn, blockiert Weg viel mal. Dann Echse griff ein und helfen Ommie Gerron zu erreichen Tor.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 36));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Coward Gerrun began to flee after few slashes, but da Horde chased him, blocked the way many times. Then a lizurd intervened and helped da oomie Gerrun to reach the gates.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 36));
talkEntry:addResponse("Feigling Gerron beginnen fliehen nach wenig Schläge, aber Horde jagd ihn, blockiert Weg viel mal. Dann Echse griff ein und helfen Ommie Gerron zu erreichen Tor.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 36));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addTrigger("Nix");
talkEntry:addTrigger("Aufhören");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 36));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 36));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 36));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addTrigger("more");
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 37));
talkEntry:addResponse("Smart and mighty bruddah Jag saw da oomie might be able to flee and threw a Gynk fire for da oomie. Da explosion wus loud, da fire bright and hot. When oomie Gerrun fell to his knees, being nutting but a flaming oomie, his end wus sealed.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addTrigger("Weiter");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 37));
talkEntry:addResponse("Schlau und mächtig Bruder Jag sah Ommie können fähig sein fliehen und warf Gynk Feuer nach Ommie. Explosion war laut, Feuer hell und heiß. Wenn Ommie stürzen zu Knie, nix sein außer flammiger Ommie, sein Ende besiegelt.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 37));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Smart and mighty bruddah Jag saw da oomie might be able to flee and threw a Gynk fire for da oomie. Da explosion wus loud, da fire bright and hot. When oomie Gerrun fell to his knees, being nutting but a flaming oomie, his end wus sealed.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 37));
talkEntry:addResponse("Schlau und mächtig Bruder Jag sah Ommie können fähig sein fliehen und warf Gynk Feuer nach Ommie. Explosion war laut, Feuer hell und heiß. Wenn Ommie stürzen zu Knie, nix sein außer flammiger Ommie, sein Ende besiegelt.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 37));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addTrigger("Nix");
talkEntry:addTrigger("Aufhören");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 37));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 37));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 37));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addTrigger("more");
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 38));
talkEntry:addResponse("His gods might hab welcomed his fould soul on da othurr side. Though, da fight nub wus ober yet.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addTrigger("Weiter");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 38));
talkEntry:addResponse("Sein Gott mögen willkommen nehmen sein faule Seele auf anderer Seite. Denoch Kampf nicht vorbei nun.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 38));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("His gods might hab welcomed his fould soul on da othurr side. Though, da fight nub wus ober yet.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 38));
talkEntry:addResponse("Sein Gott mögen willkommen nehmen sein faule Seele auf anderer Seite. Denoch Kampf nicht vorbei nun.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 38));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addTrigger("Nix");
talkEntry:addTrigger("Aufhören");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 38));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 38));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 38));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addTrigger("more");
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 39));
talkEntry:addResponse("Da lizurd still attacked da Orcs as well as an oomie called Jefferson. Da Orcs formed up again and slashed one ob dem after da other!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addTrigger("Weiter");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 39));
talkEntry:addResponse("Echse weiter angreifen wie auch Ommie mit namen Jefferson. Orks formen noch einmal und schlugen einen nach anderen bis fallen nach anderen!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 39));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Da lizurd still attacked da Orcs as well as an oomie called Jefferson. Da Orcs formed up again and slashed one ob dem after da other!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 39));
talkEntry:addResponse("Echse weiter angreifen wie auch Ommie mit namen Jefferson. Orks formen noch einmal und schlugen einen nach anderen bis fallen nach anderen!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 39));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addTrigger("Nix");
talkEntry:addTrigger("Aufhören");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 39));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 39));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 39));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addTrigger("more");
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 40));
talkEntry:addResponse("In da end ob battle da victorious Orcs stood alone on da Arena in da blood ob da oomies. Though, oomies nub whub beh oomies and da Temple nub whub beh da Temple ib dey nub beh very stoopid!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addTrigger("Weiter");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 40));
talkEntry:addResponse("In Ende von Schlacht siegreich Orks stehen alleine in Arena in Blut von Ommies. Doch Ommies nix sein Ommies und Tempel nix sein Tempel wenn die nix sein sehr dumm!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 40));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("In da end ob battle da victorious Orcs stood alone on da Arena in da blood ob da oomies. Though, oomies nub whub beh oomies and da Temple nub whub beh da Temple ib dey nub beh very stoopid!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 40));
talkEntry:addResponse("In Ende von Schlacht siegreich Orks stehen alleine in Arena in Blut von Ommies. Doch Ommies nix sein Ommies und Tempel nix sein Tempel wenn die nix sein sehr dumm!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 40));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addTrigger("Nix");
talkEntry:addTrigger("Aufhören");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 40));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 40));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 40));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addTrigger("more");
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 41));
talkEntry:addResponse("So dey came back and wunted to fight da Orcs. But Orcs beh smart! We had our victory on dat day and left da oomie town. We returned to holy lands into our cave.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addTrigger("Weiter");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 41));
talkEntry:addResponse("So die kommen zurück und wollen kämpfen gegen Orks. Aber Orks schlau! Wir haben unser Sieg am Tag und verlassen Ommie Stadt. Wir zurück zu heilig Land in unser Höhle.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 41));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("So dey came back and wunted to fight da Orcs. But Orcs beh smart! We had our victory on dat day and left da oomie town. We returned to holy lands into our cave.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 41));
talkEntry:addResponse("So die kommen zurück und wollen kämpfen gegen Orks. Aber Orks schlau! Wir haben unser Sieg am Tag und verlassen Ommie Stadt. Wir zurück zu heilig Land in unser Höhle.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 41));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addTrigger("Nix");
talkEntry:addTrigger("Aufhören");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 41));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 41));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 41));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addTrigger("more");
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 42));
talkEntry:addResponse("Nub much later da oomies ob da Temple came to Orc gates and wunted us to get out. We knew dat dat wus trap. We knew dat Father whub judge dem fer entering Orc lands once again.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addTrigger("Weiter");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 42));
talkEntry:addResponse("Nix viel später Ommies von Tempel kommen zu Ork Tor und wollen uns raus kommen. Wir wissen das sein Falle. Wir wissen das Vater werden richten die für betreten Ork Land wieder.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 42));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Nub much later da oomies ob da Temple came to Orc gates and wunted us to get out. We knew dat dat wus trap. We knew dat Father whub judge dem fer entering Orc lands once again.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 42));
talkEntry:addResponse("Nix viel später Ommies von Tempel kommen zu Ork Tor und wollen uns raus kommen. Wir wissen das sein Falle. Wir wissen das Vater werden richten die für betreten Ork Land wieder.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 42));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addTrigger("Nix");
talkEntry:addTrigger("Aufhören");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 42));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 42));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 42));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addTrigger("more");
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 43));
talkEntry:addResponse("So we made jokes ob dem and let dem rot in front ob our gates under day eyes ob our brave gate guard.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addTrigger("Weiter");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 43));
talkEntry:addResponse("So wir machen Witze über die und lassen die verrotten vor unser Tor unter Auge unser tapfer Torwache.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 43));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("So we made jokes ob dem and let dem rot in front ob our gates under day eyes ob our brave gate guard.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 43));
talkEntry:addResponse("So wir machen Witze über die und lassen die verrotten vor unser Tor unter Auge unser tapfer Torwache.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 43));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addTrigger("Nix");
talkEntry:addTrigger("Aufhören");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 43));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 43));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 43));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addTrigger("more");
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 44));
talkEntry:addResponse("Dat wus da Day ob Green Growl! Meh proud to beh an Orc! Remembur ob dat glory day. And beh prepared fer next Orc meeting! Chief Rugh'toh ...*He grunts, closes his eyes and keep silent.*");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addTrigger("Weiter");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 44));
talkEntry:addResponse("Das war Tag von Grün Knurren! Mich stolz zu sein Ork! Erinnert glorreichen Tag. Und seit bereit für nächstes Ork Treffen! Chief Rugh'toh...*Er grunzt, schließt seine Augen und wir leise.*");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 44));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Dat wus da Day ob Green Growl! Meh proud to beh an Orc! Remembur ob dat glory day. And beh prepared fer next Orc meeting! Chief Rugh'toh ...*He grunts, closes his eyes and keep silent.*");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 44));
talkEntry:addResponse("Das war Tag von Grün Knurren! Mich stolz zu sein Ork! Erinnert glorreichen Tag. Und seit bereit für nächstes Ork Treffen! Chief Rugh'toh...*Er grunzt, schließt seine Augen und wir leise.*");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 44));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addTrigger("Nix");
talkEntry:addTrigger("Aufhören");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 44));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 44));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Nub more storeh? Hurrkeh, meh nub tell more.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addTrigger("Stop");
talkEntry:addCondition(npc.base.condition.quest.quest(601, "=", 44));
talkEntry:addResponse("Nix mehr Geschichte? Hurrkeh, mich nix weiter erzählen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(601, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Chief");
talkEntry:addResponse("Meh remember dhat beh dah best leader ebba! But meh nub know whub happened to him!");
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
talkEntry:addTrigger("Rugh");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hurr, daht beh smart and proud Chief from Clan ob Northern Mountains. Meh nub know ib it beh around now.");
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
talkEntry:addResponse("Meh remember dhat beh dah strongest orc ebba! Betta run ib him beh on oddha side!");
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
talkEntry:addTrigger("Rogruk");
talkEntry:addTrigger("Bregoguk");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hurr, daht beh strong Warlord from Clan ob Northern Mountains. Meh nub know ib it beh around now.");
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
talkEntry:addTrigger("Murgo");
talkEntry:addTrigger("Lokh");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("He, he... Broddha Murgo beh also known as dha Flying Lokh'um, but dhat shall yoo dha broddha explain ib yoo meet him. *smirks and covers his head*");
talkEntry:addResponse("Hurr, daht beh strong Orc from Clan ob Northern Mountains. Meh nub know ib it beh around now.");
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
talkEntry:addTrigger("Jag");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hurr! Avoid to get hit by Red Skull Jag's maces...*howls*");
talkEntry:addResponse("Hurr, daht beh strong Orc from Clan ob Northern Mountains. Meh nub know ib it beh around now.");
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
talkEntry:addTrigger("Gerron");
talkEntry:addTrigger("Lavence");
talkEntry:addTrigger("Murdok");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Dhat beh berreh strong Ommie whib woodhe stick beh. Beh careful ib ebba see dhat Ommie.");
talkEntry:addResponse("Meh know dhat Ommie also whib dha nam Murdok.");
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
talkEntry:addTrigger("Murdok");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Dhat beh berreh strong Ommie whib woodhe stick beh. Beh careful ib ebba see dhat Ommie.");
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
talkEntry:addTrigger("Jefferson");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Dhat beh berreh chaotic Ommie beh, whub beh berreh guud and fast whib daggers. Beh careful ib ebba see dhat Ommie.");
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
talkEntry:addTrigger("Kry");
talkEntry:addTrigger("Rack");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Dhat sista ob Orcs ob dha Northern Mountains beh. Meh nub know whub she doing now!");
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
talkEntry:addTrigger("Slug");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Dhat broddha beh guud warrior and smithe for Orcs ob dha Northern Mountains beh. Meh nub know whub he doing now!");
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
talkEntry:addTrigger("silver skull");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Dhat beh high rank ob dha Orcs ob dha Northern Mountains beh.");
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
talkEntry:addTrigger("red skull");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Dhat beh berreh high rank ob dha Orcs ob dha Northern Mountains beh.");
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
talkEntry:addResponse("Yoo nub know dhat fire in bottle? Yoo hub to open and throw it! BUMM! *smirks*");
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
talkEntry:addResponse("Dhat beh collection ob lower races beh whub worship dha Faddha also, but beh heresy. Smash dham!");
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
talkEntry:addResponse("Hurr, dha holy land in north in Gobaith. Land beh ob orcs ob Northern Mountains");
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
talkEntry:addResponse("Hurr! Orc of the Norhern Mountains beh mighte Clan beh in Gobaith whib strong Chief, Warlod, Red Skulls, Silver Skulls an oddhas broddha and sisthas.");
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
talkEntry:addResponse("Dhat stumpie army being from Silverbrand, me remember right.");
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
talkEntry:addTrigger("Troll");
talkEntry:addTrigger("Bane");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Dhat beh old Ommie town in Gobaith. Long tiem ago.");
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
talkEntry:addResponse("Stumpie queen Friedwulfa become famous as Flying stumpie. Ask dhat Stumpie ib yoo meet it! *smirks*");
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
talkEntry:addTrigger("friedl");
talkEntry:addTrigger("Friedwulfa");
talkEntry:addTrigger("Silberklinge");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Stumpie queen Friedwulfa become famous as Flying stumpie. Ask dhat Stumpie ib yoo meet it! *smirks*");
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
talkEntry:addResponse("Dhat beh Stumpietwon in Gobaith whib Stumpie queen whub fhink be able smashing Warlord. *smirks*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("silberbrand");
talkEntry:addResponse("Das sein Stumpiestadt in Gobaih mit Zwergenkönigin die glaubte Warlord besiegen können. *grinst frech*");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me rülpst.", "#me burps.");
talkingNPC:addCycleText("#me murmelt vor sich her.", "#me mumbles to himself.");
talkingNPC:addCycleText("#me kratzt sich am Hintern.", "#me scratches his ass.");
talkingNPC:addCycleText("Ehre Tag des Hammers!", "Honor Day of Hammer!");
talkingNPC:addCycleText("Ehre Tag des Grünen Knurren!", "Honor Day of Green Growl!");
talkingNPC:addCycleText("Ehre dem Vater!", "Honor dah Faddha!");
talkingNPC:addCycleText("Wer wolla hören Geschicht?", "Whu want hear storeh?");
talkingNPC:addCycleText("Mich wissen viele Geschichten von Ehre.", "Meh know maneh storeh about honor.");
talkingNPC:addCycleText("#me öffnet seine Augen und schließt sie wieder nach einer Weile.", "#me opens his eyes and closes them again after while.");
talkingNPC:addCycleText("Bringt Ehre der Stadt.", "Bring honor to our town.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(5);
mainNPC:setDefaultLanguage(5);
mainNPC:setLookat("#me sitzt auf einem Stamm und hat den Kopf gesenkt.", "#me is sitting on a log and has lowered his head.");
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

function receiveText(texttype, message, speaker) mainNPC:receiveText(speaker, message); end;
function nextCycle() mainNPC:nextCycle(); end;
function lookAtNpc(char, mode) mainNPC:lookAt(char, mode); end;
function useNPC(char, counter, param) mainNPC:use(char); end;
initNpc();
initNpc = nil;
-- END
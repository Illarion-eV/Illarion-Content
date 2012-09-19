--------------------------------------------------------------------------------
-- NPC Name: Augham                                                      None --
-- NPC Job:  none                                                             --
--                                                                            --
-- NPC Race: human                      NPC Position:  -81, -151, 0           --
-- NPC Sex:  male                       NPC Direction: west                   --
--                                                                            --
-- Author:   not set                                                          --
--                                                                            --
-- Last parsing: May 23, 2011                            easyNPC Parser v1.02 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (0, -81, -151, 0, 6, 'Augham', 'npc.augham', 0, 0, 0, 255, 255, 255, 255, 255, 255);
---]]

require("npc.base.basic")
require("npc.base.condition.language")
require("npc.base.talk")
module("npc.augham", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Uhhh, Gobb...aithh... I got en'uff to doo with dis strange town over here! *hicks*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Uhhh, Gobb...aithh... Ich hab schonnn genugg zu tun mitt diesser Stadd dord drübn! *hicks*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Greenbriar");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Greeeenn...what? Is diss that town with those li'l people?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Greenbriar");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Greeeenn...was? Is diss that town with those li'l people?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hafen");
talkEntry:addResponse("Welcherrr 'afen? Gibt's da 'n Wirtshauss?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Harbo[u]+r");
talkEntry:addResponse("Whhhhich 'arbooor? Is dere 'ny pub?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hellbriar");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Whhhad is Hell...whaaad?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hellbriar");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Wasss ist Hell...was?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("I am");
talkEntry:addResponse("Nice to meeet y'o.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("I'm");
talkEntry:addResponse("Nice to meeet y'o.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ich bin");
talkEntry:addResponse("Nett dich kennnnnen su lernn'n.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Mag Academy");
talkEntry:addResponse("Dose ssstubid magess. Theyyy never dring anydn'g.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Magierakademie");
talkEntry:addResponse("Diesee dumennn Mag'er. Die tringgen ja nie w's.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nordmark");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Gee... isn'd dad som'where 'n da south?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nordmark");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Ahhh... Isss das nicht irgennnwo im Südn?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Silberbrand");
talkEntry:addResponse("Habd ihr Zwergennnbier dabai? Es gibbd kein bessseres.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Silverbrand");
talkEntry:addResponse("Do youuu 'ave some dre..daw...dwarfffen beer withh youuu? Dere's no bedder one.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tol Vanima");
talkEntry:addResponse("'olll Vvvanima?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Troll Bane");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Ya, Trollll's Bane. Dis is Torl..Trollll's Brane be'ind me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Troll Bane");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Jaa, Trollll's Bane. Das hinnder mir ist Torl..Trollll's Brane.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Varshikar");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Vashhhigar. Wasn't theeere somethinggg with... whatever. Id's somewhere over therre.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Varshikar");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Vashhhigar.Warr da nicccht was midd... wieauchimmer. Es iiisd irgendwo dordddrüb'n.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("auf bald");
talkEntry:addResponse("Prost!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Ich binnn Wächder in Toroll...Troll's Bar..Bane. Und ich be'ache d'see verdammmmde Stadt verdammmmd gut!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("buy");
talkEntry:addResponse("Wanna buy sommething?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("bye");
talkEntry:addResponse("Cheeers!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dein name");
talkEntry:addResponse("Mein nameee? Ich heiiiße %npcname");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("deine aufgabe");
talkEntry:addResponse("Ich bewache die Staddd. Diese Stadddda, Terolles Bane. Hinder mirrr. *hicks*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("eure aufgabe");
talkEntry:addResponse("Ich bewache die Staddd. Diese Stadddda, Terolles Bane. Hinder mirrr. *hicks*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("farewell");
talkEntry:addResponse("You leave? I sh'ld have aaaanother drink.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("Gods, goddds. Overrated, I telllll you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("good day");
talkEntry:addResponse("Day? What day? *hicks*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gr[üue]+[sß]+e");
talkEntry:addResponse("Ich grüüße euch... Wi..Wie kann de Stadddwahe euch 'elfen? *hicks*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("greetings");
talkEntry:addResponse("Greeedings. How ca... can the townguardsss 'elp you? *hicks*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("greets");
talkEntry:addResponse("Greeedings. How ca... can the townguardsss 'elp you?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("guten tag");
talkEntry:addResponse("Tag? Welcher Tag? *hicks*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hail");
talkEntry:addResponse("Hail to you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hallo");
talkEntry:addResponse("Seid gergerrüßt! Issst es nich' schön hirr?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("helfen");
talkEntry:addResponse("Ihr wolld mir helfennn? Gud, bringt miir eine Flascheee Wein! *hicks*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hello");
talkEntry:addResponse("Be grgreeeeded! Isssn't id nice here?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("help");
talkEntry:addResponse("You wannnnna helpp?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hilfe");
talkEntry:addResponse("Du willllsd helfenn?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("how are you");
talkEntry:addResponse("Fine. I am thurstyyy.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("My job iss to *hicks* guard Torll..Tre..Trollos Bane. This townnn behind me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("kaufen");
talkEntry:addResponse("Ich haabe doch gein Gellld, wie solll ich wasss gaufn?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein name");
talkEntry:addResponse("Sehrr angenemm. Meinnn Name... Ich heißßße %NPCNAME.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mission");
talkEntry:addResponse("My missission is to... yes, tooo guard thad town. Trorrs Bane.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("Pleasssure to meet youu. Myyy name... I am %NPCNAME.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("neu");
talkEntry:addResponse("Du bist neu hier? Geh am besten in die Stadt hinter mir, Troll's Bane, und suche nach Leuten, die dir helfen können.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("I[ a']+m new");
talkEntry:addResponse("You are new to Illarion? You should visit the town behind me, Troll's Bane. Search for people who can help you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("newbie");
talkEntry:addResponse("You are new to Illarion? You should visit the town behind me, Troll's Bane. Search for people who can help you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addResponse("I'mm always searching *hicks* foor someth'ng do dringg.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("sell");
talkEntry:addResponse("I don't selll anyding.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("t[äae]+tigkeit");
talkEntry:addResponse("Ich bewache die Staddd. Diese Stadddda, Terolles Bane. Hinder mirrr. *hicks*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("verkaufen");
talkEntry:addResponse("Ichhh vergaufffe gar nix. *hicks*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was kaufst");
talkEntry:addResponse("Ich haabe doch gein Gellld, wie solll ich wasss gaufn?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was tust du");
talkEntry:addResponse("Ich bewache die Staddd. Diese Stadddda, Terolles Bane. Hinder mirrr. *hicks*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was tut ihr");
talkEntry:addResponse("Ich bewache die Staddd. Diese Stadddda, Terolles Bane. Hinder mirrr. *hicks*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkaufst");
talkEntry:addResponse("Ich vergaufffe gar nichhds.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("wer seid");
talkEntry:addResponse("Ich bewachhhhe die.. alsoo Tero...Trollse Banne.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("wer");
talkEntry:addResponse("Ich bewachhhhe die.. alsoo Tero...Trollse Banne.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what buy");
talkEntry:addResponse("I haveee no money, how woould I buy anyth *hicks* ing?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addResponse("I don't selll anyding.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what you do");
talkEntry:addResponse("My job iss to *hicks* guard Torll..Tre..Trollos Bane. This townnn behind me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("where am I");
talkEntry:addResponse("You are inn Troob...Torb...Troll's Bane.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("who");
talkEntry:addResponse("My job iss to *hicks* guard Torll..Tre..Trollos Bane. This townnn behind me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("wie geht es");
talkEntry:addResponse("Mirr gehtt es gudd. Fragtt doch mal diee Stadd, derr gehts sich'r nicht gut, die drehht sich... *hicks*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("wie hei[sß]+t du");
talkEntry:addResponse("Ich heißße %NPCNAME.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("wo bin ich");
talkEntry:addResponse("Du bisst in Troob...Torb...Troll's Bane.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("you name");
talkEntry:addResponse("I amm %NPCNAME");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("wache");
talkEntry:addResponse("Dieee Wache? Wir llleisten guute Arbeid!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("guard");
talkEntry:addResponse("Theee town guardss? We're doinnn' great worgg!");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("Hicks!", "Hicks!");
talkingNPC:addCycleText("#me schwankt nach links", "#me tumbles to the left");
talkingNPC:addCycleText("#me schwankt nach rechts", "#me tumbles to the right");
talkingNPC:addCycleText("#me rülpst", "#me burbs");
talkingNPC:addCycleText("#me zieht eine kleine Flasche aus der Tasche und trinkt einen Schluck", "#me pulls a bottle out of his pocket and takes a sip");
talkingNPC:addCycleText("#me lallt etwas unverständliches", "#me brabbles something ununderstandable");
mainNPC:addLanguage(0);
mainNPC:addLanguage(1);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Das ist ein NPC dessen Entwickler zu faul war eine Beschreibung einzutragen.", "This is a NPC who's developer was too lazy to type in a description.");
mainNPC:setUseMessage("Fass mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut dich verwirrt an.", "#me looks at you confused.");
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

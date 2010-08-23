--------------------------------------------------------------------------------
-- NPC Name: Hagar Wernson                                               None --
-- NPC Job:  none                                                             --
--                                                                            --
-- NPC Race: human                      NPC Position:  426, 316, -3           --
-- NPC Sex:  male                       NPC Direction: west                   --
--                                                                            --
-- Author:   not set                                                          --
--                                                                            --
-- Last parsing: August 23, 2010                         easyNPC Parser v1.01 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (0, 426, 316, -3, 6, 'Hagar Wernson', 'npc.hagar_wernson', 0, 0, 0, 255, 255, 255, 255, 255, 255);
---]]

require("npc.base.basic")
require("npc.base.condition.chance")
require("npc.base.condition.item")
require("npc.base.condition.language")
require("npc.base.condition.money")
require("npc.base.condition.number")
require("npc.base.condition.quest")
require("npc.base.condition.race")
require("npc.base.condition.sex")
require("npc.base.consequence.deleteitem")
require("npc.base.consequence.inform")
require("npc.base.consequence.item")
require("npc.base.consequence.money")
require("npc.base.consequence.queststatus")
require("npc.base.talk")
module("npc.hagar_wernson", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Hagar Wernson the keeper of 'The Winged Sow' Tavern."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dies ist NPC Hager Wernson der Wirt der 'Taverne zur geflügelten Sau'."));
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
talkEntry:addCondition(npc.base.condition.race.race(3));
talkEntry:addCondition(npc.base.condition.chance.chance(15));
talkEntry:addResponse("G'day... long-ear.");
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
talkEntry:addCondition(npc.base.condition.race.race(3));
talkEntry:addCondition(npc.base.condition.chance.chance(15));
talkEntry:addResponse("N'guten...Langohr");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greebas");
talkEntry:addTrigger("Greebs");
talkEntry:addCondition(npc.base.condition.race.race(3));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(15));
talkEntry:addResponse("G'day... long-ear.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greebas");
talkEntry:addTrigger("Greebs");
talkEntry:addCondition(npc.base.condition.race.race(3));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(15));
talkEntry:addResponse("N'guten...Langohr");
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
talkEntry:addCondition(npc.base.condition.race.race(3));
talkEntry:addResponse("Moin... long-ear.");
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
talkEntry:addCondition(npc.base.condition.race.race(3));
talkEntry:addResponse("Moin...Langohr");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greebas");
talkEntry:addTrigger("Greebs");
talkEntry:addCondition(npc.base.condition.race.race(3));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Moin... long-ear.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greebas");
talkEntry:addTrigger("Greebs");
talkEntry:addCondition(npc.base.condition.race.race(3));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Moin...Langohr");
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
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addResponse("G'day, beautyfull maiden! come here! I'll clean that table.");
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
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addResponse("Sei gegrüßt, holde Maid! Komm näher! Ich wisch auch den Tisch ab.");
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
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addResponse("G'day, beautyfull maiden! come here! I'll clean that table.");
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
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addResponse("Sei gegrüßt, holde Maid! Komm näher! Ich wisch auch den Tisch ab.");
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
talkEntry:addCondition(npc.base.condition.item.item(333, "all", "=>", 1));
talkEntry:addResponse("G'day, %CHARNAME! Here's yer place! Fill yer up?");
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
talkEntry:addCondition(npc.base.condition.item.item(333, "all", "=>", 1));
talkEntry:addResponse("Moin, Moin, %CHARNAME! Komm ran! Hier kannste Dich vollkippen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greebas");
talkEntry:addTrigger("Greebs");
talkEntry:addCondition(npc.base.condition.item.item(333, "all", "=>", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("G'day, %CHARNAME! Here's yer place! Fill yer up?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greebas");
talkEntry:addTrigger("Greebs");
talkEntry:addCondition(npc.base.condition.item.item(333, "all", "=>", 1));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Moin, Moin, %CHARNAME! Komm ran! Hier kannste Dich vollkippen.");
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
talkEntry:addResponse("G'day, be wellcome in the Winged Sow Tavern!");
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
talkEntry:addResponse("Moin, seid willkommen in der Taverne zur geflügelten Sau!");
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
talkEntry:addResponse("G'day, be wellcome in the Winged Sow Tavern!");
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
talkEntry:addResponse("Moin, seid willkommen in der Taverne zur geflügelten Sau!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Good bye");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare thee well");
talkEntry:addResponse("Be well! An' carefull, that no one steps on yer hands...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehabt euch wohl");
talkEntry:addResponse("Bis bald! Und lass dir nich auffe Hände treten...");
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
talkEntry:addResponse("Be well! An' carefull, that no one steps on yer hands...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Bis bald! Und lass dir nich auffe Hände treten...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("Aye, I'm fine. But you seem to be thirsty...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befinden");
talkEntry:addResponse("Aye, mir gehts gut. Aber ihr seht aus als hättet ihr durst...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addResponse("What a pleasure! I am %NPCNAME, the innkeeper.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addResponse("Es ist mir ein Vergnügen! Ich bin %NPCNAME, der Wirt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("I am %NPCNAME, the innkeeper.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Ich bin %NPCNAME, der Wirt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("At that time I was the inkeeper of the Dragon's Pond. But now - yes now I hold this moderate cottage.");
talkEntry:addResponse("This's my tavern. 'The Winged Sow', thats the name. Aye that's rigth!");
talkEntry:addResponse("Altough the business in Galmair is much better, I tend to miss the old Drangon's Pond sometimes.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Damals war ich der Wirt der Drachentränke. Aber nun - ja nun gehört mir diese bescheidene Hütte.");
talkEntry:addResponse("Dies ist meine Taverne. 'Zur geflügelten Sau' heißt sie. Aye, so ist's!");
talkEntry:addResponse("Auch wenn das Geschäft in Galmair besser geht, vermiss ich die alte Drachentränke manchmal trozdem.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("I'm the inkeeper here.");
talkEntry:addResponse("That's my tavern. 'The Winged Sow'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Ich bin der Wirt, hier.");
talkEntry:addResponse("Das ist meine Taverne. 'Zur geflügelten Sau'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I'm the inkeeper here.");
talkEntry:addResponse("That's my tavern. 'The Winged Sow'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Ich bin der Wirt, hier.");
talkEntry:addResponse("Das ist meine Taverne. 'Zur geflügelten Sau'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Aye, s' horrible waht happened there. I will miss the Nordmark for ever.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Aye, das war schrecklich was dort passiert ist. Die Nordmark werd ich immer vermissen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("I am");
talkEntry:addTrigger("my name");
talkEntry:addCondition(npc.base.condition.quest.quest(306, "=>", 1));
talkEntry:addResponse("No need for tell me again. I'm really good with names. I never forgott one. - What may I serve you?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ich bin");
talkEntry:addTrigger("mein Name");
talkEntry:addCondition(npc.base.condition.quest.quest(306, "=>", 1));
talkEntry:addResponse("Brauchste mir nicht nochmal zu sagen. Mit Namen bin ich ausgesprochen gut. hab noch nie einen vergessen. - Was darfs heute sein?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("I am");
talkEntry:addTrigger("my name");
talkEntry:addConsequence(npc.base.consequence.inform.inform("The Innkeeper gifts you a beer for free. Cheers!"));
talkEntry:addResponse("You are new here, arn't you? Here you go! The first beer 's for free. Welcome at the Winged Sow tavern!");
talkEntry:addConsequence(npc.base.consequence.item.item(1909, 1, 333, 0));
talkEntry:addConsequence(npc.base.consequence.queststatus.queststatus(306, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ich bin");
talkEntry:addTrigger("mein Name");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Der Wirt gibt dir ein Bier aus. Prost!"));
talkEntry:addResponse("Du bist neu hier, was? Hier! Das erste Bier geht immer auf's Haus. Willkommen in der Taverne zur geflügelten Sau!");
talkEntry:addConsequence(npc.base.consequence.item.item(1909, 1, 333, 0));
talkEntry:addConsequence(npc.base.consequence.queststatus.queststatus(306, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dragon");
talkEntry:addResponse("Dragon's Pond. My old tavern. Sadly I had to leave it behind.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("nordmark");
talkEntry:addTrigger("northmark");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("That's the place where my old tavern was. The Dragon's Pond! It was a good place to be. No witchers and longears. Besyde those, whos heads we had put on a pale. Har-har!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("wing sow");
talkEntry:addTrigger("wing pig");
talkEntry:addResponse("Aye, peek the sky. Maybe you are able to see one.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Murgo");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I know Murgo since the time at Gobaith. He was a good freind of my people.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Vigalf");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Good-good old Vigalf. Zhambra may bless my old friend.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("drache");
talkEntry:addResponse("Drachentränke. Meine alte Taverne. Trauriger Weise musste ich sie verlassen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nordmark");
talkEntry:addResponse("Das ist der Ort wo die alte Taverne stand. Die Drachentränke! Das war ein guter Ort zum Leben. Keine Hexer und Langohren. Abgesehen von denen, deren Köpfe wir auf nen Pfahl gesteckt haben. Har-har!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("fügel sau");
talkEntry:addTrigger("fügel schwein");
talkEntry:addResponse("Aye, schau in die Wolken, vielleicht seht ihr eine.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Murgo");
talkEntry:addResponse("Ich kenn Murgo noch von der Zeit auf Gobaith. War ein guter Freund von meinen Leuten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Vigalf");
talkEntry:addResponse("Guter-guter alter Vigalf. Zhambra schütze meinen alten Freund.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addTrigger("archmage");
talkEntry:addTrigger("Erzmagier");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("All that riff-raff should be kicked in their butts. If my opinion still counts.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addTrigger("archmage");
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Dieses ganze Gesocks gehört kreäftig in den Hintern getreten. Wenn meine Meinung was Wert ist.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("All that riff-raff should be kicked in their butts. If my opinion still counts.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Dieses ganze Gesocks gehört kreäftig in den Hintern getreten. Wenn meine Meinung was Wert ist.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("The Don takes care, my tavern is the only one in town. Good deal, eh? That's totaly worth the fee.");
talkEntry:addResponse("What's up? I paid for everything a few days ago!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Der Don, sorgt dafür das meine Taverne die einzige in der Stadt ist. Feine Sache oder? Das lass ich mir gerne etwas kosten.");
talkEntry:addResponse("Was willst du? Ich hab alles schon vor n' paar Tagen bezahlt!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I know what the people say... But here in Galmair! - your wallet becomes basting and fat. The only fat thing in Cadomyr, is queen Edwards butt! Har-har-har!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Ich weiß was die Leute sagen... Aber hier in Galmair! - Wird der Münzbeutel prall und fett. Das einzig fette in Cadomyr ist Königin Edwards! Har-har-har!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("königin");
talkEntry:addTrigger("queen");
talkEntry:addTrigger("edwards");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("They say queen Edwards sells hot love for a hand full copper. Oh! No, wait. Thats what I say...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("königin");
talkEntry:addTrigger("queen");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Man sagt Königin Edwards verkauft heiße Liebe für ne Hand voll Kupfer. Oh! Nein wartet, das ist was ich sage...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Like the dwarves say: 'There are too mutch head bangers in Cadomyr.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("In Cadomyr laufen mir zu viele Holzköpfe mit großen Schwertern herum.");
talkEntry:addResponse("Es heißt die Frauen in Cadomyr hätten besondere Tricks auf Lager. Nüsse knacken zum Beispiel.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("My old freind Vigalf was born there. He didn't like it that much.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Mein alter freund Vigalf kam aus Albar. Hat ihm dort nicht so gefallen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I'm Norodaj! What should I do at this horrible temperature? But I guess a clever man should be able to make good money there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Ich bin 'n Norodaj! Was sollte ich in dieser Affen-Hitze? Aber ich schätze ein kluger Mann kann dort gutes geld machen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Salkamar is a club of boring pergament shufflers.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Salkamar ist ein Verein von langweiligen Sesselpupsern.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("I'm Norodaj. Zhambra and Tanora are those of my choice. And Ronagan, to keep my tavern save! Aye.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Ich bin Norodaj. Zhambra und Tanora sind meine Wahl. Und Ronagan, damit meine Taverne sicher ist. Aye.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Adron");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Adron? Well, for sure... I had his shrine here - somwhere. Uhm..");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Adron");
talkEntry:addResponse("Adron? Ja Sicherlich... Ich hatte seinen Schrein hier - irgendwo. Uhm..");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("One of the treehuggers gods. Don't ask me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addResponse("Mit diesen Elfengöttern hab ich nichts am Hut. Und dich hab nichtmal nen Hut.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Ask a preist or something.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addResponse("Fragt doch einen Priester oder so etwas.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elara");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Ask a preist or something.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elara");
talkEntry:addResponse("Fragt doch einen Priester oder so etwas.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eldan");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("One of the treehuggers gods. Don't ask me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eldan");
talkEntry:addResponse("Mit diesen Elfengöttern hab ich nichts am Hut. Und dich hab nichtmal nen Hut.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Findari");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("One of the treehuggers gods. Don't ask me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Findari");
talkEntry:addResponse("Mit diesen Elfengöttern hab ich nichts am Hut. Und dich hab nichtmal nen Hut.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("The Merchants and dwarves. Ask them, it's their god.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("Die Händler und Zwerge, ja-ja. Frag die. Irmorom ist deren Gott.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addResponse("Fragt doch einen Priester oder so etwas.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Moshran");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Ask a preist or something.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Moshran");
talkEntry:addResponse("Fragt doch einen Priester oder so etwas.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addTrigger("Nargùn");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Ask a preist or something.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addTrigger("Nargùn");
talkEntry:addResponse("Fragt doch einen Priester oder so etwas.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oldra");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Ask a preist or something.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("Fragt doch einen Priester oder so etwas.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ronagan");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Praise ROnagan. And thanks to him, that those thieves are far away from my coins.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("Gepriesen sei Ronagan. Und gedankt seis ihm, das die elenden Langfinger meinen Münzen fern bleiben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sirani");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Ask a preist or something.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("Fragt doch einen Priester oder so etwas.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("The Norodaj are the childrens of the sea. Tanora bless our ships.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("Die Norodaj, sind die Kinder der See. Und Tanora schütze unsere Schiffe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ushara");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("One of the treehuggers gods. Don't ask me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("Mit diesen Elfengöttern hab ich nichts am Hut. Und dich hab nichtmal nen Hut.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zhambra");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Bless my brothers and freinds, Zhambra.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zhambra");
talkEntry:addResponse("Schütze meine Brüder und Freunde, Zhambra.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I havn't any tasks for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Ich hab keine Arbeit für Euch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addResponse("I havn't any tasks for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addResponse("Ich habe keine Arbeit für Euch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("Aye!");
talkEntry:addResponse("Whatever.");
talkEntry:addResponse("Allright.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("Aye!");
talkEntry:addResponse("Was auch immer.");
talkEntry:addResponse("Alles klar.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("Aye!");
talkEntry:addResponse("Whatever.");
talkEntry:addResponse("Allright.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("Aye!");
talkEntry:addResponse("Was auch immer.");
talkEntry:addResponse("Alles klar.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Was verkauft");
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addResponse("Ich hab Jungfernglück, den beliebten Apfelwein, nur sechs Kupfer fürn Kelch. Wär das nix fuer Euch? Oder Gnollgift, den guten Rotwein, nur acht Kupfer. Bärenfalle, den besten Met auch für acht. Und Nordburger Schädelbrecher, unser Bier. Der Krug zu lumpigen acht Kupfer");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Was kauft");
talkEntry:addTrigger("Was kaufst");
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addResponse("Ich kauf Kupferkelche zurück, meine Liebe. Ein'n Kupfer fürn Kelch. Und Bierkruege, auch für'n Kupfer. Für graue Flaschen zahl ich zwei.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addResponse("I got virgen's delight, our applewine, six copper the goblet. Specially for you, my dear. An' Gnollpoison, a red wine, or Beartrap, our meade, both for eight copper the goblet. An' Northburger scullcracker, our beer, for eight copper the mug.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what do buy");
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addResponse("I buy back the empty mugs and coppergoblets, my dear. For a copper each. And grey bottles, for two copper each.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Was verkauft");
talkEntry:addResponse("Ich hab Jungfernglück, den beliebten Apfelwein, nur sechs Kupfer fürn Kelch. Oder Gnollgift, den guten Rotwein, nur acht Kupfer. Bärenfalle, den besten Met auch für acht. Und Nordburger Schädelbrecher, unser Bier. Der Krug  zu lumpigen acht Kupfer");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Was kauft");
talkEntry:addTrigger("Was kaufst");
talkEntry:addResponse("Ich kauf Kupferkelche zurück. Ein'n Kupfer fürn Kelch. Und Bierkruege, auch für'n Kupfer. Für graue Flaschen zahl ich zwei.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addResponse("I got virgen's delight, our applewine, six copper the goblet. An' Gnollpoison, a red wine, or Beartrap,  our meade, both for eight copper the goblet. An' Northburger scullcracker, our beer, for eight copper the mug.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what do buy");
talkEntry:addResponse("I buy back the empty mugs and coppergoblets. For a copper each. And grey bottles, for two copper each.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("buy milk");
talkEntry:addResponse("Here is no monastery! get lost!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("milch kauf");
talkEntry:addTrigger("kauf milch");
talkEntry:addResponse("Hier iss doch kein Kloster! Verschwinde!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("buy water");
talkEntry:addResponse("ye can water yer cow outside! this ain't no stable here!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("wasser kauf");
talkEntry:addTrigger("kauf wasser");
talkEntry:addResponse("Deine Kuh kannst du draussen tränken! Dies iss doch kein Stall!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("buy a virgen's delight");
talkEntry:addTrigger("buy a cyder");
talkEntry:addCondition(npc.base.condition.money.money("<", 6));
talkEntry:addResponse("Yer 'ave not enuff money, come back, when yer can pay.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("buy a virgen's delight");
talkEntry:addTrigger("buy a cyder");
talkEntry:addResponse("Here yer got it. drink, before the goblet gets rusty!");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 6));
talkEntry:addConsequence(npc.base.consequence.item.item(1844, 1, 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ein Apfelmost kauf");
talkEntry:addTrigger("ein Apfelwein kauf");
talkEntry:addTrigger("ein Cider kauf");
talkEntry:addTrigger("ein Jungferngl[üue]+ck kauf");
talkEntry:addCondition(npc.base.condition.money.money("<", 6));
talkEntry:addResponse("Ohne Moos nix los! Komm wieder, wenn Du Geld hast!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ein Apfelmost kauf");
talkEntry:addTrigger("ein Apfelwein kauf");
talkEntry:addTrigger("ein Cider kauf");
talkEntry:addTrigger("ein Jungferngl[üue]+ck kauf");
talkEntry:addResponse("Hier hast Du. Trink, bevor der Kelch rostet!");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 6));
talkEntry:addConsequence(npc.base.consequence.item.item(1844, 1, 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("buy (%d+) cyder");
talkEntry:addTrigger("buy (%d+) virgen's delight");
talkEntry:addCondition(npc.base.condition.money.money("<", function(number) return (number*6); end));
talkEntry:addResponse("That ain't enuff money!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("buy (%d+) cyder");
talkEntry:addTrigger("buy (%d+) virgen's delight");
talkEntry:addCondition(npc.base.condition.money.money("=>", function(number) return (number*6); end));
talkEntry:addResponse("Here are your %NUMBER cyder!");
talkEntry:addConsequence(npc.base.consequence.money.money("-", function(number) return (number*6); end));
talkEntry:addConsequence(npc.base.consequence.item.item(1844, "%NUMBER", 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("(%d+) Cider kauf");
talkEntry:addTrigger("(%d+) Apfelmost kauf");
talkEntry:addTrigger("(%d+) Apfelwein kauf");
talkEntry:addTrigger("(%d+) Jungferngl[üue]+ck kauf");
talkEntry:addCondition(npc.base.condition.money.money("<", function(number) return (number*6); end));
talkEntry:addResponse("Datt is nich genug Kupfer!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("(%d+) Cider kauf");
talkEntry:addTrigger("(%d+) Apfelmost kauf");
talkEntry:addTrigger("(%d+) Apfelwein kauf");
talkEntry:addTrigger("(%d+) Jungferngl[üue]+ck kauf");
talkEntry:addCondition(npc.base.condition.money.money("=>", function(number) return (number*6); end));
talkEntry:addResponse("Hier hast du deine %NUMBER Apfelwein!");
talkEntry:addConsequence(npc.base.consequence.money.money("-", function(number) return (number*6); end));
talkEntry:addConsequence(npc.base.consequence.item.item(1844, "%NUMBER", 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("buy a beer");
talkEntry:addTrigger("buy a scullcracker");
talkEntry:addCondition(npc.base.condition.money.money("<", 8));
talkEntry:addCondition(npc.base.condition.race.race(3));
talkEntry:addResponse("Bugger off! We don't like beggars without money here!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("buy a beer");
talkEntry:addTrigger("buy a scullcracker");
talkEntry:addCondition(npc.base.condition.money.money("<", 8));
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addResponse("My dear, I cain't give yer a drink without money.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("buy a beer");
talkEntry:addTrigger("buy a scullcracker");
talkEntry:addCondition(npc.base.condition.money.money("<", 8));
talkEntry:addResponse("Yer 'ave not enuff money, come back, when yer can pay.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("buy a beer");
talkEntry:addTrigger("buy a scullcracker");
talkEntry:addResponse("Here yer got it. drink, before it cools down!");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 8));
talkEntry:addConsequence(npc.base.consequence.item.item(1909, 1, 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ein bier kauf");
talkEntry:addTrigger("ein sch[äae]+delbrecher kauf");
talkEntry:addCondition(npc.base.condition.money.money("<", 8));
talkEntry:addCondition(npc.base.condition.race.race(3));
talkEntry:addResponse("Mach das Du rauskommst! nich' bloss'n Elf, nee, auch noch'n Bettler! Also so was!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ein bier kauf");
talkEntry:addTrigger("ein sch[äae]+delbrecher kauf");
talkEntry:addCondition(npc.base.condition.money.money("<", 8));
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addResponse("Ohne Kupfer kriegt selbst so'n hübsches Ding wie Du hier nix zu trinken!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ein bier kauf");
talkEntry:addTrigger("ein sch[äae]+delbrecher kauf");
talkEntry:addCondition(npc.base.condition.money.money("<", 8));
talkEntry:addResponse("Ohne Kohle kein Bier! Komm wieder, wenn Du Geld hast!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ein bier kauf");
talkEntry:addTrigger("ein sch[äae]+delbrecher kauf");
talkEntry:addResponse("Hier hast es. Trink, bevor es kalt wird!");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 8));
talkEntry:addConsequence(npc.base.consequence.item.item(1909, 1, 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("buy (%d+) beer");
talkEntry:addTrigger("buy (%d+) scullcracker");
talkEntry:addCondition(npc.base.condition.money.money("<", function(number) return (number*8); end));
talkEntry:addResponse("That ain't enuff money!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("buy (%d+) beer");
talkEntry:addTrigger("buy (%d+) scullcracker");
talkEntry:addCondition(npc.base.condition.money.money("=>", function(number) return (number*8); end));
talkEntry:addResponse("Here are your %NUMBER beer!");
talkEntry:addConsequence(npc.base.consequence.money.money("-", function(number) return (number*8); end));
talkEntry:addConsequence(npc.base.consequence.item.item(1909, "%NUMBER", 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("(%d+) bier kauf");
talkEntry:addTrigger("(%d+) sch[äae]+delbrecher kauf");
talkEntry:addCondition(npc.base.condition.money.money("<", function(number) return (number*8); end));
talkEntry:addResponse("Datt is nich genug Kupfer!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("(%d+) bier kauf");
talkEntry:addTrigger("(%d+) sch[äae]+delbrecher kauf");
talkEntry:addCondition(npc.base.condition.money.money("=>", function(number) return (number*8); end));
talkEntry:addResponse("Hier hast du deine %NUMBER Bier!");
talkEntry:addConsequence(npc.base.consequence.money.money("-", function(number) return (number*8); end));
talkEntry:addConsequence(npc.base.consequence.item.item(1909, "%NUMBER", 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("buy a wine");
talkEntry:addTrigger("buy a gnollpoison");
talkEntry:addCondition(npc.base.condition.money.money("<", 8));
talkEntry:addCondition(npc.base.condition.race.race(3));
talkEntry:addResponse("Bugger off! We don't like beggars without money here!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("buy a wine");
talkEntry:addTrigger("buy a gnollpoison");
talkEntry:addCondition(npc.base.condition.money.money("<", 8));
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addResponse("My dear, I cain't give yer a drink without money.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("buy a wine");
talkEntry:addTrigger("buy a gnollpoison");
talkEntry:addCondition(npc.base.condition.money.money("<", 8));
talkEntry:addResponse("Yer 'ave not enuff money, come back, when yer can pay.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("buy a wine");
talkEntry:addTrigger("buy a gnollpoison");
talkEntry:addResponse("Here yer got it. drink, before the gnolls come for it!");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 8));
talkEntry:addConsequence(npc.base.consequence.item.item(1842, 1, 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ein Wein kauf");
talkEntry:addTrigger("ein Gnollgift kauf");
talkEntry:addCondition(npc.base.condition.money.money("<", 8));
talkEntry:addCondition(npc.base.condition.race.race(3));
talkEntry:addResponse("Mach das Du rauskommst! nich' bloss'n Elf, nee, auch noch'n Bettler! Also so was!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ein Wein kauf");
talkEntry:addTrigger("ein Gnollgift kauf");
talkEntry:addCondition(npc.base.condition.money.money("<", 8));
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addResponse("Ohne Kupfer kriegt selbst so'n strammes Weib wie Du hier nix zu trinken!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ein Wein kauf");
talkEntry:addTrigger("ein Gnollgift kauf");
talkEntry:addCondition(npc.base.condition.money.money("<", 8));
talkEntry:addResponse("Ohne Kupfer keinen Wein! Komm wieder, wenn Du Geld hast!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ein Wein kauf");
talkEntry:addTrigger("ein Gnollgift kauf");
talkEntry:addResponse("Hier hast ihn. Trink, wenn Du kein Gnoll bist!");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 8));
talkEntry:addConsequence(npc.base.consequence.item.item(1842, 1, 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("buy (%d+) wine");
talkEntry:addTrigger("buy (%d+) gnollpoison");
talkEntry:addCondition(npc.base.condition.money.money("<", function(number) return (number*8); end));
talkEntry:addResponse("That ain't enuff money!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("buy (%d+) wine");
talkEntry:addTrigger("buy (%d+) gnollpoison");
talkEntry:addCondition(npc.base.condition.money.money("=>", function(number) return (number*8); end));
talkEntry:addResponse("Here are your %NUMBER wine!");
talkEntry:addConsequence(npc.base.consequence.money.money("-", function(number) return (number*8); end));
talkEntry:addConsequence(npc.base.consequence.item.item(1842, "%NUMBER", 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("(%d+) Wein kauf");
talkEntry:addTrigger("(%d+) Gnollgift kauf");
talkEntry:addCondition(npc.base.condition.money.money("<", function(number) return (number*8); end));
talkEntry:addResponse("Datt is nich genug Kupfer!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("(%d+) Wein kauf");
talkEntry:addTrigger("(%d+) Gnollgift kauf");
talkEntry:addCondition(npc.base.condition.money.money("=>", function(number) return (number*8); end));
talkEntry:addResponse("Hier hast du deine %NUMBER Weine!");
talkEntry:addConsequence(npc.base.consequence.money.money("-", function(number) return (number*8); end));
talkEntry:addConsequence(npc.base.consequence.item.item(1842, "%NUMBER", 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("buy a meade");
talkEntry:addTrigger("buy a beartrap");
talkEntry:addCondition(npc.base.condition.money.money("<", 8));
talkEntry:addCondition(npc.base.condition.race.race(3));
talkEntry:addResponse("Bugger off! We don't like beggars without money here!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("buy a meade");
talkEntry:addTrigger("buy a beartrap");
talkEntry:addCondition(npc.base.condition.money.money("<", 8));
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addResponse("Honey, I cain't give yer a drink without money.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("buy a meade");
talkEntry:addTrigger("buy a beartrap");
talkEntry:addCondition(npc.base.condition.money.money("<", 8));
talkEntry:addResponse("Yer 'ave not enuff money, come back, when yer can pay.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("buy a meade");
talkEntry:addTrigger("buy a beartrap");
talkEntry:addResponse("Here yer meade. Sweet, sticky ann' strong!");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 8));
talkEntry:addConsequence(npc.base.consequence.item.item(1843, 1, 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ein Met kauf");
talkEntry:addTrigger("ein B[äae]+renfalle kauf");
talkEntry:addCondition(npc.base.condition.money.money("<", 8));
talkEntry:addCondition(npc.base.condition.race.race(3));
talkEntry:addResponse("Mach das Du rauskommst! nich' bloss'n Elf, nee, auch noch'n Bettler! Also so was!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ein Met kauf");
talkEntry:addTrigger("ein B[äae]+renfalle kauf");
talkEntry:addCondition(npc.base.condition.money.money("<", 8));
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addResponse("Ohne Kupfer kriegt nich ma' so'n süßes Mädel wie Du hier watt zu trinken!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ein Met kauf");
talkEntry:addTrigger("ein B[äae]+renfalle kauf");
talkEntry:addCondition(npc.base.condition.money.money("<", 8));
talkEntry:addResponse("Ohne Kupfer keinen Met! Komm wieder, wenn Du Dir das Saufen leisten kannst!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ein Met kauf");
talkEntry:addTrigger("ein B[äae]+renfalle kauf");
talkEntry:addResponse("Hier hast ihn. Kipp weg, eh die Fliegen dran kleben!");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 8));
talkEntry:addConsequence(npc.base.consequence.item.item(1843, 1, 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("buy (%d+) beartrap");
talkEntry:addTrigger("buy (%d+) meade");
talkEntry:addCondition(npc.base.condition.money.money("<", function(number) return (number*8); end));
talkEntry:addResponse("That ain't enuff money!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("buy (%d+) beartrap");
talkEntry:addTrigger("buy (%d+) meade");
talkEntry:addCondition(npc.base.condition.money.money("=>", function(number) return (number*8); end));
talkEntry:addResponse("Here are your %NUMBER meade!");
talkEntry:addConsequence(npc.base.consequence.money.money("-", function(number) return (number*8); end));
talkEntry:addConsequence(npc.base.consequence.item.item(1843, "%NUMBER", 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("(%d+) Met kauf");
talkEntry:addTrigger("(%d+) B[äae]+renfalle kauf");
talkEntry:addCondition(npc.base.condition.money.money("<", function(number) return (number*8); end));
talkEntry:addResponse("Datt is zu wenig Kupfer!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("(%d+) Met kauf");
talkEntry:addTrigger("(%d+) B[äae]+renfalle kauf");
talkEntry:addCondition(npc.base.condition.money.money("=>", function(number) return (number*8); end));
talkEntry:addResponse("Hier hast du deine %NUMBER Met!");
talkEntry:addConsequence(npc.base.consequence.money.money("-", function(number) return (number*8); end));
talkEntry:addConsequence(npc.base.consequence.item.item(1843, "%NUMBER", 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("(%d+) goblet sale");
talkEntry:addTrigger("sell (%d+) goblet");
talkEntry:addCondition(npc.base.condition.item.item(1840, "all", "<", "%NUMBER"));
talkEntry:addResponse("That ain't so many!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("(%d+) goblet sale");
talkEntry:addTrigger("sell (%d+) goblet");
talkEntry:addCondition(npc.base.condition.item.item(1840, "all", "=>", "%NUMBER"));
talkEntry:addResponse("Here's yer money!");
talkEntry:addConsequence(npc.base.consequence.money.money("+", "%NUMBER"));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(1840, "%NUMBER"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("(%d+) mug sale");
talkEntry:addTrigger("sell (%d+) mug");
talkEntry:addCondition(npc.base.condition.item.item(1908, "all", "<", "%NUMBER"));
talkEntry:addResponse("That ain't so many!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("(%d+) mug sale");
talkEntry:addTrigger("sell (%d+) mug");
talkEntry:addCondition(npc.base.condition.item.item(1908, "all", "=>", "%NUMBER"));
talkEntry:addResponse("Here's yer money!");
talkEntry:addConsequence(npc.base.consequence.money.money("+", "%NUMBER"));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(1908, "%NUMBER"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("(%d+) kelch verkauf");
talkEntry:addTrigger("verkauf (%d+) kelch");
talkEntry:addCondition(npc.base.condition.item.item(1840, "all", "<", "%NUMBER"));
talkEntry:addResponse("Datt sind weniger!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("(%d+) kelch verkauf");
talkEntry:addTrigger("verkauf (%d+) kelch");
talkEntry:addCondition(npc.base.condition.item.item(1840, "all", "=>", "%NUMBER"));
talkEntry:addResponse("Hier is datt Geld!");
talkEntry:addConsequence(npc.base.consequence.money.money("+", "%NUMBER"));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(1840, "%NUMBER"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("(%d+) krug verkauf");
talkEntry:addTrigger("verkauf (%d+) krug");
talkEntry:addCondition(npc.base.condition.item.item(1908, "all", "<", "%NUMBER"));
talkEntry:addResponse("Datt sind weniger!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("(%d+) krug verkauf");
talkEntry:addTrigger("verkauf (%d+) krug");
talkEntry:addCondition(npc.base.condition.item.item(1908, "all", "=>", "%NUMBER"));
talkEntry:addResponse("Hier is datt Geld!");
talkEntry:addConsequence(npc.base.consequence.money.money("+", "%NUMBER"));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(1908, "%NUMBER"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("(%d+) grey bottle sale");
talkEntry:addTrigger("sell (%d+) grey bottle");
talkEntry:addCondition(npc.base.condition.item.item(2498, "all", "<", "%NUMBER"));
talkEntry:addResponse("That ain't so many!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("(%d+) grey bottle sale");
talkEntry:addTrigger("sell (%d+) grey bottle");
talkEntry:addCondition(npc.base.condition.item.item(2498, "all", "=>", "%NUMBER"));
talkEntry:addResponse("Here's yer money!");
talkEntry:addConsequence(npc.base.consequence.money.money("+", function(number) return (number*2); end));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2498, "%NUMBER"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("(%d+) grey bottle buy");
talkEntry:addTrigger("buy (%d+) grey bottle");
talkEntry:addCondition(npc.base.condition.money.money("<", function(number) return (number*8); end));
talkEntry:addResponse("That ain't enuff money!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("(%d+) grey bottle buy");
talkEntry:addTrigger("buy (%d+) grey bottle");
talkEntry:addCondition(npc.base.condition.number.number(">", 10));
talkEntry:addResponse("I ain't got so many!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("(%d+) grey bottle buy");
talkEntry:addTrigger("buy (%d+) grey bottle");
talkEntry:addCondition(npc.base.condition.money.money("=>", function(number) return (number*8); end));
talkEntry:addResponse("Here ye got yer %NUMBER bottles!");
talkEntry:addConsequence(npc.base.consequence.money.money("-", function(number) return (number*8); end));
talkEntry:addConsequence(npc.base.consequence.item.item(2498, "%NUMBER", 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("(%d+) grau flasche verkauf");
talkEntry:addTrigger("verkauf (%d+) grau flasche");
talkEntry:addCondition(npc.base.condition.item.item(2498, "all", "<", "%NUMBER"));
talkEntry:addResponse("Datt sind weniger!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("(%d+) grau flasche verkauf");
talkEntry:addTrigger("verkauf (%d+) grau flasche");
talkEntry:addCondition(npc.base.condition.item.item(2498, "all", "<", "%NUMBER"));
talkEntry:addResponse("Hier is datt Geld!");
talkEntry:addConsequence(npc.base.consequence.money.money("+", "%NUMBER"));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2498, "%NUMBER"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("(%d+) grau flasche kauf");
talkEntry:addTrigger("kauf (%d+) grau flasche");
talkEntry:addCondition(npc.base.condition.money.money("<", function(number) return (number*8); end));
talkEntry:addResponse("Datt kost' mehr!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("(%d+) grau flasche kauf");
talkEntry:addTrigger("kauf (%d+) grau flasche");
talkEntry:addCondition(npc.base.condition.number.number(">", 10));
talkEntry:addResponse("So viel hab ich nich!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("(%d+) grau flasche kauf");
talkEntry:addTrigger("kauf (%d+) grau flasche");
talkEntry:addCondition(npc.base.condition.money.money("=>", function(number) return (number*8); end));
talkEntry:addResponse("Hier hast du deine %NUMBER Flaschen!");
talkEntry:addConsequence(npc.base.consequence.money.money("-", function(number) return (number*8); end));
talkEntry:addConsequence(npc.base.consequence.item.item(2498, "%NUMBER", 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("(%d+) green bottle sale");
talkEntry:addTrigger("sell (%d+) green bottle");
talkEntry:addCondition(npc.base.condition.item.item(2499, "all", "<", "%NUMBER"));
talkEntry:addResponse("That ain't so many!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("(%d+) green bottle sale");
talkEntry:addTrigger("sell (%d+) green bottle");
talkEntry:addCondition(npc.base.condition.item.item(2499, "all", "=>", "%NUMBER"));
talkEntry:addResponse("Here's yer money!");
talkEntry:addConsequence(npc.base.consequence.money.money("+", function(number) return (number*9); end));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2499, "%NUMBER"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("(%d+) black bottle sale");
talkEntry:addTrigger("sell (%d+) black bottle");
talkEntry:addCondition(npc.base.condition.item.item(2501, "all", "<", "%NUMBER"));
talkEntry:addResponse("That ain't so many!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("(%d+) black bottle sale");
talkEntry:addTrigger("sell (%d+) black bottle");
talkEntry:addCondition(npc.base.condition.item.item(2501, "all", "=>", "%NUMBER"));
talkEntry:addResponse("Here's yer money!");
talkEntry:addConsequence(npc.base.consequence.money.money("+", function(number) return (number*10); end));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2501, "%NUMBER"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("(%d+) red bottle sale");
talkEntry:addTrigger("sell (%d+) red bottle");
talkEntry:addCondition(npc.base.condition.item.item(2500, "all", "<", "%NUMBER"));
talkEntry:addResponse("That ain't so many!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("(%d+) red bottle sale");
talkEntry:addTrigger("sell (%d+) red bottle");
talkEntry:addCondition(npc.base.condition.item.item(2500, "all", "<", "%NUMBER"));
talkEntry:addResponse("Here's yer money!");
talkEntry:addConsequence(npc.base.consequence.money.money("+", function(number) return (number*11); end));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2500, "%NUMBER"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("(%d+) orange bottle sale");
talkEntry:addTrigger("sell (%d+) orange bottle");
talkEntry:addCondition(npc.base.condition.item.item(2497, "all", "<", "%NUMBER"));
talkEntry:addResponse("That ain't so many!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("(%d+) orange bottle sale");
talkEntry:addTrigger("sell (%d+) orange bottle");
talkEntry:addCondition(npc.base.condition.item.item(2497, "all", "=>", "%NUMBER"));
talkEntry:addResponse("Here's yer money!");
talkEntry:addConsequence(npc.base.consequence.money.money("+", function(number) return (number*12); end));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2497, "%NUMBER"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("(%d+) gruen flasche verkauf");
talkEntry:addTrigger("verkauf (%d+) gruen flasche");
talkEntry:addCondition(npc.base.condition.item.item(2499, "all", "<", "%NUMBER"));
talkEntry:addResponse("Du hast ja garnich so viel!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("(%d+) gruen flasche verkauf");
talkEntry:addTrigger("verkauf (%d+) gruen flasche");
talkEntry:addCondition(npc.base.condition.item.item(2499, "all", "<", "%NUMBER"));
talkEntry:addResponse("Hier is datt Geld!");
talkEntry:addConsequence(npc.base.consequence.money.money("+", function(number) return (number*9); end));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2499, "%NUMBER"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("(%d+) schwarz flasche verkauf");
talkEntry:addTrigger("verkauf (%d+) schwarz flasche");
talkEntry:addCondition(npc.base.condition.item.item(2501, "all", "<", "%NUMBER"));
talkEntry:addResponse("Du hast ja garnich so viel!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("(%d+) schwarz flasche verkauf");
talkEntry:addTrigger("verkauf (%d+) schwarz flasche");
talkEntry:addCondition(npc.base.condition.item.item(2501, "all", "=>", "%NUMBER"));
talkEntry:addResponse("Hier is datt Geld!");
talkEntry:addConsequence(npc.base.consequence.money.money("+", function(number) return (number*10); end));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2501, "%NUMBER"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("(%d+) rot flasche verkauf");
talkEntry:addTrigger("verkauf (%d+) rot flasche");
talkEntry:addCondition(npc.base.condition.item.item(2500, "all", "<", "%NUMBER"));
talkEntry:addResponse("Du hast ja garnich so viel!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("(%d+) rot flasche verkauf");
talkEntry:addTrigger("verkauf (%d+) rot flasche");
talkEntry:addCondition(npc.base.condition.item.item(2500, "all", "=>", "%NUMBER"));
talkEntry:addResponse("Hier is datt Geld!");
talkEntry:addConsequence(npc.base.consequence.money.money("+", function(number) return (number*11); end));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2500, "%NUMBER"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("(%d+) orange flasche verkauf");
talkEntry:addTrigger("verkauf (%d+) orange flasche");
talkEntry:addCondition(npc.base.condition.item.item(2497, "all", "<", "%NUMBER"));
talkEntry:addResponse("Du hast ja garnich so viel!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("(%d+) orange flasche verkauf");
talkEntry:addTrigger("verkauf (%d+) orange flasche");
talkEntry:addCondition(npc.base.condition.item.item(2497, "all", "<", "%NUMBER"));
talkEntry:addResponse("Hier is datt Geld!");
talkEntry:addConsequence(npc.base.consequence.money.money("+", function(number) return (number*12); end));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2497, "%NUMBER"));
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("wir laaagen vor Sor-Ann-Araah... und hatten 'nen Elf ahan Bord....  In den Kesseln da faulte das Wassah...  da soffen wir Bier soohofort... ", "Blow wi-ind, blow... to Salkamar we go.... her hair was blond her eyes were blue... her lips were red, her axe was new... ter my hodae, ter my hodae, ter my hodae, hodae ho!");
talkingNPC:addCycleText("#me verwischt den Dreck auf dem Tisch", "#me wipes in the dirt on the table");
talkingNPC:addCycleText("#me steht in einer Wolke übler Gerüche", "#me stands in a cloud of bad smells");
talkingNPC:addCycleText("#me trocknet einen Krug mit einem Drecklappen", "#me dries a mug with a dirty rag");
talkingNPC:addCycleText("#me klaubt sich Krümel aus dem Bart", "#me picks crumbs out of his beard");
talkingNPC:addCycleText("#me pustet den Staub aus einem Bierkrug", "#me blows dust out of a mug");
talkingNPC:addCycleText("#me reisst sich Haare aus der Nase", "#me picks hair out of his nose");
talkingNPC:addCycleText("Von den blauen Wellen kommen wir!... unser Käpt'n iss so blöd wie wir!... an den Rudern unsrer Boote, krieg'n wir Blasen anner Pfote.... von den blauen Wellen kommen wir!...", "oh beat the drum slowly, an' play the flute only, as they carry me along... cause I'm a young pirate, an' I surely done wrong...");
talkingNPC:addCycleText("#me riecht nach vergammeltem Fleisch und feuchtem Schafsfell", "#me smells of putrefied meat and wet sheepskin");
talkingNPC:addCycleText("#me kratzt sich abwesend unterm Kilt", "#me scratches himself below his kilt absently");
talkingNPC:addCycleText("#me sieht sich gelangweilt um", "#me looks around bored");
talkingNPC:addCycleText("#me trocknet sich mit dem Geschirrtuch unter den Achseln", "#me dries his armpits with the dishrag");
talkingNPC:addCycleText("#me's Atem riecht nach schalem Bier", "#me's breath smells of stale beer");
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
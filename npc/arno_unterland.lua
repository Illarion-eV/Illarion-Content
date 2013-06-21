--------------------------------------------------------------------------------
-- NPC Name: Arno Unterland                                           Galmair --
-- NPC Job:  counterfeiter                                                    --
--                                                                            --
-- NPC Race: human                      NPC Position:  252, 298, -6           --
-- NPC Sex:  male                       NPC Direction: south                  --
--                                                                            --
-- Author:   envi                                                             --
--                                                Illarion easyNPC Editor 1.02 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (0, 252, 298, -6, 4, 'Arno Unterland', 'npc.arno_unterland', 0, 6, 0, 0, 0, 0, 232, 232, 232);
---]]

require("npc.base.basic")
require("npc.base.condition.chance")
require("npc.base.condition.language")
require("npc.base.condition.money")
require("npc.base.condition.quest")
require("npc.base.condition.rank")
require("npc.base.condition.talkmode")
require("npc.base.condition.town")
require("npc.base.consequence.inform")
require("npc.base.consequence.money")
require("npc.base.consequence.quest")
require("npc.base.consequence.rankpoints")
require("npc.base.talk")
module("npc.arno_unterland", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Arno Unterland the counterfeiter. Keywords: counterfeit, rank, document, service."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Arno Unterland der Fälscher. Schlüsselwörter: Fälschen, Rang, Dokument, Service."));
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
talkEntry:addResponse("Welcome! Interested in a higher rank of your town?");
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
talkEntry:addResponse("Willkommen! Interessiert an einen höhren Rang?.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Welcome! Interested in a higher rank of your town?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Willkommen! Interessiert an einen höhren Rang?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Farewell!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Lebt wohl!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Farewell!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Lebt wohl!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("#w Psst. Very good, haven't get caught yet counterfeiting documents.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befind");
talkEntry:addResponse("#w Psst. Sehr gut, ich wurde immer noch nicht erwischt beim Fälschen von Dokumenten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("#w Psst. Arno Unterland, famous for counterfeiting documents. *grins*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ihr name");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("#w Psst. Arno Unterland, berühmt für das Fälschen von Dokumenten. *grinst*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("sell");
talkEntry:addTrigger("wares");
talkEntry:addTrigger("price");
talkEntry:addTrigger("trade");
talkEntry:addResponse("#w Psst. I sell counterfeited documents. Interested? Say 'deal' and I will help you to the next rank of your town. Say 'counterfeit' and I provide you with more details.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("verkauf");
talkEntry:addTrigger("waren");
talkEntry:addTrigger("preis");
talkEntry:addTrigger("Handel");
talkEntry:addResponse("#w Psst. Ich verkaufe gefälschte Dokumente. Interessiert? Sagt 'Deal' und ich werde euch zum nächsten Rang eurer Stadt verhelfen. Sagt 'Fälschung' und ich werde euch in die Details einweihen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("buy");
talkEntry:addTrigger("purchase");
talkEntry:addResponse("#w Psst. I do not buy anything but I sell counterfeited documents. Interested? Say 'deal' and I will 'promote' you to the next rank of your town. Say 'counterfeit' and I provide you with more details.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("kauf");
talkEntry:addTrigger("erwerb");
talkEntry:addResponse("#w Psst. Ich kaufe gar nichts, sondern fälsche Dokumente. Interessiert? Sagt 'Deal' und ich werde euch zum nächsten Rang eurer Stadt verhelfen. Sagt 'Fälschung' und ich werde euch in die Details einweihen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("#w Psst, I counterfeit documents. Interested? Say 'deal' and I will 'promote' you to the next rank of your town. Say 'counterfeit' and I provide you with more details.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("#w Psst, ich fälsche Dokumente. Interessiert? Sagt 'Deal' und ich werde euch zum nächsten Rang eurer Stadt verhelfen. Sagt 'Fälschung' und ich werde euch in die Details einweihen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("#w Psst, I counterfeit documents. Interested? Say 'deal' and I will 'promote' you to the next rank of your town. Say 'counterfeit' and I provide you with more details.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("#w Psst, ich fälsche Dokumente. Interessiert? Sagt 'Deal' und ich werde euch zum nächsten Rang eurer Stadt verhelfen. Sagt 'Fälschung' und ich werde euch in die Details einweihen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("#w Psst, I counterfeit documents. Interested? Say 'deal' and I will 'promote' you to the next rank of your town. Say 'counterfeit' and I provide you with more details.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("#w Psst, ich fälsche Dokumente. Interessiert? Sagt 'Deal' und ich werde euch zum nächsten Rang eurer Stadt verhelfen. Sagt 'Fälschung' und ich werde euch in die Details einweihen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("document");
talkEntry:addTrigger("rank");
talkEntry:addResponse("#w I can help you to get a higher rank in your town by counterfeiting your documents. If you are interested, ask silently for 'counterfeit'.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dokument");
talkEntry:addTrigger("rang");
talkEntry:addResponse("#w Ich kann euch dabei helfen einen höheren Rang in eurer Stadt zu erhalten durch die Fälschung eurer Dokumente. Falls ihr interessiert seid, fragt leise nach 'Fälschung'.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("service");
talkEntry:addResponse("#w I can help you to get a higher rank in your town by counterfeiting your documents. If you are interested, ask silently for 'counterfeit'.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("service");
talkEntry:addResponse("#w Ich kann euch dabei helfen einen höheren Rang in eurer Stadt zu erhalten durch die Fälschung eurer Dokumente. Falls ihr interessiert seid, fragt leise nach 'Fälschung'.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.talkmode.talkmode("say"));
talkEntry:addTrigger("counterfeit");
talkEntry:addResponse("What is that? I do not know what you are talking about *mutters 'Not so loud. Wisper! Not everybody needs to know it.'*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.talkmode.talkmode("say"));
talkEntry:addTrigger("Fälsch");
talkEntry:addResponse("Was soll das sein? Ich habe keine Ahnung, was ihr da meint. *murmelt 'Nicht so laut. Flüstert! Nicht jeder braucht es zu wissen.'*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.talkmode.talkmode("yell"));
talkEntry:addTrigger("counterfeit");
talkEntry:addResponse("What is that? I do not know what you are talking about *mutters 'Not so loud. Wisper! Not everybody needs to know it.'*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.talkmode.talkmode("yell"));
talkEntry:addTrigger("Fälsch");
talkEntry:addResponse("Was soll das sein? Ich habe keine Ahnung, was ihr da meint. *murmelt 'Nicht so laut. Flüstert! Nicht jeder braucht es zu wissen.'*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank("<", 1));
talkEntry:addCondition(npc.base.condition.talkmode.talkmode("whisper"));
talkEntry:addTrigger("counterfeit");
talkEntry:addResponse("#w Do you want to get the next rank for only 50 goldcoins? Say 'deal' and consider it as done.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank("<", 1));
talkEntry:addCondition(npc.base.condition.talkmode.talkmode("whisper"));
talkEntry:addTrigger("Fälsch");
talkEntry:addResponse("#w Ihr wollt den nächsten Rang für nur 50 Goldmünzen haben? Sagt 'deal' und ihr könnt es als erledigt ansehen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank("<", 2));
talkEntry:addCondition(npc.base.condition.rank.rank(">", 0));
talkEntry:addCondition(npc.base.condition.talkmode.talkmode("whisper"));
talkEntry:addTrigger("counterfeit");
talkEntry:addResponse("#w Do you want to get the next rank for only 100 goldcoins? Say 'deal' and consider it as done.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank("<", 2));
talkEntry:addCondition(npc.base.condition.rank.rank(">", 0));
talkEntry:addCondition(npc.base.condition.talkmode.talkmode("whisper"));
talkEntry:addTrigger("Fälsch");
talkEntry:addResponse("#w Ihr wollt den nächsten Rang für nur 100 Goldmünzen haben? Sagt 'deal' und ihr könnt es als erledigt ansehen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank("<", 3));
talkEntry:addCondition(npc.base.condition.rank.rank(">", 1));
talkEntry:addCondition(npc.base.condition.talkmode.talkmode("whisper"));
talkEntry:addTrigger("counterfeit");
talkEntry:addResponse("#w Do you want to get the next rank for only 150 goldcoins? Say 'deal' and consider it as done.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank("<", 3));
talkEntry:addCondition(npc.base.condition.rank.rank(">", 1));
talkEntry:addCondition(npc.base.condition.talkmode.talkmode("whisper"));
talkEntry:addTrigger("Fälsch");
talkEntry:addResponse("#w Ihr wollt den nächsten Rang für nur 150 Goldmünzen haben? Sagt 'deal' und ihr könnt es als erledigt ansehen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank("<", 4));
talkEntry:addCondition(npc.base.condition.rank.rank(">", 2));
talkEntry:addCondition(npc.base.condition.talkmode.talkmode("whisper"));
talkEntry:addTrigger("counterfeit");
talkEntry:addResponse("#w Do you want to get the next rank for only 200 goldcoins? Say 'deal' and consider it as done.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank("<", 4));
talkEntry:addCondition(npc.base.condition.rank.rank(">", 2));
talkEntry:addCondition(npc.base.condition.talkmode.talkmode("whisper"));
talkEntry:addTrigger("Fälsch");
talkEntry:addResponse("#w Ihr wollt den nächsten Rang für nur 200 Goldmünzen haben? Sagt 'deal' und ihr könnt es als erledigt ansehen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank("<", 5));
talkEntry:addCondition(npc.base.condition.rank.rank(">", 3));
talkEntry:addCondition(npc.base.condition.talkmode.talkmode("whisper"));
talkEntry:addTrigger("counterfeit");
talkEntry:addResponse("#w Do you want to get the next rank for only 250 goldcoins? Say 'deal' and consider it as done.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank("<", 5));
talkEntry:addCondition(npc.base.condition.rank.rank(">", 3));
talkEntry:addCondition(npc.base.condition.talkmode.talkmode("whisper"));
talkEntry:addTrigger("Fälsch");
talkEntry:addResponse("#w Ihr wollt den nächsten Rang für nur 250 Goldmünzen haben? Sagt 'deal' und ihr könnt es als erledigt ansehen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank("<", 6));
talkEntry:addCondition(npc.base.condition.rank.rank(">", 4));
talkEntry:addCondition(npc.base.condition.talkmode.talkmode("whisper"));
talkEntry:addTrigger("counterfeit");
talkEntry:addResponse("#w Do you want to get the next rank for only 300 goldcoins? Say 'deal' and consider it as done.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank("<", 6));
talkEntry:addCondition(npc.base.condition.rank.rank(">", 4));
talkEntry:addCondition(npc.base.condition.talkmode.talkmode("whisper"));
talkEntry:addTrigger("Fälsch");
talkEntry:addResponse("#w Ihr wollt den nächsten Rang für nur 300 Goldmünzen haben? Sagt 'deal' und ihr könnt es als erledigt ansehen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank("<", 7));
talkEntry:addCondition(npc.base.condition.rank.rank(">", 5));
talkEntry:addCondition(npc.base.condition.talkmode.talkmode("whisper"));
talkEntry:addTrigger("counterfeit");
talkEntry:addResponse("#w Do you want to get the next rank for only 400 goldcoins? Say 'deal' and consider it as done.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank("<", 7));
talkEntry:addCondition(npc.base.condition.rank.rank(">", 5));
talkEntry:addCondition(npc.base.condition.talkmode.talkmode("whisper"));
talkEntry:addTrigger("Fälsch");
talkEntry:addResponse("#w Ihr wollt den nächsten Rang für nur 400 Goldmünzen haben? Sagt 'deal' und ihr könnt es als erledigt ansehen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 6));
talkEntry:addCondition(npc.base.condition.talkmode.talkmode("whisper"));
talkEntry:addTrigger("counterfeit");
talkEntry:addResponse("#w I am sorry but I cannot do anything for you. In your case they would easily find out what we are doing here.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 6));
talkEntry:addCondition(npc.base.condition.talkmode.talkmode("whisper"));
talkEntry:addTrigger("Fälsch");
talkEntry:addResponse("#w Es tut mir leid aber ich kann nichts für euch tun. In eurem Fall würde es sehr leicht auffallen was wir hier machen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.talkmode.talkmode("say"));
talkEntry:addTrigger("deal");
talkEntry:addResponse("#w Whisper! Can't believe it.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.talkmode.talkmode("say"));
talkEntry:addTrigger("deal");
talkEntry:addResponse("#w Flüstert! Darf doch nicht wahr sein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.talkmode.talkmode("yell"));
talkEntry:addTrigger("deal");
talkEntry:addResponse("#w Whisper! Can't believe it.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.talkmode.talkmode("yell"));
talkEntry:addTrigger("deal");
talkEntry:addResponse("#w Flüstert! Darf doch nicht wahr sein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(614, "~=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.talkmode.talkmode("whisper"));
talkEntry:addTrigger("deal");
talkEntry:addResponse("#w Wait, I think the last time we modified your documents was too recently. Let's wait for more time. I will send you a dove when it should work.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(614, "~=", 0));
talkEntry:addCondition(npc.base.condition.talkmode.talkmode("whisper"));
talkEntry:addTrigger("deal");
talkEntry:addResponse("#w Wartet. Ich denke, das letzte Mal, dass wir eure Dokumente modifiziert haben, ist noch nicht allzu lange her. Lasst uns noch ein wenig warten. Ich werde euch eine Taube zukommen lassen sobald es funktionieren sollte.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 6));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.talkmode.talkmode("whisper"));
talkEntry:addTrigger("deal");
talkEntry:addResponse("#w I am sorry but I cannot do anything for you. In your case they would easily find out what we are doing here.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 6));
talkEntry:addCondition(npc.base.condition.talkmode.talkmode("whisper"));
talkEntry:addTrigger("deal");
talkEntry:addResponse("#w Es tut mir leid aber ich kann nichts für euch tun. In eurem Fall würde es sehr leicht auffallen was wir hier machen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("<", 500000));
talkEntry:addCondition(npc.base.condition.rank.rank("<", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.talkmode.talkmode("whisper"));
talkEntry:addTrigger("deal");
talkEntry:addResponse("#w You need to bring more money. I want to have 50 goldcoins.  Otherwise I do not do it for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("<", 500000));
talkEntry:addCondition(npc.base.condition.rank.rank("<", 1));
talkEntry:addCondition(npc.base.condition.talkmode.talkmode("whisper"));
talkEntry:addTrigger("deal");
talkEntry:addResponse("#w Ihr müsst mehr Geld mitbringen. Ich möchte 50 Goldmünzen für meinen Service haben.  Ansonsten mache ich es nicht für euch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("<", 1000000));
talkEntry:addCondition(npc.base.condition.rank.rank("<", 2));
talkEntry:addCondition(npc.base.condition.rank.rank(">", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.talkmode.talkmode("whisper"));
talkEntry:addTrigger("deal");
talkEntry:addResponse("#w You need to bring more money. I want to have 100 goldcoins.  Otherwise I do not do it for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("<", 1000000));
talkEntry:addCondition(npc.base.condition.rank.rank("<", 2));
talkEntry:addCondition(npc.base.condition.rank.rank(">", 0));
talkEntry:addCondition(npc.base.condition.talkmode.talkmode("whisper"));
talkEntry:addTrigger("deal");
talkEntry:addResponse("#w Ihr müsst mehr Geld mitbringen. Ich möchte 100 Goldmünzen für meinen Service haben.  Ansonsten mache ich es nicht für euch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("<", 1500000));
talkEntry:addCondition(npc.base.condition.rank.rank("<", 3));
talkEntry:addCondition(npc.base.condition.rank.rank(">", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.talkmode.talkmode("whisper"));
talkEntry:addTrigger("deal");
talkEntry:addResponse("#w You need to bring more money. I want to have 150 goldcoins.  Otherwise I do not do it for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("<", 1500000));
talkEntry:addCondition(npc.base.condition.rank.rank("<", 3));
talkEntry:addCondition(npc.base.condition.rank.rank(">", 1));
talkEntry:addCondition(npc.base.condition.talkmode.talkmode("whisper"));
talkEntry:addTrigger("deal");
talkEntry:addResponse("#w Ihr müsst mehr Geld mitbringen. Ich möchte 150 Goldmünzen für meinen Service haben.  Ansonsten mache ich es nicht für euch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("<", 2000000));
talkEntry:addCondition(npc.base.condition.rank.rank("<", 4));
talkEntry:addCondition(npc.base.condition.rank.rank(">", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.talkmode.talkmode("whisper"));
talkEntry:addTrigger("deal");
talkEntry:addResponse("#w You need to bring more money. I want to have 200 goldcoins.  Otherwise I do not do it for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("<", 2000000));
talkEntry:addCondition(npc.base.condition.rank.rank("<", 4));
talkEntry:addCondition(npc.base.condition.rank.rank(">", 2));
talkEntry:addCondition(npc.base.condition.talkmode.talkmode("whisper"));
talkEntry:addTrigger("deal");
talkEntry:addResponse("#w Ihr müsst mehr Geld mitbringen. Ich möchte 200 Goldmünzen für meinen Service haben.  Ansonsten mache ich es nicht für euch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("<", 2500000));
talkEntry:addCondition(npc.base.condition.rank.rank("<", 5));
talkEntry:addCondition(npc.base.condition.rank.rank(">", 3));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.talkmode.talkmode("whisper"));
talkEntry:addTrigger("deal");
talkEntry:addResponse("#w You need to bring more money. I want to have 250 goldcoins.  Otherwise I do not do it for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("<", 2500000));
talkEntry:addCondition(npc.base.condition.rank.rank("<", 5));
talkEntry:addCondition(npc.base.condition.rank.rank(">", 3));
talkEntry:addCondition(npc.base.condition.talkmode.talkmode("whisper"));
talkEntry:addTrigger("deal");
talkEntry:addResponse("#w Ihr müsst mehr Geld mitbringen. Ich möchte 250 Goldmünzen für meinen Service haben.  Ansonsten mache ich es nicht für euch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("<", 3000000));
talkEntry:addCondition(npc.base.condition.rank.rank("<", 6));
talkEntry:addCondition(npc.base.condition.rank.rank(">", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.talkmode.talkmode("whisper"));
talkEntry:addTrigger("deal");
talkEntry:addResponse("#w You need to bring more money. I want to have 300 goldcoins.  Otherwise I do not do it for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("<", 3000000));
talkEntry:addCondition(npc.base.condition.rank.rank("<", 6));
talkEntry:addCondition(npc.base.condition.rank.rank(">", 4));
talkEntry:addCondition(npc.base.condition.talkmode.talkmode("whisper"));
talkEntry:addTrigger("deal");
talkEntry:addResponse("#w Ihr müsst mehr Geld mitbringen. Ich möchte 300 Goldmünzen für meinen Service haben.  Ansonsten mache ich es nicht für euch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("<", 4000000));
talkEntry:addCondition(npc.base.condition.rank.rank("<", 7));
talkEntry:addCondition(npc.base.condition.rank.rank(">", 5));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.talkmode.talkmode("whisper"));
talkEntry:addTrigger("deal");
talkEntry:addResponse("#w You need to bring more money. I want to have 400 goldcoins. Otherwise I do not do it for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("<", 4000000));
talkEntry:addCondition(npc.base.condition.rank.rank("<", 7));
talkEntry:addCondition(npc.base.condition.rank.rank(">", 5));
talkEntry:addCondition(npc.base.condition.talkmode.talkmode("whisper"));
talkEntry:addTrigger("deal");
talkEntry:addResponse("#w Ihr müsst mehr Geld mitbringen. Ich möchte 400 Goldmünzen für meinen Service haben. Ansonsten mache ich es nicht für euch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(0));
talkEntry:addCondition(npc.base.condition.talkmode.talkmode("whisper"));
talkEntry:addTrigger("deal");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 500000));
talkEntry:addConsequence(npc.base.consequence.quest.quest(614, "=", 500));
talkEntry:addResponse("#w 50 goldcoins and I got you, hobo. Did you forget that you do not have ranks over there at the Hemp Necktie Inn? He, he.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.town.town(0));
talkEntry:addCondition(npc.base.condition.talkmode.talkmode("whisper"));
talkEntry:addTrigger("deal");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 500000));
talkEntry:addConsequence(npc.base.consequence.quest.quest(614, "=", 500));
talkEntry:addResponse("#w 50 Goldmünzen und ich hab dich, Penner. Hast du vergessen, dass ihr keine Ränge da drüben beim Gasthof zur Hanfschlinge habt? He, he.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank("<", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.talkmode.talkmode("whisper"));
talkEntry:addTrigger("deal");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 500000));
talkEntry:addConsequence(npc.base.consequence.quest.quest(614, "=", 500));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 100));
talkEntry:addResponse("#w 50 goldcoins and there we go, my friend. I hope we see each other soon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank("<", 1));
talkEntry:addCondition(npc.base.condition.talkmode.talkmode("whisper"));
talkEntry:addTrigger("deal");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 500000));
talkEntry:addConsequence(npc.base.consequence.quest.quest(614, "=", 500));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 100));
talkEntry:addResponse("#w 50 Goldmünzen und ist es schon passiert. Ich hoffe wir sehen uns bald wieder.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank("<", 2));
talkEntry:addCondition(npc.base.condition.rank.rank(">", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.talkmode.talkmode("whisper"));
talkEntry:addTrigger("deal");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 1000000));
talkEntry:addConsequence(npc.base.consequence.quest.quest(614, "=", 500));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 100));
talkEntry:addResponse("#w 100 goldcoins and there we go. I hope we see each other soon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank("<", 2));
talkEntry:addCondition(npc.base.condition.rank.rank(">", 0));
talkEntry:addCondition(npc.base.condition.talkmode.talkmode("whisper"));
talkEntry:addTrigger("deal");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 1000000));
talkEntry:addConsequence(npc.base.consequence.quest.quest(614, "=", 500));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 100));
talkEntry:addResponse("#w 100 Goldmünzen und schon ist es passiert. Ich hoffe wir sehen uns bald wieder.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank("<", 3));
talkEntry:addCondition(npc.base.condition.rank.rank(">", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.talkmode.talkmode("whisper"));
talkEntry:addTrigger("deal");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 1500000));
talkEntry:addConsequence(npc.base.consequence.quest.quest(614, "=", 500));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 100));
talkEntry:addResponse("#w 150 goldcoins and there we go. I hope we see each other soon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank("<", 3));
talkEntry:addCondition(npc.base.condition.rank.rank(">", 1));
talkEntry:addCondition(npc.base.condition.talkmode.talkmode("whisper"));
talkEntry:addTrigger("deal");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 1500000));
talkEntry:addConsequence(npc.base.consequence.quest.quest(614, "=", 500));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 100));
talkEntry:addResponse("#w 150 Goldmünzen und schon ist es passiert. Ich hoffe wir sehen uns bald wieder.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank("<", 4));
talkEntry:addCondition(npc.base.condition.rank.rank(">", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.talkmode.talkmode("whisper"));
talkEntry:addTrigger("deal");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 2000000));
talkEntry:addConsequence(npc.base.consequence.quest.quest(614, "=", 500));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 100));
talkEntry:addResponse("#w 200 goldcoins and there we go. I hope we see each other soon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank("<", 4));
talkEntry:addCondition(npc.base.condition.rank.rank(">", 2));
talkEntry:addCondition(npc.base.condition.talkmode.talkmode("whisper"));
talkEntry:addTrigger("deal");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 2000000));
talkEntry:addConsequence(npc.base.consequence.quest.quest(614, "=", 500));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 100));
talkEntry:addResponse("#w 200 Goldmünzen und schon ist es passiert. Ich hoffe wir sehen uns bald wieder.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank("<", 5));
talkEntry:addCondition(npc.base.condition.rank.rank(">", 3));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.talkmode.talkmode("whisper"));
talkEntry:addTrigger("deal");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 2500000));
talkEntry:addConsequence(npc.base.consequence.quest.quest(614, "=", 500));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 100));
talkEntry:addResponse("#w 250 goldcoins and there we go. I hope we see each other soon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank("<", 5));
talkEntry:addCondition(npc.base.condition.rank.rank(">", 3));
talkEntry:addCondition(npc.base.condition.talkmode.talkmode("whisper"));
talkEntry:addTrigger("deal");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 2500000));
talkEntry:addConsequence(npc.base.consequence.quest.quest(614, "=", 500));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 100));
talkEntry:addResponse("#w 250 Goldmünzen und schon ist es passiert. Ich hoffe wir sehen uns bald wieder.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank("<", 6));
talkEntry:addCondition(npc.base.condition.rank.rank(">", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.talkmode.talkmode("whisper"));
talkEntry:addTrigger("deal");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 3000000));
talkEntry:addConsequence(npc.base.consequence.quest.quest(614, "=", 500));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 100));
talkEntry:addResponse("#w 300 goldcoins and there we go. I hope we see each other soon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank("<", 6));
talkEntry:addCondition(npc.base.condition.rank.rank(">", 4));
talkEntry:addCondition(npc.base.condition.talkmode.talkmode("whisper"));
talkEntry:addTrigger("deal");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 3000000));
talkEntry:addConsequence(npc.base.consequence.quest.quest(614, "=", 500));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 100));
talkEntry:addResponse("#w 300 Goldmünzen und schon ist es passiert. Ich hoffe wir sehen uns bald wieder.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank("<", 7));
talkEntry:addCondition(npc.base.condition.rank.rank(">", 5));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.talkmode.talkmode("whisper"));
talkEntry:addTrigger("deal");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 4000000));
talkEntry:addConsequence(npc.base.consequence.quest.quest(614, "=", 500));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 100));
talkEntry:addResponse("#w 400 goldcoins and there we go. Unfortunatelly, I cannot help you in the future. It would be to risky.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank("<", 7));
talkEntry:addCondition(npc.base.condition.rank.rank(">", 5));
talkEntry:addCondition(npc.base.condition.talkmode.talkmode("whisper"));
talkEntry:addTrigger("deal");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 4000000));
talkEntry:addConsequence(npc.base.consequence.quest.quest(614, "=", 500));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 100));
talkEntry:addResponse("#w 400 Goldmünzen und schon ist es passiert. Leider kann ich euch in Zukunft nicht mehr helfen. Es wäre zu riskant.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("People like me prefer praying to only to one god. Ronagan.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Leute wie ich bevorzugen das Beten zu einem Gott. Ronagan.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("I hope he helps us that noone figures out what we are doing down here.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("Ich hoffe er hilft uns, dass niemand raus findet, was wir hier unten so treiben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("archmage");
talkEntry:addResponse("You should not tell him that you made some business with me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Ihr solltet ihm nicht mitteilen, dass du hier Geschäfte mit mir machst.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("You should not tell him that you made some business with me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Ihr solltet ihm nicht mitteilen, dass du hier Geschäfte mit mir machst.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addResponse("Do you really care about him?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Interessiert ihr euch wirklich für ihn?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Do you really care about him?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Interessiert ihr euch wirklich für ihn?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Runewick? If you want to become Docent, I can help you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Runewick? Wenn ihr Dozent oder Dozentin werden möchtet, dann kann ich euch dabei helfen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("I pay him a big amount in order to be able to offer you my service down here.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Ich zahle ihm eine große Summe, damit ich euch meinen Service hier unten anbieten kann.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Do you really care about him?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Interessiert ihr euch wirklich für ihn?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Galmair? If you want to become Patrician, I can help you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Galmair? Wenn ihr Patrizier oder Patrizierin werden möchtet, dann kann ich euch dabei helfen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("Queen");
talkEntry:addResponse("You should not tell her that you made some business with me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("Königin");
talkEntry:addResponse("Ihr solltet ihr nicht mitteilen, dass du hier Geschäfte mit mir machst.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("You should not tell her that you made some business with me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Ihr solltet ihr nicht mitteilen, dass du hier Geschäfte mit mir machst.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Queen");
talkEntry:addResponse("Do you really care about her?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königin");
talkEntry:addResponse("Interessiert ihr euch wirklich für sie?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Do you really care about her?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Interessiert ihr euch wirklich für sie?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Cadomyr? If you want to become Baron or Baroness, I can help you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Cadomyr? Wenn ihr Baron oder Baronin werden möchtet, dann kann ich euch dabei helfen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("#w Psst, nice name. To your information. I counterfeit documents. Interested? Say 'deal' and I will 'promote' you to the next rank of your town. Say 'counterfeit' and I provide you with more details.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("#w Psst, netter Name. Zu euer Information. Ich fälsche Dokumente. Interessiert? Sagt 'Deal' und ich werde euch zum nächsten Rang eurer Stadt verhelfen. Sagt 'Fälschung' und ich werde euch in die Details einweihen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Arno");
talkEntry:addTrigger("Unterland");
talkEntry:addResponse("This is my name. Do you want my service?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Arno");
talkEntry:addTrigger("Unterland");
talkEntry:addResponse("Das ist mein Name. Wünscht ihr meinen Service");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("So, then show me your documents.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("Dann zeigt mir mal eure Dokumente.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("Well, but do not tell it anyone else.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("Schon gut, aber nichts weitersagen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("#w Psst, I counterfeit documents. Interested? Say 'deal' and I will 'promote' you to the next rank of your town. Say 'counterfeit' and I provide you with more details.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("#w Psst, ich fälsche Dokumente. Interessiert? Sagt 'Deal' und ich werde euch zum nächsten Rang eurer Stadt verhelfen. Sagt 'Fälschung' und ich werde euch in die Details einweihen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("Wer benötigt Sicherheitskopien ihrer Dokumente.", "Who needs a backup copy of her documents?");
talkingNPC:addCycleText("Wer benötigt Sicherheitskopien seiner Dokumente.", "Who needs a backup copy of his documents?");
talkingNPC:addCycleText("#me schaut herum, bevor er weiter schreibt.", "#me looks around before he continues to write.");
talkingNPC:addCycleText("#me zählt die Münzen auf seinem Tisch.", "#me counts his coins on his table.");
talkingNPC:addCycleText("#me beobachtet die Anwesenden.", " observers the audience.");
talkingNPC:addCycleText("#me isst von seinem Wurstteller.", "#me eats from his plate with sausages.");
talkingNPC:addCycleText("#me stappelt seine Pergamentrollen.", "#me piles up his pells.");
talkingNPC:addCycleText("Zu mir, wer eine Sicherheitskopie benötigt.", "To me, if you need a backup copy.");
talkingNPC:addCycleText("#me murmelt zu ihm selbst.", "#me mutters to himself.");
talkingNPC:addCycleText("Ob Galmair, ob Cadomyr, ob Runewick...mich interessiert das nicht solange der Preis stimmt.", "#Whether Galmair, whether Cadomyr, whether Runewick...I don't care as long as you pay enough.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(1);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Dieser NPC ist Arno Unterland der Fälscher.", "This NPC is Arno Unterland the counterfeiter.");
mainNPC:setUseMessage("Fasst mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut verwirrt.", "#me looks around confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 819);
mainNPC:setEquipment(11, 2384);
mainNPC:setEquipment(5, 0);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 384);
mainNPC:setEquipment(9, 826);
mainNPC:setEquipment(10, 369);
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
--------------------------------------------------------------------------------
-- NPC Name: Frederik Silvereye                                       Galmair --
-- NPC Job:  Notary                                                           --
--                                                                            --
-- NPC Race: human                      NPC Position:  404, 263, 1            --
-- NPC Sex:  male                       NPC Direction: south                  --
--                                                                            --
-- Author:   Ardian                                                           --
--                                                Illarion easyNPC Editor 1.02 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (0, 404, 263, 1, 4, 'Frederik Silvereye', 'npc.frederik_silvereye', 0, 3, 5, 42, 20, 2, 245, 222, 179);
---]]

require("npc.base.basic")
require("npc.base.condition.chance")
require("npc.base.condition.language")
require("npc.base.condition.money")
require("npc.base.condition.quest")
require("npc.base.condition.rank")
require("npc.base.condition.sex")
require("npc.base.condition.town")
require("npc.base.consequence.inform")
require("npc.base.consequence.money")
require("npc.base.consequence.quest")
require("npc.base.consequence.town")
require("npc.base.consequence.trade")
require("npc.base.talk")
module("npc.frederik_silvereye", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Frederik Silvereye the notary. Keywords: 'become citizen','leave','give up citizenship', 'rank', 'licence'."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Frederik Silvereye der Notar. Schlüsselwörter: Bürger werden,,'verlassen','beende Bürgerstatus','Rang', 'Lizenz'."));
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
talkEntry:addResponse("Be greeted.");
talkEntry:addResponse("Greetings.");
talkEntry:addResponse("Good day.");
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
talkEntry:addResponse("Zum Gruße.");
talkEntry:addResponse("Seid gegrüßt.");
talkEntry:addResponse("Guten Tag.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Be greeted.");
talkEntry:addResponse("Greetings.");
talkEntry:addResponse("Good day.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Zum Gruße.");
talkEntry:addResponse("Seid gegrüßt.");
talkEntry:addResponse("Guten Tag.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Malachin with you.");
talkEntry:addResponse("Farewell.");
talkEntry:addResponse("Goodbye.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Malachin mit Euch.");
talkEntry:addResponse("Auf bald.");
talkEntry:addResponse("Bis bald.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Malachin with you.");
talkEntry:addResponse("Farewell.");
talkEntry:addResponse("Goodbye.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Malachin mit Euch.");
talkEntry:addResponse("Auf bald.");
talkEntry:addResponse("Bis bald.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("I'm fine, thank you for your concern.");
talkEntry:addResponse("I can't complain, even if some more action wouldn't be that bad.");
talkEntry:addResponse("Very good, and you?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befind");
talkEntry:addResponse("Mir geht es gut, danke der Nachfrage.");
talkEntry:addResponse("Ich kann nicht klagen, auch wenn ein bisschen mehr Abenteuer mal wieder nicht schlecht wäre.");
talkEntry:addResponse("Ganz gut, und euch?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("My name is Frederik Silvereye, I take care of the new arrivals in this place.");
talkEntry:addResponse("I'm Frederik Silvereye, I am the notary of Galmair.");
talkEntry:addResponse("You can call me Frederik Silvereye, as notary of this town I could put you on the citizen list of this beautiful place.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ihr name");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Mein Name ist Frederik Silvereye, ich kümmere mich um die Neuankömmlinge dieses Ortes.");
talkEntry:addResponse("Mein Name ist Frederik Silvereye, ich bin der Notar Galmairs.");
talkEntry:addResponse("Man nennt mich Frederik Silvereye, als Notar kann Ich euch zum Bürger unseres schönen Ortes eintragen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("become citizen");
talkEntry:addTrigger("gain citizenship");
talkEntry:addConsequence(npc.base.consequence.town.town("=", "3"));
talkEntry:addResponse("You are now a citizen of Galmair!");
talkEntry:addResponse("Welcome to Galmair!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("Bürger werden");
talkEntry:addTrigger("Bürgerschaft beantragen");
talkEntry:addConsequence(npc.base.consequence.town.town("=", "3"));
talkEntry:addResponse("Ihr seid jetzt Bürger von Galmair!");
talkEntry:addResponse("Willkommen in Galmair!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("become citizen");
talkEntry:addTrigger("gain citizenship");
talkEntry:addConsequence(npc.base.consequence.town.town("=", "3"));
talkEntry:addResponse("You are now a citizen of Galmair!");
talkEntry:addResponse("Welcome to Galmair!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("Bürger werden");
talkEntry:addTrigger("Bürgerschaft beantragen");
talkEntry:addConsequence(npc.base.consequence.town.town("=", "3"));
talkEntry:addResponse("Ihr seid jetzt Bürger von Galmair!");
talkEntry:addResponse("Willkommen in Galmair!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(0));
talkEntry:addTrigger("become citizen");
talkEntry:addTrigger("gain citizenship");
talkEntry:addConsequence(npc.base.consequence.town.town("=", "3"));
talkEntry:addResponse("You are now a citizen of Galmair!");
talkEntry:addResponse("Welcome to Galmair!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.town.town(0));
talkEntry:addTrigger("Bürger werden");
talkEntry:addTrigger("Bürgerschaft beantragen");
talkEntry:addConsequence(npc.base.consequence.town.town("=", "3"));
talkEntry:addResponse("Ihr seid jetzt Bürger von Galmair!");
talkEntry:addResponse("Willkommen in Galmair!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("become citizen");
talkEntry:addTrigger("gain citizenship");
talkEntry:addConsequence(npc.base.consequence.town.town("=", "3"));
talkEntry:addResponse("You are now a citizen of Galmair!");
talkEntry:addResponse("Welcome to Galmair!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bürger werden");
talkEntry:addTrigger("Bürgerschaft beantragen");
talkEntry:addConsequence(npc.base.consequence.town.town("=", "3"));
talkEntry:addResponse("Ihr seid jetzt Bürger von Galmair!");
talkEntry:addResponse("Willkommen in Galmair!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("become citizen");
talkEntry:addTrigger("gain citizenship");
talkEntry:addConsequence(npc.base.consequence.town.town("=", "3"));
talkEntry:addResponse("You are already a citizen of Galmair!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("Bürger werden");
talkEntry:addTrigger("Bürgerschaft beantragen");
talkEntry:addConsequence(npc.base.consequence.town.town("=", "3"));
talkEntry:addResponse("Ihr seid bereits Bürger von Galmair!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("give up citizenship");
talkEntry:addTrigger("terminating citizen ship");
talkEntry:addTrigger("leave");
talkEntry:addTrigger("leaving");
talkEntry:addConsequence(npc.base.consequence.quest.quest(208, "=", 1));
talkEntry:addResponse("Oh, you no longer want to be a citizen of Galmair?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("beende Bürgerstatus");
talkEntry:addTrigger("verlassen");
talkEntry:addTrigger("verlasse");
talkEntry:addTrigger("annuliere");
talkEntry:addConsequence(npc.base.consequence.quest.quest(208, "=", 1));
talkEntry:addResponse("Oh, Ihr wollt kein Büger in Galmair mehr sein?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(208, "=", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("yes");
talkEntry:addConsequence(npc.base.consequence.quest.quest(208, "=", 1));
talkEntry:addConsequence(npc.base.consequence.town.town("=", "0"));
talkEntry:addResponse("You are no longer a citizen of Galmair. Go elsewhere.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(208, "=", 1));
talkEntry:addTrigger("ja");
talkEntry:addConsequence(npc.base.consequence.quest.quest(208, "=", 1));
talkEntry:addConsequence(npc.base.consequence.town.town("=", "0"));
talkEntry:addResponse("Ihr seid nun kein Bürger Galmairs mehr. Sucht Euer Glück woanders.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(208, "=", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.quest.quest(208, "=", 0));
talkEntry:addResponse("Mhm... The Don will be pleased to hear that.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(208, "=", 1));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.quest.quest(208, "=", 0));
talkEntry:addResponse("Mhm, ... Der Don wird sich freuen, dies zu hören.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("welche Stadt");
talkEntry:addTrigger("welche faktion");
talkEntry:addResponse("Du gehörst nach %TOWN!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("which town");
talkEntry:addTrigger("which faction");
talkEntry:addResponse("You belong to %TOWN!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 9));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addCondition(npc.base.condition.sex.sex(0));
talkEntry:addTrigger("rank");
talkEntry:addResponse("Tycoon %CHARNAME, be welcome. It is truly an honour to see you!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 9));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addTrigger("rank");
talkEntry:addResponse("Tycoon %CHARNAME, be welcome. It is truly an honour to see you.!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 9));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addCondition(npc.base.condition.sex.sex(0));
talkEntry:addTrigger("rang");
talkEntry:addResponse(" Tycoon %CHARNAME! Seid willkommen. Wahrhaftig es ist eine Ehre Euch zu sehen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 9));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addTrigger("rang");
talkEntry:addResponse("Tycoon %CHARNAME! Seid willkommen. Wahrhaftig es ist eine Ehre Euch zu sehen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 8));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addCondition(npc.base.condition.sex.sex(0));
talkEntry:addTrigger("rank");
talkEntry:addResponse("Magnate, be welcome. It is an honour to see you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 8));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addTrigger("rank");
talkEntry:addResponse("Magnate, be welcome. It is an honour to see you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 8));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addCondition(npc.base.condition.sex.sex(0));
talkEntry:addTrigger("rang");
talkEntry:addResponse("Magnat, seid willkommen. Welch eine Ehre Euch zu sehen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 8));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addTrigger("rang");
talkEntry:addResponse("Magnatin, seid wilokmmen.Welch eine Ehre Euch zu sehen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 7));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addCondition(npc.base.condition.sex.sex(0));
talkEntry:addTrigger("rank");
talkEntry:addResponse("Mogul %CHARNAME! How can I help you?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 7));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addTrigger("rank");
talkEntry:addResponse("Mogul %CHARNAME! How can I help you?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 7));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addCondition(npc.base.condition.sex.sex(0));
talkEntry:addTrigger("rang");
talkEntry:addResponse("Mogul %CHARNAME! Was kann ich für Euch tun?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 7));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addTrigger("rang");
talkEntry:addResponse("Mogulin %CHARNAME! Was kann ich für Euch tun?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 6));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addCondition(npc.base.condition.sex.sex(0));
talkEntry:addTrigger("rank");
talkEntry:addResponse("Greetings to you, Patrician %CHARNAME!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 6));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addTrigger("rank");
talkEntry:addResponse("Greetings to you, Patrician %CHARNAME!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 6));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addCondition(npc.base.condition.sex.sex(0));
talkEntry:addTrigger("rang");
talkEntry:addResponse("Seid gegrüßt, Patrizier %CHARNAME!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 6));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addTrigger("rang");
talkEntry:addResponse("Seid gegrüßt, Patrizierin %CHARNAME!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 5));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addCondition(npc.base.condition.sex.sex(0));
talkEntry:addTrigger("rank");
talkEntry:addResponse("Greetings to you, Financier %CHARNAME!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 5));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addTrigger("rank");
talkEntry:addResponse("Greetings to you, Financier %CHARNAME!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 5));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addCondition(npc.base.condition.sex.sex(0));
talkEntry:addTrigger("rang");
talkEntry:addResponse("Seid gegrüßt, Finanzier %CHARNAME!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 5));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addTrigger("rang");
talkEntry:addResponse("Seid gegrüßt, Finanzier %CHARNAME!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addCondition(npc.base.condition.sex.sex(0));
talkEntry:addTrigger("rank");
talkEntry:addResponse("Greetings to you, Merchant!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addTrigger("rank");
talkEntry:addResponse("Greetings to you, Merchant!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 4));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addCondition(npc.base.condition.sex.sex(0));
talkEntry:addTrigger("rang");
talkEntry:addResponse("Kaufmann, seid gegrüßt!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 4));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addTrigger("rang");
talkEntry:addResponse("Kauffrau, seid gegrüßt!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 3));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addCondition(npc.base.condition.sex.sex(0));
talkEntry:addTrigger("rank");
talkEntry:addResponse("Grocer is what I'd call folks like you!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 3));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addTrigger("rank");
talkEntry:addResponse("Grocer is what I'd call folks like you!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 3));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addCondition(npc.base.condition.sex.sex(0));
talkEntry:addTrigger("rang");
talkEntry:addResponse("Leute wie dich würde ich Krämer nennen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 3));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addTrigger("rang");
talkEntry:addResponse("Leute wie dich würde ich Krämerin nennen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addCondition(npc.base.condition.sex.sex(0));
talkEntry:addTrigger("rank");
talkEntry:addResponse("What do you want, pedlar?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addTrigger("rank");
talkEntry:addResponse("What do you want, pedlar?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 2));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addCondition(npc.base.condition.sex.sex(0));
talkEntry:addTrigger("rang");
talkEntry:addResponse("Hausierer, was gibt?s?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 2));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addTrigger("rang");
talkEntry:addResponse("Hausiererin, was gibt?s?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addCondition(npc.base.condition.sex.sex(0));
talkEntry:addTrigger("rank");
talkEntry:addResponse("You are just an assistant. Got it?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addTrigger("rank");
talkEntry:addResponse("You are just a assistant. Got it?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 1));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addCondition(npc.base.condition.sex.sex(0));
talkEntry:addTrigger("rang");
talkEntry:addResponse("Du bist bloß ein Gehilfe. Kapiert?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 1));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addTrigger("rang");
talkEntry:addResponse("Du bist bloß eine Gehilfin. Kapiert?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addCondition(npc.base.condition.sex.sex(0));
talkEntry:addTrigger("rank");
talkEntry:addResponse("You are new here. You are not well known. Make an effort and become rich, tramp!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addTrigger("rank");
talkEntry:addResponse("You are new here. You are not well known. Make an effort and become rich, tramp!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 0));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addCondition(npc.base.condition.sex.sex(0));
talkEntry:addTrigger("rang");
talkEntry:addResponse("Du bist noch ganz neu hier. Dich kennt kaum jemand. Streng dich mehr an und werde reich, du Rumtreiber!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 0));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addTrigger("rang");
talkEntry:addResponse("Du bist noch ganz neu hier. Dich kennt kaum jemand. Streng dich mehr an und werde reich Rumtreiber!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("licence");
talkEntry:addTrigger("license");
talkEntry:addResponse("There is no need for you to buy a licence, since you are a citizen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addCondition(npc.base.condition.sex.sex(0));
talkEntry:addTrigger("lizenz");
talkEntry:addResponse("Ihr benötigt keine Lizenz, da ihr Bürger dieser Stadt seid.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addTrigger("lizenz");
talkEntry:addResponse("Ihr benötigt keine Lizenz, da ihr Bürgerin dieser Stadt seid.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank("<", 100));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("licence");
talkEntry:addTrigger("license");
talkEntry:addResponse("You look as though you are quite new here, thus, you can currently use our tools for free.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank("<", 100));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("lizenz");
talkEntry:addResponse("Ihr wirkt als würdet ihr neu hier sein. Daher könnt ihr unsere Geräte zurzeit frei benutzen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("licence");
talkEntry:addTrigger("license");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Licence] You can choose between 'Alpha', 'Beta' and 'Gamma' licences. Alpha costs one gold coin and allow you to use the tools for one real time hour. Beta costs two gold coins for three real time hours. Gamma costs three gold coins for eight real time hours. Say the name of the type of licence you want in order to buy it. You can buy several at the same time. They will be added to each other."));
talkEntry:addResponse("I sell three kinds of licences. 'Alpha', 'Beta' and 'Gamma'. Alpha allows you to use our static tools for one hour and costs only one gold coin. Beta allows you to use our static tools for nine hours and costs only two gold coins. Gamma allows you to use our static tools for one day and costs only three gold coins. Which one do you want?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("lizenz");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Lizenz] Du kannst zwischen 'Alpha', 'Beta' und 'Gamma' wählen. Alpha kostet eine Goldmünze und erlaubt dir die Nutzung der Geräte für eine Echtzeit-Stunde. Beta kostet zwei Goldmünzen für vier Echtzeit-Stunden. Gamma kostet drei Goldmünzen für acht Echtzeit-Stunden. Sage den Namen des Typen, um zu bestellen. Du kannst mehrere gleichzeitig kaufen. Diese werden dann summiert."));
talkEntry:addResponse("Ich verkaufe drei Arten von Lizenzen. 'Alpha', 'Beta' und 'Gamma'. Mit Alpha ist es möglich, unsere Geräte für eine Stunde zu einem Preis von nur einer Goldmünze zu nutzen. Mit Beta ist es möglich, unsere Geräte für neun Stunden zu einem Preis von nur zwei Goldmünzen zu nutzen. Und mit Gamma ist es möglich, unsere Geräte für einen Tag zu einem Preis von nur drei Goldmünzen zu nutzen. Welche möchtet ihr?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("alpha");
talkEntry:addTrigger("beta");
talkEntry:addTrigger("gamma");
talkEntry:addResponse("There is no need for you to buy a licence, since you are a citizen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addCondition(npc.base.condition.sex.sex(0));
talkEntry:addTrigger("alpha");
talkEntry:addTrigger("beta");
talkEntry:addTrigger("gamma");
talkEntry:addResponse("Ihr benötigt keine Lizenz, da ihr Bürger dieser Stadt seid.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addTrigger("alpha");
talkEntry:addTrigger("beta");
talkEntry:addTrigger("gamma");
talkEntry:addResponse("Ihr benötigt keine Lizenz, da ihr Bürgerin dieser Stadt seid.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("<", 10000));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("alpha");
talkEntry:addResponse("You need more money in order to buy licence 'Alpha', one gold as a matter of fact.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("<", 10000));
talkEntry:addTrigger("alpha");
talkEntry:addResponse("Ihr benötigt mehr Geld, um Lizenz 'Alpha' zu kaufen. Eine Goldmünze, um genau zu sein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(813, ">", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("alpha");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Licence purchased] You bought licence 'Alpha' for one gold coin. You can use the static tools of this town for an additional three real time hours. The time has been added to your time left."));
talkEntry:addConsequence(npc.base.consequence.money.money("-", 10000));
talkEntry:addConsequence(npc.base.consequence.quest.quest(813, "+", 12));
talkEntry:addResponse("You are free to use our tools for an additional three hours.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(813, ">", 0));
talkEntry:addTrigger("alpha");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Lizenz erworben] Du hast die Lizenz 'Alpha' für eine Goldmünze erworben. Du kannst die Geräte dieser Stadt für weitere drei Echtzeit-Stunden frei benutzen. Die Stunden wurden zu deiner verbliebenen Zeit aufsummiert."));
talkEntry:addConsequence(npc.base.consequence.money.money("-", 10000));
talkEntry:addConsequence(npc.base.consequence.quest.quest(813, "+", 12));
talkEntry:addResponse("Euch ist es nun gestattet, unsere Geräte für weitere drei Stunden zu verwenden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("alpha");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Licence purchased] You bought licence 'Alpha' for a gold coin. You can use the static tools of this town for the next real time hour."));
talkEntry:addConsequence(npc.base.consequence.money.money("-", 10000));
talkEntry:addConsequence(npc.base.consequence.quest.quest(813, "+", 12));
talkEntry:addResponse("Wonderful, you are free to use our tools for the next three hours.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("alpha");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Lizenz erworben] Du hast die Lizenz 'Alpha' für eine Goldmünze erworben. Du kannst die Geräte dieser Stadt für die nächste Echtzeit-Stunde frei benutzen."));
talkEntry:addConsequence(npc.base.consequence.money.money("-", 10000));
talkEntry:addConsequence(npc.base.consequence.quest.quest(813, "+", 12));
talkEntry:addResponse("Wunderbar, euch ist es nun gestattet, unsere Geräte für die nächsten drei Stunden zu verwenden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("<", 20000));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("beta");
talkEntry:addResponse("You need more money in order to buy licence 'Beta', two gold coins as a matter of fact.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("<", 20000));
talkEntry:addTrigger("beta");
talkEntry:addResponse("Ihr benötigt mehr Geld, um Lizenz 'Beta' zu kaufen. Zwei Goldmünzen, um genau zu sein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(813, ">", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("beta");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Licence purchased] You bought licence 'Beta' for two gold coins. You can use the static tools of this town for an additional nine real time hours. The time has been added to your time left."));
talkEntry:addConsequence(npc.base.consequence.money.money("-", 20000));
talkEntry:addConsequence(npc.base.consequence.quest.quest(813, "+", 36));
talkEntry:addResponse("You are free to use our tools for an additional nine hours.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(813, ">", 0));
talkEntry:addTrigger("beta");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Lizenz erworben] Du hast die Lizenz 'Beta' für zwei Goldmünzen erworben. Du kannst die Geräte dieser Stadt für weitere drei Echtzeit-Stunden frei benutzen. Die Stunden wurden zu deiner verbliebenen Zeit aufsummiert."));
talkEntry:addConsequence(npc.base.consequence.money.money("-", 20000));
talkEntry:addConsequence(npc.base.consequence.quest.quest(813, "+", 36));
talkEntry:addResponse("Euch ist es nun gestattet, unsere Geräte für weitere neun Stunden zu verwenden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("beta");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Licence purchased] You bought licence 'Beta' for two gold coins. You can use the static tools of this town for the next three real time hours."));
talkEntry:addConsequence(npc.base.consequence.money.money("-", 20000));
talkEntry:addConsequence(npc.base.consequence.quest.quest(813, "+", 36));
talkEntry:addResponse("Wonderful, you are free to use our tools for the next nine hours.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beta");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Lizenz erworben] Du hast die Lizenz 'Beta' für zwei Goldmünzen erworben. Du kannst die Geräte dieser Stadt für die nächsten drei Echtzeit-Stunden frei benutzen."));
talkEntry:addConsequence(npc.base.consequence.money.money("-", 20000));
talkEntry:addConsequence(npc.base.consequence.quest.quest(813, "+", 36));
talkEntry:addResponse("Wunderbar, euch ist es nun gestattet, unsere Geräte für die nächsten neun Stunden zu verwenden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("<", 30000));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("gamma");
talkEntry:addResponse("You need more money in order to buy licence 'Gamma', three gold coins as a matter of fact.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("<", 30000));
talkEntry:addTrigger("gamma");
talkEntry:addResponse("Ihr benötigt mehr Geld, um Lizenz 'Gamma' zu kaufen. Drei Goldmünzen, um genau zu sein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(813, ">", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("gamma");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Licence purchased] You bought licence 'Gamma' for three gold coins. You can use the static tools of this town for an additional eight real time hours. The time has been added to your time left."));
talkEntry:addConsequence(npc.base.consequence.money.money("-", 30000));
talkEntry:addConsequence(npc.base.consequence.quest.quest(813, "+", 96));
talkEntry:addResponse("You are free to use our tools for an additional day.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(813, ">", 0));
talkEntry:addTrigger("gamma");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Lizenz erworben] Du hast die Lizenz 'Gamma' für drei Goldmünzen erworben. Du kannst die Geräte dieser Stadt für weitere acht Echtzeit-Stunden frei benutzen. Die Stunden wurden zu deiner verbliebenen Zeit aufsummiert."));
talkEntry:addConsequence(npc.base.consequence.money.money("-", 30000));
talkEntry:addConsequence(npc.base.consequence.quest.quest(813, "+", 96));
talkEntry:addResponse("Euch ist es nun gestattet, unsere Geräte für einen weiteren Tag zu verwenden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("gamma");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Licence purchased] You bought licence 'Gamma' for three gold coins. You can use the static tools of this town for the next eight real time hours."));
talkEntry:addConsequence(npc.base.consequence.money.money("-", 30000));
talkEntry:addConsequence(npc.base.consequence.quest.quest(813, "+", 96));
talkEntry:addResponse("Wonderful, you are free to use our tools for a day.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gamma");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Lizenz erworben] Du hast die Lizenz 'Gamma' für drei Goldmünzen erworben. Du kannst die Geräte dieser Stadt für die nächsten acht Echtzeit-Stunden frei benutzen."));
talkEntry:addConsequence(npc.base.consequence.money.money("-", 30000));
talkEntry:addConsequence(npc.base.consequence.quest.quest(813, "+", 96));
talkEntry:addResponse("Wunderbar, euch ist es nun gestattet, unsere Geräte für einen Tag zu verwenden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("At the moment I have everything, but thanks for asking.");
talkEntry:addResponse("Maybe another time, I already have everything I need.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Derzeit habe ich alles, aber danke für eure Sorge.");
talkEntry:addResponse("Vielleicht ein anderes mal, derzeit habe ich alles was ich brauche.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("I have no tasks for you right now, maybe another time.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Ich habe derzeit keine Aufgaben für Euch, vielleicht aber wann anders.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("I am the notary of Galmair and do all the stuff a notary does.");
talkEntry:addResponse("I take care of the new arrivals in Galmair, I am the notary here.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Ich bin der Notar Galmairs und tu all das was ein Notar so tut.");
talkEntry:addResponse("Ich kümmere mich um die Neuankömmlinge in Galmair, ich bin hier der Notar.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("I am the notary of Galmair and do all the stuff a notary does.");
talkEntry:addResponse("I take care of the new arrivals in Galmair, I am the notary here.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Ich bin der Notar Galmairs und tu all das was ein Notar so tut.");
talkEntry:addResponse("Ich kümmere mich um die Neuankömmlinge in Galmair, ich bin hier der Notar.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Never heard of that. Is it something to eat?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Nie davon gehört. Ist es etwas zu Essen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("It's a pleasure to meet you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Ich freu mich Euch kennenzulernen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("chair");
talkEntry:addResponse("I like my chair!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Stuhl");
talkEntry:addResponse("Ich mag meinen Stuhl!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("table");
talkEntry:addResponse("Don't walk on the table! You can't imagine what uncivilised people enter this house here.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tisch");
talkEntry:addResponse("Nicht auf dem Tisch laufen! Ihr könnte Euch nicht vorstellen was für unzivilisierte Leute dieses Haus betreten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addResponse("No comment.");
talkEntry:addResponse("I won't comment on that.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Kein Kommentar.");
talkEntry:addResponse("Dazu sage ich jetzt nichts.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("No comment.");
talkEntry:addResponse("I won't comment on that.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Kein Kommentar.");
talkEntry:addResponse("Dazu sage ich jetzt nichts.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("I won't comment on that.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Dazu sage ich jetzt nichts.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("No comment.");
talkEntry:addResponse("I won't comment on that.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Kein Kommentar.");
talkEntry:addResponse("Dazu sage ich jetzt nichts.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("That's the best place in Illarion.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Der beste Ort in Illarion.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Queen");
talkEntry:addResponse("No comment.");
talkEntry:addResponse("I won't comment on that.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königin");
talkEntry:addResponse("Kein Kommentar.");
talkEntry:addResponse("Dazu sage ich jetzt nichts.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("No comment.");
talkEntry:addResponse("I won't comment on that.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Kein Kommentar.");
talkEntry:addResponse("Dazu sage ich jetzt nichts.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("I won't comment on that.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Dazu sage ich jetzt nichts.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("albar");
talkEntry:addResponse("I heard this is a place far away, right?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("Der Ort soll recht weit weg sein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addResponse("I heard this is a place far away, right?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("Der Ort soll recht weit weg sein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("salkama");
talkEntry:addResponse("I heard this is a place far away, right?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Der Ort soll recht weit weg sein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("There are 16 gods. Five created Illarion. One god is evil.");
talkEntry:addResponse("Ask a priest if you want to know more about the gods. I'm just a notary.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Es gibt 16 Götter. Fünf schufen Illarion. Einer ist böse.");
talkEntry:addResponse("Fragt einen Priester wenn Ihr mehr wissen wollt. Ich bin bloß ein Notar.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Adron");
talkEntry:addResponse("There are 16 gods. Five created Illarion. One god is evil.");
talkEntry:addResponse("Ask a priest if you want to know more about the gods. I'm just a notary.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Adron");
talkEntry:addResponse("Es gibt 16 Götter. Fünf schufen Illarion. Einer ist böse.");
talkEntry:addResponse("Fragt einen Priester wenn Ihr mehr wissen wollt. Ich bin bloß ein Notar.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addResponse("There are 16 gods. Five created Illarion. One god is evil.");
talkEntry:addResponse("Ask a priest if you want to know more about the gods. I'm just a notary.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addResponse("Es gibt 16 Götter. Fünf schufen Illarion. Einer ist böse.");
talkEntry:addResponse("Fragt einen Priester wenn Ihr mehr wissen wollt. Ich bin bloß ein Notar.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cherga");
talkEntry:addResponse("There are 16 gods. Five created Illarion. One god is evil.");
talkEntry:addResponse("Ask a priest if you want to know more about the gods. I'm just a notary.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addResponse("Es gibt 16 Götter. Fünf schufen Illarion. Einer ist böse.");
talkEntry:addResponse("Fragt einen Priester wenn Ihr mehr wissen wollt. Ich bin bloß ein Notar.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elara");
talkEntry:addResponse("There are 16 gods. Five created Illarion. One god is evil.");
talkEntry:addResponse("Ask a priest if you want to know more about the gods. I'm just a notary.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elara");
talkEntry:addResponse("Es gibt 16 Götter. Fünf schufen Illarion. Einer ist böse.");
talkEntry:addResponse("Fragt einen Priester wenn Ihr mehr wissen wollt. Ich bin bloß ein Notar.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Eldan");
talkEntry:addResponse("There are 16 gods. Five created Illarion. One god is evil.");
talkEntry:addResponse("Ask a priest if you want to know more about the gods. I'm just a notary.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eldan");
talkEntry:addResponse("Es gibt 16 Götter. Fünf schufen Illarion. Einer ist böse.");
talkEntry:addResponse("Fragt einen Priester wenn Ihr mehr wissen wollt. Ich bin bloß ein Notar.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Findari");
talkEntry:addResponse("There are 16 gods. Five created Illarion. One god is evil.");
talkEntry:addResponse("Ask a priest if you want to know more about the gods. I'm just a notary.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Findari");
talkEntry:addResponse("Es gibt 16 Götter. Fünf schufen Illarion. Einer ist böse.");
talkEntry:addResponse("Fragt einen Priester wenn Ihr mehr wissen wollt. Ich bin bloß ein Notar.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("There are 16 gods. Five created Illarion. One god is evil.");
talkEntry:addResponse("Ask a priest if you want to know more about the gods. I'm just a notary.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("Es gibt 16 Götter. Fünf schufen Illarion. Einer ist böse.");
talkEntry:addResponse("Fragt einen Priester wenn Ihr mehr wissen wollt. Ich bin bloß ein Notar.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Moshran");
talkEntry:addResponse("There are 16 gods. Five created Illarion. One god is evil.");
talkEntry:addResponse("Ask a priest if you want to know more about the gods. I'm just a notary.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Moshran");
talkEntry:addResponse("Es gibt 16 Götter. Fünf schufen Illarion. Einer ist böse.");
talkEntry:addResponse("Fragt einen Priester wenn Ihr mehr wissen wollt. Ich bin bloß ein Notar.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addTrigger("Nargùn");
talkEntry:addResponse("There are 16 gods. Five created Illarion. One god is evil.");
talkEntry:addResponse("Ask a priest if you want to know more about the gods. I'm just a notary.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addTrigger("Nargùn");
talkEntry:addResponse("Es gibt 16 Götter. Fünf schufen Illarion. Einer ist böse.");
talkEntry:addResponse("Fragt einen Priester wenn Ihr mehr wissen wollt. Ich bin bloß ein Notar.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("There are 16 gods. Five created Illarion. One god is evil.");
talkEntry:addResponse("Ask a priest if you want to know more about the gods. I'm just a notary.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("Es gibt 16 Götter. Fünf schufen Illarion. Einer ist böse.");
talkEntry:addResponse("Fragt einen Priester wenn Ihr mehr wissen wollt. Ich bin bloß ein Notar.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("There are 16 gods. Five created Illarion. One god is evil.");
talkEntry:addResponse("Ask a priest if you want to know more about the gods. I'm just a notary.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("Es gibt 16 Götter. Fünf schufen Illarion. Einer ist böse.");
talkEntry:addResponse("Fragt einen Priester wenn Ihr mehr wissen wollt. Ich bin bloß ein Notar.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("There are 16 gods. Five created Illarion. One god is evil.");
talkEntry:addResponse("Ask a priest if you want to know more about the gods. I'm just a notary.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("Es gibt 16 Götter. Fünf schufen Illarion. Einer ist böse.");
talkEntry:addResponse("Fragt einen Priester wenn Ihr mehr wissen wollt. Ich bin bloß ein Notar.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("There are 16 gods. Five created Illarion. One god is evil.");
talkEntry:addResponse("Ask a priest if you want to know more about the gods. I'm just a notary.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("Es gibt 16 Götter. Fünf schufen Illarion. Einer ist böse.");
talkEntry:addResponse("Fragt einen Priester wenn Ihr mehr wissen wollt. Ich bin bloß ein Notar.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("There are 16 gods. Five created Illarion. One god is evil.");
talkEntry:addResponse("Ask a priest if you want to know more about the gods. I'm just a notary.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("Es gibt 16 Götter. Fünf schufen Illarion. Einer ist böse.");
talkEntry:addResponse("Fragt einen Priester wenn Ihr mehr wissen wollt. Ich bin bloß ein Notar.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Zhambra");
talkEntry:addResponse("There are 16 gods. Five created Illarion. One god is evil.");
talkEntry:addResponse("Ask a priest if you want to know more about the gods. I'm just a noraty.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zhambra");
talkEntry:addResponse("Es gibt 16 Götter. Fünf schufen Illarion. Einer ist böse.");
talkEntry:addResponse("Fragt einen Priester wenn Ihr mehr wissen wollt. Ich bin bloß ein Notar.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("I am not a trader, but if you give me money, you can become a citizen of Galmair.");
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Ich bin kein Händler. Wenn du mir Geld gibst, kannst du Bürger von Galmair werden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("Everyone should become a citizen of Galmair, that way I can make lots of money!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Jeder sollte Bürger Glamairs werden, so kann ich viel Geld verdienen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Frederik");
talkEntry:addTrigger("Silvereye");
talkEntry:addResponse("Yes, that's me!");
talkEntry:addResponse("Who? Me?");
talkEntry:addResponse("#me waves.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Frederik ");
talkEntry:addTrigger("Silvereye");
talkEntry:addResponse("Ja, das bin ich!");
talkEntry:addResponse("Wer? Ich?");
talkEntry:addResponse("#me winkt");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("#me nods.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("#me nickt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("#me shakes his head.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("#me schüttelt den Kopf.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("bless you");
talkEntry:addResponse("Thanks.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gesundheit");
talkEntry:addResponse("Danke.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("...pardon?");
talkEntry:addResponse("Well...");
talkEntry:addResponse("#me looks around.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("...bitte?");
talkEntry:addResponse("Mhm....");
talkEntry:addResponse("#me schaut sich um.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me schüttelt den Kopf während er einen Brief liest", "#me shakes his head whilst reading a letter.");
talkingNPC:addCycleText("#me zählt einige Münzen.", "#me counts some coins.");
talkingNPC:addCycleText("#me starrt vor sich hin.", "#me stares into thin air.");
talkingNPC:addCycleText("#me schreibt einen Brief.", " #me writes a letter.");
talkingNPC:addCycleText("#me grummelt: 'Arbeit, nichts ale Arbeit!'", "#me mumbles: 'Work, nothing but work.'");
talkingNPC:addCycleText("Werdet Bürger von Galmair! Macht mich reich!...äh ich meine, werdet reich in Galmair!", "Become a citzen of Galmair! Make me rich...ehm, I mean become rich in Galmair.");
talkingNPC:addCycleText("#me niest.", "#me sneezes.");
talkingNPC:addCycleText("#me kratzt sich am Kopf.", "#me scratches his head.");
talkingNPC:addCycleText("#me putzt seine Nase.", "#me blows his nose.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(1);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Dieser NPC ist Frederik Silvereye der Notar.", "This NPC is Frederik Silvereye the notary.");
mainNPC:setUseMessage("Fasst mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut verwirrt.", "#me looks around confused.");
mainNPC:setEquipment(1, 830);
mainNPC:setEquipment(3, 813);
mainNPC:setEquipment(11, 0);
mainNPC:setEquipment(5, 0);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 48);
mainNPC:setEquipment(9, 827);
mainNPC:setEquipment(10, 326);
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
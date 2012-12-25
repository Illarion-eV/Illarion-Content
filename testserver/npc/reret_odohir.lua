--------------------------------------------------------------------------------
-- NPC Name: Reret Odohir                                             Cadomyr --
-- NPC Job:  Notary                                                           --
--                                                                            --
-- NPC Race: human                      NPC Position:  106, 553, 0            --
-- NPC Sex:  female                     NPC Direction: north                  --
--                                                                            --
-- Author:   ?? + Miriam                                                      --
--                                                       easyNPC Parser v1.21 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (0, 106, 553, 0, 0, 'Reret Odohir', 'npc.reret_odohir', 1, 2, 0, 68, 63, 58, 255, 210, 204);
---]]

require("npc.base.basic")
require("npc.base.condition.chance")
require("npc.base.condition.item")
require("npc.base.condition.language")
require("npc.base.condition.quest")
require("npc.base.condition.rank")
require("npc.base.condition.sex")
require("npc.base.condition.town")
require("npc.base.consequence.deleteitem")
require("npc.base.consequence.inform")
require("npc.base.consequence.item")
require("npc.base.consequence.quest")
require("npc.base.consequence.rankpoints")
require("npc.base.consequence.town")
require("npc.base.talk")
require("npc.base.trade")
module("npc.reret_odohir", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
local tradingNPC = npc.base.trade.tradeNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Retret Odohir the Notary of Cadomyr. Keywords: 'join Cadomyr','become citizen', 'leave','give up citizenship', 'rank'."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Retret Odohir die Notarin von Cadomyr. Schlüsselwörter: 'Cadomyr beitreten' 'Bürger werden','verlassen','beende Bürgerstatus','Rang'."));
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
talkEntry:addResponse("Be greeted, nice to see you here.");
talkEntry:addResponse("Be greeted, I am the notary of this town.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Grüße");
talkEntry:addTrigger("Gruß");
talkEntry:addTrigger("Guten Morgen");
talkEntry:addTrigger("Guten Tag");
talkEntry:addTrigger("Guten Abend");
talkEntry:addTrigger("Gute Nacht");
talkEntry:addTrigger("Mahlzeit");
talkEntry:addTrigger("Tach");
talkEntry:addTrigger("Moin");
talkEntry:addTrigger("Mohltied");
talkEntry:addResponse("Seid grüßt.");
talkEntry:addResponse("Grüße.");
talkEntry:addResponse("Grüße, schön Euch mal wieder hier zu sehen.");
talkEntry:addResponse("Zum Gruße, ich bin die Notarin dieser Stadt.");
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
talkEntry:addResponse("Greetings, nice to see you again");
talkEntry:addResponse("Be greeted, I am the notary of this town.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Seid grüßt.");
talkEntry:addResponse("Grüße.");
talkEntry:addResponse("Be greeted, I am the notary of this town.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Fare well!");
talkEntry:addResponse("Bye!");
talkEntry:addResponse("#me smiles at you and waves.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Auf bald!");
talkEntry:addResponse("Bis bald");
talkEntry:addResponse("#me lächelt dich an und winkt zum Abschied");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Fare well!");
talkEntry:addResponse("#me smiles at you and waves.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Auf bald!");
talkEntry:addResponse("#me lächelt dich an und winkt zum Abschied");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("I am fine and how are you?");
talkEntry:addResponse("I'm fine. Thanks for asking.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addResponse("Mir geht es gut und wie geht es Euch?");
talkEntry:addResponse("Eigentlich ganz gut, danke der Nachfrage.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("I'm Reret Odohir, Notary and citizen of Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Ich bin Reret Odohir, Notar und Bürger von Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("sell");
talkEntry:addTrigger("buy");
talkEntry:addTrigger("wares");
talkEntry:addTrigger("price");
talkEntry:addTrigger("trade");
talkEntry:addTrigger("purchase");
talkEntry:addResponse("I sell nothing, but I can register you as a citizen. Just tell me, if you want to become a citizen.");
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
talkEntry:addResponse("Ick verkauf nichts, aber ich kann Euch als Bürger eintragen. Sag mir einfach wenn Ihr Bürger dieser Stadt werden möchtet.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("join Cadomyr");
talkEntry:addTrigger("become citizen");
talkEntry:addTrigger("gain citizenship");
talkEntry:addResponse("You are now a citizen of Cadomyr");
talkEntry:addResponse("Welcome to Cadomyr!");
talkEntry:addConsequence(npc.base.consequence.town.town("=", "1"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("Cadomyr beitreten");
talkEntry:addTrigger("Bürger werden");
talkEntry:addTrigger("Bürgerschaft beantragen");
talkEntry:addResponse("Ihr seid jetzt Bürger von Cadomyr");
talkEntry:addResponse("Willkommen in Cadomyr!");
talkEntry:addConsequence(npc.base.consequence.town.town("=", "1"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("join Cadomyr");
talkEntry:addTrigger("become citizen");
talkEntry:addTrigger("gain citizenship");
talkEntry:addResponse("You are now a citizen of Cadomyr");
talkEntry:addResponse("Welcome to Cadomyr!");
talkEntry:addConsequence(npc.base.consequence.town.town("=", "1"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("Cadomyr beitreten");
talkEntry:addTrigger("Bürger werden");
talkEntry:addTrigger("Bürgerschaft beantragen");
talkEntry:addResponse("Ihr seidt jetzt Bürger von Cadomyr");
talkEntry:addResponse("Willkommen in Cadomyr!");
talkEntry:addConsequence(npc.base.consequence.town.town("=", "1"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(0));
talkEntry:addTrigger("join Cadomyr");
talkEntry:addTrigger("become citizen");
talkEntry:addTrigger("gain citizenship");
talkEntry:addResponse("You are now a citizen of Cadomyr");
talkEntry:addResponse("Welcome to Cadomyr!");
talkEntry:addConsequence(npc.base.consequence.town.town("=", "1"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.town.town(0));
talkEntry:addTrigger("Cadomyr beitreten");
talkEntry:addTrigger("Bürger werden");
talkEntry:addTrigger("Bürgerschaft beantragen");
talkEntry:addResponse("Ihr seid jetzt Bürger von Cadomyr");
talkEntry:addResponse("Willkommen in Cadomyr!");
talkEntry:addConsequence(npc.base.consequence.town.town("=", "1"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("join Cadomyr");
talkEntry:addTrigger("become citizen");
talkEntry:addTrigger("gain citizenship");
talkEntry:addResponse("You are now a citizen of Cadomyr");
talkEntry:addResponse("Welcome to Cadomyr!");
talkEntry:addConsequence(npc.base.consequence.town.town("=", "1"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr beitreten");
talkEntry:addTrigger("Bürger werden");
talkEntry:addTrigger("Bürgerschaft beantragen");
talkEntry:addResponse("Ihr seid jetzt Bürger von Cadomyr");
talkEntry:addResponse("Willkommen in Cadomyr!");
talkEntry:addConsequence(npc.base.consequence.town.town("=", "1"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("join Cadomyr");
talkEntry:addTrigger("become citizen");
talkEntry:addTrigger("gain citizenship");
talkEntry:addResponse("Oh! You are already a citizen of Cadomyr.");
talkEntry:addConsequence(npc.base.consequence.town.town("=", "1"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("Cadomyr beitreten");
talkEntry:addTrigger("Bürger werden");
talkEntry:addTrigger("Bürgerschaft beantragen");
talkEntry:addResponse("Oh! Ihr seid bereits Bürger von Cadomyr.");
talkEntry:addConsequence(npc.base.consequence.town.town("=", "1"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("give up citizenship");
talkEntry:addTrigger("terminating citizen ship");
talkEntry:addTrigger("leave");
talkEntry:addTrigger("leaving");
talkEntry:addResponse("You want to give up citizen ship in Cadomyr. Are you sure?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(209, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("beende Bürgerstatus");
talkEntry:addTrigger("verlassen");
talkEntry:addTrigger("verlasse");
talkEntry:addTrigger("annuliere");
talkEntry:addResponse("Ihr wollt den Status als Bürger Cadomyrs augfeben? Seid Ihr sicher?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(209, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("give up citizenship");
talkEntry:addTrigger("terminating citizen ship");
talkEntry:addTrigger("leave");
talkEntry:addTrigger("leaving");
talkEntry:addResponse("Ehm... you never were a citizen of Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beende Bürgerstatus");
talkEntry:addTrigger("verlassen");
talkEntry:addTrigger("verlasse");
talkEntry:addTrigger("annuliere");
talkEntry:addResponse("Ehm... Ihr wart niemals Bürger von Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(209, "=", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("yes");
talkEntry:addResponse("You are no longer citizen under the protection of her majesty Queen Rosaline, you no longer belong to Cadomyr. Fare well.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(209, "=", 0));
talkEntry:addConsequence(npc.base.consequence.town.town("=", "0"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(209, "=", 1));
talkEntry:addTrigger("ja");
talkEntry:addResponse("Ihr seit nicht länger Büger unter dem Schutz der Königin Rosalines, Ihr gehört nicht mehr zu Cadomyrs. Fare well.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(209, "=", 0));
talkEntry:addConsequence(npc.base.consequence.town.town("=", "0"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(209, "=", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".*");
talkEntry:addResponse("I see... Yes, Cadomyr is truly a nice place.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(209, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(209, "=", 1));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Ich verstehe... Ja, Cadomyr ist für wahr ein gut Ort.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(209, "=", 0));
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
talkEntry:addTrigger("wich faction");
talkEntry:addResponse("You belong to %TOWN!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 9));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addCondition(npc.base.condition.sex.sex(0));
talkEntry:addTrigger("rank");
talkEntry:addResponse("Greetings to you, Archduke %CHARNAME!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 9));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addTrigger("rank");
talkEntry:addResponse("Greetings to you, Archduchess %CHARNAME!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 9));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addCondition(npc.base.condition.sex.sex(0));
talkEntry:addTrigger("rang");
talkEntry:addResponse("Erzherzog %CHARNAME! Hochwohlgeboren, wie ist es Euch ergangen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 9));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addTrigger("rang");
talkEntry:addResponse("Erzherzogin %! Hochwohlgeboren, wie ist es Euch ergangen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 8));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addCondition(npc.base.condition.sex.sex(0));
talkEntry:addTrigger("rank");
talkEntry:addResponse("Greetings to you, Duke %CHARNAME!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 8));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addTrigger("rank");
talkEntry:addResponse("Greetings to you, Ducess %CHARNAME!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 8));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addCondition(npc.base.condition.sex.sex(0));
talkEntry:addTrigger("rang");
talkEntry:addResponse("Herzog %CHARNAME! Hochwohlgeboren, wie ist es Euch ergangen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 8));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addTrigger("rang");
talkEntry:addResponse("Herzogin %CHARNAME! Hochwohlgeboren, wie ist es Euch ergangen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 7));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addCondition(npc.base.condition.sex.sex(0));
talkEntry:addTrigger("rank");
talkEntry:addResponse("Greetings to you, Earl!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 7));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addTrigger("rank");
talkEntry:addResponse("Greetings to you, Lady!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 7));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addCondition(npc.base.condition.sex.sex(0));
talkEntry:addTrigger("rang");
talkEntry:addResponse("Seid gegrüßt, mein Fürst!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 7));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addTrigger("rang");
talkEntry:addResponse("Seid gegrüßt, meine Fürstin!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 6));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addCondition(npc.base.condition.sex.sex(0));
talkEntry:addTrigger("rank");
talkEntry:addResponse("Greetings to you, Count %CHARNAME!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 6));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addTrigger("rank");
talkEntry:addResponse("Greetings to you, Countess %CHARNAME!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 6));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addCondition(npc.base.condition.sex.sex(0));
talkEntry:addTrigger("rang");
talkEntry:addResponse("Graf %CHARNAME, seid gegrüßt!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 6));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addTrigger("rang");
talkEntry:addResponse("Gräfin %CHARNAME, seid gegrüßt!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 5));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addCondition(npc.base.condition.sex.sex(0));
talkEntry:addTrigger("rank");
talkEntry:addResponse("Greetings to you, Baroness!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 5));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addTrigger("rank");
talkEntry:addResponse("Greetings to you, Baron!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 5));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addCondition(npc.base.condition.sex.sex(0));
talkEntry:addTrigger("rang");
talkEntry:addResponse("Baron, seid gegrüßt!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 5));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addTrigger("rang");
talkEntry:addResponse("Baroness, seid gegrüßt!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addCondition(npc.base.condition.sex.sex(0));
talkEntry:addTrigger("rank");
talkEntry:addResponse("Greetings to you, Revee!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addTrigger("rank");
talkEntry:addResponse("Greetings to you, Revee!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 4));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addCondition(npc.base.condition.sex.sex(0));
talkEntry:addTrigger("rang");
talkEntry:addResponse("Vogt, seid gegrüßt!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 4));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addTrigger("rang");
talkEntry:addResponse("Vogtin, seid gegrüßt!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 6));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addCondition(npc.base.condition.sex.sex(0));
talkEntry:addTrigger("rank");
talkEntry:addResponse("Greetings to you, Knight!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 6));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addTrigger("rank");
talkEntry:addResponse("Greetings to you, Dame!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 6));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addCondition(npc.base.condition.sex.sex(0));
talkEntry:addTrigger("rang");
talkEntry:addResponse("Seid gegrüßt, mein Ritter!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 6));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addTrigger("rang");
talkEntry:addResponse("Seid gegrüßt, meine Dame!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addCondition(npc.base.condition.sex.sex(0));
talkEntry:addTrigger("rank");
talkEntry:addResponse("Good day, Lord %CHARNAME!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addTrigger("rank");
talkEntry:addResponse("Good day, Lady %CHARNAME!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 2));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addCondition(npc.base.condition.sex.sex(0));
talkEntry:addTrigger("rang");
talkEntry:addResponse("Guten Tag, Herr %CHARNAME!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 2));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addTrigger("rang");
talkEntry:addResponse("Guten Tag, Dame %CHARNAME!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addCondition(npc.base.condition.sex.sex(0));
talkEntry:addTrigger("rank");
talkEntry:addResponse("Ah! So you are a squire?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addTrigger("rank");
talkEntry:addResponse("Ah! So you are a squire?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 1));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addCondition(npc.base.condition.sex.sex(0));
talkEntry:addTrigger("rang");
talkEntry:addResponse("Ah! Du bist ein Knappe?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 1));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addTrigger("rang");
talkEntry:addResponse("Ah! Du bist ein Knappin?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addCondition(npc.base.condition.sex.sex(0));
talkEntry:addTrigger("rank");
talkEntry:addResponse("You are new here. You are not well known. Make an effort and become famous, Recruit!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addTrigger("rank");
talkEntry:addResponse("You are new here. You are not well known. Make an effort and become famous, Recruit!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 0));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addCondition(npc.base.condition.sex.sex(0));
talkEntry:addTrigger("rang");
talkEntry:addResponse("Du bist noch ganz neu hier. Dich kennt kaum jemand. Streng dich mehr an und mach dir einen Namen, Rekrut!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.rank.rank(">", 0));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addTrigger("rang");
talkEntry:addResponse("Du bist noch ganz neu hier. Dich kennt kaum jemand. Streng dich mehr an und mach dir einen Namen, Rekrutin!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rank");
talkEntry:addResponse("I do not know about other towns ranks.");
talkEntry:addResponse("I am not interested in other systems of status than the Cadomyran one.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rang");
talkEntry:addResponse(" Ich weiß nichts über Ränge in anderen Städten.");
talkEntry:addResponse("Ich interessiere mich nur für das cadomyrische Statussystem.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("No, sorry. I have nothing to do for you. Why don't you just enjoy your stay in Cadomyr?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Nein, tut mir leid. Ich habe keinen Auftrag für Euch. Warum genießt Ihr nicht einfach Eure Aufenthalt in Cadomyr?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("No, sorry. I have nothing to do for you. Why don't you just enjoy your stay in Cadomyr?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Nein, tut mir leid. Ich habe keinen Auftrag für Euch. Warum genießt Ihr nicht einfach Eure Aufenthalt in Cadomyr?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(150, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Present from Cadomyr"));
talkEntry:addResponse("I'd like to send my Grandparents in Salkamar a present from Cadomyr. The both like gardening, so I'd like to send them five desert sky capsules. But I'm still busy working, so could I ask you to go and find some for me, please?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(0, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(150, "=", 0));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Geschenk aus Cadomyr"));
talkEntry:addResponse("Ich möchte meinen Großeltern in Salkamar ein Geschenk aus Cadomyr schicken. Sie mögen beiden Gartenarbeit, daher dachte ich daran ihnen fünf Wüsenhimmelskapseln zu schicken. Ich bin mit der Arbeit sehr beschäftigt, könnte ich Euch bitten einige Wüstenhimmelskapseln für mich zu finden?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(150, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(150, "=", 0));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Present from Cadomyr"));
talkEntry:addResponse("I'd like to send my Grandparents in Salkamar a present from Cadomyr. The both like gardening, so I'd like to send them five desert sky capsules. But I'm still busy working, so could I ask you to go and find some for me, please?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(0, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(150, "=", 0));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Geschenk aus Cadomyr"));
talkEntry:addResponse("Ich möchte meinen Großeltern in Salkamar ein Geschenk aus Cadomyr schicken. Sie mögen beiden Gartenarbeit, daher dachte ich daran ihnen fünf Wüsenhimmelskapseln zu schicken. Ich bin mit der Arbeit sehr beschäftigt, könnte ich Euch bitten einige Wüstenhimmelskapseln für mich zu finden?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(150, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(0, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(146, "all", ">", 16, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved]  You are awarded with a dagger."));
talkEntry:addResponse("Oh, you found the desert sky capsules? Thank you, that is very kind of you. Here, please take this, it s shall be your rewand for your troubles.");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(146, 15, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(27, 1, 433, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(0, "=", 2));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(0, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(146, "all", ">", 16, nil));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelößt] Du erhälst als Belohnung einen Dolch."));
talkEntry:addResponse("Oh, ihr habt die Wüstenhimmelskapseln gefunden? Danke, das ist sehr freundlich von Euch. Hier, bitte nehmt dies, betrachtet es als Belohung für eure Mühen.");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(146, 15, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(27, 1, 433, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(0, "=", 2));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(150, "=", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("I'm still busy working, so could I ask you to go and find fifteen desert sky capsule for me, please?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(150, "=", 1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Ich bin mit der Arbeit sehr beschäftigt, könnte ich Euch bitten fünfzehn Wüstenhimmelskapseln für mich zu finden?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(150, "=", 1));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("I'm still busy working, so could I ask you to go and find fifteen desert sky capsule for me, please?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(150, "=", 1));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Ich bin mit der Arbeit sehr beschäftigt, könnte ich Euch bitten fünfzehn Wüstenhimmelskapseln für mich zu finden?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(150, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Be carefull, not only the desert os full of dangers. Most places are.");
talkEntry:addResponse("Thanks again for your help.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(150, "=", 2));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Seid vorsichtig, nicht nur die Wüste wird von Monstern bevölkert. Sondern auch die meisten abderen Orte.");
talkEntry:addResponse("Danke nochmals für Eure Hilfe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(150, "=", 2));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("Be carefull, not only the desert os full of dangers. Most places are.");
talkEntry:addResponse("Thanks again for your help.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(150, "=", 2));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Seid vorsichtig, nicht nur die Wüste wird von Monstern bevölkert. Sondern auch die meisten abderen Orte.");
talkEntry:addResponse("Danke nochmals für Eure Hilfe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("You can get registered as citizen here.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Hier könnt Ihr Euch bei mir als Bürger eintragen lassen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("You can get registered as citizen here.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Hier könnt Ihr bei Euch als Bürger eintragen lassen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("Sand can be used to make glass, but I like it just the way it is. This place is full of sand, it is on the streets, inside my shoes, even the air is filled with sand if the wind is blowing. If you don't like sand, don't go to the desert.");
talkEntry:addResponse("I really like sand. Especially quarz sand ");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Sand kann man nutzen um Glas daraus zu machen, aber ich mag Sand so wie er ist. Dieser Ort ist voll von Sand, er ist auf den Straßen, in meinen Schuhen, selbst in der Luft ist Sand, wenn der Wind weht. Wer keinen Sand mag, sollte nicht in die Wüste gehen. ");
talkEntry:addResponse("Ich mag Sand sehr gerne, besonders Quartzsand.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("People go to shrines to pray to their gods. Usually they bring a present for the gods along.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Die Leute gehen zu Tempeln der Götter um zu beten. Für gewöhnlich bringen sie eine Gabe an die Gottheit mit.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Adron");
talkEntry:addResponse("People who pray to this god are welcome to the town.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Adron");
talkEntry:addResponse("Anhänger dieser Gottheit sind in der Stadt willkommen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addResponse("People who pray to this god are welcome in the town.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addResponse("Anhänger dieser Gottheit sind in der Stadt willkommen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cherga");
talkEntry:addResponse("People who pray to this god are welcome in the town.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addResponse("Anhänger dieser Gottheit sind in der Stadt willkommen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elara");
talkEntry:addResponse("People who pray to this god are welcome in the town.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elara");
talkEntry:addResponse("Anhänger dieser Gottheit sind in der Stadt willkommen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Eldan");
talkEntry:addResponse("People who pray to this god are welcome in the town.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eldan");
talkEntry:addResponse("Anhänger dieser Gottheit sind in der Stadt willkommen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Findari");
talkEntry:addResponse("People who pray to this god are welcome in the town.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Findari");
talkEntry:addResponse("Anhänger dieser Gottheit sind in der Stadt willkommen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("People who pray to this god are welcome in the town.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("Anhänger dieser Gottheit sind in der Stadt willkommen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addResponse("People who pray to this god are welcome in the town.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addResponse("Anhänger dieser Gottheit sind in der Stadt willkommen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Moshran");
talkEntry:addResponse("People who pray to this god are not welcome in the town.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Moshran");
talkEntry:addResponse("Anhänger dieser Gottheit sind in der Stadt nicht willkommen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargùn");
talkEntry:addTrigger("Nargún");
talkEntry:addResponse("People who pray to this god are welcome in the town.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargùn");
talkEntry:addTrigger("Nargún");
talkEntry:addResponse("Anhänger dieser Gottheit sind in der Stadt willkommen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("People who pray to this god are welcome in the town.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("Anhänger dieser Gottheit sind in der Stadt willkommen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("People who pray to this god are welcome in the town.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("Anhänger dieser Gottheit sind in der Stadt willkommen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("People who pray to this god are welcome in the town.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("Anhänger dieser Gottheit sind in der Stadt willkommen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("People who pray to this god are welcome in the town.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("Anhänger dieser Gottheit sind in der Stadt willkommen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("People who pray to this god are welcome in the town.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("Anhänger dieser Gottheit sind in der Stadt willkommen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Zhambra");
talkEntry:addResponse("People who pray to this god are welcome in the town.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zhambra");
talkEntry:addResponse("Anhänger dieser Gottheit sind in der Stadt willkommen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addResponse("I heard the archmage does nothing but reading books and studying the arcane arts. If it's true he must be amlost dead of stavation.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Ich habe gehört, der Erzmagier tut nichts außer Bücher zu lesen und die arkanen Künste zu studiere. Wenn das stimmt, dann muss er fast tot vor Hunger sein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("I've heard the name before.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Ich habe diesen Namen schon mal gehört.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("I don't like it there. It's a cold and boring place.");
talkEntry:addResponse("There are many book there. But not very interesting ones.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Mir gefällt es dort nicht. Das ist ein kalter, langweiliger Ort.");
talkEntry:addResponse("Es gibt dort viele Bücher... aber die sind nicht sonderlich interessant.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Valerio Guilianni is the ruler of Galmair. He is not living in Cadomyr of course.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Valerio Guilianni ist der Herrscher von Galmair. Und natürlich lebt er nicht in Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Galmair is only half as nice as Cadomyr. They don't have sand there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Galmair ist nur halb so schön wie Cadomyr. Die haben da nämlich keinen Sand.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Queen");
talkEntry:addResponse("Honor to our Queen!");
talkEntry:addResponse("The queen likes donkey milk... and I like sand.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königin");
talkEntry:addResponse("Ehre der Königin!");
talkEntry:addResponse("Die Königin mag Eselmilch... und ich mag Sand.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("She is the noble and rightful rule of Cadomyr.");
talkEntry:addResponse("Honor to our Queen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Sie ist die edle und rechtmäßige Herrscherin von Cadomyr.");
talkEntry:addResponse("Ehre der Königin!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("I really love hot weather here, and you?");
talkEntry:addResponse("Each Town has power germs, but ours, the ones of Cadomyr are the most beautifull of all!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Ich liebe warmes Wetter hier, und Ihr?");
talkEntry:addResponse("Jede Stadt besitzt magische Edelsteine, aber unsere, die von Cadomyr, sind die schönsten von allen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("albar");
talkEntry:addResponse("Albar? My grandparents spoke badly about this place. I've never been there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("Albar? Meine Großeltern haben schlecht über diesen Ort gesprochen. Ich war niemals dort.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addResponse("Many traders come from Gync, at least that's my impression.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("Viele Händler kommen aus Gynk, zumindest ist das so mein Eindruck.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("salkama");
talkEntry:addResponse("My grandparents live in Salkamar. It's a nice place. I loved to vist them when I was a child.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Meine Großeltern leben in Salkamar. Es ist ein schöner Ort. Ich habe sie als Kind immer gerne besucht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("I don't know this town, do they have notarys there?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Ich kenne diese Stadt nicht, haben die da auch Notare?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("A pleasure, I am Redet Odohir. And who are you?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Freut mich, ich bin Redet Odohir. Und wer seid Ihr?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Redet");
talkEntry:addTrigger("Odohir");
talkEntry:addResponse("That's me. How can I help you?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Redet");
talkEntry:addTrigger("Odohir");
talkEntry:addResponse("Das bin ich. Was kann ich für Euch tun?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("#me smiles.");
talkEntry:addResponse("That what I expected to hear from you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("#me lächelt.");
talkEntry:addResponse("Das habe ich von Euch zu hören erwartet");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("Nein? Das ist schade.");
talkEntry:addResponse("Nein? Nun, Ihr werde Eure Gründe für diese Antwort haben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("No. That's sad.");
talkEntry:addResponse("No? well, You'll have a reason for saying so.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Welcome to Cadomyr. Do you want to become a citizen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Willkommen in Cadomyr. Möchtet Ihr hier Bürger werden?");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me unterzeichnet ein Dokument.", "#me signs a document.");
talkingNPC:addCycleText("#me befestigt ein Siegel an einem Brief.", "#me puts a seal under a letter.");
talkingNPC:addCycleText("#me lächelt", "#me smilies");
talkingNPC:addCycleText("#me macht sich ein paar Notizen.", "#me takes some notes.");
talkingNPC:addCycleText("#me summt eine Melodie.", "#me hums a melody.");
tradingNPC:addNotEnoughMoneyMsg("Ihr habt nicht genug Geld.", "You don't have enought Money.");
tradingNPC:addDialogClosedMsg("Danke euch.", "Thank you.");
tradingNPC:addDialogClosedNoTradeMsg("Bis zum nächsten mal.", "Hope to see you again!");
tradingNPC:addWrongItemMsg("Oh, Das kaufe ich nicht. Tut mir leid.", "Oh, I don't buy that. Sorry.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(1);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Dieser NPC ist Reret Odohir die Notarin.", "This NPC is Reret Odohir the Notary.");
mainNPC:setUseMessage("Lasst mich in Ruhe!", "Don't you touch me!");
mainNPC:setConfusedMessage("#me schaut verwirrt.", "#me looks around confused.");
mainNPC:setEquipment(1, 257);
mainNPC:setEquipment(3, 181);
mainNPC:setEquipment(11, 558);
mainNPC:setEquipment(5, 0);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 48);
mainNPC:setEquipment(9, 34);
mainNPC:setEquipment(10, 45);
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
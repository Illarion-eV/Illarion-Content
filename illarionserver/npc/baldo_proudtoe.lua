--------------------------------------------------------------------------------
-- NPC Name: Baldo Proudtoe                                          Runewick --
-- NPC Job:  Gardener                                                         --
--                                                                            --
-- NPC Race: halfling                   NPC Position:  941, 790, 0            --
-- NPC Sex:  male                       NPC Direction: south                  --
--                                                                            --
-- Author:   Estralis Seborian                                                --
--                                                       easyNPC Parser v1.21 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (2, 941, 790, 0, 4, 'Baldo Proudtoe', 'npc.baldo_proudtoe', 0, 2, 0, 89, 46, 6, 243, 169, 120);
---]]

require("npc.base.basic")
require("npc.base.condition.item")
require("npc.base.condition.language")
require("npc.base.condition.quest")
require("npc.base.condition.skill")
require("npc.base.condition.town")
require("npc.base.consequence.deleteitem")
require("npc.base.consequence.inform")
require("npc.base.consequence.item")
require("npc.base.consequence.money")
require("npc.base.consequence.quest")
require("npc.base.consequence.rankpoints")
require("npc.base.consequence.skill")
require("npc.base.consequence.trade")
require("npc.base.talk")
module("npc.baldo_proudtoe", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Baldo Proudtoe the gardener. Keywords: Hello, Quest, Garden, Runewick, Loneliness."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Baldo Proudtoe der Gärtner. Schlüsselwörter: Hallo, Quest, Garten, Runewick, Einsamkeit."));
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
talkEntry:addResponse("Ah, hello and welcome to my garden.");
talkEntry:addResponse("Do not stomp on the flowers, will you? You came here to help me, right?");
talkEntry:addResponse("Oh, hiho! I was lost in thoughts - my garden is so beautiful that one tends to forget about the rest of this cruel world.");
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
talkEntry:addResponse("Ah, hallo, willkommen in meinem Garten.");
talkEntry:addResponse("Trampelt bitte nicht auf den Blumen herum, danke. Ihr seid hier um mir zu helfen, richtig?");
talkEntry:addResponse("Oh, hiho! Ich muss geträumt haben, mein Garten ist so schön, dass man leicht mal die grausame Welt da draußen vergisst.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Ah, hello and welcome to my garden.");
talkEntry:addResponse("Do not stomp on the flowers, will you? You came here to help me, right?");
talkEntry:addResponse("Oh, hiho! I was lost in thoughts - my garden is so beautiful that one tends to forget about the rest of this cruel world.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Ah, hallo, willkommen in meinem Garten.");
talkEntry:addResponse("Trampelt bitte nicht auf den Blumen herum, danke. Ihr seid hier um mir zu helfen, richtig?");
talkEntry:addResponse("Oh, hiho! Ich muss geträumt haben, mein Garten ist so schön, dass man leicht mal die grausame Welt da draußen vergisst.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Have a nice day and do not stomp on any flowers!");
talkEntry:addResponse("You are always welcome in my garden... so will you come back?");
talkEntry:addResponse("Oh, you have to leave? That's sad! I don't get visitors here that often.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Einen schönen Tag noch! Und trampelt keine Blumen platt.");
talkEntry:addResponse("Ihr seid in meinem Garten immer willkommen... werdet ihr also wiederkommen?");
talkEntry:addResponse("Oh, ihr müßt schon gehen? Ich empfange leider nicht oft Besuch hier.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Have a nice day and do not stomp on any flowers!");
talkEntry:addResponse("You are always welcome in my garden... so will you come back?");
talkEntry:addResponse("Oh, you have to leave? That's sad! I don't get visitors here that often.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Einen schönen Tag noch! Und trampelt keine Blumen platt.");
talkEntry:addResponse("Ihr seid in meinem Garten immer willkommen... werdet ihr also wiederkommen?");
talkEntry:addResponse("Oh, ihr müßt schon gehen? Ich empfange leider nicht oft Besuch hier.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("I feel lonely, really, but the hedges are always here with me.");
talkEntry:addResponse("Will you stay a while to talk to me? That would be so great!");
talkEntry:addResponse("Maybe I should go to the market of Runewick. At least I see some people there...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befind");
talkEntry:addResponse("Ich bin wirklich einsam. Aber die Hecken sind ja hier bei mir.");
talkEntry:addResponse("Bleibt ihr noch etwas zum Reden?");
talkEntry:addResponse("Vielleicht sollte ich mal auf den Markt von Runewick gehen. Wenigstens kann ich dort mal Leute sehen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("My name is Baldo, Baldo Proudtoe. I'm the local gardener!");
talkEntry:addResponse("Proudtoe. Baldo Proudtoe.");
talkEntry:addResponse("I'm Baldo, the gardener. A garden requires a lot of attention.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ihr name");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Mein Name ist Baldo, Baldo Proudtoe. Ich bin hier der Gärtner!");
talkEntry:addResponse("Proudtoe. Baldo Proudtoe.");
talkEntry:addResponse("Ich bin Baldo, der Gärtner. So ein Garten verlangt nach einer Menge Pflege.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(118, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Runewick Gardens I"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(118, "=", 1));
talkEntry:addResponse("Ah, you want to help me? Look, I'd like to plant some apple trees in my garden. But for that, I need apple seeds. So, please, bring me ten apples!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(118, "=", 0));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Die Gärten von Runewick I"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(118, "=", 1));
talkEntry:addResponse("Ah, ihr wollt mir also helfen? Ich würde gerne einige Apfelbäume in meinem Garten pflanzen. Aber dafür brauche ich Apfelsamen. Also bringt mir doch bitte zehn Äpfel!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(118, "=", 0));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Runewick Gardens I"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(118, "=", 1));
talkEntry:addResponse("Ah, you want to help me? Look, I'd like to plant some apple trees in my garden. But for that, I need apple seeds. So, please, bring me ten apples!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(118, "=", 0));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Die Gärten von Runewick I"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(118, "=", 1));
talkEntry:addResponse("Ah, ihr wollt mir also helfen? Ich würde gerne einige Apfelbäume in meinem Garten pflanzen. Aber dafür brauche ich Apfelsamen. Also bringt mir doch bitte zehn Äpfel!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(118, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(15, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded a goblet of cider. You advance in Archmage Elvaine Morgan's favour."));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(15, 10, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(1844, 1, 699, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(118, "=", 2));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("How marvellous! Now I can plant new friends for me. You know, I love cider, it makes me forget... Have a goblet with me!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(118, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(15, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst einen Krug Cidre. Dein Ansehen bei Erzmagier Elvaine Morgan steigt."));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(15, 10, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(1844, 1, 699, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(118, "=", 2));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("Wie wunderbar! Jetzt kann ich mir neue Freunde pflanzen. Wisst ihr, ich liebe Cidre, er hilft mir zu vergessen... Hebt einen Krug mit mir!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(118, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(15, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded a goblet of cider."));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(15, 10, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(1844, 1, 699, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(118, "=", 2));
talkEntry:addResponse("How marvellous! Now I can plant new friends for me. You know, I love cider, it makes me forget... Have a goblet with me!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(118, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(15, "all", ">", 9, nil));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst einen Krug Cidre."));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(15, 10, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(1844, 1, 699, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(118, "=", 2));
talkEntry:addResponse("Wie wunderbar! Jetzt kann ich mir neue Freunde pflanzen. Wisst ihr, ich liebe Cidre, er hilft mir zu vergessen... Hebt einen Krug mit mir!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(118, "=", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Some new trees would be so fine, please, get me ten apples so I can plant myself some new friends.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(118, "=", 1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Ein paar neue Bäume wären so fein, bitte, holt mir zehn Äpfel, damit ich mir neue Freund pflanzen kann.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(118, "=", 1));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("Some new trees would be so fine, please, get me ten apples so I can plant myself some new friends.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(118, "=", 1));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Ein paar neue Bäume wären so fein, bitte, holt mir zehn Äpfel, damit ich mir neue Freund pflanzen kann.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(118, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Runewick Gardens II"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(118, "=", 3));
talkEntry:addResponse("If I am honest, I enjoy sweet fruits once in a while. It makes me feel... alive. Could you bring me ten grapes? That'd be so nice!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(118, "=", 2));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Die Gärten von Runewick II"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(118, "=", 3));
talkEntry:addResponse("Ich bin ganz offen: Ich nasche gerne süße Früchte. Dann fühl ich mich irgendwie lebendig. Könntet ihr mir zehn Trauben bringen? Das wäre so nett!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(118, "=", 2));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Runewick Gardens II"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(118, "=", 3));
talkEntry:addResponse("If I am honest, I enjoy sweet fruits once in a while. It makes me feel... alive. Could you bring me ten grapes? That'd be so nice!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(118, "=", 2));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Die Gärten von Runewick II"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(118, "=", 3));
talkEntry:addResponse("Ich bin ganz offen: Ich nasche gerne süße Früchte. Dann fühl ich mich irgendwie lebendig. Könntet ihr mir zehn Trauben bringen? Das wäre so nett!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.farming, "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(118, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(388, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded two silver coins and your farming skill increases. You advance in Archmage Elvaine Morgan's favour."));
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.farming, "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 200));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(388, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(118, "=", 4));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("Tasty, tasty, tasty! You make me smile, really! I haven't felt like this for quite a while, and this time, I can share my joy!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(118, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(388, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded two silver coins. You advance in Archmage Elvaine Morgan's favour."));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 200));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(388, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(118, "=", 4));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("Tasty, tasty, tasty! You make me smile, really! I haven't felt like this for quite a while, and this time, I can share my joy!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.farming, "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(118, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(388, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst zwei Silberstücke und deine Ackerbaufähigkeit steigt. Dein Ansehen bei Erzmagier Elvaine Morgan steigt."));
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.farming, "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 200));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(388, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(118, "=", 4));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("Lecker, lecker, lecker! Ihr macht mich froh, wirklich! So hab ich mich schon lange nicht mehr gefühlt und diesmal ist sogar jemand da, mit dem ich meine Freude teilen kann!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(118, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(388, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst zwei Silberstücke. Dein Ansehen bei Erzmagier Elvaine Morgan steigt."));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 200));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(388, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(118, "=", 4));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("Lecker, lecker, lecker! Ihr macht mich froh, wirklich! So hab ich mich schon lange nicht mehr gefühlt und diesmal ist sogar jemand da, mit dem ich meine Freude teilen kann!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.farming, "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(118, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(388, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded two silver coins and your farming skill increases."));
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.farming, "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 200));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(388, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(118, "=", 4));
talkEntry:addResponse("Tasty, tasty, tasty! You make me smile, really! I haven't felt like this for quite a while, and this time, I can share my joy!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(118, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(388, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded two silver coins."));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 200));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(388, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(118, "=", 4));
talkEntry:addResponse("Tasty, tasty, tasty! You make me smile, really! I haven't felt like this for quite a while, and this time, I can share my joy!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.farming, "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(118, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(388, "all", ">", 9, nil));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst zwei Silberstücke und deine Ackerbaufähigkeit steigt."));
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.farming, "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 200));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(388, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(118, "=", 4));
talkEntry:addResponse("Lecker, lecker, lecker! Ihr macht mich froh, wirklich! So hab ich mich schon lange nicht mehr gefühlt und diesmal ist sogar jemand da, mit dem ich meine Freude teilen kann!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(118, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(388, "all", ">", 9, nil));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst zwei Silberstücke."));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 200));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(388, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(118, "=", 4));
talkEntry:addResponse("Lecker, lecker, lecker! Ihr macht mich froh, wirklich! So hab ich mich schon lange nicht mehr gefühlt und diesmal ist sogar jemand da, mit dem ich meine Freude teilen kann!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(118, "=", 3));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Please, I do not enjoy many things in life anymore, but some grapes could really relieve my heart.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(118, "=", 3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Bitte, es gibt nicht mehr viele Dinge im Leben, die mich erfreuen. Einige Trauben könnten mich jetzt echt erheitern.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(118, "=", 3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("Please, I do not enjoy many things in life anymore, but some grapes could really relieve my heart.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(118, "=", 3));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Bitte, es gibt nicht mehr viele Dinge im Leben, die mich erfreuen. Einige Trauben könnten mich jetzt echt erheitern.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(118, "=", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("You can help me by... staying. Stay a little longer, that's all I ask for. Please!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(118, "=", 4));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Ihr könntet mir helfen... indem ihr noch eine Weile bleibt. Leistet mir noch etwas Gesellschaft, das ist alles, worum ich bitte!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(118, "=", 4));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("You can help me by... staying. Stay a little longer, that's all I ask for. Please!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(118, "=", 4));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Ihr könntet mir helfen... indem ihr noch eine Weile bleibt. Leistet mir noch etwas Gesellschaft, das ist alles, worum ich bitte!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("I am the gardener here, can't you see? Oh, sorry, I didn't mean to be rude.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Ich bin hier der Gärtner, sieht man das nicht? Oh, entschuldigt, ich wollte nicht unhöflich sein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("I am the gardener here, can't you see? Oh, sorry, I didn't mean to be rude.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Ich bin hier der Gärtner, sieht man das nicht? Oh, entschuldigt, ich wollte nicht unhöflich sein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Sorry, what did you say?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Entschuldigt, worüber redet ihr da?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("Oh, how interesting! Now I know the name of my new friend. I am Baldo, Baldo Proudtoe, my friend!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Oh, wie interessant, jetzt kenne ich auch den Namen meines neuen Freundes. Ich bin Baldo, Baldo Proudtoe, mein Freund.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Garden");
talkEntry:addResponse("My lovely garden is all that... remains. I care for it like I'd care for a child. At least I have something to do that distracts me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hedge");
talkEntry:addResponse("Aren't these hedges great? I cut them all day long to keep them in perfect shape. I wish more people would notice...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("lone");
talkEntry:addTrigger("sorrow");
talkEntry:addResponse("I am indeed lonely and I admit it... So, why don't you stay a little longer? I will as well!");
talkEntry:addResponse("This loneliness has become a friend of mine. At least I do not expect anything anymore, so all that happens can surprise me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tree");
talkEntry:addResponse("Ah, yes some trees would be fine, no? I mean, hedges are fine, but trees, they... stay for ages.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("murder");
talkEntry:addResponse("I am not the murderer! Prejudices!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Garten");
talkEntry:addResponse("Mein wunderbarer Garten ist alles, was mir geblieben ist. Ich kümmere mich um ihn wie um ein Kind. Wenigstens habe ich so etwas zu tun, was mich ablenkt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hecke");
talkEntry:addResponse("Sind diese Hecken nicht toll? Ich beschneide sie den ganzen Tag und halte sie in Form. Ich wünschte nur, dass dies jemanden auffallen würde...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("einsam");
talkEntry:addTrigger("Sorge");
talkEntry:addResponse("Ich bin zugegebenermaßen etwas einsam. Aber warum bleibt ihr nicht einfach noch ein wenig hier, ich bleibe ja auch noch!");
talkEntry:addResponse("Die Einsamkeit ist schon fast zu einem Freund geworden. Ich erwarte einfach nichts mehr, also kann mich alles überraschen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Baum");
talkEntry:addTrigger("Bäume");
talkEntry:addResponse("Ach ja, ein paar Bäume würden sich hier gut machen, nicht wahr? Ich meine, Hecken sind klasse, aber Bäume, davon hat man deutlich mehr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Mörder");
talkEntry:addResponse("Ich bin nicht der Mörder! Vorurteile!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addResponse("The Archmage is my friend! He talked to me years ago about my garden, but I still feel that he thinks about me from time to time.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Der Erzmagier ist mein Freund! Er hat vor einigen Jahren mal mit mir über meinen Garten geredet und ich fühle, dass er von Zeit zu Zeit noch an mich denkt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("The Archmage is my friend! He talked to me years ago about my garden, but I still feel that he thinks about me from time to time.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Der Erzmagier ist mein Freund! Er hat vor einigen Jahren mal mit mir über meinen Garten geredet und ich fühle, dass er von Zeit zu Zeit noch an mich denkt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Runewick is a nice place to be but some of its citizens are so... snobby!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Runewick ist eigentlich ein netter Ort, wenn manche seiner Bewohner nicht so hochnäsig wären.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Who's that? Tell me more about this person.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Wer soll das sein? Erzählt mir mehr über ihn.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Ich weiß absolut nichts über Galmair, außer, dass es weit weg ist.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("I just know that Galmair is far away from here.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Queen");
talkEntry:addResponse("Queen Rosaline is a witch! Hear what I say: A witch!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königin");
talkEntry:addResponse("Königin Rosaline ist eine Hexe! Hört auf meine Worte: Eine Hexe!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Queen Rosaline is a witch! Hear what I say: A witch!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Königin Rosaline ist eine Hexe! Hört auf meine Worte: Eine Hexe!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Cadomyr, that is an arid and dry land. Who would like to settle there!?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Cadomyr, das ist trockenes und unfruchtbares Land. Wer würde da schon gerne wohnen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("albar");
talkEntry:addResponse("One day, I'll move to Albar I guess. Maybe I'll get more attention there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("Eines Tages werde ich wohl nach Albar ziehen. Wenigstens werde ich dort auffallen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addResponse("I do not know anything about Gynk, sorry.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("Ich weiß rein gar nichts über Gynk, tut mir leid.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("salkama");
talkEntry:addResponse("I heard they have nice gardens in Salkamar, but that is all I have heard; people do not talk much to me these days.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Ich hörte, sie haben schöne Gärten in Salkamar. Aber das ist auch alles, was ich weiß; die Leute reden eher wenig mit mir in letzter Zeit.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("The gods are my friends. I have never seen them, but they listen to my prayers I think. Oldra is my favourite!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Die Götter sind meine Freunde. Ich hab sie zwar noch nie gesehen, aber sie erhören meine Gebete. Oldra ist meine Lieblingsgöttin!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Adron");
talkEntry:addResponse("Oh yes, hehe, I really adore Adron. You got me. But you'd drink a little wine or more as well, being as lonely as me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Adron");
talkEntry:addResponse("Oh ja, hehe, ich verehre Adron, ihr habt mich erwischt. Aber wenn ihr so einsam wie ich wäret, würdet ihr auch mitunter mal einen guten Wein kosten wollen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("I guess without Oldra and her wonders, I'd have gone insane by now. Beholding the plants grow compensates for my sorrows.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("Ich denke, ohne Oldra und ihre Wunder wäre ich schon verrückt geworden. Den Pflanzen beim Wachsen zuzusehen erleichtert es mir, mit meinen Sorgen klarzukommen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("Tanora sends the rain, so I should thank her from time to time, but not too often, hihi.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("Tanora bringt uns den Regen, also sollte ich ihr hin und wieder dankbar sein. Aber bitte nicht zu oft, hihi.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("Ushara, did you know that some call her Ushi, hihi? Actually, I respect the Five elder gods, but I do not really know whether they care for me or not.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("Ushara, wußtet ihr, dass manche sie Ushi nennen, hihi? Aber ich respektiere die Fünf alten Götter natürlich, wobei ich gar nicht so genau weiß, ob sie das interessiert.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkEntry:addResponse("I am just the gardener here. If you want tothings, go to the market place of Runewick.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Ich bin doch hier nur der Gärtner. Wenn ihr Waren handeln wollt, geht doch zum Marktplatz von Runewick.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("I am not a storyteller, but I enjoy our communication! It is much better than talking to the hedges, all alone, you know...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Ich bin nicht gerade der beste Geschichtenerzähler. Aber ich schätze eure Gesellschaft. Weit besser, als hier einsam Selbstgespräche zu führen...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Baldo");
talkEntry:addTrigger("Proudtoe");
talkEntry:addResponse("Us Proudtoes are very proud of our toes!");
talkEntry:addResponse("An ancestor of mine had a very big toe. Thus, my family has the name Proudtoe!");
talkEntry:addResponse("I'm not proud of what I am or do - but I am proud of my toes!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Baldo");
talkEntry:addTrigger("Proudtoe");
talkEntry:addResponse("Wir Proudtoes sind sehr stolz auf unsere Zehen!");
talkEntry:addResponse("Einer meiner Vorfahren hatte einen riesigen Zeh. Also ist der Name meiner Familie Proudtoe!");
talkEntry:addResponse("Ich bin nicht stolz darauf, was ich bin oder mache - aber ich bin auf meine Zehen stolz!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("Oh yes, indeed.");
talkEntry:addResponse("Absolutely.");
talkEntry:addResponse("I couldn't agree more!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("Oh ja, wirklich.");
talkEntry:addResponse("Absolut.");
talkEntry:addResponse("Ich bin vollkommen überzeugt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("Oh no, not really.");
talkEntry:addResponse("Seriously?");
talkEntry:addResponse("I couldn't agree less.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("Oh, nicht wirklich, oder?");
talkEntry:addResponse("Im Ernst?");
talkEntry:addResponse("Das sehe ich aber anders.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Samwise");
talkEntry:addResponse("How come everyone asks me about a 'Samwise'?");
talkEntry:addResponse("My name is not 'Samwise'! Who is that, anyway?");
talkEntry:addResponse("Pardon me? 'Samwise', who's that? ");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Samwise");
talkEntry:addResponse("Warum fragt mich eigentlich jeder über einen gewissen 'Samwise'?");
talkEntry:addResponse("Mein Name ist nicht 'Samwise'. Wer ist das überhaupt?");
talkEntry:addResponse("Pardon? 'Samwise', wer soll das sein?");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me klappert mit einer Heckenschere.", "#me rattles with hedge clippers.");
talkingNPC:addCycleText("Willkommen in meinem Garten!", "Welcome to my garden!");
talkingNPC:addCycleText("Immer dieses Unkraut überall!", "Weed, everywhere is weed!");
talkingNPC:addCycleText("#me jätet vor sich hingrummelnd Unkraut.", "#me pulls up weed, cursing to himself.");
talkingNPC:addCycleText("Latscht mir auf die Zehen und es setzt was!", "Step on my toes and you'll see something coming!");
talkingNPC:addCycleText("Ach, wenn mich nur öfter jemand besuchen würde...", "Oh, if only someone visited me sometimes...");
talkingNPC:addCycleText("Diese Einsamkeit macht mich noch verrückt!", "Loneliness is killing me!");
talkingNPC:addCycleText("Ach meine Hecken, ihr lasst mich nicht im Stich, richtig?", "My hedges, you won't leave me alone, will you?");
talkingNPC:addCycleText("Ich sollte hier noch einige Bäume pflanzen.", "I should plant some trees here... and over there.");
talkingNPC:addCycleText("Ist mein Garten nicht wundervoll?", "Isn't my garden marvellous?");
mainNPC:addLanguage(0);
mainNPC:addLanguage(5);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Dieser NPC ist Baldo Proudtoe der Gärtner.", "This NPC is Baldo Proudtoe the gardener.");
mainNPC:setUseMessage("Fasst mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut verwirrt.", "#me looks around confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 810);
mainNPC:setEquipment(11, 0);
mainNPC:setEquipment(5, 24);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 48);
mainNPC:setEquipment(9, 34);
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
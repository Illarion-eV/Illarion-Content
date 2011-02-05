--------------------------------------------------------------------------------
-- NPC Name: Zaida                                                   Runewick --
-- NPC Job:  Apprentice                                                       --
--                                                                            --
-- NPC Race: human                      NPC Position:  900, 768, 0            --
-- NPC Sex:  female                     NPC Direction: south                  --
--                                                                            --
-- Authors:  Cromwell                                                         --
--           Estralis                                                         --
--                                                                            --
-- Last parsing: February 05, 2011                       easyNPC Parser v1.02 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (0, 900, 768, 0, 4, 'Zaida', 'npc.zaida', 1, 1, 0, 205, 102, 0, 198, 147, 105);
---]]

require("npc.base.basic")
require("npc.base.condition.item")
require("npc.base.condition.language")
require("npc.base.condition.quest")
require("npc.base.condition.town")
require("npc.base.consequence.deleteitem")
require("npc.base.consequence.inform")
require("npc.base.consequence.quest")
require("npc.base.consequence.rankpoints")
require("npc.base.talk")
module("npc.zaida", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 0");
talkEntry:addResponse("Quest status set to 0");
talkEntry:addConsequence(npc.base.consequence.quest.quest(76, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 1");
talkEntry:addResponse("Quest status set to 1");
talkEntry:addConsequence(npc.base.consequence.quest.quest(76, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 2");
talkEntry:addResponse("Quest status set to 2");
talkEntry:addConsequence(npc.base.consequence.quest.quest(76, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hello");
talkEntry:addTrigger("Greetings");
talkEntry:addTrigger("Be greeted");
talkEntry:addTrigger("Hail");
talkEntry:addTrigger("Good day");
talkEntry:addTrigger("Good morning");
talkEntry:addTrigger("Good evening");
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Runewick's Gossiper"));
talkEntry:addResponse("#me nods her head respectfully: 'Be greeted, traveler. Should you wish to join my company, you must first bring me a glass filled with wine. Then, if it still pleases you, we may discuss.'");
talkEntry:addConsequence(npc.base.consequence.quest.quest(76, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hello");
talkEntry:addTrigger("Greetings");
talkEntry:addTrigger("Be greeted");
talkEntry:addTrigger("Hail");
talkEntry:addTrigger("Good day");
talkEntry:addTrigger("Good morning");
talkEntry:addTrigger("Good evening");
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addResponse("#me nods respectfully: 'Greetings. Now that you have fulfilled my request, you may disturb me with your presence and bother me with your questions.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greebas");
talkEntry:addTrigger("Greebs");
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Runewick's Gossiper"));
talkEntry:addResponse("#me's lips form a somewhat condescending smile. 'Greetings, traveler. Should you wish to ask me something, you must first bring me a glass full of wine.'");
talkEntry:addConsequence(npc.base.consequence.quest.quest(76, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greebas");
talkEntry:addTrigger("Greebs");
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("#me nods once. 'Very well, now that you have done your part, I presume that I must do mine as well...'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Runewick's Gossiper"));
talkEntry:addResponse("#me frowns and brushes over the front of her apprentice's robe. 'I feel thirsty. Until I have a glas full of wine, I will not be much of assistance for you.'");
talkEntry:addConsequence(npc.base.consequence.quest.quest(76, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addResponse("I feel reinvigorated, thank you for asking.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Runewick's Gossiper"));
talkEntry:addResponse("#me smiles in a slightly condescending way. 'A task? I give you a most demanding one; Fetch me a glass of wine and as a reward for your quest, I shall answer your questions.'");
talkEntry:addConsequence(npc.base.consequence.quest.quest(76, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Now it is your turn to ask what you wish to know, traveler. I know all about the town.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("#me points at the innkeeper. 'Bring me a glass of wine, and I answer your questions. Should be simple enough, I presume.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("question");
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Runewick's Gossiper"));
talkEntry:addResponse("#me smiles in a slightly condescending way. 'A task? I give you a most demanding one; Fetch me a glass of wine and as a reward for your quest, I shall answer your questions.'");
talkEntry:addConsequence(npc.base.consequence.quest.quest(76, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("question");
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addResponse("Now it is your turn to ask what you wish to know, traveler. I know all about the town.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("what");
talkEntry:addTrigger("question");
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 1));
talkEntry:addResponse("#me points at the innkeeper. 'Bring me a glass of wine, and I answer your questions. Should be simple enough, I presume.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Good bye");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare thee well");
talkEntry:addResponse("Until next time, traveler!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Farewell, traveler!");
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
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Die Schwätzerin von Runewick"));
talkEntry:addResponse("#me nickt respektvoll mit dem Kopf: 'Seid gegrüßt, Reisender. Wenn ihr meine Gesellschaft genießen wollt, so bringt mir doch ein Glas Wein zunächst. Dann, wenn ihr es noch wünscht, können wir diskutieren.'");
talkEntry:addConsequence(npc.base.consequence.quest.quest(76, "=", 1));
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
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addResponse("#me nickt respektvoll: 'Seid gegrüßt. Nun, da ihr meiner Bitte entsprochen habt, könnt ihr mich mit eurer Anwesenheit belästigen und mich mit euren Fragen nerven.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greebas");
talkEntry:addTrigger("Greebs");
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Die Schwätzerin von Runewick"));
talkEntry:addResponse("#me lächelt herablassend. 'Seid gegrüßt, Reisender. Solltet ihr mich etwas fragen wollen, so müsst ihr mir zunächst ein Glas Wein bringen.'");
talkEntry:addConsequence(npc.base.consequence.quest.quest(76, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greebas");
talkEntry:addTrigger("Greebs");
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("#me nickt knapp. 'Nun denn, da ihr euren Teil der Abmachung eingehalten habt, ist es nun an mir, meinen Teil zu leisten.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Die Schwätzerin von Runewick"));
talkEntry:addResponse("#me blickt missbilligend drein und streicht über ihre Anwärterinnenrobe. 'Ich bin durstig. Solange ich kein Glas voll Wein habe, kann ich euch nicht wirklich beistehen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(76, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addResponse("Ich fühle mich wie neu geboren, danke der Nachfrage.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Die Schwätzerin von Runewick"));
talkEntry:addResponse("#me lächelt etwas herablassend. 'Eine Aufgabe? Ich gebe euch die schwerste von allen; Bringt mir ein Glas Wein und als Belohnung für eure Mühen werde ich eure Fragen beantworten.'");
talkEntry:addConsequence(npc.base.consequence.quest.quest(76, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Nun ist es an euch, die Dinge zu erfragen, die ihr wissen wollt. Denn ich kenne mich wahrhaftig gut in der Stadt aus.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 1));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("#me deutet auf den Wirt. 'Bringt mir ein Glas Wein und ich werde eure Fragen beantworten. Sollte nicht allzu schwer sein, möchte man meinen.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Frage");
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Die Schwätzerin von Runewick"));
talkEntry:addResponse("#me lächelt etwas herablassend. 'Eine Aufgabe? Ich gebe euch die schwerste von allen; Bringt mir ein Glas Wein und als Belohnung für eure Mühen werde ich eure Fragen beantworten.'");
talkEntry:addConsequence(npc.base.consequence.quest.quest(76, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Frage");
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addResponse("Nun ist es an euch, die Dinge zu erfragen, die ihr wissen wollt. Denn ich kenne mich wahrhaftig gut in der Stadt aus.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Frage");
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 1));
talkEntry:addResponse("#me deutet auf den Wirt. 'Bringt mir ein Glas Wein und ich werde eure Fragen beantworten. Sollte nicht allzu schwer sein, möchte man meinen.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehabt euch wohl");
talkEntry:addResponse("Bis zum nächsten mal, Reisender.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Gehabt euch wohl, Reisender.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("My name is Zaida. One day, I'll be a honourable magician, right now, I am just thirsty.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("Mein Name ist Zaida. Eines Tages werde ich eine ehrenhafte Magierin sein, jetzt bin ich aber erstmal durstig.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2057, "all", ">", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] Zaida will now answer your questions. You advance in archmage Elvaine Morgan's favour."));
talkEntry:addResponse("#me takes the glass and smiles: 'Thank you very much. Now that you have given me the wine, I can answer your questions... be they about the town, our archmage, Runewick or our neighbours - whom the gods should bless with pox.'");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2057, 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(76, "=", 2));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Runewick", "+", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2057, "all", ">", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] Zaida will now answer your questions."));
talkEntry:addResponse("#me takes the glass and smiles: 'Thank you very much. Now that you have given me the wine, I can answer your questions.. be they about the town, our lady, runewick or our neighbours - whom the gods should bless with pox.'");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2057, 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(76, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2057, "all", ">", 0));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] Zaida wird nun deine Fragen beantworten. Dein Ansehen bei Erzmagier Elvaine Morgan steigt."));
talkEntry:addResponse("#me nimmt das Glas und lächelt: 'Vielen, vielen dank. Nun da ihr mir Wein gebracht habt, kann ich eure Fragen beantworten, sei es über die Stadt, den Erzmagier, Runewick oder unsere Nachbarn - denen die Götter die Pest schicken mögen.'");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2057, 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(76, "=", 2));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Runewick", "+", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2057, "all", ">", 0));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] Zaida wird nun deine Fragen beantworten."));
talkEntry:addResponse("#me nimmt das Glas und lächelt: 'Vielen, vielen dank. Nun da ihr mir Wein gebracht habt, kann ich eure Fragen beantworten, sei es über die Stadt, den Erzmagier, Runewick oder unsere Nachbarn - denen die Götter die Pest schicken mögen.'");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2057, 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(76, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2057, "all", "<", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Where is my wine?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2057, "all", "<", 1));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Wo bleibt mein Wein?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("town");
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addResponse("#me smiles: 'This town is one where the clear minds may learn and become wise amongst their peers. We are the pinnacle of knowledge, a beacon of civilization in the land. All thanks to the wisdom of Archmage Morgan.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Archmage");
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addResponse("Elvaine Morgan, the Archmage of Runewick is our wise and glorious leaders. He is of both high birth and intellect, which is hardly what can be said of the so called 'leaders' of the other towns!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("#me casts a light smile at you. 'I see that you have been keeping your ears open, very good. He is indeed the guiding hand and protecting lion of our orderly community.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("knowledge");
talkEntry:addTrigger("wisdom");
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addResponse("Knowledge and wisdom are the two most important qualities of a person. The sharpness of one's mind and the judgment to use the mind well are the true makers of a great man... or a woman.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addResponse("We are faithful servants of the gods here in Runewick. Of course, we avoid the foolish fanaticsm of Cadomyr. We should be free to pursuit knowledge, not stagnation.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("like[s]");
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addResponse("Our Archmage likes order... so behave yourself and he will bless you with his kindness. Altough, I must admit that he has a weakness for magical trinkets and books.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gift");
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addResponse("A Gift? For the Archmage? Well, if you manage to find a rare book or a magical artifact, then I think such extraordinary items are what please him the most.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("wine");
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addResponse("#me smiles lightly: 'My thanks for the wine, traveler. Do you have some questions you wish that I answer?'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("neighbo");
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addResponse("#me frowns displeased: 'May the gods damn Cadomyr and Galmair, those treacherous, land-stealing fools!'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("#me appears disgusted at the name. 'A den of sin and vice, where a wise person will always keep his back against a wall. Those scoundrels will either rob or sell their grandmother for two coppers if they have the chance!'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("apprentice");
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addResponse("I am indeed an apprentice-mage, but I can speak no more about that without upsetting my master.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Runewick, our shining pearl of the land! We are the thinkers, the rightful lords and owners of this land. One day we will show those filthy squatters their rightful place!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Simple-minded fools, who have spent so much time in the desert that the scorching sun has fried their brains. They can only grasp... very rudimentary ideas and concepts, and thus you see the halfwits only dribble about honour.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Stadt");
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addResponse("#me lächelt: 'Diese Stadt ist Ort, an dem erleuchtete Seelen lernen und weise werden können. Wir sind die Zinne des Wissens, der Leuchtturm der Zivilisation in diesen Landen. All das verdanken wir Erzmagier Morgan.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addResponse("Elvaine Morgan, Erzmagier von Runewick, ist unser weiser und glorreicher Anführer. Hochgeboren und mit Weisheit ausgestatten, dies kann man kaum von den anderen so genannten 'Anführern' der anderen Städte behaupten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("#me wirft dir ein Lächeln zu: 'Ich sehe, ihr habt eure Ohren offen gehalten, sehr gut. Er ist wirklich die führende Hand und der schützende Löwe unserer wohlgeordneten Gemeinschaft.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("wissen");
talkEntry:addTrigger("weisheit");
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Wissen und Weisheit sind die beiden wichtigstens Eigenschaften einer Person. Die Schärfe des Verstandes und das Können, den Verstand auch einzusetzen sind die wahren Adelszeichen eines Mannes... oder einer Frau.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gott");
talkEntry:addTrigger("götter");
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addResponse("Wir sind fromme Diener der Götter hier in Runewick. Selbstredend vermeiden wir den blinden Fanatismus derer aus Cadomyr. Wir sollten alle frei sein, der Weisheit nachzutrachten, nicht aber in Stagnation verfallen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Vorliebe");
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addResponse("Unser Erzmagier mag die Ordnung. Also behnehmt euch und er wird euch mit Wohlwollen segnen. Allerdings muss ich eingestehen, dass er eine Vorliebe für magische Dinge und Bücher hat.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("geschenk");
talkEntry:addTrigger("präsent");
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addResponse("Ein Geschenk? Für den Erzmagier? Nun, wenn ihr ein seltenes Buch oder ein magisches Artefakt findet, dann denke ich, dass so ein seltenes Etwas ihm sehe gefallen würde.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wein");
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addResponse("#me lächelt sanft: 'Vielen Dank für den Wein, Reisender. Habt ihr Fragen, die ich euch beantworten kann?'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nachbar");
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addResponse("#me zischt missbilligend: 'Mögen die Götter Cadomyr und Galmair, diese verräterischen Landdiebe, verdammen!'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("#me blickt angewidert drein. 'Ein Hort der Sünde und des Lasters, wo eine weise Person stets ihren Rücken von einer Mauer gedeckt weiß. Diese Hunde werden einen entweder ausrauben or ihre Großmutter für zwei Kupferstücke verkaufen.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("anwärter");
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addResponse("Ich bin in der Tat eine Anwärterin der Magierschaft, aber ich sollte darüber nicht mehr sprechen, als meinem Meister lieb ist.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Runewick, die strahlende Perle des Landes! Wir sind die Denker und rechtmäßigen Herren der Ländereien. Eines Tages werden wir diesen dreckigen Tunichtguten ihren rechtmäßigen Platz zuweisen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Törrichte Tore, die so lange in der Wüste rumgestanden haben, bis die sengende Sonne ihnen das Hirn verbrannt hat. Sie verstehen nur sehr einfache Konzepte und Ideen, daher brabbeln sie nur halbherzig von ihrer Ehre.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("I spend my days studying, so that one day I may claim the title of a mage.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tavern");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Good wine, lousy service... as you may have noticed.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Ich verbringe meine Tage damit, zu studieren, damit ich einst den Titel eines Magiers führen darf.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tavern");
talkEntry:addResponse("Guter Wein, aber schlechter Service. Aber das habt ihr wohl selbst auch schon festgestellt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game help] This NPC is Zaida the Apprentice. To learn more about her, your should greet the NPC first."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist die Anwärterin Zaida. Um mehr über sie zu erfahren, grüße sie zunächst."));
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("Nur in Runewick kann man einer intelligenten Diskussion fröhnen. In Galmair wird man eher ausgeraubt und in Cadomyr haben sie nur Sand im Kopf.", "Only in Runewick it is possible to enjoy the delights of an intelligent discussion. In Galmair they are trying to rob you, and Cadomyrians have... sand for brains.");
talkingNPC:addCycleText("#me blättert gedankenverloren in einem alten Buch. Sie starrt dabei auf ein leeres Weinglas, das leer erscheint.", "#me absently turns the page of an old journal, while glancing at a glass of wine that seems to be empty.");
talkingNPC:addCycleText("#me räuspert sich: 'Wirt, etwas mehr Wein, bitte... Wirt? Bei den Göttern!", "#me clears her throat: 'Innkeeper, more wine, please... Innkeeper? Gods.'");
talkingNPC:addCycleText("#me ist eine junge Dame, gekleidet in der Tracht einer angehenden Magierin. Ihre Kleidung trägt das Wappen Runewicks. 'Ich weiß alles über Runewick.' murmelt sie vor sich hin.", "#me is a young woman, wearing the attire of an aspiring mage. Her clothes bear the colours of Runewick. 'I know everything about Runewick', she mutters.");
talkingNPC:addCycleText("#me tippt mit ihren langen Fingernägeln gegen ihr leeres Glas, ein hohles, klirrendes Geräusch ist zu vernehmen.", "#me absently taps on the side of her empty glass with her long fingernail, causing a faint, hollow sound to be heard.");
talkingNPC:addCycleText("#me murmelt genervt: 'Wenn ich es nicht besser wüßte, könnte man meinen, der Wirt wäre noch so ein Halunke aus Galmair mit Dung in den Ohren.", "#me mutters with an irritated voice: 'I swear that if I did not already know better, I would be certain that the innkeeper is another Galmairian crook with his ears full of manure.'");
talkingNPC:addCycleText("#me lässt ihre Augen hochmütig durch die Taverne wandern. Jedem, der ihr fremd erscheint, wirft sie einen Blick mit einer Mischung aus Neugierde und Misstrauen zu.", "#me glances around the tavern with an air of haught surrounding her, eyeing all those who appear foreign with a gaze that is mixed with both curiosity and suspicion.'");
mainNPC:addLanguage(0);
mainNPC:addLanguage(1);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Das ist ein NPC dessen Entwickler zu faul war eine Beschreibung einzutragen.", "This is a NPC who's developer was too lazy to type in a description.");
mainNPC:setUseMessage("Fass mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut dich verwirrt an.", "#me looks at you confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 846);
mainNPC:setEquipment(11, 0);
mainNPC:setEquipment(5, 57);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 48);
mainNPC:setEquipment(9, 827);
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
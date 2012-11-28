--------------------------------------------------------------------------------
-- NPC Name: Zaida                                                   Runewick --
-- NPC Job:  Apprentice                                                       --
--                                                                            --
-- NPC Race: human                      NPC Position:  900, 768, 0            --
-- NPC Sex:  female                     NPC Direction: south                  --
--                                                                            --
-- Authors:  Cromwell                                                         --
--           Estralis                                                         --
--                                                       easyNPC Parser v1.21 --
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
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 0));
talkEntry:addTrigger("Hello");
talkEntry:addTrigger("Greet");
talkEntry:addTrigger("Hail");
talkEntry:addTrigger("Good day");
talkEntry:addTrigger("Good morning");
talkEntry:addTrigger("Good evening");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Runewick's Gossiper"));
talkEntry:addResponse("#me nods her head respectfully: 'Be greeted, traveler. Should you wish to join my company, you must first bring me a glass filled with wine. Then, if it still pleases you, we may discuss.'");
talkEntry:addConsequence(npc.base.consequence.quest.quest(76, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2057, "all", "<", 1, nil));
talkEntry:addTrigger("Hello");
talkEntry:addTrigger("Greet");
talkEntry:addTrigger("Hail");
talkEntry:addTrigger("Good day");
talkEntry:addTrigger("Good morning");
talkEntry:addTrigger("Good evening");
talkEntry:addResponse("#me points at the innkeeper. 'Bring me a glass of wine, and I answer your questions. Should be simple enough, I presume.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addTrigger("Hello");
talkEntry:addTrigger("Greet");
talkEntry:addTrigger("Hail");
talkEntry:addTrigger("Good day");
talkEntry:addTrigger("Good morning");
talkEntry:addTrigger("Good evening");
talkEntry:addResponse("#me nods respectfully: 'Greetings. Now that you have fulfilled my request, you may disturb me with your presence and bother me with your questions.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Runewick's Gossiper"));
talkEntry:addResponse("#me's lips form a somewhat condescending smile. 'Greetings, traveler. Should you wish to ask me something, you must first bring me a glass full of wine.'");
talkEntry:addConsequence(npc.base.consequence.quest.quest(76, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2057, "all", "<", 1, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("#me points at the innkeeper. 'Bring me a glass of wine, and I answer your questions. Should be simple enough, I presume.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("#me nods once. 'Very well, now that you have done your part, I presume that I must do mine as well...'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 0));
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Runewick's Gossiper"));
talkEntry:addResponse("#me frowns and brushes over the front of her apprentice's robe. 'I feel thirsty. Until I have a glas full of wine, I will not be much of assistance for you.'");
talkEntry:addConsequence(npc.base.consequence.quest.quest(76, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2057, "all", "<", 1, nil));
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("#me points at the innkeeper. 'Bring me a glass of wine, and I answer your questions. Should be simple enough, I presume.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("I feel reinvigorated, thank you for asking.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Until next time, traveler!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addResponse("Farewell, traveler!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 0));
talkEntry:addTrigger("Grüß");
talkEntry:addTrigger("Gruß");
talkEntry:addTrigger("Guten Tag");
talkEntry:addTrigger("Guten Abend");
talkEntry:addTrigger("Mahlzeit");
talkEntry:addTrigger("Tach");
talkEntry:addTrigger("Moin");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Die Schwätzerin von Runewick"));
talkEntry:addResponse("#me nickt respektvoll mit dem Kopf: 'Seid gegrüßt, Reisender. Wenn ihr meine Gesellschaft genießen wollt, so bringt mir doch ein Glas Wein zunächst. Dann, wenn ihr es noch wünscht, können wir diskutieren.'");
talkEntry:addConsequence(npc.base.consequence.quest.quest(76, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2057, "all", "<", 1, nil));
talkEntry:addTrigger("Grüß");
talkEntry:addTrigger("Gruß");
talkEntry:addTrigger("Guten Tag");
talkEntry:addTrigger("Guten Abend");
talkEntry:addTrigger("Mahlzeit");
talkEntry:addTrigger("Tach");
talkEntry:addTrigger("Moin");
talkEntry:addResponse("#me deutet auf den Wirt. 'Bringt mir ein Glas Wein und ich werde eure Fragen beantworten. Sollte nicht allzu schwer sein, möchte man meinen.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addTrigger("Grüß");
talkEntry:addTrigger("Gruß");
talkEntry:addTrigger("Guten Tag");
talkEntry:addTrigger("Guten Abend");
talkEntry:addTrigger("Mahlzeit");
talkEntry:addTrigger("Tach");
talkEntry:addTrigger("Moin");
talkEntry:addResponse("#me nickt respektvoll: 'Seid gegrüßt. Nun, da ihr meiner Bitte entsprochen habt, könnt ihr mich mit eurer Anwesenheit belästigen und mich mit euren Fragen nerven.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 0));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Die Schwätzerin von Runewick"));
talkEntry:addResponse("#me lächelt herablassend. 'Seid gegrüßt, Reisender. Solltet ihr mich etwas fragen wollen, so müsst ihr mir zunächst ein Glas Wein bringen.'");
talkEntry:addConsequence(npc.base.consequence.quest.quest(76, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2057, "all", "<", 1, nil));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("#me deutet auf den Wirt. 'Bringt mir ein Glas Wein und ich werde eure Fragen beantworten. Sollte nicht allzu schwer sein, möchte man meinen.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("#me nickt knapp. 'Nun denn, da ihr euren Teil der Abmachung eingehalten habt, ist es nun an mir, meinen Teil zu leisten.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 0));
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Die Schwätzerin von Runewick"));
talkEntry:addResponse("#me blickt missbilligend drein und streicht über ihre Anwärterinnenrobe. 'Ich bin durstig. Solange ich kein Glas voll Wein habe, kann ich euch nicht wirklich beistehen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(76, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2057, "all", "<", 1, nil));
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addResponse("#me deutet auf den Wirt. 'Bringt mir ein Glas Wein und ich werde eure Fragen beantworten. Sollte nicht allzu schwer sein, möchte man meinen.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addResponse("Ich fühle mich wie neu geboren, danke der Nachfrage.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Bis zum nächsten mal, Reisender.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addResponse("Gehabt euch wohl, Reisender.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ihr name");
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
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Runewick's Gossiper"));
talkEntry:addResponse("#me smiles in a slightly condescending way. 'A task? I give you a most demanding one; Fetch me a glass of wine and as a reward for your quest, I shall answer your questions.'");
talkEntry:addConsequence(npc.base.consequence.quest.quest(76, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Now it is your turn to ask what you wish to know, traveler. I know all about the town.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2057, "all", "<", 1, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("#me points at the innkeeper. 'Bring me a glass of wine, and I answer your questions. Should be simple enough, I presume.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 0));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("question");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Runewick's Gossiper"));
talkEntry:addResponse("#me smiles in a slightly condescending way. 'A task? I give you a most demanding one; Fetch me a glass of wine and as a reward for your quest, I shall answer your questions.'");
talkEntry:addConsequence(npc.base.consequence.quest.quest(76, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("question");
talkEntry:addResponse("Now it is your turn to ask what you wish to know, traveler. I know all about the town.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2057, "all", "<", 1, nil));
talkEntry:addTrigger("task");
talkEntry:addTrigger("what");
talkEntry:addTrigger("question");
talkEntry:addResponse("#me points at the innkeeper. 'Bring me a glass of wine, and I answer your questions. Should be simple enough, I presume.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 0));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Die Schwätzerin von Runewick"));
talkEntry:addResponse("#me lächelt etwas herablassend. 'Eine Aufgabe? Ich gebe euch die schwerste von allen; Bringt mir ein Glas Wein und als Belohnung für eure Mühen werde ich eure Fragen beantworten.'");
talkEntry:addConsequence(npc.base.consequence.quest.quest(76, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Nun ist es an euch, die Dinge zu erfragen, die ihr wissen wollt. Denn ich kenne mich wahrhaftig gut in der Stadt aus.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2057, "all", "<", 1, nil));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("#me deutet auf den Wirt. 'Bringt mir ein Glas Wein und ich werde eure Fragen beantworten. Sollte nicht allzu schwer sein, möchte man meinen.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 0));
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Frage");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Die Schwätzerin von Runewick"));
talkEntry:addResponse("#me lächelt etwas herablassend. 'Eine Aufgabe? Ich gebe euch die schwerste von allen; Bringt mir ein Glas Wein und als Belohnung für eure Mühen werde ich eure Fragen beantworten.'");
talkEntry:addConsequence(npc.base.consequence.quest.quest(76, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Frage");
talkEntry:addResponse("Nun ist es an euch, die Dinge zu erfragen, die ihr wissen wollt. Denn ich kenne mich wahrhaftig gut in der Stadt aus.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2057, "all", "<", 1, nil));
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Frage");
talkEntry:addResponse("#me deutet auf den Wirt. 'Bringt mir ein Glas Wein und ich werde eure Fragen beantworten. Sollte nicht allzu schwer sein, möchte man meinen.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2057, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] Zaida will now answer your questions. You advance in archmage Elvaine Morgan's favour."));
talkEntry:addResponse("#me takes the glass and smiles: 'Thank you very much. Now that you have given me the wine, I can answer your questions... be they about the town, our archmage, Runewick or our neighbours - whom the gods should bless with pox.'");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2057, 1, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(76, "=", 2));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2057, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] Zaida will now answer your questions."));
talkEntry:addResponse("#me takes the glass and smiles: 'Thank you very much. Now that you have given me the wine, I can answer your questions.. be they about the town, our lady, runewick or our neighbours - whom the gods should bless with pox.'");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2057, 1, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(76, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2057, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] Zaida wird nun deine Fragen beantworten. Dein Ansehen bei Erzmagier Elvaine Morgan steigt."));
talkEntry:addResponse("#me nimmt das Glas und lächelt: 'Vielen, vielen Dank. Nun da ihr mir Wein gebracht habt, kann ich eure Fragen beantworten, sei es über die Stadt, den Erzmagier, Runewick oder unsere Nachbarn - denen die Götter die Pest schicken mögen.'");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2057, 1, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(76, "=", 2));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2057, "all", ">", 0, nil));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] Zaida wird nun deine Fragen beantworten."));
talkEntry:addResponse("#me nimmt das Glas und lächelt: 'Vielen, vielen Dank. Nun da ihr mir Wein gebracht habt, kann ich eure Fragen beantworten, sei es über die Stadt, den Erzmagier, Runewick oder unsere Nachbarn - denen die Götter die Pest schicken mögen.'");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2057, 1, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(76, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2057, "all", "<", 1, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Where is my wine?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2057, "all", "<", 1, nil));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Wo bleibt mein Wein?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addTrigger("town");
talkEntry:addResponse("#me smiles: 'This town is one where the clear minds may learn and become wise amongst their peers. We are the pinnacle of knowledge, a beacon of civilization in the land. All thanks to the wisdom of Archmage Morgan.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addTrigger("knowledge");
talkEntry:addTrigger("wisdom");
talkEntry:addResponse("Knowledge and wisdom are the two most important qualities of a person. The sharpness of one's mind and the judgment to use the mind well are the true makers of a great man... or a woman.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addTrigger("like[s]");
talkEntry:addResponse("Our Archmage likes order... so behave yourself and he will bless you with his kindness. Altough, I must admit that he has a weakness for magical trinkets and books.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addTrigger("gift");
talkEntry:addResponse("A Gift? For the Archmage? Well, if you manage to find a rare book or a magical artifact, then I think such extraordinary items are what please him the most.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addTrigger("wine");
talkEntry:addResponse("#me smiles lightly: 'My thanks for the wine, traveler. Do you have some questions you wish that I answer?'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addTrigger("neighbo");
talkEntry:addResponse("#me frowns displeased: 'May the gods damn Cadomyr and Galmair, those treacherous, land-stealing fools!'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addTrigger("apprentice");
talkEntry:addResponse("I am indeed an apprentice-mage, but I can speak no more about that without upsetting my master.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addTrigger("Stadt");
talkEntry:addResponse("#me lächelt: 'Diese Stadt ist Ort, an dem erleuchtete Seelen lernen und weise werden können. Wir sind die Zinne des Wissens, der Leuchtturm der Zivilisation in diesen Landen. All das verdanken wir Erzmagier Morgan.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger("wissen");
talkEntry:addTrigger("weisheit");
talkEntry:addResponse("Wissen und Weisheit sind die beiden wichtigstens Eigenschaften einer Person. Die Schärfe des Verstandes und das Können, den Verstand auch einzusetzen sind die wahren Adelszeichen eines Mannes... oder einer Frau.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addTrigger("Vorliebe");
talkEntry:addResponse("Unser Erzmagier mag die Ordnung. Also behnehmt euch und er wird euch mit Wohlwollen segnen. Allerdings muss ich eingestehen, dass er eine Vorliebe für magische Dinge und Bücher hat.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addTrigger("geschenk");
talkEntry:addTrigger("präsent");
talkEntry:addResponse("Ein Geschenk? Für den Erzmagier? Nun, wenn ihr ein seltenes Buch oder ein magisches Artefakt findet, dann denke ich, dass so ein seltenes Etwas ihm sehe gefallen würde.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addTrigger("Wein");
talkEntry:addResponse("#me lächelt sanft: 'Vielen Dank für den Wein, Reisender. Habt ihr Fragen, die ich euch beantworten kann?'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addTrigger("Nachbar");
talkEntry:addResponse("#me zischt missbilligend: 'Mögen die Götter Cadomyr und Galmair, diese verräterischen Landdiebe, verdammen!'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addTrigger("anwärter");
talkEntry:addResponse("Ich bin in der Tat eine Anwärterin der Magierschaft, aber ich sollte darüber nicht mehr sprechen, als meinem Meister lieb ist.");
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
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("I spend my days studying, so that one day I may claim the title of a mage.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("tavern");
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
talkEntry:addTrigger("job");
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
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("I read about Gobaith in the library. A terrible fate for a beautiful island. But I also read they deserved it...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Ich habe über Gobaith in der Bibliothek gelesen. Ein schreckliches Schicksal für eine wunderschöne Insel. Aber ich habe ebenso gelesen, dass sie es nicht anders verdient haben...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("Oh, hello. Please take a seat.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Oh, hallo. Setzt euch doch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addTrigger("Archmage");
talkEntry:addResponse("Elvaine Morgan, the Archmage of Runewick is our wise and glorious leaders. He is of both high birth and intellect, which is hardly what can be said of the so called 'leaders' of the other towns!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("#me casts a light smile at you. 'I see that you have been keeping your ears open, very good. He is indeed the guiding hand and protecting lion of our orderly community.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Elvaine Morgan, Erzmagier von Runewick, ist unser weiser und glorreicher Anführer. Hochgeboren und mit Weisheit ausgestatten, dies kann man kaum von den anderen so genannten 'Anführern' der anderen Städte behaupten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("#me wirft dir ein Lächeln zu: 'Ich sehe, ihr habt eure Ohren offen gehalten, sehr gut. Er ist wirklich die führende Hand und der schützende Löwe unserer wohlgeordneten Gemeinschaft.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Runewick, our shining pearl of the land! We are the thinkers, the rightful lords and owners of this land. One day we will show those filthy squatters their rightful place!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Runewick, die strahlende Perle des Landes! Wir sind die Denker und rechtmäßigen Herren der Ländereien. Eines Tages werden wir diesen dreckigen Tunichtguten ihren rechtmäßigen Platz zuweisen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Don");
talkEntry:addTrigger("Lord");
talkEntry:addResponse("I love my life, so I prefer not to talk about Don Valerio in public.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addResponse("I love my life, so I prefer not to talk about Don Valerio in public.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addTrigger("Don");
talkEntry:addTrigger("Lord");
talkEntry:addResponse("Mir ist mein Leben lieb, also rede ich nicht so gerne über Don Valerio in aller Öffentlichkeit.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addResponse("Mir ist mein Leben lieb, also rede ich nicht so gerne über Don Valerio in aller Öffentlichkeit.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("#me appears disgusted at the name. 'A den of sin and vice, where a wise person will always keep his back against a wall. Those scoundrels will either rob or sell their grandmother for two coppers if they have the chance!'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("#me blickt angewidert drein. 'Ein Hort der Sünde und des Lasters, wo eine weise Person stets ihren Rücken von einer Mauer gedeckt weiß. Diese Hunde werden einen entweder ausrauben or ihre Großmutter für zwei Kupferstücke verkaufen.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addTrigger("Queen");
talkEntry:addResponse("For your ears only: I think the queen of Cadomyr is pretty. Pretty stupid!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addTrigger("Königin");
talkEntry:addResponse("So unter uns: Ich denke, die Königin von Cadomyr ist schön. Schön blöd!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("For your ears only: I think the queen of Cadomyr is pretty. Pretty stupid!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("So unter uns: Ich denke, die Königin von Cadomyr ist schön. Schön blöd!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Simple-minded fools, who have spent so much time in the desert that the scorching sun has fried their brains. They can only grasp... very rudimentary ideas and concepts, and thus you see the halfwits only dribble about honour.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Törrichte Tore, die so lange in der Wüste rumgestanden haben, bis die sengende Sonne ihnen das Hirn verbrannt hat. Sie verstehen nur sehr einfache Konzepte und Ideen, daher brabbeln sie nur halbherzig von ihrer Ehre.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("albar");
talkEntry:addResponse("Please bore somebody else with stories of the oh-so-noble Albarian kingdom.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("Bitte langweilt jemanden anderes mit Geschichten aus dem ach-so-edlen albarischen Königreich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addResponse("I have a big book about Gynk in my shelf. Because I do not care!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("Ich habe ein riesiges Buch über Gynk in meinem Schrank. Weil es mir egal ist!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Do not laugh - I will make it to Salkamar one day. And from there to Lor Angur and from there...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Lacht nicht, ich werde es nach Salkamar schaffen. Und von dort nach Lor Angur und von dort...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addTrigger("god");
talkEntry:addResponse("We are faithful servants of the gods here in Runewick. Of course, we avoid the foolish fanaticsm of Cadomyr. We should be free to pursuit knowledge, not stagnation.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addTrigger("gott");
talkEntry:addTrigger("götter");
talkEntry:addResponse("Wir sind fromme Diener der Götter hier in Runewick. Selbstredend vermeiden wir den blinden Fanatismus derer aus Cadomyr. Wir sollten alle frei sein, der Weisheit nachzutrachten, nicht aber in Stagnation verfallen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elara");
talkEntry:addResponse("Some say Elara is Eldan's daughter. They mean it metaphorically, of course.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addTrigger("Elara");
talkEntry:addResponse("Manche sagen, Elara sei Eldans Tochter. Aber das meinen sie metaphorisch, nicht wörtlich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Eldan");
talkEntry:addResponse("Some say Eldan is Elara's father. They mean it metaphorically, of course.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(76, "=", 2));
talkEntry:addTrigger("Eldan");
talkEntry:addResponse("Manche sagen, Eldan sei Elaras Vater. Aber das meinen sie metaphorisch, nicht wörtlich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("I do not trade, sorry.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Ich bin kein Händler.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("The wine is marvellous, isn't it?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Der Wein hier ist wunderbar, nicht wahr?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Zaida");
talkEntry:addResponse("Zaida is my name. Zaida the Apprentice.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zaida");
talkEntry:addResponse("Zaida ist mein Name. Zaida, die Anwärterin.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("Pardon?");
talkEntry:addResponse("Fine.");
talkEntry:addResponse("Indeed?");
talkEntry:addResponse("Really?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("Pardon?");
talkEntry:addResponse("Fein.");
talkEntry:addResponse("Wirklich?");
talkEntry:addResponse("Echt?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("Pardon?");
talkEntry:addResponse("Fine.");
talkEntry:addResponse("Indeed?");
talkEntry:addResponse("Really?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("Pardon?");
talkEntry:addResponse("Fein.");
talkEntry:addResponse("Wirklich?");
talkEntry:addResponse("Echt?");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("Nur in Runewick kann man einer intelligenten Diskussion fröhnen. In Galmair wird man eher ausgeraubt und in Cadomyr haben sie nur Sand im Kopf.", "Only in Runewick it is possible to enjoy the delights of an intelligent discussion. In Galmair they are trying to rob you, and Cadomyrians have... sand for brains.");
talkingNPC:addCycleText("#me blättert gedankenverloren in einem alten Buch. Sie starrt dabei auf ein leeres Weinglas, das leer erscheint.", "#me absently turns the page of an old journal, while glancing at a glass of wine that seems to be empty.");
talkingNPC:addCycleText("#me räuspert sich: 'Wirt, etwas mehr Wein, bitte... Wirt? Bei den Göttern!", "#me clears her throat: 'Innkeeper, more wine, please... Innkeeper? Gods.'");
talkingNPC:addCycleText("#me ist eine junge Dame, gekleidet in der Tracht einer angehenden Magierin. Ihre Kleidung trägt das Wappen Runewicks. 'Ich weiß alles über Runewick.' murmelt sie vor sich hin.", "#me is a young woman, wearing the attire of an aspiring mage. Her clothes bear the colours of Runewick. 'I know everything about Runewick', she mutters.");
talkingNPC:addCycleText("#me tippt mit ihren langen Fingernägeln gegen ihr leeres Glas, ein hohles, klirrendes Geräusch ist zu vernehmen.", "#me absently taps on the side of her empty glass with her long fingernail, causing a faint, hollow sound to be heard.");
talkingNPC:addCycleText("#me murmelt genervt: 'Wenn ich es nicht besser wüßte, könnte man meinen, der Wirt wäre noch so ein Halunke aus Galmair mit Dung in den Ohren.", "#me mutters with an irritated voice: 'I swear that if I did not already know better, I would be certain that the innkeeper is another Galmairian crook with his ears full of manure.'");
talkingNPC:addCycleText("#me lässt ihre Augen hochmütig durch die Taverne wandern. Jedem, der ihr fremd erscheint, wirft sie einen Blick mit einer Mischung aus Neugierde und Misstrauen zu.", "#me glances around the tavern with an air of haught surrounding her, eyeing all those who appear foreign with a gaze that is mixed with both curiosity and suspicion.'");
talkingNPC:addCycleText("Einfältige Ignoranten, überall! Wie soll man so lernen?", "Stupid idiots, everywhere. How is one supposed to become educated this way?");
talkingNPC:addCycleText("Jemand hat mal im Unterricht des Erzmagiers 'Bingo!' gerufen. Ich habe bis heute nicht verstanden, was er damit sagen wollte.", "Someone just yelled 'Bingo!' during the Archmage's class. I haven't understood what he ment by that by now.");
talkingNPC:addCycleText("Alles, was ich weiß, ist, dass ich weiß, dass ich noch nicht alles weiß.", "All I know is that I know that I don't know it all.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(1);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Dieser NPC ist die Anwärterin Zaida.", "This NPC is the apprentice Zaida.");
mainNPC:setUseMessage("Fass mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut dich verwirrt an.", "#me looks at you confused.");
mainNPC:setEquipment(1, 465);
mainNPC:setEquipment(3, 846);
mainNPC:setEquipment(11, 0);
mainNPC:setEquipment(5, 57);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 2295);
mainNPC:setEquipment(9, 0);
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
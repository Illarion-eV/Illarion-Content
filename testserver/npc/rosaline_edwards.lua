--------------------------------------------------------------------------------
-- NPC Name: Rosaline Edwards                                         Cadomyr --
-- NPC Job:  Queen                                                            --
--                                                                            --
-- NPC Race: human                      NPC Position:  122, 521, 0            --
-- NPC Sex:  female                     NPC Direction: south                  --
--                                                                            --
-- Authors:  Estralis Seborian                                                --
--           Nitram                                                           --
--                                                       easyNPC Parser v1.21 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (0, 122, 521, 0, 4, 'Rosaline Edwards', 'npc.rosaline_edwards', 1, 7, 0, 60, 30, 4, 251, 194, 157);
---]]

require("npc.base.basic")
require("npc.base.condition.chance")
require("npc.base.condition.item")
require("npc.base.condition.language")
require("npc.base.condition.quest")
require("npc.base.consequence.inform")
require("npc.base.consequence.item")
require("npc.base.consequence.quest")
require("npc.base.consequence.treasure")
require("npc.base.talk")
module("npc.rosaline_edwards", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Queen Rosaline Edwards of Cadomyr. Keywords: Hail my queen, Cadomyr, enemies, Sir Reginald, tomb, grave."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Königin Rosaline Edwards von Cadomyr. Schlüsselwörter: Es lebe die Königin, Cadomyr, Feinde, Sir Reginald, Gruft, Grab."));
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
talkEntry:addResponse("Speak, but choose your words wisely for my time is short.");
talkEntry:addResponse("Ah, a servant of mine, good, what news do you bear from my realm?");
talkEntry:addResponse("You dare to disturb me? Fine, fortunately for you I needed a distraction.");
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
talkEntry:addResponse("Sagt, was wollt ihr von eurer Königin? Sprecht schnell oder ich werde euch Beine machen.");
talkEntry:addResponse("Ah, einer meiner Untertanen. Gut, was für Kunde bringt ihr aus meinem Reich?");
talkEntry:addResponse("Ihr wagt es, mich zu stören. Fein, ich kann etwas Abwechslung gut vertragen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Speak, but choose your words wisely for my time is short.");
talkEntry:addResponse("Ah, a servant of mine, good, what news do you bear from my realm?");
talkEntry:addResponse("You dare to disturb me? Fine, fortunately for you I needed a distraction.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Sagt, was wollt ihr von eurer Königin? Sprecht schnell oder ich werde euch Beine machen.");
talkEntry:addResponse("Ah, einer meiner Untertanen. Gut, was für Kunde bringt ihr aus meinem Reich?");
talkEntry:addResponse("Ihr wagt es, mich zu stören. Fein, ich kann etwas Abwechslung gut vertragen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("#me waves: 'Begone.'");
talkEntry:addResponse("Go with Malachin's blessings and do deeds to honour Cadomyr's name.");
talkEntry:addResponse("Very well, be off and serve me as I do Cadomyr.");
talkEntry:addResponse("Fare thee well, and be sure to speak fondly of Cadomyr on your travels.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("#me winkt ab: 'Hinfort.'");
talkEntry:addResponse("Geht mit Malachins Segen und vollbringt Taten zu Ehren Cadomyrs. Und meiner.");
talkEntry:addResponse("Fort, fort und dient mir in jeder Minute eures Lebens so, wie ich Cadomyr diene.");
talkEntry:addResponse("Gehabt euch wohl und verbreitet Kunde über das glorreiche Königreich Cadomyr überall auf euren Reisen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addResponse("#me waves: 'Begone.'");
talkEntry:addResponse("Go with Malachin's blessings and do deeds to honour Cadomyr's name.");
talkEntry:addResponse("Very well, be off and serve me as I do Cadomyr.");
talkEntry:addResponse("Fare thee well, and be sure to speak fondly of Cadomyr on your travels.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addResponse("#me winkt ab: 'Hinfort.'");
talkEntry:addResponse("Geht mit Malachins Segen und vollbringt Taten zu Ehren Cadomyrs. Und meiner.");
talkEntry:addResponse("Fort, fort und dient mir in jeder Minute eures Lebens so, wie ich Cadomyr diene.");
talkEntry:addResponse("Gehabt euch wohl und verbreitet Kunde über das glorreiche Königreich Cadomyr überall auf euren Reisen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("No queen could be better, I assure you, with the service of the noblest and truest of men at her side.");
talkEntry:addResponse("Glorious, truly Zhambra has blessed me with the most honourable servants.");
talkEntry:addResponse("Truth be told my skin is yearning for the soothing comfort of donkey milk, but that is neither here nor there I suppose.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addResponse("Ich bin die unbestrittene Monarchin eines glorreichen Reiches der edelsten Leute. Wie geht es mir wohl?");
talkEntry:addResponse("Mir würde es weit besser gehen, wenn ihr niederknien würdet. Jetzt!");
talkEntry:addResponse("Mir käme ein Bad in Eselsmilch gerade recht. Dieser ganze Sand schadet meiner feinen Haut.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("Who am I? You dare address me in such a manner? Be assured if my mood were not so temperate you'd be bellowing my name in the dungeons with your cries for mercy!");
talkEntry:addResponse("Poor child you must be born from under a rock if you don't know my name. Do not disgrace me with your daft shortcomings ask any of my humble servants who I am.");
talkEntry:addResponse("You must be some distant traveler to have the nerve to ask the Queen of Cadomyr's name. Be gone from me I haven't the time for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ihr name");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Wer ich bin? Ihr habt die Kühnheit zuzugeben, dass ihr nicht wisst, wer ich bin? Aus meinen Augen!");
talkEntry:addResponse("Wenn ihr wirklich nicht wisst, wer ich bin, dann fragt einen meiner Diener.");
talkEntry:addResponse("Schämt ihr euch nicht, eine Königin albarischen Geblüts nach ihrem Namen zu fragen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 12));
talkEntry:addTrigger("message");
talkEntry:addTrigger("news");
talkEntry:addTrigger("letter");
talkEntry:addTrigger("scroll");
talkEntry:addTrigger("parchment");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest status] The Reminder V: You deliver the message from Groktan Flintsplit to Queen Rosaline Edwards."));
talkEntry:addConsequence(npc.base.consequence.quest.quest(107, "=", 13));
talkEntry:addResponse("#me shouts in fury and crumples the letter in her firm grasp: 'Tell that filthy bastard he'll get my throne over my dead body!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 12));
talkEntry:addTrigger("nachricht");
talkEntry:addTrigger("brief");
talkEntry:addTrigger("Botschaft");
talkEntry:addTrigger("Schriftrolle");
talkEntry:addTrigger("Pergament");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Queststatus] Die Erinnerung V: Du überbringst Königin Rosaline Edwards die Nachricht von Groktan Flintsplit."));
talkEntry:addConsequence(npc.base.consequence.quest.quest(107, "=", 13));
talkEntry:addResponse("#me schnaubt wutentbrannt und zerknüllt den Brief: 'Sag diesem dreckigen Bastard, dass er so nie an meinen Thron kommen wird. Nur über meine Leiche!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 12));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Groktan");
talkEntry:addTrigger("Flintsplit");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest status] The Reminder V: You deliver the message from Groktan Flintsplit to Queen Rosaline Edwards."));
talkEntry:addConsequence(npc.base.consequence.quest.quest(107, "=", 13));
talkEntry:addResponse("#me shouts in fury and crumples the letter in her firm grasp: 'Tell that filthy bastard he'll get my throne over my dead body!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(107, "=", 12));
talkEntry:addTrigger("Groktan");
talkEntry:addTrigger("Flintsplit");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Queststatus] Die Erinnerung V: Du überbringst Königin Rosaline Edwards die Nachricht von Groktan Flintsplit."));
talkEntry:addConsequence(npc.base.consequence.quest.quest(107, "=", 13));
talkEntry:addResponse("#me schnaubt wutentbrannt und zerknüllt den Brief: 'Sag diesem dreckigen Bastard, dass er so nie an meinen Thron kommen wird. Nur über meine Leiche!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Ah, a loyal subject. Very well, ask one of my servants what you can do for me today, I cannot be bothered such details; I have to rule an entire kingdom.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Ah, ein loyaler Diener, wie fein. Bitte fragt einen meiner Diener, was ihr heute für mich tun könnt. Ich kann mich nicht mit Details aufhalten, ich muss ein ganzes Königreich regieren, nicht nur euch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("Ah, a loyal subject. Very well, ask one of my servants what you can do for me today, I cannot be bothered such details; I have to rule an entire kingdom.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Ah, ein loyaler Diener, wie fein. Bitte fragt einen meiner Diener, was ihr heute für mich tun könnt. Ich kann mich nicht mit Details aufhalten, ich muss ein ganzes Königreich regieren, nicht nur euch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(642, ">", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(643, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(10.0));
talkEntry:addTrigger("Mordak");
talkEntry:addTrigger("Kharud");
talkEntry:addConsequence(npc.base.consequence.quest.quest(643, "=", 1));
talkEntry:addConsequence(npc.base.consequence.treasure.treasure(1));
talkEntry:addResponse("#me nods and hands you an item silently.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(642, ">", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(643, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(10.0));
talkEntry:addTrigger("Mordak");
talkEntry:addTrigger("Kharud");
talkEntry:addConsequence(npc.base.consequence.quest.quest(643, "=", 1));
talkEntry:addConsequence(npc.base.consequence.treasure.treasure(1));
talkEntry:addResponse("#me nickt und reicht dir leise einen Gegenstand.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(642, ">", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(643, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(11.0));
talkEntry:addTrigger("Mordak");
talkEntry:addTrigger("Kharud");
talkEntry:addConsequence(npc.base.consequence.quest.quest(643, "=", 1));
talkEntry:addConsequence(npc.base.consequence.treasure.treasure(2));
talkEntry:addResponse("#me nods and hands you an item silently.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(642, ">", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(643, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(11.0));
talkEntry:addTrigger("Mordak");
talkEntry:addTrigger("Kharud");
talkEntry:addConsequence(npc.base.consequence.quest.quest(643, "=", 1));
talkEntry:addConsequence(npc.base.consequence.treasure.treasure(2));
talkEntry:addResponse("#me nickt und reicht dir leise einen Gegenstand.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(642, ">", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(643, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(13.0));
talkEntry:addTrigger("Mordak");
talkEntry:addTrigger("Kharud");
talkEntry:addConsequence(npc.base.consequence.quest.quest(643, "=", 1));
talkEntry:addConsequence(npc.base.consequence.treasure.treasure(3));
talkEntry:addResponse("#me nods and hands you an item silently.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(642, ">", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(643, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(13.0));
talkEntry:addTrigger("Mordak");
talkEntry:addTrigger("Kharud");
talkEntry:addConsequence(npc.base.consequence.quest.quest(643, "=", 1));
talkEntry:addConsequence(npc.base.consequence.treasure.treasure(3));
talkEntry:addResponse("#me nickt und reicht dir leise einen Gegenstand.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(642, ">", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(643, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(14.0));
talkEntry:addTrigger("Mordak");
talkEntry:addTrigger("Kharud");
talkEntry:addConsequence(npc.base.consequence.quest.quest(643, "=", 1));
talkEntry:addConsequence(npc.base.consequence.treasure.treasure(4));
talkEntry:addResponse("#me nods and hands you an item silently.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(642, ">", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(643, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(14.0));
talkEntry:addTrigger("Mordak");
talkEntry:addTrigger("Kharud");
talkEntry:addConsequence(npc.base.consequence.quest.quest(643, "=", 1));
talkEntry:addConsequence(npc.base.consequence.treasure.treasure(4));
talkEntry:addResponse("#me nickt und reicht dir leise einen Gegenstand.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(642, ">", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(643, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(17.0));
talkEntry:addTrigger("Mordak");
talkEntry:addTrigger("Kharud");
talkEntry:addConsequence(npc.base.consequence.quest.quest(643, "=", 1));
talkEntry:addConsequence(npc.base.consequence.treasure.treasure(5));
talkEntry:addResponse("#me nods and hands you an item silently.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(642, ">", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(643, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(17.0));
talkEntry:addTrigger("Mordak");
talkEntry:addTrigger("Kharud");
talkEntry:addConsequence(npc.base.consequence.quest.quest(643, "=", 1));
talkEntry:addConsequence(npc.base.consequence.treasure.treasure(5));
talkEntry:addResponse("#me nickt und reicht dir leise einen Gegenstand.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(642, ">", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(643, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger("Mordak");
talkEntry:addTrigger("Kharud");
talkEntry:addConsequence(npc.base.consequence.quest.quest(643, "=", 1));
talkEntry:addConsequence(npc.base.consequence.treasure.treasure(6));
talkEntry:addResponse("#me nods and hands you an item silently.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(642, ">", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(643, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger("Mordak");
talkEntry:addTrigger("Kharud");
talkEntry:addConsequence(npc.base.consequence.quest.quest(643, "=", 1));
talkEntry:addConsequence(npc.base.consequence.treasure.treasure(6));
talkEntry:addResponse("#me nickt und reicht dir leise einen Gegenstand.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(642, ">", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(643, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(25.0));
talkEntry:addTrigger("Mordak");
talkEntry:addTrigger("Kharud");
talkEntry:addConsequence(npc.base.consequence.quest.quest(643, "=", 1));
talkEntry:addConsequence(npc.base.consequence.treasure.treasure(7));
talkEntry:addResponse("#me nods and hands you an item silently.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(642, ">", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(643, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(25.0));
talkEntry:addTrigger("Mordak");
talkEntry:addTrigger("Kharud");
talkEntry:addConsequence(npc.base.consequence.quest.quest(643, "=", 1));
talkEntry:addConsequence(npc.base.consequence.treasure.treasure(7));
talkEntry:addResponse("#me nickt und reicht dir leise einen Gegenstand.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(642, ">", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(643, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(34.0));
talkEntry:addTrigger("Mordak");
talkEntry:addTrigger("Kharud");
talkEntry:addConsequence(npc.base.consequence.quest.quest(643, "=", 1));
talkEntry:addConsequence(npc.base.consequence.treasure.treasure(8));
talkEntry:addResponse("#me nods and hands you an item silently.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(642, ">", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(643, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(34.0));
talkEntry:addTrigger("Mordak");
talkEntry:addTrigger("Kharud");
talkEntry:addConsequence(npc.base.consequence.quest.quest(643, "=", 1));
talkEntry:addConsequence(npc.base.consequence.treasure.treasure(8));
talkEntry:addResponse("#me nickt und reicht dir leise einen Gegenstand.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(642, ">", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(643, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(51.0));
talkEntry:addTrigger("Mordak");
talkEntry:addTrigger("Kharud");
talkEntry:addConsequence(npc.base.consequence.item.item(198, 1, 999, {["gemLevel"] = "1"}));
talkEntry:addConsequence(npc.base.consequence.quest.quest(643, "=", 1));
talkEntry:addResponse("#me nods and hands you an item silently.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(642, ">", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(643, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(51.0));
talkEntry:addTrigger("Mordak");
talkEntry:addTrigger("Kharud");
talkEntry:addConsequence(npc.base.consequence.item.item(198, 1, 999, {["gemLevel"] = "1"}));
talkEntry:addConsequence(npc.base.consequence.quest.quest(643, "=", 1));
talkEntry:addResponse("#me nickt und reicht dir leise einen Gegenstand.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(642, ">", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(643, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(100.0));
talkEntry:addTrigger("Mordak");
talkEntry:addTrigger("Kharud");
talkEntry:addConsequence(npc.base.consequence.item.item(197, 1, 999, {["gemLevel"] = "1"}));
talkEntry:addConsequence(npc.base.consequence.quest.quest(643, "=", 1));
talkEntry:addResponse("#me nods and hands you an item silently.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(642, ">", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(643, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(100.0));
talkEntry:addTrigger("Mordak");
talkEntry:addTrigger("Kharud");
talkEntry:addConsequence(npc.base.consequence.item.item(197, 1, 999, {["gemLevel"] = "1"}));
talkEntry:addConsequence(npc.base.consequence.quest.quest(643, "=", 1));
talkEntry:addResponse("#me nickt und reicht dir leise einen Gegenstand.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 13));
talkEntry:addCondition(npc.base.condition.item.item(225, "all", ">", 0, {["descriptionEn"] = "This crown belongs to Rosaline Edwarts."}));
talkEntry:addTrigger("Zassaria");
talkEntry:addTrigger("lizzard");
talkEntry:addTrigger("crown");
talkEntry:addTrigger("missing");
talkEntry:addTrigger("belong");
talkEntry:addTrigger("porperty");
talkEntry:addTrigger("riverbank");
talkEntry:addConsequence(npc.base.consequence.quest.quest(701, "=", 13));
talkEntry:addResponse("What? This is not my crown! Can't you read? It says Rosaline Edwarts spelled with t. This is not my name! This was not a good joke, and I am not in the mood for jokes. You may leave. Now!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 13));
talkEntry:addCondition(npc.base.condition.item.item(225, "all", ">", 0, {["descriptionEn"] = "This crown belongs to Rosaline Edwarts."}));
talkEntry:addTrigger("Zassaria");
talkEntry:addTrigger("Echsenmensch");
talkEntry:addTrigger("Krone");
talkEntry:addTrigger("verloren");
talkEntry:addTrigger("gehören");
talkEntry:addTrigger("Eigentum");
talkEntry:addTrigger("riverbank");
talkEntry:addConsequence(npc.base.consequence.quest.quest(701, "=", 13));
talkEntry:addResponse("Was? Dies ist nicht meine Krone! Kannst du nicht lesen? Da steht Rosaline Edwarts mit t. Das ist nicht mein Name! Dies ist ein schlechter Scherz, und mir ist nicht zum Schrzen zu mute. Ihr könnt gehen. Jetzt!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("Profession? Foolish traveler, I am the Queen, my profession is to rule this kingdom!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Lasst mich nachdenken... ich regiere hier, so weit das Auge reicht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("Job? Foolish traveler, I am the Queen, my job is to rule this kingdom!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Lasst mich nachdenken... ich regiere hier, so weit das Auge reicht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Gobaith");
talkEntry:addResponse("Don't come to me, whining about some smut in the ocean. Behold the glory of Cadomyr instead.");
talkEntry:addResponse("Gobaith was doomed and I knew that. How did I know? I am the queen, did you forget?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addResponse("Ihr kommt doch nicht etwa zu mir, um über einen Schmutzfleck im Ozean zu heulen. Betrachtet stattdessen den Glanz Cadomyrs.");
talkEntry:addResponse("Gobaith war dem Untergang geweiht. Woher ich das weiß? Ich bin die Königin, schon vergessen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("bitch");
talkEntry:addTrigger("witch");
talkEntry:addResponse("What? Somebody said I was a witch? To the stake!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hastings");
talkEntry:addTrigger("Baron");
talkEntry:addResponse("Never utter his name again in my court. Be gone! Do not return to me unless you carry his head upon a pike.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("bounty");
talkEntry:addResponse("There is no bounty on Baron Hastings' head. It is a matter of honour to slay this fiend of Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Milk");
talkEntry:addTrigger("donkey");
talkEntry:addResponse("A bath in donkey's milk can do wonders for your skin. You should try it yourself, if you can afford it.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("pyramid");
talkEntry:addResponse("A pyramid as a grave monument? Who would do such a stupid thing? Discuss that with Robertus, the royal builder, but expect to receive some laughter.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("cube");
talkEntry:addTrigger("cubus");
talkEntry:addTrigger("grave");
talkEntry:addResponse("My royal builder, Robertus, once mentioned that he wants to build a grave in the form of a cube for me. If I like it, good for me, if I don't like it, bad for him.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tomb");
talkEntry:addResponse("The grave of my father can be found in a magnificent tomb outside the town. I suggest you visit there and pay homage to his great service.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("enemy");
talkEntry:addTrigger("enemies");
talkEntry:addTrigger("fiend");
talkEntry:addTrigger("foe");
talkEntry:addResponse("Cadomyr has no foes. There is only that bastard Baron Hastings who contests my throne, but I doubt he will survive any attempt to grasp it.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("honor");
talkEntry:addTrigger("honour");
talkEntry:addResponse("Honour is everything for a nobleman of Cadomyr. If you should lose your honour, then you shall lose your life. Whatever you do, consider your fame and reputation first.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Law");
talkEntry:addTrigger("Custom");
talkEntry:addTrigger("habit");
talkEntry:addResponse("The law of Cadomyr lies before your very eyes. I am the law, but you may bear witness to our customs at the statue of my father in front of the palace.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("builder");
talkEntry:addResponse("Robertus is my royal builder. Currently he is working on building me the most magnificent grave known to man. My legacy will last forever!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Robertus");
talkEntry:addResponse("Robertus is my royal builder. Currently he is working on building me the most magnificent grave known to man. My legacy will last forever!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Desert");
talkEntry:addResponse("Sand, sand, sand. It is everywhere! In my shoes, in my chambers, and even in my hair! I hate the sand but thank Sirani that I have a lifetime supply of donkey's milk.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Economy");
talkEntry:addResponse("Cadomyr's economy prospers. You can see that at every corner of town. Go forth to the market place and behold the goods of my beloved country.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("palace");
talkEntry:addResponse("My palace is the grandeur of hard working slaves and artisans. But it was not built for me alone; it was built for the honour of Cadomyr and the glory of Malachin, Zhambra, and Sirani!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("market");
talkEntry:addResponse("Glass goods, fine jewelry, herbal remedies, and masonry are our marquee products, readily available in our market quarter. So go see for yourself!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hassan");
talkEntry:addResponse("Ah, yes, I think Hassan is the name of my royal fan waver. Where is he again? He is so lazy I should have him flogged daily for his shortcomings.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("husband");
talkEntry:addTrigger("marriage");
talkEntry:addResponse("I am married to Cadomyr. I serve it like I would serve my husband.");
talkEntry:addResponse("I am in waiting for Sirani to deliver my true love, till then she has secured my love to the fate of Cadomyr.");
talkEntry:addResponse("The royal blood line is not meant for just anyone, but I heed you no further explination.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Queendom");
talkEntry:addResponse("This term ceased to be funny when the first head fell down the scaffold.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Queen");
talkEntry:addResponse("That is me, the only rightful Queen in all of Cadomyr. Now you better act accordingly.");
talkEntry:addResponse("Commonly, my minions address me as 'Your highness' or 'Almighty Queen'.");
talkEntry:addResponse("I bear the name Edwards with pride. You should speak it likewise.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Reginald");
talkEntry:addResponse("My father, Sir Reginald Edwards, was the king of Cadomyr. Now, his only child inherits the throne, me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("King");
talkEntry:addTrigger("father");
talkEntry:addResponse("My father, Sir Reginald Edwards, was the king of Cadomyr. Now, his only child inherits the throne, me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cape");
talkEntry:addResponse("Cape Farewell? Tis true that even the lizardmen obey my orders. If you are searching there kind, Cape Farewell is certainly the best place to start.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Zerarisa");
talkEntry:addResponse("Indeed, even the lizardmen obey my orders. Some of them usually dwell at Cape Farewell.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("lizard");
talkEntry:addResponse("The lizardmen have proven loyal subjects. Most of them call Cape Farewell home.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("orc");
talkEntry:addResponse("You might presume that a queen of Albarian origin would dislike orcs. But he who swears loyalty to me and follows the old customs is my subject, even if green.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ioannes");
talkEntry:addTrigger("Faber");
talkEntry:addResponse("Ah, you are speaking about my royal treasurer. He serves me right and just. I trust him to manage the treasury of Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Anthar");
talkEntry:addTrigger("Vilicon");
talkEntry:addResponse("My loyal chancellor; you are surprised he's an elf? He's a perfect example of loyality to the throne!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hexe");
talkEntry:addTrigger("Schlampe");
talkEntry:addResponse("Was? Jemand behauptet, ich sei eine Hexe? Auf den Scheiterhaufen mit ihm!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hastings");
talkEntry:addTrigger("Baron");
talkEntry:addResponse("Ihr wagt es, den Namen dieses Feindes in den Mund zu nehmen. Ich hoffe, ihr werdet genau jetzt aufbrechen und nicht eher zurückkommen, als dass ihr seinen Kopf auf einem Pfahl präsentieren könnt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Kopfgeld");
talkEntry:addResponse("Es ist kein Kopfgeld auf Baron Hastings ausgesetzt. Es ist eine Ehrentat, diesen Feind Cadomyrs zur Strecke zu bringen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Milch");
talkEntry:addTrigger("Esel");
talkEntry:addResponse("Ein Bad in Eselmilch kann eurer Haut ware Wunder tun. Versucht es eines Tages auch einmal, aber natürlich nicht in meiner Wanne.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Pyramide");
talkEntry:addResponse("Eine Pyramide als Grab? Wer kommt denn auf so eine törichte Idee? Diskutiert das mit Robertus, meinem Baumeister. Aber macht euch auf Gelächter gefasst.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Kubus");
talkEntry:addTrigger("Grab");
talkEntry:addResponse("Mein königlicher Baumeister, Robertus, erwähnte einst, dass er gedenkt, mir ein Grab in Form eines Kubus zu bauen. Wenn es mir gefällt - gut für mich. Wenn nicht - schlecht für ihn.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gruft");
talkEntry:addResponse("Das Grab meines Vaters kann in einer beeindruckenden Gruft außerhalb der Stadt gefunden werden. Ich weise euch an, das Gedenken meines Vaters zu ehren. Jetzt!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Feind");
talkEntry:addResponse("Cadomyr hat keine Feinde, außer diesem Bastard Baron Hastings, der den Thron für sich beansprucht. Aber ich bin mir sicher, er wird es nicht überleben, wenn er wirklich nach ihm greift.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ehre");
talkEntry:addResponse("Die Ehre bedeutet einem Edelmann Cadomyrs alles. Verliert eure Ehre, so verliert ihr euer Leben. Was auch immer ihr gedenkt zu tun, bedenkt die Auswirkungen auf euren Ruf und Reputation.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gesetz");
talkEntry:addTrigger("Sitte");
talkEntry:addTrigger("Brauch");
talkEntry:addResponse("Das Gesetz Cadomyrs steht genau vor ich: Ich. Unsere Gebräuche stehen auf der Statue meines Vaters vor dem Palast.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Baumeister");
talkEntry:addResponse("Robertus ist mein Baumeister. Oh ja, er wird mir das großartigste Grab bauen, was je ein Mensch gesehen hat. Mein Andenken wird die Zeitalter überdauern.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Robertus");
talkEntry:addResponse("Robertus ist mein Baumeister. Oh ja, er wird mir das großartigste Grab bauen, was je ein Mensch gesehen hat. Mein Andenken wird die Zeitalter überdauern.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wüste");
talkEntry:addResponse("Sand, Sand, Sand. Er ist überall! In meinen Schuhen, in meinen Gemächern, sogar in meinem Haar! Wie sehr ich diesen Sand hasse.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wirtschaft");
talkEntry:addResponse("Cadomyrs Wirtschaft floriert, wie man an allen Ecken der Stadt sieht. Geht hin zum Marktplatz und erfreut euch der Waren des Landes.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Palast");
talkEntry:addResponse("Mein Palast wurde von fleißigen Sklaven und Handwerkern gebaut. Aber er wurde nicht für mich alleine errichtet; sondern auch für den Ruhm Cadomyrs.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("markt");
talkEntry:addResponse("Glaswaren, feineste Juwelen und Steinmetzkunst; ihr könnt bewundernswerte Waren auf dem Markt erwerben. Los, geht und gebt euer Geld aus.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hassan");
talkEntry:addResponse("Ahja, Hassan dürfte der Name meines königlichen Fächelwedlers sein. Wo ist er schon wieder, er ist so faul, ich sollte ihn den ganzen Tag auspeitschen lassen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ehemann");
talkEntry:addTrigger("Hochzeit");
talkEntry:addResponse("Ich bin mit Cadomyr vermählt. Ich diene ihm wie ich meinem Ehemann dienen würde, verstanden?");
talkEntry:addResponse("Ich warte auf Prinz Richtig. Oder denkt ihr, die Königin von Cadomyr würde irgendeinen dahergelaufenen Händler aus Galmair heiraten?");
talkEntry:addResponse("Cadomyr braucht keinen König wenn es eine Königin wie mich hat. Oder stellt ihr das etwa in Frage?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königinreich");
talkEntry:addResponse("Dieser Begriff verlor seinen Witz als der erste Kopf vom Schafott rollte.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königin");
talkEntry:addResponse("Das bin ich: Königin Rosaline Edwards von Cadomyr. Jetzt verhaltet euch entsprechend.");
talkEntry:addResponse("Normalerweise sprechen mich meine Untertanen so an: 'Eure Hoheit' oder 'Allmächtige Königin'.");
talkEntry:addResponse("Ich trage den Namen Edwards mit Stolz. Genauso solltet ihr ihn auch aussprechen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("König");
talkEntry:addTrigger("Vater");
talkEntry:addTrigger("Reginald");
talkEntry:addResponse("Mein Vater, Sir Reginald Edwards, war der König von Cadomyr. Und nun hat sein einziges Kind den Thron inne. Ich verstehe nicht, warum einige Leute diesen alten Brauch nicht aktzeptieren.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Kap");
talkEntry:addTrigger("Abschied");
talkEntry:addResponse("Fürwahr, sogar die Echsenwesen gehorchen meinen Befehlen. Einige von ihnen leben am Kap des Abschiedes.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zerarisa");
talkEntry:addResponse("Fürwahr, sogar die Echsenwesen gehorchen meinen Befehlen. Einige von ihnen leben am Kap des Abschiedes.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Echse");
talkEntry:addResponse("Fürwahr, sogar die Echsenwesen gehorchen meinen Befehlen. Einige von ihnen leben am Kap des Abschiedes.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ork");
talkEntry:addResponse("Ihr denkt vielleicht, eine Königin aus albarischem Geschlecht verabscheut Orks. Aber wer mir die Treue schwört und die alten Sitten achtet, der ist mein Untertan, sei er auch grün.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ioannes");
talkEntry:addTrigger("Faber");
talkEntry:addResponse("Ah, ihr redet von meinem königlichen Kämmerer. Er dient mir aufrichtig und treu. Ich vertraue ihm bei der Verwaltung der königlichen Reichtümer.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Anthar");
talkEntry:addTrigger("Vilicon");
talkEntry:addResponse("Mein mir ergebener Kanzler; ihr wundert euch, dass er ein Elf ist? Er ist ein Musterbeispiel der Loyalität gegenüber dem Thron!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("A renegade mage who I have to admit, knows how to manipulate his minions into believing he is a generous leader.");
talkEntry:addResponse("I do attest, negotiations with him are far more challenging than simply thrusting a pike into his stomach.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Ein abtrünniger Magier der zugegebenerweise weiß, wie man seine Untertanen dahingehend täuscht, dass er vorgibt, ein großzügiger Anführer zu sein.");
talkEntry:addResponse("Fürwahr, mit ihm zu verhandeln ist schwieriger als ihm einfach eine Lanze in den Bauch zu rammen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addResponse("A renegade mage who I have to admit, knows how to manipulate his minions into believing he is a generous leader.");
talkEntry:addResponse("I do attest, negotiations with him are far more challenging than simply thrusting a pike into his stomach.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Ein abtrünniger Magier der zugegebenerweise weiß, wie man seine Untertanen dahingehend täuscht, dass er vorgibt, ein großzügiger Anführer zu sein.");
talkEntry:addResponse("Fürwahr, mit ihm zu verhandeln ist schwieriger als ihm einfach eine Lanze in den Bauch zu rammen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("I have no problem with Runewick, as long as they stay in their place. Historically, however, they have chosen to be quite the nuisance.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Ich habe keine Probleme mit Runewick, solange sie ihren Füße nicht auf das Land setzen. Und das geschieht mir in letzter Zeit zu häufig.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Do not insight my rage by mentioning his name. That illicit marriage proposal of his still agitates me greatly. Any satire or jest depicting that mockery shall result in the actor's mouth being filled with scorpions!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Wenn ihr es wagt, mich an den Heiratsantrag des Dons zu erinnern, dann lasse ich euren Mund mit Skorpionen füllen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Galmair is like rose with thorns; it might look appealing, but grasping for it should be done carefully.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Galmair ist wie eine dornenbewehrte Rose; es mag begehrenswert aussehen, aber wenn man danach greift, dann sollte man jeden Schriff genau überdenken.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("That is me, the only rightful Queen in all of Sevenhill. Now you better act accordingly.");
talkEntry:addResponse("Commonly, my minions address me as 'Your highness' or 'Almighty Queen'.");
talkEntry:addResponse("I bear the name Edwards with pride. You should speak it likewise.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Das bin ich: Königin Rosaline Edwards von Cadomyr. Jetzt verhaltet euch entsprechend.");
talkEntry:addResponse("Normalerweise sprechen mich meine Untertanen so an: 'Eure Hoheit' oder 'Allmächtige Königin'.");
talkEntry:addResponse("Ich trage den Namen Edwards mit Stolz. Genauso solltet ihr ihn auch aussprechen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("queen");
talkEntry:addResponse("That is me, the only rightful Queen in all of Sevenhill. Now you better act accordingly.");
talkEntry:addResponse("Commonly, my minions address me as 'Your highness' or 'Almighty Queen'.");
talkEntry:addResponse("I bear the name Edwards with pride. You should speak it likewise.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("königin");
talkEntry:addResponse("Das bin ich: Königin Rosaline Edwards von Cadomyr. Jetzt verhaltet euch entsprechend.");
talkEntry:addResponse("Normalerweise sprechen mich meine Untertanen so an: 'Eure Hoheit' oder 'Allmächtige Königin'.");
talkEntry:addResponse("Ich trage den Namen Edwards mit Stolz. Genauso solltet ihr ihn auch aussprechen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Cadomyr means everything to me; I was born to serve this land and so all else are born to serve me. Let us obey the old customs and the traditions.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Cadomyr ist mein ein und alles. Ich wurde geboren, um Cadomyr zu dienen und so wurde ein jeder hier geboren, um mir zu dienen. Lasst uns diesen alten Gebräuchen gehorchen und die Tradition wahren.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("albar");
talkEntry:addResponse("My blood and soul is Albarian. To mention my heritage is to mention the people of Cadomyr for it shall be the shinning example of our customs for all to see.");
talkEntry:addResponse("I am proud of my Albarian origin, even though I was told that the old customs are more and more neglected in Albar.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("Mein Blut is albarisch. Mein Haar ist albarisch. Das Volk von Cadomyr hat albarische Wurzeln. Cadomyr ist das bessere Albar!");
talkEntry:addResponse("Ich bin stolz auf meine albarische Herkunft, auch wenn mir zu Ohren kam, dass man dort die alten Sitten immer häufiger missachtet.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addResponse("Someone should plunder and pillage Gynk! Such a cesspool of sin! No honour!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("Man sollte Gynk verwüsten und niederbrennen! Was für ein Sündenpfuhl! Zu den Waffen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("salkama");
talkEntry:addResponse("The Salkamaerians have their customs, we have ours. As long as they do not interfere with Cadomyrian issues, they may do whatever they think is right.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Die Salkamaerier haben ihre Gebräuche, wir haben unsere. Solange sie sich nicht in cadomyrische Angelegenheiten einmischen, sollen sie machen, was sie für richtig halten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Adron");
talkEntry:addResponse("Ah, the god of Festivities and Wine. His purpose is joyous but indulge too much, like those people of Runewick, and you'll risk your safety and waste your resources.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Adron");
talkEntry:addResponse("Ah, der Gott der Festlichkeiten und des Weines. Sein Begehr ist simpel und von niederem Stand, wie diese Leute aus Runewick...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addResponse("How can one worship the Lord of Fire? Of course, we all honour the Five, but fire has always been a city's greatest foe. It does keeps us warm, so respect it and Brágon, but do not worship it.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addResponse("Wie kann man nur den Herren des Feuers verehren? Selbstredend ehren wir die Fünf, aber Feuer kann so viel Leid verursachen. Es spendet uns aber auch Wärme; also respektiert es und Brágon, aber verehrt es nicht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cherga");
talkEntry:addResponse("I hope the time when I face Cherga in the afterlife will not come anytime soon; Robertus has not even finished the plans for my grave yet. Furthermore, who would rule Cadomyr, if not me?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addResponse("Ich hoffe, dass es noch eine Weile dauert, bis ich Cherga ins Angesicht trete. Robertus hat noch nicht einmal die Baupläne für mein Grab vollendet. Und wer sollte schon Cadomyr regieren, wenn nicht ich?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elara");
talkEntry:addResponse("Elara, hah, a commonly overestimated goddess. People think she knows it all; but how can a single god know more than dozens of generations of Albarians?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elara");
talkEntry:addResponse("Elara, hah, eine meist überschätzte Göttin. Manche denken, sie weiß alles; aber wie kann eine einzelne Gottheit mehr wissen als Generationen von Albariern?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Eldan");
talkEntry:addResponse("I was taught that Eldan is the father of Elara and hence, as useless as her. But my faith in the Five has grown over the years, and nowadays, I would execute my teacher for what he taught me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eldan");
talkEntry:addResponse("Man lehrte mich, dass Eldan der Vater Elaras ist und somit genauso wertlos ist wie sie. Aber mein Glaube an die Fünf ist nun stark und dieser Tage würde ich meinen Lehrer für diesen Frevel hinrichten lassen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Findari");
talkEntry:addResponse("Findari's gift is the wind; it drives our sailboats and brings the clouds of rain. Wind can also blow sand storms miles long! So, the Five are never friend nor foe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Findari");
talkEntry:addResponse("Findaris Geschenk ist der Wind. Er treibt unsere Segelboote an und bringt die Regenwolken. Aber der Wind bläßt auch immer wieder diesen Sand in meinen Palast! Nun, die Fünf sind niemals ein Freund, aber auch nicht ein Feind.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("The god of coins, work, and rates that is Irmorom. You won't find many followers of Irmorom in Cadomyr, better head for Galmair; there are more pigs there, too.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("Der Gott der Münzen, der Arbeit und der Zinsen, das ist Irmorom. Ihr werdet nicht viele seiner Anhänger hier in Cadomyr finden. Also geht besser nach Galmair, dort gibt es nebenbei auch mehr Schweine.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addResponse("You must be speaking about the god of battle. He is our savior and saint, so pray to him every day and every night. That is an order!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addResponse("Ihr müßt über den Gott der Schlachten reden. Er ist unser Erlöser und Schutzpatron, also betet zu ihm an jedem Tag und in jeder Nacht. Das war ein Befehl!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Moshran");
talkEntry:addResponse("You must not speak this name out loud ever again in Cadomyr. Do so and my wrath will smite you. Perform your dark craft elsewhere. I'd suggest Runewick.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Moshran");
talkEntry:addResponse("Ihr werdet diesen Namen niemals wieder laut in Cadomyr aussprechen. Tut ihr es doch, so wird mein Zorn euch zerschmettern. Geht dunklen Künsten woanderns nach, wie wäre es mit Runewick?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addResponse("If there is one thing I hate more than Baron Hastings, it is disorder. So you can estimate how much I love Nargún, the god of chaos.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addResponse("Wenn etwas gibt, was ich nochmehr hasse als Baron Hastings, dann ist das Unordnung. Somit könnt ihr euch selbst erklären, wie sehr ich Nargún, die Gott des Chaos, liebe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("Hah! Only superstitious creatures rely on Oldra's grace to grow their crops. The educated know that irrigation makes plants grow, not prayer.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("Hah! Ich werde Cadomyr in blühende Landschaften verwandeln, auch ohne die Hilfe der verwunschenen Oldra. Bewässerung läßt Pflanzen gedeihen, nicht ein Gebet zu dieser unbedeutenden Göttin.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("You are speaking about the god of travelers, I hope. Not the god of those with chopped off hands, am I right?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("Ihr sprecht vom Gott der Reisenden, hoffe ich; nicht vom Gott derer mit abgeschlagenen Händen, nicht wahr?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("It is not common to worship Sirani in Cadomyr. If you want to worship something female, worship me!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("Es ist in Cadomyr unüblich, Sirani anzubeten. Wenn ihr etwas weibliches anbeten wollt, dann betet mich an!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("The goddess of fish, one could say, I hear the lizardfolk call her Zelphia. My people on the whole do not pray to her so you'd do well to travel toward Cape Farewell to find like minded lizardmen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("Die Göttin der Fische, so könnte man meinen, das ist Tanora. Aber mein Volk betet zu ihr und Cadomyr ist nicht gerade ein fischreiches Land, das steht fest.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("I still don't know who to blame for all the sand in the world. Most likely Ushara or Brágon. I'll honour them, either way, but not worship.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("Ich weiß immernoch nicht so recht, wen ich für all den Sand der Welt verantwortlich machen soll; Ushara oder Brágon? Ich ehre sie beiden trotzdem, mehr aber auch nicht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Zhambra");
talkEntry:addResponse("Be loyal to your queen and Zhambra will smile upon you. Be disobedient and you will see his justice in the afterlife...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zhambra");
talkEntry:addResponse("Seid loyal gegenüber eurer Königin und Zhambra wird es gutheißen. Seid ungehorsam und ihr werdet schon sehen, was Zhambra für euch bereit hält, wenn ihr ins Jenseits übergeht...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cleopatra");
talkEntry:addTrigger("Kleopatra");
talkEntry:addResponse("Who is that supposed to be?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Marc");
talkEntry:addTrigger("Anthony");
talkEntry:addResponse("Once, a puny prince called Marc from a far, far away land came to my palace and proposed to me. I could not stop laughing for a whole day!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Markus");
talkEntry:addTrigger("Marcus");
talkEntry:addTrigger("Anthonius");
talkEntry:addResponse("Once, a poor prince called Marc from a far, far away land came to my palace and proposed to me. I could not stop laughing for a whole day!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("STFU");
talkEntry:addResponse("I heard that, scum!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hawt");
talkEntry:addResponse("What?!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("I love you");
talkEntry:addResponse("And I love Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cleopatra");
talkEntry:addTrigger("Kleopatra");
talkEntry:addResponse("Wer soll das denn wieder sein?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Mark");
talkEntry:addTrigger("Anton");
talkEntry:addResponse("Einst kam ein erbärmlicher Prinz namens Markus aus einem fernen Land an meinen Hof und wollte mich ehelichen. Wie habe ich gelacht, den ganzen Tag noch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Markus");
talkEntry:addTrigger("Marcus");
talkEntry:addTrigger("Anthonius");
talkEntry:addResponse("Einst kam ein erbärmlicher Prinz namens Markus aus einem fernen Land an meinen Hof und wollte mich ehelichen. Wie habe ich gelacht, den ganzen Tag noch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("STFU");
talkEntry:addResponse("Ich hab das gehört, Abschaum!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("geil");
talkEntry:addResponse("Was!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ich liebe dich");
talkEntry:addTrigger("Ich liebe euch");
talkEntry:addResponse("Und ich liebe Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("Out of my sight! If you want to barter, off to the market place, off I say!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Aus meinen Augen! Wenn ihr feilschen wollt, ab zum Marktplatz. Hinfort!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("I will tell you something, my realm is named Cadomyr and I will do anything to make it prosper.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Lasst euch das gesagt sein; mein Reich nennt sich Cadomyr und ich werde alles in meiner Macht liegende tun, um es gedeihen zu lassen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("Good.");
talkEntry:addResponse("Wonderful.");
talkEntry:addResponse("Right.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("Gut.");
talkEntry:addResponse("Wunderbar.");
talkEntry:addResponse("Recht so.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("You dare to disagree with me?");
talkEntry:addResponse("'No'? That word is unfamiliar to me.");
talkEntry:addResponse("Don't you mean: 'Yes, my queen!'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("Wagt ihr es, zu widersprechen?");
talkEntry:addResponse("'Nein', dieses Wort ist mir unbekannt.");
talkEntry:addResponse("Wolltet ihr nicht vielmehr sagen: 'Ja, meine Königin!'");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me kämmt sich die Haare und flucht vor sich hin.", "#me combs her hair, cursing under her breath about sand.");
talkingNPC:addCycleText("Auf die Knie! Sofort!", "Kneel before the gods and honour your Queen!");
talkingNPC:addCycleText("Vernünftige Diener zu finden wird auch immer schwieriger.", "Finding proper servants becomes harder and harder...");
talkingNPC:addCycleText("Wo ist Hassan schon wieder! Schickt nach meinem Fächelwedler, mir ist heiß!", "Where is Hassan again? Send word to my fan waver, it is hot!");
talkingNPC:addCycleText("#me starrt auf ihre in fein gefertigte Sandalen gekleideten Füße und murmelt: 'Blau könnte meinen Zehennägeln auch mal gut stehen.'", "#me stares at her feet, clad in fine sandals, murmuring: 'I should consider painting my toenails blue.'");
talkingNPC:addCycleText("Diplomatie, Urteile, regieren, Krieg führen - eine Königin hat es nicht leicht. Alles für Cadomyr!", "Diplomacy, sentencing, ruling, warfare - a queen has a hard day. All for Cadomyr!");
talkingNPC:addCycleText("Gehorcht!", "Obey!");
talkingNPC:addCycleText("Bringt mir Eselsmilch und bereitet mein Bad vor.", "Bring forth the donkey milk and prepare my bath.");
talkingNPC:addCycleText("Befehle, Befehle, Befehle. Warum muss ich immer jedem sagen, was er zu tun hat? Denkt denn hier niemand außer mir?", "Orders, orders, orders. Why do I have to tell everyone what do? Can't they read my mind yet?");
talkingNPC:addCycleText("Cadomyr wurde nicht auf Sand gebaut; Cadomyr wurde auf Traditionen gebaut, die älter sind als so manches Sandkorn.", "Cadomyr was not founded on sand; it was founded on traditions, even older than most sand grains.");
talkingNPC:addCycleText("Wer hat da ein Licht auf Fenstersims entzündet? Was geht nur wieder in diesem Palast vor sich.", "Tell Hassan to come feed me some grapes!");
mainNPC:addLanguage(0);
mainNPC:addLanguage(1);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Dies ist Königin Rosaline Edwards von Cadomyr.", "This is Queen Rosaline Edwards of Cadomyr.");
mainNPC:setUseMessage("Was fällt euch ein!", "How dare you!");
mainNPC:setConfusedMessage("#me schaut dich verwirrt an.", "#me looks at you confused.");
mainNPC:setEquipment(1, 225);
mainNPC:setEquipment(3, 833);
mainNPC:setEquipment(5, 2295);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(9, 827);
mainNPC:setEquipment(10, 369);
mainNPC:setAutoIntroduceMode(true);

mainNPC:initDone();
end;

function receiveText(npcChar, texttype, message, speaker) mainNPC:receiveText(npcChar, texttype, speaker, message); end;
function nextCycle(npcChar) mainNPC:nextCycle(npcChar); end;
function lookAtNpc(npcChar, char, mode) mainNPC:lookAt(npcChar, char, mode); end;
function useNPC(npcChar, char) mainNPC:use(npcChar, char); end;
initNpc();
initNpc = nil;
-- END
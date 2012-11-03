--------------------------------------------------------------------------------
-- NPC Name: Valandil Elensar                                            None --
-- NPC Job:  forester                                                         --
--                                                                            --
-- NPC Race: elf                        NPC Position:  796, 463, 0            --
-- NPC Sex:  male                       NPC Direction: south                  --
--                                                                            --
-- Authors:  Estralis Seborian                                                --
--           Zak                                                              --
--                                                       easyNPC Parser v1.21 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (3, 796, 463, 0, 4, 'Valandil Elensar', 'npc.valandil_elensar', 0, 2, 0, 208, 125, 4, 242, 199, 157);
---]]

require("npc.base.basic")
require("npc.base.condition.item")
require("npc.base.condition.language")
require("npc.base.condition.quest")
require("npc.base.condition.skill")
require("npc.base.consequence.deleteitem")
require("npc.base.consequence.inform")
require("npc.base.consequence.item")
require("npc.base.consequence.money")
require("npc.base.consequence.quest")
require("npc.base.consequence.skill")
require("npc.base.consequence.talkstate")
require("npc.base.consequence.trade")
require("npc.base.talk")
module("npc.valandil_elensar", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is the forester Valandil Elensar. Keywords: Hello, quest, hatchet, forester, wood."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist der Förster Valandil Elensar. Schlüsselwörter: Hallo, Quest, Beil, Förster, Holz."));
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
talkEntry:addResponse("Greetings, frisorry that I won't stand up but I planted trees all day long, now I feel a little tired.");
talkEntry:addResponse("Welcome in Elstree forest, watch out for the deers, they are easily frightened today.");
talkEntry:addResponse("Hello, I hope you weren't send to me in order to buy wood like my last visitor.");
talkEntry:addConsequence(npc.base.consequence.talkstate.talkstate("end"));
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
talkEntry:addResponse("Grüße, verzeiht, dass ich mich nicht erhebe aber ich habe den ganzen Tag Bäume gepflanzt und bin nun ein wenig ermüdet.");
talkEntry:addResponse("Willkommen im Elsbaumwald, achtet auf die Rehe, sie sind heute sehr schreckhaft.");
talkEntry:addResponse("Hallo, ich hoffe, ihr wurdet nicht zu mir geschickt, um Holz zu kaufen wie mein letzter Besucher.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Greetings, frisorry that I won't stand up but I planted trees all day long, now I feel a little tired.");
talkEntry:addResponse("Welcome in the Elstree forest, watch out for the deers, they are easily frightened today.");
talkEntry:addResponse("Hello, I hope you weren't send to me in order to buy wood like my last visitor.");
talkEntry:addConsequence(npc.base.consequence.talkstate.talkstate("end"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Grüße, verzeiht, dass ich mich nicht erhebe aber ich habe den ganzen Tag Bäume gepflanzt und bin nun ein wenig ermüdet.");
talkEntry:addResponse("Willkommen im Elsbaumwald, achtet auf die Rehe, sie sind heute sehr schreckhaft.");
talkEntry:addResponse("Hallo, ich hoffe, ihr wurdet nicht zu mir geschickt, um Holz zu kaufen wie mein letzter Besucher.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Farewell, may the gods watch your paths.");
talkEntry:addResponse("Take care of yourself and never forget that the trees here are not to be touched by anyone but me without permission.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Auf bald, mögen die Götter über eure Pfade wachen.");
talkEntry:addResponse("Passt auf euch auf und denkt daran, dass die Bäume hier von niemanden außer mir ohne Erlaubnis berührt werden dürfen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addResponse("Good bye, enjoy your time in Elstree forest.");
talkEntry:addResponse("Oh, when you happen to pass sheep watch your back or else they might stick their curious noses into your pocket.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addResponse("Auf Wiedersehen, genießt eure Zeit hier im Elsbaumwald.");
talkEntry:addResponse("Oh, wenn ihr an Schafen vorbei kommen solltet, habt acht oder sie stecken ihre neugierigen Mäuler in eure Taschen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("Oh, I am fine, thank you.");
talkEntry:addResponse("I got a splinter in my thumb but I will handle it.");
talkEntry:addResponse("My head aches a little but it will pass after some rest.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addResponse("Mir geht es gut, danke euch.");
talkEntry:addResponse("Ich habe einen Splitter im Daumen aber das wird schon.");
talkEntry:addResponse("Mein Kopf schmerzt ein wenig aber das geht vorbei nach ein bischen Rast.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("I am Valandil Elensar.");
talkEntry:addResponse("Valandil Elensar is my name, I am the forester.");
talkEntry:addResponse("I am Valandil Elensar, the forester.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ihr name");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Ich bin Valandil Elensar.");
talkEntry:addResponse("Valandil Elensar ist mein Name, ich bin der Förster hier.");
talkEntry:addResponse("Ich bin Valandil Elensar, der Förster.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(69, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Elstree Forest I"));
talkEntry:addResponse("Ah, fine, so you want to help me, caring for the trees. Bark beetles are a real plague these days. Take this hatchet and search for ill naldor trees. Bring me ten logs, will you?");
talkEntry:addConsequence(npc.base.consequence.item.item(74, 1, 399, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(69, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(69, "=", 0));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Elsbaumwald I"));
talkEntry:addResponse("Ah, fein, ihr möchtet mir dabei helfen, die Bäume zu pflegen. Borkenkäfer sind zu einer echten Plage geworden. Nehmt dieses Beil und sucht nach kranken Naldorbäumen. Bringt mir zehn Scheite, ja?");
talkEntry:addConsequence(npc.base.consequence.item.item(74, 1, 399, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(69, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(69, "=", 0));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Elstree Forest I"));
talkEntry:addResponse("Ah, fine, so you want to help me, caring for the trees. Bark beetles are a real plague these days. Take this hatchet and search for ill naldor trees. Bring me ten logs, will you?");
talkEntry:addConsequence(npc.base.consequence.item.item(74, 1, 399, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(69, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(69, "=", 0));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Elsbaumwald I"));
talkEntry:addResponse("Ah, fein, ihr möchtet mir dabei helfen, die Bäume zu pflegen. Borkenkäfer sind zu einer echten Plage geworden. Nehmt dieses Beil und sucht nach kranken Naldorbäumen. Bringt mir zehn Scheite, ja?");
talkEntry:addConsequence(npc.base.consequence.item.item(74, 1, 399, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(69, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.woodcutting, "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(69, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(544, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 50 copper coins and your lumberjacking skill increases."));
talkEntry:addResponse("Oh, thank you. Here, take this reward for your efforts.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.woodcutting, "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 50));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2560, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(69, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(69, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(544, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 50 copper coins."));
talkEntry:addResponse("Oh, thank you. Here, take this reward for your efforts.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 50));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2560, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(69, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.woodcutting, "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(69, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(544, "all", ">", 9, nil));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 50 Kupferstücke und deine Holzfällerfertigkeit steigt."));
talkEntry:addResponse("Oh, vielen Dank. Hier, eine kleine Entschädigung für eure Mühen.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.woodcutting, "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 50));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2560, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(69, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(69, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(544, "all", ">", 9, nil));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 50 Kupferstücke."));
talkEntry:addResponse("Oh, vielen Dank. Hier, eine kleine Entschädigung für eure Mühen.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 50));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2560, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(69, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(69, "=", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Please take care of ill naldor trees, else bark beetles might make other trees suffer, too.");
talkEntry:addResponse("Well, I am sure you'll find more ill naldor trees.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(69, "=", 1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Bitte kümmert euch um die kranken Naldorbäume, andernfalls könnte der Borkenkäfer auch andere Bäume befallen.");
talkEntry:addResponse("Nun, ihr findet sicher noch weitere kranke Naldorbäume.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(69, "=", 1));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("Please take care of ill naldor trees, else bark beetles might make other trees suffer, too.");
talkEntry:addResponse("Well, I am sure you'll find more ill naldor trees.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(69, "=", 1));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Bitte kümmert euch um die kranken Naldorbäume, andernfalls könnte der Borkenkäfer auch andere Bäume befallen.");
talkEntry:addResponse("Nun, ihr findet sicher noch weitere kranke Naldorbäume.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(69, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Elstree Forest II"));
talkEntry:addResponse("Oje, Schildläuse haben einige der Kirschbäume befallen. Wir haben kein Wahl, schlagt die kranken Bäume und bring mir zwanzig Scheite.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(69, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(69, "=", 2));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Elsbaumwald II"));
talkEntry:addResponse("Oh dear, scale lice infested some of the cherry trees. We have no other choice, cut the ill trees and bring me twenty logs, please.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(69, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(69, "=", 2));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Elstree Forest II"));
talkEntry:addResponse("Oh dear, scale lice infested some of the cherry trees. We have no other choice, cut the ill trees and bring me twenty logs, please.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(69, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(69, "=", 2));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Elsbaumwald II"));
talkEntry:addResponse("Oje, Schildläuse haben einige der Kirschbäume befallen. Wir haben kein Wahl, schlagt die kranken Bäume und bring mir zwanzig Scheite.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(69, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.woodcutting, "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(69, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(543, "all", ">", 19, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 100 copper coins and your lumberjacking skill increases."));
talkEntry:addResponse("Ha, now the archers can train again for any possible emergency, thank you. Take this as a reward.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.woodcutting, "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(543, 20, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(69, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(69, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(543, "all", ">", 19, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 100 copper coins."));
talkEntry:addResponse("Ha, now the archers can train again for any possible emergency, thank you. Take this as a reward.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(543, 20, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(69, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.woodcutting, "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(69, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(543, "all", ">", 19, nil));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 100 Kupferstücke und deine Holzfällerfertigkeit steigt."));
talkEntry:addResponse("Ha, ihr habt es den Schildläusen gezeigt, danke euch. Nehmt dies als Belohnung.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.woodcutting, "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(543, 20, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(69, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(69, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(543, "all", ">", 19, nil));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 100 Kupferstücke."));
talkEntry:addResponse("Ha, ihr habt es den Schildläusen gezeigt, danke euch. Nehmt dies als Belohnung.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(543, 20, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(69, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(69, "=", 3));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Oh dear, scale lice infested some of the cherry trees. We have no other choice, cut the ill trees and bring me twenty logs, please.");
talkEntry:addResponse("Those are not enough cherry logs yet, try to get some more.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(69, "=", 3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Oje, Schildläuse haben einige der Kirschbäume befallen. Wir haben kein Wahl, schlagt die kranken Bäume und bring mir zwanzig Scheite.");
talkEntry:addResponse("Das ist noch nicht genügend Kirschholz, schaut doch bitte zu, dass ihr noch mehr besorgt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(69, "=", 3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("Oh dear, scale lice infested some of the cherry trees. We have no other choice, cut the ill trees and bring me twenty logs, please.");
talkEntry:addResponse("Those are not enough cherry logs yet, try to get some more.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(69, "=", 3));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Oje, Schildläuse haben einige der Kirschbäume befallen. Wir haben kein Wahl, schlagt die kranken Bäume und bring mir zwanzig Scheite.");
talkEntry:addResponse("Das ist noch nicht genügend Kirschholz, schaut doch bitte zu, dass ihr noch mehr besorgt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(69, "=", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Elstree Forest III"));
talkEntry:addResponse("We always used to pin some twigs to the ceiling because of the delicious scent they spread. But now the branches we have have lost their scent. Do you think you can get us five new ones? The most intensive scented twigs can be found in the northern woods");
talkEntry:addConsequence(npc.base.consequence.quest.quest(69, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(69, "=", 4));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Elsbaumwald III"));
talkEntry:addResponse("Wir brachten immer einige Zweige an der Decke an, des köstlichen Duftes wegen, den sie verbreiten. Doch nun haben die jetzigen Zweige ihren Duft verloren. Meint ihr, ihr könntet uns fünf neue besorgen? Die aus dem Nordwald riechen am intensivsten.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(69, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(69, "=", 4));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Elstree Forest III"));
talkEntry:addResponse("We always used to pin some twigs to the ceiling because of the delicious scent they spread. But now the branches we have have lost their scent. Do you think you can get us five new ones? The most intensive scented twigs can be found in the northern woods.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(69, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(69, "=", 4));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Elsbaumwald III"));
talkEntry:addResponse("Wir brachten immer einige Zweige an der Decke an, des köstlichen Duftes wegen, den sie verbreiten. Doch nun haben die jetzigen Zweige ihren Duft verloren. Meint ihr, ihr könntet uns fünf neue besorgen? Die aus dem Nordwald riechen am intensivsten.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(69, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.woodcutting, "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(69, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2786, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 100 copper coins and your lumberjacking skill increases."));
talkEntry:addResponse("Mmh... do you smell that? The calming scent of the woods, thank you very much. Finally my wife and I can go to sleep completely relaxed again.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.woodcutting, "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2786, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(69, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(69, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2786, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 100 copper coins."));
talkEntry:addResponse("Mmh... do you smell that? The calming scent of the woods, thank you very much. Finally my wife and I can go to sleep completely relaxed again.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2786, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(69, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.woodcutting, "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(69, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2786, "all", ">", 4, nil));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 100 Kupferstücke und deine Holzfällerfertigkeit steigt."));
talkEntry:addResponse("Mmh... riecht ihr das? Der beruhigende Duft des Waldes, vielen vielen Dank. Meine Frau und ich können nun endlich wieder entspannt einschlafen.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.woodcutting, "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2786, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(69, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(69, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2786, "all", ">", 4, nil));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 100 Kupferstücke."));
talkEntry:addResponse("Mmh... riecht ihr das? Der beruhigende Duft des Waldes, vielen vielen Dank. Meine Frau und ich können nun endlich wieder entspannt einschlafen.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2786, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(69, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(69, "=", 5));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("We always used to pin some twigs to the ceiling because of the delicious scent they spread. But now the branches we have have lost their scent. Do you think you can get us five new ones?");
talkEntry:addResponse("Well, actually we wanted to have a bigger storage so that we do not have to bother you again. Please, gather some more twigs.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(69, "=", 5));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Wir brachten immer einige Zweige an der Decke an, des köstlichen Duftes wegen, den sie verbreiten. Doch nun haben die jetzigen Zweige ihren Duft verloren. Meint ihr, ihr könntet uns fünf neue besorgen?");
talkEntry:addResponse("Nun, wir wollten uns eigentlich einen Vorrat anlegen, damit wir euch nicht so schnell wieder belästigen müssen. Bringt doch bitte gleich ein paar mehr Zweige.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(69, "=", 5));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("We always used to pin some twigs to the ceiling because of the delicious scent they spread. But now the branches we have have lost their scent. Do you think you can get us five new ones?");
talkEntry:addResponse("Well, actually we wanted to have a bigger storage so that we do not have to bother you again. Please, gather some more twigs.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(69, "=", 5));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Wir brachten immer einige Zweige an der Decke an, des köstlichen Duftes wegen, den sie verbreiten. Doch nun haben die jetzigen Zweige ihren Duft verloren. Meint ihr, ihr könntet uns fünf neue besorgen?");
talkEntry:addResponse("Nun, wir wollten uns eigentlich einen Vorrat anlegen, damit wir euch nicht so schnell wieder belästigen müssen. Bringt doch bitte gleich ein paar mehr Zweige.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(69, "=", 6));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Elstree Forest IV"));
talkEntry:addResponse("In addition to my tasks as forester, I care for the cows. Can you bring me ten bundles of grain to feed them? Nana Winterbutter in Yewdale might help you.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(69, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(69, "=", 6));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Elsbaumwald IV"));
talkEntry:addResponse("Zusätzlich zu meinen Aufgaben als Förster kümmere ich mich um die Kühe. Könnt ihr mir zehn Bündel Getreide bringen, um sie zu füttern? Nana Winterbutter in Eibenthal könnte dir dabei helfen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(69, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(69, "=", 6));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Elstree Forest IV"));
talkEntry:addResponse("In addition to my tasks as forester, I care for the cows. Can you bring me ten bundles of grain to feed them? Nana Winterbutter in Yewdale might help you.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(69, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(69, "=", 6));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Elsbaumwald IV"));
talkEntry:addResponse("Zusätzlich zu meinen Aufgaben als Förster kümmere ich mich um die Kühe. Könnt ihr mir zehn Bündel Getreide bringen, um sie zu füttern? Nana Winterbutter im Eibenthal könnte dir dabei helfen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(69, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.woodcutting, "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(69, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(249, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 200 Kupferstücke und deine Holzfällerfertigkeit steigt."));
talkEntry:addResponse("Vielen, vielen Dank. Nun kann ich die Kühe füttern und mich ihrer Dankbarkeit erfreuen.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.woodcutting, "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 200));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(249, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(69, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(69, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(249, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 200 Kupferstücke."));
talkEntry:addResponse("Vielen, vielen Dank. Nun kann ich die Kühe füttern und mich ihrer Dankbarkeit erfreuen.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 200));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(249, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(69, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.woodcutting, "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(69, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(249, "all", ">", 9, nil));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 200 copper coins and your lumberjacking skill increases."));
talkEntry:addResponse("Thank you so much. Now I can feed the cows and enjoy their gratefullness.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.woodcutting, "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 200));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(249, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(69, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(69, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(249, "all", ">", 9, nil));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 200 copper coins."));
talkEntry:addResponse("Thank you so much. Now I can feed the cows and enjoy their gratefullness.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 200));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(249, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(69, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(69, "=", 7));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Please, the cows have a hard time, finding fresh grass. Will you bring me some straw?");
talkEntry:addResponse("Could you please bring me more straw? Some of the cows are already pretty thin, aren't they?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(69, "=", 7));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Bitte, die Kühe haben es schwer, saftiges Gras zu finden. Werdet ihr mir Stroh bringen?");
talkEntry:addResponse("Könntet ihr mir bitte mehr Stroh bringen? Einige der Kühe sehen schon ganz schön abgemagert aus, nicht?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(69, "=", 7));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("Please, the cows have a hard time, finding fresh grass. Will you bring me some straw?");
talkEntry:addResponse("Could you please bring me more straw? Some of the cows are already pretty thin, aren't they?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(69, "=", 7));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Bitte, die Kühe haben es schwer, saftiges Gras zu finden. Werdet ihr mir Stroh bringen?");
talkEntry:addResponse("Könntet ihr mir bitte mehr Stroh bringen? Einige der Kühe sehen schon ganz schön abgemagert aus, nicht?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(69, "=", 8));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("I am grateful for all your help. If you visit Nana Winterbutter in Yewdale, can you greet her from me?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(69, "=", 8));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Ich bin dankbar für all eure Hilfe. Wenn ihr Nana Winterbutter im Eibenthal besucht, mögt ihr sie von mir grüßen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(69, "=", 8));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("I am grateful for all your help. If you visit Nana Winterbutter in Yewdale, can you greet her from me?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(69, "=", 8));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Ich bin dankbar für all eure Hilfe. Wenn ihr Nana Winterbutter im Eibenthal besucht, mögt ihr sie von mir grüßen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("I am the forester of the Elstree forest. I deal with poachers my way, if you know what I mean.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Ich bin der Förster des Elsbaumwaldes. Mit Wilderern verfahre ich auf meine Weise, falls ihr versteht, was ich meine.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("I am the forester of the Elstree forest. I deal with poachers my way, if you know what I mean.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Ich bin der Förster des Elsbaumwaldes. Mit Wilderern verfahre ich auf meine Weise, falls ihr versteht, was ich meine.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("I never heard of such a place.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Davon habe ich noch nie gehört.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("Nice to meet you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Es freut mich, eure Bekanntschaft zu machen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(69, "=", 0));
talkEntry:addTrigger("Hatchet");
talkEntry:addResponse("If you want a hatchet I could give one to you. But you would have to do a certain task for me in return.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(69, "=", 0));
talkEntry:addTrigger("Beil");
talkEntry:addResponse("Wenn ihr ein Beil wollt, könnte ich euch eines geben, allerdings wäre dies mit einer gewissen Aufgabe verbunden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hatchet");
talkEntry:addResponse("If you want to buy a hatchet, you should ask a merchant in Runewick.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Beil");
talkEntry:addResponse("Wenn ihr ein Beil kaufen wollt, solltet ihr einen Händler in Runewick aufsuchen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("forester");
talkEntry:addResponse("I am a forester, if you want you can assist me and fulfill a task.");
talkEntry:addResponse("As a forester, I care for the forest, yes.");
talkEntry:addResponse("Being a forester is exhausting but also you get to be in touch with the trees a lot.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Förster");
talkEntry:addResponse("Ich bin ein Förster und wenn ihr helfen wollt, gebe ich euch eine Aufgabe.");
talkEntry:addResponse("Als Förster kümmere ich mich um die Bäume, richtig.");
talkEntry:addResponse("Förster zu sein strengt an aber man ist auch viel an der frischen Luft.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Nana");
talkEntry:addTrigger("Winterbutter");
talkEntry:addResponse("Nana is a cute and kind person, living in Yewdale. I used to travel there once in a while - before the bark beetles came.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nana");
talkEntry:addTrigger("Winterbutter");
talkEntry:addResponse("Nana ist eine liebliche und nette Person. Sie lebt im Eibenthal, wohin ich früher oft gereist bin - bevor die Borkenkäfer kamen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("bark beetle");
talkEntry:addResponse("Bark beetles are the trees' foes. And I am the trees' friend. So they are my foes!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Borkenkäfer");
talkEntry:addResponse("Der Borkenkäfer ist der Feind der Bäume und ich bin ein Freund der Bäume. Also ist er mein Feind!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("lice");
talkEntry:addTrigger("louse");
talkEntry:addTrigger("bug");
talkEntry:addTrigger("insect");
talkEntry:addResponse("Scale lice want to exterminate the forest. But what if they succeed - won't they exterminate themselves?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Laus");
talkEntry:addTrigger("Läuse");
talkEntry:addResponse("Die Schildläuse wollen den Wald vernichten. Doch, was wenn sie Erfolg haben? Rotten sie sich nicht so selbst aus?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elstree");
talkEntry:addResponse("Yes, the Elstree forest is like a child and a mother to me. I care for it like for a child and it grants me a sense of well-being like a mother.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elsbaum");
talkEntry:addResponse("Ja, der Elsbaumwald ist wie ein Kind und eine Mutter für mich. Ich kümmere mich um ihn wie um ein Kind und er gibt mir die Geborgenheit wie eine Mutter.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Raban");
talkEntry:addResponse("Raban, yes, I heard that name. He's a hermit, living somewhere deep in the forest, but do not ask me where.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Raban");
talkEntry:addResponse("Raban, ja, von diesem Namen habe ich gehört. Er ist ein Einsiedler, der tief im Wald lebt. Fragt mich aber nicht, wo.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("poacher");
talkEntry:addResponse("I deal with poachers my own way - especially Mr Burton will feel my wrath.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wilderer");
talkEntry:addResponse("Ich habe meine eigenen Methoden, mich um Wilderer zu kümmern. Insbesondere Herr Burton wird mich noch kennenlernen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Eugene");
talkEntry:addTrigger("Burton");
talkEntry:addResponse("Burton. Eugene Burton. If I ever catch this dreaded poacher, I will treat him just like he uses to treat the peaceful animals of Elstree forest.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eugene");
talkEntry:addTrigger("Burton");
talkEntry:addResponse("Burton. Eugene Burton. Wenn ich diesen verdammten Wilderer je erwische, werde ich genau das mit ihm machen, was er mit den friedlichen Tieren des Elsbaumwaldes zu tun pflegt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addResponse("Elvaine is a friend of the forest; still, his prider are towers made of stone.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Elvaine Morgan ist ein Freund des Waldes. Dennoch sind Türme aus Stein sein ganzer Stolz.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Elvaine is a friend of the forest; still, his prider are towers made of stone.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Elvaine Morgan ist ein Freund des Waldes. Dennoch sind Türme aus Stein sein ganzer Stolz.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Only the people of Runewick honour the forest like a treasure. Due to wisdom or their hearts, I do not know.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Nur die Leute aus Runewick ehren den Wald wie ein Kleinod. Sei es wegen ihrer Weisheit oder von ganzem Herzen, wer weiß das schon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("The only wood this gnome honours is what comes with the morning.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Der hat doch nicht mehr alle Latten am Zaun.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("The people of Galmair care for their profit, only. So, I wonder why they don't think about tomorrow's profit, too.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Die Leute aus Galmair scheren sich nur um ihren Profit. Daher frage ich mich, warum sie sich keine langfristigen Gedanken machen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Queen");
talkEntry:addResponse("I doubt Queen Rosaline of Cadomyr even knows what a forest looks like.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königin");
talkEntry:addResponse("Ich bezweifle, dass Königin Rosaline von Cadomyr überhaupt weiß, wie ein Wald aussieht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("I doubt Queen Rosaline of Cadomyr even knows what a forest looks like.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Ich bezweifle, dass Königin Rosaline von Cadomyr überhaupt weiß, wie ein Wald aussieht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Sand and stone, Cadomyr is an inhospitable place. Only palmtrees can stand this region.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Sand und Stein, Cadomyr ist ein unwirtlicher Ort. Nur die Palmen halten es dort aus.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("albar");
talkEntry:addResponse("Please leave me along with stories about Albar. They are not as proud and honourable as people tell you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("Lasst mich doch bitte mit Geschichten aus Albar in frieden. Die sind dort längst nicht so stolz und ehrbar, wie man euch glauben machen möchte.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addResponse("Frankly: Gynk is a horrible place.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("Nun mal ehrlich: Gynk ist ein schrecklicher Ort.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("salkama");
talkEntry:addResponse("There is a reason why Elvaine Morgan won't return to Salkamar. And I fully understand his reasons.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Es hat schon seine Gründe, warum Elvaine Morgan nicht nach Salkamar zurückkehren wird. Und ich kann seinen Standpunkt sehr gut nachvollziehen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("As a forester, I don't have much time to pray to the gods. If I do, I worship Oldra.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Als Förster hat man nicht viel Zeit, um zu den Göttern zu beten. Wenn ich es aber tue, dann bete ich zu Oldra.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("Oldra is the only young goddess that does not deal too much with the ways of men, can't you see?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("Oldra ist die einzige junge Göttin, die sich nicht allzusehr um die Angelegenheiten der Menschen kümmert, ist dem nicht so?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("Sorry, I do not. All I know is how to prune trees without harming them more than necessary.");
talkEntry:addResponse("The narrow-minded act of trading does not suit me, thus you cannot purchase anything from me.");
talkEntry:addResponse("I do not sell anything, in special no wood of slaughtered trees.");
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Verzeiht, ich handel nicht. Ich weiß nur, wie man Bäume möglichst schonend zurückschneidet.");
talkEntry:addResponse("Der engstirnige Akt des Handelns ist nichts für mich, deshalb könnt ihr auch nichts von mir kaufen.");
talkEntry:addResponse("Ich verkaufe nichts, insbesonder kein Holz von geschlachteten Bäumen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("Well, there is not much I could tell, Elstree forest is a rather peaceful place.");
talkEntry:addResponse("I am no story-teller, if you want to gain information about the world you better ask one of the old elves or study the chronicles, that is more exciting than I could present it.");
talkEntry:addResponse("Well. I am afraid I do not have anything to tell you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Nun, es gibt nicht viel, das ich erzählen könnte, der Elsbaumwald ist ein eher ruhiger Ort.");
talkEntry:addResponse("Ich bin kein Geschichtenerzähler, wenn ihr mehr über die Welt erfahren wollt, schlagt in den Chroniken nach, das ist aufregender, als ich es darstellen könnte.");
talkEntry:addResponse("Nun, ich fürchte, ich habe nichts zu erzählen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Valandil");
talkEntry:addTrigger("Elensar");
talkEntry:addResponse("Us elves have interesting names, don't we?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valandil");
talkEntry:addTrigger("Elensar");
talkEntry:addResponse("Wir Elfen haben interessante Namen, nicht wahr?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("Really?");
talkEntry:addResponse("#me looks confused");
talkEntry:addResponse("Can your repeat that?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("Wirklich?");
talkEntry:addResponse("#me schaut etwas verwirrt");
talkEntry:addResponse("Könnt ihr das wiederholen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("No?");
talkEntry:addResponse("Why not?");
talkEntry:addResponse("#me shakes his head slowly");
talkEntry:addResponse("I don't understand...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("Nein?");
talkEntry:addResponse("Weshalb nicht?");
talkEntry:addResponse("#me schüttelt seinen Kopf bedächtig");
talkEntry:addResponse("Ich verstehe nicht ganz...");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("Blöde Borkenkäfer!", "Damn bark beetles!");
talkingNPC:addCycleText("Läuse! Überall Läuse!", "Lice! Everywhere lice!");
talkingNPC:addCycleText("#me harkt einen Haufen Laub zusammen.", "#me rakes a pile of leaves.");
talkingNPC:addCycleText("#me fährt die Klinge eines Beils mit einem Wetzstein entlang.", "#me sharpens the blade of a hatchet with a whetstone");
talkingNPC:addCycleText("#me sieht sich um und murmelt vor sich hin: 'Meine Freunde...'", "#me looks around and murmurs: 'My friends...'");
talkingNPC:addCycleText("Wenn ich jemanden dabei erwische, wie er ohne meine Billigung Holz schlägt, dann wird er was erleben!", "When I catch somebody cutting wood without my permission, he's got something coming!");
talkingNPC:addCycleText("Willkommen im Elsbaumwald.", "Welcome to Elstree forest.");
talkingNPC:addCycleText("#me sieht einem Schmetterling hinterher und lächelt.", "#me watches a butterfly and smiles.");
talkingNPC:addCycleText("#me pfeift vor sich hin.", "#me whistles a tune.");
talkingNPC:addCycleText("Ich seh die Bäume vor lauter Wald nicht mehr.", "I can't see the trees through all this forest.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(3);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Dieser NPC ist der Förster Valandil Elensar.", "This NPC is the forester Valandil Elensar.");
mainNPC:setUseMessage("Fass mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut verwirrt drein.", "#me looks around confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 364);
mainNPC:setEquipment(11, 194);
mainNPC:setEquipment(5, 74);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 48);
mainNPC:setEquipment(9, 824);
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
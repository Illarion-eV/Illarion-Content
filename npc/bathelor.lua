--------------------------------------------------------------------------------
-- NPC Name: Bathelor                                                    None --
-- NPC Job:  High priest                                                      --
--                                                                            --
-- NPC Race: human                      NPC Position:  519, 128, 0            --
-- NPC Sex:  male                       NPC Direction: south                  --
--                                                                            --
-- Author:   Estralis Seborian                                                --
--                                                                            --
-- Last parsing: October 28, 2012                        easyNPC Parser v1.21 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (0, 519, 128, 0, 4, 'Bathelor', 'npc.bathelor', 0, 4, 5, 129, 29, 29, 255, 162, 122);
---]]

require("npc.base.basic")
require("npc.base.condition.item")
require("npc.base.condition.language")
require("npc.base.condition.quest")
require("npc.base.consequence.deleteitem")
require("npc.base.consequence.inform")
require("npc.base.consequence.item")
require("npc.base.consequence.quest")
require("npc.base.talk")
module("npc.bathelor", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Bathelor the high priest of Brágon. Keywords: Hello, Brágon, Quest, Priest, Temple."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Bathelor der Hohepriester Brágons. Schlüsselwörter: Hallo, Brágon, Quest, Priester, Tempel."));
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
talkEntry:addResponse("Your pilgrimage has come to an end. You have found the temple of the Five.");
talkEntry:addResponse("Be greeted in the name of Brágon.");
talkEntry:addResponse("Hail Brágon! What is it, my child?");
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
talkEntry:addResponse("Eure Pilgerfahrt hat eine Ende. Ihr habt den Tempel der Fünf gefunden.");
talkEntry:addResponse("Seid gegrüßt im Namen Brágons.");
talkEntry:addResponse("Was gibt es, mein Kind?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Your pilgrimage has come to an end. You have found the temple of the Five.");
talkEntry:addResponse("Be greeted in the name of Brágon.");
talkEntry:addResponse("Hail Brágon! What is it, my child?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Eure Pilgerfahrt hat eine Ende. Ihr habt den Tempel der Fünf gefunden.");
talkEntry:addResponse("Seid gegrüßt im Namen Brágons.");
talkEntry:addResponse("Was gibt es, mein Kind?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("May Brágon speed you into the flames");
talkEntry:addResponse("May the fire in you never be extinguished!");
talkEntry:addResponse("Go with Brágon's blessing.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Gehet hin in Flammen.");
talkEntry:addResponse("Und möge das Feuer in euch niemals erlöschen.");
talkEntry:addResponse("Gehet mit Brágons Segen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Go with Brágonspeed.");
talkEntry:addResponse("And may the fire in you never faint!");
talkEntry:addResponse("Go with Brágon's blessing.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Gehet hin in Flammen.");
talkEntry:addResponse("Und möge das Feuer in euch niemals erlöschen.");
talkEntry:addResponse("Gehet mit Brágons Segen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("I feel enlightened.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befind");
talkEntry:addResponse("Ich fühle mich erleuchtet.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("I am Bathelor, high priest of Brágon. Praise Brágon!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ihr name");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Ich bin Bathelor, Hohepriester Brágons. Lobet Brágon!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(113, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] A spark to a flame I"));
talkEntry:addResponse("Very well. To prove that you are a truly devout servant of the Five, I want you to pay hommage to them. Visit each of the shrines of the Five in the temple and honour them.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(113, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(113, "=", 0));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Feuer und Flamme I"));
talkEntry:addResponse("Sehr gut. Um zu beweisen, dass ihr ein frommer Diener der Fünf seid, möchte ich, dass ihr ihnen huldigt. Besucht jeden der Schreine der Fünf und ehret sie.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(113, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(113, "=", 0));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] A spark to a flame I"));
talkEntry:addResponse("Very well. To prove that you are a truly devout servant of the Five, I want you to pay hommage to them. Visit each of the shrines of the Five in the temple and honour them.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(113, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(113, "=", 0));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Feuer und Flamme I"));
talkEntry:addResponse("Sehr gut. Um zu beweisen, dass ihr ein frommer Diener der Fünf seid, möchte ich, dass ihr ihnen huldigt. Besucht jeden der Schreine der Fünf und ehret sie.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(113, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(113, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded five candles."));
talkEntry:addResponse("Praise the Five, hail Brágon! Here, take these candles, for they will guide you through the darkest nights.");
talkEntry:addConsequence(npc.base.consequence.item.item(43, 5, 333, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(113, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(113, "=", 2));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst fünf Kerzen."));
talkEntry:addResponse("Lobet die Fünf, gepriesen sei Brágon! Hier, nehmt diese Kerzen, sie werden euch ein Licht in der Dunkelheit sein.");
talkEntry:addConsequence(npc.base.consequence.item.item(43, 5, 333, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(113, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(113, "=", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("I told you to honour the five at their shrines. Move!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(113, "=", 1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Ich habe gesagt, ihr sollt den Fünf die Ehre an ihren Schreinen erweisen. Los!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(113, "=", 1));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addResponse("I told you to honour the five at their shrines. Move!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(113, "=", 1));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addResponse("Ich habe gesagt, ihr sollt den Fünf die Ehre an ihren Schreinen erweisen. Los!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(113, "=", 3));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] A spark to a flame II"));
talkEntry:addResponse("I appreciate your devotion. Rituals in honour of Brágon all have one thing in common: Something has to be burnt! As a believer, will you please go out and fetch me ten logs of naldor wood?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(113, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(113, "=", 3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Feuer und Flamme II"));
talkEntry:addResponse("Ich würdige eure Hingabe. Rituale in Ehren an Brágon haben alle eines gemeinsam: Etwas muss verbrannt werden! Als Gläubiger, würdet ihr bitte losziehen und mir zehn Scheite Naldorholz besorgen?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(113, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(113, "=", 3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] A spark to a flame II"));
talkEntry:addResponse("I appreciate your devotion. Rituals in honour of Brágon all have one thing in common: Something has to be burnt! As a believer, will you please go out and fetch me ten logs of naldor wood?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(113, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(113, "=", 3));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Feuer und Flamme II"));
talkEntry:addResponse("Ich würdige eure Hingabe. Rituale in Ehren an Brágon haben alle eines gemeinsam: Etwas muss verbrannt werden! Als Gläubiger, würdet ihr bitte losziehen und mir zehn Scheite Naldorholz besorgen?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(113, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(113, "=", 4));
talkEntry:addCondition(npc.base.condition.item.item(544, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded a ruby ring."));
talkEntry:addResponse("Ah, the next ritual to honour Brágon can take place thanks to you. Take this ring as a sign of your faith.");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(544, 10, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(68, 1, 599, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(113, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(113, "=", 4));
talkEntry:addCondition(npc.base.condition.item.item(544, "all", ">", 9, nil));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst einen Rubinring."));
talkEntry:addResponse("Ah, das nächste Ritual zu Ehren Brágons kann dank euch stattfinden. Nehmt diesen Ring als Zeichen eures Glaubens.");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(544, 10, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(68, 1, 599, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(113, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(113, "=", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Naldor wood burns best and a Brágon ritual needs a lot of it to be burnt. Brágon will reward you for your dedication.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(113, "=", 4));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Naldorholz brennt am besten und bei einem Brágonritual wird zumeist eine Menge verbrannt. Brágon wird euch für eure Hingabe entlohnen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(113, "=", 4));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addResponse("Naldor wood burns best and a Brágon ritual needs a lot of it to be burnt. Brágon will reward you for your dedication.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(113, "=", 4));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addResponse("Naldorholz brennt am besten und bei einem Brágonritual wird zumeist eine Menge verbrannt. Brágon wird euch für eure Hingabe entlohnen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(113, "=", 5));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] A spark to a flame III"));
talkEntry:addResponse("I see you are really serious in your faith in Brágon. I think you are worthy to become a devotee of Brágon. Enter his shrine and sacrifice what is already his and then come back to me to receive my blessings.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(113, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(113, "=", 5));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Feuer und Flamme III"));
talkEntry:addResponse("Ich sehe, ihr meint es wirklich ernst mit dem Glauben an Brágon. Ich denke, ihr seid würdig, einer seiner Anhänger zu werden. Gehet zu seinem Schrein und opfert, was ohnehin sein ist. Kommt dann zu mir zurück, um meinen Segen zu empfangen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(113, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(113, "=", 5));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] A spark to a flame III"));
talkEntry:addResponse("I see you are really serious in your faith in Brágon. I think you are worthy to become a devotee of Brágon. Enter his shrine and sacrifice what is already his and then come back to me to receive my blessings.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(113, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(113, "=", 5));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Feuer und Flamme III"));
talkEntry:addResponse("Ich sehe, ihr meint es wirklich ernst mit dem Glauben an Brágon. Ich denke, ihr seid würdig, einer seiner Anhänger zu werden. Gehet zu seinem Schrein und opfert, was ohnehin sein ist. Kommt dann zu mir zurück, um meinen Segen zu empfangen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(113, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(113, "=", 6));
talkEntry:addCondition(npc.base.condition.quest.quest(401, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded a red priest robe."));
talkEntry:addResponse("#me raises his hands and chants: 'Be blessed in the name of Brágon! Go forth and accomplish deeds in his name.'");
talkEntry:addConsequence(npc.base.consequence.item.item(2419, 1, 799, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(113, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(113, "=", 6));
talkEntry:addCondition(npc.base.condition.quest.quest(401, "=", 2));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst eine rote Priesterrobe."));
talkEntry:addResponse("#me hebt seine Hände und singt: 'Seid gesegnet in Brágons Namen! Gehet hin und vollbringt Taten in seinem Namen.'");
talkEntry:addConsequence(npc.base.consequence.item.item(2419, 1, 799, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(113, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(113, "=", 6));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("You hesitate to sacrifice your mudane wealth Brágon? It will go up in flames one day anyway, trust me!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(113, "=", 6));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Zögert ihr, euren weltlichen Besitz Brágon zu opfern? Er wird sowieso eines Tages in Flammen aufgehen, glaubt es mir.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(113, "=", 6));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addResponse("You hesitate to sacrifice your mudane wealth to Brágon? It will go up in flames one day anyway, trust me!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(113, "=", 6));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addResponse("Zögert ihr, euren weltlichen Besitz Brágon zu opfern? Er wird sowieso eines Tages in Flammen aufgehen, glaubt es mir.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(113, "=", 7));
talkEntry:addCondition(npc.base.condition.quest.quest(401, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("I see your faith in Brágon is still strong. Renounce him and he will renounce you. He will care little, but you will probably end up scorched.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(113, "=", 7));
talkEntry:addCondition(npc.base.condition.quest.quest(401, "=", 2));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Wie ich sehe, ist euer Glaube an Brágon noch immer stark. Entsagt ihm und er entsagt euch. Ihn kümmert es wenig, aber ihr werdet wohl versengt werden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(113, "=", 7));
talkEntry:addCondition(npc.base.condition.quest.quest(401, "=", 2));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addResponse("I see your faith in Brágon is still strong. Renounce him and he will renounce you. He will care little, but you will probably end up scorched.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(113, "=", 7));
talkEntry:addCondition(npc.base.condition.quest.quest(401, "=", 2));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addResponse("Wie ich sehe, ist euer Glaube an Brágon noch immer stark. Entsagt ihm und er entsagt euch. Ihn kümmert es wenig, aber ihr werdet wohl versengt werden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(113, "=", 7));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Out of my sight, you traitor! Blasphemer! Infidel!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(113, "=", 7));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Aus meinen Augen, ihr Verräter! Gotteslästerer! Ungläubiger!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(113, "=", 7));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addResponse("Out of my sight, you traitor! Blasphemer! Infidel!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(113, "=", 7));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addResponse("Aus meinen Augen, ihr Verräter! Gotteslästerer! Ungläubiger!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("I am the high priest of Brágon in these lands. Any donations or sacrifices to Brágon should be given to me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Ich bin der Hohepriester Brágons in diesen Ländereien. Jedwede Spenden oder Opfer an Brágon solltet ihr mir geben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("I am the high priest of Brágon in these lands. Any donations or sacrifices to Brágon should be given to me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Ich bin der Hohepriester Brágons in diesen Ländereien. Jedwede Spenden oder Opfer an Brágon solltet ihr mir geben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("The land of Gobaith is burnt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Gobaithland ist abgebrannt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("So, are you a devout follower of Brágon, the eternal flame, the spark of life?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Seid ihr ein frommer Anhänger Brágons, der ewigen Flamme, des Lebensfunkens?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("priest");
talkEntry:addResponse("I am the high priest of Brágon. He speaks through my voice and acts with my hands. Ally with me and you ally with the Lord of Fire!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("temple");
talkEntry:addResponse("This is the temple of the Five. If you even dare to ask who the Five are, I will burn your body and feed the charred remains to the crows. Marvel at their magnificence!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("five");
talkEntry:addTrigger("old");
talkEntry:addResponse("Eldan is the mind, Ushara is the body, Tanora is the blood and Findari is the breath, but Brágon is the heart!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("eleven");
talkEntry:addTrigger("young");
talkEntry:addResponse("Imposters! All of them! Calling themselves gods, they do. They are nothing but minions, serfs!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("fire");
talkEntry:addResponse("Blazing flames will consume all that is not just when the end of days has come. Ask the refugees of Gobaith if you want to know what that looks like!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("donation");
talkEntry:addTrigger("sacrifi");
talkEntry:addResponse("If you really want to perform acts on behalf of Brágon, ask me for a task.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Priest");
talkEntry:addResponse("Ich bin der Hohenpriester Brágons. Er spricht durch meine Stimme und handelt mit meinen Händen. Legt euch mit mir an und ihr legt euch mit dem Herren des Feuers an.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tempel");
talkEntry:addResponse("Dies ist der Tempel der Fünf. Wenn ihr es auch nur wagt, zu fragen, wer die Fünf sind, werde ich euren Körper verbrennen und die verkohlten Überreste an die Krähen verfüttern. Bestaunt ihre Pracht!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Fünf");
talkEntry:addTrigger("alt");
talkEntry:addResponse("Eldan ist der Geist, Ushara der Leib, Tanora das Blut und Findari ist der Atem. Doch Brágon ist das Herz!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elf");
talkEntry:addTrigger("jung");
talkEntry:addResponse("Betrüger! Sie alle sind Betrüger! Nennen sich selbst Götter. Sie sind nichts als Diener, Leibeigene!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("feuer");
talkEntry:addResponse("Lodernde Flammen werden all das vertilgen, was nicht gerecht ist, wenn das Ende der Tage naht. Fragt die Flüchtlinge von Gobaith, wie so etwas aussieht!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Opfer");
talkEntry:addTrigger("Spende");
talkEntry:addResponse("Wenn ihr wirklich Taten im Namen Brágons vollbringen wollt, fragt mich nach einem Auftrag.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addResponse("What is his name again? Elvaine? What a stupid name for an infidel.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Wie hieß er noch gleich? Elvaine? Was für ein dämlicher Name, selbst für einen Ungläubigen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("What is his name again? Elvaine? What a stupid name for an infidel.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Wie hieß er noch gleich? Elvaine? Was für ein dämlicher Name, selbst für einen Ungläubigen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Runewick, Runewick, Runewick. They claim to be wise, but instead of being crusaders in Eldan's way, the half heartely idolise Elara.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Runewick, Runewick, Runewick. Sie meinen, weise zu sein, aber statt Kreuzritter im Geiste Eldans zu sein, vergöttern sie halbherzig Elara.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("The infidel should burn!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Der Ungläubige soll verbrennen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Galmair is a place without gods. Because the gods give a smile about this pool of sins.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Galmair ist ein gottloser Ort, denn die Götter scheren sich einen Dreck um diesen Sündenpfuhl.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Queen");
talkEntry:addResponse("I must admit I do not quite understand the ways of 'her majesty'. On the one hand, she is known to worship Brágon with all of her heart, but all she spreads is faith in Malachín.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königin");
talkEntry:addResponse("Ich muss gestehen, dass ich die Wege 'ihrer Majestät' nicht ganz nachvollziehen kann. Einerseits ist es kein Geheimnis, dass sie Brágon mit ganzem Herzen verehrt, andererseits aber predigt sie den Glauben an Malachín.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("I must admit I do not quite understand the ways of 'her majesty'. On the one hand, she is known to worship Brágon with all of her heart, but all she spreads is faith in Malachín.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Ich muss gestehen, dass ich die Wege 'ihrer Majestät' nicht ganz nachvollziehen kann. Einerseits ist es kein Geheimnis, dass sie Brágon mit ganzem Herzen verehrt, andererseits aber predigt sie den Glauben an Malachín.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Brágon is well respected in Cadomyr, so I respect Cadomyr. The presence of the scorching sun might convince them of the omnipresence of Brágon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Brágon wird in Cadomyr geachtet, also achte ich Cadomyr. Die sengende Sonne scheint sie jeden Tag an die Allgegenwärtigkeit Brágons zu erinnern.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("albar");
talkEntry:addResponse("Ah, let us talk about Farfarawayland now? One can say whatever one wants about the Albarians: At least they honour the gods!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("Ah, reden wir jetzt über Weitwegland? Man kann über die Albarier denken, was man will: Wenigstens sind sie fromm!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addResponse("One day, Gynk will burn. Be it due to a gnomish experiment with white liquids or be it the wrath of Brágon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("Eines Tages wird Gynk in Flammen aufgehen. Sei es durch ein gnomisches Experiment mit weißen Flüssigkeiten oder sei es durch den Zorn Brágons.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Never trust nor believe a Salkamaerian. Respect them and their deeds, but do not have faith in them repeating what they did once.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Glaubt oder traut niemals einem Salkamaeriern. Respektiert sie, für das, was sie tun, aber legt keinen Glauben darein, dass sich ihre Taten wiederholen werden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("There are five gods: Brágon, Eldan, Findari, Tanora and Ushara. If you didn't know before, drop dead now.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Es gibt fünf Götter: Brágon, Eldan, Findari, Tanora und Ushara. Wenn ihr das nicht wußtet, fallt bitte tot um.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addResponse("Brágon is the heart; whatever we do, we do it because our heart tells us to. Be it good, be it bad, Brágon is in all we do. He is the esteem that makes our life worthy.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addResponse("Brágon ist das Herz; was auch immer wir tun, wir tun es, weil es unser Herz gebietet. Sei es gut, sei es böse, Brágon ist in allem, was wir tun. Er ist Funke, der unser Leben lebenswert macht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Eldan");
talkEntry:addResponse("Eldan is the mind.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eldan");
talkEntry:addResponse("Eldan ist der Geist.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Findari");
talkEntry:addResponse("Findari is the breath.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Findari");
talkEntry:addResponse("Findari ist der Atem.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("Tanora is the blood.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("Tanora ist das Blut.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("Ushara is the body.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("Ushara ist der Leib.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("Get the flame out of here!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Verbrennt euch!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("I am happy to tell you about the Five and in particular Brágon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Gerne erzähle ich euch von den Fünf und Brágon im Besonderen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Bathelor");
talkEntry:addResponse("My name is not that important, you can call me your 'Highness' or 'Excellency'.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bathelor");
talkEntry:addResponse("Mein Name ist nicht so wichtig, ihr könnt mich auch 'Durchlaucht' oder 'Exzellenz' nennen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("Hail Brágon!");
talkEntry:addResponse("Blessed be Brágon!");
talkEntry:addResponse("Praise Brágon!");
talkEntry:addResponse("Honour Brágon!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("Gelobet sei Brágon!");
talkEntry:addResponse("Lobet Brágon!");
talkEntry:addResponse("Ehret Brágon!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("Hail Brágon!");
talkEntry:addResponse("Blessed be Brágon!");
talkEntry:addResponse("Praise Brágon!");
talkEntry:addResponse("Honour Brágon!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("Gelobet sei Brágon!");
talkEntry:addResponse("Lobet Brágon!");
talkEntry:addResponse("Ehret Brágon!");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("Ich bin Bathelor!", "I am Bathelor!");
talkingNPC:addCycleText("Lobet Brágon!", "Praise Brágon!");
talkingNPC:addCycleText("Wir brauchen hier kein Wasser, lasst das Feuer brennen.", "We don't need no water let the fire burn. Burn, fire, burn!");
talkingNPC:addCycleText("Wir haben das Feuer nicht entfacht, es hat schon immer gebrannt, seitdem sich die Welt bewegt.", "We didn't start the fire, it was always burning, since the world's been turning .");
talkingNPC:addCycleText("Ihr hattet genug Zeit zu rasten, diese ist nun abgelaufen.", "You've had the time to rest, which is coming to an end.");
talkingNPC:addCycleText("Feuer!", "Fire!");
talkingNPC:addCycleText("Es brennt!", "It's burning!");
talkingNPC:addCycleText("Gelobt sei Brágon!", "Hail Brágon!");
talkingNPC:addCycleText("Träume ich oder ist dieses Feuer die ewige Flamme?", "Am I only dreaming or is this burning an eternal flame?");
talkingNPC:addCycleText("Vollbringt Taten im Namen Brágons.", "Do deeds to honour Brágon.");
talkingNPC:addCycleText("Ich diene dem Gott des Feuers. Und er bringt euch... Feuer!", "I serve the god of fire. And he brings you... fire!");
mainNPC:addLanguage(0);
mainNPC:addLanguage(1);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Dieser NPC ist Bathelor der Hohepriester Brágons.", "This NPC is Bathelor the high priest of Brágon.");
mainNPC:setUseMessage("Fasst mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut verwirrt.", "#me looks around confused.");
mainNPC:setEquipment(1, 358);
mainNPC:setEquipment(3, 818);
mainNPC:setEquipment(11, 2419);
mainNPC:setEquipment(5, 2783);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 2295);
mainNPC:setEquipment(9, 34);
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
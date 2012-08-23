--------------------------------------------------------------------------------
-- NPC Name: Phillibald                                                  None --
-- NPC Job:  portalbook merchant                                              --
--                                                                            --
-- NPC Race: halfling                   NPC Position:  1, 7, 0                --
-- NPC Sex:  male                       NPC Direction: north                  --
--                                                                            --
-- Author:   Zot, Faladron                                                    --
--                                                                            --
-- Last parsing: August 18, 2012                          easyNPC Parser v1.2 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (2, 1, 7, 0, 0, 'Phillibald', 'npc.phillibald', 0, 1, 1, 123, 62, 9, 245, 180, 137);
---]]

require("npc.base.basic")
require("npc.base.condition.language")
require("npc.base.condition.money")
require("npc.base.consequence.inform")
require("npc.base.consequence.item")
require("npc.base.consequence.money")
require("npc.base.talk")
module("npc.phillibald", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is the portal merchant Phillibald. Keyphrases: Hello, portals, books."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist der Portalbuch Händler Phillibald. Schlüsselwörter: Hallo, Portale, Bücher."));
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
talkEntry:addResponse("Hiho! Today is a fine day to travel.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Grüß");
talkEntry:addTrigger("Gruß");
talkEntry:addTrigger("Guten Tag");
talkEntry:addTrigger("Guten Abend");
talkEntry:addTrigger("Mahlzeit");
talkEntry:addTrigger("Tach");
talkEntry:addTrigger("Moin");
talkEntry:addResponse("Hiho! Heute ist ein schöner Tag für eine Reise.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hiho! Today is a fine day to travel.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Hiho! Heute ist ein schöner Tag für eine Reise.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Always keep moving!");
talkEntry:addResponse("Toodles!");
talkEntry:addResponse("Farewell.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Immer in Bewegung bleiben!");
talkEntry:addResponse("Tschüssi!");
talkEntry:addResponse("Auf wiedersehen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Always keep moving!");
talkEntry:addResponse("Toodles!");
talkEntry:addResponse("Farewell.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Immer in Bewegung bleiben!");
talkEntry:addResponse("Tschüssi!");
talkEntry:addResponse("Auf wiedersehen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("I feel excited, thinking about all the places to travel to.");
talkEntry:addResponse("I'm itching to make another journey.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addResponse("Ich bin so aufgeregt, wenn ich nur an all die Orte denke an die man Reisen kann.");
talkEntry:addResponse("Es juckt mich in den Füßen, eine Reise zu machen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("Phillibald, portalbook merchant. That's me.");
talkEntry:addResponse("I am the merchant Phillibald.");
talkEntry:addResponse("Phillibald is my name, I trade portalbooks.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Phillibald, Portalbuch Händler. Das bin ich.");
talkEntry:addResponse("Ich bin der Händler Phillibald");
talkEntry:addResponse("Phillibald mein Name, ich handle mit Portalbüchern");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I do not issue any quests. But I can sell you books to go to other places.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Ich verteile keine Aufgaben. Aber ihr könnt von mir Bücher kaufen, die euch an andere Orte bringen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addResponse("I do not issue any quests. But I can sell you books to go to other places.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addResponse("Ich verteile keine Aufgaben. Aber ihr könnt von mir Bücher kaufen, die euch an andere Orte bringen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("I am a merchant of portalbooks.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Ich handle mit Portalbüchern.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I am a merchant of portalbooks.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Ich handle mit Portalbüchern.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("With a little luck I can get a book to take you there! Nah, not realy just kidding.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Mit etwas Glück kann ich dir ein Buch besorgen, das dich dorthin bringt! Nö, nicht wirklich nur'n Scherz.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("Nice to meet you. If you want to 'book' a travel just ask me, hihi.");
talkEntry:addResponse("A nice name, indeed.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Schön dich kennenzulernen. Wenn du eine Reise 'buch'-en willst, frag mich einfach, hihi.");
talkEntry:addResponse("Ein netter Name.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("family");
talkEntry:addTrigger("siblings");
talkEntry:addTrigger("sister");
talkEntry:addTrigger("brother");
talkEntry:addResponse("Me and my family like to hike and explore, I bet you can find my other siblings at other places if you just look closely!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Familie");
talkEntry:addTrigger("Geschwister");
talkEntry:addTrigger("Schwester");
talkEntry:addTrigger("Bruder");
talkEntry:addTrigger("Brüder");
talkEntry:addResponse("Ich und meine Familie wandern und entdecken gern. Ich bin mir sicher du kannst meine anderen Geschwister an anderen Orten finden wenn du nur genau guckst!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ich kaufe ein Portalbuch nach Galmair");
talkEntry:addCondition(npc.base.condition.money.money(">", 199));
talkEntry:addResponse("Okay! Das macht 200 Kupferstücke!");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 200));
talkEntry:addConsequence(npc.base.consequence.item.item(1061, 1, 1, 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ich kaufe ein Portalbuch nach Cadomyr");
talkEntry:addCondition(npc.base.condition.money.money(">", 199));
talkEntry:addResponse("Okay! Das macht 200 Kupferstücke!");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 200));
talkEntry:addConsequence(npc.base.consequence.item.item(1061, 1, 1, 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ich kaufe ein Portalbuch nach Runewick");
talkEntry:addCondition(npc.base.condition.money.money(">", 199));
talkEntry:addResponse("Okay! Das macht 200 Kupferstücke!");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 200));
talkEntry:addConsequence(npc.base.consequence.item.item(1061, 1, 1, 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ich kaufe ein Portalbuch nach Wilderland");
talkEntry:addCondition(npc.base.condition.money.money(">", 199));
talkEntry:addResponse("Okay! Das macht 200 Kupferstücke!");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 200));
talkEntry:addConsequence(npc.base.consequence.item.item(1061, 1, 1, 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ich kaufe ein Portalbuch nach Safepoint 1");
talkEntry:addCondition(npc.base.condition.money.money(">", 199));
talkEntry:addResponse("Okay! Das macht 200 Kupferstücke!");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 200));
talkEntry:addConsequence(npc.base.consequence.item.item(1061, 1, 1, 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ich kaufe ein Portalbuch nach Safepoint 2");
talkEntry:addCondition(npc.base.condition.money.money(">", 199));
talkEntry:addResponse("Okay! Das macht 200 Kupferstücke!");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 200));
talkEntry:addConsequence(npc.base.consequence.item.item(1061, 1, 1, 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ich kaufe ein Portalbuch nach Safepoint 3");
talkEntry:addCondition(npc.base.condition.money.money(">", 199));
talkEntry:addResponse("Okay! Das macht 200 Kupferstücke!");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 200));
talkEntry:addConsequence(npc.base.consequence.item.item(1061, 1, 1, 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ich kaufe ein Portalbuch nach Safepoint 4");
talkEntry:addCondition(npc.base.condition.money.money(">", 199));
talkEntry:addResponse("Okay! Das macht 200 Kupferstücke!");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 200));
talkEntry:addConsequence(npc.base.consequence.item.item(1061, 1, 1, 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ich kaufe ein Portalbuch nach Safepoint 5");
talkEntry:addCondition(npc.base.condition.money.money(">", 199));
talkEntry:addResponse("Okay! Das macht 200 Kupferstücke!");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 200));
talkEntry:addConsequence(npc.base.consequence.item.item(1061, 1, 1, 9));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addResponse("Luckily me and my family stay out of politics. Our services are well saught in all of the three towns.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Glücklicherweise halten sich meine Familie und ich aus der Politik raus. Unsere Dienste werden in allen Städten gerne in Anspruch genommen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Luckily me and my family stay out of politics. Our services are well saught in all of the three towns.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Glücklicherweise halten sich meine Familie und ich aus der Politik raus. Unsere Dienste werden in allen Städten gerne in Anspruch genommen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Luckily me and my family stay out of politics. Our services are well saught in all of the three towns.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Glücklicherweise halten sich meine Familie und ich aus der Politik raus. Unsere Dienste werden in allen Städten gerne in Anspruch genommen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Luckily me and my family stay out of politics. Our services are well saught in all of the three towns.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Glücklicherweise halten sich meine Familie und ich aus der Politik raus. Unsere Dienste werden in allen Städten gerne in Anspruch genommen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Luckily me and my family stay out of politics. Our services are well saught in all of the three towns.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Glücklicherweise halten sich meine Familie und ich aus der Politik raus. Unsere Dienste werden in allen Städten gerne in Anspruch genommen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Queen");
talkEntry:addResponse("Luckily me and my family stay out of politics. Our services are well saught in all of the three towns.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königin");
talkEntry:addResponse("Glücklicherweise halten sich meine Familie und ich aus der Politik raus. Unsere Dienste werden in allen Städten gerne in Anspruch genommen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Luckily me and my family stay out of politics. Our services are well saught in all of the three towns.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Glücklicherweise halten sich meine Familie und ich aus der Politik raus. Unsere Dienste werden in allen Städten gerne in Anspruch genommen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Luckily me and my family stay out of politics. Our services are well saught in all of the three towns.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Glücklicherweise halten sich meine Familie und ich aus der Politik raus. Unsere Dienste werden in allen Städten gerne in Anspruch genommen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Oh, Albar, I've seen much of it on earlier journeys.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("Oh, Albar, davon hab ich viel gesehen auf früheren Reisen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("You have to see it for yourself to believe it...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("Man muss selbst nach Gynk reisen um es zu glauben...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Nice place. They got some very tasty food there too.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Netter Ort. Die haben dort auch ziemlich wohlschmeckendes Essen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("The gods created this world for us to discover and travel within.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Die Götter haben diese Welt für uns erschaffen um sie zu entdecken und darin zu reisen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("I sell various portal books that can take you to places. Handy if you're lost in the wild.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Ich verkaufe verschiedene Portalbücher die dich an Orte bringen können. Ziemlich nützlich wenn man sich in der Wildnis verlaufen hat.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("Me and my family like to hike and explore, I bet you can find my other siblings at other places if you just look closely!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Ich und meine Familie wandern und entdecken gern. Ich bin mir sicher du kannst meine anderen Geschwister an anderen Orten finden wenn du nur genau guckst!");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("Ich kann euch an interessante Orte bringen.", "I can take you to interesting places.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(10);
mainNPC:addLanguage(2);
mainNPC:addLanguage(3);
mainNPC:addLanguage(4);
mainNPC:addLanguage(1);
mainNPC:addLanguage(5);
mainNPC:addLanguage(5);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Ein NPC der toll aussieht.", "A NPC who is looking good.");
mainNPC:setUseMessage("Fass mich nicht an!", "Stop touching me!");
mainNPC:setConfusedMessage("#me blickt dich verwirrt an.", "#me looks at you confused.");
mainNPC:setEquipment(1, 829);
mainNPC:setEquipment(3, 808);
mainNPC:setEquipment(11, 2384);
mainNPC:setEquipment(5, 1061);
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
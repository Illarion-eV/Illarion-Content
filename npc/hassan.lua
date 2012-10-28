--------------------------------------------------------------------------------
-- NPC Name: Hassan                                                   Cadomyr --
-- NPC Job:  royal fan waver                                                  --
--                                                                            --
-- NPC Race: human                      NPC Position:  110, 574, 0            --
-- NPC Sex:  male                       NPC Direction: east                   --
--                                                                            --
-- Authors:  Cromwell                                                         --
--           Estralis Seborian                                                --
--                                                                            --
-- Last parsing: October 28, 2012                        easyNPC Parser v1.21 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (0, 110, 574, 0, 2, 'Hassan', 'npc.hassan', 0, 3, 4, 218, 165, 32, 182, 128, 86);
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
require("npc.base.consequence.talkstate")
require("npc.base.talk")
module("npc.hassan", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, ">", 2));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Error! Something went wrong, please inform a developer.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game help] This is the NPC Hassan. To learn more about him, your should greet the NPC first."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dies ist der NPC Hassan. Wenn du mehr über ihn erfahren willst, grüße ihn zuerst."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 0));
talkEntry:addTrigger("Hello");
talkEntry:addTrigger("Greet");
talkEntry:addTrigger("Hail");
talkEntry:addTrigger("Good day");
talkEntry:addTrigger("Good morning");
talkEntry:addTrigger("Good evening");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New Quest] Cadomyr's Gossiper"));
talkEntry:addResponse("#me stares at you. 'Be greeted, traveler! I am much too thirsty to talk. If you bring me a glass with red wine I will gladly answer your questions.'");
talkEntry:addConsequence(npc.base.consequence.quest.quest(75, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2057, "all", "<", 1, nil));
talkEntry:addTrigger("Hello");
talkEntry:addTrigger("Greet");
talkEntry:addTrigger("Hail");
talkEntry:addTrigger("Good day");
talkEntry:addTrigger("Good morning");
talkEntry:addTrigger("Good evening");
talkEntry:addResponse("Wine! I told you to bring me wine! You want to hear my stories don't you?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addTrigger("Hello");
talkEntry:addTrigger("Greet");
talkEntry:addTrigger("Hail");
talkEntry:addTrigger("Good day");
talkEntry:addTrigger("Good morning");
talkEntry:addTrigger("Good evening");
talkEntry:addResponse("Wine! I told you to bring me wine! You want to hear my stories, so grease my throat.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New Quest] Cadomyr's Gossiper"));
talkEntry:addResponse("#me frowns: ?Mere peasant you dare greet me in such a way! Make up for you lack of consideration by giving me an offering of red wine so I may quench my thirst.'");
talkEntry:addConsequence(npc.base.consequence.quest.quest(75, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2057, "all", "<", 1, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Wine! I told you to bring me wine! You want to hear my stories, so grease my throat.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Hah! My fricome, let us talk about important things, we're important people, aren't we?");
talkEntry:addConsequence(npc.base.consequence.talkstate.talkstate("end"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 0));
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New Quest] Cadomyr's Gossiper"));
talkEntry:addResponse("I am thirsty! If you bring me a glass of red wine, I will answer your questions... and trust me I know many things!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(75, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2057, "all", "<", 1, nil));
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("Wine! I told you to bring me wine! You want to hear my stories, so grease my throat.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("Now that you've brought me wine, splendid.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 0));
talkEntry:addTrigger("Grüß");
talkEntry:addTrigger("Gruß");
talkEntry:addTrigger("Guten Tag");
talkEntry:addTrigger("Guten Abend");
talkEntry:addTrigger("Mahlzeit");
talkEntry:addTrigger("Tach");
talkEntry:addTrigger("Moin");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Der Schwätzer von Cadomyr"));
talkEntry:addResponse("#me starrt dich an. 'Seid gegrüßt, Reisender. Meine Kehle ist zu trocken zum Reden. Bringt mir ein Glas Wein, wenn ihr was erfahren wollt.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(75, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2057, "all", "<", 1, nil));
talkEntry:addTrigger("Grüß");
talkEntry:addTrigger("Gruß");
talkEntry:addTrigger("Guten Tag");
talkEntry:addTrigger("Guten Abend");
talkEntry:addTrigger("Mahlzeit");
talkEntry:addTrigger("Tach");
talkEntry:addTrigger("Moin");
talkEntry:addResponse("Wein! Ich hab gesagt, ich will Wein! Wer meine Geschichten hören will, muss erst meine Stimme ölen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addTrigger("Grüß");
talkEntry:addTrigger("Gruß");
talkEntry:addTrigger("Guten Tag");
talkEntry:addTrigger("Guten Abend");
talkEntry:addTrigger("Mahlzeit");
talkEntry:addTrigger("Tach");
talkEntry:addTrigger("Moin");
talkEntry:addResponse("Ah, hallo nochmal. Nun, da mein Durst gestillt ist, fragt was immer ihr wollt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 0));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Der Schwätzer von Cadomyr"));
talkEntry:addResponse("#me knurrt: 'Was für eine bäuerliche Art, einen Mann meines Ranges zu grüßen. Wenn ihr was wissen wollt, bringt mir erstmal ein Glas Wein, um meinen Durst zu stillen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(75, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2057, "all", "<", 1, nil));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Wein! Ich hab gesagt, ich will Wein! Wer meine Geschichten hören will, muss erst meine Stimme ölen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Hah! Mein Freund, lasst uns über wichtige Dinge Reden, denn wir sind wichtige Leute, nicht wahr?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Farewell, traveller!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Gute Reise.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Farewell, traveller!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Gute Reise.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 0));
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Der Schwätzer von Cadomyr"));
talkEntry:addResponse("Ich bin durstig! Wenn ihr mir ein Glas Wein bringt, beantworte ich eure Fragen... und ich weiß eine Menge!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(75, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2057, "all", "<", 1, nil));
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addResponse("Wein! Ich hab gesagt, ich will Wein! Wer meine Geschichten hören will, muss erst meine Stimme ölen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addResponse("Nun, da ihr mir Wein gebracht habt: Fein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("Hassan, the royal fan-waver.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ihr name");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Hassan, der königliche Fächelwedler.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New Quest] Cadomyr's Gossiper"));
talkEntry:addResponse("Bring me a glass of red wine, and I'll answer your questions! Otherwise leave me be!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(75, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2057, "all", "<", 1, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Wine! I told you to bring me wine! You want to hear my stories, so grease my throat.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Just ask me and I will share my vast knowledge about the palace with you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 0));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Der Schwätzer von Cadomyr"));
talkEntry:addResponse("Bringt mir ein Glas Wein und ich beantworte eure Fragen. Ansonsten, lasst mich in Ruhe.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(75, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2057, "all", "<", 1, nil));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Wein! Ich hab gesagt, ich will Wein! Wer meine Geschichten hören will, muss erst meine Stimme ölen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Fragt einfach, wonach auch immer und ich werde mein Wissen über den Palast mit euch teilen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 0));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("question");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New Quest] Cadomyr's Gossiper"));
talkEntry:addResponse("Bring me a glass of red wine, and I'll answer your questions! Otherwise leave me be!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(75, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2057, "all", "<", 1, nil));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("question");
talkEntry:addResponse("Wine! I told you to bring me wine! You want to hear my stories, so grease my throat.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("question");
talkEntry:addResponse("Just ask me and I will share my vast knowledge about the palace with you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 0));
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Frage");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Der Schwätzer von Cadomyr"));
talkEntry:addResponse("Bringt mir ein Glas Wein und ich beantworte eure Fragen. Ansonsten, lasst mich in Ruhe.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(75, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2057, "all", "<", 1, nil));
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Frage");
talkEntry:addResponse("Wein! Ich hab gesagt, ich will Wein! Wer meine Geschichten hören will, muss erst meine Stimme ölen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Frage");
talkEntry:addResponse("Fragt einfach, wonach auch immer und ich werde mein Wissen über den Palast mit euch teilen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2057, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] Hassan will now answer your questions. You advance in Queen Rosaline Edward's favour."));
talkEntry:addResponse("#me takes the glass with a pleased smile. 'Very good! Now, you can ask me anything you like... about the town, the Queen, the palace, our glorious Cadomyr, or even the vile neighboring factions.'");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2057, 1, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(75, "=", 2));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Cadomyr", "+", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2057, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] Hassan will now answer your questions."));
talkEntry:addResponse("#me takes the glass with a pleased smile. 'Very good! Now, you can ask me anything you like... about the town, the Queen, the palace, our glorious Cadomyr, or even the vile neighboring factions.'");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2057, 1, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(75, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2057, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Hassan wird nun deine Fragen beantworten. Dein Ansehen bei Königin Rosaline Edwards steigt."));
talkEntry:addResponse("#me nimmt das Glas und grinst erfreut. 'Sehr gut. Nun könnt ihr mich alles fragen, was ihr wollt... über die Stadt, den Palast, Cadomyr oder unsere bösen Nachbarn.'");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2057, 1, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(75, "=", 2));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Cadomyr", "+", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2057, "all", ">", 0, nil));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Hassan wird nun deine Fragen beantworten."));
talkEntry:addResponse("#me nimmt das Glas und grinst erfreut. 'Sehr gut. Nun könnt ihr mich alles fragen, was ihr wollt... über die Stadt, den Palast, Cadomyr oder unsere bösen Nachbarn.'");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2057, 1, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(75, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2057, "all", "<", 1, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Wine! I told you to bring me wine! You want to hear my stories, so grease my throat.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2057, "all", "<", 1, nil));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Wein! Ich hab gesagt, ich will Wein! Wer meine Geschichten hören will, muss erst meine Stimme ölen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addTrigger("town");
talkEntry:addResponse("Cadomyr is the most civilized and advanced community! I hear the others live in pitiful clay huts.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addTrigger("nobles");
talkEntry:addResponse("Like any proper nation, below the Queen are her nobles, just like the men are below the Gods... just as the Gods themselves have intended!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addTrigger("hono[u]+r");
talkEntry:addResponse("We value honour above all in Cadomyr. If you have no honour, then you have nothing and will be nothing.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addTrigger("like[s]");
talkEntry:addResponse("The Queen likes the shine of gold and the sparkle of precious gemstones.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addTrigger("gift");
talkEntry:addResponse("Gifts? Of course our Queen likes gifts! Expensive jewelry and shiny gemstones, especially diamonds, is what she fancies.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("baron");
talkEntry:addTrigger("hastings");
talkEntry:addResponse("Baron Hastings? He was not at all happy about Queen Rosaline finding a clause that enabled her to succeed her father on the throne, but now he has gone missing...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addTrigger("wine");
talkEntry:addResponse("#me sips from the glass, smiling 'The wine is very good, thank you...'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addTrigger("neighbor");
talkEntry:addResponse("#me grumbles. 'Oh! Galmair and Runewick! Pox on them! The ancient histories make it clear that the people of Cadomyr are the rightful lords of the land!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addTrigger("palace");
talkEntry:addResponse("If Cadomyr is the crown of the land, than the palace is certainly its most magnificent crown jewel! Sadly not all the servants in the palace are as reliable and loyal as I am.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addTrigger("Edel");
talkEntry:addResponse("Wie in jeder gute Nation bedient sich die Königin ihrer Edelleute, wie die Götter sich den Menschen bedienen. Genauso wollen es die Götter.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addTrigger("Ehre");
talkEntry:addResponse("Die Ehre steht über allem hier in Cadomyr. Wenn man keine Ehre hat, hat man gar nichts mehr. Und dann ist man auch ein Nichts.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addTrigger("Vorliebe");
talkEntry:addResponse("Die Königin hat eine Vorliebe für Gold und funkelnde Edelsteine.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addTrigger("Geschenk");
talkEntry:addResponse("Geschenke? Na klar liebt unsere Königin Geschenke. Teure Juwelen und Edelsteine, besonders Diamanten, das erfreut sie.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addTrigger("Baron");
talkEntry:addTrigger("hastings");
talkEntry:addResponse("Baron Hastings? Er war nicht sonderlich begeistert, als Königin Rosaline eine Klausel gefunden hat, die ihr ermöglichte, das Erbe ihres Vaters anzutreten. Nun ist er verschwunden...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addTrigger("Wein");
talkEntry:addResponse("#me schlürft etwas Wein: 'Danke für den Wein, der ist wirklich gut.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addTrigger("Nachbar");
talkEntry:addResponse("#me knurrt: 'Oh! Galmair und Runewick, die Pest soll über sie kommen. Die Geschichte lehrt uns, dass die Herren von Cadomyr die Herren der Ländereien sind.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addTrigger("Palast");
talkEntry:addResponse("Wenn Cadomyr die Krone des Landes ist, dann ist der Palast das funkelnste Kronjuwel. Leider sind nicht alle Palastdiener so loyal und verlässlich wie ich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("I am a servant of the Queen herself!");
talkEntry:addResponse("I am a royal fan-waver! A glorious task!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Ich ein Diener der Königin.");
talkEntry:addResponse("Ich bin der königliche Fächelwedler. Eine ehrenhafte Tätigkeit!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("I am a servant of the Queen herself!");
talkEntry:addResponse("I am a royal fan-waver! A glorious task!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Ich ein Diener der Königin.");
talkEntry:addResponse("Ich bin der königliche Fächelwedler. Eine ehrenhafte Tätigkeit!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("It is a shame what happened to the Gobaithians, but blasphemous deeds need to be punished!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Es ist traurig, was den Gobaithianern widerfahren ist. Aber blasphemische Taten müssen bestraft werden!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("And what makes you think a person as important as me would like to talk to you?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Und was bringt euch dazu zu denken, dass eine so wichtige Person wie ich mit euch sprechen möchte?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("tavern");
talkEntry:addResponse("A lousy tavern, in the glorious Kingdom of Cadomyr!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tavern");
talkEntry:addResponse("Eine einfache Taverne im prächtigen Königreich Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addTrigger("queen");
talkEntry:addResponse("We are ruled by the Queen in Cadomyr! She can trace her ancestry back a millennia or more, having the bluest of blue blood in all the land.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Rosaline");
talkEntry:addResponse("Oh, so you have heard about our Queen? Of course, not everyone thought that a woman should rule. Baron Hastings was quite vocal about that, but then he... disappeared.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Edwards");
talkEntry:addResponse("Cadomyr has been ruled by the House of Edwards since its inception. Finest stock of Albarian bluebloods! The queen's father, King Reginald, ruled the town with a firm grip.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("#me sighs. 'Cadomyr, oh Cadomyr! We are the most honourable and magnificent nation in all the land, held back only by the treachery of our cursed neighbors.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addTrigger("stadt");
talkEntry:addResponse("Cadomyr ist die zivilisierteste und fortschrittlichste Gesellschaft. Ich hörte, unsere Nachbarn wohnen in erbärmlichen Lehmhütten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addTrigger("Königin");
talkEntry:addResponse("Wir werden von der Königin von Cadomyr regiert. Sie kann ihre Ahnen tausend Jahre zurückverfolgen und hat das blauste Blut von allen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addTrigger("Rosaline");
talkEntry:addResponse("Nun, was habt ihr über unsere Königin gehört? Nicht jeder stimmt damit überein, dass eine Frau die Macht hat. Baron Hastings war ihr Redelsführer, aber dann verschwand er...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addTrigger("Edwards");
talkEntry:addResponse("Cadomyr wird seit seiner Gründung von den Edwards regiert. Feinstes albarisches Blut! Der Vater der Königin, König Reginald, regierte mit harter Hand.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("#me seufzt: 'Cadomyr, oh Cadomyr! Wir sind die ehrenhafteste und großartigste Nation in der Gegnur behindert durch unsere verräterischen Nachbarn.'");
talkEntry:addConsequence(npc.base.consequence.talkstate.talkstate("end"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("A false 'mage' rules them. Bah I say! They speak about wisdom, yet they have only lies to offer! They are nothing but cheap charlatans who try to twist the truth to justify their vile customs!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Galmair! That treacherous pit! Filled by the most despicable scum imaginable. Any decent person should steer clear of the place! Of course, I was lucky to never visit it myself.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Ein falscher Magier regiert dort. Bah, sag ich! Sie reden über Weisheit, meinen aber Lügen. Sie sind nichts als Scharlatane welche die Wahrheit verdrehen, um ihre widerlichen Sitten zu rechtfertigen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Galmair! Eine Schlangengrube! Gefüllt mit dem widerlichsten Abschaum. Jeder ehrbare Mann sollte Galmair fern bleiben. Zum Glück war ich noch nie dort.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addTrigger("archmage");
talkEntry:addResponse("If the archmage of Runewick promises you something, do the exact opposite to get the truth. He's a liar!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Wenn euch der Erzmagier Runewicks etwas versprecht, dann dreht den Sinn der Worte herum und ihr erhaltet die Wahrheit. Er ist ein Lügner!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("If the archmage of Runewick promises you something, do the exact opposite to get the truth. He's a liar!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Wenn euch der Erzmagier Runewicks etwas versprecht, dann dreht den Sinn der Worte herum und ihr erhaltet die Wahrheit. Er ist ein Lügner!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Let him try and touch my Queen and I shall smack him soundly with my fan!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Wenn ich diesen Bastard jemals dabei erwische, wie er meine Königin betatscht, zieh' ich ihm eins mit meinem Fächel über!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("albar");
talkEntry:addResponse("Did you ever realise Albar reads Rabla, spelled backwards?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addTrigger("albar");
talkEntry:addResponse("Habt ihr jemals bemerkt, dass Albar rückwärts gesprochen zu Rabla wird?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addResponse("Blasted Gynk-people! They have no honour and no enchanting queen either.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("Verdammte Gynk-Leute! Sie haben weder Ehre, noch eine Königin.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("salkama");
talkEntry:addResponse("I heard many people talking about Salkamar being similar to the realm of Albar. They must be kidding.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Manche Leute sagen, dass Salkamar so ähnlich wie das albarische Reich wäre. Selten so gelacht!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addTrigger("gods");
talkEntry:addResponse("#me nods eagerly, spilling some wine on the table. 'We are proper, honourable, and Gods-fearing people in Cadomyr, unlike our wretched neighbors!'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("#me nickt heftig, etwas Wein verschüttend: 'Wir sind gute, ehrenhaft, götterfürchtige Leute hier in Cadomyr, nicht so unsere verdorbenen Nachbarn.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Zhambra");
talkEntry:addResponse("Zhambra, Zhambra, what shall I say! I am his minion, well actually, I am the queen's royal fan waver, that's beyond being a humble minion I guess.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addTrigger("Zhambra");
talkEntry:addResponse("Zhambra, Zhambra, was soll ich sagen - ich bin sein Diener. Nun, genau genommen bin ich der königliche Fächelwedler ihrer Majestät, das macht mich zu mehr als einen Diener.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addResponse("All this talking about Malachín makes me... silent.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addResponse("All dieses Gerede über Malachín macht mich... verschwiegen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("Ushara... is that suppose to mean something?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("Ushara... wollt ihr irgendwas andeuten?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Bragon");
talkEntry:addResponse("Did I hear right? Brágon? Wine must be stronger than I thought.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addTrigger("Bragon");
talkEntry:addResponse("Habe ich richtig gehört? Brágon? Im Wein liegt die Wahrheit, mein Freund!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Eldan");
talkEntry:addResponse("Pretty sure that is a type of tree, but they don't grow around here.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addTrigger("Eldan");
talkEntry:addResponse("Ich bin mir ziemlich sicher... das ist eine Art Baum. Aber davon gibts nicht wirklich viele hier.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Tanora");
talkEntry:addResponse("Tanora, sounds familiar but I can't place where I've heard the name.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addTrigger("Tanora");
talkEntry:addResponse("Tanora, kommt mir bekannt vor, aber ich kann mich einfach nicht erinnern...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("If you're looking for answers about Zelphia go find the lizardfolks, they're always blabbing on and on about her.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("Wenn du fragen über Zelphia hast, geh und such dir ne verdammte Echse, die brabbeln nämlich die ganze Zeit über sie.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Findari");
talkEntry:addResponse("#me hiccups: 'Huh? I think you need to lay off the wine traveler; you're talking gibberish.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addTrigger("Findari");
talkEntry:addResponse("#me stößt leise auf. 'Huh? Du solltest nicht so viel Wein trinken, mein Freund! Dein Lallen ist ja kaum noch zu verstehn.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Nargun");
talkEntry:addResponse("Do yourself a favour and forget that name. Only the filth from Galmair dares to mention his name.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addTrigger("Nargun");
talkEntry:addResponse("Tuhe dir selbst einen Gefallen und vergiss seinen Namen. Nur diese Idoten in Galmair sprechen von ihm.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elara");
talkEntry:addResponse("#me yawns. 'Boring, let's talk about something else.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addTrigger("Elara");
talkEntry:addResponse("#me gähnt herzhaft. 'Wie langweilig! Lass uns über etwas anderes sprechen.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Adron");
talkEntry:addResponse("#me raises his glass of wine: 'This is all anyone needs to know about Adron.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addTrigger("Adron");
talkEntry:addResponse("#me hebt sein Weinglas: 'Darum! Darum, sollen wir Adron ehren.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("#me sighs in mild agitation. 'Ask me something relevant please.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("#me seufzt langezogen: 'Sprechen wir lieber über irgendetwas wichtiges. Ich bitte euch.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cherga");
talkEntry:addResponse("Mmh... this wine is delicious. Sorry did you say something about Cherga? If you did that is probably why I wasn't listening.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addTrigger("Cherga");
talkEntry:addResponse("Mmh... dieser Wein schmeckt vorzüglich. Entschuldigt, habt ihr über Cherga gesprochen? - Vermutlich habe ich desshalb nicht zugehört.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("#me stifles a yawn halfheartedly: 'I suggest asking the greedy swines in Galmair about Irmorom, not me.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("Ha! Fragt die Rattenfresser in Galmair nach Irmorom - nicht mich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("The goddess of Love and Pleasure? If you don't know her name than you have no business in Cadomyr!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("Die Göttin der Liebe - und des Vergnügens! *Er grinst anzüglich.*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("#me blinks: 'One word of advice, never mention that name ever again in Cadomyr!'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("#me blinzelt. 'Besser du sprichst diesen Namen hier, in Gadomyr, nicht laut aus, mein Freund.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Moshran");
talkEntry:addResponse("#me nearly drops his wine, clearly in shock: 'Do not mention the Unspoken One here traveler... You may find yourself behind bars or worse.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(75, "=", 2));
talkEntry:addTrigger("Moshran");
talkEntry:addResponse("#me lässt beinahe sein Glas fallen, sichtlich erschrocken: 'Diesen Namen spricht niemand laut aus, nimm dir besser ein Beispeil daran!'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("Do I look like the barkeeper!? Do not belittle my importance with your imprudent questioning!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Sehe ich aus wie der Schankwirt? Ich bin eine äußerst wichtige Persönlichkeit!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("It is a shame what happened to the Gobaithians. But blasphemous deeds need to be punished!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Es ist traurig, was den Gobaithianern widerfahren ist. Aber blasphemische Taten müssen bestraft werden!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("Wine is divine.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Wein ist fein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hassan");
talkEntry:addResponse("So, who sent you?");
talkEntry:addResponse("Yes, yes, I know, I should be in the palace.");
talkEntry:addResponse("No.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hassan");
talkEntry:addResponse("So, wer schickt euch?");
talkEntry:addResponse("Ja, ja, ich weiß, ich sollte im Palast sein.");
talkEntry:addResponse("Nein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("No.");
talkEntry:addResponse("Not really.");
talkEntry:addResponse("Peon!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("Nein.");
talkEntry:addResponse("Nicht wirklich.");
talkEntry:addResponse("Peon!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("Oh, I could tell you so many secrets of the queen, but I am loyal to her.");
talkEntry:addResponse("Did I mention that I am thirsty?");
talkEntry:addResponse("Wine is divine.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("Oh, ich könnte so viele Geheimnisse der Königin ausplaudern, aber ich bin ihr treu ergeben.");
talkEntry:addResponse("Erwähnte ich, dass ich Durst habe?");
talkEntry:addResponse("Wein ist fein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me schwingt ein Weinglas und riecht daran.", "#me swings a wine glass and sniffles.");
talkingNPC:addCycleText("Ich hab mal von einer Taverne gehört, die 'Happy Halfling' hieß. 'Happy Hassan', das wäre mal ein Name!", "I heard there's a tavern called 'Happy Halfling'. I'd prefer Happy Hassan personally.");
talkingNPC:addCycleText("Oh ja, ich bin wirklich wichtig. Ohne meine Dienste würde die Königin schwitzen! Und das wäre nicht gut...", "Oh yes, I am indeed an important man. Without my service, the queen would sweat, and we couldn't have that could we?");
talkingNPC:addCycleText("#me knallt seine Faust auf den Tresen: 'Bedienung!'", "#me bangs his fist on the counter: 'I demand service!'");
talkingNPC:addCycleText("#me tippt sich mit seinem Zeigefinger auf die Brust: 'Ich kenne die Königin! Ich bin eine sehr wichtige Person.'", "#me pokes his own chest with his index finger 'I know the Queen! I am a very important person!'");
talkingNPC:addCycleText("Wie, ich soll für meine Getränke zahlen? Ihr solltet mich dafür bezahlen, dass ich hier trinke. Wißt ihr nicht, wer ich bin?", "What do you mean I have to pay for my drinks? You should be paying 'me' to drink here! Do you have any idea who I am?");
talkingNPC:addCycleText("#me ist ein Mann in feiner, aber weingetränkten Kleidung. Sein glattgeschorener Kopf glänzt durch ein wohlriechendes Öl.", "#me is a man in expensive, albeit wine-stained clothes. His shaven head gleams with fine-smelling oil.");
talkingNPC:addCycleText("Ich arbeite im königlichen Palast. Nichts geschieht dort, ohne das ich davon erfahre.", "I work in the Royal Palace. Nothing happens here without my knowledge.");
talkingNPC:addCycleText("#me knurrt beim Anblick seines leeren Glases: 'Warum erfreu ich euch Bauern mit meiner Anwesenheit? Ich, der Liebling der Königin! Sie hat mich gestern sogar angesehen.'", "#me frowns at the empty glass of wine 'Why do I bless you peasants with my presence? I, who am the Queen's favourite! She even looked at me two days ago!'");
talkingNPC:addCycleText("Ich fächere der Königin Luft, damit sie einen ruhigen Kopf bewahren kann. Das nenn' ich eine wichtige Tätigkeit.", "I wave my fan over the Queen, keeping her blue blood cool in this dessert heat. Now 'that' is an important duty!");
talkingNPC:addCycleText("Wein ist fein.", "Wine is divine.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(1);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Dies ist der königliche Fechelwedler Hassan.", "This is the royal fan waver Hassan.");
mainNPC:setUseMessage("Fass mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut dich verwirrt an.", "#me looks at you confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 807);
mainNPC:setEquipment(11, 2419);
mainNPC:setEquipment(5, 0);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 0);
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
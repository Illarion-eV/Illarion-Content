--------------------------------------------------------------------------------
-- NPC Name: Borgate Northoff                                            None --
-- NPC Job:  Barkeeper                                                        --
--                                                                            --
-- NPC Race: dwarf                      NPC Position:  710, 313, 0            --
-- NPC Sex:  male                       NPC Direction: west                   --
--                                                                            --
-- Authors:  Rincewind                                                        --
--           & Someone                                                        --
--                                                       easyNPC Parser v1.21 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (1, 710, 313, 0, 6, 'Borgate Northoff', 'npc.borgate_northoff', 0, 1, 1, 126, 75, 30, 217, 154, 123);
---]]

require("npc.base.basic")
require("npc.base.condition.chance")
require("npc.base.condition.language")
require("npc.base.consequence.inform")
require("npc.base.consequence.trade")
require("npc.base.talk")
require("npc.base.trade")
module("npc.borgate_northoff", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
local tradingNPC = npc.base.trade.tradeNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("verkauf");
talkEntry:addTrigger("handel");
talkEntry:addResponse("Lass uns handeln!");
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("sell");
talkEntry:addTrigger("trade");
talkEntry:addResponse("Let's trade!");
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Borgate Northoff the innkeeper of The Hemp Necktie Inn . Keywords: Gods, Bragon, Adron, trade"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Borgate Northoff der Wirt vom Gasthof zur Hanfschlinge. Schlüsselwörter: Götter, Bragon, Adron, Handel"));
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
talkEntry:addResponse("Aahr! Be greeted in 'The Hemp Necktie Inn'. What do you want to drink?");
talkEntry:addResponse("Hello. What do I have to make you?");
talkEntry:addResponse("G'day, wanna beer?");
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
talkEntry:addResponse("Willkommen im Gasthof zur Hanfschlinge, willst du etwas zu trinken?");
talkEntry:addResponse("Guten Tag. Was soll ich Dir machen?");
talkEntry:addResponse("Tach, was darf's sein?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Aahr! Be greeted in 'The Hemp Necktie Inn'. What do you want to drink?");
talkEntry:addResponse("Hello. What do I have to make you?");
talkEntry:addResponse("G'day, wanna beer?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Willkommen im Gasthof zur Hanfschlinge, willst du etwas zu trinken?");
talkEntry:addResponse("Guten Tag. Was soll ich Dir machen?");
talkEntry:addResponse("Tach, was darf's sein?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Have a nice day.");
talkEntry:addResponse("Aye. Come back whenever you are thirsty.");
talkEntry:addResponse("Good day!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Schönen Tag noch.");
talkEntry:addResponse("Bis bald.");
talkEntry:addResponse("Aye. Komm wieder, wann immer du durstig bist.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Have a nice day.");
talkEntry:addResponse("Aye. Come back whenever you are thirsty.");
talkEntry:addResponse("Good day!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Schönen Tag noch.");
talkEntry:addResponse("Bis bald.");
talkEntry:addResponse("Aye. Komm wieder, wann immer du durstig bist.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("Good - 'nd you?");
talkEntry:addResponse("It's allright. Like allways.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befinden");
talkEntry:addResponse("Gut - 'nd Euch?");
talkEntry:addResponse("Alles gut - wie immer.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("Great. I am Borgate Northoff, the barkeeper. Do you want something to drink?");
talkEntry:addResponse("I'm Borgate Northoff. Need a drink?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ihr name");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Ich bin Borgate Northoff und das ist mein Tresen. Ich schenke Bier aus. Willst du eines?");
talkEntry:addResponse("Ich bin Borgate Northoff. Willst du was trinken?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Nope, I didn't got a job for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Nee, ich habe keine Arbeit für dich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("Nope, I didn't got a job for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Nee, ich habe keine Arbeit für dich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("I'm bartender. Tendering beer. - Mostly");
talkEntry:addResponse("What do you think I have to do here? What a stupid question. Aaarh! Drink or eat something or leave!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Ich bin Schankwirt. Und ausschenken tue ich Bier. - Meistens...");
talkEntry:addResponse("Was denkste was ich hier mache? So ne dumme Frage. Aaarh! Bestell was zu trinken oder verschwinde!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("I'm bartender. Tendering beer. - Mostly");
talkEntry:addResponse("What do you think I have to do here? What a stupid question. Aaarh! Drink or eat something or leave!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Ich bin Schankwirt. Und ausschenken tue ich Bier. - Meistens...");
talkEntry:addResponse("Was denkste was ich hier mache? So ne dumme Frage. Aaarh! Bestell was zu trinken oder verschwinde!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("A dwarf shouldn't live in the past. - I allways looked forward. Also back in times with the Fluffy Sheep Tavern.");
talkEntry:addResponse("Gobaith was nice. But now, since I'm here I honestly don't know why I didn't come sooner.");
talkEntry:addResponse("Back on Gobaith everyone was used to say: 'Whatever happens, Borgate will do his own thing.' - and that's exactly what happened when everybody left the isle.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Wenn du mich fragst finde ich, dass ein Zwerg nicht in der Vergangenheit leben sollte. - Ich jedenfalls habe immer nach vorn geblickt. Auch schon damals als ich noch im Fluffy Sheep gearbeitet habe.");
talkEntry:addResponse("Auf Gobaith war's schön. Aber jetzt wo ich hier bin, weiß ich nicht warum ich so lange dort geblieben bin.");
talkEntry:addResponse("Auf Gobaith hieß es immer - 'Egal was passiert, Borgate macht sein Ding.' - und das habe ich dann auch gemacht als alle von der Insel weg sind. Aye.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("I am");
talkEntry:addTrigger("my name");
talkEntry:addResponse("Aha..?");
talkEntry:addResponse("Arr!");
talkEntry:addResponse("Aha...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ich bin");
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Aha..?");
talkEntry:addResponse("Arr!");
talkEntry:addResponse("Aha...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Fluffy");
talkEntry:addTrigger("Sheep");
talkEntry:addResponse("Fluffy Sheep was the name of an Inn. I worked there long time ago for the king of Silverbrand.");
talkEntry:addResponse("The Fluffy Sheep Tavern was named after a sheep named Fluffy. And one day, they just ate it.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Sil[vb]erbran[dt]");
talkEntry:addResponse("Silverbrand got many kings, but I think King Tiladin is the most important");
talkEntry:addResponse("Ailverbrand - The dwarven town under the throne of Irmorom, in the middle of the coppermountains. Let us hold up the keepsake.");
talkEntry:addResponse("Silverbrand took each dwarf as citizen those days. Even at night the sound of smithing hammers was hearable they say.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Gowan");
talkEntry:addTrigger("Sam");
talkEntry:addTrigger("brute");
talkEntry:addTrigger("Booze");
talkEntry:addTrigger("hook");
talkEntry:addResponse("When I came here, they didn't ask me a single question. So I did.");
talkEntry:addResponse("Actually I know everything... but I don't tell.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("half-hung");
talkEntry:addTrigger("bryan");
talkEntry:addResponse("Bryan is the owner of the Hemp Necktie Inn. So it's his law we live with. You do better ask him about the law, eh?");
talkEntry:addResponse("Actually I know everything... but I don't tell.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Fluffy");
talkEntry:addTrigger("Sheep");
talkEntry:addTrigger("schaf");
talkEntry:addTrigger("flausch");
talkEntry:addTrigger("flauschige");
talkEntry:addResponse("Das Fluffy Sheep war eine Taverne. Dort habe ich früher, für den König Silberbrands gearbeitet. Aber das ist schon lange her...");
talkEntry:addResponse("Als ich noch ein Zwerg im besten Alter war, arbeitete ich in der Fluffy Sheep Taverne. Aye?");
talkEntry:addResponse("Die Fluffy Sheep Taverne hat man nach einem Schaf benannt das sie Fluffy nannten. Und irgendwann - dann haben sie's einfach gegessen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sil[vb]erbran[dt]");
talkEntry:addResponse("In Silberbrand gabs eine Menge Könige, aber ich will meinen, König Tialdin von Silberbrand ist der Bedeutendste.");
talkEntry:addResponse("Silberbrand - Die Zwergenstadt unter dem Thron Irmoroms, im Herzen des Kupfergebierges. Mögen wir ihr Andenken in Ehren halten.");
talkEntry:addResponse("Silberbrand nahm damals jeden Zwerg auf. Und sogar des Nachts soll der Hammerklang der Schmiede hörbar gewesen sein. Eine wirklich mächtige Stadt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gowan");
talkEntry:addTrigger("Sam");
talkEntry:addTrigger("brute");
talkEntry:addTrigger("Booze");
talkEntry:addTrigger("hook");
talkEntry:addResponse("Als ich hier her kam, stellte keiner Fragen, und ich fragte auch nichts. Der Eine oder Andere spricht trozdem manchmal über sich. Aber es ist Half-hung Bryans Gesetz. 'Es werden keine Fragen gestellt.'");
talkEntry:addResponse("Eigentlich weiß ich alles, aber ich erzähl nichts davon...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("half-hung");
talkEntry:addTrigger("bryan");
talkEntry:addResponse("Bryan ist der Besitzer vom Gasthof zur Hanfschlinge. Und hier zählt nur sein Gesetz. Am Besten fragt ihr ihn selbst dannach.");
talkEntry:addResponse("Eigentlich weiß ich alles, aber ich erzähl nichts davon...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addResponse("Old Borgate knows things you couldn't sleep anymore. But I can hold my tougne. What's about yours?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Der alte Borgate weis Sachen, da würdest du kein Auge mehr zu tun. Aber ich kann meinen Mund halten. Kannst du das auch? Ich denke nicht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Old Borgate knows things you couldn't sleep anymore. But I can hold my tougne. What's about yours?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Der alte Borgate weis Sachen, da würdest du kein Auge mehr zu tun. Aber ich kann meinen Mund halten. Kannst du das auch? Ich denke nicht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Cadomyr, Runewick... even Galmair! They aggrandise themself - At the Hemp Necktie Inn they are equal and their law is declared as nonsene.");
talkEntry:addResponse("Cadomyr, Runewick... even Galmair! - Here in the middle of wilderness a dwarf stays as dwarf and everyone fights for his own good.");
talkEntry:addResponse("Cadomyr, Runewick... even Galmair! - Those factions interrest an old dwarf like Borgate just peripheral.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Ob Cadomyr, Galmair oder auch Runewick... die nehmen sich alle viel zu wichtig. Hier im Gasthof zu Hanfschlinge behandeln wir alle gleich.");
talkEntry:addResponse("Ob Cadomyr, Galmair oder auch Runewick... hier in der Mitte der Wildniss ist ein Zwerg einfach nur ein Zwerg. Jeder ist sich selbst der Nächste.");
talkEntry:addResponse("Ob Cadomyr, Galmair oder auch Runewick... die bekümmern einen alten Zwerg wie ich einer bin nur noch peripher.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Old Borgate knows things you couldn't sleep anymore. But I can hold my tougne. What's about yours?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Der alte Borgate weis Sachen, da würdest du kein Auge mehr zu tun. Aber ich kann meinen Mund halten. Kannst du das auch? Ich denke nicht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Cadomyr, Runewick... even Galmair! They aggrandise themself - At the Hemp Necktie Inn they are equal and their law is declared as nonsene.");
talkEntry:addResponse("Cadomyr, Runewick... even Galmair! - Here in the middle of wilderness a dwarf stays as dwarf and everyone fights for his own good.");
talkEntry:addResponse("Cadomyr, Runewick... even Galmair! - Those factions interrest an old dwarf like Borgate just peripheral.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Ob Cadomyr, Galmair oder auch Runewick... die nehmen sich alle viel zu wichtig. Hier im Gasthof zu Hanfschlinge behandeln wir alle gleich.");
talkEntry:addResponse("Ob Cadomyr, Galmair oder auch Runewick... hier in der Mitte der Wildniss ist ein Zwerg einfach nur ein Zwerg. Jeder ist sich selbst der Nächste.");
talkEntry:addResponse("Ob Cadomyr, Galmair oder auch Runewick... die bekümmern einen alten Zwerg wie ich einer bin nur noch peripher.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Queen");
talkEntry:addResponse("Old Borgate knows things you couldn't sleep anymore. But I can hold my tougne. What's about yours?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königin");
talkEntry:addResponse("Der alte Borgate weis Sachen, da würdest du kein Auge mehr zu tun. Aber ich kann meinen Mund halten. Kannst du das auch? Ich denke nicht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Old Borgate knows things you couldn't sleep anymore. But I can hold my tougne. What's about yours?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Der alte Borgate weis Sachen, da würdest du kein Auge mehr zu tun. Aber ich kann meinen Mund halten. Kannst du das auch? Ich denke nicht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Cadomyr, Runewick... even Galmair! They aggrandise themself - At the Hemp Necktie Inn they are equal and their law is declared as nonsene.");
talkEntry:addResponse("Cadomyr, Runewick... even Galmair! - Here in the middle of wilderness a dwarf stays as dwarf and everyone fights for his own good.");
talkEntry:addResponse("Cadomyr, Runewick... even Galmair! - Those factions interrest an old dwarf like Borgate just peripheral.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Ob Cadomyr, Galmair oder auch Runewick... die nehmen sich alle viel zu wichtig. Hier im Gasthof zu Hanfschlinge behandeln wir alle gleich.");
talkEntry:addResponse("Ob Cadomyr, Galmair oder auch Runewick... hier in der Mitte der Wildniss ist ein Zwerg einfach nur ein Zwerg. Jeder ist sich selbst der Nächste.");
talkEntry:addResponse("Ob Cadomyr, Galmair oder auch Runewick... die bekümmern einen alten Zwerg wie ich einer bin nur noch peripher.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("albar");
talkEntry:addResponse("During my life people told me many tales. Most of them by drunk who mostly speak the truth. Are you really interrested in the opinion of an old washy dwarf?");
talkEntry:addResponse("When people start talking about their homeland or start talking anyway, I tend to nod slowly and say 'Aha..?'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("Im Laufe meines Lebens wurde mir viel Erzählt. Das Meißte, von Betrunkenen und die sagen eher die Wahrheit. Aber wollt ihr wirklich die verwaschene Meinung eines alten Zwerges Hören?");
talkEntry:addResponse("Wenn mir die Leute anfangen über ihre Heimat, oder sonst etwas zu erzählen nicke ich eigentlich immer nur uns sage 'Aha..?'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addResponse("During my life people told me many tales. Most of them by drunk who mostly speak the truth. Are you really interrested in the opinion of an old washy dwarf?");
talkEntry:addResponse("When people start talking about their homeland or start talking anyway, I tend to nod slowly and say 'Aha..?'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("Im Laufe meines Lebens wurde mir viel Erzählt. Das Meißte, von Betrunkenen und die sagen eher die Wahrheit. Aber wollt ihr wirklich die verwaschene Meinung eines alten Zwerges Hören?");
talkEntry:addResponse("Wenn mir die Leute anfangen über ihre Heimat, oder sonst etwas zu erzählen nicke ich eigentlich immer nur uns sage 'Aha..?'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("salkama");
talkEntry:addResponse("During my life people told me many tales. Most of them by drunk who mostly speak the truth. Are you really interrested in the opinion of an old washy dwarf?");
talkEntry:addResponse("When people start talking about their homeland or start talking anyway, I tend to nod slowly and say 'Aha..?'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Im Laufe meines Lebens wurde mir viel Erzählt. Das Meißte, von Betrunkenen und die sagen eher die Wahrheit. Aber wollt ihr wirklich die verwaschene Meinung eines alten Zwerges Hören?");
talkEntry:addResponse("Wenn mir die Leute anfangen über ihre Heimat, oder sonst etwas zu erzählen nicke ich eigentlich immer nur uns sage 'Aha..?'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("I'm a honourful dwarf and Irmorom created my kin ages ago. His will leads and protects my folk since begin of time.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Ich bin ein aufrichtiger Zwerg und Irmorom hat einst vor vielen Jahren meine Sippe erschaffen. Sein Wille leitet und schützt mein Volk von Anbeginn her.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Adron");
talkEntry:addResponse("A bartender is able to tell you many things about Adron, for sure! He's the god of wine and festival. Also halfings say, he got a big wine jug wich never gets emmpty.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Adron");
talkEntry:addResponse("Als Schankwirt, kann ich dir natürlich viel über Adron erzählen. Er ist der Gott des Weines und der Feste. Und man erzählt sich, insbesondere bei den Halblingen, er trägt immerzu einen großen Weinkrug bei sich, der niemals leer wird.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addResponse("Some mudheads under the dwarven folk praise Bragon. He's god of fire, strong and prudent and handsome... But all in all dwarves should praise Irmorom - he's our father.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addResponse("Ein paar weniger Querköpfe unter den Zwergen huldigen auch Bragon. Er ist der Gott des Feuers, ist sehr weise, stark, gebieterisch, edel, und stattlich. Aber im Grunde Sollten Zwerge zu Irmorom beten, denn er ist unser Schöpfer.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("IRMOROM! Father of the dwarven folk! My kin will be bound to you for ever, wich fills my heart with gladness and pride! for sure he is the most gorgeous under the gods and similar to us dwarves in so many views!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("IRMOROM! Der vater des Zwergenvolkes. Auf ewig wird mein Volk an ihn gebunden sein, und das erfüllt unser Herz mit Freude und Stolz. Er ist wahrlich der prächtigste und uns Zwergen in so vielfältiger Weise ähnlich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addResponse("Malachín is god of the knights and warriors. Better ask there for better informations.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addResponse("Der Gott der Ritter und Kriegerkaste. Fragt die nach ihm.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("I don't know much about Ronagan, only that I'll become insane when people mug my mugs!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("Über Ronagan weiß ich nicht viel, nur das ich Fuchs-wild werde wenn die Leute die Bierkrüge nicht zurückbringen.");
talkEntry:addResponse("Hm-h... Fragt doch Gowan. Hat ja wohl nicht umsonst einen Haken als Hand.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("It's a damned bar, what do you think I sell? But here, look at the list: drinks and more.");
talkEntry:addResponse("Drinks and more. What do you thought? It's a Bar. And now, tell me: What do you want?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Ich verkaufe alles, was das Herz begehrt, aber eigentlich nur Bier. Willst du Eines?");
talkEntry:addResponse("Das hier ist 'ne Kneipe, was glaubst du, was wir hier verkaufen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("Arr, Where shall I begin? I could tell you lots of what is spoken in this tavern, but if I would do that, no one would come back. No, I am not a traitor to my guests. Sorry!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Ich höre viel und weiss eigentlich fast alles. Ich erzähl' dir aber nichts davon, das geht dich nunmal nichts an.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Borgate");
talkEntry:addTrigger("bar");
talkEntry:addTrigger("Northoff");
talkEntry:addResponse("Indeed, I'm the bartender here. What's your order?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Borgate");
talkEntry:addTrigger("wirt");
talkEntry:addTrigger("Northoff");
talkEntry:addResponse("Genau, ich bin hier der Wirt. Was willst Du trinken?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("Arr-h!");
talkEntry:addResponse("That's the way it's supposed to be!");
talkEntry:addResponse("Well then!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("Arr-h!");
talkEntry:addResponse("So soll's sein!");
talkEntry:addResponse("Aye, das hab ich gern.");
talkEntry:addResponse("Wenn's unbedingt notwenig ist.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("Arr-h?");
talkEntry:addResponse("Nevermind.");
talkEntry:addResponse("Anything else?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("Arr-h?");
talkEntry:addResponse("Dann eben nicht.");
talkEntry:addResponse("Was wollt ihr dann von mir?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(65.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("#me nods slowly. 'Aha..?'");
talkEntry:addResponse("#me slowy shakes his head. 'Hmpf.'");
talkEntry:addResponse("#me starts to comb his long beard with his figners. 'Is that true?'");
talkEntry:addResponse("#me wrinkles his big chubby nose. 'Ye-h. I just came to same conclusion.'");
talkEntry:addResponse("#me takes a sip out of his beer mug. '... incrediple!'");
talkEntry:addResponse("#me rises a brow. 'Honestly?'");
talkEntry:addResponse("Aye, heared something similar once before. You wouldn't belive it.");
talkEntry:addResponse("Honsetly? I'm amazed!");
talkEntry:addResponse("#me crosses his hands behind the neck. 'Hm-hm.'");
talkEntry:addResponse("If it's Irmoroms will...");
talkEntry:addResponse("#me picks the hair of his beard with two fingers. 'That sounds kind of curious. Don't think so?'");
talkEntry:addResponse("#me scratches his chin. 'Interesting, isn't it?'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(65.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("#me nickt langsam. 'Aha..?'");
talkEntry:addResponse("#me legt den Kopf schief. 'Hmpf.'");
talkEntry:addResponse("#me greift sich mit den Fingern in den langen Bart und zieht sie hindurch. 'Ist das so?'");
talkEntry:addResponse("#me rümpft seine große felischige Nase. 'So etwas dachte ich mir schon.'");
talkEntry:addResponse("#me nimmt einen Schluck von seinem Bierkrug. '... unglaublich!'");
talkEntry:addResponse("Aye, so etwas ähnliches hab ich schonmal gehört. Das würde dich wundern.");
talkEntry:addResponse("Tatsächlich!? Ich bin erstaunt.");
talkEntry:addResponse("#me verschränkt die Hände im Nacken. 'Hm-hm.'");
talkEntry:addResponse("Sodar es Irmoroms Wille ist...");
talkEntry:addResponse("#me zupft mit zwei Fingern an seinem Bart. 'Das ist seltsam. Findest du das nicht auch?'");
talkEntry:addResponse("#me hebt eine Augenbraue. 'Wirklich?'");
talkEntry:addResponse("#me kratzt sich nachdenklich am Kinn. 'Was Ihr nicht sagt..?");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("Arrr...", "Arrr...");
talkingNPC:addCycleText("Arrr!", "Arrr!");
talkingNPC:addCycleText("Arrr...?", "Arrr...?");
talkingNPC:addCycleText("#me trocknet einen Bierkrug ab.", "#me cleans a beer mug.");
talkingNPC:addCycleText("#me sieht sich gelangweilt um.", "#me looks around bored.");
talkingNPC:addCycleText("#me spielt mit einer Kupfermünze.", "#me plays with a copper coin.");
talkingNPC:addCycleText("#me wischt über die Theke.", "#me wipes the counter.");
talkingNPC:addCycleText("#me trinkt ein Bier", "#me gulps down a beer.");
talkingNPC:addCycleText("#me wischt seine Hände in die Hosen.", "#me cleans his hands by rubbing them against his trousers.");
talkingNPC:addCycleText("#me brummt eine langsame Meldoie.", "#me grumbles a slow melody.");
tradingNPC:addItem(npc.base.trade.tradeNPCItem(164,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(191,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(224,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(353,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(453,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(454,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(517,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(518,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(783,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(784,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(785,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(786,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(787,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(788,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(789,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(790,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(791,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1315,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1316,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1317,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1318,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1319,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1840,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1841,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1842,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1843,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1844,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1853,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1854,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1855,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1856,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1857,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1858,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1859,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1860,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1861,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1908,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1909,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2055,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2056,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2057,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2058,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2059,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2185,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2186,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2187,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2188,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2189,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2276,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2278,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2456,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2496,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2497,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2498,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2499,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2500,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2501,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2922,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2923,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2935,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2952,"sell"));
tradingNPC:addNotEnoughMoneyMsg("Du hast nicht genug Geld!", "You don't have enough money!");
tradingNPC:addDialogClosedMsg("Danke, komm doch bald wieder.", "Thanks, come back soon.");
tradingNPC:addDialogClosedNoTradeMsg("Nichts gefunden was dir gefällt?", "Don't you like my wares?");
mainNPC:addLanguage(0);
mainNPC:addLanguage(2);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Ein breit lächelnder Zwergenwirt, dessen prächtiger Bart und Kleidung von Bierflecken übersät ist.", "A broadly smiling dwarfen barkeeper whose proud beard and clothes are covered with beer stains.");
mainNPC:setUseMessage("Fass mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut dich verwirrt an.", "#me looks at you confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 101);
mainNPC:setEquipment(11, 0);
mainNPC:setEquipment(5, 0);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 0);
mainNPC:setEquipment(9, 2113);
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
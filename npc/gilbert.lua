--------------------------------------------------------------------------------
-- NPC Name: Gilbert                                                     None --
-- NPC Job:  none                                                             --
--                                                                            --
-- NPC Race: human                      NPC Position:  120, 642, 0            --
-- NPC Sex:  male                       NPC Direction: southeast              --
--                                                                            --
-- Author:   Rincewind                                                          --
--                                                                            --
-- Last parsing: October 10, 2010                        easyNPC Parser v1.02 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (0, 120, 642, 0, 3, 'Gilbert', 'npc.gilbert', 0, 0, 0, 255, 255, 255, 255, 255, 255);
---]]

require("npc.base.basic")
require("npc.base.condition.item")
require("npc.base.condition.language")
require("npc.base.condition.quest")
require("npc.base.condition.race")
require("npc.base.consequence.deleteitem")
require("npc.base.consequence.inform")
require("npc.base.consequence.item")
require("npc.base.consequence.quest")
require("npc.base.consequence.state")
require("npc.base.talk")
module("npc.gilbert", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("geschichte");
talkEntry:addTrigger("trauer");
talkEntry:addTrigger("traurig");
talkEntry:addTrigger("melancholisch");
talkEntry:addCondition(npc.base.condition.quest.quest(303, "<", 1));
talkEntry:addResponse("Als meine Mutter starb vermachte sie mir ein wertvolles Kollier. Ich hab das nie jemanden erzählt, doch vor kurzem hat meine schreckliche Halbschwester herausgefunden das ich es habe. Und jetzt fürchte ich sie will es mir wegnehmen. Was soll ich tun? Ich trage es die ganze Zeit in meiner Tasche, nur da ist es sicher.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("story");
talkEntry:addTrigger("tale");
talkEntry:addTrigger("dol[e,or,our]");
talkEntry:addTrigger("dumpish");
talkEntry:addTrigger("melanch");
talkEntry:addCondition(npc.base.condition.quest.quest(303, "<", 1));
talkEntry:addResponse("When my mother passed away, she bequeathed a precious necklet to me. I never told anyone about it, but a few days ago, my dreadful half-sister detected that I hold the necklace. Now I am worried that she'll try to take it from me. What should I do ? I have it in my bag at all times. It is the only safe place I think.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("necklet");
talkEntry:addTrigger("necklace");
talkEntry:addCondition(npc.base.condition.quest.quest(303, "<", 1));
talkEntry:addResponse("I always have an eye on the necklace. You can?t trust my revolting half-sister. I think she's trying to sell our only heirloom!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("kollier");
talkEntry:addTrigger("amulett");
talkEntry:addCondition(npc.base.condition.quest.quest(303, "<", 1));
talkEntry:addResponse("Ich darf das Kollier nie aus den Augen lassen! Meiner hinterhältigen Halbschwester ist nicht zu trauen. Ich glaube sie möchte unser Erbstück einfach verkaufen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("schwester");
talkEntry:addCondition(npc.base.condition.quest.quest(303, "<", 1));
talkEntry:addResponse("Sie ist meine Halbschwester. Wir haben den selben Vater und haben uns nie richig gemocht. Ständig ist sie unaufrichtig und belügt die Leute. Ich möchte gar nicht wissen wie sie ihr Geld verdient.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("sister");
talkEntry:addCondition(npc.base.condition.quest.quest(303, "<", 1));
talkEntry:addResponse("She is my half-sister. We have the same father, but never really liked each other. Everything she does is devious. I really don?t want to know how she earns her money.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("#me (.+) necklet");
talkEntry:addTrigger("#me (.+) necklace");
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("You pick Gilbert's necklace out of his bag. You don't have a bad conscience?"));
talkEntry:addResponse("#me is not aware that the necklace is nicked from his bag.");
talkEntry:addConsequence(npc.base.consequence.item.item(79, 1, 333, 0));
talkEntry:addConsequence(npc.base.consequence.quest.queststatus(303, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("#me (.+) kollier");
talkEntry:addTrigger("#me (.+) amulett");
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Du stiehlst das Kollier aus Gilberts Tasche. Hast du kein schlechtes Gewissen?"));
talkEntry:addResponse("#me bemerkt nicht wie ihm das Kollie aus der Tasche gestohlen wird.");
talkEntry:addConsequence(npc.base.consequence.item.item(79, 1, 333, 0));
talkEntry:addConsequence(npc.base.consequence.quest.queststatus(303, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("geschichte");
talkEntry:addTrigger("trauer");
talkEntry:addTrigger("traurig");
talkEntry:addTrigger("melancholisch");
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 3));
talkEntry:addResponse("Ich hab das Erbstück meiner Mutter verloren! Ein sehr wervolles Kollier, es muss mir auf den Boden gafallen sein. Hilfst du mir suchen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("story");
talkEntry:addTrigger("tale");
talkEntry:addTrigger("dol[e,or,our]");
talkEntry:addTrigger("dumpish");
talkEntry:addTrigger("melanch");
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 3));
talkEntry:addResponse("I lost the heirloom of my mother! It is a very, very precious necklace! I must have dropped it on the ground. Could you help me find it?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("necklet");
talkEntry:addTrigger("necklace");
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 3));
talkEntry:addResponse("What a mess! Especially now, while my horrible half-sister's trying to take it from me. I hope I find it before she arrives.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("kollier");
talkEntry:addTrigger("amulett");
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 3));
talkEntry:addResponse("Was für eine Schande! Gerade jetzt, wo meine grauenvolle Halbschwester versucht es mir wegzunehmen. Hoffentlich finde ich das Kollier bevor sie hier her kommt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("schwester");
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 3));
talkEntry:addResponse("Meiner hinterhältigen Halbschwester ist nicht zu trauen. Ich glaube sie möchte unser Erbstück einfach verkaufen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("sister");
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 3));
talkEntry:addResponse("You can?t trust my revolting half-sister. I think she's trying to sell our only heirloom!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("#me (.+) necklet");
talkEntry:addTrigger("#me (.+) necklace");
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(222, "belt", "=>", 1));
talkEntry:addConsequence(npc.base.consequence.inform.inform("You place the faked necklace in Gilbert's bag. You don't have a bad conscience?"));
talkEntry:addResponse("#me does not notice that a necklace is placed in his bag.");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(222, 1));
talkEntry:addConsequence(npc.base.consequence.quest.queststatus(303, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("#me (.+) kollier");
talkEntry:addTrigger("#me (.+) amulett");
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(222, "belt", "=>", 1));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Du schmuggelst das falsche Kollier in Gilberts Tasche. Hast du kein schlechtes Gewissen?"));
talkEntry:addResponse("#me bemerkt nicht, dass ihm ein Kollier in die Tasche gesteckt wird.");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(222, 1));
talkEntry:addConsequence(npc.base.consequence.quest.queststatus(303, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("necklet");
talkEntry:addTrigger("necklace");
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(79, "all", "=", 1));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Put the necklace into your belt, if you are willing to place it into Gilbert's bag."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("kollier");
talkEntry:addTrigger("amulett");
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(79, "all", "=", 1));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Lege das Amuelett in deinen Gürtel, um es Gilbert unterzuscheieben."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("geschichte");
talkEntry:addTrigger("trauer");
talkEntry:addTrigger("traurig");
talkEntry:addTrigger("melancholisch");
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 6));
talkEntry:addResponse("Das gesuchte Kollier war die ganze Zeit in meiner Tasche! Ich hab es nur nicht gesehen. Aber jetzt wird wohl bald meine Halbschwester Rose hier auftauchen und es mir wegnehmen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("story");
talkEntry:addTrigger("tale");
talkEntry:addTrigger("dol[e,or,our]");
talkEntry:addTrigger("dumpish");
talkEntry:addTrigger("melanch");
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 6));
talkEntry:addResponse("This priceless necklace was in my bag all along! I just didn't notice it. But now my half-sister Rose will visit me and steal it.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("necklet");
talkEntry:addTrigger("necklace");
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 6));
talkEntry:addResponse("I'm so happy that I found the necklace but on the other side I'm sad, becouse now Rose have another chance to get it.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("kollier");
talkEntry:addTrigger("amulett");
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 6));
talkEntry:addResponse("Ich bin sehr glücklich dass ich das Kollier gefunden habe. Auf der anderen Seite hat nun Rose abermals die Möglichkeit es zu bekommen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("schwester");
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 6));
talkEntry:addResponse("Rose ist meine Halbschwester. Ständig ist sie unaufrichtig und belügt die Leute. Ich glaube sie möchte unser Erbstück einfach verkaufen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("sister");
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 6));
talkEntry:addResponse("Rose is my half-sister. Everything she does is devious. I think she's trying to sell our only heirloom!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rose");
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 6));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Rose ist meine Halbschwester. Ständig ist sie unaufrichtig und belügt die Leute. Ich glaube sie möchte unser Erbstück einfach verkaufen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rose");
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 6));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Rose is my half-sister. Everything she does is devious. I think she's trying to sell our only heirloom!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hallo");
talkEntry:addTrigger("gr[üue]+[sß]+e");
talkEntry:addTrigger("guten tag");
talkEntry:addTrigger("Gruß");
talkEntry:addTrigger("Seid gegrüßt");
talkEntry:addTrigger("Guten Abend");
talkEntry:addTrigger("Tach");
talkEntry:addTrigger("Moin");
talkEntry:addResponse("Hallo.");
talkEntry:addResponse("Grüße.");
talkEntry:addResponse("Guten Tag.");
talkEntry:addResponse("Gruß.");
talkEntry:addResponse("Seid gegrüßt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("good day");
talkEntry:addTrigger("greetings");
talkEntry:addTrigger("greets");
talkEntry:addTrigger("hail");
talkEntry:addTrigger("hello");
talkEntry:addTrigger("Be greeted");
talkEntry:addTrigger("Good morning");
talkEntry:addResponse("Good day.");
talkEntry:addResponse("Greetings.");
talkEntry:addResponse("Greets.");
talkEntry:addResponse("Hello.");
talkEntry:addResponse("Be greeted.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greebas");
talkEntry:addTrigger("Greebs");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Good day.");
talkEntry:addResponse("Greetings.");
talkEntry:addResponse("Greets.");
talkEntry:addResponse("Hello.");
talkEntry:addResponse("Be greeted.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greebas");
talkEntry:addTrigger("Greebs");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Hallo.");
talkEntry:addResponse("Grüße.");
talkEntry:addResponse("Guten Tag.");
talkEntry:addResponse("Gruß.");
talkEntry:addResponse("Seid gegrüßt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("wie hei[sß]+t du");
talkEntry:addTrigger("wie hei[sß]+t ihr");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer seid");
talkEntry:addTrigger("wer bist");
talkEntry:addResponse("Ich bin %NPCNAME.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Good bye");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare thee well");
talkEntry:addResponse("Farewell.");
talkEntry:addResponse("Good bye.");
talkEntry:addResponse("Bye.");
talkEntry:addResponse("Ciao.");
talkEntry:addResponse("Adieu...");
talkEntry:addResponse("You leave?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehabt euch wohl");
talkEntry:addResponse("Tschüß.");
talkEntry:addResponse("Wiedersehen.");
talkEntry:addResponse("Gehabt euch wohl.");
talkEntry:addResponse("Adieu...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Farewell.");
talkEntry:addResponse("Good bye.");
talkEntry:addResponse("Bye.");
talkEntry:addResponse("Ciao");
talkEntry:addResponse("Adieu...");
talkEntry:addResponse("You leave?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Tschüß.");
talkEntry:addResponse("Tschüss.");
talkEntry:addResponse("Wiedersehen.");
talkEntry:addResponse("Auf bald");
talkEntry:addResponse("Gehabt euch wohl.");
talkEntry:addResponse("Adieu...");
talkEntry:addResponse("Au revoir...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("I'm fine.");
talkEntry:addResponse("Great, and you?");
talkEntry:addResponse("Pfff!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addResponse("Pfff!");
talkEntry:addResponse("Danke,nicht gut.");
talkEntry:addResponse("Schlecht und dir?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("I'm %NPCNAME.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("I am");
talkEntry:addTrigger("I'm");
talkEntry:addResponse("Nice to meet you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ich bin");
talkEntry:addResponse("Schön dich kennen zu lernen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("murgo");
talkEntry:addCondition(npc.base.condition.race.race(4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Yes! Murgo is a big strong warrior! Everybody is afraid of him!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("murgo");
talkEntry:addCondition(npc.base.condition.race.race(4));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Jaah! Murgo ist ein großer starker Krieger! Alle haben Angst vor ihm!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("murgo");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("He bothered you too? These orcs are a plague.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("murgo");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Hat er dich auch belästigt? Diese Orks sind eine Plage.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("alan");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Alan Dowland, sure I know him, the most wonderful bard from Gobaith!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("alan");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Alan Dowland, natürlich kenne ich ihn, er ist der begabteste Barde auf ganz Gobaith!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Otto");
talkEntry:addTrigger("Martin");
talkEntry:addTrigger("Sauerteig");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Ach! Diese Halblinge sind doch so unbekümmert...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Otto");
talkEntry:addTrigger("Martin");
talkEntry:addTrigger("Sauerteig");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Sigh. These halfers are rather uncaring...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hilfe");
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Vieleicht solltest du einfach versuchen, das Kolier aus Gilberts Tasche zu stehelen."));
talkEntry:addResponse("Mir können nichteinmal die Götter helfen.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("helfen");
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Vieleicht solltest du einfach versuchen, das Kolier aus Gilbert's Tasche zu stehlen."));
talkEntry:addResponse("Mir können nichteinmal die Götter helfen.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("help");
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Maybe you should try out, to pick the necklet out of Gilberts bag."));
talkEntry:addResponse("Even the gods are not able to help me.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("helfen");
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 5));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Vieleicht solltest du einfach versuchen, das Kolier in Gilberts Tasche zu schieben."));
talkEntry:addResponse("Mir können nichteinmal die Götter helfen.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("help");
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 5));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Maybe you should try out, to place the necklet into Gilbert's bag, carefully."));
talkEntry:addResponse("Even the gods are not able to help me.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hilfe");
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 5));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Vieleicht solltest du einfach versuchen, das Kolier in Gilberts Tasche zu schieben."));
talkEntry:addResponse("Mir können nichteinmal die Götter helfen.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Warum ist er bloß so 'traurig'?"));
talkEntry:addResponse("Mir können nichteinmal die Götter helfen.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("helfen");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Warum ist er bloß so 'traurig'?"));
talkEntry:addResponse("Mir können nichteinmal die Götter helfen.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Why for he is so 'dumpish'?"));
talkEntry:addResponse("Even the gods are not able to help me.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me schnieft bekümmert.", "#me sniffs distressed.");
talkingNPC:addCycleText("#me klammert seine Tasche an sich.", "#me hugs his bag in a vigorous way.");
talkingNPC:addCycleText("#me scharrt mit der Schuspitze lustlos im Sand.", "#me scrabbles with his foot mopishly on the ground.");
talkingNPC:addCycleText("#me macht ein unglückliches Gesicht.", "#me makes a hapless grimace.");
talkingNPC:addCycleText("#me schnäuzt sich lautstark in den Ärmel seines Hemdes.", " #me honks his nose into the sleeve of his shirt.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(1);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Ein schniefender Trauerkloß der sich unruhig umblickt..", "A weepy mope, nervously glancing around...");
mainNPC:setUseMessage("Fass mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut dich verwirrt an.", "#me looks at you confused.");
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
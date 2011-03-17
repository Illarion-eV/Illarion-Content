--------------------------------------------------------------------------------
-- NPC Name: Madoquar                                                    None --
-- NPC Job:  Ageless                                                          --
--                                                                            --
-- NPC Race: elf                        NPC Position:  452, 111, 0            --
-- NPC Sex:  female                     NPC Direction: south                  --
--                                                                            --
-- Authors:  Kawan Baxter                                                     --
--           Estralis Seborian                                                --
--                                                                            --
-- Last parsing: March 17, 2011                          easyNPC Parser v1.02 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (3, 452, 111, 0, 4, 'Madoquar', 'npc.madoquar', 1, 1, 0, 205, 155, 29, 238, 154, 73);
---]]

require("npc.base.basic")
require("npc.base.condition.chance")
require("npc.base.condition.item")
require("npc.base.condition.language")
require("npc.base.condition.quest")
require("npc.base.condition.town")
require("npc.base.consequence.deleteitem")
require("npc.base.consequence.inform")
require("npc.base.consequence.item")
require("npc.base.consequence.money")
require("npc.base.consequence.quest")
require("npc.base.consequence.rankpoints")
require("npc.base.talk")
module("npc.madoquar", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 0");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Debugging] Quest status set to 0"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(1337, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(1337, ">", 7));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Error] Something went wrong, please inform a developer."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Madoquar the millenian. Keyphrases: Hello, quest, harbour, humans, lizardmen."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Madoquar die Uralte. Schlüsselwörter: Hallo, Quest, Hafen, Menschen, Echsen."));
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
talkEntry:addResponse("Speak your mind child.");
talkEntry:addResponse("Blessed day it is today. Like the last 800 years of my life everyday has been as fresh as a mountain stream, as relaxing as a field of lilies and as enjoyable as ripe peach.");
talkEntry:addResponse("Mighty nice of you come visit an old lady like me.");
talkEntry:addResponse("I have no other business to attend to, when one reaches my age there is no business that hasn't already been attended to, so speak.");
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
talkEntry:addResponse("Lasst euren Gedanken freien Lauf, mein Kind.");
talkEntry:addResponse("Einen gesegneten Tag. Wie in den letzten 800 Jahren meines Lebens ist jeder Tag so frisch wie ein Gebirgsbach, entspannedn wie ein Lilienbeet und erquickend wie ein reifer Pfirsich.");
talkEntry:addResponse("Äußerst nett von euch, eine alte Dame wie mich zu besuchen.");
talkEntry:addResponse("Ich habe sonst nichts weiter vor, wenn jemand erstmal so alt geworden ist wie ich, dann fällt es schwer, etwas zu tun, was noch aussteht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Speak your mind child.");
talkEntry:addResponse("Blessed day it is today. Like the last 800 years of my life everyday has been as fresh as a mountain stream, as relaxing as a field of lilies and as enjoyable as ripe peach.");
talkEntry:addResponse("Mighty nice of you come visit an old lady like me.");
talkEntry:addResponse("I have no other business to attend to, when one reaches my age there is no business that hasn't already been attended to, so speak.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Lasst euren Gedanken freien Lauf, mein Kind.");
talkEntry:addResponse("Einen gesegneten Tag. Wie in den letzten 800 Jahren meines Lebens ist jeder Tag so frisch wie ein Gebirgsbach, entspannedn wie ein Lilienbeet und erquickend wie ein reifer Pfirsich.");
talkEntry:addResponse("Äußerst nett von euch, eine alte Dame wie mich zu besuchen.");
talkEntry:addResponse("Ich habe sonst nichts weiter vor, wenn jemand erstmal so alt geworden ist wie ich, dann fällt es schwer, etwas zu tun, was noch aussteht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Leaving so soon? Please be careful. The roads can be dangerous this time of year.");
talkEntry:addResponse("Thank goodness. Not to be rude, but even an elf if old enough needs her rest.");
talkEntry:addResponse("Leaving already? An old woman like me is too used to the quiet. Won't you stay a little more and have a spot of tea?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Ihr geht schon? Seid bitte vorsichtig, die Straßen sind unsicher dieser Tage.");
talkEntry:addResponse("Du meine Güte, ich will ja nicht unhöflich sein, aber eine Elfe meines Alters braucht ihre Ruhe.");
talkEntry:addResponse("Ihr müßt schon gehen? Eine alte Frau wie ich ist die Stille gewohnt. Wollt ihr nicht noch etwas bleiben, vielleicht auf eine Tasse Tee?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Leaving so soon? Please be careful, the roads can be dangerous this time of year.");
talkEntry:addResponse("Thank goodness. Not to be rude, but even an elf if old enough needs her rest.");
talkEntry:addResponse("Leaving already? An old woman like me is too used to the quiet. Won't you stay a little longer and have a spot of tea?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Ihr geht schon? Seid bitte vorsichtig, die Straßen sind unsicher dieser Tage.");
talkEntry:addResponse("Du meine Güte, ich will ja nicht unhöflich sein, aber eine Elfe meines Alters braucht ihre Ruhe.");
talkEntry:addResponse("Ihr müßt schon gehen? Eine alte Frau wie ich ist die Stille gewohnt. Wollt ihr nicht noch etwas bleiben, vielleicht auf eine Tasse Tee?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addResponse("Yesterday I just gazed upon a sunset that took my breath away. I've seen that sun set behind that mountain more a thousand, ten thousand, one hundred thousand times maybe, but never like this.");
talkEntry:addResponse("Every time I see the last light of the morning star fall between the fingers of the earth, I learn something new about Illarion, and myself.");
talkEntry:addResponse("I feel great, wonderful.");
talkEntry:addResponse("I feel normal. I've felt like I've felt for how many years? I would call it normal by now. We elves learn to live with a balance, so I would say that I feel balanced.");
talkEntry:addResponse("Something's been urking me. Not many things burden my soul at my old age, but there are just some things.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befind");
talkEntry:addResponse("Gestern habe ich einen Sonnenuntergang gesehen, der mir die Sprache verschlagen hat. Ich habe die Sonne schon tausend, zehntausend, vielleicht einhundertausend mal schon versinken gesehen, aber noch nie so.");
talkEntry:addResponse("Jedesmal, wenn ich das letzte Licht des Morgensterns zwischen die Finger der Welt verblassen sehe, lerne ich etwas neues über Illarion und mich selbst.");
talkEntry:addResponse("Ich fühle mich großartig, danke.");
talkEntry:addResponse("Mir geht es wie immer. Mir geht nun schon seit wie vielen Jahren so? Ich denke, es ist ganz normal.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("Madoquar, it's a bit old fashion, I know.");
talkEntry:addResponse("Madoquar, a pleasure to meet you.");
talkEntry:addResponse("Madoquar, the Ageless.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Madoquar, ich weiß, ein altmodischer Name.");
talkEntry:addResponse("Madoquar, schön euch zu treffen.");
talkEntry:addResponse("Madoquar, die Alterslose.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(1337, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] The Ghost Oak I"));
talkEntry:addResponse("I can't tell you what is wrong with the world, but I feel a dark presence not far to the east. Be a dear and go explore it for me please.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(1337, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(1337, "=", 0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Die Geistereiche I"));
talkEntry:addResponse("Ich kann euch nicht sagen, was mit der Welt nicht stimmt, aber ich spüre eine dunkle Präsenz nicht weit von hier im Osten. Seid so nett und erkundet den Ursprung für mich.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(1337, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(1337, "=", 0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] The Ghost Oak I"));
talkEntry:addResponse("I can't tell you what is wrong with the world, but I feel a dark presence not far to the east. Be a dear and go explore it for me please.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(1337, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(1337, "=", 0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Die Geistereiche I"));
talkEntry:addResponse("Ich kann euch nicht sagen, was mit der Welt nicht stimmt, aber ich spüre eine dunkle Präsenz nicht weit von hier im Osten. Seid so nett und erkundet den Ursprung für mich.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(1337, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(1337, "=", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Oh, you have not found anything yet? Do you need to know where to search? To the east!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(1337, "=", 1));
talkEntry:addResponse("Oh, ihr habt noch nichts gefunden? Ihr wisst nicht wo ihr suchen sollt? Im Osten!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(1337, "=", 1));
talkEntry:addResponse("Oh, you have not found anything yet? Do you need to know where to search? To the east!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(1337, "=", 1));
talkEntry:addResponse("Oh, ihr habt noch nichts gefunden? Ihr wisst nicht wo ihr suchen sollt? Im Osten!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(1337, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 60 copper coins."));
talkEntry:addResponse("So, the origin of the evil presence is an oak? Let me think about this for a minute or a year and come back to me.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 60));
talkEntry:addConsequence(npc.base.consequence.quest.quest(1337, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(1337, "=", 2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 60 Kupferstücke."));
talkEntry:addResponse("Also der Ursprung der dunklen Präsenz ist eine Eiche? Lasst mich eine Minute oder auch ein Jahr darüber nachdenken und kommt dann zu mir zurück.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 60));
talkEntry:addConsequence(npc.base.consequence.quest.quest(1337, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(1337, "=", 3));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] The Ghost Oak II"));
talkEntry:addResponse("The oak cannot simply be cut down... I should have expected that much. The spirit of the tree is too strong. There is a way to solve this; Bring me a longaxe, a bar of silver and one more thing. I will tell you the last thing after you bring me these.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(1337, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(1337, "=", 3));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Die Geistereiche II"));
talkEntry:addResponse("Diese Eiche kann man nicht einfach fällen... Ich hätte es wissen müssen. Der Geist in ihr ist zu stark. Aber es gibt einen Weg; bringt mir eine Langaxt, einen Silberbarren und etwas anderes - ich werde euch sagen, was, wenn ihr die anderen Dinge gebracht habt.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(1337, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(1337, "=", 3));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] The Ghost Oak II"));
talkEntry:addResponse("The oak cannot simply be cut down... I should have expected that much. The spirit of the tree is too strong. There is a way to solve this; Bring me a longaxe, a bar of silver and one more thing. I will tell you the last thing after you bring me these.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(1337, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(1337, "=", 3));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Die Geistereiche II"));
talkEntry:addResponse("Diese Eiche kann man nicht einfach fällen... Ich hätte es wissen müssen. Der Geist in ihr ist zu stark. Aber es gibt einen Weg; bringt mir eine Langaxt, einen Silberbarren und etwas anderes - ich werde euch sagen, was, wenn ihr die anderen Dinge gebracht habt.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(1337, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(1337, "=", 4));
talkEntry:addCondition(npc.base.condition.item.item(88, "all", ">", 0));
talkEntry:addCondition(npc.base.condition.item.item(104, "all", ">", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 120 copper coins and a ruby amulet."));
talkEntry:addResponse("You warriors are a gift. That's all the items except for one. Let me meditate for a moment and then come back to me.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 120));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(88, 1));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(104, 1));
talkEntry:addConsequence(npc.base.consequence.item.item(67, 1, 599, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(1337, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(1337, "=", 4));
talkEntry:addCondition(npc.base.condition.item.item(88, "all", ">", 0));
talkEntry:addCondition(npc.base.condition.item.item(104, "all", ">", 0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 120 Kupferstücke und ein Rubinamulett."));
talkEntry:addResponse("Ihr Krieger seid eine Segen. Das sind alle Dinge, die ich brauche, außer eines. Lasst mich kurz meditieren und kommt dann zurück zu mir.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 120));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(88, 1));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(104, 1));
talkEntry:addConsequence(npc.base.consequence.item.item(67, 1, 599, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(1337, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(1337, "=", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Bring me a longaxe, a bar of silver and one more thing. I will tell you the last thing after you bring me these.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(1337, "=", 4));
talkEntry:addResponse("Bringt mir eine Langaxt, einen Silberbarren und etwas anderes - ich werde euch sagen, was, wenn ihr die anderen Dinge gebracht habt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(1337, "=", 4));
talkEntry:addResponse("Bring me a longaxe, a bar of silver and one more thing. I will tell you the last thing after you bring me these.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(1337, "=", 4));
talkEntry:addResponse("Bringt mir eine Langaxt, einen Silberbarren und etwas anderes - ich werde euch sagen, was, wenn ihr die anderen Dinge gebracht habt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(1337, "=", 5));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] The Ghost Oak III"));
talkEntry:addResponse("Before you make any judgments please listen. This next part is not onerous, yet it will take an open mind. South east of the tree is the remnants of a house. Somewhere below the ground of this house are remains. Whether it's, a bone, a hair, a tooth, it might all be dirt by now. I need you to search under that house for a piece of a dead body and bring it back here. ");
talkEntry:addConsequence(npc.base.consequence.quest.quest(1337, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(1337, "=", 5));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse(" I need you to search under the ruined house south east of the tree for a piece of a dead body and bring it back here.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(1337, "=", 5));
talkEntry:addResponse("GERMAN.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(1337, "=", 5));
talkEntry:addResponse("ENGLISH.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(1337, "=", 5));
talkEntry:addResponse("GERMAN.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(1337, "=", 9999));
talkEntry:addCondition(npc.base.condition.item.item(391, "all", ">", 9999));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved]."));
talkEntry:addResponse("I'm not in the mood to chit chat. Just give me the book and come back in one day.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 120));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(391, 10));
talkEntry:addConsequence(npc.base.consequence.item.item(391, 1, 599, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(1337, "=", 4));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Galmair", "+", 10));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(1337, "=", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] The Ghost Oak III"));
talkEntry:addResponse("Here is the axe. It's silver so it can hurt the undead. The spirit of the tree is special. Nothing short of a specific weapon can kill it. Here it is. Please fix this disturbance for me, so that I can live the rest of my life in peace.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(1337, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(1337, "=", 4));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Die Geistereiche III"));
talkEntry:addResponse("GERMAN.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(1337, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(1337, "=", 4));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] The Ghost Oak III"));
talkEntry:addResponse("ENGLISH.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(1337, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(1337, "=", 4));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Die Geistereiche III"));
talkEntry:addResponse("GERMAN.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(1337, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(1337, "=", 5));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Kill that wraith now! Now! Please.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(1337, "=", 5));
talkEntry:addResponse("GERMAN.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(1337, "=", 5));
talkEntry:addResponse("ENGLISH.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(1337, "=", 5));
talkEntry:addResponse("GERMAN.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(1337, "=", 6));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved]"));
talkEntry:addResponse("I'll give you a ring and a secret, though you probably figured this out by now. I killed that wraith while it was alive. Don't tell a soul, but that wraith was once the real Madoquar. Don't look at me with such condescending eyes. This happened 400 years ago. Cadomyr laws were different then and I have already learned my lesson.");
talkEntry:addConsequence(npc.base.consequence.item.item(391, 1, 799, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(1337, "=", 7));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Galmair", "+", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(1337, "=", 6));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded a VERY NICE ITEM."));
talkEntry:addResponse("ENGLISH.");
talkEntry:addConsequence(npc.base.consequence.item.item(391, 1, 799, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(1337, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(1337, "=", 6));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst ein VERY NICE ITEM. Dein Ansehen bei Don Valerio Guilianni steigt."));
talkEntry:addResponse("GERMAN.");
talkEntry:addConsequence(npc.base.consequence.item.item(391, 1, 799, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(1337, "=", 7));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Galmair", "+", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(1337, "=", 6));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst ein VERY NICE ITEM."));
talkEntry:addResponse("GERMAN.");
talkEntry:addConsequence(npc.base.consequence.item.item(391, 1, 799, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(1337, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(1337, "=", 7));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("It's a nice day today, isn't it? It's thanks to you that I can enjoy these days for hundreds if not thousands of more years as Madoquar.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(1337, "=", 7));
talkEntry:addResponse("GERMAN.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(1337, "=", 7));
talkEntry:addResponse(" It's a nice day today, isn't it? It's thanks to you that I can enjoy these days for hundreds if not thousands of more years as Madoquar.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(1337, "=", 7));
talkEntry:addResponse("GERMAN.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("I had a job a long long time ago. What was it again?");
talkEntry:addResponse("Sitting on my porch eating oranges and sipping tea. Does that count?");
talkEntry:addResponse("I'm a part time traveler, once every three hundred years or so.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Ich übte einst einen Beruf aus. Was war es noch gleich?");
talkEntry:addResponse("Auf meinem Hintern sitzen, Orangen essen und Tee schlürfen - zählt das als Beruf?");
talkEntry:addResponse("Ich bin Teilzeitreisende, alle dreihundert Jahre in etwa.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I had a job a long long time ago. What was it again?");
talkEntry:addResponse("Sitting on my porch eating oranges and sipping tea. Does that count?");
talkEntry:addResponse("I'm a part time traveler, once every three hundred years or so.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Ich übte einst einen Beruf aus. Was war es noch gleich?");
talkEntry:addResponse("Auf meinem Hintern sitzen, Orangen essen und Tee schlürfen - zählt das als Beruf?");
talkEntry:addResponse("Ich bin Teilzeitreisende, alle dreihundert Jahre in etwa.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I wish I remembered how I escaped from there.");
talkEntry:addResponse("It was no Emerald forest, but one could stay there for a while.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Ich wüßte gerne, wie es mir gelungen ist, von dort zu entkommen.");
talkEntry:addResponse("Es war kein Smaragdwald, aber man konnte es dort aushalten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("They call me Madoquar.");
talkEntry:addResponse("I am Madoquar, my pleasure to meet you.");
talkEntry:addResponse("Hello, I am Madoquar.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Man nennt mich Madoquar.");
talkEntry:addResponse("Ich bin Madoquar, schön euch zu treffen.");
talkEntry:addResponse("Hallo, ich bin Madoquar.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nameless Mountains");
talkEntry:addResponse("Come back in one thousand years and I will tell you all about it.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Burden");
talkEntry:addTrigger("urking");
talkEntry:addTrigger("urk");
talkEntry:addTrigger("bothering");
talkEntry:addResponse("#me sighs: 'Two years ago on my latest pilgrimage through Illarion. I passed a tree. This tree needs to be cut down.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("humans");
talkEntry:addResponse("I met the fifth human ever born.");
talkEntry:addResponse("What is a man, but a miserable pile of secrets.");
talkEntry:addResponse("I hate humans, like I love dwarves, like I love elves, like I love halflings, like I love gnomes, like I love orcs, like I love lizardmen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Dwarves");
talkEntry:addResponse("They make good weapons. That is always my first thought of them. I spent a great deal of my life forging weapons. Not for battle, but for the art of things. I am skilled at making a blade, but master dwarf, I fear in all my years I will never reach.");
talkEntry:addResponse("I envy those little craftsmen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gnomes");
talkEntry:addResponse("Philosophically they are the opposite of everything we elves stand for. They are for change, we are for stability. They are for new, we are for old, they are for progress, we are for peace.");
talkEntry:addResponse("They are kind of cute. They all look like children.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("lizard");
talkEntry:addResponse("Lizardmen are very interesting. My first and only love was a lizardman.");
talkEntry:addResponse("That thing on their heads. I like playing with it.");
talkEntry:addResponse("My husband Servont was a lizardman. The hardest part of being an elf is watching those you love disappear.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("orcs");
talkEntry:addResponse("I love them, but I cannot say that I really like them.");
talkEntry:addResponse("I of course have had some unfriendly communications with them, today is a new day though. Everyone gets along. It's for the better this way.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("halflings");
talkEntry:addResponse("They are like little people. I once thought they were people that were short. Halflings though are much more peaceful then man.");
talkEntry:addResponse("Half a man should be should be twice the man a man should be half the time- Gerald Tealuv, an old hobbit friend of mine.");
talkEntry:addResponse("Hobits make the best bread.");
talkEntry:addResponse("I still remember the first time I stayed with a hobiit and bit into my first biscuit. There are two things in my life that I have ever truly loved and biscuits are one of them.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Servont");
talkEntry:addResponse("Servont was my husband for almost 1000 years, back then I was a house wife. I would wait at home for him. He would kill beast for the goods we needed. He loved traveling. He's the reason I take my pilgrimages every few hundred years.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Harbo");
talkEntry:addResponse("This harbour wasn't here last century. Anyway, it will be gone again one day.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hafen");
talkEntry:addResponse("Dieser Hafen hier war vorheriges Jahrhundert noch nicht hier. Was soll's, er verschwindet auch wieder.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("It is a place known for their mages. Human mages are very direct in their magic. They lack the gracefulness of an elf's touch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("It's a town. I have been there.");
talkEntry:addResponse("On my next trip around the world that will be my first stop. Not because of any specific importance. It's just the closest city.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Queen");
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königin");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I really have no opinion of her. I was here before her. I will be here after her.");
talkEntry:addResponse("She was cute when she was a child. Humans age so quickly. In the blink of an elven eye she has grown from a cute girl to a bland looking human.");
talkEntry:addResponse("She usually has tasks for other people to do. She is known to pay well.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("To others' eyes the earth seems dead, but to an an elf, we see the life.");
talkEntry:addResponse("I don't know if I will spend the end of my days there, but I do know that I could  bring myself to move to that place, at least for another 400 years.");
talkEntry:addResponse("This city was once regarded a colony of Albar. The land of man changes like the birth and death of flowers on the field.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I do not care. I bother myself not with the fickle ways of man.");
talkEntry:addResponse("What is war? What is it good for? Absolutely nothing.");
talkEntry:addResponse("Men create factions and are never whole. Men lust, and have not. Men kill, and desire to have, and cannot obtain. Men fight and war, yet they have not.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("Mir egal, was gehen mich die Angelegenheiten der Menschen an?");
talkEntry:addResponse("Krieg, was ist das eigentlich? Wofür ist er gut? Nichts!.");
talkEntry:addResponse("Menschen verbünden sich, doch sind nie eins. Sie gelüsten, kriegen aber nicht. Töten um zu erlangen, aber können nichts behalten. Menschen kämpfen und streiten, doch haben sie nichts.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I do not care. I bother myself not with the fickle ways of man.");
talkEntry:addResponse("What is war? What is it good for? Absolutely nothing.");
talkEntry:addResponse("Men create factions and are never whole. Men lust, and have not. Men kill, and desire to have, and cannot obtain. Men fight and war, yet they have not.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("Mir egal, was gehen mich die Angelegenheiten der Menschen an?");
talkEntry:addResponse("Krieg, was ist das eigentlich? Wofür ist er gut? Nichts!.");
talkEntry:addResponse("Menschen verbünden sich, doch sind nie eins. Sie gelüsten, kriegen aber nicht. Töten um zu erlangen, aber können nichts behalten. Menschen kämpfen und streiten, doch haben sie nichts.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I do not care. I bother myself not with the fickle ways of man.");
talkEntry:addResponse("What is war? What is it good for? Absolutely nothing.");
talkEntry:addResponse("Men create factions and are never whole. Men lust, and have not. Men kill, and desire to have, and cannot obtain. Men fight and war, yet they have not.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Mir egal, was gehen mich die Angelegenheiten der Menschen an?");
talkEntry:addResponse("Krieg, was ist das eigentlich? Wofür ist er gut? Nichts!.");
talkEntry:addResponse("Menschen verbünden sich, doch sind nie eins. Sie gelüsten, kriegen aber nicht. Töten um zu erlangen, aber können nichts behalten. Menschen kämpfen und streiten, doch haben sie nichts.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("There are no younger gods, there are five gods, ten old, holy ancestors and uncalled ones.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Es gibt keine 'jungen Götter'. Es gibt fünf Götter, zehn altehrwürdige Vorfahren und den Ungenannten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Adron");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("There are no younger gods, there are five gods, ten old, holy ancestors and uncalled ones.");
talkEntry:addResponse("Who is that?");
talkEntry:addResponse("Why do you talk to me about such rubbish. Let an elf enjoy her day in peace.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Adron");
talkEntry:addResponse("Es gibt keine 'jungen Götter'. Es gibt fünf Götter, zehn altehrwürdige Vorfahren und den Ungenannten.");
talkEntry:addResponse("Wer soll das sein?");
talkEntry:addResponse("Warum redet ihr mir mir über solch einen Blödsinn? Verderbt einer Elfe bitte nicht den Tag.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("The five with you.");
talkEntry:addResponse("Haha, Cadomyr really worships this god.");
talkEntry:addResponse("#me wipes sweat from his brows.");
talkEntry:addResponse("He may be my favourite god. He may not be yours, but you don't remember a time before cooked food.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("There are no younger gods, there are five gods, ten old, holy ancestors and uncalled ones");
talkEntry:addResponse("Who is that?");
talkEntry:addResponse("Why do you talk to me about such rubbish. Let an elf enjoy her day in peace.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addResponse("Es gibt keine 'jungen Götter'. Es gibt fünf Götter, zehn altehrwürdige Vorfahren und den Ungenannten.");
talkEntry:addResponse("Wer soll das sein?");
talkEntry:addResponse("Warum redet ihr mir mir über solch einen Blödsinn? Verderbt einer Elfe bitte nicht den Tag.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elara");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("There are no younger gods, there are five gods, ten old, holy ancestors and uncalled ones.");
talkEntry:addResponse("Who is that?");
talkEntry:addResponse("Why do you talk to me about such rubbish. Let an elf enjoy her day in peace.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elara");
talkEntry:addResponse("Es gibt keine 'jungen Götter'. Es gibt fünf Götter, zehn altehrwürdige Vorfahren und den Ungenannten.");
talkEntry:addResponse("Wer soll das sein?");
talkEntry:addResponse("Warum redet ihr mir mir über solch einen Blödsinn? Verderbt einer Elfe bitte nicht den Tag.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eldan");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("The five with you.");
talkEntry:addResponse("I have nothing to say about him.");
talkEntry:addResponse("#me smiles warmly to herself.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eldan");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Findari");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("The five with you.");
talkEntry:addResponse("Findari is strong in these parts. Humans think she's angry with them. They are just too young to see a woman at work.");
talkEntry:addResponse("Today she is calm. Even gods need rest.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Findari");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("There are no younger gods, there are five gods, ten old, holy ancestors and uncalled ones.");
talkEntry:addResponse("Who is that?");
talkEntry:addResponse("Why do you talk to me about such rubbish. Let an elf enjoy her day in peace.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("Es gibt keine 'jungen Götter'. Es gibt fünf Götter, zehn altehrwürdige Vorfahren und den Ungenannten.");
talkEntry:addResponse("Wer soll das sein?");
talkEntry:addResponse("Warum redet ihr mir mir über solch einen Blödsinn? Verderbt einer Elfe bitte nicht den Tag.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("There are no younger gods, there are five gods, ten old, holy ancestors and uncalled ones.");
talkEntry:addResponse("Who is that?");
talkEntry:addResponse("Why do you talk to me about such rubbish. Let an elf enjoy her day in peace.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addResponse("Es gibt keine 'jungen Götter'. Es gibt fünf Götter, zehn altehrwürdige Vorfahren und den Ungenannten.");
talkEntry:addResponse("Wer soll das sein?");
talkEntry:addResponse("Warum redet ihr mir mir über solch einen Blödsinn? Verderbt einer Elfe bitte nicht den Tag.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Moshran");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("There are no younger gods, there are five gods, ten old, holy ancestors and uncalled ones");
talkEntry:addResponse("Who is that?");
talkEntry:addResponse("Why do you talk to me about such rubbish. Let an elf enjoy her day in peace.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Moshran");
talkEntry:addResponse("Es gibt keine 'jungen Götter'. Es gibt fünf Götter, zehn altehrwürdige Vorfahren und den Ungenannten.");
talkEntry:addResponse("Wer soll das sein?");
talkEntry:addResponse("Warum redet ihr mir mir über solch einen Blödsinn? Verderbt einer Elfe bitte nicht den Tag.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addTrigger("Nargùn");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("There are no younger gods, there are five gods, ten old, holy ancestors and uncalled ones.");
talkEntry:addResponse("Who is that?");
talkEntry:addResponse("Why do you talk to me about such rubbish. Let an elf enjoy her day in peace.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addTrigger("Nargùn");
talkEntry:addResponse("Es gibt keine 'jungen Götter'. Es gibt fünf Götter, zehn altehrwürdige Vorfahren und den Ungenannten.");
talkEntry:addResponse("Wer soll das sein?");
talkEntry:addResponse("Warum redet ihr mir mir über solch einen Blödsinn? Verderbt einer Elfe bitte nicht den Tag.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oldra");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("There are no younger gods, there are five gods, ten old, holy ancestors and uncalled ones.");
talkEntry:addResponse("Who is that?");
talkEntry:addResponse("Why do you talk to me about such rubbish. Let an elf enjoy her day in peace.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("Es gibt keine 'jungen Götter'. Es gibt fünf Götter, zehn altehrwürdige Vorfahren und den Ungenannten.");
talkEntry:addResponse("Wer soll das sein?");
talkEntry:addResponse("Warum redet ihr mir mir über solch einen Blödsinn? Verderbt einer Elfe bitte nicht den Tag.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ronagan");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("There are no younger gods, there are five gods ten old, holy ancestors and uncalled ones.");
talkEntry:addResponse("Who is that?");
talkEntry:addResponse("Why do you talk to me about such rubbish. Let an elf enjoy her day in peace.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("Es gibt keine 'jungen Götter'. Es gibt fünf Götter, zehn altehrwürdige Vorfahren und den Ungenannten.");
talkEntry:addResponse("Wer soll das sein?");
talkEntry:addResponse("Warum redet ihr mir mir über solch einen Blödsinn? Verderbt einer Elfe bitte nicht den Tag.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sirani");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("There are no younger gods, there are five gods, ten old, holy ancestors and uncalled ones.");
talkEntry:addResponse("Who is that?");
talkEntry:addResponse("Why do you talk to me about such rubbish. Let an elf enjoy her day in peace.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("Es gibt keine 'jungen Götter'. Es gibt fünf Götter, zehn altehrwürdige Vorfahren und den Ungenannten.");
talkEntry:addResponse("Wer soll das sein?");
talkEntry:addResponse("Warum redet ihr mir mir über solch einen Blödsinn? Verderbt einer Elfe bitte nicht den Tag.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("The five with you.");
talkEntry:addResponse("I do wish she would visit here more often, but her absence does keep this place from being overcrowded.");
talkEntry:addResponse("It is my duty to worship the five gods, but It would be a lie if I did not say I had no resentment for her for taking my eye.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ushara");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("The five with you.");
talkEntry:addResponse("Most see her as a rock, but most don't see how fluid the sand is. They fail to see her lively side.");
talkEntry:addResponse("Hahaha, she is my god now. People often mistake her for me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zhambra");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("There are no younger gods, there are five gods, ten old, holy ancestors and uncalled ones.");
talkEntry:addResponse("Who is that?");
talkEntry:addResponse("Why do you talk to me about such rubbish. Let an elf enjoy her day in peace.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zhambra");
talkEntry:addResponse("Es gibt keine 'jungen Götter'. Es gibt fünf Götter, zehn altehrwürdige Vorfahren und den Ungenannten.");
talkEntry:addResponse("Wer soll das sein?");
talkEntry:addResponse("Warum redet ihr mir mir über solch einen Blödsinn? Verderbt einer Elfe bitte nicht den Tag.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("I sell fresh air and wisdom.");
talkEntry:addResponse("I'm sorry, I have nothing of value.");
talkEntry:addResponse("Shoo away with you. Go to a store if you want to sell something.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Ich verkaufe frische Luft und Weisheit.");
talkEntry:addResponse("Es tut mir leid, ich habe nichts von Wert.");
talkEntry:addResponse("Husch, weg mich euch! Geht in einen Laden, wenn ihr etwas kaufen wollt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("I could tell you about my husband, Servont, but only if you are really interested in stories of an old lady.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Ich könnte euch von meinem Ehemann Servont erzählen, aber nur, wenn euch die Geschichten einer alten Dame interessieren.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Meaning of life");
talkEntry:addResponse("42.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sinn des Lebens");
talkEntry:addResponse("42.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dik");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Dik-Diks are cute, aren't they?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dik");
talkEntry:addResponse("Dik-Diks sind süß, nicht wahr?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Madoquar");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Good day, how are you?");
talkEntry:addResponse("The weather is fine today is it not?");
talkEntry:addResponse("I think you might have dropped something, haha. I was kidding.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Madoquar");
talkEntry:addResponse("Guten Tag, wie geht es euch?.");
talkEntry:addResponse("Das Wetter ist ganz nett, oder?");
talkEntry:addResponse("Ich glaube, ihr habt da was verloren, haha.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("I did not say anything.");
talkEntry:addResponse("I don't believe I asked a yes or no question.");
talkEntry:addResponse("Wait what?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("Ich habe eigentlich nichts gesagt.");
talkEntry:addResponse("Ich glaube nicht, dass ich eine Frage gestellt habe, die mit 'Ja' oder 'Nein' zu beantworten wäre.");
talkEntry:addResponse("Moment, wie bitte?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("I did not say anything.");
talkEntry:addResponse("I don't believe I asked a yes or no question.");
talkEntry:addResponse("Wait what?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("Ich habe eigentlich nichts gesagt.");
talkEntry:addResponse("Ich glaube nicht, dass ich eine Frage gestellt habe, die mit 'Ja' oder 'Nein' zu beantworten wäre.");
talkEntry:addResponse("Moment, wie bitte?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(20));
talkEntry:addResponse("This discussion is not relevant to me.");
talkEntry:addResponse("Maybe say something about quests or tasks. People respond well to those words.");
talkEntry:addResponse("I have no intention of buying your chicken.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(20));
talkEntry:addResponse("Das geht mich nichts an.");
talkEntry:addResponse("Erzählt doch mal etwas über Abenteuer und Aufgaben. Die Leute mögen sowas hören.");
talkEntry:addResponse("Mir ist nicht danach, euch einen Bären aufzubinden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("Was für ein netter Tag. Ich sollte eine kleine Bergwanderung machen.", "What a nice day today. I am prone to walk in the mountains me think.");
talkingNPC:addCycleText("Äpfel hinterlassen immer so einen angenehmen Geschmack im Mund. Ich frage mich, ob es eine Frucht gibt, die meinem Gaumen noch mehr erquicken kann als ein frischer Apfel.", "Apples leave such a pleasant after taste in my mouth. I wonder if there will ever be a fruit more aesthetically pleasing to the tongue then a fresh apple.");
talkingNPC:addCycleText("Ich möchte nicht gestört werden. An manchen Tagen möchte ich mich einfach ausruhen und meine Mahlzeiten genießen.", "I do not wish to be bothered today. Some days I just want to rest and nibble on my lunch in peace.");
talkingNPC:addCycleText("Diese dunkle Vorahnung ist eine Last auf meiner Seele.", "That eerie feeling, it's a burden on my soul.");
talkingNPC:addCycleText("Es wird Regen geben. Möge Tanora dieses Land nicht allzu sehr peinigen.", "It seem as if it's about to rain today. Please Tanora do not be cruel to this land.");
talkingNPC:addCycleText("Tanora, mögest du uns nur sanft und so selten wie möglich behelligen.", "Tanora, you only touched us lightly, please visit us as sparingly as possible.");
talkingNPC:addCycleText("Das ist schon mehr als unangenehm. Ich werde nicht eher meine Frieden finden, bevor diese Last von mir genommen wurde.", "This is beyond urking. I will not feel at peace until this burden is lifted from me.");
talkingNPC:addCycleText("Ich war schon überall in Illarion. Es gibt wohlmöglich nicht einen Fluss, aus dem ich nicht schon getrunken hätte oder einen Berg, auf dessen Spitze ich nicht schon gespeist habe.", "I have been all over Illarion. There may not be a river I have not drunk from, or a mountain peak that I have not dined on top of.");
talkingNPC:addCycleText("Habt ihr diesen Echsenmann gesehen? Seine Beine waren so... Ich sollte ihn mal zu mir einladen.", "Did you see that lizardman? His legs were... hehe. I may have to get him to visit me.");
talkingNPC:addCycleText("Etwas böses liegt in der Natur der Menschen.", "I see something dangerous in humans.");
talkingNPC:addCycleText("Die Echsen leben in Frieden mit dem Meer, die Elfen mit dem Wald, die Halblinge mit den Hügeln, die Zwerge mit den Bergen und die Orks mit ihrer Jagdbeute. Aber Menschen zerstören des Zerstörens wegen.", "The lizard makes peace with the sea, the elf with the forest, the halflings with the hills, the dwarf with his mountain and the orc with his prey. But humans destroy to destroy.");
talkingNPC:addCycleText("Menschen stehlen, um zu schaffen und das, was sie schaffen, wird von anderen ihrer Art zerstört.", "Humans, they steal to create and those creations end up being destroyed.");
talkingNPC:addCycleText("#me rückt eine Augenklappe zurecht, die einen Teil ihrer rechten Gesichtshälfte abdeckt.", "#me readjusts a patch that covers her right eye.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(3);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Dieser NPC ist Madoquar die Alterslose.", "This NPC is Madoquar the Ageless.");
mainNPC:setUseMessage("Fasst mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut verwirrt.", "#me looks around confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 803);
mainNPC:setEquipment(11, 0);
mainNPC:setEquipment(5, 323);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 2295);
mainNPC:setEquipment(9, 0);
mainNPC:setEquipment(10, 369);
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
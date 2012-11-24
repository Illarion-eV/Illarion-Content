--------------------------------------------------------------------------------
-- NPC Name: Viola Baywillow                                             None --
-- NPC Job:  Tutor                                                            --
--                                                                            --
-- NPC Race: halfling                   NPC Position:  37, 101, 100           --
-- NPC Sex:  female                     NPC Direction: west                   --
--                                                                            --
-- Authors:  envi                                                             --
--           Rincewind                                                        --
--           Estralis Seborian                                                --
--                                                       easyNPC Parser v1.21 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (2, 37, 101, 100, 6, 'Viola Baywillow', 'npc.viola_baywillow', 1, 2, 0, 254, 14, 1, 245, 180, 137);
---]]

require("npc.base.basic")
require("npc.base.condition.language")
require("npc.base.consequence.inform")
require("npc.base.consequence.quest")
require("npc.base.consequence.trade")
require("npc.base.consequence.warp")
require("npc.base.talk")
module("npc.viola_baywillow", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("reset");
talkEntry:addResponse("Noobia reset!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(309, "=", 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(310, "=", 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(311, "=", 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(312, "=", 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(313, "=", 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(314, "=", 0));
talkEntry:addConsequence(npc.base.consequence.warp.warp(31, 22, 100));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Viola Baywillow. She can give you information about the game world. Keywords: Help, Realms, Gods, Races, Crafts, Motives, Landscapes, Leaders, Laws."));
talkEntry:addResponse("Hiho, if you'd like to know something about the realms of Cadomyr, Galmair or Runewick, just ask me!");
talkEntry:addResponse("Hiho, have we met before? There are so many new faces around, my apologies if we have. Let me tell about the realms of Cadomyr, Galmair and Runewick!");
talkEntry:addResponse("Good day, if you'd like to know something about the realms Cadomyr, Galmair and Runewick, let me know!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Viola Baywillow. Sie kann dir Informationen über die Spielwelt geben. Schlüsselwörter: Hilfe, Reiche, Götter, Rassen, Handwerke, Motive, Landschaften, Anführer, Gesetze."));
talkEntry:addResponse("Hiho, wenn du etwas über die Reiche Cadomyr, Galmair und Runewick wissen möchtest, frag mich einfach danach.");
talkEntry:addResponse("Hallo, wenn du etwas über die Reiche Cadomyr, Galmair und Runewick wissen möchtest, frag mich einfach danach.");
talkEntry:addResponse("Guten Tag, wenn du etwas über die Reiche Cadomyr, Galmair und Runewick wissen möchtest, frag mich einfach danach.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("skip");
talkEntry:addTrigger("cancel");
talkEntry:addTrigger("abort");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] You have already made it to the end of the tutorial. Please choose a realm to be the home for your character by stepping through the corresponding portal on one of the three islands to the south."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("überspring");
talkEntry:addTrigger("abbrech");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] Du bist bereits am Ende des Tutorials. Wähle nun bitte ein Reich als neue Heimat deines Charakters. Gehe hierzu durch ein Portal auf einer der drei Inseln im Süden."));
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
talkEntry:addResponse("Hiho, if you'd like to know something about the realms of Cadomyr, Galmair or Runewick, just ask me!");
talkEntry:addResponse("Hiho, have we met before? There are so many new faces around, my apologies if we have. Let me tell about the realms of Cadomyr, Galmair and Runewick!");
talkEntry:addResponse("Good day, if you'd like to know something about the realms Cadomyr, Galmair and Runewick, let me know!");
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
talkEntry:addResponse("Hiho, wenn du etwas über die Reiche Cadomyr, Galmair und Runewick wissen möchtest, frag mich einfach danach.");
talkEntry:addResponse("Hallo, wenn du etwas über die Reiche Cadomyr, Galmair und Runewick wissen möchtest, frag mich einfach danach.");
talkEntry:addResponse("Guten Tag, wenn du etwas über die Reiche Cadomyr, Galmair und Runewick wissen möchtest, frag mich einfach danach.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Hiho, if you'd like to know something about the realms of Cadomyr, Galmair or Runewick, just ask me!");
talkEntry:addResponse("Hiho, have we met before? There are so many new faces around, my apologies if we have. Let me tell about the realms of Cadomyr, Galmair and Runewick!");
talkEntry:addResponse("Good day, if you'd like to know something about the realms Cadomyr, Galmair and Runewick, let me know!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Hiho, wenn du etwas über die Reiche Cadomyr, Galmair und Runewick wissen möchtest, frag mich einfach danach.");
talkEntry:addResponse("Hallo, wenn du etwas über die Reiche Cadomyr, Galmair und Runewick wissen möchtest, frag mich einfach danach.");
talkEntry:addResponse("Guten Tag, wenn du etwas über die Reiche Cadomyr, Galmair und Runewick wissen möchtest, frag mich einfach danach.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Fare thee well.");
talkEntry:addResponse("Good-bye.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Mach's gut.");
talkEntry:addResponse("Tschüß.");
talkEntry:addResponse("Wiedersehen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Fare thee well.");
talkEntry:addResponse("Good-bye.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Mach's gut.");
talkEntry:addResponse("Tschüß.");
talkEntry:addResponse("Wiedersehen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How do you feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("I'm fine and you?");
talkEntry:addResponse("I feel wonderful.");
talkEntry:addResponse("Can't complain.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befinden");
talkEntry:addResponse("Mir geht's toll. Und dir?");
talkEntry:addResponse("Ich fühle mich wunderbar.");
talkEntry:addResponse("Ich kann mich nicht beschweren.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("I'm Viola and I know all that matters about the realms Cadomyr, Galmair and Runewick.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ihr name");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Ich bin Viola und weiß alle wichtigen Dinge über die Reiche Cadomyr, Galmair und Runewick. So, frag mich was!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Alas, another bold traveler! Unfortunately, I haven't much work, but don't let me discourage ya. The realms are always on the look out for adventurers and workers alike!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Hoi, noch ein tapferer Reisender! Leider habe ich keine Arbeit für euch. Das soll euch nicht entmutigen, da die Reiche immer nach Abenteuerer und Arbeitern suchen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("Ahh, a case of idle hands, I see. Be assured, traveler, if you're willing to look around there are folks out there that could use a hand or two. Best start with one of the realms!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Ahh, ein unbeschäftigtes Wesen. Aber keine Angst, es gibt hier und da genug Leute die Unterstützung suchen. Am besten sucht ihr nach ihnen in einem der Reiche!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("I don't have a specific profession.");
talkEntry:addResponse("I only pass along information, but I don't have profession, per se.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Ich habe keinen spezifischen Beruf.");
talkEntry:addResponse("Ich gebe lediglich Informationen, aber ich habe nicht wirklich einen Beruf.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("I don't have any specific profession.");
talkEntry:addResponse(" I only pass along information, but I don't have profession, per se.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Ich habe keinen spezifische Beruf.");
talkEntry:addResponse("Ich gebe lediglich Informationen, aber ich habe nicht wirklich einen Beruf.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("Sounds pretty nice, but nothing like mine.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Klingt hübsch, aber nicht so hübsch wie mein Name.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("This in an old island, which does not exist anymore. Many who you can find in the three realms have arrived from this island. If you would like know more about it, feel free to ask them.");
talkEntry:addResponse("I haven't been there, therefore I cannot tell you anything about it except that it doesn't exist anymore and that you can ask other people about it.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Das ist eine alte Insel, welche nicht mehr existiert. Viele die du in den drei Reichen finden kannst sind von dort. Wenn du mehr darüber wissen möchtest, frag sie.");
talkEntry:addResponse("Ich war noch nie dort, daher weiß ich auch nichts über sie, außer dass es sie nicht mehr gibt und dass du andere Leute über sie fragen kannst.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("faction");
talkEntry:addTrigger("realm");
talkEntry:addResponse("We have three realms here: Runewick, Cadomyr and Galmair. Each realm is home to famous craftsmen. If you'd like to know more about races or crafting in these realms just say the word.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("race");
talkEntry:addTrigger("people");
talkEntry:addResponse("In every realm there are members of all races, though some prefer certain realms. In Runewick, you'll find many elves and halflings; in Galmair, dwarves and orcs; and in Cadomyr, lizardmen and humans.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("craft");
talkEntry:addResponse("About which craft shall I tell you all I know? Alchemist, candle maker, carpenter, lumberjack, cook, baker, farmer, herb gatherer, tailor, tanner, dyer, blacksmith, brick maker, mason, miner, brewer, fisher, glass blower, digger, finesmith or gem grinder?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("motiv");
talkEntry:addTrigger("motif");
talkEntry:addTrigger("theme");
talkEntry:addResponse("The central theme of Runewick is wisdom, in Galmair it is wealth and in Cadomyr it's honour.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("land");
talkEntry:addTrigger("region");
talkEntry:addTrigger("area");
talkEntry:addResponse("The four towers of Runewick are somewhere in the southeast between the meadow and the forest. The halls and caves of Galmair are to the northwest between the mountains and the forest. The town of Cadomyr lies to the west between the desert and the mountains.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("leader");
talkEntry:addTrigger("ruler");
talkEntry:addTrigger("govern");
talkEntry:addResponse("Archmage Elvaine Morgan is the leader of Runewick, Don Valerio Guilianni rules in Galmair, and Queen Rosaline Edwards reigns over Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("law");
talkEntry:addTrigger("custom");
talkEntry:addTrigger("legal");
talkEntry:addTrigger("justice");
talkEntry:addResponse("Runewick is the only community with posted laws to rely on. Galmair doesn't have any real laws - except strict obedience to the Don. There are customs in Cadomyr which are somewhat of Albarian origin, though to a true Albarian they would look shockingly innovative and progressive. More information can be found in the town of your choice.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Father");
talkEntry:addResponse("The father of Queen Rosaline Edwards was Sir Reginald, and the father of Don Valerio Guilianni was Don Tommaso Guilianni. Both Reginald and Tommaso ruled prior to their children, and both have passed on from this life. The father of Archmage Elvaine Morgan is presumed dead as well, but that's just the rumours I have heard.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Fraktion");
talkEntry:addTrigger("Reich");
talkEntry:addResponse("Wir haben hier drei Reiche: Runewick, Cadomyr und Galmair. Die Bewohner sind für unterschiedliche Handwerken berühmt. Wenn du mehr über Handwerke oder die Reiche wissen möchtest, dann sag den jeweiligen Namen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Rasse");
talkEntry:addResponse("In jedem Reich sind Angehörige aller Rassen willkommen, aber einige Rassen bevorzugen bestimmte Reiche. In Runewick kann man viele Elfen und Halblinge finden; in Galmair Zwerge und Orks; und in Cadomyr Menschen und Echsen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Handwerk");
talkEntry:addResponse("Über welches Handwerk möchtest du etwas wissen? Alchemist, Kerzenmacher, Schreiner, Holzfäller, Koch, Bäcker, Bauer, Kräutersucher, Schneider, Gerber, Färber, Schmied, Ziegelmacher, Steinmetz, Schürfer, Brauer, Fischer, Glasbläser, Gräber, Goldschmied oder Edelsteinschleifer?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Motiv");
talkEntry:addResponse("Das Leitmotiv in Runewick ist Weisheit, in Galmair ist es Reichtum, und in Cadomyr ist es Ehre.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Landschaft");
talkEntry:addResponse("Die vier Türme von Runewick wirst du irgendwo im Südosten zwischen Sümpfen und Wäldern finden; die Hallen und Höhlen von Galmair inmitten von Bergen und Wäldern; und die Häuser von Cadomyr zwischen einer Wüste und Bergen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Anführer");
talkEntry:addResponse("Erzmagier Elvaine Morgan ist der Herrscher in Runewick, Don Valerio Guilianni herrscht in Galmair, und Königin Rosaline Edwards in Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gesetz");
talkEntry:addResponse("Runewick ist die einzige Gemeinde mit niedergeschriebenen Gesetzen an denen du dich orientieren kannst; Galmair hat keine wirklichen Gesetzte - du musst nur dem Don gehorchen; und dann sind noch die Bräuche von Cadomyr welche ihren Ursprung in Albar haben, aber für einen Albarianer sind diese wohl schockierend neuartig.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Vater");
talkEntry:addResponse("Der Vater von Königin Rosaline Edwards war Sir Reginald und der Vater von Don Valerio Guilianni war Don Tommaso Guilianni. Beide sind tot. Wahrscheinlich auch der Vater von Erzmagier Elvaine Morgan, aber ich hab nie was von ihm gehört.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("wisdom");
talkEntry:addResponse("Wisdom is the highest value in Runewick. Therefore, many follow the path of Elara, though other followers are permitted. It is well known that people seek out the council of Archmage Elvaine Morgan, whose sageness is widely renowned.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Weisheit");
talkEntry:addResponse("Weisheit ist die höchste Prämisse in Runewick. Deswegen folgen sie auch Elara neben anderen Göttern und dem Rat ihres Herrschers Erzmagier Elvaine Morgan, wessen Weisheit weitbekannt ist.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("wealth");
talkEntry:addTrigger("money");
talkEntry:addTrigger("lucre");
talkEntry:addTrigger("coin");
talkEntry:addResponse("Wealth is the highest value in Galmair. Therefore, Irmorom is exalted above all other gods. It goes without question that Don Valerio Guilianni rules in Galmair, as he is by far the richest.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Reichtum");
talkEntry:addResponse("Reichtum ist die höchste Prämisse in Galmair. Deswegen glauben sie auch an Irmorom neben anderen Göttern und gehorchen Don Valerio Guilianni, der die reichste Person dort ist.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("honour");
talkEntry:addTrigger("honor");
talkEntry:addResponse("Honour is the highest value in Cadomyr. Therefore, most believe in Malachín above all other gods, and the people rely on Queen Rosaline Edwards for her noble and just leadership.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ehre");
talkEntry:addResponse("Ehre ist die höchste Prämisse in Cadomyr. Deswegen glauben sie auch an Malachín neben anderen Göttern und ihrer Herrscherin Königin Rosaline Edwards, welche die edelste Person dort ist.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Alchem");
talkEntry:addTrigger("Druid");
talkEntry:addResponse("Alchemists and druids alike can be found readily available in Runewick, from the freshest novice to the wisest grandmaster. Galmair won't have nearly the selection, though I have seen a druid or two there before. Cadomyr, on the other hand, doesn't have a single druid or alchemist as far as I remember.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Alchem");
talkEntry:addTrigger("Druid");
talkEntry:addResponse("Alchemisten können vor allem in Runewick gefunden werden, weil dort die besten Bedingungen zur Ausübung dieses Berufes bestehen. Auch in Galmair gibt es ein paar wenige. Cadomyr hat zu handeln, wenn es etwas von denen benötigt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Candle");
talkEntry:addResponse("Candle makers are mainly found in Runewick, I guess because so many scholars read deep into the night. Cadomyr certainly has a few too. Galmair lacks the equipment and resources for sustaining a candle maker so mostly they have tofor such wares.");
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Kerzen");
talkEntry:addResponse("Kerzenmacher können vor allem in Runewick gefunden werden, weil dort die besten Bedingungen zur Ausübung dieses Berufes bestehen. Auch in Cadomyr gibt es ein paar wenige. Galmair hat zu handeln, wenn es etwas von denen benötigt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Carpent");
talkEntry:addResponse("Carpenters are mainly found in Runewick since there is a forest nearby. However, Galmair has a few wealthy carpenters if memory serves me right. Cadomyr, from what I know, mainlys for the wares of a carpenter.");
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Schreiner");
talkEntry:addResponse("Schreiner können vor allem in Runewick gefunden werden, weil dort die besten Bedingungen zur Ausübung dieses Berufes bestehen. Auch in Galmair gibt es ein paar wenige. Cadomyr hat zu handeln, wenn es etwas von denen benötigt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Lumberjack");
talkEntry:addResponse("Most lumberjacks I know live near Runewick since the largest forest is nearby. Galmair does have a few as well, as there is less competition there. Cadomyr's trees are not strong enough so they must rely on.");
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Holz");
talkEntry:addResponse("Holzfäller können vor allem in Runewick gefunden werden, weil dort die besten Bedingungen zur Ausübung dieses Berufes bestehen. Auch in Galmair gibt es ein paar wenige. Cadomyr hat zu handeln, wenn es etwas von denen benötigt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cook");
talkEntry:addResponse("Cooks are abundant in Runewick and many travel far and wide to taste their delights. Including me! Although Galmair is not as renowned for its cooks, I've seen several set up shop within its grand halls. Cadomyr has very few cooks and relies heavily on.");
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Koch");
talkEntry:addResponse("Köche können vor allem in Runewick gefunden werden, weil dort die besten Bedingungen zur Ausübung dieses Berufes bestehen. Auch in Galmair gibt es ein paar wenige. Cadomyr hat zu handeln, wenn es etwas von denen benötigt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Baker");
talkEntry:addResponse("Runewick without question has the finest bakers in all of the land. Galmair bakers could certainly learn a lesson or two, but if you find yourself in need there are worst places to stop. As far as Cadomyr goes, I think only the wealthiest could afford baked bread.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bäcker");
talkEntry:addTrigger("back");
talkEntry:addResponse("Bäcker können vor allem in Runewick gefunden werden, weil dort die besten Bedingungen zur Ausübung dieses Berufes bestehen. Auch in Galmair gibt es ein paar wenige. Cadomyr hat zu handeln, wenn es etwas von denen benötigt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farmer");
talkEntry:addTrigger("peasant");
talkEntry:addResponse("Farmers rely on Runewick's fair climate to grow and harvest their crops, and without question have the most peasants working the land. Galmair doesn't get nearly the same amount of rain as Runewick, but the land is cheap and I know a skilled farmer or two that call Galmair home. Cadomyr, ha, you'd be better off digging for buried treasure as a profession.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bauer");
talkEntry:addResponse("Bauern können vor allem in Runewick gefunden werden, weil dort die besten Bedingungen zur Ausübung dieses Berufes bestehen. Auch in Galmair gibt es ein paar wenige. Cadomyr hat zu handeln, wenn es etwas von denen benötigt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Herb");
talkEntry:addResponse("Herb gatherers usually stay close to Runewick so they can sell their fresh herbs to the alchemists and druids. Cadomyr has a few well-maintained herb gathers as well, if memory serves me right. Without supply or demand, Galmair relies strictly onfor any herbal needs.");
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Kräuter");
talkEntry:addTrigger("sammler");
talkEntry:addTrigger("Kraut");
talkEntry:addResponse("Kräutersammler können vor allem in Runewick gefunden werden, weil dort die besten Bedingungen zur Ausübung dieses Berufes bestehen. Auch in Cadomyr gibt es ein paar wenige. Galmair hat zu handeln, wenn es etwas von denen benötigt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tailor");
talkEntry:addResponse("The finest tailors in the land can be found in Runewick. Cadomyr also has a fair amount of tailors, too. As for Galmair, I am quite sure that most of their tailored wares arrive through.");
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Schneider");
talkEntry:addResponse("Schneider können vor allem in Runewick gefunden werden, weil dort die besten Bedingungen zur Ausübung dieses Berufes bestehen. Auch in Cadomyr gibt es ein paar wenige. Galmair hat zu handeln, wenn es etwas von denen benötigt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tanner");
talkEntry:addResponse("Runewick depends heavily on its tanners to supply raw material for its tailors. Cadomyr doesn't have as many but they are around if you know where to look. Galmair as far as I know has tofor such wares.");
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gerber");
talkEntry:addResponse("Gerber können vor allem in Runewick gefunden werden, weil dort die besten Bedingungen zur Ausübung dieses Berufes bestehen. Auch in Cadomyr gibt es ein paar wenige. Galmair hat zu handeln, wenn es etwas von denen benötigt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Dyer");
talkEntry:addResponse("Dyers, like tanners, stay close to Runewick totheir wares with the tailors. I've also seen a number of dyers in Cadomyr too. Galmair, as far as I know, has tofor dyes if they're needed.");
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Färber");
talkEntry:addTrigger("Farbe");
talkEntry:addResponse("Färber können vor allem in Runewick gefunden werden, weil dort die besten Bedingungen zur Ausübung dieses Berufes bestehen. Auch in Cadomyr gibt es ein paar wenige. Galmair hat zu handeln, wenn es etwas von denen benötigt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Fish");
talkEntry:addResponse("Fishermen stay close to Cadomyr for obvious reasons. The same goes for Runewick as well. As for Galmair, be prepared for salted fish because the only way they get fish is through.");
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Fisch");
talkEntry:addResponse("Fischer können vor allem in Cadomyr gefunden werden, weil dort die besten Bedingungen zur Ausübung dieses Berufes bestehen. Auch in Runewick gibt es ein paar wenige. Galmair hat zu handeln, wenn es etwas von denen benötigt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Glass");
talkEntry:addTrigger("blow");
talkEntry:addResponse("Cadomyr has always been known for their glassblowers, if you are searching for a mentor. However, if you're looking for less competition perhaps you should make your way to Runewick. Now, as for Galmair, you won't find many glassblowers if my memory serves me right.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Glasbläser");
talkEntry:addTrigger("Glasblas");
talkEntry:addResponse("Glasbläser können vor allem in Cadomyr gefunden werden, weil dort die besten Bedingungen zur Ausübung dieses Berufes bestehen. Auch in Runewick gibt es ein paar wenige. Galmair hat zu handeln, wenn es etwas von denen benötigt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Digger");
talkEntry:addResponse("Diggers can always find clay and sand near Cadomyr. Then again, Galmair isn't a bad place either, but as for Runewick, the nearby land is no place for diggers.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gräber");
talkEntry:addResponse("Gräber können vor allem in Cadomyr gefunden werden, weil dort die besten Bedingungen zur Ausübung dieses Berufes bestehen. Auch in Galmair gibt es ein paar wenige. Runewick hat zu handeln, wenn es etwas von denen benötigt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Finesmith");
talkEntry:addResponse("Finesmiths are mainly found in Cadomyr, but you could also search in Galmair as well. Runewick, not so much, they import such wares.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Goldschmied");
talkEntry:addResponse("Goldschmiede können vor allem in Cadomyr gefunden werden, weil dort die besten Bedingungen zur Ausübung dieses Berufes bestehen. Auch in Galmair gibt es ein paar wenige. Runewick hat zu handeln, wenn es etwas von denen benötigt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gem");
talkEntry:addTrigger("grinder");
talkEntry:addResponse("The most precise gem grinders in the land are found in Cadomyr, but I have met a fair number in Galmair too. Don't expect much in Runewick though, they mainly depend onfor gems.");
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Edelstein");
talkEntry:addTrigger("schleifer");
talkEntry:addResponse("Edelsteinschleifer können vor allem in Cadomyr gefunden werden, weil dort die besten Bedingungen zur Ausübung dieses Berufes bestehen. Auch in Galmair gibt es ein paar wenige. Runewick hat zu handeln, wenn es etwas von denen benötigt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Blacksmith");
talkEntry:addResponse("Galmair is by far the best place to look for a good blacksmith, but if you find yourself near Cadomyr you should be able to locate one there as well. You'll have no such luck in Runewick though, because they mustfor such wares.");
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Schmied");
talkEntry:addResponse("Schmiede können vor allem in Galmair gefunden werden, weil dort die besten Bedingungen zur Ausübung dieses Berufes bestehen. Auch in Cadomyr gibt es ein paar wenige. Runewick hat zu handeln, wenn es etwas von denen benötigt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Brick");
talkEntry:addResponse("Ah, if looking for a brick maker you'd best start in Galmair. If you can't find one there, Cadomyr might have one or two as well. As for Runewick it won't be the best place to find bricks, I assure you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ziegel");
talkEntry:addResponse("Ziegelmacher können vor allem in Galmair gefunden werden, weil dort die besten Bedingungen zur Ausübung dieses Berufes bestehen. Auch in Cadomyr gibt es ein paar wenige. Runewick hat zu handeln, wenn es etwas von denen benötigt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Mason");
talkEntry:addResponse("Galmair for sure, but you might be able to find a mason in Cadomyr too. Runewick not so much, although you might be able to organise a.");
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Metz");
talkEntry:addResponse("Steinmetze können vor allem in Galmair gefunden werden, weil dort die besten Bedingungen zur Ausübung dieses Berufes bestehen. Auch in Cadomyr gibt es ein paar wenige. Runewick hat zu handeln, wenn es etwas von denen benötigt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Miner");
talkEntry:addResponse("You'll find a slew of miners in Galmair. Otherwise, head toward Cadomyr if you're looking for less competition. As for Runewick, never seen a miner there, but you might be able to make a.");
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Schürf");
talkEntry:addResponse("Schürfer können vor allem in Galmair gefunden werden, weil dort die besten Bedingungen zur Ausübung dieses Berufes bestehen. Auch in Cadomyr gibt es ein paar wenige. Runewick hat zu handeln, wenn es etwas von denen benötigt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Brewer");
talkEntry:addResponse("Galmair without question, they have the finest brewers near and wide, but if Galmair isn't the place for you the next best place is Runewick. Not aware of a brewer in Cadomyr, I think they mayfor their mead.");
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Brauer");
talkEntry:addResponse("Brauer können vor allem in Galmair gefunden werden, weil dort die besten Bedingungen zur Ausübung dieses Berufes bestehen. Auch in Runewick gibt es ein paar wenige. Cadomyr hat zu handeln, wenn es etwas von denen benötigt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("elf");
talkEntry:addTrigger("elves");
talkEntry:addResponse("If it's elves you seek, best to head toward Runewick.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("elf");
talkEntry:addTrigger("elves");
talkEntry:addResponse("Elfen können vorallem in Runewick gefunden werden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("human");
talkEntry:addResponse("Humans, hmm, can't think of a single place without humans. Many go to Cadomyr, actually.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mensch");
talkEntry:addResponse("Menschen können überall gefunden werden. Die meisten gehen allerdings nach Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dwarf");
talkEntry:addTrigger("dwarves");
talkEntry:addResponse("Dwarves are mainly found in Galmair.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("zwerg");
talkEntry:addResponse("Zwerge können vorallem in Galmair gefunden werden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("orc");
talkEntry:addResponse("Orcs are mainly found in Galmair, traveler.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ork");
talkEntry:addResponse("Orks können vorallem Galmair gefunden werden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("lizard");
talkEntry:addResponse("Cadomyr is where you will find the majority of the lizardmen population.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("echse");
talkEntry:addResponse("Echsenmenschen können vorallem in Cadomyr gefunden werden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("halbling");
talkEntry:addTrigger("halfling");
talkEntry:addResponse("We halflings certainly like Runewick, no better place in my opinion.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("halbling");
talkEntry:addTrigger("halfling");
talkEntry:addResponse("Halblinge wie ich es einer bin können vorallem in Runewick gefunden werden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addResponse("He is a wise elf that rules over Runewick. In fact, I hear he was an Archmage in Lor-Angur; he is very good with magic. He is very wise and gives good advice; I recommend you speak with him and listen closely!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Er ist der Herrscher über Runewick. Da er Erzmagier und ein Elf aus Lor-Angur ist, ist er sehr geschult in der Magie. Er ist sehr weise und gibt gute Ratschläge und ich kann dir empfehlen diese auch zu befolgen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("He is a wise elf that rules over Runewick. In fact, I hear he was an Archmage in Lor-Angur; he is very good with magic. He is very wise and gives good advice; I recommend you speak with him and listen closely!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Er ist der Herrscher über Runewick. Da er Erzmagier und ein Elf aus Lor-Angur ist, ist er sehr gut in Magie. Er ist sehr weise und gibt gute Ratschläge und ich kann dir empfehlen diese auch zu befolgen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Runewick has four towers that loom over the land in the southeast. If you follow the path correctly you will have to cross a long narrow bridge and from there you should see the towers easily. They believe in wisdom and above all the advice of their Archmage, Elvaine Morgan.");
talkEntry:addResponse("Their rivals from Cadomyr and Galmair call them arrogant smartasses who claim to know it all and try to keep a self-defined 'balance'. Don't ask me what all that means.");
talkEntry:addResponse("Ah, Runewick, you should expect to find many types of craftsmen in that wondrous place: Alchemists, candle makers, carpenters, lumberjacks, cooks, bakers, farmers, herb gatherers, tailors, tanners and dyers.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Runewick hat vier Türme und kann im Südosten gefunden werden. Du musst zudem eine lange schmale Brücke überqueren. Sie glauben an Weisheit und den Rat ihres Erzmagier Elvaine Morgan.");
talkEntry:addResponse("Ihre Rivalen aus Cadomyr und Galmair nennen sie arrogante Besserwisser, welche behaupten alles zu wissen und versuchen ein selbst definiertes 'Gleichgewicht' zu erhalten. Frag mich nicht, was das heißen soll.");
talkEntry:addResponse("Insbesondere folgende Handwerke können in Runewick gefunden werden: Alchemisten, Kerzenmacher, Schreiner, Holzfäller, Koch, Bäcker, Bauer, Kräutersammler, Schneider, Gerber und Färber.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("He is the son of Don Tommaso, and since his father's death Valerio has ruled over Galmair. He is a very strong dwarf with considerable wealth. I have heard rumors that he is easily offended, and on more than one occasion has sent armoured guards to settle his scores.");
talkEntry:addResponse("Galmair has always been known for its working class: Blacksmiths, brick makers, masons, miners, and brewers.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Er ist der Herrscher von Galamair und Nachfolger von seinem Vater. Er ist ein sehr starker Zwerg und ist auch sehr reich. Es ist besser ihn nicht zu verärgern, da er sonst speziell für dich Kopfgeldjäger anheuern wird.");
talkEntry:addResponse("Insbesondere folgende Handwerke können in Galmair gefunden werden: Schmied, Ziegelmacher, Steinmetz, Schürfer, Brauer.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Galmair is located in the northwest and it consists of several halls and caves - very deep and amazing caves! With enough wealth you can become anything!");
talkEntry:addResponse("Their rivals from Runewick and Cadomyr call them greedy and chaotic. They assume that people from Galmair would do anything to earn a coin.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Galmair ist irgendwo im Nordwesten und es besteht aus mehreren Hallen und Höhlen. Sehr tiefe und beeindruckende Höhlen. Wie dem auch sei, du kannst dort alles bekommen was du möchtest, solange du genügend Geld hast.");
talkEntry:addResponse("Bei ihren Rivalen aus Runewick und Cadomyr sind sie als gierig und chaotisch verschrien. Sie nehmen an, dass Leute aus Galmair alles für eine Handvoll dreckiger Münzen tun würden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("queen");
talkEntry:addResponse("The Queen of Cadomyr? Her name is Rosaline Edwards, but don't let her beauty fool you, she is a proud and noble ruler. It's well known that she is of Albarian heritage, but be prepared as she doesn't govern in quite the same manner. She is, however, a devout follower of Malachín and is always on the lookout for valiant warriors and hunters!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("königin");
talkEntry:addResponse("Diese durchaus sehr schöne Frau ist die Königin von Cadomyr. Sie ist sehr stolz und edel. Außerdem mag sie solche die tapfer agieren und ihren Mut in Schlachten zeigen. Ihre albarische Wurzeln sind wahrscheinlich der Grund für ihre Vorliebe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Ah, Rosaline Edwards, she is the fair Queen of Cadomyr. It's well known that she is of Albarian heritage, but be prepared as she doesn't govern in quite the same manner. She is, however, a devout follower of Malachín and is always on the lookout for valiant warriors and hunters!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addResponse("Diese durchaus sehr schöne Frau ist die Königin von Cadomyr. Sie ist sehr stolz und edel. Außerdem mag sie solche die tapfer agieren und ihren Mut in Schlachten zeigen. Ihre albarische Wurzeln sind wahrscheinlich der Grund für ihre Vorliebe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Cadomyr can be found nestled behind its formidable town walls in the midst of the desert to the southwest of this peninsula. They believe in honour and follow their queen's orders without hesitation or fear.");
talkEntry:addResponse("Cadomyr is the desert town to the southwest, just look for the high town walls. If you should venture there be prepared to follow the Queen's social order. In Runewick they just call it the town of wannabe heroes!");
talkEntry:addResponse("Cadomyr, the desert bastion for fishermen, glass blowers, diggers, finesmiths, and gem grinders alike lies to the southwest behind massive stone walls!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Cadomyr kann hinter einen großen Stadtmauer in der Wüste im südwestlichen Bereich der Halbinsel gefunden werden. Sie glauben dort an Ehre und ihre Königin, und sie sind ein sehr stolzes und furchtloses Volk.");
talkEntry:addResponse("Ihre Rivalen aus Runewick und Galmair denken, dass Cadomyr ein Ort für von Möchtegernhelden sei, welche einem verrückten Kodex der Ehre folgen und wo jeder weiß, welchen gottgegebenen 'Rang' er einnimmt.");
talkEntry:addResponse("Insbesondere folgende Handwerke können in Cadomyr gefunden werden: Fischer, Glasblässer, Gräber, Goldschmied, Edelsteinschleifer.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("albar");
talkEntry:addResponse("Albar is a very old empire with a hierarchical social order. The society of Cadomyr is to some extent similar to it, but you can't fully compare the two. It is well known that the queen's family is originally from there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("Ein sehr altes Reich mit einer sehr hierarchischen Ordnung ihrer Gesellschaft. Die Gesellschaft von Cadomyr ähnelt ihr, kann aber nicht wirklich damit verglichen werden. Die Familie der Königin hat ihre Wurzeln dort.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addResponse("Gynk is a chaotic place, where almost anything is possible as long as you can manage to survive. Galmair is very similar, probably due to the fact that the Don's father is from Gynk.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("Gynk ist ein sehr chaotischer Platz, wo beinahe alles möglich ist solange man es schafft zu überleben. Galmair ist sehr ähnlich. Wahrscheinlich liegt das daran, dass der Vater des Don aus Gynk kam.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Salkamar one of the three largest cities in all of Illarion, and although it is close to Gynk and Albar it's more closely related to the magical city of Lor-Angur. Many of its social influences can be seen in Runewick, mainly, due to the fact that Elvaine Morgan was once the Archmage there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Es ist neben Gynk und Albar das dritte große Reich und hat eine sehr enge Beziehung zu Lor-Angur, der Heimatstadt vom Herrscher von Runewick, Elvaine Morgan.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("angur");
talkEntry:addResponse("That is the distant magical city of wonder and lore. Much of its ways can be seen in Runewick because Archmage Elvaine Morgan is from there. I wonder if he is working on getting that fifth tower like Lor-Angur?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("angur");
talkEntry:addResponse("Das ist eine sehr berühmte und ferne Stadt von Magiern und es ist die Heimatstadt des Herrschers von Runewick, Erzmagier Elvaine Morgan. Die haben sogar einen fünften Turm.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("Inhabitants of every realm prefer specific younger gods for the most part. In Runewick they pray to Elara, Oldra, and Adron; in Galmair they pray to Irmorom, Ronagan, and Nargùn; and in Cadomyr they honour Malachín, Zhambra and Sirani.");
talkEntry:addResponse("Most inhabitants vary between the younger and elder gods. You will find that most everyone worships one of the younger gods within their preferred realm, but rarely does anyone still worship the elder gods. Where will your prayers go?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Die Einwohner jeder Fraktion bevorzugen spezifische junge Götter. In Runewick beten sie zu Elara, Oldra und Adron; in Galmair zu Irmorom, Ronagan und Nargùn; und in Cadomyr zu Malachín, Zhambra and Sirani.");
talkEntry:addResponse("Wir unterscheiden zwischen jungen und alten Göttern. Du wirst für beinahe jeden der Jungen einen Gleichgesinnten in einem der Reichen finden, aber kaum jemand für die Älteren.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("elder");
talkEntry:addResponse("The elder gods are Brágon, Eldan, Findari, Tanora, and Ushara. Only some nostalgic and disconcerted elves honour them, but that behavior is silly to me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("alten");
talkEntry:addResponse("Die alten Götter sind Brágon, Eldan, Findari, Tanora und Ushara. Nur nostalgische und verwirrte Elfen verehren sie, komisch, oder?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("younger");
talkEntry:addResponse("The younger gods are Nargùn, Elara, Adron, Oldra, Cherga, Malachín, Irmorom, Sirani, Zhambra, Ronagan, and Moshran. Most realms are shaped and molded by the gods they follow. I follow Elara!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("junge");
talkEntry:addResponse("Die jungen Götter sind Nargùn, Elara, Adron, Oldra, Cherga, Malachín, Irmorom, Sirani, Zhambra, Ronagan und Moshran. Einige Reiche glauben an den einen, andere Reiche an die anderen. Ich glaube an Elara. Und du?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Adron");
talkEntry:addResponse("He is the god of festivities and wine, his followers can be found mostly in Runewick. So if you follow his teachings as well you will find like-minded people there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Adron");
talkEntry:addResponse("Er ist des Weines und der Feste und einige Anhänger können in Runewick gefunden werden. Wenn du an ihn glaubst, dann wirst du dort Gleichgesinnte finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addResponse("He is one of the elder gods. He will not help you at all and it makes no sense to worship him. Only nostalgic and disconcerted Elves still do, so don't bother. However, he is known as the god of fire.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addResponse("Er ist einer der alten Götter. Er wird dir nicht helfen und es macht keinen Sinn ihm zu dienen. Nur nostalgische und verwirrte Elfen tun das noch. Wie dem auch sei, er ist bekannt als der Gott des Feuers.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cherga");
talkEntry:addResponse("She is the goddess of spirits and the underworld. No one in particular worships her, except those who think they will be traveling to her realm soon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addResponse("Sie ist die Göttin der Geister und der Unterwelt. Niemand besonderes dient ihr, außer jene, welche denken, sie bald zu besuchen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elara");
talkEntry:addResponse("She is the goddess of wisdom and knowledge, most consider her the patron god of Runewick. So if you follow her teachings you will find like-minded people there. Perhaps I will see you in Runewick since she is my goddess!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elara");
talkEntry:addResponse("Sie ist die Göttin des Wissens und der Weisheit und einige Anhänger können in Runewick gefunden werden. Wenn du an sie glaubst, dann wirst du dort Gleichgesinnte finden, so wie ich, weil ich ja auch an Elara glaube.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Eldan");
talkEntry:addResponse("He is one of the elder gods. Don't bother to worship him. Only nostalgic Elves still do so anyway. If you're still wondering about him though, he is known as the god of spirit.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eldan");
talkEntry:addResponse("Er ist einer der alten Götter. Er wird dir nicht helfen und es macht keinen Sinn ihm zu dienen. Nur nostalgische und verwirrte Elfen tun das noch. Wie dem auch sei, er ist bekannt als der Gott des Geistes.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Findari");
talkEntry:addResponse("She is one of the elder gods. There is no point in knowing about her. Alright, alright if you must know she is the goddess of air.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Findari");
talkEntry:addResponse("Sie ist eine der alten Götter. Sie wird dir nicht helfen und es macht keinen Sinn ihr zu dienen. Nur nostalgische und verwirrte Elfen tun das noch. Wie dem auch sei, sie ist bekannt als der Gott der Luft.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("He is the god ofand craftsmanship. Most of his followers can be found in Galmair. So if you believe in him, as the dwarves do, then you will find like-minded people there.");
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("Er ist des Handels und des Handwerks und einige Anhänger können in Galmair gefunden werden. Wenn du an ihm glaubst, dann wirst du dort Gleichgesinnte finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addResponse("He is the god of battle and hunting. So if you are seeking the thrill of the hunt or glory in battle you best be on your way to Cadomyr, and I will pray that you live past a week!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addResponse("Er ist der Gott der Jagd und der Schlachten und einige Anhänger können in Cadomyr gefunden werden. Wenn du an ihm glaubst, dann wirst du dort Gleichgesinnte finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Moshran");
talkEntry:addResponse("He is the unnamed one, also called the Milkspiller, who suffered a sickness in his belly from an old cake he had stolen from Nargùn. The cake was actually baked by Nargùn in order to poison and kill a giant. But I won't say anymore about him.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Moshran");
talkEntry:addResponse("Er ist der Ungenannte, den man auch den Milchversaurer nennt, der sich den Magen an einem alten Kuchen verdarb, den er Nargun gestohlen hatte, welcher damit eigentlich einen Riesen hatte vergiften wollte. Und mehr sag ich nicht dazu.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addTrigger("Nargùn");
talkEntry:addResponse("He is the god of chaos and the trickiest of tricksters I assure you! There is no better place to find his followers than in Galmair. Be warned though, I wouldn't try to play any tricks on the Don... he might try and end you!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addTrigger("Nargùn");
talkEntry:addResponse("Er ist der Gott des Chaos und einige Anhänger können in Galmair gefunden werden. Wenn du an ihm glaubst, dann wirst du dort Gleichgesinnte finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("She is the goddess of life and fertility! Many of her followers call Runewick home because the soil is rich and the harvest is grand. I go there often to fatten my belly!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("Sie ist die Göttin der Fruchtbarkeit und des Lebens und einige Anhänger können in Runewick gefunden werden. Wenn du an sie glaubst, dann wirst du dort Gleichgesinnte finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("He is the god of thieves and shadows; only Galmair openly worships this god as far as I know. Most others like me only pray to him for safe travel, and I'll do just that for you if your are off to Galmair!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("Er ist der Gott der Diebe und der Schatten und einige Anhänger können in Galmair gefunden werden. Wenn du an ihm glaubst, dann wirst du dort Gleichgesinnte finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("She is the goddess of love and pleasure. I have heard that many travel to Cadomyr in search of love and, well, other things. May you find your true mate if you're bound for Cadomyr!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("Sie ist die Göttin der Liebe und der Freude und einige Anhänger können in Cadomyr gefunden werden. Wenn du an sie glaubst, dann wirst du dort Gleichgesinnte finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("She is the only elder god that is worth mentioning. Her followers are mainly the lizardmen, but don't take her lightly, for many of them regard her with strict devotion and pride. Since she is an elder god the elves honour her too. If you haven't guessed it yet she is the goddess of water!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("Sie ist die einzige der alten Götter, die man kennen sollte. Sie dir nicht helfen und es macht keinen Sinn ihr zu dienen. Nur nostalgische und verwirrte Elfen und Echsen tun das noch. Wie dem auch sei, sie ist die Göttin des Wasser.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("She is one of the elder gods. I wouldn't even bother remembering her name if I were you. Only nostalgic and disconcerted Elves still do anyway. However, if you must know she is known as the god of earth.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("Sie ist eine der alten Götter. Sie wird dir nicht helfen und es macht keinen Sinn ihr zu dienen. Nur nostalgische und verwirrte Elfen tun das noch. Wie dem auch sei, sie ist die Göttin der Erde.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Zhambra");
talkEntry:addResponse("He is the god of friendship and loyalty, and many of his followers can be found in Cadomyr. If such noble things are what you are seeking I wish you well and safe travels!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zhambra");
talkEntry:addResponse("Er ist der Freundschaft und Treue und einige Anhänger können in Cadomyr gefunden werden. Wenn du an ihm glaubst, dann wirst du dort Gleichgesinnte finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("All I have is information about the realms, and I'll give that to you for free!");
talkEntry:addResponse("I'm sorry, but I don't sell anything. Ask me about the realms instead.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Von mir bekommst du Informationen über die Reiche und die sind umsonst!");
talkEntry:addResponse("Tut mir leid, aber ich verkaufe nichts. Frag mich doch was über die Reiche.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("All I have is information about the realms, and I'll give that to you for free!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Von mir bekommst du Informationen über die Reiche und die sind umsonst!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Viola");
talkEntry:addTrigger("Baywillow");
talkEntry:addResponse("That's me! If your after information about the realms look no further!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Viola");
talkEntry:addTrigger("Baywillow");
talkEntry:addResponse("Das bin ich und ich weiß viele wichtige Dinge über die Reiche.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".*");
talkEntry:addResponse("I don't quite understand, sorry. Just ask me for help and I'll see what I can do for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addResponse("Das habe ich jetzt nicht richtig verstanden. Frag mich einfach nach Hilfe und ich schau, was ich für dich tun kann.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("Frag mich nach 'Hilfe', wenn du Hilfe brauchst.", "Ask me for 'help', if you need assistance.");
talkingNPC:addCycleText("Frag mich wenn du was über die drei Reiche wissen möchtest.", "Tell me if you'd like to know something specific about three realms.");
talkingNPC:addCycleText("Runewick, Galmair, Cadomyr... ich weiß alles. Fast alles.", "Runewick, Galmair, Cadomyr... I know everything. Almost.");
talkingNPC:addCycleText("Frage immer nach Aufgaben, vielleicht hat einer eine für dich und es gibt etwas für dich zu verdienen.", "Hiho, traveler! Keep on the lookout if you're in search for tasks or grand quests! All across the land many are in need, don't be afraid to ask!");
talkingNPC:addCycleText("Ob Königin Rosaline Edwards, Don Valerio Guilianni, oder Erzmagier Elvaine Morgan... Ich weiß alles über sie. Fast alles.", "Queen Rosaline Edwards, Don Valerio Guilianni, or Archmage Elvaine Morgan... learn all you need to know right here! Well, just about everything.");
talkingNPC:addCycleText("Wenn du nicht weißt wohin du gehen sollst, frag mich nach Hilfe.", "Don't get lost! I'm Viola, the local guide, ask me for help, and I won't let you down!");
talkingNPC:addCycleText("Wenn du wissen möchtest wo du und dein Glaube gut aufgehoben sind, frage mich nach Hilfe.", "If you'd like to know where you and your faith are welcome, tell me your god and I'll tell you the best realm to join!");
talkingNPC:addCycleText("Ob Elf, Zwerg, Mensch, Ork, Echsenmensch oder Halbling, ich weiß für jeden den richtigen Platz.", "Whether you are an elf, dwarf, human, orc, lizardman, or halfling, I know the right place for everyone!");
mainNPC:addLanguage(0);
mainNPC:addLanguage(5);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Das ist deine Tutorin Viola Baywillow.", "This is your tutorial guide Viola Baywillow.");
mainNPC:setUseMessage("Finger weg!", "Do not touch me!");
mainNPC:setConfusedMessage("Bitte wechsle die Sprache deines Charakters zur Gemeinsprache mit dem Befehl '!l common'.", "Please switch the language of your character to the common tongue with the command '!l common'.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 803);
mainNPC:setEquipment(11, 0);
mainNPC:setEquipment(5, 0);
mainNPC:setEquipment(6, 40);
mainNPC:setEquipment(4, 2295);
mainNPC:setEquipment(9, 34);
mainNPC:setEquipment(10, 369);
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
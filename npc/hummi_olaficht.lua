--------------------------------------------------------------------------------
-- NPC Name: Hummi Olaficht                                              None --
-- NPC Job:  none                                                             --
--                                                                            --
-- NPC Race: halfling                   NPC Position:  210, 140, 0            --
-- NPC Sex:  male                       NPC Direction: south                  --
--                                                                            --
-- Author:   envi                                                             --
--                                                                            --
-- Last parsing: November 22, 2010                       easyNPC Parser v1.02 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (2, 210, 140, 0, 4, 'Hummi Olaficht', 'npc.hummi_olaficht', 0, 2, 5, 254, 14, 1, 245, 180, 137);
---]]

require("npc.base.basic")
require("npc.base.condition.chance")
require("npc.base.condition.language")
require("npc.base.condition.race")
require("npc.base.consequence.inform")
require("npc.base.talk")
module("npc.hummi_olaficht", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Hummi Olaficht. He can give you some information about what you can find here. Keyphrases: faction, gods, race, craft, motive, landscape, leader, law"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Hummi Olaficht. Er kann dir einige Informationen geben über Dinge die du hier finden kanns. Schlüsselwörter: Fraktion, Götter, Rassen, Handwerk, Motive, Landschaft, Anführer, Gesetz."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hello");
talkEntry:addTrigger("Greetings");
talkEntry:addTrigger("Be greeted");
talkEntry:addTrigger("Greet");
talkEntry:addTrigger("Hail");
talkEntry:addTrigger("Good day");
talkEntry:addTrigger("Good morning");
talkEntry:addTrigger("Good evening");
talkEntry:addResponse("Hiho.");
talkEntry:addResponse("Hello.");
talkEntry:addResponse("Hi.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Grüße");
talkEntry:addTrigger("Gruß");
talkEntry:addTrigger("Seid gegrüßt");
talkEntry:addTrigger("Guten Tag");
talkEntry:addTrigger("Guten Abend");
talkEntry:addTrigger("Mahlzeit");
talkEntry:addTrigger("Tach");
talkEntry:addTrigger("Moin");
talkEntry:addTrigger("mit dir");
talkEntry:addResponse("Hiho.");
talkEntry:addResponse("Hallo.");
talkEntry:addResponse("Hi.");
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
talkEntry:addResponse("Hiho.");
talkEntry:addResponse("Hello.");
talkEntry:addResponse("Hi.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greebas");
talkEntry:addTrigger("Greebs");
talkEntry:addResponse("Hiho.");
talkEntry:addResponse("Hallo.");
talkEntry:addResponse("Hi.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Good bye");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare thee well");
talkEntry:addResponse("Fare thee well.");
talkEntry:addResponse("Bye.");
talkEntry:addResponse("Good bye.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehabt euch wohl");
talkEntry:addResponse("Mach's gut.");
talkEntry:addResponse("Tschüß.");
talkEntry:addResponse("Wiedersehen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addTrigger("See you");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Fare thee well.");
talkEntry:addResponse("Bye.");
talkEntry:addResponse("Good bye.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Mach's gut.");
talkEntry:addResponse("Tschüß.");
talkEntry:addResponse("Wiedersehen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("I'm fine. And you?");
talkEntry:addResponse("I feel wonderful.");
talkEntry:addResponse("I cannot complain.");
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
talkEntry:addResponse("I'm Hummi and know all important things about this place here. So, ask me about it!");
talkEntry:addResponse("I'm Hummi. And you? Do you like to know something?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Ich bin Hummi und weiß alle wichtigen Dinge über diesen Platz hier. So, frag mich was!");
talkEntry:addResponse("Ich bin Hummi und du? Möchtest du etwas wissen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("You get only information from me and those are free!");
talkEntry:addResponse("I'm sorry, but I don't sell anything.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Von mir bekommst du nur Informationen, und die sind umsonst!");
talkEntry:addResponse("Tut mir leid, aber ich verkaufe nichts.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("You get only information from me and those are free!");
talkEntry:addResponse("I'm sorry, but I don't sell anything.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Von mir bekommst du nur Informationen, und die sind umsonst!");
talkEntry:addResponse("Tut mir leid, aber ich verkaufe nichts.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("I don't have any specific profession.");
talkEntry:addResponse("I only tell information, but I don't have any profession actually.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Ich habe keine spezifische Arbeit.");
talkEntry:addResponse("Ich gebe lediglich Informationen, aber ich habe nicht wirklich einen Beruf.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I don't have any specific profession.");
talkEntry:addResponse("I only tell information, but I don't have any profession actually.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Ich habe keine spezifische Arbeit.");
talkEntry:addResponse("Ich gebe lediglich Informationen, aber ich habe nicht wirklich einen Beruf.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("This in an old island, which does not exist anymore. Many who you can find here, are from this island. If you like know more about it, feel free to ask them.");
talkEntry:addResponse("I haven't been there, therefore I cannot tell you anything about it except that it doesn't exist anymore and that you can ask other people about it.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Das ist eine alte Insel, welche nicht mehr existiert. Viele die du hier finden kann sind von dort. Wenn du mehr darüber wissen möchtest, frag sie.");
talkEntry:addResponse("Ich war noch nie dort, daher weiß ich auch nichts über sie, außer dass es sie nicht mehr gibt und dass du andere Leute über sie fragen kannst.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("I am");
talkEntry:addTrigger("my name");
talkEntry:addResponse("Sounds pretty nice, but not as my name. *giggles*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ich bin");
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Klingt hübsch, aber nicht so hübsch wie mein Name. *kichert*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("faction");
talkEntry:addResponse("We have there factions here. Runewick, Cadomyr and Galmair. If you like to know more about one of these factions, say the name.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("race");
talkEntry:addResponse("In every faction are specific races to find. In Runewick you can mainly find Elves and Halflings; in Galmair Dwarves and in Cadomyr Lizards and Orcs. Humans can be found everywhere.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("craft");
talkEntry:addResponse("Which one do you mean? Alchemist, Candle maker, Carpenter, Lumberjack, Cook, Baker, Farmer, Herb gatherer, Tailor, Tanner, Dyer, Blacksmith, Brick maker, Mason, Miner, Brewer, Fisher, Glass blower, Digger, Finesmith or Gem grinder?");
talkEntry:addResponse("Every faction is specialist on specfic crafts. Mention a specific craft and I will tell you in which fraction you will find it.");
talkEntry:addResponse("The main crafts of Runewick are Alchemist, Candle maker, Carpenter/Lumberjack, Cook/Baker, Farmer, Herb gatherer, Tailor/Tanner/Dyer; in Galmair Blacksmith, Brick maker, Mason, Miner, Brewer; and in Cadomyr Fisher, Glass blower, Digger, Finesmith, Gem grinder");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("motive");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("The leading motive in Runewick is wisdom, in Cadomyr honour, and in Galmair wealth.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("landscape");
talkEntry:addResponse("The four towers of Runewick are somewhere in the southeast between meadows and forests; the halls and caves of Galmair in the northwest between mountains and forests; and the houses of Cadomyr in the west between a desert and mountains.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("leader");
talkEntry:addResponse("Archmage Elvaine Morgan is the leader of Runewick, Don Valerio Guilianni rules in Galmair, and Queen Rosaline Edwards in Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("law");
talkEntry:addResponse("Runewick is the only community with exact laws you can rely on; Galmair doesn't have real laws - you just have to obey the Don; and there are customs in Cadomyr which are of albarian origin, but to an albarian, they will look shocking innovative. More information can be found in their towns.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Fraktion");
talkEntry:addResponse("Wir haben hier drei Fraktionen. Runewick, Cadomyr und Galmair. Wenn du mehr über eine der drei Faktionen wissen möchtest, dann sag den Namen der Fraktion.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Rasse");
talkEntry:addResponse("In jeder Fraktion kannst du spezifische Rassen finden. In Runewick vorallem Elfen und Halblinge; in Galmair Zwerge; und in Cadomyr Orks und Echsenmenschen. Menschen sind überall zufinden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Handwerk");
talkEntry:addResponse("Welches meinst du? Alchemist, Kerzenmacher, Schreiner, Holzfäller, Koch, Bäcker, Bauer, Kräutersucher, Schneider, Gerber, Färber, Schmied, Ziegelmacher, Steinmetz, Schürfer, Brauer, Fischer, Glasbläser, Gräber, Goldschmied oder Edelsteinschleifer?");
talkEntry:addResponse("Jede Fraktion ist auf bestimmte Handwerke spezialisiert. Nenn mir dein Handwerk und ich sag in welcher Fraktion du es finden wirst.");
talkEntry:addResponse("");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Motive");
talkEntry:addResponse("Das leitende Motive in Runewick ist Weisheit, in Galmair ist es Reichtum, und in Cadomyr ist es `Ehre.");
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
talkEntry:addResponse("Erzmagier Elvaine Morgan der Herrscher in Runewick, Don Valerio Guilianni herrscht in Galmair, und Königin Rosaline Edwards in Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gesetz");
talkEntry:addResponse("Runewick ist die einzige Gemeinde mit exakten Gesetzen an denen du dich orientieren kannst; Galmair hat keine wirklichen Gesetzte - du musst nur dem Don gehorchen; und dann sind noch die Bräuche von Cadomyr welche ihren Ursprung in Albar haben, aber für einen Albarianer sind diese schockierend innovative.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addResponse("He is the ruler of Runewick. Due to he is an Archmage and elf from Lor-Angur, he is very good in magic. *claps his hands* Nice fireworks! He is very wise and gives good advices. I recommend you to accept his advice.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Er ist der Herrscher über Runewick. Da er Erzmagier und ein Elf aus Lor-Angur ist, ist er sehr gut in Magie. *klatscht in die Hände* Hübsche Feuerwerke! Er ist sehr weise und gibt gute Ratschläge und ich kann dir empfehlen diese auch zu befolgen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("He is the ruler of Runewick. Due to he is an Archmage and elf from Lor-Angur, he is very good in magic. *claps his hands* Nice fireworks! He is very wise and gives good advices. I recommend you to accept his advice.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Er ist der Herrscher über Runewick. Da er Erzmagier und ein Elf aus Lor-Angur ist, ist er sehr gut in Magie. *klatscht in die Hände* Hübsche Feuerwerke! Er ist sehr weise und gibt gute Ratschläge und ich kann dir empfehlen diese auch zu befolgen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Runewick has four towers and can be found in the southeast. You will have to cross a long small bridge there. However, they believe in wisdom and in the advice of their Archmage Elvaine Morgan.");
talkEntry:addResponse("Their opponents from Cadomyr and Galmair call them arrogant smartasses who claim to know it all and try to keep a self defined 'balance?. Don?t ask me what that is.");
talkEntry:addResponse("Primarily following crafts can be found in Runewick: Alchemist, Candle maker, Carpenter/Lumberjack, Cook/Baker, Farmer, Herb gatherer, Tailor/Tanner/Dyer.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Runewick hat vier Türme und kann im Südosten gefunden werden. Du musst eine lange schmalle Brücke zudem überqueren. Sie glauben zudem an Weisheit und den Rat ihres Erzmagier Elvaine Morgan.");
talkEntry:addResponse("Ihre Gegner aus Cadomyr und Galmair nennen sie arrogante Klugscheißer, welche behaupten alles zu wissen und versuchen eine selbst definierte 'Balance' zu halten. Frag mich nicht, was da ist.");
talkEntry:addResponse("Insbesondere folgende Handwerke können in Runewick gefunden werden: Alchemist, Kerzenmacher, Schreiner/Holzfäller,  Koch/Bäcker, Bauer, Kräutersammler, Schneider/Gerber/Färber.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("He is the ruler of Galmair and the successor his father. He is a very strong dwarf and is very rich. Therefore it is better not to bother him, otherwise he will hire some headhunters who will visit you. *giggles*");
talkEntry:addResponse("Primarily following crafters can be found in Galmair: Blacksmith, Brick maker, Mason, Miner, Brewer.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Er ist der Herrscher von Galamair und Nachfolger von seinem Vater. Er ist ein sehr starker Zwerg und ist auch sehr reich. Es ist besser ihn nicht zu verärgern, da er sonst speziell für dich Kopfgeldjäger anheuert wird. *kichert*.");
talkEntry:addResponse("Insbesondere folgende Handwerke können in Galmair gefunden werden: Schmied, Ziegelmacher, Steinmetz, Schürfer, Brauer.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Galmair is somewhere in the northwest and it consists several halls and caves. Very deep and amazing caves! However, you can become there whatever you want as long you have enough money. ");
talkEntry:addResponse("There opponents from Runewick and Cadomyr call them greedy and chaotic. They assume that people from Galmair would do everything what they can to get some extra coins.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Galmair ist irgendwo im Nordwesten und es besteht aus mehreren Hallen und Höhlen. Sehr tiefe und beeindruckende Höhlen. Wie dem auch sei, du kannst dort alles bekommen was du möchtest, solange du genügend Geld hast.");
talkEntry:addResponse("Bei ihren Gegner aus Runewick und Cadomyr  sind sie als gierig und chaotisch verschrien.  Die nehmen an, dass Leute aus Galmair würden alles für einige zusätzliche Münzen tun.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("queen");
talkEntry:addResponse("This very pretty woman is the Queen of Cadomyr. She is very proud and noble. Further, she likes those who act bravery and show their courage in battles. Her albarian orgin is probably the reason for her liking.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("königin");
talkEntry:addResponse("Diese durchaus sehr schöne Frau ist die Königin von Cadomyr. Sie ist sehr stolz und nobel. Außerdem mag sie solche die tapfer agieren und ihren Mut in Schlachten zeigen. Ihre alabarische Wurzeln sind wahrscheinlich der Grund für ihre Vorliebe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("This very pretty woman is the Queen of Cadomyr. She is very proud and noble. Further, she likes those who act bravery and show their courage in battles. Her albarian orgin is probably the reason for her liking.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addResponse("Diese durchaus sehr schöne Frau ist die Königin von Cadomyr. Sie ist sehr stolz und nobel. Außerdem mag sie solche die tapfer agieren und ihren Mut in Schlachten zeigen. Ihre alabarische Wurzeln sind wahrscheinlich der Grund für ihre Vorliebe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Cadomyr can be found behind a huge townwall in the desert in the southwestern area of this peninsula. They believe in honour and in their queen, and they are a very proud folk that does not fear anything.");
talkEntry:addResponse("Their opponents from Runewick and Galmair think about Cadomyr as place of wannabe heroes who follow strange codes of honour and where everyone is supposed to know his 'rank', given by the gods.");
talkEntry:addResponse("Primarily following crafters can be found in Cadomyr: Fisher, Glass blower, Digger, Finesmith, Gem grinder.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Cadomyr kann hinter einen großen Stadtmauer in der Wüste im südwestlichen Bereich der Halbinsel gefunden werden. Sie glauben dort an Ehre und ihre Königin, und sie sind ein sehr stolzen und furchtloses Volk .");
talkEntry:addResponse("Ihre Gegner aus Runewick und Galmair denken, dass Cadomyr  ein Platz von möchte gern Helden sei, welche einem verrückten Kode der Ehre folgen und wo jeder weiß, welchen gottgegebenen 'Rang' er einnimmt.");
talkEntry:addResponse("Insbesondere folgende Handwerke können in Cadomyr gefunden werden: Fischer, Glasblässer, Gräber, Goldschmied, Edelsteinschleifer.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("A very old empire with a very hierarchical social order of their society. The society of Runewick is to some extant similar to it, but you can?t compare them. The family of the queen is original from there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("Ein sehr altes Reich mit einer sehr hierarchischen gesellschaftlichen Ordnung ihrer Gesellschaft. Die Gesellschaft von Runewick ähnelt ihr, kann aber nicht wirklich damit verglichen werden. Die Familie der Königin hat ihre Wurzeln von dort.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Gynk is a very chaotic place, where almost everything is possible as long as you can manage to survive. Galmair is very similar. Probably due to the father of the Don was from Gynk.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("Gynk ist ein sehr chaotischer Platz, wo beinahe alles möglich ist solange man es schafft zu überleben. Galmair ist sehr ähnlich. Wahrscheinlich liegt das daran, dass der Vater des Don aus Gynk war .");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("It is next to Gynk and Albar the third big empire and has a very close relationship to Lor-Angur, the hometown of the ruler from Runewick, Elvaine Morgan.");
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
talkEntry:addTrigger("angur");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("That's a very famous town of mages at a faraway place and it is the hometown of the ruler from Runewick, Archmage Elvaine Morgan. They have even a fifth tower. *smiles*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("angur");
talkEntry:addResponse("Das ist eine sehr berühmte und ferne Stadt von Magiern und es ist die Heimatstadt des Herrschers von Runewick, Erzmagier Elvaine Morgan. Die haben sogar einen fünften Turm. *lächelt*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("Inhabitants of every faction prefer specific younger gods. In Runewick they pray to Elara, Oldra and Adron; in Galmair to Irmorom, Ronagan and Nargun; and in Cadomyr to Malachin, Zhambra and Sirani.");
talkEntry:addResponse("We differ between younger and elder gods. You will find for almost any of the younger gods like-minded people in one of the fractions, but noone for the elder gods. But who is that stupid and still worship them? They are gone!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Die Einwohner jeder Fraktion bevorzugen spezifische junge Götter. In Runewick beten sie zu Elara, Oldra und Adron; in Galmair zu Irmorom, Ronagan und Nargun; und in Cadomyr zu Malachin, Zhambra and Sirani.");
talkEntry:addResponse("Wir unterscheiden zwischen jungen und alten Göttern. Du wirst für beinahe jeden der jungen einen Gleichgesinnten in einer der Fraktionen finden, aber niemanden für die älteren. Aber wer ist so dumm und dient denen noch? Die sind weg!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("elder");
talkEntry:addResponse("The elder gods are Bragon, Eldan, Findari, Tanora and Ushara. They have left this sphere and you should not waste your time to worship them. Only some nostalgic and disconcerted Elfes still do so, but they are strange. *giggles*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("alten");
talkEntry:addResponse("Die alten Götter sind Bragon, Eldan, Findari, Tanora und Ushara. Sie haben diese Ebene verlassen. Somit besteht kein Grund ihnen mehr zu dienen. Nur nostalgische und verwirrte Elfen tun das noch, aber die sind komisch. *kichert*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("younger");
talkEntry:addResponse("The younger gods are Nargun, Elara, Adron, Oldra, Cherga, Malachin, Irmorom, Sirani, Zhambra, Ronagan und Moshran. Some faction believe in this, other faction in others. I believe in Elara. And you? *smiles*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("junge");
talkEntry:addResponse("The younger gods are Nargun, Elara, Adron, Oldra, Cherga, Malachin, Irmorom, Sirani, Zhambra, Ronagan und Moshran. Einige Fraktionen glauben in den einen, andere Fraktionen in die anderen. Ich glaube an Elara. Und du?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Adron");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("He is the god of life and fertility and followers can be found in Runewick. So if you believe in her as well, you will find like-minded people there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Adron");
talkEntry:addResponse("Er ist des Weines und der Feste und einige Anhänger können in Runewick  gefunden werden. Wenn du an ihm glaubst, dann wirst du dort Gleichgesinnte finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("He is one of the elder gods who left this sphere. Therefore he will not help you at all and makes no sense to worship him. Only nostalgic and disconcerted Elfes still do so. However, he was known as the god of fire.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addResponse("Er ist einer der alten Götter, die diese Ebene verlassen haben. Daher wird er dir nicht mehr helfen und es macht keinen Sinn ihm zu dienen. Nur nostalgische und verwirrte Elfen tun das noch. Wie dem auch sei, er war bekannt als der Gott des Feuers.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("She is the goddess of spirits and the underworld. Noone in particular worships her, except those who think to travel to the underworld soon. *giggles*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addResponse("Sie ist die Götting der Geister und der Unterwelt. Niemand besonderes dient ihr, außer jene, welche denken, sie bald zu besuchen. *kichert*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elara");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("She is the goddess of wisdom and knowledge and followers can be found in Runewick. So if you believe in her as well, you will find like-minded people there, as I do, because I also believe in Elara. *giggles*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elara");
talkEntry:addResponse("Sie ist die Göttin des Wissens und der Weisheit und einige Anhänger können in Runewick  gefunden werden. Wenn du an sie glaubst, dann wirst du dort Gleichgesinnte finden, so wie ich, weil ich ja auch an Elara glaube. *kichert*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eldan");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("He is one of the elder gods who left this sphere. Therefore he will not help you at all and makes no sense to worship him. Only nostalgic and disconcerted Elfes still do so. However, he was known as the god of spirit.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eldan");
talkEntry:addResponse("Er ist einer der alten Götter, die diese Ebene verlassen haben. Daher wird er dir nicht mehr helfen und es macht keinen Sinn ihm zu dienen. Nur nostalgische und verwirrte Elfen tun das noch. Wie dem auch sei, er war bekannt als der Gott des Geistes.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Findari");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("She is one of the elder gods who left this sphere. Therefore she will not help you at all and makes no sense to worship her. Only nostalgic and disconcerted Elfes still do so. However, she was known as the god of air.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Findari");
talkEntry:addResponse("Sie ist eine der alten Götter, die diese Ebene verlassen haben. Daher wird sie dir nicht mehr helfen und es macht keinen Sinn ihr zu dienen. Nur nostalgische und verwirrte Elfen tun das noch. Wie dem auch sei, sie war bekannt als der Gott der Luft.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("He is the god of trade and craftsmanship and followers can be found in Galmair. So if you believe in her as well, you will find like-minded people there.");
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
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("He is the god of battle and hunting and followers can be found in Cadomyr. So if you believe in her as well, you will find like-minded people there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addResponse("Er ist der Jagd und der Schlachten und einige Anhänger können in Cadomyr gefunden werden. Wenn du an ihm glaubst, dann wirst du dort Gleichgesinnte finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Moshran");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("He is the unnamed one , also called the Milkspiller, who suffered a sickness in his stomach from an old cake he had stolen from Nargun, who had wanted to use it in order to slay a giant. But I don?t say more about him. *shivers*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Moshran");
talkEntry:addResponse("Er ist der Ungenannte, den man auch den Milchversaurer nennt, der sich den Magen an einem alten Kuchen verdarb, den er Nargun gestohlen hatte, welcher damit eigentlich einen Riesen hatte erschlagen wollte. Und mehr sag ich nicht dazu. *zittert*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addTrigger("Nargùn");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("He is the god of chaos and some followers can be found in Galmair. So if you believe in him as well, you will find like-minded people there.");
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
talkEntry:addTrigger("Oldra");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("She is the goddess of life and fertility and followers can be found in Runewick. So if you believe in her as well, you will find like-minded people there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("Sie ist die Göttin der Fruchtbarkeit und des Lebens und einige Anhänger können in Runewick  gefunden werden. Wenn du an sie glaubst, dann wirst du dort Gleichgesinnte finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ronagan");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("He is the god of thieves and shadows and some followers can be found in Galmair. So if you believe in him as well, you will find like-minded people there.");
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
talkEntry:addTrigger("Sirani");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("She is the goddess of love and pleasure and followers can be found in Cadomyr. So if you believe in her as well, you will find like-minded people there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("Sie ist die Göttin der Liebe und der Freude und einige Anhänger können in Cadomyr  gefunden werden. Wenn du an sie glaubst, dann wirst du dort Gleichgesinnte finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("She is one of the elder gods who left this sphere. Therefore she will not help you at all and makes no sense to worship her. Only nostalgic and disconcerted Elfes still do so. However, she was known as the god of water.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("Sie ist eine der alten Götter, die diese Ebene verlassen haben. Daher wird sie dir nicht mehr helfen und es macht keinen Sinn ihr zu dienen. Nur nostalgische und verwirrte Elfen tun das noch. Wie dem auch sei, sie war die Göttin des Wasser.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ushara");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("She is one of the elder gods who left this sphere. Therefore she will not help you at all and makes no sense to worship her. Only nostalgic and disconcerted Elfes still do so. However, she was known as the god of earth.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("Sie ist eine der alten Götter, die diese Ebene verlassen haben. Daher wird sie dir nicht mehr helfen und es macht keinen Sinn ihr zu dienen. Nur nostalgische und verwirrte Elfen tun das noch. Wie dem auch sei, sie war die Göttin der Erde.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zhambra");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("He is the god of friendship and loyalty and followers can be found in Cadomyr. So if you believe in her as well, you will find like-minded people there.");
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
talkEntry:addTrigger("wisdom");
talkEntry:addResponse("Wisdom is the highest premise in Runewick. Therefore, they believe in Elara among other gods and follow the advice of their ruler Archmage Elvaine Morgan, who?s sageness is widely known.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Weisheit");
talkEntry:addResponse("Weisheit ist die höchste Prämisse in Runewick. Deswegen glauben sie auch an Elara neben anderen Göttern und dem Rat ihres Herrschers Erzmagier Elvaine Morgan, wessen Klugheit ist weitbekannt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("wealth");
talkEntry:addResponse("Wealth is the highest premise in Galmair. Therefore, they believe in Irmorom among other gods and obtain Don Valerio Guilianni, who is the richest person there.");
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
talkEntry:addResponse("Honour is the highest premise in Cadomyr. Therefore, they believe in Malachin among other gods and their ruler Queen Rosaline Edwards, who is the noblest person there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ehre");
talkEntry:addResponse("Ehre ist die höchste Prämisse in Cadomyr. Deswegen glauben sie auch Malachin neben anderen Göttern und ihrer Herrscherin Königin Rosaline Edwards, welche die nobelste Person dort ist.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Alchemist");
talkEntry:addTrigger("Druid");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Alchemists can be mainly found in Runewick due to there are the best conditions for this profession. But in Galmair they have also few. Cadomyr has to trade, if the need something from them.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Alchemist");
talkEntry:addTrigger("Druid");
talkEntry:addResponse("Alchemisten können vor allem in Runewick gefunden werden, weil dort die besten Bedingungen zur Ausübung dieses Berufes bestehen. Auch in Galmair gibt es ein paar wenige. Cadomyr hat zu handeln, wenn es etwas von denen benötigt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Candle");
talkEntry:addResponse("Candle makers can be mainly found in Runewick due to there are the best conditions for this profession. But in Cadomyr they have also few. Galmair has to trade, if the need something from them.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Kerzenmacher");
talkEntry:addResponse("Kerzenmacher können vor allem in Runewick gefunden werden, weil dort die besten Bedingungen zur Ausübung dieses Berufes bestehen. Auch in Cadomyr gibt es ein paar wenige. Galmair hat zu handeln, wenn es etwas von denen benötigt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Carpenter");
talkEntry:addResponse("Carpenter can be mainly found in Runewick due to there are the best conditions for this profession. But in Galmair they have also few. Cadomyr has to trade, if the need something from them.");
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
talkEntry:addResponse("Lumberjacks can be mainly found in Runewick due to there are the best conditions for this profession. But in Galmair they have also few. Cadomyr has to trade, if the need something from them.");
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
talkEntry:addResponse("Cooks can be mainly found in Runewick due to there are the best conditions for this profession. But in Galmair they have also few. Cadomyr has to trade, if the need something from them.");
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
talkEntry:addResponse("Bakers can be mainly found in Runewick due to there are the best conditions for this profession. But in Galmair they have also few. Cadomyr has to trade, if the need something from them.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bäcker");
talkEntry:addResponse("Bäcker können vor allem in Runewick gefunden werden, weil dort die besten Bedingungen zur Ausübung dieses Berufes bestehen. Auch in Galmair gibt es ein paar wenige. Cadomyr hat zu handeln, wenn es etwas von denen benötigt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farmer");
talkEntry:addResponse("Farmers can be mainly found in Runewick due to there are the best conditions for this profession. But in Galmair they have also few. Cadomyr has to trade, if the need something from them.");
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
talkEntry:addResponse("Herb gatherer can be mainly found in Runewick due to there are the best conditions for this profession. But in Cadomyr they have also few. Galmair has to trade, if the need something from them.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Kräutersammler");
talkEntry:addResponse("Kräutersammler können vor allem in Runewick gefunden werden, weil dort die besten Bedingungen zur Ausübung dieses Berufes bestehen. Auch in Cadomyr gibt es ein paar wenige. Galmair hat zu handeln, wenn es etwas von denen benötigt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tailor");
talkEntry:addResponse("Tailors can be mainly found in Runewick due to there are the best conditions for this profession. But in Cadomyr they have also few. Galmair has to trade, if the need something from them.");
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
talkEntry:addResponse("Tanners can be mainly found in Runewick due to there are the best conditions for this profession. But in Cadomyr they have also few. Galmair has to trade, if the need something from them.");
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
talkEntry:addResponse("Dyers can be mainly found in Runewick due to there are the best conditions for this profession. But in Cadomyr they have also few. Galmair has to trade, if the need something from them.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Färber");
talkEntry:addResponse("Färber können vor allem in Runewick gefunden werden, weil dort die besten Bedingungen zur Ausübung dieses Berufes bestehen. Auch in Cadomyr gibt es ein paar wenige. Galmair hat zu handeln, wenn es etwas von denen benötigt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Fisher");
talkEntry:addResponse("Fishers can be mainly found in Cadomyr due to there are the best conditions for this profession. But in Runewick they have also few. Galmair has to trade, if the need something from them.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Fischer");
talkEntry:addResponse("Fischer können vor allem in Cadomyr gefunden werden, weil dort die besten Bedingungen zur Ausübung dieses Berufes bestehen. Auch in Runewick gibt es ein paar wenige. Galmair hat zu handeln, wenn es etwas von denen benötigt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Glass");
talkEntry:addTrigger("blow");
talkEntry:addResponse("Glass blowers can be mainly found in Cadomyr due to there are the best conditions for this profession. But in Runewick they have also few. Galmair has to trade, if they need something from them.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Glasbläser");
talkEntry:addResponse("Glasbläser können vor allem in Cadomyr gefunden werden, weil dort die besten Bedingungen zur Ausübung dieses Berufes bestehen. Auch in Runewick gibt es ein paar wenige. Galmair hat zu handeln, wenn es etwas von denen benötigt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Digger");
talkEntry:addResponse("Diggers can be mainly found in Cadomyr due to there are the best conditions for this profession. But in Galmair they have also few. Runewick has to trade, if the need something from them.");
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
talkEntry:addResponse("Finesmiths can be mainly found in Cadomyr due to there are the best conditions for this profession. But in Galmair they have also few. Runewick has to trade, if the need something from them.");
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
talkEntry:addResponse("Gem grinder can be mainly found in Cadomyr due to there are the best conditions for this profession. But in Galmair they have also few. Runewick has to trade, if the need something from them.");
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
talkEntry:addResponse("Blacksmiths can be mainly found in Galmair due to there are the best conditions for this profession. But in Cadomyr they have also few. Runewick has to trade, if the need something from them.");
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
talkEntry:addTrigger("Brick maker");
talkEntry:addResponse("Brick makers can be mainly found in Galmair due to there are the best conditions for this profession. But in Cadomyr they have also few. Runewick has to trade, if the need something from them.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ziegelmacher");
talkEntry:addResponse("Ziegelmacher können vor allem in Galmair gefunden werden, weil dort die besten Bedingungen zur Ausübung dieses Berufes bestehen. Auch in Cadomyr gibt es ein paar wenige. Runewick hat zu handeln, wenn es etwas von denen benötigt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Mason");
talkEntry:addResponse("Masons can be mainly found in Galmair due to there are the best conditions for this profession. But in Cadomyr they have also few. Runewick has to trade, if the need something from them.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Steinmetz");
talkEntry:addResponse("Steinmetze können vor allem in Galmair gefunden werden, weil dort die besten Bedingungen zur Ausübung dieses Berufes bestehen. Auch in Cadomyr gibt es ein paar wenige. Runewick hat zu handeln, wenn es etwas von denen benötigt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Miner");
talkEntry:addResponse("Miners can be mainly found in Galmair due to there are the best conditions for this profession. But in Cadomyr they have also few. Runewick has to trade, if the need something from them.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Schürfer");
talkEntry:addResponse("Schürfer können vor allem in Galmair gefunden werden, weil dort die besten Bedingungen zur Ausübung dieses Berufes bestehen. Auch in Cadomyr gibt es ein paar wenige. Runewick hat zu handeln, wenn es etwas von denen benötigt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Brewer");
talkEntry:addResponse("Brewers can be mainly found in Galmair due to there are the best conditions for this profession. But in Runewick they have also few. Cadomyr has to trade, if the need something from them.");
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
talkEntry:addTrigger("elf");
talkEntry:addCondition(npc.base.condition.race.race(3));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Elfes can be mainly found in Runewick. Therefore you will feel quite at home there. *giggles* But feel free to go somewhere else too!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("elf");
talkEntry:addResponse("Elfen können vorallem in Runewick gefunden werden. Daher wirst du dort gut aufgehoben sein. *kichert* Aber du kannst auch woanders hingehen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("elf");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Elfes can be mainly found in Runewick.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("elf");
talkEntry:addResponse("Elfen können vorallem in Runewick gefunden werden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("human");
talkEntry:addCondition(npc.base.condition.race.race(0));
talkEntry:addResponse("Humans can be found everywhere. Therefore you will feel quite at home everywhere. *giggles* But feel free to go somewhere else too!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mensch");
talkEntry:addCondition(npc.base.condition.race.race(0));
talkEntry:addResponse("Menschen können überall gefunden werden. Daher wirst du dort gut aufgehoben sein. *kichert* Aber du kannst auch woanders hingehen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("human");
talkEntry:addResponse("Humans can be found everywhere.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mensch");
talkEntry:addResponse("Menschen können überall gefunden werden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dwarf");
talkEntry:addTrigger("dwarves");
talkEntry:addCondition(npc.base.condition.race.race(1));
talkEntry:addResponse("Dwarves can be mainly found in Galmair. Therefore you will feel quite at home there. *giggles* But feel free to go somewhere else too!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("zwerg");
talkEntry:addCondition(npc.base.condition.race.race(1));
talkEntry:addResponse("Zwerge können vorallem in Galmair gefunden werden. Daher wirst du dort gut aufgehoben sein. *kichert* Aber du kannst auch woanders hingehen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dwarf");
talkEntry:addTrigger("dwarves");
talkEntry:addResponse("Dwarves can be mainly found in Galmair.");
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
talkEntry:addTrigger("orc");
talkEntry:addCondition(npc.base.condition.race.race(4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Orcs can be mainly found in Cadomyr. Therefore you will feel quite at home there. *giggles* But feel free to go somewhere else too!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ork");
talkEntry:addCondition(npc.base.condition.race.race(4));
talkEntry:addResponse("Orks können vorallem in Cadomyr gefunden werden. Daher wirst du dort gut aufgehoben sein. *kichert* Aber du kannst auch woanders hingehen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("orc");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Orcs can be mainly found in Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ork");
talkEntry:addResponse("Orks können vorallem in Cadomyr gefunden werden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("lizard");
talkEntry:addCondition(npc.base.condition.race.race(5));
talkEntry:addResponse("Lizardmen can be mainly found in Cadomyr. Therefore you will feel quite at home there. *giggles* But feel free to go somewhere else too!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("echse");
talkEntry:addCondition(npc.base.condition.race.race(5));
talkEntry:addResponse("Echsenmenschen können vorallem in Cadomyr gefunden werden. Daher wirst du dort gut aufgehoben sein. *kichert* Aber du kannst auch woanders hingehen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("lizard");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Lizardmen can be mainly found in Cadomyr.");
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
talkEntry:addTrigger("halbing");
talkEntry:addTrigger("halfing");
talkEntry:addCondition(npc.base.condition.race.race(2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Halfings as I am can be mainly found in Runewick. Therefore you will feel quite at home there. *giggles* But feel free to go somewhere else too!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("halbing");
talkEntry:addTrigger("halfing");
talkEntry:addCondition(npc.base.condition.race.race(2));
talkEntry:addResponse("Halbinge wie ich es einer bin können vorallem in Runewick gefunden werden. Daher wirst du dort gut aufgehoben sein. *kichert* Aber du kannst auch woanders hingehen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("halbing");
talkEntry:addTrigger("halfing");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Halfings as I am can be mainly found in Runewick.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("halbing");
talkEntry:addTrigger("halfing");
talkEntry:addResponse("Halbinge wie ich es einer bin können vorallem in Runewick gefunden werden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("Yes?");
talkEntry:addResponse("'Yes' is the opposite from 'no'. *giggles*");
talkEntry:addResponse("'Yes' means 'Ja' in the old language. *giggles*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("Ja?");
talkEntry:addResponse("'Ja' ist das Gegenteil von 'Nein'. *kichert*");
talkEntry:addResponse("'Ja' bedeutet 'Yes' in der neuen Sprache. *kichert*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("No?");
talkEntry:addResponse("'No' is the opposite of 'Yes'. *giggles*");
talkEntry:addResponse("'No' means 'Nein' in the old language. *giggles*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("Nein?");
talkEntry:addResponse("'Nein' ist das Gegenteil von 'Ja'. *kichert*");
talkEntry:addResponse("'Nein' bedeutet 'No' in der neuen Sprache. *kichert*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Father");
talkEntry:addResponse("The father of Queen Rosaline Edwards was King Sir Reginald and the father of Don Valerio Guilianni was Don Tommaso Guilianni. Both are dead. Probably also the father of Archmage Elvaine Morgan, but I have never heard about him. *giggles*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Vater");
talkEntry:addResponse("Der Vater von Königin Rosaline Edwards war König Sir Reginald und der Vater von Don Valerio Guilianni war Don Tommaso Guilianni. Beide sind Tod. Wahrscheinlich auch der Vater von Erzmagier Elvaine Morgan, aber ich hab nie was von ihm gehört.*kichert*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("sevenhill");
talkEntry:addResponse("That is in the south of the Sinking Mountains, in the north of the Mountains of Khenserra and in the west of us. *giggles*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("siebenhügel");
talkEntry:addResponse("Das ist südlich von den Sinkenden Berge, nördlich der Berge von Khenserra und westlich von uns hier. *kichert*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("sinking");
talkEntry:addResponse("Sinking Mountains? Somewhere in the north.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("sinken");
talkEntry:addResponse("Sinkende Berge? Irgendwo im Norden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Khenserra");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Mountains of Khenserra? Somewhere in the south.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Khenserra");
talkEntry:addResponse("Berge von Khenserra? Irgendwo im Süden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(20));
talkEntry:addResponse("Duddli, duddla, ask me for help.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.chance.chance(20));
talkEntry:addResponse("Duddli, duddla, frag mich nach Hilfe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hummi");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("That's me and I know many important things.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hummi");
talkEntry:addResponse("Das bin ich und ich weiß viele wichtige Dinge.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Some people which you will meet have some tasks for your. Therefore ask always for tasks. But I haven't one for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Einige Personen die du treffen wirst haben Aufgaben für dich. Daher frage immer nach Aufgaben. Ich habe aber keine für dich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addResponse("Some people which you will meet have some tasks for your. Therefore ask always for tasks. But I haven't one for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addResponse("Einige Personen die du treffen wirst haben Aufgaben für dich. Daher frage immer nach Aufgaben. Ich habe aber keine für dich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("Frag mich nach 'Hilfe', wenn du 'Hilfe' brauchst.", "Ask me for 'help', if you need help.");
talkingNPC:addCycleText("Frag mich wenn du was über Fraktionen wissen möchtest.", "Ask me if you like to know something about factions.");
talkingNPC:addCycleText("Runewick, Galmair, Cadomyr...ich weiß alles...fast alles. *kichert*", "Runewick, Galmair, Cadomyr... I know everything...almost. *giggles*");
talkingNPC:addCycleText("Frage immer nach Aufgaben, vielleicht hat einer eine für dich und es gibt etwas für dich zu verdienen.", "Ask always for tasks. Probably someone has one for you and you can earn something.");
talkingNPC:addCycleText("Ob Königin Rosaline Edwards, Don Valerio Guilianni, oder Erzmagier Elvaine Morgan... ich weiß alles über sie... fast alles.*kichert*", "If Queen Rosaline Edwards, Don Valerio Guilianni, or Archmage Elvaine Morgan... I know everything about them...almost. *giggles*.");
talkingNPC:addCycleText("Wenn du nicht weißt wohin du gehen sollst, frag mich nach hilfe.", "If you have no idea where you should go, ask me for help.");
talkingNPC:addCycleText("Wenn du wissen möchtest wo du und dein Glaube gut aufgehoben sind, frage mich nach hilfe.", "If you like to know where you and your faith are welcome, ask me for help.");
talkingNPC:addCycleText("Ich bin Hummi und weiß viele Sachen", "I'm Hummi and know many things.");
talkingNPC:addCycleText("Ob Elf, Zwerg, Mensch, Ork, Echsenmensch oder Halbing, ich weiß für jeden den richtigen Platz.", "If elf, dwarf, human, orc, lizardman, orc or halfling; I know the right place for everyone.");
talkingNPC:addCycleText("Lebwohl Gobaith, willkommen östlich des Siebenhügel Gebierge.", "Farewell Gobaith, welcome in the east of Sevenhill Mountains.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(5);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("winkt in deine Richtung als du zu ihm siehst.", "waves in your direction when you look at him.");
mainNPC:setUseMessage("Finger weg!", "Do not touch me!");
mainNPC:setConfusedMessage("Du musst schon in einer Sprache sprechen die ich verstehe. Entweder die gemeinsame oder die rassenspezifische Rassenspezifische.", "You have to talk to me in a language which I understand. Either the common or the racespecific language.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 181);
mainNPC:setEquipment(11, 0);
mainNPC:setEquipment(5, 0);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 48);
mainNPC:setEquipment(9, 34);
mainNPC:setEquipment(10, 53);
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
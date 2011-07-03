--------------------------------------------------------------------------------
-- NPC Name: Zssarkes                                                    None --
-- NPC Job:  none                                                             --
--                                                                            --
-- NPC Race: lizardman                  NPC Position:  131, 585, 200          --
-- NPC Sex:  male                       NPC Direction: west                   --
--                                                                            --
-- Author:   not set                                                          --
--                                                                            --
-- Last parsing: May 23, 2011                            easyNPC Parser v1.02 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (5, 131, 585, 200, 6, 'Zssarkes', 'npc.zssarkes', 0, 2, 5, 123, 62, 9, 245, 180, 137);
---]]

require("npc.base.basic")
require("npc.base.condition.language")
require("npc.base.condition.quest")
require("npc.base.condition.skill")
require("npc.base.consequence.inform")
require("npc.base.consequence.quest")
require("npc.base.consequence.skill")
require("npc.base.talk")
module("npc.zssarkes", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("help");
talkEntry:addResponse("[Game Help] This NPC is a palace guard, he might be able to teach you a thing or two. Keywords: Litios, training, fight");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hilfe");
talkEntry:addResponse("[Spielhilfe] Dieser NPC ist eine Palastwache und könnte dir vielleicht das ein oder andere beibringen. Schlüsselwörter: Litios, Traning, Kampf");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hello");
talkEntry:addTrigger("Greetings");
talkEntry:addTrigger("Be greeted");
talkEntry:addTrigger("Hail");
talkEntry:addTrigger("Good day");
talkEntry:addTrigger("Good morning");
talkEntry:addTrigger("Good evening");
talkEntry:addResponse("Greetingss ssstranger");
talkEntry:addResponse("Zsss.. Greetingss");
talkEntry:addResponse("Good day ssstranger");
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
talkEntry:addResponse("Grüssse Fremder");
talkEntry:addResponse("Zsss.. Grüssse");
talkEntry:addResponse("Guten Tag Fremder");
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
talkEntry:addResponse("Greetingss ssstranger");
talkEntry:addResponse("Zsss.. Greetingss");
talkEntry:addResponse("Good day ssstranger");
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
talkEntry:addResponse("Grüssse Fremder");
talkEntry:addResponse("Zsss.. Grüssse");
talkEntry:addResponse("Guten Tag Fremder");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Good bye");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare thee well");
talkEntry:addResponse("May the great motherss guide your waysss!");
talkEntry:addResponse("Zzelphia with you!");
talkEntry:addResponse("Farewellsss");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehabt euch wohl");
talkEntry:addResponse("Möge die grosssse Mutter euch auf euren Wegen bessschützen!");
talkEntry:addResponse("Zzelphia mit euch!");
talkEntry:addResponse("Auf baldsss");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("May the great motherss guide your waysss!");
talkEntry:addResponse("Zzelphia with you!");
talkEntry:addResponse("Farewellsss");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Möge die grosssse Mutter euch auf euren Wegen bessschützen!");
talkEntry:addResponse("Zzelphia mit euch!");
talkEntry:addResponse("Auf baldsss");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("Goodss, thankss you");
talkEntry:addResponse("I feelss well und you?");
talkEntry:addResponse("I do wellsss, thankss you");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addResponse("Gut, dankess");
talkEntry:addResponse("I fühless mich gutss und duss?");
talkEntry:addResponse("Mir gehtss gut, dankess");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("Zzss.. I'm Zssarkes");
talkEntry:addResponse("Zssarkes at yoursss service");
talkEntry:addResponse("Zssarkes, pleasuress to meetss youss");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Ich binss Zssarkes");
talkEntry:addResponse("Zssarkes zu dienstenss");
talkEntry:addResponse("Zssarkes, eine Freude euch kennenss zzu lernenss");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("Zzss.. I'm not a trader");
talkEntry:addResponse("I'm a guard notss a merchant");
talkEntry:addResponse("I do not tradess");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Ich binss kein Händler");
talkEntry:addResponse("Ich handelss nicht");
talkEntry:addResponse("Ich bin kein Händlerss, sssondern eine Wache");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("I'm not goodss in telling ssstoriess");
talkEntry:addResponse("I have no timess to tell sstoriess");
talkEntry:addResponse("Zzss.. I'm a guardss not a ssstoryteller");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Ich bin nichtss gut im Geschichten erzählenss");
talkEntry:addResponse("Ich habe keiness Zeit um Geschichtenss zu erzählenss");
talkEntry:addResponse("Zzss.. Ich bin eine Wache, kein Geschichtenerzähler");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Litios");
talkEntry:addCondition(npc.base.condition.quest.quest(444, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Oh you knowss Litioss? He leftss the dormitory a whiless back. Ssaid he wantedss to go to tavernss for a drinkss");
talkEntry:addConsequence(npc.base.consequence.quest.quest(444, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Litios");
talkEntry:addCondition(npc.base.condition.quest.quest(444, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Oh ihr kenntss Litioss? Er hatss den Sschlafssaal vor einer Weile verlassssen. Sssagte er wollte in die Taverne für einen Drinkss");
talkEntry:addConsequence(npc.base.consequence.quest.quest(444, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("training");
talkEntry:addCondition(npc.base.condition.quest.quest(444, "=", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Youss too weak to train withss me, but I canss teach youss something about fightingss. What weapon type do you wantss to know more aboutss?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(444, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("training");
talkEntry:addCondition(npc.base.condition.quest.quest(444, "=", 1));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Du zu sschwach um mit mir zzu trainierenss, aber ich kann dirss etwass beibringenss über Kampf. Überss welchen Waffentyp willssst du mehr wisssen?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(444, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("fight");
talkEntry:addTrigger("combat");
talkEntry:addCondition(npc.base.condition.quest.quest(444, "=", 1));
talkEntry:addResponse("You are a fighter? Let Zssarkes teach youss something about weapons, alright? What weapon type you wantss to know more aboutss?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(444, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("kampf");
talkEntry:addCondition(npc.base.condition.quest.quest(444, "=", 1));
talkEntry:addResponse("Ihr sseid Kämpfer? Lass dir von Zssarkes noch etwass über Waffenss beibringenss, in Ordnungss? Überss welchen Waffentyp willssst du mehr wissen?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(444, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("learn puncture");
talkEntry:addCondition(npc.base.condition.skill.skill(5, "puncture weapons", "=<", 20));
talkEntry:addCondition(npc.base.condition.quest.quest(444, "=", 2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("You have the feeling that you've learnt a lot today."));
talkEntry:addResponse("#me rattles on about daggers and other puncture weapons and how to use them. ");
talkEntry:addConsequence(npc.base.consequence.skill.skill(5, "puncture weapons", "+", 5));
talkEntry:addConsequence(npc.base.consequence.quest.quest(444, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("stichwaffen lernen");
talkEntry:addCondition(npc.base.condition.skill.skill(5, "puncture weapons", "=<", 20));
talkEntry:addCondition(npc.base.condition.quest.quest(444, "=", 2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Du hast das Gefühl als hättest du heute viel gelernt."));
talkEntry:addResponse("#me erklärt viel über Dolche und andere Stichwaffen und wie man diese benutzt.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(5, "puncture weapons", "+", 5));
talkEntry:addConsequence(npc.base.consequence.quest.quest(444, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("learn slashing");
talkEntry:addCondition(npc.base.condition.skill.skill(5, "slashing weapons", "=<", 20));
talkEntry:addCondition(npc.base.condition.quest.quest(444, "=", 2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("You have the feeling that you've learnt a lot today."));
talkEntry:addResponse("#me rattles on about sowrds and waraxes and how to use them.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(5, "slashing weapons", "+", 5));
talkEntry:addConsequence(npc.base.consequence.quest.quest(444, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hiebwaffen lernen");
talkEntry:addCondition(npc.base.condition.skill.skill(5, "slashing weapons", "=<", 20));
talkEntry:addCondition(npc.base.condition.quest.quest(444, "=", 2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Du hast das Gefühl als hättest du heute viel gelernt."));
talkEntry:addResponse("#me erklärt viel über Schwerter und Kriegsäxte und wie man diese benutzt.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(5, "slashing weapons", "+", 5));
talkEntry:addConsequence(npc.base.consequence.quest.quest(444, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("learn concussion");
talkEntry:addCondition(npc.base.condition.skill.skill(5, "concussion weapons", "=<", 20));
talkEntry:addCondition(npc.base.condition.quest.quest(444, "=", 2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("You have the feeling that you've learnt a lot today."));
talkEntry:addResponse("#me rattles on about maces and warhammer and how to use them.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(5, "concussion weapons", "+", 5));
talkEntry:addConsequence(npc.base.consequence.quest.quest(444, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("schlagwaffen lernen");
talkEntry:addCondition(npc.base.condition.skill.skill(5, "concussion weapons", "=<", 20));
talkEntry:addCondition(npc.base.condition.quest.quest(444, "=", 2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Du hast das Gefühl als hättest du heute viel gelernt."));
talkEntry:addResponse("#me erklärt viel über Streitkolben und Kriegshämmer und wie man diese benutzt. ");
talkEntry:addConsequence(npc.base.consequence.skill.skill(5, "concussion weapons", "+", 5));
talkEntry:addConsequence(npc.base.consequence.quest.quest(444, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("learn distance");
talkEntry:addCondition(npc.base.condition.skill.skill(5, "distance weapons", "=<", 20));
talkEntry:addCondition(npc.base.condition.quest.quest(444, "=", 2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("You have the feeling that you've learnt a lot today."));
talkEntry:addResponse("#me rattles on about bows and slings and how to use them. ");
talkEntry:addConsequence(npc.base.consequence.skill.skill(5, "distance weapons", "+", 5));
talkEntry:addConsequence(npc.base.consequence.quest.quest(444, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("schusswaffen lernen");
talkEntry:addCondition(npc.base.condition.skill.skill(5, "distance weapons", "=<", 20));
talkEntry:addCondition(npc.base.condition.quest.quest(444, "=", 2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Du hast das Gefühl als hättest du heute viel gelernt."));
talkEntry:addResponse("#me erklärt viel über Bögen und Schlingen und wie man diese benutzt.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(5, "distance weapons", "+", 5));
talkEntry:addConsequence(npc.base.consequence.quest.quest(444, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("learn puncture");
talkEntry:addCondition(npc.base.condition.skill.skill(5, "puncture weapons", ">", 20));
talkEntry:addCondition(npc.base.condition.quest.quest(444, "=", 2));
talkEntry:addResponse("You seemss rather skilled in the art of fightingss, I cannotss teachss you anythingss");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("stichwaffen lernen");
talkEntry:addCondition(npc.base.condition.skill.skill(5, "puncture weapons", ">", 20));
talkEntry:addCondition(npc.base.condition.quest.quest(444, "=", 2));
talkEntry:addResponse("Ihr ssseht geübt auss in der Kunst desss Kämpfenss, ich könnenss euch nichtss beibringenss");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("learn slashing");
talkEntry:addCondition(npc.base.condition.skill.skill(5, "slashing weapons", ">", 20));
talkEntry:addCondition(npc.base.condition.quest.quest(444, "=", 2));
talkEntry:addResponse("You seemss rather skilled in the art of fightingss, I cannotss teachss you anythingss");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hiebwaffen lernen");
talkEntry:addCondition(npc.base.condition.skill.skill(5, "slashing weapons", ">", 20));
talkEntry:addCondition(npc.base.condition.quest.quest(444, "=", 2));
talkEntry:addResponse("Ihr ssseht geübt auss in der Kunst desss Kämpfenss, ich könnenss euch nichtss beibringenss");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("learn concussion");
talkEntry:addCondition(npc.base.condition.skill.skill(5, "concussion weapons", ">", 20));
talkEntry:addCondition(npc.base.condition.quest.quest(444, "=", 2));
talkEntry:addResponse("You seemss rather skilled in the art of fightingss, I cannotss teachss you anythingss");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("schlagwaffen lernen");
talkEntry:addCondition(npc.base.condition.skill.skill(5, "concussion weapons", ">", 20));
talkEntry:addCondition(npc.base.condition.quest.quest(444, "=", 2));
talkEntry:addResponse("Ihr ssseht geübt auss in der Kunst desss Kämpfenss, ich könnenss euch nichtss beibringenss");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("learn distance");
talkEntry:addCondition(npc.base.condition.skill.skill(5, "distance weapons", ">", 20));
talkEntry:addCondition(npc.base.condition.quest.quest(444, "=", 2));
talkEntry:addResponse("You seemss rather skilled in the art of fightingss, I cannotss teachss you anythingss");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("schusswaffen lernen");
talkEntry:addCondition(npc.base.condition.skill.skill(5, "distance weapons", ">", 20));
talkEntry:addCondition(npc.base.condition.quest.quest(444, "=", 2));
talkEntry:addResponse("Ihr ssseht geübt auss in der Kunst desss Kämpfenss, ich könnenss euch nichtss beibringenss");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("weapon type");
talkEntry:addResponse("There are four typesss of weaponss: Puncture, slashing, concussion and distance.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("waffentyp");
talkEntry:addResponse("Esss gibt vier versschiedene Typenss von Waffenss: Stich- , Hieb- , Schlag-  und Schusswaffenss");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("puncture");
talkEntry:addResponse("Daggersss are the mossst famouss memberss of the puncture weaponsss");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("stichwaffen");
talkEntry:addTrigger("stich");
talkEntry:addTrigger("stichwaffe");
talkEntry:addResponse("Dolche ssind die berühmtesssten Mitgliederss der Sstichwaffensss");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("slashing");
talkEntry:addResponse("Swordss and waraxess are exampless for slashing weaponss");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hiebwaffen");
talkEntry:addTrigger("hieb");
talkEntry:addTrigger("hiebwaffe");
talkEntry:addResponse("Sschwerterss und Kriegssäxtess sind Beispieless für Hiebwaffenss");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("concussion");
talkEntry:addResponse("Macesss and warhammer count asss concussion weaponss");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("schlagwaffen");
talkEntry:addTrigger("schlag");
talkEntry:addTrigger("schlagwaffe");
talkEntry:addResponse("Streitkolbenss und Kriegsshämmer zzählen als Schlagwaffenss");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("distance");
talkEntry:addResponse("Distance weaponss are normally bowss and slingss");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("schusswaffen");
talkEntry:addTrigger("schuss");
talkEntry:addTrigger("schusswaffe");
talkEntry:addResponse("Schusswaffenss sind normalss Bögenss und Schleudernss");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("cadomyr");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Cadomyr iss my hometown and I protectsss it with my life. That'ss why I joined the guardss to give somethingss back to town. Our queen is good to uss and we do what she wantss");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("cadomyr");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Cadomyr issst meine Heimat und ich besschütze ssie mit meinem Lebenss. Desswegen bin ich auch der Wache beigetretensss, um der Stadt etwass zurückzugeben. Unsere Königin isst gut zzu unss und wir machen, wass ssie will.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("runewick");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Runewick? Sss.. the town has some nice waterss and meadowss as far as I know, but knowledge is more worth than honorss there. Is dangerousss...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("runewick");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Runewick? Sss.. die Stadt hat schöness Wasser und Weideland soweit ich weißss, aber Wissen isst mehr Wert alss Ehre dort. Das ist gefährlichss...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("galmair");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Banditsss, robberss and villainss. That'ss where money and liess are the mosst important goodss. I don't like that place.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("galmair");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Banditen, Räuberss und Schufte. Dort sind Geld und Lügen die wichtigsten Warenss. Ich mag den Ortss nicht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("queen");
talkEntry:addTrigger("rosaline edwards");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Queen Rosaline is good to uss and I feelss honored to be member of her palaceguardss. The good god mother Zelphia watchess over her.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("königin");
talkEntry:addTrigger("rosaline edwards");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Königin Rosaline ist gut zu uns und ich fühle mich geehrt dasss ich Mitglied ihrer Palassstwache bin. Die gute Gottmutter Zelphia wacht über ihrss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addTrigger("Elvaine Morgan");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Archmage Morgan isss the leader of Runewick. He is studying much and gatherss knowledge about everything. Wise men he iss but weakss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzmagier");
talkEntry:addTrigger("Elvaine Morgan");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Erzmagier Morgan issst der Anführer von Runewick. Er studiert viel und ssammelt Wisssen über alless. Ein weiser Mann er issst aber schwach.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio Guilianni");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Guilianni is scum, nothing more. He hasss no honor and he'll neverss come to great sea of mother Zelphia.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio Guilianni");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Guilianni ist Abschaumss, mehr nicht. Er hat keiness Ehre und er wird niemalss zu großem Meer von Mutter Zelphia kommenss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me tröpfelt ein paar Tropfen Politur auf einen Lappen und fängt an sein Schwert damit einzureiben", "#me drips some polish onto a cloth and starts to rub his sword in");
talkingNPC:addCycleText("#me sortiert ein paar Rüstungsteile in seine Truhe", "#me sorts some armor into his chest");
talkingNPC:addCycleText("#me lässt seinen Schwanz hin und her schnalzen", "#me flicks his tail");
talkingNPC:addCycleText("#me zischelt leise vor sich hin, während er eine neue Sehne an einem Bogen befestigt", "#me hisses quietly to himself, while he attaches a new fiber on a bow");
talkingNPC:addCycleText("#me macht ein paar flinke Bewegungen mit einem Dolch, anscheinend aus Trainingszwecken.", "#me makes some quick movements with a dagger, seemgl as training");
talkingNPC:addCycleText("#me schaut sich leise zischelnd in dem Raum um", "#me quietly hisses and looks around in the room");
mainNPC:addLanguage(0);
mainNPC:addLanguage(4);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Eine Echse in stattlicher Rüstung.", "A lizardman with an impressive armor.");
mainNPC:setUseMessage("Fass mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut dich verwirrt an.", "#me looks at you confused.");
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

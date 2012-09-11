--------------------------------------------------------------------------------
-- NPC Name: Kaitza                                                      None --
-- NPC Job:  Temple Guard                                                     --
--                                                                            --
-- NPC Race: lizardman                  NPC Position:  841, 743, 0            --
-- NPC Sex:  male                       NPC Direction: north                  --
--                                                                            --
-- Author:   Grokk                                                            --
--                                                                            --
-- Last parsing: September 11, 2012                      easyNPC Parser v1.21 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (5, 841, 743, 0, 0, 'Kaitza', 'npc.kaitza', 0, 0, 0, 154, 205, 50, 154, 205, 50);
---]]

require("npc.base.basic")
require("npc.base.condition.chance")
require("npc.base.condition.item")
require("npc.base.condition.language")
require("npc.base.condition.quest")
require("npc.base.consequence.deleteitem")
require("npc.base.consequence.inform")
require("npc.base.consequence.item")
require("npc.base.consequence.money")
require("npc.base.consequence.quest")
require("npc.base.consequence.trade")
require("npc.base.talk")
module("npc.kaitza", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(335, ">", 4));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Error] Something went wrong, please inform a developer."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(333, ">", 12));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Error] Something went wrong, please inform a developer."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Kaitza the temple guard. Keywords: quest, Zelphia, profession, Gobaith, gods."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Kaitza> der Tempelwächter. Schlüsselwörter: Zelphia, Beruf, Gobaith, gods."));
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
talkEntry:addResponse("Glory to ze Goddessss.");
talkEntry:addResponse("Greetingsss, landwalker.");
talkEntry:addResponse("#me lowers his head respectfully, 'Greetingsss.'");
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
talkEntry:addResponse("Ehre sei der Göttin.");
talkEntry:addResponse("Grüssse, Landgänger.");
talkEntry:addResponse("#me senkt seinen kopf respektvoll,'Greetingss'.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Glory to ze Goddessss.");
talkEntry:addResponse("Greetingsss, landwalker.");
talkEntry:addResponse("#me lowers his head respectfully, 'Greetingss'.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Ehre sei der Göttin.");
talkEntry:addResponse("Grüssse, Landgänger.");
talkEntry:addResponse("#me neigt sein Haupt respektvoll,'Grüssse'.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Glory to ze Goddessss.");
talkEntry:addResponse("Zss. May Zelphia keep your watersss calm.");
talkEntry:addResponse("#me bows his head respectfully, 'Zss. Farewell.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Ehre sssei der Göttin.");
talkEntry:addResponse("Zzs. Möge Zelphina deine Wasser beruhig.");
talkEntry:addResponse("#me neigt respektvoll das Haupt: 'Lebt wohl!'.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Glory to ze Goddessss.");
talkEntry:addResponse("Zss. May Zelphia keep your waters calm.");
talkEntry:addResponse("#me bows his head respectfully, 'Zss. Farewell.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Ehre sssei der Göttin.");
talkEntry:addResponse("Zzs. Möge Zelphina deine Wasser beruhig.");
talkEntry:addResponse("#me neigt respektvoll das Haupt: 'Lebt wohl!'.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("Zss. I am...well.");
talkEntry:addResponse("Ze Goddessss watches over me. Zss.");
talkEntry:addResponse("Zelphia keepsss me sssafe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befind");
talkEntry:addResponse("Mir geht esss.... gut.");
talkEntry:addResponse("Die Göttin wacht über mich. Zss.");
talkEntry:addResponse("Zelpia beschützzt mich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("I am Kaitza. Ssservant of ze Goddessss.");
talkEntry:addResponse("My name isss Kaitza.");
talkEntry:addResponse("I am Kaitza, ze temple guard.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Ich bin Kaitza. Diener der Göttin. Zss.");
talkEntry:addResponse("Mein Name issst Kaiza.");
talkEntry:addResponse("Ich bin Kiatza, der Wächter dess Tempelssss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(333, "=", 7));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest updated] Aurora's Staff: Part III"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(333, "=", 8));
talkEntry:addResponse("Zis dagger? It isss not for sssale. Zss. Although...ze druid, Aurora Sssnow, ssshe hasss zis emerald ring. Get it for me, and I ssshall part with ze dagger.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(333, "=", 7));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Die Geistereiche I"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(333, "=", 8));
talkEntry:addResponse("Diessser Dolch? Er issst nicht zzzu kaufen. Zss. Aber...diesse Druidin Aurora Sssnow, ssie hat einen Emerald-Ring. Zss. Gebt mir den Ring und ich überlassse euch den Dolch. Zss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(333, "=", 7));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("staff");
talkEntry:addTrigger("dagger");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest updated] Aurora's Staff: Part III"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(333, "=", 8));
talkEntry:addResponse("Zis dagger? It isss not for sssale. Zss. Although...ze druid, Aurora Sssnow, ssshe hasss zis emerald ring. Get it for me, and I ssshall part with ze dagger.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(333, "=", 7));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("stab");
talkEntry:addTrigger("dolch");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Die Geistereiche I"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(333, "=", 8));
talkEntry:addResponse("Diessser Dolch? Er issst nicht zzzu kaufen. Zss. Aber...diesse Druidin Aurora Sssnow, ssie hat einen Emerald-Ring. Zss. Gebt mir den Ring und ich überlassse euch den Dolch. Zss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(333, "=", 8));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Ze dagger isss important to me. Kaitza ssshall only let it go if you bring me zis emerald ring. Aurora Sssnow has it, in <town name>. Zss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(333, "=", 8));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Diessser Dolch issst wichtig für mich. Zss. Kaitza gibt ihn nur frot im Tausssch, gegen dem Emerald-Ring.Aurora Ssssnow besitzzt ihn. Ssssucht in <Stadt name>");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(333, "=", 8));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addResponse("Ze dagger isss important to me. I ssshall only let it go if you bring me zis emerald ring. Aurora Sssnow has it, in <town name>. Zss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(333, "=", 8));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addResponse("Diessser Dolch issst wichtig für mich. Zss. Kaitza gibt ihn nur fort im Tausssch, gegen dem Emerald-Ring. Aurora Ssssnow besitzzt ihn. Ssssucht in <Stadt name>");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(333, "=", 9));
talkEntry:addCondition(npc.base.condition.item.item(281, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest updated] Aurora's Staff: Part III."));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(281, 1, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(190, 1, 499, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(333, "=", 10));
talkEntry:addResponse("Yesss...zis iss ze one. Gorgeousss...Here iss your dagger, as promisssed. Zss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(333, "=", 9));
talkEntry:addCondition(npc.base.condition.item.item(281, "all", ">", 0, nil));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 80 Kupferstücke."));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(281, 1, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(190, 1, 499, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(333, "=", 10));
talkEntry:addResponse("Ja...dasss issst er, der Dolch. Zss! Grosssartig... Hier isst Euer Doch wie versprochen. Zzs.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(335, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Fishing For Lizards"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(335, "=", 1));
talkEntry:addResponse("Zss. You wisssh to help Kaitza? He isss ssso hungry. Pleassse, bring me ten trout. Zey mussst be raw, cooking ruinsss ze fisssh.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(335, "=", 0));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Die Geistereiche II"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(335, "=", 1));
talkEntry:addResponse("Zsss. Ihr wollt Kaitza helfen? Er isst so hungrig. Bitte bringt mir 10 Forellenfisssche. Ssie müsssen roh sssein. Kochen verdirbt das Esssen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(335, "=", 0));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] The Ghost Oak II"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(335, "=", 1));
talkEntry:addResponse("Zss. You wisssh to help Kaitza? He isss ssso hungry. Pleassse, bring me ten trout. Zey mussst be raw, cooking ruinsss ze fisssh.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(335, "=", 0));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Die Geistereiche II"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(335, "=", 1));
talkEntry:addResponse("Zsss. Ihr wollt Kaitza helfen? Er isst so hungrig. Bitte bringt mir 10 Forellenfisssche. Ssie müsssen roh sssein. Kochen verdirbt das Esssen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(335, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(73, "all", "<", 10, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Zss. Sstill hungry. Bring me ten trout, Kaitza will pay. Zss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(335, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(73, "all", "<", 10, nil));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Zss. Sso Hungrig. Bring mir zzzehn Forellen. Kaitza zzzahlt dafür. Zss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(335, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(73, "all", "<", 10, nil));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addResponse("Zss. Sstill hungry. Bring me ten trout, Kaitza will pay. Zss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(335, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(73, "all", "<", 10, nil));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addResponse("Zss. Sso Hungrig. Bring mir zzzehn Forellen. Kaitza zzzahl dafür. Zss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(335, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(73, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 80 copper coins."));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 80));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(73, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(335, "=", 2));
talkEntry:addResponse("Yess...zis isss good. Very good. Zss. Here isss your money.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(335, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(73, "all", ">", 9, nil));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 120 Kupferstücke und ein ITEM."));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 80));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(73, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(335, "=", 2));
talkEntry:addResponse("Ja... dass ist gut.Sssehr gut. Zss. Hier issst Euer Geld.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(335, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Fishing For Lizards II"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(335, "=", 3));
talkEntry:addResponse("Yesss. Ze trout wasss mossst deliciousss. Now, Kaitza wantsss sssome sssalmon. Zsss. Bring me five of zem.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(335, "=", 2));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Die Geistereiche III"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(335, "=", 3));
talkEntry:addResponse("Ja. Szzz. Die Forellen war ausssgesprochen lecker, Zss. Jetzzzt möchte Kaitza ein paar Lachsssfische verspeisssen. Bingt mir fünf Sssstück.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(335, "=", 2));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Fishing For Lizards II"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(335, "=", 3));
talkEntry:addResponse("Yesss. Ze trout wasss mossst deliciousss. Now, Kaitza wantsss sssome sssalmon. Zsss. Bring me five of zem.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(335, "=", 2));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Die Geistereiche III"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(335, "=", 3));
talkEntry:addResponse("Ja. Szzz. Die Forellen war ausssgesprochen lecker, Zss. Jetzzzt möchte Kaitza ein paar Lachsssfische verspeisssen. Bingt mir fünf Sssstück.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(335, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(355, "all", "<", 5, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Pleassse, you mussst bring Kaitza five deliciousss sssalmon. Do not cook zem, zey mussst be raw.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(335, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(355, "all", "<", 5, nil));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Bitte findet für Kaitza fünf ssschamckhafte Lachssse.Kocht sssie nicht. Sssie müsssen roh sssein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(335, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(355, "all", "<", 5, nil));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addResponse("Pleassse, you mussst bring Kaitza five deliciousss sssalmon. Do not cook zem, zey mussst be raw.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(335, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(355, "all", "<", 5, nil));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addResponse("Bitte findet für Kaitza fünf ssschamckhafte Lachssse. Kocht sssie nicht. Sssie müsssen roh sssein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(335, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(355, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded a snake sword and 40 copper coins."));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 40));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(355, 5, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(2788, 1, 799, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(335, "=", 4));
talkEntry:addResponse("Zese sssalmon look mossst good. Take zis, as payment. Zss. Now leave Kaitza alone to eat hisss fishiesss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(335, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(355, "all", ">", 4, nil));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst ein Schlangenschwert und 40 Kupferstücke."));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 40));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(355, 5, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(2788, 1, 799, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(355, "=", 4));
talkEntry:addResponse("Der Lachsss sssieht gut uisss. Nemt diesss, alsss Bezzzahlung. Zss. Jetzzzt lasst mich in Ruhe essssen. Zss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(335, "=", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Zss. Be gone. Leave Kaitza to enjoy hisss fishiesss in peace.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(335, "=", 4));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Lassst mich allein. Kaitza möchte ssseine Fisssche in Ruhe esssen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(335, "=", 4));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addResponse("Zss. Be gone. Leave Kaitza to enjoy hisss fishiesss in peace.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(335, "=", 4));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addResponse("Lassst mich allein. Kaitza möchte ssseine Fisssche in Ruhe esssen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("I ssserve ze Goddessss.");
talkEntry:addResponse("Zss. I am a temple guard.");
talkEntry:addResponse("I dessstroy evil.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("I ssserve ze Goddessss.");
talkEntry:addResponse("Zss. I am a temple guard.");
talkEntry:addResponse("I dessstroy evil.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Zis land wasss very corrupt.");
talkEntry:addResponse("Zis island had much evil. Much evil, yesss. Zss.");
talkEntry:addResponse("Zss. Ze people zere, zey were weak.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("Zss. It isss an honour to meet you.");
talkEntry:addResponse("A pleasssure to meet you.");
talkEntry:addResponse("Glory to ze Goddessss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addResponse("Zss. Ze magicsss isss not to be trusssted.");
talkEntry:addResponse("Zey sssay zat he wasss blesssed by ze human Goddesss Elara.");
talkEntry:addResponse("Ze archmage rulesss ze town of Runewick.");
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
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Zss. Ze magicsss isss not to be trusssted.");
talkEntry:addResponse("Zey sssay zat he wasss blesssed by ze human Goddesss Elara.");
talkEntry:addResponse("Ze archmage rulesss ze town of Runewick.");
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
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Zss. Runewick isss ze land of wisdom.");
talkEntry:addResponse("Ze people of Runewick are ssstrong of mind, but not of body.");
talkEntry:addResponse("Zese people know nozing of honour.");
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
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Money...only zis isss important to zat human.");
talkEntry:addResponse("Zis human knowsss no honour.");
talkEntry:addResponse("Do not trussst a word ze Don uttersss.");
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
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Zis town isss plagued by corruption.");
talkEntry:addResponse("Gold isss ze only object zat mattersss zere.");
talkEntry:addResponse("Zese people know nozing of honour.");
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
talkEntry:addResponse("Honour to ze Queen!");
talkEntry:addResponse("Queen Rosssaline isss ze highest of ze humansss.");
talkEntry:addResponse("Ze noble Queen rulesss ze town of Cadomyr.");
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
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Honour to ze Queen!");
talkEntry:addResponse("Queen Rosssaline isss ze highest of ze humansss.");
talkEntry:addResponse("Ze noble Queen rulesss ze town of Cadomyr.");
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
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Zss. A more honourable people ssshall never be ssseen.");
talkEntry:addResponse("Zis town isss ruled by ze noble Queen Rosssaline. Zss.");
talkEntry:addResponse("Ze enemiesss of Cadomyr ssshall fall beneath our bladesss.");
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
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("albar");
talkEntry:addResponse("Zss. I know little of ze human sssettlementsss.");
talkEntry:addResponse("I know nozing of zese placesss.");
talkEntry:addResponse("I have no interessst in zis. Zss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("Zss. Ich weisss wenig über Menssschenstädte. Zss.");
talkEntry:addResponse("Über diesssen Ort issst mir nichtss bekannt.");
talkEntry:addResponse("Diesss intessierit Kaita nicht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addResponse("Zss. I know little of ze human sssettlementsss.");
talkEntry:addResponse("I know nozing of zese placesss.");
talkEntry:addResponse("I have no interessst in zis. Zss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("Zss. Ich weisss wenig über Menssschenstädte. Zss.");
talkEntry:addResponse("Über diesssen Ort issst mir nichtss bekannt.");
talkEntry:addResponse("Diesss intessierit Kaita nicht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Zss. I know little of ze human sssettlementsss.");
talkEntry:addResponse("I know nozing of zese placesss.");
talkEntry:addResponse("I have no interessst in zis. Zss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Zss. Ich weisss wenig über Menssschenstädte. Zss.");
talkEntry:addResponse("Über diesssen Ort issst mir nichtss bekannt.");
talkEntry:addResponse("Diesss intessierit Kaita nicht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("All ze Godsss are acknowledged. Only Zelphia iss worshiped.");
talkEntry:addResponse("Zelphia iss ze Goddessss of my people. Ze othersss are Godsss of ze other racesss.");
talkEntry:addResponse("Zss. I worship ze Goddessss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Alle Götter werden anerkannt. Zss. Nur Zelphia wird angebetet. Zss.");
talkEntry:addResponse("Zelphia isst die Göttin meines Volkesss. Die anderen Götter sssind für andere Völker.");
talkEntry:addResponse("Zss. Ich verehre einzzzig die Göttin alein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Adron");
talkEntry:addResponse("All ze Godsss are acknowledged. Only Zelphia iss worshiped.");
talkEntry:addResponse("Zelphia iss ze Goddessss of my people. Ze othersss are Godsss of ze other racesss.");
talkEntry:addResponse("Zss. I ressspect zis Godsss followersss. But I do not worship zis God.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Adron");
talkEntry:addResponse("Alle Götter werden anerkannt. Zss. Nur Zelphia wird angebetet. Zss.");
talkEntry:addResponse("Zelphia isst die Göttin meines Volkesss. Die anderen Götter sssind für andere Völker.");
talkEntry:addResponse("Zss. Ich verehre einzzzig die Göttin alein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addResponse("All ze Godsss are acknowledged. Only Zelphia iss worshiped.");
talkEntry:addResponse("Zelphia iss ze Goddessss of my people. Ze othersss are Godsss of ze other racesss.");
talkEntry:addResponse("Zss. I ressspect zis Godsss followersss. But I do not worship zis God.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addResponse("Alle Götter werden anerkannt. Zss. Nur Zelphia wird angebetet. Zss.");
talkEntry:addResponse("Zelphia isst die Göttin meines Volkesss. Die anderen Götter sssind für andere Völker.");
talkEntry:addResponse("Zss. Ich verehre einzzzig die Göttin alein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cherga");
talkEntry:addResponse("All ze Godsss are acknowledged. Only Zelphia iss worshiped.");
talkEntry:addResponse("Zelphia iss ze Goddessss of my people. Ze othersss are Godsss of ze other racesss.");
talkEntry:addResponse("Zss. I ressspect zis Godsss followersss. But I do not worship zis God.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addResponse("Alle Götter werden anerkannt. Zss. Nur Zelphia wird angebetet. Zss.");
talkEntry:addResponse("Zelphia isst die Göttin meines Volkesss. Die anderen Götter sssind für andere Völker.");
talkEntry:addResponse("Zss. Ich verehre einzzzig die Göttin alein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elara");
talkEntry:addResponse("All ze Godsss are acknowledged. Only Zelphia iss worshiped.");
talkEntry:addResponse("Zelphia iss ze Goddessss of my people. Ze othersss are Godsss of ze other racesss.");
talkEntry:addResponse("Zss. I ressspect zis Godsss followersss. But I do not worship zis God.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elara");
talkEntry:addResponse("Alle Götter werden anerkannt. Zss. Nur Zelphia wird angebetet. Zss.");
talkEntry:addResponse("Zelphia isst die Göttin meines Volkesss. Die anderen Götter sssind für andere Völker.");
talkEntry:addResponse("Zss. Ich verehre einzzzig die Göttin alein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Eldan");
talkEntry:addResponse("All ze Godsss are acknowledged. Only Zelphia iss worshiped.");
talkEntry:addResponse("Zelphia iss ze Goddessss of my people. Ze othersss are Godsss of ze other racesss.");
talkEntry:addResponse("Zss. I ressspect zis Godsss followersss. But I do not worship zis God.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eldan");
talkEntry:addResponse("Alle Götter werden anerkannt. Zss. Nur Zelphia wird angebetet. Zss.");
talkEntry:addResponse("Zelphia isst die Göttin meines Volkesss. Die anderen Götter sssind für andere Völker.");
talkEntry:addResponse("Zss. Ich verehre einzzzig die Göttin alein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Findari");
talkEntry:addResponse("All ze Godsss are acknowledged. Only Zelphia iss worshiped.");
talkEntry:addResponse("Zelphia iss ze Goddessss of my people. Ze othersss are Godsss of ze other racesss.");
talkEntry:addResponse("Zss. I ressspect zis Godsss followersss. But I do not worship zis God.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Findari");
talkEntry:addResponse("Alle Götter werden anerkannt. Zss. Nur Zelphia wird angebetet. Zss.");
talkEntry:addResponse("Zelphia isst die Göttin meines Volkesss. Die anderen Götter sssind für andere Völker.");
talkEntry:addResponse("Zss. Ich verehre einzzzig die Göttin alein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("All ze Godsss are acknowledged. Only Zelphia iss worshiped.");
talkEntry:addResponse("Zelphia iss ze Goddessss of my people. Ze othersss are Godsss of ze other racesss.");
talkEntry:addResponse("Zss. I ressspect zis Godsss followersss. But I do not worship zis God.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("Alle Götter werden anerkannt. Zss. Nur Zelphia wird angebetet. Zss.");
talkEntry:addResponse("Zelphia isst die Göttin meines Volkesss. Die anderen Götter sssind für andere Völker.");
talkEntry:addResponse("Zss. Ich verehre einzzzig die Göttin alein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addResponse("All ze Godsss are acknowledged. Only Zelphia iss worshiped.");
talkEntry:addResponse("Zelphia iss ze Goddessss of my people. Ze othersss are Godsss of ze other racesss.");
talkEntry:addResponse("Zss. I ressspect zis Godsss followersss. But I do not worship zis God.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addResponse("Alle Götter werden anerkannt. Zss. Nur Zelphia wird angebetet. Zss.");
talkEntry:addResponse("Zelphia isst die Göttin meines Volkesss. Die anderen Götter sssind für andere Völker.");
talkEntry:addResponse("Zss. Ich verehre einzzzig die Göttin alein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Moshran");
talkEntry:addResponse("All ze Godsss are acknowledged. Only Zelphia iss worshiped.");
talkEntry:addResponse("Zelphia iss ze Goddessss of my people. Ze othersss are Godsss of ze other racesss.");
talkEntry:addResponse("Zss. I ressspect zis Godsss followersss. But I do not worship zis God.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Moshran");
talkEntry:addResponse("Alle Götter werden anerkannt. Zss. Nur Zelphia wird angebetet. Zss.");
talkEntry:addResponse("Zelphia isst die Göttin meines Volkesss. Die anderen Götter sssind für andere Völker.");
talkEntry:addResponse("Zss. Ich verehre einzzzig die Göttin alein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addTrigger("Nargùn");
talkEntry:addResponse("All ze Godsss are acknowledged. Only Zelphia iss worshiped.");
talkEntry:addResponse("Zelphia iss ze Goddessss of my people. Ze othersss are Godsss of ze other racesss.");
talkEntry:addResponse("Zss. I ressspect zis Godsss followersss. But I do not worship zis God.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addTrigger("Nargùn");
talkEntry:addResponse("Alle Götter werden anerkannt. Zss. Nur Zelphia wird angebetet. Zss.");
talkEntry:addResponse("Zelphia isst die Göttin meines Volkesss. Die anderen Götter sssind für andere Völker.");
talkEntry:addResponse("Zss. Ich verehre einzzzig die Göttin alein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("All ze Godsss are acknowledged. Only Zelphia iss worshiped.");
talkEntry:addResponse("Zelphia iss ze Goddessss of my people. Ze othersss are Godsss of ze other racesss.");
talkEntry:addResponse("Zss. I ressspect zis Godsss followersss. But I do not worship zis God.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("Alle Götter werden anerkannt. Zss. Nur Zelphia wird angebetet. Zss.");
talkEntry:addResponse("Zelphia isst die Göttin meines Volkesss. Die anderen Götter sssind für andere Völker.");
talkEntry:addResponse("Zss. Ich verehre einzzzig die Göttin alein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("All ze Godsss are acknowledged. Only Zelphia iss worshiped.");
talkEntry:addResponse("Zelphia iss ze Goddessss of my people. Ze othersss are Godsss of ze other racesss.");
talkEntry:addResponse("Zss. I ressspect zis Godsss followersss. But I do not worship zis God.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("Alle Götter werden anerkannt. Zss. Nur Zelphia wird angebetet. Zss.");
talkEntry:addResponse("Zelphia isst die Göttin meines Volkesss. Die anderen Götter sssind für andere Völker.");
talkEntry:addResponse("Zss. Ich verehre einzzzig die Göttin alein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("All ze Godsss are acknowledged. Only Zelphia iss worshiped.");
talkEntry:addResponse("Zelphia iss ze Goddessss of my people. Ze othersss are Godsss of ze other racesss.");
talkEntry:addResponse("Zss. I ressspect zis Godsss followersss. But I do not worship zis God.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("Alle Götter werden anerkannt. Zss. Nur Zelphia wird angebetet. Zss.");
talkEntry:addResponse("Zelphia isst die Göttin meines Volkesss. Die anderen Götter sssind für andere Völker.");
talkEntry:addResponse("Zss. Ich verehre einzzzig die Göttin alein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("Glory to ze Goddessss!");
talkEntry:addResponse("Zss. Zelphia watchesss over me.");
talkEntry:addResponse("Ze Island of Eternity awaitsss me. Zss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("Ehre sei der Göttin! Zss.");
talkEntry:addResponse("Zss. Zelphia behütet mich.");
talkEntry:addResponse("Dass Eiland der Ewigkeit erwatet mich. Zss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("All ze Godsss are acknowledged. Only Zelphia iss worshiped.");
talkEntry:addResponse("Zelphia iss ze Goddessss of my people. Ze othersss are Godsss of ze other racesss.");
talkEntry:addResponse("Zss. I ressspect zis Godsss followersss. But I do not worship zis God.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("Alle Götter werden anerkannt. Zss. Nur Zelphia wird angebetet. Zss.");
talkEntry:addResponse("Zelphia isst die Göttin meines Volkesss. Die anderen Götter sssind für andere Völker.");
talkEntry:addResponse("Zss. Ich verehre einzzzig die Göttin alein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Zhambra");
talkEntry:addResponse("All ze Godsss are acknowledged. Only Zelphia iss worshiped.");
talkEntry:addResponse("Zelphia iss ze Goddessss of my people. Ze othersss are Godsss of ze other racesss.");
talkEntry:addResponse("Zss. I ressspect zis Godsss followersss. But I do not worship zis God.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zhambra");
talkEntry:addResponse("Alle Götter werden anerkannt. Zss. Nur Zelphia wird angebetet. Zss.");
talkEntry:addResponse("Zelphia isst die Göttin meines Volkesss. Die anderen Götter sssind für andere Völker.");
talkEntry:addResponse("Zss. Ich verehre einzzzig die Göttin alein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkEntry:addResponse("Zss. I have nozing to.");
talkEntry:addResponse("I do not ssseek to. Zss.");
talkEntry:addResponse("Sssorry, I do not wisssh to.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Zss. Ich habe nichtsss zum handeln.");
talkEntry:addResponse("Ich brache nichts zzu handeln.");
talkEntry:addResponse("Entschuldigt, ich bin nicht am Handeln interessssiert.Zss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("Zss. What do you wisssh to know?");
talkEntry:addResponse("Perhapsss I have a tasssk for you.");
talkEntry:addResponse("Ssservice to ze Godsss isss ze most honourable life. Zss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Vielleicht habe ich eine Aufgabe. Zss. Eine Aufgabe für Euch.");
talkEntry:addResponse("Der Göttin zzzu dienen issst die grösssste Aufgabe im Leben. Zss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Kaitza");
talkEntry:addResponse("Zss. Kaitza mussst be working.");
talkEntry:addResponse("#me hisses quietly.");
talkEntry:addResponse("Zere isss evil that mussst be dessstroyed. Ssstop wasting Kaitza'sss time.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Kaitza");
talkEntry:addResponse("Zss. Kaitza mussss arbeiten.");
talkEntry:addResponse("#me zischt leise.");
talkEntry:addResponse("Es gibt Bösessss in der Welt, dasss zerstört werden mussss. Verschwendet nicht meine Zeit.Zss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("Zss. Kaitza mussst be working.");
talkEntry:addResponse("#me hisses quietly.");
talkEntry:addResponse("Zere isss evil that mussst be dessstroyed. Ssstop wasting Kaitza'sss time.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("Zss. Kaitza mussss arbeiten.");
talkEntry:addResponse("#me zischt leise.");
talkEntry:addResponse("Es gibt Bösessss in der Welt, dasss zerstört werden mussss. Verschwendet nicht meine Zeit.Zss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("Zss. Kaitza mussst be working.");
talkEntry:addResponse("#me hisses quietly.");
talkEntry:addResponse("Zere isss evil that mussst be dessstroyed. Ssstop wasting Kaitza'sss time.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("Zss. Kaitza mussss arbeiten.");
talkEntry:addResponse("#me zischt leise.");
talkEntry:addResponse("Es gibt Bösessss in der Welt, dasss zerstört werden mussss. Verschwendet nicht meine Zeit.Zss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Zss. Kaitza mussst be working.");
talkEntry:addResponse("#me hisses quietly.");
talkEntry:addResponse("Zere isss evil that mussst be dessstroyed. Ssstop wasting Kaitza'sss time.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Zss. Kaitza mussss arbeiten.");
talkEntry:addResponse("#me zischt leise.");
talkEntry:addResponse("Es gibt Bösessss in der Welt, dasss zerstört werden mussss. Verschwendet nicht meine Zeit.Zss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me fährt mit dem Finger an der Klinge seiner Waffe entlang.", "#me runs a finger along his blade.");
talkingNPC:addCycleText("#me rückt seine Rüstung zurecht.", "#me adjusts his armour.");
talkingNPC:addCycleText("#me hält sein Schild hoch.", "#me hoists up his shield.");
talkingNPC:addCycleText("#me streckt die Brust raus.", "#me pushes his chest out.");
talkingNPC:addCycleText("#me fährt sich mit einer Fingerkralle durchs Gesicht.", "#me runs a clawed finger along his cheek.");
talkingNPC:addCycleText("#me zischt leise.", "#me hisses quietly.");
talkingNPC:addCycleText("#me schließt  füreinen kurzen Momemt seine Augen und atmet tief ein.", "#me closes his eyes for a few moments, breathing deeply.");
talkingNPC:addCycleText("#me flüsterte still ein Gebet.", "#me whispers a silent prayer.");
talkingNPC:addCycleText("Für die Göttin! Zss!", "For ze Goddessss!");
talkingNPC:addCycleText("Ehre sssei der Göttin!", "Glory to ze Goddessss!");
mainNPC:addLanguage(0);
mainNPC:addLanguage(4);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Dieser NPC ist Kaitza der Tempelwächter.", "This NPC is Kaitza the temple guard.");
mainNPC:setUseMessage("#me faucht drohend.", "#me hisses sharply.");
mainNPC:setConfusedMessage("#me schaut verwirrt.", "#me looks around confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 2407);
mainNPC:setEquipment(11, 0);
mainNPC:setEquipment(5, 2701);
mainNPC:setEquipment(6, 95);
mainNPC:setEquipment(4, 325);
mainNPC:setEquipment(9, 2116);
mainNPC:setEquipment(10, 326);
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
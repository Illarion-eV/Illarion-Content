--------------------------------------------------------------------------------
-- NPC Name: Fosco Goodbarrel                                            None --
-- NPC Job:  Mischievous halfling                                             --
--                                                                            --
-- NPC Race: halfling                   NPC Position:  870, 866, 0            --
-- NPC Sex:  male                       NPC Direction: west                   --
--                                                                            --
-- Author:   Grokk                                                            --
--                                                       easyNPC Parser v1.21 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (2, 870, 866, 0, 6, 'Fosco Goodbarrel', 'npc.fosco_goodbarrel', 0, 5, 1, 123, 62, 9, 245, 180, 137);
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
require("npc.base.talk")
module("npc.fosco_goodbarrel", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(336, ">", 2));
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
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Fosco Goodbarrel the mischievous halfling. Keywords: quest, profession, Gobaith, gods, Fosco."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Fosco Goodbarrel der spitzbübische Halbling. Schlüsselwörter: Auftrag, Beruf, Gobaith, Götter, Fosco."));
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
talkEntry:addResponse("Hiho!");
talkEntry:addResponse("Howdy, dowdy!");
talkEntry:addResponse("'Ello, 'ello!");
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
talkEntry:addResponse("Hiho!");
talkEntry:addResponse("Holldario.");
talkEntry:addResponse("'allo, 'allo!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Hiho!");
talkEntry:addResponse("Howdy, dowdy!");
talkEntry:addResponse("'Ello, 'ello!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Hiho!");
talkEntry:addResponse("Holldario.");
talkEntry:addResponse("'allo, 'allo!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Ta-ta!");
talkEntry:addResponse("Don't forget me!");
talkEntry:addResponse("Stay outta trouble!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Ta-da!");
talkEntry:addResponse("Vergiss mich nicht!");
talkEntry:addResponse("Halt dich von Ärger fern!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Ta-ta!");
talkEntry:addResponse("Don't forget me!");
talkEntry:addResponse("Stay outta trouble!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Ta-da!");
talkEntry:addResponse("Vergiss mich nicht!");
talkEntry:addResponse("Halt dich von Ärger fern!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("As fine as a hair upon my head.");
talkEntry:addResponse("I'm dandy!");
talkEntry:addResponse("Fine, just fine!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befind");
talkEntry:addResponse("So gut, wie ein Haar auf meinem Kopf.");
talkEntry:addResponse("Mir geht's prima!");
talkEntry:addResponse("Gut, einfach nur gut!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("Fosco Goodbarrel, at your service!");
talkEntry:addResponse("Fosco Goodbarrel, halfling extraordinaire!");
talkEntry:addResponse("You don't know me?! I'm Fosco Goodbarrel!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ihr name");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Fosco Goodbarrel, zu Diensten");
talkEntry:addResponse("Fosco Goodbarrel, der außergewöhnliche Halbling.");
talkEntry:addResponse("Du kennst mich nicht? Ich bin Fosco Goodbarrel.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(333, "=", 6));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest update] Aurora's Staff: Part II"));
talkEntry:addResponse("Ahh, the staff! Well, since I like you, I'm willing to part with it for five gold coins. Tell you what: I've had my eye on a certain ornate dagger used by the lizard, Kai'itza. Bring it to me, the staff is yours. He's in <town name>.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(333, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(333, "=", 6));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Die Geistereiche I"));
talkEntry:addResponse("Ahh, der Stab! Nun, weil ich dich mag, gebe ich es dir für fünf Goldstücke. Ich sag' dir was: Ich habe ein Auge auf den goldenen Dolch des Echsenmenschen Kai'itza geworfen. Bring ihn mir, den Stab. ");
talkEntry:addConsequence(npc.base.consequence.quest.quest(333, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(333, "=", 6));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("staff");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest update] Aurora's Staff: Part II"));
talkEntry:addResponse("Ahh, the staff! Well, since I like you, I'm willing to part with it for five gold coins. Tell you what: I've had my eye on a certain ornate dagger used by the lizard, Kai'itza. Bring it to me, the staff is yours. He's in <town name>.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(333, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(333, "=", 6));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("german");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Die Geistereiche I"));
talkEntry:addResponse("Ahh, der Stab! Nun, weil ich dich mag, gebe ich es dir für fünf Goldstücke. Ich sag' dir was: Ich habe ein Auge auf den goldenen Dolch des Echsenmenschen Kai'itza geworfen. Bring ihn mir, den Stab.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(333, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(333, "=", 7));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("You want your staff, you bring me my ornate dagger. And it had better be Kai'itza's. I'll be able to spot a fake. You'll find the lizard in <town name>. She stole my flute.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(333, "=", 7));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Du möchtest den Stab, dann bringt mir meinem verzierten Dolch. Dabei hanldelt es sich um den Kai'tza. Ich bin in der Lage einen Betrug zubemerken. Du findest den Echsenmensch in <Stadtname>. Sie hat meine Flöte gestohlen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(333, "=", 7));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("staff");
talkEntry:addResponse("You want your staff, you bring me my ornate dagger. And it had better be Kai'itza's. I'll be able to spot a fake. You'll find the lizard in <town name>. She stole my flute.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(333, "=", 7));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Stab");
talkEntry:addResponse("Du möchtest den Stab, dann bringt mir meinem verzierten Dolch. Dabei hanldelt es sich um den Kai'tza. Ich bin in der Lage einen Betrug zubemerken. Du findest den Echsenmensch in <Stadtname>. Sie hat meine Flöte gestohlen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(333, "=", 10));
talkEntry:addCondition(npc.base.condition.item.item(190, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest updated] Aurora's Staff: Part II."));
talkEntry:addResponse("That's the one! I didn't think you had it in ya. Well, I'm a halfling of his word today. Here's the staff. I hope you enjoy your piece of wood.");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(190, 1, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(209, 1, 499, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(13372, "=", 11));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(333, "=", 10));
talkEntry:addCondition(npc.base.condition.item.item(190, "all", ">", 0, nil));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 80 Kupferstücke."));
talkEntry:addResponse("Das ist er! I hätte ja nicht gedacht, dass du das schaffst. Nun, ich bin ein Halbling der zu seinen worten steht. Hier hast du den Stab. Viel Spaß mit dem Stück Holz.");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(190, 1, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(209, 1, 499, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(13372, "=", 11));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(336, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] The Mischievous Halfling"));
talkEntry:addResponse("Well, since you asked, I am in need of a costume for my next...'play.' I shall be playing the part of a foreign halfling dignitary, upon whom the government bestow lavish gifts. I need one black coat and one amulet.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(336, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(336, "=", 0));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Die Geistereiche II"));
talkEntry:addResponse("Nun, da du fragst, ich bräuchte ein Kostüm für mein nächstes ...'Stück'. Ich werde die Rolle eines außländischen Halblingswürdenträgers spielen, den die Regierung großzügoig mit Geschenken überhäufen wird. Ich brauche einen schwarzen Mantel und ein Amulett.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(336, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(336, "=", 0));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] The Mischievous Halfling"));
talkEntry:addResponse("Well, since you asked, I am in need of a costume for my next...'play.' I shall be playing the part of a foreign halfling dignitary, upon whom the government bestow lavish gifts. I need one black coat and one amulet..");
talkEntry:addConsequence(npc.base.consequence.quest.quest(336, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(336, "=", 0));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Die Geistereiche II"));
talkEntry:addResponse("Nun, da du fragst, ich bräuchte ein Kostüm für mein nächstes ...'Stück'. Ich werde die Rolle eines außländischen Halblingswürdenträgers spielen, den die Regierung großzügoig mit Geschenken überhäufen wird. Ich brauche einen schwarzen Mantel und ein Amulett.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(336, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(336, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2384, "all", "<", 1, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("I need you to find me one black coat. Don't worry, I'll see to it that you are compensated.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(336, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2384, "all", "<", 1, nil));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Ich möchte, dass du mir einen schwarzen Mantel findest. Keine Sorge, ich sorge schon dafür, dass du entschädigt wirst.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(336, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2384, "all", "<", 1, nil));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addResponse("I need you to find me one black coat. Don't worry, I'll see to it that you are compensated.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(336, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2384, "all", "<", 1, nil));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addResponse("Ich möchte, dass du mir einen schwarzen Mantel findest. Keine Sorge, ich sorge schon dafür, dass du entschädigt wirst.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(336, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(222, "all", "<", 1, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("You've got one black coat for me, but I also need one amulet. Don't worry, I'll see to it that you are compensated.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(336, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(222, "all", "<", 1, nil));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Du hast mir den schwarzen Mantel gebracht, aber ich bräuchte da noch ein Amulett. Keine Sorge, ich werde dafür sorgen, dass du entschädigt wirst.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(336, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(222, "all", "<", 1, nil));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addResponse("You've got one black coat for me, but I also need one amulet. Don't worry, I'll see to it that you are compensated.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(336, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(222, "all", "<", 1, nil));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addResponse("Du hast mir den schwarzen Mantel gebracht, aber ich bräuchte da noch ein Amulett. Keine Sorge, ich werde dafür sorgen, dass du entschädigt wirst.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(336, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2384, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.item.item(222, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 12 silver coins and a strawberry cake."));
talkEntry:addResponse("Perfect! I shall certainly fool the...audience with this disgui...erm...costume. Oh, righto. Take your money. Here, you must try one of these, too! Just divine!");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 1200));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2384, 1, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(222, 1, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(354, 1, 599, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(336, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(336, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2384, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.item.item(222, "all", ">", 0, nil));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 12 Silberstücke und einen Erbbeerkuchen."));
talkEntry:addResponse("Großartig! I werde die... Zuschauer sicherlich hereinlegen mit dieser Tarnung...ähm...mit diesem Kostüm. Ah, ja richelig. Nimm dein Geld! Und hier, davon musst du einen probieren! Schmeckt ganz wunderbar!");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 1200));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2384, 1, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(222, 1, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(354, 1, 599, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(336, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(336, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("I've got to get busy studying for my new role. Take care, now!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(336, "=", 2));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Ich muss meine neue Rolle lernen. Lebt wohl!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(336, "=", 2));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addResponse("I've got to get busy studying for my new role. Take care, now!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(336, "=", 2));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addResponse("Ich muss mich ranhalten und meine neue Rolle lernen. Lebt wohl!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("I'm a charming rogue!");
talkEntry:addResponse("When you are this handsome, people pay you for it!");
talkEntry:addResponse("I steal from the rich. And I steal from the poor. And I give to ol' Fosco!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Ich bin ein entzückender Spitzbube!");
talkEntry:addResponse("Wenn man so gut aussieht, bezahlen die Leute einen.");
talkEntry:addResponse("Ich nehme von den Reichen. Ich nehme von den Armen. Und ich gebe alles an Fosco!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("I'm a charming rogue!");
talkEntry:addResponse("When you are this handsome, people pay you for it!");
talkEntry:addResponse("I steal from the rich. And I steal from the poor. And I give to ol' Fosco!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Ich bin ein entzückender Spitzbube!");
talkEntry:addResponse("Wenn man so gut aussieht, bezahlen die Leute einen.");
talkEntry:addResponse("Ich nehme von den Reichen. Ich nehme von den Armen. Und ich gebe alles an Fosco!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("It was an island, surrounded by water, not much more to say, really.");
talkEntry:addResponse("Lots o' the people there were...hmm...well...slow to catch on.");
talkEntry:addResponse("The name was strange. The land was stranger. The people were strangest.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Es war eine Insel umgeben von Wasser, da gibt's nichts weiter zu sagen.");
talkEntry:addResponse("Viele Leute da hatten...wenig Durchblick.");
talkEntry:addResponse("Der Name war seltsam. Das Land war seltsamer. Die Leute dort warem am seltsamsten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("Ah, well! The pleasure is yours!");
talkEntry:addResponse("I guessed that!");
talkEntry:addResponse("That was my mother's name!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Ah, nun! Die Freude luegt ganz auf Eurer Seite.");
talkEntry:addResponse("Ich hab's mir gedacht!");
talkEntry:addResponse("So hieß meine Mutter auch!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addResponse("Even I wouldn't dare say it to his face, but the fellow's a nut.");
talkEntry:addResponse("Just your typical mage, that fellow. Prances around like his feet don't stink.");
talkEntry:addResponse("Book smarts will only get you so far.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Selbst ich würde nicht wagen es ihm ins Gesicht zu sagen, aber dieser Zeitgenosse ist 'ne hohle Nuss.");
talkEntry:addResponse("Nichts weiter als der typische Magier, stolziert umher als würden seine Füße niemals stinken.");
talkEntry:addResponse("Weisheiten aus Büchern sind nicht alles.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Even I wouldn't dare say it to his face, but the fellow's a nut.");
talkEntry:addResponse("Just your typical mage, that fellow. Prances around like his feet don't stink.");
talkEntry:addResponse("Book smarts will only get you so far.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Selbst ich würde nicht wagen es ihm ins Gesicht zu sagen, aber dieser Zeitgenosse ist 'ne hohle Nuss.");
talkEntry:addResponse("Nichts weiter als der typische Magier, stolziert umher als würden seine Füße niemals stinken.");
talkEntry:addResponse("Weisheiten aus Büchern sind nicht alles.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("They might be quick o' mind, but their feet are another story.");
talkEntry:addResponse("That town has quite the interest in books. A fair penny can be made from providing them.");
talkEntry:addResponse("Runewick is full of smarmy educated types. Not my poison.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Die glauben dort, sie hätten kluge Köpfe, aber frag' nicht nach deren Füßen.");
talkEntry:addResponse("Die Stadt hat recht interessante Bucher, da könhnte man richtig Geld rausschlagen.");
talkEntry:addResponse("Runewick is voll von kriecherischen, gebildeten Kreaturen. Nicht ganz mein Geschmack.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("How could anyone not admire the Don?");
talkEntry:addResponse("He knows what he wants, and how to get it.");
talkEntry:addResponse("He knows that money is the only thing of value in this world. Can't fault him for that!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Wie könnte ihrgendwer den Don nicht verehren?");
talkEntry:addResponse("Er weiß was er will, und wie er es bekommt.");
talkEntry:addResponse("Er weiß das Geld das einzige ist, was in dieser Welt nzählt. Das ist kein Gund ihm was vorzuwerfen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Plenty of coin flowing through those streets.");
talkEntry:addResponse("Ahh...Galmair. If you know where to look, you'll find what you need.");
talkEntry:addResponse("Galmair? I try to lighten the purses of that town whenever I have a moment to help.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Da wandern die Pfennige durch die Straßen.");
talkEntry:addResponse("Ahh...Galmair. Wenn man weißt, wo man suchen musst, so findet man es dort.");
talkEntry:addResponse("Galmair? Dort erleichtet ich die Geldbörsen wann immer ich kann.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Queen");
talkEntry:addResponse("Quite the looker, that one.");
talkEntry:addResponse("Perhaps I should show her some of the ol' Fosco charm.");
talkEntry:addResponse("You didn't hear it from me, but I hear the Don has an eye for her.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königin");
talkEntry:addResponse("Sie zieht die Blick auf sich.");
talkEntry:addResponse("Vielleicht sollte ich sie mit meinem Fosco-Charm bezaubern? Hm?");
talkEntry:addResponse("Das wisst Ihr nicht von mir, aber ich hörte der Don hat ein Auge auf sie geworfen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Quite the looker, that one.");
talkEntry:addResponse("Perhaps I should show her some of the ol' Fosco charm.");
talkEntry:addResponse("You didn't hear it from me, but I hear the Don has an eye for her.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Sie zieht die Blick auf sich.");
talkEntry:addResponse("Vielleicht sollte ich sie mit meinem Fosco-Charm bezaubern? Hm?");
talkEntry:addResponse("Das wisst Ihr nicht von mir, aber ich hörte der Don hat ein Auge auf sie geworfen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Nice and trusting, those folk. Makes things much easier.");
talkEntry:addResponse("Big hearts, smaller minds.");
talkEntry:addResponse("Wouldn't mind making ol' Rosaline my Queen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Freundlich und gutgläubig, diese Völkchen. Dies erleichtert vieles.");
talkEntry:addResponse("Große Herzen, aber keine großen Geister.");
talkEntry:addResponse("Ich hätte nichts dagegen Rosaline zu meiner Königin zu machen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("albar");
talkEntry:addResponse("Bo-ring.");
talkEntry:addResponse("Humans are almost too easy. Almost.");
talkEntry:addResponse("Albar...eh. Doesn't interest me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("Laaangweilig.");
talkEntry:addResponse("Menschen sind fast zu lässig. Fast.");
talkEntry:addResponse("Albar...ähm. Interessiert mich nicht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addResponse("Bo-ring.");
talkEntry:addResponse("Humans are almost too easy. Almost.");
talkEntry:addResponse("Gynk...eh. Doesn't interest me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("Laaangweilig.");
talkEntry:addResponse("Menschen sind fast zu lässig. Fast.");
talkEntry:addResponse("Gynk...ähm. Interessiert mich nicht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Bo-ring.");
talkEntry:addResponse("Humans are almost too easy. Almost.");
talkEntry:addResponse("Salkamar...eh. Doesn't interest me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Laaangweilig.");
talkEntry:addResponse("Menschen sind fast zu lässig. Fast.");
talkEntry:addResponse("Salkamar...ähm. Interessiert mich nicht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("To my mind there are two types of Gods: Ronagan, and the ones he steals from!");
talkEntry:addResponse("If Ronagan's proud, I'm doing well.");
talkEntry:addResponse("Have you been watching your purse? In the time we've been speaking, I've stolen it from you, and then returned it, completely full.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Für mich gibt es zwei Arten von Göttern: Ronagan und die jenigen die er bestiehlt.");
talkEntry:addResponse("Wenn Ronagan sich freut, dann hab ich was richtig gut gemacht!");
talkEntry:addResponse("Hast du auf deinen Geldbeutel geachtet? Während wir hier reden, habe ich's gestohlen und zurückgelegt, natürlich ist es noch voll.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Adron");
talkEntry:addResponse("To my mind there are two types of Gods: Ronagan, and the ones he steals from!");
talkEntry:addResponse("I won't be inviting that God for dinner any time soon.");
talkEntry:addResponse("Have you been watching your purse? In the time we've been speaking, I've stolen it from you, and then returned it, completely full.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Adron");
talkEntry:addResponse("Für mich gibt es zwei Arten von Göttern: Ronagan und die jenigen die er bestiehlt.");
talkEntry:addResponse("Wenn Ronagan sich freut, dann hab ich was richtig gut gemacht!");
talkEntry:addResponse("Hast du auf deinen Geldbeutel geachtet? Während wir hier reden, habe ich's gestohlen und zurückgelegt, natürlich ist es noch voll.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addResponse("To my mind there are two types of Gods: Ronagan, and the ones he steals from!");
talkEntry:addResponse("I won't be inviting that God for dinner any time soon.");
talkEntry:addResponse("Have you been watching your purse? In the time we've been speaking, I've stolen it from you, and then returned it, completely full.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addResponse("Für mich gibt es zwei Arten von Göttern: Ronagan und die jenigen die er bestiehlt.");
talkEntry:addResponse("Wenn Ronagan sich freut, dann hab ich was richtig gut gemacht!");
talkEntry:addResponse("Hast du auf deinen Geldbeutel geachtet? Während wir hier reden, habe ich's gestohlen und zurückgelegt, natürlich ist es noch voll.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cherga");
talkEntry:addResponse("To my mind there are two types of Gods: Ronagan, and the ones he steals from!");
talkEntry:addResponse("I won't be inviting that God for dinner any time soon.");
talkEntry:addResponse("Have you been watching your purse? In the time we've been speaking, I've stolen it from you, and then returned it, completely full.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addResponse("Für mich gibt es zwei Arten von Göttern: Ronagan und die jenigen die er bestiehlt.");
talkEntry:addResponse("Wenn Ronagan sich freut, dann hab ich was richtig gut gemacht!");
talkEntry:addResponse("Hast du auf deinen Geldbeutel geachtet? Während wir hier reden, habe ich's gestohlen und zurückgelegt, natürlich ist es noch voll.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elara");
talkEntry:addResponse("To my mind there are two types of Gods: Ronagan, and the ones he steals from!");
talkEntry:addResponse("I won't be inviting that God for dinner any time soon.");
talkEntry:addResponse("Have you been watching your purse? In the time we've been speaking, I've stolen it from you, and then returned it, completely full.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elara");
talkEntry:addResponse("Für mich gibt es zwei Arten von Göttern: Ronagan und die jenigen die er bestiehlt.");
talkEntry:addResponse("Wenn Ronagan sich freut, dann hab ich was richtig gut gemacht!");
talkEntry:addResponse("Hast du auf deinen Geldbeutel geachtet? Während wir hier reden, habe ich's gestohlen und zurückgelegt, natürlich ist es noch voll.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Eldan");
talkEntry:addResponse("To my mind there are two types of Gods: Ronagan, and the ones he steals from!");
talkEntry:addResponse("I won't be inviting that God for dinner any time soon.");
talkEntry:addResponse("Have you been watching your purse? In the time we've been speaking, I've stolen it from you, and then returned it, completely full.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eldan");
talkEntry:addResponse("Für mich gibt es zwei Arten von Göttern: Ronagan und die jenigen die er bestiehlt.");
talkEntry:addResponse("Wenn Ronagan sich freut, dann hab ich was richtig gut gemacht!");
talkEntry:addResponse("Hast du auf deinen Geldbeutel geachtet? Während wir hier reden, habe ich's gestohlen und zurückgelegt, natürlich ist es noch voll.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Findari");
talkEntry:addResponse("To my mind there are two types of Gods: Ronagan, and the ones he steals from!");
talkEntry:addResponse("I won't be inviting that God for dinner any time soon.");
talkEntry:addResponse("Have you been watching your purse? In the time we've been speaking, I've stolen it from you, and then returned it, completely full.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Findari");
talkEntry:addResponse("Für mich gibt es zwei Arten von Göttern: Ronagan und die jenigen die er bestiehlt.");
talkEntry:addResponse("Wenn Ronagan sich freut, dann hab ich was richtig gut gemacht!");
talkEntry:addResponse("Hast du auf deinen Geldbeutel geachtet? Während wir hier reden, habe ich's gestohlen und zurückgelegt, natürlich ist es noch voll.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("To my mind there are two types of Gods: Ronagan, and the ones he steals from!");
talkEntry:addResponse("I won't be inviting that God for dinner any time soon.");
talkEntry:addResponse("Have you been watching your purse? In the time we've been speaking, I've stolen it from you, and then returned it, completely full.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("Für mich gibt es zwei Arten von Göttern: Ronagan und die jenigen die er bestiehlt.");
talkEntry:addResponse("Wenn Ronagan sich freut, dann hab ich was richtig gut gemacht!");
talkEntry:addResponse("Hast du auf deinen Geldbeutel geachtet? Während wir hier reden, habe ich's gestohlen und zurückgelegt, natürlich ist es noch voll.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addResponse("To my mind there are two types of Gods: Ronagan, and the ones he steals from!");
talkEntry:addResponse("I won't be inviting that God for dinner any time soon.");
talkEntry:addResponse("Have you been watching your purse? In the time we've been speaking, I've stolen it from you, and then returned it, completely full.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addResponse("Für mich gibt es zwei Arten von Göttern: Ronagan und die jenigen die er bestiehlt.");
talkEntry:addResponse("Wenn Ronagan sich freut, dann hab ich was richtig gut gemacht!");
talkEntry:addResponse("Hast du auf deinen Geldbeutel geachtet? Während wir hier reden, habe ich's gestohlen und zurückgelegt, natürlich ist es noch voll.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Moshran");
talkEntry:addResponse("To my mind there are two types of Gods: Ronagan, and the ones he steals from!");
talkEntry:addResponse("I won't be inviting that God for dinner any time soon.");
talkEntry:addResponse("Have you been watching your purse? In the time we've been speaking, I've stolen it from you, and then returned it, completely full.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Moshran");
talkEntry:addResponse("Für mich gibt es zwei Arten von Göttern: Ronagan und die jenigen die er bestiehlt.");
talkEntry:addResponse("Wenn Ronagan sich freut, dann hab ich was richtig gut gemacht!");
talkEntry:addResponse("Hast du auf deinen Geldbeutel geachtet? Während wir hier reden, habe ich's gestohlen und zurückgelegt, natürlich ist es noch voll.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addTrigger("Nargùn");
talkEntry:addResponse("To my mind there are two types of Gods: Ronagan, and the ones he steals from!");
talkEntry:addResponse("I won't be inviting that God for dinner any time soon.");
talkEntry:addResponse("Have you been watching your purse? In the time we've been speaking, I've stolen it from you, and then returned it, completely full.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addTrigger("Nargùn");
talkEntry:addResponse("Für mich gibt es zwei Arten von Göttern: Ronagan und die jenigen die er bestiehlt.");
talkEntry:addResponse("Wenn Ronagan sich freut, dann hab ich was richtig gut gemacht!");
talkEntry:addResponse("Hast du auf deinen Geldbeutel geachtet? Während wir hier reden, habe ich's gestohlen und zurückgelegt, natürlich ist es noch voll.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("To my mind there are two types of Gods: Ronagan, and the ones he steals from!");
talkEntry:addResponse("I won't be inviting that God for dinner any time soon.");
talkEntry:addResponse("Have you been watching your purse? In the time we've been speaking, I've stolen it from you, and then returned it, completely full.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("Für mich gibt es zwei Arten von Göttern: Ronagan und die jenigen die er bestiehlt.");
talkEntry:addResponse("Wenn Ronagan sich freut, dann hab ich was richtig gut gemacht!");
talkEntry:addResponse("Hast du auf deinen Geldbeutel geachtet? Während wir hier reden, habe ich's gestohlen und zurückgelegt, natürlich ist es noch voll.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("To my mind there are two types of Gods: Ronagan, and the ones he steals from!");
talkEntry:addResponse("If Ronagan's proud, I'm doing well.");
talkEntry:addResponse("Have you been watching your purse? In the time we've been speaking, I've stolen it from you, and then returned it, completely full.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("Für mich gibt es zwei Arten von Göttern: Ronagan und die jenigen die er bestiehlt.");
talkEntry:addResponse("Wenn Ronagan sich freut, dann hab ich was richtig gut gemacht!");
talkEntry:addResponse("Hast du auf deinen Geldbeutel geachtet? Während wir hier reden, habe ich's gestohlen und zurückgelegt, natürlich ist es noch voll.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("To my mind there are two types of Gods: Ronagan, and the ones he steals from!");
talkEntry:addResponse("I won't be inviting that God for dinner any time soon.");
talkEntry:addResponse("Have you been watching your purse? In the time we've been speaking, I've stolen it from you, and then returned it, completely full.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("Für mich gibt es zwei Arten von Göttern: Ronagan und die jenigen die er bestiehlt.");
talkEntry:addResponse("Wenn Ronagan sich freut, dann hab ich was richtig gut gemacht!");
talkEntry:addResponse("Hast du auf deinen Geldbeutel geachtet? Während wir hier reden, habe ich's gestohlen und zurückgelegt, natürlich ist es noch voll.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("To my mind there are two types of Gods: Ronagan, and the ones he steals from!");
talkEntry:addResponse("I won't be inviting that God for dinner any time soon.");
talkEntry:addResponse("Have you been watching your purse? In the time we've been speaking, I've stolen it from you, and then returned it, completely full.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("Für mich gibt es zwei Arten von Göttern: Ronagan und die jenigen die er bestiehlt.");
talkEntry:addResponse("Wenn Ronagan sich freut, dann hab ich was richtig gut gemacht!");
talkEntry:addResponse("Hast du auf deinen Geldbeutel geachtet? Während wir hier reden, habe ich's gestohlen und zurückgelegt, natürlich ist es noch voll.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("To my mind there are two types of Gods: Ronagan, and the ones he steals from!");
talkEntry:addResponse("I won't be inviting that God for dinner any time soon.");
talkEntry:addResponse("Have you been watching your purse? In the time we've been speaking, I've stolen it from you, and then returned it, completely full.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("Für mich gibt es zwei Arten von Göttern: Ronagan und die jenigen die er bestiehlt.");
talkEntry:addResponse("Wenn Ronagan sich freut, dann hab ich was richtig gut gemacht!");
talkEntry:addResponse("Hast du auf deinen Geldbeutel geachtet? Während wir hier reden, habe ich's gestohlen und zurückgelegt, natürlich ist es noch voll.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Zhambra");
talkEntry:addResponse("To my mind there are two types of Gods: Ronagan, and the ones he steals from!");
talkEntry:addResponse("I won't be inviting that God for dinner any time soon.");
talkEntry:addResponse("Have you been watching your purse? In the time we've been speaking, I've stolen it from you, and then returned it, completely full.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zhambra");
talkEntry:addResponse("Für mich gibt es zwei Arten von Göttern: Ronagan und die jenigen die er bestiehlt.");
talkEntry:addResponse("Wenn Ronagan sich freut, dann hab ich was richtig gut gemacht!");
talkEntry:addResponse("Hast du auf deinen Geldbeutel geachtet? Während wir hier reden, habe ich's gestohlen und zurückgelegt, natürlich ist es noch voll.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("Tell you what: you hand me the money now, and I'll make sure to get the goods to you when I can.");
talkEntry:addResponse("How about you give me your goods now, and I'll send the money to pay for them when I have it.");
talkEntry:addResponse("I can't just be trading with any passerby! I've got a reputation to uphold!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Ich sag dir was: Du gibst mir dein Geld und ich bemühe mich so gut ich kann,dass die Waren bei dir ankommen.");
talkEntry:addResponse("Wie waäre es damit? Du gibst mir deine Sachen und ich bezahl dich, wenn ich das Geld hab.");
talkEntry:addResponse("Ich kann nicht mit jedem Handeln. Mein Ruf steht auf dem Spiel.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("Has anyone ever told you that you have a rather noticeable nose?");
talkEntry:addResponse("While we've been standing here, I've stolen your purse, and then returned it, compeletely full. I know, it's amazing, thank you.");
talkEntry:addResponse("If there is one thing I've learned during my travels, it's this: never trust a sober dwarf.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Hat dir schonmal einer gesagt, das du eine sehr auffällige Nase hast?");
talkEntry:addResponse("Hast du auf deinen Geldbeutel geachtet? Während wir hier reden, habe ich's gestohlen und zurückgelegt, natürlich ist es noch voll.");
talkEntry:addResponse("Wenn ich auf meinen Reisen eines gelernt habe, dann flogendes, vertraue niemals einem nüchternen Zwerg.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Fosco");
talkEntry:addTrigger("Goodbarrel");
talkEntry:addResponse("Such a delightful name, don't you agree?");
talkEntry:addResponse("Ahh...Fosco Goodbarrel. It just rolls off of the tongue.");
talkEntry:addResponse("From here to Pennymill, that name will make any woman weak at the knees.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Fosco");
talkEntry:addTrigger("Goodbarrel");
talkEntry:addResponse("Welch ein entzückender Name, findest du nicht auch?");
talkEntry:addResponse("Ahh...Fosco Goodbarrel. Das geht runter wie Honig!");
talkEntry:addResponse("Von hier bis nach Pennymill, dieser Name lässt alle Frauen niederknien.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("#me taps his foot impatiently.");
talkEntry:addResponse("I knew you were going to say that!");
talkEntry:addResponse("Yes, yes. Whatever. You should keep your purse in a less obvious place.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("#me tappst ungeduldigt mit dem Fuß auf den Boden.");
talkEntry:addResponse("Ich wusste du würdest das sagen!");
talkEntry:addResponse("Ja.Ja. Du solltest deine Geldbörse weniger offensichtlich bei dir tagen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("#me taps his foot impatiently.");
talkEntry:addResponse("I knew you were going to say that!");
talkEntry:addResponse("Yes, yes. Whatever. You should keep your purse in a less obvious place.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("#me tappst ungeduldigt mit dem Fuß auf den Boden.");
talkEntry:addResponse("Ich wusste du würdest das sagen!");
talkEntry:addResponse("Ja.Ja. Du solltest deine Geldbörse weniger offensichtlich bei dir tagen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("#me taps his foot impatiently.");
talkEntry:addResponse("I knew you were going to say that!");
talkEntry:addResponse("Yes, yes. Whatever. You should keep your purse in a less obvious place.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("#me tappst ungeduldigt mit dem Fuß auf den Boden.");
talkEntry:addResponse("Ich wusste du würdest das sagen!");
talkEntry:addResponse("Ja.Ja. Du solltest deine Geldbörse weniger offensichtlich bei dir tagen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me vollführt einen kleinen Freudentanz auf der Stelle.", "#me performs a brief jig on the spot.");
talkingNPC:addCycleText("#me beobachtete dich aus den Augenwinkeln.", "#me glances at you out of the corner of his eye.");
talkingNPC:addCycleText("#me lacht vorwitzig.", "#me laughs cheekily.");
talkingNPC:addCycleText("#me lächelt schüchtern.", "#me grins slyly.");
talkingNPC:addCycleText("#me stampft auf dem Boden.", "#me kicks at the ground.");
talkingNPC:addCycleText("#me lehnt sich zuürch und gähnt.", "#me leans back and yawns.");
talkingNPC:addCycleText("#me kratzt sich am Hinterkopf.", "#me scratches the back of his head.");
talkingNPC:addCycleText("#me pfeipft eine nette Melodie.", "#me whistles a pleasant tune.");
talkingNPC:addCycleText("#me leckt sich die Lippen.", "#me licks his lips.");
talkingNPC:addCycleText("#me klopft sich auf den Bauch und seuftzt schwach.", "#me pats his stomach, sighing faintly.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(5);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Dieser NPC ist Fosco Goodbarel der fiese Halbling.", "This NPC is Fosco Goodbarel the mischievous halfling.");
mainNPC:setUseMessage("So arbeite ich nicht!", "I don't work like that!");
mainNPC:setConfusedMessage("#me schaut verwirrt.", "#me looks around confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 457);
mainNPC:setEquipment(11, 0);
mainNPC:setEquipment(5, 0);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 384);
mainNPC:setEquipment(9, 366);
mainNPC:setEquipment(10, 53);
mainNPC:setAutoIntroduceMode(true);

mainNPC:initDone();
end;

function receiveText(npcChar, texttype, message, speaker) mainNPC:receiveText(npcChar, speaker, message); end;
function nextCycle(npcChar) mainNPC:nextCycle(npcChar); end;
function lookAtNpc(npcChar, char, mode) mainNPC:lookAt(npcChar, char, mode); end;
function useNPC(npcChar, char) mainNPC:use(npcChar, char); end;
initNpc();
initNpc = nil;
-- END
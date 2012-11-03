--------------------------------------------------------------------------------
-- NPC Name: Johnathan Idler                                             None --
-- NPC Job:  Mage                                                             --
--                                                                            --
-- NPC Race: human                      NPC Position:  898, 760, 1            --
-- NPC Sex:  male                       NPC Direction: north                  --
--                                                                            --
-- Author:   Miriam                                                           --
--                                                       easyNPC Parser v1.21 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (0, 898, 760, 1, 0, 'Johnathan Idler', 'npc.johnathan_idler', 0, 2, 5, 221, 199, 140, 255, 210, 204);
---]]

require("npc.base.basic")
require("npc.base.condition.chance")
require("npc.base.condition.language")
require("npc.base.condition.quest")
require("npc.base.consequence.inform")
require("npc.base.consequence.quest")
require("npc.base.talk")
module("npc.johnathan_idler", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Jonathan Idler the mage. Keywords: Profession, Zassaria, Quest, Order."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Jonathan Idler  der Magier. Schlüßsselwörter: Beruf, Zarissa, Quest, Auftrag."));
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
talkEntry:addResponse("Be greeted. Did you come here to read a book?");
talkEntry:addResponse("#me truns a page of his book.");
talkEntry:addResponse("Hm? What happend? I'm busy reading...");
talkEntry:addResponse("Greetings. I'm sorry, but i'm using this book at the moment. There are several copies of it over there in the bookself. I read them already.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Grüße");
talkEntry:addTrigger("Gruß");
talkEntry:addTrigger("Guten Morgen");
talkEntry:addTrigger("Guten Tag");
talkEntry:addTrigger("Guten Abend");
talkEntry:addTrigger("Gute Nacht");
talkEntry:addTrigger("Mahlzeit");
talkEntry:addTrigger("Tach");
talkEntry:addTrigger("Moin");
talkEntry:addTrigger("Mohltied");
talkEntry:addResponse("Seid grüßt. Seid Ihr gekommen um ein Buch zu lesen?");
talkEntry:addResponse("#me blättert in einem Buch.");
talkEntry:addResponse("Hm? Was ist denn los? Ich lese gerade...");
talkEntry:addResponse("Grüße. Tut mir leid, aber ich lese gerade dieses Buch. Es gibt aber noch weiter Abschriften, da hinten im Regal, die habe ich bereits gelesen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Be greeted. Did you come here to read a book?");
talkEntry:addResponse("#me truns a page of his book.");
talkEntry:addResponse("Hm? What happend? I'm busy reading...");
talkEntry:addResponse("Greetings. I'm sorry, but i'm using this book at the moment. There are several copies of it over there in the bookself. I read them already.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Seid grüßt. Seid Ihr gekommen um ein Buch zu lesen?");
talkEntry:addResponse("#me blättert in einem Buch.");
talkEntry:addResponse("Hm? Was ist denn los? Ich lese gerade...");
talkEntry:addResponse("Grüße. Tut mir leid, aber ich lese gerade dieses Buch. Es gibt aber noch weiter Abschriften, da hinten im Regal, die habe ich bereits gelesen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("May Elara be with you.");
talkEntry:addResponse("May Eldan be with you.");
talkEntry:addResponse("Enjoy reading!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Möge Elara über Euch wachen.");
talkEntry:addResponse("Möge Eldan über Euch wachen.");
talkEntry:addResponse("Viel Spaß beim Lesen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("May Elara be with you.");
talkEntry:addResponse("May Eldan be with you.");
talkEntry:addResponse("Enjoy reading!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Möge Elara über Euch wachen.");
talkEntry:addResponse("Möge Eldan über Euch wachen.");
talkEntry:addResponse("Viel Spaß beim Lesen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("Fine. As long as I can read my book I fell fine.");
talkEntry:addResponse("Hm?");
talkEntry:addResponse("#me continues reading.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befind");
talkEntry:addResponse("Gut gut. Solange man mich hier in Ruhe lesen lässt.");
talkEntry:addResponse("Hm?");
talkEntry:addResponse("#me liest weiterhin in seinem Buch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("Ah, yes...");
talkEntry:addResponse("#me moves his glasses.");
talkEntry:addResponse("Who? Me? I'm Joanthat. Joanathan Ideler.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Ah, yes...");
talkEntry:addResponse("#me rückt seine Brille zurecht.");
talkEntry:addResponse("Wer? Ich? Ich bin Jonathan. Jonathan Idler.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("sell");
talkEntry:addTrigger("buy");
talkEntry:addTrigger("wares");
talkEntry:addTrigger("price");
talkEntry:addTrigger("trade");
talkEntry:addTrigger("purchase");
talkEntry:addResponse("I'm a mage, not a merchant.Both words beginn with the letter M, did you know that?");
talkEntry:addResponse("Sorry, but I'm busy reading...");
talkEntry:addResponse("Ah! Now i cfan see things clear.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("kauf");
talkEntry:addTrigger("waren");
talkEntry:addTrigger("preis");
talkEntry:addTrigger("Handel");
talkEntry:addTrigger("veräußer");
talkEntry:addTrigger("erwerb");
talkEntry:addResponse("Ich bin ein Magier, kein Kaufmann.");
talkEntry:addResponse("Entschuldigt, ich lese gerade, ...");
talkEntry:addResponse("Ah. Das erklärt einiges!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Zarissa");
talkEntry:addTrigger("Lizzard");
talkEntry:addTrigger("oil lamp");
talkEntry:addResponse("Ah, the lizzard lady Zassaria send you? I'm very buys with my studies right now, but i'll see her later. Can you tell her, please?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(701, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 1));
talkEntry:addTrigger("Zarissa");
talkEntry:addTrigger("Lizzard");
talkEntry:addTrigger("oil lamp");
talkEntry:addResponse("Ah, die Echsendame Zassaria schickt Euch? Ich bin zur Zeit sehr mit meinen Studien beschäftigt, bitte richtet ihr aus, dass ich sie später aufsuchen werde.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(701, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 3));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("I finally got the oil lamp. Danke.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Ich hab nun endlich die Öllampe erhalten. Thanks.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("I used all my time in live to study the arts of magic.");
talkEntry:addResponse("To train my mind I read many books. Mages should do so, don't you think?");
talkEntry:addResponse("The life o a mages is a live behind pages.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Ich habe Zeit meines Lebens die Künste der Magie studiert.");
talkEntry:addResponse("Um den Verstand zu schulen habe ich viele Bücher gelesen. Magier sollten dies tun, nicht wahr?");
talkEntry:addResponse("Das Leben als Magier ist ein Leben hinter Buchseiten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("I used all my time in live to study the arts of magic.");
talkEntry:addResponse("To train my mind I read many books. Mages should do so, don't you think?");
talkEntry:addResponse("The life o a mages is a live behind pages.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Ich habe Zeit meines Lebens die Künste der Magie studiert.");
talkEntry:addResponse("Um den Verstand zu schulen habe ich viele Bücher gelesen. Magier sollten dies tun, nicht wahr?");
talkEntry:addResponse("Das Leben als Magier ist ein Leben hinter Buchseiten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("The five elder gods are also represented in the five schools of magic.");
talkEntry:addResponse("Magic is a fascinating art.");
talkEntry:addResponse("I read that Acient was used to say spells in a far away place.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Die Alten Götter representieren die fünf Schulen der Magie.");
talkEntry:addResponse("Magie ist eine fanzinierende Kunst.");
talkEntry:addResponse("Ich las, dass an einem fernen Ort Acient genutzt wurde um Zauber aufzusagen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tea");
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tee");
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elf");
talkEntry:addResponse("I'd like to see one...Would you do me a favor?");
talkEntry:addResponse("So, so know an Elf? Really? Would you do me favour?");
talkEntry:addResponse("Seems like I have a task for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elf");
talkEntry:addTrigger("Elb");
talkEntry:addResponse("Ich würde gern mal seinen sehen... Könntet ihr mir einen gefallen tun?");
talkEntry:addResponse("So, Ihr kennt als einen Elfen? Wirklich? Würdet Ihr mir einen Gefallen tun?");
talkEntry:addResponse("Ich hätte da eine Aufgabe für Euch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Buch");
talkEntry:addResponse("This books is about the diffrent races that live in Illarion.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Book");
talkEntry:addResponse("Dieses Buch handelt von den verschiedenrn Rasse die auf Illarion leben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("There are books about the gods in this library. Just look around, I'm sure you'll find them.");
talkEntry:addResponse("I'm usually busy reading, so I don't go to the temples often.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Hier in der Bibliothek gibt es Bücher über die Götter. Seht Euch nur um und Ihr werdet sie finden.");
talkEntry:addResponse("Ich bin normalerweise zu sehr mit lesen beschäftigt, als das ich in den Tempel gehe.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Adron");
talkEntry:addResponse("Ah yes...");
talkEntry:addResponse("Interesting.");
talkEntry:addResponse("This book is not about this god.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Adron");
talkEntry:addResponse("Ah ja...");
talkEntry:addResponse("Interessant.");
talkEntry:addResponse("Diese Buch handelt nicht von diesem Gott.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addResponse("Ah, yes...");
talkEntry:addResponse("Interesting.");
talkEntry:addResponse("This book is not about this god.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addResponse("Ah ja...");
talkEntry:addResponse("Interessant.");
talkEntry:addResponse("Diese Buch handelt nicht von diesem Gott.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cherga");
talkEntry:addResponse("Ah, yes...");
talkEntry:addResponse("Interesting.");
talkEntry:addResponse("This book is not about this god.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addResponse("Ah ja...");
talkEntry:addResponse("Interessant.");
talkEntry:addResponse("Diese Buch handelt nicht von diesem Gott.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elara");
talkEntry:addResponse("Ah, yes...");
talkEntry:addResponse("Interesting.");
talkEntry:addResponse("This book is not about this god.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elara");
talkEntry:addResponse("Ah ja...");
talkEntry:addResponse("Interessant.");
talkEntry:addResponse("Diese Buch handelt nicht von diesem Gott.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Eldan");
talkEntry:addResponse("Ah, yes...");
talkEntry:addResponse("Interesting.");
talkEntry:addResponse("This book is not about this god.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eldan");
talkEntry:addResponse("Ah ja...");
talkEntry:addResponse("Interessant.");
talkEntry:addResponse("Diese Buch handelt nicht von diesem Gott.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Findari");
talkEntry:addResponse("Ah, yes...");
talkEntry:addResponse("Interesting.");
talkEntry:addResponse("This book is not about this god.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Findari");
talkEntry:addResponse("Ah ja...");
talkEntry:addResponse("Interessant.");
talkEntry:addResponse("Diese Buch handelt nicht von diesem Gott.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("Ah, yes...");
talkEntry:addResponse("Interesting.");
talkEntry:addResponse("This book is not about this god.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("Ah ja...");
talkEntry:addResponse("Interessant.");
talkEntry:addResponse("Diese Buch handelt nicht von diesem Gott.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addResponse("Ah, yes...");
talkEntry:addResponse("Interesting.");
talkEntry:addResponse("This book is not about this god.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addResponse("Ah ja...");
talkEntry:addResponse("Interessant.");
talkEntry:addResponse("Diese Buch handelt nicht von diesem Gott.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Moshran");
talkEntry:addResponse("Ah, yes...");
talkEntry:addResponse("Interesting.");
talkEntry:addResponse("This book is not about this god.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Moshran");
talkEntry:addResponse("Ah ja...");
talkEntry:addResponse("Interessant.");
talkEntry:addResponse("Diese Buch handelt nicht von diesem Gott.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargùn");
talkEntry:addTrigger("Nargún");
talkEntry:addResponse("Ah, yes...");
talkEntry:addResponse("Interesting.");
talkEntry:addResponse("This book is not about this god.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargùn");
talkEntry:addTrigger("Nargún");
talkEntry:addResponse("Ah ja...");
talkEntry:addResponse("Interessant.");
talkEntry:addResponse("Diese Buch handelt nicht von diesem Gott.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("Ah, yes...");
talkEntry:addResponse("Interesting.");
talkEntry:addResponse("This book is not about this god.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("Ah ja...");
talkEntry:addResponse("Interessant.");
talkEntry:addResponse("Diese Buch handelt nicht von diesem Gott.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("Ah, yes...");
talkEntry:addResponse("Interesting.");
talkEntry:addResponse("This book is not about this god.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("Ah ja...");
talkEntry:addResponse("Interessant.");
talkEntry:addResponse("Diese Buch handelt nicht von diesem Gott.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("Ah, yes...");
talkEntry:addResponse("Interesting.");
talkEntry:addResponse("This book is not about this god.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("Ah ja...");
talkEntry:addResponse("Interessant.");
talkEntry:addResponse("Diese Buch handelt nicht von diesem Gott.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("Ah, yes...");
talkEntry:addResponse("Interesting.");
talkEntry:addResponse("This book is not about this god.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("Ah ja...");
talkEntry:addResponse("Interessant.");
talkEntry:addResponse("Diese Buch handelt nicht von diesem Gott.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("Ah, yes...");
talkEntry:addResponse("Interesting.");
talkEntry:addResponse("This book is not about this god.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("Ah ja...");
talkEntry:addResponse("Interessant.");
talkEntry:addResponse("Diese Buch handelt nicht von diesem Gott.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Zhambra");
talkEntry:addResponse("Ah, yes...");
talkEntry:addResponse("Interesting.");
talkEntry:addResponse("This book is not about this god.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zhambra");
talkEntry:addResponse("Ah ja...");
talkEntry:addResponse("Interessant.");
talkEntry:addResponse("Diese Buch handelt nicht von diesem Gott.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addResponse("I heard people talk about him, I wounder why they do.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Ich hörte wie die Leute über ihn sprachen, ich frage mich warum sie das tun.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Sorry... I don't know this person.");
talkEntry:addResponse("I heard that name before...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Tut mir leid, ich kenne diese Person nicht.");
talkEntry:addResponse("Ich habe diesen Namen schon einmal gehöret...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("This place is mentioned in some books here.");
talkEntry:addResponse("Ah. Yes, Runewick...");
talkEntry:addResponse("This place here is called Runewick as well.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Dieser Ort wird in einigen Büchern hier erwähnt.");
talkEntry:addResponse("Ah. Ja, Runewick...");
talkEntry:addResponse("Dieser Ort hier heißt auch Runewick.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Sorry... I don't know this person.");
talkEntry:addResponse("I heard that name before...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Tut mir leid, ich kenne diese Person nicht.");
talkEntry:addResponse("Ich habe diesen Namen schon einmal gehöret...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("I've never been there...");
talkEntry:addResponse("Ah. Yes, Galmair.");
talkEntry:addResponse("Is this place far from here?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Ich war dort noch nie.");
talkEntry:addResponse("Ah, ja. Galmair.");
talkEntry:addResponse("Isthis place far from here?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Queen");
talkEntry:addResponse("The Queen of Cadomyr is said to be very beautiful, I wonder if it's true...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königin");
talkEntry:addResponse("Man sagt, die Königin von Cadomyr sei sehr schön, ich frage mich, ob das stimmt...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Sorry... I don't know this person.");
talkEntry:addResponse("I heard that name before...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Tut mir leid, ich kenne diese Person nicht.");
talkEntry:addResponse("Ich habe diesen Namen schon einmal gehöret...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Rules are important in Cadomyr.");
talkEntry:addResponse("Ah. Yes, Cadomyr.");
talkEntry:addResponse("The Queen of Cadomyr is said to be very beautiful, I wonder if it's true...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Regeln sind in Cadomyr sehr wichtig1.");
talkEntry:addResponse("Ah. Ja, Cadomyr...");
talkEntry:addResponse("Man sagt, die Königin von Cadomyr sei sehr schön, ich frage mich, ob das stimmt...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("albar");
talkEntry:addResponse("Albar is a society famous for how it sticks to its traditions, not everyone likes those thoug...");
talkEntry:addResponse("Albar, ah yes.");
talkEntry:addResponse("The profession of one's father is more important than your money in Albar.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("Albar ist berühm für seine Gesellschaft die an Traditionen festklammert, nicht jedem gefällt dies...");
talkEntry:addResponse("Albar, ah ja.");
talkEntry:addResponse("Der Beruf seines Vaters spielt in Albar eine größere Rolle als das geld was man besitzt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addResponse("Gynk is a country famous for its calns of mechant families.");
talkEntry:addResponse("Slavery is forbidden in Gynk, so it's said.");
talkEntry:addResponse("Ah. Gync, yes...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("Gynk ist ein land das für seine Dynastien as Händlerfamilien bekannt ist.");
talkEntry:addResponse("Sklaverrei ist in Gynk verboten, so hört man..");
talkEntry:addResponse("Ah. Gynk, ja...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("salkama");
talkEntry:addResponse("In Salkama they invented the letters, we use today then writing in the common language.");
talkEntry:addResponse("The People in Salkamar call themselves lightfolk.");
talkEntry:addResponse("Ah, Salmaka, yes...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addResponse("In Salkamar erfand man die Schrift die wird heute für die Alltsgssprache Common benutzen..");
talkEntry:addResponse("Die Leute in Salkamar nennen sich das Lichtfolk.");
talkEntry:addResponse("Ah, Slakama, ja...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Gobaith was sometimes called Gobiath, maybe a writer misspelled the name on a map.");
talkEntry:addResponse("Gobaith was a small place, there where often conflicts between the diffrent towns, it is said.");
talkEntry:addResponse("People from all other Illarion came to live in Gobaith. But today things are diffrent.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Gobaith wurde manchamal Gobiath genannt, vielleicht hat sich ein Schreiber beim Namen auf einer Karte vertan.");
talkEntry:addResponse("Gobaith war ein kleiner Ort, es gab oft Konflikte zwischen den verschieden Städten.");
talkEntry:addResponse("Leute aus ganz Illarion kamen nach Gobaith um dort zu leben. Aber heutzutage ist es anders...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("#me nods.");
talkEntry:addResponse("Ah, I heard that name ... Did I just read your book in the library? I must say I really like it.");
talkEntry:addResponse("Nice to meet you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("#me nickt.");
talkEntry:addResponse("Ah,kenne diesen Namen ... Habe ich eben Euer Buch in der Bibliothrek gelesen? Ich muss sagen, es gefiel mir wirklich sehr.");
talkEntry:addResponse("Freut mich Euch kennen zu lernen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Jonathan");
talkEntry:addTrigger("Idler");
talkEntry:addResponse("Sorry... I don't know this person.");
talkEntry:addResponse("I heard that name before...");
talkEntry:addResponse("Yes, that would be me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Jonathan");
talkEntry:addTrigger("Idler");
talkEntry:addResponse("Tut mir leid, aber diese Person kenne ich nicht.");
talkEntry:addResponse("Ich habe diesen Namen schon einmal gehört...");
talkEntry:addResponse("Ja, das bin ich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("#me nods.");
talkEntry:addResponse("I agree to that.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("#me nickt.");
talkEntry:addResponse("Dem stimme ich zu.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("#me shrougs his shoulders.");
talkEntry:addResponse("I accept you opinion, thoug I can not understand why you say so.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("#me zuckt mit den Schultern.");
talkEntry:addResponse("Ich akzeptiere Eure Meinung, doch ich kann nicht verstehen, warum ihr dies sagt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("#me turns a page of his book.");
talkEntry:addResponse("#me continues reading.");
talkEntry:addResponse("Ah, yes.");
talkEntry:addResponse("Very interesting");
talkEntry:addResponse("Fascinating");
talkEntry:addResponse("I already knew that. Why are you telling me?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("#me bättert eine Buchseite um.");
talkEntry:addResponse("#me liest weiter.");
talkEntry:addResponse("Ah, ja.");
talkEntry:addResponse("Sehr interessant.");
talkEntry:addResponse("Faszinierend");
talkEntry:addResponse("Ich wusste dies berits. Warum erzählt ihr mir das?");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me zupft an seinem Bart.", "#me pulls his beard.");
talkingNPC:addCycleText("#me liest in einem Buch.", "#me reads a book.");
talkingNPC:addCycleText("#me starrt versonnen vor sich hin.", "#me stares into the air.");
talkingNPC:addCycleText("#me rückt seine Brille zurecht.", "#me moves his glasses.");
talkingNPC:addCycleText("#me murmelt leise ein paar Formlen.", "#me mubles some spells.");
talkingNPC:addCycleText("#me fährt mit dem Finger über den Tisch.", "#me moves a finger over the table.");
talkingNPC:addCycleText("#me blättert in einem Buch herum.", "#me skims throug a book.");
talkingNPC:addCycleText("#me macht sich Notizen in einem zerfledderten Büchlein.", "#me takes nots, writing into a small tattered book.");
talkingNPC:addCycleText("#me trinkt eine Tasse Tee.", "#me drinks a cup of tea.");
talkingNPC:addCycleText("Ah ja... so macht das Sinn...", "Ah...yes... like this it makes sense.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(1);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Dieser NPC ist Johnathan Idler der Stubenhocker.", "This NPC is Johnathan Idler the idler.");
mainNPC:setUseMessage("Fasst mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut verwirrt.", "#me looks around confused.");
mainNPC:setEquipment(1, 257);
mainNPC:setEquipment(3, 181);
mainNPC:setEquipment(11, 558);
mainNPC:setEquipment(5, 0);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 48);
mainNPC:setEquipment(9, 34);
mainNPC:setEquipment(10, 45);
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
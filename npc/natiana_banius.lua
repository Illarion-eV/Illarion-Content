--------------------------------------------------------------------------------
-- NPC Name: Natiana Banius                                          Runewick --
-- NPC Job:  Sickly Housewife                                                 --
--                                                                            --
-- NPC Race: human                      NPC Position:  0, 0, 0                --
-- NPC Sex:  female                     NPC Direction: south                  --
--                                                                            --
-- Author:   Grokk                                                            --
--                                                                            --
-- Last parsing: February 01, 2011                       easyNPC Parser v1.02 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (0, 0, 0, 0, 4, 'Natiana Banius', 'npc.natiana_banius', 1, 2, 5, 218, 162, 39, 255, 228, 186);
---]]

require("npc.base.basic")
require("npc.base.condition.chance")
require("npc.base.condition.language")
require("npc.base.condition.quest")
require("npc.base.consequence.inform")
require("npc.base.consequence.quest")
require("npc.base.talk")
module("npc.natiana_banius", package.seeall)

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
talkEntry:addCondition(npc.base.condition.quest.quest(322, ">", 11));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Error] Something went wrong, please inform a developer."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Natiana Banius the farmer's wife. Keyphrases: quest"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist <Name> der <Beruf/Funktion>. Schlüsselwörter: TRIGGER1"));
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
talkEntry:addResponse("#me struggles to open her eyes, looking up at you.");
talkEntry:addResponse("#me smiles weakly.");
talkEntry:addResponse("H...h...hello.");
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
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("#me struggles to open her eyes, looking up at you.");
talkEntry:addResponse("#me smiles weakly.");
talkEntry:addResponse("H...h...hello.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("T...t...take...care.");
talkEntry:addResponse("#me lightly taps your hand in acknowledgment.");
talkEntry:addResponse("#me slightly inclines her head.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("T...t...take...care.");
talkEntry:addResponse("#me lightly taps your hand in acknowledgment.");
talkEntry:addResponse("#me slightly inclines her head.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("I am...v...very...sick.");
talkEntry:addResponse("T...the...medico does...doesn't know what...i...is wrong...with me.");
talkEntry:addResponse("#me coughs into a handkerchief, stained red.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befind");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("I am...N...Natiana.");
talkEntry:addResponse("M...m...my name...is Natiana...Banius.");
talkEntry:addResponse("N...Natiana Banius. I...I am...the wife...o...of Rowan.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(322, "<", 11));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("P...please...help my husband.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(322, "<", 11));
talkEntry:addResponse("GERMAN.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(322, "<", 11));
talkEntry:addResponse("M...my...husband.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(322, "<", 11));
talkEntry:addResponse("GERMAN.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(1337, "=", 11));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("#me forces a smile, 'Thank you.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(1337, "=", 11));
talkEntry:addResponse("GERMAN.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("F...forgive me...I...m...must rest.");
talkEntry:addResponse("#me's eyes flicker for a few moments, before falling completely shut. Faint breaths can only just be made out.");
talkEntry:addResponse("P...please...let me...rest.");
talkEntry:addResponse("#me's head slowly lolls about. She seems unfocused upon the conversation.");
talkEntry:addResponse("I m...must save my...strength.");
talkEntry:addResponse("I should...s...save...my breath.");
talkEntry:addResponse("P...please...h...help...my husband.");
talkEntry:addResponse("Rowan...n...needs help.");
talkEntry:addResponse("#me coughs sharply, wincing in pain.");
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
talkEntry:addTrigger("job");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("F...forgive me...I...m...must rest.");
talkEntry:addResponse("#me's eyes flicker for a few moments, before falling completely shut. Faint breaths can only just be made out.");
talkEntry:addResponse("P...please...let me...rest.");
talkEntry:addResponse("#me's head slowly lolls about. She seems unfocused upon the conversation.");
talkEntry:addResponse("I m...must save my...strength.");
talkEntry:addResponse("I should...s...save...my breath.");
talkEntry:addResponse("P...please...h...help...my husband.");
talkEntry:addResponse("Rowan...n...needs help.");
talkEntry:addResponse("#me coughs sharply, wincing in pain.");
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
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("F...forgive me...I...m...must rest.");
talkEntry:addResponse("#me's eyes flicker for a few moments, before falling completely shut. Faint breaths can only just be made out.");
talkEntry:addResponse("P...please...let me...rest.");
talkEntry:addResponse("#me's head slowly lolls about. She seems unfocused upon the conversation.");
talkEntry:addResponse("I m...must save my...strength.");
talkEntry:addResponse("I should...s...save...my breath.");
talkEntry:addResponse("P...please...h...help...my husband.");
talkEntry:addResponse("Rowan...n...needs help.");
talkEntry:addResponse("#me coughs sharply, wincing in pain.");
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
talkEntry:addResponse("F...forgive me...I...m...must rest.");
talkEntry:addResponse("#me's eyes flicker for a few moments, before falling completely shut. Faint breaths can only just be made out.");
talkEntry:addResponse("P...please...let me...rest.");
talkEntry:addResponse("#me's head slowly lolls about. She seems unfocused upon the conversation.");
talkEntry:addResponse("I m...must save my...strength.");
talkEntry:addResponse("I should...s...save...my breath.");
talkEntry:addResponse("P...please...h...help...my husband.");
talkEntry:addResponse("Rowan...n...needs help.");
talkEntry:addResponse("#me coughs sharply, wincing in pain.");
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
talkEntry:addResponse("F...forgive me...I...m...must rest.");
talkEntry:addResponse("#me's eyes flicker for a few moments, before falling completely shut. Faint breaths can only just be made out.");
talkEntry:addResponse("P...please...let me...rest.");
talkEntry:addResponse("#me's head slowly lolls about. She seems unfocused upon the conversation.");
talkEntry:addResponse("I m...must save my...strength.");
talkEntry:addResponse("I should...s...save...my breath.");
talkEntry:addResponse("P...please...h...help...my husband.");
talkEntry:addResponse("Rowan...n...needs help.");
talkEntry:addResponse("#me coughs sharply, wincing in pain.");
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
talkEntry:addResponse("F...forgive me...I...m...must rest.");
talkEntry:addResponse("#me's eyes flicker for a few moments, before falling completely shut. Faint breaths can only just be made out.");
talkEntry:addResponse("P...please...let me...rest.");
talkEntry:addResponse("#me's head slowly lolls about. She seems unfocused upon the conversation.");
talkEntry:addResponse("I m...must save my...strength.");
talkEntry:addResponse("I should...s...save...my breath.");
talkEntry:addResponse("P...please...h...help...my husband.");
talkEntry:addResponse("Rowan...n...needs help.");
talkEntry:addResponse("#me coughs sharply, wincing in pain.");
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
talkEntry:addResponse("F...forgive me...I...m...must rest.");
talkEntry:addResponse("#me's eyes flicker for a few moments, before falling completely shut. Faint breaths can only just be made out.");
talkEntry:addResponse("P...please...let me...rest.");
talkEntry:addResponse("#me's head slowly lolls about. She seems unfocused upon the conversation.");
talkEntry:addResponse("I m...must save my...strength.");
talkEntry:addResponse("I should...s...save...my breath.");
talkEntry:addResponse("P...please...h...help...my husband.");
talkEntry:addResponse("Rowan...n...needs help.");
talkEntry:addResponse("#me coughs sharply, wincing in pain.");
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
talkEntry:addResponse("F...forgive me...I...m...must rest.");
talkEntry:addResponse("#me's eyes flicker for a few moments, before falling completely shut. Faint breaths can only just be made out.");
talkEntry:addResponse("P...please...let me...rest.");
talkEntry:addResponse("#me's head slowly lolls about. She seems unfocused upon the conversation.");
talkEntry:addResponse("I m...must save my...strength.");
talkEntry:addResponse("I should...s...save...my breath.");
talkEntry:addResponse("P...please...h...help...my husband.");
talkEntry:addResponse("Rowan...n...needs help.");
talkEntry:addResponse("#me coughs sharply, wincing in pain.");
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
talkEntry:addResponse("F...forgive me...I...m...must rest.");
talkEntry:addResponse("#me's eyes flicker for a few moments, before falling completely shut. Faint breaths can only just be made out.");
talkEntry:addResponse("P...please...let me...rest.");
talkEntry:addResponse("#me's head slowly lolls about. She seems unfocused upon the conversation.");
talkEntry:addResponse("I m...must save my...strength.");
talkEntry:addResponse("I should...s...save...my breath.");
talkEntry:addResponse("P...please...h...help...my husband.");
talkEntry:addResponse("Rowan...n...needs help.");
talkEntry:addResponse("#me coughs sharply, wincing in pain.");
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
talkEntry:addResponse("F...forgive me...I...m...must rest.");
talkEntry:addResponse("#me's eyes flicker for a few moments, before falling completely shut. Faint breaths can only just be made out.");
talkEntry:addResponse("P...please...let me...rest.");
talkEntry:addResponse("#me's head slowly lolls about. She seems unfocused upon the conversation.");
talkEntry:addResponse("I m...must save my...strength.");
talkEntry:addResponse("I should...s...save...my breath.");
talkEntry:addResponse("P...please...h...help...my husband.");
talkEntry:addResponse("Rowan...n...needs help.");
talkEntry:addResponse("#me coughs sharply, wincing in pain.");
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
talkEntry:addResponse("F...forgive me...I...m...must rest.");
talkEntry:addResponse("#me's eyes flicker for a few moments, before falling completely shut. Faint breaths can only just be made out.");
talkEntry:addResponse("P...please...let me...rest.");
talkEntry:addResponse("#me's head slowly lolls about. She seems unfocused upon the conversation.");
talkEntry:addResponse("I m...must save my...strength.");
talkEntry:addResponse("I should...s...save...my breath.");
talkEntry:addResponse("P...please...h...help...my husband.");
talkEntry:addResponse("Rowan...n...needs help.");
talkEntry:addResponse("#me coughs sharply, wincing in pain.");
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
talkEntry:addResponse("F...forgive me...I...m...must rest.");
talkEntry:addResponse("#me's eyes flicker for a few moments, before falling completely shut. Faint breaths can only just be made out.");
talkEntry:addResponse("P...please...let me...rest.");
talkEntry:addResponse("#me's head slowly lolls about. She seems unfocused upon the conversation.");
talkEntry:addResponse("I m...must save my...strength.");
talkEntry:addResponse("I should...s...save...my breath.");
talkEntry:addResponse("P...please...h...help...my husband.");
talkEntry:addResponse("Rowan...n...needs help.");
talkEntry:addResponse("#me coughs sharply, wincing in pain.");
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
talkEntry:addResponse("F...forgive me...I...m...must rest.");
talkEntry:addResponse("#me's eyes flicker for a few moments, before falling completely shut. Faint breaths can only just be made out.");
talkEntry:addResponse("P...please...let me...rest.");
talkEntry:addResponse("#me's head slowly lolls about. She seems unfocused upon the conversation.");
talkEntry:addResponse("I m...must save my...strength.");
talkEntry:addResponse("I should...s...save...my breath.");
talkEntry:addResponse("P...please...h...help...my husband.");
talkEntry:addResponse("Rowan...n...needs help.");
talkEntry:addResponse("#me coughs sharply, wincing in pain.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("F...forgive me...I...m...must rest.");
talkEntry:addResponse("#me's eyes flicker for a few moments, before falling completely shut. Faint breaths can only just be made out.");
talkEntry:addResponse("P...please...let me...rest.");
talkEntry:addResponse("#me's head slowly lolls about. She seems unfocused upon the conversation.");
talkEntry:addResponse("I m...must save my...strength.");
talkEntry:addResponse("I should...s...save...my breath.");
talkEntry:addResponse("P...please...h...help...my husband.");
talkEntry:addResponse("Rowan...n...needs help.");
talkEntry:addResponse("#me coughs sharply, wincing in pain.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("F...forgive me...I...m...must rest.");
talkEntry:addResponse("#me's eyes flicker for a few moments, before falling completely shut. Faint breaths can only just be made out.");
talkEntry:addResponse("P...please...let me...rest.");
talkEntry:addResponse("#me's head slowly lolls about. She seems unfocused upon the conversation.");
talkEntry:addResponse("I m...must save my...strength.");
talkEntry:addResponse("I should...s...save...my breath.");
talkEntry:addResponse("P...please...h...help...my husband.");
talkEntry:addResponse("Rowan...n...needs help.");
talkEntry:addResponse("#me coughs sharply, wincing in pain.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("F...forgive me...I...m...must rest.");
talkEntry:addResponse("#me's eyes flicker for a few moments, before falling completely shut. Faint breaths can only just be made out.");
talkEntry:addResponse("P...please...let me...rest.");
talkEntry:addResponse("#me's head slowly lolls about. She seems unfocused upon the conversation.");
talkEntry:addResponse("I m...must save my...strength.");
talkEntry:addResponse("I should...s...save...my breath.");
talkEntry:addResponse("P...please...h...help...my husband.");
talkEntry:addResponse("Rowan...n...needs help.");
talkEntry:addResponse("#me coughs sharply, wincing in pain.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Adron");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("F...forgive me...I...m...must rest.");
talkEntry:addResponse("#me's eyes flicker for a few moments, before falling completely shut. Faint breaths can only just be made out.");
talkEntry:addResponse("P...please...let me...rest.");
talkEntry:addResponse("#me's head slowly lolls about. She seems unfocused upon the conversation.");
talkEntry:addResponse("I m...must save my...strength.");
talkEntry:addResponse("I should...s...save...my breath.");
talkEntry:addResponse("P...please...h...help...my husband.");
talkEntry:addResponse("Rowan...n...needs help.");
talkEntry:addResponse("#me coughs sharply, wincing in pain.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Adron");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("F...forgive me...I...m...must rest.");
talkEntry:addResponse("#me's eyes flicker for a few moments, before falling completely shut. Faint breaths can only just be made out.");
talkEntry:addResponse("P...please...let me...rest.");
talkEntry:addResponse("#me's head slowly lolls about. She seems unfocused upon the conversation.");
talkEntry:addResponse("I m...must save my...strength.");
talkEntry:addResponse("I should...s...save...my breath.");
talkEntry:addResponse("P...please...h...help...my husband.");
talkEntry:addResponse("Rowan...n...needs help.");
talkEntry:addResponse("#me coughs sharply, wincing in pain.");
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
talkEntry:addResponse("F...forgive me...I...m...must rest.");
talkEntry:addResponse("#me's eyes flicker for a few moments, before falling completely shut. Faint breaths can only just be made out.");
talkEntry:addResponse("P...please...let me...rest.");
talkEntry:addResponse("#me's head slowly lolls about. She seems unfocused upon the conversation.");
talkEntry:addResponse("I m...must save my...strength.");
talkEntry:addResponse("I should...s...save...my breath.");
talkEntry:addResponse("P...please...h...help...my husband.");
talkEntry:addResponse("Rowan...n...needs help.");
talkEntry:addResponse("#me coughs sharply, wincing in pain.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elara");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("F...forgive me...I...m...must rest.");
talkEntry:addResponse("#me's eyes flicker for a few moments, before falling completely shut. Faint breaths can only just be made out.");
talkEntry:addResponse("P...please...let me...rest.");
talkEntry:addResponse("#me's head slowly lolls about. She seems unfocused upon the conversation.");
talkEntry:addResponse("I m...must save my...strength.");
talkEntry:addResponse("I should...s...save...my breath.");
talkEntry:addResponse("P...please...h...help...my husband.");
talkEntry:addResponse("Rowan...n...needs help.");
talkEntry:addResponse("#me coughs sharply, wincing in pain.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elara");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eldan");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("F...forgive me...I...m...must rest.");
talkEntry:addResponse("#me's eyes flicker for a few moments, before falling completely shut. Faint breaths can only just be made out.");
talkEntry:addResponse("P...please...let me...rest.");
talkEntry:addResponse("#me's head slowly lolls about. She seems unfocused upon the conversation.");
talkEntry:addResponse("I m...must save my...strength.");
talkEntry:addResponse("I should...s...save...my breath.");
talkEntry:addResponse("P...please...h...help...my husband.");
talkEntry:addResponse("Rowan...n...needs help.");
talkEntry:addResponse("#me coughs sharply, wincing in pain.");
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
talkEntry:addResponse("F...forgive me...I...m...must rest.");
talkEntry:addResponse("#me's eyes flicker for a few moments, before falling completely shut. Faint breaths can only just be made out.");
talkEntry:addResponse("P...please...let me...rest.");
talkEntry:addResponse("#me's head slowly lolls about. She seems unfocused upon the conversation.");
talkEntry:addResponse("I m...must save my...strength.");
talkEntry:addResponse("I should...s...save...my breath.");
talkEntry:addResponse("P...please...h...help...my husband.");
talkEntry:addResponse("Rowan...n...needs help.");
talkEntry:addResponse("#me coughs sharply, wincing in pain.");
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
talkEntry:addResponse("F...forgive me...I...m...must rest.");
talkEntry:addResponse("#me's eyes flicker for a few moments, before falling completely shut. Faint breaths can only just be made out.");
talkEntry:addResponse("P...please...let me...rest.");
talkEntry:addResponse("#me's head slowly lolls about. She seems unfocused upon the conversation.");
talkEntry:addResponse("I m...must save my...strength.");
talkEntry:addResponse("I should...s...save...my breath.");
talkEntry:addResponse("P...please...h...help...my husband.");
talkEntry:addResponse("Rowan...n...needs help.");
talkEntry:addResponse("#me coughs sharply, wincing in pain.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("F...forgive me...I...m...must rest.");
talkEntry:addResponse("#me's eyes flicker for a few moments, before falling completely shut. Faint breaths can only just be made out.");
talkEntry:addResponse("P...please...let me...rest.");
talkEntry:addResponse("#me's head slowly lolls about. She seems unfocused upon the conversation.");
talkEntry:addResponse("I m...must save my...strength.");
talkEntry:addResponse("I should...s...save...my breath.");
talkEntry:addResponse("P...please...h...help...my husband.");
talkEntry:addResponse("Rowan...n...needs help.");
talkEntry:addResponse("#me coughs sharply, wincing in pain.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Moshran");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("F...forgive me...I...m...must rest.");
talkEntry:addResponse("#me's eyes flicker for a few moments, before falling completely shut. Faint breaths can only just be made out.");
talkEntry:addResponse("P...please...let me...rest.");
talkEntry:addResponse("#me's head slowly lolls about. She seems unfocused upon the conversation.");
talkEntry:addResponse("I m...must save my...strength.");
talkEntry:addResponse("I should...s...save...my breath.");
talkEntry:addResponse("P...please...h...help...my husband.");
talkEntry:addResponse("Rowan...n...needs help.");
talkEntry:addResponse("#me coughs sharply, wincing in pain.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Moshran");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addTrigger("Nargùn");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("F...forgive me...I...m...must rest.");
talkEntry:addResponse("#me's eyes flicker for a few moments, before falling completely shut. Faint breaths can only just be made out.");
talkEntry:addResponse("P...please...let me...rest.");
talkEntry:addResponse("#me's head slowly lolls about. She seems unfocused upon the conversation.");
talkEntry:addResponse("I m...must save my...strength.");
talkEntry:addResponse("I should...s...save...my breath.");
talkEntry:addResponse("P...please...h...help...my husband.");
talkEntry:addResponse("Rowan...n...needs help.");
talkEntry:addResponse("#me coughs sharply, wincing in pain.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addTrigger("Nargùn");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oldra");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("F...forgive me...I...m...must rest.");
talkEntry:addResponse("#me's eyes flicker for a few moments, before falling completely shut. Faint breaths can only just be made out.");
talkEntry:addResponse("P...please...let me...rest.");
talkEntry:addResponse("#me's head slowly lolls about. She seems unfocused upon the conversation.");
talkEntry:addResponse("I m...must save my...strength.");
talkEntry:addResponse("I should...s...save...my breath.");
talkEntry:addResponse("P...please...h...help...my husband.");
talkEntry:addResponse("Rowan...n...needs help.");
talkEntry:addResponse("#me coughs sharply, wincing in pain.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ronagan");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("F...forgive me...I...m...must rest.");
talkEntry:addResponse("#me's eyes flicker for a few moments, before falling completely shut. Faint breaths can only just be made out.");
talkEntry:addResponse("P...please...let me...rest.");
talkEntry:addResponse("#me's head slowly lolls about. She seems unfocused upon the conversation.");
talkEntry:addResponse("I m...must save my...strength.");
talkEntry:addResponse("I should...s...save...my breath.");
talkEntry:addResponse("P...please...h...help...my husband.");
talkEntry:addResponse("Rowan...n...needs help.");
talkEntry:addResponse("#me coughs sharply, wincing in pain.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sirani");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("F...forgive me...I...m...must rest.");
talkEntry:addResponse("#me's eyes flicker for a few moments, before falling completely shut. Faint breaths can only just be made out.");
talkEntry:addResponse("P...please...let me...rest.");
talkEntry:addResponse("#me's head slowly lolls about. She seems unfocused upon the conversation.");
talkEntry:addResponse("I m...must save my...strength.");
talkEntry:addResponse("I should...s...save...my breath.");
talkEntry:addResponse("P...please...h...help...my husband.");
talkEntry:addResponse("Rowan...n...needs help.");
talkEntry:addResponse("#me coughs sharply, wincing in pain.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("F...forgive me...I...m...must rest.");
talkEntry:addResponse("#me's eyes flicker for a few moments, before falling completely shut. Faint breaths can only just be made out.");
talkEntry:addResponse("P...please...let me...rest.");
talkEntry:addResponse("#me's head slowly lolls about. She seems unfocused upon the conversation.");
talkEntry:addResponse("I m...must save my...strength.");
talkEntry:addResponse("I should...s...save...my breath.");
talkEntry:addResponse("P...please...h...help...my husband.");
talkEntry:addResponse("Rowan...n...needs help.");
talkEntry:addResponse("#me coughs sharply, wincing in pain.");
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
talkEntry:addResponse("F...forgive me...I...m...must rest.");
talkEntry:addResponse("#me's eyes flicker for a few moments, before falling completely shut. Faint breaths can only just be made out.");
talkEntry:addResponse("P...please...let me...rest.");
talkEntry:addResponse("#me's head slowly lolls about. She seems unfocused upon the conversation.");
talkEntry:addResponse("I m...must save my...strength.");
talkEntry:addResponse("I should...s...save...my breath.");
talkEntry:addResponse("P...please...h...help...my husband.");
talkEntry:addResponse("Rowan...n...needs help.");
talkEntry:addResponse("#me coughs sharply, wincing in pain.");
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
talkEntry:addResponse("F...forgive me...I...m...must rest.");
talkEntry:addResponse("#me's eyes flicker for a few moments, before falling completely shut. Faint breaths can only just be made out.");
talkEntry:addResponse("P...please...let me...rest.");
talkEntry:addResponse("#me's head slowly lolls about. She seems unfocused upon the conversation.");
talkEntry:addResponse("I m...must save my...strength.");
talkEntry:addResponse("I should...s...save...my breath.");
talkEntry:addResponse("P...please...h...help...my husband.");
talkEntry:addResponse("Rowan...n...needs help.");
talkEntry:addResponse("#me coughs sharply, wincing in pain.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zhambra");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Aurora");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("#me forces a weak smile at the mention of the name.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Aurora");
talkEntry:addResponse("German");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("F...forgive me...I...m...must rest.");
talkEntry:addResponse("#me's eyes flicker for a few moments, before falling completely shut. Faint breaths can only just be made out.");
talkEntry:addResponse("P...please...let me...rest.");
talkEntry:addResponse("#me's head slowly lolls about. She seems unfocused upon the conversation.");
talkEntry:addResponse("I m...must save my...strength.");
talkEntry:addResponse("I should...s...save...my breath.");
talkEntry:addResponse("P...please...h...help...my husband.");
talkEntry:addResponse("Rowan...n...needs help.");
talkEntry:addResponse("#me coughs sharply, wincing in pain.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("F...forgive me...I...m...must rest.");
talkEntry:addResponse("#me's eyes flicker for a few moments, before falling completely shut. Faint breaths can only just be made out.");
talkEntry:addResponse("P...please...let me...rest.");
talkEntry:addResponse("#me's head slowly lolls about. She seems unfocused upon the conversation.");
talkEntry:addResponse("I m...must save my...strength.");
talkEntry:addResponse("I should...s...save...my breath.");
talkEntry:addResponse("P...please...h...help...my husband.");
talkEntry:addResponse("Rowan...n...needs help.");
talkEntry:addResponse("#me coughs sharply, wincing in pain.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Natiana");
talkEntry:addTrigger("Banius");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("F...forgive me...I...m...must rest.");
talkEntry:addResponse("#me's eyes flicker for a few moments, before falling completely shut. Faint breaths can only just be made out.");
talkEntry:addResponse("P...please...let me...rest.");
talkEntry:addResponse("#me's head slowly lolls about. She seems unfocused upon the conversation.");
talkEntry:addResponse("I m...must save my...strength.");
talkEntry:addResponse("I should...s...save...my breath.");
talkEntry:addResponse("P...please...h...help...my husband.");
talkEntry:addResponse("Rowan...n...needs help.");
talkEntry:addResponse("#me coughs sharply, wincing in pain.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("<NPC-Vorname>");
talkEntry:addTrigger("<NPC-Nachname>");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("F...forgive me...I...m...must rest.");
talkEntry:addResponse("#me's eyes flicker for a few moments, before falling completely shut. Faint breaths can only just be made out.");
talkEntry:addResponse("P...please...let me...rest.");
talkEntry:addResponse("#me's head slowly lolls about. She seems unfocused upon the conversation.");
talkEntry:addResponse("I m...must save my...strength.");
talkEntry:addResponse("I should...s...save...my breath.");
talkEntry:addResponse("P...please...h...help...my husband.");
talkEntry:addResponse("Rowan...n...needs help.");
talkEntry:addResponse("#me coughs sharply, wincing in pain.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("F...forgive me...I...m...must rest.");
talkEntry:addResponse("#me's eyes flicker for a few moments, before falling completely shut. Faint breaths can only just be made out.");
talkEntry:addResponse("P...please...let me...rest.");
talkEntry:addResponse("#me's head slowly lolls about. She seems unfocused upon the conversation.");
talkEntry:addResponse("I m...must save my...strength.");
talkEntry:addResponse("I should...s...save...my breath.");
talkEntry:addResponse("P...please...h...help...my husband.");
talkEntry:addResponse("Rowan...n...needs help.");
talkEntry:addResponse("#me coughs sharply, wincing in pain.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(20));
talkEntry:addResponse("F...forgive me...I...m...must rest.");
talkEntry:addResponse("#me's eyes flicker for a few moments, before falling completely shut. Faint breaths can only just be made out.");
talkEntry:addResponse("P...please...let me...rest.");
talkEntry:addResponse("#me's head slowly lolls about. She seems unfocused upon the conversation.");
talkEntry:addResponse("I m...must save my...strength.");
talkEntry:addResponse("I should...s...save...my breath.");
talkEntry:addResponse("P...please...h...help...my husband.");
talkEntry:addResponse("Rowan...n...needs help.");
talkEntry:addResponse("#me coughs sharply, wincing in pain.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(20));
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("GERMAN.", "#me smiles weakly.");
talkingNPC:addCycleText("GERMAN.", "#me coughs into a stained-red handkerchief.");
talkingNPC:addCycleText("GERMAN.", "#me glances to her husband, a warm expression appearing upon her face.");
talkingNPC:addCycleText("GERMAN.", "#me closes her eyes, drifting into a fitful sleep.");
talkingNPC:addCycleText("GERMAN.", "#me sighs faintly.");
talkingNPC:addCycleText("GERMAN.", "#me smiles at her husband.");
talkingNPC:addCycleText("GERMAN.", "#me's eyes flicker a few times, before falling shut.");
talkingNPC:addCycleText("GERMAN.", "#me turns her head slightly.");
talkingNPC:addCycleText("GERMAN.", "#me nods weakly.");
talkingNPC:addCycleText("GERMAN.", "#me lets out a sharp cough, wincing in pain.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(1);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Dieser NPC ist <Name> der <Beruf/Funktion>.", "This NPC is Natiana Banius the Farmer's Wife.");
mainNPC:setUseMessage("Fasst mich nicht an!", "#me shivers, 'D...d...don't...get...t...too...close.'");
mainNPC:setConfusedMessage("#me schaut verwirrt.", "#me weakly shakes her head.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 182);
mainNPC:setEquipment(11, 0);
mainNPC:setEquipment(5, 0);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 48);
mainNPC:setEquipment(9, 841);
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
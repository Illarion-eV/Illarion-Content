--------------------------------------------------------------------------------
-- NPC Name: Thud                                                        None --
-- NPC Job:  none                                                             --
--                                                                            --
-- NPC Race: orc                        NPC Position: 394,188,-6              --
-- NPC Sex:  male                       NPC Direction: west                   --
--                                                                            --
-- Author:   not set                                                          --
--                                                                            --
-- Last parsing: October 10, 2010                        easyNPC Parser v1.02 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (4, 394, 188, -6, 6, 'Thud', 'npc.thud', 0, 1, 3, 108, 62, 46, 137, 123, 60);
---]]

require("npc.base.basic")
require("npc.base.condition.item")
require("npc.base.condition.language")
require("npc.base.condition.quest")
require("npc.base.condition.state")
require("npc.base.consequence.deleteitem")
require("npc.base.consequence.item")
require("npc.base.consequence.quest")
require("npc.base.consequence.state")
require("npc.base.talk")
module("npc.thud", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=>", 9));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=<", 13));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hurr, Thud like you. Take this stuff here!");
talkEntry:addConsequence(npc.base.consequence.item.item(2664, 1, 999, 0));
talkEntry:addConsequence(npc.base.consequence.quest.queststatus(301, "+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=>", 9));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=<", 13));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Hurr, Thud mögen dich! Nimmst du diese Zeug!");
talkEntry:addConsequence(npc.base.consequence.item.item(2664, 1, 999, 0));
talkEntry:addConsequence(npc.base.consequence.quest.queststatus(301, "+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=>", 25));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=<", 29));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hurr, Thud like you. Take this stuff here!");
talkEntry:addConsequence(npc.base.consequence.item.item(559, 5, 999, 0));
talkEntry:addConsequence(npc.base.consequence.quest.queststatus(301, "+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=>", 25));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=<", 29));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Hurr, Thud mögen dich! Nimmst du diese Zeug!");
talkEntry:addConsequence(npc.base.consequence.item.item(559, 5, 999, 0));
talkEntry:addConsequence(npc.base.consequence.quest.queststatus(301, "+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=>", 50));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=<", 54));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hurr, Thud like you. Take this stuff here!");
talkEntry:addConsequence(npc.base.consequence.item.item(333, 1, 999, 0));
talkEntry:addConsequence(npc.base.consequence.quest.queststatus(301, "+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=>", 50));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=<", 54));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Hurr, Thud mögen dich! Nimmst du diese Zeug!");
talkEntry:addConsequence(npc.base.consequence.item.item(333, 1, 999, 0));
talkEntry:addConsequence(npc.base.consequence.quest.queststatus(301, "+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=>", 75));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=<", 79));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hurr, Thud like you. Take this stuff here!");
talkEntry:addConsequence(npc.base.consequence.item.item(67, 1, 999, 0));
talkEntry:addConsequence(npc.base.consequence.quest.queststatus(301, "+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=>", 75));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=<", 79));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Hurr, Thud mögen dich! Nimmst du diese Zeug!");
talkEntry:addConsequence(npc.base.consequence.item.item(67, 1, 999, 0));
talkEntry:addConsequence(npc.base.consequence.quest.queststatus(301, "+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=>", 120));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=<", 124));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hurr, Thud like you. Take this stuff here!");
talkEntry:addConsequence(npc.base.consequence.item.item(39, 1, 999, 0));
talkEntry:addConsequence(npc.base.consequence.quest.queststatus(301, "+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=>", 120));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=<", 124));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Hurr, Thud mögen dich! Nimmst du diese Zeug!");
talkEntry:addConsequence(npc.base.consequence.item.item(39, 1, 999, 0));
talkEntry:addConsequence(npc.base.consequence.quest.queststatus(301, "+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=>", 165));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=<", 169));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hurr, Thud like you. Take this stuff here!");
talkEntry:addConsequence(npc.base.consequence.item.item(2448, 1, 999, 0));
talkEntry:addConsequence(npc.base.consequence.quest.queststatus(301, "+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=>", 165));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=<", 169));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Hurr, Thud mögen dich! Nimmst du diese Zeug!");
talkEntry:addConsequence(npc.base.consequence.item.item(2448, 1, 999, 0));
talkEntry:addConsequence(npc.base.consequence.quest.queststatus(301, "+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=>", 250));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=<", 254));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hurr, Thud like you. Take this stuff here!");
talkEntry:addConsequence(npc.base.consequence.item.item(2742, 1, 999, 0));
talkEntry:addConsequence(npc.base.consequence.quest.queststatus(301, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=>", 250));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=<", 254));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Hurr, Thud mögen dich! Nimmst du diese Zeug!");
talkEntry:addConsequence(npc.base.consequence.item.item(2742, 1, 999, 0));
talkEntry:addConsequence(npc.base.consequence.quest.queststatus(301, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.item.item(333, "belt", "=>", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("#me peeks your belt: 'Wanna give Thud your horn?'");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.item.item(333, "belt", "=>", 1));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("#me blickt vertohlen auf deinen Gürtel. 'Wilsste Thud geben Horn, das?'");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addCondition(npc.base.condition.state.state("=", 1));
talkEntry:addCondition(npc.base.condition.item.item(333, "belt", "=>", 1));
talkEntry:addResponse("Dancke für Horn, das!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(333, 1));
talkEntry:addConsequence(npc.base.consequence.quest.queststatus(301, "+", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addCondition(npc.base.condition.state.state("=", 1));
talkEntry:addResponse("So'n Mist!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addCondition(npc.base.condition.state.state("=", 1));
talkEntry:addResponse("Ich nix dumm! Du nix hast.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addCondition(npc.base.condition.state.state("=", 1));
talkEntry:addCondition(npc.base.condition.item.item(333, "belt", "=>", 1));
talkEntry:addResponse("Thangs for tha horn!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(333, 1));
talkEntry:addConsequence(npc.base.consequence.quest.queststatus(301, "+", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addCondition(npc.base.condition.state.state("=", 1));
talkEntry:addResponse("What a bummer!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addCondition(npc.base.condition.state.state("=", 1));
talkEntry:addResponse("Me no fool. You havn't one!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.item.item(2586, "belt", "=>", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("#me peeks your belt: 'Wanna give Thud your fur?'");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.item.item(2586, "belt", "=>", 1));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("#me blickt vertohlen auf deinen Gürtel. 'Wilsste Thud geben die Felle?'");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addCondition(npc.base.condition.state.state("=", 2));
talkEntry:addCondition(npc.base.condition.item.item(2586, "belt", "=>", 1));
talkEntry:addResponse("Dancke für die Felle!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2586, 1));
talkEntry:addConsequence(npc.base.consequence.quest.queststatus(301, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addCondition(npc.base.condition.state.state("=", 2));
talkEntry:addResponse("So'n Mist!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addCondition(npc.base.condition.state.state("=", 2));
talkEntry:addResponse("Ich nix dumm! Du nix hast.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addCondition(npc.base.condition.state.state("=", 2));
talkEntry:addCondition(npc.base.condition.item.item(2586, "belt", "=>", 1));
talkEntry:addResponse("Thangs for tha fur!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2586, 1));
talkEntry:addConsequence(npc.base.consequence.quest.queststatus(301, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addCondition(npc.base.condition.state.state("=", 2));
talkEntry:addResponse("What a bummer!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addCondition(npc.base.condition.state.state("=", 2));
talkEntry:addResponse("Me no fool. You havn't one!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.item.item(2291, "belt", "=>", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("#me peeks your belt: 'Wanna give Thud your salkish paladin helmet?'");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.item.item(2291, "belt", "=>", 1));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("#me blickt vertohlen auf deinen Gürtel. 'Wilsste Thud geben dein salkamarischer Paladinhelm?'");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addCondition(npc.base.condition.state.state("=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2291, "belt", "=>", 1));
talkEntry:addResponse("Dancke für den Helm!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2291, 1));
talkEntry:addConsequence(npc.base.consequence.quest.queststatus(301, "+", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addCondition(npc.base.condition.state.state("=", 3));
talkEntry:addResponse("So'n Mist!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addCondition(npc.base.condition.state.state("=", 3));
talkEntry:addResponse("Ich nix dumm! Du nix hast.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addCondition(npc.base.condition.state.state("=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2291, "belt", "=>", 1));
talkEntry:addResponse("Thangs for tha helmet!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2291, 1));
talkEntry:addConsequence(npc.base.consequence.quest.queststatus(301, "+", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addCondition(npc.base.condition.state.state("=", 3));
talkEntry:addResponse("What a bummer!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addCondition(npc.base.condition.state.state("=", 3));
talkEntry:addResponse("Me no fool. You havn't one!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.item.item(190, "belt", "=>", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("#me peeks your belt: 'Wanna give Thud your ornated dagger?'");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.item.item(190, "belt", "=>", 1));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("#me blickt vertohlen auf deinen Gürtel. 'Wilsste Thud geben dein verzierhrte Dolch?'");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addCondition(npc.base.condition.state.state("=", 4));
talkEntry:addCondition(npc.base.condition.item.item(190, "belt", "=>", 1));
talkEntry:addResponse("Dancke für den Dolch!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(190, 1));
talkEntry:addConsequence(npc.base.consequence.quest.queststatus(301, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addCondition(npc.base.condition.state.state("=", 4));
talkEntry:addResponse("So'n Mist!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addCondition(npc.base.condition.state.state("=", 4));
talkEntry:addResponse("Ich nix dumm! Du nix hast.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addCondition(npc.base.condition.state.state("=", 4));
talkEntry:addCondition(npc.base.condition.item.item(190, "belt", "=>", 1));
talkEntry:addResponse("Thangs for tha daggar!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(190, 1));
talkEntry:addConsequence(npc.base.consequence.quest.queststatus(301, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addCondition(npc.base.condition.state.state("=", 4));
talkEntry:addResponse("What a bummer!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addCondition(npc.base.condition.state.state("=", 4));
talkEntry:addResponse("Me no fool. You havn't one!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.item.item(2660, "belt", "=>", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("#me peeks your belt: 'Wanna give Thud your dwarven axe?'");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.item.item(2660, "belt", "=>", 1));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("#me blickt vertohlen auf deinen Gürtel. 'Wilsste Thud geben dein Zwergenaxt?'");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addCondition(npc.base.condition.state.state("=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2660, "belt", "=>", 1));
talkEntry:addResponse("Dancke für d'Axt!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2660, 1));
talkEntry:addConsequence(npc.base.consequence.quest.queststatus(301, "+", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addCondition(npc.base.condition.state.state("=", 5));
talkEntry:addResponse("So'n Mist!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addCondition(npc.base.condition.state.state("=", 5));
talkEntry:addResponse("Ich nix dumm! Du nix hast.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addCondition(npc.base.condition.state.state("=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2660, "belt", "=>", 1));
talkEntry:addResponse("Thangs for tha axe!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2660, 1));
talkEntry:addConsequence(npc.base.consequence.quest.queststatus(301, "+", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addCondition(npc.base.condition.state.state("=", 5));
talkEntry:addResponse("What a bummer!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addCondition(npc.base.condition.state.state("=", 5));
talkEntry:addResponse("Me no fool. You havn't one!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.item.item(2718, "belt", "=>", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("#me peeks your belt: 'Wanna give Thud your elven composite longbow?'");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.item.item(2718, "belt", "=>", 1));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("#me blickt vertohlen auf deinen Gürtel. 'Wilsste Thud geben dein Elben-Kompositlangbogen?'");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addCondition(npc.base.condition.state.state("=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2718, "belt", "=>", 1));
talkEntry:addResponse("Dancke für d'Bogen!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2718, 1));
talkEntry:addConsequence(npc.base.consequence.quest.queststatus(301, "+", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addCondition(npc.base.condition.state.state("=", 5));
talkEntry:addResponse("So'n Mist!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addCondition(npc.base.condition.state.state("=", 5));
talkEntry:addResponse("Ich nix dumm! Du nix hast.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addCondition(npc.base.condition.state.state("=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2718, "belt", "=>", 1));
talkEntry:addResponse("Thangs for tha bow!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2718, 1));
talkEntry:addConsequence(npc.base.consequence.quest.queststatus(301, "+", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addCondition(npc.base.condition.state.state("=", 5));
talkEntry:addResponse("What a bummer!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addCondition(npc.base.condition.state.state("=", 5));
talkEntry:addResponse("Me no fool. You havn't one!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Thud collect trophy! Collect fur! Horn! Salkish... paladin helmet! Dagger, ornated! Dwarven axe! Elven composite longbow!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Thud sammeln Trophäe! Sammelt Fell! Horn! Salkamarischer Paladinhelm! Dolch, verziert! Zwergenaxt! Elben-Kompositlangbogen!");
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
talkEntry:addTrigger("Greb");
talkEntry:addResponse("Greebas!");
talkEntry:addResponse("Hurr!");
talkEntry:addResponse("Hullo!");
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
talkEntry:addResponse("Greebas!");
talkEntry:addResponse("Hurr!");
talkEntry:addResponse("Hullo!");
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
talkEntry:addResponse("Greebas!");
talkEntry:addResponse("Hurr!");
talkEntry:addResponse("Hullo!");
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
talkEntry:addResponse("Greebas!");
talkEntry:addResponse("Hurr!");
talkEntry:addResponse("Hullo!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("wie hei[sß]+t du");
talkEntry:addTrigger("wie hei[sß]+t ihr");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer seid");
talkEntry:addTrigger("wer bist");
talkEntry:addResponse("Ich Thud. Wer du?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Good bye");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare thee well");
talkEntry:addResponse("Farebas!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehabt euch wohl");
talkEntry:addResponse("Farebas!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Fareba");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Farebas!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Fareba");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Farebas!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("I Thud! I collect! Trophy!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addResponse("Ich Thud! Ich sammeln! Trophäe!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("I Thud. Who youb?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("I am");
talkEntry:addTrigger("I'm");
talkEntry:addResponse("#me grins silly: 'I Thud...'.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ich bin");
talkEntry:addResponse("#me grinst blöde: 'Ich Thud...'.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hilfe");
talkEntry:addResponse("Thud hilft bei 'Trophäe'. Sonst nix!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("helfen");
talkEntry:addResponse("Thud hilft bei 'Trophäe'. Sonst nix!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("help");
talkEntry:addResponse("Thud help with 'trophy'. Nothing otha!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("murgo");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Murgo?! He Thud's friend!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("murgo");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Murgo?! Er Thud's Freund!");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me streckt seine Zunge heraus und versucht seine Nase anzustupsen.", "#me tries to pat his nose with his tounge.");
talkingNPC:addCycleText("#me bohrt in der Nase", "#me drills with a finger into his nose.");
talkingNPC:addCycleText("#me kratzt sich kurz zwischen den Beinen.", "#me has a quick scratch between his legs.");
talkingNPC:addCycleText("#me wischt seine Nase am Hemdärmel ab.", "#me sneezes into his shirtsleeve.");
talkingNPC:addCycleText("Ich Thud ist!", "I be Thud!");
talkingNPC:addCycleText("#me gluckst ein wenig.", "#me clucks a littl ebit.");
talkingNPC:addCycleText("Mirr mag grosse Kabumms.", "I like to thud!");
talkingNPC:addCycleText("#me blickt mit leeren Blick an eine nichtssagende Stelle.", "#me glances with empty eyes at an meaningless area.");
talkingNPC:addCycleText("#me klappt den Mund auf und ein Speichelfaden rinnt am Kinn herunter. Mit einem schmatzenden Laut wischt er ihn mit dem Handrücken weg.", "#me mouth falls open and a thread of drool swings out. With a smacking noice, he rubs it with his hand away.");
talkingNPC:addCycleText("#me krazt sich knurrend am Kopf.", "#me scratches his head with a annoyed snarl.");
talkingNPC:addCycleText("#me rülpst, Duft von schalem Bier und gebratenen Fleisch entschwebt in die Nasen der Umgebung.", "#me burps, flavour of stale beer and roasted meat floats into the noses of the surrounding area.");
talkingNPC:addCycleText("#me klappert in einem einfachen ansteckenden Rythmus auf einem Holzstück.", "#me chatters with an simple catching rythm on a piece of wood.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(5);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Das ist ein NPC dessen Entwickler zu faul war eine Beschreibung einzutragen.", "This is a NPC who's developer was too lazy to type in a description.");
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
--------------------------------------------------------------------------------
-- NPC Name: Dorothy Applesong                                           None --
-- NPC Job:  none                                                             --
--                                                                            --
-- NPC Race: halfling                   NPC Position:  -66, -100, 0           --
-- NPC Sex:  female                     NPC Direction: west                   --
--                                                                            --
-- Author:   not set                                                          --
--                                                                            --
-- Last parsing: August 09, 2010                         easyNPC Parser v1.00 --
--------------------------------------------------------------------------------

require("npc.base.basic")
require("npc.base.condition.item")
require("npc.base.condition.quest")
require("npc.base.condition.sex")
require("npc.base.consequence.deleteitem")
require("npc.base.consequence.item")
require("npc.base.consequence.queststatus")
require("npc.base.talk")
module("npc.dorothy_applesong", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hello");
talkEntry:addCondition(npc.base.condition.quest.quest(22, "=", 0));
talkEntry:addResponse("Hello there, my name's Dorothy *looks sadly at the ground*, could you help me please?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hallo");
talkEntry:addCondition(npc.base.condition.quest.quest(22, "=", 0));
talkEntry:addResponse("Hallo auch, mein Name ist Dorothy *sieht traurig zu Boden*, könntest du mir vielleicht helfen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Greetings");
talkEntry:addCondition(npc.base.condition.quest.quest(22, "=", 0));
talkEntry:addResponse("Hello there, my name's Dorothy *looks sadly at the ground*, could you help me please?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Grüße");
talkEntry:addCondition(npc.base.condition.quest.quest(22, "=", 0));
talkEntry:addResponse("Hallo auch, mein Name ist Dorothy *sieht traurig zu Boden*, könntest du mir vielleicht helfen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addCondition(npc.base.condition.quest.quest(22, "~=", 3));
talkEntry:addResponse("I lost my locket while I was in Greenbriar, picking strawberries. Could you go ask Barney Haycrop whether he found a locket? You'll find him near the entrance of the town.");
talkEntry:addConsequence(npc.base.consequence.queststatus.queststatus(22, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addCondition(npc.base.condition.quest.quest(22, "~=", 3));
talkEntry:addResponse("Ich habe mein Medaillon verloren, als ich in Greenbriar Erdbeeren pflückte. Könntest du wohl Barney Haycrop fragen, ob er es gefunden hat? Du wirst ihn in der Nähe des Eingangs zur Stadt finden.");
talkEntry:addConsequence(npc.base.consequence.queststatus.queststatus(22, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How");
talkEntry:addCondition(npc.base.condition.quest.quest(22, "~=", 3));
talkEntry:addResponse("I lost my locket while I was in Greenbriar, picking strawberries. Could you go ask Barney Haycrop whether he found a locket? You'll find him near the entrance of the town.");
talkEntry:addConsequence(npc.base.consequence.queststatus.queststatus(22, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie");
talkEntry:addCondition(npc.base.condition.quest.quest(22, "~=", 3));
talkEntry:addResponse("Ich habe mein Medaillon verloren, als ich in Greenbriar Erdbeeren pflückte. Könntest du wohl Barney Haycrop fragen, ob er es gefunden hat? Du wirst ihn in der Nähe des Eingangs zur Stadt finden.");
talkEntry:addConsequence(npc.base.consequence.queststatus.queststatus(22, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wrong");
talkEntry:addCondition(npc.base.condition.quest.quest(22, "~=", 3));
talkEntry:addResponse("I lost my locket while I was in Greenbriar, picking strawberries. Could you go ask Barney Haycrop whether he found a locket? You'll find him near the entrance of the town.");
talkEntry:addConsequence(npc.base.consequence.queststatus.queststatus(22, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Fehlt");
talkEntry:addCondition(npc.base.condition.quest.quest(22, "~=", 3));
talkEntry:addResponse("Ich habe mein Medaillon verloren, als ich in Greenbriar Erdbeeren pflückte. Könntest du wohl Barney Haycrop fragen, ob er es gefunden hat? Du wirst ihn in der Nähe des Eingangs zur Stadt finden.");
talkEntry:addConsequence(npc.base.consequence.queststatus.queststatus(22, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Was");
talkEntry:addCondition(npc.base.condition.quest.quest(22, "~=", 3));
talkEntry:addResponse("Ich habe mein Medaillon verloren, als ich in Greenbriar Erdbeeren pflückte. Könntest du wohl Barney Haycrop fragen, ob er es gefunden hat? Du wirst ihn in der Nähe des Eingangs zur Stadt finden.");
talkEntry:addConsequence(npc.base.consequence.queststatus.queststatus(22, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bye");
talkEntry:addCondition(npc.base.condition.quest.quest(22, "~=", 3));
talkEntry:addResponse("Umm, goodbye *wipes eyes*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüss");
talkEntry:addCondition(npc.base.condition.quest.quest(22, "~=", 3));
talkEntry:addResponse("Ahm, auf Wiedersehen *wischt sich die Augen*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hello");
talkEntry:addCondition(npc.base.condition.quest.quest(22, "=", 1));
talkEntry:addResponse("Hello again, did you find my locket yet? *looks hopeful*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hallo");
talkEntry:addCondition(npc.base.condition.quest.quest(22, "=", 1));
talkEntry:addResponse("Hallo nochmal, hast du mein Medaillon schon gefunden? *schaut hoffnungsvoll*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Greetings");
talkEntry:addCondition(npc.base.condition.quest.quest(22, "=", 1));
talkEntry:addResponse("Hello again, did you find my locket yet? *looks hopeful*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Grüße");
talkEntry:addCondition(npc.base.condition.quest.quest(22, "=", 1));
talkEntry:addResponse("Hallo nochmal, hast du mein Medaillon schon gefunden? *schaut hoffnungsvoll*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addCondition(npc.base.condition.quest.quest(22, "=", 1));
talkEntry:addCondition(npc.base.condition.sex.sex(0));
talkEntry:addResponse("Thank you kind sir. *gives a broad smile* I'll be ever so grateful!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addCondition(npc.base.condition.quest.quest(22, "=", 1));
talkEntry:addCondition(npc.base.condition.sex.sex(0));
talkEntry:addResponse("Danke euch, gütiger Herr. *lächelt dich breit an* Ich werde euch ewig dankbar sein!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addCondition(npc.base.condition.quest.quest(22, "=", 1));
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addResponse("Thank you miss. *gives a broad smile* I'll be ever so grateful");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addCondition(npc.base.condition.quest.quest(22, "=", 1));
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addResponse("Danke euch, gütige Dame. *lächelt dich breit an* Ich werde euch ewig dankbar sein!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hello");
talkEntry:addCondition(npc.base.condition.quest.quest(22, "=", 2));
talkEntry:addResponse("Please tell me you found my locket... it was a gift from my mother, and very precious to me");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hallo");
talkEntry:addCondition(npc.base.condition.quest.quest(22, "=", 2));
talkEntry:addResponse("Bitte sagt mir, wenn ihr das Medaillon gefunden habt... es war ein Geschenk meiner Mutter und ist sehr wertvoll für mich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Greetings");
talkEntry:addCondition(npc.base.condition.quest.quest(22, "=", 2));
talkEntry:addResponse("Please tell me you found my locket... it was a gift from my mother, and very precious to me");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Grüße");
talkEntry:addCondition(npc.base.condition.quest.quest(22, "=", 2));
talkEntry:addResponse("Bitte sagt mir, wenn ihr das Medaillon gefunden habt... es war ein Geschenk meiner Mutter und ist sehr wertvoll für mich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Locket");
talkEntry:addCondition(npc.base.condition.quest.quest(22, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(222, "belt", ">", 0));
talkEntry:addResponse("Oh Thank you! Thank you!, I don't know what I can do to ever repay you... here, have this, I made it myself");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(222, 1));
talkEntry:addConsequence(npc.base.consequence.item.item(353, 1, 333, 0));
talkEntry:addConsequence(npc.base.consequence.queststatus.queststatus(22, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Medaillon");
talkEntry:addCondition(npc.base.condition.quest.quest(22, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(222, "belt", ">", 0));
talkEntry:addResponse("Oh, ich danke euch! Danke! Ich weiß nicht, wie ich euch das vergelten könnte... hier, nehmt dies, ich habe es selbst gemacht.");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(222, 1));
talkEntry:addConsequence(npc.base.consequence.item.item(353, 1, 333, 0));
talkEntry:addConsequence(npc.base.consequence.queststatus.queststatus(22, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Here");
talkEntry:addCondition(npc.base.condition.quest.quest(22, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(222, "belt", ">", 0));
talkEntry:addResponse("Oh Thank you! Thank you!, I don't know what I can do to ever repay you... here, have this, I made it myself");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(222, 1));
talkEntry:addConsequence(npc.base.consequence.item.item(353, 1, 333, 0));
talkEntry:addConsequence(npc.base.consequence.queststatus.queststatus(22, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hier");
talkEntry:addCondition(npc.base.condition.quest.quest(22, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(222, "belt", ">", 0));
talkEntry:addResponse("Oh, ich danke euch! Danke! Ich weiß nicht, wie ich euch das vergelten könnte... hier, nehmt dies, ich habe es selbst gemacht.");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(222, 1));
talkEntry:addConsequence(npc.base.consequence.item.item(353, 1, 333, 0));
talkEntry:addConsequence(npc.base.consequence.queststatus.queststatus(22, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Have");
talkEntry:addCondition(npc.base.condition.quest.quest(22, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(222, "belt", ">", 0));
talkEntry:addResponse("Oh Thank you! Thank you!, I don't know what I can do to ever repay you... here, have this, I made it myself");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(222, 1));
talkEntry:addConsequence(npc.base.consequence.item.item(353, 1, 333, 0));
talkEntry:addConsequence(npc.base.consequence.queststatus.queststatus(22, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Habe");
talkEntry:addCondition(npc.base.condition.quest.quest(22, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(222, "belt", ">", 0));
talkEntry:addResponse("Oh, ich danke euch! Danke! Ich weiß nicht, wie ich euch das vergelten könnte... hier, nehmt dies, ich habe es selbst gemacht.");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(222, 1));
talkEntry:addConsequence(npc.base.consequence.item.item(353, 1, 333, 0));
talkEntry:addConsequence(npc.base.consequence.queststatus.queststatus(22, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Locket");
talkEntry:addCondition(npc.base.condition.quest.quest(22, "=", 2));
talkEntry:addResponse("You have my locket? Where is it? *smiles hopefully*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Medaillon");
talkEntry:addCondition(npc.base.condition.quest.quest(22, "=", 2));
talkEntry:addResponse("Ihr habt mein Medaillon? Wo ist es? *lächelt hoffnungsvoll*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Here");
talkEntry:addCondition(npc.base.condition.quest.quest(22, "=", 2));
talkEntry:addResponse("You have my locket? Where is it? *smiles hopefully*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hier");
talkEntry:addCondition(npc.base.condition.quest.quest(22, "=", 2));
talkEntry:addResponse("Ihr habt mein Medaillon? Wo ist es? *lächelt hoffnungsvoll*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Have");
talkEntry:addCondition(npc.base.condition.quest.quest(22, "=", 2));
talkEntry:addResponse("You have my locket? Where is it? *smiles hopefully*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Habe");
talkEntry:addCondition(npc.base.condition.quest.quest(22, "=", 2));
talkEntry:addResponse("Ihr habt mein Medaillon? Wo ist es? *lächelt hoffnungsvoll*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hello");
talkEntry:addCondition(npc.base.condition.quest.quest(22, "=", 3));
talkEntry:addResponse("Hello, and thanks for all you did for me. Hope you enjoyed the pie *smiles*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hallo");
talkEntry:addCondition(npc.base.condition.quest.quest(22, "=", 3));
talkEntry:addResponse("Hallo und danke nochmal für alles, dass ihr für mich getan habt. Ich hoffe, der Kuchen schmeckte euch. *lächelt*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Greetings");
talkEntry:addCondition(npc.base.condition.quest.quest(22, "=", 3));
talkEntry:addResponse("Hello, and thanks for all you did for me. Hope you enjoyed the pie *smiles*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Grüße");
talkEntry:addCondition(npc.base.condition.quest.quest(22, "=", 3));
talkEntry:addResponse("Hallo und danke nochmal für alles, dass ihr für mich getan habt. Ich hoffe, der Kuchen schmeckte euch. *lächelt*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bye");
talkEntry:addCondition(npc.base.condition.quest.quest(22, "=", 3));
talkEntry:addResponse("Goodbye *smiles broadly*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüss");
talkEntry:addCondition(npc.base.condition.quest.quest(22, "=", 3));
talkEntry:addResponse("Auf Wiedersehen *lächelt breit*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sell");
talkEntry:addCondition(npc.base.condition.quest.quest(22, "~=", 3));
talkEntry:addResponse("#me sobs quietly to herself");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Verkaufe");
talkEntry:addCondition(npc.base.condition.quest.quest(22, "~=", 3));
talkEntry:addResponse("#me schluchzt leise vor sich hin");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Buy");
talkEntry:addCondition(npc.base.condition.quest.quest(22, "~=", 3));
talkEntry:addResponse("#me sobs quietly to herself");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Kaufe");
talkEntry:addCondition(npc.base.condition.quest.quest(22, "~=", 3));
talkEntry:addResponse("#me schluchzt leise vor sich hin");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wares");
talkEntry:addCondition(npc.base.condition.quest.quest(22, "~=", 3));
talkEntry:addResponse("#me sobs quietly to herself");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Waren");
talkEntry:addCondition(npc.base.condition.quest.quest(22, "~=", 3));
talkEntry:addResponse("#me schluchzt leise vor sich hin");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sell");
talkEntry:addCondition(npc.base.condition.quest.quest(22, "=", 3));
talkEntry:addResponse("Hehe, you seem to have liked that pie... I'm sorry but I don't make enough to sell");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Verkaufe");
talkEntry:addCondition(npc.base.condition.quest.quest(22, "=", 3));
talkEntry:addResponse("Hehe, der Kuchen scheint euch geschmeckt zu haben..., es tut mir leid aber ich mache nicht genug, um ihn zu verkaufen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Buy");
talkEntry:addCondition(npc.base.condition.quest.quest(22, "=", 3));
talkEntry:addResponse("I don't buy anything, I'm quite content now *looks proudly at her locket*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Kaufe");
talkEntry:addCondition(npc.base.condition.quest.quest(22, "=", 3));
talkEntry:addResponse("Ich kaufe nichts, ich bin nun sehr zufrieden mit der Welt *sieht stolz auf ihr Medaillon*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wares");
talkEntry:addCondition(npc.base.condition.quest.quest(22, "=", 3));
talkEntry:addResponse("Sorry, I'm no vendor");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Waren");
talkEntry:addCondition(npc.base.condition.quest.quest(22, "=", 3));
talkEntry:addResponse("Tut mir Leid, ich bin kein Händler.");
talkingNPC:addTalkingEntry(talkEntry);
end;
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
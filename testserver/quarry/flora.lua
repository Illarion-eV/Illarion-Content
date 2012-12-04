--------------------------------------------------------------------------------
-- NPC Name: Flora                                                       None --
-- NPC Job:  none                                                             --
--                                                                            --
-- NPC Race: human                      NPC Position:  -115, -84, 0           --
-- NPC Sex:  female                     NPC Direction: east                   --
--                                                                            --
-- Author:   not set                                                          --
--                                                                            --
-- Last parsing: May 23, 2011                            easyNPC Parser v1.02 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (0, -115, -84, 0, 2, 'Flora', 'npc.flora', 1, 2, 5, 123, 62, 9, 245, 180, 137);
---]]

require("npc.base.basic")
require("npc.base.condition.attribute")
require("npc.base.condition.item")
require("npc.base.condition.quest")
require("npc.base.condition.state")
require("npc.base.consequence.attribute")
require("npc.base.consequence.deleteitem")
require("npc.base.consequence.item")
require("npc.base.consequence.quest")
require("npc.base.consequence.state")
require("npc.base.talk")
module("npc.flora", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hello");
talkEntry:addCondition(npc.base.condition.attribute.attribute("hitpoints", "<", 1500));
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 10));
talkEntry:addResponse("Hello again. Oh, you seem to be wounded. Would you allow me to tend to your wounds?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(558, "=", 11));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("greet");
talkEntry:addCondition(npc.base.condition.attribute.attribute("hitpoints", "<", 1500));
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 10));
talkEntry:addResponse("Greetings again. Hmm, you seem to be hurt. May I tend to your wounds?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(558, "=", 11));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hello");
talkEntry:addCondition(npc.base.condition.state.state("=", 1));
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 10));
talkEntry:addResponse("Hello %CHARNAME, it is always nice seeing you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("greet");
talkEntry:addCondition(npc.base.condition.state.state("=", 1));
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 10));
talkEntry:addResponse("%CHARNAME, a pleasure seeing you again.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hello");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 10));
talkEntry:addResponse("Hello again there! It is so nice to see you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("greet");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 10));
talkEntry:addResponse("Greetings once again. It is always nice seeing you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("farewell");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 10));
talkEntry:addResponse("Farewell and come back soon to see me!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("yes");
talkEntry:addCondition(npc.base.condition.attribute.attribute("hitpoints", "<", 1500));
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 11));
talkEntry:addResponse("#me uses a small bottle of liquid which helps cure the wounds, 'There you go. You should feel better.'");
talkEntry:addConsequence(npc.base.consequence.attribute.attribute("hitpoints", "+", 5000));
talkEntry:addConsequence(npc.base.consequence.quest.quest(558, "=", 10));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("sure");
talkEntry:addCondition(npc.base.condition.attribute.attribute("hitpoints", "<", 1500));
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 11));
talkEntry:addResponse("#me applies a small bottle of liquid, soothing the pain of the wounds, 'There. You should feel less pain now.'");
talkEntry:addConsequence(npc.base.consequence.attribute.attribute("hitpoints", "+", 5000));
talkEntry:addConsequence(npc.base.consequence.quest.quest(558, "=", 10));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("yes");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 11));
talkEntry:addResponse("Oh well, you aren't that bad. I'll heal you when you are in a worse condition.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("no");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 11));
talkEntry:addResponse("If you insist. Take care then.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(558, "=", 10));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("thank");
talkEntry:addCondition(npc.base.condition.state.state("=", 6));
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 10));
talkEntry:addResponse("I am glad to be of help, just as you were to me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("why");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=>", 2));
talkEntry:addResponse("My mother used to tell me stories about this wonderful flower. But now she passed out, and I have no memories of her. The flower can serve as one.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("I like flowers");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 1));
talkEntry:addResponse("You like the flowers? That makes me happy! May I ask you a question?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(558, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("I love flowers");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 1));
talkEntry:addResponse("You love the flowers? Wow, I love them too! Can I ask you a question?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(558, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("yes");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 1));
talkEntry:addResponse("Oh you like them too? That is so nice to hear. May I ask you a question?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(558, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("no");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 1));
talkEntry:addResponse("Oh, pity. You should look at them closely, their colors, their scent, it's a unique sensation.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(558, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ask");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 2));
talkEntry:addResponse("Did you ever see a Night Angels Blossom?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(558, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("yes");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 2));
talkEntry:addResponse("Have you ever seen a Night Angels Blossom?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(558, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("of course");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 2));
talkEntry:addResponse("#me smiles before she inquires, 'Have you ever seen the lovely Night Angels Blossom?'");
talkEntry:addConsequence(npc.base.consequence.quest.quest(558, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("sure");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 2));
talkEntry:addResponse("#me smiles before she inquires, 'Have you ever seen the lovely Night Angels Blossom?'");
talkEntry:addConsequence(npc.base.consequence.quest.quest(558, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("no");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 2));
talkEntry:addResponse("Sorry then, I won't disturb you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("many times");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 3));
talkEntry:addResponse("Oh that is so nice to hear. Do you think you'll be able to bring me one?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(558, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("yes");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 3));
talkEntry:addResponse("Really? You have seen it? Would you be kind enough if you brought me one?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(558, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("once");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 3));
talkEntry:addResponse("You've seen it once? A rare flower, isn't it? Do you think you'll be able to bring me one?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(558, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("of course");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 3));
talkEntry:addResponse("That's lovely. Would you be able to bring me one please?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(558, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("no");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 3));
talkEntry:addResponse("Oh, what a pity. You see, my biggest wish is to see and experience the scent of that flower.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(558, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("never");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 3));
talkEntry:addResponse("#me frowns then, before she says, 'A pity. You know, my biggest wish is to see the Night Angels Blossom.'");
talkEntry:addConsequence(npc.base.consequence.quest.quest(558, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("saw");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 3));
talkEntry:addResponse("That is very nice but...I would really wish to see one. Can you bring me one, please?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(558, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("seen");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 3));
talkEntry:addResponse("Really? You've seen it? Could you bring me one, please?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(558, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("yes");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 4));
talkEntry:addResponse("#me smiles widely suddenly before she says, 'You are too kind. I will eagerly wait to see it.'");
talkEntry:addConsequence(npc.base.consequence.quest.quest(558, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("sure");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 4));
talkEntry:addResponse("You are too kind. I will wait for you to bring it.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(558, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("of course");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 4));
talkEntry:addResponse("I am so glad you will. Thank you. I will wait patiently.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(558, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("will try");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 4));
talkEntry:addResponse("Oh please do try. I will be so grateful if you did.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(558, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("no");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 4));
talkEntry:addResponse("#me frowns and lowers her head before she says, 'Oh, I understand. I would have loved to see it.'");
talkEntry:addConsequence(npc.base.consequence.quest.quest(558, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("I have flower");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 4));
talkEntry:addResponse("What? You have the Night Angels Blossom?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(558, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("I got flower");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 4));
talkEntry:addResponse("What? You have the Night Angels Blossom?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(558, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("I have it");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 4));
talkEntry:addResponse("You mean, the Night Angels Blossom? You have it?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(558, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("I got it");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 4));
talkEntry:addResponse("You mean, the Night Angels Blossom? You have it?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(558, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("I have night angels blossom");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 4));
talkEntry:addResponse("What? You have the flower with you?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(558, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("I got night angels blossom");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 4));
talkEntry:addResponse("What? You have got the flower with you?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(558, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("seen");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 5));
talkEntry:addResponse("What? Have I understood well? You've seen the Night Angels Blossom?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(558, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("saw");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 5));
talkEntry:addResponse("Have I heard well? Did you see the Night Angels Blossom?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(558, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("I have flower");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 5));
talkEntry:addResponse("What? You have the Night Angels Blossom? Can you give it to me?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(558, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("I got flower");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 5));
talkEntry:addResponse("What? You have the Night Angels Blossom? Can you give it to me?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(558, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("I have it");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 5));
talkEntry:addResponse("You mean, the Night Angels Blossom? You have it? May I take it?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(558, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("I got it");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 5));
talkEntry:addResponse("You mean, the Night Angels Blossom? You have it? May I take it?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(558, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("I have night angel blossom");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 7));
talkEntry:addResponse("Oh you have it?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(558, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("I brought night angel blossom");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 7));
talkEntry:addResponse("You brought the flower? May I look at it?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(558, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hello");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 6));
talkEntry:addResponse("Hello again! Have you brought the Night Angels Blossom?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(558, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("greet");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 6));
talkEntry:addResponse("Ah it's you! The flower? Have you brought it?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(558, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("I have flower");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 6));
talkEntry:addResponse("What? You have the Night Angels Blossom? Can you give it to me please?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(558, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("I got flower");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 6));
talkEntry:addResponse("What? You have the Night Angels Blossom? Can you give it to me please?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(558, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("I brought flower");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 6));
talkEntry:addResponse("You brought the flower? Really? Can I take it please?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(558, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("I have night angel blossom");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 7));
talkEntry:addResponse("You have the flower with you? Can I see it?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(558, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("I brought night angel blossom");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 7));
talkEntry:addResponse("You brought the flower? May I look at it?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(558, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hello");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 7));
talkEntry:addResponse("#me speaks with a gloomy, unenthusiastic voice, 'Hello.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("greet");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 7));
talkEntry:addResponse("#me shows a lack of enthusiasm as she speaks, 'Greetings.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("I have flower");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 7));
talkEntry:addResponse("#me blinks and lifts her eyebrows, 'What? You have the flower? Can I see it?'");
talkEntry:addConsequence(npc.base.consequence.quest.quest(558, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("I got flower");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 7));
talkEntry:addResponse("#me blinks and lifts her eyebrows, 'What? You have the flower? Can I see it?'");
talkEntry:addConsequence(npc.base.consequence.quest.quest(558, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("I brought flower");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 7));
talkEntry:addResponse("#me blinks and raises her eyebrows, 'You brought the flower? Really? Can I see it?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(558, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("I have night angel blossom");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 7));
talkEntry:addResponse("Hm? You've brought the flower? Really? May I see it?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(558, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("I brought night angel blossom");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 7));
talkEntry:addResponse("What? You brought the flower? Can I see it?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(558, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("yes");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 8));
talkEntry:addCondition(npc.base.condition.item.item(138, "all", "=>", 1));
talkEntry:addResponse("Wow. This is the magnificent Night Angels Blossom. It will remind me of my passed away mother. Here, take these bottles for your troubles. Thank you.");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(138, 1));
talkEntry:addConsequence(npc.base.consequence.item.item(1316, 2, 333, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(558, "=", 10));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("sure");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 8));
talkEntry:addCondition(npc.base.condition.item.item(138, "all", "=>", 1));
talkEntry:addResponse("Wow. This is the magnificent Night Angels Blossom. It will remind me of my passed away mother. Here, take these bottles for your troubles. Thank you.");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(138, 1));
talkEntry:addConsequence(npc.base.consequence.item.item(1316, 2, 333, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(558, "=", 10));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("of course");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 8));
talkEntry:addCondition(npc.base.condition.item.item(138, "all", "=>", 1));
talkEntry:addResponse("Wow. This is the magnificent Night Angels Blossom. It will remind me of my passed away mother. Here, take these bottles for your troubles. Thank you.");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(138, 1));
talkEntry:addConsequence(npc.base.consequence.item.item(1316, 2, 333, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(558, "=", 10));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("yes");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 8));
talkEntry:addResponse("So? Where is it? Don't lie to me!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(558, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("sure");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 8));
talkEntry:addResponse("You don't have it! Do not lie!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(558, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("of course");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 8));
talkEntry:addResponse("Lies! You have none.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(558, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("no");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 8));
talkEntry:addResponse("A pity. I will continue to wait.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(558, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("#me examine");
talkEntry:addResponse("#me looks in her mid 20s, with dark orange hair reaching just below her shoulders, brown eyes and freckles on her cheek.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("#me examine clothes");
talkEntry:addResponse("#me is wearing a simple white dress, decorated with small pink circles.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("#s");
talkEntry:addResponse("Ooww! Would you mind not shouting so loud?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hello");
talkEntry:addCondition(npc.base.condition.state.state("=", 1));
talkEntry:addResponse("Hello again, %CHARNAME");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("greet");
talkEntry:addCondition(npc.base.condition.state.state("=", 1));
talkEntry:addResponse("Greetings %CHARNAME");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("see you");
talkEntry:addCondition(npc.base.condition.state.state("=", 1));
talkEntry:addResponse("Be well %CHARNAME");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("good night");
talkEntry:addCondition(npc.base.condition.state.state("=", 1));
talkEntry:addResponse("Have a good night, %CHARNAME");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("how are you");
talkEntry:addCondition(npc.base.condition.state.state("=", 1));
talkEntry:addResponse("I am fine, thank you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hello");
talkEntry:addResponse("Hello.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("greet");
talkEntry:addResponse("Greetings to you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("farewell");
talkEntry:addResponse("Farewell and take care.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("bye");
talkEntry:addResponse("Goodbye and be well.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("see you");
talkEntry:addResponse("Goodbye.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("good day");
talkEntry:addResponse("And good day to you too.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("good night");
talkEntry:addResponse("Have a good night.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name is");
talkEntry:addCondition(npc.base.condition.state.state("=", 0));
talkEntry:addResponse("It is a real pleasure to meet you, %CHARNAME");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("is my name");
talkEntry:addCondition(npc.base.condition.state.state("=", 0));
talkEntry:addResponse("It is my pleasure to meet you, %CHARNAME'");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("who [a']+re you");
talkEntry:addCondition(npc.base.condition.state.state("=", 0));
talkEntry:addResponse("I am %NPCNAME. What is your name?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("who might you be");
talkEntry:addCondition(npc.base.condition.state.state("=", 0));
talkEntry:addResponse("My name is %NPCNAME. And you might be?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addCondition(npc.base.condition.state.state("=", 0));
talkEntry:addResponse("My name is %NPCNAME. What is your name?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("help");
talkEntry:addResponse("[Game Help]: ((This is an NPC, you can talk to them just like other player characters. NPCs will react to keywords like 'Hello', so listen closely to what they say.))");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hilfe");
talkEntry:addResponse("[Game Help]: ((Das ist ein NPC, du kannst mit ihnen sprechen wie mit anderen Spielercharakteren. NPCs werden auf Schlüsselwörter wie 'Hallo' reagieren, also achte gut auf das was sie dir sagen.))");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("I[ a']+m new");
talkEntry:addCondition(npc.base.condition.state.state("=", 0));
talkEntry:addResponse("Nice to meet you, then. I am %NPCNAME, what is your name?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("newbie");
talkEntry:addResponse("#w((A newbie? Welcome! I am an NPC. I cannot really help you, but other players can. Please remember to mark OOC talk in double brackets.))");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("n[0O]b");
talkEntry:addResponse("#w((A newbie? Welcome! I am an NPC. I cannot really help you, but other players can. Please remember to mark OOC talk in double brackets.))");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("how are you");
talkEntry:addResponse("I am doing well, thank you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your job");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 10));
talkEntry:addResponse("I have basic abilities in druidry. If you are injured, please come to me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what do you");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 10));
talkEntry:addResponse("I'm a competent druid. Should you be injured, come to me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what you doing");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 10));
talkEntry:addResponse("Observing the beauty of the flowers.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your job");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 0));
talkEntry:addResponse("I...sometimes work as a druid. I study the plants, especially the flowers. Aren't they lovely?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(558, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what do you");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 0));
talkEntry:addResponse("Sometimes I study the plants, or better the flowers. Don't you find them lovely?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(558, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what you doing");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 0));
talkEntry:addResponse("I'm just observing the flowers. Aren't they pretty?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(558, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("you like flowers");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 0));
talkEntry:addResponse("Yes, I love flowers. They are the passion of my life. Don't you like them too?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(558, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("i like flowers");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 0));
talkEntry:addResponse("You like flowers too? That is so lovely. May I ask you a question then?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(558, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("i love flowers");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 0));
talkEntry:addResponse("You love the flowers? Really? I love them too! Then may I ask you a question?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(558, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("flowers");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 0));
talkEntry:addResponse("What? You mentioned flowers? Do you like them?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(558, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("reset me");
talkEntry:addResponse("I will reset you");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(558, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("", "#me crouches down and looks closely at the flowers, frowning slightly.");
talkingNPC:addCycleText("", "#me sniffs a flower she's holding.");
talkingNPC:addCycleText("", "#me whispers something inaudible while plucking out the petals of a flower.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(1);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Das ist ein NPC dessen Entwickler zu faul war eine Beschreibung einzutragen.", "This is an NPC who's developer was too lazy to type in a description.");
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
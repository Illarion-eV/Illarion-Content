--------------------------------------------------------------------------------
-- NPC Name: Gurzad Gutri                                             Galmair --
-- NPC Job:  Head Clerk                                                       --
--                                                                            --
-- NPC Race: dwarf                      NPC Position:  369, 236, 0            --
-- NPC Sex:  male                       NPC Direction: west                   --
--                                                                            --
-- Author:   Salathe                                                          --
--                                                     easyNPC Parser v1.23.1 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (1, 369, 236, 0, 6, 'Gurzad Gutri', 'npc.gurzad_gutri', 0, 2, 2, 85, 107, 47, 255, 218, 185);
---]]

require("npc.base.basic")
require("npc.base.condition.chance")
require("npc.base.condition.item")
require("npc.base.condition.language")
require("npc.base.condition.quest")
require("npc.base.condition.town")
require("npc.base.consequence.deleteitem")
require("npc.base.consequence.inform")
require("npc.base.consequence.item")
require("npc.base.consequence.money")
require("npc.base.consequence.quest")
require("npc.base.consequence.rankpoints")
require("npc.base.talk")
module("npc.gurzad_gutri", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Gurzad Gutri the head clerk. Keywords: Hello, Mission, Clerk, Galmair."));
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
talkEntry:addResponse("Good day to ye, have ya come to contribute to Galmair's storage");
talkEntry:addResponse("Greetings! This here be where the Don lives, so watch yourself.");
talkEntry:addResponse("Hello there. This is where we sort out the storages for Galmair, I hope your here to help!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Good day to ye, have ya come to contribute to Galmair's storage");
talkEntry:addResponse("Greetings! This here be where the Don lives, so watch yourself.");
talkEntry:addResponse("Hello there. This is where we sort out the storages for Galmair, I hope your here to help!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Irmorom with ye!");
talkEntry:addResponse("Check back regularly for more orders!");
talkEntry:addResponse("Best o' luck to ya!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Irmorom with ye!");
talkEntry:addResponse("Check back regularly for more orders!");
talkEntry:addResponse("Best o' luck to ya!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("I am well, but I'll be better after you help stock the storage!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("I am Gurzard Gutri! I have been tasked with the position of clerk to help maintain our stocks and storages, I expect ye want to help?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("In Galmair, we stand on our own feet! We are not in need of the Queen's assistance!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("In Galmair, we stand on our own feet! We are not in need of the Queen's assistance!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("I'm not certain those from Runewick would want to get down and dirty in the hard tasks we Galmairians seek.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addTrigger("order");
talkEntry:addResponse("I'm not certain those from Runewick would want to get down and dirty in the hard tasks we Galmairians seek.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(153, "~=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("There is no work today, our storage is stocked up!");
talkEntry:addResponse("It's good you want to help Galmair! But at the moment we have no work.");
talkEntry:addResponse("You still want work? I have none, but you'll certainly find plenty from our citizens!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(153, "~=", 0));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("There is no work today, our storage is stocked up!");
talkEntry:addResponse("It's good you want to help Galmair! But at the moment we have no work.");
talkEntry:addResponse("You still want work? I have none, but you'll certainly find plenty from our citizens!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(5.0));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New Quest] Stock up Galmair's Storage"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(152, "=", 1));
talkEntry:addResponse("The Don had an appetite and snuck some fruits from the storage! We need to replace them. Bring me 5 strawberries!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 0));
talkEntry:addCondition(npc.base.condition.chance.chance(5.0));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New Quest] Stock up Galmair's Storage"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(152, "=", 1));
talkEntry:addResponse("The Don had an appetite and snuck some fruits from the storage! We need to replace them. Bring me 5 strawberries!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(151, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded two silver coins. You advance in Don Valerio Gulianni's favour."));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 200));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(151, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(152, "=", 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(153, "=", 60));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("Good job! For now, the storage is set. You're payment is 2 silver.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(151, "all", "<", 5, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Oy! I will not have the storage records be inaccurate, be sure to come back with the five strawberries!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(151, "all", "<", 5, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("Oy! I will not have the storage records be inaccurate, be sure to come back with the five strawberries!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(5.26));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New Quest] Stock up Galmair's Storage"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(152, "=", 2));
talkEntry:addResponse("We always hold some sand in our storage for bartering deals with Cadomyr. Some of it was used up and we need to replace it. Get us 20 piles of quartz sand");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 0));
talkEntry:addCondition(npc.base.condition.chance.chance(5.26));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New Quest] Stock up Galmair's Storage"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(152, "=", 2));
talkEntry:addResponse("We always hold some sand in our storage for bartering deals with Cadomyr. Some of it was used up and we need to replace it. Get us 20 piles of quartz sand");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(316, "all", ">", 19, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded a shovel. You advance in Don Valerio Gulianni's favour."));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(316, 20, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(24, 1, 599, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(152, "=", 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(153, "=", 36));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("Good job! Once again the storage is full. Here is a shovel so you may acquire as much sand as you need in the future!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(316, "all", "<", 20, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("We need that sand! Be sure to return with twenty piles of quartz sand");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(316, "all", "<", 20, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("We need that sand! Be sure to return with twenty piles of quartz sand");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(5.56));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New Quest] Stock up Galmair's storage"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(152, "=", 3));
talkEntry:addResponse("The Don recently had some new rings made for his personal collection! Now we are short some gems. I'll be needing ya to get me 3 cut rubies.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 0));
talkEntry:addCondition(npc.base.condition.chance.chance(5.56));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New Quest] Stock up Galmair's storage"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(152, "=", 3));
talkEntry:addResponse("The Don recently had some new rings made for his personal collection! Now we are short some gems. I'll be needing ya to get me 3 cut rubies.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(46, "all", ">", 2, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded six silver coins. You advance in Don Valerio Gulianni's favour."));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 600));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(46, 3, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(152, "=", 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(153, "=", 24));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("Oy! Good work there! These will do just fine. Thank ya for the work, your payment is 6 silvers.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(46, "all", "<", 3, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("We need those three rubies! What if the Don commisioned three more ruby ring? Be sure to come back with them.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(46, "all", "<", 3, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("We need those three rubies! What if the Don commisioned three more ruby ring? Be sure to come back with them.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(5.88));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New Quest] Stock up Galmair's storage"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(152, "=", 4));
talkEntry:addResponse("Oy! You're here just in time, a fight broke out and several windows shattered. We used up some of our stored glass and now need ten glass ingots to fill the gap.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 0));
talkEntry:addCondition(npc.base.condition.chance.chance(5.88));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New Quest] Stock up Galmair's storage"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(152, "=", 4));
talkEntry:addResponse("Oy! You're here just in time, a fight broke out and several windows shattered. We used up some of our stored glass and now need ten glass ingots to fill the gap.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 4));
talkEntry:addCondition(npc.base.condition.item.item(41, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded twelve silver coins. You advance in Don Valerio Guilianni's favour."));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 1200));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(41, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(152, "=", 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(153, "=", 48));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("Very good! With this we'll be able to replace the broken windows. Come back again to help with the storage! Until then, you're payment is 12 silvers.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 4));
talkEntry:addCondition(npc.base.condition.item.item(41, "all", "<", 10, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Those broken windows are an eyesore! Don't return without those ten glass ingots.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 4));
talkEntry:addCondition(npc.base.condition.item.item(41, "all", "<", 10, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("Those broken windows are an eyesore! Don't return without those ten glass ingots.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(6.25));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New Quest] Stock up Galmair's storage"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(152, "=", 5));
talkEntry:addResponse("The Don was working a deal out with some merchants from a neihboring country. During the deals they broke out some smoking pipes. We'll need five more pipes to replace the ones the Don used!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 0));
talkEntry:addCondition(npc.base.condition.chance.chance(6.25));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New Quest] Stock up Galmair's storage"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(152, "=", 5));
talkEntry:addResponse("The Don was working a deal out with some merchants from a neihboring country. During the deals they broke out some smoking pipes. We'll need five more pipes to replace the ones the Don used!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2744, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded a golden ring. You advance in Don Valerio Guilianni's favour."));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2744, 1, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(235, 1, 599, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(152, "=", 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(153, "=", 36));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("Good work! These will certainly help out future deals. For your efforts, the Don has awarded you this golden ring.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2744, "all", "<", 5, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("The storage must be filled! Go and bring me back the five pipes.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2744, "all", "<", 5, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("The storage must be filled! Go and bring me back the five pipes.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(6.67));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New Quest] Stock up Galmair's storage"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(152, "=", 6));
talkEntry:addResponse("We've been looking to expand our workshop, but the storage is short. We are in need of twenty more bricks for the construction project.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 0));
talkEntry:addCondition(npc.base.condition.chance.chance(6.67));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New Quest] Stock up Galmair's storage"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(152, "=", 6));
talkEntry:addResponse("We've been looking to expand our workshop, but the storage is short. We are in need of twenty more bricks for the construction project.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 6));
talkEntry:addCondition(npc.base.condition.item.item(2588, "all", ">", 19, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded a bag. You advance in Don Valerio Guilianni's favour."));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2588, 20, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(97, 1, 599, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(152, "=", 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(153, "=", 24));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("Good work! Our mason's will make good use of these. You are rewarded a leather bag.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 6));
talkEntry:addCondition(npc.base.condition.item.item(2588, "all", "<", 20, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("The crafter's are complaining! We need those twenty bricks.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 6));
talkEntry:addCondition(npc.base.condition.item.item(2588, "all", "<", 20, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("The crafter's are complaining! We need those twenty bricks.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(7.14));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New Quest] Stock up Galmair's storage"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(152, "=", 7));
talkEntry:addResponse("The Don has recently hired a new body guard. He has taken a longsword from the storage in order to arm this new guard. We must replace it! Please bring me one longsword.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 0));
talkEntry:addCondition(npc.base.condition.chance.chance(7.14));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New Quest] Stock up Galmair's storage"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(152, "=", 7));
talkEntry:addResponse("The Don has recently hired a new body guard. He has taken a longsword from the storage in order to arm this new guard. We must replace it! Please bring me one longsword.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(2701, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 12 silver coins. You advance in Don Valerio Guilianni's favour."));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 1200));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2701, 1, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(152, "=", 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(153, "=", 60));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("Very good! This sword will do well. You're payment is 12 silvers.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(2701, "all", "<", 1, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("We are still short on the storage! This is for the Don's protection! Be sure not to return without the longsword.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(2701, "all", "<", 1, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("We are still short on the storage! This is for the Don's protection! Be sure not to return without the longsword.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(7.69));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New Quest] Stock up Galmair's storage"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(152, "=", 8));
talkEntry:addResponse("The Don commisioned a number of potions to be made and our alchemists took out a bunch of herbs. We are now short and I need you to get fifteen firnis blossoms for the storage.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 0));
talkEntry:addCondition(npc.base.condition.chance.chance(7.69));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New Quest] Stock up Galmair's storage"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(152, "=", 8));
talkEntry:addResponse("The Don commisioned a number of potions to be made and our alchemists took out a bunch of herbs. We are now short and I need you to get fifteen firnis blossoms for the storage.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 8));
talkEntry:addCondition(npc.base.condition.item.item(148, "all", ">", 14, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded a bowl of mushroom soup. You advance in Don Valerio Guilianni's favour."));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(148, 15, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(2456, 1, 599, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(152, "=", 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(153, "=", 60));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("Aha good work! Digging in the dirst must have worn you down, here is some mushroom soup to get you back into shape!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 8));
talkEntry:addCondition(npc.base.condition.item.item(148, "all", "<", 15, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("The storage must be filled! When you return, I expect you will have the fifteen firnis blossoms.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 8));
talkEntry:addCondition(npc.base.condition.item.item(148, "all", "<", 15, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("The storage must be filled! When you return, I expect you will have the fifteen firnis blossoms.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(8.33));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New Quest] Stock up Galmair's storage"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(152, "=", 9));
talkEntry:addResponse("#me stumbles as he looks up 'HEY! Hey you! *hic* Our damneded mugs shattered when we.. *hic* challenged the Don to a drinking game. But the game ain't over yet son! We.. *hic* need more mugs! How many? Uh... however this many is! He holds up all of his fingers.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 0));
talkEntry:addCondition(npc.base.condition.chance.chance(8.33));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New Quest] Stock up Galmair's storage"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(152, "=", 9));
talkEntry:addResponse("#me stumbles as he looks up 'HEY! Hey you! *hic* Our damneded mugs shattered when we.. *hic* challenged the Don to a drinking game. But the game ain't over yet son! We.. *hic* need more mugs! How many? Uh... however this many is!' He holds up all of his fingers.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 9));
talkEntry:addCondition(npc.base.condition.item.item(1908, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded sixteen silver coins. You advance in Don Valerio Guilianni's favour."));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 1600));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(1908, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(152, "=", 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(153, "=", 36));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("#me burps loudly as he takes the mugs 'OY!!! Ye brought these.. *hic* JUST in time! Here's some monies!' he then vomits in front of you and runs off");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 9));
talkEntry:addCondition(npc.base.condition.item.item(1908, "all", "<", 10, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Who are you!?!? OH! You're the guy!! OY! *Hic* We need them mugs! We need ten!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 9));
talkEntry:addCondition(npc.base.condition.item.item(1908, "all", "<", 10, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("Who are you!?!? OH! You're the guy!! OY! *Hic* We need them mugs! We need ten!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(9.09));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New Quest] Stock up Galmair's stoage"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(152, "=", 10));
talkEntry:addResponse("Recently one of our candle moulds was used and broke as we had an order of candles to fill. The mould that broke from our storage so we must replace it! Bring me one candle mould.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 0));
talkEntry:addCondition(npc.base.condition.chance.chance(9.09));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New Quest] Do a good turn daily for Cadomyr"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(152, "=", 10));
talkEntry:addResponse("Recently one of our candle moulds was used and broke as we had an order of candles to fill. The mould that broke from our storage so we must replace it! Bring me one candle mould.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 10));
talkEntry:addCondition(npc.base.condition.item.item(429, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded six silver coins. You advance in Don Valerio Guilianni's favour."));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 600));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(429, 1, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(152, "=", 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(153, "=", 48));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("Ah this is perfect. Ye've done a good job! Here is your payment.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 10));
talkEntry:addCondition(npc.base.condition.item.item(429, "all", "<", 1, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("We need that candle mould. I just can't feel comfortable until I know the storage is set. Bring me one candle mould.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 10));
talkEntry:addCondition(npc.base.condition.item.item(429, "all", "<", 1, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("We need that candle mould. I just can't feel comfortable until I know the storage is set. Bring me one candle mould.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(10.0));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New Quest] Stock up Galmair's Storage"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(152, "=", 11));
talkEntry:addResponse("The Don had a party for some merchants traveling through this land. We served some of our most famous soup! But the damned merchants left without returning the bowls! We need to replace them! Bring me twenty soup bowls.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 0));
talkEntry:addCondition(npc.base.condition.chance.chance(10.0));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New Quest] Stock up Galmair's Storage"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(152, "=", 11));
talkEntry:addResponse("The Don had a party for some merchants traveling through this land. We served some of our most famous soup! But the damned merchants left without returning the bowls! We need to replace them! Bring me twenty soup bowls.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 11));
talkEntry:addCondition(npc.base.condition.item.item(2935, "all", ">", 19, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded a gilded dagger. You advance in Don Valerio Guilianni's favour."));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2935, 20, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(297, 1, 599, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(152, "=", 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(153, "=", 24));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("These will do great! Perhaps one day the Don will invite yourself to be a part of one of his parties. We received some extra equipment in our last order, so today I'll reward you with this dagger.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 11));
talkEntry:addCondition(npc.base.condition.item.item(2935, "all", ">", 19, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst einen vergoldeten Dolch. Dein Ansehen bei Don Valerio Guilianni's steigt."));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2935, 20, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(297, 1, 599, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(152, "=", 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(153, "=", 24));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("translate");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 11));
talkEntry:addCondition(npc.base.condition.item.item(2935, "all", "<", 20, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("You should know not to come here until your task is finished! Be sure to return with twenty soup bowls");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 11));
talkEntry:addCondition(npc.base.condition.item.item(2935, "all", "<", 20, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("You should know not to come here until your task is finished! Be sure to return with twenty soup bowls");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(11.11));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New Quest] Stock up Galmair's storage"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(152, "=", 12));
talkEntry:addResponse("The Don commisioned a new set of armor to be made. For this he took materials from our storage for the smith. We've been able to replace everything except leather since there are no pigs around. Please venture out and gather us ten dried leather.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 0));
talkEntry:addCondition(npc.base.condition.chance.chance(11.11));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New Quest] Stock up Galmair's storage"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(152, "=", 12));
talkEntry:addResponse("The Don commisioned a new set of armor to be made. For this he took materials from our storage for the smith. We've been able to replace everything except leather since there are no pigs around. Please venture out and gather us ten dried leather.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 12));
talkEntry:addCondition(npc.base.condition.item.item(2547, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded sixteen silver coins. You advance in Don Valerio Guilianni's favour."));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 1600));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2547, 1, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(152, "=", 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(153, "=", 60));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("Ah very good, the smiths will be pleased! Here is your payment");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 12));
talkEntry:addCondition(npc.base.condition.item.item(2547, "all", "<", 10, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Did you bring the leathers? Be sure that they are already dried! We have no use for raw leather. Make sure that you come back ten leather.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 12));
talkEntry:addCondition(npc.base.condition.item.item(2547, "all", "<", 10, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("Did you bring the leathers? Be sure that they are already dried! We have no use for raw leather. Make sure that you come back ten leather.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(12.5));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New Quest] Stock up Galmair's storage"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(152, "=", 13));
talkEntry:addResponse("The Don's personal goblet has been tarnished over the years, he's taken a new one from the storage. I'll need ya to go fetch a new golden goblet for the storage.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 0));
talkEntry:addCondition(npc.base.condition.chance.chance(12.5));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New Quest] Stock up Galmair's storage"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(152, "=", 13));
talkEntry:addResponse("The Don's personal goblet has been tarnished over the years, he's taken a new one from the storage. I'll need ya to go fetch a new golden goblet for the storage.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 13));
talkEntry:addCondition(npc.base.condition.item.item(224, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded a pipe. You advance in Don Valerio Guilianni's favour."));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(224, 1, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(2744, 1, 599, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(152, "=", 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(153, "=", 48));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("Ah! This is perfect. Good work, the Don will be pleased should he need another. Now that you provided a fine drinking goblet, youn are rewarded a fine smoking pipe!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 13));
talkEntry:addCondition(npc.base.condition.item.item(224, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst eine Pfeife. Dein Ansehen bei Don Valerio Guilianni's steigt."));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(224, 1, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(2744, 1, 599, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(152, "=", 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(153, "=", 48));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("translate");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 13));
talkEntry:addCondition(npc.base.condition.item.item(224, "all", "<", 1, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("It doesnt seem like you brought the goblet? Don't come back until you've got one golden goblet for me!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 13));
talkEntry:addCondition(npc.base.condition.item.item(224, "all", "<", 1, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("It doesnt seem like you brought the goblet? Don't come back until you've got one golden goblet for me!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(14.29));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New Quest] Stock up Galmair's storage"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(152, "=", 14));
talkEntry:addResponse("One of the Don's bodyguards was out hunting yesterday and his bow broke. The Don had a longbow taken from the storage, we must replace it! Bring me one longbow.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 0));
talkEntry:addCondition(npc.base.condition.chance.chance(14.29));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New Quest] Stock up Galmair's storage"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(152, "=", 14));
talkEntry:addResponse("One of the Don's bodyguards was out hunting yesterday and his bow broke. The Don had a longbow taken from the storage, we must replace it! Bring me one longbow.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 14));
talkEntry:addCondition(npc.base.condition.item.item(2708, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded eight silver coins. You advance in Don Valerio Guilianni's favour."));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 800));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2708, 1, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(152, "=", 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(153, "=", 36));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("Aye! This is a fine bow! Ye done good! The storage is again all accounted for, here is your payment.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 14));
talkEntry:addCondition(npc.base.condition.item.item(2708, "all", "<", 1, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Our storage is short one longbow! I need you to come back with one.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 14));
talkEntry:addCondition(npc.base.condition.item.item(2708, "all", "<", 1, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("Our storage is short one longbow! I need you to come back with one.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(16.67));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New Quest] Stock up Galmair's storage"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(152, "=", 15));
talkEntry:addResponse("One of our hunting parties went out again and brought back a good stock of meat for us! But they used quite a large amount of crossbow bolts. I need you to get me 100 crossbow bolts.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 0));
talkEntry:addCondition(npc.base.condition.chance.chance(16.67));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New Quest] Stock up Galmair's storage"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(152, "=", 15));
talkEntry:addResponse("One of our hunting parties went out again and brought back a good stock of meat for us! But they used quite a large amount of crossbow bolts. I need you to get me 100 crossbow bolts.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 15));
talkEntry:addCondition(npc.base.condition.item.item(237, "all", ">", 99, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded an ebony wood bow. You advance in Don Valerio Guilianni's favour."));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(237, 100, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(2780, 1, 599, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(152, "=", 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(153, "=", 48));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("Aye! This is good. These will serve the Don well, whether its against a pack of wolves or our enemies. Good Work! Here is your reward.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 15));
talkEntry:addCondition(npc.base.condition.item.item(237, "all", "<", 100, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Ye don't want our men going out unarmed do ya? Be sure to bring me 100 crossbow bolts.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 15));
talkEntry:addCondition(npc.base.condition.item.item(237, "all", "<", 100, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("Ye don't want our men going out unarmed do ya? Be sure to bring me 100 crossbow bolts.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New Quest] Stock up Galmair's storage"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(152, "=", 16));
talkEntry:addResponse("We're having a feast tonight and many of our materials were taken from the storage for food. There are so many people that we ran out! I need you to skip the storage part and just bring me five venison dishes for the feast!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 0));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New Quest] Do a good turn daily for Cadomyr"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(152, "=", 16));
talkEntry:addResponse("We're having a feast tonight and many of our materials were taken from the storage for food. There are so many people that we ran out! I need you to skip the storage part and just bring me five venison dishes for the feast!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 16));
talkEntry:addCondition(npc.base.condition.item.item(554, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 22 silver coins. You advance in Don Valerio Guilianni's favour."));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 2200));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(554, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(152, "=", 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(153, "=", 60));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("Aha! These look delicious, they do! Ya did good work this time, I'm sure everyone will be pleased. Your payment is twenty two silvers.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 16));
talkEntry:addCondition(npc.base.condition.item.item(554, "all", "<", 5, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Oy! That feast is today! We need those five venison dishes as soon as possible, don't come back without them!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 16));
talkEntry:addCondition(npc.base.condition.item.item(554, "all", "<", 5, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("Oy! That feast is today! We need those five venison dishes as soon as possible, don't come back without them!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(25.0));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New Quest] Stock up Galmair's storage"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(152, "=", 17));
talkEntry:addResponse("Our alchemists are hard at work! They've recently taken some of our powders from the storage, therefore.... it must be replaced! Bring em 5 bags of sapphire powder.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 0));
talkEntry:addCondition(npc.base.condition.chance.chance(25.0));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New Quest] Stock up Galmair's storage"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(152, "=", 17));
talkEntry:addResponse("Our alchemists are hard at work! They've recently taken some of our powders from the storage, therefore.... it must be replaced! Bring em 5 bags of sapphire powder.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 17));
talkEntry:addCondition(npc.base.condition.item.item(446, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded a sapphire ring. You advance in Don Valerio Guilianni's favour."));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(446, 1, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(279, 1, 599, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(152, "=", 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(153, "=", 48));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("Very good! These will do just fine. I'm sure the alchemist' will be pleased. Now that the storage is once again filled, here is your reward.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 17));
talkEntry:addCondition(npc.base.condition.item.item(446, "all", "<", 5, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("I thought I gave you an order? Don't come back until you have the five sapphire powder.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 17));
talkEntry:addCondition(npc.base.condition.item.item(446, "all", "<", 5, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("I thought I gave you an order? Don't come back until you have the five sapphire powder.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(33.33));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New Quest] Stock up Galmair's storage"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(152, "=", 18));
talkEntry:addResponse("#me grumbles 'Some of our smiths snuck in and snatched out some of our coal. I would've given it to them if they filled out a requsition order! Nonetheless, we are short and I need you to get me 15 coal ores.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 0));
talkEntry:addCondition(npc.base.condition.chance.chance(33.33));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New Quest] Stock up Galmair's storage"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(152, "=", 18));
talkEntry:addResponse("#me grumbles 'Some of our smiths snuck in and snatched out some of our coal. I would've given it to them if they filled out a requsition order! Nonetheless, we are short and I need you to get me 15 coal ores.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 18));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", ">", 14, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded ten silver coins. You advance in Don Valerio Guilianni's favour."));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 1000));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(21, 15, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(152, "=", 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(153, "=", 36));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("Good work there! Good to know we got atleast someone reliable in this operation. Here is your payment.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 18));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", ">", 14, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst zehn Silberstücke. Dein Ansehen bei Don Valerio Guilianni's steigt."));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 1000));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(21, 15, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(152, "=", 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(153, "=", 36));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("translate");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 18));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", "<", 15, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("We need that coal! You never know when the Don is going to want something crafted. Be sure to come back with 15 coal ores.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 18));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", "<", 15, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("We need that coal! You never know when the Don is going to want something crafted. Be sure to come back with 15 coal ores.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(50.0));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New Quest] Stock up Galmair's storage"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(152, "=", 19));
talkEntry:addResponse("The Don has taken a helmet from our storage to armor one of his new bodyguards. He's the Don so I've no say in the matter, but now we're short! I need you to go get me one pot helmet.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 0));
talkEntry:addCondition(npc.base.condition.chance.chance(50.0));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New Quest] Stock up Galmair's storage"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(152, "=", 19));
talkEntry:addResponse("The Don has taken a helmet from our storage to armor one of his new bodyguards. He's the Don so I've no say in the matter, but now we're short! I need you to go get me one pot helmet.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 19));
talkEntry:addCondition(npc.base.condition.item.item(94, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded a gold ingot. You advance in Don Valerio Guilianni's favour."));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(94, 1, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(236, 1, 599, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(152, "=", 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(153, "=", 48));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("This'll do great! The Don trusts me for this reason. I always have reliable good equipment for him! And here's your reward for your work.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 19));
talkEntry:addCondition(npc.base.condition.item.item(94, "all", "<", 1, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("You came back without the helmet? I can't have the Don come to me and be short! Don't come back unless you have the one pot helmet.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 19));
talkEntry:addCondition(npc.base.condition.item.item(94, "all", "<", 1, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("You came back without the helmet? I can't have the Don come to me and be short! Don't come back unless you have the one pot helmet.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(100.0));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New Quest] Stock up Galmair's storage"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(152, "=", 20));
talkEntry:addResponse("The Don commissioned a ring to be made and use a gold nugget fromthe storage. It might only be a single nugget, but it must be replaced! I need you to get me one gold nugget.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 0));
talkEntry:addCondition(npc.base.condition.chance.chance(100.0));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New Quest] Stock up Galmair's storage"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(152, "=", 20));
talkEntry:addResponse("The Don commissioned a ring to be made and use a gold nugget fromthe storage. It might only be a single nugget, but it must be replaced! I need you to get me one gold nugget.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 20));
talkEntry:addCondition(npc.base.condition.item.item(234, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded five silver coins. You advance in Don Valerio Guilianni's favour."));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 500));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(234, 1, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(152, "=", 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(153, "=", 48));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("Aha! Perfect! I'll just store this away and once again the Don's storage is full! Good work, here is your payment.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 20));
talkEntry:addCondition(npc.base.condition.item.item(234, "all", "<", 1, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Have you brought it? No!? Well don't return until you have one gold nugget for me!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 20));
talkEntry:addCondition(npc.base.condition.item.item(234, "all", "<", 1, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("translate");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 20));
talkEntry:addCondition(npc.base.condition.item.item(234, "all", "<", 1, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("Have you brought it? No!? Well don't return until you have one gold nugget for me!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(152, "=", 20));
talkEntry:addCondition(npc.base.condition.item.item(234, "all", "<", 1, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("translate");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("We don't need no help from anyone from that stinkin' Necktie Inn. Don't let me see you in here again.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addTrigger("order");
talkEntry:addResponse("We don't need no help from anyone from that stinkin' Necktie Inn. Don't let me see you in here again.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("I oversee the Don's personal storage here in Galmair.");
talkEntry:addResponse("As the Head Clerk for the Don, it's my duty to make sure that the Don's storage is always up to stock with his standards.");
talkEntry:addResponse("The Don himself has appointed as the Head Clerk of his storage. Galmair is a well oiled mill! We are constantly at work, and because of this we need to make sure that our storage is always full!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("I oversee the Don's personal storage here in Galmair.");
talkEntry:addResponse("As the Head Clerk for the Don, it's my duty to make sure that the Don's storage is always up to stock with his standards.");
talkEntry:addResponse("The Don himself has appointed as the Head Clerk of his storage. Galmair is a well oiled mill! We are constantly at work, and because of this we need to make sure that our storage is always full!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Gobaith? Never been. I've heard some stories from the locals... That Trollsbane sounds a lot like Galmair.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("Well good to meet ya! I'm sure you're hard work and labor will help the don!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Clerk");
talkEntry:addResponse("Aye that's me. It's my duty to ensure that our storage is kept up to the standard.");
talkEntry:addResponse("The Don needs a lot of things made for him! If I didn't do my job then a lot of his orders wouldn't be able to be filled.");
talkEntry:addResponse("I am the Head Clerk! If not for me Galmair would not be as wealthy! Don't tell the Don I said that.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("dwarf");
talkEntry:addResponse("Of course I'm a dwarf! I certainly hope you didnt mix me up for a halfer'.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Storage");
talkEntry:addResponse("Ah... The storage be my life! I didn't get this job just because of my good looks. Though... I'm certain that those helped.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Guard");
talkEntry:addResponse("A guard? No, not at all. I'm not one to fight! The Don has very capable men for that.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("loyal");
talkEntry:addResponse("I'm loyal to the Don of course! He showers us all in his wealth and riches and lets stay in his safety. Who wouldnt be loyal to him?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addResponse("That damn elf talks too much! I'm getting up in years, so being around him a waste of my time!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("That damn elf talks too much! I'm getting up in years, so being around him a waste of my time!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Runewick? I'll admit they have some fine craftmanship in the construction of their home... but thats it!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("The Don is a great man! I think goes without saying. It's because of him that our wealth continues to increase.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Well Galmair is where we live! The finest establishment in these lands... The wealthiest too.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("She be a looker, thats for sure. The Don once proposed to her. I can't possibly fathom why anyone would turn down an offer from the Don though.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Honour this! Glory that! They're delusional, all that really matters is money!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("Well I serve Irmorom of course! Have you visted his temple? It is a sight to behold for any craftsman!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("The god of trade and crafting! He is very important to us in Galmair and he watches over our deals and business. Its because of him we're so wealthy! Er.. And the Don of course!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("In Galmair, we don't lose. Ronagan helps ensure this!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("The items in my storage are NOT for sale! Only with the Don's or my own permission is anyone allowed to take something from it.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("I know quite a lot about Galmair and some of the neighboring factions.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Gurzad");
talkEntry:addTrigger("Gutri");
talkEntry:addResponse("I am the Head Clerk! I oversee the flow of goods and maintain the Don's storage!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("Of course!");
talkEntry:addResponse("I don't see why you wouldnt agree.");
talkEntry:addResponse("Obviously!");
talkEntry:addResponse("Huh!?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("Well I could care less!");
talkEntry:addResponse("Then be gone!");
talkEntry:addResponse("Yes!");
talkEntry:addResponse("You best not be saying that around the Don!");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("transalte", "State your business!");
talkingNPC:addCycleText("translate", "Be loyal to the Don, and you'll become rich!");
talkingNPC:addCycleText("translate", "Welcome to the halls of Galmair!");
talkingNPC:addCycleText("translate", "#me looks over various papers with a nod.");
talkingNPC:addCycleText("translate", "#me takes a quick swig from a flask when no one is looking");
talkingNPC:addCycleText("translate", "Good thing we don't live in a desert! HAH!");
talkingNPC:addCycleText("translate", "No one is more powerful than the Don!");
talkingNPC:addCycleText("translate", "I want YOU... to work for the Don.");
talkingNPC:addCycleText("translate", "C'mere! You can help Galmair's storage!");
talkingNPC:addCycleText("translate", "If you want to become rich, You've come to the right place!");
mainNPC:addLanguage(0);
mainNPC:addLanguage(2);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Das ist ein NPC dessen Entwickler zu faul war eine Beschreibung einzutragen.", "This NPC is Gurzad Gutri the Head Clerk.");
mainNPC:setUseMessage("Fasst mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut verwirrt.", "#me looks around confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 2364);
mainNPC:setEquipment(11, 193);
mainNPC:setEquipment(5, 1061);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 0);
mainNPC:setEquipment(9, 366);
mainNPC:setEquipment(10, 53);
mainNPC:setAutoIntroduceMode(true);

mainNPC:initDone();
end;

function receiveText(npcChar, texttype, message, speaker) mainNPC:receiveText(npcChar, texttype, speaker, message); end;
function nextCycle(npcChar) mainNPC:nextCycle(npcChar); end;
function lookAtNpc(npcChar, char, mode) mainNPC:lookAt(npcChar, char, mode); end;
function useNPC(npcChar, char, counter, param) mainNPC:use(npcChar, char); end;
initNpc();
initNpc = nil;
-- END
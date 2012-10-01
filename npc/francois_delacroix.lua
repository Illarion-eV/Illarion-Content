--------------------------------------------------------------------------------
-- NPC Name: Francois Delacroix                                      Runewick --
-- NPC Job:  trader                                                           --
--                                                                            --
-- NPC Race: human                      NPC Position:  911, 798, 1            --
-- NPC Sex:  male                       NPC Direction: north                  --
--                                                                            --
-- Author:   Regallo                                                          --
--                                                                            --
-- Last parsing: September 30, 2012                      easyNPC Parser v1.21 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (0, 911, 798, 1, 0, 'Francois Delacroix', 'npc.francois_delacroix', 0, 0, 0, 255, 255, 255, 255, 255, 255);
---]]

require("npc.base.basic")
require("npc.base.condition.language")
require("npc.base.consequence.inform")
require("npc.base.consequence.trade")
require("npc.base.talk")
require("npc.base.trade")
module("npc.francois_delacroix", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
local tradingNPC = npc.base.trade.tradeNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("kauf");
talkEntry:addTrigger("handel");
talkEntry:addResponse("Lass uns handeln!");
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("buy,");
talkEntry:addTrigger("sell");
talkEntry:addTrigger("trade");
talkEntry:addResponse("Let's trade!");
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkingNPC:addTalkingEntry(talkEntry);
end;
tradingNPC:addNotEnoughMoneyMsg("Du hast nicht genug Geld!", "You don't have enough money!");
tradingNPC:addDialogClosedMsg("Danke, komm doch bald wieder.", "Thanks, come back soon.");
tradingNPC:addDialogClosedNoTradeMsg("Nichts gefunden was dir gefällt?", "Don't you like my wares?");
tradingNPC:addWrongItemMsg("Das kaufe ich nicht.", "I'm not buying this.");
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Francois Delacroix the Trader. Keywords: Hello, Markets, Buy, Sell, Agriculture, Trade."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist der Händler Francois Delacroix. Schlüsselwörter: Hallo, Märkte, Handel, Ackerbau."));
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
talkEntry:addResponse("Good day.");
talkEntry:addResponse("How be you?");
talkEntry:addResponse("It seems to be your lucky day, why? You have found me as your agriculturalr of choice.");
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
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
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Good day sir, madam.");
talkEntry:addResponse("How be you?");
talkEntry:addResponse("It seems to be your lucky day, why? You have found me as your agriculturalr of choice.");
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
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
talkEntry:addResponse("Have a good day today. You are beautiful.");
talkEntry:addResponse("Smile, see you later.");
talkEntry:addResponse("Remember to tell your friends to come to Francois Delacroix for all their agricultural needs.");
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
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Have a good day today. You are beautiful.");
talkEntry:addResponse("Smile, see you later.");
talkEntry:addResponse("Remember to tell your friends to come to Francois Delacroix for all their agricultural needs.");
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
talkEntry:addResponse("I'd feel better if You  brought something.");
talkEntry:addResponse(" I feel a lot better now that you've come.");
talkEntry:addResponse("It's one of those days, you know?");
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
talkEntry:addResponse("Francois Delacroix , Agricultural goodsr");
talkEntry:addResponse("My name is Francois. It's beyond a pleasure to be acquainted with you");
talkEntry:addResponse(" Francois Delacroix. It still feels weird every time I say it.");
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ihr name");
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
talkEntry:addTrigger("profession");
talkEntry:addResponse("I sell goods such as milk and farmer tools");
talkEntry:addResponse("I sell that which you need.");
talkEntry:addResponse("I'm a self made agricultural goodsr.");
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
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
talkEntry:addResponse("I sell goods such as milk and farmer tools.");
talkEntry:addResponse("I sell that which you need.");
talkEntry:addResponse("I'm a self made agricultural goodsr.");
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
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
talkEntry:addResponse("That's like asking what is the sky. Honestly I don't think I could answer it.");
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
talkEntry:addResponse("Francois Delacroix , Agricultural goodsr");
talkEntry:addResponse("My name is Francois. It's beyond a pleasure to be acquainted with you");
talkEntry:addResponse(" Francois Delacroix. It still feels weird every time I say it.");
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
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
talkEntry:addTrigger("Business");
talkEntry:addTrigger("Markets");
talkEntry:addTrigger("Pepper");
talkEntry:addResponse("Recently pepper has been selling at triple its gross estimated volume. It's exciting to see how long this will last before I reap great profits when the price falls again.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Agriculture");
talkEntry:addTrigger("Farming");
talkEntry:addTrigger("crops");
talkEntry:addResponse("Harvesting crops and cattle is something that has always been and always will be. It's the most stable of markets.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Family");
talkEntry:addResponse("I don't want to talk about them.");
talkEntry:addResponse("Family is not a fond word in everyone's mind.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wife");
talkEntry:addResponse("Hahaha, maybe someday.");
talkEntry:addResponse("Settle down, me? Hahaha, maybe after I'm done making money.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addResponse("I don't know much of the man, but I can't help appreciate him for keeping this city safe for all of us who live here.");
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
talkEntry:addResponse("I don't know much of the man, but I can't help appreciate him for keeping this city safe for all of us who live here.");
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
talkEntry:addResponse("When I was a kid I never thought I would be a city person, but the women here really are prettier.");
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
talkEntry:addResponse("Of course I heard the name, but I know nothing of Galmair or its people.");
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
talkEntry:addResponse("I've never been.");
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
talkEntry:addResponse("I grew up wanting to be like her.");
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
talkEntry:addResponse("I grew up wanting to be like her.");
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
talkEntry:addResponse("I've been. It's a little too dry and hot. I prefer the Runewick Breeze.");
talkEntry:addResponse("They have quite a few jewelry makers. I think most of my collection is from Cadomyrian smiths.");
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
talkEntry:addResponse("On the downside it is dangerously hot in the Albarian deserts. On the upside the Alberian women look dangerously hot.");
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
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("Never been. I have no idea. People keep asking me about this. Maybe I should go someday.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("salkama");
talkEntry:addResponse("I have lived in this land all my life. I don't love it, but being anywhere else is just uncomfortable.");
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
talkEntry:addResponse("I follow Irmorom, Of course. What kind of question is that.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("He keeps me at the top of my craft, which makes me money, which gets all these girls to look my way. How can I not be content.");
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
talkEntry:addTrigger("tell something");
talkEntry:addResponse("What is there to tell? I'm Runewhick's number one agricultural trading pretty boy.");
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
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Francois");
talkEntry:addTrigger("Delacroix");
talkEntry:addResponse("Do you need something? Chances are I selling it.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Francois");
talkEntry:addTrigger("Delacroix");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("Please be more specific. ");
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
talkEntry:addResponse(" Please be more specific.");
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
tradingNPC:addNotEnoughMoneyMsg("Du hast nicht genug Geld!", "You don't have enough money!");
tradingNPC:addDialogClosedMsg("Danke, komm doch bald wieder.", "Thanks, come back soon.");
tradingNPC:addDialogClosedNoTradeMsg("Nichts gefunden was dir gefällt?", "Don't you like my wares?");
tradingNPC:addWrongItemMsg("Das kaufe ich nicht.", "I'm not buying this.");
talkingNPC:addCycleText("GERMAN.", "Are you a farmer and need tools? I, Francois Delacroix carries both farming and fishing tools.");
talkingNPC:addCycleText("GERMAN.", "Want beautiful furs to last the winter or maybe leather to survive a sword strike? Please visit I, Francois Delacroix.");
talkingNPC:addCycleText("GERMAN.", "Are you hungry, maybe dying from scurvy? I, Francois Delacroix carry healthy fruits and vegetables. Please visit.");
talkingNPC:addCycleText("GERMAN.", "I have fish, You want fish. Please visit I, Francois Delacroix.");
talkingNPC:addCycleText("GERMAN.", "I have seeds from any season. Are you about to settle down and start a new farm and family?  First visit I, Francois Delacroix.");
talkingNPC:addCycleText("GERMAN.", "Can't afford meat? Milk is the perfect way to feed a family with little money. Milk even goes great with meat if you are lucky enough to afford both, so visit I, Francois Delacroix.");
talkingNPC:addCycleText("GERMAN.", "How are you doing today? Check out the latest wares of I, Francois Delacroix.");
talkingNPC:addCycleText("GERMAN.", "Your favorite agricultural trader, I Francois Delacroix is here for you.");
talkingNPC:addCycleText("GERMAN.", "You are all beautiful people. Have a Beautiful day.");
talkingNPC:addCycleText("GERMAN.", "Are you hungry big man? Or do you have a man you want to make happy pretty lady? I, Francois Delacroix sells raw meat. Eat and be merry!");
tradingNPC:addItem(npc.base.trade.tradeNPCItem(51,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(126,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(258,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(271,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(59,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2547,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2586,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(154,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(200,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(201,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(290,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(249,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(259,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(772,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(778,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2493,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(259,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(291,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(534,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(728,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(773,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(779,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2494,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2917,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(330,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(307,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(552,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(553,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2934,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(15,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(80,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(81,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(147,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(151,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(199,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(302,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(388,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(72,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(73,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(355,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(455,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(51,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(126,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(258,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(271,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(59,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2547,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2586,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(154,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(200,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(201,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(290,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(249,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(259,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(772,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(778,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2493,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(259,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(291,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(534,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(728,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(773,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(779,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2494,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2917,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(330,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(307,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(552,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(553,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2934,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(15,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(80,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(81,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(147,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(151,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(199,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(302,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(388,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(72,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(73,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(355,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(455,"buySecondary"));
tradingNPC:addNotEnoughMoneyMsg("Du hast nicht genug Geld!", "You don't have enough money!");
tradingNPC:addDialogClosedMsg("Danke, komm doch bald wieder.", "Thanks, come back soon.");
tradingNPC:addDialogClosedNoTradeMsg("Nichts gefunden was dir gefällt?", "Don't you like my wares?");
tradingNPC:addWrongItemMsg("Das kaufe ich nicht.", "I'm not buying this.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(1);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Dieser NPC ist der Bauer Francois Delacroix.", "This is NPC is the peasant Francois Delacroix.");
mainNPC:setUseMessage("Fass mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut dich verwirrt an.", "#me looks at you confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 813);
mainNPC:setEquipment(11, 55);
mainNPC:setEquipment(5, 258);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 2295);
mainNPC:setEquipment(9, 823);
mainNPC:setEquipment(10, 53);
tradingNPC:addNotEnoughMoneyMsg("Du hast nicht genug Geld!", "You don't have enough money!");
tradingNPC:addDialogClosedMsg("Danke, komm doch bald wieder.", "Thanks, come back soon.");
tradingNPC:addDialogClosedNoTradeMsg("Nichts gefunden was dir gefällt?", "Don't you like my wares?");
tradingNPC:addWrongItemMsg("Das kaufe ich nicht.", "I'm not buying this.");
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
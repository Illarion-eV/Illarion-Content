--------------------------------------------------------------------------------
-- NPC Name: Severus Rabon                                            Cadomyr --
-- NPC Job:  Waiter                                                           --
--                                                                            --
-- NPC Race: human                      NPC Position:  113, 574, 0            --
-- NPC Sex:  male                       NPC Direction: south                  --
--                                                                            --
-- Authors:  Regallo                                                          --
--           Estralis Seborian                                                --
--                                                       easyNPC Parser v1.21 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (0, 113, 574, 0, 4, 'Severus Rabon', 'npc.severus_rabon', 0, 1, 1, 205, 102, 29, 139, 90, 43);
---]]

require("npc.base.basic")
require("npc.base.condition.chance")
require("npc.base.condition.language")
require("npc.base.consequence.inform")
require("npc.base.consequence.trade")
require("npc.base.talk")
require("npc.base.trade")
module("npc.severus_rabon", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
local tradingNPC = npc.base.trade.tradeNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("verkauf");
talkEntry:addTrigger("handel");
talkEntry:addResponse("Lass uns handeln!");
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("sell");
talkEntry:addTrigger("trade");
talkEntry:addResponse("Let's trade!");
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Severus Rabon the Waiter. Keywords: Good day, tavern, Linda, trade."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Severus Rabon der Ober. Schlüsselwörter: Guten Tag, Taverne, Linda, Handel."));
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
talkEntry:addResponse("Please talk to my daughter. She will seat you and then I will take your order.");
talkEntry:addResponse("If you're a regular please seat yourself. My tavern is your home.");
talkEntry:addResponse("If I may be of service I would recommend the stew. It's our signature dish.");
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
talkEntry:addResponse("Redet doch bitte mit meiner Tochter. Sie wird euch einen Platz zeigen und ich nehme dann eure Bestellung entgegen.");
talkEntry:addResponse("Als Stammgast dürft ihr euch natürlich einen Platz aussuchen. Fühlt euch wie zuhause.");
talkEntry:addResponse("Wenn ich euch etwas empfehlen dürfte, der Eintopf ist heute vorzüglich. Er ist das Stammessen hier.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Please talk to my daughter. She will seat you and then I will take your order.");
talkEntry:addResponse("If you're a regular please seat yourself. My business is your home.");
talkEntry:addResponse("If I may be of service I would recommend the stew. It's our signature dish.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Redet doch bitte mit meiner Tochter. Sie wird euch einen Platz zeigen und ich nehme dann eure Bestellung entgegen.");
talkEntry:addResponse("Als Stammgast dürft ihr euch natürlich einen Platz aussuchen. Fühlt euch wie zuhause.");
talkEntry:addResponse("Wenn ich euch etwas empfehlen dürfte, der Eintopf ist heute vorzüglich. Er ist das Stammessen hier.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Thank you, please come again.");
talkEntry:addResponse("I would be most grateful if you would bless this institution with your presence once more.");
talkEntry:addResponse("I hope you enjoyed your meal. Remember you can come back any time. The food is good here and the prices are so low the homeless can afford to it.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Danke, kommt doch gerne wieder.");
talkEntry:addResponse("Ich wäre euch zu Dank verpflichtet, wenn ihr dieser Einrichtung erneut mit eurer Anwesenheit erfreuen würdet.");
talkEntry:addResponse("Ich hoffe, es hat geschmeckt. Denkt daran, ihr seid hier immer willkommen. Das Essen ist lecker und die Preise können sich selbst Obdachlose leisten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Thank you please come again.");
talkEntry:addResponse("I would be most grateful if you would bless this institution with your presence once more.");
talkEntry:addResponse("I hope you enjoyed your meal. Remember you can come back any time. The food is good here and the prices are so low the homeless can afford to it.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Danke, kommt doch gerne wieder.");
talkEntry:addResponse("Ich wäre euch zu Dank verpflichtet, wenn ihr dieser Einrichtung erneut mit eurer Anwesenheit erfreuen würdet.");
talkEntry:addResponse("Ich hoffe, es hat geschmeckt. Denkt daran, ihr seid hier immer willkommen. Das Essen ist lecker und die Preise können sich selbst Obdachlose leisten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addResponse("I wish Linda would take a break more often. She looks so tired.");
talkEntry:addResponse("I feel Linda is working too hard. Maybe I should hire an extra hostess.");
talkEntry:addResponse("May I take your order?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befind");
talkEntry:addResponse("Ich wünschte, Linda würde öfter mal eine Pause machen. Sie sieht so müde aus.");
talkEntry:addResponse("Linda arbeitet eindach zu hart. Ich sollte noch eine Kellnerin einstellen.");
talkEntry:addResponse("Ihre Bestellung, bitte?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("I am Severus Rabon, father and tavern owner extrodinaire.");
talkEntry:addResponse("I am Severus Rabon, father of the Cadomyr's most famous cook Linda Rabon.");
talkEntry:addResponse("I am Severus. This is my tavern the Unicorn Lion. Me and my wife built this place from scratch along with our first home. Please have a seat, a meal and become part of the family.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ihr name");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Ich bin Severus Rabon, Vater und Tavernenbesitzer.");
talkEntry:addResponse("Ich bin Severus Rabon, Vater von Cadomyrs berühmtester Köchin, Linda Rabon.");
talkEntry:addResponse("Ich bin Severus. Dies hier ist meine Tavern, der Einhörnige Löwe. Ich und meine Frau haben sie aus dem Nichts aufgebaut, sie ist unsere Heimat. Setzt euch, esst was und werdet Teil der Familie.");
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
talkEntry:addResponse("Your order, please?");
talkEntry:addResponse("What can I serve you today?");
talkEntry:addResponse("Yes?");
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
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
talkEntry:addResponse("Ihre Bestellung, bitte.");
talkEntry:addResponse("Was kann ich ihnen bringen?");
talkEntry:addResponse("Jawohl?");
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("I own this place here. So what would I call myself? Bartender, waiter? I don't know, just call me Severus.");
talkEntry:addResponse("Right now I am the waiter and I used to be the cook, but my beautiful and talented daughter has been given a gift from the gods. She is now the cook.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Mir gehört diese Taverne. Was bin ich also - ein Barmann, ein Ober? Eigentlich auch egal, nennt mich Severus.");
talkEntry:addResponse("Ich bin hier der Ober, ich war auch mal der Koch, aber meine schöne und talentierte Tochter ist von den Göttern gesegnet. Sie ist nun die Köchin.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("I own this place here. So what would I call myself. Bartender, waiter? I don't know, just call me Severus.");
talkEntry:addResponse("Right now I am the waiter and I used to be the cook, but my beautiful and talented daughter has been given a gift from the gods. She is now the cook.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Mir gehört diese Taverne. Was bin ich also - ein Barmann, ein Ober? Eigentlich auch egal, nennt mich Severus.");
talkEntry:addResponse("Ich bin hier der Ober, ich war auch mal der Koch, aber meine schöne und talentierte Tochter ist von den Göttern gesegnet. Sie ist nun die Köchin.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Lion");
talkEntry:addTrigger("Unicorn");
talkEntry:addResponse("It started out as a stand. I only sold stew back then. After I got married I opened up this place. Now it is run by me and my beautiful daughter alone...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Löwe");
talkEntry:addTrigger("Einhorn");
talkEntry:addTrigger("Einhörnig");
talkEntry:addResponse("All dies hat mal als kleiner Markstand angefangen, damals gab es nur Eintopf. Nach meiner Hochzeit habe ich diese Taverne eröffnet. Nun führen sie nur noch meine schöne Tochter und ich...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Daughter");
talkEntry:addResponse("Linda is all that remains for me. After my wife passed away, I realised that Rose continues to life through Linda.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tochter");
talkEntry:addResponse("Linda ist alles, was mir geblieben ist. Nachdem meine Frau gestorben war, habe ich realisiert, dass sie durch Linda weiterlebt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Linda");
talkEntry:addResponse("Linda is all that remains for me. After my wife passed away, I realised that Rose continues to life through Linda.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Linda");
talkEntry:addResponse("Linda ist alles, was mir geblieben ist. Nachdem meine Frau gestorben war, habe ich realisiert, dass sie durch Linda weiterlebt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("wife");
talkEntry:addResponse("She went from wife, to lover to part of my soul. My wife Rose is no more, but I have my daughter Linda.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Frau");
talkEntry:addResponse("Aus einer Ehefrau wurde eine Geliebte und aus ihr ein Teil meiner Seele. Meine Frau Rose ist nicht mehr, aber ich habe ja meine Tochter Linda.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Rose");
talkEntry:addResponse("She went from wife, to lover to part of my soul. My wife Rose is no more, but I have my daughter Linda.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Rose");
talkEntry:addResponse("Aus einer Ehefrau wurde eine Geliebte und aus ihr ein Teil meiner Seele. Meine Frau Rose ist nicht mehr, aber ich habe ja meine Tochter Linda.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hassan");
talkEntry:addResponse("This fellow brings life to this place. He's so quiet himself though. Maybe he will open up someday.");
talkEntry:addResponse("Hassan is too nice. Too nice to be a fan waiver. He's big though, and each of us have our place.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hassan");
talkEntry:addResponse("Der Kerl bring Leben in die Bude. Er ist zwar etwas schweigsam, aber vielleicht öffnet er sich ja doch noch.");
talkEntry:addResponse("Hassan ist wirklich nett. Eigentlich viel zu nett, um ein Fächelwedler zu sein. Er ist recht groß und wir alle haben unsere Bestimmung.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Queen");
talkEntry:addResponse("I await the day when the queen graces our tavern with a visit.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königin");
talkEntry:addResponse("Ich kann es kaum erwarten, dass die Königin meiner Taverne ihre Anwesenheit schenkt und ihr einen Besuch abstattet.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("I await the day when the queen graces our tavern with a visit.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Ich kann es kaum erwarten, dass die Königin meiner Taverne ihre Anwesenheit schenkt und ihr einen Besuch abstattet.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("albar");
talkEntry:addResponse("Haha. I guess since I'm a business man now, I should look at things like maps. Someday.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("Haha, nun, da ich ein Geschäftsmann bin, sollte ich wohl mal auf sowas wie Landkarten gucken. Oder auch nicht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gods");
talkEntry:addResponse("Irmorom. I respect Irmorom, only.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Götter");
talkEntry:addTrigger("Gott");
talkEntry:addResponse("Irmorom. Ich ehre nur Irmorom.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("He's the only one that ever cared about me. I give him ten percent of my all the money I make.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("Er ist der einzige, der sich um mich scherte. Daher gebe ich ihm zehn Prozent aller Einnahmen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("secret");
talkEntry:addResponse("I'm too bland of a person to have any.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Geheimnis");
talkEntry:addResponse("Ich bin nur ein einfacher Mann und habe keine Geheimnisse.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Severus");
talkEntry:addTrigger("Rabon");
talkEntry:addResponse("Oh, do you need something?");
talkEntry:addResponse("That is me.");
talkEntry:addResponse("Hello. I am Severus Rabon. I would be glad to help you with anything that you need.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Severus");
talkEntry:addTrigger("Rabon");
talkEntry:addResponse("Oh, braucht ihr etwas?");
talkEntry:addResponse("Das bin ich.");
talkEntry:addResponse("Hallo. Ich bin Severus Rabon. Ich bin euch gerne behilflich, wenn ihr etwas benötigt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("I did not say anything.");
talkEntry:addResponse("I don't believe I asked a yes or no question.");
talkEntry:addResponse("Wait, what?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("Hab ich was gesagt?");
talkEntry:addResponse("Ich glaube nicht, dass ich recht verstehe, um was es geht.");
talkEntry:addResponse("Wie bitte?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("I did not say anything.");
talkEntry:addResponse("I don't believe I asked a yes or no question.");
talkEntry:addResponse("Wait, what?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("Hab ich was gesagt?");
talkEntry:addResponse("Ich glaube nicht, dass ich recht verstehe, um was es geht.");
talkEntry:addResponse("Wie bitte?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("This discussion is not relevant to me.");
talkEntry:addResponse("Maybe talk about something like adventures or missions. People respond well to those words.");
talkEntry:addResponse("I have no intention of buying your chicken.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Irgendwie interessiert mich das nicht.");
talkEntry:addResponse("Redet doch über Aufgaben oder Abenteuer. Die Leute reden gerne über sowas.");
talkEntry:addResponse("Ich kaufe keine Hühner.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("Eintopf ist genau das richtige nach einem Ritt durch die Wüste. Er macht satt und betäubt erfreut auch den Gaumen.", "Stew is the perfect way to fill a stomach emptied from a trek across the desert. It is both fulfilling and tantalizing to the tongue.");
talkingNPC:addCycleText("Was darf es denn heute sein? Ich empfehle etwas kaltes zu trinken und etwas warmes zu essen.", "What will you be having today? I suggest a cool drink followed by a hot meal.");
talkingNPC:addCycleText("Balance ist alles im Leben! Insbesondere, wenn es um das Servieren geht.", "Balance is the key to dining as it is in any other aspect of life.");
talkingNPC:addCycleText("Das sieht hier ja wieder aus... Hoffentlich zwingt mich Linda nicht zum Wischen.", "This place is a mess. I hope Linda doesn't make me mop.");
talkingNPC:addCycleText("Ich sollte mal nach Linda sehen. Ich hoffe, sie ist nicht allzu müde.", "I should check up on Linda. I hope she's not too tired.");
talkingNPC:addCycleText("Vielleicht sollte ich einen Gaukler anheuern. Ich denke, dass die Kundschaft auch einen Geschichtenerzähler gutheißen würde.", "Maybe I should hire a gleeman. I bet the customers would enjoy a story teller as well.");
talkingNPC:addCycleText("Wahre Männer fassen es in Worte, wie viel ihnen eine Frau bedeutet. Wahre Männer lieben!", "Real men tell the women in their lives how much they mean to them. Real men love.");
talkingNPC:addCycleText("Das schwerste am Arbeiten ist die Arbeit.", "The hardest part of work is working.");
talkingNPC:addCycleText("Schaut doch gerne mal wieder rein. Es gibt für uns nichts besseres als euch ein zweites mal zu bedienen.", "Please come again. We would like nothing better than to serve you another meal.");
talkingNPC:addCycleText("Entschuldigt, dass es so warm hier drinnen ist. Meine Tochter würde es nicht gut finden, wenn ich eine Horde Fächelwedlerinnen einstellen würde. Sie meint, ich könnte doch Kerle einstellen, aber das wäre mir wieder nicht recht.", "I'm sorry it's so hot in here. My daughter won't let me hire a bunch of girls to fan everyone. She said I could hire guys, but I would never allow that.");
talkingNPC:addCycleText("Linda! Ist alles in Ordnung?", "Linda! Is everything alright over there?");
talkingNPC:addCycleText("#me seufzt: 'Rose, oh Rose...'", "#me sighs: 'Rose, O Rose...'");
tradingNPC:addItem(npc.base.trade.tradeNPCItem(164,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(191,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(224,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(353,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(453,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(454,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(517,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(518,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(783,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(784,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(785,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(786,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(787,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(788,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(789,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(790,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(791,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1315,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1316,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1317,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1318,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1319,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1840,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1841,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1842,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1843,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1844,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1853,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1854,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1855,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1856,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1857,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1858,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1859,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1860,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1861,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1908,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1909,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2055,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2056,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2057,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2058,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2059,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2185,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2186,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2187,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2188,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2189,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2276,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2278,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2456,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2496,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2497,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2498,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2499,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2500,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2501,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2922,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2923,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2935,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2952,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(81,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(151,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(224,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(290,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(783,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(786,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(788,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(789,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(791,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1315,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(80,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(199,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(784,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(785,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(787,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1318,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1316,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1319,"buySecondary"));
tradingNPC:addNotEnoughMoneyMsg("Du hast nicht genug Geld!", "You don't have enough money!");
tradingNPC:addDialogClosedMsg("Danke, komm doch bald wieder.", "Thanks, come back soon.");
tradingNPC:addDialogClosedNoTradeMsg("Nichts gefunden was dir gefällt?", "Don't you like my wares?");
mainNPC:addLanguage(0);
mainNPC:addLanguage(1);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Dieser NPC ist Severus Rabon der Ober.", "This NPC is Severus Rabon the Waiter.");
mainNPC:setUseMessage("Fass mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut dich verwirrt an.", "#me looks at you confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 808);
mainNPC:setEquipment(11, 0);
mainNPC:setEquipment(5, 0);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 0);
mainNPC:setEquipment(9, 367);
mainNPC:setEquipment(10, 369);
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
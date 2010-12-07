--------------------------------------------------------------------------------
-- NPC Name: Advari Stonebog                                             None --
-- NPC Job:  trader                                                           --
--                                                                            --
-- NPC Race: dwarf                      NPC Position:  261, 250, 0            --
-- NPC Sex:  male                       NPC Direction: east                   --
--                                                                            --
-- Author:   not set                                                          --
--                                                                            --
-- Last parsing: December 07, 2010                       easyNPC Parser v1.02 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (1, 261, 250, 0, 2, 'Advari Stonebog', 'npc.advari_stonebog', 0, 2, 5, 123, 62, 9, 245, 180, 137);
---]]

require("npc.base.basic")
require("npc.base.condition.chance")
require("npc.base.condition.language")
require("npc.base.consequence.inform")
require("npc.base.talk")
module("npc.advari_stonebog", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Advari Stonebog the trader. Keyphrases: usual trading trigers."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Advari Stonebog der Händler. Schlüsselwörter: die üblichen Handelstrigger."));
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
talkEntry:addResponse("Hiho, traveler.");
talkEntry:addResponse("Abundance and Wealth, my friend.");
talkEntry:addResponse("Hail Irmorom.");
talkEntry:addResponse("Gr'duzk. - would I say and means good day.");
talkEntry:addResponse("H'druk g'har. This's my cottage. Do you like to buy something?");
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
talkEntry:addResponse("Hiho, Reisender.");
talkEntry:addResponse("Wohlstand und profitable Geschäfte, mein Freund.");
talkEntry:addResponse("Heil Irmorom.");
talkEntry:addResponse("Gr'duzk. - würde ich sagen und heißt so viel wie guten Tag.");
talkEntry:addResponse("H'druk g'har. Dies ist mein Schuppen. Wollt ihr was kaufen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hiho, traveler.");
talkEntry:addResponse("Abundance and Wealth, my friend.");
talkEntry:addResponse("Hail Irmorom.");
talkEntry:addResponse("Gr'duzk.");
talkEntry:addResponse("H'druk g'har. This's my cottage. Do you like to buy something?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Hiho, Reisender.");
talkEntry:addResponse("Wohlstand und profitable Geschäfte, mein Freund.");
talkEntry:addResponse("Heil Irmorom.");
talkEntry:addResponse("Gr'duzk.");
talkEntry:addResponse("H'druk g'har. Dies ist mein Schuppen. Wollt ihr was kaufen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Farewell.");
talkEntry:addResponse("Abundance and Wealth, my friend.");
talkEntry:addResponse("Arr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Gehabt Euch wohl.");
talkEntry:addResponse("Wohlstand und profitable Geschäfte, mein Freund.");
talkEntry:addResponse("Arr. N' schönen Tag noch.");
talkEntry:addResponse("G'hruk. ");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Farewell.");
talkEntry:addResponse("Abundance and Wealth, my friend.");
talkEntry:addResponse("Arr.");
talkEntry:addResponse("G'hruk.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Gehabt Euch wohl.");
talkEntry:addResponse("Wohlstand und profitable Geschäfte, mein Freund.");
talkEntry:addResponse("Arr. N' schönen Tag noch.");
talkEntry:addResponse("G'hruk.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("Aye, the business is well. And the Greennoses behave properly.");
talkEntry:addResponse("Arr, as soon as I'm able to leave my shop, I am going to drink beer at Hagar's Inn. He is a Longleg, but the stuff is brewed by us dwarves!");
talkEntry:addResponse("Gold. Tha'ts what a dwarf aspire. And I got a huge amount of it.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befind");
talkEntry:addResponse("Aye, das Geschäft geht gut, und die Grünschnauzen benehmen sich einigermaßen.");
talkEntry:addResponse("Arr, wenn ich einmal hier wegkomm, geh ich sofort zu Hagar! Der ist zwar ein Langbein, aber das Bier, das haben wir Zwerge ihm gebraut!");
talkEntry:addResponse("Gold. Das ist was ein Zwerg will. Und ich hab eine Menge davon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Arr, nur Weichzwerge verraten ihren wahren Namen. Wer weiß wem, einer wie du, ihn erzählen würde! Aber in der allgemeinen Sprache heiße ich Advari Stonebog.");
talkEntry:addResponse("Advari Stonebog. Und mehr braucht einer wie du, nicht zu wissen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Ich hab keine Arbeit für dich, frag lieber den Don. Aye?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addResponse("Ich hab keine Arbeit für dich, frag lieber den Don. Aye?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Ich handle mit Saatgut. Wenn du ein Bauer bist, bist du bei mir richtig. Ich verkauf dir alles was du brauchst. Aye. und außerdem pass ich auf, dass die Grünschnauzen dort drüben keinen Unsinn treiben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Ich handle mit Saatgut. Wenn du ein Bauer bist, bist du bei mir richtig. Ich verkauf dir alles was du brauchst. Aye. und außerdem pass ich auf, dass die Grünschnauzen dort drüben keinen Unsinn treiben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Gobaith? Drhg'hgin! So spricht niemand über meine Großmutter! Verzieh dich!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Aye, du Weichnase.");
talkEntry:addResponse("Schön für Euch. Aber ein ordentlicher Zwerg würde nie seinen wahren Namen verraten.");
talkEntry:addResponse("Sehr genehm. Werd ich mir merken! Wie Zwerge haben ein ausgezeichnetes Gedächtnis	. und ich werd's nicht vergessen solltest du versuchen mich übers Ohr zu hauen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Dwar[vf]");
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("or[ck]");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("name");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hagar");
talkEntry:addTrigger("wernson");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gold");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("advari");
talkEntry:addTrigger("stonebog");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beer");
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.(the winged sow)");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("zwerg");
talkEntry:addResponse("Wir Zwergenvolk habens ganz dicke hinter den Ohren. Furchteinflößende Krieger! Meisterhafte Steinmätze! Die großartigsten Schmiede! Die berühmtesten Poeten und Barden!");
talkEntry:addResponse("Hey Zwerge, hey Zwerge - hey Zwerge ho! Hey Zwerge, hey Zwerge go-go-go!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("or[ck]");
talkEntry:addResponse("Arr, der Don hat ganze zwei Marktstände an die Schweineschnauzen verpachtet! Jetzt darf ich aufpassen, was sie treiben.");
talkEntry:addResponse("Siehste den Ork, gegenüber? J'uk, der lümmelt den ganzen Tag rum und säuft die eigene Wahre weg. Das Bier schmeckt wie Pisse, frag mich nicht wo er das her hat. jedenfalls nicht von uns Zwergen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("name");
talkEntry:addResponse("N' ordentlicher Zwerg wie ich, isses nich so, der verrät seinen wahren Namen keinem. Das schützt uns Zwerge vor bösem Zauber-Firlefanz. Und so Schnik-Schnak, verstehste?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hagar");
talkEntry:addTrigger("wernson");
talkEntry:addResponse("Arr, Hager hat ne gute Taverne. Gut für ein Langbein, natürlich. Er wird von uns Zwergen mit Getränken beliefert. Glück für ihn, sonst würde wohl niemand beim ihm saufen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gold");
talkEntry:addResponse("#me fängt mit kehliger tiefer Stimme an zu singen: 'Gooold! Gold, Gold, Gold. Gold... Gold, Gold, Gold!'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bier");
talkEntry:addResponse("Aye, das beste Bier in Galmair verkauft Hagar Wernson in der Taverne zur geflügelten Sau. Die Pisse die der Ork gegenüber verkauft würd ich nicht mal trinken, wenns nen heilender Trunk wär und mir ne Axt in der Schulter steckt!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("advari");
talkEntry:addTrigger("stonebog");
talkEntry:addResponse("Arr, Weichzwerg! So denkt Ihr das ich heiß, nicht war? Wie auch immer. Was wollt Ihr handeln?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Arr. Jeder Zwerg weiß natürlich, daß Magie gemeingefährlicher Firlefanz ist! Und dieser Elvaine Morgan täte gut daran auf uns Zwerge zu hören!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Arr. Jeder Zwerg weiß natürlich, daß Magie gemeingefährlicher Firlefanz ist! Und dieser Elvaine Morgan täte gut daran auf uns Zwerge zu hören!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Drhg'hgin! Ein Sündenpfuhl wenn ihr mich fragt. Dort spielen sie mit Magie herum. Da versteh ich keine Scherze! Sollen sie sich selbst in die Luft sprengen, D'rkza...Narren.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Aye, der Don ist das Gesetz hier. Leg dich besser nicht mit ihm an. Er ist der reichste Zwerg hier... könnte das letzte sein was ihr getan habt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Galmair, Galmair! So ist der Nam. Hier gibst die größten Schätze im Boden. Und ein reicher Zwerg ist wohl angesehn. So läst's sich leben. Gedankt sei's Irmorom!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("queen");
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("königin");
talkEntry:addResponse("Kra'gstuck! Wir Zwerge halten nichts vom 'blauen' Blut! Wohlstand ist's was Ansehen bringt. Große reiche Clans, die haben bei uns das Sagen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Kra'gstuck! Wir Zwerge halten nichts vom 'blauen' Blut! Wohlstand ist's was Ansehen bringt. Große reiche Clans, die haben bei uns das Sagen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Cadomyr? Die werden doch von so einer verzogenen Göre regiert. Wenn ihr mich fragt, hat die keine Ahnung von Geschäften. Bei uns Zwergen, ja-ja, da haben nur die klügsten Köpfe was zu sagen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("Über Albar wollt ihr sprechen? Ich bitte Euch, ich bin ein angesehener Zwerg und hab dort tunlichst, nichts zu tun.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("Gynk, ja-ja! Dort gibt's Mienen! Natürlich nicht mit unseren zu vergleichen und alles voll mit Betrügern, aber was soll man von den Menschen schon besseres erwarten?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Sonniges, leuchtendes Salkamar. Überfüllt mit Magier-Pöbel. Wenn ich nur daran denke, reibt's mir in den Augen. Für so ein Land hat uns Irmorom nicht geschaffen. Nein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Irmorom, der Vater der Zwerge und ihr Ronagan, schützt mich vor langfingrigen Halblingen und betrügerischen Menschen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("Heil Irmorom. Schütze meinen Clan, in seinen Hallen aus Stein. Weit sind sie weg, doch kann man uns niemals trennen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ronagan");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("Aye, ich opfere einen guten Teil meiner Einkünfte dem Schattengott. So sorgt er dafür, dass ich vom diebischen Gesindel verschont bleibe! Arr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Ich verkaufe alle Dinge, die eines Farmers Herz begehren könnte. Und noch ein Bisschen mehr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Ich verwalte das Saatgut von Galmair. Eine äußerst wichtige Aufgabe. Die der Don, nur den fähigsten Männern anvertraut.");
talkEntry:addResponse("Arr. Ich pass auf das die Schweineschnauzen, hier am Markt, keinen Unsinn treiben! Sind ja so wie so nicht die klügsten, nicht wahr?");
talkEntry:addResponse("Gepriesen sei Irmorom, und gedankt sei's Ronagan. Die letzte Woche lief ausgezeichnet, und kein einziger Langfinger in der Nähe. Arr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("<NPC first name>");
talkEntry:addTrigger("<NPC last name>");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
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
talkEntry:addResponse("ENGLISH1");
talkEntry:addResponse("ENGLISH2");
talkEntry:addResponse("Aargk... - tell me about.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("Aye. Da stimm ich zu!");
talkEntry:addResponse("Arr, so gefällt mir das!");
talkEntry:addResponse("Aargk... - sprich was ist's?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("Fein-fein. Ein alter Zwerg wie ich findet sich einfach damit ab.");
talkEntry:addResponse("Wenn's ihr so wollt.");
talkEntry:addResponse("Damit kann ich leben. Ich hoffe, ihr auch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(20));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.chance.chance(20));
talkEntry:addResponse("Aye, ist das so? Das ist mir neu.");
talkEntry:addResponse("#me lacht kehlig und streicht sich über den Bart. 'Na gut, ist ja gut.'");
talkEntry:addResponse("Arr!");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me singt mit kehliger Stimme: 'Hai-hie! Hai-hoh. Hai-hi! Hai-ho! Hai-ho-ho! Hai-hi! Hai-ho!'", "ENGLISH.");
talkingNPC:addCycleText("#me streicht sich zufrieden lächelnd über den langen buschigen Bart.", "ENGLISH.");
talkingNPC:addCycleText("#me kaut auf seiner Pfeife herum. Gelegentlich stopft er etwas Kraut nach.", "ENGLISH.");
talkingNPC:addCycleText("#me bläst einen großen Rauchring in die Luft, und gluckst glücklich.", "ENGLISH.");
talkingNPC:addCycleText("Langfinger fressen die Galgenvögel! Last's Euch sagen! Aye.", "ENGLISH.");
talkingNPC:addCycleText("#me knurrt etwas Unverständliches in seinen Bart, indessen funkelt er die Orkfrau beim Schuppen mit verärgertem Blick an.", "ENGLISH.");
talkingNPC:addCycleText("Arr...", "Arr...");
talkingNPC:addCycleText("Ich verkauf die schönsten Fälle zu den besten Preisen!", "ENGLISH.");
talkingNPC:addCycleText("Frische Schafsmilch! Leute, kommt her und kauft bei mir ein!", "ENGLISH.");
talkingNPC:addCycleText("Dort, edle Dame! Kauft mir leckere Früchte ab! Die Besten Früchte Galmairs verkaufe ich.", "ENGLISH.");
talkingNPC:addCycleText("#me verengt die Augen und betrachtet einen Moment lang misstrauisch den Ork gegenüber.", "ENGLISH.");
talkingNPC:addCycleText("Ha'ak! Ga strak ja'ada! Arr.", "Ha'ak! Ga strak ja'ada! Arr.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(2);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Ein ergrauter Zwerg. In seinem Mundwinkel steckt eine verzierte Pfeife und kleine Rauchwölkchen umgeben ihn.", "A grey dwarf. blabla  ENGLISH TRANSLATION PLZ!");
mainNPC:setUseMessage("Fass mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut dich verwirrt an.", "#me looks at you confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 2390);
mainNPC:setEquipment(11, 0);
mainNPC:setEquipment(5, 0);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 48);
mainNPC:setEquipment(9, 2116);
mainNPC:setEquipment(10, 326);
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
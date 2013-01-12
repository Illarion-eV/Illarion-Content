--------------------------------------------------------------------------------
-- NPC Name: Fijanna Squall                                              None --
-- NPC Job:  fortune teller                                                   --
--                                                                            --
-- NPC Race: human                      NPC Position:  670, 323, 0            --
-- NPC Sex:  female                     NPC Direction: south                  --
--                                                                            --
-- Author:   Miriam                                                           --
--                                                       easyNPC Parser v1.22 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (0, 670, 323, 0, 4, 'Fijanna Squall', 'npc.fijanna_squall', 1, 1, 0, 188, 91, 13, 253, 227, 205);
---]]

require("npc.base.basic")
require("npc.base.condition.chance")
require("npc.base.condition.language")
require("npc.base.condition.money")
require("npc.base.condition.state")
require("npc.base.consequence.inform")
require("npc.base.consequence.money")
require("npc.base.consequence.state")
require("npc.base.talk")
module("npc.fijanna_squall", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Fijanna Squall the fortune teller. Keywords: Fortune, greetings, profession, Findari."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Fijanna Squall die Wahrsagerin. Schlüsselwörter: Zukunft, Grüße, Beruf, Findari."));
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
talkEntry:addResponse("Be greeted in the name of the Goddess of air.");
talkEntry:addResponse("Greetings, traveller.");
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
talkEntry:addResponse("Sei gegrüßt im Namen der Göttin der Luft.");
talkEntry:addResponse("Sei gegrüßt, Reisender.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Be greeted in the name of the Goddess of air.");
talkEntry:addResponse("Greetings, traveller.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Sei gegrüßt im Namen der Göttin der Luft.");
talkEntry:addResponse("Sei gegrüßt, Reisender.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("May Findari watch over you.");
talkEntry:addResponse("Safe paths, traveller.");
talkEntry:addResponse("Farewell.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Möge Findari über dich wachen.");
talkEntry:addResponse("Sichere Pfade, Reisender.");
talkEntry:addResponse("Auf Bald.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("May Findari watch over you.");
talkEntry:addResponse("Safe paths, traveller.");
talkEntry:addResponse("Farewell.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Möge Findari über dich wachen.");
talkEntry:addResponse("Sichere Pfade, Reisender.");
talkEntry:addResponse("Auf Bald.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("I feel the wind. I know where it went, and I know the places where it will go. Do you feel the wind?");
talkEntry:addResponse("I feel as light as air.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befind");
talkEntry:addResponse("Ich spüre den Wind. Ich weiß woher er kam und wohin er geht. Spürst du den Wind?");
talkEntry:addResponse("Ich fühle mich so leicht wie Luft.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("I am Fijanna Spuall, a travelling Seer.");
talkEntry:addResponse("I am a travelling priest of the Goddess of air. My name is Fijanna. Nice to meet you.");
talkEntry:addResponse("My Name is Fijanna. Nice to meet you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Ich bin Fijanna Spuall, eine wandernde Seherin.");
talkEntry:addResponse("Ich bin eine reisende Priesterin der Göttin der Luft. Ich heiße Fijanna. Es freut mich dich zu treffen.");
talkEntry:addResponse("Ich heiße Fijanna. Freut mich dich zu sehen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.state.state("=", 1));
talkEntry:addCondition(npc.base.condition.money.money("=>", 100));
talkEntry:addTrigger("Yes");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 2));
talkEntry:addConsequence(npc.base.consequence.money.money("-", 300));
talkEntry:addResponse("Very well. I shall tell your fortune. What do you want to hear?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.state.state("=", 1));
talkEntry:addCondition(npc.base.condition.money.money("=>", 100));
talkEntry:addTrigger("Ja");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 2));
talkEntry:addConsequence(npc.base.consequence.money.money("-", 300));
talkEntry:addResponse("Gut. Ich werde deine Zukunft lesen. Worüber möchtest du etwas erfahren?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.state.state("=", 1));
talkEntry:addTrigger("Yes");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addResponse("Seems like, you didn't bring enough coins with you...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.state.state("=", 1));
talkEntry:addTrigger("Ja");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addResponse("Sieht so aus als hättest du nicht genügen Münzen mit...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.state.state("=", 1));
talkEntry:addTrigger("No");
talkEntry:addTrigger("Thanks");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addResponse("Come back anytime you want to hear about your fortune.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.state.state("=", 1));
talkEntry:addTrigger("Nein");
talkEntry:addTrigger("Danke");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addResponse("Komm einfach wieder vorbei wenn du etwas über deine Zukunft erfahren möchtest.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.state.state("=", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Do you want to hear your fortune in exchange for three silver coins? Say yes or no.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.state.state("=", 1));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Willst du deine Zukunft im Tausch für drei  Silberstücke gesagt bekommen? Antwortet einfach mit ja oder nein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.state.state("=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addResponse(". . . run!");
talkEntry:addResponse("You'll need strong friends");
talkEntry:addResponse("Take good care of yourself during the next few days.");
talkEntry:addResponse("Stay away from trouble as far as possible.");
talkEntry:addResponse("Avoiding monsters will keep you safe.");
talkEntry:addResponse("In the near future you'll need lots of luck.");
talkEntry:addResponse("In the near future you'd better be very careful.");
talkEntry:addResponse("It would be wise to avoid unnecessary danger");
talkEntry:addResponse("I'm sorry, you will experience a disappointment.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.state.state("=", 2));
talkEntry:addCondition(npc.base.condition.chance.chance(33.0));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addResponse(". . . lauf!");
talkEntry:addResponse("Du wirst starke Freunde brauchen.");
talkEntry:addResponse("Gibt in nächster Zeit gut auf dich Acht.");
talkEntry:addResponse("Meide Schwierigkeiten soweit es geht.");
talkEntry:addResponse("Gehe Monstern besser aus dem Weg, sonst erwartet dich Unglück.");
talkEntry:addResponse("Du wirst in nächster Zeit viel Glück gebrauchen können.");
talkEntry:addResponse("Sei in nächster Zeit sehr vorsichtig.");
talkEntry:addResponse("Besser du meidest unnötige Gefahren.");
talkEntry:addResponse("Es tut mir leid. Dich erwartet eine Enttäuschung.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.state.state("=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addResponse("Pride will result in a fall");
talkEntry:addResponse("Consider this, if you sow mischief, you'll reap conflict.");
talkEntry:addResponse("As you make your bed, so you must lie on it. Consider this well.");
talkEntry:addResponse("Be friendly and others will be friendly to you as well.");
talkEntry:addResponse("Smiling and laughing will open the doors for the good things in life.");
talkEntry:addResponse("You will go on an adventure.");
talkEntry:addResponse("You will achieve fame but you'll have to work for that.");
talkEntry:addResponse("Take good care of yourself, that's all I can tell you.");
talkEntry:addResponse("Be careful not to make enemies.");
talkEntry:addResponse("Don't try your luck.");
talkEntry:addResponse("Don't anger the Gods.");
talkEntry:addResponse(" You'll make a new acquaintance.");
talkEntry:addResponse("Hard work will pay off.");
talkEntry:addResponse("Work diligently and you won't regret it.");
talkEntry:addResponse("Believe in yourself, and you'll achieve great things.");
talkEntry:addResponse("You'll be famous one day, but you have to work for it.");
talkEntry:addResponse("Think positive, that's the only advice I can give you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.state.state("=", 2));
talkEntry:addCondition(npc.base.condition.chance.chance(53.0));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addResponse("Bedenke, Hochmut kommt vor dem Fall.");
talkEntry:addResponse("Bedenke: Wer Streit sucht, wird Ärger finden.");
talkEntry:addResponse("Wie man sich bettet so liegt man. Denke darüber nach.");
talkEntry:addResponse("Sei freundlich zu anderen und sie werden freundlich zu dir sein.");
talkEntry:addResponse("Lächeln und Lachen sind Tür und Pforte durch die viel Gutes in den Menschen hineinschlüpfen kann");
talkEntry:addResponse("Du wirst ein Abenteuer erleben.");
talkEntry:addResponse("Du wirst Ruhm erlangen, aber du musst auch etwas dafür tun.");
talkEntry:addResponse("Gib auf dich Acht, das ist alles was ich dir raten kann.");
talkEntry:addResponse("Gib Acht, dass du dir keine Feinde machst.");
talkEntry:addResponse("Fordere das Glück nicht heraus.");
talkEntry:addResponse("Ärgere die Götter nicht.");
talkEntry:addResponse("Du wirst eine neue Bekanntschaft machen.");
talkEntry:addResponse("Harte Arbeit wird sich für dich auszahlen.");
talkEntry:addResponse("Sei fleißig und du wirst es nicht bereuen.");
talkEntry:addResponse("Glaube an dich selbst, und du wirst großes erreichen");
talkEntry:addResponse("Du wirst Ruhm erlangen, aber du musst auch etwas dafür tun.");
talkEntry:addResponse("Alles was du brauchst ist Glaube an dich und an deine Fähigkeiten.");
talkEntry:addResponse("Denke Positiv, das ist der einzige Rat den ich dir geben kann.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.state.state("=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addResponse("Wealth is waiting for you.");
talkEntry:addResponse("You will receive a present.");
talkEntry:addResponse("You will be very lucky in the near future.");
talkEntry:addResponse("You will have a positive experience.");
talkEntry:addResponse("You'll find new friends.");
talkEntry:addResponse("You'll see the good in others.");
talkEntry:addResponse("You'll find a new friend.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.state.state("=", 2));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addResponse("Dich erwartet Reichtum");
talkEntry:addResponse("Du wirst ein Geschenk bekommen.");
talkEntry:addResponse("Du wirst Geld finden.");
talkEntry:addResponse("Du wirst in nächster Zeit großes Glück haben.");
talkEntry:addResponse("Du wirst positive Erfahrungen machen.");
talkEntry:addResponse("Du wirst neue Freunde finden.");
talkEntry:addResponse("Du wirst das Gute in anderen erkennen.");
talkEntry:addResponse("Du wirst einen neuen Freund finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("fortune");
talkEntry:addTrigger("future");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addResponse("I'll tell you your future, if you give me three silver coins in return. Do you want to hear about your fortune?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zukunft");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addResponse("Ich sage dir deine Zukunft voraus, wenn du mir dafür drei Silberstücke gibst. Möchtest du etwas über deine  Zukunft hören?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("I am a fortune teller. You know what a fortune teller does?");
talkEntry:addResponse("I listen to the wind and the people.");
talkEntry:addResponse("People come and ask me for advice and so I give advice.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Ich bin eine Wahrsagerin. Wisst ihr was eine Wahrsagerin tut?");
talkEntry:addResponse("Ich höre dem Wind und den Leuten zu.");
talkEntry:addResponse("Die Leute kommen und fragen mich um Rat, also gebe ich Rat.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("I am a fortune teller. You know what a fortune teller does?");
talkEntry:addResponse("I listen to the wind and the people.");
talkEntry:addResponse("People come and ask me for advice and so I give advice.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Ich bin eine Wahrsagerin. Wisst ihr was eine Wahrsagerin tut?");
talkEntry:addResponse("Ich höre dem Wind und den Leuten zu.");
talkEntry:addResponse("Die Leute kommen und fragen mich um Rat, also gebe ich Rat.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("We all breath air, so do the animals and the plants.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Wir alle atmen Luft. Auch die Tiere und Pflanzen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Findari");
talkEntry:addResponse("Oh, the Goddess of air, all my prayers are for her.");
talkEntry:addResponse("Yes, the Goddess of air, all my doing is done to serve her.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Findari");
talkEntry:addResponse("Oh, die Göttin der Luft. All meine Gebete gelten ihr.");
talkEntry:addResponse("Ja, die Göttin der Luft, alle mein Tun ist getan um ihr zu dienen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("I feel the wind...");
talkEntry:addResponse("Can you hear the wind?");
talkEntry:addResponse("#me closes her eyes for a moment.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Ich spüre den Wind...");
talkEntry:addResponse("Kannst du den Wind hören?");
talkEntry:addResponse("#me schließt für einen Moment ihre Augen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me breitet ihre Arme im Wind aus.", "#me stretches her arms to the wind.");
talkingNPC:addCycleText("#me lächelt.", "#me smiles.");
talkingNPC:addCycleText("#me schließt für einen Moment ihre Augen.", "#me closes her eyes for a moment.");
talkingNPC:addCycleText("Ich spüre den Wind...", "I feel the wind...");
talkingNPC:addCycleText("Kannst du den Wind hören?", "Can you hear the wind?");
talkingNPC:addCycleText("#me atmet tief ein.", "#me takes a deep breath.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(1);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Dieser NPC ist Fijanna Squall die Wahrsagerin.", "This NPC is Fijanna Squall the fortune teller.");
mainNPC:setUseMessage("Fasst mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut verwirrt.", "#me looks around confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 182);
mainNPC:setEquipment(11, 2421);
mainNPC:setEquipment(5, 0);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 2295);
mainNPC:setEquipment(9, 34);
mainNPC:setEquipment(10, 53);
mainNPC:setAutoIntroduceMode(true);

mainNPC:initDone();
end;

function receiveText(npcChar, texttype, message, speaker) mainNPC:receiveText(npcChar, texttype, speaker, message); end;
function nextCycle(npcChar) mainNPC:nextCycle(npcChar); end;
function lookAtNpc(npcChar, char, mode) mainNPC:lookAt(npcChar, char, mode); end;
function useNPC(npcChar, char) mainNPC:use(npcChar, char); end;
initNpc();
initNpc = nil;
-- END
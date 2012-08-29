--------------------------------------------------------------------------------
-- NPC Name: Morri                                                    Galmair --
-- NPC Job:  Trader                                                           --
--                                                                            --
-- NPC Race: dwarf                      NPC Position:  353, 254, 0            --
-- NPC Sex:  male                       NPC Direction: southeast              --
--                                                                            --
-- Author:   Rincewind                                                        --
--                                                                            --
-- Last parsing: August 18, 2012                          easyNPC Parser v1.2 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (1, 353, 254, 0, 3, 'Morri', 'npc.morri', 0, 0, 2, 22, 12, 34, 217, 154, 123);
---]]

require("npc.base.basic")
require("npc.base.condition.chance")
require("npc.base.condition.language")
require("npc.base.consequence.inform")
require("npc.base.talk")
module("npc.morri", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Morri the cook. Keywords: Fish, Nose, Snorri, Profession."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Morri der Koch. Schlüsselwörter: Fisch, Nase, Snorri, Beruf."));
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
talkEntry:addResponse("Hrm...Greetings. How can I help you?");
talkEntry:addResponse("#me grumbles moodily: 'Good day'.");
talkEntry:addResponse("Hail Irmorom. Do you want to buy something?");
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
talkEntry:addResponse("Hrm...Grüße. Wie kann ich Euch helfen?");
talkEntry:addResponse("#me brummt schlecht gelaunt: 'Guten Tag.'");
talkEntry:addResponse("Heil Irmorom. Wollt ihr was kaufen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hrm...Greetings. How can I help you?");
talkEntry:addResponse("#me grumbles moodily: 'Good day'.");
talkEntry:addResponse("Hail Irmorom. Do you want to buy something?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Hrm...Grüße. Wie kann ich Euch helfen?");
talkEntry:addResponse("#me brummt schlecht gelaunt: 'Guten Tag.'");
talkEntry:addResponse("Heil Irmorom. Wollt ihr was kaufen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Bye and enjoy your meal.");
talkEntry:addResponse("Arr... See you soon.");
talkEntry:addResponse("Fare thee well and come again soon!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Tschüss und guten Appetit.");
talkEntry:addResponse("Arr... Bis bald.");
talkEntry:addResponse("Gehabt Euch wohl und kommt wieder mal bei mir vorbei!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Bye and enjoy your meal.");
talkEntry:addResponse("Arr... See you soon.");
talkEntry:addResponse("Fare thee well and come again soon!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Tschüss und guten Appetit.");
talkEntry:addResponse("Arr... Bis bald.");
talkEntry:addResponse("Gehabt Euch wohl und kommt wieder mal bei mir vorbei!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("Arr, Snorri's fish stinks like it's a hundred years old! If only this wouldn't stink so bad!");
talkEntry:addResponse("What do you think? The fish stinks so bad that I can't breathe! I shouldn't have left Ironsiege...");
talkEntry:addResponse("Fish! Fish in the morning! Fish at lunch time! Fish in the evening! I cannot stand anymore fish. AND smelling! Irmorom be with me! Snorri's fish stinks to high heaven! Drhg'hgin!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befind");
talkEntry:addResponse("Arr, Snorris Fisch stinkt als wäre er vor hundert Jahren frisch gewesen! Wenn nur dieser Gestank nicht wäre!");
talkEntry:addResponse("Was glaubt ihr denn? Hier stinkt's nach Fisch, ich kann kaum Atmen! - Ich hätte Ironsiege nie verlassen sollen...");
talkEntry:addResponse("Fisch! Morgens, Fisch! Mittags, Fisch! Abends, Fisch! Ich kann schon keinen Fisch mehr sehn. UND riechen, Irmorom sei mit mir! Snorris Fisch stinkt zum Himmel! Drhg'hgin!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("I am Morri. And the one with the stinking fish next to me is Snorri my older brother.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Ich bin Morri. Und der, mit dem stinkenden Fisch, neben mir, ist Snorri, mein älterer Bruder.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I don't employ anyone. That is my brother Snorri's task, he is the older one of us. He's the one to ask.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Ich stelle niemanden ein. Das macht mein Bruder Snorri, er ist der Ältere von uns Beiden. Fragt ihn, darum.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addResponse("I don't employ anyone. That is my brother Snorri's task, he is the older one of us. He's the one to ask.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addResponse("Ich stelle niemanden ein. Das macht mein Bruder Snorri, er ist der Ältere von uns Beiden. Fragt ihn, darum.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("Actually, I am a cook. For a few years I have cooked at my cousin's tavern. But now I am dealing with all kinds of food here in Galmair. What is your daily task?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Eigentlich bin ich Koch. Hab einige Jahre groß und fein in meines Vettern Taverne gekocht. Nun handle ich mit allerlei Essbarem hier in Galmair. Was ist Euer Tagwerk?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Actually, I am a cook. For a few years I have cooked at my cousin's tavern. But now I am dealing with all kinds of food here in Galmair. What is your daily task?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Eigentlich bin ich Koch. Hab einige Jahre groß und fein in meines Vettern Taverne gekocht. Nun handle ich mit allerlei Essbarem hier in Galmair. Was ist Euer Tagwerk?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("There is nothing but bad news about Gobaith. What do you say to that?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Über Gobaith gibts immer nur schlechte Nachricht. Was habt ihr darüber zu sagen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("Well, what can I sell you?");
talkEntry:addResponse("Arr. Do you want to buy some food?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Is' recht. Was darf ich Euch verkaufen?");
talkEntry:addResponse("Arr. Wollt ihr Essen einkaufen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("fish");
talkEntry:addResponse("Yuck! Stop talking about fish! It stinks to high heaven, but Snorri cannot smell anything, because his nose is broken!");
talkEntry:addResponse("If this damn fish is fresh, I am a pignose. And do I look like a pignose? - No!");
talkEntry:addResponse("#me wrinkles his nose. 'Do you smell that? It's my brother's fish. But he believes it smells like flowers, because his nose is broken'.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("snorri");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Arr... You are probably thinking I don't like my brother. But you are wrong in this case. He is my dearest one. The point is that I don't like his fish.");
talkEntry:addResponse("Snorri took me on a long journey some years ago. Away from Ironsiege. Mother cried like a child. Nevertheless she is very proud of us.");
talkEntry:addResponse("Do not underrate Snorri. He is a serious competitor where business is concerned. He even defied the Don in negotiations. Aye!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("brother");
talkEntry:addResponse("Arr... You are probably thinking I don't like my brother. But you are wrong in this case. He is my dearest one. The point is that I don't like his fish.");
talkEntry:addResponse("Snorri took me on a long journey some years ago. Away from Ironsiege. Mother cried like a child. Nevertheless she is very proud of us.");
talkEntry:addResponse("Do not underrate Snorri. He is a serious competitor where business is concerned. He even defied the Don in negotiations. Aye!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("orc");
talkEntry:addResponse("Arr. Those greennoses are annyoing. - Every last one of them. Actually, we merchants have to stick together. It is all about business!");
talkEntry:addResponse("These orcs are smarter than you think. Particularly Krudash! But Sogg, I haven't ever seen him sober.");
talkEntry:addResponse("Arrr.... I don't know. I think it looks like the entire orc pack here in Galmair belongs to the same clan. But on the other hand,well... I don't know whether that's important.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dwarf");
talkEntry:addResponse("What is important to a dwarf? Gold, business and sin-...no. Relatives. Therefore, the clan.");
talkEntry:addResponse("What does a dwarf like? His craft, his wife and his beer.");
talkEntry:addResponse("We dwarves are a proud folk. I have to warn you, never insult a dwarf! He will remember even after his sons have grown up.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("nose");
talkEntry:addResponse("Arr, Snorris nose! He broke his nose when we were coming home from the tavern. Although he thinks it was an ogre, honestly, he ran into a pillar. His nose is broken now and he has serious problems being able to smell.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("fisch");
talkEntry:addResponse("J'uk! Hört mir auf mit dem Fisch! Der stinkt zum Himmel, aber Snorri kann nichts reichen, weil seine Nase hin ist!");
talkEntry:addResponse("Wenn der verdammte Fisch frisch ist, dann bin ich eine Schweineschnauze. Und, seh ich aus wie eine Schweineschnauze? - Nein!");
talkEntry:addResponse("#me rümpft seine Nase. 'Riecht ihr das? Das ist der Fisch, den mein Bruder verkauft. Aber der glaubt es riecht hier nach Blumen, weil seine Nase kaputt ist.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("snorri");
talkEntry:addResponse("Arr... vielleicht denkt ihr ich mag meinen großen Bruder nicht ausstehen. Aber da irrt ihr. Er ist mir der Liebste. Nur eben diese Sache mit dem Fisch passt mir nicht.");
talkEntry:addResponse("Snorri nahm mich vor einigen Jahren mit auf große Fahrt. Raus aus Ironsiege, Mutter hat gehäult wie ein Gletscherbach. Aber sicher ist sie trozdem sehr, sehr Stolz auf uns.");
talkEntry:addResponse("Unterschätzt mir Snorri nicht. Wenn's ums Geschäft geht ist er hammerhart. Sogar den Don hat er beim Verhandeln die Stirn geboten. Aye!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("bruder");
talkEntry:addResponse("Arr... vielleicht denkt ihr ich mag meinen großen Bruder nicht ausstehen. Aber da irrt ihr. Er ist mir der Liebste. Nur eben diese Sache mit dem Fisch passt mir nicht.");
talkEntry:addResponse("Snorri nahm mich vor einigen Jahren mit auf große Fahrt. Raus aus Ironsiege, Mutter hat gehäult wie ein Gletscherbach. Aber sicher ist sie trozdem sehr, sehr Stolz auf uns.");
talkEntry:addResponse("Unterschätzt mir Snorri nicht. Wenn's ums Geschäft geht ist er hammerhart. Sogar dem Don hat er beim Verhandeln die Stirn geboten. Aye!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ork");
talkEntry:addResponse("Arr. Die Grünschnauzen sind ein Ärgernis. - Nicht's weiter. Im Grunde müssen wir Händler zusammen stehen. Es geht ums Geschäft, das ist was zählt!");
talkEntry:addResponse("Diese Orks sind klüger als Ihr denkt. Im besonderen diese Krudash! Aber dieser Sogg, den hab ich noch nie nüchtern gesehen...");
talkEntry:addResponse("Arrr... ich weiß nicht. Aber für mich sieht's so aus als wären die alle, die Ganze Orkmeute in Galmair von der selben Sippe. Andererseits muss das bei Orks ja auch nichts heißen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("zwerg");
talkEntry:addResponse("Was ist einem Zwerg von Wert? Gold, Geschäfte und Ge-...nein. Verwandte. Also sprich, der Klan.");
talkEntry:addResponse("Was darf ein Zwerg lieben? Sein Handwerk, seine Frau und Bier.");
talkEntry:addResponse("Wir Zwerge sind ein stolzes Folk. Ich will euch warnen, beleidigt ihr einen Zwerg wird er sich noch daran erinnern wenn Eure Söhne erwachsen sind.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("nase");
talkEntry:addResponse("Arr, Snorris Nase! Er hat sie sich eingeschlagen, als wir vom Wirt kamen. Obwohl er meint es wäre ein Oger gewesen, so ist es wahr, dass er gegen eine Säule gelaufen ist. Jetzt ist die Nase hinüber und er kann nicht mehr anständig riechen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addResponse("Ha-ha! I've heard that archmage wears women's clothes! Wool under the chain mail undies and so on! *laughs*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Ha-h! Man sagt sich bei uns Zwergen dieser Erzmagier trägt Weiber-Gewand! Wolle unterm Kettenhemd und so nen Kram! *lacht*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Ha-ha! I've heard that archmage wears women's clothes! Wool under the chain mail undies and so on! *laughs*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Ha-h! Man sagt sich bei uns Zwergen dieser Erzmagier trägt Weiber-Gewand! Wolle unterm Kettenhemd und so nen Kram! *lacht*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Runewick? Aren't those the farmers who bungle with magic? They should cultivate bigger tomatoes instead. That is more useful.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Runewick? Sind das nicht diese Bauern, die glauben mit Magie herum murksen zu müssen?. Die sollten lieber größere Tomaten züchten. Damit wäre allen geholfen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Don Guilianni is a nasty fellow. We merchants cut our deals with him carefully.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Don Guilianni ist ein abgebrühter Geschäftsmann. Und wir Händler versuchen uns so gut es geht mit ihm zu arrangieren.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I want to say, my brother and I could not find a better place than this except for all the riff-raff. Well, and the buildings are falling down, but the business is great.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Ich möchte sagen, an einen besseren Ort hätte es mich und meinen Bruder nicht verschlagen können. Nun gut, hier treibt sich einiges Gesindel herum, und die Mauern sehen ziemlich zerbrechlich aus, aber das Geschäft geht ausgezeichnet!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Queen");
talkEntry:addResponse("Blue blood! Pah! - Bring the human royalty under my axe and I'll show you how blue it is. I tell you, they die just like anyone else! I have seen too many fools on the throne!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königin");
talkEntry:addResponse("Blaues Blut! Pha! - Bringt mir diese Könige der Menschen vor meine Axt und ich demonstriere Euch wie blau es ist. Ich sage Euch, beim sterben ist jeder der Erste! Zu viele Narren hab ich auf dem Thron gesehn!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Blue blood! Pah! - Bring the human royalty under my axe and I'll show you how blue it is. I tell you, they die just like anyone else! I have seen too many fools on the throne!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Blaues Blut! Pha! - Bringt mir diese Könige der Menschen vor meine Axt und ich demonstriere Euch wie blau es ist. Ich sage Euch, beim sterben ist jeder der Erste! Zu viele Narren hab ich auf dem Thron gesehn!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("They give their wealth and belongings to the dead in Cadomyr. Bury their gold in their crypts! Every dwarf knows that gold is an element for the living. How is it of any use to the dead?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Cadomyrs Reichtum geben sie den Toten. Vergraben das Gold in den Krypten! Jeder Zwerg weiß natürlich, das Gold das Element der Lebenden ist. Wie sollte es den verstorbenen schon von Nutzen sein?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Albar! A terrible county. Ruled by jesters. The people are weak and their kings treat them like livestock.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("Albar! Ein schreckliches Land. Regiert von Narren. Das Volk ist schwach, es ist den Königen kaum mehr wert als die Schweine die sie fressen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Gynk! Everyone meets there. What a market! You can find anything there! If only dwarves would not waste their money on drinks and games... *sighs*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("Gynk! Hier trifft sich alles Volk, das der Sprache mächtig ist. Sicher, da kann viel passieren, aber einen Markt gibt es dort! Würden die Zwerge dort nicht alles Geld versaufen und verspielen... *seufzt*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Salkamar? In Salkamar 4 out of 5 people claim to be smarter than everyone else. Smart, isn't it? *laughs*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Salkamar? In Salkamar behaupten 4 von 5 Leuten, sie sind klüger als der durchschnittliche Bürger. Clever nicht war? *lacht*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ironsiege");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Listen to me, Ironsiege is an impregnable fortress. Saying the gates in the mountain are 'impressive' is an understatement. They are gigantic!");
talkEntry:addResponse("Well, you can find mainly three clans in Ironsiege. The Goldaxeclan, the Ironaxeclan, and last but not least my clan. The Flinthammer! Arr!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ironsiege");
talkEntry:addResponse("Last Euch sagen, Ironsiege ist eine uneinnehmbare Festung. Allein die Tore im Berg als 'imposant' zu bezeichnen reicht nicht aus. So gigantisch, erscheinen sie.");
talkEntry:addResponse("Nun, in Ironsiege findet ihr hauptsächlich drei Klans. Den Goldaxtklan, den Eisenherzklan und zu guter letzt meinen Klan. Die Flinthämmer! Arr!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("Listen to me, Irmorom created the dwarves out of a rock. He got this rock as a gift from Ushara. I don't want to know more about gods. Except...well, Adron should be praised for cheese and beer!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Last Euch sagen, Irmorom schuf einst die Zwerge aus einem Stück Felsen. Jenen hatte er von Ushara zum Geschenk bekommen. Und viel mehr möchte ich von den Göttern nicht wissen müssen. Außer...nun ja Adron sei's gedankt für Käse und Bier!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Adron");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Toast! Toast to Adron. Praised be his beer and cheese.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Adron");
talkEntry:addResponse("Trinkt! Trinken wir auf Adron. Gepriesen sein Bier und Käse.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hail Irmorom. Protect my brother and his clan. Be praised, the creator of the dwarfs.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("Heil Irmorom. Schütze meinen Bruder und unseren Klan. Gedankt sei dir, denn du bist der Zwergen Schöpfer.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ushara");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Honor to you, mother of the rock, stone and soil.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("Ehre dir, Mutter der Felsen, Steine und Erde.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("I am selling different meals. And as opposed to my brother's fish, it is actually fresh. My nose is still working.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Ich verkaufe verschiedenstes Essen. Und im Gegensatz zu den Fischen meines Bruders ist es tatsächlich frisch. Meine Nase ist nämlich noch in Ordnung.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("I would give half of everything I own, if Snorri would fix his broken nose. But he is too stubborn. On the other hand, I cannot find someone to help with this.");
talkEntry:addResponse("Snorri is a brave dwarf. I know, he is impatient to prove himself in a fight, but we are up to our ears with work, so I can afford to hire a mercenary soldier.");
talkEntry:addResponse("I have said to Snorri, he should become a stonecutter. But he is the older one and he has to decide for himself. - I wish he had become a stonecutter.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Ich würde mein halbes Vermögen geben, damit Snorri seine kaputte Nase richten lässt. Aber er ist eben ein Sturkopf. Auf der anderen Seite finde ich auch kaum einen Heiler der sich damit auskennt.");
talkEntry:addResponse("Snorri ist ein tapferer Zwerg. Ich weiß, er brennt darauf sich im Kampf zu beweißen, aber mit diesem Marktstand haben wir zu viel um die Ohren, als das wir als Söldner anheuern könnten.");
talkEntry:addResponse("Ich hab Snorri gesagt, er soll Steinmetz werden. Aber er ist der Ältere also muss er das entscheiden. - Ich wünschte er wäre Steinmetz geworden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("morri");
talkEntry:addResponse("Arr. Bura'zak-ka! - Welches Essen wollt Ihr mir abkaufen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("morri");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Arr. Bura'zak-ka! - What meal would you like to buy?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("Arr. It's good.");
talkEntry:addResponse("D'kraga...so, and not otherwise!");
talkEntry:addResponse("It should be fine by me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("Arr. Ist gut!");
talkEntry:addResponse("D'kraga... so, und nicht anders!");
talkEntry:addResponse("Mir soll's auch recht sein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("Hrm, is this your last word?.");
talkEntry:addResponse("Arr. If that's what you want..");
talkEntry:addResponse("Of course.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("Hrm, ist das Euer letztes Wort?");
talkEntry:addResponse("Arr. Wenn Ihr's so wollt.");
talkEntry:addResponse("Natürlich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addResponse("Arr.");
talkEntry:addResponse("#me wrinkles his nose and shows his tongue in disgust: 'Do you smell that too?'");
talkEntry:addResponse("#me turns around suddenly and grumbles: 'Snorri! Listen - the fish stinks like the breath of death'.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addResponse("Arr.");
talkEntry:addResponse("#me rümpft die Nase und streckt angewidert die Zunge heraus: 'Riecht ihr das auch?'");
talkEntry:addResponse("#me dreht sich plötzlich um und grummelt: 'Snorri! Hör mir zu - der Fisch stinkt wie das Maul der Fischgesichter!");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me brummt schlecht gelaunt und wirft einen missmutigen Blick auf die Straße.", "#me grumbles moodily and looks at the street with a discontented glance.");
talkingNPC:addCycleText("Dein Fisch stinkt, Snorri.", "Your fish smells, Snorri.");
talkingNPC:addCycleText("#me knurrt kopfschüttelnd: 'Dieser Fisch ist niemals frisch...'", "#me grumbles and shakes his head: 'This fish is not fresh...'");
talkingNPC:addCycleText("#me rümpft die Nase.", "#me wrinkles his nose.");
talkingNPC:addCycleText("#me hält sich die Nase zu und streckt die Zunge heraus: 'Igittigitt!'", "#me covers his nose and shows his tongue: 'Igittigitt!'");
talkingNPC:addCycleText("#me bückt sich und hebt einen muffigen Fisch auf. Er kneift ein Auge zusammen und wirft ihn an Snorris Hinterkopf.", "#me bends down and lifts a smelly fish. He pinches his eyes and throws it at the back of Snorri's head.");
talkingNPC:addCycleText("Irmorom, mach das der Sturkopf es einsieht! Der Fisch stinkt so sehr, ich fürchte der Berg könnte uns auf den Kopf fallen.", "Imrorom, don't let him be that stubborn. His fish stinks so much that I fear the mountain will crumble onto our heads.");
talkingNPC:addCycleText("#me fasst sich mit einer verzweifelt wirkenden Geste, beidhändig in den langen schwarzen Bart und zieht daran. Dabei gibt er ein lautes Grunzen von sich.", "#me pulls his long black beard with both hands despairingly and grunts loudly.");
talkingNPC:addCycleText("#me murmelt verärgert: 'Der Gestank vertreibt mir noch die Kunden...'", "#me mumbles in annoyance: 'This stink scares away my customers.");
talkingNPC:addCycleText("Essen! Feinste Gerichte aller Art! Tretet näher und deckt Euch ein!", "Food! Finest dishes of every kind! Come closer and buy ahead!");
talkingNPC:addCycleText("Frisches Brot! Schmackhafte Kuchen! Unverwüstliche Kekse!", "Fresh bread! Tasty cakes! Inedible cookies!");
talkingNPC:addCycleText("Wurst mit Zwiebeln, Kohlsuppe, Hasenbraten! Bei mir könnt ihr alles kaufen!", "Sausages with onion, cabbage soup, rabbit dishes! You find everything here!");
mainNPC:addLanguage(0);
mainNPC:addLanguage(2);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Ein grimmiger Zwerg mit einem prächtigen schwarzen Bart und einem kahlem Kopf.", "A serious looking dwarf with an impressive black beard and a bald head.");
mainNPC:setUseMessage("Fasst mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut verwirrt.", "#me looks around confused.");
mainNPC:setEquipment(3, 101);
mainNPC:setEquipment(9, 2111);
mainNPC:setEquipment(10, 53);
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
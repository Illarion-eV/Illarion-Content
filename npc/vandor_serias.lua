--------------------------------------------------------------------------------
-- NPC Name: Vandor Serias                                               None --
-- NPC Job:  none                                                             --
--                                                                            --
-- NPC Race: human                      NPC Position:  0, 0, 0                --
-- NPC Sex:  male                       NPC Direction: west                   --
--                                                                            --
-- Author:   not set                                                          --
--                                                                            --
-- Last parsing: August 09, 2010                         easyNPC Parser v1.00 --
--------------------------------------------------------------------------------

require("npc.base.basic")
require("npc.base.condition.item")
require("npc.base.condition.language")
require("npc.base.condition.state")
require("npc.base.consequence.item")
require("npc.base.consequence.state")
require("npc.base.talk")
module("npc.vandor_serias", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("gr[üu][sß]");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("grue[sß]");
talkEntry:addCondition(npc.base.condition.state.state("=", 0));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Grüße, mein Freund. Wenn du etwas übers Glasblasen lernen willst, bist du bei mir genau richtig.");
talkEntry:addResponse("Seid gegrüßt. Wenn du etwas übers Glasblasen lernen willst, bist du bei mir genau richtig.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hello");
talkEntry:addTrigger("greet");
talkEntry:addTrigger("hey");
talkEntry:addCondition(npc.base.condition.state.state("=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Greetings, my friend. If you want to learn something about glass blowing, then I am the right man.");
talkEntry:addResponse("Be greeted. If you want to learn something about glass blowing, then I am the right man.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("gr[üu][sß]");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("grue[sß]");
talkEntry:addCondition(npc.base.condition.state.state(">", 0));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Grüße, mein Freund. Wo waren wir gerade...?");
talkEntry:addResponse("Sei gegrüßt. Wo waren wir gerade...?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hello");
talkEntry:addTrigger("greet");
talkEntry:addTrigger("hey");
talkEntry:addCondition(npc.base.condition.state.state(">", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Greetings, my friend. Where were we...?");
talkEntry:addResponse("Be greeted. Where were we...?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein name ist");
talkEntry:addTrigger("ich bin");
talkEntry:addResponse("Freut mich euch kennen zulernen. Ich bin %NPCNAME.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name is");
talkEntry:addTrigger("i am");
talkEntry:addTrigger("i'm");
talkEntry:addResponse("Nice to meet you. I am %NPCNAME.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("wie ist dein name");
talkEntry:addTrigger("wie ist euer name");
talkEntry:addTrigger("wie hei[sß]t");
talkEntry:addResponse("Ich bin der Glasbläser %NPCNAME.");
talkEntry:addResponse("Ich heiße %NPCNAME.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what is your name");
talkEntry:addTrigger("what's your name");
talkEntry:addTrigger("who are you");
talkEntry:addResponse("I am the glassblower %NPCNAME.");
talkEntry:addResponse("I am %NPCNAME.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dein beruf");
talkEntry:addTrigger("deine aufgabe");
talkEntry:addTrigger("euer beruf");
talkEntry:addTrigger("eure aufgabe");
talkEntry:addTrigger("was machst du");
talkEntry:addTrigger("was tust du");
talkEntry:addResponse("Ich bin Glasbläser.");
talkEntry:addResponse("Ich fertige Flaschen an.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your job");
talkEntry:addTrigger("what do you do");
talkEntry:addTrigger("your profession");
talkEntry:addTrigger("what are you doing");
talkEntry:addResponse("I am a glassblower.");
talkEntry:addResponse("I make bottels.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addResponse("Ich verkaufe nichts. Aber ich kann dir das Glasblasen beibringen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was kauf");
talkEntry:addResponse("Ich kaufe nichts. Aber ich kann dir das Glasblasen beibringen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addResponse("I sell nothing. But I can teach you how to make glass.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("What buy");
talkEntry:addResponse("I buy nothing. But I can teach you how to make glass.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("bye");
talkEntry:addTrigger("farewell");
talkEntry:addTrigger("be well");
talkEntry:addResponse("Be well.");
talkEntry:addResponse("Farewell.");
talkEntry:addResponse("Good bye.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("auf bald");
talkEntry:addTrigger("bis bald");
talkEntry:addTrigger("leb wohl");
talkEntry:addTrigger("tsch[üu][ßs]");
talkEntry:addTrigger("mach gut");
talkEntry:addResponse("Auf bald.");
talkEntry:addResponse("Bis bald.");
talkEntry:addResponse("Lebt wohl.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("glasbläserei");
talkEntry:addTrigger("glas blasen");
talkEntry:addTrigger("glasblasen");
talkEntry:addResponse("Oh ja, damit kenn' ich mich aus. Soll ich dich in die Kunst des Glasblasens einweihen?");
talkEntry:addResponse("Ich kann dir das Glasblasen beibringen. Möchtest du das?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("bei bringen");
talkEntry:addTrigger("beibringen");
talkEntry:addTrigger("zeigen");
talkEntry:addTrigger("lern");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Ich kann dir das Glasblasen beibringen. Möchtest du das?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("aufgaube");
talkEntry:addTrigger("quest");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Eine Aufgaube für dich habe ich nicht, doch kann ich dir das Glasblasen zeigen. Willst du das?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("glass blow");
talkEntry:addTrigger("glassblow");
talkEntry:addResponse("Oh yes, glassblowing is my business. Shall I show you how to do it?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("teach");
talkEntry:addTrigger("show");
talkEntry:addTrigger("learn");
talkEntry:addResponse("Do you want me to teach you how to blow glass?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mission");
talkEntry:addTrigger("task");
talkEntry:addTrigger("quest");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I have no task for you, but I can show you how to blow glass. Do you want it?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("nein");
talkEntry:addTrigger("nicht");
talkEntry:addCondition(npc.base.condition.state.state("=", 1));
talkEntry:addResponse("Nagut, dann komm einfach wieder, wenn du es willst.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("no");
talkEntry:addCondition(npc.base.condition.state.state("=", 1));
talkEntry:addResponse("Well, then come back when you want to learn it.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ja");
talkEntry:addCondition(npc.base.condition.state.state("=", 1));
talkEntry:addResponse("Dann gebe ich dir erstmal alles was du brauchst. Packe den Sand und die Pottasche in deinen Gürtel und halte das Glasblasrohr in der Hand. Nun gehe zum Glasschmelzofen und 'benutze' ihn, um Glasblöcke herzustellen. Komm wieder, wenn du mindestens einen Glasblock hast.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 2));
talkEntry:addConsequence(npc.base.consequence.item.item(316, 10, 333, 0));
talkEntry:addConsequence(npc.base.consequence.item.item(314, 10, 333, 0));
talkEntry:addConsequence(npc.base.consequence.item.item(311, 1, 999, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("yes");
talkEntry:addCondition(npc.base.condition.state.state("=", 1));
talkEntry:addResponse("Then I will give you everything you need. Put the sand and the pott ash in the belt and hold the glass blow pipe in your hand. Then go to the glass melting oven and 'use' it in order to make glass ingots. Come again, when you have at least one ingot.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 2));
talkEntry:addConsequence(npc.base.consequence.item.item(316, 10, 333, 0));
talkEntry:addConsequence(npc.base.consequence.item.item(314, 10, 333, 0));
talkEntry:addConsequence(npc.base.consequence.item.item(311, 1, 999, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("asche");
talkEntry:addCondition(npc.base.condition.state.state(">", 1));
talkEntry:addCondition(npc.base.condition.item.item(314, "all", "=", 0));
talkEntry:addResponse("Du hast ja gar keine Pottasche mehr! Na dann, hier hast du noch welche.");
talkEntry:addConsequence(npc.base.consequence.item.item(314, 5, 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ash");
talkEntry:addCondition(npc.base.condition.state.state(">", 1));
talkEntry:addCondition(npc.base.condition.item.item(314, "all", "=", 0));
talkEntry:addResponse("You don't have any ash any more! Well then, here is some more.");
talkEntry:addConsequence(npc.base.consequence.item.item(314, 5, 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("sand");
talkEntry:addCondition(npc.base.condition.state.state(">", 1));
talkEntry:addCondition(npc.base.condition.item.item(316, "all", "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Du hast ja gar keinen Sand mehr! Na dann, hier hast du noch welchen.");
talkEntry:addConsequence(npc.base.consequence.item.item(316, 5, 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("sand");
talkEntry:addCondition(npc.base.condition.state.state(">", 1));
talkEntry:addCondition(npc.base.condition.item.item(314, "all", "=", 0));
talkEntry:addResponse("You don't have any sand any more! Well then, here is some more.");
talkEntry:addConsequence(npc.base.consequence.item.item(316, 5, 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rohr");
talkEntry:addCondition(npc.base.condition.state.state(">", 1));
talkEntry:addCondition(npc.base.condition.item.item(311, "all", "=", 0));
talkEntry:addResponse("Du hast ja gar kein Glasblasrohr mehr! Na dann, hier hast du noch eines.");
talkEntry:addConsequence(npc.base.consequence.item.item(311, 1, 999, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("pipe");
talkEntry:addCondition(npc.base.condition.state.state(">", 1));
talkEntry:addCondition(npc.base.condition.item.item(311, "all", "=", 0));
talkEntry:addResponse("You don't have a glass blowing pipe any more! Well then, here is one more.");
talkEntry:addConsequence(npc.base.consequence.item.item(311, 1, 999, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("bl[öo]ck");
talkEntry:addTrigger("bloeck");
talkEntry:addCondition(npc.base.condition.state.state(">", 2));
talkEntry:addCondition(npc.base.condition.item.item(41, "all", "=", 0));
talkEntry:addResponse("Du hast ja gar keinen Glasblock mehr! Na dann, hier hast du noch welche.");
talkEntry:addConsequence(npc.base.consequence.item.item(41, 5, 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ingot");
talkEntry:addCondition(npc.base.condition.state.state(">", 2));
talkEntry:addCondition(npc.base.condition.item.item(41, "all", "=", 0));
talkEntry:addResponse("You don't have any glass ingots any more! Well then, here are some more.");
talkEntry:addConsequence(npc.base.consequence.item.item(41, 5, 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("bl[öo]ck");
talkEntry:addTrigger("bloeck");
talkEntry:addCondition(npc.base.condition.state.state(">", 2));
talkEntry:addResponse("Glasblöcke sind die Grundlage für das Glasblasen. Du brauchst nur Pottasche, Sand und einen Glasschmelzofen, um welche herzustellen. Falls du aber keine mehr hast und weitermachen willst, kann ich dir welche geben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ingot");
talkEntry:addCondition(npc.base.condition.state.state(">", 2));
talkEntry:addResponse("Glass ingots are a necessity for glass blowing. You just need pott ash, sand and a glass melting oven to produce them. If you have no ingots any more and you want to continue, I can give you a couple.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("asche");
talkEntry:addResponse("Pottasche bleibt nach einem Feuer übrig, wenn es ausgebrannt ist. Aber lösch es nicht mit Wasser, denn dann gibt's auch keine Pottasche!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ash");
talkEntry:addResponse("When a fire has burnt out, you can find pott ash as leftover. But don't extinguish it with water, because you won't get any pott ash this way!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("sand");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Ich denke, man muss in der Wüste nach groben Sand graben und diesen dann sieben, um den Sand zu erhalten, den wir zum Glasblasen brauchen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("sand");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I think one has to dig in the desert for coarse sand and then sieve it in order to get the sand we need for glass blowing.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("bl[öo]ck");
talkEntry:addTrigger("bloeck");
talkEntry:addResponse("Glasblöcke sind die Grundlage für das Glasblasen. Du brauchst nur Pottasche, Sand, ein Glasblasrohr und einen Glasschmelzofen, um welche herzustellen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ingot");
talkEntry:addResponse("Glass ingots are a necessity for glass blowing. You just need pott ash, sand, a glass blowing pipe and a glass melting oven to produce them.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rohr");
talkEntry:addResponse("Man braucht ein Glasblasrohr, um Glasblöcke und schließlich alle Glaswaren herzustellen. Ein guter Schmied kann wohl ein Glasblasrohr anfertigen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("pipe");
talkEntry:addResponse("One needs a glass blowing pipe in order to produce glass ingots and finally glass goods. A good smith an surely make a glass blowing pipe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ofen");
talkEntry:addResponse("Für jeden Schritt braucht man einen Glasschmelzofen. Das ist das große Teil aus Ziegeln da drüben. Jede größere Stadt hat einen. Aber ich hab gleich zwei auf einmal!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("oven");
talkEntry:addResponse("For each step one needs a glass melting oven. It is this huge thing over there made of bricks. Every major town has one. But I have two at once!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.state.state("=", 1));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Ich habe gefragt, ob ich dir das Glasblasen beibringen soll. Ja oder nein?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.state.state("=", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I've asked if I shall teach you how to make glass. Yes or no?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.state.state("=", 2));
talkEntry:addCondition(npc.base.condition.item.item(41, "all", ">", 0));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Du hast es hinbekommen, sehr gut. Dann gehen wir einen Schritt weiter. Lass das Glasblasrohr in der Hand, die Glasblöcke bleiben am Gürtel. Gehe wieder zum Glasschmelzofen und 'benutze' diesmal das Glasblasrohr und wähle dann die kleine leere Flasche, um diese herzustellen. Komm wieder, wenn du mindestens eine kleine leere Flasche hast.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.state.state("=", 2));
talkEntry:addCondition(npc.base.condition.item.item(41, "all", ">", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("You did it, very good. Now we come to the next step. Keep the glass blowing pipe in your hand and the glass ingots at your belt. Now go back to the glass melting oven and 'use' the glass blow pipe and then choose the small empty bottle in order to produce it. Come again when you have at least one small empty bottle.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.state.state("=", 2));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Packe den Sand und die Pottasche in deinen Gürtel und halte das Glasblasrohr in deiner Hand. Nun gehe zum Glasschmelzofen und 'benutze' ihn, um Glasblöcke herzustellen. Komm wieder, wenn du mindestens einen Glasblock hast.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.state.state("=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Put the sand and the pott ash in the belt and hold the glass blow pipe in your hand. Then go to the glass melting oven and 'use' it in order to make glass ingots. Come again, when you have at least one ingot.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.state.state("=", 3));
talkEntry:addCondition(npc.base.condition.item.item(1317, "all", ">", 0));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Du hast es hinbekommen, wunderbar! Mehr brauchst du auch nicht zu wissen, der Rest kommt mit der Übung. Viel Glück und auf bald!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.state.state("=", 3));
talkEntry:addCondition(npc.base.condition.item.item(1317, "all", ">", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("You did it, great! I can't teach you anything anymore, you will learn the rest by practising. Good luck and farewell!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.state.state("=", 3));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Lass das Glasblasrohr in der Hand, die Glasblöcke bleiben am Gürtel. Gehe wieder zum Glasschmelzofen und 'benutze' diesmal das Glasblasrohr und wähle dann die kleine leere Flasche, um diese herzustellen. Komm wieder, wenn du mindestens eine kleine leere Flasche hast.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.state.state("=", 3));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Keep the glass blowing pipe in your hand and the glass ingots at your belt. Now go back to the glass melting oven and 'use' the glass blow pipe and then choose the small empty bottle in order to produce it. Come again when you have at least one small empty bottle.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me dreht ein Glasblasrohr in seiner rechten Hand.", "#me turns a glass blow pipe in his right hand.");
talkingNPC:addCycleText("#me betrachtet eine Flasche in seinen Händen: 'Schönes und klares Glas. So soll es sein!'", "#me examines a bottle in his hands: 'Nice and clear glass. This is how it should be!'");
mainNPC:addLanguage(0);
mainNPC:addLanguage(1);
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
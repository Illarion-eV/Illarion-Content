--------------------------------------------------------------------------------
-- NPC Name: Percy Dryless                                               None --
-- NPC Job:  none                                                             --
--                                                                            --
-- NPC Race: human                      NPC Position:  -495, -484, -40        --
-- NPC Sex:  male                       NPC Direction: south                  --
--                                                                            --
-- Author:   not set                                                          --
--                                                                            --
-- Last parsing: October 19, 2010                        easyNPC Parser v1.02 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (0, -495, -484, -40, 4, 'Percy Dryless', 'npc.percy_dryless', 0, 0, 0, 255, 255, 255, 255, 255, 255);
---]]

require("npc.base.basic")
require("npc.base.condition.attribute")
require("npc.base.condition.item")
require("npc.base.condition.language")
require("npc.base.condition.quest")
require("npc.base.consequence.item")
require("npc.base.talk")
module("npc.percy_dryless", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addResponse("[Game Help] This NPC is the prison guard Percy. Keyphrases: 'Release me, please','I am hungry' 'Give me a new pick axe' 'How high is my remaining punishment?' and 'I want to deliver <resource>'.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addResponse("[Spielhilfe] Dieser NPC ist der Gefängnisaufseher Percy. Schlüsselwörter: 'Lass mich bitte frei','Ich bin hungrig','Gib mir bitte eine neue Spitzhacke', 'Wie hoch ist meine übrige Strafe?' und 'Ich möchte <Ressource> abliefern.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hunger");
talkEntry:addCondition(npc.base.condition.attribute.attribute("foodlevel", ">", 14999));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("You don't look hungry to me. Work some more!");
talkEntry:addResponse("No food for lazy scum like you!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hunger");
talkEntry:addCondition(npc.base.condition.attribute.attribute("foodlevel", "<", 15000));
talkEntry:addCondition(npc.base.condition.item.item(49, "all", "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Here, have some moulded bread. Back to work!");
talkEntry:addConsequence(npc.base.consequence.item.item(49, 1, 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hunger");
talkEntry:addCondition(npc.base.condition.attribute.attribute("foodlevel", "<", 15000));
talkEntry:addCondition(npc.base.condition.item.item(49, "all", "~=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Thinking you can get free bread from me, eh? Work on or feel my whip.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hunger");
talkEntry:addCondition(npc.base.condition.attribute.attribute("foodlevel", ">", 14999));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Du siehst mir noch nicht hungrig genug aus. Arbeite weiter!");
talkEntry:addResponse("Kein Futter für faulen Abschaum wie dich!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hunger");
talkEntry:addCondition(npc.base.condition.attribute.attribute("foodlevel", "<", 15000));
talkEntry:addCondition(npc.base.condition.item.item(49, "all", "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hier etwas verschimmeltes Brot. Jetzt arbeite weiter!");
talkEntry:addConsequence(npc.base.consequence.item.item(49, 1, 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hunger");
talkEntry:addCondition(npc.base.condition.attribute.attribute("foodlevel", "<", 15000));
talkEntry:addCondition(npc.base.condition.item.item(49, "all", "~=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Du glaubst wohl, du bekommst noch mehr Brot, häh? Arbeite oder spüre meine Peitsche.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hungry");
talkEntry:addTrigger("food");
talkEntry:addCondition(npc.base.condition.attribute.attribute("foodlevel", ">", 14999));
talkEntry:addResponse("You don't look hungry to me. Work some more!");
talkEntry:addResponse("No food for lazy scum like you!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hungry");
talkEntry:addTrigger("food");
talkEntry:addCondition(npc.base.condition.attribute.attribute("foodlevel", "<", 15000));
talkEntry:addCondition(npc.base.condition.item.item(49, "all", "=", 0));
talkEntry:addResponse("Here, have some moulded bread. Back to work!");
talkEntry:addConsequence(npc.base.consequence.item.item(49, 1, 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hungry");
talkEntry:addTrigger("food");
talkEntry:addCondition(npc.base.condition.attribute.attribute("foodlevel", "<", 15000));
talkEntry:addCondition(npc.base.condition.item.item(49, "all", "~=", 0));
talkEntry:addResponse("Thinking you can get free bread from me, eh? Work on or feel my whip.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hungrig");
talkEntry:addTrigger("essen");
talkEntry:addCondition(npc.base.condition.attribute.attribute("foodlevel", ">", 14999));
talkEntry:addResponse("Du siehst mir noch nicht hungrig genug aus. Arbeite weiter!");
talkEntry:addResponse("Kein Futter für faulen Abschaum wie dich!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hungrig");
talkEntry:addTrigger("essen");
talkEntry:addCondition(npc.base.condition.attribute.attribute("foodlevel", "<", 15000));
talkEntry:addCondition(npc.base.condition.item.item(49, "all", "=", 0));
talkEntry:addResponse("Hier etwas verschimmeltes Brot. Jetzt arbeite weiter!");
talkEntry:addConsequence(npc.base.consequence.item.item(49, 1, 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hungrig");
talkEntry:addTrigger("essen");
talkEntry:addCondition(npc.base.condition.attribute.attribute("foodlevel", "<", 15000));
talkEntry:addCondition(npc.base.condition.item.item(49, "all", "~=", 0));
talkEntry:addResponse("Du glaubst wohl, du bekommst noch mehr Brot, häh? Arbeite oder spüre meine Peitsche.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("pick axe");
talkEntry:addTrigger("rock pick");
talkEntry:addTrigger("pick");
talkEntry:addCondition(npc.base.condition.item.item(2763, "all", "=", 0));
talkEntry:addResponse("So, you broke my pick? You lost it? Here, have this one, but pay more attention to it or I whip you.");
talkEntry:addConsequence(npc.base.consequence.item.item(2763, 1, 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("pick axe");
talkEntry:addTrigger("rock pick");
talkEntry:addTrigger("pick");
talkEntry:addCondition(npc.base.condition.item.item(2763, "all", "~=", 0));
talkEntry:addResponse("What do you want with two picks? Hitting stones bihanded?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("spitzhacke");
talkEntry:addTrigger("hacke");
talkEntry:addCondition(npc.base.condition.item.item(2763, "all", "~=", 0));
talkEntry:addResponse("Was willst du mit zwei Spitzhacken? Beidhändig auf die Steine eindreschen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("spitzhacke");
talkEntry:addTrigger("hacke");
talkEntry:addCondition(npc.base.condition.item.item(2763, "all", "=", 0));
talkEntry:addResponse("So, du hast also meine Spitzhacke kaputt gemacht? Du hast sie verloren? Hier, nimm diese, aber pass besser auf sie auf oder ich peitsche dich aus.");
talkEntry:addConsequence(npc.base.consequence.item.item(2763, 1, 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("remaining punishment");
talkEntry:addCondition(npc.base.condition.quest.quest(25, ">", 0));
talkEntry:addResponse("Pah! You still have to deliver %QUESTSTATUS shovels of resources.");
talkEntry:addResponse("Bring me %QUESTSTATUS resources and I'll release you. Maybe.");
talkEntry:addResponse("Mercy won't come before you bring me %QUESTSTATUS shovels of resources.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("remaining punishment");
talkEntry:addCondition(npc.base.condition.quest.quest(25, "<", 1));
talkEntry:addResponse("You are free to go, thug. Ask me to release you.");
talkEntry:addResponse("That was enough, I think I can release you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("übrige strafe");
talkEntry:addCondition(npc.base.condition.quest.quest(25, ">", 0));
talkEntry:addResponse("Pah! Du mußt mir noch %QUESTSTATUS Schaufeln voll Ressourcen bringen.");
talkEntry:addResponse("Bring mir noch %QUESTSTATUS Ressourcen und vielleicht lasse ich dich dann gehen.");
talkEntry:addResponse("Gnade wird nicht eher gewaltet bevor du mir nicht %QUESTSTATUS Schaufeln voll Ressourcen bringst.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("übrige strafe");
talkEntry:addCondition(npc.base.condition.quest.quest(25, "<", 1));
talkEntry:addResponse("Du kannst gehen, Gauner. Bitte mich darum, dich freizulassen.");
talkEntry:addResponse("Das reicht jetzt, ich denke, ich kann dich freilassen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hello");
talkEntry:addTrigger("Greetings");
talkEntry:addTrigger("Be greeted");
talkEntry:addTrigger("Hail");
talkEntry:addTrigger("Good day");
talkEntry:addTrigger("Good morning");
talkEntry:addTrigger("Good evening");
talkEntry:addResponse("What do you want? Ah, I know: You want to feel my whip!");
talkEntry:addResponse("Welcome to my realm, the realm of tears, sweat and hard work.");
talkEntry:addResponse("Work, scum! Criminals deserve nothing more than pain.");
talkEntry:addResponse("Tell me you are innocent and I will laugh for the rest of the day.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Grüße");
talkEntry:addTrigger("Gruß");
talkEntry:addTrigger("Seid gegrüßt");
talkEntry:addTrigger("Guten Tag");
talkEntry:addTrigger("Guten Abend");
talkEntry:addTrigger("Mahlzeit");
talkEntry:addTrigger("Tach");
talkEntry:addTrigger("Moin");
talkEntry:addResponse("Was ist? Ah, ich weiß: Du willst meine Peitsche zu spüren kriegen.");
talkEntry:addResponse("Willkommen in meinem Reich, dem Reich der Tränen, des Schweißes und der harten Arbeit.");
talkEntry:addResponse("Arbeite, Abschaum! Kriminelle verdienen nichts als Schmerz!");
talkEntry:addResponse("Sag mir jetzt noch, du bist unschuldig und ich lache für den Rest des Tages.");
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
talkEntry:addResponse("What do you want? Ah, I know: You want to feel my whip!");
talkEntry:addResponse("Welcome to my realm, the realm of tears, sweat and hard work.");
talkEntry:addResponse("Work, scum! Criminals deserve nothing more than pain.");
talkEntry:addResponse("Tell me you are innocent and I will laugh for the rest of the day.");
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
talkEntry:addResponse("Was ist? Ah, ich weiß: Du willst meine Peitsche zu spüren kriegen.");
talkEntry:addResponse("Willkommen in meinem Reich, dem Reich der Tränen, des Schweißes und der harten Arbeit.");
talkEntry:addResponse("Arbeite, Abschaum! Kriminelle verdienen nichts als Schmerz!");
talkEntry:addResponse("Sag mir jetzt noch, du bist unschuldig und ich lache für den Rest des Tages.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Good bye");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare thy well");
talkEntry:addResponse("I do not think you are leaving right now.");
talkEntry:addResponse("So you think you are leaving? Surprise! You aren't!");
talkEntry:addResponse("When you find the exit, send me a letter.");
talkEntry:addResponse("Did nobody tell you that you have to stay a bit longer...?");
talkEntry:addResponse("Nope. Work. Deliver things. Deliver even more things. Then you may get released. Or not.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehabt euch wohl");
talkEntry:addResponse("Ich glaube kaum, dass du jetzt gehst.");
talkEntry:addResponse("So, du glaubst also, du gehst jetzt? Überraschung! Du gehst nicht.");
talkEntry:addResponse("Wenn du den Ausgang findest, schick mir einen Brief.");
talkEntry:addResponse("Hat dir niemand gesagt, dass du für eine Weile hier bleibst?");
talkEntry:addResponse("Nö. Arbeite. Liefere Dinge ab. Liefere noch mehr Dinge ab. Dann wirst du vielleicht entlassen. Oder auch nicht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I do not think you are leaving right now.");
talkEntry:addResponse("So you think you are leaving? Surprise! You aren't!");
talkEntry:addResponse("When you find the exit, send me a letter.");
talkEntry:addResponse("Did nobody tell you that you have to stay a bit longer...?");
talkEntry:addResponse("Nope. Work. Deliver things. Deliver even more things. Then you may get released.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Ich glaube kaum, dass du jetzt gehst.");
talkEntry:addResponse("So, du glaubst also, du gehst jetzt? Überraschung! Du gehst nicht.");
talkEntry:addResponse("Wenn du den Ausgang findest, schick mir einen Brief.");
talkEntry:addResponse("Hat dir niemand gesagt, dass du für eine Weile hier bleibst?");
talkEntry:addResponse("Nö. Arbeite. Liefer Dinge ab. Liefere noch mehr Dinge ab. Dann wirst du vielleicht entlassen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("That is none of your business.");
talkEntry:addResponse("I would feel way better when you'd stop talking and went to work instead!");
talkEntry:addResponse("I feel like whipping you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addResponse("Das geht dich nichts an.");
talkEntry:addResponse("Es würde mir weit besser gehen wenn du die Klappe hieltest und arbeiten würdest.");
talkEntry:addResponse("Mir ist danach, dich auszupeitschen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("You can call me 'master'.");
talkEntry:addResponse("Percy Dryless. You will remember this name in your nightmares.");
talkEntry:addResponse("I have a name at least, your name will be forgotten when you are released... one distant day.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Du kannst mich 'Meister' nennen.");
talkEntry:addResponse("Percy Dryless. Du wirst diesen Namen in deinen Alpträumen schreien.");
talkEntry:addResponse("Wenigstens habe ich einen Namen, deinen wird man längst vergessen haben, wenn du entlassen wirst.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("What buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("I could sell you some hits of my whip. Interested!?");
talkEntry:addResponse("I trade pain.");
talkEntry:addResponse("Stop bartering and work or I will lose patience.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Ich kann dir ein paar Peitschenhiebe anbieten. Interesse?!");
talkEntry:addResponse("Ich handel mit Schmerzen.");
talkEntry:addResponse("Hör auf, rumzufeilschen und arbeite oder ich vergesse mich!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("#me points his finger at your face and laughs out loud.");
talkEntry:addResponse("Erm, no quest for you.");
talkEntry:addResponse("My quest is to whip those who are lazy.");
talkEntry:addResponse("Let me see... your quest is to work!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("#me zeigt mit dem Finger auf dich und lacht lauthals los.");
talkEntry:addResponse("Äh, keine Queste für dich.");
talkEntry:addResponse("Meine Bestimmung ist, die Faulen auszupeitschen.");
talkEntry:addResponse("Wart mal... deine Bestimmung ist es, zu arbeiten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addResponse("#me points his finger at your face and laughs out loud.");
talkEntry:addResponse("Erm, no quest for you.");
talkEntry:addResponse("My quest is to whip those who are lazy.");
talkEntry:addResponse("Let me see... your quest is to work!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addResponse("#me zeigt mit dem Finger auf dich und lacht lauthals los.");
talkEntry:addResponse("Äh, keine Queste für dich.");
talkEntry:addResponse("Meine Bestimmung ist, die Faulen auszupeitschen.");
talkEntry:addResponse("Wart mal... deine Bestimmung ist es, zu arbeiten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("Shut up and work!");
talkEntry:addResponse("No talking!");
talkEntry:addResponse("Shut up, swing the pick, you thug!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Halt deinen Mund und arbeite!");
talkEntry:addResponse("Hier wird nicht geplaudert!");
talkEntry:addResponse("Klappe halten, Hacke schwingen, du Gauner!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("innocent");
talkEntry:addResponse("One word: No.");
talkEntry:addResponse("You are as innocent as the chance of my whip missing your sorry ass.");
talkEntry:addResponse("Wake up! You aren't dreaming anymore.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("unschuldig");
talkEntry:addResponse("Ein Wort: Nein.");
talkEntry:addResponse("Die Chance, dass du unschuldig bist, ist so groß wie die, dass dich meine Peitsche verfehlt.");
talkEntry:addResponse("Aufwachen! Du träumst nicht mehr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("whip");
talkEntry:addResponse("I call my whip Susi.");
talkEntry:addResponse("This is my whip. There are many like it but this one is mine. My whip is my best friend. It is my life.");
talkEntry:addResponse("Wanna feel my whip, thug?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("peitsche");
talkEntry:addResponse("Ich nenne meine Peitsche Susi.");
talkEntry:addResponse("Dies ist meine Peitsche. Es gibt viele wie sie aber diese ist meine. Meine Peitsche ist mein bester Freund. Sie ist mein Leben.");
talkEntry:addResponse("Willst du meine Peitsche spüren, Gauner?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("criminal");
talkEntry:addTrigger("thug");
talkEntry:addResponse("You are as worthless as a cup of water in the ocean.");
talkEntry:addResponse("I will never understand why you people break the law.");
talkEntry:addResponse("Filthy bastard, good to see you here.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("krimineller");
talkEntry:addTrigger("gauner");
talkEntry:addResponse("Du bist so wertlos wie eine Tasse Wasser im Meer.");
talkEntry:addResponse("Ich werde nie verstehen, warum ihr Leute das Gesetz brecht.");
talkEntry:addResponse("Dreckiger Bastard, gut dass du hier bist.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("master");
talkEntry:addResponse("I am your master from now on. Obey or be whipped. Your choice.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("meister");
talkEntry:addResponse("Ich bin jetzt dein Herr und Meister. Gehorche oder werde ausgepeitscht. Du hast die Wahl.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("jingles");
talkEntry:addResponse("If I catch this stupid mouse, I will trample it!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("Yes? Fine, work on.");
talkEntry:addResponse("Yes? You wanted to say 'Yes master'!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("Ja? Gut. Arbeite weiter.");
talkEntry:addResponse("Ja? Das heißt 'Ja, Meister'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("No? You dare to disobey?");
talkEntry:addResponse("#me barks: 'I will teach you to say 'no'!'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("Nein? Wagst du etwa, zu widersprechen?");
talkEntry:addResponse("#me bellt: 'Ich werde dich lehren, 'Nein' zu sagen!'");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me knallt mit seiner Peitsche.", "#me cracks his whip.");
talkingNPC:addCycleText("Haut rein, alle, haut rein!", "Lets rock, everybody, lets rock.");
talkingNPC:addCycleText("Ich hab das genau gesehen!", "I saw that!");
talkingNPC:addCycleText("#me summt: 'Der Trauerkloß saß auf einem Felsblock, in der Ecke und weinte vor sich hin.'", "#me hums: 'The sad sack was sittin' on a block of stone, way over in the corner weepin' all alone'.");
talkingNPC:addCycleText("Arbeite!", "Work!");
talkingNPC:addCycleText("Schneller!", "Faster!");
talkingNPC:addCycleText("Gehorche!", "Obey!");
talkingNPC:addCycleText("Mwahaha!", "Mwahaha!");
talkingNPC:addCycleText("#me lacht dreckig.", "#me laughs diabolically.");
talkingNPC:addCycleText("Ruhe bei der Arbeit, Abschaum!", "Be quiet, scum!");
talkingNPC:addCycleText("Ich hab das gehört!", "I heard that!");
talkingNPC:addCycleText("#me tritt nach einer Maus.", "#me kicks at a mouse.");
talkingNPC:addCycleText("Gute Führung? Ich führe dich gleich an einer Schlinge, ist das gut genug?!", "Good conduct? I will teach you 'good conduct' with my whip!");
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
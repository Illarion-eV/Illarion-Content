--------------------------------------------------------------------------------
-- NPC Name: Queen Rosaline Edwards                                   Cadomyr --
-- NPC Job:  Regent                                                           --
--                                                                            --
-- NPC Race: human                      NPC Position:  122, 520, 0            --
-- NPC Sex:  female                     NPC Direction: south                  --
--                                                                            --
-- Authors:  Estralis Seborian                                                --
--           Nitram                                                           --
--                                                                            --
-- Last parsing: July 22, 2010                           easyNPC Parser v1.00 --
--------------------------------------------------------------------------------

require("npc.base.basic")
require("npc.base.condition.language")
require("npc.base.consequence.inform")
require("npc.base.talk")
module("npc.queen_rosaline_edwards", package.seeall)

scriptfound = true;

initstarted = false;
initdone = false;

calledNextCycle = false;
thisNPCNextCycle = false;
finishedNextCycle = false;

calledUseNPC = false;
thisNPCUseNPC = false;
finishedUseNPC = false;

calledReceiveText = false;
thisNPCReceiveText = false;
finishedReceivedText = false;

calledLookAt = false;
thisNPCLookAt = false;
finishedLookAt = false;


function initNpc()
initstarted = false;
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Queen Rosaline Edwards of Cadomyr. Keyphrases: Hail my queen, Cadomyr, enemies, Sir Reginald, tomb, grave."));
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Königin Rosaline Edwards von Cadomyr. Schlüsselwörter: Es lebe die Königin, Cadomyr, Feinde, Sir Reginald, Gruft, Grab."));
talkingNPC:addEntry(talkEntry);
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
talkEntry:addResponse("Speak, what do you want from your queen? Make it quick or I make it quick.");
talkEntry:addResponse("Ah, a servant of mine. Good, what news do you bear from my realm?");
talkEntry:addResponse("You dare to disturb me. Fine, I could not wait to get some distraction.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("GrüßŸe");
talkEntry:addTrigger("GrußŸ");
talkEntry:addTrigger("Seid gegrüßŸt");
talkEntry:addTrigger("Guten Tag");
talkEntry:addTrigger("Guten Abend");
talkEntry:addTrigger("Mahlzeit");
talkEntry:addTrigger("Tach");
talkEntry:addTrigger("Moin");
talkEntry:addResponse("Sagt, was wollt ihr von eurer Königin? Sprecht schnell oder ich werde euch Beine machen.");
talkEntry:addResponse("Ah, einer meiner Untertanen. Gut, was für Kunde bringt ihr aus meinem Reich?");
talkEntry:addResponse("Ihr wagt es, mich zu stören. Fein, ich kann etwas Abwechslung gut vertragen.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greebas");
talkEntry:addTrigger("Greebs");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Speak, what do you want from your queen? Make it quick or I make it quick.");
talkEntry:addResponse("Ah, a servant of mine. Good, what news do you bear from my realm?");
talkEntry:addResponse("You dare to disturb me. Fine, I could not wait to get some distraction.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greebas");
talkEntry:addTrigger("Greebs");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Sagt, was wollt ihr von eurer Königin? Sprecht schnell oder ich werde euch Beine machen.");
talkEntry:addResponse("Ah, einer meiner Untertanen. Gut, was für Kunde bringt ihr aus meinem Reich?");
talkEntry:addResponse("Ihr wagt es, mich zu stören. Fein, ich kann etwas Abwechslung gut vertragen.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Good bye");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare thy well");
talkEntry:addResponse("#me waves: 'Begone.'");
talkEntry:addResponse("Go with Malachin's blessings and do deeds to honour Cadomyr's name. And mine.");
talkEntry:addResponse("Off, off, and serve me every minute of your life how I serve Cadomyr.");
talkEntry:addResponse("Farewell, spread word about the marvellous kingdom of Cadomyr on your travels.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("TschüßŸ");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehabt euch wohl");
talkEntry:addResponse("#me winkt ab: 'Hinfort.'");
talkEntry:addResponse("Geht mit Malachins Segen und vollbringt Taten zu Ehren Cadomyrs. Und meiner.");
talkEntry:addResponse("Fort, fort und dient mir in jeder Minute eures Lebens so, wie ich Cadomyr diene.");
talkEntry:addResponse("Gehabt euch wohl und verbreitet Kunde über das glorreiche Königreich Cadomyr überall auf euren Reisen.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("#me waves: 'Begone.'");
talkEntry:addResponse("Go with Malachin's blessings and do deeds to honour Cadomyr's name. And mine.");
talkEntry:addResponse("Off, off, and serve me every minute of your life how I serve Cadomyr.");
talkEntry:addResponse("Farewell, spread word about the marvellous kingdom of Cadomyr on your travels.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("#me winkt ab: 'Hinfort.'");
talkEntry:addResponse("Geht mit Malachins Segen und vollbringt Taten zu Ehren Cadomyrs. Und meiner.");
talkEntry:addResponse("Fort, fort und dient mir in jeder Minute eures Lebens so, wie ich Cadomyr diene.");
talkEntry:addResponse("Gehabt euch wohl und verbreitet Kunde über das glorreiche Königreich Cadomyr überall auf euren Reisen.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("I am the undisputed monarch of a glorious realm of noble men. So, how do I feel?");
talkEntry:addResponse("I would feel much better if you kneel down. Now.");
talkEntry:addResponse("I could use a batch in donkey milk. All this sand hurts my soft skin.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addResponse("Ich bin die unbestrittene Monarchin eines glorreichen Reiches der edelsten Leute. Wie geht es mir wohl?");
talkEntry:addResponse("Mir würde es weit besser gehen, wenn ihr niederknien würdet. Jetzt!");
talkEntry:addResponse("Mir käme ein Bad in Eselsmilch gerade recht. Dieser ganze Sand schadet meiner feinen Haut.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("Who I am? You dare to admit that you do not know who I am! Out of my sight!");
talkEntry:addResponse("If you really don't know who I am, ask one of my servants.");
talkEntry:addResponse("Aren't you ashamed that you ask a queen of albarian origin who she is?");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißŸt");
talkEntry:addResponse("Wer ich bin? Ihr habt die Kühnheit zuzugeben, dass ihr nicht wißŸt, wer ich bin? Aus meinen Augen!");
talkEntry:addResponse("Wenn ihr wirklich nicht wißŸt, wer ich bin, dann fragt einen meiner Diener.");
talkEntry:addResponse("Schämt ihr euch nicht, eine Königin albarischen Geblüts nach ihrem Namen zu fragen?");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("Out of my sight! If you want to barter, off to the market place. Off I say!");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Aus meinen Augen! Wenn ihr feilschen wollt, ab zum Marktplatz. Hinfort!");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("I will tell you something; my realm is named Cadomyr and I will do anything to make it prosper.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Lasst euch das gesagt sein; mein Reich nennt sich Cadomyr und ich werde alles in meiner Macht liegende tun, um es gedeihen zu lassen.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("Let me see... I rule this place. Everything, as far as you can see!");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Lasst mich nachdenken... ich regiere hier, so weit das Auge reicht.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Lasst mich nachdenken... ich regiere hier, so weit das Auge reicht.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Let me see... I rule this place. Everything, as far as you can see!");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Don't come to me, whining about some smut in the ocean. Behold the glory of Cadomyr instead.");
talkEntry:addResponse("Gobaith was doomed and I knew that. How could I know? I am the queen, did you forget?");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Ihr kommt doch nicht etwa zu mir, um über einen Schmutzfleck im Ozean zu heulen. Betrachtet stattdessen den Glanz Cadomyrs.");
talkEntry:addResponse("Gobaith war dem Untergang geweiht. Woher ich das weißŸ? Ich bin die Königin, schon vergessen?");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("bitch");
talkEntry:addTrigger("witch");
talkEntry:addResponse("What? Somebody says I am a witch? At the stake!");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hastings");
talkEntry:addTrigger("Baron");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("You dare even to speak about that... fiend! I hope you will set out right now and won't return without his head. On a stake.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("bounty");
talkEntry:addResponse("There is no bounty on Baron Hastings' head. It is a matter of honour to slay this fiend of Cadomyr.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Milk");
talkEntry:addTrigger("donkey");
talkEntry:addResponse("A bath in donkey milk can do wonders to your skin. You should try it yourself. But not in my tub, of course!");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("pyramide");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("A pyramide as grave? Who would do such a stupid thing? Discuss that with Robertus, the royal builder, but exspect to receive some laughter.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("cube");
talkEntry:addTrigger("cubus");
talkEntry:addTrigger("grave");
talkEntry:addResponse("My royal builder, Robertus, once mentioned that he wants to build a grave in the form of a cube for me. If I like it, fine for me, if won't like it, bad for him.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tomb");
talkEntry:addResponse("The grave of my father can be found in a magnificient tomb outside the town. I prompt you to honour the memory of my father there. Now.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("enemy");
talkEntry:addTrigger("enemies");
talkEntry:addTrigger("fiend");
talkEntry:addTrigger("foe");
talkEntry:addResponse("Cadomyr has no foes. There is only that bastard Baron Hastings who claims the throne but I doubt he will survive any attempt to grasp it.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("honor");
talkEntry:addTrigger("honour");
talkEntry:addResponse("Honour is everything for a nobleman of Cadomyr. Lose you honour, lose your life. Whatever you do, don't do it without considering your fame and reputation.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Law");
talkEntry:addTrigger("Custom");
talkEntry:addTrigger("habit");
talkEntry:addResponse("The law of Cadomyr you can review right in front of you: Me. Our customs, you can review at the statue of my father in front of the palace.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("builder");
talkEntry:addResponse("Robertus is my royal builder. Indeed, he will build the most magnificient grave for me, one like no man has ever seen before. My legacy will last forever.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Robertus");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Robertus is my royal builder. Indeed, he will build the most magnificient grave for me, one like no man has ever seen before. My legacy will last forever.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Desert");
talkEntry:addResponse("Sand, sand, sand. It is everywhere! In my shoes, in my chambers, even in my hair! How much I hate this sand.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Economy");
talkEntry:addResponse("Cadomyr's economy prospers. You can see that at every corner of the town. Go forth to the market place and behold the goods of the country.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("palace");
talkEntry:addResponse("My palace is the work of hard working slaves and artisans. But it was not built for me alone; it was built for the honour of Cadomyr.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("market");
talkEntry:addResponse("Glass goods, finest jewels, masonry; you can find so many wonderful goods at the market place. So, go and spend some money on it!");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hassan");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Ah, yes, I think Hassan is the name of my royal fan waver. Where is he again? He is so lazy I should whip him all day.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("husband");
talkEntry:addTrigger("marriage");
talkEntry:addResponse("I am married to Cadomyr. I serve it like I would serve my husband, see?");
talkEntry:addResponse("I wait for the Prince Right. Or do you think the Queen of Cadomyr would marry some Galmairian barter?");
talkEntry:addResponse("Cadomyr does not need a king when it has a queen like me. Do you question that?!");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Queendom");
talkEntry:addResponse("This term ceased to be funny when the first head fell down the scaffold.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Queen");
talkEntry:addResponse("That is me, I suppose: Queen Rosaline Edwards of Cadomyr. Now you better act accordingly.");
talkEntry:addResponse("Commonly, my minions adress me by 'Your highness' or 'Allmighty Queen'.");
talkEntry:addResponse("I bear the name Edwards with pride. You should speak it likewise.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Reginald");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("My father, Sir Reginald Edwards, was the king of Cadomyr. Now, his only child inherits the throne. How comes people cannot accept this old custom?");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("King");
talkEntry:addTrigger("father");
talkEntry:addResponse("My father, Sir Reginald Edwards, was the king of Cadomyr. Now, his only child inherits the throne. How comes people cannot accept this old custom?");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cape");
talkEntry:addResponse("Indeed, even the lizardmen obey my orders. Some of them usually dwell at Cape Farewell.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zerarisa");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Indeed, even the lizardmen obey my orders. Some of them usually dwell at Cape Farewell.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("lizard");
talkEntry:addResponse("Indeed, even the lizardmen obey my orders. Some of them usually dwell at Cape Farewell.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("orc");
talkEntry:addResponse("You may think that a queen of albarian origin should dislike orcs. But who swears loyality to me and follows the old customs is my minion, even if green.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ioannes");
talkEntry:addTrigger("Faber");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Ah, you are speaking about my royal treasurer. He serves me right and just. I trust him to manage the treasury of Cadomyr.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hexe");
talkEntry:addTrigger("Schlampe");
talkEntry:addResponse("Was? Jemand behauptet, ich sei eine Hexe? Auf den Scheiterhaufen mit ihm!");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hastings");
talkEntry:addTrigger("Baron");
talkEntry:addResponse("Ihr wagt es, den Namen dieses Feindes in den Mund zu nehmen. Ich hoffe, ihr werdet genau jetzt aufbrechen und nicht eher zurückkommen, als dass ihr seinen Kopf auf einem Pfahl präsentieren könnt.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Kopfgeld");
talkEntry:addResponse("Es ist kein Kopfgeld auf Baron Hastings ausgesetzt. Es ist eine Ehrentat, diesen Feind Cadomyrs zur Strecke zu bringen.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Milch");
talkEntry:addTrigger("Esel");
talkEntry:addResponse("Ein Bad in Eselmilch kann eurer Haut ware Wunder tun. Versucht es eines Tages auch einmal, aber natürlich nicht in meiner Wanne.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Pyramide");
talkEntry:addResponse("Eine Pyramide als Grab? Wer kommt denn auf so eine törichte Idee? Diskutiert das mit Robertus, meinem Baumeister. Aber macht euch auf Gelächter gefasst.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Kubus");
talkEntry:addTrigger("Grab");
talkEntry:addResponse("Mein königlicher Baumeister, Robertus, erwähnte einst, dass er gedenkt, mir ein Grab in Form eines Kubus zu bauen. Wenn es mir gefällt - gut für mich. Wenn nicht - schlecht für ihn.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gruft");
talkEntry:addResponse("Das Grab meines Vaters kann in einer beeindruckenden Gruft außŸerhalb der Stadt gefunden werden. Ich weise euch an, das Gedenken meines Vaters zu ehren. Jetzt!");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Feind");
talkEntry:addResponse("Cadomyr hat keine Feinde, außŸer diesem Bastard Baron Hastings, der den Thron für sich beansprucht. Aber ich bin mir sicher, er wird es nicht überleben, wenn er wirklich nach ihm greift.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ehre");
talkEntry:addResponse("Die Ehre bedeutet einem Edelmann Cadomyrs alles. Verliert eure Ehre, so verliert ihr euer Leben. Was auch immer ihr gedenkt zu tun, bedenkt die Auswirkungen auf euren Ruf und Reputation.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gesetz");
talkEntry:addTrigger("Sitte");
talkEntry:addTrigger("Brauch");
talkEntry:addResponse("Das Gesetz Cadomyrs steht genau vor ich: Ich. Unsere Gebräuche stehen auf der Statue meines Vaters vor dem Palast.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Baumeister");
talkEntry:addResponse("Robertus ist mein Baumeister. Oh ja, er wird mir das großŸartigste Grab bauen, was je ein Mensch gesehen hat. Mein Andenken wird die Zeitalter überdauern.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Robertus");
talkEntry:addResponse("Robertus ist mein Baumeister. Oh ja, er wird mir das großŸartigste Grab bauen, was je ein Mensch gesehen hat. Mein Andenken wird die Zeitalter überdauern.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wüste");
talkEntry:addResponse("Sand, Sand, Sand. Er ist überall! In meinen Schuhen, in meinen Gemächern, sogar in meinem Haar! Wie sehr ich diesen Sand hasse.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wirtschaft");
talkEntry:addResponse("Cadomyrs Wirtschaft floriert, wie man an allen Ecken der Stadt sieht. Geht hin zum Marktplatz und erfreut euch der Waren des Landes.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Palast");
talkEntry:addResponse("Mein Palast wurde von fleißŸigen Sklaven und Handwerkern gebaut. Aber er wurde nicht für mich alleine errichtet; sondern auch für den Ruhm Cadomyrs.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("markt");
talkEntry:addResponse("Glaswaren, feineste Juwelen und Steinmetzkunst; ihr könnt bewundernswerte Waren auf dem Markt erwerben. Los, geht und gebt euer Geld aus.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hassan");
talkEntry:addResponse("Ahja, Hassan dürfte der Name meines königlichen Fächelwedlers sein. Wo ist er schon wieder, er ist so faul, ich sollte ihn den ganzen Tag auspeitschen lassen.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ehemann");
talkEntry:addTrigger("Hochzeit");
talkEntry:addResponse("Ich bin mit Cadomyr vermählt. Ich diene ihm wie ich meinem Ehemann dienen würde, verstanden?");
talkEntry:addResponse("Ich warte auf Prinz Richtig. Oder denkt ihr, die Königin von Cadomyr würde irgendeinen dahergelaufenen Händler aus Galmair heiraten?");
talkEntry:addResponse("Cadomyr braucht keinen König wenn es eine Königin wie mich hat. Oder stellt ihr das etwa in Frage?");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königinreich");
talkEntry:addResponse("Dieser Begriff verlor seinen Witz als der erste Kopf vom Schafott rollte.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königin");
talkEntry:addResponse("Das bin ich: Königin Rosaline Edwards von Cadomyr. Jetzt verhaltet euch entsprechend.");
talkEntry:addResponse("Normalerweise sprechen mich meine Untertanen so an: 'Eure Hoheit' oder 'Allmächtige Königin'.");
talkEntry:addResponse("Ich trage den Namen Edwards mit Stolz. Genauso solltet ihr ihn auch aussprechen.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("König");
talkEntry:addTrigger("Vater");
talkEntry:addTrigger("Reginald");
talkEntry:addResponse("Mein Vater, Sir Reginald Edwards, war der König von Cadomyr. Und nun hat sein einziges Kind den Thron inne. Ich verstehe nicht, warum einige Leute diesen alten Brauch nicht aktzeptieren.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Kap");
talkEntry:addTrigger("Abschied");
talkEntry:addResponse("Fürwahr, sogar die Echsenwesen gehorchen meinen Befehlen. Einige von ihnen leben am Kap des Abschiedes.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zerarisa");
talkEntry:addResponse("Fürwahr, sogar die Echsenwesen gehorchen meinen Befehlen. Einige von ihnen leben am Kap des Abschiedes.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Echse");
talkEntry:addResponse("Fürwahr, sogar die Echsenwesen gehorchen meinen Befehlen. Einige von ihnen leben am Kap des Abschiedes.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ork");
talkEntry:addResponse("Ihr denkt vielleicht, eine Königin aus albarischem Geschlecht verabscheut Orks. Aber wer mir die Treue schwört und die alten Sitten achtet, der ist mein Untertan, sei er auch grün.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ioannes");
talkEntry:addTrigger("Faber");
talkEntry:addResponse("Ah, ihr redet von meinem königlichen Kämmerer. Er dient mir aufrichtig und treu. Ich vertraue ihm bei der Verwaltung der königlichen Reichtümer.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addTrigger("archmage");
talkEntry:addTrigger("Erzmagier");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("A renegade mage who, I have to admit, knows how to manipulate his minions into believing he is a generous leader.");
talkEntry:addResponse("In fact, negotiations with him are more challenging than simply thrusting a pike into his stomach.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addTrigger("archmage");
talkEntry:addTrigger("Erzmagier");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Ein abtrünniger Magier der zugegebenerweise weißŸ, wie man seine Untertanen dahingehend täuscht, dass er vorgibt, ein großŸzügiger Anführer zu sein.");
talkEntry:addResponse("Fürwahr, mit ihm zu verhandeln ist schwieriger als ihm einfach eine Lanze in den Bauch zu rammen.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I have no problem with Runewick, as long as they don't set the feet ashore. And this happened too often a time recently.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Ich habe keine Probleme mit Runewick, solange sie ihren FüßŸe nicht auf das Land setzen. Und das geschieht mir in letzter Zeit zu häufig.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("If you dare to remind me on the marriage proposal of the Don, I'll let my guards fill your mouth with scorpions!");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Wenn ihr es wagt, mich an den Heiratsantrag des Dons zu erinnern, dann lasse ich euren Mund mit Skorpionen füllen!");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Galmair is like rose with thorns; it might look appealing, but grasping for it should be done carefully.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Galmair ist wie eine dornenbewehrte Rose; es mag begehrenswert aussehen, aber wenn man danach greift, dann sollte man jeden Schriff genau überdenken.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("königin");
talkEntry:addTrigger("queen");
talkEntry:addTrigger("edwards");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("That is me, I suppose: Queen Rosaline Edwards of Cadomyr. Now you better act accordingly.");
talkEntry:addResponse("Commonly, my minions adress me by 'Your highness' or 'Allmighty Queen'.");
talkEntry:addResponse("I bear the name Edwards with pride. You should speak it likewise.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("königin");
talkEntry:addTrigger("queen");
talkEntry:addTrigger("edwards");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Das bin ich: Königin Rosaline Edwards von Cadomyr. Jetzt verhaltet euch entsprechend.");
talkEntry:addResponse("Normalerweise sprechen mich meine Untertanen so an: 'Eure Hoheit' oder 'Allmächtige Königin'.");
talkEntry:addResponse("Ich trage den Namen Edwards mit Stolz. Genauso solltet ihr ihn auch aussprechen.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Cadomyr means everything to me; I was born to serve Cadomyr and so was everyone born to serve me. Let us obey the old customs and the traditions.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Cadomyr ist mein ein und alles. Ich wurde geboren, um Cadomyr zu dienen und so wurde ein jeder hier geboren, um mir zu dienen. Lasst uns diesen alten Gebräuchen gehorchen und die Tradition wahren.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("My blood is albarian. My hair is albarian. The people of Cadomyr are of albarian origin. Cadomyr is the bettse Albar!");
talkEntry:addResponse("I am proud of my albarian origin, even though I was told that the old customs are more and more neglected in Albar.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Mein Blut is albarisch. Mein Haar ist albarisch. Das Volk von Cadomyr hat albarische Wurzeln. Cadomyr ist das bessere Albar!");
talkEntry:addResponse("Ich bin stolz auf meine albarische Herkunft, auch wenn mir zu Ohren kam, dass man dort die alten Sitten immer häufiger missachtet.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("One should plunder and pillage Gynk! Such a pool of sins! No honour! To arms!");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Man sollte Gynk verwüsten und niederbrennen! Was für ein Sündenpfuhl! Zu den Waffen!");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("The Salkamaerians have their customs, we have ours. As long as they do not interfere with cadomyrian issues, they may do whatever they think is right.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Die Salkamaerier haben ihre Gebräuche, wir haben unsere. Solange sie sich nicht in cadomyrische Angelegenheiten einmischen, sollen sie machen, was sie für richtig halten.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Adron");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("It is common knowledge among my minions that Adron blessed me and that he is whom I respect most among the Eleven.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Adron");
talkEntry:addResponse("Meine Untertanen wissen, dass ich von Adron gesegnet bin und dass er derjenige der Elf ist, den ich am meisten respektiere.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("How can one worship the Lord of Fire? Of course, we all honour the Five, but fire can cause so much harm. It keeps us warm, though; so respect it and Brágon, but do not worship it.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addResponse("Wie kann man nur den Herren des Feuers verehren? Selbstredend ehren wir die Fünf, aber Feuer kann so viel Leid verursachen. Es spendet uns aber auch Wärme; also respektiert es und Brágon, aber verehrt es nicht.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I hope the time when I face Cherga in the afterlife will not come anytime soon; Robertus did not even finish the plans for my grave. Furthermore, who would rule Cadomyr, if not me?");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addResponse("Ich hoffe, dass es noch eine Weile dauert, bis ich Cherga ins Angesicht trete. Robertus hat noch nicht einmal die Baupläne für mein Grab vollendet. Und wer sollte schon Cadomyr regieren, wenn nicht ich?");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elara");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Elara, hah, a commonly overestimated goddess. People think she knows it all; but how can a single god know more than dozens of generations of albarians?");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elara");
talkEntry:addResponse("Elara, hah, eine meist überschätzte Göttin. Manche denken, sie weißŸ alles; aber wie kann eine einzelne Gottheit mehr wissen als Generationen von Albariern?");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eldan");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I was taught that Eldan is the father of Elara and hence, as useless as her. But my faith in the Five grew strong and nowadays, I would execute my teacher for what he taught me.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eldan");
talkEntry:addResponse("Man lehrte mich, dass Eldan der Vater Elaras ist und somit genauso wertlos ist wie sie. Aber mein Glaube an die Fünf ist nun stark und dieser Tage würde ich meinen Lehrer für diesen Frevel hinrichten lassen.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Findari");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Findari's gift is the wind; it drives our sailboats and brings the clouds of rain. But wind can also blow sand into my palace! So, the Five are never friend nor foe.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Findari");
talkEntry:addResponse("Findaris Geschenk ist der Wind. Er treibt unsere Segelboote an und bringt die Regenwolken. Aber der Wind bläßŸt auch immer wieder diesen Sand in meinen Palast! Nun, die Fünf sind niemals ein Freund, aber auch nicht ein Feind.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("The god of coins, work and rates, that is Irmorom. You won't find many followers of Irmorom in Cadomyr, better head for Galmair; there are more pigs there, too.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("Der Gott der Münzen, der Arbeit und der Zinsen, das ist Irmorom. Ihr werdet nicht viele seiner Anhänger hier in Cadomyr finden. Also geht besser nach Galmair, dort gibt es nebenbei auch mehr Schweine.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachán");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("You must be speaking about the god of battles. He is our saviour and saint, so pray to him every day and every night. That was an order!");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachán");
talkEntry:addResponse("Ihr müßŸt über den Gott der Schlachten reden. Er ist unser Erlöser und Schutzpatron, also betet zu ihm an jedem Tag und in jeder Nacht. Das war ein Befehl!");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Moshran");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("You must not speak out loud this name ever again in Cadomyr. Do so and my wrath will smite you. Perform your dark craft elsewhere, how about Runewick?");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Moshran");
talkEntry:addResponse("Ihr werdet diesen Namen niemals wieder laut in Cadomyr aussprechen. Tut ihr es doch, so wird mein Zorn euch zerschmettern. Geht dunklen Künsten woanderns nach, wie wäre es mit Runewick?");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("If there is one thing I hate more than Baron Hastings, then it is disorder. So, you can estimate how much I love Nargún, the god of chaos.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addResponse("Wenn etwas gibt, was ich nochmehr hasse als Baron Hastings, dann ist das Unordnung. Somit könnt ihr euch selbst erklären, wie sehr ich Nargún, die Gott des Chaos, liebe.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oldra");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hah! I will make Cadomyr a even more beautiful land, without the help of the wicked Oldra. Irrigation makes plants grow, not a prayer to this inane goddess.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("Hah! Ich werde Cadomyr in blühende Landschaften verwandeln, auch ohne die Hilfe der verwunschenen Oldra. Bewässerung läßŸt Pflanzen gedeihen, nicht ein Gebet zu dieser unbedeutenden Göttin.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ronagan");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("You are speaking about the god of travellers, I hope. Not the god of those with chopped off hands, am I right?");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("Ihr sprecht vom Gott der Reisenden, hoffe ich; nicht vom Gott derer mit abgeschlagenen Händen, nicht wahr?");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sirani");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("It is not common to worship Sirani in Cadomyr. If you want to worship something female, worship me!");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("Es ist in Cadomyr unüblich, Sirani anzubeten. Wenn ihr etwas weibliches anbeten wollt, dann betet mich an!");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("The goddess of fish, one could say, that is Tanora. But my people pray to her and Cadomyr isn't a land of fish, that much is certain.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("Die Göttin der Fische, so könnte man meinen, das ist Tanora. Aber mein Volk betet zu ihr und Cadomyr ist nicht gerade ein fischreiches Land, das steht fest.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ushara");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I still don't know who to blame for all the sand on the world; Ushara or Brágon? I'll honour them, either way, but not more.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("Ich weißŸ immernoch nicht so recht, wen ich für all den Sand der Welt verantwortlich machen soll; Ushara oder Brágon? Ich ehre sie beiden trotzdem, mehr aber auch nicht.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zhambra");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Be loyal to your queen and Zhambra will smile upon you. Be diobedient and you will see what Zhambra will do to you if you ever pass to the afterlife...");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zhambra");
talkEntry:addResponse("Seid loyal gegenüber eurer Königin und Zhambra wird es gutheißŸen. Seid ungehorsam und ihr werdet schon sehen, was Zhambra für euch bereit hält, wenn ihr ins Jenseits übergeht...");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Ah, a loyal minion. Fine. Please ask one of my servants what you can do for me today, I cannot be bothered with details; I have to rule a whole kingdom, not just you.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Ah, ein loyaler Diener, wie fein. Bitte fragt einen meiner Diener, was ihr heute für mich tun könnt. Ich kann mich nicht mit Details aufhalten, ich muss ein ganzes Königreich regieren, nicht nur euch.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addResponse("Ah, a loyal minion. Fine. Please ask one of my servants what you can do for me today, I cannot be bothered with details; I have to rule a whole kingdom, not just you.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addResponse("Ah, ein loyaler Diener, wie fein. Bitte fragt einen meiner Diener, was ihr heute für mich tun könnt. Ich kann mich nicht mit Details aufhalten, ich muss ein ganzes Königreich regieren, nicht nur euch.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cleopatra");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Who is that supposed to be?");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Marc");
talkEntry:addTrigger("Anthony");
talkEntry:addResponse("Once, a puny prince called Marc from a far, far away land came to my palace and proposed marriage. I could not stop laughing for a whole day!");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Markus");
talkEntry:addTrigger("Marcus");
talkEntry:addTrigger("Anthonius");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Once, a poor prince called Marc from a far, far away land came to my palace and proposed marriage. I could not stop laughing for a whole day!");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("STFU");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I heard that, scum!");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hawt");
talkEntry:addResponse("What!");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("I love you");
talkEntry:addResponse("And I love Cadomyr.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cleopatra");
talkEntry:addResponse("Wer soll das denn wieder sein?");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Mark");
talkEntry:addTrigger("Anton");
talkEntry:addResponse("Einst kam ein erbärmlicher Prinz namens Markus aus einem fernen Land an meinen Hof und wollte mich ehelichen. Wie habe ich gelacht, den ganzen Tag noch.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Markus");
talkEntry:addTrigger("Marcus");
talkEntry:addTrigger("Anthonius");
talkEntry:addResponse("Einst kam ein erbärmlicher Prinz namens Markus aus einem fernen Land an meinen Hof und wollte mich ehelichen. Wie habe ich gelacht, den ganzen Tag noch.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("STFU");
talkEntry:addResponse("Ich hab das gehört, Abschaum!");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("geil");
talkEntry:addResponse("Was!");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ich liebe dich");
talkEntry:addTrigger("Ich liebe euch");
talkEntry:addResponse("Und ich liebe Cadomyr.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("Good.");
talkEntry:addResponse("Wonderful.");
talkEntry:addResponse("Right.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("Gut.");
talkEntry:addResponse("Wunderbar.");
talkEntry:addResponse("Recht so.");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("Do you dare to disagree with me?");
talkEntry:addResponse("'No', that word is unfamiliar to me.");
talkEntry:addResponse("Didn't you want to say: 'Yes, my queen!'");
talkingNPC:addEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("Wagt ihr es, zu widersprechen?");
talkEntry:addResponse("'Nein', dieses Wort ist mir unbekannt.");
talkEntry:addResponse("Wolltet ihr nicht vielmehr sagen: 'Ja, meine Königin!'");
talkingNPC:addEntry(talkEntry);
end;
talkingNPC:addCycleText("#me kämmt sich die Haare und flucht vor sich hin.", "#me combs her hair, cursing to herself.");
talkingNPC:addCycleText("Auf die Knie! Sofort!", "Kneel down! Now!");
talkingNPC:addCycleText("Vernünftige Diener zu finden wird auch immer schwieriger.", "Finding proper servants becomes harder and harder.");
talkingNPC:addCycleText("Wo ist Hassan schon wieder! Schickt nach meinem Fächelwedler, mir ist heißŸ!", "Where is Hassan again? Send word to my fan waver, it is hot!");
talkingNPC:addCycleText("#me starrt auf ihre in fein gefertigte Sandalen gekleideten FüßŸe und murmelt: 'Blau könnte meinen Zehennägeln auch mal gut stehen.'", "#me stares at her feet, clad in fine sandals, murmuring: 'I should consider painting my toenails blue.'");
talkingNPC:addCycleText("Diplomatie, Urteile, regieren, Krieg führen - eine Königin hat es nicht leicht. Alles für Cadomyr!", "Diplomacy, sentencing, ruling, warfare - a queen has a hard day. All for Cadomyr!");
talkingNPC:addCycleText("Gehorcht!", "Obey!");
talkingNPC:addCycleText("Bringt mir Eselsmilch und bereitet mein Bad vor.", "Bring forth the donkey milk and prepare my bath.");
talkingNPC:addCycleText("Befehle, Befehle, Befehle. Warum muss ich immer jedem sagen, was er zu tun hat? Denkt denn hier niemand außŸer mir?", "Orders, orders, orders. Why do I have to tell everyone what do so? Am I the only one who thinks?");
talkingNPC:addCycleText("Cadomyr wurde nicht auf Sand gebaut; Cadomyr wurde auf Traditionen gebaut, die älter sind als so manches Sandkorn.", "Cadomyr was not founded on sand; it was founded on traditions, even older than most sand grains.");
talkingNPC:addCycleText("Wer hat da ein Licht auf Fenstersims entzündet? Was geht nur wieder in diesem Palast vor sich.", "Who left light on the porch and for who? What goes on in this palace!");
mainNPC:addLanguage(0);
mainNPC:addLanguage(1);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Das ist ein NPC dessen Entwickler zu faul war eine Beschreibung einzutragen.", "This is a NPC who's developer was too lazy to type in a description.");
mainNPC:setUseMessage("Fass mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut dich verwirrt an.", "#me looks at you confused.");
initdone = true;
end;

function receiveText(texttype, message, speaker)
    calledReceiveText = true;
    if (thisNPC ~= nil) then
        thisNPCReceiveText = true;
    end;
    speaker:inform("In recv message");
    mainNPC:receiveText(speaker, message);
    finishedReceivedText = true;
end;
function nextCycle()
    calledNextCycle = true;
    if (thisNPC ~= nil) then
        thisNPCNextCycle = true;
    end;
    mainNPC:nextCycle();
    finishedNextCycle = true;
end;
function lookAtNpc(char, mode)
    calledLookAt = true;
    if (thisNPC ~= nil) then
        thisNPCLookAt = true;
    end;
    mainNPC:lookAt(char, mode);
    finishedLookAt = true;
end;
function useNPC(char, counter, param)
    calledUseNPC = true;
    if (thisNPC ~= nil) then
        thisNPCUseNPC = true;
    end;
    mainNPC:use(char);
    finishedUseNPC = true;
end;
initNpc();
initNpc = nil;
-- END
--------------------------------------------------------------------------------
-- NPC Name: Don Valerio Guilianni                                       None --
-- NPC Job:  none                                                             --
--                                                                            --
-- NPC Race: human                      NPC Position:  337, 215, 0            --
-- NPC Sex:  male                       NPC Direction: south                  --
--                                                                            --
-- Author:   not set                                                          --
--                                                                            --
-- Last parsing: August 09, 2010                         easyNPC Parser v1.00 --
--------------------------------------------------------------------------------

require("npc.base.basic")
require("npc.base.condition.language")
require("npc.base.consequence.inform")
require("npc.base.talk")
module("npc.don_valerio_guilianni", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Don Valerio Guilianni of Galmair. Keyphrases: TRIGGERS."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Don Valerio Guilianni von Galmair. Schlüsselwörter: TRIGGERS."));
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
talkEntry:addResponse("The Don greets you. So you've came to take good care of your fate?");
talkEntry:addResponse("Greetings, greetings. The Don is busy right now but he always has an open ear for the pleas of his protégés.");
talkEntry:addResponse("Hm? State your cause to the Don but make it brief or I'll make you an offer you can't refuse.");
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
talkEntry:addResponse("Der Don grüßt euch. Ihr seid also gekommen um euch um euer Schicksal zu kümmern?");
talkEntry:addResponse("Grüße, Grüße. Der Don ist zwar beschäftigt aber für die Anliegen seiner Schützlinge hat er immer ein offenes Ohr.");
talkEntry:addResponse("Hm? Tragt eure Sache dem Don vor aber fasst es kurz oder ich mache euch ein Angebot, das ihr nicht ablehnen könnt.");
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
talkEntry:addResponse("The Don greets you. So you've came to take good care of your fate?");
talkEntry:addResponse("Greetings, greetings. The Don is busy right now but he always has an open ear for the pleas of his protégés.");
talkEntry:addResponse("Hm? State your cause to the Don but make it brief or I'll make you an offer you can't refuse.");
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
talkEntry:addResponse("Der Don grüßt euch. Ihr seid also gekommen um euch um euer Schicksal zu kümmern?");
talkEntry:addResponse("Grüße, Grüße. Der Don ist zwar beschäftigt aber für die Anliegen seiner Schützlinge hat er immer ein offenes Ohr.");
talkEntry:addResponse("Hm? Tragt eure Sache dem Don vor aber fasst es kurz oder ich mache euch ein Angebot, das ihr nicht ablehnen könnt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Good bye");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare thee well");
talkEntry:addResponse("#me rubs his chin looking contemplative 'Eh, you may leave. Probably not worth to send someone to keep an eye on you.'");
talkEntry:addResponse("May Ronagan spread his protective coat out atop of you. And best regards to the family!");
talkEntry:addResponse("#me gives a brief nod and then turns away 'Hm. An interresting person, gonna get good one day, too good. Miggs should administer his observation.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehabt euch wohl");
talkEntry:addResponse("#me fährt sich nachdenklich übers Kinn 'Eh, ihr könnt gehen. Wohl nicht wert euch im Auge behalten zu lassen.'");
talkEntry:addResponse("Ronagan breite seinen schützenden Mantel über euch aus. Und Grüße an die Familie!");
talkEntry:addResponse("#me nickt nur knapp und wendet sich dann ab 'Hm. Eine interessante Person, könnte es weit bringen, zu weit. Miggs soll ihn beschatten lassen.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("#me rubs his chin looking contemplative 'Eh, you may leave. Probably not worth to send someone to keep an eye on you.'");
talkEntry:addResponse("May Ronagan spread his protective coat out atop of you. And best regards to the family!");
talkEntry:addResponse("#me gives a brief nod and then turns away 'Hm. An interresting person, gonna get good one day, too good. Miggs should administer his observation.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("#me fährt sich nachdenklich übers Kinn 'Eh, ihr könnt gehen. Wohl nicht wert euch im Auge behalten zu lassen.'");
talkEntry:addResponse("Ronagan breite seinen schützenden Mantel über euch aus. Und Grüße an die Familie!");
talkEntry:addResponse("#me nickt nur knapp und wendet sich dann ab 'Hm. Eine interessante Person, könnte es weit bringen, zu weit. Miggs soll ihn beschatten lassen.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("Excellent. But that's of no concern right now. Tell me, %CHARNAME, what can the Don do for you?");
talkEntry:addResponse("#me waves dismissively 'Oh still a little shaken from the weekly assasination attempt.'");
talkEntry:addResponse("How? One could say: Like the leader of a pack of wolves that has to guard his position at all times.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addResponse("Ausgezeichnet. Aber das tut nichts zur Sache. Sagt was kann der Don für euch tun, %CHARNAME?");
talkEntry:addResponse("#me winkt ab 'Oh noch etwas aufgeregt vom allwöchentlichen Anschlag auf mein Leben.'");
talkEntry:addResponse("Wie? Ein treffender Vergleich wäre dies: Wie der einsame Leitwolf, der seine Stellung im Rudel verteidigen muss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("#me makes a broad welcoming gesture with his hands 'Ah forgive my manners. Valerio Guilianni is my name but call me 'My Don'.");
talkEntry:addResponse("Hm, you're not a bright spark, right? I thought this residence and hoard of servants would give enough of a hint.");
talkEntry:addResponse("#me sighs '%CHARNAME, how can one be so naive? Where's the respect? I am the Don.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("#me macht eine ausladende willkommende Geste 'Ah meine Manieren. Valerio Guilianni ist mein Name aber nennt mich 'Mein Don'.");
talkEntry:addResponse("Hm, der hellste Blitz scheint ihr nicht zu sein. Und ich dachte die Residenz und Dienerschaft wären Hinweis genug.");
talkEntry:addResponse("#me seufzt '%CHARNAME, wie kann man nur so blauäugig sein? Wo bleibt der Respekt? Ich bin der Don.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("I don't sell anything, I grant favours.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Ich verkaufe nichts, ich gewähre Gefälligkeiten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("Money gets you everywhere in Galmair. Even those places you probably shouldn't be.");
talkEntry:addResponse("My father once said: 'Son, stay honest and upright, you'll be rewarded.' Oh how we laughed that day.");
talkEntry:addResponse("#me winks knowingly 'If there's one habbit I broke out of it's telling others about something.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("In Galmair bringt Geld euch überall hin. Wohl auch an Orte die ihr meiden solltet.");
talkEntry:addResponse("Mein Vater sagte einmal: 'Sohn, bleib ehrbar und anständig, es wird dir gelohnt.' Oh was haben wir an diesem Tag gelacht.");
talkEntry:addResponse("#me zwinkert wissend 'Wenn es eine Sache gibt die ich mir abgewöhnt habe, dann anderen Dinge zu erzählen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("Well, I provide for myself, my family and my friends. Ah and I rule Galmair of course.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Nun, ich sorge für mich, meine Familie und meine Freunde. Ach und Galmair beherrsche ich natürlich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Nun, ich sorge für mich, meine Familie und meine Freunde. Ach und Galmair beherrsche ich natürlich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Well, I provide for myself, my family and my friends. Ah and I rule Galmair of course.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Ja, eine Schande. Tragisch, furchtbar. Und dabei herrschten ideale Bedingungen um ein zweites Galmair zu errichten.");
talkEntry:addResponse("As far as I heard, Troll's Bane could easily compete with Galmair in terms of security, quality of life and civil rights.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Ja, eine Schande. Tragisch, furchtbar. Und dabei herrschten ideale Bedingungen um ein zweites Galmair zu errichten.");
talkEntry:addResponse("Soweit ich gehört habe, stand Troll's Bane Galmair in Sicherheit, Lebensqualität und politischer Mitsprache um nichts nach.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("I pay good money to know what's going on in my town, %CHARNAME. I knew about your presence here.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Ich zahle gutes Geld um zu wissen was in meiner Stadt passiert, %CHARNAME. Euer Aufenthalt hier war mir bekannt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Rosie");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("She doesn't like the name, you'll rather know her as queen Rosaline.");
talkEntry:addResponse("Believe me, it is my privilege alone to call her that way. Don't you even try.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Rosie");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Sie mag den Namen nicht, ihr werdet sie eher als Königin Rosaline kennen.");
talkEntry:addResponse("Glaubt mir, das Privileg sie so zu nennen ist allein mir vorbestimmt. Versucht es erst gar nicht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Miggs");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Every sucessful buisinessman needs two things: A supportive wife and a muscle to do his biding. If only I had Rosie, I'd have both in one person.");
talkEntry:addResponse("Miggs is like a second left hand for me, but enough jokes. See him if you need a task.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Miggs");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Jeder erfolgreiche Geschäftsmann braucht zwei Dinge: Eine unterstützende Frau und einen Mann fürs Grobe. Ach, mit Rosie hätte ich beides in einem.");
talkEntry:addResponse("Miggs ist wie eine zweite linke Hand, aber genug gescherzt. Geh zu ihm wenn du eine Aufgabe suchst.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addTrigger("archmage");
talkEntry:addTrigger("Erzmagier");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Tell me, what should I think of a man who wears womens clothing and enjoys men swooning over his greatness?");
talkEntry:addResponse("He is said not to leave his tower very often. And if you ask me, that's a good thing.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addTrigger("archmage");
talkEntry:addTrigger("Erzmagier");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Sagt mir ernsthaft, was soll ich von einem Mann halten der Frauengewänder trägt und sich von Männern anhimmeln lässt?");
talkEntry:addResponse("Er soll seinen Turm ja nicht oft verlassen, und wenn ihr mich fragt ist das auch gut so.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Sadly, the tide never rises high enough for a wave to wash away all those bookworms into the sea.");
talkEntry:addResponse("Some suspect me of blackmail, but do you know the fee charged by a Runewick mage for his services? That's a crime!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Leider steigt die Flut nie hoch genug, um diese ganzen Bücherwürmer mit einer Welle ins Meer zu spülen.");
talkEntry:addResponse("Man warf mir schon einmal Erpressung vor, aber wisst ihr, wieviel die Magier Runewicks für ihre Dienste verlangen? Das ist ein Verbrechen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("#me bows ever so slightly. 'That's me. How can I help you, %CHARNAME ?'");
talkEntry:addResponse("You've heard about me I see. Very good, very good. Ask and the Don will help you.");
talkEntry:addResponse("What do you want from him? Who sent you? Guards! Has this person been searched for weapons?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("#me deutet eine Verbeugung an. 'Das bin ich. Wie kann ich euch helfen, %CHARNAME ?'");
talkEntry:addResponse("Ihr habt also von mir gehört. Sehr schön, sehr schön. Bittet und der Don wird euch helfen.");
talkEntry:addResponse("Was wollt ihr von ihm? Wer hat euch geschickt? Wache! Wurde diese Person auf Waffen untersucht?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Galmair is like a mountain flower, enchanting every wanderer with its beauty.");
talkEntry:addResponse("Sometimes, if I am up early and look down from the battlement I can almost smell the sucess and profit of Galmair.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Galmair ist eine wilde Gebirgsblume, die jeden Wanderer mit ihrer Schönheit in ihren Bann zieht.");
talkEntry:addResponse("Manchmal, wenn ich früh aufstehe und von den Zinnen hinabblicke kann ich den Erfolg und Profit von Galmair fast riechen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("königin");
talkEntry:addTrigger("queen");
talkEntry:addTrigger("edwards");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Oh Rosie! That's my kind of woman. Such fire, such fierce temper!");
talkEntry:addResponse("She fell for me completely! Sadly she would never show her true feelings openly.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("königin");
talkEntry:addTrigger("queen");
talkEntry:addTrigger("edwards");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Oh Rosie! Das ist eine richtige Frau! Voll Feuer, voll Temperament!");
talkEntry:addResponse("Sie ist mir vollkommen verfallen! Leider würde sie ihre wahren Gefühle für mich nie offen zeigen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("A nice place. Maybe it lacks the proper nightlife, but Rosie does a good job overall.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Ein hübscher Ort. Das Nachtleben lässt vielleicht etwas zu wünschen übrig, aber Rosie macht ihre Sache gut.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Proud people. I find their way of dealing with weakness appealing.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Ein stolzes Volk. Und ihre Art, wie sie mit Schwäche umgehen, gefällt mir ebenfalls.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Honourable former 'business partners' of my father lived there. Until we had to terminate them. The business relationships I mean.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Ehrenwerte ehemalige 'Geschäftspartner' meines Vaters wohnten dort. Wir mussten sie leider terminieren. Die Geschäftsbeziehungen meine ich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Eventhough they like to act all noble, many of them visit Galmair to entertain themselves. Their vice pays our dice, heh.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Auch wenn sie sich gerne nobel geben, viele kommen zu uns nach Galmair um sich zu amüsieren. Ihr Laster bringt uns Zaster, hehe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Adron");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Ahh, what would a tavern be without him? How could tempers run high over a game of cards if not due to Adron's gifts?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Adron");
talkEntry:addResponse("Ahh, was wäre eine Taverne ohne ihn? Wie könnten sich sonst die Gemüter so beim Kartenspiel erhitzen wenn nicht durch Adrons Gaben?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I wonder if he takes offence in my dragon leather boots. But didn't he leave this world already? If you can't stand the heat, get out of the kitchen, hehe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addResponse("Ich frage mich ob er meine Stiefel aus Drachenleder anstößig findet. Aber hat er diese Welt nicht schon verlassen? Und was er nicht weiß macht ihn nicht heiß.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("If you'd wake up to a dagger poking your throat every other night you'd also respect the lady in black.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addResponse("Würdet ihr jede zweite Nacht mit einem Messer an der Kehle aufwachen, ihr hättet auch Respekt vor der schwarzen Dame.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elara");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Books might teach you a lot. But everything I had to learn to become sucessful I have experienced through action.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elara");
talkEntry:addResponse("Bücher mögen einem viel beibringen können. Aber alles, was ich lernen musste um erfolgreich zu sein, habe ich durch Taten erfahren.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eldan");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I don't believe Eldan shows any interrest in Galmair or myself. The mountains are pretty secluded however, maybe he'd like those.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eldan");
talkEntry:addResponse("Ich glaube kaum, dass Eldan sich für Galmair und mich interessiert. Obwohl das Gebirge doch sehr abgeschieden ist, vielleicht würde ihm das gefallen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Findari");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Sometimes, when the temperature becomes unbearable in winter, I think to myself 'One can overdo in fulfilling his tasks'.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Findari");
talkEntry:addResponse("Manchmal, wenn die Temperaturen im Winter unerträglich werden, denke ich mir 'Man kann seine Aufgaben auch zu gründlich erfüllen.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("As Galmairs wealth comes from mining and processing ores it would be foolish not to drink a mug of beer regularly in honour of the great craftsman, right?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("Da Galmair vorallem vom Bergbau und Weiterverarbeitung von Metallen lebt, wäre es töricht, nicht regelmäßig einen Krug Bier für den großen Handwerker mitzutrinken, nicht?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hah, noble the one to receive an arrow for saving his comrade in battle. Doesn't he know how much that hurts!?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addResponse("Hah, ehrenhaft ist, wer einen Pfeil abfängt um seinen Kameraden in der Schlacht zu retten. Weiß er nicht wie weh sowas tut!?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Moshran");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Maybe not all of my decisions in life were 'right', but I do know the thin line between twilight and eternal darkness. I won't cross that line.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Moshran");
talkEntry:addResponse("Ich mag nicht immer das 'Richtige' getan haben, aber ich kenne die feine Linie zwischen dem Zwielicht und der ewigen Dunkelheit. Ich werde diese Linie nicht übertreten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Nargún blessed me many a times, when I had to play my cards right. On the other hand there's no reason not to tip luck into your favour, he's pretty unreliable after all.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addResponse("Schon oft war mir Nargún hold, als es darum ging auf die richtige Karte zu setzen. Anderenseits spricht nichts dagegen dem Glück auch nachzuhelfen, immerhin ist er nicht sehr verlässlich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oldra");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("We live amidst a scarce mountain range and I shall pay reverence to Oldra? Puh-lease...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("Wir leben inmitten eines kargen Gebirges, und da soll ich Oldra Respekt erweisen? Pfft... also bitte.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ronagan");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("No coin, no wares leave my posession before they're blessed in the face of Ronagan. You may figure out as to why I am doing that yourself.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("Kein Geldstück, keine Ware verlässt meinen Besitz bevor sie nicht in Gebete zu Ronagan mit eingeschlossen wurde. Spekulationen, warum ich das mache, seien euch selbst überlassen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sirani");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I would have the most beautiful temple carved into the mountains, if only Rosie wouldn't be that abrasive. Sirani has to settle for less until that happens.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("Den schönsten Tempel würde ich in das Gebirge hauen lassen, wenn nur Rosie nicht immer so abweisend zu mir wäre. Bis dahin muss Sirani sich mit weniger begnügen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tanora");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("In spring after the snow is melting I sometimes think we don't pay enough respect to her. But after the floods are under control I disregard those thoughts again.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tanora");
talkEntry:addResponse("Nach der Schneeschmelze im Frühling glaube ich manchmal dass wir Tanora nicht genug huldigen. Wenn die Überschwemmungen aber beseitigt sind, verdränge ich diese Gedanken wieder.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ushara");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Some of the dwarves pray to her. They say if we don't, the mountain will collapse upon us. Whatever.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("Einige der Zwerge beten zu ihr. Sie sagen sonst stürzt uns der Berg auf den Kopf, was auch immer.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zhambra");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("When you're smiling everyone smiles with you. Cry and you weep alone. I never needed friends.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zhambra");
talkEntry:addResponse("Wenn man lacht, lacht die Welt mit einem mit, aber weine und du weinst allein. Ich hatte nie eine Verwendung für Freunde.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("The day will come, when the Don will ask you for a favour. Ask Miggs if that day is today.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Es wird der Tag kommen, an dem dich der Don um einen Gefallen bittet. Frage Miggs, ob heute dieser Tag ist.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addResponse("You know, the Don starts to like you. And he'll get you a task to do. Ask Miggs how you can earn the Don's favour.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addResponse("Weißt du, der Don mag dich. Und der Don wird dir auch eine Arbeit verschaffen. Frage Miggs, wie du in der Gunst des Don steigen kannst.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Corleone");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Ach, a dazzler from Gynka, no honour. And throaty all the time, the gods know why.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Corleone");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Ach, ein Blender aus Gynka, keine Ehre. Und immer heiser, die Götter wissen warum.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("Indeed.");
talkEntry:addResponse("The Don concurs.");
talkEntry:addResponse("The Don approves.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("In der Tat.");
talkEntry:addResponse("Der Don stimmt zu.");
talkEntry:addResponse("Der Don heißt dies gut.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("'No'? Don't force the Don to make the impossible possible.");
talkEntry:addResponse("'No'? Well, you may keep your opinion. One can sell everything else with a profit anyway.");
talkEntry:addResponse("And this negative attitude divides sucess and failure. That's why you're just a petitioner before the Don.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("'Nein'? Zwingt den Don nicht das unmögliche möglich zu machen.");
talkEntry:addResponse("'Nein'? Nun gut ihr könnt eure Meinung behalten. Alles andere kann man ja mit Gewinn verkaufen.");
talkEntry:addResponse("Und genau diese negative Einstellung entscheidet über Erfolg und Misserfolg. Deswegen seid ihr nur ein Bittsteller vor dem Don.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me geht müßig ein paar Schritte auf und ab, dabei lächelt er zufrieden.", "#me walks a few steps up and down at a leisure pace, a content smile on his face.");
talkingNPC:addCycleText("Respekt? Wo ist nur der Respekt geblieben? All diese Möchtegerns...", "Respect? Where's the respect? All those wannabes...");
talkingNPC:addCycleText("#me dreht sich besorgt um 'Halt! Wer ist da? Es ist noch nicht Zeit für das wöchentliche Attentat!'", "#me turns around concerned 'Halt! Who's there? It's not time for the weekly assasination attempt.'");
talkingNPC:addCycleText("#me spuckt angewidert ein paar Trauben aus. 'Ugh. Wer hat das zu verantworten?", "#me spits out some grapes in disgust. 'Ugh. Who's responsible for that?'");
talkingNPC:addCycleText("Ich befürchet, dieser Kräuterhandel wird uns noch in den nächsten Jahren viele Sorgen bereiten.", "I believe this herb business is gonna destroy us in the years to come.");
talkingNPC:addCycleText("Ich war niemals unvorsichtig. Frauen und Kinder dürfen unvorsichtig sein, Männer nicht.", "I spent my life trying not to be careless. Women and children can be careless, but not men.");
talkingNPC:addCycleText("Ich glaube an Gold, Reichtümer und Macht. Wer an sie nicht ehrt, hat sie wohl schlichtweg nicht!", "I have faith in gold, wealth and power. Who doesn't honour theses, most probably simply hasn't them.");
talkingNPC:addCycleText("Miggs! Wo ist Miggs schon wieder! Einige Händler haben ihre 'Protektionsgebühr' diesen Monat noch nicht entrichtet.", "Miggs! Where is Miggs again? Some traders haven't paid their 'protection fee' this month.");
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
--------------------------------------------------------------------------------
-- NPC Name: Krudash                                                     None --
-- NPC Job:  Trader                                                           --
--                                                                            --
-- NPC Race: orc                        NPC Position:  371, 258, 0            --
-- NPC Sex:  female                     NPC Direction: north                  --
--                                                                            --
-- Author:   Rincewind                                                        --
--                                                                            --
-- Last parsing: August 09, 2010                         easyNPC Parser v1.00 --
--------------------------------------------------------------------------------

require("npc.base.basic")
require("npc.base.condition.language")
require("npc.base.consequence.state")
require("npc.base.talk")
module("npc.krudash", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hallo");
talkEntry:addTrigger("gr[üue]+[sß]+e");
talkEntry:addTrigger("guten tag");
talkEntry:addTrigger("Gruß");
talkEntry:addTrigger("Seid gegrüßt");
talkEntry:addTrigger("Guten Abend");
talkEntry:addTrigger("Tach");
talkEntry:addTrigger("Moin");
talkEntry:addTrigger("Greb");
talkEntry:addResponse("Greebas.");
talkEntry:addResponse("Hurr!");
talkEntry:addResponse("Hurr. %NPCNAME verkauft alles, du brauchst für machen gutes hacken 'nd plündarn! Hehe!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("good day");
talkEntry:addTrigger("greetings");
talkEntry:addTrigger("greets");
talkEntry:addTrigger("hail");
talkEntry:addTrigger("hello");
talkEntry:addTrigger("Be greeted");
talkEntry:addTrigger("Good morning");
talkEntry:addResponse("Greebas.");
talkEntry:addResponse("Hurr!");
talkEntry:addResponse("Hurr. %NPCNAME sell all you need. For good hack'n sack trip! Hehe!");
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
talkEntry:addResponse("Greebas.");
talkEntry:addResponse("Hurr!");
talkEntry:addResponse("Hurr. %NPCNAME sell all you need. For good Hack'n Sack-Trip! Hehe!");
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
talkEntry:addResponse("Greebas.");
talkEntry:addResponse("Hurr!");
talkEntry:addResponse("Hurr. %NPCNAME verkauft alles, du brauchst für machen gutes Hacken und Plündarn! Hehe!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("wie hei[sß]+t du");
talkEntry:addTrigger("wie hei[sß]+t ihr");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer seid");
talkEntry:addTrigger("wer bist");
talkEntry:addResponse("Mirr sein %NPCNAME ist. Und dars mein Laden. 'Hack'n Sack' - Hackn 'nd Plündern. Verkauf alles du brauchst fürr guttes Hackn 'nd plündarn.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Good bye");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare thee well");
talkEntry:addResponse("Farebas. Hab a good sack'n!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehabt euch wohl");
talkEntry:addResponse("Farebas. Hast gutt Plünderung!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Fareba");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Farebas. Hab a good hack'n.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Fareba");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("farebas. Hast gutt Hacken!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("Hurr. Mes allrighty! Good shop. Good husband. Good whelps.");
talkEntry:addResponse("Uh! Mes rich and migthy orc! Lot of slave me have.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addResponse("Hurr. Mirr alles gutt. Hab gutt Laden. Gutt Mann. Gutt welpen.");
talkEntry:addResponse("Uh! Mirr reich und mächtig Ork. Viele sklaven mirr hat.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("I be %NPCNAME is. And this my Shop. 'Hack'n Sack', sellin all stuff you need for good hack'n sack trip.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("I am");
talkEntry:addTrigger("I'm");
talkEntry:addResponse("Hurr, hurr. You like to buy?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ich bin");
talkEntry:addResponse("Hurr, hurr. Du kaufn willst?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hilfe");
talkEntry:addResponse("%NPCNAME 'verkaufen' und 'kaufen' viel Zeugs.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("helfen");
talkEntry:addResponse("%NPCNAME 'verkaufen' und 'kaufen' viel Zeugs.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("help");
talkEntry:addResponse("%NPCNAME 'sell' and 'buy' lots of stuff.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("jag");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Hurr! Jag mächtig ist viel! Nahe bei Chief 'nd Warlord!");
talkEntry:addResponse("Hurr... Jag seine mächtige Redskull! Und Kampfmeista von derr Klan. Wenn du lerne wolle, zerhauen Zeug? Gehe zu Jag!");
talkEntry:addResponse("Jag zermatscht alle Oomies bei große Turnier, wie Würma. hehe!");
talkEntry:addResponse("Bruddha Jag? Hurr... Mirr erinnere Tag von Green-Growl! Uh! Vatha gemocht das hat! Wirr sollte feiern diese Tag.");
talkEntry:addResponse("#me hält sich den Kopf: ' Du nix hammern dein Schädl gegen Jags Keule!'");
talkEntry:addResponse("Jag hart lustig Sammlung. Har-har! DU fragst Jag.");
talkEntry:addResponse("Jag mag Fleisch. Er imma hunger. hehe!");
talkEntry:addResponse("Jag schnelle, strak Kriega! Für Vatha, für Klan!");
talkEntry:addResponse("Jag? Hurr! Mir denkt er suchen neue Spitzohren tut.");
talkEntry:addResponse("Jag? Hurr! Du nix spreche schlecht uber Murgo, wenn er hört. Sonst er zermatsch dein Fresse! Har.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("jag");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hurr! Jag berreh mighte beh! Almost like dah Chiefeh and dah Warlord!");
talkEntry:addResponse("Hurr... Jag be mighte Red Skull and Drillmasta ob dha Clan! Ib yoo want learn smashing stuff, ask Jag!");
talkEntry:addResponse("Jag smashed all dah Ommies in dah big tournamant, dhus Jag beh First Smasha!");
talkEntry:addResponse("Broddha Jag? Hurr... Meh get dah Day ob Green Growl in mind. Dhat beh slaughta beh! Hurr! Dha Faddha like dhat! Yoo should celebrate dhat day!");
talkEntry:addResponse("#me holds his head: 'Avoid to feel Jag's maces at yoor head!'");
talkEntry:addResponse("Jag hub berreh nice collection, hurr!");
talkEntry:addResponse("Look for meat and bring dhat Jag! Jag beh alwaehs hungreh.");
talkEntry:addResponse("Jag beh proud and honorfull redskull, hurr!");
talkEntry:addResponse("Jag beh fast and strong warrior for dah Fadha and dha Clan!");
talkEntry:addResponse("Jag? Hurr! Mee thinks Jag beh looking for nuw Longears!");
talkEntry:addResponse("Jag? Hurr! Nub speak bad about dah Lok'uhm Murgo in front ob Jag. Jag smash yoor fais odhawise!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("krazen");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Hurr, Krazen nix klügster Ork ist. 'r geschmissn aus alte Stamm, alsgezündet Mantel von Chief, mit Feua!");
talkEntry:addResponse("Krazen? Er diese dumme Feua-macha, yubba?");
talkEntry:addResponse("Hur hur... du gehört? Krazen nix darf in Borgates Taverne mehr gehn. Er Verbot.");
talkEntry:addResponse("Yubba, Krazen EIN Freund hat. Ist Grimghor.");
talkEntry:addResponse("Du sollten Fragn, Krazen tanzt furr dirr. Ist große Spass, sehen dars!");
talkEntry:addResponse("Yub.. er gross, tragen verdammtes gutt Helm, schmutzig grün Robe. Uh? yubba.. er stinken.");
talkEntry:addResponse("Krazen nie gewesen gutte Kriega. Aba Kopf imma stecken überall drin...");
talkEntry:addResponse("Krazen gutte Ork ist, mir galubt. Du nur nix blicken in seine Augen. NIx starren ihn an.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("krazen");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hurr, Krazen nub da smartest orc meh see...'e was kick'd frum his own tribe-set the chiefess clothes on fire!");
talkEntry:addResponse("Krazen? He beh dat stoopid firestarter, yubba?");
talkEntry:addResponse("Hur hur...y'hear? Krazen nub allowed in Borgate's tavern no more...");
talkEntry:addResponse("Yubba, Krazen hab a friend named Grimghor. Meh fink it's his only one.");
talkEntry:addResponse("Yub! You shuld ask Krazen to do a dance fer ya! Funny as hell!");
talkEntry:addResponse("Yub...he's tall, wears dis damn awful metal hat, dirty green robe...Yar, dat's right, he smells too.");
talkEntry:addResponse("Krazen neber be gud warrior...always getting his head stuck in beehives...");
talkEntry:addResponse("Krazen friendly enough, meh fink. Jus' don't make eye contact.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("murgo");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Yubba, Murgo viel Stolz auf seine Töchta ist. Er'hja 'nd Ol'hja. Stark klugg Weibs sind.");
talkEntry:addResponse(" Murgo mit Krudash ist. Sie sein Weibs sein. Sie Mama von Er'hja 'nd Ol'hja.");
talkEntry:addResponse("Murgo beste freund ist Jag.");
talkEntry:addResponse("Mancha Orks witzig, sagen Murgo sein Blumens. Vleicht war. Aber jetzt er stampft zer alle Blumens!");
talkEntry:addResponse("Murrgo - dar Name von grosse Kriega, mit grosse Axt. Aber er nix bester in denken. er Blumenork war. Aber jetzt er zerstampfen all Blumens! Harr, harrrr!");
talkEntry:addResponse("Murgo, hurr hurr! Er Ork mit meißte Ehre ist. erster gewesen, der Trommel hatt.");
talkEntry:addResponse("Murgo verdammte Ass ist. Jede OrK wolle sein wie er sein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("murgo");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hurr, Murgo hired mes. Like most ob tha othas 'ere. All way from Kroch'gurak!");
talkEntry:addResponse("Murgo, hurr hurr! 'eh honrorables Orc is. Was first played drum. Yubba.");
talkEntry:addResponse(" Murgo 's damn ace is! Ebbry orc wanna like he be.");
talkEntry:addResponse("Yubba. Murgo very proud ob 'is doughtas is... Er'hja 'nd Ol'hja. Be stong 'n smart females are.");
talkEntry:addResponse("Murgo be with Krudash. She 'is female. She be mum ob Er'hja 'nd Ol'hja.");
talkEntry:addResponse("Murgo best friend be Jag.");
talkEntry:addResponse("Sum Orc joke Murgo, be Flower. Maybe was. But nuw 'eh stump all flowas!");
talkEntry:addResponse(" Murrrgo - dis beh name ob great warriar with great axe! But mes think he nub well in thinking. He be flowery flower orc was! Hurr! But nuw he stomps ob flowry! Harr, harrrr!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erhja");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Er'hja glücklich sich schätzen kann. Hatt sein klugg von Mama. Sein Ass von Papa. Krudash 'nd Murgo sind.");
talkEntry:addResponse("Er'hja gelernt hat bei MO'rurt. Und Jag. Tapfere, mutig Mädchen. Yubba!");
talkEntry:addResponse("Er'hja 'nd Ol'hja Schwesta sind. Yubba, auseehn beinahe wie gleich.");
talkEntry:addResponse("Jede Mann hoffen bekomm Er'hja oda Ol'hja zu Weibs. Sie gutte Weibs sind! Yubba.");
talkEntry:addResponse("#me lacht heiser: 'Ha-hr. Welpen wie Er'hja 'nd Ol'hja machen vieles Sorge für Mama 'nd Papa.'");
talkEntry:addResponse("Lustig geschicht... Er'hjas Papa Murgo züchtn Hounds. Aba Er'hja fürchten diese wie Hasal!");
talkEntry:addResponse("Uh, nix mirr frag. Er'hja, sie lieben Rabe! Sagen sie klugg sind. wasimma, mir sagt. Rabn Vogl sind. Vogl dummig.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erhja");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Er'hja could lucky be. Got tha smart ob 'er mom 'nd ace ob papy. Krudash 'nd Murgo are.");
talkEntry:addResponse("Er'hja was trained by Mo'rurt. And Jag. Brave girl. Yubba!");
talkEntry:addResponse("Er'hja 'nd Ol'hja be Sistahs. Yubba, almost look tha same.");
talkEntry:addResponse("Each Male hope to get Er'hja or Ol'hja as'n female! They good females! Yubba.");
talkEntry:addResponse("#me chukles hoarsely: 'Ha-hr. Whelps like Er'hja 'nd Ol'hja cuase musch trouble for tha mum and papy.'");
talkEntry:addResponse("Funny tale... Er'hjas papy Murgo breeds hounds. But she fear those like rabbitz!");
talkEntry:addResponse("Uh, nub ask mes. Er'hja, she love corbie! Mean they smart. Whubebba, mes say. Corbie be bird. Bird stupid.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ali[czs]");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Alize, Gnarh. Sie jammernd Kind bei Schmieda. Sie Krudashs Sklave ist. Sie schmelzn Erz, muss.");
talkEntry:addResponse("Du nix sein schwuach mit diesa jammernde Slkave. Sie lernen muss, zu sein STARK! Machen den Besitza Ehre. Yubba.");
talkEntry:addResponse("Har! Krudash gefangen auf eine Harfen. jetzt ALize, Sklave ist. Aber Jammern viel tut.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ali[czs]");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Alize, Gnarh. This bis thus weepy girl at forge. She be Krudash slave is. She hav to smelt you ore.");
talkEntry:addResponse("Nub be weak with those weepy slave. She hab to learn, be strong! Bring tha owner honor! Yubba.");
talkEntry:addResponse("Har! Krudash sacked her 'n sum harbour. Now she be her slave is. But weak weepy one.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("krudash");
talkEntry:addTrigger("Hacksack");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Hurr Hurr. Wie geht?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("krudash");
talkEntry:addTrigger("Hacksack");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hurr Hurr. How goin?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("morurt");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Mo'rurt. Er bester Jäga von KLan ist. erimma draußn ist. Jagt.");
talkEntry:addResponse("Mo'rurt schießt Pfeile, schnell wie wind. Stark wie Meer.");
talkEntry:addResponse("Mo'rurt Besitza von Stout ist. Stout sehr ehrenhaftiga Sklave ist. Yubba. Hat bekommen Armbrust und geht jagen mit Mo'rurt.");
talkEntry:addResponse("Har-ar. Mo'rurt stur wie Esel. Abar mirr sagt, is gutt. Alle in alles, er gerechter Meister ist.");
talkEntry:addResponse("Mo'rurt kommen von einsam Land. Wenig gelebt dort. Murgo ihn gefunden hatt als Mo' nach Kroch'gurak gekommen für den Winta.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("morurt");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Mo'rurt. Hurr he be best archer of Clan be. He allway out ob cave huntin!");
talkEntry:addResponse("Mo'rurt shoot 'is arrow fast like wind. Strong like Sea.");
talkEntry:addResponse("Mo'rurt be owner ob Stout. Stout be honorable slave is. Yubba. Got crossbow and joins Mo'rurt on hunting.");
talkEntry:addResponse("Har-ar. Mo'rurt is mulish. But 'e say he's just right. But all'nall he fair master is.");
talkEntry:addResponse("Mo'rurt come frome sum lonly lands. Nub much lived there. Was picked up by Murgo, wehn he walked to Kroch'gurak for winta.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("olokwa");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("uh, Olokwa! Er alte blind Ork ist. Aba viel klugg. Viel Weiß.");
talkEntry:addResponse("Olokwa Seher ist. Yubba. Is beeindruckend... aba imma bisschen gruselig.");
talkEntry:addResponse("Wenn mir getroffen Olokwa, erstes mal, er erraten mein Name! Er gesehen hat. Ahnen, es ihm geflüstert haben.");
talkEntry:addResponse("Olokwa große Kraft von Wissenheit hatt. Von geistiges Aug. Er blindt. Aber sehen mehr als viele andere.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("olokwa");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Uh, Olokwa! He be old blind orc is. Very smart 'nd prudent.");
talkEntry:addResponse("Olokwa be a seer. Yubba. As impressive is... it still kind ob scary.");
talkEntry:addResponse("First tjem mes met Olokwa, 'e guessed mes Name. He saw it...Tha ancestors told 'im.");
talkEntry:addResponse("Olokwa hab great powa ob wisdom. Ob ghostly eye. Altough he blind, he see more than most othas.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("sogg");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Sogg Beermug! Guttgutt. Er ass ork ist. Imma geben aus, runde von Booze. Imma gibt Bier zu tapfere Kriegas.");
talkEntry:addResponse("#me lacht: 'Sogg, Fässawächta is. Aba meißte Zeit er saufn alles bewachte Booze allein aus! Har-har!'");
talkEntry:addResponse("Sogg auch heißt Beermug. Sogg Beermug! Du ratest, warum...");
talkEntry:addResponse("Mirr gehört Murgo gefundn Sogg in eine dreckig Taverne. Abgefüllt mit Bohnen-Booze. Als er aufgewacht... er unser neue Fässawächta war.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("sogg");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Sogg Beermug! Wellwell. He be ace orc is. Allway pay a round ob booze. Allway give Bear for brave warrior.");
talkEntry:addResponse("#me laughs: 'Sogg be tha barrel guard. But most ob time he drink tha guarded booze by him own! Har-har!'");
talkEntry:addResponse("Sogg name also be Beermug. Sogg Beermug!  Make a guess, why for...");
talkEntry:addResponse("Mes hered Murgo picked Sogg up, in some scummy tavern, filled up with beans booze. As he waked up... he was us new barrelguard.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("stout");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Stout Sklave ist von Mo'rurt. Er gutte Sklave. Bringt besitza viele Ehre.");
talkEntry:addResponse("Auch wenn Stout ist OOmie,er allrichtig ist. Er tapfere Sklave. Mo'rurt sehr stolz issigt.");
talkEntry:addResponse("Hurr, Stout stark Sklave ist. Nix wie diese jammernde Mädchen 'nd diese listig Halbling. Stout bekommen Ehre. Die andere Zwei, bekomme Strafe.");
talkEntry:addResponse("Stout gekommn mit Mo'rurt zusamme. Mir denken, er seit lange Zeit Sklave ist.");
talkEntry:addResponse("Mirr sicha sein, Mo'rurt mehr ist, als Meister von Stout. Sucha beide sowas wie Freunde sind.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("stout");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Stout be slave ob Mo'rurt. He good slave. Make tha owner much honor.");
talkEntry:addResponse("Altough he Oomie is, he be allrighty. Stout brave slave. Mo'rurt be proud ob 'hm.");
talkEntry:addResponse("Hurr, Stout strong slave. Nub like thus weepy girl 'nd tha dastardly halfer. Stout 'll earn great honor. Tha otha both earn punsihment.");
talkEntry:addResponse("Stout arrived togetha with Mo'rurt. Me guess Stout be slave since long time.");
talkEntry:addResponse("Me sur Mo'rurt be more to Stout than Masta. Sure both be weird kind ob friend.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tom");
talkEntry:addTrigger("berry");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Garh! Disa hintalistig Halbling! Thoma' Berryar'! Einmal er vermischt Glasscherbn mit Krudashs fressen.");
talkEntry:addResponse("Garh! Disa hintalistig Halbling! Thoma' Berryar'! Einmal er geflohen durch Berge. Aber unsre Hounds ihn erlegt danieder! Jezt er muss kloppen Steins.");
talkEntry:addResponse("Garh! Disa hintalistig Halbling! Thoma' Berryar'! Du im Auge hast sein kleine Fäuste. ergerne haut dirr zwischen Beine!");
talkEntry:addResponse(" Sie gesagt, Thoma' Berryar'. er Grund ist, Murgo 'nd Krudas nix haben mehr Welpen. wassimma das heißen.");
talkEntry:addResponse("Murgo geschnappt diese Halbling irgendwohig nahe von Briar Dorf. SCheint es nix erstemal, für Thoma' war.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tom");
talkEntry:addTrigger("berry");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Garh! Thus dastardly halfer! Thoma' Berryar'! Once he tried to mix cullet with Krudash's food.");
talkEntry:addResponse("Garh! Thus dastardly halfer! Thoma' Berryar'! Once he tried to escape tha mountains. But us hounds hunt 'hm down. Now 'e hab to batter stones.");
talkEntry:addResponse("Garh! Thus dastardly halfer! Thoma' Berryar'! Watch 'hs tiny fists. He like to smash you beetween legs.");
talkEntry:addResponse("They say, Thoma' Berryar'. He be reason, Murgo'n Krudash nub got more whelps. Whubabba thut mean.");
talkEntry:addResponse("Murgo sacked thus Halfer sumwhere close tha Briar hamlet. Seems it wasn't tha first time for Thoma' Berryar'.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("thud");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Hurr hurr. Thud sammeln Trophäe. Auch wenn er ist nix klügsta, er gutte Ork!");
talkEntry:addResponse("Thud genannt Thud. *lacht kichernd* Weil er mag verkloppen Leutz.");
talkEntry:addResponse(" Hurr, Thud dumm wie Dreck ist. Aber wer braucht Denkmuskel, wenn hatt  rießig Muskels sowieso? Hu!?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("thud");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hurr hurr. Thud collect trophy. Altough some clumsy. He good Orc.");
talkEntry:addResponse("Thud, is named Thud. *chukles* Cause 'e like to thud people.");
talkEntry:addResponse("Hurr. Thud be dump like mudd. Bud who need brainmuscle, ib you hab huge muscle anyway? Hu!?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("brute");
talkEntry:addTrigger("boze");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Brute Booze! Ist name von meißt berühmte Orkabenteura! er großße REisenda. Jäga von viels schrecklich Bestien!");
talkEntry:addResponse("Brute Booze, gesoffen Booze in jeda taverne von Illarion, er versprechen! Her erschlagen gigantisch Schlange von Gynk zwei malig. Un' genommen Prinzess von Khensarra zu Weibs!");
talkEntry:addResponse("'llgutt. Brute sein eine von alte Helden. Mit Respekt furr Tradition. Und dramatische Geschichte.");
talkEntry:addResponse("Uh, mirr wünschen mirr könnte sein wie Brute Booze. Wenn mir wollen hören Geschicht von fremde Land, mir frägt Brute.");
talkEntry:addResponse("Sie gesagt, Brute Booze wissen viels über fremde Lända. Sicha er gezogen durch alle von ihnen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("brute");
talkEntry:addTrigger("boze");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Bute Booze! Is name ob most famous orc adventurer! He big Travela. Hunta ob several cruel biests!");
talkEntry:addResponse("Brute Booze, drunk Booze in each tavern ob Illarion, he promise! He slay tha giant Snake ob Gynk twice. An' took tha princess ob Khensarra as female!");
talkEntry:addResponse(" 'llrigthy. Brute 's one ob old heros. With feeling for tradition. An' dramatic ob tale!");
talkEntry:addResponse("Uh, I wish I cuold be like Brute Booze. Ib mes wanna 'ere tale ob strange land, mes allways ask 'hm.");
talkEntry:addResponse("They say Brute Booze know lot about strange lands. Surely he traveled trough all ob them.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("grimlug");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("grumlug sein Schamane ist. Wissen viel üba Götta. Viel üba Ritus.");
talkEntry:addResponse("Murgo getrofffen Grimlug, in Kroch#gruak. ist gutt, er jetzt hier ist.");
talkEntry:addResponse("Grimlug erzählen lange. Reden Viel. Weiß viel.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("grimlug");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Grimlug be Shaman is. Know many bout gods. Many bout rite.");
talkEntry:addResponse("Hurr. Murgo picked thus shaman up sumwhere 'n Kroch'gurak. Is good 'e here now.");
talkEntry:addResponse("Grimlug talk much. Long tale. Know much.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("nork");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Nork Soldat ist. Von Ogretoe. er bekümmern Güta und Versorgung dort.");
talkEntry:addResponse("Uh, d' Kriega von Lager Ogretoe wirklich sind tapfer! Mirr gehört, Oger ist mächtig Gegner.");
talkEntry:addResponse("Uh, Ist Nork diese hässliche Ork, in Lager von Ogerland?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("nork");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Nork be soldier ob Ogretoe. He take care ob Supply there.");
talkEntry:addResponse("Uh, tha soldiers at Camp Ogretoe such brave! Mes 'ered tha Ogres be stong enemie.");
talkEntry:addResponse("Uh, is Nork thus ugly one, at tha ogreland-camp?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("vigo");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Captain Viggo! Mir so viel Glück, er und tapfere Kriega, beschütze unser Erz von verdammte Ogers.");
talkEntry:addResponse("Captain Viggo ist Kommandierer von Lager Ogretoe. er imma braucht Kriega!");
talkEntry:addResponse("Hurr. Ohne Viggo und 's Kriega, wirr nix würde bekommen Erz. Mir froh, Murgo gefunden ihn hatt!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("vigo");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Captain Viggo! Mes such glad, he 'nd s brave soldiers defend us ore from tha damn Ogres.");
talkEntry:addResponse("Captain Viggo is commanda ob Camp Ogretoe. He allway hire soldiers!");
talkEntry:addResponse("Hurr. Without Viggo 'nd his soldiers wes wouldn't abe to get ore. Mes glad Murgo pick'ed' hm up.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("budva");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Hurr. Budvar Buddler ist. er graben nach Erz. In Lager, Ogretoe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("budva");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hurr, Budvar be digger is. He digg for ore at tha Ogretoe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("olhja");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Ol'hja ist Tochta von Murgo. Sie Kundschafta in Laga von Ogretoe. Hurr Hurr.");
talkEntry:addResponse("Ol'hja ist eine von beste Kundschafta von Captain Viggos Kriegas.");
talkEntry:addResponse("Er'hja 'nd Ol'hja Schwestas sind. Yubba, sie gleich aussehen. Nahezu.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("olhja");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Ol'hja's tha doughta ob Murgo. She be scout in tha ogretoe-camp. Hurr Hurr.");
talkEntry:addResponse("Ol'hja s one ob most skilled scouts under Captain viggos soldiers.");
talkEntry:addResponse("Er'hja 'nd Ol'hja be Sistahs. Yubba, almost look tha same.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yago");
talkEntry:addTrigger("helgi");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Hurr. Yago 'nd Helgi sind tapfere Kriega! Yubba.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yago");
talkEntry:addTrigger("helgi");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hurr. Yago 'nd Helgi be brave soldier. Yubba.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("moshran");
talkEntry:addTrigger("god");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Gosh! NIcht sagst diese Name! Bassa fragen Schamane über Vatha.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("moshran");
talkEntry:addTrigger("god");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Gosh! Nub say tha name! Bettu talk to Shaman about tha fatha.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("cherga");
talkEntry:addTrigger("icy witch");
talkEntry:addTrigger("eis Hex");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("HUrr. Eisig Hexe, gottin von Ahnen ist. Du fragst Grimlug!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("cherga");
talkEntry:addTrigger("icy witch");
talkEntry:addTrigger("eis Hex");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hurr. Tha icy witch, be god ob ancestors. Ask Grimlug for!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("where com");
talkEntry:addTrigger("krochgurak");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Kroch'gruak! Ist, wo meiße Orks von uns komme her von.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("where com");
talkEntry:addTrigger("krochgurak");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Kroch'gurak! Is where most ob us orcs come from.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ogetoe");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Hurr. Captain Viggo, 'nd seine Kriega kämpfn dort furr unsa Erz!");
talkEntry:addResponse("Hurr, ist Ort wo Erz ist. Aba alles voll mit wütende Ogers ist. Du gehst mit Kriega nur dorthin.");
talkEntry:addResponse("Ogretoe sein Lager von Captain Viggo. Er beschützt Miene gegen Oger!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ogetoe");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hurr. Captain Viggo, 'nd his soldiers fight there for our ore!");
talkEntry:addResponse("Hurr. Is Place where ore was found. But full ob angry ogre is. Take warrior with youb, to walk there.");
talkEntry:addResponse("Ogretoe be tha camp ob Captain Viggo. It defend ore mine agins ogres!");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me leckt sich kurz über die Lippen. Dann streckt sie die Zunge heraus und berührt damit ihr hübsches Näschen.", "#me licks her lips. Then she shwos her tounge and taps her cute nose.");
talkingNPC:addCycleText("Hack'n Sack! Hier du alles kaufen kannst. Du brauchen für gutt Plünderei!", "Hack'n sack! here you buy all stuff for well sack trip.");
talkingNPC:addCycleText("Uh, mirr so stolz auf mein kleine Ol'hja und mein kleine Er'hja!", "Uh, mes be so proud ob mes littl Ol'hja and mes littl Er'hja!");
talkingNPC:addCycleText("Gnahrr! Wo mein faule Sack von Mann ist?", "Gnahrr! Where my lazy husband be is?");
talkingNPC:addCycleText("#me stochert mit ihrem Finger an einem der beiden Kieferzähnen herum. ", "#me digs with one of his fingers between her tusks.");
talkingNPC:addCycleText("#me schnaubt ein wenig.", "#me snorts quietly.");
talkingNPC:addCycleText("#me rubbelt mit den Fingernägeln an einem rostendem Eisenteil. Doch der Rost scheint sich hartnäckig darauf zu halten.", "#me rubs with fingernails at a rusty pice of iron. But the rust hold it's stand.");
talkingNPC:addCycleText("#me kichert und nuschelt: 'Snu-snu...'", "#me chukles and mumbles: 'Snu-Snu...'");
talkingNPC:addCycleText("#me krazt sich knurrend am Kopf.", "#me scratches her head with a annoyed snarl.");
talkingNPC:addCycleText("#me nimmt einen Schluck aus einer kleinen schmuddeligen Flasche. Scharfer alkoholischer Dunst steigt in die Luft.", "#me takes a gulp from a grubby little bottle. A strong stench of alcohol fills the air.");
talkingNPC:addCycleText("#me klappert in einem einfachen ansteckenden Rythmus auf einem Holzstück.", "#me chatters with an simple catching rythm on a piece of wood.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(5);
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
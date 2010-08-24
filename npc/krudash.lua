--------------------------------------------------------------------------------
-- NPC Name: Krudash                                                  Galmair --
-- NPC Job:  trader                                                           --
--                                                                            --
-- NPC Race: orc                        NPC Position:  368, 260, 0            --
-- NPC Sex:  female                     NPC Direction: northwest              --
--                                                                            --
-- Author:   Rincewind                                                        --
--                                                                            --
-- Last parsing: August 24, 2010                         easyNPC Parser v1.01 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (4, 368, 260, 0, 7, 'Krudash', 'npc.krudash', 1, 2, 0, 47, 37, 10, 193, 201, 152);
---]]

require("npc.base.basic")
require("npc.base.condition.chance")
require("npc.base.condition.language")
require("npc.base.consequence.state")
require("npc.base.talk")
module("npc.krudash", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hilfe");
talkEntry:addResponse("Ich, %NPCNAME 'verkaufe' und 'kaufe' viele Dinger! Taghta?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("helfen");
talkEntry:addResponse("Ich, %NPCNAME 'verkaufe' und 'kaufe' viele Dinger! Taghta?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("help");
talkEntry:addResponse("Me, %NPCNAME 'sell' and 'buy' lots of stuff! Taghta?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hello");
talkEntry:addTrigger("Greetings");
talkEntry:addTrigger("Be greeted");
talkEntry:addTrigger("Greet");
talkEntry:addTrigger("Hail");
talkEntry:addTrigger("Good day");
talkEntry:addTrigger("Good morning");
talkEntry:addTrigger("Good evening");
talkEntry:addResponse("Greebas.");
talkEntry:addResponse("Hurr!");
talkEntry:addResponse("Hurr. Me, %NPCNAME sell all you need. For good hack'n sack trip! Hehe!");
talkEntry:addResponse("Latha math!");
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
talkEntry:addTrigger("mit dir");
talkEntry:addResponse("Greebas.");
talkEntry:addResponse("Hurr!");
talkEntry:addResponse("Hurr. Ich, %NPCNAME verkaufe alles, was 'ner wie du braucht für's hacken und plündarn! Hehe!");
talkEntry:addResponse("Latha math!");
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
talkEntry:addResponse("Hurr. %NPCNAME sell all you need. For good hack'n sack trip! Hehe!");
talkEntry:addResponse("Latha math!");
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
talkEntry:addResponse("Hurr. Ich, %NPCNAME verkaufe alles, was 'ner wie du braucht für's hacken und plündarn! Hehe!");
talkEntry:addResponse("Latha math!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Good bye");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare thee well");
talkEntry:addResponse("Farebas. Have a good sackin'!");
talkEntry:addResponse("Slàn leibhslàn! - So sagens wir. Tagtha?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehabt euch wohl");
talkEntry:addResponse("Farebas. Ne Gute Plünderung wünsch ich noch!");
talkEntry:addResponse("Slàn leibhslàn! - So sagens wir. Tagtha?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addTrigger("See you");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Farebas. Have a good sackin'!");
talkEntry:addResponse("Slàn leibhslàn! - So sagens wir. Tagtha?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Farebas. Ne Gute Plünderung wünsch ich noch!");
talkEntry:addResponse("Slàn leibhslàn! - So sagens wir. Tagtha?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("Hurr. Mes allrighty! Good shop. Good husband. Good whelps.");
talkEntry:addResponse("Uh! I'm a rich and migthy orc! Lot's of snagas are mine!");
talkEntry:addResponse("Hrmpf!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befinden");
talkEntry:addResponse("Hurr. Mirr gehts gut. Hab nen feinen Laden. N'guten Mann. Und gute welpen!");
talkEntry:addResponse("Hrmpf!");
talkEntry:addResponse("Uh! Ich bin ne reiche und mächtige Ork. Und alle Snagas tun, was ich befehle.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("I am %NPCNAME. And this my Shop. 'Hack'n Sack', sellin all stuff you need for good hack'n sack trip.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Ich bin %NPCNAME. Und dars ist mein Laden. 'Hack'n Sack' - Hacken und Plündern! Verkaufe alles was du brauchst fürr guttes Hackn und plündarn.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("Gâsh! I learned the dealing in Gynk! Yp-Yp.");
talkEntry:addResponse("Hrach! Do you know the lizard Eliza? She sells swords, a horse farrier would be able to make them sharper.");
talkEntry:addResponse("Murgo is my husband! Er'hja and Ol'hja are us whelps. Taghta?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Gâsh! Ich hab das Handeln in Gynk gelernt! Yp-Yp.");
talkEntry:addResponse("Hrach! Kennst' die Echse Eliza? Sie verkauft Schwerter, ein Hufschmied könnt sie schärfer machen!");
talkEntry:addResponse("Murgo ist mein Mann! Er'hja und Ol'hja unsere Welpen. Taghta?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("I'm the arms dealer in this town! And all those Snagas follow my command! Groch!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Ich bin der Waffenhändler in dieser Stadt! Und alle diese Snagas tun, was ich sag! Groch!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I'm the arms dealer in this town! And all those Snagas follow my command! Groch!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Ich bin der Waffenhändler in dieser Stadt! Und alle diese Snagas tun, was ich sag! Groch!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hrmpf!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Hrmpf!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("I am");
talkEntry:addTrigger("my name");
talkEntry:addResponse("Hurr, hurr. What do you buy?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ich bin");
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Hurr, hurr. Was willst du kaufen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("murgo");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Yubba, Murgo ist sehr Stolz auf seine Töchta! Er'hja 'nd Ol'hja. Stark und kluge Weibs sind sie Yb-Yb.");
talkEntry:addResponse(" Murgo ist mit Krudash. Ich bin sein Weib und Mutter von Er'hja 'nd Ol'hja.");
talkEntry:addResponse("Murrgo - dies ist der Name vom grossen Krieger, mit grosser Axt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("murgo");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Murgo, hurr hurr! 'eh honrorables Orc is. Was first played drum. Yubba.");
talkEntry:addResponse(" Murgo 's damn ace is! Ebbry orc wanna like he be.");
talkEntry:addResponse("Yubba. Murgo very proud ob 'is doughtas is... Er'hja 'nd Ol'hja. Be stong 'n smart females are.");
talkEntry:addResponse("Murgo be with Krudash. I'm his female, be the mother of Er'hja 'nd Ol'hja.");
talkEntry:addResponse(" Murrrgo - dis beh name ob great warrior with great axe! But mes think he nub well in thinking.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("er hja");
talkEntry:addTrigger("erhja");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Er'hja kann sich glücklich schätzen. Hatt den Kopf von Mama und das Gâsh von Papa. Krudash und Murgo sinds, yubba.");
talkEntry:addResponse("Er'hja hat gelernt bei Mo'rurt. Und Jag. Tapferes, mutiges Mädchen. Yubba!");
talkEntry:addResponse("Er'hja 'nd Ol'hja sind Schwestern. Yubba, auseehn tun sie beinahe gleich.");
talkEntry:addResponse("Jeder Mann hofft, das er Er'hja oder Ol'hja zum Weib bekommt. Sie gutte Weibs sind! Yubba.");
talkEntry:addResponse("#me lacht heiser: 'Ha-hr. Welpen wie Er'hja 'nd Ol'hja machen für Mama und Papa viele Sorgen...'");
talkEntry:addResponse("Lustige Geschichte... Er'hjas Papa Murgo züchtet Hunde. Aber Er'hja fürchtet diese wie 'n Hase!");
talkEntry:addResponse("Uh, frag mich nicht. Er'hja, sie liebt Raben! Sagt sie sind klug. Grütze! Raben sind Vögl. Vögl sind dumm.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("er hja");
talkEntry:addTrigger("erhja");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Er'hja should be lucky. Got the smartness ob 'er mom 'nd the gâsh ob papy. Krudash 'nd Murgo are.");
talkEntry:addResponse("Er'hja was trained by Mo'rurt. And Jag. Brave girl. Yubba!");
talkEntry:addResponse("Er'hja 'nd Ol'hja be Sistahs. Yubba, almost look like same same.");
talkEntry:addResponse("Each Male hope to get Er'hja or Ol'hja as'n female! They good females! Yubba.");
talkEntry:addResponse("#me chukles hoarsely: 'Ha-hr. Whelps like Er'hja 'nd Ol'hja cuase musch trouble for tha mum and papy.'");
talkEntry:addResponse("Funny tale... Er'hjas papy Murgo breeds hounds. But she fear those like rabbitz!");
talkEntry:addResponse("Uh, nub ask mes. Er'hja, she love corbie! Mean they smart. Whubebba, mes say. Corbie is a bird. Birds are stupid.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ali[czs]");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Alize, Gnarh. Sie jammerndes Kind bei Schmieda. Sie ist mein Snaga!. Sie schmelzn Erz, muss.");
talkEntry:addResponse("Du nix sein schwuach mit diesa jammernde Slkave. Sie lernen muss, zu sein STARK! Machen den Besitza Ehre. Yubba.");
talkEntry:addResponse("Har! Krudash gefangen auf eine Harfen. jetzt ALize, Sklave ist. Aber Jammern viel tut.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ali[czs]");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Alize, Gnarh. This bis thus weepy girl at forge. She is my snaga!. She hav to smelt you ore.");
talkEntry:addResponse("Nub be weak with those weepy slave. She hab to learn, be strong! Bring tha owner honor! Yubba.");
talkEntry:addResponse("Har! Krudash sacked her 'n sum harbour. Now she be her slave is. But weak weepy one.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("krudash");
talkEntry:addTrigger("Hacksack");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Hurr Hurr. Ciamar a'seibh! Wie geht?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("krudash");
talkEntry:addTrigger("Hacksack");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hurr Hurr. Ciamar a'seibh! How goin?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("morurt");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Mo'rurt. Er bester Jäga von Klan ist. Er imma draußn ist. Jagt.");
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
talkEntry:addResponse("Uh, Ist Nork diese hässliche Mann, in Lager von Ogerland?");
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
talkEntry:addResponse("Captain Viggo ist der Kommandierer von Lager Ogretoe. er imma braucht Kriega!");
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
talkEntry:addTrigger("ol hja");
talkEntry:addTrigger("olhja");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Ol'hja ist Tochta von Murgo. Sie Kundschafta in Laga von Ogretoe. Hurr Hurr.");
talkEntry:addResponse("Ol'hja ist eine von beste Kundschafta von Captain Viggos Kriegas.");
talkEntry:addResponse("Er'hja 'nd Ol'hja Schwestas sind. Yubba, sie gleich aussehen. Nahezu.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ol hja");
talkEntry:addTrigger("olhja");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Ol'hja's tha doughta ob Murgo. She be scout in tha ogretoe-camp. Hurr Hurr.");
talkEntry:addResponse("Ol'hja s one ob most skilled scouts under Captain viggos soldiers.");
talkEntry:addResponse("Er'hja 'nd Ol'hja be Sistahs. Yubba, almost look tha same same.");
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
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addTrigger("archmage");
talkEntry:addTrigger("Erzmagier");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Ch-h! Astute wizard... Runewick rat!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addTrigger("archmage");
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Ch-h! Der listige Zauberer... Runewickratte!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Gnarh! Those are loathsome ...*grunt*... Scheschnaks! Maggots shall eat their figgin!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Gnarh! Das sind widerliche ...*grunzt*... Scheschnaks! Maden sollen ihren Wabbel fressen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Glushdâsh! He is a damn dwarf! But they are good for trading, isn't it, isn't it?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Glushdâsh! Er ist, 'n verdammter Zwerg! Aber mit denen ist gut handeln, nicht wahr, nicht wahr?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Why!? Gol-gol! Here, a ritch orcess is allowed to do whatever she want to do! And all snagas do what I order. Hurr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Warrrum!? Gol-gol! Hier kann eine reiche Ork machen was sie will! Und alle Snagas tun was ich sage. Hurr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("königin");
talkEntry:addTrigger("queen");
talkEntry:addTrigger("edwards");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hroar! I heared, the queens guards are mokeys, wich got trousers! Har!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("königin");
talkEntry:addTrigger("queen");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Hroar! Ich hab gehört, der Königin Leibgarde sind ein paar Affen denen man Hosen angezogen hat! Har!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("They say, if pigs would able to walk on two legs... even the gods can't discern them from Cadomyrs folk. Gosch!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Es heißt, würden Schweine aufrecht gehen... könnten nichtmal die Götter sie von den Cadomyrern unterscheiden. Gosch!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hurr. There are lots of Snagas. But only the humanz are allowed to order those Snails. Grot.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Hurr. Dorts gibts ne Menge Snagas. Aber nur die dummen Menschenz dürfen sie zur Schneke machen. Grot.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Apart from Kroch'Gurak, Gynk is the best place for people. *grunts*... Altough the sun is hot there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Abgesehen von Kroch'Gurak, ist Gynk der beste Platz für die Leute. *grunzt*... Auch wenn die Sonne dort heiß ist.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Scheschnaks. Those are all dirty scheschnak-monkeys. Gosch!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Scheschnaks. Das sind alles dreckige Scheschnak-Affen. Gosch!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("The ancestors should praised, hâll. Praise my fathers.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Die Vorfahren sein gepriesen, hâll. Ehre meinen Vätern.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("moshran");
talkEntry:addTrigger("god");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Gosh! Du niemals sagst diesen Namen! Besser fragen Schamane über Vatha.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("moshran");
talkEntry:addTrigger("god");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Gosh! Nub say tha name! Better talk to Shaman about tha fatha.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("cherga");
talkEntry:addTrigger("icy witch");
talkEntry:addTrigger("eis Hex");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Hurr. Eisig Hexe, gottin von Ahnen ist. Du fragst Grimlug!");
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
talkEntry:addResponse("Hrach. Ich komme aus Khensarra. Aber viele Orks sind aus Kroch'gurak. Dort'ists wo die Clans im Winter lagern.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("where com");
talkEntry:addTrigger("krochgurak");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hrach. I come frome Khensarra. But most orcs come frome Kroch'gurak. There is, where the Clans camp in winter.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ogetoe");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Hurr. Captain Viggo und seine Kriega kämpfn dort furr unsa Erz!");
talkEntry:addResponse("Hurr, ist der Ort wos Erz gibt. Aber es ist voll mit wütenden Ogern ist. Du gehst nur mit starken Kriegern dorthin!");
talkEntry:addResponse("Ogretoe ist's Lager von Captain Viggo. Er beschützt die Miene gegen Oger!");
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
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I trade... and my snagas do all the work. So there is nothing to do for a Maggot like you!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Ich handle... und meine Snagas machen alle Arbeit. Also gibt's nix zu tun für ne Made wie dich!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addResponse("I trade... and my snagas do all the work. So there is nothing to do for a Maggot like you!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addResponse("Ich handle... und meine Snagas machen alle Arbeit. Also gibt's nix zu tun für ne Made wie dich!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(20));
talkEntry:addResponse("Taghta!");
talkEntry:addResponse("Puny little Maggot.");
talkEntry:addResponse("Uh-h?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(20));
talkEntry:addResponse("Taghta!");
talkEntry:addResponse("Winzige kleine Made.");
talkEntry:addResponse("Uh-h?");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me leckt sich kurz über die Lippen. Dann streckt sie die Zunge heraus und berührt damit ihr hübsches Näschen.", "#me licks her lips. Then she shwos her tounge and taps her cute nose.");
talkingNPC:addCycleText("Hack'n Sack! Hier Kannst du alles kaufen. Was 'ner wie du braucht für ne gutte Plünderei!", "Hack'n sack! here you buy all stuff for well sack trip.");
talkingNPC:addCycleText("Uh, ich bin so stolz auf meine kleine Ol'hja und meine kleine Er'hja!", "Uh, mes be so proud ob mes littl Ol'hja and mes littl Er'hja!");
talkingNPC:addCycleText("Gnahrr! Wo ist mein fauler Sack von Mann?", "Gnahrr! Where my lazy husband be is?");
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
mainNPC:setLookat("Eine sinnliche Orkfrau mit wilden schwarzen Haaren. Sie hat ein süßes Näschen und spitze kleine Hauer. Achtsam überblickt sie den Marktplatz.", "A voluptous orcess qith wild black hair. She have a cute nose and pointy little tusks. Observantly she glances the marketplace.");
mainNPC:setUseMessage("Fass mich nicht an! Oder ich mach disch Kebab! Alda!", "Do not touch me!");
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
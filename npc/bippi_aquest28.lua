-- INSERT INTO npc VALUES (nextval('npc_seq'),2,787,795,0,4,false,'Bippi','npc_bippi_aquest28.lua',0);

require("npc.base.autonpcfunctions")
require("quest_aquest28");    --the quest file
module("npc.bippi_aquest28", package.seeall)

function useNPC(user,counter,param)
    thisNPC:increaseSkill(1,"common language",100);
    thisNPC:talkLanguage(CCharacter.say, CPlayer.german, "Finger weg!");
    thisNPC:talkLanguage(CCharacter.say, CPlayer.english, "Don't you touch me!");
end

function initializeNpc()
    return;
end;

function dummy()
    if TraderFirst then
        return true;
    end

    npc.base.autonpcfunctions.InitTalkLists();

    -- ********* START DYNAMIC PART ********

    -- ********* START DYNAMIC PART ********

    -- Note: ALWAYS add commentaries in an extra line!
    -- This Template is used for NPCs that stay at one place (Shopkeepers, tavern owners, etc.)
    -- Bippi the peasant, he wants you to take care of his cows for him
    -- Replace to own liking
    -- male/female
    -- human, elf, dwarf, lizardman, orc, halfling...
    -- In front of his farm, near Runewick
    -- north, northeast, east, southeast, south, southwest, west, northwest
    SetRadius(0);
    -- Keep radius=0 and the Npc won't walk around
    QuestID = 28;
    -- Please assign an ID if you use queststatus. Do not use an ID twice unless intended.
    -- Quest by Ardian
    -- Dialogue by Faladron
    -- Queststatus Overview
    -- 0: No Quest taken
    -- Others: I have no effing clue, ARRRRRDIAAAAN!?
    
    -- Help  This might screw with the stringfind in line 560, please check
    AddTraderTrigger("Help","");
    AddConsequence("inform","[Game Help] This NPC is Bippi the peasant. Keyphrases: milk,cow,farmhand,task,'what is my task?'.");
    AddTraderTrigger("Hilfe","");
    AddConsequence("inform","[Spielhilfe] Dieser NPC ist Bippi der Bauer. Schlüsselwï¿½rter: Milch,Kuh,Helfer,Aufgabe,'Was ist meine Aufgabe?'.");
    
	-- General Speech
    -- First contact
    AddTraderTrigger("Hello","Oh greetings, traveler! How nice of you to drop by, can I offer you a bowl of 'milk'?");
    AddAdditionalTrigger("Greetings");
    AddAdditionalTrigger("Be greeted");
    AddAdditionalTrigger("Greet");
    AddAdditionalTrigger("Hail");
    AddAdditionalTrigger("Good day");
    AddAdditionalTrigger("Good morning");
    AddAdditionalTrigger("Good evening");
    AddCondition("qpg","=",0);
    AddAdditionalText("Hello there! Oh you sure look tired. May I offer you a bowl of milk, it's replenishing.");
    AddAdditionalText("Hiho! So you've found your way to old Bippi here. You're here to try my famous milk, I guess?");
    AddConsequence("inform","Milk sounds like a wonderful idea, but you better ask him first what kind of milk he has.");
    AddTraderTrigger("Grï¿½ï¿½e","Oh Grï¿½ï¿½e, Reisender! Besuch freut mich immer, darf ich euch eine Schale 'Milch' anbieten?");
    AddAdditionalTrigger("Gruï¿½");
    AddAdditionalTrigger("Seid gegrï¿½ï¿½t");
    AddAdditionalTrigger("Guten Tag");
    AddAdditionalTrigger("Guten Abend");
    AddAdditionalTrigger("Mahlzeit");
    AddAdditionalTrigger("Tach");
    AddAdditionalTrigger("Moin");
    AddAdditionalTrigger("mit dir");
    AddCondition("qpg","=",0);
    AddAdditionalText("Hallo da! Oh ihr seht aber müde aus. Darf ich euch eine Schale Milch aufwarten, als Stï¿½rkung?");
    AddAdditionalText("Hiho! Da habt ihr also zum alten Bippi gefunden. Ihr kommt bestimmt um meine berï¿½hmte Milch zu probieren.");
    AddConsequence("inform","Milch hï¿½rt sich jetzt sehr verlockend an, aber du fragst ihn besser vorher um was für eine Milch es sich handelt.");
    
    AddTraderTrigger("Hiho","Oh greetings, traveler! How nice of you to drop by, can I offer you a bowl of 'milk'?");
    AddAdditionalTrigger("Hallo");
    AddAdditionalTrigger("Hey");
    AddAdditionalTrigger("Greebas");
    AddAdditionalTrigger("Greebs");
    AddCondition("lang","english");
    AddCondition("qpg","=",0);
    AddAdditionalText("Hello there! Oh you sure look tired. May I offer you a bowl of milk, it's replenishing.");
    AddAdditionalText("Hiho! So you've found your way to old Bippi here. You're here to try my famous milk, I guess?");
    AddConsequence("inform","Milch hï¿½rt sich jetzt sehr verlockend an, aber du fragst ihn besser vorher um was für eine Milch es sich handelt.");
    
	AddTraderTrigger("Hiho","Oh Grï¿½ï¿½e, Reisender! Besuch freut mich immer, darf ich euch eine Schale 'Milch' anbieten?");
    AddAdditionalTrigger("Hallo");
    AddAdditionalTrigger("Hey");
    AddAdditionalTrigger("Greebas");
    AddAdditionalTrigger("Greebs");
    AddCondition("lang","german");
    AddCondition("qpg","=",0);
    AddAdditionalText("Hallo da! Oh ihr seht aber müde aus. Darf ich euch eine Schale Milch aufwarten, als Stï¿½rkung?");
    AddAdditionalText("Hiho! Da habt ihr also zum alten Bippi gefunden. Ihr kommt bestimmt um meine berï¿½hmte Milch zu probieren.");
    AddConsequence("inform","Milch hï¿½rt sich jetzt sehr verlockend an, aber du fragst ihn besser vorher um was für eine Milch es sich handelt.");
    -- After receiving the quest
    AddTraderTrigger("Hello","Oh you're back, that's nice! I think there's a new task waiting for you, but I might be wrong.");
    AddAdditionalTrigger("Greetings");
    AddAdditionalTrigger("Be greeted");
    AddAdditionalTrigger("Greet");
    AddAdditionalTrigger("Hail");
    AddAdditionalTrigger("Good day");
    AddAdditionalTrigger("Good morning");
    AddAdditionalTrigger("Good evening");
    AddAdditionalText("Good to see you again! Let's check if there's something to do for you.");
    AddAdditionalText("Welcome, the cows have already inquired about you.");
    AddTraderTrigger("Grï¿½ï¿½e","Oh wie schön, dass ihr zurï¿½ck seid! Ich glaube es wartet eine neue Aufgabe auf euch, ich kann mich aber auch irren.");
    AddAdditionalTrigger("Gruï¿½");
    AddAdditionalTrigger("Seid gegrï¿½ï¿½t");
    AddAdditionalTrigger("Guten Tag");
    AddAdditionalTrigger("Guten Abend");
    AddAdditionalTrigger("Mahlzeit");
    AddAdditionalTrigger("Tach");
    AddAdditionalTrigger("Moin");
    AddAdditionalTrigger("mit dir");
    AddAdditionalText("Es ist schön euch wiederzusehen. Lasst uns schauen ob es etwas für euch zu tun gibt.");
    AddAdditionalText("Willkommen, die Kï¿½he haben schon nach euch gefragt.");
    AddTraderTrigger("Hiho","Oh you're back, that's nice! I think there's a new task waiting for you, but I might be wrong.");
    AddAdditionalTrigger("Hallo");
    AddAdditionalTrigger("Hey");
    AddAdditionalTrigger("Greebas");
    AddAdditionalTrigger("Greebs");
    AddCondition("lang","english");
    AddAdditionalText("Good to see you again! Let's check if there's something to do for you.");
    AddAdditionalText("Welcome, the cows have already inquired about you.");
    AddTraderTrigger("Hiho","Oh wie schön, dass ihr zurï¿½ck seid! Ich glaube es wartet eine neue Aufgabe auf euch, ich kann mich aber auch irren.");
    AddAdditionalTrigger("Hallo");
    AddAdditionalTrigger("Hey");
    AddAdditionalTrigger("Greebas");
    AddAdditionalTrigger("Greebs");
    AddCondition("lang","german");
    AddAdditionalText("Es ist schön euch wiederzusehen. Lasst uns schauen ob es etwas für euch zu tun gibt.");
    AddAdditionalText("Willkommen, die Kï¿½he haben schon nach euch gefragt.");
   
    -- Time to say Goodbye & Smalltalk
    AddTraderTrigger("Farewell","Fare thee well and come back soon!");
    AddAdditionalTrigger("Good bye");
    AddAdditionalTrigger("Bye");
    AddAdditionalTrigger("Fare thee well");
    AddAdditionalText("Goodbye! Tell your friends about old Bippi and his milk.");
    AddAdditionalText("Oh, leaving already? A pity, good luck on your further travels!");
    AddTraderTrigger("Tschï¿½ï¿½","Gehabt euch wohl und kommt bald mal wieder vorbei!");
    AddAdditionalTrigger("Tschï¿½ss");
    AddAdditionalTrigger("Wiedersehen");
    AddAdditionalTrigger("Gehabt euch wohl");
    AddAdditionalText("Auf bald! Erzï¿½hlt euren Freunden vom alten Bippi und seiner Milch.");
    AddAdditionalText("Oh, ihr geht schon? Schade, viel Erfolg auf eurem weiteren Weg!");
    AddTraderTrigger("Ciao","Fare thee well and come back soon!");
    AddAdditionalTrigger("Adieu");
    AddAdditionalTrigger("Au revoir");
    AddAdditionalTrigger("Farebba");
    AddAdditionalTrigger("See you");
    AddCondition("lang","english");
    AddAdditionalText("Goodbye! Tell your friends about old Bippi and his milk.");
    AddAdditionalText("Oh, leaving already? A pity, good luck on your further travels!");
    AddTraderTrigger("Ciao","Gehabt euch wohl und kommt bald mal wieder vorbei!");
    AddAdditionalTrigger("Adieu");
    AddAdditionalTrigger("Au revoir");
    AddAdditionalTrigger("Farebba");
    AddAdditionalTrigger("See you");
    AddAdditionalText("Auf bald! Erzï¿½hlt euren Freunden vom alten Bippi und seiner Milch.");
    AddAdditionalText("Oh, ihr geht schon? Schade, viel Erfolg auf eurem weiteren Weg!");
    AddTraderTrigger("How are you","Ach, I feel my age creeping up my bones. If only I had someone to help in the stable.");
    AddAdditionalTrigger("How feel");
    AddAdditionalTrigger("How do you do");
    AddAdditionalText("Ah my leg grows stiffer each passing week. I worry who will take care of my cows when one day I...");
    AddAdditionalText("Work is hard and I'm not growing any younger. I think I need someone to take care of some of my tasks.");
    AddTraderTrigger("Wie geht","Ach, ich spï¿½re das Alter in meinen Knochen. Hï¿½tte ich doch nur jemanden der im Stall aushilft.");
    AddAdditionalTrigger("Wie fühlst");
    AddAdditionalTrigger("Wie ist es ergangen");
    AddAdditionalTrigger("Wie Befinden");
    AddAdditionalText("Ah mein Bein wird von Woche zu Woche steifer. Ich sorge mich schon wer sich um meine Kï¿½he kï¿½mmern wird wenn ich einmal...");
    AddAdditionalText("Die Arbeit ist hart und ich werde nicht jï¿½nger. Ich glaube ich brauche jemanden der mir meine Aufgaben abnimmt.");
    AddTraderTrigger("your name","I'm old Bippi and my cows have the tastiest milk for miles.");
    AddAdditionalTrigger("who are you");
    AddAdditionalTrigger("who art thou");
    AddAdditionalText("Call me Bippi. I'm a peasant and tend my cows here on this farm.");
    AddAdditionalText("My name? I'm Bippi and I sell my milk everywhere, even as far away as Cadomyr!");
    AddTraderTrigger("dein name","Ich bin der alte Bippi und meine Kï¿½he geben die beste Milch weit und breit.");
    AddAdditionalTrigger("wer bist du");
    AddAdditionalTrigger("wer seid ihr");
    AddAdditionalTrigger("wie heiï¿½t");
    AddAdditionalText("Nennt mich Bippi, ich bin Bauer und kï¿½mmere mich hier um meine Kï¿½he.");
    AddAdditionalText("Mein Name? Ich bin der Bippi und ich verkaufe meine Milch nach ï¿½berall hin, sogar nach Cadomyr!");
   
    -- Catching typical NPC phrases
    AddTraderTrigger("what sell","I sell cow milk, but I have a lot of orders, I can't sell any to you. Unless you help me of course.");
    AddAdditionalTrigger("what buy");
    AddAdditionalTrigger("list wares");
    AddAdditionalTrigger("price of");
    AddAdditionalText("I sell my milk! It's sold quicker than I can bottle it up, I'm sorry but you can't have any of it.");
    AddAdditionalText("Milk milk milk! Milk is healthy and tasty, and it fills my pockets with lots of copper coins .");
    AddTraderTrigger("was verkauf","Ich verkaufe die Milch meiner Kï¿½he, aber ich habe so viele Bestellungen, euch kann ich nichts abgeben. Auï¿½er ihr macht euch nï¿½tzlich.");
    AddAdditionalTrigger("was kauf");
    AddAdditionalTrigger("warenliste");
    AddAdditionalTrigger("preis von");
    AddAdditionalText("Meine Milch verkauf ich! Die geht schneller weg als ich sie abfï¿½llen kann, ihr kï¿½nnt leider nichts davon haben.");
    AddAdditionalText("Milch Milch Milch! Milch ist gesund und wohlschmeckend. Und sie fï¿½llt meine Taschen mit Kupfer.");
    AddTraderTrigger("tell something","Well you don't look like a cattle breeder, otherwise I would talk about my work.");
    AddAdditionalText("My Greatgrandfather has started to pass on his knowledge about cows, today I am the one knowing all secrets.");
    AddAdditionalText("Well if you ask like that. I think I need farmhands to cope with all the work, maybe you want to help me?");
    AddTraderTrigger("erzï¿½hl was","Nun, ihr seht nicht aus wie ein Viehzï¿½chter, sonst wï¿½rde ich ï¿½ber die Arbeit sprechen.");
    AddAdditionalTrigger("erzï¿½hl etwas");
    AddAdditionalText("Mein Großgroßvater hat angefangen sein Wissen ï¿½ber Milchkï¿½he weiterzugeben, heute bin ich der, der alle Geheimnisse kennt.");
    AddAdditionalText("Nun, wenn ihr so bittet. Ich glaube ich brauche Helfer um die Arbeit zu bewï¿½ltigen, wie wï¿½re es mit euch?");
    
	-- Small talk: The talk here should focus on possible questions. Feel free to add more!
    AddTraderTrigger("profession","I raise cows in order to sell their milk.");
    AddAdditionalText("I'm a peasant and I specialized in tending dairy cows.");
    AddAdditionalText("I live and work here as a cattle breeder. I sell the milk I've milked.");
    AddTraderTrigger("beruf","I raise cows in order to sell their milk.");
    AddAdditionalText("I'm a peasant and I specialized in tending dairy cows.");
    AddAdditionalText("I live and work here as a cattle breeder. I sell the milk I've milked.");
    AddTraderTrigger("job","I raise cows in order to sell their milk.");
    AddCondition("lang","english");
    AddAdditionalText("I'm a peasant and I specialized in tending dairy cows.");
    AddAdditionalText("I live and work here as a cattle breeder. I sell the milk I've milked.");
    AddTraderTrigger("job","Ich ziehe Kï¿½he groß um dann deren Milch zu verkaufen.");
    AddAdditionalText("Ich bin Bauer und habe mich auf Milchkuh Haltung spezialisiert.");
    AddAdditionalText("Ich lebe und arbeite hier als Kuhzï¿½chter. Die gemolkene Milch verkaufe ich.");
    AddTraderTrigger("Gobaith","Never heard about it. Are there cows at that place?");
    AddAdditionalTrigger("Gobiath");
    AddCondition("lang","english");
    AddAdditionalText("Gobaith sounds lush somehow. Like a meadow of the greenest grass, best thing for cows.");
    AddAdditionalText("Ah I heard about it. I think it looks like a latrine after being visited by someone who drank too much milk now.");
    AddTraderTrigger("Gobaith","Davon hab ich noch nie gehï¿½rt. Gibt es dort Kï¿½he?");
    AddAdditionalTrigger("Gobiath");
    AddAdditionalText("Gobaith klingt irgendwie sehr saftig. Wie eine grï¿½ne Wiese besten Grases für die Kï¿½he.");
    AddAdditionalText("Ah ich habs gehï¿½rt. Ich glaube dort sieht es jetzt so aus wie auf dem Donnerbalken wenn man zu viel Milch getrunken hat.");
    AddTraderTrigger("I am","Nice to meet you! Let's celebrate this with a glass of milk.");
    AddAdditionalTrigger("my name");
    AddAdditionalText("That name is pleasant to the tongue. Like a big gulp of milk.");
    AddAdditionalText("Wellmet. You look like someone who'll appreciate a fine glass of milk.");
    AddTraderTrigger("Ich bin","Schï¿½n dich kennenzulernen! Lass uns darauf anstoï¿½en mit einem Glas Milch.");
    AddAdditionalTrigger("mein Name");
    AddAdditionalText("Das ist aber ein hï¿½bscher Name. Zergeht auf der Zunge wie ein krï¿½ftiger Schluck Milch.");
    AddAdditionalText("Sehr erfreut. Ihr seht wie jemand aus der ein Glas bester Milch zu schï¿½tzen weiï¿½.");
    
	-- More small talk; add at least five triggers
    AddTraderTrigger("Milk","Why of course, help yourself! Good, isn't it? My 'cows' give an extraordinary delicious milk.");
    AddCondition("qpg","=",0);
    AddConsequence("inform","You want to know more about the cows.");
    AddTraderTrigger("Cow","I'm proud of my cows! I earn my living with their milk. If only I had someone to help me with all the work...");
    AddCondition("qpg","=",0);
    AddAdditionalText("I'm getting older and the work with the cows gets harder all by myself. I could use some help in the stable, but who would care for a task like that...");
    AddTraderTrigger("stable","Yes, my cows are in the stable, unless they are on the meadow grazing.");
    AddAdditionalText("My stable is the big building to the right of us.");
    AddAdditionalText("Three cows fit into my stable, isn't that wonderful?");
    AddTraderTrigger("work","Once you tend to my cows, you may have some milk. Will you help me?");
    AddAdditionalTrigger("stablehand");
    AddAdditionalText("Well I could use some sturdy helping hands. Will you help me?");
    AddAdditionalText("Could you help me? I can't pay much but it'd mean a lot to me. It would also take away some of my worries.");
    AddConsequence("state","=",1);
    AddConsequence("inform","Say 'I help you' if you want to help him.");
    AddTraderTrigger("Milch","Aber bitte nehmt nur und bedient euch! Schmeckts? Meine 'Kï¿½he' geben eine besonders wohlschmeckende Milch.");
    AddCondition("qpg","=",0);
    AddConsequence("inform","Du mï¿½chtest mehr ï¿½ber die Kï¿½he erfahren.");
    AddTraderTrigger("Kuh","Meine Kï¿½he sind mein ganzer Stolz! Auï¿½erdem sichern sie mir meine Existenz. Wenn ich nur jemanden hï¿½tte der mir mit all der Arbeit hilft...");
    AddAdditionalTrigger("Kï¿½he");
    AddCondition("qpg","=",0);
    AddAdditionalText("Ich werde alt und die Arbeit mit den Kï¿½hen wird für mich immer schwerer. Ich kï¿½nnte Hilfe im Stall gebrauchen aber wer nimmt sich schon so einer Aufgabe an...");
    AddTraderTrigger("Stall","Ja, im Stall stehen meine Kï¿½he, wenn sie nicht gerade weiden.");
    AddAdditionalText("Mein Stall ist das große Gebï¿½ude rechts von uns.");
    AddAdditionalText("Drei Kï¿½he passen in meinen Stall, toll oder?");
    AddTraderTrigger("Arbeit","Wenn ihr euch um meine Kï¿½he kï¿½mmert, kï¿½nnt ihr auch etwas Milch haben. Helft ihr mir?");
    AddAdditionalTrigger("helfer");
    AddCondition("qpg","=",0);
    AddAdditionalText("Nun, ich kï¿½nnte Hï¿½nde die zupacken kï¿½nnen gebrauchen. Wollt ihr mir helfen?");
    AddAdditionalText("Kï¿½nntet ihr mir helfen? Ich kann euch nicht viel dafür geben aber es wï¿½rde mir viel bedeuten und mir einige Sorgen abnehmen.");
    AddConsequence("state","=",1);
    AddConsequence("inform","Sag 'Ich helfe euch' wenn du ihm helfen mï¿½chtest.");
    
	-- Faction stuff
    AddTraderTrigger("Elvaine","I am proud to say that archmage Morgan never starts a day without a glass of my milk!");
    AddAdditionalTrigger("Morgan");
    AddAdditionalTrigger("archmage");
    AddAdditionalTrigger("Erzmagier");
    AddCondition("lang","english");
    AddAdditionalText("They say the only vital signs of the archmage over the course of weeks are the empty milk bottles and other dishes he summons infront of his chambers.");
    AddTraderTrigger("Elvaine","Ich bin stolz sagen zu kï¿½nnen, dass Erzmagier Morgan keinen Tag ohne ein Glas meiner Milch beginnt!");
    AddAdditionalTrigger("Morgan");
    AddAdditionalTrigger("archmage");
    AddAdditionalTrigger("Erzmagier");
    AddAdditionalText("Es heiï¿½t die einzigen Lebenszeichen des Erzmagiers ï¿½ber Wochen hinweg wï¿½ren die leeren Milchflaschen und anderes Geschirr das er vor die Tï¿½r seiner Gemï¿½cher zaubert.");
    AddTraderTrigger("Runewick","What would you call a town full of weakly mages with bad bone structure? I'm calling it paradise!");
    AddCondition("lang","english");
    AddAdditionalText("Runewick, by far most of my customers live there!");
    AddAdditionalText("An impressive place. I would've moved there already but alas the cows don't take the sea breeze there well.");
    AddTraderTrigger("Runewick","Wie wï¿½rdet ihr eine Stadt voller krï¿½nklicher Magier mit schwachem Knochenbau nennen? Ich nenne es Paradies!");
    AddAdditionalText("Runewick, da befindet sich mit Abstand mein grï¿½ï¿½ter Kundenstock.");
    AddAdditionalText("Ein beeindruckender Ort. Ich wï¿½rde gerne dort leben aber die Kï¿½he vertragen die Seeluft nicht so gut.");
    AddTraderTrigger("Valerio","The Don doesn't care about milk. Luckily Runewick is near enough not to be offered the Dons 'protection'.");
    AddAdditionalTrigger("Guilianni");
    AddAdditionalTrigger("Don");
    AddCondition("lang","english");
    AddAdditionalText("If you look at the Don closely you might assume he's drinking milk day in and day out.");
    AddTraderTrigger("Valerio","Der Don macht sich nichts aus Milch. Gut dass Runewick nahe genug ist um nicht seinen 'Schutz' angeboten zu bekommen.");
    AddAdditionalTrigger("Guilianni");
    AddAdditionalTrigger("Don");
    AddAdditionalText("Wenn man sich den Don so ansieht mï¿½chte man meinen er trï¿½nke nichts anderes als Milch.");
    AddTraderTrigger("Galmair","Once I have been forced to yield my best cows to the city. Of course they didn't give good milk, due to the sparse grass growing there.");
    AddCondition("lang","english");
    AddAdditionalText("Although they could use my milk there, due to the harsh conditions in the mountains, most prefer to drink alcoholic beverages.");
    AddTraderTrigger("Galmair","Man hat mich einmal gezwungen meine besten Milchkï¿½he der Stadt zu ï¿½berlassen. Natï¿½rlich gaben sie bei dem kargen Gras dort keine gute Milch.");
    AddAdditionalText("Obwohl sie bei den harten Bedingungen dort oben in den Bergen die Kraft aus Milch gut brauchen kï¿½nnten, sprechen sie doch lieber dem Alkohol zu.");
    AddTraderTrigger("rosaline","A pity the queen swears on donkey milk to use in her bath.");
    AddAdditionalTrigger("kï¿½nigin");
    AddAdditionalTrigger("queen");
    AddAdditionalTrigger("edwards");
    AddCondition("lang","english");
    AddAdditionalText("If my cows were mules, all I would do is produce milk for the bath of the queen and I would be rich!");
    AddTraderTrigger("rosaline","Leider schwï¿½rt die Kï¿½nigin auf Eselsmilch um ihr Bad zu nehmen.");
    AddAdditionalTrigger("kï¿½nigin");
    AddAdditionalTrigger("queen");
    AddAdditionalTrigger("edwards");
    AddAdditionalText("Wï¿½ren meine Kï¿½he Esel, ich brï¿½uchte nur für das Bad der Kï¿½nigin zu arbeiten und hï¿½tte ausgesorgt.");
    AddTraderTrigger("Cadomyr","Due to the hot temperature not much milk is drank there. Only a choosen few appreciate my milk there.");
    AddCondition("lang","english");
    AddAdditionalText("Some connoisseurs spend good money on having my milk transported to Cadomyr.");
    AddTraderTrigger("Cadomyr","Wegen der Hitze dort wird leider nicht viel Milch getrunken. Nur wenige wissen meine Milch dort zu schï¿½tzen.");
    AddAdditionalText("Ein paar Kenner lassen es sich viel kosten um meine Milch nach Cadomyr geliefert zu bekommen.");
    
	-- Main land factions
    AddTraderTrigger("albar","I've heard cows are treated better than peasants there, terrifying thought!");
    AddCondition("lang","english");
    AddAdditionalText("Children in Albar are said to be weaned from breast milk very early. Milk is a symbol for weakness there, they say.");
    AddAdditionalText("A lot of milk in Albar is wasted to be processed to smelly cheese, that's aweful!");
    AddTraderTrigger("albar","Ich habe gehï¿½rt die Kï¿½he werden dort besser behandelt als die Bauern, schauerlich.");
    AddCondition("lang","german");
    AddAdditionalText("In Albar sollen Kinder sehr frï¿½h der Muttermilch entwï¿½hnt werden. Milch wird mit Schwï¿½che assoziert heiï¿½t es.");
    AddAdditionalText("Viel Milch in Albar wird vergeudet um sie zu stinkendem Kï¿½se zu verarbeiten. Schrecklich!");
    AddTraderTrigger("gynk","If you want to order milk in Gynka, you'll only get it in a dirty glas.");
    AddAdditionalTrigger("gync");
    AddCondition("lang","english");
    AddAdditionalText("Gynk people don't care that much about milk.");
    AddAdditionalText("I heard many cows get sick there because of all the swamps nearby.");
    AddTraderTrigger("gync","Wenn man in Gynka Milch bestellen will, bekommt man es nur in einem schmutzigen Glas.");
    AddAdditionalTrigger("gynk");
    AddCondition("lang","german");
    AddAdditionalText("Die Leute aus Gynk machen sich nicht viel aus Milch.");
    AddAdditionalText("Ich hï¿½rte viele Kï¿½he dort werden krank wegen den Sï¿½mpfen in der Nï¿½he.");
    AddTraderTrigger("salkama","Some 'scholars' of Salkamar are said to try to create milk out of plants. How could they!?");
    AddCondition("lang","english");
    AddAdditionalText("ENGLISH2.");
    AddAdditionalText("Amongst some upperclass people of Salkamar it is respectable to carry a downy beard openly! I think.");
    AddTraderTrigger("salkama","Ein paar 'Gelehrte' in Salkamar sollen versuchen Milch aus Pflanzen zu gewinnen. Wie kann man nur!?");
    AddCondition("lang","german");
    AddAdditionalText("Es soll Leute dort geben die mischen ihre Milch mit heiï¿½em Wasser und Krï¿½utern. Verrï¿½ckt, nicht?");
    AddAdditionalText("In manchen gehobenen Kreisen Salkamars gilt das Tragen eines Milchbarts als schicklich! Glaube ich.");
   
    -- Gods - use the triggers of the god the NPC worships or fights
    AddTraderTrigger("Adron","After a long feast there's nothing better to get on track than a glass of milk, even Adron knows that!");
    AddCondition("lang","english");
    AddAdditionalText("Adron loves beverages. Milk is a beverage. I love milk. Thus we share a love for milk.");
    AddAdditionalText("A long time ago I became very ill. A wanderer found me shivering with fever in the stables and nursed me back to health. I think he was that wanderer!");
    AddTraderTrigger("Adron","Nach einem langen Fest gibt es nichts besseres um wieder zu Krï¿½ften zu kommen als ein Glas Milch, das weiï¿½ auch Adron.");
    AddAdditionalText("Adron liebt Getrï¿½nke. Milch ist ein Getrï¿½nk. Ich liebe Milch. Also teilen wir eine Liebe zur Milch.");
    AddAdditionalText("For langer Zeit wurde ich schwer krank. Ein Wanderer fand mich zitternd vor Fieber im Stall und pflegte mich gesund. Ich glaube er war das!");
    AddTraderTrigger("Bragon","I'm sorry. I don't pray to that deity that often, so I can't say much about this.");
    AddAdditionalTrigger("Brágon");
    AddCondition("lang","english");
    AddAdditionalText("I trust Adron and Oldra to take care of my farm and sucess, I'm not that familiar with other deities.");
    AddAdditionalText("Hmm. I can't say much about that one. I usually pray to Adron and Oldra.");
    AddTraderTrigger("Bragon","Tut mir leid. Ich bete zu dieser Gottheit eigentlich kaum, kann also nichts dazu sagen.");
    AddAdditionalTrigger("Brágon");
    AddAdditionalText("Ich lege meinen Hof und meinen Erfolg in die Hï¿½nde Adrons und Oldras, andere Gï¿½tter sind mir nicht so vertraut.");
    AddAdditionalText("Hmm. Leider kann ich nicht viel darï¿½ber sagen. Ich bete eher zu Adron und Oldra.");
    AddTraderTrigger("Cherga","I'm sorry. I don't pray to that deity that often, so I can't say much about this.");
    AddCondition("lang","english");
    AddAdditionalText("I trust Adron and Oldra to take care of my farm and sucess, I'm not that familiar with other deities.");
    AddAdditionalText("Hmm. I can't say much about that one. I usually pray to Adron and Oldra.");
    AddTraderTrigger("Cherga","Tut mir leid. Ich bete zu dieser Gottheit eigentlich kaum, kann also nichts dazu sagen.");
    AddAdditionalText("Ich lege meinen Hof und meinen Erfolg in die Hï¿½nde Adrons und Oldras, andere Gï¿½tter sind mir nicht so vertraut.");
    AddAdditionalText("Hmm. Leider kann ich nicht viel darï¿½ber sagen. Ich bete eher zu Adron und Oldra.");
    AddTraderTrigger("Elara","I'm sorry. I don't pray to that deity that often, so I can't say much about this.");
    AddCondition("lang","english");
    AddAdditionalText("I trust Adron and Oldra to take care of my farm and sucess, I'm not that familiar with other deities.");
    AddAdditionalText("Hmm. I can't say much about that one. I usually pray to Adron and Oldra.");
    AddTraderTrigger("Elara","Tut mir leid. Ich bete zu dieser Gottheit eigentlich kaum, kann also nichts dazu sagen.");
    AddAdditionalText("Ich lege meinen Hof und meinen Erfolg in die Hï¿½nde Adrons und Oldras, andere Gï¿½tter sind mir nicht so vertraut.");
    AddAdditionalText("Hmm. Leider kann ich nicht viel darï¿½ber sagen. Ich bete eher zu Adron und Oldra.");
    AddTraderTrigger("Eldan","I'm sorry. I don't pray to that deity that often, so I can't say much about this.");
    AddCondition("lang","english");
    AddAdditionalText("I trust Adron and Oldra to take care of my farm and sucess, I'm not that familiar with other deities.");
    AddAdditionalText("Hmm. I can't say much about that one. I usually pray to Adron and Oldra.");
    AddTraderTrigger("Eldan","Tut mir leid. Ich bete zu dieser Gottheit eigentlich kaum, kann also nichts dazu sagen.");
    AddAdditionalText("Ich lege meinen Hof und meinen Erfolg in die Hï¿½nde Adrons und Oldras, andere Gï¿½tter sind mir nicht so vertraut.");
    AddAdditionalText("");
    AddTraderTrigger("Findari","I'm sorry. I don't pray to that deity that often, so I can't say much about this.");
    AddCondition("lang","english");
    AddAdditionalText("I trust Adron and Oldra to take care of my farm and sucess, I'm not that familiar with other deities.");
    AddAdditionalText("Hmm. I can't say much about that one. I usually pray to Adron and Oldra.");
    AddTraderTrigger("Findari","Tut mir leid. Ich bete zu dieser Gottheit eigentlich kaum, kann also nichts dazu sagen.");
    AddAdditionalText("Ich lege meinen Hof und meinen Erfolg in die Hï¿½nde Adrons und Oldras, andere Gï¿½tter sind mir nicht so vertraut.");
    AddAdditionalText("Hmm. Leider kann ich nicht viel darï¿½ber sagen. Ich bete eher zu Adron und Oldra.");
    AddTraderTrigger("Irmorom","I'm sorry. I don't pray to that deity that often, so I can't say much about this.");
    AddCondition("lang","english");
    AddAdditionalText("I trust Adron and Oldra to take care of my farm and sucess, I'm not that familiar with other deities.");
    AddAdditionalText("Hmm. I can't say much about that one. I usually pray to Adron and Oldra.");
    AddTraderTrigger("Irmorom","Tut mir leid. Ich bete zu dieser Gottheit eigentlich kaum, kann also nichts dazu sagen.");
    AddAdditionalText("Ich lege meinen Hof und meinen Erfolg in die Hï¿½nde Adrons und Oldras, andere Gï¿½tter sind mir nicht so vertraut.");
    AddAdditionalText("Hmm. Leider kann ich nicht viel darï¿½ber sagen. Ich bete eher zu Adron und Oldra.");
    AddTraderTrigger("Malachin","I'm sorry. I don't pray to that deity that often, so I can't say much about this.");
    AddAdditionalTrigger("Malachï¿½n");
    AddCondition("lang","english");
    AddAdditionalText("I trust Adron and Oldra to take care of my farm and sucess, I'm not that familiar with other deities.");
    AddAdditionalText("Hmm. I can't say much about that one. I usually pray to Adron and Oldra.");
    AddTraderTrigger("Malachin","Tut mir leid. Ich bete zu dieser Gottheit eigentlich kaum, kann also nichts dazu sagen.");
    AddAdditionalTrigger("Malachï¿½n");
    AddAdditionalText("Ich lege meinen Hof und meinen Erfolg in die Hï¿½nde Adrons und Oldras, andere Gï¿½tter sind mir nicht so vertraut.");
    AddAdditionalText("Hmm. Leider kann ich nicht viel darï¿½ber sagen. Ich bete eher zu Adron und Oldra.");
    AddTraderTrigger("Moshran","Oh stop talking about that one! Else the milk will turn sour.");
    AddCondition("lang","english");
    AddAdditionalText("Next to noone has spilled as much milk as that meanie did.");
    AddAdditionalText("I am hospitable. But for nothing in the world would I give him a glass of milk!");
    AddTraderTrigger("Moshran","Hï¿½rt mir bloï¿½ auf von dem! Sonst wird noch die Milch sauer.");
    AddAdditionalText("Kaum jemand hat so boshaft so viel Milch verschï¿½ttet wie er.");
    AddAdditionalText("Ich bin gastfreundlich. Aber um nichts in der Welt wï¿½rde er ein Glas Milch von mir bekommen!");
    AddTraderTrigger("Nargun","I'm sorry. I don't pray to that deity that often, so I can't say much about this.");
    AddAdditionalTrigger("Nargï¿½n");
    AddCondition("lang","english");
    AddAdditionalText("I trust Adron and Oldra to take care of my farm and sucess, I'm not that familiar with other deities.");
    AddAdditionalText("Hmm. I can't say much about that one. I usually pray to Adron and Oldra.");
    AddTraderTrigger("Nargun","Tut mir leid. Ich bete zu dieser Gottheit eigentlich kaum, kann also nichts dazu sagen.");
    AddAdditionalTrigger("Nargï¿½n");
    AddAdditionalText("Ich lege meinen Hof und meinen Erfolg in die Hï¿½nde Adrons und Oldras, andere Gï¿½tter sind mir nicht so vertraut.");
    AddAdditionalText("Hmm. Leider kann ich nicht viel darï¿½ber sagen. Ich bete eher zu Adron und Oldra.");
    AddTraderTrigger("Oldra","Thanks to her plants grow, and thanks to those plants my cows give milk!");
    AddCondition("lang","english");
    AddAdditionalText("Oldra, yes. We have to thank her for everything, you know. Without crops grown from soil all of us would die of hunger.");
    AddAdditionalText("She is the highest godess of all, without her creation everything else would perish due to hunger.");
    AddTraderTrigger("Oldra","Wegen ihr gedeihen die Pflanzen, und diese wiederum ermï¿½glichen es dass meine Kï¿½he Milch geben!");
    AddAdditionalText("Oldra, ja. Ihr haben wir doch alles zu verdanken. Ohne die Frï¿½chte der Erde wï¿½rden wir alle verhungern.");
    AddAdditionalText("Sie ist die hï¿½chste Gottheit von allen, ohne ihre Schï¿½pfung wï¿½rde alles andere vor Hunger umkommen.");
    AddTraderTrigger("Ronagan","I'm sorry. I don't pray to that deity that often, so I can't say much about this.");
    AddCondition("lang","english");
    AddAdditionalText("I trust Adron and Oldra to take care of my farm and sucess, I'm not that familiar with other deities.");
    AddAdditionalText("Hmm. I can't say much about that one. I usually pray to Adron and Oldra.");
    AddTraderTrigger("Ronagan","Tut mir leid. Ich bete zu dieser Gottheit eigentlich kaum, kann also nichts dazu sagen.");
    AddAdditionalText("Ich lege meinen Hof und meinen Erfolg in die Hï¿½nde Adrons und Oldras, andere Gï¿½tter sind mir nicht so vertraut.");
    AddAdditionalText("Hmm. Leider kann ich nicht viel darï¿½ber sagen. Ich bete eher zu Adron und Oldra.");
    AddTraderTrigger("Sirani","I'm sorry. I don't pray to that deity that often, so I can't say much about this.");
    AddCondition("lang","english");
    AddAdditionalText("I trust Adron and Oldra to take care of my farm and sucess, I'm not that familiar with other deities.");
    AddAdditionalText("Hmm. I can't say much about that one. I usually pray to Adron and Oldra.");
    AddTraderTrigger("Sirani","Tut mir leid. Ich bete zu dieser Gottheit eigentlich kaum, kann also nichts dazu sagen.");
    AddAdditionalText("Ich lege meinen Hof und meinen Erfolg in die Hï¿½nde Adrons und Oldras, andere Gï¿½tter sind mir nicht so vertraut.");
    AddAdditionalText("Hmm. Leider kann ich nicht viel darï¿½ber sagen. Ich bete eher zu Adron und Oldra.");
    AddTraderTrigger("Tanora","I'm sorry. I don't pray to that deity that often, so I can't say much about this.");
    AddAdditionalTrigger("Zelphia");
    AddCondition("lang","english");
    AddAdditionalText("I trust Adron and Oldra to take care of my farm and sucess, I'm not that familiar with other deities.");
    AddAdditionalText("Hmm. I can't say much about that one. I usually pray to Adron and Oldra.");
    AddTraderTrigger("Tanora","Tut mir leid. Ich bete zu dieser Gottheit eigentlich kaum, kann also nichts dazu sagen.");
    AddAdditionalTrigger("Zelphia");
    AddAdditionalText("Ich lege meinen Hof und meinen Erfolg in die Hï¿½nde Adrons und Oldras, andere Gï¿½tter sind mir nicht so vertraut.");
    AddAdditionalText("Hmm. Leider kann ich nicht viel darï¿½ber sagen. Ich bete eher zu Adron und Oldra.");
    AddTraderTrigger("Ushara","I'm sorry. I don't pray to that deity that often, so I can't say much about this.");
    AddCondition("lang","english");
    AddAdditionalText("I trust Adron and Oldra to take care of my farm and sucess, I'm not that familiar with other deities.");
    AddAdditionalText("Hmm. I can't say much about that one. I usually pray to Adron and Oldra.");
    AddTraderTrigger("Ushara","Tut mir leid. Ich bete zu dieser Gottheit eigentlich kaum, kann also nichts dazu sagen.");
    AddAdditionalText("Ich lege meinen Hof und meinen Erfolg in die Hï¿½nde Adrons und Oldras, andere Gï¿½tter sind mir nicht so vertraut.");
    AddAdditionalText("Hmm. Leider kann ich nicht viel darï¿½ber sagen. Ich bete eher zu Adron und Oldra.");
    AddTraderTrigger("Zhambra","I'm sorry. I don't pray to that deity that often, so I can't say much about this.");
    AddCondition("lang","english");
    AddAdditionalText("I trust Adron and Oldra to take care of my farm and sucess, I'm not that familiar with other deities.");
    AddAdditionalText("Hmm. I can't say much about that one. I usually pray to Adron and Oldra.");
    AddTraderTrigger("Zhambra","Tut mir leid. Ich bete zu dieser Gottheit eigentlich kaum, kann also nichts dazu sagen.");
    AddAdditionalText("Ich lege meinen Hof und meinen Erfolg in die Hï¿½nde Adrons und Oldras, andere Gï¿½tter sind mir nicht so vertraut.");
    AddAdditionalText("Hmm. Leider kann ich nicht viel darï¿½ber sagen. Ich bete eher zu Adron und Oldra.");
    -- Catching quest triggers
    AddTraderTrigger("quest","Once you tend to my cows, you may have some milk. Will you help me?");
    AddCondition("lang","english");
    AddAdditionalText("Well I could use some sturdy helping hands. Will you help me?");
    AddAdditionalText("Could you help me? I can't pay much but it'd mean a lot to me. It would also take away some of my worries.");
    AddConsequence("state","=",1);
    AddConsequence("inform","Say 'I help you' if you want to help him.");
    AddTraderTrigger("quest","Wenn ihr euch um meine Kï¿½he kï¿½mmert, kï¿½nnt ihr auch etwas Milch haben. Helft ihr mir?");
    AddCondition("lang","german");
    AddAdditionalText("Nun, ich kï¿½nnte Hï¿½nde die zupacken kï¿½nnen gebrauchen. Wollt ihr mir helfen?");
    AddAdditionalText("Kï¿½nntet ihr mir helfen? Ich kann euch nicht viel dafür geben aber es wï¿½rde mir viel bedeuten und mir einige Sorgen abnehmen.");
    AddConsequence("state","=",1);
    AddConsequence("inform","Sag 'Ich helfe euch' wenn du ihm helfen mï¿½chtest.");
    AddTraderTrigger("task","Once you tend to my cows, you may have some milk. Will you help me?");
    AddAdditionalTrigger("adventure");
    AddAdditionalText("Well I could use some sturdy helping hands. Will you help me?");
    AddAdditionalText("Could you help me? I can't pay much but it'd mean a lot to me. It would also take away some of my worries.");
    AddConsequence("state","=",1);
    AddConsequence("inform","Say 'I help you' if you want to help him.");
    AddTraderTrigger("Auftrag","Wenn ihr euch um meine Kï¿½he kï¿½mmert, kï¿½nnt ihr auch etwas Milch haben. Helft ihr mir?");
    AddAdditionalTrigger("Aufgabe");
    AddAdditionalTrigger("Abenteuer");
    AddAdditionalText("Nun, ich kï¿½nnte Hï¿½nde die zupacken kï¿½nnen gebrauchen. Wollt ihr mir helfen?");
    AddAdditionalText("Kï¿½nntet ihr mir helfen? Ich kann euch nicht viel dafür geben aber es wï¿½rde mir viel bedeuten und mir einige Sorgen abnehmen.");
    AddConsequence("state","=",1);
    AddConsequence("inform","Sag 'Ich helfe euch' wenn du ihm helfen mï¿½chtest.");
    -- Last catch: Think about keyphrases the player might say and that are not caught until here
    AddTraderTrigger("Yes","That's true! Let's have a glass of milk to celebrate.");
    AddAdditionalText("Absolutely! Even my cows understand.");
    AddAdditionalText("#me nods leisuredly: 'My grandfather used to say that all the time.");
    AddTraderTrigger("Ja","Richtig so! Darauf trinken wir ein Glas Milch.");
    AddAdditionalText("Absolut! Sogar meine Kï¿½he verstehen das.");
    AddAdditionalText("#me nickt mï¿½ï¿½ig: 'Mein Großvater sagte das auch immer.'");
    AddTraderTrigger("No","Ah? Can a glass of milk change your mind?");
    AddAdditionalText("That's sad. Still you should try my milk.");
    AddAdditionalText("Don't be that negative! Drink a bit of milk and everything will turn out well!");
    AddTraderTrigger("Nein","Ah? Kann ein Glas Milch dich umstimmen?");
    AddAdditionalText("Das ist schade. Aber meine Milch solltest du trotzdem probieren.");
    AddAdditionalText("Sei nicht so negativ! Trink ein wenig Milch und alles wird gut!");
    -- Absolutely last catch: Everything a player says and is not caught earlier
    -- This response should give the player a hint about what to ask the NPC
    -- Optional Trigger /  Response is only given 1/5 of the time
    -- ".*",english,chance(20)->"I'm sorry. I don't pray to that deity that often, so I can't say much about this.","I trust Adron and Oldra to take care of my farm and sucess, I'm not that familiar with other deities.","Hmm. I can't say much about that one. I usually pray to Adron and Oldra."
    -- ".*",german,chance(20)->"Tut mir leid. Ich bete zu dieser Gottheit eigentlich kaum, kann also nichts dazu sagen.","Ich lege meinen Hof und meinen Erfolg in die Hï¿½nde Adrons und Oldras, andere Gï¿½tter sind mir nicht so vertraut.","Hmm. Leider kann ich nicht viel darï¿½ber sagen. Ich bete eher zu Adron und Oldra."
    -- Cycletext: Please add at least(!) ten cycletext messages. The more, the better. You can use emotes (#me is green), too.
    AddCycleText("#me plagt sich damit einen schweren Eimer Getreide zu heben.","#me labours hard on lifting a heavy bucket of grain.");
    AddCycleText("#me sieht sich traurig um und seufzt: 'So viel zu tun...'","#me looks arround with a worried frown: 'So much to do...");
    AddCycleText("#me nimmt einen großen Schluck aus einer Flasche: 'Mhh... Milch.'","#me takes a big gulp from a bottle: 'Mhh... milk.'");
    AddCycleText("Trinkt ihr brav Milch?","Got milk?");
    AddCycleText("Cheeseball, Mjilka, Betsy! Es wird Zeit euch zu melken!","Cheeseball, Mjilka, Betsy! Time to milk you!");
    AddCycleText("Milch ist gesund! Macht die Knochen stark, nicht wund!","Milk is tasty, so always be hasty, to drink for your bones, make them turn as hard as stones!");
    AddCycleText("früher sah der Hof und der Arbeitsaufwand hier viel kleiner aus...","Back in the days working on this farm wasn't that stressful to me...");
    AddCycleText("Wo man Milch trinkt da lass dich gern nieder.","Where there's milk drunk, one can come to rest with no worries in his heart.");
    AddCycleText("Hallo! Ja ihr da! Wolltet ihr schon mal auf einem Hof arbeiten?","Hello! Yes you over there! Did you ever consider working on a farm?");
    AddCycleText("Hat man Milch getrunken kann nichts mehr in die Hose gehen! Hmm, wobei...","Once you tried milk, you never go back!");
    -- ********* END DYNAMIC PART ********

    -----------------------------------
    -- ********* END DYNAMIC PART ********
    TradSpeakLang={0,6};
    TradStdLang=0;

    npc.base.autonpcfunctions.increaseLangSkill(TradSpeakLang);
    thisNPC.activeLanguage=TradStdLang;
    
    if not InitDone then

		InitDone= true;
    	cowname = {"Betsy", "Mjilka", "Cheeseball"};
    	
    end
    

end

function nextCycle()  -- ~10 times per second
    initializeNpc();
    npc.base.autonpcfunctions.SpeakerCycle();
end

function receiveText(texttype, message, originator)
    if npc.base.autonpcfunctions.BasicNPCChecks(originator,2) then
        if npc.base.autonpcfunctions.LangOK(originator,TradSpeakLang) then
			if string.find(message,"reset") then
				originator:setQuestProgress(29, 0);	
				originator:setQuestProgress(28, 0);	
				NPCStatus[originator.id]=0;

				find, aquest28Effect =  originator.effects:find(32);
				if find then
					originator.aquest28Effect:removeEffect(32);
				end
				originator:inform("Reset");
			end	
			
			if ( (string.find(message,"Ich helfe euch")~=nil or string.find(message,"I help you")~=nil)and NPCStatus[originator.id]==1) then --here starts the quest with first task

				-- INITIALIZE THE QUEST STATUS 29 WHICH HOLDS VARIABLES OF THE QUEST
                cowrnd = math.random(3); --choose cow by random
				local task = 1; local cow = cowrnd; local counter = 6;

				quest_aquest28.glue_questdata(originator, cow, task, counter);
    			NPCStatus[originator.id] = 0;
    			originator:setQuestProgress(28, 1);
    			--------------------------------
				--TELL WHAT TO DO AND WHICH COW HE HAS
				gText="Sehr gut, dann fangen wir an. Um euch nicht zu ï¿½berfordern mï¿½sst ihr euch auch nur um eine Kuh kï¿½mmern und zwar um "..cowname[cowrnd]..". Ich werde euch tï¿½glich sagen welche Aufgaben ihr zu tun habt.";
			    eText="Very good, let's start. You only have to take care of one cow namely "..cowname[cowrnd].." so it's not that hard. I will tell you daily what to do.";
		        outText=base.common.npc.base.npcautofunction.GetNLS(User,gText,eText);
				npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);

				-- TELL the TASK TO DO
				gText,eText = TaskText(task);
		        outText=base.common.npc.base.npcautofunction.GetNLS(User,gText,eText);
				npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
    		elseif ((string.find(message,"[Hh]ilfe")~=nil or string.find(message,"[Hh]elp")~=nil) and originator:getQuestProgress(28)>0) then
				gText = "Schlüsselwï¿½rter: 'Wie lautet meine Aufgabe?','Gib mir einen Hinweis zur Aufgabe'";
				eText = "Keyphrases : 'What is my task?','Give me a hint to the task'";
				base.common.TempInformNLS(originator, gText,eText);
			elseif ((string.find(message,"[Hh]inweis")~=nil or string.find(message,"[Hh]int")~=nil) and originator:getQuestProgress(28)>0) then
				-- GIVE A HINT TO THE TASK
				dummy1, task = quest_aquest28.split_questdata(originator);

				dummy1,dummy2,gText,eText = TaskText(task);
		        outText=base.common.npc.base.npcautofunction.GetNLS(User,gText,eText);
				npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
			elseif ((string.find(message,"[Aa]ufgabe")~=nil or string.find(message,"[Tt]ask")~=nil) and originator:getQuestProgress(28)>0) then

				aquest28Effect = User.effects:find(32); -- does effect #32 already exist?
				local dummy_1, noTaskYet= quest_aquest28.split_questdata(originator); 
				if (aquest28Effect == false and noTaskYet == 0) then --time delay of 1 day is finished, creat new task
					quest_aquest28.chooseTask(originator);
				end

				-- TELL the TASK TO DO
				dummy1, task = quest_aquest28.split_questdata(originator);
				
				gText,eText = TaskText(task);
		        outText=base.common.npc.base.npcautofunction.GetNLS(User,gText,eText);
				npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
			else
            	npc.base.autonpcfunctions.TellSmallTalk(message,originator);
			end
        else
            npc.base.autonpcfunctions.Confused(
               "#me sieht dich leicht verwirrt an",
               "#me looks at you a little confused"
            );
        end
    end
end

function TaskText(taskid)
	if not TaskInit then
		TaskInit = true;
		gTask ={};
		eTask ={};
		
        gTask[1] = {
					desctxt="Meine Arme sind schwach. Heute beim Essen ist mir die Suppenschï¿½ssel aus der Hand gefallen. Bitte bï¿½rstet und striegelt die Kuh heute.",
					helptxt="Nun mit der Hand wird das nichts. Sucht euch etwas mit dem bï¿½rsten kï¿½nnt? Und immer mit der Fellrichtung streichen sonst wird die Milch sauer!"
					};

        eTask[1] = {
					desctxt="My arms grew weak. I could barely lift the soup bowl while eating today. Please groom the cow.",
					helptxt="Well, you can't groom with your hand, look for a tool to help you brush? And always comb from front to back or the cow will give sour milk."
					};
        gTask[2] = {
					desctxt="Ich glaube ich bin erkï¿½ltet. Heute mit kaltem Wasser zu arbeiten wï¿½re mein Tod. Bitte wascht die Kuh heute.",
					helptxt="Wasser ist zum Waschen da. Und mit den Hï¿½nden werdet ihr es nicht tragen kï¿½nnen. Neben dem Haus ist ein Brunnen aber nimm deinen eigenen Eimer dafür!"
					};

        eTask[2] = {
					desctxt="I think I cought a cold. It'd be my death if I had to touch cold water now. Please wash the cow today.",
					helptxt="You use water to wash, and you can't carry it in your hands. There's a well next to the house but bring your own bucket!"
					};
		gTask[3] = {
					desctxt="Wenn ich singe wird die Milch besonders cremig, aber heute bin ich heiser. Singt der Kuh doch bitte ein Lied vor!",
					helptxt="Ihr kï¿½nnt nicht singen? Nun früher hab ich auch ï¿½fter mit der Laute vorgespielt aber meine Finger wollen nichtmehr richtig, probiert es damit?"
					};

        eTask[3] = {
					desctxt="If I sing for my cows the milk turns out extraordinarily creamy, but I have a sore throat today. Please sing a song to the cow!",
					helptxt="You can't sing? Well before my fingers got stiff I used to play the lute and they enjoyed that aswell, perhaps you should try that?"
					};
		gTask[4] = {
					desctxt="Das Brunnenwasser ist seit heute morgen so faulig. Klettert bitte hinunter und seht einmal nach was da los ist.",
					helptxt="Vielleicht hat sich Ungeziefer im Brunnen eingenistet? Ihr mï¿½sstet es vertreiben dann wird das Wasser bestimmt wieder klarer."
					};

        eTask[4] = {
					desctxt="The water from the well tasted fowl today. Please climb down and check what's wrong.",
					helptxt="Maybe there's vermin in the well? If so, you'd have to get rid of it, then the water will clear again."
					};
		gTask[5] = {
					desctxt="Mein Kreuz macht mir zu schaffen, ich kann das Futter nicht in den Stall tragen. Bitte fï¿½ttert heute die Kuh.",
					helptxt="Sie mag besonders gerne Getreide."
					};

        eTask[5] = {
					desctxt="My back aches! I can't carry the fodder to the stable. Please feed the cow today.",
					helptxt="She likes grain the best."
					};
		gTask[6] = {
					desctxt="Heute kannst du die Frï¿½chte deiner Arbeit ernten sozusagen! Du musst die Kuh nur noch melken.",
					helptxt="Mir persï¿½nlich schmeckt die Milch aus der Flasche am besten. Man kann sie auch gleich an der Kuh befï¿½llen."
					};

        eTask[6] = {
					desctxt="Today you can reap what you've sown so to speak! All you have to do is milk the cow.",
					helptxt="I prefer milk from the bottle. You can fill it straight at the cow too."
					};
					
	end
	if taskid == 0 then
		gText = "Du hast die heutige Aufgabe schon erledigt, komm morgen wieder.";
		eText = "You already finished the task for today, come tomorrow again.";
	    return gText, eText,gText, eText;
	end
	return gTask[taskid].desctxt, eTask[taskid].desctxt, gTask[taskid].helptxt, eTask[taskid].helptxt;
end
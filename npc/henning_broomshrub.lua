-- INSERT INTO npc VALUES (nextval('npc_seq'),halfing,670,314,0,2,false,'Henning Broomshrub','npc_henning_broomshrub.lua',0);

require("npc.base.autonpcfunctions")
module("npc.henning_broomshrub", package.seeall)

function useNPC(user,counter,param)
    thisNPC:increaseSkill(1,"common language",100);
    thisNPC:talkLanguage(CCharacter.say, CPlayer.german, "Finger weg!");
    thisNPC:talkLanguage(CCharacter.say, CPlayer.english, "Don't you touch me!");
end

function initializeNpc()
    if TraderFirst then
        return true;
    end

    npc.base.autonpcfunctions.InitTalkLists();

    -- ********* START DYNAMIC PART ********

    QuestID = 21;
    -- Help
   npc.base.autonpcfunctions.AddTraderTrigger("Help","[Game Help] This NPC is a thimblerig. You can see him shuffling three nuts over and over again. Say 'I bet X coins' to play. Then, say 'right', 'left' or 'middle' to choose a nut.");
    npc.base.autonpcfunctions.AddTraderTrigger("Hilfe","[Spielhilfe] Dieser NPC ist ein Hütchenspieler. Er schiebt in einer Tour drei Nüße hin und her. Sag 'Ich wette X Münzen' um zu spielen. Sage dann 'rechts', 'links' oder 'mitte' um eine Nuss zu wählen.");
    -- General speech

   npc.base.autonpcfunctions.AddTraderTrigger("Hello","Hiho! Time for gambling, right?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greetings");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Be greeted");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hail");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good day");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good morning");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good evening");
    npc.base.autonpcfunctions.AddAdditionalText("Shh, want to play with me?");
    npc.base.autonpcfunctions.AddAdditionalText("Hey, you look like somebody who is used to winning. Want to play?");
    npc.base.autonpcfunctions.AddAdditionalText("Hello. Thimblerig is my business. Want to bet, stranger?");
    npc.base.autonpcfunctions.AddTraderTrigger("Guten Tag","Hiho! Zeit zum Zocken, nicht wahr?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Guten Abend");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Mahlzeit");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Tach");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Moin");
    npc.base.autonpcfunctions.AddAdditionalText("Shh, willst du mit mir spielen?");
    npc.base.autonpcfunctions.AddAdditionalText("Hey, du siehtst aus wie jemand, der gerne gewinnt. Willst du wetten?");
    npc.base.autonpcfunctions.AddAdditionalText("Hallo. Das Hütchenspiel ist mein Handwerk. Willst du was setzen, Fremder?");
    npc.base.autonpcfunctions.AddTraderTrigger("Hiho","Hiho! Time for gambling, right?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("Shh, want to play with me?");
    npc.base.autonpcfunctions.AddAdditionalText("Hey, you look like somebody who is used to winning. Want to play?");
    npc.base.autonpcfunctions.AddAdditionalText("Hello. Thimblerig is my business. Want to bet, stranger?");
    npc.base.autonpcfunctions.AddTraderTrigger("Hiho","Hiho! Zeit zum Zocken, nicht wahr?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddAdditionalText("Shh, willst du mit mir spielen?");
    npc.base.autonpcfunctions.AddAdditionalText("Hey, du siehtst aus wie jemand, der gerne gewinnt. Willst du wetten?");
    npc.base.autonpcfunctions.AddAdditionalText("Hallo. Das Hütchenspiel ist mein Handwerk. Willst du was setzen, Fremder?");
    npc.base.autonpcfunctions.AddTraderTrigger("Farewell","Yes, yes, and come back with more money!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good bye");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Bye");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Fare thy well");
    npc.base.autonpcfunctions.AddAdditionalText("Bye! May your purse fill again.");
    npc.base.autonpcfunctions.AddAdditionalText("Goodbye and please don't tell what I am doing here.");
    npc.base.autonpcfunctions.AddAdditionalText("Ronagan may bless you.");
    npc.base.autonpcfunctions.AddTraderTrigger("Tschüß","Ja, ja, und komm mit mehr Geld zurück.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Tschüss");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Wiedersehen");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Gehabt euch wohl");
    npc.base.autonpcfunctions.AddAdditionalText("Auf wiedersehen. Und möge sich deine Börse wieder mit Gold füllen.");
    npc.base.autonpcfunctions.AddAdditionalText("Tschüß! Erzähl bitte nichts von dem, was ich hier mache.");
    npc.base.autonpcfunctions.AddAdditionalText("Möge Ronagan dich segnen.");
    npc.base.autonpcfunctions.AddTraderTrigger("Ciao","Yes, yes, and come back with more money!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("Bye! May your purse fill again.");
    npc.base.autonpcfunctions.AddAdditionalText("Goodbye and please don't tell what I am doing here.");
    npc.base.autonpcfunctions.AddAdditionalText("Ronagan may bless you.");
    npc.base.autonpcfunctions.AddTraderTrigger("Ciao","Ja, ja, und komm mit mehr Geld zurück.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddAdditionalText("Auf wiedersehen. Und möge sich deine Börse wieder mit Gold füllen.");
    npc.base.autonpcfunctions.AddAdditionalText("Tschüß! Erzähl bitte nichts von dem, was ich hier mache.");
    npc.base.autonpcfunctions.AddAdditionalText("Möge Ronagan dich segnen.");
    -- Catching typical NPC phrases
    npc.base.autonpcfunctions.AddTraderTrigger("what sell","Do I look like a trader!?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("What buy");
    npc.base.autonpcfunctions.AddAdditionalTrigger("list wares");
    npc.base.autonpcfunctions.AddAdditionalTrigger("price of");
    npc.base.autonpcfunctions.AddAdditionalText("Oh, I forgot my vendor's tray at home. Want to play a game instead?");
    npc.base.autonpcfunctions.AddAdditionalText("You must be kidding me. I am not a huckster!");
    npc.base.autonpcfunctions.AddTraderTrigger("was verkauf","Sehe ich aus wie ein Händler?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("was kauf");
    npc.base.autonpcfunctions.AddAdditionalTrigger("warenliste");
    npc.base.autonpcfunctions.AddAdditionalTrigger("preis von");
    npc.base.autonpcfunctions.AddAdditionalText("Oh, gerade heute hab ich meinen Bauchladen zuhause vergessen. Willst du nicht viel lieber ein Spiel spielen?");
    npc.base.autonpcfunctions.AddAdditionalText("Willst du mich veräppeln? Ich bin kein Höker!");
    npc.base.autonpcfunctions.AddTraderTrigger("quest","Let me see... I can send you on an epic quest to choose the right nut! Care to bet?");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("No quest today, my money has gone away. The nuts stand forlorn, a symbol of the dawn.");
    npc.base.autonpcfunctions.AddAdditionalText("You are the hero, I am the thimblerig!");
    npc.base.autonpcfunctions.AddTraderTrigger("quest","Lass mich mal überlegen... Ich kann dich auf die epische Suche nach der richtigen Nuss schicken. Hast du Lust, zu wetten?");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddAdditionalText("Leider hab ich keine Abenteuer im Angebot. Wie wärs mit einer kleinen Wette?");
    npc.base.autonpcfunctions.AddAdditionalText("Du bist der Held, ich der Hütchenspieler!");
    npc.base.autonpcfunctions.AddTraderTrigger("task","Let me see... I can send you on an epic quest to choose the right nut! Care to bet?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npc.base.autonpcfunctions.AddAdditionalText("No quest today, my money has gone away. The nuts stand forlorn, a symbol of the dawn.");
    npc.base.autonpcfunctions.AddAdditionalText("You are the hero, I am the thimblerig!");
    npc.base.autonpcfunctions.AddTraderTrigger("Aufgabe","Lass mich mal überlegen... Ich kann dich auf die epische Suche nach der richtigen Nuss schicken. Hast du Lust, zu wetten?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npc.base.autonpcfunctions.AddAdditionalText("Leider hab ich keine Abenteuer im Angebot. Wie wärs mit einer kleinen Wette?");
    npc.base.autonpcfunctions.AddAdditionalText("Du bist der Held, ich der Hütchenspieler!");
    npc.base.autonpcfunctions.AddTraderTrigger("tell something","I don't tell no nothing, no!");
    npc.base.autonpcfunctions.AddAdditionalText("Who are you anyway, the town guard?");
    npc.base.autonpcfunctions.AddAdditionalText("I don't cheat! I would never, would I...?");
    npc.base.autonpcfunctions.AddTraderTrigger("erzähl was","Ich erzähl hier gar nichts.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("erzähl etwas");
    npc.base.autonpcfunctions.AddAdditionalText("Wer bist du, einer aus Cadomyr?");
    npc.base.autonpcfunctions.AddAdditionalText("Ich betrüge nicht! Ich doch nicht...");
    -- Small talk
    npc.base.autonpcfunctions.AddTraderTrigger("Galmair","Galmair is a nice place for a thimblerig like me. You know, few guards, lots of money... But somehow, I prefer this tavern.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("There is no place like Galmair. But this tavern is also a good place for gambling, isn't it?");
    npc.base.autonpcfunctions.AddTraderTrigger("Greenbriar","Galmair ist schon ein netter Fleck für einen Hütchenspieler wie mich. Du weißt schon, wenige Wachen, viel Geld... Aber ich bevorzuge irgendwie diese Taverne.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddAdditionalText("Es geht doch nichts über Galmair. Aber diese Taverne ist genau der richtige Ort für ein Spielchen, nicht wahr?");
    npc.base.autonpcfunctions.AddTraderTrigger("townguard","Guards? Uhm, I better be goin'...");
    npc.base.autonpcfunctions.AddAdditionalTrigger("guard");
    npc.base.autonpcfunctions.AddAdditionalText("#me gathers his three nuts and grubs the money, hiding it.");
    npc.base.autonpcfunctions.AddAdditionalText("Oh, a thug just left the tavern, maybe you catch him when you leave now.");
    npc.base.autonpcfunctions.AddAdditionalText("#me whistles innocently.");
    npc.base.autonpcfunctions.AddTraderTrigger("Stadtwache","Wachen? Uhm, ich geh dann jetzt besser...");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Wache");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Wächter");
    npc.base.autonpcfunctions.AddAdditionalText("#me rafft seine drei Nüße und etwas Geld zusammen und versteckt es schnell.");
    npc.base.autonpcfunctions.AddAdditionalText("Oh, ein Dieb ist eben gerade zur Tür heraus, wenn ihr euch beeilt, erwischt ihr ihn noch.");
    npc.base.autonpcfunctions.AddAdditionalText("#me pfeift unschuldig.");
    npc.base.autonpcfunctions.AddTraderTrigger("Tavern","Welcome to the Hostler Junction Inn.");
    npc.base.autonpcfunctions.AddAdditionalText("Indeed, this is a tavern. So, how about we do what is done best in a tavern: Gambling!");
    npc.base.autonpcfunctions.AddAdditionalText("A nice name for a tavern: Hostler Junction Inn. Why don't you make me happy and do some thimblerig with me?");
    npc.base.autonpcfunctions.AddTraderTrigger("Taverne","Willkommen im Hostler Junction Inn.");
    npc.base.autonpcfunctions.AddAdditionalText("In der Tat, dies ist eine Taverne. Also, warum machen wir nicht, was man am besten in einer Taverne macht: Zocken!");
    npc.base.autonpcfunctions.AddAdditionalText("Ein netter Name für eine Taverne: Hostler Junction Inn. Warum machst du mich nicht zu einem glücklichen Halbling und spielst das Hütchenspiel mit mir?");
    npc.base.autonpcfunctions.AddTraderTrigger("Hostler","Welcome to the Hostler Junction Inn.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Bar");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("Indeed, this is a tavern. So, how about we do what is done best in a tavern: Gambling!");
    npc.base.autonpcfunctions.AddAdditionalText("A nice name for a tavern: Hostler Junction Inn. Why don't you make me happy and do some thimblerig with me?");
    npc.base.autonpcfunctions.AddTraderTrigger("Happy Halfling","Willkommen im Hostler Junction Inn.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Bar");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddAdditionalText("In der Tat, dies ist eine Taverne. Also, warum machen wir nicht, was man am besten in einer Taverne macht: Zocken!");
    npc.base.autonpcfunctions.AddAdditionalText("Ein netter Name für eine Taverne: Hostler Junction Inn. Warum machst du mich nicht zu einem glücklichen Halbling und spielst das Hütchenspiel mit mir?");
    npc.base.autonpcfunctions.AddTraderTrigger("Beer","I don't serve here, I am just a guest. A guest with three nuts and a ball.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Drink");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Food");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Dish");
    npc.base.autonpcfunctions.AddAdditionalText("Get your food yourself.");
    npc.base.autonpcfunctions.AddAdditionalText("Hmm?");
    npc.base.autonpcfunctions.AddAdditionalText("What do you want from me?");
    npc.base.autonpcfunctions.AddTraderTrigger("Bier","Ich serviere hier nicht. Ich bin auch nur ein Gast. Ein Gast mit drei Nüßen und einer Kugel.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Getränk");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Trank");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Speise");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Essen");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Gericht");
    npc.base.autonpcfunctions.AddAdditionalText("Hol dir deinen Fraß alleine.");
    npc.base.autonpcfunctions.AddAdditionalText("Hmm?");
    npc.base.autonpcfunctions.AddAdditionalText("Was willst du von mir?");
    npc.base.autonpcfunctions.AddTraderTrigger("Halfling","Without a doubt, I am a halfling. And a poor one.");
    npc.base.autonpcfunctions.AddAdditionalText("What is it you want from me?");
    npc.base.autonpcfunctions.AddAdditionalText("Sure, I am a halfling, or do you see me having a beard and wielding an axe?");
    npc.base.autonpcfunctions.AddTraderTrigger("Halbling","Zweifelsohne bin ich ein Halbling. Und dazu noch ein armer.");
    npc.base.autonpcfunctions.AddAdditionalText("Was genau möchtest du von mir?");
    npc.base.autonpcfunctions.AddAdditionalText("Klar bin ich ein Halbling, oder hab ich etwa einen Bart und trag 'ne Axt?");
    npc.base.autonpcfunctions.AddTraderTrigger("Halfer","Without a doubt, I am a halfling. And a poor one.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hobbit");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("What is it you want from me?");
    npc.base.autonpcfunctions.AddAdditionalText("Sure, I am a halfling, or do you see me having a beard and wielding an axe?");
    npc.base.autonpcfunctions.AddTraderTrigger("Halfer","Zweifelsohne bin ich ein Halbling. Und dazu noch ein armer.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hobbit");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddAdditionalText("Was genau möchtest du von mir?");
    npc.base.autonpcfunctions.AddAdditionalText("Klar bin ich ein Halbling, oder hab ich etwa einen Bart und trag 'ne Axt?");
    npc.base.autonpcfunctions.AddTraderTrigger("cheater","Well, ahm, uhm...");
    npc.base.autonpcfunctions.AddAdditionalTrigger("cheat");
    npc.base.autonpcfunctions.AddAdditionalText("I swear, I don't cheat! Well, apart from that dwarf back then, he just had too much gold.");
    npc.base.autonpcfunctions.AddAdditionalText("No cheating here, three nuts, one ball.");
    npc.base.autonpcfunctions.AddTraderTrigger("Betrüger","Nunja, äh, öh...");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Betrug");
    npc.base.autonpcfunctions.AddAdditionalText("Ich schwör dir, ich betrüge niemals! Naja, außer diesen einen Zwerg damals, der hatte einfach zu viel Gold.");
    npc.base.autonpcfunctions.AddAdditionalText("Hier geht alles mit rechten Dingen zu. Drei Nüße, eine Kugel.");
    npc.base.autonpcfunctions.AddTraderTrigger("Brendan Mason","What do you know about good ol' Brandy? Nah, don't tell me, let's play instead.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Brendan");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Brendan Mason","Was weißt du denn schon vom guten alten Brandy? Nah, erzähls mir gar nicht erst, lass uns spielen.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Brendan");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("Dwarf","Dwarves have lots of gold, don't they? I wish I'd be a dwarf...");
    npc.base.autonpcfunctions.AddTraderTrigger("Zwerg","Zwerge haben viel Gold, nicht wahr? Ich wünschte, ich wäre ein Zwerg...");
    npc.base.autonpcfunctions.AddTraderTrigger("How are you","That is none of your business.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("How feel");
    npc.base.autonpcfunctions.AddAdditionalTrigger("How do you do");
    npc.base.autonpcfunctions.AddAdditionalText("I would feel way better with your money in my purse.");
    npc.base.autonpcfunctions.AddAdditionalText("I feel like playing. Time for some thimblerig?");
    npc.base.autonpcfunctions.AddTraderTrigger("Wie geht","Das geht dich nichts an.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Wie fühlst");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Wie ist es ergangen");
    npc.base.autonpcfunctions.AddAdditionalText("Es würde mir weit besser gehen mit deinem Geld in meiner Tasche.");
    npc.base.autonpcfunctions.AddAdditionalText("Mir ist nach Zocken. Zeit für ein kleines Hütchenspiel?");
    npc.base.autonpcfunctions.AddTraderTrigger("your name","Henning, yes, that's me. My friends call me Henni.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("who are you");
    npc.base.autonpcfunctions.AddAdditionalTrigger("who art thou");
    npc.base.autonpcfunctions.AddAdditionalText("Who wants to know? Nevermind, let's play!");
    npc.base.autonpcfunctions.AddAdditionalText("Well, I am Henning. Are you happy now?");
    npc.base.autonpcfunctions.AddTraderTrigger("dein name","Henning, ja, das bin ich. Meine Freunde nennen mich Henni.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("wer bist du");
    npc.base.autonpcfunctions.AddAdditionalTrigger("wer seid ihr");
    npc.base.autonpcfunctions.AddAdditionalTrigger("wie heißt");
    npc.base.autonpcfunctions.AddAdditionalText("Wer will das wissen? Ach, was solls, lass uns spielen.");
    npc.base.autonpcfunctions.AddAdditionalText("Also ich bin Henning. Bist du jetzt glücklich?");
    npc.base.autonpcfunctions.AddTraderTrigger("Ronagan","Hail Ronagan!");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("My religion is called gold.");
    npc.base.autonpcfunctions.AddAdditionalText("How come Ronagan has no temple around here...? He could not lift it as he tried to steal one!");
    npc.base.autonpcfunctions.AddTraderTrigger("Ronagan","Lobet Ronagan!");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddAdditionalText("Meine Religion heißt Gold.");
    npc.base.autonpcfunctions.AddAdditionalText("Warum hat Ronagan keinen in dieser Gegend? ... Er hat ihn nicht anheben können, als er versucht hat einen zu stehlen!");
    -- Thimblerig!

   npc.base.autonpcfunctions.AddTraderTrigger("silver","I play for copper coins, only.");
    npc.base.autonpcfunctions.AddAdditionalText("I don't gamble for silver coins, but feel free to bet some copper coins.");
    npc.base.autonpcfunctions.AddAdditionalText("Since you're winning anyway, please bet copper coins. I will be broke otherwise!");
    npc.base.autonpcfunctions.AddTraderTrigger("silber","Ich spiele nur um Kupfermünzen.");
    npc.base.autonpcfunctions.AddAdditionalText("Ich spiele nicht um Silber, aber setz' doch ein paar Kupfermünzen.");
    npc.base.autonpcfunctions.AddAdditionalText("Da du ja eh gewinnst, setze bitte Kupfermünzen. Sonst geh' ich noch pleite!");
    npc.base.autonpcfunctions.AddTraderTrigger("gold","I play for copper coins, only.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("I don't gamble for gold coins, but feel free to bet some copper coins.");
    npc.base.autonpcfunctions.AddAdditionalText("Since you're winning anyway, please bet copper coins. I will be broke otherwise!");
    npc.base.autonpcfunctions.AddTraderTrigger("gold","Ich spiele nur um Kupfermünzen.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddAdditionalText("Ich spiele nicht um Gold, aber setz' doch ein paar Kupfermünzen.");
    npc.base.autonpcfunctions.AddAdditionalText("Da du ja eh gewinnst, setze bitte Kupfermünzen. Sonst geh' ich noch pleite!");
    npc.base.autonpcfunctions.AddTraderTrigger("rules","Thimblerig is simple. You say how much you  want to bet and I place a ball under one of three nuts. I shuffle the nuts and you choose the right one. You get twice the money you bet in case you can follow my hands!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("thimblerig");
    npc.base.autonpcfunctions.AddAdditionalTrigger("gamble");
    npc.base.autonpcfunctions.AddAdditionalTrigger("play");
    npc.base.autonpcfunctions.AddAdditionalTrigger("playing");
    npc.base.autonpcfunctions.AddAdditionalTrigger("betting");
    npc.base.autonpcfunctions.AddAdditionalTrigger("gambling");
    npc.base.autonpcfunctions.AddAdditionalTrigger("game");
    npc.base.autonpcfunctions.AddAdditionalTrigger("nuts");
    npc.base.autonpcfunctions.AddTraderTrigger("regeln","Das Hütchenspiel ist eigentlich ganz einfach. Du sagst mir, wie viel du setzen willst und ich verstecke eine Kugel unter einer von drei Nüßen. Ich mische dann die Nüße und du wählst einfach die Richtige. Du bekommst deinen doppelten Einsatz wenn du meinen Händen folgen kannst.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hütchenspiel");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hütchen");
    npc.base.autonpcfunctions.AddAdditionalTrigger("wetten");
    npc.base.autonpcfunctions.AddAdditionalTrigger("spielen");
    npc.base.autonpcfunctions.AddAdditionalTrigger("zocken");
    npc.base.autonpcfunctions.AddAdditionalTrigger("spiel");
    npc.base.autonpcfunctions.AddAdditionalTrigger("spielchen");
    npc.base.autonpcfunctions.AddAdditionalTrigger("nüsse");
    npc.base.autonpcfunctions.AddAdditionalTrigger("nüße");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Einsatz");

   npc.base.autonpcfunctions.AddTraderTrigger("bet %NUMBER","You already betted, choose a nut: Left, middle or right?");
    npc.base.autonpcfunctions.AddCondition("state","<>",0);
    npc.base.autonpcfunctions.AddAdditionalText("You still have to choose a nut. Left, middle or maybe right?");
    npc.base.autonpcfunctions.AddAdditionalText("I await your decision. Under which nut might the ball be hidden?");

   npc.base.autonpcfunctions.AddTraderTrigger("bet %NUMBER","I don't play with you anymore.");
    npc.base.autonpcfunctions.AddCondition("state","=",0);
    npc.base.autonpcfunctions.AddCondition("qpg",">",14);
    npc.base.autonpcfunctions.AddAdditionalText("You won too often, you cheater. I don't play with you.");
    npc.base.autonpcfunctions.AddAdditionalText("Others want to play, too. So, next one.");

   npc.base.autonpcfunctions.AddTraderTrigger("right","So, you want to play with me? How much do you bet?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("left");
    npc.base.autonpcfunctions.AddAdditionalTrigger("middle");
    npc.base.autonpcfunctions.AddCondition("state","=",0);
    npc.base.autonpcfunctions.AddAdditionalText("First, you have to bet, then I will shuffle the nuts.");
    npc.base.autonpcfunctions.AddAdditionalText("We did not start playing, did we?");
    ------------------------to edit
   npc.base.autonpcfunctions.AddTraderTrigger("bet %NUMBER","You don't even have %NUMBER coins.");
    npc.base.autonpcfunctions.AddCondition("state","=",0);
    npc.base.autonpcfunctions.AddCondition("money","<","%NUMBER");
    npc.base.autonpcfunctions.AddAdditionalText("You should not bet more than you have.");
    npc.base.autonpcfunctions.AddAdditionalText("Are you kiddin' me? Count your money!");
    npc.base.autonpcfunctions.AddAdditionalText("Nice try, chap. Get your money before we play, right?");

   npc.base.autonpcfunctions.AddTraderTrigger("bet %NUMBER","Nah, I don't gamble for so much.");
    npc.base.autonpcfunctions.AddCondition("number",">",100);
   npc.base.autonpcfunctions.AddAdditionalText("That's too much, I won't be able to pay you in case you win. And you might win!");
    npc.base.autonpcfunctions.AddAdditionalText("I cannot accept such a high bet, sorry.");
    npc.base.autonpcfunctions.AddAdditionalText("No way, chap! That's too much.");

   npc.base.autonpcfunctions.AddTraderTrigger("bet %NUMBER","#me accepts your bet and places the ball under a nut. He shuffles the nuts and gestures you to choose one. You are pretty sure the ball is under the left one.");
    npc.base.autonpcfunctions.AddConsequence("money","-","%NUMBER");
    npc.base.autonpcfunctions.AddConsequence("state","=","%NUMBER");
    npc.base.autonpcfunctions.AddAdditionalText("#me accepts your bet and places the ball under a nut. He shuffles the nuts and gestures you to choose one. You are pretty sure the ball is under the right one.");
    npc.base.autonpcfunctions.AddAdditionalText("#me accepts your bet and places the ball under a nut. He shuffles the nuts and gestures you to choose one. You are pretty sure the ball is under the one in the middle.");
    npc.base.autonpcfunctions.AddAdditionalText("#me accepts your bet and places the ball under a nut. He shuffles the nuts and gestures you to choose one. You have no clue where the ball is now.");
    npc.base.autonpcfunctions.AddAdditionalText("#me accepts your bet and places the ball under a nut. He shuffles the nuts and gestures you to choose one. The ball might be anywhere, his hands were too fast for you.");


   npc.base.autonpcfunctions.AddTraderTrigger("right","#me lifts the nut. You see... a ball! You won twice your bet.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("left");
    npc.base.autonpcfunctions.AddAdditionalTrigger("middle");
    npc.base.autonpcfunctions.AddCondition("state","<>",0);
    npc.base.autonpcfunctions.AddCondition("chance",33);
    npc.base.autonpcfunctions.AddAdditionalText("We have a winner! Here, the ball was under your nut. Take your won money.");
    npc.base.autonpcfunctions.AddAdditionalText("#me curses as he lifts the nut and a ball can be seen. You win twice your bet!");
    npc.base.autonpcfunctions.AddConsequence("money","+",function( a ) return 2*state; end);
    npc.base.autonpcfunctions.AddConsequence("state","=",0);
    npc.base.autonpcfunctions.AddConsequence("qpg","+",1);

    npc.base.autonpcfunctions.AddTraderTrigger("right","#me lifts the nut. There is no ball, so you lost your bet.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("left");
    npc.base.autonpcfunctions.AddAdditionalTrigger("middle");
    npc.base.autonpcfunctions.AddCondition("state","<>",0);
    npc.base.autonpcfunctions.AddAdditionalText("Bad luck today, chap. No ball under your nut, sorry. Your bet is mine.");
    npc.base.autonpcfunctions.AddAdditionalText("#me lifts the nut with a grin. No ball is under it, so you've lost your bet");
    npc.base.autonpcfunctions.AddAdditionalText("Oh, how sad, no ball under this nut. But maybe you'll have more luck next time?");
    npc.base.autonpcfunctions.AddConsequence("state","=",0);
    npc.base.autonpcfunctions.AddTraderTrigger("setze %NUMBER","Du hast doch schon gesetzt. Wähl' eine Nuß: Links, mitte oder vielleicht rechts?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("wette %NUMBER");
    npc.base.autonpcfunctions.AddAdditionalTrigger("setz %NUMBER");
    npc.base.autonpcfunctions.AddCondition("state","<>",0);
    npc.base.autonpcfunctions.AddAdditionalText("Ich warte noch auf deine Wahl. Unter welche Nuß verbirgt sich wohl die Kugel?");
    npc.base.autonpcfunctions.AddTraderTrigger("setze %NUMBER","Mit dir spiel ich nicht mehr!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("wette %NUMBER");
    npc.base.autonpcfunctions.AddAdditionalTrigger("setz %NUMBER");
    npc.base.autonpcfunctions.AddCondition("state","=",0);
    npc.base.autonpcfunctions.AddCondition("qpg",">",14);
    npc.base.autonpcfunctions.AddAdditionalText("Du hast schon viel zu oft gewonnen, du Trickser. Mit dir spiel ich nicht.");
    npc.base.autonpcfunctions.AddAdditionalText("Andere wollen auch mal spielen. Also, der nächste bitte.");
    npc.base.autonpcfunctions.AddTraderTrigger("setze %NUMBER","Du hast ja nichtmal %NUMBER Münzen.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("wette %NUMBER");
    npc.base.autonpcfunctions.AddAdditionalTrigger("setz %NUMBER");
    npc.base.autonpcfunctions.AddCondition("state","=",0);
    npc.base.autonpcfunctions.AddCondition("money","<","%NUMBER");
    npc.base.autonpcfunctions.AddAdditionalText("Du solltest nicht mehr setzen als du eigentlich hast.");
    npc.base.autonpcfunctions.AddAdditionalText("Willst du mich veräppeln? Zähl mal dein Geld!");
    npc.base.autonpcfunctions.AddAdditionalText("Netter Versuch. Hol erstmal dein Geld, before wir spielen.");
    npc.base.autonpcfunctions.AddTraderTrigger("setze %NUMBER","Nah, um so viel spiele ich nicht.");
    npc.base.autonpcfunctions.AddCondition("number",">",100);
    npc.base.autonpcfunctions.AddAdditionalText("Das ist zu viel. Ich könnte dich nicht auszahlen, solltest du gewinnen. Und du könntest gewinnnen!");
    npc.base.autonpcfunctions.AddAdditionalText("So einen hohen Einsatz kann ich leider nicht aktzeptieren.");
    npc.base.autonpcfunctions.AddAdditionalText("Nichts da, das ist zu viel.");
    npc.base.autonpcfunctions.AddTraderTrigger("setze %NUMBER","#me nimmt deine Wette an und legt die Kugel unter eine Nuß. Er schiebt die Nüße hin und her und deutet dir, eine zu wählen. Du bist ziemlich sicher, dass die Kugel unter der linken Nuß ist.");
    npc.base.autonpcfunctions.AddConsequence("money","-","%NUMBER");
    npc.base.autonpcfunctions.AddConsequence("state","=","%NUMBER");
    npc.base.autonpcfunctions.AddAdditionalText("#me nimmt deine Wette an und legt die Kugel unter eine Nuß. Er schiebt die Nüße hin und her und deutet dir, eine zu wählen. Du bist ziemlich sicher, dass die Kugel unter der rechten Nuß ist.");
    npc.base.autonpcfunctions.AddAdditionalText("#me nimmt deine Wette an und legt die Kugel unter eine Nuß. Er schiebt die Nüße hin und her und deutet dir, eine zu wählen. Du bist ziemlich sicher, dass die Kugel unter der mittleren Nuß ist.");
    npc.base.autonpcfunctions.AddAdditionalText("#me nimmt deine Wette an und legt die Kugel unter eine Nuß. Er schiebt die Nüße hin und her und deutet dir, eine zu wählen. Du hast keine Ahnung, wo die Kugel nun ist.");
    npc.base.autonpcfunctions.AddAdditionalText("#me nimmt deine Wette an und legt die Kugel unter eine Nuß. Er schiebt die Nüße hin und her und deutet dir, eine zu wählen. Die Kugel könnte überall sein, so schnell waren seine Hände.");
    npc.base.autonpcfunctions.AddTraderTrigger("rechts","So, du willst also mit mir spielen? Wieviel setzt du denn?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("links");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mitte");
    npc.base.autonpcfunctions.AddCondition("state","=",0);
    npc.base.autonpcfunctions.AddAdditionalText("Erst mußt du was setzen. Dann schiebe ich die Nüße hin und her.");
    npc.base.autonpcfunctions.AddAdditionalText("Wir haben noch nicht zu spielen angefangen, oder?");
    npc.base.autonpcfunctions.AddTraderTrigger("rechts","#me hebt die Nuß. Du siehst... eine Kugel! Du hast deinen Einsatz verdoppelt.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("links");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mitte");
    npc.base.autonpcfunctions.AddCondition("state","<>",0);
    npc.base.autonpcfunctions.AddCondition("chance",33);
    npc.base.autonpcfunctions.AddAdditionalText("Wir haben einen Gewinner! Hier, die Kugel war unter deiner Nuß. Nimm dein gewonnenes Geld.");
    npc.base.autonpcfunctions.AddAdditionalText("#me flucht als er die Nuß anhebt und eine Kugel zum Vorschein kommt. Du gewinnst deinen doppelten Einsatz.");
    npc.base.autonpcfunctions.AddConsequence("money","+",function( a ) return 2*state; end);
    npc.base.autonpcfunctions.AddConsequence("state","=",0);
    npc.base.autonpcfunctions.AddConsequence("qpg","+",1);
    npc.base.autonpcfunctions.AddTraderTrigger("rechts","#me hebt die Nuß. Es ist keine Kugel drunter, also hast du deinen Einsatz verloren.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("links");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mitte");
    npc.base.autonpcfunctions.AddCondition("state","<>",0);
    npc.base.autonpcfunctions.AddAdditionalText("Kein Glück heute, was? Keine Kugel unter dieser Nuß, dein Einsatz ist mein.");
    npc.base.autonpcfunctions.AddAdditionalText("#me hebt die Kugel mit einem Grinsen. Keine Kugel ist drunter, also hast du deinen Einsatz verloren.");
    npc.base.autonpcfunctions.AddAdditionalText("Oh, wie schade, keine Kugel unter dieser Nuß. Vielleicht hast du beim nächsten mal mehr Glück?");
    npc.base.autonpcfunctions.AddConsequence("state","=",0);
    -- Last catch
    npc.base.autonpcfunctions.AddTraderTrigger("Yes","Yes? Fine, what was the question again? Anyway, if you want to play, say how many coins you want to bet.");
    npc.base.autonpcfunctions.AddTraderTrigger("Ja","Ja? Fein, was war nochmal die Frage? Ach, egal, wenn du wetten willst, sag einfach, wieviele Münzen du setzen willst.");
    npc.base.autonpcfunctions.AddTraderTrigger("No","No... what?");
    npc.base.autonpcfunctions.AddAdditionalText("#me shrugs and replies: I don't quite understand...");
    npc.base.autonpcfunctions.AddTraderTrigger("Nein","Nein... was?");
    npc.base.autonpcfunctions.AddAdditionalText("#me zuckt mit den Schultern und erwidert: Ich versteh' nicht recht...");
    --DELETE THIS LINES ON REALSERVER!!!!!
    npc.base.autonpcfunctions.AddTraderTrigger("debugging","Debugging - queststatus reset to 0");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",0);
    ---------------------------------------
    -- Cycletext
    npc.base.autonpcfunctions.AddCycleText("#me schiebt gelangweilt drei Nüße hin und her.","#me shuffels three nuts around, seeming rather bored.");
    npc.base.autonpcfunctions.AddCycleText("#me pfeift vor sich hin.","#me whistles innocently.");
    npc.base.autonpcfunctions.AddCycleText("#me zählt sein Geld nach und grinst","#me counts his money and grins.");
    npc.base.autonpcfunctions.AddCycleText("#me sitzt vor einem Brett mit drei Nüßen darauf. Seine Finger spielen mit einer kleinen, grauen Kugel.","#me is sitting in front of a board. On the board are three nuts. He is playing around with a small, grey ball.");
    npc.base.autonpcfunctions.AddCycleText("Shh, Lust auf ein Spiel?","Shh, want to play?");
    npc.base.autonpcfunctions.AddCycleText("Psst, du, komm mal her. Ich kann dich reich machen.","Hush, you, come here. I can make you rich.");
    npc.base.autonpcfunctions.AddCycleText("Zeit für die Krötenwanderung. Die Kröten wandern von euren in meinen Geldbeutel.","Time for a coin march from your purse to mine.");
    npc.base.autonpcfunctions.AddCycleText("#me nimmt ein Schluck aus seinem Krug.","#me takes a sip from his mug.");
    npc.base.autonpcfunctions.AddCycleText("Denn Geld regiert die Welt...","Money makes the world go round, the world go round...");
    npc.base.autonpcfunctions.AddCycleText("#me summt vor sich hin.","#me hums silently.");
    npc.base.autonpcfunctions.AddCycleText("Finger weg von meinen Nüssen!","Hands off my nuts!");
    npc.base.autonpcfunctions.AddCycleText("#me hebt seine Augenklappe hoch und blickt in die Gegend.","#me lifts his patch and looks around.");

    -- ********* END DYNAMIC PART ********
    TradSpeakLang={0,6};
    TradStdLang=0;

    npc.base.autonpcfunctions.increaseLangSkill(TradSpeakLang);
    thisNPC.activeLanguage=TradStdLang;

end

function nextCycle()  -- ~10 times per second
    initializeNpc();
    npc.base.autonpcfunctions.SpeakerCycle();
end

function receiveText(texttype, message, originator)
    if npc.base.autonpcfunctions.BasicNPCChecks(originator,2) then
        if npc.base.autonpcfunctions.LangOK(originator,TradSpeakLang) then

               npc.base.autonpcfunctions.TellSmallTalk(message,originator);

      else
            npc.base.autonpcfunctions.Confused(
               "#me sieht dich leicht verwirrt an",
               "#me looks at you a little confused"
            );
        end
    end
end

function lookAtNpc(Char, mode)
    if initLook==nil then
        output={};
        output[0]="Er hat ein schmutziges Gesicht und trägt eine lange Hose. Über sein linkes Auge hat er eine Augenklappe.";
        output[1]="He has a dirty face and wears some long trousers. Over his left eye he has an patch.";
        initLook=1;
    end

    lang=Char:getPlayerLanguage();
    Char:sendCharDescription( thisNPC.id , output[lang] );
end
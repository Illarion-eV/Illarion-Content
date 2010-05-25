-- INSERT INTO npc VALUES (nextval('npc_seq'),halfing,-371,74,0,2,false,'Henning Broomshrub','npc_henning_broomshrub.lua',0);

require("npcs.base.autonpcfunctions")

function useNPC(user,counter,param)
    thisNPC:increaseSkill(1,"common language",100);
    thisNPC:talkLanguage(CCharacter.say, CPlayer.german, "Finger weg!");
    thisNPC:talkLanguage(CCharacter.say, CPlayer.english, "Don't you touch me!");
end

function initializeNpc()
    if TraderFirst then
        return true;
    end

    InitTalkLists();

    -- ********* START DYNAMIC PART ********

    QuestID = 21;
    -- Help
   AddTraderTrigger("Help","[Game Help] This NPC is a thimblerig. You can see him shuffling three nuts over and over again. Say 'I bet X coins' to play. Then, say 'right', 'left' or 'middle' to choose a nut.");
    AddTraderTrigger("Hilfe","[Spielhilfe] Dieser NPC ist ein Hütchenspieler. Er schiebt in einer Tour drei Nüße hin und her. Sag 'Ich wette X Münzen' um zu spielen. Sage dann 'rechts', 'links' oder 'mitte' um eine Nuss zu wählen.");
    -- General speech

   AddTraderTrigger("Hello","Hiho! Time for gambling, right?");
    AddAdditionalTrigger("Greetings");
    AddAdditionalTrigger("Be greeted");
    AddAdditionalTrigger("Hail");
    AddAdditionalTrigger("Good day");
    AddAdditionalTrigger("Good morning");
    AddAdditionalTrigger("Good evening");
    AddAdditionalText("Shh, want to play with me?");
    AddAdditionalText("Hey, you look like somebody who is used to winning. Want to play?");
    AddAdditionalText("Hello. Thimblerig is my business. Want to bet, stranger?");
    AddTraderTrigger("Guten Tag","Hiho! Zeit zum Zocken, nicht wahr?");
    AddAdditionalTrigger("Guten Abend");
    AddAdditionalTrigger("Mahlzeit");
    AddAdditionalTrigger("Tach");
    AddAdditionalTrigger("Moin");
    AddAdditionalText("Shh, willst du mit mir spielen?");
    AddAdditionalText("Hey, du siehtst aus wie jemand, der gerne gewinnt. Willst du wetten?");
    AddAdditionalText("Hallo. Das Hütchenspiel ist mein Handwerk. Willst du was setzen, Fremder?");
    AddTraderTrigger("Hiho","Hiho! Time for gambling, right?");
    AddAdditionalTrigger("Hallo");
    AddAdditionalTrigger("Hey");
    AddAdditionalTrigger("Greebas");
    AddAdditionalTrigger("Greebs");
    AddCondition("lang","english");
    AddAdditionalText("Shh, want to play with me?");
    AddAdditionalText("Hey, you look like somebody who is used to winning. Want to play?");
    AddAdditionalText("Hello. Thimblerig is my business. Want to bet, stranger?");
    AddTraderTrigger("Hiho","Hiho! Zeit zum Zocken, nicht wahr?");
    AddAdditionalTrigger("Hallo");
    AddAdditionalTrigger("Hey");
    AddAdditionalTrigger("Greebas");
    AddAdditionalTrigger("Greebs");
    AddCondition("lang","german");
    AddAdditionalText("Shh, willst du mit mir spielen?");
    AddAdditionalText("Hey, du siehtst aus wie jemand, der gerne gewinnt. Willst du wetten?");
    AddAdditionalText("Hallo. Das Hütchenspiel ist mein Handwerk. Willst du was setzen, Fremder?");
    AddTraderTrigger("Farewell","Yes, yes, and come back with more money!");
    AddAdditionalTrigger("Good bye");
    AddAdditionalTrigger("Bye");
    AddAdditionalTrigger("Fare thy well");
    AddAdditionalText("Bye! May your purse fill again.");
    AddAdditionalText("Goodbye and please don't tell what I am doing here.");
    AddAdditionalText("Ronagan may bless you.");
    AddTraderTrigger("Tschüß","Ja, ja, und komm mit mehr Geld zurück.");
    AddAdditionalTrigger("Tschüss");
    AddAdditionalTrigger("Wiedersehen");
    AddAdditionalTrigger("Gehabt euch wohl");
    AddAdditionalText("Auf wiedersehen. Und möge sich deine Börse wieder mit Gold füllen.");
    AddAdditionalText("Tschüß! Erzähl bitte nichts von dem, was ich hier mache.");
    AddAdditionalText("Möge Ronagan dich segnen.");
    AddTraderTrigger("Ciao","Yes, yes, and come back with more money!");
    AddAdditionalTrigger("Adieu");
    AddAdditionalTrigger("Au revoir");
    AddCondition("lang","english");
    AddAdditionalText("Bye! May your purse fill again.");
    AddAdditionalText("Goodbye and please don't tell what I am doing here.");
    AddAdditionalText("Ronagan may bless you.");
    AddTraderTrigger("Ciao","Ja, ja, und komm mit mehr Geld zurück.");
    AddAdditionalTrigger("Adieu");
    AddAdditionalTrigger("Au revoir");
    AddCondition("lang","german");
    AddAdditionalText("Auf wiedersehen. Und möge sich deine Börse wieder mit Gold füllen.");
    AddAdditionalText("Tschüß! Erzähl bitte nichts von dem, was ich hier mache.");
    AddAdditionalText("Möge Ronagan dich segnen.");
    -- Catching typical NPC phrases
    AddTraderTrigger("what sell","Do I look like a trader!?");
    AddAdditionalTrigger("What buy");
    AddAdditionalTrigger("list wares");
    AddAdditionalTrigger("price of");
    AddAdditionalText("Oh, I forgot my vendor's tray at home. Want to play a game instead?");
    AddAdditionalText("You must be kidding me. I am not a huckster!");
    AddTraderTrigger("was verkauf","Sehe ich aus wie ein Händler?");
    AddAdditionalTrigger("was kauf");
    AddAdditionalTrigger("warenliste");
    AddAdditionalTrigger("preis von");
    AddAdditionalText("Oh, gerade heute hab ich meinen Bauchladen zuhause vergessen. Willst du nicht viel lieber ein Spiel spielen?");
    AddAdditionalText("Willst du mich veräppeln? Ich bin kein Höker!");
    AddTraderTrigger("quest","Let me see... I can send you on an epic quest to choose the right nut! Care to bet?");
    AddCondition("lang","english");
    AddAdditionalText("No quest today, my money has gone away. The nuts stand forlorn, a symbol of the dawn.");
    AddAdditionalText("You are the hero, I am the thimblerig!");
    AddTraderTrigger("quest","Lass mich mal überlegen... Ich kann dich auf die epische Suche nach der richtigen Nuss schicken. Hast du Lust, zu wetten?");
    AddCondition("lang","german");
    AddAdditionalText("Leider hab ich keine Abenteuer im Angebot. Wie wärs mit einer kleinen Wette?");
    AddAdditionalText("Du bist der Held, ich der Hütchenspieler!");
    AddTraderTrigger("task","Let me see... I can send you on an epic quest to choose the right nut! Care to bet?");
    AddAdditionalTrigger("adventure");
    AddAdditionalText("No quest today, my money has gone away. The nuts stand forlorn, a symbol of the dawn.");
    AddAdditionalText("You are the hero, I am the thimblerig!");
    AddTraderTrigger("Aufgabe","Lass mich mal überlegen... Ich kann dich auf die epische Suche nach der richtigen Nuss schicken. Hast du Lust, zu wetten?");
    AddAdditionalTrigger("Abenteuer");
    AddAdditionalText("Leider hab ich keine Abenteuer im Angebot. Wie wärs mit einer kleinen Wette?");
    AddAdditionalText("Du bist der Held, ich der Hütchenspieler!");
    AddTraderTrigger("tell something","I don't tell no nothing, no!");
    AddAdditionalText("Who are you anyway, the town guard?");
    AddAdditionalText("I don't cheat! I would never, would I...?");
    AddTraderTrigger("erzähl was","Ich erzähl hier gar nichts.");
    AddAdditionalTrigger("erzähl etwas");
    AddAdditionalText("Wer bist du, einer aus Cadomyr?");
    AddAdditionalText("Ich betrüge nicht! Ich doch nicht...");
    -- Small talk
    AddTraderTrigger("Galmair","Galmair is a nice place for a thimblerig like me. You know, few guards, lots of money... But somehow, I prefer this tavern.");
    AddCondition("lang","english");
    AddAdditionalText("There is no place like Galmair. But this tavern is also a good place for gambling, isn't it?");
    AddTraderTrigger("Greenbriar","Galmair ist schon ein netter Fleck für einen Hütchenspieler wie mich. Du weißt schon, wenige Wachen, viel Geld... Aber ich bevorzuge irgendwie diese Taverne.");
    AddCondition("lang","german");
    AddAdditionalText("Es geht doch nichts über Galmair. Aber diese Taverne ist genau der richtige Ort für ein Spielchen, nicht wahr?");
    AddTraderTrigger("townguard","Guards? Uhm, I better be goin'...");
    AddAdditionalTrigger("guard");
    AddAdditionalText("#me gathers his three nuts and grubs the money, hiding it.");
    AddAdditionalText("Oh, a thug just left the tavern, maybe you catch him when you leave now.");
    AddAdditionalText("#me whistles innocently.");
    AddTraderTrigger("Stadtwache","Wachen? Uhm, ich geh dann jetzt besser...");
    AddAdditionalTrigger("Wache");
    AddAdditionalTrigger("Wächter");
    AddAdditionalText("#me rafft seine drei Nüße und etwas Geld zusammen und versteckt es schnell.");
    AddAdditionalText("Oh, ein Dieb ist eben gerade zur Tür heraus, wenn ihr euch beeilt, erwischt ihr ihn noch.");
    AddAdditionalText("#me pfeift unschuldig.");
    AddTraderTrigger("Tavern","Welcome to the Hostler Junction Inn.");
    AddAdditionalText("Indeed, this is a tavern. So, how about we do what is done best in a tavern: Gambling!");
    AddAdditionalText("A nice name for a tavern: Hostler Junction Inn. Why don't you make me happy and do some thimblerig with me?");
    AddTraderTrigger("Taverne","Willkommen im Hostler Junction Inn.");
    AddAdditionalText("In der Tat, dies ist eine Taverne. Also, warum machen wir nicht, was man am besten in einer Taverne macht: Zocken!");
    AddAdditionalText("Ein netter Name für eine Taverne: Hostler Junction Inn. Warum machst du mich nicht zu einem glücklichen Halbling und spielst das Hütchenspiel mit mir?");
    AddTraderTrigger("Hostler","Welcome to the Hostler Junction Inn.");
    AddAdditionalTrigger("Bar");
    AddCondition("lang","english");
    AddAdditionalText("Indeed, this is a tavern. So, how about we do what is done best in a tavern: Gambling!");
    AddAdditionalText("A nice name for a tavern: Hostler Junction Inn. Why don't you make me happy and do some thimblerig with me?");
    AddTraderTrigger("Happy Halfling","Willkommen im Hostler Junction Inn.");
    AddAdditionalTrigger("Bar");
    AddCondition("lang","german");
    AddAdditionalText("In der Tat, dies ist eine Taverne. Also, warum machen wir nicht, was man am besten in einer Taverne macht: Zocken!");
    AddAdditionalText("Ein netter Name für eine Taverne: Hostler Junction Inn. Warum machst du mich nicht zu einem glücklichen Halbling und spielst das Hütchenspiel mit mir?");
    AddTraderTrigger("Beer","I don't serve here, I am just a guest. A guest with three nuts and a ball.");
    AddAdditionalTrigger("Drink");
    AddAdditionalTrigger("Food");
    AddAdditionalTrigger("Dish");
    AddAdditionalText("Get your food yourself.");
    AddAdditionalText("Hmm?");
    AddAdditionalText("What do you want from me?");
    AddTraderTrigger("Bier","Ich serviere hier nicht. Ich bin auch nur ein Gast. Ein Gast mit drei Nüßen und einer Kugel.");
    AddAdditionalTrigger("Getränk");
    AddAdditionalTrigger("Trank");
    AddAdditionalTrigger("Speise");
    AddAdditionalTrigger("Essen");
    AddAdditionalTrigger("Gericht");
    AddAdditionalText("Hol dir deinen Fraß alleine.");
    AddAdditionalText("Hmm?");
    AddAdditionalText("Was willst du von mir?");
    AddTraderTrigger("Halfling","Without a doubt, I am a halfling. And a poor one.");
    AddAdditionalText("What is it you want from me?");
    AddAdditionalText("Sure, I am a halfling, or do you see me having a beard and wielding an axe?");
    AddTraderTrigger("Halbling","Zweifelsohne bin ich ein Halbling. Und dazu noch ein armer.");
    AddAdditionalText("Was genau möchtest du von mir?");
    AddAdditionalText("Klar bin ich ein Halbling, oder hab ich etwa einen Bart und trag 'ne Axt?");
    AddTraderTrigger("Halfer","Without a doubt, I am a halfling. And a poor one.");
    AddAdditionalTrigger("Hobbit");
    AddCondition("lang","english");
    AddAdditionalText("What is it you want from me?");
    AddAdditionalText("Sure, I am a halfling, or do you see me having a beard and wielding an axe?");
    AddTraderTrigger("Halfer","Zweifelsohne bin ich ein Halbling. Und dazu noch ein armer.");
    AddAdditionalTrigger("Hobbit");
    AddCondition("lang","german");
    AddAdditionalText("Was genau möchtest du von mir?");
    AddAdditionalText("Klar bin ich ein Halbling, oder hab ich etwa einen Bart und trag 'ne Axt?");
    AddTraderTrigger("cheater","Well, ahm, uhm...");
    AddAdditionalTrigger("cheat");
    AddAdditionalText("I swear, I don't cheat! Well, apart from that dwarf back then, he just had too much gold.");
    AddAdditionalText("No cheating here, three nuts, one ball.");
    AddTraderTrigger("Betrüger","Nunja, äh, öh...");
    AddAdditionalTrigger("Betrug");
    AddAdditionalText("Ich schwör dir, ich betrüge niemals! Naja, außer diesen einen Zwerg damals, der hatte einfach zu viel Gold.");
    AddAdditionalText("Hier geht alles mit rechten Dingen zu. Drei Nüße, eine Kugel.");
    AddTraderTrigger("Brendan Mason","What do you know about good ol' Brandy? Nah, don't tell me, let's play instead.");
    AddAdditionalTrigger("Brendan");
    AddCondition("lang","english");
    AddTraderTrigger("Brendan Mason","Was weißt du denn schon vom guten alten Brandy? Nah, erzähls mir gar nicht erst, lass uns spielen.");
    AddAdditionalTrigger("Brendan");
    AddCondition("lang","german");
    AddTraderTrigger("Dwarf","Dwarves have lots of gold, don't they? I wish I'd be a dwarf...");
    AddTraderTrigger("Zwerg","Zwerge haben viel Gold, nicht wahr? Ich wünschte, ich wäre ein Zwerg...");
    AddTraderTrigger("How are you","That is none of your business.");
    AddAdditionalTrigger("How feel");
    AddAdditionalTrigger("How do you do");
    AddAdditionalText("I would feel way better with your money in my purse.");
    AddAdditionalText("I feel like playing. Time for some thimblerig?");
    AddTraderTrigger("Wie geht","Das geht dich nichts an.");
    AddAdditionalTrigger("Wie fühlst");
    AddAdditionalTrigger("Wie ist es ergangen");
    AddAdditionalText("Es würde mir weit besser gehen mit deinem Geld in meiner Tasche.");
    AddAdditionalText("Mir ist nach Zocken. Zeit für ein kleines Hütchenspiel?");
    AddTraderTrigger("your name","Henning, yes, that's me. My friends call me Henni.");
    AddAdditionalTrigger("who are you");
    AddAdditionalTrigger("who art thou");
    AddAdditionalText("Who wants to know? Nevermind, let's play!");
    AddAdditionalText("Well, I am Henning. Are you happy now?");
    AddTraderTrigger("dein name","Henning, ja, das bin ich. Meine Freunde nennen mich Henni.");
    AddAdditionalTrigger("wer bist du");
    AddAdditionalTrigger("wer seid ihr");
    AddAdditionalTrigger("wie heißt");
    AddAdditionalText("Wer will das wissen? Ach, was solls, lass uns spielen.");
    AddAdditionalText("Also ich bin Henning. Bist du jetzt glücklich?");
    AddTraderTrigger("Ronagan","Hail Ronagan!");
    AddCondition("lang","english");
    AddAdditionalText("My religion is called gold.");
    AddAdditionalText("How come Ronagan has no temple around here...? He could not lift it as he tried to steal one!");
    AddTraderTrigger("Ronagan","Lobet Ronagan!");
    AddCondition("lang","german");
    AddAdditionalText("Meine Religion heißt Gold.");
    AddAdditionalText("Warum hat Ronagan keinen in dieser Gegend? ... Er hat ihn nicht anheben können, als er versucht hat einen zu stehlen!");
    -- Thimblerig!

   AddTraderTrigger("silver","I play for copper coins, only.");
    AddAdditionalText("I don't gamble for silver coins, but feel free to bet some copper coins.");
    AddAdditionalText("Since you're winning anyway, please bet copper coins. I will be broke otherwise!");
    AddTraderTrigger("silber","Ich spiele nur um Kupfermünzen.");
    AddAdditionalText("Ich spiele nicht um Silber, aber setz' doch ein paar Kupfermünzen.");
    AddAdditionalText("Da du ja eh gewinnst, setze bitte Kupfermünzen. Sonst geh' ich noch pleite!");
    AddTraderTrigger("gold","I play for copper coins, only.");
    AddCondition("lang","english");
    AddAdditionalText("I don't gamble for gold coins, but feel free to bet some copper coins.");
    AddAdditionalText("Since you're winning anyway, please bet copper coins. I will be broke otherwise!");
    AddTraderTrigger("gold","Ich spiele nur um Kupfermünzen.");
    AddCondition("lang","german");
    AddAdditionalText("Ich spiele nicht um Gold, aber setz' doch ein paar Kupfermünzen.");
    AddAdditionalText("Da du ja eh gewinnst, setze bitte Kupfermünzen. Sonst geh' ich noch pleite!");
    AddTraderTrigger("rules","Thimblerig is simple. You say how much you  want to bet and I place a ball under one of three nuts. I shuffle the nuts and you choose the right one. You get twice the money you bet in case you can follow my hands!");
    AddAdditionalTrigger("thimblerig");
    AddAdditionalTrigger("gamble");
    AddAdditionalTrigger("play");
    AddAdditionalTrigger("playing");
    AddAdditionalTrigger("betting");
    AddAdditionalTrigger("gambling");
    AddAdditionalTrigger("game");
    AddAdditionalTrigger("nuts");
    AddTraderTrigger("regeln","Das Hütchenspiel ist eigentlich ganz einfach. Du sagst mir, wie viel du setzen willst und ich verstecke eine Kugel unter einer von drei Nüßen. Ich mische dann die Nüße und du wählst einfach die Richtige. Du bekommst deinen doppelten Einsatz wenn du meinen Händen folgen kannst.");
    AddAdditionalTrigger("Hütchenspiel");
    AddAdditionalTrigger("Hütchen");
    AddAdditionalTrigger("wetten");
    AddAdditionalTrigger("spielen");
    AddAdditionalTrigger("zocken");
    AddAdditionalTrigger("spiel");
    AddAdditionalTrigger("spielchen");
    AddAdditionalTrigger("nüsse");
    AddAdditionalTrigger("nüße");
    AddAdditionalTrigger("Einsatz");

   AddTraderTrigger("bet %NUMBER","You already betted, choose a nut: Left, middle or right?");
    AddCondition("state","<>",0);
    AddAdditionalText("You still have to choose a nut. Left, middle or maybe right?");
    AddAdditionalText("I await your decision. Under which nut might the ball be hidden?");

   AddTraderTrigger("bet %NUMBER","I don't play with you anymore.");
    AddCondition("state","=",0);
    AddCondition("qpg",">",14);
    AddAdditionalText("You won too often, you cheater. I don't play with you.");
    AddAdditionalText("Others want to play, too. So, next one.");

   AddTraderTrigger("right","So, you want to play with me? How much do you bet?");
    AddAdditionalTrigger("left");
    AddAdditionalTrigger("middle");
    AddCondition("state","=",0);
    AddAdditionalText("First, you have to bet, then I will shuffle the nuts.");
    AddAdditionalText("We did not start playing, did we?");
    ------------------------to edit
   AddTraderTrigger("bet %NUMBER","You don't even have %NUMBER coins.");
    AddCondition("state","=",0);
    AddCondition("money","<","%NUMBER");
    AddAdditionalText("You should not bet more than you have.");
    AddAdditionalText("Are you kiddin' me? Count your money!");
    AddAdditionalText("Nice try, chap. Get your money before we play, right?");

   AddTraderTrigger("bet %NUMBER","Nah, I don't gamble for so much.");
    AddCondition("number",">",100);
   AddAdditionalText("That's too much, I won't be able to pay you in case you win. And you might win!");
    AddAdditionalText("I cannot accept such a high bet, sorry.");
    AddAdditionalText("No way, chap! That's too much.");

   AddTraderTrigger("bet %NUMBER","#me accepts your bet and places the ball under a nut. He shuffles the nuts and gestures you to choose one. You are pretty sure the ball is under the left one.");
    AddConsequence("money","-","%NUMBER");
    AddConsequence("state","=","%NUMBER");
    AddAdditionalText("#me accepts your bet and places the ball under a nut. He shuffles the nuts and gestures you to choose one. You are pretty sure the ball is under the right one.");
    AddAdditionalText("#me accepts your bet and places the ball under a nut. He shuffles the nuts and gestures you to choose one. You are pretty sure the ball is under the one in the middle.");
    AddAdditionalText("#me accepts your bet and places the ball under a nut. He shuffles the nuts and gestures you to choose one. You have no clue where the ball is now.");
    AddAdditionalText("#me accepts your bet and places the ball under a nut. He shuffles the nuts and gestures you to choose one. The ball might be anywhere, his hands were too fast for you.");


   AddTraderTrigger("right","#me lifts the nut. You see... a ball! You won twice your bet.");
    AddAdditionalTrigger("left");
    AddAdditionalTrigger("middle");
    AddCondition("state","<>",0);
    AddCondition("chance",33);
    AddAdditionalText("We have a winner! Here, the ball was under your nut. Take your won money.");
    AddAdditionalText("#me curses as he lifts the nut and a ball can be seen. You win twice your bet!");
    AddConsequence("money","+",function( a ) return 2*state; end);
    AddConsequence("state","=",0);
    AddConsequence("qpg","+",1);

    AddTraderTrigger("right","#me lifts the nut. There is no ball, so you lost your bet.");
    AddAdditionalTrigger("left");
    AddAdditionalTrigger("middle");
    AddCondition("state","<>",0);
    AddAdditionalText("Bad luck today, chap. No ball under your nut, sorry. Your bet is mine.");
    AddAdditionalText("#me lifts the nut with a grin. No ball is under it, so you've lost your bet");
    AddAdditionalText("Oh, how sad, no ball under this nut. But maybe you'll have more luck next time?");
    AddConsequence("state","=",0);
    AddTraderTrigger("setze %NUMBER","Du hast doch schon gesetzt. Wähl' eine Nuß: Links, mitte oder vielleicht rechts?");
    AddAdditionalTrigger("wette %NUMBER");
    AddAdditionalTrigger("setz %NUMBER");
    AddCondition("state","<>",0);
    AddAdditionalText("Ich warte noch auf deine Wahl. Unter welche Nuß verbirgt sich wohl die Kugel?");
    AddTraderTrigger("setze %NUMBER","Mit dir spiel ich nicht mehr!");
    AddAdditionalTrigger("wette %NUMBER");
    AddAdditionalTrigger("setz %NUMBER");
    AddCondition("state","=",0);
    AddCondition("qpg",">",14);
    AddAdditionalText("Du hast schon viel zu oft gewonnen, du Trickser. Mit dir spiel ich nicht.");
    AddAdditionalText("Andere wollen auch mal spielen. Also, der nächste bitte.");
    AddTraderTrigger("setze %NUMBER","Du hast ja nichtmal %NUMBER Münzen.");
    AddAdditionalTrigger("wette %NUMBER");
    AddAdditionalTrigger("setz %NUMBER");
    AddCondition("state","=",0);
    AddCondition("money","<","%NUMBER");
    AddAdditionalText("Du solltest nicht mehr setzen als du eigentlich hast.");
    AddAdditionalText("Willst du mich veräppeln? Zähl mal dein Geld!");
    AddAdditionalText("Netter Versuch. Hol erstmal dein Geld, before wir spielen.");
    AddTraderTrigger("setze %NUMBER","Nah, um so viel spiele ich nicht.");
    AddCondition("number",">",100);
    AddAdditionalText("Das ist zu viel. Ich könnte dich nicht auszahlen, solltest du gewinnen. Und du könntest gewinnnen!");
    AddAdditionalText("So einen hohen Einsatz kann ich leider nicht aktzeptieren.");
    AddAdditionalText("Nichts da, das ist zu viel.");
    AddTraderTrigger("setze %NUMBER","#me nimmt deine Wette an und legt die Kugel unter eine Nuß. Er schiebt die Nüße hin und her und deutet dir, eine zu wählen. Du bist ziemlich sicher, dass die Kugel unter der linken Nuß ist.");
    AddConsequence("money","-","%NUMBER");
    AddConsequence("state","=","%NUMBER");
    AddAdditionalText("#me nimmt deine Wette an und legt die Kugel unter eine Nuß. Er schiebt die Nüße hin und her und deutet dir, eine zu wählen. Du bist ziemlich sicher, dass die Kugel unter der rechten Nuß ist.");
    AddAdditionalText("#me nimmt deine Wette an und legt die Kugel unter eine Nuß. Er schiebt die Nüße hin und her und deutet dir, eine zu wählen. Du bist ziemlich sicher, dass die Kugel unter der mittleren Nuß ist.");
    AddAdditionalText("#me nimmt deine Wette an und legt die Kugel unter eine Nuß. Er schiebt die Nüße hin und her und deutet dir, eine zu wählen. Du hast keine Ahnung, wo die Kugel nun ist.");
    AddAdditionalText("#me nimmt deine Wette an und legt die Kugel unter eine Nuß. Er schiebt die Nüße hin und her und deutet dir, eine zu wählen. Die Kugel könnte überall sein, so schnell waren seine Hände.");
    AddTraderTrigger("rechts","So, du willst also mit mir spielen? Wieviel setzt du denn?");
    AddAdditionalTrigger("links");
    AddAdditionalTrigger("mitte");
    AddCondition("state","=",0);
    AddAdditionalText("Erst mußt du was setzen. Dann schiebe ich die Nüße hin und her.");
    AddAdditionalText("Wir haben noch nicht zu spielen angefangen, oder?");
    AddTraderTrigger("rechts","#me hebt die Nuß. Du siehst... eine Kugel! Du hast deinen Einsatz verdoppelt.");
    AddAdditionalTrigger("links");
    AddAdditionalTrigger("mitte");
    AddCondition("state","<>",0);
    AddCondition("chance",33);
    AddAdditionalText("Wir haben einen Gewinner! Hier, die Kugel war unter deiner Nuß. Nimm dein gewonnenes Geld.");
    AddAdditionalText("#me flucht als er die Nuß anhebt und eine Kugel zum Vorschein kommt. Du gewinnst deinen doppelten Einsatz.");
    AddConsequence("money","+",function( a ) return 2*state; end);
    AddConsequence("state","=",0);
    AddConsequence("qpg","+",1);
    AddTraderTrigger("rechts","#me hebt die Nuß. Es ist keine Kugel drunter, also hast du deinen Einsatz verloren.");
    AddAdditionalTrigger("links");
    AddAdditionalTrigger("mitte");
    AddCondition("state","<>",0);
    AddAdditionalText("Kein Glück heute, was? Keine Kugel unter dieser Nuß, dein Einsatz ist mein.");
    AddAdditionalText("#me hebt die Kugel mit einem Grinsen. Keine Kugel ist drunter, also hast du deinen Einsatz verloren.");
    AddAdditionalText("Oh, wie schade, keine Kugel unter dieser Nuß. Vielleicht hast du beim nächsten mal mehr Glück?");
    AddConsequence("state","=",0);
    -- Last catch
    AddTraderTrigger("Yes","Yes? Fine, what was the question again? Anyway, if you want to play, say how many coins you want to bet.");
    AddTraderTrigger("Ja","Ja? Fein, was war nochmal die Frage? Ach, egal, wenn du wetten willst, sag einfach, wieviele Münzen du setzen willst.");
    AddTraderTrigger("No","No... what?");
    AddAdditionalText("#me shrugs and replies: I don't quite understand...");
    AddTraderTrigger("Nein","Nein... was?");
    AddAdditionalText("#me zuckt mit den Schultern und erwidert: Ich versteh' nicht recht...");
    --DELETE THIS LINES ON REALSERVER!!!!!
    AddTraderTrigger("debugging","Debugging - queststatus reset to 0");
    AddConsequence("qpg","=",0);
    ---------------------------------------
    -- Cycletext
    AddCycleText("#me schiebt gelangweilt drei Nüße hin und her.","#me shuffels three nuts around, seeming rather bored.");
    AddCycleText("#me pfeift vor sich hin.","#me whistles innocently.");
    AddCycleText("#me zählt sein Geld nach und grinst","#me counts his money and grins.");
    AddCycleText("#me sitzt vor einem Brett mit drei Nüßen darauf. Seine Finger spielen mit einer kleinen, grauen Kugel.","#me is sitting in front of a board. On the board are three nuts. He is playing around with a small, grey ball.");
    AddCycleText("Shh, Lust auf ein Spiel?","Shh, want to play?");
    AddCycleText("Psst, du, komm mal her. Ich kann dich reich machen.","Hush, you, come here. I can make you rich.");
    AddCycleText("Zeit für die Krötenwanderung. Die Kröten wandern von euren in meinen Geldbeutel.","Time for a coin march from your purse to mine.");
    AddCycleText("#me nimmt ein Schluck aus seinem Krug.","#me takes a sip from his mug.");
    AddCycleText("Denn Geld regiert die Welt...","Money makes the world go round, the world go round...");
    AddCycleText("#me summt vor sich hin.","#me hums silently.");
    AddCycleText("Finger weg von meinen Nüssen!","Hands off my nuts!");
    AddCycleText("#me hebt seine Augenklappe hoch und blickt in die Gegend.","#me lifts his patch and looks around.");

    -- ********* END DYNAMIC PART ********
    TradSpeakLang={0,6};
    TradStdLang=0;

    increaseLangSkill(TradSpeakLang);
    thisNPC.activeLanguage=TradStdLang;

end

function nextCycle()  -- ~10 times per second
    initializeNpc();
    SpeakerCycle();
end

function receiveText(texttype, message, originator)
    if BasicNPCChecks(originator,2) then
        if LangOK(originator,TradSpeakLang) then

               TellSmallTalk(message,originator);

      else
            Confused(
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
-- INSERT INTO npc VALUES (nextval('npc_seq'),0,-495,-484,-40,4,false,'Percy Dryless','npc_percy_dryless.lua',0);

require("npc.base.autonpcfunctions")
module("npc.percy_dryless")

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

    QuestID = 25;
    -- Help
    npc.base.autonpcfunctions.AddTraderTrigger("Help","[Game Help] This NPC is the prison guard Percy. Keyphrases: 'Release me, please','I am hungry' 'Give me a new pick axe' 'How high is my remaining punishment?' and 'I want to deliver '.");
    npc.base.autonpcfunctions.AddTraderTrigger("Hilfe","[Spielhilfe] Dieser NPC ist der Gefängnisaufseher Percy. Schlüsselwörter: 'Lass mich bitte frei','Ich bin hungrig','Gib mir bitte eine neue Spitzhacke', 'Wie hoch ist meine übrige Strafe?' und 'Ich möchte  abliefern.'");
    -- General speech
    npc.base.autonpcfunctions.AddTraderTrigger("Hello","What do you want? Ah, I know: You want to feel my whip!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greetings");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Be greeted");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hail");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good day");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good morning");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good evening");
    npc.base.autonpcfunctions.AddAdditionalText("Welcome to my realm, the realm of tears, sweat and hard work.");
    npc.base.autonpcfunctions.AddAdditionalText("Work, scum! Criminals deserve nothing more than pain.");
    npc.base.autonpcfunctions.AddAdditionalText("Tell me you are innocent and I will laugh for the rest of the day.");
    npc.base.autonpcfunctions.AddTraderTrigger("Guten Tag","Was ist? Ah, ich weiß: Du willst meine Peitsche zu spüren kriegen.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Guten Abend");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Mahlzeit");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Tach");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Moin");
    npc.base.autonpcfunctions.AddAdditionalText("Willkommen in meinem Reich, dem Reich der Tränen, des Schweißes und der harten Arbeit.");
    npc.base.autonpcfunctions.AddAdditionalText("Arbeite, Abschaum! Kriminelle verdienen nichts als Schmerz!");
    npc.base.autonpcfunctions.AddAdditionalText("Sag mir jetzt noch, du bist unschuldig und ich lache für den Rest des Tages.");
    npc.base.autonpcfunctions.AddTraderTrigger("Hiho","What do you want? Ah, I know: You want to feel my whip!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npc.base.autonpcfunctions.AddAdditionalTrigger(",english");
    npc.base.autonpcfunctions.AddAdditionalText("Welcome to my realm, the realm of tears, sweat and hard work.");
    npc.base.autonpcfunctions.AddAdditionalText("Work, scum! Criminals deserve nothing more than pain.");
    npc.base.autonpcfunctions.AddAdditionalText("Tell me you are innocent and I will laugh for the rest of the day.");
    npc.base.autonpcfunctions.AddTraderTrigger("Hiho","Was ist? Ah, ich weiß: Du willst meine Peitsche zu spüren kriegen.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npc.base.autonpcfunctions.AddAdditionalTrigger(",german");
    npc.base.autonpcfunctions.AddAdditionalText("Willkommen in meinem Reich, dem Reich der Tränen, des Schweißes und der harten Arbeit.");
    npc.base.autonpcfunctions.AddAdditionalText("Arbeite, Abschaum! Kriminelle verdienen nichts als Schmerz!");
    npc.base.autonpcfunctions.AddAdditionalText("Sag mir jetzt noch, du bist unschuldig und ich lache für den Rest des Tages.");
    npc.base.autonpcfunctions.AddTraderTrigger("Farewell","I do not think you are leaving right now.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good bye");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Bye");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Fare thy well");
    npc.base.autonpcfunctions.AddAdditionalText("So you think you are leaving? Surprise! You aren't!");
    npc.base.autonpcfunctions.AddAdditionalText("When you find the exit, send me a letter.");
    npc.base.autonpcfunctions.AddAdditionalText("Did nobody tell you that you have to stay a bit longer...?");
    npc.base.autonpcfunctions.AddAdditionalText("Nope. Work. Deliver things. Deliver even more things. Then you may get released. Or not.");
    npc.base.autonpcfunctions.AddTraderTrigger("Tschüß","Ich glaube kaum, dass du jetzt gehst.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Tschüss");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Wiedersehen");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Gehabt euch wohl");
    npc.base.autonpcfunctions.AddAdditionalText("So, du glaubst also, du gehst jetzt? Überraschung! Du gehst nicht.");
    npc.base.autonpcfunctions.AddAdditionalText("Wenn du den Ausgang findest, schick mir einen Brief.");
    npc.base.autonpcfunctions.AddAdditionalText("Hat dir niemand gesagt, dass du für eine Weile hier bleibst?");
    npc.base.autonpcfunctions.AddAdditionalText("Nö. Arbeite. Liefere Dinge ab. Liefere noch mehr Dinge ab. Dann wirst du vielleicht entlassen. Oder auch nicht.");
    npc.base.autonpcfunctions.AddTraderTrigger("Ciao","I do not think you are leaving right now.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("So you think you are leaving? Surprise! You aren't!");
    npc.base.autonpcfunctions.AddAdditionalText("When you find the exit, send me a letter.");
    npc.base.autonpcfunctions.AddAdditionalText("Did nobody tell you that you have to stay a bit longer...?");
    npc.base.autonpcfunctions.AddAdditionalText("Nope. Work. Deliver things. Deliver even more things. Then you may get released.");
    npc.base.autonpcfunctions.AddTraderTrigger("Ciao","Ich glaube kaum, dass du jetzt gehst.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddAdditionalText("So, du glaubst also, du gehst jetzt? Überraschung! Du gehst nicht.");
    npc.base.autonpcfunctions.AddAdditionalText("Wenn du den Ausgang findest, schick mir einen Brief.");
    npc.base.autonpcfunctions.AddAdditionalText("Hat dir niemand gesagt, dass du für eine Weile hier bleibst?");
    npc.base.autonpcfunctions.AddAdditionalText("Nö. Arbeite. Liefer Dinge ab. Liefere noch mehr Dinge ab. Dann wirst du vielleicht entlassen.");
    npc.base.autonpcfunctions.AddTraderTrigger("How are you","That is none of your business.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("How feel");
    npc.base.autonpcfunctions.AddAdditionalTrigger("How do you do");
    npc.base.autonpcfunctions.AddAdditionalText("I would feel way better when you'd stop talking and went to work instead!");
    npc.base.autonpcfunctions.AddAdditionalText("I feel like whipping you.");
    npc.base.autonpcfunctions.AddTraderTrigger("Wie geht","Das geht dich nichts an.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Wie fühlst");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Wie ist es ergangen");
    npc.base.autonpcfunctions.AddAdditionalText("Es würde mir weit besser gehen wenn du die Klappe hieltest und arbeiten würdest.");
    npc.base.autonpcfunctions.AddAdditionalText("Mir ist danach, dich auszupeitschen.");
    npc.base.autonpcfunctions.AddTraderTrigger("your name","You can call me 'master'.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("who are you");
    npc.base.autonpcfunctions.AddAdditionalTrigger("who art thou");
    npc.base.autonpcfunctions.AddAdditionalText("Percy Dryless. You will remember this name in your nightmares.");
    npc.base.autonpcfunctions.AddAdditionalText("I have a name at least, your name will be forgotten when you are released... one distant day.");
    npc.base.autonpcfunctions.AddTraderTrigger("dein name","Du kannst mich 'Meister' nennen.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("wer bist du");
    npc.base.autonpcfunctions.AddAdditionalTrigger("wer seid ihr");
    npc.base.autonpcfunctions.AddAdditionalTrigger("wie heißt");
    npc.base.autonpcfunctions.AddAdditionalText("Percy Dryless. Du wirst diesen Namen in deinen Alpträumen schreien.");
    npc.base.autonpcfunctions.AddAdditionalText("Wenigstens habe ich einen Namen, deinen wird man längst vergessen haben, wenn du entlassen wirst.");
    -- Catching typical NPC phrases
    npc.base.autonpcfunctions.AddTraderTrigger("what sell","I could sell you some hits of my whip. Interested!?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("What buy");
    npc.base.autonpcfunctions.AddAdditionalTrigger("list wares");
    npc.base.autonpcfunctions.AddAdditionalTrigger("price of");
    npc.base.autonpcfunctions.AddAdditionalText("I trade pain.");
    npc.base.autonpcfunctions.AddAdditionalText("Stop bartering and work or I will lose patience.");
    npc.base.autonpcfunctions.AddTraderTrigger("was verkauf","Ich kann dir ein paar Peitschenhiebe anbieten. Interesse?!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("was kauf");
    npc.base.autonpcfunctions.AddAdditionalTrigger("warenliste");
    npc.base.autonpcfunctions.AddAdditionalTrigger("preis von");
    npc.base.autonpcfunctions.AddAdditionalText("Ich handel mit Schmerzen.");
    npc.base.autonpcfunctions.AddAdditionalText("Hör auf, rumzufeilschen und arbeite oder ich vergesse mich!");
    npc.base.autonpcfunctions.AddTraderTrigger("quest","#me points his finger at your face and laughs out loud.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("Erm, no quest for you.");
    npc.base.autonpcfunctions.AddAdditionalText("My quest is to whip those who are lazy.");
    npc.base.autonpcfunctions.AddAdditionalText("Let me see... your quest is to work!");
    npc.base.autonpcfunctions.AddTraderTrigger("quest","#me zeigt mit dem Finger auf dich und lacht lauthals los.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddAdditionalText("Äh, keine Queste für dich.");
    npc.base.autonpcfunctions.AddAdditionalText("Meine Bestimmung ist, die Faulen auszupeitschen.");
    npc.base.autonpcfunctions.AddAdditionalText("Wart mal... deine Bestimmung ist es, zu arbeiten.");
    npc.base.autonpcfunctions.AddTraderTrigger("task","#me points his finger at your face and laughs out loud.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npc.base.autonpcfunctions.AddAdditionalText("Erm, no quest for you.");
    npc.base.autonpcfunctions.AddAdditionalText("My quest is to whip those who are lazy.");
    npc.base.autonpcfunctions.AddAdditionalText("Let me see... your quest is to work!");
    npc.base.autonpcfunctions.AddTraderTrigger("Aufgabe","#me zeigt mit dem Finger auf dich und lacht lauthals los.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npc.base.autonpcfunctions.AddAdditionalText("Äh, keine Queste für dich.");
    npc.base.autonpcfunctions.AddAdditionalText("Meine Bestimmung ist, die Faulen auszupeitschen.");
    npc.base.autonpcfunctions.AddAdditionalText("Wart mal... deine Bestimmung ist es, zu arbeiten.");
    npc.base.autonpcfunctions.AddTraderTrigger("tell something","Shut up and work!");
    npc.base.autonpcfunctions.AddAdditionalText("No talking!");
    npc.base.autonpcfunctions.AddAdditionalText("Shut up, swing the pick, you thug!");
    npc.base.autonpcfunctions.AddTraderTrigger("erzähl was","Halt deinen Mund und arbeite!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("erzähl etwas");
    npc.base.autonpcfunctions.AddAdditionalText("Hier wird nicht geplaudert!");
    npc.base.autonpcfunctions.AddAdditionalText("Klappe halten, Hacke schwingen, du Gauner!");
    -- Small talk
    npc.base.autonpcfunctions.AddTraderTrigger("innocent","One word: No.");
    npc.base.autonpcfunctions.AddAdditionalText("You are as innocent as the chance of my whip missing your sorry ass.");
    npc.base.autonpcfunctions.AddAdditionalText("Wake up! You aren't dreaming anymore.");
    npc.base.autonpcfunctions.AddTraderTrigger("unschuldig","Ein Wort: Nein.");
    npc.base.autonpcfunctions.AddAdditionalText("Die Chance, dass du unschuldig bist, ist so groß wie die, dass dich meine Peitsche verfehlt.");
    npc.base.autonpcfunctions.AddAdditionalText("Aufwachen! Du träumst nicht mehr.");
    npc.base.autonpcfunctions.AddTraderTrigger("whip","I call my whip Susi.");
    npc.base.autonpcfunctions.AddAdditionalText("This is my whip. There are many like it but this one is mine. My whip is my best friend. It is my life.");
    npc.base.autonpcfunctions.AddAdditionalText("Wanna feel my whip, thug?");
    npc.base.autonpcfunctions.AddTraderTrigger("peitsche","Ich nenne meine Peitsche Susi.");
    npc.base.autonpcfunctions.AddAdditionalText("Dies ist meine Peitsche. Es gibt viele wie sie aber diese ist meine. Meine Peitsche ist mein bester Freund. Sie ist mein Leben.");
    npc.base.autonpcfunctions.AddAdditionalText("Willst du meine Peitsche spüren, Gauner?");
    npc.base.autonpcfunctions.AddTraderTrigger("criminal","You are as worthless as a cup of water in the ocean.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("thug");
    npc.base.autonpcfunctions.AddAdditionalText("I will never understand why you people break the law.");
    npc.base.autonpcfunctions.AddAdditionalText("Filthy bastard, good to see you here.");
    npc.base.autonpcfunctions.AddTraderTrigger("krimineller","Du bist so wertlos wie eine Tasse Wasser im Meer.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("gauner");
    npc.base.autonpcfunctions.AddAdditionalText("Ich werde nie verstehen, warum ihr Leute das Gesetz brecht.");
    npc.base.autonpcfunctions.AddAdditionalText("Dreckiger Bastard, gut dass du hier bist.");
    npc.base.autonpcfunctions.AddTraderTrigger("master","I am your master from now on. Obey or be whipped. Your choice.");
    npc.base.autonpcfunctions.AddTraderTrigger("meister","Ich bin jetzt dein Herr und Meister. Gehorche oder werde ausgepeitscht. Du hast die Wahl.");
    -- Easter egg
    npc.base.autonpcfunctions.AddTraderTrigger("mr. jingles","If I catch this stupid mouse, I will trample it!");
    -- Prison stuff
    npc.base.autonpcfunctions.AddTraderTrigger("hunger","You don't look hungry to me. Work some more!");
    npc.base.autonpcfunctions.AddCondition("attrib","foodlevel",">",14999);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("No food for lazy scum like you!");
    npc.base.autonpcfunctions.AddTraderTrigger("hunger","Here, have some moulded bread. Back to work!");
    npc.base.autonpcfunctions.AddCondition("attrib","foodlevel","<",15000);
    npc.base.autonpcfunctions.AddCondition("item",49,"all","=",0);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("item",49,1,333,0);
    npc.base.autonpcfunctions.AddTraderTrigger("hunger","Thinking you can get free bread from me, eh? Work on or feel my whip.");
    npc.base.autonpcfunctions.AddCondition("attrib","foodlevel","<",15000);
    npc.base.autonpcfunctions.AddCondition("item",49,"all","<>",0);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("hunger","Du siehst mir noch nicht hungrig genug aus. Arbeite weiter!");
    npc.base.autonpcfunctions.AddCondition("attrib","foodlevel",">",14999);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddAdditionalText("Kein Futter für faulen Abschaum wie dich!");
    npc.base.autonpcfunctions.AddTraderTrigger("hunger","Hier etwas verschimmeltes Brot. Jetzt arbeite weiter!");
    npc.base.autonpcfunctions.AddCondition("attrib","foodlevel","<",15000);
    npc.base.autonpcfunctions.AddCondition("item",49,"all","=",0);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("item",49,1,333,0);
    npc.base.autonpcfunctions.AddTraderTrigger("hunger","Du glaubst wohl, du bekommst noch mehr Brot, häh? Arbeite oder spüre meine Peitsche.");
    npc.base.autonpcfunctions.AddCondition("attrib","foodlevel","<",15000);
    npc.base.autonpcfunctions.AddCondition("item",49,"all","<>",0);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("hungry","You don't look hungry to me. Work some more!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("food");
    npc.base.autonpcfunctions.AddCondition("attrib","foodlevel",">",14999);
    npc.base.autonpcfunctions.AddAdditionalText("No food for lazy scum like you!");
    npc.base.autonpcfunctions.AddTraderTrigger("hungry","Here, have some moulded bread. Back to work!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("food");
    npc.base.autonpcfunctions.AddCondition("attrib","foodlevel","<",15000);
    npc.base.autonpcfunctions.AddCondition("item",49,"all","=",0);
    npc.base.autonpcfunctions.AddConsequence("item",49,1,333,0);
    npc.base.autonpcfunctions.AddTraderTrigger("hungry","Thinking you can get free bread from me, eh? Work on or feel my whip.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("food");
    npc.base.autonpcfunctions.AddCondition("attrib","foodlevel","<",15000);
    npc.base.autonpcfunctions.AddCondition("item",49,"all","<>",0);
    npc.base.autonpcfunctions.AddTraderTrigger("hungrig","Du siehst mir noch nicht hungrig genug aus. Arbeite weiter!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("essen");
    npc.base.autonpcfunctions.AddCondition("attrib","foodlevel",">",14999);
    npc.base.autonpcfunctions.AddAdditionalText("Kein Futter für faulen Abschaum wie dich!");
    npc.base.autonpcfunctions.AddTraderTrigger("hungrig","Hier etwas verschimmeltes Brot. Jetzt arbeite weiter!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("essen");
    npc.base.autonpcfunctions.AddCondition("attrib","foodlevel","<",15000);
    npc.base.autonpcfunctions.AddCondition("item",49,"all","=",0);
    npc.base.autonpcfunctions.AddConsequence("item",49,1,333,0);
    npc.base.autonpcfunctions.AddTraderTrigger("hungrig","Du glaubst wohl, du bekommst noch mehr Brot, häh? Arbeite oder spüre meine Peitsche.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("essen");
    npc.base.autonpcfunctions.AddCondition("attrib","foodlevel","<",15000);
    npc.base.autonpcfunctions.AddCondition("item",49,"all","<>",0);
    npc.base.autonpcfunctions.AddTraderTrigger("pick axe","So, you broke my pick? You lost it? Here, have this one, but pay more attention to it or I whip you.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("rock pick");
    npc.base.autonpcfunctions.AddCondition("item",2763,"all","=",0);
    npc.base.autonpcfunctions.AddCondition("qpg",">",0);
    npc.base.autonpcfunctions.AddConsequence("item",2763,1,333,0);
    npc.base.autonpcfunctions.AddTraderTrigger("pick axe","What do you want with two picks? Hitting stones bihanded?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("rock pick");
    npc.base.autonpcfunctions.AddCondition("item",2763,"all","<>",0);
    npc.base.autonpcfunctions.AddTraderTrigger("spitzhacke","Was willst du mit zwei Spitzhacken? Beidhändig auf die Steine eindreschen?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("hacke");
    npc.base.autonpcfunctions.AddCondition("item",2763,"all","<>",0);
    npc.base.autonpcfunctions.AddTraderTrigger("spitzhacke","So, du hast also meine Spitzhacke kaputt gemacht? Du hast sie verloren? Hier, nimm diese, aber pass besser auf sie auf oder ich peitsche dich aus.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("hacke");
    npc.base.autonpcfunctions.AddCondition("item",2763,"all","=",0);
    npc.base.autonpcfunctions.AddCondition("qpg",">",0);
    npc.base.autonpcfunctions.AddConsequence("item",2763,1,333,0);
    npc.base.autonpcfunctions.AddTraderTrigger("release","No way.");
    npc.base.autonpcfunctions.AddCondition("qpg",">",0);
    npc.base.autonpcfunctions.AddAdditionalText("You'd like to, don't you?");
    npc.base.autonpcfunctions.AddAdditionalText("Sure I'll release you. In a hundred years!");
    npc.base.autonpcfunctions.AddAdditionalText("Shut up!");
    npc.base.autonpcfunctions.AddAdditionalText("Hahahahaha!");
    npc.base.autonpcfunctions.AddAdditionalText("Release you? Sure! What next, shall I wipe your boots?");
    npc.base.autonpcfunctions.AddAdditionalText("No way. Work!");
    npc.base.autonpcfunctions.AddAdditionalText("Wait, let me laugh first.");
    npc.base.autonpcfunctions.AddAdditionalText("You want me to release you? You?");
    npc.base.autonpcfunctions.AddAdditionalText("What kind of joker are you?");
    npc.base.autonpcfunctions.AddTraderTrigger("release","Until next time. They all come back!");
    npc.base.autonpcfunctions.AddCondition("qpg","<",1);
    npc.base.autonpcfunctions.AddConsequence("deleteitem",2763,"all");
	npc.base.autonpcfunctions.AddConsequence("qpg","=",0); --release the n00b
    npc.base.autonpcfunctions.AddTraderTrigger("freilassen","Nichts da.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("lass mich frei");
    npc.base.autonpcfunctions.AddAdditionalTrigger("rauslassen");
    npc.base.autonpcfunctions.AddAdditionalTrigger("lass mich raus");
    npc.base.autonpcfunctions.AddCondition("qpg",">",0);
    npc.base.autonpcfunctions.AddAdditionalText("Das hättest du wohl gerne!");
    npc.base.autonpcfunctions.AddAdditionalText("Ohja, klar lass ich dich frei... in hundert Jahren!");
    npc.base.autonpcfunctions.AddAdditionalText("Schnauze!");
    npc.base.autonpcfunctions.AddAdditionalText("Hahahahahaha!");
    npc.base.autonpcfunctions.AddAdditionalText("Freilassen? Klar! Was noch, soll ich deine Stiefel lecken?");
    npc.base.autonpcfunctions.AddAdditionalText("Nichts da. Arbeite!");
    npc.base.autonpcfunctions.AddAdditionalText("Warte, lass mich erstmal auslachen.");
    npc.base.autonpcfunctions.AddAdditionalText("Du willst also freigelassen werden? Du?");
    npc.base.autonpcfunctions.AddAdditionalText("Was für ein Narr bist du?");
    npc.base.autonpcfunctions.AddTraderTrigger("freilassen","Bis zum nächsten mal. Sie kommen alle wieder!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("lass mich frei");
    npc.base.autonpcfunctions.AddAdditionalTrigger("rauslassen");
    npc.base.autonpcfunctions.AddAdditionalTrigger("lass mich raus");
    npc.base.autonpcfunctions.AddCondition("qpg","<",1);
    npc.base.autonpcfunctions.AddConsequence("deleteitem",2763,"all");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",0); --release the n00b
    npc.base.autonpcfunctions.AddTraderTrigger("gold","You have no gold. Work on, you lazy scumbag.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddCondition("item",234,"all","=",0);
    npc.base.autonpcfunctions.AddTraderTrigger("copper","No copper? Get copper. That is easy enough for you, isn't it?");
    npc.base.autonpcfunctions.AddCondition("item",2536,"all","=",0);
    npc.base.autonpcfunctions.AddTraderTrigger("iron","Are you kidding me? You have no iron ore.");
    npc.base.autonpcfunctions.AddCondition("item",22,"all","=",0);
    npc.base.autonpcfunctions.AddTraderTrigger("deliver coal","How for somebody's sake do you plan to give me something you don't have?");
    npc.base.autonpcfunctions.AddCondition("item",21,"all","=",0);
    npc.base.autonpcfunctions.AddTraderTrigger("gold","Du hast kein Gold. Weiterarbeiten, Drecksack!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("ich liefer gold ab");
    npc.base.autonpcfunctions.AddCondition("item",234,"all","=",0);
    npc.base.autonpcfunctions.AddTraderTrigger("kupfer","Kein Kupfererz? Hol' Kupfererz. So einfach ist das.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("ich liefer kupfer ab");
    npc.base.autonpcfunctions.AddCondition("item",2536,"all","=",0);
    npc.base.autonpcfunctions.AddTraderTrigger("eisen","Machst du Witze? Du hast kein Eisenerz.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("ich liefer eisen ab");
    npc.base.autonpcfunctions.AddCondition("item",22,"all","=",0);
    npc.base.autonpcfunctions.AddTraderTrigger("kohle","Wie zum... gedenkst du, mir etwas zu geben, was du nicht hast?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("ich liefer kohle ab");
    npc.base.autonpcfunctions.AddCondition("item",21,"all","=",0);
    npc.base.autonpcfunctions.AddTraderTrigger("remaining punishment","Pah! You still have to deliver %QUESTSTATUS resources.");
    npc.base.autonpcfunctions.AddCondition("qpg",">",0);
    npc.base.autonpcfunctions.AddAdditionalText("Bring me %QUESTSTATUS resources and I'll release you. Maybe.");
    npc.base.autonpcfunctions.AddAdditionalText("Mercy won't come before you bring me %QUESTSTATUS resources.");
    npc.base.autonpcfunctions.AddTraderTrigger("remaining punishment","You are free to go, thug.");
    npc.base.autonpcfunctions.AddCondition("qpg","<",1);
    npc.base.autonpcfunctions.AddAdditionalText("That was enough, I think I can release you.");
    npc.base.autonpcfunctions.AddTraderTrigger("übrige strafe","Pah! Du mußt mir noch %QUESTSTATUS Ressourcen bringen.");
    npc.base.autonpcfunctions.AddCondition("qpg",">",0);
    npc.base.autonpcfunctions.AddAdditionalText("Bring mir noch %QUESTSTATUS Ressourcen und vielleicht lasse ich dich dann gehen.");
    npc.base.autonpcfunctions.AddAdditionalText("Gnade wird nicht eher gewaltet bevor du mir nicht %QUESTSTATUS Ressourcen bringst.");
    npc.base.autonpcfunctions.AddTraderTrigger("übrige strafe","Du kannst gehen, Gauner.");
    npc.base.autonpcfunctions.AddCondition("qpg","<",1);
    npc.base.autonpcfunctions.AddAdditionalText("Das reicht jetzt, ich denke, ich kann dich freilassen.");
    -- Last catch
    npc.base.autonpcfunctions.AddTraderTrigger("Yes","Yes? Fine, work on.");
    npc.base.autonpcfunctions.AddAdditionalText("Yes? You wanted to say 'yes master'!");
    npc.base.autonpcfunctions.AddTraderTrigger("Ja","Ja? Gut. Arbeite weiter.");
    npc.base.autonpcfunctions.AddAdditionalText("Ja? Das heißt 'Ja, Meister'");
    npc.base.autonpcfunctions.AddTraderTrigger("No","No? You dare to disobey?");
    npc.base.autonpcfunctions.AddAdditionalText("#me barks: 'I will teach you to say 'no'!'");
    npc.base.autonpcfunctions.AddTraderTrigger("Nein","Nein? Wagst du etwa, zu widersprechen?");
    npc.base.autonpcfunctions.AddAdditionalText("#me bellt: 'Ich werde dich lehren, 'Nein' zu sagen!'");

    -- Cycletext
    npc.base.autonpcfunctions.AddCycleText("#me knallt mit seiner Peitsche.","#me cracks his whip.");
    npc.base.autonpcfunctions.AddCycleText("Haut rein, alle, haut rein!","Lets rock, everybody, lets rock.");
    npc.base.autonpcfunctions.AddCycleText("Ich hab das genau gesehen!","I saw that!");
    npc.base.autonpcfunctions.AddCycleText("#me summt: 'Der Trauerkloß saß auf einem Felsblock, in der Ecke und weinte vor sich hin.'","#me hums: 'The sad sack was sittin' on a block of stone, way over in the corner weepin' all alone'.");
    npc.base.autonpcfunctions.AddCycleText("Arbeite!","Work!");
    npc.base.autonpcfunctions.AddCycleText("Schneller!","Faster!");
    npc.base.autonpcfunctions.AddCycleText("Gehorche!","Obey!");
    npc.base.autonpcfunctions.AddCycleText("Mwahaha!","Mwahaha!");
    npc.base.autonpcfunctions.AddCycleText("#me lacht dreckig.","#me laughs diabolically.");
    npc.base.autonpcfunctions.AddCycleText("Ruhe bei der Arbeit, Abschaum!","Be quiet, scum!");
    npc.base.autonpcfunctions.AddCycleText("Ich hab das gehört!","I heard that!");
    npc.base.autonpcfunctions.AddCycleText("#me tritt nach einer Maus.","#me kicks at a mouse.");
    npc.base.autonpcfunctions.AddCycleText("Gute Führung? Ich führe dich gleich an einer Schlinge, ist das gut genug?!","Good conduct? I will teach you 'good conduct' with my whip!");
    -- ********* END DYNAMIC PART ********
    TradSpeakLang={0,1};
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
			if not QuestTrigger(message,originator) then
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

function QuestTrigger(message,originator)
	local TheItemID = 0;
	if string.find(message,"[Gg]old")~=nil then  --gold
		TheItemID = 234;
		gText="Wenigstens etwas Gold. Wenn du es nicht verdienst, freigelassen zu werden - Arbeite!";
		eText="At least some gold. Unless you deserve to be released - work!";
	elseif string.find(message,"[Cc]opper")~=nil or string.find(message,"[Kk]upfer")~=nil then
		TheItemID = 2536;
		gText="Kupfererz, bäh. Her damit und zurück an die Arbeit.";
		eText="Copper. Bah. Give it to me and get back to work.";
	elseif string.find(message,"[Ii]ron")~=nil or string.find(message,"[Ee]isen")~=nil then
		TheItemID = 22;
		gText="So, du denkst du bist der Größte, weil du mir etwas Eisenerz gebracht hast? Danke, weiterarbeiten.";
		eText="So, you think you are the big shot because you found some iron ore? Thanks, work on.";
	elseif string.find(message,"[Cc]oal")~=nil or string.find(message,"[Kk]ohle")~=nil then
		TheItemID = 21;
		gText="Diese Kohle ist genauso dreckig wie du und so schwarz wie deine Seele. Bring mir mehr!";
		eText="This coal is as filthy as you. And as black as your soul. Bring me more!";
	elseif string.find(message,"[Rr]eset")~=nil then   	   ---TO REMOVE ON REALSERVER!!!!
		npc.base.autonpcfunctions.NPCTalking(thisNPC,"Reset done");
        originator:setQuestProgress(25,15); 
        originator:setQuestProgress(26, 2); --sets the town the char got arrested from as imprisoner id
        return false;
	else return false; end

	local ItemAmount = originator:countItem(TheItemID);
	if ItemAmount == 0 then
		return false;
	end
	originator:eraseItem(TheItemID,ItemAmount); --erase the items he wants to deliver
	
	local old_questvalue = originator:getQuestProgress(QuestID);
	local questvalue = originator:getQuestProgress(QuestID) - ItemAmount;
	
	if questvalue<0 then questvalue = 0; end
	originator:setQuestProgress(QuestID, questvalue); --set questprogress with the items he still has to deliver

	if old_questvalue>0 then
		PayToTaxes(originator,ItemAmount); --PAY 1cp per item to taxes of his homefaction
	end
	
	if originator:getQuestProgress(QuestID) < 1 then
		gText="Du hast genug Ressourcen geliefert, du kannst gehen, Gauner.";
	    eText="You brought enough ressources, you are free to go now, thug.";
	end
	outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText); npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
	return true;
end

function PayToTaxes(originator,amount)
	local Imprisoner = originator:getQuestProgress(26); --looks up which town brought him in prison
	
	if Imprisoner == 1 then --cadomyr
        TaxVar = "cadomyr";
	elseif Imprisoner == 2 then --runewick
	    TaxVar = "runewick";
	elseif Imprisoner == 3 then --galmair
	    TaxVar = "galmair";
	else return; end   
	coins = amount+1-1;

	found, currentAmount = ScriptVars:find( TaxVar ); 
	if found then 
		ScriptVars:set( TaxVar, coins+currentAmount);	
	else 
		ScriptVars:set( TaxVar, coins);
	end
	found, sum = ScriptVars:find( TaxVar );
	originator:inform("Npc pays "..coins.." copper coins to town treasury. The treasury of "..TaxVar.." has now "..sum.." copper coins.");
end
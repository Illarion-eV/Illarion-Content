-- INSERT INTO npc VALUES (nextval('npc_seq'),0,-495,-484,-40,4,false,'Percy Dryless','npc_percy_dryless.lua',0);

require("npcs.base.autonpcfunctions")
module("npcs.percy_dryless")

function useNPC(user,counter,param)
    thisNPC:increaseSkill(1,"common language",100);
    thisNPC:talkLanguage(CCharacter.say, CPlayer.german, "Finger weg!");
    thisNPC:talkLanguage(CCharacter.say, CPlayer.english, "Don't you touch me!");
end

function initializeNpc()
    if TraderFirst then
        return true;
    end

    npcs.base.autonpcfunctions.InitTalkLists();

    -- ********* START DYNAMIC PART ********

    QuestID = 25;
    -- Help
    npcs.base.autonpcfunctions.AddTraderTrigger("Help","[Game Help] This NPC is the prison guard Percy. Keyphrases: 'Release me, please','I am hungry' 'Give me a new pick axe' 'How high is my remaining punishment?' and 'I want to deliver '.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Hilfe","[Spielhilfe] Dieser NPC ist der Gefängnisaufseher Percy. Schlüsselwörter: 'Lass mich bitte frei','Ich bin hungrig','Gib mir bitte eine neue Spitzhacke', 'Wie hoch ist meine übrige Strafe?' und 'Ich möchte  abliefern.'");
    -- General speech
    npcs.base.autonpcfunctions.AddTraderTrigger("Hello","What do you want? Ah, I know: You want to feel my whip!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greetings");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Be greeted");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hail");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good day");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good morning");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good evening");
    npcs.base.autonpcfunctions.AddAdditionalText("Welcome to my realm, the realm of tears, sweat and hard work.");
    npcs.base.autonpcfunctions.AddAdditionalText("Work, scum! Criminals deserve nothing more than pain.");
    npcs.base.autonpcfunctions.AddAdditionalText("Tell me you are innocent and I will laugh for the rest of the day.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Guten Tag","Was ist? Ah, ich weiß: Du willst meine Peitsche zu spüren kriegen.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Guten Abend");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Mahlzeit");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Tach");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Moin");
    npcs.base.autonpcfunctions.AddAdditionalText("Willkommen in meinem Reich, dem Reich der Tränen, des Schweißes und der harten Arbeit.");
    npcs.base.autonpcfunctions.AddAdditionalText("Arbeite, Abschaum! Kriminelle verdienen nichts als Schmerz!");
    npcs.base.autonpcfunctions.AddAdditionalText("Sag mir jetzt noch, du bist unschuldig und ich lache für den Rest des Tages.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Hiho","What do you want? Ah, I know: You want to feel my whip!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npcs.base.autonpcfunctions.AddAdditionalTrigger(",english");
    npcs.base.autonpcfunctions.AddAdditionalText("Welcome to my realm, the realm of tears, sweat and hard work.");
    npcs.base.autonpcfunctions.AddAdditionalText("Work, scum! Criminals deserve nothing more than pain.");
    npcs.base.autonpcfunctions.AddAdditionalText("Tell me you are innocent and I will laugh for the rest of the day.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Hiho","Was ist? Ah, ich weiß: Du willst meine Peitsche zu spüren kriegen.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npcs.base.autonpcfunctions.AddAdditionalTrigger(",german");
    npcs.base.autonpcfunctions.AddAdditionalText("Willkommen in meinem Reich, dem Reich der Tränen, des Schweißes und der harten Arbeit.");
    npcs.base.autonpcfunctions.AddAdditionalText("Arbeite, Abschaum! Kriminelle verdienen nichts als Schmerz!");
    npcs.base.autonpcfunctions.AddAdditionalText("Sag mir jetzt noch, du bist unschuldig und ich lache für den Rest des Tages.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Farewell","I do not think you are leaving right now.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good bye");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Bye");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Fare thy well");
    npcs.base.autonpcfunctions.AddAdditionalText("So you think you are leaving? Surprise! You aren't!");
    npcs.base.autonpcfunctions.AddAdditionalText("When you find the exit, send me a letter.");
    npcs.base.autonpcfunctions.AddAdditionalText("Did nobody tell you that you have to stay a bit longer...?");
    npcs.base.autonpcfunctions.AddAdditionalText("Nope. Work. Deliver things. Deliver even more things. Then you may get released. Or not.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Tschüß","Ich glaube kaum, dass du jetzt gehst.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Tschüss");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Wiedersehen");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Gehabt euch wohl");
    npcs.base.autonpcfunctions.AddAdditionalText("So, du glaubst also, du gehst jetzt? Überraschung! Du gehst nicht.");
    npcs.base.autonpcfunctions.AddAdditionalText("Wenn du den Ausgang findest, schick mir einen Brief.");
    npcs.base.autonpcfunctions.AddAdditionalText("Hat dir niemand gesagt, dass du für eine Weile hier bleibst?");
    npcs.base.autonpcfunctions.AddAdditionalText("Nö. Arbeite. Liefere Dinge ab. Liefere noch mehr Dinge ab. Dann wirst du vielleicht entlassen. Oder auch nicht.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Ciao","I do not think you are leaving right now.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddAdditionalText("So you think you are leaving? Surprise! You aren't!");
    npcs.base.autonpcfunctions.AddAdditionalText("When you find the exit, send me a letter.");
    npcs.base.autonpcfunctions.AddAdditionalText("Did nobody tell you that you have to stay a bit longer...?");
    npcs.base.autonpcfunctions.AddAdditionalText("Nope. Work. Deliver things. Deliver even more things. Then you may get released.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Ciao","Ich glaube kaum, dass du jetzt gehst.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddAdditionalText("So, du glaubst also, du gehst jetzt? Überraschung! Du gehst nicht.");
    npcs.base.autonpcfunctions.AddAdditionalText("Wenn du den Ausgang findest, schick mir einen Brief.");
    npcs.base.autonpcfunctions.AddAdditionalText("Hat dir niemand gesagt, dass du für eine Weile hier bleibst?");
    npcs.base.autonpcfunctions.AddAdditionalText("Nö. Arbeite. Liefer Dinge ab. Liefere noch mehr Dinge ab. Dann wirst du vielleicht entlassen.");
    npcs.base.autonpcfunctions.AddTraderTrigger("How are you","That is none of your business.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("How feel");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("How do you do");
    npcs.base.autonpcfunctions.AddAdditionalText("I would feel way better when you'd stop talking and went to work instead!");
    npcs.base.autonpcfunctions.AddAdditionalText("I feel like whipping you.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Wie geht","Das geht dich nichts an.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Wie fühlst");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Wie ist es ergangen");
    npcs.base.autonpcfunctions.AddAdditionalText("Es würde mir weit besser gehen wenn du die Klappe hieltest und arbeiten würdest.");
    npcs.base.autonpcfunctions.AddAdditionalText("Mir ist danach, dich auszupeitschen.");
    npcs.base.autonpcfunctions.AddTraderTrigger("your name","You can call me 'master'.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("who are you");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("who art thou");
    npcs.base.autonpcfunctions.AddAdditionalText("Percy Dryless. You will remember this name in your nightmares.");
    npcs.base.autonpcfunctions.AddAdditionalText("I have a name at least, your name will be forgotten when you are released... one distant day.");
    npcs.base.autonpcfunctions.AddTraderTrigger("dein name","Du kannst mich 'Meister' nennen.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wer bist du");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wer seid ihr");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wie heißt");
    npcs.base.autonpcfunctions.AddAdditionalText("Percy Dryless. Du wirst diesen Namen in deinen Alpträumen schreien.");
    npcs.base.autonpcfunctions.AddAdditionalText("Wenigstens habe ich einen Namen, deinen wird man längst vergessen haben, wenn du entlassen wirst.");
    -- Catching typical NPC phrases
    npcs.base.autonpcfunctions.AddTraderTrigger("what sell","I could sell you some hits of my whip. Interested!?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("What buy");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("list wares");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("price of");
    npcs.base.autonpcfunctions.AddAdditionalText("I trade pain.");
    npcs.base.autonpcfunctions.AddAdditionalText("Stop bartering and work or I will lose patience.");
    npcs.base.autonpcfunctions.AddTraderTrigger("was verkauf","Ich kann dir ein paar Peitschenhiebe anbieten. Interesse?!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("was kauf");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("warenliste");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("preis von");
    npcs.base.autonpcfunctions.AddAdditionalText("Ich handel mit Schmerzen.");
    npcs.base.autonpcfunctions.AddAdditionalText("Hör auf, rumzufeilschen und arbeite oder ich vergesse mich!");
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","#me points his finger at your face and laughs out loud.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddAdditionalText("Erm, no quest for you.");
    npcs.base.autonpcfunctions.AddAdditionalText("My quest is to whip those who are lazy.");
    npcs.base.autonpcfunctions.AddAdditionalText("Let me see... your quest is to work!");
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","#me zeigt mit dem Finger auf dich und lacht lauthals los.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddAdditionalText("Äh, keine Queste für dich.");
    npcs.base.autonpcfunctions.AddAdditionalText("Meine Bestimmung ist, die Faulen auszupeitschen.");
    npcs.base.autonpcfunctions.AddAdditionalText("Wart mal... deine Bestimmung ist es, zu arbeiten.");
    npcs.base.autonpcfunctions.AddTraderTrigger("task","#me points his finger at your face and laughs out loud.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npcs.base.autonpcfunctions.AddAdditionalText("Erm, no quest for you.");
    npcs.base.autonpcfunctions.AddAdditionalText("My quest is to whip those who are lazy.");
    npcs.base.autonpcfunctions.AddAdditionalText("Let me see... your quest is to work!");
    npcs.base.autonpcfunctions.AddTraderTrigger("Aufgabe","#me zeigt mit dem Finger auf dich und lacht lauthals los.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npcs.base.autonpcfunctions.AddAdditionalText("Äh, keine Queste für dich.");
    npcs.base.autonpcfunctions.AddAdditionalText("Meine Bestimmung ist, die Faulen auszupeitschen.");
    npcs.base.autonpcfunctions.AddAdditionalText("Wart mal... deine Bestimmung ist es, zu arbeiten.");
    npcs.base.autonpcfunctions.AddTraderTrigger("tell something","Shut up and work!");
    npcs.base.autonpcfunctions.AddAdditionalText("No talking!");
    npcs.base.autonpcfunctions.AddAdditionalText("Shut up, swing the pick, you thug!");
    npcs.base.autonpcfunctions.AddTraderTrigger("erzähl was","Halt deinen Mund und arbeite!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("erzähl etwas");
    npcs.base.autonpcfunctions.AddAdditionalText("Hier wird nicht geplaudert!");
    npcs.base.autonpcfunctions.AddAdditionalText("Klappe halten, Hacke schwingen, du Gauner!");
    -- Small talk
    npcs.base.autonpcfunctions.AddTraderTrigger("innocent","One word: No.");
    npcs.base.autonpcfunctions.AddAdditionalText("You are as innocent as the chance of my whip missing your sorry ass.");
    npcs.base.autonpcfunctions.AddAdditionalText("Wake up! You aren't dreaming anymore.");
    npcs.base.autonpcfunctions.AddTraderTrigger("unschuldig","Ein Wort: Nein.");
    npcs.base.autonpcfunctions.AddAdditionalText("Die Chance, dass du unschuldig bist, ist so groß wie die, dass dich meine Peitsche verfehlt.");
    npcs.base.autonpcfunctions.AddAdditionalText("Aufwachen! Du träumst nicht mehr.");
    npcs.base.autonpcfunctions.AddTraderTrigger("whip","I call my whip Susi.");
    npcs.base.autonpcfunctions.AddAdditionalText("This is my whip. There are many like it but this one is mine. My whip is my best friend. It is my life.");
    npcs.base.autonpcfunctions.AddAdditionalText("Wanna feel my whip, thug?");
    npcs.base.autonpcfunctions.AddTraderTrigger("peitsche","Ich nenne meine Peitsche Susi.");
    npcs.base.autonpcfunctions.AddAdditionalText("Dies ist meine Peitsche. Es gibt viele wie sie aber diese ist meine. Meine Peitsche ist mein bester Freund. Sie ist mein Leben.");
    npcs.base.autonpcfunctions.AddAdditionalText("Willst du meine Peitsche spüren, Gauner?");
    npcs.base.autonpcfunctions.AddTraderTrigger("criminal","You are as worthless as a cup of water in the ocean.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("thug");
    npcs.base.autonpcfunctions.AddAdditionalText("I will never understand why you people break the law.");
    npcs.base.autonpcfunctions.AddAdditionalText("Filthy bastard, good to see you here.");
    npcs.base.autonpcfunctions.AddTraderTrigger("krimineller","Du bist so wertlos wie eine Tasse Wasser im Meer.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("gauner");
    npcs.base.autonpcfunctions.AddAdditionalText("Ich werde nie verstehen, warum ihr Leute das Gesetz brecht.");
    npcs.base.autonpcfunctions.AddAdditionalText("Dreckiger Bastard, gut dass du hier bist.");
    npcs.base.autonpcfunctions.AddTraderTrigger("master","I am your master from now on. Obey or be whipped. Your choice.");
    npcs.base.autonpcfunctions.AddTraderTrigger("meister","Ich bin jetzt dein Herr und Meister. Gehorche oder werde ausgepeitscht. Du hast die Wahl.");
    -- Easter egg
    npcs.base.autonpcfunctions.AddTraderTrigger("mr. jingles","If I catch this stupid mouse, I will trample it!");
    -- Prison stuff
    npcs.base.autonpcfunctions.AddTraderTrigger("hunger","You don't look hungry to me. Work some more!");
    npcs.base.autonpcfunctions.AddCondition("attrib","foodlevel",">",14999);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddAdditionalText("No food for lazy scum like you!");
    npcs.base.autonpcfunctions.AddTraderTrigger("hunger","Here, have some moulded bread. Back to work!");
    npcs.base.autonpcfunctions.AddCondition("attrib","foodlevel","<",15000);
    npcs.base.autonpcfunctions.AddCondition("item",49,"all","=",0);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("item",49,1,333,0);
    npcs.base.autonpcfunctions.AddTraderTrigger("hunger","Thinking you can get free bread from me, eh? Work on or feel my whip.");
    npcs.base.autonpcfunctions.AddCondition("attrib","foodlevel","<",15000);
    npcs.base.autonpcfunctions.AddCondition("item",49,"all","<>",0);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("hunger","Du siehst mir noch nicht hungrig genug aus. Arbeite weiter!");
    npcs.base.autonpcfunctions.AddCondition("attrib","foodlevel",">",14999);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddAdditionalText("Kein Futter für faulen Abschaum wie dich!");
    npcs.base.autonpcfunctions.AddTraderTrigger("hunger","Hier etwas verschimmeltes Brot. Jetzt arbeite weiter!");
    npcs.base.autonpcfunctions.AddCondition("attrib","foodlevel","<",15000);
    npcs.base.autonpcfunctions.AddCondition("item",49,"all","=",0);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("item",49,1,333,0);
    npcs.base.autonpcfunctions.AddTraderTrigger("hunger","Du glaubst wohl, du bekommst noch mehr Brot, häh? Arbeite oder spüre meine Peitsche.");
    npcs.base.autonpcfunctions.AddCondition("attrib","foodlevel","<",15000);
    npcs.base.autonpcfunctions.AddCondition("item",49,"all","<>",0);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("hungry","You don't look hungry to me. Work some more!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("food");
    npcs.base.autonpcfunctions.AddCondition("attrib","foodlevel",">",14999);
    npcs.base.autonpcfunctions.AddAdditionalText("No food for lazy scum like you!");
    npcs.base.autonpcfunctions.AddTraderTrigger("hungry","Here, have some moulded bread. Back to work!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("food");
    npcs.base.autonpcfunctions.AddCondition("attrib","foodlevel","<",15000);
    npcs.base.autonpcfunctions.AddCondition("item",49,"all","=",0);
    npcs.base.autonpcfunctions.AddConsequence("item",49,1,333,0);
    npcs.base.autonpcfunctions.AddTraderTrigger("hungry","Thinking you can get free bread from me, eh? Work on or feel my whip.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("food");
    npcs.base.autonpcfunctions.AddCondition("attrib","foodlevel","<",15000);
    npcs.base.autonpcfunctions.AddCondition("item",49,"all","<>",0);
    npcs.base.autonpcfunctions.AddTraderTrigger("hungrig","Du siehst mir noch nicht hungrig genug aus. Arbeite weiter!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("essen");
    npcs.base.autonpcfunctions.AddCondition("attrib","foodlevel",">",14999);
    npcs.base.autonpcfunctions.AddAdditionalText("Kein Futter für faulen Abschaum wie dich!");
    npcs.base.autonpcfunctions.AddTraderTrigger("hungrig","Hier etwas verschimmeltes Brot. Jetzt arbeite weiter!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("essen");
    npcs.base.autonpcfunctions.AddCondition("attrib","foodlevel","<",15000);
    npcs.base.autonpcfunctions.AddCondition("item",49,"all","=",0);
    npcs.base.autonpcfunctions.AddConsequence("item",49,1,333,0);
    npcs.base.autonpcfunctions.AddTraderTrigger("hungrig","Du glaubst wohl, du bekommst noch mehr Brot, häh? Arbeite oder spüre meine Peitsche.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("essen");
    npcs.base.autonpcfunctions.AddCondition("attrib","foodlevel","<",15000);
    npcs.base.autonpcfunctions.AddCondition("item",49,"all","<>",0);
    npcs.base.autonpcfunctions.AddTraderTrigger("pick axe","So, you broke my pick? You lost it? Here, have this one, but pay more attention to it or I whip you.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("rock pick");
    npcs.base.autonpcfunctions.AddCondition("item",2763,"all","=",0);
    npcs.base.autonpcfunctions.AddCondition("qpg",">",0);
    npcs.base.autonpcfunctions.AddConsequence("item",2763,1,333,0);
    npcs.base.autonpcfunctions.AddTraderTrigger("pick axe","What do you want with two picks? Hitting stones bihanded?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("rock pick");
    npcs.base.autonpcfunctions.AddCondition("item",2763,"all","<>",0);
    npcs.base.autonpcfunctions.AddTraderTrigger("spitzhacke","Was willst du mit zwei Spitzhacken? Beidhändig auf die Steine eindreschen?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("hacke");
    npcs.base.autonpcfunctions.AddCondition("item",2763,"all","<>",0);
    npcs.base.autonpcfunctions.AddTraderTrigger("spitzhacke","So, du hast also meine Spitzhacke kaputt gemacht? Du hast sie verloren? Hier, nimm diese, aber pass besser auf sie auf oder ich peitsche dich aus.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("hacke");
    npcs.base.autonpcfunctions.AddCondition("item",2763,"all","=",0);
    npcs.base.autonpcfunctions.AddCondition("qpg",">",0);
    npcs.base.autonpcfunctions.AddConsequence("item",2763,1,333,0);
    npcs.base.autonpcfunctions.AddTraderTrigger("release","No way.");
    npcs.base.autonpcfunctions.AddCondition("qpg",">",0);
    npcs.base.autonpcfunctions.AddAdditionalText("You'd like to, don't you?");
    npcs.base.autonpcfunctions.AddAdditionalText("Sure I'll release you. In a hundred years!");
    npcs.base.autonpcfunctions.AddAdditionalText("Shut up!");
    npcs.base.autonpcfunctions.AddAdditionalText("Hahahahaha!");
    npcs.base.autonpcfunctions.AddAdditionalText("Release you? Sure! What next, shall I wipe your boots?");
    npcs.base.autonpcfunctions.AddAdditionalText("No way. Work!");
    npcs.base.autonpcfunctions.AddAdditionalText("Wait, let me laugh first.");
    npcs.base.autonpcfunctions.AddAdditionalText("You want me to release you? You?");
    npcs.base.autonpcfunctions.AddAdditionalText("What kind of joker are you?");
    npcs.base.autonpcfunctions.AddTraderTrigger("release","Until next time. They all come back!");
    npcs.base.autonpcfunctions.AddCondition("qpg","<",1);
    npcs.base.autonpcfunctions.AddConsequence("deleteitem",2763,"all");
	npcs.base.autonpcfunctions.AddConsequence("qpg","=",0); --release the n00b
    npcs.base.autonpcfunctions.AddTraderTrigger("freilassen","Nichts da.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("lass mich frei");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("rauslassen");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("lass mich raus");
    npcs.base.autonpcfunctions.AddCondition("qpg",">",0);
    npcs.base.autonpcfunctions.AddAdditionalText("Das hättest du wohl gerne!");
    npcs.base.autonpcfunctions.AddAdditionalText("Ohja, klar lass ich dich frei... in hundert Jahren!");
    npcs.base.autonpcfunctions.AddAdditionalText("Schnauze!");
    npcs.base.autonpcfunctions.AddAdditionalText("Hahahahahaha!");
    npcs.base.autonpcfunctions.AddAdditionalText("Freilassen? Klar! Was noch, soll ich deine Stiefel lecken?");
    npcs.base.autonpcfunctions.AddAdditionalText("Nichts da. Arbeite!");
    npcs.base.autonpcfunctions.AddAdditionalText("Warte, lass mich erstmal auslachen.");
    npcs.base.autonpcfunctions.AddAdditionalText("Du willst also freigelassen werden? Du?");
    npcs.base.autonpcfunctions.AddAdditionalText("Was für ein Narr bist du?");
    npcs.base.autonpcfunctions.AddTraderTrigger("freilassen","Bis zum nächsten mal. Sie kommen alle wieder!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("lass mich frei");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("rauslassen");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("lass mich raus");
    npcs.base.autonpcfunctions.AddCondition("qpg","<",1);
    npcs.base.autonpcfunctions.AddConsequence("deleteitem",2763,"all");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",0); --release the n00b
    npcs.base.autonpcfunctions.AddTraderTrigger("gold","You have no gold. Work on, you lazy scumbag.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddCondition("item",234,"all","=",0);
    npcs.base.autonpcfunctions.AddTraderTrigger("copper","No copper? Get copper. That is easy enough for you, isn't it?");
    npcs.base.autonpcfunctions.AddCondition("item",2536,"all","=",0);
    npcs.base.autonpcfunctions.AddTraderTrigger("iron","Are you kidding me? You have no iron ore.");
    npcs.base.autonpcfunctions.AddCondition("item",22,"all","=",0);
    npcs.base.autonpcfunctions.AddTraderTrigger("deliver coal","How for somebody's sake do you plan to give me something you don't have?");
    npcs.base.autonpcfunctions.AddCondition("item",21,"all","=",0);
    npcs.base.autonpcfunctions.AddTraderTrigger("gold","Du hast kein Gold. Weiterarbeiten, Drecksack!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("ich liefer gold ab");
    npcs.base.autonpcfunctions.AddCondition("item",234,"all","=",0);
    npcs.base.autonpcfunctions.AddTraderTrigger("kupfer","Kein Kupfererz? Hol' Kupfererz. So einfach ist das.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("ich liefer kupfer ab");
    npcs.base.autonpcfunctions.AddCondition("item",2536,"all","=",0);
    npcs.base.autonpcfunctions.AddTraderTrigger("eisen","Machst du Witze? Du hast kein Eisenerz.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("ich liefer eisen ab");
    npcs.base.autonpcfunctions.AddCondition("item",22,"all","=",0);
    npcs.base.autonpcfunctions.AddTraderTrigger("kohle","Wie zum... gedenkst du, mir etwas zu geben, was du nicht hast?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("ich liefer kohle ab");
    npcs.base.autonpcfunctions.AddCondition("item",21,"all","=",0);
    npcs.base.autonpcfunctions.AddTraderTrigger("remaining punishment","Pah! You still have to deliver %QUESTSTATUS resources.");
    npcs.base.autonpcfunctions.AddCondition("qpg",">",0);
    npcs.base.autonpcfunctions.AddAdditionalText("Bring me %QUESTSTATUS resources and I'll release you. Maybe.");
    npcs.base.autonpcfunctions.AddAdditionalText("Mercy won't come before you bring me %QUESTSTATUS resources.");
    npcs.base.autonpcfunctions.AddTraderTrigger("remaining punishment","You are free to go, thug.");
    npcs.base.autonpcfunctions.AddCondition("qpg","<",1);
    npcs.base.autonpcfunctions.AddAdditionalText("That was enough, I think I can release you.");
    npcs.base.autonpcfunctions.AddTraderTrigger("übrige strafe","Pah! Du mußt mir noch %QUESTSTATUS Ressourcen bringen.");
    npcs.base.autonpcfunctions.AddCondition("qpg",">",0);
    npcs.base.autonpcfunctions.AddAdditionalText("Bring mir noch %QUESTSTATUS Ressourcen und vielleicht lasse ich dich dann gehen.");
    npcs.base.autonpcfunctions.AddAdditionalText("Gnade wird nicht eher gewaltet bevor du mir nicht %QUESTSTATUS Ressourcen bringst.");
    npcs.base.autonpcfunctions.AddTraderTrigger("übrige strafe","Du kannst gehen, Gauner.");
    npcs.base.autonpcfunctions.AddCondition("qpg","<",1);
    npcs.base.autonpcfunctions.AddAdditionalText("Das reicht jetzt, ich denke, ich kann dich freilassen.");
    -- Last catch
    npcs.base.autonpcfunctions.AddTraderTrigger("Yes","Yes? Fine, work on.");
    npcs.base.autonpcfunctions.AddAdditionalText("Yes? You wanted to say 'yes master'!");
    npcs.base.autonpcfunctions.AddTraderTrigger("Ja","Ja? Gut. Arbeite weiter.");
    npcs.base.autonpcfunctions.AddAdditionalText("Ja? Das heißt 'Ja, Meister'");
    npcs.base.autonpcfunctions.AddTraderTrigger("No","No? You dare to disobey?");
    npcs.base.autonpcfunctions.AddAdditionalText("#me barks: 'I will teach you to say 'no'!'");
    npcs.base.autonpcfunctions.AddTraderTrigger("Nein","Nein? Wagst du etwa, zu widersprechen?");
    npcs.base.autonpcfunctions.AddAdditionalText("#me bellt: 'Ich werde dich lehren, 'Nein' zu sagen!'");

    -- Cycletext
    npcs.base.autonpcfunctions.AddCycleText("#me knallt mit seiner Peitsche.","#me cracks his whip.");
    npcs.base.autonpcfunctions.AddCycleText("Haut rein, alle, haut rein!","Lets rock, everybody, lets rock.");
    npcs.base.autonpcfunctions.AddCycleText("Ich hab das genau gesehen!","I saw that!");
    npcs.base.autonpcfunctions.AddCycleText("#me summt: 'Der Trauerkloß saß auf einem Felsblock, in der Ecke und weinte vor sich hin.'","#me hums: 'The sad sack was sittin' on a block of stone, way over in the corner weepin' all alone'.");
    npcs.base.autonpcfunctions.AddCycleText("Arbeite!","Work!");
    npcs.base.autonpcfunctions.AddCycleText("Schneller!","Faster!");
    npcs.base.autonpcfunctions.AddCycleText("Gehorche!","Obey!");
    npcs.base.autonpcfunctions.AddCycleText("Mwahaha!","Mwahaha!");
    npcs.base.autonpcfunctions.AddCycleText("#me lacht dreckig.","#me laughs diabolically.");
    npcs.base.autonpcfunctions.AddCycleText("Ruhe bei der Arbeit, Abschaum!","Be quiet, scum!");
    npcs.base.autonpcfunctions.AddCycleText("Ich hab das gehört!","I heard that!");
    npcs.base.autonpcfunctions.AddCycleText("#me tritt nach einer Maus.","#me kicks at a mouse.");
    npcs.base.autonpcfunctions.AddCycleText("Gute Führung? Ich führe dich gleich an einer Schlinge, ist das gut genug?!","Good conduct? I will teach you 'good conduct' with my whip!");
    -- ********* END DYNAMIC PART ********
    TradSpeakLang={0,1};
    TradStdLang=0;

    npcs.base.autonpcfunctions.increaseLangSkill(TradSpeakLang);
    thisNPC.activeLanguage=TradStdLang;

end

function nextCycle()  -- ~10 times per second
    initializeNpc();
    npcs.base.autonpcfunctions.SpeakerCycle();
end

function receiveText(texttype, message, originator)
    if npcs.base.autonpcfunctions.BasicNPCChecks(originator,2) then
        if npcs.base.autonpcfunctions.LangOK(originator,TradSpeakLang) then
			if not QuestTrigger(message,originator) then
				npcs.base.autonpcfunctions.TellSmallTalk(message,originator);
			end
			
        else
            npcs.base.autonpcfunctions.Confused(
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
		npcs.base.autonpcfunctions.NPCTalking(thisNPC,"Reset done");
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
	outText=base.common.npcs.base.npcautofunction.GetNLS(originator,gText,eText); npcs.base.autonpcfunctions.NPCTalking(thisNPC,outText);
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
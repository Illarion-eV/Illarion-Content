-- INSERT INTO npc VALUES (nextval('npc_seq'),0,-495,-484,-40,4,false,'Percy Dryless','npc_percy_dryless.lua',0);

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

    QuestID = 25;
    -- Help
    AddTraderTrigger("Help","[Game Help] This NPC is the prison guard Percy. Keyphrases: 'Release me, please','I am hungry' 'Give me a new pick axe' 'How high is my remaining punishment?' and 'I want to deliver '.");
    AddTraderTrigger("Hilfe","[Spielhilfe] Dieser NPC ist der Gefängnisaufseher Percy. Schlüsselwörter: 'Lass mich bitte frei','Ich bin hungrig','Gib mir bitte eine neue Spitzhacke', 'Wie hoch ist meine übrige Strafe?' und 'Ich möchte  abliefern.'");
    -- General speech
    AddTraderTrigger("Hello","What do you want? Ah, I know: You want to feel my whip!");
    AddAdditionalTrigger("Greetings");
    AddAdditionalTrigger("Be greeted");
    AddAdditionalTrigger("Hail");
    AddAdditionalTrigger("Good day");
    AddAdditionalTrigger("Good morning");
    AddAdditionalTrigger("Good evening");
    AddAdditionalText("Welcome to my realm, the realm of tears, sweat and hard work.");
    AddAdditionalText("Work, scum! Criminals deserve nothing more than pain.");
    AddAdditionalText("Tell me you are innocent and I will laugh for the rest of the day.");
    AddTraderTrigger("Guten Tag","Was ist? Ah, ich weiß: Du willst meine Peitsche zu spüren kriegen.");
    AddAdditionalTrigger("Guten Abend");
    AddAdditionalTrigger("Mahlzeit");
    AddAdditionalTrigger("Tach");
    AddAdditionalTrigger("Moin");
    AddAdditionalText("Willkommen in meinem Reich, dem Reich der Tränen, des Schweißes und der harten Arbeit.");
    AddAdditionalText("Arbeite, Abschaum! Kriminelle verdienen nichts als Schmerz!");
    AddAdditionalText("Sag mir jetzt noch, du bist unschuldig und ich lache für den Rest des Tages.");
    AddTraderTrigger("Hiho","What do you want? Ah, I know: You want to feel my whip!");
    AddAdditionalTrigger("Hallo");
    AddAdditionalTrigger("Hey");
    AddAdditionalTrigger("Greebas");
    AddAdditionalTrigger(",english");
    AddAdditionalText("Welcome to my realm, the realm of tears, sweat and hard work.");
    AddAdditionalText("Work, scum! Criminals deserve nothing more than pain.");
    AddAdditionalText("Tell me you are innocent and I will laugh for the rest of the day.");
    AddTraderTrigger("Hiho","Was ist? Ah, ich weiß: Du willst meine Peitsche zu spüren kriegen.");
    AddAdditionalTrigger("Hallo");
    AddAdditionalTrigger("Hey");
    AddAdditionalTrigger("Greebas");
    AddAdditionalTrigger(",german");
    AddAdditionalText("Willkommen in meinem Reich, dem Reich der Tränen, des Schweißes und der harten Arbeit.");
    AddAdditionalText("Arbeite, Abschaum! Kriminelle verdienen nichts als Schmerz!");
    AddAdditionalText("Sag mir jetzt noch, du bist unschuldig und ich lache für den Rest des Tages.");
    AddTraderTrigger("Farewell","I do not think you are leaving right now.");
    AddAdditionalTrigger("Good bye");
    AddAdditionalTrigger("Bye");
    AddAdditionalTrigger("Fare thy well");
    AddAdditionalText("So you think you are leaving? Surprise! You aren't!");
    AddAdditionalText("When you find the exit, send me a letter.");
    AddAdditionalText("Did nobody tell you that you have to stay a bit longer...?");
    AddAdditionalText("Nope. Work. Deliver things. Deliver even more things. Then you may get released. Or not.");
    AddTraderTrigger("Tschüß","Ich glaube kaum, dass du jetzt gehst.");
    AddAdditionalTrigger("Tschüss");
    AddAdditionalTrigger("Wiedersehen");
    AddAdditionalTrigger("Gehabt euch wohl");
    AddAdditionalText("So, du glaubst also, du gehst jetzt? Überraschung! Du gehst nicht.");
    AddAdditionalText("Wenn du den Ausgang findest, schick mir einen Brief.");
    AddAdditionalText("Hat dir niemand gesagt, dass du für eine Weile hier bleibst?");
    AddAdditionalText("Nö. Arbeite. Liefere Dinge ab. Liefere noch mehr Dinge ab. Dann wirst du vielleicht entlassen. Oder auch nicht.");
    AddTraderTrigger("Ciao","I do not think you are leaving right now.");
    AddAdditionalTrigger("Adieu");
    AddAdditionalTrigger("Au revoir");
    AddCondition("lang","english");
    AddAdditionalText("So you think you are leaving? Surprise! You aren't!");
    AddAdditionalText("When you find the exit, send me a letter.");
    AddAdditionalText("Did nobody tell you that you have to stay a bit longer...?");
    AddAdditionalText("Nope. Work. Deliver things. Deliver even more things. Then you may get released.");
    AddTraderTrigger("Ciao","Ich glaube kaum, dass du jetzt gehst.");
    AddAdditionalTrigger("Adieu");
    AddAdditionalTrigger("Au revoir");
    AddCondition("lang","german");
    AddAdditionalText("So, du glaubst also, du gehst jetzt? Überraschung! Du gehst nicht.");
    AddAdditionalText("Wenn du den Ausgang findest, schick mir einen Brief.");
    AddAdditionalText("Hat dir niemand gesagt, dass du für eine Weile hier bleibst?");
    AddAdditionalText("Nö. Arbeite. Liefer Dinge ab. Liefere noch mehr Dinge ab. Dann wirst du vielleicht entlassen.");
    AddTraderTrigger("How are you","That is none of your business.");
    AddAdditionalTrigger("How feel");
    AddAdditionalTrigger("How do you do");
    AddAdditionalText("I would feel way better when you'd stop talking and went to work instead!");
    AddAdditionalText("I feel like whipping you.");
    AddTraderTrigger("Wie geht","Das geht dich nichts an.");
    AddAdditionalTrigger("Wie fühlst");
    AddAdditionalTrigger("Wie ist es ergangen");
    AddAdditionalText("Es würde mir weit besser gehen wenn du die Klappe hieltest und arbeiten würdest.");
    AddAdditionalText("Mir ist danach, dich auszupeitschen.");
    AddTraderTrigger("your name","You can call me 'master'.");
    AddAdditionalTrigger("who are you");
    AddAdditionalTrigger("who art thou");
    AddAdditionalText("Percy Dryless. You will remember this name in your nightmares.");
    AddAdditionalText("I have a name at least, your name will be forgotten when you are released... one distant day.");
    AddTraderTrigger("dein name","Du kannst mich 'Meister' nennen.");
    AddAdditionalTrigger("wer bist du");
    AddAdditionalTrigger("wer seid ihr");
    AddAdditionalTrigger("wie heißt");
    AddAdditionalText("Percy Dryless. Du wirst diesen Namen in deinen Alpträumen schreien.");
    AddAdditionalText("Wenigstens habe ich einen Namen, deinen wird man längst vergessen haben, wenn du entlassen wirst.");
    -- Catching typical NPC phrases
    AddTraderTrigger("what sell","I could sell you some hits of my whip. Interested!?");
    AddAdditionalTrigger("What buy");
    AddAdditionalTrigger("list wares");
    AddAdditionalTrigger("price of");
    AddAdditionalText("I trade pain.");
    AddAdditionalText("Stop bartering and work or I will lose patience.");
    AddTraderTrigger("was verkauf","Ich kann dir ein paar Peitschenhiebe anbieten. Interesse?!");
    AddAdditionalTrigger("was kauf");
    AddAdditionalTrigger("warenliste");
    AddAdditionalTrigger("preis von");
    AddAdditionalText("Ich handel mit Schmerzen.");
    AddAdditionalText("Hör auf, rumzufeilschen und arbeite oder ich vergesse mich!");
    AddTraderTrigger("quest","#me points his finger at your face and laughs out loud.");
    AddCondition("lang","english");
    AddAdditionalText("Erm, no quest for you.");
    AddAdditionalText("My quest is to whip those who are lazy.");
    AddAdditionalText("Let me see... your quest is to work!");
    AddTraderTrigger("quest","#me zeigt mit dem Finger auf dich und lacht lauthals los.");
    AddCondition("lang","german");
    AddAdditionalText("Äh, keine Queste für dich.");
    AddAdditionalText("Meine Bestimmung ist, die Faulen auszupeitschen.");
    AddAdditionalText("Wart mal... deine Bestimmung ist es, zu arbeiten.");
    AddTraderTrigger("task","#me points his finger at your face and laughs out loud.");
    AddAdditionalTrigger("adventure");
    AddAdditionalText("Erm, no quest for you.");
    AddAdditionalText("My quest is to whip those who are lazy.");
    AddAdditionalText("Let me see... your quest is to work!");
    AddTraderTrigger("Aufgabe","#me zeigt mit dem Finger auf dich und lacht lauthals los.");
    AddAdditionalTrigger("Abenteuer");
    AddAdditionalText("Äh, keine Queste für dich.");
    AddAdditionalText("Meine Bestimmung ist, die Faulen auszupeitschen.");
    AddAdditionalText("Wart mal... deine Bestimmung ist es, zu arbeiten.");
    AddTraderTrigger("tell something","Shut up and work!");
    AddAdditionalText("No talking!");
    AddAdditionalText("Shut up, swing the pick, you thug!");
    AddTraderTrigger("erzähl was","Halt deinen Mund und arbeite!");
    AddAdditionalTrigger("erzähl etwas");
    AddAdditionalText("Hier wird nicht geplaudert!");
    AddAdditionalText("Klappe halten, Hacke schwingen, du Gauner!");
    -- Small talk
    AddTraderTrigger("innocent","One word: No.");
    AddAdditionalText("You are as innocent as the chance of my whip missing your sorry ass.");
    AddAdditionalText("Wake up! You aren't dreaming anymore.");
    AddTraderTrigger("unschuldig","Ein Wort: Nein.");
    AddAdditionalText("Die Chance, dass du unschuldig bist, ist so groß wie die, dass dich meine Peitsche verfehlt.");
    AddAdditionalText("Aufwachen! Du träumst nicht mehr.");
    AddTraderTrigger("whip","I call my whip Susi.");
    AddAdditionalText("This is my whip. There are many like it but this one is mine. My whip is my best friend. It is my life.");
    AddAdditionalText("Wanna feel my whip, thug?");
    AddTraderTrigger("peitsche","Ich nenne meine Peitsche Susi.");
    AddAdditionalText("Dies ist meine Peitsche. Es gibt viele wie sie aber diese ist meine. Meine Peitsche ist mein bester Freund. Sie ist mein Leben.");
    AddAdditionalText("Willst du meine Peitsche spüren, Gauner?");
    AddTraderTrigger("criminal","You are as worthless as a cup of water in the ocean.");
    AddAdditionalTrigger("thug");
    AddAdditionalText("I will never understand why you people break the law.");
    AddAdditionalText("Filthy bastard, good to see you here.");
    AddTraderTrigger("krimineller","Du bist so wertlos wie eine Tasse Wasser im Meer.");
    AddAdditionalTrigger("gauner");
    AddAdditionalText("Ich werde nie verstehen, warum ihr Leute das Gesetz brecht.");
    AddAdditionalText("Dreckiger Bastard, gut dass du hier bist.");
    AddTraderTrigger("master","I am your master from now on. Obey or be whipped. Your choice.");
    AddTraderTrigger("meister","Ich bin jetzt dein Herr und Meister. Gehorche oder werde ausgepeitscht. Du hast die Wahl.");
    -- Easter egg
    AddTraderTrigger("mr. jingles","If I catch this stupid mouse, I will trample it!");
    -- Prison stuff
    AddTraderTrigger("hunger","You don't look hungry to me. Work some more!");
    AddCondition("attrib","foodlevel",">",14999);
    AddCondition("lang","english");
    AddAdditionalText("No food for lazy scum like you!");
    AddTraderTrigger("hunger","Here, have some moulded bread. Back to work!");
    AddCondition("attrib","foodlevel","<",15000);
    AddCondition("item",49,"all","=",0);
    AddCondition("lang","english");
    AddConsequence("item",49,1,333,0);
    AddTraderTrigger("hunger","Thinking you can get free bread from me, eh? Work on or feel my whip.");
    AddCondition("attrib","foodlevel","<",15000);
    AddCondition("item",49,"all","<>",0);
    AddCondition("lang","english");
    AddTraderTrigger("hunger","Du siehst mir noch nicht hungrig genug aus. Arbeite weiter!");
    AddCondition("attrib","foodlevel",">",14999);
    AddCondition("lang","german");
    AddAdditionalText("Kein Futter für faulen Abschaum wie dich!");
    AddTraderTrigger("hunger","Hier etwas verschimmeltes Brot. Jetzt arbeite weiter!");
    AddCondition("attrib","foodlevel","<",15000);
    AddCondition("item",49,"all","=",0);
    AddCondition("lang","english");
    AddConsequence("item",49,1,333,0);
    AddTraderTrigger("hunger","Du glaubst wohl, du bekommst noch mehr Brot, häh? Arbeite oder spüre meine Peitsche.");
    AddCondition("attrib","foodlevel","<",15000);
    AddCondition("item",49,"all","<>",0);
    AddCondition("lang","english");
    AddTraderTrigger("hungry","You don't look hungry to me. Work some more!");
    AddAdditionalTrigger("food");
    AddCondition("attrib","foodlevel",">",14999);
    AddAdditionalText("No food for lazy scum like you!");
    AddTraderTrigger("hungry","Here, have some moulded bread. Back to work!");
    AddAdditionalTrigger("food");
    AddCondition("attrib","foodlevel","<",15000);
    AddCondition("item",49,"all","=",0);
    AddConsequence("item",49,1,333,0);
    AddTraderTrigger("hungry","Thinking you can get free bread from me, eh? Work on or feel my whip.");
    AddAdditionalTrigger("food");
    AddCondition("attrib","foodlevel","<",15000);
    AddCondition("item",49,"all","<>",0);
    AddTraderTrigger("hungrig","Du siehst mir noch nicht hungrig genug aus. Arbeite weiter!");
    AddAdditionalTrigger("essen");
    AddCondition("attrib","foodlevel",">",14999);
    AddAdditionalText("Kein Futter für faulen Abschaum wie dich!");
    AddTraderTrigger("hungrig","Hier etwas verschimmeltes Brot. Jetzt arbeite weiter!");
    AddAdditionalTrigger("essen");
    AddCondition("attrib","foodlevel","<",15000);
    AddCondition("item",49,"all","=",0);
    AddConsequence("item",49,1,333,0);
    AddTraderTrigger("hungrig","Du glaubst wohl, du bekommst noch mehr Brot, häh? Arbeite oder spüre meine Peitsche.");
    AddAdditionalTrigger("essen");
    AddCondition("attrib","foodlevel","<",15000);
    AddCondition("item",49,"all","<>",0);
    AddTraderTrigger("pick axe","So, you broke my pick? You lost it? Here, have this one, but pay more attention to it or I whip you.");
    AddAdditionalTrigger("rock pick");
    AddCondition("item",2763,"all","=",0);
    AddCondition("qpg",">",0);
    AddConsequence("item",2763,1,333,0);
    AddTraderTrigger("pick axe","What do you want with two picks? Hitting stones bihanded?");
    AddAdditionalTrigger("rock pick");
    AddCondition("item",2763,"all","<>",0);
    AddTraderTrigger("spitzhacke","Was willst du mit zwei Spitzhacken? Beidhändig auf die Steine eindreschen?");
    AddAdditionalTrigger("hacke");
    AddCondition("item",2763,"all","<>",0);
    AddTraderTrigger("spitzhacke","So, du hast also meine Spitzhacke kaputt gemacht? Du hast sie verloren? Hier, nimm diese, aber pass besser auf sie auf oder ich peitsche dich aus.");
    AddAdditionalTrigger("hacke");
    AddCondition("item",2763,"all","=",0);
    AddCondition("qpg",">",0);
    AddConsequence("item",2763,1,333,0);
    AddTraderTrigger("release","No way.");
    AddCondition("qpg",">",0);
    AddAdditionalText("You'd like to, don't you?");
    AddAdditionalText("Sure I'll release you. In a hundred years!");
    AddAdditionalText("Shut up!");
    AddAdditionalText("Hahahahaha!");
    AddAdditionalText("Release you? Sure! What next, shall I wipe your boots?");
    AddAdditionalText("No way. Work!");
    AddAdditionalText("Wait, let me laugh first.");
    AddAdditionalText("You want me to release you? You?");
    AddAdditionalText("What kind of joker are you?");
    AddTraderTrigger("release","Until next time. They all come back!");
    AddCondition("qpg","<",1);
    AddConsequence("deleteitem",2763,"all");
	AddConsequence("qpg","=",0); --release the n00b
    AddTraderTrigger("freilassen","Nichts da.");
    AddAdditionalTrigger("lass mich frei");
    AddAdditionalTrigger("rauslassen");
    AddAdditionalTrigger("lass mich raus");
    AddCondition("qpg",">",0);
    AddAdditionalText("Das hättest du wohl gerne!");
    AddAdditionalText("Ohja, klar lass ich dich frei... in hundert Jahren!");
    AddAdditionalText("Schnauze!");
    AddAdditionalText("Hahahahahaha!");
    AddAdditionalText("Freilassen? Klar! Was noch, soll ich deine Stiefel lecken?");
    AddAdditionalText("Nichts da. Arbeite!");
    AddAdditionalText("Warte, lass mich erstmal auslachen.");
    AddAdditionalText("Du willst also freigelassen werden? Du?");
    AddAdditionalText("Was für ein Narr bist du?");
    AddTraderTrigger("freilassen","Bis zum nächsten mal. Sie kommen alle wieder!");
    AddAdditionalTrigger("lass mich frei");
    AddAdditionalTrigger("rauslassen");
    AddAdditionalTrigger("lass mich raus");
    AddCondition("qpg","<",1);
    AddConsequence("deleteitem",2763,"all");
    AddConsequence("qpg","=",0); --release the n00b
    AddTraderTrigger("gold","You have no gold. Work on, you lazy scumbag.");
    AddCondition("lang","english");
    AddCondition("item",234,"all","=",0);
    AddTraderTrigger("copper","No copper? Get copper. That is easy enough for you, isn't it?");
    AddCondition("item",2536,"all","=",0);
    AddTraderTrigger("iron","Are you kidding me? You have no iron ore.");
    AddCondition("item",22,"all","=",0);
    AddTraderTrigger("deliver coal","How for somebody's sake do you plan to give me something you don't have?");
    AddCondition("item",21,"all","=",0);
    AddTraderTrigger("gold","Du hast kein Gold. Weiterarbeiten, Drecksack!");
    AddAdditionalTrigger("ich liefer gold ab");
    AddCondition("item",234,"all","=",0);
    AddTraderTrigger("kupfer","Kein Kupfererz? Hol' Kupfererz. So einfach ist das.");
    AddAdditionalTrigger("ich liefer kupfer ab");
    AddCondition("item",2536,"all","=",0);
    AddTraderTrigger("eisen","Machst du Witze? Du hast kein Eisenerz.");
    AddAdditionalTrigger("ich liefer eisen ab");
    AddCondition("item",22,"all","=",0);
    AddTraderTrigger("kohle","Wie zum... gedenkst du, mir etwas zu geben, was du nicht hast?");
    AddAdditionalTrigger("ich liefer kohle ab");
    AddCondition("item",21,"all","=",0);
    AddTraderTrigger("remaining punishment","Pah! You still have to deliver %QUESTSTATUS resources.");
    AddCondition("qpg",">",0);
    AddAdditionalText("Bring me %QUESTSTATUS resources and I'll release you. Maybe.");
    AddAdditionalText("Mercy won't come before you bring me %QUESTSTATUS resources.");
    AddTraderTrigger("remaining punishment","You are free to go, thug.");
    AddCondition("qpg","<",1);
    AddAdditionalText("That was enough, I think I can release you.");
    AddTraderTrigger("übrige strafe","Pah! Du mußt mir noch %QUESTSTATUS Ressourcen bringen.");
    AddCondition("qpg",">",0);
    AddAdditionalText("Bring mir noch %QUESTSTATUS Ressourcen und vielleicht lasse ich dich dann gehen.");
    AddAdditionalText("Gnade wird nicht eher gewaltet bevor du mir nicht %QUESTSTATUS Ressourcen bringst.");
    AddTraderTrigger("übrige strafe","Du kannst gehen, Gauner.");
    AddCondition("qpg","<",1);
    AddAdditionalText("Das reicht jetzt, ich denke, ich kann dich freilassen.");
    -- Last catch
    AddTraderTrigger("Yes","Yes? Fine, work on.");
    AddAdditionalText("Yes? You wanted to say 'yes master'!");
    AddTraderTrigger("Ja","Ja? Gut. Arbeite weiter.");
    AddAdditionalText("Ja? Das heißt 'Ja, Meister'");
    AddTraderTrigger("No","No? You dare to disobey?");
    AddAdditionalText("#me barks: 'I will teach you to say 'no'!'");
    AddTraderTrigger("Nein","Nein? Wagst du etwa, zu widersprechen?");
    AddAdditionalText("#me bellt: 'Ich werde dich lehren, 'Nein' zu sagen!'");

    -- Cycletext
    AddCycleText("#me knallt mit seiner Peitsche.","#me cracks his whip.");
    AddCycleText("Haut rein, alle, haut rein!","Lets rock, everybody, lets rock.");
    AddCycleText("Ich hab das genau gesehen!","I saw that!");
    AddCycleText("#me summt: 'Der Trauerkloß saß auf einem Felsblock, in der Ecke und weinte vor sich hin.'","#me hums: 'The sad sack was sittin' on a block of stone, way over in the corner weepin' all alone'.");
    AddCycleText("Arbeite!","Work!");
    AddCycleText("Schneller!","Faster!");
    AddCycleText("Gehorche!","Obey!");
    AddCycleText("Mwahaha!","Mwahaha!");
    AddCycleText("#me lacht dreckig.","#me laughs diabolically.");
    AddCycleText("Ruhe bei der Arbeit, Abschaum!","Be quiet, scum!");
    AddCycleText("Ich hab das gehört!","I heard that!");
    AddCycleText("#me tritt nach einer Maus.","#me kicks at a mouse.");
    AddCycleText("Gute Führung? Ich führe dich gleich an einer Schlinge, ist das gut genug?!","Good conduct? I will teach you 'good conduct' with my whip!");
    -- ********* END DYNAMIC PART ********
    TradSpeakLang={0,1};
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
			if not QuestTrigger(message,originator) then
				TellSmallTalk(message,originator);
			end
			
        else
            Confused(
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
		NPCTalking(thisNPC,"Reset done");
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
	outText=base.common.GetNLS(originator,gText,eText); NPCTalking(thisNPC,outText);
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
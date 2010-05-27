-- INSERT INTO npc VALUES (nextval('npc_seq'),0,110,574,0,2,false,'Hassan the Servant','npc_hassan_the_servant.lua',0);

require("npcs.base.autonpcfunctions")
module("npcs.hassan_the_servant")

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

    QuestID = 75;
    -- NPC by PO Edward Cromwell, translated by Estralis Seborian
    -- Queststatus Overview
    -- 0: No Quest taken / Quest reset
    -- 1: NPC tells player to bring him some wine
    -- 2: NPC is willing to answer PC questions about the ruler, faction and the treacherous neighbours!
    -- Debugging
    npcs.base.autonpcfunctions.AddTraderTrigger("set 0","Quest status set to 0");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",0);
    npcs.base.autonpcfunctions.AddTraderTrigger("set 1","Quest status set to 1");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("set 2","Quest status set to 2");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",2);
    -- Cycletext:
    npcs.base.autonpcfunctions.AddCycleText("#me knallt seine Faust auf den Tresen: 'Bedienung!'","#me bags his fist on the counter: 'I demand service!'");
    npcs.base.autonpcfunctions.AddCycleText("#me tippt sich mit seinem Zeigefinger auf die Brust: 'Ich kenne die Königin! Ich bin eine sehr wichtige Person.'","#me pokes his own chest with his index finger 'I know the Queen! I am a very important person!'");
    npcs.base.autonpcfunctions.AddCycleText("Wie, ich soll für meine Getränke zahlen? Ihr solltet mich dafür bezahlen, dass ich hier trinke. Wißt ihr nicht, wer ich bin?","What do you mean I have to pay for my drinks? You should be paying 'me' to drink here! Do you have any idea who I am?");
    npcs.base.autonpcfunctions.AddCycleText("#me ist ein Mann in feiner, aber weingetränkten Kleidung. Sein glattgeschorener Kopf glänzt durch ein wohlriechendes Öl.","#me is a man in expensive, albeit wine-stained clothes. His shaven head gleams with fine-smelling oil.");
    npcs.base.autonpcfunctions.AddCycleText("Ich arbeite im königlichen Palast. Nichts geschieht dort, ohne das ich davon erfahre.","I work in the the Royal Palace. Nothing there happens without my knowledge.");
    npcs.base.autonpcfunctions.AddCycleText("#me knurrt beim Anblick seines leeren Glases: 'Warum erfreu ich euch Bauern mit meiner Anwesenheit? Ich, der Liebling der Königin! Sie hat mich gestern sogar angesehen.'","#me frowns at the empty glass of wine 'Why do I bless you peasants with my presence? I, who am the Queen's favourite! She even looked at me two days ago!'");
    npcs.base.autonpcfunctions.AddCycleText("Ich fächere der Königin Luft, damit sie einen ruhigen Kopf bewahren kann. Das nenn' ich eine wichtige Tätigkeit.","I wave the fan at the Queen, to keep her blue blood cool during in the heat of the desert. Now 'that' is an important duty!");
    -- omg hlp plz
    npcs.base.autonpcfunctions.AddTraderTrigger("Help","");
    npcs.base.autonpcfunctions.AddConsequence("inform","[Game help] This is the NPC Hassan. To learn more about him, your should greet the NPC first.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Hilfe","");
    npcs.base.autonpcfunctions.AddConsequence("inform","[Spielhilfe] Dies ist der NPC Hassan. Wenn du mehr über ihn erfahren willst, grüße ihn zuerst.");
    -- First part, the gossiper is thirsty--
    npcs.base.autonpcfunctions.AddTraderTrigger("Hello","#me stares at you. 'Be greeted, traveller! I am much too thirsty to talk. If you bring me a glass with red wine, I will gladly answer your questions.'");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greetings");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Be greeted");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hail");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good day");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good morning");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good evening");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",0);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("inform","[New Quest] Cadomyr's Gossiper");
    npcs.base.autonpcfunctions.AddTraderTrigger("Hello","Ah, hello again. Now that you quenched my thirst, ask whatever you like");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greetings");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Be greeted");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hail");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good day");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good morning");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good evening");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("Hiho","What a peasantish way to greet a man of my stature! If you want to ask me something, bring me a glassful of red wine first to quench my thirst.'");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",0);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("inform","[New Quest] Cadomyr's Gossiper");
    npcs.base.autonpcfunctions.AddTraderTrigger("Hiho","Hah! My friend, come, let us talk about important things, we're important persons, aren't we?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("How are you","I am thirsty! If you bring bring me a glass of red wine, I will answer your questions... and I know plenty!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("How feel");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("How do you do");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",0);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("inform","[New Quest] Cadomyr's Gossiper");
    npcs.base.autonpcfunctions.AddTraderTrigger("How are you","Now that you brought me wine: Fine.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("How feel");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("How do you do");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Bring me a glass of red wine, and I'll answer your questions! Otherwise leave me be!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",0);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("inform","[New Quest] Cadomyr's Gossiper");
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Just ask me and I will share my vast knowledge about the palace with you.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("task","Bring me a glass of red wine, and I'll answer your questions! Otherwise leave me be!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("question");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",0);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("inform","[New Quest] Cadomyr's Gossiper");
    npcs.base.autonpcfunctions.AddTraderTrigger("task","Just ask me and I will share my vast knowledge about the palace with you.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("question");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("Grüße","#me starrt dich an. 'Seid gegrüßt, Reisender. Meine Kehle ist zu trocken zum Reden. Bringt mir ein Glas Wein, wenn ihr was erfahren wollt.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Gruß");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Seid gegrüßt");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Guten Tag");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Guten Abend");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Mahlzeit");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Tach");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Moin");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",0);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Der Schwätzer von Cadomyr");
    npcs.base.autonpcfunctions.AddTraderTrigger("Grüße","Ah, hallo nochmal. Nun, da mein Durst gestillt ist, fragt was immer ihr wollt.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Gruß");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Seid gegrüßt");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Guten Tag");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Guten Abend");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Mahlzeit");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Tach");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Moin");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("Hiho","#me knurrt: 'Was für eine bäuerliche Art, einen Mann meines Ranges zu grüßen. Wenn ihr was wissen wollt, bringt mir erstmal ein Glas Wein, um meinen Durst zu stillen.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",0);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Der Schwätzer von Cadomyr");
    npcs.base.autonpcfunctions.AddTraderTrigger("Hiho","Hah! Mein Freund, lasst uns über wichtige Dinge Reden, denn wir sind wichtige Leute, nicht wahr?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("Wie geht","Ich bin durstig! Wenn ihr mir ein Glas Wein bringt, beantworte ich eure Fragen... und ich weiß eine Menge!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Wie fühlst");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Wie ist es ergangen");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",0);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Der Schwätzer von Cadomyr");
    npcs.base.autonpcfunctions.AddTraderTrigger("Wie geht","Nun, da ihr mir Wein gebracht habt: Fein.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Wie fühlst");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Wie ist es ergangen");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Bringt mir ein Glas Wein und ich beantworte eure Fragen. Ansonsten, lasst mich in Ruhe.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",0);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Der Schwätzer von Cadomyr");
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Fragt einfach, wonach auch immer und ich werde mein Wissen über den Palast mit euch teilen.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("Aufgabe","Bringt mir ein Glas Wein und ich beantworte eure Fragen. Ansonsten, lasst mich in Ruhe.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Frage");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",0);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Der Schwätzer von Cadomyr");
    npcs.base.autonpcfunctions.AddTraderTrigger("Aufgabe","Fragt einfach, wonach auch immer und ich werde mein Wissen über den Palast mit euch teilen.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Frage");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("Farewell","Farewell, traveller!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good bye");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Bye");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Fare thy well");
    npcs.base.autonpcfunctions.AddTraderTrigger("Ciao","Farewell, traveller!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("your name","Hassan, the royal fan-waver.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("who are you");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("who art thou");
    npcs.base.autonpcfunctions.AddTraderTrigger("Tschüß","Gute Reise.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Tschüss");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Wiedersehen");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Gehabt euch wohl");
    npcs.base.autonpcfunctions.AddTraderTrigger("Ciao","Gute Reise.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("dein name","Hassan, der königliche Fächelwedler.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wer bist du");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wer seid ihr");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wie heißt");
    -- Small talk--
    npcs.base.autonpcfunctions.AddTraderTrigger("profession","I am a servant of the Queen herself!");
    npcs.base.autonpcfunctions.AddAdditionalText("I am a royal fan-waver! A glorious task!");
    npcs.base.autonpcfunctions.AddTraderTrigger("tavern","A lousy tavern, in the glorious Kingdom of Cadomyr!");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("beruf","Ich ein Diener der Königin.");
    npcs.base.autonpcfunctions.AddAdditionalText("Ich bin der königliche Fächelwedler. Eine ehrenhafte Tätigkeit!");
    npcs.base.autonpcfunctions.AddTraderTrigger("tavern","Eine einfache Taverne im prächtigen Königreich Cadomyr.");
    -- bringing the wine--
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","#me takes the glass and smiles pleased 'Very good! Now, you can ask me anything you like... about the town, the Queen, the palace, our glorious Cadomyr or even the vile neighbours.'");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddCondition("item",2057,"all",">",0);
    npcs.base.autonpcfunctions.AddCondition("town","=","cadomyr");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("deleteitem",2057,1);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Quest solved] Hassan will now answer your questions. You advance in Queen Rosaline Edward's favour.");
    npcs.base.autonpcfunctions.AddConsequence("rankpoints","cadomyr","+",20);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","#me takes the glass and smiles pleased 'Very good! Now, you can ask me anything you like... about the town, the Queen, the palace, our glorious Cadomyr or even the vile neighbours.'");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddCondition("item",2057,"all",">",0);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("deleteitem",2057,1);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Quest solved] Hassan will now answer your questions.");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","#me nimmt das Glas und grinst erfreut. 'Sehr gut. Nun könnt ihr mich alles fragen, was ihr wollt... über die Stadt, den Palast, Cadomyr oder unsere bösen Nachbarn.'");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddCondition("item",2057,"all",">",0);
    npcs.base.autonpcfunctions.AddCondition("town","=","cadomyr");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddConsequence("deleteitem",2057,1);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Quest gelöst] Hassan wird nun deine Fragen beantworten. Dein Ansehen bei Königin Rosaline Edwards steigt.");
    npcs.base.autonpcfunctions.AddConsequence("rankpoints","cadomyr","+",20);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","#me nimmt das Glas und grinst erfreut. 'Sehr gut. Nun könnt ihr mich alles fragen, was ihr wollt... über die Stadt, den Palast, Cadomyr oder unsere bösen Nachbarn.'");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddCondition("item",2057,"all",">",0);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddConsequence("deleteitem",2057,1);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Quest gelöst] Hassan wird nun deine Fragen beantworten.");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Wine! I told you to bring me wine! You want to hear my stories, so grease my throat.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddCondition("item",2057,"all","<",1);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Wein! Ich hab gesagt, ich will Wein! Wer meine Geschichten hören will, muss erst meine Stimme ölen.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddCondition("item",2057,"all","<",1);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    -- questions--
    npcs.base.autonpcfunctions.AddTraderTrigger("town","Cadomyr is the most civilized and advanced community! I hear the others live in pitiful clay huts.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("queen","We are ruled by the Queen in Cadomyr! She can trace her ancestors back a millenia or more, having the bluest of blue blood of us all.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("Rosaline","Oh, so you have heard about our Queen? Of course, not everyone thought that a woman should rule. Baron Hastings was quite vocal about that, but then he... disappeared.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Edwards","Cadomyr has been ruled by the House of Edwards since its inception. Finest stock of Albar's bluebloods! The queen's father, King Reginald, ruled the town with firm grip.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("nobles","Like any proper nation, below the Queen are her nobles, just like the men are below the Gods... just as the Gods themselves have intended!");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("gods","#me nods eagerly, spilling some wine on the table 'We are proper, honourful and Gods-fearing people in Cadomyr, unlike our wretched neighbours!'");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("hono[u]+r","We value honour above all in Cadomyr. If you have no honour, then you have nothing at all! Then you are nothing at all!");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("like[s]","The Queen likes the shine of gold and the sparkle of precious gemstones.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("gift","Gifts? Of course our Queen likes gifts! Expensive jewelry and shiny gemstones, especially diamonds, is what she fancies.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("baron","Baron Hastings? He was not all too happy about Queen Rosaline finding a clause that enabled her to succeed his father on the throne, but now he has gone missing...");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("hastings");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("wine","#me sips from the glass, smiling 'The wine is very good, thank you..'.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("neighbo","#me grumbles: 'Oh! Galmair and Runewick! Pox on them! The ancient histories make it clear that the people of Cadomyr are the rightful lords of the land!");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("Cadomyr","#me sighs: 'Cadomyr, oh Cadomyr! We are the most honourful and magnificent nation around, held back only by the treachery of our cursed neighbours.'");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("palace","If Cadomyr is the crown of the land, then the palace is certainly the most magnificent crown jewel! Sadly not all the servants in the palace are as reliable and loyal as I am.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("Runewick","An false 'mage' rules them. Bah I say! They speak about wisdom, yet they have only lies to offer! They are nothing but cheap chartalans who try to twist the truth to justify their vile customs!");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Galmair","Galmair! That treacherous pit! Filled by the most despicable scum imaginable. Any decent person should steer clear of the place! Of course, I was lucky to never visit it myself.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("stadt","Cadomyr ist die zivilisierteste und fortschrittlichste Gesellschaft. Ich hörte, unsere Nachbarn wohnen in erbärmlichen Lehmhütten.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("Königin","Wir werden von der Königin von Cadomyr regiert. Sie kann ihre Ahnen tausend Jahre zurückverfolgen und hat das blauste Blut von allen.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("Rosaline","Nun, was habt ihr über unsere Königin gehört? Nicht jeder stimmt damit überein, dass eine Frau die Macht hat. Baron Hastings war ihr Redelsführer, aber dann verschwand er...");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("Edwards","Cadomyr wird seit seiner Gründung von den Edwards regiert. Feinstes albarisches Blut! Der Vater der Königin, König Reginald, regierte mit harter Hand.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("Edel","Wie in jeder gute Nation bedient sich die Königin ihrer Edelleute, wie die Götter sich den Menschen bedienen. Genauso wollen es die Götter.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("Gott","#me nickt heftig, etwas Wein verschüttend: 'Wir sind gute, ehrenhaft, götterfürchtige Leute hier in Cadomyr, nicht so unsere verdorbenen Nachbarn.'");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Götter");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("Ehre","Die Ehre steht über allem hier in Cadomyr. Wenn man keine Ehre hat, hat man gar nichts mehr. Und dann ist man auch ein Nichts.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("Vorliebe","Die Königin hat eine Vorliebe für Gold und funkelnde Edelsteine.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("Geschenk","Geschenke? Na klar liebt unsere Königin Geschenke. Teure Juwelen und Edelsteine, besonders Diamanten, das erfreut sie.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("Baron","Baron Hastings? Er war nicht sonderlich begeistert, als Königin Rosaline eine Klausel gefunden hat, die ihr ermöglichte, das Erbe ihres Vaters anzutreten. Nun ist er verschwunden...");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("hastings");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("Wein","#me schlürft etwas Wein: 'Danke für den Wein, der ist wirklich gut.'");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("Nachbar","#me knurrt: 'Oh! Galmair und Runewick, die Pest soll über sie kommen. Die Geschichte lehrt uns, dass die Herren von Cadomyr die Herren der Ländereien sind.'");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("Cadomyr","#me seufzt: 'Cadomyr, oh Cadomyr! Wir sind die ehrenhafteste und großartigste Nation in der Gegend, nur behindert durch unsere verräterischen Nachbarn.'");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("Palast","Wenn Cadomyr die Krone des Landes ist, dann ist der Palast das funkelnste Kronjuwel. Leider sind nicht alle Palastdiener so loyal und verlässlich wie ich.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("Runewick","Ein falscher Magier regiert dort. Bah, sag ich! Sie reden über Weisheit, meinen aber Lügen. Sie sind nichts als Scharlatane welche die Wahrheit verdrehen, um ihre widerlichen Sitten zu rechtfertigen.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("Galmair","Galmair! Eine Schlangengrube! Gefüllt mit dem widerlichsten Abschaum. Jeder ehrbare Mann sollte Galmair fern bleiben. Zum Glück war ich noch nie dort.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
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
            npcs.base.autonpcfunctions.TellSmallTalk(message,originator);
        else
            npcs.base.autonpcfunctions.Confused(
               "#me sieht dich leicht verwirrt an",
               "#me looks at you a little confused"
            );
        end
    end
end
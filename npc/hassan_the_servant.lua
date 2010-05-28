-- INSERT INTO npc VALUES (nextval('npc_seq'),0,110,574,0,2,false,'Hassan the Servant','npc_hassan_the_servant.lua',0);

require("npc.base.autonpcfunctions")
module("npc.hassan_the_servant")

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

    QuestID = 75;
    -- NPC by PO Edward Cromwell, translated by Estralis Seborian
    -- Queststatus Overview
    -- 0: No Quest taken / Quest reset
    -- 1: NPC tells player to bring him some wine
    -- 2: NPC is willing to answer PC questions about the ruler, faction and the treacherous neighbours!
    -- Debugging
    npc.base.autonpcfunctions.AddTraderTrigger("set 0","Quest status set to 0");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",0);
    npc.base.autonpcfunctions.AddTraderTrigger("set 1","Quest status set to 1");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddTraderTrigger("set 2","Quest status set to 2");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",2);
    -- Cycletext:
    npc.base.autonpcfunctions.AddCycleText("#me knallt seine Faust auf den Tresen: 'Bedienung!'","#me bags his fist on the counter: 'I demand service!'");
    npc.base.autonpcfunctions.AddCycleText("#me tippt sich mit seinem Zeigefinger auf die Brust: 'Ich kenne die Königin! Ich bin eine sehr wichtige Person.'","#me pokes his own chest with his index finger 'I know the Queen! I am a very important person!'");
    npc.base.autonpcfunctions.AddCycleText("Wie, ich soll für meine Getränke zahlen? Ihr solltet mich dafür bezahlen, dass ich hier trinke. Wißt ihr nicht, wer ich bin?","What do you mean I have to pay for my drinks? You should be paying 'me' to drink here! Do you have any idea who I am?");
    npc.base.autonpcfunctions.AddCycleText("#me ist ein Mann in feiner, aber weingetränkten Kleidung. Sein glattgeschorener Kopf glänzt durch ein wohlriechendes Öl.","#me is a man in expensive, albeit wine-stained clothes. His shaven head gleams with fine-smelling oil.");
    npc.base.autonpcfunctions.AddCycleText("Ich arbeite im königlichen Palast. Nichts geschieht dort, ohne das ich davon erfahre.","I work in the the Royal Palace. Nothing there happens without my knowledge.");
    npc.base.autonpcfunctions.AddCycleText("#me knurrt beim Anblick seines leeren Glases: 'Warum erfreu ich euch Bauern mit meiner Anwesenheit? Ich, der Liebling der Königin! Sie hat mich gestern sogar angesehen.'","#me frowns at the empty glass of wine 'Why do I bless you peasants with my presence? I, who am the Queen's favourite! She even looked at me two days ago!'");
    npc.base.autonpcfunctions.AddCycleText("Ich fächere der Königin Luft, damit sie einen ruhigen Kopf bewahren kann. Das nenn' ich eine wichtige Tätigkeit.","I wave the fan at the Queen, to keep her blue blood cool during in the heat of the desert. Now 'that' is an important duty!");
    -- omg hlp plz
    npc.base.autonpcfunctions.AddTraderTrigger("Help","");
    npc.base.autonpcfunctions.AddConsequence("inform","[Game help] This is the NPC Hassan. To learn more about him, your should greet the NPC first.");
    npc.base.autonpcfunctions.AddTraderTrigger("Hilfe","");
    npc.base.autonpcfunctions.AddConsequence("inform","[Spielhilfe] Dies ist der NPC Hassan. Wenn du mehr über ihn erfahren willst, grüße ihn zuerst.");
    -- First part, the gossiper is thirsty--
    npc.base.autonpcfunctions.AddTraderTrigger("Hello","#me stares at you. 'Be greeted, traveller! I am much too thirsty to talk. If you bring me a glass with red wine, I will gladly answer your questions.'");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greetings");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Be greeted");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hail");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good day");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good morning");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good evening");
    npc.base.autonpcfunctions.AddCondition("qpg","=",0);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddConsequence("inform","[New Quest] Cadomyr's Gossiper");
    npc.base.autonpcfunctions.AddTraderTrigger("Hello","Ah, hello again. Now that you quenched my thirst, ask whatever you like");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greetings");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Be greeted");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hail");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good day");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good morning");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good evening");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger("Hiho","What a peasantish way to greet a man of my stature! If you want to ask me something, bring me a glassful of red wine first to quench my thirst.'");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddCondition("qpg","=",0);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddConsequence("inform","[New Quest] Cadomyr's Gossiper");
    npc.base.autonpcfunctions.AddTraderTrigger("Hiho","Hah! My friend, come, let us talk about important things, we're important persons, aren't we?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger("How are you","I am thirsty! If you bring bring me a glass of red wine, I will answer your questions... and I know plenty!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("How feel");
    npc.base.autonpcfunctions.AddAdditionalTrigger("How do you do");
    npc.base.autonpcfunctions.AddCondition("qpg","=",0);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddConsequence("inform","[New Quest] Cadomyr's Gossiper");
    npc.base.autonpcfunctions.AddTraderTrigger("How are you","Now that you brought me wine: Fine.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("How feel");
    npc.base.autonpcfunctions.AddAdditionalTrigger("How do you do");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger("quest","Bring me a glass of red wine, and I'll answer your questions! Otherwise leave me be!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",0);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddConsequence("inform","[New Quest] Cadomyr's Gossiper");
    npc.base.autonpcfunctions.AddTraderTrigger("quest","Just ask me and I will share my vast knowledge about the palace with you.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("task","Bring me a glass of red wine, and I'll answer your questions! Otherwise leave me be!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npc.base.autonpcfunctions.AddAdditionalTrigger("question");
    npc.base.autonpcfunctions.AddCondition("qpg","=",0);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddConsequence("inform","[New Quest] Cadomyr's Gossiper");
    npc.base.autonpcfunctions.AddTraderTrigger("task","Just ask me and I will share my vast knowledge about the palace with you.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npc.base.autonpcfunctions.AddAdditionalTrigger("question");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger("Grüße","#me starrt dich an. 'Seid gegrüßt, Reisender. Meine Kehle ist zu trocken zum Reden. Bringt mir ein Glas Wein, wenn ihr was erfahren wollt.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Gruß");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Seid gegrüßt");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Guten Tag");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Guten Abend");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Mahlzeit");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Tach");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Moin");
    npc.base.autonpcfunctions.AddCondition("qpg","=",0);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Der Schwätzer von Cadomyr");
    npc.base.autonpcfunctions.AddTraderTrigger("Grüße","Ah, hallo nochmal. Nun, da mein Durst gestillt ist, fragt was immer ihr wollt.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Gruß");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Seid gegrüßt");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Guten Tag");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Guten Abend");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Mahlzeit");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Tach");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Moin");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger("Hiho","#me knurrt: 'Was für eine bäuerliche Art, einen Mann meines Ranges zu grüßen. Wenn ihr was wissen wollt, bringt mir erstmal ein Glas Wein, um meinen Durst zu stillen.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npc.base.autonpcfunctions.AddCondition("qpg","=",0);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Der Schwätzer von Cadomyr");
    npc.base.autonpcfunctions.AddTraderTrigger("Hiho","Hah! Mein Freund, lasst uns über wichtige Dinge Reden, denn wir sind wichtige Leute, nicht wahr?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("Wie geht","Ich bin durstig! Wenn ihr mir ein Glas Wein bringt, beantworte ich eure Fragen... und ich weiß eine Menge!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Wie fühlst");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Wie ist es ergangen");
    npc.base.autonpcfunctions.AddCondition("qpg","=",0);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Der Schwätzer von Cadomyr");
    npc.base.autonpcfunctions.AddTraderTrigger("Wie geht","Nun, da ihr mir Wein gebracht habt: Fein.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Wie fühlst");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Wie ist es ergangen");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger("quest","Bringt mir ein Glas Wein und ich beantworte eure Fragen. Ansonsten, lasst mich in Ruhe.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",0);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Der Schwätzer von Cadomyr");
    npc.base.autonpcfunctions.AddTraderTrigger("quest","Fragt einfach, wonach auch immer und ich werde mein Wissen über den Palast mit euch teilen.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("Aufgabe","Bringt mir ein Glas Wein und ich beantworte eure Fragen. Ansonsten, lasst mich in Ruhe.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Frage");
    npc.base.autonpcfunctions.AddCondition("qpg","=",0);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Der Schwätzer von Cadomyr");
    npc.base.autonpcfunctions.AddTraderTrigger("Aufgabe","Fragt einfach, wonach auch immer und ich werde mein Wissen über den Palast mit euch teilen.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Frage");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger("Farewell","Farewell, traveller!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good bye");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Bye");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Fare thy well");
    npc.base.autonpcfunctions.AddTraderTrigger("Ciao","Farewell, traveller!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("your name","Hassan, the royal fan-waver.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("who are you");
    npc.base.autonpcfunctions.AddAdditionalTrigger("who art thou");
    npc.base.autonpcfunctions.AddTraderTrigger("Tschüß","Gute Reise.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Tschüss");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Wiedersehen");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Gehabt euch wohl");
    npc.base.autonpcfunctions.AddTraderTrigger("Ciao","Gute Reise.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("dein name","Hassan, der königliche Fächelwedler.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("wer bist du");
    npc.base.autonpcfunctions.AddAdditionalTrigger("wer seid ihr");
    npc.base.autonpcfunctions.AddAdditionalTrigger("wie heißt");
    -- Small talk--
    npc.base.autonpcfunctions.AddTraderTrigger("profession","I am a servant of the Queen herself!");
    npc.base.autonpcfunctions.AddAdditionalText("I am a royal fan-waver! A glorious task!");
    npc.base.autonpcfunctions.AddTraderTrigger("tavern","A lousy tavern, in the glorious Kingdom of Cadomyr!");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("beruf","Ich ein Diener der Königin.");
    npc.base.autonpcfunctions.AddAdditionalText("Ich bin der königliche Fächelwedler. Eine ehrenhafte Tätigkeit!");
    npc.base.autonpcfunctions.AddTraderTrigger("tavern","Eine einfache Taverne im prächtigen Königreich Cadomyr.");
    -- bringing the wine--
    npc.base.autonpcfunctions.AddTraderTrigger(".+","#me takes the glass and smiles pleased 'Very good! Now, you can ask me anything you like... about the town, the Queen, the palace, our glorious Cadomyr or even the vile neighbours.'");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddCondition("item",2057,"all",">",0);
    npc.base.autonpcfunctions.AddCondition("town","=","cadomyr");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("deleteitem",2057,1);
    npc.base.autonpcfunctions.AddConsequence("inform","[Quest solved] Hassan will now answer your questions. You advance in Queen Rosaline Edward's favour.");
    npc.base.autonpcfunctions.AddConsequence("rankpoints","cadomyr","+",20);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","#me takes the glass and smiles pleased 'Very good! Now, you can ask me anything you like... about the town, the Queen, the palace, our glorious Cadomyr or even the vile neighbours.'");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddCondition("item",2057,"all",">",0);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("deleteitem",2057,1);
    npc.base.autonpcfunctions.AddConsequence("inform","[Quest solved] Hassan will now answer your questions.");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","#me nimmt das Glas und grinst erfreut. 'Sehr gut. Nun könnt ihr mich alles fragen, was ihr wollt... über die Stadt, den Palast, Cadomyr oder unsere bösen Nachbarn.'");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddCondition("item",2057,"all",">",0);
    npc.base.autonpcfunctions.AddCondition("town","=","cadomyr");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddConsequence("deleteitem",2057,1);
    npc.base.autonpcfunctions.AddConsequence("inform","[Quest gelöst] Hassan wird nun deine Fragen beantworten. Dein Ansehen bei Königin Rosaline Edwards steigt.");
    npc.base.autonpcfunctions.AddConsequence("rankpoints","cadomyr","+",20);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","#me nimmt das Glas und grinst erfreut. 'Sehr gut. Nun könnt ihr mich alles fragen, was ihr wollt... über die Stadt, den Palast, Cadomyr oder unsere bösen Nachbarn.'");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddCondition("item",2057,"all",">",0);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddConsequence("deleteitem",2057,1);
    npc.base.autonpcfunctions.AddConsequence("inform","[Quest gelöst] Hassan wird nun deine Fragen beantworten.");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Wine! I told you to bring me wine! You want to hear my stories, so grease my throat.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddCondition("item",2057,"all","<",1);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Wein! Ich hab gesagt, ich will Wein! Wer meine Geschichten hören will, muss erst meine Stimme ölen.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddCondition("item",2057,"all","<",1);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    -- questions--
    npc.base.autonpcfunctions.AddTraderTrigger("town","Cadomyr is the most civilized and advanced community! I hear the others live in pitiful clay huts.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger("queen","We are ruled by the Queen in Cadomyr! She can trace her ancestors back a millenia or more, having the bluest of blue blood of us all.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger("Rosaline","Oh, so you have heard about our Queen? Of course, not everyone thought that a woman should rule. Baron Hastings was quite vocal about that, but then he... disappeared.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Edwards","Cadomyr has been ruled by the House of Edwards since its inception. Finest stock of Albar's bluebloods! The queen's father, King Reginald, ruled the town with firm grip.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("nobles","Like any proper nation, below the Queen are her nobles, just like the men are below the Gods... just as the Gods themselves have intended!");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger("gods","#me nods eagerly, spilling some wine on the table 'We are proper, honourful and Gods-fearing people in Cadomyr, unlike our wretched neighbours!'");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger("hono[u]+r","We value honour above all in Cadomyr. If you have no honour, then you have nothing at all! Then you are nothing at all!");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger("like[s]","The Queen likes the shine of gold and the sparkle of precious gemstones.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger("gift","Gifts? Of course our Queen likes gifts! Expensive jewelry and shiny gemstones, especially diamonds, is what she fancies.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger("baron","Baron Hastings? He was not all too happy about Queen Rosaline finding a clause that enabled her to succeed his father on the throne, but now he has gone missing...");
    npc.base.autonpcfunctions.AddAdditionalTrigger("hastings");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("wine","#me sips from the glass, smiling 'The wine is very good, thank you..'.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger("neighbo","#me grumbles: 'Oh! Galmair and Runewick! Pox on them! The ancient histories make it clear that the people of Cadomyr are the rightful lords of the land!");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger("Cadomyr","#me sighs: 'Cadomyr, oh Cadomyr! We are the most honourful and magnificent nation around, held back only by the treachery of our cursed neighbours.'");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("palace","If Cadomyr is the crown of the land, then the palace is certainly the most magnificent crown jewel! Sadly not all the servants in the palace are as reliable and loyal as I am.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger("Runewick","An false 'mage' rules them. Bah I say! They speak about wisdom, yet they have only lies to offer! They are nothing but cheap chartalans who try to twist the truth to justify their vile customs!");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Galmair","Galmair! That treacherous pit! Filled by the most despicable scum imaginable. Any decent person should steer clear of the place! Of course, I was lucky to never visit it myself.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("stadt","Cadomyr ist die zivilisierteste und fortschrittlichste Gesellschaft. Ich hörte, unsere Nachbarn wohnen in erbärmlichen Lehmhütten.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger("Königin","Wir werden von der Königin von Cadomyr regiert. Sie kann ihre Ahnen tausend Jahre zurückverfolgen und hat das blauste Blut von allen.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger("Rosaline","Nun, was habt ihr über unsere Königin gehört? Nicht jeder stimmt damit überein, dass eine Frau die Macht hat. Baron Hastings war ihr Redelsführer, aber dann verschwand er...");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger("Edwards","Cadomyr wird seit seiner Gründung von den Edwards regiert. Feinstes albarisches Blut! Der Vater der Königin, König Reginald, regierte mit harter Hand.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger("Edel","Wie in jeder gute Nation bedient sich die Königin ihrer Edelleute, wie die Götter sich den Menschen bedienen. Genauso wollen es die Götter.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger("Gott","#me nickt heftig, etwas Wein verschüttend: 'Wir sind gute, ehrenhaft, götterfürchtige Leute hier in Cadomyr, nicht so unsere verdorbenen Nachbarn.'");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Götter");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger("Ehre","Die Ehre steht über allem hier in Cadomyr. Wenn man keine Ehre hat, hat man gar nichts mehr. Und dann ist man auch ein Nichts.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger("Vorliebe","Die Königin hat eine Vorliebe für Gold und funkelnde Edelsteine.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger("Geschenk","Geschenke? Na klar liebt unsere Königin Geschenke. Teure Juwelen und Edelsteine, besonders Diamanten, das erfreut sie.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger("Baron","Baron Hastings? Er war nicht sonderlich begeistert, als Königin Rosaline eine Klausel gefunden hat, die ihr ermöglichte, das Erbe ihres Vaters anzutreten. Nun ist er verschwunden...");
    npc.base.autonpcfunctions.AddAdditionalTrigger("hastings");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger("Wein","#me schlürft etwas Wein: 'Danke für den Wein, der ist wirklich gut.'");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger("Nachbar","#me knurrt: 'Oh! Galmair und Runewick, die Pest soll über sie kommen. Die Geschichte lehrt uns, dass die Herren von Cadomyr die Herren der Ländereien sind.'");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger("Cadomyr","#me seufzt: 'Cadomyr, oh Cadomyr! Wir sind die ehrenhafteste und großartigste Nation in der Gegend, nur behindert durch unsere verräterischen Nachbarn.'");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger("Palast","Wenn Cadomyr die Krone des Landes ist, dann ist der Palast das funkelnste Kronjuwel. Leider sind nicht alle Palastdiener so loyal und verlässlich wie ich.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger("Runewick","Ein falscher Magier regiert dort. Bah, sag ich! Sie reden über Weisheit, meinen aber Lügen. Sie sind nichts als Scharlatane welche die Wahrheit verdrehen, um ihre widerlichen Sitten zu rechtfertigen.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger("Galmair","Galmair! Eine Schlangengrube! Gefüllt mit dem widerlichsten Abschaum. Jeder ehrbare Mann sollte Galmair fern bleiben. Zum Glück war ich noch nie dort.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
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
            npc.base.autonpcfunctions.TellSmallTalk(message,originator);
        else
            npc.base.autonpcfunctions.Confused(
               "#me sieht dich leicht verwirrt an",
               "#me looks at you a little confused"
            );
        end
    end
end
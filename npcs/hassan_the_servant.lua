-- INSERT INTO npc VALUES (nextval('npc_seq'),0,110,574,0,2,false,'Hassan the Servant','npc_hassan_the_servant.lua',0);

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

    QuestID = 75;
    -- NPC by PO Edward Cromwell, translated by Estralis Seborian
    -- Queststatus Overview
    -- 0: No Quest taken / Quest reset
    -- 1: NPC tells player to bring him some wine
    -- 2: NPC is willing to answer PC questions about the ruler, faction and the treacherous neighbours!
    -- Debugging
    AddTraderTrigger("set 0","Quest status set to 0");
    AddConsequence("qpg","=",0);
    AddTraderTrigger("set 1","Quest status set to 1");
    AddConsequence("qpg","=",1);
    AddTraderTrigger("set 2","Quest status set to 2");
    AddConsequence("qpg","=",2);
    -- Cycletext:
    AddCycleText("#me knallt seine Faust auf den Tresen: 'Bedienung!'","#me bags his fist on the counter: 'I demand service!'");
    AddCycleText("#me tippt sich mit seinem Zeigefinger auf die Brust: 'Ich kenne die Königin! Ich bin eine sehr wichtige Person.'","#me pokes his own chest with his index finger 'I know the Queen! I am a very important person!'");
    AddCycleText("Wie, ich soll für meine Getränke zahlen? Ihr solltet mich dafür bezahlen, dass ich hier trinke. Wißt ihr nicht, wer ich bin?","What do you mean I have to pay for my drinks? You should be paying 'me' to drink here! Do you have any idea who I am?");
    AddCycleText("#me ist ein Mann in feiner, aber weingetränkten Kleidung. Sein glattgeschorener Kopf glänzt durch ein wohlriechendes Öl.","#me is a man in expensive, albeit wine-stained clothes. His shaven head gleams with fine-smelling oil.");
    AddCycleText("Ich arbeite im königlichen Palast. Nichts geschieht dort, ohne das ich davon erfahre.","I work in the the Royal Palace. Nothing there happens without my knowledge.");
    AddCycleText("#me knurrt beim Anblick seines leeren Glases: 'Warum erfreu ich euch Bauern mit meiner Anwesenheit? Ich, der Liebling der Königin! Sie hat mich gestern sogar angesehen.'","#me frowns at the empty glass of wine 'Why do I bless you peasants with my presence? I, who am the Queen's favourite! She even looked at me two days ago!'");
    AddCycleText("Ich fächere der Königin Luft, damit sie einen ruhigen Kopf bewahren kann. Das nenn' ich eine wichtige Tätigkeit.","I wave the fan at the Queen, to keep her blue blood cool during in the heat of the desert. Now 'that' is an important duty!");
    -- omg hlp plz
    AddTraderTrigger("Help","");
    AddConsequence("inform","[Game help] This is the NPC Hassan. To learn more about him, your should greet the NPC first.");
    AddTraderTrigger("Hilfe","");
    AddConsequence("inform","[Spielhilfe] Dies ist der NPC Hassan. Wenn du mehr über ihn erfahren willst, grüße ihn zuerst.");
    -- First part, the gossiper is thirsty--
    AddTraderTrigger("Hello","#me stares at you. 'Be greeted, traveller! I am much too thirsty to talk. If you bring me a glass with red wine, I will gladly answer your questions.'");
    AddAdditionalTrigger("Greetings");
    AddAdditionalTrigger("Be greeted");
    AddAdditionalTrigger("Hail");
    AddAdditionalTrigger("Good day");
    AddAdditionalTrigger("Good morning");
    AddAdditionalTrigger("Good evening");
    AddCondition("qpg","=",0);
    AddConsequence("qpg","=",1);
    AddConsequence("inform","[New Quest] Cadomyr's Gossiper");
    AddTraderTrigger("Hello","Ah, hello again. Now that you quenched my thirst, ask whatever you like");
    AddAdditionalTrigger("Greetings");
    AddAdditionalTrigger("Be greeted");
    AddAdditionalTrigger("Hail");
    AddAdditionalTrigger("Good day");
    AddAdditionalTrigger("Good morning");
    AddAdditionalTrigger("Good evening");
    AddCondition("qpg","=",2);
    AddTraderTrigger("Hiho","What a peasantish way to greet a man of my stature! If you want to ask me something, bring me a glassful of red wine first to quench my thirst.'");
    AddAdditionalTrigger("Hallo");
    AddAdditionalTrigger("Hey");
    AddAdditionalTrigger("Greebas");
    AddAdditionalTrigger("Greebs");
    AddCondition("lang","english");
    AddCondition("qpg","=",0);
    AddConsequence("qpg","=",1);
    AddConsequence("inform","[New Quest] Cadomyr's Gossiper");
    AddTraderTrigger("Hiho","Hah! My friend, come, let us talk about important things, we're important persons, aren't we?");
    AddAdditionalTrigger("Hallo");
    AddAdditionalTrigger("Hey");
    AddAdditionalTrigger("Greebas");
    AddAdditionalTrigger("Greebs");
    AddCondition("lang","english");
    AddCondition("qpg","=",2);
    AddTraderTrigger("How are you","I am thirsty! If you bring bring me a glass of red wine, I will answer your questions... and I know plenty!");
    AddAdditionalTrigger("How feel");
    AddAdditionalTrigger("How do you do");
    AddCondition("qpg","=",0);
    AddConsequence("qpg","=",1);
    AddConsequence("inform","[New Quest] Cadomyr's Gossiper");
    AddTraderTrigger("How are you","Now that you brought me wine: Fine.");
    AddAdditionalTrigger("How feel");
    AddAdditionalTrigger("How do you do");
    AddCondition("qpg","=",2);
    AddTraderTrigger("quest","Bring me a glass of red wine, and I'll answer your questions! Otherwise leave me be!");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",0);
    AddCondition("lang","english");
    AddConsequence("qpg","=",1);
    AddConsequence("inform","[New Quest] Cadomyr's Gossiper");
    AddTraderTrigger("quest","Just ask me and I will share my vast knowledge about the palace with you.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",2);
    AddCondition("lang","english");
    AddTraderTrigger("task","Bring me a glass of red wine, and I'll answer your questions! Otherwise leave me be!");
    AddAdditionalTrigger("adventure");
    AddAdditionalTrigger("question");
    AddCondition("qpg","=",0);
    AddConsequence("qpg","=",1);
    AddConsequence("inform","[New Quest] Cadomyr's Gossiper");
    AddTraderTrigger("task","Just ask me and I will share my vast knowledge about the palace with you.");
    AddAdditionalTrigger("adventure");
    AddAdditionalTrigger("question");
    AddCondition("qpg","=",2);
    AddTraderTrigger("Grüße","#me starrt dich an. 'Seid gegrüßt, Reisender. Meine Kehle ist zu trocken zum Reden. Bringt mir ein Glas Wein, wenn ihr was erfahren wollt.");
    AddAdditionalTrigger("Gruß");
    AddAdditionalTrigger("Seid gegrüßt");
    AddAdditionalTrigger("Guten Tag");
    AddAdditionalTrigger("Guten Abend");
    AddAdditionalTrigger("Mahlzeit");
    AddAdditionalTrigger("Tach");
    AddAdditionalTrigger("Moin");
    AddCondition("qpg","=",0);
    AddConsequence("qpg","=",1);
    AddConsequence("inform","[Neues Quest] Der Schwätzer von Cadomyr");
    AddTraderTrigger("Grüße","Ah, hallo nochmal. Nun, da mein Durst gestillt ist, fragt was immer ihr wollt.");
    AddAdditionalTrigger("Gruß");
    AddAdditionalTrigger("Seid gegrüßt");
    AddAdditionalTrigger("Guten Tag");
    AddAdditionalTrigger("Guten Abend");
    AddAdditionalTrigger("Mahlzeit");
    AddAdditionalTrigger("Tach");
    AddAdditionalTrigger("Moin");
    AddCondition("qpg","=",2);
    AddTraderTrigger("Hiho","#me knurrt: 'Was für eine bäuerliche Art, einen Mann meines Ranges zu grüßen. Wenn ihr was wissen wollt, bringt mir erstmal ein Glas Wein, um meinen Durst zu stillen.");
    AddAdditionalTrigger("Hallo");
    AddAdditionalTrigger("Hey");
    AddAdditionalTrigger("Greebas");
    AddAdditionalTrigger("Greebs");
    AddCondition("qpg","=",0);
    AddCondition("lang","german");
    AddConsequence("qpg","=",1);
    AddConsequence("inform","[Neues Quest] Der Schwätzer von Cadomyr");
    AddTraderTrigger("Hiho","Hah! Mein Freund, lasst uns über wichtige Dinge Reden, denn wir sind wichtige Leute, nicht wahr?");
    AddAdditionalTrigger("Hallo");
    AddAdditionalTrigger("Hey");
    AddAdditionalTrigger("Greebas");
    AddAdditionalTrigger("Greebs");
    AddCondition("qpg","=",2);
    AddCondition("lang","german");
    AddTraderTrigger("Wie geht","Ich bin durstig! Wenn ihr mir ein Glas Wein bringt, beantworte ich eure Fragen... und ich weiß eine Menge!");
    AddAdditionalTrigger("Wie fühlst");
    AddAdditionalTrigger("Wie ist es ergangen");
    AddCondition("qpg","=",0);
    AddConsequence("qpg","=",1);
    AddConsequence("inform","[Neues Quest] Der Schwätzer von Cadomyr");
    AddTraderTrigger("Wie geht","Nun, da ihr mir Wein gebracht habt: Fein.");
    AddAdditionalTrigger("Wie fühlst");
    AddAdditionalTrigger("Wie ist es ergangen");
    AddCondition("qpg","=",2);
    AddTraderTrigger("quest","Bringt mir ein Glas Wein und ich beantworte eure Fragen. Ansonsten, lasst mich in Ruhe.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",0);
    AddCondition("lang","german");
    AddConsequence("qpg","=",1);
    AddConsequence("inform","[Neues Quest] Der Schwätzer von Cadomyr");
    AddTraderTrigger("quest","Fragt einfach, wonach auch immer und ich werde mein Wissen über den Palast mit euch teilen.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",2);
    AddCondition("lang","german");
    AddTraderTrigger("Aufgabe","Bringt mir ein Glas Wein und ich beantworte eure Fragen. Ansonsten, lasst mich in Ruhe.");
    AddAdditionalTrigger("Abenteuer");
    AddAdditionalTrigger("Frage");
    AddCondition("qpg","=",0);
    AddConsequence("qpg","=",1);
    AddConsequence("inform","[Neues Quest] Der Schwätzer von Cadomyr");
    AddTraderTrigger("Aufgabe","Fragt einfach, wonach auch immer und ich werde mein Wissen über den Palast mit euch teilen.");
    AddAdditionalTrigger("Abenteuer");
    AddAdditionalTrigger("Frage");
    AddCondition("qpg","=",2);
    AddTraderTrigger("Farewell","Farewell, traveller!");
    AddAdditionalTrigger("Good bye");
    AddAdditionalTrigger("Bye");
    AddAdditionalTrigger("Fare thy well");
    AddTraderTrigger("Ciao","Farewell, traveller!");
    AddAdditionalTrigger("Adieu");
    AddAdditionalTrigger("Au revoir");
    AddCondition("lang","english");
    AddTraderTrigger("your name","Hassan, the royal fan-waver.");
    AddAdditionalTrigger("who are you");
    AddAdditionalTrigger("who art thou");
    AddTraderTrigger("Tschüß","Gute Reise.");
    AddAdditionalTrigger("Tschüss");
    AddAdditionalTrigger("Wiedersehen");
    AddAdditionalTrigger("Gehabt euch wohl");
    AddTraderTrigger("Ciao","Gute Reise.");
    AddAdditionalTrigger("Adieu");
    AddAdditionalTrigger("Au revoir");
    AddCondition("lang","german");
    AddTraderTrigger("dein name","Hassan, der königliche Fächelwedler.");
    AddAdditionalTrigger("wer bist du");
    AddAdditionalTrigger("wer seid ihr");
    AddAdditionalTrigger("wie heißt");
    -- Small talk--
    AddTraderTrigger("profession","I am a servant of the Queen herself!");
    AddAdditionalText("I am a royal fan-waver! A glorious task!");
    AddTraderTrigger("tavern","A lousy tavern, in the glorious Kingdom of Cadomyr!");
    AddCondition("lang","english");
    AddTraderTrigger("beruf","Ich ein Diener der Königin.");
    AddAdditionalText("Ich bin der königliche Fächelwedler. Eine ehrenhafte Tätigkeit!");
    AddTraderTrigger("tavern","Eine einfache Taverne im prächtigen Königreich Cadomyr.");
    -- bringing the wine--
    AddTraderTrigger(".+","#me takes the glass and smiles pleased 'Very good! Now, you can ask me anything you like... about the town, the Queen, the palace, our glorious Cadomyr or even the vile neighbours.'");
    AddCondition("qpg","=",1);
    AddCondition("item",2057,"all",">",0);
    AddCondition("town","=","cadomyr");
    AddCondition("lang","english");
    AddConsequence("deleteitem",2057,1);
    AddConsequence("inform","[Quest solved] Hassan will now answer your questions. You advance in Queen Rosaline Edward's favour.");
    AddConsequence("rankpoints","cadomyr","+",20);
    AddConsequence("qpg","=",2);
    AddTraderTrigger(".+","#me takes the glass and smiles pleased 'Very good! Now, you can ask me anything you like... about the town, the Queen, the palace, our glorious Cadomyr or even the vile neighbours.'");
    AddCondition("qpg","=",1);
    AddCondition("item",2057,"all",">",0);
    AddCondition("lang","english");
    AddConsequence("deleteitem",2057,1);
    AddConsequence("inform","[Quest solved] Hassan will now answer your questions.");
    AddConsequence("qpg","=",2);
    AddTraderTrigger(".+","#me nimmt das Glas und grinst erfreut. 'Sehr gut. Nun könnt ihr mich alles fragen, was ihr wollt... über die Stadt, den Palast, Cadomyr oder unsere bösen Nachbarn.'");
    AddCondition("qpg","=",1);
    AddCondition("item",2057,"all",">",0);
    AddCondition("town","=","cadomyr");
    AddCondition("lang","german");
    AddConsequence("deleteitem",2057,1);
    AddConsequence("inform","[Quest gelöst] Hassan wird nun deine Fragen beantworten. Dein Ansehen bei Königin Rosaline Edwards steigt.");
    AddConsequence("rankpoints","cadomyr","+",20);
    AddConsequence("qpg","=",2);
    AddTraderTrigger(".+","#me nimmt das Glas und grinst erfreut. 'Sehr gut. Nun könnt ihr mich alles fragen, was ihr wollt... über die Stadt, den Palast, Cadomyr oder unsere bösen Nachbarn.'");
    AddCondition("qpg","=",1);
    AddCondition("item",2057,"all",">",0);
    AddCondition("lang","german");
    AddConsequence("deleteitem",2057,1);
    AddConsequence("inform","[Quest gelöst] Hassan wird nun deine Fragen beantworten.");
    AddConsequence("qpg","=",2);
    AddTraderTrigger(".+","Wine! I told you to bring me wine! You want to hear my stories, so grease my throat.");
    AddCondition("qpg","=",1);
    AddCondition("item",2057,"all","<",1);
    AddCondition("lang","english");
    AddTraderTrigger(".+","Wein! Ich hab gesagt, ich will Wein! Wer meine Geschichten hören will, muss erst meine Stimme ölen.");
    AddCondition("qpg","=",1);
    AddCondition("item",2057,"all","<",1);
    AddCondition("lang","german");
    -- questions--
    AddTraderTrigger("town","Cadomyr is the most civilized and advanced community! I hear the others live in pitiful clay huts.");
    AddCondition("qpg","=",2);
    AddTraderTrigger("queen","We are ruled by the Queen in Cadomyr! She can trace her ancestors back a millenia or more, having the bluest of blue blood of us all.");
    AddCondition("qpg","=",2);
    AddTraderTrigger("Rosaline","Oh, so you have heard about our Queen? Of course, not everyone thought that a woman should rule. Baron Hastings was quite vocal about that, but then he... disappeared.");
    AddCondition("qpg","=",2);
    AddCondition("lang","english");
    AddTraderTrigger("Edwards","Cadomyr has been ruled by the House of Edwards since its inception. Finest stock of Albar's bluebloods! The queen's father, King Reginald, ruled the town with firm grip.");
    AddCondition("qpg","=",2);
    AddCondition("lang","english");
    AddTraderTrigger("nobles","Like any proper nation, below the Queen are her nobles, just like the men are below the Gods... just as the Gods themselves have intended!");
    AddCondition("qpg","=",2);
    AddTraderTrigger("gods","#me nods eagerly, spilling some wine on the table 'We are proper, honourful and Gods-fearing people in Cadomyr, unlike our wretched neighbours!'");
    AddCondition("qpg","=",2);
    AddTraderTrigger("hono[u]+r","We value honour above all in Cadomyr. If you have no honour, then you have nothing at all! Then you are nothing at all!");
    AddCondition("qpg","=",2);
    AddTraderTrigger("like[s]","The Queen likes the shine of gold and the sparkle of precious gemstones.");
    AddCondition("qpg","=",2);
    AddTraderTrigger("gift","Gifts? Of course our Queen likes gifts! Expensive jewelry and shiny gemstones, especially diamonds, is what she fancies.");
    AddCondition("qpg","=",2);
    AddTraderTrigger("baron","Baron Hastings? He was not all too happy about Queen Rosaline finding a clause that enabled her to succeed his father on the throne, but now he has gone missing...");
    AddAdditionalTrigger("hastings");
    AddCondition("qpg","=",2);
    AddCondition("lang","english");
    AddTraderTrigger("wine","#me sips from the glass, smiling 'The wine is very good, thank you..'.");
    AddCondition("qpg","=",2);
    AddTraderTrigger("neighbo","#me grumbles: 'Oh! Galmair and Runewick! Pox on them! The ancient histories make it clear that the people of Cadomyr are the rightful lords of the land!");
    AddCondition("qpg","=",2);
    AddTraderTrigger("Cadomyr","#me sighs: 'Cadomyr, oh Cadomyr! We are the most honourful and magnificent nation around, held back only by the treachery of our cursed neighbours.'");
    AddCondition("qpg","=",2);
    AddCondition("lang","english");
    AddTraderTrigger("palace","If Cadomyr is the crown of the land, then the palace is certainly the most magnificent crown jewel! Sadly not all the servants in the palace are as reliable and loyal as I am.");
    AddCondition("qpg","=",2);
    AddTraderTrigger("Runewick","An false 'mage' rules them. Bah I say! They speak about wisdom, yet they have only lies to offer! They are nothing but cheap chartalans who try to twist the truth to justify their vile customs!");
    AddCondition("qpg","=",2);
    AddCondition("lang","english");
    AddTraderTrigger("Galmair","Galmair! That treacherous pit! Filled by the most despicable scum imaginable. Any decent person should steer clear of the place! Of course, I was lucky to never visit it myself.");
    AddCondition("qpg","=",2);
    AddCondition("lang","english");
    AddTraderTrigger("stadt","Cadomyr ist die zivilisierteste und fortschrittlichste Gesellschaft. Ich hörte, unsere Nachbarn wohnen in erbärmlichen Lehmhütten.");
    AddCondition("qpg","=",2);
    AddTraderTrigger("Königin","Wir werden von der Königin von Cadomyr regiert. Sie kann ihre Ahnen tausend Jahre zurückverfolgen und hat das blauste Blut von allen.");
    AddCondition("qpg","=",2);
    AddTraderTrigger("Rosaline","Nun, was habt ihr über unsere Königin gehört? Nicht jeder stimmt damit überein, dass eine Frau die Macht hat. Baron Hastings war ihr Redelsführer, aber dann verschwand er...");
    AddCondition("qpg","=",2);
    AddTraderTrigger("Edwards","Cadomyr wird seit seiner Gründung von den Edwards regiert. Feinstes albarisches Blut! Der Vater der Königin, König Reginald, regierte mit harter Hand.");
    AddCondition("qpg","=",2);
    AddTraderTrigger("Edel","Wie in jeder gute Nation bedient sich die Königin ihrer Edelleute, wie die Götter sich den Menschen bedienen. Genauso wollen es die Götter.");
    AddCondition("qpg","=",2);
    AddTraderTrigger("Gott","#me nickt heftig, etwas Wein verschüttend: 'Wir sind gute, ehrenhaft, götterfürchtige Leute hier in Cadomyr, nicht so unsere verdorbenen Nachbarn.'");
    AddAdditionalTrigger("Götter");
    AddCondition("qpg","=",2);
    AddTraderTrigger("Ehre","Die Ehre steht über allem hier in Cadomyr. Wenn man keine Ehre hat, hat man gar nichts mehr. Und dann ist man auch ein Nichts.");
    AddCondition("qpg","=",2);
    AddTraderTrigger("Vorliebe","Die Königin hat eine Vorliebe für Gold und funkelnde Edelsteine.");
    AddCondition("qpg","=",2);
    AddTraderTrigger("Geschenk","Geschenke? Na klar liebt unsere Königin Geschenke. Teure Juwelen und Edelsteine, besonders Diamanten, das erfreut sie.");
    AddCondition("qpg","=",2);
    AddTraderTrigger("Baron","Baron Hastings? Er war nicht sonderlich begeistert, als Königin Rosaline eine Klausel gefunden hat, die ihr ermöglichte, das Erbe ihres Vaters anzutreten. Nun ist er verschwunden...");
    AddAdditionalTrigger("hastings");
    AddCondition("qpg","=",2);
    AddTraderTrigger("Wein","#me schlürft etwas Wein: 'Danke für den Wein, der ist wirklich gut.'");
    AddCondition("qpg","=",2);
    AddTraderTrigger("Nachbar","#me knurrt: 'Oh! Galmair und Runewick, die Pest soll über sie kommen. Die Geschichte lehrt uns, dass die Herren von Cadomyr die Herren der Ländereien sind.'");
    AddCondition("qpg","=",2);
    AddTraderTrigger("Cadomyr","#me seufzt: 'Cadomyr, oh Cadomyr! Wir sind die ehrenhafteste und großartigste Nation in der Gegend, nur behindert durch unsere verräterischen Nachbarn.'");
    AddCondition("qpg","=",2);
    AddTraderTrigger("Palast","Wenn Cadomyr die Krone des Landes ist, dann ist der Palast das funkelnste Kronjuwel. Leider sind nicht alle Palastdiener so loyal und verlässlich wie ich.");
    AddCondition("qpg","=",2);
    AddTraderTrigger("Runewick","Ein falscher Magier regiert dort. Bah, sag ich! Sie reden über Weisheit, meinen aber Lügen. Sie sind nichts als Scharlatane welche die Wahrheit verdrehen, um ihre widerlichen Sitten zu rechtfertigen.");
    AddCondition("qpg","=",2);
    AddTraderTrigger("Galmair","Galmair! Eine Schlangengrube! Gefüllt mit dem widerlichsten Abschaum. Jeder ehrbare Mann sollte Galmair fern bleiben. Zum Glück war ich noch nie dort.");
    AddCondition("qpg","=",2);
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
            TellSmallTalk(message,originator);
        else
            Confused(
               "#me sieht dich leicht verwirrt an",
               "#me looks at you a little confused"
            );
        end
    end
end
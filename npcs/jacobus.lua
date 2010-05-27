-- INSERT INTO npc VALUES (nextval('npc_seq'),0,134,590,0,6,false,'Jacobus','npc_jacobus.lua',0);

require("npcs.base.autonpcfunctions")
module("npcs.jacobus")

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

    QuestID = 0;
    -- NPC by Estralis Seborian
    -- This NPC is supposed to trade (all goods are sold and bought, percentage indicates ratio of price bough/sold):
    -- 5% Tools (Miner): 24, 2763
    -- 10% Tools (Finesmith): 122, 2747
    -- 5% Tools (Gem grinder): 2140
    -- 10% Coal, Ores, Nuggets: 21, 22, 234, 2534, 2536
    -- 10% Gem powder: 446, 447, 448, 449, 450, 451, 452
    -- 10% Gems: 45, 46, 197, 198, 283, 284, 285
    -- 10% Gold goods: 224, 225, 336, 465
    -- 10% Jewellery: 62, 67, 71, 79, 82, 83, 222
    -- 10% Rings: 68, 235, 277, 278, 279, 280, 281, 282
    -- 10% Copper goods: 92, 393, 397, 399, 1001, 1840, 2031
    -- 5% Raw gems: 251, 252, 253, 254, 255, 256, 257
    -- Help 
    npcs.base.autonpcfunctions.AddTraderTrigger("Help","");
    npcs.base.autonpcfunctions.AddConsequence("inform","[Game Help] This NPC is the jeweller Jacobus. Keyphrases: Hello, jewellery.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Hilfe","");
    npcs.base.autonpcfunctions.AddConsequence("inform","[Spielhilfe] Dieser NPC ist der Juwellier Jacobus. Schlüsselwörter: Hallo, Juwelen.");
    -- General speech
    npcs.base.autonpcfunctions.AddTraderTrigger("Hello","Welcome to Cadomyr.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greetings");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Be greeted");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hail");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good day");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good morning");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good evening");
    npcs.base.autonpcfunctions.AddAdditionalText("Be greeted.");
    npcs.base.autonpcfunctions.AddAdditionalText("Hello, do you need a ruby necklace?");
    npcs.base.autonpcfunctions.AddTraderTrigger("Grüße","Willkommen in Cadomyr.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Gruß");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Seid gegrüßt");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Guten Tag");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Guten Abend");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Mahlzeit");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Tach");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Moin");
    npcs.base.autonpcfunctions.AddAdditionalText("Seid gegrüßt.");
    npcs.base.autonpcfunctions.AddAdditionalText("Hallo, braucht ihr eine Rubinkette?");
    npcs.base.autonpcfunctions.AddTraderTrigger("Hiho","Welcome to Cadomyr.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddAdditionalText("Be greeted.");
    npcs.base.autonpcfunctions.AddAdditionalText("Hello, do you need a ruby necklace?");
    npcs.base.autonpcfunctions.AddTraderTrigger("Hiho","Willkommen in Cadomyr.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddAdditionalText("Seid gegrüßt.");
    npcs.base.autonpcfunctions.AddAdditionalText("Hallo, braucht ihr eine Rubinkette?");
    npcs.base.autonpcfunctions.AddTraderTrigger("Farewell","I hope you'll recommend my goods.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good bye");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Bye");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Fare thy well");
    npcs.base.autonpcfunctions.AddAdditionalText("Good bye.");
    npcs.base.autonpcfunctions.AddAdditionalText("Have a nice day.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Tschüß","Ich hoffe, ihr werdet meine Waren weiterempfehlen.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Tschüss");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Wiedersehen");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Gehabt euch wohl");
    npcs.base.autonpcfunctions.AddAdditionalText("Auf wiedersehen.");
    npcs.base.autonpcfunctions.AddAdditionalText("Einen schönen Tag noch.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Ciao","I hope you'll recommend my goods.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddAdditionalText("Good bye.");
    npcs.base.autonpcfunctions.AddAdditionalText("Have a nice day.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Ciao","Ich hoffe, ihr werdet meine Waren weiterempfehlen.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddAdditionalText("Auf wiedersehen.");
    npcs.base.autonpcfunctions.AddAdditionalText("Einen schönen Tag noch.");
    npcs.base.autonpcfunctions.AddTraderTrigger("How are you","I feel like selling gems.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("How feel");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("How do you do");
    npcs.base.autonpcfunctions.AddTraderTrigger("Wie geht","Mir ist danach, Edelsteine zu verkaufen.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Wie fühlst");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Wie ist es ergangen");
    npcs.base.autonpcfunctions.AddTraderTrigger("your name","I am Jacobus, the jeweller.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("who are you");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("who art thou");
    npcs.base.autonpcfunctions.AddAdditionalText("Jacobus.");
    npcs.base.autonpcfunctions.AddAdditionalText("Jacobus. And do not call me Jack.");
    npcs.base.autonpcfunctions.AddTraderTrigger("dein name","Ich bin Jacobus der Juwelier.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wer bist du");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wer seid ihr");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wie heißt");
    npcs.base.autonpcfunctions.AddAdditionalText("Jacobus.");
    npcs.base.autonpcfunctions.AddAdditionalText("Jacobus. Und nennt mich nicht Jack.");
    -- Catching typical NPC phrases 
    npcs.base.autonpcfunctions.AddTraderTrigger("what sell","I sell any kind of jewellery.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("what buy");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("list wares");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("price of");
    npcs.base.autonpcfunctions.AddAdditionalText("Things of gold, of copper, of gems... What do you need?");
    npcs.base.autonpcfunctions.AddTraderTrigger("was verkauf","Ich handele mit allerlei Juwelen.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("was kauf");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("warenliste");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("preis von");
    npcs.base.autonpcfunctions.AddAdditionalText("Dinge aus Gold, aus Kupfer, aus Edelsteinen... was braucht ihr?");
    npcs.base.autonpcfunctions.AddTraderTrigger("tell something","I cannot tell you any interesting stories, sorry.");
    npcs.base.autonpcfunctions.AddTraderTrigger("erzähl was","Ich habe keine interessanten Geschichten zu erzählen.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("erzähl etwas");
    -- Small talk: The talk here should focus on possible questions. Feel free to add more!
    npcs.base.autonpcfunctions.AddTraderTrigger("profession","I am a jeweller. I also search for gems, but it is a hard job.");
    npcs.base.autonpcfunctions.AddTraderTrigger("beruf","Ich bin ein Juwellier, manchmal suche ich auch nach Edelsteinen. Aber das ist ein Knochenjob.");
    npcs.base.autonpcfunctions.AddTraderTrigger("job","Ich bin ein Juwellier, manchmal suche ich auch nach Edelsteinen. Aber das ist ein Knochenjob.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("job","I am a jeweller. I also search for gems, but it is a hard job.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("jewel","My jewels are the best you can get within a thousand miles. And I never travelled beyond.");
    npcs.base.autonpcfunctions.AddAdditionalText("I can sell you any kinds of jewels, if you have any gems, I'll gladly purchase them.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Juwel","Meine Juwelen sind die besten, die man innerhalb von tausend Meilen bekommen kann. Und ich war noch nie weiter weg.");
    npcs.base.autonpcfunctions.AddAdditionalText("Ich kann euch allerlei Juwelen anbieten. Wenn ihr Edelsteine habt, so würde ich sie gerne erwerben.");
    npcs.base.autonpcfunctions.AddTraderTrigger("trader","Fish, glass goods, swords - everything you desire you can find here on the marketplace.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("merchant");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("collegue");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("vendor");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("market");
    npcs.base.autonpcfunctions.AddTraderTrigger("händler","Fische, Glaswaren, Schwerter - alles was das Herz begehrt kann man hier auf dem Marktplatz finden.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("kollege");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("höker");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("markt");
    -- More small talk; add at least five triggers
    npcs.base.autonpcfunctions.AddTraderTrigger("Dieb","Diebe sind eine schreckliche Plage.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Thief","Thieves are a horrible pain for society.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Gold","Gold ist ein faszinierendes Material. Es ist zwar recht weich, aber es verrottet in tausend Jahren nicht.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("Gold","Gold is a fascinating material. It is soft though, but it does not corrode in a thousand years.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    -- Faction stuff
    npcs.base.autonpcfunctions.AddTraderTrigger("Elvaine","The Archmage hides behind his books instead of ruling Runewick. I am so glad we have our queen.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Morgan");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("archmage");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Erzmagier");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Elvaine","Der Erzmagier versteckt sich lieber hinter seinen Büchern als Runewick zu führen. Ich bin so glücklich, dass wir unsere Königin haben.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Morgan");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("archmage");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Erzmagier");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("Runewick","Runewick is far to the east. You have to npcs.base.autonpcfunctions.walk through a dense forest.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Runewick","Runewick ist weit im Osten. Ihr müßt durch einen tiefen Wald gehen, um dorthin zu gelangen.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("Valerio","I once had to craft a ring for the Don. It was such a horrifying experience to give to this filthy man.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Guilianni");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Don");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Valerio","Ich musste einst einen Ring für den Don fertigen. Es war ein schreckliches Erlebnis, den Ring diesem dreckigem Kerl zu überlassen.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Guilianni");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Don");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("Galmair","Galmair is far to the north, but better don't go there with too much money.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Galmair","Galmair ist weit im Norden, aber nehmt besser nicht zuviel Geld mit, wenn ihr dorthin geht.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("rosaline","All of us like queen Rosaline, she rules Cadomyr like nobody else could.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Königin");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("queen");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("edwards");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("rosaline","Jederman liebt die Königin Rosaline, sie regiert Cadomyr wie es niemand sonst könnte.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("königin");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("queen");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("edwards");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("Cadomyr","This is our home: Cadomyr. Do you smell the sea? Do you feel the honour?");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Cadomyr","Dies ist unsere Heimat: Cadomyr. Riecht ihr die See? Spürt ihr das Ehrgefühl?");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    -- Main land factions
    npcs.base.autonpcfunctions.AddTraderTrigger("albar","I heard all the best about Albar, but I have never been there.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("albar","Ich höre nur das beste über Albar, aber ich war noch nie selbst dort.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("gynk","Something is wrong with Gynk. If they just steal from each other, how do you they replace broken things?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("gync");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddAdditionalText("Gynk is a filthy place.");
    npcs.base.autonpcfunctions.AddAdditionalText("If you go to Gynk, well, do not exspect to return with any gold.");
    npcs.base.autonpcfunctions.AddTraderTrigger("gync","Irgendwas ist doch falsch in Gynk. Wenn die nur voneinander stehlen, wie ersetzen sie dann Zerbrochenes?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("gynk");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddAdditionalText("Gynk ist ein dreckiger Ort.");
    npcs.base.autonpcfunctions.AddAdditionalText("Wenn ihr nach Gynk geht, nun, denkt nicht, ihr kommt mit Gold zurück.");
    npcs.base.autonpcfunctions.AddTraderTrigger("salkama","I heard all the worst about Salkamar, but I have never been there.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("salkama","Ich höre nur schlimme Dinge über Salkamar, aber ich war noch nie selbst dort.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    -- Gods; each NPC should at react on at least one god, being a follower of said god
    npcs.base.autonpcfunctions.AddTraderTrigger("Ronagan","Oh, Ronagan! Well, he likes gems as much as I do and he guarantees that people buy new ones... still, I do not honour a god who promotes crimes.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Ronagan","Oh, Ronagan! Nun, er mag Edelsteine genauso gerne wie ich und er sorgt dafür, dass die Leute auch immerwieder neue kaufen... dennoch kann ich keinem Gott huldigen, der Diebstahl fördert.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("Zhambra","Zhambra is the god of friendship. And the best token of friendship is a ring. I have a special offer for you...");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Zhambra","Zhambra ist der Gott der Freundschaft. Und was ist besser geeignet, um Freundschaft zu besiegeln, als ein Ring? Ich hätte da gerade einen im Angebot...");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    -- Catching quest triggers
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","I don't have a quest for you, sorry.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Ich habe keinen Auftrag für dich.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("task","I don't have a quest for you, sorry.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npcs.base.autonpcfunctions.AddTraderTrigger("Auftrag","Ich habe keinen Auftrag für dich.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Aufgabe");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    -- Last catch: Think about keyphrases the player might say and that are not caught until here
    npcs.base.autonpcfunctions.AddTraderTrigger("Yes","Yes?");
    npcs.base.autonpcfunctions.AddAdditionalText("Indeed.");
    npcs.base.autonpcfunctions.AddAdditionalText("Interesting.");
    npcs.base.autonpcfunctions.AddAdditionalText("Huh?");
    npcs.base.autonpcfunctions.AddAdditionalText("But why?");
    npcs.base.autonpcfunctions.AddTraderTrigger("Ja","Ja?");
    npcs.base.autonpcfunctions.AddAdditionalText("In der Tat.");
    npcs.base.autonpcfunctions.AddAdditionalText("Interessant.");
    npcs.base.autonpcfunctions.AddAdditionalText("Huh?");
    npcs.base.autonpcfunctions.AddAdditionalText("Aber wieso?");
    npcs.base.autonpcfunctions.AddTraderTrigger("No","Not?");
    npcs.base.autonpcfunctions.AddAdditionalText("How comes?");
    npcs.base.autonpcfunctions.AddAdditionalText("But why not?");
    npcs.base.autonpcfunctions.AddTraderTrigger("Nein","Nicht?");
    npcs.base.autonpcfunctions.AddAdditionalText("Warum das?");
    npcs.base.autonpcfunctions.AddAdditionalText("Aber warum nicht?");
    -- Cycletext: Please add at least(!) five cycletext messages. The more, the better. You can use emotes (#me is green), too. 
    npcs.base.autonpcfunctions.AddCycleText("Feinste Juwelen!","Finest jewellery!");
    npcs.base.autonpcfunctions.AddCycleText("Habt ihr eure Frau enttäuscht? Kauft ihr einen Diamantring!","Did you offend your wife? Buy her a diamond ring!");
    npcs.base.autonpcfunctions.AddCycleText("Diamanten sind der beste Freund des Mannes.","Diamonds are a man's best friend.");
    npcs.base.autonpcfunctions.AddCycleText("Funkelnde Edelsteine im Angebot!","Sparkling gems as special offer!");
    npcs.base.autonpcfunctions.AddCycleText("Goldener Schmuck, genau das richtige für einen Damenhals.","Golden jewellery, the right thing for a maiden's neck.");
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
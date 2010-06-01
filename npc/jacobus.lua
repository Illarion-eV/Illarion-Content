-- INSERT INTO npc VALUES (nextval('npc_seq'),0,134,590,0,6,false,'Jacobus','npc_jacobus.lua',0);

require("npc.base.autonpcfunctions")
module("npc.jacobus", package.seeall)

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
    npc.base.autonpcfunctions.AddTraderTrigger("Help","");
    npc.base.autonpcfunctions.AddConsequence("inform","[Game Help] This NPC is the jeweller Jacobus. Keyphrases: Hello, jewellery.");
    npc.base.autonpcfunctions.AddTraderTrigger("Hilfe","");
    npc.base.autonpcfunctions.AddConsequence("inform","[Spielhilfe] Dieser NPC ist der Juwellier Jacobus. Schlüsselwörter: Hallo, Juwelen.");
    -- General speech
    npc.base.autonpcfunctions.AddTraderTrigger("Hello","Welcome to Cadomyr.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greetings");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Be greeted");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hail");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good day");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good morning");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good evening");
    npc.base.autonpcfunctions.AddAdditionalText("Be greeted.");
    npc.base.autonpcfunctions.AddAdditionalText("Hello, do you need a ruby necklace?");
    npc.base.autonpcfunctions.AddTraderTrigger("Grüße","Willkommen in Cadomyr.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Gruß");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Seid gegrüßt");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Guten Tag");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Guten Abend");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Mahlzeit");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Tach");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Moin");
    npc.base.autonpcfunctions.AddAdditionalText("Seid gegrüßt.");
    npc.base.autonpcfunctions.AddAdditionalText("Hallo, braucht ihr eine Rubinkette?");
    npc.base.autonpcfunctions.AddTraderTrigger("Hiho","Welcome to Cadomyr.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("Be greeted.");
    npc.base.autonpcfunctions.AddAdditionalText("Hello, do you need a ruby necklace?");
    npc.base.autonpcfunctions.AddTraderTrigger("Hiho","Willkommen in Cadomyr.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddAdditionalText("Seid gegrüßt.");
    npc.base.autonpcfunctions.AddAdditionalText("Hallo, braucht ihr eine Rubinkette?");
    npc.base.autonpcfunctions.AddTraderTrigger("Farewell","I hope you'll recommend my goods.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good bye");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Bye");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Fare thy well");
    npc.base.autonpcfunctions.AddAdditionalText("Good bye.");
    npc.base.autonpcfunctions.AddAdditionalText("Have a nice day.");
    npc.base.autonpcfunctions.AddTraderTrigger("Tschüß","Ich hoffe, ihr werdet meine Waren weiterempfehlen.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Tschüss");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Wiedersehen");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Gehabt euch wohl");
    npc.base.autonpcfunctions.AddAdditionalText("Auf wiedersehen.");
    npc.base.autonpcfunctions.AddAdditionalText("Einen schönen Tag noch.");
    npc.base.autonpcfunctions.AddTraderTrigger("Ciao","I hope you'll recommend my goods.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("Good bye.");
    npc.base.autonpcfunctions.AddAdditionalText("Have a nice day.");
    npc.base.autonpcfunctions.AddTraderTrigger("Ciao","Ich hoffe, ihr werdet meine Waren weiterempfehlen.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddAdditionalText("Auf wiedersehen.");
    npc.base.autonpcfunctions.AddAdditionalText("Einen schönen Tag noch.");
    npc.base.autonpcfunctions.AddTraderTrigger("How are you","I feel like selling gems.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("How feel");
    npc.base.autonpcfunctions.AddAdditionalTrigger("How do you do");
    npc.base.autonpcfunctions.AddTraderTrigger("Wie geht","Mir ist danach, Edelsteine zu verkaufen.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Wie fühlst");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Wie ist es ergangen");
    npc.base.autonpcfunctions.AddTraderTrigger("your name","I am Jacobus, the jeweller.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("who are you");
    npc.base.autonpcfunctions.AddAdditionalTrigger("who art thou");
    npc.base.autonpcfunctions.AddAdditionalText("Jacobus.");
    npc.base.autonpcfunctions.AddAdditionalText("Jacobus. And do not call me Jack.");
    npc.base.autonpcfunctions.AddTraderTrigger("dein name","Ich bin Jacobus der Juwelier.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("wer bist du");
    npc.base.autonpcfunctions.AddAdditionalTrigger("wer seid ihr");
    npc.base.autonpcfunctions.AddAdditionalTrigger("wie heißt");
    npc.base.autonpcfunctions.AddAdditionalText("Jacobus.");
    npc.base.autonpcfunctions.AddAdditionalText("Jacobus. Und nennt mich nicht Jack.");
    -- Catching typical NPC phrases 
    npc.base.autonpcfunctions.AddTraderTrigger("what sell","I sell any kind of jewellery.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("what buy");
    npc.base.autonpcfunctions.AddAdditionalTrigger("list wares");
    npc.base.autonpcfunctions.AddAdditionalTrigger("price of");
    npc.base.autonpcfunctions.AddAdditionalText("Things of gold, of copper, of gems... What do you need?");
    npc.base.autonpcfunctions.AddTraderTrigger("was verkauf","Ich handele mit allerlei Juwelen.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("was kauf");
    npc.base.autonpcfunctions.AddAdditionalTrigger("warenliste");
    npc.base.autonpcfunctions.AddAdditionalTrigger("preis von");
    npc.base.autonpcfunctions.AddAdditionalText("Dinge aus Gold, aus Kupfer, aus Edelsteinen... was braucht ihr?");
    npc.base.autonpcfunctions.AddTraderTrigger("tell something","I cannot tell you any interesting stories, sorry.");
    npc.base.autonpcfunctions.AddTraderTrigger("erzähl was","Ich habe keine interessanten Geschichten zu erzählen.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("erzähl etwas");
    -- Small talk: The talk here should focus on possible questions. Feel free to add more!
    npc.base.autonpcfunctions.AddTraderTrigger("profession","I am a jeweller. I also search for gems, but it is a hard job.");
    npc.base.autonpcfunctions.AddTraderTrigger("beruf","Ich bin ein Juwellier, manchmal suche ich auch nach Edelsteinen. Aber das ist ein Knochenjob.");
    npc.base.autonpcfunctions.AddTraderTrigger("job","Ich bin ein Juwellier, manchmal suche ich auch nach Edelsteinen. Aber das ist ein Knochenjob.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("job","I am a jeweller. I also search for gems, but it is a hard job.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("jewel","My jewels are the best you can get within a thousand miles. And I never travelled beyond.");
    npc.base.autonpcfunctions.AddAdditionalText("I can sell you any kinds of jewels, if you have any gems, I'll gladly purchase them.");
    npc.base.autonpcfunctions.AddTraderTrigger("Juwel","Meine Juwelen sind die besten, die man innerhalb von tausend Meilen bekommen kann. Und ich war noch nie weiter weg.");
    npc.base.autonpcfunctions.AddAdditionalText("Ich kann euch allerlei Juwelen anbieten. Wenn ihr Edelsteine habt, so würde ich sie gerne erwerben.");
    npc.base.autonpcfunctions.AddTraderTrigger("trader","Fish, glass goods, swords - everything you desire you can find here on the marketplace.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("merchant");
    npc.base.autonpcfunctions.AddAdditionalTrigger("collegue");
    npc.base.autonpcfunctions.AddAdditionalTrigger("vendor");
    npc.base.autonpcfunctions.AddAdditionalTrigger("market");
    npc.base.autonpcfunctions.AddTraderTrigger("händler","Fische, Glaswaren, Schwerter - alles was das Herz begehrt kann man hier auf dem Marktplatz finden.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("kollege");
    npc.base.autonpcfunctions.AddAdditionalTrigger("höker");
    npc.base.autonpcfunctions.AddAdditionalTrigger("markt");
    -- More small talk; add at least five triggers
    npc.base.autonpcfunctions.AddTraderTrigger("Dieb","Diebe sind eine schreckliche Plage.");
    npc.base.autonpcfunctions.AddTraderTrigger("Thief","Thieves are a horrible pain for society.");
    npc.base.autonpcfunctions.AddTraderTrigger("Gold","Gold ist ein faszinierendes Material. Es ist zwar recht weich, aber es verrottet in tausend Jahren nicht.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("Gold","Gold is a fascinating material. It is soft though, but it does not corrode in a thousand years.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    -- Faction stuff
    npc.base.autonpcfunctions.AddTraderTrigger("Elvaine","The Archmage hides behind his books instead of ruling Runewick. I am so glad we have our queen.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Morgan");
    npc.base.autonpcfunctions.AddAdditionalTrigger("archmage");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Erzmagier");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Elvaine","Der Erzmagier versteckt sich lieber hinter seinen Büchern als Runewick zu führen. Ich bin so glücklich, dass wir unsere Königin haben.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Morgan");
    npc.base.autonpcfunctions.AddAdditionalTrigger("archmage");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Erzmagier");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("Runewick","Runewick is far to the east. You have to npc.base.autonpcfunctions.walk through a dense forest.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Runewick","Runewick ist weit im Osten. Ihr müßt durch einen tiefen Wald gehen, um dorthin zu gelangen.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("Valerio","I once had to craft a ring for the Don. It was such a horrifying experience to give to this filthy man.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Guilianni");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Don");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Valerio","Ich musste einst einen Ring für den Don fertigen. Es war ein schreckliches Erlebnis, den Ring diesem dreckigem Kerl zu überlassen.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Guilianni");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Don");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("Galmair","Galmair is far to the north, but better don't go there with too much money.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Galmair","Galmair ist weit im Norden, aber nehmt besser nicht zuviel Geld mit, wenn ihr dorthin geht.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("rosaline","All of us like queen Rosaline, she rules Cadomyr like nobody else could.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Königin");
    npc.base.autonpcfunctions.AddAdditionalTrigger("queen");
    npc.base.autonpcfunctions.AddAdditionalTrigger("edwards");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("rosaline","Jederman liebt die Königin Rosaline, sie regiert Cadomyr wie es niemand sonst könnte.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("königin");
    npc.base.autonpcfunctions.AddAdditionalTrigger("queen");
    npc.base.autonpcfunctions.AddAdditionalTrigger("edwards");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("Cadomyr","This is our home: Cadomyr. Do you smell the sea? Do you feel the honour?");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Cadomyr","Dies ist unsere Heimat: Cadomyr. Riecht ihr die See? Spürt ihr das Ehrgefühl?");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    -- Main land factions
    npc.base.autonpcfunctions.AddTraderTrigger("albar","I heard all the best about Albar, but I have never been there.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("albar","Ich höre nur das beste über Albar, aber ich war noch nie selbst dort.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("gynk","Something is wrong with Gynk. If they just steal from each other, how do you they replace broken things?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("gync");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("Gynk is a filthy place.");
    npc.base.autonpcfunctions.AddAdditionalText("If you go to Gynk, well, do not exspect to return with any gold.");
    npc.base.autonpcfunctions.AddTraderTrigger("gync","Irgendwas ist doch falsch in Gynk. Wenn die nur voneinander stehlen, wie ersetzen sie dann Zerbrochenes?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("gynk");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddAdditionalText("Gynk ist ein dreckiger Ort.");
    npc.base.autonpcfunctions.AddAdditionalText("Wenn ihr nach Gynk geht, nun, denkt nicht, ihr kommt mit Gold zurück.");
    npc.base.autonpcfunctions.AddTraderTrigger("salkama","I heard all the worst about Salkamar, but I have never been there.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("salkama","Ich höre nur schlimme Dinge über Salkamar, aber ich war noch nie selbst dort.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    -- Gods; each NPC should at react on at least one god, being a follower of said god
    npc.base.autonpcfunctions.AddTraderTrigger("Ronagan","Oh, Ronagan! Well, he likes gems as much as I do and he guarantees that people buy new ones... still, I do not honour a god who promotes crimes.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Ronagan","Oh, Ronagan! Nun, er mag Edelsteine genauso gerne wie ich und er sorgt dafür, dass die Leute auch immerwieder neue kaufen... dennoch kann ich keinem Gott huldigen, der Diebstahl fördert.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("Zhambra","Zhambra is the god of friendship. And the best token of friendship is a ring. I have a special offer for you...");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Zhambra","Zhambra ist der Gott der Freundschaft. Und was ist besser geeignet, um Freundschaft zu besiegeln, als ein Ring? Ich hätte da gerade einen im Angebot...");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    -- Catching quest triggers
    npc.base.autonpcfunctions.AddTraderTrigger("quest","I don't have a quest for you, sorry.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("quest","Ich habe keinen Auftrag für dich.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("task","I don't have a quest for you, sorry.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npc.base.autonpcfunctions.AddTraderTrigger("Auftrag","Ich habe keinen Auftrag für dich.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Aufgabe");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    -- Last catch: Think about keyphrases the player might say and that are not caught until here
    npc.base.autonpcfunctions.AddTraderTrigger("Yes","Yes?");
    npc.base.autonpcfunctions.AddAdditionalText("Indeed.");
    npc.base.autonpcfunctions.AddAdditionalText("Interesting.");
    npc.base.autonpcfunctions.AddAdditionalText("Huh?");
    npc.base.autonpcfunctions.AddAdditionalText("But why?");
    npc.base.autonpcfunctions.AddTraderTrigger("Ja","Ja?");
    npc.base.autonpcfunctions.AddAdditionalText("In der Tat.");
    npc.base.autonpcfunctions.AddAdditionalText("Interessant.");
    npc.base.autonpcfunctions.AddAdditionalText("Huh?");
    npc.base.autonpcfunctions.AddAdditionalText("Aber wieso?");
    npc.base.autonpcfunctions.AddTraderTrigger("No","Not?");
    npc.base.autonpcfunctions.AddAdditionalText("How comes?");
    npc.base.autonpcfunctions.AddAdditionalText("But why not?");
    npc.base.autonpcfunctions.AddTraderTrigger("Nein","Nicht?");
    npc.base.autonpcfunctions.AddAdditionalText("Warum das?");
    npc.base.autonpcfunctions.AddAdditionalText("Aber warum nicht?");
    -- Cycletext: Please add at least(!) five cycletext messages. The more, the better. You can use emotes (#me is green), too. 
    npc.base.autonpcfunctions.AddCycleText("Feinste Juwelen!","Finest jewellery!");
    npc.base.autonpcfunctions.AddCycleText("Habt ihr eure Frau enttäuscht? Kauft ihr einen Diamantring!","Did you offend your wife? Buy her a diamond ring!");
    npc.base.autonpcfunctions.AddCycleText("Diamanten sind der beste Freund des Mannes.","Diamonds are a man's best friend.");
    npc.base.autonpcfunctions.AddCycleText("Funkelnde Edelsteine im Angebot!","Sparkling gems as special offer!");
    npc.base.autonpcfunctions.AddCycleText("Goldener Schmuck, genau das richtige für einen Damenhals.","Golden jewellery, the right thing for a maiden's neck.");
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
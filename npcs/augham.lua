-- INSERT INTO npc VALUES (nextval('npc_seq'),0,-81,-151,0,6,false,'Augham','npc_augham.lua',0);
dofile("npc_autonpcfunctions.lua")

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
-- drunken Town guard
    AddTraderTrigger("Gobaith","Uhhh, Gobb...aithh... I got en'uff to doo with dis strange town over here! *hicks*");
    AddCondition("lang","english");
    AddTraderTrigger("Gobaith","Uhhh, Gobb...aithh... Ich hab schonnn genugg zu tun mitt diesser Stadd dord drübn! *hicks*");
    AddCondition("lang","german");
    AddTraderTrigger("Greenbriar","Greeeenn...what? Is diss that town with those li'l people?");
    AddCondition("lang","english");
    AddTraderTrigger("Greenbriar","Greeeenn...was? Is diss that town with those li'l people?");
    AddCondition("lang","german");
    AddTraderTrigger("Hafen","Welcherrr 'afen? Gibt's da 'n Wirtshauss?");
    AddTraderTrigger("Harbo[u]+r","Whhhhich 'arbooor? Is dere 'ny pub?");
    AddTraderTrigger("Hellbriar","Whhhad is Hell...whaaad?");
    AddCondition("lang","english");
    AddTraderTrigger("Hellbriar","Wasss ist Hell...was?");
    AddCondition("lang","german");
    AddTraderTrigger("I am","Nice to meeet y'o.");
    AddTraderTrigger("I'm","Nice to meeet y'o.");
    AddTraderTrigger("Ich bin","Nett dich kennnnnen su lernn'n.");
    AddTraderTrigger("Mag Academy","Dose ssstubid magess. Theyyy never dring anydn'g.");
    AddTraderTrigger("Magierakademie","Diesee dumennn Mag'er. Die tringgen ja nie w's.");
    AddTraderTrigger("Nordmark","Gee... isn'd dad som'where 'n da south?");
    AddCondition("lang","english");
    AddTraderTrigger("Nordmark","Ahhh... Isss das nicht irgennnwo im Südn?");
    AddCondition("lang","german");
    AddTraderTrigger("Silberbrand","Habd ihr Zwergennnbier dabai? Es gibbd kein bessseres.");
    AddTraderTrigger("Silverbrand","Do youuu 'ave some dre..daw...dwarfffen beer withh youuu? Dere's no bedder one.");
    AddTraderTrigger("Tol Vanima","'olll Vvvanima?");
    AddTraderTrigger("Troll Bane","Ya, Trollll's Bane. Dis is Torl..Trollll's Brane be'ind me.");
    AddCondition("lang","english");
    AddTraderTrigger("Troll Bane","Jaa, Trollll's Bane. Das hinnder mir ist Torl..Trollll's Brane.");
    AddCondition("lang","german");
    AddTraderTrigger("Varshikar","Vashhhigar. Wasn't theeere somethinggg with... whatever. Id's somewhere over therre.");
    AddCondition("lang","english");
    AddTraderTrigger("Varshikar","Vashhhigar.Warr da nicccht was midd... wieauchimmer. Es iiisd irgendwo dordddrüb'n.");
    AddCondition("lang","german");
    AddTraderTrigger("auf bald","Prost!");
    AddTraderTrigger("beruf","Ich binnn Wächder in Toroll...Troll's Bar..Bane. Und ich be'ache d'see verdammmmde Stadt verdammmmd gut!");
    AddTraderTrigger("buy","Wanna buy sommething?");
    AddTraderTrigger("bye","Cheeers!");
    AddTraderTrigger("dein name","Mein nameee? Ich heiiiße %npcname");
    AddTraderTrigger("deine aufgabe","Ich bewache die Staddd. Diese Stadddda, Terolles Bane. Hinder mirrr. *hicks*");
    AddTraderTrigger("eure aufgabe","Ich bewache die Staddd. Diese Stadddda, Terolles Bane. Hinder mirrr. *hicks*");
    AddTraderTrigger("farewell","You leave? I sh'ld have aaaanother drink.");
    AddTraderTrigger("god","Gods, goddds. Overrated, I telllll you.");
    AddTraderTrigger("good day","Day? What day? *hicks*");
    AddTraderTrigger("gr[üue]+[sß]+e","Ich grüüße euch... Wi..Wie kann de Stadddwahe euch 'elfen? *hicks*");
    AddTraderTrigger("greetings","Greeedings. How ca... can the townguardsss 'elp you? *hicks*");
    AddTraderTrigger("greets","Greeedings. How ca... can the townguardsss 'elp you?");
    AddTraderTrigger("guten tag","Tag? Welcher Tag? *hicks*");
-- götternamen
    AddTraderTrigger("hail","Hail to you.");
    AddTraderTrigger("hallo","Seid gergerrüßt! Issst es nich' schön hirr?");
    AddTraderTrigger("helfen","Ihr wolld mir helfennn? Gud, bringt miir eine Flascheee Wein! *hicks*");
    AddTraderTrigger("hello","Be grgreeeeded! Isssn't id nice here?");
    AddTraderTrigger("help","You wannnnna helpp?");
    AddTraderTrigger("hilfe","Du willllsd helfenn?");
    AddTraderTrigger("how are you","Fine. I am thurstyyy.");
    AddTraderTrigger("job","My job iss to *hicks* guard Torll..Tre..Trollos Bane. This townnn behind me.");
    AddTraderTrigger("kaufen","Ich haabe doch gein Gellld, wie solll ich wasss gaufn?");
    AddTraderTrigger("mein name","Sehrr angenemm. Meinnn Name... Ich heißßße %NPCNAME.");
    AddTraderTrigger("mission","My missission is to... yes, tooo guard thad town. Trorrs Bane.");
    AddTraderTrigger("my name","Pleasssure to meet youu. Myyy name... I am %NPCNAME.");
    AddTraderTrigger("neu","Du bist neu hier? Geh am besten in die Stadt hinter mir, Troll's Bane, und suche nach Leuten, die dir helfen können.");
    AddTraderTrigger("I[ a']+m new","You are new to Illarion? You should visit the town behind me, Troll's Bane. Search for people who can help you.");
    AddTraderTrigger("newbie","You are new to Illarion? You should visit the town behind me, Troll's Bane. Search for people who can help you.");
    AddTraderTrigger("quest","I'mm always searching *hicks* foor someth'ng do dringg.");
    AddTraderTrigger("sell","I don't selll anyding.");
    AddTraderTrigger("t[äae]+tigkeit","Ich bewache die Staddd. Diese Stadddda, Terolles Bane. Hinder mirrr. *hicks*");
    AddTraderTrigger("verkaufen","Ichhh vergaufffe gar nix. *hicks*");
    AddTraderTrigger("was kaufst","Ich haabe doch gein Gellld, wie solll ich wasss gaufn?");
    AddTraderTrigger("was tust du","Ich bewache die Staddd. Diese Stadddda, Terolles Bane. Hinder mirrr. *hicks*");
    AddTraderTrigger("was tut ihr","Ich bewache die Staddd. Diese Stadddda, Terolles Bane. Hinder mirrr. *hicks*");
    AddTraderTrigger("was verkaufst","Ich vergaufffe gar nichhds.");
    AddTraderTrigger("wer seid","Ich bewachhhhe die.. alsoo Tero...Trollse Banne.");
    AddTraderTrigger("wer","Ich bewachhhhe die.. alsoo Tero...Trollse Banne.");
    AddTraderTrigger("what buy","I haveee no money, how woould I buy anyth *hicks* ing?");
    AddTraderTrigger("what sell","I don't selll anyding.");
    AddTraderTrigger("what you do","My job iss to *hicks* guard Torll..Tre..Trollos Bane. This townnn behind me.");
    AddTraderTrigger("where am I","You are inn Troob...Torb...Troll's Bane.");
    AddTraderTrigger("who","My job iss to *hicks* guard Torll..Tre..Trollos Bane. This townnn behind me.");
    AddTraderTrigger("wie geht es","Mirr gehtt es gudd. Fragtt doch mal diee Stadd, derr gehts sich'r nicht gut, die drehht sich... *hicks*");
    AddTraderTrigger("wie hei[sß]+t du","Ich heißße %NPCNAME.");
    AddTraderTrigger("wo bin ich","Du bisst in Troob...Torb...Troll's Bane.");
    AddTraderTrigger("you name","I amm %NPCNAME");
    AddTraderTrigger("wache","Dieee Wache? Wir llleisten guute Arbeid!");
    AddTraderTrigger("guard","Theee town guardss? We're doinnn' great worgg!");
    AddCycleText("Hicks!","Hicks!");
    AddCycleText("#me schwankt nach links","#me tumbles to the left");
    AddCycleText("#me schwankt nach rechts","#me tumbles to the right");
    AddCycleText("#me rülpst","#me burps");
    AddCycleText("#me zieht eine kleine Flasche aus der Tasche und trinkt einen Schluck","#me pulls a bottle out of his pocket and takes a sip");
    AddCycleText("#me lallt etwas unverständliches","#me brabbles something ununderstandable");    -- ********* END DYNAMIC PART ********
    TradSpeakLang={0,1};
    TradStdLang=0;
    
    increaseLangSkill(TradSpeakLang)
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

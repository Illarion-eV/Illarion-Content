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
    
    npcs.base.autonpcfunctions.InitTalkLists();
    
    
    -- ********* START DYNAMIC PART ********
-- drunken Town guard
    npcs.base.autonpcfunctions.AddTraderTrigger("Gobaith","Uhhh, Gobb...aithh... I got en'uff to doo with dis strange town over here! *hicks*");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Gobaith","Uhhh, Gobb...aithh... Ich hab schonnn genugg zu tun mitt diesser Stadd dord drübn! *hicks*");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("Greenbriar","Greeeenn...what? Is diss that town with those li'l people?");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Greenbriar","Greeeenn...was? Is diss that town with those li'l people?");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("Hafen","Welcherrr 'afen? Gibt's da 'n Wirtshauss?");
    npcs.base.autonpcfunctions.AddTraderTrigger("Harbo[u]+r","Whhhhich 'arbooor? Is dere 'ny pub?");
    npcs.base.autonpcfunctions.AddTraderTrigger("Hellbriar","Whhhad is Hell...whaaad?");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Hellbriar","Wasss ist Hell...was?");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("I am","Nice to meeet y'o.");
    npcs.base.autonpcfunctions.AddTraderTrigger("I'm","Nice to meeet y'o.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Ich bin","Nett dich kennnnnen su lernn'n.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Mag Academy","Dose ssstubid magess. Theyyy never dring anydn'g.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Magierakademie","Diesee dumennn Mag'er. Die tringgen ja nie w's.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Nordmark","Gee... isn'd dad som'where 'n da south?");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Nordmark","Ahhh... Isss das nicht irgennnwo im Südn?");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("Silberbrand","Habd ihr Zwergennnbier dabai? Es gibbd kein bessseres.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Silverbrand","Do youuu 'ave some dre..daw...dwarfffen beer withh youuu? Dere's no bedder one.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Tol Vanima","'olll Vvvanima?");
    npcs.base.autonpcfunctions.AddTraderTrigger("Troll Bane","Ya, Trollll's Bane. Dis is Torl..Trollll's Brane be'ind me.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Troll Bane","Jaa, Trollll's Bane. Das hinnder mir ist Torl..Trollll's Brane.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("Varshikar","Vashhhigar. Wasn't theeere somethinggg with... whatever. Id's somewhere over therre.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Varshikar","Vashhhigar.Warr da nicccht was midd... wieauchimmer. Es iiisd irgendwo dordddrüb'n.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("auf bald","Prost!");
    npcs.base.autonpcfunctions.AddTraderTrigger("beruf","Ich binnn Wächder in Toroll...Troll's Bar..Bane. Und ich be'ache d'see verdammmmde Stadt verdammmmd gut!");
    npcs.base.autonpcfunctions.AddTraderTrigger("buy","Wanna buy sommething?");
    npcs.base.autonpcfunctions.AddTraderTrigger("bye","Cheeers!");
    npcs.base.autonpcfunctions.AddTraderTrigger("dein name","Mein nameee? Ich heiiiße %npcname");
    npcs.base.autonpcfunctions.AddTraderTrigger("deine aufgabe","Ich bewache die Staddd. Diese Stadddda, Terolles Bane. Hinder mirrr. *hicks*");
    npcs.base.autonpcfunctions.AddTraderTrigger("eure aufgabe","Ich bewache die Staddd. Diese Stadddda, Terolles Bane. Hinder mirrr. *hicks*");
    npcs.base.autonpcfunctions.AddTraderTrigger("farewell","You leave? I sh'ld have aaaanother drink.");
    npcs.base.autonpcfunctions.AddTraderTrigger("god","Gods, goddds. Overrated, I telllll you.");
    npcs.base.autonpcfunctions.AddTraderTrigger("good day","Day? What day? *hicks*");
    npcs.base.autonpcfunctions.AddTraderTrigger("gr[üue]+[sß]+e","Ich grüüße euch... Wi..Wie kann de Stadddwahe euch 'elfen? *hicks*");
    npcs.base.autonpcfunctions.AddTraderTrigger("greetings","Greeedings. How ca... can the townguardsss 'elp you? *hicks*");
    npcs.base.autonpcfunctions.AddTraderTrigger("greets","Greeedings. How ca... can the townguardsss 'elp you?");
    npcs.base.autonpcfunctions.AddTraderTrigger("guten tag","Tag? Welcher Tag? *hicks*");
-- götternamen
    npcs.base.autonpcfunctions.AddTraderTrigger("hail","Hail to you.");
    npcs.base.autonpcfunctions.AddTraderTrigger("hallo","Seid gergerrüßt! Issst es nich' schön hirr?");
    npcs.base.autonpcfunctions.AddTraderTrigger("helfen","Ihr wolld mir helfennn? Gud, bringt miir eine Flascheee Wein! *hicks*");
    npcs.base.autonpcfunctions.AddTraderTrigger("hello","Be grgreeeeded! Isssn't id nice here?");
    npcs.base.autonpcfunctions.AddTraderTrigger("help","You wannnnna helpp?");
    npcs.base.autonpcfunctions.AddTraderTrigger("hilfe","Du willllsd helfenn?");
    npcs.base.autonpcfunctions.AddTraderTrigger("how are you","Fine. I am thurstyyy.");
    npcs.base.autonpcfunctions.AddTraderTrigger("job","My job iss to *hicks* guard Torll..Tre..Trollos Bane. This townnn behind me.");
    npcs.base.autonpcfunctions.AddTraderTrigger("kaufen","Ich haabe doch gein Gellld, wie solll ich wasss gaufn?");
    npcs.base.autonpcfunctions.AddTraderTrigger("mein name","Sehrr angenemm. Meinnn Name... Ich heißßße %NPCNAME.");
    npcs.base.autonpcfunctions.AddTraderTrigger("mission","My missission is to... yes, tooo guard thad town. Trorrs Bane.");
    npcs.base.autonpcfunctions.AddTraderTrigger("my name","Pleasssure to meet youu. Myyy name... I am %NPCNAME.");
    npcs.base.autonpcfunctions.AddTraderTrigger("neu","Du bist neu hier? Geh am besten in die Stadt hinter mir, Troll's Bane, und suche nach Leuten, die dir helfen können.");
    npcs.base.autonpcfunctions.AddTraderTrigger("I[ a']+m new","You are new to Illarion? You should visit the town behind me, Troll's Bane. Search for people who can help you.");
    npcs.base.autonpcfunctions.AddTraderTrigger("newbie","You are new to Illarion? You should visit the town behind me, Troll's Bane. Search for people who can help you.");
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","I'mm always searching *hicks* foor someth'ng do dringg.");
    npcs.base.autonpcfunctions.AddTraderTrigger("sell","I don't selll anyding.");
    npcs.base.autonpcfunctions.AddTraderTrigger("t[äae]+tigkeit","Ich bewache die Staddd. Diese Stadddda, Terolles Bane. Hinder mirrr. *hicks*");
    npcs.base.autonpcfunctions.AddTraderTrigger("verkaufen","Ichhh vergaufffe gar nix. *hicks*");
    npcs.base.autonpcfunctions.AddTraderTrigger("was kaufst","Ich haabe doch gein Gellld, wie solll ich wasss gaufn?");
    npcs.base.autonpcfunctions.AddTraderTrigger("was tust du","Ich bewache die Staddd. Diese Stadddda, Terolles Bane. Hinder mirrr. *hicks*");
    npcs.base.autonpcfunctions.AddTraderTrigger("was tut ihr","Ich bewache die Staddd. Diese Stadddda, Terolles Bane. Hinder mirrr. *hicks*");
    npcs.base.autonpcfunctions.AddTraderTrigger("was verkaufst","Ich vergaufffe gar nichhds.");
    npcs.base.autonpcfunctions.AddTraderTrigger("wer seid","Ich bewachhhhe die.. alsoo Tero...Trollse Banne.");
    npcs.base.autonpcfunctions.AddTraderTrigger("wer","Ich bewachhhhe die.. alsoo Tero...Trollse Banne.");
    npcs.base.autonpcfunctions.AddTraderTrigger("what buy","I haveee no money, how woould I buy anyth *hicks* ing?");
    npcs.base.autonpcfunctions.AddTraderTrigger("what sell","I don't selll anyding.");
    npcs.base.autonpcfunctions.AddTraderTrigger("what you do","My job iss to *hicks* guard Torll..Tre..Trollos Bane. This townnn behind me.");
    npcs.base.autonpcfunctions.AddTraderTrigger("where am I","You are inn Troob...Torb...Troll's Bane.");
    npcs.base.autonpcfunctions.AddTraderTrigger("who","My job iss to *hicks* guard Torll..Tre..Trollos Bane. This townnn behind me.");
    npcs.base.autonpcfunctions.AddTraderTrigger("wie geht es","Mirr gehtt es gudd. Fragtt doch mal diee Stadd, derr gehts sich'r nicht gut, die drehht sich... *hicks*");
    npcs.base.autonpcfunctions.AddTraderTrigger("wie hei[sß]+t du","Ich heißße %NPCNAME.");
    npcs.base.autonpcfunctions.AddTraderTrigger("wo bin ich","Du bisst in Troob...Torb...Troll's Bane.");
    npcs.base.autonpcfunctions.AddTraderTrigger("you name","I amm %NPCNAME");
    npcs.base.autonpcfunctions.AddTraderTrigger("wache","Dieee Wache? Wir llleisten guute Arbeid!");
    npcs.base.autonpcfunctions.AddTraderTrigger("guard","Theee town guardss? We're doinnn' great worgg!");
    npcs.base.autonpcfunctions.AddCycleText("Hicks!","Hicks!");
    npcs.base.autonpcfunctions.AddCycleText("#me schwankt nach links","#me tumbles to the left");
    npcs.base.autonpcfunctions.AddCycleText("#me schwankt nach rechts","#me tumbles to the right");
    npcs.base.autonpcfunctions.AddCycleText("#me rülpst","#me burps");
    npcs.base.autonpcfunctions.AddCycleText("#me zieht eine kleine Flasche aus der Tasche und trinkt einen Schluck","#me pulls a bottle out of his pocket and takes a sip");
    npcs.base.autonpcfunctions.AddCycleText("#me lallt etwas unverständliches","#me brabbles something ununderstandable");    -- ********* END DYNAMIC PART ********
    TradSpeakLang={0,1};
    TradStdLang=0;
    
    npcs.base.autonpcfunctions.increaseLangSkill(TradSpeakLang)
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

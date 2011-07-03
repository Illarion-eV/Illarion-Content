-- INSERT INTO npc VALUES (nextval('npc_seq'),0,-81,-151,0,6,false,'Augham','npc_augham.lua',0);
require("npc.base.autonpcfunctions")
module("npc.augham", package.seeall)

function useNPC(user,counter,param)
    thisNPC:increaseSkill(1,"common language",100);
    thisNPC:talkLanguage(Character.say, Player.german, "Finger weg!");
    thisNPC:talkLanguage(Character.say, Player.english, "Don't you touch me!");
end

function initializeNpc()
    if TraderFirst then
        return true;
    end
    
    npc.base.autonpcfunctions.InitTalkLists();
    
    
    -- ********* START DYNAMIC PART ********
-- drunken Town guard
    npc.base.autonpcfunctions.AddTraderTrigger("Gobaith","Uhhh, Gobb...aithh... I got en'uff to doo with dis strange town over here! *hicks*");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Gobaith","Uhhh, Gobb...aithh... Ich hab schonnn genugg zu tun mitt diesser Stadd dord drübn! *hicks*");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("Greenbriar","Greeeenn...what? Is diss that town with those li'l people?");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Greenbriar","Greeeenn...was? Is diss that town with those li'l people?");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("Hafen","Welcherrr 'afen? Gibt's da 'n Wirtshauss?");
    npc.base.autonpcfunctions.AddTraderTrigger("Harbo[u]+r","Whhhhich 'arbooor? Is dere 'ny pub?");
    npc.base.autonpcfunctions.AddTraderTrigger("Hellbriar","Whhhad is Hell...whaaad?");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Hellbriar","Wasss ist Hell...was?");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("I am","Nice to meeet y'o.");
    npc.base.autonpcfunctions.AddTraderTrigger("I'm","Nice to meeet y'o.");
    npc.base.autonpcfunctions.AddTraderTrigger("Ich bin","Nett dich kennnnnen su lernn'n.");
    npc.base.autonpcfunctions.AddTraderTrigger("Mag Academy","Dose ssstubid magess. Theyyy never dring anydn'g.");
    npc.base.autonpcfunctions.AddTraderTrigger("Magierakademie","Diesee dumennn Mag'er. Die tringgen ja nie w's.");
    npc.base.autonpcfunctions.AddTraderTrigger("Nordmark","Gee... isn'd dad som'where 'n da south?");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Nordmark","Ahhh... Isss das nicht irgennnwo im Südn?");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("Silberbrand","Habd ihr Zwergennnbier dabai? Es gibbd kein bessseres.");
    npc.base.autonpcfunctions.AddTraderTrigger("Silverbrand","Do youuu 'ave some dre..daw...dwarfffen beer withh youuu? Dere's no bedder one.");
    npc.base.autonpcfunctions.AddTraderTrigger("Tol Vanima","'olll Vvvanima?");
    npc.base.autonpcfunctions.AddTraderTrigger("Troll Bane","Ya, Trollll's Bane. Dis is Torl..Trollll's Brane be'ind me.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Troll Bane","Jaa, Trollll's Bane. Das hinnder mir ist Torl..Trollll's Brane.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("Varshikar","Vashhhigar. Wasn't theeere somethinggg with... whatever. Id's somewhere over therre.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Varshikar","Vashhhigar.Warr da nicccht was midd... wieauchimmer. Es iiisd irgendwo dordddrüb'n.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("auf bald","Prost!");
    npc.base.autonpcfunctions.AddTraderTrigger("beruf","Ich binnn Wächder in Toroll...Troll's Bar..Bane. Und ich be'ache d'see verdammmmde Stadt verdammmmd gut!");
    npc.base.autonpcfunctions.AddTraderTrigger("buy","Wanna buy sommething?");
    npc.base.autonpcfunctions.AddTraderTrigger("bye","Cheeers!");
    npc.base.autonpcfunctions.AddTraderTrigger("dein name","Mein nameee? Ich heiiiße %npcname");
    npc.base.autonpcfunctions.AddTraderTrigger("deine aufgabe","Ich bewache die Staddd. Diese Stadddda, Terolles Bane. Hinder mirrr. *hicks*");
    npc.base.autonpcfunctions.AddTraderTrigger("eure aufgabe","Ich bewache die Staddd. Diese Stadddda, Terolles Bane. Hinder mirrr. *hicks*");
    npc.base.autonpcfunctions.AddTraderTrigger("farewell","You leave? I sh'ld have aaaanother drink.");
    npc.base.autonpcfunctions.AddTraderTrigger("god","Gods, goddds. Overrated, I telllll you.");
    npc.base.autonpcfunctions.AddTraderTrigger("good day","Day? What day? *hicks*");
    npc.base.autonpcfunctions.AddTraderTrigger("gr[üue]+[sß]+e","Ich grüüße euch... Wi..Wie kann de Stadddwahe euch 'elfen? *hicks*");
    npc.base.autonpcfunctions.AddTraderTrigger("greetings","Greeedings. How ca... can the townguardsss 'elp you? *hicks*");
    npc.base.autonpcfunctions.AddTraderTrigger("greets","Greeedings. How ca... can the townguardsss 'elp you?");
    npc.base.autonpcfunctions.AddTraderTrigger("guten tag","Tag? Welcher Tag? *hicks*");
-- götternamen
    npc.base.autonpcfunctions.AddTraderTrigger("hail","Hail to you.");
    npc.base.autonpcfunctions.AddTraderTrigger("hallo","Seid gergerrüßt! Issst es nich' schön hirr?");
    npc.base.autonpcfunctions.AddTraderTrigger("helfen","Ihr wolld mir helfennn? Gud, bringt miir eine Flascheee Wein! *hicks*");
    npc.base.autonpcfunctions.AddTraderTrigger("hello","Be grgreeeeded! Isssn't id nice here?");
    npc.base.autonpcfunctions.AddTraderTrigger("help","You wannnnna helpp?");
    npc.base.autonpcfunctions.AddTraderTrigger("hilfe","Du willllsd helfenn?");
    npc.base.autonpcfunctions.AddTraderTrigger("how are you","Fine. I am thurstyyy.");
    npc.base.autonpcfunctions.AddTraderTrigger("job","My job iss to *hicks* guard Torll..Tre..Trollos Bane. This townnn behind me.");
    npc.base.autonpcfunctions.AddTraderTrigger("kaufen","Ich haabe doch gein Gellld, wie solll ich wasss gaufn?");
    npc.base.autonpcfunctions.AddTraderTrigger("mein name","Sehrr angenemm. Meinnn Name... Ich heißßße %NPCNAME.");
    npc.base.autonpcfunctions.AddTraderTrigger("mission","My missission is to... yes, tooo guard thad town. Trorrs Bane.");
    npc.base.autonpcfunctions.AddTraderTrigger("my name","Pleasssure to meet youu. Myyy name... I am %NPCNAME.");
    npc.base.autonpcfunctions.AddTraderTrigger("neu","Du bist neu hier? Geh am besten in die Stadt hinter mir, Troll's Bane, und suche nach Leuten, die dir helfen können.");
    npc.base.autonpcfunctions.AddTraderTrigger("I[ a']+m new","You are new to Illarion? You should visit the town behind me, Troll's Bane. Search for people who can help you.");
    npc.base.autonpcfunctions.AddTraderTrigger("newbie","You are new to Illarion? You should visit the town behind me, Troll's Bane. Search for people who can help you.");
    npc.base.autonpcfunctions.AddTraderTrigger("quest","I'mm always searching *hicks* foor someth'ng do dringg.");
    npc.base.autonpcfunctions.AddTraderTrigger("sell","I don't selll anyding.");
    npc.base.autonpcfunctions.AddTraderTrigger("t[äae]+tigkeit","Ich bewache die Staddd. Diese Stadddda, Terolles Bane. Hinder mirrr. *hicks*");
    npc.base.autonpcfunctions.AddTraderTrigger("verkaufen","Ichhh vergaufffe gar nix. *hicks*");
    npc.base.autonpcfunctions.AddTraderTrigger("was kaufst","Ich haabe doch gein Gellld, wie solll ich wasss gaufn?");
    npc.base.autonpcfunctions.AddTraderTrigger("was tust du","Ich bewache die Staddd. Diese Stadddda, Terolles Bane. Hinder mirrr. *hicks*");
    npc.base.autonpcfunctions.AddTraderTrigger("was tut ihr","Ich bewache die Staddd. Diese Stadddda, Terolles Bane. Hinder mirrr. *hicks*");
    npc.base.autonpcfunctions.AddTraderTrigger("was verkaufst","Ich vergaufffe gar nichhds.");
    npc.base.autonpcfunctions.AddTraderTrigger("wer seid","Ich bewachhhhe die.. alsoo Tero...Trollse Banne.");
    npc.base.autonpcfunctions.AddTraderTrigger("wer","Ich bewachhhhe die.. alsoo Tero...Trollse Banne.");
    npc.base.autonpcfunctions.AddTraderTrigger("what buy","I haveee no money, how woould I buy anyth *hicks* ing?");
    npc.base.autonpcfunctions.AddTraderTrigger("what sell","I don't selll anyding.");
    npc.base.autonpcfunctions.AddTraderTrigger("what you do","My job iss to *hicks* guard Torll..Tre..Trollos Bane. This townnn behind me.");
    npc.base.autonpcfunctions.AddTraderTrigger("where am I","You are inn Troob...Torb...Troll's Bane.");
    npc.base.autonpcfunctions.AddTraderTrigger("who","My job iss to *hicks* guard Torll..Tre..Trollos Bane. This townnn behind me.");
    npc.base.autonpcfunctions.AddTraderTrigger("wie geht es","Mirr gehtt es gudd. Fragtt doch mal diee Stadd, derr gehts sich'r nicht gut, die drehht sich... *hicks*");
    npc.base.autonpcfunctions.AddTraderTrigger("wie hei[sß]+t du","Ich heißße %NPCNAME.");
    npc.base.autonpcfunctions.AddTraderTrigger("wo bin ich","Du bisst in Troob...Torb...Troll's Bane.");
    npc.base.autonpcfunctions.AddTraderTrigger("you name","I amm %NPCNAME");
    npc.base.autonpcfunctions.AddTraderTrigger("wache","Dieee Wache? Wir llleisten guute Arbeid!");
    npc.base.autonpcfunctions.AddTraderTrigger("guard","Theee town guardss? We're doinnn' great worgg!");
    npc.base.autonpcfunctions.AddCycleText("Hicks!","Hicks!");
    npc.base.autonpcfunctions.AddCycleText("#me schwankt nach links","#me tumbles to the left");
    npc.base.autonpcfunctions.AddCycleText("#me schwankt nach rechts","#me tumbles to the right");
    npc.base.autonpcfunctions.AddCycleText("#me rülpst","#me burps");
    npc.base.autonpcfunctions.AddCycleText("#me zieht eine kleine Flasche aus der Tasche und trinkt einen Schluck","#me pulls a bottle out of his pocket and takes a sip");
    npc.base.autonpcfunctions.AddCycleText("#me lallt etwas unverständliches","#me brabbles something ununderstandable");    -- ********* END DYNAMIC PART ********
    TradSpeakLang={0,1};
    TradStdLang=0;
    
    npc.base.autonpcfunctions.increaseLangSkill(TradSpeakLang)
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

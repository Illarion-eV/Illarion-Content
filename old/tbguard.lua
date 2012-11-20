-- INSERT INTO npc VALUES (nextval('npc_seq'),0,-64,-105,0,0,false,'John Leador','npc_tbguard.lua',0);
-- INSERT INTO npc VALUES (nextval('npc_seq'),0,-64,-108,0,4,false,'Adran Tanner','npc_tbguard.lua',0);
-- INSERT INTO npc VALUES (nextval('npc_seq'),0,-67,-117,0,6,false,'Faldor Norem','npc_tbguard.lua',0);
-- INSERT INTO npc VALUES (nextval('npc_seq'),0,-65,-130,0,6,false,'Hagen Delmos','npc_tbguard.lua',0);
-- INSERT INTO npc VALUES (nextval('npc_seq'),0,-73,-143,0,4,false,'Jon Fehrin','npc_tbguard.lua',0);
-- INSERT INTO npc VALUES (nextval('npc_seq'),0,-78,-143,0,4,false,'Kelvin Rakarv','npc_tbguard.lua',0);
-- INSERT INTO npc VALUES (nextval('npc_seq'),0,-100,-139,0,4,false,'Laran Threll','npc_tbguard.lua',0);
-- INSERT INTO npc VALUES (nextval('npc_seq'),0,-97,-139,0,4,false,'Manuel Lenath','npc_tbguard.lua',0);
-- INSERT INTO npc VALUES (nextval('npc_seq'),0,-98,-112,0,4,false,'Neris Ovento','npc_tbguard.lua',0);
-- INSERT INTO npc VALUES (nextval('npc_seq'),0,-116,-123,0,4,false,'Rowan Gavin','npc_tbguard.lua',0);
-- INSERT INTO npc VALUES (nextval('npc_seq'),0,-119,-97,0,6,false,'Seron Lefar','npc_tbguard.lua',0);
-- INSERT INTO npc VALUES (nextval('npc_seq'),0,-134,-102,0,4,false,'Talon Lefar','npc_tbguard.lua',0);
-- INSERT INTO npc VALUES (nextval('npc_seq'),0,-155,-88,0,6,false,'Viktor Arkon','npc_tbguard.lua',0);
-- INSERT INTO npc VALUES (nextval('npc_seq'),0,-155,-84,0,6,false,'Toran Lobas','npc_tbguard.lua',0);
require("npc.base.autonpcfunctions")
module("npc.tbguard", package.seeall)

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

    npc.base.autonpcfunctions.SetRadius(0);
    npc.base.autonpcfunctions.AddCycleText("#me blickt sich aufmerksam um.","#me looks around concentrated.");
    npc.base.autonpcfunctions.AddCycleText("#me lehnt sich leicht gegen die Wand.","#me leans slightly against the wall.");
    npc.base.autonpcfunctions.AddCycleText("#me blickt zum Tor.","#me looks towards the door.");
    npc.base.autonpcfunctions.AddCycleText("#me blickt zu seinem Partner und nickt ihm zu.","#me looks to his partner and nods to him.");
    npc.base.autonpcfunctions.AddCycleText("#me gähnt leicht und hält die Hand vor den Mund.","#me yawns slightly and puts his hand in front of his mouth.");
    npc.base.autonpcfunctions.AddCycleText("#me wischt über seine Rüstung bis diese wieder glänzt.","#me wipes over his armor until it looks shiny again.");
    npc.base.autonpcfunctions.AddCycleText("#me hustet kurz.","#me coughs once.");
    npc.base.autonpcfunctions.AddTraderTrigger("Help","(( [Help] This is an NPC with the name %NPCNAME. He reacts on: Hello, Who are you, What do you do, Troll's Bane");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hilfe");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Help","(( [Hilfe] Das ist ein NPC mit Namen %NPCNAME. Er reagiert auf: Hallo, Wer bist du, Was machst du, Troll's Bane");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hilfe");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("Grü[ßs]+e","Grüße euch");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hi");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hiho");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddAdditionalText("Guten Tag");
    npc.base.autonpcfunctions.AddAdditionalText("Grüße, geht jetzt weiter ich muss aufpassen");
    npc.base.autonpcfunctions.AddAdditionalText("Hmmm? Was? Ah...grüße, ja ja.");
    npc.base.autonpcfunctions.AddAdditionalText("Grüße, wollt ihr etwas?");
    npc.base.autonpcfunctions.AddTraderTrigger("Greetings","Greetings");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hello");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hi");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good day");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hiho");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("Good day");
    npc.base.autonpcfunctions.AddAdditionalText("Greetings, move along now please, I have to watch");
    npc.base.autonpcfunctions.AddAdditionalText("Hmm? What? Ah... greetings, yes yes.");
    npc.base.autonpcfunctions.AddAdditionalText("Greetings, do you want anything?");
    npc.base.autonpcfunctions.AddTraderTrigger("Auf bald","Auf bald und haltet euch an die Gesetze in der Stadt.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Bis bald");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Tschüss");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Wiedersehen");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Mach[t]*s gut");
    npc.base.autonpcfunctions.AddAdditionalText("Bis bald, wenn etwas passiert wisst ihr wo ich bin.");
    npc.base.autonpcfunctions.AddTraderTrigger("Farewell","Farewell and follow the laws of this town.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Be well");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Bye");
    npc.base.autonpcfunctions.AddAdditionalTrigger("see you");
    npc.base.autonpcfunctions.AddAdditionalText("Farewell, in case something happens you know where to find me.");
    npc.base.autonpcfunctions.AddTraderTrigger("Wer du","Ich bin %NPCNAME, Stadtwache von Troll's Bane und Soldat in der Armee Salkamars! Hail dem Imperium!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Wer sie");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Wer ihr");
    npc.base.autonpcfunctions.AddTraderTrigger("Who you","I'm %NPCNAME, town guard of Troll's Bane and soldier at the salkamaerian Army");
    npc.base.autonpcfunctions.AddTraderTrigger("Was tust","Was meine Aufgabe ist? Wonach sieht es denn aus? Ich passe hier auf das keiner Ärger macht.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Was machst");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Was macht");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Was tut");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Aufgabe");
    npc.base.autonpcfunctions.AddTraderTrigger("What do","What my task is? What does it look like? I'm watching so nobody causes any trouble here.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("work");
    npc.base.autonpcfunctions.AddAdditionalTrigger("task");
    npc.base.autonpcfunctions.AddTraderTrigger("Troll's Bane","Ja das hier ist Troll's Bane, eine ziemlich herunter gekommene Stadt die nun aber dank Prinz von Lonewood wieder erblühen wird! Dabei helfen ihm Herzog Devan und Herzog Ross.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Trolls Bane");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("Troll's Bane","Well yes this is Troll's Bane, it's a mess here, but thanks to prince of Lonewood this town will become much better now! By this he is supported by Duke Devan and Duke Ross.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Trolls Bane");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Varshikar","Varshikar ist eine kleine Stadt im Nordosten. Die Träger des Feuers haben dort ihren Sitz.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("Varshikar","Varshikar is a small town in the northeast. The bearers of fire live there.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Nordmark","Das ist irgendeine Barbarensiedlung. Soll im Norden sein... mehr weis ich davon nicht.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("Nordmark","This is some barbarian settlement. Somewhere in the north, I don't know more about this.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Greenbriar","Die Halblingssiedlung, liegt im Südwesten auf einer kleinen Insel. Etwas südlich davon ist das Versteck der Tempelratten.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Green Briar");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("Greenbriar","The halfling settlement, this is located in the south west on a small island. A little south of is the hideout of the temple rats is located.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Green Briar");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Hellbriar","Das ist das Versteck des Tempels, einer Bande von Mördern, Entführern, Moschran Anbetern und Nekromanten. Die Sorte von Leuten die in Troll's Bane nichts zu suchen haben.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hell Briar");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("Hellbriar","This is the hideout of the temple, a group of murderers, kidnappers, moshran worshippers and necromants. The kind of persons who are absolutly not wanted in Troll's Bane.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hell Briar");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Vanima","Die Insel der Elfen, soll ein ziemlich ruhiger Ort sein, ich war nie dort.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("Vanima","The island of the elves. I heared is a pretty quiet place... but I was never there myself.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Silberbrand","Ah ja, Silberbrand, Heimat der Zwerge. Die haben mit Abstand das beste Bier hier auf der Insel!");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("Silverbrand","Ah yes, Silverbrand. Home of the dwarfs. They make the best beer on this island by far!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Silberbrand");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Union","Die Farmers Union... das sind ein paar Bauern die südlich von Troll's Bane leben glaube ich.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("Union","The farmers union... thats some peasants who live south of Troll's Bane as far as I know.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Lonewood","Unser großer Anführer, Prinz Anarius of Lonewood. Er regiert Troll's Bane und hat die ganzen Verbrecher, wie den Tempel, die diese Stadt bevölkert haben hinausgetrieben!");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("Lonewood","Out great leader, prince Anarius of Lonewood. He leads Troll's Bane and drove all those criminals, such as the temple, who were in that town out!");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Ross","Herzog Roland Ross ist einer der Herzöge von Troll's Bane die den Prinzen bei seiner Arbeit zum Wohle der Stadt unterstützen.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("Ross","Duke Roland Ross is one of the dukes of Troll's Bane who help the prince at this work to improve the welfare of the town.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Devan","Herzog Geralt Devan ist einer der Herzöge von Troll's Bane die den Prinzen bei seiner Arbeit zum Wohle der Stadt unterstützen.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("Devan","Duke Geralt Devan is one of the dukes of Troll's Bane who help the prince at this work to improve the welfare of the town.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Mitglieder Tempel","Man muss den Feind kennen um ihn zu besiegen. Darum sage ich euch die bekannten Mitglieder des Tempels. Es sind Verdazar, Joxia Doral, Dain Laiden, Daelyn, Johann Brown, Drathe Blue, Endyl, Dominic Fisher, Edward Cromwell, Orioli, Dramyr, Misjlah, Azrael Suruki, Slug'nar, Thain, Ian Blyte, Lindian und Erick McSpinan. Merkt euch diese Namen, sie sind der Feind!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Mitglieder Temple");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("Members Temple","One has to know the enemy to defend it. So I tell you the currently known members of the temple. There are Verdazar, Joxia Doral, Dain Laiden, Daelyn, Johann Brown, Drathe Blue, Endyl, Dominic Fisher, Edward Cromwell, Orioli, Dramyr, Misjlah, Azrael Suruki, Slug'nar, Thain, Ian Blyte, Lindian and Erick McSpinan. Remember them! They are the enemy!");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Temple","Der Tempel ist eine Bande von Verbrechern, Halsabschneidern, Mördern, Entführern, Moschran Anbetern und Nekromanten! Jedes ihrer Mitglieder ist aus der Stadt verbannt!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Tempel");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("Temple","The temple is a group of criminals, cutthroats, murderers, kidnappers, Moshran worshippers and necromants! Every of their members is banned from the town!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Tempel");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Träger Feuer","Die Träger des Feuers leben im Nordenosten, bei Varshikar. Sie kämpfen wie auch Troll's Bane gegen Abschaum wie den Tempel. Angeführt werden sie von Djironnyma.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Bearer Fire");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("Bearer Fire","The Bearers of Fire live in the north east, at Varshikar. They fight, similar to Troll's Bane against scums like the temple. They are leaded by Djironnyma.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
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

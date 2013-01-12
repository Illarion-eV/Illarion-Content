-- INSERT INTO npc VALUES (nextval('npc_seq'),0,123,549,0,4,false,'Imios Poleaos','npc_imios_poleaos.lua',0);

require("npc.base.autonpcfunctions")
module("npc.imios_poleaos", package.seeall)

function useNPC(user)
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

    -- Palace Guard positioned infront of the gate of 'Cleos' palace
    QuestID = 101;
    npc.base.autonpcfunctions.AddCycleText("#me schaut sich wachsam und ungeduldig um","#me looks vigilanty and impatiently around");
    npc.base.autonpcfunctions.AddCycleText("#me rückt seine Rüstung zurecht, auf welcher das Emblem der Stadtwache prangt","#me adjusts his armour on which the emblem of the palace guard can be seen");
    npc.base.autonpcfunctions.AddCycleText("#me steht kerzengerade und wachsam vor dem Palasttor","#me stands bolt upright and watchful infront of the palace gate");
    npc.base.autonpcfunctions.AddCycleText("#me hat seine Hand locker auf dem Schwertgriff liegen","#me 's hand lays lax on the sword handle");
    npc.base.autonpcfunctions.AddCycleText("#me verlagert sein Gewicht etwas","#me shifts his position a little");
    npc.base.autonpcfunctions.AddCycleText("#me schaut die Passanten misstrauisch an","#me watches the passersby suspiciously");
    -- Game help
    npc.base.autonpcfunctions.AddTraderTrigger("help","[Game Help] This NPC is a palace guard, he might have a problem you can help him with. Keywords: quest, problem");
    npc.base.autonpcfunctions.AddTraderTrigger("hilfe","[Spielhilfe] Dieser NPC ist eine Palastwache und hat vielleicht ein Problem. Schlüsselwörter: Quest, Problem");
    npc.base.autonpcfunctions.AddTraderTrigger("restart","Quest restarted");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",0);
    -- Smalltalk
    npc.base.autonpcfunctions.AddTraderTrigger("Hello","Be greeted stranger");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greetings");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Be greeted");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hail");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good day");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good morning");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good evening");
    npc.base.autonpcfunctions.AddAdditionalText("Welcome to the palace of her majesty");
    npc.base.autonpcfunctions.AddAdditionalText("Greetings, pleace behave yourself or I'll have to lock you up");
    npc.base.autonpcfunctions.AddTraderTrigger("Grüße","Seid gegrüßt Fremder");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Gruß");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Seid gegrüßt");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Guten Tag");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Guten Abend");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Mahlzeit");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Tach");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Moin");
    npc.base.autonpcfunctions.AddAdditionalText("Willkommen in dem Palast eurer Majestät");
    npc.base.autonpcfunctions.AddAdditionalText("Grüße, bitte benehmt euch, oder ich muss euch einsperren");
    npc.base.autonpcfunctions.AddTraderTrigger("Hiho","Be greeted stranger");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("Welcome to the palace of her majesty");
    npc.base.autonpcfunctions.AddAdditionalText("Greetings, pleace behave yourself or I'll have to lock you up");
    npc.base.autonpcfunctions.AddTraderTrigger("Hiho","Seid gegrüßt Fremder");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddAdditionalText("Willkommen in dem Palast eurer Majestät");
    npc.base.autonpcfunctions.AddAdditionalText("Grüße, bitte benehmt euch, oder ich muss euch einsperren");
    npc.base.autonpcfunctions.AddTraderTrigger("Farewell","May Malachin guide your way!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good bye");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Bye");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Fare thy well");
    npc.base.autonpcfunctions.AddAdditionalText("Malachin with you!");
    npc.base.autonpcfunctions.AddAdditionalText("Farewell");
    npc.base.autonpcfunctions.AddTraderTrigger("Tschüß","Möge Malachin euch auf euren Wegen beschützen!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Tschüss");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Wiedersehen");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Gehabt euch wohl");
    npc.base.autonpcfunctions.AddAdditionalText("Malachin mit euch!");
    npc.base.autonpcfunctions.AddAdditionalText("Auf bald");
    npc.base.autonpcfunctions.AddTraderTrigger("Ciao","Indeed. Farewell");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("Malachin with you!");
    npc.base.autonpcfunctions.AddAdditionalText("Farewell");
    npc.base.autonpcfunctions.AddTraderTrigger("Ciao","Gewiss. Auf bald");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddAdditionalText("Malachin mit euch!");
    npc.base.autonpcfunctions.AddAdditionalText("Auf bald");
    npc.base.autonpcfunctions.AddTraderTrigger("How are you","I could do better, am a little nervous");
    npc.base.autonpcfunctions.AddAdditionalTrigger("How feel");
    npc.base.autonpcfunctions.AddAdditionalTrigger("How do you do");
    npc.base.autonpcfunctions.AddAdditionalText("Nervous");
    npc.base.autonpcfunctions.AddAdditionalText("Fine I suppose but nervous");
    npc.base.autonpcfunctions.AddTraderTrigger("Wie geht","Es könnte mir besser gehen, bin ein wenig nervös");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Wie fühlst");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Wie ist es ergangen");
    npc.base.autonpcfunctions.AddAdditionalText("Nervös");
    npc.base.autonpcfunctions.AddAdditionalText("Gut, nehme ich an, nur nervös");
    npc.base.autonpcfunctions.AddTraderTrigger("your name","I'm Imios Poleaos");
    npc.base.autonpcfunctions.AddAdditionalTrigger("who are you");
    npc.base.autonpcfunctions.AddAdditionalTrigger("who art thou");
    npc.base.autonpcfunctions.AddAdditionalText("Imios Poleaos at your service");
    npc.base.autonpcfunctions.AddAdditionalText("Palace guard Imios Poleaos");
    npc.base.autonpcfunctions.AddTraderTrigger("dein name","Ich bin Imios Poleaos");
    npc.base.autonpcfunctions.AddAdditionalTrigger("wer bist du");
    npc.base.autonpcfunctions.AddAdditionalTrigger("wer seid ihr");
    npc.base.autonpcfunctions.AddAdditionalTrigger("wie heißt");
    npc.base.autonpcfunctions.AddAdditionalText("Imios Poleaos zu diensten");
    npc.base.autonpcfunctions.AddAdditionalText("Palastwache Imios Poleaos");
    npc.base.autonpcfunctions.AddTraderTrigger("why nervous","I have a small problem, maybe you could help me with that?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("nervous");
    npc.base.autonpcfunctions.AddTraderTrigger("wieso nervös","Ich habe ein kleines Problem, vielleicht könnt ihr mir damit helfen?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("warum nervös");
    npc.base.autonpcfunctions.AddAdditionalTrigger("nervös");
    -- Typical NPC phraces
    npc.base.autonpcfunctions.AddTraderTrigger("what sell","I do not sell or buy anything");
    npc.base.autonpcfunctions.AddAdditionalTrigger("what buy");
    npc.base.autonpcfunctions.AddAdditionalTrigger("list wares");
    npc.base.autonpcfunctions.AddAdditionalTrigger("price of");
    npc.base.autonpcfunctions.AddAdditionalText("I'm not a merchant but a  member of the palace guard");
    npc.base.autonpcfunctions.AddAdditionalText("I do not trade");
    npc.base.autonpcfunctions.AddTraderTrigger("was verkauf","I kaufe und verkaufe nichts");
    npc.base.autonpcfunctions.AddAdditionalTrigger("was kauf");
    npc.base.autonpcfunctions.AddAdditionalTrigger("warenliste");
    npc.base.autonpcfunctions.AddAdditionalTrigger("preis von");
    npc.base.autonpcfunctions.AddAdditionalText("Ich handel nicht");
    npc.base.autonpcfunctions.AddAdditionalText("Ich bin kein Händler, sondern ein Mitglied der Palastwache");
    npc.base.autonpcfunctions.AddTraderTrigger("tell something","I have no time to tell you a story. I'm on duty");
    npc.base.autonpcfunctions.AddAdditionalText("I do not know any stories I could tell you");
    npc.base.autonpcfunctions.AddAdditionalText("I'm a guard not a storyteller!");
    npc.base.autonpcfunctions.AddTraderTrigger("erzähl was","Ich habe keine Zeit euch eine Geschichte zu erzählen. Ich bin im Dienst");
    npc.base.autonpcfunctions.AddAdditionalTrigger("erzähl etwas");
    npc.base.autonpcfunctions.AddAdditionalText("Ich kenne keine Geschichten die ich euch erzählen könnte");
    npc.base.autonpcfunctions.AddAdditionalText("Ich bin eine Wache, kein Geschichtenerzähler");
    -- quest
    npc.base.autonpcfunctions.AddTraderTrigger("quest","The shift of my comrate Litios is about to start and he's not here yet. Could you look for him? He's probably still in the dormitory");
    npc.base.autonpcfunctions.AddAdditionalTrigger("problem");
    npc.base.autonpcfunctions.AddAdditionalTrigger("yes");
    npc.base.autonpcfunctions.AddAdditionalTrigger("sure");
    npc.base.autonpcfunctions.AddCondition("qpg","=",0);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddTraderTrigger("quest","Die Schicht meines Kameraden Litios fängt bald an und er ist noch nicht hier. Könntest du nach ihm sehen? Er ist bestimmt noch in dem Schlafsaal");
    npc.base.autonpcfunctions.AddAdditionalTrigger("problem");
    npc.base.autonpcfunctions.AddAdditionalTrigger("ja");
    npc.base.autonpcfunctions.AddAdditionalTrigger("sicher");
    npc.base.autonpcfunctions.AddCondition("qpg","=",0);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddTraderTrigger("where is Litios","I don't know where he is. You should look in the dormitory, that's where I saw him last");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddTraderTrigger("wo ist Litios","Ich weiß nicht wo er ist. Ihr solltet in dem Schlafsaal nachschauen, dort habe ich ihn zuletzt gesehen");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddTraderTrigger("dormitory","You can find the dormitory ...");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddTraderTrigger("schlafsaal","Der Schlafsaal ist ...");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddTraderTrigger("Litios not comming","Oh no, that is horrible! Well, it is not your fault. Here is a small compensation for your effort");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Litios refuses");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Litios drunk");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",2);
    npc.base.autonpcfunctions.AddConsequence("money","+",200);
    npc.base.autonpcfunctions.AddConsequence("item",1,1,800,0);
    npc.base.autonpcfunctions.AddTraderTrigger("Litios kommt nicht","Oh nein, das ist schrecklich! Nun, ihr könnt nichts dafür. Hier ist eine kleine Entschädigung für eure Mühen");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Litios verweigert");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Litios betrunken");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",2);
    npc.base.autonpcfunctions.AddConsequence("money","+",200);
    npc.base.autonpcfunctions.AddConsequence("item",1,1,800,0);
    npc.base.autonpcfunctions.AddTraderTrigger("Litios","Yes, Litios was supposed to do his shift but unfortunate for me, he's not comming");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Litios","Ja, Litios sollte eigentlich seine Schicht machen, doch zu meinem leidwesen, kommt er nicht");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("problem","I thank you for your help with Litios, but I don't need anything else from you");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("problem","Ich danke euch für eure Hilfe mit Litios, aber ich brauche nun nichts mehr von euch");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    -- leader, factions and politics
    npc.base.autonpcfunctions.AddTraderTrigger("cadomyr","Cadomyr, my desert perl. I adore this city, it prospers under the leadership of her highness queen Rosaline and is the most honorable city around and the savest I would say. Our guards are well trained and equipped, her highness knows that she can trust us.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("cadomyr","Cadomry, meine Wüstenperle. I liebe diese Stadt, sie gedeiht unter der Herrschaft von ihrer Hoheit Königin Rosaline und ist die ehrbarste Stadt in der Nähe und die Sicherste, würde ich sagen. Unsere Wachen sind gut ausgebildet und ausgestattet, ihre Hoheit weiß das sie sich auf uns verlassen kann.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("runewick","Runewick? That's where all those mages come from, right? They are rather weak when it comes to a fair fight between men, but I heard that there are quiet some good cooks as well.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("runewick","Runewick? Da kommen diese ganzen Magier her, richtig? Die sind eher schwach, wenn es zu einem fairen Kampf zwischen Männern kommt, aber ich habe gehört, das es dort auch gute Köche geben soll.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("galmair","Well that's a bunch of bandits, villains and liars. If you want to lose your money, honor or live, just go there.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("galmair","Nun, das ist eine Ansammlung von Banditen, Räubern und Lügnern. Wenn du dein Geld, eine Ehre oder dein Leben verlieren willst, dann musst du nur dorthin gehen.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("queen","Queen Rosaline is a lady and she cares good for those who are loyal. So better don't get on her bad side or you'll have to leave this fine town sooner or later.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("rosaline edwards");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("königin","Königin Rosaline ist eine Dame und sie kümmert sich gut um jene, die ihr Treu sind. Also kommt besser nicht auf ihre schlechte Seite, oder ihr werdet diese schöne Stadt früher oder später verlassen müssen.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("rosaline edwards");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("archmage","Archmage Morgan is the leader of Runewick. Not much to say about him, not sure if he's still alive even.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Elvaine Morgan");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("erzmagier","Erzmagier Morgan ist der Anführer von Runewick. Es gibt nicht viel über ihn zu sagen, ich weiß nichtmal ob er noch lebt.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Elvaine Morgan");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("Valerio Guilianni","Guilianni is the worst bandit there is. He lies and tricks until he got all the money from you, and he's the best in it and thus he is the leader of Galmair.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Valerio Guilianni","Guilianni ist der schlimmste Bandit den es gibt. Er lügt undbetrügt bis er euer ganzes Geld besitzt und der ist der beste darin, deswegen ist er auch der Anführer von Galmair.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
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

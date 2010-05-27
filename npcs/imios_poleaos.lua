-- INSERT INTO npc VALUES (nextval('npc_seq'),0,123,549,0,4,false,'Imios Poleaos','npc_imios_poleaos.lua',0);

require("npcs.base.autonpcfunctions")
module("npcs.imios_poleaos")

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

    -- Palace Guard positioned infront of the gate of 'Cleos' palace
    QuestID = 101;
    npcs.base.autonpcfunctions.AddCycleText("#me schaut sich wachsam und ungeduldig um","#me looks vigilanty and impatiently around");
    npcs.base.autonpcfunctions.AddCycleText("#me rückt seine Rüstung zurecht, auf welcher das Emblem der Stadtwache prangt","#me adjusts his armour on which the emblem of the palace guard can be seen");
    npcs.base.autonpcfunctions.AddCycleText("#me steht kerzengerade und wachsam vor dem Palasttor","#me stands bolt upright and watchful infront of the palace gate");
    npcs.base.autonpcfunctions.AddCycleText("#me hat seine Hand locker auf dem Schwertgriff liegen","#me 's hand lays lax on the sword handle");
    npcs.base.autonpcfunctions.AddCycleText("#me verlagert sein Gewicht etwas","#me shifts his position a little");
    npcs.base.autonpcfunctions.AddCycleText("#me schaut die Passanten misstrauisch an","#me watches the passersby suspiciously");
    -- Game help
    npcs.base.autonpcfunctions.AddTraderTrigger("help","[Game Help] This NPC is a palace guard, he might have a problem you can help him with. Keywords: quest, problem");
    npcs.base.autonpcfunctions.AddTraderTrigger("hilfe","[Spielhilfe] Dieser NPC ist eine Palastwache und hat vielleicht ein Problem. Schlüsselwörter: Quest, Problem");
    npcs.base.autonpcfunctions.AddTraderTrigger("restart","Quest restarted");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",0);
    -- Smalltalk
    npcs.base.autonpcfunctions.AddTraderTrigger("Hello","Be greeted stranger");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greetings");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Be greeted");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hail");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good day");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good morning");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good evening");
    npcs.base.autonpcfunctions.AddAdditionalText("Welcome to the palace of her majesty");
    npcs.base.autonpcfunctions.AddAdditionalText("Greetings, pleace behave yourself or I'll have to lock you up");
    npcs.base.autonpcfunctions.AddTraderTrigger("Grüße","Seid gegrüßt Fremder");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Gruß");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Seid gegrüßt");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Guten Tag");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Guten Abend");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Mahlzeit");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Tach");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Moin");
    npcs.base.autonpcfunctions.AddAdditionalText("Willkommen in dem Palast eurer Majestät");
    npcs.base.autonpcfunctions.AddAdditionalText("Grüße, bitte benehmt euch, oder ich muss euch einsperren");
    npcs.base.autonpcfunctions.AddTraderTrigger("Hiho","Be greeted stranger");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddAdditionalText("Welcome to the palace of her majesty");
    npcs.base.autonpcfunctions.AddAdditionalText("Greetings, pleace behave yourself or I'll have to lock you up");
    npcs.base.autonpcfunctions.AddTraderTrigger("Hiho","Seid gegrüßt Fremder");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddAdditionalText("Willkommen in dem Palast eurer Majestät");
    npcs.base.autonpcfunctions.AddAdditionalText("Grüße, bitte benehmt euch, oder ich muss euch einsperren");
    npcs.base.autonpcfunctions.AddTraderTrigger("Farewell","May Malachin guide your way!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good bye");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Bye");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Fare thy well");
    npcs.base.autonpcfunctions.AddAdditionalText("Malachin with you!");
    npcs.base.autonpcfunctions.AddAdditionalText("Farewell");
    npcs.base.autonpcfunctions.AddTraderTrigger("Tschüß","Möge Malachin euch auf euren Wegen beschützen!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Tschüss");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Wiedersehen");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Gehabt euch wohl");
    npcs.base.autonpcfunctions.AddAdditionalText("Malachin mit euch!");
    npcs.base.autonpcfunctions.AddAdditionalText("Auf bald");
    npcs.base.autonpcfunctions.AddTraderTrigger("Ciao","Indeed. Farewell");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddAdditionalText("Malachin with you!");
    npcs.base.autonpcfunctions.AddAdditionalText("Farewell");
    npcs.base.autonpcfunctions.AddTraderTrigger("Ciao","Gewiss. Auf bald");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddAdditionalText("Malachin mit euch!");
    npcs.base.autonpcfunctions.AddAdditionalText("Auf bald");
    npcs.base.autonpcfunctions.AddTraderTrigger("How are you","I could do better, am a little nervous");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("How feel");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("How do you do");
    npcs.base.autonpcfunctions.AddAdditionalText("Nervous");
    npcs.base.autonpcfunctions.AddAdditionalText("Fine I suppose but nervous");
    npcs.base.autonpcfunctions.AddTraderTrigger("Wie geht","Es könnte mir besser gehen, bin ein wenig nervös");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Wie fühlst");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Wie ist es ergangen");
    npcs.base.autonpcfunctions.AddAdditionalText("Nervös");
    npcs.base.autonpcfunctions.AddAdditionalText("Gut, nehme ich an, nur nervös");
    npcs.base.autonpcfunctions.AddTraderTrigger("your name","I'm Imios Poleaos");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("who are you");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("who art thou");
    npcs.base.autonpcfunctions.AddAdditionalText("Imios Poleaos at your service");
    npcs.base.autonpcfunctions.AddAdditionalText("Palace guard Imios Poleaos");
    npcs.base.autonpcfunctions.AddTraderTrigger("dein name","Ich bin Imios Poleaos");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wer bist du");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wer seid ihr");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wie heißt");
    npcs.base.autonpcfunctions.AddAdditionalText("Imios Poleaos zu diensten");
    npcs.base.autonpcfunctions.AddAdditionalText("Palastwache Imios Poleaos");
    npcs.base.autonpcfunctions.AddTraderTrigger("why nervous","I have a small problem, maybe you could help me with that?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("nervous");
    npcs.base.autonpcfunctions.AddTraderTrigger("wieso nervös","Ich habe ein kleines Problem, vielleicht könnt ihr mir damit helfen?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("warum nervös");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("nervös");
    -- Typical NPC phraces
    npcs.base.autonpcfunctions.AddTraderTrigger("what sell","I do not sell or buy anything");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("what buy");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("list wares");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("price of");
    npcs.base.autonpcfunctions.AddAdditionalText("I'm not a merchant but a  member of the palace guard");
    npcs.base.autonpcfunctions.AddAdditionalText("I do not trade");
    npcs.base.autonpcfunctions.AddTraderTrigger("was verkauf","I kaufe und verkaufe nichts");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("was kauf");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("warenliste");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("preis von");
    npcs.base.autonpcfunctions.AddAdditionalText("Ich handel nicht");
    npcs.base.autonpcfunctions.AddAdditionalText("Ich bin kein Händler, sondern ein Mitglied der Palastwache");
    npcs.base.autonpcfunctions.AddTraderTrigger("tell something","I have no time to tell you a story. I'm on duty");
    npcs.base.autonpcfunctions.AddAdditionalText("I do not know any stories I could tell you");
    npcs.base.autonpcfunctions.AddAdditionalText("I'm a guard not a storyteller!");
    npcs.base.autonpcfunctions.AddTraderTrigger("erzähl was","Ich habe keine Zeit euch eine Geschichte zu erzählen. Ich bin im Dienst");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("erzähl etwas");
    npcs.base.autonpcfunctions.AddAdditionalText("Ich kenne keine Geschichten die ich euch erzählen könnte");
    npcs.base.autonpcfunctions.AddAdditionalText("Ich bin eine Wache, kein Geschichtenerzähler");
    -- quest
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","The shift of my comrate Litios is about to start and he's not here yet. Could you look for him? He's probably still in the dormitory");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("problem");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("yes");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("sure");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",0);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Die Schicht meines Kameraden Litios fängt bald an und er ist noch nicht hier. Könntest du nach ihm sehen? Er ist bestimmt noch in dem Schlafsaal");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("problem");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("ja");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("sicher");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",0);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("where is Litios","I don't know where he is. You should look in the dormitory, that's where I saw him last");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("wo ist Litios","Ich weiß nicht wo er ist. Ihr solltet in dem Schlafsaal nachschauen, dort habe ich ihn zuletzt gesehen");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("dormitory","You can find the dormitory ...");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("schlafsaal","Der Schlafsaal ist ...");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("Litios not comming","Oh no, that is horrible! Well, it is not your fault. Here is a small compensation for your effort");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Litios refuses");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Litios drunk");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",2);
    npcs.base.autonpcfunctions.AddConsequence("money","+",200);
    npcs.base.autonpcfunctions.AddConsequence("item",1,1,800,0);
    npcs.base.autonpcfunctions.AddTraderTrigger("Litios kommt nicht","Oh nein, das ist schrecklich! Nun, ihr könnt nichts dafür. Hier ist eine kleine Entschädigung für eure Mühen");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Litios verweigert");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Litios betrunken");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",2);
    npcs.base.autonpcfunctions.AddConsequence("money","+",200);
    npcs.base.autonpcfunctions.AddConsequence("item",1,1,800,0);
    npcs.base.autonpcfunctions.AddTraderTrigger("Litios","Yes, Litios was supposed to do his shift but unfortunate for me, he's not comming");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Litios","Ja, Litios sollte eigentlich seine Schicht machen, doch zu meinem leidwesen, kommt er nicht");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("problem","I thank you for your help with Litios, but I don't need anything else from you");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("problem","Ich danke euch für eure Hilfe mit Litios, aber ich brauche nun nichts mehr von euch");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    -- leader, factions and politics
    npcs.base.autonpcfunctions.AddTraderTrigger("cadomyr","Cadomyr, my desert perl. I adore this city, it prospers under the leadership of her highness queen Rosaline and is the most honorable city around and the savest I would say. Our guards are well trained and equipped, her highness knows that she can trust us.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("cadomyr","Cadomry, meine Wüstenperle. I liebe diese Stadt, sie gedeiht unter der Herrschaft von ihrer Hoheit Königin Rosaline und ist die ehrbarste Stadt in der Nähe und die Sicherste, würde ich sagen. Unsere Wachen sind gut ausgebildet und ausgestattet, ihre Hoheit weiß das sie sich auf uns verlassen kann.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("runewick","Runewick? That's where all those mages come from, right? They are rather weak when it comes to a fair fight between men, but I heard that there are quiet some good cooks as well.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("runewick","Runewick? Da kommen diese ganzen Magier her, richtig? Die sind eher schwach, wenn es zu einem fairen Kampf zwischen Männern kommt, aber ich habe gehört, das es dort auch gute Köche geben soll.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("galmair","Well that's a bunch of bandits, villains and liars. If you want to lose your money, honor or live, just go there.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("galmair","Nun, das ist eine Ansammlung von Banditen, Räubern und Lügnern. Wenn du dein Geld, eine Ehre oder dein Leben verlieren willst, dann musst du nur dorthin gehen.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("queen","Queen Rosaline is a lady and she cares good for those who are loyal. So better don't get on her bad side or you'll have to leave this fine town sooner or later.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("rosaline edwards");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("königin","Königin Rosaline ist eine Dame und sie kümmert sich gut um jene, die ihr Treu sind. Also kommt besser nicht auf ihre schlechte Seite, oder ihr werdet diese schöne Stadt früher oder später verlassen müssen.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("rosaline edwards");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("archmage","Archmage Morgan is the leader of Runewick. Not much to say about him, not sure if he's still alive even.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Elvaine Morgan");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("erzmagier","Erzmagier Morgan ist der Anführer von Runewick. Es gibt nicht viel über ihn zu sagen, ich weiß nichtmal ob er noch lebt.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Elvaine Morgan");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("Valerio Guilianni","Guilianni is the worst bandit there is. He lies and tricks until he got all the money from you, and he's the best in it and thus he is the leader of Galmair.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Valerio Guilianni","Guilianni ist der schlimmste Bandit den es gibt. Er lügt undbetrügt bis er euer ganzes Geld besitzt und der ist der beste darin, deswegen ist er auch der Anführer von Galmair.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
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

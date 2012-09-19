-- INSERT INTO npc VALUES (nextval('npc_seq'),0,108,585,0,0,false,'Litios','npc_litios.lua',0);

require("npc.base.autonpcfunctions")
module("npc.litios", package.seeall)

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

    -- Litios in the tavern. He's having a drink instead of being on guard, the player gets the quest to search him.
    QuestID = 102;
    npc.base.autonpcfunctions.AddCycleText("#me hebt den Blick, um missmutig durch den Raum zu schauen, ehe er leise Verwünschungen murmelt","#me looks up letting his gaze travel through the room before he says some quiet curses");
    npc.base.autonpcfunctions.AddCycleText("#me sieht gedankenverloren auf den Teich hinaus und spielt abwesend mit seinem Krug","#me 's thoughtful gaze rests on the pond while he himself absently toys with his mug");
    npc.base.autonpcfunctions.AddCycleText("#me streckt eine Hand in die Lüfte und ruft fordernd Richtung Wirt 'Noch eins!'","#me raises a hand shouting demandingly towards the bar 'One more!'");
    npc.base.autonpcfunctions.AddCycleText("#me brummelt vor sich hin 'So kann es nicht weiter gehen..'","#me grumbles quietly to himself 'It can't go on like this..'");
    npc.base.autonpcfunctions.AddCycleText("#me lehnt sich zurück und streift sich unbehaglichen Blickes über seine Uniform, die das Emblem der Palastwache ziert","#me brushes over his uniform in an uncomfortable manner. It bears the palace-guard's emblem.");
    npc.base.autonpcfunctions.AddCycleText("#me murmelt verstimmt im Halbschlaf 'Ja Ja..Litios..hab gesagt..komme rechtzeitig..Wache schieben..'","#me mumbles being half asleep 'Yes Yes..Litios...told you..I'd come just in time..on guard..'");
    -- Game help
    npc.base.autonpcfunctions.AddTraderTrigger("help","[Game Help] The man wears the uniform of the palace-guard but he does not seem very talkative. Maybe you can find out more about him when talking to the other guards.");
    npc.base.autonpcfunctions.AddTraderTrigger("hilfe","[Spielhilfe] Der Mann trägt die Uniform der Palastwache, wirkt aber nicht sehr gesprächig. Vielleicht kannst du mehr über ihn herausfinden, wenn du mit den anderen Wachen sprichst.");
    npc.base.autonpcfunctions.AddTraderTrigger("restart","Quest restarted");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",0);

    -- Smalltalk
    npc.base.autonpcfunctions.AddTraderTrigger("Hello","Hello..and bye.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greetings");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Be greeted");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hail");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good day");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good morning");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good evening");
    npc.base.autonpcfunctions.AddAdditionalText("Yes, yes..hello and stuff..");
    npc.base.autonpcfunctions.AddAdditionalText("Just leave me be, alright?");
    npc.base.autonpcfunctions.AddTraderTrigger("Grüße","Hallo...und tschüss.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Gruß");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Seid gegrüßt");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Guten Tag");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Guten Abend");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Mahlzeit");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Tach");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Moin");
    npc.base.autonpcfunctions.AddAdditionalText("Ja, ja..hallo und sowas..");
    npc.base.autonpcfunctions.AddAdditionalText("Lasst mich einfach, verstanden?");
    npc.base.autonpcfunctions.AddTraderTrigger("Hiho","Hello..now go get yourself a drink and be quiet.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("Don't you see I am thinking..don't interrupt me.");
    npc.base.autonpcfunctions.AddAdditionalText("Got my cool beer..oh..hang on..you're not the waiter..get lost!");
    npc.base.autonpcfunctions.AddTraderTrigger("Hiho","Hallo..nun geht und besorgt euch was zu trinken aber seid ruhig.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddAdditionalText("Seht ihr nicht, dass ich hier denke..unterbrecht mich nicht.");
    npc.base.autonpcfunctions.AddAdditionalText("Habt ihr mein kühles Bier..oh..wartet..ihr seid nicht die Bedienung..verschwindet!");
    npc.base.autonpcfunctions.AddTraderTrigger("Farewell","Bye!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good bye");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Bye");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Fare thy well");
    npc.base.autonpcfunctions.AddAdditionalText("Finally..");
    npc.base.autonpcfunctions.AddAdditionalText("Thanks..I was about to get annoyed.");
    npc.base.autonpcfunctions.AddTraderTrigger("Tschüß","Auf Nimmerwiedersehen.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Tschüss");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Wiedersehen");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Gehabt euch wohl");
    npc.base.autonpcfunctions.AddAdditionalText("Endlich..");
    npc.base.autonpcfunctions.AddAdditionalText("Danke..ihr hattet angefangen zu nerven.");
    npc.base.autonpcfunctions.AddTraderTrigger("Ciao","#me looks at the pond again not greeting back");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Ciao","#me sieht grußlos wieder auf den Teich");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("How are you","Miserable..but why would you care, leave me alone.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("How feel");
    npc.base.autonpcfunctions.AddAdditionalTrigger("How do you do");
    npc.base.autonpcfunctions.AddAdditionalText("");
    npc.base.autonpcfunctions.AddAdditionalText("Right now? Worse..");
    npc.base.autonpcfunctions.AddTraderTrigger("Wie geht","Schlecht..aber was interessiert euch das, lasst mich alleine.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Wie fühlst");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Wie ist es ergangen");
    npc.base.autonpcfunctions.AddAdditionalText("Mir geht es gut..so gut wie es einem Krieger gehen kann, der den ganzen Tag Wache stehen muss!");
    npc.base.autonpcfunctions.AddAdditionalText("Genau jetzt? Schlechter..");
    npc.base.autonpcfunctions.AddTraderTrigger("your name","Why do you ask?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("who are you");
    npc.base.autonpcfunctions.AddAdditionalTrigger("who art thou");
    npc.base.autonpcfunctions.AddAdditionalText("In what way could my name be any of your business?");
    npc.base.autonpcfunctions.AddAdditionalText("Why should I introduce to you?");
    npc.base.autonpcfunctions.AddTraderTrigger("dein name","Warum fragt ihr?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("wer bist du");
    npc.base.autonpcfunctions.AddAdditionalTrigger("wer seid ihr");
    npc.base.autonpcfunctions.AddAdditionalTrigger("wie heißt");
    npc.base.autonpcfunctions.AddAdditionalText("Auf welche Art und Weise sollte euch mein Name irgendwas angehen?");
    npc.base.autonpcfunctions.AddAdditionalText("Warum sollte ich mich euch vorstellen?");
    -- Typical NPC phraces
    npc.base.autonpcfunctions.AddTraderTrigger("what sell","I sell a book with the title '..how to get out of this tavern to avoid being an annoyance.'..");
    npc.base.autonpcfunctions.AddAdditionalTrigger("what buy");
    npc.base.autonpcfunctions.AddAdditionalTrigger("list wares");
    npc.base.autonpcfunctions.AddAdditionalTrigger("price of");
    npc.base.autonpcfunctions.AddAdditionalText("I could sell you this flag saying 'Stop botherin me'..");
    npc.base.autonpcfunctions.AddAdditionalText("I don't sell anything but I got one free advice 'Enjoy your drink and be quiet.'");
    npc.base.autonpcfunctions.AddTraderTrigger("was verkauf","Ich verkaufe ein Buch mit dem Titel '..wie man aus dieser Taverne kommt, um zu verhindern, dass man jemandem auf die Nerven geht.'");
    npc.base.autonpcfunctions.AddAdditionalTrigger("was kauf");
    npc.base.autonpcfunctions.AddAdditionalTrigger("warenliste");
    npc.base.autonpcfunctions.AddAdditionalTrigger("preis von");
    npc.base.autonpcfunctions.AddAdditionalText("Ich könnte euch diese Fahne verkaufen, mit der Aufschrift 'Hört auf mich zu nerven..'");
    npc.base.autonpcfunctions.AddAdditionalText("Ich verkaufe nichts, habe aber einen kostenlosen Ratschlag 'Genießt euer Getränk und seid ruhig.'");
    npc.base.autonpcfunctions.AddTraderTrigger("tell something","There is not much too tell..besides..I hate my job, I hate this town and I kind of dislike company..got me?");
    npc.base.autonpcfunctions.AddAdditionalText("There once was one unlucky palace-guard trying to get some rest when somebody came along to annoy him..");
    npc.base.autonpcfunctions.AddAdditionalText("Did you hear of this person who will stop talking to me after I finished this sentence..?");
    npc.base.autonpcfunctions.AddTraderTrigger("erzähl was","Da gibt es nicht viel zu erzählen, außer..dass ich meine Arbeit hasse, diese Stadt hasse..und beginne, Gesellschaft abzulehnen..versteht ihr?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("erzähl etwas");
    npc.base.autonpcfunctions.AddAdditionalText("Es war einst eine unglückliche Palastwache, die versuchte, etwas Ruhe zu bekommen..als jemand ankam, um ihn zu nerven.");
    npc.base.autonpcfunctions.AddAdditionalText("Habt ihr von dieser Person gehört, die aufhören wird, mit mir zu reden, nachdem ich diesen Satz beendet habe..?");
    -- Quest
    npc.base.autonpcfunctions.AddTraderTrigger("Litios","Huh..? Yes..I am Litios..why? Did Imios send you?");
    npc.base.autonpcfunctions.AddCondition("qpg","=",0);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddTraderTrigger("Litios","Hä..? Ja..ich bin Litios..wieso? Hat Imios euch geschickt?");
    npc.base.autonpcfunctions.AddCondition("qpg","=",0);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddTraderTrigger("yes","Oh..darn. Tell him..I am sick..no wait..I am never sick, he knows that..oh well..just tell him I am drunk..he will buy that. Understood?");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger("ja","Oh..verdammt. Sagt ihm..ich sei krank..nein wartet..ich bin nie krank, er weiß das..ach egal..sagt ihm einfach, ich sei betrunken..das wird er euch abkaufen. Habt ihr verstanden?");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger("yes","Good..thank you. I would reward you..honestly..but I..ran out of coins, yes. I can give you an advice though..if you didn't do it yet, go talk to Zssarkes, he is a skilled warrior and might show you some tricks if you are into fighting.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("combat");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",3);
    npc.base.autonpcfunctions.AddTraderTrigger("ja","Gut..danke euch. Ich würde euch belohnen..ehrlich..aber mir..sind die Münzen ausgegangen, genau. Ich kann euch aber einen Rat geben..falls ihr es noch nicht getan habt, geht und sprecht mit Zssarkes, er ist ein geübter Krieger, der euch einige Kniffe zeigen könnte, wenn ihr euch im Kampf übt.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",3);
    -- leaders, town and politics
    npc.base.autonpcfunctions.AddTraderTrigger("cadomyr","Cadomyr is my home but sometimes I think about just leaving. I think Galmair isn't as bad as most think.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("cadomyr","Cadomyr is mein Zuhause aber manchmal denke ich daran einfach zu gehen. Ich denke Galmair ist nicht so schlecht wie viele denken.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("runewick","Runewick sounds like the most boring place around. They are either reading books, swing their staffs or cook.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("runewick","Runewick hört sich nach dem langweiligstens Platz an. Die lesen entweder Bücher, schwingen ihr Stäbe oder kochen.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("galmair","Galmair.. I don't think that the rumours are right. I think there is a lot more to it than bandits and villians and such.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("galmair","Galmair.. Ich glaube nicht das Gerüchte stimmen. Ich glaube da ist noch mehr als nur Banditen und Räuber und so.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("queen","Queen Rosaline.. I don't know what to say. She's our queen, she's good to us and I'm her guard. What do you expect?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("rosaline edwards");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("königin","Königin Rosaline.. Ich weiß nicht was ich sagen soll. Sie ist unsere Königin, sie ist gut zu uns und ich bin ihre Wache. Was erwartest du?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("rosaline edwards");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("archmage","Archmage Morgan is old, boring, fat and... boring! Reading is all he ever does I think, I still don't know how he is able to lead a town.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Elvaine Morgan");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("erzmagier","Erzmagier Morgan ist alt, langweilig, fett und... langweilig! Ich glaube er macht nie etwas anderes als lesen, Ich weiß nicht wie er fähig sein soll, eine Stadt zu führen.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Elvaine Morgan");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("Valerio Guilianni","Well Valerio. Most will tell you that he is a bandit and liar. I think he is just really good with people and money.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Valerio Guilianni","Nun Valerio. Die meisten werden euch sagen das er ein Räuber und Lügner ist. Ich glaube er kann einfach gut mit Leuten und Geld umgehen.");
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

-- INSERT INTO npc VALUES (nextval('npc_seq'),0,108,585,0,0,false,'Litios','npc_litios.lua',0);

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

    -- Litios in the tavern. He's having a drink instead of being on guard, the player gets the quest to search him.
    QuestID = 102;
    AddCycleText("#me hebt den Blick, um missmutig durch den Raum zu schauen, ehe er leise Verwünschungen murmelt","#me looks up letting his gaze travel through the room before he says some quiet curses");
    AddCycleText("#me sieht gedankenverloren auf den Teich hinaus und spielt abwesend mit seinem Krug","#me 's thoughtful gaze rests on the pond while he himself absently toys with his mug");
    AddCycleText("#me streckt eine Hand in die Lüfte und ruft fordernd Richtung Wirt 'Noch eins!'","#me raises a hand shouting demandingly towards the bar 'One more!'");
    AddCycleText("#me brummelt vor sich hin 'So kann es nicht weiter gehen..'","#me grumbles quietly to himself 'It can't go on like this..'");
    AddCycleText("#me lehnt sich zurück und streift sich unbehaglichen Blickes über seine Uniform, die das Emblem der Palastwache ziert","#me brushes over his uniform in an uncomfortable manner. It bears the palace-guard's emblem.");
    AddCycleText("#me murmelt verstimmt im Halbschlaf 'Ja Ja..Litios..hab gesagt..komme rechtzeitig..Wache schieben..'","#me mumbles being half asleep 'Yes Yes..Litios...told you..I'd come just in time..on guard..'");
    -- Game help
    AddTraderTrigger("help","[Game Help] The man wears the uniform of the palace-guard but he does not seem very talkative. Maybe you can find out more about him when talking to the other guards.");
    AddTraderTrigger("hilfe","[Spielhilfe] Der Mann trägt die Uniform der Palastwache, wirkt aber nicht sehr gesprächig. Vielleicht kannst du mehr über ihn herausfinden, wenn du mit den anderen Wachen sprichst.");
    AddTraderTrigger("restart","Quest restarted");
    AddConsequence("qpg","=",0);

    -- Smalltalk
    AddTraderTrigger("Hello","Hello..and bye.");
    AddAdditionalTrigger("Greetings");
    AddAdditionalTrigger("Be greeted");
    AddAdditionalTrigger("Hail");
    AddAdditionalTrigger("Good day");
    AddAdditionalTrigger("Good morning");
    AddAdditionalTrigger("Good evening");
    AddAdditionalText("Yes, yes..hello and stuff..");
    AddAdditionalText("Just leave me be, alright?");
    AddTraderTrigger("Grüße","Hallo...und tschüss.");
    AddAdditionalTrigger("Gruß");
    AddAdditionalTrigger("Seid gegrüßt");
    AddAdditionalTrigger("Guten Tag");
    AddAdditionalTrigger("Guten Abend");
    AddAdditionalTrigger("Mahlzeit");
    AddAdditionalTrigger("Tach");
    AddAdditionalTrigger("Moin");
    AddAdditionalText("Ja, ja..hallo und sowas..");
    AddAdditionalText("Lasst mich einfach, verstanden?");
    AddTraderTrigger("Hiho","Hello..now go get yourself a drink and be quiet.");
    AddAdditionalTrigger("Hallo");
    AddAdditionalTrigger("Hey");
    AddAdditionalTrigger("Greebas");
    AddAdditionalTrigger("Greebs");
    AddCondition("lang","english");
    AddAdditionalText("Don't you see I am thinking..don't interrupt me.");
    AddAdditionalText("Got my cool beer..oh..hang on..you're not the waiter..get lost!");
    AddTraderTrigger("Hiho","Hallo..nun geht und besorgt euch was zu trinken aber seid ruhig.");
    AddAdditionalTrigger("Hallo");
    AddAdditionalTrigger("Hey");
    AddAdditionalTrigger("Greebas");
    AddAdditionalTrigger("Greebs");
    AddCondition("lang","german");
    AddAdditionalText("Seht ihr nicht, dass ich hier denke..unterbrecht mich nicht.");
    AddAdditionalText("Habt ihr mein kühles Bier..oh..wartet..ihr seid nicht die Bedienung..verschwindet!");
    AddTraderTrigger("Farewell","Bye!");
    AddAdditionalTrigger("Good bye");
    AddAdditionalTrigger("Bye");
    AddAdditionalTrigger("Fare thy well");
    AddAdditionalText("Finally..");
    AddAdditionalText("Thanks..I was about to get annoyed.");
    AddTraderTrigger("Tschüß","Auf Nimmerwiedersehen.");
    AddAdditionalTrigger("Tschüss");
    AddAdditionalTrigger("Wiedersehen");
    AddAdditionalTrigger("Gehabt euch wohl");
    AddAdditionalText("Endlich..");
    AddAdditionalText("Danke..ihr hattet angefangen zu nerven.");
    AddTraderTrigger("Ciao","#me looks at the pond again not greeting back");
    AddAdditionalTrigger("Adieu");
    AddAdditionalTrigger("Au revoir");
    AddCondition("lang","english");
    AddTraderTrigger("Ciao","#me sieht grußlos wieder auf den Teich");
    AddAdditionalTrigger("Adieu");
    AddAdditionalTrigger("Au revoir");
    AddCondition("lang","german");
    AddTraderTrigger("How are you","Miserable..but why would you care, leave me alone.");
    AddAdditionalTrigger("How feel");
    AddAdditionalTrigger("How do you do");
    AddAdditionalText("");
    AddAdditionalText("Right now? Worse..");
    AddTraderTrigger("Wie geht","Schlecht..aber was interessiert euch das, lasst mich alleine.");
    AddAdditionalTrigger("Wie fühlst");
    AddAdditionalTrigger("Wie ist es ergangen");
    AddAdditionalText("Mir geht es gut..so gut wie es einem Krieger gehen kann, der den ganzen Tag Wache stehen muss!");
    AddAdditionalText("Genau jetzt? Schlechter..");
    AddTraderTrigger("your name","Why do you ask?");
    AddAdditionalTrigger("who are you");
    AddAdditionalTrigger("who art thou");
    AddAdditionalText("In what way could my name be any of your business?");
    AddAdditionalText("Why should I introduce to you?");
    AddTraderTrigger("dein name","Warum fragt ihr?");
    AddAdditionalTrigger("wer bist du");
    AddAdditionalTrigger("wer seid ihr");
    AddAdditionalTrigger("wie heißt");
    AddAdditionalText("Auf welche Art und Weise sollte euch mein Name irgendwas angehen?");
    AddAdditionalText("Warum sollte ich mich euch vorstellen?");
    -- Typical NPC phraces
    AddTraderTrigger("what sell","I sell a book with the title '..how to get out of this tavern to avoid being an annoyance.'..");
    AddAdditionalTrigger("what buy");
    AddAdditionalTrigger("list wares");
    AddAdditionalTrigger("price of");
    AddAdditionalText("I could sell you this flag saying 'Stop botherin me'..");
    AddAdditionalText("I don't sell anything but I got one free advice 'Enjoy your drink and be quiet.'");
    AddTraderTrigger("was verkauf","Ich verkaufe ein Buch mit dem Titel '..wie man aus dieser Taverne kommt, um zu verhindern, dass man jemandem auf die Nerven geht.'");
    AddAdditionalTrigger("was kauf");
    AddAdditionalTrigger("warenliste");
    AddAdditionalTrigger("preis von");
    AddAdditionalText("Ich könnte euch diese Fahne verkaufen, mit der Aufschrift 'Hört auf mich zu nerven..'");
    AddAdditionalText("Ich verkaufe nichts, habe aber einen kostenlosen Ratschlag 'Genießt euer Getränk und seid ruhig.'");
    AddTraderTrigger("tell something","There is not much too tell..besides..I hate my job, I hate this town and I kind of dislike company..got me?");
    AddAdditionalText("There once was one unlucky palace-guard trying to get some rest when somebody came along to annoy him..");
    AddAdditionalText("Did you hear of this person who will stop talking to me after I finished this sentence..?");
    AddTraderTrigger("erzähl was","Da gibt es nicht viel zu erzählen, außer..dass ich meine Arbeit hasse, diese Stadt hasse..und beginne, Gesellschaft abzulehnen..versteht ihr?");
    AddAdditionalTrigger("erzähl etwas");
    AddAdditionalText("Es war einst eine unglückliche Palastwache, die versuchte, etwas Ruhe zu bekommen..als jemand ankam, um ihn zu nerven.");
    AddAdditionalText("Habt ihr von dieser Person gehört, die aufhören wird, mit mir zu reden, nachdem ich diesen Satz beendet habe..?");
    -- Quest
    AddTraderTrigger("Litios","Huh..? Yes..I am Litios..why? Did Imios send you?");
    AddCondition("qpg","=",0);
    AddCondition("lang","english");
    AddConsequence("qpg","=",1);
    AddTraderTrigger("Litios","Hä..? Ja..ich bin Litios..wieso? Hat Imios euch geschickt?");
    AddCondition("qpg","=",0);
    AddCondition("lang","german");
    AddConsequence("qpg","=",1);
    AddTraderTrigger("yes","Oh..darn. Tell him..I am sick..no wait..I am never sick, he knows that..oh well..just tell him I am drunk..he will buy that. Understood?");
    AddCondition("qpg","=",1);
    AddCondition("lang","english");
    AddConsequence("qpg","=",2);
    AddTraderTrigger("ja","Oh..verdammt. Sagt ihm..ich sei krank..nein wartet..ich bin nie krank, er weiß das..ach egal..sagt ihm einfach, ich sei betrunken..das wird er euch abkaufen. Habt ihr verstanden?");
    AddCondition("qpg","=",1);
    AddCondition("lang","german");
    AddConsequence("qpg","=",2);
    AddTraderTrigger("yes","Good..thank you. I would reward you..honestly..but I..ran out of coins, yes. I can give you an advice though..if you didn't do it yet, go talk to Zssarkes, he is a skilled warrior and might show you some tricks if you are into fighting.");
    AddAdditionalTrigger("combat");
    AddCondition("qpg","=",2);
    AddConsequence("qpg","=",3);
    AddTraderTrigger("ja","Gut..danke euch. Ich würde euch belohnen..ehrlich..aber mir..sind die Münzen ausgegangen, genau. Ich kann euch aber einen Rat geben..falls ihr es noch nicht getan habt, geht und sprecht mit Zssarkes, er ist ein geübter Krieger, der euch einige Kniffe zeigen könnte, wenn ihr euch im Kampf übt.");
    AddCondition("qpg","=",2);
    AddConsequence("qpg","=",3);
    -- leaders, town and politics
    AddTraderTrigger("cadomyr","Cadomyr is my home but sometimes I think about just leaving. I think Galmair isn't as bad as most think.");
    AddCondition("lang","english");
    AddTraderTrigger("cadomyr","Cadomyr is mein Zuhause aber manchmal denke ich daran einfach zu gehen. Ich denke Galmair ist nicht so schlecht wie viele denken.");
    AddCondition("lang","german");
    AddTraderTrigger("runewick","Runewick sounds like the most boring place around. They are either reading books, swing their staffs or cook.");
    AddCondition("lang","english");
    AddTraderTrigger("runewick","Runewick hört sich nach dem langweiligstens Platz an. Die lesen entweder Bücher, schwingen ihr Stäbe oder kochen.");
    AddCondition("lang","german");
    AddTraderTrigger("galmair","Galmair.. I don't think that the rumours are right. I think there is a lot more to it than bandits and villians and such.");
    AddCondition("lang","english");
    AddTraderTrigger("galmair","Galmair.. Ich glaube nicht das Gerüchte stimmen. Ich glaube da ist noch mehr als nur Banditen und Räuber und so.");
    AddCondition("lang","german");
    AddTraderTrigger("queen","Queen Rosaline.. I don't know what to say. She's our queen, she's good to us and I'm her guard. What do you expect?");
    AddAdditionalTrigger("rosaline edwards");
    AddCondition("lang","english");
    AddTraderTrigger("königin","Königin Rosaline.. Ich weiß nicht was ich sagen soll. Sie ist unsere Königin, sie ist gut zu uns und ich bin ihre Wache. Was erwartest du?");
    AddAdditionalTrigger("rosaline edwards");
    AddCondition("lang","german");
    AddTraderTrigger("archmage","Archmage Morgan is old, boring, fat and... boring! Reading is all he ever does I think, I still don't know how he is able to lead a town.");
    AddAdditionalTrigger("Elvaine Morgan");
    AddCondition("lang","english");
    AddTraderTrigger("erzmagier","Erzmagier Morgan ist alt, langweilig, fett und... langweilig! Ich glaube er macht nie etwas anderes als lesen, Ich weiß nicht wie er fähig sein soll, eine Stadt zu führen.");
    AddAdditionalTrigger("Elvaine Morgan");
    AddCondition("lang","german");
    AddTraderTrigger("Valerio Guilianni","Well Valerio. Most will tell you that he is a bandit and liar. I think he is just really good with people and money.");
    AddCondition("lang","english");
    AddTraderTrigger("Valerio Guilianni","Nun Valerio. Die meisten werden euch sagen das er ein Räuber und Lügner ist. Ich glaube er kann einfach gut mit Leuten und Geld umgehen.");
    AddCondition("lang","german");
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

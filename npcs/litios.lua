-- INSERT INTO npc VALUES (nextval('npc_seq'),0,108,585,0,0,false,'Litios','npc_litios.lua',0);

require("npcs.base.autonpcfunctions")
module("npcs.lithios")

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

    -- Litios in the tavern. He's having a drink instead of being on guard, the player gets the quest to search him.
    QuestID = 102;
    npcs.base.autonpcfunctions.AddCycleText("#me hebt den Blick, um missmutig durch den Raum zu schauen, ehe er leise Verwünschungen murmelt","#me looks up letting his gaze travel through the room before he says some quiet curses");
    npcs.base.autonpcfunctions.AddCycleText("#me sieht gedankenverloren auf den Teich hinaus und spielt abwesend mit seinem Krug","#me 's thoughtful gaze rests on the pond while he himself absently toys with his mug");
    npcs.base.autonpcfunctions.AddCycleText("#me streckt eine Hand in die Lüfte und ruft fordernd Richtung Wirt 'Noch eins!'","#me raises a hand shouting demandingly towards the bar 'One more!'");
    npcs.base.autonpcfunctions.AddCycleText("#me brummelt vor sich hin 'So kann es nicht weiter gehen..'","#me grumbles quietly to himself 'It can't go on like this..'");
    npcs.base.autonpcfunctions.AddCycleText("#me lehnt sich zurück und streift sich unbehaglichen Blickes über seine Uniform, die das Emblem der Palastwache ziert","#me brushes over his uniform in an uncomfortable manner. It bears the palace-guard's emblem.");
    npcs.base.autonpcfunctions.AddCycleText("#me murmelt verstimmt im Halbschlaf 'Ja Ja..Litios..hab gesagt..komme rechtzeitig..Wache schieben..'","#me mumbles being half asleep 'Yes Yes..Litios...told you..I'd come just in time..on guard..'");
    -- Game help
    npcs.base.autonpcfunctions.AddTraderTrigger("help","[Game Help] The man wears the uniform of the palace-guard but he does not seem very talkative. Maybe you can find out more about him when talking to the other guards.");
    npcs.base.autonpcfunctions.AddTraderTrigger("hilfe","[Spielhilfe] Der Mann trägt die Uniform der Palastwache, wirkt aber nicht sehr gesprächig. Vielleicht kannst du mehr über ihn herausfinden, wenn du mit den anderen Wachen sprichst.");
    npcs.base.autonpcfunctions.AddTraderTrigger("restart","Quest restarted");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",0);

    -- Smalltalk
    npcs.base.autonpcfunctions.AddTraderTrigger("Hello","Hello..and bye.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greetings");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Be greeted");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hail");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good day");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good morning");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good evening");
    npcs.base.autonpcfunctions.AddAdditionalText("Yes, yes..hello and stuff..");
    npcs.base.autonpcfunctions.AddAdditionalText("Just leave me be, alright?");
    npcs.base.autonpcfunctions.AddTraderTrigger("Grüße","Hallo...und tschüss.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Gruß");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Seid gegrüßt");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Guten Tag");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Guten Abend");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Mahlzeit");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Tach");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Moin");
    npcs.base.autonpcfunctions.AddAdditionalText("Ja, ja..hallo und sowas..");
    npcs.base.autonpcfunctions.AddAdditionalText("Lasst mich einfach, verstanden?");
    npcs.base.autonpcfunctions.AddTraderTrigger("Hiho","Hello..now go get yourself a drink and be quiet.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddAdditionalText("Don't you see I am thinking..don't interrupt me.");
    npcs.base.autonpcfunctions.AddAdditionalText("Got my cool beer..oh..hang on..you're not the waiter..get lost!");
    npcs.base.autonpcfunctions.AddTraderTrigger("Hiho","Hallo..nun geht und besorgt euch was zu trinken aber seid ruhig.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddAdditionalText("Seht ihr nicht, dass ich hier denke..unterbrecht mich nicht.");
    npcs.base.autonpcfunctions.AddAdditionalText("Habt ihr mein kühles Bier..oh..wartet..ihr seid nicht die Bedienung..verschwindet!");
    npcs.base.autonpcfunctions.AddTraderTrigger("Farewell","Bye!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good bye");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Bye");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Fare thy well");
    npcs.base.autonpcfunctions.AddAdditionalText("Finally..");
    npcs.base.autonpcfunctions.AddAdditionalText("Thanks..I was about to get annoyed.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Tschüß","Auf Nimmerwiedersehen.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Tschüss");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Wiedersehen");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Gehabt euch wohl");
    npcs.base.autonpcfunctions.AddAdditionalText("Endlich..");
    npcs.base.autonpcfunctions.AddAdditionalText("Danke..ihr hattet angefangen zu nerven.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Ciao","#me looks at the pond again not greeting back");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Ciao","#me sieht grußlos wieder auf den Teich");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("How are you","Miserable..but why would you care, leave me alone.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("How feel");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("How do you do");
    npcs.base.autonpcfunctions.AddAdditionalText("");
    npcs.base.autonpcfunctions.AddAdditionalText("Right now? Worse..");
    npcs.base.autonpcfunctions.AddTraderTrigger("Wie geht","Schlecht..aber was interessiert euch das, lasst mich alleine.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Wie fühlst");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Wie ist es ergangen");
    npcs.base.autonpcfunctions.AddAdditionalText("Mir geht es gut..so gut wie es einem Krieger gehen kann, der den ganzen Tag Wache stehen muss!");
    npcs.base.autonpcfunctions.AddAdditionalText("Genau jetzt? Schlechter..");
    npcs.base.autonpcfunctions.AddTraderTrigger("your name","Why do you ask?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("who are you");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("who art thou");
    npcs.base.autonpcfunctions.AddAdditionalText("In what way could my name be any of your business?");
    npcs.base.autonpcfunctions.AddAdditionalText("Why should I introduce to you?");
    npcs.base.autonpcfunctions.AddTraderTrigger("dein name","Warum fragt ihr?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wer bist du");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wer seid ihr");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wie heißt");
    npcs.base.autonpcfunctions.AddAdditionalText("Auf welche Art und Weise sollte euch mein Name irgendwas angehen?");
    npcs.base.autonpcfunctions.AddAdditionalText("Warum sollte ich mich euch vorstellen?");
    -- Typical NPC phraces
    npcs.base.autonpcfunctions.AddTraderTrigger("what sell","I sell a book with the title '..how to get out of this tavern to avoid being an annoyance.'..");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("what buy");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("list wares");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("price of");
    npcs.base.autonpcfunctions.AddAdditionalText("I could sell you this flag saying 'Stop botherin me'..");
    npcs.base.autonpcfunctions.AddAdditionalText("I don't sell anything but I got one free advice 'Enjoy your drink and be quiet.'");
    npcs.base.autonpcfunctions.AddTraderTrigger("was verkauf","Ich verkaufe ein Buch mit dem Titel '..wie man aus dieser Taverne kommt, um zu verhindern, dass man jemandem auf die Nerven geht.'");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("was kauf");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("warenliste");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("preis von");
    npcs.base.autonpcfunctions.AddAdditionalText("Ich könnte euch diese Fahne verkaufen, mit der Aufschrift 'Hört auf mich zu nerven..'");
    npcs.base.autonpcfunctions.AddAdditionalText("Ich verkaufe nichts, habe aber einen kostenlosen Ratschlag 'Genießt euer Getränk und seid ruhig.'");
    npcs.base.autonpcfunctions.AddTraderTrigger("tell something","There is not much too tell..besides..I hate my job, I hate this town and I kind of dislike company..got me?");
    npcs.base.autonpcfunctions.AddAdditionalText("There once was one unlucky palace-guard trying to get some rest when somebody came along to annoy him..");
    npcs.base.autonpcfunctions.AddAdditionalText("Did you hear of this person who will stop talking to me after I finished this sentence..?");
    npcs.base.autonpcfunctions.AddTraderTrigger("erzähl was","Da gibt es nicht viel zu erzählen, außer..dass ich meine Arbeit hasse, diese Stadt hasse..und beginne, Gesellschaft abzulehnen..versteht ihr?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("erzähl etwas");
    npcs.base.autonpcfunctions.AddAdditionalText("Es war einst eine unglückliche Palastwache, die versuchte, etwas Ruhe zu bekommen..als jemand ankam, um ihn zu nerven.");
    npcs.base.autonpcfunctions.AddAdditionalText("Habt ihr von dieser Person gehört, die aufhören wird, mit mir zu reden, nachdem ich diesen Satz beendet habe..?");
    -- Quest
    npcs.base.autonpcfunctions.AddTraderTrigger("Litios","Huh..? Yes..I am Litios..why? Did Imios send you?");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",0);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("Litios","Hä..? Ja..ich bin Litios..wieso? Hat Imios euch geschickt?");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",0);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("yes","Oh..darn. Tell him..I am sick..no wait..I am never sick, he knows that..oh well..just tell him I am drunk..he will buy that. Understood?");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("ja","Oh..verdammt. Sagt ihm..ich sei krank..nein wartet..ich bin nie krank, er weiß das..ach egal..sagt ihm einfach, ich sei betrunken..das wird er euch abkaufen. Habt ihr verstanden?");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("yes","Good..thank you. I would reward you..honestly..but I..ran out of coins, yes. I can give you an advice though..if you didn't do it yet, go talk to Zssarkes, he is a skilled warrior and might show you some tricks if you are into fighting.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("combat");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",3);
    npcs.base.autonpcfunctions.AddTraderTrigger("ja","Gut..danke euch. Ich würde euch belohnen..ehrlich..aber mir..sind die Münzen ausgegangen, genau. Ich kann euch aber einen Rat geben..falls ihr es noch nicht getan habt, geht und sprecht mit Zssarkes, er ist ein geübter Krieger, der euch einige Kniffe zeigen könnte, wenn ihr euch im Kampf übt.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",3);
    -- leaders, town and politics
    npcs.base.autonpcfunctions.AddTraderTrigger("cadomyr","Cadomyr is my home but sometimes I think about just leaving. I think Galmair isn't as bad as most think.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("cadomyr","Cadomyr is mein Zuhause aber manchmal denke ich daran einfach zu gehen. Ich denke Galmair ist nicht so schlecht wie viele denken.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("runewick","Runewick sounds like the most boring place around. They are either reading books, swing their staffs or cook.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("runewick","Runewick hört sich nach dem langweiligstens Platz an. Die lesen entweder Bücher, schwingen ihr Stäbe oder kochen.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("galmair","Galmair.. I don't think that the rumours are right. I think there is a lot more to it than bandits and villians and such.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("galmair","Galmair.. Ich glaube nicht das Gerüchte stimmen. Ich glaube da ist noch mehr als nur Banditen und Räuber und so.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("queen","Queen Rosaline.. I don't know what to say. She's our queen, she's good to us and I'm her guard. What do you expect?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("rosaline edwards");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("königin","Königin Rosaline.. Ich weiß nicht was ich sagen soll. Sie ist unsere Königin, sie ist gut zu uns und ich bin ihre Wache. Was erwartest du?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("rosaline edwards");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("archmage","Archmage Morgan is old, boring, fat and... boring! Reading is all he ever does I think, I still don't know how he is able to lead a town.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Elvaine Morgan");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("erzmagier","Erzmagier Morgan ist alt, langweilig, fett und... langweilig! Ich glaube er macht nie etwas anderes als lesen, Ich weiß nicht wie er fähig sein soll, eine Stadt zu führen.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Elvaine Morgan");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("Valerio Guilianni","Well Valerio. Most will tell you that he is a bandit and liar. I think he is just really good with people and money.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Valerio Guilianni","Nun Valerio. Die meisten werden euch sagen das er ein Räuber und Lügner ist. Ich glaube er kann einfach gut mit Leuten und Geld umgehen.");
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

-- INSERT INTO npc VALUES (nextval('npc_seq'),0,113,599,0,4,false,'Jonathan Cyrus','npc_jonathan_cyrus.lua',0);

require("npcs.base.autonpcfunctions")
dofile("quest_mineth.lua"); --addition for the Tailor Quest

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

    QuestID = 0;
    -- NPC by Estralis Seborian
    -- This NPC is supposed to trade (all goods are sold and bought, percentage indicates ratio of price bough/sold):
    -- 5% Tools (Candle maker): 429
    -- 10% Tools (Glass blower): 311, 312
    -- 10% Glass products: 75, 164, 292, 315, 1317, 1908, 2055, 2457, 2498
    -- 10% Glass resources: 41, 314, 316, 726
    -- 5% Candles, torches: 43, 391
    -- 5% Wax: 431
    -- Help 
    AddTraderTrigger("Help","");
    AddConsequence("inform","[Game Help] This NPC is the glass goods trader Jonathan Cyrus. Keyphrases: Hello, glass.");
    AddTraderTrigger("Hilfe","");
    AddConsequence("inform","[Spielhilfe] Dieser NPC ist Glaswarenhändler Jonathan Cyrus. Schlüsselwörter: Hallo, Glas.");
    -- General speech
    AddTraderTrigger("Hello","Hail, by queen Rosaline! Do you need any glasses, just ask.");
    AddAdditionalTrigger("Greetings");
    AddAdditionalTrigger("Be greeted");
    AddAdditionalTrigger("Hail");
    AddAdditionalTrigger("Good day");
    AddAdditionalTrigger("Good morning");
    AddAdditionalTrigger("Good evening");
    AddAdditionalText("It is a wonderful day in Cadomyr, reigned by our magnificient - and beautiful - queen.");
    AddAdditionalText("Hello.");
    AddTraderTrigger("Grüße","Seid gegrüßt, bei unserer Königin Rosaline.");
    AddAdditionalTrigger("Gruß");
    AddAdditionalTrigger("Seid gegrüßt");
    AddAdditionalTrigger("Guten Tag");
    AddAdditionalTrigger("Guten Abend");
    AddAdditionalTrigger("Mahlzeit");
    AddAdditionalTrigger("Tach");
    AddAdditionalTrigger("Moin");
    AddAdditionalText("Es ist ein wundervoller Tag in Cadomyr, regiert von unserer glorreichen - und wunderschönen - Königin.");
    AddAdditionalText("Hallo.");
    AddTraderTrigger("Hiho","Hail, by queen Rosaline! Do you need any glasses, just ask.");
    AddAdditionalTrigger("Hallo");
    AddAdditionalTrigger("Hey");
    AddAdditionalTrigger("Greebas");
    AddAdditionalTrigger("Greebs");
    AddCondition("lang","english");
    AddAdditionalText("It is a wonderful day in Cadomyr, reigned by our magnificient - and beautiful - queen.");
    AddAdditionalText("Hello.");
    AddTraderTrigger("Hiho","Seid gegrüßt, bei unserer Königin Rosaline.");
    AddAdditionalTrigger("Hallo");
    AddAdditionalTrigger("Hey");
    AddAdditionalTrigger("Greebas");
    AddAdditionalTrigger("Greebs");
    AddCondition("lang","german");
    AddAdditionalText("Es ist ein wundervoller Tag in Cadomyr, regiert von unserer glorreichen - und wunderschönen - Königin.");
    AddAdditionalText("Hallo.");
    AddTraderTrigger("Farewell","Go with queensspeed.");
    AddAdditionalTrigger("Good bye");
    AddAdditionalTrigger("Bye");
    AddAdditionalTrigger("Fare thy well");
    AddAdditionalText("Fare thy well, and come back one day.");
    AddAdditionalText("One advise: Do venture too far. You will nothing like Cadomyr.");
    AddTraderTrigger("Tschüß","Geht mit dem Segen der Königin.");
    AddAdditionalTrigger("Tschüss");
    AddAdditionalTrigger("Wiedersehen");
    AddAdditionalTrigger("Gehabt euch wohl");
    AddAdditionalText("Gehabt euch wohl und kommt eines Tages wieder.");
    AddAdditionalText("Ein Rat: Geht nicht zu weit fort, ihr werdet nichts mit Cadomyr vergleichbares finden.");
    AddTraderTrigger("Ciao","Go with queensspeed.");
    AddAdditionalTrigger("Adieu");
    AddAdditionalTrigger("Au revoir");
    AddCondition("lang","english");
    AddAdditionalText("Fare thy well, and come back one day.");
    AddAdditionalText("One advise: Do venture too far. You will nothing like Cadomyr.");
    AddTraderTrigger("Ciao","Geht mit dem Segen der Königin.");
    AddAdditionalTrigger("Adieu");
    AddAdditionalTrigger("Au revoir");
    AddCondition("lang","german");
    AddAdditionalText("Gehabt euch wohl und kommt eines Tages wieder.");
    AddAdditionalText("Ein Rat: Geht nicht zu weit fort, ihr werdet nichts mit Cadomyr vergleichbares finden.");
    AddTraderTrigger("How are you","Let's not talk about feelings, let's talk about business.");
    AddAdditionalTrigger("How feel");
    AddAdditionalTrigger("How do you do");
    AddAdditionalText("I feel great, I saw the queen yesterday!");
    AddTraderTrigger("Wie geht","Lasst uns nicht über Gefühle sondern übers Geschäft reden.");
    AddAdditionalTrigger("Wie fühlst");
    AddAdditionalTrigger("Wie ist es ergangen");
    AddAdditionalText("Mir geht es bestens, gestern gerade habe ich die Königin gesehen.");
    AddTraderTrigger("your name","Jonathan Cyrus. Call me John and you'll regret it.");
    AddAdditionalTrigger("who are you");
    AddAdditionalTrigger("who art thou");
    AddAdditionalText("You're at Cyrus' glass goods store.");
    AddAdditionalText("For my good customers, I go by Jonathan.");
    AddTraderTrigger("dein name","Jonathan Cyrus. Nennt mich John und ihr werdet es bereuen.");
    AddAdditionalTrigger("wer bist du");
    AddAdditionalTrigger("wer seid ihr");
    AddAdditionalTrigger("wie heißt");
    AddAdditionalText("Ihr seid im Glaswarenladen Cyrus.");
    AddAdditionalText("Für meine guten Kunden heiße ich Jonathan.");
    -- Catching typical NPC phrases 
    AddTraderTrigger("what sell","I trade any kind of glass goods. You can also obtain candles from me.");
    AddAdditionalTrigger("what buy");
    AddAdditionalTrigger("list wares");
    AddAdditionalTrigger("price of");
    AddAdditionalText("I'll gladly show you my offer of glass wares and candles.");
    AddAdditionalText("You can get here anything you need for a perfect dinner.");
    AddTraderTrigger("was verkauf","Ich handel aller Art Glaswaren. Ebenso könnt ihr Kerzen bei mir erwerben.");
    AddAdditionalTrigger("was kauf");
    AddAdditionalTrigger("warenliste");
    AddAdditionalTrigger("preis von");
    AddAdditionalText("Gerne zeige ich euch mein Angebot an Glaswaren und Kerzen.");
    AddAdditionalText("Hier bekommt ihr alles, was ihr für ein perfektes Abendessen braucht.");
    AddTraderTrigger("tell something","Glass is fascinating. It looks like ice, sparkles like diamonds and is as hard as stone.");
    AddAdditionalText("The art of smelting glas is complicated, but I will make sure it will never be forgotten.");
    AddAdditionalText("I once was told that one can turn the rays of sun into a deathly weapon with glass. I seriously doubt this!");
    AddTraderTrigger("erzähl was","Glas ist faszinierend. Es sieht aus wie Eis, funkelt wie ein Diamant und ist so hart wie Stein.");
    AddAdditionalTrigger("erzähl etwas");
    AddAdditionalText("Die Kunst der Glasbläserei ist sehr anspruchsvoll, aber ich werde sicherstellen, dass sie nicht in Vergessenheit gerät.");
    AddAdditionalText("Man hat mir mal berichtet, dass man die Strahlen der Sonne mit Glas zu einer tödlichen Waffe bündeln könnte. Was für ein Humbug.");
    -- Small talk: The talk here should focus on possible questions. Feel free to add more!
    AddTraderTrigger("profession","I trade glass goods.");
    AddAdditionalText("I trade candles and glass goods.");
    AddTraderTrigger("beruf","Ich handel mit Glaswaren");
    AddAdditionalText("Ich handel mit Kerzen und Glaswaren.");
    AddTraderTrigger("job","Ich handel mit Glaswaren");
    AddCondition("lang","german");
    AddAdditionalText("Ich handel mit Kerzen und Glaswaren.");
    AddTraderTrigger("job","I trade glass goods.");
    AddCondition("lang","english");
    AddAdditionalText("I trade candles and glass goods.");
    AddTraderTrigger("glas","Glass is fascinating. It looks like ice, sparkles like diamonds and is as hard as stone.");
    AddCondition("lang","english");
    AddAdditionalText("The art of smelting glas is complicated, but I will make sure it will never be forgotten.");
    AddAdditionalText("I once was told that one can turn the rays of sun into a deathly weapon with glass. I seriously doubt this!");
    AddTraderTrigger("glas","Glas ist faszinierend. Es sieht aus wie Eis, funkelt wie ein Diamant und ist so hart wie Stein.");
    AddCondition("lang","german");
    AddAdditionalText("Die Kunst der Glasbläserei ist sehr anspruchsvoll, aber ich werde sicherstellen, dass sie nicht in Vergessenheit gerät.");
    AddAdditionalText("Man hat mir mal berichtet, dass man die Strahlen der Sonne mit Glas zu einer tödlichen Waffe bündeln könnte. Was für ein Humbug.");
    AddTraderTrigger("trader","Need forged goods? Need clothes? You can find anything here at the marketplace of Cadomyr.");
    AddAdditionalTrigger("merchant");
    AddAdditionalTrigger("collegue");
    AddAdditionalTrigger("vendor");
    AddAdditionalTrigger("market");
    AddTraderTrigger("händler","Braucht ihr Schmiedewaren? Kleidung? Ihr findet alles hier auf dem Marktplatz von Cadomyr.");
    AddAdditionalTrigger("kollege");
    AddAdditionalTrigger("höker");
    AddAdditionalTrigger("markt");
    -- More small talk; add at least five triggers
    AddTraderTrigger("Rutrus","I know Rutrus, he's living at the Oasis of Stars.");
    AddCondition("lang","english");
    AddAdditionalText("Rutrus, well, I think his head spent too much time under the burning sun.");
    AddAdditionalText("In former times, I bought quartz sand from Rutrus, but then he started talking to his shovel.");
    AddTraderTrigger("Rutrus","Ich kenne Rutrus, er lebt bei der Sternenoase.");
    AddCondition("lang","german");
    AddAdditionalText("Rutrus, nun, ich glaube, sein Kopf war zulange der brennenden Sonne ausgesetzt.");
    AddAdditionalText("Früher habe ich von Zeit zu Zeit Quarzsand von Rutrus gekauft, bis er angefangen hat, mit seiner Schaufel zu reden.");
    AddTraderTrigger("Oase","Die Sternenoase ist außerhalb der Stadtmauern. Schützt euer Gesicht vor Flugsand, wenn ihr durch die Wüste wandert.");
    AddTraderTrigger("Oasis","The Oasis of Stars is beyond the town wall. Protect your face from sand when you walk through the desert.");
    AddTraderTrigger("Sand","Sand is omnipresent here in Cadomyr. It is blessing and curse at the same time.");
    AddCondition("lang","english");
    AddAdditionalText("You'll need plenty sand for glassblowing. But only fine sand, coarse sand is not pure enough.");
    AddTraderTrigger("Sand","Der Sand ist allgegenwärtig hier in Cadomyr. Er ist Segen und Fluch zugleich.");
    AddCondition("lang","german");
    AddAdditionalText("Ihr werdet viel Sand zum Glasblasen benötigen. Nur feiner Sand ist geeignet, grober Sand ist zu unrein.");
    -- Faction stuff
    AddTraderTrigger("Elvaine","Oh, please, spare with me with any news from the archmage. He's lying anyway.");
    AddAdditionalTrigger("Morgan");
    AddAdditionalTrigger("archmage");
    AddAdditionalTrigger("Erzmagier");
    AddCondition("lang","english");
    AddAdditionalText("Elvaine Morgan, you could have said 'The Big Lier' instead.");
    AddTraderTrigger("Elvaine","Oh bitte, erspart mir irgendwelche Neuigkeiten vom Erzmagier. Der lügt wie gedruckt.");
    AddAdditionalTrigger("Morgan");
    AddAdditionalTrigger("archmage");
    AddAdditionalTrigger("Erzmagier");
    AddCondition("lang","german");
    AddAdditionalText("Elvaine Morgan, ihr hättet auch einfach sagen können, 'Der Lügenbaron'.");
    AddTraderTrigger("Runewick","Runewick is a place of books, boredom and lazyness.");
    AddCondition("lang","english");
    AddAdditionalText("If you ever come to Runewick, sell them some vials of mine, will you?");
    AddTraderTrigger("Runewick","Runewick ist ein Ort der Bücher, der Langeweile und der Faulheit.");
    AddCondition("lang","german");
    AddAdditionalText("Wenn ihr jemals nach Runewick kommt, verkauft ihr den Leuten dort ein paar meiner Phiolen, bitte?");
    AddTraderTrigger("Valerio","Valerio Guilianni is the Don of Galmair. That is all there is to say.");
    AddAdditionalTrigger("Guilianni");
    AddAdditionalTrigger("Don");
    AddCondition("lang","english");
    AddTraderTrigger("Valerio","Valerio Guilianni ist der Don von Galmair. Mehr gibt es da nicht zu sagen.");
    AddAdditionalTrigger("Guilianni");
    AddAdditionalTrigger("Don");
    AddCondition("lang","german");
    AddTraderTrigger("Galmair","Never go to Galmair if you want to survice the night.");
    AddCondition("lang","english");
    AddAdditionalText("Galmair is a place of thugs and thieves.");
    AddTraderTrigger("Galmair","Geht niemals nach Galmair, wenn ihr den Morgen erleben wollt.");
    AddCondition("lang","german");
    AddAdditionalText("Galmair ist ein Ort der Diebe und Halunken.");
    AddTraderTrigger("rosaline","Our queen came to power in compliance with the old customs. Who opposes her, opposes the old customs.");
    AddAdditionalTrigger("Königin");
    AddAdditionalTrigger("queen");
    AddAdditionalTrigger("edwards");
    AddCondition("lang","english");
    AddAdditionalText("Shh, don't you think she is too beautiful to remain unmarried?");
    AddAdditionalText("My queen is my everything!");
    AddTraderTrigger("rosaline","Unsere Königin kam an die Macht, ganz nach den alten Sitten. Wer also gegen sie handelt, handelt gegen unsere alten Gebräuche.");
    AddAdditionalTrigger("königin");
    AddAdditionalTrigger("queen");
    AddAdditionalTrigger("edwards");
    AddCondition("lang","german");
    AddAdditionalText("Psst, denkt ihr nicht auch, sie ist zu schön, um allzulange unverheiratet zu sein?");
    AddAdditionalText("Die Königin bedeutet mir alles!");
    AddTraderTrigger("Cadomyr","Cadomyr is a land of sand and stone. But we made the best out of it.");
    AddCondition("lang","english");
    AddAdditionalText("Cadomyr, oh, Cadomyr, I like to dwell just here!");
    AddTraderTrigger("Cadomyr","Cadomyr ist ein Land aus Sand und Stein. Aber wir haben das beste daraus gemacht.");
    AddCondition("lang","german");
    AddAdditionalText("Cadomyr, oh Cadomyr, wie gerne wohn' ich hier!");
    -- Main land factions
    AddTraderTrigger("albar","All of us have ancestors in Albar. However, our fate is in the hand of the queen now.");
    AddCondition("lang","english");
    AddAdditionalText("We honour the customs of Albar. The queen does, especially. Yes, a female sovereign, do not question this, ever.");
    AddTraderTrigger("albar","Wir alle haben Vorfahren aus Albar. Nun aber liegt unser Schicksal in der Hand der Königin.");
    AddCondition("lang","german");
    AddAdditionalText("Wir ehren die Gebräuche Albars. Die Königin tut dies ebenso, ja, ein weiblicher Souverän. Stellt dies niemals in Frage!");
    AddTraderTrigger("gynk","I do not bother what is going on in Gynk. Most probably, they slash each others' throat currently.");
    AddAdditionalTrigger("gync");
    AddCondition("lang","english");
    AddTraderTrigger("gync","Es ist mir einerlei, was in Gynk vor sich geht. Wahrscheinlich schlitzen sich die Leute dort gerade gegenseitig die Kehlen auf.");
    AddAdditionalTrigger("gynk");
    AddCondition("lang","german");
    AddTraderTrigger("salkama","Oh, please, do not talk about this in public. The queen does not like it.");
    AddCondition("lang","english");
    AddAdditionalText("Shh!");
    AddAdditionalText("Hush!");
    AddTraderTrigger("salkama","Oh, bitte sprecht darüber nicht in aller Öffentlichkeit. Die Königin mag das nicht.");
    AddCondition("lang","german");
    AddAdditionalText("Psst!");
    AddAdditionalText("Still!");
    -- Gods; each NPC should at react on at least one god, being a follower of said god
    AddTraderTrigger("Irmorom","Of course I pray to Irmorom before I light the smelting furnace. But who I really adore, that is Adron.");
    AddCondition("lang","english");
    AddTraderTrigger("Irmorom","Natürlich betet ich stets zu Irmorom, bevor ich den Schmelzofen anfeuere. Aber wirklich verehren tu ich Adron.");
    AddCondition("lang","german");
    AddTraderTrigger("Adron","Alas! Adron is my saviour. Without him, nobody would enjoy a good wine and I'd sell nothing anymore.");
    AddCondition("lang","english");
    AddTraderTrigger("Adron","Fürwahr, Adron ist mein Heiland. Ohne ihn würde niemand mehr einen guten Tropfen Wein genießen und ich würde nichts mehr verkaufen.");
    AddCondition("lang","german");
    -- Catching quest triggers
    AddTraderTrigger("quest","Quests? Well, learn glassblowing, that is a quest that will keep you busy for some years.");
    AddAdditionalTrigger("mission");
    AddCondition("lang","english");
    AddTraderTrigger("quest","Abenteuer? Nun, Glasblasen zu erlernen ist wirklich ein Abenteuer für sich.");
    AddAdditionalTrigger("mission");
    AddCondition("lang","german");
    AddTraderTrigger("task","Quests? Well, learn glassblowing, that is a quest that will keep you busy for some years.");
    AddAdditionalTrigger("adventure");
    AddTraderTrigger("Auftrag","Abenteuer? Nun, Glasblasen zu erlernen ist wirklich ein Abenteuer für sich.");
    AddAdditionalTrigger("Aufgabe");
    AddAdditionalTrigger("Abenteuer");
    -- Last catch: Think about keyphrases the player might say and that are not caught until here
    AddTraderTrigger("Yes","The queen's favourite word: 'Yes'.");
    AddAdditionalText("Fine.");
    AddAdditionalText("Perhaps you want to take a look at my goods.");
    AddTraderTrigger("Ja","Das Lieblingswort der Königin: 'Ja'.");
    AddAdditionalText("Fein.");
    AddAdditionalText("Vielleicht wollt ihr einen Blick auf meine Waren werfen.");
    AddTraderTrigger("No","Well, then, maybe I can interest you in some candles?");
    AddAdditionalText("No?");
    AddAdditionalText("How comes you disagree?");
    AddAdditionalText("You say 'no', as long as you don't face the queen, you may do so.");
    AddTraderTrigger("Nein","Nun, kann ich euch stattdessen mit einigen Kerzen beglücken?");
    AddAdditionalText("Nein?");
    AddAdditionalText("Wieso widersprecht ihr?");
    AddAdditionalText("Ihr könnt solange 'Nein' sagen, bis ihr der Königin gegenübersteht.");
    -- Cycletext: Please add at least(!) five cycletext messages. The more, the better. You can use emotes (#me is green), too. 
    AddCycleText("Was immer ihr braucht - ich habe es.","Whatever you need - I have it.");
    AddCycleText("Beste Glaswaren!","Best glass goods!");
    AddCycleText("Kommt her, schaut euch an, was ich zu bieten habe.","Come around, take a look at my offer.");
    AddCycleText("Kerzen, helle Kerzen!","Candles, bright candles!");
    AddCycleText("#me wischt einen Glaskelch mit einem seidenen Tuch ab.","#me polishes a glass goblet with a silk tissue.");
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
        	if (originator:getQuestProgress(62) >= 10000 and originator:getQuestProgress(62) < 19999) then -- check if he is doing the mineth quest
				 if string.find(message,"[Mm]itglied")~=nil or string.find(message,"[Mm]ember")~=nil or
				    string.find(message,"[Tt]rader.+[Cc]ompany")~=nil then
					gText = "Ähm... der Händler in Runewick nennt sich <Name Händler Runewick>. Und den Namen des Händlers aus Galmair habe ich vergessen, er ist neu bei uns, aber ich weiß, dass er Metallgegenstände verkauft.";
					eText = "Uhm... the name of the trader in Runewick is <Name Händler Runewick>. And the name of the other trader from Galmair I already forgot, he is new in our guild, but I know that he sells metal stuff.";
					outText=base.common.GetNLS(originator,gText,eText); NPCTalking(thisNPC,outText);
					
				 elseif string.find(message,"[Mm]ineth")~=nil or string.find(message,"[Rr]ätsel")~=nil or
		             string.find(message,"[Rr]iddle")~=nil or string.find(message,"[Ww]appen")~=nil or
					 string.find(message,"[Bb]anner")~=nil or string.find(message,"[Cc]oat")~=nil or
					 string.find(message,"[Gg]ilde")~=nil or string.find(message,"[Gg]uild")~=nil or
					 string.find(message,"[Ww]hat.+you.+like")~=nil or
					 string.find(message,"[Ww]hat.+you.+want")~=nil or string.find(message,"[Ww]as.+magst.+du")~=nil then
					 
					gText = "Da euch Mineth schickt, habe ich folgendes Rätsel was wir auf dem Banner wollen:";
					eText = "Because Mineth sends you, I have the following riddle for the coat of arms for you:";
					outText=base.common.GetNLS(originator,gText,eText); NPCTalking(thisNPC,outText);
					
                    gText,eText = chooseSentence(originator,1);                    -- tell Riddle Text
					outText=base.common.GetNLS(originator,gText,eText); NPCTalking(thisNPC,outText);
					 
					gText = "Es könnte hilfreich sein ihn zu fragen wer die anderen beiden 'Mitglieder' der Trader Company-Gilde sind.";
					eText = "It could be helpful to ask him who the other two 'members' of the Trader Company are.";
					base.common.TempInformNLS(originator,gText,eText);
				 else
       				TellSmallTalk(message,originator);
				 end
			else
            	TellSmallTalk(message,originator);
			end
        else
            Confused(
               "#me sieht dich leicht verwirrt an.",
               "#me looks at you a little confused."
            );
        end
    end
end
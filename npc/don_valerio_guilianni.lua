-- INSERT INTO npc VALUES (nextval('npc_seq'),0,337,215,0,4,false,'Don Valerio Guilianni','npc_don_valerio_guilianni.lua',0);

dofile("npc_autonpcfunctions.lua");

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
    -- NPC by Faladron
    -- Help
    AddTraderTrigger("Help","");
    AddConsequence("inform","[Game Help] This NPC is Don Valerio Guilianni of Galmair. Keyphrases: TRIGGERS.");
    AddTraderTrigger("Hilfe","");
    AddConsequence("inform","[Spielhilfe] Dieser NPC ist Don Valerio Guilianni von Galmair. Schlüsselwörter: TRIGGERS.");
    -- General speech
    AddTraderTrigger("Hello","The Don greets you. So you've came to take good care of your fate?");
    AddAdditionalTrigger("Greetings");
    AddAdditionalTrigger("Be greeted");
    AddAdditionalTrigger("Hail");
    AddAdditionalTrigger("Good day");
    AddAdditionalTrigger("Good morning");
    AddAdditionalTrigger("Good evening");
    AddAdditionalText("Greetings, greetings. The Don is busy right now but he always has an open ear for the pleas of his protégés.");
    AddAdditionalText("Hm? State your cause to the Don but make it brief or I'll make you an offer you can't refuse.");
    AddTraderTrigger("Grüße","Der Don grüßt euch. Ihr seid also gekommen um euch um euer Schicksal zu kümmern?");
    AddAdditionalTrigger("Gruß");
    AddAdditionalTrigger("Seid gegrüßt");
    AddAdditionalTrigger("Guten Tag");
    AddAdditionalTrigger("Guten Abend");
    AddAdditionalTrigger("Mahlzeit");
    AddAdditionalTrigger("Tach");
    AddAdditionalTrigger("Moin");
    AddAdditionalText("Grüße, Grüße. Der Don ist zwar beschäftigt aber für die Anliegen seiner Schützlinge hat er immer ein offenes Ohr.");
    AddAdditionalText("Hm? Tragt eure Sache dem Don vor aber fasst es kurz oder ich mache euch ein Angebot, das ihr nicht ablehnen könnt.");
    AddTraderTrigger("Hiho","The Don greets you. So you've came to take good care of your fate?");
    AddAdditionalTrigger("Hallo");
    AddAdditionalTrigger("Hey");
    AddAdditionalTrigger("Greebas");
    AddAdditionalTrigger("Greebs");
    AddCondition("lang","english");
    AddAdditionalText("Greetings, greetings. The Don is busy right now but he always has an open ear for the pleas of his protégés.");
    AddAdditionalText("Hm? State your cause to the Don but make it brief or I'll make you an offer you can't refuse.");
    AddTraderTrigger("Hiho","Der Don grüßt euch. Ihr seid also gekommen um euch um euer Schicksal zu kümmern?");
    AddAdditionalTrigger("Hallo");
    AddAdditionalTrigger("Hey");
    AddAdditionalTrigger("Greebas");
    AddAdditionalTrigger("Greebs");
    AddCondition("lang","german");
    AddAdditionalText("Grüße, Grüße. Der Don ist zwar beschäftigt aber für die Anliegen seiner Schützlinge hat er immer ein offenes Ohr.");
    AddAdditionalText("Hm? Tragt eure Sache dem Don vor aber fasst es kurz oder ich mache euch ein Angebot, das ihr nicht ablehnen könnt.");
    AddTraderTrigger("Farewell","#me rubs his chin looking contemplative 'Eh, you may leave. Probably not worth to send someone to keep an eye on you.'");
    AddAdditionalTrigger("Good bye");
    AddAdditionalTrigger("Bye");
    AddAdditionalTrigger("Fare thy well");
    AddAdditionalText("May Ronagan spread his protective coat out atop of you. And best regards to the family!");
    AddAdditionalText("#me gives a brief nod and then turns away 'Hm. An interresting person, gonna get good one day, too good. Miggs should administer his observation.");
    AddTraderTrigger("Tschüß","#me fährt sich nachdenklich übers Kinn 'Eh, ihr könnt gehen. Wohl nicht wert euch im Auge behalten zu lassen.'");
    AddAdditionalTrigger("Tschüss");
    AddAdditionalTrigger("Wiedersehen");
    AddAdditionalTrigger("Gehabt euch wohl");
    AddAdditionalText("Ronagan breite seinen schützenden Mantel über euch aus. Und Grüße an die Familie!");
    AddAdditionalText("#me nickt nur knapp und wendet sich dann ab 'Hm. Eine interessante Person, könnte es weit bringen, zu weit. Miggs soll ihn beschatten lassen.'");
    AddTraderTrigger("Ciao","#me rubs his chin looking contemplative 'Eh, you may leave. Probably not worth to send someone to keep an eye on you.'");
    AddAdditionalTrigger("Adieu");
    AddAdditionalTrigger("Au revoir");
    AddCondition("lang","english");
    AddAdditionalText("May Ronagan spread his protective coat out atop of you. And best regards to the family!");
    AddAdditionalText("#me gives a brief nod and then turns away 'Hm. An interresting person, gonna get good one day, too good. Miggs should administer his observation.");
    AddTraderTrigger("Ciao","#me fährt sich nachdenklich übers Kinn 'Eh, ihr könnt gehen. Wohl nicht wert euch im Auge behalten zu lassen.'");
    AddAdditionalTrigger("Adieu");
    AddAdditionalTrigger("Au revoir");
    AddCondition("lang","german");
    AddAdditionalText("Ronagan breite seinen schützenden Mantel über euch aus. Und Grüße an die Familie!");
    AddAdditionalText("#me nickt nur knapp und wendet sich dann ab 'Hm. Eine interessante Person, könnte es weit bringen, zu weit. Miggs soll ihn beschatten lassen.'");
    AddTraderTrigger("How are you","Excellent. But that's of no concern right now. Tell me, %CHARNAME, what can the Don do for you?");
    AddAdditionalTrigger("How feel");
    AddAdditionalTrigger("How do you do");
    AddAdditionalText("#me waves dismissively 'Oh still a little shaken from the weekly assasination attempt.'");
    AddAdditionalText("How? One could say: Like the leader of a pack of wolves that has to guard his position at all times.");
    AddTraderTrigger("Wie geht","Ausgezeichnet. Aber das tut nichts zur Sache. Sagt was kann der Don für euch tun, %CHARNAME?");
    AddAdditionalTrigger("Wie fühlst");
    AddAdditionalTrigger("Wie ist es ergangen");
    AddAdditionalText("#me winkt ab 'Oh noch etwas aufgeregt vom allwöchentlichen Anschlag auf mein Leben.'");
    AddAdditionalText("Wie? Ein treffender Vergleich wäre dies: Wie der einsame Leitwolf, der seine Stellung im Rudel verteidigen muss.");
    AddTraderTrigger("your name","#me makes a broad welcoming gesture with his hands 'Ah forgive my manners. Valerio Guilianni is my name but call me 'My Don'.");
    AddAdditionalTrigger("who are you");
    AddAdditionalTrigger("who art thou");
    AddAdditionalText("Hm, you're not a bright spark, right? I thought this residence and hoard of servants would give enough of a hint.");
    AddAdditionalText("#me sighs '%CHARNAME, how can one be so naive? Where's the respect? I am the Don.'");
    AddTraderTrigger("dein name","#me macht eine ausladende willkommende Geste 'Ah meine Manieren. Valerio Guilianni ist mein Name aber nennt mich 'Mein Don'.");
    AddAdditionalTrigger("wer bist du");
    AddAdditionalTrigger("wer seid ihr");
    AddAdditionalTrigger("wie heißt");
    AddAdditionalText("Hm, der hellste Blitz scheint ihr nicht zu sein. Und ich dachte die Residenz und Dienerschaft wären Hinweis genug.");
    AddAdditionalText("#me seufzt '%CHARNAME, wie kann man nur so blauäugig sein? Wo bleibt der Respekt? Ich bin der Don.'");
    -- Catching typical NPC phrases
    AddTraderTrigger("what sell","I don't sell anything, I grant favours.");
    AddAdditionalTrigger("what buy");
    AddAdditionalTrigger("list wares");
    AddAdditionalTrigger("price of");
    AddTraderTrigger("was verkauf","Ich verkaufe nichts, ich gewähre Gefälligkeiten.");
    AddAdditionalTrigger("was kauf");
    AddAdditionalTrigger("warenliste");
    AddAdditionalTrigger("preis von");
    AddTraderTrigger("tell something","Money gets you everywhere in Galmair. Even those places you probably shouldn't be.");
    AddAdditionalText("My father once said: 'Son, stay honest and upright, you'll be rewarded.' Oh how we laughed that day.");
    AddAdditionalText("#me winks knowingly 'If there's one habbit I broke out of it's telling others about something.'");
    AddTraderTrigger("erzähl was","In Galmair bringt Geld euch überall hin. Wohl auch an Orte die ihr meiden solltet.");
    AddAdditionalTrigger("erzähl etwas");
    AddAdditionalText("Mein Vater sagte einmal: 'Sohn, bleib ehrbar und anständig, es wird dir gelohnt.' Oh was haben wir an diesem Tag gelacht.");
    AddAdditionalText("#me zwinkert wissend 'Wenn es eine Sache gibt die ich mir abgewöhnt habe, dann anderen Dinge zu erzählen.");
    -- Small talk: The talk here should focus on possible questions. Feel free to add more!
    AddTraderTrigger("profession","Well, I provide for myself, my family and my friends. Ah and I rule Galmair of course.");
    AddTraderTrigger("beruf","Nun, ich sorge für mich, meine Familie und meine Freunde. Ach und Galmair beherrsche ich natürlich.");
    AddTraderTrigger("job","Nun, ich sorge für mich, meine Familie und meine Freunde. Ach und Galmair beherrsche ich natürlich.");
    AddCondition("lang","german");
    AddTraderTrigger("job","Well, I provide for myself, my family and my friends. Ah and I rule Galmair of course.");
    AddCondition("lang","english");
    AddTraderTrigger("Gobaith","Ja, eine Schande. Tragisch, furchtbar. Und dabei herrschten ideale Bedingungen um ein zweites Galmair zu errichten.");
    AddCondition("lang","english");
    AddAdditionalText("As far as I heard, Troll's Bane could easily compete with Galmair in terms of security, quality of life and civil rights.");
    AddTraderTrigger("Gobaith","Ja, eine Schande. Tragisch, furchtbar. Und dabei herrschten ideale Bedingungen um ein zweites Galmair zu errichten.");
    AddCondition("lang","german");
    AddAdditionalText("Soweit ich gehört habe, stand Troll's Bane Galmair in Sicherheit, Lebensqualität und politischer Mitsprache um nichts nach.");
    AddTraderTrigger("my name","I pay good money to know what's going on in my town, %CHARNAME. I knew about your presence here.");
    AddTraderTrigger("mein Name","Ich zahle gutes Geld um zu wissen was in meiner Stadt passiert, %CHARNAME. Euer Aufenthalt hier war mir bekannt.");
    -- More small talk; add at least five triggers
    AddTraderTrigger("Rosie","She doesn't like the name, you'll rather know her as queen Rosaline.");
    AddCondition("lang","english");
    AddAdditionalText("Believe me, it is my privilege alone to call her that way. Don't you even try.");
    AddTraderTrigger("Rosie","Sie mag den Namen nicht, ihr werdet sie eher als Königin Rosaline kennen.");
    AddCondition("lang","german");
    AddAdditionalText("Glaubt mir, das Privileg sie so zu nennen ist allein mir vorbestimmt. Versucht es erst gar nicht.");
    AddTraderTrigger("Miggs","Every sucessful buisinessman needs two things: A supportive wife and a muscle to do his biding. If only I had Rosie, I'd have both in one person.");
    AddCondition("lang","english");
    AddAdditionalText("Miggs is like a second left hand for me, but enough jokes. See him if you need a task.");
    AddTraderTrigger("Miggs","Jeder erfolgreiche Geschäftsmann braucht zwei Dinge: Eine unterstützende Frau und einen Mann fürs Grobe. Ach, mit Rosie hätte ich beides in einem.");
    AddCondition("lang","german");
    AddAdditionalText("Miggs ist wie eine zweite linke Hand, aber genug gescherzt. Geh zu ihm wenn du eine Aufgabe suchst.");
    -- Faction stuff
    AddTraderTrigger("Elvaine","Tell me, what should I think of a man who wears womens clothing and enjoys men swooning over his greatness?");
    AddAdditionalTrigger("Morgan");
    AddAdditionalTrigger("archmage");
    AddAdditionalTrigger("Erzmagier");
    AddCondition("lang","english");
    AddAdditionalText("He is said not to leave his tower very often. And if you ask me, that's a good thing.");
    AddTraderTrigger("Elvaine","Sagt mir ernsthaft, was soll ich von einem Mann halten der Frauengewänder trägt und sich von Männern anhimmeln lässt?");
    AddAdditionalTrigger("Morgan");
    AddAdditionalTrigger("archmage");
    AddAdditionalTrigger("Erzmagier");
    AddCondition("lang","german");
    AddAdditionalText("Er soll seinen Turm ja nicht oft verlassen, und wenn ihr mich fragt ist das auch gut so.");
    AddTraderTrigger("Runewick","Sadly, the tide never rises high enough for a wave to wash away all those bookworms into the sea.");
    AddCondition("lang","english");
    AddAdditionalText("Some suspect me of blackmail, but do you know the fee charged by a Runewick mage for his services? That's a crime!");
    AddTraderTrigger("Runewick","Leider steigt die Flut nie hoch genug, um diese ganzen Bücherwürmer mit einer Welle ins Meer zu spülen.");
    AddCondition("lang","german");
    AddAdditionalText("Man warf mir schon einmal Erpressung vor, aber wisst ihr, wieviel die Magier Runewicks für ihre Dienste verlangen? Das ist ein Verbrechen.");
    AddTraderTrigger("Valerio","#me bows ever so slightly. 'That's me. How can I help you, %CHARNAME ?'");
    AddAdditionalTrigger("Guilianni");
    AddAdditionalTrigger("Don");
    AddCondition("lang","english");
    AddAdditionalText("You've heard about me I see. Very good, very good. Ask and the Don will help you.");
    AddAdditionalText("What do you want from him? Who sent you? Guards! Has this person been searched for weapons?");
    AddTraderTrigger("Valerio","#me deutet eine Verbeugung an. 'Das bin ich. Wie kann ich euch helfen, %CHARNAME ?'");
    AddAdditionalTrigger("Guilianni");
    AddAdditionalTrigger("Don");
    AddCondition("lang","german");
    AddAdditionalText("Ihr habt also von mir gehört. Sehr schön, sehr schön. Bittet und der Don wird euch helfen.");
    AddAdditionalText("Was wollt ihr von ihm? Wer hat euch geschickt? Wache! Wurde diese Person auf Waffen untersucht?");
    AddTraderTrigger("Galmair","Galmair is like a mountain flower, enchanting every wanderer with its beauty.");
    AddCondition("lang","english");
    AddAdditionalText("Sometimes, if I am up early and look down from the battlement I can almost smell the sucess and profit of Galmair.");
    AddTraderTrigger("Galmair","Manchmal, wenn ich früh aufstehe und von den Zinnen hinabblicke kann ich den Erfolg und Profit von Galmair fast riechen.");
    AddCondition("lang","german");
    AddTraderTrigger("rosaline","Oh Rosie! That's my kind of woman. Such fire, such fierce temper!");
    AddAdditionalTrigger("königin");
    AddAdditionalTrigger("queen");
    AddAdditionalTrigger("edwards");
    AddCondition("lang","english");
    AddAdditionalText("She fell for me completely! Sadly she would never show her true feelings openly.");
    AddTraderTrigger("rosaline","Oh Rosie! Das ist eine richtige Frau! Voll Feuer, voll Temperament!");
    AddAdditionalTrigger("königin");
    AddAdditionalTrigger("queen");
    AddAdditionalTrigger("edwards");
    AddCondition("lang","german");
    AddAdditionalText("Sie ist mir vollkommen verfallen! Leider würde sie ihre wahren Gefühle für mich nie offen zeigen.");
    AddTraderTrigger("Cadomyr","A nice place. Maybe it lacks the proper nightlife, but Rosie does a good job overall.");
    AddCondition("lang","english");
    AddTraderTrigger("Cadomyr","Ein hübscher Ort. Das Nachtleben lässt vielleicht etwas zu wünschen übrig, aber Rosie macht ihre Sache gut.");
    AddCondition("lang","german");
    -- Main land factions
    AddTraderTrigger("albar","Proud people. I find their way of dealing with weakness appealing.");
    AddCondition("lang","english");
    AddTraderTrigger("albar","Ein stolzes Volk. Und ihre Art, wie sie mit Schwäche umgehen, gefällt mir ebenfalls.");
    AddCondition("lang","german");
    AddTraderTrigger("gynk","Honourable former 'business partners' of my father lived there. Until we had to terminate them. The business relationships I mean.");
    AddAdditionalTrigger("gync");
    AddCondition("lang","english");
    AddTraderTrigger("gync","Ehrenwerte ehemalige 'Geschäftspartner' meines Vaters wohnten dort. Wir mussten sie leider terminieren. Die Geschäftsbeziehungen meine ich.");
    AddAdditionalTrigger("gynk");
    AddCondition("lang","german");
    AddTraderTrigger("salkama","Eventhough they like to act all noble, many of them visit Galmair to entertain themselves. Their vice pays our dice, heh.");
    AddCondition("lang","english");
    -- Not sure if that makes sense in english
    AddTraderTrigger("salkama","Auch wenn sie sich gerne nobel geben, viele kommen zu uns nach Galmair um sich zu amüsieren. Ihr Laster bringt uns Zaster, hehe.");
    AddCondition("lang","german");
    -- Gods; gods are relevant, so the faction leader has to have an opinion on ALL gods
    AddTraderTrigger("Adron","Ahh, what would a tavern be without him? How could tempers run high over a game of cards if not due to Adron's gifts?");
    AddCondition("lang","english");
    AddTraderTrigger("Adron","Ahh, was wäre eine Taverne ohne ihn? Wie könnten sich sonst die Gemüter so beim Kartenspiel erhitzen wenn nicht durch Adrons Gaben?");
    AddTraderTrigger("Bragon","I wonder if he takes offence in my dragon leather boots. But didn't he leave this world already? If you can't stand the heat, get out of the kitchen, hehe.");
    AddAdditionalTrigger("Brágon");
    AddCondition("lang","english");
    -- English and German translation doesn't match, but why bother?
    AddTraderTrigger("Bragon","Ich frage mich ob er meine Stiefel aus Drachenleder anstößig findet. Aber hat er diese Welt nicht schon verlassen? Und was er nicht weiß macht ihn nicht heiß.");
    AddAdditionalTrigger("Brágon");
    AddTraderTrigger("Cherga","If you'd wake up to a dagger poking your throat every other night you'd also respect the lady in black.");
    AddCondition("lang","english");
    AddTraderTrigger("Cherga","Würdet ihr jede zweite Nacht mit einem Messer an der Kehle aufwachen, ihr hättet auch Respekt vor der schwarzen Dame.");
    AddTraderTrigger("Elara","Books might teach you a lot. But everything I had to learn to become sucessful I have experienced through action.");
    AddCondition("lang","english");
    AddTraderTrigger("Elara","Bücher mögen einem viel beibringen können. Aber alles, was ich lernen musste um erfolgreich zu sein, habe ich durch Taten erfahren.");
    AddTraderTrigger("Eldan","I don't believe Eldan shows any interrest in Galmair or myself. The mountains are pretty secluded however, maybe he'd like those.");
    AddCondition("lang","english");
    AddTraderTrigger("Eldan","Ich glaube kaum, dass Eldan sich für Galmair und mich interessiert. Obwohl das Gebirge doch sehr abgeschieden ist, vielleicht würde ihm das gefallen.");
    AddTraderTrigger("Findari","Sometimes, when the temperature becomes unbearable in winter, I think to myself 'One can overdo in fulfilling his tasks'.");
    AddCondition("lang","english");
    AddTraderTrigger("Findari","Manchmal, wenn die Temperaturen im Winter unerträglich werden, denke ich mir 'Man kann seine Aufgaben auch zu gründlich erfüllen.'");
    AddTraderTrigger("Irmorom","As Galmairs wealth comes from mining and processing ores it would be foolish not to drink a mug of beer regularly in honour of the great craftsman, right?");
    AddCondition("lang","english");
    AddTraderTrigger("Irmorom","Da Galmair vorallem vom Bergbau und Weiterverarbeitung von Metallen lebt, wäre es töricht, nicht regelmäßig einen Krug Bier für den großen Handwerker mitzutrinken, nicht?");
    AddTraderTrigger("Malachin","Hah, noble the one to receive an arrow for saving his comrade in battle. Doesn't he know how much that hurts!?");
    AddAdditionalTrigger("Malachín");
    AddCondition("lang","english");
    AddTraderTrigger("Malachin","Hah, ehrenhaft ist, wer einen Pfeil abfängt um seinen Kameraden in der Schlacht zu retten. Weiß er nicht wie weh sowas tut!?");
    AddAdditionalTrigger("Malachín");
    AddTraderTrigger("Moshran","Maybe not all of my decisions in life were 'right', but I do know the thin line between twilight and eternal darkness. I won't cross that line.");
    AddCondition("lang","english");
    AddTraderTrigger("Moshran","Ich mag nicht immer das 'Richtige' getan haben, aber ich kenne die feine Linie zwischen dem Zwielicht und der ewigen Dunkelheit. Ich werde diese Linie nicht übertreten.");
    AddTraderTrigger("Nargun","Nargún blessed me many a times, when I had to play my cards right. On the other hand there's no reason not to tip luck into your favour, he's pretty unreliable after all.");
    AddAdditionalTrigger("Nargún");
    AddCondition("lang","english");
    AddTraderTrigger("Nargun","Schon oft war mir Nargún hold, als es darum ging auf die richtige Karte zu setzen. Anderenseits spricht nichts dagegen dem Glück auch nachzuhelfen, immerhin ist er nicht sehr verlässlich.");
    AddAdditionalTrigger("Nargún");
    AddTraderTrigger("Oldra","We live amidst a scarce mountain range and I shall pay reverence to Oldra? Puh-lease...");
    AddCondition("lang","english");
    -- Puh-lease might be too informal, better go with 'You're kidding, right?'
    AddTraderTrigger("Oldra","Wir leben inmitten eines kargen Gebirges, und da soll ich Oldra Respekt erweisen? Pfft... also bitte.");
    AddTraderTrigger("Ronagan","No coin, no wares leave my posession before they're blessed in the face of Ronagan. You may figure out as to why I am doing that yourself.");
    AddCondition("lang","english");
    AddTraderTrigger("Ronagan","Kein Geldstück, keine Ware verlässt meinen Besitz bevor sie nicht in Gebete zu Ronagan mit eingeschlossen wurde. Spekulationen, warum ich das mache, seien euch selbst überlassen.");
    AddTraderTrigger("Sirani","I would have the most beautiful temple carved into the mountains, if only Rosie wouldn't be that abrasive. Sirani has to settle for less until that happens.");
    AddCondition("lang","english");
    AddTraderTrigger("Sirani","Den schönsten Tempel würde ich in das Gebirge hauen lassen, wenn nur Rosie nicht immer so abweisend zu mir wäre. Bis dahin muss Sirani sich mit weniger begnügen.");
    AddTraderTrigger("Tanora","In spring after the snow is melting I sometimes think we don't pay enough respect to her. But after the floods are under control I disregard those thoughts again.");
    AddCondition("lang","english");
    AddTraderTrigger("Tanora","Nach der Schneeschmelze im Frühling glaube ich manchmal dass wir Tanora nicht genug huldigen. Wenn die Überschwemmungen aber beseitigt sind, verdränge ich diese Gedanken wieder.");
    AddTraderTrigger("Ushara","Some of the dwarves pray to her. They say if we don't, the mountain will collapse upon us. Whatever.");
    AddCondition("lang","english");
    AddTraderTrigger("Ushara","Einige der Zwerge beten zu ihr. Sie sagen sonst stürzt uns der Berg auf den Kopf, was auch immer.");
    AddTraderTrigger("Zhambra","When you're smiling everyone smiles with you. Cry and you weep alone. I never needed friends.");
    AddCondition("lang","english");
    -- Possible copyright infringement?
    AddTraderTrigger("Zhambra","Wenn man lacht, lacht die Welt mit einem mit, aber weine und du weinst allein. Ich hatte nie eine Verwendung für Freunde.");
    -- Catching quest triggers
    AddTraderTrigger("quest","The day will come, when the Don will ask you for a favour. Ask Miggs if that day is today.");
    AddCondition("lang","english");
    AddTraderTrigger("quest","Es wird der Tag kommen, an dem dich der Don um einen Gefallen bittet. Frage Miggs, ob heute dieser Tag ist.");
    AddCondition("lang","german");
    AddTraderTrigger("task","You know, the Don starts to like you. And he'll get you a task to do. Ask Miggs how you can earn the Don's favour.");
    AddAdditionalTrigger("adventure");
    AddTraderTrigger("Auftrag","Weißt du, der Don mag dich. Und der Don wird dir auch eine Arbeit verschaffen. Frage Miggs, wie du in der Gunst des Don steigen kannst.");
    AddAdditionalTrigger("Aufgabe");
    AddAdditionalTrigger("Abenteuer");
    -- Easter egg
    AddTraderTrigger("Corleone","Ach, a dazzler from Gynka, no honour. And throaty all the time, the gods know why.");
    AddCondition("lang","english");
    AddTraderTrigger("Corleone","Ach, ein Blender aus Gynka, keine Ehre. Und immer heiser, die Götter wissen warum.");
    AddCondition("lang","german");
    -- Last catch: Think about keyphrases the player might say and that are not caught until here
    AddTraderTrigger("Yes","Indeed.");
    AddAdditionalText("The Don concurs.");
    AddAdditionalText("The Don approves.");
    AddTraderTrigger("Ja","In der Tat.");
    AddAdditionalText("Der Don stimmt zu.");
    AddAdditionalText("Der Don heißt dies gut.");
    AddTraderTrigger("No","'No'? Don't force the Don to make the impossible possible.");
    AddAdditionalText("'No'? Well, you may keep your opinion. One can sell everything else with a profit anyway.");
    AddAdditionalText("And this negative attitude divides sucess and failure. That's why you're just a petitioner before the Don.");
    AddTraderTrigger("Nein","'Nein'? Zwingt den Don nicht das unmögliche möglich zu machen.");
    AddAdditionalText("'Nein'? Nun gut ihr könnt eure Meinung behalten. Alles andere kann man ja mit Gewinn verkaufen.");
    AddAdditionalText("Und genau diese negative Einstellung entscheidet über Erfolg und Misserfolg. Deswegen seid ihr nur ein Bittsteller vor dem Don.");
    -- Cycletext: Please add at least(!) ten cycletext messages. The more, the better. You can use emotes (#me is green), too.
    AddCycleText("#me geht müßig ein paar Schritte auf und ab, dabei lächelt er zufrieden.","#me walks a few steps up and down at a leisure pace, a content smile on his face.");
    AddCycleText("Respekt? Wo ist nur der Respekt geblieben? All diese Möchtegerns...","Respect? Where's the respect? All those wannabes...");
    AddCycleText("#me dreht sich besorgt um 'Halt! Wer ist da? Es ist noch nicht Zeit für das wöchentliche Attentat!'","#me turns around concerned 'Halt! Who's there? It's not time for the weekly assasination attempt.'");
    AddCycleText("#me spuckt angewidert ein paar Trauben aus. 'Ugh. Wer hat das zu verantworten?","#me spits out some grapes in disgust. 'Ugh. Who's responsible for that?'");
    AddCycleText("Ich befürchet, dieser Kräuterhandel wird uns noch in den nächsten Jahren viele Sorgen bereiten.","I believe this herb business is gonna destroy us in the years to come.");
    AddCycleText("Ich war niemals unvorsichtig. Frauen und Kinder dürfen unvorsichtig sein, Männer nicht.","I spent my life trying not to be careless. Women and children can be careless, but not men.");
    AddCycleText("Ich glaube an Gold, Reichtümer und Macht. Wer an sie nicht ehrt, hat sie wohl schlichtweg nicht!","I have faith in gold, wealth and power. Who doesn't honour theses, most probably simply hasn't them.");
    AddCycleText("Miggs! Wo ist Miggs schon wieder! Einige Händler haben ihre 'Protektionsgebühr' diesen Monat noch nicht entrichtet.","Miggs! Where is Miggs again? Some traders haven't paid their 'protection fee' this month.");
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

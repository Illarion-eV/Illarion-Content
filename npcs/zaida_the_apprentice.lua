-- INSERT INTO npc VALUES (nextval('npc_seq'),0,900,768,0,4,false,'Zaida the Apprentice','npc_zaida_the_apprentice.lua',1);

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

    QuestID = 76;
    -- NPC by PO Edward Cromwell, translated by Estralis Seborian
    -- Queststatus Overview
    -- 0: No Quest taken / Quest reset
    -- 1: NPC tells player to bring him some beer
    -- 2: NPC is willing to answer PC questions about the ruler, faction and the treacherous neighbours!
    -- Debugging
    AddTraderTrigger("set 0","Quest status set to 0");
    AddConsequence("qpg","=",0);
    AddTraderTrigger("set 1","Quest status set to 1");
    AddConsequence("qpg","=",1);
    AddTraderTrigger("set 2","Quest status set to 2");
    AddConsequence("qpg","=",2);
    -- Cycletext:
    AddCycleText("Nur in Runewick kann man einer intelligenten Diskussion fröhnen. In Galmair wird man eher ausgeraubt und in Cadomyr haben sie nur Sand im Kopf.","Only in Runewick it is possible to enjoy the delights of an intelligent discussion. In Galmair they are trying to rob you, and Cadomyrians have... sand for brains.");
    AddCycleText("#me blättert gedankenverloren in einem alten Buch. Sie starrt dabei auf ein leeres Weinglas, das leer erscheint.","#me absently turns the page of an old journal, while glancing at a glass of wine that seems to be empty.");
    AddCycleText("#me räuspert sich: 'Wirt, etwas mehr Wein, bitte... Wirt? Bei den Göttern!","#me clears her throat: 'Innkeeper, more wine, please... Innkeeper? Gods.'");
    AddCycleText("#me ist eine junge Dame, gekleidet in der Tracht einer angehenden Magierin. Ihre Kleidung trägt das Wappen Runewicks. 'Ich weiß alles über Runewick.' murmelt sie vor sich hin.","#me is a young woman, wearing the attire of an aspiring mage. Her clothes bear the colours of Runewick. 'I know everything about Runewick', she mutters.");
    AddCycleText("#me tippt mit ihren langen Fingernägeln gegen ihr leeres Glas, ein hohles, klirrendes Geräusch ist zu vernehmen.","#me absently taps on the side of her empty glass with her long fingernail, causing a faint, hollow sound to be heard.");
    AddCycleText("#me murmelt genervt: 'Wenn ich es nicht besser wüßte, könnte man meinen, der Wirt wäre noch so ein Halunke aus Galmair mit Dung in den Ohren.","#me mutters with an irritated voice: 'I swear that if I did not already know better, I would be certain that the innkeeper is another Galmairian crook with his ears full of manure.'");
    AddCycleText("#me lässt ihre Augen hochmütig durch die Taverne wandern. Jedem, der ihr fremd erscheint, wirft sie einen Blick mit einer Mischung aus Neugierde und Misstrauen zu.","#me glances around the tavern with an air of haught surrounding her, eyeing all those who appear foreign with a gaze that is mixed with both curiosity and suspicion.'");
    -- First part, the gossiper is thirsty
    AddTraderTrigger("Hello","#me nods her head respectfully: 'Be greeted, traveler. Should you wish to join my company, you must first bring me a glass filled with wine. Then, if it still pleases you, we may discuss.'");
    AddAdditionalTrigger("Greetings");
    AddAdditionalTrigger("Be greeted");
    AddAdditionalTrigger("Hail");
    AddAdditionalTrigger("Good day");
    AddAdditionalTrigger("Good morning");
    AddAdditionalTrigger("Good evening");
    AddCondition("qpg","=",0);
    AddConsequence("qpg","=",1);
    AddConsequence("inform","[New quest] Runewick's Gossiper");
    AddTraderTrigger("Hello","#me nods respectfully: 'Greetings. Now that you have fulfilled my request, you may disturb me with your presence and bother me with your questions.'");
    AddAdditionalTrigger("Greetings");
    AddAdditionalTrigger("Be greeted");
    AddAdditionalTrigger("Hail");
    AddAdditionalTrigger("Good day");
    AddAdditionalTrigger("Good morning");
    AddAdditionalTrigger("Good evening");
    AddCondition("qpg","=",2);
    AddTraderTrigger("Hiho","#me's lips form a somewhat condescending smile. 'Greetings, traveler. Should you wish to ask me something, you must first bring me a glass full of wine.'");
    AddAdditionalTrigger("Hallo");
    AddAdditionalTrigger("Hey");
    AddAdditionalTrigger("Greebas");
    AddAdditionalTrigger("Greebs");
    AddCondition("lang","english");
    AddCondition("qpg","=",0);
    AddConsequence("qpg","=",1);
    AddConsequence("inform","[New quest] Runewick's Gossiper");
    AddTraderTrigger("Hiho","#me nods once. 'Very well, now that you have done your part, I presume that I must do mine as well...'");
    AddAdditionalTrigger("Hallo");
    AddAdditionalTrigger("Hey");
    AddAdditionalTrigger("Greebas");
    AddAdditionalTrigger("Greebs");
    AddCondition("lang","english");
    AddCondition("qpg","=",2);
    AddTraderTrigger("How are you","#me frowns and brushes over the front of her apprentice's robe. 'I feel thirsty. Until I have a glas full of wine, I will not be much of assistance for you.'");
    AddAdditionalTrigger("How feel");
    AddAdditionalTrigger("How do you do");
    AddCondition("qpg","=",0);
    AddConsequence("qpg","=",1);
    AddConsequence("inform","[New quest] Runewick's Gossiper");
    AddTraderTrigger("How are you","I feel reinvigorated, thank you for asking.");
    AddAdditionalTrigger("How feel");
    AddAdditionalTrigger("How do you do");
    AddCondition("qpg","=",2);
    AddTraderTrigger("quest","#me smiles in a slightly condescending way. 'A task? I give you a most demanding one; Fetch me a glass of wine and as a reward for your quest, I shall answer your questions.'");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",0);
    AddCondition("lang","english");
    AddConsequence("qpg","=",1);
    AddConsequence("inform","[New quest] Runewick's Gossiper");
    AddTraderTrigger("quest","Now it is your turn to ask what you wish to know, traveler. I know all about the town.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",2);
    AddCondition("lang","english");
    AddTraderTrigger("quest","#me points at the innkeeper. 'Bring me a glass of wine, and I answer your questions. Should be simple enough, I presume.'");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",1);
    AddCondition("lang","english");
    AddTraderTrigger("task","#me smiles in a slightly condescending way. 'A task? I give you a most demanding one; Fetch me a glass of wine and as a reward for your quest, I shall answer your questions.'");
    AddAdditionalTrigger("adventure");
    AddAdditionalTrigger("question");
    AddCondition("qpg","=",0);
    AddConsequence("qpg","=",1);
    AddConsequence("inform","[New quest] Runewick's Gossiper");
    AddTraderTrigger("task","Now it is your turn to ask what you wish to know, traveler. I know all about the town.");
    AddAdditionalTrigger("adventure");
    AddAdditionalTrigger("question");
    AddCondition("qpg","=",2);
    AddTraderTrigger("task","#me points at the innkeeper. 'Bring me a glass of wine, and I answer your questions. Should be simple enough, I presume.'");
    AddAdditionalTrigger("what");
    AddAdditionalTrigger("question");
    AddCondition("qpg","=",1);
    AddTraderTrigger("Farewell","Until next time, traveler!");
    AddAdditionalTrigger("Good bye");
    AddAdditionalTrigger("Bye");
    AddAdditionalTrigger("Fare thy well");
    AddTraderTrigger("Ciao","Farewell, traveler!");
    AddAdditionalTrigger("Adieu");
    AddAdditionalTrigger("Au revoir");
    AddCondition("lang","english");
    AddTraderTrigger("Grüße","#me nickt respektvoll mit dem Kopf: 'Seid gegrüßt, Reisender. Wenn ihr meine Gesellschaft genießen wollt, so bringt mir doch ein Glas Wein zunächst. Dann, wenn ihr es noch wünscht, können wir diskutieren.'");
    AddAdditionalTrigger("Gruß");
    AddAdditionalTrigger("Seid gegrüßt");
    AddAdditionalTrigger("Guten Tag");
    AddAdditionalTrigger("Guten Abend");
    AddAdditionalTrigger("Mahlzeit");
    AddAdditionalTrigger("Tach");
    AddAdditionalTrigger("Moin");
    AddCondition("qpg","=",0);
    AddConsequence("qpg","=",1);
    AddConsequence("inform","[Neues Quest] Die Schwätzerin von Runewick");
    AddTraderTrigger("Grüße","#me nickt respektvoll: 'Seid gegrüßt. Nun, da ihr meiner Bitte entsprochen habt, könnt ihr mich mit eurer Anwesenheit belästigen und mich mit euren Fragen nerven.'");
    AddAdditionalTrigger("Gruß");
    AddAdditionalTrigger("Seid gegrüßt");
    AddAdditionalTrigger("Guten Tag");
    AddAdditionalTrigger("Guten Abend");
    AddAdditionalTrigger("Mahlzeit");
    AddAdditionalTrigger("Tach");
    AddAdditionalTrigger("Moin");
    AddCondition("qpg","=",2);
    AddTraderTrigger("Hiho","#me lächelt herablassend. 'Seid gegrüßt, Reisender. Solltet ihr mich etwas fragen wollen, so müsst ihr mir zunächst ein Glas Wein bringen.'");
    AddAdditionalTrigger("Hallo");
    AddAdditionalTrigger("Hey");
    AddAdditionalTrigger("Greebas");
    AddAdditionalTrigger("Greebs");
    AddCondition("lang","german");
    AddCondition("qpg","=",0);
    AddConsequence("qpg","=",1);
    AddConsequence("inform","[Neues Quest] Die Schwätzerin von Runewick");
    AddTraderTrigger("Hiho","#me nickt knapp. 'Nun denn, da ihr euren Teil der Abmachung eingehalten habt, ist es nun an mir, meinen Teil zu leisten.'");
    AddAdditionalTrigger("Hallo");
    AddAdditionalTrigger("Hey");
    AddAdditionalTrigger("Greebas");
    AddAdditionalTrigger("Greebs");
    AddCondition("lang","german");
    AddCondition("qpg","=",2);
    AddTraderTrigger("Wie geht","#me blickt missbilligend drein und streicht über ihre Anwärterinnenrobe. 'Ich bin durstig. Solange ich kein Glas voll Wein habe, kann ich euch nicht wirklich beistehen.");
    AddAdditionalTrigger("Wie fühlst");
    AddAdditionalTrigger("Wie ist es ergangen");
    AddCondition("qpg","=",0);
    AddConsequence("qpg","=",1);
    AddConsequence("inform","[Neues Quest] Die Schwätzerin von Runewick");
    AddTraderTrigger("Wie geht","Ich fühle mich wie neu geboren, danke der Nachfrage.");
    AddAdditionalTrigger("Wie fühlst");
    AddAdditionalTrigger("Wie ist es ergangen");
    AddCondition("qpg","=",2);
    AddTraderTrigger("quest","#me lächelt etwas herablassend. 'Eine Aufgabe? Ich gebe euch die schwerste von allen; Bringt mir ein Glas Wein und als Belohnung für eure Mühen werde ich eure Fragen beantworten.'");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",0);
    AddCondition("lang","german");
    AddConsequence("qpg","=",1);
    AddConsequence("inform","[Neues Quest] Die Schwätzerin von Runewick");
    AddTraderTrigger("quest","Nun ist es an euch, die Dinge zu erfragen, die ihr wissen wollt. Denn ich kenne mich wahrhaftig gut in der Stadt aus.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",2);
    AddCondition("lang","german");
    AddTraderTrigger("quest","#me deutet auf den Wirt. 'Bringt mir ein Glas Wein und ich werde eure Fragen beantworten. Sollte nicht allzu schwer sein, möchte man meinen.'");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",1);
    AddCondition("lang","german");
    AddTraderTrigger("Aufgabe","#me lächelt etwas herablassend. 'Eine Aufgabe? Ich gebe euch die schwerste von allen; Bringt mir ein Glas Wein und als Belohnung für eure Mühen werde ich eure Fragen beantworten.'");
    AddAdditionalTrigger("Abenteuer");
    AddAdditionalTrigger("Frage");
    AddCondition("qpg","=",0);
    AddConsequence("qpg","=",1);
    AddConsequence("inform","[Neues Quest] Die Schwätzerin von Runewick");
    AddTraderTrigger("Aufgabe","Nun ist es an euch, die Dinge zu erfragen, die ihr wissen wollt. Denn ich kenne mich wahrhaftig gut in der Stadt aus.");
    AddAdditionalTrigger("Abenteuer");
    AddAdditionalTrigger("Frage");
    AddCondition("qpg","=",2);
    AddTraderTrigger("Aufgabe","#me deutet auf den Wirt. 'Bringt mir ein Glas Wein und ich werde eure Fragen beantworten. Sollte nicht allzu schwer sein, möchte man meinen.'");
    AddAdditionalTrigger("Abenteuer");
    AddAdditionalTrigger("Frage");
    AddCondition("qpg","=",1);
    AddTraderTrigger("Tschüß","Bis zum nächsten mal, Reisender.");
    AddAdditionalTrigger("Tschüss");
    AddAdditionalTrigger("Wiedersehen");
    AddAdditionalTrigger("Gehabt euch wohl");
    AddTraderTrigger("Ciao","Gehabt euch wohl, Reisender.");
    AddAdditionalTrigger("Adieu");
    AddAdditionalTrigger("Au revoir");
    AddCondition("lang","german");
    AddTraderTrigger("dein name","My name is Zaina. One day, I'll be a honourable magician, right now, I am just thirsty.");
    AddAdditionalTrigger("wer bist du");
    AddAdditionalTrigger("wer seid ihr");
    AddAdditionalTrigger("wie heißt");
    AddTraderTrigger("your name","Mein Name ist Zaina. Eines Tages werde ich eine ehrenhafte Magierin sein, jetzt bin ich aber erstmal durstig.");
    AddAdditionalTrigger("who are you");
    AddAdditionalTrigger("who art thou");
    -- bringing the wine
    AddTraderTrigger(".+","#me takes the glass and smiles: 'Thank you very much. Now that you have given me the wine, I can answer your questions... be they about the town, our archmage, Runewick or our neighbours - whom the gods should bless with pox.'");
    AddCondition("qpg","=",1);
    AddCondition("item",2057,"all",">",0);
    AddCondition("town","=","runewick");
    AddCondition("lang","english");
    AddConsequence("deleteitem",2057,1);
    AddConsequence("inform","[Quest solved] Zaida will now answer your questions. You advance in archmage Elvaine Morgan's favour.");
    AddConsequence("rankpoints","runewick","+",20);
    AddConsequence("qpg","=",2);
    AddTraderTrigger(".+","#me takes the glass and smiles: 'Thank you very much. Now that you have given me the wine, I can answer your questions.. be they about the town, our lady, runewick or our neighbours - whom the gods should bless with pox.'");
    AddCondition("qpg","=",1);
    AddCondition("item",2057,"all",">",0);
    AddCondition("lang","english");
    AddConsequence("deleteitem",2057,1);
    AddConsequence("inform","[Quest solved] Zaida will now answer your questions.");
    AddConsequence("qpg","=",2);
    AddTraderTrigger(".+","#me nimmt das Glas und lächelt: 'Vielen, vielen dank. Nun da ihr mir Wein gebracht habt, kann ich eure Fragen beantworten, sei es über die Stadt, den Erzmagier, Runewick oder unsere Nachbarn - denen die Götter die Pest schicken mögen.'");
    AddCondition("qpg","=",1);
    AddCondition("item",2057,"all",">",0);
    AddCondition("town","=","runewick");
    AddCondition("lang","german");
    AddConsequence("deleteitem",2057,1);
    AddConsequence("inform","[Quest solved] Zaida wird nun deine Fragen beantworten. Dein Ansehen bei Erzmagier Elvaine Morgan steigt.");
    AddConsequence("rankpoints","runewick","+",20);
    AddConsequence("qpg","=",2);
    AddTraderTrigger(".+","#me nimmt das Glas und lächelt: 'Vielen, vielen dank. Nun da ihr mir Wein gebracht habt, kann ich eure Fragen beantworten, sei es über die Stadt, den Erzmagier, Runewick oder unsere Nachbarn - denen die Götter die Pest schicken mögen.'");
    AddCondition("qpg","=",1);
    AddCondition("item",2057,"all",">",0);
    AddCondition("lang","german");
    AddConsequence("deleteitem",2057,1);
    AddConsequence("inform","[Quest solved] Zaida wird nun deine Fragen beantworten.");
    AddConsequence("qpg","=",2);
    AddTraderTrigger(".+","Where is my wine?");
    AddCondition("qpg","=",1);
    AddCondition("item",2057,"all","<",1);
    AddCondition("lang","english");
    AddTraderTrigger(".+","Wo bleibt mein Wein?");
    AddCondition("qpg","=",1);
    AddCondition("item",2057,"all","<",1);
    AddCondition("lang","german");
    -- Questions (english)
    AddTraderTrigger("town","#me smiles: 'This town is one where the clear minds may learn and become wise amongst their peers. We are the pinnacle of knowledge, a beacon of civilization in the land. All thanks to the wisdom of Archmage Morgan.'");
    AddCondition("qpg","=",2);
    AddTraderTrigger("Archmage","Elvaine Morgan, the Archmage of Runewick is our wise and glorious leaders. He is of both high birth and intellect, which is hardly what can be said of the so called 'leaders' of the other towns!");
    AddCondition("qpg","=",2);
    AddTraderTrigger("Elvaine","#me casts a light smile at you. 'I see that you have been keeping your ears open, very good. He is indeed the guiding hand and protecting lion of our orderly community.'");
    AddAdditionalTrigger("Morgan");
    AddCondition("qpg","=",2);
    AddCondition("lang","english");
    AddTraderTrigger("knowledge","Knowledge and wisdom are the two most important qualities of a person. The sharpness of one's mind and the judgment to use the mind well are the true makers of a great man... or a woman.");
    AddAdditionalTrigger("wisdom");
    AddCondition("qpg","=",2);
    AddTraderTrigger("god","We are faithful servants of the gods here in Runewick. Of course, we avoid the foolish fanaticsm of Cadomyr. We should be free to pursuit knowledge, not stagnation.");
    AddCondition("qpg","=",2);
    AddTraderTrigger("like[s]","Our Archmage likes order... so behave yourself and he will bless you with his kindness. Altough, I must admit that he has a weakness for magical trinkets and books.");
    AddCondition("qpg","=",2);
    AddTraderTrigger("gift","A Gift? For the Archmage? Well, if you manage to find a rare book or a magical artifact, then I think such extraordinary items are what please him the most.");
    AddCondition("qpg","=",2);
    AddTraderTrigger("wine","#me smiles lightly: 'My thanks for the wine, traveler. Do you have some questions you wish that I answer?'");
    AddCondition("qpg","=",2);
    AddTraderTrigger("neighbo","#me frowns displeased: 'May the gods damn Cadomyr and Galmair, those treacherous, land-stealing fools!'");
    AddCondition("qpg","=",2);
    AddTraderTrigger("Galmair","#me appears disgusted at the name. 'A den of sin and vice, where a wise person will always keep his back against a wall. Those scoundrels will either rob or sell their grandmother for two coppers if they have the chance!'");
    AddCondition("qpg","=",2);
    AddCondition("lang","english");
    AddTraderTrigger("apprentice","I am indeed an apprentice-mage, but I can speak no more about that without upsetting my master.");
    AddCondition("qpg","=",2);
    AddTraderTrigger("Runewick","Runewick, our shining pearl of the land! We are the thinkers, the rightful lords and owners of this land. One day we will show those filthy squatters their rightful place!");
    AddCondition("qpg","=",2);
    AddCondition("lang","english");
    AddTraderTrigger("Cadomyr","Simple-minded fools, who have spent so much time in the desert that the scorching sun has fried their brains. They can only grasp... very rudimentary ideas and concepts, and thus you see the halfwits only dribble about honour.");
    AddCondition("qpg","=",2);
    AddCondition("lang","english");
    -- Questions (german)
    AddTraderTrigger("Stadt","#me lächelt: 'Diese Stadt ist Ort, an dem erleuchtete Seelen lernen und weise werden können. Wir sind die Zinne des Wissens, der Leuchtturm der Zivilisation in diesen Landen. All das verdanken wir Erzmagier Morgan.'");
    AddCondition("qpg","=",2);
    AddTraderTrigger("Erzmagier","Elvaine Morgan, Erzmagier von Runewick, ist unser weiser und glorreicher Anführer. Hochgeboren und mit Weisheit ausgestatten, dies kann man kaum von den anderen so genannten 'Anführern' der anderen Städte behaupten.");
    AddCondition("qpg","=",2);
    AddTraderTrigger("Elvaine","#me wirft dir ein Lächeln zu: 'Ich sehe, ihr habt eure Ohren offen gehalten, sehr gut. Er ist wirklich die führende Hand und der schützende Löwe unserer wohlgeordneten Gemeinschaft.'");
    AddAdditionalTrigger("Morgan");
    AddCondition("qpg","=",2);
    AddCondition("lang","german");
    AddTraderTrigger("wissen","Wissen und Weisheit sind die beiden wichtigstens Eigenschaften einer Person. Die Schärfe des Verstandes und das Können, den Verstand auch einzusetzen sind die wahren Adelszeichen eines Mannes... oder einer Frau.");
    AddAdditionalTrigger("weisheit");
    AddCondition("qpg","=",2);
    AddCondition("lang","german");
    AddTraderTrigger("gott","Wir sind fromme Diener der Götter hier in Runewick. Selbstredend vermeiden wir den blinden Fanatismus derer aus Cadomyr. Wir sollten alle frei sein, der Weisheit nachzutrachten, nicht aber in Stagnation verfallen.");
    AddAdditionalTrigger("götter");
    AddCondition("qpg","=",2);
    AddTraderTrigger("Vorliebe","Unser Erzmagier mag die Ordnung. Also behnehmt euch und er wird euch mit Wohlwollen segnen. Allerdings muss ich eingestehen, dass er eine Vorliebe für magische Dinge und Bücher hat.");
    AddCondition("qpg","=",2);
    AddTraderTrigger("geschenk","Ein Geschenk? Für den Erzmagier? Nun, wenn ihr ein seltenes Buch oder ein magisches Artefakt findet, dann denke ich, dass so ein seltenes Etwas ihm sehe gefallen würde.");
    AddAdditionalTrigger("präsent");
    AddCondition("qpg","=",2);
    AddTraderTrigger("Wein","#me lächelt sanft: 'Vielen Dank für den Wein, Reisender. Habt ihr Fragen, die ich euch beantworten kann?'");
    AddCondition("qpg","=",2);
    AddTraderTrigger("Nachbar","#me zischt missbilligend: 'Mögen die Götter Cadomyr und Galmair, diese verräterischen Landdiebe, verdammen!'");
    AddCondition("qpg","=",2);
    AddTraderTrigger("Galmair","#me blickt angewidert drein. 'Ein Hort der Sünde und des Lasters, wo eine weise Person stets ihren Rücken von einer Mauer gedeckt weiß. Diese Hunde werden einen entweder ausrauben or ihre Großmutter für zwei Kupferstücke verkaufen.'");
    AddCondition("qpg","=",2);
    AddCondition("lang","german");
    AddTraderTrigger("anwärter","Ich bin in der Tat eine Anwärterin der Magierschaft, aber ich sollte darüber nicht mehr sprechen, als meinem Meister lieb ist.");
    AddCondition("qpg","=",2);
    AddTraderTrigger("Runewick","Runewick, die strahlende Perle des Landes! Wir sind die Denker und rechtmäßigen Herren der Ländereien. Eines Tages werden wir diesen dreckigen Tunichtguten ihren rechtmäßigen Platz zuweisen.");
    AddCondition("qpg","=",2);
    AddCondition("lang","german");
    AddTraderTrigger("Cadomyr","Törrichte Tore, die so lange in der Wüste rumgestanden haben, bis die sengende Sonne ihnen das Hirn verbrannt hat. Sie verstehen nur sehr einfache Konzepte und Ideen, daher brabbeln sie nur halbherzig von ihrer Ehre.");
    AddCondition("qpg","=",2);
    AddCondition("lang","german");
    -- Small talk--
    AddTraderTrigger("profession","I spend my days studying, so that one day I may claim the title of a mage.");
    AddTraderTrigger("tavern","Good wine, lousy service... as you may have noticed.");
    AddCondition("lang","english");
    AddTraderTrigger("beruf","Ich verbringe meine Tage damit, zu studieren, damit ich einst den Titel eines Magiers führen darf.");
    AddTraderTrigger("tavern","Guter Wein, aber schlechter Service. Aber das habt ihr wohl selbst auch schon festgestellt.");
    -- Help
    AddTraderTrigger("help","");
    AddConsequence("inform","[Game help] This NPC is Zaida the Apprentice. To learn more about her, your should greet the NPC first.");
    AddTraderTrigger("Hilfe","");
    AddConsequence("inform","[Spielhilfe] Dieser NPC ist die Anwärterin Zaida. Um mehr über sie zu erfahren, grüße sie zunächst.");
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
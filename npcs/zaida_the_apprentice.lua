-- INSERT INTO npc VALUES (nextval('npc_seq'),0,900,768,0,4,false,'Zaida the Apprentice','npc_zaida_the_apprentice.lua',1);

require("npcs.base.autonpcfunctions")
module("npcs.zaida_the_apprentice")

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

    QuestID = 76;
    -- NPC by PO Edward Cromwell, translated by Estralis Seborian
    -- Queststatus Overview
    -- 0: No Quest taken / Quest reset
    -- 1: NPC tells player to bring him some beer
    -- 2: NPC is willing to answer PC questions about the ruler, faction and the treacherous neighbours!
    -- Debugging
    npcs.base.autonpcfunctions.AddTraderTrigger("set 0","Quest status set to 0");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",0);
    npcs.base.autonpcfunctions.AddTraderTrigger("set 1","Quest status set to 1");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("set 2","Quest status set to 2");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",2);
    -- Cycletext:
    npcs.base.autonpcfunctions.AddCycleText("Nur in Runewick kann man einer intelligenten Diskussion fröhnen. In Galmair wird man eher ausgeraubt und in Cadomyr haben sie nur Sand im Kopf.","Only in Runewick it is possible to enjoy the delights of an intelligent discussion. In Galmair they are trying to rob you, and Cadomyrians have... sand for brains.");
    npcs.base.autonpcfunctions.AddCycleText("#me blättert gedankenverloren in einem alten Buch. Sie starrt dabei auf ein leeres Weinglas, das leer erscheint.","#me absently turns the page of an old journal, while glancing at a glass of wine that seems to be empty.");
    npcs.base.autonpcfunctions.AddCycleText("#me räuspert sich: 'Wirt, etwas mehr Wein, bitte... Wirt? Bei den Göttern!","#me clears her throat: 'Innkeeper, more wine, please... Innkeeper? Gods.'");
    npcs.base.autonpcfunctions.AddCycleText("#me ist eine junge Dame, gekleidet in der Tracht einer angehenden Magierin. Ihre Kleidung trägt das Wappen Runewicks. 'Ich weiß alles über Runewick.' murmelt sie vor sich hin.","#me is a young woman, wearing the attire of an aspiring mage. Her clothes bear the colours of Runewick. 'I know everything about Runewick', she mutters.");
    npcs.base.autonpcfunctions.AddCycleText("#me tippt mit ihren langen Fingernägeln gegen ihr leeres Glas, ein hohles, klirrendes Geräusch ist zu vernehmen.","#me absently taps on the side of her empty glass with her long fingernail, causing a faint, hollow sound to be heard.");
    npcs.base.autonpcfunctions.AddCycleText("#me murmelt genervt: 'Wenn ich es nicht besser wüßte, könnte man meinen, der Wirt wäre noch so ein Halunke aus Galmair mit Dung in den Ohren.","#me mutters with an irritated voice: 'I swear that if I did not already know better, I would be certain that the innkeeper is another Galmairian crook with his ears full of manure.'");
    npcs.base.autonpcfunctions.AddCycleText("#me lässt ihre Augen hochmütig durch die Taverne wandern. Jedem, der ihr fremd erscheint, wirft sie einen Blick mit einer Mischung aus Neugierde und Misstrauen zu.","#me glances around the tavern with an air of haught surrounding her, eyeing all those who appear foreign with a gaze that is mixed with both curiosity and suspicion.'");
    -- First part, the gossiper is thirsty
    npcs.base.autonpcfunctions.AddTraderTrigger("Hello","#me nods her head respectfully: 'Be greeted, traveler. Should you wish to join my company, you must first bring me a glass filled with wine. Then, if it still pleases you, we may discuss.'");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greetings");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Be greeted");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hail");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good day");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good morning");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good evening");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",0);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("inform","[New quest] Runewick's Gossiper");
    npcs.base.autonpcfunctions.AddTraderTrigger("Hello","#me nods respectfully: 'Greetings. Now that you have fulfilled my request, you may disturb me with your presence and bother me with your questions.'");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greetings");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Be greeted");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hail");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good day");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good morning");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good evening");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("Hiho","#me's lips form a somewhat condescending smile. 'Greetings, traveler. Should you wish to ask me something, you must first bring me a glass full of wine.'");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",0);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("inform","[New quest] Runewick's Gossiper");
    npcs.base.autonpcfunctions.AddTraderTrigger("Hiho","#me nods once. 'Very well, now that you have done your part, I presume that I must do mine as well...'");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("How are you","#me frowns and brushes over the front of her apprentice's robe. 'I feel thirsty. Until I have a glas full of wine, I will not be much of assistance for you.'");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("How feel");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("How do you do");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",0);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("inform","[New quest] Runewick's Gossiper");
    npcs.base.autonpcfunctions.AddTraderTrigger("How are you","I feel reinvigorated, thank you for asking.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("How feel");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("How do you do");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","#me smiles in a slightly condescending way. 'A task? I give you a most demanding one; Fetch me a glass of wine and as a reward for your quest, I shall answer your questions.'");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",0);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("inform","[New quest] Runewick's Gossiper");
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Now it is your turn to ask what you wish to know, traveler. I know all about the town.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","#me points at the innkeeper. 'Bring me a glass of wine, and I answer your questions. Should be simple enough, I presume.'");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("task","#me smiles in a slightly condescending way. 'A task? I give you a most demanding one; Fetch me a glass of wine and as a reward for your quest, I shall answer your questions.'");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("question");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",0);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("inform","[New quest] Runewick's Gossiper");
    npcs.base.autonpcfunctions.AddTraderTrigger("task","Now it is your turn to ask what you wish to know, traveler. I know all about the town.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("question");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("task","#me points at the innkeeper. 'Bring me a glass of wine, and I answer your questions. Should be simple enough, I presume.'");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("what");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("question");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("Farewell","Until next time, traveler!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good bye");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Bye");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Fare thy well");
    npcs.base.autonpcfunctions.AddTraderTrigger("Ciao","Farewell, traveler!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Grüße","#me nickt respektvoll mit dem Kopf: 'Seid gegrüßt, Reisender. Wenn ihr meine Gesellschaft genießen wollt, so bringt mir doch ein Glas Wein zunächst. Dann, wenn ihr es noch wünscht, können wir diskutieren.'");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Gruß");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Seid gegrüßt");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Guten Tag");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Guten Abend");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Mahlzeit");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Tach");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Moin");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",0);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Die Schwätzerin von Runewick");
    npcs.base.autonpcfunctions.AddTraderTrigger("Grüße","#me nickt respektvoll: 'Seid gegrüßt. Nun, da ihr meiner Bitte entsprochen habt, könnt ihr mich mit eurer Anwesenheit belästigen und mich mit euren Fragen nerven.'");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Gruß");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Seid gegrüßt");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Guten Tag");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Guten Abend");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Mahlzeit");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Tach");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Moin");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("Hiho","#me lächelt herablassend. 'Seid gegrüßt, Reisender. Solltet ihr mich etwas fragen wollen, so müsst ihr mir zunächst ein Glas Wein bringen.'");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",0);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Die Schwätzerin von Runewick");
    npcs.base.autonpcfunctions.AddTraderTrigger("Hiho","#me nickt knapp. 'Nun denn, da ihr euren Teil der Abmachung eingehalten habt, ist es nun an mir, meinen Teil zu leisten.'");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("Wie geht","#me blickt missbilligend drein und streicht über ihre Anwärterinnenrobe. 'Ich bin durstig. Solange ich kein Glas voll Wein habe, kann ich euch nicht wirklich beistehen.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Wie fühlst");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Wie ist es ergangen");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",0);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Die Schwätzerin von Runewick");
    npcs.base.autonpcfunctions.AddTraderTrigger("Wie geht","Ich fühle mich wie neu geboren, danke der Nachfrage.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Wie fühlst");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Wie ist es ergangen");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","#me lächelt etwas herablassend. 'Eine Aufgabe? Ich gebe euch die schwerste von allen; Bringt mir ein Glas Wein und als Belohnung für eure Mühen werde ich eure Fragen beantworten.'");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",0);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Die Schwätzerin von Runewick");
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Nun ist es an euch, die Dinge zu erfragen, die ihr wissen wollt. Denn ich kenne mich wahrhaftig gut in der Stadt aus.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","#me deutet auf den Wirt. 'Bringt mir ein Glas Wein und ich werde eure Fragen beantworten. Sollte nicht allzu schwer sein, möchte man meinen.'");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("Aufgabe","#me lächelt etwas herablassend. 'Eine Aufgabe? Ich gebe euch die schwerste von allen; Bringt mir ein Glas Wein und als Belohnung für eure Mühen werde ich eure Fragen beantworten.'");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Frage");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",0);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Die Schwätzerin von Runewick");
    npcs.base.autonpcfunctions.AddTraderTrigger("Aufgabe","Nun ist es an euch, die Dinge zu erfragen, die ihr wissen wollt. Denn ich kenne mich wahrhaftig gut in der Stadt aus.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Frage");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("Aufgabe","#me deutet auf den Wirt. 'Bringt mir ein Glas Wein und ich werde eure Fragen beantworten. Sollte nicht allzu schwer sein, möchte man meinen.'");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Frage");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("Tschüß","Bis zum nächsten mal, Reisender.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Tschüss");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Wiedersehen");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Gehabt euch wohl");
    npcs.base.autonpcfunctions.AddTraderTrigger("Ciao","Gehabt euch wohl, Reisender.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("dein name","My name is Zaina. One day, I'll be a honourable magician, right now, I am just thirsty.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wer bist du");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wer seid ihr");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wie heißt");
    npcs.base.autonpcfunctions.AddTraderTrigger("your name","Mein Name ist Zaina. Eines Tages werde ich eine ehrenhafte Magierin sein, jetzt bin ich aber erstmal durstig.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("who are you");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("who art thou");
    -- bringing the wine
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","#me takes the glass and smiles: 'Thank you very much. Now that you have given me the wine, I can answer your questions... be they about the town, our archmage, Runewick or our neighbours - whom the gods should bless with pox.'");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddCondition("item",2057,"all",">",0);
    npcs.base.autonpcfunctions.AddCondition("town","=","runewick");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("deleteitem",2057,1);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Quest solved] Zaida will now answer your questions. You advance in archmage Elvaine Morgan's favour.");
    npcs.base.autonpcfunctions.AddConsequence("rankpoints","runewick","+",20);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","#me takes the glass and smiles: 'Thank you very much. Now that you have given me the wine, I can answer your questions.. be they about the town, our lady, runewick or our neighbours - whom the gods should bless with pox.'");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddCondition("item",2057,"all",">",0);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("deleteitem",2057,1);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Quest solved] Zaida will now answer your questions.");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","#me nimmt das Glas und lächelt: 'Vielen, vielen dank. Nun da ihr mir Wein gebracht habt, kann ich eure Fragen beantworten, sei es über die Stadt, den Erzmagier, Runewick oder unsere Nachbarn - denen die Götter die Pest schicken mögen.'");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddCondition("item",2057,"all",">",0);
    npcs.base.autonpcfunctions.AddCondition("town","=","runewick");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddConsequence("deleteitem",2057,1);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Quest solved] Zaida wird nun deine Fragen beantworten. Dein Ansehen bei Erzmagier Elvaine Morgan steigt.");
    npcs.base.autonpcfunctions.AddConsequence("rankpoints","runewick","+",20);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","#me nimmt das Glas und lächelt: 'Vielen, vielen dank. Nun da ihr mir Wein gebracht habt, kann ich eure Fragen beantworten, sei es über die Stadt, den Erzmagier, Runewick oder unsere Nachbarn - denen die Götter die Pest schicken mögen.'");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddCondition("item",2057,"all",">",0);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddConsequence("deleteitem",2057,1);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Quest solved] Zaida wird nun deine Fragen beantworten.");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Where is my wine?");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddCondition("item",2057,"all","<",1);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Wo bleibt mein Wein?");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddCondition("item",2057,"all","<",1);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    -- Questions (english)
    npcs.base.autonpcfunctions.AddTraderTrigger("town","#me smiles: 'This town is one where the clear minds may learn and become wise amongst their peers. We are the pinnacle of knowledge, a beacon of civilization in the land. All thanks to the wisdom of Archmage Morgan.'");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("Archmage","Elvaine Morgan, the Archmage of Runewick is our wise and glorious leaders. He is of both high birth and intellect, which is hardly what can be said of the so called 'leaders' of the other towns!");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("Elvaine","#me casts a light smile at you. 'I see that you have been keeping your ears open, very good. He is indeed the guiding hand and protecting lion of our orderly community.'");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Morgan");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("knowledge","Knowledge and wisdom are the two most important qualities of a person. The sharpness of one's mind and the judgment to use the mind well are the true makers of a great man... or a woman.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wisdom");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("god","We are faithful servants of the gods here in Runewick. Of course, we avoid the foolish fanaticsm of Cadomyr. We should be free to pursuit knowledge, not stagnation.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("like[s]","Our Archmage likes order... so behave yourself and he will bless you with his kindness. Altough, I must admit that he has a weakness for magical trinkets and books.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("gift","A Gift? For the Archmage? Well, if you manage to find a rare book or a magical artifact, then I think such extraordinary items are what please him the most.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("wine","#me smiles lightly: 'My thanks for the wine, traveler. Do you have some questions you wish that I answer?'");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("neighbo","#me frowns displeased: 'May the gods damn Cadomyr and Galmair, those treacherous, land-stealing fools!'");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("Galmair","#me appears disgusted at the name. 'A den of sin and vice, where a wise person will always keep his back against a wall. Those scoundrels will either rob or sell their grandmother for two coppers if they have the chance!'");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("apprentice","I am indeed an apprentice-mage, but I can speak no more about that without upsetting my master.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("Runewick","Runewick, our shining pearl of the land! We are the thinkers, the rightful lords and owners of this land. One day we will show those filthy squatters their rightful place!");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Cadomyr","Simple-minded fools, who have spent so much time in the desert that the scorching sun has fried their brains. They can only grasp... very rudimentary ideas and concepts, and thus you see the halfwits only dribble about honour.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    -- Questions (german)
    npcs.base.autonpcfunctions.AddTraderTrigger("Stadt","#me lächelt: 'Diese Stadt ist Ort, an dem erleuchtete Seelen lernen und weise werden können. Wir sind die Zinne des Wissens, der Leuchtturm der Zivilisation in diesen Landen. All das verdanken wir Erzmagier Morgan.'");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("Erzmagier","Elvaine Morgan, Erzmagier von Runewick, ist unser weiser und glorreicher Anführer. Hochgeboren und mit Weisheit ausgestatten, dies kann man kaum von den anderen so genannten 'Anführern' der anderen Städte behaupten.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("Elvaine","#me wirft dir ein Lächeln zu: 'Ich sehe, ihr habt eure Ohren offen gehalten, sehr gut. Er ist wirklich die führende Hand und der schützende Löwe unserer wohlgeordneten Gemeinschaft.'");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Morgan");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("wissen","Wissen und Weisheit sind die beiden wichtigstens Eigenschaften einer Person. Die Schärfe des Verstandes und das Können, den Verstand auch einzusetzen sind die wahren Adelszeichen eines Mannes... oder einer Frau.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("weisheit");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("gott","Wir sind fromme Diener der Götter hier in Runewick. Selbstredend vermeiden wir den blinden Fanatismus derer aus Cadomyr. Wir sollten alle frei sein, der Weisheit nachzutrachten, nicht aber in Stagnation verfallen.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("götter");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("Vorliebe","Unser Erzmagier mag die Ordnung. Also behnehmt euch und er wird euch mit Wohlwollen segnen. Allerdings muss ich eingestehen, dass er eine Vorliebe für magische Dinge und Bücher hat.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("geschenk","Ein Geschenk? Für den Erzmagier? Nun, wenn ihr ein seltenes Buch oder ein magisches Artefakt findet, dann denke ich, dass so ein seltenes Etwas ihm sehe gefallen würde.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("präsent");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("Wein","#me lächelt sanft: 'Vielen Dank für den Wein, Reisender. Habt ihr Fragen, die ich euch beantworten kann?'");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("Nachbar","#me zischt missbilligend: 'Mögen die Götter Cadomyr und Galmair, diese verräterischen Landdiebe, verdammen!'");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("Galmair","#me blickt angewidert drein. 'Ein Hort der Sünde und des Lasters, wo eine weise Person stets ihren Rücken von einer Mauer gedeckt weiß. Diese Hunde werden einen entweder ausrauben or ihre Großmutter für zwei Kupferstücke verkaufen.'");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("anwärter","Ich bin in der Tat eine Anwärterin der Magierschaft, aber ich sollte darüber nicht mehr sprechen, als meinem Meister lieb ist.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("Runewick","Runewick, die strahlende Perle des Landes! Wir sind die Denker und rechtmäßigen Herren der Ländereien. Eines Tages werden wir diesen dreckigen Tunichtguten ihren rechtmäßigen Platz zuweisen.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("Cadomyr","Törrichte Tore, die so lange in der Wüste rumgestanden haben, bis die sengende Sonne ihnen das Hirn verbrannt hat. Sie verstehen nur sehr einfache Konzepte und Ideen, daher brabbeln sie nur halbherzig von ihrer Ehre.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    -- Small talk--
    npcs.base.autonpcfunctions.AddTraderTrigger("profession","I spend my days studying, so that one day I may claim the title of a mage.");
    npcs.base.autonpcfunctions.AddTraderTrigger("tavern","Good wine, lousy service... as you may have noticed.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("beruf","Ich verbringe meine Tage damit, zu studieren, damit ich einst den Titel eines Magiers führen darf.");
    npcs.base.autonpcfunctions.AddTraderTrigger("tavern","Guter Wein, aber schlechter Service. Aber das habt ihr wohl selbst auch schon festgestellt.");
    -- Help
    npcs.base.autonpcfunctions.AddTraderTrigger("help","");
    npcs.base.autonpcfunctions.AddConsequence("inform","[Game help] This NPC is Zaida the Apprentice. To learn more about her, your should greet the NPC first.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Hilfe","");
    npcs.base.autonpcfunctions.AddConsequence("inform","[Spielhilfe] Dieser NPC ist die Anwärterin Zaida. Um mehr über sie zu erfahren, grüße sie zunächst.");
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
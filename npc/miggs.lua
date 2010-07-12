-- INSERT INTO npc VALUES (nextval('npc_seq'),1,374,216,0,4,false,'Miggs','npc_miggs.lua',0);

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

    QuestID = 77;
    -- NPC by Estralis Seborian
    -- Miggs, the henchman of the Don
    -- Queststatus Overview
    -- 0: No Quest taken
    -- 1: Quest 1 taken - kill 10 flies, player receives torch
    -- 2-11: Killing 10 flies
    -- 12: Quest 1 solved, reward: 100cp, +5 rankpoints
    -- 13: Quest 2 taken - kill 5 mummies
    -- 14-18: Killing 5 mummies
    -- 19: Quest 2 solved, reward: 100cp, ornate dagger, +10 rankpoints
    -- 20: Quest 3 taken - kill 1 halfling thief
    -- 21: Killing 1 halfling thief
    -- 22: Quest 3 solved, reward: steel gloves, +20 rankpoints
    -- Help
    AddTraderTrigger("Help","");
    AddConsequence("inform","[Game Help] This NPC is Miggs, the henchman of Don Valerio. Keyphrases: Hello, henchman, quest, Don Valerio, rules.");
    AddTraderTrigger("Hilfe","");
    AddConsequence("inform","[Spielhilfe] Dieser NPC ist Miggs, der Handlanger von Don Valerio. Schlüsselwörter: Hallo, Handlanger, Quest, Don Valerio, Regeln.");
    -- General speech
    AddTraderTrigger("Hello","G'day, did the Don send you?");
    AddAdditionalTrigger("Greetings");
    AddAdditionalTrigger("Be greeted");
    AddAdditionalTrigger("Hail");
    AddAdditionalTrigger("Good day");
    AddAdditionalTrigger("Good morning");
    AddAdditionalTrigger("Good evening");
    AddAdditionalText("So, you are the next bigshot of Galmair? Something makes me doubt that.");
    AddAdditionalText("What?! Make it quick.");
    AddTraderTrigger("Grüße","Tach, hat euch der Don geschickt?");
    AddAdditionalTrigger("Gruß");
    AddAdditionalTrigger("Seid gegrüßt");
    AddAdditionalTrigger("Guten Tag");
    AddAdditionalTrigger("Guten Abend");
    AddAdditionalTrigger("Mahlzeit");
    AddAdditionalTrigger("Tach");
    AddAdditionalTrigger("Moin");
    AddAdditionalText("So, ihr seid also der nächste Stern am Himmel Galmairs? Irgendwie kann ich das nicht recht glauben.");
    AddAdditionalText("Was!? Sprecht schnell.");
    AddTraderTrigger("Hiho","G'day, did the Don send you?");
    AddAdditionalTrigger("Hallo");
    AddAdditionalTrigger("Hey");
    AddAdditionalTrigger("Greebas");
    AddAdditionalTrigger("Greebs");
    AddCondition("lang","english");
    AddAdditionalText("So, you are the next bigshot of Galmair? Something makes me doubt that.");
    AddAdditionalText("What?! Make it quick.");
    AddTraderTrigger("Hiho","Tach, hat euch der Don geschickt?");
    AddAdditionalTrigger("Hallo");
    AddAdditionalTrigger("Hey");
    AddAdditionalTrigger("Greebas");
    AddAdditionalTrigger("Greebs");
    AddCondition("lang","german");
    AddAdditionalText("So, ihr seid also der nächste Stern am Himmel Galmairs? Irgendwie kann ich das nicht recht glauben.");
    AddAdditionalText("Was!? Sprecht schnell.");
    AddTraderTrigger("Farewell","Go and come back. But not too soon.");
    AddAdditionalTrigger("Good bye");
    AddAdditionalTrigger("Bye");
    AddAdditionalTrigger("Fare thee well");
    AddAdditionalText("Off!");
    AddAdditionalText("Get lost.");
    AddTraderTrigger("Tschüß","Geht und beehrt mich mal wieder. Aber nicht zu bald.");
    AddAdditionalTrigger("Tschüss");
    AddAdditionalTrigger("Wiedersehen");
    AddAdditionalTrigger("Gehabt euch wohl");
    AddAdditionalText("Hinfort!");
    AddAdditionalText("Haut ab.");
    AddTraderTrigger("Ciao","Go and come back. But not too soon.");
    AddAdditionalTrigger("Adieu");
    AddAdditionalTrigger("Au revoir");
    AddCondition("lang","english");
    AddAdditionalText("Off!");
    AddAdditionalText("Get lost.");
    AddTraderTrigger("Ciao","Geht und beehrt mich mal wieder. Aber nicht zu bald.");
    AddAdditionalTrigger("Adieu");
    AddAdditionalTrigger("Au revoir");
    AddCondition("lang","german");
    AddAdditionalText("Hinfort!");
    AddAdditionalText("Haut ab.");
    AddTraderTrigger("How are you","I feel like beating up somebody. Just give me a reason.");
    AddAdditionalTrigger("How feel");
    AddAdditionalTrigger("How do you do");
    AddAdditionalText("Four words: None of your business.");
    AddAdditionalText("My fist itches.");
    AddTraderTrigger("Wie geht","Mir ist danach, jemanden zu vermöbeln. Gebt mir nur einen Anlass.");
    AddAdditionalTrigger("Wie fühlst");
    AddAdditionalTrigger("Wie ist es ergangen");
    AddAdditionalText("Vier Worte: Geht euch nichts an.");
    AddAdditionalText("Meine Faust juckt.");
    AddTraderTrigger("your name","Miggs!");
    AddAdditionalTrigger("who are you");
    AddAdditionalTrigger("who art thou");
    AddAdditionalText("I am Miggs. And this is my fist. Me and her are looking forward to make your acquaintance.");
    AddAdditionalText("I am Miggs, the right hand... no, the right fist of Don Valerio.");
    AddTraderTrigger("dein name","Miggs!");
    AddAdditionalTrigger("wer bist du");
    AddAdditionalTrigger("wer seid ihr");
    AddAdditionalTrigger("wie heißt");
    AddAdditionalText("Ich bin Miggs. Und dies ist meine Faust. Ich und sie freuen uns darauf, deine Bekanntschaft zu machen.");
    AddAdditionalText("Ich bin Miggs, die rechte Hand... nein, die rechte Faust Don Valerios.");
    -- Catching typical NPC phrases
    AddTraderTrigger("what sell","I'm not a trader. You may give me your money, though.");
    AddAdditionalTrigger("what buy");
    AddAdditionalTrigger("list wares");
    AddAdditionalTrigger("price of");
    AddTraderTrigger("was verkauf","Ich bin kein Händler. Ihr könnt mir aber trotzdem euer Gold geben.");
    AddAdditionalTrigger("was kauf");
    AddAdditionalTrigger("warenliste");
    AddAdditionalTrigger("preis von");
    AddTraderTrigger("tell something","Let me tell you something: Never mess with the Don. Messing with him is just as bad as messing with me.");
    AddAdditionalText("Do you see any campfire here? No? So, no tales for you.");
    AddAdditionalText("Leave me alone.");
    AddTraderTrigger("erzähl was","Lasst euch das gesagt sein: Legt euch nie mit dem Don an. Das würde bedeuten, ihr bekommt es mit mir zu tun.");
    AddAdditionalTrigger("erzähl etwas");
    AddAdditionalText("Seht ihr hier irgendwo ein Lagerfeuer? Nein? Also, keine Märchen für euch!");
    AddAdditionalText("Haut ab.");
    -- Small talk: The talk here should focus on possible questions. Feel free to add more!
    AddTraderTrigger("profession","Some call me a henchman. I work for the Don; and I am good in what I do.");
    AddTraderTrigger("beruf","Manche nennen mich einen Handlanger. Ich arbeite für den Don; und ich bin gut darin, was ich mache.");
    AddTraderTrigger("job","Manche nennen mich einen Handlanger. Ich arbeite für den Don; und ich bin gut darin, was ich mache.");
    AddCondition("lang","german");
    AddTraderTrigger("job","Some call me a henchman. I work for the Don; and I am good in what I do.");
    AddCondition("lang","english");
    AddTraderTrigger("castle","Some say, this castle was once built by dwarves. I don't care at all!");
    AddTraderTrigger("Burg","Manche behaupten, diese Burg wurde einst von Zwergen erbaut. Das ist mir sowas von egal!");
    AddTraderTrigger("trader","In Galmair, you may trade whatever you want with whoever you want whenever you want.");
    AddAdditionalTrigger("merchant");
    AddAdditionalTrigger("collegue");
    AddAdditionalTrigger("vendor");
    AddAdditionalTrigger("market");
    AddAdditionalText("The market place is a good place to trade. It is outside. So... get out!");
    AddTraderTrigger("händler","In Galmair könnt ihr Handel treiben, was immer ihr wollt, mit wem ihr wollt und wann ihr es wollt.");
    AddAdditionalTrigger("kollege");
    AddAdditionalTrigger("höker");
    AddAdditionalTrigger("markt");
    AddAdditionalText("Der Marktplatz ist ein guter Ort, um Handeln zu treiben. Er ist draußen. Also... raus mit euch!");
    AddTraderTrigger("Gobaith","Grobian? Ihr nennt mich einen Grobian? Recht habt ihr!");
    AddAdditionalTrigger("Gobiath");
    AddCondition("lang","german");
    AddTraderTrigger("Gobaith","Ruffian? You call me a ruffian? You're so right!");
    AddAdditionalTrigger("Gobiath");
    -- More small talk; add at least five triggers
    AddTraderTrigger("henchman","I'm not a simple henchman. I'm a convincer. With irresistible arguments.");
    AddAdditionalTrigger("henchman");
    AddAdditionalTrigger("thug");
    AddTraderTrigger("halfling","Blasted halfers! They pickpocket all day long. Nothing wrong with that, but they should know from whom they may take.");
    AddTraderTrigger("hobbit","Blasted halfers! They pickpocket all day long. Nothing wrong with that, but they should know from whom they may take.");
    AddCondition("lang","english");
    AddTraderTrigger("fly","Blasted flies! They buzz all day long. Nothing wrong with that, but they should know who's head they may buzz around.");
    AddAdditionalTrigger("flies");
    AddTraderTrigger("mummy","Blasted mummies! They moan all day long. Nothing wrong with that, but they should know about they should not moan about.");
    AddAdditionalTrigger("mummies");
    AddTraderTrigger("dwarf","So, you think us dwarves kneel to a king, drink beer and dig for pebbles all day long? Bad guess!");
    AddAdditionalTrigger("dwarves");
    AddTraderTrigger("protection","Protection can be paid with money. The more money, the more protection. No money... bad idea.");
    AddAdditionalTrigger("fee");
    AddTraderTrigger("favour","Everyone in Galmair owes the Don a favour; some more than one. For the Don helps everyone, he is our godfather.");
    AddAdditionalTrigger("favor");
    AddTraderTrigger("Handlanger","Ich bin kein einfacher Handlanger. Ich bin ein Überzeugungskünstler - mit schlagenden Argumenten.");
    AddAdditionalTrigger("Gauner");
    AddTraderTrigger("halbling","Verdammte Halblinge! Sie stibitzen den ganzen Tag aus allen möglichen Taschen. Das wäre alleine nicht schlimm, doch sollten sie wissen, aus welchen Taschen sie ihre Finger raushalten sollten.");
    AddTraderTrigger("Hobbit","Verdammte Halblinge! Sie stibitzen den ganzen Tag aus allen möglichen Taschen. Das wäre alleine nicht schlimm, doch sollten sie wissen, aus welchen Taschen sie ihre Finger raushalten sollten.");
    AddTraderTrigger("Fliege","Verdammte Fliegen! Sie summen den ganzen Tag. Das alleine wäre nicht schlimm, doch sollten sie wissen, um welchen Kopf sie besser nicht herumsummen sollten.");
    AddTraderTrigger("Mumie","Verdammte Mumien! Sie stöhnen den ganzen Tag. Das alleine wäre nicht schlimm, doch sollten sie wissen, über was sie besser nicht stöhnen sollten.");
    AddTraderTrigger("Zwerg","So, ihr denkt also, wir Zwerge knien vor einem König, saufen Bier und buddeln den ganzen Tag nach Kieselsteinen? Falsch gedacht!");
    AddTraderTrigger("Schutzgeld","Sicherheit kann man erkaufen. Je mehr Geld, desto mehr Schutz. Kein Geld... Schlechte Idee.");
    AddAdditionalTrigger("Schutzgebühr");
    AddTraderTrigger("Gefallen","Jeder Galmair schuldet dem Don einen Gefallen, manche mehr als einen. Denn der Don hilft jedem, er ist unser Pate.");
    AddAdditionalTrigger("Gefälligkeit");
    -- Rules of the Don
    AddTraderTrigger("rules","1. The Don protects you if you pay the fee.");
    AddAdditionalText("2. Pay the toll and the interest and no harm will be done.");
    AddAdditionalText("3. Trade freely, stay and depart as you wish.");
    AddAdditionalText("4. Come to the Don if you need help. He is your godfather.");
    AddAdditionalText("5. A deal with the Don is a deal with your fate.");
    AddAdditionalText("6. If you did harm, compensate generously twice the damage.");
    AddTraderTrigger("Regeln","1. Der Don beschützt euch, wenn ihr die Gebühr bezahlt.");
    AddAdditionalText("2. Zahlt den Zoll und den Zins und kein Leid wird euch zugefügt.");
    AddAdditionalText("3. Handelt frei, kommt und geht, wie es euch beliebt.");
    AddAdditionalText("4. Kommt zum Don, wenn ihr Hilfe braucht. Er euer Pate.");
    AddAdditionalText("5. Ein Handel mit dem Don ist ein Handel mit dem Schicksal.");
    AddAdditionalText("6. Habt ihr Schaden verursacht, gleicht den Schaden zweifach aus.");
    -- Faction stuff
    AddTraderTrigger("Elvaine","Hiding behind books, fighting with words; that is not the way of a man. The archmage of Runewick can't be a true man!");
    AddAdditionalTrigger("Morgan");
    AddAdditionalTrigger("archmage");
    AddAdditionalTrigger("Erzmagier");
    AddCondition("lang","english");
    AddTraderTrigger("Elvaine","Sich hinter Büchern verstecken und mit Worten zu kämpfen; das ziemt sich nicht für einen Mann. Der Erzmagier von Runewick kann kein echter Mann sein!");
    AddAdditionalTrigger("Morgan");
    AddAdditionalTrigger("archmage");
    AddAdditionalTrigger("Erzmagier");
    AddTraderTrigger("Runewick","Runewick is ruled by a man... by Elvaine Morgan. I'd never follow such a weak person. I have no explaination how he gathered so many followers.");
    AddCondition("lang","english");
    AddTraderTrigger("Runewick","Runewick wird von einem Mann... von Elvaine Morgan regiert. Ich würde nie so einer schwachen Persönlichkeit gehorchen. Ich habe keine Erklärung dafür, wie er so viele Anhänger gewinnen konnte.");
    AddTraderTrigger("Valerio","The Don made up some very clear rules. Obey them and you'll have a good time in Galmair.");
    AddAdditionalTrigger("Guilianni");
    AddAdditionalTrigger("Don");
    AddCondition("lang","english");
    AddAdditionalText("The Don is a good man. If you owe him a favour, never forget about that in your life. He won't!");
    AddAdditionalText("One bad word about the Don and a knife in the dark could make you stop spreading lies. Keep that in mind.");
    AddTraderTrigger("Valerio","Der Don hat einige einfache Regeln aufgestellt. Befolgt sie und ihr werdet eine gute Zeit in Galmair haben.");
    AddAdditionalTrigger("Guilianni");
    AddAdditionalTrigger("Don");
    AddAdditionalText("Der Dong ist ein guter Mann. Wenn ihr ihm einen Gefallen schuldet, so vergesst dies niemals. Er wird es jedenfalls nicht.");
    AddAdditionalText("Ein falsches Wort über den Don und ein Messer in der Dunkelheit könnte eure Lügen ein für alle mal beenden. Denkt immer daran.");
    AddTraderTrigger("Galmair","Galmair is the only town in this region where the word 'freedom' still has meaning.");
    AddCondition("lang","english");
    AddAdditionalText("When I first came to Galmair, I was a poor dwarf with no hope. The Don gave me hope and I pay back all the favours he granted.");
    AddAdditionalText("If you like good beer, a good tavern brawl and good business, Galmair is your place to be.");
    AddTraderTrigger("Galmair","Galmair ist die einzige Stadt in dieser Region, wo das Wort 'Freiheit' noch eine Bedeutung hat.");
    AddAdditionalText("Als ich nach Galmair kam, war ich ein armer Zwerg ohne Hoffnung. Der Don gab mir Hoffnung und ich zahle all seine Gefälligkeiten gerne zurück.");
    AddAdditionalText("Wenn ihr ein gutes Bier, eine gute Tavernenschlägerei und ein gutes Geschäft schätzt, dann ist Galmair der Ort für euch.");
    AddTraderTrigger("rosaline","Rosaline Guilianni; sounds good, eh?");
    AddAdditionalTrigger("königin");
    AddAdditionalTrigger("queen");
    AddAdditionalTrigger("edwards");
    AddCondition("lang","english");
    AddAdditionalText("The Don once proposed marriage to the Queen of Cadomyr. She refused; she'd better begs that he does a second time!");
    AddAdditionalText("I somehow adore queen Rosaline; she knows how to rule a kingdom. As queen. A queendom, har, har.");
    AddTraderTrigger("rosaline","Rosaline Guilianni; klingt gut, oder?");
    AddAdditionalTrigger("königin");
    AddAdditionalTrigger("queen");
    AddAdditionalTrigger("edwards");
    AddAdditionalText("Der Don hat der Königin von Cadomyr einst einen Heiratsantrag gemacht. Sie hat ihn abgelehnt; sie sollte darum betteln, dass er es noch ein zweites mal macht.");
    AddAdditionalText("Ich bewundere Königin Rosaline irgendwie. Sie weiß, wie man ein Königreich regiert. Als Königin. Ein Königinnenreich, har, har.");
    AddTraderTrigger("Cadomyr","I ask myself how they survive in that barren desert. Cadomyr is proud, but it has to rely on food deliveries. This might turn out... violent one day.");
    AddCondition("lang","english");
    AddTraderTrigger("Cadomyr","Ich frage mich, wie sie in dieser trockenen Wüste überleben. Cadomyr ist stolz, doch ist es von Nahrungslieferungen abhängig. Das könnte mal recht... blutig ausgehen.");
    -- Main land factions
    AddTraderTrigger("albar","In Albar, they don't obey women. I'd obey Rosaline Edwards of Cadomyr if she'd be the Don's wife; she is of Albarian origin, though. Strange, isn't it?");
    AddCondition("lang","english");
    AddTraderTrigger("albar","In Albar gehorcht man keinem Weibe. Ich aber würde Rosaline Edwards von Cadomyr gehorchen wenn sie die Ehefrau des Dons wäre. Sie ist von albarischem Geblüt; merkwürdig, oder?");
    AddTraderTrigger("gynk","Honestly, I've never been to Gynk, but I was told it is like Galmair... just bigger.");
    AddAdditionalTrigger("gync");
    AddCondition("lang","english");
    AddAdditionalText("Gynk is the home of Don Valerio. So, you should better not say it is filthy!");
    AddAdditionalText("If I ever depart from Galmair, I'd move to Gynk.");
    AddTraderTrigger("gync","Ehrlich gesagt war ich noch nie in Gynk, aber man sagt, es sei wie Galmair... nur größer.");
    AddAdditionalTrigger("gynk");
    AddAdditionalText("Gynk ist die Heimat von Don Valerio. Also sollte ihr besser nicht behaupten, es sei dreckig!");
    AddAdditionalText("Wenn ich jemals Galmair verlasse, dann ziehe ich nach Gynk.");
    AddTraderTrigger("salkama","Oh, Salk... what was that? I never heard of that place.");
    AddCondition("lang","english");
    AddTraderTrigger("salkama","Oh Salk... wie bitte? Ich hab noch nie von solch einem Ort gehört.");
    -- Gods; each NPC should react on AT LEAST one god, being a follower of said god
    AddTraderTrigger("Ronagan","Well, well, well. You think I am a criminal and hence, I pray to Ronagan, right? Right. Except for the 'criminal'.");
    AddCondition("lang","english");
    AddAdditionalText("Ronagan is the patron saint of Galmair. So... hail Ronagan!");
    AddAdditionalText("Do you have the slightest clue what Ronagan did for Illarion? No? If you knew, you'd pray to him all day long.");
    AddTraderTrigger("Ronagan","Ja, ja, ja. Ihr denkt also, ich bin ein Gauner und deshalb bete ich zu Ronagan, richtig? Richtig. Außer das mit dem 'Gauner'.");
    AddAdditionalText("Ronagan ist der Schutzgott Galmairs. Also... lobet Ronagan!");
    AddAdditionalText("Habt ihr die geringste Ahnung davon, was Ronagan für Illarion getan hat? Nein? Wenn ihr es wüßtet, würdet ihr ihn den ganzen Tag lang anbeten.");
    AddTraderTrigger("Irmorom","All dwarves worship Irmorom - that is as false as the statement that all dwarves are greedy bastards.");
    AddCondition("lang","english");
    AddTraderTrigger("Irmorom","Dass alle Zwerge Irmorom anhimmeln ist so falsch wie dass alle Zwerge geizige Bastarde sind.");
    AddTraderTrigger("Sirani","Sirani, Sirani... The Don mentioned something about Sirani. Better ask him about Sirani.");
    AddCondition("lang","english");
    AddTraderTrigger("Sirani","Sirani, Sirani... der Don erwähnte irgendwas über Sirani. Fragt ihn besser selbst.");
    -- 1st quest: Kill 10 flies, player receives torch.
    -- Give out quest 1 and a torch
    AddTraderTrigger("quest","Blasted flies! The Don wants me to keep the streets clean, but dirty flies seem to emerge from the sewers over and over again. Climb down and slay at least ten of those annoyances! Here, have this torch.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",0);
    AddCondition("lang","english");
    AddConsequence("qpg","=",1);
    AddConsequence("item",391,1,399,0);
    AddConsequence("inform","[New quest] Galmair Sewers I");
    AddTraderTrigger("quest","Verdammte Fliegen! Der Don wünscht sich saubere Straßen, aber diese Schmeißfliegen steigen ein ums andere Mal aus der Kanalisation auf. Nehmt diese Fackel, steigt hinab und erschlagt wenigstens zehn dieser Plagegeister.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",0);
    AddConsequence("qpg","=",1);
    AddConsequence("item",391,1,399,0);
    AddConsequence("inform","[Neues Quest] Die Kanalisation von Galmair I");
    AddTraderTrigger("task","Blasted flies! The Don wants me to keep the streets clean, but dirty flies seem to emerge from the sewers over and over again. Climb down and slay at least ten of those annoyances! Here, have this torch.");
    AddAdditionalTrigger("adventure");
    AddCondition("qpg","=",0);
    AddConsequence("qpg","=",1);
    AddConsequence("item",391,1,399,0);
    AddConsequence("inform","[New quest] Galmair Sewers I");
    AddTraderTrigger("Auftrag","Verdammte Fliegen! Der Don wünscht sich saubere Straßen, aber diese Schmeißfliegen steigen ein ums andere Mal aus der Kanalisation auf. Nehmt diese Fackel, steigt hinab und erschlagt wenigstens zehn dieser Plagegeister.");
    AddAdditionalTrigger("Aufgabe");
    AddAdditionalTrigger("Abenteuer");
    AddCondition("qpg","=",0);
    AddConsequence("qpg","=",1);
    AddConsequence("item",391,1,399,0);
    AddConsequence("inform","[Neues Quest] Die Kanalisation von Galmair I");
    -- Quest 1 taken but not solved, repeat the instructions
    AddTraderTrigger("quest","I hear their buzzing everywhere. Go back to the sewers and smite as many flies as possible.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg",">",0);
    AddCondition("qpg","<",11);
    AddCondition("lang","english");
    AddTraderTrigger("quest","Ich hör sie überall summen! Geht zurück in die Kanalisation und erschlagt so viele Fliegen wie möglich.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg",">",0);
    AddCondition("qpg","<",11);
    AddTraderTrigger("task","I hear their buzzing everywhere. Go back to the sewers and smite as many flies as possible.");
    AddAdditionalTrigger("adventure");
    AddCondition("qpg",">",0);
    AddCondition("qpg","<",11);
    AddTraderTrigger("Auftrag","Ich hör sie überall summen! Geht zurück in die Kanalisation und erschlagt so viele Fliegen wie möglich.");
    AddAdditionalTrigger("Aufgabe");
    AddAdditionalTrigger("Abenteuer");
    AddCondition("qpg",">",0);
    AddCondition("qpg","<",11);
    -- Quest 1 solved, reward: 100cp, +5 rankpoints
    AddTraderTrigger(".+","#me hands over a small purse: 'Good job. Now I owe you one. But those flies were only the beginning of tasks I have for you.");
    AddCondition("qpg","=",11);
    AddCondition("lang","english");
    AddCondition("town","=","galmair");
    AddConsequence("qpg","=",12);
    AddConsequence("rankpoints","galmair","+",5);
    AddConsequence("money","+",100);
    AddConsequence("inform","[Quest solved] You are awarded 100 copper coins. You advance in Don Valerio Guilianni's favour.");
    AddTraderTrigger(".+","#me hands over a small purse: 'Good job. Now I owe you one. But those flies were only the beginning of tasks I have for you.");
    AddCondition("qpg","=",11);
    AddCondition("lang","english");
    AddConsequence("qpg","=",12);
    AddConsequence("money","+",100);
    AddConsequence("inform","[Quest solved] You are awarded 100 copper coins.");
    AddTraderTrigger(".+","#me überreicht eine kleine Geldbörse: 'Gut gemacht, ihr habt einen gut bei mir. Aber diese Fliegen waren erst der Anfang der Aufträge, die ich für euch habe.");
    AddCondition("qpg","=",11);
    AddCondition("town","=","galmair");
    AddConsequence("qpg","=",12);
    AddConsequence("rankpoints","galmair","+",5);
    AddConsequence("money","+",100);
    AddConsequence("inform","[Quest gelöst] Du erhältst 100 Kupferstücke. Dein Ansehen bei Don Valerio Guilianni steigt.");
    AddTraderTrigger(".+","#me überreicht eine kleine Geldbörse: 'Gut gemacht, ihr habt einen gut bei mir. Aber diese Fliegen waren erst der Anfang der Aufträge, die ich für euch habe.");
    AddCondition("qpg","=",11);
    AddConsequence("qpg","=",12);
    AddConsequence("money","+",100);
    AddConsequence("inform","[Quest gelöst] Du erhältst 100 Kupferstücke.");
    -- 2nd quest: Kill 5 mummies
    -- Give out quest 2
    AddTraderTrigger("quest","Did you ever notice this... moaning in the night? I don't know why, but smelly sewer mummies haunt the sewers. Smite at least five of them for a small reward.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",12);
    AddCondition("lang","english");
    AddConsequence("qpg","=",13);
    AddConsequence("inform","[New quest] Galmair Sewers II");
    AddTraderTrigger("quest","Habt ihr jemals dieses Wehklagen in der Nacht vernommen? Ich weiß nicht warum, aber stinkende Gullimumien spuken in der Kanalisation. Erschlagt wenigstens fünf von ihnen für eine kleine Belohnung.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",12);
    AddConsequence("qpg","=",13);
    AddConsequence("inform","[Neues Quest] Die Kanalisation von Galmair II");
    AddTraderTrigger("task","Did you ever notice this... moaning in the night? I don't know why, but smelly sewer mummies haunt the sewers. Smite at least five of them for a small reward.");
    AddAdditionalTrigger("adventure");
    AddCondition("qpg","=",12);
    AddConsequence("qpg","=",13);
    AddConsequence("inform","[New quest] Galmair Sewers II");
    AddTraderTrigger("Auftrag","Habt ihr jemals dieses Wehklagen in der Nacht vernommen? Ich weiß nicht warum, aber stinkende Gullimumien spuken in der Kanalisation. Erschlagt wenigstens fünf von ihnen für eine kleine Belohnung.");
    AddAdditionalTrigger("Aufgabe");
    AddAdditionalTrigger("Abenteuer");
    AddCondition("qpg","=",12);
    AddConsequence("qpg","=",13);
    AddConsequence("inform","[Neues Quest] Die Kanalisation von Galmair II");
    -- Quest 2 taken but not solved, repeat the instructions
    AddTraderTrigger("quest","Those undead bastards in the sewers scare away customers. Help Galmair and its traders, slay as many as possible.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg",">",12);
    AddCondition("qpg","<",18);
    AddCondition("lang","english");
    AddTraderTrigger("quest","Diese untoten Bastarde in der Kanalisation verschrecken die Kundschaft. Helft Galmair und seinen Händlern, erschlagt so viele wie möglich.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg",">",12);
    AddCondition("qpg","<",18);
    AddTraderTrigger("task","Those undead bastards in the sewers scare away customers. Help Galmair and its traders, slay as many as possible.");
    AddAdditionalTrigger("adventure");
    AddCondition("qpg",">",12);
    AddCondition("qpg","<",18);
    AddTraderTrigger("Auftrag","Diese untoten Bastarde in der Kanalisation verschrecken die Kundschaft. Helft Galmair und seinen Händlern, erschlagt so viele wie möglich.");
    AddAdditionalTrigger("Aufgabe");
    AddAdditionalTrigger("Abenteuer");
    AddCondition("qpg",">",12);
    AddCondition("qpg","<",18);
    -- Quest 2 solved, reward: 100cp, ornate dagger, +10 rankpoints
    AddTraderTrigger(".+","Each bad day for the undead is a good for the living. Here, have this dagger as compensation for your favour.");
    AddCondition("qpg","=",18);
    AddCondition("lang","english");
    AddCondition("town","=","galmair");
    AddConsequence("qpg","=",19);
    AddConsequence("rankpoints","galmair","+",10);
    AddConsequence("money","+",100);
    AddConsequence("item",190,1,599,0);
    AddConsequence("inform","[Quest solved] You are awarded 100 copper coins and a ornate dagger. You advance in Don Valerio Guilianni's favour.");
    AddTraderTrigger(".+","Each bad day for the undead is a good for the living. Here, have this dagger as compensation for your favour.");
    AddCondition("qpg","=",18);
    AddCondition("lang","english");
    AddConsequence("qpg","=",19);
    AddConsequence("money","+",100);
    AddConsequence("item",190,1,599,0);
    AddConsequence("inform","[Quest solved] You are awarded 100 copper coins and a ornate dagger.");
    AddTraderTrigger(".+","Jeder schlechte Tag für die Untoten ist ein guter für die Lebenden. Hier, nehmt diesen Dolch als Ausgleich für eure Gefälligkeit.");
    AddCondition("qpg","=",18);
    AddCondition("town","=","galmair");
    AddConsequence("qpg","=",19);
    AddConsequence("rankpoints","galmair","+",10);
    AddConsequence("money","+",100);
    AddConsequence("item",190,1,599,0);
    AddConsequence("inform","[Quest gelöst] Du erhältst 100 Kupferstücke und einen verzierten Dolch. Dein Ansehen bei Don Valerio Guilianni steigt.");
    AddTraderTrigger(".+","Jeder schlechte Tag für die Untoten ist ein guter für die Lebenden. Hier, nehmt diesen Dolch als Ausgleich für eure Gefälligkeit.");
    AddCondition("qpg","=",18);
    AddConsequence("qpg","=",19);
    AddConsequence("money","+",100);
    AddConsequence("item",190,1,599,0);
    AddConsequence("inform","[Quest gelöst] Du erhältst 100 Kupferstücke und einen verzierten Dolch.");
    -- 3rd quest: Kill 1 halfling bandit
    -- Give out quest 3
    AddTraderTrigger("quest","The Don has a special assignment for you. The leader of a bunch of halfling thieves who dared to steal from the Don is suspected to hide in the sewers. End his life!");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",19);
    AddCondition("lang","english");
    AddConsequence("qpg","=",20);
    AddConsequence("inform","[New quest] Galmair Sewers III");
    AddTraderTrigger("quest","Der Don hat einen Spezialauftrag für euch. Der Anführer eine Bande von Halblingdieben, die sich erdreisteten, den Don zu bestehlen, versteckt sich wohl in der Kanalisation. Beendet sein Leben!");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",19);
    AddConsequence("qpg","=",20);
    AddConsequence("inform","[Neues Quest] Die Kanalisation von Galmair III");
    AddTraderTrigger("task","The Don has a special assignment for you. The leader of a bunch of halfling thieves who dared to steal from the Don is suspected to hide in the sewers. End his life!");
    AddAdditionalTrigger("adventure");
    AddCondition("qpg","=",19);
    AddConsequence("qpg","=",20);
    AddConsequence("inform","[New quest] Galmair Sewers III");
    AddTraderTrigger("Auftrag","Der Don hat einen Spezialauftrag für euch. Der Anführer eine Bande von Halblingdieben, die sich erdreisteten, den Don zu bestehlen, versteckt sich wohl in der Kanalisation. Beendet sein Leben!");
    AddAdditionalTrigger("Aufgabe");
    AddAdditionalTrigger("Abenteuer");
    AddCondition("qpg","=",19);
    AddConsequence("qpg","=",20);
    AddConsequence("inform","[Neues Quest] Die Kanalisation von Galmair III");
    -- Quest 3 taken but not solved, repeat the instructions
    AddTraderTrigger("quest","The halfling thieves continue to steal from clients of the Don. Track down their leader and execute him.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg",">",19);
    AddCondition("qpg","<",21);
    AddCondition("lang","english");
    AddTraderTrigger("quest","Die Halblingdiebe bestehlen weiterhin die Klientel des Dons. Spürt ihren Anführer auf und erledigt ihn!");
    AddAdditionalTrigger("mission");
    AddCondition("qpg",">",19);
    AddCondition("qpg","<",21);
    AddTraderTrigger("task","The halfling thieves continue to steal from clients of the Don. Track down their leader and execute him.");
    AddAdditionalTrigger("adventure");
    AddCondition("qpg",">",19);
    AddCondition("qpg","<",21);
    AddTraderTrigger("Auftrag","Die Halblingdiebe bestehlen weiterhin die Klientel des Dons. Spürt ihren Anführer auf und erledigt ihn!");
    AddAdditionalTrigger("Aufgabe");
    AddAdditionalTrigger("Abenteuer");
    AddCondition("qpg",">",19);
    AddCondition("qpg","<",21);
    -- Quest 3 solved, reward: steel gloves, +20 rankpoints
    AddTraderTrigger(".+","You taught those blasted halfers a lesson they won't forget! Never mess with Don Valerio! Here, have these gloves - for the extra punch.");
    AddCondition("qpg","=",21);
    AddCondition("lang","english");
    AddCondition("town","=","galmair");
    AddConsequence("qpg","=",22);
    AddConsequence("rankpoints","galmair","+",20);
    AddConsequence("item",325,1,799,0);
    AddConsequence("inform","[Quest solved] You are awarded a pair of steel gloves. You advance in Don Valerio Guilianni's favour.");
    AddTraderTrigger(".+","You taught those blasted halfers a lesson they won't forget! Never mess with Don Valerio! Here, have these gloves - for the extra punch.");
    AddCondition("qpg","=",21);
    AddCondition("lang","english");
    AddConsequence("qpg","=",22);
    AddConsequence("item",325,1,799,0);
    AddConsequence("inform","[Quest solved] You are awarded a pair of steel gloves.");
    AddTraderTrigger(".+","Ihr habt den Halblingen eine Lektion erteilt, die sie sobald nicht vergessen werden. Legt euch nie mit Don Valerio an! Hier, nehmt diese Handschuhe - damit ihr auch morgen noch kraftvoll zuschlagen könnt.");
    AddCondition("qpg","=",21);
    AddCondition("town","=","galmair");
    AddConsequence("qpg","=",22);
    AddConsequence("item",325,1,799,0);
    AddConsequence("rankpoints","galmair","+",20);
    AddConsequence("inform","[Quest gelöst] Du erhältst ein Paar Stahlhandschuhe. Dein Ansehen bei Don Valerio Guilianni steigt.");
    AddTraderTrigger(".+","Ihr habt den Halblingen eine Lektion erteilt, die sie sobald nicht vergessen werden. Legt euch nie mit Don Valerio an! Hier, nehmt diese Handschuhe - damit ihr auch morgen noch kraftvoll zuschlagen könnt.");
    AddCondition("qpg","=",21);
    AddConsequence("qpg","=",22);
    AddConsequence("item",325,1,799,0);
    AddConsequence("inform","[Quest gelöst] Du erhältst ein Paar Stahlhandschuhe.");
    -- No more quests, just nice words of gratitude
    AddTraderTrigger("quest","I thank you for what you did for Galmair. I owe you a favour. So, if you need help, come to Don Valerio, for he is your godfather.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",22);
    AddCondition("lang","english");
    AddTraderTrigger("quest","Ich danke euch für alles, was ihr für Galmair getan habt. Ihr habt einen gut bei mir. Wenn ihr je Hilfe braucht, geht zu Don Valerio, denn er ist euer Pate.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",22);
    AddTraderTrigger("task","I thank you for what you did for Galmair. I owe you a favour. So, if you need help, come to Don Valerio, for he is your godfather.");
    AddAdditionalTrigger("adventure");
    AddCondition("qpg","=",22);
    AddTraderTrigger("Auftrag","Ich danke euch für alles, was ihr für Galmair getan habt. Ihr habt einen gut bei mir. Wenn ihr je Hilfe braucht, geht zu Don Valerio, denn er ist euer Pate.");
    AddAdditionalTrigger("Aufgabe");
    AddAdditionalTrigger("Abenteuer");
    AddCondition("qpg","=",22);
    -- Easteregg (optional): Think about a funny, unrelated trigger with a surprising answer
    AddTraderTrigger("privateer","Did Mr Lynch send you?");
    AddTraderTrigger("Freibeuter","Schickt euch Mr. Lynch?");
    -- Last catch: Think about keyphrases the player might say and that are not caught until here
    AddTraderTrigger("Yes","Interesting. Now stop talking to me unless you want to work for the Don.");
    AddAdditionalText("Ah. So, what?");
    AddAdditionalText("You are a 'yes-man', aren't you? We need such people here in Galmair.");
    AddTraderTrigger("Ja","Interessant. Nun haltet den Schnabel, es sei denn, ihr wollt für den Don arbeiten.");
    AddAdditionalText("Ah. Und nun?");
    AddAdditionalText("Ihr seid wohl ein Jasager. Gut, solche Leute können wir hier in Galmair gebrauchen.");
    AddTraderTrigger("No","Shall I... 'convince' you?");
    AddAdditionalText("Whatever.");
    AddAdditionalText("If you say 'no' to the Don, you say 'no' to your... security.");
    AddTraderTrigger("Nein","Soll ich euch... 'überzeugen'?");
    AddAdditionalText("Wie auch immer.");
    AddAdditionalText("Sagt ihr 'nein' zum Don, sagt ich 'nein' zu eurer... Unversehrtheit.");
    -- Cycletext: Please add at least(!) ten cycletext messages. The more, the better. You can use emotes (#me is green), too. 
    AddCycleText("Knochen, Knochen, Knochen. Ich weiß schon gar nicht mehr, wie viele ich gebrochen habe.","Bones, bones, bones. Can't count how many I broke.");
    AddCycleText("Ihr wollt nicht mit mir reden, denn ich will nicht mit euch reden.","You don't wanna talk to me, 'cause I don't wanna talk to you.");
    AddCycleText("Wollt ihr, dass ich euch rausschleppe und euch beibringe, wie man ins Gras beißt?","You want me to take you outside and teach you how to eat grass?");
    AddCycleText("Schonmal eure Zähne gesehen? Naseweißen zeige ich sie gerne, von ganz nahem.","Ever seen your teeth? Keep crackin' wise, I'll show them to ya... up-close, like.");
    AddCycleText("Wenn euch der Don eine Gefälligkeit getan hat, seid besser dankbar, solange ihr noch laufen könnt.","If the Don did you a favour, better get grateful quick-like... while you can still walk.");
    AddCycleText("Der Don möchte, dass ich den Leuten einfache Dinge erkläre. Ich bringe sie dazu, zuzuhören und zu verstehen.","The Don usually wants me to explain simple things to persons. I make them listen and understand.");
    AddCycleText("#me spielt mit seinem Goldkettchen.","#me plays with a golden chain around his neck.");
    AddCycleText("Verdammt!","Blast!");
    AddCycleText("Ich halte die Straßen sauber... von den falschen Leuten.","I keep the town clean... of the wrong people.");
    AddCycleText("Was guckt ihr!?","What are ye lookin' at!?");
    AddCycleText("Macht den Mund zu, es zieht!","Shut your mouth, there's a terrible draught!");
    AddCycleText("Unsere Vorräte an Teppichen gehen zur Neige, ich sollte welche ordern.","We're running low on carpets, I should order some.");
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
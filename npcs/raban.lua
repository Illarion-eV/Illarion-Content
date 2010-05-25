-- INSERT INTO npc VALUES (nextval('npc_seq'),0,-105,-400,0,6,false,'Raban','npc_raban.lua',0);

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

    SetRadius(1);
    QuestID = 66;
    -- NPC by Estralis Seborian, thanks to PO Falkner for permission and inspiration!
    -- Queststatus Overview
    -- 0: No Quest taken
    -- 1: Quest 1 taken - gather 10 raw materials for 50cp
    -- 2: Quest 1 solved
    -- 3: Quest 2 taken - gather 20 raw materials for 100cp
    -- 4: Quest 2 solved
    -- 5: Quest 3 taken - gather 5 rare raw materials for 100cp
    -- 6: Quest 3 solved
    -- 7: Quest 4 taken - gather 10 distant raw materials for 200cp
    -- 8: Quest 4 solved
    -- Debugging
    AddTraderTrigger("set 0","Quest status set to 0");
    AddConsequence("qpg","=",0);
    AddTraderTrigger("set 1","Quest status set to 1");
    AddConsequence("qpg","=",1);
    AddTraderTrigger("set 2","Quest status set to 2");
    AddConsequence("qpg","=",2);
    AddTraderTrigger("set 3","Quest status set to 3");
    AddConsequence("qpg","=",3);
    AddTraderTrigger("set 4","Quest status set to 4");
    AddConsequence("qpg","=",4);
    AddTraderTrigger("set 5","Quest status set to 5");
    AddConsequence("qpg","=",5);
    AddTraderTrigger("set 6","Quest status set to 6");
    AddConsequence("qpg","=",6);
    AddTraderTrigger("set 7","Quest status set to 7");
    AddConsequence("qpg","=",7);
    AddTraderTrigger("set 8","Quest status set to 8");
    AddConsequence("qpg","=",8);
    -- Help 
    AddTraderTrigger("Help","");
    AddConsequence("inform","[Game Help] This NPC is the hermit Raban. Keyphrases: Hello, quest, sickle, herbs.");
    AddTraderTrigger("Hilfe","");
    AddConsequence("inform","[Spielhilfe] Dieser NPC ist der Einsiedler Raban. Schlüsselwörter: Hallo, Quest, Sichel, Kräuter.");
    -- General speech
    AddTraderTrigger("Hello","Ah, yes, an unsettled soul. Welcome to my grove.");
    AddAdditionalTrigger("Greetings");
    AddAdditionalTrigger("Be greeted");
    AddAdditionalTrigger("Hail");
    AddAdditionalTrigger("Good day");
    AddAdditionalTrigger("Good morning");
    AddAdditionalTrigger("Good evening");
    AddAdditionalText("Who is there! Pardon me, I am not used to visitors.");
    AddAdditionalText("So, after all those summers, somebody comes here. I hope your intentions are good.");
    AddTraderTrigger("Grüße","Ach ja, wieder eine rastlose Seele. Willkommen in meinem Hain.");
    AddAdditionalTrigger("Gruß");
    AddAdditionalTrigger("Seid gegrüßt");
    AddAdditionalTrigger("Guten Tag");
    AddAdditionalTrigger("Guten Abend");
    AddAdditionalTrigger("Mahlzeit");
    AddAdditionalTrigger("Tach");
    AddAdditionalTrigger("Moin");
    AddAdditionalText("Wer ist da! Entschuldigt, ich bin es nicht gewohnt, Besucher zu empfangen.");
    AddAdditionalText("Nun, nach all diesen Sommern sucht wieder jemand diesen Ort auf. Ich hoffe, eure Absichten sind ehrbar.");
    AddTraderTrigger("Hiho","Ah, yes, an unsettled soul. Welcome to my grove.");
    AddAdditionalTrigger("Hallo");
    AddAdditionalTrigger("Hey");
    AddAdditionalTrigger("Greebas");
    AddAdditionalTrigger("Greebs");
    AddCondition("lang","english");
    AddAdditionalText("Who is there! Pardon me, I am not used to visitors.");
    AddAdditionalText("So, after all those summers, somebody comes here. I hope your intentions are good.");
    AddTraderTrigger("Hiho","Ach ja, wieder eine rastlose Seele. Willkommen in meinem Hain.");
    AddAdditionalTrigger("Hallo");
    AddAdditionalTrigger("Hey");
    AddAdditionalTrigger("Greebas");
    AddAdditionalTrigger("Greebs");
    AddCondition("lang","german");
    AddAdditionalText("Wer ist da! Entschuldigt, ich bin es nicht gewohnt, Besucher zu empfangen.");
    AddAdditionalText("Nun, nach all diesen Sommern sucht wieder jemand diesen Ort auf. Ich hoffe, eure Absichten sind ehrbar.");
    AddTraderTrigger("Farewell","Ushara may guide your way.");
    AddAdditionalTrigger("Good bye");
    AddAdditionalTrigger("Bye");
    AddAdditionalTrigger("Fare thy well");
    AddAdditionalText("Farewell.");
    AddAdditionalText("While leaving, do not stomp on any seedling, will you?");
    AddTraderTrigger("Tschüß","Möge Ushara deinen Weg begleiten.");
    AddAdditionalTrigger("Tschüss");
    AddAdditionalTrigger("Wiedersehen");
    AddAdditionalTrigger("Gehabt euch wohl");
    AddAdditionalText("Gehabt euch wohl.");
    AddAdditionalText("Wenn ihr geht, mögt ihr Acht geben, nicht auf Setzlinge zu treten?");
    AddTraderTrigger("Ciao","Ushara may guide your way.");
    AddAdditionalTrigger("Adieu");
    AddAdditionalTrigger("Au revoir");
    AddCondition("lang","english");
    AddAdditionalText("Farewell.");
    AddAdditionalText("While leaving, do not stomp on any seedling, will you?");
    AddTraderTrigger("Ciao","Möge Ushara deinen Weg begleiten.");
    AddAdditionalTrigger("Adieu");
    AddAdditionalTrigger("Au revoir");
    AddCondition("lang","german");
    AddAdditionalText("Gehabt euch wohl.");
    AddAdditionalText("Wenn ihr geht, mögt ihr Acht geben, nicht auf Setzlinge zu treten?");
    AddTraderTrigger("How are you","I always feel pacified when surrounded by plants and trees.");
    AddAdditionalTrigger("How feel");
    AddAdditionalTrigger("How do you do");
    AddAdditionalText("I'd feel much better if everyone honors the woods. Aren't those trees lovely?");
    AddAdditionalText("I cannot complain. My trees grow and this little fellow over there just turned ten years. I remember planting him like it was yesterday.");
    AddTraderTrigger("Wie geht","Umgeben von Pflanzen und Bäumen fühle ich mich immer beruhigt.");
    AddAdditionalTrigger("Wie fühlst");
    AddAdditionalTrigger("Wie ist es ergangen");
    AddAdditionalText("Es würde mir weit besser gehen, wenn ein Jeder die Wälder achten würde. Sind diese Bäume nicht wunderbar?");
    AddAdditionalText("Ich kann mich nicht beklagen. Meine Bäume wachsen wunderbar und der kleine dort ist gerade zehn geworden. Ich erinnere mich, wie ich ihn gepflanzt habe, als wenn es gestern wäre.");
    AddTraderTrigger("your name","They used to call me Raban when people still came here.");
    AddAdditionalTrigger("who are you");
    AddAdditionalTrigger("who art thou");
    AddAdditionalText("Raban.");
    AddAdditionalText("I am an old man without an use for a name. The trees and plants have their own word for me. You may call me Raban.");
    AddTraderTrigger("dein name","Sie haben mich Raban genannt, damals, als noch von Zeit zu Zeit Leute hierher kamen.");
    AddAdditionalTrigger("wer bist du");
    AddAdditionalTrigger("wer seid ihr");
    AddAdditionalTrigger("wie heißt");
    AddAdditionalText("Raban.");
    AddAdditionalText("Ich bin ein alter Mann, ohne Bedarf für einen Namen. Die Bäume und Pflanzen haben ihre eigene Bezeichnung für mich. Du kannst mich hingegen Raban nennen.");
    -- Catching typical NPC phrases 
    AddTraderTrigger("what sell","Is money all that matters for you? I abstain from it since decades and never missed it a single day.");
    AddAdditionalTrigger("what buy");
    AddAdditionalTrigger("list wares");
    AddAdditionalTrigger("price of");
    AddAdditionalText("I have no use for money. So I do not trade.");
    AddAdditionalText("I am not a trader. Maybe you want to help me in a quest?");
    AddTraderTrigger("was verkauf","Ist denn Gold alles, was für euch zählt? Ich entsagte ihm schon vor langer Zeit und habe es nicht an einem einzelnen Tag vermißt.");
    AddAdditionalTrigger("was kauf");
    AddAdditionalTrigger("warenliste");
    AddAdditionalTrigger("preis von");
    AddAdditionalText("Ich brauche kein Gold, also handele ich auch nicht.");
    AddAdditionalText("Ich bin kein Händler. Aber vielleicht kannst du mir bei einem Auftrag helfen?");
    AddTraderTrigger("tell something","Once upon a time, when the soil suffered from thirst, the people came to this place and prayed for revelation.");
    AddAdditionalText("I did not make this place, nature did. But few honor the wonders of Ushara and Oldra.");
    AddAdditionalText("Tales of old I never witnessed. Seldom, travellers come here to tell me about foreign lands.");
    AddTraderTrigger("erzähl was","Einst, zu einer Zeit, als die es die Erde dürstete, kamen die Völker an diesem Ort zusammen und beteten um Erlösung.");
    AddAdditionalTrigger("erzähl etwas");
    AddAdditionalText("Ich habe diesen Ort nicht geschaffen. Die Natur tat es. Aber nur wenige ehren die Wunder von Ushara und Oldra.");
    AddAdditionalText("Die Legenden alter Zeiten habe ich nie erlebt. Und nur selten kommen Wanderer hierher, um aus anderen Ländern zu berichten.");
    -- Small talk: The talk here should focus on possible questions. Feel free to add more!
    AddTraderTrigger("hermit","Nature can offer much more joy to me than any place, made of cold stone.");
    AddAdditionalTrigger("forester");
    AddAdditionalTrigger("ranger");
    AddAdditionalTrigger("gardener");
    AddAdditionalTrigger("hippie");
    AddAdditionalText("I plant trees and watch them grow. Can you imagine anything more... relaxing?");
    AddAdditionalText("I enjoy the silence here. A branch in the wind can sing wonderful songs.");
    AddTraderTrigger("Einsiedler","Die Natur bietet mir mehr Freuden als irgendein Ort aus kaltem Stein.");
    AddAdditionalTrigger("Förster");
    AddAdditionalTrigger("Waldhüter");
    AddAdditionalTrigger("Wildhüter");
    AddAdditionalTrigger("Gärtner");
    AddAdditionalTrigger("hippie");
    AddAdditionalText("Ich pflanze Bäume und bewundere, wie sie wachsen. Kann sich irgendetwas... entspannenderes vorstellen?");
    AddAdditionalText("Ich genieße die Stille hier. Ein Ast im Winde kann ein wunderbares Lied singen.");
    AddTraderTrigger("shrine","Isn't this a lovely place? Most trees, I planted myself.");
    AddAdditionalTrigger("grove");
    AddAdditionalText("Honor Ushara for this site is her gift.");
    AddAdditionalText("Welcome to the place where nature embraces you.");
    AddTraderTrigger("Schrein","Ist dies nicht ein bewundernswerter Ort? Die meisten Bäume habe ich selbst gepflanzt.");
    AddAdditionalTrigger("Hain");
    AddAdditionalText("Ehret Ushara, denn all dies ist ihr Geschenk.");
    AddAdditionalText("Willkommen an dem Ort, wo die Natur dich umarmt.");
    AddTraderTrigger("Dürre","Einst, zu einer Zeit, als die es die Erde dürstete, kamen die Völker an diesem Ort zusammen und beteten um Erlösung.");
    AddTraderTrigger("drought","Once upon a time, when the soil suffered from thirst, the people came to this place and prayed for revelation.");
    AddTraderTrigger("oasis","At the Oasis of Hope, my good friend Rutrus has found his peace. Maybe you want to visit him?");
    AddTraderTrigger("oase","Bei der Sternenoase hat mein guter Freund Rutrus seinen Frieden gefunden. Vielleicht wollt ihr ihn ja mal besuchen?");
    AddTraderTrigger("Rutrus","At the Oasis of Stars, my good friend Rutrus has found his peace. Maybe you want to visit him?");
    AddCondition("lang","english");
    AddTraderTrigger("Rutrus","Bei der Sternenoase hat mein guter Freund Rutrus seinen Frieden gefunden. Vielleicht wollt ihr ihn ja mal besuchen?");
    AddCondition("lang","german");
    AddTraderTrigger("Ushara","Ehret die Göttin!");
    AddCondition("lang","german");
    AddTraderTrigger("Ushara","Honor the goddess!");
    AddCondition("lang","english");
    AddTraderTrigger("Oldra","Oldra... I am sure I saw her one day, dancing during dawn on the grass.");
    AddCondition("lang","german");
    AddAdditionalText("Oldra now takes care of all the wonders Ushara has left on the land.");
    AddTraderTrigger("Oldra","Oldra... Ich bin mir sicher, ich habe sie einst auf dem taufeuchtem Grass im Morgenlicht tanzen sehen.");
    AddCondition("lang","english");
    AddAdditionalText("Oldra pflegt nun all die Wunder, die uns Ushara auf dem Land hinterlassen hat.");
    AddTraderTrigger("Bruno","Der Name klingt vertraut, aber hier in der Einsamkeit vergißt man Namen mit der Zeit.");
    AddCondition("lang","german");
    AddTraderTrigger("Bruno","That name sounds familiar, but living in solitude, I forgot about names with time.");
    AddCondition("lang","english");
    AddTraderTrigger("Gobaith","Ich war einst auf Gobaith, aber das ist schon lange her.");
    AddCondition("lang","german");
    AddAdditionalText("Darüber möchte ich mit euch nicht sprechen. Ich hoffe, ihr respektiert das.");
    AddTraderTrigger("Gobaith","I've been to Gobaith, but that is long ago.");
    AddCondition("lang","english");
    AddAdditionalText("I do not want to talk about this with you, I hope you respect that.");
    -- Factions
    AddTraderTrigger("Runewick","Der einzige Ort, wo es Frieden gibt ist Runewick. Dennoch ziehe ich den Wald vor.");
    AddCondition("lang","german");
    AddTraderTrigger("Runewick","The only place where you can find peace is Runewick. But I still prefer the forest.");
    AddCondition("lang","english");
    AddTraderTrigger("Galmair","Galmair? Ein Sündenpfuhl ist das!");
    AddCondition("lang","german");
    AddTraderTrigger("Galmair","Galmair? A pool of sins, it is!");
    AddCondition("lang","english");
    AddTraderTrigger("Cadomyr","Cadomyr ist ein wüster Ort im Süden. Ich frage mich, wie Rutrus es dort aushält.");
    AddCondition("lang","german");
    AddTraderTrigger("Cadomyr","Cadomyr is a rough place to the south. I wonder how Rutrus can stand this place.");
    AddCondition("lang","english");
    -- Tool hints
    AddTraderTrigger("sickle","With sickles, you can cut fir tree seedlings to plant new trees. If you want to help me, ask me for a task.");
    AddCondition("qpg","=",0);
    AddTraderTrigger("Sichel","Mit einer Sichel könnt ihr Fichtensetzlinge schneiden um neue Bäume zu pflanzen. Wenn ihr mir dabei helfen wollt, fragt mich nach einem Auftrag.");
    AddCondition("qpg","=",0);
    AddTraderTrigger("sickle","In case you need a new sickle, ask for Wilhelminus in Runewick. If he is still alive after all those years we didn't meet.");
    AddTraderTrigger("Sichel","Wenn du einen neue Sichel benötigst, fragt nach Wilhelminus in Runewick. Ich hoffe, er ist nach all diesen Jahren, die wir uns nicht sahen, noch am Leben.");
    -- 1st quest: Take a tool and gather 10 raw materials for 40cp.
    AddTraderTrigger("quest","So, you want to help me and the forest? Here, take this sickle and bring me ten fir tree seedling from the trees around.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",0);
    AddCondition("lang","english");
    AddConsequence("item",126,1,399,0);
    AddConsequence("qpg","=",1);
    AddConsequence("inform","[New quest] Raban's Grove I");
    AddTraderTrigger("quest","So, so, du willst mir und dem Wald also helfen? Nimm doch diese Sichel und bringe mir zehnSetzlinge von den Fichten des Hains.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",0);
    AddCondition("lang","german");
    AddConsequence("item",126,1,399,0);
    AddConsequence("qpg","=",1);
    AddConsequence("inform","[Neues Quest] Rabans Hain I");
    AddTraderTrigger("task","So, you want to help me and the forest? Here, take this sickle and bring me ten fir tree seedling from the trees around.");
    AddAdditionalTrigger("adventure");
    AddCondition("qpg","=",0);
    AddConsequence("item",126,1,399,0);
    AddConsequence("qpg","=",1);
    AddConsequence("inform","[New quest] Raban's Grove I");
    AddTraderTrigger("Aufgabe","So, so, du willst mir und dem Wald also helfen? Nimm doch diese Sichel und bringe mir zehn Setzlinge von den Fichten des Hains.");
    AddAdditionalTrigger("Auftrag");
    AddAdditionalTrigger("Abenteuer");
    AddCondition("qpg","=",0);
    AddConsequence("item",126,1,399,0);
    AddConsequence("qpg","=",1);
    AddConsequence("inform","[Neues Quest] Rabans Hain I");
    AddTraderTrigger("quest","So, how is progress in finding ten fir tree seedlings?");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",1);
    AddCondition("lang","english");
    AddTraderTrigger("quest","Und, wie kommt ihr voran mit dem Finden von zehn Fichtensetzlingen?");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",1);
    AddCondition("lang","german");
    AddTraderTrigger("task","So, how is progress in finding ten fir tree seedlings?");
    AddAdditionalTrigger("adventure");
    AddCondition("qpg","=",1);
    AddTraderTrigger("Aufgabe","Und, wie kommt ihr voran mit dem Finden von zehn Fichtensetzlingen?");
    AddAdditionalTrigger("Auftrag");
    AddAdditionalTrigger("Abenteuer");
    AddCondition("qpg","=",1);
    AddTraderTrigger(".+","Habt besten Dank für die Fichtensetzlinge. Nehmt diese glänzenden Scheiben, ich habe keinen Bedarf an ihnen.");
    AddCondition("qpg","=",1);
    AddCondition("item",149,"all",">",9);
    AddCondition("lang","german");
    AddConsequence("deleteitem",149,10);
    AddConsequence("inform","[Quest gelöst] Du erhältst 50 Kupferstücke und deine Kräuterkundefertigkeit steigt.");
    AddConsequence("money","+",50);
    AddConsequence("skill","crafting","herb lore","+",1);
    AddConsequence("qpg","=",2);
    AddTraderTrigger(".+","Thank you very much for the fir tree seedlings. Here, have those shiny disks, I have no use for them.");
    AddCondition("qpg","=",1);
    AddCondition("item",149,"all",">",9);
    AddCondition("lang","english");
    AddConsequence("deleteitem",149,10);
    AddConsequence("inform","[Quest solved] You are awarded 50 copper coins and your herb lore skill increases.");
    AddConsequence("money","+",50);
    AddConsequence("skill","crafting","herb lore","+",1);
    AddConsequence("qpg","=",2);
    AddTraderTrigger(".+","Bringt mir doch bitte die zehn Fichtensetzlinge, um die ich gebeten habe.");
    AddCondition("qpg","=",1);
    AddCondition("item",149,"all","<",10);
    AddCondition("lang","german");
    AddTraderTrigger(".+","Please bring me the ten fir tree seedlings I asked for.");
    AddCondition("qpg","=",1);
    AddCondition("item",149,"all","<",10);
    AddCondition("lang","english");
    -- 2nd quest: Gather 20 different raw materials for 80cp. 
    AddTraderTrigger("quest","How kind of you that you want to assist me one more time. Could you gather twenty black berries, sweet gifts of Oldra?");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",2);
    AddCondition("lang","english");
    AddConsequence("qpg","=",3);
    AddConsequence("inform","[New quest] Raban's Grove II");
    AddTraderTrigger("quest","Wie aufmerksam, dass ihr mir ein weiteres mal helfen wollt. Könntet ihr so nett sein und zwanzig Brombeeren sammeln, süße Geschenke der Oldra?");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",2);
    AddCondition("lang","german");
    AddConsequence("qpg","=",3);
    AddConsequence("inform","[Neues Quest] Rabans Hain II");
    AddTraderTrigger("task","How kind of you that you want to assist me one more time. Could you gather twenty black berries, sweet gifts of Oldra?");
    AddAdditionalTrigger("adventure");
    AddCondition("qpg","=",2);
    AddConsequence("qpg","=",3);
    AddConsequence("inform","[New quest] Raban's Grove II");
    AddTraderTrigger("Aufgabe","Wie aufmerksam, dass ihr mir ein weiteres mal helfen wollt. Könntet ihr so nett sein und zwanzig Brombeeren sammeln, süße Geschenke der Oldra?");
    AddAdditionalTrigger("Auftrag");
    AddAdditionalTrigger("Abenteuer");
    AddCondition("qpg","=",2);
    AddConsequence("qpg","=",3);
    AddConsequence("inform","[Neues Quest] Rabans Hain II");
    AddTraderTrigger("quest","You can find the twenty black berries I ask for in the hedge over there.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",3);
    AddCondition("lang","english");
    AddTraderTrigger("quest","Ihr könnt die zwanzig Brombeeren, die ich erbat, an der Hecke dort drüben finden.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",3);
    AddCondition("lang","german");
    AddTraderTrigger("task","You can find the twenty black berries I ask for in the hedge over there.");
    AddAdditionalTrigger("adventure");
    AddCondition("qpg","=",3);
    AddTraderTrigger("Aufgabe","Ihr könnt die zwanzig Brombeeren, die ich erbat, an der Hecke dort drüben finden.");
    AddAdditionalTrigger("Auftrag");
    AddAdditionalTrigger("Abenteuer");
    AddCondition("qpg","=",3);
    AddTraderTrigger(".+","I am grateful for the twenty black berries you brought me. Have this small reward.");
    AddCondition("qpg","=",3);
    AddCondition("item",147,"all",">",19);
    AddCondition("lang","german");
    AddConsequence("deleteitem",147,20);
    AddConsequence("inform","[Quest solved] You are awarded 100 copper coins and your herb lore skill increases.");
    AddConsequence("money","+",100);
    AddConsequence("skill","crafting","herb lore","+",1);
    AddConsequence("qpg","=",4);
    AddTraderTrigger(".+","Ich bin dankbar für die zwanzig Brombeeren, die ihr dargebracht habt. Nehmt diese kleine Belohnung.");
    AddCondition("qpg","=",3);
    AddCondition("item",147,"all",">",19);
    AddCondition("lang","english");
    AddConsequence("deleteitem",147,20);
    AddConsequence("inform","[Quest gelöst] Du erhältst 100 Kupferstücke und deine Kräuterkundefertigkeit steigt.");
    AddConsequence("money","+",100);
    AddConsequence("skill","crafting","herb lore","+",1);
    AddConsequence("qpg","=",4);
    AddTraderTrigger(".+","I see you don't have twenty black berries yet. I'd love to taste them, could you hurry?");
    AddCondition("qpg","=",3);
    AddCondition("item",147,"all","<",20);
    AddCondition("lang","german");
    AddTraderTrigger(".+","Wie ich sehe, habt ihr noch keine zwanzig Brombeeren. Ich würde sie gerne kosten, könntet ihr eilen?");
    AddCondition("qpg","=",3);
    AddCondition("item",147,"all","<",20);
    AddCondition("lang","english");
    -- 3rd quest: Gather 5 rare raw materials for 100cp.
    AddTraderTrigger("quest","It is honourable that you help me and the godess. For now, I desire five birth mushrooms to spread life on the soil.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",4);
    AddCondition("lang","english");
    AddConsequence("qpg","=",5);
    AddConsequence("inform","[New quest] Raban's Grove III");
    AddTraderTrigger("quest","Es ehrt euch, dass ihr mir und der Göttin erneut helfen wollt. Nun benötige ich fünf Geburtspilze, um Leben auf dem Erdboden zu sähen.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",4);
    AddCondition("lang","german");
    AddConsequence("qpg","=",5);
    AddConsequence("inform","[Neues Quest] Rabans Hain III");
    AddTraderTrigger("task","It is honourable that you help me and the godess. For now, I desire five birth mushrooms to spread life on the soil.");
    AddAdditionalTrigger("adventure");
    AddCondition("qpg","=",4);
    AddConsequence("qpg","=",5);
    AddConsequence("inform","[New quest] Raban's Grove III");
    AddTraderTrigger("Aufgabe","Es ehrt euch, dass ihr mir und der Göttin erneut helfen wollt. Nun benötige ich fünf Geburtspilze, um Leben auf dem Erdboden zu sähen.");
    AddAdditionalTrigger("Auftrag");
    AddAdditionalTrigger("Abenteuer");
    AddCondition("qpg","=",4);
    AddConsequence("qpg","=",5);
    AddConsequence("inform","[Neues Quest] Rabans Hain III");
    AddTraderTrigger("quest","Search for the five birth mushrooms at the mushroom circles you may find close to the trees.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",5);
    AddCondition("lang","english");
    AddTraderTrigger("quest","Sucht nach den fünf Geburtspilzen in den Pilskreisen, die ihr nahe der Bäume findet.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",5);
    AddCondition("lang","german");
    AddTraderTrigger("task","Search for the five birth mushrooms at the mushroom circles you may find close to the trees.");
    AddAdditionalTrigger("adventure");
    AddCondition("qpg","=",5);
    AddTraderTrigger("Aufgabe","Sucht nach den fünf Geburtspilzen in den Pilskreisen, die ihr nahe der Bäume findet.");
    AddAdditionalTrigger("Auftrag");
    AddAdditionalTrigger("Abenteuer");
    AddCondition("qpg","=",5);
    AddTraderTrigger(".+","Ah, you brought the five birth mushrooms. Long did I store this reward, now it is yours.");
    AddCondition("qpg","=",5);
    AddCondition("item",162,"all",">",4);
    AddCondition("lang","german");
    AddConsequence("deleteitem",162,5);
    AddConsequence("inform","[Quest solved] You are awarded 100 copper coins and your herb lore skill increases.");
    AddConsequence("money","+",100);
    AddConsequence("skill","crafting","herb lore","+",1);
    AddConsequence("qpg","=",6);
    AddTraderTrigger(".+","Ah, ihr habt die fünf Geburtspilze mitgebracht. Lange habe ich diese Belohnung aufbewahrt, nun ist sie euer.");
    AddCondition("qpg","=",5);
    AddCondition("item",162,"all",">",4);
    AddCondition("lang","english");
    AddConsequence("deleteitem",162,5);
    AddConsequence("inform","[Quest gelöst] Du erhältst 100 Kupferstücke und deine Kräuterkundefertigkeit steigt.");
    AddConsequence("money","+",100);
    AddConsequence("skill","crafting","herb lore","+",1);
    AddConsequence("qpg","=",6);
    AddTraderTrigger(".+","Schade, dass ihr die fünf Geburtspilze noch nicht bei den Pilzkreisen pflücken konntet.");
    AddCondition("qpg","=",5);
    AddCondition("item",162,"all","<",5);
    AddCondition("lang","german");
    AddTraderTrigger(".+","What a pity you didn't find the time yet to pick five birth mushrooms from the mushroom circles.");
    AddCondition("qpg","=",5);
    AddCondition("item",162,"all","<",5);
    AddCondition("lang","english");
    -- 4th quest: Gather 10 raw materials from a totally different location for 200cp. Link to other quest. Hint how to get there.
    AddTraderTrigger("quest","Now I need something special. The soil here is too wet for some plants to grow. I need ten shovel of coarse sand. Please go to my old friend Rutrus at the Oasis of Stars and fetch some, will you?");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",6);
    AddCondition("lang","english");
    AddConsequence("qpg","=",7);
    AddConsequence("inform","[New quest] Raban's Grove IV");
    AddTraderTrigger("quest","Nun benötige ich etwas besonderes. Der Mutterboden hier ist ein wenig zu feucht, damit gewisse Pflanzen hier wachsen können. Ich benötige zehn Schaufeln voll groben Sand. Bitte geht zu meinem alten Freund Rutrus zur Sternenoase und holt mir welchen.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",6);
    AddCondition("lang","german");
    AddConsequence("qpg","=",7);
    AddConsequence("inform","[Neues Quest] Rabans Hain IV");
    AddTraderTrigger("task","Now I need something special. The soil here is too wet for some plants to grow. I need ten shovel of coarse sand. Please go to my old friend Rutrus at the Oasis of Stars and fetch some, will you?");
    AddAdditionalTrigger("adventure");
    AddCondition("qpg","=",6);
    AddConsequence("qpg","=",7);
    AddConsequence("inform","[New quest] Raban's Grove IV");
    AddTraderTrigger("Aufgabe","Nun benötige ich etwas besonderes. Der Mutterboden hier ist ein wenig zu feucht, damit gewisse Pflanzen hier wachsen können. Ich benötige zehn Schaufeln voll groben Sand. Bitte geht zu meinem alten Freund Rutrus zur Sternenoase und holt mir welchen.");
    AddAdditionalTrigger("Auftrag");
    AddAdditionalTrigger("Abenteuer");
    AddCondition("qpg","=",6);
    AddConsequence("qpg","=",7);
    AddConsequence("inform","[Neues Quest] Rabans Hain IV");
    AddTraderTrigger("quest","Head for the Oasis of Stars in order to find ten shovels of coarse sand. You get there when you head north and turn east when you reach the sea.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",7);
    AddCondition("lang","english");
    AddTraderTrigger("quest","Geht zur Sternenoase um zehn Schaufeln voll groben Sand zu finden. Ihr gelangt dorthin, indem ihr euch in nördlicher Richtung auf den Weg macht und euch dann östlich haltet, wenn ihr zum Meer kommt.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",7);
    AddCondition("lang","german");
    AddTraderTrigger("task","Head for the Oasis of Hope in order to find ten shovels of coarse sand. You get there when you head north and turn east when you reach the sea.");
    AddAdditionalTrigger("adventure");
    AddCondition("qpg","=",7);
    AddTraderTrigger("Aufgabe","Geht zur Oase der Offnung um zehn Schaufeln voll groben Sand zu finden. Ihr gelangt dorthin, indem ihr euch in nördlicher Richtung auf den Weg macht und euch dann östlich haltet, wenn ihr zum Meer kommt.");
    AddAdditionalTrigger("Auftrag");
    AddAdditionalTrigger("Abenteuer");
    AddCondition("qpg","=",7);
    AddTraderTrigger(".+","I thank you so much for venturing to the Oasis. I hope my friend Rutrus is well? Here, have this reward in exchange for the coarse sand.");
    AddCondition("qpg","=",7);
    AddCondition("item",726,"all",">",9);
    AddCondition("lang","german");
    AddConsequence("deleteitem",726,10);
    AddConsequence("inform","[Quest solved] You are awarded 200 copper coins and your herb lore skill increases.");
    AddConsequence("money","+",200);
    AddConsequence("skill","crafting","herb lore","+",1);
    AddConsequence("qpg","=",8);
    AddTraderTrigger(".+","Ich danke euch vielmals für die Reise zur Oase. Ich hoffe, meinem Freund Rutrus geht es gut? Hier, nehmt diese Belohnung für den groben Sand.");
    AddCondition("qpg","=",7);
    AddCondition("item",726,"all",">",9);
    AddCondition("lang","english");
    AddConsequence("deleteitem",726,10);
    AddConsequence("inform","[Quest gelöst] Du erhältst 200 Kupferstücke und deine Kräuterkundefertigkeit steigt.");
    AddConsequence("money","+",200);
    AddConsequence("skill","crafting","herb lore","+",1);
    AddConsequence("qpg","=",8);
    AddTraderTrigger(".+","I still need ten shovels of coarse sand. I will reward you, that's for sure.");
    AddCondition("qpg","=",7);
    AddCondition("item",726,"all","<",10);
    AddCondition("lang","german");
    AddTraderTrigger(".+","Ich brauche weiterhin zehn Schaufeln voll groben Sand. Ich werde euch entlohnen, soviel ist sicher.");
    AddCondition("qpg","=",7);
    AddCondition("item",726,"all","<",10);
    AddCondition("lang","english");
    -- Final dialogue: No more quests, just nice hints
    AddTraderTrigger("quest","There is nothing you can do for me. Just leave me alone, maybe you visit my old friend Rutrus at the oasis again?");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",8);
    AddCondition("lang","english");
    AddTraderTrigger("quest","Es gibt nichts, was ihr noch für mich tun könntet. Lasst mich einfach alleine, vielleicht wollt ihr meinen Freund Rutrus bei der Oase erneut aufsuchen?");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",8);
    AddCondition("lang","german");
    AddTraderTrigger("task","There is nothing you can do for me. Just leave me alone, maybe you visit my old friend Rutrus at the oasis again?");
    AddAdditionalTrigger("adventure");
    AddCondition("qpg","=",8);
    AddTraderTrigger("Aufgabe","Es gibt nichts, was ihr noch für mich tun könntet. Lasst mich einfach alleine, vielleicht wollt ihr meinen Freund Rutrus bei der Oase erneut aufsuchen?");
    AddAdditionalTrigger("Auftrag");
    AddAdditionalTrigger("Abenteuer");
    AddCondition("qpg","=",8);
    -- Information about herb lore
    AddTraderTrigger("herbs","You can gather herbs with a sickle. But do not cut too many - Ushara won't be pleased when you plunder her treasury.");
    AddTraderTrigger("Kräuter","Ihr könnt Kräuter mit einer Sichel sammeln. Aber schneidet nicht zu viele ab - Ushara wird nicht erfreut sein, wenn ihr ihren Garten plündert.");
    -- Easteregg
    AddTraderTrigger("Darlok","Could you please not mention that name in front of me?");
    AddCondition("lang","english");
    AddTraderTrigger("Darlok","Mögt ihr diesen Namen bitte nicht in meiner Gegenwart erwähnen?");
    AddCondition("lang","german");
    AddTraderTrigger("Falkner","What did you say?");
    AddCondition("lang","english");
    AddAdditionalText("That's not my name... anymore.");
    AddTraderTrigger("Falkner","Wie bitte?");
    AddCondition("lang","german");
    AddAdditionalText("So heiße ich nicht... mehr.");
    -- Last catch: Think about keyphrases the player might say and that are not caught until here
    AddTraderTrigger("Yes","Yes?");
    AddAdditionalText("Probably.");
    AddAdditionalText("I thought so.");
    AddAdditionalText("Are you sure?");
    AddAdditionalText("What makes you so sure about this?");
    AddAdditionalText("Definatly.");
    AddAdditionalText("Whatever...");
    AddTraderTrigger("Ja","Ja?");
    AddAdditionalText("Wahrscheinlich.");
    AddAdditionalText("Hab ich mir gedacht.");
    AddAdditionalText("Seid ihr sicher?");
    AddAdditionalText("Vielleicht.");
    AddAdditionalText("Was macht euch so sicher?");
    AddAdditionalText("Sicherlich.");
    AddAdditionalText("Wie auch immer...");
    AddTraderTrigger("No","No?");
    AddAdditionalText("But on the other hand...");
    AddAdditionalText("Well...");
    AddAdditionalText("Maybe you reconsider about this?");
    AddAdditionalText("Is that all you have to say about this?");
    AddAdditionalText("I disagree.");
    AddTraderTrigger("Nein","Nein?");
    AddAdditionalText("Aber andererseits...");
    AddAdditionalText("Nun...");
    AddAdditionalText("Vielleicht ändert ihr eure Meinung noch einmal?");
    AddAdditionalText("Ist das alles, was ihr dazu sagen wollt?");
    AddAdditionalText("Ich muss widersprechen.");
    -- Cycletext: Please add at least(!) five cycletext messages. The more, the better. You can use emotes (#me is green), too. 
    AddCycleText("#me klopft die Erde um einen frisch gepflanzten Setzling glatt.","#me smoothes the soil around a newly planted seedling.");
    AddCycleText("Wachst und gedeiht, meine Kinder.","Grow and prosper, my children.");
    AddCycleText("#me streicht sachte über die Blätter eines Strauches und seufzt.","#me strokes gently the leaves of a bush and sighs.");
    AddCycleText("#me flüstert kaum hörbar zu einer Fichte. Man kann sich einbilden, die Äste des Baumes würden antwortend im Wind rauschen.","#me whispers to a fir tree, barely audible. One could imagine the branches of the tree sough in response.");
    AddCycleText("Waren wir noch längst nicht geboren, saht ihr auf alles herab. Sind wir längst gegangen, gehört euch das Land erneut.","When we weren't even born, you already beheld all. When we are long gone, the land will be yours again.");
    AddCycleText("Ich habe etwas gehört.","I heard something.");
    AddCycleText("Shh! Wenn ihr ganz still seid, könnt ihr dem Klang der Stille lauschen.","Shh! If you're quiet, you can listen to the sound of silence.");
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
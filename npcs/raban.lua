-- INSERT INTO npc VALUES (nextval('npc_seq'),0,-105,-400,0,6,false,'Raban','npc_raban.lua',0);

require("npcs.base.autonpcfunctions")
module("npcs.raban")

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

    npcs.base.autonpcfunctions.SetRadius(1);
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
    npcs.base.autonpcfunctions.AddTraderTrigger("set 0","Quest status set to 0");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",0);
    npcs.base.autonpcfunctions.AddTraderTrigger("set 1","Quest status set to 1");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("set 2","Quest status set to 2");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("set 3","Quest status set to 3");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",3);
    npcs.base.autonpcfunctions.AddTraderTrigger("set 4","Quest status set to 4");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",4);
    npcs.base.autonpcfunctions.AddTraderTrigger("set 5","Quest status set to 5");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",5);
    npcs.base.autonpcfunctions.AddTraderTrigger("set 6","Quest status set to 6");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",6);
    npcs.base.autonpcfunctions.AddTraderTrigger("set 7","Quest status set to 7");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",7);
    npcs.base.autonpcfunctions.AddTraderTrigger("set 8","Quest status set to 8");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",8);
    -- Help 
    npcs.base.autonpcfunctions.AddTraderTrigger("Help","");
    npcs.base.autonpcfunctions.AddConsequence("inform","[Game Help] This NPC is the hermit Raban. Keyphrases: Hello, quest, sickle, herbs.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Hilfe","");
    npcs.base.autonpcfunctions.AddConsequence("inform","[Spielhilfe] Dieser NPC ist der Einsiedler Raban. Schlüsselwörter: Hallo, Quest, Sichel, Kräuter.");
    -- General speech
    npcs.base.autonpcfunctions.AddTraderTrigger("Hello","Ah, yes, an unsettled soul. Welcome to my grove.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greetings");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Be greeted");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hail");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good day");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good morning");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good evening");
    npcs.base.autonpcfunctions.AddAdditionalText("Who is there! Pardon me, I am not used to visitors.");
    npcs.base.autonpcfunctions.AddAdditionalText("So, after all those summers, somebody comes here. I hope your intentions are good.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Grüße","Ach ja, wieder eine rastlose Seele. Willkommen in meinem Hain.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Gruß");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Seid gegrüßt");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Guten Tag");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Guten Abend");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Mahlzeit");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Tach");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Moin");
    npcs.base.autonpcfunctions.AddAdditionalText("Wer ist da! Entschuldigt, ich bin es nicht gewohnt, Besucher zu empfangen.");
    npcs.base.autonpcfunctions.AddAdditionalText("Nun, nach all diesen Sommern sucht wieder jemand diesen Ort auf. Ich hoffe, eure Absichten sind ehrbar.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Hiho","Ah, yes, an unsettled soul. Welcome to my grove.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddAdditionalText("Who is there! Pardon me, I am not used to visitors.");
    npcs.base.autonpcfunctions.AddAdditionalText("So, after all those summers, somebody comes here. I hope your intentions are good.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Hiho","Ach ja, wieder eine rastlose Seele. Willkommen in meinem Hain.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddAdditionalText("Wer ist da! Entschuldigt, ich bin es nicht gewohnt, Besucher zu empfangen.");
    npcs.base.autonpcfunctions.AddAdditionalText("Nun, nach all diesen Sommern sucht wieder jemand diesen Ort auf. Ich hoffe, eure Absichten sind ehrbar.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Farewell","Ushara may guide your way.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good bye");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Bye");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Fare thy well");
    npcs.base.autonpcfunctions.AddAdditionalText("Farewell.");
    npcs.base.autonpcfunctions.AddAdditionalText("While leaving, do not stomp on any seedling, will you?");
    npcs.base.autonpcfunctions.AddTraderTrigger("Tschüß","Möge Ushara deinen Weg begleiten.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Tschüss");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Wiedersehen");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Gehabt euch wohl");
    npcs.base.autonpcfunctions.AddAdditionalText("Gehabt euch wohl.");
    npcs.base.autonpcfunctions.AddAdditionalText("Wenn ihr geht, mögt ihr Acht geben, nicht auf Setzlinge zu treten?");
    npcs.base.autonpcfunctions.AddTraderTrigger("Ciao","Ushara may guide your way.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddAdditionalText("Farewell.");
    npcs.base.autonpcfunctions.AddAdditionalText("While leaving, do not stomp on any seedling, will you?");
    npcs.base.autonpcfunctions.AddTraderTrigger("Ciao","Möge Ushara deinen Weg begleiten.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddAdditionalText("Gehabt euch wohl.");
    npcs.base.autonpcfunctions.AddAdditionalText("Wenn ihr geht, mögt ihr Acht geben, nicht auf Setzlinge zu treten?");
    npcs.base.autonpcfunctions.AddTraderTrigger("How are you","I always feel pacified when surrounded by plants and trees.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("How feel");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("How do you do");
    npcs.base.autonpcfunctions.AddAdditionalText("I'd feel much better if everyone honors the woods. Aren't those trees lovely?");
    npcs.base.autonpcfunctions.AddAdditionalText("I cannot complain. My trees grow and this little fellow over there just turned ten years. I remember planting him like it was yesterday.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Wie geht","Umgeben von Pflanzen und Bäumen fühle ich mich immer beruhigt.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Wie fühlst");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Wie ist es ergangen");
    npcs.base.autonpcfunctions.AddAdditionalText("Es würde mir weit besser gehen, wenn ein Jeder die Wälder achten würde. Sind diese Bäume nicht wunderbar?");
    npcs.base.autonpcfunctions.AddAdditionalText("Ich kann mich nicht beklagen. Meine Bäume wachsen wunderbar und der kleine dort ist gerade zehn geworden. Ich erinnere mich, wie ich ihn gepflanzt habe, als wenn es gestern wäre.");
    npcs.base.autonpcfunctions.AddTraderTrigger("your name","They used to call me Raban when people still came here.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("who are you");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("who art thou");
    npcs.base.autonpcfunctions.AddAdditionalText("Raban.");
    npcs.base.autonpcfunctions.AddAdditionalText("I am an old man without an use for a name. The trees and plants have their own word for me. You may call me Raban.");
    npcs.base.autonpcfunctions.AddTraderTrigger("dein name","Sie haben mich Raban genannt, damals, als noch von Zeit zu Zeit Leute hierher kamen.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wer bist du");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wer seid ihr");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wie heißt");
    npcs.base.autonpcfunctions.AddAdditionalText("Raban.");
    npcs.base.autonpcfunctions.AddAdditionalText("Ich bin ein alter Mann, ohne Bedarf für einen Namen. Die Bäume und Pflanzen haben ihre eigene Bezeichnung für mich. Du kannst mich hingegen Raban nennen.");
    -- Catching typical NPC phrases 
    npcs.base.autonpcfunctions.AddTraderTrigger("what sell","Is money all that matters for you? I abstain from it since decades and never missed it a single day.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("what buy");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("list wares");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("price of");
    npcs.base.autonpcfunctions.AddAdditionalText("I have no use for money. So I do not trade.");
    npcs.base.autonpcfunctions.AddAdditionalText("I am not a trader. Maybe you want to help me in a quest?");
    npcs.base.autonpcfunctions.AddTraderTrigger("was verkauf","Ist denn Gold alles, was für euch zählt? Ich entsagte ihm schon vor langer Zeit und habe es nicht an einem einzelnen Tag vermißt.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("was kauf");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("warenliste");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("preis von");
    npcs.base.autonpcfunctions.AddAdditionalText("Ich brauche kein Gold, also handele ich auch nicht.");
    npcs.base.autonpcfunctions.AddAdditionalText("Ich bin kein Händler. Aber vielleicht kannst du mir bei einem Auftrag helfen?");
    npcs.base.autonpcfunctions.AddTraderTrigger("tell something","Once upon a time, when the soil suffered from thirst, the people came to this place and prayed for revelation.");
    npcs.base.autonpcfunctions.AddAdditionalText("I did not make this place, nature did. But few honor the wonders of Ushara and Oldra.");
    npcs.base.autonpcfunctions.AddAdditionalText("Tales of old I never witnessed. Seldom, travellers come here to tell me about foreign lands.");
    npcs.base.autonpcfunctions.AddTraderTrigger("erzähl was","Einst, zu einer Zeit, als die es die Erde dürstete, kamen die Völker an diesem Ort zusammen und beteten um Erlösung.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("erzähl etwas");
    npcs.base.autonpcfunctions.AddAdditionalText("Ich habe diesen Ort nicht geschaffen. Die Natur tat es. Aber nur wenige ehren die Wunder von Ushara und Oldra.");
    npcs.base.autonpcfunctions.AddAdditionalText("Die Legenden alter Zeiten habe ich nie erlebt. Und nur selten kommen Wanderer hierher, um aus anderen Ländern zu berichten.");
    -- Small talk: The talk here should focus on possible questions. Feel free to add more!
    npcs.base.autonpcfunctions.AddTraderTrigger("hermit","Nature can offer much more joy to me than any place, made of cold stone.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("forester");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("ranger");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("gardener");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("hippie");
    npcs.base.autonpcfunctions.AddAdditionalText("I plant trees and watch them grow. Can you imagine anything more... relaxing?");
    npcs.base.autonpcfunctions.AddAdditionalText("I enjoy the silence here. A branch in the wind can sing wonderful songs.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Einsiedler","Die Natur bietet mir mehr Freuden als irgendein Ort aus kaltem Stein.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Förster");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Waldhüter");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Wildhüter");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Gärtner");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("hippie");
    npcs.base.autonpcfunctions.AddAdditionalText("Ich pflanze Bäume und bewundere, wie sie wachsen. Kann sich irgendetwas... entspannenderes vorstellen?");
    npcs.base.autonpcfunctions.AddAdditionalText("Ich genieße die Stille hier. Ein Ast im Winde kann ein wunderbares Lied singen.");
    npcs.base.autonpcfunctions.AddTraderTrigger("shrine","Isn't this a lovely place? Most trees, I planted myself.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("grove");
    npcs.base.autonpcfunctions.AddAdditionalText("Honor Ushara for this site is her gift.");
    npcs.base.autonpcfunctions.AddAdditionalText("Welcome to the place where nature embraces you.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Schrein","Ist dies nicht ein bewundernswerter Ort? Die meisten Bäume habe ich selbst gepflanzt.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hain");
    npcs.base.autonpcfunctions.AddAdditionalText("Ehret Ushara, denn all dies ist ihr Geschenk.");
    npcs.base.autonpcfunctions.AddAdditionalText("Willkommen an dem Ort, wo die Natur dich umarmt.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Dürre","Einst, zu einer Zeit, als die es die Erde dürstete, kamen die Völker an diesem Ort zusammen und beteten um Erlösung.");
    npcs.base.autonpcfunctions.AddTraderTrigger("drought","Once upon a time, when the soil suffered from thirst, the people came to this place and prayed for revelation.");
    npcs.base.autonpcfunctions.AddTraderTrigger("oasis","At the Oasis of Hope, my good friend Rutrus has found his peace. Maybe you want to visit him?");
    npcs.base.autonpcfunctions.AddTraderTrigger("oase","Bei der Sternenoase hat mein guter Freund Rutrus seinen Frieden gefunden. Vielleicht wollt ihr ihn ja mal besuchen?");
    npcs.base.autonpcfunctions.AddTraderTrigger("Rutrus","At the Oasis of Stars, my good friend Rutrus has found his peace. Maybe you want to visit him?");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Rutrus","Bei der Sternenoase hat mein guter Freund Rutrus seinen Frieden gefunden. Vielleicht wollt ihr ihn ja mal besuchen?");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("Ushara","Ehret die Göttin!");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("Ushara","Honor the goddess!");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Oldra","Oldra... I am sure I saw her one day, dancing during dawn on the grass.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddAdditionalText("Oldra now takes care of all the wonders Ushara has left on the land.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Oldra","Oldra... Ich bin mir sicher, ich habe sie einst auf dem taufeuchtem Grass im Morgenlicht tanzen sehen.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddAdditionalText("Oldra pflegt nun all die Wunder, die uns Ushara auf dem Land hinterlassen hat.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Bruno","Der Name klingt vertraut, aber hier in der Einsamkeit vergißt man Namen mit der Zeit.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("Bruno","That name sounds familiar, but living in solitude, I forgot about names with time.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Gobaith","Ich war einst auf Gobaith, aber das ist schon lange her.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddAdditionalText("Darüber möchte ich mit euch nicht sprechen. Ich hoffe, ihr respektiert das.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Gobaith","I've been to Gobaith, but that is long ago.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddAdditionalText("I do not want to talk about this with you, I hope you respect that.");
    -- Factions
    npcs.base.autonpcfunctions.AddTraderTrigger("Runewick","Der einzige Ort, wo es Frieden gibt ist Runewick. Dennoch ziehe ich den Wald vor.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("Runewick","The only place where you can find peace is Runewick. But I still prefer the forest.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Galmair","Galmair? Ein Sündenpfuhl ist das!");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("Galmair","Galmair? A pool of sins, it is!");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Cadomyr","Cadomyr ist ein wüster Ort im Süden. Ich frage mich, wie Rutrus es dort aushält.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("Cadomyr","Cadomyr is a rough place to the south. I wonder how Rutrus can stand this place.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    -- Tool hints
    npcs.base.autonpcfunctions.AddTraderTrigger("sickle","With sickles, you can cut fir tree seedlings to plant new trees. If you want to help me, ask me for a task.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",0);
    npcs.base.autonpcfunctions.AddTraderTrigger("Sichel","Mit einer Sichel könnt ihr Fichtensetzlinge schneiden um neue Bäume zu pflanzen. Wenn ihr mir dabei helfen wollt, fragt mich nach einem Auftrag.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",0);
    npcs.base.autonpcfunctions.AddTraderTrigger("sickle","In case you need a new sickle, ask for Wilhelminus in Runewick. If he is still alive after all those years we didn't meet.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Sichel","Wenn du einen neue Sichel benötigst, fragt nach Wilhelminus in Runewick. Ich hoffe, er ist nach all diesen Jahren, die wir uns nicht sahen, noch am Leben.");
    -- 1st quest: Take a tool and gather 10 raw materials for 40cp.
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","So, you want to help me and the forest? Here, take this sickle and bring me ten fir tree seedling from the trees around.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",0);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("item",126,1,399,0);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("inform","[New quest] Raban's Grove I");
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","So, so, du willst mir und dem Wald also helfen? Nimm doch diese Sichel und bringe mir zehnSetzlinge von den Fichten des Hains.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",0);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddConsequence("item",126,1,399,0);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Rabans Hain I");
    npcs.base.autonpcfunctions.AddTraderTrigger("task","So, you want to help me and the forest? Here, take this sickle and bring me ten fir tree seedling from the trees around.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",0);
    npcs.base.autonpcfunctions.AddConsequence("item",126,1,399,0);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("inform","[New quest] Raban's Grove I");
    npcs.base.autonpcfunctions.AddTraderTrigger("Aufgabe","So, so, du willst mir und dem Wald also helfen? Nimm doch diese Sichel und bringe mir zehn Setzlinge von den Fichten des Hains.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Auftrag");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",0);
    npcs.base.autonpcfunctions.AddConsequence("item",126,1,399,0);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Rabans Hain I");
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","So, how is progress in finding ten fir tree seedlings?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Und, wie kommt ihr voran mit dem Finden von zehn Fichtensetzlingen?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("task","So, how is progress in finding ten fir tree seedlings?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("Aufgabe","Und, wie kommt ihr voran mit dem Finden von zehn Fichtensetzlingen?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Auftrag");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Habt besten Dank für die Fichtensetzlinge. Nehmt diese glänzenden Scheiben, ich habe keinen Bedarf an ihnen.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddCondition("item",149,"all",">",9);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddConsequence("deleteitem",149,10);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Quest gelöst] Du erhältst 50 Kupferstücke und deine Kräuterkundefertigkeit steigt.");
    npcs.base.autonpcfunctions.AddConsequence("money","+",50);
    npcs.base.autonpcfunctions.AddConsequence("skill","crafting","herb lore","+",1);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Thank you very much for the fir tree seedlings. Here, have those shiny disks, I have no use for them.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddCondition("item",149,"all",">",9);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("deleteitem",149,10);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Quest solved] You are awarded 50 copper coins and your herb lore skill increases.");
    npcs.base.autonpcfunctions.AddConsequence("money","+",50);
    npcs.base.autonpcfunctions.AddConsequence("skill","crafting","herb lore","+",1);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Bringt mir doch bitte die zehn Fichtensetzlinge, um die ich gebeten habe.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddCondition("item",149,"all","<",10);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Please bring me the ten fir tree seedlings I asked for.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddCondition("item",149,"all","<",10);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    -- 2nd quest: Gather 20 different raw materials for 80cp. 
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","How kind of you that you want to assist me one more time. Could you gather twenty black berries, sweet gifts of Oldra?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",3);
    npcs.base.autonpcfunctions.AddConsequence("inform","[New quest] Raban's Grove II");
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Wie aufmerksam, dass ihr mir ein weiteres mal helfen wollt. Könntet ihr so nett sein und zwanzig Brombeeren sammeln, süße Geschenke der Oldra?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",3);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Rabans Hain II");
    npcs.base.autonpcfunctions.AddTraderTrigger("task","How kind of you that you want to assist me one more time. Could you gather twenty black berries, sweet gifts of Oldra?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",3);
    npcs.base.autonpcfunctions.AddConsequence("inform","[New quest] Raban's Grove II");
    npcs.base.autonpcfunctions.AddTraderTrigger("Aufgabe","Wie aufmerksam, dass ihr mir ein weiteres mal helfen wollt. Könntet ihr so nett sein und zwanzig Brombeeren sammeln, süße Geschenke der Oldra?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Auftrag");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",3);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Rabans Hain II");
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","You can find the twenty black berries I ask for in the hedge over there.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",3);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Ihr könnt die zwanzig Brombeeren, die ich erbat, an der Hecke dort drüben finden.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",3);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("task","You can find the twenty black berries I ask for in the hedge over there.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",3);
    npcs.base.autonpcfunctions.AddTraderTrigger("Aufgabe","Ihr könnt die zwanzig Brombeeren, die ich erbat, an der Hecke dort drüben finden.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Auftrag");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",3);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","I am grateful for the twenty black berries you brought me. Have this small reward.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",3);
    npcs.base.autonpcfunctions.AddCondition("item",147,"all",">",19);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddConsequence("deleteitem",147,20);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Quest solved] You are awarded 100 copper coins and your herb lore skill increases.");
    npcs.base.autonpcfunctions.AddConsequence("money","+",100);
    npcs.base.autonpcfunctions.AddConsequence("skill","crafting","herb lore","+",1);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",4);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Ich bin dankbar für die zwanzig Brombeeren, die ihr dargebracht habt. Nehmt diese kleine Belohnung.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",3);
    npcs.base.autonpcfunctions.AddCondition("item",147,"all",">",19);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("deleteitem",147,20);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Quest gelöst] Du erhältst 100 Kupferstücke und deine Kräuterkundefertigkeit steigt.");
    npcs.base.autonpcfunctions.AddConsequence("money","+",100);
    npcs.base.autonpcfunctions.AddConsequence("skill","crafting","herb lore","+",1);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",4);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","I see you don't have twenty black berries yet. I'd love to taste them, could you hurry?");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",3);
    npcs.base.autonpcfunctions.AddCondition("item",147,"all","<",20);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Wie ich sehe, habt ihr noch keine zwanzig Brombeeren. Ich würde sie gerne kosten, könntet ihr eilen?");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",3);
    npcs.base.autonpcfunctions.AddCondition("item",147,"all","<",20);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    -- 3rd quest: Gather 5 rare raw materials for 100cp.
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","It is honourable that you help me and the godess. For now, I desire five birth mushrooms to spread life on the soil.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",4);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",5);
    npcs.base.autonpcfunctions.AddConsequence("inform","[New quest] Raban's Grove III");
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Es ehrt euch, dass ihr mir und der Göttin erneut helfen wollt. Nun benötige ich fünf Geburtspilze, um Leben auf dem Erdboden zu sähen.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",4);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",5);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Rabans Hain III");
    npcs.base.autonpcfunctions.AddTraderTrigger("task","It is honourable that you help me and the godess. For now, I desire five birth mushrooms to spread life on the soil.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",4);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",5);
    npcs.base.autonpcfunctions.AddConsequence("inform","[New quest] Raban's Grove III");
    npcs.base.autonpcfunctions.AddTraderTrigger("Aufgabe","Es ehrt euch, dass ihr mir und der Göttin erneut helfen wollt. Nun benötige ich fünf Geburtspilze, um Leben auf dem Erdboden zu sähen.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Auftrag");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",4);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",5);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Rabans Hain III");
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Search for the five birth mushrooms at the mushroom circles you may find close to the trees.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",5);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Sucht nach den fünf Geburtspilzen in den Pilskreisen, die ihr nahe der Bäume findet.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",5);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("task","Search for the five birth mushrooms at the mushroom circles you may find close to the trees.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",5);
    npcs.base.autonpcfunctions.AddTraderTrigger("Aufgabe","Sucht nach den fünf Geburtspilzen in den Pilskreisen, die ihr nahe der Bäume findet.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Auftrag");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",5);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Ah, you brought the five birth mushrooms. Long did I store this reward, now it is yours.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",5);
    npcs.base.autonpcfunctions.AddCondition("item",162,"all",">",4);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddConsequence("deleteitem",162,5);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Quest solved] You are awarded 100 copper coins and your herb lore skill increases.");
    npcs.base.autonpcfunctions.AddConsequence("money","+",100);
    npcs.base.autonpcfunctions.AddConsequence("skill","crafting","herb lore","+",1);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",6);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Ah, ihr habt die fünf Geburtspilze mitgebracht. Lange habe ich diese Belohnung aufbewahrt, nun ist sie euer.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",5);
    npcs.base.autonpcfunctions.AddCondition("item",162,"all",">",4);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("deleteitem",162,5);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Quest gelöst] Du erhältst 100 Kupferstücke und deine Kräuterkundefertigkeit steigt.");
    npcs.base.autonpcfunctions.AddConsequence("money","+",100);
    npcs.base.autonpcfunctions.AddConsequence("skill","crafting","herb lore","+",1);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",6);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Schade, dass ihr die fünf Geburtspilze noch nicht bei den Pilzkreisen pflücken konntet.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",5);
    npcs.base.autonpcfunctions.AddCondition("item",162,"all","<",5);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","What a pity you didn't find the time yet to pick five birth mushrooms from the mushroom circles.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",5);
    npcs.base.autonpcfunctions.AddCondition("item",162,"all","<",5);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    -- 4th quest: Gather 10 raw materials from a totally different location for 200cp. Link to other quest. Hint how to get there.
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Now I need something special. The soil here is too wet for some plants to grow. I need ten shovel of coarse sand. Please go to my old friend Rutrus at the Oasis of Stars and fetch some, will you?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",6);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",7);
    npcs.base.autonpcfunctions.AddConsequence("inform","[New quest] Raban's Grove IV");
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Nun benötige ich etwas besonderes. Der Mutterboden hier ist ein wenig zu feucht, damit gewisse Pflanzen hier wachsen können. Ich benötige zehn Schaufeln voll groben Sand. Bitte geht zu meinem alten Freund Rutrus zur Sternenoase und holt mir welchen.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",6);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",7);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Rabans Hain IV");
    npcs.base.autonpcfunctions.AddTraderTrigger("task","Now I need something special. The soil here is too wet for some plants to grow. I need ten shovel of coarse sand. Please go to my old friend Rutrus at the Oasis of Stars and fetch some, will you?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",6);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",7);
    npcs.base.autonpcfunctions.AddConsequence("inform","[New quest] Raban's Grove IV");
    npcs.base.autonpcfunctions.AddTraderTrigger("Aufgabe","Nun benötige ich etwas besonderes. Der Mutterboden hier ist ein wenig zu feucht, damit gewisse Pflanzen hier wachsen können. Ich benötige zehn Schaufeln voll groben Sand. Bitte geht zu meinem alten Freund Rutrus zur Sternenoase und holt mir welchen.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Auftrag");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",6);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",7);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Rabans Hain IV");
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Head for the Oasis of Stars in order to find ten shovels of coarse sand. You get there when you head north and turn east when you reach the sea.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",7);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Geht zur Sternenoase um zehn Schaufeln voll groben Sand zu finden. Ihr gelangt dorthin, indem ihr euch in nördlicher Richtung auf den Weg macht und euch dann östlich haltet, wenn ihr zum Meer kommt.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",7);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("task","Head for the Oasis of Hope in order to find ten shovels of coarse sand. You get there when you head north and turn east when you reach the sea.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",7);
    npcs.base.autonpcfunctions.AddTraderTrigger("Aufgabe","Geht zur Oase der Offnung um zehn Schaufeln voll groben Sand zu finden. Ihr gelangt dorthin, indem ihr euch in nördlicher Richtung auf den Weg macht und euch dann östlich haltet, wenn ihr zum Meer kommt.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Auftrag");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",7);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","I thank you so much for venturing to the Oasis. I hope my friend Rutrus is well? Here, have this reward in exchange for the coarse sand.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",7);
    npcs.base.autonpcfunctions.AddCondition("item",726,"all",">",9);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddConsequence("deleteitem",726,10);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Quest solved] You are awarded 200 copper coins and your herb lore skill increases.");
    npcs.base.autonpcfunctions.AddConsequence("money","+",200);
    npcs.base.autonpcfunctions.AddConsequence("skill","crafting","herb lore","+",1);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",8);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Ich danke euch vielmals für die Reise zur Oase. Ich hoffe, meinem Freund Rutrus geht es gut? Hier, nehmt diese Belohnung für den groben Sand.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",7);
    npcs.base.autonpcfunctions.AddCondition("item",726,"all",">",9);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("deleteitem",726,10);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Quest gelöst] Du erhältst 200 Kupferstücke und deine Kräuterkundefertigkeit steigt.");
    npcs.base.autonpcfunctions.AddConsequence("money","+",200);
    npcs.base.autonpcfunctions.AddConsequence("skill","crafting","herb lore","+",1);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",8);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","I still need ten shovels of coarse sand. I will reward you, that's for sure.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",7);
    npcs.base.autonpcfunctions.AddCondition("item",726,"all","<",10);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Ich brauche weiterhin zehn Schaufeln voll groben Sand. Ich werde euch entlohnen, soviel ist sicher.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",7);
    npcs.base.autonpcfunctions.AddCondition("item",726,"all","<",10);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    -- Final dialogue: No more quests, just nice hints
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","There is nothing you can do for me. Just leave me alone, maybe you visit my old friend Rutrus at the oasis again?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",8);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Es gibt nichts, was ihr noch für mich tun könntet. Lasst mich einfach alleine, vielleicht wollt ihr meinen Freund Rutrus bei der Oase erneut aufsuchen?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",8);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("task","There is nothing you can do for me. Just leave me alone, maybe you visit my old friend Rutrus at the oasis again?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",8);
    npcs.base.autonpcfunctions.AddTraderTrigger("Aufgabe","Es gibt nichts, was ihr noch für mich tun könntet. Lasst mich einfach alleine, vielleicht wollt ihr meinen Freund Rutrus bei der Oase erneut aufsuchen?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Auftrag");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",8);
    -- Information about herb lore
    npcs.base.autonpcfunctions.AddTraderTrigger("herbs","You can gather herbs with a sickle. But do not cut too many - Ushara won't be pleased when you plunder her treasury.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Kräuter","Ihr könnt Kräuter mit einer Sichel sammeln. Aber schneidet nicht zu viele ab - Ushara wird nicht erfreut sein, wenn ihr ihren Garten plündert.");
    -- Easteregg
    npcs.base.autonpcfunctions.AddTraderTrigger("Darlok","Could you please not mention that name in front of me?");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Darlok","Mögt ihr diesen Namen bitte nicht in meiner Gegenwart erwähnen?");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("Falkner","What did you say?");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddAdditionalText("That's not my name... anymore.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Falkner","Wie bitte?");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddAdditionalText("So heiße ich nicht... mehr.");
    -- Last catch: Think about keyphrases the player might say and that are not caught until here
    npcs.base.autonpcfunctions.AddTraderTrigger("Yes","Yes?");
    npcs.base.autonpcfunctions.AddAdditionalText("Probably.");
    npcs.base.autonpcfunctions.AddAdditionalText("I thought so.");
    npcs.base.autonpcfunctions.AddAdditionalText("Are you sure?");
    npcs.base.autonpcfunctions.AddAdditionalText("What makes you so sure about this?");
    npcs.base.autonpcfunctions.AddAdditionalText("Definatly.");
    npcs.base.autonpcfunctions.AddAdditionalText("Whatever...");
    npcs.base.autonpcfunctions.AddTraderTrigger("Ja","Ja?");
    npcs.base.autonpcfunctions.AddAdditionalText("Wahrscheinlich.");
    npcs.base.autonpcfunctions.AddAdditionalText("Hab ich mir gedacht.");
    npcs.base.autonpcfunctions.AddAdditionalText("Seid ihr sicher?");
    npcs.base.autonpcfunctions.AddAdditionalText("Vielleicht.");
    npcs.base.autonpcfunctions.AddAdditionalText("Was macht euch so sicher?");
    npcs.base.autonpcfunctions.AddAdditionalText("Sicherlich.");
    npcs.base.autonpcfunctions.AddAdditionalText("Wie auch immer...");
    npcs.base.autonpcfunctions.AddTraderTrigger("No","No?");
    npcs.base.autonpcfunctions.AddAdditionalText("But on the other hand...");
    npcs.base.autonpcfunctions.AddAdditionalText("Well...");
    npcs.base.autonpcfunctions.AddAdditionalText("Maybe you reconsider about this?");
    npcs.base.autonpcfunctions.AddAdditionalText("Is that all you have to say about this?");
    npcs.base.autonpcfunctions.AddAdditionalText("I disagree.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Nein","Nein?");
    npcs.base.autonpcfunctions.AddAdditionalText("Aber andererseits...");
    npcs.base.autonpcfunctions.AddAdditionalText("Nun...");
    npcs.base.autonpcfunctions.AddAdditionalText("Vielleicht ändert ihr eure Meinung noch einmal?");
    npcs.base.autonpcfunctions.AddAdditionalText("Ist das alles, was ihr dazu sagen wollt?");
    npcs.base.autonpcfunctions.AddAdditionalText("Ich muss widersprechen.");
    -- Cycletext: Please add at least(!) five cycletext messages. The more, the better. You can use emotes (#me is green), too. 
    npcs.base.autonpcfunctions.AddCycleText("#me klopft die Erde um einen frisch gepflanzten Setzling glatt.","#me smoothes the soil around a newly planted seedling.");
    npcs.base.autonpcfunctions.AddCycleText("Wachst und gedeiht, meine Kinder.","Grow and prosper, my children.");
    npcs.base.autonpcfunctions.AddCycleText("#me streicht sachte über die Blätter eines Strauches und seufzt.","#me strokes gently the leaves of a bush and sighs.");
    npcs.base.autonpcfunctions.AddCycleText("#me flüstert kaum hörbar zu einer Fichte. Man kann sich einbilden, die Äste des Baumes würden antwortend im Wind rauschen.","#me whispers to a fir tree, barely audible. One could imagine the branches of the tree sough in response.");
    npcs.base.autonpcfunctions.AddCycleText("Waren wir noch längst nicht geboren, saht ihr auf alles herab. Sind wir längst gegangen, gehört euch das Land erneut.","When we weren't even born, you already beheld all. When we are long gone, the land will be yours again.");
    npcs.base.autonpcfunctions.AddCycleText("Ich habe etwas gehört.","I heard something.");
    npcs.base.autonpcfunctions.AddCycleText("Shh! Wenn ihr ganz still seid, könnt ihr dem Klang der Stille lauschen.","Shh! If you're quiet, you can listen to the sound of silence.");
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
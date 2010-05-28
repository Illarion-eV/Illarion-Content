-- INSERT INTO npc VALUES (nextval('npc_seq'),0,-105,-400,0,6,false,'Raban','npc_raban.lua',0);

require("npc.base.autonpcfunctions")
module("npc.raban")

function useNPC(user,counter,param)
    thisNPC:increaseSkill(1,"common language",100);
    thisNPC:talkLanguage(CCharacter.say, CPlayer.german, "Finger weg!");
    thisNPC:talkLanguage(CCharacter.say, CPlayer.english, "Don't you touch me!");
end

function initializeNpc()
    if TraderFirst then
        return true;
    end

    npc.base.autonpcfunctions.InitTalkLists();

    -- ********* START DYNAMIC PART ********

    npc.base.autonpcfunctions.SetRadius(1);
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
    npc.base.autonpcfunctions.AddTraderTrigger("set 0","Quest status set to 0");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",0);
    npc.base.autonpcfunctions.AddTraderTrigger("set 1","Quest status set to 1");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddTraderTrigger("set 2","Quest status set to 2");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger("set 3","Quest status set to 3");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",3);
    npc.base.autonpcfunctions.AddTraderTrigger("set 4","Quest status set to 4");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",4);
    npc.base.autonpcfunctions.AddTraderTrigger("set 5","Quest status set to 5");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",5);
    npc.base.autonpcfunctions.AddTraderTrigger("set 6","Quest status set to 6");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",6);
    npc.base.autonpcfunctions.AddTraderTrigger("set 7","Quest status set to 7");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",7);
    npc.base.autonpcfunctions.AddTraderTrigger("set 8","Quest status set to 8");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",8);
    -- Help 
    npc.base.autonpcfunctions.AddTraderTrigger("Help","");
    npc.base.autonpcfunctions.AddConsequence("inform","[Game Help] This NPC is the hermit Raban. Keyphrases: Hello, quest, sickle, herbs.");
    npc.base.autonpcfunctions.AddTraderTrigger("Hilfe","");
    npc.base.autonpcfunctions.AddConsequence("inform","[Spielhilfe] Dieser NPC ist der Einsiedler Raban. Schlüsselwörter: Hallo, Quest, Sichel, Kräuter.");
    -- General speech
    npc.base.autonpcfunctions.AddTraderTrigger("Hello","Ah, yes, an unsettled soul. Welcome to my grove.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greetings");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Be greeted");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hail");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good day");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good morning");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good evening");
    npc.base.autonpcfunctions.AddAdditionalText("Who is there! Pardon me, I am not used to visitors.");
    npc.base.autonpcfunctions.AddAdditionalText("So, after all those summers, somebody comes here. I hope your intentions are good.");
    npc.base.autonpcfunctions.AddTraderTrigger("Grüße","Ach ja, wieder eine rastlose Seele. Willkommen in meinem Hain.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Gruß");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Seid gegrüßt");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Guten Tag");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Guten Abend");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Mahlzeit");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Tach");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Moin");
    npc.base.autonpcfunctions.AddAdditionalText("Wer ist da! Entschuldigt, ich bin es nicht gewohnt, Besucher zu empfangen.");
    npc.base.autonpcfunctions.AddAdditionalText("Nun, nach all diesen Sommern sucht wieder jemand diesen Ort auf. Ich hoffe, eure Absichten sind ehrbar.");
    npc.base.autonpcfunctions.AddTraderTrigger("Hiho","Ah, yes, an unsettled soul. Welcome to my grove.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("Who is there! Pardon me, I am not used to visitors.");
    npc.base.autonpcfunctions.AddAdditionalText("So, after all those summers, somebody comes here. I hope your intentions are good.");
    npc.base.autonpcfunctions.AddTraderTrigger("Hiho","Ach ja, wieder eine rastlose Seele. Willkommen in meinem Hain.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddAdditionalText("Wer ist da! Entschuldigt, ich bin es nicht gewohnt, Besucher zu empfangen.");
    npc.base.autonpcfunctions.AddAdditionalText("Nun, nach all diesen Sommern sucht wieder jemand diesen Ort auf. Ich hoffe, eure Absichten sind ehrbar.");
    npc.base.autonpcfunctions.AddTraderTrigger("Farewell","Ushara may guide your way.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good bye");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Bye");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Fare thy well");
    npc.base.autonpcfunctions.AddAdditionalText("Farewell.");
    npc.base.autonpcfunctions.AddAdditionalText("While leaving, do not stomp on any seedling, will you?");
    npc.base.autonpcfunctions.AddTraderTrigger("Tschüß","Möge Ushara deinen Weg begleiten.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Tschüss");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Wiedersehen");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Gehabt euch wohl");
    npc.base.autonpcfunctions.AddAdditionalText("Gehabt euch wohl.");
    npc.base.autonpcfunctions.AddAdditionalText("Wenn ihr geht, mögt ihr Acht geben, nicht auf Setzlinge zu treten?");
    npc.base.autonpcfunctions.AddTraderTrigger("Ciao","Ushara may guide your way.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("Farewell.");
    npc.base.autonpcfunctions.AddAdditionalText("While leaving, do not stomp on any seedling, will you?");
    npc.base.autonpcfunctions.AddTraderTrigger("Ciao","Möge Ushara deinen Weg begleiten.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddAdditionalText("Gehabt euch wohl.");
    npc.base.autonpcfunctions.AddAdditionalText("Wenn ihr geht, mögt ihr Acht geben, nicht auf Setzlinge zu treten?");
    npc.base.autonpcfunctions.AddTraderTrigger("How are you","I always feel pacified when surrounded by plants and trees.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("How feel");
    npc.base.autonpcfunctions.AddAdditionalTrigger("How do you do");
    npc.base.autonpcfunctions.AddAdditionalText("I'd feel much better if everyone honors the woods. Aren't those trees lovely?");
    npc.base.autonpcfunctions.AddAdditionalText("I cannot complain. My trees grow and this little fellow over there just turned ten years. I remember planting him like it was yesterday.");
    npc.base.autonpcfunctions.AddTraderTrigger("Wie geht","Umgeben von Pflanzen und Bäumen fühle ich mich immer beruhigt.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Wie fühlst");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Wie ist es ergangen");
    npc.base.autonpcfunctions.AddAdditionalText("Es würde mir weit besser gehen, wenn ein Jeder die Wälder achten würde. Sind diese Bäume nicht wunderbar?");
    npc.base.autonpcfunctions.AddAdditionalText("Ich kann mich nicht beklagen. Meine Bäume wachsen wunderbar und der kleine dort ist gerade zehn geworden. Ich erinnere mich, wie ich ihn gepflanzt habe, als wenn es gestern wäre.");
    npc.base.autonpcfunctions.AddTraderTrigger("your name","They used to call me Raban when people still came here.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("who are you");
    npc.base.autonpcfunctions.AddAdditionalTrigger("who art thou");
    npc.base.autonpcfunctions.AddAdditionalText("Raban.");
    npc.base.autonpcfunctions.AddAdditionalText("I am an old man without an use for a name. The trees and plants have their own word for me. You may call me Raban.");
    npc.base.autonpcfunctions.AddTraderTrigger("dein name","Sie haben mich Raban genannt, damals, als noch von Zeit zu Zeit Leute hierher kamen.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("wer bist du");
    npc.base.autonpcfunctions.AddAdditionalTrigger("wer seid ihr");
    npc.base.autonpcfunctions.AddAdditionalTrigger("wie heißt");
    npc.base.autonpcfunctions.AddAdditionalText("Raban.");
    npc.base.autonpcfunctions.AddAdditionalText("Ich bin ein alter Mann, ohne Bedarf für einen Namen. Die Bäume und Pflanzen haben ihre eigene Bezeichnung für mich. Du kannst mich hingegen Raban nennen.");
    -- Catching typical NPC phrases 
    npc.base.autonpcfunctions.AddTraderTrigger("what sell","Is money all that matters for you? I abstain from it since decades and never missed it a single day.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("what buy");
    npc.base.autonpcfunctions.AddAdditionalTrigger("list wares");
    npc.base.autonpcfunctions.AddAdditionalTrigger("price of");
    npc.base.autonpcfunctions.AddAdditionalText("I have no use for money. So I do not trade.");
    npc.base.autonpcfunctions.AddAdditionalText("I am not a trader. Maybe you want to help me in a quest?");
    npc.base.autonpcfunctions.AddTraderTrigger("was verkauf","Ist denn Gold alles, was für euch zählt? Ich entsagte ihm schon vor langer Zeit und habe es nicht an einem einzelnen Tag vermißt.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("was kauf");
    npc.base.autonpcfunctions.AddAdditionalTrigger("warenliste");
    npc.base.autonpcfunctions.AddAdditionalTrigger("preis von");
    npc.base.autonpcfunctions.AddAdditionalText("Ich brauche kein Gold, also handele ich auch nicht.");
    npc.base.autonpcfunctions.AddAdditionalText("Ich bin kein Händler. Aber vielleicht kannst du mir bei einem Auftrag helfen?");
    npc.base.autonpcfunctions.AddTraderTrigger("tell something","Once upon a time, when the soil suffered from thirst, the people came to this place and prayed for revelation.");
    npc.base.autonpcfunctions.AddAdditionalText("I did not make this place, nature did. But few honor the wonders of Ushara and Oldra.");
    npc.base.autonpcfunctions.AddAdditionalText("Tales of old I never witnessed. Seldom, travellers come here to tell me about foreign lands.");
    npc.base.autonpcfunctions.AddTraderTrigger("erzähl was","Einst, zu einer Zeit, als die es die Erde dürstete, kamen die Völker an diesem Ort zusammen und beteten um Erlösung.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("erzähl etwas");
    npc.base.autonpcfunctions.AddAdditionalText("Ich habe diesen Ort nicht geschaffen. Die Natur tat es. Aber nur wenige ehren die Wunder von Ushara und Oldra.");
    npc.base.autonpcfunctions.AddAdditionalText("Die Legenden alter Zeiten habe ich nie erlebt. Und nur selten kommen Wanderer hierher, um aus anderen Ländern zu berichten.");
    -- Small talk: The talk here should focus on possible questions. Feel free to add more!
    npc.base.autonpcfunctions.AddTraderTrigger("hermit","Nature can offer much more joy to me than any place, made of cold stone.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("forester");
    npc.base.autonpcfunctions.AddAdditionalTrigger("ranger");
    npc.base.autonpcfunctions.AddAdditionalTrigger("gardener");
    npc.base.autonpcfunctions.AddAdditionalTrigger("hippie");
    npc.base.autonpcfunctions.AddAdditionalText("I plant trees and watch them grow. Can you imagine anything more... relaxing?");
    npc.base.autonpcfunctions.AddAdditionalText("I enjoy the silence here. A branch in the wind can sing wonderful songs.");
    npc.base.autonpcfunctions.AddTraderTrigger("Einsiedler","Die Natur bietet mir mehr Freuden als irgendein Ort aus kaltem Stein.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Förster");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Waldhüter");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Wildhüter");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Gärtner");
    npc.base.autonpcfunctions.AddAdditionalTrigger("hippie");
    npc.base.autonpcfunctions.AddAdditionalText("Ich pflanze Bäume und bewundere, wie sie wachsen. Kann sich irgendetwas... entspannenderes vorstellen?");
    npc.base.autonpcfunctions.AddAdditionalText("Ich genieße die Stille hier. Ein Ast im Winde kann ein wunderbares Lied singen.");
    npc.base.autonpcfunctions.AddTraderTrigger("shrine","Isn't this a lovely place? Most trees, I planted myself.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("grove");
    npc.base.autonpcfunctions.AddAdditionalText("Honor Ushara for this site is her gift.");
    npc.base.autonpcfunctions.AddAdditionalText("Welcome to the place where nature embraces you.");
    npc.base.autonpcfunctions.AddTraderTrigger("Schrein","Ist dies nicht ein bewundernswerter Ort? Die meisten Bäume habe ich selbst gepflanzt.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hain");
    npc.base.autonpcfunctions.AddAdditionalText("Ehret Ushara, denn all dies ist ihr Geschenk.");
    npc.base.autonpcfunctions.AddAdditionalText("Willkommen an dem Ort, wo die Natur dich umarmt.");
    npc.base.autonpcfunctions.AddTraderTrigger("Dürre","Einst, zu einer Zeit, als die es die Erde dürstete, kamen die Völker an diesem Ort zusammen und beteten um Erlösung.");
    npc.base.autonpcfunctions.AddTraderTrigger("drought","Once upon a time, when the soil suffered from thirst, the people came to this place and prayed for revelation.");
    npc.base.autonpcfunctions.AddTraderTrigger("oasis","At the Oasis of Hope, my good friend Rutrus has found his peace. Maybe you want to visit him?");
    npc.base.autonpcfunctions.AddTraderTrigger("oase","Bei der Sternenoase hat mein guter Freund Rutrus seinen Frieden gefunden. Vielleicht wollt ihr ihn ja mal besuchen?");
    npc.base.autonpcfunctions.AddTraderTrigger("Rutrus","At the Oasis of Stars, my good friend Rutrus has found his peace. Maybe you want to visit him?");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Rutrus","Bei der Sternenoase hat mein guter Freund Rutrus seinen Frieden gefunden. Vielleicht wollt ihr ihn ja mal besuchen?");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("Ushara","Ehret die Göttin!");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("Ushara","Honor the goddess!");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Oldra","Oldra... I am sure I saw her one day, dancing during dawn on the grass.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddAdditionalText("Oldra now takes care of all the wonders Ushara has left on the land.");
    npc.base.autonpcfunctions.AddTraderTrigger("Oldra","Oldra... Ich bin mir sicher, ich habe sie einst auf dem taufeuchtem Grass im Morgenlicht tanzen sehen.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("Oldra pflegt nun all die Wunder, die uns Ushara auf dem Land hinterlassen hat.");
    npc.base.autonpcfunctions.AddTraderTrigger("Bruno","Der Name klingt vertraut, aber hier in der Einsamkeit vergißt man Namen mit der Zeit.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("Bruno","That name sounds familiar, but living in solitude, I forgot about names with time.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Gobaith","Ich war einst auf Gobaith, aber das ist schon lange her.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddAdditionalText("Darüber möchte ich mit euch nicht sprechen. Ich hoffe, ihr respektiert das.");
    npc.base.autonpcfunctions.AddTraderTrigger("Gobaith","I've been to Gobaith, but that is long ago.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("I do not want to talk about this with you, I hope you respect that.");
    -- Factions
    npc.base.autonpcfunctions.AddTraderTrigger("Runewick","Der einzige Ort, wo es Frieden gibt ist Runewick. Dennoch ziehe ich den Wald vor.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("Runewick","The only place where you can find peace is Runewick. But I still prefer the forest.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Galmair","Galmair? Ein Sündenpfuhl ist das!");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("Galmair","Galmair? A pool of sins, it is!");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Cadomyr","Cadomyr ist ein wüster Ort im Süden. Ich frage mich, wie Rutrus es dort aushält.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("Cadomyr","Cadomyr is a rough place to the south. I wonder how Rutrus can stand this place.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    -- Tool hints
    npc.base.autonpcfunctions.AddTraderTrigger("sickle","With sickles, you can cut fir tree seedlings to plant new trees. If you want to help me, ask me for a task.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",0);
    npc.base.autonpcfunctions.AddTraderTrigger("Sichel","Mit einer Sichel könnt ihr Fichtensetzlinge schneiden um neue Bäume zu pflanzen. Wenn ihr mir dabei helfen wollt, fragt mich nach einem Auftrag.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",0);
    npc.base.autonpcfunctions.AddTraderTrigger("sickle","In case you need a new sickle, ask for Wilhelminus in Runewick. If he is still alive after all those years we didn't meet.");
    npc.base.autonpcfunctions.AddTraderTrigger("Sichel","Wenn du einen neue Sichel benötigst, fragt nach Wilhelminus in Runewick. Ich hoffe, er ist nach all diesen Jahren, die wir uns nicht sahen, noch am Leben.");
    -- 1st quest: Take a tool and gather 10 raw materials for 40cp.
    npc.base.autonpcfunctions.AddTraderTrigger("quest","So, you want to help me and the forest? Here, take this sickle and bring me ten fir tree seedling from the trees around.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",0);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("item",126,1,399,0);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddConsequence("inform","[New quest] Raban's Grove I");
    npc.base.autonpcfunctions.AddTraderTrigger("quest","So, so, du willst mir und dem Wald also helfen? Nimm doch diese Sichel und bringe mir zehnSetzlinge von den Fichten des Hains.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",0);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddConsequence("item",126,1,399,0);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Rabans Hain I");
    npc.base.autonpcfunctions.AddTraderTrigger("task","So, you want to help me and the forest? Here, take this sickle and bring me ten fir tree seedling from the trees around.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npc.base.autonpcfunctions.AddCondition("qpg","=",0);
    npc.base.autonpcfunctions.AddConsequence("item",126,1,399,0);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddConsequence("inform","[New quest] Raban's Grove I");
    npc.base.autonpcfunctions.AddTraderTrigger("Aufgabe","So, so, du willst mir und dem Wald also helfen? Nimm doch diese Sichel und bringe mir zehn Setzlinge von den Fichten des Hains.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Auftrag");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npc.base.autonpcfunctions.AddCondition("qpg","=",0);
    npc.base.autonpcfunctions.AddConsequence("item",126,1,399,0);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Rabans Hain I");
    npc.base.autonpcfunctions.AddTraderTrigger("quest","So, how is progress in finding ten fir tree seedlings?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("quest","Und, wie kommt ihr voran mit dem Finden von zehn Fichtensetzlingen?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("task","So, how is progress in finding ten fir tree seedlings?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddTraderTrigger("Aufgabe","Und, wie kommt ihr voran mit dem Finden von zehn Fichtensetzlingen?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Auftrag");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Habt besten Dank für die Fichtensetzlinge. Nehmt diese glänzenden Scheiben, ich habe keinen Bedarf an ihnen.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddCondition("item",149,"all",">",9);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddConsequence("deleteitem",149,10);
    npc.base.autonpcfunctions.AddConsequence("inform","[Quest gelöst] Du erhältst 50 Kupferstücke und deine Kräuterkundefertigkeit steigt.");
    npc.base.autonpcfunctions.AddConsequence("money","+",50);
    npc.base.autonpcfunctions.AddConsequence("skill","crafting","herb lore","+",1);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Thank you very much for the fir tree seedlings. Here, have those shiny disks, I have no use for them.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddCondition("item",149,"all",">",9);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("deleteitem",149,10);
    npc.base.autonpcfunctions.AddConsequence("inform","[Quest solved] You are awarded 50 copper coins and your herb lore skill increases.");
    npc.base.autonpcfunctions.AddConsequence("money","+",50);
    npc.base.autonpcfunctions.AddConsequence("skill","crafting","herb lore","+",1);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Bringt mir doch bitte die zehn Fichtensetzlinge, um die ich gebeten habe.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddCondition("item",149,"all","<",10);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Please bring me the ten fir tree seedlings I asked for.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddCondition("item",149,"all","<",10);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    -- 2nd quest: Gather 20 different raw materials for 80cp. 
    npc.base.autonpcfunctions.AddTraderTrigger("quest","How kind of you that you want to assist me one more time. Could you gather twenty black berries, sweet gifts of Oldra?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",3);
    npc.base.autonpcfunctions.AddConsequence("inform","[New quest] Raban's Grove II");
    npc.base.autonpcfunctions.AddTraderTrigger("quest","Wie aufmerksam, dass ihr mir ein weiteres mal helfen wollt. Könntet ihr so nett sein und zwanzig Brombeeren sammeln, süße Geschenke der Oldra?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",3);
    npc.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Rabans Hain II");
    npc.base.autonpcfunctions.AddTraderTrigger("task","How kind of you that you want to assist me one more time. Could you gather twenty black berries, sweet gifts of Oldra?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",3);
    npc.base.autonpcfunctions.AddConsequence("inform","[New quest] Raban's Grove II");
    npc.base.autonpcfunctions.AddTraderTrigger("Aufgabe","Wie aufmerksam, dass ihr mir ein weiteres mal helfen wollt. Könntet ihr so nett sein und zwanzig Brombeeren sammeln, süße Geschenke der Oldra?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Auftrag");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",3);
    npc.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Rabans Hain II");
    npc.base.autonpcfunctions.AddTraderTrigger("quest","You can find the twenty black berries I ask for in the hedge over there.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",3);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("quest","Ihr könnt die zwanzig Brombeeren, die ich erbat, an der Hecke dort drüben finden.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",3);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("task","You can find the twenty black berries I ask for in the hedge over there.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npc.base.autonpcfunctions.AddCondition("qpg","=",3);
    npc.base.autonpcfunctions.AddTraderTrigger("Aufgabe","Ihr könnt die zwanzig Brombeeren, die ich erbat, an der Hecke dort drüben finden.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Auftrag");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npc.base.autonpcfunctions.AddCondition("qpg","=",3);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","I am grateful for the twenty black berries you brought me. Have this small reward.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",3);
    npc.base.autonpcfunctions.AddCondition("item",147,"all",">",19);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddConsequence("deleteitem",147,20);
    npc.base.autonpcfunctions.AddConsequence("inform","[Quest solved] You are awarded 100 copper coins and your herb lore skill increases.");
    npc.base.autonpcfunctions.AddConsequence("money","+",100);
    npc.base.autonpcfunctions.AddConsequence("skill","crafting","herb lore","+",1);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",4);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Ich bin dankbar für die zwanzig Brombeeren, die ihr dargebracht habt. Nehmt diese kleine Belohnung.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",3);
    npc.base.autonpcfunctions.AddCondition("item",147,"all",">",19);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("deleteitem",147,20);
    npc.base.autonpcfunctions.AddConsequence("inform","[Quest gelöst] Du erhältst 100 Kupferstücke und deine Kräuterkundefertigkeit steigt.");
    npc.base.autonpcfunctions.AddConsequence("money","+",100);
    npc.base.autonpcfunctions.AddConsequence("skill","crafting","herb lore","+",1);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",4);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","I see you don't have twenty black berries yet. I'd love to taste them, could you hurry?");
    npc.base.autonpcfunctions.AddCondition("qpg","=",3);
    npc.base.autonpcfunctions.AddCondition("item",147,"all","<",20);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Wie ich sehe, habt ihr noch keine zwanzig Brombeeren. Ich würde sie gerne kosten, könntet ihr eilen?");
    npc.base.autonpcfunctions.AddCondition("qpg","=",3);
    npc.base.autonpcfunctions.AddCondition("item",147,"all","<",20);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    -- 3rd quest: Gather 5 rare raw materials for 100cp.
    npc.base.autonpcfunctions.AddTraderTrigger("quest","It is honourable that you help me and the godess. For now, I desire five birth mushrooms to spread life on the soil.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",4);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",5);
    npc.base.autonpcfunctions.AddConsequence("inform","[New quest] Raban's Grove III");
    npc.base.autonpcfunctions.AddTraderTrigger("quest","Es ehrt euch, dass ihr mir und der Göttin erneut helfen wollt. Nun benötige ich fünf Geburtspilze, um Leben auf dem Erdboden zu sähen.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",4);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",5);
    npc.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Rabans Hain III");
    npc.base.autonpcfunctions.AddTraderTrigger("task","It is honourable that you help me and the godess. For now, I desire five birth mushrooms to spread life on the soil.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npc.base.autonpcfunctions.AddCondition("qpg","=",4);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",5);
    npc.base.autonpcfunctions.AddConsequence("inform","[New quest] Raban's Grove III");
    npc.base.autonpcfunctions.AddTraderTrigger("Aufgabe","Es ehrt euch, dass ihr mir und der Göttin erneut helfen wollt. Nun benötige ich fünf Geburtspilze, um Leben auf dem Erdboden zu sähen.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Auftrag");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npc.base.autonpcfunctions.AddCondition("qpg","=",4);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",5);
    npc.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Rabans Hain III");
    npc.base.autonpcfunctions.AddTraderTrigger("quest","Search for the five birth mushrooms at the mushroom circles you may find close to the trees.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",5);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("quest","Sucht nach den fünf Geburtspilzen in den Pilskreisen, die ihr nahe der Bäume findet.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",5);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("task","Search for the five birth mushrooms at the mushroom circles you may find close to the trees.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npc.base.autonpcfunctions.AddCondition("qpg","=",5);
    npc.base.autonpcfunctions.AddTraderTrigger("Aufgabe","Sucht nach den fünf Geburtspilzen in den Pilskreisen, die ihr nahe der Bäume findet.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Auftrag");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npc.base.autonpcfunctions.AddCondition("qpg","=",5);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Ah, you brought the five birth mushrooms. Long did I store this reward, now it is yours.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",5);
    npc.base.autonpcfunctions.AddCondition("item",162,"all",">",4);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddConsequence("deleteitem",162,5);
    npc.base.autonpcfunctions.AddConsequence("inform","[Quest solved] You are awarded 100 copper coins and your herb lore skill increases.");
    npc.base.autonpcfunctions.AddConsequence("money","+",100);
    npc.base.autonpcfunctions.AddConsequence("skill","crafting","herb lore","+",1);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",6);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Ah, ihr habt die fünf Geburtspilze mitgebracht. Lange habe ich diese Belohnung aufbewahrt, nun ist sie euer.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",5);
    npc.base.autonpcfunctions.AddCondition("item",162,"all",">",4);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("deleteitem",162,5);
    npc.base.autonpcfunctions.AddConsequence("inform","[Quest gelöst] Du erhältst 100 Kupferstücke und deine Kräuterkundefertigkeit steigt.");
    npc.base.autonpcfunctions.AddConsequence("money","+",100);
    npc.base.autonpcfunctions.AddConsequence("skill","crafting","herb lore","+",1);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",6);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Schade, dass ihr die fünf Geburtspilze noch nicht bei den Pilzkreisen pflücken konntet.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",5);
    npc.base.autonpcfunctions.AddCondition("item",162,"all","<",5);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger(".+","What a pity you didn't find the time yet to pick five birth mushrooms from the mushroom circles.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",5);
    npc.base.autonpcfunctions.AddCondition("item",162,"all","<",5);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    -- 4th quest: Gather 10 raw materials from a totally different location for 200cp. Link to other quest. Hint how to get there.
    npc.base.autonpcfunctions.AddTraderTrigger("quest","Now I need something special. The soil here is too wet for some plants to grow. I need ten shovel of coarse sand. Please go to my old friend Rutrus at the Oasis of Stars and fetch some, will you?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",6);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",7);
    npc.base.autonpcfunctions.AddConsequence("inform","[New quest] Raban's Grove IV");
    npc.base.autonpcfunctions.AddTraderTrigger("quest","Nun benötige ich etwas besonderes. Der Mutterboden hier ist ein wenig zu feucht, damit gewisse Pflanzen hier wachsen können. Ich benötige zehn Schaufeln voll groben Sand. Bitte geht zu meinem alten Freund Rutrus zur Sternenoase und holt mir welchen.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",6);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",7);
    npc.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Rabans Hain IV");
    npc.base.autonpcfunctions.AddTraderTrigger("task","Now I need something special. The soil here is too wet for some plants to grow. I need ten shovel of coarse sand. Please go to my old friend Rutrus at the Oasis of Stars and fetch some, will you?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npc.base.autonpcfunctions.AddCondition("qpg","=",6);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",7);
    npc.base.autonpcfunctions.AddConsequence("inform","[New quest] Raban's Grove IV");
    npc.base.autonpcfunctions.AddTraderTrigger("Aufgabe","Nun benötige ich etwas besonderes. Der Mutterboden hier ist ein wenig zu feucht, damit gewisse Pflanzen hier wachsen können. Ich benötige zehn Schaufeln voll groben Sand. Bitte geht zu meinem alten Freund Rutrus zur Sternenoase und holt mir welchen.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Auftrag");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npc.base.autonpcfunctions.AddCondition("qpg","=",6);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",7);
    npc.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Rabans Hain IV");
    npc.base.autonpcfunctions.AddTraderTrigger("quest","Head for the Oasis of Stars in order to find ten shovels of coarse sand. You get there when you head north and turn east when you reach the sea.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",7);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("quest","Geht zur Sternenoase um zehn Schaufeln voll groben Sand zu finden. Ihr gelangt dorthin, indem ihr euch in nördlicher Richtung auf den Weg macht und euch dann östlich haltet, wenn ihr zum Meer kommt.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",7);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("task","Head for the Oasis of Hope in order to find ten shovels of coarse sand. You get there when you head north and turn east when you reach the sea.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npc.base.autonpcfunctions.AddCondition("qpg","=",7);
    npc.base.autonpcfunctions.AddTraderTrigger("Aufgabe","Geht zur Oase der Offnung um zehn Schaufeln voll groben Sand zu finden. Ihr gelangt dorthin, indem ihr euch in nördlicher Richtung auf den Weg macht und euch dann östlich haltet, wenn ihr zum Meer kommt.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Auftrag");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npc.base.autonpcfunctions.AddCondition("qpg","=",7);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","I thank you so much for venturing to the Oasis. I hope my friend Rutrus is well? Here, have this reward in exchange for the coarse sand.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",7);
    npc.base.autonpcfunctions.AddCondition("item",726,"all",">",9);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddConsequence("deleteitem",726,10);
    npc.base.autonpcfunctions.AddConsequence("inform","[Quest solved] You are awarded 200 copper coins and your herb lore skill increases.");
    npc.base.autonpcfunctions.AddConsequence("money","+",200);
    npc.base.autonpcfunctions.AddConsequence("skill","crafting","herb lore","+",1);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",8);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Ich danke euch vielmals für die Reise zur Oase. Ich hoffe, meinem Freund Rutrus geht es gut? Hier, nehmt diese Belohnung für den groben Sand.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",7);
    npc.base.autonpcfunctions.AddCondition("item",726,"all",">",9);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("deleteitem",726,10);
    npc.base.autonpcfunctions.AddConsequence("inform","[Quest gelöst] Du erhältst 200 Kupferstücke und deine Kräuterkundefertigkeit steigt.");
    npc.base.autonpcfunctions.AddConsequence("money","+",200);
    npc.base.autonpcfunctions.AddConsequence("skill","crafting","herb lore","+",1);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",8);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","I still need ten shovels of coarse sand. I will reward you, that's for sure.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",7);
    npc.base.autonpcfunctions.AddCondition("item",726,"all","<",10);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Ich brauche weiterhin zehn Schaufeln voll groben Sand. Ich werde euch entlohnen, soviel ist sicher.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",7);
    npc.base.autonpcfunctions.AddCondition("item",726,"all","<",10);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    -- Final dialogue: No more quests, just nice hints
    npc.base.autonpcfunctions.AddTraderTrigger("quest","There is nothing you can do for me. Just leave me alone, maybe you visit my old friend Rutrus at the oasis again?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",8);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("quest","Es gibt nichts, was ihr noch für mich tun könntet. Lasst mich einfach alleine, vielleicht wollt ihr meinen Freund Rutrus bei der Oase erneut aufsuchen?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",8);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("task","There is nothing you can do for me. Just leave me alone, maybe you visit my old friend Rutrus at the oasis again?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npc.base.autonpcfunctions.AddCondition("qpg","=",8);
    npc.base.autonpcfunctions.AddTraderTrigger("Aufgabe","Es gibt nichts, was ihr noch für mich tun könntet. Lasst mich einfach alleine, vielleicht wollt ihr meinen Freund Rutrus bei der Oase erneut aufsuchen?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Auftrag");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npc.base.autonpcfunctions.AddCondition("qpg","=",8);
    -- Information about herb lore
    npc.base.autonpcfunctions.AddTraderTrigger("herbs","You can gather herbs with a sickle. But do not cut too many - Ushara won't be pleased when you plunder her treasury.");
    npc.base.autonpcfunctions.AddTraderTrigger("Kräuter","Ihr könnt Kräuter mit einer Sichel sammeln. Aber schneidet nicht zu viele ab - Ushara wird nicht erfreut sein, wenn ihr ihren Garten plündert.");
    -- Easteregg
    npc.base.autonpcfunctions.AddTraderTrigger("Darlok","Could you please not mention that name in front of me?");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Darlok","Mögt ihr diesen Namen bitte nicht in meiner Gegenwart erwähnen?");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("Falkner","What did you say?");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("That's not my name... anymore.");
    npc.base.autonpcfunctions.AddTraderTrigger("Falkner","Wie bitte?");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddAdditionalText("So heiße ich nicht... mehr.");
    -- Last catch: Think about keyphrases the player might say and that are not caught until here
    npc.base.autonpcfunctions.AddTraderTrigger("Yes","Yes?");
    npc.base.autonpcfunctions.AddAdditionalText("Probably.");
    npc.base.autonpcfunctions.AddAdditionalText("I thought so.");
    npc.base.autonpcfunctions.AddAdditionalText("Are you sure?");
    npc.base.autonpcfunctions.AddAdditionalText("What makes you so sure about this?");
    npc.base.autonpcfunctions.AddAdditionalText("Definatly.");
    npc.base.autonpcfunctions.AddAdditionalText("Whatever...");
    npc.base.autonpcfunctions.AddTraderTrigger("Ja","Ja?");
    npc.base.autonpcfunctions.AddAdditionalText("Wahrscheinlich.");
    npc.base.autonpcfunctions.AddAdditionalText("Hab ich mir gedacht.");
    npc.base.autonpcfunctions.AddAdditionalText("Seid ihr sicher?");
    npc.base.autonpcfunctions.AddAdditionalText("Vielleicht.");
    npc.base.autonpcfunctions.AddAdditionalText("Was macht euch so sicher?");
    npc.base.autonpcfunctions.AddAdditionalText("Sicherlich.");
    npc.base.autonpcfunctions.AddAdditionalText("Wie auch immer...");
    npc.base.autonpcfunctions.AddTraderTrigger("No","No?");
    npc.base.autonpcfunctions.AddAdditionalText("But on the other hand...");
    npc.base.autonpcfunctions.AddAdditionalText("Well...");
    npc.base.autonpcfunctions.AddAdditionalText("Maybe you reconsider about this?");
    npc.base.autonpcfunctions.AddAdditionalText("Is that all you have to say about this?");
    npc.base.autonpcfunctions.AddAdditionalText("I disagree.");
    npc.base.autonpcfunctions.AddTraderTrigger("Nein","Nein?");
    npc.base.autonpcfunctions.AddAdditionalText("Aber andererseits...");
    npc.base.autonpcfunctions.AddAdditionalText("Nun...");
    npc.base.autonpcfunctions.AddAdditionalText("Vielleicht ändert ihr eure Meinung noch einmal?");
    npc.base.autonpcfunctions.AddAdditionalText("Ist das alles, was ihr dazu sagen wollt?");
    npc.base.autonpcfunctions.AddAdditionalText("Ich muss widersprechen.");
    -- Cycletext: Please add at least(!) five cycletext messages. The more, the better. You can use emotes (#me is green), too. 
    npc.base.autonpcfunctions.AddCycleText("#me klopft die Erde um einen frisch gepflanzten Setzling glatt.","#me smoothes the soil around a newly planted seedling.");
    npc.base.autonpcfunctions.AddCycleText("Wachst und gedeiht, meine Kinder.","Grow and prosper, my children.");
    npc.base.autonpcfunctions.AddCycleText("#me streicht sachte über die Blätter eines Strauches und seufzt.","#me strokes gently the leaves of a bush and sighs.");
    npc.base.autonpcfunctions.AddCycleText("#me flüstert kaum hörbar zu einer Fichte. Man kann sich einbilden, die Äste des Baumes würden antwortend im Wind rauschen.","#me whispers to a fir tree, barely audible. One could imagine the branches of the tree sough in response.");
    npc.base.autonpcfunctions.AddCycleText("Waren wir noch längst nicht geboren, saht ihr auf alles herab. Sind wir längst gegangen, gehört euch das Land erneut.","When we weren't even born, you already beheld all. When we are long gone, the land will be yours again.");
    npc.base.autonpcfunctions.AddCycleText("Ich habe etwas gehört.","I heard something.");
    npc.base.autonpcfunctions.AddCycleText("Shh! Wenn ihr ganz still seid, könnt ihr dem Klang der Stille lauschen.","Shh! If you're quiet, you can listen to the sound of silence.");
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
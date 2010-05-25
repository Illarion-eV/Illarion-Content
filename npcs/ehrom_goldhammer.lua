-- INSERT INTO npc VALUES (nextval('npc_seq'),1,-110,-420,0,4,false,'Ehrom Goldhammer','npc_ehrom_goldhammer.lua',0);

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
    QuestID = 72;
    -- NPC by Estralis Seborian, using dialogues provided my PO Magdha Tiefenerz
    -- Queststatus Overview
    -- 0: No Quest taken
    -- 1: Quest 1 taken
    -- 2: Quest 1 solved
    -- 3: Quest 2 taken 
    -- 4: Quest 2 solved
    -- 5: Quest 3 taken
    -- 6: Quest 3 solved
    -- 7: Quest 4 taken 
    -- 8: Quest 4 solved
    -- Help
    AddTraderTrigger("Help","");
    AddConsequence("inform","[Game Help] This NPC is the smuggler Ehrom Goldhammer. Keyphrases: Hello, quest, smuggler.");
    AddTraderTrigger("Hilfe","");
    AddConsequence("inform","[Spielhilfe] Dieser NPC ist der Schmuggler Ehrom Goldhammer. Schlüsselwörter: Hallo, Quest, Schmuggler.");
    -- General speech
    AddTraderTrigger("Hello","Greetings! Could it be that he send you to me to help me with my task?");
    AddAdditionalTrigger("Greetings");
    AddAdditionalTrigger("Be greeted");
    AddAdditionalTrigger("Hail");
    AddAdditionalTrigger("Good day");
    AddAdditionalTrigger("Good morning");
    AddAdditionalTrigger("Good evening");
    AddTraderTrigger("Grüße","Ronagan zum Gruße! Könnte es sein, dass Ronagan Euch zu mir geschickt hat, um mir bei meiner Aufgabe zu helfen?");
    AddAdditionalTrigger("Gruß");
    AddAdditionalTrigger("Seid gegrüßt");
    AddAdditionalTrigger("Guten Tag");
    AddAdditionalTrigger("Guten Abend");
    AddAdditionalTrigger("Mahlzeit");
    AddAdditionalTrigger("Tach");
    AddAdditionalTrigger("Moin");
    AddTraderTrigger("Hiho","Greetings! Could it be that Ronagan sent you to me to help me with my task?");
    AddAdditionalTrigger("Hallo");
    AddAdditionalTrigger("Hey");
    AddAdditionalTrigger("Greebas");
    AddAdditionalTrigger("Greebs");
    AddAdditionalTrigger("Huhu");
    AddCondition("lang","english");
    AddTraderTrigger("Hiho","Ronagan zum Gruße! Könnte es sein, dass Ronagan Euch zu mir geschickt hat, um mir bei meiner Aufgabe zu helfen?");
    AddAdditionalTrigger("Hallo");
    AddAdditionalTrigger("Hey");
    AddAdditionalTrigger("Greebas");
    AddAdditionalTrigger("Greebs");
    AddAdditionalTrigger("Huhu");
    AddCondition("lang","german");
    AddTraderTrigger("Farewell","Ronagan's blessing! And watch your back.");
    AddAdditionalTrigger("Good bye");
    AddAdditionalTrigger("Bye");
    AddAdditionalTrigger("Fare thy well");
    AddTraderTrigger("Tschüß","Ronagans Segen! Und paßt auf, was hinter euch passiert.");
    AddAdditionalTrigger("Tschüss");
    AddAdditionalTrigger("Wiedersehen");
    AddAdditionalTrigger("Gehabt euch wohl");
    AddTraderTrigger("Ciao","Ronagan's blessing! And watch your back.");
    AddAdditionalTrigger("Adieu");
    AddAdditionalTrigger("Au revoir");
    AddCondition("lang","english");
    AddTraderTrigger("Ciao","Ronagan's Segen! Und Und paßt auf, was hinter euch passiert!");
    AddAdditionalTrigger("Adieu");
    AddAdditionalTrigger("Au revoir");
    AddCondition("lang","german");
    AddTraderTrigger("How are you","Besides my poor back I'm fine, thank you! Maybe you can help me with a task.");
    AddAdditionalTrigger("How feel");
    AddAdditionalTrigger("How do you do");
    AddTraderTrigger("Wie geht","Abgesehen von meinem Rücken geht es mir gut, danke sehr! Vielleicht könnte Ihr mir ja bei einer Aufgabe helfen.");
    AddAdditionalTrigger("Wie fühlst");
    AddAdditionalTrigger("Wie ist es ergangen");
    AddTraderTrigger("your name","In front of you stands the smuggler Ehrom Goldhammer, aye!");
    AddAdditionalTrigger("who are you");
    AddAdditionalTrigger("who art thou");
    AddTraderTrigger("dein name","Vor Euch steht der Schmuggler Ehrom Goldhammer, aye!");
    AddAdditionalTrigger("wer bist du");
    AddAdditionalTrigger("wer seid ihr");
    AddAdditionalTrigger("wie heißt");
    -- Catching typical NPC phrases
    AddTraderTrigger("what sell","I don't have anything I want to trade at the moment. But I have a special task for you.");
    AddAdditionalTrigger("what buy");
    AddAdditionalTrigger("list wares");
    AddAdditionalTrigger("price of");
    AddTraderTrigger("was verkauf","Ich gibt momentan nichts, was ich handeln möchte. Aber ich habe einen Sonderauftrag für euch.");
    AddAdditionalTrigger("was kauf");
    AddAdditionalTrigger("warenliste");
    AddAdditionalTrigger("preis von");
    AddTraderTrigger("tell something","I don't have time to tell stories. Ronagan be my witness, I'm a dwarf of deeds not of words.");
    AddTraderTrigger("erzähl was","Ich habe keine Zeit Geschichten zu erzählen. Ronagan sei mein Zeug, ich bin ein Zwerg der Taten, nicht der Worte.");
    AddAdditionalTrigger("erzähl etwas");
    -- Small talk: The talk here should focus on possible questions. Feel free to add more!
    AddTraderTrigger("smuggler","Smuggler is such a prestressed word. I make good available to those who have no access to them... at a cost.");
    AddAdditionalTrigger("smuggle");
    AddTraderTrigger("Schmuggler","Schmuggler, das ist so ein vorbelastetes Wort. Ich mache Waren denen zugänglich, die sie normalerweise nicht bekommen würden... für eine Gebühr.");
    AddAdditionalTrigger("Schmuggel");
    AddTraderTrigger("tunnel","As we dwarves like to say: Tunnels are absence of rock in a mountain. But you should always mind your head in the tunnels.");
    AddAdditionalTrigger("gallery");
    AddTraderTrigger("Stollen","Wie wir Zwerge immer sagen: Stollen sind Abwesenheit von Gestein in einem Berg. Aber Ihr solltet in den Stollen immer auf Euren Kopf aufpassen.");
    AddAdditionalTrigger("Tunnel");
    AddTraderTrigger("mountain","Yes, it is true that we dwarves prefer to live under a mountain. We enjoy the comforting and protecting sturdiness of the rocks... and its wealth inside.");
    AddAdditionalTrigger("mountains");
    AddTraderTrigger("Berg","Ja, es ist wahr, wir Zwerge bevorzugen es, unter einem Berg zu leben. Wir genießen die beruhigende und beschützende Festigkeit des Gesteins... und seinen Reichtum im Inneren.");
    AddAdditionalTrigger("Berge");
    AddTraderTrigger("wealth","Well, wealth leads to envy. Envy leads to war. And war leads to suffering. So wealth is both a blessing and a curse. Ronagan knows that, aye.");
    AddTraderTrigger("Reichtum","Nun, Reichtum führt zu Neid. Neid führt zu Krieg. Krieg führt zu Leid. Reichtum ist also sowohl ein Segen als auch ein Fluch. Ronagan weiß das, aye.");
    AddAdditionalTrigger("Reichtümer");
    AddTraderTrigger("darkness","Darkness is part of a life under the mountain. We dwarves can live with it easily but people from the world above sometimes have a problem with it. But you can use a portable light source to fight the darkness.");
    AddTraderTrigger("Dunkelheit","Dunkelheit ist Teil des Lebens unter dem Berg. Wir Zwerge können leicht damit leben, aber Leute von der Welt oben haben manchmal ein Problem damit. Aber Ihr könnt eine tragbare Lichtquelle verwenden, um die Dunkelheit zu bekämpfen.");
    AddTraderTrigger("light","There may not be much daylight under the mountain but we have other light sources. We use torches, candles, lanterns or lamps.");
    AddTraderTrigger("Licht","Es mag vielleicht nicht genug Tageslicht unter dem Berg geben aber wir haben andere Lichtquellen. Wir verwenden Fackeln, Kerzen, Laternen oder Lampen.");
    AddAdditionalTrigger("Lichtquelle");
    AddTraderTrigger("portal","I have heard that there are portals all over Gobaith. They seem to be linked with each other somehow. You step inside, announce where you want to go and in a blink of an eye you are there. I would never use such a magic device.");
    AddCondition("lang","english");
    AddTraderTrigger("Portal","Ich habe gehört, das es überall auf Gobaith Portale gibt. Sie scheinen irgendwie miteinander verbunden zu sein. Man betritt sie, sagt wohin man will und im nächten Augenblick ist man dort. Ich würde nie ein solches magisches Gerät benutzen.");
    AddCondition("lang","german");
    -- Tool hints
    AddTraderTrigger("pickaxe","The pickaxe is the best tool for mining. But don't be fooled by the simple appearance. It is difficult to master. You won't be the first to end up with a pickaxe in a leg, so please be careful!");
    AddTraderTrigger("Spitzhacke","Die Spitzhacke ist das beste Werkzeug für den Bergbau. Aber laßt Euch nicht vom einfachen Äußeren täuschen. Es ist schwer zu meistern. Ihr wäret nicht der Erste mit einer Spitzhacke im Bein endet, also seid bitte vorsichtig!");
    AddTraderTrigger("hammer","The hammer is the trademark of any smith. There are different hammers for each and every purpose. It is important to use the right hammer for the appropriate task.");
    AddCondition("lang","english");
    AddTraderTrigger("Hammer","Der Hammer ist das Erkennungsmerkmaler aller Schmiede. Es gibt verschiedene Hämmer für jeden Zweck. Es ist wichtig den richtigen Hammer für die entsprechende Aufgabe zu benutzen.");
    AddCondition("lang","german");
    AddTraderTrigger("gem","Gems are the true treasure of the mountain. There are many different gems but they all have something in common. They are all rare and you'll need a lot of luck to find suitable raw pieces, I can tell you.");
    AddTraderTrigger("Edelstein","Edelsteine sind der wahre Schatz des Berges. Es gibt viele verschiedene Edelsteine, aber alle haben etwas gemeinsam. Sie sind alle sehr selten und Ihr braucht schon viel Glück passende rohe Stücke zu finden, das kann ich Euch sagen.");
    -- Faction stuff
    AddTraderTrigger("Elvaine","If archmage Morgan knew that his minions order things from me, I think he would slap them with a book.");
    AddAdditionalTrigger("Morgan");
    AddAdditionalTrigger("erzmagier");
    AddAdditionalTrigger("archmage");
    AddCondition("lang","english");
    AddTraderTrigger("Elvaine","Wenn Erzmagier Morgan wüßte, dass seine Leute bei mir Waren bestellen, dann würde er sie sicher mit einem Buch verprügeln.");
    AddAdditionalTrigger("Morgan");
    AddAdditionalTrigger("erzmagier");
    AddAdditionalTrigger("archmage");
    AddCondition("lang","german");
    AddTraderTrigger("Runewick","The people of Runewick come to me to trade for metals and minerals. If you look for them you have to travel south and east.");
    AddCondition("lang","english");
    AddTraderTrigger("Runewick","Die Leute aus Runewick kommen zu mir, um Metalle und Mineralien einzutauschen. Wenn Ihr sie sucht, so müßt Ihr nach Süden und Osten reisen.");
    AddCondition("lang","german");
    AddTraderTrigger("Valerio","If the Don would not rule Galmair, I'd be there again. He interfered with my business too much, so I... had to leave.");
    AddAdditionalTrigger("Guilianni");
    AddAdditionalTrigger("don");
    AddCondition("lang","english");
    AddTraderTrigger("Valerio","Wenn der Don nicht Galmair kontrollieren würde, wäre ich längst wieder da. Er hat sich zu sehr in mein Geschäft eingemischt, also... musste ich das Weite suchen.");
    AddAdditionalTrigger("Guilianni");
    AddAdditionalTrigger("don");
    AddCondition("lang","german");
    AddTraderTrigger("Galmair","Oh, Galmair. You want to know about Galmair? It is much like us dwarves. It may not appear as much on the outside, but its wealth lies within. More I won't reveal at the moment.");
    AddCondition("lang","english");
    AddTraderTrigger("Galmair","Oh, Galmair. Ihr möchtet etwas über Galmair erfahren? Es ist wie wir Zwerge. Es mag von außen als nicht viel erscheinen, aber sein Reichtum liegt innen. Mehr werde ich im Moment nicht verraten.");
    AddCondition("lang","german");
    AddTraderTrigger("rosaline","The queen has placed a bounty on my head. Literally, on my head. So, I better avoid the desert.");
    AddAdditionalTrigger("königin");
    AddAdditionalTrigger("queen");
    AddAdditionalTrigger("edwards");
    AddCondition("lang","english");
    AddTraderTrigger("rosaline","Die Königin hat ein Kopfgeld auf mich ausgesetzt. Genauer, auf meinen Kopf, im wahrsten Sinne des Wortes. Also bleibe ich besser der Wüste fern.");
    AddAdditionalTrigger("königin");
    AddAdditionalTrigger("queen");
    AddAdditionalTrigger("edwards");
    AddCondition("lang","german");
    AddTraderTrigger("Cadomyr","Cadomyr is wealthy, but they don't like me there anymore. I have no honour, they say, so I deserve no head anymore.");
    AddCondition("lang","english");
    AddTraderTrigger("Cadomyr","Cadomyr ist reich an Schätzen, aber sie mögen mich nicht mehr dort. Ich hätte keine Ehre, sagen sie, und daher sollte ich auch keinen Kopf mehr verdient haben.");
    AddCondition("lang","german");
    -- Main land factions
    AddTraderTrigger("albar","Albar?! Oh please, let us talk about something more relevant.");
    AddCondition("lang","english");
    AddTraderTrigger("albar","Albar?! Oh, bitte, lasst uns über etwas wichtigeres sprechen.");
    AddCondition("lang","german");
    AddTraderTrigger("gynk","Some think, all dwarves come from Sevenmountains. I am from Gynk and proud of it!");
    AddAdditionalTrigger("gync");
    AddCondition("lang","english");
    AddTraderTrigger("gync","Viele denken, alle Zwerge kommen aus Siebenbergen. Ich bin aus Gynk und stolz darauf.");
    AddAdditionalTrigger("gynk");
    AddCondition("lang","german");
    AddTraderTrigger("salkama","Salkamar, where is that, anyway?");
    AddCondition("lang","english");
    AddTraderTrigger("salkama","Salkamar, wo soll das eigentlich sein?");
    AddCondition("lang","german");
    -- Gods; each NPC should at react on one god, being a follower of said god
    AddTraderTrigger("Ronagan","I pray to Ronagan, but it is more a matter of respect than worshipping.");
    AddCondition("lang","english");
    AddTraderTrigger("Ronagan","Ich bete zu Ronagan, aber das hat viel mehr mit Respekt als mit Ehrerbietung zu tun.");
    AddCondition("lang","german");
    AddTraderTrigger("Irmorom","Hmm? Shhh!");
    -- 1st quest: Get five copper goblets.
    AddTraderTrigger("quest","So you want to help me. A client of mine needs five copper goblets for a banquet, but I cannot get to Cadomyr's finesmiths to obtain them. I'll reward you generously!");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",0);
    AddCondition("lang","english");
    AddConsequence("qpg","=",1);
    AddConsequence("inform","[New quest] The Smuggler I");
    AddTraderTrigger("quest","Ihr wollt mir also helfen. Einer meiner Klienten benötigt fünf Kupferkelche für ein Bankett. Ich kann allerdings nicht nach Cadomyr gehen, um sie von den Schmieden dort zu besorgen. Ich werde euch großzügig belohnen!");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",0);
    AddCondition("lang","german");
    AddConsequence("qpg","=",1);
    AddConsequence("inform","[Neues Quest] Der Schmuggler I");
    AddTraderTrigger("task","So you want to help me. A client of mine needs five copper goblets for a banquet, but I cannot get to Cadomyr's finesmiths to obtain them. I'll reward you generously!");
    AddAdditionalTrigger("adventure");
    AddCondition("qpg","=",0);
    AddConsequence("qpg","=",1);
    AddConsequence("inform","[New quest] The Smuggler I");
    AddTraderTrigger("Auftrag","Ihr wollt mir also helfen. Einer meiner Klienten benötigt fünf Kupferkelche für ein Bankett. Ich kann allerdings nicht nach Cadomyr gehen, um sie von den Schmieden dort zu besorgen. Ich werde euch großzügig belohnen!");
    AddAdditionalTrigger("Aufgabe");
    AddAdditionalTrigger("Abenteuer");
    AddCondition("qpg","=",0);
    AddConsequence("qpg","=",1);
    AddConsequence("inform","[Neues Quest] Der Schmuggler I");
    AddTraderTrigger("quest","So you want to help me. A client of mine needs five copper goblets for a banquet, but I cannot get to Cadomyr's finesmiths to obtain them. I'll reward you generously!");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",1);
    AddCondition("lang","english");
    AddTraderTrigger("quest","Ihr wollt mir also helfen. Einer meiner Klienten benötigt fünf Kupferkelche für ein Bankett. Ich kann allerdings nicht nach Cadomyr gehen, um sie von den Schmieden dort zu besorgen. Ich werde euch großzügig belohnen!");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",1);
    AddCondition("lang","german");
    AddTraderTrigger("task","So you want to help me. A client of mine needs five copper goblets for a banquet, but I cannot get to Cadomyr's finesmiths to obtain them. I'll reward you generously");
    AddAdditionalTrigger("adventure");
    AddCondition("qpg","=",1);
    AddTraderTrigger("Auftrag","Ihr wollt mir also helfen. Einer meiner Klienten benötigt fünf Kupferkelche für ein Bankett. Ich kann allerdings nicht nach Cadomyr gehen, um sie von den Schmieden dort zu besorgen. Ich werde euch großzügig belohnen!");
    AddAdditionalTrigger("Aufgabe");
    AddAdditionalTrigger("Abenteuer");
    AddCondition("qpg","=",1);
    AddTraderTrigger(".+","Bei Ronagan, ihr habt tatsächlich die Kupferkelche gebracht. Nehmt diese Silberstücke als kleine Anerkennung. Allerdings könnte ich nochmal Eure Dienste bei einem Auftrag brauchen.");
    AddCondition("qpg","=",1);
    AddCondition("item",1840,"all",">",4);
    AddCondition("lang","german");
    AddConsequence("deleteitem",1840,5);
    AddConsequence("money","+",500);
    AddConsequence("inform","[Quest gelöst] Du erhältst 500 Kupferstücke.");
    AddConsequence("qpg","=",2);
    AddTraderTrigger(".+","By Ronagan, you brought copper goblets. Take these silver coins as a small appreciation. But I could use your service again for another order.");
    AddCondition("qpg","=",1);
    AddCondition("item",1840,"all",">",4);
    AddCondition("lang","english");
    AddConsequence("deleteitem",1840,5);
    AddConsequence("money","+",500);
    AddConsequence("inform","[Quest solved] You are awarded 500 copper coins.");
    AddConsequence("qpg","=",2);
    AddTraderTrigger(".+","Ich brauche wenigstens fünf Kupferkelche. Kehrt zurück wenn ihr sie habt.");
    AddCondition("qpg","=",1);
    AddCondition("item",1840,"all","<",5);
    AddCondition("lang","german");
    AddTraderTrigger(".+","I need at least five copper goblets. Return to be when you have them.");
    AddCondition("qpg","=",1);
    AddCondition("item",1840,"all","<",5);
    AddCondition("lang","english");
    -- 2nd quest: Get two dwarven state armour.
    AddTraderTrigger("quest","I got a new order from abroad. A dwarven souvereign ordered two dwarven state armours. But I cannot get to Galmair to get them due to... personal reasons. Please help me for a reward.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",2);
    AddCondition("lang","english");
    AddConsequence("qpg","=",3);
    AddConsequence("inform","[New quest] The Smuggler II");
    AddTraderTrigger("quest","Ich habe eine neue Bestellung aus einem fernen Land bekommen. Ein Zwergenherrscher benötigt zwei Zwergenprunkrüstungen, ich kann aber aus... persönlichen Gründen nicht einfach nach Galmair spazieren, um sie zu holen. Helft mir bitte, für eine angemessene Belohnung.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",2);
    AddCondition("lang","german");
    AddConsequence("qpg","=",3);
    AddConsequence("inform","[Neues Quest] Der Schmuggler II");
    AddTraderTrigger("task","I got a new order from abroad. A dwarven souvereign ordered two dwarven state armours. But I cannot get to Galmair to get them due to... personal reasons. Please help me for a reward.");
    AddAdditionalTrigger("adventure");
    AddCondition("qpg","=",2);
    AddConsequence("qpg","=",3);
    AddConsequence("inform","[New quest] The Smuggler II");
    AddTraderTrigger("Auftrag","Ich habe eine neue Bestellung aus einem fernen Land bekommen. Ein Zwergenherrscher benötigt zwei Zwergenprunkrüstungen, ich kann aber aus... persönlichen Gründen nicht einfach nach Galmair spazieren, um sie zu holen. Helft mir bitte, für eine angemessene Belohnung.");
    AddAdditionalTrigger("Aufgabe");
    AddAdditionalTrigger("Abenteuer");
    AddCondition("qpg","=",2);
    AddConsequence("qpg","=",3);
    AddConsequence("inform","[Neues Quest] Der Schmuggler II");
    AddTraderTrigger("quest","I got a new order from abroad. A dwarven souvereign ordered two dwarven state armours. But I cannot get to Galmair to get them due to... personal reasons. Please help me for a reward.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",3);
    AddCondition("lang","english");
    AddTraderTrigger("quest","Ich habe eine neue Bestellung aus einem fernen Land bekommen. Ein Zwergenherrscher benötigt zwei Zwergenprunkrüstungen, ich kann aber aus... persönlichen Gründen nicht einfach nach Galmair spazieren, um sie zu holen. Helft mir bitte, für eine angemessene Belohnung.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",3);
    AddCondition("lang","german");
    AddTraderTrigger("task","I got a new order from abroad. A dwarven souvereign ordered two dwarven state armours. But I cannot get to Galmair to get them due to... personal reasons. Please help me for a reward.");
    AddAdditionalTrigger("adventure");
    AddCondition("qpg","=",3);
    AddTraderTrigger("Auftrag","Ich habe eine neue Bestellung aus einem fernen Land bekommen. Ein Zwergenherrscher benötigt zwei Zwergenprunkrüstungen, ich kann aber aus... persönlichen Gründen nicht einfach nach Galmair spazieren, um sie zu holen. Helft mir bitte, für eine angemessene Belohnung.");
    AddAdditionalTrigger("Aufgabe");
    AddAdditionalTrigger("Abenteuer");
    AddCondition("qpg","=",3);
    AddTraderTrigger(".+","Aye aye, ich muß schon sagen, Ihr werdet immer besser. Diese Silberstücke gehören nun Euch.");
    AddCondition("qpg","=",3);
    AddCondition("item",2390,"all",">",1);
    AddCondition("lang","german");
    AddConsequence("deleteitem",2390,2);
    AddConsequence("money","+",5000);
    AddConsequence("inform","[Quest gelöst] Du erhältst 5000 Kupferstücke.");
    AddConsequence("qpg","=",4);
    AddTraderTrigger(".+","Aye aye, I have to say that you are getting better and better. These silver coins are yours now.");
    AddCondition("qpg","=",3);
    AddCondition("item",2390,"all",">",1);
    AddCondition("lang","english");
    AddConsequence("deleteitem",2390,2);
    AddConsequence("money","+",5000);
    AddConsequence("inform","[Quest solved] You are awarded 5000 copper coins.");
    AddConsequence("qpg","=",4);
    AddTraderTrigger(".+","Mein Kunde benötigt zwei diskret erworbene Zwergenprunkrüstungen. Bitte beeilt euch.");
    AddCondition("qpg","=",3);
    AddCondition("item",2390,"all","<",2);
    AddCondition("lang","german");
    AddTraderTrigger(".+","My customer needs two dwarven state armours, discreet and fast.");
    AddCondition("qpg","=",3);
    AddCondition("item",2390,"all","<",2);
    AddCondition("lang","english");
    -- 3rd quest: Get 5 black priest robe.
    AddTraderTrigger("quest","A customer, who prefers to remain unnamed, ordered five black priest robes of Runewick origin. 'For his freshmen', he said. Will you bring me those?");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",4);
    AddCondition("lang","english");
    AddConsequence("qpg","=",5);
    AddConsequence("inform","[New quest] The Smuggler III");
    AddTraderTrigger("quest","Einer meiner Auftraggeber, der unerkannt bleiben möchte, hat fünf schwarze Priesterroben nach Runewick-Machart bestellt. 'Für seine Frischlinge', hat er gesagt. Besorgt ihr mir die?");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",4);
    AddCondition("lang","german");
    AddConsequence("qpg","=",5);
    AddConsequence("inform","[Neues Quest] Der Schmuggler III");
    AddTraderTrigger("task","A customer, who prefers to remain unnamed, ordered five black priest robes of Runewick origin. 'For his freshmen', he said. Will you bring me those?");
    AddAdditionalTrigger("adventure");
    AddCondition("qpg","=",4);
    AddConsequence("qpg","=",5);
    AddConsequence("inform","[New quest] The Smuggler III");
    AddTraderTrigger("Auftrag","Einer meiner Auftraggeber, der unerkannt bleiben möchte, hat fünf schwarze Priesterroben nach Runewick-Machart bestellt. 'Für seine Frischlinge', hat er gesagt. Besorgt ihr mir die?");
    AddAdditionalTrigger("Aufgabe");
    AddAdditionalTrigger("Abenteuer");
    AddCondition("qpg","=",4);
    AddConsequence("qpg","=",5);
    AddConsequence("inform","[Neues Quest] Der Schmuggler III");
    AddTraderTrigger("quest","Just five black priest robes is all I still need for my customer. And no questions.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",5);
    AddCondition("lang","english");
    AddTraderTrigger("quest","Fünf schwarze Priesterroben sind alles, was ich für meinen Kunden brauche. Und keine Fragen.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",5);
    AddCondition("lang","german");
    AddTraderTrigger("task","Just five black priest robes is all I still need for my customer. And no questions.");
    AddAdditionalTrigger("adventure");
    AddCondition("qpg","=",5);
    AddTraderTrigger("Auftrag","Fünf schwarze Priesterroben sind alles, was ich für meinen Kunden brauche. Und keine Fragen.");
    AddAdditionalTrigger("Aufgabe");
    AddAdditionalTrigger("Abenteuer");
    AddCondition("qpg","=",5);
    AddTraderTrigger(".+","As scheint, als wäre Ronagan Euch wohlgesonnen. Mein Auftraggeber gab mir diesen Ring als Anzahlung, er ist nun Euer.");
    AddCondition("qpg","=",5);
    AddCondition("item",2420,"all",">",4);
    AddCondition("lang","german");
    AddConsequence("deleteitem",2420,5);
    AddConsequence("item",278,1,999,42);
    AddConsequence("inform","[Quest gelöst] Du erhältst einen magischen Schwarzsteinring.");
    AddConsequence("qpg","=",6);
    AddTraderTrigger(".+","It seems as if Ronagan is looking on you benevolently. My customer gave me this ring in advance, it is now yours.");
    AddCondition("qpg","=",5);
    AddCondition("item",2420,"all",">",4);
    AddCondition("lang","english");
    AddConsequence("deleteitem",2420,5);
    AddConsequence("item",278,1,999,42);
    AddConsequence("inform","[Quest solved] You are awarded a magical blackstone ring.");
    AddConsequence("qpg","=",6);
    AddTraderTrigger(".+","Ich weiss, dass fünf schwarze Priesterroben nicht leicht zu bekommen sind, aber mit Ronagans Segen wird es Euch sicher gelingen.");
    AddCondition("qpg","=",5);
    AddCondition("item",2420,"all","<",5);
    AddCondition("lang","german");
    AddTraderTrigger(".+","I know that five black priest robes are not easy to get but with Ronagan's blessing you will succeed.");
    AddCondition("qpg","=",5);
    AddCondition("item",2420,"all","<",5);
    AddCondition("lang","english");
    -- 4th quest: Get a wand of wind.
    AddTraderTrigger("quest","Psst! I need you for a very special task. Sneak into Runewick and get me a wand of wind. For what? None of your business!");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",6);
    AddCondition("lang","english");
    AddConsequence("qpg","=",7);
    AddConsequence("inform","[New quest] The Smuggler IV");
    AddTraderTrigger("quest","Psst! Ich brauche euch für eine besondere Aufgabe. Schleicht euch nach Runewick und bringt mir einen Zauberstab des Windes. Wofür? Das geht euch nichts an!");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",6);
    AddCondition("lang","german");
    AddConsequence("qpg","=",7);
    AddConsequence("inform","[Neues Quest] Der Schmuggler IV");
    AddTraderTrigger("task","Psst! I need you for a very special task. Sneak into Runewick and get me a wand of wind. For what? None of your business!");
    AddAdditionalTrigger("adventure");
    AddCondition("qpg","=",6);
    AddConsequence("qpg","=",7);
    AddConsequence("inform","[New quest] The Smuggler II");
    AddTraderTrigger("Auftrag","Psst! Ich brauche euch für eine besondere Aufgabe. Schleicht euch nach Runewick und bringt mir einen Zauberstab des Windes. Wofür? Das geht euch nichts an!");
    AddAdditionalTrigger("Aufgabe");
    AddAdditionalTrigger("Abenteuer");
    AddCondition("qpg","=",6);
    AddConsequence("qpg","=",7);
    AddConsequence("inform","[Neues Quest] Der Schmuggler IV");
    AddTraderTrigger("quest","Psst! Ich brauche euch für eine besondere Aufgabe. Schleicht euch nach Runewick und bringt mir einen Zauberstab des Windes. Wofür? Das geht euch nichts an!");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",7);
    AddCondition("lang","german");
    AddTraderTrigger("quest","Psst! I need you for a very special task. Sneak into Runewick and get me a wand of wind. For what? None of your business!");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",7);
    AddCondition("lang","english");
    AddTraderTrigger("task","Psst! Ich brauche euch für eine besondere Aufgabe. Schleicht euch nach Runewick und bringt mir einen Zauberstab des Windes. Wofür? Das geht euch nichts an!");
    AddAdditionalTrigger("adventure");
    AddCondition("qpg","=",7);
    AddTraderTrigger("Auftrag","Psst! I need you for a very special task. Sneak into Runewick and get me a wand of wind. For what? None of your business!");
    AddAdditionalTrigger("Aufgabe");
    AddAdditionalTrigger("Abenteuer");
    AddCondition("qpg","=",7);
    AddTraderTrigger(".+","Ronagans Dank... ja, dieser Zauberstab sollte gut genug sein. Ich habe nur dieses Schwert für euch, welches ich gerne loswerden würde. Fragt nicht, warum und nehmt es an.");
    AddCondition("qpg","=",7);
    AddCondition("item",2785,"all",">",0);
    AddCondition("lang","german");
    AddConsequence("deleteitem",2785,1);
    AddConsequence("item",206,1,999,14);
    AddConsequence("inform","[Quest gelöst] Du erhältst ein Feuerlangschwert.");
    AddConsequence("qpg","=",8);
    AddTraderTrigger(".+","Ronagan's thanks... yes, this wand should be good enough. I just have this word for your, I want to get rid of it. Do not ask why and accept it.");
    AddCondition("qpg","=",7);
    AddCondition("item",2785,"all",">",0);
    AddCondition("lang","english");
    AddConsequence("deleteitem",2785,1);
    AddConsequence("item",206,1,999,14);
    AddConsequence("inform","[Quest solved] You are awarded a fire longsword.");
    AddConsequence("qpg","=",8);
    AddTraderTrigger(".+","Ronagan weiß, dass ich mich bemühe. Bemüht euch auch und bringt mir einen Stab des Windes für meinen Kunden.");
    AddCondition("qpg","=",7);
    AddCondition("item",2785,"all","<",1);
    AddCondition("lang","german");
    AddTraderTrigger(".+","Ronagan knows that I do my best. Do your best and bring me a wand of wind for my customer.");
    AddCondition("qpg","=",7);
    AddCondition("item",2785,"all","<",1);
    AddCondition("lang","english");
    -- Final dialogue: No more quests, just nice hints
    AddTraderTrigger("quest","Ronagan with you... there is nothing left that you can do for me at the moment.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",8);
    AddCondition("lang","english");
    AddTraderTrigger("quest","Ronagan mit Euch... es ist nichts übrig, was Ihr für mich momentan tun könntet.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",8);
    AddCondition("lang","german");
    AddTraderTrigger("task","Ronagan with you... there is nothing left that you can do for me at the moment.");
    AddAdditionalTrigger("adventure");
    AddCondition("qpg","=",8);
    AddTraderTrigger("Auftrag","Ronagan mit Euch... es ist nichts übrig, was Ihr für mich momentan tun könntet.");
    AddAdditionalTrigger("Aufgabe");
    AddAdditionalTrigger("Abenteuer");
    AddCondition("qpg","=",8);
    -- Last catch: Think about keyphrases the player might say and that are not caught until here
    AddTraderTrigger("Yes","Pardon, I don't understand what you are referring to.");
    AddAdditionalText("What do you mean with 'Yes'?");
    AddTraderTrigger("Ja","Verzeiht, ich verstehe nicht, worauf Ihr Euch bezieht.");
    AddAdditionalText("Was meint Ihr mit 'Ja'?");
    AddTraderTrigger("No","Pardon, I don't understand what you are referring to.");
    AddAdditionalText("What do you mean with 'No'?");
    AddTraderTrigger("Nein","Verzeiht, ich verstehe nicht, worauf Ihr Euch bezieht.");
    AddAdditionalText("Was meint Ihr mit 'Nein'?");
    -- Cycletext: Please add at least(!) five cycletext messages. The more, the better. You can use emotes (#me is green), too.
    AddCycleText("#me begutachtet einen Edelstein in seiner Hand sehr sorgfältig.","#me inspects a gem in his hand thoroughly.");
    AddCycleText("#me streicht seinen dunkelgrauen Bart.","#me strokes his dark grey beard.");
    AddCycleText("#me murmelt etwas in seinen dunkelgrauen Bart.","#me voices something under his breath.");
    AddCycleText("#me betrachtet nachdenklich einen Stein in seiner Hand aus allen Winkeln bevor er ihn wegwirft.","#me examines a stone in his hand thoughtfully from all angles before throwing it away.");
    AddCycleText("Arr!","Arr!");
    AddCycleText("Arr.","Arr.");
    AddCycleText("Arr?","Arr?");
    AddCycleText("Das wird einen guten Preis erzielen.","This will yield a good price.");
    AddCycleText("Geheimverstecke? Pah, je offener, desto besser, dann fragt keiner.","Secret compartment? Pah, the more visible, the better. Nobody is gonna ask then.");
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
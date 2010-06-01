-- INSERT INTO npc VALUES (nextval('npc_seq'),1,-110,-420,0,4,false,'Ehrom Goldhammer','npc_ehrom_goldhammer.lua',0);

require("npc.base.autonpcfunctions")
module("npc.ehrom_goldhammer", package.seeall)

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
    npc.base.autonpcfunctions.AddTraderTrigger("Help","");
    npc.base.autonpcfunctions.AddConsequence("inform","[Game Help] This NPC is the smuggler Ehrom Goldhammer. Keyphrases: Hello, quest, smuggler.");
    npc.base.autonpcfunctions.AddTraderTrigger("Hilfe","");
    npc.base.autonpcfunctions.AddConsequence("inform","[Spielhilfe] Dieser NPC ist der Schmuggler Ehrom Goldhammer. Schlüsselwörter: Hallo, Quest, Schmuggler.");
    -- General speech
    npc.base.autonpcfunctions.AddTraderTrigger("Hello","Greetings! Could it be that he send you to me to help me with my task?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greetings");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Be greeted");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hail");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good day");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good morning");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good evening");
    npc.base.autonpcfunctions.AddTraderTrigger("Grüße","Ronagan zum Gruße! Könnte es sein, dass Ronagan Euch zu mir geschickt hat, um mir bei meiner Aufgabe zu helfen?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Gruß");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Seid gegrüßt");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Guten Tag");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Guten Abend");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Mahlzeit");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Tach");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Moin");
    npc.base.autonpcfunctions.AddTraderTrigger("Hiho","Greetings! Could it be that Ronagan sent you to me to help me with my task?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Huhu");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Hiho","Ronagan zum Gruße! Könnte es sein, dass Ronagan Euch zu mir geschickt hat, um mir bei meiner Aufgabe zu helfen?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Huhu");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("Farewell","Ronagan's blessing! And watch your back.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good bye");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Bye");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Fare thy well");
    npc.base.autonpcfunctions.AddTraderTrigger("Tschüß","Ronagans Segen! Und paßt auf, was hinter euch passiert.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Tschüss");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Wiedersehen");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Gehabt euch wohl");
    npc.base.autonpcfunctions.AddTraderTrigger("Ciao","Ronagan's blessing! And watch your back.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Ciao","Ronagan's Segen! Und Und paßt auf, was hinter euch passiert!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("How are you","Besides my poor back I'm fine, thank you! Maybe you can help me with a task.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("How feel");
    npc.base.autonpcfunctions.AddAdditionalTrigger("How do you do");
    npc.base.autonpcfunctions.AddTraderTrigger("Wie geht","Abgesehen von meinem Rücken geht es mir gut, danke sehr! Vielleicht könnte Ihr mir ja bei einer Aufgabe helfen.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Wie fühlst");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Wie ist es ergangen");
    npc.base.autonpcfunctions.AddTraderTrigger("your name","In front of you stands the smuggler Ehrom Goldhammer, aye!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("who are you");
    npc.base.autonpcfunctions.AddAdditionalTrigger("who art thou");
    npc.base.autonpcfunctions.AddTraderTrigger("dein name","Vor Euch steht der Schmuggler Ehrom Goldhammer, aye!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("wer bist du");
    npc.base.autonpcfunctions.AddAdditionalTrigger("wer seid ihr");
    npc.base.autonpcfunctions.AddAdditionalTrigger("wie heißt");
    -- Catching typical NPC phrases
    npc.base.autonpcfunctions.AddTraderTrigger("what sell","I don't have anything I want to trade at the moment. But I have a special task for you.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("what buy");
    npc.base.autonpcfunctions.AddAdditionalTrigger("list wares");
    npc.base.autonpcfunctions.AddAdditionalTrigger("price of");
    npc.base.autonpcfunctions.AddTraderTrigger("was verkauf","Ich gibt momentan nichts, was ich handeln möchte. Aber ich habe einen Sonderauftrag für euch.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("was kauf");
    npc.base.autonpcfunctions.AddAdditionalTrigger("warenliste");
    npc.base.autonpcfunctions.AddAdditionalTrigger("preis von");
    npc.base.autonpcfunctions.AddTraderTrigger("tell something","I don't have time to tell stories. Ronagan be my witness, I'm a dwarf of deeds not of words.");
    npc.base.autonpcfunctions.AddTraderTrigger("erzähl was","Ich habe keine Zeit Geschichten zu erzählen. Ronagan sei mein Zeug, ich bin ein Zwerg der Taten, nicht der Worte.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("erzähl etwas");
    -- Small talk: The talk here should focus on possible questions. Feel free to add more!
    npc.base.autonpcfunctions.AddTraderTrigger("smuggler","Smuggler is such a prestressed word. I make good available to those who have no access to them... at a cost.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("smuggle");
    npc.base.autonpcfunctions.AddTraderTrigger("Schmuggler","Schmuggler, das ist so ein vorbelastetes Wort. Ich mache Waren denen zugänglich, die sie normalerweise nicht bekommen würden... für eine Gebühr.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Schmuggel");
    npc.base.autonpcfunctions.AddTraderTrigger("tunnel","As we dwarves like to say: Tunnels are absence of rock in a mountain. But you should always mind your head in the tunnels.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("gallery");
    npc.base.autonpcfunctions.AddTraderTrigger("Stollen","Wie wir Zwerge immer sagen: Stollen sind Abwesenheit von Gestein in einem Berg. Aber Ihr solltet in den Stollen immer auf Euren Kopf aufpassen.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Tunnel");
    npc.base.autonpcfunctions.AddTraderTrigger("mountain","Yes, it is true that we dwarves prefer to live under a mountain. We enjoy the comforting and protecting sturdiness of the rocks... and its wealth inside.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mountains");
    npc.base.autonpcfunctions.AddTraderTrigger("Berg","Ja, es ist wahr, wir Zwerge bevorzugen es, unter einem Berg zu leben. Wir genießen die beruhigende und beschützende Festigkeit des Gesteins... und seinen Reichtum im Inneren.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Berge");
    npc.base.autonpcfunctions.AddTraderTrigger("wealth","Well, wealth leads to envy. Envy leads to war. And war leads to suffering. So wealth is both a blessing and a curse. Ronagan knows that, aye.");
    npc.base.autonpcfunctions.AddTraderTrigger("Reichtum","Nun, Reichtum führt zu Neid. Neid führt zu Krieg. Krieg führt zu Leid. Reichtum ist also sowohl ein Segen als auch ein Fluch. Ronagan weiß das, aye.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Reichtümer");
    npc.base.autonpcfunctions.AddTraderTrigger("darkness","Darkness is part of a life under the mountain. We dwarves can live with it easily but people from the world above sometimes have a problem with it. But you can use a portable light source to fight the darkness.");
    npc.base.autonpcfunctions.AddTraderTrigger("Dunkelheit","Dunkelheit ist Teil des Lebens unter dem Berg. Wir Zwerge können leicht damit leben, aber Leute von der Welt oben haben manchmal ein Problem damit. Aber Ihr könnt eine tragbare Lichtquelle verwenden, um die Dunkelheit zu bekämpfen.");
    npc.base.autonpcfunctions.AddTraderTrigger("light","There may not be much daylight under the mountain but we have other light sources. We use torches, candles, lanterns or lamps.");
    npc.base.autonpcfunctions.AddTraderTrigger("Licht","Es mag vielleicht nicht genug Tageslicht unter dem Berg geben aber wir haben andere Lichtquellen. Wir verwenden Fackeln, Kerzen, Laternen oder Lampen.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Lichtquelle");
    npc.base.autonpcfunctions.AddTraderTrigger("portal","I have heard that there are portals all over Gobaith. They seem to be linked with each other somehow. You step inside, announce where you want to go and in a blink of an eye you are there. I would never use such a magic device.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Portal","Ich habe gehört, das es überall auf Gobaith Portale gibt. Sie scheinen irgendwie miteinander verbunden zu sein. Man betritt sie, sagt wohin man will und im nächten Augenblick ist man dort. Ich würde nie ein solches magisches Gerät benutzen.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    -- Tool hints
    npc.base.autonpcfunctions.AddTraderTrigger("pickaxe","The pickaxe is the best tool for mining. But don't be fooled by the simple appearance. It is difficult to master. You won't be the first to end up with a pickaxe in a leg, so please be careful!");
    npc.base.autonpcfunctions.AddTraderTrigger("Spitzhacke","Die Spitzhacke ist das beste Werkzeug für den Bergbau. Aber laßt Euch nicht vom einfachen Äußeren täuschen. Es ist schwer zu meistern. Ihr wäret nicht der Erste mit einer Spitzhacke im Bein endet, also seid bitte vorsichtig!");
    npc.base.autonpcfunctions.AddTraderTrigger("hammer","The hammer is the trademark of any smith. There are different hammers for each and every purpose. It is important to use the right hammer for the appropriate task.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Hammer","Der Hammer ist das Erkennungsmerkmaler aller Schmiede. Es gibt verschiedene Hämmer für jeden Zweck. Es ist wichtig den richtigen Hammer für die entsprechende Aufgabe zu benutzen.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("gem","Gems are the true treasure of the mountain. There are many different gems but they all have something in common. They are all rare and you'll need a lot of luck to find suitable raw pieces, I can tell you.");
    npc.base.autonpcfunctions.AddTraderTrigger("Edelstein","Edelsteine sind der wahre Schatz des Berges. Es gibt viele verschiedene Edelsteine, aber alle haben etwas gemeinsam. Sie sind alle sehr selten und Ihr braucht schon viel Glück passende rohe Stücke zu finden, das kann ich Euch sagen.");
    -- Faction stuff
    npc.base.autonpcfunctions.AddTraderTrigger("Elvaine","If archmage Morgan knew that his minions order things from me, I think he would slap them with a book.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Morgan");
    npc.base.autonpcfunctions.AddAdditionalTrigger("erzmagier");
    npc.base.autonpcfunctions.AddAdditionalTrigger("archmage");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Elvaine","Wenn Erzmagier Morgan wüßte, dass seine Leute bei mir Waren bestellen, dann würde er sie sicher mit einem Buch verprügeln.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Morgan");
    npc.base.autonpcfunctions.AddAdditionalTrigger("erzmagier");
    npc.base.autonpcfunctions.AddAdditionalTrigger("archmage");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("Runewick","The people of Runewick come to me to trade for metals and minerals. If you look for them you have to travel south and east.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Runewick","Die Leute aus Runewick kommen zu mir, um Metalle und Mineralien einzutauschen. Wenn Ihr sie sucht, so müßt Ihr nach Süden und Osten reisen.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("Valerio","If the Don would not rule Galmair, I'd be there again. He interfered with my business too much, so I... had to leave.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Guilianni");
    npc.base.autonpcfunctions.AddAdditionalTrigger("don");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Valerio","Wenn der Don nicht Galmair kontrollieren würde, wäre ich längst wieder da. Er hat sich zu sehr in mein Geschäft eingemischt, also... musste ich das Weite suchen.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Guilianni");
    npc.base.autonpcfunctions.AddAdditionalTrigger("don");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("Galmair","Oh, Galmair. You want to know about Galmair? It is much like us dwarves. It may not appear as much on the outside, but its wealth lies within. More I won't reveal at the moment.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Galmair","Oh, Galmair. Ihr möchtet etwas über Galmair erfahren? Es ist wie wir Zwerge. Es mag von außen als nicht viel erscheinen, aber sein Reichtum liegt innen. Mehr werde ich im Moment nicht verraten.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("rosaline","The queen has placed a bounty on my head. Literally, on my head. So, I better avoid the desert.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("königin");
    npc.base.autonpcfunctions.AddAdditionalTrigger("queen");
    npc.base.autonpcfunctions.AddAdditionalTrigger("edwards");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("rosaline","Die Königin hat ein Kopfgeld auf mich ausgesetzt. Genauer, auf meinen Kopf, im wahrsten Sinne des Wortes. Also bleibe ich besser der Wüste fern.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("königin");
    npc.base.autonpcfunctions.AddAdditionalTrigger("queen");
    npc.base.autonpcfunctions.AddAdditionalTrigger("edwards");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("Cadomyr","Cadomyr is wealthy, but they don't like me there anymore. I have no honour, they say, so I deserve no head anymore.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Cadomyr","Cadomyr ist reich an Schätzen, aber sie mögen mich nicht mehr dort. Ich hätte keine Ehre, sagen sie, und daher sollte ich auch keinen Kopf mehr verdient haben.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    -- Main land factions
    npc.base.autonpcfunctions.AddTraderTrigger("albar","Albar?! Oh please, let us talk about something more relevant.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("albar","Albar?! Oh, bitte, lasst uns über etwas wichtigeres sprechen.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("gynk","Some think, all dwarves come from Sevenmountains. I am from Gynk and proud of it!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("gync");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("gync","Viele denken, alle Zwerge kommen aus Siebenbergen. Ich bin aus Gynk und stolz darauf.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("gynk");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("salkama","Salkamar, where is that, anyway?");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("salkama","Salkamar, wo soll das eigentlich sein?");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    -- Gods; each NPC should at react on one god, being a follower of said god
    npc.base.autonpcfunctions.AddTraderTrigger("Ronagan","I pray to Ronagan, but it is more a matter of respect than worshipping.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Ronagan","Ich bete zu Ronagan, aber das hat viel mehr mit Respekt als mit Ehrerbietung zu tun.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("Irmorom","Hmm? Shhh!");
    -- 1st quest: Get five copper goblets.
    npc.base.autonpcfunctions.AddTraderTrigger("quest","So you want to help me. A client of mine needs five copper goblets for a banquet, but I cannot get to Cadomyr's finesmiths to obtain them. I'll reward you generously!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",0);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddConsequence("inform","[New quest] The Smuggler I");
    npc.base.autonpcfunctions.AddTraderTrigger("quest","Ihr wollt mir also helfen. Einer meiner Klienten benötigt fünf Kupferkelche für ein Bankett. Ich kann allerdings nicht nach Cadomyr gehen, um sie von den Schmieden dort zu besorgen. Ich werde euch großzügig belohnen!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",0);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Der Schmuggler I");
    npc.base.autonpcfunctions.AddTraderTrigger("task","So you want to help me. A client of mine needs five copper goblets for a banquet, but I cannot get to Cadomyr's finesmiths to obtain them. I'll reward you generously!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npc.base.autonpcfunctions.AddCondition("qpg","=",0);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddConsequence("inform","[New quest] The Smuggler I");
    npc.base.autonpcfunctions.AddTraderTrigger("Auftrag","Ihr wollt mir also helfen. Einer meiner Klienten benötigt fünf Kupferkelche für ein Bankett. Ich kann allerdings nicht nach Cadomyr gehen, um sie von den Schmieden dort zu besorgen. Ich werde euch großzügig belohnen!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Aufgabe");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npc.base.autonpcfunctions.AddCondition("qpg","=",0);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Der Schmuggler I");
    npc.base.autonpcfunctions.AddTraderTrigger("quest","So you want to help me. A client of mine needs five copper goblets for a banquet, but I cannot get to Cadomyr's finesmiths to obtain them. I'll reward you generously!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("quest","Ihr wollt mir also helfen. Einer meiner Klienten benötigt fünf Kupferkelche für ein Bankett. Ich kann allerdings nicht nach Cadomyr gehen, um sie von den Schmieden dort zu besorgen. Ich werde euch großzügig belohnen!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("task","So you want to help me. A client of mine needs five copper goblets for a banquet, but I cannot get to Cadomyr's finesmiths to obtain them. I'll reward you generously");
    npc.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddTraderTrigger("Auftrag","Ihr wollt mir also helfen. Einer meiner Klienten benötigt fünf Kupferkelche für ein Bankett. Ich kann allerdings nicht nach Cadomyr gehen, um sie von den Schmieden dort zu besorgen. Ich werde euch großzügig belohnen!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Aufgabe");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Bei Ronagan, ihr habt tatsächlich die Kupferkelche gebracht. Nehmt diese Silberstücke als kleine Anerkennung. Allerdings könnte ich nochmal Eure Dienste bei einem Auftrag brauchen.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddCondition("item",1840,"all",">",4);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddConsequence("deleteitem",1840,5);
    npc.base.autonpcfunctions.AddConsequence("money","+",500);
    npc.base.autonpcfunctions.AddConsequence("inform","[Quest gelöst] Du erhältst 500 Kupferstücke.");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","By Ronagan, you brought copper goblets. Take these silver coins as a small appreciation. But I could use your service again for another order.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddCondition("item",1840,"all",">",4);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("deleteitem",1840,5);
    npc.base.autonpcfunctions.AddConsequence("money","+",500);
    npc.base.autonpcfunctions.AddConsequence("inform","[Quest solved] You are awarded 500 copper coins.");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Ich brauche wenigstens fünf Kupferkelche. Kehrt zurück wenn ihr sie habt.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddCondition("item",1840,"all","<",5);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger(".+","I need at least five copper goblets. Return to be when you have them.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddCondition("item",1840,"all","<",5);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    -- 2nd quest: Get two dwarven state armour.
    npc.base.autonpcfunctions.AddTraderTrigger("quest","I got a new order from abroad. A dwarven souvereign ordered two dwarven state armours. But I cannot get to Galmair to get them due to... personal reasons. Please help me for a reward.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",3);
    npc.base.autonpcfunctions.AddConsequence("inform","[New quest] The Smuggler II");
    npc.base.autonpcfunctions.AddTraderTrigger("quest","Ich habe eine neue Bestellung aus einem fernen Land bekommen. Ein Zwergenherrscher benötigt zwei Zwergenprunkrüstungen, ich kann aber aus... persönlichen Gründen nicht einfach nach Galmair spazieren, um sie zu holen. Helft mir bitte, für eine angemessene Belohnung.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",3);
    npc.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Der Schmuggler II");
    npc.base.autonpcfunctions.AddTraderTrigger("task","I got a new order from abroad. A dwarven souvereign ordered two dwarven state armours. But I cannot get to Galmair to get them due to... personal reasons. Please help me for a reward.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",3);
    npc.base.autonpcfunctions.AddConsequence("inform","[New quest] The Smuggler II");
    npc.base.autonpcfunctions.AddTraderTrigger("Auftrag","Ich habe eine neue Bestellung aus einem fernen Land bekommen. Ein Zwergenherrscher benötigt zwei Zwergenprunkrüstungen, ich kann aber aus... persönlichen Gründen nicht einfach nach Galmair spazieren, um sie zu holen. Helft mir bitte, für eine angemessene Belohnung.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Aufgabe");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",3);
    npc.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Der Schmuggler II");
    npc.base.autonpcfunctions.AddTraderTrigger("quest","I got a new order from abroad. A dwarven souvereign ordered two dwarven state armours. But I cannot get to Galmair to get them due to... personal reasons. Please help me for a reward.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",3);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("quest","Ich habe eine neue Bestellung aus einem fernen Land bekommen. Ein Zwergenherrscher benötigt zwei Zwergenprunkrüstungen, ich kann aber aus... persönlichen Gründen nicht einfach nach Galmair spazieren, um sie zu holen. Helft mir bitte, für eine angemessene Belohnung.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",3);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("task","I got a new order from abroad. A dwarven souvereign ordered two dwarven state armours. But I cannot get to Galmair to get them due to... personal reasons. Please help me for a reward.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npc.base.autonpcfunctions.AddCondition("qpg","=",3);
    npc.base.autonpcfunctions.AddTraderTrigger("Auftrag","Ich habe eine neue Bestellung aus einem fernen Land bekommen. Ein Zwergenherrscher benötigt zwei Zwergenprunkrüstungen, ich kann aber aus... persönlichen Gründen nicht einfach nach Galmair spazieren, um sie zu holen. Helft mir bitte, für eine angemessene Belohnung.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Aufgabe");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npc.base.autonpcfunctions.AddCondition("qpg","=",3);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Aye aye, ich muß schon sagen, Ihr werdet immer besser. Diese Silberstücke gehören nun Euch.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",3);
    npc.base.autonpcfunctions.AddCondition("item",2390,"all",">",1);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddConsequence("deleteitem",2390,2);
    npc.base.autonpcfunctions.AddConsequence("money","+",5000);
    npc.base.autonpcfunctions.AddConsequence("inform","[Quest gelöst] Du erhältst 5000 Kupferstücke.");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",4);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Aye aye, I have to say that you are getting better and better. These silver coins are yours now.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",3);
    npc.base.autonpcfunctions.AddCondition("item",2390,"all",">",1);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("deleteitem",2390,2);
    npc.base.autonpcfunctions.AddConsequence("money","+",5000);
    npc.base.autonpcfunctions.AddConsequence("inform","[Quest solved] You are awarded 5000 copper coins.");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",4);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Mein Kunde benötigt zwei diskret erworbene Zwergenprunkrüstungen. Bitte beeilt euch.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",3);
    npc.base.autonpcfunctions.AddCondition("item",2390,"all","<",2);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger(".+","My customer needs two dwarven state armours, discreet and fast.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",3);
    npc.base.autonpcfunctions.AddCondition("item",2390,"all","<",2);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    -- 3rd quest: Get 5 black priest robe.
    npc.base.autonpcfunctions.AddTraderTrigger("quest","A customer, who prefers to remain unnamed, ordered five black priest robes of Runewick origin. 'For his freshmen', he said. Will you bring me those?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",4);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",5);
    npc.base.autonpcfunctions.AddConsequence("inform","[New quest] The Smuggler III");
    npc.base.autonpcfunctions.AddTraderTrigger("quest","Einer meiner Auftraggeber, der unerkannt bleiben möchte, hat fünf schwarze Priesterroben nach Runewick-Machart bestellt. 'Für seine Frischlinge', hat er gesagt. Besorgt ihr mir die?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",4);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",5);
    npc.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Der Schmuggler III");
    npc.base.autonpcfunctions.AddTraderTrigger("task","A customer, who prefers to remain unnamed, ordered five black priest robes of Runewick origin. 'For his freshmen', he said. Will you bring me those?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npc.base.autonpcfunctions.AddCondition("qpg","=",4);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",5);
    npc.base.autonpcfunctions.AddConsequence("inform","[New quest] The Smuggler III");
    npc.base.autonpcfunctions.AddTraderTrigger("Auftrag","Einer meiner Auftraggeber, der unerkannt bleiben möchte, hat fünf schwarze Priesterroben nach Runewick-Machart bestellt. 'Für seine Frischlinge', hat er gesagt. Besorgt ihr mir die?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Aufgabe");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npc.base.autonpcfunctions.AddCondition("qpg","=",4);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",5);
    npc.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Der Schmuggler III");
    npc.base.autonpcfunctions.AddTraderTrigger("quest","Just five black priest robes is all I still need for my customer. And no questions.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",5);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("quest","Fünf schwarze Priesterroben sind alles, was ich für meinen Kunden brauche. Und keine Fragen.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",5);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("task","Just five black priest robes is all I still need for my customer. And no questions.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npc.base.autonpcfunctions.AddCondition("qpg","=",5);
    npc.base.autonpcfunctions.AddTraderTrigger("Auftrag","Fünf schwarze Priesterroben sind alles, was ich für meinen Kunden brauche. Und keine Fragen.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Aufgabe");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npc.base.autonpcfunctions.AddCondition("qpg","=",5);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","As scheint, als wäre Ronagan Euch wohlgesonnen. Mein Auftraggeber gab mir diesen Ring als Anzahlung, er ist nun Euer.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",5);
    npc.base.autonpcfunctions.AddCondition("item",2420,"all",">",4);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddConsequence("deleteitem",2420,5);
    npc.base.autonpcfunctions.AddConsequence("item",278,1,999,42);
    npc.base.autonpcfunctions.AddConsequence("inform","[Quest gelöst] Du erhältst einen magischen Schwarzsteinring.");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",6);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","It seems as if Ronagan is looking on you benevolently. My customer gave me this ring in advance, it is now yours.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",5);
    npc.base.autonpcfunctions.AddCondition("item",2420,"all",">",4);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("deleteitem",2420,5);
    npc.base.autonpcfunctions.AddConsequence("item",278,1,999,42);
    npc.base.autonpcfunctions.AddConsequence("inform","[Quest solved] You are awarded a magical blackstone ring.");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",6);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Ich weiss, dass fünf schwarze Priesterroben nicht leicht zu bekommen sind, aber mit Ronagans Segen wird es Euch sicher gelingen.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",5);
    npc.base.autonpcfunctions.AddCondition("item",2420,"all","<",5);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger(".+","I know that five black priest robes are not easy to get but with Ronagan's blessing you will succeed.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",5);
    npc.base.autonpcfunctions.AddCondition("item",2420,"all","<",5);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    -- 4th quest: Get a wand of wind.
    npc.base.autonpcfunctions.AddTraderTrigger("quest","Psst! I need you for a very special task. Sneak into Runewick and get me a wand of wind. For what? None of your business!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",6);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",7);
    npc.base.autonpcfunctions.AddConsequence("inform","[New quest] The Smuggler IV");
    npc.base.autonpcfunctions.AddTraderTrigger("quest","Psst! Ich brauche euch für eine besondere Aufgabe. Schleicht euch nach Runewick und bringt mir einen Zauberstab des Windes. Wofür? Das geht euch nichts an!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",6);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",7);
    npc.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Der Schmuggler IV");
    npc.base.autonpcfunctions.AddTraderTrigger("task","Psst! I need you for a very special task. Sneak into Runewick and get me a wand of wind. For what? None of your business!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npc.base.autonpcfunctions.AddCondition("qpg","=",6);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",7);
    npc.base.autonpcfunctions.AddConsequence("inform","[New quest] The Smuggler II");
    npc.base.autonpcfunctions.AddTraderTrigger("Auftrag","Psst! Ich brauche euch für eine besondere Aufgabe. Schleicht euch nach Runewick und bringt mir einen Zauberstab des Windes. Wofür? Das geht euch nichts an!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Aufgabe");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npc.base.autonpcfunctions.AddCondition("qpg","=",6);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",7);
    npc.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Der Schmuggler IV");
    npc.base.autonpcfunctions.AddTraderTrigger("quest","Psst! Ich brauche euch für eine besondere Aufgabe. Schleicht euch nach Runewick und bringt mir einen Zauberstab des Windes. Wofür? Das geht euch nichts an!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",7);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("quest","Psst! I need you for a very special task. Sneak into Runewick and get me a wand of wind. For what? None of your business!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",7);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("task","Psst! Ich brauche euch für eine besondere Aufgabe. Schleicht euch nach Runewick und bringt mir einen Zauberstab des Windes. Wofür? Das geht euch nichts an!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npc.base.autonpcfunctions.AddCondition("qpg","=",7);
    npc.base.autonpcfunctions.AddTraderTrigger("Auftrag","Psst! I need you for a very special task. Sneak into Runewick and get me a wand of wind. For what? None of your business!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Aufgabe");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npc.base.autonpcfunctions.AddCondition("qpg","=",7);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Ronagans Dank... ja, dieser Zauberstab sollte gut genug sein. Ich habe nur dieses Schwert für euch, welches ich gerne loswerden würde. Fragt nicht, warum und nehmt es an.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",7);
    npc.base.autonpcfunctions.AddCondition("item",2785,"all",">",0);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddConsequence("deleteitem",2785,1);
    npc.base.autonpcfunctions.AddConsequence("item",206,1,999,14);
    npc.base.autonpcfunctions.AddConsequence("inform","[Quest gelöst] Du erhältst ein Feuerlangschwert.");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",8);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Ronagan's thanks... yes, this wand should be good enough. I just have this word for your, I want to get rid of it. Do not ask why and accept it.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",7);
    npc.base.autonpcfunctions.AddCondition("item",2785,"all",">",0);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("deleteitem",2785,1);
    npc.base.autonpcfunctions.AddConsequence("item",206,1,999,14);
    npc.base.autonpcfunctions.AddConsequence("inform","[Quest solved] You are awarded a fire longsword.");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",8);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Ronagan weiß, dass ich mich bemühe. Bemüht euch auch und bringt mir einen Stab des Windes für meinen Kunden.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",7);
    npc.base.autonpcfunctions.AddCondition("item",2785,"all","<",1);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Ronagan knows that I do my best. Do your best and bring me a wand of wind for my customer.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",7);
    npc.base.autonpcfunctions.AddCondition("item",2785,"all","<",1);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    -- Final dialogue: No more quests, just nice hints
    npc.base.autonpcfunctions.AddTraderTrigger("quest","Ronagan with you... there is nothing left that you can do for me at the moment.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",8);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("quest","Ronagan mit Euch... es ist nichts übrig, was Ihr für mich momentan tun könntet.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",8);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("task","Ronagan with you... there is nothing left that you can do for me at the moment.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npc.base.autonpcfunctions.AddCondition("qpg","=",8);
    npc.base.autonpcfunctions.AddTraderTrigger("Auftrag","Ronagan mit Euch... es ist nichts übrig, was Ihr für mich momentan tun könntet.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Aufgabe");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npc.base.autonpcfunctions.AddCondition("qpg","=",8);
    -- Last catch: Think about keyphrases the player might say and that are not caught until here
    npc.base.autonpcfunctions.AddTraderTrigger("Yes","Pardon, I don't understand what you are referring to.");
    npc.base.autonpcfunctions.AddAdditionalText("What do you mean with 'Yes'?");
    npc.base.autonpcfunctions.AddTraderTrigger("Ja","Verzeiht, ich verstehe nicht, worauf Ihr Euch bezieht.");
    npc.base.autonpcfunctions.AddAdditionalText("Was meint Ihr mit 'Ja'?");
    npc.base.autonpcfunctions.AddTraderTrigger("No","Pardon, I don't understand what you are referring to.");
    npc.base.autonpcfunctions.AddAdditionalText("What do you mean with 'No'?");
    npc.base.autonpcfunctions.AddTraderTrigger("Nein","Verzeiht, ich verstehe nicht, worauf Ihr Euch bezieht.");
    npc.base.autonpcfunctions.AddAdditionalText("Was meint Ihr mit 'Nein'?");
    -- Cycletext: Please add at least(!) five cycletext messages. The more, the better. You can use emotes (#me is green), too.
    npc.base.autonpcfunctions.AddCycleText("#me begutachtet einen Edelstein in seiner Hand sehr sorgfältig.","#me inspects a gem in his hand thoroughly.");
    npc.base.autonpcfunctions.AddCycleText("#me streicht seinen dunkelgrauen Bart.","#me strokes his dark grey beard.");
    npc.base.autonpcfunctions.AddCycleText("#me murmelt etwas in seinen dunkelgrauen Bart.","#me voices something under his breath.");
    npc.base.autonpcfunctions.AddCycleText("#me betrachtet nachdenklich einen Stein in seiner Hand aus allen Winkeln bevor er ihn wegwirft.","#me examines a stone in his hand thoughtfully from all angles before throwing it away.");
    npc.base.autonpcfunctions.AddCycleText("Arr!","Arr!");
    npc.base.autonpcfunctions.AddCycleText("Arr.","Arr.");
    npc.base.autonpcfunctions.AddCycleText("Arr?","Arr?");
    npc.base.autonpcfunctions.AddCycleText("Das wird einen guten Preis erzielen.","This will yield a good price.");
    npc.base.autonpcfunctions.AddCycleText("Geheimverstecke? Pah, je offener, desto besser, dann fragt keiner.","Secret compartment? Pah, the more visible, the better. Nobody is gonna ask then.");
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
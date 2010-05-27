-- INSERT INTO npc VALUES (nextval('npc_seq'),1,-110,-420,0,4,false,'Ehrom Goldhammer','npc_ehrom_goldhammer.lua',0);

require("npcs.base.autonpcfunctions")
module("npcs.ehrom_goldhammer")

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
    npcs.base.autonpcfunctions.AddTraderTrigger("Help","");
    npcs.base.autonpcfunctions.AddConsequence("inform","[Game Help] This NPC is the smuggler Ehrom Goldhammer. Keyphrases: Hello, quest, smuggler.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Hilfe","");
    npcs.base.autonpcfunctions.AddConsequence("inform","[Spielhilfe] Dieser NPC ist der Schmuggler Ehrom Goldhammer. Schlüsselwörter: Hallo, Quest, Schmuggler.");
    -- General speech
    npcs.base.autonpcfunctions.AddTraderTrigger("Hello","Greetings! Could it be that he send you to me to help me with my task?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greetings");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Be greeted");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hail");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good day");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good morning");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good evening");
    npcs.base.autonpcfunctions.AddTraderTrigger("Grüße","Ronagan zum Gruße! Könnte es sein, dass Ronagan Euch zu mir geschickt hat, um mir bei meiner Aufgabe zu helfen?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Gruß");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Seid gegrüßt");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Guten Tag");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Guten Abend");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Mahlzeit");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Tach");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Moin");
    npcs.base.autonpcfunctions.AddTraderTrigger("Hiho","Greetings! Could it be that Ronagan sent you to me to help me with my task?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Huhu");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Hiho","Ronagan zum Gruße! Könnte es sein, dass Ronagan Euch zu mir geschickt hat, um mir bei meiner Aufgabe zu helfen?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Huhu");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("Farewell","Ronagan's blessing! And watch your back.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good bye");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Bye");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Fare thy well");
    npcs.base.autonpcfunctions.AddTraderTrigger("Tschüß","Ronagans Segen! Und paßt auf, was hinter euch passiert.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Tschüss");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Wiedersehen");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Gehabt euch wohl");
    npcs.base.autonpcfunctions.AddTraderTrigger("Ciao","Ronagan's blessing! And watch your back.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Ciao","Ronagan's Segen! Und Und paßt auf, was hinter euch passiert!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("How are you","Besides my poor back I'm fine, thank you! Maybe you can help me with a task.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("How feel");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("How do you do");
    npcs.base.autonpcfunctions.AddTraderTrigger("Wie geht","Abgesehen von meinem Rücken geht es mir gut, danke sehr! Vielleicht könnte Ihr mir ja bei einer Aufgabe helfen.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Wie fühlst");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Wie ist es ergangen");
    npcs.base.autonpcfunctions.AddTraderTrigger("your name","In front of you stands the smuggler Ehrom Goldhammer, aye!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("who are you");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("who art thou");
    npcs.base.autonpcfunctions.AddTraderTrigger("dein name","Vor Euch steht der Schmuggler Ehrom Goldhammer, aye!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wer bist du");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wer seid ihr");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wie heißt");
    -- Catching typical NPC phrases
    npcs.base.autonpcfunctions.AddTraderTrigger("what sell","I don't have anything I want to trade at the moment. But I have a special task for you.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("what buy");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("list wares");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("price of");
    npcs.base.autonpcfunctions.AddTraderTrigger("was verkauf","Ich gibt momentan nichts, was ich handeln möchte. Aber ich habe einen Sonderauftrag für euch.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("was kauf");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("warenliste");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("preis von");
    npcs.base.autonpcfunctions.AddTraderTrigger("tell something","I don't have time to tell stories. Ronagan be my witness, I'm a dwarf of deeds not of words.");
    npcs.base.autonpcfunctions.AddTraderTrigger("erzähl was","Ich habe keine Zeit Geschichten zu erzählen. Ronagan sei mein Zeug, ich bin ein Zwerg der Taten, nicht der Worte.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("erzähl etwas");
    -- Small talk: The talk here should focus on possible questions. Feel free to add more!
    npcs.base.autonpcfunctions.AddTraderTrigger("smuggler","Smuggler is such a prestressed word. I make good available to those who have no access to them... at a cost.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("smuggle");
    npcs.base.autonpcfunctions.AddTraderTrigger("Schmuggler","Schmuggler, das ist so ein vorbelastetes Wort. Ich mache Waren denen zugänglich, die sie normalerweise nicht bekommen würden... für eine Gebühr.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Schmuggel");
    npcs.base.autonpcfunctions.AddTraderTrigger("tunnel","As we dwarves like to say: Tunnels are absence of rock in a mountain. But you should always mind your head in the tunnels.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("gallery");
    npcs.base.autonpcfunctions.AddTraderTrigger("Stollen","Wie wir Zwerge immer sagen: Stollen sind Abwesenheit von Gestein in einem Berg. Aber Ihr solltet in den Stollen immer auf Euren Kopf aufpassen.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Tunnel");
    npcs.base.autonpcfunctions.AddTraderTrigger("mountain","Yes, it is true that we dwarves prefer to live under a mountain. We enjoy the comforting and protecting sturdiness of the rocks... and its wealth inside.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mountains");
    npcs.base.autonpcfunctions.AddTraderTrigger("Berg","Ja, es ist wahr, wir Zwerge bevorzugen es, unter einem Berg zu leben. Wir genießen die beruhigende und beschützende Festigkeit des Gesteins... und seinen Reichtum im Inneren.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Berge");
    npcs.base.autonpcfunctions.AddTraderTrigger("wealth","Well, wealth leads to envy. Envy leads to war. And war leads to suffering. So wealth is both a blessing and a curse. Ronagan knows that, aye.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Reichtum","Nun, Reichtum führt zu Neid. Neid führt zu Krieg. Krieg führt zu Leid. Reichtum ist also sowohl ein Segen als auch ein Fluch. Ronagan weiß das, aye.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Reichtümer");
    npcs.base.autonpcfunctions.AddTraderTrigger("darkness","Darkness is part of a life under the mountain. We dwarves can live with it easily but people from the world above sometimes have a problem with it. But you can use a portable light source to fight the darkness.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Dunkelheit","Dunkelheit ist Teil des Lebens unter dem Berg. Wir Zwerge können leicht damit leben, aber Leute von der Welt oben haben manchmal ein Problem damit. Aber Ihr könnt eine tragbare Lichtquelle verwenden, um die Dunkelheit zu bekämpfen.");
    npcs.base.autonpcfunctions.AddTraderTrigger("light","There may not be much daylight under the mountain but we have other light sources. We use torches, candles, lanterns or lamps.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Licht","Es mag vielleicht nicht genug Tageslicht unter dem Berg geben aber wir haben andere Lichtquellen. Wir verwenden Fackeln, Kerzen, Laternen oder Lampen.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Lichtquelle");
    npcs.base.autonpcfunctions.AddTraderTrigger("portal","I have heard that there are portals all over Gobaith. They seem to be linked with each other somehow. You step inside, announce where you want to go and in a blink of an eye you are there. I would never use such a magic device.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Portal","Ich habe gehört, das es überall auf Gobaith Portale gibt. Sie scheinen irgendwie miteinander verbunden zu sein. Man betritt sie, sagt wohin man will und im nächten Augenblick ist man dort. Ich würde nie ein solches magisches Gerät benutzen.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    -- Tool hints
    npcs.base.autonpcfunctions.AddTraderTrigger("pickaxe","The pickaxe is the best tool for mining. But don't be fooled by the simple appearance. It is difficult to master. You won't be the first to end up with a pickaxe in a leg, so please be careful!");
    npcs.base.autonpcfunctions.AddTraderTrigger("Spitzhacke","Die Spitzhacke ist das beste Werkzeug für den Bergbau. Aber laßt Euch nicht vom einfachen Äußeren täuschen. Es ist schwer zu meistern. Ihr wäret nicht der Erste mit einer Spitzhacke im Bein endet, also seid bitte vorsichtig!");
    npcs.base.autonpcfunctions.AddTraderTrigger("hammer","The hammer is the trademark of any smith. There are different hammers for each and every purpose. It is important to use the right hammer for the appropriate task.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Hammer","Der Hammer ist das Erkennungsmerkmaler aller Schmiede. Es gibt verschiedene Hämmer für jeden Zweck. Es ist wichtig den richtigen Hammer für die entsprechende Aufgabe zu benutzen.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("gem","Gems are the true treasure of the mountain. There are many different gems but they all have something in common. They are all rare and you'll need a lot of luck to find suitable raw pieces, I can tell you.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Edelstein","Edelsteine sind der wahre Schatz des Berges. Es gibt viele verschiedene Edelsteine, aber alle haben etwas gemeinsam. Sie sind alle sehr selten und Ihr braucht schon viel Glück passende rohe Stücke zu finden, das kann ich Euch sagen.");
    -- Faction stuff
    npcs.base.autonpcfunctions.AddTraderTrigger("Elvaine","If archmage Morgan knew that his minions order things from me, I think he would slap them with a book.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Morgan");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("erzmagier");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("archmage");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Elvaine","Wenn Erzmagier Morgan wüßte, dass seine Leute bei mir Waren bestellen, dann würde er sie sicher mit einem Buch verprügeln.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Morgan");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("erzmagier");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("archmage");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("Runewick","The people of Runewick come to me to trade for metals and minerals. If you look for them you have to travel south and east.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Runewick","Die Leute aus Runewick kommen zu mir, um Metalle und Mineralien einzutauschen. Wenn Ihr sie sucht, so müßt Ihr nach Süden und Osten reisen.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("Valerio","If the Don would not rule Galmair, I'd be there again. He interfered with my business too much, so I... had to leave.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Guilianni");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("don");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Valerio","Wenn der Don nicht Galmair kontrollieren würde, wäre ich längst wieder da. Er hat sich zu sehr in mein Geschäft eingemischt, also... musste ich das Weite suchen.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Guilianni");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("don");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("Galmair","Oh, Galmair. You want to know about Galmair? It is much like us dwarves. It may not appear as much on the outside, but its wealth lies within. More I won't reveal at the moment.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Galmair","Oh, Galmair. Ihr möchtet etwas über Galmair erfahren? Es ist wie wir Zwerge. Es mag von außen als nicht viel erscheinen, aber sein Reichtum liegt innen. Mehr werde ich im Moment nicht verraten.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("rosaline","The queen has placed a bounty on my head. Literally, on my head. So, I better avoid the desert.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("königin");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("queen");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("edwards");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("rosaline","Die Königin hat ein Kopfgeld auf mich ausgesetzt. Genauer, auf meinen Kopf, im wahrsten Sinne des Wortes. Also bleibe ich besser der Wüste fern.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("königin");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("queen");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("edwards");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("Cadomyr","Cadomyr is wealthy, but they don't like me there anymore. I have no honour, they say, so I deserve no head anymore.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Cadomyr","Cadomyr ist reich an Schätzen, aber sie mögen mich nicht mehr dort. Ich hätte keine Ehre, sagen sie, und daher sollte ich auch keinen Kopf mehr verdient haben.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    -- Main land factions
    npcs.base.autonpcfunctions.AddTraderTrigger("albar","Albar?! Oh please, let us talk about something more relevant.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("albar","Albar?! Oh, bitte, lasst uns über etwas wichtigeres sprechen.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("gynk","Some think, all dwarves come from Sevenmountains. I am from Gynk and proud of it!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("gync");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("gync","Viele denken, alle Zwerge kommen aus Siebenbergen. Ich bin aus Gynk und stolz darauf.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("gynk");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("salkama","Salkamar, where is that, anyway?");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("salkama","Salkamar, wo soll das eigentlich sein?");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    -- Gods; each NPC should at react on one god, being a follower of said god
    npcs.base.autonpcfunctions.AddTraderTrigger("Ronagan","I pray to Ronagan, but it is more a matter of respect than worshipping.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Ronagan","Ich bete zu Ronagan, aber das hat viel mehr mit Respekt als mit Ehrerbietung zu tun.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("Irmorom","Hmm? Shhh!");
    -- 1st quest: Get five copper goblets.
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","So you want to help me. A client of mine needs five copper goblets for a banquet, but I cannot get to Cadomyr's finesmiths to obtain them. I'll reward you generously!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",0);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("inform","[New quest] The Smuggler I");
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Ihr wollt mir also helfen. Einer meiner Klienten benötigt fünf Kupferkelche für ein Bankett. Ich kann allerdings nicht nach Cadomyr gehen, um sie von den Schmieden dort zu besorgen. Ich werde euch großzügig belohnen!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",0);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Der Schmuggler I");
    npcs.base.autonpcfunctions.AddTraderTrigger("task","So you want to help me. A client of mine needs five copper goblets for a banquet, but I cannot get to Cadomyr's finesmiths to obtain them. I'll reward you generously!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",0);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("inform","[New quest] The Smuggler I");
    npcs.base.autonpcfunctions.AddTraderTrigger("Auftrag","Ihr wollt mir also helfen. Einer meiner Klienten benötigt fünf Kupferkelche für ein Bankett. Ich kann allerdings nicht nach Cadomyr gehen, um sie von den Schmieden dort zu besorgen. Ich werde euch großzügig belohnen!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Aufgabe");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",0);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Der Schmuggler I");
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","So you want to help me. A client of mine needs five copper goblets for a banquet, but I cannot get to Cadomyr's finesmiths to obtain them. I'll reward you generously!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Ihr wollt mir also helfen. Einer meiner Klienten benötigt fünf Kupferkelche für ein Bankett. Ich kann allerdings nicht nach Cadomyr gehen, um sie von den Schmieden dort zu besorgen. Ich werde euch großzügig belohnen!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("task","So you want to help me. A client of mine needs five copper goblets for a banquet, but I cannot get to Cadomyr's finesmiths to obtain them. I'll reward you generously");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("Auftrag","Ihr wollt mir also helfen. Einer meiner Klienten benötigt fünf Kupferkelche für ein Bankett. Ich kann allerdings nicht nach Cadomyr gehen, um sie von den Schmieden dort zu besorgen. Ich werde euch großzügig belohnen!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Aufgabe");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Bei Ronagan, ihr habt tatsächlich die Kupferkelche gebracht. Nehmt diese Silberstücke als kleine Anerkennung. Allerdings könnte ich nochmal Eure Dienste bei einem Auftrag brauchen.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddCondition("item",1840,"all",">",4);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddConsequence("deleteitem",1840,5);
    npcs.base.autonpcfunctions.AddConsequence("money","+",500);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Quest gelöst] Du erhältst 500 Kupferstücke.");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","By Ronagan, you brought copper goblets. Take these silver coins as a small appreciation. But I could use your service again for another order.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddCondition("item",1840,"all",">",4);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("deleteitem",1840,5);
    npcs.base.autonpcfunctions.AddConsequence("money","+",500);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Quest solved] You are awarded 500 copper coins.");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Ich brauche wenigstens fünf Kupferkelche. Kehrt zurück wenn ihr sie habt.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddCondition("item",1840,"all","<",5);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","I need at least five copper goblets. Return to be when you have them.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddCondition("item",1840,"all","<",5);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    -- 2nd quest: Get two dwarven state armour.
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","I got a new order from abroad. A dwarven souvereign ordered two dwarven state armours. But I cannot get to Galmair to get them due to... personal reasons. Please help me for a reward.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",3);
    npcs.base.autonpcfunctions.AddConsequence("inform","[New quest] The Smuggler II");
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Ich habe eine neue Bestellung aus einem fernen Land bekommen. Ein Zwergenherrscher benötigt zwei Zwergenprunkrüstungen, ich kann aber aus... persönlichen Gründen nicht einfach nach Galmair spazieren, um sie zu holen. Helft mir bitte, für eine angemessene Belohnung.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",3);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Der Schmuggler II");
    npcs.base.autonpcfunctions.AddTraderTrigger("task","I got a new order from abroad. A dwarven souvereign ordered two dwarven state armours. But I cannot get to Galmair to get them due to... personal reasons. Please help me for a reward.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",3);
    npcs.base.autonpcfunctions.AddConsequence("inform","[New quest] The Smuggler II");
    npcs.base.autonpcfunctions.AddTraderTrigger("Auftrag","Ich habe eine neue Bestellung aus einem fernen Land bekommen. Ein Zwergenherrscher benötigt zwei Zwergenprunkrüstungen, ich kann aber aus... persönlichen Gründen nicht einfach nach Galmair spazieren, um sie zu holen. Helft mir bitte, für eine angemessene Belohnung.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Aufgabe");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",3);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Der Schmuggler II");
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","I got a new order from abroad. A dwarven souvereign ordered two dwarven state armours. But I cannot get to Galmair to get them due to... personal reasons. Please help me for a reward.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",3);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Ich habe eine neue Bestellung aus einem fernen Land bekommen. Ein Zwergenherrscher benötigt zwei Zwergenprunkrüstungen, ich kann aber aus... persönlichen Gründen nicht einfach nach Galmair spazieren, um sie zu holen. Helft mir bitte, für eine angemessene Belohnung.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",3);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("task","I got a new order from abroad. A dwarven souvereign ordered two dwarven state armours. But I cannot get to Galmair to get them due to... personal reasons. Please help me for a reward.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",3);
    npcs.base.autonpcfunctions.AddTraderTrigger("Auftrag","Ich habe eine neue Bestellung aus einem fernen Land bekommen. Ein Zwergenherrscher benötigt zwei Zwergenprunkrüstungen, ich kann aber aus... persönlichen Gründen nicht einfach nach Galmair spazieren, um sie zu holen. Helft mir bitte, für eine angemessene Belohnung.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Aufgabe");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",3);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Aye aye, ich muß schon sagen, Ihr werdet immer besser. Diese Silberstücke gehören nun Euch.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",3);
    npcs.base.autonpcfunctions.AddCondition("item",2390,"all",">",1);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddConsequence("deleteitem",2390,2);
    npcs.base.autonpcfunctions.AddConsequence("money","+",5000);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Quest gelöst] Du erhältst 5000 Kupferstücke.");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",4);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Aye aye, I have to say that you are getting better and better. These silver coins are yours now.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",3);
    npcs.base.autonpcfunctions.AddCondition("item",2390,"all",">",1);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("deleteitem",2390,2);
    npcs.base.autonpcfunctions.AddConsequence("money","+",5000);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Quest solved] You are awarded 5000 copper coins.");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",4);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Mein Kunde benötigt zwei diskret erworbene Zwergenprunkrüstungen. Bitte beeilt euch.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",3);
    npcs.base.autonpcfunctions.AddCondition("item",2390,"all","<",2);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","My customer needs two dwarven state armours, discreet and fast.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",3);
    npcs.base.autonpcfunctions.AddCondition("item",2390,"all","<",2);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    -- 3rd quest: Get 5 black priest robe.
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","A customer, who prefers to remain unnamed, ordered five black priest robes of Runewick origin. 'For his freshmen', he said. Will you bring me those?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",4);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",5);
    npcs.base.autonpcfunctions.AddConsequence("inform","[New quest] The Smuggler III");
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Einer meiner Auftraggeber, der unerkannt bleiben möchte, hat fünf schwarze Priesterroben nach Runewick-Machart bestellt. 'Für seine Frischlinge', hat er gesagt. Besorgt ihr mir die?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",4);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",5);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Der Schmuggler III");
    npcs.base.autonpcfunctions.AddTraderTrigger("task","A customer, who prefers to remain unnamed, ordered five black priest robes of Runewick origin. 'For his freshmen', he said. Will you bring me those?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",4);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",5);
    npcs.base.autonpcfunctions.AddConsequence("inform","[New quest] The Smuggler III");
    npcs.base.autonpcfunctions.AddTraderTrigger("Auftrag","Einer meiner Auftraggeber, der unerkannt bleiben möchte, hat fünf schwarze Priesterroben nach Runewick-Machart bestellt. 'Für seine Frischlinge', hat er gesagt. Besorgt ihr mir die?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Aufgabe");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",4);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",5);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Der Schmuggler III");
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Just five black priest robes is all I still need for my customer. And no questions.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",5);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Fünf schwarze Priesterroben sind alles, was ich für meinen Kunden brauche. Und keine Fragen.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",5);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("task","Just five black priest robes is all I still need for my customer. And no questions.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",5);
    npcs.base.autonpcfunctions.AddTraderTrigger("Auftrag","Fünf schwarze Priesterroben sind alles, was ich für meinen Kunden brauche. Und keine Fragen.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Aufgabe");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",5);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","As scheint, als wäre Ronagan Euch wohlgesonnen. Mein Auftraggeber gab mir diesen Ring als Anzahlung, er ist nun Euer.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",5);
    npcs.base.autonpcfunctions.AddCondition("item",2420,"all",">",4);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddConsequence("deleteitem",2420,5);
    npcs.base.autonpcfunctions.AddConsequence("item",278,1,999,42);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Quest gelöst] Du erhältst einen magischen Schwarzsteinring.");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",6);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","It seems as if Ronagan is looking on you benevolently. My customer gave me this ring in advance, it is now yours.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",5);
    npcs.base.autonpcfunctions.AddCondition("item",2420,"all",">",4);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("deleteitem",2420,5);
    npcs.base.autonpcfunctions.AddConsequence("item",278,1,999,42);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Quest solved] You are awarded a magical blackstone ring.");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",6);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Ich weiss, dass fünf schwarze Priesterroben nicht leicht zu bekommen sind, aber mit Ronagans Segen wird es Euch sicher gelingen.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",5);
    npcs.base.autonpcfunctions.AddCondition("item",2420,"all","<",5);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","I know that five black priest robes are not easy to get but with Ronagan's blessing you will succeed.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",5);
    npcs.base.autonpcfunctions.AddCondition("item",2420,"all","<",5);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    -- 4th quest: Get a wand of wind.
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Psst! I need you for a very special task. Sneak into Runewick and get me a wand of wind. For what? None of your business!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",6);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",7);
    npcs.base.autonpcfunctions.AddConsequence("inform","[New quest] The Smuggler IV");
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Psst! Ich brauche euch für eine besondere Aufgabe. Schleicht euch nach Runewick und bringt mir einen Zauberstab des Windes. Wofür? Das geht euch nichts an!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",6);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",7);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Der Schmuggler IV");
    npcs.base.autonpcfunctions.AddTraderTrigger("task","Psst! I need you for a very special task. Sneak into Runewick and get me a wand of wind. For what? None of your business!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",6);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",7);
    npcs.base.autonpcfunctions.AddConsequence("inform","[New quest] The Smuggler II");
    npcs.base.autonpcfunctions.AddTraderTrigger("Auftrag","Psst! Ich brauche euch für eine besondere Aufgabe. Schleicht euch nach Runewick und bringt mir einen Zauberstab des Windes. Wofür? Das geht euch nichts an!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Aufgabe");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",6);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",7);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Der Schmuggler IV");
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Psst! Ich brauche euch für eine besondere Aufgabe. Schleicht euch nach Runewick und bringt mir einen Zauberstab des Windes. Wofür? Das geht euch nichts an!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",7);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Psst! I need you for a very special task. Sneak into Runewick and get me a wand of wind. For what? None of your business!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",7);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("task","Psst! Ich brauche euch für eine besondere Aufgabe. Schleicht euch nach Runewick und bringt mir einen Zauberstab des Windes. Wofür? Das geht euch nichts an!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",7);
    npcs.base.autonpcfunctions.AddTraderTrigger("Auftrag","Psst! I need you for a very special task. Sneak into Runewick and get me a wand of wind. For what? None of your business!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Aufgabe");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",7);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Ronagans Dank... ja, dieser Zauberstab sollte gut genug sein. Ich habe nur dieses Schwert für euch, welches ich gerne loswerden würde. Fragt nicht, warum und nehmt es an.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",7);
    npcs.base.autonpcfunctions.AddCondition("item",2785,"all",">",0);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddConsequence("deleteitem",2785,1);
    npcs.base.autonpcfunctions.AddConsequence("item",206,1,999,14);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Quest gelöst] Du erhältst ein Feuerlangschwert.");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",8);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Ronagan's thanks... yes, this wand should be good enough. I just have this word for your, I want to get rid of it. Do not ask why and accept it.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",7);
    npcs.base.autonpcfunctions.AddCondition("item",2785,"all",">",0);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("deleteitem",2785,1);
    npcs.base.autonpcfunctions.AddConsequence("item",206,1,999,14);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Quest solved] You are awarded a fire longsword.");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",8);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Ronagan weiß, dass ich mich bemühe. Bemüht euch auch und bringt mir einen Stab des Windes für meinen Kunden.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",7);
    npcs.base.autonpcfunctions.AddCondition("item",2785,"all","<",1);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Ronagan knows that I do my best. Do your best and bring me a wand of wind for my customer.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",7);
    npcs.base.autonpcfunctions.AddCondition("item",2785,"all","<",1);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    -- Final dialogue: No more quests, just nice hints
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Ronagan with you... there is nothing left that you can do for me at the moment.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",8);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Ronagan mit Euch... es ist nichts übrig, was Ihr für mich momentan tun könntet.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",8);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("task","Ronagan with you... there is nothing left that you can do for me at the moment.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",8);
    npcs.base.autonpcfunctions.AddTraderTrigger("Auftrag","Ronagan mit Euch... es ist nichts übrig, was Ihr für mich momentan tun könntet.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Aufgabe");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",8);
    -- Last catch: Think about keyphrases the player might say and that are not caught until here
    npcs.base.autonpcfunctions.AddTraderTrigger("Yes","Pardon, I don't understand what you are referring to.");
    npcs.base.autonpcfunctions.AddAdditionalText("What do you mean with 'Yes'?");
    npcs.base.autonpcfunctions.AddTraderTrigger("Ja","Verzeiht, ich verstehe nicht, worauf Ihr Euch bezieht.");
    npcs.base.autonpcfunctions.AddAdditionalText("Was meint Ihr mit 'Ja'?");
    npcs.base.autonpcfunctions.AddTraderTrigger("No","Pardon, I don't understand what you are referring to.");
    npcs.base.autonpcfunctions.AddAdditionalText("What do you mean with 'No'?");
    npcs.base.autonpcfunctions.AddTraderTrigger("Nein","Verzeiht, ich verstehe nicht, worauf Ihr Euch bezieht.");
    npcs.base.autonpcfunctions.AddAdditionalText("Was meint Ihr mit 'Nein'?");
    -- Cycletext: Please add at least(!) five cycletext messages. The more, the better. You can use emotes (#me is green), too.
    npcs.base.autonpcfunctions.AddCycleText("#me begutachtet einen Edelstein in seiner Hand sehr sorgfältig.","#me inspects a gem in his hand thoroughly.");
    npcs.base.autonpcfunctions.AddCycleText("#me streicht seinen dunkelgrauen Bart.","#me strokes his dark grey beard.");
    npcs.base.autonpcfunctions.AddCycleText("#me murmelt etwas in seinen dunkelgrauen Bart.","#me voices something under his breath.");
    npcs.base.autonpcfunctions.AddCycleText("#me betrachtet nachdenklich einen Stein in seiner Hand aus allen Winkeln bevor er ihn wegwirft.","#me examines a stone in his hand thoughtfully from all angles before throwing it away.");
    npcs.base.autonpcfunctions.AddCycleText("Arr!","Arr!");
    npcs.base.autonpcfunctions.AddCycleText("Arr.","Arr.");
    npcs.base.autonpcfunctions.AddCycleText("Arr?","Arr?");
    npcs.base.autonpcfunctions.AddCycleText("Das wird einen guten Preis erzielen.","This will yield a good price.");
    npcs.base.autonpcfunctions.AddCycleText("Geheimverstecke? Pah, je offener, desto besser, dann fragt keiner.","Secret compartment? Pah, the more visible, the better. Nobody is gonna ask then.");
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
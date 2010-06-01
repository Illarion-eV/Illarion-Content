-- INSERT INTO npc VALUES (nextval('npc_seq'),0,119,594,0,2,false,'Frobenius','npc_frobenius.lua',0);

require("npc.base.autonpcfunctions")
module("npc.frobenius", package.seeall)

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

    QuestID = 0;
    -- NPC by Estralis Seborian
    -- This NPC is supposed to trade (all goods are sold and bought, percentage indicates ratio of price bough/sold):
    -- 5% Tools (Blacksmith): 23, 2697, 2710, 2748, 2751
    -- 5% Assorted metal armour: 325, 326, 529, 530, 531, 699, 770, 771, 2111, 2112, 2116, 2117, 2172
    -- 5% Axes: 77, 88, 124, 188, 192, 205, 229, 296, 383, 2629, 2642, 2660, 2711, 2946
    -- 5% Blades: 2526, 2542, 2562, 2563, 2564, 2565, 2568, 2569, 2707
    -- 5% Concussion weapons: 226, 230, 231, 2647, 2664, 2737
    -- 5% Daggers: 27, 189, 190, 297, 389, 398, 444, 2675, 2740
    -- 5% Intermediate Metal products: 2537, 2696
    -- 5% Iron goods: 223, 466, 739
    -- 5% Metal body armour: 4, 101, 696, 2357, 2359, 2360, 2363, 2364, 2365, 2367, 2369, 2389, 2390,2393, 2395, 2399, 2400, 2403, 2407
    -- 5% Metal ingots: 104, 236, 2550, 2535, 2571
    -- 5% Swords: 1, 25, 78, 84, 85, 98, 123, 204, 445, 2658, 2701, 2731, 2757, 2775, 2778
    -- 5% Helmets: 7, 16, 94, 184, 185, 187, 202, 324, 2286, 2287, 2290, 2291, 2302, 2441, 2444
    -- Help 
    npc.base.autonpcfunctions.AddTraderTrigger("Help","");
    npc.base.autonpcfunctions.AddConsequence("inform","[Game Help] This NPC is the blacksmith Frobenius. Keyphrases: Hello, blacksmith.");
    npc.base.autonpcfunctions.AddTraderTrigger("Hilfe","");
    npc.base.autonpcfunctions.AddConsequence("inform","[Spielhilfe] Dieser NPC ist der Schmied Frobenius. Schlüsselwörter: Hallo, Schmied.");
    -- General speech
    npc.base.autonpcfunctions.AddTraderTrigger("Hello","Let's get to business, alright?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greetings");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Be greeted");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hail");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good day");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good morning");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good evening");
    npc.base.autonpcfunctions.AddTraderTrigger("Grüße","Lasst uns zum Geschäft kommen, ja?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Gruß");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Seid gegrüßt");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Guten Tag");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Guten Abend");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Mahlzeit");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Tach");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Moin");
    npc.base.autonpcfunctions.AddTraderTrigger("Hiho","Let's get to business, alright?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Hiho","Lasst uns zum Geschäft kommen, ja?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("Farewell","Kill some scum with my weapons, will you?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good bye");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Bye");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Fare thy well");
    npc.base.autonpcfunctions.AddTraderTrigger("Tschüß","Tötet Abschaum mit meinen Waffen, ja?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Tschüss");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Wiedersehen");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Gehabt euch wohl");
    npc.base.autonpcfunctions.AddTraderTrigger("Ciao","Kill some scum with my weapons, will you?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Ciao","Tötet Abschaum mit meinen Waffen, ja?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("How are you","Pardon me, but I do not want to talk about my feelings.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("How feel");
    npc.base.autonpcfunctions.AddAdditionalTrigger("How do you do");
    npc.base.autonpcfunctions.AddTraderTrigger("Wie geht","Entschuldigt, aber ich möchte nicht über meine Gefühle reden.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Wie fühlst");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Wie ist es ergangen");
    npc.base.autonpcfunctions.AddTraderTrigger("your name","Frobenius!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("who are you");
    npc.base.autonpcfunctions.AddAdditionalTrigger("who art thou");
    npc.base.autonpcfunctions.AddAdditionalText("I am Frobenius, the blacksmith.");
    npc.base.autonpcfunctions.AddTraderTrigger("dein name","Frobenius!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("wer bist du");
    npc.base.autonpcfunctions.AddAdditionalTrigger("wer seid ihr");
    npc.base.autonpcfunctions.AddAdditionalTrigger("wie heißt");
    npc.base.autonpcfunctions.AddAdditionalText("Ich bin Frobenius, der Schmied.");
    -- Catching typical NPC phrases 
    npc.base.autonpcfunctions.AddTraderTrigger("what sell","I sell swords!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("what buy");
    npc.base.autonpcfunctions.AddAdditionalTrigger("list wares");
    npc.base.autonpcfunctions.AddAdditionalTrigger("price of");
    npc.base.autonpcfunctions.AddAdditionalText("I sell helmets!");
    npc.base.autonpcfunctions.AddAdditionalText("I sell axes!");
    npc.base.autonpcfunctions.AddAdditionalText("I sell armour!");
    npc.base.autonpcfunctions.AddTraderTrigger("was verkauf","Ich verkaufe Schwerter!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("was kauf");
    npc.base.autonpcfunctions.AddAdditionalTrigger("warenliste");
    npc.base.autonpcfunctions.AddAdditionalTrigger("preis von");
    npc.base.autonpcfunctions.AddAdditionalText("Ich verkaufe Helme!");
    npc.base.autonpcfunctions.AddAdditionalText("Ich verkaufe Äxte!");
    npc.base.autonpcfunctions.AddAdditionalText("Ich verkaufe Rüstungen!");
    npc.base.autonpcfunctions.AddTraderTrigger("tell something","I tell you: Sharpen you blade and commit deeds for the glory of Cadomyr.");
    npc.base.autonpcfunctions.AddTraderTrigger("erzähl was","Ich sag euch: Schärft eure Klinge und vollbringt Taten für die Ehre von Cadomyr.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("erzähl etwas");
    -- Small talk: The talk here should focus on possible questions. Feel free to add more!
    npc.base.autonpcfunctions.AddTraderTrigger("profession","I am a blacksmith. That means I craft weapons of death.");
    npc.base.autonpcfunctions.AddTraderTrigger("beruf","Ich bin ein Schmied. Das bedeutet, ich fertige Waffen des Todes.");
    npc.base.autonpcfunctions.AddTraderTrigger("job","Ich bin ein Schmied. Das bedeutet, ich fertige Waffen des Todes.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("job","I am a blacksmith. That means I craft weapons of death.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("smith","Use my forged items to smite the foes of Cadomyr.");
    npc.base.autonpcfunctions.AddTraderTrigger("Schmied","Benutze meine Schmiedewaren um die Feinde Cadomyrs zu zerschmettern.");
    npc.base.autonpcfunctions.AddTraderTrigger("trader","Buy whatever you want on this marketplace, but in the end, only weapons will make Cadomyr prosper.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("merchant");
    npc.base.autonpcfunctions.AddAdditionalTrigger("collegue");
    npc.base.autonpcfunctions.AddAdditionalTrigger("vendor");
    npc.base.autonpcfunctions.AddAdditionalTrigger("market");
    npc.base.autonpcfunctions.AddTraderTrigger("händler","Kauft, was immer ihr wollt auf diesem Marktplatz, aber am Ende werden nur Waffen Cadomyr vorran bringen.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("kollege");
    npc.base.autonpcfunctions.AddAdditionalTrigger("höker");
    npc.base.autonpcfunctions.AddAdditionalTrigger("markt");
    -- More small talk; add at least five triggers
    npc.base.autonpcfunctions.AddTraderTrigger("iron","Iron is tough, stiff and hard. The perfect material for weapons.");
    npc.base.autonpcfunctions.AddTraderTrigger("Eisen","Eisen ist zäh, steif und hart. Das perfekte Material für Waffen.");
    npc.base.autonpcfunctions.AddTraderTrigger("Erz","Eisen gewinnt man aus Erzen. Cadomyr hat zwar keine reichen Minen, aber wir machen das beste daraus.");
    npc.base.autonpcfunctions.AddTraderTrigger("ore","Iron you can make from ore. Cadomyr does not have rich mines, but we're doing our best.");
    npc.base.autonpcfunctions.AddTraderTrigger("steel","What is that supposed to be?");
    npc.base.autonpcfunctions.AddTraderTrigger("Stahl","Was soll das sein?");
    -- Faction stuff
    npc.base.autonpcfunctions.AddTraderTrigger("Elvaine","The archmage is the best that could happen to Runewick. He is such a bad leader that we do not have to bother about Runewick too much.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Morgan");
    npc.base.autonpcfunctions.AddAdditionalTrigger("archmage");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Erzmagier");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Elvaine","Der Erzmagier ist das beste, was Runewick passieren konnte. Er ist so ein schlechter Anführer, dass wir uns nicht um Runewick sorgen müssen.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Morgan");
    npc.base.autonpcfunctions.AddAdditionalTrigger("archmage");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Erzmagier");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("Runewick","Runewick will fall into ruins one day, so do not bother. If you do, I have a good sword for you.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Runewick","Runewick wird eines Tages eine Ruine sein, sorgt euch nicht. Wenn ihr euch dennoch sorgt, ich habe ein gutes Schwert für euch.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("Valerio","I assume the dagger that will slash the Don's throat was already crafted. Hopefully, by me.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Guilianni");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Don");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Valerio","Ich denke, dass der Dolch, der die Kehle des Dons aufschlitzen wird, bereits gefertigt wurde. Hoffentlich ist es einer von meinen.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Guilianni");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Don");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("Galmair","Galmair is rich, but they don't use their wealth properly. Like, for buying weapons.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Galmair","Galmair ist reich, aber sie verstehen es nicht, ihren Reichtum richtig einzusetzen, zum Beispiel, um Waffen zu kaufen.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("rosaline","Any weapon I craft is ment to protect the queen. So, raise you hand against the queen and hundreds of swords will chop it off.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Königin");
    npc.base.autonpcfunctions.AddAdditionalTrigger("queen");
    npc.base.autonpcfunctions.AddAdditionalTrigger("edwards");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("rosaline","Jede Waffe, die ich schmiede, ist gemacht, um die Königin zu schützen. Erhebe deine Hand gegen sie und hunderte Schwerter werden sie abschlagen.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("königin");
    npc.base.autonpcfunctions.AddAdditionalTrigger("queen");
    npc.base.autonpcfunctions.AddAdditionalTrigger("edwards");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("Cadomyr","Cadomyr is our home and I hope my goods help to defend it against any enemies.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Cadomyr","Cadomyr ist unsere Heimat und ich hoffe, meine Waren leisten ihren Beitrag, es gegen Feinde zu verteidigen.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    -- Main land factions
    npc.base.autonpcfunctions.AddTraderTrigger("albar","Spears and swords built the albarian kingdom. Need any?");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("albar","Speere und Schwerter haben Albar aufgebaut. Braucht ihr welche?");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("gynk","Gynk is far away and their weapons are lies and treason.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("gync");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("gync","Gynk ist weit entfernt und ihre Waffen sind Lügen und Verrat.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("gynk");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("salkama","Salkamaerian armour might look brightly shining, but it is ineffective.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("salkama","Salkamaerische Rüstungen mögen funkeln und blitzen, aber sie sind nicht effektiv.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    -- Gods; each NPC should at react on at least one god, being a follower of said god
    npc.base.autonpcfunctions.AddTraderTrigger("Malachin","Every sword I craft I craft for Malachin himself.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Malachin","Jedes Schwert, welches ich schmiede, schmiede ich für Malachin!");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("Irmorom","Irmorom would be proud if he beheld my art. I'm his most hard working scholar.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Irmorom","Irmorom wäre stolz, wenn er meine Schmiedekunst sehen würde. Ich bin sein fleißigster Schüler.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    -- Catching quest triggers
    npc.base.autonpcfunctions.AddTraderTrigger("quest","Your quest today: Defend Cadomyr with my weapons. You have to buy one first...");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("quest","Euer Auftrag heute: Verteidigt Cadomyr mit meinen Waffen. Ihr müßt aber erstmal eine kaufen...");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("task","Your quest today: Defend Cadomyr with my weapons. You have to buy one first...");
    npc.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npc.base.autonpcfunctions.AddTraderTrigger("Auftrag","Euer Auftrag heute: Verteidigt Cadomyr mit meinen Waffen. Ihr müßt aber erstmal eine kaufen...");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Aufgabe");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    -- Last catch: Think about keyphrases the player might say and that are not caught until here
    npc.base.autonpcfunctions.AddTraderTrigger("Yes","What do you mean?");
    npc.base.autonpcfunctions.AddAdditionalText("What do you need?");
    npc.base.autonpcfunctions.AddAdditionalText("I have a good weapon for you.");
    npc.base.autonpcfunctions.AddTraderTrigger("Ja","Was meint ihr?");
    npc.base.autonpcfunctions.AddAdditionalText("Was braucht ihr?");
    npc.base.autonpcfunctions.AddAdditionalText("Ich habe eine gute Waffe für euch.");
    npc.base.autonpcfunctions.AddTraderTrigger("No","As you like.");
    npc.base.autonpcfunctions.AddAdditionalText("Per chance you want a helmet?");
    npc.base.autonpcfunctions.AddAdditionalText("My swords never go blunt.");
    npc.base.autonpcfunctions.AddTraderTrigger("Nein","Wie ihr wollt.");
    npc.base.autonpcfunctions.AddAdditionalText("Vielleicht wollt ihr einen Helm?");
    npc.base.autonpcfunctions.AddAdditionalText("Meine Schwerter werden niemals stumpf.");
    -- Cycletext: Please add at least(!) five cycletext messages. The more, the better. You can use emotes (#me is green), too. 
    npc.base.autonpcfunctions.AddCycleText("#me knallt einen Hammer auf ein glühendes Stück Metall.","#me slams a hammer on a glowing piece of metal.");
    npc.base.autonpcfunctions.AddCycleText("Was!","What!");
    npc.base.autonpcfunctions.AddCycleText("Hört auf zu glotzen, kauft, oder geht weiter!","Stop looking, buy something or go away.");
    npc.base.autonpcfunctions.AddCycleText("Scharfe Klingen, beste Helme für die Schlacht!","Sharp blades, best helmets for battle!");
    npc.base.autonpcfunctions.AddCycleText("Meine Klingen sind zum Töten da, nicht zum Holzschnitzen.","My swords are made to kill, not to carve wood.");
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
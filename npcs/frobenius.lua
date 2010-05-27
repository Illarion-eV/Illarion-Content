-- INSERT INTO npc VALUES (nextval('npc_seq'),0,119,594,0,2,false,'Frobenius','npc_frobenius.lua',0);

require("npcs.base.autonpcfunctions")
module("npcs.frobenius")

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
    npcs.base.autonpcfunctions.AddTraderTrigger("Help","");
    npcs.base.autonpcfunctions.AddConsequence("inform","[Game Help] This NPC is the blacksmith Frobenius. Keyphrases: Hello, blacksmith.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Hilfe","");
    npcs.base.autonpcfunctions.AddConsequence("inform","[Spielhilfe] Dieser NPC ist der Schmied Frobenius. Schlüsselwörter: Hallo, Schmied.");
    -- General speech
    npcs.base.autonpcfunctions.AddTraderTrigger("Hello","Let's get to business, alright?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greetings");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Be greeted");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hail");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good day");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good morning");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good evening");
    npcs.base.autonpcfunctions.AddTraderTrigger("Grüße","Lasst uns zum Geschäft kommen, ja?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Gruß");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Seid gegrüßt");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Guten Tag");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Guten Abend");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Mahlzeit");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Tach");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Moin");
    npcs.base.autonpcfunctions.AddTraderTrigger("Hiho","Let's get to business, alright?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Hiho","Lasst uns zum Geschäft kommen, ja?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("Farewell","Kill some scum with my weapons, will you?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good bye");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Bye");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Fare thy well");
    npcs.base.autonpcfunctions.AddTraderTrigger("Tschüß","Tötet Abschaum mit meinen Waffen, ja?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Tschüss");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Wiedersehen");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Gehabt euch wohl");
    npcs.base.autonpcfunctions.AddTraderTrigger("Ciao","Kill some scum with my weapons, will you?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Ciao","Tötet Abschaum mit meinen Waffen, ja?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("How are you","Pardon me, but I do not want to talk about my feelings.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("How feel");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("How do you do");
    npcs.base.autonpcfunctions.AddTraderTrigger("Wie geht","Entschuldigt, aber ich möchte nicht über meine Gefühle reden.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Wie fühlst");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Wie ist es ergangen");
    npcs.base.autonpcfunctions.AddTraderTrigger("your name","Frobenius!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("who are you");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("who art thou");
    npcs.base.autonpcfunctions.AddAdditionalText("I am Frobenius, the blacksmith.");
    npcs.base.autonpcfunctions.AddTraderTrigger("dein name","Frobenius!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wer bist du");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wer seid ihr");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wie heißt");
    npcs.base.autonpcfunctions.AddAdditionalText("Ich bin Frobenius, der Schmied.");
    -- Catching typical NPC phrases 
    npcs.base.autonpcfunctions.AddTraderTrigger("what sell","I sell swords!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("what buy");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("list wares");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("price of");
    npcs.base.autonpcfunctions.AddAdditionalText("I sell helmets!");
    npcs.base.autonpcfunctions.AddAdditionalText("I sell axes!");
    npcs.base.autonpcfunctions.AddAdditionalText("I sell armour!");
    npcs.base.autonpcfunctions.AddTraderTrigger("was verkauf","Ich verkaufe Schwerter!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("was kauf");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("warenliste");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("preis von");
    npcs.base.autonpcfunctions.AddAdditionalText("Ich verkaufe Helme!");
    npcs.base.autonpcfunctions.AddAdditionalText("Ich verkaufe Äxte!");
    npcs.base.autonpcfunctions.AddAdditionalText("Ich verkaufe Rüstungen!");
    npcs.base.autonpcfunctions.AddTraderTrigger("tell something","I tell you: Sharpen you blade and commit deeds for the glory of Cadomyr.");
    npcs.base.autonpcfunctions.AddTraderTrigger("erzähl was","Ich sag euch: Schärft eure Klinge und vollbringt Taten für die Ehre von Cadomyr.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("erzähl etwas");
    -- Small talk: The talk here should focus on possible questions. Feel free to add more!
    npcs.base.autonpcfunctions.AddTraderTrigger("profession","I am a blacksmith. That means I craft weapons of death.");
    npcs.base.autonpcfunctions.AddTraderTrigger("beruf","Ich bin ein Schmied. Das bedeutet, ich fertige Waffen des Todes.");
    npcs.base.autonpcfunctions.AddTraderTrigger("job","Ich bin ein Schmied. Das bedeutet, ich fertige Waffen des Todes.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("job","I am a blacksmith. That means I craft weapons of death.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("smith","Use my forged items to smite the foes of Cadomyr.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Schmied","Benutze meine Schmiedewaren um die Feinde Cadomyrs zu zerschmettern.");
    npcs.base.autonpcfunctions.AddTraderTrigger("trader","Buy whatever you want on this marketplace, but in the end, only weapons will make Cadomyr prosper.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("merchant");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("collegue");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("vendor");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("market");
    npcs.base.autonpcfunctions.AddTraderTrigger("händler","Kauft, was immer ihr wollt auf diesem Marktplatz, aber am Ende werden nur Waffen Cadomyr vorran bringen.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("kollege");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("höker");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("markt");
    -- More small talk; add at least five triggers
    npcs.base.autonpcfunctions.AddTraderTrigger("iron","Iron is tough, stiff and hard. The perfect material for weapons.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Eisen","Eisen ist zäh, steif und hart. Das perfekte Material für Waffen.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Erz","Eisen gewinnt man aus Erzen. Cadomyr hat zwar keine reichen Minen, aber wir machen das beste daraus.");
    npcs.base.autonpcfunctions.AddTraderTrigger("ore","Iron you can make from ore. Cadomyr does not have rich mines, but we're doing our best.");
    npcs.base.autonpcfunctions.AddTraderTrigger("steel","What is that supposed to be?");
    npcs.base.autonpcfunctions.AddTraderTrigger("Stahl","Was soll das sein?");
    -- Faction stuff
    npcs.base.autonpcfunctions.AddTraderTrigger("Elvaine","The archmage is the best that could happen to Runewick. He is such a bad leader that we do not have to bother about Runewick too much.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Morgan");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("archmage");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Erzmagier");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Elvaine","Der Erzmagier ist das beste, was Runewick passieren konnte. Er ist so ein schlechter Anführer, dass wir uns nicht um Runewick sorgen müssen.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Morgan");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("archmage");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Erzmagier");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("Runewick","Runewick will fall into ruins one day, so do not bother. If you do, I have a good sword for you.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Runewick","Runewick wird eines Tages eine Ruine sein, sorgt euch nicht. Wenn ihr euch dennoch sorgt, ich habe ein gutes Schwert für euch.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("Valerio","I assume the dagger that will slash the Don's throat was already crafted. Hopefully, by me.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Guilianni");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Don");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Valerio","Ich denke, dass der Dolch, der die Kehle des Dons aufschlitzen wird, bereits gefertigt wurde. Hoffentlich ist es einer von meinen.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Guilianni");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Don");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("Galmair","Galmair is rich, but they don't use their wealth properly. Like, for buying weapons.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Galmair","Galmair ist reich, aber sie verstehen es nicht, ihren Reichtum richtig einzusetzen, zum Beispiel, um Waffen zu kaufen.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("rosaline","Any weapon I craft is ment to protect the queen. So, raise you hand against the queen and hundreds of swords will chop it off.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Königin");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("queen");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("edwards");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("rosaline","Jede Waffe, die ich schmiede, ist gemacht, um die Königin zu schützen. Erhebe deine Hand gegen sie und hunderte Schwerter werden sie abschlagen.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("königin");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("queen");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("edwards");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("Cadomyr","Cadomyr is our home and I hope my goods help to defend it against any enemies.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Cadomyr","Cadomyr ist unsere Heimat und ich hoffe, meine Waren leisten ihren Beitrag, es gegen Feinde zu verteidigen.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    -- Main land factions
    npcs.base.autonpcfunctions.AddTraderTrigger("albar","Spears and swords built the albarian kingdom. Need any?");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("albar","Speere und Schwerter haben Albar aufgebaut. Braucht ihr welche?");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("gynk","Gynk is far away and their weapons are lies and treason.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("gync");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("gync","Gynk ist weit entfernt und ihre Waffen sind Lügen und Verrat.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("gynk");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("salkama","Salkamaerian armour might look brightly shining, but it is ineffective.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("salkama","Salkamaerische Rüstungen mögen funkeln und blitzen, aber sie sind nicht effektiv.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    -- Gods; each NPC should at react on at least one god, being a follower of said god
    npcs.base.autonpcfunctions.AddTraderTrigger("Malachin","Every sword I craft I craft for Malachin himself.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Malachin","Jedes Schwert, welches ich schmiede, schmiede ich für Malachin!");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("Irmorom","Irmorom would be proud if he beheld my art. I'm his most hard working scholar.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Irmorom","Irmorom wäre stolz, wenn er meine Schmiedekunst sehen würde. Ich bin sein fleißigster Schüler.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    -- Catching quest triggers
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Your quest today: Defend Cadomyr with my weapons. You have to buy one first...");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Euer Auftrag heute: Verteidigt Cadomyr mit meinen Waffen. Ihr müßt aber erstmal eine kaufen...");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("task","Your quest today: Defend Cadomyr with my weapons. You have to buy one first...");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npcs.base.autonpcfunctions.AddTraderTrigger("Auftrag","Euer Auftrag heute: Verteidigt Cadomyr mit meinen Waffen. Ihr müßt aber erstmal eine kaufen...");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Aufgabe");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    -- Last catch: Think about keyphrases the player might say and that are not caught until here
    npcs.base.autonpcfunctions.AddTraderTrigger("Yes","What do you mean?");
    npcs.base.autonpcfunctions.AddAdditionalText("What do you need?");
    npcs.base.autonpcfunctions.AddAdditionalText("I have a good weapon for you.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Ja","Was meint ihr?");
    npcs.base.autonpcfunctions.AddAdditionalText("Was braucht ihr?");
    npcs.base.autonpcfunctions.AddAdditionalText("Ich habe eine gute Waffe für euch.");
    npcs.base.autonpcfunctions.AddTraderTrigger("No","As you like.");
    npcs.base.autonpcfunctions.AddAdditionalText("Per chance you want a helmet?");
    npcs.base.autonpcfunctions.AddAdditionalText("My swords never go blunt.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Nein","Wie ihr wollt.");
    npcs.base.autonpcfunctions.AddAdditionalText("Vielleicht wollt ihr einen Helm?");
    npcs.base.autonpcfunctions.AddAdditionalText("Meine Schwerter werden niemals stumpf.");
    -- Cycletext: Please add at least(!) five cycletext messages. The more, the better. You can use emotes (#me is green), too. 
    npcs.base.autonpcfunctions.AddCycleText("#me knallt einen Hammer auf ein glühendes Stück Metall.","#me slams a hammer on a glowing piece of metal.");
    npcs.base.autonpcfunctions.AddCycleText("Was!","What!");
    npcs.base.autonpcfunctions.AddCycleText("Hört auf zu glotzen, kauft, oder geht weiter!","Stop looking, buy something or go away.");
    npcs.base.autonpcfunctions.AddCycleText("Scharfe Klingen, beste Helme für die Schlacht!","Sharp blades, best helmets for battle!");
    npcs.base.autonpcfunctions.AddCycleText("Meine Klingen sind zum Töten da, nicht zum Holzschnitzen.","My swords are made to kill, not to carve wood.");
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
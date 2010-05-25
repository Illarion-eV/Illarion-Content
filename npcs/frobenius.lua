-- INSERT INTO npc VALUES (nextval('npc_seq'),0,119,594,0,2,false,'Frobenius','npc_frobenius.lua',0);

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
    AddTraderTrigger("Help","");
    AddConsequence("inform","[Game Help] This NPC is the blacksmith Frobenius. Keyphrases: Hello, blacksmith.");
    AddTraderTrigger("Hilfe","");
    AddConsequence("inform","[Spielhilfe] Dieser NPC ist der Schmied Frobenius. Schlüsselwörter: Hallo, Schmied.");
    -- General speech
    AddTraderTrigger("Hello","Let's get to business, alright?");
    AddAdditionalTrigger("Greetings");
    AddAdditionalTrigger("Be greeted");
    AddAdditionalTrigger("Hail");
    AddAdditionalTrigger("Good day");
    AddAdditionalTrigger("Good morning");
    AddAdditionalTrigger("Good evening");
    AddTraderTrigger("Grüße","Lasst uns zum Geschäft kommen, ja?");
    AddAdditionalTrigger("Gruß");
    AddAdditionalTrigger("Seid gegrüßt");
    AddAdditionalTrigger("Guten Tag");
    AddAdditionalTrigger("Guten Abend");
    AddAdditionalTrigger("Mahlzeit");
    AddAdditionalTrigger("Tach");
    AddAdditionalTrigger("Moin");
    AddTraderTrigger("Hiho","Let's get to business, alright?");
    AddAdditionalTrigger("Hallo");
    AddAdditionalTrigger("Hey");
    AddAdditionalTrigger("Greebas");
    AddAdditionalTrigger("Greebs");
    AddCondition("lang","english");
    AddTraderTrigger("Hiho","Lasst uns zum Geschäft kommen, ja?");
    AddAdditionalTrigger("Hallo");
    AddAdditionalTrigger("Hey");
    AddAdditionalTrigger("Greebas");
    AddAdditionalTrigger("Greebs");
    AddCondition("lang","german");
    AddTraderTrigger("Farewell","Kill some scum with my weapons, will you?");
    AddAdditionalTrigger("Good bye");
    AddAdditionalTrigger("Bye");
    AddAdditionalTrigger("Fare thy well");
    AddTraderTrigger("Tschüß","Tötet Abschaum mit meinen Waffen, ja?");
    AddAdditionalTrigger("Tschüss");
    AddAdditionalTrigger("Wiedersehen");
    AddAdditionalTrigger("Gehabt euch wohl");
    AddTraderTrigger("Ciao","Kill some scum with my weapons, will you?");
    AddAdditionalTrigger("Adieu");
    AddAdditionalTrigger("Au revoir");
    AddCondition("lang","english");
    AddTraderTrigger("Ciao","Tötet Abschaum mit meinen Waffen, ja?");
    AddAdditionalTrigger("Adieu");
    AddAdditionalTrigger("Au revoir");
    AddCondition("lang","german");
    AddTraderTrigger("How are you","Pardon me, but I do not want to talk about my feelings.");
    AddAdditionalTrigger("How feel");
    AddAdditionalTrigger("How do you do");
    AddTraderTrigger("Wie geht","Entschuldigt, aber ich möchte nicht über meine Gefühle reden.");
    AddAdditionalTrigger("Wie fühlst");
    AddAdditionalTrigger("Wie ist es ergangen");
    AddTraderTrigger("your name","Frobenius!");
    AddAdditionalTrigger("who are you");
    AddAdditionalTrigger("who art thou");
    AddAdditionalText("I am Frobenius, the blacksmith.");
    AddTraderTrigger("dein name","Frobenius!");
    AddAdditionalTrigger("wer bist du");
    AddAdditionalTrigger("wer seid ihr");
    AddAdditionalTrigger("wie heißt");
    AddAdditionalText("Ich bin Frobenius, der Schmied.");
    -- Catching typical NPC phrases 
    AddTraderTrigger("what sell","I sell swords!");
    AddAdditionalTrigger("what buy");
    AddAdditionalTrigger("list wares");
    AddAdditionalTrigger("price of");
    AddAdditionalText("I sell helmets!");
    AddAdditionalText("I sell axes!");
    AddAdditionalText("I sell armour!");
    AddTraderTrigger("was verkauf","Ich verkaufe Schwerter!");
    AddAdditionalTrigger("was kauf");
    AddAdditionalTrigger("warenliste");
    AddAdditionalTrigger("preis von");
    AddAdditionalText("Ich verkaufe Helme!");
    AddAdditionalText("Ich verkaufe Äxte!");
    AddAdditionalText("Ich verkaufe Rüstungen!");
    AddTraderTrigger("tell something","I tell you: Sharpen you blade and commit deeds for the glory of Cadomyr.");
    AddTraderTrigger("erzähl was","Ich sag euch: Schärft eure Klinge und vollbringt Taten für die Ehre von Cadomyr.");
    AddAdditionalTrigger("erzähl etwas");
    -- Small talk: The talk here should focus on possible questions. Feel free to add more!
    AddTraderTrigger("profession","I am a blacksmith. That means I craft weapons of death.");
    AddTraderTrigger("beruf","Ich bin ein Schmied. Das bedeutet, ich fertige Waffen des Todes.");
    AddTraderTrigger("job","Ich bin ein Schmied. Das bedeutet, ich fertige Waffen des Todes.");
    AddCondition("lang","german");
    AddTraderTrigger("job","I am a blacksmith. That means I craft weapons of death.");
    AddCondition("lang","english");
    AddTraderTrigger("smith","Use my forged items to smite the foes of Cadomyr.");
    AddTraderTrigger("Schmied","Benutze meine Schmiedewaren um die Feinde Cadomyrs zu zerschmettern.");
    AddTraderTrigger("trader","Buy whatever you want on this marketplace, but in the end, only weapons will make Cadomyr prosper.");
    AddAdditionalTrigger("merchant");
    AddAdditionalTrigger("collegue");
    AddAdditionalTrigger("vendor");
    AddAdditionalTrigger("market");
    AddTraderTrigger("händler","Kauft, was immer ihr wollt auf diesem Marktplatz, aber am Ende werden nur Waffen Cadomyr vorran bringen.");
    AddAdditionalTrigger("kollege");
    AddAdditionalTrigger("höker");
    AddAdditionalTrigger("markt");
    -- More small talk; add at least five triggers
    AddTraderTrigger("iron","Iron is tough, stiff and hard. The perfect material for weapons.");
    AddTraderTrigger("Eisen","Eisen ist zäh, steif und hart. Das perfekte Material für Waffen.");
    AddTraderTrigger("Erz","Eisen gewinnt man aus Erzen. Cadomyr hat zwar keine reichen Minen, aber wir machen das beste daraus.");
    AddTraderTrigger("ore","Iron you can make from ore. Cadomyr does not have rich mines, but we're doing our best.");
    AddTraderTrigger("steel","What is that supposed to be?");
    AddTraderTrigger("Stahl","Was soll das sein?");
    -- Faction stuff
    AddTraderTrigger("Elvaine","The archmage is the best that could happen to Runewick. He is such a bad leader that we do not have to bother about Runewick too much.");
    AddAdditionalTrigger("Morgan");
    AddAdditionalTrigger("archmage");
    AddAdditionalTrigger("Erzmagier");
    AddCondition("lang","english");
    AddTraderTrigger("Elvaine","Der Erzmagier ist das beste, was Runewick passieren konnte. Er ist so ein schlechter Anführer, dass wir uns nicht um Runewick sorgen müssen.");
    AddAdditionalTrigger("Morgan");
    AddAdditionalTrigger("archmage");
    AddAdditionalTrigger("Erzmagier");
    AddCondition("lang","german");
    AddTraderTrigger("Runewick","Runewick will fall into ruins one day, so do not bother. If you do, I have a good sword for you.");
    AddCondition("lang","english");
    AddTraderTrigger("Runewick","Runewick wird eines Tages eine Ruine sein, sorgt euch nicht. Wenn ihr euch dennoch sorgt, ich habe ein gutes Schwert für euch.");
    AddCondition("lang","german");
    AddTraderTrigger("Valerio","I assume the dagger that will slash the Don's throat was already crafted. Hopefully, by me.");
    AddAdditionalTrigger("Guilianni");
    AddAdditionalTrigger("Don");
    AddCondition("lang","english");
    AddTraderTrigger("Valerio","Ich denke, dass der Dolch, der die Kehle des Dons aufschlitzen wird, bereits gefertigt wurde. Hoffentlich ist es einer von meinen.");
    AddAdditionalTrigger("Guilianni");
    AddAdditionalTrigger("Don");
    AddCondition("lang","german");
    AddTraderTrigger("Galmair","Galmair is rich, but they don't use their wealth properly. Like, for buying weapons.");
    AddCondition("lang","english");
    AddTraderTrigger("Galmair","Galmair ist reich, aber sie verstehen es nicht, ihren Reichtum richtig einzusetzen, zum Beispiel, um Waffen zu kaufen.");
    AddCondition("lang","german");
    AddTraderTrigger("rosaline","Any weapon I craft is ment to protect the queen. So, raise you hand against the queen and hundreds of swords will chop it off.");
    AddAdditionalTrigger("Königin");
    AddAdditionalTrigger("queen");
    AddAdditionalTrigger("edwards");
    AddCondition("lang","english");
    AddTraderTrigger("rosaline","Jede Waffe, die ich schmiede, ist gemacht, um die Königin zu schützen. Erhebe deine Hand gegen sie und hunderte Schwerter werden sie abschlagen.");
    AddAdditionalTrigger("königin");
    AddAdditionalTrigger("queen");
    AddAdditionalTrigger("edwards");
    AddCondition("lang","german");
    AddTraderTrigger("Cadomyr","Cadomyr is our home and I hope my goods help to defend it against any enemies.");
    AddCondition("lang","english");
    AddTraderTrigger("Cadomyr","Cadomyr ist unsere Heimat und ich hoffe, meine Waren leisten ihren Beitrag, es gegen Feinde zu verteidigen.");
    AddCondition("lang","german");
    -- Main land factions
    AddTraderTrigger("albar","Spears and swords built the albarian kingdom. Need any?");
    AddCondition("lang","english");
    AddTraderTrigger("albar","Speere und Schwerter haben Albar aufgebaut. Braucht ihr welche?");
    AddCondition("lang","german");
    AddTraderTrigger("gynk","Gynk is far away and their weapons are lies and treason.");
    AddAdditionalTrigger("gync");
    AddCondition("lang","english");
    AddTraderTrigger("gync","Gynk ist weit entfernt und ihre Waffen sind Lügen und Verrat.");
    AddAdditionalTrigger("gynk");
    AddCondition("lang","german");
    AddTraderTrigger("salkama","Salkamaerian armour might look brightly shining, but it is ineffective.");
    AddCondition("lang","english");
    AddTraderTrigger("salkama","Salkamaerische Rüstungen mögen funkeln und blitzen, aber sie sind nicht effektiv.");
    AddCondition("lang","german");
    -- Gods; each NPC should at react on at least one god, being a follower of said god
    AddTraderTrigger("Malachin","Every sword I craft I craft for Malachin himself.");
    AddCondition("lang","english");
    AddTraderTrigger("Malachin","Jedes Schwert, welches ich schmiede, schmiede ich für Malachin!");
    AddCondition("lang","german");
    AddTraderTrigger("Irmorom","Irmorom would be proud if he beheld my art. I'm his most hard working scholar.");
    AddCondition("lang","english");
    AddTraderTrigger("Irmorom","Irmorom wäre stolz, wenn er meine Schmiedekunst sehen würde. Ich bin sein fleißigster Schüler.");
    AddCondition("lang","german");
    -- Catching quest triggers
    AddTraderTrigger("quest","Your quest today: Defend Cadomyr with my weapons. You have to buy one first...");
    AddAdditionalTrigger("mission");
    AddCondition("lang","english");
    AddTraderTrigger("quest","Euer Auftrag heute: Verteidigt Cadomyr mit meinen Waffen. Ihr müßt aber erstmal eine kaufen...");
    AddAdditionalTrigger("mission");
    AddCondition("lang","german");
    AddTraderTrigger("task","Your quest today: Defend Cadomyr with my weapons. You have to buy one first...");
    AddAdditionalTrigger("adventure");
    AddTraderTrigger("Auftrag","Euer Auftrag heute: Verteidigt Cadomyr mit meinen Waffen. Ihr müßt aber erstmal eine kaufen...");
    AddAdditionalTrigger("Aufgabe");
    AddAdditionalTrigger("Abenteuer");
    -- Last catch: Think about keyphrases the player might say and that are not caught until here
    AddTraderTrigger("Yes","What do you mean?");
    AddAdditionalText("What do you need?");
    AddAdditionalText("I have a good weapon for you.");
    AddTraderTrigger("Ja","Was meint ihr?");
    AddAdditionalText("Was braucht ihr?");
    AddAdditionalText("Ich habe eine gute Waffe für euch.");
    AddTraderTrigger("No","As you like.");
    AddAdditionalText("Per chance you want a helmet?");
    AddAdditionalText("My swords never go blunt.");
    AddTraderTrigger("Nein","Wie ihr wollt.");
    AddAdditionalText("Vielleicht wollt ihr einen Helm?");
    AddAdditionalText("Meine Schwerter werden niemals stumpf.");
    -- Cycletext: Please add at least(!) five cycletext messages. The more, the better. You can use emotes (#me is green), too. 
    AddCycleText("#me knallt einen Hammer auf ein glühendes Stück Metall.","#me slams a hammer on a glowing piece of metal.");
    AddCycleText("Was!","What!");
    AddCycleText("Hört auf zu glotzen, kauft, oder geht weiter!","Stop looking, buy something or go away.");
    AddCycleText("Scharfe Klingen, beste Helme für die Schlacht!","Sharp blades, best helmets for battle!");
    AddCycleText("Meine Klingen sind zum Töten da, nicht zum Holzschnitzen.","My swords are made to kill, not to carve wood.");
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
-- INSERT INTO npc VALUES (nextval('npc_seq'),2,896,816,1,2,false,'Lothar Piero','npc_lothar_piero.lua',0);

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
    -- This NPC is supposed to trade (all goods are sold and bought, percentage indicates ratio of price bought/sold):
    -- 10% Tools (Carpenter/Lumberjack): 9, 74, 2709, 2715, 2752
    -- 10% Ammo: 64, 237, 322, 1266
    -- 10% Boards: 545, 546, 2543, 2716
    -- 10% Distance weapons: 65, 70, 89, 2646, 2685, 2708, 2714, 2718, 2723, 2727, 2780
    -- 10% Handles: 2525, 2527, 2528, 2530, 2541, 2544, 2548, 2549, 2561, 2566, 2567, 2570, 2572, 2573, 2584, 2585
    -- 10% Wooden leg armour: 2193, 2194
    -- 10% Wooden plates: 2935, 2952
    -- 10% Shields: 17, 18, 19, 20, 95, 96, 186, 916, 917, 2284, 2388, 2439, 2445, 2447, 2448
    -- 10% Lumber: 3, 56, 543, 544, 2560, 2786
    -- 10% Staffs: 39, 40, 57, 76, 207, 208, 209
    -- 10% Instruments: 90, 332, 333, 335
    -- 10% Wands: 323, 2782, 2783, 2784, 2785
    -- Help 
    AddTraderTrigger("Help","");
    AddConsequence("inform","[Game Help] This is NPC is the carpenter Lothar Piero. Keyphrases: Hello, carpenter, YOURTRIGGER1, YOURTRIGGER2.");
    AddTraderTrigger("Hilfe","");
    AddConsequence("inform","[Spielhilfe] Dieser NPC ist der Schreiner Lothar Piero. Schlüsselwörter: Hallo, Schreiner, DEINTRIGGER1, DEINTRIGGER2.");
    -- General speech
    AddTraderTrigger("Hello","ENGLISH1.");
    AddAdditionalTrigger("Greetings");
    AddAdditionalTrigger("Be greeted");
    AddAdditionalTrigger("Hail");
    AddAdditionalTrigger("Good day");
    AddAdditionalTrigger("Good morning");
    AddAdditionalTrigger("Good evening");
    AddAdditionalText("ENGLISH2.");
    AddAdditionalText("ENGLISH3.");
    AddTraderTrigger("Grüße","GERMAN1.");
    AddAdditionalTrigger("Gruß");
    AddAdditionalTrigger("Seid gegrüßt");
    AddAdditionalTrigger("Guten Tag");
    AddAdditionalTrigger("Guten Abend");
    AddAdditionalTrigger("Mahlzeit");
    AddAdditionalTrigger("Tach");
    AddAdditionalTrigger("Moin");
    AddAdditionalText("GERMAN2.");
    AddAdditionalText("GERMAN3.");
    AddTraderTrigger("Hiho","ENGLISH1.");
    AddAdditionalTrigger("Hallo");
    AddAdditionalTrigger("Hey");
    AddAdditionalTrigger("Greebas");
    AddAdditionalTrigger("Greebs");
    AddCondition("lang","english");
    AddAdditionalText("ENGLISH2.");
    AddAdditionalText("ENGLISH3.");
    AddTraderTrigger("Hiho","GERMAN1.");
    AddAdditionalTrigger("Hallo");
    AddAdditionalTrigger("Hey");
    AddAdditionalTrigger("Greebas");
    AddAdditionalTrigger("Greebs");
    AddCondition("lang","german");
    AddAdditionalText("GERMAN2.");
    AddAdditionalText("GERMAN3.");
    AddTraderTrigger("Farewell","ENGLISH1.");
    AddAdditionalTrigger("Good bye");
    AddAdditionalTrigger("Bye");
    AddAdditionalTrigger("Fare thy well");
    AddAdditionalText("ENGLISH2.");
    AddAdditionalText("ENGLISH3.");
    AddTraderTrigger("Tschüß","GERMAN1.");
    AddAdditionalTrigger("Tschüss");
    AddAdditionalTrigger("Wiedersehen");
    AddAdditionalTrigger("Gehabt euch wohl");
    AddAdditionalText("GERMAN2.");
    AddAdditionalText("GERMAN3.");
    AddTraderTrigger("Ciao","ENGLISH1.");
    AddAdditionalTrigger("Adieu");
    AddAdditionalTrigger("Au revoir");
    AddCondition("lang","english");
    AddAdditionalText("ENGLISH2.");
    AddAdditionalText("ENGLISH3.");
    AddTraderTrigger("Ciao","GERMAN1.");
    AddAdditionalTrigger("Adieu");
    AddAdditionalTrigger("Au revoir");
    AddCondition("lang","german");
    AddAdditionalText("GERMAN2.");
    AddAdditionalText("GERMAN3.");
    AddTraderTrigger("How are you","ENGLISH1.");
    AddAdditionalTrigger("How feel");
    AddAdditionalTrigger("How do you do");
    AddAdditionalText("ENGLISH2.");
    AddAdditionalText("ENGLISH3.");
    AddTraderTrigger("Wie geht","GERMAN1.");
    AddAdditionalTrigger("Wie fühlst");
    AddAdditionalTrigger("Wie ist es ergangen");
    AddAdditionalText("GERMAN2.");
    AddAdditionalText("GERMAN3.");
    AddTraderTrigger("your name","ENGLISH1.");
    AddAdditionalTrigger("who are you");
    AddAdditionalTrigger("who art thou");
    AddAdditionalText("ENGLISH2.");
    AddAdditionalText("ENGLISH3.");
    AddTraderTrigger("dein name","GERMAN1.");
    AddAdditionalTrigger("wer bist du");
    AddAdditionalTrigger("wer seid ihr");
    AddAdditionalTrigger("wie heißt");
    AddAdditionalText("GERMAN2.");
    AddAdditionalText("GERMAN3.");
    -- Catching typical NPC phrases
    AddTraderTrigger("what sell","ENGLISH1.");
    AddAdditionalTrigger("what buy");
    AddAdditionalTrigger("list wares");
    AddAdditionalTrigger("price of");
    AddAdditionalText("ENGLISH2.");
    AddAdditionalText("ENGLISH3.");
    AddTraderTrigger("was verkauf","GERMAN1.");
    AddAdditionalTrigger("was kauf");
    AddAdditionalTrigger("warenliste");
    AddAdditionalTrigger("preis von");
    AddAdditionalText("GERMAN2.");
    AddAdditionalText("GERMAN3.");
    AddTraderTrigger("tell something","ENGLISH1.");
    AddAdditionalText("ENGLISH2.");
    AddAdditionalText("ENGLISH3.");
    AddTraderTrigger("erzähl was","GERMAN1.");
    AddAdditionalTrigger("erzähl etwas");
    AddAdditionalText("GERMAN2.");
    AddAdditionalText("GERMAN3.");
    -- Small talk: The talk here should focus on possible questions. Feel free to add more!
    AddTraderTrigger("profession","ANSWER1");
    AddAdditionalText("ANSWER2");
    AddAdditionalText("ANSWER3");
    AddTraderTrigger("beruf","ANSWER1");
    AddAdditionalText("ANSWER2");
    AddAdditionalText("ANSWER3");
    AddTraderTrigger("job","ANSWER1");
    AddCondition("lang","german");
    AddAdditionalText("ANSWER2");
    AddAdditionalText("ANSWER3");
    AddTraderTrigger("job","ANSWER1");
    AddCondition("lang","english");
    AddAdditionalText("ANSWER2");
    AddAdditionalText("ANSWER3");
    AddTraderTrigger("PROFESSION","ANSWER1");
    AddAdditionalText("ANSWER2");
    AddAdditionalText("ANSWER3");
    AddTraderTrigger("BERUF","ANSWER1");
    AddAdditionalText("ANSWER2");
    AddAdditionalText("ANSWER3");
    AddTraderTrigger("LOCATION","ANSWER1");
    AddAdditionalText("ANSWER2");
    AddAdditionalText("ANSWER3");
    AddTraderTrigger("ORT","ANSWER1");
    AddAdditionalText("ANSWER2");
    AddAdditionalText("ANSWER3");
    AddTraderTrigger("trader","OTHER NPCs1");
    AddAdditionalTrigger("merchant");
    AddAdditionalTrigger("collegue");
    AddAdditionalTrigger("vendor");
    AddAdditionalTrigger("market");
    AddAdditionalText("OTHER NPCs2");
    AddAdditionalText("OTHER NPCs3");
    AddTraderTrigger("händler","OTHER NPCs1");
    AddAdditionalTrigger("kollege");
    AddAdditionalTrigger("höker");
    AddAdditionalTrigger("markt");
    AddAdditionalText("OTHER NPCs2");
    AddAdditionalText("OTHER NPCs3");
    AddTraderTrigger("Gobaith","ANSWER1");
    AddCondition("lang","english");
    AddAdditionalText("ANSWER2");
    AddAdditionalText("ANSWER3");
    AddTraderTrigger("Gobaith","ANSWER1");
    AddCondition("lang","german");
    AddAdditionalText("ANSWER2");
    AddAdditionalText("ANSWER3");
    -- More small talk; add at least five triggers
    AddTraderTrigger("YOURTRIGGER1","ENGLISH1.");
    AddAdditionalText("ENGLISH2.");
    AddAdditionalText("ENGLISH3.");
    AddTraderTrigger("YOURTRIGGER2","ENGLISH1.");
    AddAdditionalText("ENGLISH2.");
    AddAdditionalText("ENGLISH3.");
    AddTraderTrigger("YOURTRIGGER3","ENGLISH1.");
    AddAdditionalText("ENGLISH2.");
    AddAdditionalText("ENGLISH3.");
    AddTraderTrigger("YOURTRIGGER4","ENGLISH1.");
    AddAdditionalText("ENGLISH2.");
    AddAdditionalText("ENGLISH3.");
    AddTraderTrigger("YOURTRIGGER5","ENGLISH1.");
    AddAdditionalText("ENGLISH2.");
    AddAdditionalText("ENGLISH3.");
    AddTraderTrigger("DEINTRIGGER1","GERMAN1.");
    AddAdditionalText("GERMAN2.");
    AddAdditionalText("GERMAN3.");
    AddTraderTrigger("DEINTRIGGER2","GERMAN1.");
    AddAdditionalText("GERMAN2.");
    AddAdditionalText("GERMAN3.");
    AddTraderTrigger("DEINTRIGGER3","GERMAN1.");
    AddAdditionalText("GERMAN2.");
    AddAdditionalText("GERMAN3.");
    AddTraderTrigger("DEINTRIGGER4","GERMAN1.");
    AddAdditionalText("GERMAN2.");
    AddAdditionalText("GERMAN3.");
    AddTraderTrigger("DEINTRIGGER5","GERMAN1.");
    AddAdditionalText("GERMAN2.");
    AddAdditionalText("GERMAN3.");
    -- Faction stuff
    AddTraderTrigger("Elvaine","ENGLISH1.");
    AddAdditionalTrigger("Morgan");
    AddAdditionalTrigger("archmage");
    AddAdditionalTrigger("Erzmagier");
    AddCondition("lang","english");
    AddAdditionalText("ENGLISH2.");
    AddAdditionalText("ENGLISH3.");
    AddTraderTrigger("Elvaine","GERMAN1.");
    AddAdditionalTrigger("Morgan");
    AddAdditionalTrigger("archmage");
    AddAdditionalTrigger("Erzmagier");
    AddAdditionalText("GERMAN2.");
    AddAdditionalText("GERMAN3.");
    AddTraderTrigger("Runewick","ENGLISH1.");
    AddCondition("lang","english");
    AddAdditionalText("ENGLISH2.");
    AddAdditionalText("ENGLISH3.");
    AddTraderTrigger("Runewick","GERMAN1.");
    AddAdditionalText("GERMAN2.");
    AddAdditionalText("GERMAN3.");
    AddTraderTrigger("Valerio","ENGLISH1.");
    AddAdditionalTrigger("Guilianni");
    AddAdditionalTrigger("Don");
    AddCondition("lang","english");
    AddAdditionalText("ENGLISH2.");
    AddAdditionalText("ENGLISH3.");
    AddTraderTrigger("Valerio","GERMAN1.");
    AddAdditionalTrigger("Guilianni");
    AddAdditionalTrigger("Don");
    AddAdditionalText("GERMAN2.");
    AddAdditionalText("GERMAN3.");
    AddTraderTrigger("Galmair","ENGLISH1.");
    AddCondition("lang","english");
    AddAdditionalText("ENGLISH2.");
    AddAdditionalText("ENGLISH3.");
    AddTraderTrigger("Galmair","GERMAN1.");
    AddAdditionalText("GERMAN2.");
    AddAdditionalText("GERMAN3.");
    AddTraderTrigger("rosaline","ENGLISH1.");
    AddAdditionalTrigger("königin");
    AddAdditionalTrigger("queen");
    AddAdditionalTrigger("edwards");
    AddCondition("lang","english");
    AddAdditionalText("ENGLISH2.");
    AddAdditionalText("ENGLISH3.");
    AddTraderTrigger("rosaline","GERMAN1.");
    AddAdditionalTrigger("königin");
    AddAdditionalTrigger("queen");
    AddAdditionalTrigger("edwards");
    AddAdditionalText("GERMAN2.");
    AddAdditionalText("GERMAN3.");
    AddTraderTrigger("Cadomyr","ENGLISH1.");
    AddCondition("lang","english");
    AddAdditionalText("ENGLISH2.");
    AddAdditionalText("ENGLISH3.");
    AddTraderTrigger("Cadomyr","GERMAN1.");
    AddAdditionalText("GERMAN2.");
    AddAdditionalText("GERMAN3.");
    -- Main land factions
    AddTraderTrigger("albar","ENGLISH1.");
    AddCondition("lang","english");
    AddAdditionalText("ENGLISH2.");
    AddAdditionalText("ENGLISH3.");
    AddTraderTrigger("albar","GERMAN1.");
    AddAdditionalText("GERMAN2.");
    AddAdditionalText("GERMAN3.");
    AddTraderTrigger("gynk","ENGLISH1.");
    AddAdditionalTrigger("gync");
    AddCondition("lang","english");
    AddAdditionalText("ENGLISH2.");
    AddAdditionalText("ENGLISH3.");
    AddTraderTrigger("gync","GERMAN1.");
    AddAdditionalTrigger("gynk");
    AddAdditionalText("GERMAN2.");
    AddAdditionalText("GERMAN3.");
    AddTraderTrigger("salkama","ENGLISH1.");
    AddCondition("lang","english");
    AddAdditionalText("ENGLISH2.");
    AddAdditionalText("ENGLISH3.");
    AddTraderTrigger("salkama","GERMAN1.");
    AddAdditionalText("GERMAN2.");
    AddAdditionalText("GERMAN3.");
    -- Gods; each NPC should react on AT LEAST one god, being a follower of said god
    AddTraderTrigger("GOD","ENGLISH1.");
    AddCondition("lang","english");
    AddAdditionalText("ENGLISH2.");
    AddAdditionalText("ENGLISH3.");
    AddTraderTrigger("GOTT","GERMAN1.");
    AddAdditionalText("GERMAN2.");
    AddAdditionalText("GERMAN3.");
    -- Catching quest triggers
    AddTraderTrigger("quest","NO QUEST");
    AddCondition("lang","english");
    AddTraderTrigger("quest","NO QUEST");
    AddCondition("lang","german");
    AddTraderTrigger("task","NO QUEST");
    AddAdditionalTrigger("adventure");
    AddTraderTrigger("Auftrag","NO QUEST");
    AddAdditionalTrigger("Aufgabe");
    AddAdditionalTrigger("Abenteuer");
    -- Last catch: Think about keyphrases the player might say and that are not caught until here
    AddTraderTrigger("Yes","ANSWER1");
    AddAdditionalText("ANSWER2");
    AddTraderTrigger("Ja","ANSWER1");
    AddAdditionalText("ANSWER2");
    AddTraderTrigger("No","ANSWER1");
    AddAdditionalText("ANSWER2");
    AddTraderTrigger("Nein","ANSWER1");
    AddAdditionalText("ANSWER2");
    -- Cycletext: Please add at least(!) ten cycletext messages. The more, the better. You can use emotes (#me is green), too. 
    AddCycleText("GERMAN","ENGLISH");
    AddCycleText("GERMAN","ENGLISH");
    AddCycleText("GERMAN","ENGLISH");
    AddCycleText("GERMAN","ENGLISH");
    AddCycleText("GERMAN","ENGLISH");
    AddCycleText("GERMAN","ENGLISH");
    AddCycleText("GERMAN","ENGLISH");
    AddCycleText("GERMAN","ENGLISH");
    AddCycleText("GERMAN","ENGLISH");
    AddCycleText("GERMAN","ENGLISH");
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
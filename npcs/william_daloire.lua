-- INSERT INTO npc VALUES (nextval('npc_seq'),0,897,794,1,4,false,'William Daloire','npc_william_daloire.lua',0);

require("npcs.base.autonpcfunctions")
module("npcs.william_daloire")

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
    -- This NPC is supposed to trade (all goods are sold and bought, percentage indicates ratio of price bought/sold):
    -- 10% Tools (Alchemist): 58, 1008
    -- 10% Tools (Candle maker): 429
    -- 10% Tools (Herb gatherer): 126
    -- 10% Candles, torches: 43, 391
    -- 10% Herbs II: 752, 753, 754, 755, 756, 757, 758, 759, 760, 761, 762, 763, 764, 765, 766, 767, 768, 769
    -- 10% Herbs: 133, 134, 135, 136, 137, 138, 140, 141, 142, 143, 144, 145, 146, 148, 152, 153, 154, 155, 156, 157
    -- 10% Wax: 431
    -- 10% Writing stuff: 463, 2745
    -- 10% Mushrooms: 158, 159, 160, 161, 162, 163
    -- Help 
    npcs.base.autonpcfunctions.AddTraderTrigger("Help","");
    npcs.base.autonpcfunctions.AddConsequence("inform","[Game Help] This is NPC is the scholar William Daloire. Keyphrases: Hello, scholar, YOURTRIGGER1, YOURTRIGGER2.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Hilfe","");
    npcs.base.autonpcfunctions.AddConsequence("inform","[Spielhilfe] Dieser NPC ist der Gelehrte William Daloire. Schlüsselwörter: Hallo, Gelehrter, DEINTRIGGER1, DEINTRIGGER2.");
    -- General speech
    npcs.base.autonpcfunctions.AddTraderTrigger("Hello","ENGLISH1.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greetings");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Be greeted");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hail");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good day");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good morning");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good evening");
    npcs.base.autonpcfunctions.AddAdditionalText("ENGLISH2.");
    npcs.base.autonpcfunctions.AddAdditionalText("ENGLISH3.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Grüße","GERMAN1.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Gruß");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Seid gegrüßt");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Guten Tag");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Guten Abend");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Mahlzeit");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Tach");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Moin");
    npcs.base.autonpcfunctions.AddAdditionalText("GERMAN2.");
    npcs.base.autonpcfunctions.AddAdditionalText("GERMAN3.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Hiho","ENGLISH1.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddAdditionalText("ENGLISH2.");
    npcs.base.autonpcfunctions.AddAdditionalText("ENGLISH3.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Hiho","GERMAN1.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddAdditionalText("GERMAN2.");
    npcs.base.autonpcfunctions.AddAdditionalText("GERMAN3.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Farewell","ENGLISH1.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good bye");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Bye");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Fare thy well");
    npcs.base.autonpcfunctions.AddAdditionalText("ENGLISH2.");
    npcs.base.autonpcfunctions.AddAdditionalText("ENGLISH3.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Tschüß","GERMAN1.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Tschüss");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Wiedersehen");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Gehabt euch wohl");
    npcs.base.autonpcfunctions.AddAdditionalText("GERMAN2.");
    npcs.base.autonpcfunctions.AddAdditionalText("GERMAN3.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Ciao","ENGLISH1.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddAdditionalText("ENGLISH2.");
    npcs.base.autonpcfunctions.AddAdditionalText("ENGLISH3.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Ciao","GERMAN1.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddAdditionalText("GERMAN2.");
    npcs.base.autonpcfunctions.AddAdditionalText("GERMAN3.");
    npcs.base.autonpcfunctions.AddTraderTrigger("How are you","ENGLISH1.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("How feel");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("How do you do");
    npcs.base.autonpcfunctions.AddAdditionalText("ENGLISH2.");
    npcs.base.autonpcfunctions.AddAdditionalText("ENGLISH3.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Wie geht","GERMAN1.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Wie fühlst");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Wie ist es ergangen");
    npcs.base.autonpcfunctions.AddAdditionalText("GERMAN2.");
    npcs.base.autonpcfunctions.AddAdditionalText("GERMAN3.");
    npcs.base.autonpcfunctions.AddTraderTrigger("your name","ENGLISH1.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("who are you");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("who art thou");
    npcs.base.autonpcfunctions.AddAdditionalText("ENGLISH2.");
    npcs.base.autonpcfunctions.AddAdditionalText("ENGLISH3.");
    npcs.base.autonpcfunctions.AddTraderTrigger("dein name","GERMAN1.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wer bist du");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wer seid ihr");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wie heißt");
    npcs.base.autonpcfunctions.AddAdditionalText("GERMAN2.");
    npcs.base.autonpcfunctions.AddAdditionalText("GERMAN3.");
    -- Catching typical NPC phrases
    npcs.base.autonpcfunctions.AddTraderTrigger("what sell","ENGLISH1.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("what buy");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("list wares");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("price of");
    npcs.base.autonpcfunctions.AddAdditionalText("ENGLISH2.");
    npcs.base.autonpcfunctions.AddAdditionalText("ENGLISH3.");
    npcs.base.autonpcfunctions.AddTraderTrigger("was verkauf","GERMAN1.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("was kauf");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("warenliste");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("preis von");
    npcs.base.autonpcfunctions.AddAdditionalText("GERMAN2.");
    npcs.base.autonpcfunctions.AddAdditionalText("GERMAN3.");
    npcs.base.autonpcfunctions.AddTraderTrigger("tell something","ENGLISH1.");
    npcs.base.autonpcfunctions.AddAdditionalText("ENGLISH2.");
    npcs.base.autonpcfunctions.AddAdditionalText("ENGLISH3.");
    npcs.base.autonpcfunctions.AddTraderTrigger("erzähl was","GERMAN1.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("erzähl etwas");
    npcs.base.autonpcfunctions.AddAdditionalText("GERMAN2.");
    npcs.base.autonpcfunctions.AddAdditionalText("GERMAN3.");
    -- Small talk: The talk here should focus on possible questions. Feel free to add more!
    npcs.base.autonpcfunctions.AddTraderTrigger("profession","ANSWER1");
    npcs.base.autonpcfunctions.AddAdditionalText("ANSWER2");
    npcs.base.autonpcfunctions.AddAdditionalText("ANSWER3");
    npcs.base.autonpcfunctions.AddTraderTrigger("beruf","ANSWER1");
    npcs.base.autonpcfunctions.AddAdditionalText("ANSWER2");
    npcs.base.autonpcfunctions.AddAdditionalText("ANSWER3");
    npcs.base.autonpcfunctions.AddTraderTrigger("job","ANSWER1");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddAdditionalText("ANSWER2");
    npcs.base.autonpcfunctions.AddAdditionalText("ANSWER3");
    npcs.base.autonpcfunctions.AddTraderTrigger("job","ANSWER1");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddAdditionalText("ANSWER2");
    npcs.base.autonpcfunctions.AddAdditionalText("ANSWER3");
    npcs.base.autonpcfunctions.AddTraderTrigger("PROFESSION","ANSWER1");
    npcs.base.autonpcfunctions.AddAdditionalText("ANSWER2");
    npcs.base.autonpcfunctions.AddAdditionalText("ANSWER3");
    npcs.base.autonpcfunctions.AddTraderTrigger("BERUF","ANSWER1");
    npcs.base.autonpcfunctions.AddAdditionalText("ANSWER2");
    npcs.base.autonpcfunctions.AddAdditionalText("ANSWER3");
    npcs.base.autonpcfunctions.AddTraderTrigger("LOCATION","ANSWER1");
    npcs.base.autonpcfunctions.AddAdditionalText("ANSWER2");
    npcs.base.autonpcfunctions.AddAdditionalText("ANSWER3");
    npcs.base.autonpcfunctions.AddTraderTrigger("ORT","ANSWER1");
    npcs.base.autonpcfunctions.AddAdditionalText("ANSWER2");
    npcs.base.autonpcfunctions.AddAdditionalText("ANSWER3");
    npcs.base.autonpcfunctions.AddTraderTrigger("trader","OTHER NPCs1");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("merchant");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("collegue");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("vendor");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("market");
    npcs.base.autonpcfunctions.AddAdditionalText("OTHER NPCs2");
    npcs.base.autonpcfunctions.AddAdditionalText("OTHER NPCs3");
    npcs.base.autonpcfunctions.AddTraderTrigger("händler","OTHER NPCs1");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("kollege");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("höker");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("markt");
    npcs.base.autonpcfunctions.AddAdditionalText("OTHER NPCs2");
    npcs.base.autonpcfunctions.AddAdditionalText("OTHER NPCs3");
    npcs.base.autonpcfunctions.AddTraderTrigger("Gobaith","ANSWER1");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddAdditionalText("ANSWER2");
    npcs.base.autonpcfunctions.AddAdditionalText("ANSWER3");
    npcs.base.autonpcfunctions.AddTraderTrigger("Gobaith","ANSWER1");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddAdditionalText("ANSWER2");
    npcs.base.autonpcfunctions.AddAdditionalText("ANSWER3");
    -- More small talk; add at least five triggers
    npcs.base.autonpcfunctions.AddTraderTrigger("YOURTRIGGER1","ENGLISH1.");
    npcs.base.autonpcfunctions.AddAdditionalText("ENGLISH2.");
    npcs.base.autonpcfunctions.AddAdditionalText("ENGLISH3.");
    npcs.base.autonpcfunctions.AddTraderTrigger("YOURTRIGGER2","ENGLISH1.");
    npcs.base.autonpcfunctions.AddAdditionalText("ENGLISH2.");
    npcs.base.autonpcfunctions.AddAdditionalText("ENGLISH3.");
    npcs.base.autonpcfunctions.AddTraderTrigger("YOURTRIGGER3","ENGLISH1.");
    npcs.base.autonpcfunctions.AddAdditionalText("ENGLISH2.");
    npcs.base.autonpcfunctions.AddAdditionalText("ENGLISH3.");
    npcs.base.autonpcfunctions.AddTraderTrigger("YOURTRIGGER4","ENGLISH1.");
    npcs.base.autonpcfunctions.AddAdditionalText("ENGLISH2.");
    npcs.base.autonpcfunctions.AddAdditionalText("ENGLISH3.");
    npcs.base.autonpcfunctions.AddTraderTrigger("YOURTRIGGER5","ENGLISH1.");
    npcs.base.autonpcfunctions.AddAdditionalText("ENGLISH2.");
    npcs.base.autonpcfunctions.AddAdditionalText("ENGLISH3.");
    npcs.base.autonpcfunctions.AddTraderTrigger("DEINTRIGGER1","GERMAN1.");
    npcs.base.autonpcfunctions.AddAdditionalText("GERMAN2.");
    npcs.base.autonpcfunctions.AddAdditionalText("GERMAN3.");
    npcs.base.autonpcfunctions.AddTraderTrigger("DEINTRIGGER2","GERMAN1.");
    npcs.base.autonpcfunctions.AddAdditionalText("GERMAN2.");
    npcs.base.autonpcfunctions.AddAdditionalText("GERMAN3.");
    npcs.base.autonpcfunctions.AddTraderTrigger("DEINTRIGGER3","GERMAN1.");
    npcs.base.autonpcfunctions.AddAdditionalText("GERMAN2.");
    npcs.base.autonpcfunctions.AddAdditionalText("GERMAN3.");
    npcs.base.autonpcfunctions.AddTraderTrigger("DEINTRIGGER4","GERMAN1.");
    npcs.base.autonpcfunctions.AddAdditionalText("GERMAN2.");
    npcs.base.autonpcfunctions.AddAdditionalText("GERMAN3.");
    npcs.base.autonpcfunctions.AddTraderTrigger("DEINTRIGGER5","GERMAN1.");
    npcs.base.autonpcfunctions.AddAdditionalText("GERMAN2.");
    npcs.base.autonpcfunctions.AddAdditionalText("GERMAN3.");
    -- Faction stuff
    npcs.base.autonpcfunctions.AddTraderTrigger("Elvaine","ENGLISH1.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Morgan");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("archmage");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Erzmagier");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddAdditionalText("ENGLISH2.");
    npcs.base.autonpcfunctions.AddAdditionalText("ENGLISH3.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Elvaine","GERMAN1.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Morgan");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("archmage");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Erzmagier");
    npcs.base.autonpcfunctions.AddAdditionalText("GERMAN2.");
    npcs.base.autonpcfunctions.AddAdditionalText("GERMAN3.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Runewick","ENGLISH1.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddAdditionalText("ENGLISH2.");
    npcs.base.autonpcfunctions.AddAdditionalText("ENGLISH3.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Runewick","GERMAN1.");
    npcs.base.autonpcfunctions.AddAdditionalText("GERMAN2.");
    npcs.base.autonpcfunctions.AddAdditionalText("GERMAN3.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Valerio","ENGLISH1.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Guilianni");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Don");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddAdditionalText("ENGLISH2.");
    npcs.base.autonpcfunctions.AddAdditionalText("ENGLISH3.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Valerio","GERMAN1.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Guilianni");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Don");
    npcs.base.autonpcfunctions.AddAdditionalText("GERMAN2.");
    npcs.base.autonpcfunctions.AddAdditionalText("GERMAN3.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Galmair","ENGLISH1.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddAdditionalText("ENGLISH2.");
    npcs.base.autonpcfunctions.AddAdditionalText("ENGLISH3.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Galmair","GERMAN1.");
    npcs.base.autonpcfunctions.AddAdditionalText("GERMAN2.");
    npcs.base.autonpcfunctions.AddAdditionalText("GERMAN3.");
    npcs.base.autonpcfunctions.AddTraderTrigger("rosaline","ENGLISH1.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("königin");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("queen");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("edwards");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddAdditionalText("ENGLISH2.");
    npcs.base.autonpcfunctions.AddAdditionalText("ENGLISH3.");
    npcs.base.autonpcfunctions.AddTraderTrigger("rosaline","GERMAN1.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("königin");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("queen");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("edwards");
    npcs.base.autonpcfunctions.AddAdditionalText("GERMAN2.");
    npcs.base.autonpcfunctions.AddAdditionalText("GERMAN3.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Cadomyr","ENGLISH1.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddAdditionalText("ENGLISH2.");
    npcs.base.autonpcfunctions.AddAdditionalText("ENGLISH3.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Cadomyr","GERMAN1.");
    npcs.base.autonpcfunctions.AddAdditionalText("GERMAN2.");
    npcs.base.autonpcfunctions.AddAdditionalText("GERMAN3.");
    -- Main land factions
    npcs.base.autonpcfunctions.AddTraderTrigger("albar","ENGLISH1.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddAdditionalText("ENGLISH2.");
    npcs.base.autonpcfunctions.AddAdditionalText("ENGLISH3.");
    npcs.base.autonpcfunctions.AddTraderTrigger("albar","GERMAN1.");
    npcs.base.autonpcfunctions.AddAdditionalText("GERMAN2.");
    npcs.base.autonpcfunctions.AddAdditionalText("GERMAN3.");
    npcs.base.autonpcfunctions.AddTraderTrigger("gynk","ENGLISH1.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("gync");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddAdditionalText("ENGLISH2.");
    npcs.base.autonpcfunctions.AddAdditionalText("ENGLISH3.");
    npcs.base.autonpcfunctions.AddTraderTrigger("gync","GERMAN1.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("gynk");
    npcs.base.autonpcfunctions.AddAdditionalText("GERMAN2.");
    npcs.base.autonpcfunctions.AddAdditionalText("GERMAN3.");
    npcs.base.autonpcfunctions.AddTraderTrigger("salkama","ENGLISH1.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddAdditionalText("ENGLISH2.");
    npcs.base.autonpcfunctions.AddAdditionalText("ENGLISH3.");
    npcs.base.autonpcfunctions.AddTraderTrigger("salkama","GERMAN1.");
    npcs.base.autonpcfunctions.AddAdditionalText("GERMAN2.");
    npcs.base.autonpcfunctions.AddAdditionalText("GERMAN3.");
    -- Gods; each NPC should react on AT LEAST one god, being a follower of said god
    npcs.base.autonpcfunctions.AddTraderTrigger("GOD","ENGLISH1.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddAdditionalText("ENGLISH2.");
    npcs.base.autonpcfunctions.AddAdditionalText("ENGLISH3.");
    npcs.base.autonpcfunctions.AddTraderTrigger("GOTT","GERMAN1.");
    npcs.base.autonpcfunctions.AddAdditionalText("GERMAN2.");
    npcs.base.autonpcfunctions.AddAdditionalText("GERMAN3.");
    -- Catching quest triggers
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","NO QUEST");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","NO QUEST");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("task","NO QUEST");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npcs.base.autonpcfunctions.AddTraderTrigger("Auftrag","NO QUEST");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Aufgabe");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    -- Last catch: Think about keyphrases the player might say and that are not caught until here
    npcs.base.autonpcfunctions.AddTraderTrigger("Yes","ANSWER1");
    npcs.base.autonpcfunctions.AddAdditionalText("ANSWER2");
    npcs.base.autonpcfunctions.AddTraderTrigger("Ja","ANSWER1");
    npcs.base.autonpcfunctions.AddAdditionalText("ANSWER2");
    npcs.base.autonpcfunctions.AddTraderTrigger("No","ANSWER1");
    npcs.base.autonpcfunctions.AddAdditionalText("ANSWER2");
    npcs.base.autonpcfunctions.AddTraderTrigger("Nein","ANSWER1");
    npcs.base.autonpcfunctions.AddAdditionalText("ANSWER2");
    -- Cycletext: Please add at least(!) ten cycletext messages. The more, the better. You can use emotes (#me is green), too. 
    npcs.base.autonpcfunctions.AddCycleText("GERMAN","ENGLISH");
    npcs.base.autonpcfunctions.AddCycleText("GERMAN","ENGLISH");
    npcs.base.autonpcfunctions.AddCycleText("GERMAN","ENGLISH");
    npcs.base.autonpcfunctions.AddCycleText("GERMAN","ENGLISH");
    npcs.base.autonpcfunctions.AddCycleText("GERMAN","ENGLISH");
    npcs.base.autonpcfunctions.AddCycleText("GERMAN","ENGLISH");
    npcs.base.autonpcfunctions.AddCycleText("GERMAN","ENGLISH");
    npcs.base.autonpcfunctions.AddCycleText("GERMAN","ENGLISH");
    npcs.base.autonpcfunctions.AddCycleText("GERMAN","ENGLISH");
    npcs.base.autonpcfunctions.AddCycleText("GERMAN","ENGLISH");
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
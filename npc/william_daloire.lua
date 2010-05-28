-- INSERT INTO npc VALUES (nextval('npc_seq'),0,897,794,1,4,false,'William Daloire','npc_william_daloire.lua',0);

require("npc.base.autonpcfunctions")
module("npc.william_daloire")

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
    npc.base.autonpcfunctions.AddTraderTrigger("Help","");
    npc.base.autonpcfunctions.AddConsequence("inform","[Game Help] This is NPC is the scholar William Daloire. Keyphrases: Hello, scholar, YOURTRIGGER1, YOURTRIGGER2.");
    npc.base.autonpcfunctions.AddTraderTrigger("Hilfe","");
    npc.base.autonpcfunctions.AddConsequence("inform","[Spielhilfe] Dieser NPC ist der Gelehrte William Daloire. Schlüsselwörter: Hallo, Gelehrter, DEINTRIGGER1, DEINTRIGGER2.");
    -- General speech
    npc.base.autonpcfunctions.AddTraderTrigger("Hello","ENGLISH1.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greetings");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Be greeted");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hail");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good day");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good morning");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good evening");
    npc.base.autonpcfunctions.AddAdditionalText("ENGLISH2.");
    npc.base.autonpcfunctions.AddAdditionalText("ENGLISH3.");
    npc.base.autonpcfunctions.AddTraderTrigger("Grüße","GERMAN1.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Gruß");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Seid gegrüßt");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Guten Tag");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Guten Abend");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Mahlzeit");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Tach");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Moin");
    npc.base.autonpcfunctions.AddAdditionalText("GERMAN2.");
    npc.base.autonpcfunctions.AddAdditionalText("GERMAN3.");
    npc.base.autonpcfunctions.AddTraderTrigger("Hiho","ENGLISH1.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("ENGLISH2.");
    npc.base.autonpcfunctions.AddAdditionalText("ENGLISH3.");
    npc.base.autonpcfunctions.AddTraderTrigger("Hiho","GERMAN1.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddAdditionalText("GERMAN2.");
    npc.base.autonpcfunctions.AddAdditionalText("GERMAN3.");
    npc.base.autonpcfunctions.AddTraderTrigger("Farewell","ENGLISH1.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good bye");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Bye");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Fare thy well");
    npc.base.autonpcfunctions.AddAdditionalText("ENGLISH2.");
    npc.base.autonpcfunctions.AddAdditionalText("ENGLISH3.");
    npc.base.autonpcfunctions.AddTraderTrigger("Tschüß","GERMAN1.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Tschüss");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Wiedersehen");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Gehabt euch wohl");
    npc.base.autonpcfunctions.AddAdditionalText("GERMAN2.");
    npc.base.autonpcfunctions.AddAdditionalText("GERMAN3.");
    npc.base.autonpcfunctions.AddTraderTrigger("Ciao","ENGLISH1.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("ENGLISH2.");
    npc.base.autonpcfunctions.AddAdditionalText("ENGLISH3.");
    npc.base.autonpcfunctions.AddTraderTrigger("Ciao","GERMAN1.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddAdditionalText("GERMAN2.");
    npc.base.autonpcfunctions.AddAdditionalText("GERMAN3.");
    npc.base.autonpcfunctions.AddTraderTrigger("How are you","ENGLISH1.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("How feel");
    npc.base.autonpcfunctions.AddAdditionalTrigger("How do you do");
    npc.base.autonpcfunctions.AddAdditionalText("ENGLISH2.");
    npc.base.autonpcfunctions.AddAdditionalText("ENGLISH3.");
    npc.base.autonpcfunctions.AddTraderTrigger("Wie geht","GERMAN1.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Wie fühlst");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Wie ist es ergangen");
    npc.base.autonpcfunctions.AddAdditionalText("GERMAN2.");
    npc.base.autonpcfunctions.AddAdditionalText("GERMAN3.");
    npc.base.autonpcfunctions.AddTraderTrigger("your name","ENGLISH1.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("who are you");
    npc.base.autonpcfunctions.AddAdditionalTrigger("who art thou");
    npc.base.autonpcfunctions.AddAdditionalText("ENGLISH2.");
    npc.base.autonpcfunctions.AddAdditionalText("ENGLISH3.");
    npc.base.autonpcfunctions.AddTraderTrigger("dein name","GERMAN1.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("wer bist du");
    npc.base.autonpcfunctions.AddAdditionalTrigger("wer seid ihr");
    npc.base.autonpcfunctions.AddAdditionalTrigger("wie heißt");
    npc.base.autonpcfunctions.AddAdditionalText("GERMAN2.");
    npc.base.autonpcfunctions.AddAdditionalText("GERMAN3.");
    -- Catching typical NPC phrases
    npc.base.autonpcfunctions.AddTraderTrigger("what sell","ENGLISH1.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("what buy");
    npc.base.autonpcfunctions.AddAdditionalTrigger("list wares");
    npc.base.autonpcfunctions.AddAdditionalTrigger("price of");
    npc.base.autonpcfunctions.AddAdditionalText("ENGLISH2.");
    npc.base.autonpcfunctions.AddAdditionalText("ENGLISH3.");
    npc.base.autonpcfunctions.AddTraderTrigger("was verkauf","GERMAN1.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("was kauf");
    npc.base.autonpcfunctions.AddAdditionalTrigger("warenliste");
    npc.base.autonpcfunctions.AddAdditionalTrigger("preis von");
    npc.base.autonpcfunctions.AddAdditionalText("GERMAN2.");
    npc.base.autonpcfunctions.AddAdditionalText("GERMAN3.");
    npc.base.autonpcfunctions.AddTraderTrigger("tell something","ENGLISH1.");
    npc.base.autonpcfunctions.AddAdditionalText("ENGLISH2.");
    npc.base.autonpcfunctions.AddAdditionalText("ENGLISH3.");
    npc.base.autonpcfunctions.AddTraderTrigger("erzähl was","GERMAN1.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("erzähl etwas");
    npc.base.autonpcfunctions.AddAdditionalText("GERMAN2.");
    npc.base.autonpcfunctions.AddAdditionalText("GERMAN3.");
    -- Small talk: The talk here should focus on possible questions. Feel free to add more!
    npc.base.autonpcfunctions.AddTraderTrigger("profession","ANSWER1");
    npc.base.autonpcfunctions.AddAdditionalText("ANSWER2");
    npc.base.autonpcfunctions.AddAdditionalText("ANSWER3");
    npc.base.autonpcfunctions.AddTraderTrigger("beruf","ANSWER1");
    npc.base.autonpcfunctions.AddAdditionalText("ANSWER2");
    npc.base.autonpcfunctions.AddAdditionalText("ANSWER3");
    npc.base.autonpcfunctions.AddTraderTrigger("job","ANSWER1");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddAdditionalText("ANSWER2");
    npc.base.autonpcfunctions.AddAdditionalText("ANSWER3");
    npc.base.autonpcfunctions.AddTraderTrigger("job","ANSWER1");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("ANSWER2");
    npc.base.autonpcfunctions.AddAdditionalText("ANSWER3");
    npc.base.autonpcfunctions.AddTraderTrigger("PROFESSION","ANSWER1");
    npc.base.autonpcfunctions.AddAdditionalText("ANSWER2");
    npc.base.autonpcfunctions.AddAdditionalText("ANSWER3");
    npc.base.autonpcfunctions.AddTraderTrigger("BERUF","ANSWER1");
    npc.base.autonpcfunctions.AddAdditionalText("ANSWER2");
    npc.base.autonpcfunctions.AddAdditionalText("ANSWER3");
    npc.base.autonpcfunctions.AddTraderTrigger("LOCATION","ANSWER1");
    npc.base.autonpcfunctions.AddAdditionalText("ANSWER2");
    npc.base.autonpcfunctions.AddAdditionalText("ANSWER3");
    npc.base.autonpcfunctions.AddTraderTrigger("ORT","ANSWER1");
    npc.base.autonpcfunctions.AddAdditionalText("ANSWER2");
    npc.base.autonpcfunctions.AddAdditionalText("ANSWER3");
    npc.base.autonpcfunctions.AddTraderTrigger("trader","OTHER NPCs1");
    npc.base.autonpcfunctions.AddAdditionalTrigger("merchant");
    npc.base.autonpcfunctions.AddAdditionalTrigger("collegue");
    npc.base.autonpcfunctions.AddAdditionalTrigger("vendor");
    npc.base.autonpcfunctions.AddAdditionalTrigger("market");
    npc.base.autonpcfunctions.AddAdditionalText("OTHER NPCs2");
    npc.base.autonpcfunctions.AddAdditionalText("OTHER NPCs3");
    npc.base.autonpcfunctions.AddTraderTrigger("händler","OTHER NPCs1");
    npc.base.autonpcfunctions.AddAdditionalTrigger("kollege");
    npc.base.autonpcfunctions.AddAdditionalTrigger("höker");
    npc.base.autonpcfunctions.AddAdditionalTrigger("markt");
    npc.base.autonpcfunctions.AddAdditionalText("OTHER NPCs2");
    npc.base.autonpcfunctions.AddAdditionalText("OTHER NPCs3");
    npc.base.autonpcfunctions.AddTraderTrigger("Gobaith","ANSWER1");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("ANSWER2");
    npc.base.autonpcfunctions.AddAdditionalText("ANSWER3");
    npc.base.autonpcfunctions.AddTraderTrigger("Gobaith","ANSWER1");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddAdditionalText("ANSWER2");
    npc.base.autonpcfunctions.AddAdditionalText("ANSWER3");
    -- More small talk; add at least five triggers
    npc.base.autonpcfunctions.AddTraderTrigger("YOURTRIGGER1","ENGLISH1.");
    npc.base.autonpcfunctions.AddAdditionalText("ENGLISH2.");
    npc.base.autonpcfunctions.AddAdditionalText("ENGLISH3.");
    npc.base.autonpcfunctions.AddTraderTrigger("YOURTRIGGER2","ENGLISH1.");
    npc.base.autonpcfunctions.AddAdditionalText("ENGLISH2.");
    npc.base.autonpcfunctions.AddAdditionalText("ENGLISH3.");
    npc.base.autonpcfunctions.AddTraderTrigger("YOURTRIGGER3","ENGLISH1.");
    npc.base.autonpcfunctions.AddAdditionalText("ENGLISH2.");
    npc.base.autonpcfunctions.AddAdditionalText("ENGLISH3.");
    npc.base.autonpcfunctions.AddTraderTrigger("YOURTRIGGER4","ENGLISH1.");
    npc.base.autonpcfunctions.AddAdditionalText("ENGLISH2.");
    npc.base.autonpcfunctions.AddAdditionalText("ENGLISH3.");
    npc.base.autonpcfunctions.AddTraderTrigger("YOURTRIGGER5","ENGLISH1.");
    npc.base.autonpcfunctions.AddAdditionalText("ENGLISH2.");
    npc.base.autonpcfunctions.AddAdditionalText("ENGLISH3.");
    npc.base.autonpcfunctions.AddTraderTrigger("DEINTRIGGER1","GERMAN1.");
    npc.base.autonpcfunctions.AddAdditionalText("GERMAN2.");
    npc.base.autonpcfunctions.AddAdditionalText("GERMAN3.");
    npc.base.autonpcfunctions.AddTraderTrigger("DEINTRIGGER2","GERMAN1.");
    npc.base.autonpcfunctions.AddAdditionalText("GERMAN2.");
    npc.base.autonpcfunctions.AddAdditionalText("GERMAN3.");
    npc.base.autonpcfunctions.AddTraderTrigger("DEINTRIGGER3","GERMAN1.");
    npc.base.autonpcfunctions.AddAdditionalText("GERMAN2.");
    npc.base.autonpcfunctions.AddAdditionalText("GERMAN3.");
    npc.base.autonpcfunctions.AddTraderTrigger("DEINTRIGGER4","GERMAN1.");
    npc.base.autonpcfunctions.AddAdditionalText("GERMAN2.");
    npc.base.autonpcfunctions.AddAdditionalText("GERMAN3.");
    npc.base.autonpcfunctions.AddTraderTrigger("DEINTRIGGER5","GERMAN1.");
    npc.base.autonpcfunctions.AddAdditionalText("GERMAN2.");
    npc.base.autonpcfunctions.AddAdditionalText("GERMAN3.");
    -- Faction stuff
    npc.base.autonpcfunctions.AddTraderTrigger("Elvaine","ENGLISH1.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Morgan");
    npc.base.autonpcfunctions.AddAdditionalTrigger("archmage");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Erzmagier");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("ENGLISH2.");
    npc.base.autonpcfunctions.AddAdditionalText("ENGLISH3.");
    npc.base.autonpcfunctions.AddTraderTrigger("Elvaine","GERMAN1.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Morgan");
    npc.base.autonpcfunctions.AddAdditionalTrigger("archmage");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Erzmagier");
    npc.base.autonpcfunctions.AddAdditionalText("GERMAN2.");
    npc.base.autonpcfunctions.AddAdditionalText("GERMAN3.");
    npc.base.autonpcfunctions.AddTraderTrigger("Runewick","ENGLISH1.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("ENGLISH2.");
    npc.base.autonpcfunctions.AddAdditionalText("ENGLISH3.");
    npc.base.autonpcfunctions.AddTraderTrigger("Runewick","GERMAN1.");
    npc.base.autonpcfunctions.AddAdditionalText("GERMAN2.");
    npc.base.autonpcfunctions.AddAdditionalText("GERMAN3.");
    npc.base.autonpcfunctions.AddTraderTrigger("Valerio","ENGLISH1.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Guilianni");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Don");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("ENGLISH2.");
    npc.base.autonpcfunctions.AddAdditionalText("ENGLISH3.");
    npc.base.autonpcfunctions.AddTraderTrigger("Valerio","GERMAN1.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Guilianni");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Don");
    npc.base.autonpcfunctions.AddAdditionalText("GERMAN2.");
    npc.base.autonpcfunctions.AddAdditionalText("GERMAN3.");
    npc.base.autonpcfunctions.AddTraderTrigger("Galmair","ENGLISH1.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("ENGLISH2.");
    npc.base.autonpcfunctions.AddAdditionalText("ENGLISH3.");
    npc.base.autonpcfunctions.AddTraderTrigger("Galmair","GERMAN1.");
    npc.base.autonpcfunctions.AddAdditionalText("GERMAN2.");
    npc.base.autonpcfunctions.AddAdditionalText("GERMAN3.");
    npc.base.autonpcfunctions.AddTraderTrigger("rosaline","ENGLISH1.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("königin");
    npc.base.autonpcfunctions.AddAdditionalTrigger("queen");
    npc.base.autonpcfunctions.AddAdditionalTrigger("edwards");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("ENGLISH2.");
    npc.base.autonpcfunctions.AddAdditionalText("ENGLISH3.");
    npc.base.autonpcfunctions.AddTraderTrigger("rosaline","GERMAN1.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("königin");
    npc.base.autonpcfunctions.AddAdditionalTrigger("queen");
    npc.base.autonpcfunctions.AddAdditionalTrigger("edwards");
    npc.base.autonpcfunctions.AddAdditionalText("GERMAN2.");
    npc.base.autonpcfunctions.AddAdditionalText("GERMAN3.");
    npc.base.autonpcfunctions.AddTraderTrigger("Cadomyr","ENGLISH1.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("ENGLISH2.");
    npc.base.autonpcfunctions.AddAdditionalText("ENGLISH3.");
    npc.base.autonpcfunctions.AddTraderTrigger("Cadomyr","GERMAN1.");
    npc.base.autonpcfunctions.AddAdditionalText("GERMAN2.");
    npc.base.autonpcfunctions.AddAdditionalText("GERMAN3.");
    -- Main land factions
    npc.base.autonpcfunctions.AddTraderTrigger("albar","ENGLISH1.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("ENGLISH2.");
    npc.base.autonpcfunctions.AddAdditionalText("ENGLISH3.");
    npc.base.autonpcfunctions.AddTraderTrigger("albar","GERMAN1.");
    npc.base.autonpcfunctions.AddAdditionalText("GERMAN2.");
    npc.base.autonpcfunctions.AddAdditionalText("GERMAN3.");
    npc.base.autonpcfunctions.AddTraderTrigger("gynk","ENGLISH1.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("gync");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("ENGLISH2.");
    npc.base.autonpcfunctions.AddAdditionalText("ENGLISH3.");
    npc.base.autonpcfunctions.AddTraderTrigger("gync","GERMAN1.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("gynk");
    npc.base.autonpcfunctions.AddAdditionalText("GERMAN2.");
    npc.base.autonpcfunctions.AddAdditionalText("GERMAN3.");
    npc.base.autonpcfunctions.AddTraderTrigger("salkama","ENGLISH1.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("ENGLISH2.");
    npc.base.autonpcfunctions.AddAdditionalText("ENGLISH3.");
    npc.base.autonpcfunctions.AddTraderTrigger("salkama","GERMAN1.");
    npc.base.autonpcfunctions.AddAdditionalText("GERMAN2.");
    npc.base.autonpcfunctions.AddAdditionalText("GERMAN3.");
    -- Gods; each NPC should react on AT LEAST one god, being a follower of said god
    npc.base.autonpcfunctions.AddTraderTrigger("GOD","ENGLISH1.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("ENGLISH2.");
    npc.base.autonpcfunctions.AddAdditionalText("ENGLISH3.");
    npc.base.autonpcfunctions.AddTraderTrigger("GOTT","GERMAN1.");
    npc.base.autonpcfunctions.AddAdditionalText("GERMAN2.");
    npc.base.autonpcfunctions.AddAdditionalText("GERMAN3.");
    -- Catching quest triggers
    npc.base.autonpcfunctions.AddTraderTrigger("quest","NO QUEST");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("quest","NO QUEST");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("task","NO QUEST");
    npc.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npc.base.autonpcfunctions.AddTraderTrigger("Auftrag","NO QUEST");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Aufgabe");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    -- Last catch: Think about keyphrases the player might say and that are not caught until here
    npc.base.autonpcfunctions.AddTraderTrigger("Yes","ANSWER1");
    npc.base.autonpcfunctions.AddAdditionalText("ANSWER2");
    npc.base.autonpcfunctions.AddTraderTrigger("Ja","ANSWER1");
    npc.base.autonpcfunctions.AddAdditionalText("ANSWER2");
    npc.base.autonpcfunctions.AddTraderTrigger("No","ANSWER1");
    npc.base.autonpcfunctions.AddAdditionalText("ANSWER2");
    npc.base.autonpcfunctions.AddTraderTrigger("Nein","ANSWER1");
    npc.base.autonpcfunctions.AddAdditionalText("ANSWER2");
    -- Cycletext: Please add at least(!) ten cycletext messages. The more, the better. You can use emotes (#me is green), too. 
    npc.base.autonpcfunctions.AddCycleText("GERMAN","ENGLISH");
    npc.base.autonpcfunctions.AddCycleText("GERMAN","ENGLISH");
    npc.base.autonpcfunctions.AddCycleText("GERMAN","ENGLISH");
    npc.base.autonpcfunctions.AddCycleText("GERMAN","ENGLISH");
    npc.base.autonpcfunctions.AddCycleText("GERMAN","ENGLISH");
    npc.base.autonpcfunctions.AddCycleText("GERMAN","ENGLISH");
    npc.base.autonpcfunctions.AddCycleText("GERMAN","ENGLISH");
    npc.base.autonpcfunctions.AddCycleText("GERMAN","ENGLISH");
    npc.base.autonpcfunctions.AddCycleText("GERMAN","ENGLISH");
    npc.base.autonpcfunctions.AddCycleText("GERMAN","ENGLISH");
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
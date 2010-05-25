-- INSERT INTO npc VALUES (nextval('npc_seq'),1,10,1,0,4,false,'Miggs','npc_miggs.lua',0);

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

    QuestID = 77;
    -- NPC by Estralis Seborian
    -- Queststatus Overview
    -- 0: No Quest taken
    -- 1: Quest 1 taken - kill 10 mummies
    -- 11: Quest 1 solved
    -- 12: Game over
    -- Debugging
    AddTraderTrigger("set 0","Quest status set to 0");
    AddConsequence("qpg","=",0);
    AddTraderTrigger("set 11","Quest status set to 11");
    AddConsequence("qpg","=",11);
    -- Help
    AddTraderTrigger("Help","");
    AddConsequence("inform","[Game Help] Just say 'quest'. set 0 or set 11 sets your queststatus accordingly.");
    AddTraderTrigger("Hilfe","");
    AddConsequence("talk","end");
    -- 1st quest: Kill 10 mummies.
    AddTraderTrigger("quest","Kill ten mummies (101-107), plz. Then say 'quest' again.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",0);
    AddConsequence("qpg","=",1);
    AddConsequence("inform","[New quest] Smash' em, dude");
    AddTraderTrigger("quest","THX 4 killing mummies.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",11);
    AddConsequence("inform","[Quest solved] U rule.");
    AddConsequence("qpg","=",12);
    AddTraderTrigger("quest","U already solved quest, noob. Say set 0 to start over.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",12);
    AddTraderTrigger("quest","U have 2 kill moar mummies, noob.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg",">",0);
    AddCondition("qpg","<",11);
    AddCycleText("Frag mich nach einer Queste.","Ask me 4 quest, pl0x.");
    AddCycleText("GTFO noob","GTFO noob");
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
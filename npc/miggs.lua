-- INSERT INTO npc VALUES (nextval('npc_seq'),1,374,216,0,4,false,'Miggs','npc_miggs.lua',0);

require("npc.base.autonpcfunctions")
module("npc.miggs", package.seeall)

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

    QuestID = 77;
    -- NPC by Estralis Seborian
    -- Queststatus Overview
    -- 0: No Quest taken
    -- 1: Quest 1 taken - kill 10 mummies
    -- 11: Quest 1 solved
    -- 12: Game over
    -- Debugging
    npc.base.autonpcfunctions.AddTraderTrigger("set 0","Quest status set to 0");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",0);
    npc.base.autonpcfunctions.AddTraderTrigger("set 11","Quest status set to 11");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",11);
    -- Help
    npc.base.autonpcfunctions.AddTraderTrigger("Help","");
    npc.base.autonpcfunctions.AddConsequence("inform","[Game Help] Just say 'quest'. set 0 or set 11 sets your queststatus accordingly.");
    npc.base.autonpcfunctions.AddTraderTrigger("Hilfe","");
    npc.base.autonpcfunctions.AddConsequence("talk","end");
    -- 1st quest: Kill 10 mummies.
    npc.base.autonpcfunctions.AddTraderTrigger("quest","Kill ten mummies (101-107), plz. Then say 'quest' again.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",0);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddConsequence("inform","[New quest] Smash' em, dude");
    npc.base.autonpcfunctions.AddTraderTrigger("quest","THX 4 killing mummies.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",11);
    npc.base.autonpcfunctions.AddConsequence("inform","[Quest solved] U rule.");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",12);
    npc.base.autonpcfunctions.AddTraderTrigger("quest","U already solved quest, noob. Say set 0 to start over.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",12);
    npc.base.autonpcfunctions.AddTraderTrigger("quest","U have 2 kill moar mummies, noob.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg",">",0);
    npc.base.autonpcfunctions.AddCondition("qpg","<",11);
    npc.base.autonpcfunctions.AddCycleText("Frag mich nach einer Queste.","Ask me 4 quest, pl0x.");
    npc.base.autonpcfunctions.AddCycleText("GTFO noob","GTFO noob");
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
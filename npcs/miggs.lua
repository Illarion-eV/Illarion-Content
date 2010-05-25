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

    npcs.base.autonpcfunctions.InitTalkLists();

    -- ********* START DYNAMIC PART ********

    QuestID = 77;
    -- NPC by Estralis Seborian
    -- Queststatus Overview
    -- 0: No Quest taken
    -- 1: Quest 1 taken - kill 10 mummies
    -- 11: Quest 1 solved
    -- 12: Game over
    -- Debugging
    npcs.base.autonpcfunctions.AddTraderTrigger("set 0","Quest status set to 0");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",0);
    npcs.base.autonpcfunctions.AddTraderTrigger("set 11","Quest status set to 11");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",11);
    -- Help
    npcs.base.autonpcfunctions.AddTraderTrigger("Help","");
    npcs.base.autonpcfunctions.AddConsequence("inform","[Game Help] Just say 'quest'. set 0 or set 11 sets your queststatus accordingly.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Hilfe","");
    npcs.base.autonpcfunctions.AddConsequence("talk","end");
    -- 1st quest: Kill 10 mummies.
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Kill ten mummies (101-107), plz. Then say 'quest' again.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",0);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("inform","[New quest] Smash' em, dude");
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","THX 4 killing mummies.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",11);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Quest solved] U rule.");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",12);
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","U already solved quest, noob. Say set 0 to start over.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",12);
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","U have 2 kill moar mummies, noob.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg",">",0);
    npcs.base.autonpcfunctions.AddCondition("qpg","<",11);
    npcs.base.autonpcfunctions.AddCycleText("Frag mich nach einer Queste.","Ask me 4 quest, pl0x.");
    npcs.base.autonpcfunctions.AddCycleText("GTFO noob","GTFO noob");
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
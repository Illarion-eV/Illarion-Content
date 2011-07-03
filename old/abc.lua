-- INSERT INTO npc VALUES (nextval('npc_seq'),halfing,10,10,0,2,false,'ABC','npc/abc.lua',0);

require("npc.base.autonpcfunctions")
module("npc.abc", package.seeall)
-- dofile("/usr/share/servers/illarionserver/scripts/npc_autonpcfunctions.lua");

function useNPC(user,counter,param)
    thisNPC:increaseSkill(1,"common language",100);
    thisNPC:talkLanguage(Character.say, Player.german, "ABC!");
    thisNPC:talkLanguage(Character.say, Player.english, "ABC!");
end

function initializeNpc()
    if TraderFirst then
        return true;
    end

    npc.base.autonpcfunctions.InitTalkLists();

    -- ********* START DYNAMIC PART ********

    QuestID = 0815;
    npc.base.autonpcfunctions.AddTraderTrigger("gimme %NUMBER","Sure dude, here you have %NUMBER coins.");
    npc.base.autonpcfunctions.AddConsequence("money","+","%NUMBER");
    npc.base.autonpcfunctions.AddTraderTrigger("%NUMBER","You have less than %NUMBER coins.");
    npc.base.autonpcfunctions.AddCondition("money","<","%NUMBER");
    npc.base.autonpcfunctions.AddTraderTrigger("%NUMBER","You have more than %NUMBER coins.");
    npc.base.autonpcfunctions.AddCondition("money",">","%NUMBER");
    npc.base.autonpcfunctions.AddTraderTrigger("%NUMBER","You have exactly %NUMBER coins.");
    npc.base.autonpcfunctions.AddCondition("money","=","%NUMBER");
    npc.base.autonpcfunctions.AddTraderTrigger("%NUMBER","Erm, something is wrong here.");
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

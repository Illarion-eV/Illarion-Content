-- INSERT INTO npc VALUES (nextval('npc_seq'),halfing,10,10,0,2,false,'ABC','npc_abc.lua',0);

require("npcs.base.autonpcfunctions")
-- dofile("/usr/share/servers/illarionserver/scripts/npc_autonpcfunctions.lua");

function useNPC(user,counter,param)
    thisNPC:increaseSkill(1,"common language",100);
    thisNPC:talkLanguage(CCharacter.say, CPlayer.german, "ABC!");
    thisNPC:talkLanguage(CCharacter.say, CPlayer.english, "ABC!");
end

function initializeNpc()
    if TraderFirst then
        return true;
    end

    npcs.base.autonpcfunctions.InitTalkLists();

    -- ********* START DYNAMIC PART ********

    QuestID = 0815;
    npcs.base.autonpcfunctions.AddTraderTrigger("gimme %NUMBER","Sure dude, here you have %NUMBER coins.");
    npcs.base.autonpcfunctions.AddConsequence("money","+","%NUMBER");
    npcs.base.autonpcfunctions.AddTraderTrigger("%NUMBER","You have less than %NUMBER coins.");
    npcs.base.autonpcfunctions.AddCondition("money","<","%NUMBER");
    npcs.base.autonpcfunctions.AddTraderTrigger("%NUMBER","You have more than %NUMBER coins.");
    npcs.base.autonpcfunctions.AddCondition("money",">","%NUMBER");
    npcs.base.autonpcfunctions.AddTraderTrigger("%NUMBER","You have exactly %NUMBER coins.");
    npcs.base.autonpcfunctions.AddCondition("money","=","%NUMBER");
    npcs.base.autonpcfunctions.AddTraderTrigger("%NUMBER","Erm, something is wrong here.");
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
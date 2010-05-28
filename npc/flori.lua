-- INSERT INTO npc VALUES (nextval('npc_seq'),50,883,632,0,4,false,'Flori','npc_flori.lua',0);

require("npc.base.autonpcfunctions")
module("npc.flori")

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

    QuestID = 106;
    -- NPC by Nanuk
    -- Revised by Estralis Seborian
    -- Milo's mule
    npc.base.autonpcfunctions.AddCycleText("Iiihhhh-aahhhh!","Iiihhhh-aahhhh!");
    npc.base.autonpcfunctions.AddCycleText("#me stampft störrisch auf.","#me stubbornly stamps one foot.");
    npc.base.autonpcfunctions.AddCycleText("#me zerrt am Halfter.","#me tears at the headcollar.");
    npc.base.autonpcfunctions.AddCycleText("#me versucht den Halbling zu beißen.","#me tries to bite the halfling.");
    npc.base.autonpcfunctions.AddCycleText("#me schüttelt seinen Kopf.","#me tosses his head.");
    npc.base.autonpcfunctions.AddCycleText("#me tritt mit den Hinterläufen aus.","#me kicks with his hind legs.");
    npc.base.autonpcfunctions.AddCycleText("#me bäumt sich auf.","#me rears up.");
    npc.base.autonpcfunctions.AddCycleText("#me lässt ein paar Eselsäpfel fallen.","#me drops some mule droppings.");
    npc.base.autonpcfunctions.AddCycleText("#me schlägt mit dem Schwanz nach ein paar Fliegen.","#me wags his tail to get rid of some flies.");
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
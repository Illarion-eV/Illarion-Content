-- INSERT INTO npc VALUES (nextval('npc_seq'),50,883,632,0,4,false,'Flori','npc_flori.lua',0);

require("npcs.base.autonpcfunctions")
module("npcs.flori")

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

    QuestID = 106;
    -- NPC by Nanuk
    -- Revised by Estralis Seborian
    -- Milo's mule
    npcs.base.autonpcfunctions.AddCycleText("Iiihhhh-aahhhh!","Iiihhhh-aahhhh!");
    npcs.base.autonpcfunctions.AddCycleText("#me stampft störrisch auf.","#me stubbornly stamps one foot.");
    npcs.base.autonpcfunctions.AddCycleText("#me zerrt am Halfter.","#me tears at the headcollar.");
    npcs.base.autonpcfunctions.AddCycleText("#me versucht den Halbling zu beißen.","#me tries to bite the halfling.");
    npcs.base.autonpcfunctions.AddCycleText("#me schüttelt seinen Kopf.","#me tosses his head.");
    npcs.base.autonpcfunctions.AddCycleText("#me tritt mit den Hinterläufen aus.","#me kicks with his hind legs.");
    npcs.base.autonpcfunctions.AddCycleText("#me bäumt sich auf.","#me rears up.");
    npcs.base.autonpcfunctions.AddCycleText("#me lässt ein paar Eselsäpfel fallen.","#me drops some mule droppings.");
    npcs.base.autonpcfunctions.AddCycleText("#me schlägt mit dem Schwanz nach ein paar Fliegen.","#me wags his tail to get rid of some flies.");
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
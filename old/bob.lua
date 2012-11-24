require("npc.base.autonpcfunctions")
module("npc.bob", package.seeall)

function useNPC(user,counter,param)
    thisNPC:increaseSkill(1,"common language",100);
    thisNPC:talkLanguage(Character.say, Player.german, "Finger weg!");
    thisNPC:talkLanguage(Character.say, Player.english, "Don't touch me!");
end
function initializeNpc()
    if TraderFirst then
        return true;
    end

    npc.base.autonpcfunctions.InitTalkLists();
    

-- ********* START DYNAMIC PART ********

name="Torina Scibri"
--position=0,0,0
race=human
sex=female
--direction=west
    
	
	-- cyletext
    npc.base.autonpcfunctions.AddCycleText("#me sortiert Bücher in den Regalen","#me sorts books in the shelfs.");
    
    -- Begrüßung
    npc.base.autonpcfunctions.AddTraderTrigger("hallo","Sei mir gegrüßt. Brauchst du Hilfe bei der Suche nach einem bestimmten Buch?");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddAdditionalTrigger("gr[üue]+[sß]");
    npc.base.autonpcfunctions.AddAdditionalTrigger("guten tag");
    npc.base.autonpcfunctions.AddAdditionalTrigger("aho[ij]");
    npc.base.autonpcfunctions.AddAdditionalTrigger("tach");
    -- Verabschiedung 
    npc.base.autonpcfunctions.AddTraderTrigger("[Gg]ute nacht","Machs gut. Ich hoff, wir sehen uns bald wieder. Und halt die Großen immer schön fern.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
	npc.base.autonpcfunctions.AddAdditionalTrigger("wieder sehen");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Tt]sch[üue]+[sß]");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Tt]tschau");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Gg]ehabt euch");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Aa]uf bald");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Bb]is bald");
    -- Name
    npc.base.autonpcfunctions.AddTraderTrigger("Name","Ich bin %name, die Schreiberin hier in der Grauen Zuflucht.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddAdditionalTrigger("wie hei[sß] du");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Wer bist du");
    npc.base.autonpcfunctions.AddAdditionalTrigger("wer seid ihr");
    -- Argwohn gegenüber Orks
    npc.base.autonpcfunctions.AddTraderTrigger(" ","So einer wie du hat hier nichts zu suchen. Hau ab oder ich ruf die Wachen!");
    npc.base.autonpcfunctions.AddCondition("race", Character.orc);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    
    npc.base.autonpcfunctions.AddTraderTrigger(" ","You should not be here. Leave before i call for guards!");
    npc.base.autonpcfunctions.AddCondition("race", Character.orc);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    
    
    
    --Schlüsselabgabe wenn Char einen Siegelring der Rose hat und genügend Geld
    npc.base.autonpcfunctions.AddTraderTrigger("[Bb]rauch [Ss]chl[üue]ssel","Hier hast du einen.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Mm][öoe]chte Schl[üue]ssel");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddCondition("item",68,"body",">=",1); -- Siegelring der Rose ist ein Rubinring (id 68, data 2)
    npc.base.autonpcfunctions.AddCondition("money",">=",100);
    npc.base.autonpcfunctions.AddConsequence("money","-",100);
    npc.base.autonpcfunctions.AddConsequence("item",1,1,199,0); -- id, number, quality, data

    
    
    -- ********* END DYNAMIC PART ********
    TradSpeakLang={0,8};
    TradStdLang=0;
    --common language=0
    --human language=1
    --dwarf language=2
    --elf language=3
    --lizard language=4
    --orc language=5
    --halfling language=6
    --fairy language=7
    --gnome language=8
    --goblin language=9
    --ancient language=10


    npc.base.autonpcfunctions.increaseLangSkill(TradSpeakLang)
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

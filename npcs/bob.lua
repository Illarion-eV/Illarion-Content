require("npcs.base.autonpcfunctions")
function useNPC(user,counter,param)
    thisNPC:increaseSkill(1,"common language",100);
    thisNPC:talkLanguage(CCharacter.say, CPlayer.german, "Finger weg!");
    thisNPC:talkLanguage(CCharacter.say, CPlayer.english, "Don't touch me!");
end
function initializeNpc()
    if TraderFirst then
        return true;
    end

    npcs.base.autonpcfunctions.InitTalkLists();
    

-- ********* START DYNAMIC PART ********

name="Torina Scibri"
--position=0,0,0
race=human
sex=female
--direction=west
    
	
	-- cyletext
    npcs.base.autonpcfunctions.AddCycleText("#me sortiert Bücher in den Regalen","#me sorts books in the shelfs.");
    
    -- Begrüßung
    npcs.base.autonpcfunctions.AddTraderTrigger("hallo","Sei mir gegrüßt. Brauchst du Hilfe bei der Suche nach einem bestimmten Buch?");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("gr[üue]+[sß]");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("guten tag");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("aho[ij]");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("tach");
    -- Verabschiedung 
    npcs.base.autonpcfunctions.AddTraderTrigger("[Gg]ute nacht","Machs gut. Ich hoff, wir sehen uns bald wieder. Und halt die Großen immer schön fern.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
	npcs.base.autonpcfunctions.AddAdditionalTrigger("wieder sehen");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("[Tt]sch[üue]+[sß]");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("[Tt]tschau");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("[Gg]ehabt euch");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("[Aa]uf bald");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("[Bb]is bald");
    -- Name
    npcs.base.autonpcfunctions.AddTraderTrigger("Name","Ich bin %name, die Schreiberin hier in der Grauen Zuflucht.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wie hei[sß] du");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Wer bist du");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wer seid ihr");
    -- Argwohn gegenüber Orks
    npcs.base.autonpcfunctions.AddTraderTrigger(" ","So einer wie Du hat hier nichts zu suchen. Hau ab oder ich ruf die Wachen!");
    npcs.base.autonpcfunctions.AddCondition("race", CCharacter.orc);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    
    npcs.base.autonpcfunctions.AddTraderTrigger(" ","You should not be here. Leave before i call for guards!");
    npcs.base.autonpcfunctions.AddCondition("race", CCharacter.orc);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    
    
    
    --Schlüsselabgabe wenn Char einen Siegelring der Rose hat und genügend Geld
    npcs.base.autonpcfunctions.AddTraderTrigger("[Bb]rauch [Ss]chl[üue]ssel","Hier hast du einen.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("[Mm][öoe]chte Schl[üue]ssel");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddCondition("item",68,"body",">=",1); -- Siegelring der Rose ist ein Rubinring (id 68, data 2)
    npcs.base.autonpcfunctions.AddCondition("money",">=",100);
    npcs.base.autonpcfunctions.AddConsequence("money","-",100);
    npcs.base.autonpcfunctions.AddConsequence("item",1,1,199,0); -- id, number, quality, data

    
    
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


    npcs.base.autonpcfunctions.increaseLangSkill(TradSpeakLang)
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
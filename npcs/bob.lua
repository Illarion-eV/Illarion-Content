dofile("npc_autonpcfunctions.lua")
function useNPC(user,counter,param)
    thisNPC:increaseSkill(1,"common language",100);
    thisNPC:talkLanguage(CCharacter.say, CPlayer.german, "Finger weg!");
    thisNPC:talkLanguage(CCharacter.say, CPlayer.english, "Don't touch me!");
end
function initializeNpc()
    if TraderFirst then
        return true;
    end

    InitTalkLists();
    

-- ********* START DYNAMIC PART ********

name="Torina Scibri"
--position=0,0,0
race=human
sex=female
--direction=west
    
	
	-- cyletext
    AddCycleText("#me sortiert Bücher in den Regalen","#me sorts books in the shelfs.");
    
    -- Begrüßung
    AddTraderTrigger("hallo","Sei mir gegrüßt. Brauchst du Hilfe bei der Suche nach einem bestimmten Buch?");
    AddCondition("lang","german");
    AddAdditionalTrigger("gr[üue]+[sß]");
    AddAdditionalTrigger("guten tag");
    AddAdditionalTrigger("aho[ij]");
    AddAdditionalTrigger("tach");
    -- Verabschiedung 
    AddTraderTrigger("[Gg]ute nacht","Machs gut. Ich hoff, wir sehen uns bald wieder. Und halt die Großen immer schön fern.");
    AddCondition("lang","german");
	AddAdditionalTrigger("wieder sehen");
    AddAdditionalTrigger("[Tt]sch[üue]+[sß]");
    AddAdditionalTrigger("[Tt]tschau");
    AddAdditionalTrigger("[Gg]ehabt euch");
    AddAdditionalTrigger("[Aa]uf bald");
    AddAdditionalTrigger("[Bb]is bald");
    -- Name
    AddTraderTrigger("Name","Ich bin %name, die Schreiberin hier in der Grauen Zuflucht.");
    AddCondition("lang","german");
    AddAdditionalTrigger("wie hei[sß] du");
    AddAdditionalTrigger("Wer bist du");
    AddAdditionalTrigger("wer seid ihr");
    -- Argwohn gegenüber Orks
    AddTraderTrigger(" ","So einer wie Du hat hier nichts zu suchen. Hau ab oder ich ruf die Wachen!");
    AddCondition("race", CCharacter.orc);
    AddCondition("lang","german");
    
    AddTraderTrigger(" ","You should not be here. Leave before i call for guards!");
    AddCondition("race", CCharacter.orc);
    AddCondition("lang","english");
    
    
    
    --Schlüsselabgabe wenn Char einen Siegelring der Rose hat und genügend Geld
    AddTraderTrigger("[Bb]rauch [Ss]chl[üue]ssel","Hier hast du einen.");
    AddAdditionalTrigger("[Mm][öoe]chte Schl[üue]ssel");
    AddCondition("lang","german");
    AddCondition("item",68,"body",">=",1); -- Siegelring der Rose ist ein Rubinring (id 68, data 2)
    AddCondition("money",">=",100);
    AddConsequence("money","-",100);
    AddConsequence("item",1,1,199,0); -- id, number, quality, data

    
    
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


    increaseLangSkill(TradSpeakLang)
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
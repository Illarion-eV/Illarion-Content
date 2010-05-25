-- INSERT INTO npc VALUES (nextval('npc_seq'),3,371,152,-10,4,false,'Ferano','npc_ferano.lua',0);

require("npcs.base.autonpcfunctions")
-- require("npcs.base.autonpcfunctions")

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

    SetRadius(0);
    AddCycleText("#me sieht sich um","#me looks around");
    QuestID = 558;
    AddTraderTrigger("[Rr]eset","Reset done!");
    AddConsequence("qpg","=",0);
    AddTraderTrigger("[aA]uf bald","Auf bald, die Fünf mit euch.");
    AddTraderTrigger("[Vv]anima","Tol Vanima ist die Insel der Elfen und das hier ist die Mine von Vanima. Die Mine bietet Unterschlupf für einige Gnomforscher. Nehmt euch vor ihnen in Acht, sie sind sehr gefährlich!");
    AddTraderTrigger("[Hh]allo","Seid gegrüßt Reisender");
    AddAdditionalTrigger("[Gg]r[üs][sß]e");
    AddAdditionalTrigger("[Ss]eid gegrüßt");
    AddCondition("qpg","<",2);
    AddConsequence("qpg","=",1);
    AddTraderTrigger("h[ie]lfe","Ich such jemanden der mir einen Molotov-Cocktail bringt, ich brauch ihn für meine Forschungen, wollt ihr mir helfen?");
    AddAdditionalTrigger("mach");
    AddCondition("qpg","=",1);
    AddConsequence("qpg","=",2);
    AddTraderTrigger("[Hh][ie]lf","Ich such jemanden der mir einen Molotov-Coktail bringt, ich brauch ihn für meine Forschungen, wollt ihr mir helfen?");
    AddCondition("qpg","=",2);
    AddTraderTrigger("[Jj]a","Wirklich, vielen Dank ich werde euch dafür auch reichlich Entlohnen.");
    AddCondition("qpg","=",2);
    AddConsequence("qpg","=",3);
    AddTraderTrigger("[Nn]ein","Schade, dennoch Danke");
    AddCondition("qpg","=",2);
    AddConsequence("qpg","=",0);
    AddTraderTrigger("[Mm]olotov","Oh, vielen Dank hier ist eure Belohnung");
    AddCondition("item",2502,"all",">=",1);
    AddCondition("qpg","=",3);
    AddConsequence("deleteitem",2502,1);
    AddConsequence("item",3077,3,333,0);
    AddConsequence("qpg","=",4);
    AddTraderTrigger("[Mm]olotov","Ihr habt doch gar kein Molotov-Cocktail dabei, kommt wieder wenn ihr einen habt!");
    AddCondition("item",2502,"all","<",1);
    AddCondition("qpg","=",3);
    AddTraderTrigger("[Gg]r[üs][sß]e","Hallo, schön euch wiederzusehen %CHARNAME. Wollt ihr mir erneut helfen?");
    AddAdditionalTrigger("[Hh]allo");
    AddAdditionalTrigger("[Ss]eid gegrüßt");
    AddCondition("qpg","=",4);
    AddConsequence("qpg","=",5);
    AddTraderTrigger("[Jj]a","Sehr gut, ich bräuchte einen Meriniumbrocken, könnt ihr mir soetwas holen?");
    AddAdditionalTrigger("[Hh][ei]lf");
    AddCondition("qpg","=",5);
    AddConsequence("qpg","=",6);
    AddTraderTrigger("[Nn]ein","Schade, sprecht mich ruhig an wenn ihr mehr Zeit habt.");
    AddCondition("qpg","=",5);
    AddConsequence("qpg","=",4);
    AddTraderTrigger("[Jj]a","Vielen dank, ich hörte die Gnomforscher in der Vanimamine haben sowas.");
    AddCondition("qpg","=",6);
    AddConsequence("qpg","=",7);
    AddTraderTrigger("[Mm]erinium","Ein Meriniumbrocken ist ein seltenes Erz. Könnt ihr mir dieses beschaffen?");
    AddAdditionalTrigger("[Bb]rocken");
    AddCondition("qpg","=",6);
    AddTraderTrigger("[Nn]ein","Schade, sprecht mich ruhig an wenn ihr mehr Zeit habt.");
    AddCondition("qpg","=",6);
    AddConsequence("qpg","=",4);
    AddTraderTrigger("[mM]erinium","Vielen Dank, ihr habt mir mal wieder sehr geholfen. Hier ist eure Belohnung");
    AddAdditionalTrigger("[Bb]rocken");
    AddCondition("qpg","=",7);
    AddCondition("item",2534,"all",">=",1);
    AddConsequence("deleteitem",2534,1);
    AddConsequence("item",334,1,666,0);
    AddConsequence("qpg","=",8);
    AddTraderTrigger("[Mm]erinium","Ihr seid nicht im Besitz eines Meriniumbrocken, kommt wieder wenn ihr einen habt!");
    AddAdditionalTrigger("[Bb]rocken");
    AddCondition("item",2534,"all","<",1);
    AddCondition("qpg","=",7);
    AddTraderTrigger("[Gg]r[üs][sß]e","Hallo, schön euch wiederzusehen %CHARNAME.");
    AddAdditionalTrigger("[Hh]allo");
    AddAdditionalTrigger("[Ss]eid gegrüßt");
    AddCondition("qpg","=",8);
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

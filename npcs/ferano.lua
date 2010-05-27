-- INSERT INTO npc VALUES (nextval('npc_seq'),3,371,152,-10,4,false,'Ferano','npc_ferano.lua',0);

require("npcs.base.autonpcfunctions")
module("npcs.ferano")

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

    npcs.base.autonpcfunctions.SetRadius(0);
    npcs.base.autonpcfunctions.AddCycleText("#me sieht sich um","#me looks around");
    QuestID = 558;
    npcs.base.autonpcfunctions.AddTraderTrigger("[Rr]eset","Reset done!");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",0);
    npcs.base.autonpcfunctions.AddTraderTrigger("[aA]uf bald","Auf bald, die Fünf mit euch.");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Vv]anima","Tol Vanima ist die Insel der Elfen und das hier ist die Mine von Vanima. Die Mine bietet Unterschlupf für einige Gnomforscher. Nehmt euch vor ihnen in Acht, sie sind sehr gefährlich!");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Hh]allo","Seid gegrüßt Reisender");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("[Gg]r[üs][sß]e");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("[Ss]eid gegrüßt");
    npcs.base.autonpcfunctions.AddCondition("qpg","<",2);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("h[ie]lfe","Ich such jemanden der mir einen Molotov-Cocktail bringt, ich brauch ihn für meine Forschungen, wollt ihr mir helfen?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mach");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("[Hh][ie]lf","Ich such jemanden der mir einen Molotov-Coktail bringt, ich brauch ihn für meine Forschungen, wollt ihr mir helfen?");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("[Jj]a","Wirklich, vielen Dank ich werde euch dafür auch reichlich Entlohnen.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",3);
    npcs.base.autonpcfunctions.AddTraderTrigger("[Nn]ein","Schade, dennoch Danke");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",0);
    npcs.base.autonpcfunctions.AddTraderTrigger("[Mm]olotov","Oh, vielen Dank hier ist eure Belohnung");
    npcs.base.autonpcfunctions.AddCondition("item",2502,"all",">=",1);
    npcs.base.autonpcfunctions.AddCondition("qpg","=",3);
    npcs.base.autonpcfunctions.AddConsequence("deleteitem",2502,1);
    npcs.base.autonpcfunctions.AddConsequence("item",3077,3,333,0);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",4);
    npcs.base.autonpcfunctions.AddTraderTrigger("[Mm]olotov","Ihr habt doch gar kein Molotov-Cocktail dabei, kommt wieder wenn ihr einen habt!");
    npcs.base.autonpcfunctions.AddCondition("item",2502,"all","<",1);
    npcs.base.autonpcfunctions.AddCondition("qpg","=",3);
    npcs.base.autonpcfunctions.AddTraderTrigger("[Gg]r[üs][sß]e","Hallo, schön euch wiederzusehen %CHARNAME. Wollt ihr mir erneut helfen?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("[Hh]allo");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("[Ss]eid gegrüßt");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",4);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",5);
    npcs.base.autonpcfunctions.AddTraderTrigger("[Jj]a","Sehr gut, ich bräuchte einen Meriniumbrocken, könnt ihr mir soetwas holen?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("[Hh][ei]lf");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",5);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",6);
    npcs.base.autonpcfunctions.AddTraderTrigger("[Nn]ein","Schade, sprecht mich ruhig an wenn ihr mehr Zeit habt.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",5);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",4);
    npcs.base.autonpcfunctions.AddTraderTrigger("[Jj]a","Vielen dank, ich hörte die Gnomforscher in der Vanimamine haben sowas.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",6);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",7);
    npcs.base.autonpcfunctions.AddTraderTrigger("[Mm]erinium","Ein Meriniumbrocken ist ein seltenes Erz. Könnt ihr mir dieses beschaffen?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("[Bb]rocken");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",6);
    npcs.base.autonpcfunctions.AddTraderTrigger("[Nn]ein","Schade, sprecht mich ruhig an wenn ihr mehr Zeit habt.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",6);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",4);
    npcs.base.autonpcfunctions.AddTraderTrigger("[mM]erinium","Vielen Dank, ihr habt mir mal wieder sehr geholfen. Hier ist eure Belohnung");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("[Bb]rocken");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",7);
    npcs.base.autonpcfunctions.AddCondition("item",2534,"all",">=",1);
    npcs.base.autonpcfunctions.AddConsequence("deleteitem",2534,1);
    npcs.base.autonpcfunctions.AddConsequence("item",334,1,666,0);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",8);
    npcs.base.autonpcfunctions.AddTraderTrigger("[Mm]erinium","Ihr seid nicht im Besitz eines Meriniumbrocken, kommt wieder wenn ihr einen habt!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("[Bb]rocken");
    npcs.base.autonpcfunctions.AddCondition("item",2534,"all","<",1);
    npcs.base.autonpcfunctions.AddCondition("qpg","=",7);
    npcs.base.autonpcfunctions.AddTraderTrigger("[Gg]r[üs][sß]e","Hallo, schön euch wiederzusehen %CHARNAME.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("[Hh]allo");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("[Ss]eid gegrüßt");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",8);
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

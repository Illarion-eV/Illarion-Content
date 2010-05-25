-- INSERT INTO npc VALUES (nextval('npc_seq'),8,156,-448,0,4,false,'Meegog','npc_meegog.lua',0);

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

    InitTalkLists();

    -- ********* START DYNAMIC PART ********

    -- Meegog a Goblin slave
    AddTraderTrigger("greetings","Greetinks! How may poor "..thisNPC.name.." serve my Masters?  I can saw logs for you!");
    AddAdditionalTrigger("hello");
    AddAdditionalTrigger("Greeb+[a]+s");
    AddTraderTrigger("gr[üue]+[sß]+e","Grüße! Wie kann schlechter "..thisNPC.name.." meinen Mastern dienen? Ich kann sah Klotz für Sie!");
    AddAdditionalTrigger("Hallo");
    AddAdditionalTrigger("Guten Tag");
    AddTraderTrigger("Saw Logs","Which type shall I make master?  Apple, Cherry, Conifer or Naldor?");
    AddTraderTrigger("sah Klotz","Welchen Typ werde ich Master machen? Apfel, Kirsch, Tannen oder Naldor?");
    AddTraderTrigger("Apple","#me takes your logs and immediately saws them into boards. ");
    AddCondition("item",2560,"belt",">=",1);
    AddConsequence("item",2716,1,333,0);
    AddConsequence("deleteitem",2560,1);
    AddTraderTrigger("Apfel","#me nimmt Ihren Klotz und sägt sie sofort in Ausschüsse. ");
    AddCondition("item",2560,"belt",">=",1);
    AddConsequence("item",2716,1,333,0);
    AddConsequence("deleteitem",2560,1);
    AddTraderTrigger("Cherry","#me takes your logs and immediately saws them into boards. ");
    AddCondition("item",543,"belt",">=",1);
    AddConsequence("item",545,1,333,0);
    AddConsequence("deleteitem",543,1);
    AddTraderTrigger("Kirsch","#me nimmt Ihren Klotz und sägt sie sofort in Ausschüsse. ");
    AddCondition("item",543,"belt",">=",1);
    AddConsequence("item",545,1,333,0);
    AddConsequence("deleteitem",543,1);
    AddTraderTrigger("Conifer","#me takes your logs and immediately saws them into boards. ");
    AddCondition("item",3,"belt",">=",1);
    AddConsequence("item",2543,1,333,0);
    AddConsequence("deleteitem",3,1);
    AddTraderTrigger("Tannen","#me nimmt Ihren Klotz und sägt sie sofort in Ausschüsse. ");
    AddCondition("item",3,"belt",">=",1);
    AddConsequence("item",2543,1,333,0);
    AddConsequence("deleteitem",3,1);
    AddTraderTrigger("Naldor","#me takes your logs and immediately saws them into boards. ");
    AddAdditionalTrigger("Oak");
    AddCondition("item",544,"belt",">=",1);
    AddCondition("lang","english");
    AddConsequence("item",546,1,333,0);
    AddConsequence("deleteitem",544,1);
    AddTraderTrigger("Naldor","#me nimmt Ihren Klotz und sägt sie sofort in Ausschüsse. ");
    AddCondition("item",544,"belt",">=",1);
    AddCondition("lang","german");
    AddConsequence("item",546,1,333,0);
    AddConsequence("deleteitem",544,1);
    -- RP reactions
    AddTraderTrigger("kick","Ooohhh!  Please don’t hurt poor "..thisNPC.name..", I’ll do as you asks!");
    AddAdditionalTrigger("boot");
    AddTraderTrigger("tritt"," Ooohhh! Du nicht bestrafen armen "..thisNPC.name..", ich alles machen was du sagst!");
    AddAdditionalTrigger("trete");
    AddAdditionalTrigger("stiefel");
    AddTraderTrigger("beat","#me cringes into a corner, begging for mercy.");
    AddAdditionalTrigger("punch");
    AddAdditionalTrigger("hit");
    AddAdditionalTrigger("slap");
    AddTraderTrigger("Erfolg","#me duckt sich an einer Ecke, um die Gnade bittend.");
    AddAdditionalTrigger("Schlag");
    AddTraderTrigger("whip","#me cringes in a corner and screams for mercy!");
    AddAdditionalTrigger("slash");
    AddTraderTrigger("peitsche","#me duckt sich ängstlich und winselt um Gnade!");
    AddAdditionalTrigger("schlag");
    AddAdditionalTrigger("hieb");
    AddAdditionalTrigger("prügel");
    -- Codes
    AddTraderTrigger("make","I can saw Logs for you master.");
    AddAdditionalTrigger("do");
    AddTraderTrigger("machen"," Ich kann sah Klotz für Sie um zu meistern. ");
    AddAdditionalTrigger("tun");
    AddAdditionalTrigger("tust");
    AddTraderTrigger("was verkaufe","Ich habe nickts, Ich verkaufe gar nix.");
    AddTraderTrigger("what sell","I have nothing, so I sell nothing.");
    AddCondition("lang","english");
    AddTraderTrigger("was kaufe","Ich habe kein geld, Ich kaufe gar nix.");
    AddTraderTrigger("what buy","I have no money, so I buy nothing.");
    AddCondition("lang","english");
    AddTraderTrigger("auf bald","Bis bald!");
    AddAdditionalTrigger("bis bald");
    AddAdditionalTrigger("tschüss");
    AddTraderTrigger("farewell","Be well!");
    AddAdditionalTrigger("bye");
    AddAdditionalTrigger("good day");
    AddCycleText("#me pickt seine Nase auf","#me picks his nose");
    AddCycleText("#me räumt die Höhle auf","#me cleans up the cave");
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

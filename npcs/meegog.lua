-- INSERT INTO npc VALUES (nextval('npc_seq'),8,156,-448,0,4,false,'Meegog','npc_meegog.lua',0);

require("npcs.base.autonpcfunctions")
module("npcs.meegog")

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

    -- Meegog a Goblin slave
    npcs.base.autonpcfunctions.AddTraderTrigger("greetings","Greetinks! How may poor "..thisNPC.name.." serve my Masters?  I can saw logs for you!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("hello");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greeb+[a]+s");
    npcs.base.autonpcfunctions.AddTraderTrigger("gr[üue]+[sß]+e","Grüße! Wie kann schlechter "..thisNPC.name.." meinen Mastern dienen? Ich kann sah Klotz für Sie!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Guten Tag");
    npcs.base.autonpcfunctions.AddTraderTrigger("Saw Logs","Which type shall I make master?  Apple, Cherry, Conifer or Naldor?");
    npcs.base.autonpcfunctions.AddTraderTrigger("sah Klotz","Welchen Typ werde ich Master machen? Apfel, Kirsch, Tannen oder Naldor?");
    npcs.base.autonpcfunctions.AddTraderTrigger("Apple","#me takes your logs and immediately saws them into boards. ");
    npcs.base.autonpcfunctions.AddCondition("item",2560,"belt",">=",1);
    npcs.base.autonpcfunctions.AddConsequence("item",2716,1,333,0);
    npcs.base.autonpcfunctions.AddConsequence("deleteitem",2560,1);
    npcs.base.autonpcfunctions.AddTraderTrigger("Apfel","#me nimmt Ihren Klotz und sägt sie sofort in Ausschüsse. ");
    npcs.base.autonpcfunctions.AddCondition("item",2560,"belt",">=",1);
    npcs.base.autonpcfunctions.AddConsequence("item",2716,1,333,0);
    npcs.base.autonpcfunctions.AddConsequence("deleteitem",2560,1);
    npcs.base.autonpcfunctions.AddTraderTrigger("Cherry","#me takes your logs and immediately saws them into boards. ");
    npcs.base.autonpcfunctions.AddCondition("item",543,"belt",">=",1);
    npcs.base.autonpcfunctions.AddConsequence("item",545,1,333,0);
    npcs.base.autonpcfunctions.AddConsequence("deleteitem",543,1);
    npcs.base.autonpcfunctions.AddTraderTrigger("Kirsch","#me nimmt Ihren Klotz und sägt sie sofort in Ausschüsse. ");
    npcs.base.autonpcfunctions.AddCondition("item",543,"belt",">=",1);
    npcs.base.autonpcfunctions.AddConsequence("item",545,1,333,0);
    npcs.base.autonpcfunctions.AddConsequence("deleteitem",543,1);
    npcs.base.autonpcfunctions.AddTraderTrigger("Conifer","#me takes your logs and immediately saws them into boards. ");
    npcs.base.autonpcfunctions.AddCondition("item",3,"belt",">=",1);
    npcs.base.autonpcfunctions.AddConsequence("item",2543,1,333,0);
    npcs.base.autonpcfunctions.AddConsequence("deleteitem",3,1);
    npcs.base.autonpcfunctions.AddTraderTrigger("Tannen","#me nimmt Ihren Klotz und sägt sie sofort in Ausschüsse. ");
    npcs.base.autonpcfunctions.AddCondition("item",3,"belt",">=",1);
    npcs.base.autonpcfunctions.AddConsequence("item",2543,1,333,0);
    npcs.base.autonpcfunctions.AddConsequence("deleteitem",3,1);
    npcs.base.autonpcfunctions.AddTraderTrigger("Naldor","#me takes your logs and immediately saws them into boards. ");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Oak");
    npcs.base.autonpcfunctions.AddCondition("item",544,"belt",">=",1);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("item",546,1,333,0);
    npcs.base.autonpcfunctions.AddConsequence("deleteitem",544,1);
    npcs.base.autonpcfunctions.AddTraderTrigger("Naldor","#me nimmt Ihren Klotz und sägt sie sofort in Ausschüsse. ");
    npcs.base.autonpcfunctions.AddCondition("item",544,"belt",">=",1);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddConsequence("item",546,1,333,0);
    npcs.base.autonpcfunctions.AddConsequence("deleteitem",544,1);
    -- RP reactions
    npcs.base.autonpcfunctions.AddTraderTrigger("kick","Ooohhh!  Please don’t hurt poor "..thisNPC.name..", I’ll do as you asks!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("boot");
    npcs.base.autonpcfunctions.AddTraderTrigger("tritt"," Ooohhh! Du nicht bestrafen armen "..thisNPC.name..", ich alles machen was du sagst!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("trete");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("stiefel");
    npcs.base.autonpcfunctions.AddTraderTrigger("beat","#me cringes into a corner, begging for mercy.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("punch");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("hit");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("slap");
    npcs.base.autonpcfunctions.AddTraderTrigger("Erfolg","#me duckt sich an einer Ecke, um die Gnade bittend.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Schlag");
    npcs.base.autonpcfunctions.AddTraderTrigger("whip","#me cringes in a corner and screams for mercy!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("slash");
    npcs.base.autonpcfunctions.AddTraderTrigger("peitsche","#me duckt sich ängstlich und winselt um Gnade!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("schlag");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("hieb");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("prügel");
    -- Codes
    npcs.base.autonpcfunctions.AddTraderTrigger("make","I can saw Logs for you master.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("do");
    npcs.base.autonpcfunctions.AddTraderTrigger("machen"," Ich kann sah Klotz für Sie um zu meistern. ");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("tun");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("tust");
    npcs.base.autonpcfunctions.AddTraderTrigger("was verkaufe","Ich habe nickts, Ich verkaufe gar nix.");
    npcs.base.autonpcfunctions.AddTraderTrigger("what sell","I have nothing, so I sell nothing.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("was kaufe","Ich habe kein geld, Ich kaufe gar nix.");
    npcs.base.autonpcfunctions.AddTraderTrigger("what buy","I have no money, so I buy nothing.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("auf bald","Bis bald!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("bis bald");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("tschüss");
    npcs.base.autonpcfunctions.AddTraderTrigger("farewell","Be well!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("bye");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("good day");
    npcs.base.autonpcfunctions.AddCycleText("#me pickt seine Nase auf","#me picks his nose");
    npcs.base.autonpcfunctions.AddCycleText("#me räumt die Höhle auf","#me cleans up the cave");
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

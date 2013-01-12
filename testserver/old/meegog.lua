-- INSERT INTO npc VALUES (nextval('npc_seq'),8,156,-448,0,4,false,'Meegog','npc_meegog.lua',0);

require("npc.base.autonpcfunctions")
module("npc.meegog", package.seeall)

function useNPC(user)
    thisNPC:increaseSkill(1,"common language",100);
    thisNPC:talkLanguage(Character.say, Player.german, "Finger weg!");
    thisNPC:talkLanguage(Character.say, Player.english, "Don't you touch me!");
end

function initializeNpc()
    if TraderFirst then
        return true;
    end

    npc.base.autonpcfunctions.InitTalkLists();

    -- ********* START DYNAMIC PART ********

    -- Meegog a Goblin slave
    npc.base.autonpcfunctions.AddTraderTrigger("greetings","Greetinks! How may poor "..thisNPC.name.." serve my Masters?  I can saw logs for you!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("hello");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greeb+[a]+s");
    npc.base.autonpcfunctions.AddTraderTrigger("gr[üue]+[sß]+e","Grüße! Wie kann schlechter "..thisNPC.name.." meinen Mastern dienen? Ich kann sah Klotz für Sie!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Guten Tag");
    npc.base.autonpcfunctions.AddTraderTrigger("Saw Logs","Which type shall I make master?  Apple, Cherry, Conifer or Naldor?");
    npc.base.autonpcfunctions.AddTraderTrigger("sah Klotz","Welchen Typ werde ich Master machen? Apfel, Kirsch, Tannen oder Naldor?");
    npc.base.autonpcfunctions.AddTraderTrigger("Apple","#me takes your logs and immediately saws them into boards. ");
    npc.base.autonpcfunctions.AddCondition("item",2560,"belt",">=",1);
    npc.base.autonpcfunctions.AddConsequence("item",2716,1,333,0);
    npc.base.autonpcfunctions.AddConsequence("deleteitem",2560,1);
    npc.base.autonpcfunctions.AddTraderTrigger("Apfel","#me nimmt Ihren Klotz und sägt sie sofort in Ausschüsse. ");
    npc.base.autonpcfunctions.AddCondition("item",2560,"belt",">=",1);
    npc.base.autonpcfunctions.AddConsequence("item",2716,1,333,0);
    npc.base.autonpcfunctions.AddConsequence("deleteitem",2560,1);
    npc.base.autonpcfunctions.AddTraderTrigger("Cherry","#me takes your logs and immediately saws them into boards. ");
    npc.base.autonpcfunctions.AddCondition("item",543,"belt",">=",1);
    npc.base.autonpcfunctions.AddConsequence("item",545,1,333,0);
    npc.base.autonpcfunctions.AddConsequence("deleteitem",543,1);
    npc.base.autonpcfunctions.AddTraderTrigger("Kirsch","#me nimmt Ihren Klotz und sägt sie sofort in Ausschüsse. ");
    npc.base.autonpcfunctions.AddCondition("item",543,"belt",">=",1);
    npc.base.autonpcfunctions.AddConsequence("item",545,1,333,0);
    npc.base.autonpcfunctions.AddConsequence("deleteitem",543,1);
    npc.base.autonpcfunctions.AddTraderTrigger("Conifer","#me takes your logs and immediately saws them into boards. ");
    npc.base.autonpcfunctions.AddCondition("item",3,"belt",">=",1);
    npc.base.autonpcfunctions.AddConsequence("item",2543,1,333,0);
    npc.base.autonpcfunctions.AddConsequence("deleteitem",3,1);
    npc.base.autonpcfunctions.AddTraderTrigger("Tannen","#me nimmt Ihren Klotz und sägt sie sofort in Ausschüsse. ");
    npc.base.autonpcfunctions.AddCondition("item",3,"belt",">=",1);
    npc.base.autonpcfunctions.AddConsequence("item",2543,1,333,0);
    npc.base.autonpcfunctions.AddConsequence("deleteitem",3,1);
    npc.base.autonpcfunctions.AddTraderTrigger("Naldor","#me takes your logs and immediately saws them into boards. ");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Oak");
    npc.base.autonpcfunctions.AddCondition("item",544,"belt",">=",1);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("item",546,1,333,0);
    npc.base.autonpcfunctions.AddConsequence("deleteitem",544,1);
    npc.base.autonpcfunctions.AddTraderTrigger("Naldor","#me nimmt Ihren Klotz und sägt sie sofort in Ausschüsse. ");
    npc.base.autonpcfunctions.AddCondition("item",544,"belt",">=",1);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddConsequence("item",546,1,333,0);
    npc.base.autonpcfunctions.AddConsequence("deleteitem",544,1);
    -- RP reactions
    npc.base.autonpcfunctions.AddTraderTrigger("kick","Ooohhh!  Please don't hurt poor "..thisNPC.name..", I'll do as you asks!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("boot");
    npc.base.autonpcfunctions.AddTraderTrigger("tritt"," Ooohhh! Du nicht bestrafen armen "..thisNPC.name..", ich alles machen was du sagst!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("trete");
    npc.base.autonpcfunctions.AddAdditionalTrigger("stiefel");
    npc.base.autonpcfunctions.AddTraderTrigger("beat","#me cringes into a corner, begging for mercy.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("punch");
    npc.base.autonpcfunctions.AddAdditionalTrigger("hit");
    npc.base.autonpcfunctions.AddAdditionalTrigger("slap");
    npc.base.autonpcfunctions.AddTraderTrigger("Erfolg","#me duckt sich an einer Ecke, um die Gnade bittend.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Schlag");
    npc.base.autonpcfunctions.AddTraderTrigger("whip","#me cringes in a corner and screams for mercy!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("slash");
    npc.base.autonpcfunctions.AddTraderTrigger("peitsche","#me duckt sich ängstlich und winselt um Gnade!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("schlag");
    npc.base.autonpcfunctions.AddAdditionalTrigger("hieb");
    npc.base.autonpcfunctions.AddAdditionalTrigger("prügel");
    -- Codes
    npc.base.autonpcfunctions.AddTraderTrigger("make","I can saw Logs for you master.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("do");
    npc.base.autonpcfunctions.AddTraderTrigger("machen"," Ich kann sah Klotz für Sie um zu meistern. ");
    npc.base.autonpcfunctions.AddAdditionalTrigger("tun");
    npc.base.autonpcfunctions.AddAdditionalTrigger("tust");
    npc.base.autonpcfunctions.AddTraderTrigger("was verkaufe","Ich habe nickts, Ich verkaufe gar nix.");
    npc.base.autonpcfunctions.AddTraderTrigger("what sell","I have nothing, so I sell nothing.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("was kaufe","Ich habe kein geld, Ich kaufe gar nix.");
    npc.base.autonpcfunctions.AddTraderTrigger("what buy","I have no money, so I buy nothing.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("auf bald","Bis bald!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("bis bald");
    npc.base.autonpcfunctions.AddAdditionalTrigger("tschüss");
    npc.base.autonpcfunctions.AddTraderTrigger("farewell","Be well!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("bye");
    npc.base.autonpcfunctions.AddAdditionalTrigger("good day");
    npc.base.autonpcfunctions.AddCycleText("#me pickt seine Nase auf","#me picks his nose");
    npc.base.autonpcfunctions.AddCycleText("#me räumt die Höhle auf","#me cleans up the cave");
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

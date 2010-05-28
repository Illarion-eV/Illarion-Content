-- INSERT INTO npc VALUES (nextval('npc_seq'),2,-66,-100,0,2,false,'Dorothy Applesong','npc_dorothy_applesong.lua',1);

require("npc.base.autonpcfunctions")
module("npc.dorothy_applesong")

function useNPC(user,counter,param)
    thisNPC:increaseSkill(1,"common language",100);
    thisNPC:talkLanguage(CCharacter.say, CPlayer.german, "Finger weg!");
    thisNPC:talkLanguage(CCharacter.say, CPlayer.english, "Dont you touch me!");
end

function initializeNpc()
    if TraderFirst then
        return true;
    end

    npc.base.autonpcfunctions.InitTalkLists();

    -- ********* START DYNAMIC PART ********

    QuestID = 22;
    -- the NPC lost a necklace while near greenbriar she wishes to ask a friend of hers whether the amulet was found...
    -- Before Quest--
    npc.base.autonpcfunctions.AddTraderTrigger("Hello","Hello there, my name's Dorothy *looks sadly at the ground*, could you help me please?");
    npc.base.autonpcfunctions.AddCondition("qpg","=",0);
    npc.base.autonpcfunctions.AddTraderTrigger("Hallo","Hallo auch, mein Name ist Dorothy *sieht traurig zu Boden*, könntest du mir vielleicht helfen?");
    npc.base.autonpcfunctions.AddCondition("qpg","=",0);
    npc.base.autonpcfunctions.AddTraderTrigger("Greetings","Hello there, my name's Dorothy *looks sadly at the ground*, could you help me please?");
    npc.base.autonpcfunctions.AddCondition("qpg","=",0);
    npc.base.autonpcfunctions.AddTraderTrigger("Grüße","Hallo auch, mein Name ist Dorothy *sieht traurig zu Boden*, könntest du mir vielleicht helfen?");
    npc.base.autonpcfunctions.AddCondition("qpg","=",0);
    npc.base.autonpcfunctions.AddTraderTrigger("Help","I lost my locket while I was in Greenbriar, picking strawberries. Could you go ask Barney Haycrop whether he found a locket? You'll find him near the entrance of the town.");
    npc.base.autonpcfunctions.AddCondition("qpg","<>",3);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddTraderTrigger("Hilfe","Ich habe mein Medaillon verloren, als ich in Greenbriar Erdbeeren pflückte. Könntest du wohl Barney Haycrop fragen, ob er es gefunden hat? Du wirst ihn in der Nähe des Eingangs zur Stadt finden.");
    npc.base.autonpcfunctions.AddCondition("qpg","<>",3);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddTraderTrigger("How",", queststatus=1");
    npc.base.autonpcfunctions.AddCondition("qpg","<>",3);
    npc.base.autonpcfunctions.AddTraderTrigger("Wie","Ich habe mein Medaillon verloren, als ich in Greenbriar Erdbeeren pflückte. Könntest du wohl Barney Haycrop fragen, ob er es gefunden hat? Du wirst ihn in der Nähe des Eingangs zur Stadt finden.");
    npc.base.autonpcfunctions.AddCondition("qpg","<>",3);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddTraderTrigger("Wrong",", queststatus=1");
    npc.base.autonpcfunctions.AddCondition("qpg","<>",3);
    npc.base.autonpcfunctions.AddTraderTrigger("Fehlt","Ich habe mein Medaillon verloren, als ich in Greenbriar Erdbeeren pflückte. Könntest du wohl Barney Haycrop fragen, ob er es gefunden hat? Du wirst ihn in der Nähe des Eingangs zur Stadt finden.");
    npc.base.autonpcfunctions.AddCondition("qpg","<>",3);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddTraderTrigger("Was","Ich habe mein Medaillon verloren, als ich in Greenbriar Erdbeeren pflückte. Könntest du wohl Barney Haycrop fragen, ob er es gefunden hat? Du wirst ihn in der Nähe des Eingangs zur Stadt finden.");
    npc.base.autonpcfunctions.AddCondition("qpg","<>",3);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddTraderTrigger("Bye","Umm, goodbye *wipes eyes*");
    npc.base.autonpcfunctions.AddCondition("qpg","<>",3);
    npc.base.autonpcfunctions.AddTraderTrigger("Tschüss","Ahm, auf Wiedersehen *wischt sich die Augen*");
    npc.base.autonpcfunctions.AddCondition("qpg","<>",3);
    -- Already given quest
    npc.base.autonpcfunctions.AddTraderTrigger("Hello","Hello again, did you find my locket yet? *looks hopeful*");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddTraderTrigger("Hallo","Hallo nochmal, hast du mein Medaillon schon gefunden? *schaut hoffnungsvoll*");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddTraderTrigger("Greetings","Hello again, did you find my locket yet? *looks hopeful*");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddTraderTrigger("Grüße","Hallo nochmal, hast du mein Medaillon schon gefunden? *schaut hoffnungsvoll*");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddTraderTrigger("Yes","Thank you kind sir. *gives a broad smile* I'll be ever so grateful!");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddCondition("sex","male");
    npc.base.autonpcfunctions.AddTraderTrigger("Ja","Danke euch, gütiger Herr. *lächelt dich breit an* Ich werde euch ewig dankbar sein!");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddCondition("sex","male");
    npc.base.autonpcfunctions.AddTraderTrigger("Yes","Thank you miss. *gives a broad smile* I'll be ever so grateful");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddCondition("sex","female");
    npc.base.autonpcfunctions.AddTraderTrigger("Ja","Danke euch, gütige Dame. *lächelt dich breit an* Ich werde euch ewig dankbar sein!");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddCondition("sex","female");
    -- Talked to other NPC
    npc.base.autonpcfunctions.AddTraderTrigger("Hello","Please tell me you found my locket... it was a gift from my mother, and very precious to me");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger("Hallo","Bitte sagt mir, wenn ihr das Medaillon gefunden habt... es war ein Geschenk meiner Mutter und ist sehr wertvoll für mich.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger("Greetings","Please tell me you found my locket... it was a gift from my mother, and very precious to me");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger("Grüße","Bitte sagt mir, wenn ihr das Medaillon gefunden habt... es war ein Geschenk meiner Mutter und ist sehr wertvoll für mich.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger("Locket","Oh Thank you! Thank you!, I don't know what I can do to ever repay you... here, have this, I made it myself");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddCondition("item",222,"belt",">",0);
    npc.base.autonpcfunctions.AddConsequence("deleteitem",222,1);
    npc.base.autonpcfunctions.AddConsequence("item",353,1,333,0);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",3);
    npc.base.autonpcfunctions.AddTraderTrigger("Medaillon","Oh, ich danke euch! Danke! Ich weiß nicht, wie ich euch das vergelten könnte... hier, nehmt dies, ich habe es selbst gemacht.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddCondition("item",222,"belt",">",0);
    npc.base.autonpcfunctions.AddConsequence("deleteitem",222,1);
    npc.base.autonpcfunctions.AddConsequence("item",353,1,333,0);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",3);
    npc.base.autonpcfunctions.AddTraderTrigger("Here","Oh Thank you! Thank you!, I don't know what I can do to ever repay you... here, have this, I made it myself");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddCondition("item",222,"belt",">",0);
    npc.base.autonpcfunctions.AddConsequence("deleteitem",222,1);
    npc.base.autonpcfunctions.AddConsequence("item",353,1,333,0);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",3);
    npc.base.autonpcfunctions.AddTraderTrigger("Hier","Oh, ich danke euch! Danke! Ich weiß nicht, wie ich euch das vergelten könnte... hier, nehmt dies, ich habe es selbst gemacht.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddCondition("item",222,"belt",">",0);
    npc.base.autonpcfunctions.AddConsequence("deleteitem",222,1);
    npc.base.autonpcfunctions.AddConsequence("item",353,1,333,0);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",3);
    npc.base.autonpcfunctions.AddTraderTrigger("Have","Oh Thank you! Thank you!, I don't know what I can do to ever repay you... here, have this, I made it myself");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddCondition("item",222,"belt",">",0);
    npc.base.autonpcfunctions.AddConsequence("deleteitem",222,1);
    npc.base.autonpcfunctions.AddConsequence("item",353,1,333,0);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",3);
    npc.base.autonpcfunctions.AddTraderTrigger("Habe","Oh, ich danke euch! Danke! Ich weiß nicht, wie ich euch das vergelten könnte... hier, nehmt dies, ich habe es selbst gemacht.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddCondition("item",222,"belt",">",0);
    npc.base.autonpcfunctions.AddConsequence("deleteitem",222,1);
    npc.base.autonpcfunctions.AddConsequence("item",353,1,333,0);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",3);
    npc.base.autonpcfunctions.AddTraderTrigger("Locket","You have my locket? Where is it? *smiles hopefully*");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger("Medaillon","Ihr habt mein Medaillon? Wo ist es? *lächelt hoffnungsvoll*");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger("Here","You have my locket? Where is it? *smiles hopefully*");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger("Hier","Ihr habt mein Medaillon? Wo ist es? *lächelt hoffnungsvoll*");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger("Have","You have my locket? Where is it? *smiles hopefully*");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger("Habe","Ihr habt mein Medaillon? Wo ist es? *lächelt hoffnungsvoll*");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    -- Quest Is done
    npc.base.autonpcfunctions.AddTraderTrigger("Hello","Hello, and thanks for all you did for me. Hope you enjoyed the pie *smiles*");
    npc.base.autonpcfunctions.AddCondition("qpg","=",3);
    npc.base.autonpcfunctions.AddTraderTrigger("Hallo","Hallo und danke nochmal für alles, dass ihr für mich getan habt. Ich hoffe, der Kuchen schmeckte euch. *lächelt*");
    npc.base.autonpcfunctions.AddCondition("qpg","=",3);
    npc.base.autonpcfunctions.AddTraderTrigger("Greetings","Hello, and thanks for all you did for me. Hope you enjoyed the pie *smiles*");
    npc.base.autonpcfunctions.AddCondition("qpg","=",3);
    npc.base.autonpcfunctions.AddTraderTrigger("Grüße","Hallo und danke nochmal für alles, dass ihr für mich getan habt. Ich hoffe, der Kuchen schmeckte euch. *lächelt*");
    npc.base.autonpcfunctions.AddCondition("qpg","=",3);
    npc.base.autonpcfunctions.AddTraderTrigger("Bye","Goodbye *smiles broadly*");
    npc.base.autonpcfunctions.AddCondition("qpg","=",3);
    npc.base.autonpcfunctions.AddTraderTrigger("Tschüss","Auf Wiedersehen *lächelt breit*");
    npc.base.autonpcfunctions.AddCondition("qpg","=",3);
    -- Generic NPC Stuff
    npc.base.autonpcfunctions.AddTraderTrigger("Sell","#me sobs quietly to herself");
    npc.base.autonpcfunctions.AddCondition("qpg","<>",3);
    npc.base.autonpcfunctions.AddTraderTrigger("Verkaufe","#me schluchzt leise vor sich hin");
    npc.base.autonpcfunctions.AddCondition("qpg","<>",3);
    npc.base.autonpcfunctions.AddTraderTrigger("Buy","#me sobs quietly to herself");
    npc.base.autonpcfunctions.AddCondition("qpg","<>",3);
    npc.base.autonpcfunctions.AddTraderTrigger("Kaufe","#me schluchzt leise vor sich hin");
    npc.base.autonpcfunctions.AddCondition("qpg","<>",3);
    npc.base.autonpcfunctions.AddTraderTrigger("Wares","#me sobs quietly to herself");
    npc.base.autonpcfunctions.AddCondition("qpg","<>",3);
    npc.base.autonpcfunctions.AddTraderTrigger("Waren","#me schluchzt leise vor sich hin");
    npc.base.autonpcfunctions.AddCondition("qpg","<>",3);
    npc.base.autonpcfunctions.AddTraderTrigger("Sell","Hehe, you seem to have liked that pie... I'm sorry but I don't make enough to sell");
    npc.base.autonpcfunctions.AddCondition("qpg","=",3);
    npc.base.autonpcfunctions.AddTraderTrigger("Verkaufe","Hehe, der Kuchen scheint euch geschmeckt zu haben..., es tut mir leid aber ich mache nicht genug, um ihn zu verkaufen.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",3);
    npc.base.autonpcfunctions.AddTraderTrigger("Buy","I don't buy anything, I'm quite content now *looks proudly at her locket*");
    npc.base.autonpcfunctions.AddCondition("qpg","=",3);
    npc.base.autonpcfunctions.AddTraderTrigger("Kaufe","Ich kaufe nichts, ich bin nun sehr zufrieden mit der Welt *sieht stolz auf ihr Medaillon*");
    npc.base.autonpcfunctions.AddCondition("qpg","=",3);
    npc.base.autonpcfunctions.AddTraderTrigger("Wares","Sorry, I'm no vendor");
    npc.base.autonpcfunctions.AddCondition("qpg","=",3);
    npc.base.autonpcfunctions.AddTraderTrigger("Waren","Tut mir Leid, ich bin kein Händler.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",3);
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
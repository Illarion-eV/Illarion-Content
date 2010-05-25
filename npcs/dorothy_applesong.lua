-- INSERT INTO npc VALUES (nextval('npc_seq'),2,-66,-100,0,2,false,'Dorothy Applesong','npc_dorothy_applesong.lua',1);

require("npcs.base.autonpcfunctions")
-- require("npcs.base.autonpcfunctions")

function useNPC(user,counter,param)
    thisNPC:increaseSkill(1,"common language",100);
    thisNPC:talkLanguage(CCharacter.say, CPlayer.german, "Finger weg!");
    thisNPC:talkLanguage(CCharacter.say, CPlayer.english, "Dont you touch me!");
end

function initializeNpc()
    if TraderFirst then
        return true;
    end

    InitTalkLists();

    -- ********* START DYNAMIC PART ********

    QuestID = 22;
    -- the NPC lost a necklace while near greenbriar she wishes to ask a friend of hers whether the amulet was found...
    -- Before Quest--
    AddTraderTrigger("Hello","Hello there, my name's Dorothy *looks sadly at the ground*, could you help me please?");
    AddCondition("qpg","=",0);
    AddTraderTrigger("Hallo","Hallo auch, mein Name ist Dorothy *sieht traurig zu Boden*, könntest du mir vielleicht helfen?");
    AddCondition("qpg","=",0);
    AddTraderTrigger("Greetings","Hello there, my name's Dorothy *looks sadly at the ground*, could you help me please?");
    AddCondition("qpg","=",0);
    AddTraderTrigger("Grüße","Hallo auch, mein Name ist Dorothy *sieht traurig zu Boden*, könntest du mir vielleicht helfen?");
    AddCondition("qpg","=",0);
    AddTraderTrigger("Help","I lost my locket while I was in Greenbriar, picking strawberries. Could you go ask Barney Haycrop whether he found a locket? You'll find him near the entrance of the town.");
    AddCondition("qpg","<>",3);
    AddConsequence("qpg","=",1);
    AddTraderTrigger("Hilfe","Ich habe mein Medaillon verloren, als ich in Greenbriar Erdbeeren pflückte. Könntest du wohl Barney Haycrop fragen, ob er es gefunden hat? Du wirst ihn in der Nähe des Eingangs zur Stadt finden.");
    AddCondition("qpg","<>",3);
    AddConsequence("qpg","=",1);
    AddTraderTrigger("How",", queststatus=1");
    AddCondition("qpg","<>",3);
    AddTraderTrigger("Wie","Ich habe mein Medaillon verloren, als ich in Greenbriar Erdbeeren pflückte. Könntest du wohl Barney Haycrop fragen, ob er es gefunden hat? Du wirst ihn in der Nähe des Eingangs zur Stadt finden.");
    AddCondition("qpg","<>",3);
    AddConsequence("qpg","=",1);
    AddTraderTrigger("Wrong",", queststatus=1");
    AddCondition("qpg","<>",3);
    AddTraderTrigger("Fehlt","Ich habe mein Medaillon verloren, als ich in Greenbriar Erdbeeren pflückte. Könntest du wohl Barney Haycrop fragen, ob er es gefunden hat? Du wirst ihn in der Nähe des Eingangs zur Stadt finden.");
    AddCondition("qpg","<>",3);
    AddConsequence("qpg","=",1);
    AddTraderTrigger("Was","Ich habe mein Medaillon verloren, als ich in Greenbriar Erdbeeren pflückte. Könntest du wohl Barney Haycrop fragen, ob er es gefunden hat? Du wirst ihn in der Nähe des Eingangs zur Stadt finden.");
    AddCondition("qpg","<>",3);
    AddConsequence("qpg","=",1);
    AddTraderTrigger("Bye","Umm, goodbye *wipes eyes*");
    AddCondition("qpg","<>",3);
    AddTraderTrigger("Tschüss","Ahm, auf Wiedersehen *wischt sich die Augen*");
    AddCondition("qpg","<>",3);
    -- Already given quest
    AddTraderTrigger("Hello","Hello again, did you find my locket yet? *looks hopeful*");
    AddCondition("qpg","=",1);
    AddTraderTrigger("Hallo","Hallo nochmal, hast du mein Medaillon schon gefunden? *schaut hoffnungsvoll*");
    AddCondition("qpg","=",1);
    AddTraderTrigger("Greetings","Hello again, did you find my locket yet? *looks hopeful*");
    AddCondition("qpg","=",1);
    AddTraderTrigger("Grüße","Hallo nochmal, hast du mein Medaillon schon gefunden? *schaut hoffnungsvoll*");
    AddCondition("qpg","=",1);
    AddTraderTrigger("Yes","Thank you kind sir. *gives a broad smile* I'll be ever so grateful!");
    AddCondition("qpg","=",1);
    AddCondition("sex","male");
    AddTraderTrigger("Ja","Danke euch, gütiger Herr. *lächelt dich breit an* Ich werde euch ewig dankbar sein!");
    AddCondition("qpg","=",1);
    AddCondition("sex","male");
    AddTraderTrigger("Yes","Thank you miss. *gives a broad smile* I'll be ever so grateful");
    AddCondition("qpg","=",1);
    AddCondition("sex","female");
    AddTraderTrigger("Ja","Danke euch, gütige Dame. *lächelt dich breit an* Ich werde euch ewig dankbar sein!");
    AddCondition("qpg","=",1);
    AddCondition("sex","female");
    -- Talked to other NPC
    AddTraderTrigger("Hello","Please tell me you found my locket... it was a gift from my mother, and very precious to me");
    AddCondition("qpg","=",2);
    AddTraderTrigger("Hallo","Bitte sagt mir, wenn ihr das Medaillon gefunden habt... es war ein Geschenk meiner Mutter und ist sehr wertvoll für mich.");
    AddCondition("qpg","=",2);
    AddTraderTrigger("Greetings","Please tell me you found my locket... it was a gift from my mother, and very precious to me");
    AddCondition("qpg","=",2);
    AddTraderTrigger("Grüße","Bitte sagt mir, wenn ihr das Medaillon gefunden habt... es war ein Geschenk meiner Mutter und ist sehr wertvoll für mich.");
    AddCondition("qpg","=",2);
    AddTraderTrigger("Locket","Oh Thank you! Thank you!, I don't know what I can do to ever repay you... here, have this, I made it myself");
    AddCondition("qpg","=",2);
    AddCondition("item",222,"belt",">",0);
    AddConsequence("deleteitem",222,1);
    AddConsequence("item",353,1,333,0);
    AddConsequence("qpg","=",3);
    AddTraderTrigger("Medaillon","Oh, ich danke euch! Danke! Ich weiß nicht, wie ich euch das vergelten könnte... hier, nehmt dies, ich habe es selbst gemacht.");
    AddCondition("qpg","=",2);
    AddCondition("item",222,"belt",">",0);
    AddConsequence("deleteitem",222,1);
    AddConsequence("item",353,1,333,0);
    AddConsequence("qpg","=",3);
    AddTraderTrigger("Here","Oh Thank you! Thank you!, I don't know what I can do to ever repay you... here, have this, I made it myself");
    AddCondition("qpg","=",2);
    AddCondition("item",222,"belt",">",0);
    AddConsequence("deleteitem",222,1);
    AddConsequence("item",353,1,333,0);
    AddConsequence("qpg","=",3);
    AddTraderTrigger("Hier","Oh, ich danke euch! Danke! Ich weiß nicht, wie ich euch das vergelten könnte... hier, nehmt dies, ich habe es selbst gemacht.");
    AddCondition("qpg","=",2);
    AddCondition("item",222,"belt",">",0);
    AddConsequence("deleteitem",222,1);
    AddConsequence("item",353,1,333,0);
    AddConsequence("qpg","=",3);
    AddTraderTrigger("Have","Oh Thank you! Thank you!, I don't know what I can do to ever repay you... here, have this, I made it myself");
    AddCondition("qpg","=",2);
    AddCondition("item",222,"belt",">",0);
    AddConsequence("deleteitem",222,1);
    AddConsequence("item",353,1,333,0);
    AddConsequence("qpg","=",3);
    AddTraderTrigger("Habe","Oh, ich danke euch! Danke! Ich weiß nicht, wie ich euch das vergelten könnte... hier, nehmt dies, ich habe es selbst gemacht.");
    AddCondition("qpg","=",2);
    AddCondition("item",222,"belt",">",0);
    AddConsequence("deleteitem",222,1);
    AddConsequence("item",353,1,333,0);
    AddConsequence("qpg","=",3);
    AddTraderTrigger("Locket","You have my locket? Where is it? *smiles hopefully*");
    AddCondition("qpg","=",2);
    AddTraderTrigger("Medaillon","Ihr habt mein Medaillon? Wo ist es? *lächelt hoffnungsvoll*");
    AddCondition("qpg","=",2);
    AddTraderTrigger("Here","You have my locket? Where is it? *smiles hopefully*");
    AddCondition("qpg","=",2);
    AddTraderTrigger("Hier","Ihr habt mein Medaillon? Wo ist es? *lächelt hoffnungsvoll*");
    AddCondition("qpg","=",2);
    AddTraderTrigger("Have","You have my locket? Where is it? *smiles hopefully*");
    AddCondition("qpg","=",2);
    AddTraderTrigger("Habe","Ihr habt mein Medaillon? Wo ist es? *lächelt hoffnungsvoll*");
    AddCondition("qpg","=",2);
    -- Quest Is done
    AddTraderTrigger("Hello","Hello, and thanks for all you did for me. Hope you enjoyed the pie *smiles*");
    AddCondition("qpg","=",3);
    AddTraderTrigger("Hallo","Hallo und danke nochmal für alles, dass ihr für mich getan habt. Ich hoffe, der Kuchen schmeckte euch. *lächelt*");
    AddCondition("qpg","=",3);
    AddTraderTrigger("Greetings","Hello, and thanks for all you did for me. Hope you enjoyed the pie *smiles*");
    AddCondition("qpg","=",3);
    AddTraderTrigger("Grüße","Hallo und danke nochmal für alles, dass ihr für mich getan habt. Ich hoffe, der Kuchen schmeckte euch. *lächelt*");
    AddCondition("qpg","=",3);
    AddTraderTrigger("Bye","Goodbye *smiles broadly*");
    AddCondition("qpg","=",3);
    AddTraderTrigger("Tschüss","Auf Wiedersehen *lächelt breit*");
    AddCondition("qpg","=",3);
    -- Generic NPC Stuff
    AddTraderTrigger("Sell","#me sobs quietly to herself");
    AddCondition("qpg","<>",3);
    AddTraderTrigger("Verkaufe","#me schluchzt leise vor sich hin");
    AddCondition("qpg","<>",3);
    AddTraderTrigger("Buy","#me sobs quietly to herself");
    AddCondition("qpg","<>",3);
    AddTraderTrigger("Kaufe","#me schluchzt leise vor sich hin");
    AddCondition("qpg","<>",3);
    AddTraderTrigger("Wares","#me sobs quietly to herself");
    AddCondition("qpg","<>",3);
    AddTraderTrigger("Waren","#me schluchzt leise vor sich hin");
    AddCondition("qpg","<>",3);
    AddTraderTrigger("Sell","Hehe, you seem to have liked that pie... I'm sorry but I don't make enough to sell");
    AddCondition("qpg","=",3);
    AddTraderTrigger("Verkaufe","Hehe, der Kuchen scheint euch geschmeckt zu haben..., es tut mir leid aber ich mache nicht genug, um ihn zu verkaufen.");
    AddCondition("qpg","=",3);
    AddTraderTrigger("Buy","I don't buy anything, I'm quite content now *looks proudly at her locket*");
    AddCondition("qpg","=",3);
    AddTraderTrigger("Kaufe","Ich kaufe nichts, ich bin nun sehr zufrieden mit der Welt *sieht stolz auf ihr Medaillon*");
    AddCondition("qpg","=",3);
    AddTraderTrigger("Wares","Sorry, I'm no vendor");
    AddCondition("qpg","=",3);
    AddTraderTrigger("Waren","Tut mir Leid, ich bin kein Händler.");
    AddCondition("qpg","=",3);
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
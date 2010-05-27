-- INSERT INTO npc VALUES (nextval('npc_seq'),2,-66,-100,0,2,false,'Dorothy Applesong','npc_dorothy_applesong.lua',1);

require("npcs.base.autonpcfunctions")
module("npcs.dorothy_applesong")

function useNPC(user,counter,param)
    thisNPC:increaseSkill(1,"common language",100);
    thisNPC:talkLanguage(CCharacter.say, CPlayer.german, "Finger weg!");
    thisNPC:talkLanguage(CCharacter.say, CPlayer.english, "Dont you touch me!");
end

function initializeNpc()
    if TraderFirst then
        return true;
    end

    npcs.base.autonpcfunctions.InitTalkLists();

    -- ********* START DYNAMIC PART ********

    QuestID = 22;
    -- the NPC lost a necklace while near greenbriar she wishes to ask a friend of hers whether the amulet was found...
    -- Before Quest--
    npcs.base.autonpcfunctions.AddTraderTrigger("Hello","Hello there, my name's Dorothy *looks sadly at the ground*, could you help me please?");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",0);
    npcs.base.autonpcfunctions.AddTraderTrigger("Hallo","Hallo auch, mein Name ist Dorothy *sieht traurig zu Boden*, könntest du mir vielleicht helfen?");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",0);
    npcs.base.autonpcfunctions.AddTraderTrigger("Greetings","Hello there, my name's Dorothy *looks sadly at the ground*, could you help me please?");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",0);
    npcs.base.autonpcfunctions.AddTraderTrigger("Grüße","Hallo auch, mein Name ist Dorothy *sieht traurig zu Boden*, könntest du mir vielleicht helfen?");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",0);
    npcs.base.autonpcfunctions.AddTraderTrigger("Help","I lost my locket while I was in Greenbriar, picking strawberries. Could you go ask Barney Haycrop whether he found a locket? You'll find him near the entrance of the town.");
    npcs.base.autonpcfunctions.AddCondition("qpg","<>",3);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("Hilfe","Ich habe mein Medaillon verloren, als ich in Greenbriar Erdbeeren pflückte. Könntest du wohl Barney Haycrop fragen, ob er es gefunden hat? Du wirst ihn in der Nähe des Eingangs zur Stadt finden.");
    npcs.base.autonpcfunctions.AddCondition("qpg","<>",3);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("How",", queststatus=1");
    npcs.base.autonpcfunctions.AddCondition("qpg","<>",3);
    npcs.base.autonpcfunctions.AddTraderTrigger("Wie","Ich habe mein Medaillon verloren, als ich in Greenbriar Erdbeeren pflückte. Könntest du wohl Barney Haycrop fragen, ob er es gefunden hat? Du wirst ihn in der Nähe des Eingangs zur Stadt finden.");
    npcs.base.autonpcfunctions.AddCondition("qpg","<>",3);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("Wrong",", queststatus=1");
    npcs.base.autonpcfunctions.AddCondition("qpg","<>",3);
    npcs.base.autonpcfunctions.AddTraderTrigger("Fehlt","Ich habe mein Medaillon verloren, als ich in Greenbriar Erdbeeren pflückte. Könntest du wohl Barney Haycrop fragen, ob er es gefunden hat? Du wirst ihn in der Nähe des Eingangs zur Stadt finden.");
    npcs.base.autonpcfunctions.AddCondition("qpg","<>",3);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("Was","Ich habe mein Medaillon verloren, als ich in Greenbriar Erdbeeren pflückte. Könntest du wohl Barney Haycrop fragen, ob er es gefunden hat? Du wirst ihn in der Nähe des Eingangs zur Stadt finden.");
    npcs.base.autonpcfunctions.AddCondition("qpg","<>",3);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("Bye","Umm, goodbye *wipes eyes*");
    npcs.base.autonpcfunctions.AddCondition("qpg","<>",3);
    npcs.base.autonpcfunctions.AddTraderTrigger("Tschüss","Ahm, auf Wiedersehen *wischt sich die Augen*");
    npcs.base.autonpcfunctions.AddCondition("qpg","<>",3);
    -- Already given quest
    npcs.base.autonpcfunctions.AddTraderTrigger("Hello","Hello again, did you find my locket yet? *looks hopeful*");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("Hallo","Hallo nochmal, hast du mein Medaillon schon gefunden? *schaut hoffnungsvoll*");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("Greetings","Hello again, did you find my locket yet? *looks hopeful*");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("Grüße","Hallo nochmal, hast du mein Medaillon schon gefunden? *schaut hoffnungsvoll*");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("Yes","Thank you kind sir. *gives a broad smile* I'll be ever so grateful!");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddCondition("sex","male");
    npcs.base.autonpcfunctions.AddTraderTrigger("Ja","Danke euch, gütiger Herr. *lächelt dich breit an* Ich werde euch ewig dankbar sein!");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddCondition("sex","male");
    npcs.base.autonpcfunctions.AddTraderTrigger("Yes","Thank you miss. *gives a broad smile* I'll be ever so grateful");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddCondition("sex","female");
    npcs.base.autonpcfunctions.AddTraderTrigger("Ja","Danke euch, gütige Dame. *lächelt dich breit an* Ich werde euch ewig dankbar sein!");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddCondition("sex","female");
    -- Talked to other NPC
    npcs.base.autonpcfunctions.AddTraderTrigger("Hello","Please tell me you found my locket... it was a gift from my mother, and very precious to me");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("Hallo","Bitte sagt mir, wenn ihr das Medaillon gefunden habt... es war ein Geschenk meiner Mutter und ist sehr wertvoll für mich.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("Greetings","Please tell me you found my locket... it was a gift from my mother, and very precious to me");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("Grüße","Bitte sagt mir, wenn ihr das Medaillon gefunden habt... es war ein Geschenk meiner Mutter und ist sehr wertvoll für mich.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("Locket","Oh Thank you! Thank you!, I don't know what I can do to ever repay you... here, have this, I made it myself");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("item",222,"belt",">",0);
    npcs.base.autonpcfunctions.AddConsequence("deleteitem",222,1);
    npcs.base.autonpcfunctions.AddConsequence("item",353,1,333,0);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",3);
    npcs.base.autonpcfunctions.AddTraderTrigger("Medaillon","Oh, ich danke euch! Danke! Ich weiß nicht, wie ich euch das vergelten könnte... hier, nehmt dies, ich habe es selbst gemacht.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("item",222,"belt",">",0);
    npcs.base.autonpcfunctions.AddConsequence("deleteitem",222,1);
    npcs.base.autonpcfunctions.AddConsequence("item",353,1,333,0);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",3);
    npcs.base.autonpcfunctions.AddTraderTrigger("Here","Oh Thank you! Thank you!, I don't know what I can do to ever repay you... here, have this, I made it myself");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("item",222,"belt",">",0);
    npcs.base.autonpcfunctions.AddConsequence("deleteitem",222,1);
    npcs.base.autonpcfunctions.AddConsequence("item",353,1,333,0);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",3);
    npcs.base.autonpcfunctions.AddTraderTrigger("Hier","Oh, ich danke euch! Danke! Ich weiß nicht, wie ich euch das vergelten könnte... hier, nehmt dies, ich habe es selbst gemacht.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("item",222,"belt",">",0);
    npcs.base.autonpcfunctions.AddConsequence("deleteitem",222,1);
    npcs.base.autonpcfunctions.AddConsequence("item",353,1,333,0);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",3);
    npcs.base.autonpcfunctions.AddTraderTrigger("Have","Oh Thank you! Thank you!, I don't know what I can do to ever repay you... here, have this, I made it myself");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("item",222,"belt",">",0);
    npcs.base.autonpcfunctions.AddConsequence("deleteitem",222,1);
    npcs.base.autonpcfunctions.AddConsequence("item",353,1,333,0);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",3);
    npcs.base.autonpcfunctions.AddTraderTrigger("Habe","Oh, ich danke euch! Danke! Ich weiß nicht, wie ich euch das vergelten könnte... hier, nehmt dies, ich habe es selbst gemacht.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("item",222,"belt",">",0);
    npcs.base.autonpcfunctions.AddConsequence("deleteitem",222,1);
    npcs.base.autonpcfunctions.AddConsequence("item",353,1,333,0);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",3);
    npcs.base.autonpcfunctions.AddTraderTrigger("Locket","You have my locket? Where is it? *smiles hopefully*");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("Medaillon","Ihr habt mein Medaillon? Wo ist es? *lächelt hoffnungsvoll*");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("Here","You have my locket? Where is it? *smiles hopefully*");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("Hier","Ihr habt mein Medaillon? Wo ist es? *lächelt hoffnungsvoll*");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("Have","You have my locket? Where is it? *smiles hopefully*");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("Habe","Ihr habt mein Medaillon? Wo ist es? *lächelt hoffnungsvoll*");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    -- Quest Is done
    npcs.base.autonpcfunctions.AddTraderTrigger("Hello","Hello, and thanks for all you did for me. Hope you enjoyed the pie *smiles*");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",3);
    npcs.base.autonpcfunctions.AddTraderTrigger("Hallo","Hallo und danke nochmal für alles, dass ihr für mich getan habt. Ich hoffe, der Kuchen schmeckte euch. *lächelt*");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",3);
    npcs.base.autonpcfunctions.AddTraderTrigger("Greetings","Hello, and thanks for all you did for me. Hope you enjoyed the pie *smiles*");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",3);
    npcs.base.autonpcfunctions.AddTraderTrigger("Grüße","Hallo und danke nochmal für alles, dass ihr für mich getan habt. Ich hoffe, der Kuchen schmeckte euch. *lächelt*");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",3);
    npcs.base.autonpcfunctions.AddTraderTrigger("Bye","Goodbye *smiles broadly*");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",3);
    npcs.base.autonpcfunctions.AddTraderTrigger("Tschüss","Auf Wiedersehen *lächelt breit*");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",3);
    -- Generic NPC Stuff
    npcs.base.autonpcfunctions.AddTraderTrigger("Sell","#me sobs quietly to herself");
    npcs.base.autonpcfunctions.AddCondition("qpg","<>",3);
    npcs.base.autonpcfunctions.AddTraderTrigger("Verkaufe","#me schluchzt leise vor sich hin");
    npcs.base.autonpcfunctions.AddCondition("qpg","<>",3);
    npcs.base.autonpcfunctions.AddTraderTrigger("Buy","#me sobs quietly to herself");
    npcs.base.autonpcfunctions.AddCondition("qpg","<>",3);
    npcs.base.autonpcfunctions.AddTraderTrigger("Kaufe","#me schluchzt leise vor sich hin");
    npcs.base.autonpcfunctions.AddCondition("qpg","<>",3);
    npcs.base.autonpcfunctions.AddTraderTrigger("Wares","#me sobs quietly to herself");
    npcs.base.autonpcfunctions.AddCondition("qpg","<>",3);
    npcs.base.autonpcfunctions.AddTraderTrigger("Waren","#me schluchzt leise vor sich hin");
    npcs.base.autonpcfunctions.AddCondition("qpg","<>",3);
    npcs.base.autonpcfunctions.AddTraderTrigger("Sell","Hehe, you seem to have liked that pie... I'm sorry but I don't make enough to sell");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",3);
    npcs.base.autonpcfunctions.AddTraderTrigger("Verkaufe","Hehe, der Kuchen scheint euch geschmeckt zu haben..., es tut mir leid aber ich mache nicht genug, um ihn zu verkaufen.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",3);
    npcs.base.autonpcfunctions.AddTraderTrigger("Buy","I don't buy anything, I'm quite content now *looks proudly at her locket*");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",3);
    npcs.base.autonpcfunctions.AddTraderTrigger("Kaufe","Ich kaufe nichts, ich bin nun sehr zufrieden mit der Welt *sieht stolz auf ihr Medaillon*");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",3);
    npcs.base.autonpcfunctions.AddTraderTrigger("Wares","Sorry, I'm no vendor");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",3);
    npcs.base.autonpcfunctions.AddTraderTrigger("Waren","Tut mir Leid, ich bin kein Händler.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",3);
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
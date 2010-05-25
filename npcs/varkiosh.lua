-- In work! by avalyon
-- Varkiosh the Forsaken.

-- INSERT INTO npc VALUES (nextval('npc_seq'),Demon,-6,-6,0,2,false,'Varkiosh the Forsaken','npc_varkiosh_the_forsaken.lua',2);

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

    QuestID = 1001;
    AddTraderTrigger("[Hh]ello","Ahh, fresh meat.. Know, motal, that you are now in the presence of great Varkiosh, the Forsaken. I should destroy you for your tressapassing, but since you are here, we should make it proffitable for us both. Accept to offer me some of your blood to nourish my rotten flesh and I shall tell you a great story.");
    AddAdditionalTrigger("[Gg]reetings");
    AddAdditionalTrigger("[Hh]i");
    AddConsequence("qpg","=",1);
    AddTraderTrigger("[Aa]lright","#me suddenly hits the %CHARRACE with his sharp boney claws, licking them of blood afterwards 'Yeees, your blood rejuvenates me.. Thank you mortal, are you ready for my part of the deal?'");
    AddAdditionalTrigger("[Oo]k");
    AddAdditionalTrigger("[Yy]es");
    AddAdditionalTrigger("[Aa]greed");
    AddAdditionalTrigger("[Aa]gree");
    AddAdditionalTrigger("[Bb]lood");
    AddCondition("qpg","=",1);
    -- AddConsequence("attrib",attrib(hitpoints)-3000); -- attrib(int) does not exist
    AddConsequence("qpg","=",2);
    AddTraderTrigger("[Yy]es","There was once a great mage, a mage so great that all of his enemies shivered in fear only at the sound of his unholy name. Everyone feared him, everyone hated him, all wanted to see him defeated, but no power, nor man, nor creature, could face him in battle and survive. Can you comprehand this concept, mortal?");
    AddAdditionalTrigger("[Oo]k");
    AddAdditionalTrigger("[Aa]lright");
    AddCondition("qpg","=",2);
    AddConsequence("qpg","=",3);
    AddTraderTrigger("[Yy]es","Find, mortal, that this great mage, loyal servant of the dark gods, was tricked and ambushed by no less than 50 mages. The battle lasted more than 7 days, at the end, the mage stepping on the burning ashes of his carbonised enemies. Shall I continue?");
    AddAdditionalTrigger("[Ii]ndeed");
    AddCondition("qpg","=",3);
    AddConsequence("qpg","=",4);
    AddTraderTrigger("[Nn]o","Then get out of my sight!");
    AddCondition("qpg","=",4);
    AddTraderTrigger("[Yy]es","The mage destroyed all of his enemies, but he himself, received a serious, magic wound, that he could not manage to heal. Gattering his left strenght, he warped himself to the temple of his worshipped gods, praying to them for healing. But no.. the gods considered him unworthy for allowing himself to receive the hit and insted of healing, he received a gruesome curse... Do you know who that mage was, mostal?");
    AddAdditionalTrigger("[Pp]lease");
    AddCondition("qpg","=",4);
    AddConsequence("qpg","=",5);
    AddTraderTrigger("[Yy]ou","Indeed mortal, my soul has been cursed to inhabit this decaying body for all eternity, being binded to guard this infernal temple, where, a long time ago, I have kneeled to the gods asking them for healing. I will never leave this place, mortal, for that my curse if given by the gods and it is eternal. Do a few tasks for me, frail one, and you shall have my gratitude. Do you accept?");
    AddCondition("qpg","=",5);
    AddConsequence("qpg","=",6);
    AddTraderTrigger("[Nn]o","Then get out of my sight!");
    AddCondition("qpg","=",6);
    AddTraderTrigger("[Yy]es","Very well, mortal one, then this it shall be. I may be a lich now, but I am still a powerful mage.. they robbed me of my life, but my powers they did not take, and my supply of mana potions has long expired. Bring me 20 bottles and we shall discuss further");
    AddAdditionalTrigger("[Aa]lright");
    AddAdditionalTrigger("[Oo]k");
    AddAdditionalTrigger("[Aa]gree");
    AddCondition("qpg","=",6);
    AddConsequence("qpg","=",7);
    AddTraderTrigger("[Hh]ello","Do you have what I required of you? If not, you should better not waste my time anymore..");
    AddAdditionalTrigger("[Gg]reetings");
    AddAdditionalTrigger("[Hh]i");
    AddCondition("qpg","=",7);
    AddConsequence("qpg","=",8);
    AddTraderTrigger("[Nn]o","Why are you wasting my time then? I am eternally busy");
    AddCondition("qpg","=",8);
    AddConsequence("qpg","=",7);
    AddTraderTrigger("[Yy]es","Idiotic piece of flesh, bring them first!");
    AddCondition("qpg","=",8);
    AddCondition("item",165,"belt","<",20);
    AddConsequence("qpg","=",7);
    AddTraderTrigger("[Yy]es","Ah, excellent my dark friend, excellent indeed. Let us continue, shall we? I require to use the dark energies for a ritual, but I have no items to draw them from. Be so kind and bring me arround 100 entrails and we shall see what will follow.");
    AddCondition("qpg","=",8);
    AddCondition("item",165,"belt",">",19);
    AddConsequence("deleteitem",165,20);
    AddConsequence("qpg","=",9);
    AddTraderTrigger("[Hh]ello","Do you have what I required of you? If not, you should better not waste my time anymore..");
    AddAdditionalTrigger("[Gg]reetings");
    AddAdditionalTrigger("[Hh]i");
    AddCondition("qpg","=",9);
    AddConsequence("qpg","=",10);
    AddTraderTrigger("[Nn]o","Why are you wasting my time then? I am eternally busy");
    AddCondition("qpg","=",10);
    AddConsequence("qpg","=",9);
    AddTraderTrigger("[Yy]es","Idiotic piece of flesh, bring them first!");
    AddCondition("qpg","=",10);
    AddCondition("item",63,"belt","<",100);
    AddConsequence("qpg","=",9);
    AddTraderTrigger("yes","Your worth never stops to amaze me, living one.. Good good, give them to me and be on your way to bring me 10 bottles of the finest poison, the one that only spiders can breed");
    AddCondition("qpg","=",10);
    AddCondition("item",63,"belt",">",99);
    AddConsequence("deleteitem",63,100);
    AddConsequence("qpg","=",11);
    AddTraderTrigger("[Hh]ello","Do you have what I required of you? If not, you should better not waste my time anymore..");
    AddAdditionalTrigger("[Gg]reetings");
    AddAdditionalTrigger("[Hh]i");
    AddCondition("qpg","=",11);
    AddConsequence("qpg","=",12);
    AddTraderTrigger("[Nn]o","Why are you wasting my time then? I am eternally busy");
    AddCondition("qpg","=",12);
    AddConsequence("qpg","=",11);
    AddTraderTrigger("[Yy]es","Idiotic piece of flesh, bring them first!");
    AddCondition("qpg","=",12);
    AddCondition("item",167,"belt","<",10);
    AddConsequence("qpg","=",11);
    AddTraderTrigger("yes","Oh excellent work, dark one, excellent work indeed. Are you ready? I shall now give you a special power to help you in your next task.");
    AddCondition("qpg","=",12);
    AddCondition("item",167,"belt",">",9);
    AddConsequence("deleteitem",167,10);
    AddConsequence("qpg","=",13);
    AddTraderTrigger("yes"," #me waves his skeletral hand in from of the %CHARRACE 's face, humming darkly 'Yes my dark friend, yes.. feel the power? Yes.. Now tell me, are you ready for the last task?' ");
    AddCondition("qpg","=",13);
    AddConsequence("qpg","=",14);
    AddTraderTrigger("yes","During my... lifetime... a grand order of paladins was watching my every move, trying at every step to end my dark existance. Their leader, Antonius Cornelius, hunted me his entire life, since his childhood, when I slayed his troublemaking parents. When I received the curse, he swore that one day he will destroy me, even if he'd have to wait an eternity for it. As no servant of the light would ever dare to step in this doomed place, he prayed and prayed to his weak gods, asking them for mercy. The gods showed pitty to their loyal servant, blessing him with neverending life and ethernal yought. Thus, even today, Antonius resides somewhere in the dungeoun below, waiting for a chance to slay me, until the end of time. Find him, %CHARNAME, and end his pittyful existance. Bring me his holy sword as proof of his demise.");
    AddCondition("qpg","=",14);
    AddConsequence("qpg","=",15);
    AddTraderTrigger("[Hh]ello","Have you slayed the paladin, %CHARNAME and brought me his sword? If not, you should better not waste my time anymore..");
    AddAdditionalTrigger("[Gg]reetings");
    AddAdditionalTrigger("[Hh]i");
    AddCondition("qpg","=",15);
    AddConsequence("qpg","=",16);
    AddTraderTrigger("[Nn]o","Why are you wasting my time then? I am eternally busy");
    AddCondition("qpg","=",16);
    AddConsequence("qpg","=",15);
    AddTraderTrigger("[Yy]es","Idiotic piece of flesh, do what I asked!");
    AddCondition("qpg","=",16);
    AddCondition("item",206,"belt","<",1);
    AddConsequence("qpg","=",15);
    AddTraderTrigger("yes","Well done %CHARNAME, well done! I must say that I wasn't expecting you to return. Your dark heart allowed you to slay the poor paladin, you are truely worthy of baring darkness in your soul. Receive this gift, dark one, receive it and bare it well.");
    AddCondition("qpg","=",16);
    AddCondition("item",206,"belt","=",1);
    AddConsequence("qpg","=",17);
    AddConsequence("deleteitem",206,1);
    AddConsequence("item",278,1,1001,0000);
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

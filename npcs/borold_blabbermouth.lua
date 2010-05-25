-- INSERT INTO npc VALUES (nextval('npc_seq'),2,403,282,200,4,false,'Borold Blabbermouth','npc_borold_blabbermouth.lua',0);

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
    SetRadius(2);
    -- ********* START DYNAMIC PART ********

    AddCycleText("#me summt ein Lied.","#me hums a song.");
    AddCycleText("#me klopft etwas Schmutz von seiner Robe ab.","#me pats off some dust from his robe.");
    AddCycleText("#me schaut sich neugierig um.","#me looks inquisitive around.");
    AddCycleText("#me spielt mit einer Goldmünze.","#me plays with a gold coin.");
    
    AddTraderTrigger("Hello","Hiho! I can help you to get rich and famous. Do ye want to know how I do that?");
    AddAdditionalTrigger("Greetings");
    AddAdditionalTrigger("Be greeted");
    AddAdditionalTrigger("Hail");
    AddAdditionalTrigger("Good day");
    AddAdditionalTrigger("Good morning");
    AddAdditionalTrigger("Good evening");
    AddAdditionalText("Hey ye! Do you want become rich and famous?");
    AddAdditionalText("Eh, do you want to become famous?");
    AddConsequence("state","=",1);
    AddConsequence("talk","begin");
    AddConsequence("inform","This person obviously can improve your reputation in this town a bit.");
    
    AddTraderTrigger("Grüße","Hey du! Ich kann dir helfen reich und berühmt zu werden. Willste wissen wie?");
    AddAdditionalTrigger("Gruß");
    AddAdditionalTrigger("Seid gegrüßt");
    AddAdditionalTrigger("Guten Tag");
    AddAdditionalTrigger("Guten Abend");
    AddAdditionalTrigger("Mahlzeit");
    AddAdditionalTrigger("Tach");
    AddAdditionalTrigger("Moin");
    AddAdditionalText("Jaja, hallo auch. Willst du reich und berühmt werden?");
    AddAdditionalText("Hiho, hast du Interesse dran berühmt zu werden?");
    AddConsequence("state","=",1);
    AddConsequence("talk","begin");
    AddConsequence("inform","Diese Person kann offensichtlich dein Ansehen in dieser Stadt ein wenig aufbessern.");
    
    AddTraderTrigger("Hiho","Hiho! I can help you to get rich and famous. Do you want to know how I do that?");
    AddAdditionalTrigger("Hallo");
    AddAdditionalTrigger("Hey");
    AddAdditionalTrigger("Greebas");
    AddAdditionalTrigger("Greebs");
    AddCondition("lang","english");
    AddAdditionalText("Hey ye! Do you want become rich and famous?");
    AddAdditionalText("Eh, do you want to become famous?");
    AddConsequence("state","=",1);
    AddConsequence("talk","begin");
    AddConsequence("inform","This person obviously can improve your reputation in this town a bit.");
    AddTraderTrigger("Hiho","Hey du! Ich kann dir helfen reich und berühmt zu werden. Willste wissen wie?");
    AddAdditionalTrigger("Hallo");
    AddAdditionalTrigger("Hey");
    AddAdditionalTrigger("Greebas");
    AddAdditionalTrigger("Greebs");
    AddCondition("lang","german");
    AddAdditionalText("Jaja, hallo auch. Willst du reich und berühmt werden?");
    AddAdditionalText("Hiho, hast du Interesse dran berühmt zu werden?");
    AddConsequence("state","=",1);
    AddConsequence("talk","begin");
    AddConsequence("inform","Diese Person kann offensichtlich dein Ansehen in dieser Stadt ein wenig aufbessern.");
    
    AddTraderTrigger("Farewell","Bye");
    AddAdditionalTrigger("Good bye");
    AddAdditionalTrigger("Bye");
    AddAdditionalTrigger("Fare thy well");
    AddAdditionalText("Goodbye");
    AddAdditionalText("Farewell");
    AddConsequence("talk","end");
    AddConsequence("state","=",0);
    
    AddTraderTrigger("Tschüß","Bis bald.");
    AddAdditionalTrigger("Tschüss");
    AddAdditionalTrigger("Wiedersehen");
    AddAdditionalTrigger("Gehabt euch wohl");
    AddAdditionalText("Man sieht sich.");
    AddAdditionalText("Tschüss");
    AddConsequence("talk","end");
    AddConsequence("state","=",0);
    
    AddTraderTrigger("Ciao","Bye");
    AddAdditionalTrigger("Adieu");
    AddAdditionalTrigger("Au revoir");
    AddCondition("lang","english");
    AddAdditionalText("Goodbye");
    AddAdditionalText("Farewell");
    AddConsequence("talk","end");
    AddConsequence("state","=",0);
    AddTraderTrigger("Ciao","Bis bald.");
    AddAdditionalTrigger("Adieu");
    AddAdditionalTrigger("Au revoir");
    AddCondition("lang","german");
    AddAdditionalText("Man sieht sich.");
    AddAdditionalText("Tschüss");
    AddConsequence("talk","end");
    AddConsequence("state","=",0);
    
    AddTraderTrigger("Reich","Ganz Galmair wird deinen Namen kennen. Für läppische 20 Silberstücke erlü...ähm erzähl ich in der ganzen Stadt rum wie mutig und stark du bist und das du die besten Waren weit und breit verkaufst. Was ist nun, bist du interessiert?");
    AddAdditionalTrigger("Berühmt");
    AddAdditionalTrigger("Beruehmt");
    AddAdditionalTrigger("Wie");
    AddAdditionalTrigger("Ja");
    AddAdditionalTrigger("Aye");
    AddAdditionalTrigger("Sicher");
    AddAdditionalTrigger("Klar");
    AddAdditionalTrigger("Yubba");	   
    AddCondition("state","=",1);
    AddConsequence("state","=",2);
    AddTraderTrigger("rich","Whole Galmair will know your name. For a paltry sum of 20 silver coins I'll lie..err tell everyone how brave and strong you are and also that you sell the best goods all around. Well then, are ye interested?");
    AddAdditionalTrigger("famous");
    AddAdditionalTrigger("how");
    AddAdditionalTrigger("Aye");
    AddAdditionalTrigger("Sure");
    AddAdditionalTrigger("Yubba");
    AddAdditionalTrigger("Yes");
    AddCondition("lang","english");
    AddCondition("state","=",1);
    AddConsequence("state","=",2);


    AddTraderTrigger("Ja","Du bist ja nichtmal Bürger hier! Geh und meld dich oben bei Frederik an und komm erst dann her.");
    AddAdditionalTrigger("Aye");
    AddAdditionalTrigger("Sicher");
    AddAdditionalTrigger("Klar");
    AddAdditionalTrigger("Yubba");
    AddCondition("lang","german");
    AddCondition("state","=",2);
	AddCondition("town","!=","galmair");

    AddTraderTrigger("Yes","You are not even a citizen here! Go and register as citizen at Frederik upstairs and then come back again.");
    AddAdditionalTrigger("Aye");
    AddAdditionalTrigger("Sure");
    AddAdditionalTrigger("Yubba");
    AddCondition("lang","english");
    AddCondition("state","=",2);
	AddCondition("town","!=","galmair");


	AddTraderTrigger("Ja","Herzlichen Dank fürs Geld, du wirst sehen schon bald bist du die berühmteste Person hier");
    AddAdditionalTrigger("Aye");
    AddAdditionalTrigger("Sicher");
    AddAdditionalTrigger("Klar");
    AddAdditionalTrigger("Yubba");
    AddCondition("lang","german");
    AddCondition("state","=",2);
    AddCondition("money",">",2000);
	AddCondition("town","=","galmair");
    AddConsequence("money","-",2000);
    AddConsequence("rankpoints","galmair","+",10);
    AddConsequence("inform","Du steigst im Ansehen von Don Valerio Guiliani.");
    AddConsequence("state","=",0);
    
	AddTraderTrigger("Ja","Du Halunke hast nicht genug Geld dabei, verschwinde!");
    AddAdditionalTrigger("Aye");
    AddAdditionalTrigger("Sicher");
    AddAdditionalTrigger("Klar");
    AddAdditionalTrigger("Yubba");
    AddCondition("lang","german");
    AddCondition("state","=",2);
    AddCondition("money","<",2000);
    AddConsequence("state","=",0);
    
	AddTraderTrigger("Yes","Thanks for the money, you'll become very soon the most famous person here.");
    AddAdditionalTrigger("Aye");
    AddAdditionalTrigger("Sure");
    AddAdditionalTrigger("Yubba");
    AddCondition("lang","english");
    AddCondition("state","=",2);
    AddCondition("money",">",2000);
	AddCondition("town","=","galmair");
    AddConsequence("money","-",2000);
    AddConsequence("rankpoints","galmair","+",10);
    AddConsequence("inform","You gain more of Don Valerio Guiliani's favor.");
	AddConsequence("state","=",0);
    
    AddTraderTrigger("Yes","You have not enough money with ye, scoundrel. Begone!");
    AddAdditionalTrigger("Aye");
    AddAdditionalTrigger("Sure");
    AddAdditionalTrigger("Yubba");
    AddCondition("lang","english");
    AddCondition("state","=",2);
    AddCondition("money","<",2000);
    AddConsequence("state","=",0);
    
    AddTraderTrigger("Nein","Und wieso verschwendest du dann hier meine wertvolle Zeit? Verschwinde!");
    AddAdditionalTrigger("Nay");
    AddAdditionalTrigger("Nope");
    AddAdditionalTrigger("Nubba");
    AddCondition("lang","german");
    AddCondition("state",">",0);
    AddConsequence("talk","end");
    AddConsequence("state","=",0);
    AddTraderTrigger("No","So why are you wasting my worthy time? Begone!");
    AddAdditionalTrigger("Nay");
    AddAdditionalTrigger("Nubba");
    AddCondition("lang","english");
    AddCondition("state",">",0);
    AddConsequence("talk","end");
    AddConsequence("state","=",0);
    
    
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
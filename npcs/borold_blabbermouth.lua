-- INSERT INTO npc VALUES (nextval('npc_seq'),2,403,282,200,4,false,'Borold Blabbermouth','npc_borold_blabbermouth.lua',0);

require("npcs.base.autonpcfunctions")
module("npcs.borold_blabbermouth")

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
    npcs.base.autonpcfunctions.SetRadius(2);
    -- ********* START DYNAMIC PART ********

    npcs.base.autonpcfunctions.AddCycleText("#me summt ein Lied.","#me hums a song.");
    npcs.base.autonpcfunctions.AddCycleText("#me klopft etwas Schmutz von seiner Robe ab.","#me pats off some dust from his robe.");
    npcs.base.autonpcfunctions.AddCycleText("#me schaut sich neugierig um.","#me looks inquisitive around.");
    npcs.base.autonpcfunctions.AddCycleText("#me spielt mit einer Goldmünze.","#me plays with a gold coin.");
    
    npcs.base.autonpcfunctions.AddTraderTrigger("Hello","Hiho! I can help you to get rich and famous. Do ye want to know how I do that?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greetings");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Be greeted");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hail");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good day");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good morning");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good evening");
    npcs.base.autonpcfunctions.AddAdditionalText("Hey ye! Do you want become rich and famous?");
    npcs.base.autonpcfunctions.AddAdditionalText("Eh, do you want to become famous?");
    npcs.base.autonpcfunctions.AddConsequence("state","=",1);
    npcs.base.autonpcfunctions.AddConsequence("talk","begin");
    npcs.base.autonpcfunctions.AddConsequence("inform","This person obviously can improve your reputation in this town a bit.");
    
    npcs.base.autonpcfunctions.AddTraderTrigger("Grüße","Hey du! Ich kann dir helfen reich und berühmt zu werden. Willste wissen wie?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Gruß");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Seid gegrüßt");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Guten Tag");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Guten Abend");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Mahlzeit");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Tach");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Moin");
    npcs.base.autonpcfunctions.AddAdditionalText("Jaja, hallo auch. Willst du reich und berühmt werden?");
    npcs.base.autonpcfunctions.AddAdditionalText("Hiho, hast du Interesse dran berühmt zu werden?");
    npcs.base.autonpcfunctions.AddConsequence("state","=",1);
    npcs.base.autonpcfunctions.AddConsequence("talk","begin");
    npcs.base.autonpcfunctions.AddConsequence("inform","Diese Person kann offensichtlich dein Ansehen in dieser Stadt ein wenig aufbessern.");
    
    npcs.base.autonpcfunctions.AddTraderTrigger("Hiho","Hiho! I can help you to get rich and famous. Do you want to know how I do that?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddAdditionalText("Hey ye! Do you want become rich and famous?");
    npcs.base.autonpcfunctions.AddAdditionalText("Eh, do you want to become famous?");
    npcs.base.autonpcfunctions.AddConsequence("state","=",1);
    npcs.base.autonpcfunctions.AddConsequence("talk","begin");
    npcs.base.autonpcfunctions.AddConsequence("inform","This person obviously can improve your reputation in this town a bit.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Hiho","Hey du! Ich kann dir helfen reich und berühmt zu werden. Willste wissen wie?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddAdditionalText("Jaja, hallo auch. Willst du reich und berühmt werden?");
    npcs.base.autonpcfunctions.AddAdditionalText("Hiho, hast du Interesse dran berühmt zu werden?");
    npcs.base.autonpcfunctions.AddConsequence("state","=",1);
    npcs.base.autonpcfunctions.AddConsequence("talk","begin");
    npcs.base.autonpcfunctions.AddConsequence("inform","Diese Person kann offensichtlich dein Ansehen in dieser Stadt ein wenig aufbessern.");
    
    npcs.base.autonpcfunctions.AddTraderTrigger("Farewell","Bye");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good bye");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Bye");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Fare thy well");
    npcs.base.autonpcfunctions.AddAdditionalText("Goodbye");
    npcs.base.autonpcfunctions.AddAdditionalText("Farewell");
    npcs.base.autonpcfunctions.AddConsequence("talk","end");
    npcs.base.autonpcfunctions.AddConsequence("state","=",0);
    
    npcs.base.autonpcfunctions.AddTraderTrigger("Tschüß","Bis bald.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Tschüss");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Wiedersehen");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Gehabt euch wohl");
    npcs.base.autonpcfunctions.AddAdditionalText("Man sieht sich.");
    npcs.base.autonpcfunctions.AddAdditionalText("Tschüss");
    npcs.base.autonpcfunctions.AddConsequence("talk","end");
    npcs.base.autonpcfunctions.AddConsequence("state","=",0);
    
    npcs.base.autonpcfunctions.AddTraderTrigger("Ciao","Bye");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddAdditionalText("Goodbye");
    npcs.base.autonpcfunctions.AddAdditionalText("Farewell");
    npcs.base.autonpcfunctions.AddConsequence("talk","end");
    npcs.base.autonpcfunctions.AddConsequence("state","=",0);
    npcs.base.autonpcfunctions.AddTraderTrigger("Ciao","Bis bald.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddAdditionalText("Man sieht sich.");
    npcs.base.autonpcfunctions.AddAdditionalText("Tschüss");
    npcs.base.autonpcfunctions.AddConsequence("talk","end");
    npcs.base.autonpcfunctions.AddConsequence("state","=",0);
    
    npcs.base.autonpcfunctions.AddTraderTrigger("Reich","Ganz Galmair wird deinen Namen kennen. Für läppische 20 Silberstücke erlü...ähm erzähl ich in der ganzen Stadt rum wie mutig und stark du bist und das du die besten Waren weit und breit verkaufst. Was ist nun, bist du interessiert?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Berühmt");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Beruehmt");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Wie");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Ja");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Aye");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Sicher");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Klar");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Yubba");	   
    npcs.base.autonpcfunctions.AddCondition("state","=",1);
    npcs.base.autonpcfunctions.AddConsequence("state","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("rich","Whole Galmair will know your name. For a paltry sum of 20 silver coins I'll lie..err tell everyone how brave and strong you are and also that you sell the best goods all around. Well then, are ye interested?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("famous");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("how");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Aye");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Sure");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Yubba");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Yes");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddCondition("state","=",1);
    npcs.base.autonpcfunctions.AddConsequence("state","=",2);


    npcs.base.autonpcfunctions.AddTraderTrigger("Ja","Du bist ja nichtmal Bürger hier! Geh und meld dich oben bei Frederik an und komm erst dann her.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Aye");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Sicher");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Klar");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Yubba");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddCondition("state","=",2);
	npcs.base.autonpcfunctions.AddCondition("town","!=","galmair");

    npcs.base.autonpcfunctions.AddTraderTrigger("Yes","You are not even a citizen here! Go and register as citizen at Frederik upstairs and then come back again.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Aye");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Sure");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Yubba");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddCondition("state","=",2);
	npcs.base.autonpcfunctions.AddCondition("town","!=","galmair");


	npcs.base.autonpcfunctions.AddTraderTrigger("Ja","Herzlichen Dank fürs Geld, du wirst sehen schon bald bist du die berühmteste Person hier");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Aye");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Sicher");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Klar");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Yubba");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddCondition("state","=",2);
    npcs.base.autonpcfunctions.AddCondition("money",">",2000);
	npcs.base.autonpcfunctions.AddCondition("town","=","galmair");
    npcs.base.autonpcfunctions.AddConsequence("money","-",2000);
    npcs.base.autonpcfunctions.AddConsequence("rankpoints","galmair","+",10);
    npcs.base.autonpcfunctions.AddConsequence("inform","Du steigst im Ansehen von Don Valerio Guiliani.");
    npcs.base.autonpcfunctions.AddConsequence("state","=",0);
    
	npcs.base.autonpcfunctions.AddTraderTrigger("Ja","Du Halunke hast nicht genug Geld dabei, verschwinde!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Aye");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Sicher");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Klar");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Yubba");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddCondition("state","=",2);
    npcs.base.autonpcfunctions.AddCondition("money","<",2000);
    npcs.base.autonpcfunctions.AddConsequence("state","=",0);
    
	npcs.base.autonpcfunctions.AddTraderTrigger("Yes","Thanks for the money, you'll become very soon the most famous person here.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Aye");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Sure");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Yubba");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddCondition("state","=",2);
    npcs.base.autonpcfunctions.AddCondition("money",">",2000);
	npcs.base.autonpcfunctions.AddCondition("town","=","galmair");
    npcs.base.autonpcfunctions.AddConsequence("money","-",2000);
    npcs.base.autonpcfunctions.AddConsequence("rankpoints","galmair","+",10);
    npcs.base.autonpcfunctions.AddConsequence("inform","You gain more of Don Valerio Guiliani's favor.");
	npcs.base.autonpcfunctions.AddConsequence("state","=",0);
    
    npcs.base.autonpcfunctions.AddTraderTrigger("Yes","You have not enough money with ye, scoundrel. Begone!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Aye");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Sure");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Yubba");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddCondition("state","=",2);
    npcs.base.autonpcfunctions.AddCondition("money","<",2000);
    npcs.base.autonpcfunctions.AddConsequence("state","=",0);
    
    npcs.base.autonpcfunctions.AddTraderTrigger("Nein","Und wieso verschwendest du dann hier meine wertvolle Zeit? Verschwinde!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Nay");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Nope");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Nubba");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddCondition("state",">",0);
    npcs.base.autonpcfunctions.AddConsequence("talk","end");
    npcs.base.autonpcfunctions.AddConsequence("state","=",0);
    npcs.base.autonpcfunctions.AddTraderTrigger("No","So why are you wasting my worthy time? Begone!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Nay");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Nubba");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddCondition("state",">",0);
    npcs.base.autonpcfunctions.AddConsequence("talk","end");
    npcs.base.autonpcfunctions.AddConsequence("state","=",0);
    
    
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
-- INSERT INTO npc VALUES (nextval('npc_seq'),2,403,282,200,4,false,'Borold Blabbermouth','npc_borold_blabbermouth.lua',0);

require("npc.base.autonpcfunctions")
module("npc.borold_blabbermouth", package.seeall)

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
    npc.base.autonpcfunctions.SetRadius(2);
    -- ********* START DYNAMIC PART ********

    npc.base.autonpcfunctions.AddCycleText("#me summt ein Lied.","#me hums a song.");
    npc.base.autonpcfunctions.AddCycleText("#me klopft etwas Schmutz von seiner Robe ab.","#me pats off some dust from his robe.");
    npc.base.autonpcfunctions.AddCycleText("#me schaut sich neugierig um.","#me looks inquisitive around.");
    npc.base.autonpcfunctions.AddCycleText("#me spielt mit einer Goldmünze.","#me plays with a gold coin.");
    
    npc.base.autonpcfunctions.AddTraderTrigger("Hello","Hiho! I can help you to get rich and famous. Do ye want to know how I do that?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greetings");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Be greeted");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hail");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good day");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good morning");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good evening");
    npc.base.autonpcfunctions.AddAdditionalText("Hey ye! Do you want become rich and famous?");
    npc.base.autonpcfunctions.AddAdditionalText("Eh, do you want to become famous?");
    npc.base.autonpcfunctions.AddConsequence("state","=",1);
    npc.base.autonpcfunctions.AddConsequence("talk","begin");
    npc.base.autonpcfunctions.AddConsequence("inform","This person obviously can improve your reputation in this town a bit.");
    
    npc.base.autonpcfunctions.AddTraderTrigger("Grüße","Hey du! Ich kann dir helfen reich und berühmt zu werden. Willste wissen wie?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Gruß");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Seid gegrüßt");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Guten Tag");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Guten Abend");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Mahlzeit");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Tach");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Moin");
    npc.base.autonpcfunctions.AddAdditionalText("Jaja, hallo auch. Willst du reich und berühmt werden?");
    npc.base.autonpcfunctions.AddAdditionalText("Hiho, hast du Interesse dran berühmt zu werden?");
    npc.base.autonpcfunctions.AddConsequence("state","=",1);
    npc.base.autonpcfunctions.AddConsequence("talk","begin");
    npc.base.autonpcfunctions.AddConsequence("inform","Diese Person kann offensichtlich dein Ansehen in dieser Stadt ein wenig aufbessern.");
    
    npc.base.autonpcfunctions.AddTraderTrigger("Hiho","Hiho! I can help you to get rich and famous. Do you want to know how I do that?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("Hey ye! Do you want become rich and famous?");
    npc.base.autonpcfunctions.AddAdditionalText("Eh, do you want to become famous?");
    npc.base.autonpcfunctions.AddConsequence("state","=",1);
    npc.base.autonpcfunctions.AddConsequence("talk","begin");
    npc.base.autonpcfunctions.AddConsequence("inform","This person obviously can improve your reputation in this town a bit.");
    npc.base.autonpcfunctions.AddTraderTrigger("Hiho","Hey du! Ich kann dir helfen reich und berühmt zu werden. Willste wissen wie?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddAdditionalText("Jaja, hallo auch. Willst du reich und berühmt werden?");
    npc.base.autonpcfunctions.AddAdditionalText("Hiho, hast du Interesse dran berühmt zu werden?");
    npc.base.autonpcfunctions.AddConsequence("state","=",1);
    npc.base.autonpcfunctions.AddConsequence("talk","begin");
    npc.base.autonpcfunctions.AddConsequence("inform","Diese Person kann offensichtlich dein Ansehen in dieser Stadt ein wenig aufbessern.");
    
    npc.base.autonpcfunctions.AddTraderTrigger("Farewell","Bye");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good bye");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Bye");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Fare thy well");
    npc.base.autonpcfunctions.AddAdditionalText("Goodbye");
    npc.base.autonpcfunctions.AddAdditionalText("Farewell");
    npc.base.autonpcfunctions.AddConsequence("talk","end");
    npc.base.autonpcfunctions.AddConsequence("state","=",0);
    
    npc.base.autonpcfunctions.AddTraderTrigger("Tschüß","Bis bald.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Tschüss");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Wiedersehen");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Gehabt euch wohl");
    npc.base.autonpcfunctions.AddAdditionalText("Man sieht sich.");
    npc.base.autonpcfunctions.AddAdditionalText("Tschüss");
    npc.base.autonpcfunctions.AddConsequence("talk","end");
    npc.base.autonpcfunctions.AddConsequence("state","=",0);
    
    npc.base.autonpcfunctions.AddTraderTrigger("Ciao","Bye");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("Goodbye");
    npc.base.autonpcfunctions.AddAdditionalText("Farewell");
    npc.base.autonpcfunctions.AddConsequence("talk","end");
    npc.base.autonpcfunctions.AddConsequence("state","=",0);
    npc.base.autonpcfunctions.AddTraderTrigger("Ciao","Bis bald.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddAdditionalText("Man sieht sich.");
    npc.base.autonpcfunctions.AddAdditionalText("Tschüss");
    npc.base.autonpcfunctions.AddConsequence("talk","end");
    npc.base.autonpcfunctions.AddConsequence("state","=",0);
    
    npc.base.autonpcfunctions.AddTraderTrigger("Reich","Ganz Galmair wird deinen Namen kennen. Für läppische 20 Silberstücke erlü...ähm erzähl ich in der ganzen Stadt rum wie mutig und stark du bist und das du die besten Waren weit und breit verkaufst. Was ist nun, bist du interessiert?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Berühmt");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Beruehmt");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Wie");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Ja");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Aye");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Sicher");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Klar");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Yubba");	   
    npc.base.autonpcfunctions.AddCondition("state","=",1);
    npc.base.autonpcfunctions.AddConsequence("state","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger("rich","Whole Galmair will know your name. For a paltry sum of 20 silver coins I'll lie..err tell everyone how brave and strong you are and also that you sell the best goods all around. Well then, are ye interested?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("famous");
    npc.base.autonpcfunctions.AddAdditionalTrigger("how");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Aye");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Sure");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Yubba");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Yes");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddCondition("state","=",1);
    npc.base.autonpcfunctions.AddConsequence("state","=",2);


    npc.base.autonpcfunctions.AddTraderTrigger("Ja","Du bist ja nichtmal Bürger hier! Geh und meld dich oben bei Frederik an und komm erst dann her.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Aye");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Sicher");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Klar");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Yubba");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddCondition("state","=",2);
	npc.base.autonpcfunctions.AddCondition("town","!=","galmair");

    npc.base.autonpcfunctions.AddTraderTrigger("Yes","You are not even a citizen here! Go and register as citizen at Frederik upstairs and then come back again.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Aye");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Sure");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Yubba");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddCondition("state","=",2);
	npc.base.autonpcfunctions.AddCondition("town","!=","galmair");


	npc.base.autonpcfunctions.AddTraderTrigger("Ja","Herzlichen Dank fürs Geld, du wirst sehen schon bald bist du die berühmteste Person hier");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Aye");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Sicher");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Klar");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Yubba");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddCondition("state","=",2);
    npc.base.autonpcfunctions.AddCondition("money",">",2000);
	npc.base.autonpcfunctions.AddCondition("town","=","galmair");
    npc.base.autonpcfunctions.AddConsequence("money","-",2000);
    npc.base.autonpcfunctions.AddConsequence("rankpoints","galmair","+",10);
    npc.base.autonpcfunctions.AddConsequence("inform","Du steigst im Ansehen von Don Valerio Guiliani.");
    npc.base.autonpcfunctions.AddConsequence("state","=",0);
    
	npc.base.autonpcfunctions.AddTraderTrigger("Ja","Du Halunke hast nicht genug Geld dabei, verschwinde!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Aye");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Sicher");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Klar");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Yubba");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddCondition("state","=",2);
    npc.base.autonpcfunctions.AddCondition("money","<",2000);
    npc.base.autonpcfunctions.AddConsequence("state","=",0);
    
	npc.base.autonpcfunctions.AddTraderTrigger("Yes","Thanks for the money, you'll become very soon the most famous person here.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Aye");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Sure");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Yubba");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddCondition("state","=",2);
    npc.base.autonpcfunctions.AddCondition("money",">",2000);
	npc.base.autonpcfunctions.AddCondition("town","=","galmair");
    npc.base.autonpcfunctions.AddConsequence("money","-",2000);
    npc.base.autonpcfunctions.AddConsequence("rankpoints","galmair","+",10);
    npc.base.autonpcfunctions.AddConsequence("inform","You gain more of Don Valerio Guiliani's favor.");
	npc.base.autonpcfunctions.AddConsequence("state","=",0);
    
    npc.base.autonpcfunctions.AddTraderTrigger("Yes","You have not enough money with ye, scoundrel. Begone!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Aye");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Sure");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Yubba");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddCondition("state","=",2);
    npc.base.autonpcfunctions.AddCondition("money","<",2000);
    npc.base.autonpcfunctions.AddConsequence("state","=",0);
    
    npc.base.autonpcfunctions.AddTraderTrigger("Nein","Und wieso verschwendest du dann hier meine wertvolle Zeit? Verschwinde!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Nay");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Nope");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Nubba");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddCondition("state",">",0);
    npc.base.autonpcfunctions.AddConsequence("talk","end");
    npc.base.autonpcfunctions.AddConsequence("state","=",0);
    npc.base.autonpcfunctions.AddTraderTrigger("No","So why are you wasting my worthy time? Begone!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Nay");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Nubba");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddCondition("state",">",0);
    npc.base.autonpcfunctions.AddConsequence("talk","end");
    npc.base.autonpcfunctions.AddConsequence("state","=",0);
    
    
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

-- INSERT INTO npc VALUES (nextval('npc_seq'),2,787,795,0,4,false,'Bippi','npc_bippi_aquest28.lua',0);

require("npc.base.autonpcfunctions")
require("quest_aquest28");    --the quest file
module("npc.bippi_aquest28")

function useNPC(user,counter,param)
    thisNPC:increaseSkill(1,"common language",100);
    thisNPC:talkLanguage(CCharacter.say, CPlayer.german, "Finger weg!");
    thisNPC:talkLanguage(CCharacter.say, CPlayer.english, "Don't you touch me!");
end

function initializeNpc()
    if TraderFirst then
        return true;
    end

    npc.base.autonpcfunctions.InitTalkLists();

    -- ********* START DYNAMIC PART ********

    QuestID = 28;

	npc.base.autonpcfunctions.AddTraderTrigger("Milch","Aber bitte nimmt nur und bedient euch! Schmeckts? Meine 'Kühe' geben eine besonders wohlschmeckende Milch.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",0);
    npc.base.autonpcfunctions.AddConsequence("inform","Du möchtest mehr über die Kühe erfahren.");
    npc.base.autonpcfunctions.AddTraderTrigger("Milk","Why of course, help yourself! Good, isn't it? My 'cows' give an extraordinary delicious milk.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",0);
    npc.base.autonpcfunctions.AddConsequence("inform","You want to know more about the cows.");

	npc.base.autonpcfunctions.AddTraderTrigger("Kuh","Meine Kühe sind mein ganzer Stolz! Außerdem sichern sie mir meine Existenz. Wenn ich nur jemanden hätte der mir mit all der Arbeit hilft...");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Kühe");
    npc.base.autonpcfunctions.AddAdditionalText("Ich werde alt und die Arbeit mit den Kühen wird für mich immer schwerer. Ich könnte Hilfe im Stall gebrauchen aber wer nimmt sich schon so einer Aufgabe an...");

	npc.base.autonpcfunctions.AddTraderTrigger("Cow","I'm proud of my cows! I earn my living with their milk. If only I had someone to help me with all the work...");
    npc.base.autonpcfunctions.AddAdditionalText("I'm getting older and the work with the cows gets harder all by myself. I could use some help in the stable, but who would care for a task like that...");

	npc.base.autonpcfunctions.AddTraderTrigger("Aufgabe","Könntet ihr mir helfen? Ich kann euch nicht viel dafür geben aber es würde mir viel bedeuten und mir einige Sorgen abnehmen.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hilfe");
    npc.base.autonpcfunctions.AddAdditionalTrigger("helf");
    npc.base.autonpcfunctions.AddCondition("qpg","=",0);
    npc.base.autonpcfunctions.AddConsequence("state","=",1);
    npc.base.autonpcfunctions.AddConsequence("inform","Sag 'Ich helfe euch' wenn du ihm helfen möchtest.");
    npc.base.autonpcfunctions.AddTraderTrigger("task","Could you help me? I can't pay much but it'd mean a lot to me. It would also take away some of my worries.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("help");
    npc.base.autonpcfunctions.AddCondition("qpg","=",0);
    npc.base.autonpcfunctions.AddConsequence("state","=",1);
    npc.base.autonpcfunctions.AddConsequence("inform","Say 'I help you' if you want to help him.");
    -------
	
    npc.base.autonpcfunctions.AddTraderTrigger("Tschüß","Gehabt euch wohl und kommt eines Tages wieder.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Tschüss");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Wiedersehen");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Gehabt euch wohl");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Auf bald");
    npc.base.autonpcfunctions.AddAdditionalText("Auf bald");
    npc.base.autonpcfunctions.AddTraderTrigger("Farewell","Good bye.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good bye");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Bye");
    npc.base.autonpcfunctions.AddAdditionalText("Farewell, and come back one day.");
    npc.base.autonpcfunctions.AddAdditionalText("Good bye");
    ----START QUEST-
    npc.base.autonpcfunctions.AddTraderTrigger("Grüße","Oh Grüße, Reisender! Besuch freut mich immer, darf ich euch eine Schale 'Milch' anbieten?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Gruß");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Seid gegrüßt");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Guten Tag");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Guten Abend");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Mahlzeit");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Tach");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Moin");
    npc.base.autonpcfunctions.AddCondition("qpg","=",0);
    npc.base.autonpcfunctions.AddConsequence("inform","Milch hört sich jetzt sehr verlockend an, aber du fragst ihn besser vorher um was für eine Milch es sich handelt.");
    npc.base.autonpcfunctions.AddTraderTrigger("Hiho","Oh Grüße, Reisender! Besuch freut mich immer, darf ich euch eine Schale 'Milch' anbieten?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddCondition("qpg","=",0);
    npc.base.autonpcfunctions.AddConsequence("inform","Milch hört sich jetzt sehr verlockend an, aber du fragst ihn besser vorher um was für eine Milch es sich handelt.");

	npc.base.autonpcfunctions.AddTraderTrigger("Hello","Oh greetings, traveler! How nice of you to drop by, can I offer you a bowl of 'milk'?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greetings");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Be greeted");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hail");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good day");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good morning");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good evening");
    npc.base.autonpcfunctions.AddCondition("qpg","=",0);
    npc.base.autonpcfunctions.AddConsequence("inform","Milk sounds at the moment very alluring, but you better ask him first what kind of milk he has.");
    npc.base.autonpcfunctions.AddTraderTrigger("Hiho","Oh greetings, traveler! How nice of you to drop by, can I offer you a bowl of 'milk'?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddCondition("qpg","=",0);
    npc.base.autonpcfunctions.AddConsequence("inform","Milk sounds at the moment very alluring, but you better ask him first what kind of milk he has.");
	
	---------DURING QUEST-----------
    npc.base.autonpcfunctions.AddTraderTrigger("Grüße","Ach da seid ihr ja wieder, ihr kommt sicher wegen eurer nächsten 'Aufgabe'.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Gruß");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Seid gegrüßt");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Guten Tag");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Guten Abend");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Mahlzeit");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Tach");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Moin");
    npc.base.autonpcfunctions.AddTraderTrigger("Hello","Ah, you're back again, I'm sure you are because of your next 'task' here.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greetings");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Be greeted");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hail");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good day");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good morning");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good evening");
    -----------------------------------
    -- ********* END DYNAMIC PART ********
    TradSpeakLang={0,6};
    TradStdLang=0;

    npc.base.autonpcfunctions.increaseLangSkill(TradSpeakLang);
    thisNPC.activeLanguage=TradStdLang;
    
    if not InitDone then

		InitDone= true;
    	cowname = {"Betsy", "Mjilka", "Cheeseball"};
    	
    end
    

end

function nextCycle()  -- ~10 times per second
    initializeNpc();
    npc.base.autonpcfunctions.SpeakerCycle();
end

function receiveText(texttype, message, originator)
    if npc.base.autonpcfunctions.BasicNPCChecks(originator,2) then
        if npc.base.autonpcfunctions.LangOK(originator,TradSpeakLang) then
			if string.find(message,"reset") then
				originator:setQuestProgress(29, 0);	
				originator:setQuestProgress(28, 0);	
				NPCStatus[originator.id]=0;

				find, aquest28Effect =  originator.effects:find(32);
				if find then
					originator.aquest28Effect:removeEffect(32);
				end
				originator:inform("Reset");
			end	
			
			if ( (string.find(message,"Ich helfe euch")~=nil or string.find(message,"I help you")~=nil)and NPCStatus[originator.id]==1) then --here starts the quest with first task

				-- INITIALIZE THE QUEST STATUS 29 WHICH HOLDS VARIABLES OF THE QUEST
                cowrnd = math.random(3); --choose cow by random
				local task = 1; local cow = cowrnd; local counter = 6;

				quest_aquest28.glue_questdata(originator, cow, task, counter);
    			NPCStatus[originator.id] = 0;
    			originator:setQuestProgress(28, 1);
    			--------------------------------
				--TELL WHAT TO DO AND WHICH COW HE HAS
				gText="Sehr gut, dann fangen wir an. Um euch nicht zu überfordern müsst ihr euch auch nur um eine Kuh kümmern und zwar um "..cowname[cowrnd]..". Ich werde euch täglich sagen welche Aufgaben ihr zu tun habt.";
			    eText="Very good, let's start. You only have to take care of one cow namely "..cowname[cowrnd].." so it's not that hard. I will tell you daily what to do.";
		        outText=base.common.npc.base.npcautofunction.GetNLS(User,gText,eText);
				npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);

				-- TELL the TASK TO DO
				gText,eText = TaskText(task);
		        outText=base.common.npc.base.npcautofunction.GetNLS(User,gText,eText);
				npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
    		elseif ((string.find(message,"[Hh]ilfe")~=nil or string.find(message,"[Hh]elp")~=nil) and originator:getQuestProgress(28)>0) then
				gText = "Schlüsselwörter: 'Wie lautet meine Aufgabe?','Gib mir einen Hinweis zur Aufgabe'";
				eText = "Keyphrases : 'What is my task?','Give me a hint to the task'";
				base.common.TempInformNLS(originator, gText,eText);
			elseif ((string.find(message,"[Hh]inweis")~=nil or string.find(message,"[Hh]int")~=nil) and originator:getQuestProgress(28)>0) then
				-- GIVE A HINT TO THE TASK
				dummy1, task = quest_aquest28.split_questdata(originator);

				dummy1,dummy2,gText,eText = TaskText(task);
		        outText=base.common.npc.base.npcautofunction.GetNLS(User,gText,eText);
				npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
			elseif ((string.find(message,"[Aa]ufgabe")~=nil or string.find(message,"[Tt]ask")~=nil) and originator:getQuestProgress(28)>0) then

				aquest28Effect = User.effects:find(32); -- does effect #32 already exist?
				local dummy_1, noTaskYet= quest_aquest28.split_questdata(originator); 
				if (aquest28Effect == false and noTaskYet == 0) then --time delay of 1 day is finished, creat new task
					quest_aquest28.chooseTask(originator);
				end

				-- TELL the TASK TO DO
				dummy1, task = quest_aquest28.split_questdata(originator);
				
				gText,eText = TaskText(task);
		        outText=base.common.npc.base.npcautofunction.GetNLS(User,gText,eText);
				npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
			else
            	npc.base.autonpcfunctions.TellSmallTalk(message,originator);
			end
        else
            npc.base.autonpcfunctions.Confused(
               "#me sieht dich leicht verwirrt an",
               "#me looks at you a little confused"
            );
        end
    end
end

function TaskText(taskid)
	if not TaskInit then
		TaskInit = true;
		gTask ={};
		eTask ={};
		
        gTask[1] = {
					desctxt="Meine Arme sind schwach. Heute beim Essen ist mir die Suppenschüssel aus der Hand gefallen. Bitte bürstet und striegelt die Kuh heute.",
					helptxt="Nun mit der Hand wird das nichts. Sucht euch etwas mit dem bürsten könnt? Und immer mit der Fellrichtung streichen sonst wird die Milch sauer!"
					};

        eTask[1] = {
					desctxt="My arms grew weak. I could barely lift the soup bowl while eating today. Please groom the cow.",
					helptxt="Well, you can't groom with your hand, look for a tool to help you brush? And always comb from front to back or the cow will give sour milk."
					};
        gTask[2] = {
					desctxt="Ich glaube ich bin erkältet. Heute mit kaltem Wasser zu arbeiten wäre mein Tod. Bitte wascht die Kuh heute.",
					helptxt="Wasser ist zum Waschen da. Und mit den Händen werdet ihr es nicht tragen können. Neben dem Haus ist ein Brunnen aber nimm deinen eigenen Eimer dafür!"
					};

        eTask[2] = {
					desctxt="I think I cought a cold. It'd be my death if I had to touch cold water now. Please wash the cow today.",
					helptxt="You use water to wash, and you can't carry it in your hands. There's a well next to the house but bring your own bucket!"
					};
		gTask[3] = {
					desctxt="Wenn ich singe wird die Milch besonders cremig, aber heute bin ich heiser. Singt der Kuh doch bitte ein Lied vor!",
					helptxt="Ihr könnt nicht singen? Nun früher hab ich auch öfter mit der Laute vorgespielt aber meine Finger wollen nichtmehr richtig, probiert es damit?"
					};

        eTask[3] = {
					desctxt="If I sing for my cows the milk turns out extraordinarily creamy, but I have a sore throat today. Please sing a song to the cow!",
					helptxt="You can't sing? Well before my fingers got stiff I used to play the lute and they enjoyed that aswell, perhaps you should try that?"
					};
		gTask[4] = {
					desctxt="Das Brunnenwasser ist seit heute morgen so faulig. Klettert bitte hinunter und seht einmal nach was da los ist.",
					helptxt="Vielleicht hat sich Ungeziefer im Brunnen eingenistet? Ihr müsstet es vertreiben dann wird das Wasser bestimmt wieder klarer."
					};

        eTask[4] = {
					desctxt="The water from the well tasted fowl today. Please climb down and check what's wrong.",
					helptxt="Maybe there's vermin in the well? If so, you'd have to get rid of it, then the water will clear again."
					};
		gTask[5] = {
					desctxt="Mein Kreuz macht mir zu schaffen, ich kann das Futter nicht in den Stall tragen. Bitte füttert heute die Kuh.",
					helptxt="Sie mag besonders gerne Getreide."
					};

        eTask[5] = {
					desctxt="My back aches! I can't carry the fodder to the stable. Please feed the cow today.",
					helptxt="She likes grain the best."
					};
		gTask[6] = {
					desctxt="Heute kannst du die Früchte deiner Arbeit ernten sozusagen! Du musst die Kuh nur noch melken.",
					helptxt="Mir persönlich schmeckt die Milch aus der Flasche am besten. Man kann sie auch gleich an der Kuh befüllen."
					};

        eTask[6] = {
					desctxt="Today you can reap what you've sown so to speak! All you have to do is milk the cow.",
					helptxt="I prefer milk from the bottle. You can fill it straight at the cow too."
					};
					
	end
	if taskid == 0 then
		gText = "Du hast die heutige Aufgabe schon erledigt, komm morgen wieder.";
		eText = "You already finished the task for today, come tomorrow again.";
	    return gText, eText,gText, eText;
	end
	return gTask[taskid].desctxt, eTask[taskid].desctxt, gTask[taskid].helptxt, eTask[taskid].helptxt;
end
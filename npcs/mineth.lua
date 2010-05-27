-- INSERT INTO npc VALUES (nextval('npc_seq'),3,740,400,200,0,false,'Mineth','npc_mineth.lua',1);

require("npcs.base.autonpcfunctions")
require("quest_mineth");
module("npcs.mineth")

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

    QuestID = 62;
    npcs.base.autonpcfunctions.AddCycleText("#me wirkt gestresst.","#me appears to be stressed out.");
    npcs.base.autonpcfunctions.AddCycleText("#me schaut dich hilfesuchend an.","#me looks at you for help.");
    npcs.base.autonpcfunctions.AddCycleText("#me murmelt: 'Oh je, oh je, was könnten Sie bloß wollen'.","#me mumbles: 'Oh dear, what could they want'.");
    --help--:
	--during quest 1
	npcs.base.autonpcfunctions.AddTraderTrigger("Hilf","Weißt du schon was alle drei draufhaben wollen, falls ja sag es mir. Oder soll ich dir nochmal über die Mitglieder der Gilde etwas erzählen?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("helf");
    npcs.base.autonpcfunctions.AddCondition("qpg",">=",10000);
    npcs.base.autonpcfunctions.AddCondition("qpg","<",19999);
    npcs.base.autonpcfunctions.AddTraderTrigger("help","Do you know now what they want to have as coat of arms , tell me please if you know. Or shall I tell you again something about the members of the guild?");
    npcs.base.autonpcfunctions.AddCondition("qpg",">=",10000);
    npcs.base.autonpcfunctions.AddCondition("qpg","<",19999);
	-------------------
	--during quest 2
	npcs.base.autonpcfunctions.AddTraderTrigger("Hilf","Bringt mir je 10 Stoffbahnen in den Farben Schwarz,Rot und Gelb und eine Nadel zum Nähen.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("helf");
    npcs.base.autonpcfunctions.AddCondition("qpg",">=",20000);
    npcs.base.autonpcfunctions.AddCondition("qpg","<",29999);
    npcs.base.autonpcfunctions.AddTraderTrigger("help","Bring me 10 cloth per color in the colors black, red and yellow and a needle for sewing.");
    npcs.base.autonpcfunctions.AddCondition("qpg",">=",20000);
    npcs.base.autonpcfunctions.AddCondition("qpg","<",29999);
	-------------------

	--to start quest 2
	npcs.base.autonpcfunctions.AddTraderTrigger("Hilf","Also ich weiß zwar immernoch nicht was das Handelshaus für ein Wappen will, aber Ihr könntet mir schonmal die nötigen Materialien für später bringen. Bringt mir je 10 Stoffbahnen in den Farben Schwarz,Rot und Gelb und eine Nadel zum Nähen.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("helf");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("aufgabe");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("quest");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("helf");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",20000);
    
    npcs.base.autonpcfunctions.AddTraderTrigger("help","I still don't know what the trading house wants as his coat of arms, but you could already bring me some cloth for later. Bring me 10 cloth per color in the colors black, red and yellow and a needle for sewing.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("task");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("quest");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",20000);
	--------------------

	--to start quest 1
	npcs.base.autonpcfunctions.AddTraderTrigger("help","I have the order to embroider a coat of arms  for the trading house 'Trade Company', could you please talk to the members of the company, which are located in all 3 towns and ask them what they would like to see on it?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("task");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("quest");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",0);
    npcs.base.autonpcfunctions.AddConsequence("inform","Keywords on which the woman could react: 'members', 'yes'");
    npcs.base.autonpcfunctions.AddConsequence("state","=",1);
    
	npcs.base.autonpcfunctions.AddTraderTrigger("hilf","Ich habe den Auftrag bekommen für das Handelshaus 'Trade Company' ein Wappen zu sticken, könntest du bitte für mich Ihre Mitglieder die in allen 3 großen Städten ansäßig sind fragen was sie so mögen?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("aufgabe");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("quest");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("helf");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",0);
    npcs.base.autonpcfunctions.AddConsequence("inform","Stichwörter auf die die Frau reagieren könnte: 'Mitglieder', 'Ja'");
    npcs.base.autonpcfunctions.AddConsequence("state","=",1);
    -------------------
    
	npcs.base.autonpcfunctions.AddTraderTrigger("Mitglied","Naja, eigentlich kenne ich nur einen von denen gut, er heißt 'Jonathan Cyrus' und arbeitet als Händler in Cadomyr. Vielleicht kann er dir ja den Namen der anderen beiden Gildenmitglieder nennen. Ich muss wissen wie das Wappen aussehen soll...die Form, Farbe, das Symbol und die Anzahl an Symbolen.");
    npcs.base.autonpcfunctions.AddCondition("qpg",">",0);
    
	npcs.base.autonpcfunctions.AddTraderTrigger("Member","Well, in fact I know only one of them, his name is 'Jonathan Cyrus' and he works as trader in Cadomyr. Maybe he can tell you the names of the other two guild members. I need to know how the coat of arms shall look like...the shape, color, the symbol and the number of symbols that shall be embroidered.");
    npcs.base.autonpcfunctions.AddCondition("qpg",">",0);
    
	npcs.base.autonpcfunctions.AddTraderTrigger("Mitglied","Du musst erstmal den Auftrag annehmen, erst dann sag ich dir die Namen der Leute die du suchen musst. Also, willst du den Auftrag annehmen?");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",0);
    
	npcs.base.autonpcfunctions.AddTraderTrigger("Member","I'll tell you the names of the people you have to look for after you have accepted this order. So, do you accept the order?");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",0);
    
    -------------QUESTSTATUS 0: Char meets npc for the first time
	npcs.base.autonpcfunctions.AddTraderTrigger("Hello","Hello stranger, could you please help me?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greetings");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Be greeted");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hail");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good day");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good morning");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good evening");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",0);
    npcs.base.autonpcfunctions.AddAdditionalText("Be greeted, the gods sent you, I need your help.");
    npcs.base.autonpcfunctions.AddAdditionalText("Greetings, I could need your help.");
    npcs.base.autonpcfunctions.AddConsequence("inform","Maybe you should ask her if she has a 'task' or 'quest' for you.");
    
	npcs.base.autonpcfunctions.AddTraderTrigger("Grüße","Grüße Fremder, könntet Ihr mir bitte helfen?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Gruß");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Seid gegrüßt");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Guten Tag");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Guten Abend");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Mahlzeit");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Tach");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Moin");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",0);
    npcs.base.autonpcfunctions.AddAdditionalText("Seid gegrüßt, die Götter schicken euch, ich benötige eure Hilfe");
    npcs.base.autonpcfunctions.AddAdditionalText("Grüße, ich könnte eure Hilfe gebrauchen.");
    npcs.base.autonpcfunctions.AddConsequence("inform","Vielleicht solltest du Sie fragen ob sie eine 'Aufgabe' oder 'Queste' für dich hat.");
    
	npcs.base.autonpcfunctions.AddTraderTrigger("Hiho","Hello stranger, could you please help me?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",0);
    npcs.base.autonpcfunctions.AddAdditionalText("Be greeted, the gods sent you, I need your help.");
    npcs.base.autonpcfunctions.AddAdditionalText("Greetings, I could need your help.");
    npcs.base.autonpcfunctions.AddConsequence("inform","Maybe you should ask her if she has a 'task' or 'quest' for you.");
    
	npcs.base.autonpcfunctions.AddTraderTrigger("Hiho","Grüße Fremder, könntet Ihr mir bitte helfen?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",0);
    npcs.base.autonpcfunctions.AddAdditionalText("Seid gegrüßt, die Götter schicken euch, ich benötige eure Hilfe");
    npcs.base.autonpcfunctions.AddAdditionalText("Grüße, ich könnte eure Hilfe gebrauchen.");
    npcs.base.autonpcfunctions.AddConsequence("inform","Vielleicht solltest du Sie fragen ob sie eine 'Aufgabe' oder 'Queste' für dich hat.");
    -------------------------------------------------------
	-------------------hello during quest 2-------
	npcs.base.autonpcfunctions.AddTraderTrigger("Grüße","Ah, da seid ihr ja wieder. Habt ihr die Stoffrollen und die Nadel für mich dabei?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Gruß");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Seid gegrüßt");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Guten Tag");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Guten Abend");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Mahlzeit");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Tach");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Moin");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddCondition("qpg",">=",20000);
    npcs.base.autonpcfunctions.AddCondition("qpg","<",29999);
    npcs.base.autonpcfunctions.AddAdditionalText("Seid gegrüßt! Habt ihr die Stoffrollen und die Nadel für mich dabei?");
    npcs.base.autonpcfunctions.AddAdditionalText("Zum Gruße, habt ihr die Stoffrollen und die Nadel für mich dabei?");

	npcs.base.autonpcfunctions.AddTraderTrigger("Hello","Ah you're back again. Do you have the cloth and the needle with you?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greetings");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Be greeted");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hail");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good day");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good morning");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good evening");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hiho");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddCondition("qpg",">=",20000);
    npcs.base.autonpcfunctions.AddCondition("qpg","<",29999);
    npcs.base.autonpcfunctions.AddAdditionalText("Be greeted! Do you have the cloth and the needle with you?");
    npcs.base.autonpcfunctions.AddAdditionalText("Greetings, do you have the cloth and the needle with you?");
	-------------------------------
	--------------after Quests
	npcs.base.autonpcfunctions.AddTraderTrigger("Grüße","Ah, ihr schon wieder. Seid gegrüßt.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Gruß");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Seid gegrüßt");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Guten Tag");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Guten Abend");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Mahlzeit");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Tach");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Moin");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddAdditionalText("Seid gegrüßt!");
    npcs.base.autonpcfunctions.AddAdditionalText("Zum Gruße");

	npcs.base.autonpcfunctions.AddTraderTrigger("Hello","Ah you again. Be greeted.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greetings");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Be greeted");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hail");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good day");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good morning");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good evening");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hiho");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddAdditionalText("Be greeted!");
    npcs.base.autonpcfunctions.AddAdditionalText("Greetings.");

	npcs.base.autonpcfunctions.AddTraderTrigger("Farewell","Bye");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good bye");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Bye");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Fare thy well");
    npcs.base.autonpcfunctions.AddAdditionalText("Goodbye");
    npcs.base.autonpcfunctions.AddAdditionalText("Farewell");
    
	npcs.base.autonpcfunctions.AddTraderTrigger("Tschüß","Bis bald.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Tschüss");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Wiedersehen");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Gehabt euch wohl");
    npcs.base.autonpcfunctions.AddAdditionalText("Auf bald.");
    npcs.base.autonpcfunctions.AddAdditionalText("Die Götter mit euch!");
    
	npcs.base.autonpcfunctions.AddTraderTrigger("Ciao","Bye");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddAdditionalText("Goodbye");
    npcs.base.autonpcfunctions.AddAdditionalText("Farewell");
    
	npcs.base.autonpcfunctions.AddTraderTrigger("Ciao","Bis bald.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddAdditionalText("Auf bald.");
    npcs.base.autonpcfunctions.AddAdditionalText("Die Götter mit euch!");
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
			if string.find(message, "status") then
			   originator:inform("Progress: "..originator:getQuestProgress(62));
			   return;
			elseif string.find(message, "reset") then
				originator:setQuestProgress(62,0);
				NPCStatus[originator.id]=0;
				originator:inform("reset done");
				return;
			elseif string.find(message, "quest2") then
				originator:setQuestProgress(62,20000);
				NPCStatus[originator.id]=0;
				originator:inform("reset for quest 2 done");
				return;	
			end

			if not QuestTrigger(originator, message) then
            	npcs.base.autonpcfunctions.TellSmallTalk(message,originator);
			end

		else
            npcs.base.autonpcfunctions.Confused(
               "#me sieht dich leicht verwirrt an",
               "#me looks at you a little confused"
            );
        end
    end
end


function QuestTrigger(originator, message)

	if standardAnswer(message,1) and NPCStatus[originator.id] ==1 then
		if originator:getQuestProgress(62) == 0 then
			NPCStatus[originator.id]=0;
			quest_mineth.createQuestID(originator);
			gText="Vielen vielen Dank. Ich muss wissen wie das Wappen aussehen soll...die Form, Farbe, das Symbol und die Anzahl an Symbolen.";
			eText="Many many thanks. I need to know how the coat of arms  shall look like...the shape, color, the symbol and the number of symbols that shall be embroidered.";
			outText=base.common.npcs.base.npcautofunction.GetNLS(originator,gText,eText); npcs.base.autonpcfunctions.NPCTalking(thisNPC,outText);
			return true;
		end
	elseif standardAnswer(message,2) and NPCStatus[originator.id] ==1 then
			NPCStatus[originator.id]=0;
			gText="Ihr lasst eine hübsche Dame wie mich im Stich - schämt euch!";
			eText="You forsake a beautiful woman like me - shame on you!";
			outText=base.common.npcs.base.npcautofunction.GetNLS(originator,gText,eText); npcs.base.autonpcfunctions.NPCTalking(thisNPC,outText);
			return true;

	elseif (originator:getQuestProgress(62) >= 10000 and originator:getQuestProgress(62) < 19999) then --check if correct quest 1 sentence
			return checkBannerSentence(originator,message);

	elseif (originator:getQuestProgress(62) >= 20000 and originator:getQuestProgress(62) < 29999) then -- check quest 2 sentences
	        if (standardAnswer(message,3)) then
			   return checkTheItems(originator,message);
			else return false; end
	        
	else return false; end
end

--checks if User has Items for QUEST 2
function checkTheItems(originator,message)
	
	local questdata = quest_mineth.split_questdata(originator);
			--questdata[2], questdata[3],questdata[4],questdata[5]
			--red cloth,    black cloth, yellow cloth, needle
	ItemList = {	174,		175,	 	 177,		   47};
		
		for i = 2, 4, 1 do --check and erase cloth
		   if questdata[i] == 0 then
		   		if (originator:countItem(ItemList[i-1]) >=10) then
		   			originator:eraseItem(ItemList[i-1], 10);
		   			questdata[i]=1;
		   		end
		   end
		end
		
		if questdata[5] == 0 then --check and erase needle
		   	if (originator:countItem(ItemList[4]) >=1) then
		   		originator:eraseItem(ItemList[4], 1);
		   		questdata[5]=1;
		   	end
		end
		local checksum = questdata[2]+questdata[3]+questdata[4]+questdata[5];
		
		if checksum == 4 then --all 4 items brought
			gText = "Vielen vielen Dank für eure Bemühungen, ihr habt mir sehr geholfen. Hier eure Entlohnung.";
			eText = "Many many thanks for your efforts, you have helped me a lot. Here your reward.";
			outText=base.common.npcs.base.npcautofunction.GetNLS(originator,gText,eText); npcs.base.autonpcfunctions.NPCTalking(thisNPC,outText);
			
			--REWARD FOR QUEST 2 HERE--
				--rankpoints+coins--
				local PointsToGive = 6; --the amount of rankpoints the user earns for finishing this quest
				Factionvalues = BF_get(originator);
				if Factionvalues.tid == 0 then --char has no hometown
				    for i = 1, 3, 1 do   --give him 7 rankpoints in each town he is not banned
				        if Factionvalues[DigitToIndex[RANK_OFFSET+i]] ~= 0 then
				           Factionvalues[DigitToIndex[RANKPOINTS_OFFSET+i]] = Factionvalues[DigitToIndex[RANKPOINTS_OFFSET+i]] + (PointsToGive/2);
						end
					end
				else
					Factionvalues[DigitToIndex[RANKPOINTS_OFFSET+Factionvalues.tid]] = Factionvalues[DigitToIndex[RANKPOINTS_OFFSET+Factionvalues.tid]] +PointsToGive;
				end
				Factionvalues = BF_put(originator,Factionvalues);
	            
				originator:createItem(3077,4,333,0); --create 4 silver coins
				--------------------
			originator:setQuestProgress(62,3); --change queststatus
			
		else
			gAddition=""; eAddition="";
			if questdata[2] == 0 or questdata[3] == 0 or questdata[4] == 0 then gAddition = "von den Stoffrollen je 10 Stück."; eAddition ="10 each for the cloth."; end
			gText="Ich benötige noch folgende Dinge..."..gAddition;
			eText="I still need the following things..."..eAddition;
			outText=base.common.npcs.base.npcautofunction.GetNLS(originator,gText,eText); npcs.base.autonpcfunctions.NPCTalking(thisNPC,outText);
			 
			ItemMenu=MenuStruct();
		    if (questdata[2]==0) then ItemMenu:addItem(ItemList[1]) end
		    if (questdata[3]==0) then ItemMenu:addItem(ItemList[2]) end
		    if (questdata[4]==0) then ItemMenu:addItem(ItemList[3]) end
		    if (questdata[5]==0) then ItemMenu:addItem(ItemList[4]) end
			originator:sendMenu(ItemMenu);
			base.common.InformNLS(originator,"*"..thisNPC.name.." zeigt dir eine Liste.*","*"..thisNPC.name.." shows you a list.*");
			
			local qpg = (questdata[1]..questdata[2]..questdata[3]..questdata[4]..questdata[5])+1-1;
			originator:setQuestProgress(62,qpg);
		end
	return true;			
end





--checks if user said correct banner sentence QUEST 1 FUNCTION
function checkBannerSentence(originator,message)
	message = string.lower (message);
	message = string.gsub (message, "ue" , "ü");
	message = string.gsub (message, "ae" , "ä");
	message = string.gsub (message, "oe" , "ö");
	data = quest_mineth.split_questdata(originator);
	--lang = originator:getPlayerLanguage();

	local checksum = 0;

	if string.find(message, string.lower(banner.shape[0][data[2]]) ) ~=nil or string.find(message, string.lower(banner.shape[1][data[2]]) ) ~=nil then 
	checksum = checksum+1; end --the shape name okay?
	
	if string.find(message, string.lower(banner.content[0][data[3]]) ) ~=nil or string.find(message, string.lower(banner.content[1][data[3]]) ) ~=nil then 
	checksum = checksum+1; end --content name okay?
	
	if string.find(message, data[4] ) ~=nil then checksum = checksum+1; end --the digit okay?
	
	if string.find(message, string.lower(banner.color[0][data[5]]) ) ~=nil or string.find(message, string.lower(banner.color[1][data[5]]) ) ~=nil then 
	checksum = checksum+1; end --color okay?

	if checksum == 4 then --all 4 keywords said
		gText = "Ja, ich kann mir gut vorstellen dass sie so ein Wappen wollen. Allerdings scheinen sie sich während du unterwegs warst zerstritten zu haben, weil einige ihre Meinung zum Wappen doch wieder geändert haben. Das geht nun schon seit Wochen so... aber trotzdem danke für deine Mithilfe. Wenn Ihr wieder einen Auftrag braucht sagt bescheid.";
		eText = "Yes, I believe that's how they would want their emblem to look like. But it seems they've started to argue while you were travelling because some of them changed their minds on the layout again. It has been this way since weeks... nevertheless thank you for your help. Come back and talk to me again if you need another order.";
		outText=base.common.npcs.base.npcautofunction.GetNLS(originator,gText,eText); npcs.base.autonpcfunctions.NPCTalking(thisNPC,outText);
			--REWARD FOR QUEST 1 HERE--
			--rankpoints+coins--
			local PointsToGive = 14; --the amount of rankpoints the user earns for finishing this quest
			Factionvalues = BF_get(originator);
			if Factionvalues.tid == 0 then --char has no hometown
			    for i = 1, 3, 1 do   --give him 7 rankpoints in each town he is not banned
			        if Factionvalues[DigitToIndex[RANK_OFFSET+i]] ~= 0 then
			           Factionvalues[DigitToIndex[RANKPOINTS_OFFSET+i]] = Factionvalues[DigitToIndex[RANKPOINTS_OFFSET+i]] + (PointsToGive/2);
					end
				end
			else
				Factionvalues[DigitToIndex[RANKPOINTS_OFFSET+Factionvalues.tid]] = Factionvalues[DigitToIndex[RANKPOINTS_OFFSET+Factionvalues.tid]] +PointsToGive;
			end
			Factionvalues = BF_put(originator,Factionvalues);
            
			originator:createItem(3077,4,333,0); --create 4 silver coins
		--------------------
		originator:setQuestProgress(62,2); --change queststatus
		
		return true;
	elseif checksum>=1 then -- at least one keyword was correct
	    gText = "Ich kann mir nicht vorstellen das sie sowas wollten. Vielleicht fragst du sie nochmal nach, falls du dich nicht versprochen hast. Ich muss wissen wie das Wappen aussehen soll...die Form, Farbe, das Symbol und die Anzahl an Symbolen.";
		eText = "I can't imagine that they want something like this. Maybe you should go ask them again, if you didn't slip of the tongue. I need to know how the coat of arms shall look like...the shape, color, the symbol and the number of symbols that shall be embroidered.";
		outText=base.common.npcs.base.npcautofunction.GetNLS(originator,gText,eText); npcs.base.autonpcfunctions.NPCTalking(thisNPC,outText);
		return true;
	else return false; end
end

-- checks if char said a typical trigger like "yes", or "no"
function standardAnswer(message,answertype)
	if (answertype==1) then --answertype 1 == standardwords for "yes"
         if (string.find(message,"[Jj][ao]")~=nil or string.find(message,"[Yy]es")~=nil or
             string.find(message,"[Kk]lar")~=nil or string.find(message,"[Ss]icher")~=nil or
			 string.find(message,"[Ss]ure")~=nil) or string.find(message,"[Aa]ye")~=nil or
			 string.find(message,"[Yy]ubba")~=nil then
			 return true;
		 else
		     return false;
		 end

	elseif (answertype==2) then --answertype 2 == standardwords for "no"
		 if (string.find(message,"[Nn]ein")~=nil or string.find(message,"[Nn][oö]")~=nil or
			 string.find(message,"[Nn]ay")~=nil) or string.find(message,"[Nn]ubba")~=nil then
		    return true;
		 else
		    return false;
		 end
	elseif (answertype==3) then --standard phrases for quest 2
		 if (string.find(message,"[Jj]a")~=nil or string.find(message,"[Ss]toff")~=nil or
			 string.find(message,"[Nn]adel")~=nil or string.find(message,"[Mm]aterial")~=nil or
			 string.find(message,"[Nn]eedle")~=nil) or string.find(message,"[Cc]loth")~=nil or
			 string.find(message,"[Jj]o")~=nil or string.find(message,"[Yy]es")~=nil or
             string.find(message,"[Kk]lar")~=nil or string.find(message,"[Ss]icher")~=nil or
			 string.find(message,"[Ss]ure")~=nil or string.find(message,"[Aa]ye")~=nil then
		    return true;
		 else
		    return false;
		 end
	else
	    return false;
	end
end
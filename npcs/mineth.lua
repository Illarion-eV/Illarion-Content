-- INSERT INTO npc VALUES (nextval('npc_seq'),3,740,400,200,0,false,'Mineth','npc_mineth.lua',1);

require("npcs.base.autonpcfunctions")
dofile("quest_mineth.lua");

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

    QuestID = 62;
    AddCycleText("#me wirkt gestresst.","#me appears to be stressed out.");
    AddCycleText("#me schaut dich hilfesuchend an.","#me looks at you for help.");
    AddCycleText("#me murmelt: 'Oh je, oh je, was könnten Sie bloß wollen'.","#me mumbles: 'Oh dear, what could they want'.");
    --help--:
	--during quest 1
	AddTraderTrigger("Hilf","Weißt du schon was alle drei draufhaben wollen, falls ja sag es mir. Oder soll ich dir nochmal über die Mitglieder der Gilde etwas erzählen?");
    AddAdditionalTrigger("helf");
    AddCondition("qpg",">=",10000);
    AddCondition("qpg","<",19999);
    AddTraderTrigger("help","Do you know now what they want to have as coat of arms , tell me please if you know. Or shall I tell you again something about the members of the guild?");
    AddCondition("qpg",">=",10000);
    AddCondition("qpg","<",19999);
	-------------------
	--during quest 2
	AddTraderTrigger("Hilf","Bringt mir je 10 Stoffbahnen in den Farben Schwarz,Rot und Gelb und eine Nadel zum Nähen.");
    AddAdditionalTrigger("helf");
    AddCondition("qpg",">=",20000);
    AddCondition("qpg","<",29999);
    AddTraderTrigger("help","Bring me 10 cloth per color in the colors black, red and yellow and a needle for sewing.");
    AddCondition("qpg",">=",20000);
    AddCondition("qpg","<",29999);
	-------------------

	--to start quest 2
	AddTraderTrigger("Hilf","Also ich weiß zwar immernoch nicht was das Handelshaus für ein Wappen will, aber Ihr könntet mir schonmal die nötigen Materialien für später bringen. Bringt mir je 10 Stoffbahnen in den Farben Schwarz,Rot und Gelb und eine Nadel zum Nähen.");
    AddAdditionalTrigger("helf");
    AddAdditionalTrigger("aufgabe");
    AddAdditionalTrigger("quest");
    AddAdditionalTrigger("helf");
    AddCondition("lang","german");
    AddCondition("qpg","=",2);
    AddConsequence("qpg","=",20000);
    
    AddTraderTrigger("help","I still don't know what the trading house wants as his coat of arms, but you could already bring me some cloth for later. Bring me 10 cloth per color in the colors black, red and yellow and a needle for sewing.");
    AddAdditionalTrigger("task");
    AddAdditionalTrigger("quest");
    AddCondition("lang","english");
    AddCondition("qpg","=",2);
    AddConsequence("qpg","=",20000);
	--------------------

	--to start quest 1
	AddTraderTrigger("help","I have the order to embroider a coat of arms  for the trading house 'Trade Company', could you please talk to the members of the company, which are located in all 3 towns and ask them what they would like to see on it?");
    AddAdditionalTrigger("task");
    AddAdditionalTrigger("quest");
    AddCondition("lang","english");
    AddCondition("qpg","=",0);
    AddConsequence("inform","Keywords on which the woman could react: 'members', 'yes'");
    AddConsequence("state","=",1);
    
	AddTraderTrigger("hilf","Ich habe den Auftrag bekommen für das Handelshaus 'Trade Company' ein Wappen zu sticken, könntest du bitte für mich Ihre Mitglieder die in allen 3 großen Städten ansäßig sind fragen was sie so mögen?");
    AddAdditionalTrigger("aufgabe");
    AddAdditionalTrigger("quest");
    AddAdditionalTrigger("helf");
    AddCondition("lang","german");
    AddCondition("qpg","=",0);
    AddConsequence("inform","Stichwörter auf die die Frau reagieren könnte: 'Mitglieder', 'Ja'");
    AddConsequence("state","=",1);
    -------------------
    
	AddTraderTrigger("Mitglied","Naja, eigentlich kenne ich nur einen von denen gut, er heißt 'Jonathan Cyrus' und arbeitet als Händler in Cadomyr. Vielleicht kann er dir ja den Namen der anderen beiden Gildenmitglieder nennen. Ich muss wissen wie das Wappen aussehen soll...die Form, Farbe, das Symbol und die Anzahl an Symbolen.");
    AddCondition("qpg",">",0);
    
	AddTraderTrigger("Member","Well, in fact I know only one of them, his name is 'Jonathan Cyrus' and he works as trader in Cadomyr. Maybe he can tell you the names of the other two guild members. I need to know how the coat of arms shall look like...the shape, color, the symbol and the number of symbols that shall be embroidered.");
    AddCondition("qpg",">",0);
    
	AddTraderTrigger("Mitglied","Du musst erstmal den Auftrag annehmen, erst dann sag ich dir die Namen der Leute die du suchen musst. Also, willst du den Auftrag annehmen?");
    AddCondition("qpg","=",0);
    
	AddTraderTrigger("Member","I'll tell you the names of the people you have to look for after you have accepted this order. So, do you accept the order?");
    AddCondition("qpg","=",0);
    
    -------------QUESTSTATUS 0: Char meets npc for the first time
	AddTraderTrigger("Hello","Hello stranger, could you please help me?");
    AddAdditionalTrigger("Greetings");
    AddAdditionalTrigger("Be greeted");
    AddAdditionalTrigger("Hail");
    AddAdditionalTrigger("Good day");
    AddAdditionalTrigger("Good morning");
    AddAdditionalTrigger("Good evening");
    AddCondition("qpg","=",0);
    AddAdditionalText("Be greeted, the gods sent you, I need your help.");
    AddAdditionalText("Greetings, I could need your help.");
    AddConsequence("inform","Maybe you should ask her if she has a 'task' or 'quest' for you.");
    
	AddTraderTrigger("Grüße","Grüße Fremder, könntet Ihr mir bitte helfen?");
    AddAdditionalTrigger("Gruß");
    AddAdditionalTrigger("Seid gegrüßt");
    AddAdditionalTrigger("Guten Tag");
    AddAdditionalTrigger("Guten Abend");
    AddAdditionalTrigger("Mahlzeit");
    AddAdditionalTrigger("Tach");
    AddAdditionalTrigger("Moin");
    AddCondition("qpg","=",0);
    AddAdditionalText("Seid gegrüßt, die Götter schicken euch, ich benötige eure Hilfe");
    AddAdditionalText("Grüße, ich könnte eure Hilfe gebrauchen.");
    AddConsequence("inform","Vielleicht solltest du Sie fragen ob sie eine 'Aufgabe' oder 'Queste' für dich hat.");
    
	AddTraderTrigger("Hiho","Hello stranger, could you please help me?");
    AddAdditionalTrigger("Hallo");
    AddAdditionalTrigger("Hey");
    AddAdditionalTrigger("Greebas");
    AddAdditionalTrigger("Greebs");
    AddCondition("lang","english");
    AddCondition("qpg","=",0);
    AddAdditionalText("Be greeted, the gods sent you, I need your help.");
    AddAdditionalText("Greetings, I could need your help.");
    AddConsequence("inform","Maybe you should ask her if she has a 'task' or 'quest' for you.");
    
	AddTraderTrigger("Hiho","Grüße Fremder, könntet Ihr mir bitte helfen?");
    AddAdditionalTrigger("Hallo");
    AddAdditionalTrigger("Hey");
    AddAdditionalTrigger("Greebas");
    AddAdditionalTrigger("Greebs");
    AddCondition("lang","german");
    AddCondition("qpg","=",0);
    AddAdditionalText("Seid gegrüßt, die Götter schicken euch, ich benötige eure Hilfe");
    AddAdditionalText("Grüße, ich könnte eure Hilfe gebrauchen.");
    AddConsequence("inform","Vielleicht solltest du Sie fragen ob sie eine 'Aufgabe' oder 'Queste' für dich hat.");
    -------------------------------------------------------
	-------------------hello during quest 2-------
	AddTraderTrigger("Grüße","Ah, da seid ihr ja wieder. Habt ihr die Stoffrollen und die Nadel für mich dabei?");
    AddAdditionalTrigger("Gruß");
    AddAdditionalTrigger("Seid gegrüßt");
    AddAdditionalTrigger("Guten Tag");
    AddAdditionalTrigger("Guten Abend");
    AddAdditionalTrigger("Mahlzeit");
    AddAdditionalTrigger("Tach");
    AddAdditionalTrigger("Moin");
    AddAdditionalTrigger("Hallo");
    AddAdditionalTrigger("Hey");
    AddAdditionalTrigger("Greebas");
    AddAdditionalTrigger("Greebs");
    AddCondition("lang","german");
    AddCondition("qpg",">=",20000);
    AddCondition("qpg","<",29999);
    AddAdditionalText("Seid gegrüßt! Habt ihr die Stoffrollen und die Nadel für mich dabei?");
    AddAdditionalText("Zum Gruße, habt ihr die Stoffrollen und die Nadel für mich dabei?");

	AddTraderTrigger("Hello","Ah you're back again. Do you have the cloth and the needle with you?");
    AddAdditionalTrigger("Greetings");
    AddAdditionalTrigger("Be greeted");
    AddAdditionalTrigger("Hail");
    AddAdditionalTrigger("Good day");
    AddAdditionalTrigger("Good morning");
    AddAdditionalTrigger("Good evening");
    AddAdditionalTrigger("Hallo");
    AddAdditionalTrigger("Hey");
    AddAdditionalTrigger("Hiho");
    AddAdditionalTrigger("Greebas");
    AddAdditionalTrigger("Greebs");
    AddCondition("lang","english");
    AddCondition("qpg",">=",20000);
    AddCondition("qpg","<",29999);
    AddAdditionalText("Be greeted! Do you have the cloth and the needle with you?");
    AddAdditionalText("Greetings, do you have the cloth and the needle with you?");
	-------------------------------
	--------------after Quests
	AddTraderTrigger("Grüße","Ah, ihr schon wieder. Seid gegrüßt.");
    AddAdditionalTrigger("Gruß");
    AddAdditionalTrigger("Seid gegrüßt");
    AddAdditionalTrigger("Guten Tag");
    AddAdditionalTrigger("Guten Abend");
    AddAdditionalTrigger("Mahlzeit");
    AddAdditionalTrigger("Tach");
    AddAdditionalTrigger("Moin");
    AddAdditionalTrigger("Hallo");
    AddAdditionalTrigger("Hey");
    AddAdditionalTrigger("Greebas");
    AddAdditionalTrigger("Greebs");
    AddCondition("lang","german");
    AddAdditionalText("Seid gegrüßt!");
    AddAdditionalText("Zum Gruße");

	AddTraderTrigger("Hello","Ah you again. Be greeted.");
    AddAdditionalTrigger("Greetings");
    AddAdditionalTrigger("Be greeted");
    AddAdditionalTrigger("Hail");
    AddAdditionalTrigger("Good day");
    AddAdditionalTrigger("Good morning");
    AddAdditionalTrigger("Good evening");
    AddAdditionalTrigger("Hallo");
    AddAdditionalTrigger("Hey");
    AddAdditionalTrigger("Hiho");
    AddAdditionalTrigger("Greebas");
    AddAdditionalTrigger("Greebs");
    AddCondition("lang","english");
    AddAdditionalText("Be greeted!");
    AddAdditionalText("Greetings.");

	AddTraderTrigger("Farewell","Bye");
    AddAdditionalTrigger("Good bye");
    AddAdditionalTrigger("Bye");
    AddAdditionalTrigger("Fare thy well");
    AddAdditionalText("Goodbye");
    AddAdditionalText("Farewell");
    
	AddTraderTrigger("Tschüß","Bis bald.");
    AddAdditionalTrigger("Tschüss");
    AddAdditionalTrigger("Wiedersehen");
    AddAdditionalTrigger("Gehabt euch wohl");
    AddAdditionalText("Auf bald.");
    AddAdditionalText("Die Götter mit euch!");
    
	AddTraderTrigger("Ciao","Bye");
    AddAdditionalTrigger("Adieu");
    AddAdditionalTrigger("Au revoir");
    AddCondition("lang","english");
    AddAdditionalText("Goodbye");
    AddAdditionalText("Farewell");
    
	AddTraderTrigger("Ciao","Bis bald.");
    AddAdditionalTrigger("Adieu");
    AddAdditionalTrigger("Au revoir");
    AddCondition("lang","german");
    AddAdditionalText("Auf bald.");
    AddAdditionalText("Die Götter mit euch!");
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
            	TellSmallTalk(message,originator);
			end

		else
            Confused(
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
			createQuestID(originator);
			gText="Vielen vielen Dank. Ich muss wissen wie das Wappen aussehen soll...die Form, Farbe, das Symbol und die Anzahl an Symbolen.";
			eText="Many many thanks. I need to know how the coat of arms  shall look like...the shape, color, the symbol and the number of symbols that shall be embroidered.";
			outText=base.common.GetNLS(originator,gText,eText); NPCTalking(thisNPC,outText);
			return true;
		end
	elseif standardAnswer(message,2) and NPCStatus[originator.id] ==1 then
			NPCStatus[originator.id]=0;
			gText="Ihr lasst eine hübsche Dame wie mich im Stich - schämt euch!";
			eText="You forsake a beautiful woman like me - shame on you!";
			outText=base.common.GetNLS(originator,gText,eText); NPCTalking(thisNPC,outText);
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
	
	local questdata = split_questdata(originator);
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
			outText=base.common.GetNLS(originator,gText,eText); NPCTalking(thisNPC,outText);
			
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
			outText=base.common.GetNLS(originator,gText,eText); NPCTalking(thisNPC,outText);
			 
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
	data = split_questdata(originator);
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
		outText=base.common.GetNLS(originator,gText,eText); NPCTalking(thisNPC,outText);
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
		outText=base.common.GetNLS(originator,gText,eText); NPCTalking(thisNPC,outText);
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
--Name:        Arkil
--Race:        Human
--Town:        ???
--Function:    Miniquestgiver 1

dofile("npc_functions.lua")

function useNPC(user,counter,param)
    local lang=user:getPlayerLanguage();
    thisNPC:increaseSkill(1,"common language",100);
    if (lang==0) then thisNPC:talk(CCharacter.say, "He, nicht kitzeln!") end
    if (lang==1) then thisNPC:talk(CCharacter.say, "Hey, don't tickle me!") end
end

function initializeNpc()
    InitTalkLists();
    npcstatus={};
	
    AddTraderTrigger("[Gg]r[üue]+[sß]","Seid Gegrüßt"); -- Fügt Triggertext mit Antwort hinzu
    AddAdditionalTrigger("[Hh]allo");          -- Fügt zu letztem "AddTraderTrigger" zusätzlichen Triggertext hinzu
    AddAdditionalText("Guten Tag");    -- Fügt zu letztem "AddTraderTrigger" zusätzliche Antwort hinzu
    AddTraderTrigger("[Gg]reetings","Hail"); -- Fügt Triggertext mit Antwort hinzu
    AddAdditionalTrigger("[Hh]ello");          -- Fügt zu letztem "AddTraderTrigger" zusätzlichen Triggertext hinzu
    AddAdditionalText("Good day");
    AddTraderTrigger("[Ww]ho ",thisNPC.name.." is my name.");
    AddTraderTrigger("[Ww]er ",thisNPC.name..", ist mein Name.");
    AddTraderTrigger("[Bb]ye.","Farewell.");
    AddAdditionalTrigger("[Ff]arewell");
    AddTraderTrigger("[Aa]uf.+[Bb]ald","Lebt wohl.");
    AddAdditionalTrigger("[Bb]is.+[Bb]ald");
    
    
    AddCycleText("#me kramt verzweifelt in seinen Taschen","#me searches his pockets."); -- Fügt Text der alle paar Min gesagt wird hinzu
    
    
    
    TradSpeakLang={0,1,4};  -- Sprache die der NPC spricht
    TradStdLang=0;          -- Sprache die der NPC normalerweise spricht
    --common language=0
    --human language=1
    --dwarf language=2
    --elf language=3
    --lizard language=4
    --orc language=5
    --halfling language=6
    --fairy language=7
    --gnome language=8
    --goblin language=9
    --ancient language=10
end
    
function nextCycle()  -- ~10 times per second
    if (TraderFirst == nil) then
        initializeNpc();
        increaseLangSkill(TradSpeakLang)
        thisNPC.activeLanguage=TradStdLang;
    end
    SpeakerCycle();
end	

function receiveText(texttype, message, originator)
    if BasicNPCChecks(originator,2) then
        if (LangOK(originator,TradSpeakLang)==true) then
            thisNPC.activeLanguage=originator.activeLanguage;
            normalerweise=true;
			if (((string.find(message,"[Gg]reetings")~=nil) or (string.find(message,"[Hh]ello")~=nil)or (string.find(message,"[Gg]r[üue]+[sß]")~=nil)or (string.find(message,"[Hh]allo")~=nil)) and (originator:getQuestProgress(735)==1)) then
				gText="Seid gegrüßt! Habt ihr mein Schwert schon gefunden?";
				eText="Greetings! Have you found my sword?";
				outText=GetNLS(originator,gText,eText);
				thisNPC:talk(CCharacter.say,outText);
				npcstatus[originator.id]=2;
				normalerweise=false;
			end
			if (((string.find(message,"[Hh]elp")~=nil) or (string.find(message,"[Hh]ilfe")~=nil)) and (originator:getQuestProgress(735)==0)) then
				originator:inform("QuestID:"..originator:getQuestProgress(735));
				gText="Ich suche mein Schwert, hilfst du mir es zu finden?";
				eText="I lost my sword, can u help me find it?";
				outText=GetNLS(originator,gText,eText);
				thisNPC:talk(CCharacter.say,outText);
				npcstatus[originator.id]=1;
			end
			-- hilfe anbieten ja/nein
			if (((string.find(message,"[Yy]es")~=nil)or(string.find(message,"[Jj]a")~=nil)) and (npcstatus[originator.id]==1)) then
				gText="Sehr gut, Ich habs blabla verloren.";
				eText="Blaenglischertext";
				outText=GetNLS(originator,gText,eText);
				thisNPC:talk(CCharacter.say,outText);
				npcstatus[originator.id]=0;
				originator:setQuestProgress( 735,1);
			end
			if (((string.find(message,"[Nn]o ")~=nil)or(string.find(message,"[Nn]ein")~=nil)) and (npcstatus[originator.id]==1)) then
				gText="Dann verschwendet meine Zeit nicht weiter.";
				eText="Don't steal my time.";
				outText=GetNLS(originator,gText,eText);
				thisNPC:talk(CCharacter.say,outText);
				npcstatus[originator.id]=0;
			end
			--Schwert gefunden ja/nein
			if (((string.find(message,"[Yy]es")~=nil)or(string.find(message,"[Jj]a")~=nil)) and (npcstatus[originator.id]==2)) then
				if (true) then --schwert im inventar
					gText="Ihr habt es gefunden! ich danke euch, hier nehmt etwas Gold für eure Mühe.";
					eText="You found it! Thanks a lot, here take some gold.";
					outText=GetNLS(originator,gText,eText);
					thisNPC:talk(CCharacter.say,outText);
					--Schwert löschen + geld geben
					gText="#me nimmt 5 Gold entgegen.";
					eText="#me takes 5 gold.";
					outText=GetNLS(originator,gText,eText);
					originator:talk(CCharacter.say,outText);
					originator:setQuestProgress(735,2);
				else
					gText="Sehr gut, Ich habs blabla verloren.";
					eText="Blaenglischertext";
					outText=GetNLS(originator,gText,eText);
					thisNPC:talk(CCharacter.say,outText);
				end
				npcstatus[originator.id]=0;
			end
			if (((string.find(message,"[Nn]o ")~=nil)or(string.find(message,"[Nn]ein")~=nil)) and (npcstatus[originator.id]==2)) then
				gText="Dann verschwendet meine Zeit nicht weiter.";
				eText="Don't waste my time.";
				outText=GetNLS(originator,gText,eText);
				thisNPC:talk(CCharacter.say,outText);
				npcstatus[originator.id]=0;
			end
        else
            if (verwirrt==false) then
                gText="#me schein verwirrt zu sein.";
                eText="#me seems to be confused.";
                outText=GetNLS(originator,gText,eText);
                thisNPC:talk(CCharacter.say,outText);
                verwirrt=true;
				normalerweise=false;
            end
        end
		
		if (normalerweise==true) then  TellSmallTalk(message); end
    end
end--function
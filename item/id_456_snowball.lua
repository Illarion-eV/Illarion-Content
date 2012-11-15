-- UPDATE common SET com_script='item.id_456_snowball' WHERE com_itemid IN (456);
require("base.common")


module("item.id_456_snowball", package.seeall)

function MoveItemAfterMove(User, SourceItem, TargetItem)
	if Round==nil then
		Round=1;
	end
	if Round==1 then
        User:talkLanguage(Character.say,Player.german,"#me wirft einen Schneeball.");
        User:talkLanguage(Character.say,Player.english,"#me throws a snowball.");
		Round=2;
	else
		Round=nil;
	end
end

function UseItem(User,SourceItem,TargetItem,Counter,Param,ltstate)

    local teacherEN; local teacherDE
	local questId
	if SourceItem.pos == position(1,1,0) or SourceItem.id == 456 then
	    teacherEN = "Knowing Tree"
		teacherDE = "der Wissende Baum"
		questId = 350
	elseif SourceItem.pos == postion(2,1,0) then
	    teacherEN = "Thinking Stone"
		teacherDE = "der Denkende Stein"
	    questId = 351
	else
        teacherEN = "Recognizing Spring"	
		teacherDE = "die Erkennende Quelle"
		questId = 352
	end         
	
	local qstPrg = User:getQuestProgress(questId)
	if qstPrg == 0 then
	    qstPrg = 1
		User:setQuestProgress(questId,qstPrg)
	end
	
	if qstPrg == 1 then
	    
		SendMessage(User, 
		            "You hear a voice, but you cannot tell from where it comes. Maybe it's even just in your head and it says: \"I am the "..teacherEN..". I help those who wish to enter the world of fine matter. If you want to learn about the great secret of alchemy, fullfill my tasks. Go and bring me five "..HerbsTaskOneNameEN[teacherEN][1]..", five "..HerbsTaskOneNameEN[teacherEN][2].." and five "..HerbsTaskOneNameEN[teacherEN][3]..". If you have them, touch me with and you will have my attention.\"", 
					"Du vernimmst eine Stimme, von der du nicht sagen kannst, woher sie kommt, oder ob sie vielleicht auch nur in deinem Kopf ist und sie spricht: \"Ich bin "..teacherDE..". Ich helfe jenen, die die Welt der Feinstofflichkeit betreten zu wollen. Willst du also das große Geheimnis der Alchmie erfahren, erfülle meine erste Prüfungen. Geh und bringe mir fünf "..HerbsTaskOneNameDE[teacherEN][1]..", fünf "..HerbsTaskOneNameDE[teacherEN][2].." und fünf "..HerbsTaskOneNameDE[teacherEN][3]..". Wenn du sie hast, berühre mich und du wirst meine Aufmerksamkeit haben.\"",
					teacherEN
					);
		User:setQuestProgress(questId,2)
	    
	elseif qstPrg == 2 then
	    
		if (User:countItem(HerbsTaskOneId[teacherEN][1]) < 5) or (User:countItem(HerbsTaskOneId[teacherEN][2]) < 5) or (User:countItem(HerbsTaskOneId[teacherEN][3]) < 5) then
		    SendMessage(User, 
			            "Once again you hear the voice about which source you are still unsure: \"Oh, you are back! You don't have all the herbs I asked you for, though. I asked for five "..HerbsTaskOneNameEN[teacherEN][1]..", five "..HerbsTaskOneNameEN[teacherEN][2].." and five "..HerbsTaskOneNameEN[teacherEN][3]..". Go and bring them to me if you want to learn the great alchemical secret!\"", 
						"Wieder vernimmst du die Stimme, deren Ursprung dir nicht klar ist: \"Oh, du bist zurück! Du hast aber nicht all die Kräuter, um die ich dich bat. Es waren fünf "..HerbsTaskOneNameDE[teacherEN][1]..", fünf "..HerbsTaskOneNameDE[teacherEN][2].." und fünf "..HerbsTaskOneNameDE[teacherEN][3]..". Geh und bring sie mir, wenn du das alchemistische Geheminis erfahren willst!\"",
						teacherEN
						);
			return
		else
		    SendMessage(User, 
			           HerbsDeleteTextEN[teacherEN][1].." For a short amount fo time it seems as if someone would smack their lips, then the voice says: \"Good, very good. But there is an other task for you left. Now bring me two rar herbs - "..HerbsTaskTwoNameEN[teacherEN][1].." and "..HerbsTaskTwoNameEN[teacherEN][2]..". Be successfull and you are a step closer to your goal.", 
					   HerbsDeleteTextDE[teacherEN][1].." Für einen Moment glaubst du etwas wie ein Schmatzen zu hören, bevor die Stimme erklingt: \"Sehr gut, sehr gut. Aber es erwartet dich noch eine Aufgabe. Nun sollst du mir zwei seltene Kräuter bringen und zwar "..HerbsTaskTwoNameDE[teacherEN][1].." und "..HerbsTaskTwoNameDE[teacherEN][2]..". Sei erfolgreich und du bist deinem Ziel ein Stück näher.",
					   teacherEN
					   );
			User:eraseItem(HerbsTaskOneId[teacherEN][1],5)
			User:eraseItem(HerbsTaskOneId[teacherEN][2],5)
			User:eraseItem(HerbsTaskOneId[teacherEN][3],5)
		    User:setQuestProgress(questId,3)
		end    
	
	elseif qstPrg == 3 then
	
	    if (User:countItem(HerbsTaskTwoId[teacherEN][1]) < 1) then
	        SendMessage(User, 
			            "\"Oh! You don't have the herbs. If you have forgotten what you are supposed to get - "..HerbsTaskTwoNameEN[teacherEN][1].." and "..HerbsTaskTwoNameEN[teacherEN][2]..".\"", 
						"\"Sowas! Du hast die Kräuter nicht dabei. Falls du es vergessen hast - "..HerbsTaskTwoNameDE[teacherEN][1].." and "..HerbsTaskTwoNameDE[teacherEN][2]..".\"",
						teacherEN
						);
            return
	    else
		    User:setQuestProgress(questId,4)
			SendMessage(User, 
			            HerbsDeleteTextEN[teacherEN][1].." For a moment you believe to hear something like: \"Delicious, mh, so delicious...\" Then you hear the familiar voice: \"Yes, you solved this task. Now I have to ask you some questions. When you have answered three, I will tell you the secret of alchemy.\"", 
						HerbsDeleteTextDE[teacherEN][1].." Einen Moment lang glaubst du ein Murmeln zu hören: \"Lecker, mh, so lecker...\" Dann erklingt die Stimme wieder auf bekannte Weise: \"Ja, du hast diese Aufgabe bestanden. Als nächstes muss ich dir einige Fragen stellen. Sobald du mir drei beantworten konntest, werde ich dir das Geheimnis verraten.\"",
						teacherEN,
						true
						);
            User:eraseItem(HerbsTaskTwoId[teacherEN][1],1)
			User:eraseItem(HerbsTaskTwoId[teacherEN][2],1)
		end		
    
	elseif qstPrg >= 4 and qstPrg <= 6 then
	    
		local questionsTriggerEN; local questionsTriggerDE
		if qstPrg == 4 then
		    questionTriggerEN = "three questions"; questionTriggerDE = "drei Fragen"
		elseif qstPrg == 5 then
		    questionTriggerEN = "two questions"; questionTriggerDE = "zwei Fragen"
		else
		    questionTriggerEN = "one question"; questionTriggerDE = "eine Frage"
	    end
	    SendMessage(User, 
			            "Once again you hear the voice you already have heard often before: \"You still have to answer "..questionTriggerEN..", then you will leran the secret of alchemy.\"",
						"Erneut erklingt die dir mittlerweile bekannte Stimme: \"Du hast mir noch "..questionTriggerDE.." zu beantworten, dann wirst du das Geheimnis der Alchemie erfahren.\"",
						teacherEN,
						true
						);
	end
end	

function AskQuestion(User,teacherEN)
 
    local titleDE; local titleEN
	local questId
	if teacherEN == "Knowing Tree" then
	    titleDE = "Der Wissende Baum" 
		titleEN = "The Knowing Tree"
	    questId = 350
	elseif teacherEN == "Thinking Stone" then
        titleDE = "Der Denkende Stein" 
        titleEN = "The Thinking Stone"
        questId = 351
	else
        titleDE = "Die Erkennende Quelle"
        titleEN = "The Recognizing Spring"		
	    questId = 352
	end   
	local difficulty = User:getQuestProgress(questId) - 3
	local question; local questionList
	local answer; local answerList
	local rnd = math.random(10)
	local title
	if User:getPlayerLanguage() == 0 then
	    questionList = questionDE[difficulty][rnd]
	    User:inform(""..questionList[1])
		answerList = answerDE[difficulty][rnd]
	    title = titleDE
	else 
	    questionList = questionEN[difficulty][rnd]
		answerList = answerEN[difficulty][rnd]
		title = titleEN
	end
	for i=1,3 do
		if questionList[i] ~= nil then
			question = questionList[i]
			answer = answerList[i]
			break
		end	
	end
	local callback = function(dialog)
		success = dialog:getSuccess()
		if success then
			selectedAnswer = (dialog:getSelectedIndex())+1
			if answerList[selectedAnswer] == answer then
			    User:setQuestProgress(questId, (User:getQuestProgress(questId) +1) )
				if difficulty == 3 then
				    TurnIntoAlchemist(User,teacherEN)
				else
                    User:inform("richtige antwort. text einfügen. zum alchemisten machen.")
			else
                SendMessage(User, 
				            "\"That was the wrong answer. Let's try an other one.\"", 
							"\"Das war die falsche Antwort. Versuchen wir es mit einer anderen.\"", 
							teacherEN, 
							true)
            end				
		else
			SendMessage(User, 
						"\"Come back to finish the questions whenever you want.\"", 
						"Das war die falsche Antwort. Versuchen wir es mit einer anderen.", 
						teacherEN, 
						false)
		end
	end
	local dialog = SelectionDialog(title, question, callback)
	for i=1,#answerList do
		dialog:addOption(15, answerList[i])
	end
	User:requestSelectionDialog(dialog)
end
		
function SendMessage(User, textEN, textDE, teacherEN, questionTrigger)
    
	local titleDE; local titleEN
	local questId
	if teacherEN == "Knowing Tree" then
	    titleDE = "Der Wissende Baum" 
		titleEN = "The Knowing Tree"
	    questId = 350
	elseif teacherEN == "Thinking Stone" then
        titleDE = "Der Denkende Stein" 
        titleEN = "The Thinking Stone"
        questId = 351
	else
        titleDE = "Die Erkennende Quelle"
        titleEN = "The Recognizing Spring"		
	    questId = 352
	end           
	
	local callback = function(dialog) 
	    if questionTrigger then
		    User:inform("debug 3")
			AskQuestion(User,teacherEN)
	    end
	end
	if User:getPlayerLanguage() == 0 then
	    dialog = MessageDialog(titleDE, textDE, callback)
	else
      	dialog = MessageDialog(titleEN, textEN, callback)
	end
    User:requestMessageDialog(dialog)
end	
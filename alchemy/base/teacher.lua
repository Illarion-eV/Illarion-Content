require("base.common");
module("alchemy.base.teacher", package.seeall)

-- This script turns a character into an alchemist. 
-- Three 'beings' can do that: Knowing Tree (Galmair), Thinking Stone (Cadomyr), Recognizing Spring(Runewick)
-- Three tasks have to be fullfilled: Bring 5*3 normal herbs; bring 1*2 rar herbs; answer three questions

------------------------------------------- LISTS ------------------------------------------------------
-- TASK ONE: three normal herbs
HerbsTaskOneId = {}
HerbsTaskOneNameEN = {}
HerbsTaskOneNameDE = {}

HerbsTaskOneId["Knowing Tree"] =   {133  ,  81, 140}
HerbsTaskOneNameEN["Knowing Tree"] = {"sonnenkraut","beeren","donfblatt"}
HerbsTaskOneNameDE["Knowing Tree"] = {"1","2","3"}

HerbsTaskOneId["Thinking Stone"] =   {7,5,6}
HerbsTaskOneNameEN["Thinking Stone"] = {"4","5","6"}
HerbsTaskOneNameDE["Thinking Stone"] = {"4","5","6"}

HerbsTaskOneId["Recognizing Spring"] = {7,8,9}
HerbsTaskOneNameEN["Recognizing Spring"] = {"7","8","9"}
HerbsTaskOneNameDE["Recognizing Spring"] = {"7","8","9"}
-- TASK ONE END --

-- TASK TWO: two normal herbs 
HerbsTaskTwoId = {}
HerbsTaskTwoNameEN = {}
HerbsTaskTwoNameDE = {}

HerbsTaskTwoId["Knowing Tree"] =   {756,755}
HerbsTaskTwoNameEN["Knowing Tree"] = {"frommbeere","feuerwurz"}
HerbsTaskTwoNameDE["Knowing Tree"] = {"1","2"}

HerbsTaskTwoId["Thinking Stone"] =   {4,5}
HerbsTaskTwoNameEN["Thinking Stone"] = {"4","5"}
HerbsTaskTwoNameDE["Thinking Stone"] = {"4","5"}

HerbsTaskTwoId["Recognizing Spring"] = {7,8}
HerbsTaskTwoNameEN["Recognizing Spring"] = {"7","8"}
HerbsTaskTwoNameDE["Recognizing Spring"] = {"7","8"}
-- TASK TWO END --

-- deleting the herbs --
HerbsDeleteTextDE = {}
HerbsDeleteTextEN = {}

HerbsDeleteTextDE["Knowing Tree"] = {"Eine Windböe erfasst die Kräuter und trägt sie in die Krone des Baumes."}
HerbsDeleteTextDE["Thinking Stone"] = {"Wie von selbst fallen die Kräuter aus deiner Hand und verschwinden in einem Strudel von Sand."}
HerbsDeleteTextDE["Recognizing Spring"] = {"Ein Schwall von Wasser erhebt sich aus der Quelle und spült die Kräuter aus deiner Hand, welche im Wasse verschwinden." }

HerbsDeleteTextEN["Knowing Tree"] = {"A gust of wind gets hold of the herbs and carries them into the treetop."}
HerbsDeleteTextEN["Thinking Stone"] = {"As if they had an own will, the herbs fall out of your hand and disappear in a small sand vortex."}
HerbsDeleteTextEN["Recognizing Spring"] = {"A wave raises from the spring and flushes the herbs from your hand, which disappear in the water."}
-- deleting END --

-- question and answer lists --
-- questionAnswerList[language('"german"' or '"english"')]['"question"' or '"answer"'][difficulty(1 to 3)][questionID(1 to 10)]
questionAnswerList            = {}
questionAnswerList["german"]  = {} 
questionAnswerList["english"] = {}

questionAnswerList["german"]["question"]  = {}
questionAnswerList["english"]["question"] = {}
questionAnswerList["german"]["answer"]    = {}
questionAnswerList["english"]["answer"]   = {}

for i=1,3 do -- create the lists with difficulty level
	questionAnswerList["german"]["question"][i]  = {}
	questionAnswerList["english"]["question"][i] = {}
	questionAnswerList["german"]["answer"][i]    = {}
	questionAnswerList["english"]["answer"][i]   = {}
end	

-- questions and answers; note: one question and three answers, !!! the first answer ins the list of answers is the correct answer !!!
-- difficulty 1: 
questionAnswerList["german"]["question"][1][1]  = {"f"}
questionAnswerList["english"]["question"][1][1] = {"q"}
questionAnswerList["german"]["answer"][1][1]  = {"a1","a2","a3"} 
questionAnswerList["english"]["answer"][1][1] = {"a1","a2","a3"}

questionAnswerList["german"]["question"][1][2]  = {"f"}
questionAnswerList["english"]["question"][1][2] = {"q"}
questionAnswerList["german"]["answer"][1][2]  = {"a1","a2","a3"} 
questionAnswerList["english"]["answer"][1][2] = {"a1","a2","a3"}

questionAnswerList["german"]["question"][1][3]  = {"f"}
questionAnswerList["english"]["question"][1][3] = {"q"}
questionAnswerList["german"]["answer"][1][3]  = {"a1","a2","a3"} 
questionAnswerList["english"]["answer"][1][3] = {"a1","a2","a3"}

questionAnswerList["german"]["question"][1][4]  = {"f"}
questionAnswerList["english"]["question"][1][4] = {"q"}
questionAnswerList["german"]["answer"][1][4]  = {"a1","a2","a3"} 
questionAnswerList["english"]["answer"][1][4] = {"a1","a2","a3"}

questionAnswerList["german"]["question"][1][5]  = {"f"}
questionAnswerList["english"]["question"][1][5] = {"q"}
questionAnswerList["german"]["answer"][1][5]  = {"a1","a2","a3"} 
questionAnswerList["english"]["answer"][1][5] = {"a1","a2","a3"}

questionAnswerList["german"]["question"][1][6]  = {"f"}
questionAnswerList["english"]["question"][1][6] = {"q"}
questionAnswerList["german"]["answer"][1][6]  = {"a1","a2","a3"} 
questionAnswerList["english"]["answer"][1][6] = {"a1","a2","a3"}

questionAnswerList["german"]["question"][1][7]  = {"f"}
questionAnswerList["english"]["question"][1][7] = {"q"}
questionAnswerList["german"]["answer"][1][7]  = {"a1","a2","a3"} 
questionAnswerList["english"]["answer"][1][7] = {"a1","a2","a3"}

questionAnswerList["german"]["question"][1][8]  = {"f"}
questionAnswerList["english"]["question"][1][8] = {"q"}
questionAnswerList["german"]["answer"][1][8]  = {"a1","a2","a3"} 
questionAnswerList["english"]["answer"][1][8] = {"a1","a2","a3"}

questionAnswerList["german"]["question"][1][9]  = {"f"}
questionAnswerList["english"]["question"][1][9] = {"q"}
questionAnswerList["german"]["answer"][1][9]  = {"a1","a2","a3"} 
questionAnswerList["english"]["answer"][1][9] = {"a1","a2","a3"}

questionAnswerList["german"]["question"][1][10]  = {"f"}
questionAnswerList["english"]["question"][1][10] = {"q"}
questionAnswerList["german"]["answer"][1][10]  = {"a1","a2","a3"} 
questionAnswerList["english"]["answer"][1][10] = {"a1","a2","a3"}

-- difficulty 2:
questionAnswerList["german"]["question"][2][1]  = {"f"}
questionAnswerList["english"]["question"][2][1] = {"q"}
questionAnswerList["german"]["answer"][2][1]  = {"a1","a2","a3"} 
questionAnswerList["english"]["answer"][2][1] = {"a1","a2","a3"}

questionAnswerList["german"]["question"][2][2]  = {"f"}
questionAnswerList["english"]["question"][2][2] = {"q"}
questionAnswerList["german"]["answer"][2][2]  = {"a1","a2","a3"} 
questionAnswerList["english"]["answer"][2][2] = {"a1","a2","a3"}

questionAnswerList["german"]["question"][2][3]  = {"f"}
questionAnswerList["english"]["question"][2][3] = {"q"}
questionAnswerList["german"]["answer"][2][3]  = {"a1","a2","a3"} 
questionAnswerList["english"]["answer"][2][3] = {"a1","a2","a3"}

questionAnswerList["german"]["question"][2][4]  = {"f"}
questionAnswerList["english"]["question"][2][4] = {"q"}
questionAnswerList["german"]["answer"][2][4]  = {"a1","a2","a3"} 
questionAnswerList["english"]["answer"][2][4] = {"a1","a2","a3"}

questionAnswerList["german"]["question"][2][5]  = {"f"}
questionAnswerList["english"]["question"][2][5] = {"q"}
questionAnswerList["german"]["answer"][2][5]  = {"a1","a2","a3"} 
questionAnswerList["english"]["answer"][2][5] = {"a1","a2","a3"}

questionAnswerList["german"]["question"][2][6]  = {"f"}
questionAnswerList["english"]["question"][2][6] = {"q"}
questionAnswerList["german"]["answer"][2][6]  = {"a1","a2","a3"} 
questionAnswerList["english"]["answer"][2][6] = {"a1","a2","a3"}

questionAnswerList["german"]["question"][2][7]  = {"f"}
questionAnswerList["english"]["question"][2][7] = {"q"}
questionAnswerList["german"]["answer"][2][7]  = {"a1","a2","a3"} 
questionAnswerList["english"]["answer"][2][7] = {"a1","a2","a3"}

questionAnswerList["german"]["question"][2][8]  = {"f"}
questionAnswerList["english"]["question"][2][8] = {"q"}
questionAnswerList["german"]["answer"][2][8]  = {"a1","a2","a3"} 
questionAnswerList["english"]["answer"][2][8] = {"a1","a2","a3"}

questionAnswerList["german"]["question"][2][9]  = {"f"}
questionAnswerList["english"]["question"][2][9] = {"q"}
questionAnswerList["german"]["answer"][2][9]  = {"a1","a2","a3"} 
questionAnswerList["english"]["answer"][2][9] = {"a1","a2","a3"}

questionAnswerList["german"]["question"][2][10]  = {"f"}
questionAnswerList["english"]["question"][2][10] = {"q"}
questionAnswerList["german"]["answer"][2][10]  = {"a1","a2","a3"} 
questionAnswerList["english"]["answer"][2][10] = {"a1","a2","a3"}

--difficulty 3:
questionAnswerList["german"]["question"][3][1]  = {"f"}
questionAnswerList["english"]["question"][3][1] = {"q"}
questionAnswerList["german"]["answer"][3][1]  = {"a1","a2","a3"} 
questionAnswerList["english"]["answer"][3][1] = {"a1","a2","a3"}

questionAnswerList["german"]["question"][3][2]  = {"f"}
questionAnswerList["english"]["question"][3][2] = {"q"}
questionAnswerList["german"]["answer"][3][2]  = {"a1","a2","a3"} 
questionAnswerList["english"]["answer"][3][2] = {"a1","a2","a3"}

questionAnswerList["german"]["question"][3][3]  = {"f"}
questionAnswerList["english"]["question"][3][3] = {"q"}
questionAnswerList["german"]["answer"][3][3]  = {"a1","a2","a3"} 
questionAnswerList["english"]["answer"][3][3] = {"a1","a2","a3"}

questionAnswerList["german"]["question"][3][4]  = {"f"}
questionAnswerList["english"]["question"][3][4] = {"q"}
questionAnswerList["german"]["answer"][3][4]  = {"a1","a2","a3"} 
questionAnswerList["english"]["answer"][3][4] = {"a1","a2","a3"}

questionAnswerList["german"]["question"][3][5]  = {"f"}
questionAnswerList["english"]["question"][3][5] = {"q"}
questionAnswerList["german"]["answer"][3][5]  = {"a1","a2","a3"} 
questionAnswerList["english"]["answer"][3][5] = {"a1","a2","a3"}

questionAnswerList["german"]["question"][3][6]  = {"f"}
questionAnswerList["english"]["question"][3][6] = {"q"}
questionAnswerList["german"]["answer"][3][6]  = {"a1","a2","a3"} 
questionAnswerList["english"]["answer"][3][6] = {"a1","a2","a3"}

questionAnswerList["german"]["question"][3][7]  = {"f"}
questionAnswerList["english"]["question"][3][7] = {"q"}
questionAnswerList["german"]["answer"][3][7]  = {"a1","a2","a3"} 
questionAnswerList["english"]["answer"][3][7] = {"a1","a2","a3"}

questionAnswerList["german"]["question"][3][8]  = {"f"}
questionAnswerList["english"]["question"][3][8] = {"q"}
questionAnswerList["german"]["answer"][3][8]  = {"a1","a2","a3"} 
questionAnswerList["english"]["answer"][3][8] = {"a1","a2","a3"}

questionAnswerList["german"]["question"][3][9]  = {"f"}
questionAnswerList["english"]["question"][3][9] = {"q"}
questionAnswerList["german"]["answer"][3][9]  = {"a1","a2","a3"} 
questionAnswerList["english"]["answer"][3][9] = {"a1","a2","a3"}

questionAnswerList["german"]["question"][3][10]  = {"f"}
questionAnswerList["english"]["question"][3][10] = {"q"}
questionAnswerList["german"]["answer"][3][10]  = {"a1","a2","a3"} 
questionAnswerList["english"]["answer"][3][10] = {"a1","a2","a3"}

-------------------------------------------------- LISTS END ------------------------------------------------------------

function GetTeacherQuestInfos(User,SourceItem)
    -- depending on the position of the sourceitem (= the teacher), we get particular infos
	
	local questId; local questPrg; local teacherEN1; local teacherEN2; local teacherDE1; local teacherDE2
	if SourceItem.pos == position(1,1,0) or SourceItem.id == 456 then
	    questId = 350
		teacherEN1 = "The Knowing Tree"
        teacherEN2 = "Knowing Tree"
		teacherDE1 = "Der Wissende Baum" 
		teacherDE2 = "der Wissende Baum"
	elseif SourceItem.pos == position(2,1,0) then 
	    questId = 351
		teacherEN1 = "The Thinking Stone"
        teacherEN2 = "Thinking stone"
		teacherDE1 = "Der Denkende Stein" 
		teacherDE2 = "der Denkende Stein"
	elseif SourceItem.pos == position(3,1,0) then
        questId = 351
		teacherEN1 = "The Thinking Stone"
        teacherEN2 = "Thinking stone"
		teacherDE1 = "Der Denkende Stein" 
		teacherDE2 = "der Denkende Stein"	
    end
	if questId ~= nil then
	    questPrg = User:getQuestProgress(questId)
	    if questPrg == 0 then
		   questPrg = 1
		end
	end    
	return {questId=questId, questPrg=questPrg, teacherEN1=teacherEN1, teacherEN2=teacherEN2, teacherDE1=teacherDE1, teacherDE2=teacherDE2}
	
end

function AlchemistCheck(User)
	if (User:getMagicType() == 3) and (User:getMagicFlags(3) > 0) then
	    return true
	end	
end

function NoMagicCheck(User)
    if User:getMagicFlags(User:getMagicType()) == 0 then
	    return true
	end	
end

function TurnIntoAlchemist(User,SourceItem)
    -- tell char the secret of alchemy and turn him into an alchemist
    local textDE = "Die ferne Stimme erklingt erneut: \"So sei es. Ich lehre dich das Geheimnis der Alchemie. Mögest du das Wissen weise nutzen.\" Für einen Moment schweigt die Stimme, dann dringt sie erneut an dein Ohr, du verstehst nicht, was sie sagt, und doch verstehst du es. Sie klingt fern und doch klingt sie nah. Sie scheint von außen zu kommen und doch scheint sie in dir zu sein. Du hörst Worte, die gesprochen werden und doch hörst du sie nicht. Du versteht alles, was dir gesagt wird und doch verstehst du nichts. Die Welt um dich herum wird zu einem. Es gibt kein Außen und kein Innen mehr, nur noch ein Ganzes, das auch du bist. Doch die Welt zerfällt in Vieles, in unendliche Teile, nicht haftet aneinander, alles ist verstreut, alles ist getrennt, es gibt nur Getrenntheit. Die Welt ist ein Ganzes und unendlich Vieles. Nichts hängt zusammen, alles hängt zusammen. Alles ergibt Sinn, nichts ergibt Sinn. Du hast das Geheimnis erkannt, du hast es nicht erkannt. - Du spürst wie sich deine Sinne und dein Geist verändert haben. Du merkst, wie sich das neue Wissen in deinen Gedanken ausbreitet und doch kannst du es nicht fassen. Du weißt es, doch es ist weder zu begreifen, noch in Worte zu fassen, eine unaussprechliche Wahrheit. Die Welt aber scheint dir nun anders."
	local textEN = "Die ferne Stimme erklingt erneut: \"So sei es. Ich lehre dich das Geheimnis der Alchemie. Mögest du das Wissen weise nutzen.\" Für einen Moment schweigt die Stimme, dann dringt sie erneut an dein Ohr, du verstehst nicht, was sie sagt, und doch verstehst du es. Sie klingt fern und doch klingt sie nah. Sie scheint von außen zu kommen und doch scheint sie in dir zu sein. Du hörst Worte, die gesprochen werden und doch hörst du sie nicht. Du versteht alles, was dir gesagt wird und doch verstehst du nichts. Die Welt um dich herum wird zu einem. Es gibt kein Außen und kein Innen mehr, nur noch ein Ganzes, das auch du bist. Doch die Welt zerfällt in Vieles, in unendliche Teile, nicht haftet aneinander, alles ist verstreut, alles ist getrennt, es gibt nur Getrenntheit. Die Welt ist ein Ganzes und unendlich Vieles. Nichts hängt zusammen, alles hängt zusammen. Alles ergibt Sinn, nichts ergibt Sinn. Du hast das Geheimnis erkannt, du hast es nicht erkannt. - Du spürst wie sich deine Sinne und dein Geist verändert haben. Du merkst, wie sich das neue Wissen in deinen Gedanken ausbreitet und doch kannst du es nicht fassen. Du weißt es, doch es ist weder zu begreifen, noch in Worte zu fassen, eine unaussprechliche Wahrheit. Die Welt aber scheint dir nun anders."
	local questInfos = GetTeacherQuestInfos(User, SourceItem)
	local callback = function(dialog) 
	    User:setMagicType(3)
	    User:teachMagic(3,1)
		world:makeSound(13,User.pos)
		world:gfx(31,User.pos)
		world:gfx(52,User.pos)
		world:gfx(31,User.pos)
	end
	if User:getPlayerLanguage() == 0 then
	    dialog = MessageDialog(questInfos.teacherDE1, textDE , callback)
	else
      	dialog = MessageDialog(questInfos.teacherEN1, textEN, callback)
	end
    User:requestMessageDialog(dialog)
	
end

function IsCharSure(User,SourceItem)
    -- check if the char really wants to become an alchemist
	local questInfos = GetTeacherQuestInfos(User, SourceItem)
	local answerYes; local answerNo; local askChar; local title; local abortTextDE; local abortTextEN
	if User:getPlayerLanguage() == 0 then 
	    answerYes = "Ja."
		answerNo = "Nein."
		askChar = "\"Du hast nun alle Aufgaben erledigt. Bist du bereit und willens in die feinstoffliche Welt zu treten und das Geheimnis der Alchemie zu erfahren? Bedenke, Blendwerke wie die Magie werden dir dann verschlossen bleiben und einmal diesen Weg gegangen, gibt es kein zurück! Bist du bereit?\""
		title = questInfos.teacherDE1
		abortTextDE = "\"Nun, bedauerlich. Komm zurück, sobald du bereit bist!\""
	else
        answerYes = "Yes."
		answerNo = "No."
		askChar = "\"You've done all your tasks. Are you ready and willing to enter the world of fine matter and to learn the secret of alchemy? But keep in mind that the illusions of magic an alike won't be accessible for you and once you've chosen this way, there is no turning back! Are you ready?\""
		title = questInfos.teacherDE1
		abortTextEN = "\"Well, that's a shame. Come back, when you are ready!\""
    end
	
	local callback = function(dialog)
		success = dialog:getSuccess()
		if success then
			if dialog:getSelectedIndex() == 0 then
			    TurnIntoAlchemist(User,SourceItem)
			else	
			    SendMessage(User, SourceItem, abortTextEN, abortTextDE)
			end	
		else
			SendMessage(User, SourceItem, abortTextEN, abortTextDE)
		end
	end
	local dialog = SelectionDialog(title, askChar, callback)
	dialog:addOption(0, answerYes)
	dialog:addOption(0, answerNo)
	User:requestSelectionDialog(dialog)
end

function SendMessage(User, SourceItem, textEN, textDE, questionTrigger)
    -- function to send a message dialog
	-- parameters questionTrigger - if it is true, the user will be asked a question after closing the message dialog
	
    local questInfos = GetTeacherQuestInfos(User, SourceItem)
	local callback = function(dialog) 
	    if questionTrigger then
		    AskQuestion(User,SourceItem)
	    end
	end
	if User:getPlayerLanguage() == 0 then
	    dialog = MessageDialog(questInfos.teacherDE1, textDE, callback)
	else
      	dialog = MessageDialog(questInfos.teacherEN1, textEN, callback)
	end
    User:requestMessageDialog(dialog)
	
end

function GetQuestionAndAnswers(User,SourceItem)
    local questInfos = GetTeacherQuestInfos(User,SourceItem)
    local userLanguage 
	if User:getPlayerLanguage() == 0 then 
	    userLanguage = "german"
	else
        userLanguage = "english"	
    end
    local difficulty = questInfos.questPrg - 3
	local lastQuestion
	if difficulty == 3 then
	    lastQuestion = true
	end	
	local rnd = math.random(1,10)
	local myQuestion = questionAnswerList[userLanguage]["question"][difficulty][rnd][1]
	local sourceAnswerList = questionAnswerList[userLanguage]["answer"][difficulty][rnd]
	local myAnswer = sourceAnswerList[1]
	local newAnswerList = {}
	for i=1,#sourceAnswerList do
	    newAnswerList[i]=sourceAnswerList[i] -- copy the list, so that we do not destroy the original one
	end	
	for i=#newAnswerList,2,-1 do
	    local j = math.random(1, i) 
	    newAnswerList[i], newAnswerList[j] = newAnswerList[j], newAnswerList[i] -- put it back together into a random order (using Fisher–Yates shuffle)
    end
	return myQuestion, myAnswer, newAnswerList, lastQuestion
end

function AskQuestion(User,SourceItem)
    -- quest infos
	local questInfos = GetTeacherQuestInfos(User,SourceItem)
	local title
	if User:getPlayerLanguage() == 0 then
	    title = questInfos.teacherDE1
	else
      	title = questInfos.teacherEN1
	end
	-- get question, answers and check if it is the last question 
	local theQuestion, theAnswer, answersList, lastQuestion = GetQuestionAndAnswers(User,SourceItem)
	local callback = function(dialog)
		success = dialog:getSuccess()
		if success then
			selectedAnswer = (dialog:getSelectedIndex())+1
			if answerList[selectedAnswer] == answer then
			    if lastQuestion then
				    User:setQuestProgress(questId, (User:getQuestProgress(questId) +1) )
					IsCharSure(User,SourceItem) -- ask if the char really wants to become an alchemist
				else
                    SendMessage(User, SourceItem,
					"\"That was the right answer! Let's try the next one.\"", 
					"\"Das war die richtige Antwort! Auf zur nächsten.\"", 
					true)
			    end
			else
                SendMessage(User, SourceItem,
				            "\"That was the wrong answer. Let's try an other one.\"", 
							"\"Das war die falsche Antwort. Versuchen wir es mit einer anderen.\"", 
							true)
            end				
		else
			SendMessage(User, SourceItem,
						"\"Come back to finish the questions whenever you want.\"", 
						"Das war die falsche Antwort. Versuchen wir es mit einer anderen.", 
						false)
		end
	end
	local dialog = SelectionDialog(title, theQuestion, callback)
	for i=1,#answerList do
		dialog:addOption(15, answerList[i])
	end
	User:requestSelectionDialog(dialog)
	
end

	
function FirstTask(User, SourceItem)
    -- first task: the char is supposed to bring five herbs of three different kinds
	-- what kind of herbs depend on the teacher (they are herbs from the region he is in)
    
	local questInfos = GetTeacherQuestInfos(SourceItem, User)
	SendMessage(User, SourceItem, 
		            "You hear a voice, but you cannot tell from where it comes. Maybe it's even just in your head and it says: \"I am the "..questInfos.teacherEN2..". I help those who wish to enter the world of fine matter. If you want to learn about the great secret of alchemy, fullfill my tasks. Go and bring me five "..HerbsTaskOneNameEN[questInfos.teacherEN2][1]..", five "..HerbsTaskOneNameEN[questInfos.teacherEN2][2].." and five "..HerbsTaskOneNameEN[questInfos.teacherEN2][3]..". If you have them, touch me and you will have my attention.\"", 
					"Du vernimmst eine Stimme, von der du nicht sagen kannst, woher sie kommt, oder ob sie vielleicht auch nur in deinem Kopf ist und sie spricht: \"Ich bin "..questInfos.teacherDE2..". Ich helfe jenen, die die Welt der Feinstofflichkeit betreten zu wollen. Willst du also das große Geheimnis der Alchmie erfahren, erfülle meine erste Prüfungen. Geh und bringe mir fünf "..HerbsTaskOneNameDE[questInfos.teacherEN2][1]..", fünf "..HerbsTaskOneNameDE[questInfos.teacherEN2][2].." und fünf "..HerbsTaskOneNameDE[questInfos.teacherEN2][3]..". Wenn du sie hast, berühre mich und du wirst meine Aufmerksamkeit haben.\""
					);
	User:setQuestProgress(questInfos.questId,2)
	
end

function SecondTask(User, SourceItem)
    -- second task: bring to rar herbs from the region
    local questInfos = GetTeacherQuestInfos(SourceItem, User)
	
    -- first, we check if the char has fullfilled the first task
    if (User:countItem(HerbsTaskOneId[teacherEN][1]) < 5) or (User:countItem(HerbsTaskOneId[teacherEN][2]) < 5) or (User:countItem(HerbsTaskOneId[teacherEN][3]) < 5) then
		-- he has not finished the first task: inform him
		SendMessage(User, SourceItem,
			        "Once again you hear the voice which actual source is still unknown to you: \"Oh, you are back! You don't have all the herbs I asked you for, though. I asked for five "..HerbsTaskOneNameEN[questInfos.teacherEN2][1]..", five "..HerbsTaskOneNameEN[questInfos.teacherEN2][2].." and five "..HerbsTaskOneNameEN[questInfos.teacherEN2][3]..". Go and bring them to me if you want to learn the great alchemical secret!\"", 
					"Wieder vernimmst du die Stimme, deren Ursprung dir nicht klar ist: \"Oh, du bist zurück! Du hast aber nicht all die Kräuter, um die ich dich bat. Es waren fünf "..HerbsTaskOneNameDE[questInfos.teacherEN2][1]..", fünf "..HerbsTaskOneNameDE[questInfos.teacherEN2][2].." und fünf "..HerbsTaskOneNameDE[questInfos.teacherEN2][3]..". Geh und bring sie mir, wenn du das alchemistische Geheminis erfahren willst!\""
					);
		return
	else
	    -- he has finished the first task; delete herbs; tell him his second task
		SendMessage(User, SourceItem,
			        HerbsDeleteTextEN[questInfos.teacherEN2][1].." For a short amount fo time it seems as if someone would smack their lips, then the voice says: \"Good, very good. But there is an other task for you left. Now bring me two rar herbs - "..HerbsTaskTwoNameEN[questInfos.teacherEN2][1].." and "..HerbsTaskTwoNameEN[questInfos.teacherEN2][2]..". Be successfull and you are a step closer to your goal.", 
					HerbsDeleteTextDE[questInfos.teacherEN2][1].." Für einen Moment glaubst du etwas wie ein Schmatzen zu hören, bevor die Stimme erklingt: \"Sehr gut, sehr gut. Aber es erwartet dich noch eine Aufgabe. Nun sollst du mir zwei seltene Kräuter bringen und zwar "..HerbsTaskTwoNameDE[questInfos.teacherEN2][1].." und "..HerbsTaskTwoNameDE[questInfos.teacherEN2][2]..". Sei erfolgreich und du bist deinem Ziel ein Stück näher."
					);
		User:eraseItem(HerbsTaskOneId[questInfos.teacherEN2][1],5)
		User:eraseItem(HerbsTaskOneId[questInfos.teacherEN2][2],5)
		User:eraseItem(HerbsTaskOneId[questInfos.teacherEN2][3],5)
		User:setQuestProgress(questInfos.questId,3)
		end    

end

function ThirdTask(User, SourceItem)
    -- third task: three question
    local questInfos = GetTeacherQuestInfos(User, SourceItem)
	local qstPrg = questInfos.questPrg
	
	if qstPrg == 3 then
        -- check if he accomplished the second task	
	    if (User:countItem(HerbsTaskTwoId[questInfos.teacherEN2][1]) < 1) then
	        SendMessage(User, SourceItem,
			            "\"Oh! You don't have the herbs. If you have forgotten what you are supposed to get - "..HerbsTaskTwoNameEN[questInfos.teacherEN2][1].." and "..HerbsTaskTwoNameEN[questInfos.teacherEN2][2]..".\"", 
						"\"Sowas! Du hast die Kräuter nicht dabei. Falls du es vergessen hast - "..HerbsTaskTwoNameDE[questInfos.teacherEN2][1].." and "..HerbsTaskTwoNameDE[questInfos.teacherEN2][2]..".\""
						);
            return
	    else -- he was; inform him about the questions and ask him the first one after he closed the message dialog
		    User:setQuestProgress(questInfos.questId,4)
			SendMessage(User, SourceItem,
			            HerbsDeleteTextEN[questInfos.teacherEN2][1].." For a moment you believe to hear something like: \"Delicious, mh, so delicious...\" Then you hear the familiar voice: \"Yes, you solved this task. Now, he wants me to ask you some question. When you have answered three, I will tell you the secret of alchemy.\"", 
						HerbsDeleteTextDE[questInfos.teacherEN2][1].." Einen Moment lang glaubst du ein Murmeln zu hören: \"Lecker, mh, so lecker...\" Dann erklingt die Stimme wieder auf bekannte Weise: \"Ja, du hast diese Aufgabe bestanden. Als nächstes verlangt er, dass ich dir Fragen stelle. Sobald du mir drei beantworten konntest, werde ich dir das Geheimnis verraten.\"",
						true
						);
            User:eraseItem(HerbsTaskTwoId[questInfos.teacherEN2][1],1)
			User:eraseItem(HerbsTaskTwoId[questInfos.teacherEN2][2],1)
		end	
	else
	    -- ask the remaining questions
		questionAmountListEN = {"three questions", "two questions", "one question"}
		questionAmountListDE = {"drei Fragen", "zwei Fragen", "eine Frage"}
		SendMessage(User, SourceItem, 
			        "Once again you hear the voice you already have heard often before: \"You still have to answer "..questionAmountListEN[qstPrg-3]..", then you will learn the secret of alchemy.\"",
					"Erneut erklingt die dir mittlerweile bekannte Stimme: \"Du hast mir noch "..questionAmountListDE[qstPrg-3].." zu beantworten, dann wirst du das Geheimnis der Alchemie erfahren.\"",
					true
					);
	end
end

function UseItem(User,SourceItem,TargetItem,Counter,Param,ltstate)
 
    -- already an alchemist?
    local alchemistCheck = AlchemistCheck(User)
	if alchemistCheck then
	    SendMessage(User, SourceItem,
		            "You hear a voice you are unable to localise: \"You already know the great secret of alchemy. I am not allowed to help you further. Go away!\"",
		            "Du hörst eine Stimme, die du nicht zu lokalisieren vermagst: \"Du kennst das große Geheimnis der Alchemie schon. Ich darf dir nicht weiter helfen. Geh weg!\""
	                )
	return
	end				
	-- check if the char belongs to any other mage class
	local noMagicCheck = NoMagicCheck(User)
	if not noMagicCheck then
	    SendMessage(User, SourceItem,
			        "Du fühlst dich beobachtet, jedoch scheint nichts weiter zu passieren.", 
					"You feel observed, but nothing else seems to happen."
					)
	return
	end	

	-- teacher and quest infos 
	local questInfos = GetTeacherQuestInfos(User, SourceItem)
	local qstPrg = questInfos.questPrg

	if qstPrg == 1 then
	    FirstTask(User, SourceItem) -- bring 15 normal herbs
	elseif qstPrg == 2 then
	    SecondTask(User, SourceItem) -- bring two rar herbs
	elseif qstPrg >= 3 and qstPrg <= 6 then
	    ThirdTask(User, SourceItem) -- answer three questions
    elseif qstPrg == 7 then
	    IsCharSure(User,SourceItem) -- char did all the tasks; if he wants to, he can become an alchemist
	end	
        	
end
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
-- script to make a char to an alchemist
-- knowing tree
-- thinking stone
-- recognizing spring

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

HerbsDeleteTextDE = {}
HerbsDeleteTextEN = {}

HerbsDeleteTextDE["Knowing Tree"] = {"Eine Windböe erfasst die Kräuter und trägt sie in die Krone des Baumes."}
HerbsDeleteTextDE["Thinking Stone"] = {"Wie von selbst fallen die Kräuter aus deiner Hand und verschwinden in einem Strudel von Sand."}
HerbsDeleteTextDE["Recognizing Spring"] = {"Ein Schwall von Wasser erhebt sich aus der Quelle und spült die Kräuter aus deiner Hand, welche im Wasse verschwinden." }

HerbsDeleteTextEN["Knowing Tree"] = {"A gust of wind gets hold of the herbs and carries them into the treetop."}
HerbsDeleteTextEN["Thinking Stone"] = {"As if they had an own will, the herbs fall out of your hand and disappear in a small sand vortex."}
HerbsDeleteTextEN["Recognizing Spring"] = {"A wave raises from the spring and flushes the herbs from your hand, which disappear in the water."}

questionDE ={}
questionDE[1] = {}
questionDE[2] = {}
questionDE[3] = {}
answerDE = {}
answerDE[1] = {}
answerDE[2] = {}
answerDE[3] = {}

questionDE[1][1]={"Frage1",nil ,nil}
answerDE[1][1]=  {"a1"    ,"a2","a3"}
questionDE[1][2]={"Frage1",nil ,nil}
answerDE[1][2]=  {"a1"    ,"a2","a3"}
questionDE[1][3]={"Frage1",nil ,nil}
answerDE[1][3]=  {"a1"    ,"a2","a3"}
questionDE[1][4]={"Frage1",nil ,nil}
answerDE[1][4]=  {"a1"    ,"a2","a3"}
questionDE[1][5]={"Frage1",nil ,nil}
answerDE[1][5]=  {"a1"    ,"a2","a3"}
questionDE[1][6]={"Frage1",nil ,nil}
answerDE[1][6]=  {"a1"    ,"a2","a3"}
questionDE[1][7]={"Frage1",nil ,nil}
answerDE[1][7]=  {"a1"    ,"a2","a3"}
questionDE[1][8]={"Frage1",nil ,nil}
answerDE[1][8]=  {"a1"    ,"a2","a3"}
questionDE[1][9]={"Frage1",nil ,nil}
answerDE[1][9]=  {"a1"    ,"a2","a3"}
questionDE[1][10]={"Frage1",nil ,nil}
answerDE[1][10]=  {"a1"    ,"a2","a3"}

questionDE[2][1]={"Frage1",nil ,nil}
answerDE[2][1]=  {"a1"    ,"a2","a3"}
questionDE[2][2]={"Frage1",nil ,nil}
answerDE[2][2]=  {"a1"    ,"a2","a3"}
questionDE[2][3]={"Frage1",nil ,nil}
answerDE[2][3]=  {"a1"    ,"a2","a3"}
questionDE[2][4]={"Frage1",nil ,nil}
answerDE[2][4]=  {"a1"    ,"a2","a3"}
questionDE[2][5]={"Frage1",nil ,nil}
answerDE[2][5]=  {"a1"    ,"a2","a3"}
questionDE[2][6]={"Frage1",nil ,nil}
answerDE[2][6]=  {"a1"    ,"a2","a3"}
questionDE[2][7]={"Frage1",nil ,nil}
answerDE[2][7]=  {"a1"    ,"a2","a3"}
questionDE[2][8]={"Frage1",nil ,nil}
answerDE[2][8]=  {"a1"    ,"a2","a3"}
questionDE[2][9]={"Frage1",nil ,nil}
answerDE[2][9]=  {"a1"    ,"a2","a3"}
questionDE[2][10]={"Frage1",nil ,nil}
answerDE[2][10]=  {"a1"    ,"a2","a3"}

questionDE[3][1]={"Frage1",nil ,nil}
answerDE[3][1]=  {"a1"    ,"a2","a3"}
questionDE[3][2]={"Frage1",nil ,nil}
answerDE[3][2]=  {"a1"    ,"a2","a3"}
questionDE[3][3]={"Frage1",nil ,nil}
answerDE[3][3]=  {"a1"    ,"a2","a3"}
questionDE[3][4]={"Frage1",nil ,nil}
answerDE[3][4]=  {"a1"    ,"a2","a3"}
questionDE[3][5]={"Frage1",nil ,nil}
answerDE[3][5]=  {"a1"    ,"a2","a3"}
questionDE[3][6]={"Frage1",nil ,nil}
answerDE[3][6]=  {"a1"    ,"a2","a3"}
questionDE[3][7]={"Frage1",nil ,nil}
answerDE[3][7]=  {"a1"    ,"a2","a3"}
questionDE[3][8]={"Frage1",nil ,nil}
answerDE[3][8]=  {"a1"    ,"a2","a3"}
questionDE[3][9]={"Frage1",nil ,nil}
answerDE[3][9]=  {"a1"    ,"a2","a3"}
questionDE[3][10]={"Frage1",nil ,nil}
answerDE[3][10]=  {"a1"    ,"a2","a3"}

questionEN ={}
questionEN[1] = {}
questionEN[2] = {}
questionEN[3] = {}
answerEN = {}
answerEN[1] = {}
answerEN[2] = {}
answerEN[3] = {}

questionEN[1][1]={"Frage1",nil ,nil}
answerEN[1][1]=  {"a1"    ,"a2","a3"}
questionEN[1][2]={"Frage1",nil ,nil}
answerEN[1][2]=  {"a1"    ,"a2","a3"}
questionEN[1][3]={"Frage1",nil ,nil}
answerEN[1][3]=  {"a1"    ,"a2","a3"}
questionEN[1][4]={"Frage1",nil ,nil}
answerEN[1][4]=  {"a1"    ,"a2","a3"}
questionEN[1][5]={"Frage1",nil ,nil}
answerEN[1][5]=  {"a1"    ,"a2","a3"}
questionEN[1][6]={"Frage1",nil ,nil}
answerEN[1][6]=  {"a1"    ,"a2","a3"}
questionEN[1][7]={"Frage1",nil ,nil}
answerEN[1][7]=  {"a1"    ,"a2","a3"}
questionEN[1][8]={"Frage1",nil ,nil}
answerEN[1][8]=  {"a1"    ,"a2","a3"}
questionEN[1][9]={"Frage1",nil ,nil}
answerEN[1][9]=  {"a1"    ,"a2","a3"}
questionEN[1][10]={"Frage1",nil ,nil}
answerEN[1][10]=  {"a1"    ,"a2","a3"}

questionEN[2][1]={"Frage1",nil ,nil}
answerEN[2][1]=  {"a1"    ,"a2","a3"}
questionEN[2][2]={"Frage1",nil ,nil}
answerEN[2][2]=  {"a1"    ,"a2","a3"}
questionEN[2][3]={"Frage1",nil ,nil}
answerEN[2][3]=  {"a1"    ,"a2","a3"}
questionEN[2][4]={"Frage1",nil ,nil}
answerEN[2][4]=  {"a1"    ,"a2","a3"}
questionEN[2][5]={"Frage1",nil ,nil}
answerEN[2][5]=  {"a1"    ,"a2","a3"}
questionEN[2][6]={"Frage1",nil ,nil}
answerEN[2][6]=  {"a1"    ,"a2","a3"}
questionEN[2][7]={"Frage1",nil ,nil}
answerEN[2][7]=  {"a1"    ,"a2","a3"}
questionEN[2][8]={"Frage1",nil ,nil}
answerEN[2][8]=  {"a1"    ,"a2","a3"}
questionEN[2][9]={"Frage1",nil ,nil}
answerEN[2][9]=  {"a1"    ,"a2","a3"}
questionEN[2][10]={"Frage1",nil ,nil}
answerEN[2][10]=  {"a1"    ,"a2","a3"}

questionEN[3][1]={"Frage1",nil ,nil}
answerEN[3][1]=  {"a1"    ,"a2","a3"}
questionEN[3][2]={"Frage1",nil ,nil}
answerEN[3][2]=  {"a1"    ,"a2","a3"}
questionEN[3][3]={"Frage1",nil ,nil}
answerEN[3][3]=  {"a1"    ,"a2","a3"}
questionEN[3][4]={"Frage1",nil ,nil}
answerEN[3][4]=  {"a1"    ,"a2","a3"}
questionEN[3][5]={"Frage1",nil ,nil}
answerEN[3][5]=  {"a1"    ,"a2","a3"}
questionEN[3][6]={"Frage1",nil ,nil}
answerEN[3][6]=  {"a1"    ,"a2","a3"}
questionEN[3][7]={"Frage1",nil ,nil}
answerEN[3][7]=  {"a1"    ,"a2","a3"}
questionEN[3][8]={"Frage1",nil ,nil}
answerEN[3][8]=  {"a1"    ,"a2","a3"}
questionEN[3][9]={"Frage1",nil ,nil}
answerEN[3][9]=  {"a1"    ,"a2","a3"}
questionEN[3][10]={"Frage1",nil ,nil}
answerEN[3][10]=  {"a1"    ,"a2","a3"}


function UseItem(User,SourceItem,TargetItem,Counter,Param,ltstate)

    --[[local mType = User:getMagicType
	if XXX then
        return
	end]]
	User:inform("debug1")
	local teacherEN; local teacherDE
	local questId
	if SourceItem.pos == position(1,1,0) or SourceItem.id == 456 then
	    User:inform("debug2")
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
	if qstPrg == nil then
	    qstPrg = 1
		User:setQuestProgress(questId,qstPrg)
	end
	
	if qstPrg == 1 then
	    
		SendMessage(User, 
		            "You hear a voice, but you cannot tell from where it comes. Maybe it's even just in your head and it says: \"I am the "..teacherEN". I help those who wish to enter the world of fine matter. If you want to learn about the great secret of alchemy, fullfill my tasks. Go and bring me five "..HerbsTaskOneNameEN[teacherEN][1]..", five "..HerbsTaskOneNameEN[teacherEN][2].." and five "..HerbsTaskOneNameEN[teacherEN][3]..". If you have them, touch me with and you will have my attention.\"", 
					"Du vernimmst eine Stimme, von der du nicht sagen kannst, woher sie kommt, oder ob sie vielleicht auch nur in deinem Kopf ist und sie spricht: \"Ich bin "..teacherDE". Ich helfe jenen, die die Welt der Feinstofflichkeit betreten zu wollen. Willst du also das große Geheimnis der Alchmie erfahren, erfülle meine erste Prüfungen. Geh und bringe mir fünf "..HerbsTaskOneNameDE[teacherEN][1]..", fünf "..HerbsTaskOneNameDE[teacherEN][2].." und fünf "..HerbsTaskOneNameDE[teacherEN][3]..". Wenn du sie hast, berühre mich und du wirst meine Aufmerksamkeit haben.\""
					);
		User:setQuestprogress(questId,2)
	    
	elseif qstPrg == 2 then
	    
		if (User:countItem(HerbsTaskOneId[teacherEN][1]) < 5) or (User:countItem(HerbsTaskOneId[teacherEN][2]) < 5) or (User:countItem(HerbsTaskOneId[teacherEN][3]) < 5) then
		    SendMessage(User, 
			            "Once again you hear the voice about which source you are still unsure: \"Oh, you are back! You don't have all the herbs I asked you for, though. I asked for five "..HerbsTaskOneNameEN[teacherEN][1]..", five "..HerbsTaskOneNameEN[teacherEN][2].." and five "..HerbsTaskOneNameEN[teacherEN][3]..". Go and bring them to me if you want to learn the great alchemical secret!\"", 
						"Wieder vernimmst du die Stimme, deren Ursprung dir nicht klar ist: \"Oh, du bist zurück! Du hast aber nicht all die Kräuter, um die ich dich bat. Es waren fünf "..HerbsTaskOneNameDE[teacherEN][1]..", fünf "..HerbsTaskOneNameDE[teacherEN][2].." und fünf "..HerbsTaskOneNameDE[teacherEN][3]..". Geh und bring sie mir, wenn du das alchemistische Geheminis erfahren willst!\""
						);
			return
		else
		    SendMessage(User, 
			           HerbsDeleteTextEN[teacherEN].." For a short amount fo time it seems as if someone would smack their lips, then the voice says: \"Good, very good. But there is an other task for you left. Now bring me two rar herbs - "..HerbsTaskTwoNameEN[teacherEN][1].." and "..HerbsTaskTwoNameEN[teacherEN][2]..". Be successfull and you are a step closer to your goal.", 
					   HerbsDeleteTextDE[teacherEN].." Für einen Moment glaubst du etwas wie ein Schmatzen zu hören, bevor die Stimme erklingt: \"Sehr gut, sehr gut. Aber es erwartet dich noch eine Aufgabe. Nun sollst du mir zwei seltene Kräuter bringen und zwar "..HerbsTaskTwoNameDE[teacherEN][1].." und "..HerbsTaskTwoNameDE[teacherEN][2]..". Sei erfolgreich und du bist deinem Ziel ein Stück näher."
					   );
			User:eraseItem(HerbsTaskOneId[teacherEN][1],5)
			User:eraseItem(HerbsTaskOneId[teacherEN][2],5)
			User:eraseItem(HerbsTaskOneId[teacherEN][3],5)
		end    
	
	elseif qstPrg == 3 then
	
	    if (User:countItem(HerbsTaskTwoId[teacherEN][1]) < 1) then
	        SendMessage(User, 
			            "\"Oh! You don't have the herbs. If you have forgotten what you are supposed to get - "..HerbsTaskTwoNameEN[teacherEN][1].." and "..HerbsTaskTwoNameEN[teacherEN][2]..".\"", 
						"\"Sowas! Du hast die Kräuter nicht dabei. Falls du es vergessen hast - "..HerbsTaskTwoNameDE[teacherEN][1].." and "..HerbsTaskTwoNameDE[teacherEN][2]..".\""
						);
            return
	    else
		    User:setQuestprogress(questId,4)
			SendMessage(User, 
			            HerbsDeleteTextEN[teacherEN].." For a moment you believe to hear something like: \"Delicious, mh, so delicious...\" Then you hear the familiar voice: \"Yes, you solved this task. Now I have to ask you some questions. When you have answered three, I will tell you the secret of alchemy.\"", 
						HerbsDeleteTextDE[teacherEN].." Einen Moment lang glaubst du ein Murmeln zu hören: \"Lecker, mh, so lecker...\" Dann erklingt die Stimme wieder auf bekannte Weise: \"Ja, du hast diese Aufgabe bestanden. Als nächstes muss ich dir einige Fragen stellen. Sobald du mir drei beantworten konntest, werde ich dir das Geheimnis verraten.\"",
						teacherEN,
						true
						);
            User:eraseItem(HerbsTaskTwoId[teacherEN][1],1)
			User:eraseItem(HerbsTaskTwoId[teacherEN][2],1)
		end		
    
	elseif qstPrg >= 4 and qstPrg <= 6 then
	    
		local questionsEN; local questionsDE
		if qstPrg == 4 then
		    questionEN = "three questions"; questionDE = "drei Fragen"
		elseif qstPrg == 5 then
		    questionEN = "two questions"; questionDE = "zwei Fragen"
		else
		    questionEN = "one question"; questionDE = "eine Frage"
	    end
	    SendMessage(User, 
			            "Once again you hear the voice you already have heard often before: \"You still have to answer "..questionEN..", then you will leran the secret of alchemy.\"",
						"Erneut erklingt die dir mittlerweile bekannte Stimme: \"Du hast mir noch "..questionDE.." zu beantworten, dann wirst du das Geheimnis der Alchemie erfahren.\"",
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
	local rnd = math.random(1,10)
	local title
	if User:getPlayerLanguage() == 0 then
	    questionList = questionDE[difficulty][rnd]
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
			    User:inform("richtige antwort. text einfügen. zum alchemisten machen.")
			else
                SendMessage(User, 
				            "\"That was the wrong answer. Let's try us an other one.\"", 
							"\"Das war die falsche Antwort. Versuchen wir es mit einer anderen.\"", 
							teacherEN, 
							true)
            end				
		else
			SendMessage(User, 
						"\"Come back to finish the questions whenever you want.\"", 
						"Das war die falsche Antwort. Versuchen wir es mit einer anderen.", 
						teacherEN, 
						true)
		end
	end
	local dialog = SelectionDialog(title,  callback)
	for i=1,#answerList do
		dialog:addOption(0, answerList[i])
	end
	User:requestSelectionDialog(dialog)
	User:inform(question)

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
--[[
function UseItem( User, SourceItem, TargetItem, Counter, Param, ltstate )
	-- merung's test land -- 
	if (string.find(User.lastSpokenText,"teacher")~=nil) then
	    alchemy.base.teacher.UseItem(User,SourceItem,TargetItem,Counter,Param,ltstate)
	end	
	
	if (string.find(User.lastSpokenText,"reset")~=nil) then
	    User:setQuestprogress(350,0)
		User:setQuestprogress(351,0)
		User:setQuestprogress(352,0)
	end	
	
	local myValue
	local myValue1
	local myValue2
	local myInform = ""
	local myCounter
	local erwart
	local std; local a; local b
	local counterList = {}
	for i=1,9 do
	    counterList[i] = {}
	end	
	if (string.find(User.lastSpokenText,"vert")~=nil) then
		a,b,erwart,std = string.find(User.lastSpokenText,"(%d+) (%d+)")
		std = tonumber(std)
		erwart = tonumber(erwart)
		for i=1,100 do
		    myValue = 10
			repeat 
				myValue =Random.normal(erwart,std)
				myValue = math.floor((myValue + 0.5))
			until myValue > 0 and myValue < 10
			myInform = myInform.." "..myValue
		    
			table.insert (counterList[myValue],myValue)
		end	
		for i=1,9 do
		    User:inform("["..i.."] = "..#counterList[i])
		end	
	end
end]]

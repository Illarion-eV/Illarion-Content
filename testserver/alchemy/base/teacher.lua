require("base.common");
module("alchemy.base.teacher", package.seeall)

-- This script turns a character into an alchemist. 
-- Three 'beings' can do that: Knowing Tree (Galmair), Thinking Stone (Cadomyr), Recognizing Spring(Runewick)
-- Three tasks have to be fullfilled: Bring 5*3 normal herbs; bring 1*2 rare herbs; answer three questions

------------------------------------------- LISTS ------------------------------------------------------
-- TASK ONE: three normal herbs
HerbsTaskOneId = {}
HerbsTaskOneNameEN = {}
HerbsTaskOneNameDE = {}

HerbsTaskOneId["Knowing Tree"] =   {133  ,  81, 140}
HerbsTaskOneNameEN["Knowing Tree"] = {"sunherbs","berries","donf blades"}
HerbsTaskOneNameDE["Knowing Tree"] = {"Sonnenkräuter","Beeren","Donfblätter"}

HerbsTaskOneId["Thinking Stone"] =   {142  ,  137, 156}
HerbsTaskOneNameEN["Thinking Stone"] = {"sandberries","flamegoblet blossom","steppe fern"}
HerbsTaskOneNameDE["Thinking Stone"] = {"Sandbeere","Flammenkelchblüte","Steppenfarn"}

HerbsTaskOneId["Recognizing Spring"] =  {144  ,  151, 135}
HerbsTaskOneNameEN["Recognizing Spring"] = {"virgin's weed","strawberries","yellow weed"}
HerbsTaskOneNameDE["Recognizing Spring"] = {"Jungfernkraut","Erdbeeren","Gelbkraut"}
-- TASK ONE END --

-- TASK TWO: two normal herbs 
HerbsTaskTwoId = {}
HerbsTaskTwoNameEN = {}
HerbsTaskTwoNameDE = {}

HerbsTaskTwoId["Knowing Tree"] =   {761,766}
HerbsTaskTwoNameEN["Knowing Tree"] = {"rain weed","con blossom"}
HerbsTaskTwoNameDE["Knowing Tree"] = {"Regenkraut","Trugblüte"}

HerbsTaskTwoId["Thinking Stone"] =   {769,146}
HerbsTaskTwoNameEN["Thinking Stone"] = {"desert berry","desert sky capsule"}
HerbsTaskTwoNameDE["Thinking Stone"] = {"Wüstenbeere","Wüstenhimmelskapsel"}

HerbsTaskTwoId["Recognizing Spring"] = {756,765}
HerbsTaskTwoNameEN["Recognizing Spring"] = {"pious berry","day dream"}
HerbsTaskTwoNameDE["Recognizing Spring"] = {"Frommbeere","Tagtraum"}
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
questionAnswerList["german"]["question"][1][1]  = {"Welche Pflanze enthält keinen der acht Wirkstoffe?"}
questionAnswerList["english"]["question"][1][1] = {"Which plant does not contain any active substance?"}
questionAnswerList["german"]["answer"][1][1]  = {"Kohl","Firnisblüte","Erdbeere"} 
questionAnswerList["english"]["answer"][1][1] = {"Cabbage","Firnis blossom","Strawberry"}

questionAnswerList["german"]["question"][1][2]  = {"Was ist kein Wirkstoff?"}
questionAnswerList["english"]["question"][1][2] = {"What is no active substance?"}
questionAnswerList["german"]["answer"][1][2]  = {"Platanat","Adrazin","Orcanol"} 
questionAnswerList["english"]["answer"][1][2] = {"Platanat","Adrazin","Orcanol"}

questionAnswerList["german"]["question"][1][3]  = {"Was verwenden wir zum Filtern eines Sudes?"}
questionAnswerList["english"]["question"][1][3] = {"What do we use to filter a stock?"}
questionAnswerList["german"]["answer"][1][3]  = {"Faulbaumrinde","Fliegenpilz","Sumpfblume"} 
questionAnswerList["english"]["answer"][1][3] = {"Rotten Tree Bark","Toad Stool","Mash Flower"} --- !!!!

questionAnswerList["german"]["question"][1][4]  = {"Wieviele Wirkstoffe gibt es?"}
questionAnswerList["english"]["question"][1][4] = {"How many active substances do we know?"}
questionAnswerList["german"]["answer"][1][4]  = {"Acht","Sechs","Neun"} 
questionAnswerList["english"]["answer"][1][4] = {"Eight","Six","Nine"}

questionAnswerList["german"]["question"][1][5]  = {"Was verwenden wir, um Gebräue zu analysieren?"}
questionAnswerList["english"]["question"][1][5] = {"What do we use to analyse brews?"}
questionAnswerList["german"]["answer"][1][5]  = {"Edelsteine","Spiegel","Elfenohren"} 
questionAnswerList["english"]["answer"][1][5] = {"Gems","Mirror","Elf Ears"}

questionAnswerList["german"]["question"][1][6]  = {"Welche Pflanze enthält Wirkstoffe?"}
questionAnswerList["english"]["question"][1][6] = {"Which plant contains activ substances?"}
questionAnswerList["german"]["answer"][1][6]  = {"Mandarine","Apfel","Tomate"} 
questionAnswerList["english"]["answer"][1][6] = {"Tangerine","Apple","Tomato"}

questionAnswerList["german"]["question"][1][7]  = {"Welchen Wirkstoff gibt es wirklich?"}
questionAnswerList["english"]["question"][1][7] = {"What is a real active substance?"}
questionAnswerList["german"]["answer"][1][7]  = {"Hyperborelium","Stalavius","Domerata"} 
questionAnswerList["english"]["answer"][1][7] = {"Hyperborelium","Stalavius","Domerata"}

questionAnswerList["german"]["question"][1][8]  = {"Was zeichent ein reines Kraut?"}
questionAnswerList["english"]["question"][1][8] = {"What is a pure herb?"}
questionAnswerList["german"]["answer"][1][8]  = {"Beeinflussung von nur einem Wirkstoff","Wurde nie von einem Ork berührt","Frei von jeder Verunreinigung"} 
questionAnswerList["english"]["answer"][1][8] = {"Effecting just one active substance","Never been touched by an orc","Free from any dirt"}

questionAnswerList["german"]["question"][1][9]  = {"Welches ist ein reines Kraut?"}
questionAnswerList["english"]["question"][1][9] = {"Which one is a pure herb?"}
questionAnswerList["german"]["answer"][1][9]  = {"Wüstenbeere","Jungfernkraut","Sumpfblume"} 
questionAnswerList["english"]["answer"][1][9] = {"Desert Berry","Virgins Weed","Mash Flower"}

questionAnswerList["german"]["question"][1][10]  = {"Welche Pflanze ist im Wald zu finden?"}
questionAnswerList["english"]["question"][1][10] = {"Which plant can be found in the woods?"}
questionAnswerList["german"]["answer"][1][10]  = {"Firnisblüte","Flammenkelchblüte","Steppenfarn"} 
questionAnswerList["english"]["answer"][1][10] = {"Firnis Blossom","Flamegoblet Blossom","Steppe Farn"}

-- difficulty 2:
questionAnswerList["german"]["question"][2][1]  = {"Wie bezeichnen wir die höchste positive Konzentration eines Wirkstoffes?"}
questionAnswerList["english"]["question"][2][1] = {"How to we call the highest positive concentration of an active substance?"}
questionAnswerList["german"]["answer"][2][1]  = {"Hoch Toxisch","Gesättigte Anreicherung","merklich"} 
questionAnswerList["english"]["answer"][2][1] = {"Highly Toxic","Saturated Solution","Distinctive"}

questionAnswerList["german"]["question"][2][2]  = {"Wie bezeichnen wir die höchste negative Konzentration eines Wirkstoffes?"}
questionAnswerList["english"]["question"][2][2] = {"How to we call the highest negative concentration of an active substance?"}
questionAnswerList["german"]["answer"][2][2]  = {"Gesättigte Anreicherung","Hoch Toxisch","merklich"} 
questionAnswerList["english"]["answer"][2][2] = {"Saturated Solution","Highly Toxic","Distintive"} 

questionAnswerList["german"]["question"][2][3]  = {"Welcher Wirkstoff kann die Intelligenz beeinflussen?"}
questionAnswerList["english"]["question"][2][3] = {"Which active substance can haven an influence on intelligence"}
questionAnswerList["german"]["answer"][2][3]  = {"Illidrium","Orcanol","Adrazin"} 
questionAnswerList["english"]["answer"][2][3] = {"Illidrium","Orcanol","Adrazin"}

questionAnswerList["german"]["question"][2][4]  = {"Wieviele Kräuter kann ein gewöhnliches Essenzgebräu maximal enthalten?"}
questionAnswerList["english"]["question"][2][4] = {"How many herbs can an ordinary essence brew contain at maximum?"}
questionAnswerList["german"]["answer"][2][4]  = {"Acht","Vier","Zehn"} 
questionAnswerList["english"]["answer"][2][4] = {"Eight","Four","Ten"}

questionAnswerList["german"]["question"][2][5]  = {"Mit welchem Edelsteinstaub stellen wir Wurfbomben her?"}
questionAnswerList["english"]["question"][2][5] = {"Which gem dust do we use to create throwing bombs?"}
questionAnswerList["german"]["answer"][2][5]  = {"Smaragdstaub","Rubinstaub","Obsidianstaub"} 
questionAnswerList["english"]["answer"][2][5] = {"Emerald Gemdust","Ruby Gemdust","Obisdian Gemdust"}

questionAnswerList["german"]["question"][2][6]  = {"Welcher Wirkstoff kann keinen Einfluss auf Gift haben?"}
questionAnswerList["english"]["question"][2][6] = {"Which active substance cannot influence poison?"}
questionAnswerList["german"]["answer"][2][6]  = {"Dracolin","Hyperborelium","Fenolin"} 
questionAnswerList["english"]["answer"][2][6] = {"Dracolin","Hyperborelium","Fenolin"}

questionAnswerList["german"]["question"][2][7]  = {"Auf was kann Adrazin unteranderem Einfluss haben?"}
questionAnswerList["english"]["question"][2][7] = {"Among others, Adrazin can have influence on what?"}
questionAnswerList["german"]["answer"][2][7]  = {"Stärke","Wahrnehmung","Willenskraft"} 
questionAnswerList["english"]["answer"][2][7] = {"Strength","Pereception","Willpower"}

questionAnswerList["german"]["question"][2][8]  = {"Mit welchem Edelsteinstaub stellen wir Verwandlungstränke her?"}
questionAnswerList["english"]["question"][2][8] = {"Which gemdust do we use to create shape shifter potions?"}
questionAnswerList["german"]["answer"][2][8]  = {"Obisdianstaub","Rubinstaub","Diamantstaub"} 
questionAnswerList["english"]["answer"][2][8] = {"Obisdian Dust","Ruby Dust","Diamant Dust"}

questionAnswerList["german"]["question"][2][9]  = {"Worauf hat der Tybaltstern Einfluss?"}
questionAnswerList["english"]["question"][2][9] = {"On which active substance does the Tybalt Star have an influence on?"}
questionAnswerList["german"]["answer"][2][9]  = {"Dracolin","Echolon","Hyperborelium"} 
questionAnswerList["english"]["answer"][2][9] = {"Dracolin","Echolon","Hyperborelium"}

questionAnswerList["german"]["question"][2][10]  = {"Von welcher Pflanze heißt es, dass sie in jeder Medizin, die erfolgreich sein soll, entahlten sein muss?"}
questionAnswerList["english"]["question"][2][10] = {"What plant is to be said to be a necessary ingredient for every successful medicine?"}
questionAnswerList["german"]["answer"][2][10]  = {"Firnisblüte","Heideblüte","Brombeere"} 
questionAnswerList["english"]["answer"][2][10] = {"Firnis Blossom","Heath Flower","Black Berry"}

--difficulty 3:
questionAnswerList["german"]["question"][3][1]  = {"Was passiert, wenn wir einen Sud in einen anderen Sud zu füllen versuchen?"}
questionAnswerList["english"]["question"][3][1] = {"What happens when we try to fill a stock into an other stock?"}
questionAnswerList["german"]["answer"][3][1]  = {"Explosion","Nichts","Sude verbinden sich"} 
questionAnswerList["english"]["answer"][3][1] = {"Explosion","Nothing","Combination of the stocks"}

questionAnswerList["german"]["question"][3][2]  = {"Was passiert, wenn wir einen neutralen Sud zu filtern versuchen?"}
questionAnswerList["english"]["question"][3][2] = {"Whaten happens if we try to filter a neutral stock?"}
questionAnswerList["german"]["answer"][3][2]  = {"Explosion","Nichts","Zufälliges Heben eines Wirkstoffes"} 
questionAnswerList["english"]["answer"][3][2] = {"Explosion","Nothing","Random raising of an active substance"} 

questionAnswerList["german"]["question"][3][3]  = {"Was passiert, wenn wir einen Wirkstoff über seine höchste positive Konzentration hinaus zu heben versuchen?"}
questionAnswerList["english"]["question"][3][3] = {"What happens when we try to increase an active substance beyond it's highest positive concentration?"}
questionAnswerList["german"]["answer"][3][3]  = {"Explosion","Nichts","Der Wirkstoff wird gesenkt"} 
questionAnswerList["english"]["answer"][3][3] = {"Explosion","Nothing","The active substance is being decreased"}

questionAnswerList["german"]["question"][3][4]  = {"Was passiert, wenn wir einen Wirkstoff über seine höchste negative Konzentration hinaus zu senken versuchen?"}
questionAnswerList["english"]["question"][3][4] = {"What happens when we try to decrease an active substance beyond it's highest negative concentration?"}
questionAnswerList["german"]["answer"][3][4]  = {"Explosion","Nichts","Der Wirkstoff wird gehoben"} 
questionAnswerList["english"]["answer"][3][4] = {"Explosion","Nothing","The active substance is being increased"}

questionAnswerList["german"]["question"][3][5]  = {"Was passiert, wenn wir ein Essenzgebräu in ein anderes Essenzgebräu schütten?"}
questionAnswerList["english"]["question"][3][5] = {"What happens when we fill an essence brew into an other essence brew?"}
questionAnswerList["german"]["answer"][3][5]  = {"Explosion","Nichts","Sie verbinden sich"}  
questionAnswerList["english"]["answer"][3][5] = {"Explosion","Nothing","They combine"}

-------------------------------------------------- LISTS END ------------------------------------------------------------

function GetTeacherQuestInfos(User,SourceItem)
    -- depending on the position of the sourceitem (= the teacher), we get particular infos
	
	local questId; local questPrg; local teacherEN1; local teacherEN2; local teacherDE1; local teacherDE2
	if SourceItem.pos == position(432,238,0) then
	    questId = 350
		teacherEN1 = "The Knowing Tree"
        teacherEN2 = "Knowing Tree"
		teacherDE1 = "Der Wissende Baum" 
		teacherDE2 = "der Wissende Baum"
	elseif SourceItem.pos == position(75,651,0) then 
	    questId = 351
		teacherEN1 = "The Thinking Stone"
        teacherEN2 = "Thinking Stone"
		teacherDE1 = "Der Denkende Stein" 
		teacherDE2 = "der Denkende Stein"
	elseif SourceItem.pos == position(873,878,0) then 
        questId = 352
		teacherEN1 = "The Recognizing Spring"
        teacherEN2 = "Recognizing Spring"
		teacherDE1 = "Die Erkennende Quelle" 
		teacherDE2 = "die Erkennende Quelle"	
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
    local textDE = "Die ferne Stimme erklingt erneut: \"So sei es. Ich lehre dich das Geheimnis der Alchemie. Mögest du das Wissen weise nutzen.\" Für einen Moment schweigt die Stimme, dann dringt sie erneut an dein Ohr, du verstehst nicht, was sie sagt, und doch verstehst du es. Sie klingt fern und doch klingt sie nah. Sie scheint von außen zu kommen und doch scheint sie in dir zu sein. Du hörst Worte, die gesprochen werden und doch hörst du sie nicht. Du versteht alles, was dir gesagt wird und doch verstehst du nichts. Die Welt um dich herum wird zu einem. Es gibt kein Außen und kein Innen mehr, nur noch ein Ganzes, das auch du bist. Doch die Welt zerfällt in Vieles, in unendliche Teile, nichts haftet aneinander, alles ist verstreut, alles ist getrennt, es gibt nur Getrenntheit. Die Welt ist ein Ganzes und unendlich Vieles. Nichts hängt zusammen, alles hängt zusammen. Alles ergibt Sinn, nichts ergibt Sinn. Du hast das Geheimnis erkannt, du hast es nicht erkannt. - Du spürst wie sich deine Sinne und dein Geist verändert haben. Du merkst, wie sich das neue Wissen in deinen Gedanken ausbreitet und doch kannst du es nicht fassen. Du weißt es, doch es ist weder zu begreifen, noch in Worte zu fassen, eine unaussprechliche Wahrheit. Die Welt aber scheint dir nun anders."
	local textEN = "The voice in the distance sounds again: \"So be it! I shall teach you the secret of alchemy. May you use it wisely.\" For a moment, the voice is silent, but then it sounds again. You don't understand the words and yet somehow you do. They sound close, yet distant. They seem to come from outside, yet within you. You perceive words being spoken, yet you don't hear them. You understand everything, yet you understand nothing. The world around you becomes one. There is no outside and inside anymore, just one whole which you are part of. The world collapses in an infinite, endless number of parts. Nothing is combined. Everything is scattered. There is only separation. The world is one and many. Nothing is connected, yet everything is connected.Everything makes sense now, yet nothing makes sense. You recognise the secret, but you haven't recognised it. You feel how your sense and mind have been altered. You feel how new knowledge has been placed into your mind, but you cannot grasp it. You know it, but it cannot be understood, not put into words - an unspeakable truth. The world appears to you in a different way now." 
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
		askChar = "\"You've done all your tasks. Are you ready and willing to enter the world of fine matter and to learn the secret of alchemy? But keep in mind that the illusions of magic and alike won't be accessible for you and once you've chosen this way, there is no turning back! Are you ready?\""
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
	local rnd = math.random(1,#questionAnswerList[userLanguage]["question"][difficulty])
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
	local questId = questInfos.questId
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
			if answersList[selectedAnswer] == theAnswer then
			    User:setQuestProgress(questId, (User:getQuestProgress(questId) +1) )
				if lastQuestion then
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
						"\"Komm wieder, wann immer du dich den Fragen stellen willst.\"", 
						false)
		end
	end
	local dialog = SelectionDialog(title, theQuestion, callback)
	for i=1,#answersList do
		dialog:addOption(15, answersList[i])
	end
	User:requestSelectionDialog(dialog)
	
end

	
function FirstTask(User, SourceItem)
    -- first task: the char is supposed to bring five herbs of three different kinds
	-- what kind of herbs depend on the teacher (they are herbs from the region he is in)
    
	local questInfos = GetTeacherQuestInfos(User, SourceItem)
	SendMessage(User, SourceItem, 
		            "You hear a voice, but you cannot tell from where it comes. Maybe it's even just in your head and it says: \"I am the "..questInfos.teacherEN2..". I help those who wish to enter the world of fine matter. If you want to learn about the great secret of alchemy, fullfill my tasks. Go and bring me five "..HerbsTaskOneNameEN[questInfos.teacherEN2][1]..", five "..HerbsTaskOneNameEN[questInfos.teacherEN2][2].." and five "..HerbsTaskOneNameEN[questInfos.teacherEN2][3]..". If you have them, touch me and you will have my attention.\"", 
					"Du vernimmst eine Stimme, von der du nicht sagen kannst, woher sie kommt, oder ob sie vielleicht auch nur in deinem Kopf ist und sie spricht: \"Ich bin "..questInfos.teacherDE2..". Ich helfe jenen, die die Welt der Feinstofflichkeit betreten wollen. Willst du also das große Geheimnis der Alchemie erfahren, erfülle meine erste Prüfung. Geh und bringe mir fünf "..HerbsTaskOneNameDE[questInfos.teacherEN2][1]..", fünf "..HerbsTaskOneNameDE[questInfos.teacherEN2][2].." und fünf "..HerbsTaskOneNameDE[questInfos.teacherEN2][3]..". Wenn du sie hast, berühre mich und du wirst meine Aufmerksamkeit haben.\""
					);
	User:setQuestProgress(questInfos.questId,2)
	
end

function SecondTask(User, SourceItem)
    -- second task: bring to rare herbs from the region
    local questInfos = GetTeacherQuestInfos(User, SourceItem)
	
    -- first, we check if the char has fullfilled the first task
    if (User:countItem(HerbsTaskOneId[questInfos.teacherEN2][1]) < 5) or (User:countItem(HerbsTaskOneId[questInfos.teacherEN2][2]) < 5) or (User:countItem(HerbsTaskOneId[questInfos.teacherEN2][3]) < 5) then
		-- he has not finished the first task: inform him
		SendMessage(User, SourceItem,
			        "Once again you hear the voice which actual source is still unknown to you: \"Oh, you are back! You don't have all the herbs I asked you for, though. I asked for five "..HerbsTaskOneNameEN[questInfos.teacherEN2][1]..", five "..HerbsTaskOneNameEN[questInfos.teacherEN2][2].." and five "..HerbsTaskOneNameEN[questInfos.teacherEN2][3]..". Go and bring them to me if you want to learn the great alchemical secret!\"", 
					"Wieder vernimmst du die Stimme, deren Ursprung dir nicht klar ist: \"Oh, du bist zurück! Du hast aber nicht all die Kräuter, um die ich dich bat. Es waren fünf "..HerbsTaskOneNameDE[questInfos.teacherEN2][1]..", fünf "..HerbsTaskOneNameDE[questInfos.teacherEN2][2].." und fünf "..HerbsTaskOneNameDE[questInfos.teacherEN2][3]..". Geh und bring sie mir, wenn du das alchemistische Geheminis erfahren willst!\""
					);
		return
	else
	    -- he has finished the first task; delete herbs; tell him his second task
		SendMessage(User, SourceItem,
			        HerbsDeleteTextEN[questInfos.teacherEN2][1].." For a short amount of time it seems as if someone would smack their lips, then the voice says: \"Good, very good. But there is an other task for you left. Now bring me two rare herbs - "..HerbsTaskTwoNameEN[questInfos.teacherEN2][1].." and "..HerbsTaskTwoNameEN[questInfos.teacherEN2][2]..". Be successful and you are a step closer to your goal.", 
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
	    if (User:countItem(HerbsTaskTwoId[questInfos.teacherEN2][1]) < 1) or (User:countItem(HerbsTaskTwoId[questInfos.teacherEN2][2]) < 1) then
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
    if not (SourceItem.pos == position(75,651,0) or SourceItem.pos == position(432,238,0) or SourceItem.pos == position(873,878,0)) then
	    return
	end	
	
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
		            "You hear a voice you are unable to localise: \"You already know the great secret of alchemy. I am not allowed to help you further. Go away!\"",
		            "Du hörst eine Stimme, die du nicht zu lokalisieren vermagst: \"Du kennst das große Geheimnis der Alchemie schon. Ich darf dir nicht weiter helfen. Geh weg!\""
	                )
	    return
	end

    -- check for proper attributes
    if ( User:increaseAttrib("perception",0) + User:increaseAttrib("essence",0) + User:increaseAttrib("intelligence",0) ) < 30 then 
		SendMessage(User, SourceItem,            
					"You hear a voice you are unable to localise: \"I can only tell those who are mindful, good observer and have a certain feeling for fine matter the secret of alchemy. Go away!\"",
		            "Du hörst eine Stimme, die du nicht zu lokalisieren vermagst: \"Nur jenen, die einen klaren Verstand, ein gutes Augen und ein Gespür für Feinstoffliche haben, kann ich das Geheimnis der Alchmie erzählen. Geh weh!\""
	                )
		return
    end		
 					
    -- teacher and quest infos 
	local questInfos = GetTeacherQuestInfos(User, SourceItem)
	local qstPrg = questInfos.questPrg

	if qstPrg == 1 then
	    FirstTask(User, SourceItem) -- bring 15 normal herbs
	elseif qstPrg == 2 then
	    SecondTask(User, SourceItem) -- bring two rare herbs
	elseif qstPrg >= 3 and qstPrg <= 6 then
	    ThirdTask(User, SourceItem) -- answer three questions
    elseif qstPrg == 7 then
	    IsCharSure(User,SourceItem) -- char did all the tasks; if he wants to, he can become an alchemist
	end	
        	
end
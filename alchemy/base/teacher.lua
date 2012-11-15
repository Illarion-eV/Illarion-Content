require("base.common");
module("alchemy.base.teacher", package.seeall)

-- This script turns a character into an alchemist. 
-- Three 'beings' can does to: Knowing Tree, Thinking Stone, Recognizing Spring
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

-- questions and answers; note: one question and three answers, __the first answer ins the list of answers is the correct answer__
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

function GetTeacherQuestInfos(SourceItem)
    
	local questId; local teacherEN1; local teacherEN2; local teacherDE1; local teacherDE2
	if not SourceItem then
	    return
	elseif SourceItem.pos == position(1,1,0) then
	    questId = 350
		teacherEN1 = 
        teacherEN2 =
		teacherDE1 =
		teacherDE2 =
		


end

function UseItem(User,SourceItem,TargetItem,Counter,Param,ltstate)

      
	local questId, teacherEN1, teacherEN2, teacherDE1, teacherDE2 = GetTeacherQuestInfos(SourceItem)



end



















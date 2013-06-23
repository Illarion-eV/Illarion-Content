-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (66, 'quest.raban_66_wilderness');

require("base.common")
module("quest.raban_66_wilderness", package.seeall)

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Rabans Hain"
Title[ENGLISH] = "Raban's Grove"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Sammel zehn Tannen-Sprösslinge und bringe diese Raban. Nimm eine Sichel in die Hand und benutzt sie, während du vor einer Tanne stehst."
Description[ENGLISH][1] = "Collect ten fir tree sprout and bring them back to Raban. Use the sickle in your hand, while standing in front of a fir tree."
Description[GERMAN][2] = "Geh zu Raban in Rabans Hain. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][2] = "Go back to Raban in Raban's Grove, he certainly have another task for you."
Description[GERMAN][3] = "Sammel zwanzig Brombeeren und bringe diese Raban. Nimm eine Sichel in die Hand und benutzt sie, während du vor einer Hecke im Wald stehst."
Description[ENGLISH][3] = "Produce twenty blackberries and bring them back to Raban. Use the sickle in your hand, while standing in front of a hedge in the forest."
Description[GERMAN][4] = "Geh zu Raban in Rabans Hain. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][4] = "Go back to Raban in Raban's Grove, he certainly have another task for you."
Description[GERMAN][5] = "Sammel zehn fünf Champignons und bringe diese Raban. Nimm eine Sichel in die Hand und benutzt sie, während du vor einem Pilzkreis stehst."
Description[ENGLISH][5] = "Collect five champignons and bring them back to Raban. Use the sickle in your hand, while standing in front of a mushroom circle."
Description[GERMAN][6] = "Geh zu Raban in Rabans Hain. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][6] = "Go back to Raban in Raban's Grove, he certainly have another task for you."
Description[GERMAN][7] = "Besorge zehnmal groben Sand und bringe sie Raban. Nimm eine Schaufel in die Hand und benutze sie, während du vor einem Stein im Sand stehst."
Description[ENGLISH][7] = "Produce ten coarse sand and bring them to Raban. Use the shovel in your hand, while standing in front of a stone in the desert."
Description[GERMAN][8] = "Du hast alle Aufgaben von Raban erfüllt."
Description[ENGLISH][8] = "You have fulfilled all the tasks for Raban."


-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(819, 104, 0), position(822, 103, 0)} -- Tanne
QuestTarget[2] = {position(819, 104, 0)} 
QuestTarget[3] = {position(819, 104, 0), position(813, 100, 0)} -- Hecke
QuestTarget[4] = {position(819, 104, 0)} 
QuestTarget[5] = {position(819, 104, 0), position(812, 102, 0)} -- Pilzkreis
QuestTarget[6] = {position(819, 104, 0)} 
QuestTarget[7] = {position(819, 104, 0), position(352, 678, 0)} -- stone
QuestTarget[8] = {position(819, 104, 0)} 

-- Insert the quest status which is reached at the end of the quest
FINAL_QUEST_STATUS = 8


function QuestTitle(user)
    return base.common.GetNLS(user, Title[GERMAN], Title[ENGLISH])
end

function QuestDescription(user, status)
    local german = Description[GERMAN][status] or ""
    local english = Description[ENGLISH][status] or ""

    return base.common.GetNLS(user, german, english)
end

function QuestTargets(user, status)
    return QuestTarget[status]
end

function QuestFinalStatus()
    return FINAL_QUEST_STATUS
end

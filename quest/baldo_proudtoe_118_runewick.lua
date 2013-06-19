-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (118, 'quest.baldo_proudtoe_118_runewick');

require("base.common")
module("quest.baldo_proudtoe_118_runewick", package.seeall)

GERMAN = Player.german
ENGLISH = Player.english



-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Die Gärten von Runewick"
Title[ENGLISH] = "Runewick Gardens"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Sammel zehn Äpfel und bringe diese Baldo Proudtoe im Garten. Um Äpfel zu sammeln stelle dich vor einen Apfelbaum und benutze diesen."
Description[ENGLISH][1] = "Collect ten apples for Baldo Proudtoe in the Garden. You should start by collecting apples by standing infront of an appletree and use the appletree."
Description[GERMAN][2] = "Geh zu Baldo Proudtoe, der sich im Garten aufhält. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][2] = "Go back to Baldo Proudtoe in the Garden, he is sure to have another task for you."
Description[GERMAN][3] = "Sammel zehn Weintrauben und bringe diese Baldo Proudtoe im Garten. Um Weintrauben zu sammeln stelle dich vor einen Strauch und benutze diesen."
Description[ENGLISH][3] = "Collect ten grapes for Baldo Proudtoe in the Garden. You should start by collecting grapes by standing infront of an bush and use the bush."
Description[GERMAN][4] = "Du hast alle Aufgaben von Baldo Proudtoe erfüllt."
Description[ENGLISH][4] = "You have fulfilled all the tasks for Baldo Proudtoe."


-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(941, 790, 0), position(792, 819, 0), position(792, 777, 0)} -- Apple tree
QuestTarget[2] = {position(941, 790, 0)} 
QuestTarget[3] = {position(941, 790, 0), position(958, 785, 0)} -- Bush
QuestTarget[4] = {position(941, 790, 0)} 


-- Insert the quest status which is reached at the end of the quest
FINAL_QUEST_STATUS = 4


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

-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (652, 'quest.wulfgorda_652_wildness');

require("base.common")
module("quest.wulfgorda_652_wildness", package.seeall)

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Finde Borgate Northoff"
Title[ENGLISH] = "Find Borgate Northoff"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Suche Borgate Northoff, den Wirt vom Gasthof zur Hanfschlinge, und bringe ihn den Krug."
Description[ENGLISH][1] = "Seek Borgate Northoff the innkeeper of The Hemp Necktie Inn and bring him the mug."
Description[GERMAN][2] = "Du hast die Aufgabe von Wulfgorda erfüllt."
Description[ENGLISH][2] = "You have fulfilled the task for Wulfgorda."


-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(710, 313, 0)} 
QuestTarget[2] = {position(685, 315, 0)} 


-- Insert the quest status which is reached at the end of the quest
FINAL_QUEST_STATUS = 2


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
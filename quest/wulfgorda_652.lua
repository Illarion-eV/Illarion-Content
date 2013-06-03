-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (652, 'quest.wulfgorda_652');

require("base.common")
module("quest.wulfgorda_652", package.seeall)

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Finde Borgate Northoff im Gasthaus zur Hanfschlinge (Spinnen Maul)"
Title[ENGLISH] = "Find Borgate Northoff in the Hemp Necktie Inn (Spider's Mouth)"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Finde Borgate Northoff im Gasthaus zur Hanfschlinge und sprich mit ihm."
Description[ENGLISH][1] = "Find Borgate Northoff in the Hemp Necktie Inn and talk to him."
Description[GERMAN][2] = "Du hast Borgate gefunden. Da kannst nun das eine oder andere Bier bei ihm bestellen, wenn du magst."
Description[ENGLISH][2] = "You have found Borgate. If you like, you can order a beer from him now."

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(710, 313, 0)} -- Borgate

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

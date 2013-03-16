-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (642, 'quest.ruzusss_642_cadomyr');

require("base.common")
module("development.quest.ruzusss_642_cadomyr", package.seeall)

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Finde Ruzusss in Cadomyr"
Title[ENGLISH] = "Finde Königin Rosaline Edwards"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Finde Königin Rosaline Edwards und bringe ihr dein Geschenk."
Description[ENGLISH][1] = "Find Queen Rosaline Edwards and take her your gift."
Description[GERMAN][2] = "Du weißt nun wo Königin Rosaline Edwards zu finden ist."
Description[ENGLISH][2] = "You now know where you can find Queen Rosaline Edwards."

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(126, 630, 0)} -- Ruzusss
QuestTarget[2] = {position(122, 521, 0)} -- Queen

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

-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (632, 'quest.lotta_medborgar_632_galmair');

require("base.common")
module("development.lotta_medborgar_632_galmair", package.seeall)

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Finde Don Valerio Guilianni in Galmair"
Title[ENGLISH] = "Find Don Valerio Guilianni in Galmair"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Finde Don Valerio Guilianni und bringe ihm dein Geschenk."
Description[ENGLISH][1] = "Find Don Valerio Guilianni and take him your gift."
Description[GERMAN][2] = "Du weiﬂt nun wo Don Valerio Guilianni zu finden ist."
Description[ENGLISH][2] = "You now know where you can find Don Valerio Guilianni."

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(393, 326, -5)} -- Lotta
QuestTarget[2] = {position(337, 215, 0)} -- Don

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

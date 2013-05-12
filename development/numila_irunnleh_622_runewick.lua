-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (622, 'quest.numila_irunnleh_622_runewick');

require("base.common")
module("development.numila_irunnleh_622_runewick", package.seeall)

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Finde Erzmagier Elvaine Morgan"
Title[ENGLISH] = "Find Archmage Elvaine Morgan"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Finde Erzmagier Elvaine Morgan und bringe ihm dein Geschenk."
Description[ENGLISH][1] = "Find Archmage Elvaine Morgan and take him your gift."
Description[GERMAN][2] = "Du weiﬂt nun wo Erzmagier Elvaine Morgan zu finden ist."
Description[ENGLISH][2] = "You now know where you can find Archmage Elvaine Morgan."

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(898, 775, 2)} -- Archmage

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

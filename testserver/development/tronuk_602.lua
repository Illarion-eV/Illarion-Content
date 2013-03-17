-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (602, 'quest.tronuk_602');

require("base.common")
module("development.tronuk_602", package.seeall)

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Bier fÃ¼r Tronuk"
Title[ENGLISH] = "Beer for Tronuk"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Bringe Tronuk eine volle Flasche Bier."
Description[ENGLISH][1] = "Take Tronuk a full bottle beer."
Description[GERMAN][2] = "Tronuk hat nun genug Bier aber vielleicht möchte er zu einem späteren Zeitpunkt nach einer weiteren Flasche verlangen."
Description[ENGLISH][2] = "Tronuk has enough beer for now but he might want another bottle later on."

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(164, 621, 0)} -- Tronruk
QuestTarget[2] = {position(164, 621, 0)} -- Tronruk

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

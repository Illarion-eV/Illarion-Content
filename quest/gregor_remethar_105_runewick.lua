-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (105, 'quest.gregor_remethar_105_runewick');

require("base.common")
module("quest.gregor_remethar_105_runewick", package.seeall)

GERMAN = Player.german
ENGLISH = Player.english


-- Insert the quest title here, in both languages

Title = {}
Title[GERMAN] = "Ein Licht am Ende des Tunnels"
Title[ENGLISH] = "A light at the end of the tunnel"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Gehe in die Gruft und entzünde mindestens eines der Ehrenlichter, dann kehre zu Gregor Remethar zurück."
Description[ENGLISH][1] = "Go to the crypt and light at least one of the lamps in front of the urns, then return to Gregor Remethar."
Description[GERMAN][2] = "Gehe in die Gruft und entzünde mindestens eines der Ehrenlichter erneut, dann kehre zu Gregor Remethar zurück."
Description[ENGLISH][2] = "Go to the crypt and light at least one of the lamps in front of the urns again, then return to Gregor Remethar."


-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(907, 804, 0), position(906, 825, -3), position(906, 823, -3)} -- Lights
QuestTarget[2] = {position(907, 804, 0), position(906, 825, -3), position(906, 823, -3)} -- Lights



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

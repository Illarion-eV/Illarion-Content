-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (230, 'quest.explorerguild_320_questlog');

require("base.common")
require("quest.explorersguild")

module("quest.explorerguild_320_questlog", package.seeall)

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Abenteurergilde"
Title[ENGLISH] = "Explorers' Guild"

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}

-- Insert the quest status which is reached at the end of the quest
FINAL_QUEST_STATUS = 3


function QuestTitle(user)
    return base.common.GetNLS(user, Title[GERMAN], Title[ENGLISH])
end

function QuestDescription(user, status)
    local german = "Du hast bereits ".. quest.explorersguild.CountStones(user) .." Markierungssteine der Abenteurergilde gefunden. Weiter so!"
    local english = "You have already found ".. quest.explorersguild.CountStones(user) .." marker stones of the Explorers' Guild. Keep it up!"

    return base.common.GetNLS(user, german, english)
end

function QuestTargets(user, status)
    return QuestTarget[status]
end

function QuestFinalStatus()
    return FINAL_QUEST_STATUS
end
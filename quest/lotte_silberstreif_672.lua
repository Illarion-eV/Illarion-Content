-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (672, 'quest.lotte_silberstreif_672');

require("base.common")
module("quest.lotte_silberstreif_672", package.seeall)

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Galmairs Lotterie"
Title[ENGLISH] = "Galmair lotto game"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Du hast ein Los gekauft. Sprich mit Lotte Silbertreif um dein Los zu ziehen."
Description[ENGLISH][1] = "You bought a lot. Talk to Lotte Silberstreif to draw your lot."
Description[GERMAN][2] = "Du hast 5 Lose gekauft. Sprich mit Lotte Silbertreif um deine Lose zu ziehen."
Description[ENGLISH][2] = "You bought 5 lots. Talk to Lotte Silberstreif to draw your lots."
Description[GERMAN][10] = "Bring Lotte Silberstreif einen Apfel."
Description[ENGLISH][10] = "Bring one apple to Lotte Silberstreif."
Description[GERMAN][20] = "Bring Lotte Silberstreif 5 Kirschen."
Description[ENGLISH][20] = "Bring 5 cherries to Lotte Silberstreif."

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(685, 315, 0)} -- Lotte
QuestTarget[2] = {position(685, 315, 0)} -- Lotte
QuestTarget[10] = {position(685, 315, 0)} -- Lotte
QuestTarget[20] = {position(685, 315, 0)} -- Lotte

-- Insert the quest status which is reached at the end of the quest
FINAL_QUEST_STATUS = 0


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

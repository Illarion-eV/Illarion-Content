-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (650, 'quest.wulfgorda_650');

require("base.common")
module("quest.wulfgorda_650", package.seeall)

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Sibanac für Wulfgorda bei dem Gasthaus zur Hanfschlinge (Spinnenmaul)"
Title[ENGLISH] = "Sibanac for Wulfgorda at the Hemp Necktie Inn (Spider's Mouth)"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Finde Wulfgorda beim Gasthaus zur Hanfschlinge und bringe ihr die Sibanacblätter, um deine Belohnung zur erhalten."
Description[ENGLISH][1] = "Try to find Wulfgorda at the Hemp Necktie Inn and take her the sibanac leaves to get your reward."
Description[GERMAN][2] = "Du hast Wulfgorda gefunden. Wenn du möchtest, kannst du nun mit ihr sprechen. Frage sie nach 'Hilfe' wenn du nicht weißt, wonach du fragen sollst!\nSie kann dir einiges über die nordöstliche Karte von Illarion verraten."
Description[ENGLISH][2] = "You have found Wulfgorda. If you like, you can talk with her now. Ask for 'help' if you do not know what to say!\nShe can provide you with information about the north-eastern part of Illarion."

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(685, 315, 0)} -- Wulfgorda

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

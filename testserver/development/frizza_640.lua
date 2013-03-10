-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (640, 'quest.frizza_640');

require("base.common")
module("development.frizza_640", package.seeall)

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Finde Ruzusss in Cadomyr"
Title[ENGLISH] = "Find Ruzusss in Cadomyr"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Finde Ruzusss in Cadomyr and sprich mit ihr."
Description[ENGLISH][1] = "Find Ruzusss in Cadomyr and talk to her."
Description[GERMAN][2] = "Da kannst nun mit Frizza sprechen. Frage nach 'Hilfe' wenn du nicht weißt nach was du fragen sollst!\nSie kann dir einiges über die südwestliche Karte von Illarion verraten."
Description[ENGLISH][2] = "You can talk with Frizza now. Ask for 'help' if you do not know what to say!\nShe provides you with information about the south-western part of Illarion."

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(121, 643, 0)} -- Frizza
QuestTarget[2] = {position(126, 630, 0)} -- Ruzusss

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

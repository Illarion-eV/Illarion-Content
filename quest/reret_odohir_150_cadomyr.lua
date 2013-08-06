-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (150, 'quest.reret_odohir_150_cadomyr');

require("base.common")
module("quest.reret_odohir_150_cadomyr", package.seeall)

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Geschenk aus Cadomyr"
Title[ENGLISH] = "Present from Cadomyr"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Besorge fünf Wüstenhimmelskapseln und bringe sie Reret. Du findest sie zufällig in der Wüste. Also halte die Augen offen."
Description[ENGLISH][1] = "Find five desert sky capsules and bring them to Reret. You can find them randomly in the desert. So keep your eyes peeled."
Description[GERMAN][2] = "Du hast alle Aufgaben von Reret Odohir erfüllt."
Description[ENGLISH][2] = "You have fulfilled all the tasks for Reret Odohir."


-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(106, 553, 0)} 
QuestTarget[2] = {position(106, 553, 0)} 


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

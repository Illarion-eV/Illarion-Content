-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (603, 'quest.nobarg_603');

require("base.common")
module("development.nobarg_603", package.seeall)

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Bragon Priester"
Title[ENGLISH] = "Priest of Bragon"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][5] = "Bringe Nobarg folgende Gegenstände: Ein reines Feuer, eine rote Priester Robe und einen Goldkelch. Er wird dir nur weiterhelfen wenn du alle drei Gegenstände gleichzeitig bringst."
Description[ENGLISH][5] = "Bring following items to Nobarg: A pure element of fire, a red priest robe and a golden goblet. He will only help when you deliver all three items together."
Description[GERMAN][8] = "Nachdem du nun seine Aufgabe erfüllt hast, wird dir Nobarg deine Frage von Sir Fludnar Yednos beantworten. Stelle sie ihm daher, um die Antwort zu erhalten und um Quest 'Ork-Forscher' beenden zu können. Dieses Quest ist damit beendet."
Description[ENGLISH][8] = "Since you have accomplished his task, Nobarg will answer your question from Sir Fludnar Yednos. Ask him the question and he provide you the answer. You can continue with the quest 'Orc-Researcher' then. This quest is over now."


-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[5] = {position(475, 795, 0)} -- Nobarg
QuestTarget[8] = {position(475, 795, 0)} -- Nobarg

-- Insert the quest status which is reached at the end of the quest
FINAL_QUEST_STATUS = 8


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

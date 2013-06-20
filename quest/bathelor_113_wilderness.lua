-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (113, 'quest.bathelor_113_wilderness');

require("base.common")
module("quest.bathelor_113_wilderness", package.seeall)

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Feuer und Flamme"
Title[ENGLISH] = "A spark to a flame"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Gehe zu jeden einzelnen Schrein der Fünf in ihren Tempel."
Description[ENGLISH][1] = "Go to each of the shrines in the temple of the Five."
Description[GERMAN][2] = "Geh zu Bathelor, am Lagerfeuer westlich des Tempels der Fünf. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][2] = "Go back to Bathelor, on the campfire west of the temple of the Five, he is sure to have another task for you."
Description[GERMAN][3] = " Besorge zehn Scheite Naldorholz und bring sie Bathelor. Fülle hierfür einen Naldorbaum mit einen Beil."
Description[ENGLISH][3] = "Produce ten logs of naldor wood and bring them to Bathelor. Cut down a naldor tree with a hatchet."
Description[GERMAN][4] = "Du hast alle Aufgaben von Bathelor erfällt. Lobet Brágon!"
Description[ENGLISH][4] = "You have fulfilled all the tasks for Bathelor. Praise Brágon!"


-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(549, 138, 0), position(551, 133, 0), position(556, 135, 0), position(556, 141, 0), position(551, 143, 0), position(519, 128, 0)} -- Shrines
QuestTarget[2] = {position(519, 128, 0)} 
QuestTarget[3] = {position(519, 128, 0), position(511, 119, 0)} -- tree
QuestTarget[4] = {position(519, 128, 0)} 


-- Insert the quest status which is reached at the end of the quest
FINAL_QUEST_STATUS = 4


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

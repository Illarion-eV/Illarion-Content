-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (704, 'quest.berri_firegold_704_cadomyr');

require("base.common")
module("development.berri_firegold_704_cadomyr", package.seeall)

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Das Schmiedehandwerk"
Title[ENGLISH] = "The smithing craft"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Sammel 20 Klumpen Kohle und 20 Brocken Eisenerz für Berri Firegold."
Description[ENGLISH][1] = "Collect 20 lumps of coal and 20 pieces of iron ore for Berri Firegold."
Description[GERMAN][3] = "Schmilz zehn Eisenbarren für Berri Firegold an der Esse."
Description[ENGLISH][3] = "Smelt ten iron ingots for Berri Firegold at the furnace."
Description[GERMAN][5] = "Schmiede fünf Nägel und fünf Kelche für Berri Firegold."
Description[ENGLISH][5] = "Smith five pins and five goblets for Berri Firegold."
Description[GERMAN][6] = "Du hast alle Aufgaben von Berri Firegold erfüllt."
Description[ENGLISH][6] = "You have fulfilled all tasks of Berri Firegold."


-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(141, 582, 0), position(169, 617, 0), position(134, 696, 0)} -- Mines
QuestTarget[2] = {position(141, 582, 0)} 
QuestTarget[3] = {position(141, 582, 0), position(143, 590, 0)} -- Furnace
QuestTarget[4] = {position(141, 582, 0)} 
QuestTarget[5] = {position(141, 582, 0), position(139, 589, 0)} -- anvil

-- Insert the quest status which is reached at the end of the quest
FINAL_QUEST_STATUS = 6


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

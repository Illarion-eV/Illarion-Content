-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (706, 'quest.gerry_deloid_706_cadomyr');

require("base.common")
module("development.gerry_deloid_706_cadomyr", package.seeall)

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Das Kerzenziehen"
Title[ENGLISH] = "Candle making"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Sammel 20 Honigwaben für Gerry Deloid bei den Bienenstöcken auf dem Tisch vor ihm."
Description[ENGLISH][1] = "Collect twenty honeycombs for Gerry Deloid at the beehives on the tabel in front of him."
Description[GERMAN][2] = "Geh zu Gerry Deloid, er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][2] = "Go to Gerry Deloid, he has for sure another task for you."
Description[GERMAN][3] = "Stell 20 Stück Wachs beim Kerzenziehertisch in der Werkstatt her und zeig diese Gerry Deloid."
Description[ENGLISH][3] = "Produce twenty pieces of wax at the chandler table in the workshop and show these to Gerry Deloid."
Description[GERMAN][4] = "Geh zu Gerry Deloid, er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][4] = "Go to Gerry Deloid, he has for sure another task for you."
Description[GERMAN][5] = "Stell mittels der Kerzenform zehn Kerzen beim Kerzenziehertisch für Gerry Deloid her."
Description[ENGLISH][5] = "Produce ten candles using the candle mould at the chandler table in the workshop for Gerry Deloid. "
Description[GERMAN][6] = "Geh zu Gerry Deloid, er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][6] = "Go to Gerry Deloid, he has for sure another task for you."
Description[GERMAN][7] = "Stell mittels schwarzer Disteln zwei Flaschen Lampenöl an der Ölpresse in Cadomyr her und bring diese zu Gerry Deloid. Schwarze Disteln kannst du finden, wenn du auf felsigem Boden in Grasbüscheln suchst."
Description[ENGLISH][7] = "Produce two bottles of lamp oil with black thistles at the press in Cadomyr and take them to Gerry Deloid. You can find black thistles if you search the rocky ground in the grass."
Description[GERMAN][8] = "Du hast alle Aufgaben von Gerry Deloid erfüllt."
Description[ENGLISH][8] = "You have fulfilled all the tasks for Gerry Deloid."


-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(126, 572, 0), position(125, 574, 0)} -- Beehives
QuestTarget[2] = {position(126, 572, 0)} 
QuestTarget[3] = {position(126, 572, 0), position(138, 582, 0)} -- Chandler table
QuestTarget[4] = {position(126, 572, 0)} 
QuestTarget[5] = {position(126, 572, 0), position(138, 582, 0)} -- Chandler table
QuestTarget[6] = {position(126, 572, 0)} 
QuestTarget[7] = {position(126, 572, 0), position(87, 630, 0)} -- Grass

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

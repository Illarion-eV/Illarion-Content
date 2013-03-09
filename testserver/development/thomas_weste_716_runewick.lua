-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (716, 'quest.thomas_weste_716_runewick');

require("base.common")
module("development.thomas_weste_716_runewick", package.seeall)

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
Description[GERMAN][1] = "Sammel 20 Honigwaben für Thomas Weste bei den Bienenstöcken in Yewdale. Yewdale ist der Ort nördlich vom Teleporter."
Description[ENGLISH][1] = "Collect 20 honeycombs for Thomas Weste at the beehives in Yewdale. Yewdale can be found north of the teleporter."
Description[GERMAN][2] = "Geh zu Thomas Weste, er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][2] = "Go to Thomas Weste, he has for sure another task for you."
Description[GERMAN][3] = "Stell 20 Stück Wachs beim Kerzenziehertisch her und zeig diese Thomas Weste."
Description[ENGLISH][3] = "Produce 20 pieces of wax at the chandler table and show these to Thomas Weste."
Description[GERMAN][4] = "Geh zu Thomas Weste, er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][4] = "Go to Thomas Weste, he has for sure another task for you."
Description[GERMAN][5] = "Stell mittels der Kerzenform zehn Kerzen beim Kerzenziehertisch für Thomas Weste her."
Description[ENGLISH][5] = "Produce ten candles using the candle mould at the chandler table for Thomas Weste."
Description[GERMAN][6] = "Geh zu Thomas Weste, er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][6] = "Go to Thomas Weste, he has for sure another task for you."
Description[GERMAN][7] = "Stell mittels schwarzer Disteln zwei Flaschen Lampenöl an der Ölpresse in Runewick her und bring diese zu Thomas Weste. Schwarze Disteln kannst du finden, wenn du auf felsigem Boden in Grasbüscheln suchst. Die Presse findest du im Windturm."
Description[ENGLISH][7] = "Produce two bottles of lamp oil with black thistles at the press in Runewick and take them to Thomas Weste. You can find black thistles if you search the rocky ground in the grass. The press can be found in the wind tower."
Description[GERMAN][8] = "Du hast alle Aufgaben von Thomas Weste erfüllt."
Description[ENGLISH][8] = "You have fulfilled all the tasks for Thomas Weste."


-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(892, 755, 0), position(783, 805, 0)} -- Beehives
QuestTarget[2] = {position(892, 755, 0)} 
QuestTarget[3] = {position(892, 755, 0), position(890, 755, 0)} -- Chandler table
QuestTarget[4] = {position(892, 755, 0)} 
QuestTarget[5] = {position(892, 755, 0), position(890, 755, 0)} -- Chandler table
QuestTarget[6] = {position(892, 755, 0)} 
QuestTarget[7] = {position(892, 755, 0), position(841, 824, 0)} -- Grass

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

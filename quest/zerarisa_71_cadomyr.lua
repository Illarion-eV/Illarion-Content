-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (71, 'quest.zerarisa_71_cadomyr');

require("base.common")
module("quest.zerarisa_71_cadomyr", package.seeall)

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Kap des Abschiedes"
Title[ENGLISH] = "Cape Farewell"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Besorge zehn Forellen und bringe sie Zerarisa. Stelle dich ans Wasser und benutze die Angel um Fische zu fangen."
Description[ENGLISH][1] = "Obtain ten trout and take them back to Zerarisa. To fish, place yourself next to the water and use a fishing rod."
Description[GERMAN][2] = "Geh zu Zerarisa, die sich am Kap des Abschiedes aufhält. Sie hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][2] = "Go back to Zerarisa at Cape Farewell, she will certainly have another task for you."
Description[GERMAN][3] = "Besorge zwanzig Lachse und bringe sie Zerarisa. Stelle dich ans Wasser und benutze die Angel um Fische zu fangen."
Description[ENGLISH][3] = "Obtain twenty salmon and take them back to Zerarisa. To fish, place yourself next to the water and use a fishing rod."
Description[GERMAN][4] = "Geh zu Zerarisa, die sich am Kap des Abschiedes aufhält. Sie hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][4] = "Go back to Zerarisa at Cape Farewell, she will certainly have another task for you."
Description[GERMAN][5] = "Besorge fünf geräucherte Fische und bringe sie Zerarisa. Stelle dich vor eine Räucherhütte und benutze diese."
Description[ENGLISH][5] = "Obtain five smoked fish and take them back to Zerarisa. Stand in front of a smoke oven and use it to cook raw fish."
Description[GERMAN][6] = "Geh zu Zerarisa, die sich am Kap des Abschiedes aufhält. Sie hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][6] = "Go back to Zerarisa at the Cape Farewell, she will certainly have another task for you."
Description[GERMAN][7] = "Besorge zehn Stück Leder und bringe sie Zerarisa. Du kannst Leder beim Händler kaufen oder du kannst Rohleder oder Fell am Spannrahmen mit einer Rasierklinge gerben."
Description[ENGLISH][7] = "Obtain ten pieces of leather and take them back to Zerarisa. You can buy leather from a merchant or tan raw leather or fur with a razor on a strecher."
Description[GERMAN][8] = "Du hast alle Aufgaben von Zerarisa erfüllt. "
Description[ENGLISH][8] = "You have fulfilled all the tasks for Zerarisa."


-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(46, 683, 0), position(42, 686, 0)} -- Angelplatz
QuestTarget[2] = {position(46, 683, 0)} 
QuestTarget[3] = {position(46, 683, 0), position(42, 686, 0)} -- Angelplatz
QuestTarget[4] = {position(46, 683, 0)} 
QuestTarget[5] = {position(46, 683, 0), position(117, 577, 0)} -- smoke oven
QuestTarget[6] = {position(46, 683, 0)} 
QuestTarget[7] = {position(46, 683, 0), position(920, 659, 0), position(911, 798, 1), position(125, 578, 0)} -- Henry Darter, Händler, Spannrahmen
QuestTarget[8] = {position(46, 683, 0)} 

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

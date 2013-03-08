-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (708, 'quest.thorgrem silverbeard_708_galmair');

require("base.common")
module("development.thorgrem silverbeard_708_galmair", package.seeall)

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
Description[GERMAN][1] = "Sammel 20 Klumpen Kohle und 20 Brocken Eisenerz und bring diese zu Thorgrem Silverbeard. Wenn du aus der Werkstatt die südliche Tür hinaus nimmst, der Straße nach Süden folgst bis du zu einer Brücke gelangst und anschließend weiter nach Südosten gehst erreichst du die Malachitmine. Zur Dunkellochmine gelangst du wenn du die Stadt im Osten verlässt, der Straße nach Osten folgst, die goldene Brücke überquerst und anschließend die goldene Brücke im Norden nochmals überquerst. Nach der Brücke nimmst du den Weg nach Westen und und überquerst die Holzbrücke und dann hast du dein Ziel erreicht."
Description[ENGLISH][1] = "Collect twenty lumps of coal and twenty pieces of iron ore and take them to Thorgrem Silverbeard. You can find the Malachite Mine if you leave the workshop through the south door and follow the street south until you reach a bridge; over the bridge you follow the street south east and then you are there. To find the Dark Hole Mine you have to leave the city to the east, then you follow the street, crossing a golden bridge and bearing north until you reach another bridge; again you go over a bridge and follow the street to the west where you just need to go over the wooden bridge to get to the mine." 
Description[GERMAN][2] = "Geh zu Thorgrem Silverbeard, er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][2] = "Go back to Thorgrem Silverbeard, he is sure to have another task for you."
Description[GERMAN][3] = "Schmilz zehn Eisenbarren für Thorgrem Silverbeard an der Esse. Um die Barren herzustellen, musst du die Tiegelzange in die Hand nehmen und bei der Esse benutzen."
Description[ENGLISH][3] = "Smelt ten iron ingots for Thorgrem Silverbeard at the furnace. To smelt the ingots you have to use the furnace as you stand in front of it, with the crucible-pincers in your hand."
Description[GERMAN][4] = "Geh zu Thorgrem Silverbeard, er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][4] = "Go back to Thorgrem Silverbeard, he is sure to have another task for you."
Description[GERMAN][5] = "Schmiede fünf Nägel und fünf Kelche für Thorgrem Silverbeard. Für die Nägel musst du den Hammer mit dem gelben Griff benutzen. Für die Kelche nimmst du den Feinschmiedehammer mit dem roten Griff."
Description[ENGLISH][5] = "Smith five pins and five goblets for Thorgrem Silverbeard. For the pins you have to use the hammer with the yellow handle, for the goblets use the finesmithing hammer with the red handle."
Description[GERMAN][6] = "Du hast alle Aufgaben von Thorgrem Silverbeard erfüllt."
Description[ENGLISH][6] = "You have fulfilled all the tasks for Thorgrem Silverbeard."


-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(387, 273, 0), position(397, 145, 0), position(426, 355, 0)} -- Mines
QuestTarget[2] = {position(387, 273, 0)} 
QuestTarget[3] = {position(387, 273, 0), position(387, 272, 0)} -- Furnace
QuestTarget[4] = {position(387, 273, 0)} 
QuestTarget[5] = {position(387, 273, 0), position(383, 272, 0)} -- anvil

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

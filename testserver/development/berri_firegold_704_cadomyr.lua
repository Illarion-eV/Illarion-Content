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
Description[GERMAN][1] = "Sammel 20 Klumpen Kohle und 20 Brocken Eisenerz und bring diese zu Berri Firegold. Wenn du die Stadt verlässt und nach Süden der Straße folgt erreichst du den 'Grundstein der Aufrichtigkeit', dort kannst du Kohle finden. Wenn du die Stadt verlässt und nach Nordosten gehst, erreichst du den 'Freiheitsbruch', dort findest du Eisen- und Kupfererz und manchmal sogar Goldnuggets. Mit der Spitzhacke kannst du das Erz von den Steinen abbauen."
Description[ENGLISH][1] = "Collect twenty lumps of coal and twenty pieces of iron ore and take them to Berri Firegold. If you leave the town and follow the street to the south you will reach the 'Cornerstone of Candour', you can find coal there. If you leave the town and go northeast you will reach the 'Liberty Quarry', you can find iron and copper ore there, and sometimes even gold nuggets. You can get the ore by using the pickaxe on the stones." 
Description[GERMAN][3] = "Schmilz zehn Eisenbarren für Berri Firegold an der Esse. Um die Barren herzustellen musst du die Tiegelzange in die Hand nehmen und bei der Esse benutzen."
Description[ENGLISH][3] = "Smelt ten iron ingots for Berri Firegold at the furnace. To smelt the ingots you have to take the crucible-pincers in your hand and use them in front of the furnace."
Description[GERMAN][5] = "Schmiede fünf Nägel und fünf Kelche für Berri Firegold. Für die Nägel musst du den Hammer mit dem gelben Griff benutzen, für die Kelche nimmst du den Feinschmiedehammer mit dem roten Griff."
Description[ENGLISH][5] = "Smith five pins and five goblets for Berri Firegold. For the pins you have to use the hammer with the yellow handle, for the goblets use the finesmithing hammer with the red handle."
Description[GERMAN][6] = "Du hast alle Aufgaben von Berri Firegold erfüllt."
Description[ENGLISH][6] = "You have fulfilled all the tasks for Berri Firegold."


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

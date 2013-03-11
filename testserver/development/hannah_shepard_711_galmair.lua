-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (711, 'quest.hannah_shepard_711_galmair');

require("base.common")
module("development.hannah_shepard_711_galmair", package.seeall)

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Der Ackerbau und das Kochen"
Title[ENGLISH] = "Farming and cooking"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Sammel fünf Getreidebündel für Hannah Shepard bei den Feldern von Galmair. Um Getreidebündel zu kriegen, musst du das Getreide von Hannah auf den Feldern säen. Dazu benutz du das Getreide, während du auf dem Feld stehst. Anschließend musst du warten, bis es reif ist. Sobald es reif ist, nimmst du die Sense in die Hand und benutzt diese, um das Getreide zu Getreidebündeln zu schneiden."
Description[ENGLISH][1] = "Collect five bundles of grain for Hannah Shepard at the fields of Galmair. To get the bundles of grain you have to seed the grain which Hannah gave you on the fields. To do this just use the grain while standing on the field. Once the crop is ready, harvest the ripened grain using the scythe you got from Hannah."
Description[GERMAN][2] = "Geh zu Hannah Shepard bei den Feldern von Galmair. Sie hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][2] = "Go back to Hannah Shepard at the fields of Galmair, she is sure to have another task for you."
Description[GERMAN][3] = "Produzier fünf Säcke Mehl für Hannah Shepard bei den Feldern von Galmair. Um Mehl zu produzieren, musst du die Getreidebündel mit dem Dreschflegel in der Hand zu Getreide schlagen. Hast du erst einmal Getreide, musst du zum Mühlstein im Palast von Galmair, welcher im Westen liegt. Beim Palast angekommen, ist der Mühlstein gleich im ersten Raum auf der rechten Seite. Dort angekommen, benutzt du den Mühlstein mit der Holzkelle in der Hand und machst aus dem Getreide Mehl."
Description[ENGLISH][3] = "Produce five sacks of flour for Hannah Shepard at the fields of Galmair. To produce flour you have to use the flail in your hand with the bundles of grain in your inventory. Once you've produced grain from the bundles of grain go to the millstone in the Palace of Galmair. You can find the palace if you follow the street to the west, once you have entered the city. On arrival at the palace, the millstone can be found in the first room at the right-hand side. To make flour you have to take the wooden shovel in your hand and use the millstone."
Description[GERMAN][4] = "Geh zu Hannah Shepard bei den Feldern von Galmair. Sie hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][4] = "Go back to Hannah Shepard at the fields of Galmair, she is sure to have another task for you."
Description[GERMAN][5] = "Back fünf Brötchen für Hannah Shepard bei den Feldern von Galmair. Um Brötchen zu backen, brauchst du Eimer mit Wasser und Mehl. Im Palast von Galmair ist ein Backofen. Dort nimmst du den Backofenschieber in die Hand und benutzt ihn vor dem Backofen, um Brötchen herzustellen."
Description[ENGLISH][5] = "Bake five bread rolls for Hannah Shepard at the fields of Galmair. To bake bread rolls you need buckets of water and flour. In the Palace of Galmair there is a baking oven. Once you find it, take the peel in your hand and use it while standing in front of the baking oven."
Description[GERMAN][6] = "Geh zu Hannah Shepard bei den Feldern von Galmair. Sie hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][6] = "Go back to Hannah Shepard at the fields of Galmair, she is sure to have another task for you."
Description[GERMAN][7] = "Koch für Hannah Shepard bei den Feldern von Galmair im Kessel neben ihr fünf Würstchen. Um Würstchen herzustellen, brauchst Schweinefleisch und Eingeweide. Beides findest du, wenn du Schweine erlegst. Hast du die Zutaten besorgt, musst du den Kochlöffel in die Hand nehmen und diesen benutzen, während du vor dem Kessel stehst."
Description[ENGLISH][7] = "Cook for Hannah Shepard at the fields of Galmair five sausages at the kettle next her. To produce sausages you need pork and entrails, both can be obtained if you kill pigs. Once you have the ingredients, you have to take the cooking spoon in your hand and use it while standing in front of a kettle."
Description[GERMAN][8] = "Du hast alle Aufgaben von Hannah Shepard erfüllt."
Description[ENGLISH][8] = "You have fulfilled all the tasks for Hannah Shepard."


-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(434, 257, 0), position(430, 261, 0)} -- Fields
QuestTarget[2] = {position(434, 257, 0)} 
QuestTarget[3] = {position(434, 257, 0), position(378, 230, 0)} -- Millstone
QuestTarget[4] = {position(434, 257, 0)} 
QuestTarget[5] = {position(434, 257, 0), position(374, 239, 0)} -- Baking oven
QuestTarget[6] = {position(434, 257, 0)} 
QuestTarget[7] = {position(434, 257, 0), position(433, 257, 0)} -- Camp fire

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

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
Description[GERMAN][1] = "Sammel fünf Getreidebündel für Hannah Shepard. Um Getreidebündel zu kriegen musst du das Getreide von Hannah auf den Feldern säen, dazu benutz du das Getreide während du auf dem Feld stehst. Anschließend musst du warten bis es reif ist. Sobald es reif ist nimmst du die Sense in die Hand und schneidest das Getreide zu Getreidebündeln."
Description[ENGLISH][1] = "Collect five bundles of grain for Hannah Shepard. To get bundles of grain you have to seed the grain which Hannah gave you on the fields. To do that just use the grain while staying on the field. Once the crop is ready, harvest the ripened grain with the scythe from Hannah."
Description[GERMAN][2] = "Geh zu Hannah Shepard, sie hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][2] = "Go to Hannah Shepard, she has for sure another task for you."
Description[GERMAN][3] = "Produzier fünf Säcke Mehl für Hannah Shepard. Um Mehl zu produzieren musst du die Getreidebündel mit dem Dreschflegel in der Hand zu Getreide schlagen. Hast du erst einmal Getreide musst du zum Mühlstein im Palast von Galmair welcher im Westen ist. Beim Palast angekommen ist der Mühlstein gleich im ersten Raum auf der rechten Seite. Dort angekommen machst du beim Mühlstein mit der Holzkelle in der Hand Mehl aus dem Getreide."
Description[ENGLISH][3] = "Produce five sacks of flour for Hannah Shepard. To produce flour you have to use the flain in your hand while having bundles of grain in your inventory. Once you've made grain from the bundles of grain go to the millstone in the palace of Galmair. You can find the palace if you follow the street to the west, once you entered the city. Once arrived at the palace the millstone can be found in the first room at the right-hand side. To make flour you have to take the wooden shovel in your hand and use the millstone."
Description[GERMAN][4] = "Geh zu Hannah Shepard, sie hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][4] = "Go to Hannah Shepard, she has for sure another task for you."
Description[GERMAN][5] = "Backt fünf Brötchen für Hannah Shepard. Um Brötchen zu backen brauchst du Eimer mit Wasser und Mehl. Im Palast von Galmair ist ein Backofen, dort nimmst du den Backofenschieber in die Hand und benutzt ihn vor dem Backofen um Brötchen herzustellen."
Description[ENGLISH][5] = "Back five bread rolls for Hannah Shepard. To back bread rolls you need a bucket with water and flour. In the palace of Galmair is a baking oven, once you are there take the peel in your hand and use it while staying in front of the baking oven."
Description[GERMAN][6] = "Geh zu Hannah Shepard, sie hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][6] = "Go to Hannah Shepard, she has for sure another task for you."
Description[GERMAN][7] = "Koch fünf Würstchen für Hannah Shepard am Kessel neben ihr. Um Würstchen herzustellen brauchst Schweinefleisch und Eingeweide, beide findest du wenn du Schweine erlegst. Hast du die Zutaten erst kannst du mit dem Kochlöffel in der Hand bei einem Kessel Würstchen daraus machen."
Description[ENGLISH][7] = "Cook five sausages for Hannah Shepard at the kettle next her. To produce sausages you need pork and entrails, both can be found if you kill pigs. Once you have the ingridients you have to take the cooking spoon in your hand and use it while staying in front of a kettle."
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

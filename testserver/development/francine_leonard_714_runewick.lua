-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (714, 'quest.francine_leonard_714_runewick');

require("base.common")
module("development.francine_leonard_714_runewick", package.seeall)

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
Description[GERMAN][1] = "Sammel fünf Getreidebündel für Francine Leonard. Um Getreidebündel zu kriegen, musst du das Getreide von Francine auf den Feldern in Yewdale säen. Dazu benutz du das Getreide, während du auf dem Feld stehst. Anschließend musst du warten, bis es reif ist. Sobald es reif ist, nimmst du die Sense in die Hand und schneidest das Getreide zu Getreidebündeln."
Description[ENGLISH][1] = "Collect five bundles of grain for Francine Leonard. To get the bundles of grain you have to seed the grain which Francine gave you on the fields in Yewdale. To do this just hold the grain in your hand and use it, whilst standing on the field. Once the crop is ready, harvest the ripened grain by holding the scythe you got from Francine in your hand and using it."
Description[GERMAN][2] = "Geh zu Francine Leonard. Sie hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][2] = "Go back to Francine Leonard, she is sure to have another task for you."
Description[GERMAN][3] = "Produzier fünf Säcke Mehl für Francine Leonard. Um Mehl zu produzieren, musst du die Getreidebündel mit dem Dreschflegel in der Hand zu Getreide schlagen. Hast du erst einmal Getreide, musst du zum Mühlstein links von Francine. Um anschließend Mehl daraus zu machen, nimmst du die Holzkelle in die Hand und benutzt den Mühlstein."
Description[ENGLISH][3] = "Produce five sacks of flour for Francine Leonard. To produce flour you have to first thresh the bundles of grain; you do this by using the flail in your hand with the bundles of grain in your inventory. Once you've produced grain from the bundles of grain, go to the millstone on the left-hand side of Francine. To make flour you have to take the wooden shovel in your hand and use the millstone."
Description[GERMAN][4] = "Geh zu Francine Leonard. Sie hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][4] = "Go back to Francine Leonard, she is sure to have another task for you."
Description[GERMAN][5] = "Backt fünf Brötchen für Francine Leonard. Um Brötchen zu backen, brauchst du Eimer mit Wasser und Mehl. Im anderen, nördlichen Raum ist ein Backofen. Geh dorthin und nimm den Backofenschieber in die Hand und benutz den Backofen anschließend, um Brötchen zu backen."
Description[ENGLISH][5] = "Bake five bread rolls for Francine Leonard. To bake bread rolls you need buckets of water and flour. In the other room, north of your current position, is a baking oven. Go there and use the peel in your hand whilst standing in front of the baking oven to bake the bread rolls."
Description[GERMAN][6] = "Geh zu Francine Leonard. Sie hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][6] = "Go back to Francine Leonard, she is sure to have another task for you."
Description[GERMAN][7] = "Koch fünf Würstchen für Francine Leonard am Kessel neben ihr. Um Würstchen herzustellen, brauchst Schweinefleisch und Eingeweide. Beides findest du, wenn du Schweine erlegst. Hast du die Zutaten erlangt, kannst du mit dem Kochlöffel in der Hand bei einem Kessel Würstchen daraus machen."
Description[ENGLISH][7] = "Cook five sausages for Francine Leonard at the kettle next her. To produce sausages you need pork and entrails, both can be obtained if you kill pigs. Once you have the ingredients, you have to take the cooking spoon in your hand and use it whilst standing in front of the kettle."
Description[GERMAN][8] = "Du hast alle Aufgaben von Francine Leonard erfüllt."
Description[ENGLISH][8] = "You have fulfilled all the tasks for Francine Leonard."


-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(893, 837, 0), position(781, 804, 0)} -- Fields
QuestTarget[2] = {position(893, 837, 0)} 
QuestTarget[3] = {position(893, 837, 0), position(895, 832, 0)} -- Millstone
QuestTarget[4] = {position(893, 837, 0)} 
QuestTarget[5] = {position(893, 837, 0), position(907, 832, 0)} -- Baking oven
QuestTarget[6] = {position(893, 837, 0)} 
QuestTarget[7] = {position(893, 837, 0), position(894, 837, 0)} -- Camp fire

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

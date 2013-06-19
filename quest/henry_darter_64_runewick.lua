-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (64, 'quest.henry_darter_64_runewick');

require("base.common")
module("quest.henry_darter_64_runewick", package.seeall)


GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages

Title = {}
Title[GERMAN] = "Morgentausumpf"
Title[ENGLISH] = "Dewy Swamps"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Gehe zu den Scheinen, schlachte sie und sammle 10 Stück Schweinefleisch. Kehre anchließend zu Henry Darter zurück."
Description[ENGLISH][1] = "Go to the pigs, butcher them and collect 10 pieces of pork. Then return to Henry Darter."
Description[GERMAN][2] = "Geh zu Henry Darter, welcher sich im Morgenausumpf aufhält. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][2] = "Go back to Henry Darter in the Dewy Swamps, he is sure to have another task for you."
Description[GERMAN][3] = "Gehe zu den Scheinen, schlachte sie und sammle 20 Stück Roheder. Kehre anchließend zu Henry Darter zurück."
Description[ENGLISH][3] = "Go to the pigs, butcher them and collect 20 pieces of raw leather. Then return to Henry Darter."
Description[GERMAN][4] = "Geh zu Henry Darter, welcher sich im Morgenausumpf aufhält. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][4] = "Go back to Henry Darter in the Dewy Swamps, he is sure to have another task for you."
Description[GERMAN][5] = "Gehe zu den Schfen, schlachte sie und sammle 5 Lammkeulen. Kehre anchließend zu Henry Darter zurück."
Description[ENGLISH][5] = "Go to the sheeps, butcher them and collect 5 pieces of lamb meat. Then return to Henry Darter."
Description[GERMAN][6] = "Geh zu Henry Darter, welcher sich im Morgenausumpf aufhält. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][6] = "Go back to Henry Darter in the Dewy Swamps, he is sure to have another task for you."
Description[GERMAN][7] = "Gehe zur Malachitmine und hohle 20 Brocken Kohle. Kehre anchließend zu Henry Darter zurück. Falls du hilfe brauchst frage Henrys Freund Bruno Blackhole."
Description[ENGLISH][7] = "Go to the Malachit mine and get 20 lumps of coal. Then return to Henry Darter. If you need help ask Henry's friend Bruno Blackhole."
Description[GERMAN][8] = "Du hast alle Aufgaben von Henry Darter erfüllt."
Description[ENGLISH][8] = "You have fulfilled all the tasks for Henry Darter." 

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(920, 659, 0), position(905, 673, 0)} -- Pigs
QuestTarget[2] = {position(920, 659, 0)} 
QuestTarget[3] = {position(920, 659, 0), position(905, 673, 0)} -- Pigs
QuestTarget[4] = {position(920, 659, 0)} 
QuestTarget[5] = {position(920, 659, 0), position(894, 762, 0)} -- Sheeps
QuestTarget[6] = {position(920, 659, 0)} 
QuestTarget[7] = {position(920, 659, 0), position(439, 359, 0)} -- Bruno Blackhole/Malachitmine
QuestTarget[8] = {position(920, 659, 0)} 

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

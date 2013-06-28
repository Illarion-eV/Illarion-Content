-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (317, 'quest.mirarie_bragolin_317_cadomyr');

require("base.common")
module("quest.mirarie_bragolin_317_cadomyr", package.seeall)

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Geschichte schreiben"
Title[ENGLISH] = "Writing History"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Besorge fünf Wasserflaschen und bringe sie Mirarie. Du kannst sie bei einem Händler kaufen oder große leere Flaschen an einem Brunnen oder Gewässer füllen."
Description[ENGLISH][1] = "Produce five bottles of water and bring them to Hector. You can buy them from a merchant or fill a large empty bottle on a fountain or on the water."
Description[GERMAN][2] = "Geh zu Mirarie Bragolin in Cadomyr. Sie hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][2] = "Go back to Mirarie Bragolin in Cadomyr, she certainly have another task for you."
Description[GERMAN][3] = "Sprich Thomas Dalenus auf dem Marktplatz von Cadomyr wegen des Briefes an. Kehre dann zu Mirarie zurück."
Description[ENGLISH][3] = "Talk to Thomas Dalenus on the market place of Cadomyr concerning the letter. Then return to Mirarie."
Description[GERMAN][4] = "Geh zu Mirarie Bragolin in Cadomyr. Sie hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][4] = "Go back to Mirarie Bragolin in Cadomyr, she certainly have another task for you."
Description[GERMAN][5] = "Sprich Grakamesh an der Mauer von Cadomyr wegen der Nachricht an. Kehre dann zu Mirarie zurück."
Description[ENGLISH][5] = "Talk to Grakamesh out of the walls of Cadomyr concerning the message. Then return to Mirarie."
Description[GERMAN][6] = "Geh zu Mirarie Bragolin in Cadomyr. Sie hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][6] = "Go back to Mirarie Bragolin in Cadomyr, she certainly have another task for you."
Description[GERMAN][7] = "Sprich William Daloire, einem Kräuterkundigen aus Runewick, wegen der Nachricht an. Kehre dann zu Mirarie zurück."
Description[ENGLISH][7] = "Talk to William Daloire a herbalist in Runewick concerning the message. Then return to Mirarie."
Description[GERMAN][6] = "Geh zu Mirarie Bragolin in Cadomyr. Sie hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][6] = "Go back to Mirarie Bragolin in Cadomyr, she certainly have another task for you."
Description[GERMAN][9] = "Sprich Valerio Guilianni, den Don von Galmair, wegen der Nachricht an. Kehre dann zu Mirarie zurück."
Description[ENGLISH][9] = "Talk to Don Valerio Guilianni in Galmair concerning the message. Then return to Mirarie."
Description[GERMAN][10] = "Du hast alle Aufgaben von Mirarie Bragolin erfüllt."
Description[ENGLISH][10] = "You have fulfilled all the tasks for Mirarie Bragolin."


-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(128, 621, 0), position(113, 574, 0), position(117, 607, 0)} 
QuestTarget[2] = {position(128, 621, 0)} 
QuestTarget[3] = {position(128, 621, 0), position(113, 611, 0)} 
QuestTarget[4] = {position(128, 621, 0)} 
QuestTarget[5] = {position(128, 621, 0), position(133, 638, 0)} 
QuestTarget[6] = {position(128, 621, 0)} 
QuestTarget[7] = {position(128, 621, 0), position(897, 794, 1)} 
QuestTarget[8] = {position(128, 621, 0)} 
QuestTarget[9] = {position(128, 621, 0), position(337, 215, 0)} 
QuestTarget[10] = {position(128, 621, 0)} 

-- Insert the quest status which is reached at the end of the quest
FINAL_QUEST_STATUS = 10


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
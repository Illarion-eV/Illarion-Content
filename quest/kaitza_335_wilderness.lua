	
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (335, 'quest.kaitza_335_wilderness');
     
require("base.common")
module("quest.kaitza_335_wilderness", package.seeall)
     
GERMAN = Player.german
ENGLISH = Player.english
     
-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Fischen für Echsen"
Title[ENGLISH] = "Fishing For Lizards"
     
-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Besorge zehn Forellen und bringe sie zu Kaitza. Stelle dich ans Wasser und benutze die Angel um Fische zu fangen."
Description[ENGLISH][1] = "Produce ten trouts and bring them back to Kaitza. Place yourself next to the water and use a fishing rod to fish."
Description[GERMAN][2] = "Kehre zurück zu Kaitza und frage, ob er noch eine Aufgabe für dich hat."
Description[ENGLISH][2] = "Go back to Kaitza, he certainly have another task for you." 
Description[GERMAN][3] = "Besorge fünf Lachse und bringe sie zu Kaitza. Stelle dich ans Wasser und benutze die Angel um Fische zu fangen."
Description[ENGLISH][3] = "Produce five salmon and bring them back to Kaitza. Place yourself next to the water and use a fishing rod to fish."
Description[GERMAN][4] = "Du hast alle Aufgaben von Kaitza erfüllt."
Description[ENGLISH][4] = "You have fulfilled all the tasks for Kaitza." 

   
-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(841, 743, 0), position(791, 798, 0)} -- Angelpunkt
QuestTarget[2] = {position(841, 743, 0)} 
QuestTarget[3] = {position(841, 743, 0), position(791, 798, 0)} -- Angelpunkt
QuestTarget[4] = {position(841, 743, 0)} 

     
-- Insert the quest status which is reached at the end of the quest
FINAL_QUEST_STATUS = 4
     
     
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

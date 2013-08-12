-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (334, 'quest.madeline_clarbelis_334_runewick');

require("base.common")
module("quest.madeline_clarbelis_334_runewick", package.seeall)	
	
	
GERMAN = Player.german
ENGLISH = Player.english
     
	
-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Der faule Lehrling"
Title[ENGLISH] = "The Lazy Apprentice"
     
-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[ENGLISH][1] =  "Pick four foot leaves from ferns in the grass and two firnis blossoms from the flowering plants in the woods."
Description[GERMAN][1] = "Besorge vier Fussblatt und zwei Firnisblüten. Fussblatt findest du im Farn der auf Gras wächst und Firnisblüten in Blumen die im Wald wachsen. "
Description[GERMAN][2] = "Du hast die Aufgabe von Madeline Clarbelis erfüllt."
Description[ENGLISH][2] = "You have fulfilled the task for Madeline Clarbelis."


-- Insert the position of the quest start here (probably the position of an NPC or item)
Start = {951, 766, 1}
 
-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(951, 766, 1), position (857, 821, 0), position (851, 826, 0)} -- NPC Ausgangspunkt
QuestTarget[2] = {position(951, 766, 1)} --NPC Questabgabe

     
-- Insert the quest status which is reached at the end of the quest
FINAL_QUEST_STATUS = 2
     
     
function QuestTitle(user)
    return base.common.GetNLS(user, Title[GERMAN], Title[ENGLISH])
end
     
function QuestDescription(user, status)
    local german = Description[GERMAN][status] or ""
    local english = Description[ENGLISH][status] or ""
     
    return base.common.GetNLS(user, german, english)
end

function QuestStart()
    return Start
end
     
function QuestTargets(user, status)
    return QuestTarget[status]
end
     
function QuestFinalStatus()
    return FINAL_QUEST_STATUS
end

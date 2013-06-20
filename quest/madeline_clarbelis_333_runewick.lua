-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (113, 'quest.madeline_clarbelis_333_runewick');

require("base.common")
module("quest.madeline_clarbelis_333_runewick", package.seeall)	
	
	
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
Description[ENGLISH][1] = "Bring four foot leaf from fern on grass and two firnisblossom from a flower in the wood. "
Description[GERMAN][1] = "Besorge vier Fussblatt und zwei Firnisblüten. Fussblatt findest Du im Farn auf Gras und Firnisblüte in einer Blume im Wald. "
Description[GERMAN][2] = "Du hast die Aufgabe von Madeline Clarbelis erfüllt."
Description[ENGLISH][2] = "You have fulfilled the task of Madeline Clarbelis." 
 
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
     
function QuestTargets(user, status)
    return QuestTarget[status]
end
     
function QuestFinalStatus()
    return FINAL_QUEST_STATUS
end

-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (205, 'quest.neiran_el_nyarale_205_runewick');
     
	 
require("base.common")
module("quest.neiran_el_nyarale_205_runewick", package.seeall)
     
	 
GERMAN = Player.german
ENGLISH = Player.english
     
-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Die Schatzkammer Runewicks"
Title[ENGLISH] = "Runewick Treasury"
     
-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Spende Gegenstände oder Münzen für die Schatzkammer Runewicks. Lege dafür den Gegenstand auf das markierte Feld neben Neiran. Kehre dann zu Neiran el Nyarale zurück."
Description[ENGLISH][1] = "Donate items or coins to Runewick's treasury. Put the item on the bordered area next to Neiran. Then go back to Neiran el Nyarale."
Description[GERMAN][2] = "Du hast schon einmal für Runewick gespendet, dies sollte dich aber nicht davon abhalten, weiter Gegenstände oder Münzen für deine Stadt zu spenden."
Description[ENGLISH][2] = "You have already donated to Runewick but nevertheless you can always donate more items or coins to your town." 

 
-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(897, 779, 2), position(897, 781, 2)} 
QuestTarget[2] = {position(897, 781, 2)}

     
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

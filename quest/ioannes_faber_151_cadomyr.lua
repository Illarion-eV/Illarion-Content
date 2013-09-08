-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (151, 'quest.ioannes_faber_151_cadomyr');
     
require("base.common")
require("base.factions")
module("quest.ioannes_faber_151_cadomyr", package.seeall)
     
GERMAN = Player.german
ENGLISH = Player.english
     
-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Die Schatzkammer Cadomyrs"
Title[ENGLISH] = "Cadomyr Treasury"
     
-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Spende Gegenstände oder Münzen für die Schatzkammer Cadomyrs. Lege dafür den Gegenstand auf das markierte Feld neben dem Thron von Königin Rosaline Edwards."
Description[ENGLISH][1] = "Donate items or coins for Cadomyr Treasury. Put the item on the bordered area next to throne of queen Rosaline Edwards."
Description[GERMAN][2] = "Kehre zu Ioannes Faber zurück."
Description[ENGLISH][2] = "Return to Ioannes Faber."
Description[GERMAN][3] = "Du hast schon einmal für Cadomyr gespendet. Dies sollte dich aber nicht davon abhalten, weiter Gegenstände oder Münzen für deine Stadt zu spenden."
Description[ENGLISH][3] = "You have already donated to Cadomyr. But you can still donate more items or coins for your town."


-- Insert the position of the quest start here (probably the position of an NPC or item)
Start = {129, 529, 0}


 
-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(116, 520, 0)} 
QuestTarget[2] = {position(129, 529, 0)}
QuestTarget[3] = {position(129, 529, 0), position(116, 520, 0)}
     
-- Insert the quest status which is reached at the end of the quest
FINAL_QUEST_STATUS = 3
     
     
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

function QuestAvailability(user, status)
    if base.factions.isCadomyrCitizen(user) and status == 0 then
        return Player.questAvailable
    else
        return Player.questNotAvailable
    end
end

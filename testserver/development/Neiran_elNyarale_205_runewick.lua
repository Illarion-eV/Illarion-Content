-- Irgendwas wird eingefügt...
require("base.common")
module("development.Neiran_elNyaralet_205_runewick", package.seeall)

-- GERMAN bedeutet Clienteinstellung Spielersprache ist deutsch, ENGLISCH  bedeutet sie ist english
GERMAN = Player.german
ENGLISH = Player.english


-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Die Schatzkammer Runewicks"
Title[ENGLISH] = "Runewick Treasury"
--
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Lege ein Item, das du spenden willst auf die Spendenplattfrom neben Neiran el Nyarale."
Description[ENGLISH][1] = "Put an item wich you want to donate on the donnation platfrom next to Neiran el Nyarale."
Description[GERMAN][2] = "Du hast deine Aufgabe erfüllt. Sprich mit Neiran el Nyarale."
Description[ENGLISH][2] = "You did complete your task. Please talk to Neiran el Nyarale."
Description[GERMAN][3] = "Du hast deine Aufgabe von Neiran el Nyarale erfolgreich erfüllt."
Description[ENGLISH][3] = "You did complete the task given by Neiran el Nyarale succsessfully."


-- Positionen
-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {897, 781, 2}
QuestTarget[2]= {897, 781, 2}
QuestTarget[3]= {897, 781, 2}



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

function QuestTargets(user, status)
    return QuestTarget[status]
end

function QuestFinalStatus()
    return FINAL_QUEST_STATUS
end

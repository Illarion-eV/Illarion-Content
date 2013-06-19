-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (76, 'quest.zaida_76_runewick');

require("base.common")
module("quest.zaida_76_runewick", package.seeall)

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Die Schwätzerin von Runewick"
Title[ENGLISH] = "Runewick's Gossiper"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Besorge einen Glas mit Wein und bringe es Zaida. Du kannst ein Glas mit Wein vom Händler kaufen oder fülle Wein aus einer Flasche in ein leeres Glas. Wein kann man mit einen Kochlöffel am Weinfass herstellen."
Description[ENGLISH][1] = "Produce a glass with wine and bring it to Zaida. You can buy a glass with wine from a merchant or fill wine from a bottle into a mug. You can press wine with a cooking spoon on a wine barrel."
Description[GERMAN][2] = "Rede mit Zaida, sie kann dir einiges Erzählen."
Description[ENGLISH][2] = "Talk to Zaida, she can tell you a lot."

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(900, 768, 0), position(899, 772, 0), position (906, 841, 0)} -- Händler, Weinfass
QuestTarget[2] = {position(900, 768, 0)} 


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

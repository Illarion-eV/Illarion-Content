-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (81, 'quest.saren_eisenfaust_81_galmair');

require("base.common")
module("quest.saren_eisenfaust_81_galmair", package.seeall)

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Der faule Schmied"
Title[ENGLISH] = "The lazy smith"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Bring 10 Kohlestücke, 10 Eisenerze und 1 Hammer zu Saren Eisenfaust."
Description[ENGLISH][1] = "Bring 10 pieces of coal, 10 pieces iron ore and 1 hammer to Saren Eisenfaust."
Description[GERMAN][2] = "Vielleicht solltest du Saren Eisenfaust nochmal ansprechen, er hat sicher noch mehr für dich zu tun."
Description[ENGLISH][2] = "Perhaps you should talk to Saren Eisenfaust again, he is sure to have more for you to do."
Description[GERMAN][3] = "Bring 15 Kupfererze, 1 Tiegelzange, 1 Feinschmiedehammer und 5 Eisenbarren zu Saren Eisenfaust."
Description[ENGLISH][3] = "Bring 15 pieces of copper ore, 1 crucible-pincer, 1 finesmithing hammer and 5 iron ingots to Saren Eisenfaust."
Description[GERMAN][4] = "Vielleicht solltest du Saren Eisenfaust nochmal ansprechen, er hat sicher noch mehr für dich zu tun."
Description[ENGLISH][4] = "Perhaps you should talk to Saren Eisenfaust again, he is sure to have more for you to do."
Description[GERMAN][5] = "Bring 10 Eisenbarren, 10 Goldbarren, 5 zwergische Metalhandschuhe und 4 Schwertgriffe zu Saren Eisenfaust."
Description[ENGLISH][5] = "Bring 10 iron ingots, 10 gold ingots, 5 dwarven metal gloves and 4 sword handles to Saren Eisenfaust"
Description[GERMAN][6] = "Vielleicht solltest du Saren Eisenfaust nochmal ansprechen, er hat sicher noch mehr für dich zu tun."
Description[ENGLISH][6] = "Perhaps you should talk to Saren Eisenfaust again, he is sure to have more for you to do."
Description[GERMAN][7] = "Bring 15 Kupferbarren, 10 Kriegshämmer, 10 vergoldete Kriegsäxte und 2 salkamaerische Rüstungen zu Saren Eisenfaust."
Description[ENGLISH][7] = "Bring 15 copper ingots, 10 war hammer, 10 gilded battleaxes and 2 salkamaerian armours to Saren Eisenfaust"

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {333, 258, 0}
QuestTarget[3] = {333, 258, 0}
QuestTarget[5] = {333, 258, 0}
QuestTarget[7] = {333, 258, 0}

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

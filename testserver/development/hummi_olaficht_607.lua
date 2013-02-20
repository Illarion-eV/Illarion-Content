-- INSERT INTO quests SET qst_script = 'quest.hummi_olaficht_607' WHERE qst_id = 607;

require("base.common")
module("development.hummi_olaficht_607", package.seeall)

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Der mächtige Turniergewinner"
Title[ENGLISH] = "The mighty tournament champion"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Finde Tronuk und frage ihn nach 'Geschichte' um den Namen des Gewinner zu erfahren. Hinweis: Er kann in der Nähe von Cadomyr gefunden werden."
Description[ENGLISH][1] = "Find Tronuk and ask him about a 'story' in order to get the name of the tournament winner. Hint: He can be found close to Cadomyr."
Description[GERMAN][2] = "Du hast Tronuk gefunden. Nun wähle eine seiner beiden Geschichten. Höre dir die ganze Geschichte an. Du wirst eine Information erhalten sobald du fertig bist.\nFalls du die falsche Geschichte gewählt hast wirst du dir die andere auch anhören müssen."
Description[ENGLISH][2] = "You found Tronuk. Now, choose one of his two stories. Listen the whole story. You will receive an information as soon as you are done.\nYou might also have to listen to the second story if you chose the wrong one."
Description[GERMAN][3] = "Du weißt nun den Namen. Wenn du zurück bei Hummi bist, nenne ihm den Namen des Orks der gewonnen hat. Der Name beginnt mit einem 'J'. Du kannst dir zur Not die Geschichte mittels 'Turnier' nochmals anhören."
Description[ENGLISH][3] = "You know the name now. When you are back at Hummi, tell him the name of the ork who won. The name starts with a 'J'. If necessary, you can listen to the story another time with 'tournament'."
Description[GERMAN][4] = "Hummi hat keine anderen Aufgaben für dich. Lediglich mehr Informationen. Aber suche nach weiteren Aufgaben bei anderen NPCs."
Description[ENGLISH][4] = "Hummi does not have any other quests for you. Just more information. However, you can look for other NPCs with quests for you."


-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(681, 318, 0)} -- Hummi
QuestTarget[2] = {position(164, 621, 0)} -- Tronruk
QuestTarget[3] = {position(164, 621, 0)} -- Tronruk
QuestTarget[4] = {position(681, 318, 0)} -- Hummi

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

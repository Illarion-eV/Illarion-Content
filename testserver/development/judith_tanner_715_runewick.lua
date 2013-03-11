-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (715, 'quest.judith_tanner_715_runewick');

require("base.common")
module("development.judith_tanner_715_runewick", package.seeall)

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Das Schneiderhandwerk"
Title[ENGLISH] = "The tailoring craft"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Sammel 20 Wollknäule für Judith Tanner von den Schafen im Wald außerhalb der Stadt."
Description[ENGLISH][1] = "Collect twenty bales of wool for Judith Tanner from the sheep in Yewdale or the forest just outside Runewick. To shear the sheep stand next to one and use a pair of scissors held in your hand."
Description[GERMAN][2] = "Geh zu Judith Tanner. Sie hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][2] = "Go to Judith Tanner, she is sure to have another task for you."
Description[GERMAN][3] = "Bring Judith Tanner fünf Garnrollen und zwei Rollen grauen Stoff. Den Stoff kannst du am Webstuhl herstellen und die Garnrollen am Spinnrad. Für beides brauchst du unterschiedliche Mengen an Wolle."
Description[ENGLISH][3] = "Take Judith Tanner five spools of thread and two bolts of grey cloth. You can produce the cloth at the loom. The thread can be produced at the spinning wheel, you'll need different amounts of wool to produce them both."
Description[GERMAN][4] = "Geh zu Judith Tanner. Sie hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][4] = "Go to Judith Tanner, she is sure to have another task for you."
Description[GERMAN][5] = "Schneidere ein graues Gewand am Schneidertisch für Judith Tanner in Runewick."
Description[ENGLISH][5] = "Tailor one grey dress at the tailoring table for Judith Tanner in Runewick."
Description[GERMAN][6] = "Geh zu Judith Tanner. Sie hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][6] = "Go to Judith Tanner, she is sure to have another task for you."
Description[GERMAN][7] = "Mach ein kleines Lagerfeuer und stell fünf Eimer mit roter Farbe für Judith Tanner her. Eimer können Schreiner herstellen, wenn du welche brauchst."
Description[ENGLISH][7] = "Make a little camp fire and produce five buckets of red dye for Judith Tanner. If you need buckets, ask a carpenter if he can make you some."
Description[GERMAN][8] = "Geh zu Judith Tanner. Sie hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][8] = "Go to Judith Tanner, she has for sure another task for you."
Description[GERMAN][9] = "Färbe fünf Rollen roten Stoff bei dem schwarzen Fass in der Schneiderei für Judith Tanner."
Description[ENGLISH][9] = "Dye five cloths red for Judith Tanner, using the black barrel ."
Description[GERMAN][10] = "Du hast alle Aufgaben von Judith Tanner erfüllt."
Description[ENGLISH][10] = "You have fulfilled all the tasks for Judith Tanner."


-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(905, 780, 0), position(860, 768, 0)} -- Sheeps
QuestTarget[2] = {position(905, 780, 0)} 
QuestTarget[3] = {position(905, 780, 0), position(911, 782, 0), position(911, 781, 0)} -- Spinning wheel and loom
QuestTarget[4] = {position(905, 780, 0)}
QuestTarget[5] = {position(905, 780, 0), position(901, 779, 0)} -- Tailoring table
QuestTarget[6] = {position(905, 780, 0)} 
QuestTarget[7] = {position(905, 780, 0), position(886, 795, 0)} -- Camp fire
QuestTarget[8] = {position(905, 780, 0)}
QuestTarget[9] = {position(905, 780, 0), position(909, 778, 0)} -- Barrels

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

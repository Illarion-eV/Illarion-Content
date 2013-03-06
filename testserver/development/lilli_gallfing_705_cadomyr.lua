-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (705, 'quest.lilli_gallfing_705_cadomyr');

require("base.common")
module("development.lilli_gallfing_705_cadomyr", package.seeall)

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
Description[GERMAN][1] = "Sammel 20 Wollknäule für Lilli Gallfing bei den Schafen westlich von Cadomyr."
Description[ENGLISH][1] = "Collect twenty bales of wool for Lilli Gallfing from the sheep west of Cadomyr."
Description[GERMAN][3] = "Bring Lilli Gallfing fünf Garnrollen und zwei Rollen grauen Stoff. Den Stoff kannst du am Webstuhl herstellen, die Garnrollen am Spinnrad, für beides brauchst du unterschiedliche Mengen an Wolle."
Description[ENGLISH][3] = "Take Lilli Gallfing five spools of thread and two grey cloth. You can produce the cloth at the loom. The thread can be produced at the spinning wheel, you'll need different amounts of wool to produce them both."
Description[GERMAN][5] = "Schneidere ein graues Gewand am Schneidertisch für Lilli Gallfing in Cadomyr."
Description[ENGLISH][5] = "Tailor one grey dress at the tailoring table for Lilli Gallfing in Cadomyr."
Description[GERMAN][7] = "Mach ein kleines Lagerfeuer und stell fünf Eimer mit roter Farbe für Lilli Gallfing her. Eimer können Schreiner herstellen, wenn du welche brauchst."
Description[ENGLISH][7] = "Make a little camp fire and produce five buckets of red dye for Lilli Gallfing. If you need buckets, ask a carpenter if he can make you some."
Description[GERMAN][9] = "Färbt fünf Rollen roten Stoff bei dem schwarzen Fass in der Schneiderei für Lilli Gallfing."
Description[ENGLISH][9] = "Dye five cloths red for Lilli Gallfing, using the black barrel ."
Description[GERMAN][10] = "Du hast alle Aufgaben von Lilli Gallfing erfüllt."
Description[ENGLISH][10] = "You have fulfilled all the tasks for Lilli Gallfing."


-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(135, 576, 0), position(63, 654, 0)} -- Sheeps
QuestTarget[2] = {position(135, 576, 0)} 
QuestTarget[3] = {position(135, 576, 0), position(134, 572, 0), position(141, 575, 0)} -- Spinning wheel and loom
QuestTarget[4] = {position(135, 576, 0)} 
QuestTarget[5] = {position(135, 576, 0), position(137, 572, 0)} -- Tailoring table
QuestTarget[6] = {position(135, 576, 0)} 
QuestTarget[7] = {position(135, 576, 0), position(128, 575, 0)} -- Camp fire
QuestTarget[8] = {position(135, 576, 0)}
QuestTarget[9] = {position(135, 576, 0), position(130, 575, 0), position(141, 574, 0)} -- Barrels

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

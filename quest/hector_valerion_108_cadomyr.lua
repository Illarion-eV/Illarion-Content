-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (108, 'quest.hector_valerion_108_cadomyr');

require("base.common")
module("quest.hector_valerion_108_cadomyr", package.seeall)

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Späte Post"
Title[ENGLISH] = "Delayed Mail"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Besorge fünf Schreibfedern und bringe sie Hector. Du kannst sie bei einem Händler kaufen oder manchmal in Bäumen und Sträuchern finden."
Description[ENGLISH][1] = "Produce five quills and bring them to Hector. You can buy them from a merchant or find quills sometimes in trees or bushes."
Description[GERMAN][2] = "Geh zu Hector Valerion, der sich in der Bibliothek von Cadomyr aufhält. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][2] = "Go back to Hector Valerion in the library of Cadomyr, he certainly have another task for you."
Description[GERMAN][3] = "Sprich Robertus auf dem Marktplatz von Cadomyr wegen des Befehls an. Kehre dann zu Hector zurück."
Description[ENGLISH][3] = "Talk to Robertus on the market place of Cadomyr concerning the orders. Then return to Hector."
Description[GERMAN][4] = "Geh zu Hector Valerion, der sich in der Bibliothek von Cadomyr aufhält. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][4] = "Go back to Hector Valerion in the library of Cadomyr, he certainly have another task for you."
Description[GERMAN][5] = "Gehe zu Arenius Batavius und sprich ihn wegen der Schriftrolle an. Er stehet am Gasthaus 'Seeufer'. Kehre dann zu Hector zurück."
Description[ENGLISH][5] = "Go to Arenius Batavius and talk to him concerning the scroll. He is standing next to the Inn 'Lakeshore'. Then return to Hector."
Description[GERMAN][6] = "Geh zu Hector Valerion, der sich in der Bibliothek von Cadomyr aufhält. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][6] = "Go back to Hector Valerion in the library of Cadomyr, he certainly have another task for you."
Description[GERMAN][7] = "Gehe zu Daerbur Wimbert und sprich ihn wegen der Nachricht an. Er befindet sich in der Dunkellochmine bei Galmair. Kehre dann zu Hector zurück."
Description[ENGLISH][7] = "Go to Daerbur Wimbert and talk to him concerning the message. He is standing in the 'Dark Hole Mine' next to Galmair. Then return to Hector."
Description[GERMAN][8] = "Geh zu Hector Valerion, der sich in der Bibliothek von Cadomyr aufhält. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][8] = "Go back to Hector Valerion in the library of Cadomyr, he certainly have another task for you."
Description[GERMAN][9] = "Gehe zu Erzmagier Elvaine Morgan und sprich ihn wegen der Depesche an. Er befindet sich im Turm des Feuers in Runewick. Kehre dann zu Hector zurück."
Description[ENGLISH][9] = "Go to Archmage Elvaine Morgan and talk to him concerning the despatch. He is standing in the Tower of Fire in Runewick. Then return to Hector."
Description[GERMAN][10] = "Du hast alle Aufgaben von Hector Valerion erfüllt."
Description[ENGLISH][10] = "You have fulfilled all the tasks for Hector Valerion."


-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(139, 553, 0), position(897, 794, 1)} --Händler Runewick
QuestTarget[2] = {position(139, 553, 0)} 
QuestTarget[3] = {position(139, 553, 0), position(123, 614,0)} -- Robertus
QuestTarget[4] = {position(139, 553, 0)} 
QuestTarget[5] = {position(139, 553, 0), position(85, 587,0)} -- Arenius Batavius
QuestTarget[6] = {position(139, 553, 0)} 
QuestTarget[7] = {position(139, 553, 0), position(392, 160, -3)} -- Daerbur Wimbert
QuestTarget[8] = {position(139, 553, 0)} 
QuestTarget[9] = {position(139, 553, 0), position(898, 775, 2)} -- Elvaine Morgan
QuestTarget[10] = {position(139, 553, 0)} 
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
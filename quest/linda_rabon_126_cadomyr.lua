-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (126, 'quest.linda_rabon_126_cadomyr');

require("base.common")
module("quest.linda_rabon_126_cadomyr", package.seeall)

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Eine edle Feier"
Title[ENGLISH] = "A Noble Celebration"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Besorge fünf Gedecke Besteck und bringe sie Linda. Du kannst sie bei einem Händler kaufen oder als Goldschmied am Amboss herstellen. Dazu nimmst du den Feinschmiedhammer in die Hand und benutzt ihn, während du vor einem Amboss stehst."
Description[ENGLISH][1] = "Produce five sets of cutlery and bring them to Linda. You can buy them from a merchant or if you are a goldsmith, produce on a anvil. Therefor using the finesmithing hammer in your hand, while standing in front of an anvil."
Description[GERMAN][2] = "Geh zu Linda Rabon, die sich im Einhörnigen Löwen in Cadomyr aufhält. Sie hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][2] = "Go back to Linda Rabon in the Unicorn Lion in Cadomyr, she certainly have another task for you."
Description[GERMAN][3] = "Besorge fünf Weingläser und bringe sie Linda. Du kannst sie bei einem Händler kaufen."
Description[ENGLISH][3] = "Produce five wine glasses and bring them to Linda. You can buy them from a merchant."
Description[GERMAN][4] = "Geh zu Linda Rabon, die sich im Einhörnigen Löwen in Cadomyr aufhält. Sie hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][4] = "Go back to Linda Rabon in the library of Cadomyr, he certainly have another task for you."
Description[GERMAN][5] = "Besorge fünf Holzteller und bringe sie Linda. Du kannst sie bei einem Händler kaufen oder als Schreiner an einer Werkbank anfertigen."
Description[ENGLISH][5] = "Produce five wooden plates and bring them to Linda. You can buy them from a merchant oder as a carpenter produce them on a workbench."
Description[GERMAN][6] = "Du hast alle Aufgaben von Linda Rabon erfüllt."
Description[ENGLISH][6] = "You have fulfilled all the tasks for Linda Rabon."


-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(116, 576, 0), position(121, 599, 0), position(138, 589, 0)} -- Händler,Amboss
QuestTarget[2] = {position(116, 576, 0)} 
QuestTarget[3] = {position(116, 576, 0), position(125, 603, 0)} -- Jonathan Cyrus
QuestTarget[4] = {position(116, 576, 0)} 
QuestTarget[5] = {position(116, 576, 0), position(113, 574, 0)} -- Händler
QuestTarget[6] = {position(116, 576, 0)} 

-- Insert the quest status which is reached at the end of the quest
FINAL_QUEST_STATUS = 6


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
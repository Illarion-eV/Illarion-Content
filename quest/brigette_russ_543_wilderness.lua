--[[
Illarion Server

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, either version 3 of the License, or (at your option) any
later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU Affero General Public License for more
details.

You should have received a copy of the GNU Affero General Public License along
with this program.  If not, see <http://www.gnu.org/licenses/>.
]]
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (543, 'quest.brigette_russ_543_wilderness');

local common = require("base.common")
local factions = require("base.factions")
local monsterQuests = require("monster.base.quests")
local M = {}

local GERMAN = Player.german
local ENGLISH = Player.english

-- Insert the quest title here, in both languages
local Title = {}
Title[GERMAN] = "Der Pfad des Fuchses"
Title[ENGLISH] = "The Path of the Fox"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
local Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Sammle Brigettes gestohlene Gegenstände in der Höhle, die sich nördlich von ihr befindet. Folgendes vermisst sie: einen Hut, zwei Ringe, einen Teller, einen Kelch und eine Flöte."
Description[ENGLISH][1] = "Collect Brigette's stolen items from the dungeon just north of her. She is missing : a hat, two rings, a plate, a goblet, and a flute."
Description[GERMAN][2] = "Erstatte Brigette Bericht, dass du folgende Gegenstände für sie gefunden hast: einen Kupferkelch, einen grauen Hut mit Feder, einen goldenen Ring, einen goldenen Rubinring, eine Flöte und einen Teller."
Description[ENGLISH][2] = "Report back to Brigette that you have found items for her : a copper goblet, a grey hat with a feather, a golden ring, a golden ring with a ruby, a flute, and a plate."
Description[GERMAN][3] = "Geh zu Brigette. Sie hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][3] = "Go back to Brigette, she certainly has another task for you."

Description[GERMAN][4] = "Finde heraus, wo sich der Kodex in der Höhle nördlich von Brigette befindet und lese ihn."
Description[ENGLISH][4] = "Locate the codex in the dungeon north of Brigette and read it."
Description[GERMAN][5] = "Gehe zu Brigitte zurück und teile ihr mit, dass du ihre Aufgabe erledigt hast."
Description[ENGLISH][5] = "Report back to Brigette that you have finished her task."
Description[GERMAN][6] = "Geh zu Brigette. Sie hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][6] = "Go back to Brigette, she certainly has another task for you."

Description[GERMAN][7] = "Schmuggle den Inhalt der Diebe Abendbrot in der Küche, um die Diebe zu vergiften."
Description[ENGLISH][7] = "Slip the vial of poison into the thieves dinner in the kitchen to poison the thieves."
Description[GERMAN][8] = "Gehe zu Brigitte zurück und teile ihr mit, dass du ihre Aufgabe erledigt hast."
Description[ENGLISH][8] = "Report back to Brigette that you have finished her task."
Description[GERMAN][9] = "Geh zu Brigette. Sie hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][9] = "Go back to Brigette, she certainly has another task for you."

Description[GERMAN][10] = "Töte Diebe, Priester, und Krieger für Brigette. Du brauchst noch zehn."
Description[ENGLISH][10] = "Kill thieves, priests and warriors for Brigette. You still need ten."
Description[GERMAN][11] = "Töte Diebe, Priester, und Krieger für Brigette. Du brauchst noch neun."
Description[ENGLISH][11] = "Kill thieves, priests and warriors for Brigette. You still need nine."
Description[GERMAN][12] = "Töte Diebe, Priester, und Krieger für Brigette. Du brauchst noch acht."
Description[ENGLISH][12] = "Kill thieves, priests and warriors for Brigette. You still need eight."
Description[GERMAN][13] = "Töte Diebe, Priester, und Krieger für Brigette. Du brauchst noch sieben."
Description[ENGLISH][13] = "Kill thieves, priests and warriors for Brigette. You still need seven."
Description[GERMAN][14] = "Töte Diebe, Priester, und Krieger für Brigette. Du brauchst noch sechs."
Description[ENGLISH][14] = "Kill thieves, priests and warriors for Brigette. You still need six."
Description[GERMAN][15] = "Töte Diebe, Priester, und Krieger für Brigette. Du brauchst noch fünf."
Description[ENGLISH][15] = "Kill thieves, priests and warriors for Brigette. You still need five."
Description[GERMAN][16] = "Töte Diebe, Priester, und Krieger für Brigette. Du brauchst noch vier."
Description[ENGLISH][16] = "Kill thieves, priests and warriors for Brigette. You still need four."
Description[GERMAN][17] = "Töte Diebe, Priester, und Krieger für Brigette. Du brauchst noch drei."
Description[ENGLISH][17] = "Kill thieves, priests and warriors for Brigette. You still need three."
Description[GERMAN][18] = "Töte Diebe, Priester, und Krieger für Brigette. Du brauchst noch zwei."
Description[ENGLISH][18] = "Kill thieves, priests and warriors for Brigette. You still need two."
Description[GERMAN][19] = "Töte Diebe, Priester, und Krieger für Brigette. Du brauchst noch eine."
Description[ENGLISH][19] = "Kill thieves, priests and warriors for Brigette. You still need one."
Description[GERMAN][20] = "Gehe zu Brigitte zurück und teile ihr mit, dass du ihre Aufgabe erledigt hast."
Description[ENGLISH][20] = "Report back to Brigette that you have finished her task."
Description[GERMAN][21] = "Geh zu Brigette. Sie hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][21] = "Go back to Brigette, she certainly has another task for you."

Description[GERMAN][22] = "Töte den Anführer der Diebe, den Elfenkrieger, um ihrem schurkischen Lebenswandel ein Ende zu machen."
Description[ENGLISH][22] = "Kill the leader of the thieves, the elven warrior to end their turncoat ways."
Description[GERMAN][23] = "Gehe zu Brigette zurück und teile ihr mit, dass du den Anführer getötet hast."
Description[ENGLISH][23] = "Report back to Brigette that you have killed the leader."

Description[GERMAN][24] = "Du hast alle Aufgaben für Brigette Russ erledigt."
Description[ENGLISH][24] = "You have finished all tasks for Brigette Russ."

-- Insert the position of the quest start here (probably the position of an NPC or item)
local Start = {897, 616, 0}

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
local QuestTarget = {}
QuestTarget[1] = {position(897, 616, 0), position(904, 595, 0)}
QuestTarget[2] = {position(897, 616, 0), position(904, 595, 0)}
QuestTarget[3] = {position(897, 616, 0), position(904, 595, 0)}
QuestTarget[4] = {position(897, 616, 0), position(904, 595, 0)}
QuestTarget[5] = {position(897, 616, 0), position(904, 595, 0)}
QuestTarget[6] = {position(897, 616, 0), position(904, 595, 0)}
QuestTarget[7] = {position(897, 616, 0), position(904, 595, 0)}
QuestTarget[8] = {position(897, 616, 0), position(904, 595, 0)}
QuestTarget[9] = {position(897, 616, 0), position(904, 595, 0)}
QuestTarget[10] = {position(897, 616, 0), position(904, 595, 0)}
QuestTarget[11] = {position(897, 616, 0), position(904, 595, 0)}
QuestTarget[12] = {position(897, 616, 0), position(904, 595, 0)}
QuestTarget[13] = {position(897, 616, 0), position(904, 595, 0)}
QuestTarget[14] = {position(897, 616, 0), position(904, 595, 0)}
QuestTarget[15] = {position(897, 616, 0), position(904, 595, 0)}
QuestTarget[16] = {position(897, 616, 0), position(904, 595, 0)}
QuestTarget[17] = {position(897, 616, 0), position(904, 595, 0)}
QuestTarget[18] = {position(897, 616, 0), position(904, 595, 0)}
QuestTarget[19] = {position(897, 616, 0), position(904, 595, 0)}
QuestTarget[20] = {position(897, 616, 0), position(904, 595, 0)}
QuestTarget[21] = {position(897, 616, 0), position(904, 595, 0)}
QuestTarget[22] = {position(897, 616, 0), position(904, 595, 0)}
QuestTarget[23] = {position(897, 616, 0), position(904, 595, 0)}
QuestTarget[24] = {position(897, 616, 0)}


-- Insert the quest status which is reached at the end of the quest
local FINAL_QUEST_STATUS = 24

-- Register the monster kill parts of the quest.
monsterQuests.addQuest{
    questId = 543,
    locations = {
        {position = position(905, 584, -3), radius = 40},
        {position = position(905, 584, -6), radius = 40},
        {position = position(896, 588, -9), radius = 40}
    },
    queststatus = {from = 10, to = 20},
    questTitle = {german = "Der Pfad des Fuchses IV", english = "The Path of the Fox IV"},
    monsterName = {german = "Diebe, Priester, und Krieger", english = "Thieves, Priest, and Warrior"},
    npcName = "Brigette Russ",
    monsterIds = {1, 5, 22, 23, 32, 33, 43} -- different thieves, priests, and warriors
}

monsterQuests.addQuest{
    questId = 543,
    location = {position = position(896, 588, -9), radius = 40},
    queststatus = {from = 22, to = 23},
    questTitle = {german = "Der Pfad des Fuchses V", english = "The Path of the Fox V"},
    monsterName = {german = "Elfenkrieger", english = "Elven Warrior"},
    npcName = "Brigette Russ",
    monsterIds = {32} -- Elven warrior
}

function M.QuestTitle(user)
    return common.GetNLS(user, Title[GERMAN], Title[ENGLISH])
end

function M.QuestDescription(user, status)
    local german = Description[GERMAN][status] or ""
    local english = Description[ENGLISH][status] or ""

    return common.GetNLS(user, german, english)
end

function M.QuestStart()
    return Start
end

function M.QuestTargets(user, status)
    return QuestTarget[status]
end

function M.QuestFinalStatus()
    return FINAL_QUEST_STATUS
end

function M.QuestAvailability(user, status)
    if status == 0 then
        return Player.questAvailable
    else
        return Player.questNotAvailable
    end
end

return M

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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (539, 'quest.pasinn_69_wilderness');

local common = require("base.common")
local M = {}

local GERMAN = Player.german
local ENGLISH = Player.english

-- Insert the quest title here, in both languages
local Title = {}
Title[GERMAN] = "Viridian Nadeln Höhle"
Title[ENGLISH] = "Viridian Needles Lair"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
local Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Sammle fünfzehn vergiftete Münzen in Viridian Needles Schlupfwinkel, wo der Alchemist Kaefity arbeitet."
Description[ENGLISH][1] = "Collect fifteen poisoned coins from Viridian Needles Lair where the Alchemist Kaefity is working."
Description[GERMAN][2] = "Kehre zu Pasinn zurück, er wird sicher noch eine Aufgabe für dich haben."
Description[ENGLISH][2] = "Go back to Pasinn, he will certainly have another task for you."
Description[GERMAN][3] = "Finde den richtigen Trank aus den Kesseln in Viridian Needles Schlupfwinkel, den Pasinn haben möchte."
Description[ENGLISH][3] = "Find the proper potion that Pasinn is wanting from the Cauldrons in Viridian Needles Lair."
Description[GERMAN][4] = "Kehre zu Pasinn zurück, er wird sicher noch eine Aufgabe für dich haben."
Description[ENGLISH][4] = "Go back to Pasinn, he will certainly have another task for you."
Description[GERMAN][5] = "Such nach Kaefitys Rezept für den Trank, den du für Pasinn gefunden hast. Es sollte irgendwo im Schlupfwinkel herumliegen."
Description[ENGLISH][5] = "Locate Kaefity's recipe for the potion that you found for Pasinn. It should be laying around the lair somewhere."
Description[GERMAN][6] = "Kehre zu Pasinn zurück, du hast seine Aufgabe erfüllt."
Description[ENGLISH][6] = "Return to Pasinn, you have finished his task."
Description[GERMAN][7] = "Kehre zu Pasinn zurück, er wird sicher noch eine Aufgabe für dich haben."
Description[ENGLISH][7] = "Go back to Pasinn, he will certainly have another task for you."
Description[GERMAN][8] = "Töte Kaefitys Haustier, das Sumpfmonster, für Pasinn."
Description[ENGLISH][8] = "Kill Kaefity's pet swamp beast for Pasinn."
Description[GERMAN][9] = "Kehre zu Pasinn zurück, du hast seine Aufgabe erfüllt."
Description[ENGLISH][9] = "Return to Pasinn, you have finished his task."
Description[GERMAN][10] = "Kehre zu Pasinn zurück, er wird sicher noch eine Aufgabe für dich haben."
Description[ENGLISH][10] = "Go back to Pasinn, he will certainly have another task for you."
Description[GERMAN][11] = "Töte die Rattenalchemisten Kaefity für Pasinn."
Description[ENGLISH][11] = "Kill Kaefity the Rat Alchemist for Pasinn."
Description[GERMAN][12] = "Kehre zu Pasinn zurück, du hast seine Aufgabe erfüllt."
Description[ENGLISH][12] = "Return to Pasinn, you have finished his task."
Description[GERMAN][13] = "Du hast alle Aufgaben von Pasinn erfüllt."
Description[ENGLISH][13] = "You have fulfilled all the tasks for Pasinn."

-- Insert the position of the quest start here (probably the position of an NPC or item)
local Start = {523, 205, 0}


-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
local QuestTarget = {}
QuestTarget[1] = {position(523, 205, 0), position(522, 205, 0)} -- Viridian Needles Lair
QuestTarget[2] = {position(523, 205, 0)} 
QuestTarget[3] = {position(523, 205, 0), position(522, 205, 0)} -- Viridian Needles Lair
QuestTarget[4] = {position(840, 470, 0)} 
QuestTarget[5] = {position(523, 205, 0), position(522, 205, 0)} -- Viridian Needles Lair
QuestTarget[6] = {position(840, 470, 0)} 
QuestTarget[7] = {position(523, 205, 0)}
QuestTarget[8] = {position(523, 205, 0), position(522, 205, 0)} -- Viridian Needles Lair
QuestTarget[9] = {position(523, 205, 0)} 
QuestTarget[10] = {position(523, 205, 0)} 
QuestTarget[11] = {position(523, 205, 0), position(522, 205, 0)} -- Viridian Needles Lair
QuestTarget[12] = {position(523, 205, 0)} 
QuestTarget[13] = {position(523, 205, 0)} 

-- Insert the quest status which is reached at the end of the quest
local FINAL_QUEST_STATUS = 13

-- Register the monster kill parts of the quest.
monsterQuests.addQuest{
    questId = 539,
    location = {position = position(575, 190, -3), radius = 75},
    queststatus = {from = 8, to = 9},
    questTitle = {german = "Viridian Nadeln Höhle IV", english = "Viridian Needles Lair IV"},
    monsterName = {german = "Sumpfmonster", english = "Swamp Monster"},
    npcName = "Pasinn",
    raceIds = {872} -- swamp beast
}
monsterQuests.addQuest{
    questId = 539,
    location = {position = position(575, 190, -3), radius = 75},
    queststatus = {from = 11, to = 12},
    questTitle = {german = "Viridian Nadeln Höhle V", english = "Viridian Needles Lair V"},
    monsterName = {german = "Rattenalchemist", english = "Rat Alchemist"},
    npcName = "Pasinn",
    raceIds = {877} -- Rat Alchemist
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

return M

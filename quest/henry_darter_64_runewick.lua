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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (64, 'quest.henry_darter_64_runewick');

local common = require("base.common")
local M = {}


local GERMAN = Player.german
local ENGLISH = Player.english

-- Insert the quest title here, in both languages

local Title = {}
Title[GERMAN] = "Morgentausumpf"
Title[ENGLISH] = "Dewy Swamps"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
local Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Gehe zu den Schweinen, schlachte sie und sammle 10 Stück Schweinefleisch. Kehre anchließend zu Henry Darter zurück."
Description[ENGLISH][1] = "Go to the pigs, butcher them and collect ten pieces of pork. After that return to Henry Darter."
Description[GERMAN][2] = "Geh zu Henry Darter, welcher sich im Morgenausumpf aufhält. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][2] = "Go back to Henry Darter in the Dewy Swamps, he is sure to have another task for you."
Description[GERMAN][3] = "Gehe zu den Schweinen, schlachte sie und sammle 20 Stück Roheder. Kehre anchließend zu Henry Darter zurück."
Description[ENGLISH][3] = "Go to the pigs, butcher them and collect twenty pieces of raw leather. After that return to Henry Darter."
Description[GERMAN][4] = "Geh zu Henry Darter, welcher sich im Morgenausumpf aufhält. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][4] = "Go back to Henry Darter in the Dewy Swamps, he is sure to have another task for you."
Description[GERMAN][5] = "Gehe zu den Schafen, schlachte sie und sammle 5 Lammkeulen. Kehre anchließend zu Henry Darter zurück."
Description[ENGLISH][5] = "Go to the sheep, butcher them and collect five pieces of lamb meat. After that return to Henry Darter."
Description[GERMAN][6] = "Geh zu Henry Darter, welcher sich im Morgenausumpf aufhält. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][6] = "Go back to Henry Darter in the Dewy Swamps, he is sure to have another task for you."
Description[GERMAN][7] = "Gehe zur Dunkellochmine und hole 20 Brocken Kohle. Kehre anchließend zu Henry Darter zurück. Falls du Hilfe brauchst frage Henrys Freund Daerbur Wimbert."
Description[ENGLISH][7] = "Go to the Dark Hole Mine and get twenty lumps of coal. After that return to Henry Darter. If you need help, ask Henry's friend Daerbur Wimbert."
Description[GERMAN][8] = "Du hast alle Aufgaben von Henry Darter erfüllt."
Description[ENGLISH][8] = "You have fulfilled all the tasks for Henry Darter."


-- Insert the position of the quest start here (probably the position of an NPC or item)
Start = {920, 659, 0}

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
local QuestTarget = {}
QuestTarget[1] = {position(920, 659, 0), position(905, 673, 0)} -- Pigs
QuestTarget[2] = {position(920, 659, 0)}
QuestTarget[3] = {position(920, 659, 0), position(905, 673, 0)} -- Pigs
QuestTarget[4] = {position(920, 659, 0)}
QuestTarget[5] = {position(920, 659, 0), position(894, 762, 0)} -- Sheep
QuestTarget[6] = {position(920, 659, 0)}
QuestTarget[7] = {position(920, 659, 0), position(392, 160, -3)} -- Daerbur Wimbert / Dark Hole Mine
QuestTarget[8] = {position(920, 659, 0)}

-- Insert the quest status which is reached at the end of the quest
local FINAL_QUEST_STATUS = 8


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

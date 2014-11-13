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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (118, 'quest.baldo_proudtoe_118_runewick');

local common = require("base.common")
local M = {}

local GERMAN = Player.german
local ENGLISH = Player.english



-- Insert the quest title here, in both languages
local Title = {}
Title[GERMAN] = "Die Gärten von Runewick"
Title[ENGLISH] = "Runewick Gardens"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
local Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Sammel zehn Äpfel und bringe diese Baldo Proudtoe im Garten. Um Äpfel zu sammeln stelle dich vor einen Apfelbaum und benutze diesen."
Description[ENGLISH][1] = "Collect ten apples for Baldo Proudtoe in the Garden. You should start collecting apples by standing in front of an apple tree and using the tree."
Description[GERMAN][2] = "Geh zu Baldo Proudtoe, der sich im Garten aufhält. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][2] = "Go back to Baldo Proudtoe in the Garden, he is sure to have another task for you."
Description[GERMAN][3] = "Sammel zehn Weintrauben und bringe diese Baldo Proudtoe im Garten. Um Weintrauben zu sammeln stelle dich vor einen Strauch und benutze diesen."
Description[ENGLISH][3] = "Collect ten grapes for Baldo Proudtoe in the Garden. You should start collecting grapes by standing in front of a vine and using the plant."
Description[GERMAN][4] = "Du hast alle Aufgaben von Baldo Proudtoe erfüllt."
Description[ENGLISH][4] = "You have fulfilled all the tasks for Baldo Proudtoe."

-- Insert the position of the quest start here (probably the position of an NPC or item)
Start = {941, 790, 0}


-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
local QuestTarget = {}
QuestTarget[1] = {position(941, 790, 0), position(792, 819, 0), position(792, 777, 0)} -- Apple tree
QuestTarget[2] = {position(941, 790, 0)} 
QuestTarget[3] = {position(941, 790, 0), position(958, 785, 0)} -- Bush
QuestTarget[4] = {position(941, 790, 0)} 


-- Insert the quest status which is reached at the end of the quest
local FINAL_QUEST_STATUS = 4


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

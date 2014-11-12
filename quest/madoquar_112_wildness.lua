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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (112, 'quest.madoquar_112_wildness');

local common = require("base.common")
local M = {}

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Die Geistereiche"
Title[ENGLISH] = "The Ghost Oak"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Suche die dunkle Präsenz nicht weit östlich von Madoquar."
Description[ENGLISH][1] = "Search for the dark presence, not far to the east."
Description[GERMAN][2] = "Kehre zu Madoquar zurück."
Description[ENGLISH][2] = "Return to Madoquar."
Description[GERMAN][3] = "Gehe zu Madoquar, die sich am Hafen von Galmair aufhält. Sie hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][3] = "Go back to Madoquar near the harbour of Galmair, she will certainly have another task for you."
Description[GERMAN][4] = "Besorge eine Streitaxt und einen Silberbarren und bringe sie Madoquar. Du kannst sie bei einem Händler kaufen oder selbst herstellen. Eine Streitaxt kannst du mit einen Hammer in der Hand an einem Ambos schmieden. Einen Silberbarren schmilzt man aus Silbererz mit einem Schmelztiegel an der Esse."
Description[ENGLISH][4] = "Produce a battle axe and a bar of silver and bring them to Madoquar. You can buy them from a merchant or make them yourself. You can produce a battle axe with a hammer in your hand on the anvil. A bar of silver you can melt out of silver or with a crucible in your hand in front of a furnace."
Description[GERMAN][5] = "Gehe zu Madoquar, die sich am Hafen von Galmair aufhält. Sie hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][5] = "Go back to Madoquar near the harbour of Galmair, she will certainly have another task for you."
Description[GERMAN][6] = "Suche in einer Hausruine südlich der Eiche nach Leichenteilen und bring sie Madoquar."
Description[ENGLISH][6] = "Look in the ruins, south of the oak, for parts of a dead body and bring them to Madoquar."
Description[GERMAN][7] = "Kehre zu Madoquar zurück."
Description[ENGLISH][7] = "Return to Madoquar."
Description[GERMAN][8] = "Gehe zu Madoquar, die sich am Hafen von Galmair aufhält. Sie hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][8] = "Go back to Madoquar near the harbour of Galmair, she will certainly have another task for you."
Description[GERMAN][9] = "Töte den Knochengeist der Eiche mit der Silberaxt. Nimm dazu die Axt in die Hand und greife den Geist an."
Description[ENGLISH][9] = "Kill the bone ghost of the oak with the silver axe. Take the axe in your hand and attack the ghost."
Description[GERMAN][10] = "Kehre zu Madoquar zurück."
Description[ENGLISH][10] = "Return to Madoquar."
Description[GERMAN][11] = "Du hast alle Aufgaben von Madoquar erfüllt."
Description[ENGLISH][11] = "You have fulfilled all tasks for Madoquar."


-- Insert the position of the quest start here (probably the position of an NPC or item)
Start = {452, 111, 0}


-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(501, 107, 0)} 
QuestTarget[2] = {position(452, 111, 0)}
QuestTarget[3] = {position(452, 111, 0)} 
QuestTarget[4] = {position(366, 272, 0), position(366, 275, 0), position(383, 272, 0), position(387, 276, 0), position(452, 111, 0)}
QuestTarget[5] = {position(452, 111, 0)} 
QuestTarget[6] = {position(502, 156, 0)}
QuestTarget[7] = {position(452, 111, 0)} 
QuestTarget[8] = {position(452, 111, 0)}
QuestTarget[9] = {position(501, 107, 0)} 
QuestTarget[10] = {position(452, 111, 0)}
QuestTarget[11] = {position(452, 111, 0)} 


-- Insert the quest status which is reached at the end of the quest
FINAL_QUEST_STATUS = 11


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

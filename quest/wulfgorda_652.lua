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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (652, 'quest.wulfgorda_652');

local common = require("base.common")
local M = {}

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Finde Borgate Northoff im Gasthaus zur Hanfschlinge (Spinnen Maul)"
Title[ENGLISH] = "Find Borgate Northoff in the Hemp Necktie Inn (Spider's Mouth)"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Finde Borgate Northoff im Gasthaus zur Hanfschlinge und sprich mit ihm."
Description[ENGLISH][1] = "Find Borgate Northoff in the Hemp Necktie Inn and talk to him."
Description[GERMAN][2] = "Du hast Borgate gefunden. Da kannst nun das eine oder andere Bier bei ihm bestellen, wenn du magst."
Description[ENGLISH][2] = "You have found Borgate. If you like, you can order a beer from him now."

-- Insert the position of the quest start here (probably the position of an NPC or item)
Start = {685, 315, 0}

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(710, 313, 0)} -- Borgate

-- Insert the quest status which is reached at the end of the quest
FINAL_QUEST_STATUS = 2


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

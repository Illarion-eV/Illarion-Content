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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (672, 'quest.lotte_silberstreif_672');

local common = require("base.common")
local M = {}

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Galmairs Lotterie"
Title[ENGLISH] = "Galmair's lotto game"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Du hast ein Los gekauft. Sprich mit Lotte Silberstreif um dein Los zu ziehen."
Description[ENGLISH][1] = "You bought one lot. Talk to Lotte Silberstreif to use your lot."
Description[GERMAN][2] = "Du hast 5 Lose gekauft. Sprich mit Lotte Silberstreif um deine Lose zu ziehen."
Description[ENGLISH][2] = "You bought five lots. Talk to Lotte Silberstreif to use your lots."
Description[GERMAN][10] = "Bring Lotte Silberstreif einen Apfel."
Description[ENGLISH][10] = "Bring one apple to Lotte Silberstreif."
Description[GERMAN][20] = "Bring Lotte Silberstreif 5 Kirschen."
Description[ENGLISH][20] = "Bring five cherries to Lotte Silberstreif."

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(685, 315, 0)} -- Lotte
QuestTarget[2] = {position(685, 315, 0)} -- Lotte
QuestTarget[10] = {position(685, 315, 0)} -- Lotte
QuestTarget[20] = {position(685, 315, 0)} -- Lotte

-- Insert the quest status which is reached at the end of the quest
FINAL_QUEST_STATUS = 0


function M.QuestTitle(user)
    return common.GetNLS(user, Title[GERMAN], Title[ENGLISH])
end

function M.QuestDescription(user, status)
    local german = Description[GERMAN][status] or ""
    local english = Description[ENGLISH][status] or ""

    return common.GetNLS(user, german, english)
end

function M.QuestTargets(user, status)
    return QuestTarget[status]
end

function M.QuestFinalStatus()
    return FINAL_QUEST_STATUS
end


return M

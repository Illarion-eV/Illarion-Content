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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (630, 'quest.iradona_goldschein_630_galmair');

local common = require("base.common")
local M = {}

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Finde Lotta Medborgar in Galmair"
Title[ENGLISH] = "Find Lotta Medborgar in Galmair"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Finde Lotta Medborgar in Galmair and sprich mit ihr."
Description[ENGLISH][1] = "Find Lotta Medborgar in Galmair and talk to her."
Description[GERMAN][2] = "Du hast Lotta gefunden. Wenn du möchtest, kannst du nun mit ihr sprechen. Frage nach 'Hilfe' wenn du nicht weißt, wonach du fragen sollst!\nSie kann dir einiges über die nordwestliche Karte von Illarion verraten."
Description[ENGLISH][2] = "You have found Lotta. If you like, you can talk with her now. Ask for 'help' if you do not know what to say!\nShe can provide you with information about the north-western part of Illarion."


-- Insert the position of the quest start here (probably the position of an NPC or item)
Start = {428, 248, 0}


-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(344, 249, 0)} -- entrance taverne (Scoria Mine)
--QuestTarget[1] = {position(393, 326, -5)} -- Lotta (If set active, it would confuse a newbie because the lower levels of Galmair are not on the same spot as the surface level)

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

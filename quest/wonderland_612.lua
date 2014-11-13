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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (612, 'quest.wonderland_612');

local common = require("base.common")
local M = {}

local GERMAN = Player.german
local ENGLISH = Player.english

-- Insert the quest title here, in both languages
local Title = {}
Title[GERMAN] = "Gefangen im Wunderland"
Title[ENGLISH] = "Trapped in the Wonderland"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
local Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Um zu entkommen lese dir sorgfältig die Anweisungen der Stimmen durch und achte darauf, aus welcher Himmelsrichtung sie kommen.\nEs empfiehlt sich ebenfalls erst zu überlegen und dann zu agieren, anstelle wild und zufÃ¤llig herumzulaufen."
Description[ENGLISH][1] = "In order to escape, you have to read the instructions given by the voices carefully and pay attention to the cardinal direction of the voice.\nIt is also recommended to think first and then to run instead of running mad and haphazardly."
Description[GERMAN][2] = "Du bist erfolgreich dem Geist entkommen. Glückwunsch!\nWomöglich wirst du die Stimme des Geists noch einmal hören. Keine Angst, er wird dir nichts mehr anhaben."
Description[ENGLISH][2] = "You have successfully escaped. Congratulations!\nProbably, you will hear the voice of the ghost one more time. Don't worry, he is not going to harm you anymore."
Description[GERMAN][3] = "Du bist erfolgreich dem Geist entkommen. Glückwunsch!"
Description[ENGLISH][3] = "You have successfully escaped. Congratulations!"

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
local QuestTarget = {}
QuestTarget[2] = {{890,596,0}, {876,590,0}, {878,562,0}}

-- Insert the quest status which is reached at the end of the quest
local FINAL_QUEST_STATUS = 3


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

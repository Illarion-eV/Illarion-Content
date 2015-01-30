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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (504, 'quest.granor_bergenhieb_504');

local common = require("base.common")
local M = {}


local GERMAN = Player.german
local ENGLISH = Player.english

-- Insert the quest title here, in both languages

local Title = {}
Title[GERMAN] = "Alchemistischer Bedarf"
Title[ENGLISH] = "Alchemical needs"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
local Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Da Egon die Kiste mit Flaschen umgeworfen hat, braucht Granor neue. Zehn Flaschen für seine Tränke sollst du ihm bringen."
Description[ENGLISH][1] = "Since Egon has thrown over the chest with bottles, Granor needs new ones. He told you to get him ten bottles."
Description[GERMAN][2] = "Der Sonnenkräuterbeutel wurde von Egon verschlampt! Bring Granor dreißig Sonnenkräuter."
Description[ENGLISH][2] = "Egon lost the sack with sun herbs. Bring thirty sun herbs to Granor."
Description[GERMAN][3] = "Da Egon Granors letzten Beutel an Rubinstaub aufgefressen hat, braucht dieser neuen. Zwei Beutel hat er von dir verlangt."
Description[ENGLISH][3] = "Since Egon has eaten Granor's last sack of ruby powder, he needs new ones. He wants you to bring him two sacks."
Description[GERMAN][4] = "Aus was für Gründen auch immer hat Egon seinen Mörser nach einem Vogel geworfen, weswegen Granor Ersatz braucht. Bring ihm einen neuen Mörser."
Description[ENGLISH][4] = "For whatever reasons, Egon has thrown his mortar at a bird. Therefore, Granor needs replacements. Bring him a new mortar."
Description[GERMAN][5] = "Für deine Mühen, sollst du dir nun deine Belohnung vom Rattenmenschen Egon abholen."
Description[ENGLISH][5] = "In exchange for your efforts, you can now get your reward from the ratman Egon."

-- Insert the position of the quest start here (probably the position of an NPC or item)
local Start = position(16, 687, 1)

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
local QuestTarget = {}
QuestTarget[1] = {position(16, 687, 1)}
QuestTarget[2] = {position(16, 687, 1)}
QuestTarget[3] = {position(16, 687, 1)}
QuestTarget[4] = {position(16, 687, 1)}
QuestTarget[5] = {position(17, 682, 1)}

-- Insert the quest status which is reached at the end of the quest
local FINAL_QUEST_STATUS = 6


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
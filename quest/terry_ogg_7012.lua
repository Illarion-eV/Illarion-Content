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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (525, 'quest.Akaltuts_Chamber_525_dungeon');

local common = require("base.common")
local M = {}

local GERMAN = Player.german
local ENGLISH = Player.english

-- Insert the quest title here, in both languages
local Title = {}
Title[GERMAN] = ""
Title[ENGLISH] = "Rune Magic"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
local Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = ""
Description[ENGLISH][1] = "The wandering mage Terry Ogg has sent you on the task to find the rune RA and learn it. There's a hint as to its location in the book on the table next to him on the magic island in Troll's Haven."
Description[GERMAN][2] = ""
Description[ENGLISH][2] = "Return to Terry Ogg at the magic island in Troll's Haven for your next task."
Description[GERMAN][3] = ""
Description[ENGLISH][3] = "The wandering mage Terry Ogg has told you to store your newly learned rune as a spell in your grimoire. Go to a magic desk while equipped with a grimoire and quill to do so. You can purchase grimoires from Terry, or enchant regular books into Grimoires at the magic desk. Regular books and quills are sold by Half-hung Bryan by the Hemp Necktie Inn, while tailors and carpenters can also craft them."
Description[GERMAN][4] = ""
Description[ENGLISH][4] = "Return to Terry Ogg at the magic island in Troll's Haven for your next task."
Description[GERMAN][5] = ""
Description[ENGLISH][5] = "The wandering mage Terry Ogg wants you to see you cast the spell RA. This can be done by either speaking the rune 'RA' or using your grimoire to attune your newly stored spell to your wand, then double clicking the wand to use it."
Description[GERMAN][6] = ""
Description[ENGLISH][6] = "Return to Terry Ogg at the magic island in Troll's Haven."

-- Insert the position of the quest start here (probably the position of an NPC or item)
local Start = {position(656, 316, 0)}

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
local QuestTarget = {}

-- Insert the quest status which is reached at the end of the quest
local FINAL_QUEST_STATUS = 7

function M.QuestTitle(user)

    local german = Title[GERMAN] or ""
    local english = Title[ENGLISH] or ""
    return common.GetNLS(user, german, english)

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
    return Player.questAvailable
end

return M

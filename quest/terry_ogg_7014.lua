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
Title[ENGLISH] = "Wand Magic"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
local Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = ""
Description[ENGLISH][1] = "The wandering mage Terry Ogg has tasked you with going out to find a target to attack with your wand using wand magic. To use wand magic, you must first attune to wand magic using your grimoire. Then, simply equip the wand into one of your hand slots and right click the target you want to blast away at."
Description[GERMAN][2] = ""
Description[ENGLISH][2] = "Return to Terry Ogg at the magic island in Troll's Haven."

-- Insert the position of the quest start here (probably the position of an NPC or item)
local Start = {position(656, 316, 0)}

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
local QuestTarget = {}

-- Insert the quest status which is reached at the end of the quest
local FINAL_QUEST_STATUS = 3

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

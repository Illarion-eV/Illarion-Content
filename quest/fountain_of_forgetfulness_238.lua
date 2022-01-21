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
Title[ENGLISH] = "The fountain of forgetfulness"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do(This one you are meant to run around looking for clues without knowing exact locations)
local Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = ""
Description[ENGLISH][1] = "Seeking to change your magical occupation, you've been told to find the fountain of forgetfulness. Who would even know of such an obscure thing, however?"
Description[GERMAN][2] = ""
Description[ENGLISH][2] = "You finally found someone who had heard of the fountain. They spoke of a hermit living in the woods that might know more. Who could that be?"
Description[GERMAN][3] = ""
Description[ENGLISH][3] = "You met with Raban, the hermit in the northern woods, who told you of a fountain in the desert which might be what you are looking for. However he warned you of its dangers and its requirements of an offering."
Description[GERMAN][4] = ""
Description[ENGLISH][4] = "You found the fountain, but you don't know what offering it requires of you before you can drink of its waters. Maybe there is something in the area that can give you a clue?"
Description[GERMAN][5] = ""
Description[ENGLISH][5] = "You found a scroll lying nearby, though its contents do not make much sense to you. The blessing of the elders? You suppose you'll have to figure out what it means, then you should finally be able to conduct the offering ceremony and drink from the fountains waters!"
-- Insert the position of the quest start here (probably the position of an NPC or item)
local Start = {position(656, 316, 0)}

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
local QuestTarget = {}

-- Insert the quest status which is reached at the end of the quest
local FINAL_QUEST_STATUS = 6

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

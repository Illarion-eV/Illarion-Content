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


local common = require("base.common")

local M = {}

local GERMAN = Player.german
local ENGLISH = Player.english

local Title = {}
Title[GERMAN] = "Einführung in die Magie"
Title[ENGLISH] = "Introduction to Magic"

local Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Terry Ogg hat dich angewiesen, einige Bücher über Magie zu lesen, um ein Verständnis für deinen Zauberstab zu entwickeln, bevor du zu ihm zurückkehrst, um mehr zu lernen."
Description[ENGLISH][1] = "Terry Ogg has instructed you to go read some books about magic so that you can attune yourself to your wand, before returning to him to seek further knowledge."
Description[GERMAN][2] = "Nachdem du nun deine Hausaufgaben gemacht hast, indem du Bücher über Magie gelesen und ein Verständnis für deinen Zauberstab entwickeln konntest, solltest du zu Terry Ogg in Troll's Haven zurückkehren, um mehr über Magie zu lernen."
Description[ENGLISH][2] = "Now that you've done your homework in reading books about magic and have attuned to your wand, you should return to Terry Ogg in Troll's Haven to seek further knowledge on magic."


local FINAL_QUEST_STATUS = 3

function M.QuestTitle(user)
    return common.GetNLS(user, Title[GERMAN], Title[ENGLISH])
end

function M.QuestDescription(user, status)
    local german = Description[GERMAN][status] or ""
    local english = Description[ENGLISH][status] or ""

    return common.GetNLS(user, german, english)
end

function M.QuestStart()
    return {656, 316, 0}
end

function M.QuestTargets(user, status)
    return position(656, 316, 0)
end

function M.QuestFinalStatus()
    return FINAL_QUEST_STATUS
end

function M.QuestAvailability(user, status)
    if status == 0 and (user:increaseAttrib("willpower", 0) + user:increaseAttrib("essence", 0) + user:increaseAttrib("intelligence", 0)) > 30 and user:getQuestProgress(37) ~= 1 then --Only available to potential mages
        return Player.questAvailable
    else
        return Player.questNotAvailable
    end
end

return M

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
-- Quest: As a Galmair Guard (155)/(173)
local common = require("base.common")

local M = {}

local waypoint = {} --a list with positions
waypoint[1] = position(368, 250, 0) --1: statues of rules

local messageG = {}
messageG[1] = "[Queststatus] Du hast lesen die Regeln auf den Statuen des Dons die vor Galmairs Krone stehen."

local messageE = {}
messageE[1] = "[Quest status] You read the rules on the Don's statues in front of the Crest of Galmair."

function M.MoveToField(User)
    if (User:getQuestProgress(155) == 1) then --OK, the player does the quest
        local queststatus = User:getQuestProgress(173) --here, we save which fields were visited
        local queststatuslist = {}
        queststatuslist = common.Split_number(queststatus, 1) --reading the digits of the queststatus as table

        for i = 1, 3 do
            if User:isInRangeToPosition(waypoint[i], 2) and queststatuslist[i] == 0 then
                queststatuslist[i] = 1 --found it!
                common.InformNLS(User, messageG[i], messageE[i])
                User:setQuestProgress(173, queststatuslist[1] * 100) --saving the new queststatus
                queststatus = User:getQuestProgress(156) --and reading it again
                if queststatus == 100 then --found all waypoints
                    User:setQuestProgress(155, 2) --Quest solved!
                    common.InformNLS(User, "[Queststatus] Du hast deine aufgabe erfolgreich abgeschlossen.", "[Quest status] You completed your task successfully.")
                    return --more than solving isn't possible, bailing out
                end
            end
        end
    end
end

return M

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
-- Quest: As a Galmair Guard (155)/(156)
local common = require("base.common")

local M = {}

local waypoint = {} --a list with positions
waypoint[1] = position(404, 269, 1) --1: Notary
waypoint[2] = position(385, 333, 0) --2: South Gate
waypoint[3] = position(347, 229, 0) --3: The Don
local messageG = {}
messageG[1] = "[Queststatus] Der Notar scheint in das Zählen von Münzen vertieft zu sein, sonst ist alles gut."
messageG[2] = "[Queststatus] Am Südtor scheint alles in Ordnung zu sein."
messageG[3] = "[Queststatus] In der Krone ist es ruhig, abgesehen von den einigen herumlaufenden Arbeitern."
local messageE = {}
messageE[1] = "[Quest status] The Notary seems wrapped up in counting coins, but all is well."
messageE[2] = "[Quest status] The South Gate stands well."
messageE[3] = "[Quest status] The Crest is quiet, aside from the pacing of different workers."

function M.MoveToField(User)
    if (User:getQuestProgress(155) == 4) then --OK, the player does the quest
        local queststatus = User:getQuestProgress(156) --here, we save which fields were visited
        local queststatuslist = {}
        queststatuslist = common.Split_number(queststatus, 3) --reading the digits of the queststatus as table

        for i = 1, 3 do
            if User:isInRangeToPosition(waypoint[i], 2) and queststatuslist[i] == 0 then
                queststatuslist[i] = 1 --found it!
                common.InformNLS(User, messageG[i], messageE[i])
                User:setQuestProgress(156, queststatuslist[1] * 100 + queststatuslist[2] * 10 + queststatuslist[3] * 1) --saving the new queststatus
                queststatus = User:getQuestProgress(156) --and reading it again
                if queststatus == 111 then --found all waypoints
                    User:setQuestProgress(155, 5) --Quest solved!
                    common.InformNLS(User, "[Queststatus] Du hast deine Patroullie erfolgreich abgeschlossen.", "[Quest status] You completed your patrol successfully.")
                    return --more than solving isn't possible, bailing out
                end
            end
        end
    end
end

return M

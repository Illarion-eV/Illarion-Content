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
--INSERT INTO triggerfields VALUES (916,769,0,'triggerfield.runewick_patrol_1');
--INSERT INTO triggerfields VALUES (998,822,0,'triggerfield.runewick_patrol_1');
--INSERT INTO triggerfields VALUES (914,858,0,'triggerfield.runewick_patrol_1');
-- Quest: Investigate Runewick (223)/(224)

local common = require("base.common")

local M = {}

local waypoint = {} --a list with positions
waypoint[1] = position(916, 769, 0) --1: Hospital
waypoint[2] = position(998, 822, 0) --2: Archmage
waypoint[3] = position(914, 858, 0) --3: Harbour
local messageG = {}
messageG[1] = "[Queststatus] Alles ist sauber und ordentlich. Das Operationsbesteck ist sortiert und Bücher scheinen nicht zu fehlen."
messageG[2] = "[Queststatus] Auf der Insel des Erzmagiers scheint alles in Ordnung zu sein."
messageG[3] = "[Queststatus] Einige Boote dümpeln herum, der Abenteuerstein ist noch sauber aber eine Reihe von Planken sieht nicht mehr ganz neu aus."
local messageE = {}
messageE[1] = "[Quest status] Everything is clean and tidy. The operation set is sorted and all books seem to be there."
messageE[2] = "[Quest status] The Archmage's isle is silent and clean."
messageE[3] = "[Quest status] A few boats dart around, the adventure rock is still clean, but a series of planks does not look good."

function M.MoveToField(User)
    if (User:getQuestProgress(223) == 4) then --OK, the player does the quest
        local queststatus = User:getQuestProgress(224) --here, we save which fields were visited
        local queststatuslist = {}
        queststatuslist = common.Split_number(queststatus, 3) --reading the digits of the queststatus as table

        for i = 1, 3 do
            if User:isInRangeToPosition(waypoint[i], 2) and queststatuslist[i] == 0 then
                queststatuslist[i] = 1 --found it!
                common.InformNLS(User, messageG[i], messageE[i])
                User:setQuestProgress(224, queststatuslist[1] * 100 + queststatuslist[2] * 10 + queststatuslist[3] * 1) --saving the new queststatus
                queststatus = User:getQuestProgress(224) --and reading it again
                if queststatus == 111 then --found all waypoints
                    User:setQuestProgress(223, 5) --Quest solved!
                    common.InformNLS(User, "[Queststatus] Du hast deine Patroullie erfolgreich abgeschlossen.", "[Quest status] You completed your patrol successfully.")
                    return --more than solving isn't possible, bailing out
                end
            end
        end
    end
end

return M

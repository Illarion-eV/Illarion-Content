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
-- INSERT INTO triggerfields VALUES (826, 643, 2,'triggerfield.spelunker_1');
-- INSERT INTO triggerfields VALUES (821, 661, 1,'triggerfield.spelunker_1');
-- INSERT INTO triggerfields VALUES (657, 701, -3,'triggerfield.spelunker_1');
-- INSERT INTO triggerfields VALUES (822, 622, -3,'triggerfield.spelunker_1');
-- INSERT INTO triggerfields VALUES (668, 658, -6,'triggerfield.spelunker_1');

-- Quest: Spelunker (510)/(511)
local common = require("base.common")

local M = {}

local waypoint = {} --a list with positions
waypoint[1] = position(826, 643, 2) --1: second level of volcano
waypoint[2] = position(821, 661, 1) --2: first level of volcano
waypoint[3] = position(657, 701, -3) --3: west entrance of level -3 underground
waypoint[4] = position(822, 622, -3) --4: east entrance of level -3 underground
waypoint[5] = position(668, 658, -6) --5: entrance of the lowest level of dragon cave

local messageG = {}
messageG[1] = "[Queststatus] Du hast die höchste Ebene des Vulkans erreicht."
messageG[2] = "[Queststatus] Du hast die mittlere Ebene des Vulkans erreicht."
messageG[3] = "[Queststatus] Du hast den westlichen Eingang zur unteren Ebene entdeckt."
messageG[4] = "[Queststatus] Du hast den östlichen Eingang zur unteren Ebene entdeckt."
messageG[5] = "[Queststatus] Du hast die unterste Ebene der DrachenhÃ¶hle gefunden."
local messageE = {}
messageE[1] = "[Quest status] You have reached the uppermost level of the volcano."
messageE[2] = "[Quest status] You have reached the middle level of the volcano."
messageE[3] = "[Quest status] You have discovered the west entrance to the lower level."
messageE[4] = "[Quest status] You have discovered the east entrance to the lower level."
messageE[5] = "[Quest status] You have found the lowest level of the dragon cave."

function M.MoveToField(User)
    if (User:getQuestProgress(510) == 10) then --OK, the player does the quest
        local queststatus = User:getQuestProgress(511) --here, we save which fields were visited
        local queststatuslist = {}
        queststatuslist = common.Split_number(queststatus, 5) --reading the digits of the queststatus as table

        for i = 1, 5 do
            if User:isInRangeToPosition(waypoint[i], 2) and queststatuslist[i] == 0 then
                queststatuslist[i] = 1 --found it!
                common.InformNLS(User, messageG[i], messageE[i])
                User:setQuestProgress(511, queststatuslist[1] * 10000 + queststatuslist[2] * 1000 + queststatuslist[3] * 100 + queststatuslist[4] * 10 + queststatuslist[5] * 1) --saving the new queststatus
                queststatus = User:getQuestProgress(511) --and reading it again
                if queststatus == 11111 then --found all waypoints
                    User:setQuestProgress(510, 11) --Quest solved!
                    common.InformNLS(User, "[Queststatus] Du hast die Aufgabe erledigt und alle Ebenen gefunden.", "[Quest status] You completed the quest and found all levels.")
                    return --more than solving isn't possible, bailing out
                end
            end
        end
    end
end

return M

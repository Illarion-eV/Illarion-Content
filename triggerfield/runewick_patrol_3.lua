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

-- Quest: Investigate Runewick (223)/(224)
-- INSERT INTO triggerfields VALUES (696,314,0,'triggerfield.runewick_patrol_3');
-- INSERT INTO triggerfields VALUES (122,530,0,'triggerfield.runewick_patrol_3');
-- INSERT INTO triggerfields VALUES (384,229,0,'triggerfield.runewick_patrol_3');

local common = require("base.common")

local M = {}

local waypoint = {} --a list with positions
waypoint[1] = position(697, 314, 0) --1: Hemp Necktie Inn
waypoint[2] = position(121, 533, 0) --2: Cadomyr
waypoint[3] = position(348, 229, 0) --3: Galmair
local messageG = {}
messageG[1] = "[Queststatus] Du betrittst den Gasthof zur Hanfschlinge. Du spürst eine Atmosphäre voll Dummheit, Lüge und Betrug."
messageG[2] = "[Queststatus] Der Thronraum der Königin. Ein Ort, an welchem man die Aura der Königin und ihren Hochmut verspürt."
messageG[3] = "[Queststatus] Der 'Palast' des Dons - Alles sieht teuer und doch geschmacklos aus."
local messageE = {}
messageE[1] = "[Quest status] You enter the Hemp Necktie Inn. You almost feel an atmosphere full of stupidity, lies and deceit."
messageE[2] = "[Quest status] The Queen's throne room. A place where one should be mindful of her lofty opinion of herself."
messageE[3] = "[Quest status] The Don's 'palace' - Everything looks expensive but without any style."

function M.triggerEvent(User)
    if (User:getQuestProgress(223) == 12) then --OK, the player does the quest
        local queststatus = User:getQuestProgress(224) --here, we save which fields were visited
        local queststatuslist = {}
        queststatuslist = common.Split_number(queststatus, 3) --reading the digits of the queststatus as table

        for i = 1, 3 do
            if User:isInRangeToPosition(waypoint[i], 2) and queststatuslist[i] == 0 then
                queststatuslist[i] = 1 --found it!
                common.InformNLS(User,messageG[i],messageE[i])
                User:setQuestProgress(224, queststatuslist[1] * 100 + queststatuslist[2] * 10 + queststatuslist[3] * 1) --saving the new queststatus
                queststatus = User:getQuestProgress(224) --and reading it again
                if queststatus == 111 then --found all waypoints
                    User:setQuestProgress(223, 13) --Quest solved!
                    common.InformNLS(User, "[Queststatus] Du hast deine Patroullie erfolgreich abgeschlossen.", "[Quest status] You completed your patrol successfully.")
                    return --more than solving isn't possible, bailing out
                end
            end
        end
    end
end

return M

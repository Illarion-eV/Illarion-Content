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

-- Quest: As a Galmair Guard (155)/(158)
local common = require("base.common")

local M = {}

local waypoint = {} --a list with positions
waypoint[1] = position(697, 314, 0) --1: Hemp Necktie Inn
waypoint[2] = position(121, 533, 0) --2: Cadomyr
waypoint[3] = position(995, 815, 0) --3: Runewick
local messageG = {}
messageG[1] = "[Queststatus] Du betrittst den Gasthof zur Hanfschlinge. Es ist langweilig heute, aber eine angenehme Atmosphäre."
messageG[2] = "[Queststatus] Der Thronraum der Königin. Ein Ort, an welchem man die Aura der Königin und ihre erhabene Selbstwahrnehmung verspürt."
messageG[3] = "[Queststatus] Der Erzmagier scheint auf einige unbedeutende Geschichten fokussiert und macht sich nichtssagende Notizen."
local messageE = {}
messageE[1] = "[Quest status] You enter the Hemp Necktie Inn. It is rather dull today, but a good atmosphere."
messageE[2] = "[Quest status] The Queen's throne room. A place where one should be mindful of her lofty opinion of herself."
messageE[3] = "[Quest status] The Archmage seems focused on some unimportant history, and making pointless notes."

function M.triggerEvent(User)
    if (User:getQuestProgress(155) == 12) then --OK, the player does the quest
        local queststatus = User:getQuestProgress(158) --here, we save which fields were visited
        local queststatuslist = {}
        queststatuslist = common.Split_number(queststatus, 3) --reading the digits of the queststatus as table

        for i = 1, 3 do
            if User:isInRangeToPosition(waypoint[i], 2) and queststatuslist[i] == 0 then
                queststatuslist[i] = 1 --found it!
                common.InformNLS(User,messageG[i],messageE[i])
                User:setQuestProgress(158, queststatuslist[1] * 100 + queststatuslist[2] * 10 + queststatuslist[3] * 1) --saving the new queststatus
                queststatus = User:getQuestProgress(158) --and reading it again
                if queststatus == 111 then --found all waypoints
                    User:setQuestProgress(155, 13) --Quest solved!
                    common.InformNLS(User, "[Queststatus] Du hast deine Patroullie erfolgreich abgeschlossen.", "[Quest status] You completed your patrol successfully.")
                    return --more than solving isn't possible, bailing out
                end
            end
        end
    end
end

return M

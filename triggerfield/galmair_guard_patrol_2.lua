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

-- Quest: As a Galmair Guard (155)/(157)
local common = require("base.common")

local M = {}

local waypoint = {} --a list with positions
waypoint[1] = position(418, 187,0) --1: Dark Hole Mine
waypoint[2] = position(447, 121, 0) --2: Galmair Harbour
waypoint[3] = position(497, 205, 0) --3: Black Bridge (ambush)
waypoint[4] = position(628, 270, 0) --4: Eastern Lake of Life area
local messageG = {}
messageG[1] = "[Queststatus] Du hörst aus der Tiefe den Klang von Spitzhacken, welche auf Steine treffen."
messageG[2] = "[Queststatus] Die Boote schaukeln im Hafen, ansonsten ist der Hafen ruhig."
messageG[3] = "[Queststatus] Als du die Schwarzbrücke überquerst, ist ein lautes Zischen beim Angriff der Rattenmenschen zu hören. Ein Hinterhalt!"
messageG[4] = "[Queststatus] Krächzende Stimmen und klappernde Knochen warnen dich vor bevorstehendem Unheil."
local messageE = {}
messageE[1] = "[Quest status] You hear the sound of pickaxes striking stone echoing up from below."
messageE[2] = "[Quest status] The boats rock in the harbour, but the harbour is calm."
messageE[3] = "[Quest status] As you cross the Black Bridge, there is a loud hiss as Ratmen attack! Ambush!"
messageE[4] = "[Quest status] You hear chanting from up ahead, with rasping voices and the sound of bones clattering."

function M.MoveToField(User)
    if (User:getQuestProgress(155) == 9) then --OK, the player does the quest
        local queststatus = User:getQuestProgress(157) --here, we save which fields were visited
        local queststatuslist = {}
        queststatuslist = common.Split_number(queststatus, 4) --reading the digits of the queststatus as table

        for i = 1, 4 do
            if User:isInRangeToPosition(waypoint[i], 2) and queststatuslist[i] == 0 then
                queststatuslist[i] = 1 --found it!
                common.InformNLS(User, messageG[i], messageE[i])
                User:setQuestProgress(157, queststatuslist[1] * 1000 + queststatuslist[2] * 100 + queststatuslist[3] * 10 + queststatuslist[4] * 1) --saving the new queststatus
                queststatus = User:getQuestProgress(157) --and reading it again

                if i == 3 then --ambush!
                    world:gfx(41, position(497, 203, 0))
                    world:createMonster(571, position(497, 203, 0), -10) --snuffler
                    world:gfx(41, position(497, 207, 0))
                    world:createMonster(576, position(497, 207, 0), -10) --Contaminated Ratman

                end

                if queststatus == 1111 then --found all waypoints
                    User:setQuestProgress(155, 10) --Quest solved!
                    common.InformNLS(User, "[Queststatus] Du hast deine Patroullie erfolgreich abgeschlossen.", "[Quest status] You completed your patrol successfully.")
                    return --more than solving isn't possible, bailing out
                end
            end
        end
    end
end

return M

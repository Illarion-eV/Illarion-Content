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
-- INSERT INTO triggerfields VALUES (843,820,0,'triggerfield.runewick_patrol_2');
-- INSERT INTO triggerfields VALUES (843,821,0,'triggerfield.runewick_patrol_2');
-- INSERT INTO triggerfields VALUES (843,822,0,'triggerfield.runewick_patrol_2');
-- INSERT INTO triggerfields VALUES (843,823,0,'triggerfield.runewick_patrol_2');
-- INSERT INTO triggerfields VALUES (736,808,0,'triggerfield.runewick_patrol_2');
-- INSERT INTO triggerfields VALUES (736,809,0,'triggerfield.runewick_patrol_2');
-- INSERT INTO triggerfields VALUES (845,729,0,'triggerfield.runewick_patrol_2');
-- INSERT INTO triggerfields VALUES (910,699,0,'triggerfield.runewick_patrol_2');
-- INSERT INTO triggerfields VALUES (910,700,0,'triggerfield.runewick_patrol_2');

local common = require("base.common")

local M = {}

local waypoint = {} --a list with positions
waypoint[1] = position(843, 821, 0) --1: Lunord Bridge
waypoint[2] = position(736, 809, 0) --2: Runewick Harbour
waypoint[3] = position(845, 729, 0) --3: Merryglade
waypoint[4] = position(910, 699, 0) --4: Shadow Gate (ambush)
local messageG = {}
messageG[1] = "[Queststatus] Sanft schlagen die Wellen an die Pfeiler der Lunordbrücke. Einige Bauern bringen Feldfrüchte von Eibenthal."
messageG[2] = "[Queststatus] Die Boote schaukeln im Hafen, ansonsten ist der Hafen ruhig."
messageG[3] = "[Queststatus] Die glückliche Lichtung bietet das Bild eines friedlichen Bauernhofes, Hühner gacker, ein Schwein grunzt wohlig."
messageG[4] = "[Queststatus] Ein hohes unheilvolles Pfeifen peinigt deine Ohren. Plötzlich quillt Schleim aus den Ruinen des Schattentores."
local messageE = {}
messageE[1] = "[Quest status] Gently rock the waves to the pillars of the Lunord Bridge. Some farmers bring field crops from Yewdale."
messageE[2] = "[Quest status] The boats rock in the harbour, but the harbour is calm."
messageE[3] = "[Quest status] On the Merryglade one can see the picture of a peaceful farm, chickens cackle, a pig grunts comfortably."
messageE[4] = "[Quest status] A high unholy whistling pains your ears. Suddenly slime drops from the ruins of the Shadow Gate."

function M.MoveToField(User)
    if (User:getQuestProgress(223) == 9) then --OK, the player does the quest
        local queststatus = User:getQuestProgress(224) --here, we save which fields were visited
        local queststatuslist = {}
        queststatuslist = common.Split_number(queststatus, 4) --reading the digits of the queststatus as table

        for i = 1, 4 do
            if User:isInRangeToPosition(waypoint[i], 2) and queststatuslist[i] == 0 then
                queststatuslist[i] = 1 --found it!
                common.InformNLS(User, messageG[i], messageE[i])
                User:setQuestProgress(224, queststatuslist[1] * 1000 + queststatuslist[2] * 100 + queststatuslist[3] * 10 + queststatuslist[4] * 1) --saving the new queststatus
                queststatus = User:getQuestProgress(224) --and reading it again

                if i == 4 then --ambush!
                    world:gfx(41, position(497, 203, 0))
                    world:createMonster(612, position(908, 703, 0), -10) --Slimey Slime
                    world:gfx(41, position(497, 207, 0))
                    world:createMonster(613, position(910, 697, 0), -10) --Smouldy Slime

                end

                if queststatus == 1111 then --found all waypoints
                    User:setQuestProgress(223, 10) --Quest solved!
                    common.InformNLS(User, "[Queststatus] Du hast deine Patroullie erfolgreich abgeschlossen.", "[Quest status] You completed your patrol successfully.")
                    return --more than solving isn't possible, bailing out
                end
            end
        end
    end
end

return M

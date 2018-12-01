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

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue")
VALUES (1, 707, 312, -3, 6, 'Melissa', 'npc.poker.pokerNPC', 1, 9, 0, 102, 51, 0, 245, 180, 137);
]]

local M = {}

local game_poker = require("npc.poker.game_poker")

local isInitiated = false
local pokerTable

local function initPokerNPC(npcDealer)

    pokerTable = game_poker.newPokerTable( npcDealer, 3076, 3077, 61, 462, 1, 2,{
        position(707, 309, -3),
        position(705, 309, -3),
        position(703, 311, -3),
        position(703, 312, -3),
        position(703, 313, -3),
        position(703, 314, -3),
        position(705, 316, -3),
        position(707, 316, -3)
    }, {
        position(707, 310, -3),
        position(705, 310, -3),
        position(704, 311, -3),
        position(704, 312, -3),
        position(704, 313, -3),
        position(704, 314, -3),
        position(705, 315, -3),
        position(707, 315, -3)
    }, {
        position(707, 311, -3),
        position(704, 310, -3),
        position(705, 311, -3),
        position(705, 312, -3),
        position(705, 313, -3),
        position(705, 314, -3),
        position(704, 315, -3),
        position(707, 314, -3)
    }, position(706, 311, -3), position(706, 312, -3), position(706, 313, -3), 5)

    npcDealer:createAtPos(3, 816, 1)
    npcDealer:createAtPos(9, 183, 1)
    npcDealer:createAtPos(10, 53, 1)
   
    isInitiated = true
end

function M.nextCycle(thisNPC)
    if not isInitiated then
        initPokerNPC(thisNPC)
    end
    pokerTable.nextCycle()
end

function M.receiveText(theNpc, texttype, message, originator)
    pokerTable.receiveText(texttype, message, originator)
end

function M.beforeReload()
    pokerTable.beforeReload()
end

return M
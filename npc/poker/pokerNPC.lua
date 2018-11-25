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

local M = {}

local game_poker = require("npc.poker.game_poker")

local pokerTable = game_poker.newPokerTable( npcDealer, 3076, 3077, 61, 462, 1, 2,{
        position(-25,-126,-6),
        position(-25,-125,-6),
        position(-25,-124,-6),
        position(-31,-124,-6),
        position(-31,-125,-6),
        position(-31,-126,-6)
    }, {
        position(-26,-126,-6),
        position(-26,-125,-6),
        position(-26,-124,-6),
        position(-30,-124,-6),
        position(-30,-125,-6),
        position(-30,-126,-6)
    }, {
        position(-27,-126,-6),
        position(-27,-125,-6),
        position(-27,-124,-6),
        position(-29,-124,-6),
        position(-29,-125,-6),
        position(-29,-126,-6)
    }, position(-28,-124,-6), position(-28,-125,-6), position(-28,-126,-6), 5)


function M.nextCycle()
    pokerTable.nextCycle()
end

function M.receiveText(texttype, message, originator)
    pokerTable.receiveText(texttype, message, originator)
end

function M.beforeReload()
    pokerTable.beforeReload()
end

return M
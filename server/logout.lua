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

local factionLeader = require("scheduled.factionLeader")

local M = {}

-- Function to exchange the faction leader of a town.
local function exchangeFactionLeader( playerName )
    for i=1, #(factionLeader.informationTable) do
        if playerName == factionLeader.informationTable[i].npcName then
            factionLeader.updatePosition(factionLeader.informationTable[i].newPosition,
                factionLeader.informationTable[i].usualPosition)
        end
    end
end

function M.onLogout( theChar )

    if not theChar:isAdmin() then
        world:gfx(31,theChar.pos) --A nice GFX that announces clearly: A player logged out.
    end

    if theChar.name == "Valerio Guilianni" or theChar.name == "Rosaline Edwards" or theChar.name == "Elvaine Morgan" then
        exchangeFactionLeader( theChar.name )
    end
end

return M

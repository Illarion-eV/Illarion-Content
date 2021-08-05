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

local tutorial = require("content.tutorial")
local ship = require("content.ferry")

local M = {}

function M.MoveToField(Character)
    if Character:getQuestProgress(323) == 0 and Character:getQuestProgress(199) == 0 and Character:getQuestProgress(314) == 0 then --New player who has not chosen a faction before (323) and is not member of a faction (199) nor has completed the old tutorial (314)
        tutorial.NewbieSelection(Character,"Runewick")
    else
        ship.SailTo(Character,"Runewick")
    end
end

return M

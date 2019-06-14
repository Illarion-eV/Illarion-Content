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
-- Global events and cooldowns for favour/gods/priest system

-- INSERT INTO scheduledscripts (sc_scriptname, sc_mincycletime, sc_maxcycletime, sc_functionname) VALUES ('scheduled.gods_events', 3600, 3600, 'tick');

local gods_common = require("content._gods.gods_common")

local M = {}

-- The list of functions and their counters that are scheduled to be executed

function M.tick()
    for _,event in ipairs(gods_common.globalEvents) do
        event:tick()
    end

end

return M
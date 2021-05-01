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

local common = require("base.common")
local notice = require("item.notice")
local M = {}

local collected = false

function M.rent()
    --Read date and time
    local month = world:getTime("month")
    local day = world:getTime("day")
    local hour = world:getTime("hour")
    --Rent duration is reduced on the first day of each month except for Mas
    if (month == 16) or (day > 1) then
        return
    -- Rent duration is reduced at 00:00
    elseif (hour == 0) and not collected then
        notice.reduceRentTimer()
        collected = true
        return
    --[[To ensure that it only reduces once, it only goes back to being possible to collect rent at 01:00
        meaning it won't happen again for a month]]
    elseif (hour == 1) and collected then
        notice.removeRentalIfDurationIsUp()
        collected = false
        return
    end
end

return M

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

local notice = require("item.notice")
local M = {}

local lastCollected = false

function M.rent()

    local month = world:getTime("month")

    --Rent duration is reduced on the first day of each month except for Mas
    if (month == 16) then
        return
    end

    --the scriptVar gets saved as a top level variable so the database only has to get accessed once any time top level variables are reset
    if not lastCollected then
        local found, result = ScriptVars:find("lastMonthRentWasCalled")
        if found then
            lastCollected = result
        end
    end

    if not lastCollected or lastCollected ~= month then
        notice.reduceRentTimer()
        lastCollected = month
        ScriptVars:set("lastMonthRentWasCalled", month)
        ScriptVars:save()
        return
    end
end

return M

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

function M.addEffect(teachEffect, Character)

    local year=world:getTime("year")
    year=(year-1)*31536000					-- (year-1)*((15*24) + 5)*24*60*60
    local month=world:getTime("month")
    month=(month-1)*2073600					-- (month-1)*24*24*60*60
    local day=world:getTime("day")
    day=(day-1)*86400							-- (day-1)*24*60*60
    local hour=world:getTime("hour")
    hour=hour*3600								-- hour*60*60
    local minute=world:getTime("minute")
    minute=minute*60
    local second=world:getTime("second")
    second=second

    local waittime=1814400

    local timestamp=year+month+day+hour+minute+second+waittime

    teachEffect:addValue("Rune1Index",timestamp)
    teachEffect:addValue("Rune2Index",1)
end

function M.callEffect(teachEffect, Character)    -- Effect wird ausgeführt

    teachEffect.nextCalled =99999999999999       -- call it again in öhm...never!
    return true
end

function M.removeEffect( Effect, Character )

end

function M.loadEffect(Effect, Character)

end

return M

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
-- Fighting LTE

function M.addEffect( Effect, Character)
    -- silence
end

function M.callEffect( Effect, Char )
    local found, value = Effect:findValue( "stop" )
    if found then
        Char:inform("Stop for: "..(value-1))
        if ( value <= 1 ) then
            Effect:removeValue( "stop" )
        else
            Effect:addValue( "stop", value-1 )
        end
    else
        found,value = Effect:findValue( "empty" )
        if found then
            if ( value == 15 ) then
                Effect:addValue( "empty", value+1 )
            else
                return false
            end
        else
            Effect:addValue( "empty", 1 )
        end
    end

    Effect.nextCalled = 1
    return true
end

function M.removeEffect( Effect, Character )
    -- silence
end

return M

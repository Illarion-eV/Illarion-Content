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

local M = {}
-- Long time effect script for limiting movepoints
-- effect ID: 501

function M.addEffect( effect, target )
    effect.nextCalled = 1
end

function M.callEffect( effect, target )

    local foundEffect, movepointReductionLeft = effect:findValue("movepointReduction")
    local _, movepointMin = effect:findValue("movepointMin")
    if not foundEffect then
        return false
    end

    if movepointReductionLeft > 0 then
        if target.movepoints > movepointMin then
            if movepointReductionLeft < (target.movepoints - movepointMin) then
                effect:addValue("movepointReduction", 0)
                effect:addValue("movepointMin", 500)
                target.movepoints = target.movepoints - movepointReductionLeft
            else
                effect:addValue("movepointReduction", movepointReductionLeft - (target.movepoints - movepointMin))
                target.movepoints = movepointMin
            end
        end
        effect.nextCalled = 5
        return true
    end

    return false
end

function M.loadEffect( effect, target )
    effect.nextCalled = 5
end

function M.removeEffect( effect, target )

end

return M

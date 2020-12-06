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
-- Long Time Effect Script: Inline Tutorial
-- Effect ID: 13

local M = {}

function M.addEffect(inlineTutorial, Character)
end

function M.callEffect(inlineTutorial,Character)

    if not Character:isNewPlayer() then
        return false --removing the effect
    end

    inlineTutorial.nextCalled=10 --One second
    return true --bailing out in any case

end

function M.removeEffect(inlineTutorial, Character)

    Character:inform("[Tutorial]","[Tutorial]")

end

return M

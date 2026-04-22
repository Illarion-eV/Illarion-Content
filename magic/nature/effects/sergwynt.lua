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

local shared = require("magic.nature.shared")
local poison = require("magic.nature.poison")

local M = {}

local function getAntidoteAmount(user, spellName)

    local amount = 500 --Lower than the toxgwynt amount but without the target resisting it
    amount = shared.scaleEffect(user, spellName, amount)

    return math.floor(amount)

end

function M.effect(user, location, target)

    world:gfx(58, location)
    world:makeSound(13, location)
    local amount = getAntidoteAmount(user, "Sergwynt")
    poison.applyAntidote(target, amount)
end

function M.checksToPass(user, location, target)
    return true
end

return M

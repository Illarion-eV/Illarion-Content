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

local runes = require("magic.arcane.runes")

local M = {}

function M.dispel(spell, targets)

    local dispels = {
        {primary = runes.checkSpellForRuneByName("RA", spell), object = 360}, -- fire melts ice flames
        {primary = runes.checkSpellForRuneByName("CUN", spell), object = 359}, -- water douses flames
        {primary = runes.checkSpellForRuneByName("JUS", spell), object = 372} -- wind blows away poisoned clouds
    }

    for _, item in pairs(targets.items) do
        local itemIsStatic = item.wear == 255

        if itemIsStatic then
            return
        end

        for _, dispellable in pairs(dispels) do
            if dispellable.object == item.id and dispellable.primary then
                world:erase(item, item.number)
            end
        end
    end
end

return M

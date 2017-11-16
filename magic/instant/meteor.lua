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
local common = require("base.common")

function M.cast(caster, victim)
    caster:inform("Du lässt einen Felsen aus der Höhe hinab auf deinen Gegner schmettern", "You call down a rock on your enemy")
    victim:inform("Ein Fels kommt plötzlich aus der Luft und trifft dich", "Suddenly a rock appears in the air and hits you")

    world:gfx(1, victim.pos)
    world:createItemFromdId(28, 1, victim.pos, true, 1)

    local positions = common.GetFreePositions(victim.pos, 1, true, false)
    for position in positions do
        if not position == caster.pos and not position == victim.pos and math.random(1,6) <= 4 then
            world:gfx(1, victim.pos)
            world:createItemFromdId(28, 1, position, true, 1)
        end
    end

    -- TODO: Add some sort of defence calculation here :)
    victim:increaseAttrib("hitpoints", -1000);
end

return M


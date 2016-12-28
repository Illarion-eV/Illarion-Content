--
-- Created by IntelliJ IDEA.
-- User: rober
-- Date: 04.09.2016
-- Time: 15:44
-- To change this template use File | Settings | File Templates.
--

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

    -- TODO: Add some sort of defense calculation here :)
    victim:increaseAttrib("hitpoints", -1000);
end

return M


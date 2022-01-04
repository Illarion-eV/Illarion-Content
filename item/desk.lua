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
local createSpell = require("magic.arcane.createSpell")
local M = {}

-- UPDATE items SET itm_script='item.desk' WHERE itm_id IN (550, 551, 1219, 1220, 1221, 1222);

function M.UseItem(user, sourceItem)
    if sourceItem.pos == position(592, 171, -3) then --then player used the desk and breaks something
        user:inform(
            "Als du etwas auf dem Schreibtisch ber�hrst, kippt eine Flasche um und zerbricht mit einer Explosion, die dich f�r einen Moment blendet.",
            "As you move something on the desk, a bottle is jostled around and breaks, causing an explosion that temporarily blinds you.")
        world:gfx(31, sourceItem.pos) -- bright star gfx
        world:makeSound(5, sourceItem.pos) --a loud boom
        local foundEffect, myEffect = user.effects:find(100); -- perception debuff
        if foundEffect then
            myEffect.nextCalled = 5 * 600;
        else
            myEffect = LongTimeEffect(100, 5 * 600) --5min
            user.effects:addEffect(myEffect)
        end
    else
        -- If it is just a regular desk and not used for the above quest purposes, then use it for magic purposes
        createSpell.mainDialog(user, sourceItem)
    end
end

return M

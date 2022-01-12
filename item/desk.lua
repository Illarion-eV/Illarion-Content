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
local common = require("base.common")
local lookat = require("base.lookat")
local texts = require("magic.arcane.base.texts")

local M = {}

-- UPDATE items SET itm_script='item.desk' WHERE itm_id IN (550, 551, 1219, 1220, 1221, 1222);

function M.UseItem(user, sourceItem)
    if sourceItem.pos == position(592, 171, -3) then --then player used the desk and breaks something
        user:inform(
            "Als du etwas auf dem Schreibtisch berührst, kippt eine Flasche um und zerbricht mit einer Explosion, die dich für einen Moment blendet.",
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
    elseif sourceItem.id == 3502 or sourceItem.id == 3503 then
        -- it's a magic desk
        createSpell.mainDialog(user, sourceItem)
    end
end

function M.LookAtItem(user, item)

    local lookAt = lookat.GenerateLookAt(user, item)

    if item.id == 3502 or item.id == 3503 then
        lookAt.name= common.GetNLS(user, texts.magicDesk.name.german , texts.magicDesk.name.english )
        lookAt.description = common.GetNLS(user, texts.magicDesk.description.german, texts.magicDesk.description.english)
    end

    return lookAt
end

return M

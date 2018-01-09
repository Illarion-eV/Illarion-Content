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
local artifactcreation = require("craft.final.artifactcreation")
local magic = require("base.magic")

local M = {}

function M.UseItem(User, SourceItem, ltstate)
-- quest overlay Viridian Neddle (alchemist rat men dugeon)
    if SourceItem.pos == position(592, 171, -3) then --then player used the desk and breaks something
        User:inform(
            "Als du etwas auf dem Schreibtisch berührst, kippt eine Flasche um und zerbricht mit einer Explosion, die dich für einen Moment blendet.",
            "As you move something on the desk, a bottle is jostled around and breaks, causing an explosion that temporarily blinds you.")
        world:gfx(31, SourceItem.pos) -- bright star gfx
        world:makeSound(5, SourceItem.pos) --a loud boom
        local foundEffect, myEffect = User.effects:find(100); -- perception debuff
        if foundEffect then
            myEffect.nextCalled = 5 * 600;
        else
            local myEffect = LongTimeEffect(100, 5 * 600) --5min
            User.effects:addEffect(myEffect)
        end
        return
    end

    if magic.isMage(User) then
        artifactcreation.artifactcreation:showDialog(User, SourceItem)
    else
        common.HighInformNLS(User,
            "Du verstehst nichts von dem, was du auf diesem Schreibtisch findest. Es scheint sich aber um Unterlagen für Magier zu handeln.",
            "You don't understand any you can find on that desk. It looks like any magic stuff.")
    end

end

return M

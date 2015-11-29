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

-- This script handles all the small features of the alchemy hut of Granor Bergenhieb.
-- The functions are hooked in the various scripts with the actual entry points.

local common = require("base.common")
local lookat = require("base.lookat")

local M = {}

function M.questCheck(User, SourceItem)

    if SourceItem.pos == position(897, 577, -9) then -- your trying to steal the dagger
        User:inform("Als du versuchst, den Dolch herauszuziehen, verwandeln sich die Schatzw�chter und untote Skelette erscheinen.", "As you try and pull out the dagger, the guardians of the treasure transform and undead skeletons emerge.")
        world:createMonster(782, position(893,574,-9), -20)
        world:createMonster(782, position(896,574,-9), -20)
        world:createMonster(782, position(899,574,-9), -20)
        world:createMonster(782, position(902,574,-9), -20)
        world:gfx(41, position(893,574,-9)) -- swirly
        world:gfx(41, position(896,574,-9)) -- swirly
        world:gfx(41, position(899,574,-9)) -- swirly
        world:gfx(41, position(902,574,-9)) -- swirly
        end

    local itemData
    local isRonaganTrap = (SourceItem:getData("ronaganTrap") == "true")
    if (isRonaganTrap == true) then
        User:inform("Ein Dieb hat dich in eine Falle gelockt. Er springt aus einem der Schatten und stiehlt dir ein paar M�nzen.", "A thief has lured you into a trap, jumping out from a shadow, he steals some coins�from you.")

        -- steal 1% - 5% of characters money in inventroy
        local wealth = money.CharCoinsToMoney(User)
        money.TakeMoneyFromChar(User, math.random(math.floor(wealth / 100), math.floor(wealth / 20)))
        return
   end
   
end
--]]

return M

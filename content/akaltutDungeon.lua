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

-- This script handles the small features of the group treasure chest in the Akaltut Dungeon.
-- INSERT INTO triggerfields VALUES (471, 775, -9,'content.akaltutDungeon');
-- INSERT INTO triggerfields VALUES (470, 776, -9,'content.akaltutDungeon');
-- INSERT INTO triggerfields VALUES (472, 776, -9,'content.akaltutDungeon');
-- INSERT INTO triggerfields VALUES (471, 777, -9,'content.akaltutDungeon');


local common = require("base.common")
local lookat = require("base.lookat")
local treasureBase = require("item.base.treasure")
local globalvar = require("base.globalvar")

local posChar = {
position(471, 775, -9),
position(470, 776, -9),
position(472, 776, -9),
position(471, 777, -9)}

local TRESURE_CHEST_ID = 2830

local M = {}

M.positionChest = position(471, 776, -9)

function M.MoveToField(user)
    if common.isInList(user.pos, posChar) then
        local itemAtPosition = world:getItemOnField(M.positionChest)
        if itemAtPosition.id == TRESURE_CHEST_ID then
            common.InformNLS(user,
                "Der Knopf unter deinen Füßen gibt nach. In der Schatzkiste klickt etwas.",
                "The step plate under your feet sinks. Something clicks in the treasure chest.")
        else
            common.InformNLS(user,
                "Der Knopf unter deinen Füßen gibt nach.",
                "The step plate under your feet sinks.")
        end
    end
end

function M.openChest(user, sourceItem, level)
    local posi=sourceItem.pos

    for i=1, #posChar do
        if not world:isCharacterOnField(posChar[i]) then -- at lest one button not occupied
            common.InformNLS(user,
                "Irgendeine Mechanik verhindert, dass du die Schatzkiste öffnen kannst. Haben sich nicht diese Knöpfe dort bewegt?",
                "Some mechanics prevent you from opening the treasure chest. Have not these buttons moved there?")
            return
        end
    end
    -- all buttons occupied, open chest
    world:erase(sourceItem, sourceItem.number)
    if (level ~= nil) and (level~=0) and (level < 10) then
        world:gfx(globalvar.gfxRAIN,posi)
        world:makeSound(globalvar.sfxSNARING,posi)
        treasureBase.dropTreasureItems(posi, level)
    end
end
--]]

return M

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
local playerlookat = require("server.playerlookat")
local lookat = require("base.lookat")

local M = {}
-- belongs also to item id 2873

-- UPDATE items SET itm_script='item.id_2874_mirror' WHERE itm_id = 2874;

local ladderPosition = position(-32,193,-8)
local mirrorPosition = position(-28,193,-8)

function M.LookAtItem(User, Item)

    local lookAt = lookat.GenerateLookAt(User, Item)

    if Item.pos == mirrorPosition and User:getFaceTo() == Character.dir_east and User.pos == position(-29, 193, -8) then
        lookAt.description = common.GetNLS("Hinter deinem Rücken erkennst du deutlich eine Leiter im Spiegel.",
                                                "Behind your back you can clearly see a ladder in the mirror.")

        if ( not common.isItemIdInFieldStack(35, ladderPosition)) then
            world:createItemFromId(35, 1, ladderPosition, true, 999, nil)
        end
    end

    return lookAt
end

function M.UseItem(User, SourceItem)
    local output = playerlookat.getCharDescription( User, User, 2);
    -- 2 means mode mirror
    common.TurnTo( User, SourceItem.pos );
    User:inform(output);
end
return M


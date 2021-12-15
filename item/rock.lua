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
local lookat = require("base.lookat")
local teacher = require("alchemy.base.teacher")
local mining = require("craft.gathering.mining")

local M = {}

-- UPDATE items SET itm_script='item.rock' WHERE itm_id IN (1246,1245,232,914,1273,1276,1250);

function M.UseItem(User, SourceItem, ltstate)
    -- alchemy stuff
    if SourceItem.pos == position(75,651,0) or SourceItem.pos == position(873,878,0) then
        teacher.UseItem(User, SourceItem, ltstate)
        return
    end
    -- alchemy end
    mining.StartGathering(User, SourceItem, ltstate);
end

function M.LookAtItem(User,Item)
    -- alchemy stuff
    if Item.pos == position(75,651,0) or Item.pos == position(873,878,0) then
        return teacher.LookAtItem(User, Item)
    end
    -- alchemy end

    -- tbd: custom loockat for minable rocks
    return lookat.GenerateLookAt(User, Item)

end

return M


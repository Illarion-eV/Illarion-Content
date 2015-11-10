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
local id_382_ceilingtrowel = require("gm.items.id_382_ceilingtrowel")

-- UPDATE items SET itm_script='item.id_316_sand' WHERE itm_id = 316;

local deleteIt

function M.MoveItemBeforeMove(User, SourceItem, TargetItem)
    deleteIt=false;
    local GroundItem = world:getItemOnField(TargetItem.pos)
    if (GroundItem.id==10) then
        local removePos = TargetItem.pos
        world:erase(GroundItem,1)
        deleteIt=true
        world:gfx(45,TargetItem.pos)
        
        -- In case the portal is on a gm set spawnpoint, we remove the spawnpoint
        
        id_382_ceilingtrowel.saveRemovePosition(removePos)
    end
    return true
end

function M.MoveItemAfterMove(User, SourceItem, TargetItem)
    if deleteIt then world:erase(TargetItem,1) end
end

return M
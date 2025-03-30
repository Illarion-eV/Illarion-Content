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
-- UPDATE items SET itm_script='item.id_2760_rope' WHERE itm_id=2760;

local common = require("base.common")
local climbing = require("content.climbing")
local cloth = require("item.general.cloth")

local M = {}

M.LookAtItem = cloth.LookAtItem

function M.UseItem(user, sourceItem, ltstate)

    if common.isBroken(sourceItem) then
        common.HighInformNLS(user,"Deine Seil ist kaputt.","Your rope is broken.")
        return
    end

    -- climbing script handles the rest
    climbing.climbDown(user)
end

return M


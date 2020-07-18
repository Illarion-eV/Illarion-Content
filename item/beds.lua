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

-- UPDATE items SET itm_script='item.beds' WHERE itm_id IN (740, 741, 742, 743, 744, 745, 746, 747, 967, 968, 969, 988, 989, 1911, 1912);

local traits = require("base.traits")
local common = require("base.common")

local M = {}

function M.UseItem(user, sourceItem, ltstate)
    --traits.traitsManagement(user)
end

return M
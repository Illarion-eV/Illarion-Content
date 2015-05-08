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
-- Wegweiserskript
-- Nitram
local common = require("base.common")
local lookat = require("base.lookat")
local oldSlimeFeeding = require("content.oldSlimeFeeding")

local M = {}

-- UPDATE items SET itm_script='item.signpost' WHERE itm_id IN (1817,1809,1808,1807,308,1804,586,3084,3081,3082,3083,519,520,521,337,1914,1915,2046,2069,512,2924,2925,2926,2927);

function M.LookAtItem(User, Item)
    if Item:getData("oldSlimeFeeding") == "true" then
        oldSlimeFeeding.setSignText(Item)
    end
    return lookat.GenerateLookAt(User, Item, lookat.NONE)
end
return M


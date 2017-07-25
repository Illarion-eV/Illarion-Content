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
-- INSERT INTO triggerfields VALUES (950,783,1,'triggerfield.collectionchest_runewick');

local factions = require("base.factions")
local collectionchest = require("content.collectionchest")

local M = {}

-- Donation to the Runewick collection chest

function M.PutItemOnField(item,user)

    collectionchest.donate(item, user, factions.runewick)

end

return M

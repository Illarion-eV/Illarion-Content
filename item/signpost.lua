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
require("base.common")
require("base.lookat")
require("triggerfield.slimeFeeding")

module("item.signpost", package.seeall)

-- UPDATE common SET com_script='item.signpost' WHERE com_itemid IN (1817,1809,1808,1807,308,1804,586,3084,3081,3082,3083,519,520,521,337,1914,1915,2046,2069,512,2924,2925,2926,2927);

function LookAtItem(User, Item)
    return base.lookat.GenerateLookAt(User, Item, base.lookat.NONE)
end
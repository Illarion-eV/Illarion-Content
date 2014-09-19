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
-- Kohlbewegungsscript

-- UPDATE items SET itm_script='item.id_290_cabbage' WHERE itm_id IN (290);

local common = require("base.common")

local M = {}

function M.MoveItemBeforeMove(User, SourceItem, TargetItem)
    if (SourceItem:getData("amount") ~= "") then
        common.HighInformNLS(User,
		"Du würdest den Kohl beschädigen, ziehst du ihn mit bloßen Händen heraus. Du benötigst eine Sichel, um ihn abzuschneiden.",
		"You would damage the cabbage, if you pulled it out with bare hands. You need a sickle to cut it.");
        return false
    end
    return true
end    

return M


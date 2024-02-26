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
-- UPDATE items SET itm_script='item.stairs' WHERE itm_id=;28,29,35,319,1003,1185,1186,1403,1404,2832

local common = require("base.common")
local lookat = require("base.lookat")

local M = {}

function M.UseItem(User,SourceItem)

    User.inform(User, "Beweg dich auf die Treppe um sie zu benutzen.", "If you would like to use the stairs walk on them.")
end

function M.LookAtItem(user, sourceItem)

    local theLookat = lookat.GenerateLookAt(user, sourceItem)

    if sourceItem:getData("doorLock") == "locked" then
        theLookat.description = common.GetNLS(user, "GERMAN TRANSLATION", "The trapdoor above appears to be locked, making it futile to attempt an ascent.")
    end

    return theLookat

end

return M


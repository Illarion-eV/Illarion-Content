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
local lookat = require("base.lookat")
local analysis = require("alchemy.base.analysis")
local gems = require("base.gems")

-- UPDATE items SET itm_script='item.gems' WHERE itm_id IN (45, 46, 197, 198, 283, 284, 285);

local M = {}

function M.LookAtItem(user, sourceItem)
    local lookAt = lookat.GenerateLookAt(user, sourceItem)

    if not common.IsNilOrEmpty(sourceItem:getData(gems.levelDataKey)) then
        lookAt.description = common.GetNLS(user,"Ein alter magischer Edelstein! Dieses Item sollte es nicht geben. Bitte log deinen Char neu ein und informiere einen Entwickler.", "An old magical gemstone. This item should not exists. Please relog your char and inform a developer")
        return lookAt
    end
    return lookAt
end

function M.UseItem(User, sourceItem, ltstate)
    analysis.AnalysisMain(User,sourceItem)
end

return M


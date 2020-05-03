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

-- UPDATE items SET itm_script='item.id_1206_claypit' WHERE itm_id=1206;

local common = require("base.common")
local lookat = require("base.lookat")
local climbing = require("content.climbing")
local claydigging = require("craft.gathering.claydigging")

local M = {}

local holePosition = {
    position(854, 414, 0),
    position(659, 255, 0)
}

function M.UseItem(User, SourceItem, ltstate)
    for  i = 1, #holePosition do
        if (SourceItem.pos == holePosition[i]) then
        common.HighInformNLS(User,
            "Du brauchst ein Seil um hier hinab zu klettern.",
            "You need a rope to climb down here.")
            if climbing.hasRope(User) then
                climbing.climbDown(User)
            end
        return
        end
    end

    claydigging.StartGathering(User, SourceItem, ltstate)
end

function M.LookAtItem(User, Item)

    local lookAt = lookat.GenerateLookAt(User, Item)

    if Item.pos == holePosition then
        lookAt.name = common.GetNLS(User,
            "Ein tiefes Loch.",
            "A deep hole.")
        lookAt.description = common.GetNLS(User,
        "Dieses Loch scheint bodenlos.",
        "This hole looks bottomless.")
    end
    return lookAt
end

return M

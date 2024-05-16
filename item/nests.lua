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
local egggathering = require("craft.gathering.egggathering")

local M = {}

function M.UseItem(user, sourceItem, actionState)

    egggathering.StartGathering(user, sourceItem, actionState)
end

function M.LookAtItem(user, sourceItem)

    local lookAt = lookat.GenerateLookAt(user, sourceItem)

    local effectType = sourceItem:getData("eggProtectionType")

    if effectType == "ssigus" then

        lookAt.description = common.GetNLS(user, "GERMAN TRANSLATION", "A nest containing lizardman eggs.")
    end

    return lookAt
end

return M


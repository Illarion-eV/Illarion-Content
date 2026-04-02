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

local M = {}

local openCurtains, closedCurtains = {}, {}

local function addCurtains(closedCurtain, openCurtain)
    openCurtains[openCurtain] = closedCurtain
    closedCurtains[closedCurtain] = openCurtain
end

addCurtains(Item.transparentCurtainsClosed, Item.transparentCurtainsOpen)

function M.UseItem(user, curtain)

    if openCurtains[curtain.id] then

        world:swap(curtain, openCurtains[curtain.id], 233)

        common.InformNLS(user,"Du ziehst die Vorhänge zu.","You draw close the curtains.")

    elseif closedCurtains[curtain.id] then

        world:swap(curtain, closedCurtains[curtain.id], 233)
        common.InformNLS(user,"Du ziehst die Vorhänge auf.","You open the curtains.")
    end

end

function M.LookAtItem(User,Item)
    return lookat.GenerateLookAt(User, Item, lookat.NONE)
end

return M

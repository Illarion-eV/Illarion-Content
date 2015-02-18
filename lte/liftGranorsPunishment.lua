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

-- Long time effect (6)
local M = {}

function M.addEffect(theEffect, user)
    user:increaseAttrib("perception", -10)
end

function M.callEffect(theEffect, user)
    return false
end

function M.loadEffect(theEffect, user)
    user:increaseAttrib("perception", -10)
end

function M.removeEffect(theEffect, user)
    user:inform("Die Blendung, die du in Granors Hütte erfahren hast, verliert ihre Wirkung.", "The blinding that were inflicted on you in Granor's hut vanishes.")
    user:increaseAttrib("perception", 10)
end

return M

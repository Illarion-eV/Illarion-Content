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
local spellProjectile = require("monster.base.spells.projectile")

local function _isTable(value)
    return type(value) == "table"
end

return function(params)
    if params == nil then
        params = {}
    end
    if not _isTable(params) then
        error("The parameters for the fireball spell aren't a table.")
    end

    if params.gfxId == nil then params.gfxId = 8 end
    if params.sfxId == nil then params.sfxId = 5 end
    if params.trailGfxId == nil then params.trailGfxId = 1 end

    return spellProjectile(params)
end
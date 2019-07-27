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

local base = require("monster.base.base")
local boneDragons = require("monster.race_63_bone_dragon.base")
local common = require("base.common")
local madness = require("monster.base.madness")

local M = boneDragons.generateCallbacks()

local orgOnSpawn = M.onSpawn
function M.onSpawn(monster)
    if orgOnSpawn ~= nil then
        orgOnSpawn(monster)
    end

    base.setColor{monster = monster, target = base.SKIN_COLOR, red = 100, green = 100, blue = 100}
end

local dragonMadness = madness{monsterId = 638 }
dragonMadness.addCallbacks(M)

local oldOnDeath = M.onDeath
M.onDeath = function(monster)
    if oldOnDeath ~= nil then
        oldOnDeath(monster)
    end

    local closePlayers = world:getPlayersInRangeOf(monster.pos, 2)

    for _, closePlayer in pairs(closePlayers) do
        common.ParalyseCharacter(closePlayer, 5, false, false)
        common.InformNLS(closePlayer,
        "Der Knochendrache fällt in sich zusammen. Du wirst von einem schweren Knochen getroffen und zu Boden geworfen.",
        "The bone dragon drops dead. A heavy bone hits you and knocks you to the ground.")
    end
end

return M
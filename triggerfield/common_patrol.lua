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

-- Quest: used for different quests so the same waypoint can be used from multiple triggers
-- INSERT INTO triggerfields VALUES (x,y,z,'triggerfield.common_patrol');


local common = require("base.common")
local aquestionofhonour_3 = require("triggerfield.aquestionofhonour_3")
local runewick_patrol_3 = require("triggerfield.runewick_patrol_3")
local galmair_guard_patrol_3 = require("triggerfield.galmair_guard_patrol_3")

local M = {}


function M.MoveToField(user)
    -- Hemp Necktie Inn (front door)
    local waypoints = {
    position(697, 314, 0)}
    if common.isInList(user.pos,waypoints) then
        aquestionofhonour_3.triggerEvent(user)
        runewick_patrol_3.triggerEvent(user)
        galmair_guard_patrol_3.triggerEvent(user)
    end
    -- Galmair Hall of the Don
    local waypoints = {
    position(348, 229, 0)}
    if common.isInList(user.pos,waypoints) then
        aquestionofhonour_3.triggerEvent(user)
        runewick_patrol_3.triggerEvent(user)
    end
    -- Cadomyr Throne hall
    local waypoints = {
    position(121, 533, 0),
    position(122, 533, 0)}
    if common.isInList(user.pos,waypoints) then
        runewick_patrol_3.triggerEvent(user)
        galmair_guard_patrol_3.triggerEvent(user)
    end
    -- Runewick House of the Archmage
    local waypoints = {
    position(995, 815, 0),
    position(996, 815, 0)}
    if common.isInList(user.pos,waypoints) then
        aquestionofhonour_3.triggerEvent(user)
        galmair_guard_patrol_3.triggerEvent(user)
    end
end

return M

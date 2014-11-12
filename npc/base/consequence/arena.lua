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
local class = require("base.class")
local consequence = require("npc.base.consequence.consequence")
local base_arena = require("base.arena")
local ranklist = require("base.ranklist")
local arena_timer = require("lte.arena_timer")

local _arena_helper_request
local _arena_helper_points
local _arena_helper_list

local arena = class(consequence,
function(self, mode)
    consequence:init(self)
    self["mode"] = mode
    if (mode == "request") then
        self["perform"] = _arena_helper_request
    elseif (mode == "points") then
        self["perform"] = _arena_helper_points
    elseif (mode == "list") then
        self["perform"] = _arena_helper_list
    else
        -- unkonwn comparator
    end
end)

function _arena_helper_request(self, npcChar, player)
	base_arena.requestMonster(player, npcChar)
end

function _arena_helper_points(self, npcChar, player)
    base_arena.getArenastats(player, npcChar)
end

function _arena_helper_list(self, npcChar, player)
	local arena = base_arena.getArena(player, npcChar)
	local town = base_arena.arenaInformation[arena].town
	local arenaListName = "ArenaList"..town
    ranklist.getRanklist(player, arenaListName, true)
end

return arena
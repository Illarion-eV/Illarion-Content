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
require("base.class")
require("npc.base.consequence.consequence")
require("base.arena")
require("lte.arena_timer")

module("npc.base.consequence.arena", package.seeall)

arena = base.class.class(npc.base.consequence.consequence.consequence,
function(self, mode)
    npc.base.consequence.consequence.consequence:init(self);
    self["mode"] = mode;
    if (mode == "request") then
        self["perform"] = _arena_helper_request;
    elseif (mode == "points") then
        self["perform"] = _arena_helper_points;
    elseif (mode == "list") then
        self["perform"] = _arena_helper_list;
    else
        -- unkonwn comparator
    end;
end);

function _arena_helper_request(self, npcChar, player)
	base.arena.requestMonster(player, npcChar);
end;

function _arena_helper_points(self, npcChar, player)
    base.arena.getArenastats(player, npcChar);
end;

function _arena_helper_list(self, npcChar, player)
	local arena = base.arena.getArena(player, npcChar);
	local town = base.arena.arenaInformation[arena].town;
	local arenaListName = "ArenaList"..town;
    base.ranklist.getRanklist(player, arenaListName, true);
end;

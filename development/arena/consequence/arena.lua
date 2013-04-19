require("base.class")
require("npc.base.consequence.consequence")
require("development.arena.base.arena")
require("development.arena.lte.arena")

module("development.arena.consequence.arena", package.seeall)

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
	development.arena.base.arena.requestMonster(player, npcChar);
end;

function _arena_helper_points(self, npcChar, player)
    development.arena.base.arena.getArenastats(player, npcChar);
end;

function _arena_helper_list(self, npcChar, player)
	local arena = development.arena.base.arena.getArena(player, npcChar);
    development.arena.base.arena.getRanklist(player, arena, true);
end;

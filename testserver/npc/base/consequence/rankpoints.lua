require("base.class")
require("base.factions")
require("npc.base.consequence.consequence")

module("npc.base.consequence.rankpoints", package.seeall)

rankpoints = base.class.class(npc.base.consequence.consequence.consequence,
function(self, mode, value)
    npc.base.consequence.consequence.consequence:init(self);
    self["value"], self["valuetype"] = npc.base.talk._set_value(value);
    debug("value: "..value.."mode: "..mode)
    if (mode == "=") then
            self["perform"] = _rankpoints_helper_set;
    elseif (mode == "+") then
            self["perform"] = _rankpoints_helper_add;
    elseif (mode == "-") then
            self["perform"] = _rankpoints_helper_sub;
    else
        -- unkonwn comparator
    end;
end);

function _rankpoints_helper_set(self, npcChar, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
    local rankpoints = base.factions.getRankpoints(player);
    rankpoints = value;
    base.factions.setRankpoints(player,rankpoints);
end;

function _rankpoints_helper_add(self, npcChar, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
	debug("value: "..value)
    local rankpoints = base.factions.getRankpoints(player);
	debug("Old rankpoints: "..rankpoints)
    rankpoints = rankpoints + value;
	debug("New rankpoints: "..rankpoints)
    base.factions.setRankpoints(player,rankpoints);
end;

function _rankpoints_helper_sub(self, npcChar, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
    local rankpoints = base.factions.getRankpoints(player);
    rankpoints = rankpoints - value;
    base.factions.setRankpoints(player,rankpoints);
end;
	
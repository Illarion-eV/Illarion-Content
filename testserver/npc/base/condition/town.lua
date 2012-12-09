require("base.class")
require("base.factions")
require("npc.base.condition.condition")

module("npc.base.condition.town", package.seeall)

town = base.class.class(npc.base.condition.condition.condition,
function(self, comp ,value)
    npc.base.condition.condition.condition:init(self);
    self["value"] = tonumber(value);
	if (comp == "<>" or comp == "!=" or comp == "~=") then
		self["check"] = _town_helper_notequal;
	else
		self["check"] = _town_helper_equal;
	end;
end);

function _town_helper_equal(self, npcChar, player)
    player:inform("Town: "..base.factions.getFaction(player).tid)
    player:inform("Value-Town: "..self.value)
    return (base.factions.getFaction(player).tid == self.value);
end;

function _town_helper_notequal(self, npcChar, player)
    return (base.factions.getFaction(player).tid ~= self.value);
end;

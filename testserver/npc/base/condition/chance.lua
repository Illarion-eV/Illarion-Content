require("base.class")
require("npc.base.condition.condition")

module("npc.base.condition.chance", package.seeall)

chance = base.class.class(npc.base.condition.condition.condition,
function(self, value)
    npc.base.condition.condition.condition:init(self);
    self["value"] = math.min(100, math.max(0, value + 1 - 1));
    self["check"] = _chance_helper_equal;
end);

function _chance_helper_equal(self, npcChar, player)
    return (math.random(100) < self.value);
end;

require("base.class")
require("npc.base.condition.condition")

module("npc.base.condition.race", package.seeall)

race = base.class.class(npc.base.condition.condition.condition,
function(self, value)
    npc.base.condition.condition.condition:init(self);
    self["value"] = tonumber(value);
    self["check"] = _race_helper_equal;
end);

function _race_helper_equal(self, npcChar, player)
    return (player:getRace() == self.value);
end;

require("base.class")
require("npc.base.condition.condition")

module("npc.base.condition.sex", package.seeall)

sex = base.class.class(npc.base.condition.condition.condition,
function(self, value)
    npc.base.condition.condition.condition:init(self);
    if (value == "male" or value == 0) then
        self["value"] = 0;
    else
        self["value"] = 1;
    end;
    self["check"] = _sex_helper_equal;
end);

function _sex_helper_equal(self, npcChar, player)
    return (player:increaseAttrib("sex", 0) == self.value);
end;

require("base.class")
require("npc.base.condition.condition")

module("npc.base.condition.rune", package.seeall)

rune = base.class.class(npc.base.condition.condition.condition,
function(self, value)
    npc.base.condition.condition.condition:init(self);
    
    self["value"] = 2 ^ (value - 1);
    self["check"] = _rune_helper;
end);

function _rune_helper(self, npcChar, player)
    local magicType = player:getMagicType();
    local magicFlags = player:getMagicFlags(magicType);
    return (LuaAnd(magicFlags, self.value) ~= 0);
end;

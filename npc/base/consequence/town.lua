require("base.class")
require("npc.base.consequence.consequence")

module("npc.base.consequence.town", package.seeall)

town = base.class.class(npc.base.consequence.consequence.consequence,
function(self, mode, value)
    npc.base.consequence.consequence.consequence:init(self);
    self["value"], self["valuetype"] = npc.base.talk._set_value(value);
    if (mode == "=") then
        self["perform"] = _town_helper_set;
    else
        -- unkonwn comparator
    end;
end);

function _town_helper_set(self, npcChar, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);	
	local factionValues = base.factions.get_Faction(player);
	base.factions.makeCharMemberOfTown(player,factionValues,1, value);
end;
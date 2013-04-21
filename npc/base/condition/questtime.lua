require("base.class")
require("npc.base.repeatable_quests")
require("npc.base.condition.condition")

module("npc.base.condition.questtime", package.seeall)

questtime = base.class.class(npc.base.condition.condition.condition,
function(self, comp, quest, month, day, hour)
	npc.base.condition.condition.condition:init(self);
    self["month"], self["valuetype"] = npc.base.talk._set_value(month);
    self["day"], self["valuetype"] = npc.base.talk._set_value(day);
    self["hour"], self["valuetype"] = npc.base.talk._set_value(hour);
    self["quest"], self["valuetype"] = npc.base.talk._set_value(quest);
    
	if (comp == ">") then
        self["check"] = _questtime_helper_greater;
    elseif (comp == "<") then
        self["check"] = _questtime_helper_lesser;
    else
        -- unkonwn comparator
    end;
end);

function _questtime_helper_greater(self, npcChar, texttype, player)
    local month = npc.base.talk._get_value(self.npc, self.month, self.valuetype);
    local day = npc.base.talk._get_value(self.npc, self.day, self.valuetype);
	local hour = npc.base.talk._get_value(self.npc, self.hour, self.valuetype);
	local quest = npc.base.talk._get_value(self.npc, self.quest, self.valuetype);
    
	return npc.base.checkIfTimesExpired(player, quest, month, day, hour);
end;

function _questtime_helper_lesser(self, npcChar, texttype, player)
    local month = npc.base.talk._get_value(self.npc, self.month, self.valuetype);
    local day = npc.base.talk._get_value(self.npc, self.day, self.valuetype);
	local hour = npc.base.talk._get_value(self.npc, self.hour, self.valuetype);
	local quest = npc.base.talk._get_value(self.npc, self.quest, self.valuetype);
	
    return not npc.base.checkIfTimesExpired(player, quest, month, day, hour); 
end;
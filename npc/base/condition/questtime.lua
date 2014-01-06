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
    
	return npc.base.repeatable_quests.checkIfTimesExpired(player, quest, month, day, hour);
end;

function _questtime_helper_lesser(self, npcChar, texttype, player)
    local month = npc.base.talk._get_value(self.npc, self.month, self.valuetype);
    local day = npc.base.talk._get_value(self.npc, self.day, self.valuetype);
	local hour = npc.base.talk._get_value(self.npc, self.hour, self.valuetype);
	local quest = npc.base.talk._get_value(self.npc, self.quest, self.valuetype);
	
    return not npc.base.repeatable_quests.checkIfTimesExpired(player, quest, month, day, hour); 
end;
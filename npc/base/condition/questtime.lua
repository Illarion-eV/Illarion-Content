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
local class = require("base.class")
local repeatable_quests = require("npc.base.repeatable_quests")
local condition = require("npc.base.condition.condition")
local tools = require("npc.base.tools")

local _questtime_helper_greater
local _questtime_helper_lesser

local questtime = class(condition,
function(self, comp, quest, month, day, hour)
	condition:init(self)
    self["month"], self["monthtype"] = tools.set_value(month)
    self["day"], self["daytype"] = tools.set_value(day)
    self["hour"], self["hourtype"] = tools.set_value(hour)
    self["quest"] = quest
    
	if (comp == ">") then
        self["check"] = _questtime_helper_greater
    elseif (comp == "<") then
        self["check"] = _questtime_helper_lesser
    else
        -- unkonwn comparator
    end
end)

function _questtime_helper_greater(self, npcChar, texttype, player)
    local month = tools.get_value(self.npc, self.month, self.monthtype)
    local day = tools.get_value(self.npc, self.day, self.daytype)
	local hour = tools.get_value(self.npc, self.hour, self.hourtype)
	local quest = self.quest
    
	return repeatable_quests.checkIfTimesExpired(player, quest, month, day, hour)
end

function _questtime_helper_lesser(self, npcChar, texttype, player)
    local month = tools.get_value(self.npc, self.month, self.monthtype)
    local day = tools.get_value(self.npc, self.day, self.daytype)
	local hour = tools.get_value(self.npc, self.hour, self.hourtype)
	local quest = self.quest
	
    return not repeatable_quests.checkIfTimesExpired(player, quest, month, day, hour) 
end

return questtime
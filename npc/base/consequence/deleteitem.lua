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
local consequence = require("npc.base.consequence.consequence")
local tools = require("npc.base.tools")

local _deleteitem_helper
local _deleteitem_data_helper

local deleteitem = class(consequence,
function(self, id, count, data)
    consequence:init(self)
    
    self["id"] = tonumber(id)
    
    if (count == "all") then
        count = 0
    end
    
    self["count"], self["counttype"] = tools.set_value(count)
	
	if (data == nil) then
		self["perform"] = _deleteitem_helper
	else
		self["data"] = data
		self["perform"]  = _deleteitem_data_helper
	end
end)

function _deleteitem_helper(self, npcChar, player)
    local count = tools.get_value(self.npc, self.count, self.counttype)
    
    if (count == 0) then
        count = player:countItemAt("all", self.id)
    end
    
    player:eraseItem(self.id, count) 
end

function _deleteitem_data_helper(self, npcChar, player)
    local count = tools.get_value(self.npc, self.count, self.counttype)
    
    if (count == 0) then
        count = player:countItemAt("all", self.id, self.data)
    end
    
    player:eraseItem(self.id, count, self.data) 
end

return deleteitem
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

local _item_helper

local item = class(consequence,
function(self, id, count, quality, data)
    consequence:init(self)
    
    self["id"] = tonumber(id)
    self["count"], self["counttype"] = tools.set_value(count)
    self["quality"], self["qualitytype"] = tools.set_value(quality)
    self["data"] = data
    self["perform"] = _item_helper
end)

function _item_helper(self, npcChar, player)
    local count = tools.get_value(self.npc, self.count, self.counttype)
    local quality = tools.get_value(self.npc, self.quality, self.qualitytype)
    local data = self.data
    
    local notcreated = player:createItem(self.id, count, quality, data)
    
    if (notcreated > 0) then
        world:createItemFromId(self.id, notcreated, player.pos, true, quality, data)
    end 
end

return item
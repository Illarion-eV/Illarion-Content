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
local base_money = require("base.money")
local talk = require("npc.base.talk")
local consequence = require("npc.base.consequence.consequence")

module("npc.base.consequence.money", package.seeall)

money = class.class(consequence.consequence,
function(self, mode, value)
    consequence.consequence:init(self);
    self["value"], self["valuetype"] = talk._set_value(value);
    if (mode == "+") then
        self["perform"] = _money_helper_add;
    elseif (mode == "-") then
        self["perform"] = _money_helper_sub;
    else
        -- unkonwn comparator
    end;
end);

function _money_helper_add(self, npcChar, player)
    local value = talk._get_value(self.npc, self.value, self.valuetype);
    if not base_money.GiveMoneyToChar(player, value) then
		base_money.GiveMoneyToPosition(player.pos, value);
	end
end;

function _money_helper_sub(self, npcChar, player)
    local value = talk._get_value(self.npc, self.value, self.valuetype);
    base_money.TakeMoneyFromChar(player, value);
end;

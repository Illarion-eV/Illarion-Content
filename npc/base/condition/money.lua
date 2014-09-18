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
local condition = require("npc.base.condition.condition")

module("npc.base.condition.money", package.seeall)

money = class.class(condition.condition,
function(self, comp, value)
    condition.condition:init(self);
    self["value"], self["valuetype"] = talk._set_value(value);
    if (comp == ">=" or comp == "=>") then
        self["check"] = _money_helper_greaterequal;
    elseif (comp == ">") then
        self["check"] = _money_helper_greater;
    elseif (comp == "<") then
        self["check"] = _money_helper_lesser;
    else
        -- unkonwn comparator
    end;
end);

function _money_helper_greaterequal(self, npcChar, texttype, player)
    local value = talk._get_value(self.npc, self.value, self.valuetype);
    return base_money.CharHasMoney(player, value);
end;

function _money_helper_greater(self, npcChar, texttype, player)
    local value = talk._get_value(self.npc, self.value, self.valuetype);
    return base_money.CharHasMoney(player, value + 1);
end;

function _money_helper_lesser(self, npcChar, texttype, player)
    local value = talk._get_value(self.npc, self.value, self.valuetype);
    return not base_money.CharHasMoney(player, value);
end;

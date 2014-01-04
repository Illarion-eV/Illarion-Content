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
require("base.money")
require("npc.base.condition.condition")

module("npc.base.condition.money", package.seeall)

money = base.class.class(npc.base.condition.condition.condition,
function(self, comp, value)
    npc.base.condition.condition.condition:init(self);
    self["value"], self["valuetype"] = npc.base.talk._set_value(value);
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
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
    return base.money.CharHasMoney(player, value);
end;

function _money_helper_greater(self, npcChar, texttype, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
    return base.money.CharHasMoney(player, value + 1);
end;

function _money_helper_lesser(self, npcChar, texttype, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
    return not base.money.CharHasMoney(player, value);
end;

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
local condition = require("npc.base.condition.condition")

module("npc.base.condition.magictype", package.seeall)

magictype = class.class(condition.condition,
function(self, value)
    condition.condition:init(self);
    if (value == "nomagic") then
        self["check"] = _magictype_helper_none;
    elseif (value == "mage") then
        self["check"] = _magictype_helper_mage;
    elseif (value == "priest") then
        self["check"] = _magictype_helper_priest;
    elseif (value == "bard") then
        self["check"] = _magictype_helper_bard;
    elseif (value == "druid") then
        self["check"] = _magictype_helper_druid;
    end;
end);

function _magictype_helper_none(self, npcChar, texttype, player)
    return (player:getMagicFlags(player:getMagicType()) == 0)
end;

function _magictype_helper_mage(self, npcChar, texttype, player)
    return _test_magictype(player, 0)
end;

function _magictype_helper_priest(self, npcChar, texttype, player)
    return _test_magictype(player, 1)
end;

function _magictype_helper_bard(self, npcChar, texttype, player)
    return _test_magictype(player, 2)
end;

function _magictype_helper_druid(self, npcChar, texttype, player)
    return _test_magictype(player, 3)
end;

function _test_magictype(player, magicType)
    local playerMagicType = player:getMagicType();
    if (playerMagicType ~= magicType) then
        return false;
    end;
	
	return player:getMagicFlags(magicType) > 0;
end;
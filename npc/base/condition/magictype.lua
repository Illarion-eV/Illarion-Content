require("base.class")
require("npc.base.condition.condition")

module("npc.base.condition.magictype", package.seeall)

magictype = base.class.class(npc.base.condition.condition.condition,
function(self, value)
    npc.base.condition.condition.condition:init(self);
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

function _magictype_helper_none(self, npcChar, player)
    return (player:getMagicFlags(player:getMagicType()) == 0)
end;

function _magictype_helper_mage(self, npcChar, player)
    return _test_magictype(player, 0)
end;

function _magictype_helper_priest(self, npcChar, player)
    return _test_magictype(player, 1)
end;

function _magictype_helper_bard(self, npcChar, player)
    return _test_magictype(player, 2)
end;

function _magictype_helper_druid(self, npcChar, player)
    return _test_magictype(player, 3)
end;

function _test_magictype(player, magicType)
    local playerMagicType = player:getMagicType();
    if (playerMagicType ~= magicType) then
        return false;
    end;
	
	return player:getMagicFlags(magicType) > 0;
end;
require("base.class")
require("npc.base.condition.condition")

module("npc.base.condition.item", package.seeall)

item = base.class.class(npc.base.condition.condition.condition,
function(self, itemId, itemLoc, comp, value)
    npc.base.condition.condition.condition:init(self);
    self["item"] = itemId;
    if (itemLoc == "all" or itemLoc == "belt" or itemLoc == "body"
        or itemLoc == "backpack") then
        self["location"] = itemLoc;
    else
        self["location"] = "all";
    end;
    self["value"], self["valuetype"] = npc.base.talk._set_value(value);
    
    if (comp == "=") then
        self["check"] = _item_helper_equal;
    elseif (comp == "<>" or comp == "!=" or comp == "~=") then
        self["check"] = _item_helper_notequal;
    elseif (comp == "<=" or comp == "=<") then
        self["check"] = _item_helper_lesserequal;
    elseif (comp == ">=" or comp == "=>") then
        self["check"] = _item_helper_greaterequal;
    elseif (comp == ">") then
        self["check"] = _item_helper_greater;
    elseif (comp == "<") then
        self["check"] = _item_helper_lesser;
    else
        -- unkonwn comparator
    end;
end);

function _item_helper_equal(self, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
    return player:countItemAt(self.location, self.item) == value;
end;

function _item_helper_notequal(self, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
    return player:countItemAt(self.location, self.item) ~= value;
end;

function _item_helper_lesserequal(self, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
    return player:countItemAt(self.location, self.item) <= value;
end;

function _item_helper_greaterequal(self, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
    return player:countItemAt(self.location, self.item) >= value;
end;

function _item_helper_lesser(self, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
    return player:countItemAt(self.location, self.item) < value;
end;

function _item_helper_greater(self, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
    return player:countItemAt(self.location, self.item) > value;
end;
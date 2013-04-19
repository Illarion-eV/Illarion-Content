require("base.class")
require("npc.base.condition.condition")

module("npc.base.condition.item", package.seeall)

item = base.class.class(npc.base.condition.condition.condition,
function(self, itemId, itemLoc, comp, value, data)
    npc.base.condition.condition.condition:init(self);
    self["item"] = itemId;
    if (itemLoc == "all" or itemLoc == "belt" or itemLoc == "body"
        or itemLoc == "backpack") then
        self["location"] = itemLoc;
    else
        self["location"] = "all";
    end;
    self["value"], self["valuetype"] = npc.base.talk._set_value(value);
    
    if (data == nil) then
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
    else
        self["data"] = data;
        if (comp == "=") then
            self["check"] = _item_helper_equal_data;
        elseif (comp == "<>" or comp == "!=" or comp == "~=") then
            self["check"] = _item_helper_notequal_data;
        elseif (comp == "<=" or comp == "=<") then
            self["check"] = _item_helper_lesserequal_data;
        elseif (comp == ">=" or comp == "=>") then
            self["check"] = _item_helper_greaterequal_data;
        elseif (comp == ">") then
            self["check"] = _item_helper_greater_data;
        elseif (comp == "<") then
            self["check"] = _item_helper_lesser_data;
        else
            -- unkonwn comparator
        end;
    end;
end);

function _item_helper_equal(self, npcChar, texttype, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
    return player:countItemAt(self.location, self.item) == value;
end;

function _item_helper_notequal(self, npcChar, texttype, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
    return player:countItemAt(self.location, self.item) ~= value;
end;

function _item_helper_lesserequal(self, npcChar, texttype, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
    return player:countItemAt(self.location, self.item) <= value;
end;

function _item_helper_greaterequal(self, npcChar, texttype, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
    return player:countItemAt(self.location, self.item) >= value;
end;

function _item_helper_lesser(self, npcChar, texttype, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
    return player:countItemAt(self.location, self.item) < value;
end;

function _item_helper_greater(self, npcChar, texttype, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
    return player:countItemAt(self.location, self.item) > value;
end;

function _item_helper_equal_data(self, npcChar, texttype, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
    return player:countItemAt(self.location, self.item, self.data) == value;
end;

function _item_helper_notequal_data(self, npcChar, texttype, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
    return player:countItemAt(self.location, self.item, self.data) ~= value;
end;

function _item_helper_lesserequal_data(self, npcChar, texttype, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
    return player:countItemAt(self.location, self.item, self.data) <= value;
end;

function _item_helper_greaterequal_data(self, npcChar, texttype, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
    return player:countItemAt(self.location, self.item, self.data) >= value;
end;

function _item_helper_lesser_data(self, npcChar, texttype, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
    return player:countItemAt(self.location, self.item, self.data) < value;
end;

function _item_helper_greater_data(self, npcChar, texttype, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
    return player:countItemAt(self.location, self.item, self.data) > value;
end;

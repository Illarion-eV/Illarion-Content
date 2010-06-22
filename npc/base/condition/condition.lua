require("base.class")

module("npc.base.condition.condition", package.seeall)

--- Basic class for all conditions. Its never needed to create this class in any
--  NPC since this is just a collection of methods the actual condition classes
--  share.
condition = class(function(self)
end);

function condition:setNPC(npc)
    self["npc"] = npc;
    self["check"] = _condition_helper_empty;
end;

function _condition_helper_empty(self, player)
    -- by default nothing is done
end;

function _set_value(value)
    if (type(value) == "function") then
        return value, 2;
    elseif (value == "%NUMBER") then
        return nil, 1;
    else
        return tonumber(value), 0;
    end;
end;

function _get_value(npc, value, type)
    if (type == 2) then
        return value(npc._saidNumber);
    elseif (type == 1) then
        return npc._saidNumber;
    elseif (type == 0) then
        return value;
    else
        return 0;
    end;
end;
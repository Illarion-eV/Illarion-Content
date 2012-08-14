require("base.class")
require("base.factions")
require("npc.base.consequence.consequence")

module("npc.base.consequence.rankpoints", package.seeall)

rankpoints = base.class.class(npc.base.consequence.consequence.consequence,
function(self, faction, mode, value)
    npc.base.consequence.consequence.consequence:init(self);
    self["value"], self["valuetype"] = npc.base.talk._set_value(value);
    
    if (faction == 1) then -- Cadomyr
        if (mode == "=") then
            self["perform"] = _rankpoints_helper_cadomyr_set;
        elseif (mode == "+") then
            self["perform"] = _rankpoints_helper_cadomyr_add;
        elseif (mode == "-") then
            self["perform"] = _rankpoints_helper_cadomyr_sub;
        else
            -- unkonwn comparator
        end;
    elseif (faction == 2) then -- Runewick
        if (mode == "=") then
            self["perform"] = _rankpoints_helper_runewick_set;
        elseif (mode == "+") then
            self["perform"] = _rankpoints_helper_runewick_add;
        elseif (mode == "-") then
            self["perform"] = _rankpoints_helper_runewick_sub;
        else
            -- unkonwn comparator
        end;
    elseif (faction == 3) then -- Galmair
        if (mode == "=") then
            self["perform"] = _rankpoints_helper_galmair_set;
        elseif (mode == "+") then
            self["perform"] = _rankpoints_helper_galmair_add;
        elseif (mode == "-") then
            self["perform"] = _rankpoints_helper_galmair_sub;
        else
            -- unkonwn comparator
        end;
    end;
end);

function _rankpoints_helper_cadomyr_set(self, npcChar, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
    local rankpoints = base.factions.get_Rankpoints(player);
    rankpoints.rankpointsC = value;
    base.factions.put_Rankpoints(player,rankpoints);
end;

function _rankpoints_helper_cadomyr_add(self, npcChar, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
    local rankpoints = base.factions.get_Rankpoints(player);
    rankpoints.rankpointsC = rankpoints.rankpointsC + value;
    base.factions.put_Rankpoints(player,rankpoints);
end;

function _rankpoints_helper_cadomyr_sub(self, npcChar, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
    local rankpoints = base.factions.get_Rankpoints(player);
    rankpoints.rankpointsC = rankpoints.rankpointsC - value;
    base.factions.put_Rankpoints(player,rankpoints);
end;

function _rankpoints_helper_runewick_set(self, npcChar, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
    local rankpoints = base.factions.get_Rankpoints(player);
    rankpoints.rankpointsR = value;
    base.factions.put_Rankpoints(player,rankpoints);
end;

function _rankpoints_helper_runewick_add(self, npcChar, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
    local rankpoints = base.factions.get_Rankpoints(player);
    rankpoints.rankpointsR = rankpoints.rankpointsR + value;
    base.factions.put_Rankpoints(player,rankpoints);
end;

function _rankpoints_helper_runewick_sub(self, npcChar, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
    local rankpoints = base.factions.get_Rankpoints(player);
    rankpoints.rankpointsR = rankpoints.rankpointsR - value;
    base.factions.put_Rankpoints(player,rankpoints);
end;

function _rankpoints_helper_galmair_set(self, npcChar, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
    local rankpoints = base.factions.get_Rankpoints(player);
    rankpoints.rankpointsG = value;
    base.factions.put_Rankpoints(player,rankpoints);
end;

function _rankpoints_helper_galmair_add(self, npcChar, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
    local rankpoints = base.factions.get_Rankpoints(player);
    rankpoints.rankpointsG = rankpoints.rankpointsG + value;
    base.factions.put_Rankpoints(player,rankpoints);
end;

function _rankpoints_helper_galmair_sub(self, npcChar, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
    local rankpoints = base.factions.get_Rankpoints(player);
    rankpoints.rankpointsG = rankpoints.rankpointsG - value;
    base.factions.put_Rankpoints(player,rankpoints);
end;

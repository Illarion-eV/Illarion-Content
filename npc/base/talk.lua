--- Base NPC script for talking NPCs
--
-- This script offers all functions needed to get NPCs to talk.
--
-- Author: Martin Karing

require("base.common")
require("base.messages")
require("base.class")
require("npc.base.basic")

module("npc.base.talk", package.seeall)

talkNPC = class(function(self, rootNPC)
    if (rootNPC == nil or not rootNPC:is_a(npc.base.basic.baseNPC)) then
        return;
    end;
    self["_parent"] = rootNPC;
    
    self["_entry"] = nil;
    self["_cycleText"] = nil;
    
    self["_state"] = 0;
    self["_quest"] = 0;
end);

function talkNPC:addCycleText(germanText, englishText)
    if (self._cycleText == nil) then
        self._cycleText = base.messages.Messages();
    end;
    
    self._cycleText:addMessage(germanText, englishText);
end;

function talkNPC:addTalkingEntry(newEntry)
    if (newEntry == nil or not newEntry:is_a(talkNPCEntry)) then
        return;
    end;
    
    if (self._entry == nil) then
        self._parent:addRecvText(self);
        self._entry = {};
    end;
    
    table.insert(self._entry, newEntry);
end;

function talkNPC:receiveText(player, text)
    for _, entry in pairs(self._entry) do
        if entry:checkEntry(player, text) then
            -- execute consequences
            return true;
        end;
    end;
    
    return false;
end;

function talkNPC:setQuestID(newID)
    if (newID == nil) then
        return
    end;
    newID = newID + 1 - 1;
    
    if (newID <= 0) then
        return;
    end;
    
    self._quest = newID;
end;

talkNPCEntry = class(function(self)
    self["_trigger"] = {};
    self["_conditions"] = {};
    
    self["_responses"] = {};
    self["_consequences"] = {};
end);

function talkNPCEntry:addTrigger(text)
    if (text == nil or type(text) ~= "string") then
        return;
    end;
    table.insert(self._trigger, text);
end;

function talkNPCEntry:addCondition(condition)
    if (condition == nil or not condition:is_a(base.conditions.condition)) then
        return;
    end;
    
    condition:setNPC(self)
    table.insert(self._conditions, condition);
end;

function talkNPCEntry:addResponse(text)
    if (text == nil or type(text) ~= "string") then
        return;
    end;
    table.insert(self._responses, text);
end;

function talkNPCEntry:addConsequences(consequence)
    table.insert(self._consequences, consequence);
end;

function talkNPCEntry:checkEntry(player, text)
    for _, pattern in pairs(self._trigger) do
        local a = string.find(text, pattern);
        if a then
            local conditionsResult = true;
            for _, condition in pairs(self._conditions) do
                if not condition.check(player) then
                    conditionResult = false;
                    break;
                end;
            end;
            
            if conditionResult then
                return true;
            end;
        end;
    end;
end;
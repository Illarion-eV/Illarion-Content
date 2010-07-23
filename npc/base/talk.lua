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

talkNPC = base.class.class(function(self, rootNPC)
    if (rootNPC == nil or not rootNPC:is_a(npc.base.basic.baseNPC)) then
        return;
    end;
    self["_parent"] = rootNPC;
    
    self["_entry"] = nil;
    self["_cycleText"] = nil;
    
    self["_state"] = 0;
    self["_quest"] = 0;
    self["_saidNumber"] = nil;
    
    self["_nextCycleText"] = -1;
end);

function talkNPC:addCycleText(germanText, englishText)
    if (self._cycleText == nil) then
        self._cycleText = base.messages.Messages();
        self._parent:addCycle(self);
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
    player:inform("Recv Text");
    for _, entry in pairs(self._entry) do
        if entry:checkEntry(player, text) then
            entry:execute(player);
            return true;
        end;
    end;
    
    return false;
end;

function talkNPC:nextCycle(counter)
    if (counter >= self._nextCycleText) then
        self._nextCycleText = math.random(900, 3000);
        local german, english = self._cycleText:getRandomMessage();
        thisNPC:talkLanguage(CCharacter.say, CPlayer.german, german);
        thisNPC:talkLanguage(CCharacter.say, CPlayer.english, english);
    else
        self._nextCycleText = self._nextCycleText - counter;
    end;
    
    return self._nextCycleText;
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

talkNPCEntry = base.class.class(function(self)
    self["_trigger"] = {};
    self["_conditions"] = {};
    
    self["_responses"] = {};
    self["_responsesCount"] = 0;
    self["_consequences"] = {};
end);

function talkNPCEntry:addTrigger(text)
    if (text == nil or type(text) ~= "string") then
        return;
    end;
    text = string.gsub(text, "%%NUMBER", "(%d+)");
    table.insert(self._trigger, text);
end;

function talkNPCEntry:addCondition(condition)
    if (condition == nil or not condition:is_a(npc.base.condition.condition.condition)) then
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
    self._responsesCount = self._responsesCount + 1;
end;

function talkNPCEntry:addConsequence(consequence)
    if (consequence == nil or not consequence:is_a(npc.base.consequence.consequence.consequence)) then
        return;
    end;
    
    consequence:setNPC(self)
    table.insert(self._consequences, consequence);
end;

function talkNPCEntry:checkEntry(player, text)
    for _1, pattern in pairs(self._trigger) do
        local a, _2, number = string.find(text, pattern);
        self._saidNumber = number;
        if (a ~= nil) then
            player:inform("Pattern ok");
            local conditionsResult = true;
            for _3, condition in pairs(self._conditions) do
                player:inform("Checking Condition");
                if not condition:check(player) then
                    conditionResult = false;
                    break;
                end;
            end;
            
            if conditionsResult then
                return true;
            end;
        end;
    end;
end;

function talkNPCEntry:execute(player)
    if (self._responsesCount > 0) then
        local selectedResponse = math.random(1, self._responsesCount);
        thisNPC:talk(CCharacter.say, self._responses[selectedResponse]);
    end;
    
    for _, consequence in pairs(self._consequences) do
        consequence:perform(player);
    end;
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
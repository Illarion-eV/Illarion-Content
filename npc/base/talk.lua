--- Base NPC script for talking NPCs
--
-- This script offers all functions needed to get NPCs to talk.
--
-- Author: Martin Karing

require("base.common")
require("base.messages")
require("base.class")
require("npc.base.basic")
require("npc.base.responses")

module("npc.base.talk", package.seeall)

talkNPC = base.class.class(function(self, rootNPC)
    if (rootNPC == nil or not rootNPC:is_a(npc.base.basic.baseNPC)) then
        return;
    end;
    self["_parent"] = rootNPC;
    
    self["_entry"] = nil;
    self["_cycleText"] = nil;
    
    self["_state"] = 0;
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
    
	newEntry:setParent(self);
    table.insert(self._entry, newEntry);
end;

function talkNPC:receiveText(npcChar, player, text)
	local result = false;
	
	table.foreach(self._entry, function(_, entry)
        if entry:checkEntry(npcChar, player, text) then
            entry:execute(npcChar, player);
			result = true;
            return true;
        end;
    end);
    
    return result;
end;

function talkNPC:nextCycle(npcChar, counter)
    if (counter >= self._nextCycleText) then
	    self._nextCycleText = math.random(1200, 3600); --2 to 6 minutes
        local german, english = self._cycleText:getRandomMessage();
        npcChar:talkLanguage(Character.say, Player.german, german);
        npcChar:talkLanguage(Character.say, Player.english, english);
    else
        self._nextCycleText = self._nextCycleText - counter;
    end;
    
    return self._nextCycleText;
end;

talkNPCEntry = base.class.class(function(self)
    self["_trigger"] = {};
    self["_conditions"] = {};
    
    self["_responses"] = {};
	self["_responseProcessors"] = {};
    self["_responsesCount"] = 0;
    self["_consequences"] = {};
	self["_parent"] = nil;
end);

function talkNPCEntry:addTrigger(text)
    if (text == nil or type(text) ~= "string") then
        return;
    end;
    text = string.lower(text);
    text = string.gsub(text,'([ ]+)',' .*'); -- replace all spaces by " .*"
    table.insert(self._trigger, text);
end;

function talkNPCEntry:setParent(npc)
	local updateFkt = function(_, value)
		value:setNPC(npc);
	end;
	
	table.foreach(self._conditions, updateFkt);
	table.foreach(self._consequences, updateFkt);
	
	self._parent = npc;
end;

function talkNPCEntry:addCondition(condition)
    if (condition == nil or not condition:is_a(npc.base.condition.condition.condition)) then
        return;
    end;
	
    table.insert(self._conditions, condition);
	if (self._parent ~= nil) then
		condition:setNPC(self._parent);
	end;
end;

function talkNPCEntry:addResponse(text)
    if (text == nil or type(text) ~= "string") then
        return;
    end;
    table.insert(self._responses, text);
	
	local processorFkt = function(_, processor)
		if processor:check(text) then
			if (self._responseProcessors[self._responsesCount] == nil) then
				self._responseProcessors[self._responsesCount] = {};
			end;
			debug("Processor found for response: " .. text);
			table.insert(self._responseProcessors[self._responsesCount], processor)
		end;
	end;
	
	table.foreach(npc.base.responses.processorList, processorFkt);
	
    self._responsesCount = self._responsesCount + 1;
end;

function talkNPCEntry:addConsequence(consequence)
    if (consequence == nil or not consequence:is_a(npc.base.consequence.consequence.consequence)) then
        return;
    end;
	
    table.insert(self._consequences, consequence);
	if (self._parent ~= nil) then
		consequence:setNPC(self._parent);
	end;
end;

function talkNPCEntry:checkEntry(npcChar, player, text)
    for _1, pattern in pairs(self._trigger) do
        local a, _2, number = string.find(text, pattern);
        self._saidNumber = number;
        if (a ~= nil) then
            local conditionsResult = true;
            for _3, condition in pairs(self._conditions) do
                if not condition:check(npcChar, player) then
                    conditionsResult = false;
                    break;
                end;
            end;
            
            if conditionsResult then
                return true;
            end;
        end;
    end;
end;

function talkNPCEntry:execute(npcChar, player)
    if (self._responsesCount > 0) then
        local selectedResponse = math.random(1, self._responsesCount);
		
		local responseText = self._responses[selectedResponse];
		local responseProcessors = self._responseProcessors[selectedResponse];
		
		if (responseProcessors ~= nil) then
			for _, processor in pairs(responseProcessors) do
				responseText = processor:process(player, self._parent, npcChar, responseText);
				 debug("Processing!");
			end;
		else
			debug("No response processors");
		end;
    	
		npcChar:talk(Character.say, responseText);
    end;
    
	table.foreach(self._consequences, function(_, consequence)
		if consequence then
			consequence:perform(npcChar, player);
		end;
	end);
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

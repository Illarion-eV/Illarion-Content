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
--- Base NPC script for talking NPCs
--
-- This script offers all functions needed to get NPCs to talk.
--
-- Author: Martin Karing
local messages = require("base.messages")
local class = require("base.class")
local baseNPC = require("npc.base.basic")
local processorList = require("npc.base.responses")
local tools = require("npc.base.tools")
local consequence = require("npc.base.consequence.consequence")
local condition = require("npc.base.condition.condition")

local talkNPC = class(function(self, rootNPC)
    if rootNPC == nil or not rootNPC:is_a(baseNPC) then
        return
    end
    self["_parent"] = rootNPC

    self["_entry"] = nil
    self["_cycleText"] = nil

    self["_state"] = 0
    self["_saidNumber"] = nil

    self["_nextCycleText"] = -1
end)

local talkNPCEntry = class(function(self)
    self["_trigger"] = {}
    self["_conditions"] = {}

    self["_responses"] = {}
    self["_responseProcessors"] = {}
    self["_responsesCount"] = 0
    self["_consequences"] = {}
    self["_parent"] = nil
end)

function talkNPC:addCycleText(germanText, englishText)
    if (self._cycleText == nil) then
        self._cycleText = messages.Messages()
        self._parent:addCycle(self)
    end

    self._cycleText:addMessage(germanText, englishText)
end

function talkNPC:addTalkingEntry(newEntry)
    if (newEntry == nil or not newEntry:is_a(talkNPCEntry)) then
        return
    end

    if (self._entry == nil) then
        self._parent:addRecvText(self)
        self._entry = {}
    end

    newEntry:setParent(self)
    table.insert(self._entry, newEntry)
end

function talkNPC:receiveText(npcChar, texttype, player, text)
    for _, entry in pairs(self._entry) do
        if entry:checkEntry(npcChar, texttype, player, text) then
            entry:execute(npcChar, player)
            return true
        end
    end

    return false
end

function talkNPC:nextCycle(npcChar, counter)
    local seenNPCs = world:getNPCSInRangeOf(npcChar.pos,15)
    local seenPlayers =  world:getPlayersInRangeOf(npcChar.pos,15)
    if (counter >= self._nextCycleText) then
        self._nextCycleText = math.random(3000, 6000) * math.max(1, (#seenNPCs)/2 + #seenPlayers -1) --5 to 10 minutes times NPCs+players around
        local german, english = self._cycleText:getRandomMessage()
        local textTypeDe, textDe = tools.get_text_and_talktype(german)
        local _, textEn = tools.get_text_and_talktype(english)
        npcChar:talk(textTypeDe, textDe, textEn)
    else
        self._nextCycleText = self._nextCycleText - counter
    end

    return self._nextCycleText
end

function talkNPCEntry:addTrigger(text)
    if text == nil or type(text) ~= "string" then
        return
    end
    text = string.lower(text)
    text = string.gsub(text,'([ ]+)',' .*') -- replace all spaces by " .*"
    table.insert(self._trigger, text)
end

function talkNPCEntry:setParent(npc)
    for _, value in pairs(self._conditions) do
        value:setNPC(npc)
    end
    for _, value in pairs(self._consequences) do
        value:setNPC(npc)
    end

    self._parent = npc
end

function talkNPCEntry:addCondition(c)
    if c == nil or not c:is_a(condition) then
        return
    end

    table.insert(self._conditions, c)
    if (self._parent ~= nil) then
        c:setNPC(self._parent)
    end
end

function talkNPCEntry:addResponse(text)
    if text == nil or type(text) ~= "string" then
        return
    end
    table.insert(self._responses, text)

    self._responsesCount = self._responsesCount + 1

    for _, processor in pairs(processorList) do
        if processor:check(text) then
            if (self._responseProcessors[self._responsesCount] == nil) then
                self._responseProcessors[self._responsesCount] = {}
            end
            table.insert(self._responseProcessors[self._responsesCount], processor)
        end
    end
end

function talkNPCEntry:addConsequence(c)
    if c == nil or not c:is_a(consequence) then
        return
    end

    table.insert(self._consequences, c)
    if (self._parent ~= nil) then
        c:setNPC(self._parent)
    end
end

function talkNPCEntry:checkEntry(npcChar, texttype, player, text)
    for _, pattern in pairs(self._trigger) do
        local a, _, number = string.find(text, pattern)
        self._saidNumber = number
        if a ~= nil then
            local conditionsResult = true
            for _, cond in pairs(self._conditions) do
                if not cond:check(npcChar, texttype, player) then
                    conditionsResult = false
                    break
                end
            end

            if conditionsResult then
                return true
            end
        end
    end
end

function talkNPCEntry:execute(npcChar, player)
    if (self._responsesCount > 0) then
        local selectedResponse = math.random(1, self._responsesCount)

        local responseText = self._responses[selectedResponse]
        local responseProcessors = self._responseProcessors[selectedResponse]

        if (responseProcessors ~= nil) then
            for _, processor in pairs(responseProcessors) do
                responseText = processor:process(player, self._parent, npcChar, responseText)
            end
        end

        local textType, text = tools.get_text_and_talktype(responseText)
        npcChar:talk(textType, text)
    end

    for _, conseq in pairs(self._consequences) do
        if conseq then
            conseq:perform(npcChar, player)
        end
    end
end

talkNPC["talkNPCEntry"] = talkNPCEntry
return talkNPC

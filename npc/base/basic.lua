--- Base NPC script for basic NPCs
--
-- This script bundles the functions the most other specific components of the
-- NPC require to work. Its the basic script of the NPC framework and the only
-- one that requires regular from the actual NPC script.
--
-- Author: Martin Karing

require("base.common")

module("npc.base.basic", package.seeall)

--- Constructor for the baseNPC. This does not take any paramters.
--
-- The sole purpose is to prepare all required values in the NPC script.
baseNPC = class(function(self)
    -- The state of the NPC. This value can be used to have the special parts
    -- of the NPC communicating with each other.
    self["state"] = baseNPC.stateNormal;
    
    -- The cycle functions are called during the next cycle method of this base
    -- NPC struct. Each special NPC class is able to register functions in this
    -- class.
    self["_cycleFunctions"] = nil;
    
    -- The receive text functions are called during the receive text method of
    -- the NPC. Each special NPC class is able to register functions in this 
    -- class.
    self["_receiveTextFunctions"] = nil;
    
    -- The cycle counter counts the calls of the next cycle method in order to
    -- find out when to execute the next time all the next cycle methods. This
    -- is used to reduce the server load caused by this method.
    self["_cycleCounter"] = 0;
    
    -- This variable stores then to call the cycle methods the next time in
    -- order to execute all functions of the NPC properly.
    self["_nextCycleCalls"] = 0;
end);

--- Constant for the state value of the NPC.
--  If this constant is set the NPC is currently in the normal mode.
baseNPC["stateNormal"] = 0;

--- Constant for the state value of the NPC.
--  If this constant is set the NPC is currently busy talking with a specified
--  character and is not to walk around or anything like this.
baseNPC["stateBusyTalking"] = 1;

--- This method adds one function to the functions that are called during the
--  next cycles.
--
--  @param receiver the receiver is a object that defines a nextCycle function
--                  that is called in given time intervals. The only paramter
--                  of this function is the time since the last call. The return
--                  value has to be the time when the next call of this function
--                  is expected. Its possible that the function is called ealier
--                  but not later.
function baseNPC:addCycle(receiver)
    if (type(receiver) ~= "table") then
        return;
    end;
    
    if (type(receiver.nextCycle) ~= "function") then
        return;
    end;
    
    if (self._cycleFunctions == nil) then
        self._cycleFunctions = {};
    end;
    
    table.insert(self._cycleFunctions, receiver);
end;

--- This method adds one function to the functions that are called during when
--  a text is received by the NPC.
--
--  @param receiver the receiver is a object that defines a receiveText function
--                  that is called all times the basic npc receives a text. The
--                  receive text function has to take as first paramter the
--                  character who is talking and as second parameter the text
--                  that was spoken. In case the receiveText function returns
--                  true the spoken text is not forwarded to any more possible
--                  receivers.
function baseNPC:addRecvText(receiver)
    if (type(receiver) ~= "table") then
        return;
    end;
    
    if (type(receiver.receiveText) ~= "function") then
        return;
    end;
    
    if (self._receiveTextFunctions == nil) then
        self._receiveTextFunctions = {};
    end;
    
    table.insert(self._receiveTextFunctions, receiver);
end;

--- This method has to be called during each next cycle call of a NPC. It
--  manages and calls the functions registered this NPC.
function baseNPC:nextCycle()
    if (self._cycleFunctions == nil) then
        return;
    end;
    
    if (self._cycleCounter < self._nextCycleCalls) then
        self._cycleCounter = self._cycleCounter + 1;
        return;
    end;
    
    local oldCycle = self._cycleCounter;
    self._cycleCounter = 0;
    self._nextCycleCalls = 2147483648;
    
    local nextRequestedCall = 0;
    table.foreach(self._cycleFunctions, function(key, value)
        nextRequestedCall = value:nextCycle(oldCycle);
        if (nextRequestedCall ~= nil and nextRequestedCall >= 0) then
            self._nextCycleCalls = math.min(self._nextCycleCalls,
                nextRequestedCall);
        end;
    end);
end;

--- This method should be called at each call of the receive text method. This
--  method will maintain all functions registered to this class and call them
--  properly in case its needed.
--
--  @param speaker the character struct who said some text
--  @param text the text that was spoken
function baseNPC:receiveText(speaker, text)
    if (self._receiveTextFunctions == nil) then
        return false;
    end;
    
    table.foreach(self._receiveTextFunctions, function(key, value)
        if (value:receiveText(speaker, text)) then
            return true;
        end;
    end);
    
    return false;
end;
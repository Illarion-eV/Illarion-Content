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
-- This file is a helper for gods.lua and gods_cooldowns.lua
-- Also contains tuning constants concerning favour increase, decay and cooldowns

local common = require('base.common')
local globalvar = require("base.globalvar")
local math = require("math")


local M = {}

-- Cooldown settings
M.PRAYER_COOLDOWN_sec = 60
M.PRAYER_FAVOUR_INCREASE = 20
M.FAVOUR_DECAY_PEROID_sec = 2*60
M.FAVOUR_DECAY_COEFF = 0.05
M.DONATION_DECAY_PERIOD_sec = 3*60
M.DONATION_DECAY_COEFF = 0.1
M.LTE_TICK_sec = 10

-- Utility values
M.EFFECT_ID = 613
M.LTE_TICK_NEXT_CALLED = M.LTE_TICK_sec * 10
M._PRAYER_COOLDOWN_COUNTER_RESET = M.PRAYER_COOLDOWN_sec / M.LTE_TICK_sec
M._FAVOUR_DECAY_COUNTER_RESET = M.FAVOUR_DECAY_PEROID_sec / M.LTE_TICK_sec
M._DONATION_DECAY_COUNTER_RESET = M.DONATION_DECAY_PERIOD_sec / M.LTE_TICK_sec


--- Class to represent all cooldown counters in gods system.
-- Note that each instance is not bound to a char, and represents counters of one kind across all players
-- The counter value is stored as LTE data and thus each function requires either char or effect (LTE) object
local class = require('base.class')
local CooldownCounter = class(
    function(self, ...)
        self:_init(...)
    end
)
--- Function to be called upon creation
function CooldownCounter:_init(varName, restartValue)
    self._varname = varName
    self._restartValue = restartValue
end
function CooldownCounter:_getValue(effectObj)
    local found, val = effectObj:findValue(self._varname)
    assert(found, "Counter should be initialized")
    return val
end
function CooldownCounter:_setValue(effectObj, value)
    effectObj:addValue(self._varname, value)
end
--- Function to be called when LTE is added
function CooldownCounter:initialize(charObj, effectObj)
    effectObj = effectObj or M.getEffectObj(charObj)
    self:_setValue(effectObj, 0)
end
function CooldownCounter:restart(charObj, effectObj)
    effectObj = effectObj or M.getEffectObj(charObj)
    self:_setValue(effectObj, self._restartValue)
end
function CooldownCounter:tick(charObj, effectObj)
    effectObj = effectObj or M.getEffectObj(charObj)
    self:_setValue(effectObj,
        math.max(self:_getValue(effectObj) - 1, 0)
    )
end
function CooldownCounter:hasEnded(charObj, effectObj)
    effectObj = effectObj or M.getEffectObj(charObj)
    return (self:_getValue(effectObj) <= 0)
end

--- Class to represent all decay counters in gods system.
-- Note that each instance is not bound to a char, and represents counters of one kind across all players
-- The counter value is stored as LTE data and thus each function requires either char or effect (LTE) object
local class = require('base.class')
local DecayCounter = class(
    function(self, ...)
        self:_init(...)
    end
)
--- Function to be called upon creation
function DecayCounter:_init(varName, restartValue)
    self._varName = varName
    self._restartValue = restartValue
    self._callbacks = {}
end
function DecayCounter:_getValue(effectObj)
    local found, val = effectObj:findValue(self._varName)
    assert(found, "Counter should be initialized first")
    return val
end
function DecayCounter:_setValue(effectObj, value)
    effectObj:addValue(self._varName, value)
end
--- Function to be called when LTE is added per char
function DecayCounter:initialize(charObj, effectObj)
    effectObj = effectObj or M.getEffectObj(charObj)
    self:_setValue(effectObj, self._restartValue)
end
--function DecayCounter:restart(charObj, effectObj)
--    effectObj = effectObj or M.getEffectObj(charObj)
--    self:_setValue(effectObj, self._restartValue)
--end
function DecayCounter:tick(charObj, effectObj)
    effectObj = effectObj or M.getEffectObj(charObj)
    local nextValue = self:_getValue(effectObj) - 1
    if nextValue <= 0 then
        for _,callback_func in ipairs(self._callbacks) do
            callback_func(charObj)
        end
        nextValue = self._restartValue
    end
    self:_setValue(effectObj, nextValue)
end
--- Register a function to be called when counter reaches 0.
-- @param callbackFunc - function with 1 argument (charObj) to be called
function DecayCounter:addCallback(callbackFunc)
    table.insert(self._callbacks, callbackFunc)
    debug("Now there are " .. #self._callbacks .. " callbacks for " .. self._varName)
end

-- Counters for cooldown and decay, stored in LTE data
M.prayerCooldownCounter = CooldownCounter("prayerCooldownCounter", M._PRAYER_COOLDOWN_COUNTER_RESET)
M.cooldownCounters = {M.prayerCooldownCounter}
M.favourDecayCounter = DecayCounter("favourDecayCounter", M._FAVOUR_DECAY_COUNTER_RESET)
M.donationDecayCounter = DecayCounter("donationDecayCounter", M._DONATION_DECAY_COUNTER_RESET)
M.decayCounters = {M.favourDecayCounter, M.donationDecayCounter}


function M.getEffectObj(charObj)
    local found, obj = charObj.effects:find(M.EFFECT_ID)
    assert(found, "Every user must have gods_cooldowns lte")
    return obj
end


return M
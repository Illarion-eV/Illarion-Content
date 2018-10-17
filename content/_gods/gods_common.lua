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

-- Favour increase and cooldown settings
M.MAX_FAVOUR = 2000
M.MIN_FAVOUR = -2000
M.LOSE_DEVOTION_FAVOUR_THRESHOLD = -50  -- minimal favour that is enough to remain devoted
M.DEVOTION_FAVOUR_THRESHOLD = 100  -- minimal favour that is enough to become devoted
M.LOSE_PRIESTHOOD_FAVOUR_THRESHOLD = 90  -- minimal favour that is enough to remain being a priest
M.PRIESTHOOD_FAVOUR_THRESHOLD = 200  -- minimal favour that is enough to become a priest
M.CHANGE_DEVOTION_PENALTY = 50 -- favour decreased when a devoted char switches to another god
M.CHANGE_DEVOTION_PRIEST_PENALTY = 200 -- favour decreased when a priest char switches to another god
M.PRAYER_COOLDOWN_sec = 4*60*60
M.PRAYER_FAVOUR_INCREASE = 15  -- favour bonus for each prayer
M.FAVOUR_DECAY_PEROID_sec = 1*60*60
M.FAVOUR_DECAY_COEFF = 0.02  -- favour is multiplied by (1-M.FAVOUR_DECAY_COEFF) every M.FAVOUR_DECAY_PEROID_sec seconds
M.SACRIFICE_FAVOUR_INCREASE_FOR_VALUE_DOUBLING = 60  -- favour bonus for donating same value as current cumulative value
M.SACRIFICE_VALUE_OFFSET_copper = 10000  -- base value of sacrifice cumulative value
M.SACRIFICE_DECAY_PERIOD_sec = 1*60*60
M.SACRIFICE_DECAY_COEFF = 0.05  -- cumulative value is multiplied by (1-M.SACRIFICE_DECAY_COEFF) every M.SACRIFICE_DECAY_PERIOD_sec seconds
M.LTE_TICK_sec = 10  -- should be a common divisor of all periods, and also low enough to make one tick neglectible (during logout all times are stored to resolution of one tick)

-- Some calculations to get an intuition about the numbers above.
--
-- If you suddenly stop doing anything in the matter of favour, it will decrease exponentially towards 0 (or increase if it was negative)
-- The halflife (decrease by 50%) of favour is FAVOUR_DECAY_PEROID_sec * log(0.5) / log(1-FAVOUR_DECAY_COEFF)
-- = 1hr * log(0.5)/log(0.98) = 34.3 hours
-- Favour decrease by 20% is FAVOUR_DECAY_PEROID_sec * log(0.5) / log(1-FAVOUR_DECAY_COEFF)
-- = 1hr * log(0.8)/log(0.98) = 11 hours
--
-- Favour decay gets stuck due to integer precision at 0.5 / FAVOUR_DECAY_COEFF = 0.5 / 0.02 = 25
-- If favour was negative it wll get stuck at the opposite value, -25.
--
-- If a priest is losing his favour due to decay, he should notice that his favour is below 100, and then he has log(90/100)/log(0.98) =~ 5hours until he reaches favour 90 and loses his status
--
-- If you pray exactly every M.PRAYER_COOLDOWN_sec (and don't do anything else), your favour (after the prayer) gradually becomes (approximately):
-- PRAYER_FAVOUR_INCREASE / (1 - (1-FAVOUR_DECAY_COEFF)^(PRAYER_COOLDOWN_sec/FAVOUR_DECAY_PEROID_sec))
-- = 15 / (1 - 0.98^4) = 193
-- And if you pray every 2*M.PRAYER_COOLDOWN_sec your favour will be approximately
-- 15 / (1 - 0.98^8) = 100
-- This means, that it is enough to pray once in 8 hours of gameplay to be able to become devoted, and you can't go beyond 193 with prayers alone
--
-- Sacrifice cumulative value has halflife of SACRIFICE_DECAY_PERIOD_sec * log(0.5) / log(1-SACRIFICE_DECAY_COEFF)
-- = 1hr * log(0.5)/log(0.95) = 13.5 hours
-- If you sacrifice value V every period T (assuming T is much larger than SACRIFICE_DECAY_PERIOD_sec), then the cumulative value after each sacrifice is
-- cumulative_after_sacrifice = V / (1 - (1-SACRIFICE_DECAY_COEFF) ^ (T/SACRIFICE_DECAY_PERIOD_sec))
-- E.g. for V=1gold, T=8hr, cumulative value is ~3gold (and ~2gold just before the sacrifice)
-- Each sacrifice in such case will give favour bonus of
-- bonus_each_time = SACRIFICE_FAVOUR_INCREASE_FOR_VALUE_DOUBLING * log2((cumulative_after_sacrifice + SACRIFICE_VALUE_OFFSET_copper) / (cumulative_after_sacrifice - V + SACRIFICE_VALUE_OFFSET_copper))
-- E.g. for V=1gold, T=8hr, you get ~25 favour points each time
-- If every 8 hours a char prays and sacrifices items equal to 1 gold, his favour (after prayer+sacrifice) becomes
-- (15 + 25) / (1 - 0.98^8) =~ 269 points
-- Instead of 100 points for only praying


-- Utility values
M.EFFECT_ID = 600
M.SACRIFICE_FAVOUR_COEFFICIENT = M.SACRIFICE_FAVOUR_INCREASE_FOR_VALUE_DOUBLING / math.log(2)
M.LTE_TICK_NEXT_CALLED = M.LTE_TICK_sec * 10
M._PRAYER_COOLDOWN_COUNTER_RESET = M.PRAYER_COOLDOWN_sec / M.LTE_TICK_sec
M._FAVOUR_DECAY_COUNTER_RESET = M.FAVOUR_DECAY_PEROID_sec / M.LTE_TICK_sec
M._SACRIFICE_DECAY_COUNTER_RESET = M.SACRIFICE_DECAY_PERIOD_sec / M.LTE_TICK_sec


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
    assert(restartValue == math.floor(restartValue), "Counter restartValue should be integer")
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
local DecayCounter = class(
    function(self, ...)
        self:_init(...)
    end
)
--- Function to be called upon creation
function DecayCounter:_init(varName, restartValue)
    self._varName = varName
    assert(restartValue == math.floor(restartValue), "Counter restartValue should be integer")
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

--- Class to represent all global (char-independent) periodic events and cooldowns.
-- These are counted in Illarion calendar time
local GlobalEvent = class(
    function(self, ...)
        self:_init(...)
    end
)
--- Function to be called upon creation
-- @param period - time period in RL secs to call the callback
-- @param alignment - the offset in RL secs inside the period. E.g. if period=1day and offset=0, then the callback is called at midnight. By default is same as for current time.
function GlobalEvent:_init(period, alignment)
    assert(period > 0, "Period should be positive")
    self._period = period
    if alignment then
        local curTime = common.GetCurrentTimestamp()
        self._nextTime = curTime - math.fmod(curTime, period) + period
    else
        self._nextTime = common.GetCurrentTimestamp() + period
    end
    self._callbacks = {}
end
function GlobalEvent:_getTimeLeft()
    return (self._nextTime - common.GetCurrentTimestamp())
end
function GlobalEvent:tick()
    local timeLeft = self:_getTimeLeft()
    if timeLeft <= 0 then
        for _,callback_func in ipairs(self._callbacks) do
            callback_func()
        end
        self._nextTime = self._nextTime + self._period
    end
end
--- Register a function to be called when counter reaches 0.
-- @param callbackFunc - function with no arguments to be called
function GlobalEvent:addCallback(callbackFunc)
    table.insert(self._callbacks, callbackFunc)
    debug("Now there are " .. #self._callbacks .. " callbacks that happen every " .. self._period .. " seconds")
end



-- Counters for cooldown and decay, stored in LTE data
M.prayerCooldownCounter = CooldownCounter("prayerCooldownCounter", M._PRAYER_COOLDOWN_COUNTER_RESET)
M.cooldownCounters = {M.prayerCooldownCounter}
M.favourDecayCounter = DecayCounter("favourDecayCounter", M._FAVOUR_DECAY_COUNTER_RESET)
M.sacrificeDecayCounter = DecayCounter("sacrificeDecayCounter", M._SACRIFICE_DECAY_COUNTER_RESET)
M.decayCounters = {M.favourDecayCounter, M.sacrificeDecayCounter}
-- Global periodic events
M.nargunRandomization = GlobalEvent(60*60/3, 0)  -- every midnight
M.globalEvents = {M.nargunRandomization}


function M.getEffectObj(charObj)
    local found, obj = charObj.effects:find(M.EFFECT_ID)
    assert(found, "Every user must have gods_cooldowns lte")
    return obj
end


return M
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

local M = {}

-- Cooldown settings
M.PRAYER_COOLDOWN_sec = 2*60
M.PRAYER_FAVOUR_INCREASE = 20
M.FAVOUR_DECAY_PEROID_sec = 10*60
M.FAVOUR_DECAY_COEFF = 0.05
M.DONATION_DECAY_PERIOD_sec = 10*60
M.DONATION_DECAY_COEFF = 0.1
M.LTE_TICK_sec = 60

-- Utility values
M.EFFECT_ID = 613
M.LTE_TICK_NEXT_CALLED = M.LTE_TICK_sec * 10
M.PRAYER_COOLDOWN_COUNTER_RESET = M.PRAYER_COOLDOWN_sec / M.LTE_TICK_sec
M.FAVOUR_DECAY_COUNTER_RESET = M.FAVOUR_DECAY_PEROID_sec / M.LTE_TICK_sec
M.DONATION_DECAY_COUNTER_RESET = M.DONATION_DECAY_PERIOD_sec / M.LTE_TICK_sec

-- Variables stored in LTE
M._VARNAME_FAVOUR_DECAY_COUNTER = "favourDecayCounter" -- ticks left till next favour decay
M._VARNAME_PRAYER_COOLDOWN_COUNTER = "prayerCooldownCounter" -- ticks left till prayer is possible again
M._VARNAME_DONATION_DECAY_COUNTER = "donationDecayCounter" -- ticks left till next donation value decay
M._VARNAME_DONATION_CUMULATIVE_VALUE = "donationCumulativeValue" -- sum of previous donations (decays over time)


function M.getEffectObj(User)
    local success, obj = User.effects:find(M.EFFECT_ID)
    assert(success, "Every user must have gods_cooldowns lte")
    return obj
end

-- Favour decay
function M.getFavourDecayCounter(effetctObj)
    local found, val = effetctObj:findValue(M._VARNAME_FAVOUR_DECAY_COUNTER)
    assert(found)
    return val
end

function M.setFavourDecayCounter(effetctObj, value)
    effetctObj:addValue(M._VARNAME_FAVOUR_DECAY_COUNTER, value)
end

-- Prayer cooldown
function M.getPrayerCooldownCounter(effetctObj)
    local found, val = effetctObj:findValue(M._VARNAME_PRAYER_COOLDOWN_COUNTER)
    assert(found)
    return val
end

function M.getUserPrayerCooldownCounter(User)
    return M.getPrayerCooldownCounter(M.getEffectObj(User))
end

function M.setPrayerCooldownCounter(effetctObj, value)
    effetctObj:addValue(M._VARNAME_PRAYER_COOLDOWN_COUNTER, value)
end

function M.setUserPrayerCooldownCounter(User, value)
    M.setPrayerCooldownCounter(M.getEffectObj(User), value)
end

-- Donation decay
function M.getDonationDecayCounter(effetctObj)
    local found, val = effetctObj:findValue(M._VARNAME_DONATION_DECAY_COUNTER)
    assert(found)
    return val
end

function M.setDonationDecayCounter(effetctObj, value)
    effetctObj:addValue(M._VARNAME_DONATION_DECAY_COUNTER, value)
end

--

return M
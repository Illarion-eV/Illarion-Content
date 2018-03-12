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
-- Cooldowns for favour/gods/priest system
-- EffectID = gods_cooldwons_common.EFFECT_ID

local common = require("base.common")
local math = require("math")
local gods_cooldowns_common = require("content._gods.gods_cooldowns_common")
local gods = require("content.gods")

local M = {}

function M.addEffect( Effect, Character)
    -- it is needed to add at least value to make sure the effect does not get deleted right after
    -- the first call
    gods_cooldowns_common.setFavourDecayCounter(Effect, gods_cooldowns_common.FAVOUR_DECAY_COUNTER_RESET)
    gods_cooldowns_common.setDonationDecayCounter(Effect, gods_cooldowns_common.DONATION_DECAY_COUNTER_RESET)
    gods_cooldowns_common.setPrayerCooldownCounter(Effect, 0)
end

function M.callEffect( Effect, Char ) -- Effect is called

    -- Decaying values
    local next_favour_decay_counter = gods_cooldowns_common.getFavourDecayCounter(Effect) - 1
    if next_favour_decay_counter <= 0 then
        gods.favourDecay(Char)
        next_favour_decay_counter = gods_cooldowns_common.FAVOUR_DECAY_COUNTER_RESET
    end
    gods_cooldowns_common.setFavourDecayCounter(Effect, next_favour_decay_counter)

    local next_donation_decay_counter = gods_cooldowns_common.getDonationDecayCounter(Effect) - 1
    if next_donation_decay_counter <= 0 then
        gods.donationDecay(Char)
        next_donation_decay_counter = gods_cooldowns_common.DONATION_DECAY_COUNTER_RESET
    end
    gods_cooldowns_common.setDonationDecayCounter(Effect, next_donation_decay_counter)

    -- Cooldowns
    gods_cooldowns_common.setPrayerCooldownCounter(Effect,
        math.max(gods_cooldowns_common.getPrayerCooldownCounter(Effect) - 1, 0)
    )

    --
    Effect.nextCalled = gods_cooldowns_common.LTE_TICK_NEXT_CALLED -- Effect gets called each X/10 secs
    return true -- repeat forever
end


function M.removeEffect( Effect, Character )

--This effect doesn't get removed.

end

function M.loadEffect(Effect, Character)

end

return M

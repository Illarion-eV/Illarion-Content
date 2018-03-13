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

function M.addEffect(effectObj, charObj)
    debug("gods_cooldowns addEffect")
    for _,counter in ipairs(gods_cooldowns_common.cooldownCounters) do
        counter:initialize(charObj, effectObj)
    end
    for _,counter in ipairs(gods_cooldowns_common.decayCounters) do
        counter:initialize(charObj, effectObj)
    end
end

function M.callEffect(effectObj, charObj) -- Effect is called
    debug("gods_cooldowns callEffect")
    for _,counter in ipairs(gods_cooldowns_common.cooldownCounters) do
        counter:tick(charObj, effectObj)
    end
    for _,counter in ipairs(gods_cooldowns_common.decayCounters) do
        counter:tick(charObj, effectObj)
    end

    --
    effectObj.nextCalled = gods_cooldowns_common.LTE_TICK_NEXT_CALLED -- Effect gets called each X/10 secs
    return true -- repeat forever
end


function M.removeEffect(effectObj, charObj)
    debug("gods_cooldowns removeEffect !!!")
--This effect doesn't get removed.

end

function M.loadEffect(effectObj, charObj)
    debug("gods_cooldowns loadEffect")

end

return M

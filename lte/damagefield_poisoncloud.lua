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

local common = require("base.common")
local magic = require("base.magic")
local shared = require("magic.nature.shared")
local poison = require("magic.nature.poison")

local M = {}

function M.addPoison(user, quality, penetration)


    local cloakGemBonus = magic.getGemBonusCloak(user)/100
    local resistance = shared.getNatureResistance(user)

    local damageLow = 100 + 40 * (quality) --Anywhere between 140 and 500
    local damageHigh = 100 + 80 * (quality) -- between 180 and 900
    local damageDealt = math.random(math.min(damageLow, damageHigh), math.max(damageLow, damageHigh))

    damageDealt = damageDealt * (1 - resistance + penetration)

    damageDealt = damageDealt * (1 - cloakGemBonus)

    damageDealt = math.max(damageDealt, 100)

    poison.applyPoison(user, damageDealt)
end

function M.addEffect(theEffect, user)

    if user:getQuestProgress(300) ~= 0 then
        return
    end

    user:inform("Du fühlst wie dein Körper schwächer wird.",
                "You feel your body becoming weaker.")

    local foundQuality, quality = theEffect:findValue("quality")

    local foundpenetration, penetration = theEffect:findValue("naturePenetration")

    if not foundpenetration then
        penetration = 0
    end

    if foundQuality then
        M.addPoison(user, quality, penetration)
    end
end

function M.callEffect(theEffect, user)

    -- check if still on a damaging field
    local items = common.GetItemsOnField(user.pos)
    local fieldItem

    for _, theItem in pairs(items) do
        if theItem.id == 372 then
            fieldItem = theItem
            break
        end
    end

    -- not on damaging field enymore
    if not fieldItem then
        return false
    end

    if user:getQuestProgress(300) ~= 0 then
        return
    end

    local foundpenetration, penetration = theEffect:findValue("naturePenetration")

    if not foundpenetration then
        penetration = 0
    end

    M.addPoison(user, math.floor(fieldItem.quality/100)+1, penetration)

    -- repeat in 5sec
    theEffect.nextCalled = 50
    return true
end

function M.loadEffect(theEffect, User)
end

function M.removeEffect (theEffect, User)
end

return M


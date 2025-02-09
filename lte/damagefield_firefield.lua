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
local magicResistance = require("magic.arcane.magicResistance")

-- Long time effect (110)
local M = {}

local function causeDamage(User, quality, penetration)

    quality = math.floor(quality/10)

    local resist = magicResistance.getMagicResistance(User)


    if resist < quality+1 then
        local damageLow = 3 * math.floor(math.max(10, quality+1)) --Anywhere between 30 and 300
        local damageHigh = 5 * math.floor(quality+1) -- between 50 and 500
        local damageDealt = math.random(math.min(damageLow, damageHigh), math.max(damageLow, damageHigh)) * (1 - resist + penetration)
        damageDealt = math.max(damageDealt, 30)
        User:increaseAttrib("hitpoints", -damageDealt)
        User:talk(Character.say,"#me takes "..damageDealt.." damage.", "#me takes "..damageDealt.." damage.")
    end
end

function M.addEffect(theEffect, User)

    if User:getQuestProgress(298) == 0 then
        User:inform("Du fühlst wie das glühend heiße Feuer allmählich deine Haut verbrennt.",
                    "You feel the scorching fire gradually burn your skin.")
        local _, quality = theEffect:findValue("quality")
        local foundpenetration, penetration = theEffect:findValue("magicPenetration")

        if not foundpenetration then
            penetration = 0
        else
            penetration = penetration/100
        end

        causeDamage(User, quality, penetration)
    end
end

function M.callEffect(theEffect, User)

    -- check if still on a damaging field
    local Items = common.GetItemsOnField(User.pos)
    local FieldItem

    for _, item in pairs(Items) do
        if(item.id == 359) then
            FieldItem = item
            break
        end
    end

    -- not on damaging field enymore
    if FieldItem == nil then
        return false
    end
    if User:getQuestProgress(298) == 0 then
        local foundpenetration, penetration = theEffect:findValue("magicPenetration")

        if not foundpenetration then
            penetration = 0
        else
            penetration = penetration/100
        end

        causeDamage(User, FieldItem.quality, penetration)
    end
    -- repeat in 5sec
    theEffect.nextCalled = 50
    return true
end

function M.loadEffect(theEffect, User)
    -- we dont care
end

function M.removeEffect (theEffect, User)

    if User:getQuestProgress(298) == 0 then
        User:inform("Du fühlst wie das Brennen auf deiner Haut nachlässt.",
                    "You feel the burning of your skin fade.")
    end
end

return M


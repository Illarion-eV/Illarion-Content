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
local testing = require("base.testing")
local magic = require("base.magic")

-- Long time effect (111)
local M = {}

function M.causeDamage(User, quality, penetration, wandGemBonus)

    local resist = magicResistance.getMagicResistance(User)

    local cloakGemBonus = magic.getGemBonusCloak(User)/100

    if resist < quality then
        local damageLow = 100 + 40 * (quality) --Anywhere between 140 and 500
        local damageHigh = 100 + 80 * (quality) -- between 180 and 900
        local damageDealt = math.random(math.min(damageLow, damageHigh), math.max(damageLow, damageHigh)) * (1 - resist + penetration)

        damageDealt = damageDealt * (1 + wandGemBonus-cloakGemBonus)
        damageDealt = math.max(damageDealt, 100)
        User:increaseAttrib("hitpoints", -damageDealt)
        if testing.active then
            User:talk(Character.say,"#me takes "..damageDealt.." damage.", "#me takes "..damageDealt.." damage.")
        end
    end
end

function M.addEffect(theEffect, User)
    if User:getQuestProgress(299) == 0 then
        User:inform("Du fühlst, wie das eiskalte Feuer allmählich deine Haut verbrennt.",
                    "You feel the icecold fire gradually burn your skin.")
        local _, quality = theEffect:findValue("quality")
        local foundpenetration, penetration = theEffect:findValue("magicPenetration")

        local foundwandGemBonus, wandGemBonus = theEffect:findValue("wandGemBonus")

        if not foundpenetration then
            penetration = 0
        else
            penetration = penetration/100
        end

        if not foundwandGemBonus then
            wandGemBonus = 0
        end

        M.causeDamage(User, quality, penetration, wandGemBonus)
    end
end

function M.callEffect(theEffect, User)

    -- check if still on a damaging field
    local Items = common.GetItemsOnField(User.pos)
    local FieldItem

    for _, item in pairs(Items) do
        if(item.id == 360) then
            FieldItem = item
            break
        end
    end

    -- not on damaging field enymore
    if FieldItem == nil then
        return false
    end

    if User:getQuestProgress(299) == 0 then
        local foundpenetration, penetration = theEffect:findValue("magicPenetration")

        local foundwandGemBonus, wandGemBonus = theEffect:findValue("wandGemBonus")

        if not foundpenetration then
            penetration = 0
        else
            penetration = penetration/100
        end

        local scaling = FieldItem:getData("scaling")

        if common.IsNilOrEmpty(scaling) then
            scaling = math.floor(FieldItem.quality/100)+1
        end

        if not foundwandGemBonus then
            wandGemBonus = 0
        end

        M.causeDamage(User, tonumber(scaling), penetration, wandGemBonus)

    end
    -- repeat in 5sec
    theEffect.nextCalled = 50
    return true
end

function M.loadEffect(theEffect, User)
    -- we dont care
end

function M.removeEffect (theEffect, User)

    if User:getQuestProgress(299) == 0 then
        User:inform("Du fühlst wie die Kälte auf deiner Haut nachlässt.",
                    "You feel the cold of your skin fade.")
    end
end

return M


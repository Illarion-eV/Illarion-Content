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
local icefield = require("lte.damagefield_icefield")

-- Long time effect (110)
local M = {}

function M.addEffect(theEffect, User)

    local ignoreDamage = M.ignoreDamageDueToRace(User, theEffect)

    if not ignoreDamage and User:getQuestProgress(298) == 0 then
        User:inform("Du fühlst wie das glühend heiße Feuer allmählich deine Haut verbrennt.",
                    "You feel the scorching fire gradually burn your skin.")
        local _, quality = theEffect:findValue("quality")
        local foundpenetration, penetration = theEffect:findValue("magicPenetration")

        local foundwandGemBonus, wandGemBonus = theEffect:findValue("wandGemBonus")

        if not foundpenetration then
            penetration = 0
        else
            penetration = tonumber(penetration)/100
        end

        if not foundwandGemBonus then
            wandGemBonus = 0
        end

        icefield.causeDamage(User, quality, penetration, wandGemBonus, theEffect)
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

        icefield.causeDamage(User, tonumber(scaling), penetration, wandGemBonus, nil, FieldItem)
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


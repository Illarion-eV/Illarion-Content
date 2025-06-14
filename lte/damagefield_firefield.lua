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

    if User:getQuestProgress(298) == 0 then
        User:inform("Du f�hlst wie das gl�hend hei�e Feuer allm�hlich deine Haut verbrennt.",
                    "You feel the scorching fire gradually burn your skin.")
        local _, quality = theEffect:findValue("quality")
        local foundpenetration, penetration = theEffect:findValue("magicPenetration")

        if not foundpenetration then
            penetration = 0
        else
            penetration = tonumber(penetration)/100
        end

        icefield.causeDamage(User, quality, penetration)
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

        local scaling = FieldItem:getData("scaling")

        if common.IsNilOrEmpty(scaling) then
            scaling = math.floor(FieldItem.quality/100)+1
        end

        icefield.causeDamage(User, tonumber(scaling), penetration)
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
        User:inform("Du f�hlst wie das Brennen auf deiner Haut nachl�sst.",
                    "You feel the burning of your skin fade.")
    end
end

return M


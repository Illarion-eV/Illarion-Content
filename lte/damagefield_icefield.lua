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
local monstermagic = require("monster.base.monstermagic")

-- Long time effect (111)
module("lte.damagefield_icefield", package.seeall)

local function causeDamage(User, quality)

    local resist = monstermagic.SpellResistence(User) * 10
    if resist < quality then
        local damageLow = 3 * math.floor((math.max(10, quality - resist)))
        local damageHigh = 5 * math.floor(quality - resist)
        local damageDealt = math.random(math.min(damageLow, damageHigh), math.max(damageLow, damageHigh))
        User:increaseAttrib("hitpoints", -damageDealt);
    end
end

function addEffect(theEffect, User)

    User:inform("Du fühlst, wie das eiskalte Feuer allmählich deine Haut verbrennt.",
                "You feel the icecold fire gradually burn your skin.")
    local _, quality = theEffect:findValue("quality")
    causeDamage(User, quality)
end

function callEffect(theEffect, User)

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

    causeDamage(User, FieldItem.quality)
    -- repeat in 5sec
    theEffect.nextCalled = 50
    return true
end

function loadEffect(theEffect, User)
    -- we dont care
end

function removeEffect (theEffect, User)

    User:inform("Du fühlst wie die Kälte auf deiner Haut nachlässt.",
                "You feel the cold of your skin fade.")
end

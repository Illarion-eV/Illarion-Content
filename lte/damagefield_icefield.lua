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

-- Long time effect (111)
local M = {}

local function causeDamage(User, quality)

    quality = math.floor(quality/10)

    local resist = magicResistance.getMagicResistance(User) -- up to 100 for players, up to 200 for monsters

    resist = math.floor(resist/10)

    if resist < quality+1 then --Immune at level 100, which players will realistically never reach as it requires stat bonuses you cant get high enough
        local damageLow = 3 * math.floor((math.max(10, quality+1 - resist))) --Anywhere between 3 and 30
        local damageHigh = 5 * math.floor(quality+1 - resist) --Anywhere between 5 and 50
        local damageDealt = math.random(math.min(damageLow, damageHigh), math.max(damageLow, damageHigh))
        User:increaseAttrib("hitpoints", -damageDealt)
        User:talk(Character.say,"#me takes "..damageDealt.." damage.", "#me takes "..damageDealt.." damage.")
    end
end

function M.addEffect(theEffect, User)
    if User:getQuestProgress(299) == 0 then
        User:inform("Du fühlst, wie das eiskalte Feuer allmählich deine Haut verbrennt.",
                    "You feel the icecold fire gradually burn your skin.")
        local _, quality = theEffect:findValue("quality")
        causeDamage(User, quality)
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
        causeDamage(User, FieldItem.quality)
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


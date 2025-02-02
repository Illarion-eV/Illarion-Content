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

local runes = require("magic.arcane.runes")
local tan = require("magic.arcane.enchanting.effects.tan")
local M = {}

M.tan = {}

function M.castingSpeedByRuneSize(size)
    if size == "Short" then
        return 15 -- 1.5 seconds
    elseif size == "Medium" then
        return 20 -- 2 seconds
    elseif size == "Long" then
        return 25 -- 2.5 seconds
    end
end

function M.resetTan(user)

    M.tan[user.id] = false

end

function M.setTan(user, activated)

    if not M.tan then
        M.tan = {}
    end

    M.tan[user.id] = {}

    M.tan[user.id].checked = true

    M.tan[user.id].activated = activated -- To prevent tapping the glyph dry without ever finishing a cast, we have to store it
    -- Technically this means someone could get it activated, unequip the glyph and equip another, but they'd have no way to know if it activated or not
    -- And you only get one check per cast, so if it does not activate you wouldnt know and you can not spam unfinished casts to activate it either as you have to
    -- finish a cast before you get a new check, as such there is no real room for intentional abuse of this

end

function M.arcaneSpellCastSpeed(user, spell, magicResistance) -- Should return total cast time required to cast a spell

    local castSpeed = 0

    for _, rune in pairs(runes.runes) do
        if runes.checkIfLearnedRune(user, nil, rune.id, nil, nil, spell) then
            castSpeed = castSpeed+M.castingSpeedByRuneSize(runes.runeNumberToTime(rune.id))
        end
    end

    if runes.checkSpellForRuneByName("Pera", spell) then
        --While the spell is cast one third faster, it also means you expend mana faster
        --and can do less total damage by the time you empty out your mana bar.
        --Which should make this a fair trade and a situational rune.
        castSpeed = castSpeed/1.3
    end

    if not magicResistance and (not M.tan or not M.tan[user.id] or not M.tan[user.id].checked) then
        local activated = tan.reduceCastTime(user)
        M.setTan(user, activated)
    end

    if not magicResistance and M.tan and M.tan[user.id] and M.tan[user.id].activated then
        --Faster cast time, but unreliable whether or not it procs, hence not OP.
        --While this makes learning slower, it is opt in to use glyphs, so I do not consider that an issue.
        castSpeed = castSpeed/2
    end

    return castSpeed
end

return M


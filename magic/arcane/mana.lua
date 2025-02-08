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
local magic = require("base.magic")
local skilling = require("magic.arcane.skilling")
local hydor = require("magic.arcane.enchanting.effects.hydor")

local M = {}

local function manaCostByRuneSize(user, size, spell)

    -- Scaled based on users skill in relevant spell category.


    local maxMana = 10000

    local minimumCost = { Small = maxMana/21, Medium = maxMana/14, Large = maxMana/9}

    local skillName = skilling.getMagicSkillSpellBelongsTo(spell)

    local skillLevel = user:getSkill(Character[skillName])

    local cost = minimumCost[size]

    cost = cost * (2 - (skillLevel)/100)
    --[[
        EG:
        At level 100, the cost is at its lowest
        At level 50, it is 50% more costly
        At level 0 it is double the cost
    ]]

    return cost

end

function M.arcaneSpellCost(user, spell) -- Should return a total mana cost for a spell by checking every rune present in the spell and returning the additive mana value

    local manaCost = 0

    for _, rune in pairs(runes.runes) do

        if runes.checkIfLearnedRune(user, nil, rune.id, nil, nil, spell) then --multipurpose function, in this case checks if the spell has the rune and not if it has been learned by the player contrary to what the name of the function might otherwise suggest
            manaCost = manaCost + manaCostByRuneSize(user, runes.runeNumberToCost(rune.id), spell)
        end

    end

    return manaCost
end

function M.checkIfEnoughMana(user, spell)

    local mana = M.arcaneSpellCost(user, spell)

    if magic.hasSufficientMana(user, mana) then
        return true
    end

    return false
end

function M.removedUsedMana(user, spell)

    local mana = M.arcaneSpellCost(user, spell)

    if hydor.reduceManaCost(user) then
        mana = mana/2
    end

    user:increaseAttrib("mana", -mana)
end


return M

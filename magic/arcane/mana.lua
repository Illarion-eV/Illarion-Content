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

local M = {}

local function manaCostByRuneSize(user, size, spell)

    --[[
        Scaled based on users skill in relevant spell category.
        Between 3-9 "rune slots".
        Small runes use 1 "rune slot", medium runes use 1.5 "rune slots", large runes use 3 "rune slots"
        At level 0 user has 3 rune slots, at level 100 they have 9.
        EG:
        At level 0 they can cast 1 large rune or 2 medium rune or 3 small runes or a combination such as 1 medium 1 small
        At level 50 they can cast 1 large rune or 3 medium runes or 4.5 small runes or a combination.
        At level 100 they can cast 3 large, 6 medium or 9 small or a combination of the three such as 1 large, 2 medium, 3 small or 4 medium 3 small and so on
    )
    ]]

    local maxMana = 10000

    local minimumCost = { Small = maxMana/9, Medium = maxMana/6, Large = maxMana/3}

    local skillName = skilling.getMagicSkillSpellBelongsTo(spell)

    local skillLevel = Character[skillName]

    local cost = minimumCost[size]

    cost = cost * (1 + (2 - ((skillLevel*2)/100)))
    --[[
        EG:
        At level 100, the cost remains at the minimum cost.
        At level 50, it would be double the cost.
        At level 0 it would be three times as much.
        So for a small rune that'd be 1111 mana at level 100 vs 2222 mana at level 50 and 3333 mana at level 0, allowing for 9 vs 4.5 vs 3 small runes in a spell.
        For medium: 1666 vs 3333 vs 5000 cost for 6 vs 3 vs 2 rune casts at level 100, 50, 0.
        For large: 3333 vs 6666 vs 9999 cost for 3 vs 1 vs 1 rune casts at level 100, 50, 0.
    ]]

    return cost

end

function M.arcaneSpellCost(user, spell) -- Should return a total mana cost for a spell by checking every rune present in the spell and returning the additive mana value

    local manaCost = 0

    for i = 1,#runes.Runes do
        if runes.checkIfLearnedRune(user, nil, i, nil, nil, spell) then --multipurpose function, in this case checks if the spell has the rune and not if it has been learned by the player contrary to what the name of the function might otherwise suggest
            manaCost = manaCost + manaCostByRuneSize(user, runes.Runes[i][3], spell)
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
    user:increaseAttrib("mana", -mana)
end

return M

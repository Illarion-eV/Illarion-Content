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

function M.arcaneSpellCost(user, spell, thePosition, startedInAttackMode) -- Should return a total mana cost for a spell by checking every rune present in the spell and returning the additive mana value

    local manaCost = 0

    for _, rune in pairs(runes.runes) do

        if runes.checkIfLearnedRune(user, nil, rune.id, nil, nil, spell) then --multipurpose function, in this case checks if the spell has the rune and not if it has been learned by the player contrary to what the name of the function might otherwise suggest
            manaCost = manaCost + manaCostByRuneSize(user, runes.runeNumberToCost(rune.id), spell)
        end

    end

    local DUN = runes.checkSpellForRuneByName("DUN", spell)

    local px, py = user.pos.x, user.pos.y
    local tx, ty = thePosition.x, thePosition.y
    local dx, dy = tx - px, ty - py
    local distance = math.sqrt(dx*dx + dy*dy)

    local PEN = runes.checkSpellForRuneByName("PEN", spell)

    local LEV = runes.checkSpellForRuneByName("LEV", spell)

    if DUN and distance > 2 and not user.attackmode and not (PEN and LEV) and not startedInAttackMode then -- DUN mana cost scaled by how big of a circle you spawn

        distance = distance - 1 -- We dont count the first one as you cant go to 0 so 1 becomes 0 aka the basis

        local distanceImpact = 0.5 -- Each addition to the range is 50% more mana cost

        local manaAddition = manaCost*distance*distanceImpact

        manaCost = manaCost + manaAddition

    end

    return manaCost
end

function M.checkIfEnoughMana(user, spell, thePosition, startedInAttackMode)

    local mana = M.arcaneSpellCost(user, spell, thePosition, startedInAttackMode)

    if magic.hasSufficientMana(user, mana) then
        return true
    end

    return false
end

function M.removedUsedMana(user, spell, thePosition, startedInAttackMode)

    local mana = M.arcaneSpellCost(user, spell, thePosition, startedInAttackMode)

    if hydor.reduceManaCost(user) then
        mana = mana/2
    end

    user:increaseAttrib("mana", -mana)
end


return M

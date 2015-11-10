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
local explosionSpell = require("monster.base.spells.explosion")
local fireballSpell = require("monster.base.spells.fireball")
local fireconeSpell = require("monster.base.spells.firecone")
local fireringSpell = require("monster.base.spells.firering")
local firefieldSpell = require("monster.base.spells.firefield")
local flamestrikeSpell = require("monster.base.spells.flamestrike")
local healSpell = require("monster.base.spells.heal")
local iceballSpell = require("monster.base.spells.iceball")
local iceconeSpell = require("monster.base.spells.icecone")
local iceringSpell = require("monster.base.spells.icering")
local icestrikeSpell = require("monster.base.spells.icestrike")
local lightingSpell = require("monster.base.spells.lighting")
local poisonballSpell = require("monster.base.spells.poisonball")
local poisonconeSpell = require("monster.base.spells.poisoncone")
local poisonringSpell = require("monster.base.spells.poisonring")
local summonSpell = require("monster.base.spells.summon")
local violetSpell = require("monster.base.spells.violet")
local warpSpell = require("monster.base.spells.warp")

local function _isNumber(value)
    return type(value) == "number"
end

local function _isTable(value)
    return type(value) == "table"
end

local function _isFunction(value)
    return type(value) == "function"
end

return function()
    local self = {}
    local spellsEnemyNear = {}
    local spellsEnemyOnSight = {}
    local maximalAttackDistance = 1

    self.ONLY_ON_SIGHT = 1
    self.ONLY_NEAR_ENEMY = 2
    self.ALWAYS = bit32.bor(self.ONLY_ON_SIGHT, self.ONLY_NEAR_ENEMY)

    function self.addSpell(spell, params)
        if not _isTable(spell) then
            error("The spell is not a table as it was expected.")
        end
        if not _isFunction(spell.cast) then
            error("The spell does not implement the required cast function.")
        end
        if not _isFunction(spell.getAttackRange) then
            error("The spell does not implement the required getAttackRange function.")
        end

        maximalAttackDistance = math.max(maximalAttackDistance, spell.getAttackRange())

        local usageFlag = self.ALWAYS
        if _isTable(params) then
            if params.usage ~= nil then
                if _isNumber(params.usage) then
                    usageFlag = tonumber(params.usage)
                else
                    error("The usage flag for the spell was set to something. How ever not a number.")
                end
            end
        end

        if bit32.btest(usageFlag, self.ONLY_ON_SIGHT) then
            table.insert(spellsEnemyOnSight, spell)
        end

        if bit32.btest(usageFlag, self.ONLY_NEAR_ENEMY) then
            table.insert(spellsEnemyNear, spell)
        end
    end

    function self.addExplosion(params)
        self.addSpell(explosionSpell(params), params)
    end

    function self.addFireball(params)
        self.addSpell(fireballSpell(params), params)
    end

    function self.addFirecone(params)
        self.addSpell(fireconeSpell(params), params)
    end

    function self.addFirering(params)
        self.addSpell(fireringSpell(params), params)
    end
    function self.addFirefield(params)
        self.addSpell(firefieldSpell(params), params)
    end

    function self.addFlamestrike(params)
        self.addSpell(flamestrikeSpell(params), params)
    end

    function self.addHealing(params)
        self.addSpell(healSpell(params), params)
    end

    function self.addIceball(params)
        self.addSpell(iceballSpell(params), params)
    end

    function self.addIcecone(params)
        self.addSpell(iceconeSpell(params), params)
    end

    function self.addIcestrike(params)
        self.addSpell(icestrikeSpell(params), params)
    end

    function self.addIcering(params)
        self.addSpell(iceringSpell(params), params)
    end

    function self.addLighting(params)
        self.addSpell(lightingSpell(params), params)
    end

    function self.addPoisonball(params)
        self.addSpell(poisonballSpell(params), params)
    end

    function self.addPoisoncone(params)
        self.addSpell(poisonconeSpell(params), params)
    end

    function self.addPoisonring(params)
        self.addSpell(poisonringSpell(params), params)
    end

    function self.addSummon(params)
        self.addSpell(summonSpell(params), params)
    end

    function self.addVioletFlame(params)
        self.addSpell(violetSpell(params), params)
    end

    function self.addWarping(params)
        self.addSpell(warpSpell(params), params)
    end

    function self.getMaximalAttackDistance()
        return maximalAttackDistance
    end

    local function castEnemyNear(monster, enemy)
        for _, spell in pairs(spellsEnemyNear) do
            if (spell.cast(monster, enemy)) then
                monster:performAnimation(11) -- Cast Animation
                return true
            end
        end
        return false
    end

    local function castEnemyOnSight(monster, enemy)
        for _, spell in pairs(spellsEnemyOnSight) do
            if (spell.cast(monster, enemy)) then
                monster:performAnimation(11) -- Cast Animation
                return true
            end
        end
        return false
    end

    function self.addCallbacks(t)
        if not _isTable(t) then
            error("Adding the magic callbacks requires a table as parameter that contains the already set callbacks.")
        end

        local oldEnemyNear = t.enemyNear
        t.enemyNear = function(monster, enemy)
            if oldEnemyNear ~= nil and oldEnemyNear(monster, enemy) then
                return true
            end
            return castEnemyNear(monster, enemy)
        end

        local oldEnemyOnSight = t.enemyOnSight
        t.enemyOnSight = function(monster, enemy)
            if oldEnemyOnSight ~= nil and oldEnemyOnSight(monster, enemy) then
                return true
            end

            return castEnemyOnSight(monster, enemy)
        end

        return t
    end

    return self
end

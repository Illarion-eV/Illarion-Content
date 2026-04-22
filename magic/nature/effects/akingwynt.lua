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

local monsterLevels = require("monster.base.levels")
local spells = require("magic.nature.spells")
local shared = require("magic.nature.shared")

local communionLTE = 41

--[[ WeaponType logic used while attempting to find a balance:
    Slashing: Attacks with claws
    Blunt: Rams with its body
    Stabbing: Attacks with horns, stinger or teeth
    ]]

local beastList = { --All communable beast races

    {race = Character.sheep, weaponType = "blunt"},
    {race = Character.cow, weaponType = "stabbing"},
    {race = Character.chicken, weaponType = "slashing"},
    {race = Character.pig, weaponType = "blunt"},
    {race = Character.deer, weaponType = "stabbing"},
    {race = Character.rabbit, weaponType = "slashing"},
    {race = Character.beetle, weaponType = "blunt"},
    {race = Character.wasp, weaponType = "stabbing"},
    {race = Character.rat, weaponType = "slashing"},
    {race = Character.dog, weaponType = "blunt"},
    {race = Character.spider, weaponType = "stabbing"},
    {race = Character.fox, weaponType = "slashing"},
    {race = Character.slime, weaponType = "blunt"},
    {race = Character.hellhound, weaponType = "stabbing"},
    {race = Character.wolf, weaponType = "slashing"},
    {race = Character.bear, weaponType = "blunt"},
    {race = Character.raptor, weaponType = "stabbing"},
    {race = Character.fleshDragon, weaponType = "slashing"}
}

local M = {}

function M.addEffect(effect, user)
    user:inform("Du hast dich erfolgreich mit dem Tier verbunden und eine spirituelle Verbindung zu ihm aufgebaut. Diese wird nach einer Weile wieder vergehen.", "You successfully communed with the beast, forming a spiritual connection with it. This will wear off after a while.")
end

function M.callEffect(effect, user)

    M.removeEffect(effect, user)

    return false
end

function M.loadEffect(effect, user)

end

function M.removeEffect(effect, user)
    user:inform("Deine aktuelle spirituelle Tierverbindung ist verflogen.", "Your current spiritual beast communion has worn off.")
end

function M.getCommunedBeast(user)

    local foundEffect, myEffect = user.effects:find(communionLTE)

    if foundEffect then

        local foundRace, race = myEffect:findValue("race")

        if not foundRace then
            return false
        end

        for _, beast in pairs(beastList) do
            if beast.race == race then
                return beast
            end
        end
    end

    return false
end

local function getDuration(user, spellName, target)

    local minDuration = 6000 --At least 10 minutes, in deciseconds

    local baseDuration = minDuration*3 --Base duration is 30 minutes

    local duration = shared.scaleEffect(user, spellName, baseDuration, target)

    return math.max(minDuration, math.floor(duration))

end

local function communeWithBeast(user, target, spellName)

    local race = target:getRace()

    local foundEffect = user.effects:find(communionLTE)

    local duration = getDuration(user, spellName, target)

    if foundEffect then
        user.effects:removeEffect(communionLTE)
    end

    local myEffect = LongTimeEffect(communionLTE, duration)

    myEffect:addValue("beast", race)

    user.effects:addEffect(myEffect)

end

local function canCommuneWithBeast(user, target, spellName)

    local values = spells.getSpellValuesFromName(spellName)

    if target:getType () ~= Character.monster then
        user:inform("Dein Ziel ist kein Tier, mit dem du dich verbinden kannst.", "Your target is not a beast you can commune with.")
        return false
    end

    local skillName = user:getSkillName(values.skill)
    local skillLevel = user:getSkill(values.skill)
    local requiredLevel = monsterLevels.getLevel(target)

    if requiredLevel > skillLevel then
        user:inform("Dein Level in " .. skillName .. " ist nicht hoch genug, um dich mit diesem Tier zu verbinden.", "Your level in "..skillName.." is not high enough to commune with this beast.")
        return false
    end

    return true
end

function M.effect(user, location, target)

    world:gfx(52, location)
    world:makeSound(13, location)

    local spellName = "Akingwynt"

    if canCommuneWithBeast(user, target, spellName) then
        communeWithBeast(user, target, spellName)
    end

end

function M.checksToPass(user, location, target)
    return true
end

return M

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
local castArcaneSpell = require("magic.arcane.castSpell")
local testing = require("base.testing")
local durability = require("craft.base.shared")
local spells = require("magic.nature.spells")
local hydor = require("magic.arcane.enchanting.effects.hydor")
local tan = require("magic.arcane.enchanting.effects.tan")
local spellEffects = {}

for _, spell in pairs(spells.spells) do
    spellEffects[spell.name] = require("magic.nature.effects."..string.lower(spell.name))
end

local M = {}

M.playerTargets = {}

local castGFX, castGFXDuration, castSFX, castSFXDuration = 21, 10, 0, 10

local corStaffs = {Item.noviceCorStaff, Item.corStaff, Item.bloomCorStaff, Item.deepCorStaff, Item.wildCorStaff, Item.witherCorStaff, Item.stoneCorStaff}
local weaveBonus = {}

local weaves = {"bloom", "deep", "wild", "wither", "stone"}

for _, weave in pairs(weaves) do
    weaveBonus[Item[weave.."CorStaff"]] = Character[weave.."weave"]
end

local function checkForCorStaff(user)


    local corStaff = common.getItemInHand(user, corStaffs)

    if not corStaff then
        return false
    end

    if common.isBroken(corStaff) then
        user:inform("Dein Cor-Stab ist kaputt. Du solltest ihn reparieren lassen, bevor du versuchst, ihn zu benutzen.", "Your Cor staff is broken. You should see to its repairs before trying to use it.")
        return false
    end

    return corStaff

end

M.tan = {}

local function castingSpeedBySize(size) -- In deciseconds
    if size == "Short" then
        return 30
    elseif size == "Medium" then
        return 60
    elseif size == "Long" then
        return 90
    end
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

local function getCastTime(user, spellName, skipTan) -- Should return total cast time required to cast a spell

    local spellValues = spells.getSpellValuesFromName(spellName)

    local castSpeed = castingSpeedBySize(spellValues.time)

    if not skipTan and (not M.tan or not M.tan[user.id] or not M.tan[user.id].checked) then
        local activated = tan.reduceCastTime(user)
        M.setTan(user, activated)
    end

    if not skipTan and M.tan and M.tan[user.id] and M.tan[user.id].activated then
        castSpeed = castSpeed/2
    end

    return castSpeed
end

local function getDefaultPosition(user)

    local frontPos = common.GetFrontPosition(user)

    local corStaff = checkForCorStaff(user)

    if not corStaff then
        return frontPos
    end

    local customRange = corStaff:getData("range")

    if common.IsNilOrEmpty(customRange) then
        return frontPos
    end

    customRange = tonumber(customRange)

    local xDiff = frontPos.x- user.pos.x
    local yDiff = frontPos.y - user.pos.y

    local newX = user.pos.x + xDiff*customRange
    local newY = user.pos.y + yDiff*customRange

    return position(newX, newY, user.pos.z)

end

local function getTarget(user)

    local thePosition = getDefaultPosition(user)

    if user.attackmode and checkForCorStaff(user) then --wand required to aim
        local targeted = M.playerTargets[user.id]
        if not targeted then --onAttack did not load the target yet, very rarely happens
            return thePosition
        end

        if not isValidChar(targeted) then
            return thePosition
        end

        return targeted.pos, targeted

    end

    return thePosition

end

local function checkWeaveBonus(user, spellName, corStaff)
    local weave = weaveBonus[corStaff.id]

    local spellValues = spells.getSpellValuesFromName(spellName)

    if weave and weave == spellValues.skill then
        return true
    end

    return false
end

local function getCastingRange(user, spellName)

    local baseRange = 7
    local corStaff = checkForCorStaff(user)
    local staffBonus = false

    if corStaff then
        checkWeaveBonus(user, spellName, corStaff)
    end

    local range = baseRange

    if staffBonus then
        range = range + 1
    end

    return range
end

local function isInRange(user, spellName, thePosition)

    local range = getCastingRange(user, spellName)
    local pos1 = user.pos
    local pos2 = thePosition

    local xdif = pos1.x - pos2.x
    local ydif = pos1.y - pos2.y

    if xdif > range or xdif < -range or ydif > range or ydif < -range or pos1.z ~= pos2.z then
        return false
    end

    return true

end

local function checkForObstacles(user, pos)

    local startingpos = user.pos
    local blockList = world:LoS(startingpos, pos)
    local next = next

    if (next(blockList)~=nil) then
        return true
    end

    return false

end

local function spellCost(user, spellName)

    local maxMana = 10000

    local spellValues = spells.getSpellValuesFromName(spellName)

    local minimumCost = { Small = maxMana/21, Medium = maxMana/14, Large = maxMana/9}

    local skillLevel = user:getSkill(spellValues.skill)

    local cost = minimumCost[spellValues.mana]

    cost = cost * (2 - (skillLevel)/100)

    return cost
end

local function checkIfEnoughMana(user, spellName)

    local mana = spellCost(user, spellName)

    if user:increaseAttrib("mana", 0) > mana then
        return true
    end

    return false
end

local function checksPassed(user, spellName, thePosition)

    if not spells.statReqMet(user, spellName) or user:getMagicType() ~= 3 then
        user:inform("Deine Fähigkeit, die Geflechte der Natur zu spüren, ist zu schwach geworden, um diesen Zauber zu wirken.", "Your ability to sense the weaves of nature have become too dull to cast this spell.")
        return false
    end

    if not isInRange(user, spellName, thePosition) then
        user:inform("Dein Ziel ist zu weit entfernt.","Your target is too far away.")
        return false
    end

    local skillCriteriaMet, skillLevel, skillName = spells.skillCriteriaMet(user, spellName)

    if not skillCriteriaMet then
        user:inform("Deine Fähigkeit in "..skillName.." ist nicht hoch genug, um diesen Zauber zu wirken. Du musst Stufe "..skillLevel.." sein.","Your skill in "..skillName.." is not high enough to cast that spell. You need to be level "..skillLevel..".")
        return false
    end

    if checkForObstacles(user, thePosition) then
        user:inform("Etwas versperrt deine Sichtlinie, du kannst dort nicht zaubern.", "Something is obstructing your line of sight, you can't cast there.") --line of sight not clear
        return false
    end

    if not checkIfEnoughMana(user, spellName) then
        user:inform("Du hast nicht genug Mana, um den Zauber zu wirken.","You do not have enough mana to cast the spell.")
        return false
    end

    return true
end

local function removeUsedMana(user, spellName)

    local mana = spellCost(user, spellName)

    if hydor.reduceManaCost(user) then
        mana = mana/2
    end

    user:increaseAttrib("mana", -mana)
end

local function isAutocast(corStaff)

    if not corStaff then
        return false
    end

    local autoCast = corStaff:getData("autoCast")

    if not common.IsNilOrEmpty(autoCast) then
        if autoCast == "true" then
            return true
        end
    end

    return false
end

local function increaseExperience(user, spellName, castDuration, target)

    local targetLevel = 0

    if target and isValidChar(target) then

        local checkLevel = target:getSkill(Character.natureResistance)

        if checkLevel > targetLevel then
            targetLevel = checkLevel
        end
    end

    local spellValues = spells.getSpellValuesFromName(spellName)

    user:learn(spellValues.skill, castDuration, targetLevel+20)

end

local function getWeaverspouches(user)

    local weaversPouches = {}

    for i = 12, 17 do -- belt slots
        local potentialPouch = user:getItemAt(i)
        if potentialPouch.id == Item.weaversPouch then
            table.insert(weaversPouches, potentialPouch)
        end
    end

    if #weaversPouches == 0 then
        return false
    end

    return weaversPouches

end

local function hasEnoughCharges(user, spellName)

    local weaversPouches = getWeaverspouches(user)

    if not weaversPouches then
        return false
    end

    local spellValues = spells.getSpellValuesFromName(spellName)

    local charges = spellValues.charges

    local sigilName = spellValues.sigil

    local dataKey = sigilName:gsub("%s+", "")

    for _, weaversPouch in pairs (weaversPouches) do

        local existingCharges = tonumber(weaversPouch:getData(dataKey))

        if existingCharges and existingCharges >= charges then
            return true, weaversPouch
        end
    end

    return false

end

local function consumeCharges(user, spellName)

    local hasCharges, weaversPouch = hasEnoughCharges(user, spellName)

    if not hasCharges or not weaversPouch then
        return false
    end

    local spellValues = spells.getSpellValuesFromName(spellName)

    local charges = spellValues.charges

    local sigilName = spellValues.sigil

    local dataKey = sigilName:gsub("%s+", "")

    local existingCharges = tonumber(weaversPouch:getData(dataKey))

    local newCharge = existingCharges-charges

    weaversPouch:setData(dataKey, tostring(newCharge))

    world:changeItem(weaversPouch)

end

local function spellSpecificChecks(user, target, thePosition, spellName)
    --Checks such as whether there is free space if the spell spawns an object, or that you have enough sigil charges
    if not hasEnoughCharges(user, spellName) then
        user:inform("Du hast nicht genügend Sigil-Ladungen, um diesen Zauber zu wirken.", "You do not have enough sigil charges to cast that spell.")
        return false
    end

    return spellEffects[spellName].checksToPass(user, thePosition, target)

end

local function applySpellEffect(user, target, spellName, thePosition)
    --Applies the effect and reduces the sigil charges
    spellEffects[spellName].effect(user, thePosition, target)

    --Tutorial flag
    local questProgress = user:getQuestProgress(692)

    if questProgress == 11 then
        user:setQuestProgress(692, 12)
    end
    -- Tutorial flag done

end

function M.castSpell(user, spellName, actionState)

    if castArcaneSpell.interrupted(user) then
        return
    end

    if not M[user.id] then
        M[user.id] = {}
    end

    if actionState == Action.none then

        if _G.stopAutoCast and _G.stopAutoCast[user.id] then
            _G.stopAutoCast[user.id] = false
        end

        local thePosition, target = getTarget(user)

        if not thePosition then --failsafe
            return
        end

        M[user.id].thePosition = thePosition
        M[user.id].target = target

        common.TurnTo(user, thePosition)

        if not checksPassed(user, spellName, thePosition) or not spellSpecificChecks(user, target, thePosition, spellName) then
            return
        end

        local castDuration = getCastTime(user, spellName)

        M[user.id].storedDuration = castDuration

        local foundEffect, paralysis = user.effects:find(23)

        if foundEffect then
            local foundTime, timeLeft = paralysis:findValue("timeLeft")
            if foundTime and timeLeft >= 1 then
                M[user.id].extendBy = timeLeft
            else
                M[user.id].extendBy = 0
            end
        else
            M[user.id].extendBy = 0
        end

        if not _G.extendedCastingTimeForParalysis then
            _G.extendedCastingTimeForParalysis = {}
        end

        _G.extendedCastingTimeForParalysis[user.id] = 0

        user:startAction(castDuration, castGFX, castGFXDuration, castSFX, castSFXDuration)

    elseif actionState == Action.abort then
        return
    elseif actionState == Action.success then

        if not _G.extendedCastingTimeForParalysis then
            _G.extendedCastingTimeForParalysis = {}
        end

        if M[user.id].extendBy > 0 then

            if testing.active then
                user:talk(Character.say, "#me's cast is extended by "..(M[user.id].extendBy/10).." seconds.")
            end

            user:startAction(M[user.id].extendBy, castGFX, castGFXDuration, castSFX, castSFXDuration)
            return

        elseif _G.extendedCastingTimeForParalysis[user.id] and _G.extendedCastingTimeForParalysis[user.id] > 0 then

            if testing.active then
                user:talk(Character.say, "#me's cast is extended by "..(_G.extendedCastingTimeForParalysis[user.id]/10).." seconds.")
            end

            user:startAction(_G.extendedCastingTimeForParalysis[user.id], castGFX, castGFXDuration, castSFX, castSFXDuration)
            _G.extendedCastingTimeForParalysis[user.id] = 0

            return
        end

        local target = M[user.id].target

        if target and not isValidChar(target) then
            target = false
        end

        if not checksPassed(user, spellName, M[user.id].thePosition) or not isInRange(user, spellName, M[user.id].thePosition) then --Target gets checked in addition to the regular checks, in case they moved
            return
        end

        removeUsedMana(user, spellName)

        local castDuration = M[user.id].storedDuration

        increaseExperience(user, spellName, castDuration, target)

        M.tan[user.id] = false

        consumeCharges(user, spellName)

        applySpellEffect(user, target, spellName, M[user.id].thePosition)


        local corStaff = checkForCorStaff(user)

        if corStaff then
            durability.toolBreaks(user, corStaff, castDuration)
        end

        if user.attackmode and isAutocast(corStaff) and checksPassed(user, spellName, M[user.id].thePosition) and spellSpecificChecks(user, target, M[user.id].thePosition, spellName) then

            if _G.stopAutoCast and _G.stopAutoCast[user.id] then
                _G.stopAutoCast[user.id] = false
                return
            end

            castDuration = getCastTime(user, spellName)
            M[user.id].storedDuration = castDuration

            if castArcaneSpell.interrupted(user) then
                return
            end

            user:startAction(castDuration, castGFX, castGFXDuration, castSFX, castSFXDuration)
        end
    end
end

return M

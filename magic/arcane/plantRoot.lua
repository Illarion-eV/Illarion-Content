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
local magicDamage = require("magic.arcane.magicDamage")
local staticObjects = require("magic.arcane.staticObjects")
local effectScaling = require("magic.arcane.effectScaling")
local lookat = require("base.lookat")
local texts = require("magic.arcane.base.texts")
local antiTroll = require("magic.arcane.base.antiTroll")
local M = {}

local howManySecondsUntilFullSpeed = 10

function M.getSpeed(user, target, spell, earthTrap)
    local scaling
    if earthTrap then
        scaling = earthTrap:getData("scaling")
    else
        scaling = effectScaling.getEffectScaling(user, target, spell)
    end
    local retVal = 0.2
    local Taur = runes.checkSpellForRuneByName("Taur", spell)
    local Ura = runes.checkSpellForRuneByName("Ura", spell)
    local Yeg = runes.checkSpellForRuneByName("Yeg", spell)
    local Lhor = runes.checkSpellForRuneByName("Lhor", spell)
    local Qwan = runes.checkSpellForRuneByName("Qwan", spell)
    local rune
        if Taur then
            rune = "Taur"
        elseif Ura then
            rune = "Ura"
        elseif Yeg then
            rune = "Yeg"
        end
    local raceBonus
        if rune then
            raceBonus = magicDamage.checkIfRaceBonus(target, rune)
        end
        if raceBonus then
            retVal = retVal + 0.1
        end
        if Qwan then
            retVal = retVal + 0.1
        end
        retVal = retVal*100
        retVal = math.floor(retVal*scaling)

        if Lhor then
            retVal = false
        end
    return retVal
end

function M.getField(target)
    local positionToCheck = M.getPosition(target)
    return world:getField(positionToCheck)
end

local suitableSoilList = {3, 4, 8, 9, 10, 11, 12, 14, 16, 74, 76}

function M.checkForSuitableSoil(field)
    local myFieldId = field:tile()
    for _, soil in pairs(suitableSoilList) do
        if myFieldId == soil then
            return true
        end
    end
    return false
end

function M.getPosition(target)

    local positionToCheck

    if target.pos then
        positionToCheck = target.pos
    else
        positionToCheck = target
    end

    return positionToCheck
end

local function plantCreation(user, target, spell, item)
    local Lhor = runes.checkSpellForRuneByName("Lhor", spell)
    local plantID = 3644
    local wear = staticObjects.getWearBasedOnDuration(user, target, spell)
    local scaling = effectScaling.getEffectScaling(user, target, spell)
    local field = M.getField(target)
        if not field or not antiTroll.passesAntiTrollCheck(target) then
            return
        end
        if item then
            if not field:isPassable() then
                return
            end
        end
        if not M.checkForSuitableSoil(field) then
            return
        end
        local myPosition = M.getPosition(target)
        local plant = world:createItemFromId(plantID, 1, myPosition, true, 999, {["illusion"] = tostring(Lhor), ["scaling"] = scaling, ["spell"] = spell})
        plant.wear = wear
        lookat.SetSpecialName(plant, texts.plantRootTexts.name.german, texts.plantRootTexts.name.english)
        lookat.SetSpecialDescription(plant, texts.plantRootTexts.description.german, texts.plantRootTexts.description.english)
        world:changeItem(plant)
end

function M.createEntanglingPlant(user, targets, spell)
    local Orl = runes.checkSpellForRuneByName("Orl", spell)
    local SOLH = runes.checkSpellForRuneByName("SOLH", spell)
    local Luk = runes.checkSpellForRuneByName("Luk", spell)

    if Orl then --To prevent overlap of plant and trap, trap as the stronger one takes priority. Trap will instead get plant graphic if this rune is used.
        return
    end

    if not (SOLH and Luk) then
        return
    end

    for _, target in pairs(targets.targets) do
        plantCreation(user, target, spell)
    end

    for _, item in pairs(targets.items) do
        plantCreation(user, item, spell, true)
    end

    for _, pos in pairs(targets.positions) do
        plantCreation(user, pos, spell)
    end
end

function M.applyPlantRootForEntanglingPlant(sourceItem, target)
    local spell = tonumber(sourceItem:getData("spell"))
    local getSpeed = M.getSpeed(false, target, spell, sourceItem)
    local foundEffect, myEffect = target.effects:find(16)
    if not getSpeed then
        return
    end
    if not foundEffect then
        myEffect = LongTimeEffect(16, 10)
        myEffect:addValue("speed", getSpeed)
        myEffect:addValue("remainingSpeed", getSpeed)
        myEffect:addValue("ticks", howManySecondsUntilFullSpeed)
        myEffect:addValue("spell", spell)
        target.effects:addEffect(myEffect)
    else
        local foundRemainingSpeed, remainingSpeed = myEffect:findValue("remainingSpeed")
        if foundRemainingSpeed then
            if getSpeed < remainingSpeed then
                return -- existing slow is already greater than the one that would be applied.
            end
            myEffect:addValue("speed", getSpeed - remainingSpeed)
            myEffect:addValue("remainingSpeed", getSpeed)
            myEffect:addValue("ticks", howManySecondsUntilFullSpeed)
            myEffect:addValue("spell", spell)
            M.addEffect(myEffect, target)
        end
    end
    target:inform(texts.plantRootTexts.entangled.german, texts.plantRootTexts.entangled.english)
end

function M.applyPlantRoot(user, targets, spell, earthTrap)
    local SOLH = runes.checkSpellForRuneByName("SOLH", spell)
    local Qwan = runes.checkSpellForRuneByName("Qwan", spell)
    local Sih = runes.checkSpellForRuneByName("Sih", spell)
    local Tah = runes.checkSpellForRuneByName("Tah", spell)
    local Taur = runes.checkSpellForRuneByName("Taur", spell)
    local Ura = runes.checkSpellForRuneByName("Ura", spell)
    local Yeg = runes.checkSpellForRuneByName("Yeg", spell)
    local rune

    if Taur then
        rune = "Taur"
    elseif Ura then
        rune = "Ura"
    elseif Yeg then
        rune = "Yeg"
    end

    for _, target in pairs(targets.targets) do
        local myEffectNumber = 16
        local TahEffectNumber = 28
        local userEffectNumber = 31
        if Tah then
            myEffectNumber = TahEffectNumber
        end
        local raceBonus
        if rune then
            raceBonus = magicDamage.checkIfRaceBonus(target, rune)
        end
        local getSpeed = M.getSpeed(user, target, spell, earthTrap)
        if SOLH then
            if not getSpeed then
                return
            end
            local foundEffect, myEffect = target.effects:find(myEffectNumber)
            if not foundEffect then
                myEffect = LongTimeEffect(myEffectNumber, 10)
                myEffect:addValue("speed", getSpeed)
                myEffect:addValue("remainingSpeed", getSpeed)
                myEffect:addValue("ticks", howManySecondsUntilFullSpeed)
                myEffect:addValue("spell", spell)
                target.effects:addEffect(myEffect)
            else
                local foundRemainingSpeed, remainingSpeed = myEffect:findValue("remainingSpeed")
                if foundRemainingSpeed then
                        if getSpeed < remainingSpeed then
                            return -- existing slow is already greater than the one that would be applied.
                        end
                    myEffect:addValue("speed", getSpeed - remainingSpeed)
                    myEffect:addValue("remainingSpeed", getSpeed)
                    myEffect:addValue("ticks", howManySecondsUntilFullSpeed)
                    myEffect:addValue("spell", spell)
                    M.addEffect(myEffect, target)
                end
            end
        end
        if Sih and not Tah and SOLH then
            local amountStolen = 20  -- 20% stolen of speed taken from target
                if Qwan then
                    amountStolen = amountStolen + 5
                end
                if raceBonus then
                    amountStolen = amountStolen + 5
                end
            local mySpeed = (getSpeed/100)*amountStolen
            local foundUserEffect, userEffect = user.effects:find(userEffectNumber)
            if not foundUserEffect then
                userEffect = LongTimeEffect(userEffectNumber, 10)
                userEffect:addValue("speed", mySpeed)
                userEffect:addValue("remainingSpeed", mySpeed)
                userEffect:addValue("ticks", howManySecondsUntilFullSpeed)
                userEffect:addValue("spell", spell)
                userEffect:addValue("user", 1)
                user.effects:addEffect(userEffect)
            else
                local foundRemainingSpeed, remainingSpeed = userEffect:findValue("remainingSpeed")
                if foundRemainingSpeed then
                    if mySpeed < remainingSpeed then
                        return -- existing slow is already greater than the one that would be applied.
                    end
                    userEffect:addValue("speed", mySpeed - remainingSpeed)
                    userEffect:addValue("remainingSpeed", mySpeed)
                    userEffect:addValue("ticks", howManySecondsUntilFullSpeed)
                    userEffect:addValue("spell", spell)
                    userEffect:addValue("user", 1)
                    M.addEffect(userEffect, user)
                end
            end
        end
    end
end

function M.addEffect(myEffect, target)
    log("Magic testing: "..tostring(target.name).."'s speed before application of plant root: "..tostring(target.speed))
    local Tah
    local SOLH
    local Sih
    local foundUser, isUser = myEffect:findValue("user")
    local foundSpell, spell = myEffect:findValue("spell")
    if foundUser then
        if 1 == isUser then
            Sih = true
        end
    end
    if foundSpell then
        Tah = runes.checkSpellForRuneByName("Tah", spell)
        SOLH = runes.checkSpellForRuneByName("SOLH", spell)
    end

    local foundSpeed, speed = myEffect:findValue("speed")
    if foundSpeed then
        local speedChange = speed/100 --Divided by 100 because speed is a percentage value due to it being stored as integers.
        if Tah and SOLH then
            speedChange = -speedChange/5 --20% speed given
        end
        if Sih then
            speedChange = -speedChange
        end
        target.speed = target.speed - speedChange
    end
    log("Magic testing: "..tostring(target.name).."'s speed after application of plant root: "..tostring(target.speed))
end

function M.callEffect(myEffect, target)
    local Tah
    local SOLH
    local Sih
    local foundUser, isUser = myEffect:findValue("user")
    local foundSpell, spell = myEffect:findValue("spell")
        if foundSpell then
            Tah = runes.checkSpellForRuneByName("Tah", spell)
            SOLH = runes.checkSpellForRuneByName("SOLH", spell)
        end
        if foundUser then
            if 1 == isUser then
                Sih = true
            end
        end
        local foundRemainingSpeed, remainingSpeed = myEffect:findValue("remainingSpeed")
        local foundTicks, ticks = myEffect:findValue("ticks")
        if foundRemainingSpeed and foundTicks  then
            if ticks >= 1 then
                local speedIncrease = math.floor(remainingSpeed/ticks)
                if remainingSpeed > 0 then
                local newRemainingSpeed
                    if remainingSpeed/ticks < 1 and ticks == 1 then
                        local speedChange = remainingSpeed/100
                        if Tah and SOLH then
                            speedChange = -speedChange/5 --20% speed given
                        end
                        if Sih then
                            speedChange = -speedChange
                        end
                        target.speed = target.speed + speedChange
                        newRemainingSpeed = 0
                    elseif remainingSpeed/ticks > 1 then
                        local speedChange = speedIncrease/100
                        if Tah and SOLH then
                            speedChange = -speedChange/5 --20% speed given
                        end
                        if Sih then
                            speedChange = -speedChange
                        end
                        target.speed = target.speed + speedChange
                        newRemainingSpeed = remainingSpeed - speedIncrease
                    else
                        newRemainingSpeed = remainingSpeed
                    end
                    myEffect:addValue("remainingSpeed", newRemainingSpeed)
                    myEffect:addValue("ticks", ticks-1)
                    myEffect.nextCalled = 10
                    return true
                end
            end
        end
        log("Magic testing: "..tostring(target.name).."'s speed after last call of snare: "..tostring(target.speed))
    return false
end

function M.callEffect(myEffect, target)
    local Tah
    local SOLH
    local Sih
    local foundUser, isUser = myEffect:findValue("user")
    local foundSpell, spell = myEffect:findValue("spell")
    if foundSpell then
        Tah = runes.checkSpellForRuneByName("Tah", spell)
        SOLH = runes.checkSpellForRuneByName("SOLH", spell)
    end
    if foundUser then
        if 1 == isUser then
            Sih = true
        end
    end
    local foundRemainingSpeed, remainingSpeed = myEffect:findValue("remainingSpeed")
    local foundTicks, ticks = myEffect:findValue("ticks")
    if foundRemainingSpeed and foundTicks  then
        if ticks >= 1 then
            local speedIncrease = math.floor(remainingSpeed/ticks)
            if remainingSpeed > 0 then
            local newRemainingSpeed
                if remainingSpeed/ticks < 1 and ticks == 1 then
                    local speedChange = remainingSpeed/100
                    if Tah and SOLH then
                        speedChange = -speedChange/5 --20% speed given
                    end
                    if Sih then
                        speedChange = -speedChange
                    end
                    target.speed = target.speed + speedChange
                    newRemainingSpeed = 0
                elseif remainingSpeed/ticks > 1 then
                    local speedChange = speedIncrease/100
                    if Tah and SOLH then
                        speedChange = -speedChange/5 --20% speed given
                    end
                    if Sih then
                        speedChange = -speedChange
                    end
                    target.speed = target.speed + speedChange
                    newRemainingSpeed = remainingSpeed - speedIncrease
                else
                    newRemainingSpeed = remainingSpeed
                end
                myEffect:addValue("remainingSpeed", newRemainingSpeed)
                myEffect:addValue("ticks", ticks-1)
                myEffect.nextCalled = 10
                return true
            end
        end
    end
    log("Magic testing: "..tostring(target.name).."'s speed after last call of plant root: "..tostring(target.speed))
    return false
end

function M.loadEffect(myEffect, target)
    local Tah
    local SOLH
    local Sih
    local foundUser, isUser = myEffect:findValue("user")
    local foundSpell, spell = myEffect:findValue("spell")
        if foundSpell then
            Tah = runes.checkSpellForRuneByName("Tah", spell)
            SOLH = runes.checkSpellForRuneByName("SOLH", spell)
        end
        if foundUser then
            if 1 == isUser then
                Sih = true
            end
        end
        local foundRemainingSpeed, remainingSpeed = myEffect:findValue("remainingSpeed")
        if foundRemainingSpeed then
            if remainingSpeed > 0 then
                local speedChange = remainingSpeed/100
                if Tah and SOLH then
                    speedChange = -speedChange/5 --20% speed given
                end
                if Sih then
                    speedChange = -speedChange
                end
                target.speed = target.speed - speedChange
                myEffect.nextCalled = 10
            end
        end
    end

return M

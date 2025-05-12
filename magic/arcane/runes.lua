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

local M = {}

--If the effects, costs or cast times of runes change, the in game rune encyclopedia book should be changed to reflect that

M.runes = {
    {id = 1, name = "CUN", cost = "Small", time = "Short", level = 0, active = true},
    {id = 2, name = "JUS", cost = "Small", time = "Short", level = 0, active = true},
    {id = 3, name = "PEN", cost = "Small", time = "Short", level = 0, active = true},
    {id = 4, name = "RA", cost = "Small", time = "Short", level = 0, active = true, auto = true},
    {id = 5, name = "SOLH", cost = "Small", time = "Short", level = 0, active = true},
    {id = 6, name = "BHONA", cost = "Small", time = "Short", level = 80, active = false, auto = true}, --While the others check for highest level skill, BHONA requires an _average_ of 80 between all five element skills
    {id = 7, name = "ANTH", cost = "Small", time = "Short", level = 10, active = true, auto = true},
    {id = 8, name = "DUN", cost = "Large", time = "Long", level = 90, active = false, auto = true},
    {id = 9, name = "FHAN", cost = "Large", time = "Long", level = 90, active = false, auto = true},
    {id = 10, name = "FHEN", cost = "Small", time = "Short", level = 20, active = true, auto = true},
    {id = 11, name = "HEPT", cost = "Medium", time = "Medium", level = 30, active = true, auto = true},
    {id = 12, name = "IRA", cost = "Medium", time = "Medium", level = 40, active = true, auto = true},
    {id = 13, name = "KAH", cost = "Small", time = "Short", level = 20, active = true, auto = true},
    {id = 14, name = "KEL", cost = "Large", time = "Long", level = 100, active = false, auto = true},
    {id = 15, name = "LEV", cost = "Small", time = "Short", level = 10, active = true, auto = true},
    {id = 16, name = "LHOR", cost = "Small", time = "Short", level = 30, active = false, auto = true},
    {id = 17, name = "LUK", cost = "Medium", time = "Medium", level = 70, active = false, auto = true},
    {id = 18, name = "MES", cost = "Small", time = "Short", level = 20, active = true},
    {id = 19, name = "ORL", cost = "Large", time = "Long", level = 80, active = false, auto = true},
    {id = 20, name = "PHERC", cost = "Medium", time = "Medium", level = 60, active = false, auto = true},
    {id = 21, name = "QWAN", cost = "Large", time = "Long", level = 100, active = false, auto = true},
    {id = 22, name = "SAV", cost = "Medium", time = "Medium", level = 40, active = false, auto = true},
    {id = 23, name = "SIH", cost = "Large", time = "Long", level = 80, active = false, auto = true},
    {id = 24, name = "SUL", cost = "Medium", time = "Medium", level = 50, active = false, auto = true},
    {id = 25, name = "TAH", cost = "Medium", time = "Medium", level = 50, active = false, auto = true},
    {id = 26, name = "TAUR", cost = "Medium", time = "Medium", level = 60, active = false, auto = true},
    {id = 27, name = "URA", cost = "Medium", time = "Medium", level = 70, active = false, auto = true},
    {id = 28, name = "YEG", cost = "Medium", time = "Medium", level = 70, active = false, auto = true},
    {id = 29, name = "PERA", cost = "Small", time = "Short", level = 10, active = true, auto = true}
}

function M.isSpellAutoCast(spell)

    local notFire = false

    local runeCount = 0

    for _, rune in pairs(M.runes) do

        local runeIsInSpell = M.checkSpellForRune(rune.id, spell)

        if runeIsInSpell then
            runeCount = runeCount + 1
        end

        if runeIsInSpell and not notFire then
            notFire = rune.name == "PEN" or rune.name == "SOLH" or rune.name == "JUS" or rune.name == "CUN"
        end

        if runeIsInSpell and not rune.auto and not (notFire and runeCount == 1) then
            return false
        end

        if runeCount > 1 and notFire then
            return false
        end
    end

    return true
end



function M.runeNameToNumber(runeName)
    for _, rune in pairs(M.runes) do
        if runeName == rune.name then
            return rune.id
        end
    end

    debug("Error: Invalid rune name provided to runeNameToNumber function!")

    return nil
end

function M.runeNumberToName(runeNumber)
    for _, rune in pairs(M.runes) do
        if runeNumber == rune.id then
            return rune.name
        end
    end

    debug("Error: Invalid rune id provided to runeNumberToName function!")

    return nil
end

function M.runeNumberToTime(runeNumber)
    for _, rune in pairs(M.runes) do
        if runeNumber == rune.id then
            return rune.time
        end
    end

    debug("Error: Invalid rune id provided to runeNumberToTime function!")

    return nil
end

function M.runeNumberToCost(runeNumber)
    for _, rune in pairs(M.runes) do
        if runeNumber == rune.id then
            return rune.cost
        end
    end

    debug("Error: Invalid rune id provided to runeNumberToCost function!")

    return nil
end

function M.getStatRequirementOfRune(runeNumber)

    if runeNumber == 6 then
        return 50 --Only the most dedicated mage character can become teachers, requiring a minimum of 50 total mage stats
    end

    local costToStatReq = {
        {cost = "Large", stat = 45},
        {cost = "Medium", stat = 40},
        {cost = "Small", stat = 30}
    }

    for _, rune in pairs(M.runes) do
        if rune.id == runeNumber then
            for _, statReq in pairs(costToStatReq) do
                if rune.cost == statReq.cost then
                    return statReq.stat
                end
            end
        end
    end

    debug("Error: Invalid rune id provided to getStatRequirementOfRune function!")

    return nil

end

function M.getLevelRequirementOfRune(runeNumber)

    for _, rune in pairs(M.runes) do
        if rune.id == runeNumber then
            return rune.level
        end
    end

    debug("Error: Invalid rune id provided to getLevelRequirementOfRune function!")

    return nil
end

function M.learnedrunesToQuestprogress(runeNumber)

    if runeNumber < 2^31 then

        return runeNumber

    else

        return 2^31 - 1 - runeNumber

    end

end

function M.QuestprogressToLearnedrunes(questprogress)

    if tonumber(questprogress) < 0 then

        return 2^31 - 1 - tonumber(questprogress)

    else

        return tonumber(questprogress)

    end

end

local function isRuneActive(runeNumber)

    for _, rune in pairs(M.runes) do
        if runeNumber == rune.id then
            return rune.active
        end
    end

    debug("Error: Invalid rune id provided to isRuneActive function!")

    return nil
end

function M.checkIfLearnedRune(user, targetItem, runeNumber, questorspell, spellNumber, spell)

    if not isRuneActive(runeNumber) then
        return false
    end

    local learnedrunes

    local runeOffset = math.fmod(runeNumber - 1, 32)

    if not spell then
        if questorspell == "isQuest" then --The original purpose of this function, checking if the player knows the rune
            spell = user:getQuestProgress(51)
        elseif questorspell == "isSpell" then -- The secondary purpose of this function, does the spell contain the rune.
            spell = targetItem:getData(spellNumber)
        end
    end

    if not common.IsNilOrEmpty(spell) then
        learnedrunes = M.QuestprogressToLearnedrunes(spell)
    else
        debug("Error: No form of spell id was provided to checkIfLearnedRune.")
        return nil
    end

    if bit32.btest(bit32.lshift(1, runeOffset), learnedrunes) then
        return true
    end

    return false

end

function M.checkSpellForRune(runeNumber, spell)
    -- Merely simplifies the below input using the function directly above
    return M.checkIfLearnedRune(false, false, runeNumber, false, false, spell)

end

function M.checkSpellForLightning(spell)

    local okrunes = {"JUS", "PHERC", "ORL", "HEPT", "IRA", "LHOR", "ORL", "SIH", "TAUR", "URA", "YEG", "PERA", "DUN", "MES", "SUL"}

    if not M.checkSpellForRuneByName("PHERC", spell) or not M.checkSpellForRuneByName("JUS", spell) then
        return false --It's not a lightning spell
    end

    -- It contains the runes for lightning, but runes not listed in the okrunes table are not compatible with that graphic so we check

    for _, rune in pairs(M.runes) do

        if M.checkSpellForRuneByName(rune.name, spell) then

            -- The spell has this rune in it, so we proceed with further checks

            local ret = true

            for _, okrune in pairs(okrunes) do -- We check if this rune tolerates lightning
                if okrune == rune.name then
                    ret = false
                end
            end

            if ret then
                return false -- It does not tolerate lightning
            end
        end
    end

    return true -- It has the runes for lightning and no runes that do not fit with the lightning effect
end

function M.checkSpellForMoreThanJUSMes(spell)

    for _, rune in pairs(M.runes) do

        if rune.name ~= "JUS" and rune.name ~= "MES" and rune.name ~= "ORL" then -- ORL is also accepted as it just repeats the given runes, in this case JUS MES

            if M.checkSpellForRuneByName(rune.name, spell) then

                return true

            end
        end
    end

    return false
end

function M.checkSpellForMoreThanJUSSav(spell)

    -- Prevents GFX and SFX being played if there's nothing happening

    local SAV = M.checkSpellForRuneByName("SAV", spell)

    if not SAV then
        return true -- SAV not applied, so GFX and SFX should take place
    end

    for _, rune in pairs(M.runes) do

        if rune.name ~= "SAV" and rune.name ~= "JUS" and rune.name ~= "ORL" then
            if M.checkSpellForRuneByName(rune.name, spell) then
                return true -- The spell contains more than SAV, JUS and ORL, so GFX and SFX should take place
            end
        end
    end

    return false -- The spell only contains a combination of JUS, SAV and ORL. No GFX or SFX is to take place.
end

function M.checkSpellForRuneByName(runeName, spell)

    for _, rune in pairs(M.runes) do
        if rune.name == runeName then
            return M.checkSpellForRune(rune.id, spell)
        end
    end

end

function M.learnRune(user, targetItem, runeNumber, questorspell, spellnumber)

    local runeOffset = math.fmod(runeNumber - 1, 32)

    if questorspell == "isQuest" then -- The character is learning the rune

        local learnedrunes = M.QuestprogressToLearnedrunes(user:getQuestProgress(51))

        user:setQuestProgress(51, M.learnedrunesToQuestprogress(bit32.bor(2^runeOffset, learnedrunes)))

    elseif questorspell == "isSpell" then --We are adding a rune to a spell stored in a grimoire

        local learnedrunes = M.QuestprogressToLearnedrunes(targetItem:getData(spellnumber))

        targetItem:setData(spellnumber, M.learnedrunesToQuestprogress(bit32.bor(2^runeOffset, learnedrunes)))

        targetItem:setData("owner", user.name)

        world:changeItem(targetItem)

    elseif questorspell == "neither" then --When this is specified, it just takes the old spell number and adds the new rune to it, then provides the new spell no questions asked

        local spell = spellnumber

        local newSpell = M.learnedrunesToQuestprogress(bit32.bor(2^runeOffset, spell))

        return newSpell
    end
end

function M.fetchElement(spell)

    if M.checkSpellForRuneByName("RA", spell) then
        return "Fire"
    end

    if M.checkSpellForRuneByName("SOLH", spell) then
        return "Earth"
    end

    if M.checkSpellForRuneByName("CUN", spell) then
        return "Water"
    end

    if M.checkSpellForRuneByName("JUS", spell) then
        return "Air"
    end

    if M.checkSpellForRuneByName("PEN", spell) then
        return "Spirit"
    end

    debug("Error: The function fetchElement was invoked on a spell that does not have any primary runes selected.")

    return nil
end

--GM tool functions:

function M.teachAllRunes(user, target)

    for _, rune in pairs(M.runes) do
        if not M.checkIfLearnedRune(target, false, rune.id, "isQuest") then
            M.learnRune(target, false, rune.id, "isQuest")
        end
    end

    user:inform(target.name.." now knows all runes.")
    user:logAdmin(user.name.." has taught all runes to "..target.name)

end

function M.chooseRuneToTeach(user, target)

    local callback = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end

        local index = dialog:getSelectedIndex() + 1

        local skippedrunes = 0

        for _, rune in ipairs(M.runes) do
            if M.checkIfLearnedRune(target, false, rune.id, "isQuest") then
                skippedrunes = skippedrunes + 1
            elseif index == rune.id - skippedrunes then
                M.learnRune(target, false, rune.id, "isQuest")
                user:inform("You taught "..rune.name.." to "..target.name)
                user:logAdmin(user.name.." has taught the rune "..rune.name.." to "..target.name)
            end
        end
    end
    local dialog = SelectionDialog("runes", "Select a rune to teach", callback)

    local unknownrunes = 0

    for _, rune in ipairs(M.runes) do
        if not M.checkIfLearnedRune(target, false, rune.id, "isQuest") then
            dialog:addOption(0, rune.name)
            unknownrunes = unknownrunes + 1
        end
    end

    if unknownrunes > 0 then
        user:requestSelectionDialog(dialog)
    else
        user:inform(target.name.." already knows all runes.")
    end

end

return M

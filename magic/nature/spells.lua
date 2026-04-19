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

--[[
    id -> the integer used to identify a spell when learning or checking if you have already learned a spell
    name -> The name of the spell, you can speak it out loud to cast it
    skill -> the associated nature skill, used for skill gain and to determine if high enough level
    sigil -> the name of the sigil used to cast the spell, must be an exact match to the English name in weavers_stump.lua
    charges -> How many charges of a sigil is expended to cast the spell
    active -> A boolean flag that can be set to false to easily disable a spell if it is bugged and needs to be disabled until a fix can be put in place
]]

local spells = {
    {id = 1, name = "Toxgwynt", skill = Character.witherweave, level = 0, sigil = "Basic Witherweave Sigil", mana = "Small", time = "Short", charges = 1, statReq = 30, active = true}, -- Inflict DoT Poison
    {id = 2, name = "Sergwynt", skill = Character.witherweave, level = 10, sigil = "Basic Witherweave Sigil", mana = "Small", time = "Short", charges = 1, statReq = 30, active = true}, -- Cure Poison
    {id = 3, name = "Seegwynt", skill = Character.bloomweave, level = 0, sigil = "Basic Bloomweave Sigil", mana = "Small", time = "Short", charges = 1, statReq = 30, active = true}, -- Plant seedling
    {id = 4, name = "Entangwynt", skill = Character.bloomweave, level = 10, sigil = "Basic Bloomweave Sigil", mana = "Small", time = "Short", charges = 1, statReq = 30, active = true}, -- Slowing vines
    {id = 5, name = "Akingwynt", skill = Character.wildweave, level = 0, sigil = "Basic Wildweave Sigil", mana = "Small", time = "Short", charges = 1, statReq = 30, active = true}, -- Commune with beast
    {id = 6, name = "Incigwynt", skill = Character.wildweave, level = 10, sigil = "Basic Wildweave Sigil", mana = "Small", time = "Short", charges = 1, statReq = 30, active = true}, -- Weapon DoT in style of communed beast
    {id = 7, name = "Echogwynt", skill = Character.stoneweave, level = 0, sigil = "Basic Stoneweave Sigil", mana = "Small", time = "Short", charges = 1, statReq = 30, active = true}, -- Place rune stones
    {id = 8, name = "Rebugwynt", skill = Character.stoneweave, level = 10, sigil = "Basic Stoneweave Sigil", mana = "Small", time = "Short", charges = 1, statReq = 30, active = true}, -- non-poison DoT
    {id = 9, name = "Whisgwynt", skill = Character.deepweave, level = 0, sigil = "Basic Deepweave Sigil", mana = "Small", time = "Short", charges = 1, statReq = 30, active = true}, -- Plant a whisper
    {id = 10, name = "Pulsegwynt", skill = Character.deepweave, level = 10, sigil = "Basic Deepweave Sigil", mana = "Medium", time = "Long", charges = 5, statReq = 30, active = true}, -- Bond with a target, sharing damage taken
}

M.spells = spells

function M.getUnlearnedSpells(user)

    local retTable = {}

    for _, spell in pairs(spells) do
        if spell.active and not M.checkIfLearnedSpell(user, spell.name) then
            table.insert(retTable, spell)
        end
    end

    return retTable
end

function M.getSpellValuesFromName(spellName)
    for _, spell in pairs(spells) do
        if spellName == spell.name then
            return spell
        end
    end
end

function M.learnedspellsToQuestprogress(spellNumber)

    if spellNumber < 2^31 then

        return spellNumber

    else

        return 2^31 - 1 - spellNumber

    end

end

function M.QuestprogressToLearnedspells(questprogress)

    if tonumber(questprogress) < 0 then

        return 2^31 - 1 - tonumber(questprogress)

    else

        return tonumber(questprogress)

    end

end

local learningId = 931 --Starts at 931, reserved up to 940

function M.checkIfLearnedSpell(user, spellName)

    local spell = M.getSpellValuesFromName(spellName)

    if not spell.active then
        return false
    end

    local learned = common.readBitwise(user, spell.id, learningId)

    return learned

end

function M.learnSpell(user, spellName)

    local spell = M.getSpellValuesFromName(spellName)

    if not M.checkIfLearnedSpell(user, spellName) then

        common.writeBitwise(user, spell.id, learningId)
    end
end

function M.getKnownSpells(user)

    local knownSpells = {}

    for _, spell in pairs(spells) do
        if M.checkIfLearnedSpell(user, spell.name) then
            table.insert(knownSpells, {name = spell.name, skill = spell.skill})
        end
    end

    return knownSpells
end

function M.statReqMet(user, spellName)

    local values = M.getSpellValuesFromName(spellName)

    local statTotal = user:increaseAttrib("perception",0) + user:increaseAttrib("essence",0) + user:increaseAttrib("intelligence",0)

    if values.statReq > statTotal then
        return false
    end

    return true
end

function M.skillCriteriaMet(user, spellName)

    local values = M.getSpellValuesFromName(spellName)

    local skillName = user:getSkillName(values.skill)
    local skillLevel = user:getSkill(values.skill)

    if skillLevel >= values.level then
        return true
    end

    return false, skillLevel, skillName
end

function M.checkForDruidWeave(user, spokenWords)

    for _, spell in pairs(spells) do
        local found = string.find(spokenWords, spell.name)
        if found then
            return spell.name
        end
    end

    return false
end

return M

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
local createSpell = require("magic.arcane.createSpell")
local texts = require("magic.arcane.base.texts")

local M = {}

local myTexts = texts.magicBookTexts

local function checkIfCompleteSpells(user, SourceItem)
    for i = 1,createSpell.MAX_SPELL_SLOTS do
        if SourceItem:getData("spellName"..i) ~= "" and SourceItem:getData("spellName"..i) ~= texts.createSpellTexts.unfinished.english and SourceItem:getData("spellName"..i) ~= texts.createSpellTexts.unfinished.german then
            return true
        elseif i == createSpell.MAX_SPELL_SLOTS then
            return false
        end
    end
end
function M.spellSelection(user, SourceItem)
    local spellQuestStatus
    if SourceItem:getData("owner") == "" then
        user:inform(myTexts.empty.german, myTexts.empty.english)
        return
    end
    if SourceItem:getData("owner") ~= user.name then
        user:inform(myTexts.inane.german, myTexts.inane.english)
        return
    end
    local emptySpellSlots = 0
    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        end
        local index = dialog:getSelectedIndex() +1
        for i = 1,createSpell.MAX_SPELL_SLOTS do
            local spellName = SourceItem:getData("spellName"..i)
            if spellName ~= "" and spellName ~= texts.createSpellTexts.unfinished.english and spellName ~= texts.createSpellTexts.unfinished.german then
                if index == i-emptySpellSlots then
                    spellQuestStatus = SourceItem:getData("spell"..i)
                    user:setQuestProgress(7001,tonumber(spellQuestStatus))
                    user:inform(myTexts.primed.german..spellName..".",myTexts.primed.english..spellName..".")
                    return
                end
            else
                emptySpellSlots = emptySpellSlots+1
            end
        end
    end
    local dialog = SelectionDialog(common.GetNLS(user,myTexts.selection.german,myTexts.selection.english), common.GetNLS(user, myTexts.select.german, myTexts.select.english), callback)
    for i = 1,createSpell.MAX_SPELL_SLOTS do
        if SourceItem:getData("spellName"..i) ~= "" and SourceItem:getData("spellName"..i) ~= texts.createSpellTexts.unfinished.english and SourceItem:getData("spellName"..i) ~= texts.createSpellTexts.unfinished.german then
            dialog:addOption(0,SourceItem:getData("spellName"..i))
        end
    end
    if checkIfCompleteSpells(user, SourceItem) then
        user:requestSelectionDialog(dialog)
    else
        user:inform(myTexts.incomplete.german,myTexts.incomplete.english)
    end
end
function M.mainSelectionDialog(user, SourceItem)
    local intelligence = user:increaseAttrib("intelligence", 0)
    local essence = user:increaseAttrib("essence", 0)
    local willpower = user:increaseAttrib("willpower", 0)
    local attributeSum = (intelligence + essence + willpower)
    if attributeSum < 30 or user:getMagicType() ~= 0 or user:getQuestProgress(37) == 0 then
        user:inform(myTexts.nonsense.german,myTexts.nonsense.english)
        return
    end
    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        end
        local index = dialog:getSelectedIndex() +1
        if index == 1 then
            user:setQuestProgress(7009, 0)
            M.spellSelection(user, SourceItem)
        elseif index == 2 then
            user:setQuestProgress(7001, 0)
            user:setQuestProgress(7009, 0)
            user:inform(myTexts.glyphWand.german, myTexts.glyphWand.english)
        elseif index == 3 then
            user:setQuestProgress(7009, 1)
            user:inform(myTexts.spatialAttune.german, myTexts.spatialAttune.english)
        end
    end
    local dialog = SelectionDialog(common.GetNLS(user,myTexts.priming.german,myTexts.priming.english), common.GetNLS(user,myTexts.type.german,myTexts.type.english), callback)
    dialog:addOption(0,common.GetNLS(user, myTexts.spells.german, myTexts.spells.english))
    dialog:addOption(0,common.GetNLS(user, myTexts.wandGlyph.german, myTexts.wandGlyph.english))
    dialog:addOption(0,common.GetNLS(user, myTexts.spatial.german, myTexts.spatial.english))
    user:requestSelectionDialog(dialog)
end
return M

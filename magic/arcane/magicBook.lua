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

local M = {}
local function checkIfCompleteSpells(User, SourceItem)
    for i = 1,createSpell.MAX_SPELL_SLOTS do
        if SourceItem:getData("spellName"..i) ~= "" and SourceItem:getData("spellName"..i) ~= "Unfinished" then
            return true
        elseif i == createSpell.MAX_SPELL_SLOTS then
            return false
        end
    end
end
function M.spellSelection(User, SourceItem)
local spellQuestStatus
    if SourceItem:getData("owner") == "" then
        User:inform("","The spell list is empty. Perhaps you could fill it in at a desk?")
        return
    end
    if SourceItem:getData("owner") ~= User.name then
        User:inform("","All you can see are the inane scribbles made by someone else. They make no sense to you!")
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
            if spellName ~= "" and spellName ~= "Unfinished" then
                if index == i-emptySpellSlots then
                    spellQuestStatus = SourceItem:getData("spell"..i)
                    User:setQuestProgress(7002,0)
                    User:setQuestProgress(7001,tonumber(spellQuestStatus))
                    User:inform("","Wand primed for the spell: "..spellName..".")
                    return
                end
            else
                emptySpellSlots = emptySpellSlots+1
            end
        end
    end
    local dialog = SelectionDialog(common.GetNLS(User,"","Spell Selection"), common.GetNLS(User,"","Select which spell you want to cast."), callback)
    for i = 1,createSpell.MAX_SPELL_SLOTS do
        if SourceItem:getData("spellName"..i) ~= "" and SourceItem:getData("spellName"..i) ~= "Unfinished" then
            dialog:addOption(0,SourceItem:getData("spellName"..i))
        end
    end
    if checkIfCompleteSpells(User, SourceItem) then
        User:requestSelectionDialog(dialog)
    else
        User:inform("","The spellbook has no complete spells in it for you to cast.")
    end
end
function M.mainSelectionDialog(User, SourceItem)
local intelligence = User:increaseAttrib("intelligence", 0)
local essence = User:increaseAttrib("essence", 0)
local willpower = User:increaseAttrib("willpower", 0)
local attributeSum = (intelligence + essence + willpower)
    if attributeSum < 30 or User:getMagicType() ~= 0 or User:getQuestProgress(37) == 0 then
        User:inform("","All you can see are nonsenical scribbles. Wait, did that line just move? This may be beyond your ability to understand.")
        return
    end
    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        end
        local index = dialog:getSelectedIndex() +1
        if index == 1 then
            M.spellSelection(User, SourceItem)
        elseif index == 2 then
            User:setQuestProgress(7001, 0)
            User:inform("","Wand primed for wand magic & glyph forging.")
        end
    end
local dialog = SelectionDialog(common.GetNLS(User,"","Wand priming"), common.GetNLS(User,"","Select what type of magic you want your wand primed to."), callback)
dialog:addOption(0,"Spells")
dialog:addOption(0,"Wand Magic & Glyph Forging")
User:requestSelectionDialog(dialog)
end
return M

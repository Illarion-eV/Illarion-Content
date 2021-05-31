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
local createSpell = require("magic.createSpell")

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
local intelligence = User:increaseAttrib("intelligence", 0)
local essence = User:increaseAttrib("essence", 0)
local willpower = User:increaseAttrib("willpower", 0)
local attributeSum = (intelligence + essence + willpower)
    if SourceItem.itempos ~= 5 and SourceItem.itempos ~= 6 then
        User:inform("","You must hold the book in your hand.")
        return
    end
    if attributeSum < 30 or User:getMagicType() ~= 0 or User:getQuestProgress(37) == 0 then
        User:inform("","All you can see are nonsenical scribbles. Wait, did that line just move? This may be beyond your ability to understand.")
        return
    end
    if SourceItem:getData("owner") == "" then
        User:inform("","The book is empty. Perhaps you could fill it in at a desk?")
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
            if SourceItem:getData("spellName"..i) ~= "" and SourceItem:getData("spellName"..i) ~= "Unfinished" then
                if index == i-emptySpellSlots then
                    debug("Spell "..i.." is cast.")-- insert a function here for casting spells based on value found here: SourceItem:getData("spell"..i)
                end
                return
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
return M

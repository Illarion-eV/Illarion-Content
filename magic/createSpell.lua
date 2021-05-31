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
local runes = require("magic.runes")
local magic = require("base.magic")

local M = {}
M.MAX_SPELL_SLOTS = 5
--[[The above max slot number has not been tested with higher amounts; Can one single item hold infinite datavalues?
That would be the only limit, as each spell stores a datavalue for name and spell ID, and the magic book also has
two values by default to determine that it is a magic book and to determine the owner.
Makes for a total of 12 stored datavalues with the limit set to 5.
]]

local function getMagicBook(User)
    local leftItem = User:getItemAt(5)
    local rightItem = User:getItemAt(6)
    if leftItem.id == 2619 then
        return leftItem
    elseif rightItem.id == 2619 then
        return rightItem
    end
end
local function primaryElementCheck(User, TargetItem, slot)
    for i = 1,5 do
        if runes.checkIfLearnedRune(User, TargetItem, i, "isSpell", "spell"..slot) then
            return false
        elseif i == 5 then
            return true
        end
    end
end
local function checkIfKnowsAnyMinorRune(User)
    for i = 6, #runes.Runes do -- for every minor rune
        if runes.checkIfLearnedRune(User,"", i, "isQuest") then
            return true
        elseif i == #runes.Runes then
            return false
        end
    end
end
local function checkForDialogOptions(User, TargetItem, slot) -- Check if there are any minor runes that can be selected
    for i = 6, #runes.Runes do -- For every minor rune
        if runes.checkIfLearnedRune(User,"", i, "isQuest") and (not runes.checkIfLearnedRune(User, TargetItem, i, "isSpell", "spell"..slot)) then -- check if user knows rune and if rune is already part of spell being created
            return true
        elseif i == #runes.Runes then
            return false
        end
    end
end
local function checkForDialogOptions2(User) -- Check if there are any primary runes that can be selected
    for i = 1,5 do -- For every primary rune
        if runes.checkIfLearnedRune(User,"", i, "isQuest") then -- check if user knows rune
            return true
        elseif i == 5 then
            return false
        end
    end
end
local function createSpell(User, TargetItem, slot)
    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        end
        local index = dialog:getSelectedIndex() +1
        local unknownRunes = "5" --Counter for runes that are unknown or already in use, starting at the first rune after elemental ones
        for i = 6, #runes.Runes do -- For every rune
            if runes.checkIfLearnedRune(User,"", i, "isQuest") and (not runes.checkIfLearnedRune(User, TargetItem, i, "isSpell", "spell"..slot)) then -- check if user knows rune and if rune is already part of spell being created
                if index == i-unknownRunes then -- Check if selected index is the rune in question
                    if  magic.hasSufficientMana(User,3000) then
                        User:increaseAttrib("mana", -3000)
                        world:gfx(41,User.pos)
                        world:makeSound(13,User.pos)
                        runes.learnRune(User, TargetItem, i, "isSpell", "spell"..slot) -- Add rune to spell
                        M.spellCreationSelectionMenu(User, TargetItem, slot)
                        User:inform("","The rune "..runes.Runes[i][2].." has been added to the spell.")
                    else
                        User:inform("","Not enough mana.")
                        M.spellCreationSelectionMenu(User, TargetItem, slot)
                    end
                end
            else
                unknownRunes = unknownRunes+1 -- For every rune that the user has not learned or is already part of the spell, the index numbering is corrected.
            end
        end
    end
    local dialog = SelectionDialog(common.GetNLS(User,"","Spell Creation"), common.GetNLS(User,"","Select which rune you want to add to your spell."), callback)
    for i = 6, #runes.Runes do -- For every rune
        if runes.checkIfLearnedRune(User,"", i, "isQuest") and (not runes.checkIfLearnedRune(User, TargetItem, i, "isSpell", "spell"..slot)) then -- check if user knows rune and if rune is already part of spell being created
            dialog:addOption(0,runes.Runes[i][2])
        end
    end
    if not checkIfKnowsAnyMinorRune(User) then -- If you do not know any runes
        M.spellCreationSelectionMenu(User, TargetItem, slot)
        User:inform("","You must first learn how to use any minor rune before you can add it to your spell.")
    elseif not checkForDialogOptions(User, TargetItem, slot) then
        M.spellCreationSelectionMenu(User, TargetItem, slot)
        User:inform("","You do not know any more runes that can be added to the spell.")
    else
        User:requestSelectionDialog(dialog)
    end
end
local function elementSelection(User, TargetItem, slot)
local unknownRunes = "0"
    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        end
        local index = dialog:getSelectedIndex() +1
        for i = 1,5 do
            if runes.checkIfLearnedRune(User,"", i, "isQuest") then
                if index == i-unknownRunes then
                    if  magic.hasSufficientMana(User,3000) then
                        User:increaseAttrib("mana", -3000)
                        world:gfx(41,User.pos)
                        world:makeSound(13,User.pos)
                        runes.learnRune(User, TargetItem, i, "isSpell", "spell"..slot)
                        M.spellCreationSelectionMenu(User, TargetItem, slot)
                        User:inform("","The rune "..runes.Runes[i][2].." has been added as the primary rune of the spell..")
                    else
                        User:inform("","Not enough mana.")
                        M.spellCreationSelectionMenu(User, TargetItem, slot)
                    end
                end
                return
            else
                unknownRunes = unknownRunes+1
            end
        end
    end
    local dialog = SelectionDialog(common.GetNLS(User,"","Spell Creation"), common.GetNLS(User,"","Select a primary rune for your spell."), callback)
    for i = 1,5 do
        if runes.checkIfLearnedRune(User,"", i, "isQuest") then
            dialog:addOption(0, runes.Runes[i][2])
        end
    end
User:requestSelectionDialog(dialog)
end
local function nameSpell(User, TargetItem, slot)
    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        end
        local input = dialog:getInput()
        TargetItem:setData("spellName"..slot,input) -- Set name for spell
        world:changeItem(TargetItem) -- save name for spell
        User:inform("","You name the spell in spell slot "..slot.. ": "..input..".")
    end
User:requestInputDialog(InputDialog("Spell Creation","Name your spell.",false,255,callback))
end
function M.spellCreationSelectionMenu(User, TargetItem, slot)
    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        end
        local index = dialog:getSelectedIndex() +1
        if index == 1 and primaryElementCheck(User, TargetItem, slot) then
            elementSelection(User,TargetItem, slot)
        elseif index == 1 then
            createSpell(User, TargetItem, slot)
        elseif index == 2 then
            nameSpell(User, TargetItem, slot)
        end
    end
    local dialog = SelectionDialog(common.GetNLS(User,"","Spell Creation"), common.GetNLS(User,"","Pick an option."), callback)
    dialog:addOption(0, "Add rune")
    dialog:addOption(0, "Finish spell")
User:requestSelectionDialog(dialog)
end
local function overWriteConfirmation(User, TargetItem, slot)
    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        end
        local index = dialog:getSelectedIndex() +1
        if index == 1 then
            TargetItem:setData("spell"..slot,"0") -- Reset the spell slot
            TargetItem:setData("spellName"..slot,"Unfinished") -- Remove old spell name
            world:changeItem(TargetItem) -- Save the changes above
            M.spellCreationSelectionMenu(User, TargetItem, slot)
        elseif index == 2 then
            M.slotSelection(User)
        end
    end
    local dialog = SelectionDialog(common.GetNLS(User,"","Spell Creation"), common.GetNLS(User,"","This  spell slot is already in use.\nAre you sure you want to overwrite the selected spell slot?"), callback)
    dialog:addOption(0, "Yes, overwrite it.")
    dialog:addOption(0, "No, select another slot.")
    User:requestSelectionDialog(dialog)
end
local function slotSelection(User)
local mBook = getMagicBook(User)
    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        end
        local index = dialog:getSelectedIndex() +1
        for i = 1,M.MAX_SPELL_SLOTS do
            if index == i and (mBook:getData("spellName"..i) ~= "Unfinished") and (mBook:getData("spellName"..i) ~= "") then
                overWriteConfirmation(User, mBook, i)
                return
            elseif index == i and (mBook:getData("spellName"..i) == "Unfinished") then
                M.spellCreationSelectionMenu(User, mBook, i)
            elseif index == i then
                mBook:setData("spellName"..i,"Unfinished") -- Remove old spell name
                mBook:setData("spell"..i,"0") -- Set a blank value for spell so it doesn't end up being NIL
                world:changeItem(mBook) -- Save the changes above
                M.spellCreationSelectionMenu(User, mBook, i)
            end
        end
    end
    local dialog = SelectionDialog(common.GetNLS(User,"","Spell Creation"), common.GetNLS(User,"","Select which spell slot you want to store a spell in."), callback)
    for i = 1,M.MAX_SPELL_SLOTS do
        if (mBook:getData("spellName"..i) ~= "") then
            dialog:addOption(0,"Spell Slot "..i.."("..mBook:getData("spellName"..i)..")")
        else
            dialog:addOption(0,"Spell Slot "..i.."(Empty)")
        end
    end
    User:requestSelectionDialog(dialog)
end
local function learnRunesAdmin(User)
    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        end
        local index = dialog:getSelectedIndex() +1
        local knownRunes = "0" --Counter for runes that are already known
        for i = 1, #runes.Runes do -- For every rune
            if not runes.checkIfLearnedRune(User,"", i, "isQuest") then -- check if user doesn't know rune
                if index == i-knownRunes then -- Check if selected index is the rune in question
                    runes.learnRune(User,"", i, "isQuest") -- Learn rune
                    User:requestSelectionDialog(dialog) -- Allow you to select another rune to learn
                end
            else
                knownRunes = knownRunes+1 -- For every rune that the user has not learned or is already part of the spell, the index numbering is corrected.
            end
        end
    end
    local dialog = SelectionDialog(common.GetNLS(User,"","Spell Creation"), common.GetNLS(User,"","Select which rune you want to add to your spell."), callback)
    for i = 1, #runes.Runes do -- For every rune
        if not runes.checkIfLearnedRune(User,"", i, "isQuest") then -- check if user doesn't know rune
            dialog:addOption(0,runes.Runes[i][2])
        end
    end
    User:requestSelectionDialog(dialog)
end
local function unLearnAllRunesAdmin(User)
    User:setQuestProgress(7000, 0)
    User:inform("","You've lost all knowledge of magic runes that you used to have.")
end
local function dispenseMagicBookAdmin(User)
    common.CreateItem(User,2619,1,999,{["magicBook"]="true"})
    User:inform("","Book dispensed.")
end
function M.mainDialog(User)
    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        end
        local index = dialog:getSelectedIndex() +1
        if index == 1 then
            if checkForDialogOptions2(User) then
                if User:countItemAt("body",2619,{["magicBook"]="true"}) ~= 0 and User:countItemAt("body",463) ~= 0 then
                    slotSelection(User)
                else
                    User:inform("","You must hold a magic book and quill in your hands.")
                end
            else
                User:inform("","You must first learn how to use a primary rune before you can create a spell.")
            end
        elseif index == 2 and User:isAdmin() then
            learnRunesAdmin(User)
        elseif index == 3 and User:isAdmin() then
            unLearnAllRunesAdmin(User)
        elseif index == 4 and User:isAdmin() then
            dispenseMagicBookAdmin(User)
        end
    end
    local dialog = SelectionDialog(common.GetNLS(User,"","Spell Creation"), common.GetNLS(User,"","Pick an option."), callback)
    dialog:addOption(0, "Create a spell")
    if User:isAdmin() then
        dialog:addOption(0, "Learn runes(admin only)")
        dialog:addOption(0, "Unlearn all runes (admin only)")
        dialog:addOption(0, "Dispense Spellbook (admin only)")
    end
    User:requestSelectionDialog(dialog)
end
return M

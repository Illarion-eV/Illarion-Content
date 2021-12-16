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
local runes = require("magic.arcane.runes")
local magic = require("base.magic")

local M = {}
M.MAX_SPELL_SLOTS = 20

local function getMagicBook(user)
    local leftItem = user:getItemAt(5)
    local rightItem = user:getItemAt(6)
    if leftItem.id == 2619 then
        return leftItem
    elseif rightItem.id == 2619 then
        return rightItem
    end
end
local function primaryElementCheck(user, TargetItem, slot)
    for i = 1,6 do
        if runes.checkIfLearnedRune(user, TargetItem, i, "isSpell", "spell"..slot) then
            return false
        elseif i == 6 then
            return true
        end
    end
end
local function checkIfKnowsAnyMinorRune(user)
    for i = 6, #runes.Runes do -- for every minor rune
        if runes.checkIfLearnedRune(user,"", i, "isQuest") then
            return true
        elseif i == #runes.Runes then
            return false
        end
    end
end
local function checkForDialogOptions(user, TargetItem, slot) -- Check if there are any minor runes that can be selected
    for i = 6, #runes.Runes do -- For every minor rune
        if runes.checkIfLearnedRune(user,"", i, "isQuest") and (not runes.checkIfLearnedRune(user, TargetItem, i, "isSpell", "spell"..slot)) and runes.Runes[i][2] ~= "Bhona" then -- check if user knows rune and if rune is already part of spell being created
            return true
        elseif i == #runes.Runes then
            return false
        end
    end
end
local function checkForDialogOptions2(user) -- Check if there are any primary runes that can be selected
    for i = 1,5 do -- For every primary rune
        if runes.checkIfLearnedRune(user,"", i, "isQuest") then -- check if user knows rune
            return true
        elseif i == 5 then
            return false
        end
    end
end
local function createSpell(user, TargetItem, slot)
local BHONA = runes.checkIfLearnedRune(user, TargetItem, 6, "isSpell", "spell"..slot)
local runeStart = 7
    if BHONA then
        runeStart = 1
    end
    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        end
        local index = dialog:getSelectedIndex() +1
        local unknownRunes = runeStart-1 --Counter for runes that are unknown or already in use, starting at the first rune after elemental ones
        for i = runeStart, #runes.Runes do -- For every rune
            if runes.checkIfLearnedRune(user,"", i, "isQuest") and (not runes.checkIfLearnedRune(user, TargetItem, i, "isSpell", "spell"..slot)) then -- check if user knows rune and if rune is already part of spell being created
                if i == 6 then -- skip BHONA
                    unknownRunes = unknownRunes+1
                end
                if index == i-unknownRunes then -- Check if selected index is the rune in question
                    if  magic.hasSufficientMana(user,3000) then
                        user:increaseAttrib("mana", -3000)
                        world:gfx(41,user.pos)
                        world:makeSound(13,user.pos)
                        runes.learnRune(user, TargetItem, i, "isSpell", "spell"..slot) -- Add rune to spell
                        M.spellCreationSelectionMenu(user, TargetItem, slot)
                        user:inform("","The rune "..runes.Runes[i][2].." has been added to the spell.")
                    else
                        user:inform("","Not enough mana.")
                        M.spellCreationSelectionMenu(user, TargetItem, slot)
                    end
                end
            else
                unknownRunes = unknownRunes+1 -- For every rune that the user has not learned or is already part of the spell, the index numbering is corrected.
            end
        end
    end
    local dialog = SelectionDialog(common.GetNLS(user,"","Spell Creation"), common.GetNLS(user,"","Select which rune you want to add to your spell."), callback)
    for i = runeStart, #runes.Runes do -- For every rune
        if i ~= 6 then
            if runes.checkIfLearnedRune(user,"", i, "isQuest") and (not runes.checkIfLearnedRune(user, TargetItem, i, "isSpell", "spell"..slot)) then -- check if user knows rune and if rune is already part of spell being created
                dialog:addOption(0,runes.Runes[i][2])
            end
        end
    end
    if not checkIfKnowsAnyMinorRune(user) then -- If you do not know any runes
        M.spellCreationSelectionMenu(user, TargetItem, slot)
        user:inform("","You must first learn how to use any minor rune before you can add it to your spell.")
    elseif not checkForDialogOptions(user, TargetItem, slot) then
        M.spellCreationSelectionMenu(user, TargetItem, slot)
        user:inform("","You do not know any more runes that can be added to the spell.")
    else
        user:requestSelectionDialog(dialog)
    end
end
local function elementSelection(user, TargetItem, slot)
local unknownRunes = 0
    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        end
        local index = dialog:getSelectedIndex() +1
        for i = 1,6 do
            if runes.checkIfLearnedRune(user,"", i, "isQuest") then
                if index == i-unknownRunes then
                    if  magic.hasSufficientMana(user,3000) then
                        user:increaseAttrib("mana", -3000)
                        world:gfx(41,user.pos)
                        world:makeSound(13,user.pos)
                        runes.learnRune(user, TargetItem, i, "isSpell", "spell"..slot)
                        M.spellCreationSelectionMenu(user, TargetItem, slot)
                        user:inform("","The rune "..runes.Runes[i][2].." has been added as the primary rune of the spell.")
                    else
                        user:inform("","Not enough mana.")
                        M.spellCreationSelectionMenu(user, TargetItem, slot)
                    end
                    return
                end
            else
                unknownRunes = unknownRunes+1
            end
        end
    end
    local dialog = SelectionDialog(common.GetNLS(user,"","Spell Creation"), common.GetNLS(user,"","Select a primary rune for your spell."), callback)
    for i = 1,6 do
        if runes.checkIfLearnedRune(user,"", i, "isQuest") then
            dialog:addOption(0, runes.Runes[i][2])
        end
    end
user:requestSelectionDialog(dialog)
end
local function nameSpell(user, TargetItem, slot)
    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        end
        local input = dialog:getInput()
        TargetItem:setData("spellName"..slot,input) -- Set name for spell
        world:changeItem(TargetItem) -- save name for spell
        user:inform("","You name the spell in spell slot "..slot.. ": "..input..".")
    end
user:requestInputDialog(InputDialog("Spell Creation","Name your spell.",false,255,callback))
end
function M.spellCreationSelectionMenu(user, TargetItem, slot)
    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        end
        local index = dialog:getSelectedIndex() +1
        if index == 1 and primaryElementCheck(user, TargetItem, slot) then
            elementSelection(user,TargetItem, slot)
        elseif index == 1 then
            createSpell(user, TargetItem, slot)
        elseif index == 2 then
            nameSpell(user, TargetItem, slot)
        end
    end
    local dialog = SelectionDialog(common.GetNLS(user,"","Spell Creation"), common.GetNLS(user,"","Pick an option."), callback)
    dialog:addOption(0, "Add rune")
    dialog:addOption(0, "Finish spell")
user:requestSelectionDialog(dialog)
end
local function overWriteConfirmation(user, TargetItem, slot)
    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        end
        local index = dialog:getSelectedIndex() +1
        if index == 1 then
            TargetItem:setData("spell"..slot,"0") -- Reset the spell slot
            TargetItem:setData("spellName"..slot,"Unfinished") -- Remove old spell name
            world:changeItem(TargetItem) -- Save the changes above
            M.spellCreationSelectionMenu(user, TargetItem, slot)
        elseif index == 2 then
            M.slotSelection(user)
        end
    end
    local dialog = SelectionDialog(common.GetNLS(user,"","Spell Creation"), common.GetNLS(user,"","This  spell slot is already in use.\nAre you sure you want to overwrite the selected spell slot?"), callback)
    dialog:addOption(0, "Yes, overwrite it.")
    dialog:addOption(0, "No, select another slot.")
    user:requestSelectionDialog(dialog)
end
local function slotSelection(user)
local mBook = getMagicBook(user)
    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        end
        local index = dialog:getSelectedIndex() +1
        for i = 1,M.MAX_SPELL_SLOTS do
            if index == i and (mBook:getData("spellName"..i) ~= "Unfinished") and (mBook:getData("spellName"..i) ~= "") then
                overWriteConfirmation(user, mBook, i)
                return
            elseif index == i and (mBook:getData("spellName"..i) == "Unfinished") then
                M.spellCreationSelectionMenu(user, mBook, i)
            elseif index == i then
                mBook:setData("spellName"..i,"Unfinished") -- Remove old spell name
                mBook:setData("spell"..i,"0") -- Set a blank value for spell so it doesn't end up being NIL
                world:changeItem(mBook) -- Save the changes above
                M.spellCreationSelectionMenu(user, mBook, i)
            end
        end
    end
    local dialog = SelectionDialog(common.GetNLS(user,"","Spell Creation"), common.GetNLS(user,"","Select which spell slot you want to store a spell in."), callback)
    for i = 1,M.MAX_SPELL_SLOTS do
        if (mBook:getData("spellName"..i) ~= "") then
            dialog:addOption(0,"Spell Slot "..i.."("..mBook:getData("spellName"..i)..")")
        else
            dialog:addOption(0,"Spell Slot "..i.."(Empty)")
        end
    end
    user:requestSelectionDialog(dialog)
end
local function learnRunesAdmin(user)
    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        end
        local index = dialog:getSelectedIndex() +1
        local knownRunes = "0" --Counter for runes that are already known
        for i = 1, #runes.Runes do -- For every rune
            if not runes.checkIfLearnedRune(user,"", i, "isQuest") then -- check if user doesn't know rune
                if index == i-knownRunes then -- Check if selected index is the rune in question
                    runes.learnRune(user,"", i, "isQuest") -- Learn rune
                    user:requestSelectionDialog(dialog) -- Allow you to select another rune to learn
                end
            else
                knownRunes = knownRunes+1 -- For every rune that the user has not learned or is already part of the spell, the index numbering is corrected.
            end
        end
    end
    local dialog = SelectionDialog(common.GetNLS(user,"","Spell Creation"), common.GetNLS(user,"","Select which rune you want to add to your spell."), callback)
    for i = 1, #runes.Runes do -- For every rune
        if not runes.checkIfLearnedRune(user,"", i, "isQuest") then -- check if user doesn't know rune
            dialog:addOption(0,runes.Runes[i][2])
        end
    end
    user:requestSelectionDialog(dialog)
end
local function unLearnAllRunesAdmin(user)
    user:setQuestProgress(7000, 0)
    user:inform("","You've lost all knowledge of magic runes that you used to have.")
end
local function dispenseMagicBookAdmin(user)
    common.CreateItem(user,2619,1,999,{["magicBook"]="true"})
    user:inform("","Book dispensed.")
end
function M.mainDialog(user)
    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        end
        local index = dialog:getSelectedIndex() +1
        if index == 1 then
            if checkForDialogOptions2(user) then
                if user:countItemAt("body",2619,{["magicBook"]="true"}) ~= 0 and user:countItemAt("body",463) ~= 0 then
                    slotSelection(user)
                else
                    user:inform("","You must hold a magic book and quill in your hands.")
                end
            else
                user:inform("","You must first learn how to use a primary rune before you can create a spell.")
            end
        elseif index == 2 then --and user:isAdmin() then
            learnRunesAdmin(user)
        elseif index == 3 then --and user:isAdmin() then
            unLearnAllRunesAdmin(user)
        elseif index == 4 then --and user:isAdmin() then
            dispenseMagicBookAdmin(user)
        end
    end
    local dialog = SelectionDialog(common.GetNLS(user,"","Spell Creation"), common.GetNLS(user,"","Pick an option."), callback)
    dialog:addOption(0, "Create a spell")
    --if user:isAdmin() then
        dialog:addOption(0, "Learn runes(admin only)")
        dialog:addOption(0, "Unlearn all runes (admin only)")
        dialog:addOption(0, "Dispense Spellbook (admin only)")
    --end
    user:requestSelectionDialog(dialog)
end
return M

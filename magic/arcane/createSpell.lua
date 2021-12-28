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
local texts = require("magic.arcane.base.texts")

local M = {}
M.MAX_SPELL_SLOTS = 20
local createSpellTexts = texts.createSpellTexts

local function getMagicBook(user)
    local leftItem = user:getItemAt(5)
    local rightItem = user:getItemAt(6)
    if leftItem.id == 2619 then
        return leftItem
    elseif rightItem.id == 2619 then
        return rightItem
    end
end
local function primaryElementCheck(user, targetItem, slot)
    for i = 1,6 do
        if runes.checkIfLearnedRune(user, targetItem, i, "isSpell", "spell"..slot) then
            return false
        elseif i == 6 then
            return true
        end
    end
end

local function bhonaCheck(user, targetItem, slot)
local BHONA = runes.checkIfLearnedRune(user, targetItem, 6, "isSpell", "spell"..slot)
    if not BHONA then
        return false
    end
local count = 0
    for i = 1, #runes.Runes do
        if runes.checkIfLearnedRune(user, targetItem, i, "isSpell", "spell"..slot) then
            count = count+1
        end
    end
    if count >= 2 then
        user:inform(createSpellTexts.BHONA.german, createSpellTexts.BHONA.english )
        return true
    end
return false
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
local function checkForDialogOptions(user, targetItem, slot) -- Check if there are any minor runes that can be selected
    for i = 6, #runes.Runes do -- For every minor rune
        if runes.checkIfLearnedRune(user,"", i, "isQuest") and (not runes.checkIfLearnedRune(user, targetItem, i, "isSpell", "spell"..slot)) and runes.Runes[i][2] ~= "Bhona" then -- check if user knows rune and if rune is already part of spell being created
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
local function createSpell(user, targetItem, slot)
local BHONA = runes.checkIfLearnedRune(user, targetItem, 6, "isSpell", "spell"..slot)
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
            if runes.checkIfLearnedRune(user,"", i, "isQuest") and (not runes.checkIfLearnedRune(user, targetItem, i, "isSpell", "spell"..slot)) then -- check if user knows rune and if rune is already part of spell being created
                if i == 6 then -- skip BHONA
                    unknownRunes = unknownRunes+1
                end
                if index == i-unknownRunes then -- Check if selected index is the rune in question
                    if  magic.hasSufficientMana(user,3000) then
                        user:increaseAttrib("mana", -3000)
                        world:gfx(41,user.pos)
                        world:makeSound(13,user.pos)
                        runes.learnRune(user, targetItem, i, "isSpell", "spell"..slot) -- Add rune to spell
                        M.spellCreationSelectionMenu(user, targetItem, slot)
                        user:inform(createSpellTexts.prefix.german..runes.Runes[i][2]..createSpellTexts.suffix.german,createSpellTexts.prefix.english..runes.Runes[i][2]..createSpellTexts.suffix.english)
                    else
                        user:inform(createSpellTexts.mana.german ,createSpellTexts.mana.english)
                        M.spellCreationSelectionMenu(user, targetItem, slot)
                    end
                end
            else
                unknownRunes = unknownRunes+1 -- For every rune that the user has not learned or is already part of the spell, the index numbering is corrected.
            end
        end
    end
    local dialog = SelectionDialog(common.GetNLS(user,createSpellTexts.creation.german, createSpellTexts.creation.english), common.GetNLS(user, createSpellTexts.selectRune.german, createSpellTexts.selectRune.english), callback)
    for i = runeStart, #runes.Runes do -- For every rune
        if i ~= 6 then
            if runes.checkIfLearnedRune(user,"", i, "isQuest") and (not runes.checkIfLearnedRune(user, targetItem, i, "isSpell", "spell"..slot)) then -- check if user knows rune and if rune is already part of spell being created
                dialog:addOption(0,runes.Runes[i][2])
            end
        end
    end
    if not checkIfKnowsAnyMinorRune(user) then -- If you do not know any runes
        M.spellCreationSelectionMenu(user, targetItem, slot)
        user:inform(createSpellTexts.minor.german, createSpellTexts.minor.english)
    elseif not checkForDialogOptions(user, targetItem, slot) then
        M.spellCreationSelectionMenu(user, targetItem, slot)
        user:inform(createSpellTexts.allRunes.german ,createSpellTexts.allRunes.english)
    else
        user:requestSelectionDialog(dialog)
    end
end
local function elementSelection(user, targetItem, slot)
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
                        runes.learnRune(user, targetItem, i, "isSpell", "spell"..slot)
                        M.spellCreationSelectionMenu(user, targetItem, slot)
                        user:inform(createSpellTexts.prefix.german..runes.Runes[i][2]..createSpellTexts.suffixPrimary.german, createSpellTexts.prefix.english..runes.Runes[i][2]..createSpellTexts.suffixPrimary.english)
                    else
                        user:inform(createSpellTexts.mana.german, createSpellTexts.mana.english)
                        M.spellCreationSelectionMenu(user, targetItem, slot)
                    end
                    return
                end
            else
                unknownRunes = unknownRunes+1
            end
        end
    end
    local dialog = SelectionDialog(common.GetNLS(user,createSpellTexts.creation.german, createSpellTexts.creation.english), common.GetNLS(user, createSpellTexts.selectPrimary.german, createSpellTexts.selectPrimary.english), callback)
    for i = 1,6 do
        if runes.checkIfLearnedRune(user,"", i, "isQuest") then
            dialog:addOption(0, runes.Runes[i][2])
        end
    end
user:requestSelectionDialog(dialog)
end
local function nameSpell(user, targetItem, slot)
    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        end
        local input = dialog:getInput()
        targetItem:setData("spellName"..slot,input) -- Set name for spell
        world:changeItem(targetItem) -- save name for spell
        user:inform(createSpellTexts.slot.german..slot.. ": "..input..".",createSpellTexts.slot.english..slot.. ": "..input..".")
    end
user:requestInputDialog(InputDialog(common.GetNLS(user,createSpellTexts.creation.german, createSpellTexts.creation.english), common.GetNLS(user, createSpellTexts.nameSpell.german, createSpellTexts.nameSpell.english),false,255,callback))
end
function M.spellCreationSelectionMenu(user, targetItem, slot)
    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        end
        local index = dialog:getSelectedIndex() +1
        if index == 1 and primaryElementCheck(user, targetItem, slot) then
            elementSelection(user,targetItem, slot)
        elseif index == 1 and not bhonaCheck(user, targetItem, slot) then
            createSpell(user, targetItem, slot)
        elseif index == 2 then
            nameSpell(user, targetItem, slot)
        end
    end
    local dialog = SelectionDialog(common.GetNLS(user,createSpellTexts.creation.german, createSpellTexts.creation.english), common.GetNLS(user,createSpellTexts.pickOption.german,createSpellTexts.pickOption.english), callback)
    dialog:addOption(0, common.GetNLS(user, createSpellTexts.addRune.german, createSpellTexts.addRune.english))
    dialog:addOption(0, common.GetNLS(user, createSpellTexts.finish.german, createSpellTexts.finish.english))
user:requestSelectionDialog(dialog)
end
local function overWriteConfirmation(user, targetItem, slot)
    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        end
        local index = dialog:getSelectedIndex() +1
        if index == 1 then
            targetItem:setData("spell"..slot,"0") -- Reset the spell slot
            targetItem:setData("spellName"..slot, common.GetNLS(user, createSpellTexts.unfinished.german, createSpellTexts.unfinished.english)) -- Remove old spell name
            world:changeItem(targetItem) -- Save the changes above
            M.spellCreationSelectionMenu(user, targetItem, slot)
        elseif index == 2 then
            M.slotSelection(user)
        end
    end
    local dialog = SelectionDialog(common.GetNLS(user,createSpellTexts.creation.german, createSpellTexts.creation.english), common.GetNLS(user,"","This  spell slot is already in use.\nAre you sure you want to overwrite the selected spell slot?"), callback)
    dialog:addOption(0, common.GetNLS(user, createSpellTexts.overwrite.german, createSpellTexts.overwrite.english))
    dialog:addOption(0, common.GetNLS(user, createSpellTexts.dontOverwrite.german, createSpellTexts.dontOverwrite.english))
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
            local spellName = mBook:getData("spellName"..i)
            local germanUnfinished = createSpellTexts.unfinished.german
            local englishUnfinished = createSpellTexts.unfinished.english
            if index == i and spellName ~= englishUnfinished and spellName ~= germanUnfinished and spellName ~= "" then
                overWriteConfirmation(user, mBook, i)
                return
            elseif index == i and (spellName == englishUnfinished or spellName == germanUnfinished) then
                M.spellCreationSelectionMenu(user, mBook, i)
            elseif index == i then
                mBook:setData("spellName"..i, common.GetNLS(user, germanUnfinished, englishUnfinished)) -- Remove old spell name
                mBook:setData("spell"..i,"0") -- Set a blank value for spell so it doesn't end up being NIL
                world:changeItem(mBook) -- Save the changes above
                M.spellCreationSelectionMenu(user, mBook, i)
            end
        end
    end
    local dialog = SelectionDialog(common.GetNLS(user,createSpellTexts.creation.german, createSpellTexts.creation.english), common.GetNLS(user,"","Select which spell slot you want to store a spell in."), callback)
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
    local dialog = SelectionDialog(common.GetNLS(user,createSpellTexts.creation.german, createSpellTexts.creation.english), common.GetNLS(user,createSpellTexts.selectRune.german,createSpellTexts.selectRune.english), callback)
    for i = 1, #runes.Runes do -- For every rune
        if not runes.checkIfLearnedRune(user,"", i, "isQuest") then -- check if user doesn't know rune
            dialog:addOption(0,runes.Runes[i][2])
        end
    end
    user:requestSelectionDialog(dialog)
end
local function unLearnAllRunesAdmin(user)
    user:setQuestProgress(7000, 0)
    user:inform("You've lost all knowledge of magic runes that you used to have.","You've lost all knowledge of magic runes that you used to have.") --temporary text for testing, needs no german translation
end
local function dispenseMagicBookAdmin(user)
    common.CreateItem(user,2619,1,999,{["magicBook"]="true"})
    user:inform("Book dispensed.","Book dispensed.") --Temporary testing text, no need for  translation
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
                    user:inform(createSpellTexts.quillAndBook.german,createSpellTexts.quillAndBook.english)
                end
            else
                user:inform(createSpellTexts.noPrimary.german, createSpellTexts.noPrimary.english)
            end
        elseif index == 2 then --and user:isAdmin() then
            learnRunesAdmin(user)
        elseif index == 3 then --and user:isAdmin() then
            unLearnAllRunesAdmin(user)
        elseif index == 4 then --and user:isAdmin() then
            dispenseMagicBookAdmin(user)
        end
    end
    local dialog = SelectionDialog(common.GetNLS(user,createSpellTexts.creation.german, createSpellTexts.creation.english), common.GetNLS(user, createSpellTexts.pickOption.german, createSpellTexts.pickOption.english), callback)
    dialog:addOption(0, common.GetNLS(user, createSpellTexts.create.german, createSpellTexts.create.english))
    dialog:addOption(0, "Learn runes(admin only)") --No need for this and the two below to have translations as they are temporary for testing
    dialog:addOption(0, "Unlearn all runes (admin only)")
    dialog:addOption(0, "Dispense Spellbook (admin only)")
    user:requestSelectionDialog(dialog)
end
return M

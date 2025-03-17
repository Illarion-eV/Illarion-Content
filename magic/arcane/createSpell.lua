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
local grimoireCreation = require("magic.arcane.grimoireCreation")

local M = {}

M.MAX_SPELL_SLOTS = 20


local function getMagicBook(user)

    local leftItem = user:getItemAt(5)
    local rightItem = user:getItemAt(6)

    if leftItem:getData("magicBook") ~= "true" and rightItem:getData("magicBook") ~= "true" then --check for magic book data
        return nil
    end

    for _, book in pairs(grimoireCreation.books) do --Check all valid book ids

        if leftItem.id == book then
            return leftItem
        elseif rightItem.id == book then
            return rightItem
        end
    end

    return nil

end

local function primaryElementCheck(user, mBook, slot)
    for i = 1,6 do
        if runes.checkIfLearnedRune(user, mBook, i, "isSpell", "spell"..slot) then
            return false
        elseif i == 6 then
            return true
        end
    end
end

local function bhonaCheck(user, mBook, slot)

    local BHONA = runes.checkIfLearnedRune(user, mBook, 6, "isSpell", "spell"..slot)

    if not BHONA then
        return false
    end

    local count = 0

    for i = 1, #runes.runes do
        if runes.checkIfLearnedRune(user, mBook, i, "isSpell", "spell"..slot) then
            count = count+1
        end
    end

    if count >= 2 then
        user:inform("Zaubersprüche mit BHONA dürfen maximal 2 Runen enthalten.", "BHONA spells may only contain up to two runes." )
        return true
    end

    return false

end

local function checkIfKnowsAnyMinorRune(user)
    for i = 6, #runes.runes do -- for every minor rune
        if runes.checkIfLearnedRune(user,"", i, "isQuest") then
            return true
        elseif i == #runes.runes then
            return false
        end
    end
end

local function checkForDialogOptions(user, mBook, slot) -- Check if there are any minor runes that can be selected
    for i = 6, #runes.runes do -- For every minor rune
        if runes.checkIfLearnedRune(user,"", i, "isQuest") and (not runes.checkIfLearnedRune(user, mBook, i, "isSpell", "spell"..slot)) and runes.runeNumberToName(i) ~= "Bhona" then -- check if user knows rune and if rune is already part of spell being created
            return true
        elseif i == #runes.runes then
            return false
        end
    end
end

function M.checkForDialogOptions2(user) -- Check if there are any primary runes that can be selected
    for i = 1,5 do -- For every primary rune
        if runes.checkIfLearnedRune(user,"", i, "isQuest") then -- check if user knows rune
            return true
        elseif i == 5 then
            return false
        end
    end
end

local function createSpell(user, slot)

    local mBook = getMagicBook(user)
    local BHONA = runes.checkIfLearnedRune(user, mBook, 6, "isSpell", "spell"..slot)
    local runeStart = 7

    if BHONA then
        runeStart = 1
    end

    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        end
        local index = dialog:getSelectedIndex() +1
        local unknownrunes = runeStart-1 --Counter for runes that are unknown or already in use, starting at the first rune after elemental ones
        for i = runeStart, #runes.runes do -- For every rune
            mBook = getMagicBook(user)
            if runes.checkIfLearnedRune(user,"", i, "isQuest") and (not runes.checkIfLearnedRune(user, mBook, i, "isSpell", "spell"..slot)) then -- check if user knows rune and if rune is already part of spell being created
                if i == 6 then -- skip BHONA
                    unknownrunes = unknownrunes+1
                end
                if index == i-unknownrunes then -- Check if selected index is the rune in question
                    if  magic.hasSufficientMana(user,3000) then
                        user:increaseAttrib("mana", -3000)
                        world:gfx(41,user.pos)
                        world:makeSound(13,user.pos)
                        runes.learnRune(user, mBook, i, "isSpell", "spell"..slot) -- Add rune to spell
                        M.spellCreationSelectionMenu(user, slot)
                        user:inform("Die Rune "..runes.runeNumberToName(i).." wurde dem Zauberspruch hinzugefügt.", "The rune "..runes.runeNumberToName(i).." has been added to the spell.")
                    else
                        user:inform("Nicht genug Mana." ,"Not enough mana.")
                        M.spellCreationSelectionMenu(user, slot)
                    end
                end
            else
                unknownrunes = unknownrunes+1 -- For every rune that the user has not learned or is already part of the spell, the index numbering is corrected.
            end
        end
    end

    local dialog = SelectionDialog(common.GetNLS(user, "Zauberspruch Erstellung", "Spell Creation"), common.GetNLS(user, "Wähle welche Rune du dem Zauberspruch hinzufügen möchtest.", "Select which rune you want to add to your spell."), callback)


    for i = runeStart, #runes.runes do -- For every rune
        if i ~= 6 then
            if runes.checkIfLearnedRune(user,"", i, "isQuest") and (not runes.checkIfLearnedRune(user, mBook, i, "isSpell", "spell"..slot)) then -- check if user knows rune and if rune is already part of spell being created
                local runeName = runes.runeNumberToName(i)
                local lowerCaseName = string.lower(runeName)
                dialog:addOption(Item[lowerCaseName], runeName)
            end
        end
    end

    if not checkIfKnowsAnyMinorRune(user) then -- If you do not know any runes
        M.spellCreationSelectionMenu(user, slot)
        user:inform("Du musst zuerst lernen wie man eine geringe Rune nutzt bevor du sie zu deinem Zauberspruch hinzufügst. ", "You must first learn how to use any minor rune before you can add it to your spell.")

    elseif not checkForDialogOptions(user, mBook, slot) then
        M.spellCreationSelectionMenu(user, slot)
        user:inform("Du kennst keine weiteren Runen die zum Zauberspruch hinzugefügt werden können." , "You do not know any more runes that can be added to the spell.")

    else
        user:requestSelectionDialog(dialog)
    end
end

local function elementSelection(user, slot)

    local unknownrunes = 0

    local callback = function(dialog)

        if not dialog:getSuccess() then
            return
        end

        local index = dialog:getSelectedIndex() +1

        for i = 1,6 do
            if runes.checkIfLearnedRune(user,"", i, "isQuest") then
                if index == i-unknownrunes then
                    if  magic.hasSufficientMana(user,3000) then
                        user:increaseAttrib("mana", -3000)
                        world:gfx(41,user.pos)
                        world:makeSound(13,user.pos)
                        local mBook = getMagicBook(user)

                        if not mBook then
                            return
                        end

                        runes.learnRune(user, mBook, i, "isSpell", "spell"..slot)
                        M.spellCreationSelectionMenu(user, slot)

                        user:inform("Die Rune "..runes.runeNumberToName(i).." wurde als primäre Rune dem Zauberspruch hinzugefügt.", "The rune "..runes.runeNumberToName(i).." has been added as the primary rune of the spell.")
                    else
                        user:inform("Nicht genug Mana." ,"Not enough mana.")
                        M.spellCreationSelectionMenu(user, slot)
                    end
                    return
                end
            else
                unknownrunes = unknownrunes+1
            end
        end
    end

    local dialog = SelectionDialog(common.GetNLS(user,"Zauberspruch Erstellung", "Spell Creation"), common.GetNLS(user, "Wähle eine primäre Rune für deinen Zauberspruch.", "Select a primary rune for your spell."), callback)

    for i = 1,6 do
        if runes.checkIfLearnedRune(user,"", i, "isQuest") then
            local runeName = runes.runeNumberToName(i)
            local lowerCaseName = string.lower(runeName)
            dialog:addOption(Item[lowerCaseName], runeName)
        end
    end

    user:requestSelectionDialog(dialog)
end

local function nameSpell(user, slot)

    local mBook = getMagicBook(user)

    if not mBook then
        return
    end

    local theSpell = mBook:getData("spell"..slot)

    if common.IsNilOrEmpty(theSpell) or tonumber(theSpell) == 0 then
        user:inform("Der Zauberspruch muss Runen enthalten, damit du ihn benennen kannst.", "The spell must contain runes for you to name it.")
        return
    end

    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        end
        local input = dialog:getInput()
        mBook = getMagicBook(user)
        mBook:setData("spellName"..slot,input) -- Set name for spell
        world:changeItem(mBook) -- save name for spell
        user:inform("Du benennst den Zauberspruch auf Seite  "..slot.. ": "..input..".","You name the spell on page "..slot.. ": "..input..".")
        if user:getQuestProgress(237) == 4 then
            user:setQuestProgress(237, 5)
        end
    end

    user:requestInputDialog(InputDialog(common.GetNLS(user,"Zauberspruch Erstellung", "Spell Creation"), common.GetNLS(user, "Benenne den Zauberspruch.", "Name the spell"),false,255,callback))
end

function M.spellCreationSelectionMenu(user, slot)

    local callback = function(dialog)

        if not dialog:getSuccess() then
            return
        end

        local index = dialog:getSelectedIndex() +1

        local mBook = getMagicBook(user)

        if not mBook then
            return
        end

        if index == 1 and primaryElementCheck(user, mBook, slot) then
            elementSelection(user, slot)
        elseif index == 1 and not bhonaCheck(user, mBook, slot) then
            createSpell(user, slot)
        elseif index == 2 then
            nameSpell(user, slot)
        end
    end
    local dialog = SelectionDialog(common.GetNLS(user,"Zauberspruch Erstellung", "Spell Creation"), common.GetNLS(user, "Wähle eine Möglichkeit.", "Pick an option."), callback)

    dialog:addOption(0, common.GetNLS(user, "Füge eine Rune hinzu.", "Add rune"))
    dialog:addOption(0, common.GetNLS(user, "Finalisiere den Zauber.", "Finish spell"))

    user:requestSelectionDialog(dialog)
end

local function overWriteConfirmation(user, slot)

    local callback = function(dialog)

        if not dialog:getSuccess() then
            return
        end

        local index = dialog:getSelectedIndex() +1

        if index == 1 then
            local mBook = getMagicBook(user)
            if not mBook then
                return
            end
            mBook:setData("spell"..slot,"0") -- Reset the spell slot
            mBook:setData("spellName"..slot, common.GetNLS(user, "Unvollendet", "Unfinished")) -- Remove old spell name
            world:changeItem(mBook) -- Save the changes above
            M.spellCreationSelectionMenu(user, slot)
        elseif index == 2 then
            M.slotSelection(user)
        end
    end

    local dialog = SelectionDialog(common.GetNLS(user,"Zauberspruch Erstellung", "Spell Creation"), common.GetNLS(user,"","This  spell slot is already in use.\nAre you sure you want to overwrite the selected spell slot?"), callback)
    dialog:addOption(0, common.GetNLS(user, "Ja, ich überschreibe ihn.", "Yes, overwrite it."))
    dialog:addOption(0, common.GetNLS(user, "Nein, ich wähle eine andere Seite.", "No, select another page."))
    user:requestSelectionDialog(dialog)

end

function M.slotSelection(user)

    local mBook = getMagicBook(user)

    if not mBook then
        return
    end

    local callback = function(dialog)

        if not dialog:getSuccess() then
            return
        end

        local index = dialog:getSelectedIndex() +1

        for i = 1, M.MAX_SPELL_SLOTS do

            local spellName = mBook:getData("spellName"..i)
            local germanUnfinished = "Unvollendet"
            local englishUnfinished = "Unfinished"

            if index == i and spellName ~= englishUnfinished and spellName ~= germanUnfinished and spellName ~= "" then
                overWriteConfirmation(user, i)
                return

            elseif index == i and (spellName == englishUnfinished or spellName == germanUnfinished) then
                M.spellCreationSelectionMenu(user, i)

            elseif index == i then
                mBook:setData("spellName"..i, common.GetNLS(user, germanUnfinished, englishUnfinished)) -- Remove old spell name
                mBook:setData("spell"..i,"0") -- Set a blank value for spell so it doesn't end up being NIL
                world:changeItem(mBook) -- Save the changes above
                M.spellCreationSelectionMenu(user, i)
            end
        end
    end

    local dialog = SelectionDialog(common.GetNLS(user,"Zauberspruch Erstellung", "Spell Creation"), common.GetNLS(user,"Wähle, in welchem Zauberslot du einen Zauber speichern möchtest.","Select which spell slot you want to store a spell in."), callback)

    for i = 1, M.MAX_SPELL_SLOTS do
        if (mBook:getData("spellName"..i) ~= "") then
            dialog:addOption(0,"Spell Slot "..i.."("..mBook:getData("spellName"..i)..")")
        else
            dialog:addOption(0,"Spell Slot "..i.."(Empty)")
        end
    end

    user:requestSelectionDialog(dialog)

end

return M

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
local castSpell = require("magic.arcane.castSpell")
local magic = require("base.magic")
local runes = require("magic.arcane.runes")

local M = {}

local function primeWandToSpell(user, spell, spellName)

    local wand = magic.getWand(user)

    if not wand then
        user:inform("Du brauchst einen Zauberstab in den Händen, wenn du einen Zauber darauf vorbereiten möchtest.", "You need a wand in your hands if you want to attune a spell to it.")
    else
        wand:setData("spell", tonumber(spell))
        world:changeItem(wand)
        user:inform("Der Zauberstab ist vorbereitet für den Zauber: "..spellName..".","Wand attuned for the spell: "..spellName..".")
    end
end

function M.spellSelection(user, grimoire)

    local spell

    local emptySpellSlots = 0

    local callback = function(dialog)

        if not dialog:getSuccess() then
            return
        end

        local index = dialog:getSelectedIndex() +1

        for i = 1, createSpell.MAX_SPELL_SLOTS do

            local spellName = grimoire:getData("spellName"..i)
            if common.IsNilOrEmpty(spellName) -- spell name doesn't exists
            or spellName == "Unfinished" -- it is an unfinished spell
            or spellName == "Unvollendet" -- same as above but for german players
            then
                emptySpellSlots = emptySpellSlots + 1
            elseif index == i - emptySpellSlots then --It is the selected spell slot
                spell = grimoire:getData("spell"..i)

                primeWandToSpell(user, spell, spellName)

                return
            end
        end
    end

    local dialog = SelectionDialog(common.GetNLS(user, "Zauberauswahl", "Spell Selection"), common.GetNLS(user, "Wähle, welchen Zauber du auf deinen Zauberstab abstimmen möchtest.","Select which spell you want to attune to your wand."), callback)

    local count = 0

    for i = 1, createSpell.MAX_SPELL_SLOTS do

        local spellName = grimoire:getData("spellName"..i)

        if not common.IsNilOrEmpty(spellName) and spellName ~= "Unfinished" and spellName ~= "Unvollendet" then
            dialog:addOption(0, spellName)
        else
            count = count + 1
        end
    end

    if count == createSpell.MAX_SPELL_SLOTS then -- no spells found
        user:inform("Dieses Grimoire enthält keine abgeschlossenen Zauber, die du auswählen könntest.", "This grimoire has no completed spells for you to select from.")
    else
        user:requestSelectionDialog(dialog)
    end
end

local function setDefaultRange(user)


    local callback = function (dialog)

        if not dialog:getSuccess() then
            return
        end

        local input = dialog:getInput()

        local _, _, theNumber = string.find(input,"(%d+)")

        local wand = magic.getWand(user)

        if not theNumber or tonumber(theNumber) > 9 or tonumber(theNumber) < 1  then
            user:inform("Die eingegebene Zahl muss zwischen 1 und 9 liegen.", "The input number must be a number between 1 and 9.")
            return
        elseif wand then
            wand:setData("range", tostring(theNumber))
            world:changeItem(wand)
        else
            user:inform("Der Zauberstab, für den du eine benutzerdefinierte Reichweite festlegen möchtest, muss in deinen Händen gehalten werden.", "The wand you wish to set a custom range for must be held in your hands.")
        end
    end

    local dialogTitle = common.GetNLS(user, "Zauberstab-Wirkungsreichweite", "Wand Cast Range")
    local dialogText = common.GetNLS(user,"Dies ermöglicht es dir, festzulegen, wie viele Felder entfernt von der Richtung, in die dein Charakter blickt, du Runenmagie wirken möchtest, wenn kein Ziel ausgewählt ist. Der Standardwert ist 1, und er kann bis zu 9 betragen. Die Reichweite ist spezifisch für den Zauberstab, für den du die Reichweite einstellst, und dieser muss in deiner Hand gehalten werden. Dies ist ein Platzhaltersystem, bis wir jemanden haben, der die nötige Server- und Client-seitige Unterstützung für eine richtige Point-and-Click-Zielauswahl programmieren kann.", "This allows you to set how many tiles away from where your character is facing that you want to cast rune magic at when you do not have a target selected. The default is 1, and it can go up to 9. The range is specific to the wand you set the range for, which must be held in your hand. This is a placeholder system until we have someone that can code the proper server and client side support necessary for point-and-click targeting.")

    user:requestInputDialog(InputDialog(dialogTitle, dialogText ,false, 255, callback))

end

local function showInfoForSpell(user, spell, spellName)

    local runeListEnglish = "The spell "..spellName.." contains the following runes:\n"
    local runeListGerman = "Der Zauber "..spellName.." enthält die folgenden Runen:\n"

    local runeList = common.GetNLS(user, runeListGerman, runeListEnglish)

    local first = true

    for _, rune in pairs(runes.runes) do
        if runes.checkSpellForRuneByName(rune.name, tonumber(spell)) then
            if first then
                first = false
                runeList = runeList..rune.name
            else
                runeList = runeList..", "..rune.name
            end
        end
    end

    runeList = runeList.."."

    local callback = function(dialog) end
    local dialog = MessageDialog(spellName, runeList, callback)
    user:requestMessageDialog(dialog)

end

local function runeDetailsList(user, grimoire)

    local spell

    local emptySpellSlots = 0

    local callback = function(dialog)

        if not dialog:getSuccess() then
            return
        end

        local index = dialog:getSelectedIndex() +1

        for i = 1, createSpell.MAX_SPELL_SLOTS do

            local spellName = grimoire:getData("spellName"..i)
            if common.IsNilOrEmpty(spellName) -- spell name doesn't exists
            or spellName == "Unfinished" -- it is an unfinished spell
            or spellName == "Unvollendet" -- same as above but for german players
            then
                emptySpellSlots = emptySpellSlots + 1
            elseif index == i - emptySpellSlots then --It is the selected spell slot
                spell = grimoire:getData("spell"..i)

                showInfoForSpell(user, spell, spellName)

                return
            end
        end
    end

    local dialog = SelectionDialog(common.GetNLS(user, "Zauberauswahl", "Spell Selection"), common.GetNLS(user, "Wählen Sie den Zauber aus, dessen Details Sie anzeigen möchten.","Select which spell you want to view the details of."), callback)

    local count = 0

    for i = 1, createSpell.MAX_SPELL_SLOTS do

        local spellName = grimoire:getData("spellName"..i)

        if not common.IsNilOrEmpty(spellName) and spellName ~= "Unfinished" and spellName ~= "Unvollendet" then
            dialog:addOption(0, spellName)
        else
            count = count + 1
        end
    end

    if count == createSpell.MAX_SPELL_SLOTS then -- no spells found
        user:inform("Dieses Grimoire enthält keine abgeschlossenen Zauber, die du auswählen könntest.", "This grimoire has no completed spells for you to select from.")
    else
        user:requestSelectionDialog(dialog)
    end

end

local function learnedRunesList(user)

    local knownRunes = {}

    for _, rune in pairs(runes.runes) do

        local knowsRune = runes.checkIfLearnedRune(user, false, rune.id, "isQuest", false, false)

        if knowsRune then
            table.insert(knownRunes, rune.name)
        end
    end

    local text

    for _, knownRune in pairs(knownRunes) do
        if not text then
            text = knownRune
        else
            text = text..", "..knownRune
        end
    end

    local callback = function(dialog) end
    local dialog = MessageDialog(common.GetNLS(user, "Gelernten Runen", "Learned runes"), text, callback)
    user:requestMessageDialog(dialog)

end

local function toggleAutoCast(user, wand)

    if not wand then
        return
    end

    local autoCastToggled = wand:getData("autoCast")

    if common.IsNilOrEmpty(autoCastToggled) or autoCastToggled == "true" then --Autocast on by default
        wand:setData("autoCast", "false")
        user:inform("Dein aktueller Zauberstab wurde so eingestellt, dass er keine Zauber mehr automatisch wirkt, wenn dies normalerweise der Fall wäre.", "Your current wand has been set to no longer auto cast, when a spell normally would be.")
    elseif autoCastToggled == "false" then
        wand:setData("autoCast", "true")
        user:inform("Dein aktueller Zauberstab wurde wieder so eingestellt, dass er automatisch zaubert, wenn dies bei einem Zauber möglich ist.", "Your current wand has once more been set to auto cast, when it is applicable to a spell.")
    end

    world:changeItem(wand)

end

local function storedMagicTrackerList(user)

    local savedTargets = castSpell.getTargets(user)

    local slotLimit = castSpell.getSlotLimit(user, 33555460) --The spell id of PEN TAUR HEPT

    local callback = function(dialog)

        local success = dialog:getSuccess()

        if not success then
            return
        end

        local index = dialog:getSelectedIndex()+1

        if not _G.storedPenLevTargets then
            _G.storedPenLevTargets = {}
        end

        for i, target in pairs(savedTargets) do

            if i == index then
                _G.storedPenLevTargets[user.id] = target.id
                user:inform("Du hast "..target.name.." als dein nächstes PEN-LEV-Ziel festgelegt.", "You set "..target.name.." as your next PEN LEV target.")
            end
        end
    end

    local dialog = SelectionDialog(common.GetNLS(user,"Gespeicherte Ziele","Stored Targets") , common.GetNLS(user,"Wähle ein Ziel für deinen nächsten PEN-LEV-Zauber. Das erneute Wirken von PEN HEPT überschreibt diese Auswahl. Du kannst PEN HEPT TAUR verwenden, um der Liste neue Ziele hinzuzufügen.","Select a target for your next PEN LEV spell. Casting PEN HEPT again will overwrite this. You can use PEN HEPT TAUR to add new targets to the list.") , callback)

    for index, target in ipairs(savedTargets) do
        if index <= slotLimit then
            dialog:addOption(0, target.name)
        end
    end

    user:requestSelectionDialog(dialog)

end

function M.mainSelectionDialog(user, grimoire)



    if not magic.characterIsAMage(user) then
        user:inform("Alles was du sehen kannst sind unsinnige Kritzeleine. Warte...hat sich die Linie etwas bewegt? Das übersteigt dein Verständnis. ", "All you can see are nonsensical scribbles. Wait, did that line just move? This may be beyond your ability to understand.")
        return
    end

    local callback = function(dialog)

        if not dialog:getSuccess() then
            return
        end

        local index = dialog:getSelectedIndex() +1

        if index == 1 then

            user:setQuestProgress(180, 0)
            M.spellSelection(user, grimoire)

        elseif index == 2 then

            storedMagicTrackerList(user)

        elseif index == 3 then

            local wand = magic.getWand(user)

            if not wand then
                user:inform("Wenn du die Abstimmung eines Zauberstabs aufheben möchtest, musst du diesen Zauberstab in deinen Händen halten.", "If you wish to undo the attunement of a wand, you must hold said wand in your hands.")
            else
                wand:setData("spell", "")
                world:changeItem(wand)
                user:inform("Du hast die zuvor abgestimmte Runenmagie erfolgreich vom Zauberstab entfernt.","You've successfully removed the previously attuned rune magic from the wand.")
            end
        elseif index == 4 then

            setDefaultRange(user)

        elseif index == 5 then

            toggleAutoCast(user, magic.getWand(user))

        elseif index == 6 then

            runeDetailsList(user, grimoire)

        elseif index == 7 then

            learnedRunesList(user)

        end
    end

    local dialog = SelectionDialog(common.GetNLS(user, "Zauberstab-Abstimmung", "Wand attunement"), common.GetNLS(user,"Wähle den Zweck deines Zauberstabs. Die Abstimmung auf einen Zauber ermöglicht ein schnelleres Wirken von Runenmagie. Das Aufheben der Abstimmung erlaubt das Wirken von Raum- und Verzauberungsmagie.", "Select the purpose of your wand. Attuning to a spell allows for faster casting of rune magic. Undoing the attunement allows the casting of spatial and enchanting magic."), callback)

    dialog:addOption(0,common.GetNLS(user, "Stimme den Zauberstab auf einen Zauber ab.", "Attune the wand to a spell"))
    dialog:addOption(0,common.GetNLS(user, "Gespeicherte Magie-Tracker", "Stored Magic Trackers"))
    dialog:addOption(0,common.GetNLS(user, "Zauberabstimmung aufheben", "Undo spell attunement"))
    dialog:addOption(0,common.GetNLS(user, "Standardreichweite festlegen", "Set default range"))
    dialog:addOption(0,common.GetNLS(user, "Autocast umschalten", "Toggle Autocast"))
    dialog:addOption(0,common.GetNLS(user, "Detaillierte Zauberinformationen anzeigen", "View detailed spell info"))
    dialog:addOption(0,common.GetNLS(user, "Gelernten Runen anzeigen", "View learned runes"))

    user:requestSelectionDialog(dialog)
end

return M

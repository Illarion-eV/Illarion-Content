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
local shared = require("craft.base.shared")
local tailoring = require("craft.final.tailoring")

local M = {}

M.drumSounds = { --Since drums dont use the A1-G7 tones it needs its own list and functions instead of using the shared music.lua script
{ id = 94 , name = {english = "Base hit 1", german = "Basstreffer 1"}},
{ id = 95 , name = {english = "Base hit 2", german = "Basstreffer 2"}},
{ id = 96 , name = {english = "Center hit 1", german = "Zentrums-Treffer 1"}},
{ id = 97 , name = {english = "Center hit 2", german = "Zentrums-Treffer 2"}},
{ id = 98 , name = {english = "Center hit 3", german = "Zentrums-Treffer 3"}},
{ id = 99 , name = {english = "Center hit 4", german = "Zentrums-Treffer 4"}},
{ id = 100 , name = {english = "Center hit 5", german = "Zentrums-Treffer 5"}},
{ id = 101 , name = {english = "Center hit 6", german = "Zentrums-Treffer 6"}},
{ id = 102 , name = {english = "Edge hit", german = "Rand-Treffer"}},
{ id = 103 , name = {english = "Muted hit", german = "Gedämpfter Treffer"}},
{ id = 104 , name = {english = "Open hit 1", german = "Offener Treffer 1"}},
{ id = 105 , name = {english = "Open hit 2", german = "Offener Treffer 2"}},
{ id = 106 , name = {english = "Open hit 3", german = "Offener Treffer 3"}},
{ id = 107 , name = {english = "Open hit 4", german = "Offener Treffer 4"}},
{ id = 108 , name = {english = "Open hit 5", german = "Offener Treffer 5"}},
{ id = 109 , name = {english = "Open hit 6", german = "Offener Treffer 6"}},
{ id = 110 , name = {english = "Open hit 7", german = "Offener Treffer 7"}},
{ id = 111 , name = {english = "Open hit 8", german = "Offener Treffer 8"}},
{ id = 112 , name = {english = "Open hit 9", german = "Offener Treffer 9"}},
{ id = 113 , name = {english = "Open hit 10", german = "Offener Treffer 10"}},
{ id = 114 , name = {english = "Slap hit 1", german = "Schlag-Treffer 1"}},
{ id = 115 , name = {english = "Slap hit 2", german = "Schlag-Treffer 2"}},
{ id = 116 , name = {english = "Tone hit 1", german = "Ton-Treffer 1"}},
{ id = 117 , name = {english = "Tone hit 2", german = "Ton-Treffer 2"}}
}

local function getNameBasedOnId(theId)

    if theId == Item.harp then
        return "harp"
    elseif theId == Item.lute then
        return "lute"
    elseif theId == Item.panpipe then
        return "panpipe"
    elseif theId == Item.flute then
        return "flute"
    elseif theId == 4837 or theId == 4838 then
        return "clavichord"
    end

end

function M.instrumentIsInHandOrInFrontOfUser(user, instrumentName)

    local id

    if instrumentName ~= "clavichord" then
        id = {Item[instrumentName]}
    end

    local overWriteInstrument = false

    local sharesMusic = {"harp", "flute", "lute", "panpipe", "clavichord"}

    for _, instrument in pairs(sharesMusic) do
        if instrumentName == instrument then
            id = {}
            for _, instName in pairs(sharesMusic) do
                if instName == "clavichord" then
                    table.insert(id, 4837)
                    table.insert(id, 4838)
                else
                    table.insert(id, Item[instName])
                end
            end
        end
    end

    local leftTool = user:getItemAt(Character.left_tool)
    local rightTool = user:getItemAt(Character.right_tool)
    local theInstrument = false
    local frontItem = common.GetFrontItem(user)

    if leftTool and common.isInList(leftTool.id, id) and not common.isBroken(leftTool)then
        theInstrument = leftTool
        if instrumentName ~= "clavichord" and leftTool.id ~= Item[instrumentName] then
            overWriteInstrument = getNameBasedOnId(leftTool.id)
        elseif frontItem and common.isInList(frontItem.id, id) and not common.isBroken(frontItem) and instrumentName == "clavichord" and frontItem.id ~= 4837 and frontItem.id ~= 4838 then
            overWriteInstrument = getNameBasedOnId(frontItem.id)
        end
    elseif rightTool and common.isInList(rightTool.id, id) and not common.isBroken(rightTool) then
        theInstrument = rightTool
        if instrumentName ~= "clavichord" and rightTool.id ~= Item[instrumentName] then
            overWriteInstrument = getNameBasedOnId(rightTool.id)
        elseif frontItem and common.isInList(frontItem.id, id) and not common.isBroken(frontItem) and instrumentName == "clavichord" and frontItem.id ~= 4837 and frontItem.id ~= 4838 then
            overWriteInstrument = getNameBasedOnId(frontItem.id)
        end
    elseif frontItem and common.isInList(frontItem.id, id) and (not common.isBroken(frontItem) or instrumentName == "clavichord") then
        theInstrument = frontItem
        if instrumentName ~= "clavichord" and frontItem.id ~= Item[instrumentName] then
            overWriteInstrument = getNameBasedOnId(frontItem.id)
        elseif instrumentName == "clavichord" and frontItem.id ~= 4837 and frontItem.id ~= 4838 then
            overWriteInstrument = getNameBasedOnId(frontItem.id)
        end
    end

    local commonItem

    if instrumentName ~= "clavichord" then
        commonItem = world:getItemStatsFromId(Item[instrumentName])
    else
        commonItem = world:getItemStatsFromId(4837)
    end

    if not theInstrument then
        user:inform("Wenn du ein(e) "..commonItem.German.." spielen möchtest, musst du es in der Hand halten oder vor dir liegen haben.", "If you want to play a "..commonItem.English..", you will need to hold it in your hand or have it in front of you.")
        return false
    end

    return theInstrument, overWriteInstrument
end

local skills = {}

skills["harp"] = Character.harp
skills["lute"] = Character.lute
skills["panpipe"] = Character.panpipe
skills["flute"] = Character.flute
skills["clavichord"] = Character.clavichord

local notes = { --All instruments that use the standard A-G, 1-7 note/pitch range go here
    { note = "A1", lute = 123, harp = 45, panpipe = 172, flute = 221, clavichord = 270 },
    { note = "A2", lute = 124, harp = 46, panpipe = 173, flute = 222, clavichord = 271 },
    { note = "A3", lute = 125, harp = 47, panpipe = 174, flute = 223, clavichord = 272 },
    { note = "A4", lute = 126, harp = 48, panpipe = 175, flute = 224, clavichord = 273 },
    { note = "A5", lute = 127, harp = 49, panpipe = 176, flute = 225, clavichord = 274 },
    { note = "A6", lute = 128, harp = 50, panpipe = 177, flute = 226, clavichord = 275 },
    { note = "A7", lute = 129, harp = 51, panpipe = 178, flute = 227, clavichord = 276 },
    { note = "B1", lute = 130, harp = 52, panpipe = 179, flute = 228, clavichord = 277 },
    { note = "B2", lute = 131, harp = 53, panpipe = 180, flute = 229, clavichord = 278 },
    { note = "B3", lute = 132, harp = 54, panpipe = 181, flute = 230, clavichord = 279 },
    { note = "B4", lute = 133, harp = 55, panpipe = 182, flute = 231, clavichord = 280 },
    { note = "B5", lute = 134, harp = 56, panpipe = 183, flute = 232, clavichord = 281 },
    { note = "B6", lute = 135, harp = 57, panpipe = 184, flute = 233, clavichord = 282 },
    { note = "B7", lute = 136, harp = 58, panpipe = 185, flute = 234, clavichord = 283 },
    { note = "C1", lute = 137, harp = 59, panpipe = 186, flute = 235, clavichord = 284 },
    { note = "C2", lute = 138, harp = 60, panpipe = 187, flute = 236, clavichord = 285 },
    { note = "C3", lute = 139, harp = 61, panpipe = 188, flute = 237, clavichord = 286 },
    { note = "C4", lute = 140, harp = 62, panpipe = 189, flute = 238, clavichord = 287 },
    { note = "C5", lute = 141, harp = 63, panpipe = 190, flute = 239, clavichord = 288 },
    { note = "C6", lute = 142, harp = 64, panpipe = 191, flute = 240, clavichord = 289 },
    { note = "C7", lute = 143, harp = 65, panpipe = 192, flute = 241, clavichord = 290 },
    { note = "D1", lute = 144, harp = 66, panpipe = 193, flute = 242, clavichord = 291 },
    { note = "D2", lute = 145, harp = 67, panpipe = 194, flute = 243, clavichord = 292 },
    { note = "D3", lute = 146, harp = 68, panpipe = 195, flute = 244, clavichord = 293 },
    { note = "D4", lute = 147, harp = 69, panpipe = 196, flute = 245, clavichord = 294 },
    { note = "D5", lute = 148, harp = 70, panpipe = 197, flute = 246, clavichord = 295 },
    { note = "D6", lute = 149, harp = 71, panpipe = 198, flute = 247, clavichord = 296 },
    { note = "D7", lute = 150, harp = 72, panpipe = 199, flute = 248, clavichord = 297 },
    { note = "E1", lute = 151, harp = 73, panpipe = 200, flute = 249, clavichord = 298 },
    { note = "E2", lute = 152, harp = 74, panpipe = 201, flute = 250, clavichord = 299 },
    { note = "E3", lute = 153, harp = 75, panpipe = 202, flute = 251, clavichord = 300 },
    { note = "E4", lute = 154, harp = 76, panpipe = 203, flute = 252, clavichord = 301 },
    { note = "E5", lute = 155, harp = 77, panpipe = 204, flute = 253, clavichord = 302 },
    { note = "E6", lute = 156, harp = 78, panpipe = 205, flute = 254, clavichord = 303 },
    { note = "E7", lute = 157, harp = 79, panpipe = 206, flute = 255, clavichord = 304 },
    { note = "F1", lute = 158, harp = 80, panpipe = 207, flute = 256, clavichord = 305 },
    { note = "F2", lute = 159, harp = 81, panpipe = 208, flute = 257, clavichord = 306 },
    { note = "F3", lute = 160, harp = 82, panpipe = 209, flute = 258, clavichord = 307 },
    { note = "F4", lute = 161, harp = 83, panpipe = 210, flute = 259, clavichord = 308 },
    { note = "F5", lute = 162, harp = 84, panpipe = 211, flute = 260, clavichord = 309 },
    { note = "F6", lute = 163, harp = 85, panpipe = 212, flute = 261, clavichord = 310 },
    { note = "F7", lute = 164, harp = 86, panpipe = 213, flute = 262, clavichord = 311 },
    { note = "G1", lute = 165, harp = 87, panpipe = 214, flute = 263, clavichord = 312 },
    { note = "G2", lute = 166, harp = 88, panpipe = 215, flute = 264, clavichord = 313 },
    { note = "G3", lute = 167, harp = 89, panpipe = 216, flute = 265, clavichord = 314 },
    { note = "G4", lute = 168, harp = 90, panpipe = 217, flute = 266, clavichord = 315 },
    { note = "G5", lute = 169, harp = 91, panpipe = 218, flute = 267, clavichord = 316 },
    { note = "G6", lute = 170, harp = 92, panpipe = 219, flute = 268, clavichord = 317 },
    { note = "G7", lute = 171, harp = 93, panpipe = 220, flute = 269, clavichord = 318 }
}

M.step = {}

local function levelImpact(user, instrumentName, note, noteDuration, amount)

    local level = user:getSkill(skills[instrumentName])

    if level == 100 or amount == 1 then --At level 100 you dont write the wrong notes and if you only pluck one note you don't mistake it either
        return note
    end

    if amount <= level/1.5 and noteDuration >= 3 then --allows for shorter melodies to be played without fail at lower levels to make it less harsh
        return note --No insanely fast low level freebies though so chance to fail the faster than 0.3 second notes
    end

    local chance = 2 - level/100 -- From 2% base chance to miss per note at level 0 to 0.2% at 99

    local highestDuration = 30 --at 3 seconds youre guaranteed to hit the right note even at level 0 no matter how many

    local chanceReduction = 1/highestDuration*noteDuration

    --so at 3 seconds there is 0 chance to miss, at 1 decisecond it is 1.94% chance per note at level 0

    chance = chance - chanceReduction

    chance = chance*amount

    local rand = math.random()

    if rand > chance/100 then
        return note
    end

    local randomNote = math.random(1, #notes)

    return notes[randomNote].note
end

local function playNote(user, note, sheet, instrumentName, book, bookIndex)

    local noteDuration = 10 --Defaults to 1 second

    if not M.step[user.id] then
        M.step[user.id] = 1
    end

    if sheet then
        note = sheet:getData("note"..M.step[user.id])
        noteDuration = tonumber(sheet:getData("noteDuration"..M.step[user.id]))
    end

    if book then
        note = book:getData("sheet"..bookIndex.."note"..M.step[user.id])
        noteDuration = tonumber(book:getData("sheet"..bookIndex.."noteDuration"..M.step[user.id]))
    end

    if common.IsNilOrEmpty(note) then
        M.step[user.id] = 1
        M.step["lastDuration"..tostring(user.id)] = 0
        return --Shouldn't happen
    end

    local amount = 1

    if sheet then
        amount = tonumber(sheet:getData("noteAmount"))
    end

    if book then
        amount = tonumber(book:getData("sheet"..bookIndex.."noteAmount"))
    end

    note = levelImpact(user, instrumentName, note, noteDuration, amount)
    --Lower level, more notes and faster play will increase chance to play the wrong note
    --At level 100 you no longer play wrong notes.

    local sfx = false

    local instrument, overwriteName = M.instrumentIsInHandOrInFrontOfUser(user, instrumentName)

    if overwriteName then
        instrumentName = overwriteName
    end

    for _, selectedNote in pairs(notes) do
        if selectedNote.note == note then
            sfx = selectedNote[instrumentName]
        end
    end

    if common.IsNilOrEmpty(amount) then
        M.step["lastDuration"..tostring(user.id)] = 0
        M.step[user.id] = 1
        return
    end

    M.step[user.id] = M.step[user.id] + 1

    local lastDuration = M.step["lastDuration"..tostring(user.id)]

    if not instrument then
        return
    elseif instrumentName ~= "clavichord" then --Clavichord as a static tool shouldnt break
        shared.toolBreaks(user, instrument, lastDuration)
    end

    if sfx then
        world:makeSound(sfx, user.pos)
    end

    if not M.step["gfxTracker"..tostring(user.id)] then
        M.step["gfxTracker"..tostring(user.id)] = 0
    end

    local timeSinceLastGfx = M.step["gfxTracker"..tostring(user.id)]

    local gfx = 65

    if timeSinceLastGfx and timeSinceLastGfx < 9 and lastDuration and lastDuration > 0 then
        gfx = 0
        M.step["gfxTracker"..tostring(user.id)] = M.step["gfxTracker"..tostring(user.id)] + lastDuration
    else
        M.step["gfxTracker"..tostring(user.id)] = 0
    end

    if lastDuration and lastDuration > 0 then
        user:learn(skills[instrumentName], lastDuration, 100)
    end


    if M.step[user.id] <= tonumber(amount) then
        M.step["lastDuration"..tostring(user.id)] = noteDuration
        user:startAction( noteDuration, gfx, noteDuration, 0, 0)

    else
        M.step[user.id] = 1
        M.step["lastDuration"..tostring(user.id)] = 0
    end

end

local function giveSignal(user, actionState)

    local potentialBards = world:getPlayersInRangeOf(user.pos, 10)

    for _, potentialBard in pairs(potentialBards) do
        if _G.playtogether[potentialBard.id] and _G.playtogether[potentialBard.id].waiting then
            _G.playtogether[potentialBard.id].waiting = false
            _G.playtogether[potentialBard.id].signalGiven = true
        end
    end

    _G.playtogether[user.id].signalGiven = true

    user:startAction( 1, 0, 0, 0, 0)

end

local function waitForSignal(user, actionState)

    user:startAction( 1, 0, 0, 0, 0)

    user:inform("Du wartest jetzt auf das Signal, um mit dem Spielen zu beginnen. Wenn du dich bewegst oder eine andere Aktion ausführst - außer zu sprechen - bist du nicht mehr bereit.", "You are now waiting for the signal to start playing. If you move or perform another action, other than speaking, you will no longer be ready.")
end

function M.playMusicTogether(user, actionState)

    if not _G.playtogether then
        _G.playtogether = {}
    end

    if not _G.playtogether[user.id] then
        _G.playtogether[user.id] = {}
    end

    _G.playtogether[user.id].signalGiven = false
    _G.playtogether[user.id].waiting = true
    _G.playtogether[user.id].count = 0

    local callback = function(dialog)

        if not dialog:getSuccess() then
            _G.playtogether[user.id].waiting = false
            return
        end

        local selected = dialog:getSelectedIndex() + 1

        if selected == 1 then
            giveSignal(user, actionState)
        elseif selected == 2 then
            waitForSignal(user, actionState)
        end

    end

    local text = common.GetNLS(user, "Gib das Signal oder entscheide dich, zu warten, bis es jemand anderes tut.", "Give the signal or choose to wait for some else to do so.")

    local dialog = SelectionDialog(common.GetNLS(user, "Mit anderen Musik machen", "Play Music With Others"), text, callback)

    dialog:addOption(0, common.GetNLS(user, "Das Startsignal geben", "Give the signal to start"))
    dialog:addOption(0, common.GetNLS(user, "Auf das Startsignal warten", "Wait for the signal"))

    dialog:setCloseOnMove()

    user:requestSelectionDialog(dialog)

end

function M.playTheInstrument(user, actionState, note, musicSheet, instrumentName, musicBook, bookIndex)

    if note then
        note = M.selectedNote[user.id]
    end

    if actionState == Action.none then
        playNote(user, note, musicSheet, instrumentName, musicBook, bookIndex)
    elseif actionState == Action.success then
        playNote(user, note, musicSheet, instrumentName, musicBook, bookIndex)
    elseif actionState == Action.abort then
        M.step[user.id] = 1
        M.step["lastDuration"..tostring(user.id)] = 0
    end

end

M.selectedNote = {}

local function selectPitch(user, note)

    local callback = function(dialog)

        if not dialog:getSuccess() then
            return
        end

        local selected = dialog:getSelectedIndex() + 1

        for index = 1, 7 do
            if selected == index then
                M.selectedNote[user.id] = note..tostring(index)
                user:startAction(1, 65, 1, 0, 0)
            end
        end
    end

    local text = common.GetNLS(user, "Wähle aus, in welcher Tonhöhe du die Note spielen möchtest.", "Select which pitch you want to play the note at")

    local dialog = SelectionDialog(common.GetNLS(user, "Tonhöhenauswahl", "Pitch selection"), text, callback)

    for i = 1, 7 do
        dialog:addOption(0, note..tostring(i))
    end

    dialog:setCloseOnMove()

    user:requestSelectionDialog(dialog)

end

function M.selectNote(user)

    local noteLetters = {"A", "B", "C", "D", "E", "F", "G"}

    local callback = function(dialog)

        if not dialog:getSuccess() then
            return
        end

        local selected = dialog:getSelectedIndex() + 1

        for index, note in pairs(noteLetters) do
            if selected == index then
                selectPitch(user, note)
            end
        end
    end

    local text = common.GetNLS(user, "Wähle aus, welche Note du spielen möchtest.", "Select the note you wish to play")

    local dialog = SelectionDialog(common.GetNLS(user, "Notenauswahl", "Note selection"), text, callback)

    for _ , note in ipairs(noteLetters) do
        dialog:addOption(0, note)
    end

    dialog:setCloseOnMove()

    user:requestSelectionDialog(dialog)

end

local function getParchmentForSheet(user)

    local id = Item.parchment
    local leftTool = user:getItemAt(Character.left_tool)
    local rightTool = user:getItemAt(Character.right_tool)
    local sheet = false

    if common.isInList(leftTool.id, {id}) then
        sheet = leftTool
    elseif common.isInList(rightTool.id, {id}) and not common.isBroken(rightTool) then
        sheet = rightTool
    end

    if not sheet then
        user:inform("Du musst eine Feder in der einen Hand und ein Notenblatt oder ein leeres Pergament in der anderen Hand halten, um Musik zu komponieren.", "You need to hold a quill in one hand and a music sheet or a blank parchment in your other hand to compose music.")
        return false
    end

    return sheet
end


local writeMusicToSheet

local function checkTypeAndReturnName(sheet, user, index)

    if sheet:getData("instrument") == "drum" then
        if not index then
            return true
        end
        local soundId = sheet:getData("note"..index)

        for _, sound in pairs(M.drumSounds) do
            if sound.id == soundId then
                return true, common.GetNLS(user, sound.name.german, sound.name.english)
            end
        end
    end

    if index then
        return false, sheet:getData("note"..index)
    else
        return false
    end

end

local function checkIfNewNoteOrEditOld(user, amount, quill)

    local callback = function(dialog)

        if not dialog:getSuccess() then
            return
        end

        local selected = dialog:getSelectedIndex()

        local sheet = getParchmentForSheet(user)

        local verifyAmount = sheet:getData("noteAmount")

        if not sheet then -- We check again after refreshing the sheet item to prevent dupes
            return
        end

        if common.IsNilOrEmpty(verifyAmount) or tonumber(verifyAmount) ~= amount then
            return --The parchment was replaced with a different one
        end

        local isDrum = checkTypeAndReturnName(sheet)

        local newType = false

        if isDrum then
            newType = "drum"
        end

        if selected == 0 then
            writeMusicToSheet(user, true, false, newType, quill)
        else
            writeMusicToSheet(user, true, selected, newType, quill)
        end
    end

    local text = common.GetNLS(user, "Wähle einen Slot aus, wenn du ihn überschreiben möchtest - andernfalls wähle den nächsten freien Slot, um eine weitere Note/einen weiteren Klang ans Ende des Notenblatts hinzuzufügen.", "Select a slot if you want to overwrite it, otherwise choose next slot to add another note/sound to the end of the sheet.")

    local dialog = SelectionDialog(common.GetNLS(user, "Musik komponieren", "Music Composing"), text, callback)

    dialog:addOption(0, common.GetNLS(user, "Nächster Slot", "Next slot"))

    local sheet = getParchmentForSheet(user)

    for i = 1, amount do
        local _, noteOrSoundName = checkTypeAndReturnName(sheet, user, i)
        dialog:addOption(0, noteOrSoundName)
    end

    user:requestSelectionDialog(dialog)

end

local function askForDurationAndSaveNoteDuration(user, entryToReplace, noteSound, amount, sheet, quill)

    amount = tonumber(amount)

    local indexToUse = amount+1

    if entryToReplace then
        indexToUse = entryToReplace
    end

    local stamp = world:getTime("unix")
    sheet:setData("stamp", stamp) --To ensure the parchment isn't changed between note and duration, we make a timestamp
    world:changeItem(sheet)

    local _

    local callback = function (dialog)

        if not dialog:getSuccess() then
            return
        end

        local input = dialog:getInput()

        sheet = getParchmentForSheet(user)

        if not sheet then
            return
        end

        if string.find(input,"(%d+)") ~= nil then
            _, _, input = string.find(input,"(%d+)")
            if tonumber(input) < 1 or tonumber(input) > 100 then
                user:inform(common.GetNLS(user, "Die Zahl muss zwischen 1 und 100 Dezisekunden liegen.", "The number must be between 1 and 100 deciseconds."))
                return
            end
            sheet:setData("noteDuration"..indexToUse, input)
            sheet:setData("note"..indexToUse, noteSound)
            if not entryToReplace then
                sheet:setData("noteAmount", indexToUse)
            end
            world:changeItem(sheet)
            user:inform("Die Note wurde erfolgreich zu deinem Notenblatt hinzugefügt.", "The note was successfully added to your music sheet.")
            M.composeMusic(user, quill)
        else
            user:inform(common.GetNLS(user,"Hier muss eine Zahl eingetragen werden.","Input must be a number."))
        end
    end

    local title = {english = "Duration", german = "Dauer"}

    local text = {
        english = "Here you set in deciseconds how long should pass between this note and the one that comes after it. The shorter the time between notes and the more notes in a sheet, the more likely you will play the wrong note if you are not a grandmaster at playing the instrument.",
        german = "Hier legst du in Zehntelsekunden fest, wie viel Zeit zwischen dieser Note und der nächsten vergehen soll. Je kürzer die Zeit zwischen den Noten und je mehr Noten im Blatt stehen, desto wahrscheinlicher ist es, dass du eine falsche Note spielst ? es sei denn, du bist ein Großmeister auf dem Instrument."
    }
    user:requestInputDialog(InputDialog(common.GetNLS(user,title.german,title.english),common.GetNLS(user,text.german,text.english), false, 255, callback))
end


function writeMusicToSheet(user, checkDone, entryToReplace, instrumentTypeOverride, quill)

    local instruments = {"drum", "harp", "lute", "panpipe", "flute", "clavichord"}
    local instrumentsGerman = {"Trommel", "Harfe", "Laute", "Panflöte", "Flöte", "Klavichord"}
    local sheet = getParchmentForSheet(user)

    if not sheet then
        return
    end

    local theType = sheet:getData("instrument")

    if instrumentTypeOverride then
        theType = instrumentTypeOverride
        sheet:setData("instrument", theType)
        world:changeItem(sheet)
    end

    local amount = sheet:getData("noteAmount")

    if not checkDone and not common.IsNilOrEmpty(theType) and not common.IsNilOrEmpty(amount) then
        checkIfNewNoteOrEditOld(user, tonumber(amount), quill)
        return
    end

    if not common.IsNilOrEmpty(amount) then
        amount = tonumber(amount)
    else
        amount = 0
    end


    --if type and one slot is used, first ask if they want to add the next note or change an existing one

    local callback = function(dialog)

        if not dialog:getSuccess() then
            return
        end

        local selected = dialog:getSelectedIndex() + 1

        sheet = getParchmentForSheet(user)

        if not sheet then -- We check again after refreshing the sheet item to prevent dupes
            return
        end

        local typeVerification = sheet:getData("instrument")

        if theType ~= typeVerification then
            return -- A parchment was found but it doesnt have the correct type as it was moved and replaced with another
        end

        for index, instrument in pairs(instruments) do

            if theType ~= "" then
                break
            end

            if selected == index then
                sheet:setData("instrument", instrument)
                world:changeItem(sheet)
                writeMusicToSheet(user, false, false, false, quill)
            end
        end

        for index, drumSound in pairs(M.drumSounds) do
            if theType ~= "drum" then
                break
            end

            if selected == index then

                askForDurationAndSaveNoteDuration(user, entryToReplace, drumSound.id, amount, sheet, quill)

            end
        end


        for index, note in pairs(notes) do
            if theType == "drum" or theType == "" then
                return
            end

            if selected == index then
                askForDurationAndSaveNoteDuration(user, entryToReplace, note.note, amount, sheet, quill)
            end
        end
    end

    local text = common.GetNLS(user, "Wähle, für welches Instrument du komponieren möchtest.", "Select which instrument to compose for.")

    if theType == "drum" then
        text = common.GetNLS(user, "Wähle den Klang, den du deinem Notenblatt als Nächstes hinzufügen möchtest.", "Select the sound you want to add next to your music sheet.")
    end

    if theType ~= "drum" and theType ~= "" then
        text = common.GetNLS(user, "Wähle die Note, die du deinem Notenblatt als Nächstes hinzufügen möchtest.", "Select the note you want to add next to your music sheet.")
    end


    local dialog = SelectionDialog(common.GetNLS(user, "Musik komponieren", "Music Composing"), text, callback)

    if theType == "" then
        for index, instrument in ipairs(instruments) do
            dialog:addOption(0, common.GetNLS(user, instrumentsGerman[index], instrument))
        end
    elseif theType == "drum" then
        for _, sound in ipairs(M.drumSounds) do
            dialog:addOption(0, common.GetNLS(user, sound.name.german, sound.name.english))
        end
    else
        for _, note in ipairs(notes) do
            dialog:addOption(0, note.note)
        end
    end

    user:requestSelectionDialog(dialog)

end

local function isBookInHand(user)

    local bookPositions = {Character.left_tool, Character.right_tool}

    for _, bookPos in pairs(bookPositions) do
        local book = user:getItemAt(bookPos)

        for _, bookColour in pairs(tailoring.books) do --is it a book
            for _, bookID in pairs(bookColour) do
                if bookID == book.id then
                    local bookPermissions = book:getData("bookPermissions")

                    if not common.IsNilOrEmpty(book:getData("book")) or (not common.IsNilOrEmpty(bookPermissions)) then --is it an official book already or a book written by someone else
                        user:inform("Dieses Buch wurde von einem anderen Verfasser geschrieben. Bitte kritzel nicht in ihm herum.", "This is a book that's already been written, and by a different author. It's not your place to write in it.")
                        return false
                    end

                    if book.number > 1 then
                        user:inform("Du kannst nur in einem Buch gleichzeitig schreiben.", "You can only write in one book at a time.")
                        return false
                    end

                    return book
                end
            end
        end
    end

    user:inform("Nimm das Buch in die Hand um in ihm zu schreiben.", "You must hold a book in your hand if you want to write in it.")
    return false

end

local parchmentSelectionStatus = {}

function M.addNewSheetToBook(user, sheet)

    parchmentSelectionStatus[user.name].status = false

    if sheet.wear == 255 then
        user:inform("Diesem Buch kannst du keine Seiten hinzufügen.", "You can't add this page to the book, it's been pinned down!")
        return
    end

    local book = isBookInHand(user)

    if not book then
        return
    end

    local noteAmount = sheet:getData("noteAmount")
    local sheetAmount = book:getData("sheetAmount")

    if common.IsNilOrEmpty(sheetAmount) then
        sheetAmount = 0
    else
        sheetAmount = tonumber(sheetAmount)
    end

    if common.IsNilOrEmpty(noteAmount) then
        return --No music on sheet to add
    else
        noteAmount = tonumber(noteAmount)
    end

    local nextSheet = sheetAmount + 1

    book:setData("sheet"..nextSheet.."noteAmount", tostring(noteAmount))
    book:setData("sheet"..nextSheet.."instrument", sheet:getData("instrument"))
    book:setData("sheet"..nextSheet.."sheetName", sheet:getData("sheetName"))

    for i = 1, noteAmount do
        book:setData("sheet"..nextSheet.."note"..i, sheet:getData("note"..i))
        book:setData("sheet"..nextSheet.."noteDuration"..i, sheet:getData("noteDuration"..i))
    end

    book:setData("sheetAmount", nextSheet)

    world:changeItem(book)

    world:erase(sheet, 1)

    user:inform("Seite hinzugefügt.", "You added the selected parchment to the book.")

end

local function putSheetInBook(user)

    if not parchmentSelectionStatus[user.name] then
        parchmentSelectionStatus[user.name] = {}
    end
        parchmentSelectionStatus[user.name].status = true
        parchmentSelectionStatus[user.name].position = user.pos

    user:inform("Benutze die Schriftrolle, die du dem Buch als Seite hinzufügen möchtest.", "Select the parchment you want to add to the book as a page by using it.")
end

function M.getParchmentSelectionStatus(user)
    if not parchmentSelectionStatus[user.name] then
        return false
    end

    if parchmentSelectionStatus[user.name].position ~= user.pos then
        return -- user moved
    end

    return parchmentSelectionStatus[user.name].status
end


local function removeSheetFromBook(user)

    local book = isBookInHand(user)

    if not book then
        return
    end

    local sheetAmount = tonumber(book:getData("sheetAmount"))

    if not sheetAmount or sheetAmount <= 0 then
        user:inform("Du kannst keine Seite aus einem leeren Buch entfernen.", "You can not remove a page from a book that has none.")
        return
    end

    local sheetData = {}

    local noteAmount = book:getData("sheet"..sheetAmount.."noteAmount")

    local instrument = book:getData("sheet"..sheetAmount.."instrument")

    local sheetName = book:getData("sheet"..sheetAmount.."sheetName")

    sheetData["instrument"] = instrument
    sheetData["noteAmount"] = noteAmount
    sheetData["sheetName"] = sheetName

    book:setData("sheet"..sheetAmount.."noteAmount", "")
    book:setData("sheet"..sheetAmount.."instrument", "")
    book:setData("sheet"..sheetAmount.."sheetName", "")

    if not noteAmount then return end

    for i = 1, tonumber(noteAmount) do
        local note = book:getData("sheet"..sheetAmount.."note"..i)
        local noteDuration = book:getData("sheet"..sheetAmount.."noteDuration"..i)
        sheetData["note"..i] = note
        sheetData["noteDuration"..i] = noteDuration
        book:setData("sheet"..sheetAmount.."note"..i, "")
        book:setData("sheet"..sheetAmount.."noteDuration"..i, "")
    end

    if sheetAmount - 1 == 0 then
        book:setData("sheetAmount", "")
    else
        book:setData("sheetAmount", tostring(sheetAmount-1))
    end

    user:createItem(Item.parchment, 1, 333, sheetData)

    world:changeItem(book)

    user:inform("Du reißt die Seite vorsichtig aus dem Buch.", "Carefully removing the page from the book, you are left with a written parchment.")

end

local function checkIfSheetInHand(user, quill)

    local parchment = common.GetTargetItem(user, quill)

    if parchment and parchment.id == Item.parchment and not common.IsNilOrEmpty(parchment:getData("instrument")) then
        return parchment
    end

    return nil

end

local function nameSheet(user, quill)

    local title  = common.GetNLS(user, "Notenblatt benennen", "Sheet naming")
    local infoText = common.GetNLS(user, "Gib den Namen deines Notenblatts ein.", "Insert what you want to name your sheet.")

    local callback = function(dialog)
        if dialog:getSuccess() then
            local sheet = checkIfSheetInHand(user, quill) -- check for the sheet again
            if sheet then

                local name = dialog:getInput()
                sheet:setData("sheetName", name)
                world:changeItem(sheet)
                user:inform("Du hast das Notenblatt erfolgreich "..name.." benannt.","You successfully named the music sheet "..name..".")

            else
                user:inform("Du brauchst ein Notenblatt, wenn du eines benennen möchtest.","You need a music sheet if you want to name one.")
            end
        end
    end
    local dialog = InputDialog(title, infoText, false, 100, callback)
    user:requestInputDialog(dialog)
end

function M.composeMusic(user, quill)


    local callback = function(dialog)

        if not dialog:getSuccess() then
            return
        end

        local selected = dialog:getSelectedIndex() + 1

        if selected == 1 then
            writeMusicToSheet(user, false, false, false, quill)
        elseif selected == 2 then
            nameSheet(user, quill)
        elseif selected == 3 then
            putSheetInBook(user)
        elseif selected == 4 then
            removeSheetFromBook(user)
        end
    end

    local text = common.GetNLS(user, "Wähle, was du tun möchtest.", "Select what you want to do.")

    local dialog = SelectionDialog(common.GetNLS(user, "Musik komponieren", "Music Composing"), text, callback)

    dialog:addOption(0, common.GetNLS(user, "Musik auf ein Notenblatt komponieren", "Compose music onto a sheet"))
    dialog:addOption(0, common.GetNLS(user, "Notenblatt benennen", "Sheet naming"))
    dialog:addOption(0, common.GetNLS(user, "Ein Notenblatt in ein Buch einfügen", "Add a music sheet to a book"))
    dialog:addOption(0, common.GetNLS(user, "Ein Notenblatt aus einem Buch entfernen", "Remove a music sheet from a book"))

    user:requestSelectionDialog(dialog)

end

return M

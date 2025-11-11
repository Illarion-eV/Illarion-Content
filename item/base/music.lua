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

local notes = { --All instruments that use the standard A-G, 1-7 note/pitch range go here. B/H are duplicate sounds as it is just a matter of translation.
    { note = "A1", lute = 123, harp = 45, panpipe = 172, flute = 221, clavichord = 270 },
    { note = "A2", lute = 124, harp = 46, panpipe = 173, flute = 222, clavichord = 271 },
    { note = "A3", lute = 125, harp = 47, panpipe = 174, flute = 223, clavichord = 272 },
    { note = "A4", lute = 126, harp = 48, panpipe = 175, flute = 224, clavichord = 273 },
    { note = "A5", lute = 127, harp = 49, panpipe = 176, flute = 225, clavichord = 274 },
    { note = "A6", lute = 128, harp = 50, panpipe = 177, flute = 226, clavichord = 275 },
    { note = "A7", lute = 129, harp = 51, panpipe = 178, flute = 227, clavichord = 276 },

    -- A# (Sharp)
    { note = "A#1", lute = 354, harp = 319, panpipe = 389, flute = 424, clavichord = 459 },
    { note = "A#2", lute = 355, harp = 320, panpipe = 390, flute = 425, clavichord = 460 },
    { note = "A#3", lute = 356, harp = 321, panpipe = 391, flute = 426, clavichord = 461 },
    { note = "A#4", lute = 357, harp = 322, panpipe = 392, flute = 427, clavichord = 462 },
    { note = "A#5", lute = 358, harp = 323, panpipe = 393, flute = 428, clavichord = 463 },
    { note = "A#6", lute = 359, harp = 324, panpipe = 394, flute = 429, clavichord = 464 },
    { note = "A#7", lute = 360, harp = 325, panpipe = 395, flute = 430, clavichord = 465 },

    { note = "B1", lute = 130, harp = 52, panpipe = 179, flute = 228, clavichord = 277 },
    { note = "B2", lute = 131, harp = 53, panpipe = 180, flute = 229, clavichord = 278 },
    { note = "B3", lute = 132, harp = 54, panpipe = 181, flute = 230, clavichord = 279 },
    { note = "B4", lute = 133, harp = 55, panpipe = 182, flute = 231, clavichord = 280 },
    { note = "B5", lute = 134, harp = 56, panpipe = 183, flute = 232, clavichord = 281 },
    { note = "B6", lute = 135, harp = 57, panpipe = 184, flute = 233, clavichord = 282 },
    { note = "B7", lute = 136, harp = 58, panpipe = 185, flute = 234, clavichord = 283 },

    { note = "H1", lute = 130, harp = 52, panpipe = 179, flute = 228, clavichord = 277 },
    { note = "H2", lute = 131, harp = 53, panpipe = 180, flute = 229, clavichord = 278 },
    { note = "H3", lute = 132, harp = 54, panpipe = 181, flute = 230, clavichord = 279 },
    { note = "H4", lute = 133, harp = 55, panpipe = 182, flute = 231, clavichord = 280 },
    { note = "H5", lute = 134, harp = 56, panpipe = 183, flute = 232, clavichord = 281 },
    { note = "H6", lute = 135, harp = 57, panpipe = 184, flute = 233, clavichord = 282 },
    { note = "H7", lute = 136, harp = 58, panpipe = 185, flute = 234, clavichord = 283 },

    { note = "C1", lute = 137, harp = 59, panpipe = 186, flute = 235, clavichord = 284 },
    { note = "C2", lute = 138, harp = 60, panpipe = 187, flute = 236, clavichord = 285 },
    { note = "C3", lute = 139, harp = 61, panpipe = 188, flute = 237, clavichord = 286 },
    { note = "C4", lute = 140, harp = 62, panpipe = 189, flute = 238, clavichord = 287 },
    { note = "C5", lute = 141, harp = 63, panpipe = 190, flute = 239, clavichord = 288 },
    { note = "C6", lute = 142, harp = 64, panpipe = 191, flute = 240, clavichord = 289 },
    { note = "C7", lute = 143, harp = 65, panpipe = 192, flute = 241, clavichord = 290 },

    -- C# (Sharp)
    { note = "C#1", lute = 361, harp = 326, panpipe = 396, flute = 431, clavichord = 466 },
    { note = "C#2", lute = 362, harp = 327, panpipe = 397, flute = 432, clavichord = 467 },
    { note = "C#3", lute = 363, harp = 328, panpipe = 398, flute = 433, clavichord = 468 },
    { note = "C#4", lute = 364, harp = 329, panpipe = 399, flute = 434, clavichord = 469 },
    { note = "C#5", lute = 365, harp = 330, panpipe = 400, flute = 435, clavichord = 470 },
    { note = "C#6", lute = 366, harp = 331, panpipe = 401, flute = 436, clavichord = 471 },
    { note = "C#7", lute = 367, harp = 332, panpipe = 402, flute = 437, clavichord = 472 },

    { note = "D1", lute = 144, harp = 66, panpipe = 193, flute = 242, clavichord = 291 },
    { note = "D2", lute = 145, harp = 67, panpipe = 194, flute = 243, clavichord = 292 },
    { note = "D3", lute = 146, harp = 68, panpipe = 195, flute = 244, clavichord = 293 },
    { note = "D4", lute = 147, harp = 69, panpipe = 196, flute = 245, clavichord = 294 },
    { note = "D5", lute = 148, harp = 70, panpipe = 197, flute = 246, clavichord = 295 },
    { note = "D6", lute = 149, harp = 71, panpipe = 198, flute = 247, clavichord = 296 },
    { note = "D7", lute = 150, harp = 72, panpipe = 199, flute = 248, clavichord = 297 },

    -- D# (Sharp)
    { note = "D#1", lute = 368, harp = 333, panpipe = 403, flute = 438, clavichord = 473 },
    { note = "D#2", lute = 369, harp = 334, panpipe = 404, flute = 439, clavichord = 474 },
    { note = "D#3", lute = 370, harp = 335, panpipe = 405, flute = 440, clavichord = 475 },
    { note = "D#4", lute = 371, harp = 336, panpipe = 406, flute = 441, clavichord = 476 },
    { note = "D#5", lute = 372, harp = 337, panpipe = 407, flute = 442, clavichord = 477 },
    { note = "D#6", lute = 373, harp = 338, panpipe = 408, flute = 443, clavichord = 478 },
    { note = "D#7", lute = 374, harp = 339, panpipe = 409, flute = 444, clavichord = 479 },

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

    -- F# (Sharp)
    { note = "F#1", lute = 375, harp = 340, panpipe = 410, flute = 445, clavichord = 480 },
    { note = "F#2", lute = 376, harp = 341, panpipe = 411, flute = 446, clavichord = 481 },
    { note = "F#3", lute = 377, harp = 342, panpipe = 412, flute = 447, clavichord = 482 },
    { note = "F#4", lute = 378, harp = 343, panpipe = 413, flute = 448, clavichord = 483 },
    { note = "F#5", lute = 379, harp = 344, panpipe = 414, flute = 449, clavichord = 484 },
    { note = "F#6", lute = 380, harp = 345, panpipe = 415, flute = 450, clavichord = 485 },
    { note = "F#7", lute = 381, harp = 346, panpipe = 416, flute = 451, clavichord = 486 },

    { note = "G1", lute = 165, harp = 87, panpipe = 214, flute = 263, clavichord = 312 },
    { note = "G2", lute = 166, harp = 88, panpipe = 215, flute = 264, clavichord = 313 },
    { note = "G3", lute = 167, harp = 89, panpipe = 216, flute = 265, clavichord = 314 },
    { note = "G4", lute = 168, harp = 90, panpipe = 217, flute = 266, clavichord = 315 },
    { note = "G5", lute = 169, harp = 91, panpipe = 218, flute = 267, clavichord = 316 },
    { note = "G6", lute = 170, harp = 92, panpipe = 219, flute = 268, clavichord = 317 },
    { note = "G7", lute = 171, harp = 93, panpipe = 220, flute = 269, clavichord = 318 },

    -- G# (Sharp)
    { note = "G#1", lute = 382, harp = 347, panpipe = 417, flute = 452, clavichord = 487 },
    { note = "G#2", lute = 383, harp = 348, panpipe = 418, flute = 453, clavichord = 488 },
    { note = "G#3", lute = 384, harp = 349, panpipe = 419, flute = 454, clavichord = 489 },
    { note = "G#4", lute = 385, harp = 350, panpipe = 420, flute = 455, clavichord = 490 },
    { note = "G#5", lute = 386, harp = 351, panpipe = 421, flute = 456, clavichord = 491 },
    { note = "G#6", lute = 387, harp = 352, panpipe = 422, flute = 457, clavichord = 492 },
    { note = "G#7", lute = 388, harp = 353, panpipe = 423, flute = 458, clavichord = 493 }
}




M.step = {}

local drumSounds = { --Since drums dont use the A1-G7 tones it needs its own list and functions
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

local drumLookup = {}

local function convertToTableOfNotes(sheetTable)

    local noteString = sheetTable.notes

    for i = 2, 10 do
        if sheetTable["notes"..i] then
            noteString = noteString..sheetTable["notes"..i]
        end
    end

    local retTable = {}
    local parts = {}

    for part in string.gmatch(noteString, "([^,]+)") do
        table.insert(parts, part)
    end

    local step = 1
    for i = 1, #parts, 2 do
        local note = parts[i]
        local duration = tonumber(parts[i + 1])
        if note and duration then
            table.insert(retTable, { step = step, note = note, duration = duration })
            step = step + 1
        end
    end

    return retTable
end


for _, drum in ipairs(drumSounds) do
    drumLookup[drum.id] = drum.name
end

local function viewListOfNotes(user, sheetTable)

    local notesList = convertToTableOfNotes(sheetTable)

    for _, note in pairs(notesList) do
        if sheetTable.instrument == "drum" then
            note.name = drumLookup[note.note]
        else
            note.name = {}
            note.name.english = note.note
            note.name.german = note.note
        end
    end

    local name = sheetTable.name
    local title = not common.IsNilOrEmpty(name) and name or common.GetNLS(user, "Unbenanntes Notenblatt", "Unnamed sheet")

    local callback = function(dialog)

        if not dialog:getSuccess() then
            return
        end

        local selected = dialog:getSelectedIndex() + 1

        for index, note in pairs(notesList) do
            if index == selected then
                if sheetTable.instrument == "drum" then
                    M.selectSound(user, false, notesList, index)
                else
                    M.selectNote(user, notesList, index)
                end
            end
        end
    end

    local text = common.GetNLS(user, "", "Here you can not only view a list of the notes your sheet contains, but also select one if you wish to edit it.")

    local dialog = SelectionDialog(title, text, callback)

    for _, note in ipairs(notesList) do
        dialog:addOption(0, common.GetNLS(user, note.name.german.." "..note.duration.." Dezisekunden", note.name.english.." "..note.duration.." deciseconds."))
    end

    dialog:setCloseOnMove()

    user:requestSelectionDialog(dialog)
end

function M.noteListView(user, ltstate, sheetTable)

    local callback = function(dialog)

        if not dialog:getSuccess() then
            return
        end

        local selected = dialog:getSelectedIndex() + 1

        if selected == 1 then
            M.playTheInstrument(user, ltstate, sheetTable)
        elseif selected == 2 then
            viewListOfNotes(user, sheetTable)
        elseif selected == 3 then
            M.playMusicTogether(user, ltstate)
        end
    end

    local dialog = SelectionDialog(common.GetNLS(user, "Notenblatt", "Music sheet"), "", callback)

    dialog:addOption(0, common.GetNLS(user, "Lied abspielen", "Play song"))
    dialog:addOption(0, common.GetNLS(user, "Noten anzeigen", "View notes"))
    dialog:addOption(0, common.GetNLS(user, "Mit anderen Musik machen", "Play Music With Others"))

    dialog:setCloseOnMove()

    user:requestSelectionDialog(dialog)

end

function M.instrumentIsInHandOrInFrontOfUser(user, sheetTable)

    local validInstruments = {
        {id = Item.harp, skill = Character.harp, name = "harp"},
        {id = Item.flute, skill = Character.flute, name = "flute"},
        {id = Item.lute, skill = Character.lute, name = "lute"},
        {id = Item.panpipe, skill = Character.panpipe, name = "panpipe"},
        {id = 4837, skill = Character.clavichord, name = "clavichord", breakException = true},
        {id = 4838, skill = Character.clavichord, name = "clavichord", breakException = true}}

    local leftTool = user:getItemAt(Character.left_tool)
    local rightTool = user:getItemAt(Character.right_tool)
    local frontItem = common.GetFrontItem(user)

    local locationsToCheck = {leftTool, rightTool, frontItem}

    local notFound = common.GetNLS(user, "Sie benötigen ein Instrument in der Hand oder vor sich, auf dem Sie Noten spielen können.", "You need an instrument in your hands or in front of you that you can play notes on.")

    if sheetTable.instrument == "drum" then
        validInstruments = {{ id = Item.drum, skill = Character.drum, name = "drum"}}
        notFound = common.GetNLS(user, "Sie benötigen eine Trommel in der Hand oder vor sich, um zu spielen.", "You need a drum in your hands or in front of you to play.")
    end

    local theInstrument, theSkill, instrumentName = false, false, false

    for _, location in pairs(locationsToCheck) do
        for _, validInstrument in pairs(validInstruments) do
            if location and location.id == validInstrument.id and (validInstrument.breakException or not common.isBroken(location)) then
                theInstrument = location
                theSkill = validInstrument.skill
                instrumentName = validInstrument.name
            end
        end
    end

    if not theInstrument then
        user:inform(notFound)
        return false
    end

    return theInstrument, instrumentName, theSkill
end

local function getAmountOfNotesInSheet(sheetTable)

    local noteTable = convertToTableOfNotes(sheetTable)

    return #noteTable

end

local function getNoteToPlayBasedOnStep(sheetTable, theStep)

    local noteTable = convertToTableOfNotes(sheetTable)

    for _, note in pairs(noteTable) do
        if theStep == note.step then
            return note.note, note.duration
        end
    end

end

local function levelImpact(user, skillId, note, noteDuration, amount, instrumentName)

    local level = user:getSkill(skillId)

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

    if instrumentName == "drum" then
        local randomNote = math.random(1, #drumSounds)

        return drumSounds[randomNote].id
    end

    local randomNote = math.random(1, #notes)

    return notes[randomNote].note
end

local function playNote(user, sheetTable)

    if not M.step[user.id] then
        M.step[user.id] = 1
    end

    local note, noteDuration = getNoteToPlayBasedOnStep(sheetTable, M.step[user.id])

    if not note or common.IsNilOrEmpty(note) then
        M.step[user.id] = 1
        M.step["lastDuration"..tostring(user.id)] = 0
        return --This is a failsafe. Shouldn't happen normally.
    end

    local amount = getAmountOfNotesInSheet(sheetTable)

    local instrument, instrumentName, skillId = M.instrumentIsInHandOrInFrontOfUser(user, sheetTable)

    if not instrument then
        return
    end

    note = levelImpact(user, skillId, note, noteDuration, amount, instrumentName)

    --Lower level, more notes and faster play will increase chance to play the wrong note
    --At level 100 you no longer play wrong notes.

    local sfx = false

    for _, selectedNote in pairs(notes) do
        if selectedNote.note == note then
            sfx = selectedNote[instrumentName]
        end
    end

    if instrumentName == "drum" then
        sfx = tonumber(note)
    end

    if common.IsNilOrEmpty(amount) then
        M.step["lastDuration"..tostring(user.id)] = 0
        M.step[user.id] = 1
        return
    end

    M.step[user.id] = M.step[user.id] + 1

    local lastDuration = M.step["lastDuration"..tostring(user.id)]

    if instrumentName ~= "clavichord" then --Clavichord as a static tool shouldnt break
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
        user:learn(skillId, lastDuration, 100)
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

function M.playTheInstrument(user, actionState, sheetTable)

    if not sheetTable then
        sheetTable = M.selectedNote[user.id]
    end

    if actionState == Action.none then
        playNote(user, sheetTable)
    elseif actionState == Action.success then
        playNote(user, sheetTable)
    elseif actionState == Action.abort then
        M.step[user.id] = 1
        M.step["lastDuration"..tostring(user.id)] = 0
    end

end

M.selectedNote = {}

local function convertToNotesAndSave(user, sheet, notesList)

    local convertedNotes = ""

    for _, note in ipairs(notesList) do

        if convertedNotes ~= "" then
            convertedNotes = convertedNotes..","
        end

        convertedNotes = convertedNotes..note.note..","..note.duration
    end

    sheet:setData("notes", string.sub(convertedNotes, 1, 250))

    for i = 2, 10 do
        sheet:setData("notes"..i, string.sub(convertedNotes, 1+(250*i-1), 250*i))
    end

    user:inform("Du änderst die Note.", "You change the note.")

    world:changeItem(sheet)

end

local function checkIfSheetInHand(user, quill, notesList)

    if quill then

        local parchment = common.GetTargetItem(user, quill)

        if parchment and parchment.id == Item.parchment and common.IsNilOrEmpty(parchment:getData("writtenText")) and common.IsNilOrEmpty(parchment:getData("alchemyRecipe")) then
            return parchment
        end
    elseif notesList then

        local id = Item.parchment
        local leftTool = user:getItemAt(Character.left_tool)
        local rightTool = user:getItemAt(Character.right_tool)
        local sheet = false

        if common.isInList(leftTool.id, {id}) and leftTool:getData("instrument") ~= "" then
            sheet = leftTool
        elseif common.isInList(rightTool.id, {id}) and rightTool:getData("instrument") ~= ""  then
            sheet = rightTool
        end

        if sheet then
            return sheet
        end
    end

    return nil

end

local function selectDuration(user, noteId, notesList, index)

    local callback = function(dialog)

        if not dialog:getSuccess() then
            return
        end

        local sheet = checkIfSheetInHand(user, false, notesList)

        if not sheet then
            return
        end

        local input = dialog:getInput()

        local num = tonumber(input)

        if not num or num < 1 or num > 100 then
            user:inform("Die eingegebene Dauer muss eine Zahl zwischen 1 und 100 sein.", "The input duration must be a number between 1 and 100.")
            return
        end

        notesList[index].note = noteId
        notesList[index].duration = input

        convertToNotesAndSave(user, sheet, notesList)
    end

    local instructions = common.GetNLS(user, "Wählen Sie die Dauer zwischen 1 und 100 Dezisekunden, die vergehen soll, bevor die nächste Note nach dieser gespielt wird.", "Select the duration, between 1 and 100 deciseconds, it should take before the next note is played after this one.")

    local dialog = InputDialog(common.GetNLS(user, "Musik komponieren", "Music Composing"), instructions, false, 255, callback)

    user:requestInputDialog(dialog)

end

local function selectPitch(user, note, notesList, index)

    local callback = function(dialog)

        if not dialog:getSuccess() then
            return
        end

        local selected = dialog:getSelectedIndex() + 1

        for i = 1, 7 do
            if selected == i then

                i = 7-(i-1)

                if notesList then
                    selectDuration(user, note..tostring(i), notesList, index)
                else

                    M.selectedNote[user.id] = {notes = note..tostring(i)..",1", instrument = "notes"}

                    local instrument = M.instrumentIsInHandOrInFrontOfUser(user, M.selectedNote[user.id])

                    if not instrument then
                        return
                    end

                    user:startAction(1, 65, 1, 0, 0)
                end
            end
        end
    end

    local text = common.GetNLS(user, "Wähle aus, in welcher Tonhöhe du die Note spielen möchtest.", "Select which pitch you want to play the note at")

    local dialog = SelectionDialog(common.GetNLS(user, "Tonhöhenauswahl", "Pitch selection"), text, callback)

    for i = 1, 7 do
        dialog:addOption(0, note..tostring(7-(i-1)))
    end

    dialog:setCloseOnMove()

    user:requestSelectionDialog(dialog)

end

function M.selectNote(user, notesList, index)

    local noteLetters = common.GetNLS(user,{"H", "A#","A", "G#","G", "F#","F", "E", "D#", "D", "C#", "C"} , {"B", "A#","A", "G#","G", "F#","F", "E", "D#", "D", "C#", "C"})

    local callback = function(dialog)

        if not dialog:getSuccess() then
            return
        end

        local selected = dialog:getSelectedIndex() + 1

        for i, note in pairs(noteLetters) do
            if selected == i then
                selectPitch(user, note, notesList, index)
            end
        end
    end

    local text = common.GetNLS(user, "Wähle aus, welche Note du spielen möchtest.", "Select the note you wish to play")

    if notesList then
        text = common.GetNLS(user, "Wähle die Note aus, mit der du die vorherige ersetzen möchtest.", "Select the note you wish to replace the previous one with.")
    end

    local dialog = SelectionDialog(common.GetNLS(user, "Notenauswahl", "Note selection"), text, callback)

    for _ , note in ipairs(noteLetters) do
        dialog:addOption(0, note)
    end

    dialog:setCloseOnMove()

    user:requestSelectionDialog(dialog)

end

local function addSound(user, quill, soundId, notesList, index)

    local callback = function(dialog)

        if not dialog:getSuccess() then
            return
        end

        local sheet = checkIfSheetInHand(user, quill, notesList)

        if not sheet then
            return
        end

        local input = dialog:getInput()

        local num = tonumber(input)

        if not num or num < 1 or num > 100 then
            user:inform("Die eingegebene Dauer muss eine Zahl zwischen 1 und 100 sein.", "The input duration must be a number between 1 and 100.")
            return
        end

        if quill then

            local existingNotes = sheet:getData("notes")

            for i = 2, 10 do
                existingNotes = existingNotes..sheet:getData("notes"..i)
            end

            if existingNotes ~= "" then
                existingNotes = existingNotes..","
            end

            existingNotes = existingNotes..tostring(soundId)..","..input

            if string.len(existingNotes) > 2500 then
                user:inform("Das Notenblatt kann nicht so viele Noten aufnehmen.", "The music sheet can not hold that many notes.")
                return
            end

            sheet:setData("notes", string.sub(existingNotes, 1, 250))

            for i = 2, 10 do
                sheet:setData("notes"..i, string.sub(existingNotes, 1+(250*i-1), 250*i))
            end

            sheet:setData("instrument", "drum")

            world:changeItem(sheet)

            user:inform("Sie fügen die neuen Klänge dem Notenblatt hinzu.", "You add the new sounds to the sheet.")

            M.selectSound(user, quill)
        else
            notesList[index].note = soundId
            notesList[index].duration = input

            convertToNotesAndSave(user, sheet, notesList)
        end
    end

    local instructions = common.GetNLS(user, "Wählen Sie die Dauer zwischen 1 und 100 Dezisekunden, die vergehen soll, bevor die nächste Note nach dieser gespielt wird.", "Select the duration, between 1 and 100 deciseconds, it should take before the next note is played after this one.")

    local dialog = InputDialog(common.GetNLS(user, "Musik komponieren", "Music Composing"), instructions, false, 255, callback)

    user:requestInputDialog(dialog)
end

function M.selectSound(user, quill, notesList, index)

    local callback = function(dialog)

        if not dialog:getSuccess() then
            return
        end

        local selected = dialog:getSelectedIndex() + 1

        for i, sound in ipairs(drumSounds) do
            if selected == i then
                if quill or notesList then
                    addSound(user, quill, sound.id, notesList, index)
                else
                    M.selectedNote[user.id] = {notes = sound.id..",1", instrument = "drum"}

                    local instrument = M.instrumentIsInHandOrInFrontOfUser(user, M.selectedNote[user.id])

                    if not instrument then
                        return
                    end

                    user:startAction(1, 65, 1, 0, 0)
                end
            end
        end
    end

    local text = common.GetNLS(user, "Wählen Sie einen Klang zum Abspielen aus.", "Select a sound to play.")

    if quill then
        text = common.GetNLS(user, "Wählen Sie einen Klang aus, der dem Notenblatt hinzugefügt werden soll.", "Select a sound to add to the sheet.")
    end

    if notesList then
        text = common.GetNLS(user, "Wähle einen Klang aus, um den ausgewählten zu ersetzen.", "Select a sound to replace the selected one with.")
    end

    local dialog = SelectionDialog(common.GetNLS(user, "Notenauswahl", "Sound selection"), text, callback)

    for _ , sound in ipairs(drumSounds) do
        dialog:addOption(0, common.GetNLS(user, sound.name.german, sound.name.english))
    end

    dialog:setCloseOnMove()

    user:requestSelectionDialog(dialog)

end

local function verifyInput(user, input)

    if type(input) ~= "string" or common.IsNilOrEmpty(input) then
        return false
    end

    local parts = {}
    for part in string.gmatch(input, "([^,]+)") do
        table.insert(parts, part)
    end

    -- Must be pairs of note,duration
    if #parts % 2 ~= 0 then
        user:inform("Noten und Dauern müssen paarweise eingegeben werden.", "Notes and durations must be entered in pairs.")
        return false
    end

    for i = 1, #parts, 2 do

        local note = parts[i]

        local duration = tonumber(parts[i + 1])

        local noteIsValid = false

        -- Check note validity
        for _, selectedNote in pairs(notes) do
            if selectedNote.note == note then
                noteIsValid = true
                break
            end
        end

        if not noteIsValid then
            user:inform("Eine oder mehrere eingegebene Noten sind keine gültigen Noten.", "One or more notes input are not a valid note.")
            return false
        end

        -- Check duration validity
        if not duration or duration < 1 or duration > 100 then
            user:inform("Die Dauer jeder Note muss zwischen 1 und 100 Dezisekunden liegen.", "The duration for each note must be between 1 and 100 deciseconds")
            return false
        end
    end

    return true
end

local function inputNotes(user, quill)

    local callback = function(dialog)

        if not dialog:getSuccess() then
            return
        end

        local sheet = checkIfSheetInHand(user, quill)

        if not sheet then
            return
        end

        local input = dialog:getInput()

        if not verifyInput(user, input) then
            return
        end

        local existingNotes = sheet:getData("notes")

        for i = 2, 10 do
            existingNotes = existingNotes..sheet:getData("notes"..i)
        end

        if existingNotes ~= "" then
            existingNotes = existingNotes..","
        end

        existingNotes = existingNotes..input

        if string.len(existingNotes) > 2500 then
            user:inform("Das Notenblatt kann nicht so viele Noten aufnehmen.", "The music sheet can not hold that many notes.")
            return
        end

        sheet:setData("notes", string.sub(existingNotes, 1, 250))

        for i = 2, 10 do
            sheet:setData("notes"..i, string.sub(existingNotes, 1+(250*i-1), 250*i))
        end

        sheet:setData("instrument", "notes")

        world:changeItem(sheet)

        user:inform("Sie fügen die neuen Noten dem Notenblatt hinzu.", "You add the new notes to the sheet.")

    end

    local instructions = common.GetNLS(user,
    "Um ein Notenblatt zu komponieren, geben Sie die Noten und die Dauer bis zur nächsten Note in Dezisekunden ein, getrennt durch ein Komma. \nBeispiel: A1,3,A4,10,D4,7\n\nWenn Ihr Notenblatt bereits Noten enthält und Ihr Eingabeformat gültig ist, werden die neuen Noten daran angehängt.\nVerfügbare Noten: H,A#,A,G#,G,F#,F,E,D#,D,C#,C mit den Tonhöhen 1-7.",
    "To compose a sheet of music notes, you enter the notes and the duration until the next one is played in deciseconds, separated by a comma.\n Example: A1,3,A4,10,D4,7\n\nIf your sheet already contains notes, your input if a valid format will be added onto them.\nAvailable notes: B,A#,A,G#,G,F#,F,E,D#,D,C#,C of pitches 1-7.")

    local dialog = InputDialog(common.GetNLS(user, "Musik komponieren", "Music Composing"), instructions, false, 255, callback)

    user:requestInputDialog(dialog)

end

local function addNotesToSheet(user, quill)

    local sheet = checkIfSheetInHand(user, quill)

    if not sheet then
        return
    end

    local callback = function(dialog)

        if not dialog:getSuccess() then
            return
        end

        sheet = checkIfSheetInHand(user, quill)

        if not sheet then
            return
        end

        local selected = dialog:getSelectedIndex() + 1

        if selected == 1 then
            inputNotes(user, quill)
        else
            M.selectSound(user, quill)
        end
    end

    local text = common.GetNLS(user, "Komponieren Sie für ein tonbasiertes Instrument oder für Schlagzeug?", "Are you composing for a note based instrument or drums?")

    local dialog = SelectionDialog(common.GetNLS(user, "Instrumentenauswahl", "Instrument Selection"), text, callback)

    dialog:addOption(0, common.GetNLS(user, "Tonbasiertes", "Note based"))

    dialog:addOption(0, common.GetNLS(user, "Schlagzeug", "Drums"))

    dialog:setCloseOnMove()

    local instrument = sheet:getData("instrument")

    if instrument == "notes" then
        inputNotes(user, quill)
    elseif instrument == "drum" then
        M.selectSound(user, quill)
    else
        user:requestSelectionDialog(dialog)
    end

end

local function isBookInHand(user)

    local bookPositions = {Character.left_tool, Character.right_tool}

    for _, bookPos in pairs(bookPositions) do
        local book = user:getItemAt(bookPos)

        for _, bookColour in pairs(tailoring.books) do --is it a book
            for _, bookID in pairs(bookColour) do
                if bookID == book.id then
                    local bookPermissions = book:getData("bookPermissions")

                    if not common.IsNilOrEmpty(book:getData("book")) or (not common.IsNilOrEmpty(bookPermissions)) then --is it an official book already or a book used as a player book
                        user:inform("Dies ist ein Buch, das bereits beschrieben wurde und sich nicht zum Aufbewahren von Notenblättern eignet.", "This is a book that's already been written in and is not suitable for holding music sheets.")
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

    local theNotes = sheet:getData("notes")
    local sheetAmount = book:getData("sheetAmount")

    if common.IsNilOrEmpty(sheetAmount) then
        sheetAmount = 0
    else
        sheetAmount = tonumber(sheetAmount)
    end

    if sheetAmount > 20 then -- item data storage is limited to one byte of entries, each sheet has 12 entries. That's 240 entries.
            user:inform("Ein einzelnes Buch hat nur Platz für 20 Notenblätter.", "A single book only has enough space for 20 sheets of sheet music.")
        return
    end

    if common.IsNilOrEmpty(theNotes) then
            user:inform("Das ausgewählte Blatt muss Noten enthalten.", "The selected sheet has to contain sheet music.")
        return -- This isn't a musical sheet
    end

    local nextSheet = sheetAmount + 1

    book:setData("sheet"..nextSheet.."notes", theNotes)
    book:setData("sheet"..nextSheet.."instrument", sheet:getData("instrument"))
    book:setData("sheet"..nextSheet.."sheetName", sheet:getData("sheetName"))

    for i = 2, 10 do
        local notesToAdd = sheet:getData("notes"..i)
        book:setData("sheet"..nextSheet.."notes"..i, notesToAdd)
    end

    book:setData("sheetAmount", nextSheet) --Entry 241 (See comment above for context)

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

    local theNotes = book:getData("sheet"..sheetAmount.."notes")

    local instrument = book:getData("sheet"..sheetAmount.."instrument")

    local sheetName = book:getData("sheet"..sheetAmount.."sheetName")

    sheetData["instrument"] = instrument
    sheetData["notes"] = theNotes
    sheetData["sheetName"] = sheetName

    for i = 2, 10 do
        sheetData["notes"..i] = book:getData("sheet"..sheetAmount.."notes"..i)
        book:setData("sheet"..sheetAmount.."notes"..i, "")
    end

    book:setData("sheet"..sheetAmount.."notes", "")
    book:setData("sheet"..sheetAmount.."instrument", "")
    book:setData("sheet"..sheetAmount.."sheetName", "")

    if sheetAmount - 1 == 0 then
        book:setData("sheetAmount", "")
    else
        book:setData("sheetAmount", tostring(sheetAmount-1))
    end

    user:createItem(Item.parchment, 1, 333, sheetData)

    world:changeItem(book)

    user:inform("Du reißt die Seite vorsichtig aus dem Buch.", "Carefully removing the page from the book, you are left with a written parchment.")

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
            addNotesToSheet(user, quill)
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

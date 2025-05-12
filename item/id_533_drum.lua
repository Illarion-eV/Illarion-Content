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

local wood = require("item.general.wood")
local common = require("base.common")
local music = require("item.base.music")
local shared = require("craft.base.shared")

local M = {}

local skill = Character.drum

local sounds = music.drumSounds

M.step = {}

local function levelImpact(user, sound, duration, amount)

    local level = user:getSkill(skill)

    if level == 100 or amount == 1 then --At level 100 you dont write the wrong notes and if you only pluck one note you don't mistake it either
        return sound
    end

    local chance = 2 - level/100 -- From 2% base chance to miss per note at level 0 to 0.2% at 99

    local highestDuration = 30 --at 3 seconds youre guaranteed to hit the right note even at level 0 no matter how many

    local chanceReduction = 1/highestDuration*duration

    --so at 3 seconds there is 0 chance to miss, at 1 decisecond it is 1.94% chance per note at level 0

    chance = chance - chanceReduction

    chance = chance*amount

    local rand = math.random()

    if rand > chance/100 then
        return sound
    end

    local randomSound = math.random(1, #sounds)

    return sounds[randomSound].id
end

local function playSound(user, sound, sheet, book, bookIndex)

    local soundDuration = 10 --Defaults to 1 second

    if not M.step[user.id] then
        M.step[user.id] = 1
    end

    if sheet then
        sound = tonumber(sheet:getData("note"..M.step[user.id]))
        soundDuration = tonumber(sheet:getData("noteDuration"..M.step[user.id]))
    end

    if book then
        sound = tonumber(book:getData("sheet"..bookIndex.."note"..M.step[user.id]))
        soundDuration = tonumber(book:getData("sheet"..bookIndex.."noteDuration"..M.step[user.id]))
    end

    if common.IsNilOrEmpty(sound) then
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

    sound = levelImpact(user, sound, soundDuration, amount)
    --Lower level, more notes and faster play will increase chance to play the wrong note
    --At level 100 you no longer play wrong notes.

    if common.IsNilOrEmpty(amount) then
        M.step["lastDuration"..tostring(user.id)] = 0
        M.step[user.id] = 1
        return
    end

    M.step[user.id] = M.step[user.id] + 1

    local lastDuration = M.step["lastDuration"..tostring(user.id)]

    local instrument = music.instrumentIsInHandOrInFrontOfUser(user, "drum")
    if not instrument then
        return
    else
        shared.toolBreaks(user, instrument, lastDuration)
    end

    if sound then
        world:makeSound(sound, user.pos)
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
        user:learn(skill, lastDuration, 100)
    end

    if M.step[user.id] <= tonumber(amount) then
        M.step["lastDuration"..tostring(user.id)] = soundDuration
        user:startAction( soundDuration, gfx, soundDuration, 0, 0)

    else
        M.step[user.id] = 1
        M.step["lastDuration"..tostring(user.id)] = 0
    end

end

function M.playTheDrum(user, actionState, note, musicSheet, musicBook, bookIndex)

    if note then
        note = M.selectedSound[user.id]
    end

    if actionState == Action.none then
        playSound(user, note, musicSheet, musicBook, bookIndex)
    elseif actionState == Action.success then
        playSound(user, note, musicSheet, musicBook, bookIndex)
    elseif actionState == Action.abort then
        M.step[user.id] = 1
        M.step["lastDuration"..tostring(user.id)] = 0
    end

end

M.selectedSound = {}

local function selectSound(user)

    local callback = function(dialog)

        if not dialog:getSuccess() then
            return
        end

        local selected = dialog:getSelectedIndex() + 1

        for index, sound in pairs(sounds) do
            if selected == index then
                M.selectedSound[user.id] = sound.id
                user:startAction(1, 65, 1, 0, 0)
            end
        end
    end

    local text = common.GetNLS(user, "Wähle den Klang aus, den du spielen möchtest.", "Select the sound you wish to play")

    local dialog = SelectionDialog(common.GetNLS(user, "Klangauswahl", "Sound selection"), text, callback)

    for _ , sound in ipairs(sounds) do
        dialog:addOption(0, common.GetNLS(user, sound.name.german, sound.name.english))
    end

    dialog:setCloseOnMove()

    user:requestSelectionDialog(dialog)

end

function M.UseItem(user, SourceItem, actionState)

    if actionState == Action.none then
        selectSound(user)
    elseif actionState == Action.success then
        M.playTheDrum(user, actionState, true, false)
    elseif actionState == Action.abort then
        M.playTheDrum(user, actionState, true, false)
    end

end

M.LookAtItem = wood.LookAtItem

return M


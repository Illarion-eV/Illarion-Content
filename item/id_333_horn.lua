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

local spamPreventionTime = 30 --30 seconds between each

local spamPrevention = {}

local skill = Character.horn

local sounds = {
    {level = 0, id = 118, name = {english = "Weak Sound", german = "Schwacher Klang"}},
    {level = 25, id = 119, name = {english = "Short Sound", german = "Kurzer Klang"}},
    {level = 50, id = 120, name = {english = "Medium Sound", german = "Mittlerer Klang"}},
    {level = 75, id = 121, name = {english = "Long Sound", german = "Langer Klang"}},
    {level = 100, id = 122, name = {english = "Deep Sound", german = "Tiefer Klang"}}
}

function M.UseItem(user, SourceItem, actionState)

    local timeStamp = world:getTime("unix")

    if spamPrevention[user.id] and timeStamp < (spamPrevention[user.id] + spamPreventionTime) then
        user:inform("Du musst deine Lungen etwas ausruhen, bevor du das Horn erneut bläst.", "You need to rest your lungs for a little before blowing the horn again.")
        return
    end

    local knownSounds = {}

    local callback = function(dialog)

        if not dialog:getSuccess() then
            return
        end

        local selected = dialog:getSelectedIndex() + 1

        for index, sound in pairs(knownSounds) do
            if selected == index then
                local instrument = music.instrumentIsInHandOrInFrontOfUser(user, "horn")
                if instrument then
                    -- Since we dont want people to spam the instrument while also not wanting it
                    -- to take years to level, half of the cooldown is attributed to both
                    -- learning and durability reduction

                    shared.toolBreaks(user, instrument, spamPreventionTime/2)
                    user:learn(skill, spamPreventionTime/2, 100)
                    world:makeSound(sound.id, user.pos)
                    spamPrevention[user.id] = world:getTime("unix")
                else
                    return
                end
            end
        end
    end

    local text = common.GetNLS(user, "Wähle den Klang aus, den du spielen möchtest.", "Select the sound you wish to play")

    local dialog = SelectionDialog(common.GetNLS(user, "Klangauswahl", "Sound selection"), text, callback)

    local level = user:getSkill(skill)

    for _ , sound in ipairs(sounds) do
        if level >= sound.level then
            dialog:addOption(0, common.GetNLS(user, sound.name.german, sound.name.english))
            table.insert(knownSounds, sound)
        end
    end

    dialog:setCloseOnMove()

    user:requestSelectionDialog(dialog)

end

M.LookAtItem = wood.LookAtItem

return M


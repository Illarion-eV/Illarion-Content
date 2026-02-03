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

local runes = require("magic.arcane.runes")
local common = require("base.common")

local M = {}

M.telepathyTexts = {
    failure = {english = "You decided against responding to the telepathic connection.", german = "Du hast dich gegen eine telephatische Verbindung entschieden."},
    request = {english = "What do you want to tell your telepathic partner? This message will be broadcast to them and anyone near them via magical spirit waves.", german = "Was möchtest du deinem telepathischen Partner mitteilen? Diese Nachricht wird über magische Geisterwellen an ihn und alle in seiner Nähe gesendet."},
    established = {english = "You feel a telepathic connection establish between you and someone else.", german = "Du spürst wie sich eine telephatische Verbindung zwischen dir und jemand anderem aufbaut."}
    }

local getInputFromAndSendTo

function getInputFromAndSendTo(user, target)

    local callback = function(dialog)
        if not dialog:getSuccess() then
            user:inform(M.telepathyTexts.failure.german, M.telepathyTexts.failure.english)
        else
            local players = world:getPlayersInRangeOf(target.pos, 5)
            local input = dialog:getInput()
            local nameList = ""

            for _, player in pairs(players) do
                player:inform("Spirituelle magische Wellen erklingen durch die Luft und lassen dich die folgende Nachricht hören: "..input, "Spiritual magical waves resound through the air, allowing you to hear the following message: "..input)
                nameList = nameList..", "..player.name
            end
            logPlayer(user.name.." sent a telepathy message to "..nameList.." containing the following: "..input)
            -- Telepathy happens via informs, so in order to leave a paper trail of what players are saying in game as with regular speech, we log it
        end
    end

    local dialog = InputDialog(common.GetNLS(user, "Telepathi", "Telepathy"),common.GetNLS(user, M.telepathyTexts.request.german, M.telepathyTexts.request.english), false, 255, callback)
    user:requestInputDialog(dialog)
end

function M.invoke(user, targets, spell)

    for _, target in pairs(targets.targets) do
        local isPlayer = target:getType() == Character.player

        if isPlayer and runes.checkSpellForRuneByName("KEL", spell) or runes.checkSpellForRuneByName("TAH", spell) then
            target:inform(M.telepathyTexts.established.german, M.telepathyTexts.established.english)
        end
        if isPlayer and runes.checkSpellForRuneByName("KEL", spell) then
            getInputFromAndSendTo(user, target)
        end
        if isPlayer and runes.checkSpellForRuneByName("TAH", spell) then
            getInputFromAndSendTo(target, user)
        end
    end
end



return M

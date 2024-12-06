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
    success = {english = "You hear the voice of your telepathic partner in your mind: ", german = "Du hörst die Stimme der Person mit der du eine telephatische Verbindung eingegangen bist: "},
    request = {english = "What do you want to tell your telepathic partner?", german = "Was willst du deinem Telepathiepartner sagen?"},
    established = {english = "You feel a telepathic connection establish between you and someone else.", german = "Du spürst wie sich eine telephatische Verbindung zwischen dir und jemand anderem aufbaut."}
    }

local function getInputFromAndSendTo(user, target)
    local callback = function(dialog)
        if not dialog:getSuccess() then
            user:inform(M.telepathyTexts.failure.german, M.telepathyTexts.failure.english)
        else
            local input = dialog:getInput()
            target:inform(M.telepathyTexts.success.german..input,M.telepathyTexts.success.english..input)
            log(user.name.." sent telepathy message to "..target.name.." containing the following: "..input)
            -- Telepathy happens via message dialogs, so in order to leave a paper trail of what players are saying in game as with regular speech, we log it
        end
    end

    local dialog = InputDialog(common.GetNLS(user, M.telepathyTexts.request.german, M.telepathyTexts.request.english),"", false, 255, callback)
    user:requestInputDialog(dialog)
end

function M.invoke(user, targets, spell)
    for _, target in pairs(targets.targets) do
        if target:getType() ~= Character.player then
            return
        end
        if runes.checkSpellForRuneByName("Kel", spell) or runes.checkSpellForRuneByName("Tah", spell) then
            target:inform(M.telepathyTexts.established.german, M.telepathyTexts.established.english)
        end
        if runes.checkSpellForRuneByName("Kel", spell) then
            getInputFromAndSendTo(user, target)
        end
        if runes.checkSpellForRuneByName("Tah", spell) then
            getInputFromAndSendTo(target, user)
        end
    end
end



return M

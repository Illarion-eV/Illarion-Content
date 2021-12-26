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

local M = {}
local runes = require("magic.arcane.runes")

local function getInputFromAndSendTo(user, target)
    local callback = function(dialog)
        if not dialog:getSuccess() then
            user:inform("You decided against responding to the telepathic connection.")
        else
            local input = dialog:getInput()
            target:inform("","You hear the voice of your telepathic partner in your mind: "..input)
        end
    end

    local dialog = InputDialog("What do you want to tell your telepathic partner?","", false, 255, callback)
    user:requestInputDialog(dialog)
end

function M.invoke(user, targets, spell)
    for _, target in pairs(targets.targets) do
        if target:getType() ~= Character.player then
            return
        end
        if runes.checkSpellForRuneByName("Kel", spell) or runes.checkSpellForRuneByName("Tah", spell) then
            target:inform("","You feel a telepathic connection establish between you and someone else.")
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

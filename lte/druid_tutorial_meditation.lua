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

function M.addEffect( myEffect, user)
    user:inform("Das muss es sein ? die Zwillingsaugen-Inseln, von denen Fianna gesprochen hat. Wenn du hier eine Weile meditierst, solltest du die Antwort finden, die du suchst.", "This must be it, the Twin Eyes Islands that Fianna spoke of. So long as you meditate here for some time, you should find the answer you seek." )
end

local function isOnIsle(user) --Is on the twin eyes isle past the second bridge
    if user.pos.x > 900 and user.pos.y > 900 and user.pos.x < 950 and user.pos.y < 950 then
        return true
    end
end

function M.callEffect( myEffect, user)

    local foundCalls, calls = myEffect:findValue("calls")

    if (not foundCalls or calls < 1) and isOnIsle(user) then

        if not calls then
            calls = 0
        end

        myEffect:addValue("calls", calls+1)

        user:inform("Während du auf der Insel bleibst, spürst du, wie du dich allmählich auf die Natur um dich herum einstimmst. Es sollte nicht mehr lange dauern.", "As you stay on the isle you feel yourself gradually attune to the nature around you. It shouldn't be much longer now.")
        myEffect.nextCalled = 600
        return true
    end

    if user:getQuestProgress(692) ~= 1 then
        --Should not happen, but just in case.
        return false
    end

    if not isOnIsle(user) then
        user:inform("Du hast die Insel zu früh verlassen. Geh zurück und meditiere, wenn du Fiannas Tutorial fortsetzen möchtest.", "You left the isle too soon. Go back and meditate if you want to continue Fianna's tutorial.")
        return false
    end

    user:setQuestProgress(692, 2)
    user:inform("Nachdem du einige Zeit hier verbracht hast, fühlst du dich in Frieden; eins mit der Natur. Du kannst sie sogar zu dir flüstern hören, und du kannst den Ausdruck \"Cor Valis\" erkennen, der vom Wind getragen wird. Was könnte er bedeuten? Du solltest zu Fianna zurückkehren und sie fragen.", "After spending some time here, you feel yourself at peace; one with nature. You can even hear it whisper to you, and you can make out the phrase \"Cor Valis\" carried on the wind. What could it mean? You should return to Fianna and ask.")
    return false
end

return M


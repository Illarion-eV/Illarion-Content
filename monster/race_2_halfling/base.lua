--[[
Illarion Server

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, either version 3 of the License, or (at your option) any
later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU Affero General Public License for more
details.

You should have received a copy of the GNU Affero General Public License along
with this program.  If not, see <http://www.gnu.org/licenses/>.
]]
local base = require("monster.base.base")
local messages = require("base.messages")

--Random Messages
local msgs = messages.Messages()
msgs:addMessage("#me grinst breit.", "#me grins widely.")
msgs:addMessage("#me kichert.", "#me giggles.")
msgs:addMessage("#me lacht.", "#me laughs.")
msgs:addMessage("Bei Adron's Laute!", "By Adron's lute!")
msgs:addMessage("Der lauteste Tyrann stirbt mit einer Faust im Gemächt!", "The worst tyrant dies by a fist in his sleep!")
msgs:addMessage("Du bekommst keinen Kuchen von mir!", "You don't get a cake from me!")
msgs:addMessage("Einen toten Halbling ehren Hunderte!", "A dead halfling is honoured by hundreds!")
msgs:addMessage("Ich geb dir 'nen Nachschlag!", "Here, let me give you a second helping!")
msgs:addMessage("Lange Beine, kleines Hirn. Hau ab!", "Long legs, little brain. Go away!")
msgs:addMessage("Von deinem Gesicht wird ja die Milch sauer!", "Milk goes sour after seeing your face!")
msgs:addMessage("Von dir kann man sich eine Scheibe abschneiden!", "I'll cut a slice off of you!")

local M = {}

function M.generateCallbacks(drops)
    local t = base.generateCallbacks(msgs, drops)
    t.onSpawn = function(monster)
        local mySex = math.random(2) == 1 and Character.male or Character.female

        local var = 20 -- variation of color, +/- var
        local baseR = 245 -- baseRed
        local baseG = 200 -- baseGreen
        local baseB = 150 -- baseBlue
        local red = math.min(255, baseR + math.random(-var, var))
        local green = math.min(255, baseG + math.random(-var, var))
        local blue = math.min(255, baseB + math.random(-var, var))
        local myHair = {}
        myHair[Character.male] = {1, 2} -- list of possible hair IDs
        myHair[Character.female] = {1, 4}
        local hairBlonde = {230, 220, 100} -- Blonde hair Red,Green,Blue
        local hairBlack = {10, 10, 10} -- Black hair Red,Green,Blue
        local hairRed = {165, 10, 10} -- Red hair Red,Green,Blue
        local hairBrunette = {75, 10, 10} -- Brunette hair Red,Green,Blue
        local hairColors = {hairBlonde, hairBlack, hairRed, hairBrunette}
        local myHairColor = hairColors[math.random(#hairColors)]
        monster:setAttrib("sex", mySex)
        monster:setSkinColor(red, green, blue)
        monster:setHair(myHair[mySex][math.random(#myHair[mySex])])
        monster:setHairColor(myHairColor[1], myHairColor[2], myHairColor[3])
    end
    return t
end

return M
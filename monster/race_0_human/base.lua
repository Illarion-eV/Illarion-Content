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
msgs:addMessage("#me flucht vor sich hin.", "#me swears to himself.")
msgs:addMessage("#me grinst siegessicher.", "#me grins, certain of success.")
msgs:addMessage("#me ist in Schweiß gebadet.", "#me is bathed in sweat.")
msgs:addMessage("#me lacht laut.", "#me laughs.")
msgs:addMessage("#me spuckt auf den Boden.", "#me spits at the ground.")
msgs:addMessage("#me tippelt hin und her.", "#me hops on the spot.")
msgs:addMessage("Achtung! Alarm!", "Careful! Alert!")
msgs:addMessage("Das war's!", "That does it!")
msgs:addMessage("Die Leute werden auch immer schwächer!", "People get weaker every day!")
msgs:addMessage("Dieses Gebiet gehört mir!", "This area belongs to me!")
msgs:addMessage("Ein Drache ist nichts gegen mich!", "A dragon is nothing compared to me!")
msgs:addMessage("Fressen oder gefressen werden, so läuft das.", "Kill or be killed, that's the way it is")
msgs:addMessage("Für die Götter!", "For the gods!")
msgs:addMessage("Geld oder Leben!", "Money or life!")
msgs:addMessage("Heute ist ein guter Tag zum Töten.", "This day is a good day for killing.")
msgs:addMessage("Ich bin der Stärkste!", "I am the strongest!")
msgs:addMessage("Ich zerquetsche jeden Feind wie 'ne kleine Fee!", "I crush every enemy like a little fairy!")
msgs:addMessage("Niemand wird mich je besiegen!", "No one will ever defeat me!")
msgs:addMessage("Rollende Köpfe sind immer eine schöne Abwechslung.", "Rolling heads are always welcome.")
msgs:addMessage("Verboten!", "Verboten!")
msgs:addMessage("Wer wagt es mich zu stören?", "Who dares to bother me?")

local M = {}

function M.generateCallbacks(drops)
    local t = base.generateCallbacks(msgs, drops);
    t.onSpawn = function(monster)
        local mySex = math.random(2) == 1 and Character.male or Character.female

        local var = 20 -- variation of color,  + /- var
        local baseR = 245 -- baseRed
        local baseG = 200 -- baseGreen
        local baseB = 150 -- baseBlue
        local red = math.min(255, baseR + math.random(-var, var))
        local green = math.min(255, baseG + math.random(-var, var))
        local blue = math.min(255, baseB + math.random(-var, var))
        local myHair = {}
        myHair[Character.male] = {1, 2, 3} -- list of possible hair IDs
        myHair[Character.female] = {1, 4, 7, 8}
        local myBeard = {}
        myBeard[Character.male] = {1, 3, 4, 5, 6, 8} -- list of possible beard IDs
        myBeard[Character.female] = {0}
        local hairBlonde = {210, 200, 10} -- Blonde hair Red, Green, Blue
        local hairBlack = {10, 10, 10} -- Black hair Red, Green, Blue
        local hairRed = {205, 30, 30} -- Red hair Red, Green, Blue
        local hairBrunette = {90, 50, 10} -- Brunette hair Red, Green, Blue
        local hairColors = {hairBlonde, hairBlack, hairRed, hairBrunette}
        local myHairColor = hairColors[math.random(#hairColors)]
        monster:setAttrib("sex", mySex)
        monster:setSkinColor(red, green, blue)
        monster:setHair(myHair[mySex][math.random(#myHair[mySex])])
        monster:setHairColor(myHairColor[1], myHairColor[2], myHairColor[3])
        monster:setBeard(myBeard[mySex][math.random(#myBeard[mySex])])
    end
    return t
end

return M
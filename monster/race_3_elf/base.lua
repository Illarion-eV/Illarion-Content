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
msgs:addMessage("Bei der Macht des Waldes!", "By the power of nature!")
msgs:addMessage("Die Götter mögen mir beistehen.", "May the gods be with me.")
msgs:addMessage("#mes Augen blitzen vor verzweifelter Wut auf.", "#me's eyes flash in desperate fury.")
msgs:addMessage("#me bewegt sich mit geschwinden Schritten über den Boden.", "#me moves with wide steps over the ground.")
msgs:addMessage("Oh, welch Schicksal, dass ich eine Waffe gegen euch erheben muss. Verzeiht mir.", "Oh, what fate is this that I have to raise a weapon against you. Forgive me!")
msgs:addMessage("Die Gerechtigkeit wird euch einholen, sei es heute, sei es in hundert Jahren.", "Justice will overcome you, be it now, be it in a hundred years.")
msgs:addMessage("Ich fürchte den Tod nicht, er kann auch eine Erlösung sein, verglichen mit einem Leben in Feigheit.", "I do not fear death, for it is far superior to a life in fear.")
msgs:addMessage("Ihr mögt mich heute niederstrecken, doch wird man meine Taten besingen, wenn der Name eures Volkes bereits vergessen wurde.", "You may slay me today, but my deeds will be sung about when the name of your people will be long forgotten.")
msgs:addMessage("Mein Volk wird Rache an eurem Stamm nehmen bis die siebte Generation eurer Brut vertilgt ist.", "My people will take revenge on your tribe until the seventh generation of your offspring has passed.")
msgs:addMessage("Die, die ihre Hand gegen das unsterbliche Volk erheben, bringen Unheil über sich.", "Those who raise their weapon against the eternal people bring doom upon themselves.")

local M = {}

function M.generateCallbacks(drops)
    local t = base.generateCallbacks(msgs, drops)
    t.onSpawn = function(monster)
        local mySex = math.random(2) == 1 and Character.male or Character.female

        local var = 20 -- variation of color, +/- var
        local baseR = 255 -- baseRed
        local baseG = 230 -- baseGreen
        local baseB = 210 -- baseBlue
        local red = math.min(255, baseR + math.random(-var, var))
        local green = math.min(255, baseG + math.random(-var, var))
        local blue = math.min(255, baseB + math.random(-var, var))
        local myHair = {}
        myHair[Character.male] = {1, 2} -- list of possible hair IDs
        myHair[Character.female] = {1, 4, 7, 8}
        local hairBlonde = {255, 157, 98} -- Blonde hair Red,Green,Blue
        local hairPurple = {64, 0, 64} -- Purple hair Red,Green,Blue
        local hairGreen = {0, 64, 64} -- Green hair Red,Green,Blue
        local hairBrunette = {128, 64, 64} -- Brunette hair Red,Green,Blue
        local hairColors = {hairBlonde, hairPurple, hairGreen, hairBrunette}
        local myHairColor = hairColors[math.random(#hairColors)]
        monster:setAttrib("sex", mySex)
        monster:setSkinColor(red, green, blue)
        monster:setHair(myHair[mySex][math.random(#myHair[mySex])])
        monster:setHairColor(myHairColor[1], myHairColor[2], myHairColor[3])
    end
    return t
end

return M
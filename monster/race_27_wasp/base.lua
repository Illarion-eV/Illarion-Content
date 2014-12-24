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
local base = require("monster.base.base")
local messages = require("base.messages")

--Random Messages
local msgs = messages.Messages()
msgs:addMessage("#me fliegt, ein hohes, weinerlich klingendes Geräusch machend umher.", "#me flies around, making a high pitched whining sound.")
msgs:addMessage("#me landet nur um wieder abheben zu können begleitet von einem kurzen Summen.", "#me lands, only to take off again with a short buzz.")
msgs:addMessage("#me peitscht, einen Landeplatz suchend durch die Luft.", "#me whips about in the air, searching for somewhere to land.")
msgs:addMessage("#me schwirrt drohend in keine bestimmte Richtung.", "#me angrily buzzes around in no particular direction.")
msgs:addMessage("Bzzz.", "Bzzz.")
msgs:addMessage("#me fliegt in wilden Kreisen und man kann das Gift an ihrem Stachel aufglänzen sehen.", "#me darts around, one can see venom dripping from its sting.")
msgs:addMessage("#me fährt ihren spitzen Stachel aus.", "#me extends its sting.")
msgs:addMessage("Summ, summ.", "Buzz, buzz.")
msgs:addMessage("Bsss.", "Bsss.")
msgs:addMessage("#mes Flügel verbreiten ein hochfrequentes Summen, welches in den Ohren schmerzt.", "#me's wings exude a buzzing with high frequency, it hurts one's ears.")

local M = {}

function M.generateCallbacks()
    return base.generateCallbacks(msgs)
end

return M
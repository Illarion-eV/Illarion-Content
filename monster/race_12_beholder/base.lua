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
msgs:addMessage("#me starrt aus vielen Augen.", "#me stares with multiple eyes.")
msgs:addMessage("#me guckt.", "#me goggles.")
msgs:addMessage("#me schwebt einen Meter über dem Boden.", "#me floats three feet over the ground.")
msgs:addMessage("Die Schönheit liegt in meinen Augen!", "Beauty is in my eyes!")
msgs:addMessage("Ich habe das gesehen!", "I saw that!")
msgs:addMessage("#me ist eine beeindruckende Sphäre, die wie durch Magie über dem Boden schwebt.", "#me is an impressive sphere that floats over the ground by magic.")
msgs:addMessage("#me zwinkert mit einem Auge.", "#me blinks with one of its eyes.")
msgs:addMessage("Ich gehöre keinem Zauberer.", "I am not the property of any wizard.")
msgs:addMessage("Da werd ich mal ein Auge zudrücken.", "I'll turn a blind eye to you.")
msgs:addMessage("Gehorche.", "Obey me.")
msgs:addMessage("#me schwebt umher.", "#me floats.")

local M = {}

function M.generateCallbacks()
    return base.generateCallbacks(msgs)
end

return M
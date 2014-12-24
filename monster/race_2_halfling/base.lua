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

function M.generateCallbacks()
    return base.generateCallbacks(msgs)
end

return M
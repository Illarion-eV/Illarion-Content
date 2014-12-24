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
msgs:addMessage("#me blubbert.", "#me bubbles.")
msgs:addMessage("#me brodelt.", "#me seethes.")
msgs:addMessage("#me gurgelt.", "#me gargles.")
msgs:addMessage("#mes amorpher Körper verleibt sich Müll vom Erdboden ein.", "#me's amorph body absorbs some litter of the ground.")
msgs:addMessage("#me richtet sich auf.", "#me rears up.")
msgs:addMessage("#me hinterlässt eine schleimige Spur.", "#me leaves a mucilaginous trail behind.")
msgs:addMessage("#me riecht nach Abfall.", "#me reeks badly.")
msgs:addMessage("#me spuckt Schleimbatzen.", "#me spits out lumps of slime.")
msgs:addMessage("#mes Gestalt wandelt sich in einen Ball.", "#me's shape morphs into a ball.")
msgs:addMessage("#me drückt sich flach auf den Boden.", "#me flattens itself plain to the ground.")

local M = {}

function M.generateCallbacks()
    return base.generateCallbacks(msgs)
end

return M
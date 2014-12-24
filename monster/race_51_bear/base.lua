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
msgs:addMessage("#me bleibt steifbeinig und aufgerichtet stehen.", "#me stands stiff legged and tall.")
msgs:addMessage("#me duckt sich, bereit anzugreifen.", "#me crouches, ready to strike.")
msgs:addMessage("#me hat Schaum vor dem Mund.", "#me foams at the mouth.")
msgs:addMessage("#mes Fell sträubt sich.", "#me's fur bristles")

local M = {}

function M.generateCallbacks()
    return base.generateCallbacks(msgs)
end

return M
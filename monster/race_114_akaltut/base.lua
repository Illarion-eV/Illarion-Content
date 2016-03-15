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
msgs:addMessage("#me lacht hämisch, als hätte sie den Verstand verloren.", "#me cackles like she's gone mad.")
msgs:addMessage("#me huscht auf ihren acht Beinen schnell hin und her.", "#me scampers around quickly on her eight legs")
msgs:addMessage("#me spinnt ein Netz und bessert ihren engmaschigen Umhang aus.", "#me spins a web, repairing her delicate cloak.")
msgs:addMessage("#me erprobt ihren Kampfstab an den Drowkriegern in ihrer Nähe.", "#me practices swinging her battlestaff with the nearby drow warriors.")
msgs:addMessage("Riecht nach Blut... mmmmm.", "Smell the blood... mmmmm.")
msgs:addMessage("#me richtet ihren Blick in den Stollen, nachdem sie von dort ein Geräusch gehört hat.", "#me trains her eyes down the tunnel after hearing a noise.")
local M = {}

function M.generateCallbacks()
    return base.generateCallbacks(msgs)
end

return M
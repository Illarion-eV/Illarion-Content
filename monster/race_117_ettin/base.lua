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
msgs:addMessage("#me stampft wütend auf den Boden auf und grollt mit kehliger Stimme.", "#me stomps on the ground in fury, growling deeply.")
msgs:addMessage("#me schwingt seine Faust und brüllt laut.", "#me swings its fist, roaring loudly.")
msgs:addMessage("#me brüllt mit markdurchdringender Stimme.", "#me bellows with a booming voice.")
msgs:addMessage("Harumpf!", "Harumpf!")
msgs:addMessage("Groar!", "Groar!")
msgs:addMessage("#me trampelt mit unaufhaltsamen Schritten umher. Jeder Schritt lässt die Erde zittern.", "#me charges with unstoppable paces. Every step shakes the ground.")
msgs:addMessage("#me hält einen Moment inne und wiegt seine Köpfe hin und her.", "#me hesitates for a moment, cocking its heads.")

local M = {}

function M.generateCallbacks()
    return base.generateCallbacks(msgs)
end

return M

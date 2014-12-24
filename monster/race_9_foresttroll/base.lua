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
msgs:addMessage("#me stampft wütend auf den Boden auf und grollt mit kehliger Stimme.", "#me stomps on the ground in fury, growling deeply")
msgs:addMessage("#me schwingt seine Faust und stößt ein jammerndes Klagen aus.", "#me swings its fist, roaring loudly.")
msgs:addMessage("#me brüllt mit markdurchdringender Stimme.", "#me bellows with a booming voice.")
msgs:addMessage("#mes grüne Augen blitzen vor gnadenloser Bestimmtheit auf, ein Leben zu beenden.", "#me's green eyes flash in unfaltering dedication to end somebody's life.")
msgs:addMessage("Groar!", "Groar!")
msgs:addMessage("#me trampelt mit unaufhaltsamen Schritten umher. Jeder Schritt lässt die Erde zittern.", "#me charges with unstoppable paces. Every step shakes the ground.")
msgs:addMessage("#mes Blick zeigt unbändigen Zorn, verursacht durch unzählige Freveltaten gegen die Natur.", "#me's glance shows the inevitable revenge, caused by countless crimes against nature.")
msgs:addMessage("#me hält einen Moment inne und wiegt seinen Kopf hin und her, traurig vor sich hin summend.", "#me hesitates for a moment, cocking its head, humming sadly.")
msgs:addMessage("#mes Muskeln an seinen knorrigen Armen spannen sich, bereit, um Rache zu üben.", "#me flexes its muscles on its huge arms, ready to take revenge.")
msgs:addMessage("#me ist ein gigantischer Troll, dessen weise Augen von dem Anblick unsäglicher Taten müde und traurig geworden sind.", "#me is a giant troll with wise eyes which became sad and tired from witnessing unutterable deeds.")

local M = {}

function M.generateCallbacks()
    return base.generateCallbacks(msgs)
end

return M
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
msgs:addMessage("#me fehlt bei genauerer Betrachtung wohl der Unterkiefer.", "#me is missing its lower jaw on closer inspection.")
msgs:addMessage("#me greift nach oben zu seinem eigenen Schädel und verdreht ihn mit einem lauten, knackenden Geräusch.", "#me reaches up, grabs it's own skull and twists, making a loud cracking noise.")
msgs:addMessage("#me grinst wie ein Narr.", "#me grins like a fool.")
msgs:addMessage("#me hebt seine Waffe in die Höhe und klappert mit den Zähnen.", "#me raises his weapon and rattles with its tooth.")
msgs:addMessage("#me kichert still, die Schultern schwanken und knacken.", "#me cackles silently, shoulders heaving and creaking.")
msgs:addMessage("#me klappert, die Knochen rasseln.", "#me clatters, bones rattling.")
msgs:addMessage("#me klappt seinen Kiefer zu um bösartig zu grinsen.", "#me snaps its jaw shut, grinning wickedly.")
msgs:addMessage("#me kriecht qualvoll über den Boden..", "#me shuffles painfully across the floor.")
msgs:addMessage("#me macht langsame und mühsame Schritte... Click...clack...click...clack...", "#me takes slow, tedious steps... Click...clack...click...clack...")
msgs:addMessage("#me schlurft vorwärts, Gelenke knarren und knacken.", "#me shambles forward, joints clicking and creaking...")
msgs:addMessage("#me schwingt eine uralte Waffe, verrostet und verbeult.", "#me brandishes an ancient weapon, rusted and battered.")
msgs:addMessage("#me schwingt gewaltsam seine verfallene Waffe.", "#me swings its decayed weapon violently.")
msgs:addMessage("#me streckt eine knochige Hand aus.", "#me reaches out a bony hand.")
msgs:addMessage("#me taumelt, beinahe zusammenstürzend.", "#me staggers, nearly toppling over.")
msgs:addMessage("#mes Kiefer öffnet sich zu einem lautlosen Schrei.", "#me's jaw swivels in a silent scream...")
msgs:addMessage("#mes Knochen schlagen klappernd und rasselnd aneinander.", "#me's bones clinks clacking and rattling together.")
msgs:addMessage("#mes Kopf hängt herab, leere Augenhöhlen starren geradeaus.", "#me's head lolls around, empty eye sockets staring.")

local M = {}

function M.generateCallbacks()
    return base.generateCallbacks(msgs)
end

return M
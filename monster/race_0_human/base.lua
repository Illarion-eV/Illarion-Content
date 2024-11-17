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
msgs:addMessage("#me flucht vor sich hin.", "#me mutters to himself.")
msgs:addMessage("#me grinst siegessicher.", "#me grins triumphantly.")
msgs:addMessage("#me ist in Schweiß gebadet.", "#me is drenched in sweat.")
msgs:addMessage("#me lacht laut.", "#me laughs out loud.")
msgs:addMessage("#me spuckt auf den Boden.", "#me spits on the ground.")
msgs:addMessage("#me tippelt hin und her.", "#me paces back and forth.")
msgs:addMessage("Achtung! Alarm!", "Attention! Alarm!")
msgs:addMessage("Das war's!", "That's it!")
msgs:addMessage("Die Leute werden auch immer schwächer!", "People are getting weaker by the day!")
msgs:addMessage("Dieses Gebiet gehört mir!", "This area is mine!")
msgs:addMessage("Ein Drache ist nichts gegen mich!", "A dragon is no match for me!")
msgs:addMessage("Fressen oder gefressen werden, so läuft das.", "Eat or be eaten, that's how it goes.")
msgs:addMessage("Für die Götter!", "For the gods!")
msgs:addMessage("Geld oder Leben!", "Money or your life!")
msgs:addMessage("Heute ist ein guter Tag zum Töten.", "Today is a good day to kill.")
msgs:addMessage("Ich bin der Stärkste!", "I am the strongest!")
msgs:addMessage("Ich zerquetsche jeden Feind wie 'ne kleine Fee!", "I'll crush every enemy like an insect!")
msgs:addMessage("Niemand wird mich je besiegen!", "No one will ever defeat me!")
msgs:addMessage("Rollende Köpfe sind immer eine schöne Abwechslung.", "Rolling heads are always welcome.")
msgs:addMessage("Verboten!", "Verboten!")
msgs:addMessage("Wer wagt es mich zu stören?", "Who dares to bother me?")

local M = {}

function M.generateCallbacks()
    return base.generateCallbacks(msgs)
end

return M

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
-- INSERT INTO triggerfields VALUES (36,20,100,'triggerfield.noobia_henry');
-- INSERT INTO triggerfields VALUES (36,21,100,'triggerfield.noobia_henry');
-- INSERT INTO triggerfields VALUES (36,22,100,'triggerfield.noobia_henry');
-- INSERT INTO triggerfields VALUES (37,20,100,'triggerfield.noobia_henry');
-- INSERT INTO triggerfields VALUES (37,22,100,'triggerfield.noobia_henry');
-- INSERT INTO triggerfields VALUES (38,20,100,'triggerfield.noobia_henry');
-- INSERT INTO triggerfields VALUES (38,21,100,'triggerfield.noobia_henry');
-- INSERT INTO triggerfields VALUES (38,22,100,'triggerfield.noobia_henry');

local common = require("base.common")

local M = {}

function M.MoveToField(Character)

    -- for Noobia: the char has to walk to a field (this triggerfield); he gets a message and we change a queststatus so that we remember he was at the field
    local find = Character.effects:find(13) --Noob effect
    if find then --Is this even a noob?
        local value = Character:getQuestProgress(309)
        if (value == 0) then --Didn't visit the triggerfield yet
            Character:setQuestProgress(309, 1) --remember that he knows how to walk

            local callbackNewbie = function() end --empty callback
            local dialogText = common.GetNLS(Character,
                "Um mit dem Menschen zu sprechen, benutze ihn per Doppelklick oder aktiviere die Sprachkonsole mit 'Return', schreibe z.B. 'Hallo' und dr�cke wieder 'Return'. Alle NPCs reagieren auf bestimmte Schl�sselw�rter wenn du in ihrer N�he stehst. Wenn es Probleme bei der Kommunikation mit einem NPC gibt, schreibe einfach 'Hilfe' und der NPC antwortet mit einer Liste m�glicher Schl�sselw�rter.\n\n Um zu rufen, schreibe #s vor deinen Text, #w l�sst deinen Charakter fl�stern, #o wird f�r Out-Of-Character-Nachrichten verwendet und #me leitete ein Emote ein.",
                "In order to speak to the human, use him with a double click or activate the chat box with the 'return' key, type e.g. 'Hello' and then hit 'return' again. All non-player characters (NPCs) react on certain keywords if you are standing directly beside them. If you ever get stuck trying while trying to communicate with an NPC, typing 'help' will provide you with a list of recommended commands.\n\n To shout, write #s in front of your text, #w makes your character whisper, #o is used for out of character messages and #me invokes an emote.")
            local dialogNewbie = MessageDialog("Tutorial", dialogText, callbackNewbie)
            Character:requestMessageDialog(dialogNewbie)
        end
    end
end

return M

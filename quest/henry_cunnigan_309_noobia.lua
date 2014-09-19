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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (309, 'quest.henry_cunnigan_309_noobia');

local common = require("base.common")
local M = {}

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Einführung - Gehen und Reden"
Title[ENGLISH] = "Tutorial - Walking and talking"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Um mit dem Menschen zu sprechen, aktiviere die Sprachkonsole mit 'Return', schreibe z.B. 'Hallo' und drücke wieder 'Return'. Alle NPCs reagieren auf bestimmte Schlüsselwörter wenn du in ihrer Nähe stehst. Wenn es Probleme bei der Kommunikation mit einem NPC gibt, schreibe einfach 'Hilfe' und der NPC antwortet mit einer Liste möglicher Schlüsselwörter.\n\nUm zu rufen, schreibe #s vor deinen Text, #w lässt deinen Charakter flüstern, #o wird für Out-Of-Character-Nachrichten verwendet und #me leitete ein Emote ein."
Description[ENGLISH][1] = "In order to speak to the human, activate the chat box with the 'return' key, type e.g. 'Hello' and then hit 'return' again. All non-player characters (NPCs) react on certain keywords if you are standing directly beside them. If you ever get stuck trying while trying to communicate with an NPC, typing 'help' will provide you with a list of recommended commands.\n\nTo shout, write #s in front of your text, #w makes your character whisper, #o is used for out of character messages and #me invokes an emote."
Description[GERMAN][2] = "Du hast die Einführung über das Gehen und Reden abgeschlossen."
Description[ENGLISH][2] = "You finished the tutorial on walking and talking."

-- Insert the position of the quest start here (probably the position of an NPC or item)
Start = {37, 21, 100}


-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
--QuestTarget[1] = {position(x, y, 100), position(x, y, 100)}

-- Insert the quest status which is reached at the end of the quest
FINAL_QUEST_STATUS = 2


function M.QuestTitle(user)
    return common.GetNLS(user, Title[GERMAN], Title[ENGLISH])
end

function M.QuestDescription(user, status)
    local german = Description[GERMAN][status] or ""
    local english = Description[ENGLISH][status] or ""

    return common.GetNLS(user, german, english)
end

function M.QuestStart()
    return Start
end

function M.QuestTargets(user, status)
    return QuestTarget[status]
end

function M.QuestFinalStatus()
    return FINAL_QUEST_STATUS
end
return M

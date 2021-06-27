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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (330, 'quest.henry_cunnigan_330_noobia');

local common = require("base.common")
local M = {}

local GERMAN = Player.german
local ENGLISH = Player.english

-- Insert the quest title here, in both languages
local Title = {}
Title[GERMAN] = "Tutorial I - Bewegen, Sprechen und Items benutzen"
Title[ENGLISH] = "Tutorial I - Moving, Talking and Using Items"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
local Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Sprich mit Henry Cunnigan. \n\nUm mit dem Mann zu sprechen, aktiviere die Chatbox, indem du darauf klickst oder 'Enter' drückst. Schreibe 'Hallo' um ihn zu grüßen und dann drücke erneut 'Enter'. Alternativ kannst du NPCs auch doppelklicken, um Basisgesprächsoptionen zu aktivieren. Alle NPCs reagieren auf bestimmte Stichworte, wenn du im Radius von zwei Feldern zu ihnen stehst. \n\nFalls du nicht weißt wie du mit einem NPC kommunizieren sollst, frag nach 'Hilfe', um eine Liste mit empfohlenen Kommandos zu erhalten."
Description[ENGLISH][1] = "Speak with Henry Cunnigan. \n\nTo speak to the man, activate the chat box if necessary by clicking on it or by using the 'Return' key, type 'Hello' to greet him, and hit 'Return'. Alternatively you can double click on any NPC to activate basic talk options. All NPCs react to certain keywords if you are standing within two tiles. \n\nIf you get stuck trying to communicate with an NPC, asking for 'help' will provide you with a list of recommended commands."
Description[GERMAN][2] = "Um die Fackel zu finden, die Henry Cunnigan dir gegeben hat, deaktiviere die Chatbox und drücke 'I', um dein Inventar zu öffnen, oder klick das Taschen-Icon in der rechten unteren Ecke des Bildschirms. Um deine Tasche zu öffnen, drücke 'B' oder doppelklicke die Ledertasche in deinem Inventar. \n\nZiehe nun mit der linken Maustaste die Fackel in den leeren Schild-Slot in deinem Inventar. Möglicherweise musst du zunächst ein in diesem Slot ausgerüstetes Item in deine Tasche verschieben. Um eine einzelne Fackel aus einem Stapel zu bewegen, musst du Shift gedrückt halten, während du ziehst und dann die Anzahl '1' in dem Popup Fenster mit 'OK' bestätigen."
Description[ENGLISH][2] = "To find the torch Henry Cunnigan gave you, make sure your chat box is deactivated and press 'I' to open your inventory or click on the bag icon in the bottom right corner of the window. To open your bag, press 'B' or double click on the leather bag in your inventory. \n\nClick the torch and drag it to the empty shield slot in your inventory using your mouse to equip it. You may need to remove any existing item from that slot to your bag first. To separate a single torch from a stack in your inventory, hold down shift as you click and drag, accepting the default value of '1' in the pop up by clicking 'OK'."
Description[GERMAN][3] = "Doppelklicke die Fackel um sie zu entzünden. \n\nDie Fackel wird eine Zeit lang brennen und sobald sie ausgebrannt ist, verschwindet sie aus deinem Inventar."
Description[ENGLISH][3] = "To light the torch double click on it. \n\nThe torch will burn for a while and once it has burnt out it will disappear from your inventory."
Description[GERMAN][4] = "Du kannst nun die Tutorial-Quests fortsetzen, indem du zu Nimbur Goldbrew gehst, um etwas über das Sammeln, Handwerken und Kämpfen zu lernen."
Description[ENGLISH][4] = "You can continue the tutorial quests with Nimbur Goldbrew to learn about gathering, crafting and fighting."

-- Insert the position of the quest start here (probably the position of an NPC or item)
local Start = {703, 290, 0}

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
local QuestTarget = {}
--QuestTarget[1] = {position(x, y, z), position(x, y, z)}

-- Insert the quest status which is reached at the end of the quest
local FINAL_QUEST_STATUS = 4


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

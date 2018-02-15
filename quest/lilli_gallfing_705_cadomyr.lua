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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (705, 'quest.lilli_gallfing_705_cadomyr');

local common = require("base.common")
local factions = require("base.factions")
local M = {}

local GERMAN = Player.german
local ENGLISH = Player.english

-- Insert the quest title here, in both languages
local Title = {}
Title[GERMAN] = "Die königlichen Schneider von Cadomyr"
Title[ENGLISH] = "The Royal Tailors of Cadomyr"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
local Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}

Description[GERMAN][1] = "Sammel zwanzig Wollballen für Lilli Gallfing in der Werkstatt von Cadomyr. Schafe kannst du westlich von Cadomyr finden. Du kannst die Schafe scheren, indem du die Schere in die Hand nimmst und diese benutzt, wenn ein Schaf neben dir steht."
Description[ENGLISH][1] = "Collect twenty bales of wool for Lilli Gallfing in the workshop of Cadomyr. You can find sheep west of Cadomyr. You can collect wool if you stand next to a sheep and use the scissors whilst holding them in your hand."
Description[GERMAN][2] = "Geh zu Lilli Gallfing in der Werkstatt von Cadomyr. Sie hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][2] = "Go to Lilli Gallfing at the workshop in Runewick, she is sure to have another task for you."
Description[GERMAN][3] = "Bring Lilli Gallfing in der Werkstatt von Cadomyr zehn Garnrollen und zehn Rollen grauen Stoff. Den Stoff kannst du am Webstuhl herstellen und die Garnrollen am Spinnrad."
Description[ENGLISH][3] = "Take Lilli Gallfing in the workshop of Cadomyr ten spools of thread and tewn bolts of grey cloth. You can produce the cloth at the loom. The thread can be produced at the spinning wheel."
Description[GERMAN][4] = "Geh zu Lilli Gallfing in der Werkstatt von Cadomyr. Sie hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][4] = "Go to Lilli Gallfing at the workshop in Runewick, she is sure to have another task for you."
Description[GERMAN][5] = "Schneidere zehn Paar graue Stoffhandschuhe am Schneidertisch für Lilli Gallfing in der Werkstatt von Cadomyr. Um die Handschuhe herzustellen musst du die Nadel in die Hand nehmen und diese benutzen, wenn du vor einem Schneidertisch stehst. Der Schneidertisch befindet sich in der Werkstatt."
Description[ENGLISH][5] = "Tailor ten pairs of grey cloth gloves at the tailoring table for Lilli Gallfing in the workshop of Cadomyr. To produce the gloves you have to take the needle in your hand and use it, whilst standing in front of the tailoring table. You can find a tailoring table in the workshop."
Description[GERMAN][6] = "Dein derzeitiger Rang bei den königlichen Schneidern von Cadomyr ist der eines Laiens. Gehe zu Lilli Gallfing in der Werkstatt von Cadomyr sobald du Level 10 in der Schneiderfertigkeit erreicht hast."
Description[ENGLISH][6] = "Your current rank with the Royal Tailors of Cadomyr is Layman. Return to Lilli Gallfing at the workshop of Cadomyr once you reached Level 10 in Tailoring."
Description[GERMAN][7] = "Dein derzeitiger Rang bei den königlichen Schneidern von Cadomyr ist der eines Anfängers. Gehe zu Lilli Gallfing in der Werkstatt von Cadomyr sobald du Level 20 in der Schneiderfertigkeit erreicht hast."
Description[ENGLISH][7] = "Your current rank with the Royal Tailors of Cadomyr is Novice. Return to Lilli Gallfing at the workshop of Cadomyr once you reached Level 20 in Tailoring."
Description[GERMAN][8] = "Dein derzeitiger Rang bei den königlichen Schneidern von Cadomyr ist der eines Lehrlings. Gehe zu Lilli Gallfing in der Werkstatt von Cadomyr sobald du Level 30 in der Schneiderfertigkeit erreicht hast."
Description[ENGLISH][8] = "Your current rank with the Royal Tailors of Cadomyr is Apprentice. Return to Lilli Gallfing at the workshop of Cadomyr once you reached Level 30 in Tailoring."
Description[GERMAN][9] = "Dein derzeitiger Rang bei den königlichen Schneidern von Cadomyr ist der eines Initiatens. Gehe zu Lilli Gallfing in der Werkstatt von Cadomyr sobald du Level 40 in der Schneiderfertigkeit erreicht hast."
Description[ENGLISH][9] = "Your current rank with the Royal Tailors of Cadomyr is Initiate. Return to Lilli Gallfing at the workshop of Cadomyr once you reached Level 40 in Tailoring."
Description[GERMAN][10] = "Dein derzeitiger Rang bei den königlichen Schneidern von Cadomyr ist der eines Gesellens. Gehe zu Lilli Gallfing in der Werkstatt von Cadomyr sobald du Level 50 in der Schneiderfertigkeit erreicht hast."
Description[ENGLISH][10] = "Your current rank with the Royal Tailors of Cadomyr is Journeyman. Return to Lilli Gallfing at the workshop of Cadomyr once you reached Level 50 in Tailoring."
Description[GERMAN][11] = "Dein derzeitiger Rang bei den königlichen Schneidern von Cadomyr ist der eines Spezialistens. Gehe zu Lilli Gallfing in der Werkstatt von Cadomyr sobald du Level 60 in der Schneiderfertigkeit erreicht hast."
Description[ENGLISH][11] = "Your current rank with the Royal Tailors of Cadomyr is Specialist. Return to Lilli Gallfing at the workshop of Cadomyr once you reached Level 60 in Tailoring."
Description[GERMAN][12] = "Dein derzeitiger Rang bei den königlichen Schneidern von Cadomyr ist der eines Expertens. Gehe zu Lilli Gallfing in der Werkstatt von Cadomyr sobald du Level 70 in der Schneiderfertigkeit erreicht hast."
Description[ENGLISH][12] = "Your current rank with the Royal Tailors of Cadomyr is Expert. Return to Lilli Gallfing at the workshop of Cadomyr once you reached Level 70 in Tailoring."
Description[GERMAN][13] = "Dein derzeitiger Rang bei den königlichen Schneidern von Cadomyr ist der eines Adeptens. Gehe zu Lilli Gallfing in der Werkstatt von Cadomyr sobald du Level 80 in der Schneiderfertigkeit erreicht hast."
Description[ENGLISH][13] = "Your current rank with the Royal Tailors of Cadomyr is Adept. Return to Lilli Gallfing at the workshop of Cadomyr once you reached Level 80 in Tailoring."
Description[GERMAN][14] = "Dein derzeitiger Rang bei den königlichen Schneidern von Cadomyr ist der eines Artisanens. Gehe zu Lilli Gallfing in der Werkstatt von Cadomyr sobald du Level 90 in der Schneiderfertigkeit erreicht hast."
Description[ENGLISH][14] = "Your current rank with the Royal Tailors of Cadomyr is Artisan. Return to Lilli Gallfing at the workshop of Cadomyr once you reached Level 90 in Tailoring."
Description[GERMAN][15] = "Dein derzeitiger Rang bei den königlichen Schneidern von Cadomyr ist der eines Meisters. Gehe zu Lilli Gallfing in der Werkstatt von Cadomyr sobald du Level 100 in der Schneiderfertigkeit erreicht hast."
Description[ENGLISH][15] = "Your current rank with the Royal Tailors of Cadomyr is Master. Return to Lilli Gallfing at the workshop of Cadomyr once you reached Level 100 in Tailoring."
Description[GERMAN][16] = "Gratulation, du bist nun ein wahrer Großmeister der königlichen Schneider von Cadomyr."
Description[ENGLISH][16] = "Congratulations, you are now a true Grandmaster of the Royal Tailors of Cadomyr."

-- Insert the position of the quest start here (probably the position of an NPC or item)
local Start = {135, 576, 0}

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
local QuestTarget = {}
QuestTarget[1] = {position(135, 576, 0), position(63, 654, 0)} -- Sheep
QuestTarget[2] = {position(135, 576, 0)} 
QuestTarget[3] = {position(135, 576, 0), position(134, 572, 0), position(141, 575, 0)} -- Spinning wheel and loom
QuestTarget[4] = {position(135, 576, 0)} 
QuestTarget[5] = {position(135, 576, 0), position(137, 572, 0)} -- Tailoring table
QuestTarget[6] = {position(135, 576, 0)} 
QuestTarget[7] = {position(135, 576, 0)}
QuestTarget[8] = {position(135, 576, 0)}
QuestTarget[9] = {position(135, 576, 0)}
QuestTarget[10] = {position(135, 576, 0)}
QuestTarget[11] = {position(135, 576, 0)}
QuestTarget[12] = {position(135, 576, 0)}
QuestTarget[13] = {position(135, 576, 0)}
QuestTarget[14] = {position(135, 576, 0)}
QuestTarget[15] = {position(135, 576, 0)}

-- Insert the quest status which is reached at the end of the quest
local FINAL_QUEST_STATUS = 16


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

function M.QuestAvailability(user, status)
    if factions.isCadomyrCitizen(user) and status == 0 then
        return Player.questAvailable
    else
        return Player.questNotAvailable
    end
end

return M

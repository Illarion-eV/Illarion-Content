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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (717, 'quest.nadime_717_Cadomyr');

local common = require("base.common")
local factions = require("base.factions")

local M = {}

local GERMAN = Player.german
local ENGLISH = Player.english

-- Insert the quest title here, in both languages
local Title = {}
Title[GERMAN] = "Das Glasbläserzunft Cadomyrs"
Title[ENGLISH] = "The Glassblowing Guild of Cadomyr"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
local Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Beschaffe zehn Haufen Sand und bring diese zu Nadime in der Werkstatt von Cadomyr. Dazu nimmst du die Schaufel in die Hand und benutzt sie, während du vor einer Sandgrube stehst. Die nächste Sandgrube findest du vor den Toren Cadomyrs."
Description[ENGLISH][1] = "Get ten piles of sand and take them to Nadime at the workshop in Cadomyr. Dig the sand by using the shovel in your hand, whilst standing in front of a sandpit. The next sandpit is in front of Cadomyr's gates."
Description[GERMAN][2] = "Geh zu Nadime in der Werkstatt von Cadomyr. Sie hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][2] = "Go to Nadime at the workshop in Cadomyr, she is sure to have another task for you."
Description[GERMAN][3] = "Schmelze zehn Glasblöcke für Nadime in der Werkstatt von Cadomyr. Für die Glasblöcke musst du die Gussform benutzen und am Glasschmelzofen stehen. Du brauchst Pottasche und Quartzsand. Den Quartzsand erhältst du, wenn du den rohen Sand mit der Holzkelle am Sieb reinigst. Pottasche erhälst du durch das Verbrennen von Holz."
Description[ENGLISH][3] = "Melt ten glass ingots for Nadime at the workshop of Cadomyr. To melt you need to stand facing the glass melting oven oven and use the mould. You need potash and quartz sand. You get quartz sand at the seive from the raw sand using the wooden shovel. Potash you get by burning wood."
Description[GERMAN][4] = "Geh zu Nadime in der Werkstatt von Cadomyr. Sie hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][4] = "Go to Nadime at the workshop in Cadomyr, she is sure to have another task for you."
Description[GERMAN][5] = "Stelle zehn große leere Flaschen am Glasschmelzofen her. Nimm das Glasblasrohr in die Hand und benutze es. Wähle die großen leeren Flaschen aus dem Menü aus."
Description[ENGLISH][5] = "Produce ten big empty bottles at the glass melting oven. Take the glass blow pipe in your hand and use it. Select big empty bottles from the appearing menu."
Description[GERMAN][6] = "Dein derzeitiger Rang in der Glasbläserzunft von Cadomyr ist der eines Laiens. Gehe zu Nadime in der Werkstatt von Cadomyr sobald du Level 10 in der Fertigkeit Glasblasen erreicht hast."
Description[ENGLISH][6] = "Your current rank with the Glassblowing Guild of Cadomyr is Layman. Return to Nadime at the workshop of Cadomyr once you reached Level 10 in Glassblowing."
Description[GERMAN][7] = "Dein derzeitiger Rang in der Glasbläserzunft von Cadomyr ist der eines Anfängers. Gehe zu Nadime in der Werkstatt von Cadomyr sobald du Level 20 in der Fertigkeit Glasblasen erreicht hast."
Description[ENGLISH][7] = "Your current rank with the Glassblowing Guild of Cadomyr is Novice. Return to Nadime at the workshop of Cadomyr once you reached Level 20 in Glassblowing."
Description[GERMAN][8] = "Dein derzeitiger Rang in der Glasbläserzunft von Cadomyr ist der eines Lehrlings. Gehe zu Nadime in der Werkstatt von Cadomyr sobald du Level 30 in der Fertigkeit Glasblasen erreicht hast."
Description[ENGLISH][8] = "Your current rank with the Glassblowing Guild of Cadomyr is Apprentice. Return to Nadime at the workshop of Cadomyr once you reached Level 30 in Glassblowing."
Description[GERMAN][9] = "Dein derzeitiger Rang in der Glasbläserzunft von Cadomyr ist der eines Initiatens. Gehe zu Nadime in der Werkstatt von Cadomyr sobald du Level 40 in der Fertigkeit Glasblasen erreicht hast."
Description[ENGLISH][9] = "Your current rank with the Glassblowing Guild of Cadomyr is Initiate. Return to Nadime at the workshop of Cadomyr once you reached Level 40 in Glassblowing."
Description[GERMAN][10] = "Dein derzeitiger Rang in der Glasbläserzunft von Cadomyr ist der eines Gesellens. Gehe zu Nadime in der Werkstatt von Cadomyr sobald du Level 50 in der Fertigkeit Glasblasen erreicht hast."
Description[ENGLISH][10] = "Your current rank with the Glassblowing Guild of Cadomyr is Journeyman. Return to Nadime at the workshop of Cadomyr once you reached Level 50 in Glassblowing."
Description[GERMAN][11] = "Dein derzeitiger Rang in der Glasbläserzunft von Cadomyr ist der eines Spezialistens. Gehe zu Nadime in der Werkstatt von Cadomyr sobald du Level 60 in der Fertigkeit Glasblasen erreicht hast."
Description[ENGLISH][11] = "Your current rank with the Glassblowing Guild of Cadomyr is Specialist. Return to Nadime at the workshop of Cadomyr once you reached Level 60 in Glassblowing."
Description[GERMAN][12] = "Dein derzeitiger Rang in der Glasbläserzunft von Cadomyr ist der eines Expertens. Gehe zu Nadime in der Werkstatt von Cadomyr sobald du Level 70 in der Fertigkeit Glasblasen erreicht hast."
Description[ENGLISH][12] = "Your current rank with the Glassblowing Guild of Cadomyr is Expert. Return to Nadime at the workshop of Cadomyr once you reached Level 70 in Glassblowing."
Description[GERMAN][13] = "Dein derzeitiger Rang in der Glasbläserzunft von Cadomyr ist der eines Adeptens. Gehe zu Nadime in der Werkstatt von Cadomyr sobald du Level 80 in der Fertigkeit Glasblasen erreicht hast."
Description[ENGLISH][13] = "Your current rank with the Glassblowing Guild of Cadomyr is Adept. Return to Nadime at the workshop of Cadomyr once you reached Level 80 in Glassblowing."
Description[GERMAN][14] = "Dein derzeitiger Rang in der Glasbläserzunft von Cadomyr ist der eines Artisanens. Gehe zu Nadime in der Werkstatt von Cadomyr sobald du Level 90 in der Fertigkeit Glasblasen erreicht hast."
Description[ENGLISH][14] = "Your current rank with the Glassblowing Guild of Cadomyr is Artisan. Return to Nadime at the workshop of Cadomyr once you reached Level 90 in Glassblowing."
Description[GERMAN][15] = "Dein derzeitiger Rang in der Glasbläserzunft von Cadomyr ist der eines Meisters. Gehe zu Nadime in der Werkstatt von Cadomyr sobald du Level 100 in der Fertigkeit Glasblasen erreicht hast."
Description[ENGLISH][15] = "Your current rank with the Glassblowing Guild of Cadomyr is Master. Return to Nadime at the workshop of Cadomyr once you reached Level 100 in Glassblowing."
Description[GERMAN][16] = "Gratulation, du bist nun ein wahrer Großmeister der Glasbläserzunft von Cadomyr."
Description[ENGLISH][16] = "Congratulations, you are now a true Grandmaster of the Glassblowing Guild of Cadomyr."



-- Insert the position of the quest start here (probably the position of an NPC or item)
local Start = {141, 582, 0}


-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
local QuestTarget = {}
QuestTarget[1] = {position(141, 582, 0), position(122, 624, 0), position(123, 653, 0)} -- sand pit
QuestTarget[2] = {position(141, 582, 0)}
QuestTarget[3] = {position(141, 582, 0), position(143, 587, 0), position(143, 585, 0)} -- glass melting oven
QuestTarget[4] = {position(141, 582, 0)}
QuestTarget[5] = {position(141, 582, 0), position(143, 587, 0), position(143, 585, 0)} -- glass melting oven
QuestTarget[6] = {position(141, 582, 0)}
QuestTarget[7] = {position(141, 582, 0)}
QuestTarget[8] = {position(141, 582, 0)}
QuestTarget[9] = {position(141, 582, 0)}
QuestTarget[10] = {position(141, 582, 0)}
QuestTarget[11] = {position(141, 582, 0)}
QuestTarget[12] = {position(141, 582, 0)}
QuestTarget[13] = {position(141, 582, 0)}
QuestTarget[14] = {position(141, 582, 0)}
QuestTarget[15] = {position(141, 582, 0)}

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

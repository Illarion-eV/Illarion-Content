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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (707, 'quest.zlatxhol_707_cadomyr');

local common = require("base.common")
local factions = require("base.factions")
local M = {}

local GERMAN = Player.german
local ENGLISH = Player.english

-- Insert the quest title here, in both languages
local Title = {}
Title[GERMAN] = "Die Töpferinnung von Cadomyr"
Title[ENGLISH] = "The Pottery Guild of Cadomyr"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
local Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Sammle zwanzig Klumpen Lehm in den Lehmgrüben südlich der Stadttore und bringe sie zu Zlatxhol in der Werkstatt von Cadomyr. Lehm sammelst du, in dem die Schaufel in die Hand nimmst und sie bei einer Lehmgrube benutzt."
Description[ENGLISH][1] = "Collect twenty clumps of clay at the clay pit in the south outside the gates, for Zlatxhol in the workshop of Cadomyr. You can collect the clay if you take the shovel in your hand and use it on a spot where there is a clay pit in the mud."
Description[GERMAN][2] = "Geh zu Zlatxhol in der Werkstatt von Cadomyr, er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][2] = "Go to Zlatxhol in the workshop of Cadomyr, he is sure to have another task for you."
Description[GERMAN][3] = "Stelle zehn Ziegel am Brennzofen für Zlatxhol in Cadomyr her. Um Ziegel herzustellen, musst du die Zange in die Hand nehmen und den Brennofen benutzen."
Description[ENGLISH][3] = "Produce ten bricks in the kiln for Zlatxhol in Cadomyr. To produce the bricks, you have to take the tongs in your hand and use the kiln."
-- 4 and 5 skipped
Description[GERMAN][6] = "Dein derzeitiger Rang in der Töpferinnung von Cadomyr ist der eines Laiens. Gehe zu Zlatxhol in der Werkstatt von Cadomyr sobald du Level 10 in der Töpferfertigkeit erreicht hast."
Description[ENGLISH][6] = "Your current rank with the Pottery Guild of Cadomyr is Layman. Return to Zlatxhol at the workshop of Cadomyr once you reached Level 10 in Pottery."
Description[GERMAN][7] = "Dein derzeitiger Rang in der Töpferinnung von Cadomyr ist der eines Anfängers. Gehe zu Zlatxhol in der Werkstatt von Cadomyr sobald du Level 20 in der Töpferfertigkeit erreicht hast."
Description[ENGLISH][7] = "Your current rank with the Pottery Guild of Cadomyr is Novice. Return to Zlatxhol at the workshop of Cadomyr once you reached Level 20 in Pottery."
Description[GERMAN][8] = "Dein derzeitiger Rang in der Töpferinnung von Cadomyr ist der eines Lehrlings. Gehe zu Zlatxhol in der Werkstatt von Cadomyr sobald du Level 30 in der Töpferfertigkeit erreicht hast."
Description[ENGLISH][8] = "Your current rank with the Pottery Guild of Cadomyr is Apprentice. Return to Zlatxhol at the workshop of Cadomyr once you reached Level 30 in Pottery."
Description[GERMAN][9] = "Dein derzeitiger Rang in der Töpferinnung von Cadomyr ist der eines Initiatens. Gehe zu Zlatxhol in der Werkstatt von Cadomyr sobald du Level 40 in der Töpferfertigkeit erreicht hast."
Description[ENGLISH][9] = "Your current rank with the Pottery Guild of Cadomyr is Initiate. Return to Zlatxhol at the workshop of Cadomyr once you reached Level 40 in Pottery."
Description[GERMAN][10] = "Dein derzeitiger Rang in der Töpferinnung von Cadomyr ist der eines Gesellens. Gehe zu Zlatxhol in der Werkstatt von Cadomyr sobald du Level 50 in der Töpferfertigkeit erreicht hast."
Description[ENGLISH][10] = "Your current rank with the Pottery Guild of Cadomyr is Journeyman. Return to Zlatxhol at the workshop of Cadomyr once you reached Level 50 in Pottery."
Description[GERMAN][11] = "Dein derzeitiger Rang in der Töpferinnung von Cadomyr ist der eines Spezialistens. Gehe zu Zlatxhol in der Werkstatt von Cadomyr sobald du Level 60 in der Töpferfertigkeit erreicht hast."
Description[ENGLISH][11] = "Your current rank with the Pottery Guild of Cadomyr is Specialist. Return to Zlatxhol at the workshop of Cadomyr once you reached Level 60 in Pottery."
Description[GERMAN][12] = "Dein derzeitiger Rang in der Töpferinnung von Cadomyr ist der eines Expertens. Gehe zu Zlatxhol in der Werkstatt von Cadomyr sobald du Level 70 in der Töpferfertigkeit erreicht hast."
Description[ENGLISH][12] = "Your current rank with the Pottery Guild of Cadomyr is Expert. Return to Zlatxhol at the workshop of Cadomyr once you reached Level 70 in Pottery."
Description[GERMAN][13] = "Dein derzeitiger Rang in der Töpferinnung von Cadomyr ist der eines Adeptens. Gehe zu Zlatxhol in der Werkstatt von Cadomyr sobald du Level 80 in der Töpferfertigkeit erreicht hast."
Description[ENGLISH][13] = "Your current rank with the Pottery Guild of Cadomyr is Adept. Return to Zlatxhol at the workshop of Cadomyr once you reached Level 80 in Pottery."
Description[GERMAN][14] = "Dein derzeitiger Rang in der Töpferinnung von Cadomyr ist der eines Artisanens. Gehe zu Zlatxhol in der Werkstatt von Cadomyr sobald du Level 90 in der Töpferfertigkeit erreicht hast."
Description[ENGLISH][14] = "Your current rank with the Pottery Guild of Cadomyr is Artisan. Return to Zlatxhol at the workshop of Cadomyr once you reached Level 90 in Pottery."
Description[GERMAN][15] = "Dein derzeitiger Rang in der Töpferinnung von Cadomyr ist der eines Meisters. Gehe zu Zlatxhol in der Werkstatt von Cadomyr sobald du Level 100 in der Töpferfertigkeit erreicht hast."
Description[ENGLISH][15] = "Your current rank with the Pottery Guild of Cadomyr is Master. Return to Zlatxhol at the workshop of Cadomyr once you reached Level 100 in Pottery."
Description[GERMAN][16] = "Gratulation, du bist nun ein wahrer Großmeister der Töpferinnung von Cadomyr."
Description[ENGLISH][16] = "Congratulations, you are now a true Grandmaster of the Pottery Guild of Cadomyr."


-- Insert the position of the quest start here (probably the position of an NPC or item)
local Start = {134, 593, 0}


-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
local QuestTarget = {}
QuestTarget[1] = {position(134, 593, 0), position(106, 644, 0)} -- Clay Pit
QuestTarget[2] = {position(134, 593, 0)} 
QuestTarget[3] = {position(134, 593, 0), position(143, 584, 0)} -- Kiln
QuestTarget[6] = {position(134, 593, 0)} 
QuestTarget[7] = {position(134, 593, 0)} 
QuestTarget[8] = {position(134, 593, 0)} 
QuestTarget[9] = {position(134, 593, 0)} 
QuestTarget[10] = {position(134, 593, 0)} 
QuestTarget[11] = {position(134, 593, 0)} 
QuestTarget[12] = {position(134, 593, 0)} 
QuestTarget[13] = {position(134, 593, 0)} 
QuestTarget[14] = {position(134, 593, 0)} 
QuestTarget[15] = {position(134, 593, 0)} 

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

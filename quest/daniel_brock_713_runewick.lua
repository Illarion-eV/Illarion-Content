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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (713, 'quest.daniel_brock_713_runewick');

local common = require("base.common")
local factions = require("base.factions")
local M = {}

local GERMAN = Player.german
local ENGLISH = Player.english

-- Insert the quest title here, in both languages
local Title = {}
Title[GERMAN] = "Die Schreinerinnung von Runewick"
Title[ENGLISH] = "The Carpentry Association of Runewick"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
local Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}

Description[GERMAN][1] = "Sammel zehn Scheite Apfelholz in Eibenthal und bring diese zu Daniel Brock in der Werkstatt von Runewick. Dazu nimmst du das Beil in die Hand und benutzt es, während du vor einem Apfelbaum stehst."
Description[ENGLISH][1] = "Collect ten logs of apple wood in Yewdale and take them to Daniel Brock at the workshop in Runewick. Use the hatchet in your hand, whilst standing in front of an apple tree." 
Description[GERMAN][2] = "Geh zu Daniel Brock in der Werkstatt von Runewick. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][2] = "Go to Daniel Brock at the workshop in Runewick, he is sure to have another task for you."
Description[GERMAN][3] = "Säge zehn Apfelholzbretter für Daniel Brock am Sägebock in Runewick. Um die Bretter herzustellen, musst du die Säge in die Hand nehmen und den Sägebock benutzen, wenn du vor ihm stehst."
Description[ENGLISH][3] = "Saw ten apple wood boards for Daniel Brock at the sawing trestle in Runewick's workshop. To saw the boards you have to take the saw in your hand and use the sawing trestle."
Description[GERMAN][4] = "Geh zu Daniel Brock in der Werkstatt von Runewick. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][4] = "Go to Daniel Brock at the workshop in Runewick, he is sure to have another task for you."
Description[GERMAN][5] = "Schnitze zehn Axtgriffe für Daniel Brock in der Werkstatt von Runewick. Für die Axtgriffe musst du die Schnitzmesser an der Werkbank benutzen."
Description[ENGLISH][5] = "Carve ten axe handles for Daniel Brock at the workshop of Runewick. To carve you need to stand facing the work bench and use the carving tools."
Description[GERMAN][6] = "Dein derzeitiger Rang in der Schreinerinnung von Runewick ist der eines Laiens. Gehe zu Daniel Brock in der Werkstatt von Runewick sobald du Level 10 in der Schreinerfertigkeit erreicht hast."
Description[ENGLISH][6] = "Your current rank with the Carpentry Association of Runewick is Layman. Return to Daniel Brock at the workshop of Runewick once you reached Level 10 in Carpentry."
Description[GERMAN][7] = "Dein derzeitiger Rang in der Schreinerinnung von Runewick ist der eines Anfängers. Gehe zu Daniel Brock in der Werkstatt von Runewick sobald du Level 20 in der Schreinerfertigkeit erreicht hast."
Description[ENGLISH][7] = "Your current rank with the Carpentry Association of Runewick is Novice. Return to Daniel Brock at the workshop of Runewick once you reached Level 20 in Carpentry."
Description[GERMAN][8] = "Dein derzeitiger Rang in der Schreinerinnung von Runewick ist der eines Lehrlings. Gehe zu Daniel Brock in der Werkstatt von Runewick sobald du Level 30 in der Schreinerfertigkeit erreicht hast."
Description[ENGLISH][8] = "Your current rank with the Carpentry Association of Runewick is Apprentice. Return to Daniel Brock at the workshop of Runewick once you reached Level 30 in Carpentry."
Description[GERMAN][9] = "Dein derzeitiger Rang in der Schreinerinnung von Runewick ist der eines Initiatens. Gehe zu Daniel Brock in der Werkstatt von Runewick sobald du Level 40 in der Schreinerfertigkeit erreicht hast."
Description[ENGLISH][9] = "Your current rank with the Carpentry Association of Runewick is Initiate. Return to Daniel Brock at the workshop of Runewick once you reached Level 40 in Carpentry."
Description[GERMAN][10] = "Dein derzeitiger Rang in der Schreinerinnung von Runewick ist der eines Gesellens. Gehe zu Daniel Brock in der Werkstatt von Runewick sobald du Level 50 in der Schreinerfertigkeit erreicht hast."
Description[ENGLISH][10] = "Your current rank with the Carpentry Association of Runewick is Journeyman. Return to Daniel Brock at the workshop of Runewick once you reached Level 50 in Carpentry."
Description[GERMAN][11] = "Dein derzeitiger Rang in der Schreinerinnung von Runewick ist der eines Spezialistens. Gehe zu Daniel Brock in der Werkstatt von Runewick sobald du Level 60 in der Schreinerfertigkeit erreicht hast."
Description[ENGLISH][11] = "Your current rank with the Carpentry Association of Runewick is Specialist. Return to Daniel Brock at the workshop of Runewick once you reached Level 60 in Carpentry."
Description[GERMAN][12] = "Dein derzeitiger Rang in der Schreinerinnung von Runewick ist der eines Expertens. Gehe zu Daniel Brock in der Werkstatt von Runewick sobald du Level 70 in der Schreinerfertigkeit erreicht hast."
Description[ENGLISH][12] = "Your current rank with the Carpentry Association of Runewick is Expert. Return to Daniel Brock at the workshop of Runewick once you reached Level 70 in Carpentry."
Description[GERMAN][13] = "Dein derzeitiger Rang in der Schreinerinnung von Runewick ist der eines Adeptens. Gehe zu Daniel Brock in der Werkstatt von Runewick sobald du Level 80 in der Schreinerfertigkeit erreicht hast."
Description[ENGLISH][13] = "Your current rank with the Carpentry Association of Runewick is Adept. Return to Daniel Brock at the workshop of Runewick once you reached Level 80 in Carpentry."
Description[GERMAN][14] = "Dein derzeitiger Rang in der Schreinerinnung von Runewick ist der eines Artisanens. Gehe zu Daniel Brock in der Werkstatt von Runewick sobald du Level 90 in der Schreinerfertigkeit erreicht hast."
Description[ENGLISH][14] = "Your current rank with the Carpentry Association of Runewick is Artisan. Return to Daniel Brock at the workshop of Runewick once you reached Level 90 in Carpentry."
Description[GERMAN][15] = "Dein derzeitiger Rang in der Schreinerinnung von Runewick ist der eines Meisters. Gehe zu Daniel Brock in der Werkstatt von Runewick sobald du Level 100 in der Schreinerfertigkeit erreicht hast."
Description[ENGLISH][15] = "Your current rank with the Carpentry Association of Runewick is Master. Return to Daniel Brock at the workshop of Runewick once you reached Level 100 in Carpentry."
Description[GERMAN][16] = "Gratulation, du bist nun ein wahrer Großmeister der Schreinerinnung von Runewick."
Description[ENGLISH][16] = "Congratulations, you are now a true Grandmaster of the Carpentry Association of Runewick."

-- Insert the position of the quest start here (probably the position of an NPC or item)
local Start = {959, 825, 0}

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
local QuestTarget = {}
QuestTarget[1] = {position(959, 825, 0)}
QuestTarget[2] = {position(959, 825, 0)}
QuestTarget[3] = {position(959, 825, 0), position(959, 823, 0)} -- Sawing trestle
QuestTarget[4] = {position(959, 825, 0)}
QuestTarget[5] = {position(959, 825, 0), position(957, 823, 0)} -- Work bench
QuestTarget[6] = {position(959, 825, 0)} 
QuestTarget[7] = {position(959, 825, 0)} 
QuestTarget[8] = {position(959, 825, 0)} 
QuestTarget[9] = {position(959, 825, 0)} 
QuestTarget[10] = {position(959, 825, 0)} 
QuestTarget[11] = {position(959, 825, 0)} 
QuestTarget[12] = {position(959, 825, 0)} 
QuestTarget[13] = {position(959, 825, 0)} 
QuestTarget[14] = {position(959, 825, 0)} 
QuestTarget[15] = {position(959, 825, 0)} 

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
    if factions.isRunewickCitizen(user) and status == 0 then
        return Player.questAvailable
    else
        return Player.questNotAvailable
    end
end

return M

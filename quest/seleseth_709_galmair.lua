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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (709, 'quest.seleseth_709_galmair');

local common = require("base.common")
local factions = require("base.factions")
local M = {}

local GERMAN = Player.german
local ENGLISH = Player.english

-- Insert the quest title here, in both languages
local Title = {}
Title[GERMAN] = "Die Zunft der Rüstschmiede von Galmair"
Title[ENGLISH] = "The Armourer Guild of Galmair"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
local Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Sammel zehn Eisenerz und bring diese zu Seleseth in der Werkstatt von Galmair. Sammel mit der Spitzhacke in der Malachitmine. Diese liegt südlich der Stadt. Dazu nimmst du die Spitzhacke in die Hand und benutzt sie, während du vor einem erzhaltigen Stein stehst."
Description[ENGLISH][1] = "Collect ten lumps of iron ore and take them to Seleseth at the workshop in Galmair. Collect the ore by using the pick-axe in your hand, whilst standing in front of an iron ore rich stone. The Malachite mine you find south of the town." 
Description[GERMAN][2] = "Geh zu Seleseth in der Werkstatt von Galmair. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][2] = "Go to Seleseth at the workshop in Galmair, he is sure to have another task for you."
Description[GERMAN][3] = "Schmelze zehn Eisenbarren für Seleseth am Rennofen in Galmair. Um die Eisenbarren herzustellen, musst du die Tiegelzange in die Hand nehmen und den Rennofen benutzen, wenn du vor ihm stehst. Du benötigst auch noch Kohle für die Arbeit."
Description[ENGLISH][3] = "Melt ten iron ingots for Seleseth at the bloomery in Galmair's workshop. To melt you have to take the crucible-pincer in your hand and use the bloomery. You need additional coal for your work."
Description[GERMAN][4] = "Geh zu Seleseth in der Werkstatt von Galmair. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][4] = "Go to Seleseth at the workshop in Galmair, he is sure to have another task for you."
Description[GERMAN][5] = "Schmiede zehn Stahlkappen für Seleseth in der Werkstatt von Galmair. Für die Stahlkappen musst du den Hammer des Rüstschmiedes am Amboss benutzen."
Description[ENGLISH][5] = "Smith ten steel caps for Seleseth at the workshop of Galmair. To smith you need to stand facing the anvil and use the hammer of the armourer."
Description[GERMAN][6] = "Dein derzeitiger Rang in der Zunft der Rüstschmiede von Galmair ist der eines Laiens. Gehe zu Seleseth in der Werkstatt von Galmair sobald du Level 10 in der Fertigkeit des Rüstschmiedens erreicht hast."
Description[ENGLISH][6] = "Your current rank with the Armourer Guild of Galmair is Layman. Return to Seleseth at the workshop of Galmair once you reached Level 10 in Armoury."
Description[GERMAN][7] = "Dein derzeitiger Rang in der Zunft der Rüstschmiede von Galmair ist der eines Anfängers. Gehe zu Seleseth in der Werkstatt von Galmair sobald du Level 20 in der Fertigkeit des Rüstschmiedens erreicht hast."
Description[ENGLISH][7] = "Your current rank with the Armourer Guild of Galmair is Novice. Return to Seleseth at the workshop of Galmair once you reached Level 20 in Armoury."
Description[GERMAN][8] = "Dein derzeitiger Rang in der Zunft der Rüstschmiede von Galmair ist der eines Lehrlings. Gehe zu Seleseth in der Werkstatt von Galmair sobald du Level 30 in der Fertigkeit des Rüstschmiedens erreicht hast."
Description[ENGLISH][8] = "Your current rank with the Armourer Guild of Galmair is Apprentice. Return to Seleseth at the workshop of Galmair once you reached Level 30 in Armoury."
Description[GERMAN][9] = "Dein derzeitiger Rang in der Zunft der Rüstschmiede von Galmair ist der eines Initiatens. Gehe zu Seleseth in der Werkstatt von Galmair sobald du Level 40 in der Fertigkeit des Rüstschmiedens erreicht hast."
Description[ENGLISH][9] = "Your current rank with the Armourer Guild of Galmair is Initiate. Return to Seleseth at the workshop of Galmair once you reached Level 40 in Armoury."
Description[GERMAN][10] = "Dein derzeitiger Rang in der Zunft der Rüstschmiede von Galmair ist der eines Gesellens. Gehe zu Seleseth in der Werkstatt von Galmair sobald du Level 50 in der Fertigkeit des Rüstschmiedens erreicht hast."
Description[ENGLISH][10] = "Your current rank with the Armourer Guild of Galmair is Journeyman. Return to Seleseth at the workshop of Galmair once you reached Level 50 in Armoury."
Description[GERMAN][11] = "Dein derzeitiger Rang in der Zunft der Rüstschmiede von Galmair ist der eines Spezialistens. Gehe zu Seleseth in der Werkstatt von Galmair sobald du Level 60 in der Fertigkeit des Rüstschmiedens erreicht hast."
Description[ENGLISH][11] = "Your current rank with the Armourer Guild of Galmair is Specialist. Return to Seleseth at the workshop of Galmair once you reached Level 60 in Armoury."
Description[GERMAN][12] = "Dein derzeitiger Rang in der Zunft der Rüstschmiede von Galmair ist der eines Expertens. Gehe zu Seleseth in der Werkstatt von Galmair sobald du Level 70 in der Fertigkeit des Rüstschmiedens erreicht hast."
Description[ENGLISH][12] = "Your current rank with the Armourer Guild of Galmair is Expert. Return to Seleseth at the workshop of Galmair once you reached Level 70 in Armoury."
Description[GERMAN][13] = "Dein derzeitiger Rang in der Zunft der Rüstschmiede von Galmair ist der eines Adeptens. Gehe zu Seleseth in der Werkstatt von Galmair sobald du Level 80 in der Fertigkeit des Rüstschmiedens erreicht hast."
Description[ENGLISH][13] = "Your current rank with the Armourer Guild of Galmair is Adept. Return to Seleseth at the workshop of Galmair once you reached Level 80 in Armoury."
Description[GERMAN][14] = "Dein derzeitiger Rang in der Zunft der Rüstschmiede von Galmair ist der eines Artisanens. Gehe zu Seleseth in der Werkstatt von Galmair sobald du Level 90 in der Fertigkeit des Rüstschmiedens erreicht hast."
Description[ENGLISH][14] = "Your current rank with the Armourer Guild of Galmair is Artisan. Return to Seleseth at the workshop of Galmair once you reached Level 90 in Armoury."
Description[GERMAN][15] = "Dein derzeitiger Rang in der Zunft der Rüstschmiede von Galmair ist der eines Meisters. Gehe zu Seleseth in der Werkstatt von Galmair sobald du Level 100 in der Fertigkeit des Rüstschmiedens erreicht hast."
Description[ENGLISH][15] = "Your current rank with the Armourer Guild of Galmair is Master. Return to Seleseth at the workshop of Galmair once you reached Level 100 in Armoury."
Description[GERMAN][16] = "Gratulation, du bist nun ein wahrer Großmeister der Zunft der Rüstschmiede von Galmair."
Description[ENGLISH][16] = "Congratulations, you are now a true Grandmaster of the Armourer Guild of Galmair."


-- Insert the position of the quest start here (probably the position of an NPC or item)
local Start = {387, 278, 0}


-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
local QuestTarget = {}
QuestTarget[1] = {position(387, 278, 0), position(438, 350, 0)}
QuestTarget[2] = {position(387, 278, 0)}
QuestTarget[3] = {position(387, 278, 0), position(387, 276, 0)} -- bloomery
QuestTarget[4] = {position(387, 278, 0)}
QuestTarget[5] = {position(387, 278, 0), position(383, 272, 0), position(383, 275, 0)} -- anvil
QuestTarget[6] = {position(387, 278, 0)} 
QuestTarget[7] = {position(387, 278, 0)} 
QuestTarget[8] = {position(387, 278, 0)} 
QuestTarget[9] = {position(387, 278, 0)} 
QuestTarget[10] = {position(387, 278, 0)} 
QuestTarget[11] = {position(387, 278, 0)} 
QuestTarget[12] = {position(387, 278, 0)} 
QuestTarget[13] = {position(387, 278, 0)} 
QuestTarget[14] = {position(387, 278, 0)} 
QuestTarget[15] = {position(387, 278, 0)} 

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
    if factions.isGalmairCitizen(user) and status == 0 then
        return Player.questAvailable
    else
        return Player.questNotAvailable
    end
end

return M

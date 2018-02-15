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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (708, 'quest.thorgrem_silverbeard_708_galmair');

local common = require("base.common")
local factions = require("base.factions")
local M = {}

local GERMAN = Player.german
local ENGLISH = Player.english

-- Insert the quest title here, in both languages
local Title = {}
Title[GERMAN] = "Die Schmiedegilde von Galmair"
Title[ENGLISH] = "The Blacksmithing Guild of Galmair"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
local Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Sammel zehn Klumpen Kohle und zehn Brocken Eisenerz und bring diese zu Thorgrem Silverbeard bei der Werkstatt von Galmair. Wenn du aus der Werkstatt die südliche Tür hinaus nimmst, der Straße nach Süden folgst, bis du zu einer Brücke gelangst und anschließend weiter nach Südosten gehst, erreichst du die Malachitmine. Zur Dunkellochmine gelangst du, wenn du die Stadt im Osten verlässt, der Straße nach Osten folgst, die goldene Brücke überquerst und anschließend die goldene Brücke im Norden nochmals überquerst. Nach der Brücke nimmst du den Weg nach Nordwesten und überquerst die Holzbrücke und dann hast du dein Ziel erreicht."
Description[ENGLISH][1] = "Collect ten lumps of coal and ten pieces of iron ore and take them to Thorgrem Silverbeard at the workshop in Galmair. You can find the Malachite Mine if you leave the workshop through the south door and follow the street south until you reach a bridge; over the bridge you follow the street south east and then you are there. To find the Dark Hole Mine you have to leave the city to the east, then you follow the street, crossing a golden bridge and bearing north until you reach another bridge; again you go over a bridge and follow the street to the northwest where you just need to go over the wooden bridge to get to the mine." 
Description[GERMAN][2] = "Geh zu Thorgrem Silverbeard in der Werkstatt von Galmair. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][2] = "Go to Thorgrem Silverbeard at the workshop in Galmair, he is sure to have another task for you."
Description[GERMAN][3] = "Gieße zehn Eisenbarren für Thorgrem Silverbeard am Rennofen in Galmair. Um die Barren herzustellen, musst du die Tiegelzange in die Hand nehmen und den Rennofen benutzen, wenn du vor ihm stehst."
Description[ENGLISH][3] = "Cast ten iron ingots for Thorgrem Silverbeard at the bloomery in Galmair's workshop. To smelt the ingots you have to take the crucible-pincers in your hand and use the bloomery."
Description[GERMAN][4] = "Geh zu Thorgrem Silverbeard in der Werkstatt von Galmair. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][4] = "Go to Thorgrem Silverbeard at the workshop in Galmair, he is sure to have another task for you."
Description[GERMAN][5] = "Schmiede zehn Nägel für Thorgrem Silverbeard bei der Werkstatt von Galmair. Für die Nägel musst du den Hammer mit dem gelben Griff benutzen."
Description[ENGLISH][5] = "Smith ten pins for Thorgrem Silverbeard at the workshop of Galmair. To smith you need to stand facing the anvil. For the pins you have to use the hammer with the yellow handle."
Description[GERMAN][6] = "Dein derzeitiger Rang in der Schmiedegilde von Galmair ist der eines Laiens. Gehe zu Thorgrem Silverbeard bei der Werkstatt von Galmair sobald du Level 10 in der Schmiedefertigkeit erreicht hast."
Description[ENGLISH][6] = "Your current rank with the Blacksmithing Guild of Galmair is Layman. Return to Thorgrem Silverbeard at the workshop of Galmair once you reached Level 10 in Blacksmithing."
Description[GERMAN][7] = "Dein derzeitiger Rang in der Schmiedegilde von Galmair ist der eines Anfängers. Gehe zu Thorgrem Silverbeard bei der Werkstatt von Galmair sobald du Level 20 in der Schmiedefertigkeit erreicht hast."
Description[ENGLISH][7] = "Your current rank with the Blacksmithing Guild of Galmair is Novice. Return to Thorgrem Silverbeard at the workshop of Galmair once you reached Level 20 in Blacksmithing."
Description[GERMAN][8] = "Dein derzeitiger Rang in der Schmiedegilde von Galmair ist der eines Lehrlings. Gehe zu Thorgrem Silverbeard bei der Werkstatt von Galmair sobald du Level 30 in der Schmiedefertigkeit erreicht hast."
Description[ENGLISH][8] = "Your current rank with the Blacksmithing Guild of Galmair is Apprentice. Return to Thorgrem Silverbeard at the workshop of Galmair once you reached Level 30 in Blacksmithing."
Description[GERMAN][9] = "Dein derzeitiger Rang in der Schmiedegilde von Galmair ist der eines Initiatens. Gehe zu Thorgrem Silverbeard bei der Werkstatt von Galmair sobald du Level 40 in der Schmiedefertigkeit erreicht hast."
Description[ENGLISH][9] = "Your current rank with the Blacksmithing Guild of Galmair is Initiate. Return to Thorgrem Silverbeard at the workshop of Galmair once you reached Level 40 in Blacksmithing."
Description[GERMAN][10] = "Dein derzeitiger Rang in der Schmiedegilde von Galmair ist der eines Gesellens. Gehe zu Thorgrem Silverbeard bei der Werkstatt von Galmair sobald du Level 50 in der Schmiedefertigkeit erreicht hast."
Description[ENGLISH][10] = "Your current rank with the Blacksmithing Guild of Galmair is Journeyman. Return to Thorgrem Silverbeard at the workshop of Galmair once you reached Level 50 in Blacksmithing."
Description[GERMAN][11] = "Dein derzeitiger Rang in der Schmiedegilde von Galmair ist der eines Spezialistens. Gehe zu Thorgrem Silverbeard bei der Werkstatt von Galmair sobald du Level 60 in der Schmiedefertigkeit erreicht hast."
Description[ENGLISH][11] = "Your current rank with the Blacksmithing Guild of Galmair is Specialist. Return to Thorgrem Silverbeard at the workshop of Galmair once you reached Level 60 in Blacksmithing."
Description[GERMAN][12] = "Dein derzeitiger Rang in der Schmiedegilde von Galmair ist der eines Expertens. Gehe zu Thorgrem Silverbeard bei der Werkstatt von Galmair sobald du Level 70 in der Schmiedefertigkeit erreicht hast."
Description[ENGLISH][12] = "Your current rank with the Blacksmithing Guild of Galmair is Expert. Return to Thorgrem Silverbeard at the workshop of Galmair once you reached Level 70 in Blacksmithing."
Description[GERMAN][13] = "Dein derzeitiger Rang in der Schmiedegilde von Galmair ist der eines Adeptens. Gehe zu Thorgrem Silverbeard bei der Werkstatt von Galmair sobald du Level 80 in der Schmiedefertigkeit erreicht hast."
Description[ENGLISH][13] = "Your current rank with the Blacksmithing Guild of Galmair is Adept. Return to Thorgrem Silverbeard at the workshop of Galmair once you reached Level 80 in Blacksmithing."
Description[GERMAN][14] = "Dein derzeitiger Rang in der Schmiedegilde von Galmair ist der eines Artisanens. Gehe zu Thorgrem Silverbeard bei der Werkstatt von Galmair sobald du Level 90 in der Schmiedefertigkeit erreicht hast."
Description[ENGLISH][14] = "Your current rank with the Blacksmithing Guild of Galmair is Artisan. Return to Thorgrem Silverbeard at the workshop of Galmair once you reached Level 90 in Blacksmithing."
Description[GERMAN][15] = "Dein derzeitiger Rang in der Schmiedegilde von Galmair ist der eines Meisters. Gehe zu Thorgrem Silverbeard bei der Werkstatt von Galmair sobald du Level 100 in der Schmiedefertigkeit erreicht hast."
Description[ENGLISH][15] = "Your current rank with the Blacksmithing Guild of Galmair is Master. Return to Thorgrem Silverbeard at the workshop of Galmair once you reached Level 100 in Blacksmithing."
Description[GERMAN][16] = "Gratulation, du bist nun ein wahrer Großmeister der Schmiedegilde von Galmair."
Description[ENGLISH][16] = "Congratulations, you are now a true Grandmaster of the Blacksmithing Guild of Galmair."

-- Insert the position of the quest start here (probably the position of an NPC or item)
local Start = {387, 273, 0}

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
local QuestTarget = {}
QuestTarget[1] = {position(387, 273, 0), position(397, 145, 0), position(426, 355, 0)} -- Mines
QuestTarget[2] = {position(387, 273, 0)} 
QuestTarget[3] = {position(387, 273, 0), position(387, 272, 0)} -- bloomery
QuestTarget[4] = {position(387, 273, 0)} 
QuestTarget[5] = {position(387, 273, 0), position(383, 272, 0)} -- anvil
QuestTarget[7] = {position(387, 273, 0)} 
QuestTarget[8] = {position(387, 273, 0)} 
QuestTarget[9] = {position(387, 273, 0)} 
QuestTarget[10] = {position(387, 273, 0)} 
QuestTarget[11] = {position(387, 273, 0)} 
QuestTarget[12] = {position(387, 273, 0)} 
QuestTarget[13] = {position(387, 273, 0)} 
QuestTarget[14] = {position(387, 273, 0)} 
QuestTarget[15] = {position(387, 273, 0)}

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

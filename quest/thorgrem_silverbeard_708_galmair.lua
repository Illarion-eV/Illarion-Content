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

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Das Schmiedehandwerk"
Title[ENGLISH] = "The smithing craft"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Sammel 10 Klumpen Kohle und 10 Brocken Eisenerz und bring diese zu Thorgrem Silverbeard bei der Werkstatt von Galmair. Wenn du aus der Werkstatt die südliche Tür hinaus nimmst, der Straße nach Süden folgst, bis du zu einer Brücke gelangst und anschließend weiter nach Südosten gehst, erreichst du die Malachitmine. Zur Dunkellochmine gelangst du, wenn du die Stadt im Osten verlässt, der Straße nach Osten folgst, die goldene Brücke überquerst und anschließend die goldene Brücke im Norden nochmals überquerst. Nach der Brücke nimmst du den Weg nach Nordwesten und überquerst die Holzbrücke und dann hast du dein Ziel erreicht."
Description[ENGLISH][1] = "Collect 10 lumps of coal and 10 pieces of iron ore and take them to Thorgrem Silverbeard at the workshop in Galmair. You can find the Malachite Mine if you leave the workshop through the south door and follow the street south until you reach a bridge; over the bridge you follow the street south east and then you are there. To find the Dark Hole Mine you have to leave the city to the east, then you follow the street, crossing a golden bridge and bearing north until you reach another bridge; again you go over a bridge and follow the street to the northwest where you just need to go over the wooden bridge to get to the mine." 
Description[GERMAN][2] = "Geh zu Thorgrem Silverbeard in der Werkstatt von Galmair. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][2] = "Go to Thorgrem Silverbeard at the workshop in Galmair, he is sure to have another task for you."
Description[GERMAN][3] = "Schmilz zehn Eisenbarren für Thorgrem Silverbeard an der Esse in Galmair. Um die Barren herzustellen, musst du die Tiegelzange in die Hand nehmen und die Esse benutzen, wenn du vor ihr stehst."
Description[ENGLISH][3] = "Smelt ten iron ingots for Thorgrem Silverbeard at the furnace in Galmair's workshop. To smelt the ingots you have to take the crucible-pincers in your hand and use the furnace."
Description[GERMAN][4] = "Geh zu Thorgrem Silverbeard in der Werkstatt von Galmair. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][4] = "Go to Thorgrem Silverbeard at the workshop in Galmair, he is sure to have another task for you."
Description[GERMAN][5] = "Schmiede fünf Nägel und fünf Kelche für Thorgrem Silverbeard bei der Werkstatt von Galmair. Für die Nägel musst du den Hammer mit dem gelben Griff benutzen. Für die Kelche nimmst du den Feinschmiedehammer mit dem roten Griff."
Description[ENGLISH][5] = "Smith five pins and five goblets for Thorgrem Silverbeard at the workshop of Galmair. To smith you need to stand facing the anvil. For the pins you have to use the hammer with the yellow handle, for the goblets use the finesmithing hammer with the red handle."
Description[GERMAN][6] = "Du hast alle Aufgaben von Thorgrem Silverbeard erfüllt."
Description[ENGLISH][6] = "You have fulfilled all the tasks for Thorgrem Silverbeard."


-- Insert the position of the quest start here (probably the position of an NPC or item)
Start = {387, 273, 0}


-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(387, 273, 0), position(397, 145, 0), position(426, 355, 0)} -- Mines
QuestTarget[2] = {position(387, 273, 0)} 
QuestTarget[3] = {position(387, 273, 0), position(387, 272, 0)} -- Furnace
QuestTarget[4] = {position(387, 273, 0)} 
QuestTarget[5] = {position(387, 273, 0), position(383, 272, 0)} -- anvil
QuestTarget[6] = {position(387, 273, 0)} 

-- Insert the quest status which is reached at the end of the quest
FINAL_QUEST_STATUS = 6


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

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

require("base.common")
require("base.factions")
module("quest.thorgrem_silverbeard_708_galmair", package.seeall)

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Das Schmiedehandwerk"
Title[ENGLISH] = "The smithing craft"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
-- Smithing tutorial
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
--Smithing reward system (Needs german translation)
Description[GERMAN][6] = "Need translation"
Description[ENGLISH][6] = "Return to Thorgrem Silverbeard at the workshop in Galmair, when you've reached level 20 in smithing, to receive your first reward."
Description[GERMAN][7] = "Need translation"
Description[ENGLISH][7] = "Congratulations! You've received your first reward! Return to Thorgrem Silverbeard at the workshop in Galmair, once you reach level 30 in smithing, to receive your next one!"
Description[GERMAN][8] = "Need translation"
Description[ENGLISH][8] = "Return to Thorgrem Silverbeard at the workshop in Galmair, once you reach level 40 in smithing, to receive your next reward."
Description[GERMAN][9] = "Need translation"
Description[ENGLISH][9] = "Return to Thorgrem Silverbeard at the workshop in Galmair, once you reach level 50 in smithing, to receive your next reward."
Description[GERMAN][10] = "Need translation"
Description[ENGLISH][10] = "Return to Thorgrem Silverbeard at the workshop in Galmair, once you reach level 60 in smithing, to receive your next reward."
Description[GERMAN][11] = "Need translation"
Description[ENGLISH][11] = "Return to Thorgrem Silverbeard at the workshop in Galmair, once you reach level 70 in smithing, to receive your next reward."
Description[GERMAN][12] = "Need translation"
Description[ENGLISH][12] = "Return to Thorgrem Silverbeard at the workshop in Galmair, once you reach level 80 in smithing, to receive your next reward."
Description[GERMAN][13] = "Need translation"
Description[ENGLISH][13] = "Return to Thorgrem Silverbeard at the workshop in Galmair, once you reach level 90 in smithing, to receive your next reward."
Description[GERMAN][14] = "Need translation"
Description[ENGLISH][14] = "Return to Thorgrem Silverbeard at the workshop in Galmair, once you reach level 100 in smithing, to receive your next reward."
Description[GERMAN][15] = "Need translation"
Description[ENGLISH][15] = "You have mastered smithing and received all rewards available."
Description[GERMAN][16] = "Need translation"
Description[ENGLISH][16] = "You have mastered smithing and received all rewards available."





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
QuestTarget[7] = {position(387, 273, 0)} 
QuestTarget[8] = {position(387, 273, 0)} 
QuestTarget[9] = {position(387, 273, 0)} 
QuestTarget[10] = {position(387, 273, 0)} 
QuestTarget[11] = {position(387, 273, 0)} 
QuestTarget[12] = {position(387, 273, 0)} 
QuestTarget[13] = {position(387, 273, 0)} 
QuestTarget[14] = {position(387, 273, 0)}
QuestTarget[15] = {position(387, 273, 0)} 
QuestTarget[16] = {position(387, 273, 0)}  

-- Insert the quest status which is reached at the end of the quest
FINAL_QUEST_STATUS = 16


function QuestTitle(user)
    return base.common.GetNLS(user, Title[GERMAN], Title[ENGLISH])
end

function QuestDescription(user, status)
    local german = Description[GERMAN][status] or ""
    local english = Description[ENGLISH][status] or ""

    return base.common.GetNLS(user, german, english)
end

function QuestStart()
    return Start
end

function QuestTargets(user, status)
    return QuestTarget[status]
end

function QuestFinalStatus()
    return FINAL_QUEST_STATUS
end

function QuestAvailability(user, status)
    if base.factions.isGalmairCitizen(user) and status == 0 then
        return Player.questAvailable
    else
        return Player.questNotAvailable
    end
end

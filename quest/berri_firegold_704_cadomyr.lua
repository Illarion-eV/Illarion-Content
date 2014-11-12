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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (704, 'quest.berri_firegold_704_cadomyr');

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
Description[GERMAN][1] = "Sammel 10 Klumpen Kohle und 10 Brocken Eisenerz und bring diese zu Berri Firegold in der Werkstatt von Cadomyr. Wenn du die Stadt verlässt und nach Süden der Straße folgst, erreichst du den 'Grundstein der Aufrichtigkeit'. Dort kannst du Kohle finden. Wenn du die Stadt verlässt und nach Nordosten gehst, erreichst du den 'Freiheitsbruch'. Dort findest du Eisen- und Kupfererz und manchmal sogar Goldnuggets. Mit der Spitzhacke kannst du das Erz von den Steinen abbauen."
Description[ENGLISH][1] = "Collect 10 lumps of coal and 10 pieces of iron ore and take them to Berri Firegold at the workshop of Cadomyr. If you leave the town and follow the street to the south you will reach the 'Cornerstone of Candour', you can find coal there. If you leave the town and go northeast you will reach the 'Liberty Quarry', you can find iron and copper ore there, and sometimes even gold nuggets. You can get the ore by using the pickaxe when facing the stones." 
Description[GERMAN][2] = "Geh zu Berri Firegold in der Werkstatt von Cadomyr, er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][2] = "Go to Berri Firegold at the workshop in Cadomyr, he is sure to have another task for you."
Description[GERMAN][3] = "Schmilz zehn Eisenbarren für Berri Firegold an der Esse in Cadomyr. Um die Barren herzustellen, musst du die Tiegelzange in die Hand nehmen und die Esse benutzen während du vor ihr stehst."
Description[ENGLISH][3] = "Smelt ten iron ingots for Berri Firegold at the furnace in Cadomyr's workshop. To smelt the ingots you have to take the crucible-pincers in your hand and use the furnace."
Description[GERMAN][4] = "Geh zu Berri Firegold in der Werkstatt von Cadomyr, er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][4] = "Go to Berri Firegold at the workshop in Cadomyr, he is sure to have another task for you."
Description[GERMAN][5] = "Schmiede fünf Nägel und fünf Kelche für Berri Firegold in der Werkstatt von Cadomyr. Für die Nägel musst du den Hammer mit dem gelben Griff benutzen. Für die Kelche nimmst du den Feinschmiedehammer mit dem roten Griff."
Description[ENGLISH][5] = "Smith five pins and five goblets for Berri Firegold at the workshop in Cadomyr. For the pins you have to use the hammer with the yellow handle, for the goblets use the finesmithing hammer with the red handle."
Description[GERMAN][6] = "Du hast alle Aufgaben von Berri Firegold erfüllt."
Description[ENGLISH][6] = "You have fulfilled all the tasks for Berri Firegold."


-- Insert the position of the quest start here (probably the position of an NPC or item)
Start = {141, 582, 0}


-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(141, 582, 0), position(169, 617, 0), position(134, 696, 0)} -- Mines
QuestTarget[2] = {position(141, 582, 0)} 
QuestTarget[3] = {position(141, 582, 0), position(143, 590, 0)} -- Furnace
QuestTarget[4] = {position(141, 582, 0)} 
QuestTarget[5] = {position(141, 582, 0), position(139, 589, 0)} -- anvil
QuestTarget[6] = {position(141, 582, 0)} 

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
    if factions.isCadomyrCitizen(user) and status == 0 then
        return Player.questAvailable
    else
        return Player.questNotAvailable
    end
end

return M

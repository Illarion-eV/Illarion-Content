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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (717, 'quest.nadime_717_runewick');

local common = require("base.common")
local factions = require("base.factions")

local M = {}

local GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
local Title = {}
Title[GERMAN] = "Das Glasblasen in Runewick"
Title[ENGLISH] = "Glass blowing in Runewick"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
local Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Sammel zehn Haufen groben Sand in den Sandgruben außerhalb der Stadt. Sand sammelst du, in dem du Schaufel in die Hand nimmst und sie bei einer Sandgrube benutzt. Geh dann zum Sieb in der Werkstatt und mach daraus Quarzsand und zeig anschließend den Sand Nadime, die du in der Werkstatt von Runewick findest. Benutze hierfür das Sieb, während du die Kelle in der Hand hältst."
Description[ENGLISH][1] = "Collect ten piles of coarse sand at the sand pit found west outside the town. You can collect the coarse sand if you take the shovel in your hand and use it where there is a sand pit. Once you have enough coarse sand, you can use the wooden shovel to sieve the quartz sand. To produce quartz sand take the wooden shovel in your hand and use the sieve whilst standing in front of it."
Description[GERMAN][2] = "Geh zu Nadime in dem Handwerkshaus von Runewick, sie hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][2] = "Go to Nadime in the workshop of Runewick, she is sure to have another task for you."
Description[GERMAN][3] = " Produziere zehn Haufen Asche und bringe sie zu Nadime. Hierfür musst du Holzscheite an einem Feuer verbrennen. Zuerst leg einen Holzscheit auf den Boden, anschließend benutzt du diesen einmal. Daraufhin benutzt du das Feuer, um aus den restlichen Scheiten in deinem Inventar Asche herzustellen."
Description[ENGLISH][3] = "Produce ten piles ash and bring them to Nadime. Place one wooden log on the ground, then use it. Once the fire is lit, wait for the fire to turn the remaining logs in your inventory to ash."
Description[GERMAN][4] = "Geh zu Nadime in dem Handwerkshaus von Runewick, sie hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][4] = "Go to Nadime in the workshop of Runewick, she is sure to have another task for you."
Description[GERMAN][5] = "Stell zehn Glasblöcke für Nadime in der Werkstatt von Runewick her. Um Glasblöcke herzustellen, brauchst du Quarzsand und Asche. Gehe zum Glasschmelzofen und nimm das Glasblasrohr in die Hand. Benutze den Ofen, um Glasblöcke herzustellen." 
Description[ENGLISH][5] = "Produce ten glass ingots for Nadime in the workshop of Runewick. To produce glass ingots you need quartz sand and ash. Go to the glass melting oven, take the glass blow pipe in your hand and use the oven."
Description[GERMAN][6] = "Geh zu Nadime in dem Handwerkshaus von Runewick, sie hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][6] = "Go to Nadime in the workshop of Runewick, she is sure to have another task for you."
Description[GERMAN][7] = "Stell fünf leere Saftflaschen mit den Glasblöcken für Nadime her und zeig ihr die Flaschen. Um die Flaschen herzustellen, nimmst du das Glasblasrohr in die Hand und benutzt dieses, während du vor dem Glasschmelzofen stehst."
Description[ENGLISH][7] = "Produce five empty juice bottles from glass ingots using the glass blow pipe at the glass melting oven and show them to Nadime. To produce the bottles go to the glass melting oven, take the glass blow pipe in your hand and then use it."
Description[GERMAN][8] = "Du hast alle Aufgaben von Nadime erfüllt."
Description[ENGLISH][8] = "You have fulfilled all the tasks for Nadime."


-- Insert the position of the quest start here (probably the position of an NPC or item)
local Start = {949, 822, 0}


-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
local QuestTarget = {}
QuestTarget[1] = {position(949, 822, 0), position(744, 829, 0), position(946, 821, 0)} -- Sand Pit
QuestTarget[2] = {position(949, 822, 0)} 
QuestTarget[3] = {position(949, 822, 0)} -- 
QuestTarget[4] = {position(949, 822, 0)} 
QuestTarget[5] = {position(949, 822, 0), position(952, 821, 0)} -- Glass melting oven
QuestTarget[6] = {position(949, 822, 0)} 
QuestTarget[7] = {position(949, 822, 0), position(952, 821, 0)} -- Glass melting oven
QuestTarget[8] = {position(949, 822, 0)} 


-- Insert the quest status which is reached at the end of the quest
local FINAL_QUEST_STATUS = 8


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
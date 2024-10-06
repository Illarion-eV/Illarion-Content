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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (718, 'quest.alwin_sommerkorn_718_runewick');

local common = require("base.common")
local factions = require("base.factions")
local M = {}

local GERMAN = Player.german
local ENGLISH = Player.english

-- Insert the quest title here, in both languages
local Title = {}
Title[GERMAN] = "Entspanntes Fischen in Runewick"
Title[ENGLISH] = "Relaxed fishing in Runewick"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
local Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Besorge zehn Forellen und bringe sie Alwin Sommerkorn. Stelle dich ans Wasser an einem Fischschwarm und benutze die Angel um Fische zu fangen."
Description[ENGLISH][1] = "Obtain ten trout and take them back to Alwin Sommerkorn. To fish, place yourself next to a shoal and use a fishing rod."
Description[GERMAN][2] = "Geh zu Alwin Sommerkorn, der sich im Eibenthal aufh�lt. Er hat bestimmt noch eine Aufgabe f�r dich."
Description[ENGLISH][2] = "Go back to Alwin Sommerkorn in Yewdale, he will certainly have another task for you."
Description[GERMAN][3] = "Besorge zehn Lachse und bringe sie Alwin Sommerkorn. Er hat dir von einer Insel s�dlich von Runewicks Feldern erz�hlt, wo die Lachse gut bei�en. Stelle dich ans Wasser an einem Fischschwarm und benutze die Angel um Fische zu fangen."
Description[ENGLISH][3] = "Obtain ten salmon and take them back to Alwin Sommerkorn. He told you about an island full of salmon that is past the forest just south of Runewick's fields. To fish, place yourself next to a shoal and use a fishing rod."
Description[GERMAN][4] = "Geh zu Alwin Sommerkorn, der sich im Eibenthal aufh�lt. Er hat bestimmt noch eine Aufgabe f�r dich."
Description[ENGLISH][4] = "Go back to Alwin Sommerkorn in Yewdale, he will certainly have another task for you."
Description[GERMAN][5] = "Besorge f�nf ger�ucherte Lachse und bringe sie Alwin Sommerkorn. Stelle dich vor eine R�ucherh�tte und benutze diese."
Description[ENGLISH][5] = "Obtain five smoked salmons and take them back to Alwin Sommerkorn. Stand in front of a smoke oven and use it to cook raw fish."
Description[GERMAN][6] = "Geh zu Alwin Sommerkorn, der sich im Eibenthal aufh�lt. Er hat bestimmt noch eine Aufgabe f�r dich."
Description[ENGLISH][6] = "Go back to Alwin Sommerkorn in Yewdale, he will certainly have another task for you."
Description[GERMAN][7] = "Besorge zehn Spulen Garn und bringe sie Alwin Sommerkorn. Du kannst Garn beim H�ndler kaufen oder du kannst sie aus Wolle an einem Spinnrad herstellen."
Description[ENGLISH][7] = "Obtain ten spools of thread and take them back to Alwin Sommerkorn. You can buy thread from a merchant or produce it with a spinning wheel from wool."
Description[GERMAN][8] = "Du hast alle Aufgaben von Alwin Sommerkorn erf�llt. "
Description[ENGLISH][8] = "You have fulfilled all the tasks for Alwin Sommerkorn."

-- Insert the position of the quest start here (probably the position of an NPC or item)
local Start = {824, 840, 0}


-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
local QuestTarget = {}
QuestTarget[1] = {position(821, 842, 0), position(824, 840, 0)} -- Trout shoal, Alwin
QuestTarget[2] = {position(824, 840, 0)} -- Return to Alwin
QuestTarget[3] = {position(901, 932, 0), position(824, 840, 0)} -- Salmon shoal, Alwin
QuestTarget[4] = {position(824, 840, 0)} -- Return to Alwin
QuestTarget[5] = {position(963, 839, 0), position(824, 840, 0)} -- smoke oven, Alwin
QuestTarget[6] = {position(824, 840, 0)} -- Return to Alwin
QuestTarget[7] = {position(952, 835, 0), position(948, 816, 0), position(824, 840, 0)} -- Tailoring merchant, spinning wheel, Alwin
QuestTarget[8] = {position(824, 840, 0)} -- Return to Alwin

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

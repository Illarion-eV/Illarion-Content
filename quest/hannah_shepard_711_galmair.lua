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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (711, 'quest.hannah_shepard_711_galmair');

local common = require("base.common")
local factions = require("base.factions")
local M = {}

local GERMAN = Player.german
local ENGLISH = Player.english

-- Insert the quest title here, in both languages
local Title = {}
Title[GERMAN] = "Der Ackerbau und das Kochen"
Title[ENGLISH] = "Farming and cooking"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
local Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Sammel zehn Getreideb�ndel f�r Hannah Shepard bei den Feldern von Galmair. Um Getreideb�ndel zu kriegen, musst du das Getreide von Hannah auf den Feldern s�en. Dazu benutzt du das Getreide, w�hrend du auf dem Feld stehst. Anschlie�end musst du warten, bis es reif ist. Sobald es reif ist, nimmst du die Sense in die Hand und benutzt diese, um das Getreide zu Getreideb�ndeln zu schneiden."
Description[ENGLISH][1] = "Collect ten bundles of grain for Hannah Shepard at the fields outside Galmair. To get the bundles of grain you have to seed the grain which Hannah gave you on the fields. To do this just hold the grain in your hand and use it whilst standing on the field. Once the crop is ready, harvest the ripened grain using the scythe you got from Hannah."
Description[GERMAN][2] = "Geh zu Hannah Shepard bei den Feldern von Galmair. Sie hat bestimmt noch eine Aufgabe f�r dich."
Description[ENGLISH][2] = "Go back to Hannah Shepard at the fields outside Galmair, she is sure to have another task for you."
Description[GERMAN][3] = "Produzier f�nf S�cke Mehl f�r Hannah Shepard, bei den Feldern von Galmair. Um Mehl zu produzieren, musst du die Getreideb�ndel, mit dem Dreschflegel in der Hand, zu Getreide schlagen. Hast du erst einmal Getreide, musst du zum M�hlstein von Galmair. Der M�hlstein gleich im ersten Raum auf der rechten Seite. Dort angekommen, benutzt du den M�hlstein, mit der Holzkelle in der Hand, und machst aus dem Getreide Mehl."
Description[ENGLISH][3] = "Produce five sacks of flour for Hannah Shepard at the fields outside Galmair. To produce flour you have to use the flail in your hand to thresh the bundles of grain in your inventory. Once you've produced grain from the bundles of grain go to the millstone in Galmair. The millstone can be found in the first room at the right-hand side. To make flour you have to take the wooden shovel in your hand and use the millstone."
Description[GERMAN][4] = "Geh zu Hannah Shepard bei den Feldern von Galmair. Sie hat bestimmt noch eine Aufgabe f�r dich."
Description[ENGLISH][4] = "Go back to Hannah Shepard at the fields outside Galmair, she is sure to have another task for you."
Description[GERMAN][5] = "Back f�nf Br�tchen f�r Hannah Shepard, bei den Feldern von Galmair. Um Br�tchen zu backen, brauchst du Eimer mit Wasser und Mehl. Im Galmair ist ein Backofen. Dort nimmst du den Backofenschieber in die Hand und benutzt ihn vor dem Backofen, um Br�tchen herzustellen."
Description[ENGLISH][5] = "Bake five bread rolls for Hannah Shepard at the fields outside Galmair. To bake bread rolls you need buckets of water and flour. In Galmair there is a baking oven. Once you find it, take the peel Hannah gave you in your hand and use it whilst standing in front of the baking oven."
Description[GERMAN][6] = "Geh zu Hannah Shepard bei den Feldern von Galmair. Sie hat bestimmt noch eine Aufgabe f�r dich."
Description[ENGLISH][6] = "Go back to Hannah Shepard at the fields outside Galmair, she is sure to have another task for you."
Description[GERMAN][7] = "Koch f�r Hannah Shepard, bei den Feldern von Galmair, im Kessel vor ihr, f�nf W�rstchen. Um W�rstchen herzustellen, brauchst du Schweinefleisch und Eingeweide. Beides findest du, wenn du Schweine erlegst. Mit den Zutaten die ich dir gegeben hab, musst du anschlie�end den Kochl�ffel in die Hand nehmen und diesen benutzen, w�hrend du vor dem Kessel stehst."
Description[ENGLISH][7] = "Cook five sausages for Hannah Shepard at the fields outside Galmair at the kettle in front of her. To produce sausages you need pork and entrails, both can be obtained if you kill pigs. With the ingredients you got from me, you have to take the cooking spoon in your hand now and use it whilst standing in front of a kettle."
Description[GERMAN][8] = "Du hast alle Aufgaben von Hannah Shepard erf�llt."
Description[ENGLISH][8] = "You have fulfilled all the tasks for Hannah Shepard."


-- Insert the position of the quest start here (probably the position of an NPC or item)
Start = {434, 257, 0}


-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
local QuestTarget = {}
QuestTarget[1] = {position(434, 257, 0), position(430, 261, 0)} -- Fields
QuestTarget[2] = {position(434, 257, 0)} 
QuestTarget[3] = {position(434, 257, 0), position(384, 230, 0)} -- Millstone
QuestTarget[4] = {position(434, 257, 0)} 
QuestTarget[5] = {position(434, 257, 0), position(387, 224, 0)} -- Baking oven
QuestTarget[6] = {position(434, 257, 0)} 
QuestTarget[7] = {position(434, 257, 0), position(433, 257, 0)} -- Camp fire
QuestTarget[8] = {position(434, 257, 0)} 

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
    if factions.isGalmairCitizen(user) and status == 0 then
        return Player.questAvailable
    else
        return Player.questNotAvailable
    end
end

return M

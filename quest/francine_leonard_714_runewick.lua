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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (714, 'quest.francine_leonard_714_runewick');

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

Description[GERMAN][1] = "Sammel zehn Getreidebündel für Francine Leonard in der Küche auf der Insel der Luft. Um Getreidebündel zu kriegen, musst du das Getreide von Francine auf den Feldern außerhalb der Stadt säen. Dazu benutzt du das Getreide, während du auf dem Feld stehst. Anschließend musst du warten, bis es reif ist. Sobald es reif ist, nimmst du die Sense in die Hand und benutzt diese um das Getreide zu Getreidebündeln zu schneiden."
Description[ENGLISH][1] = "Collect ten bundles of grain for Francine Leonard in the kitchen of the crafts house. To get the bundles of grain you have to seed the grain which Francine gave you on the fields outside the city. To do this just hold the grain in your hand and use it, whilst standing on the field. Once the crop is ready, harvest the ripened grain by holding the scythe you got from Francine in your hand and using it."
Description[GERMAN][2] = "Geh zu Francine Leonard, die sich in der Küche auf der Insel der Luft aufhält. Sie hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][2] = "Go back to Francine Leonard in the kitchen of the crafts house, she is sure to have another task for you."
Description[GERMAN][3] = "Produzier fünf Säcke Mehl für Francine Leonard in der Küche auf der Insel der Luft. Um Mehl zu produzieren, musst du die Getreidebündel mit dem Dreschflegel in der Hand zu Getreide schlagen. Hast du erst einmal Getreide, musst du zum Mühlstein vor der Küche. Anschließend benutzt du den Mühlstein mit der Holzkelle in der Hand und machst aus dem Getreide Mehl."
Description[ENGLISH][3] = "Produce five sacks of flour for Francine Leonard in the kitchen of the crafts house. To produce flour you have to use the flail in your hand with the bundles of grain in your inventory. Once you've produced grain from the bundles of grain, go to the millstone in front of the kitchen. To make flour you have to take the wooden shovel in your hand and use the millstone."
Description[GERMAN][4] = "Geh zu Francine Leonard, die sich in der Küche auf der Insel der Luft aufhält. Sie hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][4] = "Go back to Francine Leonard in the kitchen of the crafts house, she is sure to have another task for you."
Description[GERMAN][5] = "Back fünf Brötchen für Francine Leonard, die sich in der Küche auf der Insel der Luft aufhält. Um Brötchen zu backen, brauchst du Eimer mit Wasser und Mehl. Geh zum Backofen, nimm den Backofenschieber in die Hand und benutz den Backofen anschließend, um Brötchen zu backen."
Description[ENGLISH][5] = "Bake five bread rolls for Francine Leonard in the kitchen of the crafts house. To bake bread rolls you need buckets of water and flour. Go to the baking oven and use the peel in your hand whilst standing in front of the baking oven to bake the bread rolls."
Description[GERMAN][6] = "Geh zu Francine Leonard, die sich in der Küche auf der Insel der Luft aufhält. Sie hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][6] = "Go back to Francine Leonard in the kitchen of the crafts house, she is sure to have another task for you."
Description[GERMAN][7] = "Koch für Francine Leonard im Kessel neben ihr fünf Würstchen. Um Würstchen herzustellen, brauchst du Schweinefleisch und Eingeweide. Beides findest du, wenn du Schweine erlegst. Mit den Zutaten die ich dir gegeben hab, musst du anschließend den Kochlöffel in die Hand nehmen und diesen benutzen, während du vor dem Kessel stehst."
Description[ENGLISH][7] = "Cook five sausages for Francine Leonard at the kettle next her. To produce sausages you need pork and entrails, both can be obtained if you kill pigs. With the ingredients you got from me, you have to take the cooking spoon in your hand and use it while standing in front of the kettle."
Description[GERMAN][8] = "Du hast alle Aufgaben von Francine Leonard erfüllt."
Description[ENGLISH][8] = "You have fulfilled all the tasks for Francine Leonard."


-- Insert the position of the quest start here (probably the position of an NPC or item)
local Start = {959, 842, 0}

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
local QuestTarget = {}
QuestTarget[1] = {position(959, 842, 0), position(858, 832, 0)} -- Fields
QuestTarget[2] = {position(959, 842, 0)} 
QuestTarget[3] = {position(959, 842, 0), position(951, 842, 0)} -- Millstone
QuestTarget[4] = {position(959, 842, 0)} 
QuestTarget[5] = {position(959, 842, 0), position(963, 837, 0)} -- Baking oven
QuestTarget[6] = {position(959, 842, 0)} 
QuestTarget[7] = {position(959, 842, 0), position(960, 838, 0)} -- Camp fire
QuestTarget[8] = {position(959, 842, 0)}

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

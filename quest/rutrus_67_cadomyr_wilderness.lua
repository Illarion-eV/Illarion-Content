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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (67, 'quest.rutrus_67_cadomyr_wilderness');

local common = require("base.common")
local M = {}

local GERMAN = Player.german
local ENGLISH = Player.english

-- Insert the quest title here, in both languages
local Title = {}
Title[GERMAN] = "Sternenoase"
Title[ENGLISH] = "Oasis of Stars"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
local Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Sammel zehnmal groben Sand und bringe diese Rutrus. Nimm die Schaufel in die Hand und benutzte sie, während du vor einem Stein im Sand stehst."
Description[ENGLISH][1] = "Collect ten coarse sand and bring them back to Rutrus. Use the shovel in your hand, while standing in front of a stone in the desert."
Description[GERMAN][2] = "Geh zu Rutrus in der Sternenoase. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][2] = "Go back to Rutrus in the Oasis of Stars, he certainly has another task for you."
Description[GERMAN][3] = "Sammel zwanzigmal Quarzsand und bringe diesen Rutrus. Siebe groben Sand um Quarzsand herzustellen. Nimm eine Holzkelle in die Hand und benutzte sie, während du vor einem Sieb stehst."
Description[ENGLISH][3] = "Produce twenty quartz sand and bring them back to Rutrus. In order to produce quartz sand stand in front of a sieve with coarse sand in your inventory. Then use a wooden shovel in your hand."
Description[GERMAN][4] = "Geh zu Rutrus in der Sternenoase. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][4] = "Go back to Rutrus in the Oasis of Stars, he certainly has another task for you."
Description[GERMAN][5] = "Sammel fünf ungeschliffene Topase und bringe diese Rutrus. Du kannst sie entweder beim Händler kaufen oder in der Mine finden. Nimm hierfür eine Spitzhacke in die Hand und benutzte sie, während du vor einem Stein stehst."
Description[ENGLISH][5] = "Collect five raw topaz and bring them back to Rutrus. You can buy them from a merchant or find them in a mine. Use the pick-axe in your hand, while standing in front of a stone to start mining."
Description[GERMAN][6] = "Geh zu Rutrus in der Sternenoase. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][6] = "Go back to Rutrus in the Oasis of Stars, he certainly has another task for you."
Description[GERMAN][7] = "Besorge zehn Kohleklumpen und bringe sie Rutrus. Du kannst Kohle entweder beim Händler kaufen oder in der Mine finden. Nimm hierfür eine Spitzhacke in die Hand und benutzte sie, während du vor einem Stein stehst."
Description[ENGLISH][7] = "Produce ten lumps of coal and bring them to Rutrus. You can buy coal from a merchant or find it in a mine. Use the pick-axe in your hand, while standing in front of a stone to start mining."
Description[GERMAN][8] = "Du hast alle Aufgaben von Rutrus erfüllt."
Description[ENGLISH][8] = "You have fulfilled all the tasks for Rutrus."


-- Insert the position of the quest start here (probably the position of an NPC or item)
Start = {359, 678, 0}


-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
local QuestTarget = {}
QuestTarget[1] = {position(359, 678, 0), position(352, 678, 0)} -- stone
QuestTarget[2] = {position(359, 678, 0)} 
QuestTarget[3] = {position(359, 678, 0), position(143, 592, 0)} -- sieve
QuestTarget[4] = {position(359, 678, 0)} 
QuestTarget[5] = {position(359, 678, 0), position(133, 589, 0), position(169, 607, 0)} -- händler mine
QuestTarget[6] = {position(359, 678, 0)} 
QuestTarget[7] = {position(359, 678, 0), position(133, 589, 0), position(143, 689, 0)} -- händler mine
QuestTarget[8] = {position(359, 678, 0)} 

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

return M

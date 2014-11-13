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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (126, 'quest.linda_rabon_126_cadomyr');

local common = require("base.common")
local M = {}

local GERMAN = Player.german
local ENGLISH = Player.english

-- Insert the quest title here, in both languages
local Title = {}
Title[GERMAN] = "Eine edle Feier"
Title[ENGLISH] = "A Noble Celebration"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
local Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Besorge fünf Gedecke Besteck und bringe sie Linda. Du kannst sie bei einem Händler kaufen oder als Goldschmied am Amboss herstellen. Dazu nimmst du den Feinschmiedhammer in die Hand und benutzt ihn, während du vor einem Amboss stehst."
Description[ENGLISH][1] = "Obtain five sets of cutlery and bring them to Linda. You can buy them from a merchant or if you are a goldsmith, make them on an anvil. To do this just stand in front of an anvil and use a fine smithing hammer in your hand."
Description[GERMAN][2] = "Geh zu Linda Rabon, die sich im Einhörnigen Löwen in Cadomyr aufhält. Sie hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][2] = "Go back to Linda Rabon at the Unicorn Lion in Cadomyr, she certainly has another task for you."
Description[GERMAN][3] = "Besorge fünf Weingläser und bringe sie Linda. Du kannst sie bei einem Händler kaufen."
Description[ENGLISH][3] = "Collect five wine glasses and bring them to Linda. You can buy them from a merchant or if you are a glassblower, just take your glass pipe, stand in front of a furnace, and then use your glass pipe inhand to make them yourself!"
Description[GERMAN][4] = "Geh zu Linda Rabon, die sich im Einhörnigen Löwen in Cadomyr aufhält. Sie hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][4] = "Go back to Linda Rabon at the Unicorn Lion in Cadomyr, she certainly has another task for you."
Description[GERMAN][5] = "Besorge fünf Holzteller und bringe sie Linda. Du kannst sie bei einem Händler kaufen oder als Schreiner an einer Werkbank anfertigen."
Description[ENGLISH][5] = "Get five wooden plates and bring them to Linda. You can buy them from a merchant or go to a workbench with a slicer inhand to make your own."
Description[GERMAN][6] = "Du hast alle Aufgaben von Linda Rabon erfüllt."
Description[ENGLISH][6] = "You have fulfilled all the tasks for Linda Rabon."


-- Insert the position of the quest start here (probably the position of an NPC or item)
Start = {116, 576, 0}


-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
local QuestTarget = {}
QuestTarget[1] = {position(116, 576, 0), position(121, 599, 0), position(138, 589, 0)} -- Händler,Amboss
QuestTarget[2] = {position(116, 576, 0)} 
QuestTarget[3] = {position(116, 576, 0), position(125, 603, 0)} -- Jonathan Cyrus
QuestTarget[4] = {position(116, 576, 0)} 
QuestTarget[5] = {position(116, 576, 0), position(113, 574, 0)} -- Händler
QuestTarget[6] = {position(116, 576, 0)} 

-- Insert the quest status which is reached at the end of the quest
local FINAL_QUEST_STATUS = 6


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

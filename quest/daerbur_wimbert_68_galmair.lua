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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (68, 'quest.daerbur_wimbert_68_galmair');

local common = require("base.common")
local M = {}

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Dunkellochmine"
Title[ENGLISH] = "Dark Hole Mine"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Sammel zehn rohe Steine und bringe diese Daerbur. Du kannst rohe Steine entweder beim Händler kaufen oder in der Mine finden. Nimm hierfür eine Spitzhacke in die Hand und benutzte sie, während du vor einem Stein stehst."
Description[ENGLISH][1] = "Collect ten raw stones and bring them to Daerbur. You can buy raw stones from a merchant or find them in a mine. Use a pickaxe inhand while standing in front of a mineable rock."
Description[GERMAN][2] = "Geh zu Daerbur Wimbert in der Dunkellochmine bei Galmair. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][2] = "Go back to Daerbur Wimbert in the Dark Hole Mine near Galmair, he certainly has another task for you."
Description[GERMAN][3] = "Sammel zwanzig Brocken Kohle und bringe diese Daerbur. Du kannst Kohle entweder beim Händler kaufen oder in der Mine finden. Nimm hierfür eine Spitzhacke in die Hand und benutzte sie, während du vor einem Stein stehst."
Description[ENGLISH][3] = "Collect twenty pieces of coal and bring them to Daerbur. You can buy coal ore from a merchant or find them in a mine. Use a pickaxe inhand while standing in front of a mineable rock."
Description[GERMAN][4] = "Geh zu Daerbur Wimbert in der Dunkellochmine bei Galmair. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][4] = "Go back to Daerbur Wimbert in the Dark Hole Mine near Galmair, he certainly has another task for you."
Description[GERMAN][5] = "Sammel fünf ungeschliffene Obsidiane und bringe diese Daerbur. Nimm hierfür eine Spitzhacke in die Hand und benutzt sie, während du vor einem Stein stehst."
Description[ENGLISH][5] = "Collect five raw obsidian gems and bring them back to Daerbur. Use a pickaxe inhand while standing in front of a mineable rock."
Description[GERMAN][6] = "Geh zu Daerbur Wimbert in der Dunkellochmine bei Galmair. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][6] = "Go back to Daerbur Wimbert in the Dark Hole Mine near Galmair, he certainly has another task for you."
Description[GERMAN][7] = "Sammel zehn Nadelholzstämme und bringe diese Daerbur. Du kannst sie entweder beim Händler kaufen oder selbst einen Baum fällen. Dazu nimmst du ein Beil in die Hand und benutzt es, während du vor einem Nadelbaum stehst."
Description[ENGLISH][7] = "Collect ten logs of conifer wood and bring them to Daerbur. You can buy them from a merchant or chop a tree down. Use a hatchet in your hand whilst standing in front of a conifer tree."
Description[GERMAN][8] = "Du hast alle Aufgaben von Daerbur erfüllt."
Description[ENGLISH][8] = "You have fulfilled all the tasks for Daerbur."


-- Insert the position of the quest start here (probably the position of an NPC or item)
Start = {392, 160, -3}


-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(392, 160, -3), position(366, 275, 0), position(395, 160, -3)} 
QuestTarget[2] = {position(392, 160, -3)} 
QuestTarget[3] = {position(392, 160, -3), position(366, 275, 0), position(395, 160, -3)} 
QuestTarget[4] = {position(392, 160, -3)} 
QuestTarget[5] = {position(392, 160, -3), position(395, 160, -3)} 
QuestTarget[6] = {position(392, 160, -3)} 
QuestTarget[7] = {position(392, 160, -3), position(367, 277, 0), position(415, 148, 0)} 
QuestTarget[8] = {position(392, 160, -3)} 

-- Insert the quest status which is reached at the end of the quest
FINAL_QUEST_STATUS = 8


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

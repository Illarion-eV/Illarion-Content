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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (65, 'quest.bruno_blackhole_65_galmair');

local common = require("base.common")
local factions = require("base.factions")
module("quest.bruno_blackhole_65_galmair", package.seeall)

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Malachitmine"
Title[ENGLISH] = "Malachite Mine"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Sammel zehn rohe Steine und bringe diese Bruno. Du kannst rohe Steine entweder beim Händler kaufen oder in der Mine finden. Nimm hierfür eine Spitzhacke in die Hand und benutzte sie, während du vor einem Stein stehst."
Description[ENGLISH][1] = "Collect ten raw stones and bring them to Bruno. You can buy raw stones from a merchant or find them in a mine. Just position yourself in front of a stone and use your pickaxe inhand."
Description[GERMAN][2] = "Geh zu Bruno Blackhole in der Malachitmine bei Galmair. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][2] = "Go back to Bruno Blackhole in the Malachite Mine near Galmair, he certainly has another task for you."
Description[GERMAN][3] = "Sammel zwanzig Brocken Kupfererz und bringe diese Bruno. Du kannst Kupfererz entweder beim Händler kaufen oder in der Mine finden. Nimm hierfür eine Spitzhacke in die Hand und benutzte sie, während du vor einem Stein stehst."
Description[ENGLISH][3] = "Collect twenty pieces of copper ore and bring them to Bruno. You can buy copper ore from a merchant or find them in a mine. Just position yourself in front of a stone and use your pickaxe inhand."
Description[GERMAN][4] = "Geh zu Bruno Blackhole in der Malachitmine bei Galmair. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][4] = "Go back to Bruno Blackhole in the Malachite Mine near Galmair, he certainly has another task for you."
Description[GERMAN][5] = "Sammel fünf Goldnuggets und bringe diese Bruno. Du kannst sie entweder beim Händler kaufen oder in der Mine finden. Nimm hierfür eine Spitzhacke in die Hand und benutzte sie, während du vor einem Stein stehst."
Description[ENGLISH][5] = "Collect five gold nuggets and bring them back to Bruno. You can buy them from a merchant or find them in a mine. Just position yourself in front of a stone and use your pickaxe inhand."
Description[GERMAN][6] = "Geh zu Bruno Blackhole in der Malachitmine bei Galmair. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][6] = "Go back to Bruno Blackhole in the Malachite Mine near Galmair, he certainly has another task for you."
Description[GERMAN][7] = "Sammel zehnmal Jungfernkraut und bringe dieses Bruno. Nimm eine Sichel in die Hand und benutzt sie, während du vor eine Blume stehst, die auf Steinboden wächst. Du kannst auch Raban, den Kräuterkundigen, um Hilfe fragen."
Description[ENGLISH][7] = "Collect ten virgin weeds and bring them to Bruno. Use the sickle in your hand, while standing in front of a flower on stony ground. You can ask Raban, the herbalist, if you need help."
Description[GERMAN][8] = "Du hast alle Aufgaben von Bruno erfüllt."
Description[ENGLISH][8] = "You have fulfilled all of Brunon's tasks."

-- Insert the position of the quest start here (probably the position of an NPC or item)
Start = {439, 359, 0}

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(439, 359, 0), position(366, 275, 0), position(435, 359, 0)} 
QuestTarget[2] = {position(439, 359, 0)} 
QuestTarget[3] = {position(439, 359, 0), position(366, 275, 0), position(436, 360, 0)} 
QuestTarget[4] = {position(439, 359, 0)} 
QuestTarget[5] = {position(439, 359, 0), position(366, 275, 0), position(435, 359, 0)} 
QuestTarget[6] = {position(439, 359, 0)} 
QuestTarget[7] = {position(439, 359, 0), position(819, 104, 0), position(380, 292, 0)} -- Raban
QuestTarget[8] = {position(439, 359, 0)} 

-- Insert the quest status which is reached at the end of the quest
FINAL_QUEST_STATUS = 8


function QuestTitle(user)
    return common.GetNLS(user, Title[GERMAN], Title[ENGLISH])
end

function QuestDescription(user, status)
    local german = Description[GERMAN][status] or ""
    local english = Description[ENGLISH][status] or ""

    return common.GetNLS(user, german, english)
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
    if factions.isGalmairCitizen(user) and status == 0 then
        return Player.questAvailable
    else
        return Player.questNotAvailable
    end
end
